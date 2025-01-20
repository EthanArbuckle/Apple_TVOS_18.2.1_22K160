@interface AppleTypeCRetimerDFUChecker
- (AppleTypeCRetimerDFUChecker)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5 deviceNamePrefix:(id)a6;
- (BOOL)checkDeferredRouterIDs;
- (BOOL)doCheck;
- (BOOL)doCheckForRouterID:(unsigned __int8)a3 allowsNotReady:(BOOL)a4;
- (BOOL)doCheckForRouterIDList:(id)a3 allowsNotReady:(BOOL)a4;
- (BOOL)waitForACEsWithRouterIDs:(id)a3;
- (void)initForceDFU;
@end

@implementation AppleTypeCRetimerDFUChecker

- (AppleTypeCRetimerDFUChecker)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5 deviceNamePrefix:(id)a6
{
  id v10 = a6;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___AppleTypeCRetimerDFUChecker;
  v11 = -[AppleTypeCRetimerUpdaterHelper initWithOptions:logFunction:logContext:]( &v19,  sel_initWithOptions_logFunction_logContext_,  a3,  a4,  a5);
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    deviceNamePrefix = v11->_deviceNamePrefix;
    v11->_deviceNamePrefix = (NSString *)v12;

    -[AppleTypeCRetimerDFUChecker initForceDFU](v11, "initForceDFU");
    uint64_t v14 = [MEMORY[0x189603FA8] array];
    notReadyRouterIDs = v11->_notReadyRouterIDs;
    v11->_notReadyRouterIDs = (NSMutableArray *)v14;

    v16 = (NSLock *)objc_alloc_init(MEMORY[0x189607910]);
    notReadyRouterIDsLock = v11->_notReadyRouterIDsLock;
    v11->_notReadyRouterIDsLock = v16;
  }

  return v11;
}

- (void)initForceDFU
{
  if ((os_parse_boot_arg_int() & 1) != 0)
  {
    BOOL forceDFU = 0;
    self->_BOOL forceDFU = 0;
  }

  else
  {
    BOOL forceDFU = self->_forceDFU;
  }

  if (forceDFU) {
    v4 = "enabled";
  }
  else {
    v4 = "disabled";
  }
  -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", @"Force DFU mode is %s", v4);
}

- (BOOL)doCheck
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (![v3 count])
  {
    -[AppleTypeCRetimerUpdaterHelper log:]( self,  "log:",  @"No iic devices found for prefix %@, nothing else to do.",  self->_deviceNamePrefix);
    logSystemFatal( @"%s: Fatal error, no iic devices found for prefix %@.",  v5,  v6,  v7,  v8,  v9,  v10,  v11,  (uint64_t)"-[AppleTypeCRetimerDFUChecker doCheck]");
    goto LABEL_5;
  }

  if (!-[AppleTypeCRetimerDFUChecker waitForACEsWithRouterIDs:](self, "waitForACEsWithRouterIDs:", v3))
  {
LABEL_5:
    BOOL v4 = 0;
    goto LABEL_6;
  }

  BOOL v4 = -[AppleTypeCRetimerDFUChecker doCheckForRouterIDList:allowsNotReady:]( self,  "doCheckForRouterIDList:allowsNotReady:",  v3,  1LL);
LABEL_6:

  return v4;
}

- (BOOL)doCheckForRouterIDList:(id)a3 allowsNotReady:(BOOL)a4
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  group = dispatch_group_create();
  [MEMORY[0x189603FA8] array];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v22 = objc_alloc_init(MEMORY[0x189607910]);
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  obuint64_t j = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v34;
    do
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(obj);
        }
        char v12 = [*(id *)(*((void *)&v33 + 1) + 8 * i) unsignedCharValue];
        dispatch_get_global_queue(-2LL, 0LL);
        v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1895F87A8];
        block[1] = 3221225472LL;
        block[2] = __69__AppleTypeCRetimerDFUChecker_doCheckForRouterIDList_allowsNotReady___block_invoke;
        block[3] = &unk_18A3C1768;
        block[4] = self;
        char v31 = v12;
        BOOL v32 = a4;
        id v29 = v22;
        id v30 = v7;
        dispatch_group_async(group, v13, block);
      }

      uint64_t v9 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }

    while (v9);
  }

  dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v14 = v7;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v37 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v25;
    while (2)
    {
      for (uint64_t j = 0LL; j != v16; ++j)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        if (![*(id *)(*((void *)&v24 + 1) + 8 * j) BOOLValue])
        {
          BOOL v19 = 0;
          goto LABEL_18;
        }
      }

      uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v37 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  BOOL v19 = 1;
