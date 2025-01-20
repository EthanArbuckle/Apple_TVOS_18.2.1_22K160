@interface HTPrefs
+ (id)sharedPrefs;
- (BOOL)BOOLProperty:(HTPrefInit *)a3 contextPrefixOut:(id *)a4;
- (BOOL)_isInternalNoOverride;
- (BOOL)appActivationLoggingEnabled;
- (BOOL)appLaunchMonitoringEnabled;
- (BOOL)customerModeEnabled;
- (BOOL)enableLoggingForPoster;
- (BOOL)enableLoggingForWidgetRenderer;
- (BOOL)eplEnabled;
- (BOOL)eplEnabledProfile;
- (BOOL)fenceTrackingEnabled;
- (BOOL)forceQuitDetectionEnabled;
- (BOOL)hangtracerDaemonEnabled;
- (BOOL)hasInternalSettings;
- (BOOL)haveNonDefaultFeatureFlags;
- (BOOL)haveRootsInstalled;
- (BOOL)haveSerialLoggingEnabled;
- (BOOL)htTailspinEnabled;
- (BOOL)hudEnabled;
- (BOOL)isCarryDevice;
- (BOOL)isInternal;
- (BOOL)keepTailspinsLegacy;
- (BOOL)memoryLoggingEnabled;
- (BOOL)pdseAllowEnableTailspin;
- (BOOL)pdseAppLaunchKillSwitch;
- (BOOL)pdseCATailspinKillSwitch;
- (BOOL)pdseHTRateOnlyKillSwitch;
- (BOOL)pdseHTThirdPartyKillSwitch;
- (BOOL)pdseHangTracerKillSwitch;
- (BOOL)pdseSentryKillSwitch;
- (BOOL)pdseWorkflowResponsivenessKillSwitch;
- (BOOL)shouldAllowSentryEnablement;
- (BOOL)shouldAllowWorkflowResponsivenessEnablement;
- (BOOL)shouldCollectOSSignposts;
- (BOOL)shouldCollectOSSignpostsDeferred;
- (BOOL)shouldCompressSavedTailspins;
- (BOOL)shouldDisplayFenceHangToHUD;
- (BOOL)shouldIncludeDiskInfo;
- (BOOL)shouldIncludeDisplayData;
- (BOOL)shouldIncludeNetworkState;
- (BOOL)shouldPostHTPrefsChangedNotification;
- (BOOL)shouldSaveTailspins;
- (BOOL)shouldUpdateHangsHUD;
- (BOOL)shouldUploadToDiagPipe;
- (BOOL)signpostMonitoringEnabled;
- (BOOL)slowAppActivationTailspinEnabled;
- (BOOL)thirdPartyDevHangHUDEnabled;
- (BOOL)thirdPartyIncludeNonDevelopmentApps;
- (BOOL)thirdPartyRunLoopHangLogsEnabled;
- (BOOL)workflowResponsivenessEnabled;
- (HTPrefInit)prefInitList;
- (NSArray)prefContextPrefixPriorityOrder;
- (NSArray)thirdPartyDevPreferredLanguages;
- (NSDictionary)_installedHTProfileDict;
- (NSString)_profilePath;
- (NSString)automationGroup;
- (NSString)enablementPrefix;
- (NSString)experimentGroup;
- (NSString)tailspinSaveFormat;
- (NSString)thirdPartyDevBootSessionUUID;
- (OS_dispatch_queue)_prefsQueue;
- (__CFString)_htDomain;
- (__CFString)_htTaskingDomain;
- (double)appActivationLoggingCPUUtilizationThresholdMSec;
- (double)badDaySecondsBetweenLastEnablementAndReferenceDate;
- (double)doubleProperty:(HTPrefInit *)a3 contextPrefixOut:(id *)a4;
- (double)eplTimeoutTimestampSec;
- (double)runloopHangPercentHeavyLogs;
- (double)samplingPercentForMicroHangs;
- (id)getHighestPrioritySettingValue:(id)a3 matchingSelector:(SEL)a4 contextPrefixOut:(id *)a5;
- (id)objectProperty:(HTPrefInit *)a3 matchingSelector:(SEL)a4 contextPrefixOut:(id *)a5;
- (id)prefNamed:(__CFString *)a3 domain:(__CFString *)a4 profile:(id)a5 matchingSelector:(SEL)a6 contextPrefixOut:(id *)a7;
- (id)stringProperty:(HTPrefInit *)a3 contextPrefixOut:(id *)a4;
- (int)fenceHangDailyLogLimit;
- (int)intProperty:(HTPrefInit *)a3 contextPrefixOut:(id *)a4;
- (int)numOSCryptexFileExtents;
- (int)pdseAppLaunchPeriodDays;
- (int)pdseCATailspinPeriodDays;
- (int)pdseHTPeriodDays;
- (int)pdseHTRateOnlyPeriodDays;
- (int)pdseHTThirdPartyNoLogUploadPeriodDays;
- (int)pdseHTThirdPartyPeriodDays;
- (int)pdseSentryPeriodDays;
- (int)pdseWorkflowResponsivenessPeriodDays;
- (int)runLoopHangDailyLogLimit;
- (int)runLoopHangPerPeriodLogLimit;
- (int)runLoopLongHangDailyLogLimit;
- (int)runLoopMicroHangDailyLogLimit;
- (int)runloopHangThirdPartyDailyLogLimit;
- (int)signpostMonitoringDailyLogLimit;
- (int)signpostMonitoringPerPeriodLogLimit;
- (int)slowAppActivationDailyLogLimit;
- (int)slowAppActivationPerAppMaxLogLimit;
- (int)workflowResponsivenessDailyLogLimit;
- (int)workflowResponsivenessPerPeriodLogLimit;
- (unint64_t)badDayEnablementForHangDurationMSec;
- (unint64_t)hangWaitTimeoutDurationMSec;
- (unint64_t)reportPeriodMATU;
- (unint64_t)runloopHangDurationThresholdMSec;
- (unint64_t)runloopHangThirdPartyDurationThresholdMSec;
- (unint64_t)runloopHangTimeoutDurationMSec;
- (unint64_t)runloopLongHangDurationThresholdMSec;
- (unint64_t)savedTailspinMaxMB;
- (unint64_t)slowAppActivationThresholdMSec;
- (unint64_t)springBoardHangIORegGPUDumpTimeoutMSec;
- (unint64_t)unsignedLongLongProperty:(HTPrefInit *)a3 contextPrefixOut:(id *)a4;
- (unint64_t)unsignedLongProperty:(HTPrefInit *)a3 contextPrefixOut:(id *)a4;
- (unsigned)appActivationLoggingMaxActivationLimit;
- (unsigned)badDayEnablementDurationDays;
- (unsigned)badDayEnablementForLogCount;
- (unsigned)badDayEnablementForPreviousDays;
- (unsigned)badDayEnablementMinimumBreakDurationDays;
- (unsigned)forceQuitDetectionThresholdMSec;
- (unsigned)hudThresholdMSec;
- (unsigned)memoryLoggingIntervalSec;
- (unsigned)unsignedIntProperty:(HTPrefInit *)a3 contextPrefixOut:(id *)a4;
- (void)__createInternalSettings;
- (void)_removeAllPrefs;
- (void)dealloc;
- (void)earlyInitNecessaryPrefs;
- (void)initBoolProperty:(HTPrefInit *)a3;
- (void)initDoubleProperty:(HTPrefInit *)a3;
- (void)initIntProperty:(HTPrefInit *)a3;
- (void)initNSObjectProperty:(HTPrefInit *)a3;
- (void)initNSStringProperty:(HTPrefInit *)a3;
- (void)initPropertyHangtracerDaemonEnabled:(HTPrefInit *)a3;
- (void)initPropertyHaveInternalSettings:(HTPrefInit *)a3;
- (void)initPropertyIsInternal:(HTPrefInit *)a3;
- (void)initPropertyMemoryLoggingIntervalSec:(HTPrefInit *)a3;
- (void)initPropertyReportPeriod:(HTPrefInit *)a3;
- (void)initPropertyShouldSaveAndCompressTailspins:(HTPrefInit *)a3;
- (void)initPropertyThirdPartyDevPreferredLanguages:(HTPrefInit *)a3;
- (void)initUnsignedIntProperty:(HTPrefInit *)a3;
- (void)initUnsignedLongLongProperty:(HTPrefInit *)a3;
- (void)initUnsignedLongProperty:(HTPrefInit *)a3;
- (void)refreshHTPrefs;
- (void)setAutomationGroup:(id)a3;
- (void)setEnableLoggingForPoster:(BOOL)a3;
- (void)setEnableLoggingForWidgetRenderer:(BOOL)a3;
- (void)setExperimentGroup:(id)a3;
- (void)setKeepTailspinsLegacy:(BOOL)a3;
- (void)setMemoryLoggingIntervalSec:(unsigned int)a3;
- (void)setShouldAllowSentryEnablement:(BOOL)a3;
- (void)setShouldAllowWorkflowResponsivenessEnablement:(BOOL)a3;
- (void)setShouldPostHTPrefsChangedNotification:(BOOL)a3;
- (void)setTailspinSaveFormat:(id)a3;
- (void)set_htDomain:(__CFString *)a3;
- (void)set_htTaskingDomain:(__CFString *)a3;
- (void)set_installedHTProfileDict:(id)a3;
- (void)set_isInternalNoOverride:(BOOL)a3;
- (void)set_prefsQueue:(id)a3;
- (void)set_profilePath:(id)a3;
- (void)setupPrefsWithQueue:(id)a3;
- (void)setupPrefsWithQueue:(id)a3 profilePath:(id)a4 taskingDomainName:(__CFString *)a5 hangtracerDomain:(__CFString *)a6 setupInternalPrefs:(BOOL)a7;
@end

@implementation HTPrefs

- (NSArray)prefContextPrefixPriorityOrder
{
  if (qword_10001A1A8 != -1) {
    dispatch_once(&qword_10001A1A8, &stru_100014600);
  }
  return (NSArray *)(id)qword_10001A1B0;
}

- (id)prefNamed:(__CFString *)a3 domain:(__CFString *)a4 profile:(id)a5 matchingSelector:(SEL)a6 contextPrefixOut:(id *)a7
{
  id v26 = a5;
  v29 = a3;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[HTPrefs prefContextPrefixPriorityOrder](self, "prefContextPrefixPriorityOrder"));
  id v10 = [obj countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v31;
    while (2)
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v31 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(__CFString **)(*((void *)&v30 + 1) + 8LL * (void)i);
        unsigned int v15 = -[__CFString isEqualToString:](v14, "isEqualToString:", &stru_100014D38);
        if (v15) {
          v16 = v29;
        }
        else {
          v16 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  v14,  v29));
        }
        v17 = v16;
        else {
          CFPropertyListRef v18 = CFPreferencesCopyValue(v17, a4, @"mobile", kCFPreferencesAnyHost);
        }
        v19 = (void *)v18;
        if (v18 && (objc_opt_respondsToSelector(v18, a6) & 1) != 0)
        {
          id v21 = shared_ht_log_handle();
          v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            v24 = @"<base context>";
            *(_DWORD *)buf = 138412802;
            if (!v15) {
              v24 = v14;
            }
            v35 = v24;
            __int16 v36 = 2112;
            v37 = v29;
            __int16 v38 = 2112;
            v39 = v19;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEBUG,  "HTPrefs: Overriden by %@: %@ = %@",  buf,  0x20u);
          }

          if (a7) {
            *a7 = v14;
          }

          goto LABEL_25;
        }

        if (a7) {
          *a7 = 0LL;
        }
      }

      id v11 = [obj countByEnumeratingWithState:&v30 objects:v40 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  id v20 = shared_ht_log_handle();
  id obj = (id)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled((os_log_t)obj, OS_LOG_TYPE_DEBUG)) {
    sub_10000C07C((uint64_t)v29, (uint64_t)a4, (os_log_t)obj);
  }
  v19 = 0LL;
LABEL_25:

  return v19;
}

- (id)getHighestPrioritySettingValue:(id)a3 matchingSelector:(SEL)a4 contextPrefixOut:(id *)a5
{
  return -[HTPrefs prefNamed:domain:profile:matchingSelector:contextPrefixOut:]( self,  "prefNamed:domain:profile:matchingSelector:contextPrefixOut:",  a3,  self->__htTaskingDomain,  self->__installedHTProfileDict,  a4,  a5);
}

- (BOOL)BOOLProperty:(HTPrefInit *)a3 contextPrefixOut:(id *)a4
{
  uint64_t v4 = 16LL;
  if (!self->_isInternal) {
    uint64_t v4 = 24LL;
  }
  unsigned __int8 v5 = *((_BYTE *)&a3->var0 + v4) != 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue( -[HTPrefs prefNamed:domain:profile:matchingSelector:contextPrefixOut:]( self,  "prefNamed:domain:profile:matchingSelector:contextPrefixOut:",  a3->var0,  self->__htTaskingDomain,  self->__installedHTProfileDict,  "BOOLValue",  a4));
  if ((objc_opt_respondsToSelector(v6, "BOOLValue") & 1) != 0) {
    unsigned __int8 v5 = [v6 BOOLValue];
  }

  return v5;
}

