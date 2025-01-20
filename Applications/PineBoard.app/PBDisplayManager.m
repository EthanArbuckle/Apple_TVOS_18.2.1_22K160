@interface PBDisplayManager
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (BOOL)shouldAllowModeSwitchForDynamicFrameRate;
+ (BOOL)shouldAllowModeSwitchForDynamicRange;
+ (PBDependencyDescription)dependencyDescription;
+ (PBDisplayManager)sharedInstance;
+ (id)sharedInstanceIfExists;
+ (unint64_t)migrateDisplayModes:(id)a3 error:(id *)a4;
+ (unint64_t)migratePreferenceKeyToDisplayIdentifier:(id)a3;
+ (unint64_t)migrateWithContext:(id)a3 error:(id *)a4;
+ (void)enumerateMutableDisplayPreferencesUsingBlock:(id)a3;
+ (void)reevaluateAtmosCapabilities;
- (BOOL)_debugAlwaysSaveModeEnabled;
- (BOOL)_isModeSwitchInProgress;
- (BOOL)_shouldModeSwitchForBundleIdentifier:(id)a3;
- (BOOL)_shouldPreferDolbyVisionLowLatency;
- (BOOL)atmosEnabled;
- (BOOL)canHandleHighBandwidthModes;
- (BOOL)deemed4KCapable;
- (BOOL)detectedPoorCableConnection;
- (BOOL)didCompleteDisplayAssistantForCurrentDisplay;
- (BOOL)displaySupportsHDR10Plus;
- (BOOL)displaySupportsQMS;
- (BOOL)displaySupportsVRR;
- (BOOL)filteredUsingdPineBoardPolicy;
- (BOOL)hdr10PlusMetadataEnabled;
- (BOOL)isAdvertisingHDMI2;
- (BOOL)isModeSwitchNeededForTransitionToBundleIdentifier:(id)a3;
- (BOOL)isPresentingDisplayAssistant;
- (BOOL)readAtmosEnabled;
- (BOOL)readCanDoHighBandwidth;
- (BOOL)readDetectedPoorCableConnection;
- (BOOL)readDidCompleteDisplayAssistant;
- (BOOL)readHDR10PlusMetadataEnabled;
- (BOOL)readShouldModeSwitchForDynamicRange;
- (BOOL)readShouldModeSwitchForFrameRate;
- (BOOL)readShouldUseQMSForFrameRateSwitching;
- (BOOL)shouldModeSwitchForDynamicRange;
- (BOOL)shouldModeSwitchForFrameRate;
- (BOOL)shouldUseQMSForFrameRateSwitching;
- (BOOL)usesDolbyLowLatency;
- (BSInvalidatable)stateCaptureHandle;
- (CGSize)readSoftwareDisplaySize;
- (CGSize)softwareDisplaySize;
- (NSArray)blackScreenRecoveryDisplayModes;
- (NSArray)sortedDisplayModes;
- (NSDictionary)audioLatencies;
- (NSDictionary)colorCalibrations;
- (NSDictionary)memoryStore;
- (NSDictionary)serialisedState;
- (NSHashTable)stateObservers;
- (NSMutableArray)matchContentRequestedModes;
- (NSMutableDictionary)nextEstablishModePerDisplays;
- (NSNumber)displayConnectionToNotify;
- (NSNumber)presentedDisplayAssistantKind;
- (NSSet)encodedPromotedDisplayModes;
- (NSSet)seenDisplayIDs;
- (NSString)currentDisplayID;
- (NSString)currentDisplayIdentifier;
- (NSUserDefaults)defaults;
- (OS_dispatch_queue)displayUpdateQueue;
- (OS_dispatch_source)cableCheckTimer;
- (OS_dispatch_source)displayIDStabilizer;
- (OS_dispatch_source)notifyClientsSource;
- (OS_dispatch_source)reloadStateSource;
- (PBBulletinService)bulletinService;
- (PBCableSignalInfo)lastCableErrorInfo;
- (PBDisplayManager)init;
- (PBMultiLatch)wakeProgressLatch;
- (PBSDisplayManagerUpdateRequest)priorDisplayUpdateRequest;
- (PBSDisplayMode)currentDisplayMode;
- (PBSDisplayMode)fallbackDisplayMode;
- (PBSDisplayMode)userSelectedDisplayMode;
- (SSDisplay)systemState;
- (UIApplicationSceneDeactivationAssertion)noScreenAssertion;
- (double)_historyWindowInterval;
- (double)_pollingInterval;
- (double)baseCableCheckTimeInterval;
- (double)localeRefreshRate;
- (double)readCableAlertIntervalOverride;
- (double)readCableCheckCumulativeTime;
- (double)readCableErrorPollingIntervalOverride;
- (double)readCableHistoryWindowOverride;
- (double)readUserPreferredRefreshRate;
- (double)recalculatedCurrentLocaleRefreshRate;
- (double)userPreferredRefreshRate;
- (id)_bestDisplayModeForDynamicRange:(int64_t)a3 frameRate:(double)a4;
- (id)_bestSDRDisplayMode;
- (id)_currentResolutionsPreferencesFromPersistentStore:(BOOL)a3;
- (id)_currentResolutionsPreferencesFromPersistentStore:(BOOL)a3 forDisplayID:(id)a4;
- (id)_displayModeForDisplayID:(id)a3;
- (id)_displayModePredicatesForDynamicRange:(int64_t)a3 frameRate:(double)a4;
- (id)_fallbackPredicatesForDynamicRange:(int64_t)a3 frameRates:(id)a4;
- (id)_findDisplayModeFromPredicate:(id)a3;
- (id)_init;
- (id)_locateLikelyOriginalDisplayPrefsForNewIdentifier:(id)a3 fromSet:(id)a4;
- (id)_readDisplayModeForKey:(id)a3 persisted:(BOOL)a4;
- (id)_recalculatedBlackScreenRecoveryDisplayModes;
- (id)_recalculatedDisplayModesFromCoreAnimationModes:(id)a3;
- (id)audioLatencyForDisplayMode:(id)a3;
- (id)colorCalibrationForDisplayMode:(id)a3;
- (id)filterModes:(id)a3;
- (id)findFirstMode:(id)a3;
- (id)findMatchingCAMode:(id)a3;
- (id)findMatchingLocaleMode:(id)a3 enforceVirtualCheck:(BOOL)a4;
- (id)preferredDisplayModeForBundleIdentifier:(id)a3;
- (id)promotedVirtualDisplayModes;
- (id)readAudioLatencies;
- (id)readColorCalibrations;
- (id)readEncodedPromotedDisplayModes;
- (id)readLastCableErrorInfo;
- (id)readSeenDisplayIDs;
- (id)readUserSelectedDisplayMode;
- (id)stateDumpBuilder;
- (int)readCableScoreOverride;
- (int64_t)colorCalibrationStatusForDisplayMode:(id)a3;
- (int64_t)displayConnection;
- (int64_t)eARCStatus;
- (int64_t)lastCablePollStatus;
- (int64_t)reportingValueForMatchDynamicRange;
- (int64_t)reportingValueForMatchFrameRate;
- (int64_t)reportingValueForUseDiscreteMediaRefreshRate;
- (void)_applyAudioLatencyIfNeeded;
- (void)_applyColorCalibrationIfNeeded;
- (void)_completeReloadingState;
- (void)_considerDisplayModeSwitchFinished:(id)a3;
- (void)_mediaServicesWereReset:(id)a3;
- (void)_notifyDisplayModeChange:(BOOL)a3;
- (void)_notifyDisplayModeChangeDidFinish;
- (void)_processCurrentCableInfo;
- (void)_recalculateDefaultDisplayMode:(id)a3;
- (void)_resetSettingsForCurrentDisplay;
- (void)_resetTimer;
- (void)_saveCurrentResolutionsPreferences:(id)a3 toPersistentStore:(BOOL)a4;
- (void)_saveCurrentResolutionsPreferences:(id)a3 toPersistentStore:(BOOL)a4 forDisplayID:(id)a5;
- (void)_saveDisplayMode:(id)a3 forDisplayID:(id)a4;
- (void)_saveDisplayMode:(id)a3 forKey:(id)a4 persisted:(BOOL)a5;
- (void)_startBackgroundMonitoringAndIgnoreFirstPoll:(BOOL)a3;
- (void)_stopBackgroundMonitoring;
- (void)_toggleColorCalibration;
- (void)_updateDisplayManagerWithDisplayMode:(id)a3;
- (void)addNativeAndPerformanceObservers;
- (void)addStateObserver:(id)a3;
- (void)adjustAtmos:(id)a3;
- (void)completeDisplayTransition:(int64_t)a3 error:(id)a4 withReply:(id)a5;
- (void)dealloc;
- (void)displayAssistantDidCompleteForKind:(id)a3;
- (void)displayAssistantDidCompleteForKind:(id)a3 fromUserInteraction:(BOOL)a4;
- (void)displayAssistantDidStartForKind:(id)a3;
- (void)displayConnectionUpdated:(int64_t)a3;
- (void)enableAtmos:(BOOL)a3;
- (void)enableHDR10PlusMetadata:(BOOL)a3;
- (void)enableModeSwitchingForDynamicRange:(BOOL)a3;
- (void)enableModeSwitchingForFrameRate:(BOOL)a3;
- (void)enableQMSForFrameRateSwitching:(BOOL)a3;
- (void)fetchCurrentDisplayStateWithReply:(id)a3;
- (void)forgetDisplaysForDisplayAssistant;
- (void)handleRegionChangeWithNewCountryCode:(id)a3 reply:(id)a4;
- (void)notifyStateChangeForDisplayConnection:(int64_t)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)performModeSwitchForBundleIdentifierIfNeeded:(id)a3;
- (void)performModeSwitchForDisplayConfigurationRequest:(id)a3;
- (void)presentDisplayAssistantWithRequest:(id)a3 reply:(id)a4;
- (void)presentationElementFocusCoordinator:(id)a3 didUpdateToActiveLayoutLevel:(int64_t)a4 fromLevel:(int64_t)a5;
- (void)registerModeSwitch;
- (void)reloadState;
- (void)removeAllCompleteDisplayAssistants;
- (void)removeAudioLatencies;
- (void)removeCableCheckHistory;
- (void)removeColorCalibrations;
- (void)removeDisplayModeForKey:(id)a3 persisted:(BOOL)a4;
- (void)removeLastCableErrorInfo;
- (void)removeNativeAndPerformanceObservers;
- (void)removePromotedDisplayModes;
- (void)removeStateObserver:(id)a3;
- (void)removeUserSelectedDisplayMode;
- (void)resetCableCheckCumulativeTime;
- (void)resetCableInfoHistory;
- (void)runSleepWakeModeSetCycleToMode:(id)a3 oldMode:(id)a4 forDisplayIdentifier:(id)a5 replyBlock:(id)a6;
- (void)saveAtmosEnabled:(BOOL)a3;
- (void)saveCableCheckCumulativeTime:(double)a3;
- (void)saveCanHandleHighBandwidthModes:(BOOL)a3;
- (void)saveColorCalibration:(id)a3 forKeys:(id)a4;
- (void)saveCurrentDisplayID:(id)a3;
- (void)saveDetectedPoorCableConnection:(BOOL)a3;
- (void)saveDidCompleteDisplayAssistant:(BOOL)a3;
- (void)saveHDR10PlusMetadataEnabled:(BOOL)a3;
- (void)saveLastCableErrorInfo:(id)a3;
- (void)saveNewAudioLatency:(id)a3 forKey:(id)a4;
- (void)saveNewPromotedDisplayMode:(id)a3;
- (void)saveShouldModeSwitchForDynamicRange:(BOOL)a3;
- (void)saveShouldModeSwitchForFrameRate:(BOOL)a3;
- (void)saveShouldUseQMSForFrameRateSwitching:(BOOL)a3;
- (void)saveSoftwareDisplaySize:(CGSize)a3;
- (void)saveUserPreferredRefreshRate:(double)a3;
- (void)saveUserSelectedDisplayMode:(id)a3;
- (void)sceneManager:(id)a3 didChangeCurrentApplicationFromSceneHandle:(id)a4 toSceneHandle:(id)a5;
- (void)setAtmosEnabled:(BOOL)a3;
- (void)setAudioLatencies:(id)a3;
- (void)setAudioLatency:(id)a3 forKey:(id)a4;
- (void)setBaseCableCheckTimeInterval:(double)a3;
- (void)setBlackScreenRecoveryDisplayModes:(id)a3;
- (void)setBulletinService:(id)a3;
- (void)setCableCheckTimer:(id)a3;
- (void)setCanHandleHighBandwidthModes:(BOOL)a3;
- (void)setColorCalibration:(id)a3 forKey:(id)a4;
- (void)setColorCalibration:(id)a3 forKeys:(id)a4;
- (void)setColorCalibrations:(id)a3;
- (void)setColorGains:(id)a3;
- (void)setCurrentDisplayID:(id)a3;
- (void)setCurrentDisplayIdentifier:(id)a3;
- (void)setCurrentDisplayMode:(id)a3;
- (void)setDeemed4KCapable:(BOOL)a3;
- (void)setDefaults:(id)a3;
- (void)setDetectedPoorCableConnection:(BOOL)a3;
- (void)setDisplayConnection:(int64_t)a3;
- (void)setDisplayConnectionToNotify:(id)a3;
- (void)setDisplayStabilizationTimer:(double)a3;
- (void)setEARCStatus:(int64_t)a3;
- (void)setEncodedPromotedDisplayModes:(id)a3;
- (void)setFallbackDisplayMode:(id)a3;
- (void)setFilteredUsingdPineBoardPolicy:(BOOL)a3;
- (void)setHdr10PlusMetadataEnabled:(BOOL)a3;
- (void)setLastCableErrorInfo:(id)a3;
- (void)setLastCablePollStatus:(int64_t)a3;
- (void)setLocaleRefreshRate:(double)a3;
- (void)setMatchContentRequestedModes:(id)a3;
- (void)setMemoryStore:(id)a3;
- (void)setNextEstablishModePerDisplays:(id)a3;
- (void)setNoScreenAssertion:(id)a3;
- (void)setPresentedDisplayAssistantKind:(id)a3;
- (void)setPriorDisplayUpdateRequest:(id)a3;
- (void)setSeenDisplayIDs:(id)a3;
- (void)setShouldModeSwitchForDynamicRange:(BOOL)a3;
- (void)setShouldModeSwitchForFrameRate:(BOOL)a3;
- (void)setShouldUseQMSForFrameRateSwitching:(BOOL)a3;
- (void)setSoftwareDisplaySize:(CGSize)a3;
- (void)setSortedDisplayModes:(id)a3;
- (void)setStateObservers:(id)a3;
- (void)setSystemState:(id)a3;
- (void)setUserPreferredRefreshRate:(double)a3;
- (void)setUserSelectedDisplayMode:(id)a3;
- (void)sleepDisplayWithReply:(id)a3;
- (void)startMonitoringCable;
- (void)stopMonitoringCable;
- (void)updateCurrentCADisplayFromDisplayMode:(id)a3 completion:(id)a4;
- (void)updateDisplayForNewRegionWithCountryCode:(id)a3 completion:(id)a4;
- (void)updateDisplayManagerWithRequest:(id)a3 reply:(id)a4;
- (void)updateSoftwareDisplaySize:(CGSize)a3;
- (void)wakeDisplayWithReply:(id)a3;
@end

@implementation PBDisplayManager

- (void)updateDisplayForNewRegionWithCountryCode:(id)a3 completion:(id)a4
{
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100060588;
  v17[3] = &unk_1003D2560;
  id v6 = a4;
  v17[4] = self;
  id v18 = v6;
  id v7 = a3;
  v8 = objc_retainBlock(v17);
  double refreshed = PBSPreferredRefreshRateForCountryCode(v7);

  if ((sub_1001C9BFC() & 1) == 0
    && PBSDisplayRefreshRateEqualToRefreshRate(-[PBDisplayManager localeRefreshRate](self, "localeRefreshRate"))
    || (-[PBDisplayManager setLocaleRefreshRate:](self, "setLocaleRefreshRate:", refreshed),
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager currentDisplayMode](self, "currentDisplayMode")),
        char v11 = PBSDisplayRefreshRateEqualToRefreshRate([v10 refreshRate]),
        v10,
        (v11 & 1) != 0))
  {
    ((void (*)(void *))v8[2])(v8);
  }

  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager currentDisplayMode](self, "currentDisplayMode"));
    id v13 = [v12 copy];

    v14 = (void *)objc_claimAutoreleasedReturnValue( -[PBDisplayManager findMatchingLocaleMode:enforceVirtualCheck:]( self,  "findMatchingLocaleMode:enforceVirtualCheck:",  v13,  0LL));
    if (v14)
    {
      v15 = -[PBSDisplayManagerUpdateRequest initWithDisplayMode:reason:]( objc_alloc(&OBJC_CLASS___PBSDisplayManagerUpdateRequest),  "initWithDisplayMode:reason:",  v14,  @"Region change");
      uint64_t v19 = PBSDisplayManagerUpdateRegionChangeKey;
      v20 = &__kCFBooleanTrue;
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
      -[PBSDisplayManagerUpdateRequest setUserInfo:](v15, "setUserInfo:", v16);

      -[PBDisplayManager updateDisplayManagerWithRequest:reply:]( self,  "updateDisplayManagerWithRequest:reply:",  v15,  v6);
    }

    else
    {
      ((void (*)(void *))v8[2])(v8);
    }
  }
}

- (double)recalculatedCurrentLocaleRefreshRate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale autoupdatingCurrentLocale](&OBJC_CLASS___NSLocale, "autoupdatingCurrentLocale"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 countryCode]);
  double refreshed = PBSPreferredRefreshRateForCountryCode(v3);

  return refreshed;
}

- (void)addNativeAndPerformanceObservers
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
  [v3 addObserver:self selector:"_considerDisplayModeSwitchFinished:" name:AVDisplayManagerConsiderDisplayModeSwitchFinished object:0 suspensionBehavior:4];

  sub_100088088();
}

- (void)removeNativeAndPerformanceObservers
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
  [v3 removeObserver:self];
}

+ (BOOL)shouldAllowModeSwitchForDynamicRange
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBDisplayManager sharedInstance](&OBJC_CLASS___PBDisplayManager, "sharedInstance"));
  unsigned int v3 = [v2 shouldModeSwitchForDynamicRange];
  v4 = (void *)objc_claimAutoreleasedReturnValue([v2 currentDisplayMode]);
  v5 = v4;
  if (v3) {
    LOBYTE(v3) = PBSDisplayResolutionIsFullHD([v4 resolution]);
  }

  return v3;
}

+ (BOOL)shouldAllowModeSwitchForDynamicFrameRate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBDisplayManager sharedInstance](&OBJC_CLASS___PBDisplayManager, "sharedInstance"));
  unsigned int v3 = [v2 shouldModeSwitchForFrameRate];
  v4 = (void *)objc_claimAutoreleasedReturnValue([v2 currentDisplayMode]);
  v5 = v4;
  if (v3) {
    LOBYTE(v3) = PBSDisplayResolutionIsFullHD([v4 resolution]);
  }

  return v3;
}

- (BOOL)isModeSwitchNeededForTransitionToBundleIdentifier:(id)a3
{
  return -[PBDisplayManager _shouldModeSwitchForBundleIdentifier:](self, "_shouldModeSwitchForBundleIdentifier:", a3);
}

- (void)performModeSwitchForBundleIdentifierIfNeeded:(id)a3
{
  id v4 = a3;
  if (-[PBDisplayManager _shouldModeSwitchForBundleIdentifier:](self, "_shouldModeSwitchForBundleIdentifier:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( -[PBDisplayManager preferredDisplayModeForBundleIdentifier:]( self,  "preferredDisplayModeForBundleIdentifier:",  v4));
    id v6 = objc_alloc(&OBJC_CLASS___PBSDisplayManagerUpdateRequest);
    id v7 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Focused process changed to %@",  v4);
    v8 = -[PBSDisplayManagerUpdateRequest initWithDisplayMode:reason:](v6, "initWithDisplayMode:reason:", v5, v7);

    uint64_t v10 = PBSDisplayManagerUpdateRequestPassthroughKey;
    char v11 = &__kCFBooleanTrue;
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
    -[PBSDisplayManagerUpdateRequest setUserInfo:](v8, "setUserInfo:", v9);

    -[PBDisplayManager updateDisplayManagerWithRequest:reply:](self, "updateDisplayManagerWithRequest:reply:", v8, 0LL);
  }
}

- (void)performModeSwitchForDisplayConfigurationRequest:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(id)objc_opt_class(self) shouldAllowModeSwitchForDynamicRange];
  unsigned int v6 = [(id)objc_opt_class(self) shouldAllowModeSwitchForDynamicFrameRate];
  if ((v5 & 1) != 0 || v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager userSelectedDisplayMode](self, "userSelectedDisplayMode"));
    id v8 = sub_100082B8C();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = objc_claimAutoreleasedReturnValue([v4 debugDescription]);
      char v11 = (void *)v10;
      if (v10) {
        v12 = (const __CFString *)v10;
      }
      else {
        v12 = @"(nil)";
      }
      uint64_t v13 = objc_claimAutoreleasedReturnValue([v7 debugDescription]);
      v14 = (void *)v13;
      if (v13) {
        v15 = (const __CFString *)v13;
      }
      else {
        v15 = @"(nil)";
      }
      int v27 = 138412546;
      v28 = v12;
      __int16 v29 = 2112;
      v30 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Request for mode switch <%@> coming from current value <%@>",  (uint8_t *)&v27,  0x16u);
    }

    if (v4)
    {
      uint64_t v16 = 538423554LL;
      id v17 = [v4 hdrMode];
      if (v17)
      {
        if (v17 == (id)2)
        {
          id v18 = (void *)objc_claimAutoreleasedReturnValue(+[PBDisplayManager sharedInstance](&OBJC_CLASS___PBDisplayManager, "sharedInstance"));
        }

        else if (v17 == (id)1)
        {
          uint64_t v16 = 538423556LL;
        }

        else
        {
          uint64_t v16 = 538423807LL;
        }
      }

      else
      {
        uint64_t v16 = 538423557LL;
      }

      [v4 refreshRate];
      uint64_t v19 = objc_claimAutoreleasedReturnValue( -[PBDisplayManager _bestDisplayModeForDynamicRange:frameRate:]( self,  "_bestDisplayModeForDynamicRange:frameRate:",  v16));

      id v7 = (void *)v19;
    }

    id v20 = sub_100082B8C();
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = objc_claimAutoreleasedReturnValue([v7 debugDescription]);
      v23 = (void *)v22;
      if (v22) {
        v24 = (const __CFString *)v22;
      }
      else {
        v24 = @"(nil)";
      }
      int v27 = 138412290;
      v28 = v24;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Found mode: %@", (uint8_t *)&v27, 0xCu);
    }

    if (v7)
    {
      -[PBDisplayManager _updateDisplayManagerWithDisplayMode:](self, "_updateDisplayManagerWithDisplayMode:", v7);
    }

    else
    {
      id v25 = sub_100082B8C();
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v27) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "No available display mode matched the requested criteria, no mode switch will occur",  (uint8_t *)&v27,  2u);
      }
    }
  }
}

