@interface WFBlackListNode
- (BOOL)containsNetwork:(id)a3;
- (BOOL)enterprisePolicy;
- (BOOL)hasBlacklistedState:(unint64_t)a3;
- (BOOL)updateNetwork:(id)a3;
- (NSMutableArray)blacklistTriggers;
- (NSMutableArray)blacklistedStatesCurrent;
- (NSMutableArray)blacklistedStatesHistory;
- (WFBlackListNode)initWithBlacklistNetwork:(id)a3;
- (WFBlacklistNetwork)networkDelegate;
- (id)_copyCreateBlacklistedState:(unint64_t)a3 reason:(unint64_t)a4 reasonData:(int64_t)a5;
- (void)addBlacklistTrigger:(unint64_t)a3 reasonData:(int64_t)a4 bssid:(id)a5;
- (void)addBlacklistedState:(unint64_t)a3 reason:(unint64_t)a4 reasonData:(int64_t)a5;
- (void)addBlacklistedStateHistory:(id)a3 state:(unint64_t)a4 reason:(unint64_t)a5 reasonData:(int64_t)a6;
- (void)dealloc;
- (void)networkPruned;
- (void)processBlacklistedStateMetric:(id)a3 unblacklisting:(BOOL)a4 unblacklistingReason:(unint64_t)a5;
- (void)setBlacklistTriggers:(id)a3;
- (void)setBlacklistedStatesCurrent:(id)a3;
- (void)setBlacklistedStatesHistory:(id)a3;
- (void)setEnterprisePolicy:(BOOL)a3;
- (void)setNetworkDelegate:(id)a3;
@end

@implementation WFBlackListNode

- (WFBlackListNode)initWithBlacklistNetwork:(id)a3
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___WFBlackListNode;
  v5 = -[WFBlackListNode init](&v19, sel_init);
  if (!v5)
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"%s self nil",  "-[WFBlackListNode initWithBlacklistNetwork:]");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    goto LABEL_18;
  }

  if (!v4)
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"%s network nil",  "-[WFBlackListNode initWithBlacklistNetwork:]");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    goto LABEL_18;
  }

  v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
  blacklistTriggers = v5->_blacklistTriggers;
  v5->_blacklistTriggers = v6;

  if (!v5->_blacklistTriggers)
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"%s Alloc failed: triggersList",  "-[WFBlackListNode initWithBlacklistNetwork:]");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    goto LABEL_18;
  }

  v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
  blacklistedStatesCurrent = v5->_blacklistedStatesCurrent;
  v5->_blacklistedStatesCurrent = v8;

  if (!v5->_blacklistedStatesCurrent)
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"%s Alloc failed: statesList",  "-[WFBlackListNode initWithBlacklistNetwork:]");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    goto LABEL_18;
  }

  v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
  blacklistedStatesHistory = v5->_blacklistedStatesHistory;
  v5->_blacklistedStatesHistory = v10;

  if (!v5->_blacklistedStatesHistory)
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"%s Alloc failed: historyList",  "-[WFBlackListNode initWithBlacklistNetwork:]");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
LABEL_17:
      id v16 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v15, "UTF8String"));
      uint64_t v17 = [v16 UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v21 = v17;
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___WFBlackListNode;
  -[WFBlackListNode dealloc](&v3, sel_dealloc);
}