- (int)intProperty:(HTPrefInit *)a3 contextPrefixOut:(id *)a4
{
  uint64_t v5 = 16LL;
  if (!self->_isInternal) {
    uint64_t v5 = 24LL;
  }
  int v6 = *(_DWORD *)((char *)&a3->var0 + v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[HTPrefs prefNamed:domain:profile:matchingSelector:contextPrefixOut:]( self,  "prefNamed:domain:profile:matchingSelector:contextPrefixOut:",  a3->var0,  self->__htTaskingDomain,  self->__installedHTProfileDict,  "intValue",  a4));
  unsigned int v8 = [v7 intValue];
  int v9 = v8;
  if ((a3->var4 & 1) != 0 && !v8)
  {
    id v10 = shared_ht_log_handle();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      var0 = a3->var0;
      unint64_t var4 = a3->var4;
      int v15 = 138412802;
      v16 = var0;
      __int16 v17 = 2048;
      unint64_t v18 = var4;
      __int16 v19 = 1024;
      int v20 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "HTPrefs: %@ failed policy check (%lu) for value %d",  (uint8_t *)&v15,  0x1Cu);
    }

LABEL_9:
    int v9 = v6;
  }

  return v9;
}

- (unsigned)unsignedIntProperty:(HTPrefInit *)a3 contextPrefixOut:(id *)a4
{
  uint64_t v5 = 16LL;
  if (!self->_isInternal) {
    uint64_t v5 = 24LL;
  }
  unsigned int v6 = *(_DWORD *)((char *)&a3->var0 + v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[HTPrefs prefNamed:domain:profile:matchingSelector:contextPrefixOut:]( self,  "prefNamed:domain:profile:matchingSelector:contextPrefixOut:",  a3->var0,  self->__htTaskingDomain,  self->__installedHTProfileDict,  "unsignedIntValue",  a4));
  if ((objc_opt_respondsToSelector(v7, "unsignedIntValue") & 1) == 0) {
    goto LABEL_9;
  }
  unsigned int v8 = [v7 unsignedIntValue];
  unsigned int v9 = v8;
  if ((a3->var4 & 1) != 0 && !v8)
  {
    id v10 = shared_ht_log_handle();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      var0 = a3->var0;
      unint64_t var4 = a3->var4;
      int v15 = 138412802;
      v16 = var0;
      __int16 v17 = 2048;
      unint64_t v18 = var4;
      __int16 v19 = 1024;
      int v20 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "HTPrefs: %@ failed policy check (%lu) for value %u",  (uint8_t *)&v15,  0x1Cu);
    }

LABEL_9:
    unsigned int v9 = v6;
  }

  return v9;
}

- (unint64_t)unsignedLongProperty:(HTPrefInit *)a3 contextPrefixOut:(id *)a4
{
  uint64_t v5 = 16LL;
  if (!self->_isInternal) {
    uint64_t v5 = 24LL;
  }
  unint64_t v6 = *(unint64_t *)((char *)&a3->var0 + v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[HTPrefs prefNamed:domain:profile:matchingSelector:contextPrefixOut:]( self,  "prefNamed:domain:profile:matchingSelector:contextPrefixOut:",  a3->var0,  self->__htTaskingDomain,  self->__installedHTProfileDict,  "unsignedLongValue",  a4));
  if ((objc_opt_respondsToSelector(v7, "unsignedLongValue") & 1) == 0) {
    goto LABEL_9;
  }
  id v8 = [v7 unsignedLongValue];
  unint64_t v9 = (unint64_t)v8;
  if ((a3->var4 & 1) != 0 && !v8)
  {
    id v10 = shared_ht_log_handle();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      var0 = a3->var0;
      unint64_t var4 = a3->var4;
      int v15 = 138412802;
      v16 = var0;
      __int16 v17 = 2048;
      unint64_t v18 = var4;
      __int16 v19 = 2048;
      uint64_t v20 = 0LL;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "HTPrefs: %@ failed policy check (%lu) for value %lu",  (uint8_t *)&v15,  0x20u);
    }

LABEL_9:
    unint64_t v9 = v6;
  }

  return v9;
}

- (unint64_t)unsignedLongLongProperty:(HTPrefInit *)a3 contextPrefixOut:(id *)a4
{
  uint64_t v5 = 16LL;
  if (!self->_isInternal) {
    uint64_t v5 = 24LL;
  }
  unint64_t v6 = *(unint64_t *)((char *)&a3->var0 + v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[HTPrefs prefNamed:domain:profile:matchingSelector:contextPrefixOut:]( self,  "prefNamed:domain:profile:matchingSelector:contextPrefixOut:",  a3->var0,  self->__htTaskingDomain,  self->__installedHTProfileDict,  "unsignedLongLongValue",  a4));
  if ((objc_opt_respondsToSelector(v7, "unsignedLongLongValue") & 1) == 0) {
    goto LABEL_9;
  }
  id v8 = [v7 unsignedLongLongValue];
  unint64_t v9 = (unint64_t)v8;
  if ((a3->var4 & 1) != 0 && !v8)
  {
    id v10 = shared_ht_log_handle();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      var0 = a3->var0;
      unint64_t var4 = a3->var4;
      int v15 = 138412802;
      v16 = var0;
      __int16 v17 = 2048;
      unint64_t v18 = var4;
      __int16 v19 = 2048;
      uint64_t v20 = 0LL;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "HTPrefs: %@ failed policy check (%lu) for value %llu",  (uint8_t *)&v15,  0x20u);
    }

LABEL_9:
    unint64_t v9 = v6;
  }

  return v9;
}

- (double)doubleProperty:(HTPrefInit *)a3 contextPrefixOut:(id *)a4
{
  uint64_t v5 = 16LL;
  if (!self->_isInternal) {
    uint64_t v5 = 24LL;
  }
  double v6 = *(double *)((char *)&a3->var0 + v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[HTPrefs prefNamed:domain:profile:matchingSelector:contextPrefixOut:]( self,  "prefNamed:domain:profile:matchingSelector:contextPrefixOut:",  a3->var0,  self->__htTaskingDomain,  self->__installedHTProfileDict,  "doubleValue",  a4));
  if ((objc_opt_respondsToSelector(v7, "doubleValue") & 1) != 0)
  {
    [v7 doubleValue];
    double v9 = v8;
    if ((a3->var4 & 2) != 0 && v8 < v6)
    {
      id v10 = shared_ht_log_handle();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        var0 = a3->var0;
        unint64_t var4 = a3->var4;
        int v15 = 138412802;
        v16 = var0;
        __int16 v17 = 2048;
        unint64_t v18 = var4;
        __int16 v19 = 2048;
        double v20 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "HTPrefs: %@ failed policy check (%lu) for value %f",  (uint8_t *)&v15,  0x20u);
      }
    }

    else
    {
      double v6 = v8;
    }
  }

  return v6;
}

- (id)stringProperty:(HTPrefInit *)a3 contextPrefixOut:(id *)a4
{
  uint64_t v7 = 16LL;
  if (!self->_isInternal) {
    uint64_t v7 = 24LL;
  }
  id v8 = *(id *)((char *)&a3->var0 + v7);
  double v9 = (void *)objc_claimAutoreleasedReturnValue( -[HTPrefs prefNamed:domain:profile:matchingSelector:contextPrefixOut:]( self,  "prefNamed:domain:profile:matchingSelector:contextPrefixOut:",  a3->var0,  self->__htTaskingDomain,  self->__installedHTProfileDict,  "isEqualToString:",  a4));
  id v10 = v9;
  if (v9)
  {
    if ((a3->var4 & 4) != 0 && ![v9 length])
    {
      id v13 = shared_ht_log_handle();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        var0 = a3->var0;
        unint64_t var4 = a3->var4;
        int v17 = 138412802;
        unint64_t v18 = var0;
        __int16 v19 = 2048;
        unint64_t v20 = var4;
        __int16 v21 = 2112;
        v22 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "HTPrefs: %@ failed policy check (%lu) for value %@",  (uint8_t *)&v17,  0x20u);
      }
    }

    else
    {
      id v11 = v10;

      id v8 = v11;
    }
  }

  return v8;
}

- (id)objectProperty:(HTPrefInit *)a3 matchingSelector:(SEL)a4 contextPrefixOut:(id *)a5
{
  uint64_t v9 = 16LL;
  if (!self->_isInternal) {
    uint64_t v9 = 24LL;
  }
  id v10 = *(id *)((char *)&a3->var0 + v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[HTPrefs prefNamed:domain:profile:matchingSelector:contextPrefixOut:]( self,  "prefNamed:domain:profile:matchingSelector:contextPrefixOut:",  a3->var0,  self->__htTaskingDomain,  self->__installedHTProfileDict,  a4,  a5));
  uint64_t v12 = v11;
  if (v11)
  {
    id v13 = v11;

    id v10 = v13;
  }

  return v10;
}

- (void)initBoolProperty:(HTPrefInit *)a3
{
  int v5 = *(unsigned __int8 *)a3->var1;
  unsigned int v6 = -[HTPrefs BOOLProperty:contextPrefixOut:](self, "BOOLProperty:contextPrefixOut:");
  if (v5 != v6)
  {
    unsigned int v7 = v6;
    id v8 = shared_ht_log_handle();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      var0 = a3->var0;
      int v11 = 138412802;
      uint64_t v12 = var0;
      __int16 v13 = 1024;
      int v14 = v5;
      __int16 v15 = 1024;
      unsigned int v16 = v7;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "HTPrefs: %@: %{BOOL}d -> %{BOOL}d",  (uint8_t *)&v11,  0x18u);
    }

    *(_BYTE *)a3->var1 = v7;
    -[HTPrefs setShouldPostHTPrefsChangedNotification:](self, "setShouldPostHTPrefsChangedNotification:", 1LL);
  }

- (void)initIntProperty:(HTPrefInit *)a3
{
  int v5 = *(_DWORD *)a3->var1;
  unsigned int v6 = -[HTPrefs intProperty:contextPrefixOut:](self, "intProperty:contextPrefixOut:");
  if (v5 != v6)
  {
    unsigned int v7 = v6;
    id v8 = shared_ht_log_handle();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      var0 = a3->var0;
      int v11 = 138412802;
      uint64_t v12 = var0;
      __int16 v13 = 1024;
      int v14 = v5;
      __int16 v15 = 1024;
      unsigned int v16 = v7;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "HTPrefs: %@: %d -> %d",  (uint8_t *)&v11,  0x18u);
    }

    *(_DWORD *)a3->var1 = v7;
    -[HTPrefs setShouldPostHTPrefsChangedNotification:](self, "setShouldPostHTPrefsChangedNotification:", 1LL);
  }

- (void)initUnsignedIntProperty:(HTPrefInit *)a3
{
  int v5 = *(_DWORD *)a3->var1;
  unsigned int v6 = -[HTPrefs unsignedIntProperty:contextPrefixOut:](self, "unsignedIntProperty:contextPrefixOut:");
  if (v5 != v6)
  {
    unsigned int v7 = v6;
    id v8 = shared_ht_log_handle();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      var0 = a3->var0;
      int v11 = 138412802;
      uint64_t v12 = var0;
      __int16 v13 = 1024;
      int v14 = v5;
      __int16 v15 = 1024;
      unsigned int v16 = v7;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "HTPrefs: %@: %u -> %u",  (uint8_t *)&v11,  0x18u);
    }

    *(_DWORD *)a3->var1 = v7;
    -[HTPrefs setShouldPostHTPrefsChangedNotification:](self, "setShouldPostHTPrefsChangedNotification:", 1LL);
  }

- (void)initUnsignedLongProperty:(HTPrefInit *)a3
{
  uint64_t v5 = *(void *)a3->var1;
  unint64_t v6 = -[HTPrefs unsignedLongProperty:contextPrefixOut:](self, "unsignedLongProperty:contextPrefixOut:");
  if (v5 != v6)
  {
    unint64_t v7 = v6;
    id v8 = shared_ht_log_handle();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      var0 = a3->var0;
      int v11 = 138412802;
      uint64_t v12 = var0;
      __int16 v13 = 2048;
      uint64_t v14 = v5;
      __int16 v15 = 2048;
      unint64_t v16 = v7;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "HTPrefs: %@: %lu -> %lu",  (uint8_t *)&v11,  0x20u);
    }

    *(void *)a3->var1 = v7;
    -[HTPrefs setShouldPostHTPrefsChangedNotification:](self, "setShouldPostHTPrefsChangedNotification:", 1LL);
  }

