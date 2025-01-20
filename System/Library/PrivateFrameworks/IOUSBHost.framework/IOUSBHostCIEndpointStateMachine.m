@interface IOUSBHostCIEndpointStateMachine
- (BOOL)enqueueTransferCompletionForMessage:(const IOUSBHostCIMessage *)message status:(IOUSBHostCIMessageStatus)status transferLength:(NSUInteger)transferLength error:(NSError *)error;
- (BOOL)inspectCommand:(const IOUSBHostCIMessage *)command error:(NSError *)error;
- (BOOL)processCommand:(const IOUSBHostCIMessage *)a3 readonly:(BOOL)a4 error:(id *)a5;
- (BOOL)processDoorbell:(const IOUSBHostCIDoorbell)doorbell error:(NSError *)error;
- (BOOL)respondToCommand:(const IOUSBHostCIMessage *)command status:(const IOUSBHostCIMessageStatus)status error:(NSError *)error;
- (IOUSBHostCIEndpointState)endpointState;
- (IOUSBHostCIEndpointStateMachine)initWithInterface:(IOUSBHostControllerInterface *)interface command:(const IOUSBHostCIMessage *)command error:(NSError *)error;
- (IOUSBHostControllerInterface)controllerInterface;
- (NSUInteger)deviceAddress;
- (NSUInteger)endpointAddress;
- (const)currentTransferMessage;
- (id)description;
- (int)endpointType;
- (void)setControllerInterface:(id)a3;
- (void)setCurrentTransferMessage:(const IOUSBHostCIMessage *)a3;
- (void)setDeviceAddress:(unint64_t)a3;
- (void)setEndpointAddress:(unint64_t)a3;
- (void)setEndpointState:(int)a3;
- (void)setEndpointType:(int)a3;
@end

@implementation IOUSBHostCIEndpointStateMachine

