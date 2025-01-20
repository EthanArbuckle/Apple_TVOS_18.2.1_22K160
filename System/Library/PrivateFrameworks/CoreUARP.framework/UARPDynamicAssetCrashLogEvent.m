@interface UARPDynamicAssetCrashLogEvent
+ (id)tag;
- (BOOL)decomposeUARP;
- (BOOL)expandCRSHPayloads;
- (BOOL)expandToDirectory:(id)a3 forRemoteEndpoint:(id)a4;
- (BOOL)findMatchingCMAP;
- (BOOL)getCoreName:(id)a3 inPayload:(id)a4;
- (BOOL)processCrashAdditionalInfo;
- (BOOL)processCrashInstance;
- (NSString)appleModelNumber;
- (UARPDynamicAssetCrashLogEvent)init;
- (UARPDynamicAssetCrashLogEvent)initWithURL:(id)a3;
- (id)description;
- (uint64_t)decomposeUARP;
- (void)decomposeUARP;
- (void)expandCRSHPayloads;
- (void)findMatchingCMAP;
- (void)processCrashAdditionalInfo;
- (void)processCrashInstance;
- (void)sendSpeedTracer;
- (void)setAppleModelNumber:(id)a3;
@end

@implementation UARPDynamicAssetCrashLogEvent

- (UARPDynamicAssetCrashLogEvent)init
{
  return 0LL;
}

- (UARPDynamicAssetCrashLogEvent)initWithURL:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___UARPDynamicAssetCrashLogEvent;
  v6 = -[UARPDynamicAssetCrashLogEvent init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    os_log_t v8 = os_log_create("com.apple.accessoryupdater.uarp", "crsh");
    log = v7->_log;
    v7->_log = v8;
  }

  return v7;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x189607940]);
  v4 = v3;
  uint64_t v5 = 9LL;
  if (!self->_cmapDatabase) {
    uint64_t v5 = 4LL;
  }
  [v3 appendFormat:@"Crash Analytics Event %@\n", (&self->super.isa)[v5]];
  return v4;
}

- (void)sendSpeedTracer
{
}

uint64_t __48__UARPDynamicAssetCrashLogEvent_sendSpeedTracer__block_invoke(uint64_t a1, void *a2)
{
  return [a2 writeData:*(void *)(*(void *)(a1 + 32) + 64)];
}

- (BOOL)expandToDirectory:(id)a3 forRemoteEndpoint:(id)a4
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  [v7 appleModelNumber];
  os_log_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 serialNumber];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  UARPStringCrashAnalyticsDirectoryFilePath();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  UARPUniqueFilename(v8, v9, v10, @"CRSH", @".json");
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)[objc_alloc(MEMORY[0x189604030]) initWithString:v11];
  int v13 = UARPWriteFile(self->_processedCrashInstanceData, v12);
  if (v13)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      v15 = log;
      [v12 path];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      int v20 = 136315394;
      v21 = "-[UARPDynamicAssetCrashLogEvent expandToDirectory:forRemoteEndpoint:]";
      __int16 v22 = 2112;
      v23 = v16;
      _os_log_impl( &dword_187DC0000,  v15,  OS_LOG_TYPE_INFO,  "%s: Successfully Expanded CRSH to File: %@",  (uint8_t *)&v20,  0x16u);
    }

    if (v6)
    {
      UARPStringCrashAnalyticsDirectoryFilePath();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 path];
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      UARPCopyFile((uint64_t)v17, v18, v11);
    }
  }

  return v13;
}

