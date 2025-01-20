@interface HTPrefs
+ (id)sharedPrefs;
- (BOOL)BOOLProperty:(HTPrefInit *)a3 contextPrefixOut:(id *)a4;
- (BOOL)_isInternalNoOverride;
- (BOOL)appActivationLoggingEnabled;
- (BOOL)appLaunchMonitoringEnabled;
- (BOOL)compareBootSessionUUIDAndClearPreferencesWithDomain:(id)a3 prefix:(id)a4;
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
- (id)getBootSessionUUID;
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
- (void)initIsAutomationGroup:(HTPrefInit *)a3;
- (void)initNSObjectProperty:(HTPrefInit *)a3;
- (void)initNSStringProperty:(HTPrefInit *)a3;
- (void)initPropertyForceQuitDetectionEnabled:(HTPrefInit *)a3;
- (void)initPropertyHangtracerDaemonEnabled:(HTPrefInit *)a3;
- (void)initPropertyHaveInternalSettings:(HTPrefInit *)a3;
- (void)initPropertyIsCarryDevice:(HTPrefInit *)a3;
- (void)initPropertyIsInternal:(HTPrefInit *)a3;
- (void)initPropertyMemoryLoggingIntervalSec:(HTPrefInit *)a3;
- (void)initPropertyReportPeriod:(HTPrefInit *)a3;
- (void)initPropertyShouldSaveAndCompressTailspins:(HTPrefInit *)a3;
- (void)initPropertyThirdPartyDevPreferredLanguages:(HTPrefInit *)a3;
- (void)initUnsignedIntProperty:(HTPrefInit *)a3;
- (void)initUnsignedLongLongProperty:(HTPrefInit *)a3;
- (void)initUnsignedLongProperty:(HTPrefInit *)a3;
- (void)refreshHTPrefs;
- (void)savePreferencesForRestoration:(id)a3 withDomain:(id)a4 prefix:(id)a5;
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
  if (qword_10005BB60 != -1) {
    dispatch_once(&qword_10005BB60, &stru_1000499E8);
  }
  return (NSArray *)(id)qword_10005BB68;
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
        unsigned int v15 = -[__CFString isEqualToString:](v14, "isEqualToString:", &stru_10004A8D0);
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
          id v21 = sub_1000233A4();
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

  id v20 = sub_1000233A4();
  id obj = (id)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled((os_log_t)obj, OS_LOG_TYPE_DEBUG)) {
    sub_10002CF2C((uint64_t)v29, (uint64_t)a4, (os_log_s *)obj);
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
    id v10 = sub_1000233A4();
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
    id v10 = sub_1000233A4();
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
    id v10 = sub_1000233A4();
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
    id v10 = sub_1000233A4();
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
      id v10 = sub_1000233A4();
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
      id v13 = sub_1000233A4();
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
    id v8 = sub_1000233A4();
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
    id v8 = sub_1000233A4();
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
    id v8 = sub_1000233A4();
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
    id v8 = sub_1000233A4();
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
    id v8 = sub_1000233A4();
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
    id v8 = sub_1000233A4();
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
    id v7 = sub_1000233A4();
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
    id v9 = sub_1000233A4();
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

- (void)initIsAutomationGroup:(HTPrefInit *)a3
{
  id v5 = *(id *)a3->var1;
  uint64_t v6 = 16LL;
  if (!self->_isInternal) {
    uint64_t v6 = 24LL;
  }
  id v7 = *(id *)((char *)&a3->var0 + v6);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( +[OSASystemConfiguration automatedDeviceGroup]( &OBJC_CLASS___OSASystemConfiguration,  "automatedDeviceGroup"));
  id v9 = v8;
  if (v8 && ((a3->var4 & 4) == 0 || [v8 length]))
  {
    id v10 = v9;

    id v7 = v10;
  }

  if (([v7 isEqualToString:v5] & 1) == 0)
  {
    id v11 = sub_1000233A4();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      var0 = a3->var0;
      int v14 = 138412802;
      int v15 = var0;
      __int16 v16 = 2112;
      id v17 = v5;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "HTPrefs: %@: %@ -> %@",  (uint8_t *)&v14,  0x20u);
    }

    objc_storeStrong((id *)a3->var1, v7);
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
    id v8 = sub_1000233A4();
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
    id v10 = sub_1000233A4();
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_10002CFA4((uint64_t)v9, &self->_enablementPrefix, v11);
    }
  }

  if (hangtracerDaemonEnabled != v6)
  {
    self->_int hangtracerDaemonEnabled = v6;
    id v12 = sub_1000233A4();
    __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      var0 = a3->var0;
      *(_DWORD *)buf = 138412802;
      id v17 = var0;
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
  int v5 = MGGetBoolAnswer(@"InternalBuild");
  if (isInternalNoOverride != v5)
  {
    BOOL v6 = v5;
    id v7 = sub_1000233A4();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_10002D0BC();
    }

    self->__int isInternalNoOverride = v6;
    -[HTPrefs setShouldPostHTPrefsChangedNotification:](self, "setShouldPostHTPrefsChangedNotification:", 1LL);
  }

  BOOL v9 = !self->_customerModeEnabled && self->__isInternalNoOverride;
  if (self->_isInternal != v9)
  {
    id v10 = sub_1000233A4();
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_10002D028();
    }

    self->_isInternal = v9;
    -[HTPrefs setShouldPostHTPrefsChangedNotification:](self, "setShouldPostHTPrefsChangedNotification:", 1LL);
  }

- (void)initPropertyForceQuitDetectionEnabled:(HTPrefInit *)a3
{
  int forceQuitDetectionEnabled = self->_forceQuitDetectionEnabled;
  id v16 = 0LL;
  unsigned int v6 = -[HTPrefs BOOLProperty:contextPrefixOut:](self, "BOOLProperty:contextPrefixOut:", a3, &v16);
  id v7 = v16;
  id v8 = v7;
  if (self->_isInternal) {
    int v9 = v6;
  }
  else {
    int v9 = 0;
  }
  if (self->_isInternal && (v6 & 1) == 0)
  {
    if (self->_isCarryDevice && ([v7 isEqualToString:&stru_10004A8D0] & 1) == 0)
    {
      id v10 = sub_1000233A4();
      int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        var0 = a3->var0;
        *(_DWORD *)buf = 138412290;
        __int16 v18 = var0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "HTPrefs: %@ force-enabled by isCarryDevice",  buf,  0xCu);
      }

      int v9 = 1;
    }

    else
    {
      int v9 = 0;
    }
  }

  if (forceQuitDetectionEnabled != v9)
  {
    *(_BYTE *)a3->var1 = v9;
    id v13 = sub_1000233A4();
    unsigned int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      id v15 = a3->var0;
      *(_DWORD *)buf = 138412802;
      __int16 v18 = v15;
      __int16 v19 = 1024;
      int v20 = forceQuitDetectionEnabled;
      __int16 v21 = 1024;
      int v22 = v9;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "HTPrefs: %@: %{BOOL}d -> %{BOOL}d",  buf,  0x18u);
    }

    -[HTPrefs setShouldPostHTPrefsChangedNotification:](self, "setShouldPostHTPrefsChangedNotification:", 1LL);
  }
}

