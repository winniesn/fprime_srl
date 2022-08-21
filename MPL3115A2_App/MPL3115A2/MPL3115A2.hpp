// ======================================================================
// \title  MPL3115A2.hpp
// \author winwin120
// \brief  hpp file for MPL3115A2 component implementation class
// ======================================================================

#ifndef MPL3115A2_HPP
#define MPL3115A2_HPP

#include "MPL3115A2_App/MPL3115A2/MPL3115A2ComponentAc.hpp"

namespace MPL3115A2_App {

  class MPL3115A2 :
    public MPL3115A2ComponentBase
  {

    public:

      // ----------------------------------------------------------------------
      // Construction, initialization, and destruction
      // ----------------------------------------------------------------------

      //! Construct object MPL3115A2
      //!
      MPL3115A2(
          const char *const compName /*!< The component name*/
      );

      //! Initialize object MPL3115A2
      //!
      void init(
          const NATIVE_INT_TYPE queueDepth, /*!< The queue depth*/
          const NATIVE_INT_TYPE instance = 0 /*!< The instance number*/
      );

      //! Destroy object MPL3115A2
      //!
      ~MPL3115A2();

    PRIVATE:

      // ----------------------------------------------------------------------
      // Handler implementations for user-defined typed input ports
      // ----------------------------------------------------------------------

      //! Handler implementation for serialRecv
      //!
      void serialRecv_handler(
          const NATIVE_INT_TYPE portNum, /*!< The port number*/
          Fw::Buffer &serBuffer, /*!< 
      Buffer containing data
      */
          Drv::SerialReadStatus &status /*!< 
      Status of read
      */
      );

    PRIVATE:

      // ----------------------------------------------------------------------
      // Command handler implementations
      // ----------------------------------------------------------------------

      //! Implementation for Init_MPL3115A2 command handler
      //! Initialize device and report device status
      void Init_MPL3115A2_cmdHandler(
          const FwOpcodeType opCode, /*!< The opcode*/
          const U32 cmdSeq /*!< The command sequence number*/
      );


    };

} // end namespace MPL3115A2_App

#endif
