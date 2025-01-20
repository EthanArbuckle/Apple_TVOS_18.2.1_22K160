@interface IOUSBHostCIPortStateMachine
- (BOOL)connected;
- (BOOL)inspectCommand:(const IOUSBHostCIMessage *)command error:(NSError *)error;
- (BOOL)overcurrent;
- (BOOL)powered;
- (BOOL)processCommand:(const IOUSBHostCIMessage *)a3 readonly:(BOOL)a4 commandResult:(int)a5 error:(id *)a6;
- (BOOL)respondToCommand:(const IOUSBHostCIMessage *)command status:(const IOUSBHostCIMessageStatus)status error:(NSError *)error;
- (BOOL)updateLinkState:(const IOUSBHostCILinkState)linkState speed:(const IOUSBHostCIDeviceSpeed)speed inhibitLinkStateChange:(const BOOL)inhibitLinkStateChange error:(NSError *)error;
- (IOUSBHostCIDeviceSpeed)speed;
- (IOUSBHostCILinkState)linkState;
- (IOUSBHostCIPortState)portState;
- (IOUSBHostCIPortStateMachine)initWithInterface:(IOUSBHostControllerInterface *)interface portNumber:(NSUInteger)portNumber error:(NSError *)error;
- (IOUSBHostCIPortStatus)portStatus;
- (IOUSBHostControllerInterface)controllerInterface;
- (NSUInteger)portNumber;
- (id)description;
- (void)setConnected:(BOOL)connected;
- (void)setControllerInterface:(id)a3;
- (void)setOvercurrent:(BOOL)overcurrent;
- (void)setPortNumber:(unint64_t)a3;
- (void)setPortState:(int)a3;
- (void)setPortStatus:(unsigned int)a3;
- (void)setPowered:(BOOL)powered;
@end

@implementation IOUSBHostCIPortStateMachine

- (IOUSBHostCIPortStateMachine)initWithInterface:(IOUSBHostControllerInterface *)interface portNumber:(NSUInteger)portNumber error:(NSError *)error
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  v8 = interface;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___IOUSBHostCIPortStateMachine;
  v9 = -[IOUSBHostCIPortStateMachine init](&v31, sel_init);
  v10 = v9;
  if (!v9)
  {
    if (error)
    {
      uint64_t v32 = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 localizedStringForKey:@"Failed to create IOUSBHostCIControllerStateMachine." value:&stru_18A275388 table:0];
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v22;
      uint64_t v33 = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v23 localizedStringForKey:@"init failed." value:&stru_18A275388 table:0];
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v24;
      uint64_t v34 = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      [v25 localizedStringForKey:0 value:&stru_18A275388 table:0];
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v26;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v35 forKeys:&v32 count:3];
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870211 userInfo:v27];
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      BOOL v28 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v28) {
        -[IOUSBHostCIPortStateMachine initWithInterface:portNumber:error:].cold.1(v28, v29);
      }
    }

    goto LABEL_13;
  }

  -[IOUSBHostCIPortStateMachine setPortNumber:](v9, "setPortNumber:", portNumber);
  if (-[IOUSBHostCIPortStateMachine portNumber](v10, "portNumber") < 0x10)
  {
    -[IOUSBHostCIPortStateMachine setPortState:](v10, "setPortState:", 0LL);
    -[IOUSBHostCIPortStateMachine setControllerInterface:](v10, "setControllerInterface:", v8);
LABEL_13:
    v20 = v10;
    goto LABEL_14;
  }

  if (error)
  {
    uint64_t v32 = *MEMORY[0x1896075E0];
    [MEMORY[0x1896077F8] mainBundle];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 localizedStringForKey:@"Failed to create IOUSBHostCIControllerStateMachine." value:&stru_18A275388 table:0];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v12;
    uint64_t v33 = *MEMORY[0x1896075F0];
    [MEMORY[0x1896077F8] mainBundle];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 localizedStringForKey:@"Port number is too high." value:&stru_18A275388 table:0];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v14;
    uint64_t v34 = *MEMORY[0x189607618];
    [MEMORY[0x1896077F8] mainBundle];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 localizedStringForKey:0 value:&stru_18A275388 table:0];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v16;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v35 forKeys:&v32 count:3];
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v17];
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    BOOL v18 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v18) {
      -[IOUSBHostCIPortStateMachine initWithInterface:portNumber:error:].cold.2(v18, v19);
    }
  }

  v20 = 0LL;
