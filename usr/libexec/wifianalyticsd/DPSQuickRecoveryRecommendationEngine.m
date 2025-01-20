@interface DPSQuickRecoveryRecommendationEngine
- (BOOL)checkAWDLActivity:(id)a3 symptomsDnsStats:(id)a4;
- (BOOL)checkDpsStatus:(id)a3 currentSample:(id)a4 qDpsStat:(id)a5;
- (BOOL)checkForPriorityNetwork;
- (BOOL)checkParameterThresholds:(id)a3 currentSample:(id)a4 qDpsStat:(id)a5 chipNumber:(id)a6 dpsSnapshot:(id)a7 originalCCA:(unsigned int)a8;
- (BOOL)isForegroundTrafficPresent;
- (BOOL)isGoodWiFiCondition:(id)a3;
- (BOOL)isHighAWDLActivity:(id)a3;
- (BOOL)isPeerDiagnosticsTriggerAllowed:(unint64_t)a3;
- (BOOL)isPriorityNetwork;
- (BOOL)isResetAllowedForKey:(id)a3 forPrefSelector:(SEL)a4;
- (BOOL)isResetAllowedForQuickDPS;
- (BOOL)isResetAllowedForSymptomsDPS;
- (BOOL)isScoreBelowThreshold:(id)a3;
- (BOOL)isTriggerDisconnect:(id)a3 currentSample:(id)a4;
- (DPSQuickRecoveryRecommendationEngine)init;
- (NSMutableDictionary)dpsQuickRecoveryWDBudgetDict;
- (NSMutableDictionary)dpsStats;
- (RecommendationPreferences)preferences;
- (id)computeFeatures:(id)a3 currentSample:(id)a4 acList:(id)a5;
- (id)updateDpsStats:(id)a3;
- (unint64_t)recommendReset:(id)a3 currentSample:(id)a4 acList:(id)a5 qDpsStat:(id)a6 chipNumber:(id)a7 dpsSnapshot:(id)a8 originalCCA:(unsigned int)a9;
- (unint64_t)recommendSymptomsDpsRecovery:(id)a3 symptomsDnsStats:(id)a4 awdlState:(BOOL)a5 currentSymptomsCondition:(BOOL)a6 isLANPingSuccessful:(BOOL)a7 appUsage:(BOOL)a8 averageCCA:(unsigned int)a9;
- (unsigned)computeBin:(id)a3 previousSample:(id)a4 currentSample:(id)a5;
- (void)addNumRecommendedScreenOffQuickRecoveryWD;
- (void)addNumRecommendedScreenOnQuickRecoveryWD;
- (void)addNumSuppressedScreenOffQuickRecoveryWD;
- (void)addNumSuppressedScreenOnQuickRecoveryWD;
- (void)setDpsQuickRecoveryWDBudgetDict:(id)a3;
- (void)setDpsStats:(id)a3;
- (void)setPreferences:(id)a3;
- (void)updateScreenState;
- (void)updateSymptomsDPSRecoveryWDStatsForKey:(id)a3;
- (void)updateTimeSincePreviousTriggerForQuickDps:(id)a3;
- (void)updateTimeSincePreviousTriggerForStudy:(id)a3 msgKey:(id)a4 dictKey:(id)a5;
@end

@implementation DPSQuickRecoveryRecommendationEngine

- (DPSQuickRecoveryRecommendationEngine)init
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___DPSQuickRecoveryRecommendationEngine;
  v2 = -[DPSQuickRecoveryRecommendationEngine init](&v17, "init");
  if (!v2)
  {
    id v7 = WALogCategoryDefaultHandle();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_DWORD *)buf = 136446466;
    v19 = "-[DPSQuickRecoveryRecommendationEngine init]";
    __int16 v20 = 1024;
    int v21 = 83;
    v9 = "%{public}s::%d:Error in super init failed";
LABEL_9:
    v11 = v8;
    uint32_t v12 = 18;
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v9, buf, v12);
    goto LABEL_13;
  }

  uint64_t v3 = objc_claimAutoreleasedReturnValue(+[RecommendationPreferences sharedObject](&OBJC_CLASS___RecommendationPreferences, "sharedObject"));
  preferences = v2->_preferences;
  v2->_preferences = (RecommendationPreferences *)v3;

  if (!v2->_preferences)
  {
    id v10 = WALogCategoryDefaultHandle();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_DWORD *)buf = 136446466;
    v19 = "-[DPSQuickRecoveryRecommendationEngine init]";
    __int16 v20 = 1024;
    int v21 = 86;
    v9 = "%{public}s::%d:Error RecommendationPreferences init";
    goto LABEL_9;
  }

  uint32_t v5 = notify_register_check("com.apple.springboard.hasBlankedScreen", &v2->screenStateToken);
  if (!v5) {
    return v2;
  }
  uint32_t v13 = v5;
  id v14 = WALogCategoryDefaultHandle();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    v19 = "-[DPSQuickRecoveryRecommendationEngine init]";
    __int16 v20 = 1024;
    int v21 = 89;
    __int16 v22 = 1024;
    uint32_t v23 = v13;
    v9 = "%{public}s::%d:notify_register_check() for screenstate failed with %u";
    v11 = v8;
    uint32_t v12 = 24;
    goto LABEL_12;
  }

- (id)updateDpsStats:(id)a3
{
  id v4 = a3;
  uint32_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v5 addEntriesFromDictionary:v4];

  [v5 addEntriesFromDictionary:self->_dpsQuickRecoveryWDBudgetDict];
  [v5 addEntriesFromDictionary:self->_dpsStats];
  return v5;
}

- (void)addNumRecommendedScreenOnQuickRecoveryWD
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary valueForKey:]( self->_dpsQuickRecoveryWDBudgetDict,  "valueForKey:",  @"dps_numRecommendedScreenOnQuickRecoveryWD"));
  if (v3)
  {
    id v4 = (void *)v3;
    uint32_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
  }

  else
  {
    uint32_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [0 intValue] + 1));
  }

  -[NSMutableDictionary setObject:forKey:]( self->_dpsQuickRecoveryWDBudgetDict,  "setObject:forKey:",  v5,  @"dps_numRecommendedScreenOnQuickRecoveryWD");
  id v6 = WALogCategoryDefaultHandle();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary valueForKey:]( self->_dpsQuickRecoveryWDBudgetDict,  "valueForKey:",  @"dps_numRecommendedScreenOnQuickRecoveryWD"));
    int v9 = 136446722;
    id v10 = "-[DPSQuickRecoveryRecommendationEngine addNumRecommendedScreenOnQuickRecoveryWD]";
    __int16 v11 = 1024;
    int v12 = 121;
    __int16 v13 = 1024;
    unsigned int v14 = [v8 intValue] - 1;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:number screen-on fast resets triggered previously: %d",  (uint8_t *)&v9,  0x18u);
  }
}

- (void)addNumRecommendedScreenOffQuickRecoveryWD
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary valueForKey:]( self->_dpsQuickRecoveryWDBudgetDict,  "valueForKey:",  @"dps_numRecommendedScreenOffQuickRecoveryWD"));
  if (v3)
  {
    id v4 = (void *)v3;
    uint32_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
  }

  else
  {
    uint32_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [0 intValue] + 1));
  }

  -[NSMutableDictionary setObject:forKey:]( self->_dpsQuickRecoveryWDBudgetDict,  "setObject:forKey:",  v5,  @"dps_numRecommendedScreenOffQuickRecoveryWD");
  id v6 = WALogCategoryDefaultHandle();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary valueForKey:]( self->_dpsQuickRecoveryWDBudgetDict,  "valueForKey:",  @"dps_numRecommendedScreenOffQuickRecoveryWD"));
    int v9 = 136446722;
    id v10 = "-[DPSQuickRecoveryRecommendationEngine addNumRecommendedScreenOffQuickRecoveryWD]";
    __int16 v11 = 1024;
    int v12 = 133;
    __int16 v13 = 1024;
    unsigned int v14 = [v8 intValue] - 1;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:number screen-off fast resets triggered previously: %d",  (uint8_t *)&v9,  0x18u);
  }
}

- (void)addNumSuppressedScreenOnQuickRecoveryWD
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary valueForKey:]( self->_dpsQuickRecoveryWDBudgetDict,  "valueForKey:",  @"dps_numSuppressedScreenOnQuickRecoveryWD"));
  if (v3)
  {
    id v4 = (void *)v3;
    uint32_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
  }

  else
  {
    uint32_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [0 intValue] + 1));
  }

  -[NSMutableDictionary setObject:forKey:]( self->_dpsQuickRecoveryWDBudgetDict,  "setObject:forKey:",  v5,  @"dps_numSuppressedScreenOnQuickRecoveryWD");
  id v6 = WALogCategoryDefaultHandle();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary valueForKey:]( self->_dpsQuickRecoveryWDBudgetDict,  "valueForKey:",  @"dps_numSuppressedScreenOnQuickRecoveryWD"));
    int v9 = 136446722;
    id v10 = "-[DPSQuickRecoveryRecommendationEngine addNumSuppressedScreenOnQuickRecoveryWD]";
    __int16 v11 = 1024;
    int v12 = 145;
    __int16 v13 = 1024;
    unsigned int v14 = [v8 intValue] - 1;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:number screen-on fast resets suppressed previously: %d",  (uint8_t *)&v9,  0x18u);
  }
}

- (void)addNumSuppressedScreenOffQuickRecoveryWD
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary valueForKey:]( self->_dpsQuickRecoveryWDBudgetDict,  "valueForKey:",  @"dps_numSuppressedScreenOffQuickRecoveryWD"));
  if (v3)
  {
    id v4 = (void *)v3;
    uint32_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
  }

  else
  {
    uint32_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [0 intValue] + 1));
  }

  -[NSMutableDictionary setObject:forKey:]( self->_dpsQuickRecoveryWDBudgetDict,  "setObject:forKey:",  v5,  @"dps_numSuppressedScreenOffQuickRecoveryWD");
  id v6 = WALogCategoryDefaultHandle();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary valueForKey:]( self->_dpsQuickRecoveryWDBudgetDict,  "valueForKey:",  @"dps_numSuppressedScreenOffQuickRecoveryWD"));
    int v9 = 136446722;
    id v10 = "-[DPSQuickRecoveryRecommendationEngine addNumSuppressedScreenOffQuickRecoveryWD]";
    __int16 v11 = 1024;
    int v12 = 157;
    __int16 v13 = 1024;
    unsigned int v14 = [v8 intValue] - 1;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:number screen-off fast resets suppressed previously: %d",  (uint8_t *)&v9,  0x18u);
  }
}