- (void)addBlacklistTrigger:(unint64_t)a3 reasonData:(int64_t)a4 bssid:(id)a5
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v8 = a5;
  v9 = -[WFBlackListNode blacklistTriggers](self, "blacklistTriggers");
  unint64_t v10 = [v9 count];

  if (v10 >= 0x10)
  {
    v11 = -[WFBlackListNode blacklistTriggers](self, "blacklistTriggers");
    [v11 removeObjectAtIndex:0];
  }

  char v12 = objc_alloc_init(&OBJC_CLASS___WFBlacklistTriggerNode);
  if (v12)
  {
    +[WFBlacklistEngine stringRepresentationWithReason:]( &OBJC_CLASS___WFBlacklistEngine,  "stringRepresentationWithReason:",  a3);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    -[WFBlacklistTriggerNode setTriggerReason:](v12, "setTriggerReason:", a3);
    -[WFBlacklistTriggerNode setTriggerReasonData:](v12, "setTriggerReasonData:", a4);
    if (v13) {
      -[WFBlacklistTriggerNode setTriggerReasonString:](v12, "setTriggerReasonString:", v13);
    }
    [MEMORY[0x189603F50] date];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 timeIntervalSince1970];
    -[WFBlacklistTriggerNode setTriggerReasonTimestamp:](v12, "setTriggerReasonTimestamp:");

    if (v8) {
      -[WFBlacklistTriggerNode setBssid:](v12, "setBssid:", v8);
    }
    -[WFBlackListNode blacklistTriggers](self, "blacklistTriggers");
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    [v15 addObject:v12];
  }

  else
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"%s ev alloc failed",  "-[WFBlackListNode addBlacklistTrigger:reasonData:bssid:]");
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    id v16 = (void *)NSString;
    id v13 = v13;
    id v15 = objc_msgSend(v16, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v13, "UTF8String"));
    *(_DWORD *)buf = 136446210;
    uint64_t v18 = [v15 UTF8String];
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }

LABEL_10:
}

- (BOOL)containsNetwork:(id)a3
{
  if (a3) {
    return -[WFBlacklistNetwork isEqualToBlacklistNetwork:](self->_networkDelegate, "isEqualToBlacklistNetwork:");
  }
  else {
    return 0;
  }
}

- (BOOL)hasBlacklistedState:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  -[WFBlackListNode blacklistedStatesCurrent](self, "blacklistedStatesCurrent", 0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * i) blacklistedState] == a3)
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }

      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)updateNetwork:(id)a3
{
  id v4 = (WFBlacklistNetwork *)[a3 copyWithZone:0];
  networkDelegate = self->_networkDelegate;
  self->_networkDelegate = v4;

  return 1;
}

- (id)_copyCreateBlacklistedState:(unint64_t)a3 reason:(unint64_t)a4 reasonData:(int64_t)a5
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v8 = objc_alloc_init(&OBJC_CLASS___WFBlacklistStateNode);
  if (v8)
  {
    +[WFBlacklistEngine stringRepresentationWithState:]( &OBJC_CLASS___WFBlacklistEngine,  "stringRepresentationWithState:",  a3);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    +[WFBlacklistEngine stringRepresentationWithReason:]( &OBJC_CLASS___WFBlacklistEngine,  "stringRepresentationWithReason:",  a4);
    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFBlacklistStateNode setBlacklistedState:](v8, "setBlacklistedState:", a3);
    -[WFBlacklistStateNode setBlacklistedStateString:](v8, "setBlacklistedStateString:", v9);
    [MEMORY[0x189603F50] date];
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 timeIntervalSince1970];
    -[WFBlacklistStateNode setBlacklistedStateTimestamp:](v8, "setBlacklistedStateTimestamp:");

    -[WFBlacklistStateNode setBlacklistedReason:](v8, "setBlacklistedReason:", a4);
    -[WFBlacklistStateNode setBlacklistedReasonData:](v8, "setBlacklistedReasonData:", a5);
    -[WFBlacklistStateNode setBlacklistedReasonString:](v8, "setBlacklistedReasonString:", v10);
  }

  else
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"%s stateNode alloc failed",  "-[WFBlackListNode _copyCreateBlacklistedState:reason:reasonData:]");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      __int128 v13 = (void *)NSString;
      id v9 = v9;
      id v14 = objc_msgSend(v13, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v9, "UTF8String"));
      *(_DWORD *)buf = 136446210;
      uint64_t v16 = [v14 UTF8String];
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }
  }

  return v8;
}