LABEL_14:

  return v20;
}

- (BOOL)processCommand:(const IOUSBHostCIMessage *)a3 readonly:(BOOL)a4 commandResult:(int)a5 error:(id *)a6
{
  uint64_t v61 = *MEMORY[0x1895F89C0];
  if ((a3->control & 0xC000) != 0x8000
    || -[IOUSBHostCIPortStateMachine portNumber](self, "portNumber") != (a3->data0 & 0xF))
  {
    if (!a6) {
      return 0;
    }
    uint64_t v55 = *MEMORY[0x1896075E0];
    [MEMORY[0x1896077F8] mainBundle];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_18A275388 table:0];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v22;
    uint64_t v56 = *MEMORY[0x1896075F0];
    [MEMORY[0x1896077F8] mainBundle];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 localizedStringForKey:@"Command failed common validation checks." value:&stru_18A275388 table:0];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v24;
    uint64_t v57 = *MEMORY[0x189607618];
    [MEMORY[0x1896077F8] mainBundle];
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v25 localizedStringForKey:0 value:&stru_18A275388 table:0];
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v26;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v58 forKeys:&v55 count:3];
    BOOL v18 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v18];
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v27 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v27) {
      -[IOUSBHostCIPortStateMachine processCommand:readonly:commandResult:error:].cold.5(v27, v28);
    }
LABEL_11:

    return 0;
  }

  IOUSBHostCIPortState v11 = -[IOUSBHostCIPortStateMachine portState](self, "portState");
  if (v11 - 1 < 3)
  {
    switch(a3->control & 0x3F)
    {
      case 0x18u:
        if (!a6) {
          return 0;
        }
        uint64_t v55 = *MEMORY[0x1896075E0];
        [MEMORY[0x1896077F8] mainBundle];
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_18A275388 table:0];
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = v13;
        uint64_t v56 = *MEMORY[0x1896075F0];
        [MEMORY[0x1896077F8] mainBundle];
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 localizedStringForKey:@"Command cannot be processed in the current state." value:&stru_18A275388 table:0];
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = v15;
        uint64_t v57 = *MEMORY[0x189607618];
        [MEMORY[0x1896077F8] mainBundle];
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        [v16 localizedStringForKey:0 value:&stru_18A275388 table:0];
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = v17;
        [MEMORY[0x189603F68] dictionaryWithObjects:&v58 forKeys:&v55 count:3];
        BOOL v18 = (void *)objc_claimAutoreleasedReturnValue();

        [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v18];
        *a6 = (id)objc_claimAutoreleasedReturnValue();
        BOOL v19 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
        if (v19) {
          goto LABEL_7;
        }
        goto LABEL_11;
      case 0x19u:
        if (a4) {
          return 1;
        }
        -[IOUSBHostCIPortStateMachine setPowered:](self, "setPowered:", 0LL);
        v45 = self;
        uint64_t v46 = 0LL;
        goto LABEL_33;
      case 0x1Au:
        IOUSBHostCIPortState v47 = -[IOUSBHostCIPortStateMachine portState](self, "portState");
        BOOL v29 = v47 == IOUSBHostCIPortStateSuspended;
        if (v47 != IOUSBHostCIPortStateSuspended || a4) {
          return v29;
        }
        goto LABEL_32;
      case 0x1Bu:
        IOUSBHostCIPortState v48 = -[IOUSBHostCIPortStateMachine portState](self, "portState");
        BOOL v29 = v48 == IOUSBHostCIPortStateActive;
        if (v48 != IOUSBHostCIPortStateActive || a4) {
          return v29;
        }
        v45 = self;
        uint64_t v46 = 2LL;
        goto LABEL_33;
      case 0x1Cu:
        if (a4) {
          return 1;
        }
        if (a5 != 1) {
          goto LABEL_35;
        }
LABEL_32:
        v45 = self;
        uint64_t v46 = 3LL;
LABEL_33:
        -[IOUSBHostCIPortStateMachine setPortState:](v45, "setPortState:", v46);
        return 1;
      case 0x1Du:
        if (a4) {
          return 1;
        }
