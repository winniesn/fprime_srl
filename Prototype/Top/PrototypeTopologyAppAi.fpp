instance cmdDisp: Svc.CommandDispatcher base id 121

instance chanTlm: Svc.TlmChan base id 61

instance prmDb: Svc.PrmDb base id 141

instance cmdSeq: Svc.CmdSequencer base id 541

instance eventLogger: Svc.ActiveLogger base id 421

instance $health: Svc.Health base id 361

instance fileUplink: Svc.FileUplink base id 261

instance fileUplinkBufferManager: Svc.BufferManager base id 301

instance fileDownlink: Svc.FileDownlink base id 501

instance fileManager: Svc.FileManager base id 601

instance textLogger: Svc.PassiveTextLogger base id 521

instance fatalAdapter: Svc.AssertFatalAdapter base id 341

instance fatalHandler: Svc.FatalHandler base id 1

instance linuxTime: Svc.Time base id 441

instance staticMemory: Svc.StaticMemory base id 661

instance downlink: Svc.Framer base id 681

instance uplink: Svc.Deframer base id 701

instance blockDrv: Svc.BlockDriver base id 1600

instance comm: Drv.ByteStreamDriverModel base id 621

instance rateGroupDriverComp: Svc.RateGroupDriver base id 461

instance rateGroup1Comp: Svc.ActiveRateGroup base id 21

instance rateGroup2Comp: Svc.ActiveRateGroup base id 161

instance rateGroup3Comp: Svc.ActiveRateGroup base id 241

instance i2cDrv: Drv.LinuxI2cDriver base id 1100

instance Accel: Prototype.Accel base id 1500

