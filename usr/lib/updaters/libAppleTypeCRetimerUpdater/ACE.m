@interface ACE
+ (id)availableRouterIDs;
- (ACE)initWithRouterID:(unsigned __int8)a3;
- (BOOL)dfufTaskRunning;
- (BOOL)disableDFUfTaskIfActive;
- (BOOL)executeIECSCommand:(unsigned int)a3 withData:(char *)a4 dataLength:(unsigned int)a5;
- (BOOL)executeTask:(id)a3;
- (BOOL)initForRouterID:(unsigned __int8)a3;
- (BOOL)retimerEnterDFULegacy;
- (BOOL)retimerEnterForceDFU:(BOOL)a3;
- (BOOL)retimerExitForceDFU;
- (BOOL)retimerRemoveForcePower;
- (NSString)chipInfo;
- (int)retimerEnterDFU;
- (int)retimerForcePower;
- (void)dfufTaskRunning;
- (void)disableDFUfTaskIfActive;
- (void)retimerEnterDFULegacy;
- (void)retimerExitDFU;
- (void)retimerForcePower;
@end

@implementation ACE

+ (id)availableRouterIDs
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  v2 = +[IECSInterface_GoldRestore2 locatedDevices](&OBJC_CLASS___IECSInterface_GoldRestore2, "locatedDevices");
  [MEMORY[0x189603FA8] array];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v8), "rid", (void)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9) {
          [v3 addObject:v9];
        }

        ++v8;
      }

      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v6);
  }

  [MEMORY[0x189603F18] arrayWithArray:v3];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (ACE)initWithRouterID:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ACE;
  id v4 = -[ACE init](&v12, sel_init);
  uint64_t v5 = v4;
  if (v4)
  {
    if (!-[ACE initForRouterID:](v4, "initForRouterID:", v3))
    {
      v10 = 0LL;
      goto LABEL_6;
    }

    os_log_t v6 = os_log_create("com.apple.accessoryupdater.atcrt", "ace");
    log = v5->_log;
    v5->_log = v6;

    v5->_routerID = v3;
    uint64_t v8 = -[AppleTypeCRetimerHPM initWithHPMService:routerID:deviceService:]( objc_alloc(&OBJC_CLASS___AppleTypeCRetimerHPM),  "initWithHPMService:routerID:deviceService:",  -[IECSInterface_GoldRestore2 service](v5->_interface, "service"),  v3,  -[IECSInterface_GoldRestore2 deviceService](v5->_interface, "deviceService"));
    hpm = v5->_hpm;
    v5->_hpm = v8;
  }

  v10 = v5;
LABEL_6:

  return v10;
}

- (BOOL)initForRouterID:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v21 = *MEMORY[0x1895F89C0];
  +[IECSInterface_GoldRestore2 sharedInstance](&OBJC_CLASS___IECSInterface_GoldRestore2, "sharedInstance");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  objc_msgSend(v5, "locatedObjects", 0);
  os_log_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        [v11 rid];
        objc_super v12 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v13 = v12;
        if (v12 && [v12 unsignedCharValue] == v3)
        {
          objc_storeStrong((id *)&self->_interface, v11);

          BOOL v14 = 1;
          goto LABEL_12;
        }
      }

      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  BOOL v14 = 0;
LABEL_12:

  return v14;
}

- (BOOL)executeIECSCommand:(unsigned int)a3 withData:(char *)a4 dataLength:(unsigned int)a5
{
  uint64_t v7 = *(void *)&a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
    -[ACE executeIECSCommand:withData:dataLength:].cold.2(log, v7);
  }
  uint64_t v10 = -[IECSInterface_GoldRestore2 iecsAtomicCommand:data:dataLength:retData:retDataLength:flags:timeout:]( self->_interface,  "iecsAtomicCommand:data:dataLength:retData:retDataLength:flags:timeout:",  v7,  a4,  a5,  0LL,  0LL,  0LL,  10LL);
  if ((_DWORD)v10)
  {
    v11 = self->_log;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ACE executeIECSCommand:withData:dataLength:].cold.1(v11, v10);
    }
  }

  return (_DWORD)v10 == 0;
}