- (void)initUnsignedLongLongProperty:(HTPrefInit *)a3
{
  uint64_t v5 = *(void *)a3->var1;
  unint64_t v6 = -[HTPrefs unsignedLongProperty:contextPrefixOut:](self, "unsignedLongProperty:contextPrefixOut:");
  if (v5 != v6)
  {
    unint64_t v7 = v6;
    id v8 = shared_ht_log_handle();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      var0 = a3->var0;
      int v11 = 138412802;
      uint64_t v12 = var0;
      __int16 v13 = 2048;
      uint64_t v14 = v5;
      __int16 v15 = 2048;
      unint64_t v16 = v7;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "HTPrefs: %@: %llu -> %llu",  (uint8_t *)&v11,  0x20u);
    }

    *(void *)a3->var1 = v7;
    -[HTPrefs setShouldPostHTPrefsChangedNotification:](self, "setShouldPostHTPrefsChangedNotification:", 1LL);
  }

- (void)initDoubleProperty:(HTPrefInit *)a3
{
  double v5 = *(double *)a3->var1;
  -[HTPrefs doubleProperty:contextPrefixOut:](self, "doubleProperty:contextPrefixOut:");
  if (v5 != v6)
  {
    double v7 = v6;
    id v8 = shared_ht_log_handle();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      var0 = a3->var0;
      int v11 = 138412802;
      uint64_t v12 = var0;
      __int16 v13 = 2048;
      double v14 = v5;
      __int16 v15 = 2048;
      double v16 = v7;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "HTPrefs: %@: %f -> %f",  (uint8_t *)&v11,  0x20u);
    }

    *(double *)a3->var1 = v7;
    -[HTPrefs setShouldPostHTPrefsChangedNotification:](self, "setShouldPostHTPrefsChangedNotification:", 1LL);
  }

- (void)initNSStringProperty:(HTPrefInit *)a3
{
  id v5 = *(id *)a3->var1;
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[HTPrefs stringProperty:contextPrefixOut:](self, "stringProperty:contextPrefixOut:", a3, 0LL));
  if (([v6 isEqualToString:v5] & 1) == 0)
  {
    id v7 = shared_ht_log_handle();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      var0 = a3->var0;
      int v13 = 138412802;
      double v14 = var0;
      __int16 v15 = 2112;
      id v16 = v5;
      __int16 v17 = 2112;
      unint64_t v18 = v6;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "HTPrefs: %@: %@ -> %@",  (uint8_t *)&v13,  0x20u);
    }

    uint64_t v9 = objc_claimAutoreleasedReturnValue(-[HTPrefs stringProperty:contextPrefixOut:](self, "stringProperty:contextPrefixOut:", a3, 0LL));
    var1 = (void **)a3->var1;
    int v11 = *var1;
    *var1 = (void *)v9;

    -[HTPrefs setShouldPostHTPrefsChangedNotification:](self, "setShouldPostHTPrefsChangedNotification:", 1LL);
  }
}

- (void)initNSObjectProperty:(HTPrefInit *)a3
{
  id v5 = *(id *)a3->var1;
  uint64_t v6 = objc_claimAutoreleasedReturnValue( -[HTPrefs objectProperty:matchingSelector:contextPrefixOut:]( self,  "objectProperty:matchingSelector:contextPrefixOut:",  a3,  "isEqual:",  0LL));
  id v7 = (void *)v6;
  if ((v5 == 0LL) == (v6 != 0)
    || (v5 ? (BOOL v8 = v6 == 0) : (BOOL v8 = 1), !v8 && ([v5 isEqual:v6] & 1) == 0))
  {
    id v9 = shared_ht_log_handle();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      var0 = a3->var0;
      int v15 = 138412802;
      id v16 = var0;
      __int16 v17 = 2112;
      id v18 = v5;
      __int16 v19 = 2112;
      unint64_t v20 = v7;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "HTPrefs: %@: %@ -> %@",  (uint8_t *)&v15,  0x20u);
    }

    uint64_t v11 = objc_claimAutoreleasedReturnValue( -[HTPrefs objectProperty:matchingSelector:contextPrefixOut:]( self,  "objectProperty:matchingSelector:contextPrefixOut:",  a3,  "isEqual:",  0LL));
    var1 = (void **)a3->var1;
    int v13 = *var1;
    *var1 = (void *)v11;

    -[HTPrefs setShouldPostHTPrefsChangedNotification:](self, "setShouldPostHTPrefsChangedNotification:", 1LL);
  }
}

- (void)initPropertyMemoryLoggingIntervalSec:(HTPrefInit *)a3
{
  unsigned int memoryLoggingIntervalSec = self->_memoryLoggingIntervalSec;
  uint64_t v6 = -[HTPrefs unsignedIntProperty:contextPrefixOut:](self, "unsignedIntProperty:contextPrefixOut:", a3, 0LL);
  if (memoryLoggingIntervalSec != (_DWORD)v6)
  {
    uint64_t v7 = v6;
    id v8 = shared_ht_log_handle();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      var0 = a3->var0;
      int v11 = 138412802;
      uint64_t v12 = var0;
      __int16 v13 = 1024;
      unsigned int v14 = memoryLoggingIntervalSec;
      __int16 v15 = 1024;
      int v16 = v7;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "HTPrefs: %@: %u -> %u",  (uint8_t *)&v11,  0x18u);
    }

    -[HTPrefs setMemoryLoggingIntervalSec:](self, "setMemoryLoggingIntervalSec:", v7);
    -[HTPrefs setShouldPostHTPrefsChangedNotification:](self, "setShouldPostHTPrefsChangedNotification:", 1LL);
  }

- (void)initPropertyHangtracerDaemonEnabled:(HTPrefInit *)a3
{
  int hangtracerDaemonEnabled = self->_hangtracerDaemonEnabled;
  id v15 = 0LL;
  unsigned int v6 = -[HTPrefs BOOLProperty:contextPrefixOut:](self, "BOOLProperty:contextPrefixOut:", a3, &v15);
  id v7 = v15;
  id v8 = v15;
  id v9 = self->_enablementPrefix;
  if (!-[NSString isEqualToString:](v9, "isEqualToString:", v8))
  {
    objc_storeStrong((id *)&self->_enablementPrefix, v7);
    id v10 = shared_ht_log_handle();
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_10000C100((uint64_t)v9, &self->_enablementPrefix, v11);
    }
  }

  if (hangtracerDaemonEnabled != v6)
  {
    self->_int hangtracerDaemonEnabled = v6;
    id v12 = shared_ht_log_handle();
    __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      var0 = a3->var0;
      *(_DWORD *)buf = 138412802;
      __int16 v17 = var0;
      __int16 v18 = 1024;
      int v19 = hangtracerDaemonEnabled;
      __int16 v20 = 1024;
      unsigned int v21 = v6;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "HTPrefs: %@: %{BOOL}d -> %{BOOL}d",  buf,  0x18u);
    }

    -[HTPrefs setShouldPostHTPrefsChangedNotification:](self, "setShouldPostHTPrefsChangedNotification:", 1LL);
  }
}

- (void)initPropertyIsInternal:(HTPrefInit *)a3
{
  int isInternalNoOverride = self->__isInternalNoOverride;
  int v5 = MGGetBoolAnswer(@"InternalBuild", a2, a3);
  if (isInternalNoOverride != v5)
  {
    BOOL v6 = v5;
    id v7 = shared_ht_log_handle();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_10000C218();
    }

    self->__int isInternalNoOverride = v6;
    -[HTPrefs setShouldPostHTPrefsChangedNotification:](self, "setShouldPostHTPrefsChangedNotification:", 1LL);
  }

  BOOL v9 = !self->_customerModeEnabled && self->__isInternalNoOverride;
  if (self->_isInternal != v9)
  {
    id v10 = shared_ht_log_handle();
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_10000C184();
    }

    self->_isInternal = v9;
    -[HTPrefs setShouldPostHTPrefsChangedNotification:](self, "setShouldPostHTPrefsChangedNotification:", 1LL);
  }

- (void)initPropertyShouldSaveAndCompressTailspins:(HTPrefInit *)a3
{
  int shouldSaveTailspins = self->_shouldSaveTailspins;
  int shouldCompressSavedTailspins = self->_shouldCompressSavedTailspins;
  tailspinSaveFormat = self->_tailspinSaveFormat;
  if (!tailspinSaveFormat)
  {
    unsigned int v8 = 0;
    BOOL keepTailspinsLegacy = self->_keepTailspinsLegacy;
    goto LABEL_11;
  }

  BOOL isInternal = self->_isInternal;
  if (-[NSString isEqualToString:](tailspinSaveFormat, "isEqualToString:", @"compressed"))
  {
    unsigned int v8 = 1;
LABEL_7:
    BOOL keepTailspinsLegacy = 1;
    goto LABEL_11;
  }

  if (-[NSString isEqualToString:](self->_tailspinSaveFormat, "isEqualToString:", @"uncompressed"))
  {
    unsigned int v8 = 0;
    goto LABEL_7;
  }

  unsigned int v8 = !-[NSString isEqualToString:](self->_tailspinSaveFormat, "isEqualToString:", @"none");
  if (!isInternal) {
    unsigned int v8 = 0;
  }
  BOOL keepTailspinsLegacy = v8;
LABEL_11:
  unint64_t savedTailspinMaxMB = self->_savedTailspinMaxMB;
  if (savedTailspinMaxMB) {
    unsigned int v11 = v8;
  }
  else {
    unsigned int v11 = 0;
  }
  if (savedTailspinMaxMB) {
    int v12 = keepTailspinsLegacy;
  }
  else {
    int v12 = 0;
  }
  if (shouldSaveTailspins != v12)
  {
    id v13 = shared_ht_log_handle();
    unsigned int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_10000C340();
    }

    self->_int shouldSaveTailspins = v12;
    -[HTPrefs setShouldPostHTPrefsChangedNotification:](self, "setShouldPostHTPrefsChangedNotification:", 1LL);
  }

  if (shouldCompressSavedTailspins != v11)
  {
    id v15 = shared_ht_log_handle();
    int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_10000C2AC();
    }

    self->_int shouldCompressSavedTailspins = v11;
    -[HTPrefs setShouldPostHTPrefsChangedNotification:](self, "setShouldPostHTPrefsChangedNotification:", 1LL);
  }

- (void)initPropertyReportPeriod:(HTPrefInit *)a3
{
  double reportPeriodMATU = (double)self->_reportPeriodMATU;
  -[HTPrefs doubleProperty:contextPrefixOut:](self, "doubleProperty:contextPrefixOut:", a3, 0LL);
  double v7 = v6 * 1000.0 / timebaseConversionFactor();
  if (v7 != reportPeriodMATU)
  {
    id v8 = shared_ht_log_handle();
    BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      var0 = a3->var0;
      int v11 = 138412802;
      int v12 = var0;
      __int16 v13 = 2048;
      double v14 = reportPeriodMATU;
      __int16 v15 = 2048;
      double v16 = v7;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "HTPrefs: %@: %f -> %f",  (uint8_t *)&v11,  0x20u);
    }

    self->_double reportPeriodMATU = (unint64_t)v7;
    -[HTPrefs setShouldPostHTPrefsChangedNotification:](self, "setShouldPostHTPrefsChangedNotification:", 1LL);
  }

- (void)initPropertyHaveInternalSettings:(HTPrefInit *)a3
{
  int v5 = (void *)CFPreferencesCopyValue( @"HangTracerInternalSettingCreated",  self->__htTaskingDomain,  @"mobile",  kCFPreferencesAnyHost);
  int hasInternalSettings = self->_hasInternalSettings;
  int v7 = v5 != 0LL;
  if (hasInternalSettings != v7)
  {
    id v8 = shared_ht_log_handle();
    BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      var0 = a3->var0;
      int v11 = 138412802;
      int v12 = var0;
      __int16 v13 = 1024;
      int v14 = hasInternalSettings;
      __int16 v15 = 1024;
      BOOL v16 = v5 != 0LL;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "HTPrefs: %@: %{BOOL}d -> %{BOOL}d",  (uint8_t *)&v11,  0x18u);
    }

    self->_int hasInternalSettings = v7;
    -[HTPrefs setShouldPostHTPrefsChangedNotification:](self, "setShouldPostHTPrefsChangedNotification:", 1LL);
  }
}