- (IOUSBHostCIEndpointStateMachine)initWithInterface:(IOUSBHostControllerInterface *)interface command:(const IOUSBHostCIMessage *)command error:(NSError *)error
{
  v24[3] = *MEMORY[0x1895F89C0];
  v8 = interface;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___IOUSBHostCIEndpointStateMachine;
  v9 = -[IOUSBHostCIEndpointStateMachine init](&v22, sel_init);
  v10 = v9;
  if (!v9)
  {
    if (error)
    {
      v23[0] = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 localizedStringForKey:@"Failed to create IOUSBHostCIEndpointStateMachine." value:&stru_18A275388 table:0];
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
        -[IOUSBHostCIEndpointStateMachine initWithInterface:command:error:].cold.1(v19, v20);
      }
    }

    goto LABEL_8;
  }

  -[IOUSBHostCIEndpointStateMachine setControllerInterface:](v9, "setControllerInterface:", v8);
  if (-[IOUSBHostCIEndpointStateMachine inspectCommand:error:](v10, "inspectCommand:error:", command, error))
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
  uint64_t v107 = *MEMORY[0x1895F89C0];
  if ((a3->control & 0xC000) != 0x8000 || !LOBYTE(a3->data0))
  {
    if (!a5) {
      return 0;
    }
    uint64_t v101 = *MEMORY[0x1896075E0];
    [MEMORY[0x1896077F8] mainBundle];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_18A275388 table:0];
    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = v19;
    uint64_t v102 = *MEMORY[0x1896075F0];
    [MEMORY[0x1896077F8] mainBundle];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 localizedStringForKey:@"Command failed common validation checks." value:&stru_18A275388 table:0];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = v21;
    uint64_t v103 = *MEMORY[0x189607618];
    [MEMORY[0x1896077F8] mainBundle];
    objc_super v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 localizedStringForKey:0 value:&stru_18A275388 table:0];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = v23;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v104 forKeys:&v101 count:3];
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v15];
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v24 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v24) {
      -[IOUSBHostCIPortStateMachine processCommand:readonly:commandResult:error:].cold.5(v24, v25);
    }
    goto LABEL_15;
  }

  if (-[IOUSBHostCIEndpointStateMachine deviceAddress](self, "deviceAddress"))
  {
    if (-[IOUSBHostCIEndpointStateMachine deviceAddress](self, "deviceAddress") != LOBYTE(a3->data0)
      || -[IOUSBHostCIEndpointStateMachine endpointAddress](self, "endpointAddress") != BYTE1(a3->data0))
    {
      if (!a5) {
        return 0;
      }
      uint64_t v101 = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      [v27 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_18A275388 table:0];
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = v28;
      uint64_t v102 = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      [v29 localizedStringForKey:@"Command does not target this state machine instance." value:&stru_18A275388 table:0];
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = v30;
      uint64_t v103 = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      [v31 localizedStringForKey:0 value:&stru_18A275388 table:0];
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = v32;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v104 forKeys:&v101 count:3];
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v15];
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v33 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v33) {
        -[IOUSBHostCIEndpointStateMachine processCommand:readonly:error:].cold.12(v33, v34);
      }
      goto LABEL_15;
    }

    switch(-[IOUSBHostCIEndpointStateMachine endpointState](self, "endpointState"))
    {
      case IOUSBHostCIEndpointStateDestroyed:
        if ((a3->control & 0x3F) <= 0x2E && ((1LL << (a3->control & 0x3F)) & 0x7B0000000000LL) != 0)
        {
          if (!a5) {
            return 0;
          }
          uint64_t v101 = *MEMORY[0x1896075E0];
          [MEMORY[0x1896077F8] mainBundle];
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          [v9 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_18A275388 table:0];
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v104 = v10;
          uint64_t v102 = *MEMORY[0x1896075F0];
          [MEMORY[0x1896077F8] mainBundle];
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          [v11 localizedStringForKey:@"Command cannot be processed in the current state." value:&stru_18A275388 table:0];
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v105 = v12;
          uint64_t v103 = *MEMORY[0x189607618];
          [MEMORY[0x1896077F8] mainBundle];
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          [v13 localizedStringForKey:0 value:&stru_18A275388 table:0];
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v106 = v14;
          [MEMORY[0x189603F68] dictionaryWithObjects:&v104 forKeys:&v101 count:3];
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v15];
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          BOOL v16 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
          if (!v16) {
            goto LABEL_15;
          }
          goto LABEL_47;
        }

        if (!a5) {
          return 0;
        }
        uint64_t v101 = *MEMORY[0x1896075E0];
        [MEMORY[0x1896077F8] mainBundle];
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        [v73 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_18A275388 table:0];
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v104 = v74;
        uint64_t v102 = *MEMORY[0x1896075F0];
        [MEMORY[0x1896077F8] mainBundle];
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        [v75 localizedStringForKey:@"Command is not handled by the endpoint state machine." value:&stru_18A275388 table:0];
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v105 = v76;
        uint64_t v103 = *MEMORY[0x189607618];
        [MEMORY[0x1896077F8] mainBundle];
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        [v77 localizedStringForKey:0 value:&stru_18A275388 table:0];
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = v78;
        [MEMORY[0x189603F68] dictionaryWithObjects:&v104 forKeys:&v101 count:3];
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v15];
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        BOOL v79 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
        if (!v79) {
          goto LABEL_15;
        }
        goto LABEL_74;
      case IOUSBHostCIEndpointStateHalted:
        uint64_t v52 = a3->control & 0x3F;
        if ((a3->control & 0x3F) > 0x2E) {
          goto LABEL_72;
        }
        if (((1LL << v52) & 0x590000000000LL) == 0)
        {
          if (v52 == 41)
          {
LABEL_52:
            if (a4) {
              return 1;
            }
LABEL_58:
            v71 = self;
            uint64_t v72 = 0LL;
          }

          else
          {
            if (v52 != 45)
            {
LABEL_72:
              if (!a5) {
                return 0;
              }
              uint64_t v101 = *MEMORY[0x1896075E0];
              [MEMORY[0x1896077F8] mainBundle];
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              [v95 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_18A275388 table:0];
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              v104 = v96;
              uint64_t v102 = *MEMORY[0x1896075F0];
              [MEMORY[0x1896077F8] mainBundle];
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              [v97 localizedStringForKey:@"Command is not handled by the endpoint state machine." value:&stru_18A275388 table:0];
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              v105 = v98;
              uint64_t v103 = *MEMORY[0x189607618];
              [MEMORY[0x1896077F8] mainBundle];
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              [v99 localizedStringForKey:0 value:&stru_18A275388 table:0];
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              v106 = v100;
              [MEMORY[0x189603F68] dictionaryWithObjects:&v104 forKeys:&v101 count:3];
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v15];
              *a5 = (id)objc_claimAutoreleasedReturnValue();
              BOOL v79 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
              if (v79) {
LABEL_74:
              }
                -[IOUSBHostCIEndpointStateMachine processCommand:readonly:error:].cold.4(v79, v80);
              goto LABEL_15;
            }

            if (a4) {
              return 1;
            }
            v71 = self;
            uint64_t v72 = 2LL;
          }

          -[IOUSBHostCIEndpointStateMachine setEndpointState:](v71, "setEndpointState:", v72);
          v81 = self;
          data1 = 0LL;
