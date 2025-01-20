@interface UARPDynamicAssetMappedAnalyticsEvent
+ (id)tag;
- (BOOL)decomposeUARP;
- (BOOL)expandMTICPayloads;
- (BOOL)findMatchingTMAP;
- (BOOL)getAppleModelNumber:(id)a3 inPayload:(id)a4;
- (BOOL)getEventID:(unsigned int *)a3 inPayload:(id)a4;
- (BOOL)prepareAndSend;
- (UARPDynamicAssetMappedAnalyticsEvent)init;
- (UARPDynamicAssetMappedAnalyticsEvent)initWithURL:(id)a3;
- (id)description;
- (void)expandMTICPayloads;
- (void)findMatchingTMAP;
- (void)prepareAndSend;
- (void)send;
@end

@implementation UARPDynamicAssetMappedAnalyticsEvent

- (UARPDynamicAssetMappedAnalyticsEvent)init
{
  return 0LL;
}

- (UARPDynamicAssetMappedAnalyticsEvent)initWithURL:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___UARPDynamicAssetMappedAnalyticsEvent;
  v6 = -[UARPDynamicAssetMappedAnalyticsEvent init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    coreAnalyticsEvents = v7->_coreAnalyticsEvents;
    v7->_coreAnalyticsEvents = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    payloads = v7->_payloads;
    v7->_payloads = v10;

    os_log_t v12 = os_log_create("com.apple.accessoryupdater.uarp", "tmap");
    log = v7->_log;
    v7->_log = v12;
  }

  return v7;
}

- (id)description
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc_init(MEMORY[0x189607940]);
  if (self->_tmapDatabase)
  {
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    v4 = self->_coreAnalyticsEvents;
    uint64_t v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v18,  v23,  16LL);
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v19;
      do
      {
        for (uint64_t i = 0LL; i != v6; ++i)
        {
          if (*(void *)v19 != v7) {
            objc_enumerationMutation(v4);
          }
          [v3 appendFormat:@"Mapped Analytics Event %@\n", *(void *)(*((void *)&v18 + 1) + 8 * i)];
        }

        uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v18,  v23,  16LL);
      }

      while (v6);
    }
  }

  else
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    v4 = self->_payloads;
    uint64_t v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v14,  v22,  16LL);
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t j = 0LL; j != v10; ++j)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v4);
          }
          [v3 appendFormat:@"Mapped Analytics Payload %@\n", *(void *)(*((void *)&v14 + 1) + 8 * j)];
        }

        uint64_t v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v14,  v22,  16LL);
      }

      while (v10);
    }
  }

  return v3;
}

- (void)send
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  v2 = self->_coreAnalyticsEvents;
  uint64_t v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * i) objectForKeyedSubscript:@"EventName"];
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
        AnalyticsSendEventLazy();
      }

      uint64_t v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
    }

    while (v4);
  }
}

id __44__UARPDynamicAssetMappedAnalyticsEvent_send__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (BOOL)decomposeUARP
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  uint64_t v3 = -[UARPSuperBinaryAsset initWithURL:](objc_alloc(&OBJC_CLASS___UARPSuperBinaryAsset), "initWithURL:", self->_url);
  asset = self->_asset;
  self->_asset = v3;

  if (!-[UARPSuperBinaryAsset expandHeadersAndTLVs:](self->_asset, "expandHeadersAndTLVs:", 0LL)) {
    return 0;
  }
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  -[UARPSuperBinaryAsset payloads](self->_asset, "payloads");
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(obj);
        }
        __int128 v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        [MEMORY[0x189603FC8] dictionary];
        __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[UARPDynamicAssetMappedAnalyticsEvent getEventID:inPayload:](self, "getEventID:inPayload:", &v20, v9)) {
          goto LABEL_19;
        }
        [MEMORY[0x189607968] numberWithUnsignedInt:v20];
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 setObject:v11 forKeyedSubscript:@"EventID"];

        id v12 = objc_alloc_init(MEMORY[0x189607940]);
        if (!-[UARPDynamicAssetMappedAnalyticsEvent getAppleModelNumber:inPayload:]( self,  "getAppleModelNumber:inPayload:",  v12,  v9)) {
          goto LABEL_18;
        }
        uint64_t v13 = (void *)[v12 copy];
        [v10 setObject:v13 forKeyedSubscript:@"AppleModelNumber"];

        [v9 rangePayload];
        -[UARPSuperBinaryAsset payloadData:range:error:](self->_asset, "payloadData:range:error:", v9, 0LL, v14, 0LL);
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v26 = v9;
            _os_log_error_impl(&dword_187DC0000, log, OS_LOG_TYPE_ERROR, "MTIC has no Payload Data: %@", buf, 0xCu);
          }