- (void)initPropertyThirdPartyDevPreferredLanguages:(HTPrefInit *)a3
{
  int v5 = self->_thirdPartyDevPreferredLanguages;
  CFPropertyListRef v6 = CFPreferencesCopyValue( @"AppleLanguages",  kCFPreferencesAnyApplication,  @"mobile",  kCFPreferencesAnyHost);
  int v7 = (void *)v6;
  if (v6 && (objc_opt_respondsToSelector(v6, "isEqualToArray:") & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](&OBJC_CLASS___NSLocale, "preferredLanguages"));
  }
  BOOL v9 = v8;
  if (!-[NSArray isEqualToArray:](v5, "isEqualToArray:", v8))
  {
    id v10 = shared_ht_log_handle();
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      var0 = a3->var0;
      int v13 = 138412802;
      int v14 = var0;
      __int16 v15 = 2112;
      BOOL v16 = v5;
      __int16 v17 = 2112;
      __int16 v18 = v9;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "HTPrefs: %@: %@ -> %@",  (uint8_t *)&v13,  0x20u);
    }

    objc_storeStrong((id *)&self->_thirdPartyDevPreferredLanguages, v9);
    -[HTPrefs setShouldPostHTPrefsChangedNotification:](self, "setShouldPostHTPrefsChangedNotification:", 1LL);
  }
}

+ (id)sharedPrefs
{
  if (qword_10001A1C0 != -1) {
    dispatch_once(&qword_10001A1C0, &stru_100014620);
  }
  return (id)qword_10001A1B8;
}

