module MPL3115A2_App {
    active component MPL3115A2 {

        # ----------------------------------------------------------------------
        # Ports (data_type, port, name)
        # ----------------------------------------------------------------------

        @ input port of Fw::Cmd type used to process commands sent to this component
        command recv port cmdIn
        
        @ input port of type Drv::SerialRead used to receive serial data buffers
        async input port serialRecv: [1] Drv.SerialRead

        @ output port of Fw::CmdReg type used to register this component's with the command dispatcher
        command reg port cmdRegOut

        @ output port of Fw::CmdResponse type used respond to dispatched commands
        command resp port cmdResponseOut

        @ output port of Fw::Log type used to send events out
        event port eventOut

        @ output port of Fw::LogText type used to send events in a text form
        text event port textEventOut

        @ output port of Fw::Tlm type used to send out telemetry channels
        telemetry port tlmOut

        @ output port of type Fw::BufferSend used at startup to supply buffers to the serial driver
        output port serialBufferOut: [1] Fw.BufferSend

        # ----------------------------------------------------------------------
        # Commands
        # ----------------------------------------------------------------------

        @ Initialize device and report device status
        async command Init_MPL3115A2()

        # ----------------------------------------------------------------------
        # Events
        # ----------------------------------------------------------------------

        @ A confirmation that device initialized successfully
        event Device_Initialized() \
          severity activity high \
          id 0 \
          format "Init_MPL3115A2 command received, device is on!"

        @ A warning that after initialization, status reads empty
        event Failed_To_Start() \
          severity warning high \
          id 1 \
          format "Device failed to initialize"

        # ----------------------------------------------------------------------
        # Telemetry
        # ----------------------------------------------------------------------

        @ Pressure data
        telemetry PRESSURE: F32 id 0

        @ Altitude data data
        telemetry ALTITUDE: F32 id 1

        @ Temperature value
        telemetry TEMPERATURE: F32 id 2
    }
}
