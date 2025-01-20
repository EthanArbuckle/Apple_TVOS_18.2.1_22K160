@interface IOUSBHostCIDeviceStateMachine
- (BOOL)inspectCommand:(const IOUSBHostCIMessage *)command error:(NSError *)error;
- (BOOL)processCommand:(const IOUSBHostCIMessage *)a3 readonly:(BOOL)a4 error:(id *)a5;
- (BOOL)respondToCommand:(const IOUSBHostCIMessage *)command status:(const IOUSBHostCIMessageStatus)status deviceAddress:(NSUInteger)deviceAddress error:(NSError *)error;
- (BOOL)respondToCommand:(const IOUSBHostCIMessage *)command status:(const IOUSBHostCIMessageStatus)status error:(NSError *)error;
- (IOUSBHostCIDeviceState)deviceState;
- (IOUSBHostCIDeviceStateMachine)initWithInterface:(IOUSBHostControllerInterface *)interface command:(const IOUSBHostCIMessage *)command error:(NSError *)error;
- (IOUSBHostControllerInterface)controllerInterface;
- (NSUInteger)completeRoute;
- (NSUInteger)deviceAddress;
- (id)description;
- (void)setCompleteRoute:(unint64_t)a3;
- (void)setControllerInterface:(id)a3;
- (void)setDeviceAddress:(unint64_t)a3;
- (void)setDeviceState:(int)a3;
@end

@implementation IOUSBHostCIDeviceStateMachine

- (IOUSBHostCIDeviceStateMachine)initWithInterface:(IOUSBHostControllerInterface *)interface command:(const IOUSBHostCIMessage *)command error:(NSError *)error
{
  v24[3] = *MEMORY[0x1895F89C0];
  v8 = interface;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___IOUSBHostCIDeviceStateMachine;
  v9 = -[IOUSBHostCIDeviceStateMachine init](&v22, sel_init);
  v10 = v9;
  if (!v9)
  {
    if (error)
    {
      v23[0] = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 localizedStringForKey:@"Failed to create IOUSBHostCIDeviceStateMachine." value:&stru_18A275388 table:0];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v13;
      v23[1] = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 localizedStringForKey:@"init failed." value:&stru_18A275388 table:0];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v15;
      v23[2] = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 localizedStringForKey:0 value:&stru_18A275388 table:0];
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24[2] = v17;
      [MEMORY[0x189603F68] dictionaryWithObjects:v24 forKeys:v23 count:3];
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870211 userInfo:v18];
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      BOOL v19 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v19) {
        -[IOUSBHostCIDeviceStateMachine initWithInterface:command:error:].cold.1(v19, v20);
      }
    }

    goto LABEL_8;
  }

  -[IOUSBHostCIDeviceStateMachine setControllerInterface:](v9, "setControllerInterface:", v8);
  if (-[IOUSBHostCIDeviceStateMachine inspectCommand:error:](v10, "inspectCommand:error:", command, error))
  {
LABEL_8:
    v11 = v10;
    goto LABEL_9;
  }

  v11 = 0LL;
LABEL_9:

  return v11;
}