- (void)dealloc
{
  prefInitList = self->_prefInitList;
  if (prefInitList) {
    free(prefInitList);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___HTPrefs;
  -[HTPrefs dealloc](&v4, "dealloc");
}

- (HTPrefInit)prefInitList
{
  result = self->_prefInitList;
  if (!result)
  {
    id v4 = shared_ht_log_handle();
    int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_10000C3D4(v5);
    }

    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
    [v17 timeIntervalSinceReferenceDate];
    HTPrefDefaultVal v7 = v6;
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
    [v16 timeIntervalSinceReferenceDate];
    HTPrefDefaultVal v9 = v8;
    __int128 v80 = 0uLL;
    HIBYTE(v80) = 0;

    result = (HTPrefInit *)malloc(0xD50uLL);
    result[52].var0 = @"PDSEPrefCATailspinKillSwitch";
    result[52].var1 = &self->_pdseCATailspinKillSwitch;
    result[53].var0 = @"PDSEPrefAppLaunchKillSwitch";
    result[53].var1 = &self->_pdseAppLaunchKillSwitch;
    result[54].var0 = @"PDSEPrefWorkflowResponsivenessKillSwitch";
    result->var0 = @"HangTracerEnableTailspin";
    result->var1 = &self->_htTailspinEnabled;
    result[51].var1 = &self->_pdseSentryKillSwitch;
    result[54].var1 = &self->_pdseWorkflowResponsivenessKillSwitch;
    result[55].var0 = @"PDSEPrefHTRateOnlyPeriodDays";
    result[55].var1 = &self->_pdseHTRateOnlyPeriodDays;
    result[1].var0 = @"HangTracerEnableHUD";
    result[1].var1 = &self->_hudEnabled;
    result[56].var0 = @"PDSEPrefHTThirdPartyPeriodDays";
    result[56].var1 = &self->_pdseHTThirdPartyPeriodDays;
    result[57].var0 = @"PDSEPrefHTThirdPartyNoLogUploadPeriodDays";
    result[57].var1 = &self->_pdseHTThirdPartyNoLogUploadPeriodDays;
    result[2].var0 = @"HangTracerCollectOSSignposts";
    result[2].var1 = &self->_shouldCollectOSSignposts;
    result[58].var0 = @"PDSEPrefSentryPeriodDays";
    result[58].var1 = &self->_pdseSentryPeriodDays;
    result[59].var0 = @"PDSEPrefCATailspinPeriodDays";
    result[59].var1 = &self->_pdseCATailspinPeriodDays;
    result[3].var0 = @"HangTracerCollectOSSignpostsDeferred";
    result[3].var1 = &self->_shouldCollectOSSignpostsDeferred;
    result[60].var0 = @"PDSEPrefAppLaunchPeriodDays";
    result[60].var1 = &self->_pdseAppLaunchPeriodDays;
    result[61].var0 = @"PDSEPrefWorkflowResponsivenessPeriodDays";
    result[61].var1 = &self->_pdseWorkflowResponsivenessPeriodDays;
    result[4].var0 = @"HangTracerSavedTailspinsMaxMB";
    result[4].var1 = &self->_savedTailspinMaxMB;
    result[5].var0 = @"HangTracerKeepTailspins";
    result[5].var1 = &self->_keepTailspinsLegacy;
    result[62].var0 = @"HangTracerShouldUploadToDiagPipe";
    result[62].var1 = &self->_shouldUploadToDiagPipe;
    result[63].var0 = @"PDSEPrefHangTracerKillSwitch";
    result[63].var1 = &self->_pdseHangTracerKillSwitch;
    result[64].var0 = @"HTSEEnablementPeriodDays";
    result[64].var1 = &self->_pdseHTPeriodDays;
    result[65].var0 = @"PDSEPrefAllowEnableTailspin";
    result[65].var1 = &self->_pdseAllowEnableTailspin;
    result[6].var0 = @"HangTracerKeepTailspinsWithFormat";
    result[6].var1 = &self->_tailspinSaveFormat;
    result[6].var2.var3 = (unint64_t)@"compressed";
    result[6].var3.var3 = (unint64_t)@"none";
    result[66].var0 = @"HangTracerTelemetryHaveNonDefaultFeatureFlags";
    result[66].var1 = &self->_haveNonDefaultFeatureFlags;
    result[67].var0 = @"HangTracerTelemetrySerialLoggingEnabled";
    result[67].var1 = &self->_haveSerialLoggingEnabled;
    result[68].var0 = @"HangTracerTelemetryNumOSCryptexFileExtents";
    result[68].var1 = &self->_numOSCryptexFileExtents;
    result[69].var0 = @"HangTracerTelemetryHaveRootsInstalled";
    result[69].var1 = &self->_haveRootsInstalled;
    result[8].var0 = @"HangTracerIncludeDiskInfo";
    result[8].var1 = &self->_shouldIncludeDiskInfo;
    self->_prefInitList = result;
    result[6].var5 = "initNSStringProperty:";
    result[7].var1 = &self->_shouldSaveTailspins;
    result[7].var5 = "initPropertyShouldSaveAndCompressTailspins:";
    result[9].var0 = @"HangTracerEnableDisplayData";
    result[9].var1 = &self->_shouldIncludeDisplayData;
    *(_DWORD *)(&result[5].var2.var0 + 1) = *(_DWORD *)v79;
    *(_DWORD *)(&result[5].var3.var0 + 1) = *(_DWORD *)v78;
    HIDWORD(result[7].var2.var3) = *(_DWORD *)&v77[3];
    *(_DWORD *)(&result[7].var2.var0 + 1) = *(_DWORD *)v77;
    HIDWORD(result[7].var3.var3) = *(_DWORD *)&v76[3];
    *(_DWORD *)(&result[7].var3.var0 + 1) = *(_DWORD *)v76;
    *(_DWORD *)(&result[8].var2.var0 + 1) = *(_DWORD *)v75;
    HIDWORD(result[8].var3.var3) = *(_DWORD *)&v74[3];
    *(_DWORD *)(&result[8].var3.var0 + 1) = *(_DWORD *)v74;
    HIDWORD(result[9].var2.var3) = *(_DWORD *)&v73[3];
    *(_DWORD *)(&result[9].var2.var0 + 1) = *(_DWORD *)v73;
    HIDWORD(result[9].var3.var3) = *(_DWORD *)&v72[3];
    *(_DWORD *)(&result[9].var3.var0 + 1) = *(_DWORD *)v72;
    HIDWORD(result[10].var2.var3) = *(_DWORD *)&v71[3];
    *(_DWORD *)(&result[10].var2.var0 + 1) = *(_DWORD *)v71;
    HIDWORD(result[10].var3.var3) = *(_DWORD *)&v70[3];
    *(_DWORD *)(&result[10].var3.var0 + 1) = *(_DWORD *)v70;
    HIDWORD(result[11].var2.var3) = *(_DWORD *)&v69[3];
    *(_DWORD *)(&result[11].var2.var0 + 1) = *(_DWORD *)v69;
    HIDWORD(result[11].var3.var3) = *(_DWORD *)&v68[3];
    *(_DWORD *)(&result[11].var3.var0 + 1) = *(_DWORD *)v68;
    *(_DWORD *)(&result[24].var2.var0 + 1) = *(_DWORD *)v67;
    *(_DWORD *)(&result[24].var3.var0 + 1) = *(_DWORD *)v66;
    *(_DWORD *)(&result[27].var2.var0 + 1) = *(_DWORD *)v65;
    *(_DWORD *)(&result[27].var3.var0 + 1) = *(_DWORD *)v64;
    HIDWORD(result[29].var2.var3) = *(_DWORD *)&v63[3];
    *(_DWORD *)(&result[29].var2.var0 + 1) = *(_DWORD *)v63;
    HIDWORD(result[29].var3.var3) = *(_DWORD *)&v62[3];
    *(_DWORD *)(&result[29].var3.var0 + 1) = *(_DWORD *)v62;
    *(_DWORD *)(&result[32].var2.var0 + 1) = *(_DWORD *)v61;
    *(_DWORD *)(&result[32].var3.var0 + 1) = *(_DWORD *)v60;
    HIDWORD(result[33].var2.var3) = *(_DWORD *)&v59[3];
    *(_DWORD *)(&result[33].var2.var0 + 1) = *(_DWORD *)v59;
    HIDWORD(result[33].var3.var3) = *(_DWORD *)&v58[3];
    *(_DWORD *)(&result[33].var3.var0 + 1) = *(_DWORD *)v58;
    *(_DWORD *)(&result[36].var2.var0 + 1) = *(_DWORD *)v57;
    *(_DWORD *)(&result[36].var3.var0 + 1) = *(_DWORD *)v56;
    HIDWORD(result[38].var2.var3) = *(_DWORD *)&v55[3];
    *(_DWORD *)(&result[38].var2.var0 + 1) = *(_DWORD *)v55;
    HIDWORD(result[38].var3.var3) = *(_DWORD *)&v54[3];
    *(_DWORD *)(&result[38].var3.var0 + 1) = *(_DWORD *)v54;
    *(_DWORD *)(&result[39].var2.var0 + 1) = *(_DWORD *)v53;
    HIDWORD(result[39].var3.var3) = *(_DWORD *)&v52[3];
    *(_DWORD *)(&result[39].var3.var0 + 1) = *(_DWORD *)v52;
    result[4].var2.var1 = 50;
    result[4].var3.var1 = 20;
    HIDWORD(result[5].var2.var3) = *(_DWORD *)&v79[3];
    HIDWORD(result[5].var3.var3) = *(_DWORD *)&v78[3];
    HIDWORD(result[8].var2.var3) = *(_DWORD *)&v75[3];
    result[10].var0 = @"HangTracerIncludeNetworkState";
    result[10].var1 = &self->_shouldIncludeNetworkState;
    result[11].var0 = @"HangTracerThirdPartyRunloopLogsEnabled";
    result[11].var1 = &self->_thirdPartyRunLoopHangLogsEnabled;
    result[12].var0 = @"HangTracerSamplingPercentForMicroHangs";
    result[12].var1 = &self->_samplingPercentForMicroHangs;
    result[13].var0 = @"HangTracerPercentFullSpinReports";
    result[13].var1 = &self->_runloopHangPercentHeavyLogs;
    result[14].var0 = @"HangTracerDailyMicroHangLogLimit";
    result[14].var1 = &self->_runLoopMicroHangDailyLogLimit;
    result[15].var0 = @"HangTracerDailyLogLimit";
    result[15].var1 = &self->_runLoopHangDailyLogLimit;
    result[16].var0 = @"HangTracerPerPeriodLogLimit";
    result[16].var1 = &self->_runLoopHangPerPeriodLogLimit;
    result[17].var0 = @"HangTracerDailyLongLogLimit";
    result[17].var1 = &self->_runLoopLongHangDailyLogLimit;
    result[18].var0 = @"HangTracerDailyThirdPartyLogLimit";
    result[18].var1 = &self->_runloopHangThirdPartyDailyLogLimit;
    result[14].var2.var1 = 10;
    result[14].var3.var1 = 10;
    result[18].var2.var1 = 10;
    result[18].var3.var1 = 10;
    result[19].var0 = @"HangTracerFenceHangLogLimit";
    result[19].var1 = &self->_fenceHangDailyLogLimit;
    result[20].var0 = @"HangTracerHangTimeoutDuration";
    result[20].var1 = &self->_runloopHangTimeoutDurationMSec;
    result[21].var0 = @"HangTracerDuration";
    result[21].var1 = &self->_runloopHangDurationThresholdMSec;
    result[22].var0 = @"HangTracerLongHangDurationThreshold";
    result[22].var1 = &self->_runloopLongHangDurationThresholdMSec;
    result[23].var0 = @"HangTracerThirdPartyHangThreshold";
    result[23].var1 = &self->_runloopHangThirdPartyDurationThresholdMSec;
    result[24].var0 = @"HangTracerFenceTrackingEnabled";
    result[24].var1 = &self->_fenceTrackingEnabled;
    HIDWORD(result[24].var2.var3) = *(_DWORD *)&v67[3];
    HIDWORD(result[24].var3.var3) = *(_DWORD *)&v66[3];
    result[25].var0 = @"HangTracerSlowActPerAppMax";
    result[25].var1 = &self->_slowAppActivationPerAppMaxLogLimit;
    result[26].var0 = @"HangTracerSlowActDailyLogLimit";
    result[26].var1 = &self->_slowAppActivationDailyLogLimit;
    result[27].var0 = @"HangTracerSlowActTailspinsEnabled";
    result[27].var1 = &self->_slowAppActivationTailspinEnabled;
    HIDWORD(result[27].var2.var3) = *(_DWORD *)&v65[3];
    HIDWORD(result[27].var3.var3) = *(_DWORD *)&v64[3];
    result[28].var0 = @"HangTracerSlowActLaunchTailspinThreshold";
    result[28].var1 = &self->_slowAppActivationThresholdMSec;
    int64x2_t v10 = vdupq_n_s64(0x1388uLL);
    result[29].var0 = @"HangTracerEnableSignpostMonitoring";
    result[29].var1 = &self->_signpostMonitoringEnabled;
    result[30].var0 = @"HangTracerSignpostMonitoringDailyLogLimit";
    result[30].var1 = &self->_signpostMonitoringDailyLogLimit;
    result[31].var0 = @"HangTracerSignpostMonitoringPerPeriodLogLimit";
    result[31].var1 = &self->_signpostMonitoringPerPeriodLogLimit;
    result[32].var0 = @"HangTracerEnableAppLaunchMonitoring";
    result[32].var1 = &self->_appLaunchMonitoringEnabled;
    HIDWORD(result[32].var2.var3) = *(_DWORD *)&v61[3];
    HIDWORD(result[32].var3.var3) = *(_DWORD *)&v60[3];
    result[33].var0 = @"HangTracerEnableWorkflowResponsiveness";
    result[33].var1 = &self->_workflowResponsivenessEnabled;
    result[34].var0 = @"HangTracerWorkflowResponsivenessDailyLogLimit";
    result[34].var1 = &self->_workflowResponsivenessDailyLogLimit;
    result[15].var2.var1 = 25;
    result[15].var3.var1 = 25;
    result[17].var2.var1 = 25;
    result[17].var3.var1 = 25;
    result[19].var2.var1 = 25;
    result[19].var3.var1 = 25;
    result[25].var2.var1 = 25;
    result[25].var3.var1 = 25;
    result[26].var2.var1 = 25;
    result[26].var3.var1 = 25;
    result[30].var2.var1 = 25;
    result[30].var3.var1 = 25;
    result[34].var2.var1 = 25;
    result[34].var3.var1 = 25;
    result[35].var0 = @"HangTracerWorkflowResponsivenessPerPeriodLogLimit";
    result[35].var1 = &self->_workflowResponsivenessPerPeriodLogLimit;
    result[16].var2.var1 = 4;
    result[16].var3.var1 = 4;
    result[31].var2.var1 = 4;
    result[31].var3.var1 = 4;
    result[35].var2.var1 = 4;
    result[35].var3.var1 = 4;
    result[36].var0 = @"HangTracerEnableMemoryLogging";
    result[36].var1 = &self->_memoryLoggingEnabled;
    HIDWORD(result[36].var2.var3) = *(_DWORD *)&v57[3];
    HIDWORD(result[36].var3.var3) = *(_DWORD *)&v56[3];
    result[37].var0 = @"HangTracerMemoryLoggingInterval";
    result[37].var1 = &self->_memoryLoggingIntervalSec;
    result[37].var2.var1 = 3600;
    result[37].var3.var1 = 3600;
    result[37].var5 = "initPropertyMemoryLoggingIntervalSec:";
    result[38].var0 = @"EPLEnabledProfile";
    result[38].var1 = &self->_eplEnabledProfile;
    result[39].var0 = @"EPLEnabled";
    result[39].var1 = &self->_eplEnabled;
    HIDWORD(result[39].var2.var3) = *(_DWORD *)&v53[3];
    result[40].var0 = @"EPLTimeoutTimestampSec";
    result[40].var1 = &self->_eplTimeoutTimestampSec;
    result[6].unint64_t var4 = 0LL;
    result[7].var0 = 0LL;
    result[7].unint64_t var4 = 0LL;
    __asm { FMOV            V4.2D, #2.0 }

    *(_OWORD *)&result[12].var2.var0 = _Q4;
    *(_OWORD *)&result[13].var2.var0 = xmmword_10000E0C0;
    result[12].var5 = "initDoubleProperty:";
    result[13].var5 = "initDoubleProperty:";
    *(int64x2_t *)&result[20].var2.var0 = vdupq_n_s64(0x2328uLL);
    result[40].var5 = "initDoubleProperty:";
    *(int64x2_t *)&result[21].var2.var0 = vdupq_n_s64(0x1F4uLL);
    *(int64x2_t *)&result[22].var2.var0 = vdupq_n_s64(0x7D0uLL);
    result[41].var0 = @"HangTracerReportPeriod";
    *(int64x2_t *)&result[23].var2.var0 = vdupq_n_s64(0x3E8uLL);
    result[40].var2 = v7;
    result[41].var1 = &self->_reportPeriodMATU;
    result[41].unint64_t var4 = 2LL;
    result->var2.var0 = 1;
    result->var3.var0 = 0;
    result->unint64_t var4 = 0LL;
    result->var5 = "initBoolProperty:";
    result[1].var2.var0 = 0;
    result[1].var3.var0 = 0;
    result[1].unint64_t var4 = 0LL;
    result[1].var5 = "initBoolProperty:";
    result[2].var2.var0 = 0;
    result[2].var3.var0 = 0;
    result[2].unint64_t var4 = 0LL;
    result[2].var5 = "initBoolProperty:";
    result[3].var2.var0 = 1;
    result[3].var3.var0 = 0;
    result[3].unint64_t var4 = 0LL;
    result[3].var5 = "initBoolProperty:";
    result[4].unint64_t var4 = 0LL;
    result[4].var5 = "initUnsignedIntProperty:";
    result[5].var2.var0 = 0;
    result[5].var3.var0 = 0;
    result[5].unint64_t var4 = 0LL;
    result[5].var5 = "initBoolProperty:";
    result[7].var2.var0 = 0;
    result[7].var3.var0 = 0;
    result[8].var2.var0 = 0;
    result[8].var3.var0 = 0;
    result[8].unint64_t var4 = 0LL;
    result[8].var5 = "initBoolProperty:";
    result[9].var2.var0 = 1;
    result[9].var3.var0 = 1;
    result[9].unint64_t var4 = 0LL;
    result[9].var5 = "initBoolProperty:";
    result[10].var2.var0 = 0;
    result[10].var3.var0 = 0;
    result[10].unint64_t var4 = 0LL;
    result[10].var5 = "initBoolProperty:";
    result[11].var2.var0 = 1;
    result[11].var3.var0 = 1;
    result[11].unint64_t var4 = 0LL;
    result[11].var5 = "initBoolProperty:";
    result[12].unint64_t var4 = 0LL;
    result[13].unint64_t var4 = 0LL;
    result[14].unint64_t var4 = 0LL;
    result[14].var5 = "initIntProperty:";
    result[15].unint64_t var4 = 0LL;
    result[15].var5 = "initIntProperty:";
    result[16].unint64_t var4 = 0LL;
    result[16].var5 = "initIntProperty:";
    result[17].unint64_t var4 = 0LL;
    result[17].var5 = "initIntProperty:";
    result[18].unint64_t var4 = 0LL;
    result[18].var5 = "initIntProperty:";
    result[19].unint64_t var4 = 0LL;
    result[19].var5 = "initIntProperty:";
    result[20].unint64_t var4 = 1LL;
    result[20].var5 = "initUnsignedLongProperty:";
    result[21].unint64_t var4 = 1LL;
    result[21].var5 = "initUnsignedLongProperty:";
    result[22].unint64_t var4 = 1LL;
    result[22].var5 = "initUnsignedLongProperty:";
    result[23].unint64_t var4 = 1LL;
    result[23].var5 = "initUnsignedLongProperty:";
    result[24].var2.var0 = 1;
    result[24].var3.var0 = 1;
    result[24].unint64_t var4 = 0LL;
    result[24].var5 = "initBoolProperty:";
    result[25].unint64_t var4 = 0LL;
    result[25].var5 = "initIntProperty:";
    result[26].unint64_t var4 = 0LL;
    result[26].var5 = "initIntProperty:";
    result[27].var2.var0 = 0;
    result[27].var3.var0 = 0;
    result[27].unint64_t var4 = 0LL;
    result[27].var5 = "initBoolProperty:";
    *(int64x2_t *)&result[28].var2.var0 = v10;
    result[28].unint64_t var4 = 1LL;
    result[28].var5 = "initUnsignedLongProperty:";
    result[29].var2.var0 = 1;
    result[29].var3.var0 = 0;
    result[29].unint64_t var4 = 0LL;
    result[29].var5 = "initBoolProperty:";
    result[30].unint64_t var4 = 0LL;
    result[30].var5 = "initIntProperty:";
    result[31].unint64_t var4 = 0LL;
    result[31].var5 = "initIntProperty:";
    result[32].var2.var0 = 1;
    result[32].var3.var0 = 0;
    result[32].unint64_t var4 = 0LL;
    result[32].var5 = "initBoolProperty:";
    result[33].var2.var0 = 1;
    result[33].var3.var0 = 0;
    result[33].unint64_t var4 = 0LL;
    result[33].var5 = "initBoolProperty:";
    result[34].unint64_t var4 = 0LL;
    result[34].var5 = "initIntProperty:";
    result[35].unint64_t var4 = 0LL;
    result[35].var5 = "initIntProperty:";
    result[36].var2.var0 = 1;
    result[36].var3.var0 = 0;
    result[36].unint64_t var4 = 0LL;
    result[36].var5 = "initBoolProperty:";
    result[37].unint64_t var4 = 1LL;
    result[38].var2.var0 = 0;
    result[38].var3.var0 = 0;
    result[38].unint64_t var4 = 0LL;
    result[38].var5 = "initBoolProperty:";
    result[39].var2.var0 = 0;
    result[39].var3.var0 = 0;
    result[39].unint64_t var4 = 0LL;
    result[39].var5 = "initBoolProperty:";
    result[40].var3 = v9;
    result[40].unint64_t var4 = 0LL;
    *(int64x2_t *)&result[41].var2.var0 = vdupq_n_s64(0x40AC200000000000uLL);
    result[41].var5 = "initPropertyReportPeriod:";
    result[42].var0 = @"HangTracerInternalSettingCreated";
    result[42].var1 = &self->_hasInternalSettings;
    result[42].var2.var0 = 0;
    HIDWORD(result[42].var2.var3) = *(_DWORD *)&v51[3];
    *(_DWORD *)(&result[42].var2.var0 + 1) = *(_DWORD *)v51;
    result[42].var3.var0 = 0;
    HIDWORD(result[42].var3.var3) = *(_DWORD *)&v50[3];
    *(_DWORD *)(&result[42].var3.var0 + 1) = *(_DWORD *)v50;
    result[42].unint64_t var4 = 0LL;
    result[42].var5 = "initPropertyHaveInternalSettings:";
    result[43].var0 = @"HangTracerHUDThresholdMSec";
    result[43].var1 = &self->_hudThresholdMSec;
    result[43].var2.var1 = 500;
    result[43].var3.var1 = 500;
    result[43].unint64_t var4 = 1LL;
    result[43].var5 = "initUnsignedIntProperty:";
    result[44].var0 = @"HangTracerThirdPartyDevHangHUDEnabled";
    result[44].var1 = &self->_thirdPartyDevHangHUDEnabled;
    result[44].var2.var0 = 0;
    HIDWORD(result[44].var2.var3) = *(_DWORD *)&v49[3];
    *(_DWORD *)(&result[44].var2.var0 + 1) = *(_DWORD *)v49;
    result[44].var3.var0 = 0;
    HIDWORD(result[44].var3.var3) = *(_DWORD *)&v48[3];
    *(_DWORD *)(&result[44].var3.var0 + 1) = *(_DWORD *)v48;
    result[44].unint64_t var4 = 0LL;
    result[44].var5 = "initBoolProperty:";
    result[45].var0 = @"HangTracerThirdPartyIncludeNonDevelopmentApps";
    result[45].var1 = &self->_thirdPartyIncludeNonDevelopmentApps;
    result[45].var2.var0 = 0;
    HIDWORD(result[45].var2.var3) = *(_DWORD *)&v47[3];
    *(_DWORD *)(&result[45].var2.var0 + 1) = *(_DWORD *)v47;
    result[45].var3.var0 = 0;
    HIDWORD(result[45].var3.var3) = *(_DWORD *)&v46[3];
    *(_DWORD *)(&result[45].var3.var0 + 1) = *(_DWORD *)v46;
    result[45].unint64_t var4 = 0LL;
    result[45].var5 = "initBoolProperty:";
    result[46].var0 = @"HangTracerHangWaitTimeoutDuration";
    result[46].var1 = &self->_hangWaitTimeoutDurationMSec;
    *(int64x2_t *)&result[46].var2.var0 = v10;
    result[46].unint64_t var4 = 0LL;
    result[46].var5 = "initUnsignedLongProperty:";
    result[47].var0 = @"enableLoggingForPoster";
    result[47].var1 = &self->_enableLoggingForPoster;
    result[47].var2.var0 = 0;
    HIDWORD(result[47].var2.var3) = *(_DWORD *)&v45[3];
    *(_DWORD *)(&result[47].var2.var0 + 1) = *(_DWORD *)v45;
    result[47].var3.var0 = 0;
    HIDWORD(result[47].var3.var3) = *(_DWORD *)&v44[3];
    *(_DWORD *)(&result[47].var3.var0 + 1) = *(_DWORD *)v44;
    result[47].unint64_t var4 = 0LL;
    result[47].var5 = "initBoolProperty:";
    result[48].var0 = @"enableLoggingForWidgetRenderer";
    result[48].var1 = &self->_enableLoggingForWidgetRenderer;
    result[48].var2.var0 = 0;
    HIDWORD(result[48].var2.var3) = *(_DWORD *)&v43[3];
    *(_DWORD *)(&result[48].var2.var0 + 1) = *(_DWORD *)v43;
    result[48].var3.var0 = 0;
    HIDWORD(result[48].var3.var3) = *(_DWORD *)&v42[3];
    *(_DWORD *)(&result[48].var3.var0 + 1) = *(_DWORD *)v42;
    result[48].unint64_t var4 = 0LL;
    result[48].var5 = "initBoolProperty:";
    result[49].var0 = @"PDSEPrefHTRateOnlyKillSwitch";
    result[49].var1 = &self->_pdseHTRateOnlyKillSwitch;
    result[49].var2.var0 = 1;
    HIDWORD(result[49].var2.var3) = *(_DWORD *)&v41[3];
    *(_DWORD *)(&result[49].var2.var0 + 1) = *(_DWORD *)v41;
    result[49].var3.var0 = 1;
    HIDWORD(result[49].var3.var3) = *(_DWORD *)&v40[3];
    *(_DWORD *)(&result[49].var3.var0 + 1) = *(_DWORD *)v40;
    result[49].unint64_t var4 = 0LL;
    result[49].var5 = "initBoolProperty:";
    result[50].var0 = @"PDSEPrefHTThirdPartyKillSwitch";
    result[50].var1 = &self->_pdseHTThirdPartyKillSwitch;
    result[50].var2.var0 = 1;
    HIDWORD(result[50].var2.var3) = *(_DWORD *)&v39[3];
    *(_DWORD *)(&result[50].var2.var0 + 1) = *(_DWORD *)v39;
    result[50].var3.var0 = 1;
    HIDWORD(result[50].var3.var3) = *(_DWORD *)&v38[3];
    *(_DWORD *)(&result[50].var3.var0 + 1) = *(_DWORD *)v38;
    result[50].unint64_t var4 = 0LL;
    result[50].var5 = "initBoolProperty:";
    result[51].var0 = @"PDSEPrefSentryKillSwitch";
    result[51].var2.var0 = 1;
    HIDWORD(result[51].var2.var3) = *(_DWORD *)&v37[3];
    *(_DWORD *)(&result[51].var2.var0 + 1) = *(_DWORD *)v37;
    result[51].var3.var0 = 1;
    HIDWORD(result[51].var3.var3) = *(_DWORD *)&v36[3];
    *(_DWORD *)(&result[51].var3.var0 + 1) = *(_DWORD *)v36;
    result[51].unint64_t var4 = 0LL;
    result[51].var5 = "initBoolProperty:";
    result[52].var2.var0 = 1;
    HIDWORD(result[52].var2.var3) = *(_DWORD *)&v35[3];
    *(_DWORD *)(&result[52].var2.var0 + 1) = *(_DWORD *)v35;
    result[52].var3.var0 = 1;
    HIDWORD(result[52].var3.var3) = *(_DWORD *)&v34[3];
    *(_DWORD *)(&result[52].var3.var0 + 1) = *(_DWORD *)v34;
    result[52].unint64_t var4 = 0LL;
    result[52].var5 = "initBoolProperty:";
    result[53].var2.var0 = 1;
    HIDWORD(result[53].var2.var3) = *(_DWORD *)&v33[3];
    *(_DWORD *)(&result[53].var2.var0 + 1) = *(_DWORD *)v33;
    result[53].var3.var0 = 1;
    HIDWORD(result[53].var3.var3) = *(_DWORD *)&v32[3];
    *(_DWORD *)(&result[53].var3.var0 + 1) = *(_DWORD *)v32;
    result[53].unint64_t var4 = 0LL;
    result[53].var5 = "initBoolProperty:";
    result[54].var2.var0 = 1;
    HIDWORD(result[54].var2.var3) = *(_DWORD *)&v31[3];
    *(_DWORD *)(&result[54].var2.var0 + 1) = *(_DWORD *)v31;
    result[54].var3.var0 = 1;
    HIDWORD(result[54].var3.var3) = *(_DWORD *)&v30[3];
    *(_DWORD *)(&result[54].var3.var0 + 1) = *(_DWORD *)v30;
    result[54].unint64_t var4 = 0LL;
    result[54].var5 = "initBoolProperty:";
    result[55].var2.var1 = 0x7FFFFFFF;
    result[55].var3.var1 = 0x7FFFFFFF;
    result[55].unint64_t var4 = 0LL;
    result[55].var5 = "initIntProperty:";
    result[56].var2.var1 = 0x7FFFFFFF;
    result[56].var3.var1 = 0x7FFFFFFF;
    result[56].unint64_t var4 = 0LL;
    result[56].var5 = "initIntProperty:";
    result[57].var2.var1 = 0x7FFFFFFF;
    result[57].var3.var1 = 0x7FFFFFFF;
    result[57].unint64_t var4 = 0LL;
    result[57].var5 = "initIntProperty:";
    result[58].var2.var1 = 0x7FFFFFFF;
    result[58].var3.var1 = 0x7FFFFFFF;
    result[58].unint64_t var4 = 0LL;
    result[58].var5 = "initIntProperty:";
    result[59].var2.var1 = 0x7FFFFFFF;
    result[59].var3.var1 = 0x7FFFFFFF;
    result[59].unint64_t var4 = 0LL;
    result[59].var5 = "initIntProperty:";
    result[60].var2.var1 = 0x7FFFFFFF;
    result[60].var3.var1 = 0x7FFFFFFF;
    result[60].unint64_t var4 = 0LL;
    result[60].var5 = "initIntProperty:";
    result[61].var2.var1 = 0x7FFFFFFF;
    result[61].var3.var1 = 0x7FFFFFFF;
    result[61].unint64_t var4 = 0LL;
    result[61].var5 = "initIntProperty:";
    result[62].var2.var0 = 1;
    *(_DWORD *)(&result[62].var2.var0 + 1) = *(_DWORD *)v29;
    HIDWORD(result[62].var2.var3) = *(_DWORD *)&v29[3];
    result[62].var3.var0 = 1;
    *(_DWORD *)(&result[62].var3.var0 + 1) = *(_DWORD *)v28;
    HIDWORD(result[62].var3.var3) = *(_DWORD *)&v28[3];
    result[62].unint64_t var4 = 0LL;
    result[62].var5 = "initBoolProperty:";
    result[63].var2.var0 = 0;
    HIDWORD(result[63].var2.var3) = *(_DWORD *)&v27[3];
    *(_DWORD *)(&result[63].var2.var0 + 1) = *(_DWORD *)v27;
    result[63].var3.var0 = 0;
    HIDWORD(result[63].var3.var3) = *(_DWORD *)&v26[3];
    *(_DWORD *)(&result[63].var3.var0 + 1) = *(_DWORD *)v26;
    result[63].unint64_t var4 = 0LL;
    result[63].var5 = "initBoolProperty:";
    result[64].var2.var1 = 200;
    result[64].var3.var1 = 1000;
    result[64].unint64_t var4 = 0LL;
    result[64].var5 = "initIntProperty:";
    result[65].var2.var0 = 1;
    HIDWORD(result[65].var2.var3) = *(_DWORD *)&v25[3];
    *(_DWORD *)(&result[65].var2.var0 + 1) = *(_DWORD *)v25;
    result[65].var3.var0 = 1;
    HIDWORD(result[65].var3.var3) = *(_DWORD *)&v24[3];
    *(_DWORD *)(&result[65].var3.var0 + 1) = *(_DWORD *)v24;
    result[65].unint64_t var4 = 0LL;
    result[65].var5 = "initBoolProperty:";
    result[66].var2.var0 = 0;
    HIDWORD(result[66].var2.var3) = *(_DWORD *)&v23[3];
    *(_DWORD *)(&result[66].var2.var0 + 1) = *(_DWORD *)v23;
    result[66].var3.var0 = 0;
    HIDWORD(result[66].var3.var3) = *(_DWORD *)&v22[3];
    *(_DWORD *)(&result[66].var3.var0 + 1) = *(_DWORD *)v22;
    result[66].unint64_t var4 = 0LL;
    result[66].var5 = "initBoolProperty:";
    result[67].var2.var0 = 0;
    HIDWORD(result[67].var2.var3) = *(_DWORD *)&v21[3];
    *(_DWORD *)(&result[67].var2.var0 + 1) = *(_DWORD *)v21;
    result[67].var3.var0 = 0;
    HIDWORD(result[67].var3.var3) = *(_DWORD *)&v20[3];
    *(_DWORD *)(&result[67].var3.var0 + 1) = *(_DWORD *)v20;
    result[67].unint64_t var4 = 0LL;
    result[67].var5 = "initBoolProperty:";
    result[68].var2.var1 = 0;
    result[68].var3.var1 = 0;
    result[68].unint64_t var4 = 0LL;
    result[68].var5 = "initIntProperty:";
    result[69].var2.var0 = 0;
    HIDWORD(result[69].var2.var3) = *(_DWORD *)&v19[3];
    *(_DWORD *)(&result[69].var2.var0 + 1) = *(_DWORD *)v19;
    result[69].var3.var0 = 0;
    HIDWORD(result[69].var3.var3) = *(_DWORD *)&v18[3];
    *(_DWORD *)(&result[69].var3.var0 + 1) = *(_DWORD *)v18;
    result[69].unint64_t var4 = 0LL;
    result[69].var5 = "initBoolProperty:";
    *(_OWORD *)&result[70].var0 = 0uLL;
    result[70].var2.var0 = 0;
    HIDWORD(result[70].var2.var3) = 0;
    *(_DWORD *)(&result[70].var2.var0 + 1) = 0;
    result[70].var3.var0 = 0;
    result[70].var5 = 0LL;
    *(_OWORD *)(&result[70].var3.var0 + 1) = v80;
  }

  return result;
}

- (BOOL)shouldDisplayFenceHangToHUD
{
  return -[HTPrefs hudEnabled](self, "hudEnabled") && -[HTPrefs isInternal](self, "isInternal");
}

- (BOOL)shouldUpdateHangsHUD
{
  if (-[HTPrefs hudEnabled](self, "hudEnabled") && -[HTPrefs isInternal](self, "isInternal")) {
    return 1;
  }
  else {
    return -[HTPrefs thirdPartyDevHangHUDEnabled](self, "thirdPartyDevHangHUDEnabled");
  }
}

- (void)refreshHTPrefs
{
  id v3 = shared_ht_log_handle();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(v12[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "HTPrefs: Refreshing preferences",  (uint8_t *)v12,  2u);
  }

  int v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  self->__profilePath));
  installedHTProfileDict = self->__installedHTProfileDict;
  self->__installedHTProfileDict = v5;

  CFPreferencesAppSynchronize(self->__htTaskingDomain);
  CFPreferencesAppSynchronize(self->__htDomain);
  -[HTPrefs earlyInitNecessaryPrefs](self, "earlyInitNecessaryPrefs");
  HTPrefDefaultVal v7 = -[HTPrefs prefInitList](self, "prefInitList");
  v12[0] = @"HangTracerEnabled";
  v12[1] = &self->_hangtracerDaemonEnabled;
  char v13 = 1;
  char v14 = 0;
  uint64_t v15 = 0LL;
  BOOL v16 = "initPropertyHangtracerDaemonEnabled:";
  -[HTPrefs initPropertyHangtracerDaemonEnabled:](self, "initPropertyHangtracerDaemonEnabled:", v12);
  for (i = v7->var5; i; ++v7)
  {
    objc_msgSend(self, i, v7);
    i = v7[1].var5;
  }

  if (-[HTPrefs shouldPostHTPrefsChangedNotification](self, "shouldPostHTPrefsChangedNotification"))
  {
    -[HTPrefs setShouldPostHTPrefsChangedNotification:](self, "setShouldPostHTPrefsChangedNotification:", 0LL);
    id v9 = shared_ht_log_handle();
    int64x2_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v18 = @"com.apple.hangtracer.htprefs.refreshed";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Posting notification %@", buf, 0xCu);
    }

    int v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v11 postNotificationName:@"com.apple.hangtracer.htprefs.refreshed" object:self userInfo:0];
  }