- (void)initPropertyIsCarryDevice:(HTPrefInit *)a3
{
  int v5 = *(unsigned __int8 *)a3->var1;
  id v6 = sub_1000233A4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10002D2C8();
  }

  id v8 = sub_1000233A4();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10002D254();
  }

  v17[0] = @"carry";
  v17[1] = @"walkabout";
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 2LL));
  int v11 = v10;
  if (self->_isInternal
    && !self->_automationGroup
    && [v10 containsObject:self->_experimentGroup])
  {
    id v12 = sub_1000233A4();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_10002D1E0();
    }

    int v14 = 1;
  }

  else
  {
    int v14 = 0;
  }

  if (v5 != v14)
  {
    *(_BYTE *)a3->var1 = v14;
    id v15 = sub_1000233A4();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_10002D150(v5, v14, v16);
    }

    -[HTPrefs setShouldPostHTPrefsChangedNotification:](self, "setShouldPostHTPrefsChangedNotification:", 1LL);
  }
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
    id v13 = sub_1000233A4();
    int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_10002D3D0();
    }

    self->_int shouldSaveTailspins = v12;
    -[HTPrefs setShouldPostHTPrefsChangedNotification:](self, "setShouldPostHTPrefsChangedNotification:", 1LL);
  }

  if (shouldCompressSavedTailspins != v11)
  {
    id v15 = sub_1000233A4();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_10002D33C();
    }

    self->_int shouldCompressSavedTailspins = v11;
    -[HTPrefs setShouldPostHTPrefsChangedNotification:](self, "setShouldPostHTPrefsChangedNotification:", 1LL);
  }