- (id)preferredDisplayModeForBundleIdentifier:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue( +[FBSSceneIdentity pb_identityForApplicationIdentifier:role:]( &OBJC_CLASS___FBSSceneIdentity,  "pb_identityForApplicationIdentifier:role:",  v4,  @"default"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[FBSceneManager sharedInstance](&OBJC_CLASS___FBSceneManager, "sharedInstance"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 sceneWithIdentifier:v7]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 clientSettings]);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplicationLibrary](&OBJC_CLASS___PineBoard, "sharedApplicationLibrary"));
  char v11 = (void *)objc_claimAutoreleasedReturnValue([v10 installedApplicationWithBundleIdentifier:v4]);

  LOBYTE(v4) = [v11 supportsHDR];
  if ((v4 & 1) != 0)
  {
    if (![v9 isUISubclass])
    {
LABEL_18:
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager readUserSelectedDisplayMode](self, "readUserSelectedDisplayMode"));
      goto LABEL_19;
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue([v9 displayConfigurationRequest]);
    uint64_t v13 = v12;
    if (v12)
    {
      uint64_t v14 = 538423554LL;
      id v15 = [v12 hdrMode];
      if (v15)
      {
        if (v15 == (id)2)
        {
          id v18 = (void *)objc_claimAutoreleasedReturnValue(+[PBDisplayManager sharedInstance](&OBJC_CLASS___PBDisplayManager, "sharedInstance"));
        }

        else if (v15 == (id)1)
        {
          uint64_t v14 = 538423556LL;
        }

        else
        {
          uint64_t v14 = 538423807LL;
        }
      }

      else
      {
        uint64_t v14 = 538423557LL;
      }

      [v13 refreshRate];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[PBDisplayManager _bestDisplayModeForDynamicRange:frameRate:]( self,  "_bestDisplayModeForDynamicRange:frameRate:",  v14));
    }

    else
    {
      uint64_t v16 = 0LL;
    }
  }

  else
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager _bestSDRDisplayMode](self, "_bestSDRDisplayMode"));
    id v17 = sub_100082B8C();
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138543362;
      v21 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v13,  OS_LOG_TYPE_DEFAULT,  "App uses game mode switching, setting preferred mode to %{public}@",  (uint8_t *)&v20,  0xCu);
    }
  }

  if (!v16) {
    goto LABEL_18;
  }
LABEL_19:

  return v16;
}

- (id)_displayModePredicatesForDynamicRange:(int64_t)a3 frameRate:(double)a4
{
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (PBSDisplayRefreshRateFullFromHalf(a4) != a4)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[PBDisplayModePredicate predicatWithDynamicRange:frameRate:]( &OBJC_CLASS___PBDisplayModePredicate,  "predicatWithDynamicRange:frameRate:",  a3));
    -[NSMutableArray addObject:](v7, "addObject:", v8);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager readUserSelectedDisplayMode](self, "readUserSelectedDisplayMode"));
  id v10 = [v9 dynamicRange];
  if (a3 == 538423557 && v10 == (id)538423557)
  {
    char v11 = (void *)objc_claimAutoreleasedReturnValue( +[PBDisplayModePredicate predicatesWithPreferredSDRColorMapping:frameRate:]( PBDisplayModePredicate,  "predicatesWithPreferredSDRColorMapping:frameRate:",  [v9 SDRColorMapping],  a4));
    -[NSMutableArray addObjectsFromArray:](v7, "addObjectsFromArray:", v11);
  }

  else
  {
    char v11 = (void *)objc_claimAutoreleasedReturnValue( +[PBDisplayModePredicate predicatWithDynamicRange:frameRate:]( &OBJC_CLASS___PBDisplayModePredicate,  "predicatWithDynamicRange:frameRate:",  a3,  a4));
    -[NSMutableArray addObject:](v7, "addObject:", v11);
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100088B4C;
  v17[3] = &unk_1003D3FF8;
  v12 =  -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](v7, "count"));
  id v18 = v12;
  -[NSMutableArray enumerateObjectsUsingBlock:](v7, "enumerateObjectsUsingBlock:", v17);
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 0x2017B102)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[PBDisplayManager _fallbackPredicatesForDynamicRange:frameRates:]( self,  "_fallbackPredicatesForDynamicRange:frameRates:",  538423556LL,  v12));
    -[NSMutableArray addObjectsFromArray:](v7, "addObjectsFromArray:", v13);

LABEL_10:
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[PBDisplayManager _fallbackPredicatesForDynamicRange:frameRates:]( self,  "_fallbackPredicatesForDynamicRange:frameRates:",  538423557LL,  v12));
    -[NSMutableArray addObjectsFromArray:](v7, "addObjectsFromArray:", v14);

    goto LABEL_11;
  }

  if (a3 == 538423556) {
    goto LABEL_10;
  }
LABEL_11:
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v7));

  return v15;
}

- (id)_fallbackPredicatesForDynamicRange:(int64_t)a3 frameRates:(id)a4
{
  id v6 = a4;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100088C70;
  v10[3] = &unk_1003D4020;
  char v11 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v6 count]);
  int64_t v12 = a3;
  v10[4] = self;
  id v7 = v11;
  [v6 enumerateObjectsUsingBlock:v10];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v7));
  return v8;
}

- (id)_bestDisplayModeForDynamicRange:(int64_t)a3 frameRate:(double)a4
{
  uint64_t v9 = 0LL;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  int64_t v12 = sub_100088E48;
  uint64_t v13 = sub_100088E58;
  id v14 = 0LL;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue( -[PBDisplayManager _displayModePredicatesForDynamicRange:frameRate:]( self,  "_displayModePredicatesForDynamicRange:frameRate:",  a3,  a4));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100088E70;
  v8[3] = &unk_1003D4048;
  v8[4] = self;
  v8[5] = &v9;
  [v5 enumerateObjectsUsingBlock:v8];
  id v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v6;
}

- (id)_findDisplayModeFromPredicate:(id)a3
{
  id v4 = a3;
  unsigned int v5 = -[PBDisplayManager shouldModeSwitchForDynamicRange](self, "shouldModeSwitchForDynamicRange");
  if (-[PBDisplayManager shouldModeSwitchForFrameRate](self, "shouldModeSwitchForFrameRate"))
  {
    [v4 frameRate];
    BOOL v7 = v6 != -1.0;
  }

  else
  {
    BOOL v7 = 0;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager readUserSelectedDisplayMode](self, "readUserSelectedDisplayMode"));
  else {
    BOOL v9 = 0;
  }
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager currentDisplayMode](self, "currentDisplayMode"));
  if (v9 && v5)
  {
    id v11 = [v8 dynamicRange];
    BOOL v9 = v11 == [v4 dynamicRange];
  }

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_1000891E4;
  v33[3] = &unk_1003D4070;
  id v12 = v8;
  id v34 = v12;
  v35 = self;
  BOOL v37 = v7;
  char v38 = v5;
  id v13 = v4;
  id v36 = v13;
  id v14 = objc_retainBlock(v33);
  if (v9)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager filterModes:](self, "filterModes:", v14));
    if ((unint64_t)[v15 count] > 1)
    {
      int v27 = v15;
      id v28 = v12;
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      id v17 = v15;
      id v18 = [v17 countByEnumeratingWithState:&v29 objects:v39 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v30;
        while (2)
        {
          for (i = 0LL; i != v19; i = (char *)i + 1)
          {
            if (*(void *)v30 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
            id v23 = objc_msgSend(v22, "colorGamut", v27, v28, (void)v29);
            if (v23 == [v10 colorGamut])
            {
              if ([v22 dynamicRange] == (id)538423556)
              {
                id v24 = [v22 HDR10ChromaSubsampling];
                id v25 = [v10 HDR10ChromaSubsampling];
              }

              else
              {
                if ([v22 dynamicRange] != (id)538423557) {
                  goto LABEL_29;
                }
                id v24 = [v22 SDRChromaSubsampling];
                id v25 = [v10 SDRChromaSubsampling];
              }

              if (v24 == v25)
              {
LABEL_29:
                id v16 = v22;

                goto LABEL_30;
              }
            }
          }

          id v19 = [v17 countByEnumeratingWithState:&v29 objects:v39 count:16];
          if (v19) {
            continue;
          }
          break;
        }
      }

      id v16 = (id)objc_claimAutoreleasedReturnValue([v17 firstObject]);
LABEL_30:
      id v15 = v27;
      id v12 = v28;
    }

    else
    {
      id v16 = (id)objc_claimAutoreleasedReturnValue([v15 firstObject]);
    }
  }

  else
  {
    id v16 = (id)objc_claimAutoreleasedReturnValue(-[PBDisplayManager findFirstMode:](self, "findFirstMode:", v14));
  }

  return v16;
}

- (void)_updateDisplayManagerWithDisplayMode:(id)a3
{
  id v4 = a3;
  if (-[PBDisplayManager _isModeSwitchInProgress](self, "_isModeSwitchInProgress"))
  {
    unsigned int v5 = (PBSDisplayManagerUpdateRequest *)objc_claimAutoreleasedReturnValue( -[PBDisplayManager matchContentRequestedModes]( self,  "matchContentRequestedModes"));
    -[PBSDisplayManagerUpdateRequest addObject:](v5, "addObject:", v4);
  }

  else
  {
    -[PBDisplayManager _notifyDisplayModeChange:](self, "_notifyDisplayModeChange:", 1LL);
    unsigned int v5 = -[PBSDisplayManagerUpdateRequest initWithDisplayMode:reason:]( objc_alloc(&OBJC_CLASS___PBSDisplayManagerUpdateRequest),  "initWithDisplayMode:reason:",  v4,  @"Native mode switching");

    uint64_t v8 = PBSDisplayManagerUpdateRequestPassthroughKey;
    BOOL v9 = &__kCFBooleanTrue;
    double v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
    -[PBSDisplayManagerUpdateRequest setUserInfo:](v5, "setUserInfo:", v6);

    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10008948C;
    v7[3] = &unk_1003D4098;
    v7[4] = self;
    -[PBDisplayManager updateDisplayManagerWithRequest:reply:](self, "updateDisplayManagerWithRequest:reply:", v5, v7);
  }
}

- (BOOL)_shouldModeSwitchForBundleIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( -[PBDisplayManager preferredDisplayModeForBundleIdentifier:]( self,  "preferredDisplayModeForBundleIdentifier:",  v4));
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager currentDisplayMode](self, "currentDisplayMode"));
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplicationLibrary](&OBJC_CLASS___PineBoard, "sharedApplicationLibrary"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 installedApplicationWithBundleIdentifier:v4]);

    LOBYTE(v4) = [v8 supportsHDR];
    if ((v4 & 1) != 0)
    {
      if (v6 && v5)
      {
        unsigned int v9 = [v6 isEqual:v5] ^ 1;
      }

      else
      {
        id v16 = sub_100082B8C();
        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_1002786C8((uint64_t)v6, (uint64_t)v5, v17);
        }

        LOBYTE(v9) = 0;
      }
    }

    else
    {
      char IsHDR = PBSDynamicRangeIsHDR([v6 dynamicRange]);
      int IsFullHD = PBSDisplayResolutionIsFullHD([v6 resolution]);
      [v6 refreshRate];
      double v13 = v12;
      char v14 = PBSDynamicRangeIsHDR([v5 dynamicRange]);
      unsigned __int8 v15 = [v5 isEqual:v6];
      LOBYTE(v9) = 0;
      if (IsFullHD && (v15 & 1) == 0)
      {
        if (v13 < 50.0) {
          LOBYTE(v9) = 1;
        }
        else {
          LOBYTE(v9) = IsHDR ^ v14;
        }
      }
    }
  }

  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (id)_bestSDRDisplayMode
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager currentDisplayMode](self, "currentDisplayMode"));
  if (!v3) {
    unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager readUserSelectedDisplayMode](self, "readUserSelectedDisplayMode"));
  }
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager sortedDisplayModes](self, "sortedDisplayModes", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v22;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        if (([v8 isVirtual] & 1) == 0 && objc_msgSend(v8, "dynamicRange") == (id)538423557)
        {
          [v3 resolution];
          double v10 = v9;
          double v12 = v11;
          id v13 = [v8 resolution];
          if (PBSDisplayResolutionEqualToResolution(v13, v10, v12, v14, v15))
          {
            if (-[PBDisplayManager canHandleHighBandwidthModes](self, "canHandleHighBandwidthModes")
              || ([v8 isAboveBandwidthThreshold] & 1) == 0)
            {
              [v8 refreshRate];
              if (v16 >= 50.0)
              {
                id v5 = v8;
                goto LABEL_18;
              }
            }
          }
        }
      }

      id v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

- (int64_t)reportingValueForMatchDynamicRange
{
  if (-[PBDisplayManager shouldModeSwitchForDynamicRange](self, "shouldModeSwitchForDynamicRange")) {
    return 3LL;
  }
  else {
    return 0LL;
  }
}

- (int64_t)reportingValueForMatchFrameRate
{
  if (-[PBDisplayManager shouldModeSwitchForFrameRate](self, "shouldModeSwitchForFrameRate")) {
    return 3LL;
  }
  else {
    return 0LL;
  }
}

- (int64_t)reportingValueForUseDiscreteMediaRefreshRate
{
  return -[PBDisplayManager shouldUseQMSForFrameRateSwitching](self, "shouldUseQMSForFrameRateSwitching");
}

- (void)_considerDisplayModeSwitchFinished:(id)a3
{
}

- (void)_notifyDisplayModeChangeDidFinish
{
}

- (void)_notifyDisplayModeChange:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = sub_100088088();
  if (!notify_is_valid_token(v5))
  {
    id v11 = sub_100082B8C();
    double v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v12 = 67109120;
      LODWORD(v13) = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Invalid notify token %d", (uint8_t *)&v12, 8u);
    }

    goto LABEL_9;
  }

  notify_set_state(v5, v3);
  id v6 = sub_100082B8C();
  BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134217984;
    uint64_t v13 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Posting mode switch darwin notification, state = %qu",  (uint8_t *)&v12,  0xCu);
  }

  notify_post("com.apple.pineboard.display_mode_switch_active");
  if (!v3)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager matchContentRequestedModes](self, "matchContentRequestedModes"));
    double v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 lastObject]);

    if (v9)
    {
      -[PBDisplayManager _updateDisplayManagerWithDisplayMode:](self, "_updateDisplayManagerWithDisplayMode:", v9);
      double v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager matchContentRequestedModes](self, "matchContentRequestedModes"));
      [v10 removeAllObjects];
    }

- (BOOL)_isModeSwitchInProgress
{
  int v2 = sub_100088088();
  if (notify_is_valid_token(v2))
  {
    notify_get_state(v2, &v6);
    return v6 != 0;
  }

  else
  {
    id v4 = sub_100082B8C();
    int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LODWORD(v6) = 67109120;
      HIDWORD(v6) = v2;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Invalid notify token %d", (uint8_t *)&v6, 8u);
    }

    return 0;
  }

- (void)runSleepWakeModeSetCycleToMode:(id)a3 oldMode:(id)a4 forDisplayIdentifier:(id)a5 replyBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = sub_100082A9C();
  double v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "J105a failed to move to high-bandwidth mode. Using sleep/wake cycle.",  buf,  2u);
  }

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1001074D0;
  v20[3] = &unk_1003D7878;
  id v24 = v11;
  id v25 = v13;
  id v21 = v10;
  __int128 v22 = self;
  id v23 = v12;
  id v16 = v11;
  id v17 = v12;
  id v18 = v10;
  id v19 = v13;
  -[PBDisplayManager sleepDisplayWithReply:](self, "sleepDisplayWithReply:", v20);
}

+ (void)enumerateMutableDisplayPreferencesUsingBlock:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults pb_appleTVServicesUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "pb_appleTVServicesUserDefaults"));
  int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"TVResolutions"]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    id v7 = [v5 mutableCopy];
    double v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472LL;
    id v11 = sub_100116718;
    id v12 = &unk_1003D8148;
    id v14 = v3;
    id v8 = v7;
    id v13 = v8;
    [v5 enumerateKeysAndObjectsUsingBlock:&v9];
  }
}

- (void)saveUserSelectedDisplayMode:(id)a3
{
  id v4 = a3;
  id v5 = sub_100082A9C();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 138543362;
    id v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Saving user-selected display mode: %{public}@",  (uint8_t *)&v7,  0xCu);
  }

  -[PBDisplayManager _saveDisplayMode:forKey:persisted:]( self,  "_saveDisplayMode:forKey:persisted:",  v4,  @"TVUserSelectedMode",  1LL);
}

- (id)readUserSelectedDisplayMode
{
  int v2 = (__CFString *)objc_claimAutoreleasedReturnValue( -[PBDisplayManager _readDisplayModeForKey:persisted:]( self,  "_readDisplayModeForKey:persisted:",  @"TVUserSelectedMode",  1LL));
  id v3 = sub_100082A9C();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = @"(nil)";
    if (v2) {
      id v5 = v2;
    }
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Read user-selected display mode: %{public}@",  (uint8_t *)&v7,  0xCu);
  }

  return v2;
}

- (void)removeUserSelectedDisplayMode
{
  id v3 = sub_100082A9C();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Removing user-selected display mode.", v5, 2u);
  }

  -[PBDisplayManager removeDisplayModeForKey:persisted:]( self,  "removeDisplayModeForKey:persisted:",  @"TVUserSelectedMode",  1LL);
}

- (void)saveCurrentDisplayID:(id)a3
{
  if (a3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( -[PBDisplayManager _currentResolutionsPreferencesFromPersistentStore:]( self,  "_currentResolutionsPreferencesFromPersistentStore:",  1LL));
    id v5 = [v4 mutableCopy];

    [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:@"TVSeenPluggedIn"];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](&OBJC_CLASS___CADisplay, "mainDisplay"));
    int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueId]);
    [v5 setObject:v7 forKeyedSubscript:@"TVDisplayID"];

    -[PBDisplayManager _saveCurrentResolutionsPreferences:toPersistentStore:]( self,  "_saveCurrentResolutionsPreferences:toPersistentStore:",  v5,  1LL);
  }

- (id)readSeenDisplayIDs
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100116B34;
  v4[3] = &unk_1003D8170;
  int v2 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v5 = v2;
  +[PBDisplayManager enumerateMutableDisplayPreferencesUsingBlock:]( &OBJC_CLASS___PBDisplayManager,  "enumerateMutableDisplayPreferencesUsingBlock:",  v4);

  return v2;
}

- (void)saveCanHandleHighBandwidthModes:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[PBDisplayManager _currentResolutionsPreferencesFromPersistentStore:]( self,  "_currentResolutionsPreferencesFromPersistentStore:",  1LL));
  id v6 = [v5 mutableCopy];

  int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
  [v6 setObject:v7 forKeyedSubscript:@"TVCanDoHighBandwidthModes"];

  -[PBDisplayManager _saveCurrentResolutionsPreferences:toPersistentStore:]( self,  "_saveCurrentResolutionsPreferences:toPersistentStore:",  v6,  1LL);
}

- (BOOL)readCanDoHighBandwidth
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue( -[PBDisplayManager _currentResolutionsPreferencesFromPersistentStore:]( self,  "_currentResolutionsPreferencesFromPersistentStore:",  1LL));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"TVCanDoHighBandwidthModes"]);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    unsigned __int8 v5 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void)saveShouldModeSwitchForDynamicRange:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue( -[PBDisplayManager _currentResolutionsPreferencesFromPersistentStore:]( self,  "_currentResolutionsPreferencesFromPersistentStore:",  1LL));
  id v6 = [v5 mutableCopy];

  int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
  [v6 setObject:v7 forKeyedSubscript:@"TVUserShouldModeSwitchForDynamicRange"];

  -[PBDisplayManager _saveCurrentResolutionsPreferences:toPersistentStore:]( self,  "_saveCurrentResolutionsPreferences:toPersistentStore:",  v6,  1LL);
}

- (BOOL)readShouldModeSwitchForDynamicRange
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue( -[PBDisplayManager _currentResolutionsPreferencesFromPersistentStore:]( self,  "_currentResolutionsPreferencesFromPersistentStore:",  1LL));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"TVUserShouldModeSwitchForDynamicRange"]);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    unsigned __int8 v5 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void)saveShouldModeSwitchForFrameRate:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue( -[PBDisplayManager _currentResolutionsPreferencesFromPersistentStore:]( self,  "_currentResolutionsPreferencesFromPersistentStore:",  1LL));
  id v6 = [v5 mutableCopy];

  int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
  [v6 setObject:v7 forKeyedSubscript:@"TVUserShouldModeSwitchForFrameRate"];

  -[PBDisplayManager _saveCurrentResolutionsPreferences:toPersistentStore:]( self,  "_saveCurrentResolutionsPreferences:toPersistentStore:",  v6,  1LL);
}

- (void)saveAtmosEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue( -[PBDisplayManager _currentResolutionsPreferencesFromPersistentStore:]( self,  "_currentResolutionsPreferencesFromPersistentStore:",  1LL));
  id v6 = [v5 mutableCopy];

  int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
  [v6 setObject:v7 forKeyedSubscript:@"TVUserPreferredAtmosEnabled"];

  -[PBDisplayManager _saveCurrentResolutionsPreferences:toPersistentStore:]( self,  "_saveCurrentResolutionsPreferences:toPersistentStore:",  v6,  1LL);
}

- (BOOL)readShouldModeSwitchForFrameRate
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue( -[PBDisplayManager _currentResolutionsPreferencesFromPersistentStore:]( self,  "_currentResolutionsPreferencesFromPersistentStore:",  1LL));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"TVUserShouldModeSwitchForFrameRate"]);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    unsigned __int8 v5 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)readAtmosEnabled
{
  unsigned __int8 v2 = 1;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( -[PBDisplayManager _currentResolutionsPreferencesFromPersistentStore:]( self,  "_currentResolutionsPreferencesFromPersistentStore:",  1LL));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"TVUserPreferredAtmosEnabled"]);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0) {
    unsigned __int8 v2 = [v4 BOOLValue];
  }

  return v2;
}

- (void)saveShouldUseQMSForFrameRateSwitching:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[PBDisplayManager _currentResolutionsPreferencesFromPersistentStore:]( self,  "_currentResolutionsPreferencesFromPersistentStore:",  1LL));
  id v6 = [v5 mutableCopy];

  int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
  [v6 setObject:v7 forKeyedSubscript:@"TVUserShouldUseQMSForFrameRate"];

  -[PBDisplayManager _saveCurrentResolutionsPreferences:toPersistentStore:]( self,  "_saveCurrentResolutionsPreferences:toPersistentStore:",  v6,  1LL);
}

- (BOOL)readShouldUseQMSForFrameRateSwitching
{
  unsigned __int8 v2 = 1;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( -[PBDisplayManager _currentResolutionsPreferencesFromPersistentStore:]( self,  "_currentResolutionsPreferencesFromPersistentStore:",  1LL));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"TVUserShouldUseQMSForFrameRate"]);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0) {
    unsigned __int8 v2 = [v4 BOOLValue];
  }

  return v2;
}

- (void)saveHDR10PlusMetadataEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[PBDisplayManager _currentResolutionsPreferencesFromPersistentStore:]( self,  "_currentResolutionsPreferencesFromPersistentStore:",  1LL));
  id v6 = [v5 mutableCopy];

  int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
  [v6 setObject:v7 forKeyedSubscript:@"TVUserHDR10PlusEnabled"];

  -[PBDisplayManager _saveCurrentResolutionsPreferences:toPersistentStore:]( self,  "_saveCurrentResolutionsPreferences:toPersistentStore:",  v6,  1LL);
}

- (BOOL)readHDR10PlusMetadataEnabled
{
  unsigned __int8 v2 = 1;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( -[PBDisplayManager _currentResolutionsPreferencesFromPersistentStore:]( self,  "_currentResolutionsPreferencesFromPersistentStore:",  1LL));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"TVUserHDR10PlusEnabled"]);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0) {
    unsigned __int8 v2 = [v4 BOOLValue];
  }

  return v2;
}

- (void)saveSoftwareDisplaySize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (+[TVSDevice supportsUltrawide](&OBJC_CLASS___TVSDevice, "supportsUltrawide"))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[PBDisplayManager _currentResolutionsPreferencesFromPersistentStore:]( self,  "_currentResolutionsPreferencesFromPersistentStore:",  1LL));
    id v7 = [v6 mutableCopy];

    uint64_t v8 = PBSSerializableStringFromDisplaySize(width, height);
    double v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    [v7 setObject:v9 forKeyedSubscript:@"TVDisplayPreferredSoftwareDisplaySize"];

    -[PBDisplayManager _saveCurrentResolutionsPreferences:toPersistentStore:]( self,  "_saveCurrentResolutionsPreferences:toPersistentStore:",  v7,  1LL);
  }

