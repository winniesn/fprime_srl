// ======================================================================
// \title  MPL3115A2.cpp
// \author winwin120
// \brief  cpp file for MPL3115A2 component implementation class
// ======================================================================


#include <MPL3115A2_App/MPL3115A2/MPL3115A2.hpp>
#include "Fw/Types/BasicTypes.hpp"

namespace MPL3115A2_App {

  // ----------------------------------------------------------------------
  // Construction, initialization, and destruction
  // ----------------------------------------------------------------------

  MPL3115A2 ::
    MPL3115A2(
        const char *const compName
    ) : MPL3115A2ComponentBase(compName)
  {

  }

  void MPL3115A2 ::
    init(
        const NATIVE_INT_TYPE queueDepth,
        const NATIVE_INT_TYPE instance
    )
  {
    MPL3115A2ComponentBase::init(queueDepth, instance);
  }

  MPL3115A2 ::
    ~MPL3115A2()
  {

  }

  // ----------------------------------------------------------------------
  // Handler implementations for user-defined typed input ports
  // ----------------------------------------------------------------------

  void MPL3115A2 ::
    serialRecv_handler(
        const NATIVE_INT_TYPE portNum,
        Fw::Buffer &serBuffer,
        Drv::SerialReadStatus &status
    )
  {
    // TODO
  }

  // ----------------------------------------------------------------------
  // Command handler implementations
  // ----------------------------------------------------------------------

  void MPL3115A2 ::
    Init_MPL3115A2_cmdHandler(
        const FwOpcodeType opCode,
        const U32 cmdSeq
    )
  {
    // TODO
    this->cmdResponse_out(opCode,cmdSeq,Fw::CmdResponse::OK);
  }

} // end namespace MPL3115A2_App