- (BOOL)decomposeUARP
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  uint64_t v3 = -[UARPSuperBinaryAsset initWithURL:](objc_alloc(&OBJC_CLASS___UARPSuperBinaryAsset), "initWithURL:", self->_url);
  asset = self->_asset;
  self->_asset = v3;

  if (!-[UARPSuperBinaryAsset expandHeadersAndTLVs:](self->_asset, "expandHeadersAndTLVs:", 0LL)
    || !-[UARPDynamicAssetCrashLogEvent processCrashAdditionalInfo](self, "processCrashAdditionalInfo"))
  {
    return 0;
  }

  uint64_t v5 = (NSMutableArray *)objc_opt_new();
  preProcessedCrashLogs = self->_preProcessedCrashLogs;
  self->_preProcessedCrashLogs = v5;

  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  -[UARPSuperBinaryAsset payloads](self->_asset, "payloads");
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [obj countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v7)
  {
    uint64_t v26 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v30 != v26) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v10 = +[UARPDynamicAssetCrashLogEvent tag](&OBJC_CLASS___UARPDynamicAssetCrashLogEvent, "tag");
        [v9 payloadTag];
        objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();
        int v12 = [v11 isEqual:v10];

        if (v12)
        {
          [MEMORY[0x189603FC8] dictionary];
          int v13 = (void *)objc_claimAutoreleasedReturnValue();
          id v14 = objc_alloc_init(MEMORY[0x189607940]);
          if (-[UARPDynamicAssetCrashLogEvent getCoreName:inPayload:](self, "getCoreName:inPayload:", v14, v9))
          {
            v15 = (void *)[v14 copy];
            [v13 setObject:v15 forKeyedSubscript:@"core"];

            [v9 rangePayload];
            v17 = -[UARPSuperBinaryAsset payloadData:range:error:]( self->_asset,  "payloadData:range:error:",  v9,  0LL,  v16,  0LL);
            if (!v17)
            {
              if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
                -[UARPDynamicAssetCrashLogEvent decomposeUARP].cold.1();
              }

              BOOL v23 = 0;
              goto LABEL_27;
            }

            uint64_t v34 = 0LL;
            v35 = &v34;
            uint64_t v36 = 0x2020000000LL;
            v18 = (void (*)(void *))getRTBuddyCrashlogDecodeSymbolLoc_ptr;
            v37 = getRTBuddyCrashlogDecodeSymbolLoc_ptr;
            if (!getRTBuddyCrashlogDecodeSymbolLoc_ptr)
            {
              v33[0] = MEMORY[0x1895F87A8];
              v33[1] = 3221225472LL;
              v33[2] = __getRTBuddyCrashlogDecodeSymbolLoc_block_invoke;
              v33[3] = &unk_18A143128;
              v33[4] = &v34;
              __getRTBuddyCrashlogDecodeSymbolLoc_block_invoke((uint64_t)v33);
              v18 = (void (*)(void *))v35[3];
            }

            _Block_object_dispose(&v34, 8);
            if (!v18)
            {
              -[UARPDynamicAssetCrashLogEvent decomposeUARP].cold.2();
              __break(1u);
            }

            v18(v17);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19)
            {
              [v13 setObject:v19 forKeyedSubscript:@"crashlog"];
              int v20 = self->_preProcessedCrashLogs;
              v21 = (void *)[v13 copy];
              -[NSMutableArray addObject:](v20, "addObject:", v21);
            }

            else
            {
              log = self->_log;
              if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
                -[UARPDynamicAssetCrashLogEvent decomposeUARP].cold.3(&buf, v28, log);
              }
            }
          }
        }
      }

      uint64_t v7 = [obj countByEnumeratingWithState:&v29 objects:v38 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  BOOL v23 = 1;
LABEL_27:

  return v23;
}

