@interface UARPPowerLogManager
- (BOOL)accessoryIDSupportsPowerLogging:(id)a3;
- (UARPPowerLogManager)init;
- (id)createPowerLogAccessoryForAccessoryID:(id)a3;
- (id)pendingReachabilityEventForAccessoryID:(id)a3;
- (id)powerLogAccessoryForAccessoryID:(id)a3;
- (id)powerLogAccessoryForUUID:(id)a3;
- (unsigned)stagingWindowPeriodSeconds;
- (void)addAccessoryID:(id)a3;
- (void)postPendingReachabilityEvent:(id)a3;
- (void)removeAccessoryID:(id)a3;
- (void)setAccessoryIDReachable:(id)a3;
- (void)setAccessoryIDUnreachable:(id)a3;
- (void)setActiveFirmwareVersionForAccessoryID:(id)a3 activeFirmwareVersion:(id)a4;
- (void)setAssetOfferedForAccessoryID:(id)a3 offeredFirmwareVersion:(id)a4 activeFirmwareVersion:(id)a5;
- (void)setStagedFirmwareVersionForAccessoryID:(id)a3 stagedFirmwareVersion:(id)a4;
- (void)setStagingCompleteForAccessoryID:(id)a3 stagedFirmwareVersion:(id)a4 activeFirmareVersion:(id)a5 status:(unint64_t)a6;
- (void)setStagingWindowPeriodSeconds:(unsigned int)a3;
- (void)updateStagingProgressForAccessoryID:(id)a3 requestedOffset:(unsigned int)a4 requestedLength:(unsigned int)a5;
@end

@implementation UARPPowerLogManager

- (UARPPowerLogManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___UARPPowerLogManager;
  v2 = -[UARPPowerLogManager init](&v10, sel_init);
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.accessoryupdater.uarp", "powerLogManager");
    log = v2->_log;
    v2->_log = v3;

    uint64_t v5 = [MEMORY[0x189603FE0] set];
    accessories = v2->_accessories;
    v2->_accessories = (NSMutableSet *)v5;

    uint64_t v7 = [MEMORY[0x189603FE0] set];
    pendingReachableEvents = v2->_pendingReachableEvents;
    v2->_pendingReachableEvents = (NSMutableSet *)v7;

    v2->_stagingWindowPeriodSeconds = 900;
  }

  return v2;
}

- (BOOL)accessoryIDSupportsPowerLogging:(id)a3
{
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = +[UARPSupportedAccessory findByAppleModelNumber:]( &OBJC_CLASS___UARPSupportedAccessory,  "findByAppleModelNumber:",  v3);
    char v5 = [v4 supportsPowerLogging];
  }

  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)createPowerLogAccessoryForAccessoryID:(id)a3
{
  id v4 = a3;
  if (-[UARPPowerLogManager accessoryIDSupportsPowerLogging:](self, "accessoryIDSupportsPowerLogging:", v4))
  {
    char v5 = objc_alloc(&OBJC_CLASS___UARPPowerLogAccessory);
    [v4 modelNumber];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 uuid];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[UARPPowerLogAccessory initWithModelNumber:uuid:stagingWindowPeriodSeconds:]( v5,  "initWithModelNumber:uuid:stagingWindowPeriodSeconds:",  v6,  v7,  self->_stagingWindowPeriodSeconds);
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

- (void)addAccessoryID:(id)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[UARPPowerLogManager createPowerLogAccessoryForAccessoryID:](self, "createPowerLogAccessoryForAccessoryID:", v4);
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (-[NSMutableSet containsObject:](self->_accessories, "containsObject:", v5))
    {
      if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
        -[UARPPowerLogManager addAccessoryID:].cold.1();
      }
    }

    else
    {
      -[NSMutableSet addObject:](self->_accessories, "addObject:", v5);
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
      {
        int v7 = 138412290;
        id v8 = v4;
        _os_log_impl(&dword_187DC0000, log, OS_LOG_TYPE_INFO, "Added: %@", (uint8_t *)&v7, 0xCu);
      }
    }
  }
}

- (id)powerLogAccessoryForUUID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  char v5 = self->_accessories;
  id v6 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        objc_msgSend(v9, "uuid", (void)v13);
        objc_super v10 = (void *)objc_claimAutoreleasedReturnValue();
        char v11 = [v10 isEqual:v4];

        if ((v11 & 1) != 0)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
      if (v6) {
        continue;
      }
      break;
    }
  }

