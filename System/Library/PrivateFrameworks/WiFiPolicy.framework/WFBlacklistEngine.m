@interface WFBlacklistEngine
+ (id)stringRepresentationWithReason:(unint64_t)a3;
+ (id)stringRepresentationWithState:(unint64_t)a3;
- (BOOL)_evaluateTriggersForBlacklisting:(id)a3 reason:(unint64_t)a4 reasonData:(int64_t)a5 bssid:(id)a6 ssid:(id)a7 state:(unint64_t)a8;
- (BOOL)_evaluateTriggersForUnblacklisting:(id)a3 unblacklistReason:(unint64_t)a4 ssid:(id)a5;
- (BOOL)_ignoreTriggersForDeviceProfile:(unint64_t)a3 node:(id)a4;
- (BOOL)_meetsThresholds:(unint64_t)a3 count:(unsigned int)a4 perSsid:(BOOL)a5 bssid:(id)a6 ssid:(id)a7;
- (BOOL)changeBlacklistingThresholds:(unint64_t)a3 value:(unsigned int)a4 perSsid:(BOOL)a5;
- (BOOL)enabled;
- (BOOL)isNetworkBlacklistedForAutoJoinDueToTrigDisc:(id)a3 rssi:(int64_t *)a4 timestamp:(double *)a5;
- (BOOL)isNetworkInBlacklistedState:(id)a3 state:(unint64_t)a4;
- (BOOL)removeBlacklistedStateForNetworkWithReason:(id)a3 state:(unint64_t)a4 reason:(unint64_t)a5;
- (NSMutableArray)bssidThresholds;
- (NSMutableArray)ssidThresholds;
- (WFBlacklistDelegate)blacklistDelegate;
- (WFBlacklistEngine)initWithBlacklistDelegate:(id)a3 profile:(unint64_t)a4;
- (double)autojoinBlacklistExpiry;
- (double)bssBlacklistExpiry;
- (double)wowBlacklistExpiry;
- (id)_findBlacklistNode:(id)a3;
- (id)denyListThreshold:(unint64_t)a3 perSSID:(BOOL)a4;
- (id)getBlacklist;
- (id)retrieveBlacklistedNetworkSsids:(unint64_t)a3;
- (id)retrieveBlacklistedStateHistoryForNetwork:(id)a3 state:(unint64_t)a4 timestamps:(id)a5 reasonData:(id)a6;
- (id)retrieveNetworksInBlacklistedState:(unint64_t)a3;
- (id)retrieveNetworksInBlacklistedStateHistory:(unint64_t)a3;
- (id)retrieveReasonsForNetworkInBlacklistedState:(id)a3 state:(unint64_t)a4 timestamps:(id)a5 reasonData:(id)a6;
- (int64_t)getRssiWhenNetworkWasBlacklisted:(id)a3;
- (unint64_t)getBlacklistedNetworkCount;
- (void)_printBlacklist;
- (void)_setBlacklistedState:(id)a3 state:(unint64_t)a4 reason:(unint64_t)a5 reasonData:(int64_t)a6;
- (void)clearTriggerForNetworkWithUnblacklistReason:(id)a3 reason:(unint64_t)a4;
- (void)configureBlacklistedStateExpiryIntervalInSec:(double)a3 state:(unint64_t)a4;
- (void)dealloc;
- (void)networkPruned:(id)a3;
- (void)networkRemovedForSsid:(id)a3;
- (void)removeBlacklistedStateWithUnblacklistType:(unint64_t)a3;
- (void)removeBlacklistedStates;
- (void)removeExpiredBlacklistedState:(unint64_t)a3;
- (void)setAutojoinBlacklistExpiry:(double)a3;
- (void)setBlacklistDelegate:(id)a3;
- (void)setBssBlacklistExpiry:(double)a3;
- (void)setBssidThresholds:(id)a3;
- (void)setDefaultBlacklistThresholds;
- (void)setEnabled:(BOOL)a3;
- (void)setSsidThresholds:(id)a3;
- (void)setTriggerForNetworkWithReason:(id)a3 reason:(unint64_t)a4 reasonData:(int64_t)a5 bssid:(id)a6;
- (void)setTriggerForNetworkWithReasonAndState:(id)a3 reason:(unint64_t)a4 reasonData:(int64_t)a5 bssid:(id)a6 state:(unint64_t)a7;
- (void)setWowBlacklistExpiry:(double)a3;
@end

@implementation WFBlacklistEngine

- (WFBlacklistEngine)initWithBlacklistDelegate:(id)a3 profile:(unint64_t)a4
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___WFBlacklistEngine;
  v7 = -[WFBlacklistEngine init](&v21, sel_init);
  v8 = v7;
  if (!v7)
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"%s self alloc failed",  "-[WFBlacklistEngine initWithBlacklistDelegate:profile:]");
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }

  -[WFBlacklistEngine setEnabled:](v7, "setEnabled:", 0LL);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_opt_respondsToSelector() & 1) == 0
    || (objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"%s Invalid blacklistDelegate",  "-[WFBlacklistEngine initWithBlacklistDelegate:profile:]");
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
LABEL_11:

      -[NSMutableArray removeAllObjects](v8->_blacklist, "removeAllObjects");
      v15 = 0LL;
      goto LABEL_12;
    }

- (void)setDefaultBlacklistThresholds
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[WFBlacklistEngine bssidThresholds](self, "bssidThresholds");
  [v4 setObject:v3 atIndexedSubscript:0];

  [MEMORY[0x189607968] numberWithUnsignedInt:1];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFBlacklistEngine bssidThresholds](self, "bssidThresholds");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v5 atIndexedSubscript:1];

  [MEMORY[0x189607968] numberWithUnsignedInt:1];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WFBlacklistEngine bssidThresholds](self, "bssidThresholds");
  [v8 setObject:v7 atIndexedSubscript:2];

  [MEMORY[0x189607968] numberWithUnsignedInt:3];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[WFBlacklistEngine bssidThresholds](self, "bssidThresholds");
  [v10 setObject:v9 atIndexedSubscript:3];

  [MEMORY[0x189607968] numberWithUnsignedInt:3];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[WFBlacklistEngine bssidThresholds](self, "bssidThresholds");
  [v12 setObject:v11 atIndexedSubscript:4];

  [MEMORY[0x189607968] numberWithUnsignedInt:10];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[WFBlacklistEngine bssidThresholds](self, "bssidThresholds");
  [v14 setObject:v13 atIndexedSubscript:5];

  [MEMORY[0x189607968] numberWithUnsignedInt:1];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFBlacklistEngine bssidThresholds](self, "bssidThresholds");
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 setObject:v15 atIndexedSubscript:6];

  [MEMORY[0x189607968] numberWithUnsignedInt:3];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFBlacklistEngine bssidThresholds](self, "bssidThresholds");
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 setObject:v17 atIndexedSubscript:7];

  [MEMORY[0x189607968] numberWithUnsignedInt:1];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[WFBlacklistEngine ssidThresholds](self, "ssidThresholds");
  [v20 setObject:v19 atIndexedSubscript:0];

  [MEMORY[0x189607968] numberWithUnsignedInt:1];
  objc_super v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[WFBlacklistEngine ssidThresholds](self, "ssidThresholds");
  [v22 setObject:v21 atIndexedSubscript:1];

  [MEMORY[0x189607968] numberWithUnsignedInt:1];
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFBlacklistEngine ssidThresholds](self, "ssidThresholds");
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v24 setObject:v23 atIndexedSubscript:2];

  [MEMORY[0x189607968] numberWithUnsignedInt:5];
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[WFBlacklistEngine ssidThresholds](self, "ssidThresholds");
  [v26 setObject:v25 atIndexedSubscript:3];

  [MEMORY[0x189607968] numberWithUnsignedInt:5];
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[WFBlacklistEngine ssidThresholds](self, "ssidThresholds");
  [v28 setObject:v27 atIndexedSubscript:4];

  [MEMORY[0x189607968] numberWithUnsignedInt:10];
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[WFBlacklistEngine ssidThresholds](self, "ssidThresholds");
  [v30 setObject:v29 atIndexedSubscript:5];

  [MEMORY[0x189607968] numberWithUnsignedInt:1];
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[WFBlacklistEngine ssidThresholds](self, "ssidThresholds");
  [v32 setObject:v31 atIndexedSubscript:6];

  [MEMORY[0x189607968] numberWithUnsignedInt:3];
  id v34 = (id)objc_claimAutoreleasedReturnValue();
  v33 = -[WFBlacklistEngine ssidThresholds](self, "ssidThresholds");
  [v33 setObject:v34 atIndexedSubscript:7];
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 removeAllObjects];
  v4 = -[WFBlacklistEngine bssidThresholds](self, "bssidThresholds");
  [v4 removeAllObjects];

  -[NSMutableArray removeAllObjects](self->_blacklist, "removeAllObjects");
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___WFBlacklistEngine;
  -[WFBlacklistEngine dealloc](&v5, sel_dealloc);
}

- (void)configureBlacklistedStateExpiryIntervalInSec:(double)a3 state:(unint64_t)a4
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  switch(a4)
  {
    case 3uLL:
      if (a3 != 0.0 && a3 <= 3600.0)
      {
        -[WFBlacklistEngine setWowBlacklistExpiry:](self, "setWowBlacklistExpiry:");
        return;
      }

      objc_msgSend( NSString,  "stringWithFormat:",  @"%s: Out of range WoWBlacklisting timeout value:%f",  "-[WFBlacklistEngine configureBlacklistedStateExpiryIntervalInSec:state:]",  *(void *)&a3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        goto LABEL_20;
      }
      break;
    case 2uLL:
      if (a3 != 0.0 && a3 <= 300.0)
      {
        -[WFBlacklistEngine setBssBlacklistExpiry:](self, "setBssBlacklistExpiry:");
        return;
      }

      objc_msgSend( NSString,  "stringWithFormat:",  @"%s: Out of range BssBlacklisting timeout value:%f",  "-[WFBlacklistEngine configureBlacklistedStateExpiryIntervalInSec:state:]",  *(void *)&a3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        break;
      }
      goto LABEL_20;
    case 1uLL:
      if (a3 != 0.0 && a3 <= 86400.0)
      {
        -[WFBlacklistEngine setAutojoinBlacklistExpiry:](self, "setAutojoinBlacklistExpiry:");
        return;
      }

      objc_msgSend( NSString,  "stringWithFormat:",  @"%s: Out of range AutojoinBlacklisting timeout value:%f",  "-[WFBlacklistEngine configureBlacklistedStateExpiryIntervalInSec:state:]",  *(void *)&a3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        break;
      }
      goto LABEL_20;
    default:
      objc_msgSend( NSString,  "stringWithFormat:",  @"%s: Invalid state",  a3,  "-[WFBlacklistEngine configureBlacklistedStateExpiryIntervalInSec:state:]");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
      {
LABEL_20:
        id v5 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v4, "UTF8String"));
        *(_DWORD *)buf = 136446210;
        uint64_t v7 = [v5 UTF8String];
        _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
      }

      break;
  }
}