- (CGSize)readSoftwareDisplaySize
{
  double v3 = PBSDisplaySize16x9[0];
  double v4 = PBSDisplaySize16x9[1];
  if (+[TVSDevice supportsUltrawide](&OBJC_CLASS___TVSDevice, "supportsUltrawide"))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[PBDisplayManager _currentResolutionsPreferencesFromPersistentStore:]( self,  "_currentResolutionsPreferencesFromPersistentStore:",  1LL));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"TVDisplayPreferredSoftwareDisplaySize"]);
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    {
      double v3 = PBSDisplaySizeFromStringWithFallback(v6, v3, v4);
      double v4 = v8;
    }
  }

  double v9 = v3;
  double v10 = v4;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)saveUserPreferredRefreshRate:(double)a3
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager defaults](self, "defaults"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
  [v4 setObject:v5 forKey:@"TVUserPreferredRefreshRate"];
}

- (double)readUserPreferredRefreshRate
{
  double v3 = v2;
  double v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults pb_appleTVServicesUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "pb_appleTVServicesUserDefaults"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"TVUserPreferredRefreshRate"]);

  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    [v5 doubleValue];
    double v3 = v7;
  }

  return v3;
}

- (void)saveDidCompleteDisplayAssistant:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[PBDisplayManager _currentResolutionsPreferencesFromPersistentStore:]( self,  "_currentResolutionsPreferencesFromPersistentStore:",  1LL));
  id v6 = [v5 mutableCopy];

  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
  [v6 setObject:v7 forKeyedSubscript:@"TVCompletedDisplayAssistant"];

  -[PBDisplayManager _saveCurrentResolutionsPreferences:toPersistentStore:]( self,  "_saveCurrentResolutionsPreferences:toPersistentStore:",  v6,  1LL);
}

- (BOOL)readDidCompleteDisplayAssistant
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue( -[PBDisplayManager _currentResolutionsPreferencesFromPersistentStore:]( self,  "_currentResolutionsPreferencesFromPersistentStore:",  1LL));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"TVCompletedDisplayAssistant"]);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    unsigned __int8 v5 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void)removeAllCompleteDisplayAssistants
{
}

- (void)saveNewPromotedDisplayMode:(id)a3
{
  id v4 = [a3 copy];
  [v4 setPromotedToReal:0];
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 encodedString]);
  if (!v5)
  {
    id v14 = sub_100082A9C();
    double v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100282EE4(v9, v15, v16, v17, v18, v19, v20, v21);
    }
    goto LABEL_6;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager encodedPromotedDisplayModes](self, "encodedPromotedDisplayModes"));
  unsigned __int8 v7 = [v6 containsObject:v5];

  if ((v7 & 1) == 0)
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager encodedPromotedDisplayModes](self, "encodedPromotedDisplayModes"));
    double v9 = (os_log_s *)[v8 mutableCopy];

    -[os_log_s addObject:](v9, "addObject:", v5);
    double v10 = (void *)objc_claimAutoreleasedReturnValue( -[PBDisplayManager _currentResolutionsPreferencesFromPersistentStore:]( self,  "_currentResolutionsPreferencesFromPersistentStore:",  1LL));
    id v11 = [v10 mutableCopy];

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s allObjects](v9, "allObjects"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 componentsJoinedByString:@"|"]);
    [v11 setObject:v13 forKeyedSubscript:@"TVSpecialVirtualMode"];

    -[PBDisplayManager _saveCurrentResolutionsPreferences:toPersistentStore:]( self,  "_saveCurrentResolutionsPreferences:toPersistentStore:",  v11,  1LL);
    -[PBDisplayManager setEncodedPromotedDisplayModes:](self, "setEncodedPromotedDisplayModes:", v9);

LABEL_6:
  }
}

- (void)removePromotedDisplayModes
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( -[PBDisplayManager _currentResolutionsPreferencesFromPersistentStore:]( self,  "_currentResolutionsPreferencesFromPersistentStore:",  1LL));
  id v4 = [v3 mutableCopy];

  [v4 setObject:0 forKeyedSubscript:@"TVSpecialVirtualMode"];
  -[PBDisplayManager _saveCurrentResolutionsPreferences:toPersistentStore:]( self,  "_saveCurrentResolutionsPreferences:toPersistentStore:",  v4,  1LL);
  unsigned __int8 v5 = objc_alloc_init(&OBJC_CLASS___NSSet);
  -[PBDisplayManager setEncodedPromotedDisplayModes:](self, "setEncodedPromotedDisplayModes:", v5);
}

- (id)readEncodedPromotedDisplayModes
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue( -[PBDisplayManager _currentResolutionsPreferencesFromPersistentStore:]( self,  "_currentResolutionsPreferencesFromPersistentStore:",  1LL));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"TVSpecialVirtualMode"]);
  uint64_t v5 = objc_opt_self(&OBJC_CLASS___NSString, v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if ((objc_opt_isKindOfClass(v3, v6) & 1) != 0) {
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v3 componentsSeparatedByString:@"|"]);
  }
  else {
    unsigned __int8 v7 = &__NSArray0__struct;
  }

  double v8 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", v7);
  return v8;
}

- (void)saveNewAudioLatency:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager audioLatencies](self, "audioLatencies"));
  id v9 = [v8 mutableCopy];

  [v9 setObject:v7 forKey:v6];
  double v10 = (void *)objc_claimAutoreleasedReturnValue( -[PBDisplayManager _currentResolutionsPreferencesFromPersistentStore:]( self,  "_currentResolutionsPreferencesFromPersistentStore:",  1LL));
  id v11 = [v10 mutableCopy];

  id v12 = [v9 copy];
  [v11 setObject:v12 forKeyedSubscript:@"TVAudioLatencies"];

  -[PBDisplayManager _saveCurrentResolutionsPreferences:toPersistentStore:]( self,  "_saveCurrentResolutionsPreferences:toPersistentStore:",  v11,  1LL);
  -[PBDisplayManager setAudioLatencies:](self, "setAudioLatencies:", v9);
}

- (void)removeAudioLatencies
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( -[PBDisplayManager _currentResolutionsPreferencesFromPersistentStore:]( self,  "_currentResolutionsPreferencesFromPersistentStore:",  1LL));
  id v4 = [v3 mutableCopy];

  [v4 setObject:0 forKeyedSubscript:@"TVAudioLatencies"];
  -[PBDisplayManager _saveCurrentResolutionsPreferences:toPersistentStore:]( self,  "_saveCurrentResolutionsPreferences:toPersistentStore:",  v4,  1LL);
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSDictionary);
  -[PBDisplayManager setAudioLatencies:](self, "setAudioLatencies:", v5);
}

- (void)adjustAtmos:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager currentDisplayIdentifier](self, "currentDisplayIdentifier"));
  unsigned __int8 v6 = [v5 isEqualToString:@"_unknown_"];

  if ((v6 & 1) == 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
    unsigned int v8 = [v7 isDolbyAtmosAvailable];

    [v4 resolution];
    if (v9 == 0.0 && v10 == 0.0)
    {
      BOOL v11 = 1;
    }

    else
    {
      BOOL v11 = v9 >= 1280.0;
      if (v10 < 720.0) {
        BOOL v11 = 0;
      }
    }

    int v12 = v8 & v11;
    unsigned int v13 = -[PBDisplayManager readAtmosEnabled](self, "readAtmosEnabled");
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
    id v15 = [v14 audioOutputFormat];

    if (v12 == 1 && v13)
    {
      if (v15 == (id)3)
      {
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
        uint64_t v17 = v16;
        uint64_t v18 = 2LL;
LABEL_13:
        [v16 setAudioOutputFormat:v18];
      }
    }

    else if (v15 == (id)2)
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
      uint64_t v17 = v16;
      uint64_t v18 = 3LL;
      goto LABEL_13;
    }
  }
}

- (id)readAudioLatencies
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue( -[PBDisplayManager _currentResolutionsPreferencesFromPersistentStore:]( self,  "_currentResolutionsPreferencesFromPersistentStore:",  1LL));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"TVAudioLatencies"]);
  uint64_t v5 = objc_opt_self(&OBJC_CLASS___NSDictionary, v4);
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  char isKindOfClass = objc_opt_isKindOfClass(v3, v6);
  unsigned int v8 = &__NSDictionary0__struct;
  if ((isKindOfClass & 1) != 0) {
    unsigned int v8 = v3;
  }
  id v9 = v8;

  return v9;
}

- (void)saveColorCalibration:(id)a3 forKeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager colorCalibrations](self, "colorCalibrations"));
  id v9 = [v8 mutableCopy];

  if ([v6 count])
  {
    __int128 v29 = 0uLL;
    __int128 v30 = 0uLL;
    __int128 v27 = 0uLL;
    __int128 v28 = 0uLL;
    id v10 = v7;
    id v11 = [v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v28;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v10);
          }
          [v9 setObject:v6 forKey:*(void *)(*((void *)&v27 + 1) + 8 * (void)i)];
        }

        id v12 = [v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }

      while (v12);
    }
  }

  else
  {
    __int128 v25 = 0uLL;
    __int128 v26 = 0uLL;
    __int128 v23 = 0uLL;
    __int128 v24 = 0uLL;
    id v15 = v7;
    id v16 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v24;
      do
      {
        for (j = 0LL; j != v17; j = (char *)j + 1)
        {
          if (*(void *)v24 != v18) {
            objc_enumerationMutation(v15);
          }
          objc_msgSend(v9, "removeObjectForKey:", *(void *)(*((void *)&v23 + 1) + 8 * (void)j), (void)v23);
        }

        id v17 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }

      while (v17);
    }
  }

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( -[PBDisplayManager _currentResolutionsPreferencesFromPersistentStore:]( self,  "_currentResolutionsPreferencesFromPersistentStore:",  1LL));
  id v21 = [v20 mutableCopy];

  id v22 = [v9 copy];
  [v21 setObject:v22 forKeyedSubscript:@"TVColorCalibration"];

  -[PBDisplayManager _saveCurrentResolutionsPreferences:toPersistentStore:]( self,  "_saveCurrentResolutionsPreferences:toPersistentStore:",  v21,  1LL);
  -[PBDisplayManager setColorCalibrations:](self, "setColorCalibrations:", v9);
}

- (void)removeColorCalibrations
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( -[PBDisplayManager _currentResolutionsPreferencesFromPersistentStore:]( self,  "_currentResolutionsPreferencesFromPersistentStore:",  1LL));
  id v4 = [v3 mutableCopy];

  [v4 setObject:0 forKeyedSubscript:@"TVColorCalibration"];
  -[PBDisplayManager _saveCurrentResolutionsPreferences:toPersistentStore:]( self,  "_saveCurrentResolutionsPreferences:toPersistentStore:",  v4,  1LL);
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSDictionary);
  -[PBDisplayManager setColorCalibrations:](self, "setColorCalibrations:", v5);
}

- (id)readColorCalibrations
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue( -[PBDisplayManager _currentResolutionsPreferencesFromPersistentStore:]( self,  "_currentResolutionsPreferencesFromPersistentStore:",  1LL));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"TVColorCalibration"]);
  uint64_t v5 = objc_opt_self(&OBJC_CLASS___NSDictionary, v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  char isKindOfClass = objc_opt_isKindOfClass(v3, v6);
  unsigned int v8 = &__NSDictionary0__struct;
  if ((isKindOfClass & 1) != 0) {
    unsigned int v8 = v3;
  }
  id v9 = v8;

  return v9;
}

- (void)saveLastCableErrorInfo:(id)a3
{
  if (a3)
  {
    id v14 = 0LL;
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  a3,  1LL,  &v14));
    id v5 = v14;
    if (v5)
    {
      id v6 = sub_100082A9C();
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100282F14((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);
      }
    }

    else
    {
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager defaults](self, "defaults"));
      -[os_log_s setObject:forKey:](v7, "setObject:forKey:", v4, @"TVLastCableErrorInfo");
    }
  }

  else
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[PBDisplayManager defaults](self, "defaults"));
    [v5 removeObjectForKey:@"TVLastCableErrorInfo"];
  }
}

- (id)readLastCableErrorInfo
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager defaults](self, "defaults"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"TVLastCableErrorInfo"]);

  if (v3)
  {
    uint64_t v5 = objc_opt_self(&OBJC_CLASS___PBCableSignalInfo, v4);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    id v18 = 0LL;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  v6,  v3,  &v18));
    id v8 = v18;

    if (v8)
    {
      id v9 = sub_100082A9C();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100282F78((uint64_t)v8, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

- (void)removeLastCableErrorInfo
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager defaults](self, "defaults"));
  [v2 removeObjectForKey:@"TVLastCableErrorInfo"];
}

- (void)saveDetectedPoorCableConnection:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager defaults](self, "defaults"));
  [v4 setBool:v3 forKey:@"TVDisplayDetectedPoorCableConnection"];
}

- (BOOL)readDetectedPoorCableConnection
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager defaults](self, "defaults"));
  unsigned __int8 v3 = [v2 BOOLForKey:@"TVDisplayDetectedPoorCableConnection"];

  return v3;
}

- (void)saveCableCheckCumulativeTime:(double)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager defaults](self, "defaults"));
  [v4 setDouble:@"TVDisplayCableCheckCumulativeTime" forKey:a3];
}

- (double)readCableCheckCumulativeTime
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager defaults](self, "defaults"));
  [v2 doubleForKey:@"TVDisplayCableCheckCumulativeTime"];
  double v4 = v3;

  return v4;
}

- (void)resetCableCheckCumulativeTime
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager defaults](self, "defaults"));
  [v2 removeObjectForKey:@"TVDisplayCableCheckCumulativeTime"];
}

- (BOOL)_shouldPreferDolbyVisionLowLatency
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager defaults](self, "defaults"));
  unsigned __int8 v3 = [v2 BOOLForKey:@"_TVPreferDolbyLowLatency"];

  return v3;
}

- (BOOL)_debugAlwaysSaveModeEnabled
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager defaults](self, "defaults"));
  unsigned __int8 v3 = [v2 BOOLForKey:@"_TVInternalDebugAlwaysSaveMode"];

  return v3;
}

- (double)readCableHistoryWindowOverride
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager defaults](self, "defaults"));
  [v2 doubleForKey:@"_TVDisplayCableHistoryWindowSecondsOverride"];
  double v4 = v3;

  return v4;
}

- (double)readCableErrorPollingIntervalOverride
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager defaults](self, "defaults"));
  [v2 doubleForKey:@"_TVCableErrorPollingIntervalOverride"];
  double v4 = v3;

  return v4;
}

- (int)readCableScoreOverride
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager defaults](self, "defaults"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"_TVCableScoreOverride"]);

  if (v3) {
    int v4 = [v3 intValue];
  }
  else {
    int v4 = 0x7FFFFFFF;
  }

  return v4;
}

- (double)readCableAlertIntervalOverride
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager defaults](self, "defaults"));
  [v2 doubleForKey:@"_TVDisplayCableAlertIntervalOverride"];
  double v4 = v3;

  return v4;
}

- (id)_locateLikelyOriginalDisplayPrefsForNewIdentifier:(id)a3 fromSet:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = -[PBDisplayIdentifier initWithEncodedString:]( objc_alloc(&OBJC_CLASS___PBDisplayIdentifier),  "initWithEncodedString:",  v5);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)i);
        if (-[PBDisplayIdentifier matchesIdentifierString:](v7, "matchesIdentifierString:", v12, (void)v14))
        {
          id v9 = (id)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v12]);
          goto LABEL_11;
        }
      }

      id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

- (id)_currentResolutionsPreferencesFromPersistentStore:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager currentDisplayIdentifier](self, "currentDisplayIdentifier"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[PBDisplayManager _currentResolutionsPreferencesFromPersistentStore:forDisplayID:]( self,  "_currentResolutionsPreferencesFromPersistentStore:forDisplayID:",  v3,  v5));

  return v6;
}

- (id)_currentResolutionsPreferencesFromPersistentStore:(BOOL)a3 forDisplayID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v4)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager defaults](self, "defaults"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"TVResolutions"]);

    if (!v8)
    {
      id v10 = 0LL;
LABEL_19:

      __int128 v26 = &__NSDictionary0__struct;
      goto LABEL_20;
    }

    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0)
    {
      id v27 = sub_100082A9C();
      __int128 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_100283040(v28, v29, v30, v31, v32, v33, v34, v35);
      }

      id v21 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager defaults](self, "defaults"));
      -[NSMutableDictionary removeObjectForKey:](v21, "removeObjectForKey:", @"TVResolutions");
      id v10 = 0LL;
      goto LABEL_18;
    }

    id v10 = (id)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v6]);
    if (!v10)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager currentDisplayIdentifier](self, "currentDisplayIdentifier"));
      id v10 = (id)objc_claimAutoreleasedReturnValue( -[PBDisplayManager _locateLikelyOriginalDisplayPrefsForNewIdentifier:fromSet:]( self,  "_locateLikelyOriginalDisplayPrefsForNewIdentifier:fromSet:",  v11,  v8));

      if (!v10) {
        goto LABEL_19;
      }
    }

    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v10, v12) & 1) == 0)
    {
      id v13 = sub_100082A9C();
      __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100282FDC((uint64_t)v6, v14, v15, v16, v17, v18, v19, v20);
      }

      id v21 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  v8);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", 0LL, v6);
      id v22 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager defaults](self, "defaults"));
      [v22 setObject:v21 forKey:@"TVResolutions"];

LABEL_18:
      goto LABEL_19;
    }
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager memoryStore](self, "memoryStore"));
    uint64_t v23 = objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v6]);
    __int128 v24 = (void *)v23;
    __int128 v25 = &__NSDictionary0__struct;
    if (v23) {
      __int128 v25 = (void *)v23;
    }
    id v10 = v25;
  }

  id v10 = v10;
  __int128 v26 = v10;
LABEL_20:

  return v26;
}

- (void)_saveCurrentResolutionsPreferences:(id)a3 toPersistentStore:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager currentDisplayIdentifier](self, "currentDisplayIdentifier"));
  -[PBDisplayManager _saveCurrentResolutionsPreferences:toPersistentStore:forDisplayID:]( self,  "_saveCurrentResolutionsPreferences:toPersistentStore:forDisplayID:",  v6,  v4,  v7);
}

- (void)_saveCurrentResolutionsPreferences:(id)a3 toPersistentStore:(BOOL)a4 forDisplayID:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (v6)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager defaults](self, "defaults"));
    uint64_t v12 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"TVResolutions"]);

    if (v12)
    {
      uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v12, v13) & 1) == 0)
      {
        id v19 = sub_100082A9C();
        uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_100283040(v20, v21, v22, v23, v24, v25, v26, v27);
        }

        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager defaults](self, "defaults"));
        [v18 removeObjectForKey:@"TVResolutions"];
        goto LABEL_13;
      }

      __int128 v14 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  v12);

      uint64_t v12 = v14;
    }

    else
    {
      uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager currentDisplayIdentifier](self, "currentDisplayIdentifier"));
    unsigned __int8 v17 = [v16 isEqualToString:@"_unknown_"];

    if ((v17 & 1) == 0)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v8, v10);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager defaults](self, "defaults"));
      [v18 setObject:v12 forKey:@"TVResolutions"];
LABEL_13:
    }

- (void)_saveDisplayMode:(id)a3 forKey:(id)a4 persisted:(BOOL)a5
{
  if (a3)
  {
    BOOL v5 = a5;
    id v8 = a4;
    id v9 = a3;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[PBDisplayManager _currentResolutionsPreferencesFromPersistentStore:]( self,  "_currentResolutionsPreferencesFromPersistentStore:",  v5));
    id v11 = [v10 mutableCopy];

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 encodedString]);
    [v11 setObject:v12 forKeyedSubscript:v8];

    -[PBDisplayManager _saveCurrentResolutionsPreferences:toPersistentStore:]( self,  "_saveCurrentResolutionsPreferences:toPersistentStore:",  v11,  v5);
  }

- (id)_readDisplayModeForKey:(id)a3 persisted:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[PBDisplayManager _currentResolutionsPreferencesFromPersistentStore:]( self,  "_currentResolutionsPreferencesFromPersistentStore:",  v4));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v6]);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0)
  {
LABEL_10:
    id v10 = 0LL;
    goto LABEL_11;
  }

  id v10 = -[PBSDisplayMode initWithEncodedString:](objc_alloc(&OBJC_CLASS___PBSDisplayMode), "initWithEncodedString:", v8);
  if (!-[PBDisplayManager _debugAlwaysSaveModeEnabled](self, "_debugAlwaysSaveModeEnabled"))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager sortedDisplayModes](self, "sortedDisplayModes"));
    unsigned __int8 v12 = [v11 containsObject:v10];

    if ((v12 & 1) == 0)
    {

LABEL_7:
      id v13 = sub_100082A9C();
      __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100283070();
      }

      goto LABEL_10;
    }
  }

  if (!v10) {
    goto LABEL_7;
  }
LABEL_11:

  return v10;
}

- (void)removeDisplayModeForKey:(id)a3 persisted:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[PBDisplayManager _currentResolutionsPreferencesFromPersistentStore:]( self,  "_currentResolutionsPreferencesFromPersistentStore:",  v4));
  id v8 = [v7 mutableCopy];

  [v8 setObject:0 forKeyedSubscript:v6];
  -[PBDisplayManager _saveCurrentResolutionsPreferences:toPersistentStore:]( self,  "_saveCurrentResolutionsPreferences:toPersistentStore:",  v8,  v4);
}

- (id)_displayModeForDisplayID:(id)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( -[PBDisplayManager _currentResolutionsPreferencesFromPersistentStore:forDisplayID:]( self,  "_currentResolutionsPreferencesFromPersistentStore:forDisplayID:",  1LL,  a3));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"TVUserSelectedMode"]);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
  {
LABEL_6:
    id v6 = 0LL;
    goto LABEL_7;
  }

  id v6 = -[PBSDisplayMode initWithEncodedString:](objc_alloc(&OBJC_CLASS___PBSDisplayMode), "initWithEncodedString:", v4);
  if (!v6)
  {
    id v7 = sub_100082A9C();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1002830DC();
    }

    goto LABEL_6;
  }

- (void)_saveDisplayMode:(id)a3 forDisplayID:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PBDisplayManager _currentResolutionsPreferencesFromPersistentStore:forDisplayID:]( self,  "_currentResolutionsPreferencesFromPersistentStore:forDisplayID:",  1LL,  v6));
    id v9 = [v8 mutableCopy];

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 encodedString]);
    [v9 setObject:v10 forKeyedSubscript:@"TVUserSelectedMode"];

    -[PBDisplayManager _saveCurrentResolutionsPreferences:toPersistentStore:forDisplayID:]( self,  "_saveCurrentResolutionsPreferences:toPersistentStore:forDisplayID:",  v9,  1LL,  v6);
  }