- (BOOL)isForegroundTrafficPresent
{
  v2 = (const void *)sub_100035D7C((uint64_t)kCFAllocatorDefault);
  if (!v2)
  {
    id v10 = WALogCategoryDefaultHandle();
    __int16 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "-[DPSQuickRecoveryRecommendationEngine isForegroundTrafficPresent]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 168;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Error managerClient init failed",  buf,  0x12u);
    }

    goto LABEL_14;
  }

  CFRunLoopRef Current = CFRunLoopGetCurrent();
  sub_100035E34((uint64_t)v2, (uint64_t)Current);
  id v4 = (void *)sub_100035EF8((uint64_t)v2);
  if (!v4)
  {
    id v12 = WALogCategoryDefaultHandle();
    __int16 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "-[DPSQuickRecoveryRecommendationEngine isForegroundTrafficPresent]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 173;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:No WiFi Devices present! Defaulting to screen state for decision!",  buf,  0x12u);
    }

- (void)updateScreenState
{
  uint64_t state64 = 0LL;
  notify_get_state(self->screenStateToken, &state64);
  uint64_t v3 = state64;
  unsigned __int8 v4 = -[DPSQuickRecoveryRecommendationEngine isForegroundTrafficPresent](self, "isForegroundTrafficPresent");
  if (v3 == 1) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = v4;
  }
  self->BOOL screenON = v5;
  id v6 = WALogCategoryDefaultHandle();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = "DETECTED";
    BOOL screenON = self->screenON;
    id v12 = "-[DPSQuickRecoveryRecommendationEngine updateScreenState]";
    *(_DWORD *)buf = 136446722;
    if (!screenON) {
      v8 = "NOT DETECTED";
    }
    __int16 v13 = 1024;
    int v14 = 198;
    __int16 v15 = 2080;
    v16 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:DPS Fast Reset Recommendation Engine: (screenON & foreGrnd traffic) is %s",  buf,  0x1Cu);
  }
}

- (void)updateSymptomsDPSRecoveryWDStatsForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_dpsQuickRecoveryWDBudgetDict, "valueForKey:", v4));
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [0 intValue] + 1));
  }

  -[NSMutableDictionary setObject:forKey:](self->_dpsQuickRecoveryWDBudgetDict, "setObject:forKey:", v7, v4);
  id v8 = WALogCategoryDefaultHandle();
  BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v10 = [v7 intValue];
    dpsQuickRecoveryWDBudgetDict = self->_dpsQuickRecoveryWDBudgetDict;
    int v12 = 136447234;
    __int16 v13 = "-[DPSQuickRecoveryRecommendationEngine updateSymptomsDPSRecoveryWDStatsForKey:]";
    __int16 v14 = 1024;
    int v15 = 210;
    __int16 v16 = 2112;
    id v17 = v4;
    __int16 v18 = 1024;
    unsigned int v19 = v10;
    __int16 v20 = 2112;
    int v21 = dpsQuickRecoveryWDBudgetDict;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Added key: %@ value:%d dict:%@",  (uint8_t *)&v12,  0x2Cu);
  }
}

- (BOOL)isPriorityNetwork
{
  v2 = (const void *)sub_100035D7C((uint64_t)kCFAllocatorDefault);
  if (!v2)
  {
    id v15 = WALogCategoryDefaultHandle();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = "-[DPSQuickRecoveryRecommendationEngine isPriorityNetwork]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 222;
    __int16 v16 = "%{public}s::%d:Error managerClient init failed";
LABEL_21:
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, v16, buf, 0x12u);
    goto LABEL_26;
  }

  CFRunLoopRef Current = CFRunLoopGetCurrent();
  sub_100035E34((uint64_t)v2, (uint64_t)Current);
  id v4 = (os_log_s *)sub_100035EF8((uint64_t)v2);
  if (!v4)
  {
    id v17 = WALogCategoryDefaultHandle();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = "-[DPSQuickRecoveryRecommendationEngine isPriorityNetwork]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 227;
    __int16 v16 = "%{public}s::%d:No WiFi Devices present! Defaulting to screen state for decision!";
    goto LABEL_21;
  }

  uint64_t v5 = v4;
  if (!-[os_log_s count](v4, "count"))
  {
    uint64_t v9 = 0LL;
    goto LABEL_10;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", 0LL));

  if (v6)
  {
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000LL;
    id v7 = off_1000ECFC8;
    __int16 v22 = off_1000ECFC8;
    if (!off_1000ECFC8)
    {
      id v8 = (void *)sub_10003CC78();
      id v7 = dlsym(v8, "WiFiDeviceClientCopyCurrentNetwork");
      *(void *)(*(void *)&buf[8] + 24LL) = v7;
      off_1000ECFC8 = v7;
    }

    _Block_object_dispose(buf, 8);
    if (!v7) {
      goto LABEL_27;
    }
    uint64_t v9 = ((uint64_t (*)(void *))v7)(v6);
LABEL_10:
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000LL;
    unsigned int v10 = off_1000ECFD0;
    __int16 v22 = off_1000ECFD0;
    if (!off_1000ECFD0)
    {
      __int16 v11 = (void *)sub_10003CC78();
      unsigned int v10 = dlsym(v11, "WiFiNetworkIsPriorityNetworkWrapper");
      *(void *)(*(void *)&buf[8] + 24LL) = v10;
      off_1000ECFD0 = v10;
    }

    _Block_object_dispose(buf, 8);
    if (v10)
    {
      BOOL v12 = ((uint64_t (*)(uint64_t))v10)(v9) != 0;
      goto LABEL_14;
    }

- (BOOL)checkForPriorityNetwork
{
  if (-[RecommendationPreferences disable_slow_wifi_dps_is_priority_network]( self->_preferences,  "disable_slow_wifi_dps_is_priority_network"))
  {
    BOOL v3 = 1;
  }

  else
  {
    BOOL v3 = -[DPSQuickRecoveryRecommendationEngine isPriorityNetwork](self, "isPriorityNetwork");
  }

  id v4 = WALogCategoryDefaultHandle();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = -[RecommendationPreferences disable_slow_wifi_dps_is_priority_network]( self->_preferences,  "disable_slow_wifi_dps_is_priority_network");
    id v7 = "NO";
    __int16 v11 = "-[DPSQuickRecoveryRecommendationEngine checkForPriorityNetwork]";
    __int16 v12 = 1024;
    int v13 = 256;
    if (v6) {
      id v8 = "YES";
    }
    else {
      id v8 = "NO";
    }
    int v10 = 136446978;
    id v15 = v8;
    __int16 v14 = 2080;
    if (v3) {
      id v7 = "YES";
    }
    __int16 v16 = 2080;
    id v17 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Priority Network Check Disabled: %s IsPriorityNetwork: %s",  (uint8_t *)&v10,  0x26u);
  }

  return v3;
}

- (BOOL)isResetAllowedForSymptomsDPS
{
  if (self->screenON)
  {
    unsigned int v3 = -[DPSQuickRecoveryRecommendationEngine isResetAllowedForKey:forPrefSelector:]( self,  "isResetAllowedForKey:forPrefSelector:",  @"symptomsDps_lastScreenOnRecoveryWD",  "minutes_between_symptoms_dps_wd_screen_on");
    BOOL v4 = v3;
    uint64_t v5 = @"symptomsDps_numSuppressedScreenOnRecoveryWD";
    unsigned int v6 = @"symptomsDps_numRecommendedScreenOnRecoveryWD";
  }

  else
  {
    unsigned int v3 = -[DPSQuickRecoveryRecommendationEngine isResetAllowedForKey:forPrefSelector:]( self,  "isResetAllowedForKey:forPrefSelector:",  @"symptomsDps_lastScreenOffRecoveryWD",  "minutes_between_symptoms_dps_wd_screen_off");
    BOOL v4 = v3;
    uint64_t v5 = @"symptomsDps_numSuppressedScreenOffRecoveryWD";
    unsigned int v6 = @"symptomsDps_numRecommendedScreenOffRecoveryWD";
  }

  if (v3) {
    id v7 = v6;
  }
  else {
    id v7 = v5;
  }
  -[DPSQuickRecoveryRecommendationEngine updateSymptomsDPSRecoveryWDStatsForKey:]( self,  "updateSymptomsDPSRecoveryWDStatsForKey:",  v7);
  return v4;
}

- (BOOL)isResetAllowedForQuickDPS
{
  if (!self->screenON)
  {
    if (-[DPSQuickRecoveryRecommendationEngine isResetAllowedForKey:forPrefSelector:]( self,  "isResetAllowedForKey:forPrefSelector:",  @"dps_lastScreenOffQuickRecoveryWD",  "minutes_between_fast_dps_wd_screen_off"))
    {
      goto LABEL_6;
    }

    if (!-[DPSQuickRecoveryRecommendationEngine isResetAllowedForKey:forPrefSelector:]( self,  "isResetAllowedForKey:forPrefSelector:",  @"dps_lastScreenOnQuickRecoveryWD",  "minutes_between_fast_dps_wd_screen_on"))
    {
      -[DPSQuickRecoveryRecommendationEngine addNumSuppressedScreenOffQuickRecoveryWD]( self,  "addNumSuppressedScreenOffQuickRecoveryWD");
      return 0;
    }

- (BOOL)isResetAllowedForKey:(id)a3 forPrefSelector:(SEL)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v8 = (unsigned int (*)(RecommendationPreferences *, SEL))-[RecommendationPreferences methodForSelector:]( self->_preferences,  "methodForSelector:",  a4);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_dpsQuickRecoveryWDBudgetDict, "valueForKey:", v6));
  if (v9 && ([v7 timeIntervalSinceDate:v9], (int)(v10 / 60.0) < v8(self->_preferences, a4)))
  {
    BOOL v11 = 0;
  }

  else
  {
    -[NSMutableDictionary setObject:forKey:](self->_dpsQuickRecoveryWDBudgetDict, "setObject:forKey:", v7, v6);
    BOOL v11 = 1;
  }

  id v12 = WALogCategoryDefaultHandle();
  int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = "-[DPSQuickRecoveryRecommendationEngine isResetAllowedForKey:forPrefSelector:]";
    __int16 v14 = "NO";
    __int16 v18 = 1024;
    int v19 = 330;
    int v16 = 136447490;
    if (v11) {
      __int16 v14 = "YES";
    }
    __int16 v20 = 2112;
    id v21 = v6;
    __int16 v22 = 2112;
    uint32_t v23 = v9;
    __int16 v24 = 2112;
    v25 = v7;
    __int16 v26 = 2080;
    v27 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:key:%@ previousWD_TS:%@ currentWD_TS:%@ recommendation:%s",  (uint8_t *)&v16,  0x3Au);
  }

  return v11;
}

