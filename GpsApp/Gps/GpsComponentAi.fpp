module GpsApp {

  active component Gps {

    @ FPP from XML: original path was GpsApp/Gps/Commands.xml
    include "Commands.fppi"

    @ FPP from XML: original path was GpsApp/Gps/Telemetry.xml
    include "Telemetry.fppi"

    @ FPP from XML: original path was GpsApp/Gps/Events.xml
    include "Events.fppi"

    command recv port cmdIn

    command reg port cmdRegOut

    command resp port cmdResponseOut

    event port eventOut

    text event port textEventOut

    telemetry port tlmOut

    async input port serialRecv: [1] Drv.SerialRead

    output port serialBufferOut: [1] Fw.BufferSend

  }

}