LABEL_60:
          -[IOUSBHostCIEndpointStateMachine setCurrentTransferMessage:](v81, "setCurrentTransferMessage:", data1);
          return 1;
        }

        if (!a5) {
          return 0;
        }
        uint64_t v101 = *MEMORY[0x1896075E0];
        [MEMORY[0x1896077F8] mainBundle];
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        [v53 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_18A275388 table:0];
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v104 = v54;
        uint64_t v102 = *MEMORY[0x1896075F0];
        [MEMORY[0x1896077F8] mainBundle];
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        [v55 localizedStringForKey:@"Command cannot be processed in the current state." value:&stru_18A275388 table:0];
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v105 = v56;
        uint64_t v103 = *MEMORY[0x189607618];
        [MEMORY[0x1896077F8] mainBundle];
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        [v57 localizedStringForKey:0 value:&stru_18A275388 table:0];
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = v58;
        [MEMORY[0x189603F68] dictionaryWithObjects:&v104 forKeys:&v101 count:3];
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v15];
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        BOOL v16 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
        if (v16) {
          goto LABEL_47;
        }
        goto LABEL_15;
      case IOUSBHostCIEndpointStatePaused:
        BOOL result = 1;
        switch(a3->control & 0x3F)
        {
          case '(':
          case '-':
            if (!a5) {
              return 0;
            }
            uint64_t v101 = *MEMORY[0x1896075E0];
            [MEMORY[0x1896077F8] mainBundle];
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            [v59 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_18A275388 table:0];
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v104 = v60;
            uint64_t v102 = *MEMORY[0x1896075F0];
            [MEMORY[0x1896077F8] mainBundle];
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            [v61 localizedStringForKey:@"Command cannot be processed in the current state." value:&stru_18A275388 table:0];
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v105 = v62;
            uint64_t v103 = *MEMORY[0x189607618];
            [MEMORY[0x1896077F8] mainBundle];
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            [v63 localizedStringForKey:0 value:&stru_18A275388 table:0];
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v106 = v64;
            [MEMORY[0x189603F68] dictionaryWithObjects:&v104 forKeys:&v101 count:3];
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v15];
            *a5 = (id)objc_claimAutoreleasedReturnValue();
            BOOL v16 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
            if (v16) {
              goto LABEL_47;
            }
            goto LABEL_15;
          case ')':
            if (!a4) {
              goto LABEL_58;
            }
            return result;
          case '+':
          case ',':
            return result;
          case '.':
            if (a4) {
              return result;
            }
            data1 = a3->data1;
            v81 = self;
            break;
          default:
            if (!a5) {
              return 0;
            }
            uint64_t v101 = *MEMORY[0x1896075E0];
            [MEMORY[0x1896077F8] mainBundle];
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            [v83 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_18A275388 table:0];
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            v104 = v84;
            uint64_t v102 = *MEMORY[0x1896075F0];
            [MEMORY[0x1896077F8] mainBundle];
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            [v85 localizedStringForKey:@"Command is not handled by the endpoint state machine." value:&stru_18A275388 table:0];
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            v105 = v86;
            uint64_t v103 = *MEMORY[0x189607618];
            [MEMORY[0x1896077F8] mainBundle];
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            [v87 localizedStringForKey:0 value:&stru_18A275388 table:0];
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            v106 = v88;
            [MEMORY[0x189603F68] dictionaryWithObjects:&v104 forKeys:&v101 count:3];
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v15];
            *a5 = (id)objc_claimAutoreleasedReturnValue();
            BOOL v79 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
            if (v79) {
              goto LABEL_74;
            }
            goto LABEL_15;
        }

        goto LABEL_60;
      case IOUSBHostCIEndpointStateActive:
        switch(a3->control & 0x3F)
        {
          case '(':
          case ',':
          case '-':
          case '.':
            if (!a5) {
              return 0;
            }
            uint64_t v101 = *MEMORY[0x1896075E0];
            [MEMORY[0x1896077F8] mainBundle];
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            [v65 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_18A275388 table:0];
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v104 = v66;
            uint64_t v102 = *MEMORY[0x1896075F0];
            [MEMORY[0x1896077F8] mainBundle];
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            [v67 localizedStringForKey:@"Command cannot be processed in the current state." value:&stru_18A275388 table:0];
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            v105 = v68;
            uint64_t v103 = *MEMORY[0x189607618];
            [MEMORY[0x1896077F8] mainBundle];
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            [v69 localizedStringForKey:0 value:&stru_18A275388 table:0];
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v106 = v70;
            [MEMORY[0x189603F68] dictionaryWithObjects:&v104 forKeys:&v101 count:3];
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v15];
            *a5 = (id)objc_claimAutoreleasedReturnValue();
            BOOL v16 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
            if (v16) {
              goto LABEL_47;
            }
            goto LABEL_15;
          case ')':
            goto LABEL_52;
          case '+':
            if (!a4) {
              -[IOUSBHostCIEndpointStateMachine setEndpointState:](self, "setEndpointState:", 2LL);
            }
            return 1;
          default:
            if (!a5) {
              return 0;
            }
            uint64_t v101 = *MEMORY[0x1896075E0];
            [MEMORY[0x1896077F8] mainBundle];
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            [v89 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_18A275388 table:0];
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            v104 = v90;
            uint64_t v102 = *MEMORY[0x1896075F0];
            [MEMORY[0x1896077F8] mainBundle];
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            [v91 localizedStringForKey:@"Command is not handled by the endpoint state machine." value:&stru_18A275388 table:0];
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            v105 = v92;
            uint64_t v103 = *MEMORY[0x189607618];
            [MEMORY[0x1896077F8] mainBundle];
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            [v93 localizedStringForKey:0 value:&stru_18A275388 table:0];
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            v106 = v94;
            [MEMORY[0x189603F68] dictionaryWithObjects:&v104 forKeys:&v101 count:3];
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v15];
            *a5 = (id)objc_claimAutoreleasedReturnValue();
            BOOL v79 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
            if (v79) {
              goto LABEL_74;
            }
            goto LABEL_15;
        }

      default:
        return 0;
    }
  }

  uint32_t v35 = a3->control & 0x3F;
  if (v35 - 43 < 4 || v35 == 41)
  {
    if (!a5) {
      return 0;
    }
    uint64_t v101 = *MEMORY[0x1896075E0];
    [MEMORY[0x1896077F8] mainBundle];
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    [v38 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_18A275388 table:0];
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = v39;
    uint64_t v102 = *MEMORY[0x1896075F0];
    [MEMORY[0x1896077F8] mainBundle];
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    [v40 localizedStringForKey:@"Command cannot be processed in the current state." value:&stru_18A275388 table:0];
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = v41;
    uint64_t v103 = *MEMORY[0x189607618];
    [MEMORY[0x1896077F8] mainBundle];
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    [v42 localizedStringForKey:0 value:&stru_18A275388 table:0];
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = v43;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v104 forKeys:&v101 count:3];
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v15];
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v16 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (!v16) {
      goto LABEL_15;
    }
