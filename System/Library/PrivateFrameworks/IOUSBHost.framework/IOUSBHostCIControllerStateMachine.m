@interface IOUSBHostCIControllerStateMachine
- (BOOL)enqueueUpdatedFrame:(uint64_t)frame timestamp:(uint64_t)timestamp error:(NSError *)error;
- (BOOL)inspectCommand:(const IOUSBHostCIMessage *)command error:(NSError *)error;
- (BOOL)processCommand:(const IOUSBHostCIMessage *)a3 readonly:(BOOL)a4 error:(id *)a5;
- (BOOL)respondToCommand:(const IOUSBHostCIMessage *)command status:(const IOUSBHostCIMessageStatus)status error:(NSError *)error;
- (BOOL)respondToCommand:(const IOUSBHostCIMessage *)command status:(const IOUSBHostCIMessageStatus)status frame:(uint64_t)frame timestamp:(uint64_t)timestamp error:(NSError *)error;
- (IOUSBHostCIControllerState)controllerState;
- (IOUSBHostCIControllerStateMachine)initWithInterface:(IOUSBHostControllerInterface *)interface error:(NSError *)error;
- (IOUSBHostControllerInterface)controllerInterface;
- (id)description;
- (unint64_t)lastFrameNumber;
- (unint64_t)lastFrameTimestamp;
- (void)setControllerInterface:(id)a3;
- (void)setControllerState:(int)a3;
- (void)setLastFrameNumber:(unint64_t)a3;
- (void)setLastFrameTimestamp:(unint64_t)a3;
@end

@implementation IOUSBHostCIControllerStateMachine

- (IOUSBHostCIControllerStateMachine)initWithInterface:(IOUSBHostControllerInterface *)interface error:(NSError *)error
{
  v21[3] = *MEMORY[0x1895F89C0];
  v6 = interface;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___IOUSBHostCIControllerStateMachine;
  v7 = -[IOUSBHostCIControllerStateMachine init](&v19, sel_init);
  v8 = v7;
  if (v7)
  {
    -[IOUSBHostCIControllerStateMachine setControllerState:](v7, "setControllerState:", 0LL);
    -[IOUSBHostCIControllerStateMachine setControllerInterface:](v8, "setControllerInterface:", v6);
  }

  else if (error)
  {
    v20[0] = *MEMORY[0x1896075E0];
    [MEMORY[0x1896077F8] mainBundle];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 localizedStringForKey:@"Failed to create IOUSBHostCIControllerStateMachine." value:&stru_18A275388 table:0];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v10;
    v20[1] = *MEMORY[0x1896075F0];
    [MEMORY[0x1896077F8] mainBundle];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 localizedStringForKey:@"init failed." value:&stru_18A275388 table:0];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v12;
    v20[2] = *MEMORY[0x189607618];
    [MEMORY[0x1896077F8] mainBundle];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 localizedStringForKey:0 value:&stru_18A275388 table:0];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v14;
    [MEMORY[0x189603F68] dictionaryWithObjects:v21 forKeys:v20 count:3];
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870211 userInfo:v15];
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    BOOL v16 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v16) {
      -[IOUSBHostCIPortStateMachine initWithInterface:portNumber:error:].cold.1(v16, v17);
    }
  }

  return v8;
}