LABEL_35:
        BOOL v29 = 1;
        goto LABEL_36;
      case 0x1Eu:
        if (!a4) {
          -[IOUSBHostCIPortStateMachine setPortStatus:]( self,  "setPortStatus:",  -[IOUSBHostCIPortStateMachine portStatus](self, "portStatus") & (~LODWORD(a3->data1) | 0xFFE9FFFF));
        }
        return 1;
      default:
        if (!a6) {
          return 0;
        }
        uint64_t v55 = *MEMORY[0x1896075E0];
        [MEMORY[0x1896077F8] mainBundle];
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        [v37 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_18A275388 table:0];
        uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = v38;
        uint64_t v56 = *MEMORY[0x1896075F0];
        [MEMORY[0x1896077F8] mainBundle];
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        [v39 localizedStringForKey:@"Command is not handled by the port state machine." value:&stru_18A275388 table:0];
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = v40;
        uint64_t v57 = *MEMORY[0x189607618];
        [MEMORY[0x1896077F8] mainBundle];
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        [v41 localizedStringForKey:0 value:&stru_18A275388 table:0];
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = v42;
        [MEMORY[0x189603F68] dictionaryWithObjects:&v58 forKeys:&v55 count:3];
        BOOL v18 = (void *)objc_claimAutoreleasedReturnValue();

        [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v18];
        *a6 = (id)objc_claimAutoreleasedReturnValue();
        BOOL v43 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
        if (v43) {
          goto LABEL_21;
        }
        goto LABEL_11;
    }
  }

  if (v11) {
    return 0;
  }
  if ((a3->control & 0x3F) - 25 < 6)
  {
    if (!a6) {
      return 0;
    }
    uint64_t v55 = *MEMORY[0x1896075E0];
    [MEMORY[0x1896077F8] mainBundle];
    objc_super v31 = (void *)objc_claimAutoreleasedReturnValue();
    [v31 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_18A275388 table:0];
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v32;
    uint64_t v56 = *MEMORY[0x1896075F0];
    [MEMORY[0x1896077F8] mainBundle];
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
    [v33 localizedStringForKey:@"Command cannot be processed in the current state." value:&stru_18A275388 table:0];
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v34;
    uint64_t v57 = *MEMORY[0x189607618];
    [MEMORY[0x1896077F8] mainBundle];
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    [v35 localizedStringForKey:0 value:&stru_18A275388 table:0];
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v36;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v58 forKeys:&v55 count:3];
    BOOL v18 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v18];
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v19 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v19) {
LABEL_7:
    }
      -[IOUSBHostCIPortStateMachine processCommand:readonly:commandResult:error:].cold.2(v19, v20);
    goto LABEL_11;
  }

  if ((a3->control & 0x3F) != 0x18)
  {
    if (!a6) {
      return 0;
    }
    uint64_t v55 = *MEMORY[0x1896075E0];
    [MEMORY[0x1896077F8] mainBundle];
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    [v49 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_18A275388 table:0];
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v50;
    uint64_t v56 = *MEMORY[0x1896075F0];
    [MEMORY[0x1896077F8] mainBundle];
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    [v51 localizedStringForKey:@"Command is not handled by the port state machine." value:&stru_18A275388 table:0];
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v52;
    uint64_t v57 = *MEMORY[0x189607618];
    [MEMORY[0x1896077F8] mainBundle];
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    [v53 localizedStringForKey:0 value:&stru_18A275388 table:0];
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v54;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v58 forKeys:&v55 count:3];
    BOOL v18 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v18];
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v43 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v43) {
LABEL_21:
    }
      -[IOUSBHostCIPortStateMachine processCommand:readonly:commandResult:error:].cold.1(v43, v44);
    goto LABEL_11;
  }

  if (a4) {
    return 1;
  }
  BOOL v29 = 1;
  -[IOUSBHostCIPortStateMachine setPowered:](self, "setPowered:", 1LL);
LABEL_36:
  -[IOUSBHostCIPortStateMachine setPortState:](self, "setPortState:", 1LL);
  return v29;
}

- (BOOL)inspectCommand:(const IOUSBHostCIMessage *)command error:(NSError *)error
{
  return -[IOUSBHostCIPortStateMachine processCommand:readonly:commandResult:error:]( self,  "processCommand:readonly:commandResult:error:",  command,  1LL,  1LL,  error);
}