- (BOOL)processCrashInstance
{
  v47[2] = *MEMORY[0x1895F89C0];
  if (!-[UARPDynamicAssetCrashLogEvent findMatchingCMAP](self, "findMatchingCMAP")) {
    return 0;
  }
  [MEMORY[0x189603FC8] dictionary];
  uint64_t v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  processedCrashInstance = self->_processedCrashInstance;
  self->_processedCrashInstance = v3;

  v46[0] = @"role";
  v46[1] = @"side";
  v47[0] = @"case";
  [MEMORY[0x189603FE8] null];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = v5;
  uint64_t v6 = [MEMORY[0x189603F68] dictionaryWithObjects:v47 forKeys:v46 count:2];

  BOOL testMode = self->_testMode;
  v38 = self->_processedCrashInstance;
  v44[0] = @"bug_type";
  v44[1] = @"UI_country_code";
  v45[0] = @"305";
  v45[1] = @"US";
  v44[2] = @"log_version";
  v44[3] = @"accessory_type";
  v45[2] = @"1.0";
  v45[3] = @"audio";
  v35 = (void *)v6;
  v45[4] = v6;
  v44[4] = @"application-info";
  v44[5] = @"accessory_pid";
  [MEMORY[0x189607968] numberWithUnsignedInt:self->_productId];
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v45[5] = v40;
  v44[6] = @"analytics_test_mode";
  [MEMORY[0x189607968] numberWithBool:testMode];
  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
  v45[6] = v39;
  v44[7] = @"crashlogs";
  v37 = (void *)objc_opt_new();
  v45[7] = v37;
  v44[8] = @"accessory_crashreporter_key";
  [MEMORY[0x189603FE8] null];
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
  v45[8] = v36;
  v44[9] = @"accessory_os_version";
  [MEMORY[0x189603FE8] null];
  os_log_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v45[9] = v8;
  v44[10] = @"accessory_os_train";
  [MEMORY[0x189603FE8] null];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v45[10] = v9;
  v44[11] = @"accessory_machine_config";
  v10 = (void *)-[NSString copy](self->_appleModelNumber, "copy");
  v45[11] = v10;
  v44[12] = @"accessory_release_type";
  [MEMORY[0x189603FE8] null];
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();
  v45[12] = v11;
  v44[13] = @"usage_since_last_crash";
  [MEMORY[0x189603FE8] null];
  int v12 = (void *)objc_claimAutoreleasedReturnValue();
  v45[13] = v12;
  v44[14] = @"usage_since_last_crash_user_facing";
  [MEMORY[0x189603FE8] null];
  int v13 = (void *)objc_claimAutoreleasedReturnValue();
  v45[14] = v13;
  v44[15] = @"usage_since_last_crash_in_ear";
  [MEMORY[0x189603FE8] null];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  v45[15] = v14;
  v44[16] = @"accessory_fusing";
  [MEMORY[0x189603FE8] null];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v45[16] = v15;
  [MEMORY[0x189603F68] dictionaryWithObjects:v45 forKeys:v44 count:17];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setDictionary:](v38, "setDictionary:", v16);

  if (-[UARPDynamicAssetCrashLogEvent expandCRSHPayloads](self, "expandCRSHPayloads"))
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_processedCrashInstance,  "setObject:forKeyedSubscript:",  self->_processedCrashLogs,  @"crashlogs");
    v17 = self->_processedCrashInstance;
    id v41 = 0LL;
    [MEMORY[0x1896078D8] dataWithJSONObject:v17 options:1 error:&v41];
    v18 = (NSData *)objc_claimAutoreleasedReturnValue();
    id v19 = v41;
    processedCrashInstanceData = self->_processedCrashInstanceData;
    self->_processedCrashInstanceData = v18;

    if (self->_processedCrashInstanceData) {
      BOOL v21 = v19 == 0LL;
    }
    else {
      BOOL v21 = 0;
    }
    BOOL v22 = v21;
    log = self->_log;
    if (v21)
    {
      if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
      {
        uint64_t v24 = self->_processedCrashInstance;
        *(_DWORD *)uint8_t buf = 138412290;
        v43 = v24;
        _os_log_impl(&dword_187DC0000, log, OS_LOG_TYPE_INFO, "Successfully expanded CRSH Dynamic Asset: %@", buf, 0xCu);
      }
    }

    else if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      -[UARPDynamicAssetCrashLogEvent processCrashInstance].cold.1();
    }
  }

  else
  {
    v25 = self->_log;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[UARPDynamicAssetCrashLogEvent processCrashInstance].cold.2(v25, v26, v27, v28, v29, v30, v31, v32);
    }
    BOOL v22 = 0;
  }

  return v22;
}

- (BOOL)expandCRSHPayloads
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  uint64_t v3 = -[UARPDynamicAssetCmapDatabase initCmapDatabase:]( objc_alloc(&OBJC_CLASS___UARPDynamicAssetCmapDatabase),  "initCmapDatabase:",  0LL);
  cmapDatabase = self->_cmapDatabase;
  self->_cmapDatabase = v3;

  if (self->_cmapDatabase)
  {
    uint64_t v5 = (NSMutableArray *)objc_opt_new();
    processedCrashLogs = self->_processedCrashLogs;
    self->_processedCrashLogs = v5;

    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id obj = self->_preProcessedCrashLogs;
    uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v28,  v32,  16LL);
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v27 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v29 != v27) {
            objc_enumerationMutation(obj);
          }
          v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          [v10 objectForKeyedSubscript:@"core"];
          objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();
          int v12 = (void *)objc_opt_new();
          int v13 = self->_cmapDatabase;
          [v10 objectForKeyedSubscript:@"crashlog"];
          id v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = -[UARPDynamicAssetCmapDatabase expandCrshData:withAppleModelNumber:]( v13,  "expandCrshData:withAppleModelNumber:",  v14,  self->_appleModelNumber);
          if (!v15)
          {
            if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
              -[UARPDynamicAssetCrashLogEvent expandCRSHPayloads].cold.2();
            }

            BOOL v16 = 0;
            goto LABEL_14;
          }

          [v12 setObject:v15 forKeyedSubscript:@"crashlog"];
          [v12 setObject:v11 forKeyedSubscript:@"core"];
          -[NSMutableArray addObject:](self->_processedCrashLogs, "addObject:", v12);
        }

        uint64_t v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v28,  v32,  16LL);
        if (v8) {
          continue;
        }
        break;
      }
    }

    BOOL v16 = 1;
LABEL_14:
  }

  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[UARPDynamicAssetCrashLogEvent expandCRSHPayloads].cold.1(log, v18, v19, v20, v21, v22, v23, v24);
    }
    return 0;
  }

  return v16;
}