- (BOOL)disableDFUfTaskIfActive
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (!-[ACE dfufTaskRunning](self, "dfufTaskRunning")) {
    return 1;
  }
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    int routerID = self->_routerID;
    int v10 = 136315394;
    v11 = "-[ACE disableDFUfTaskIfActive]";
    __int16 v12 = 1024;
    int v13 = routerID;
    _os_log_impl( &dword_189540000,  log,  OS_LOG_TYPE_INFO,  "%s: Detected that ACE is in DFU mode. [RID %u]",  (uint8_t *)&v10,  0x12u);
  }

  uint64_t v5 = -[ACETaskCommandDFUf initWithForceDFUMode:allowOnlyIfConnected:]( objc_alloc(&OBJC_CLASS___ACETaskCommandDFUf),  "initWithForceDFUMode:allowOnlyIfConnected:",  0LL,  0LL);
  BOOL v6 = -[ACE executeTask:](self, "executeTask:", v5);
  uint64_t v7 = self->_log;
  if (v6)
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_INFO))
    {
      int v8 = self->_routerID;
      int v10 = 136315394;
      v11 = "-[ACE disableDFUfTaskIfActive]";
      __int16 v12 = 1024;
      int v13 = v8;
      _os_log_impl( &dword_189540000,  v7,  OS_LOG_TYPE_INFO,  "%s: ACE DFU mode has been disabled. [RID %u]",  (uint8_t *)&v10,  0x12u);
    }
  }

  else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
  {
    -[ACE disableDFUfTaskIfActive].cold.1();
  }

  return v6;
}

- (BOOL)retimerEnterDFULegacy
{
  if (!-[ACE disableDFUfTaskIfActive](self, "disableDFUfTaskIfActive")
    && os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
  {
    -[ACE retimerEnterDFULegacy].cold.3();
  }

  int v3 = -[ACETaskCommandVOUT initWithEnabled:forceDFU:]( objc_alloc(&OBJC_CLASS___ACETaskCommandVOUT),  "initWithEnabled:forceDFU:",  1LL,  1LL);
  if (-[ACE executeTask:](self, "executeTask:", v3))
  {
    sleepMS(100);
    if (!-[ACE retimerForcePower](self, "retimerForcePower"))
    {
      BOOL v4 = 1;
      goto LABEL_11;
    }

    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      -[ACE retimerEnterDFULegacy].cold.1();
    }
  }

  else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
  {
    -[ACE retimerEnterDFULegacy].cold.2();
  }

  BOOL v4 = 0;
LABEL_11:

  return v4;
}

- (int)retimerEnterDFU
{
  hpm = self->_hpm;
  if (hpm) {
    return -[AppleTypeCRetimerHPM forceUpdateMode:](hpm, "forceUpdateMode:", 1LL);
  }
  if (-[ACE retimerEnterDFULegacy](self, "retimerEnterDFULegacy")) {
    return 0;
  }
  return -536870212;
}

- (BOOL)dfufTaskRunning
{
  int v5 = 0;
  if (-[IECSInterface_GoldRestore2 iecsReadForAddress:buffer:length:flags:andOutReadLength:]( self->_interface,  "iecsReadForAddress:buffer:length:flags:andOutReadLength:",  3LL,  &v5,  4LL,  0LL,  0LL))
  {
    BOOL v3 = os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR);
    if (v3)
    {
      -[ACE dfufTaskRunning].cold.1();
      LOBYTE(v3) = 0;
    }
  }

  else
  {
    LOBYTE(v3) = v5 == 1716864580;
  }

  return v3;
}