- (BOOL)respondToCommand:(const IOUSBHostCIMessage *)command status:(const IOUSBHostCIMessageStatus)status error:(NSError *)error
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  if ((command->control & 0xC000) == 0x8000)
  {
    if (status == IOUSBHostCIMessageStatusSuccess)
    {
      if ((command->control & 0x3F) == 0x1C)
      {
        if ((-[IOUSBHostCIPortStateMachine portStatus](self, "portStatus") & 0xF0) != 0)
        {
          if (error)
          {
            uint64_t v29 = *MEMORY[0x1896075E0];
            [MEMORY[0x1896077F8] mainBundle];
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            [v9 localizedStringForKey:@"Command response was not sent." value:&stru_18A275388 table:0];
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v32 = v10;
            uint64_t v30 = *MEMORY[0x1896075F0];
            [MEMORY[0x1896077F8] mainBundle];
            IOUSBHostCIPortState v11 = (void *)objc_claimAutoreleasedReturnValue();
            [v11 localizedStringForKey:@"A successful IOUSBHostCIMessageTypePortReset requires a U0 link state." value:&stru_18A275388 table:0];
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            unint64_t v33 = (unint64_t)v12;
            uint64_t v31 = *MEMORY[0x189607618];
            [MEMORY[0x1896077F8] mainBundle];
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            [v13 localizedStringForKey:0 value:&stru_18A275388 table:0];
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v34 = v14;
            [MEMORY[0x189603F68] dictionaryWithObjects:&v32 forKeys:&v29 count:3];
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870184 userInfo:v15];
            *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
            BOOL v16 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
            if (v16) {
              -[IOUSBHostCIPortStateMachine respondToCommand:status:error:].cold.1(v16, v17);
            }
LABEL_11:

            return 0;
          }

          return 0;
        }

        char v26 = 0;
        if (!-[IOUSBHostCIPortStateMachine processCommand:readonly:commandResult:error:]( self,  "processCommand:readonly:commandResult:error:",  command,  0LL,  1LL,  error)) {
          return v26;
        }
      }

      else
      {
        char v26 = 0;
        if (!-[IOUSBHostCIPortStateMachine processCommand:readonly:commandResult:error:]( self,  "processCommand:readonly:commandResult:error:",  command,  0LL,  1LL,  error)) {
          return v26;
        }
      }
    }

    LODWORD(v32) = command->control & 0x3F | (status << 8) | 0xC000;
    BYTE4(v32) = -[IOUSBHostCIPortStateMachine portNumber](self, "portNumber");
    HIDWORD(v32) = BYTE4(v32);
    unint64_t v33 = -[IOUSBHostCIPortStateMachine portStatus](self, "portStatus");
    -[IOUSBHostCIPortStateMachine controllerInterface](self, "controllerInterface");
    BOOL v27 = (void *)objc_claimAutoreleasedReturnValue();
    char v26 = [v27 enqueueInterrupt:&v32 error:error];

    return v26;
  }

  if (error)
  {
    uint64_t v29 = *MEMORY[0x1896075E0];
    [MEMORY[0x1896077F8] mainBundle];
    BOOL v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 localizedStringForKey:@"Command response was not sent." value:&stru_18A275388 table:0];
    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v32 = v19;
    uint64_t v30 = *MEMORY[0x1896075F0];
    [MEMORY[0x1896077F8] mainBundle];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 localizedStringForKey:@"Command failed common validation checks." value:&stru_18A275388 table:0];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v33 = (unint64_t)v21;
    uint64_t v31 = *MEMORY[0x189607618];
    [MEMORY[0x1896077F8] mainBundle];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 localizedStringForKey:0 value:&stru_18A275388 table:0];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v34 = v23;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v32 forKeys:&v29 count:3];
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v15];
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    BOOL v24 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v24) {
      -[IOUSBHostCIPortStateMachine respondToCommand:status:error:].cold.2(v24, v25);
    }
    goto LABEL_11;
  }

  return 0;
}