- (BOOL)changeBlacklistingThresholds:(unint64_t)a3 value:(unsigned int)a4 perSsid:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v18 = *MEMORY[0x1895F89C0];
  BOOL v7 = a3 >= 7 || a4 >= 0xFF;
  BOOL v8 = !v7;
  if (v7)
  {
    uint64_t v13 = "perBSSID";
    if (a5) {
      uint64_t v13 = "perSSID";
    }
    objc_msgSend( NSString,  "stringWithFormat:",  @"%s: Invalid Config Params. type:%s triggerReason:%lu threshCount:%u",  "-[WFBlacklistEngine changeBlacklistingThresholds:value:perSsid:]",  v13,  a3,  *(void *)&a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      id v15 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v14, "UTF8String"));
      *(_DWORD *)buf = 136446210;
      uint64_t v17 = [v15 UTF8String];
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }
  }

  else
  {
    [MEMORY[0x189607968] numberWithUnsignedInt:*(void *)&a4];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5) {
      -[WFBlacklistEngine ssidThresholds](self, "ssidThresholds");
    }
    else {
      -[WFBlacklistEngine bssidThresholds](self, "bssidThresholds");
    }
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 setObject:v10 atIndexedSubscript:a3];
  }

  return v8;
}

- (id)denyListThreshold:(unint64_t)a3 perSSID:(BOOL)a4
{
  if (a4) {
    -[WFBlacklistEngine ssidThresholds](self, "ssidThresholds");
  }
  else {
    -[WFBlacklistEngine bssidThresholds](self, "bssidThresholds");
  }
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectAtIndexedSubscript:a3];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_setBlacklistedState:(id)a3 state:(unint64_t)a4 reason:(unint64_t)a5 reasonData:(int64_t)a6
{
}

- (void)setTriggerForNetworkWithReasonAndState:(id)a3 reason:(unint64_t)a4 reasonData:(int64_t)a5 bssid:(id)a6 state:(unint64_t)a7
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  id v12 = a3;
  id v13 = a6;
  if (-[WFBlacklistEngine enabled](self, "enabled"))
  {
    uint64_t v14 = -[WFBlacklistEngine _findBlacklistNode:](self, "_findBlacklistNode:", v12);
    if (v14)
    {
      id v15 = (id)v14;
      id v16 = 0LL;
    }

    else
    {
      uint64_t v18 = -[WFBlackListNode initWithBlacklistNetwork:]( objc_alloc(&OBJC_CLASS___WFBlackListNode),  "initWithBlacklistNetwork:",  v12);
      if (!v18)
      {
        objc_msgSend( NSString,  "stringWithFormat:",  @"%s BlacklistElement alloc failed",  "-[WFBlacklistEngine setTriggerForNetworkWithReasonAndState:reason:reasonData:bssid:state:]");
        id v24 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
        {
          v26 = (void *)NSString;
          id v24 = v24;
          id v27 = objc_msgSend(v26, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v24, "UTF8String"));
          *(_DWORD *)buf = 136446210;
          v29 = (const char *)[v27 UTF8String];
          _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
        }

        uint64_t v19 = 0LL;
        id v16 = 0LL;
        id v15 = 0LL;
        goto LABEL_17;
      }

      id v16 = v18;
      id v15 = v16;
    }

    if (-[WFBlacklistEngine _ignoreTriggersForDeviceProfile:node:]( self,  "_ignoreTriggersForDeviceProfile:node:",  a4,  v15))
    {
      uint64_t v19 = 0LL;
LABEL_18:

      goto LABEL_19;
    }

    [v15 networkDelegate];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 ssid];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      v25 = +[WFBlacklistEngine stringRepresentationWithReason:]( &OBJC_CLASS___WFBlacklistEngine,  "stringRepresentationWithReason:",  a4);
      *(_DWORD *)buf = 136317186;
      v29 = "-[WFBlacklistEngine setTriggerForNetworkWithReasonAndState:reason:reasonData:bssid:state:]";
      __int16 v30 = 2112;
      v31 = v25;
      __int16 v32 = 2160;
      uint64_t v33 = 1752392040LL;
      __int16 v34 = 2112;
      v35 = v19;
      __int16 v36 = 2160;
      uint64_t v37 = 1752392040LL;
      __int16 v38 = 2112;
      id v39 = v13;
      __int16 v40 = 2048;
      unint64_t v41 = a4;
      __int16 v42 = 2048;
      int64_t v43 = a5;
      __int16 v44 = 2048;
      unint64_t v45 = a7;
      _os_log_error_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "%s: Trigger '%@' for '%{mask.hash}@ [%{mask.hash}@]' (reason=%lu reasonData=%ld state=%lu)",  buf,  0x5Cu);
    }

    [v15 addBlacklistTrigger:a4 reasonData:a5 bssid:v13];
    BOOL v21 = -[WFBlacklistEngine _evaluateTriggersForBlacklisting:reason:reasonData:bssid:ssid:state:]( self,  "_evaluateTriggersForBlacklisting:reason:reasonData:bssid:ssid:state:",  v15,  a4,  a5,  v13,  v19,  a7);
    if ((-[NSMutableArray containsObject:](self->_blacklist, "containsObject:", v15) & 1) == 0) {
      -[NSMutableArray addObject:](self->_blacklist, "addObject:", v15);
    }
    -[WFBlacklistEngine _printBlacklist](self, "_printBlacklist");
    if (!v21) {
      goto LABEL_18;
    }
    v22 = -[WFBlacklistEngine blacklistDelegate](self, "blacklistDelegate");
    char v23 = objc_opt_respondsToSelector();

    if ((v23 & 1) == 0) {
      goto LABEL_18;
    }
    -[WFBlacklistEngine blacklistDelegate](self, "blacklistDelegate");
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    [v24 blacklistDidUpdate];
LABEL_17:

    goto LABEL_18;
  }

  objc_msgSend( NSString,  "stringWithFormat:",  @"%s No Blacklisting",  "-[WFBlacklistEngine setTriggerForNetworkWithReasonAndState:reason:reasonData:bssid:state:]");
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = (void *)NSString;
    id v15 = v15;
    objc_msgSend(v17, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v15, "UTF8String"));
    id v16 = (WFBlackListNode *) objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v29 = (const char *)-[WFBlackListNode UTF8String](v16, "UTF8String");
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
LABEL_19:
  }
}

- (void)setTriggerForNetworkWithReason:(id)a3 reason:(unint64_t)a4 reasonData:(int64_t)a5 bssid:(id)a6
{
}

- (BOOL)_evaluateTriggersForBlacklisting:(id)a3 reason:(unint64_t)a4 reasonData:(int64_t)a5 bssid:(id)a6 ssid:(id)a7 state:(unint64_t)a8
{
  uint64_t v120 = *MEMORY[0x1895F89C0];
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v93 = v14;
  if (!v12)
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"%s node is null",  "-[WFBlacklistEngine _evaluateTriggersForBlacklisting:reason:reasonData:bssid:ssid:state:]");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      id v90 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v89, "UTF8String"));
      *(_DWORD *)buf = 136446210;
      v110 = (const char *)[v90 UTF8String];
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }

    char v87 = 0;
    id v15 = v93;
    goto LABEL_92;
  }

  id v15 = v14;
  __int128 v107 = 0u;
  __int128 v108 = 0u;
  __int128 v105 = 0u;
  __int128 v106 = 0u;
  [v12 blacklistTriggers];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v104 = [v16 countByEnumeratingWithState:&v105 objects:v119 count:16];
  if (!v104)
  {

    char v87 = 0;
    goto LABEL_91;
  }

  uint64_t v94 = 0LL;
  uint64_t v99 = 0LL;
  unint64_t v100 = 0LL;
  char v97 = 0;
  char v95 = 0;
  uint64_t v103 = *(void *)v106;
  unint64_t v91 = a8 & 0xFFFFFFFFFFFFFFFELL;
  uint64_t v92 = 0LL;
  uint64_t v17 = (os_log_s *)MEMORY[0x1895F8DA0];
  unint64_t v98 = a8;
  id obj = v16;
  do
  {
    uint64_t v18 = 0LL;
    do
    {
      if (*(void *)v106 != v103) {
        objc_enumerationMutation(obj);
      }
      uint64_t v19 = *(void **)(*((void *)&v105 + 1) + 8 * v18);
      [MEMORY[0x189603F50] date];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v20 timeIntervalSince1970];
      double v22 = v21;

      uint64_t v23 = [v19 triggerReason];
      [v19 triggerReasonTimestamp];
      double v25 = v24;
      if ([v12 enterprisePolicy] && a4 <= 7 && (double v26 = v22 - v25, v22 - v25 <= 300.0))
      {
        objc_msgSend(v19, "bssid", v26);
        id v27 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v28 = [v27 compare:v13 options:1];

        BOOL v29 = v28 == 0;
        unsigned int v30 = HIDWORD(v99);
        if (!v28) {
          unsigned int v30 = HIDWORD(v99) + 1;
        }
        if (v23 != a4) {
          BOOL v29 = 0;
        }
        uint64_t v31 = (v100 + v29);
        if (v23 == a4) {
          uint64_t v32 = (HIDWORD(v100) + 1);
        }
        else {
          uint64_t v32 = HIDWORD(v100);
        }
        unsigned int v33 = v99 + 1;
        HIDWORD(v99) = v30;
        unint64_t v100 = __PAIR64__(v32, v31);
        LODWORD(v99) = v99 + 1;
        if (v30 <= 0x12
          && !-[WFBlacklistEngine _meetsThresholds:count:perSsid:bssid:ssid:]( self,  "_meetsThresholds:count:perSsid:bssid:ssid:",  a4,  v31,  0LL,  v13,  v15)
          && v33 <= 0x12
          && !-[WFBlacklistEngine _meetsThresholds:count:perSsid:bssid:ssid:]( self,  "_meetsThresholds:count:perSsid:bssid:ssid:",  a4,  v32,  1LL,  v13,  v15))
        {
          a8 = v98;
          goto LABEL_21;
        }

        a8 = v98;
        if (v98 == 5 || v98 == 3)
        {
          -[WFBlacklistEngine _setBlacklistedState:state:reason:reasonData:]( self,  "_setBlacklistedState:state:reason:reasonData:",  v12,  3LL,  a4,  a5);
          char v95 = 1;
LABEL_21:
          uint64_t v17 = (os_log_s *)MEMORY[0x1895F8DA0];
          goto LABEL_32;
        }

        id v37 = v13;
        __int16 v38 = (void *)NSString;
        +[WFBlacklistEngine stringRepresentationWithReason:]( &OBJC_CLASS___WFBlacklistEngine,  "stringRepresentationWithReason:",  a4);
        id v39 = (void *)objc_claimAutoreleasedReturnValue();
        [MEMORY[0x189603F50] dateWithTimeIntervalSince1970:v22];
        __int16 v40 = (void *)objc_claimAutoreleasedReturnValue();
        [v38 stringWithFormat:@"%s WFNetworkBlacklistStateNoWoW ignored for %@ @ %@", "-[WFBlacklistEngine _evaluateTriggersForBlacklisting:reason:reasonData:bssid:ssid:state:]", v39, v40];
        unint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();

        uint64_t v17 = (os_log_s *)MEMORY[0x1895F8DA0];
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
        {
          id v42 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v41, "UTF8String"));
          uint64_t v43 = [v42 UTF8String];
          *(_DWORD *)buf = 136446210;
          v110 = (const char *)v43;
          _os_log_impl(&dword_187EBF000, v17, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
        }

        id v13 = v37;
        id v15 = v93;
        a8 = v98;
      }

      else if (objc_msgSend(v12, "enterprisePolicy", v26) && os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v35 = +[WFBlacklistEngine stringRepresentationWithReason:]( &OBJC_CLASS___WFBlacklistEngine,  "stringRepresentationWithReason:",  v23);
        [v19 bssid];
        __int16 v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136316162;
        v110 = "-[WFBlacklistEngine _evaluateTriggersForBlacklisting:reason:reasonData:bssid:ssid:state:]";
        __int16 v111 = 2112;
        v112 = v35;
        __int16 v113 = 2160;
        uint64_t v114 = 1752392040LL;
        __int16 v115 = 2112;
        v116 = v36;
        __int16 v117 = 2048;
        double v118 = v22 - v25;
        _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "%s Trigger %@ for [%{mask.hash}@] was %f seconds ago and outside window. Will not consider for WoW blacklist",  buf,  0x34u);

        uint64_t v17 = (os_log_s *)MEMORY[0x1895F8DA0];
      }