topology Prototype {

  instance cmdDisp

  instance chanTlm

  instance prmDb

  instance cmdSeq

  instance eventLogger

  instance $health

  instance fileUplink

  instance fileUplinkBufferManager

  instance fileDownlink

  instance fileManager

  instance textLogger

  instance fatalAdapter

  instance fatalHandler

  instance linuxTime

  instance staticMemory

  instance downlink

  instance uplink

  instance blockDrv

  instance comm

  instance rateGroupDriverComp

  instance rateGroup1Comp

  instance rateGroup2Comp

  instance rateGroup3Comp

  instance i2cDrv

  instance Accel

  connections XML {
    comm.allocate[0] -> staticMemory.bufferAllocate[0]
    comm.$recv[0] -> uplink.framedIn[0]
    uplink.framedDeallocate[0] -> staticMemory.bufferDeallocate[0]
    uplink.bufferAllocate[0] -> fileUplinkBufferManager.bufferGetCallee[0]
    uplink.comOut[0] -> cmdDisp.seqCmdBuff[0]
    uplink.bufferOut[0] -> fileUplink.bufferSendIn[0]
    uplink.bufferDeallocate[0] -> fileUplinkBufferManager.bufferSendIn[0]
    fileUplink.bufferSendOut[0] -> fileUplinkBufferManager.bufferSendIn[0]
    downlink.framedAllocate[0] -> staticMemory.bufferAllocate[1]
    downlink.framedOut[0] -> comm.send[0]
    comm.deallocate[0] -> staticMemory.bufferDeallocate[1]
    eventLogger.PktSend[0] -> downlink.comIn[0]
    chanTlm.PktSend[0] -> downlink.comIn[0]
    fileDownlink.bufferSendOut[0] -> downlink.bufferIn[0]
    downlink.bufferDeallocate[0] -> fileDownlink.bufferReturn[0]
    eventLogger.CmdReg[0] -> cmdDisp.compCmdReg[0]
    cmdDisp.CmdReg[0] -> cmdDisp.compCmdReg[1]
    $health.CmdReg[0] -> cmdDisp.compCmdReg[2]
    prmDb.CmdReg[0] -> cmdDisp.compCmdReg[3]
    cmdSeq.cmdRegOut[0] -> cmdDisp.compCmdReg[4]
    fileDownlink.cmdRegOut[0] -> cmdDisp.compCmdReg[5]
    fileManager.cmdRegOut[0] -> cmdDisp.compCmdReg[6]
    cmdDisp.compCmdSend[0] -> eventLogger.CmdDisp[0]
    cmdDisp.compCmdSend[1] -> cmdDisp.CmdDisp[0]
    cmdDisp.compCmdSend[2] -> $health.CmdDisp[0]
    cmdDisp.compCmdSend[3] -> prmDb.CmdDisp[0]
    cmdDisp.compCmdSend[4] -> cmdSeq.cmdIn[0]
    cmdDisp.compCmdSend[5] -> fileDownlink.cmdIn[0]
    cmdDisp.compCmdSend[6] -> fileManager.cmdIn[0]
    eventLogger.CmdStatus[0] -> cmdDisp.compCmdStat[0]
    cmdSeq.cmdResponseOut[0] -> cmdDisp.compCmdStat[0]
    prmDb.CmdStatus[0] -> cmdDisp.compCmdStat[0]
    cmdDisp.CmdStatus[0] -> cmdDisp.compCmdStat[0]
    $health.CmdStatus[0] -> cmdDisp.compCmdStat[0]
    fileDownlink.cmdResponseOut[0] -> cmdDisp.compCmdStat[0]
    fileManager.cmdResponseOut[0] -> cmdDisp.compCmdStat[0]
    cmdDisp.seqCmdStatus[1] -> cmdSeq.cmdResponseIn[0]
    cmdSeq.comCmdOut[0] -> cmdDisp.seqCmdBuff[1]
    prmDb.Log[0] -> eventLogger.LogRecv[0]
    fileUplink.eventOut[0] -> eventLogger.LogRecv[0]
    eventLogger.Log[0] -> eventLogger.LogRecv[0]
    fileUplinkBufferManager.eventOut[0] -> eventLogger.LogRecv[0]
    cmdDisp.Log[0] -> eventLogger.LogRecv[0]
    cmdSeq.logOut[0] -> eventLogger.LogRecv[0]
    fatalAdapter.Log[0] -> eventLogger.LogRecv[0]
    $health.Log[0] -> eventLogger.LogRecv[0]
    fileDownlink.eventOut[0] -> eventLogger.LogRecv[0]
    fileManager.eventOut[0] -> eventLogger.LogRecv[0]
    rateGroup1Comp.Log[0] -> eventLogger.LogRecv[0]
    rateGroup2Comp.Log[0] -> eventLogger.LogRecv[0]
    rateGroup3Comp.Log[0] -> eventLogger.LogRecv[0]
    cmdSeq.LogText[0] -> textLogger.TextLogger[0]
    eventLogger.LogText[0] -> textLogger.TextLogger[0]
    $health.LogText[0] -> textLogger.TextLogger[0]
    fatalAdapter.LogText[0] -> textLogger.TextLogger[0]
    prmDb.LogText[0] -> textLogger.TextLogger[0]
    cmdDisp.LogText[0] -> textLogger.TextLogger[0]
    rateGroup1Comp.LogText[0] -> textLogger.TextLogger[0]
    rateGroup2Comp.LogText[0] -> textLogger.TextLogger[0]
    rateGroup3Comp.LogText[0] -> textLogger.TextLogger[0]
    fileDownlink.textEventOut[0] -> textLogger.TextLogger[0]
    fileDownlink.tlmOut[0] -> chanTlm.TlmRecv[0]
    fileUplinkBufferManager.tlmOut[0] -> chanTlm.TlmRecv[0]
    fileUplink.tlmOut[0] -> chanTlm.TlmRecv[0]
    fileManager.tlmOut[0] -> chanTlm.TlmRecv[0]
    cmdSeq.tlmOut[0] -> chanTlm.TlmRecv[0]
    cmdDisp.Tlm[0] -> chanTlm.TlmRecv[0]
    rateGroup1Comp.Tlm[0] -> chanTlm.TlmRecv[0]
    rateGroup2Comp.Tlm[0] -> chanTlm.TlmRecv[0]
    rateGroup3Comp.Tlm[0] -> chanTlm.TlmRecv[0]
    $health.Tlm[0] -> chanTlm.TlmRecv[0]
    Accel.tlmOut[0] -> chanTlm.TlmRecv[0]
    blockDrv.Tlm[0] -> chanTlm.TlmRecv[0]
    prmDb.Time[0] -> linuxTime.timeGetPort[0]
    eventLogger.Time[0] -> linuxTime.timeGetPort[0]
    rateGroup1Comp.Time[0] -> linuxTime.timeGetPort[0]
    rateGroup2Comp.Time[0] -> linuxTime.timeGetPort[0]
    rateGroup3Comp.Time[0] -> linuxTime.timeGetPort[0]
    cmdSeq.timeCaller[0] -> linuxTime.timeGetPort[0]
    $health.Time[0] -> linuxTime.timeGetPort[0]
    fileUplinkBufferManager.timeCaller[0] -> linuxTime.timeGetPort[0]
    cmdDisp.Time[0] -> linuxTime.timeGetPort[0]
    Accel.timeCaller[0] -> linuxTime.timeGetPort[0]
    fileUplink.timeCaller[0] -> linuxTime.timeGetPort[0]
    fileDownlink.timeCaller[0] -> linuxTime.timeGetPort[0]
    fileManager.timeCaller[0] -> linuxTime.timeGetPort[0]
    fatalAdapter.Time[0] -> linuxTime.timeGetPort[0]
    blockDrv.Time[0] -> linuxTime.timeGetPort[0]
    blockDrv.CycleOut[0] -> rateGroupDriverComp.CycleIn[0]
    rateGroupDriverComp.CycleOut[0] -> rateGroup1Comp.CycleIn[0]
    rateGroup1Comp.RateGroupMemberOut[0] -> Accel.SchedIn[0]
    rateGroup1Comp.RateGroupMemberOut[2] -> chanTlm.Run[0]
    rateGroup1Comp.RateGroupMemberOut[3] -> fileDownlink.Run[0]
    rateGroupDriverComp.CycleOut[1] -> rateGroup2Comp.CycleIn[0]
    rateGroup2Comp.RateGroupMemberOut[0] -> cmdSeq.schedIn[0]
    rateGroupDriverComp.CycleOut[2] -> rateGroup3Comp.CycleIn[0]
    rateGroup3Comp.RateGroupMemberOut[0] -> $health.Run[0]
    rateGroup3Comp.RateGroupMemberOut[2] -> blockDrv.Sched[0]
    rateGroup3Comp.RateGroupMemberOut[3] -> fileUplinkBufferManager.schedIn[0]
    rateGroup1Comp.PingOut[0] -> $health.PingReturn[0]
    $health.PingSend[0] -> rateGroup1Comp.PingIn[0]
    $health.PingSend[1] -> rateGroup2Comp.PingIn[0]
    rateGroup2Comp.PingOut[0] -> $health.PingReturn[1]
    $health.PingSend[2] -> rateGroup3Comp.PingIn[0]
    rateGroup3Comp.PingOut[0] -> $health.PingReturn[2]
    $health.PingSend[3] -> cmdDisp.pingIn[0]
    cmdDisp.pingOut[0] -> $health.PingReturn[3]
    $health.PingSend[4] -> eventLogger.pingIn[0]
    eventLogger.pingOut[0] -> $health.PingReturn[4]
    $health.PingSend[5] -> cmdSeq.pingIn[0]
    cmdSeq.pingOut[0] -> $health.PingReturn[5]
    $health.PingSend[6] -> chanTlm.pingIn[0]
    chanTlm.pingOut[0] -> $health.PingReturn[6]
    $health.PingSend[7] -> prmDb.pingIn[0]
    prmDb.pingOut[0] -> $health.PingReturn[7]
    $health.PingSend[8] -> fileUplink.pingIn[0]
    fileUplink.pingOut[0] -> $health.PingReturn[8]
    $health.PingSend[9] -> fileDownlink.pingIn[0]
    fileDownlink.pingOut[0] -> $health.PingReturn[9]
    $health.PingSend[10] -> blockDrv.PingIn[0]
    blockDrv.PingOut[0] -> $health.PingReturn[10]
    $health.PingSend[11] -> fileManager.pingIn[0]
    fileManager.pingOut[0] -> $health.PingReturn[11]
    eventLogger.FatalAnnounce[0] -> fatalHandler.FatalReceive[0]
    Accel.I2cRead[0] -> i2cDrv.read[0]
    Accel.I2cWrite[0] -> i2cDrv.write[0]
    Accel.I2cWriteRead[0] -> i2cDrv.writeRead[0]
  }

}