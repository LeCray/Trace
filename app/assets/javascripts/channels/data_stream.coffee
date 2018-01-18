App.room = App.cable.subscriptions.create "DataStreamChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log "connected"

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
      #alert("Engine RPM: " + data.ENGINE_RPM.cmdResult + "\nSpeed: " + data.SPEED.cmdResult) 

      document.getElementById("car_rpm").innerHTML = "Engine RPM: " + data.ENGINE_RPM.cmdResult
      document.getElementById("car_speed").innerHTML = "Speed: " + data.SPEED.cmdResult
      console.log "Recieved is running"

      
      
      


  