- (id)computeFeatures:(id)a3 currentSample:(id)a4 acList:(id)a5
{
  id v328 = a3;
  id v341 = a4;
  id v7 = a5;
  id v8 = WALogCategoryDefaultHandle();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    v407 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    __int16 v408 = 1024;
    int v409 = 335;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:Computing features for ML model...",  buf,  0x12u);
  }

  __int128 v402 = 0u;
  __int128 v403 = 0u;
  __int128 v400 = 0u;
  __int128 v401 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v400 objects:v416 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v401;
    while (2)
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v401 != v12) {
          objc_enumerationMutation(v10);
        }
        __int16 v14 = *(void **)(*((void *)&v400 + 1) + 8LL * (void)i);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 fieldForKey:@"DPSN_symptom"]);
        unsigned int v16 = [v15 int32Value];

        if (!v16)
        {
          id v21 = (void *)objc_claimAutoreleasedReturnValue([v14 fieldForKey:@"DPSN_problemAC"]);
          unsigned int v20 = [v21 uint32Value];

          int v18 = (v20 >> 1) & 1;
          int v19 = v20 & 1;
          int v17 = (v20 >> 2) & 1;
          LODWORD(v11) = (v20 >> 3) & 1;
          goto LABEL_13;
        }
      }

      id v11 = [v10 countByEnumeratingWithState:&v400 objects:v416 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  int v17 = 0;
  int v18 = 0;
  int v19 = 0;
  unsigned int v20 = 0;
LABEL_13:

  id v22 = WALogCategoryDefaultHandle();
  uint32_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447746;
    v407 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    __int16 v408 = 1024;
    int v409 = 358;
    __int16 v410 = 1024;
    *(_DWORD *)v411 = v20;
    *(_WORD *)&v411[4] = 1024;
    *(_DWORD *)&v411[6] = v19;
    LOWORD(v412) = 1024;
    *(_DWORD *)((char *)&v412 + 2) = v18;
    HIWORD(v412) = 1024;
    int v413 = v17;
    __int16 v414 = 1024;
    int v415 = (int)v11;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:problemAC: %u dpsBE:%d dpsBK:%d dpsVO:%d dpsVI:%d",  buf,  0x30u);
  }

  __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([v328 fieldForKey:@"DPSCS_peerStats"]);
  v25 = (void *)objc_claimAutoreleasedReturnValue([v24 subMessageValue]);
  __int16 v26 = (void *)objc_claimAutoreleasedReturnValue([v25 fieldForKey:@"NWAPS_ccas"]);
  v27 = (void *)objc_claimAutoreleasedReturnValue([v26 repeatableValues]);
  v28 = (char *)[v27 count];

  double v29 = 0.0;
  v327 = v10;
  unsigned int v326 = v20;
  if (v28)
  {
    v351 = v28 - 1;
    if (v28 != (char *)1)
    {
      v346 = v28;
      unint64_t v30 = 0LL;
      unsigned int v31 = 0;
      while (1)
      {
        unsigned int v360 = v31;
        v387 = (void *)objc_claimAutoreleasedReturnValue([v341 fieldForKey:@"DPSCS_peerStats"]);
        v382 = (void *)objc_claimAutoreleasedReturnValue([v387 subMessageValue]);
        v375 = (void *)objc_claimAutoreleasedReturnValue([v382 fieldForKey:@"NWAPS_ccas"]);
        v32 = (void *)objc_claimAutoreleasedReturnValue([v375 repeatableValues]);
        v33 = (void *)objc_claimAutoreleasedReturnValue([v32 objectAtIndex:v30]);
        v34 = (void *)objc_claimAutoreleasedReturnValue([v33 fieldForKey:@"NWASB_residentTime"]);
        id v369 = [v34 uint64Value];
        v35 = (void *)objc_claimAutoreleasedReturnValue([v328 fieldForKey:@"DPSCS_peerStats"]);
        v36 = (void *)objc_claimAutoreleasedReturnValue([v35 subMessageValue]);
        v37 = (void *)objc_claimAutoreleasedReturnValue([v36 fieldForKey:@"NWAPS_ccas"]);
        v38 = (void *)objc_claimAutoreleasedReturnValue([v37 repeatableValues]);
        v39 = (void *)objc_claimAutoreleasedReturnValue([v38 objectAtIndex:v30]);
        v40 = (void *)objc_claimAutoreleasedReturnValue([v39 fieldForKey:@"NWASB_residentTime"]);
        id v41 = [v40 uint64Value];

        if (v369 != v41) {
          break;
        }
        unint64_t v30 = v360 + 1;
        unsigned int v31 = v360 + 1;
      }

      double v29 = (double)v360;
LABEL_22:
      v28 = v346;
    }
  }

  id v42 = WALogCategoryDefaultHandle();
  v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v407 = "-[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]";
    __int16 v408 = 1024;
    int v409 = 374;
    __int16 v410 = 2048;
    *(void *)v411 = v28;
    *(_WORD *)&v411[8] = 2048;
    double v412 = v29;
    _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:ccaBinCount:%llu ccaBin:%.2f",  buf,  0x26u);
  }

  v44 = (void *)objc_claimAutoreleasedReturnValue([v328 fieldForKey:@"DPSCS_peerStats"]);
  v45 = (void *)objc_claimAutoreleasedReturnValue([v44 subMessageValue]);
  v46 = (void *)objc_claimAutoreleasedReturnValue([v45 fieldForKey:@"NWAPS_rssis"]);
  v47 = (void *)objc_claimAutoreleasedReturnValue([v46 repeatableValues]);
  id v48 = [v47 count];

  double v49 = 0.0;
  unint64_t v352 = (unint64_t)v48;
  if ((unint64_t)v48 >= 2)
  {
    unsigned int v50 = 0;
    unint64_t v51 = 1LL;
    while (1)
    {
      v388 = (void *)objc_claimAutoreleasedReturnValue([v341 fieldForKey:@"DPSCS_peerStats"]);
      v383 = (void *)objc_claimAutoreleasedReturnValue([v388 subMessageValue]);
      v376 = (void *)objc_claimAutoreleasedReturnValue([v383 fieldForKey:@"NWAPS_rssis"]);
      v370 = (void *)objc_claimAutoreleasedReturnValue([v376 repeatableValues]);
      v52 = (void *)objc_claimAutoreleasedReturnValue([v370 objectAtIndex:v51]);
      v53 = (void *)objc_claimAutoreleasedReturnValue([v52 fieldForKey:@"NWASB_residentTime"]);
      id v361 = [v53 uint64Value];
      v54 = (void *)objc_claimAutoreleasedReturnValue([v328 fieldForKey:@"DPSCS_peerStats"]);
      v55 = (void *)objc_claimAutoreleasedReturnValue([v54 subMessageValue]);
      v56 = (void *)objc_claimAutoreleasedReturnValue([v55 fieldForKey:@"NWAPS_rssis"]);
      v57 = (void *)objc_claimAutoreleasedReturnValue([v56 repeatableValues]);
      v58 = (void *)objc_claimAutoreleasedReturnValue([v57 objectAtIndex:v51]);
      v59 = (void *)objc_claimAutoreleasedReturnValue([v58 fieldForKey:@"NWASB_residentTime"]);
      id v60 = [v59 uint64Value];

      if (v361 != v60) {
        break;
      }
      unint64_t v51 = v50 + 2;
      ++v50;
      if (v352 <= v51) {
        goto LABEL_31;
      }
    }

    double v49 = (double)v50;
  }