- (BOOL)processCommand:(const IOUSBHostCIMessage *)a3 readonly:(BOOL)a4 error:(id *)a5
{
  uint64_t v72 = *MEMORY[0x1895F89C0];
  if ((a3->control & 0xC000) == 0x8000)
  {
    IOUSBHostCIControllerState v9 = -[IOUSBHostCIControllerStateMachine controllerState](self, "controllerState");
    if (v9 != IOUSBHostCIControllerStateActive)
    {
      if (v9 == IOUSBHostCIControllerStatePaused)
      {
        switch(a3->control & 0x3F)
        {
          case 0x10u:
          case 0x13u:
          case 0x14u:
            if (!a5) {
              return 0;
            }
            uint64_t v66 = *MEMORY[0x1896075E0];
            [MEMORY[0x1896077F8] mainBundle];
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            [v36 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_18A275388 table:0];
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = v37;
            uint64_t v67 = *MEMORY[0x1896075F0];
            [MEMORY[0x1896077F8] mainBundle];
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            [v38 localizedStringForKey:@"Command cannot be processed in the current state." value:&stru_18A275388 table:0];
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v70 = v39;
            uint64_t v68 = *MEMORY[0x189607618];
            [MEMORY[0x1896077F8] mainBundle];
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            [v40 localizedStringForKey:0 value:&stru_18A275388 table:0];
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v71 = v41;
            [MEMORY[0x189603F68] dictionaryWithObjects:&v69 forKeys:&v66 count:3];
            BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();

            [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v16];
            *a5 = (id)objc_claimAutoreleasedReturnValue();
            BOOL v17 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
            if (v17) {
              goto LABEL_22;
            }
            goto LABEL_12;
          case 0x11u:
            if (a4) {
              return 1;
            }
            -[IOUSBHostCIControllerStateMachine setLastFrameNumber:](self, "setLastFrameNumber:", 0LL);
            -[IOUSBHostCIControllerStateMachine setLastFrameTimestamp:](self, "setLastFrameTimestamp:", 0LL);
            v58 = self;
            uint64_t v59 = 0LL;
            break;
          case 0x12u:
            if (a4) {
              return 1;
            }
            v58 = self;
            uint64_t v59 = 2LL;
            break;
          default:
            if (!a5) {
              return 0;
            }
            uint64_t v66 = *MEMORY[0x1896075E0];
            [MEMORY[0x1896077F8] mainBundle];
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            [v52 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_18A275388 table:0];
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = v53;
            uint64_t v67 = *MEMORY[0x1896075F0];
            [MEMORY[0x1896077F8] mainBundle];
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            [v54 localizedStringForKey:@"Command is not handled by the controller state machine." value:&stru_18A275388 table:0];
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v70 = v55;
            uint64_t v68 = *MEMORY[0x189607618];
            [MEMORY[0x1896077F8] mainBundle];
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            [v56 localizedStringForKey:0 value:&stru_18A275388 table:0];
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v71 = v57;
            [MEMORY[0x189603F68] dictionaryWithObjects:&v69 forKeys:&v66 count:3];
            BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();

            [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v16];
            *a5 = (id)objc_claimAutoreleasedReturnValue();
            BOOL v48 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
            if (v48) {
              goto LABEL_45;
            }
            goto LABEL_12;
        }

        -[IOUSBHostCIControllerStateMachine setControllerState:](v58, "setControllerState:", v59);
      }

      else
      {
        if (v9) {
          return 0;
        }
        if ((a3->control & 0x3F) - 17 < 4)
        {
          if (a5)
          {
            uint64_t v66 = *MEMORY[0x1896075E0];
            [MEMORY[0x1896077F8] mainBundle];
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            [v10 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_18A275388 table:0];
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = v11;
            uint64_t v67 = *MEMORY[0x1896075F0];
            [MEMORY[0x1896077F8] mainBundle];
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            [v12 localizedStringForKey:@"Command cannot be processed in the current state." value:&stru_18A275388 table:0];
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v70 = v13;
            uint64_t v68 = *MEMORY[0x189607618];
            [MEMORY[0x1896077F8] mainBundle];
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            [v14 localizedStringForKey:0 value:&stru_18A275388 table:0];
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v71 = v15;
            [MEMORY[0x189603F68] dictionaryWithObjects:&v69 forKeys:&v66 count:3];
            BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();

            [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v16];
            *a5 = (id)objc_claimAutoreleasedReturnValue();
            BOOL v17 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
            if (v17) {
LABEL_22:
            }
              -[IOUSBHostCIPortStateMachine processCommand:readonly:commandResult:error:].cold.2(v17, v18);
LABEL_12:

            return 0;
          }

          return 0;
        }

        if ((a3->control & 0x3F) != 0x10)
        {
          if (!a5) {
            return 0;
          }
          uint64_t v66 = *MEMORY[0x1896075E0];
          [MEMORY[0x1896077F8] mainBundle];
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          [v60 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_18A275388 table:0];
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = v61;
          uint64_t v67 = *MEMORY[0x1896075F0];
          [MEMORY[0x1896077F8] mainBundle];
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          [v62 localizedStringForKey:@"Command is not handled by the controller state machine." value:&stru_18A275388 table:0];
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = v63;
          uint64_t v68 = *MEMORY[0x189607618];
          [MEMORY[0x1896077F8] mainBundle];
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          [v64 localizedStringForKey:0 value:&stru_18A275388 table:0];
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = v65;
          [MEMORY[0x189603F68] dictionaryWithObjects:&v69 forKeys:&v66 count:3];
          BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();

          [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v16];
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          BOOL v48 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
          if (v48) {
LABEL_45:
          }
            -[IOUSBHostCIControllerStateMachine processCommand:readonly:error:].cold.1(v48, v49);
          goto LABEL_12;
        }

        if (!a4)
        {
          BOOL v27 = 1;
LABEL_32:
          v50 = self;
          uint64_t v51 = 1LL;
LABEL_33:
          -[IOUSBHostCIControllerStateMachine setControllerState:](v50, "setControllerState:", v51);
          return v27;
        }
      }

      return 1;
    }

    uint32_t v29 = (a3->control & 0x3F) - 16;
    BOOL v27 = 1;
    switch(v29)
    {
      case 0u:
      case 2u:
        if (!a5) {
          return 0;
        }
        uint64_t v66 = *MEMORY[0x1896075E0];
        [MEMORY[0x1896077F8] mainBundle];
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        [v30 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_18A275388 table:0];
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = v31;
        uint64_t v67 = *MEMORY[0x1896075F0];
        [MEMORY[0x1896077F8] mainBundle];
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        [v32 localizedStringForKey:@"Command cannot be processed in the current state." value:&stru_18A275388 table:0];
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = v33;
        uint64_t v68 = *MEMORY[0x189607618];
        [MEMORY[0x1896077F8] mainBundle];
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        [v34 localizedStringForKey:0 value:&stru_18A275388 table:0];
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = v35;
        [MEMORY[0x189603F68] dictionaryWithObjects:&v69 forKeys:&v66 count:3];
        BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();

        [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v16];
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        BOOL v17 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
        if (v17) {
          goto LABEL_22;
        }
        goto LABEL_12;
      case 1u:
        if (a4) {
          return v27;
        }
        -[IOUSBHostCIControllerStateMachine setLastFrameNumber:](self, "setLastFrameNumber:", 0LL);
        -[IOUSBHostCIControllerStateMachine setLastFrameTimestamp:](self, "setLastFrameTimestamp:", 0LL);
        v50 = self;
        uint64_t v51 = 0LL;
        break;
      case 3u:
        if (!a4) {
          goto LABEL_32;
        }
        return v27;
      case 4u:
        return v27;
      default:
        if (!a5) {
          return 0;
        }
        uint64_t v66 = *MEMORY[0x1896075E0];
        [MEMORY[0x1896077F8] mainBundle];
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        [v42 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_18A275388 table:0];
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = v43;
        uint64_t v67 = *MEMORY[0x1896075F0];
        [MEMORY[0x1896077F8] mainBundle];
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        [v44 localizedStringForKey:@"Command is not handled by the controller state machine." value:&stru_18A275388 table:0];
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = v45;
        uint64_t v68 = *MEMORY[0x189607618];
        [MEMORY[0x1896077F8] mainBundle];
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        [v46 localizedStringForKey:0 value:&stru_18A275388 table:0];
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = v47;
        [MEMORY[0x189603F68] dictionaryWithObjects:&v69 forKeys:&v66 count:3];
        BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();

        [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v16];
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        BOOL v48 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
        if (v48) {
          goto LABEL_45;
        }
        goto LABEL_12;
    }

    goto LABEL_33;
  }

  if (a5)
  {
    uint64_t v66 = *MEMORY[0x1896075E0];
    [MEMORY[0x1896077F8] mainBundle];
    objc_super v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_18A275388 table:0];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v20;
    uint64_t v67 = *MEMORY[0x1896075F0];
    [MEMORY[0x1896077F8] mainBundle];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 localizedStringForKey:@"Command failed common validation checks." value:&stru_18A275388 table:0];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v22;
    uint64_t v68 = *MEMORY[0x189607618];
    [MEMORY[0x1896077F8] mainBundle];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 localizedStringForKey:0 value:&stru_18A275388 table:0];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v24;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v69 forKeys:&v66 count:3];
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v16];
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v25 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v25) {
      -[IOUSBHostCIPortStateMachine processCommand:readonly:commandResult:error:].cold.5(v25, v26);
    }
    goto LABEL_12;
  }

  return 0;
}