- (BOOL)_ignoreTriggersForDeviceProfile:(unint64_t)a3 node:(id)a4
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  BOOL v7 = v6;
  if (self->_profile != 2)
  {
    if (([v6 enterprisePolicy] & 1) != 0
      || ([v7 networkDelegate],
          id v13 = (void *)objc_claimAutoreleasedReturnValue(),
          int v14 = [v13 isProfileBased],
          v13,
          v14))
    {
      -[WFBlacklistEngine blacklistDelegate](self, "blacklistDelegate");
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      char v16 = objc_opt_respondsToSelector();

      if ((v16 & 1) != 0)
      {
        char v25 = 0;
        unsigned int v24 = 0;
        -[WFBlacklistEngine blacklistDelegate](self, "blacklistDelegate");
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
        int v18 = [v17 retrieveBatteryInfo:&v25 batteryLevel:&v24];

        if (v18)
        {
          if (v25)
          {
            objc_msgSend( NSString,  "stringWithFormat:",  @"%s BlacklistTrigger %lu ignored as device connected to external power supply",  "-[WFBlacklistEngine _ignoreTriggersForDeviceProfile:node:]",  a3);
            id v8 = (id)objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
              goto LABEL_5;
            }
            goto LABEL_21;
          }

          if (a3 == 2 && v24 >= 0x51)
          {
            objc_msgSend( NSString,  "stringWithFormat:",  @"%s BlacklistTrigger %lu ignored as battery level is %d",  "-[WFBlacklistEngine _ignoreTriggersForDeviceProfile:node:]",  2,  v24);
            id v8 = (id)objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
              goto LABEL_5;
            }
LABEL_21:
            double v22 = (void *)NSString;
            id v8 = v8;
            id v9 = objc_msgSend(v22, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v8, "UTF8String"));
            uint64_t v23 = [v9 UTF8String];
            *(_DWORD *)buf = 136446210;
            uint64_t v27 = v23;
            v10 = (os_log_s *)MEMORY[0x1895F8DA0];
            os_log_type_t v11 = OS_LOG_TYPE_ERROR;
            goto LABEL_4;
          }
        }
      }

      else
      {
        objc_msgSend( NSString,  "stringWithFormat:",  @"%s Delegate does not respond to blacklistProfileBatteryInfo",  "-[WFBlacklistEngine _ignoreTriggersForDeviceProfile:node:]");
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
        {
          id v20 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v19, "UTF8String"));
          *(_DWORD *)buf = 136446210;
          uint64_t v27 = [v20 UTF8String];
          _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
        }
      }
    }

    BOOL v12 = 0;
    goto LABEL_17;
  }

  objc_msgSend( NSString,  "stringWithFormat:",  @"%s BlacklistTrigger %lu ignored for %lu",  "-[WFBlacklistEngine _ignoreTriggersForDeviceProfile:node:]",  a3,  2);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    id v9 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v8, "UTF8String"));
    *(_DWORD *)buf = 136446210;
    uint64_t v27 = [v9 UTF8String];
    v10 = (os_log_s *)MEMORY[0x1895F8DA0];
    os_log_type_t v11 = OS_LOG_TYPE_INFO;
LABEL_4:
    _os_log_impl(&dword_187EBF000, v10, v11, "%{public}s", buf, 0xCu);
  }

- (BOOL)removeBlacklistedStateForNetworkWithReason:(id)a3 state:(unint64_t)a4 reason:(unint64_t)a5
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  -[WFBlacklistEngine _findBlacklistNode:](self, "_findBlacklistNode:", a3);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v9 = v8 != 0LL;
  if (!v8)
  {
LABEL_17:
    -[WFBlacklistEngine _printBlacklist](self, "_printBlacklist");
    goto LABEL_18;
  }

  id v10 = objc_alloc_init(MEMORY[0x189603FA8]);
  if (v10)
  {
    os_log_type_t v11 = v10;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    [v8 blacklistedStatesCurrent];
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v29;
      do
      {
        for (uint64_t i = 0LL; i != v14; ++i)
        {
          if (*(void *)v29 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if ([v17 blacklistedState] == a4 && objc_msgSend(v17, "blacklistedReason") == a5) {
            [v11 addObject:v17];
          }
        }

        uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }

      while (v14);
    }

    v26[0] = MEMORY[0x1895F87A8];
    v26[1] = 3221225472LL;
    v26[2] = __77__WFBlacklistEngine_removeBlacklistedStateForNetworkWithReason_state_reason___block_invoke;
    v26[3] = &unk_18A16E910;
    id v18 = v8;
    id v27 = v18;
    [v11 enumerateObjectsUsingBlock:v26];
    [v18 blacklistedStatesCurrent];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 removeObjectsInArray:v11];

    if ([v11 count])
    {
      -[WFBlacklistEngine blacklistDelegate](self, "blacklistDelegate");
      id v20 = (void *)objc_claimAutoreleasedReturnValue();
      char v21 = objc_opt_respondsToSelector();

      if ((v21 & 1) != 0)
      {
        -[WFBlacklistEngine blacklistDelegate](self, "blacklistDelegate");
        double v22 = (void *)objc_claimAutoreleasedReturnValue();
        [v22 blacklistDidUpdate];
      }
    }

    [v11 removeAllObjects];

    BOOL v9 = v8 != 0LL;
    goto LABEL_17;
  }

  objc_msgSend( NSString,  "stringWithFormat:",  @"%s discardedNodes is null",  "-[WFBlacklistEngine removeBlacklistedStateForNetworkWithReason:state:reason:]");
  unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    id v25 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v24, "UTF8String"));
    *(_DWORD *)buf = 136446210;
    uint64_t v34 = [v25 UTF8String];
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }

  BOOL v9 = 0;
LABEL_18:

  return v9;
}

uint64_t __77__WFBlacklistEngine_removeBlacklistedStateForNetworkWithReason_state_reason___block_invoke( uint64_t a1,  uint64_t a2)
{
  return [*(id *)(a1 + 32) processBlacklistedStateMetric:a2 unblacklisting:1 unblacklistingReason:1];
}

- (void)removeBlacklistedStateWithUnblacklistType:(unint64_t)a3
{
  uint64_t v118 = *MEMORY[0x1895F89C0];
  id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
  id v6 = objc_alloc_init(MEMORY[0x189603FA8]);
  BOOL v7 = v6;
  char v87 = v5;
  if (!v5)
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"%s discardedNodes is null",  "-[WFBlacklistEngine removeBlacklistedStateWithUnblacklistType:]");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      goto LABEL_76;
    }
    goto LABEL_77;
  }

  unint64_t v8 = 0x189607000uLL;
  if (!v6)
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"%s discardedBlacklistNodes is null",  "-[WFBlacklistEngine removeBlacklistedStateWithUnblacklistType:]");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
LABEL_76:
      id v77 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v76, "UTF8String"));
      *(_DWORD *)buf = 136446210;
      uint64_t v106 = [v77 UTF8String];
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }

uint64_t __63__WFBlacklistEngine_removeBlacklistedStateWithUnblacklistType___block_invoke( uint64_t a1,  uint64_t a2)
{
  return [*(id *)(a1 + 32) processBlacklistedStateMetric:a2 unblacklisting:1 unblacklistingReason:2];
}

uint64_t __63__WFBlacklistEngine_removeBlacklistedStateWithUnblacklistType___block_invoke_77( uint64_t a1,  uint64_t a2)
{
  uint64_t v4 = a1 + 32;
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(v4 + 8);
  if (v3 == 2) {
    uint64_t v5 = 3LL;
  }
  else {
    uint64_t v5 = 4LL * (v3 == 3);
  }
  return [v2 processBlacklistedStateMetric:a2 unblacklisting:1 unblacklistingReason:v5];
}

