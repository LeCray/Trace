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

      document.getElementById("engine_runtime").innerHTML = "Engine Runtime: " + data.ENGINE_RUNTIME.cmdResult
      document.getElementById("fuel_level").innerHTML = "Fuel Level: " + data.FUEL_LEVEL.cmdResult

      document.getElementById("fuel_consumption_rate").innerHTML = "Fuel Consumption Rate: " + data.FUEL_CONSUMPTION_RATE.cmdResult
      document.getElementById("throttle_pos").innerHTML = "Throttle Position: " + data.THROTTLE_POS.cmdResult

      document.getElementById("air_fuel_ratio").innerHTML = "Air/Fuel Ratio: " + data.AIR_FUEL_RATIO.cmdResult
      document.getElementById("engine_oil_temp").innerHTML = "Engine Oil Temp: " + data.ENGINE_OIL_TEMP.cmdResult

      document.getElementById("air_intake_temp").innerHTML = "Air Intake Temp: " + data.AIR_INTAKE_TEMP.cmdResult
      document.getElementById("dtc_number").innerHTML = "Diagnostic Trouble Code: " + data.DTC_NUMBER.cmdResult

      console.log "Recieved is running"

      
                 
      
      


  


