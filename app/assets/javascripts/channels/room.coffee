App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log "connected"

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    unless data.content.blank?
      $('#messages-table').append '<div>' + data.username + ": " + data.content + '</div>'
      

 $(document).on 'turbolinks:load', ->
  submit_message()


submit_message = ->
  $('#message_content').on 'keydown', (event) ->
    if event.keyCode is 13
      $('input').click()
      event.target.value = ""
      event.preventDefault()	

