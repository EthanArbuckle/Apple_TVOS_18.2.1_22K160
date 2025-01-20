@interface WiFiSoftApUsageMonitor
+ (id)sharedInstance;
- (BOOL)compatibilityEnabled;
- (BOOL)compatibilityToggled;
- (BOOL)statsValid;
- (NSDate)softApOldestActiveTime;
- (OS_dispatch_queue)internalQueue;
- (WiFiSoftApUsageMonitor)init;
- (id)description;
- (id)statsDictionary;
- (unint64_t)appleClientConnectCount;
- (unint64_t)fiveGHzSessionCount;
- (unint64_t)mixClientConnectedSessionCount;
- (unint64_t)noClientConnectedSessionCount;
- (unint64_t)onlyAppleClientConnectedSessionCount;
- (unint64_t)onlyOtherClientConnectedSessionCount;
- (unint64_t)otherClientConnectCount;
- (unint64_t)softApUpCount;
- (unint64_t)twoFourGHzSessionCount;
- (void)initStats;
- (void)initStats:(id)a3;
- (void)persistStats;
- (void)resetStats;
- (void)resetStatsInternal;
- (void)setAppleClientConnectCount:(unint64_t)a3;
- (void)setCompatibilityEnabled:(BOOL)a3;
- (void)setCompatibilityToggled:(BOOL)a3;
- (void)setFiveGHzSessionCount:(unint64_t)a3;
- (void)setInternalQueue:(id)a3;
- (void)setMixClientConnectedSessionCount:(unint64_t)a3;
- (void)setNoClientConnectedSessionCount:(unint64_t)a3;
- (void)setOnlyAppleClientConnectedSessionCount:(unint64_t)a3;
- (void)setOnlyOtherClientConnectedSessionCount:(unint64_t)a3;
- (void)setOtherClientConnectCount:(unint64_t)a3;
- (void)setSoftApOldestActiveTime:(id)a3;
- (void)setSoftApUpCount:(unint64_t)a3;
- (void)setStatsValid:(BOOL)a3;
- (void)setTwoFourGHzSessionCount:(unint64_t)a3;
- (void)statsDictionaryInternal:(id)a3;
- (void)updateStats:(id)a3;
- (void)updateStatsInternal:(id)a3;
@end

@implementation WiFiSoftApUsageMonitor

+ (id)sharedInstance
{
  return 0LL;
}

- (WiFiSoftApUsageMonitor)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___WiFiSoftApUsageMonitor;
  v2 = -[WiFiSoftApUsageMonitor init](&v8, sel_init);
  v2->_statsValid = 0;
  softApOldestActiveTime = v2->_softApOldestActiveTime;
  v2->_softApOldestActiveTime = 0LL;

  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v5 = dispatch_queue_create("com.apple.wifi.softap-usage-monitor", v4);
  internalQueue = v2->_internalQueue;
  v2->_internalQueue = (OS_dispatch_queue *)v5;

  -[WiFiSoftApUsageMonitor initStats](v2, "initStats");
  return v2;
}