- (void)initPropertyReportPeriod:(HTPrefInit *)a3
{
  double reportPeriodMATU = (double)self->_reportPeriodMATU;
  -[HTPrefs doubleProperty:contextPrefixOut:](self, "doubleProperty:contextPrefixOut:", a3, 0LL);
  double v7 = v6 * 1000.0 / sub_100025710();
  if (v7 != reportPeriodMATU)
  {
    id v8 = sub_1000233A4();
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
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
    id v8 = sub_1000233A4();
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
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
  int v9 = v8;
  if (!-[NSArray isEqualToArray:](v5, "isEqualToArray:", v8))
  {
    id v10 = sub_1000233A4();
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
  if (qword_10005BB78 != -1) {
    dispatch_once(&qword_10005BB78, &stru_100049A08);
  }
  return (id)qword_10005BB70;
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
    id v4 = sub_1000233A4();
    int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_10002D464(v5);
    }

    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
    [v17 timeIntervalSinceReferenceDate];
    HTPrefDefaultVal v7 = v6;
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
    [v16 timeIntervalSinceReferenceDate];
    HTPrefDefaultVal v9 = v8;
    __int128 v86 = 0u;
    HIBYTE(v86) = 0;

    result = (HTPrefInit *)malloc(0xE40uLL);
    result[59].var0 = @"PDSEPrefWorkflowResponsivenessKillSwitch";
    result[59].var1 = &self->_pdseWorkflowResponsivenessKillSwitch;
    result[60].var0 = @"PDSEPrefHTRateOnlyPeriodDays";
    result[60].var1 = &self->_pdseHTRateOnlyPeriodDays;
    result[61].var0 = @"PDSEPrefHTThirdPartyPeriodDays";
    result->var0 = @"HangTracerEnableTailspin";
    result->var1 = &self->_htTailspinEnabled;
    result[58].var1 = &self->_pdseAppLaunchKillSwitch;
    result[61].var1 = &self->_pdseHTThirdPartyPeriodDays;
    result[62].var0 = @"PDSEPrefHTThirdPartyNoLogUploadPeriodDays";
    result[62].var1 = &self->_pdseHTThirdPartyNoLogUploadPeriodDays;
    result[1].var0 = @"HangTracerEnableHUD";
    result[1].var1 = &self->_hudEnabled;
    result[63].var0 = @"PDSEPrefSentryPeriodDays";
    result[63].var1 = &self->_pdseSentryPeriodDays;
    result[64].var0 = @"PDSEPrefCATailspinPeriodDays";
    result[64].var1 = &self->_pdseCATailspinPeriodDays;
    result[2].var0 = @"ExperimentGroup";
    result[2].var1 = &self->_experimentGroup;
    result[65].var0 = @"PDSEPrefAppLaunchPeriodDays";
    result[65].var1 = &self->_pdseAppLaunchPeriodDays;
    result[66].var0 = @"PDSEPrefWorkflowResponsivenessPeriodDays";
    result[66].var1 = &self->_pdseWorkflowResponsivenessPeriodDays;
    result[3].var1 = &self->_automationGroup;
    result[67].var0 = @"HangTracerShouldUploadToDiagPipe";
    result[67].var1 = &self->_shouldUploadToDiagPipe;
    result[68].var0 = @"PDSEPrefHangTracerKillSwitch";
    result[68].var1 = &self->_pdseHangTracerKillSwitch;
    result[69].var0 = @"HTSEEnablementPeriodDays";
    result[69].var1 = &self->_pdseHTPeriodDays;
    result[70].var0 = @"PDSEPrefAllowEnableTailspin";
    result[70].var1 = &self->_pdseAllowEnableTailspin;
    result[71].var0 = @"HangTracerTelemetryHaveNonDefaultFeatureFlags";
    result[71].var1 = &self->_haveNonDefaultFeatureFlags;
    result[5].var0 = @"HangTracerCollectOSSignposts";
    result[5].var1 = &self->_shouldCollectOSSignposts;
    result[72].var0 = @"HangTracerTelemetrySerialLoggingEnabled";
    result[72].var1 = &self->_haveSerialLoggingEnabled;
    result[73].var0 = @"HangTracerTelemetryNumOSCryptexFileExtents";
    result[73].var1 = &self->_numOSCryptexFileExtents;
    result[74].var0 = @"HangTracerTelemetryHaveRootsInstalled";
    result[6].var0 = @"HangTracerCollectOSSignpostsDeferred";
    result[6].var1 = &self->_shouldCollectOSSignpostsDeferred;
    result[74].var1 = &self->_haveRootsInstalled;
    self->_prefInitList = result;
    result[3].var0 = @"AutomatedDeviceGroup";
    result[3].var5 = "initIsAutomationGroup:";
    result[7].var0 = @"HangTracerSavedTailspinsMaxMB";
    result[7].var1 = &self->_savedTailspinMaxMB;
    result[4].var1 = &self->_isCarryDevice;
    result[4].var5 = "initPropertyIsCarryDevice:";
    HIDWORD(result[5].var2.var3) = *(_DWORD *)&v83[3];
    *(_DWORD *)(&result[5].var2.var0 + 1) = *(_DWORD *)v83;
    HIDWORD(result[5].var3.var3) = *(_DWORD *)&v82[3];
    *(_DWORD *)(&result[5].var3.var0 + 1) = *(_DWORD *)v82;
    *(_DWORD *)(&result[6].var2.var0 + 1) = *(_DWORD *)v81;
    HIDWORD(result[6].var3.var3) = *(_DWORD *)&v80[3];
    *(_DWORD *)(&result[6].var3.var0 + 1) = *(_DWORD *)v80;
    HIDWORD(result[8].var2.var3) = *(_DWORD *)&v79[3];
    *(_DWORD *)(&result[8].var2.var0 + 1) = *(_DWORD *)v79;
    HIDWORD(result[8].var3.var3) = *(_DWORD *)&v78[3];
    *(_DWORD *)(&result[8].var3.var0 + 1) = *(_DWORD *)v78;
    HIDWORD(result[10].var2.var3) = *(_DWORD *)&v77[3];
    *(_DWORD *)(&result[10].var2.var0 + 1) = *(_DWORD *)v77;
    HIDWORD(result[10].var3.var3) = *(_DWORD *)&v76[3];
    *(_DWORD *)(&result[10].var3.var0 + 1) = *(_DWORD *)v76;
    HIDWORD(result[11].var2.var3) = *(_DWORD *)&v75[3];
    *(_DWORD *)(&result[11].var2.var0 + 1) = *(_DWORD *)v75;
    HIDWORD(result[11].var3.var3) = *(_DWORD *)&v74[3];
    *(_DWORD *)(&result[11].var3.var0 + 1) = *(_DWORD *)v74;
    HIDWORD(result[12].var2.var3) = *(_DWORD *)&v73[3];
    *(_DWORD *)(&result[12].var2.var0 + 1) = *(_DWORD *)v73;
    HIDWORD(result[12].var3.var3) = *(_DWORD *)&v72[3];
    *(_DWORD *)(&result[12].var3.var0 + 1) = *(_DWORD *)v72;
    HIDWORD(result[13].var2.var3) = *(_DWORD *)&v71[3];
    *(_DWORD *)(&result[13].var2.var0 + 1) = *(_DWORD *)v71;
    HIDWORD(result[13].var3.var3) = *(_DWORD *)&v70[3];
    *(_DWORD *)(&result[13].var3.var0 + 1) = *(_DWORD *)v70;
    HIDWORD(result[14].var2.var3) = *(_DWORD *)&v69[3];
    *(_DWORD *)(&result[14].var2.var0 + 1) = *(_DWORD *)v69;
    HIDWORD(result[14].var3.var3) = *(_DWORD *)&v68[3];
    *(_DWORD *)(&result[14].var3.var0 + 1) = *(_DWORD *)v68;
    *(_DWORD *)(&result[27].var2.var0 + 1) = *(_DWORD *)v67;
    *(_DWORD *)(&result[27].var3.var0 + 1) = *(_DWORD *)v66;
    *(_DWORD *)(&result[30].var2.var0 + 1) = *(_DWORD *)v65;
    *(_DWORD *)(&result[30].var3.var0 + 1) = *(_DWORD *)v64;
    HIDWORD(result[32].var2.var3) = *(_DWORD *)&v63[3];
    *(_DWORD *)(&result[32].var2.var0 + 1) = *(_DWORD *)v63;
    HIDWORD(result[32].var3.var3) = *(_DWORD *)&v62[3];
    *(_DWORD *)(&result[32].var3.var0 + 1) = *(_DWORD *)v62;
    *(_DWORD *)(&result[35].var2.var0 + 1) = *(_DWORD *)v61;
    *(_DWORD *)(&result[35].var3.var0 + 1) = *(_DWORD *)v60;
    HIDWORD(result[36].var2.var3) = *(_DWORD *)&v59[3];
    *(_DWORD *)(&result[36].var2.var0 + 1) = *(_DWORD *)v59;
    HIDWORD(result[36].var3.var3) = *(_DWORD *)&v58[3];
    *(_DWORD *)(&result[36].var3.var0 + 1) = *(_DWORD *)v58;
    *(_DWORD *)(&result[39].var2.var0 + 1) = *(_DWORD *)v57;
    *(_DWORD *)(&result[39].var3.var0 + 1) = *(_DWORD *)v56;
    HIDWORD(result[41].var2.var3) = *(_DWORD *)&v55[3];
    *(_DWORD *)(&result[41].var2.var0 + 1) = *(_DWORD *)v55;
    HIDWORD(result[41].var3.var3) = *(_DWORD *)&v54[3];
    *(_DWORD *)(&result[41].var3.var0 + 1) = *(_DWORD *)v54;
    *(_DWORD *)(&result[42].var2.var0 + 1) = *(_DWORD *)v53;
    HIDWORD(result[42].var3.var3) = *(_DWORD *)&v52[3];
    *(_DWORD *)(&result[42].var3.var0 + 1) = *(_DWORD *)v52;
    HIDWORD(result[45].var2.var3) = *(_DWORD *)&v51[3];
    *(_DWORD *)(&result[45].var2.var0 + 1) = *(_DWORD *)v51;
    HIDWORD(result[45].var3.var3) = *(_DWORD *)&v50[3];
    *(_DWORD *)(&result[45].var3.var0 + 1) = *(_DWORD *)v50;
    HIDWORD(result[47].var2.var3) = *(_DWORD *)&v49[3];
    *(_DWORD *)(&result[47].var2.var0 + 1) = *(_DWORD *)v49;
    HIDWORD(result[47].var3.var3) = *(_DWORD *)&v48[3];
    *(_DWORD *)(&result[47].var3.var0 + 1) = *(_DWORD *)v48;
    *(_DWORD *)(&result[4].var2.var0 + 1) = *(_DWORD *)v85;
    HIDWORD(result[4].var2.var3) = *(_DWORD *)&v85[3];
    *(_DWORD *)(&result[4].var3.var0 + 1) = *(_DWORD *)v84;
    HIDWORD(result[4].var3.var3) = *(_DWORD *)&v84[3];
    HIDWORD(result[6].var2.var3) = *(_DWORD *)&v81[3];
    result[7].var2.var1 = 50;
    result[7].var3.var1 = 20;
    result[8].var0 = @"HangTracerKeepTailspins";
    result[8].var1 = &self->_keepTailspinsLegacy;
    result[9].var0 = @"HangTracerKeepTailspinsWithFormat";
    result[9].var1 = &self->_tailspinSaveFormat;
    result[9].var2.var3 = (unint64_t)@"compressed";
    result[9].var3.var3 = (unint64_t)@"none";
    result[10].var1 = &self->_shouldSaveTailspins;
    result[10].var5 = "initPropertyShouldSaveAndCompressTailspins:";
    result[11].var0 = @"HangTracerIncludeDiskInfo";
    result[11].var1 = &self->_shouldIncludeDiskInfo;
    result[12].var0 = @"HangTracerEnableDisplayData";
    result[12].var1 = &self->_shouldIncludeDisplayData;
    result[13].var0 = @"HangTracerIncludeNetworkState";
    result[13].var1 = &self->_shouldIncludeNetworkState;
    result[14].var0 = @"HangTracerThirdPartyRunloopLogsEnabled";
    result[14].var1 = &self->_thirdPartyRunLoopHangLogsEnabled;
    result[15].var0 = @"HangTracerSamplingPercentForMicroHangs";
    result[15].var1 = &self->_samplingPercentForMicroHangs;
    result[16].var0 = @"HangTracerPercentFullSpinReports";
    result[16].var1 = &self->_runloopHangPercentHeavyLogs;
    result[17].var0 = @"HangTracerDailyMicroHangLogLimit";
    result[17].var1 = &self->_runLoopMicroHangDailyLogLimit;
    result[18].var0 = @"HangTracerDailyLogLimit";
    result[18].var1 = &self->_runLoopHangDailyLogLimit;
    result[19].var0 = @"HangTracerPerPeriodLogLimit";
    result[19].var1 = &self->_runLoopHangPerPeriodLogLimit;
    result[20].var0 = @"HangTracerDailyLongLogLimit";
    result[20].var1 = &self->_runLoopLongHangDailyLogLimit;
    result[21].var0 = @"HangTracerDailyThirdPartyLogLimit";
    result[21].var1 = &self->_runloopHangThirdPartyDailyLogLimit;
    result[17].var2.var1 = 10;
    result[17].var3.var1 = 10;
    result[21].var2.var1 = 10;
    result[21].var3.var1 = 10;
    result[22].var0 = @"HangTracerFenceHangLogLimit";
    result[22].var1 = &self->_fenceHangDailyLogLimit;
    result[23].var0 = @"HangTracerHangTimeoutDuration";
    result[23].var1 = &self->_runloopHangTimeoutDurationMSec;
    result[24].var0 = @"HangTracerDuration";
    result[24].var1 = &self->_runloopHangDurationThresholdMSec;
    result[25].var0 = @"HangTracerLongHangDurationThreshold";
    result[25].var1 = &self->_runloopLongHangDurationThresholdMSec;
    result[26].var0 = @"HangTracerThirdPartyHangThreshold";
    result[26].var1 = &self->_runloopHangThirdPartyDurationThresholdMSec;
    result[27].var0 = @"HangTracerFenceTrackingEnabled";
    result[27].var1 = &self->_fenceTrackingEnabled;
    HIDWORD(result[27].var2.var3) = *(_DWORD *)&v67[3];
    HIDWORD(result[27].var3.var3) = *(_DWORD *)&v66[3];
    result[28].var0 = @"HangTracerSlowActPerAppMax";
    result[28].var1 = &self->_slowAppActivationPerAppMaxLogLimit;
    result[29].var0 = @"HangTracerSlowActDailyLogLimit";
    result[29].var1 = &self->_slowAppActivationDailyLogLimit;
    result[30].var0 = @"HangTracerSlowActTailspinsEnabled";
    result[30].var1 = &self->_slowAppActivationTailspinEnabled;
    HIDWORD(result[30].var2.var3) = *(_DWORD *)&v65[3];
    HIDWORD(result[30].var3.var3) = *(_DWORD *)&v64[3];
    result[31].var0 = @"HangTracerSlowActLaunchTailspinThreshold";
    result[31].var1 = &self->_slowAppActivationThresholdMSec;
    int64x2_t v10 = vdupq_n_s64(0x1388uLL);
    result[32].var0 = @"HangTracerEnableSignpostMonitoring";
    result[32].var1 = &self->_signpostMonitoringEnabled;
    result[33].var0 = @"HangTracerSignpostMonitoringDailyLogLimit";
    result[33].var1 = &self->_signpostMonitoringDailyLogLimit;
    result[34].var0 = @"HangTracerSignpostMonitoringPerPeriodLogLimit";
    result[34].var1 = &self->_signpostMonitoringPerPeriodLogLimit;
    result[35].var0 = @"HangTracerEnableAppLaunchMonitoring";
    result[35].var1 = &self->_appLaunchMonitoringEnabled;
    HIDWORD(result[35].var2.var3) = *(_DWORD *)&v61[3];
    HIDWORD(result[35].var3.var3) = *(_DWORD *)&v60[3];
    result[36].var0 = @"HangTracerEnableWorkflowResponsiveness";
    result[36].var1 = &self->_workflowResponsivenessEnabled;
    result[37].var0 = @"HangTracerWorkflowResponsivenessDailyLogLimit";
    result[37].var1 = &self->_workflowResponsivenessDailyLogLimit;
    result[18].var2.var1 = 25;
    result[18].var3.var1 = 25;
    result[20].var2.var1 = 25;
    result[20].var3.var1 = 25;
    result[22].var2.var1 = 25;
    result[22].var3.var1 = 25;
    result[28].var2.var1 = 25;
    result[28].var3.var1 = 25;
    result[29].var2.var1 = 25;
    result[29].var3.var1 = 25;
    result[33].var2.var1 = 25;
    result[33].var3.var1 = 25;
    result[37].var2.var1 = 25;
    result[37].var3.var1 = 25;
    result[38].var0 = @"HangTracerWorkflowResponsivenessPerPeriodLogLimit";
    result[38].var1 = &self->_workflowResponsivenessPerPeriodLogLimit;
    result[19].var2.var1 = 4;
    result[19].var3.var1 = 4;
    result[34].var2.var1 = 4;
    result[34].var3.var1 = 4;
    result[38].var2.var1 = 4;
    result[38].var3.var1 = 4;
    result[39].var0 = @"HangTracerEnableMemoryLogging";
    result[39].var1 = &self->_memoryLoggingEnabled;
    HIDWORD(result[39].var2.var3) = *(_DWORD *)&v57[3];
    HIDWORD(result[39].var3.var3) = *(_DWORD *)&v56[3];
    result[40].var0 = @"HangTracerMemoryLoggingInterval";
    result[40].var1 = &self->_memoryLoggingIntervalSec;
    result[40].var2.var1 = 3600;
    result[40].var3.var1 = 3600;
    result[40].var5 = "initPropertyMemoryLoggingIntervalSec:";
    result[41].var0 = @"EPLEnabledProfile";
    result[41].var1 = &self->_eplEnabledProfile;
    result[42].var0 = @"EPLEnabled";
    result[42].var1 = &self->_eplEnabled;
    HIDWORD(result[42].var2.var3) = *(_DWORD *)&v53[3];
    result[43].var0 = @"EPLTimeoutTimestampSec";
    result[43].var1 = &self->_eplTimeoutTimestampSec;
    result[15].var5 = "initDoubleProperty:";
    result[16].var5 = "initDoubleProperty:";
    result[43].var5 = "initDoubleProperty:";
    result[44].var0 = @"HangTracerReportPeriod";
    result[44].var1 = &self->_reportPeriodMATU;
    result[44].unint64_t var4 = 2LL;
    result[44].var5 = "initPropertyReportPeriod:";
    result[45].var0 = @"HangTracerInternalSettingCreated";
    result[45].var1 = &self->_hasInternalSettings;
    result[45].var5 = "initPropertyHaveInternalSettings:";
    result[46].var0 = @"HangTracerHUDThresholdMSec";
    result[46].var1 = &self->_hudThresholdMSec;
    result[46].var2.var1 = 500;
    result[46].var3.var1 = 500;
    result[7].unint64_t var4 = 0LL;
    result[7].var5 = "initUnsignedIntProperty:";
    result[46].var5 = "initUnsignedIntProperty:";
    result[2].var5 = "initNSStringProperty:";
    result[3].unint64_t var4 = 0LL;
    result[4].var0 = 0LL;
    result[4].unint64_t var4 = 0LL;
    result[10].var0 = 0LL;
    __asm { FMOV            V6.2D, #2.0 }

    *(_OWORD *)&result[15].var2.var0 = _Q6;
    *(_OWORD *)&result[16].var2.var0 = xmmword_100034B00;
    *(int64x2_t *)&result[23].var2.var0 = vdupq_n_s64(0x2328uLL);
    *(int64x2_t *)&result[24].var2.var0 = vdupq_n_s64(0x1F4uLL);
    *(int64x2_t *)&result[25].var2.var0 = vdupq_n_s64(0x7D0uLL);
    result[47].var0 = @"HangTracerThirdPartyDevHangHUDEnabled";
    *(int64x2_t *)&result[26].var2.var0 = vdupq_n_s64(0x3E8uLL);
    result[43].var2 = v7;
    result[47].var1 = &self->_thirdPartyDevHangHUDEnabled;
    result->var2.var0 = 1;
    result->var3.var0 = 0;
    result->unint64_t var4 = 0LL;
    result->var5 = "initBoolProperty:";
    result[1].var2.var0 = 0;
    result[1].var3.var0 = 0;
    result[1].unint64_t var4 = 0LL;
    result[1].var5 = "initBoolProperty:";
    result[2].var2.var3 = 0LL;
    *(_OWORD *)&result[2].var3.var0 = 0u;
    *(_OWORD *)&result[3].var2.var0 = 0u;
    result[4].var2.var0 = 0;
    result[4].var3.var0 = 0;
    result[5].var2.var0 = 0;
    result[5].var3.var0 = 0;
    result[5].unint64_t var4 = 0LL;
    result[5].var5 = "initBoolProperty:";
    result[6].var2.var0 = 1;
    result[6].var3.var0 = 0;
    result[6].unint64_t var4 = 0LL;
    result[6].var5 = "initBoolProperty:";
    result[8].var2.var0 = 0;
    result[8].var3.var0 = 0;
    result[8].unint64_t var4 = 0LL;
    result[8].var5 = "initBoolProperty:";
    result[9].unint64_t var4 = 0LL;
    result[9].var5 = "initNSStringProperty:";
    result[10].var2.var0 = 0;
    result[10].var3.var0 = 0;
    result[10].unint64_t var4 = 0LL;
    result[11].var2.var0 = 0;
    result[11].var3.var0 = 0;
    result[11].unint64_t var4 = 0LL;
    result[11].var5 = "initBoolProperty:";
    result[12].var2.var0 = 1;
    result[12].var3.var0 = 1;
    result[12].unint64_t var4 = 0LL;
    result[12].var5 = "initBoolProperty:";
    result[13].var2.var0 = 0;
    result[13].var3.var0 = 0;
    result[13].unint64_t var4 = 0LL;
    result[13].var5 = "initBoolProperty:";
    result[14].var2.var0 = 1;
    result[14].var3.var0 = 1;
    result[14].unint64_t var4 = 0LL;
    result[14].var5 = "initBoolProperty:";
    result[15].unint64_t var4 = 0LL;
    result[16].unint64_t var4 = 0LL;
    result[17].unint64_t var4 = 0LL;
    result[17].var5 = "initIntProperty:";
    result[18].unint64_t var4 = 0LL;
    result[18].var5 = "initIntProperty:";
    result[19].unint64_t var4 = 0LL;
    result[19].var5 = "initIntProperty:";
    result[20].unint64_t var4 = 0LL;
    result[20].var5 = "initIntProperty:";
    result[21].unint64_t var4 = 0LL;
    result[21].var5 = "initIntProperty:";
    result[22].unint64_t var4 = 0LL;
    result[22].var5 = "initIntProperty:";
    result[23].unint64_t var4 = 1LL;
    result[23].var5 = "initUnsignedLongProperty:";
    result[24].unint64_t var4 = 1LL;
    result[24].var5 = "initUnsignedLongProperty:";
    result[25].unint64_t var4 = 1LL;
    result[25].var5 = "initUnsignedLongProperty:";
    result[26].unint64_t var4 = 1LL;
    result[26].var5 = "initUnsignedLongProperty:";
    result[27].var2.var0 = 1;
    result[27].var3.var0 = 1;
    result[27].unint64_t var4 = 0LL;
    result[27].var5 = "initBoolProperty:";
    result[28].unint64_t var4 = 0LL;
    result[28].var5 = "initIntProperty:";
    result[29].unint64_t var4 = 0LL;
    result[29].var5 = "initIntProperty:";
    result[30].var2.var0 = 0;
    result[30].var3.var0 = 0;
    result[30].unint64_t var4 = 0LL;
    result[30].var5 = "initBoolProperty:";
    *(int64x2_t *)&result[31].var2.var0 = v10;
    result[38].unint64_t var4 = 0LL;
    result[38].var5 = "initIntProperty:";
    result[31].unint64_t var4 = 1LL;
    result[31].var5 = "initUnsignedLongProperty:";
    result[32].var2.var0 = 1;
    result[32].var3.var0 = 0;
    result[37].unint64_t var4 = 0LL;
    result[37].var5 = "initIntProperty:";
    result[32].unint64_t var4 = 0LL;
    result[32].var5 = "initBoolProperty:";
    result[33].unint64_t var4 = 0LL;
    result[36].var3.var0 = 0;
    result[36].unint64_t var4 = 0LL;
    result[36].var5 = "initBoolProperty:";
    result[33].var5 = "initIntProperty:";
    result[34].unint64_t var4 = 0LL;
    result[34].var5 = "initIntProperty:";
    result[35].unint64_t var4 = 0LL;
    result[35].var5 = "initBoolProperty:";
    result[36].var2.var0 = 1;
    result[35].var2.var0 = 1;
    result[35].var3.var0 = 0;
    result[39].var2.var0 = 1;
    result[39].var3.var0 = 0;
    result[39].unint64_t var4 = 0LL;
    result[39].var5 = "initBoolProperty:";
    result[40].unint64_t var4 = 1LL;
    result[41].var2.var0 = 0;
    result[41].var3.var0 = 0;
    result[41].unint64_t var4 = 0LL;
    result[41].var5 = "initBoolProperty:";
    result[42].var2.var0 = 0;
    result[42].var3.var0 = 0;
    result[42].unint64_t var4 = 0LL;
    result[42].var5 = "initBoolProperty:";
    result[43].var3 = v9;
    result[43].unint64_t var4 = 0LL;
    *(int64x2_t *)&result[44].var2.var0 = vdupq_n_s64(0x40AC200000000000uLL);
    result[45].var2.var0 = 0;
    result[45].var3.var0 = 0;
    result[45].unint64_t var4 = 0LL;
    result[46].unint64_t var4 = 1LL;
    result[47].var2.var0 = 0;
    result[47].var3.var0 = 0;
    result[47].unint64_t var4 = 0LL;
    result[47].var5 = "initBoolProperty:";
    result[48].var0 = @"HangTracerThirdPartyIncludeNonDevelopmentApps";
    result[48].var1 = &self->_thirdPartyIncludeNonDevelopmentApps;
    result[48].var2.var0 = 0;
    HIDWORD(result[48].var2.var3) = *(_DWORD *)&v47[3];
    *(_DWORD *)(&result[48].var2.var0 + 1) = *(_DWORD *)v47;
    result[48].var3.var0 = 0;
    HIDWORD(result[48].var3.var3) = *(_DWORD *)&v46[3];
    *(_DWORD *)(&result[48].var3.var0 + 1) = *(_DWORD *)v46;
    result[48].unint64_t var4 = 0LL;
    result[48].var5 = "initBoolProperty:";
    result[49].var0 = @"HangTracerThirdPartyDevBootSessionUUID";
    result[49].var1 = &self->_thirdPartyDevBootSessionUUID;
    result[49].unint64_t var4 = 0LL;
    *(_OWORD *)&result[49].var2.var0 = 0u;
    result[49].var5 = "initNSStringProperty:";
    result[50].var0 = @"HangTracerThirdPartyDevPreferredLanguages";
    result[50].var1 = &self->_thirdPartyDevPreferredLanguages;
    result[50].unint64_t var4 = 0LL;
    *(_OWORD *)&result[50].var2.var0 = 0u;
    result[50].var5 = "initPropertyThirdPartyDevPreferredLanguages:";
    result[51].var0 = @"HangTracerHangWaitTimeoutDuration";
    result[51].var1 = &self->_hangWaitTimeoutDurationMSec;
    *(int64x2_t *)&result[51].var2.var0 = v10;
    result[51].unint64_t var4 = 0LL;
    result[51].var5 = "initUnsignedLongProperty:";
    result[52].var0 = @"enableLoggingForPoster";
    result[52].var1 = &self->_enableLoggingForPoster;
    result[52].var2.var0 = 0;
    HIDWORD(result[52].var2.var3) = *(_DWORD *)&v45[3];
    *(_DWORD *)(&result[52].var2.var0 + 1) = *(_DWORD *)v45;
    result[52].var3.var0 = 0;
    HIDWORD(result[52].var3.var3) = *(_DWORD *)&v44[3];
    *(_DWORD *)(&result[52].var3.var0 + 1) = *(_DWORD *)v44;
    result[52].unint64_t var4 = 0LL;
    result[52].var5 = "initBoolProperty:";
    result[53].var0 = @"enableLoggingForWidgetRenderer";
    result[53].var1 = &self->_enableLoggingForWidgetRenderer;
    result[53].var2.var0 = 0;
    HIDWORD(result[53].var2.var3) = *(_DWORD *)&v43[3];
    *(_DWORD *)(&result[53].var2.var0 + 1) = *(_DWORD *)v43;
    result[53].var3.var0 = 0;
    HIDWORD(result[53].var3.var3) = *(_DWORD *)&v42[3];
    *(_DWORD *)(&result[53].var3.var0 + 1) = *(_DWORD *)v42;
    result[53].unint64_t var4 = 0LL;
    result[53].var5 = "initBoolProperty:";
    result[54].var0 = @"PDSEPrefHTRateOnlyKillSwitch";
    result[54].var1 = &self->_pdseHTRateOnlyKillSwitch;
    result[54].var2.var0 = 1;
    HIDWORD(result[54].var2.var3) = *(_DWORD *)&v41[3];
    *(_DWORD *)(&result[54].var2.var0 + 1) = *(_DWORD *)v41;
    result[54].var3.var0 = 1;
    HIDWORD(result[54].var3.var3) = *(_DWORD *)&v40[3];
    *(_DWORD *)(&result[54].var3.var0 + 1) = *(_DWORD *)v40;
    result[54].unint64_t var4 = 0LL;
    result[54].var5 = "initBoolProperty:";
    result[55].var0 = @"PDSEPrefHTThirdPartyKillSwitch";
    result[55].var1 = &self->_pdseHTThirdPartyKillSwitch;
    result[55].var2.var0 = 1;
    HIDWORD(result[55].var2.var3) = *(_DWORD *)&v39[3];
    *(_DWORD *)(&result[55].var2.var0 + 1) = *(_DWORD *)v39;
    result[55].var3.var0 = 1;
    HIDWORD(result[55].var3.var3) = *(_DWORD *)&v38[3];
    *(_DWORD *)(&result[55].var3.var0 + 1) = *(_DWORD *)v38;
    result[55].unint64_t var4 = 0LL;
    result[55].var5 = "initBoolProperty:";
    result[56].var0 = @"PDSEPrefSentryKillSwitch";
    result[56].var1 = &self->_pdseSentryKillSwitch;
    result[56].var2.var0 = 1;
    HIDWORD(result[56].var2.var3) = *(_DWORD *)&v37[3];
    *(_DWORD *)(&result[56].var2.var0 + 1) = *(_DWORD *)v37;
    result[56].var3.var0 = 1;
    HIDWORD(result[56].var3.var3) = *(_DWORD *)&v36[3];
    *(_DWORD *)(&result[56].var3.var0 + 1) = *(_DWORD *)v36;
    result[56].unint64_t var4 = 0LL;
    result[56].var5 = "initBoolProperty:";
    result[57].var0 = @"PDSEPrefCATailspinKillSwitch";
    result[57].var1 = &self->_pdseCATailspinKillSwitch;
    result[57].var2.var0 = 1;
    HIDWORD(result[57].var2.var3) = *(_DWORD *)&v35[3];
    *(_DWORD *)(&result[57].var2.var0 + 1) = *(_DWORD *)v35;
    result[57].var3.var0 = 1;
    HIDWORD(result[57].var3.var3) = *(_DWORD *)&v34[3];
    *(_DWORD *)(&result[57].var3.var0 + 1) = *(_DWORD *)v34;
    result[57].unint64_t var4 = 0LL;
    result[57].var5 = "initBoolProperty:";
    result[58].var0 = @"PDSEPrefAppLaunchKillSwitch";
    result[58].var2.var0 = 1;
    HIDWORD(result[58].var2.var3) = *(_DWORD *)&v33[3];
    *(_DWORD *)(&result[58].var2.var0 + 1) = *(_DWORD *)v33;
    result[58].var3.var0 = 1;
    HIDWORD(result[58].var3.var3) = *(_DWORD *)&v32[3];
    *(_DWORD *)(&result[58].var3.var0 + 1) = *(_DWORD *)v32;
    result[58].unint64_t var4 = 0LL;
    result[58].var5 = "initBoolProperty:";
    result[59].var2.var0 = 1;
    HIDWORD(result[59].var2.var3) = *(_DWORD *)&v31[3];
    *(_DWORD *)(&result[59].var2.var0 + 1) = *(_DWORD *)v31;
    result[59].var3.var0 = 1;
    HIDWORD(result[59].var3.var3) = *(_DWORD *)&v30[3];
    *(_DWORD *)(&result[59].var3.var0 + 1) = *(_DWORD *)v30;
    result[59].unint64_t var4 = 0LL;
    result[59].var5 = "initBoolProperty:";
    result[60].var2.var1 = 0x7FFFFFFF;
    result[60].var3.var1 = 0x7FFFFFFF;
    result[60].unint64_t var4 = 0LL;
    result[60].var5 = "initIntProperty:";
    result[61].var2.var1 = 0x7FFFFFFF;
    result[61].var3.var1 = 0x7FFFFFFF;
    result[61].unint64_t var4 = 0LL;
    result[61].var5 = "initIntProperty:";
    result[62].var2.var1 = 0x7FFFFFFF;
    result[62].var3.var1 = 0x7FFFFFFF;
    result[62].unint64_t var4 = 0LL;
    result[62].var5 = "initIntProperty:";
    result[63].var2.var1 = 0x7FFFFFFF;
    result[63].var3.var1 = 0x7FFFFFFF;
    result[63].unint64_t var4 = 0LL;
    result[63].var5 = "initIntProperty:";
    result[64].var2.var1 = 0x7FFFFFFF;
    result[64].var3.var1 = 0x7FFFFFFF;
    result[64].unint64_t var4 = 0LL;
    result[64].var5 = "initIntProperty:";
    result[65].var2.var1 = 0x7FFFFFFF;
    result[65].var3.var1 = 0x7FFFFFFF;
    result[65].unint64_t var4 = 0LL;
    result[65].var5 = "initIntProperty:";
    result[66].var2.var1 = 0x7FFFFFFF;
    result[66].var3.var1 = 0x7FFFFFFF;
    result[66].unint64_t var4 = 0LL;
    result[66].var5 = "initIntProperty:";
    result[67].var2.var0 = 1;
    *(_DWORD *)(&result[67].var2.var0 + 1) = *(_DWORD *)v29;
    HIDWORD(result[67].var2.var3) = *(_DWORD *)&v29[3];
    result[67].var3.var0 = 1;
    *(_DWORD *)(&result[67].var3.var0 + 1) = *(_DWORD *)v28;
    HIDWORD(result[67].var3.var3) = *(_DWORD *)&v28[3];
    result[67].unint64_t var4 = 0LL;
    result[67].var5 = "initBoolProperty:";
    result[68].var2.var0 = 0;
    HIDWORD(result[68].var2.var3) = *(_DWORD *)&v27[3];
    *(_DWORD *)(&result[68].var2.var0 + 1) = *(_DWORD *)v27;
    result[68].var3.var0 = 0;
    HIDWORD(result[68].var3.var3) = *(_DWORD *)&v26[3];
    *(_DWORD *)(&result[68].var3.var0 + 1) = *(_DWORD *)v26;
    result[68].unint64_t var4 = 0LL;
    result[68].var5 = "initBoolProperty:";
    result[69].var2.var1 = 200;
    result[69].var3.var1 = 1000;
    result[69].unint64_t var4 = 0LL;
    result[69].var5 = "initIntProperty:";
    result[70].var2.var0 = 1;
    HIDWORD(result[70].var2.var3) = *(_DWORD *)&v25[3];
    *(_DWORD *)(&result[70].var2.var0 + 1) = *(_DWORD *)v25;
    result[70].var3.var0 = 1;
    HIDWORD(result[70].var3.var3) = *(_DWORD *)&v24[3];
    *(_DWORD *)(&result[70].var3.var0 + 1) = *(_DWORD *)v24;
    result[70].unint64_t var4 = 0LL;
    result[70].var5 = "initBoolProperty:";
    result[71].var2.var0 = 0;
    HIDWORD(result[71].var2.var3) = *(_DWORD *)&v23[3];
    *(_DWORD *)(&result[71].var2.var0 + 1) = *(_DWORD *)v23;
    result[71].var3.var0 = 0;
    HIDWORD(result[71].var3.var3) = *(_DWORD *)&v22[3];
    *(_DWORD *)(&result[71].var3.var0 + 1) = *(_DWORD *)v22;
    result[71].unint64_t var4 = 0LL;
    result[71].var5 = "initBoolProperty:";
    result[72].var2.var0 = 0;
    HIDWORD(result[72].var2.var3) = *(_DWORD *)&v21[3];
    *(_DWORD *)(&result[72].var2.var0 + 1) = *(_DWORD *)v21;
    result[72].var3.var0 = 0;
    HIDWORD(result[72].var3.var3) = *(_DWORD *)&v20[3];
    *(_DWORD *)(&result[72].var3.var0 + 1) = *(_DWORD *)v20;
    result[72].unint64_t var4 = 0LL;
    result[72].var5 = "initBoolProperty:";
    result[73].var2.var1 = 0;
    result[73].var3.var1 = 0;
    result[73].unint64_t var4 = 0LL;
    result[73].var5 = "initIntProperty:";
    result[74].var2.var0 = 0;
    HIDWORD(result[74].var2.var3) = *(_DWORD *)&v19[3];
    *(_DWORD *)(&result[74].var2.var0 + 1) = *(_DWORD *)v19;
    result[74].var3.var0 = 0;
    HIDWORD(result[74].var3.var3) = *(_DWORD *)&v18[3];
    *(_DWORD *)(&result[74].var3.var0 + 1) = *(_DWORD *)v18;
    result[74].unint64_t var4 = 0LL;
    result[74].var5 = "initBoolProperty:";
    *(_OWORD *)&result[75].var0 = 0u;
    result[75].var2.var0 = 0;
    HIDWORD(result[75].var2.var3) = 0;
    *(_DWORD *)(&result[75].var2.var0 + 1) = 0;
    result[75].var3.var0 = 0;
    result[75].var5 = 0LL;
    *(_OWORD *)(&result[75].var3.var0 + 1) = v86;
  }

  return result;
}

- (BOOL)shouldDisplayFenceHangToHUD
{
  if (-[HTPrefs hudEnabled](self, "hudEnabled") && -[HTPrefs isInternal](self, "isInternal"))
  {
    LOBYTE(v3) = 1;
  }

  else
  {
    BOOL v3 = -[HTPrefs thirdPartyDevHangHUDEnabled](self, "thirdPartyDevHangHUDEnabled");
    if (v3) {
      LOBYTE(v3) = +[HTProcessInfo isAnyThirdPartyDeveloperProcessForeground]( &OBJC_CLASS___HTProcessInfo,  "isAnyThirdPartyDeveloperProcessForeground");
    }
  }

  return v3;
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

- (id)getBootSessionUUID
{
  if (qword_10005BB80 != -1) {
    dispatch_once(&qword_10005BB80, &stru_100049A28);
  }
  return (id)qword_10005BB88;
}

- (void)savePreferencesForRestoration:(id)a3 withDomain:(id)a4 prefix:(id)a5
{
  id v7 = a3;
  HTPrefDefaultVal v8 = (__CFString *)a4;
  id v9 = a5;
  v28 = v8;
  if ((-[__CFString isEqual:](v8, "isEqual:", @"com.apple.hangtracer") & 1) == 0)
  {
    id v10 = sub_1000145E8(v9);
    int v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ([v11 count])
    {
      int v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      v27 = v11;
      id v13 = v11;
      id v14 = [v13 countByEnumeratingWithState:&v34 objects:v43 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v35;
        do
        {
          for (i = 0LL; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v35 != v16) {
              objc_enumerationMutation(v13);
            }
            __int16 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  v9,  *(void *)(*((void *)&v34 + 1) + 8LL * (void)i)));
            [v12 addObject:v18];
          }

          id v15 = [v13 countByEnumeratingWithState:&v34 objects:v43 count:16];
        }

        while (v15);
      }

      __int128 v32 = 0u;
      __int128 v33 = 0u;
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      id obj = v7;
      id v19 = [obj countByEnumeratingWithState:&v30 objects:v42 count:16];
      if (v19)
      {
        id v20 = v19;
        uint64_t v21 = *(void *)v31;
        do
        {
          for (j = 0LL; j != v20; j = (char *)j + 1)
          {
            if (*(void *)v31 != v21) {
              objc_enumerationMutation(obj);
            }
            v23 = *(const __CFString **)(*((void *)&v30 + 1) + 8LL * (void)j);
            if ([v12 containsObject:v23])
            {
              id v24 = sub_1000233A4();
              v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v39 = v23;
                __int16 v40 = 2112;
                id v41 = v9;
                _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Saving Setting Key for restoration: %@ that matches prefix: %@",  buf,  0x16u);
              }

              CFPropertyListRef v26 = CFPreferencesCopyValue(v23, v28, @"mobile", kCFPreferencesAnyHost);
              CFPreferencesSetValue( (CFStringRef)+[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  @"HTSavedForRestoration",  v23),  v26,  v28,  @"mobile",  kCFPreferencesAnyHost);
              if (v26) {
                CFRelease(v26);
              }
            }
          }

          id v20 = [obj countByEnumeratingWithState:&v30 objects:v42 count:16];
        }

        while (v20);
      }

      int v11 = v27;
    }
  }
}