LABEL_18:

  return v19;
}

uint64_t __69__AppleTypeCRetimerDFUChecker_doCheckForRouterIDList_allowsNotReady___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) doCheckForRouterID:*(unsigned __int8 *)(a1 + 56) allowsNotReady:*(unsigned __int8 *)(a1 + 57)];
  [*(id *)(a1 + 40) lock];
  v3 = *(void **)(a1 + 48);
  [MEMORY[0x189607968] numberWithBool:v2];
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 addObject:v4];

  return [*(id *)(a1 + 40) unlock];
}

- (BOOL)doCheckForRouterID:(unsigned __int8)a3 allowsNotReady:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = a3;
  uint64_t v7 = -[ACE initWithRouterID:](objc_alloc(&OBJC_CLASS___ACE), "initWithRouterID:", a3);
  if (v7)
  {
    uint64_t v8 = -[AppleTypeCRetimerIICDeviceHandle initWithRouterID:namePrefix:]( objc_alloc(&OBJC_CLASS___AppleTypeCRetimerIICDeviceHandle),  "initWithRouterID:namePrefix:",  v5,  self->_deviceNamePrefix);
    if (!v8)
    {
      -[AppleTypeCRetimerUpdaterHelper log:]( self,  "log:",  @"Unable to create IIC device handle for %@%u",  self->_deviceNamePrefix,  v5);
      BOOL v12 = 0;
LABEL_15:

      goto LABEL_16;
    }

    uint64_t v9 = -[AppleTypeCRetimerIICBase initWithDeviceHandle:]( objc_alloc(&OBJC_CLASS___AppleTypeCRetimerIIC),  "initWithDeviceHandle:",  v8);
    -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", @"Forcing power on for router ID %u", v5);
    uint64_t v10 = -[ACE retimerForcePower](v7, "retimerForcePower");
    if ((_DWORD)v10 == -536870184 && v4)
    {
      -[NSLock lock](self->_notReadyRouterIDsLock, "lock");
      notReadyRouterIDs = self->_notReadyRouterIDs;
      [MEMORY[0x189607968] numberWithUnsignedChar:v5];
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](notReadyRouterIDs, "addObject:", v14);

      -[NSLock unlock](self->_notReadyRouterIDsLock, "unlock");
      -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", @"Router ID %u not ready for DFU check.", v5);
LABEL_13:
      BOOL v12 = 1;
      goto LABEL_14;
    }

    if ((_DWORD)v10)
    {
      -[AppleTypeCRetimerUpdaterHelper log:]( self,  "log:",  @"Failed to force power for router ID %u (0x%08x)",  v5,  v10);
    }

    else
    {
      sleep(1u);
      uint64_t v16 = "enabled";
      if (!self->_forceDFU)
      {
        v20 = -[AppleTypeCRetimerIICBase queryHardwareID:](v9, "queryHardwareID:", 0LL);
        if (v20)
        {
          -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", @"Router ID %u does not require DFU mode", v5);
          goto LABEL_13;
        }

        if (!self->_forceDFU) {
          uint64_t v16 = "disabled";
        }
      }

      -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", @"Force DFU mode is %s", v16);
      -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", @"Entering into DFU mode for Router ID %u", v5);
      uint64_t v17 = -[ACE retimerEnterDFU](v7, "retimerEnterDFU");
      if ((_DWORD)v17 == -536870184 && v4)
      {
        -[NSLock lock](self->_notReadyRouterIDsLock, "lock");
        v18 = self->_notReadyRouterIDs;
        [MEMORY[0x189607968] numberWithUnsignedChar:v5];
        BOOL v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v18, "addObject:", v19);

        -[NSLock unlock](self->_notReadyRouterIDsLock, "unlock");
        -[AppleTypeCRetimerUpdaterHelper log:]( self,  "log:",  @"Router ID %u not ready for DFU check after IIC check failed.",  v5);
        goto LABEL_13;
      }

      if ((_DWORD)v17)
      {
        -[AppleTypeCRetimerUpdaterHelper log:]( self,  "log:",  @"Enter DFU request failed for router ID %u (0x%08x)",  v5,  v17);
      }

      else
      {
        v21 = -[AppleTypeCRetimerDFU initWithRouterID:route:port:space:baudRate:]( objc_alloc(&OBJC_CLASS___AppleTypeCRetimerDFU),  "initWithRouterID:route:port:space:baudRate:",  v5,  0LL,  0LL,  2LL,  921600LL);
        id v22 = v21;
        if (v21)
        {
          v23 = -[AppleTypeCRetimerDFU queryHardwareID](v21, "queryHardwareID");
          if (v23)
          {
            -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", @"Router ID %u placed into DFU mode", v5);

            goto LABEL_13;
          }

          -[AppleTypeCRetimerUpdaterHelper log:]( self,  "log:",  @"Failed to access router ID %u in DFU mode. Bytes sent: %lu, bytes received: %lu",  v5,  -[AppleTypeCRetimerDFU bytesSent](v22, "bytesSent"),  -[AppleTypeCRetimerDFU bytesReceived](v22, "bytesReceived"));
        }

        else
        {
          -[AppleTypeCRetimerUpdaterHelper log:]( self,  "log:",  @"Unable to create DFU updater for router ID %u",  v5,  v24,  v25);
        }
      }

      -[ACE retimerRemoveForcePower](v7, "retimerRemoveForcePower");
    }

    BOOL v12 = 0;