- (void)startMonitoringCable
{
  if (-[PBDisplayManager deemed4KCapable](self, "deemed4KCapable"))
  {
    if (-[PBDisplayManager isPresentingDisplayAssistant](self, "isPresentingDisplayAssistant"))
    {
      BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager presentedDisplayAssistantKind](self, "presentedDisplayAssistantKind"));
      BOOL v4 = [v3 integerValue] == 0;
    }

    else
    {
      BOOL v4 = 0;
    }

    -[PBDisplayManager _stopBackgroundMonitoring](self, "_stopBackgroundMonitoring");
    dispatch_source_t v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, &_dispatch_main_q);
    -[PBDisplayManager setCableCheckTimer:](self, "setCableCheckTimer:", v5);

    id v6 = (double *)&PBSCableMinimumCheckInterval;
    if (!v4) {
      id v6 = (double *)&unk_10046C100;
    }
    double v7 = *v6;
    id v8 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager cableCheckTimer](self, "cableCheckTimer"));
    dispatch_time_t v9 = dispatch_time(0LL, (unint64_t)(v7 * 1000000000.0));
    dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);

    objc_initWeak(&location, self);
    id v10 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager cableCheckTimer](self, "cableCheckTimer"));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10012C4A0;
    handler[3] = &unk_1003D1A50;
    objc_copyWeak(&v17, &location);
    BOOL v18 = v4;
    dispatch_source_set_event_handler(v10, handler);

    id v11 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager cableCheckTimer](self, "cableCheckTimer"));
    dispatch_activate(v11);

    id v12 = sub_100082A9C();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager cableCheckTimer](self, "cableCheckTimer"));
      uint64_t v15 = @"Passive Check";
      *(_DWORD *)buf = 136315906;
      uint64_t v21 = "-[PBDisplayManager(CableCheck) startMonitoringCable]";
      __int16 v22 = 2048;
      uint64_t v23 = v14;
      if (v4) {
        uint64_t v15 = @"Manual Cable Check";
      }
      __int16 v24 = 2114;
      uint64_t v25 = v15;
      __int16 v26 = 2048;
      double v27 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s (timer: %p) - Resetting monitoring (%{public}@), waiting the required %.0f seconds before starting to poll",  buf,  0x2Au);
    }

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

- (void)stopMonitoringCable
{
}

- (void)_processCurrentCableInfo
{
  double v4 = v3;
  -[PBDisplayManager readCableCheckCumulativeTime](self, "readCableCheckCumulativeTime");
  double v6 = v5;
  -[PBDisplayManager baseCableCheckTimeInterval](self, "baseCableCheckTimeInterval");
  if (v4 - v7 >= 0.0 || vabdd_f64(v4, v7) < 0.1)
  {
    double v11 = v6 + v4 - v7;
    -[PBDisplayManager saveCableCheckCumulativeTime:](self, "saveCableCheckCumulativeTime:", v11);
    -[PBDisplayManager setBaseCableCheckTimeInterval:](self, "setBaseCableCheckTimeInterval:", v4);
    dispatch_time_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[PBCableSignalInfo currentInfoWithLastCableCheckTime:]( &OBJC_CLASS___PBCableSignalInfo,  "currentInfoWithLastCableCheckTime:",  v11));
    if ([v9 linkQuality] == 0x80000000)
    {
      id v12 = sub_100082A9C();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager cableCheckTimer](self, "cableCheckTimer"));
        *(_DWORD *)uint64_t v31 = 136315650;
        *(void *)&v31[4] = "-[PBDisplayManager(CableCheck) _processCurrentCableInfo]";
        *(_WORD *)&v31[12] = 2048;
        *(void *)&v31[14] = v14;
        *(_WORD *)&v31[22] = 2114;
        uint64_t v32 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s (timer: %p) - Turning off the link monitoring as it is not supported for this video session:  %{public}@",  v31,  0x20u);
      }

      -[PBDisplayManager _stopBackgroundMonitoring](self, "_stopBackgroundMonitoring");
    }

    else
    {
      switch((unint64_t)[v9 cableStatus])
      {
        case 0uLL:
          id v15 = sub_100082A9C();
          uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_23;
          }
          id v17 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager cableCheckTimer](self, "cableCheckTimer"));
          *(_DWORD *)uint64_t v31 = 136315650;
          *(void *)&v31[4] = "-[PBDisplayManager(CableCheck) _processCurrentCableInfo]";
          *(_WORD *)&v31[12] = 2048;
          *(void *)&v31[14] = v17;
          *(_WORD *)&v31[22] = 2114;
          uint64_t v32 = v9;
          BOOL v18 = "%s (timer: %p) - Polled too close to video start: %{public}@. Considering this a no-op";
          goto LABEL_21;
        case 1uLL:
          id v19 = sub_100082A9C();
          uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_23;
          }
          id v17 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager cableCheckTimer](self, "cableCheckTimer"));
          *(_DWORD *)uint64_t v31 = 136315906;
          *(void *)&v31[4] = "-[PBDisplayManager(CableCheck) _processCurrentCableInfo]";
          *(_WORD *)&v31[12] = 2048;
          *(void *)&v31[14] = v17;
          *(_WORD *)&v31[22] = 2114;
          uint64_t v32 = v9;
          LOWORD(v33) = 1024;
          *(_DWORD *)((char *)&v33 + 2) = 75;
          BOOL v18 = "%s (timer: %p) - Current cable connection is ok: %{public}@, pass score is %i";
          goto LABEL_16;
        case 2uLL:
          -[PBDisplayManager setLastCableErrorInfo:](self, "setLastCableErrorInfo:", v9);
          id v20 = sub_100082A9C();
          uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_23;
          }
          id v17 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager cableCheckTimer](self, "cableCheckTimer"));
          *(_DWORD *)uint64_t v31 = 136315906;
          *(void *)&v31[4] = "-[PBDisplayManager(CableCheck) _processCurrentCableInfo]";
          *(_WORD *)&v31[12] = 2048;
          *(void *)&v31[14] = v17;
          *(_WORD *)&v31[22] = 2114;
          uint64_t v32 = v9;
          LOWORD(v33) = 1024;
          *(_DWORD *)((char *)&v33 + 2) = 75;
          BOOL v18 = "%s (timer: %p) - Bad cable connection detected: %{public}@, pass score is %i";
LABEL_16:
          uint64_t v21 = v16;
          uint32_t v22 = 38;
          goto LABEL_22;
        case 3uLL:
          id v23 = sub_100082A9C();
          uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_23;
          }
          id v17 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager cableCheckTimer](self, "cableCheckTimer"));
          *(_DWORD *)uint64_t v31 = 136315650;
          *(void *)&v31[4] = "-[PBDisplayManager(CableCheck) _processCurrentCableInfo]";
          *(_WORD *)&v31[12] = 2048;
          *(void *)&v31[14] = v17;
          *(_WORD *)&v31[22] = 2114;
          uint64_t v32 = v9;
          BOOL v18 = "%s (timer: %p) - There is no link to monitor: %{public}@. Considering this a no-op";
          goto LABEL_21;
        case 4uLL:
          id v24 = sub_100082A9C();
          uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_23;
          }
          id v17 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager cableCheckTimer](self, "cableCheckTimer"));
          *(_DWORD *)uint64_t v31 = 136315650;
          *(void *)&v31[4] = "-[PBDisplayManager(CableCheck) _processCurrentCableInfo]";
          *(_WORD *)&v31[12] = 2048;
          *(void *)&v31[14] = v17;
          *(_WORD *)&v31[22] = 2114;
          uint64_t v32 = v9;
          BOOL v18 = "%s (timer: %p) - Could not poll due to an unexpected error: %{public}@. Considering this a no-op";
LABEL_21:
          uint64_t v21 = v16;
          uint32_t v22 = 32;
LABEL_22:
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v18, v31, v22);

LABEL_23:
LABEL_24:
          -[PBDisplayManager setLastCablePollStatus:]( self,  "setLastCablePollStatus:",  objc_msgSend(v9, "cableStatus", *(_OWORD *)v31, *(void *)&v31[16], v32, v33));
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager lastCableErrorInfo](self, "lastCableErrorInfo"));

          if (v25)
          {
            __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager lastCableErrorInfo](self, "lastCableErrorInfo"));
            [v26 cableCheckTime];
            double v28 = v27;
            -[PBDisplayManager _historyWindowInterval](self, "_historyWindowInterval");
            BOOL v30 = v28 > v11 - v29;

            -[PBDisplayManager setDetectedPoorCableConnection:](self, "setDetectedPoorCableConnection:", v30);
          }

          break;
        default:
          goto LABEL_24;
      }
    }
  }

  else
  {
    id v8 = sub_100082A9C();
    dispatch_time_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager cableCheckTimer](self, "cableCheckTimer"));
      *(_DWORD *)uint64_t v31 = 136315394;
      *(void *)&v31[4] = "-[PBDisplayManager(CableCheck) _processCurrentCableInfo]";
      *(_WORD *)&v31[12] = 2048;
      *(void *)&v31[14] = v10;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v9,  OS_LOG_TYPE_DEFAULT,  "%s (timer: %p) - System time may have changed (ntp clock adjustments or DST changes for example), skip this cable poll",  v31,  0x16u);
    }
  }
}

- (void)resetCableInfoHistory
{
  id v3 = sub_100082A9C();
  double v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    double v6 = "-[PBDisplayManager(CableCheck) resetCableInfoHistory]";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s - Ressting cable history",  (uint8_t *)&v5,  0xCu);
  }

  -[PBDisplayManager setBaseCableCheckTimeInterval:](self, "setBaseCableCheckTimeInterval:", 0.0);
  -[PBDisplayManager setDetectedPoorCableConnection:](self, "setDetectedPoorCableConnection:", 0LL);
  -[PBDisplayManager setLastCableErrorInfo:](self, "setLastCableErrorInfo:", 0LL);
  -[PBDisplayManager resetCableCheckCumulativeTime](self, "resetCableCheckCumulativeTime");
  -[PBDisplayManager removeLastCableErrorInfo](self, "removeLastCableErrorInfo");
  -[PBDisplayManager _resetTimer](self, "_resetTimer");
}

- (void)registerModeSwitch
{
}

- (void)_resetTimer
{
}

- (void)_startBackgroundMonitoringAndIgnoreFirstPoll:(BOOL)a3
{
  double v6 = v5;
  dispatch_source_t v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, &_dispatch_main_q);
  -[PBDisplayManager setCableCheckTimer:](self, "setCableCheckTimer:", v7);

  id v8 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager cableCheckTimer](self, "cableCheckTimer"));
  dispatch_source_set_timer(v8, 0LL, (unint64_t)(v6 * 1000000000.0), 0x5F5E100uLL);

  v23[0] = 0LL;
  v23[1] = v23;
  v23[2] = 0x2020000000LL;
  char v24 = 1;
  objc_initWeak(&location, self);
  dispatch_time_t v9 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager cableCheckTimer](self, "cableCheckTimer"));
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  id v17 = sub_10012CDA8;
  BOOL v18 = &unk_1003D88C8;
  BOOL v21 = a3;
  id v19 = v23;
  objc_copyWeak(&v20, &location);
  dispatch_source_set_event_handler(v9, &v15);

  id v10 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager cableCheckTimer](self, "cableCheckTimer", v15, v16, v17, v18, v19));
  dispatch_activate(v10);

  id v11 = sub_100082A9C();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = (id)objc_claimAutoreleasedReturnValue(-[PBDisplayManager cableCheckTimer](self, "cableCheckTimer"));
    -[PBDisplayManager _historyWindowInterval](self, "_historyWindowInterval");
    *(_DWORD *)buf = 136316162;
    __int16 v26 = "-[PBDisplayManager(CableCheck) _startBackgroundMonitoringAndIgnoreFirstPoll:]";
    __int16 v27 = 2048;
    id v28 = v13;
    __int16 v29 = 2048;
    double v30 = v6;
    __int16 v31 = 1024;
    int v32 = 75;
    __int16 v33 = 2048;
    uint64_t v34 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s (timer: %p) - Started background cable monitoring with pollingInterval %.0f, minimumScoreForGoodCable %i, histo ryWindowInterval: %.0f",  buf,  0x30u);
  }

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
  _Block_object_dispose(v23, 8);
}

- (void)_stopBackgroundMonitoring
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager cableCheckTimer](self, "cableCheckTimer"));

  if (v3)
  {
    id v4 = sub_100082A9C();
    double v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      double v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager cableCheckTimer](self, "cableCheckTimer"));
      int v8 = 136315394;
      dispatch_time_t v9 = "-[PBDisplayManager(CableCheck) _stopBackgroundMonitoring]";
      __int16 v10 = 2048;
      id v11 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s (timer: %p) - Stopping cable monitoring",  (uint8_t *)&v8,  0x16u);
    }

    dispatch_source_t v7 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager cableCheckTimer](self, "cableCheckTimer"));
    dispatch_source_cancel(v7);

    -[PBDisplayManager setCableCheckTimer:](self, "setCableCheckTimer:", 0LL);
  }

- (double)_pollingInterval
{
  double v2 = PBSCableMinimumCheckInterval;
  -[PBDisplayManager readCableErrorPollingIntervalOverride](self, "readCableErrorPollingIntervalOverride");
  if (result <= 0.0) {
    return 900.0;
  }
  double v4 = v2 + 5.0;
  if (result < v4)
  {
    id v5 = sub_100082A9C();
    double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10028419C(v6, v4);
    }

    return v4;
  }

  return result;
}

- (double)_historyWindowInterval
{
  if (v3 <= 0.0) {
    return 72000.0;
  }
  -[PBDisplayManager readCableHistoryWindowOverride](self, "readCableHistoryWindowOverride");
  return result;
}

+ (PBDependencyDescription)dependencyDescription
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001F742C;
  v15[3] = &unk_1003CFF78;
  v15[4] = a1;
  double v2 = -[PBDependencyDescription initWithInstanceProvider:]( objc_alloc(&OBJC_CLASS___PBDependencyDescription),  "initWithInstanceProvider:",  v15);
  uint64_t v4 = objc_opt_self(&OBJC_CLASS___PBSceneManager, v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v17[0] = v5;
  uint64_t v7 = objc_opt_self(&OBJC_CLASS___PBWindowManager, v6);
  int v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v17[1] = v8;
  dispatch_time_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 2LL));
  -[PBDependencyDescription addDependencies:](v2, "addDependencies:", v9);

  uint64_t v11 = objc_opt_self(&OBJC_CLASS___PBInternalShortcutManager, v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v16 = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  -[PBDependencyDescription addDependencies:](v2, "addDependencies:", v13);

  return v2;
}

+ (PBDisplayManager)sharedInstance
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1001F74C4;
  v3[3] = &unk_1003D32B0;
  v3[4] = a2;
  v3[5] = a1;
  if (qword_1004714A8 != -1) {
    dispatch_once(&qword_1004714A8, v3);
  }
  return (PBDisplayManager *)(id)qword_1004714A0;
}

+ (id)sharedInstanceIfExists
{
  return (id)qword_1004714A0;
}

+ (void)reevaluateAtmosCapabilities
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedInstanceIfExists]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentDisplayMode]);
  [v2 adjustAtmos:v3];
}

- (PBDisplayManager)init
{
  id v2 = sub_100082A9C();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_fault_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_FAULT,  "You cannot create and init a PBDisplayManager; use +sharedInstance.",
      v5,
      2u);
  }

  __break(1u);
  return result;
}

- (id)_init
{
  v52.receiver = self;
  v52.super_class = (Class)&OBJC_CLASS___PBDisplayManager;
  id v2 = -[PBDisplayManager init](&v52, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[NSUserDefaults pb_appleTVServicesUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "pb_appleTVServicesUserDefaults"));
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v3;

    id v5 = objc_alloc_init(&OBJC_CLASS___NSDictionary);
    memoryStore = v2->_memoryStore;
    v2->_memoryStore = v5;

    dispatch_queue_t v7 = dispatch_queue_create_with_target_V2("PBDisplayManager.displayUpdateQueue", 0LL, 0LL);
    displayUpdateQueue = v2->_displayUpdateQueue;
    v2->_displayUpdateQueue = (OS_dispatch_queue *)v7;

    dispatch_time_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[PBDisplayIdentifier mainDisplayIdentifier]( &OBJC_CLASS___PBDisplayIdentifier,  "mainDisplayIdentifier"));
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 identifierString]);
    currentDisplayIdentifier = v2->_currentDisplayIdentifier;
    v2->_currentDisplayIdentifier = (NSString *)v10;

    id v12 = objc_alloc_init(&OBJC_CLASS___PBMultiLatch);
    wakeProgressLatch = v2->_wakeProgressLatch;
    v2->_wakeProgressLatch = v12;

    objc_initWeak(&location, v2);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](&OBJC_CLASS___CADisplay, "mainDisplay"));
    [v14 addObserver:v2 forKeyPath:@"availableModes" options:0 context:off_10046DE68];
    [v14 addObserver:v2 forKeyPath:@"currentMode" options:1 context:off_10046DE68];
    -[NSUserDefaults addObserver:forKeyPath:options:context:]( v2->_defaults,  "addObserver:forKeyPath:options:context:",  v2,  PBSAllModesAllowedKey,  0LL,  off_10046DE68);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAccessibilitySettings sharedInstance](&OBJC_CLASS___PBSAccessibilitySettings, "sharedInstance"));
    [v15 addObserver:v2 forKeyPath:@"displayFilterInvertColorsEnabled" options:0 context:off_10046DE70];
    [v15 addObserver:v2 forKeyPath:@"displayFilterColorAdjustmentsEnabled" options:0 context:off_10046DE70];
    [v15 addObserver:v2 forKeyPath:@"displayFilterReduceWhitePointEnabled" options:0 context:off_10046DE70];
    [v15 addObserver:v2 forKeyPath:@"displayFilterLightSensitivityEnabled" options:0 context:off_10046DE70];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v16 addObserver:v2 selector:"_mediaServicesWereReset:" name:AVAudioSessionMediaServicesWereResetNotification object:0];

    id v17 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    matchContentRequestedModes = v2->_matchContentRequestedModes;
    v2->_matchContentRequestedModes = v17;

    id v19 = -[NSHashTable initWithOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSHashTable),  "initWithOptions:capacity:",  5LL,  0LL);
    stateObservers = v2->_stateObservers;
    v2->_stateObservers = v19;

    BOOL v21 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    nextEstablishModePerDisplays = v2->_nextEstablishModePerDisplays;
    v2->_nextEstablishModePerDisplays = v21;

    id v23 = objc_alloc_init(&OBJC_CLASS___SSDisplay);
    systemState = v2->_systemState;
    v2->_systemState = v23;

    dispatch_source_t v25 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_data_or, 0LL, 0LL, &_dispatch_main_q);
    reloadStateSource = v2->_reloadStateSource;
    v2->_reloadStateSource = (OS_dispatch_source *)v25;

    __int16 v27 = (dispatch_source_s *)v2->_reloadStateSource;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1001F7AF0;
    handler[3] = &unk_1003D0890;
    objc_copyWeak(&v50, &location);
    dispatch_source_set_event_handler(v27, handler);
    dispatch_activate((dispatch_object_t)v2->_reloadStateSource);
    dispatch_source_t v28 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_data_or, 0LL, 0LL, &_dispatch_main_q);
    notifyClientsSource = v2->_notifyClientsSource;
    v2->_notifyClientsSource = (OS_dispatch_source *)v28;

    double v30 = (dispatch_source_s *)v2->_notifyClientsSource;
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472LL;
    v47[2] = sub_1001F7B1C;
    v47[3] = &unk_1003D0890;
    objc_copyWeak(&v48, &location);
    dispatch_source_set_event_handler(v30, v47);
    dispatch_activate((dispatch_object_t)v2->_notifyClientsSource);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    int v32 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_source_t v33 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v32);
    displayIDStabilizer = v2->_displayIDStabilizer;
    v2->_displayIDStabilizer = (OS_dispatch_source *)v33;

    uint64_t v35 = (dispatch_source_s *)v2->_displayIDStabilizer;
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472LL;
    v45[2] = sub_1001F7BAC;
    v45[3] = &unk_1003D0890;
    objc_copyWeak(&v46, &location);
    dispatch_source_set_event_handler(v35, v45);
    dispatch_activate((dispatch_object_t)v2->_displayIDStabilizer);
    -[PBDisplayManager recalculatedCurrentLocaleRefreshRate](v2, "recalculatedCurrentLocaleRefreshRate");
    v2->_localeRefreshRate = v36;
    -[PBDisplayManager addNativeAndPerformanceObservers](v2, "addNativeAndPerformanceObservers");
    v2->_softwareDisplaySize = *(CGSize *)PBSDisplaySize16x9;
    dispatch_source_merge_data((dispatch_source_t)v2->_reloadStateSource, 1uLL);
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    v42[2] = sub_1001F7C40;
    v42[3] = &unk_1003DCA08;
    BOOL v37 = v2;
    v43 = v37;
    objc_copyWeak(&v44, &location);
    +[PBDependencyCoordinator registerInstance:dependencyBlock:]( &OBJC_CLASS___PBDependencyCoordinator,  "registerInstance:dependencyBlock:",  v37,  v42);
    id v38 = sub_1000F7E4C(&_dispatch_main_q, v37);
    uint64_t v39 = objc_claimAutoreleasedReturnValue(v38);
    stateCaptureHandle = v37->_stateCaptureHandle;
    v37->_stateCaptureHandle = (BSInvalidatable *)v39;

    objc_destroyWeak(&v44);
    objc_destroyWeak(&v46);
    objc_destroyWeak(&v48);
    objc_destroyWeak(&v50);

    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)dealloc
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
  [v3 removeObserver:self];

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](&OBJC_CLASS___CADisplay, "mainDisplay"));
  [v4 removeObserver:self forKeyPath:@"availableModes" context:off_10046DE68];
  [v4 removeObserver:self forKeyPath:@"currentMode" context:off_10046DE68];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager defaults](self, "defaults"));
  [v5 removeObserver:self forKeyPath:PBSAllModesAllowedKey context:off_10046DE68];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[PBWindowManager sharedInstance](&OBJC_CLASS___PBWindowManager, "sharedInstance"));
  dispatch_queue_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 focusCoordinator]);
  [v7 removeObserver:self];

  int v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAccessibilitySettings sharedInstance](&OBJC_CLASS___PBSAccessibilitySettings, "sharedInstance"));
  [v8 removeObserver:self forKeyPath:@"displayFilterInvertColorsEnabled" context:off_10046DE70];
  [v8 removeObserver:self forKeyPath:@"displayFilterColorAdjustmentsEnabled" context:off_10046DE70];
  [v8 removeObserver:self forKeyPath:@"displayFilterReduceWhitePointEnabled" context:off_10046DE70];
  [v8 removeObserver:self forKeyPath:@"displayFilterLightSensitivityEnabled" context:off_10046DE70];
  dispatch_time_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v9 removeObserver:self name:AVAudioSessionMediaServicesWereResetNotification object:0];

  -[PBDisplayManager removeNativeAndPerformanceObservers](self, "removeNativeAndPerformanceObservers");
  dispatch_source_cancel((dispatch_source_t)self->_reloadStateSource);
  reloadStateSource = self->_reloadStateSource;
  self->_reloadStateSource = 0LL;

  dispatch_source_cancel((dispatch_source_t)self->_notifyClientsSource);
  notifyClientsSource = self->_notifyClientsSource;
  self->_notifyClientsSource = 0LL;

  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PBDisplayManager;
  -[PBDisplayManager dealloc](&v12, "dealloc");
}

- (int64_t)eARCStatus
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBEARCConfigurator sharedInstance](&OBJC_CLASS___PBEARCConfigurator, "sharedInstance"));
  id v3 = [v2 eARCStatus];

  return (int64_t)v3;
}

- (void)setLocaleRefreshRate:(double)a3
{
  if (self->_localeRefreshRate != a3)
  {
    -[PBDisplayManager willChangeValueForKey:](self, "willChangeValueForKey:", @"localeRefreshRate");
    self->_localeRefreshRate = a3;
    -[PBDisplayManager didChangeValueForKey:](self, "didChangeValueForKey:", @"localeRefreshRate");
    id v5 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager reloadStateSource](self, "reloadStateSource"));
    dispatch_source_merge_data(v5, 1uLL);
  }