- (id)powerLogAccessoryForAccessoryID:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UARPPowerLogManager powerLogAccessoryForUUID:](self, "powerLogAccessoryForUUID:", v4);
  char v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)pendingReachabilityEventForAccessoryID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  char v5 = self->_pendingReachableEvents;
  id v6 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        objc_msgSend(v9, "uuid", (void)v14);
        objc_super v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v4 uuid];
        char v11 = (void *)objc_claimAutoreleasedReturnValue();
        char v12 = [v10 isEqual:v11];

        if ((v12 & 1) != 0)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
      if (v6) {
        continue;
      }
      break;
    }
  }

- (void)postPendingReachabilityEvent:(id)a3
{
  id v4 = a3;
  -[NSMutableSet removeObject:](self->_pendingReachableEvents, "removeObject:", v4);
  [v4 uuid];
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UARPPowerLogManager powerLogAccessoryForUUID:](self, "powerLogAccessoryForUUID:", v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    [v4 activeFirmwareVersion];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 stagedFirmwareVersion];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setReachableWithActiveFirmwareVersion:v7 stagedFirmwareVersion:v8];
  }

  else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
  {
    -[UARPPowerLogManager postPendingReachabilityEvent:].cold.1();
  }
}

- (void)removeAccessoryID:(id)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[UARPPowerLogManager powerLogAccessoryForAccessoryID:](self, "powerLogAccessoryForAccessoryID:", v4);
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_187DC0000, log, OS_LOG_TYPE_INFO, "Removed: %@", (uint8_t *)&v7, 0xCu);
    }

    -[NSMutableSet removeObject:](self->_accessories, "removeObject:", v5);
  }

  else if (-[UARPPowerLogManager accessoryIDSupportsPowerLogging:](self, "accessoryIDSupportsPowerLogging:", v4) {
         && os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
  }
  {
    -[UARPPowerLogManager removeAccessoryID:].cold.1();
  }
}

- (void)setAccessoryIDReachable:(id)a3
{
  id v4 = a3;
  -[UARPPowerLogManager powerLogAccessoryForAccessoryID:](self, "powerLogAccessoryForAccessoryID:", v4);
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  if (v5)
  {
    if ([v5 reachable])
    {
      if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
        -[UARPPowerLogManager setAccessoryIDReachable:].cold.2();
      }
    }

    else
    {
      int v7 = objc_alloc(&OBJC_CLASS___UARPPowerLogPendingReachabilityEvent);
      [v4 modelNumber];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 uuid];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      id v10 = -[UARPPowerLogPendingReachabilityEvent initModelNumber:uuid:](v7, "initModelNumber:uuid:", v8, v9);

      -[NSMutableSet addObject:](self->_pendingReachableEvents, "addObject:", v10);
    }
  }

  else if (-[UARPPowerLogManager accessoryIDSupportsPowerLogging:](self, "accessoryIDSupportsPowerLogging:", v4) {
         && os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
  }
  {
    -[UARPPowerLogManager setAccessoryIDReachable:].cold.1();
  }
}

- (void)setStagedFirmwareVersionForAccessoryID:(id)a3 stagedFirmwareVersion:(id)a4
{
  id v8 = a4;
  -[UARPPowerLogManager pendingReachabilityEventForAccessoryID:](self, "pendingReachabilityEventForAccessoryID:", a3);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = v6;
  if (v6)
  {
    [v6 setStagedFirmwareVersion:v8];
  }
}

- (void)setActiveFirmwareVersionForAccessoryID:(id)a3 activeFirmwareVersion:(id)a4
{
  id v8 = a4;
  -[UARPPowerLogManager pendingReachabilityEventForAccessoryID:](self, "pendingReachabilityEventForAccessoryID:", a3);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = v6;
  if (v6)
  {
    [v6 setActiveFirmwareVersion:v8];
  }
}

- (void)setAccessoryIDUnreachable:(id)a3
{
  id v4 = a3;
  -[UARPPowerLogManager powerLogAccessoryForAccessoryID:](self, "powerLogAccessoryForAccessoryID:", v4);
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  if (v5)
  {
    if ([v5 reachable])
    {
      [v6 setUnreachable];
    }

    else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
    {
      -[UARPPowerLogManager setAccessoryIDUnreachable:].cold.2();
    }
  }

  else if (-[UARPPowerLogManager accessoryIDSupportsPowerLogging:](self, "accessoryIDSupportsPowerLogging:", v4) {
         && os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
  }
  {
    -[UARPPowerLogManager setAccessoryIDUnreachable:].cold.1();
  }
}

- (void)setAssetOfferedForAccessoryID:(id)a3 offeredFirmwareVersion:(id)a4 activeFirmwareVersion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  -[UARPPowerLogManager powerLogAccessoryForAccessoryID:](self, "powerLogAccessoryForAccessoryID:", a3);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  char v11 = v10;
  if (v10)
  {
    if ([v10 reachable])
    {
      if ([v11 stagingInProgress])
      {
        if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
          -[UARPPowerLogManager setAssetOfferedForAccessoryID:offeredFirmwareVersion:activeFirmwareVersion:].cold.1();
        }
      }

      else if (v8)
      {
        if (v9)
        {
          [v11 setAssetOfferedWithVersion:v8 activeFirmwareVersion:v9];
        }

        else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
        {
          -[UARPPowerLogManager setAssetOfferedForAccessoryID:offeredFirmwareVersion:activeFirmwareVersion:].cold.3();
        }
      }

      else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
      {
        -[UARPPowerLogManager setAssetOfferedForAccessoryID:offeredFirmwareVersion:activeFirmwareVersion:].cold.2();
      }
    }

    else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
    {
      -[UARPPowerLogManager setAssetOfferedForAccessoryID:offeredFirmwareVersion:activeFirmwareVersion:].cold.4();
    }
  }
}