LABEL_47:
    -[IOUSBHostCIPortStateMachine processCommand:readonly:commandResult:error:].cold.2(v16, v17);
LABEL_15:

    return 0;
  }

  if (v35 != 40)
  {
    if (!a5) {
      return 0;
    }
    uint64_t v101 = *MEMORY[0x1896075E0];
    [MEMORY[0x1896077F8] mainBundle];
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    [v44 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_18A275388 table:0];
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = v45;
    uint64_t v102 = *MEMORY[0x1896075F0];
    [MEMORY[0x1896077F8] mainBundle];
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    [v46 localizedStringForKey:@"Command is not handled by the device state machine." value:&stru_18A275388 table:0];
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = v47;
    uint64_t v103 = *MEMORY[0x189607618];
    [MEMORY[0x1896077F8] mainBundle];
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    [v48 localizedStringForKey:0 value:&stru_18A275388 table:0];
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = v49;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v104 forKeys:&v101 count:3];
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v15];
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v50 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v50) {
      -[IOUSBHostCIEndpointStateMachine processCommand:readonly:error:].cold.2(v50, v51);
    }
    goto LABEL_15;
  }

  if (!a4)
  {
    -[IOUSBHostCIEndpointStateMachine setEndpointState:](self, "setEndpointState:", 2LL);
    -[IOUSBHostCIEndpointStateMachine setDeviceAddress:](self, "setDeviceAddress:", LOBYTE(a3->data0));
    -[IOUSBHostCIEndpointStateMachine setEndpointAddress:](self, "setEndpointAddress:", BYTE1(a3->data0));
    DescriptorWithType = (const IOUSBEndpointDescriptor *)a3->data1;
    int bDescriptorType = DescriptorWithType->bDescriptorType;
    if (bDescriptorType == 5
      || bDescriptorType == 2
      && (DescriptorWithType = (const IOUSBEndpointDescriptor *)IOUSBGetNextDescriptorWithType( (const IOUSBConfigurationDescriptor *)DescriptorWithType,  0LL,  5u)) != 0LL)
    {
      -[IOUSBHostCIEndpointStateMachine setEndpointType:]( self,  "setEndpointType:",  IOUSBGetEndpointType(DescriptorWithType));
    }
  }

  return 1;
}