LABEL_18:
LABEL_19:

          BOOL v16 = 0;
          goto LABEL_20;
        }

        [v10 setObject:v15 forKeyedSubscript:@"Events"];
        -[NSMutableArray addObject:](self->_payloads, "addObject:", v10);
      }

      uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
      BOOL v16 = 1;
      if (v6) {
        continue;
      }
      break;
    }
  }

  else
  {
    BOOL v16 = 1;
  }

- (BOOL)findMatchingTMAP
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  uint64_t v3 = -[UARPDynamicAssetTmapDatabase initTmapDatabase:]( objc_alloc(&OBJC_CLASS___UARPDynamicAssetTmapDatabase),  "initTmapDatabase:",  0LL);
  tmapDatabase = self->_tmapDatabase;
  self->_tmapDatabase = v3;

  if (self->_tmapDatabase)
  {
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    uint64_t v5 = self->_payloads;
    uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend( *(id *)(*((void *)&v16 + 1) + 8 * i),  "objectForKeyedSubscript:",  @"AppleModelNumber",  (void)v16);
          __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();
          __int128 v11 = (void *)[v10 copy];

          -[UARPDynamicAssetTmapDatabase findTmapforAppleModel:](self->_tmapDatabase, "findTmapforAppleModel:", v11);
          id v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v12)
          {
            log = self->_log;
            if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
              -[UARPDynamicAssetMappedAnalyticsEvent findMatchingTMAP].cold.2((uint64_t)v11, log);
            }

            BOOL v13 = 0;
            goto LABEL_14;
          }
        }

        uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
        if (v7) {
          continue;
        }
        break;
      }
    }

    BOOL v13 = 1;
LABEL_14:
  }

  else
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      -[UARPDynamicAssetMappedAnalyticsEvent findMatchingTMAP].cold.1();
    }
    return 0;
  }

  return v13;
}

- (BOOL)expandMTICPayloads
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  if (!-[UARPDynamicAssetMappedAnalyticsEvent findMatchingTMAP](self, "findMatchingTMAP")) {
    return 0;
  }
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  obuint64_t j = self->_payloads;
  uint64_t v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v21,  v27,  16LL);
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v20 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v22 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        [v6 objectForKeyedSubscript:@"Events"];
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v8 = (void *)[v7 copy];

        [v6 objectForKeyedSubscript:@"AppleModelNumber"];
        __int128 v9 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v10 = (void *)[v9 copy];

        [v6 objectForKeyedSubscript:@"EventID"];
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v12 = [v11 unsignedIntValue];

        uint64_t v13 = -[UARPDynamicAssetTmapDatabase expandMticData:withEventID:appleModelNumber:]( self->_tmapDatabase,  "expandMticData:withEventID:appleModelNumber:",  v8,  v12,  v10);
        if (!v13)
        {
          if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
            -[UARPDynamicAssetMappedAnalyticsEvent expandMTICPayloads].cold.1();
          }

          return 0;
        }

        uint64_t v14 = (void *)v13;
        -[NSMutableArray addObject:](self->_coreAnalyticsEvents, "addObject:", v13);
      }

      uint64_t v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v21,  v27,  16LL);
      if (v4) {
        continue;
      }
      break;
    }
  }

  log = self->_log;
  BOOL v16 = 1;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    coreAnalyticsEvents = self->_coreAnalyticsEvents;
    *(_DWORD *)buf = 138412290;
    v26 = coreAnalyticsEvents;
    _os_log_impl(&dword_187DC0000, log, OS_LOG_TYPE_INFO, "All MTIC data for this asset: %@", buf, 0xCu);
  }

  return v16;
}