- (void)initStats:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [v4 keyEnumerator];
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 nextObject];
  if (v6)
  {
    objc_super v8 = (void *)v6;
    v9 = 0LL;
    v10 = (os_log_s *)MEMORY[0x1895F8DA0];
    *(void *)&__int128 v7 = 136315394LL;
    __int128 v17 = v7;
    while (1)
    {
      v11 = v9;
      objc_msgSend(v8, "stringValue", v17, *(_OWORD *)buf, *(void *)&buf[16], v19);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 objectForKey:v12];
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          goto LABEL_15;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if ([v12 isEqualToString:@"StatsValid"])
          {
            self->_statsValid = [v9 BOOLValue];
          }

          else if ([v12 isEqualToString:@"MaximizeCompatibilityEnabled"])
          {
            self->_compatibilityEnabled = [v9 BOOLValue];
          }

          else if ([v12 isEqualToString:@"MaximizeCompatibilityToggled"])
          {
            self->_compatibilityToggled = [v9 BOOLValue];
          }

          else
          {
            unint64_t v16 = [v9 unsignedLongValue];
            if ([v12 isEqualToString:@"SoftApUpCount"])
            {
              self->_softApUpCount = v16;
            }

            else if ([v12 isEqualToString:@"NoClientConnectedSessionCount"])
            {
              self->_noClientConnectedSessionCount = v16;
            }

            else if ([v12 isEqualToString:@"OnlyAppleClientConnectedSessionCount"])
            {
              self->_onlyAppleClientConnectedSessionCount = v16;
            }

            else if ([v12 isEqualToString:@"OnlyOtherClientConnectedSessionCount"])
            {
              self->_onlyOtherClientConnectedSessionCount = v16;
            }

            else if ([v12 isEqualToString:@"MixClientConnectedSessionCount"])
            {
              self->_mixClientConnectedSessionCount = v16;
            }

            else if ([v12 isEqualToString:@"AppleClientConnectCount"])
            {
              self->_appleClientConnectCount = v16;
            }

            else if ([v12 isEqualToString:@"OtherClientConnectCount"])
            {
              self->_otherClientConnectCount = v16;
            }

            else if ([v12 isEqualToString:@"24GHzSessionCount"])
            {
              self->_twoFourGHzSessionCount = v16;
            }

            else if ([v12 isEqualToString:@"5GHzSessionCount"])
            {
              self->_fiveGHzSessionCount = v16;
            }
          }

          goto LABEL_15;
        }

        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v17;
          *(void *)&buf[4] = "-[WiFiSoftApUsageMonitor initStats:]";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v12;
          v13 = v10;
          v14 = "%s: unexpected value for %@";
          goto LABEL_14;
        }
      }

      else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v17;
        *(void *)&buf[4] = "-[WiFiSoftApUsageMonitor initStats:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v12;
        v13 = v10;
        v14 = "%s: value is null for %@";
LABEL_14:
        _os_log_impl(&dword_187EBF000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 0x16u);
      }

- (void)initStats
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 dictionaryForKey:@"WiFiHotspotUsageHistory"];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3) {
    -[WiFiSoftApUsageMonitor initStats:](self, "initStats:", v3);
  }
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"time_window=%@, sessionCnt=%lu, noClientSessionCnt=%lu, onlyAppleSessionCnt=%lu, only3rdPartySessionCnt=%lu mixClientSessionCnt=%lu 2.4GHzSessionCnt=%lu 5GHzSessionCnt=%lu appleClientCnt=%lu, otherClientCnt=%lu, compatibilityEnabled=%u, compatibilityToggled=%u", self->_softApOldestActiveTime, self->_softApUpCount, self->_noClientConnectedSessionCount, self->_onlyAppleClientConnectedSessionCount, self->_onlyOtherClientConnectedSessionCount, self->_mixClientConnectedSessionCount, self->_appleClientConnectCount, self->_otherClientConnectCount, self->_twoFourGHzSessionCount, self->_fiveGHzSessionCount, self->_compatibilityEnabled, self->_compatibilityToggled];
}

- (void)updateStatsInternal:(id)a3
{
  id v4 = a3;
  BOOL compatibilityEnabled = self->_compatibilityEnabled;
  id v19 = v4;
  [v4 objectForKey:@"MaximizeCompatibilityEnabled"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      self->_BOOL compatibilityEnabled = [v6 BOOLValue];
    }
  }

  softApOldestActiveTime = self->_softApOldestActiveTime;
  self->_compatibilityToggled |= self->_compatibilityEnabled ^ compatibilityEnabled;
  if (softApOldestActiveTime && self->_statsValid)
  {
    objc_super v8 = v6;
  }

  else
  {
    -[WiFiSoftApUsageMonitor resetStatsInternal](self, "resetStatsInternal");
    [v19 objectForKey:@"SessionStartTimestamp"];
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0) {
        objc_storeStrong((id *)&self->_softApOldestActiveTime, v8);
      }
    }
  }

  [v19 objectForKey:@"AppleClientConnectCount"];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v10 = [v9 unsignedLongValue];
    self->_appleClientConnectCount += v10;
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  [v19 objectForKey:@"OtherClientConnectCount"];
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v12 = [v11 unsignedLongValue];
    self->_otherClientConnectCount += v12;
    BOOL v13 = v12 != 0;
  }

  else
  {
    BOOL v13 = 0;
  }

  BOOL v14 = !v13;
  uint64_t v15 = 32LL;
  if (!v14) {
    uint64_t v15 = 48LL;
  }
  uint64_t v16 = 40LL;
  if (!v14) {
    uint64_t v16 = 56LL;
  }
  if (v10) {
    uint64_t v15 = v16;
  }
  ++*(Class *)((char *)&self->super.isa + v15);
  [v19 objectForKey:@"TwoFourGHzChannelCount"];
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ([v17 unsignedLongValue]) {
        ++self->_twoFourGHzSessionCount;
      }
    }
  }

  [v19 objectForKey:@"FiveGHzChannelCount"];
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ([v18 unsignedLongValue]) {
        ++self->_fiveGHzSessionCount;
      }
    }
  }

  ++self->_softApUpCount;
  self->_statsValid = 1;
}