- (void)removeExpiredBlacklistedState:(unint64_t)a3
{
  uint64_t v102 = *MEMORY[0x1895F89C0];
  id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
  if (v5)
  {
    __int128 v96 = 0u;
    __int128 v97 = 0u;
    __int128 v94 = 0u;
    __int128 v95 = 0u;
    id obj = self->_blacklist;
    uint64_t v82 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v94,  v99,  16LL);
    id v6 = 0LL;
    if (v82)
    {
      uint64_t v81 = *(void *)v95;
      uint64_t v85 = v5;
      char v87 = self;
LABEL_4:
      uint64_t v7 = 0LL;
      unint64_t v8 = v6;
      while (1)
      {
        if (*(void *)v95 != v81) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(id *)(*((void *)&v94 + 1) + 8 * v7);

        [v6 blacklistedStatesCurrent];
        int v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9) {
          break;
        }
LABEL_64:
        ++v7;
        unint64_t v8 = v6;
        if (v7 == v82)
        {
          uint64_t v82 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v94,  v99,  16LL);
          if (!v82)
          {
            id v74 = v6;
            id v6 = 0LL;
            goto LABEL_67;
          }

          goto LABEL_4;
        }
      }

      [v6 networkDelegate];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = [v10 ssid];

      uint64_t v86 = (void *)v11;
      if (v11)
      {
        [v6 blacklistedStatesHistory];
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v13 = [v12 count];

        double v14 = 0.0;
        if (v13) {
          BOOL v15 = (int)v13 < 1;
        }
        else {
          BOOL v15 = 1;
        }
        uint64_t v84 = v7;
        if (!v15)
        {
          uint64_t v16 = v13 + 1LL;
          while (1)
          {
            [v6 blacklistedStatesHistory];
            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
            [v17 objectAtIndex:(v16 - 2)];
            id v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18)
            {
              if ([v18 blacklistedState] == a3 || objc_msgSend(v18, "blacklistedState") == 5) {
                break;
              }
            }
          }

          [v18 blacklistedStateTimestamp];
          double v14 = v19;
        }

uint64_t __51__WFBlacklistEngine_removeExpiredBlacklistedState___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) processBlacklistedStateMetric:a2 unblacklisting:1 unblacklistingReason:5];
}

- (void)removeBlacklistedStates
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  objc_msgSend( NSString,  "stringWithFormat:",  @"%s Clearing all blacklisted networks: ",  "-[WFBlacklistEngine removeBlacklistedStates]");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    id v4 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v3, "UTF8String"));
    *(_DWORD *)buf = 136446210;
    uint64_t v27 = [v4 UTF8String];
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }

  if (-[NSMutableArray count](self->_blacklist, "count"))
  {
    id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id obj = self->_blacklist;
    uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v17 = self;
      id v8 = 0LL;
      uint64_t v9 = *(void *)v22;
      uint64_t v10 = MEMORY[0x1895F87A8];
      do
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(id *)(*((void *)&v21 + 1) + 8 * i);

          [v5 addObject:v12];
          [v12 blacklistedStatesCurrent];
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
          v19[0] = v10;
          v19[1] = 3221225472LL;
          v19[2] = __44__WFBlacklistEngine_removeBlacklistedStates__block_invoke;
          v19[3] = &unk_18A16E910;
          id v8 = v12;
          id v20 = v8;
          [v13 enumerateObjectsUsingBlock:v19];
        }

        uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
      }

      while (v7);

      self = v17;
    }

    -[NSMutableArray removeObjectsInArray:](self->_blacklist, "removeObjectsInArray:", v5);
    -[WFBlacklistEngine blacklistDelegate](self, "blacklistDelegate");
    double v14 = (void *)objc_claimAutoreleasedReturnValue();
    char v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      -[WFBlacklistEngine blacklistDelegate](self, "blacklistDelegate");
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 blacklistDidUpdate];
    }
  }

  else
  {
    id v5 = 0LL;
  }

  -[WFBlacklistEngine _printBlacklist](self, "_printBlacklist");
}

uint64_t __44__WFBlacklistEngine_removeBlacklistedStates__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) processBlacklistedStateMetric:a2 unblacklisting:1 unblacklistingReason:6];
}

- (void)clearTriggerForNetworkWithUnblacklistReason:(id)a3 reason:(unint64_t)a4
{
  uint64_t v106 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (!v5)
  {
    -[WFBlacklistEngine _printBlacklist](self, "_printBlacklist");
    objc_msgSend( NSString,  "stringWithFormat:",  @"%s Unblacklisting all networks",  "-[WFBlacklistEngine clearTriggerForNetworkWithUnblacklistReason:reason:]");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
    {
      id v7 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v6, "UTF8String"));
      *(_DWORD *)buf = 136446210;
      id v89 = (const char *)[v7 UTF8String];
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
    }

    -[WFBlacklistEngine removeBlacklistedStates](self, "removeBlacklistedStates");
  }

  -[WFBlacklistEngine _findBlacklistNode:](self, "_findBlacklistNode:", v5);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      -[WFBlacklistEngine clearTriggerForNetworkWithUnblacklistReason:reason:].cold.1(v5);
    }
    goto LABEL_85;
  }

  id v9 = objc_alloc_init(MEMORY[0x189603FA8]);
  if (!v9)
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"%s discardedNodes is null",  "-[WFBlacklistEngine clearTriggerForNetworkWithUnblacklistReason:reason:]");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      id v59 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v58, "UTF8String"));
      uint64_t v60 = [v59 UTF8String];
      *(_DWORD *)buf = 136446210;
      id v89 = (const char *)v60;
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }

LABEL_85:
    id v69 = 0LL;
    v73 = 0LL;
    id v74 = 0LL;
    id v10 = 0LL;
    goto LABEL_79;
  }

  id v10 = v9;
  id v74 = objc_alloc_init(MEMORY[0x189603FA8]);
  if (v74)
  {
    [v8 networkDelegate];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v11 ssid];

    v73 = (void *)v12;
    if (v12)
    {
      v70 = self;
      [v8 networkDelegate];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 bssid];
      id v69 = (void *)objc_claimAutoreleasedReturnValue();

      __int128 v85 = 0u;
      __int128 v86 = 0u;
      __int128 v83 = 0u;
      __int128 v84 = 0u;
      [v8 blacklistedStatesCurrent];
      double v14 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = [v14 countByEnumeratingWithState:&v83 objects:v105 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v84;
        id v18 = (os_log_s *)MEMORY[0x1895F8DA0];
        do
        {
          for (uint64_t i = 0LL; i != v16; ++i)
          {
            if (*(void *)v84 != v17) {
              objc_enumerationMutation(v14);
            }
            id v20 = *(void **)(*((void *)&v83 + 1) + 8 * i);
            if ([v20 blacklistedState] == 1)
            {
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316162;
                id v89 = "-[WFBlacklistEngine clearTriggerForNetworkWithUnblacklistReason:reason:]";
                __int16 v90 = 2160;
                uint64_t v91 = 1752392040LL;
                __int16 v92 = 2112;
                __int128 v93 = v73;
                __int16 v94 = 2160;
                uint64_t v95 = 1752392040LL;
                __int16 v96 = 2112;
                __int128 v97 = v69;
                _os_log_error_impl( &dword_187EBF000,  v18,  OS_LOG_TYPE_ERROR,  "%s Unblacklisting and removing '%{mask.hash}@[%{mask.hash}@]' from Autojoin blacklist",  buf,  0x34u);
              }

              [v10 addObject:v20];
            }

            if ([v20 blacklistedState] == 3
              && -[WFBlacklistEngine _evaluateTriggersForUnblacklisting:unblacklistReason:ssid:]( v70,  "_evaluateTriggersForUnblacklisting:unblacklistReason:ssid:",  v8,  a4,  v73))
            {
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316162;
                id v89 = "-[WFBlacklistEngine clearTriggerForNetworkWithUnblacklistReason:reason:]";
                __int16 v90 = 2160;
                uint64_t v91 = 1752392040LL;
                __int16 v92 = 2112;
                __int128 v93 = v73;
                __int16 v94 = 2160;
                uint64_t v95 = 1752392040LL;
                __int16 v96 = 2112;
                __int128 v97 = v69;
                _os_log_error_impl( &dword_187EBF000,  v18,  OS_LOG_TYPE_ERROR,  "%s Unblacklisting and removing '%{mask.hash}@[%{mask.hash}@]' from WoW blacklist",  buf,  0x34u);
              }

              [v10 addObject:v20];
            }

            if ([v20 blacklistedState] == 2)
            {
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316162;
                id v89 = "-[WFBlacklistEngine clearTriggerForNetworkWithUnblacklistReason:reason:]";
                __int16 v90 = 2160;
                uint64_t v91 = 1752392040LL;
                __int16 v92 = 2112;
                __int128 v93 = v73;
                __int16 v94 = 2160;
                uint64_t v95 = 1752392040LL;
                __int16 v96 = 2112;
                __int128 v97 = v69;
                _os_log_error_impl( &dword_187EBF000,  v18,  OS_LOG_TYPE_ERROR,  "%s Unblacklisting and removing '%{mask.hash}@[%{mask.hash}@]' from BSS blacklist",  buf,  0x34u);
              }

              [v10 addObject:v20];
            }
          }

          uint64_t v16 = [v14 countByEnumeratingWithState:&v83 objects:v105 count:16];
        }

        while (v16);
      }

      __int128 v81 = 0u;
      __int128 v82 = 0u;
      __int128 v79 = 0u;
      __int128 v80 = 0u;
      [v8 blacklistTriggers];
      id obj = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v21 = [obj countByEnumeratingWithState:&v79 objects:v104 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        __int128 v23 = (os_log_s *)MEMORY[0x1895F8DA0];
        uint64_t v24 = *(void *)v80;
        do
        {
          uint64_t v25 = 0LL;
          do
          {
            if (*(void *)v80 != v24) {
              objc_enumerationMutation(obj);
            }
            uint64_t v26 = *(void **)(*((void *)&v79 + 1) + 8 * v25);
            [v26 triggerReasonString];
            uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
            [v26 triggerReasonTimestamp];
            double v29 = v28;
            [MEMORY[0x189603F50] date];
            double v30 = (void *)objc_claimAutoreleasedReturnValue();
            [v30 timeIntervalSince1970];
            double v32 = v31;

            if (![v26 triggerReason]
              || [v26 triggerReason] == 1
              || [v26 triggerReason] == 5
              || [v26 triggerReason] == 7
              || [v26 triggerReason] == 2
              || [v26 triggerReason] == 3
              || [v26 triggerReason] == 11
              || [v26 triggerReason] == 12)
            {
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                [MEMORY[0x189603F50] dateWithTimeIntervalSince1970:v29];
                unsigned int v33 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136316674;
                id v89 = "-[WFBlacklistEngine clearTriggerForNetworkWithUnblacklistReason:reason:]";
                __int16 v90 = 2112;
                uint64_t v91 = (uint64_t)v27;
                __int16 v92 = 2112;
                __int128 v93 = v33;
                __int16 v94 = 2160;
                uint64_t v95 = 1752392040LL;
                __int16 v96 = 2112;
                __int128 v97 = v73;
                __int16 v98 = 2160;
                uint64_t v99 = 1752392040LL;
                __int16 v100 = 2112;
                uint64_t v101 = v69;
                id v34 = v23;
                uint64_t v35 = "%s Clearing trigger %@ (%@) for '%{mask.hash}@[%{mask.hash}@]'";
                goto LABEL_47;
              }

              goto LABEL_43;
            }

            if (a4 == 1)
            {
              double v37 = v32 - v29;
              if ([v26 triggerReason] == 4 && v29 != 0.0 && v37 > 300.0)
              {
                if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                {
                  [MEMORY[0x189603F50] dateWithTimeIntervalSince1970:v29];
                  unsigned int v33 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 136316674;
                  id v89 = "-[WFBlacklistEngine clearTriggerForNetworkWithUnblacklistReason:reason:]";
                  __int16 v90 = 2112;
                  uint64_t v91 = (uint64_t)v27;
                  __int16 v92 = 2112;
                  __int128 v93 = v33;
                  __int16 v94 = 2160;
                  uint64_t v95 = 1752392040LL;
                  __int16 v96 = 2112;
                  __int128 v97 = v73;
                  __int16 v98 = 2160;
                  uint64_t v99 = 1752392040LL;
                  __int16 v100 = 2112;
                  uint64_t v101 = v69;
                  id v34 = v23;
                  uint64_t v35 = "%s Clearing(for interval exceeded) trigger %@ (%@) for '%{mask.hash}@[%{mask.hash}@]'";
LABEL_47:
                  uint32_t v36 = 72;
LABEL_48:
                  _os_log_error_impl(&dword_187EBF000, v34, OS_LOG_TYPE_ERROR, v35, buf, v36);
                }

                goto LABEL_43;
              }

              if ([v26 triggerReason] == 8 && v29 != 0.0)
              {
                -[WFBlacklistEngine bssBlacklistExpiry](v70, "bssBlacklistExpiry");
                if (v37 > v38)
                {
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                  {
                    [MEMORY[0x189603F50] dateWithTimeIntervalSince1970:v29];
                    unsigned int v33 = (void *)objc_claimAutoreleasedReturnValue();
                    [v26 triggerReasonTimestamp];
                    *(_DWORD *)buf = 136316930;
                    id v89 = "-[WFBlacklistEngine clearTriggerForNetworkWithUnblacklistReason:reason:]";
                    __int16 v90 = 2112;
                    uint64_t v91 = (uint64_t)v27;
                    __int16 v92 = 2112;
                    __int128 v93 = v33;
                    __int16 v94 = 2160;
                    uint64_t v95 = 1752392040LL;
                    __int16 v96 = 2112;
                    __int128 v97 = v73;
                    __int16 v98 = 2160;
                    uint64_t v99 = 1752392040LL;
                    __int16 v100 = 2112;
                    uint64_t v101 = v69;
                    __int16 v102 = 2048;
                    unint64_t v103 = (unint64_t)(v32 - v39);
                    id v34 = v23;
                    uint64_t v35 = "%s Clearing(for interval exceeded) trigger %@ (%@) for '%{mask.hash}@[%{mask.hash}@] (diff:%lu)'";
                    uint32_t v36 = 82;
                    goto LABEL_48;
                  }

- (BOOL)_evaluateTriggersForUnblacklisting:(id)a3 unblacklistReason:(unint64_t)a4 ssid:(id)a5
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  [v7 blacklistedStatesHistory];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 count];

  -[WFBlacklistEngine blacklistDelegate](self, "blacklistDelegate");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  char v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) == 0)
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"%s Delegate does not respond to isUserModeInteractive",  "-[WFBlacklistEngine _evaluateTriggersForUnblacklisting:unblacklistReason:ssid:]");
    double v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      id v32 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v31, "UTF8String"));
      *(_DWORD *)buf = 136446210;
      uint64_t v42 = [v32 UTF8String];
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }

    goto LABEL_24;
  }

  -[WFBlacklistEngine blacklistDelegate](self, "blacklistDelegate");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  int v13 = [v12 isUserModeInteractive];

  double v14 = "non-interactive";
  if (v13) {
    double v14 = "interactive";
  }
  objc_msgSend( NSString,  "stringWithFormat:",  @"%s User mode %s ",  "-[WFBlacklistEngine _evaluateTriggersForUnblacklisting:unblacklistReason:ssid:]",  v14);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    id v16 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v15, "UTF8String"));
    *(_DWORD *)buf = 136446210;
    uint64_t v42 = [v16 UTF8String];
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }

  if ((v13 & 1) != 0)
  {
LABEL_24:
    LOBYTE(v17) = 1;
    goto LABEL_25;
  }

  id v34 = v7;
  unint64_t v35 = a4;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  [v7 blacklistedStatesHistory];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v18 = [v17 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = 0LL;
    char v21 = 0;
    uint64_t v22 = *(void *)v37;
    uint64_t v23 = v9 - 1;
    unint64_t v24 = 13LL;
    do
    {
      for (uint64_t i = 0LL; i != v19; ++i)
      {
        if (*(void *)v37 != v22) {
          objc_enumerationMutation(v17);
        }
        uint64_t v26 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        if ([v26 blacklistedState] != 1)
        {
          if ([v26 blacklistedReason] == 2)
          {
            [MEMORY[0x189603F50] date];
            uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
            [v27 timeIntervalSince1970];
            double v29 = v28;

            [v26 blacklistedStateTimestamp];
            v21 |= v29 - v30 < 21600.0;
          }

          if (v20 == v23) {
            unint64_t v24 = [v26 blacklistedReason];
          }
          ++v20;
        }
      }

      uint64_t v19 = [v17 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }

    while (v19);
  }

  else
  {
    char v21 = 0;
    unint64_t v24 = 13LL;
  }

  LOBYTE(v17) = 0;
  if (v35 != 1 || (v21 & 1) != 0)
  {
    id v7 = v34;
  }

  else
  {
    id v7 = v34;
    if (v24 <= 7) {
      LODWORD(v17) = (0xB0u >> v24) & 1;
    }
  }

- (void)networkPruned:(id)a3
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (v4)
  {
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v5 = self->_blacklist;
    uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v26,  v40,  16LL);
    if (v6)
    {
      uint64_t v7 = v6;
      unint64_t v24 = self;
      id v25 = v4;
      id v8 = 0LL;
      uint64_t v9 = *(void *)v27;
      id v10 = (os_log_s *)MEMORY[0x1895F8DA0];
      do
      {
        uint64_t v11 = 0LL;
        uint64_t v12 = v8;
        do
        {
          if (*(void *)v27 != v9) {
            objc_enumerationMutation(v5);
          }
          id v8 = *(id *)(*((void *)&v26 + 1) + 8 * v11);

          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            [v8 networkDelegate];
            int v13 = (void *)objc_claimAutoreleasedReturnValue();
            [v13 ssid];
            double v14 = (void *)objc_claimAutoreleasedReturnValue();
            [v8 networkDelegate];
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
            [v15 bssid];
            id v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136316162;
            double v31 = "-[WFBlacklistEngine networkPruned:]";
            __int16 v32 = 2160;
            uint64_t v33 = 1752392040LL;
            __int16 v34 = 2112;
            unint64_t v35 = v14;
            __int16 v36 = 2160;
            uint64_t v37 = 1752392040LL;
            __int16 v38 = 2112;
            __int128 v39 = v16;
            _os_log_error_impl( &dword_187EBF000,  v10,  OS_LOG_TYPE_ERROR,  "%s blacklistedNode %{mask.hash}@[%{mask.hash}@]",  buf,  0x34u);
          }

          ++v11;
          uint64_t v12 = v8;
        }

        while (v7 != v11);
        uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v26,  v40,  16LL);
      }

      while (v7);

      self = v24;
      id v4 = v25;
    }

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      -[WFBlacklistEngine networkPruned:].cold.1(v4);
    }
    -[WFBlacklistEngine _findBlacklistNode:](self, "_findBlacklistNode:", v4);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      id v18 = v17;
      [v17 networkPruned];
    }

    else
    {
      objc_msgSend( NSString,  "stringWithFormat:",  @"%s Node not found for network",  "-[WFBlacklistEngine networkPruned:]");
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
      {
        char v21 = (void *)NSString;
        id v18 = v18;
        id v22 = objc_msgSend(v21, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v18, "UTF8String"));
        uint64_t v23 = [v22 UTF8String];
        *(_DWORD *)buf = 136446210;
        double v31 = (const char *)v23;
        _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
      }
    }
  }

  else
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"%s network nil",  "-[WFBlacklistEngine networkPruned:]");
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = (void *)NSString;
      id v18 = v18;
      id v20 = objc_msgSend(v19, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v18, "UTF8String"));
      *(_DWORD *)buf = 136446210;
      double v31 = (const char *)[v20 UTF8String];
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }
  }
}

- (void)networkRemovedForSsid:(id)a3
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id obj = self->_blacklist;
  uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v37,  v43,  16LL);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v33 = v5;
    __int16 v32 = self;
    char v8 = 0;
    id v9 = 0LL;
    uint64_t v10 = *(void *)v38;
    do
    {
      uint64_t v11 = 0LL;
      uint64_t v12 = v9;
      do
      {
        if (*(void *)v38 != v10) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(id *)(*((void *)&v37 + 1) + 8 * v11);

        [v9 networkDelegate];
        int v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v13 ssid];
        double v14 = (void *)objc_claimAutoreleasedReturnValue();
        int v15 = [v4 isEqualToString:v14];

        if (v15)
        {
          id v16 = (void *)NSString;
          [v9 networkDelegate];
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
          [v17 ssid];
          id v18 = (void *)objc_claimAutoreleasedReturnValue();
          [v9 networkDelegate];
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
          [v19 ssid];
          id v20 = (void *)objc_claimAutoreleasedReturnValue();
          [v16 stringWithFormat:@"%s Removing blacklist node for network %@[%@]", "-[WFBlacklistEngine networkRemovedForSsid:]", v18, v20];
          char v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
          {
            id v22 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v21, "UTF8String"));
            uint64_t v23 = [v22 UTF8String];
            *(_DWORD *)buf = 136446210;
            uint64_t v42 = v23;
            _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
          }

          [v9 blacklistTriggers];
          unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
          [v24 removeAllObjects];

          [v9 blacklistedStatesCurrent];
          id v25 = (void *)objc_claimAutoreleasedReturnValue();
          v35[0] = MEMORY[0x1895F87A8];
          v35[1] = 3221225472LL;
          v35[2] = __43__WFBlacklistEngine_networkRemovedForSsid___block_invoke;
          v35[3] = &unk_18A16E910;
          id v26 = v9;
          id v36 = v26;
          [v25 enumerateObjectsUsingBlock:v35];

          [v26 blacklistedStatesCurrent];
          __int128 v27 = (void *)objc_claimAutoreleasedReturnValue();
          [v27 removeAllObjects];

          [v26 blacklistedStatesHistory];
          __int128 v28 = (void *)objc_claimAutoreleasedReturnValue();
          [v28 removeAllObjects];

          [v33 addObject:v26];
          char v8 = 1;
        }

        ++v11;
        uint64_t v12 = v9;
      }

      while (v7 != v11);
      uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v37,  v43,  16LL);
    }

    while (v7);

    self = v32;
    id v5 = v33;
  }

  else
  {
    char v8 = 0;
  }

  if ([v5 count]) {
    -[NSMutableArray removeObjectsInArray:](self->_blacklist, "removeObjectsInArray:", v5);
  }
  if ((v8 & 1) != 0)
  {
    -[WFBlacklistEngine blacklistDelegate](self, "blacklistDelegate");
    __int128 v29 = (void *)objc_claimAutoreleasedReturnValue();
    char v30 = objc_opt_respondsToSelector();

    if ((v30 & 1) != 0)
    {
      -[WFBlacklistEngine blacklistDelegate](self, "blacklistDelegate");
      double v31 = (void *)objc_claimAutoreleasedReturnValue();
      [v31 blacklistDidUpdate];
    }
  }
}