- (void)setUserSelectedDisplayMode:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  userSelectedDisplayMode = self->_userSelectedDisplayMode;
  if (v4 | (unint64_t)userSelectedDisplayMode
    && (-[PBSDisplayMode isEqual:](userSelectedDisplayMode, "isEqual:", v4) & 1) == 0)
  {
    -[PBDisplayManager willChangeValueForKey:](self, "willChangeValueForKey:", @"userSelectedDisplayMode");
    uint64_t v6 = (void *)v4;
    if (!v4) {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager fallbackDisplayMode](self, "fallbackDisplayMode"));
    }
    dispatch_queue_t v7 = (PBSDisplayMode *)[v6 copy];
    int v8 = self->_userSelectedDisplayMode;
    self->_userSelectedDisplayMode = v7;

    if (!v4) {
    -[PBDisplayManager saveUserSelectedDisplayMode:]( self,  "saveUserSelectedDisplayMode:",  self->_userSelectedDisplayMode);
    }
    -[PBDisplayManager didChangeValueForKey:](self, "didChangeValueForKey:", @"userSelectedDisplayMode");
    dispatch_time_t v9 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager notifyClientsSource](self, "notifyClientsSource"));
    dispatch_source_merge_data(v9, 1uLL);
  }
}

- (void)setCanHandleHighBandwidthModes:(BOOL)a3
{
  if (self->_canHandleHighBandwidthModes != a3)
  {
    BOOL v3 = a3;
    -[PBDisplayManager willChangeValueForKey:](self, "willChangeValueForKey:", @"canHandleHighBandwidthModes");
    self->_canHandleHighBandwidthModes = v3;
    -[PBDisplayManager saveCanHandleHighBandwidthModes:](self, "saveCanHandleHighBandwidthModes:", v3);
    -[PBDisplayManager didChangeValueForKey:](self, "didChangeValueForKey:", @"canHandleHighBandwidthModes");
    id v5 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager notifyClientsSource](self, "notifyClientsSource"));
    dispatch_source_merge_data(v5, 1uLL);
  }

- (void)setShouldModeSwitchForDynamicRange:(BOOL)a3
{
  if (self->_shouldModeSwitchForDynamicRange != a3)
  {
    BOOL v3 = a3;
    -[PBDisplayManager willChangeValueForKey:](self, "willChangeValueForKey:", @"shouldModeSwitchForDynamicRange");
    self->_shouldModeSwitchForDynamicRange = v3;
    -[PBDisplayManager saveShouldModeSwitchForDynamicRange:](self, "saveShouldModeSwitchForDynamicRange:", v3);
    -[PBDisplayManager didChangeValueForKey:](self, "didChangeValueForKey:", @"shouldModeSwitchForDynamicRange");
    id v5 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager notifyClientsSource](self, "notifyClientsSource"));
    dispatch_source_merge_data(v5, 1uLL);
  }

- (void)setShouldModeSwitchForFrameRate:(BOOL)a3
{
  if (self->_shouldModeSwitchForFrameRate != a3)
  {
    BOOL v3 = a3;
    -[PBDisplayManager willChangeValueForKey:](self, "willChangeValueForKey:", @"shouldModeSwitchForFrameRate");
    self->_shouldModeSwitchForFrameRate = v3;
    -[PBDisplayManager saveShouldModeSwitchForFrameRate:](self, "saveShouldModeSwitchForFrameRate:", v3);
    -[PBDisplayManager didChangeValueForKey:](self, "didChangeValueForKey:", @"shouldModeSwitchForFrameRate");
    id v5 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager notifyClientsSource](self, "notifyClientsSource"));
    dispatch_source_merge_data(v5, 1uLL);
  }

- (void)setShouldUseQMSForFrameRateSwitching:(BOOL)a3
{
  if (self->_shouldUseQMSForFrameRateSwitching != a3)
  {
    BOOL v3 = a3;
    -[PBDisplayManager willChangeValueForKey:]( self,  "willChangeValueForKey:",  @"shouldUseQMSForFrameRateSwitching");
    self->_shouldUseQMSForFrameRateSwitching = v3;
    -[PBDisplayManager saveShouldUseQMSForFrameRateSwitching:](self, "saveShouldUseQMSForFrameRateSwitching:", v3);
    -[PBDisplayManager didChangeValueForKey:](self, "didChangeValueForKey:", @"shouldUseQMSForFrameRateSwitching");
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](&OBJC_CLASS___CADisplay, "mainDisplay"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 externalDisplayAttributes]);
    id v7 = [v6 discreteMediaRefreshRate];

    if (v7 == (id)2)
    {
      int v8 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](&OBJC_CLASS___CADisplay, "mainDisplay"));
      [v8 setDmrrEnabled:v3];
    }

    dispatch_time_t v9 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager notifyClientsSource](self, "notifyClientsSource"));
    dispatch_source_merge_data(v9, 1uLL);
  }

- (void)setHdr10PlusMetadataEnabled:(BOOL)a3
{
  if (self->_hdr10PlusMetadataEnabled != a3)
  {
    BOOL v3 = a3;
    -[PBDisplayManager willChangeValueForKey:](self, "willChangeValueForKey:", @"hdr10PlusMetadataEnabled");
    self->_hdr10PlusMetadataEnabled = v3;
    -[PBDisplayManager saveHDR10PlusMetadataEnabled:](self, "saveHDR10PlusMetadataEnabled:", v3);
    -[PBDisplayManager didChangeValueForKey:](self, "didChangeValueForKey:", @"hdr10PlusMetadataEnabled");
    id v5 = sub_100082A9C();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_hdr10PlusMetadataEnabled) {
        id v7 = "ENABLED";
      }
      else {
        id v7 = "DISABLED";
      }
      int v13 = 136446210;
      uint64_t v14 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "HDR10+ metadata %{public}s",  (uint8_t *)&v13,  0xCu);
    }

    if (!MGGetBoolAnswer(@"EqrsVvjcYDdxHBiQmGhAWw")
      || (int v8 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](&OBJC_CLASS___CADisplay, "mainDisplay")),
          dispatch_time_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 externalDisplayAttributes]),
          id v10 = [v9 hdr10PlusMetadata],
          v9,
          v8,
          v10 == (id)2))
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](&OBJC_CLASS___CADisplay, "mainDisplay"));
      [v11 setHdr10PlusMetadataEnabled:self->_hdr10PlusMetadataEnabled];
    }

    objc_super v12 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager notifyClientsSource](self, "notifyClientsSource"));
    dispatch_source_merge_data(v12, 1uLL);
  }

- (void)setSoftwareDisplaySize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (sub_1001C9E00())
  {
    if (width == CGSizeZero.width && height == CGSizeZero.height)
    {
      double width = PBSDisplaySize16x9[0];
      double height = PBSDisplaySize16x9[1];
    }

    if (self->_softwareDisplaySize.width != width || self->_softwareDisplaySize.height != height)
    {
      -[PBDisplayManager willChangeValueForKey:](self, "willChangeValueForKey:", @"softwareDisplaySize");
      self->_softwareDisplaySize.double width = width;
      self->_softwareDisplaySize.double height = height;
      -[PBDisplayManager saveSoftwareDisplaySize:](self, "saveSoftwareDisplaySize:", width, height);
      -[PBDisplayManager didChangeValueForKey:](self, "didChangeValueForKey:", @"softwareDisplaySize");
      id v7 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager notifyClientsSource](self, "notifyClientsSource"));
      dispatch_source_merge_data(v7, 1uLL);
    }
  }

- (void)setAtmosEnabled:(BOOL)a3
{
  if (self->_atmosEnabled != a3)
  {
    BOOL v3 = a3;
    -[PBDisplayManager willChangeValueForKey:](self, "willChangeValueForKey:", @"atmosEnabled");
    self->_atmosEnabled = v3;
    -[PBDisplayManager saveAtmosEnabled:](self, "saveAtmosEnabled:", v3);
    -[PBDisplayManager didChangeValueForKey:](self, "didChangeValueForKey:", @"atmosEnabled");
    id v5 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager notifyClientsSource](self, "notifyClientsSource"));
    dispatch_source_merge_data(v5, 1uLL);
  }

- (void)setDetectedPoorCableConnection:(BOOL)a3
{
  if (self->_detectedPoorCableConnection != a3)
  {
    BOOL v3 = a3;
    -[PBDisplayManager willChangeValueForKey:](self, "willChangeValueForKey:", @"detectedPoorCableConnection");
    self->_detectedPoorCableConnection = v3;
    -[PBDisplayManager saveDetectedPoorCableConnection:](self, "saveDetectedPoorCableConnection:", v3);
    -[PBDisplayManager didChangeValueForKey:](self, "didChangeValueForKey:", @"detectedPoorCableConnection");
    if (!v3) {
      -[PBDisplayManager resetCableInfoHistory](self, "resetCableInfoHistory");
    }
    id v5 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager notifyClientsSource](self, "notifyClientsSource"));
    dispatch_source_merge_data(v5, 1uLL);
  }

- (void)setLastCablePollStatus:(int64_t)a3
{
  if (self->_lastCablePollStatus != a3)
  {
    -[PBDisplayManager willChangeValueForKey:](self, "willChangeValueForKey:", @"lastCablePollStatus");
    self->_lastCablePollStatus = a3;
    -[PBDisplayManager didChangeValueForKey:](self, "didChangeValueForKey:", @"lastCablePollStatus");
    id v5 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager notifyClientsSource](self, "notifyClientsSource"));
    dispatch_source_merge_data(v5, 1uLL);
  }

- (void)setUserPreferredRefreshRate:(double)a3
{
  if (self->_userPreferredRefreshRate != a3)
  {
    -[PBDisplayManager willChangeValueForKey:](self, "willChangeValueForKey:", @"userPreferredRefreshRate");
    self->_userPreferredRefreshRate = a3;
    -[PBDisplayManager saveUserPreferredRefreshRate:](self, "saveUserPreferredRefreshRate:", a3);
    -[PBDisplayManager didChangeValueForKey:](self, "didChangeValueForKey:", @"userPreferredRefreshRate");
  }

- (void)setEncodedPromotedDisplayModes:(id)a3
{
  unint64_t v5 = (unint64_t)a3;
  encodedPromotedDisplayModes = self->_encodedPromotedDisplayModes;
  if (v5 | (unint64_t)encodedPromotedDisplayModes
    && (-[NSSet isEqual:](encodedPromotedDisplayModes, "isEqual:", v5) & 1) == 0)
  {
    -[PBDisplayManager willChangeValueForKey:](self, "willChangeValueForKey:", @"encodedPromotedDisplayModes");
    objc_storeStrong((id *)&self->_encodedPromotedDisplayModes, a3);
    -[PBDisplayManager didChangeValueForKey:](self, "didChangeValueForKey:", @"encodedPromotedDisplayModes");
    id v7 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager reloadStateSource](self, "reloadStateSource"));
    dispatch_source_merge_data(v7, 1uLL);
  }
}

- (void)setAudioLatencies:(id)a3
{
  unint64_t v5 = (unint64_t)a3;
  audioLatencies = self->_audioLatencies;
  if (v5 | (unint64_t)audioLatencies
    && (-[NSDictionary isEqual:](audioLatencies, "isEqual:", v5) & 1) == 0)
  {
    -[PBDisplayManager willChangeValueForKey:](self, "willChangeValueForKey:", @"audioLatencies");
    objc_storeStrong((id *)&self->_audioLatencies, a3);
    -[PBDisplayManager didChangeValueForKey:](self, "didChangeValueForKey:", @"audioLatencies");
    id v7 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager notifyClientsSource](self, "notifyClientsSource"));
    dispatch_source_merge_data(v7, 1uLL);
  }
}

- (void)setColorCalibrations:(id)a3
{
  unint64_t v5 = (unint64_t)a3;
  colorCalibrations = self->_colorCalibrations;
  if (v5 | (unint64_t)colorCalibrations
    && (-[NSDictionary isEqual:](colorCalibrations, "isEqual:", v5) & 1) == 0)
  {
    -[PBDisplayManager willChangeValueForKey:](self, "willChangeValueForKey:", @"colorCalibrations");
    objc_storeStrong((id *)&self->_colorCalibrations, a3);
    -[PBDisplayManager didChangeValueForKey:](self, "didChangeValueForKey:", @"colorCalibrations");
    id v7 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager reloadStateSource](self, "reloadStateSource"));
    dispatch_source_merge_data(v7, 1uLL);
  }
}

- (void)setColorGains:(id)a3
{
  id v3 = a3;
  float v4 = 1.0;
  float v5 = 1.0;
  float v6 = 1.0;
  if ([v3 count] == (id)4)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:0]);
    [v7 floatValue];
    float v9 = v8;

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:1]);
    [v10 floatValue];
    float v12 = v11;

    int v13 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:2]);
    [v13 floatValue];
    float v15 = v14;

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:3]);
    [v16 floatValue];
    float v18 = v17;

    float v6 = (float)(1.0 - v18) + (float)(v9 * v18);
    float v5 = (float)(1.0 - v18) + (float)(v12 * v18);
    float v4 = (float)(1.0 - v18) + (float)(v15 * v18);
  }

  BOOL v19 = v6 >= 0.0 && v6 <= 1.0;
  if (!v19
    || (v5 >= 0.0 ? (BOOL v20 = v5 <= 1.0) : (BOOL v20 = 0),
        !v20 || (v4 >= 0.0 ? (BOOL v21 = v4 <= 1.0) : (BOOL v21 = 0), !v21 || (float)(v4 + (float)(v5 + v6)) == 0.0)))
  {
    id v22 = sub_100082A9C();
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_100292050();
    }

    float v4 = 1.0;
    float v5 = 1.0;
    float v6 = 1.0;
  }

  id v24 = sub_100082A9C();
  dispatch_source_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 134218496;
    double v28 = v6;
    *(_WORD *)__int16 v29 = 2048;
    *(double *)&v29[2] = v5;
    *(_WORD *)&v29[10] = 2048;
    *(double *)&v29[12] = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Applying color gains (%f, %f, %f)",  (uint8_t *)&v27,  0x20u);
  }

  int v27 = LODWORD(v6);
  double v28 = 0.0;
  *(_DWORD *)__int16 v29 = 0;
  *(float *)&v29[4] = v5;
  *(void *)&v29[8] = 0LL;
  *(_DWORD *)&v29[16] = 0;
  float v30 = v4;
  int v31 = 1065353216;
  CARenderServerSetAXMatrix(0LL, &v27);
  __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](&OBJC_CLASS___CADisplay, "mainDisplay"));
  [v26 update];
}

- (void)setLastCableErrorInfo:(id)a3
{
  unint64_t v5 = (unint64_t)a3;
  lastCableErrorInfo = self->_lastCableErrorInfo;
  if (v5 | (unint64_t)lastCableErrorInfo && !-[PBCableSignalInfo isEqual:](lastCableErrorInfo, "isEqual:", v5))
  {
    objc_storeStrong((id *)&self->_lastCableErrorInfo, a3);
    -[PBDisplayManager saveLastCableErrorInfo:](self, "saveLastCableErrorInfo:", self->_lastCableErrorInfo);
  }
}

- (id)promotedVirtualDisplayModes
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  float v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager encodedPromotedDisplayModes](self, "encodedPromotedDisplayModes", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      float v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        float v9 = -[PBSDisplayMode initWithEncodedString:]( objc_alloc(&OBJC_CLASS___PBSDisplayMode),  "initWithEncodedString:",  *(void *)(*((void *)&v11 + 1) + 8LL * (void)v8));
        if (v9) {
          -[NSMutableSet addObject:](v3, "addObject:", v9);
        }

        float v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

  return v3;
}

- (double)baseCableCheckTimeInterval
{
  double result = self->_baseCableCheckTimeInterval;
  if (result == 0.0)
  {
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    self->_baseCableCheckTimeInterval = result;
  }

  return result;
}

- (BOOL)isAdvertisingHDMI2
{
  return PBSConnectedToHDMI2(self, a2);
}

- (BOOL)displaySupportsVRR
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[PBDisplayIdentifier mainDisplayIdentifier]( &OBJC_CLASS___PBDisplayIdentifier,  "mainDisplayIdentifier"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 capabilities]);
  unsigned __int8 v4 = [v3 supportsVRR];

  return v4;
}

- (BOOL)displaySupportsQMS
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[PBDisplayIdentifier mainDisplayIdentifier]( &OBJC_CLASS___PBDisplayIdentifier,  "mainDisplayIdentifier"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 capabilities]);
  unsigned __int8 v4 = [v3 supportsQMS];

  return v4;
}

- (BOOL)displaySupportsHDR10Plus
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[PBDisplayIdentifier mainDisplayIdentifier]( &OBJC_CLASS___PBDisplayIdentifier,  "mainDisplayIdentifier"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 capabilities]);
  unsigned __int8 v4 = [v3 supportsHDR10Plus];

  return v4;
}

- (BOOL)isPresentingDisplayAssistant
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager presentedDisplayAssistantKind](self, "presentedDisplayAssistantKind"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (NSDictionary)serialisedState
{
  BOOL v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[PBDisplayManager localeRefreshRate](self, "localeRefreshRate");
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v4,  @"localeRefreshRate");

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager sortedDisplayModes](self, "sortedDisplayModes"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v5,  @"sortedDisplayModes");

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager fallbackDisplayMode](self, "fallbackDisplayMode"));
  if (v6)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v6,  @"fallbackDisplayMode");
  }

  else
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v7,  @"fallbackDisplayMode");
  }

  float v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager currentDisplayMode](self, "currentDisplayMode"));
  if (v8)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v8,  @"currentDisplayMode");
  }

  else
  {
    float v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v9,  @"currentDisplayMode");
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager currentDisplayID](self, "currentDisplayID"));
  if (v10)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v10,  @"currentDisplayID");
  }

  else
  {
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v11,  @"currentDisplayID");
  }

  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager userSelectedDisplayMode](self, "userSelectedDisplayMode"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v12,  @"userSelectedDisplayMode");

  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager seenDisplayIDs](self, "seenDisplayIDs"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v13, @"seenDisplayIDs");

  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[PBDisplayManager canHandleHighBandwidthModes](self, "canHandleHighBandwidthModes")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v14,  @"canHandleHighBandwidthModes");

  float v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[PBDisplayManager shouldModeSwitchForDynamicRange](self, "shouldModeSwitchForDynamicRange")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v15,  @"shouldModeSwitchForDynamicRange");

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[PBDisplayManager shouldModeSwitchForFrameRate](self, "shouldModeSwitchForFrameRate")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v16,  @"shouldModeSwitchForFrameRate");

  float v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[PBDisplayManager shouldUseQMSForFrameRateSwitching](self, "shouldUseQMSForFrameRateSwitching")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v17,  @"shouldUseQMSForFrameRateSwitching");

  float v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[PBDisplayManager hdr10PlusMetadataEnabled](self, "hdr10PlusMetadataEnabled")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v18,  @"hdr10PlusMetadataEnabled");

  BOOL v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[PBDisplayManager atmosEnabled](self, "atmosEnabled")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v19, @"atmosEnabled");

  BOOL v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[PBDisplayManager detectedPoorCableConnection](self, "detectedPoorCableConnection")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v20,  @"detectedPoorCableConnection");

  BOOL v21 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager promotedVirtualDisplayModes](self, "promotedVirtualDisplayModes"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v21,  @"promotedVirtualDisplayModes");

  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[PBDisplayManager lastCablePollStatus](self, "lastCablePollStatus")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v22,  @"lastCablePollStatus");

  id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[PBDisplayManager deemed4KCapable](self, "deemed4KCapable")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v23, @"deemed4KCapable");

  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager audioLatencies](self, "audioLatencies"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v24, @"audioLatencies");

  dispatch_source_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[PBEARCConfigurator sharedInstance](&OBJC_CLASS___PBEARCConfigurator, "sharedInstance"));
  __int16 v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v25 eARCStatus]));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v26, @"eARCStatus");

  int v27 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager colorCalibrations](self, "colorCalibrations"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v27,  @"colorCalibrations");

  double v28 = (void *)objc_claimAutoreleasedReturnValue( +[PBDisplayIdentifier mainDisplayIdentifier]( &OBJC_CLASS___PBDisplayIdentifier,  "mainDisplayIdentifier"));
  __int16 v29 = (void *)objc_claimAutoreleasedReturnValue([v28 capabilities]);
  float v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v29 supportsVRR]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v30,  @"displaySupportsVRR");

  int v31 = (void *)objc_claimAutoreleasedReturnValue([v28 capabilities]);
  int v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v31 supportsQMS]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v32,  @"displaySupportsQMS");

  dispatch_source_t v33 = (void *)objc_claimAutoreleasedReturnValue([v28 capabilities]);
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v33 supportsHDR10Plus]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v34,  @"displaySupportsHDR10Plus");

  if (sub_1001C9E00())
  {
    -[PBDisplayManager softwareDisplaySize](self, "softwareDisplaySize");
    uint64_t v37 = PBSSerializableStringFromDisplaySize(v35, v36);
    id v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v38,  @"softwareDisplaySize");
  }

  return (NSDictionary *)v3;
}

- (UIApplicationSceneDeactivationAssertion)noScreenAssertion
{
  noScreenAssertion = self->_noScreenAssertion;
  if (!noScreenAssertion)
  {
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sceneDeactivationManager]);
    id v6 = (UIApplicationSceneDeactivationAssertion *)[v5 newAssertionWithReason:7];
    uint64_t v7 = self->_noScreenAssertion;
    self->_noScreenAssertion = v6;

    noScreenAssertion = self->_noScreenAssertion;
  }

  return noScreenAssertion;
}

- (void)fetchCurrentDisplayStateWithReply:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager serialisedState](self, "serialisedState"));
    (*((void (**)(id, void *, void))a3 + 2))(v5, v6, 0LL);
  }

- (id)filterModes:(id)a3
{
  uint64_t v3 = PBSFilteredModesForDisplayState(self, a3);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (id)findFirstMode:(id)a3
{
  uint64_t ModeForDisplayState = PBSFindFirstModeForDisplayState(self, a3);
  return (id)objc_claimAutoreleasedReturnValue(ModeForDisplayState);
}

- (id)findMatchingLocaleMode:(id)a3 enforceVirtualCheck:(BOOL)a4
{
  uint64_t v4 = PBSFindMatchingLocaleModeForDisplayState(self, a3, a4);
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (id)findMatchingCAMode:(id)a3
{
  id v4 = a3;
  if (-[PBDisplayManager _debugAlwaysSaveModeEnabled](self, "_debugAlwaysSaveModeEnabled"))
  {
    id v5 = sub_100082A9C();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v27 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "!_TVInternalDebugAlwaysSaveMode enabled! - Looking for matching CA displayMode for %{public}@",  buf,  0xCu);
    }
  }

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](&OBJC_CLASS___CADisplay, "mainDisplay"));
  float v8 = (void *)objc_claimAutoreleasedReturnValue([v7 availableModes]);

  id obj = v8;
  id v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v22;
    while (2)
    {
      __int128 v12 = 0LL;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(obj);
        }
        __int128 v13 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)v12);
        BOOL v14 = !-[PBDisplayManager _debugAlwaysSaveModeEnabled](self, "_debugAlwaysSaveModeEnabled")
           && -[PBDisplayManager filteredUsingdPineBoardPolicy](self, "filteredUsingdPineBoardPolicy");
        float v15 = objc_alloc(&OBJC_CLASS___PBSDisplayMode);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager encodedPromotedDisplayModes](self, "encodedPromotedDisplayModes"));
        float v17 = -[PBSDisplayMode initWithCADisplayMode:usePineBoardPolicy:encodedPromotedModes:]( v15,  "initWithCADisplayMode:usePineBoardPolicy:encodedPromotedModes:",  v13,  v14,  v16);

        if ([v4 isEqual:v17])
        {
          id v18 = v13;

          goto LABEL_18;
        }

        __int128 v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  id v18 = 0LL;