- (void)addBlacklistedState:(unint64_t)a3 reason:(unint64_t)a4 reasonData:(int64_t)a5
{
  unint64_t v5 = a4;
  uint64_t v53 = *MEMORY[0x1895F89C0];
  id v8 = -[WFBlackListNode _copyCreateBlacklistedState:reason:reasonData:]( self,  "_copyCreateBlacklistedState:reason:reasonData:",  a3,  a4,  a5);
  if (v8)
  {
    -[WFBlackListNode networkDelegate](self, "networkDelegate");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 ssid];
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    -[WFBlackListNode networkDelegate](self, "networkDelegate");
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 bssid];
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    -[WFBlackListNode blacklistedStatesCurrent](self, "blacklistedStatesCurrent");
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v13 count];

    if (v14)
    {
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      -[WFBlackListNode blacklistedStatesCurrent](self, "blacklistedStatesCurrent");
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = [v15 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        unint64_t v32 = v5;
        id v33 = v12;
        id v18 = v10;
        id v19 = 0LL;
        uint64_t v20 = *(void *)v35;
        while (2)
        {
          uint64_t v21 = 0LL;
          uint64_t v22 = v19;
          do
          {
            if (*(void *)v35 != v20) {
              objc_enumerationMutation(v15);
            }
            id v19 = *(id *)(*((void *)&v34 + 1) + 8 * v21);

            uint64_t v23 = [v19 blacklistedState];
            if (v23 == [v8 blacklistedState])
            {

              id v10 = v18;
              id v12 = v33;
              if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
              {
                v28 = +[WFBlacklistEngine stringRepresentationWithState:]( &OBJC_CLASS___WFBlacklistEngine,  "stringRepresentationWithState:",  a3);
                v29 = +[WFBlacklistEngine stringRepresentationWithReason:]( &OBJC_CLASS___WFBlacklistEngine,  "stringRepresentationWithReason:",  v32);
                *(_DWORD *)buf = 141559554;
                uint64_t v40 = 1752392040LL;
                __int16 v41 = 2112;
                id v42 = v18;
                __int16 v43 = 2160;
                uint64_t v44 = 1752392040LL;
                __int16 v45 = 2112;
                id v46 = v33;
                __int16 v47 = 2112;
                v48 = v28;
                __int16 v49 = 2112;
                v50 = v29;
                __int16 v51 = 2048;
                unint64_t v52 = v32;
                _os_log_error_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "'%{mask.hash}@[%{mask.hash}@]' was already %@. Would have blacklisted again due to %@(%lu)",  buf,  0x48u);
              }

              goto LABEL_19;
            }

            ++v21;
            uint64_t v22 = v19;
          }

          while (v17 != v21);
          uint64_t v17 = [v15 countByEnumeratingWithState:&v34 objects:v38 count:16];
          if (v17) {
            continue;
          }
          break;
        }

        id v10 = v18;
        unint64_t v5 = v32;
        id v12 = v33;
      }

      if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        goto LABEL_18;
      }
      v24 = +[WFBlacklistEngine stringRepresentationWithState:]( &OBJC_CLASS___WFBlacklistEngine,  "stringRepresentationWithState:",  a3);
      v25 = +[WFBlacklistEngine stringRepresentationWithReason:]( &OBJC_CLASS___WFBlacklistEngine,  "stringRepresentationWithReason:",  v5);
      *(_DWORD *)buf = 141559554;
      uint64_t v40 = 1752392040LL;
      __int16 v41 = 2112;
      id v42 = v10;
      __int16 v43 = 2160;
      uint64_t v44 = 1752392040LL;
      __int16 v45 = 2112;
      id v46 = v12;
      __int16 v47 = 2112;
      v48 = v24;
      __int16 v49 = 2112;
      v50 = v25;
      __int16 v51 = 2048;
      unint64_t v52 = v5;
      v26 = (os_log_s *)MEMORY[0x1895F8DA0];
    }

    else
    {
      if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
      {
LABEL_18:
        v27 = -[WFBlackListNode blacklistedStatesCurrent](self, "blacklistedStatesCurrent");
        [v27 addObject:v8];

        -[WFBlackListNode processBlacklistedStateMetric:unblacklisting:unblacklistingReason:]( self,  "processBlacklistedStateMetric:unblacklisting:unblacklistingReason:",  v8,  0LL,  0LL);
        goto LABEL_19;
      }
      v24 = +[WFBlacklistEngine stringRepresentationWithState:]( &OBJC_CLASS___WFBlacklistEngine,  "stringRepresentationWithState:",  a3);
      v25 = +[WFBlacklistEngine stringRepresentationWithReason:]( &OBJC_CLASS___WFBlacklistEngine,  "stringRepresentationWithReason:",  v5);
      *(_DWORD *)buf = 141559554;
      uint64_t v40 = 1752392040LL;
      __int16 v41 = 2112;
      id v42 = v10;
      __int16 v43 = 2160;
      uint64_t v44 = 1752392040LL;
      __int16 v45 = 2112;
      id v46 = v12;
      __int16 v47 = 2112;
      v48 = v24;
      __int16 v49 = 2112;
      v50 = v25;
      __int16 v51 = 2048;
      unint64_t v52 = v5;
      v26 = (os_log_s *)MEMORY[0x1895F8DA0];
    }

    _os_log_error_impl( &dword_187EBF000,  v26,  OS_LOG_TYPE_ERROR,  "Blacklisting and adding '%{mask.hash}@[%{mask.hash}@]' to %@ due to %@(%lu)",  buf,  0x48u);

    goto LABEL_18;
  }

  objc_msgSend( NSString,  "stringWithFormat:",  @"%s Failed to add state",  "-[WFBlackListNode addBlacklistedState:reason:reasonData:]");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
    goto LABEL_20;
  }
  v30 = (void *)NSString;
  id v10 = v10;
  id v12 = objc_msgSend(v30, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v10, "UTF8String"));
  uint64_t v31 = [v12 UTF8String];
  *(_DWORD *)buf = 136446210;
  uint64_t v40 = v31;
  _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