- (void)setPowered:(BOOL)powered
{
  if (-[IOUSBHostCIPortStateMachine powered](self, "powered") != powered)
  {
    self->_powered = powered;
    if (powered)
    {
      -[IOUSBHostCIPortStateMachine setPortStatus:]( self,  "setPortStatus:",  -[IOUSBHostCIPortStateMachine portStatus](self, "portStatus") | 1);
      -[IOUSBHostCIPortStateMachine setPortStatus:]( self,  "setPortStatus:",  -[IOUSBHostCIPortStateMachine portStatus](self, "portStatus") & 0xFFFFF80FLL);
      -[IOUSBHostCIPortStateMachine setPortStatus:]( self,  "setPortStatus:",  -[IOUSBHostCIPortStateMachine portStatus](self, "portStatus") | 0x50);
      uint64_t v5 = -[IOUSBHostCIPortStateMachine portStatus](self, "portStatus");
    }

    else
    {
      uint64_t v5 = 0LL;
      *(_WORD *)&self->_connected = 0;
    }

    -[IOUSBHostCIPortStateMachine setPortStatus:](self, "setPortStatus:", v5);
  }

- (void)setConnected:(BOOL)connected
{
  BOOL v3 = connected;
  if (-[IOUSBHostCIPortStateMachine powered](self, "powered")
    && -[IOUSBHostCIPortStateMachine connected](self, "connected") != v3)
  {
    self->_connected = v3;
    if (v3)
    {
      uint64_t v5 = -[IOUSBHostCIPortStateMachine portStatus](self, "portStatus") | 4;
      uint64_t v6 = 7LL;
    }

    else
    {
      -[IOUSBHostCIPortStateMachine setPortState:](self, "setPortState:", 1LL);
      uint64_t v5 = -[IOUSBHostCIPortStateMachine portStatus](self, "portStatus") & 0xFFFFFFFBLL;
      uint64_t v6 = 5LL;
    }

    -[IOUSBHostCIPortStateMachine setPortStatus:](self, "setPortStatus:", v5);
    -[IOUSBHostCIPortStateMachine updateLinkState:speed:inhibitLinkStateChange:error:]( self,  "updateLinkState:speed:inhibitLinkStateChange:error:",  v6,  0LL,  1LL,  0LL);
    -[IOUSBHostCIPortStateMachine setPortStatus:]( self,  "setPortStatus:",  -[IOUSBHostCIPortStateMachine portStatus](self, "portStatus") | 0x40000);
    LODWORD(v8[0]) = 49160;
    HIDWORD(v8[0]) = -[IOUSBHostCIPortStateMachine portNumber](self, "portNumber", v8[0]);
    v8[1] = 0LL;
    v7 = -[IOUSBHostCIPortStateMachine controllerInterface](self, "controllerInterface");
    [v7 enqueueInterrupt:v8 error:0];
  }

- (void)setOvercurrent:(BOOL)overcurrent
{
  BOOL v3 = overcurrent;
  if (-[IOUSBHostCIPortStateMachine powered](self, "powered")
    && -[IOUSBHostCIPortStateMachine overcurrent](self, "overcurrent") != v3)
  {
    self->_overcurrent = v3;
    IOUSBHostCIPortStatus v5 = -[IOUSBHostCIPortStateMachine portStatus](self, "portStatus");
    if (v3)
    {
      -[IOUSBHostCIPortStateMachine setPortStatus:](self, "setPortStatus:", v5 | 2);
    }

    else
    {
      -[IOUSBHostCIPortStateMachine setPortStatus:](self, "setPortStatus:", v5 & 0xFFFFFFFD);
      if (-[IOUSBHostCIPortStateMachine connected](self, "connected"))
      {
        uint64_t v6 = 7LL;
LABEL_9:
        -[IOUSBHostCIPortStateMachine updateLinkState:speed:inhibitLinkStateChange:error:]( self,  "updateLinkState:speed:inhibitLinkStateChange:error:",  v6,  0LL,  1LL,  0LL);
        -[IOUSBHostCIPortStateMachine setPortStatus:]( self,  "setPortStatus:",  -[IOUSBHostCIPortStateMachine portStatus](self, "portStatus") | 0x20000);
        LODWORD(v8[0]) = 49160;
        HIDWORD(v8[0]) = -[IOUSBHostCIPortStateMachine portNumber](self, "portNumber", v8[0]);
        v8[1] = 0LL;
        v7 = -[IOUSBHostCIPortStateMachine controllerInterface](self, "controllerInterface");
        [v7 enqueueInterrupt:v8 error:0];

        return;
      }

      -[IOUSBHostCIPortStateMachine setPortState:](self, "setPortState:", 1LL);
    }

    uint64_t v6 = 5LL;
    goto LABEL_9;
  }

- (BOOL)updateLinkState:(const IOUSBHostCILinkState)linkState speed:(const IOUSBHostCIDeviceSpeed)speed inhibitLinkStateChange:(const BOOL)inhibitLinkStateChange error:(NSError *)error
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  if (!-[IOUSBHostCIPortStateMachine powered](self, "powered"))
  {
    if (error)
    {
      uint64_t v36 = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 localizedStringForKey:@"Link state cannot be updated." value:&stru_18A275388 table:0];
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v22;
      uint64_t v37 = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v23 localizedStringForKey:@"Port is not powered." value:&stru_18A275388 table:0];
      BOOL v24 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v24;
      uint64_t v38 = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      [v25 localizedStringForKey:0 value:&stru_18A275388 table:0];
      char v26 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v26;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v39 forKeys:&v36 count:3];
      BOOL v18 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870184 userInfo:v18];
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      BOOL v27 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v27) {
        -[IOUSBHostCIPortStateMachine updateLinkState:speed:inhibitLinkStateChange:error:].cold.2(v27, v28);
      }
      goto LABEL_10;
    }

    return 0;
  }

  BOOL v11 = IOUSBHostCILinkStateEnabled(linkState);
  if (speed == IOUSBHostCIDeviceSpeedNone && v11)
  {
    if (error)
    {
      uint64_t v36 = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 localizedStringForKey:@"Link state cannot be updated." value:&stru_18A275388 table:0];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v13;
      uint64_t v37 = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 localizedStringForKey:@"Link state is not compatible with speed." value:&stru_18A275388 table:0];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v15;
      uint64_t v38 = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 localizedStringForKey:0 value:&stru_18A275388 table:0];
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v17;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v39 forKeys:&v36 count:3];
      BOOL v18 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v18];
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      BOOL v19 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v19) {
        -[IOUSBHostCIPortStateMachine updateLinkState:speed:inhibitLinkStateChange:error:].cold.1(v19, v20);
      }