- (BOOL)processCommand:(const IOUSBHostCIMessage *)a3 readonly:(BOOL)a4 error:(id *)a5
{
  uint64_t v91 = *MEMORY[0x1895F89C0];
  if ((a3->control & 0xC000) != 0x8000)
  {
    if (a5)
    {
      uint64_t v85 = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_18A275388 table:0];
      objc_super v22 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = v22;
      uint64_t v86 = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v23 localizedStringForKey:@"Command failed common validation checks." value:&stru_18A275388 table:0];
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = v24;
      uint64_t v87 = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      [v25 localizedStringForKey:0 value:&stru_18A275388 table:0];
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = v26;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v88 forKeys:&v85 count:3];
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v18];
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v27 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v27) {
        -[IOUSBHostCIPortStateMachine processCommand:readonly:commandResult:error:].cold.5(v27, v28);
      }
      goto LABEL_50;
    }

    return 0;
  }

  if (-[IOUSBHostCIDeviceStateMachine completeRoute](self, "completeRoute") || (a3->data0 & 0xFFFFFF) == 0)
  {
    if (-[IOUSBHostCIDeviceStateMachine deviceAddress](self, "deviceAddress") != LOBYTE(a3->data0))
    {
      if (a5)
      {
        uint64_t v85 = *MEMORY[0x1896075E0];
        [MEMORY[0x1896077F8] mainBundle];
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        [v29 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_18A275388 table:0];
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = v30;
        uint64_t v86 = *MEMORY[0x1896075F0];
        [MEMORY[0x1896077F8] mainBundle];
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        [v31 localizedStringForKey:@"Command does not target this state machine instance." value:&stru_18A275388 table:0];
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = v32;
        uint64_t v87 = *MEMORY[0x189607618];
        [MEMORY[0x1896077F8] mainBundle];
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        [v33 localizedStringForKey:0 value:&stru_18A275388 table:0];
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v90 = v34;
        [MEMORY[0x189603F68] dictionaryWithObjects:&v88 forKeys:&v85 count:3];
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v18];
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        BOOL v35 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
        if (v35) {
          -[IOUSBHostCIEndpointStateMachine processCommand:readonly:error:].cold.12(v35, v36);
        }
        goto LABEL_50;
      }

      return 0;
    }

    IOUSBHostCIDeviceState v9 = -[IOUSBHostCIDeviceStateMachine deviceState](self, "deviceState");
    if (v9)
    {
      if (v9 == IOUSBHostCIDeviceStatePaused)
      {
        uint32_t v49 = (a3->control & 0x3F) - 32;
        BOOL v11 = 1;
        switch(v49)
        {
          case 0u:
          case 3u:
            if (!a5) {
              return 0;
            }
            uint64_t v85 = *MEMORY[0x1896075E0];
            [MEMORY[0x1896077F8] mainBundle];
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            [v50 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_18A275388 table:0];
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v88 = v51;
            uint64_t v86 = *MEMORY[0x1896075F0];
            [MEMORY[0x1896077F8] mainBundle];
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            [v52 localizedStringForKey:@"Command cannot be processed in the current state." value:&stru_18A275388 table:0];
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v89 = v53;
            uint64_t v87 = *MEMORY[0x189607618];
            [MEMORY[0x1896077F8] mainBundle];
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            [v54 localizedStringForKey:0 value:&stru_18A275388 table:0];
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v90 = v55;
            [MEMORY[0x189603F68] dictionaryWithObjects:&v88 forKeys:&v85 count:3];
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v18];
            *a5 = (id)objc_claimAutoreleasedReturnValue();
            BOOL v19 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
            if (v19) {
              goto LABEL_29;
            }
            goto LABEL_50;
          case 1u:
LABEL_40:
            if (a4) {
              return v11;
            }
            -[IOUSBHostCIDeviceStateMachine setDeviceAddress:](self, "setDeviceAddress:", 0LL);
            v70 = self;
            uint64_t v71 = 0LL;
            break;
          case 2u:
            if (a4) {
              return v11;
            }
            v70 = self;
            uint64_t v71 = 2LL;
            break;
          case 4u:
            return v11;
          default:
            if (!a5) {
              return 0;
            }
            uint64_t v85 = *MEMORY[0x1896075E0];
            [MEMORY[0x1896077F8] mainBundle];
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            [v78 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_18A275388 table:0];
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            v88 = v79;
            uint64_t v86 = *MEMORY[0x1896075F0];
            [MEMORY[0x1896077F8] mainBundle];
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            [v80 localizedStringForKey:@"Command is not handled by the device state machine." value:&stru_18A275388 table:0];
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            v89 = v81;
            uint64_t v87 = *MEMORY[0x189607618];
            [MEMORY[0x1896077F8] mainBundle];
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            [v82 localizedStringForKey:0 value:&stru_18A275388 table:0];
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            v90 = v83;
            [MEMORY[0x189603F68] dictionaryWithObjects:&v88 forKeys:&v85 count:3];
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v18];
            *a5 = (id)objc_claimAutoreleasedReturnValue();
            BOOL v62 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
            if (v62) {
              goto LABEL_49;
            }
            goto LABEL_50;
        }
      }

      else
      {
        if (v9 != IOUSBHostCIDeviceStateActive) {
          return 0;
        }
        uint32_t v10 = (a3->control & 0x3F) - 32;
        BOOL v11 = 1;
        switch(v10)
        {
          case 0u:
          case 2u:
            if (!a5) {
              return 0;
            }
            uint64_t v85 = *MEMORY[0x1896075E0];
            [MEMORY[0x1896077F8] mainBundle];
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            [v12 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_18A275388 table:0];
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v88 = v13;
            uint64_t v86 = *MEMORY[0x1896075F0];
            [MEMORY[0x1896077F8] mainBundle];
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            [v14 localizedStringForKey:@"Command cannot be processed in the current state." value:&stru_18A275388 table:0];
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v89 = v15;
            uint64_t v87 = *MEMORY[0x189607618];
            [MEMORY[0x1896077F8] mainBundle];
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            [v16 localizedStringForKey:0 value:&stru_18A275388 table:0];
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v90 = v17;
            [MEMORY[0x189603F68] dictionaryWithObjects:&v88 forKeys:&v85 count:3];
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v18];
            *a5 = (id)objc_claimAutoreleasedReturnValue();
            BOOL v19 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
            if (v19) {
              goto LABEL_29;
            }
            goto LABEL_50;
          case 1u:
            goto LABEL_40;
          case 3u:
            if (a4) {
              return v11;
            }
            v70 = self;
            uint64_t v71 = 1LL;
            break;
          case 4u:
            return v11;
          default:
            if (!a5) {
              return 0;
            }
            uint64_t v85 = *MEMORY[0x1896075E0];
            [MEMORY[0x1896077F8] mainBundle];
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            [v72 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_18A275388 table:0];
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            v88 = v73;
            uint64_t v86 = *MEMORY[0x1896075F0];
            [MEMORY[0x1896077F8] mainBundle];
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            [v74 localizedStringForKey:@"Command is not handled by the device state machine." value:&stru_18A275388 table:0];
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            v89 = v75;
            uint64_t v87 = *MEMORY[0x189607618];
            [MEMORY[0x1896077F8] mainBundle];
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            [v76 localizedStringForKey:0 value:&stru_18A275388 table:0];
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            v90 = v77;
            [MEMORY[0x189603F68] dictionaryWithObjects:&v88 forKeys:&v85 count:3];
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v18];
            *a5 = (id)objc_claimAutoreleasedReturnValue();
            BOOL v62 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
            if (v62) {
              goto LABEL_49;
            }
            goto LABEL_50;
        }
      }

      -[IOUSBHostCIDeviceStateMachine setDeviceState:](v70, "setDeviceState:", v71);
      return v11;
    }

    if ((a3->control & 0x3F) - 32 <= 4)
    {
      if (a5)
      {
        uint64_t v85 = *MEMORY[0x1896075E0];
        [MEMORY[0x1896077F8] mainBundle];
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        [v43 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_18A275388 table:0];
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = v44;
        uint64_t v86 = *MEMORY[0x1896075F0];
        [MEMORY[0x1896077F8] mainBundle];
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        [v45 localizedStringForKey:@"Command cannot be processed in the current state." value:&stru_18A275388 table:0];
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = v46;
        uint64_t v87 = *MEMORY[0x189607618];
        [MEMORY[0x1896077F8] mainBundle];
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        [v47 localizedStringForKey:0 value:&stru_18A275388 table:0];
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v90 = v48;
        [MEMORY[0x189603F68] dictionaryWithObjects:&v88 forKeys:&v85 count:3];
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v18];
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        BOOL v19 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
        if (v19) {
          goto LABEL_29;
        }
        goto LABEL_50;
      }

      return 0;
    }

    if (!a5) {
      return 0;
    }
    uint64_t v85 = *MEMORY[0x1896075E0];
    [MEMORY[0x1896077F8] mainBundle];
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    [v56 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_18A275388 table:0];
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = v57;
    uint64_t v86 = *MEMORY[0x1896075F0];
    [MEMORY[0x1896077F8] mainBundle];
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    [v58 localizedStringForKey:@"Command is not handled by the device state machine." value:&stru_18A275388 table:0];
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = v59;
    uint64_t v87 = *MEMORY[0x189607618];
    [MEMORY[0x1896077F8] mainBundle];
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    [v60 localizedStringForKey:0 value:&stru_18A275388 table:0];
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = v61;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v88 forKeys:&v85 count:3];
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v18];
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v62 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (!v62) {
      goto LABEL_50;
    }