- (BOOL)getCoreName:(id)a3 inPayload:(id)a4
{
  id v5 = a3;
  [a4 tlvs];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  4042160640LL,  v6);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    [v7 valueAsString];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v9 = v8 != 0LL;
    if (v8)
    {
      [v5 setString:v8];
    }

    else
    {
      BOOL v18 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v18) {
        -[UARPDynamicAssetCrashLogEvent getCoreName:inPayload:].cold.2(v18, v19, v20, v21, v22, v23, v24, v25);
      }
    }
  }

  else
  {
    BOOL v10 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v10) {
      -[UARPDynamicAssetCrashLogEvent getCoreName:inPayload:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)processCrashAdditionalInfo
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  4042160641LL,  v3);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    [v4 valueAsString];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = v5;
    if (v5)
    {
      uint64_t v7 = (NSString *)[v5 copy];
      appleModelNumber = self->_appleModelNumber;
      self->_appleModelNumber = v7;

      +[UARPSupportedAccessory findByAppleModelNumber:]( &OBJC_CLASS___UARPSupportedAccessory,  "findByAppleModelNumber:",  self->_appleModelNumber);
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        [v9 hardwareID];
        BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
        self->_productId = [v10 productID];
      }

      else
      {
        self->_productId = 0;
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
          -[UARPDynamicAssetCrashLogEvent processCrashAdditionalInfo].cold.5( (uint64_t)&self->_appleModelNumber,  v28,  v29,  v30,  v31,  v32,  v33,  v34);
        }
      }
      v35 = -[UARPSuperBinaryAsset tlvs](self->_asset, "tlvs");
      +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  4042160643LL,  v35);
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
      {
        [v36 valueAsNumber];
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v37;
        BOOL v19 = v37 != 0LL;
        if (v37)
        {
          else {
            self->_BOOL testMode = 0;
          }
        }

        else
        {
          BOOL v47 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
          if (v47) {
            -[UARPDynamicAssetCrashLogEvent processCrashAdditionalInfo].cold.4(v47, v48, v49, v50, v51, v52, v53, v54);
          }
        }
      }

      else
      {
        BOOL v39 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
        if (v39) {
          -[UARPDynamicAssetCrashLogEvent processCrashAdditionalInfo].cold.3(v39, v40, v41, v42, v43, v44, v45, v46);
        }
        BOOL v19 = 0;
      }
    }

    else
    {
      BOOL v20 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v20) {
        -[UARPDynamicAssetCrashLogEvent processCrashAdditionalInfo].cold.2(v20, v21, v22, v23, v24, v25, v26, v27);
      }
      BOOL v19 = 0;
    }
  }

  else
  {
    BOOL v11 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v11) {
      -[UARPDynamicAssetCrashLogEvent processCrashAdditionalInfo].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
    }
    BOOL v19 = 0;
  }

  return v19;
}

- (BOOL)findMatchingCMAP
{
  uint64_t v3 = -[UARPDynamicAssetCmapDatabase initCmapDatabase:]( objc_alloc(&OBJC_CLASS___UARPDynamicAssetCmapDatabase),  "initCmapDatabase:",  0LL);
  cmapDatabase = self->_cmapDatabase;
  self->_cmapDatabase = v3;

  id v5 = self->_cmapDatabase;
  if (v5)
  {
    p_appleModelNumber = &self->_appleModelNumber;
    -[UARPDynamicAssetCmapDatabase findCmapforAppleModel:](v5, "findCmapforAppleModel:", self->_appleModelNumber);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v8 = v7 != 0LL;
    if (!v7)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
        -[UARPDynamicAssetCrashLogEvent findMatchingCMAP].cold.2( (uint64_t)p_appleModelNumber,  log,  v10,  v11,  v12,  v13,  v14,  v15);
      }
    }
  }

  else
  {
    uint64_t v16 = self->_log;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[UARPDynamicAssetCrashLogEvent expandCRSHPayloads].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);
    }
    return 0;
  }

  return v8;
}

+ (id)tag
{
  uint64_t v2 = (char *)uarpAssetTagStructCrashAnalytics();
  return  -[UARPAssetTag initWithChar1:char2:char3:char4:]( objc_alloc(&OBJC_CLASS___UARPAssetTag),  "initWithChar1:char2:char3:char4:",  *v2,  v2[1],  v2[2],  v2[3]);
}

- (NSString)appleModelNumber
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setAppleModelNumber:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)decomposeUARP
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_187DC0000, log, OS_LOG_TYPE_ERROR, "RTKitBuddy unable to decode Crash Log", buf, 2u);
}

- (uint64_t)decomposeUARP
{
  v0 = (uint8_t *)abort_report_np();
  return -[UARPDynamicAssetCrashLogEvent decomposeUARP].cold.3(v0, v1, v2);
}

- (void)processCrashInstance
{
}

- (void)expandCRSHPayloads
{
}

- (void)getCoreName:(uint64_t)a3 inPayload:(uint64_t)a4 .cold.1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)getCoreName:(uint64_t)a3 inPayload:(uint64_t)a4 .cold.2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)processCrashAdditionalInfo
{
}

- (void)findMatchingCMAP
{
}

@end