class CuriositiesController < ApplicationController
  before_action :set_curiosity, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create]

  # GET /curiosities
  # GET /curiosities.json
  def index
    @curiosities = Curiosity.all
  end

  # GET /curiosities/1
  # GET /curiosities/1.json
  def show
    @curiosity = Curiosity.find params[:id]
  end

  # GET /curiosities/new
  def new
    @curiosity = Curiosity.new
    @curiosities = Curiosity.last 1
  end

  def share
    @curiosity = Curiosity.find params[:curiosity_id]
  end

  # GET /curiosities/1/edit
  def edit
  end

  # POST /curiosities
  # POST /curiosities.json
  def create
    @curiosity = Curiosity.new(curiosity_params)
    @curiosity.user = current_user

    respond_to do |format|
      if @curiosity.save
        format.html { redirect_to curiosity_share_path(@curiosity), notice: 'Curiosity was successfully created.' }
        format.json { render :show, status: :created, location: @curiosity }
      else
        format.html { render :new }
        format.json { render json: @curiosity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /curiosities/1
  # PATCH/PUT /curiosities/1.json
  def update
    respond_to do |format|
      if @curiosity.update(curiosity_params)
        format.html { redirect_to @curiosity, notice: 'Curiosity was successfully updated.' }
        format.json { render :show, status: :ok, location: @curiosity }
      else
        format.html { render :edit }
        format.json { render json: @curiosity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /curiosities/1
  # DELETE /curiosities/1.json
  def destroy
    @curiosity.destroy
    respond_to do |format|
      format.html { redirect_to curiosities_url, notice: 'Curiosity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_curiosity
      @curiosity = Curiosity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def curiosity_params
      params.require(:curiosity).permit(:title, :description)
    end
end