LABEL_10:

      return 0;
    }

    return 0;
  }

  IOUSBHostCILinkState v30 = -[IOUSBHostCIPortStateMachine portStatus](self, "portStatus") >> 4;
  -[IOUSBHostCIPortStateMachine portStatus](self, "portStatus");
  -[IOUSBHostCIPortStateMachine setPortStatus:]( self,  "setPortStatus:",  -[IOUSBHostCIPortStateMachine portStatus](self, "portStatus") & 0xFFFFF80FLL);
  -[IOUSBHostCIPortStateMachine setPortStatus:]( self,  "setPortStatus:",  -[IOUSBHostCIPortStateMachine portStatus](self, "portStatus") | (16 * linkState));
  if (IOUSBHostCILinkStateEnabled(linkState)) {
    IOUSBHostCIDeviceSpeed v31 = speed << 8;
  }
  else {
    IOUSBHostCIDeviceSpeed v31 = IOUSBHostCIDeviceSpeedNone;
  }
  -[IOUSBHostCIPortStateMachine setPortStatus:]( self,  "setPortStatus:",  -[IOUSBHostCIPortStateMachine portStatus](self, "portStatus") | v31);
  int v32 = IOUSBHostCILinkStateEnabled(v30);
  int v33 = IOUSBHostCILinkStateEnabled(linkState);
  if (linkState != IOUSBHostCILinkStateResume && v32 == v33) {
    return 1;
  }
  if (IOUSBHostCILinkStateEnabled(v30) && !IOUSBHostCILinkStateEnabled(linkState)) {
    -[IOUSBHostCIPortStateMachine setPortState:](self, "setPortState:", 1LL);
  }
  if (inhibitLinkStateChange) {
    return 1;
  }
  -[IOUSBHostCIPortStateMachine setPortStatus:]( self,  "setPortStatus:",  -[IOUSBHostCIPortStateMachine portStatus](self, "portStatus") | 0x100000);
  LODWORD(v39) = 49160;
  BYTE4(v39) = -[IOUSBHostCIPortStateMachine portNumber](self, "portNumber");
  HIDWORD(v39) = BYTE4(v39);
  v40 = 0LL;
  -[IOUSBHostCIPortStateMachine controllerInterface](self, "controllerInterface");
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
  char v29 = [v34 enqueueInterrupt:&v39 error:error];

  return v29;
}

