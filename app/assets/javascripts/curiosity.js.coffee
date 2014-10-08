CheckForm = () ->
  unless $('#curiosity_title').val()
    $('#validationMessege').html 'Please enter title!'
    return false

  unless $('#curiosity_description').val()
    $('#validationMessege').html('Please enter description!')
    return false

  ga('send', 'Curiosity', 'button', 'click', 'submit-curiosity-successfully', 1)
  return true

ShareViaFacebook = () ->
  FB.ui(
    method: 'share'
    href: 'http://www.linknowledge.com/curiosities/gon.curiosity.id' + gon.curiosity.id
    ,(response) ->
      if response && !response.error_code
        alert('Sharing completed.')
        $.ajax(
          '/curiosities/' + gon.curiosity.id + '.json',
          type: 'PUT'
          data: 
            curiosity:
              shared: true
        )
  )

$(document).ready ->
  $('#browse-CTA').click ->
    ga('send', 'Curiosity', 'button', 'click', 'browse-CTA', 1)

  $('#share-CTA').click ->
    ga('send', 'Curiosity', 'button', 'click', 'share-CTA', 1)

  $('#subscribe').click ->
    ga('send', 'Curiosity', 'button', 'click', 'subscribe', 1)

  $('#submit-curiosity').click ->
    ga('send', 'Curiosity', 'button', 'click', 'submit-curiosity', 1)
    CheckForm()

  #share
  $('#spread-via-fb').click ->
    ShareViaFacebook()
    ga('send', 'Curiosity', 'button', 'click', 'spread via fb', 1)

  $('#back-to-home').click ->
    ga('send', 'Curiosity', 'button', 'click', 'back to home in sharing page', 1)