- (void)updateStats:(id)a3
{
  id v4 = a3;
  internalQueue = (dispatch_queue_s *)self->_internalQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __38__WiFiSoftApUsageMonitor_updateStats___block_invoke;
  block[3] = &unk_18A16C748;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(internalQueue, block);
}

uint64_t __38__WiFiSoftApUsageMonitor_updateStats___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) persistStats];
}

- (void)resetStatsInternal
{
  self->_statsValid = 0;
  softApOldestActiveTime = self->_softApOldestActiveTime;
  self->_softApOldestActiveTime = 0LL;

  self->_compatibilityToggled = 0;
  *(_OWORD *)&self->_softApUpCount = 0u;
  *(_OWORD *)&self->_onlyAppleClientConnectedSessionCount = 0u;
  *(_OWORD *)&self->_mixClientConnectedSessionCount = 0u;
  *(_OWORD *)&self->_otherClientConnectCount = 0u;
  self->_fiveGHzSessionCount = 0LL;
}

- (void)resetStats
{
  internalQueue = (dispatch_queue_s *)self->_internalQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __36__WiFiSoftApUsageMonitor_resetStats__block_invoke;
  block[3] = &unk_18A16C770;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

uint64_t __36__WiFiSoftApUsageMonitor_resetStats__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetStatsInternal];
}

- (void)statsDictionaryInternal:(id)a3
{
  id v4 = a3;
  id v18 = v4;
  if (self->_statsValid)
  {
    [v4 setObject:self->_softApOldestActiveTime forKeyedSubscript:@"OldestActiveTime"];
    [MEMORY[0x189607968] numberWithUnsignedInteger:self->_softApUpCount];
    dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 setObject:v5 forKeyedSubscript:@"SoftApUpCount"];

    [MEMORY[0x189607968] numberWithUnsignedInteger:self->_noClientConnectedSessionCount];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 setObject:v6 forKeyedSubscript:@"NoClientConnectedSessionCount"];

    [MEMORY[0x189607968] numberWithUnsignedInteger:self->_onlyAppleClientConnectedSessionCount];
    __int128 v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 setObject:v7 forKeyedSubscript:@"OnlyAppleClientConnectedSessionCount"];

    [MEMORY[0x189607968] numberWithUnsignedInteger:self->_onlyOtherClientConnectedSessionCount];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 setObject:v8 forKeyedSubscript:@"OnlyOtherClientConnectedSessionCount"];

    [MEMORY[0x189607968] numberWithUnsignedInteger:self->_mixClientConnectedSessionCount];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 setObject:v9 forKeyedSubscript:@"MixClientConnectedSessionCount"];

    [MEMORY[0x189607968] numberWithUnsignedInteger:self->_appleClientConnectCount];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 setObject:v10 forKeyedSubscript:@"AppleClientConnectCount"];

    [MEMORY[0x189607968] numberWithUnsignedInteger:self->_otherClientConnectCount];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 setObject:v11 forKeyedSubscript:@"OtherClientConnectCount"];

    [MEMORY[0x189607968] numberWithUnsignedInteger:self->_twoFourGHzSessionCount];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 setObject:v12 forKeyedSubscript:@"24GHzSessionCount"];

    [MEMORY[0x189607968] numberWithUnsignedInteger:self->_fiveGHzSessionCount];
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 setObject:v13 forKeyedSubscript:@"5GHzSessionCount"];

    [MEMORY[0x189607968] numberWithBool:self->_compatibilityEnabled];
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 setObject:v14 forKeyedSubscript:@"MaximizeCompatibilityEnabled"];

    [MEMORY[0x189607968] numberWithBool:self->_compatibilityToggled];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 setObject:v15 forKeyedSubscript:@"MaximizeCompatibilityToggled"];

    BOOL statsValid = self->_statsValid;
  }

  else
  {
    BOOL statsValid = 0LL;
  }

  [MEMORY[0x189607968] numberWithBool:statsValid];
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 setObject:v17 forKeyedSubscript:@"StatsValid"];
}