LABEL_19:

LABEL_20:
}

- (void)addBlacklistedStateHistory:(id)a3 state:(unint64_t)a4 reason:(unint64_t)a5 reasonData:(int64_t)a6
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  __int128 v11 = v10;
  if (v10)
  {
    id v12 = v10;
LABEL_4:
    -[WFBlackListNode networkDelegate](self, "networkDelegate");
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 ssid];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFBlackListNode blacklistedStatesHistory](self, "blacklistedStatesHistory");
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v16 = [v15 count];

    if (v16 >= 5)
    {
      -[WFBlackListNode blacklistedStatesHistory](self, "blacklistedStatesHistory");
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 removeObjectAtIndex:0];
    }

    id v18 = (void *)NSString;
    +[WFBlacklistEngine stringRepresentationWithState:]( &OBJC_CLASS___WFBlacklistEngine,  "stringRepresentationWithState:",  a4);
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFBlacklistEngine stringRepresentationWithReason:]( &OBJC_CLASS___WFBlacklistEngine,  "stringRepresentationWithReason:",  a5);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 stringWithFormat:@"Adding to blacklistHistory: %@ for '%@' due to %@(%lu)", v19, v14, v20, a5];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      id v22 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v21, "UTF8String"));
      *(_DWORD *)buf = 136446210;
      uint64_t v27 = [v22 UTF8String];
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }

    -[WFBlackListNode blacklistedStatesHistory](self, "blacklistedStatesHistory");
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 addObject:v12];

    goto LABEL_9;
  }

  id v12 = -[WFBlackListNode _copyCreateBlacklistedState:reason:reasonData:]( self,  "_copyCreateBlacklistedState:reason:reasonData:",  a4,  a5,  a6);
  if (v12) {
    goto LABEL_4;
  }
  objc_msgSend( NSString,  "stringWithFormat:",  @"%s Failed to add state to history",  "-[WFBlackListNode addBlacklistedStateHistory:state:reason:reasonData:]");
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    v24 = (void *)NSString;
    id v12 = v12;
    id v25 = objc_msgSend(v24, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v12, "UTF8String"));
    *(_DWORD *)buf = 136446210;
    uint64_t v27 = [v25 UTF8String];
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }

- (void)networkPruned
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  v5[0] = 136316162;
  OUTLINED_FUNCTION_0_2();
  uint64_t v6 = v0;
  __int16 v7 = v1;
  uint64_t v8 = v2;
  __int16 v9 = v3;
  uint64_t v10 = v4;
  _os_log_error_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "%s Metric for %{mask.hash}@[%{mask.hash}@] not found!",  (uint8_t *)v5,  0x34u);
}