LABEL_18:

  return v18;
}

- (void)enableModeSwitchingForDynamicRange:(BOOL)a3
{
}

- (void)enableModeSwitchingForFrameRate:(BOOL)a3
{
}

- (void)enableQMSForFrameRateSwitching:(BOOL)a3
{
}

- (void)enableHDR10PlusMetadata:(BOOL)a3
{
}

- (void)updateSoftwareDisplaySize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
}

- (void)enableAtmos:(BOOL)a3
{
}

- (void)updateCurrentCADisplayFromDisplayMode:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, NSString *))a4;
  id v7 = a3;
  float v8 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](&OBJC_CLASS___CADisplay, "mainDisplay"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager findMatchingCAMode:](self, "findMatchingCAMode:", v7));

  if (v8) {
    BOOL v10 = v9 == 0LL;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    uint64_t v11 = objc_alloc(&OBJC_CLASS___NSError);
    uint64_t v12 = PBSDisplayManagerErrorDomain;
    NSErrorUserInfoKey v57 = NSLocalizedFailureReasonErrorKey;
    v58 = @"Trying to update with a nil displayMode";
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v58,  &v57,  1LL));
    BOOL v14 = -[NSError initWithDomain:code:userInfo:](v11, "initWithDomain:code:userInfo:", v12, 832001LL, v13);

    id v15 = sub_100082A9C();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1002920B0(v16, v17, v18, v19, v20, v21, v22, v23);
    }

    if (v6) {
      v6[2](v6, v14);
    }
  }

  else
  {
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v8 availableModes]);
    unsigned __int8 v25 = [v24 containsObject:v9];

    if ((v25 & 1) != 0)
    {
      BOOL v14 = (NSString *)objc_claimAutoreleasedReturnValue([v8 currentMode]);
      id v26 = -[NSString isEqual:](v14, "isEqual:", v9);
      if (!(_DWORD)v26)
      {
LABEL_17:
        BOOL v32 = MGGetProductType(v26, v27) == 33245053 && (unint64_t)-[NSString width](v14, "width") < 0x500;
        id v39 = sub_100082A9C();
        v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_INFO,  "Suspending state-reload dispatch source temporarily...",  buf,  2u);
        }

        v41 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager reloadStateSource](self, "reloadStateSource"));
        dispatch_suspend(v41);

        id v42 = sub_100082A9C();
        v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "Dispatching display-mode work to background queue",  buf,  2u);
        }

        displayUpdateQueue = (dispatch_queue_s *)self->_displayUpdateQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_1001F9D68;
        block[3] = &unk_1003DCA58;
        id v48 = v9;
        id v49 = v8;
        id v50 = self;
        BOOL v14 = v14;
        v51 = v14;
        BOOL v53 = v32;
        objc_super v52 = v6;
        dispatch_async(displayUpdateQueue, block);

        goto LABEL_30;
      }

      double v28 = (void *)objc_claimAutoreleasedReturnValue([v8 externalDisplayAttributes]);
      if ([v28 discreteMediaRefreshRate] == (id)2)
      {
        unsigned int v29 = -[PBDisplayManager shouldUseQMSForFrameRateSwitching](self, "shouldUseQMSForFrameRateSwitching");

        if (v29)
        {
          id v30 = sub_100082A9C();
          int v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Allowing switch to current mode because QMS is enabled",  buf,  2u);
          }

          goto LABEL_17;
        }
      }

      else
      {
      }

      id v45 = sub_100082A9C();
      id v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "Display mode update specifies current mode, not changing anything.",  buf,  2u);
      }

      if (v6) {
        v6[2](v6, 0LL);
      }
    }

    else
    {
      BOOL v14 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Desired mode no longer valid: %@",  v9);
      dispatch_source_t v33 = objc_alloc(&OBJC_CLASS___NSError);
      uint64_t v34 = PBSDisplayManagerErrorDomain;
      NSErrorUserInfoKey v55 = NSLocalizedFailureReasonErrorKey;
      v56 = v14;
      double v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v56,  &v55,  1LL));
      double v36 = -[NSError initWithDomain:code:userInfo:](v33, "initWithDomain:code:userInfo:", v34, 832001LL, v35);

      id v37 = sub_100082A9C();
      id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        sub_100292120();
      }

      if (v6) {
        v6[2](v6, (NSString *)&v36->super.isa);
      }
    }
  }

- (void)updateDisplayManagerWithRequest:(id)a3 reply:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_initWeak(&location, self);
  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472LL;
  v80[2] = sub_1001FAA54;
  v80[3] = &unk_1003DCA80;
  objc_copyWeak(v82, &location);
  id v62 = v8;
  id v81 = v62;
  v82[1] = (id)a2;
  v63 = objc_retainBlock(v80);
  id v9 = sub_100082A9C();
  BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = (id)objc_claimAutoreleasedReturnValue([v7 reason]);
    id v12 = (id)objc_claimAutoreleasedReturnValue([v7 displayMode]);
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager currentDisplayMode](self, "currentDisplayMode"));
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v11;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2114;
    uint64_t v85 = (uint64_t)v13;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Received request to update display mode with reason: %{public}@, requested mode: %{public}@, current mode: %{public}@",  buf,  0x20u);
  }

  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v7 displayMode]);
  if (v14)
  {
    id v15 = (NSString *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager priorDisplayUpdateRequest](self, "priorDisplayUpdateRequest"));
    unsigned int v16 = [v7 allowCoalescing];
    if (v15) {
      unsigned int v17 = v16;
    }
    else {
      unsigned int v17 = 0;
    }
    if (v17 == 1)
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v7 requestDate]);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSString requestDate](v15, "requestDate"));
      [v18 timeIntervalSinceDate:v19];
      BOOL v21 = v20 > 3.0;

      if (!v21)
      {
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSString displayMode](v15, "displayMode"));
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager userSelectedDisplayMode](self, "userSelectedDisplayMode"));
        if (v22 && ([v22 isEqualToPBSDisplayMode:v14 enforceVirtualCheck:1] & 1) == 0)
        {
          id v24 = sub_100082B8C();
          unsigned __int8 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
          {
            id v56 = (id)objc_claimAutoreleasedReturnValue(-[NSString displayMode](v15, "displayMode"));
            id v61 = (id)objc_claimAutoreleasedReturnValue(-[NSString reason](v15, "reason"));
            id v57 = (id)objc_claimAutoreleasedReturnValue([v7 displayMode]);
            uint64_t v58 = objc_claimAutoreleasedReturnValue([v7 reason]);
            *(_DWORD *)buf = 138544386;
            v60 = v56;
            *(void *)&uint8_t buf[4] = v56;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v61;
            *(_WORD *)&buf[22] = 2114;
            uint64_t v85 = (uint64_t)v57;
            __int16 v86 = 2114;
            v59 = (void *)v58;
            uint64_t v87 = v58;
            __int16 v88 = 2114;
            v89 = v23;
            _os_log_fault_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_FAULT,  "Back-to-back mode switches detected. %{public}@ (%{public}@) -> %{public}@ (%{public}@}). User selected mode = %{public}@",  buf,  0x34u);
          }
        }
      }
    }

    -[PBDisplayManager setPriorDisplayUpdateRequest:](self, "setPriorDisplayUpdateRequest:", v7);
    id v26 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager priorDisplayUpdateRequest](self, "priorDisplayUpdateRequest"));
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v26 setRequestDate:v27];

    double v28 = (NSError *)objc_claimAutoreleasedReturnValue([v7 userInfo]);
    unsigned int v29 = [v7 treatDisplayModeAsFallback];
    if (v29) {
      -[PBDisplayManager _resetSettingsForCurrentDisplay](self, "_resetSettingsForCurrentDisplay");
    }
    if (([v7 useDisplayModeAsDefaultForNextWake] & 1) == 0)
    {
      id v30 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager nextEstablishModePerDisplays](self, "nextEstablishModePerDisplays"));
      int v31 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager currentDisplayIdentifier](self, "currentDisplayIdentifier"));
      [v30 removeObjectForKey:v31];
    }

    BOOL v32 = (void *)objc_claimAutoreleasedReturnValue( -[NSError objectForKeyedSubscript:]( v28,  "objectForKeyedSubscript:",  PBSDisplayManagerUpdateRequestPassthroughKey));
    unsigned int v33 = [v32 BOOLValue];

    if (((v33 | v29) & 1) != 0)
    {
      if ([v7 useDisplayModeAsDefaultForNextWake])
      {
        id v34 = sub_100082A9C();
        double v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Saving mode for next wake %{public}@",  buf,  0xCu);
        }

        double v36 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager nextEstablishModePerDisplays](self, "nextEstablishModePerDisplays"));
        id v37 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager currentDisplayIdentifier](self, "currentDisplayIdentifier"));
        [v36 setObject:v14 forKey:v37];

        ((void (*)(void *, void))v63[2])(v63, 0LL);
      }

      else
      {
        v67[0] = _NSConcreteStackBlock;
        v67[1] = 3221225472LL;
        v67[2] = sub_1001FADB4;
        v67[3] = &unk_1003DCAF8;
        v71 = v63;
        id v68 = v7;
        v69 = self;
        id v45 = v14;
        id v70 = v45;
        id v46 = objc_retainBlock(v67);
        v64[0] = _NSConcreteStackBlock;
        v64[1] = 3221225472LL;
        v64[2] = sub_1001FAF0C;
        v64[3] = &unk_1003DCB20;
        v64[4] = self;
        id v47 = (id)objc_claimAutoreleasedReturnValue(-[PBDisplayManager currentDisplayIdentifier](self, "currentDisplayIdentifier"));
        id v65 = v47;
        id v48 = v46;
        id v66 = v48;
        -[PBDisplayManager updateCurrentCADisplayFromDisplayMode:completion:]( self,  "updateCurrentCADisplayFromDisplayMode:completion:",  v45,  v64);
      }

      goto LABEL_41;
    }

    id v42 = (void *)objc_claimAutoreleasedReturnValue( -[NSError objectForKeyedSubscript:]( v28,  "objectForKeyedSubscript:",  PBSDisplayManagerUpdateRegionChangeKey));
    unsigned int v43 = [v42 BOOLValue];

    if (-[PBDisplayManager canHandleHighBandwidthModes](self, "canHandleHighBandwidthModes")) {
      unsigned int v44 = 0;
    }
    else {
      unsigned int v44 = [v14 isAboveBandwidthThreshold];
    }
    int v49 = PBSNeedsHDRBuddyForDisplayMode(v14, self);
    *(void *)buf = 0LL;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000LL;
    uint64_t v85 = 3LL;
    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472LL;
    v76[2] = sub_1001FAB9C;
    v76[3] = &unk_1003DCAA8;
    v78 = v63;
    v76[4] = self;
    id v50 = v14;
    id v77 = v50;
    v79 = buf;
    v51 = objc_retainBlock(v76);
    if (v43)
    {
      uint64_t v52 = *(void *)&buf[8];
      uint64_t v53 = 5LL;
    }

    else if (v49)
    {
      uint64_t v52 = *(void *)&buf[8];
      uint64_t v53 = 1LL;
    }

    else if (v44)
    {
      uint64_t v52 = *(void *)&buf[8];
      uint64_t v53 = 2LL;
    }

    else
    {
      unsigned int v54 = [v50 isVirtual];
      uint64_t v52 = *(void *)&buf[8];
      if (!v54)
      {
        *(void *)(*(void *)&buf[8] + 24LL) = 4LL;
        v72[0] = _NSConcreteStackBlock;
        v72[1] = 3221225472LL;
        v72[2] = sub_1001FAC9C;
        v72[3] = &unk_1003DCAD0;
        v72[4] = self;
        id v55 = (id)objc_claimAutoreleasedReturnValue(-[PBDisplayManager currentDisplayIdentifier](self, "currentDisplayIdentifier"));
        id v73 = v55;
        v74 = v51;
        v75 = v63;
        -[PBDisplayManager updateCurrentCADisplayFromDisplayMode:completion:]( self,  "updateCurrentCADisplayFromDisplayMode:completion:",  v50,  v72);

        goto LABEL_40;
      }

      uint64_t v53 = 3LL;
    }

    *(void *)(v52 + 24) = v53;
    ((void (*)(void *, void))v51[2])(v51, 0LL);
LABEL_40:

    _Block_object_dispose(buf, 8);
    goto LABEL_41;
  }

  id v15 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Failed to decode the requestedMode from %s",  "-[PBDisplayManager updateDisplayManagerWithRequest:reply:]");
  id v38 = objc_alloc(&OBJC_CLASS___NSError);
  NSErrorUserInfoKey v90 = NSLocalizedFailureReasonErrorKey;
  v91 = v15;
  id v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v91,  &v90,  1LL));
  double v28 = -[NSError initWithDomain:code:userInfo:]( v38,  "initWithDomain:code:userInfo:",  PBSDisplayManagerErrorDomain,  832001LL,  v39);

  id v40 = sub_100082A9C();
  v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
    sub_100292120();
  }

  ((void (*)(void *, NSError *))v63[2])(v63, v28);
LABEL_41:

  objc_destroyWeak(v82);
  objc_destroyWeak(&location);
}

- (void)reloadState
{
  id v3 = sub_100082A9C();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Waiting for latches to close...", buf, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager wakeProgressLatch](self, "wakeProgressLatch"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  unsigned int v7 = [v5 waitForAllLatchesUntilDate:v6];

  id v8 = sub_100082A9C();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    BOOL v10 = "timed out";
    if (v7) {
      BOOL v10 = "latches closed";
    }
    *(_DWORD *)buf = 136446210;
    v89 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "...wait complete, %{public}s", buf, 0xCu);
  }

  if ((v7 & 1) != 0)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[PBDisplayIdentifier mainDisplayIdentifier]( &OBJC_CLASS___PBDisplayIdentifier,  "mainDisplayIdentifier"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 identifierString]);
    -[PBDisplayManager setCurrentDisplayIdentifier:](self, "setCurrentDisplayIdentifier:", v12);

    -[PBDisplayManager willChangeValueForKey:](self, "willChangeValueForKey:", @"shouldModeSwitchForFrameRate");
    -[PBDisplayManager willChangeValueForKey:](self, "willChangeValueForKey:", @"shouldModeSwitchForDynamicRange");
    -[PBDisplayManager willChangeValueForKey:]( self,  "willChangeValueForKey:",  @"shouldUseQMSForFrameRateSwitching");
    -[PBDisplayManager willChangeValueForKey:](self, "willChangeValueForKey:", @"hdr10PlusMetadataEnabled");
    -[PBDisplayManager willChangeValueForKey:](self, "willChangeValueForKey:", @"canHandleHighBandwidthModes");
    -[PBDisplayManager willChangeValueForKey:](self, "willChangeValueForKey:", @"encodedPromotedDisplayModes");
    -[PBDisplayManager willChangeValueForKey:](self, "willChangeValueForKey:", @"sortedDisplayModes");
    -[PBDisplayManager willChangeValueForKey:](self, "willChangeValueForKey:", @"currentDisplayMode");
    -[PBDisplayManager willChangeValueForKey:](self, "willChangeValueForKey:", @"currentDisplayID");
    -[PBDisplayManager willChangeValueForKey:](self, "willChangeValueForKey:", @"seenDisplayIDs");
    -[PBDisplayManager willChangeValueForKey:](self, "willChangeValueForKey:", @"fallbackDisplayMode");
    -[PBDisplayManager willChangeValueForKey:](self, "willChangeValueForKey:", @"userSelectedDisplayMode");
    -[PBDisplayManager willChangeValueForKey:](self, "willChangeValueForKey:", @"blackScreenRecoveryDisplayModes");
    -[PBDisplayManager willChangeValueForKey:](self, "willChangeValueForKey:", @"displayConnection");
    -[PBDisplayManager willChangeValueForKey:](self, "willChangeValueForKey:", @"userPreferredRefreshRate");
    -[PBDisplayManager willChangeValueForKey:](self, "willChangeValueForKey:", @"deemed4KCapable");
    -[PBDisplayManager willChangeValueForKey:](self, "willChangeValueForKey:", @"audioLatencies");
    -[PBDisplayManager willChangeValueForKey:](self, "willChangeValueForKey:", @"atmosEnabled");
    -[PBDisplayManager willChangeValueForKey:](self, "willChangeValueForKey:", @"colorCalibrations");
    -[PBDisplayManager readUserPreferredRefreshRate](self, "readUserPreferredRefreshRate");
    self->_userPreferredRefreshRate = v13;
    self->_canHandleHighBandwidthModes = -[PBDisplayManager readCanDoHighBandwidth](self, "readCanDoHighBandwidth");
    self->_shouldModeSwitchForDynamicRange = -[PBDisplayManager readShouldModeSwitchForDynamicRange]( self,  "readShouldModeSwitchForDynamicRange");
    self->_shouldModeSwitchForFrameRate = -[PBDisplayManager readShouldModeSwitchForFrameRate]( self,  "readShouldModeSwitchForFrameRate");
    self->_shouldUseQMSForFrameRateSwitching = -[PBDisplayManager readShouldUseQMSForFrameRateSwitching]( self,  "readShouldUseQMSForFrameRateSwitching");
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v11 capabilities]);
    unsigned int v15 = [v14 supportsVRR];

    if (v15)
    {
      unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](&OBJC_CLASS___CADisplay, "mainDisplay"));
      unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v16 externalDisplayAttributes]);
      id v18 = [v17 discreteMediaRefreshRate];

      if (v18 == (id)2)
      {
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](&OBJC_CLASS___CADisplay, "mainDisplay"));
        [v19 setDmrrEnabled:self->_shouldUseQMSForFrameRateSwitching];
      }
    }

    self->_hdr10PlusMetadataEnabled = -[PBDisplayManager readHDR10PlusMetadataEnabled]( self,  "readHDR10PlusMetadataEnabled");
    double v20 = (void *)objc_claimAutoreleasedReturnValue([v11 capabilities]);
    unsigned int v21 = [v20 supportsHDR10Plus];

    if (v21)
    {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](&OBJC_CLASS___CADisplay, "mainDisplay"));
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 externalDisplayAttributes]);
      id v24 = [v23 hdr10PlusMetadata];

      if (v24 == (id)2)
      {
        unsigned __int8 v25 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](&OBJC_CLASS___CADisplay, "mainDisplay"));
        [v25 setHdr10PlusMetadataEnabled:self->_hdr10PlusMetadataEnabled];
      }
    }

    if (sub_1001C9E00())
    {
      -[PBDisplayManager readSoftwareDisplaySize](self, "readSoftwareDisplaySize");
      self->_softwareDisplaySize.double width = v26;
      self->_softwareDisplaySize.double height = v27;
    }

    self->_atmosEnabled = -[PBDisplayManager readAtmosEnabled](self, "readAtmosEnabled");
    double v28 = (NSSet *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager readEncodedPromotedDisplayModes](self, "readEncodedPromotedDisplayModes"));
    encodedPromotedDisplayModes = self->_encodedPromotedDisplayModes;
    self->_encodedPromotedDisplayModes = v28;

    self->_detectedPoorCableConnection = -[PBDisplayManager readDetectedPoorCableConnection]( self,  "readDetectedPoorCableConnection");
    id v30 = (NSDictionary *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager readAudioLatencies](self, "readAudioLatencies"));
    audioLatencies = self->_audioLatencies;
    self->_audioLatencies = v30;

    BOOL v32 = (NSDictionary *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager readColorCalibrations](self, "readColorCalibrations"));
    colorCalibrations = self->_colorCalibrations;
    self->_colorCalibrations = v32;

    id v34 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](&OBJC_CLASS___CADisplay, "mainDisplay"));
    double v35 = (void *)objc_claimAutoreleasedReturnValue([v34 availableModes]);

    double v36 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager sortedDisplayModes](self, "sortedDisplayModes"));
    id v37 = [v36 copy];

    id v38 = (void *)objc_claimAutoreleasedReturnValue( -[PBDisplayManager _recalculatedDisplayModesFromCoreAnimationModes:]( self,  "_recalculatedDisplayModesFromCoreAnimationModes:",  v35));
    id v39 = [v38 mutableCopy];

    [v39 sortUsingComparator:&stru_1003DCB60];
    objc_storeStrong((id *)&self->_sortedDisplayModes, v39);
    if ([v35 count] || !objc_msgSend(v37, "count"))
    {
      if ([v35 count] && !objc_msgSend(v37, "count"))
      {
        id v48 = sub_100082A9C();
        int v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "*** DISPLAY CONNECTION DETECTED ***",  buf,  2u);
        }

        self->_displayConnection = 2LL;
        id v50 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 2LL));
        displayConnectionToNotify = self->_displayConnectionToNotify;
        self->_displayConnectionToNotify = v50;

        uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager currentDisplayIdentifier](self, "currentDisplayIdentifier"));
        if ([v52 isEqualToString:@"_unknown_"])
        {
          currentDisplayID = self->_currentDisplayID;
          self->_currentDisplayID = 0LL;
        }

        else
        {
          unsigned int v54 = (NSString *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager currentDisplayIdentifier](self, "currentDisplayIdentifier"));
          currentDisplayID = self->_currentDisplayID;
          self->_currentDisplayID = v54;
        }
      }

      else
      {
        self->_displayConnection = PBSDisplayConnectionForDisplayState(self);
      }
    }

    else
    {
      id v43 = sub_100082A9C();
      unsigned int v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "*** DISPLAY CONNECTION LOST ***", buf, 2u);
      }

      self->_displayConnection = 3LL;
      id v45 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 3LL));
      id v46 = self->_displayConnectionToNotify;
      self->_displayConnectionToNotify = v45;

      id v47 = self->_currentDisplayID;
      self->_currentDisplayID = 0LL;

      -[PBDisplayManager stopMonitoringCable](self, "stopMonitoringCable");
    }

    v79 = v39;
    if ([v39 count])
    {
      id v76 = v37;
      id v77 = v35;
      v78 = v11;
      __int128 v83 = 0u;
      __int128 v84 = 0u;
      __int128 v81 = 0u;
      __int128 v82 = 0u;
      id v55 = v39;
      id v56 = [v55 countByEnumeratingWithState:&v81 objects:v87 count:16];
      if (v56)
      {
        id v57 = v56;
        char v58 = 0;
        uint64_t v59 = *(void *)v82;
        do
        {
          for (i = 0LL; i != v57; i = (char *)i + 1)
          {
            if (*(void *)v82 != v59) {
              objc_enumerationMutation(v55);
            }
            id v61 = *(char **)(*((void *)&v81 + 1) + 8LL * (void)i);
            if (self->_displayConnection == 2)
            {
              id v62 = sub_100082A9C();
              v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
              if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v89 = v61;
                _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "\t%{public}@", buf, 0xCu);
              }
            }

            if ((v58 & 1) == 0
              && PBSDisplayResolutionIs4K([v61 resolution])
              && ![v61 isVirtual])
            {
              char v58 = 1;
            }
          }

          id v57 = [v55 countByEnumeratingWithState:&v81 objects:v87 count:16];
        }

        while (v57);
      }

      else
      {
        char v58 = 0;
      }

      BOOL v64 = v58 & 1;
      double v35 = v77;
      id v11 = v78;
      id v37 = v76;
    }

    else
    {
      BOOL v64 = 0;
    }

    self->_deemed4KCapable = v64;
    if ((sub_1001C9BFC() & 1) == 0 && self->_displayConnection == 2) {
      -[PBDisplayManager startMonitoringCable](self, "startMonitoringCable");
    }
    -[PBDisplayManager saveCurrentDisplayID:](self, "saveCurrentDisplayID:", self->_currentDisplayID, v76, v77, v78);
    id v65 = (NSSet *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager readSeenDisplayIDs](self, "readSeenDisplayIDs"));
    seenDisplayIDs = self->_seenDisplayIDs;
    self->_seenDisplayIDs = v65;

    v67 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager findFirstMode:](self, "findFirstMode:", &stru_1003DCBA0));
    uint64_t v68 = objc_claimAutoreleasedReturnValue( -[PBDisplayManager findMatchingLocaleMode:enforceVirtualCheck:]( self,  "findMatchingLocaleMode:enforceVirtualCheck:",  v67,  1LL));
    v69 = (void *)v68;
    if (v68) {
      id v70 = (void *)v68;
    }
    else {
      id v70 = v67;
    }
    id v71 = v70;

    objc_storeStrong((id *)&self->_fallbackDisplayMode, v70);
    if (self->_displayConnection == 2)
    {
      v72 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](&OBJC_CLASS___CADisplay, "mainDisplay"));
      id v73 = (void *)objc_claimAutoreleasedReturnValue([v72 externalDisplayAttributes]);
      id v74 = [v73 discreteMediaRefreshRate];

      if (v74 == (id)2)
      {
        v75 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](&OBJC_CLASS___CADisplay, "mainDisplay"));
        [v75 setDmrrEnabled:self->_shouldUseQMSForFrameRateSwitching];
      }

      v80[0] = _NSConcreteStackBlock;
      v80[1] = 3221225472LL;
      v80[2] = sub_1001FBA6C;
      v80[3] = &unk_1003D28B0;
      void v80[4] = self;
      -[PBDisplayManager _recalculateDefaultDisplayMode:](self, "_recalculateDefaultDisplayMode:", v80);
    }

    else
    {
      -[PBDisplayManager _completeReloadingState](self, "_completeReloadingState");
    }
  }

  else
  {
    objc_initWeak((id *)buf, self);
    dispatch_time_t v40 = dispatch_time(0LL, 100000000LL);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v42 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001FB9D0;
    block[3] = &unk_1003D0890;
    objc_copyWeak(&v86, (id *)buf);
    dispatch_after(v40, v42, block);

    objc_destroyWeak(&v86);
    objc_destroyWeak((id *)buf);
  }