- (BOOL)checkDpsStatus:(id)a3 currentSample:(id)a4 qDpsStat:(id)a5
{
  id v8 = a3;
  id v46 = a4;
  id v9 = a5;
  if (-[RecommendationPreferences disable_fast_dps_wd](self->_preferences, "disable_fast_dps_wd"))
  {
    id v10 = WALogCategoryDefaultHandle();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      id v48 = "-[DPSQuickRecoveryRecommendationEngine checkDpsStatus:currentSample:qDpsStat:]";
      __int16 v49 = 1024;
      int v50 = 567;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Quick DPS Reset Recovery is disabled",  buf,  0x12u);
    }

    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 fieldForKey:@"WFAAWDWAQDS_suppressedReason"]);
    int v13 = v12;
    uint64_t v14 = 3LL;
    goto LABEL_27;
  }

  if (-[RecommendationPreferences disable_fast_dps_validation_for_test]( self->_preferences,  "disable_fast_dps_validation_for_test"))
  {
    id v15 = WALogCategoryDefaultHandle();
    int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      id v48 = "-[DPSQuickRecoveryRecommendationEngine checkDpsStatus:currentSample:qDpsStat:]";
      __int16 v49 = 1024;
      int v50 = 574;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Bypassing Quick DPS validation for Quick Reset Recovery",  buf,  0x12u);
    }

    BOOL v16 = 1;
    goto LABEL_28;
  }

  int v17 = (void *)objc_claimAutoreleasedReturnValue([v8 fieldForKey:@"DPSCS_peerStats"]);
  int v18 = (void *)objc_claimAutoreleasedReturnValue([v17 subMessageValue]);
  int v19 = (void *)objc_claimAutoreleasedReturnValue([v18 fieldForKey:@"NWAPS_acCompletions"]);
  unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([v19 repeatableValues]);
  unint64_t v21 = (unint64_t)[v20 count];

  id v22 = WALogCategoryDefaultHandle();
  uint32_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    id v48 = "-[DPSQuickRecoveryRecommendationEngine checkDpsStatus:currentSample:qDpsStat:]";
    __int16 v49 = 1024;
    int v50 = 580;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:DPS Fast Reset Recovery Enabled, Validation Starts...",  buf,  0x12u);
  }

  if (v21 < 5)
  {
    if (!v21)
    {
      id v41 = WALogCategoryDefaultHandle();
      id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_FAULT,  "acCompletions not populated, so this DPS trigger cannot be validated",  buf,  2u);
      }

      if (-[DPSQuickRecoveryRecommendationEngine computeBin:previousSample:currentSample:]( self,  "computeBin:previousSample:currentSample:",  @"NWAPS_ccas",  v8,  v46) != 0xFFFF) {
        goto LABEL_26;
      }
      goto LABEL_23;
    }
  }

  else
  {
    id v24 = WALogCategoryDefaultHandle();
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v48 = (const char *)v21;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_FAULT,  "Out of range acCount found in NWAPS_acCompletions: %llu",  buf,  0xCu);
    }

    unint64_t v21 = 4LL;
  }

  v43 = self;
  id v44 = v8;
  v45 = v9;
  uint64_t v26 = 0LL;
  while (1)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue([v46 fieldForKey:@"DPSCS_peerStats"]);
    v28 = (void *)objc_claimAutoreleasedReturnValue([v27 subMessageValue]);
    double v29 = (void *)objc_claimAutoreleasedReturnValue([v28 fieldForKey:@"NWAPS_acCompletions"]);
    unint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 repeatableValues]);
    unsigned int v31 = (void *)objc_claimAutoreleasedReturnValue([v30 objectAtIndex:v26]);
    v32 = (void *)objc_claimAutoreleasedReturnValue([v31 fieldForKey:@"NWAPACTC_durSinceLastSuccessfulComp"]);
    unsigned int v33 = [v32 uint32Value];

    id v34 = WALogCategoryDefaultHandle();
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446978;
      id v48 = "-[DPSQuickRecoveryRecommendationEngine checkDpsStatus:currentSample:qDpsStat:]";
      __int16 v49 = 1024;
      int v50 = 592;
      __int16 v51 = 1024;
      int v52 = v26;
      __int16 v53 = 1024;
      unsigned int v54 = v33;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:AC:%u NWAPACTC_durSinceLastSuccessfulComp[@6s] %u",  buf,  0x1Eu);
    }

    unsigned int v36 = v33 >> 2;
    BOOL v16 = v33 >> 2 > 0x658;
    if (v36 <= 0x658) {
      break;
    }
    if (v21 == ++v26) {
      goto LABEL_22;
    }
  }

  v37 = (void *)objc_claimAutoreleasedReturnValue([v45 fieldForKey:@"WFAAWDWAQDS_suppressedReason"]);
  [v37 setInt32Value:9];

LABEL_22:
  id v8 = v44;
  id v9 = v45;
  if (-[DPSQuickRecoveryRecommendationEngine computeBin:previousSample:currentSample:]( v43,  "computeBin:previousSample:currentSample:",  @"NWAPS_ccas",  v44,  v46) == 0xFFFF)
  {
LABEL_23:
    id v38 = WALogCategoryDefaultHandle();
    v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_FAULT,  "Instances populated with the same values, CCA not found (QuickDPS)",  buf,  2u);
    }

LABEL_26:
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 fieldForKey:@"WFAAWDWAQDS_suppressedReason"]);
    int v13 = v12;
    uint64_t v14 = 10LL;
LABEL_27:
    -[os_log_s setInt32Value:](v12, "setInt32Value:", v14);
    BOOL v16 = 0;
LABEL_28:
  }

  return v16;
}

- (unsigned)computeBin:(id)a3 previousSample:(id)a4 currentSample:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v31 = a5;
  v32 = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 fieldForKey:@"DPSCS_peerStats"]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 subMessageValue]);
  unsigned int v33 = v7;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 fieldForKey:v7]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 repeatableValues]);
  id v13 = [v12 count];

  unint64_t v30 = (unint64_t)v13;
  if (v13)
  {
    unint64_t v14 = 0LL;
    unsigned int v15 = 0;
    while (1)
    {
      unsigned int v34 = v15;
      id v38 = (void *)objc_claimAutoreleasedReturnValue([v31 fieldForKey:@"DPSCS_peerStats"]);
      v37 = (void *)objc_claimAutoreleasedReturnValue([v38 subMessageValue]);
      unsigned int v36 = (void *)objc_claimAutoreleasedReturnValue([v37 fieldForKey:v33]);
      BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v36 repeatableValues]);
      int v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectAtIndex:v14]);
      int v18 = (void *)objc_claimAutoreleasedReturnValue([v17 fieldForKey:@"NWASB_residentTime"]);
      id v35 = [v18 uint64Value];
      int v19 = (void *)objc_claimAutoreleasedReturnValue([v32 fieldForKey:@"DPSCS_peerStats"]);
      unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([v19 subMessageValue]);
      unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 fieldForKey:v33]);
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 repeatableValues]);
      uint32_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectAtIndex:v14]);
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 fieldForKey:@"NWASB_residentTime"]);
      id v25 = [v24 uint64Value];

      if (v35 != v25) {
        break;
      }
      unint64_t v14 = v34 + 1;
      unsigned int v15 = v34 + 1;
      if (v30 <= v14) {
        goto LABEL_5;
      }
    }

    unsigned int v26 = v34;
  }

  else
  {
LABEL_5:
    unsigned int v26 = 0xFFFF;
  }

  id v27 = WALogCategoryDefaultHandle();
  v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447234;
    v40 = "-[DPSQuickRecoveryRecommendationEngine computeBin:previousSample:currentSample:]";
    __int16 v41 = 1024;
    int v42 = 629;
    __int16 v43 = 2112;
    id v44 = v33;
    __int16 v45 = 2048;
    unint64_t v46 = v30;
    __int16 v47 = 1024;
    unsigned int v48 = v26;
    _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:key:%@ binCount:%llu bin:%u",  buf,  0x2Cu);
  }

  return v26;
}

