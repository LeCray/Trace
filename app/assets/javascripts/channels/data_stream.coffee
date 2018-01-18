App.room = App.cable.subscriptions.create "DataStreamChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log "Data Stream is connected"

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
      #alert("Engine RPM: " + data.ENGINE_RPM.cmdResult + "\nSpeed: " + data.SPEED.cmdResult) 
      if data.ENGINE_RPM isnt null 
        document.getElementById("car_rpm").innerHTML = "Engine RPM: " + data.ENGINE_RPM.cmdResult
      
      if data.SPEED isnt null 
        document.getElementById("car_speed").innerHTML = "Speed: " + data.SPEED.cmdResult

      if data.ENGINE_RUNTIME isnt null   
        document.getElementById("engine_runtime").innerHTML = "Engine Runtime: " + data.ENGINE_RUNTIME.cmdResult

      if data.FUEL_LEVEL isnt null   
        document.getElementById("fuel_level").innerHTML = "Fuel Level: " + data.FUEL_LEVEL.cmdResult

      if data.FUEL_CONSUMPTION_RATE isnt null   
        document.getElementById("fuel_consumption_rate").innerHTML = "Fuel Consumption Rate: " + data.FUEL_CONSUMPTION_RATE.cmdResult
      
      if data.THROTTLE_POS isnt null   
        document.getElementById("throttle_pos").innerHTML = "Throttle Position: " + data.THROTTLE_POS.cmdResult

      if data.AIR_FUEL_RATIO isnt null   
        document.getElementById("air_fuel_ratio").innerHTML = "Air/Fuel Ratio: " + data.AIR_FUEL_RATIO.cmdResult
      
      if data.ENGINE_OIL_TEMP isnt null   
        document.getElementById("engine_oil_temp").innerHTML = "Engine Oil Temp: " + data.ENGINE_OIL_TEMP.cmdResult

      if data.AIR_INTAKE_TEMP isnt null   
        document.getElementById("air_intake_temp").innerHTML = "Air Intake Temp: " + data.AIR_INTAKE_TEMP.cmdResult

      if data.DTC_NUMBER isnt null   
        document.getElementById("dtc_number").innerHTML = "Diagnostic Trouble Code: " + data.DTC_NUMBER.cmdResult

      console.log "Packets of car data recieved"

      
                 
      
      


  