- (void)_completeReloadingState
{
  id v3 = objc_alloc(&OBJC_CLASS___PBSDisplayMode);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](&OBJC_CLASS___CADisplay, "mainDisplay"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currentMode]);
  BOOL v6 = -[PBDisplayManager filteredUsingdPineBoardPolicy](self, "filteredUsingdPineBoardPolicy");
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager encodedPromotedDisplayModes](self, "encodedPromotedDisplayModes"));
  id v8 = -[PBSDisplayMode initWithCADisplayMode:usePineBoardPolicy:encodedPromotedModes:]( v3,  "initWithCADisplayMode:usePineBoardPolicy:encodedPromotedModes:",  v5,  v6,  v7);

  if (v8)
  {
    id v9 = sub_100082A9C();
    BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager currentDisplayIdentifier](self, "currentDisplayIdentifier"));
      int v17 = 138543618;
      id v18 = v8;
      __int16 v19 = 2114;
      double v20 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Current mode is now: %{public}@ for display ID: %{public}@",  (uint8_t *)&v17,  0x16u);
    }
  }

  objc_storeStrong((id *)&self->_currentDisplayMode, v8);
  id v12 = (NSArray *)objc_claimAutoreleasedReturnValue( -[PBDisplayManager _recalculatedBlackScreenRecoveryDisplayModes]( self,  "_recalculatedBlackScreenRecoveryDisplayModes"));
  blackScreenRecoveryDisplayModes = self->_blackScreenRecoveryDisplayModes;
  self->_blackScreenRecoveryDisplayModes = v12;

  -[PBDisplayManager didChangeValueForKey:](self, "didChangeValueForKey:", @"audioLatencies");
  -[PBDisplayManager didChangeValueForKey:](self, "didChangeValueForKey:", @"colorCalibrations");
  -[PBDisplayManager didChangeValueForKey:](self, "didChangeValueForKey:", @"deemed4KCapable");
  -[PBDisplayManager didChangeValueForKey:](self, "didChangeValueForKey:", @"userPreferredRefreshRate");
  -[PBDisplayManager didChangeValueForKey:](self, "didChangeValueForKey:", @"displayConnection");
  -[PBDisplayManager didChangeValueForKey:](self, "didChangeValueForKey:", @"blackScreenRecoveryDisplayModes");
  -[PBDisplayManager didChangeValueForKey:](self, "didChangeValueForKey:", @"userSelectedDisplayMode");
  -[PBDisplayManager didChangeValueForKey:](self, "didChangeValueForKey:", @"fallbackDisplayMode");
  -[PBDisplayManager didChangeValueForKey:](self, "didChangeValueForKey:", @"seenDisplayIDs");
  -[PBDisplayManager didChangeValueForKey:](self, "didChangeValueForKey:", @"currentDisplayID");
  -[PBDisplayManager didChangeValueForKey:](self, "didChangeValueForKey:", @"currentDisplayMode");
  -[PBDisplayManager didChangeValueForKey:](self, "didChangeValueForKey:", @"sortedDisplayModes");
  -[PBDisplayManager didChangeValueForKey:](self, "didChangeValueForKey:", @"encodedPromotedDisplayModes");
  -[PBDisplayManager didChangeValueForKey:](self, "didChangeValueForKey:", @"canHandleHighBandwidthModes");
  -[PBDisplayManager didChangeValueForKey:](self, "didChangeValueForKey:", @"shouldModeSwitchForDynamicRange");
  -[PBDisplayManager didChangeValueForKey:](self, "didChangeValueForKey:", @"shouldModeSwitchForFrameRate");
  -[PBDisplayManager didChangeValueForKey:](self, "didChangeValueForKey:", @"shouldUseQMSForFrameRateSwitching");
  -[PBDisplayManager didChangeValueForKey:](self, "didChangeValueForKey:", @"hdr10PlusMetadataEnabled");
  -[PBDisplayManager didChangeValueForKey:](self, "didChangeValueForKey:", @"atmosEnabled");
  BOOL v14 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager notifyClientsSource](self, "notifyClientsSource"));
  dispatch_source_merge_data(v14, 1uLL);

  -[PBDisplayManager adjustAtmos:](self, "adjustAtmos:", self->_currentDisplayMode);
  if (self->_currentDisplayMode)
  {
    -[PBDisplayManager _applyAudioLatencyIfNeeded](self, "_applyAudioLatencyIfNeeded");
  }

  else
  {
    id v15 = sub_100082A9C();
    unsigned int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LOWORD(v17) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "Display disconnected. Keep audio latency unchanged.",  (uint8_t *)&v17,  2u);
    }
  }

  -[PBDisplayManager _applyColorCalibrationIfNeeded](self, "_applyColorCalibrationIfNeeded");
}

- (void)_applyColorCalibrationIfNeeded
{
  currentDisplayMode = self->_currentDisplayMode;
  if (currentDisplayMode)
  {
    uint64_t v4 = PBSColorCalibrationKeyForDisplayMode(currentDisplayMode, a2);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager readColorCalibrations](self, "readColorCalibrations"));
    unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v5]);

    id v8 = sub_100082A9C();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      BOOL v10 = self->_currentDisplayMode;
      int v20 = 138543874;
      unsigned int v21 = v7;
      __int16 v22 = 2114;
      uint64_t v23 = v10;
      __int16 v24 = 2114;
      unsigned __int8 v25 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Retrieved Color Calibration %{public}@ for display mode %{public}@ with key %{public}@",  (uint8_t *)&v20,  0x20u);
    }

    if (PBSDisplayFiltersEnabled())
    {
      id v11 = sub_100082A9C();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(v20) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "AX display filters enabled. Skip applying color calibration gains.",  (uint8_t *)&v20,  2u);
      }

      goto LABEL_20;
    }

    if (PBSDisplayColorCalibrationStatusForDisplayMode(self, self->_currentDisplayMode) == 2)
    {
      id v14 = sub_100082A9C();
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        unsigned int v16 = self->_currentDisplayMode;
        int v20 = 138543362;
        unsigned int v21 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "Display mode %{public}@ is CONFIRMED. Using identity matrix.",  (uint8_t *)&v20,  0xCu);
      }
    }

    else
    {
      if (!v7)
      {
        id v18 = sub_100082A9C();
        unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          __int16 v19 = self->_currentDisplayMode;
          int v20 = 138543362;
          unsigned int v21 = v19;
          _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "No Color Calibration for display mode %{public}@. Using identity matrix.",  (uint8_t *)&v20,  0xCu);
        }

        goto LABEL_18;
      }

      if (-[os_log_s count](v7, "count") == (id)4)
      {
LABEL_19:
        -[PBDisplayManager setColorGains:](self, "setColorGains:", v7);
LABEL_20:

        goto LABEL_21;
      }

      id v17 = sub_100082A9C();
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100292258();
      }
    }

LABEL_18:
    unsigned int v7 = 0LL;
    goto LABEL_19;
  }

  id v13 = sub_100082A9C();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(v20) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Display disconnected. Not applying color calibration.",  (uint8_t *)&v20,  2u);
  }

- (void)_applyAudioLatencyIfNeeded
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager readAudioLatencies](self, "readAudioLatencies"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBSDisplayMode encodedString](self->_currentDisplayMode, "encodedString"));
  id v5 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v3 objectForKey:v4]);

  [v5 doubleValue];
  if (v6 <= 0.0)
  {

    id v12 = sub_100082A9C();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    id v5 = &off_1003FECA0;
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    [&off_1003FECA0 doubleValue];
    currentDisplayMode = self->_currentDisplayMode;
    *(_DWORD *)buf = 134218242;
    uint64_t v24 = v14;
    __int16 v25 = 2114;
    CGFloat v26 = currentDisplayMode;
    id v11 = "Apply default audio latency %f for display mode %{public}@";
  }

  else
  {
    id v7 = sub_100082A9C();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    [v5 doubleValue];
    id v9 = self->_currentDisplayMode;
    *(_DWORD *)buf = 134218242;
    uint64_t v24 = v10;
    __int16 v25 = 2114;
    CGFloat v26 = v9;
    id v11 = "Apply measured audio latency %f for display mode %{public}@";
  }

  _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v11, buf, 0x16u);
LABEL_7:

  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[AVSystemController sharedAVSystemController]( &OBJC_CLASS___AVSystemController,  "sharedAVSystemController"));
  v21[0] = AVSystemController_MeasuredHDMILatency_MeasuredAudioHDMILatency24Hz;
  v21[1] = AVSystemController_MeasuredHDMILatency_MeasuredAudioHDMILatency60Hz;
  v22[0] = v5;
  v22[1] = v5;
  v21[2] = AVSystemController_MeasuredHDMILatency_MeasuredVideoHDMILatency24Hz;
  v21[3] = AVSystemController_MeasuredHDMILatency_MeasuredVideoHDMILatency60Hz;
  v22[2] = v5;
  v22[3] = v5;
  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  4LL));
  id v20 = 0LL;
  [v15 setAttribute:v16 forKey:AVSystemController_MeasuredHDMILatencyAttribute error:&v20];
  id v17 = v20;

  if (v17)
  {
    id v18 = sub_100082A9C();
    __int16 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1002922B8();
    }
  }
}

- (id)_recalculatedDisplayModesFromCoreAnimationModes:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472LL;
    id v17 = sub_1001FC690;
    id v18 = &unk_1003DCBC8;
    id v5 = v4;
    id v19 = v5;
    id v20 = self;
    double v6 = objc_retainBlock(&v15);
    uint64_t v7 = ((uint64_t (*)(void ***, uint64_t))v6[2])(v6, 1LL);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    id v9 = objc_msgSend(v8, "count", v15, v16, v17, v18);
    if (v5 && !v9)
    {
      id v10 = sub_100082A9C();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100292318();
      }

      uint64_t v12 = ((uint64_t (*)(void ***, void))v6[2])(v6, 0LL);
      uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);

      id v8 = (void *)v13;
    }
  }

  else
  {
    id v8 = &__NSArray0__struct;
  }

  return v8;
}

- (id)_recalculatedBlackScreenRecoveryDisplayModes
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v24 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v23 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager sortedDisplayModes](self, "sortedDisplayModes"));
  id v5 = [v4 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v26;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
        if ([v9 isValidBlackScreenRecoveryMode])
        {
          id v10 = objc_alloc(&OBJC_CLASS___NSString);
          [v9 resolution];
          unint64_t v12 = llround(v11);
          [v9 resolution];
          unint64_t v14 = llround(v13);
          [v9 refreshRate];
          uint64_t v16 = -[NSString initWithFormat:](v10, "initWithFormat:", @"%ldx%ld(%.02g)", v12, v14, v15);
          id v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", v16));

          if (!v17)
          {
            -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v9, v16);
            int IsTV = PBSDisplayRefreshRateIsTV([v9 refreshRate]);
            if (PBSDisplayResolutionIs720p([v9 resolution]))
            {
              id v19 = v24;
              if ((IsTV & 1) != 0)
              {
LABEL_13:
                -[NSMutableArray addObject:](v19, "addObject:", v9);
                goto LABEL_14;
              }
            }

            else
            {
              int v20 = PBSDisplayResolutionIs1080p([v9 resolution]) & IsTV;
              id v19 = v24;
              if ((v20 & 1) != 0) {
                goto LABEL_13;
              }
            }

            id v19 = v23;
            goto LABEL_13;
          }

- (void)_recalculateDefaultDisplayMode:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager sortedDisplayModes](self, "sortedDisplayModes"));
  BOOL v6 = [v5 count] == 0;

  if (!v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[PBDisplayIdentifier mainDisplayIdentifier]( &OBJC_CLASS___PBDisplayIdentifier,  "mainDisplayIdentifier"));
    +[PBDisplayManager migratePreferenceKeyToDisplayIdentifier:]( &OBJC_CLASS___PBDisplayManager,  "migratePreferenceKeyToDisplayIdentifier:",  v7);

    v45[0] = 0LL;
    v45[1] = v45;
    v45[2] = 0x2020000000LL;
    char v46 = 1;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager currentDisplayIdentifier](self, "currentDisplayIdentifier"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[PBSceneLayoutViewController sceneLayoutViewControllerForMainDisplay]( &OBJC_CLASS___PBSceneLayoutViewController,  "sceneLayoutViewControllerForMainDisplay"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 focusedSceneHandle]);
    double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 clientProcessBundleIdentifier]);

    if (v11
      && (unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[PBDisplayManager preferredDisplayModeForBundleIdentifier:]( self,  "preferredDisplayModeForBundleIdentifier:",  v11))) != 0LL)
    {
      id v13 = v12;
      int v31 = v13;
    }

    else
    {
      id v13 = (id)objc_claimAutoreleasedReturnValue(-[PBDisplayManager readUserSelectedDisplayMode](self, "readUserSelectedDisplayMode"));
      int v31 = 0LL;
    }

    unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager nextEstablishModePerDisplays](self, "nextEstablishModePerDisplays"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v8]);

    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    v42[2] = sub_1001FD1B8;
    v42[3] = &unk_1003DCC10;
    unsigned int v44 = v45;
    void v42[4] = self;
    id v43 = v4;
    uint64_t v16 = objc_retainBlock(v42);
    if ([v15 canBeUsedToEstablishDisplayOnNextWake])
    {
      if (!-[PBDisplayManager isPresentingDisplayAssistant](self, "isPresentingDisplayAssistant"))
      {
        id v17 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager nextEstablishModePerDisplays](self, "nextEstablishModePerDisplays"));
        [v17 removeObjectForKey:v8];
      }

      id v18 = sub_100082A9C();
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v48 = v15;
        __int16 v49 = 2114;
        id v50 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Establishing display mode from one-off memory cache: %{public}@ for display: %{public}@",  buf,  0x16u);
      }

      -[PBDisplayManager updateCurrentCADisplayFromDisplayMode:completion:]( self,  "updateCurrentCADisplayFromDisplayMode:completion:",  v15,  v16);
      goto LABEL_23;
    }

    if (v13)
    {
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472LL;
      v37[2] = sub_1001FD28C;
      v37[3] = &unk_1003DCC38;
      id v38 = v13;
      v41 = v45;
      id v39 = v8;
      dispatch_time_t v40 = v16;
      -[PBDisplayManager updateCurrentCADisplayFromDisplayMode:completion:]( self,  "updateCurrentCADisplayFromDisplayMode:completion:",  v38,  v37);

      id v20 = v38;
LABEL_22:

LABEL_23:
      _Block_object_dispose(v45, 8);
      goto LABEL_24;
    }

    unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager fallbackDisplayMode](self, "fallbackDisplayMode"));
    id v22 = [v21 copy];
    -[PBDisplayManager userPreferredRefreshRate](self, "userPreferredRefreshRate");
    objc_msgSend(v22, "setRefreshRate:");
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_1001FD3C8;
    v35[3] = &unk_1003DCC60;
    id v29 = v22;
    id v36 = v29;
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager findFirstMode:](self, "findFirstMode:", v35));
    id v30 = v23;
    if (v23)
    {
      id v24 = v23;

      unsigned int v21 = v24;
      id v25 = sub_100082A9C();
      __int128 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v48 = v21;
        __int16 v49 = 2114;
        id v50 = v8;
        __int128 v27 = "Establishing display mode from policy (respecting preferred refresh rate): %{public}@ for display: %{public}@";
LABEL_20:
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v27, buf, 0x16u);
      }
    }

    else
    {
      id v28 = sub_100082A9C();
      __int128 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v48 = v21;
        __int16 v49 = 2114;
        id v50 = v8;
        __int128 v27 = "Establishing display mode from policy: %{public}@ for display: %{public}@";
        goto LABEL_20;
      }
    }

    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_1001FD3E4;
    v32[3] = &unk_1003DCB20;
    v32[4] = self;
    id v20 = v21;
    id v33 = v20;
    id v34 = v16;
    -[PBDisplayManager updateCurrentCADisplayFromDisplayMode:completion:]( self,  "updateCurrentCADisplayFromDisplayMode:completion:",  v20,  v32);

    goto LABEL_22;
  }

  (*((void (**)(id, void, void))v4 + 2))(v4, 0LL, 0LL);
LABEL_24:
}

- (void)_resetSettingsForCurrentDisplay
{
  id v3 = sub_100082A9C();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Reset video settings update request", buf, 2u);
  }

  -[PBDisplayManager setCanHandleHighBandwidthModes:](self, "setCanHandleHighBandwidthModes:", 0LL);
  -[PBDisplayManager removePromotedDisplayModes](self, "removePromotedDisplayModes");
  -[PBDisplayManager setLastCablePollStatus:](self, "setLastCablePollStatus:", 0LL);
  -[PBDisplayManager removeAudioLatencies](self, "removeAudioLatencies");
  -[PBDisplayManager removeColorCalibrations](self, "removeColorCalibrations");
  if (sub_1001C9E00()) {
    -[PBDisplayManager setSoftwareDisplaySize:]( self,  "setSoftwareDisplaySize:",  PBSDisplaySize16x9[0],  PBSDisplaySize16x9[1]);
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[AVSystemController sharedAVSystemController]( &OBJC_CLASS___AVSystemController,  "sharedAVSystemController"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( +[AVSystemController pb_measuredHDMILatencyDefaultValueDictionary]( &OBJC_CLASS___AVSystemController,  "pb_measuredHDMILatencyDefaultValueDictionary"));
  id v10 = 0LL;
  [v5 setAttribute:v6 forKey:AVSystemController_MeasuredHDMILatencyAttribute error:&v10];
  id v7 = v10;

  if (v7)
  {
    id v8 = sub_100082A9C();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Removing applied audio latency err=%{public}@",  buf,  0xCu);
    }
  }

  -[PBDisplayManager resetCableInfoHistory](self, "resetCableInfoHistory");
}

- (void)completeDisplayTransition:(int64_t)a3 error:(id)a4 withReply:(id)a5
{
  id v8 = (NSError *)a4;
  id v9 = (void (**)(id, void *, id))a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager sortedDisplayModes](self, "sortedDisplayModes"));
  id v11 = [v10 count];

  BOOL v12 = v11 == 0LL;
  if (a3 != 1) {
    BOOL v12 = v11 != 0LL;
  }
  if (v12 || qword_1004714B8 >= 3)
  {
    if (qword_1004714B8 >= 3)
    {
      unint64_t v14 = objc_alloc(&OBJC_CLASS___NSString);
      uint64_t v15 = @"woke up";
      if (a3 == 1) {
        uint64_t v15 = @"went to sleep";
      }
      uint64_t v16 = -[NSString initWithFormat:]( v14,  "initWithFormat:",  @"The display %@ without setting up the sorted list",  v15);
      id v17 = objc_alloc(&OBJC_CLASS___NSError);
      uint64_t v18 = PBSDisplayManagerErrorDomain;
      NSErrorUserInfoKey v29 = NSLocalizedFailureReasonErrorKey;
      id v30 = v16;
      id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v30,  &v29,  1LL));
      id v20 = -[NSError initWithDomain:code:userInfo:](v17, "initWithDomain:code:userInfo:", v18, 832003LL, v19);

      id v21 = sub_100082A9C();
      id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_100292120();
      }

      id v8 = v20;
    }

    qword_1004714B8 = 0LL;
    if (v9)
    {
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager serialisedState](self, "serialisedState"));
      v9[2](v9, v23, v8);
    }
  }

  else
  {
    objc_initWeak(&location, self);
    dispatch_time_t v13 = dispatch_time(0LL, 1000000000LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001FD868;
    block[3] = &unk_1003D84A8;
    objc_copyWeak(v27, &location);
    v27[1] = (id)a3;
    id v8 = v8;
    id v25 = v8;
    __int128 v26 = v9;
    dispatch_after(v13, &_dispatch_main_q, block);
    ++qword_1004714B8;

    objc_destroyWeak(v27);
    objc_destroyWeak(&location);
  }
}

- (void)sleepDisplayWithReply:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager currentDisplayIdentifier](self, "currentDisplayIdentifier"));
  id v6 = [v5 copy];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager nextEstablishModePerDisplays](self, "nextEstablishModePerDisplays"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v6]);

  if (v8) {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager findMatchingCAMode:](self, "findMatchingCAMode:", v8));
  }
  else {
    id v9 = 0LL;
  }
  id v10 = sub_100082A9C();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager currentDisplayID](self, "currentDisplayID"));
    *(_DWORD *)buf = 138543362;
    uint64_t v23 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Attempting to sleep the display for %{public}@",  buf,  0xCu);
  }

  objc_initWeak((id *)buf, self);
  systemState = self->_systemState;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  void v17[2] = sub_1001FDAB4;
  v17[3] = &unk_1003DCCB0;
  objc_copyWeak(&v21, (id *)buf);
  id v14 = v6;
  id v18 = v14;
  id v15 = v9;
  id v19 = v15;
  id v16 = v4;
  id v20 = v16;
  -[SSDisplay setState:completion:](systemState, "setState:completion:", 1LL, v17);

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);
}

- (void)wakeDisplayWithReply:(id)a3
{
  id v4 = a3;
  id v5 = sub_100082A9C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Attempting to wake the display",  (uint8_t *)buf,  2u);
  }

  id v7 = sub_100082A9C();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Opening wake-complete latch",  (uint8_t *)buf,  2u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager wakeProgressLatch](self, "wakeProgressLatch"));
  [v9 openLatchNamed:@"WakeComplete"];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager wakeProgressLatch](self, "wakeProgressLatch"));
  [v10 openLatchNamed:@"DisplayIDStable"];

  -[PBDisplayManager setDisplayStabilizationTimer:](self, "setDisplayStabilizationTimer:", 1.0);
  objc_initWeak(buf, self);
  systemState = self->_systemState;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1001FDEF0;
  v13[3] = &unk_1003D8410;
  objc_copyWeak(&v15, buf);
  id v12 = v4;
  id v14 = v12;
  -[SSDisplay setState:completion:](systemState, "setState:completion:", 2LL, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(buf);
}