LABEL_49:
    -[IOUSBHostCIEndpointStateMachine processCommand:readonly:error:].cold.2(v62, v63);
    goto LABEL_50;
  }

  if ((a3->control & 0x3F) - 33 < 4)
  {
    if (a5)
    {
      uint64_t v85 = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      [v37 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_18A275388 table:0];
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = v38;
      uint64_t v86 = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      [v39 localizedStringForKey:@"Command cannot be processed in the current state." value:&stru_18A275388 table:0];
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = v40;
      uint64_t v87 = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      [v41 localizedStringForKey:0 value:&stru_18A275388 table:0];
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = v42;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v88 forKeys:&v85 count:3];
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v18];
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v19 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v19) {
LABEL_29:
      }
        -[IOUSBHostCIPortStateMachine processCommand:readonly:commandResult:error:].cold.2(v19, v20);
LABEL_50:

      return 0;
    }

    return 0;
  }

  if ((a3->control & 0x3F) != 0x20)
  {
    if (!a5) {
      return 0;
    }
    uint64_t v85 = *MEMORY[0x1896075E0];
    [MEMORY[0x1896077F8] mainBundle];
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    [v64 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_18A275388 table:0];
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = v65;
    uint64_t v86 = *MEMORY[0x1896075F0];
    [MEMORY[0x1896077F8] mainBundle];
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    [v66 localizedStringForKey:@"Command is not handled by the device state machine." value:&stru_18A275388 table:0];
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = v67;
    uint64_t v87 = *MEMORY[0x189607618];
    [MEMORY[0x1896077F8] mainBundle];
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    [v68 localizedStringForKey:0 value:&stru_18A275388 table:0];
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = v69;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v88 forKeys:&v85 count:3];
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v18];
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v62 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (!v62) {
      goto LABEL_50;
    }
    goto LABEL_49;
  }

  if (!a4)
  {
    -[IOUSBHostCIDeviceStateMachine setDeviceState:](self, "setDeviceState:", 2LL);
    -[IOUSBHostCIDeviceStateMachine setCompleteRoute:](self, "setCompleteRoute:", a3->data0 & 0xFFFFFF);
  }

  return 1;
}