- (BOOL)prepareAndSend
{
  if (!-[UARPDynamicAssetMappedAnalyticsEvent decomposeUARP](self, "decomposeUARP"))
  {
    BOOL v3 = os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR);
    if (!v3) {
      return v3;
    }
    -[UARPDynamicAssetMappedAnalyticsEvent prepareAndSend].cold.2();
    goto LABEL_9;
  }

  if (!-[UARPDynamicAssetMappedAnalyticsEvent expandMTICPayloads](self, "expandMTICPayloads"))
  {
    BOOL v3 = os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR);
    if (!v3) {
      return v3;
    }
    -[UARPDynamicAssetMappedAnalyticsEvent prepareAndSend].cold.1();
LABEL_9:
    LOBYTE(v3) = 0;
    return v3;
  }

  -[UARPDynamicAssetMappedAnalyticsEvent send](self, "send");
  LOBYTE(v3) = 1;
  return v3;
}

- (BOOL)getEventID:(unsigned int *)a3 inPayload:(id)a4
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  538280449LL,  v6);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    [v7 valueAsNumber];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v9 = v8;
    BOOL v10 = v8 != 0LL;
    if (v8)
    {
      *a3 = [v8 unsignedIntValue];
    }

    else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
    {
      -[UARPDynamicAssetMappedAnalyticsEvent getEventID:inPayload:].cold.2();
    }
  }

  else
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      -[UARPDynamicAssetMappedAnalyticsEvent getEventID:inPayload:].cold.1();
    }
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)getAppleModelNumber:(id)a3 inPayload:(id)a4
{
  id v5 = a3;
  [a4 tlvs];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  538280448LL,  v6);
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
        -[UARPDynamicAssetMappedAnalyticsEvent getAppleModelNumber:inPayload:].cold.2( v18,  v19,  v20,  v21,  v22,  v23,  v24,  v25);
      }
    }
  }

  else
  {
    BOOL v10 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v10) {
      -[UARPDynamicAssetMappedAnalyticsEvent getAppleModelNumber:inPayload:].cold.1( v10,  v11,  v12,  v13,  v14,  v15,  v16,  v17);
    }
    BOOL v9 = 0;
  }

  return v9;
}

+ (id)tag
{
  v2 = (char *)uarpAssetTagStructMappedAnalytics();
  return  -[UARPAssetTag initWithChar1:char2:char3:char4:]( objc_alloc(&OBJC_CLASS___UARPAssetTag),  "initWithChar1:char2:char3:char4:",  *v2,  v2[1],  v2[2],  v2[3]);
}

- (void).cxx_destruct
{
}

- (void)findMatchingTMAP
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( &dword_187DC0000,  a2,  OS_LOG_TYPE_ERROR,  "Unable to find Matching TMAP for Apple Model Number: %@",  (uint8_t *)&v2,  0xCu);
}

- (void)expandMTICPayloads
{
}

- (void)prepareAndSend
{
}

- (void)getEventID:inPayload:.cold.1()
{
}

- (void)getEventID:inPayload:.cold.2()
{
}

- (void)getAppleModelNumber:(uint64_t)a3 inPayload:(uint64_t)a4 .cold.1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)getAppleModelNumber:(uint64_t)a3 inPayload:(uint64_t)a4 .cold.2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end