- (BOOL)isTriggerDisconnect:(id)a3 currentSample:(id)a4
{
  id v6 = a3;
  id v124 = a4;
  v121 = self;
  LODWORD(v116) = -[DPSQuickRecoveryRecommendationEngine computeBin:previousSample:currentSample:]( self,  "computeBin:previousSample:currentSample:",  @"NWAPS_rssis",  v6,  v124);
  id v122 = (void *)objc_claimAutoreleasedReturnValue([v124 fieldForKey:@"DPSCS_peerStats"]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v122 subMessageValue]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 fieldForKey:@"NWAPS_completions"]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 subMessageValue]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 fieldForKey:@"NWATC_noack"]);
  LODWORD(v120) = [v10 uint32Value];
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 fieldForKey:@"DPSCS_peerStats"]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 subMessageValue]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 fieldForKey:@"NWAPS_completions"]);
  unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 subMessageValue]);
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 fieldForKey:@"NWATC_noack"]);
  LODWORD(v119) = [v15 uint32Value];

  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v124 fieldForKey:@"DPSCS_peerStats"]);
  int v17 = (void *)objc_claimAutoreleasedReturnValue([v16 subMessageValue]);
  int v18 = (void *)objc_claimAutoreleasedReturnValue([v17 fieldForKey:@"NWAPS_completions"]);
  int v19 = (void *)objc_claimAutoreleasedReturnValue([v18 subMessageValue]);
  unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([v19 fieldForKey:@"NWATC_expired"]);
  LODWORD(v118) = [v20 uint32Value];
  v123 = v6;
  unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v6 fieldForKey:@"DPSCS_peerStats"]);
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 subMessageValue]);
  uint32_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 fieldForKey:@"NWAPS_completions"]);
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 subMessageValue]);
  id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 fieldForKey:@"NWATC_expired"]);
  LODWORD(v117) = [v25 uint32Value];

  unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue([v124 fieldForKey:@"DPSCS_peerStats"]);
  id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 subMessageValue]);
  v28 = (void *)objc_claimAutoreleasedReturnValue([v27 fieldForKey:@"NWAPS_rssiValue"]);
  int v29 = [v28 int32Value];

  id v30 = WALogCategoryDefaultHandle();
  id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447234;
    v126 = "-[DPSQuickRecoveryRecommendationEngine isTriggerDisconnect:currentSample:]";
    __int16 v127 = 1024;
    int v128 = 641;
    __int16 v129 = 1024;
    *(_DWORD *)unsigned int v130 = (_DWORD)v120 - (_DWORD)v119;
    *(_WORD *)&v130[4] = 1024;
    *(_DWORD *)&v130[6] = (_DWORD)v118 - (_DWORD)v117;
    __int16 v131 = 1024;
    int v132 = v29;
    _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:noACK errors: %d txExpired errors: %d RSSI:%d",  buf,  0x24u);
  }

  if (v29 >= -84)
  {
    if (-[RecommendationPreferences reset_rssi_bin_threshold](v121->_preferences, "reset_rssi_bin_threshold") < v116
      || (_DWORD)v120 == (_DWORD)v119 && (_DWORD)v118 == (_DWORD)v117)
    {
      int v32 = 0;
      int v33 = 0;
      int v34 = 0;
      int v35 = 0;
      int v36 = 0;
      int v37 = 0;
      BOOL v38 = 0;
    }

    else
    {
      v112 = (void *)objc_claimAutoreleasedReturnValue([v124 fieldForKey:@"DPSCS_peerStats"]);
      v111 = (void *)objc_claimAutoreleasedReturnValue([v112 subMessageValue]);
      id v120 = (void *)objc_claimAutoreleasedReturnValue([v111 fieldForKey:@"NWAPS_completions"]);
      __int16 v45 = @"NWATC_chipmodeerror";
      v119 = (void *)objc_claimAutoreleasedReturnValue([v120 subMessageValue]);
      id v118 = (void *)objc_claimAutoreleasedReturnValue([v119 fieldForKey:@"NWATC_chipmodeerror"]);
      unsigned int v46 = [v118 uint32Value];
      unsigned int v117 = (void *)objc_claimAutoreleasedReturnValue([v123 fieldForKey:@"DPSCS_peerStats"]);
      unsigned int v116 = (void *)objc_claimAutoreleasedReturnValue([v117 subMessageValue]);
      v115 = (void *)objc_claimAutoreleasedReturnValue([v116 fieldForKey:@"NWAPS_completions"]);
      unsigned int v114 = (void *)objc_claimAutoreleasedReturnValue([v115 subMessageValue]);
      v113 = (void *)objc_claimAutoreleasedReturnValue([v114 fieldForKey:@"NWATC_chipmodeerror"]);
      if (v46 == [v113 uint32Value])
      {
        unsigned int v110 = (void *)objc_claimAutoreleasedReturnValue([v124 fieldForKey:@"DPSCS_peerStats"]);
        v109 = (void *)objc_claimAutoreleasedReturnValue([v110 subMessageValue]);
        v108 = (void *)objc_claimAutoreleasedReturnValue([v109 fieldForKey:@"NWAPS_completions"]);
        __int16 v45 = @"NWATC_internalerror";
        v107 = (void *)objc_claimAutoreleasedReturnValue([v108 subMessageValue]);
        v106 = (void *)objc_claimAutoreleasedReturnValue([v107 fieldForKey:@"NWATC_internalerror"]);
        unsigned int v47 = [v106 uint32Value];
        unsigned int v105 = (void *)objc_claimAutoreleasedReturnValue([v123 fieldForKey:@"DPSCS_peerStats"]);
        v104 = (void *)objc_claimAutoreleasedReturnValue([v105 subMessageValue]);
        unsigned int v103 = (void *)objc_claimAutoreleasedReturnValue([v104 fieldForKey:@"NWAPS_completions"]);
        v102 = (void *)objc_claimAutoreleasedReturnValue([v103 subMessageValue]);
        v101 = (void *)objc_claimAutoreleasedReturnValue([v102 fieldForKey:@"NWATC_internalerror"]);
        if (v47 == [v101 uint32Value])
        {
          v100 = (void *)objc_claimAutoreleasedReturnValue([v124 fieldForKey:@"DPSCS_peerStats"]);
          uint64_t v99 = (void *)objc_claimAutoreleasedReturnValue([v100 subMessageValue]);
          id v98 = (void *)objc_claimAutoreleasedReturnValue([v99 fieldForKey:@"NWAPS_completions"]);
          __int16 v45 = @"NWATC_ioerror";
          id v97 = (void *)objc_claimAutoreleasedReturnValue([v98 subMessageValue]);
          v96 = (void *)objc_claimAutoreleasedReturnValue([v97 fieldForKey:@"NWATC_ioerror"]);
          unsigned int v48 = [v96 uint32Value];
          v95 = (void *)objc_claimAutoreleasedReturnValue([v123 fieldForKey:@"DPSCS_peerStats"]);
          v94 = (void *)objc_claimAutoreleasedReturnValue([v95 subMessageValue]);
          v93 = (void *)objc_claimAutoreleasedReturnValue([v94 fieldForKey:@"NWAPS_completions"]);
          v92 = (void *)objc_claimAutoreleasedReturnValue([v93 subMessageValue]);
          uint64_t v91 = (void *)objc_claimAutoreleasedReturnValue([v92 fieldForKey:@"NWATC_ioerror"]);
          if (v48 == [v91 uint32Value])
          {
            v90 = (void *)objc_claimAutoreleasedReturnValue([v124 fieldForKey:@"DPSCS_peerStats"]);
            uint64_t v89 = (void *)objc_claimAutoreleasedReturnValue([v90 subMessageValue]);
            unsigned int v88 = (void *)objc_claimAutoreleasedReturnValue([v89 fieldForKey:@"NWAPS_completions"]);
            __int16 v45 = @"NWATC_nobuf";
            unsigned int v87 = (void *)objc_claimAutoreleasedReturnValue([v88 subMessageValue]);
            unsigned int v86 = (void *)objc_claimAutoreleasedReturnValue([v87 fieldForKey:@"NWATC_nobuf"]);
            unsigned int v49 = [v86 uint32Value];
            v85 = (void *)objc_claimAutoreleasedReturnValue([v123 fieldForKey:@"DPSCS_peerStats"]);
            v84 = (void *)objc_claimAutoreleasedReturnValue([v85 subMessageValue]);
            v83 = (void *)objc_claimAutoreleasedReturnValue([v84 fieldForKey:@"NWAPS_completions"]);
            v82 = (void *)objc_claimAutoreleasedReturnValue([v83 subMessageValue]);
            v81 = (void *)objc_claimAutoreleasedReturnValue([v82 fieldForKey:@"NWATC_nobuf"]);
            if (v49 == [v81 uint32Value])
            {
              id v80 = (void *)objc_claimAutoreleasedReturnValue([v124 fieldForKey:@"DPSCS_peerStats"]);
              id v79 = (void *)objc_claimAutoreleasedReturnValue([v80 subMessageValue]);
              v78 = (void *)objc_claimAutoreleasedReturnValue([v79 fieldForKey:@"NWAPS_completions"]);
              __int16 v45 = @"NWATC_noremotepeer";
              v77 = (void *)objc_claimAutoreleasedReturnValue([v78 subMessageValue]);
              v76 = (void *)objc_claimAutoreleasedReturnValue([v77 fieldForKey:@"NWATC_noremotepeer"]);
              unsigned int v50 = [v76 uint32Value];
              v75 = (void *)objc_claimAutoreleasedReturnValue([v123 fieldForKey:@"DPSCS_peerStats"]);
              v74 = (void *)objc_claimAutoreleasedReturnValue([v75 subMessageValue]);
              v73 = (void *)objc_claimAutoreleasedReturnValue([v74 fieldForKey:@"NWAPS_completions"]);
              v72 = (void *)objc_claimAutoreleasedReturnValue([v73 subMessageValue]);
              v71 = (void *)objc_claimAutoreleasedReturnValue([v72 fieldForKey:@"NWATC_noremotepeer"]);
              if (v50 == [v71 uint32Value])
              {
                unint64_t v70 = (void *)objc_claimAutoreleasedReturnValue([v124 fieldForKey:@"DPSCS_peerStats"]);
                unsigned int v69 = (void *)objc_claimAutoreleasedReturnValue([v70 subMessageValue]);
                double v68 = (void *)objc_claimAutoreleasedReturnValue([v69 fieldForKey:@"NWAPS_completions"]);
                __int16 v45 = @"NWATC_noresources";
                id v67 = (void *)objc_claimAutoreleasedReturnValue([v68 subMessageValue]);
                v66 = (void *)objc_claimAutoreleasedReturnValue([v67 fieldForKey:@"NWATC_noresources"]);
                unsigned int v51 = [v66 uint32Value];
                v65 = (void *)objc_claimAutoreleasedReturnValue([v123 fieldForKey:@"DPSCS_peerStats"]);
                v64 = (void *)objc_claimAutoreleasedReturnValue([v65 subMessageValue]);
                v63 = (void *)objc_claimAutoreleasedReturnValue([v64 fieldForKey:@"NWAPS_completions"]);
                v62 = (void *)objc_claimAutoreleasedReturnValue([v63 subMessageValue]);
                id v61 = (void *)objc_claimAutoreleasedReturnValue([v62 fieldForKey:@"NWATC_noresources"]);
                if (v51 == [v61 uint32Value])
                {
                  id v60 = (void *)objc_claimAutoreleasedReturnValue([v124 fieldForKey:@"DPSCS_peerStats"]);
                  v59 = (void *)objc_claimAutoreleasedReturnValue([v60 subMessageValue]);
                  v58 = (void *)objc_claimAutoreleasedReturnValue([v59 fieldForKey:@"NWAPS_completions"]);
                  v57 = (void *)objc_claimAutoreleasedReturnValue([v58 subMessageValue]);
                  v56 = (void *)objc_claimAutoreleasedReturnValue([v57 fieldForKey:@"NWATC_txfailure"]);
                  unsigned int v52 = [v56 uint32Value];
                  v55 = (void *)objc_claimAutoreleasedReturnValue([v123 fieldForKey:@"DPSCS_peerStats"]);
                  unsigned int v54 = (void *)objc_claimAutoreleasedReturnValue([v55 subMessageValue]);
                  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v54 fieldForKey:@"NWAPS_completions"]);
                  int v17 = (void *)objc_claimAutoreleasedReturnValue([v16 subMessageValue]);
                  __int16 v45 = (__CFString *)objc_claimAutoreleasedReturnValue([v17 fieldForKey:@"NWATC_txfailure"]);
                  BOOL v38 = v52 == -[__CFString uint32Value](v45, "uint32Value");
                  int v32 = 1;
                  int v33 = 1;
                  int v34 = 1;
                  int v35 = 1;
                  int v36 = 1;
                  int v53 = 1;
                }

                else
                {
                  int v53 = 0;
                  BOOL v38 = 0;
                  int v32 = 1;
                  int v33 = 1;
                  int v34 = 1;
                  int v35 = 1;
                  int v36 = 1;
                }
              }

              else
              {
                int v36 = 0;
                int v53 = 0;
                BOOL v38 = 0;
                int v32 = 1;
                int v33 = 1;
                int v34 = 1;
                int v35 = 1;
              }
            }

            else
            {
              int v35 = 0;
              int v36 = 0;
              int v53 = 0;
              BOOL v38 = 0;
              int v32 = 1;
              int v33 = 1;
              int v34 = 1;
            }
          }

          else
          {
            int v34 = 0;
            int v35 = 0;
            int v36 = 0;
            int v53 = 0;
            BOOL v38 = 0;
            int v32 = 1;
            int v33 = 1;
          }
        }

        else
        {
          int v33 = 0;
          int v34 = 0;
          int v35 = 0;
          int v36 = 0;
          int v53 = 0;
          BOOL v38 = 0;
          int v32 = 1;
        }
      }

      else
      {
        int v32 = 0;
        int v33 = 0;
        int v34 = 0;
        int v35 = 0;
        int v36 = 0;
        int v53 = 0;
        BOOL v38 = 0;
      }

      int v37 = 1;
      if (v53)
      {
      }
    }
  }

  else
  {
    int v32 = 0;
    int v33 = 0;
    int v34 = 0;
    int v35 = 0;
    int v36 = 0;
    int v37 = 0;
    BOOL v38 = 1;
  }

  if (!v36)
  {
    if (!v35) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }

  if (v35)
  {
LABEL_10:
  }