- (void)setStagingCompleteForAccessoryID:(id)a3 stagedFirmwareVersion:(id)a4 activeFirmareVersion:(id)a5 status:(unint64_t)a6
{
  id v10 = a3;
  char v11 = (__CFString *)a4;
  char v12 = (__CFString *)a5;
  -[UARPPowerLogManager powerLogAccessoryForAccessoryID:](self, "powerLogAccessoryForAccessoryID:", v10);
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v14 = v13;
  if (v13)
  {
    if ([v13 stagingInProgress])
    {
      if (v11)
      {
        if (v12)
        {
LABEL_14:
          [v14 setStagingCompleteForStagedFirmareVersion:v11 activeFirmareVersion:v12 status:a6];
          goto LABEL_15;
        }
      }

      else
      {
        if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
          -[UARPPowerLogManager setStagingCompleteForAccessoryID:stagedFirmwareVersion:activeFirmareVersion:status:].cold.2();
        }
        char v11 = &stru_18A143E70;
        if (v12) {
          goto LABEL_14;
        }
      }

      if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
        -[UARPPowerLogManager setStagingCompleteForAccessoryID:stagedFirmwareVersion:activeFirmareVersion:status:].cold.1();
      }
      char v12 = &stru_18A143E70;
      goto LABEL_14;
    }

    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      -[UARPPowerLogManager setStagingCompleteForAccessoryID:stagedFirmwareVersion:activeFirmareVersion:status:].cold.3();
    }
  }

- (void)updateStagingProgressForAccessoryID:(id)a3 requestedOffset:(unsigned int)a4 requestedLength:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  -[UARPPowerLogManager powerLogAccessoryForAccessoryID:](self, "powerLogAccessoryForAccessoryID:", a3);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v8;
  if (v8)
  {
    if ([v8 stagingInProgress])
    {
      [v9 updateStagingProgressWithRequestedOffset:v6 requestedLength:v5];
    }

    else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
    {
      -[UARPPowerLogManager updateStagingProgressForAccessoryID:requestedOffset:requestedLength:].cold.1();
    }
  }
}

- (unsigned)stagingWindowPeriodSeconds
{
  return self->_stagingWindowPeriodSeconds;
}

- (void)setStagingWindowPeriodSeconds:(unsigned int)a3
{
  self->_stagingWindowPeriodSeconds = a3;
}

- (void).cxx_destruct
{
}

- (void)addAccessoryID:.cold.1()
{
}

- (void)postPendingReachabilityEvent:.cold.1()
{
}

- (void)removeAccessoryID:.cold.1()
{
}

- (void)setAccessoryIDReachable:.cold.1()
{
}

- (void)setAccessoryIDReachable:.cold.2()
{
}

- (void)setAccessoryIDUnreachable:.cold.1()
{
}

- (void)setAccessoryIDUnreachable:.cold.2()
{
}

- (void)setAssetOfferedForAccessoryID:offeredFirmwareVersion:activeFirmwareVersion:.cold.1()
{
}

- (void)setAssetOfferedForAccessoryID:offeredFirmwareVersion:activeFirmwareVersion:.cold.2()
{
}

- (void)setAssetOfferedForAccessoryID:offeredFirmwareVersion:activeFirmwareVersion:.cold.3()
{
}

- (void)setAssetOfferedForAccessoryID:offeredFirmwareVersion:activeFirmwareVersion:.cold.4()
{
}

- (void)setStagingCompleteForAccessoryID:stagedFirmwareVersion:activeFirmareVersion:status:.cold.1()
{
}

- (void)setStagingCompleteForAccessoryID:stagedFirmwareVersion:activeFirmareVersion:status:.cold.2()
{
}

- (void)setStagingCompleteForAccessoryID:stagedFirmwareVersion:activeFirmareVersion:status:.cold.3()
{
}

- (void)updateStagingProgressForAccessoryID:requestedOffset:requestedLength:.cold.1()
{
}

@end