- (id)description
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[IOUSBHostCIPortStateMachine portStatus](self, "portStatus"))
  {
    objc_msgSend(v3, "appendString:", @" (");
    if ((-[IOUSBHostCIPortStateMachine portStatus](self, "portStatus") & 1) != 0) {
      [v3 appendString:@" Powered"];
    }
    if ((-[IOUSBHostCIPortStateMachine portStatus](self, "portStatus") & 2) != 0) {
      [v3 appendString:@" Overcurrent"];
    }
    if ((-[IOUSBHostCIPortStateMachine portStatus](self, "portStatus") & 4) != 0) {
      [v3 appendString:@" Connected"];
    }
    objc_msgSend( v3,  "appendFormat:",  @" Link State %s",  IOUSBHostCILinkStateToString((IOUSBHostCILinkState)(-[IOUSBHostCIPortStateMachine portStatus]( self,  "portStatus") >> 4)));
    if (IOUSBHostCILinkStateEnabled((const IOUSBHostCILinkState)(-[IOUSBHostCIPortStateMachine portStatus]( self,  "portStatus") >> 4))) {
      objc_msgSend( v3,  "appendFormat:",  @" Device Speed %s",  IOUSBHostCIDeviceSpeedToString((IOUSBHostCIDeviceSpeed)((-[IOUSBHostCIPortStateMachine portStatus]( self,  "portStatus") >> 8) & 7)));
    }
    if ((-[IOUSBHostCIPortStateMachine portStatus](self, "portStatus") & 0x20000) != 0) {
      [v3 appendString:@" Overcurrent Change"];
    }
    if ((-[IOUSBHostCIPortStateMachine portStatus](self, "portStatus") & 0x40000) != 0) {
      [v3 appendString:@" Connect Change"];
    }
    if ((-[IOUSBHostCIPortStateMachine portStatus](self, "portStatus") & 0x100000) != 0) {
      [v3 appendString:@" Link Change"];
    }
    [v3 appendString:@""]);
  }

  return v3;
}

- (NSUInteger)portNumber
{
  return self->_portNumber;
}

- (void)setPortNumber:(unint64_t)a3
{
  self->_portNumber = a3;
}

- (IOUSBHostCIPortState)portState
{
  return self->_portState;
}

- (void)setPortState:(int)a3
{
  self->_portState = a3;
}

- (IOUSBHostCIPortStatus)portStatus
{
  return self->_portStatus;
}

- (void)setPortStatus:(unsigned int)a3
{
  self->_portStatus = a3;
}

- (IOUSBHostControllerInterface)controllerInterface
{
  return self->_controllerInterface;
}

- (void)setControllerInterface:(id)a3
{
}

- (BOOL)powered
{
  return self->_powered;
}

- (BOOL)connected
{
  return self->_connected;
}

- (BOOL)overcurrent
{
  return self->_overcurrent;
}

- (IOUSBHostCILinkState)linkState
{
  return self->_linkState;
}

- (IOUSBHostCIDeviceSpeed)speed
{
  return self->_speed;
}

- (void).cxx_destruct
{
}

  ;
}

- (void)initWithInterface:(uint64_t)a1 portNumber:(const char *)a2 error:.cold.1(uint64_t a1, const char *a2)
{
}

- (void)initWithInterface:(uint64_t)a1 portNumber:(const char *)a2 error:.cold.2(uint64_t a1, const char *a2)
{
}

- (void)processCommand:(uint64_t)a1 readonly:(const char *)a2 commandResult:error:.cold.1( uint64_t a1,  const char *a2)
{
}

- (void)processCommand:(uint64_t)a1 readonly:(const char *)a2 commandResult:error:.cold.2( uint64_t a1,  const char *a2)
{
}

- (void)processCommand:(uint64_t)a1 readonly:(const char *)a2 commandResult:error:.cold.5( uint64_t a1,  const char *a2)
{
}

- (void)respondToCommand:(uint64_t)a1 status:(const char *)a2 error:.cold.1(uint64_t a1, const char *a2)
{
}

- (void)respondToCommand:(uint64_t)a1 status:(const char *)a2 error:.cold.2(uint64_t a1, const char *a2)
{
}

- (void)updateLinkState:(uint64_t)a1 speed:(const char *)a2 inhibitLinkStateChange:error:.cold.1( uint64_t a1,  const char *a2)
{
}

- (void)updateLinkState:(uint64_t)a1 speed:(const char *)a2 inhibitLinkStateChange:error:.cold.2( uint64_t a1,  const char *a2)
{
}

@end