- (void)earlyInitNecessaryPrefs
{
  v5[0] = @"HangTracerEnableCustomerMode";
  v5[1] = &self->_customerModeEnabled;
  char v6 = 0;
  char v7 = 0;
  v2 = "initBoolProperty:";
  uint64_t v8 = 0LL;
  id v9 = "initBoolProperty:";
  uint64_t v10 = 0LL;
  p_BOOL isInternal = &self->_isInternal;
  char v12 = 0;
  char v13 = 0;
  uint64_t v14 = 0LL;
  uint64_t v15 = "initPropertyIsInternal:";
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  if ("initBoolProperty:")
  {
    id v4 = v5;
    do
    {
      objc_msgSend(self, v2, v4);
      v2 = (const char *)v4[11];
      v4 += 6;
    }

    while (v2);
  }

- (void)__createInternalSettings
{
  if (!-[HTPrefs isInternal](self, "isInternal")) {
    return;
  }
  id v3 = (void *)CFPreferencesCopyValue( @"HangTracerInternalSettingCreated",  self->__htTaskingDomain,  @"mobile",  kCFPreferencesAnyHost);
  id v4 = v3;
  if (!v3 || ([v3 BOOLValue] & 1) == 0)
  {
    id v5 = shared_ht_log_handle();
    char v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "checkPreferences: Internal install, force enabled.",  v10,  2u);
    }

    CFPreferencesSetValue( @"HangTracerEnabled",  kCFBooleanTrue,  self->__htTaskingDomain,  @"mobile",  kCFPreferencesAnyHost);
    CFPreferencesSetValue( @"HangTracerInternalSettingCreated",  kCFBooleanTrue,  self->__htTaskingDomain,  @"mobile",  kCFPreferencesAnyHost);
  }

  char v7 = (void *)CFPreferencesCopyValue( @"HangTracerInternalSettingsVersion",  self->__htTaskingDomain,  @"mobile",  kCFPreferencesAnyHost);
  uint64_t v8 = v7;
  if (v7)
  {
    if ([v7 unsignedIntegerValue] == (id)2) {
      goto LABEL_12;
    }
  }

  else
  {
    CFPreferencesSetValue( @"HangTracerDuration",  0LL,  self->__htTaskingDomain,  @"mobile",  kCFPreferencesAnyHost);
  }

  CFPreferencesSetValue( @"HangTracerInternalSettingsVersion",  &off_100016390,  self->__htTaskingDomain,  @"mobile",  kCFPreferencesAnyHost);