- (void)handleRegionChangeWithNewCountryCode:(id)a3 reply:(id)a4
{
}

- (void)presentDisplayAssistantWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBDisplayAssistantService sharedInstance](&OBJC_CLASS___PBDisplayAssistantService, "sharedInstance"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1001FE274;
  v10[3] = &unk_1003DCD00;
  objc_copyWeak(&v12, &location);
  id v9 = v7;
  id v11 = v9;
  [v8 presentDisplayAssistantWithRequest:v6 dismissCompletionHandler:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)displayAssistantDidStartForKind:(id)a3
{
}

- (void)displayAssistantDidCompleteForKind:(id)a3
{
}

- (void)forgetDisplaysForDisplayAssistant
{
}

- (void)removeCableCheckHistory
{
}

- (void)displayAssistantDidCompleteForKind:(id)a3 fromUserInteraction:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager currentDisplayIdentifier](self, "currentDisplayIdentifier"));
  if (v7)
  {
    if (v4)
    {
      id v8 = (char *)[v6 integerValue];
      if ((unint64_t)(v8 - 1) >= 2)
      {
        if (v8 == (char *)5)
        {
          id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager currentDisplayMode](self, "currentDisplayMode"));
          [v9 refreshRate];
          -[PBDisplayManager setUserPreferredRefreshRate:](self, "setUserPreferredRefreshRate:");
        }
      }

      else
      {
        -[PBDisplayManager saveDidCompleteDisplayAssistant:](self, "saveDidCompleteDisplayAssistant:", 1LL);
      }
    }

    -[PBDisplayManager setPresentedDisplayAssistantKind:](self, "setPresentedDisplayAssistantKind:", 0LL);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager nextEstablishModePerDisplays](self, "nextEstablishModePerDisplays"));
    [v10 removeObjectForKey:v7];
  }
}

- (BOOL)didCompleteDisplayAssistantForCurrentDisplay
{
  return -[PBDisplayManager readDidCompleteDisplayAssistant](self, "readDidCompleteDisplayAssistant");
}

- (void)setAudioLatency:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  -[PBDisplayManager saveNewAudioLatency:forKey:](self, "saveNewAudioLatency:forKey:", a3, v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager currentDisplayMode](self, "currentDisplayMode"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 encodedString]);
  unsigned int v9 = [v6 isEqualToString:v8];

  if (v9) {
    -[PBDisplayManager _applyAudioLatencyIfNeeded](self, "_applyAudioLatencyIfNeeded");
  }
}

- (id)audioLatencyForDisplayMode:(id)a3
{
  uint64_t v3 = PBSAudioLatencyForDisplayMode(self, a3);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (void)setColorCalibration:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", a4));
  -[PBDisplayManager saveColorCalibration:forKeys:](self, "saveColorCalibration:forKeys:", v6, v7);
}

- (void)setColorCalibration:(id)a3 forKeys:(id)a4
{
}

- (id)colorCalibrationForDisplayMode:(id)a3
{
  uint64_t v3 = PBSColorCalibrationForDisplayMode(self, a3);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (int64_t)colorCalibrationStatusForDisplayMode:(id)a3
{
  return PBSDisplayColorCalibrationStatusForDisplayMode(self, a3);
}

- (void)_toggleColorCalibration
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager currentDisplayMode](self, "currentDisplayMode"));
  if ((id)-[PBDisplayManager colorCalibrationStatusForDisplayMode:](self, "colorCalibrationStatusForDisplayMode:", v3) == (id)1)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001FE7B8;
    block[3] = &unk_1003D3530;
    char v13 = 1;
    if (qword_1004714D8 != -1) {
      dispatch_once(&qword_1004714D8, block);
    }
    if (byte_1004714D0)
    {
      -[PBDisplayManager setColorGains:](self, "setColorGains:", 0LL);
      byte_1004714D0 = 0;
    }

    else
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager colorCalibrationForDisplayMode:](self, "colorCalibrationForDisplayMode:", v3));
      -[PBDisplayManager setColorGains:](self, "setColorGains:", v6);
      byte_1004714D0 = 1;
    }

    id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  @"Color Calibration",  PBSSystemBulletinTitleKey);
    if (byte_1004714D0) {
      id v7 = @"Calibrated";
    }
    else {
      id v7 = @"Original";
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v7,  PBSSystemBulletinMessageKey);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  PBSSystemBulletinImageIDTV,  PBSSystemBulletinImageIDKey);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  &off_1003FECB0,  PBSSystemBulletinTimeoutKey);
    id v8 = objc_alloc_init(&OBJC_CLASS___PBSBulletin);
    -[PBSBulletin setMessage:](v8, "setMessage:", v5);
    -[PBSBulletin setViewControllerClassName:]( v8,  "setViewControllerClassName:",  PBSSystemBulletinViewControllerClassName);
    -[PBSBulletin setServiceIdentifier:](v8, "setServiceIdentifier:", PBSSystemBulletinServiceName);
    bulletinService = self->_bulletinService;
    if (!bulletinService)
    {
      id v10 = -[PBBulletinService initWithRemoteConnection:]( objc_alloc(&OBJC_CLASS___PBBulletinService),  "initWithRemoteConnection:",  0LL);
      id v11 = self->_bulletinService;
      self->_bulletinService = v10;

      bulletinService = self->_bulletinService;
    }

    -[PBBulletinService presentBulletin:withCompletion:](bulletinService, "presentBulletin:withCompletion:", v8, 0LL);
  }

  else
  {
    id v4 = sub_100082C04();
    id v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v5,  OS_LOG_TYPE_DEFAULT,  "Color Calibration is not set, failing toggle shortcut silently",  buf,  2u);
    }
  }
}

+ (unint64_t)migratePreferenceKeyToDisplayIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults pb_appleTVServicesUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "pb_appleTVServicesUserDefaults"));
  [v5 synchronize];
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"TVResolutions"]);
  if (((uint64_t (*)(void))_NSIsNSDictionary)())
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 hardwareID]);
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v4 legacyEDIDDigest]);
    id v9 = [v6 mutableCopy];
    __int128 v27 = (void *)v8;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v8]);
    char v11 = ((uint64_t (*)(void))_NSIsNSDictionary)();
    if ((v11 & 1) != 0)
    {
      __int128 v26 = v10;
    }

    else
    {
      uint64_t v13 = objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v7]);

      __int128 v26 = (void *)v13;
      if (!_NSIsNSDictionary(v13))
      {
        unint64_t v12 = 2LL;
LABEL_17:

        goto LABEL_18;
      }
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 identifierString]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v14]);
    id v23 = a1;
    id v25 = v15;
    if ((_NSIsNSDictionary(v15) & 1) != 0) {
      id v16 = (NSMutableDictionary *)[v15 mutableCopy];
    }
    else {
      id v16 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    }
    id v17 = v16;
    if ((v11 & 1) != 0
      || (id v18 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v16,  "objectForKeyedSubscript:",  @"TVDisplayID")),  v19 = [v18 isEqualToString:v7],  v18,  (v19 & 1) == 0))
    {
      -[NSMutableDictionary addEntriesFromDictionary:](v17, "addEntriesFromDictionary:", v26, v23, v25);
      [v9 setObject:v17 forKeyedSubscript:v14];
      [v9 setObject:0 forKeyedSubscript:v7];
      [v9 setObject:0 forKeyedSubscript:v27];
      [v5 setObject:v9 forKey:@"TVResolutions"];
      [v5 synchronize];
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v24 sharedInstanceIfExists]);
      id v21 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([v20 reloadStateSource]);

      if (v21) {
        dispatch_source_merge_data(v21, 1uLL);
      }

      unint64_t v12 = 3LL;
    }

    else
    {
      unint64_t v12 = 2LL;
    }

    goto LABEL_17;
  }

  unint64_t v12 = 1LL;
LABEL_18:

  return v12;
}

+ (unint64_t)migrateDisplayModes:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v9 = 0LL;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  char v12 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001FECD4;
  v8[3] = &unk_1003DCD28;
  v8[4] = &v9;
  [a1 enumerateMutableDisplayPreferencesUsingBlock:v8];
  if (*((_BYTE *)v10 + 24)) {
    unint64_t v6 = 3LL;
  }
  else {
    unint64_t v6 = 2LL;
  }
  _Block_object_dispose(&v9, 8);

  return v6;
}

+ (unint64_t)migrateWithContext:(id)a3 error:(id *)a4
{
  if ([a1 migrateDisplayModes:a3 error:a4] == (id)1) {
    return 1LL;
  }
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedInstanceIfExists]);
  id v7 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([v6 reloadStateSource]);

  if (v7) {
    dispatch_source_merge_data(v7, 1uLL);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[PBDisplayIdentifier mainDisplayIdentifier]( &OBJC_CLASS___PBDisplayIdentifier,  "mainDisplayIdentifier"));
  id v5 = [a1 migratePreferenceKeyToDisplayIdentifier:v8];

  return (unint64_t)v5;
}

- (void)displayConnectionUpdated:(int64_t)a3
{
  if (a3 == 2)
  {
    id v11 = sub_100083C30();
    char v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager noScreenAssertion](self, "noScreenAssertion"));
      uint64_t v14 = UIApplicationSceneDeactivationReasonDescription([v13 reason]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      int v16 = 138543362;
      id v17 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Display found, relinquishing scene assertion with reason: %{public}@",  (uint8_t *)&v16,  0xCu);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager noScreenAssertion](self, "noScreenAssertion"));
    [v10 relinquish];
    goto LABEL_9;
  }

  if (a3 == 3)
  {
    id v5 = sub_100083C30();
    unint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager noScreenAssertion](self, "noScreenAssertion"));
      uint64_t v8 = UIApplicationSceneDeactivationReasonDescription([v7 reason]);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      int v16 = 138543362;
      id v17 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "No display found, acquiring scene assertion with reason: %{public}@",  (uint8_t *)&v16,  0xCu);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager noScreenAssertion](self, "noScreenAssertion"));
    [v10 acquire];
LABEL_9:
  }

  -[PBDisplayManager notifyStateChangeForDisplayConnection:](self, "notifyStateChangeForDisplayConnection:", a3);
  -[PBDisplayManager setDisplayConnectionToNotify:](self, "setDisplayConnectionToNotify:", 0LL);
}

- (void)notifyStateChangeForDisplayConnection:(int64_t)a3
{
  id v5 = sub_100082A9C();
  unint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Notifying clients of display state change",  buf,  2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"PBSDisplayStateChangedModification", 0LL, 0LL, 1u);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager stateObservers](self, "stateObservers", 0LL));
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      char v12 = 0LL;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) displayState:self didChangeWithConnection:a3];
        char v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }

    while (v10);
  }
}

- (void)addStateObserver:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager stateObservers](self, "stateObservers"));
    [v5 addObject:v4];
  }

- (void)removeStateObserver:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager stateObservers](self, "stateObservers"));
    [v5 removeObject:v4];
  }

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"localeRefreshRate"] & 1) == 0
    && ([v4 isEqualToString:@"sortedDisplayModes"] & 1) == 0
    && ([v4 isEqualToString:@"currentDisplayMode"] & 1) == 0
    && ([v4 isEqualToString:@"fallbackDisplayMode"] & 1) == 0
    && ([v4 isEqualToString:@"userSelectedDisplayMode"] & 1) == 0
    && ([v4 isEqualToString:@"seenDisplayIDs"] & 1) == 0
    && ([v4 isEqualToString:@"currentDisplayID"] & 1) == 0
    && ([v4 isEqualToString:@"blackScreenRecoveryDisplayModes"] & 1) == 0
    && ([v4 isEqualToString:@"canHandleHighBandwidthModes"] & 1) == 0
    && ([v4 isEqualToString:@"shouldModeSwitchForDynamicRange"] & 1) == 0
    && ([v4 isEqualToString:@"shouldModeSwitchForFrameRate"] & 1) == 0
    && ([v4 isEqualToString:@"shouldUseQMSForFrameRateSwitching"] & 1) == 0
    && ([v4 isEqualToString:@"atmosEnabled"] & 1) == 0
    && ([v4 isEqualToString:@"detectedPoorCableConnection"] & 1) == 0
    && ([v4 isEqualToString:@"lastCablePollStatus"] & 1) == 0
    && ![v4 isEqualToString:@"audioLatencies"])
  {
    unsigned int v7 = [v4 isEqualToString:@"colorCalibrations"];
    unsigned int v8 = sub_1001C9E00();
    if (!v8 || (v7 & 1) != 0)
    {
      if (((v8 | v7) & 1) != 0) {
        goto LABEL_18;
      }
    }

    else if ([v4 isEqualToString:@"softwareDisplaySize"])
    {
      goto LABEL_18;
    }

    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS___PBDisplayManager;
    unsigned __int8 v5 = objc_msgSendSuper2(&v9, "automaticallyNotifiesObserversForKey:", v4);
    goto LABEL_19;
  }

  sub_1001C9E00();
LABEL_18:
  unsigned __int8 v5 = 0;
LABEL_19:

  return v5;
}

- (void)setDisplayStabilizationTimer:(double)a3
{
  dispatch_time_t v4 = dispatch_time(0LL, (uint64_t)(a3 * 1000000000.0));
  dispatch_source_set_timer((dispatch_source_t)self->_displayIDStabilizer, v4, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  __int128 v13 = v12;
  if (off_10046DE68 == a6)
  {
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:NSKeyValueChangeNewKey]);
    if (-[PBDisplayManager _debugAlwaysSaveModeEnabled](self, "_debugAlwaysSaveModeEnabled"))
    {
      uint64_t v16 = objc_opt_self(&OBJC_CLASS___CADisplayMode, v15);
      id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      char isKindOfClass = objc_opt_isKindOfClass(v14, v17);

      if ((isKindOfClass & 1) != 0)
      {
        unsigned __int8 v19 = objc_alloc(&OBJC_CLASS___PBSDisplayMode);
        id v20 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager encodedPromotedDisplayModes](self, "encodedPromotedDisplayModes"));
        id v21 = -[PBSDisplayMode initWithCADisplayMode:usePineBoardPolicy:encodedPromotedModes:]( v19,  "initWithCADisplayMode:usePineBoardPolicy:encodedPromotedModes:",  v14,  0LL,  v20);

        if (v21)
        {
          id v22 = sub_100082A9C();
          id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "Saving display mode because debug-always-save-mode is enabled.",  buf,  2u);
          }

          -[PBDisplayManager saveUserSelectedDisplayMode:](self, "saveUserSelectedDisplayMode:", v21);
        }
      }
    }

    -[PBDisplayManager setDisplayStabilizationTimer:](self, "setDisplayStabilizationTimer:", 0.15);
    id v24 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager reloadStateSource](self, "reloadStateSource"));
    dispatch_source_merge_data(v24, 1uLL);
  }

  else if (off_10046DE70 == a6)
  {
    if ((PBSDisplayFiltersEnabled() & 1) == 0)
    {
      id v25 = sub_100082A9C();
      __int128 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Accessibility display filters disabled. Reload display state.",  buf,  2u);
      }

      __int128 v27 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager reloadStateSource](self, "reloadStateSource"));
      dispatch_source_merge_data(v27, 1uLL);
    }
  }

  else
  {
    v28.receiver = self;
    v28.super_class = (Class)&OBJC_CLASS___PBDisplayManager;
    -[PBDisplayManager observeValueForKeyPath:ofObject:change:context:]( &v28,  "observeValueForKeyPath:ofObject:change:context:",  v10,  v11,  v12,  a6);
  }
}

- (void)presentationElementFocusCoordinator:(id)a3 didUpdateToActiveLayoutLevel:(int64_t)a4 fromLevel:(int64_t)a5
{
  id v8 = a3;
  if (a4 != a5)
  {
    if (a4 == 1)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 currentApplicationSceneHandle]);
      objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v11 clientProcessBundleIdentifier]);

      if (v9) {
        -[PBDisplayManager performModeSwitchForBundleIdentifierIfNeeded:]( self,  "performModeSwitchForBundleIdentifierIfNeeded:",  v9);
      }
      goto LABEL_19;
    }

    if (a4 == 6 || a4 == 2)
    {
      if (-[PBDisplayManager shouldModeSwitchForFrameRate](self, "shouldModeSwitchForFrameRate"))
      {
        objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager currentDisplayMode](self, "currentDisplayMode"));
      }

      else
      {
        unsigned __int8 v12 = -[PBDisplayManager shouldModeSwitchForDynamicRange](self, "shouldModeSwitchForDynamicRange");
        objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager currentDisplayMode](self, "currentDisplayMode"));
        if ((v12 & 1) == 0)
        {
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 currentApplicationSceneHandle]);
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 clientProcessBundleIdentifier]);

          id v17 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplicationLibrary](&OBJC_CLASS___PineBoard, "sharedApplicationLibrary"));
          id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 installedApplicationWithBundleIdentifier:v16]);
          unsigned __int8 v13 = [v18 supportsHDR];

          if (!v9)
          {
LABEL_19:

            goto LABEL_20;
          }

- (void)sceneManager:(id)a3 didChangeCurrentApplicationFromSceneHandle:(id)a4 toSceneHandle:(id)a5
{
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "clientProcessBundleIdentifier", a3, a4));
  if (v6) {
    -[PBDisplayManager performModeSwitchForBundleIdentifierIfNeeded:]( self,  "performModeSwitchForBundleIdentifierIfNeeded:",  v6);
  }
}

- (id)stateDumpBuilder
{
  id v3 = objc_alloc_init(&OBJC_CLASS___TVSStateDumpBuilder);
  id v4 =  [v3 appendBool:self->_shouldModeSwitchForDynamicRange withKey:@"shouldModeSwitchForDynamicRange"];
  id v5 =  [v3 appendBool:self->_shouldModeSwitchForFrameRate withKey:@"shouldModeSwitchForFrameRate"];
  return v3;
}

- (void)_mediaServicesWereReset:(id)a3
{
}

- (void)setBaseCableCheckTimeInterval:(double)a3
{
  self->_baseCableCheckTimeInterval = a3;
}

- (NSArray)blackScreenRecoveryDisplayModes
{
  return self->_blackScreenRecoveryDisplayModes;
}

- (void)setBlackScreenRecoveryDisplayModes:(id)a3
{
}

- (BSInvalidatable)stateCaptureHandle
{
  return self->_stateCaptureHandle;
}

- (BOOL)filteredUsingdPineBoardPolicy
{
  return self->_filteredUsingdPineBoardPolicy;
}

- (void)setFilteredUsingdPineBoardPolicy:(BOOL)a3
{
  self->_filteredUsingdPineBoardPolicy = a3;
}

- (NSMutableDictionary)nextEstablishModePerDisplays
{
  return self->_nextEstablishModePerDisplays;
}

- (void)setNextEstablishModePerDisplays:(id)a3
{
}

- (NSHashTable)stateObservers
{
  return self->_stateObservers;
}

- (void)setStateObservers:(id)a3
{
}

- (SSDisplay)systemState
{
  return self->_systemState;
}

- (void)setSystemState:(id)a3
{
}

- (OS_dispatch_source)reloadStateSource
{
  return self->_reloadStateSource;
}

- (OS_dispatch_source)notifyClientsSource
{
  return self->_notifyClientsSource;
}

- (NSNumber)displayConnectionToNotify
{
  return self->_displayConnectionToNotify;
}

- (void)setDisplayConnectionToNotify:(id)a3
{
}

- (PBBulletinService)bulletinService
{
  return self->_bulletinService;
}

- (void)setBulletinService:(id)a3
{
}

- (void)setNoScreenAssertion:(id)a3
{
}

- (PBMultiLatch)wakeProgressLatch
{
  return self->_wakeProgressLatch;
}

- (OS_dispatch_source)displayIDStabilizer
{
  return self->_displayIDStabilizer;
}

- (PBSDisplayManagerUpdateRequest)priorDisplayUpdateRequest
{
  return self->_priorDisplayUpdateRequest;
}

- (void)setPriorDisplayUpdateRequest:(id)a3
{
}

- (OS_dispatch_queue)displayUpdateQueue
{
  return self->_displayUpdateQueue;
}

- (double)localeRefreshRate
{
  return self->_localeRefreshRate;
}

- (NSArray)sortedDisplayModes
{
  return self->_sortedDisplayModes;
}

- (void)setSortedDisplayModes:(id)a3
{
}

- (PBSDisplayMode)currentDisplayMode
{
  return self->_currentDisplayMode;
}

- (void)setCurrentDisplayMode:(id)a3
{
}

- (PBSDisplayMode)fallbackDisplayMode
{
  return self->_fallbackDisplayMode;
}

- (void)setFallbackDisplayMode:(id)a3
{
}

- (PBSDisplayMode)userSelectedDisplayMode
{
  return self->_userSelectedDisplayMode;
}

- (NSSet)seenDisplayIDs
{
  return self->_seenDisplayIDs;
}

- (void)setSeenDisplayIDs:(id)a3
{
}

- (NSString)currentDisplayID
{
  return self->_currentDisplayID;
}

- (void)setCurrentDisplayID:(id)a3
{
}

- (BOOL)canHandleHighBandwidthModes
{
  return self->_canHandleHighBandwidthModes;
}

- (BOOL)shouldModeSwitchForDynamicRange
{
  return self->_shouldModeSwitchForDynamicRange;
}

- (BOOL)shouldModeSwitchForFrameRate
{
  return self->_shouldModeSwitchForFrameRate;
}

- (BOOL)atmosEnabled
{
  return self->_atmosEnabled;
}

- (int64_t)displayConnection
{
  return self->_displayConnection;
}

- (void)setDisplayConnection:(int64_t)a3
{
  self->_displayConnection = a3;
}

- (BOOL)detectedPoorCableConnection
{
  return self->_detectedPoorCableConnection;
}

- (int64_t)lastCablePollStatus
{
  return self->_lastCablePollStatus;
}

- (NSDictionary)audioLatencies
{
  return self->_audioLatencies;
}

- (NSDictionary)colorCalibrations
{
  return self->_colorCalibrations;
}

- (void)setEARCStatus:(int64_t)a3
{
  self->_eARCStatus = a3;
}

- (BOOL)shouldUseQMSForFrameRateSwitching
{
  return self->_shouldUseQMSForFrameRateSwitching;
}

- (BOOL)hdr10PlusMetadataEnabled
{
  return self->_hdr10PlusMetadataEnabled;
}

- (CGSize)softwareDisplaySize
{
  double width = self->_softwareDisplaySize.width;
  double height = self->_softwareDisplaySize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)userPreferredRefreshRate
{
  return self->_userPreferredRefreshRate;
}

- (NSSet)encodedPromotedDisplayModes
{
  return self->_encodedPromotedDisplayModes;
}

- (BOOL)deemed4KCapable
{
  return self->_deemed4KCapable;
}

- (void)setDeemed4KCapable:(BOOL)a3
{
  self->_deemed4KCapable = a3;
}

- (NSNumber)presentedDisplayAssistantKind
{
  return self->_presentedDisplayAssistantKind;
}

- (void)setPresentedDisplayAssistantKind:(id)a3
{
}

- (BOOL)usesDolbyLowLatency
{
  return self->_usesDolbyLowLatency;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (NSDictionary)memoryStore
{
  return self->_memoryStore;
}

- (void)setMemoryStore:(id)a3
{
}

- (NSString)currentDisplayIdentifier
{
  return self->_currentDisplayIdentifier;
}

- (void)setCurrentDisplayIdentifier:(id)a3
{
}

- (OS_dispatch_source)cableCheckTimer
{
  return self->_cableCheckTimer;
}

- (void)setCableCheckTimer:(id)a3
{
}

- (PBCableSignalInfo)lastCableErrorInfo
{
  return self->_lastCableErrorInfo;
}

- (NSMutableArray)matchContentRequestedModes
{
  return self->_matchContentRequestedModes;
}

- (void)setMatchContentRequestedModes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end