- (void)retimerExitDFU
{
  hpm = self->_hpm;
  if (hpm)
  {
    -[AppleTypeCRetimerHPM forceUpdateMode:](hpm, "forceUpdateMode:", 0LL);
  }

  else
  {
    -[ACE retimerExitForceDFU](self, "retimerExitForceDFU");
    -[ACE retimerRemoveForcePower](self, "retimerRemoveForcePower");
  }

- (int)retimerForcePower
{
  hpm = self->_hpm;
  if (hpm)
  {
    int result = -[AppleTypeCRetimerHPM forceRetimerPower:](hpm, "forceRetimerPower:", 1LL);
    if (result) {
      return result;
    }
    goto LABEL_8;
  }

  if (!-[ACE disableDFUfTaskIfActive](self, "disableDFUfTaskIfActive")
    && os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
  {
    -[ACE retimerForcePower].cold.1();
  }

  int v5 = -[ACETaskCommandVOUT initWithEnabled:forceDFU:]( objc_alloc(&OBJC_CLASS___ACETaskCommandVOUT),  "initWithEnabled:forceDFU:",  1LL,  0LL);
  BOOL v6 = -[ACE executeTask:](self, "executeTask:", v5);

  if (v6)
  {
LABEL_8:
    sleep(1u);
    return 0;
  }

  return -536870212;
}

- (BOOL)retimerRemoveForcePower
{
  hpm = self->_hpm;
  if (hpm) {
    return -[AppleTypeCRetimerHPM forceRetimerPower:](hpm, "forceRetimerPower:", 0LL) == 0;
  }
  int v5 = -[ACETaskCommandVOUT initWithEnabled:forceDFU:]( objc_alloc(&OBJC_CLASS___ACETaskCommandVOUT),  "initWithEnabled:forceDFU:",  0LL,  0LL);
  BOOL v6 = -[ACE executeTask:](self, "executeTask:", v5);

  return v6;
}

- (BOOL)retimerExitForceDFU
{
  if (!self->_isForceDFUModeEnabled) {
    return 1;
  }
  if (self->_hpm) {
    return -[AppleTypeCRetimerHPM forceUpdateMode:](self->_hpm, "forceUpdateMode:", 0LL) == 0;
  }
  return -[ACE retimerEnterForceDFU:](self, "retimerEnterForceDFU:", 0LL);
}

- (BOOL)retimerEnterForceDFU:(BOOL)a3
{
  int v5 = -[HPMForceRetimerDFUModeSetter initWithHPMService:deviceService:enableDFUMode:]( objc_alloc(&OBJC_CLASS___HPMForceRetimerDFUModeSetter),  "initWithHPMService:deviceService:enableDFUMode:",  -[IECSInterface_GoldRestore2 service](self->_interface, "service"),  -[IECSInterface_GoldRestore2 deviceService](self->_interface, "deviceService"),  a3);
  BOOL v6 = -[HPMForceRetimerDFUModeSetter doSet](v5, "doSet");
  self->_isForceDFUModeEnabled = v6 ^ a3 ^ 1;

  return v6;
}

- (BOOL)executeTask:(id)a3
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v5 = [v4 code];
  id v6 = [v4 inputData];
  uint64_t v7 = [v6 bytes];
  [v4 inputData];
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = -[ACE executeIECSCommand:withData:dataLength:]( self,  "executeIECSCommand:withData:dataLength:",  v5,  v7,  [v8 length]);

  if ((v5 & 1) == 0)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[ACE executeTask:].cold.1(log, v4, (uint64_t)self);
    }
    goto LABEL_7;
  }

  char v24 = 0;
  uint64_t v9 = -[IECSInterface_GoldRestore2 iecsReadForAddress:buffer:length:flags:andOutReadLength:]( self->_interface,  "iecsReadForAddress:buffer:length:flags:andOutReadLength:",  9LL,  &v24,  1LL,  0LL,  0LL);
  if ((_DWORD)v9)
  {
    uint64_t v10 = v9;
    v11 = self->_log;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      __int16 v12 = v11;
      [v4 codeString];
      int v13 = (void *)objc_claimAutoreleasedReturnValue();
      stringForUpdateStatus(v10);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      int routerID = self->_routerID;
      *(_DWORD *)buf = 138412802;
      v26 = v13;
      __int16 v27 = 2112;
      *(void *)v28 = v14;
      *(_WORD *)&v28[8] = 1024;
      *(_DWORD *)&v28[10] = routerID;
      _os_log_error_impl( &dword_189540000,  v12,  OS_LOG_TYPE_ERROR,  "Failed to query task result status for %@ (%@) [RID %u]",  buf,  0x1Cu);

LABEL_12:
    }
  }

  else
  {
    unsigned int v19 = v24 & 0xF;
    if (!v19)
    {
      BOOL v17 = 1;
      goto LABEL_8;
    }

    v20 = self->_log;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      __int16 v12 = v20;
      [v4 codeString];
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = stringForACETaskResult(v19);
      int v23 = self->_routerID;
      *(_DWORD *)buf = 138413058;
      v26 = v21;
      __int16 v27 = 1024;
      *(_DWORD *)v28 = v19;
      *(_WORD *)&v28[4] = 2080;
      *(void *)&v28[6] = v22;
      __int16 v29 = 1024;
      int v30 = v23;
      _os_log_error_impl( &dword_189540000,  v12,  OS_LOG_TYPE_ERROR,  "Task %@ failed to execute: 0x%02x (%s) [RID %u]",  buf,  0x22u);

      goto LABEL_12;
    }
  }