uint64_t __43__WFBlacklistEngine_networkRemovedForSsid___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) processBlacklistedStateMetric:a2 unblacklisting:1 unblacklistingReason:0];
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  if (a3)
  {
    self->_enabled = 1;
  }

  else
  {
    self->_enabled = 0;
    -[WFBlacklistEngine removeBlacklistedStates](self, "removeBlacklistedStates");
  }

- (BOOL)_meetsThresholds:(unint64_t)a3 count:(unsigned int)a4 perSsid:(BOOL)a5 bssid:(id)a6 ssid:(id)a7
{
  BOOL v8 = a5;
  uint64_t v9 = *(void *)&a4;
  uint64_t v42 = *MEMORY[0x1895F89C0];
  id v12 = a6;
  id v13 = a7;
  if (v8)
  {
    -[WFBlacklistEngine ssidThresholds](self, "ssidThresholds");
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 objectAtIndexedSubscript:a3];
    double v14 = (void *)objc_claimAutoreleasedReturnValue();
    unsigned int v15 = [v14 unsignedIntValue];

    LOBYTE(v16) = v15 <= v9;
    uint64_t v17 = (void *)NSString;
    else {
      id v18 = "met";
    }
    -[WFBlacklistEngine ssidThresholds](self, "ssidThresholds");
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 objectAtIndexedSubscript:a3];
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 stringWithFormat:@"%s ssid '%@' %s thresholds. CurrentCount:%d ThresholdCount:%d", "-[WFBlacklistEngine _meetsThresholds:count:perSsid:bssid:ssid:]", v13, v18, v9, objc_msgSend(v20, "unsignedIntValue")];
    char v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
    {
      id v22 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v21, "UTF8String"));
      *(_DWORD *)buf = 136446210;
      double v31 = (const char *)[v22 UTF8String];
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
    }
  }

  else
  {
    -[WFBlacklistEngine bssidThresholds](self, "bssidThresholds");
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 objectAtIndexedSubscript:a3];
    unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    unsigned int v25 = [v24 unsignedIntValue];
    LODWORD(v16) = v25 <= v9;

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
    {
      else {
        id v26 = "met";
      }
      -[WFBlacklistEngine bssidThresholds](self, "bssidThresholds");
      __int128 v27 = (void *)objc_claimAutoreleasedReturnValue();
      [v27 objectAtIndexedSubscript:a3];
      __int128 v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316418;
      double v31 = "-[WFBlacklistEngine _meetsThresholds:count:perSsid:bssid:ssid:]";
      __int16 v32 = 2160;
      uint64_t v33 = 1752392040LL;
      __int16 v34 = 2112;
      id v35 = v12;
      __int16 v36 = 2080;
      __int128 v37 = v26;
      __int16 v38 = 1024;
      int v39 = v9;
      __int16 v40 = 1024;
      int v41 = [v28 unsignedIntValue];
      _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "%s bssid '%{mask.hash}@' %s thresholds. CurrentCount:%d ThresholdCount:%d",  buf,  0x36u);
    }
  }

  return (char)v16;
}

- (id)_findBlacklistNode:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = self->_blacklist;
  uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0LL;
    uint64_t v9 = *(void *)v14;
LABEL_3:
    uint64_t v10 = 0LL;
    uint64_t v11 = v8;
    while (1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v5);
      }
      id v8 = *(id *)(*((void *)&v13 + 1) + 8 * v10);

      if (objc_msgSend(v8, "containsNetwork:", v4, (void)v13)) {
        break;
      }
      ++v10;
      uint64_t v11 = v8;
      if (v7 == v10)
      {
        uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
        if (v7) {
          goto LABEL_3;
        }

        goto LABEL_10;
      }
    }
  }

  else
  {
LABEL_10:
    id v8 = 0LL;
  }

  return v8;
}

- (id)retrieveNetworksInBlacklistedState:(unint64_t)a3
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
  if (v5)
  {
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    uint64_t v6 = self->_blacklist;
    uint64_t v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v28,  v33,  16LL);
    if (v23)
    {
      id v7 = 0LL;
      id obj = v6;
      uint64_t v22 = *(void *)v29;
      do
      {
        uint64_t v8 = 0LL;
        uint64_t v9 = v7;
        do
        {
          if (*(void *)v29 != v22) {
            objc_enumerationMutation(obj);
          }
          id v7 = *(id *)(*((void *)&v28 + 1) + 8 * v8);

          __int128 v26 = 0u;
          __int128 v27 = 0u;
          __int128 v24 = 0u;
          __int128 v25 = 0u;
          [v7 blacklistedStatesCurrent];
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v25;
            do
            {
              for (uint64_t i = 0LL; i != v12; ++i)
              {
                if (*(void *)v25 != v13) {
                  objc_enumerationMutation(v10);
                }
                if ([*(id *)(*((void *)&v24 + 1) + 8 * i) blacklistedState] == a3)
                {
                  [v7 networkDelegate];
                  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v15)
                  {
                    [v7 networkDelegate];
                    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
                    uint64_t v17 = (void *)[v16 copyWithZone:0];

                    if (v17) {
                      [v5 addObject:v17];
                    }
                  }
                }
              }

              uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
            }

            while (v12);
          }

          ++v8;
          uint64_t v9 = v7;
        }

        while (v8 != v23);
        uint64_t v6 = obj;
        uint64_t v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v28,  v33,  16LL);
      }

      while (v23);
    }
  }

  else
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"%s  results alloc failed",  "-[WFBlacklistEngine retrieveNetworksInBlacklistedState:]");
    uint64_t v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = (void *)NSString;
      uint64_t v6 = v6;
      id v20 = objc_msgSend(v19, "stringWithFormat:", @"[WiFiPolicy] %s", -[NSMutableArray UTF8String](v6, "UTF8String"));
      *(_DWORD *)buf = 136446210;
      uint64_t v35 = [v20 UTF8String];
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }
  }

  return v5;
}

- (id)retrieveNetworksInBlacklistedStateHistory:(unint64_t)a3
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v24 = objc_alloc_init(MEMORY[0x189603FA8]);
  if (v24)
  {
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    id v5 = self->_blacklist;
    uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v30,  v35,  16LL);
    if (v6)
    {
      uint64_t v7 = v6;
      id v8 = 0LL;
      uint64_t v9 = *(void *)v31;
      id obj = v5;
      do
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          uint64_t v11 = v8;
          if (*(void *)v31 != v9) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(id *)(*((void *)&v30 + 1) + 8 * i);

          __int128 v28 = 0u;
          __int128 v29 = 0u;
          __int128 v26 = 0u;
          __int128 v27 = 0u;
          [v8 blacklistedStatesHistory];
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v27;
            while (2)
            {
              for (uint64_t j = 0LL; j != v14; ++j)
              {
                if (*(void *)v27 != v15) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v17 = *(void **)(*((void *)&v26 + 1) + 8 * j);
                if ([v17 blacklistedState] == a3 || objc_msgSend(v17, "blacklistedState") == 5)
                {
                  [v8 networkDelegate];
                  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v18)
                  {
                    [v8 networkDelegate];
                    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
                    id v20 = (void *)[v19 copyWithZone:0];

                    if (v20) {
                      [v24 addObject:v20];
                    }

                    goto LABEL_21;
                  }
                }
              }

              uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
              if (v14) {
                continue;
              }
              break;
            }
          }

