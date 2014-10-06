# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  provider               :string(255)
#  uid                    :string(255)
#  first_name             :string(255)
#  last_name              :string(255)
#  nickname               :string(255)
#  facebook_profile       :string(255)
#  usingFbProfile         :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook]


  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.facebook_profile = auth.info.image
      user.nickname = user.full_name if user.nickname.nil?
    end
  end

  def full_name
    if contains_cjk?(self.first_name) || contains_cjk?(self.last_name)
      [self.last_name, self.first_name].join(' ').titleize
    else
      [self.first_name, self.last_name].join(' ').titleize
    end

  end

  def image
    if usingFbProfile
      facebook_profile
    else
      Identicon.data_url_for email
    end
  end
  private

  def contains_cjk? string
    !!(string =~ /\p{Han}|\p{Katakana}|\p{Hiragana}|\p{Hangul}/)
  end

end