- (NSString)chipInfo
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = -[IECSInterface_GoldRestore2 rid](self->_interface, "rid");
  uint64_t v5 = (void *)v4;
  if (v4) {
    [v3 appendFormat:@"\tRID: %@\n", v4];
  }
  int v11 = 0;
  if (!-[IECSInterface_GoldRestore2 iecsReadForAddress:buffer:length:flags:andOutReadLength:]( self->_interface,  "iecsReadForAddress:buffer:length:flags:andOutReadLength:",  1LL,  &v11,  4LL,  0LL,  0LL)) {
    objc_msgSend(v3, "appendFormat:", @"\tID: %s\n", stringForACEDeviceID(v11));
  }
  unsigned int v10 = 0;
  if (!-[IECSInterface_GoldRestore2 iecsReadForAddress:buffer:length:flags:andOutReadLength:]( self->_interface,  "iecsReadForAddress:buffer:length:flags:andOutReadLength:",  4LL,  &v10,  4LL,  0LL,  0LL)) {
    objc_msgSend(v3, "appendFormat:", @"\tType: %s\n", stringForACEDeviceType(bswap32(v10)));
  }
  unsigned int v9 = 0;
  if (!-[IECSInterface_GoldRestore2 iecsReadForAddress:buffer:length:flags:andOutReadLength:]( self->_interface,  "iecsReadForAddress:buffer:length:flags:andOutReadLength:",  3LL,  &v9,  4LL,  0LL,  0LL)) {
    objc_msgSend(v3, "appendFormat:", @"\tMode: %s\n", stringForACEDeviceMode(bswap32(v9)));
  }
  int v8 = 0;
  if (!-[IECSInterface_GoldRestore2 iecsReadForAddress:buffer:length:flags:andOutReadLength:]( self->_interface,  "iecsReadForAddress:buffer:length:flags:andOutReadLength:",  15LL,  &v8,  4LL,  0LL,  0LL)) {
    objc_msgSend( v3,  "appendFormat:",  @"\tFirmware Version: %02X%01X.%01X%02X.%02X\n",  HIBYTE(v8),  BYTE2(v8) >> 4,  BYTE2(v8) & 0xF,  BYTE1(v8),  v8);
  }
  [NSString stringWithDescString:v3];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void).cxx_destruct
{
}

- (void)executeIECSCommand:(void *)a1 withData:(uint64_t)a2 dataLength:.cold.1(void *a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  BOOL v3 = a1;
  stringForUpdateStatus(a2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315650;
  OUTLINED_FUNCTION_2_3();
  _os_log_error_impl( &dword_189540000,  v3,  OS_LOG_TYPE_ERROR,  "%s: command request failed (%@) [RID %u]",  (uint8_t *)v5,  0x1Cu);

  OUTLINED_FUNCTION_0_1();
}

- (void)executeIECSCommand:(void *)a1 withData:(int)a2 dataLength:.cold.2(void *a1, int a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  BOOL v3 = a1;
  stringForFourCharCode(a2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315650;
  OUTLINED_FUNCTION_2_3();
  _os_log_debug_impl(&dword_189540000, v3, OS_LOG_TYPE_DEBUG, "%s: %@ [RID %u]", (uint8_t *)v5, 0x1Cu);

  OUTLINED_FUNCTION_0_1();
}

- (void)disableDFUfTaskIfActive
{
}

- (void)retimerEnterDFULegacy
{
}

- (void)dfufTaskRunning
{
}

- (void)retimerForcePower
{
}

- (void)executeTask:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v5 = a1;
  [a2 codeString];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = *(unsigned __int8 *)(a3 + 24);
  int v8 = 138412546;
  unsigned int v9 = v6;
  __int16 v10 = 1024;
  int v11 = v7;
  _os_log_error_impl( &dword_189540000,  v5,  OS_LOG_TYPE_ERROR,  "%@ task failed to execute [RID %u]",  (uint8_t *)&v8,  0x12u);
}

@end