- (void)processBlacklistedStateMetric:(id)a3 unblacklisting:(BOOL)a4 unblacklistingReason:(unint64_t)a5
{
  BOOL v5 = a4;
  uint64_t v70 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  if (!v7)
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"%s node nil",  "-[WFBlackListNode processBlacklistedStateMetric:unblacklisting:unblacklistingReason:]");
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    goto LABEL_33;
  }

  if (!self->_blacklistMetrics)
  {
    uint64_t v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    blacklistMetrics = self->_blacklistMetrics;
    self->_blacklistMetrics = v8;

    if (!self->_blacklistMetrics)
    {
      objc_msgSend( NSString,  "stringWithFormat:",  @"%s _blacklistMetrics alloc failed",  "-[WFBlackListNode processBlacklistedStateMetric:unblacklisting:unblacklistingReason:]");
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        goto LABEL_27;
      }
LABEL_33:
      __int16 v47 = (void *)NSString;
      id v13 = v13;
      id v45 = objc_msgSend(v47, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v13, "UTF8String"));
      *(_DWORD *)buf = 136446210;
      uint64_t v53 = (const char *)[v45 UTF8String];
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
LABEL_34:

      goto LABEL_27;
    }
  }

  -[WFBlackListNode networkDelegate](self, "networkDelegate");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 bssid];

  -[WFBlackListNode networkDelegate](self, "networkDelegate");
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 ssid];
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"%s bssid nil",  "-[WFBlackListNode processBlacklistedStateMetric:unblacklisting:unblacklistingReason:]");
    id v45 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      id v46 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v45, "UTF8String"));
      *(_DWORD *)buf = 136446210;
      uint64_t v53 = (const char *)[v46 UTF8String];
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }

    goto LABEL_34;
  }

  if (v13)
  {
    if (v5)
    {
      [MEMORY[0x189607938] indexSet];
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSMutableArray count](self->_blacklistMetrics, "count"))
      {
        unint64_t v14 = 0LL;
        id v49 = v7;
        do
        {
          -[NSMutableArray objectAtIndex:](self->_blacklistMetrics, "objectAtIndex:", v14);
          id v15 = (void *)objc_claimAutoreleasedReturnValue();
          [v15 objectForKeyedSubscript:@"state"];
          unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v17 = [v16 unsignedIntegerValue];
          uint64_t v18 = [v7 blacklistedState];

          if (v17 == v18)
          {
            [v15 objectForKeyedSubscript:@"ssid"];
            id v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (([v19 isEqualToString:v13] & 1) == 0)
            {

LABEL_16:
              if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
              {
                [v15 objectForKeyedSubscript:@"ssid"];
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                [v15 objectForKeyedSubscript:@"bssid"];
                uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136317186;
                uint64_t v53 = "-[WFBlackListNode processBlacklistedStateMetric:unblacklisting:unblacklistingReason:]";
                __int16 v54 = 2160;
                uint64_t v55 = 1752392040LL;
                __int16 v56 = 2112;
                id v57 = v30;
                __int16 v58 = 2160;
                uint64_t v59 = 1752392040LL;
                __int16 v60 = 2112;
                uint64_t v61 = (uint64_t)v31;
                __int16 v62 = 2160;
                uint64_t v63 = 1752392040LL;
                __int16 v64 = 2112;
                id v65 = v13;
                __int16 v66 = 2160;
                uint64_t v67 = 1752392040LL;
                __int16 v68 = 2112;
                uint64_t v69 = v11;
                _os_log_error_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "%s metric ssid:%{mask.hash}@ bssid:%{mask.hash}@ doesnt match with node ssid:%{mask.hash}@ bssid:%{mask.hash}@",  buf,  0x5Cu);
              }

              goto LABEL_18;
            }

            [v15 objectForKeyedSubscript:@"bssid"];
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
            int v21 = [v20 isEqualToString:v11];

            if (!v21) {
              goto LABEL_16;
            }
            [MEMORY[0x189603F50] date];
            id v22 = (void *)objc_claimAutoreleasedReturnValue();
            [v22 timeIntervalSince1970];
            double v24 = v23;

            id v25 = (void *)MEMORY[0x189607968];
            [v15 objectForKeyedSubscript:@"blocklistTimestamp"];
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            [v26 doubleValue];
            [v25 numberWithDouble:v24 - v27];
            uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
            [v15 setObject:v28 forKeyedSubscript:@"blocklistedDuration"];

            [MEMORY[0x189607968] numberWithUnsignedInteger:a5];
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            [v15 setObject:v29 forKeyedSubscript:@"unblocklistingReason"];

            [v15 removeObjectForKey:@"ssid"];
            [v15 removeObjectForKey:@"bssid"];
            [v15 removeObjectForKey:@"state"];
            [v15 removeObjectForKey:@"blocklistTimestamp"];
            if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
            {
              [v15 objectForKeyedSubscript:@"blocklistedDuration"];
              unint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
              [v15 objectForKeyedSubscript:@"unblocklistingReason"];
              id v33 = (void *)objc_claimAutoreleasedReturnValue();
              [v15 objectForKeyedSubscript:@"prunedCount"];
              __int128 v34 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136316930;
              uint64_t v53 = "-[WFBlackListNode processBlacklistedStateMetric:unblacklisting:unblacklistingReason:]";
              __int16 v54 = 2160;
              uint64_t v55 = 1752392040LL;
              __int16 v56 = 2112;
              id v57 = v13;
              __int16 v58 = 2160;
              uint64_t v59 = 1752392040LL;
              __int16 v60 = 2112;
              uint64_t v61 = v11;
              __int16 v62 = 2112;
              uint64_t v63 = (uint64_t)v32;
              __int16 v64 = 2112;
              id v65 = v33;
              __int16 v66 = 2112;
              uint64_t v67 = (uint64_t)v34;
              _os_log_error_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "%s Finish capturing metric for %{mask.hash}@[%{mask.hash}@] - {duration:%@ unblacklistReason:%@ prunedCount:%@}",  buf,  0x52u);
            }

            [v50 addIndex:v14];
            id v7 = v49;
          }