- (BOOL)inspectCommand:(const IOUSBHostCIMessage *)command error:(NSError *)error
{
  return -[IOUSBHostCIEndpointStateMachine processCommand:readonly:error:]( self,  "processCommand:readonly:error:",  command,  1LL,  error);
}

- (BOOL)respondToCommand:(const IOUSBHostCIMessage *)command status:(const IOUSBHostCIMessageStatus)status error:(NSError *)error
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  uint32_t control = command->control;
  if ((command->control & 0xC000) == 0x8000)
  {
    if (status != IOUSBHostCIMessageStatusSuccess)
    {
LABEL_5:
      int data0_low = LOWORD(command->data0);
      LODWORD(v24) = control & 0x3F | (status << 8) | 0xC000;
      HIDWORD(v24) = data0_low;
      v25 = 0LL;
      v12 = -[IOUSBHostCIEndpointStateMachine controllerInterface](self, "controllerInterface");
      char v10 = [v12 enqueueInterrupt:&v24 error:error];

      return v10;
    }

    char v10 = 0;
    if (-[IOUSBHostCIEndpointStateMachine processCommand:readonly:error:]( self,  "processCommand:readonly:error:",  command,  0LL,  error))
    {
      uint32_t control = command->control;
      goto LABEL_5;
    }
  }

  else
  {
    if (error)
    {
      v23[0] = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 localizedStringForKey:@"Command response was not sent." value:&stru_18A275388 table:0];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v24 = v14;
      v23[1] = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 localizedStringForKey:@"Command failed common validation checks." value:&stru_18A275388 table:0];
      BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v16;
      v23[2] = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 localizedStringForKey:0 value:&stru_18A275388 table:0];
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v18;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v24 forKeys:v23 count:3];
      BOOL v19 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v19];
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      BOOL v20 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v20) {
        -[IOUSBHostCIPortStateMachine respondToCommand:status:error:].cold.2(v20, v21);
      }
    }

    return 0;
  }

  return v10;
}

