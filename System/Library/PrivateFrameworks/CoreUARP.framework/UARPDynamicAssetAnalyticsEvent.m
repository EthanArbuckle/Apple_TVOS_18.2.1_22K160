@interface UARPDynamicAssetAnalyticsEvent
+ (id)tag;
- (BOOL)decomposeUARP;
- (UARPDynamicAssetAnalyticsEvent)init;
- (UARPDynamicAssetAnalyticsEvent)initWithURL:(id)a3;
- (id)description;
- (void)decomposeUARP;
- (void)send;
@end

@implementation UARPDynamicAssetAnalyticsEvent

- (UARPDynamicAssetAnalyticsEvent)init
{
  return 0LL;
}

- (UARPDynamicAssetAnalyticsEvent)initWithURL:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___UARPDynamicAssetAnalyticsEvent;
  v5 = -[UARPDynamicAssetAnalyticsEvent init](&v11, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    events = v5->_events;
    v5->_events = v8;
  }

  return v5;
}

- (id)description
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc_init(MEMORY[0x189607940]);
  [v3 appendFormat:@"Analytics Events %@\n", self->_events];
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v4 = self->_events;
  uint64_t v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 appendFormat:@"Analytics Event %@\n", *(void *)(*((void *)&v10 + 1) + 8 * v8++)];
      }

      while (v6 != v8);
      uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v6);
  }

  return v3;
}

- (BOOL)decomposeUARP
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  id v3 = -[UARPSuperBinaryAsset initWithURL:](objc_alloc(&OBJC_CLASS___UARPSuperBinaryAsset), "initWithURL:", self->_url);
  asset = self->_asset;
  self->_asset = v3;

  if (!-[UARPSuperBinaryAsset expandHeadersAndTLVs:](self->_asset, "expandHeadersAndTLVs:", 0LL)) {
    return 0;
  }
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  -[UARPSuperBinaryAsset payloads](self->_asset, "payloads");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (!v6) {
    goto LABEL_19;
  }
  uint64_t v8 = v6;
  uint64_t v9 = *(void *)v41;
  __int128 v10 = (os_log_s *)MEMORY[0x1895F8DA0];
  *(void *)&__int128 v7 = 138412290LL;
  __int128 v39 = v7;
  while (2)
  {
    for (uint64_t i = 0LL; i != v8; ++i)
    {
      if (*(void *)v41 != v9) {
        objc_enumerationMutation(v5);
      }
      __int128 v12 = *(NSMutableArray **)(*((void *)&v40 + 1) + 8 * i);
      -[NSMutableArray tlvs](v12, "tlvs", v39);
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  1483412481LL,  v13);
      if (v14)
      {
        [v14 valueAsNumber];
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (!v15)
        {
          BOOL v22 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
          if (v22) {
            -[UARPDynamicAssetAnalyticsEvent decomposeUARP].cold.1(v22, v23, v24, v25, v26, v27, v28, v29);
          }
          goto LABEL_26;
        }

        if ([v15 unsignedIntegerValue])
        {
          BOOL v30 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
          if (v30) {
            -[UARPDynamicAssetAnalyticsEvent decomposeUARP].cold.2(v30, v31, v32, v33, v34, v35, v36, v37);
          }
          goto LABEL_26;
        }
      }

      else if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = v39;
        v45 = v12;
        _os_log_impl(&dword_187DC0000, v10, OS_LOG_TYPE_INFO, "Process TICS assuming JSON : %@", buf, 0xCu);
      }

      -[NSMutableArray rangePayload](v12, "rangePayload");
      v16 = -[UARPSuperBinaryAsset payloadData:range:error:](self->_asset, "payloadData:range:error:", v12, 0LL, v17, 0LL);
      [MEMORY[0x1896078D8] JSONObjectWithData:v16 options:0 error:0];
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {

LABEL_26:
        return 0;
      }

      v19 = v18;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = v39;
        v45 = v19;
        _os_log_impl(&dword_187DC0000, v10, OS_LOG_TYPE_INFO, "Analytics object : %@", buf, 0xCu);
      }

      -[NSMutableArray addObject:](self->_events, "addObject:", v19);
    }

    uint64_t v8 = [v5 countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v8) {
      continue;
    }
    break;
  }

- (void)send
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  obj = self->_events;
  uint64_t v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v22,  v31,  16LL);
  if (v15)
  {
    uint64_t v14 = *(void *)v23;
    v2 = (os_log_s *)MEMORY[0x1895F8DA0];
    do
    {
      uint64_t v3 = 0LL;
      do
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = v3;
        id v4 = *(void **)(*((void *)&v22 + 1) + 8 * v3);
        [v4 allKeys];
        uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v18 = 0u;
        __int128 v19 = 0u;
        __int128 v20 = 0u;
        __int128 v21 = 0u;
        uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v30 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v19;
          do
          {
            for (uint64_t i = 0LL; i != v7; ++i)
            {
              if (*(void *)v19 != v8) {
                objc_enumerationMutation(v5);
              }
              uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
              [v4 objectForKeyedSubscript:v10];
              __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v27 = v10;
                __int16 v28 = 2112;
                uint64_t v29 = v11;
                _os_log_impl(&dword_187DC0000, v2, OS_LOG_TYPE_INFO, "Posting Analytics %@ : %@", buf, 0x16u);
              }

              uint64_t v17 = v11;
              id v12 = v11;
              AnalyticsSendEventLazy();
            }

            uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v30 count:16];
          }

          while (v7);
        }

        uint64_t v3 = v16 + 1;
      }

      while (v16 + 1 != v15);
      uint64_t v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v22,  v31,  16LL);
    }

    while (v15);
  }
}

id __38__UARPDynamicAssetAnalyticsEvent_send__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (id)tag
{
  v2 = (char *)uarpAssetTagStructAnalytics();
  return  -[UARPAssetTag initWithChar1:char2:char3:char4:]( objc_alloc(&OBJC_CLASS___UARPAssetTag),  "initWithChar1:char2:char3:char4:",  *v2,  v2[1],  v2[2],  v2[3]);
}

- (void).cxx_destruct
{
}

- (void)decomposeUARP
{
}

@end