LABEL_12:
  id v9 = (void *)CFPreferencesCopyValue( @"HangTracerEnableTailspin",  self->__htTaskingDomain,  @"mobile",  kCFPreferencesAnyHost);
  if (!v9) {
    CFPreferencesSetValue( @"HangTracerEnableTailspin",  kCFBooleanTrue,  self->__htTaskingDomain,  @"mobile",  kCFPreferencesAnyHost);
  }
  CFPreferencesSetValue( @"HangTracerEnableMemoryLogging",  kCFBooleanTrue,  self->__htTaskingDomain,  @"mobile",  kCFPreferencesAnyHost);
}

- (void)setupPrefsWithQueue:(id)a3
{
  id v4 = a3;
  if (!v4) {
    sub_10000C414();
  }
  id v5 = v4;
  -[HTPrefs setupPrefsWithQueue:profilePath:taskingDomainName:hangtracerDomain:setupInternalPrefs:]( self,  "setupPrefsWithQueue:profilePath:taskingDomainName:hangtracerDomain:setupInternalPrefs:",  v4,  @"/Library/Managed Preferences/mobile/.GlobalPreferences.plist",  @"com.apple.da",  @"com.apple.hangtracer",  1LL);
}

- (void)setupPrefsWithQueue:(id)a3 profilePath:(id)a4 taskingDomainName:(__CFString *)a5 hangtracerDomain:(__CFString *)a6 setupInternalPrefs:(BOOL)a7
{
  BOOL v7 = a7;
  char v12 = (dispatch_queue_s *)a3;
  id v13 = a4;
  id v14 = shared_ht_log_handle();
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "HTPrefs initialization", buf, 2u);
  }

  objc_storeStrong((id *)&self->__profilePath, a4);
  self->__htTaskingDomain = a5;
  self->__htDomain = a6;
  *(_WORD *)&self->_shouldAllowSentryEnablement = 0;
  -[HTPrefs earlyInitNecessaryPrefs](self, "earlyInitNecessaryPrefs");
  if (v7) {
    -[HTPrefs __createInternalSettings](self, "__createInternalSettings");
  }
  dispatch_queue_attr_t v16 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, 0);
  __int128 v17 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v16);
  __int128 v18 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.hangtracer.preferences", v17, v12);
  prefsQueue = self->__prefsQueue;
  self->__prefsQueue = v18;

  objc_initWeak(&location, self);
  *(void *)buf = 0LL;
  v39 = buf;
  uint64_t v40 = 0x2020000000LL;
  uint64_t v35 = 0LL;
  __int16 v36 = (int *)&v35;
  uint64_t v37 = 0x2020000000LL;
  uint64_t v32 = 0LL;
  __int128 v33 = (int *)&v32;
  uint64_t v34 = 0x2020000000LL;
  uint64_t v29 = 0LL;
  __int128 v30 = (int *)&v29;
  uint64_t v31 = 0x2020000000LL;
  v28[0] = 0LL;
  v28[1] = v28;
  v28[2] = 0x2020000000LL;
  uint64_t v25 = 0LL;
  id v26 = (int *)&v25;
  uint64_t v27 = 0x2020000000LL;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000086F8;
  v23[3] = &unk_100014648;
  v23[5] = buf;
  v23[6] = &v35;
  _BYTE v23[7] = &v32;
  v23[8] = &v29;
  v23[9] = v28;
  objc_copyWeak(&v24, &location);
  v23[4] = self;
  __int16 v20 = objc_retainBlock(v23);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100008A48;
  v22[3] = &unk_100014670;
  v22[4] = &v25;
  unsigned int v21 = objc_retainBlock(v22);
  notify_register_dispatch(EPL_STATE_CHANGED_NOTIFICATION[0], v30 + 6, (dispatch_queue_t)self->__prefsQueue, v20);
  notify_register_dispatch( HANGTRACER_TASKING_CHANGED_NOTIFICATION[0],  (int *)v39 + 6,  (dispatch_queue_t)self->__prefsQueue,  v20);
  notify_register_dispatch( HANGTRACER_TELEMETRY_CHANGED_NOTIFICATION[0],  v36 + 6,  (dispatch_queue_t)self->__prefsQueue,  v20);
  notify_register_dispatch( HANGTRACER_PROFILE_LIST_CHANGED_NOTIFICATION[0],  v33 + 6,  (dispatch_queue_t)self->__prefsQueue,  v20);
  notify_register_dispatch(TEST_RESET_LOG_LIMITS_NOTIFICATION, v26 + 6, (dispatch_queue_t)self->__prefsQueue, v21);
  -[HTPrefs setShouldPostHTPrefsChangedNotification:](self, "setShouldPostHTPrefsChangedNotification:", 1LL);
  -[HTPrefs refreshHTPrefs](self, "refreshHTPrefs");

  objc_destroyWeak(&v24);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(v28, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(buf, 8);
  objc_destroyWeak(&location);
}

- (void)_removeAllPrefs
{
  v22[0] = @"HangTracerInternalSettingCreated";
  v22[1] = @"HangTracerInternalSettingsVersion";
  v22[2] = @"HangTracerReportPeriod";
  v22[3] = @"HangTracerEnableCustomerMode";
  v22[4] = @"HangTracerEnabled";
  void v22[5] = @"HangTracerThirdPartyRunloopLogsEnabled";
  v22[6] = @"HangTracerEnableHUD";
  _BYTE v22[7] = @"HangTracerEnableForceQuitDetection";
  v22[8] = @"HangTracerCollectOSSignposts";
  v22[9] = @"HangTracerCollectOSSignpostsDeferred";
  v22[10] = @"HangTracerEnableTailspin";
  v22[11] = @"HangTracerSavedTailspinsMaxMB";
  v22[12] = @"HangTracerKeepTailspins";
  v22[13] = @"HangTracerKeepTailspinsWithFormat";
  v22[14] = @"HangTracerPercentFullSpinReports";
  v22[15] = @"HangTracerDailyLogLimit";
  v22[16] = @"HangTracerPerPeriodLogLimit";
  v22[17] = @"HangTracerDailyLongLogLimit";
  v22[18] = @"HangTracerDailyThirdPartyLogLimit";
  v22[19] = @"HangTracerDuration";
  v22[20] = @"HangTracerLongHangDurationThreshold";
  v22[21] = @"HangTracerThirdPartyHangThreshold";
  v22[22] = @"HangTracerHangTimeoutDuration";
  v22[23] = @"HangTracerIncludeDiskInfo";
  v22[24] = @"HangTracerEnableDisplayData";
  v22[25] = @"HangTracerIncludeNetworkState";
  v22[26] = @"HangTracerFenceTrackingEnabled";
  v22[27] = @"HangTracerSlowActTailspinsEnabled";
  v22[28] = @"HangTracerSlowActPerAppMax";
  v22[29] = @"HangTracerSlowActDailyLogLimit";
  v22[30] = @"HangTracerSlowActLaunchTailspinThreshold";
  v22[31] = @"HangTracerEnableSignpostMonitoring";
  v22[32] = @"HangTracerSignpostMonitoringDailyLogLimit";
  v22[33] = @"HangTracerSignpostMonitoringPerPeriodLogLimit";
  v22[34] = @"HangTracerEnableAppLaunchMonitoring";
  v22[35] = @"HangTracerEnableWorkflowResponsiveness";
  v22[36] = @"HangTracerWorkflowResponsivenessDailyLogLimit";
  v22[37] = @"HangTracerWorkflowResponsivenessPerPeriodLogLimit";
  v22[38] = @"HangTracerEnableMemoryLogging";
  v22[39] = @"HangTracerMemoryLoggingInterval";
  v22[40] = @"EPLEnabled";
  v22[41] = @"EPLTimeoutTimestampSec";
  v22[42] = @"HangTracerHUDThresholdMSec";
  v22[43] = @"HangTracerForceQuitDetectionThresholdMSec";
  v22[44] = @"AutomatedDeviceGroup";
  v22[45] = @"ExperimentGroup";
  v22[46] = @"HangTracerHangWaitTimeoutDuration";
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 47LL));
  id v4 = [v3 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      BOOL v7 = 0LL;
      do
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        CFPreferencesSetValue( *(CFStringRef *)(*((void *)&v16 + 1) + 8LL * (void)v7),  0LL,  self->__htTaskingDomain,  @"mobile",  kCFPreferencesAnyHost);
        BOOL v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }

    while (v5);
  }

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v8 = [&__NSArray0__struct countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      int v11 = 0LL;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(&__NSArray0__struct);
        }
        CFPreferencesSetValue( *(CFStringRef *)(*((void *)&v12 + 1) + 8LL * (void)v11),  0LL,  self->__htDomain,  @"mobile",  kCFPreferencesAnyHost);
        int v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [&__NSArray0__struct countByEnumeratingWithState:&v12 objects:v20 count:16];
    }

    while (v9);
  }

  CFPreferencesSynchronize(self->__htTaskingDomain, @"mobile", kCFPreferencesAnyHost);
  CFPreferencesSynchronize(self->__htDomain, @"mobile", kCFPreferencesAnyHost);
}

- (BOOL)isInternal
{
  return self->_isInternal;
}

- (BOOL)customerModeEnabled
{
  return self->_customerModeEnabled;
}

- (BOOL)hangtracerDaemonEnabled
{
  return self->_hangtracerDaemonEnabled;
}

- (BOOL)htTailspinEnabled
{
  return self->_htTailspinEnabled;
}

- (BOOL)hudEnabled
{
  return self->_hudEnabled;
}

- (BOOL)forceQuitDetectionEnabled
{
  return self->_forceQuitDetectionEnabled;
}