- (BOOL)processDoorbell:(const IOUSBHostCIDoorbell)doorbell error:(NSError *)error
{
  uint64_t v5 = *(void *)&doorbell;
  uint64_t v37 = *MEMORY[0x1895F89C0];
  uint64_t v7 = doorbell;
  NSUInteger v8 = -[IOUSBHostCIEndpointStateMachine deviceAddress](self, "deviceAddress");
  NSUInteger v9 = v8 | (-[IOUSBHostCIEndpointStateMachine endpointAddress](self, "endpointAddress") << 8);
  if (v9 == v5)
  {
    if (-[IOUSBHostCIEndpointStateMachine currentTransferMessage](self, "currentTransferMessage")
      && (-[IOUSBHostCIEndpointStateMachine endpointState](self, "endpointState") == IOUSBHostCIEndpointStatePaused
       || -[IOUSBHostCIEndpointStateMachine endpointState](self, "endpointState") == IOUSBHostCIEndpointStateActive))
    {
      while (((_BYTE)-[IOUSBHostCIEndpointStateMachine currentTransferMessage](self, "currentTransferMessage")[1] & 0x80) != 0
           && ((_BYTE)-[IOUSBHostCIEndpointStateMachine currentTransferMessage](self, "currentTransferMessage")[1] & 0x40) != 0
           && (*(_DWORD *)-[IOUSBHostCIEndpointStateMachine currentTransferMessage](self, "currentTransferMessage") & 0x3F) == 0x3C)
      {
        if (!(void)-[IOUSBHostCIEndpointStateMachine currentTransferMessage](self, "currentTransferMessage")[8])
        {
          if (error)
          {
            uint64_t v30 = v7;
            uint64_t v31 = *MEMORY[0x1896075E0];
            [MEMORY[0x1896077F8] mainBundle];
            BOOL v19 = (void *)objc_claimAutoreleasedReturnValue();
            [v19 localizedStringForKey:@"Rejected doorbell." value:&stru_18A275388 table:0];
            BOOL v20 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v20;
            uint64_t v32 = *MEMORY[0x1896075F0];
            [MEMORY[0x1896077F8] mainBundle];
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            [v21 localizedStringForKey:@"Found a link to an invalid transfer structure address." value:&stru_18A275388 table:0];
            objc_super v22 = (void *)objc_claimAutoreleasedReturnValue();
            uint32_t v35 = v22;
            uint64_t v33 = *MEMORY[0x189607618];
            [MEMORY[0x1896077F8] mainBundle];
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            [v23 localizedStringForKey:0 value:&stru_18A275388 table:0];
            BOOL v24 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = v24;
            [MEMORY[0x189603F68] dictionaryWithObjects:&v34 forKeys:&v31 count:3];
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870199 userInfo:v25];
            *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
            BOOL v26 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
            if (v26) {
              -[IOUSBHostCIEndpointStateMachine processDoorbell:error:].cold.1(v26, v27);
            }

            uint64_t v7 = v30;
          }

          break;
        }

        -[IOUSBHostCIEndpointStateMachine setCurrentTransferMessage:](self, "setCurrentTransferMessage:");
      }

      -[IOUSBHostCIEndpointStateMachine setEndpointState:](self, "setEndpointState:", 3LL);
    }
  }

  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"0x%08x does not target this endpoint.", v5);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (error)
    {
      uint64_t v29 = v7;
      uint64_t v31 = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 localizedStringForKey:@"Rejected doorbell." value:&stru_18A275388 table:0];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v12;
      uint64_t v32 = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 localizedStringForKey:v10 value:&stru_18A275388 table:0];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      uint32_t v35 = v14;
      uint64_t v33 = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 localizedStringForKey:0 value:&stru_18A275388 table:0];
      BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v16;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v34 forKeys:&v31 count:3];
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v17];
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostCIEndpointStateMachine processDoorbell:error:].cold.2((uint64_t)v10, v18);
      }

      uint64_t v7 = v29;
    }
  }

  return v9 == v7;
}