- (BOOL)isHighAWDLActivity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 fieldForKey:@"DPSS_awdlSnapshot"]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 subMessageValue]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 fieldForKey:@"DPSAWDLS_sdb"]);
  unsigned int v8 = [v7 uint32Value];

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 fieldForKey:@"DPSS_awdlSnapshot"]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 subMessageValue]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 fieldForKey:@"DPSAWDLS_use"]);
  unsigned int v12 = [v11 uint32Value];

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 fieldForKey:@"DPSS_awdlSnapshot"]);
  unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 subMessageValue]);
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 fieldForKey:@"DPSAWDLS_ts"]);
  unint64_t v16 = (unint64_t)[v15 uint64Value];

  int v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v17 timeIntervalSince1970];
  double v19 = v18;

  id v20 = WALogCategoryDefaultHandle();
  unint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v22 = -[RecommendationPreferences reset_awdl_activity_threshold]( self->_preferences,  "reset_awdl_activity_threshold");
    int v27 = 136447490;
    v28 = "-[DPSQuickRecoveryRecommendationEngine isHighAWDLActivity:]";
    __int16 v29 = 1024;
    int v30 = 680;
    __int16 v31 = 2048;
    unint64_t v32 = v22;
    __int16 v33 = 1024;
    unsigned int v34 = v12;
    __int16 v35 = 1024;
    unsigned int v36 = v8;
    __int16 v37 = 2048;
    unint64_t v38 = (unint64_t)v19 - v16 / 0x3E8;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:awdl activity threshold: %ld, awdl usage: %u, sdb: %u, updated before:%llu seconds",  (uint8_t *)&v27,  0x32u);
  }

  if (v8) {
    return 0;
  }
  unint64_t v24 = -[RecommendationPreferences reset_awdl_activity_threshold](self->_preferences, "reset_awdl_activity_threshold");
  BOOL result = 0;
  if (v24 < v12 && (unint64_t)v19 - v16 / 0x3E8 <= 0xF)
  {
    id v25 = WALogCategoryDefaultHandle();
    unsigned int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 136446466;
      v28 = "-[DPSQuickRecoveryRecommendationEngine isHighAWDLActivity:]";
      __int16 v29 = 1024;
      int v30 = 683;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:High AWDL Activity suspected!",  (uint8_t *)&v27,  0x12u);
    }

    return 1;
  }

  return result;
}

- (BOOL)checkParameterThresholds:(id)a3 currentSample:(id)a4 qDpsStat:(id)a5 chipNumber:(id)a6 dpsSnapshot:(id)a7 originalCCA:(unsigned int)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  unsigned int v19 = -[DPSQuickRecoveryRecommendationEngine computeBin:previousSample:currentSample:]( self,  "computeBin:previousSample:currentSample:",  @"NWAPS_ccas",  v14,  v15);
  unsigned int v20 = [&off_1000E0390 containsObject:v17];
  preferences = self->_preferences;
  if (v20) {
    unint64_t v22 = -[RecommendationPreferences reset_legacy_chipset_cca_bin_threshold]( preferences,  "reset_legacy_chipset_cca_bin_threshold");
  }
  else {
    unint64_t v22 = -[RecommendationPreferences reset_cca_bin_threshold](preferences, "reset_cca_bin_threshold");
  }
  unint64_t v23 = v22;
  double v24 = (double)(v22 + 1) * 12.5;
  id v25 = WALogCategoryDefaultHandle();
  unsigned int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    int v35 = 136447490;
    unsigned int v36 = "-[DPSQuickRecoveryRecommendationEngine checkParameterThresholds:currentSample:qDpsStat:chipNumber:dpsSnapshot:originalCCA:]";
    __int16 v37 = 1024;
    int v38 = 699;
    __int16 v39 = 1024;
    unsigned int v40 = a8;
    __int16 v41 = 1024;
    int v42 = v23;
    __int16 v43 = 2048;
    *(double *)id v44 = v24;
    *(_WORD *)&v44[8] = 2112;
    *(void *)&v44[10] = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:notificationCCA: %d ccaThreshold:%d ccaFloatThreshold:%f set for chipset : %@",  (uint8_t *)&v35,  0x32u);
  }

  int v27 = (void *)objc_claimAutoreleasedReturnValue([v16 fieldForKey:@"WFAAWDWAQDS_ccaThreshold"]);
  [v27 setUint32Value:v23];

  if (v19 >= v23 || v24 <= (double)a8)
  {
    __int16 v31 = (void *)objc_claimAutoreleasedReturnValue([v16 fieldForKey:@"WFAAWDWAQDS_suppressedReason"]);
    [v31 setInt32Value:6];

    id v32 = WALogCategoryDefaultHandle();
    __int16 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      int v35 = 136447490;
      unsigned int v36 = "-[DPSQuickRecoveryRecommendationEngine checkParameterThresholds:currentSample:qDpsStat:chipNumber:dpsSnapshot:originalCCA:]";
      __int16 v37 = 1024;
      int v38 = 707;
      __int16 v39 = 1024;
      unsigned int v40 = v19;
      __int16 v41 = 1024;
      int v42 = v23;
      __int16 v43 = 1024;
      *(_DWORD *)id v44 = a8;
      *(_WORD *)&v44[4] = 2048;
      *(double *)&v44[6] = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:CCA Threshold Suppression.. cca-bin: %d threshold: %d notificationCCA: %d CCALimit: %f",  (uint8_t *)&v35,  0x2Eu);
    }
  }

  else
  {
    if (-[DPSQuickRecoveryRecommendationEngine isTriggerDisconnect:currentSample:]( self,  "isTriggerDisconnect:currentSample:",  v14,  v15))
    {
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 fieldForKey:@"WFAAWDWAQDS_suppressedReason"]);
      __int16 v29 = v28;
      uint64_t v30 = 7LL;
    }

    else
    {
      if (!-[DPSQuickRecoveryRecommendationEngine isHighAWDLActivity:](self, "isHighAWDLActivity:", v18))
      {
        BOOL v33 = 1;
        goto LABEL_16;
      }

      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 fieldForKey:@"WFAAWDWAQDS_suppressedReason"]);
      __int16 v29 = v28;
      uint64_t v30 = 8LL;
    }

    -[os_log_s setInt32Value:](v28, "setInt32Value:", v30);
  }

  BOOL v33 = 0;
LABEL_16:

  return v33;
}

- (unint64_t)recommendReset:(id)a3 currentSample:(id)a4 acList:(id)a5 qDpsStat:(id)a6 chipNumber:(id)a7 dpsSnapshot:(id)a8 originalCCA:(unsigned int)a9
{
  id v15 = a3;
  id v16 = a4;
  id v85 = a5;
  id v17 = a6;
  id v86 = a7;
  id v87 = a8;
  v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  unint64_t v18 = -[RecommendationPreferences disable_fast_dps_validation_for_test]( self->_preferences,  "disable_fast_dps_validation_for_test");
  unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v17 fieldForKey:@"WFAAWDWAQDS_isDpsValidationDisabled"]);
  [v19 setBoolValue:v18];

  -[DPSQuickRecoveryRecommendationEngine updateTimeSincePreviousTriggerForStudy:msgKey:dictKey:]( self,  "updateTimeSincePreviousTriggerForStudy:msgKey:dictKey:",  v17,  @"WFAAWDWAQDS_quickDpsTimeSincePreviousTriggerMinutes",  @"dps_lastQuickDpsTrigger");
  -[DPSQuickRecoveryRecommendationEngine updateScreenState](self, "updateScreenState");
  unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([v17 fieldForKey:@"WFAAWDWAQDS_screenStateOn"]);
  [v20 setBoolValue:self->screenON];

  if (-[DPSQuickRecoveryRecommendationEngine checkDpsStatus:currentSample:qDpsStat:]( self,  "checkDpsStatus:currentSample:qDpsStat:",  v15,  v16,  v17))
  {
    if (self->model) {
      goto LABEL_3;
    }
    id v42 = WALogCategoryDefaultHandle();
    __int16 v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v90 = "-[DPSQuickRecoveryRecommendationEngine recommendReset:currentSample:acList:qDpsStat:chipNumber:dpsSnapshot:originalCCA:]";
      __int16 v91 = 1024;
      int v92 = 739;
      _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Model not yet loaded, loading...",  buf,  0x12u);
    }

    id v44 = (void *)objc_claimAutoreleasedReturnValue(+[WAUtil resourcePath](&OBJC_CLASS___WAUtil, "resourcePath"));
    __int16 v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@.%@",  v44,  @"WiFiStallDetect",  @"mlmodelc"));

    unsigned int v46 = (NSURL *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v45));
    modelUrl = self->modelUrl;
    self->modelUrl = v46;

    id v48 = WALogCategoryDefaultHandle();
    unsigned int v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v50 = self->modelUrl;
      *(_DWORD *)buf = 136446722;
      v90 = "-[DPSQuickRecoveryRecommendationEngine recommendReset:currentSample:acList:qDpsStat:chipNumber:dpsSnapshot:originalCCA:]";
      __int16 v91 = 1024;
      int v92 = 744;
      __int16 v93 = 2112;
      double v94 = *(double *)&v50;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:modelUrl is %@", buf, 0x1Cu);
    }

    unsigned int v51 = objc_alloc(&OBJC_CLASS___WiFiStallDetect);
    unsigned int v52 = self->modelUrl;
    id v88 = 0LL;
    int v53 = -[WiFiStallDetect initWithContentsOfURL:error:](v51, "initWithContentsOfURL:error:", v52, &v88);
    id v54 = v88;
    model = self->model;
    self->model = v53;

    if (self->model)
    {
LABEL_3:
      if (!self->screenON) {
        goto LABEL_28;
      }
      unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( -[DPSQuickRecoveryRecommendationEngine computeFeatures:currentSample:acList:]( self,  "computeFeatures:currentSample:acList:",  v15,  v16,  v85));
      unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( -[WiFiStallDetect predictionFromFeatures:error:]( self->model,  "predictionFromFeatures:error:",  v21,  0LL));
      id v23 = WALogCategoryDefaultHandle();
      double v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      id v25 = v24;
      if (v22)
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          id v26 = [v22 stall];
          int v27 = "WILL";
          v90 = "-[DPSQuickRecoveryRecommendationEngine recommendReset:currentSample:acList:qDpsStat:chipNumber:dpsSnapsh"
                "ot:originalCCA:]";
          *(_DWORD *)buf = 136446722;
          if (!v26) {
            int v27 = "WILL NOT";
          }
          __int16 v91 = 1024;
          int v92 = 762;
          __int16 v93 = 2080;
          double v94 = *(double *)&v27;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:DPS ML Prediction: The Stall '%s' last for more than 10 seconds",  buf,  0x1Cu);
        }

        v28 = -[NSNumber initWithUnsignedLongLong:]( [NSNumber alloc],  "initWithUnsignedLongLong:",  [v22 stall]);
        __int16 v29 = (void *)objc_claimAutoreleasedReturnValue([v22 stallProbability]);
        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKey:v28]);
        [v30 doubleValue];
        double v32 = v31;

        BOOL v33 = (void *)objc_claimAutoreleasedReturnValue([v17 fieldForKey:@"WFAAWDWAQDS_stallPrediction"]);
        objc_msgSend(v33, "setBoolValue:", (uint64_t)objc_msgSend(v22, "stall") > 0);

        unsigned int v34 = (void *)objc_claimAutoreleasedReturnValue([v17 fieldForKey:@"WFAAWDWAQDS_stallProbability"]);
        double v35 = v32 * 100.0;
        [v34 setUint32Value:v35];

        unint64_t v36 = -[RecommendationPreferences prediction_probability_threshold]( self->_preferences,  "prediction_probability_threshold");
        __int16 v37 = (void *)objc_claimAutoreleasedReturnValue([v17 fieldForKey:@"WFAAWDWAQDS_probabilityThreshold"]);
        [v37 setUint32Value:v36];

        if ((_DWORD)v18)
        {
          id v38 = WALogCategoryDefaultHandle();
          __int16 v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            v90 = "-[DPSQuickRecoveryRecommendationEngine recommendReset:currentSample:acList:qDpsStat:chipNumber:dpsSnap"
                  "shot:originalCCA:]";
            __int16 v91 = 1024;
            int v92 = 779;
            _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:simluated DPS: Overriding decision...do reset",  buf,  0x12u);
          }