- (BOOL)compareBootSessionUUIDAndClearPreferencesWithDomain:(id)a3 prefix:(id)a4
{
  HTPrefDefaultVal v6 = (__CFString *)a3;
  id v33 = a4;
  id v7 = sub_100027AD0(v6, @"mobile", (uint64_t)v33);
  HTPrefDefaultVal v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if ([v8 count])
  {
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v38 objects:v47 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v39;
LABEL_4:
      uint64_t v13 = 0LL;
      while (1)
      {
        if (*(void *)v39 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v38 + 1) + 8 * v13);
        if (v11 == (id)++v13)
        {
          id v11 = [v9 countByEnumeratingWithState:&v38 objects:v47 count:16];
          if (v11) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }

      uint64_t v16 = v14;

      if (v16)
      {
        CFPropertyListRef v17 = CFPreferencesCopyValue(v16, v6, @"mobile", kCFPreferencesAnyHost);
        id v15 = (void *)v17;
        if (v17 && (objc_opt_respondsToSelector(v17, "isEqualToString:") & 1) != 0)
        {
          __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(-[HTPrefs getBootSessionUUID](self, "getBootSessionUUID"));
          unsigned __int8 v19 = [v15 isEqualToString:v18];

          if ((v19 & 1) != 0) {
            goto LABEL_28;
          }
          __int128 v31 = v16;
          __int128 v32 = v8;
          char v30 = v19 ^ 1;
          -[HTPrefs savePreferencesForRestoration:withDomain:prefix:]( self,  "savePreferencesForRestoration:withDomain:prefix:",  v9,  v6,  v33);
          __int128 v36 = 0u;
          __int128 v37 = 0u;
          __int128 v34 = 0u;
          __int128 v35 = 0u;
          id v20 = v9;
          id v21 = [v20 countByEnumeratingWithState:&v34 objects:v46 count:16];
          if (v21)
          {
            id v22 = v21;
            uint64_t v23 = *(void *)v35;
            do
            {
              for (i = 0LL; i != v22; i = (char *)i + 1)
              {
                if (*(void *)v35 != v23) {
                  objc_enumerationMutation(v20);
                }
                v25 = *(const __CFString **)(*((void *)&v34 + 1) + 8LL * (void)i);
                id v26 = sub_1000233A4();
                v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
                if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v43 = v25;
                  __int16 v44 = 2112;
                  id v45 = v33;
                  _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Removing Setting Key: %@ that matches prefix: %@",  buf,  0x16u);
                }

                CFPreferencesSetValue(v25, 0LL, v6, @"mobile", kCFPreferencesAnyHost);
              }

              id v22 = [v20 countByEnumeratingWithState:&v34 objects:v46 count:16];
            }

            while (v22);
          }

          -[HTPrefs setShouldPostHTPrefsChangedNotification:](self, "setShouldPostHTPrefsChangedNotification:", 1LL);
          uint64_t v16 = v31;
          HTPrefDefaultVal v8 = v32;
          BOOL v28 = v30;
LABEL_29:

          goto LABEL_30;
        }
      }

      id v15 = 0LL;
      goto LABEL_28;
    }