- (BOOL)enqueueTransferCompletionForMessage:(const IOUSBHostCIMessage *)message status:(IOUSBHostCIMessageStatus)status transferLength:(NSUInteger)transferLength error:(NSError *)error
{
  id v10 = self;
  uint64_t v71 = *MEMORY[0x1895F89C0];
  while (-[IOUSBHostCIEndpointStateMachine endpointState](self, "endpointState") == IOUSBHostCIEndpointStateActive
       && -[IOUSBHostCIEndpointStateMachine currentTransferMessage](v10, "currentTransferMessage")
       && ((_BYTE)-[IOUSBHostCIEndpointStateMachine currentTransferMessage](v10, "currentTransferMessage")[1] & 0x80) != 0
       && ((_BYTE)-[IOUSBHostCIEndpointStateMachine currentTransferMessage](v10, "currentTransferMessage")[1] & 0x40) != 0)
  {
    int v11 = *(_DWORD *)-[IOUSBHostCIEndpointStateMachine currentTransferMessage](v10, "currentTransferMessage") & 0x3F;
    uint64_t v12 = -[IOUSBHostCIEndpointStateMachine currentTransferMessage](v10, "currentTransferMessage");
    if (v11 == 60)
    {
      uint64_t v13 = *(void *)(v12 + 8);
      if (!v13)
      {
        if (error)
        {
          uint64_t v65 = *MEMORY[0x1896075E0];
          [MEMORY[0x1896077F8] mainBundle];
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          [v62 localizedStringForKey:@"Transfer completion message was not sent." value:&stru_18A275388 table:0];
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = v61;
          uint64_t v66 = *MEMORY[0x1896075F0];
          [MEMORY[0x1896077F8] mainBundle];
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          [v14 localizedStringForKey:@"Found a link to an invalid transfer structure address." value:&stru_18A275388 table:0];
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = v15;
          uint64_t v67 = *MEMORY[0x189607618];
          [MEMORY[0x1896077F8] mainBundle];
          BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
          [v16 localizedStringForKey:0 value:&stru_18A275388 table:0];
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = v17;
          [MEMORY[0x189603F68] dictionaryWithObjects:&v68 forKeys:&v65 count:3];
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870199 userInfo:v18];
          *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
          BOOL v19 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
          if (v19) {
            -[IOUSBHostCIEndpointStateMachine enqueueTransferCompletionForMessage:status:transferLength:error:].cold.2( v19,  v20);
          }
        }

        break;
      }
    }

    else
    {
      uint64_t v13 = v12 + 16;
    }

    -[IOUSBHostCIEndpointStateMachine setCurrentTransferMessage:](v10, "setCurrentTransferMessage:", v13);
    self = v10;
  }

  if (-[IOUSBHostCIEndpointStateMachine endpointState](v10, "endpointState") != IOUSBHostCIEndpointStateActive)
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"The current endpoint state %s cannot generate transfer completions.",  IOUSBHostCIEndpointStateToString(-[IOUSBHostCIEndpointStateMachine endpointState](v10, "endpointState")));
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    if (error)
    {
      uint64_t v65 = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
      [v30 localizedStringForKey:@"Transfer completion message was not sent." value:&stru_18A275388 table:0];
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = v31;
      uint64_t v66 = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
      [v32 localizedStringForKey:v21 value:&stru_18A275388 table:0];
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v33;
      uint64_t v67 = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      [v34 localizedStringForKey:0 value:&stru_18A275388 table:0];
      uint32_t v35 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = v35;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v68 forKeys:&v65 count:3];
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v28];
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
LABEL_22:
      }
        -[IOUSBHostCIEndpointStateMachine enqueueTransferCompletionForMessage:status:transferLength:error:].cold.3( (uint64_t)v21,  v29);
LABEL_23:
    }