- (BOOL)inspectCommand:(const IOUSBHostCIMessage *)command error:(NSError *)error
{
  return -[IOUSBHostCIControllerStateMachine processCommand:readonly:error:]( self,  "processCommand:readonly:error:",  command,  1LL,  error);
}

- (BOOL)respondToCommand:(const IOUSBHostCIMessage *)command status:(const IOUSBHostCIMessageStatus)status error:(NSError *)error
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  uint32_t control = command->control;
  if ((command->control & 0xC000) == 0x8000)
  {
    if (status != IOUSBHostCIMessageStatusSuccess)
    {
LABEL_5:
      unint64_t v23 = control & 0x3F | (status << 8) | 0xC000;
      v24 = 0LL;
      v11 = -[IOUSBHostCIControllerStateMachine controllerInterface](self, "controllerInterface");
      char v10 = [v11 enqueueInterrupt:&v23 error:error];

      return v10;
    }

    char v10 = 0;
    if (-[IOUSBHostCIControllerStateMachine processCommand:readonly:error:](self, "processCommand:readonly:error:"))
    {
      uint32_t control = command->control;
      goto LABEL_5;
    }
  }

  else
  {
    if (error)
    {
      v22[0] = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 localizedStringForKey:@"Command response was not sent." value:&stru_18A275388 table:0];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v23 = (unint64_t)v13;
      v22[1] = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 localizedStringForKey:@"Command failed common validation checks." value:&stru_18A275388 table:0];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v15;
      v22[2] = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 localizedStringForKey:0 value:&stru_18A275388 table:0];
      BOOL v17 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v25 = v17;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v23 forKeys:v22 count:3];
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v18];
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      BOOL v19 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v19) {
        -[IOUSBHostCIPortStateMachine respondToCommand:status:error:].cold.2(v19, v20);
      }
    }

    return 0;
  }

  return v10;
}