- (id)statsDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  internalQueue = (dispatch_queue_s *)self->_internalQueue;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __41__WiFiSoftApUsageMonitor_statsDictionary__block_invoke;
  v9[3] = &unk_18A16C748;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  dispatch_sync(internalQueue, v9);
  id v6 = v10;
  id v7 = v5;

  return v7;
}

uint64_t __41__WiFiSoftApUsageMonitor_statsDictionary__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) statsDictionaryInternal:*(void *)(a1 + 40)];
}

- (void)persistStats
{
  id v4 = objc_alloc_init(MEMORY[0x189603FC8]);
  -[WiFiSoftApUsageMonitor statsDictionaryInternal:](self, "statsDictionaryInternal:", v4);
  [MEMORY[0x189604038] standardUserDefaults];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v4 forKey:@"WiFiHotspotUsageHistory"];
}

- (NSDate)softApOldestActiveTime
{
  return self->_softApOldestActiveTime;
}

- (void)setSoftApOldestActiveTime:(id)a3
{
}

- (unint64_t)softApUpCount
{
  return self->_softApUpCount;
}

- (void)setSoftApUpCount:(unint64_t)a3
{
  self->_softApUpCount = a3;
}

- (unint64_t)noClientConnectedSessionCount
{
  return self->_noClientConnectedSessionCount;
}

- (void)setNoClientConnectedSessionCount:(unint64_t)a3
{
  self->_noClientConnectedSessionCount = a3;
}

- (unint64_t)onlyAppleClientConnectedSessionCount
{
  return self->_onlyAppleClientConnectedSessionCount;
}

- (void)setOnlyAppleClientConnectedSessionCount:(unint64_t)a3
{
  self->_onlyAppleClientConnectedSessionCount = a3;
}

- (unint64_t)onlyOtherClientConnectedSessionCount
{
  return self->_onlyOtherClientConnectedSessionCount;
}

- (void)setOnlyOtherClientConnectedSessionCount:(unint64_t)a3
{
  self->_onlyOtherClientConnectedSessionCount = a3;
}

- (unint64_t)mixClientConnectedSessionCount
{
  return self->_mixClientConnectedSessionCount;
}

- (void)setMixClientConnectedSessionCount:(unint64_t)a3
{
  self->_mixClientConnectedSessionCount = a3;
}

- (unint64_t)appleClientConnectCount
{
  return self->_appleClientConnectCount;
}

- (void)setAppleClientConnectCount:(unint64_t)a3
{
  self->_appleClientConnectCount = a3;
}

- (unint64_t)otherClientConnectCount
{
  return self->_otherClientConnectCount;
}

- (void)setOtherClientConnectCount:(unint64_t)a3
{
  self->_otherClientConnectCount = a3;
}

- (unint64_t)twoFourGHzSessionCount
{
  return self->_twoFourGHzSessionCount;
}

- (void)setTwoFourGHzSessionCount:(unint64_t)a3
{
  self->_twoFourGHzSessionCount = a3;
}

- (unint64_t)fiveGHzSessionCount
{
  return self->_fiveGHzSessionCount;
}

- (void)setFiveGHzSessionCount:(unint64_t)a3
{
  self->_fiveGHzSessionCount = a3;
}

- (BOOL)compatibilityEnabled
{
  return self->_compatibilityEnabled;
}

- (void)setCompatibilityEnabled:(BOOL)a3
{
  self->_BOOL compatibilityEnabled = a3;
}

- (BOOL)compatibilityToggled
{
  return self->_compatibilityToggled;
}

- (void)setCompatibilityToggled:(BOOL)a3
{
  self->_compatibilityToggled = a3;
}

- (BOOL)statsValid
{
  return self->_statsValid;
}

- (void)setStatsValid:(BOOL)a3
{
  self->_BOOL statsValid = a3;
}

- (OS_dispatch_queue)internalQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setInternalQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end