- (void)refreshHTPrefs
{
  id v3 = sub_1000233A4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(v15[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "HTPrefs: Refreshing preferences",  (uint8_t *)v15,  2u);
  }

  int v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  self->__profilePath));
  installedHTProfileDict = self->__installedHTProfileDict;
  self->__installedHTProfileDict = v5;

  CFPreferencesAppSynchronize(self->__htTaskingDomain);
  CFPreferencesAppSynchronize(self->__htDomain);
  id v7 = -[HTPrefs earlyInitNecessaryPrefs](self, "earlyInitNecessaryPrefs");
  if (!self->_isInternal)
  {
    if (AMFIIsDeveloperModeEnabled(v7))
    {
      id v8 = sub_1000233A4();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v15[0]) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Skipping boot session UUID comparison because the device is in developer mode.",  (uint8_t *)v15,  2u);
      }
    }

    else if (-[HTPrefs compareBootSessionUUIDAndClearPreferencesWithDomain:prefix:]( self,  "compareBootSessionUUIDAndClearPreferencesWithDomain:prefix:",  self->__htTaskingDomain,  @"HTThirdPartyDevSupport"))
    {
      sub_100011C8C(0);
    }
  }

  id v10 = -[HTPrefs prefInitList](self, "prefInitList");
  v15[0] = @"HangTracerEnabled";
  v15[1] = &self->_hangtracerDaemonEnabled;
  char v16 = 1;
  char v17 = 0;
  uint64_t v18 = 0LL;
  unsigned __int8 v19 = "initPropertyHangtracerDaemonEnabled:";
  -[HTPrefs initPropertyHangtracerDaemonEnabled:](self, "initPropertyHangtracerDaemonEnabled:", v15);
  for (i = v10->var5; i; ++v10)
  {
    objc_msgSend(self, i, v10);
    i = v10[1].var5;
  }

  if (-[HTPrefs shouldPostHTPrefsChangedNotification](self, "shouldPostHTPrefsChangedNotification"))
  {
    -[HTPrefs setShouldPostHTPrefsChangedNotification:](self, "setShouldPostHTPrefsChangedNotification:", 0LL);
    id v12 = sub_1000233A4();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = @"com.apple.hangtracer.htprefs.refreshed";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Posting notification %@", buf, 0xCu);
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v14 postNotificationName:@"com.apple.hangtracer.htprefs.refreshed" object:self userInfo:0];
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
  id v15 = "initPropertyIsInternal:";
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
    id v5 = sub_1000233A4();
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

  CFPreferencesSetValue( @"HangTracerInternalSettingsVersion",  &off_1000509F8,  self->__htTaskingDomain,  @"mobile",  kCFPreferencesAnyHost);
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
    sub_10002D4A4();
  }
  id v5 = v4;
  -[HTPrefs setupPrefsWithQueue:profilePath:taskingDomainName:hangtracerDomain:setupInternalPrefs:]( self,  "setupPrefsWithQueue:profilePath:taskingDomainName:hangtracerDomain:setupInternalPrefs:",  v4,  @"/Library/Managed Preferences/mobile/.GlobalPreferences.plist",  @"com.apple.da",  @"com.apple.hangtracer",  1LL);
}