- (BOOL)shouldCollectOSSignposts
{
  return self->_shouldCollectOSSignposts;
}

- (BOOL)shouldCollectOSSignpostsDeferred
{
  return self->_shouldCollectOSSignpostsDeferred;
}

- (BOOL)shouldSaveTailspins
{
  return self->_shouldSaveTailspins;
}

- (BOOL)shouldCompressSavedTailspins
{
  return self->_shouldCompressSavedTailspins;
}

- (unint64_t)savedTailspinMaxMB
{
  return self->_savedTailspinMaxMB;
}

- (BOOL)thirdPartyRunLoopHangLogsEnabled
{
  return self->_thirdPartyRunLoopHangLogsEnabled;
}

- (double)runloopHangPercentHeavyLogs
{
  return self->_runloopHangPercentHeavyLogs;
}

- (int)runLoopMicroHangDailyLogLimit
{
  return self->_runLoopMicroHangDailyLogLimit;
}

- (int)runLoopHangDailyLogLimit
{
  return self->_runLoopHangDailyLogLimit;
}

- (int)runLoopHangPerPeriodLogLimit
{
  return self->_runLoopHangPerPeriodLogLimit;
}

- (int)runLoopLongHangDailyLogLimit
{
  return self->_runLoopLongHangDailyLogLimit;
}

- (int)runloopHangThirdPartyDailyLogLimit
{
  return self->_runloopHangThirdPartyDailyLogLimit;
}

- (int)fenceHangDailyLogLimit
{
  return self->_fenceHangDailyLogLimit;
}

- (unint64_t)runloopHangTimeoutDurationMSec
{
  return self->_runloopHangTimeoutDurationMSec;
}

- (unint64_t)runloopHangDurationThresholdMSec
{
  return self->_runloopHangDurationThresholdMSec;
}

- (unint64_t)runloopLongHangDurationThresholdMSec
{
  return self->_runloopLongHangDurationThresholdMSec;
}

- (unint64_t)runloopHangThirdPartyDurationThresholdMSec
{
  return self->_runloopHangThirdPartyDurationThresholdMSec;
}

- (unint64_t)springBoardHangIORegGPUDumpTimeoutMSec
{
  return self->_springBoardHangIORegGPUDumpTimeoutMSec;
}

- (double)samplingPercentForMicroHangs
{
  return self->_samplingPercentForMicroHangs;
}

- (BOOL)shouldIncludeDiskInfo
{
  return self->_shouldIncludeDiskInfo;
}

- (BOOL)shouldIncludeDisplayData
{
  return self->_shouldIncludeDisplayData;
}

- (BOOL)shouldIncludeNetworkState
{
  return self->_shouldIncludeNetworkState;
}

- (BOOL)shouldUploadToDiagPipe
{
  return self->_shouldUploadToDiagPipe;
}

- (BOOL)fenceTrackingEnabled
{
  return self->_fenceTrackingEnabled;
}

- (BOOL)slowAppActivationTailspinEnabled
{
  return self->_slowAppActivationTailspinEnabled;
}

- (unint64_t)slowAppActivationThresholdMSec
{
  return self->_slowAppActivationThresholdMSec;
}

- (int)slowAppActivationPerAppMaxLogLimit
{
  return self->_slowAppActivationPerAppMaxLogLimit;
}

- (int)slowAppActivationDailyLogLimit
{
  return self->_slowAppActivationDailyLogLimit;
}

- (BOOL)signpostMonitoringEnabled
{
  return self->_signpostMonitoringEnabled;
}

- (BOOL)appLaunchMonitoringEnabled
{
  return self->_appLaunchMonitoringEnabled;
}

- (BOOL)workflowResponsivenessEnabled
{
  return self->_workflowResponsivenessEnabled;
}

- (int)signpostMonitoringDailyLogLimit
{
  return self->_signpostMonitoringDailyLogLimit;
}

- (int)signpostMonitoringPerPeriodLogLimit
{
  return self->_signpostMonitoringPerPeriodLogLimit;
}

- (int)workflowResponsivenessDailyLogLimit
{
  return self->_workflowResponsivenessDailyLogLimit;
}

- (int)workflowResponsivenessPerPeriodLogLimit
{
  return self->_workflowResponsivenessPerPeriodLogLimit;
}

- (BOOL)appActivationLoggingEnabled
{
  return self->_appActivationLoggingEnabled;
}

- (double)appActivationLoggingCPUUtilizationThresholdMSec
{
  return self->_appActivationLoggingCPUUtilizationThresholdMSec;
}

- (unsigned)appActivationLoggingMaxActivationLimit
{
  return self->_appActivationLoggingMaxActivationLimit;
}

- (BOOL)enableLoggingForPoster
{
  return self->_enableLoggingForPoster;
}

- (void)setEnableLoggingForPoster:(BOOL)a3
{
  self->_enableLoggingForPoster = a3;
}

- (BOOL)enableLoggingForWidgetRenderer
{
  return self->_enableLoggingForWidgetRenderer;
}

- (void)setEnableLoggingForWidgetRenderer:(BOOL)a3
{
  self->_enableLoggingForWidgetRenderer = a3;
}

- (BOOL)memoryLoggingEnabled
{
  return self->_memoryLoggingEnabled;
}

- (unsigned)memoryLoggingIntervalSec
{
  return self->_memoryLoggingIntervalSec;
}

- (void)setMemoryLoggingIntervalSec:(unsigned int)a3
{
  self->_unsigned int memoryLoggingIntervalSec = a3;
}

- (BOOL)pdseHangTracerKillSwitch
{
  return self->_pdseHangTracerKillSwitch;
}

- (BOOL)pdseHTRateOnlyKillSwitch
{
  return self->_pdseHTRateOnlyKillSwitch;
}

- (BOOL)pdseHTThirdPartyKillSwitch
{
  return self->_pdseHTThirdPartyKillSwitch;
}

- (BOOL)pdseSentryKillSwitch
{
  return self->_pdseSentryKillSwitch;
}

- (BOOL)pdseAppLaunchKillSwitch
{
  return self->_pdseAppLaunchKillSwitch;
}

- (BOOL)pdseWorkflowResponsivenessKillSwitch
{
  return self->_pdseWorkflowResponsivenessKillSwitch;
}

- (BOOL)pdseCATailspinKillSwitch
{
  return self->_pdseCATailspinKillSwitch;
}

- (BOOL)pdseAllowEnableTailspin
{
  return self->_pdseAllowEnableTailspin;
}

- (int)pdseHTPeriodDays
{
  return self->_pdseHTPeriodDays;
}

- (int)pdseHTRateOnlyPeriodDays
{
  return self->_pdseHTRateOnlyPeriodDays;
}

- (int)pdseHTThirdPartyPeriodDays
{
  return self->_pdseHTThirdPartyPeriodDays;
}

- (int)pdseHTThirdPartyNoLogUploadPeriodDays
{
  return self->_pdseHTThirdPartyNoLogUploadPeriodDays;
}

- (int)pdseSentryPeriodDays
{
  return self->_pdseSentryPeriodDays;
}

- (int)pdseAppLaunchPeriodDays
{
  return self->_pdseAppLaunchPeriodDays;
}

- (int)pdseWorkflowResponsivenessPeriodDays
{
  return self->_pdseWorkflowResponsivenessPeriodDays;
}

- (int)pdseCATailspinPeriodDays
{
  return self->_pdseCATailspinPeriodDays;
}

- (BOOL)eplEnabledProfile
{
  return self->_eplEnabledProfile;
}

- (BOOL)eplEnabled
{
  return self->_eplEnabled;
}

- (double)eplTimeoutTimestampSec
{
  return self->_eplTimeoutTimestampSec;
}

- (unint64_t)reportPeriodMATU
{
  return self->_reportPeriodMATU;
}

- (BOOL)hasInternalSettings
{
  return self->_hasInternalSettings;
}

- (unsigned)hudThresholdMSec
{
  return self->_hudThresholdMSec;
}

- (unsigned)forceQuitDetectionThresholdMSec
{
  return self->_forceQuitDetectionThresholdMSec;
}

- (BOOL)thirdPartyDevHangHUDEnabled
{
  return self->_thirdPartyDevHangHUDEnabled;
}

- (BOOL)thirdPartyIncludeNonDevelopmentApps
{
  return self->_thirdPartyIncludeNonDevelopmentApps;
}

- (NSArray)thirdPartyDevPreferredLanguages
{
  return (NSArray *)objc_getProperty(self, a2, 280LL, 1);
}

- (unint64_t)hangWaitTimeoutDurationMSec
{
  return self->_hangWaitTimeoutDurationMSec;
}

- (BOOL)isCarryDevice
{
  return self->_isCarryDevice;
}

- (NSString)enablementPrefix
{
  return (NSString *)objc_getProperty(self, a2, 296LL, 1);
}

- (double)badDaySecondsBetweenLastEnablementAndReferenceDate
{
  return self->_badDaySecondsBetweenLastEnablementAndReferenceDate;
}

- (unsigned)badDayEnablementMinimumBreakDurationDays
{
  return self->_badDayEnablementMinimumBreakDurationDays;
}

- (unsigned)badDayEnablementDurationDays
{
  return self->_badDayEnablementDurationDays;
}

- (unint64_t)badDayEnablementForHangDurationMSec
{
  return self->_badDayEnablementForHangDurationMSec;
}

- (unsigned)badDayEnablementForLogCount
{
  return self->_badDayEnablementForLogCount;
}

- (unsigned)badDayEnablementForPreviousDays
{
  return self->_badDayEnablementForPreviousDays;
}

- (BOOL)haveNonDefaultFeatureFlags
{
  return self->_haveNonDefaultFeatureFlags;
}

- (BOOL)haveSerialLoggingEnabled
{
  return self->_haveSerialLoggingEnabled;
}

- (BOOL)haveRootsInstalled
{
  return self->_haveRootsInstalled;
}

- (int)numOSCryptexFileExtents
{
  return self->_numOSCryptexFileExtents;
}

- (OS_dispatch_queue)_prefsQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 320LL, 1);
}

- (void)set_prefsQueue:(id)a3
{
}

- (NSString)tailspinSaveFormat
{
  return (NSString *)objc_getProperty(self, a2, 328LL, 1);
}

- (void)setTailspinSaveFormat:(id)a3
{
}

- (NSString)experimentGroup
{
  return (NSString *)objc_getProperty(self, a2, 336LL, 1);
}

- (void)setExperimentGroup:(id)a3
{
}

- (NSString)automationGroup
{
  return (NSString *)objc_getProperty(self, a2, 344LL, 1);
}

- (void)setAutomationGroup:(id)a3
{
}

- (BOOL)keepTailspinsLegacy
{
  return self->_keepTailspinsLegacy;
}

- (void)setKeepTailspinsLegacy:(BOOL)a3
{
  self->_BOOL keepTailspinsLegacy = a3;
}

- (NSDictionary)_installedHTProfileDict
{
  return (NSDictionary *)objc_getProperty(self, a2, 352LL, 1);
}

- (void)set_installedHTProfileDict:(id)a3
{
}

- (NSString)_profilePath
{
  return (NSString *)objc_getProperty(self, a2, 360LL, 1);
}

- (void)set_profilePath:(id)a3
{
}

- (__CFString)_htTaskingDomain
{
  return self->__htTaskingDomain;
}

- (void)set_htTaskingDomain:(__CFString *)a3
{
  self->__htTaskingDomain = a3;
}

- (__CFString)_htDomain
{
  return self->__htDomain;
}

- (void)set_htDomain:(__CFString *)a3
{
  self->__htDomain = a3;
}

- (BOOL)shouldPostHTPrefsChangedNotification
{
  return self->_shouldPostHTPrefsChangedNotification;
}

- (void)setShouldPostHTPrefsChangedNotification:(BOOL)a3
{
  self->_shouldPostHTPrefsChangedNotification = a3;
}

- (BOOL)shouldAllowSentryEnablement
{
  return self->_shouldAllowSentryEnablement;
}

- (void)setShouldAllowSentryEnablement:(BOOL)a3
{
  self->_shouldAllowSentryEnablement = a3;
}

- (BOOL)shouldAllowWorkflowResponsivenessEnablement
{
  return self->_shouldAllowWorkflowResponsivenessEnablement;
}

- (void)setShouldAllowWorkflowResponsivenessEnablement:(BOOL)a3
{
  self->_shouldAllowWorkflowResponsivenessEnablement = a3;
}

- (BOOL)_isInternalNoOverride
{
  return self->__isInternalNoOverride;
}

- (void)set_isInternalNoOverride:(BOOL)a3
{
  self->__int isInternalNoOverride = a3;
}

- (NSString)thirdPartyDevBootSessionUUID
{
  return (NSString *)objc_getProperty(self, a2, 384LL, 1);
}

- (void).cxx_destruct
{
}

@end