- (id)retrieveBlacklistedStateHistoryForNetwork:(id)a3 state:(unint64_t)a4 timestamps:(id)a5 reasonData:(id)a6
{
  uint64_t v52 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (!-[WFBlacklistEngine isNetworkInBlacklistedState:state:](self, "isNetworkInBlacklistedState:state:", v10, a4))
  {
    uint64_t v15 = 0LL;
    goto LABEL_30;
  }

  -[WFBlacklistEngine _findBlacklistNode:](self, "_findBlacklistNode:", v10);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    id v14 = objc_alloc_init(MEMORY[0x189603FA8]);
    if (v14)
    {
      uint64_t v15 = v14;
      __int128 v47 = 0u;
      __int128 v48 = 0u;
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      [v13 blacklistedStatesHistory];
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v16 countByEnumeratingWithState:&v45 objects:v49 count:16];
      if (!v17) {
        goto LABEL_28;
      }
      uint64_t v18 = v17;
      uint64_t v42 = v13;
      id v43 = v10;
      uint64_t v19 = *(void *)v46;
      id obj = v16;
      while (1)
      {
        uint64_t v20 = 0LL;
        do
        {
          if (*(void *)v46 != v19) {
            objc_enumerationMutation(obj);
          }
          char v21 = *(void **)(*((void *)&v45 + 1) + 8 * v20);
          uint64_t v22 = [v21 blacklistedReason];
          [v21 blacklistedStateTimestamp];
          double v24 = v23;
          uint64_t v25 = [v21 blacklistedReasonData];
          [MEMORY[0x189607968] numberWithUnsignedInteger:v22];
          __int128 v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v26)
          {
            objc_msgSend( NSString,  "stringWithFormat:",  @"%s reasonNum failed",  "-[WFBlacklistEngine retrieveBlacklistedStateHistoryForNetwork:state:timestamps:reasonData:]");
            __int128 v31 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
            {
LABEL_21:
              id v32 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v31, "UTF8String"));
              uint64_t v33 = [v32 UTF8String];
              *(_DWORD *)buf = 136446210;
              uint64_t v51 = v33;
              _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
            }

- (id)retrieveReasonsForNetworkInBlacklistedState:(id)a3 state:(unint64_t)a4 timestamps:(id)a5 reasonData:(id)a6
{
  uint64_t v51 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v43 = a5;
  id v42 = a6;
  if (!-[WFBlacklistEngine isNetworkInBlacklistedState:state:](self, "isNetworkInBlacklistedState:state:", v10, a4))
  {
    uint64_t v13 = 0LL;
    goto LABEL_27;
  }

  -[WFBlacklistEngine _findBlacklistNode:](self, "_findBlacklistNode:", v10);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x189603FA8]);
    if (v12)
    {
      uint64_t v13 = v12;
      __int128 v46 = 0u;
      __int128 v47 = 0u;
      __int128 v44 = 0u;
      __int128 v45 = 0u;
      [v11 blacklistTriggers];
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = [v14 countByEnumeratingWithState:&v44 objects:v48 count:16];
      if (!v15) {
        goto LABEL_25;
      }
      uint64_t v16 = v15;
      id v40 = v11;
      id v41 = v10;
      uint64_t v17 = *(void *)v45;
      unint64_t v18 = 0x189607000uLL;
      while (1)
      {
        uint64_t v19 = 0LL;
        do
        {
          unint64_t v20 = v18;
          if (*(void *)v45 != v17) {
            objc_enumerationMutation(v14);
          }
          char v21 = *(void **)(*((void *)&v44 + 1) + 8 * v19);
          uint64_t v22 = [v21 triggerReason];
          [v21 triggerReasonTimestamp];
          double v24 = v23;
          uint64_t v25 = [v21 triggerReasonData];
          [MEMORY[0x189607968] numberWithUnsignedInteger:v22];
          __int128 v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            uint64_t v27 = [MEMORY[0x189607968] numberWithDouble:v24];
            if (v27)
            {
              id v28 = (id)v27;
              uint64_t v29 = [MEMORY[0x189607968] numberWithInteger:v25];
              if (v29)
              {
                id v30 = (id)v29;
                [v13 addObject:v26];
                [v43 addObject:v28];
                [v42 addObject:v30];
LABEL_13:

                unint64_t v18 = v20;
                goto LABEL_14;
              }

              unint64_t v18 = v20;
              objc_msgSend( *(id *)(v20 + 2600),  "stringWithFormat:",  @"%s reasonDataNum failed",  "-[WFBlacklistEngine retrieveReasonsForNetworkInBlacklistedState:state:timestamps:reasonData:]");
              id v39 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
              {
                id v33 = objc_msgSend( *(id *)(v20 + 2600), "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v39, "UTF8String"));
                uint64_t v34 = [v33 UTF8String];
                *(_DWORD *)buf = 136446210;
                uint64_t v50 = v34;
                _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

                unint64_t v18 = v20;
              }
            }

            else
            {
              unint64_t v18 = v20;
              objc_msgSend( *(id *)(v20 + 2600),  "stringWithFormat:",  @"%s timeNum failed",  "-[WFBlacklistEngine retrieveReasonsForNetworkInBlacklistedState:state:timestamps:reasonData:]");
              id v28 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
              {
LABEL_19:
                __int128 v31 = *(void **)(v20 + 2600);
                id v28 = v28;
                id v30 = objc_msgSend(v31, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v28, "UTF8String"));
                uint64_t v32 = [v30 UTF8String];
                *(_DWORD *)buf = 136446210;
                uint64_t v50 = v32;
                _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
                goto LABEL_13;
              }
            }
          }

          else
          {
            unint64_t v18 = v20;
            objc_msgSend( *(id *)(v20 + 2600),  "stringWithFormat:",  @"%s reasonNum failed",  "-[WFBlacklistEngine retrieveReasonsForNetworkInBlacklistedState:state:timestamps:reasonData:]");
            id v28 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
              goto LABEL_19;
            }
          }

- (BOOL)isNetworkInBlacklistedState:(id)a3 state:(unint64_t)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = v5;
  if (v5) {
    char v7 = [v5 hasBlacklistedState:a4];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (int64_t)getRssiWhenNetworkWasBlacklisted:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = v3;
  if (v3)
  {
    [v3 networkDelegate];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    int64_t v6 = [v5 rssi];
  }

  else
  {
    int64_t v6 = 0LL;
  }

  return v6;
}

- (BOOL)isNetworkBlacklistedForAutoJoinDueToTrigDisc:(id)a3 rssi:(int64_t *)a4 timestamp:(double *)a5
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v30 = a3;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v8 = self->_blacklist;
  uint64_t v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v35,  v40,  16LL);
  if (v9)
  {
    uint64_t v10 = v9;
    id v28 = a4;
    uint64_t v29 = a5;
    id v11 = 0LL;
    uint64_t v12 = *(void *)v36;
    do
    {
      for (uint64_t i = 0LL; i != v10; ++i)
      {
        id v14 = v11;
        if (*(void *)v36 != v12) {
          objc_enumerationMutation(v8);
        }
        id v11 = *(id *)(*((void *)&v35 + 1) + 8 * i);

        if ([v11 hasBlacklistedState:1])
        {
          [v11 networkDelegate];
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
          [v15 ssid];
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
          [v30 ssid];
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
          int v18 = [v16 isEqual:v17];

          if (v18)
          {
            __int128 v33 = 0u;
            __int128 v34 = 0u;
            __int128 v31 = 0u;
            __int128 v32 = 0u;
            [v11 blacklistedStatesCurrent];
            uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v39 count:16];
            if (v20)
            {
              uint64_t v21 = v20;
              uint64_t v22 = *(void *)v32;
              while (2)
              {
                for (uint64_t j = 0LL; j != v21; ++j)
                {
                  if (*(void *)v32 != v22) {
                    objc_enumerationMutation(v19);
                  }
                  double v24 = *(void **)(*((void *)&v31 + 1) + 8 * j);
                  if ([v24 blacklistedReason] == 6)
                  {
                    if (v28) {
                      int64_t *v28 = (int)[v24 blacklistedReasonData];
                    }
                    if (v29)
                    {
                      [v24 blacklistedStateTimestamp];
                      *(void *)uint64_t v29 = v26;
                    }

                    BOOL v25 = 1;
                    goto LABEL_25;
                  }
                }

                uint64_t v21 = [v19 countByEnumeratingWithState:&v31 objects:v39 count:16];
                if (v21) {
                  continue;
                }
                break;
              }
            }
          }
        }
      }

      uint64_t v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v35,  v40,  16LL);
    }

    while (v10);
    BOOL v25 = 0;
    uint64_t v19 = v11;
    id v11 = 0LL;
LABEL_25:
  }

  else
  {
    id v11 = 0LL;
    BOOL v25 = 0;
  }

  return v25;
}

- (id)retrieveBlacklistedNetworkSsids:(unint64_t)a3
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v5 = objc_alloc_init(MEMORY[0x189607940]);
  if (!v5)
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"%s list not created",  "-[WFBlacklistEngine retrieveBlacklistedNetworkSsids:]");
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    uint64_t v22 = (void *)NSString;
    id v16 = v16;
    id v18 = objc_msgSend(v22, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v16, "UTF8String"));
    *(_DWORD *)buf = 136446210;
    uint64_t v38 = [v18 UTF8String];
    uint64_t v20 = (os_log_s *)MEMORY[0x1895F8DA0];
    goto LABEL_21;
  }

  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id obj = self->_blacklist;
  uint64_t v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v31,  v36,  16LL);
  if (v25)
  {
    id v6 = 0LL;
    uint64_t v24 = *(void *)v32;
    do
    {
      uint64_t v7 = 0LL;
      id v8 = v6;
      do
      {
        if (*(void *)v32 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = v7;
        id v6 = *(id *)(*((void *)&v31 + 1) + 8 * v7);

        __int128 v29 = 0u;
        __int128 v30 = 0u;
        __int128 v27 = 0u;
        __int128 v28 = 0u;
        [v6 blacklistedStatesCurrent];
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v28;
          do
          {
            for (uint64_t i = 0LL; i != v11; ++i)
            {
              if (*(void *)v28 != v12) {
                objc_enumerationMutation(v9);
              }
              if ([*(id *)(*((void *)&v27 + 1) + 8 * i) blacklistedState] == a3)
              {
                [v6 networkDelegate];
                id v14 = (void *)objc_claimAutoreleasedReturnValue();
                [v14 ssid];
                uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

                [v5 appendFormat:@"%@ ", v15];
              }
            }

            uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
          }

          while (v11);
        }

        uint64_t v7 = v26 + 1;
        id v8 = v6;
      }

      while (v26 + 1 != v25);
      uint64_t v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v31,  v36,  16LL);
    }

    while (v25);
  }

  [NSString stringWithFormat:@"%s : %@", "-[WFBlacklistEngine retrieveBlacklistedNetworkSsids:]", v5];
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    uint64_t v17 = (void *)NSString;
    id v16 = v16;
    id v18 = objc_msgSend(v17, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v16, "UTF8String"));
    uint64_t v19 = [v18 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v38 = v19;
    uint64_t v20 = (os_log_s *)MEMORY[0x1895F8DA0];
LABEL_21:
    _os_log_impl(&dword_187EBF000, v20, OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }

- (unint64_t)getBlacklistedNetworkCount
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  v2 = self->_blacklist;
  uint64_t v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v23,  v30,  16LL);
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0LL;
    unint64_t v6 = 0LL;
    uint64_t v7 = *(void *)v24;
    do
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        uint64_t v9 = v5;
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v2);
        }
        id v5 = *(id *)(*((void *)&v23 + 1) + 8 * i);

        __int128 v21 = 0u;
        __int128 v22 = 0u;
        __int128 v19 = 0u;
        __int128 v20 = 0u;
        [v5 blacklistedStatesCurrent];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v29 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v20;
LABEL_8:
          uint64_t v14 = 0LL;
          while (1)
          {
            if (*(void *)v20 != v13) {
              objc_enumerationMutation(v10);
            }
            if ([*(id *)(*((void *)&v19 + 1) + 8 * v14) blacklistedState]) {
              break;
            }
            if (v12 == ++v14)
            {
              uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v29 count:16];
              if (v12) {
                goto LABEL_8;
              }
              break;
            }
          }
        }
      }

      v6 += v4;
      uint64_t v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v23,  v30,  16LL);
    }

    while (v4);
  }

  else
  {
    unint64_t v6 = 0LL;
  }

  objc_msgSend( NSString,  "stringWithFormat:",  @"%s count:%lu",  "-[WFBlacklistEngine getBlacklistedNetworkCount]",  v6);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    id v16 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v15, "UTF8String"));
    uint64_t v17 = [v16 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v28 = v17;
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }

  return v6;
}