- (id)description
{
  v3 = (void *)NSString;
  uint64_t v4 = (unsigned __int16)-[IOUSBHostCIEndpointStateMachine deviceAddress](self, "deviceAddress");
  uint64_t v5 = -[IOUSBHostCIEndpointStateMachine endpointAddress](self, "endpointAddress");
  v6 = IOUSBHostCIEndpointStateToString(-[IOUSBHostCIEndpointStateMachine endpointState](self, "endpointState"));
  uint64_t v7 = -[IOUSBHostCIEndpointStateMachine currentTransferMessage](self, "currentTransferMessage");
  if (-[IOUSBHostCIEndpointStateMachine currentTransferMessage](self, "currentTransferMessage"))
  {
    -[IOUSBHostCIEndpointStateMachine controllerInterface](self, "controllerInterface");
    NSUInteger v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v8,  "descriptionForMessage:",  -[IOUSBHostCIEndpointStateMachine currentTransferMessage](self, "currentTransferMessage"));
    NSUInteger v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 stringWithFormat:@"Device %d Endpoint 0x%02x State %s Current Transfer %p(%@)", v4, v5, v6, v7, v9];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [v3 stringWithFormat:@"Device %d Endpoint 0x%02x State %s Current Transfer %p(%@)", v4, v5, v6, v7, @"None"];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (IOUSBHostCIEndpointState)endpointState
{
  return self->_endpointState;
}

- (void)setEndpointState:(int)a3
{
  self->_endpointState = a3;
}

- (NSUInteger)deviceAddress
{
  return self->_deviceAddress;
}

- (void)setDeviceAddress:(unint64_t)a3
{
  self->_deviceAddress = a3;
}

- (NSUInteger)endpointAddress
{
  return self->_endpointAddress;
}

- (void)setEndpointAddress:(unint64_t)a3
{
  self->_endpointAddress = a3;
}

- (const)currentTransferMessage
{
  return self->_currentTransferMessage;
}

- (void)setCurrentTransferMessage:(const IOUSBHostCIMessage *)a3
{
  self->_currentTransferMessage = a3;
}

- (IOUSBHostControllerInterface)controllerInterface
{
  return self->_controllerInterface;
}

- (void)setControllerInterface:(id)a3
{
}

- (int)endpointType
{
  return self->_endpointType;
}

- (void)setEndpointType:(int)a3
{
  self->_endpointType = a3;
}

- (void).cxx_destruct
{
}

  ;
}

- (void)initWithInterface:(uint64_t)a1 command:(const char *)a2 error:.cold.1(uint64_t a1, const char *a2)
{
}

- (void)processCommand:(uint64_t)a1 readonly:(const char *)a2 error:.cold.2(uint64_t a1, const char *a2)
{
}

- (void)processCommand:(uint64_t)a1 readonly:(const char *)a2 error:.cold.4(uint64_t a1, const char *a2)
{
}

- (void)processCommand:(uint64_t)a1 readonly:(const char *)a2 error:.cold.12(uint64_t a1, const char *a2)
{
}

- (void)processDoorbell:(uint64_t)a1 error:(const char *)a2 .cold.1(uint64_t a1, const char *a2)
{
}

- (void)processDoorbell:(uint64_t)a1 error:(const char *)a2 .cold.2(uint64_t a1, const char *a2)
{
  id v2 = OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(v2, v3);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18874A000, MEMORY[0x1895F8DA0], v4, "Error:%s with reason: %s", v5, v6, v7, v8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)enqueueTransferCompletionForMessage:(uint64_t)a1 status:(const char *)a2 transferLength:error:.cold.1( uint64_t a1,  const char *a2)
{
}

- (void)enqueueTransferCompletionForMessage:(uint64_t)a1 status:(const char *)a2 transferLength:error:.cold.2( uint64_t a1,  const char *a2)
{
}

- (void)enqueueTransferCompletionForMessage:(uint64_t)a1 status:(const char *)a2 transferLength:error:.cold.3( uint64_t a1,  const char *a2)
{
  id v2 = OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(v2, v3);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18874A000, MEMORY[0x1895F8DA0], v4, "Error:%s with reason: %s", v5, v6, v7, v8, 2u);
  OUTLINED_FUNCTION_3();
}

@end