- (BOOL)inspectCommand:(const IOUSBHostCIMessage *)command error:(NSError *)error
{
  return -[IOUSBHostCIDeviceStateMachine processCommand:readonly:error:]( self,  "processCommand:readonly:error:",  command,  1LL,  error);
}

- (BOOL)respondToCommand:(const IOUSBHostCIMessage *)command status:(const IOUSBHostCIMessageStatus)status error:(NSError *)error
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  uint32_t control = command->control;
  if ((command->control & 0x3F) == 0x20) {
    return -[IOUSBHostCIDeviceStateMachine respondToCommand:status:deviceAddress:error:]( self,  "respondToCommand:status:deviceAddress:error:",  command,  *(void *)&status,  0LL,  error);
  }
  if ((command->control & 0xC000) != 0x8000)
  {
    if (error)
    {
      v23[0] = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 localizedStringForKey:@"Command response was not sent." value:&stru_18A275388 table:0];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v15;
      v23[1] = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 localizedStringForKey:@"Command failed common validation checks." value:&stru_18A275388 table:0];
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v17;
      v23[2] = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 localizedStringForKey:0 value:&stru_18A275388 table:0];
      BOOL v19 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v19;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v24 forKeys:v23 count:3];
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v20];
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      BOOL v21 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v21) {
        -[IOUSBHostCIPortStateMachine respondToCommand:status:error:].cold.2(v21, v22);
      }
    }

    return 0;
  }

  if (status != IOUSBHostCIMessageStatusSuccess) {
    goto LABEL_7;
  }
  char v11 = 0;
  if (-[IOUSBHostCIDeviceStateMachine processCommand:readonly:error:]( self,  "processCommand:readonly:error:",  command,  0LL,  error))
  {
    uint32_t control = command->control;
LABEL_7:
    int data0_low = LOBYTE(command->data0);
    LODWORD(v24) = control & 0x3F | (status << 8) | 0xC000;
    HIDWORD(v24) = data0_low;
    v25 = 0LL;
    v13 = -[IOUSBHostCIDeviceStateMachine controllerInterface](self, "controllerInterface");
    char v11 = [v13 enqueueInterrupt:&v24 error:error];
  }

  return v11;
}