- (void)_printBlacklist
{
  uint64_t v105 = *MEMORY[0x1895F89C0];
  if (-[NSMutableArray count](self->_blacklist, "count"))
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"%s Current blacklist:",  "-[WFBlacklistEngine _printBlacklist]");
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
    {
      id v4 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v3, "UTF8String"));
      *(_DWORD *)buf = 136446210;
      uint64_t v95 = [v4 UTF8String];
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
    }

    id v74 = objc_alloc_init(MEMORY[0x189607848]);
    [v74 setDateFormat:@"MM/dd/yy HH:mm:ss.SSS"];
    __int128 v89 = 0u;
    __int128 v90 = 0u;
    __int128 v87 = 0u;
    __int128 v88 = 0u;
    id obj = self->_blacklist;
    uint64_t v66 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v87,  v104,  16LL);
    if (v66)
    {
      id v5 = (os_log_s *)MEMORY[0x1895F8DA0];
      uint64_t v65 = *(void *)v88;
      do
      {
        uint64_t v6 = 0LL;
        do
        {
          if (*(void *)v88 != v65) {
            objc_enumerationMutation(obj);
          }
          uint64_t v69 = v6;
          uint64_t v7 = *(void **)(*((void *)&v87 + 1) + 8 * v6);
          [v7 networkDelegate];
          id v8 = (void *)objc_claimAutoreleasedReturnValue();
          [v8 ssid];
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v10 = [v9 copy];

          [v7 networkDelegate];
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
          [v11 bssid];
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v13 = [v12 copy];

          id v70 = v7;
          [v7 blacklistedStatesCurrent];
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
          int v15 = [v14 count];

          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 141559042;
            id v16 = "YES";
            if (!v15) {
              id v16 = "NO";
            }
            uint64_t v95 = 1752392040LL;
            __int16 v96 = 2112;
            uint64_t v97 = v10;
            __int16 v98 = 2160;
            uint64_t v99 = 1752392040LL;
            __int16 v100 = 2112;
            uint64_t v101 = v13;
            __int16 v102 = 2080;
            unint64_t v103 = v16;
            _os_log_impl( &dword_187EBF000,  v5,  OS_LOG_TYPE_DEFAULT,  "Network '%{mask.hash}@' BSSID %{mask.hash}@ isBlacklisted:%s ",  buf,  0x34u);
          }

          id v67 = (void *)v13;
          id v68 = (void *)v10;
          [MEMORY[0x189607940] stringWithString:@" BlacklistHistory: "];
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          __int128 v83 = 0u;
          __int128 v84 = 0u;
          __int128 v85 = 0u;
          __int128 v86 = 0u;
          [v7 blacklistedStatesHistory];
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v18 = [v17 countByEnumeratingWithState:&v83 objects:v93 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = 0LL;
            uint64_t v21 = *(void *)v84;
            do
            {
              for (uint64_t i = 0LL; i != v19; ++i)
              {
                if (*(void *)v84 != v21) {
                  objc_enumerationMutation(v17);
                }
                __int128 v23 = *(void **)(*((void *)&v83 + 1) + 8 * i);
                [v23 blacklistedStateString];
                __int128 v24 = (void *)objc_claimAutoreleasedReturnValue();
                [v23 blacklistedStateTimestamp];
                __int128 v25 = (void *)NSString;
                objc_msgSend(MEMORY[0x189603F50], "dateWithTimeIntervalSince1970:");
                __int128 v26 = (void *)objc_claimAutoreleasedReturnValue();
                [v74 stringFromDate:v26];
                __int128 v27 = (void *)objc_claimAutoreleasedReturnValue();
                [v25 stringWithFormat:@"[%d] %@ @ %@, ", v20 + i, v24, v27];
                uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();

                [v73 appendString:v28];
              }

              uint64_t v19 = [v17 countByEnumeratingWithState:&v83 objects:v93 count:16];
              uint64_t v20 = (v20 + i);
            }

            while (v19);
          }

          [NSString stringWithFormat:@"%@", v73];
          __int128 v29 = (void *)objc_claimAutoreleasedReturnValue();
          __int128 v30 = (os_log_s *)MEMORY[0x1895F8DA0];
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
          {
            id v31 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v29, "UTF8String"));
            uint64_t v32 = [v31 UTF8String];
            *(_DWORD *)buf = 136446210;
            uint64_t v95 = v32;
            _os_log_impl(&dword_187EBF000, v30, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
          }

          [MEMORY[0x189607940] stringWithString:@" States: "];
          char v72 = (void *)objc_claimAutoreleasedReturnValue();
          __int128 v79 = 0u;
          __int128 v80 = 0u;
          __int128 v81 = 0u;
          __int128 v82 = 0u;
          [v70 blacklistedStatesCurrent];
          __int128 v33 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v34 = [v33 countByEnumeratingWithState:&v79 objects:v92 count:16];
          if (v34)
          {
            uint64_t v35 = v34;
            uint64_t v36 = 0LL;
            uint64_t v37 = *(void *)v80;
            do
            {
              for (uint64_t j = 0LL; j != v35; ++j)
              {
                if (*(void *)v80 != v37) {
                  objc_enumerationMutation(v33);
                }
                uint64_t v39 = *(void **)(*((void *)&v79 + 1) + 8 * j);
                [v39 blacklistedStateString];
                id v40 = (void *)objc_claimAutoreleasedReturnValue();
                [v39 blacklistedStateTimestamp];
                uint64_t v41 = (void *)NSString;
                objc_msgSend(MEMORY[0x189603F50], "dateWithTimeIntervalSince1970:");
                id v42 = (void *)objc_claimAutoreleasedReturnValue();
                [v74 stringFromDate:v42];
                id v43 = (void *)objc_claimAutoreleasedReturnValue();
                [v41 stringWithFormat:@"[%d] %@ @ %@, ", v36 + j, v40, v43];
                __int128 v44 = (void *)objc_claimAutoreleasedReturnValue();

                [v72 appendString:v44];
              }

              uint64_t v35 = [v33 countByEnumeratingWithState:&v79 objects:v92 count:16];
              uint64_t v36 = (v36 + j);
            }

            while (v35);
          }

          [NSString stringWithFormat:@"%@", v72];
          __int128 v45 = (void *)objc_claimAutoreleasedReturnValue();
          __int128 v46 = (os_log_s *)MEMORY[0x1895F8DA0];
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
          {
            id v47 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v45, "UTF8String"));
            uint64_t v48 = [v47 UTF8String];
            *(_DWORD *)buf = 136446210;
            uint64_t v95 = v48;
            _os_log_impl(&dword_187EBF000, v46, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
          }

          [MEMORY[0x189607940] stringWithString:@" Triggers: "];
          uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
          __int128 v75 = 0u;
          __int128 v76 = 0u;
          __int128 v77 = 0u;
          __int128 v78 = 0u;
          [v70 blacklistTriggers];
          id v71 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v50 = [v71 countByEnumeratingWithState:&v75 objects:v91 count:16];
          if (v50)
          {
            uint64_t v51 = v50;
            uint64_t v52 = 0LL;
            uint64_t v53 = *(void *)v76;
            do
            {
              for (uint64_t k = 0LL; k != v51; ++k)
              {
                if (*(void *)v76 != v53) {
                  objc_enumerationMutation(v71);
                }
                uint64_t v55 = *(void **)(*((void *)&v75 + 1) + 8 * k);
                [v55 triggerReasonString];
                uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue();
                [v55 triggerReasonTimestamp];
                uint64_t v57 = (void *)NSString;
                objc_msgSend(MEMORY[0x189603F50], "dateWithTimeIntervalSince1970:");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                [v74 stringFromDate:v58];
                id v59 = (void *)objc_claimAutoreleasedReturnValue();
                [v57 stringWithFormat:@"[%d] %@ @ %@, ", v52 + k, v56, v59];
                uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue();

                [v49 appendString:v60];
              }

              uint64_t v51 = [v71 countByEnumeratingWithState:&v75 objects:v91 count:16];
              uint64_t v52 = (v52 + k);
            }

            while (v51);
          }

          [NSString stringWithFormat:@"%@", v49];
          uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue();
          id v5 = (os_log_s *)MEMORY[0x1895F8DA0];
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
          {
            id v62 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v61, "UTF8String"));
            uint64_t v63 = [v62 UTF8String];
            *(_DWORD *)buf = 136446210;
            uint64_t v95 = v63;
            _os_log_impl(&dword_187EBF000, v5, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
          }

          uint64_t v6 = v69 + 1;
        }

        while (v69 + 1 != v66);
        uint64_t v66 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v87,  v104,  16LL);
      }

      while (v66);
    }
  }

+ (id)stringRepresentationWithReason:(unint64_t)a3
{
  if (a3 > 0xA) {
    return @"Unknown";
  }
  else {
    return off_18A16E958[a3];
  }
}

+ (id)stringRepresentationWithState:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return @"Unknown";
  }
  else {
    return off_18A16E9B0[a3 - 1];
  }
}

- (id)getBlacklist
{
  return self->_blacklist;
}

- (WFBlacklistDelegate)blacklistDelegate
{
  return self->_blacklistDelegate;
}

- (void)setBlacklistDelegate:(id)a3
{
  self->_blacklistDelegate = (WFBlacklistDelegate *)a3;
}

- (NSMutableArray)ssidThresholds
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setSsidThresholds:(id)a3
{
}

- (NSMutableArray)bssidThresholds
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setBssidThresholds:(id)a3
{
}

- (double)wowBlacklistExpiry
{
  return self->_wowBlacklistExpiry;
}

- (void)setWowBlacklistExpiry:(double)a3
{
  self->_wowBlacklistExpiry = a3;
}

- (double)autojoinBlacklistExpiry
{
  return self->_autojoinBlacklistExpiry;
}

- (void)setAutojoinBlacklistExpiry:(double)a3
{
  self->_autojoinBlacklistExpiry = a3;
}

- (double)bssBlacklistExpiry
{
  return self->_bssBlacklistExpiry;
}

- (void)setBssBlacklistExpiry:(double)a3
{
  self->_bssBlacklistExpiry = a3;
}

- (void).cxx_destruct
{
}

  ;
}

- (void)clearTriggerForNetworkWithUnblacklistReason:(void *)a1 reason:.cold.1(void *a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 bssid];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2( &dword_187EBF000,  MEMORY[0x1895F8DA0],  v4,  "%s node not found with ssid:%{mask.hash}@ bssid:%{mask.hash}@",  v5,  v6,  v7,  v8,  2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)networkPruned:(void *)a1 .cold.1(void *a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 bssid];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2( &dword_187EBF000,  MEMORY[0x1895F8DA0],  v4,  "%s network %{mask.hash}@[%{mask.hash}@]",  v5,  v6,  v7,  v8,  2u);

  OUTLINED_FUNCTION_2_0();
}

@end