LABEL_27:
LABEL_28:
          if (!-[DPSQuickRecoveryRecommendationEngine checkParameterThresholds:currentSample:qDpsStat:chipNumber:dpsSnapshot:originalCCA:]( self,  "checkParameterThresholds:currentSample:qDpsStat:chipNumber:dpsSnapshot:originalCCA:",  v15,  v16,  v17,  v86,  v87,  a9)
            || !-[DPSQuickRecoveryRecommendationEngine checkForPriorityNetwork](self, "checkForPriorityNetwork"))
          {
            uint64_t v62 = 0LL;
            unint64_t v18 = 0LL;
LABEL_38:
            v63 = (void *)objc_claimAutoreleasedReturnValue([v17 fieldForKey:@"WFAAWDWAQDS_suppressedReason"]);
            v64 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v63 int32Value]));

            -[NSMutableDictionary setObject:forKey:]( self->_dpsStats,  "setObject:forKey:",  v64,  @"dps_lastQuickRecoverySuppressionReason");
            if ((v62 & 1) == 0) {
              -[NSMutableDictionary setObject:forKey:]( self->_dpsStats,  "setObject:forKey:",  v84,  @"dps_lastQuickRecoverySuppressedWD");
            }
            id v65 = WALogCategoryDefaultHandle();
            v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
            if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
            {
              id v67 = "NO";
              v90 = "-[DPSQuickRecoveryRecommendationEngine recommendReset:currentSample:acList:qDpsStat:chipNumber:dpsSn"
                    "apshot:originalCCA:]";
              *(_DWORD *)buf = 136446722;
              if ((_DWORD)v62) {
                id v67 = "YES";
              }
              __int16 v91 = 1024;
              int v92 = 820;
              __int16 v93 = 2080;
              double v94 = *(double *)&v67;
              _os_log_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Recommendation for fast reset: %s",  buf,  0x1Cu);
            }

            if ((v62 & 1) == 0)
            {
              id v68 = WALogCategoryDefaultHandle();
              unsigned int v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
              if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
              {
                id v70 = [v64 intValue];
                if (v70 >= 0xB) {
                  v71 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  v70));
                }
                else {
                  v71 = off_1000CD008[(int)v70];
                }
                *(_DWORD *)buf = 136446722;
                v90 = "-[DPSQuickRecoveryRecommendationEngine recommendReset:currentSample:acList:qDpsStat:chipNumber:dps"
                      "Snapshot:originalCCA:]";
                __int16 v91 = 1024;
                int v92 = 822;
                __int16 v93 = 2112;
                double v94 = *(double *)&v71;
                _os_log_impl( (void *)&_mh_execute_header,  v69,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:quickDPS: Suppressed Reason: %@",  buf,  0x1Cu);
              }
            }

            v72 = (void *)objc_claimAutoreleasedReturnValue([v17 fieldForKey:@"WFAAWDWAQDS_quickDpsResetRecommendation"]);
            [v72 setBoolValue:v62];

            v73 = (void *)objc_claimAutoreleasedReturnValue([v17 fieldForKey:@"WFAAWDWAQDS_rssiThreshold"]);
            preferences = self->_preferences;
            p_preferences = &self->_preferences;
            objc_msgSend( v73,  "setUint32Value:",  -[RecommendationPreferences reset_rssi_bin_threshold](preferences, "reset_rssi_bin_threshold"));

            v76 = (void *)objc_claimAutoreleasedReturnValue([v17 fieldForKey:@"WFAAWDWAQDS_screenOnThreshold"]);
            objc_msgSend( v76,  "setUint32Value:",  -[RecommendationPreferences minutes_between_fast_dps_wd_screen_on]( *p_preferences,  "minutes_between_fast_dps_wd_screen_on"));

            v77 = (void *)objc_claimAutoreleasedReturnValue([v17 fieldForKey:@"WFAAWDWAQDS_screenOffThreshold"]);
            objc_msgSend( v77,  "setUint32Value:",  -[RecommendationPreferences minutes_between_fast_dps_wd_screen_off]( *p_preferences,  "minutes_between_fast_dps_wd_screen_off"));

            v78 = (void *)objc_claimAutoreleasedReturnValue([v17 fieldForKey:@"WFAAWDWAQDS_awdlActivityThreshold"]);
            objc_msgSend( v78,  "setUint32Value:",  -[RecommendationPreferences reset_awdl_activity_threshold]( *p_preferences,  "reset_awdl_activity_threshold"));

            goto LABEL_52;
          }

          unsigned int v60 = -[DPSQuickRecoveryRecommendationEngine isResetAllowedForQuickDPS](self, "isResetAllowedForQuickDPS");
          id v61 = (void *)objc_claimAutoreleasedReturnValue([v17 fieldForKey:@"WFAAWDWAQDS_suppressedReason"]);
          unint64_t v21 = v61;
          if (v60)
          {
            [v61 setInt32Value:0];
            unint64_t v18 = 1LL;
            uint64_t v62 = 1LL;
          }

          else
          {
            [v61 setInt32Value:5];
            uint64_t v62 = 0LL;
            unint64_t v18 = 2LL;
          }

- (BOOL)isPeerDiagnosticsTriggerAllowed:(unint64_t)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  preferences = self->_preferences;
  if (a3)
  {
    unint64_t v7 = -[RecommendationPreferences minutes_between_peer_diagnostics_trigger_for_other_issues]( preferences,  "minutes_between_peer_diagnostics_trigger_for_other_issues");
    unsigned int v8 = @"pd_lastDiagnosticsTriggerForOtherIssues";
  }

  else
  {
    unint64_t v7 = -[RecommendationPreferences minutes_between_peer_diagnostics_trigger_for_dns_stall]( preferences,  "minutes_between_peer_diagnostics_trigger_for_dns_stall");
    unsigned int v8 = @"pd_lastDiagnosticsTriggerForDNSStall";
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_dpsQuickRecoveryWDBudgetDict, "valueForKey:", v8));
  if (v9 && ([v5 timeIntervalSinceDate:v9], unint64_t v11 = (int)(v10 / 60.0), v7 > v11))
  {
    id v12 = WALogCategoryDefaultHandle();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136447234;
      id v17 = "-[DPSQuickRecoveryRecommendationEngine isPeerDiagnosticsTriggerAllowed:]";
      __int16 v18 = 1024;
      int v19 = 859;
      __int16 v20 = 2048;
      unint64_t v21 = a3;
      __int16 v22 = 2048;
      uint64_t v23 = (int)v11;
      __int16 v24 = 2112;
      id v25 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:PeerDiagnostics: Trigger Not Allowed for type:%lu - Last trigger was %ld minutes ago at %@",  (uint8_t *)&v16,  0x30u);
    }

    BOOL v14 = 0;
  }

  else
  {
    -[NSMutableDictionary setObject:forKey:](self->_dpsQuickRecoveryWDBudgetDict, "setObject:forKey:", v5, v8);
    BOOL v14 = 1;
  }

  return v14;
}