- (BOOL)respondToCommand:(const IOUSBHostCIMessage *)command status:(const IOUSBHostCIMessageStatus)status deviceAddress:(NSUInteger)deviceAddress error:(NSError *)error
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  uint32_t control = command->control;
  if ((command->control & 0xC03F) == 0x8020)
  {
    if (status == IOUSBHostCIMessageStatusSuccess && deviceAddress - 1 <= 0xFE)
    {
      char v12 = 0;
      if (!-[IOUSBHostCIDeviceStateMachine processCommand:readonly:error:]( self,  "processCommand:readonly:error:",  command,  0LL,  error)) {
        return v12;
      }
      -[IOUSBHostCIDeviceStateMachine setDeviceAddress:](self, "setDeviceAddress:", deviceAddress);
      uint32_t control = command->control;
    }

    uint32_t v13 = command->data0 & 0xFFFFFF;
    LODWORD(v27) = control & 0x3F | (status << 8) | 0xC000;
    HIDWORD(v27) = v13;
    if (status == IOUSBHostCIMessageStatusSuccess) {
      unint64_t v14 = deviceAddress;
    }
    else {
      unint64_t v14 = 0LL;
    }
    unint64_t v28 = v14;
    v15 = -[IOUSBHostCIDeviceStateMachine controllerInterface](self, "controllerInterface");
    char v12 = [v15 enqueueInterrupt:&v27 error:error];
  }

  else
  {
    if (error)
    {
      v26[0] = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 localizedStringForKey:@"Command response was not sent." value:&stru_18A275388 table:0];
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v27 = v17;
      v26[1] = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 localizedStringForKey:@"Command failed common validation checks." value:&stru_18A275388 table:0];
      BOOL v19 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v28 = (unint64_t)v19;
      v26[2] = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v20 localizedStringForKey:0 value:&stru_18A275388 table:0];
      BOOL v21 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v21;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v27 forKeys:v26 count:3];
      objc_super v22 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v22];
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      BOOL v23 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v23) {
        -[IOUSBHostCIPortStateMachine respondToCommand:status:error:].cold.2(v23, v24);
      }
    }

    return 0;
  }

  return v12;
}

- (id)description
{
  return (id)objc_msgSend( NSString,  "stringWithFormat:",  @"Device %d State %s",  (unsigned __int16)-[IOUSBHostCIDeviceStateMachine deviceAddress](self, "deviceAddress"),  IOUSBHostCIDeviceStateToString(-[IOUSBHostCIDeviceStateMachine deviceState](self, "deviceState")));
}

- (IOUSBHostCIDeviceState)deviceState
{
  return self->_deviceState;
}

- (void)setDeviceState:(int)a3
{
  self->_deviceState = a3;
}

- (NSUInteger)completeRoute
{
  return self->_completeRoute;
}

- (void)setCompleteRoute:(unint64_t)a3
{
  self->_completeRoute = a3;
}

- (NSUInteger)deviceAddress
{
  return self->_deviceAddress;
}

- (void)setDeviceAddress:(unint64_t)a3
{
  self->_deviceAddress = a3;
}

- (IOUSBHostControllerInterface)controllerInterface
{
  return self->_controllerInterface;
}

- (void)setControllerInterface:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithInterface:(uint64_t)a1 command:(const char *)a2 error:.cold.1(uint64_t a1, const char *a2)
{
}

@end