LABEL_14:

    goto LABEL_15;
  }

  -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", @"Unable to locate ACE for router ID %u", v5);
  BOOL v12 = 0;
LABEL_16:

  return v12;
}

- (BOOL)waitForACEsWithRouterIDs:(id)a3
{
  id v4 = a3;
  +[ACE availableRouterIDs](&OBJC_CLASS___ACE, "availableRouterIDs");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v5 containsAllObjectsIn:v4])
  {
    -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", @"All ACEs are available");
    BOOL v6 = 1;
  }

  else
  {
    -[AppleTypeCRetimerUpdaterHelper log:]( self,  "log:",  @"Waiting for ACEs with routerIDs: %@. Available ACEs: %@.",  v4,  v5);
    [MEMORY[0x189603F50] date];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    sleepMS(500);
    +[ACE availableRouterIDs](&OBJC_CLASS___ACE, "availableRouterIDs");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v8 containsAllObjectsIn:v4])
    {
LABEL_6:
      -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", @"All ACEs are now available.");
      BOOL v6 = 1;
    }

    else
    {
      while (1)
      {
        [MEMORY[0x189603F50] date];
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v9 timeIntervalSinceDate:v7];
        double v11 = v10;

        if (v11 > 10.0) {
          break;
        }

        sleepMS(500);
        +[ACE availableRouterIDs](&OBJC_CLASS___ACE, "availableRouterIDs");
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v8 containsAllObjectsIn:v4]) {
          goto LABEL_6;
        }
      }

      -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", @"Timing out waiting for ACEs. Last available: %@", v8);
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (BOOL)checkDeferredRouterIDs
{
  if (!-[NSMutableArray count](self->_notReadyRouterIDs, "count")) {
    return 1;
  }
  -[AppleTypeCRetimerUpdaterHelper log:](self, "log:", @"Running DFU check for deferred router IDs.");
  return -[AppleTypeCRetimerDFUChecker doCheckForRouterIDList:allowsNotReady:]( self,  "doCheckForRouterIDList:allowsNotReady:",  self->_notReadyRouterIDs,  0LL);
}

- (void).cxx_destruct
{
}

@end