- (BOOL)isScoreBelowThreshold:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"NetScore"]);
  unsigned int v6 = [v5 unsignedIntValue];

  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"DataStallScore"]);
  unsigned int v8 = [v7 unsignedIntValue];

  BOOL v9 = -[RecommendationPreferences reset_score_threshold](self->_preferences, "reset_score_threshold") >= v6
    || -[RecommendationPreferences reset_score_threshold](self->_preferences, "reset_score_threshold") >= v8;
  id v10 = WALogCategoryDefaultHandle();
  unint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136446978;
    BOOL v14 = "-[DPSQuickRecoveryRecommendationEngine isScoreBelowThreshold:]";
    __int16 v15 = 1024;
    int v16 = 882;
    __int16 v17 = 1024;
    unsigned int v18 = v6;
    __int16 v19 = 1024;
    unsigned int v20 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:PeerDiagnostics: netScore:%u dataStallScore:%u",  (uint8_t *)&v13,  0x1Eu);
  }

  return v9;
}

- (BOOL)isGoodWiFiCondition:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"RSSI"]);
  signed int v6 = [v5 intValue];

  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"CCA"]);
  unint64_t v8 = [v7 unsignedIntValue];

  BOOL v9 = -[RecommendationPreferences reset_pd_rssi_threshold](self->_preferences, "reset_pd_rssi_threshold") <= v6
    && -[RecommendationPreferences reset_pd_cca_threshold](self->_preferences, "reset_pd_cca_threshold") >= v8;
  id v10 = WALogCategoryDefaultHandle();
  unint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136446978;
    BOOL v14 = "-[DPSQuickRecoveryRecommendationEngine isGoodWiFiCondition:]";
    __int16 v15 = 1024;
    int v16 = 898;
    __int16 v17 = 2048;
    uint64_t v18 = v6;
    __int16 v19 = 2048;
    unint64_t v20 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:PeerDiagnostics: RSSI:%ld CCA:%ld",  (uint8_t *)&v13,  0x26u);
  }

  return v9;
}

- (void)updateTimeSincePreviousTriggerForStudy:(id)a3 msgKey:(id)a4 dictKey:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_dpsQuickRecoveryWDBudgetDict, "valueForKey:", v10));
  if (v12)
  {
    [v11 timeIntervalSinceDate:v12];
    uint64_t v14 = (int)(v13 / 60.0);
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v8 fieldForKey:v9]);
    [v15 setUint64Value:v14];
  }

  else
  {
    uint64_t v14 = 0LL;
  }

  -[NSMutableDictionary setObject:forKey:](self->_dpsQuickRecoveryWDBudgetDict, "setObject:forKey:", v11, v10);
  id v16 = WALogCategoryDefaultHandle();
  __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136447746;
    __int16 v19 = "-[DPSQuickRecoveryRecommendationEngine updateTimeSincePreviousTriggerForStudy:msgKey:dictKey:]";
    __int16 v20 = 1024;
    int v21 = 913;
    __int16 v22 = 2112;
    id v23 = v9;
    __int16 v24 = 2112;
    id v25 = v10;
    __int16 v26 = 2112;
    int v27 = v12;
    __int16 v28 = 2112;
    __int16 v29 = v11;
    __int16 v30 = 2048;
    uint64_t v31 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:msgkey:%@ dictKey:%@ previous_TS:%@ current_TS:%@ difference:%llu",  (uint8_t *)&v18,  0x44u);
  }
}

- (void)updateTimeSincePreviousTriggerForQuickDps:(id)a3
{
  id v9 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary valueForKey:]( self->_dpsQuickRecoveryWDBudgetDict,  "valueForKey:",  @"dps_lastQuickDpsTrigger"));
  if (v5)
  {
    [v4 timeIntervalSinceDate:v5];
    uint64_t v7 = (int)(v6 / 60.0);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v9 fieldForKey:@"WFAAWDWAQDS_quickDpsTimeSincePreviousTriggerMinutes"]);
    [v8 setUint64Value:v7];
  }
}

- (BOOL)checkAWDLActivity:(id)a3 symptomsDnsStats:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 fieldForKey:@"DPSS_awdlSnapshot"]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 subMessageValue]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 fieldForKey:@"DPSAWDLS_sdb"]);
  unsigned int v10 = [v9 uint32Value];

  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 fieldForKey:@"DPSS_awdlSnapshot"]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 subMessageValue]);
  double v13 = (void *)objc_claimAutoreleasedReturnValue([v12 fieldForKey:@"DPSAWDLS_use"]);
  unsigned int v14 = [v13 uint32Value];

  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v6 fieldForKey:@"DPSS_awdlSnapshot"]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 subMessageValue]);
  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 fieldForKey:@"DPSAWDLS_ts"]);
  unint64_t v18 = (unint64_t)[v17 uint64Value];

  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v19 timeIntervalSince1970];
  double v21 = v20;

  id v22 = WALogCategoryDefaultHandle();
  id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    int v30 = 136447234;
    uint64_t v31 = "-[DPSQuickRecoveryRecommendationEngine checkAWDLActivity:symptomsDnsStats:]";
    __int16 v32 = 1024;
    int v33 = 939;
    __int16 v34 = 1024;
    unsigned int v35 = v14;
    __int16 v36 = 1024;
    unsigned int v37 = v10;
    __int16 v38 = 2048;
    unint64_t v39 = (unint64_t)v21 - v18 / 0x3E8;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:awdl activity detected, awdl usage: %u, sdb: %u, updated before:%llu seconds",  (uint8_t *)&v30,  0x28u);
  }

  if (v14) {
    BOOL v24 = (unint64_t)v21 - v18 / 0x3E8 >= 0x10;
  }
  else {
    BOOL v24 = 1;
  }
  BOOL v25 = !v24;
  if (v25)
  {
    __int16 v26 = (void *)objc_claimAutoreleasedReturnValue([v5 fieldForKey:@"WFAAWDWASDS_suppressedReason"]);
    [v26 setInt32Value:4];

    id v27 = WALogCategoryDefaultHandle();
    __int16 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = 136446466;
      uint64_t v31 = "-[DPSQuickRecoveryRecommendationEngine checkAWDLActivity:symptomsDnsStats:]";
      __int16 v32 = 1024;
      int v33 = 943;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:AWDL Activity suspected!",  (uint8_t *)&v30,  0x12u);
    }
  }

  return v25;
}

- (unint64_t)recommendSymptomsDpsRecovery:(id)a3 symptomsDnsStats:(id)a4 awdlState:(BOOL)a5 currentSymptomsCondition:(BOOL)a6 isLANPingSuccessful:(BOOL)a7 appUsage:(BOOL)a8 averageCCA:(unsigned int)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  BOOL v12 = a5;
  id v15 = a3;
  id v16 = a4;
  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 fieldForKey:@"WFAAWDWASDS_symptomsDnsRecommendation"]);
  [v17 setInt32Value:0];

  -[DPSQuickRecoveryRecommendationEngine updateTimeSincePreviousTriggerForStudy:msgKey:dictKey:]( self,  "updateTimeSincePreviousTriggerForStudy:msgKey:dictKey:",  v16,  @"WFAAWDWASDS_symptomsDnsTimeSincePreviousTriggerMinutes",  @"dps_lastSymptomsDpsTrigger");
  unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v16 fieldForKey:@"WFAAWDWASDS_suppressedReason"]);
  [v18 setInt32Value:0];

  -[DPSQuickRecoveryRecommendationEngine updateScreenState](self, "updateScreenState");
  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v16 fieldForKey:@"WFAAWDWASDS_symptomsDnsscreenStateOn"]);
  [v19 setBoolValue:self->screenON];

  double v20 = &off_100092000;
  if (v9)
  {
    uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue([v16 fieldForKey:@"WFAAWDWASDS_suppressedReason"]);
    [v62 setInt32Value:5];

    id v63 = WALogCategoryDefaultHandle();
    unsigned int v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      goto LABEL_71;
    }
    *(_DWORD *)buf = 136446466;
    id v79 = "-[DPSQuickRecoveryRecommendationEngine recommendSymptomsDpsRecovery:symptomsDnsStats:awdlState:currentSymptoms"
          "Condition:isLANPingSuccessful:appUsage:averageCCA:]";
    __int16 v80 = 1024;
    int v81 = 961;
    v64 = "%{public}s::%d:critical App In Use";
LABEL_70:
    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, v64, buf, 0x12u);
    goto LABEL_71;
  }

  if (!a6)
  {
    id v65 = (void *)objc_claimAutoreleasedReturnValue([v16 fieldForKey:@"WFAAWDWASDS_suppressedReason"]);
    [v65 setInt32Value:2];

    id v66 = WALogCategoryDefaultHandle();
    unsigned int v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      goto LABEL_71;
    }
    *(_DWORD *)buf = 136446466;
    id v79 = "-[DPSQuickRecoveryRecommendationEngine recommendSymptomsDpsRecovery:symptomsDnsStats:awdlState:currentSymptoms"
          "Condition:isLANPingSuccessful:appUsage:averageCCA:]";
    __int16 v80 = 1024;
    int v81 = 962;
    v64 = "%{public}s::%d:DNS symptoms Condition recovered";
    goto LABEL_70;
  }

  if (-[RecommendationPreferences dps_symptoms_average_cca_threshold]( self->_preferences,  "dps_symptoms_average_cca_threshold") < a9)
  {
    id v67 = (void *)objc_claimAutoreleasedReturnValue([v16 fieldForKey:@"WFAAWDWASDS_suppressedReason"]);
    [v67 setInt32Value:7];

    id v68 = WALogCategoryDefaultHandle();
    unsigned int v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      id v79 = "-[DPSQuickRecoveryRecommendationEngine recommendSymptomsDpsRecovery:symptomsDnsStats:awdlState:currentSympto"
            "msCondition:isLANPingSuccessful:appUsage:averageCCA:]";
      __int16 v80 = 1024;
      int v81 = 963;
      v64 = "%{public}s::%d:DNS symptoms Average CCA greater than threshold";
      goto LABEL_70;
    }

- (RecommendationPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
}

- (NSMutableDictionary)dpsQuickRecoveryWDBudgetDict
{
  return self->_dpsQuickRecoveryWDBudgetDict;
}

- (void)setDpsQuickRecoveryWDBudgetDict:(id)a3
{
}

- (NSMutableDictionary)dpsStats
{
  return self->_dpsStats;
}

- (void)setDpsStats:(id)a3
{
}

- (void).cxx_destruct
{
}

@end