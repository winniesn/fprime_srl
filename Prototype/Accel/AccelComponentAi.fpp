module Prototype {

  passive component Accel {

    @ FPP from XML: original path was Prototype/Accel/Telemetry.xml
    include "Telemetry.fppi"

    time get port timeCaller

    telemetry port tlmOut

    output port I2cWrite: [1] Drv.I2c

    output port I2cRead: [1] Drv.I2c

    output port I2cWriteRead: [1] Drv.I2cWriteRead

    @ The rate group scheduler input
    sync input port SchedIn: [1] Sched

  }

}