- (void)setupPrefsWithQueue:(id)a3 profilePath:(id)a4 taskingDomainName:(__CFString *)a5 hangtracerDomain:(__CFString *)a6 setupInternalPrefs:(BOOL)a7
{
  BOOL v7 = a7;
  char v12 = (dispatch_queue_s *)a3;
  id v24 = a4;
  id v13 = sub_1000233A4();
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "HTPrefs initialization", buf, 2u);
  }

  objc_storeStrong((id *)&self->__profilePath, a4);
  self->__htTaskingDomain = a5;
  self->__htDomain = a6;
  *(_WORD *)&self->_shouldAllowSentryEnablement = 0;
  -[HTPrefs earlyInitNecessaryPrefs](self, "earlyInitNecessaryPrefs");
  if (v7) {
    -[HTPrefs __createInternalSettings](self, "__createInternalSettings", v24);
  }
  dispatch_queue_attr_t v15 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, 0);
  __int128 v16 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v15);
  __int128 v17 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.hangtracer.preferences", v16, v12);
  prefsQueue = self->__prefsQueue;
  self->__prefsQueue = v17;

  objc_initWeak(location, self);
  *(void *)buf = 0LL;
  v52 = buf;
  uint64_t v53 = 0x2020000000LL;
  uint64_t v48 = 0LL;
  v49 = (int *)&v48;
  uint64_t v50 = 0x2020000000LL;
  uint64_t v45 = 0LL;
  v46 = (int *)&v45;
  uint64_t v47 = 0x2020000000LL;
  uint64_t v42 = 0LL;
  v43 = (int *)&v42;
  uint64_t v44 = 0x2020000000LL;
  uint64_t v39 = 0LL;
  __int128 v40 = (int *)&v39;
  uint64_t v41 = 0x2020000000LL;
  uint64_t v36 = 0LL;
  __int128 v37 = (int *)&v36;
  uint64_t v38 = 0x2020000000LL;
  uint64_t v33 = 0LL;
  __int128 v34 = (int *)&v33;
  uint64_t v35 = 0x2020000000LL;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_100021184;
  v31[3] = &unk_100049A50;
  v31[5] = buf;
  v31[6] = &v48;
  _BYTE v31[7] = &v45;
  v31[8] = &v42;
  v31[9] = &v39;
  objc_copyWeak(&v32, location);
  v31[4] = self;
  unsigned __int8 v19 = objc_retainBlock(v31);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_1000214F8;
  v30[3] = &unk_100049A78;
  v30[4] = &v33;
  id v20 = objc_retainBlock(v30);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_100021594;
  v29[3] = &unk_100049AA0;
  v29[4] = self;
  v29[5] = &v36;
  id v21 = objc_retainBlock(v29);
  notify_register_dispatch(off_10005B068, v37 + 6, (dispatch_queue_t)self->__prefsQueue, v21);
  notify_register_dispatch(off_10005B040[0], v43 + 6, (dispatch_queue_t)self->__prefsQueue, v19);
  notify_register_dispatch(off_10005B028[0], (int *)v52 + 6, (dispatch_queue_t)self->__prefsQueue, v19);
  notify_register_dispatch(off_10005B030[0], v49 + 6, (dispatch_queue_t)self->__prefsQueue, v19);
  notify_register_dispatch(off_10005B038[0], v46 + 6, (dispatch_queue_t)self->__prefsQueue, v19);
  notify_register_dispatch(off_10005B050[0], v40 + 6, (dispatch_queue_t)self->__prefsQueue, v19);
  notify_register_dispatch(off_10005B048[0], v34 + 6, (dispatch_queue_t)self->__prefsQueue, v20);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10002161C;
  v26[3] = &unk_100049AC8;
  v26[4] = self;
  id v22 = objc_retainBlock(v26);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100021778;
  v25[3] = &unk_100049AC8;
  v25[4] = self;
  uint64_t v23 = objc_retainBlock(v25);
  notify_register_dispatch(off_10005B058[0], &out_token, (dispatch_queue_t)self->__prefsQueue, v22);
  notify_register_dispatch(off_10005B060[0], &v27, (dispatch_queue_t)self->__prefsQueue, v23);
  -[HTPrefs setShouldPostHTPrefsChangedNotification:](self, "setShouldPostHTPrefsChangedNotification:", 1LL);
  -[HTPrefs refreshHTPrefs](self, "refreshHTPrefs");

  objc_destroyWeak(&v32);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(buf, 8);
  objc_destroyWeak(location);
}

- (void)_removeAllPrefs
{
  v22[0] = @"HangTracerInternalSettingCreated";
  v22[1] = @"HangTracerInternalSettingsVersion";
  v22[2] = @"HangTracerReportPeriod";
  v22[3] = @"HangTracerEnableCustomerMode";
  v22[4] = @"HangTracerEnabled";
  v22[5] = @"HangTracerThirdPartyRunloopLogsEnabled";
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
      id v11 = 0LL;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(&__NSArray0__struct);
        }
        CFPreferencesSetValue( *(CFStringRef *)(*((void *)&v12 + 1) + 8LL * (void)v11),  0LL,  self->__htDomain,  @"mobile",  kCFPreferencesAnyHost);
        id v11 = (char *)v11 + 1;
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