- (BOOL)respondToCommand:(const IOUSBHostCIMessage *)command status:(const IOUSBHostCIMessageStatus)status frame:(uint64_t)frame timestamp:(uint64_t)timestamp error:(NSError *)error
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  uint32_t control = command->control;
  if ((command->control & 0xC03F) != 0x8014)
  {
    if (error)
    {
      v26[0] = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 localizedStringForKey:@"Command response was not sent." value:&stru_18A275388 table:0];
      BOOL v17 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v27 = (unint64_t)v17;
      v26[1] = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 localizedStringForKey:@"Command failed common validation checks." value:&stru_18A275388 table:0];
      BOOL v19 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v19;
      v26[2] = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v20 localizedStringForKey:0 value:&stru_18A275388 table:0];
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      uint32_t v29 = v21;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v27 forKeys:v26 count:3];
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v22];
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      BOOL v23 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v23) {
        -[IOUSBHostCIPortStateMachine respondToCommand:status:error:].cold.2(v23, v24);
      }
    }

    return 0;
  }

  if (status != IOUSBHostCIMessageStatusSuccess)
  {
LABEL_6:
    unint64_t v27 = control & 0x3F | (status << 8) | 0xC000;
    v28 = 0LL;
    v15 = -[IOUSBHostCIControllerStateMachine controllerInterface](self, "controllerInterface");
    char v14 = [v15 enqueueInterrupt:&v27 error:error];

    return v14;
  }

  char v14 = 0;
  if (-[IOUSBHostCIControllerStateMachine processCommand:readonly:error:](self, "processCommand:readonly:error:"))
  {
    if (-[IOUSBHostCIControllerStateMachine enqueueUpdatedFrame:timestamp:error:]( self,  "enqueueUpdatedFrame:timestamp:error:",  frame,  timestamp,  error))
    {
      uint32_t control = command->control;
      goto LABEL_6;
    }

    return 0;
  }

  return v14;
}