void __85__WFBlackListNode_processBlacklistedStateMetric_unblacklisting_unblacklistingReason___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  id v2 = v3;
  AnalyticsSendEventLazy();
}

id __85__WFBlackListNode_processBlacklistedStateMetric_unblacklisting_unblacklistingReason___block_invoke_2( uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (WFBlacklistNetwork)networkDelegate
{
  return (WFBlacklistNetwork *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setNetworkDelegate:(id)a3
{
}

- (NSMutableArray)blacklistTriggers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setBlacklistTriggers:(id)a3
{
}

- (NSMutableArray)blacklistedStatesCurrent
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setBlacklistedStatesCurrent:(id)a3
{
}

- (NSMutableArray)blacklistedStatesHistory
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setBlacklistedStatesHistory:(id)a3
{
}

- (BOOL)enterprisePolicy
{
  return self->_enterprisePolicy;
}

- (void)setEnterprisePolicy:(BOOL)a3
{
  self->_enterprisePolicy = a3;
}

- (void).cxx_destruct
{
}

- (void)processBlacklistedStateMetric:(uint64_t)a1 unblacklisting:(uint64_t)a2 unblacklistingReason:(void *)a3 .cold.1( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  [a3 objectForKeyedSubscript:@"oui"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [a3 objectForKeyedSubscript:@"blocklistedReason"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [a3 objectForKeyedSubscript:@"blocklistedSubreason"];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = 136316930;
  OUTLINED_FUNCTION_0_2();
  uint64_t v14 = a1;
  __int16 v15 = v9;
  uint64_t v16 = v10;
  __int16 v17 = v11;
  uint64_t v18 = a2;
  __int16 v19 = v11;
  uint64_t v20 = v6;
  __int16 v21 = v11;
  id v22 = v7;
  __int16 v23 = v11;
  uint64_t v24 = v12;
  _os_log_error_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "%s Begin capturing metric for %{mask.hash}@[%{mask.hash}@] - {oui:%@ blacklistedReason:%@ blacklistedSubreason:%@}",  (uint8_t *)v13,  0x52u);
}

@end