- (BOOL)enqueueUpdatedFrame:(uint64_t)frame timestamp:(uint64_t)timestamp error:(NSError *)error
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  if (-[IOUSBHostCIControllerStateMachine controllerState](self, "controllerState") != IOUSBHostCIControllerStateActive)
  {
    if (error)
    {
      uint64_t v32 = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 localizedStringForKey:@"Frame update was not sent." value:&stru_18A275388 table:0];
      BOOL v19 = (void *)objc_claimAutoreleasedReturnValue();
      uint32_t v29 = v19;
      uint64_t v33 = *MEMORY[0x1896075F0];
      objc_msgSend(MEMORY[0x1896077F8], "mainBundle", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v20 localizedStringForKey:@"Frame updates are not meaningful in the current state." value:&stru_18A275388 table:0];
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v30 = v21;
      uint64_t v34 = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      [v22 localizedStringForKey:0 value:&stru_18A275388 table:0];
      BOOL v23 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v23;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v29 forKeys:&v32 count:3];
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870184 userInfo:v15];
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      BOOL v24 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v24) {
        -[IOUSBHostCIControllerStateMachine enqueueUpdatedFrame:timestamp:error:].cold.2(v24, v25);
      }
      goto LABEL_10;
    }

- (id)description
{
  v3 = (void *)NSString;
  v4 = -[IOUSBHostCIControllerStateMachine controllerInterface](self, "controllerInterface");
  [v4 uuid];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 UUIDString];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"Conroller %@ State %s", v6, IOUSBHostCIControllerStateToString(-[IOUSBHostCIControllerStateMachine controllerState](self, "controllerState"))];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (IOUSBHostCIControllerState)controllerState
{
  return self->_controllerState;
}

- (void)setControllerState:(int)a3
{
  self->_controllerState = a3;
}

- (IOUSBHostControllerInterface)controllerInterface
{
  return self->_controllerInterface;
}

- (void)setControllerInterface:(id)a3
{
}

- (unint64_t)lastFrameNumber
{
  return self->_lastFrameNumber;
}

- (void)setLastFrameNumber:(unint64_t)a3
{
  self->_lastFrameNumber = a3;
}

- (unint64_t)lastFrameTimestamp
{
  return self->_lastFrameTimestamp;
}

- (void)setLastFrameTimestamp:(unint64_t)a3
{
  self->_lastFrameTimestamp = a3;
}

- (void).cxx_destruct
{
}

- (void)processCommand:(uint64_t)a1 readonly:(const char *)a2 error:.cold.1(uint64_t a1, const char *a2)
{
}

- (void)enqueueUpdatedFrame:(uint64_t)a1 timestamp:(const char *)a2 error:.cold.1( uint64_t a1,  const char *a2)
{
}

- (void)enqueueUpdatedFrame:(uint64_t)a1 timestamp:(const char *)a2 error:.cold.2( uint64_t a1,  const char *a2)
{
}

@end