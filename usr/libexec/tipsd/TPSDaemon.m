@interface TPSDaemon
- (BOOL)_appXPCConnectionContainsConnection:(id)a3;
- (BOOL)_assistantXPCConnectionContainsConnection:(id)a3;
- (BOOL)_discoverabilityXPCConnectionContainsConnection:(id)a3;
- (BOOL)canCheckForNewTipNotification:(id)a3;
- (BOOL)contentUpdatePostProcessingContentPackage:(id)a3 shouldUpdateNotification:(BOOL)a4 shouldDeferBlock:(id)a5 error:(id)a6;
- (BOOL)isContentIneligibleDueToViewOnOtherDevices:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)multiuserModeOn;
- (BOOL)setupCompleted;
- (BOOL)tipsAppInstalled;
- (BOOL)tipsInValidState;
- (NSMutableSet)appConnections;
- (NSMutableSet)assistantConnections;
- (NSMutableSet)discoverabilityConnections;
- (NSString)notificationTimingDarwinKey;
- (NSURLSession)tipsFeedURLSession;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)appConnectionQueue;
- (OS_dispatch_queue)assistantConnectionQueue;
- (OS_dispatch_queue)discoverabilityConnectionQueue;
- (TPSDaemon)init;
- (TPSDiscoverabilityController)discoverabilityController;
- (TPSFullTipUsageEventManager)usageEventManager;
- (TPSNotificationController)notificationController;
- (TPSTipStatusController)tipStatusController;
- (TPSTipsManager)tipsManager;
- (TPSWelcome)welcome;
- (id)_errorForHintIneligibleReason:(int64_t)a3 contentID:(id)a4;
- (id)analyticsExperiment;
- (id)bundleIDForIdentifier:(id)a3;
- (id)contextForIdentifier:(id)a3;
- (id)contextualInfoForIdentifier:(id)a3;
- (id)contextualInfoMap;
- (id)correlationIDForIdentifier:(id)a3;
- (id)currentExperimentWithDiscoverabilityController:(id)a3;
- (id)deliveryInfoVersion;
- (id)displayTypeForIdentifier:(id)a3;
- (id)experimentCampID;
- (id)experimentCampIDStringForCamp:(int64_t)a3;
- (id)experimentID;
- (id)miniTipMetadataForContent:(id)a3 bundleID:(id)a4 context:(id)a5;
- (id)shouldDeferBlockForXPCActivity:(id)a3;
- (id)tipStatusForIdentifier:(id)a3;
- (id)xpcActivitySetStateBlockForIdentifier:(id)a3;
- (int64_t)displayStatusCheckForHintIneligibleReasonWithContent:(id)a3 context:(id)a4 bypassExperiment:(BOOL)a5;
- (int64_t)statusCheckForHintIneligibleReasonWithContentID:(id)a3;
- (unint64_t)hintDisplayedCountForIdentifier:(id)a3;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6;
- (void)_addAppXPCConnection:(id)a3;
- (void)_addAssistantXPCConnection:(id)a3;
- (void)_addDiscoverabilityXPCConnection:(id)a3;
- (void)_removeAppXPCConnection:(id)a3;
- (void)_removeAssistantXPCConnection:(id)a3;
- (void)_removeDiscoverabilityXPCConnection:(id)a3;
- (void)appRemovalCleanupIfNeeded;
- (void)availableUserGuideIdentifiersWithReply:(id)a3;
- (void)cancelLegacyBackgroundTaskIfNeeded;
- (void)cancelQueryWithIdentifier:(id)a3;
- (void)contentForVariant:(id)a3 completionHandler:(id)a4;
- (void)contentViewedForIdentifier:(id)a3;
- (void)contentWithCompletionHandler:(id)a3;
- (void)contentWithContentIdentifiers:(id)a3 bundleID:(id)a4 context:(id)a5 completionHandler:(id)a6;
- (void)deleteAllSearchableItemsWithCompletionHandler:(id)a3;
- (void)donateContentRetrieved:(id)a3 bundleID:(id)a4 context:(id)a5 error:(id)a6;
- (void)donateHintIneligibleReason:(int64_t)a3 contentID:(id)a4 bundleID:(id)a5 context:(id)a6;
- (void)fetchAssetsWithAssetsConfiguration:(id)a3 completionHandler:(id)a4;
- (void)fetchDocumentWithIdentifier:(id)a3 reply:(id)a4;
- (void)findMatchingResultIdFromContexts:(id)a3 reply:(id)a4;
- (void)handleDeviceFirstUnlockNotification;
- (void)handleLanguageDidChangeNotification;
- (void)hintDismissedForIdentifier:(id)a3 bundleID:(id)a4 context:(id)a5 reason:(int64_t)a6;
- (void)hintDisplayedForIdentifier:(id)a3 correlationID:(id)a4 context:(id)a5;
- (void)immediateNotificationForIdentifiers:(id)a3;
- (void)indexContentPackage:(id)a3;
- (void)initialize;
- (void)logAnalyticsEvent:(id)a3;
- (void)logAnalyticsEvents:(id)a3;
- (void)logDaemonActiveEventWithReason:(id)a3;
- (void)notificationController:(id)a3 markIdentifier:(id)a4 type:(int64_t)a5 ineligibleWithReason:(int64_t)a6;
- (void)notificationController:(id)a3 registrableEventReceivedForDocumentIdentifier:(id)a4;
- (void)performQuery:(id)a3 completion:(id)a4;
- (void)personalizationFailedForContentID:(id)a3 bundleID:(id)a4 context:(id)a5;
- (void)prepareForNotifications;
- (void)processAppInteractedByUser;
- (void)registerDarwinNotification:(id)a3;
- (void)registerForMobileKeyBagLockStatusNotify;
- (void)registerForNotificationTimingDarwinNotification;
- (void)registerImmediateNotifications;
- (void)registerXPCEventHandlers;
- (void)reindexAllSearchableItemsWithCompletionHandler:(id)a3;
- (void)reindexSearchableItemsWithIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)reloadAppGroupDefaults;
- (void)removeNotificationForIdentifier:(id)a3;
- (void)resetAllDataIfNeeded;
- (void)resetBasicDefaults;
- (void)restartTrackingForContentIdentifiers:(id)a3;
- (void)setAppConnectionQueue:(id)a3;
- (void)setAppConnections:(id)a3;
- (void)setAssistantConnectionQueue:(id)a3;
- (void)setAssistantConnections:(id)a3;
- (void)setDiscoverabilityConnectionQueue:(id)a3;
- (void)setDiscoverabilityConnections:(id)a3;
- (void)setDiscoverabilityController:(id)a3;
- (void)setNotificationController:(id)a3;
- (void)setTipStatusController:(id)a3;
- (void)setTipsFeedURLSession:(id)a3;
- (void)setTipsManager:(id)a3;
- (void)setUsageEventManager:(id)a3;
- (void)setWelcome:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)showNewTipNotification;
- (void)tipsAppActive;
- (void)tipsManager:(id)a3 contextualEligibilityWithTipIdentifiers:(id)a4 tipsDeliveryInfoMap:(id)a5 deliveryInfoMap:(id)a6 experimentCampChangesToAll:(BOOL)a7;
- (void)tipsManager:(id)a3 eligibilityCompletedWithTipIdentifiers:(id)a4 contextualTipIdentifiers:(id)a5 tipsDeliveryInfoMap:(id)a6 deliveryInfoMap:(id)a7;
- (void)tipsManagerContentUpdateOverrideCompleted:(id)a3 contentPackage:(id)a4 shouldUpdateNotification:(BOOL)a5 error:(id)a6;
- (void)unregisterDarwinNotification:(id)a3;
- (void)unregisterImmediateNotifications;
- (void)updateContentFromOrigin:(BOOL)a3 contextualEligibility:(BOOL)a4 widgetEligibility:(BOOL)a5 notificationEligibility:(BOOL)a6 preferredNotificationIdentifiers:(id)a7 shouldDeferBlock:(id)a8 completionHandler:(id)a9;
- (void)updateContentWithActivity:(id)a3 identifier:(id)a4 preferredNotificationIdentifiers:(id)a5 multiuserModeOn:(BOOL)a6 contextualEligibility:(BOOL)a7 widgetEligibility:(BOOL)a8 notificationEligibility:(BOOL)a9;
- (void)updateNotificationStatus;
- (void)userGuideMapWithCompletionHandler:(id)a3;
- (void)validateAndPrepareContentForDisplay:(id)a3 bundleID:(id)a4 context:(id)a5 skipUsageCheck:(BOOL)a6 completionHandler:(id)a7;
- (void)welcome:(id)a3 contentAvailableRemotelyWithCompletionHandler:(id)a4;
- (void)welcome:(id)a3 notifyWelcomeDocument:(id)a4;
@end

@implementation TPSDaemon

- (TPSDaemon)init
{
  v44.receiver = self;
  v44.super_class = (Class)&OBJC_CLASS___TPSDaemon;
  v2 = -[TPSDaemon init](&v44, "init");
  if (v2)
  {
    +[TPSPersonaUtilities _adoptPersonaForContainerLookupIfNeeded]( &OBJC_CLASS___TPSPersonaUtilities,  "_adoptPersonaForContainerLookupIfNeeded");
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[TPSURLSessionHandler sharedInstance](&OBJC_CLASS___TPSURLSessionHandler, "sharedInstance"));
    [v3 setExcludeCachingDataTypes:0];

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[TPSURLSessionHandler sharedInstance](&OBJC_CLASS___TPSURLSessionHandler, "sharedInstance"));
    [v4 setDelegate:v2];
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[TPSURLSessionManager defaultManager](&OBJC_CLASS___TPSURLSessionManager, "defaultManager"));
    [v5 setDelegate:v4];

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TPSURLSessionManager defaultManager](&OBJC_CLASS___TPSURLSessionManager, "defaultManager"));
    [v6 setDefaultSessionDelegate:v4];

    v7 = -[TPSAnalyticsDataProvider initWithDataSource:]( objc_alloc(&OBJC_CLASS___TPSAnalyticsDataProvider),  "initWithDataSource:",  v2);
    analyticsDataProvider = v2->_analyticsDataProvider;
    v2->_analyticsDataProvider = v7;

    v9 = v2->_analyticsDataProvider;
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[TPSAnalyticsEventController sharedInstance]( &OBJC_CLASS___TPSAnalyticsEventController,  "sharedInstance"));
    [v10 setDataProvider:v9];

    if (+[TPSCommonDefines isInternalDevice](&OBJC_CLASS___TPSCommonDefines, "isInternalDevice"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[TPSURLSessionACAuthContext defaultContext]( &OBJC_CLASS___TPSURLSessionACAuthContext,  "defaultContext"));
      id v12 = [v11 copy];

      [v12 setInteractivityMode:TPSURLSessionAuthInteractivitySilentOnly];
      id v13 = [[TPSURLSessionACAuthHandler alloc] initWithAuthenticationContext:v12];
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[TPSURLSessionManager defaultManager](&OBJC_CLASS___TPSURLSessionManager, "defaultManager"));
      [v14 setAuthenticationHandler:v13];
    }

    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Tips Daemon Starting.", buf, 2u);
    }

    if (MKBDeviceFormattedForContentProtection())
    {
      atomic_store((int)MKBDeviceUnlockedSinceBoot() > 0, byte_100022190);
    }

    else
    {
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "DeviceFormattedForContentProtection not needed",  buf,  2u);
      }
    }

    uint64_t v17 = objc_claimAutoreleasedReturnValue( +[TPSNotificationController displayDarwinNotificationKey]( &OBJC_CLASS___TPSNotificationController,  "displayDarwinNotificationKey"));
    notificationTimingDarwinKey = v2->_notificationTimingDarwinKey;
    v2->_notificationTimingDarwinKey = (NSString *)v17;

    dispatch_queue_attr_t v19 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v19);
    dispatch_queue_t v21 = dispatch_queue_create("com.apple.tipsd.discoverabilityConnectionQueue", v20);
    discoverabilityConnectionQueue = v2->_discoverabilityConnectionQueue;
    v2->_discoverabilityConnectionQueue = (OS_dispatch_queue *)v21;

    dispatch_queue_attr_t v23 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v24 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v23);
    dispatch_queue_t v25 = dispatch_queue_create("com.apple.tipsd.appConnectionQueue", v24);
    appConnectionQueue = v2->_appConnectionQueue;
    v2->_appConnectionQueue = (OS_dispatch_queue *)v25;

    dispatch_queue_attr_t v27 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v28 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v27);
    dispatch_queue_t v29 = dispatch_queue_create("com.apple.tipsd.assistantConnectionQueue", v28);
    assistantConnectionQueue = v2->_assistantConnectionQueue;
    v2->_assistantConnectionQueue = (OS_dispatch_queue *)v29;

    uint64_t v31 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    discoverabilityConnections = v2->_discoverabilityConnections;
    v2->_discoverabilityConnections = (NSMutableSet *)v31;

    uint64_t v33 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    appConnections = v2->_appConnections;
    v2->_appConnections = (NSMutableSet *)v33;

    uint64_t v35 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    assistantConnections = v2->_assistantConnections;
    v2->_assistantConnections = (NSMutableSet *)v35;

    if (-[TPSDaemon multiuserModeOn](v2, "multiuserModeOn"))
    {
      v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "EDU mode on", buf, 2u);
      }
    }

    else
    {
      unsigned __int8 v38 = atomic_load(byte_100022190);
      if ((v38 & 1) != 0)
      {
        -[TPSDaemon initialize](v2, "initialize");
      }

      else if (-[TPSDaemon setupCompleted](v2, "setupCompleted"))
      {
        v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "User has not perform first unlock",  buf,  2u);
        }

        -[TPSDaemon registerForMobileKeyBagLockStatusNotify](v2, "registerForMobileKeyBagLockStatusNotify");
      }
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100003220;
    block[3] = &unk_10001C9D8;
    v42 = v2;
    dispatch_async(&_dispatch_main_q, block);
  }

  return v2;
}

- (void)initialize
{
  if (!self->_initialized)
  {
    unsigned __int8 v2 = atomic_load(byte_100022190);
    if ((v2 & 1) != 0)
    {
      self->_initialized = 1;
      -[TPSDaemon resetAllDataIfNeeded](self, "resetAllDataIfNeeded");
      id v4 = +[TPSBluetoothChecker sharedInstance](&OBJC_CLASS___TPSBluetoothChecker, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCommonDefines sharedInstance](&OBJC_CLASS___TPSCommonDefines, "sharedInstance"));
      v6 = (TPSTipStatusController *)objc_claimAutoreleasedReturnValue([v5 tipStatusController]);
      tipStatusController = self->_tipStatusController;
      self->_tipStatusController = v6;

      v8 = -[TPSTipsManager initWithTipStatusController:]( objc_alloc(&OBJC_CLASS___TPSTipsManager),  "initWithTipStatusController:",  self->_tipStatusController);
      tipsManager = self->_tipsManager;
      self->_tipsManager = v8;

      -[TPSTipsManager setDelegate:](self->_tipsManager, "setDelegate:", self);
      v10 = -[TPSDiscoverabilityController initWithTipStatusController:]( objc_alloc(&OBJC_CLASS___TPSDiscoverabilityController),  "initWithTipStatusController:",  self->_tipStatusController);
      discoverabilityController = self->_discoverabilityController;
      self->_discoverabilityController = v10;

      -[TPSDiscoverabilityController setDelegate:](self->_discoverabilityController, "setDelegate:", self);
      id v12 = objc_alloc_init(&OBJC_CLASS___TPSFullTipUsageEventManager);
      usageEventManager = self->_usageEventManager;
      self->_usageEventManager = v12;

      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipStatusController debugDescription](self->_tipStatusController, "debugDescription"));
        int v37 = 138412290;
        unsigned __int8 v38 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Tips status controller %@",  (uint8_t *)&v37,  0xCu);
      }

      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[TPSDiscoverabilityController debugDescription]( self->_discoverabilityController,  "debugDescription"));
        int v37 = 138412290;
        unsigned __int8 v38 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "discoverability controller %@",  (uint8_t *)&v37,  0xCu);
      }

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipStatusController tipStatusMap](self->_tipStatusController, "tipStatusMap"));
      if (![v18 count])
      {
        id v19 = objc_alloc(&OBJC_CLASS___TPSAnalyticsProcessingController);
        v20 = (void *)objc_claimAutoreleasedReturnValue([v18 allValues]);
        dispatch_queue_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon contextualInfoMap](self, "contextualInfoMap"));
        v22 = (void *)objc_claimAutoreleasedReturnValue( -[TPSDiscoverabilityController eventsHistoryController]( self->_discoverabilityController,  "eventsHistoryController"));
        dispatch_queue_attr_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 contextualEventsForIdentifiers]);
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsManager experiment](self->_tipsManager, "experiment"));
        id v25 = [v19 initWithAllTipStatus:v20 contextualInfoMap:v21 eventHistoryMap:v23 experiment:v24];

        [v25 resetAnalytics];
      }

      unsigned int v26 = -[TPSDaemon tipsInValidState](self, "tipsInValidState");
      dispatch_queue_attr_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
      BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
      if (v26)
      {
        if (v28)
        {
          LOWORD(v37) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Tips app is in a valid state.",  (uint8_t *)&v37,  2u);
        }

        dispatch_queue_t v29 = objc_alloc_init(&OBJC_CLASS___TPSNotificationController);
        notificationController = self->_notificationController;
        self->_notificationController = v29;

        -[TPSNotificationController setDelegate:](self->_notificationController, "setDelegate:", self);
        -[TPSTipsManager setNotificationController:]( self->_tipsManager,  "setNotificationController:",  self->_notificationController);
        uint64_t v31 = -[TPSWelcome initWithDelegate:tipsManager:notificationController:]( objc_alloc(&OBJC_CLASS___TPSWelcome),  "initWithDelegate:tipsManager:notificationController:",  self,  self->_tipsManager,  self->_notificationController);
        welcome = self->_welcome;
        self->_welcome = v31;

        -[TPSWelcome reconnectWelcomeIfNeeded:](self->_welcome, "reconnectWelcomeIfNeeded:", 1LL);
        -[TPSDaemon registerImmediateNotifications](self, "registerImmediateNotifications");
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon notificationTimingDarwinKey](self, "notificationTimingDarwinKey"));

        if (v33)
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon notificationController](self, "notificationController"));
          uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v34 notificationCache]);

          v36 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon notificationTimingDarwinKey](self, "notificationTimingDarwinKey"));
          if (v35) {
            -[TPSDaemon registerDarwinNotification:](self, "registerDarwinNotification:", v36);
          }
          else {
            -[TPSDaemon unregisterDarwinNotification:](self, "unregisterDarwinNotification:", v36);
          }
        }

        if (-[TPSDaemon setupCompleted](self, "setupCompleted")) {
          -[TPSDaemon unregisterDarwinNotification:]( self,  "unregisterDarwinNotification:",  BYSetupAssistantExitedDarwinNotification);
        }
        else {
          -[TPSDaemon registerDarwinNotification:]( self,  "registerDarwinNotification:",  BYSetupAssistantExitedDarwinNotification);
        }
      }

      else
      {
        if (v28)
        {
          LOWORD(v37) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Tips app is not in a valid state, skip registration for notifications.",  (uint8_t *)&v37,  2u);
        }
      }

      -[TPSTipsManager updateContentIfOverrideImmediately:]( self->_tipsManager,  "updateContentIfOverrideImmediately:",  0LL);
      -[TPSDaemon appRemovalCleanupIfNeeded](self, "appRemovalCleanupIfNeeded");
    }
  }

- (void)registerForMobileKeyBagLockStatusNotify
{
  unsigned __int8 v2 = atomic_load(byte_100022190);
  if ((v2 & 1) == 0)
  {
    int out_token = -1;
    v3 = (const char *)kMobileKeyBagLockStatusNotifyToken;
    id v4 = &_dispatch_main_q;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100003780;
    handler[3] = &unk_10001CA00;
    objc_copyWeak(&v6, &location);
    notify_register_dispatch(v3, &out_token, &_dispatch_main_q, handler);

    objc_destroyWeak(&v6);
  }

  objc_destroyWeak(&location);
}

- (id)xpcActivitySetStateBlockForIdentifier:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100003904;
  v6[3] = &unk_10001CA28;
  id v7 = a3;
  id v3 = v7;
  id v4 = objc_retainBlock(v6);

  return v4;
}

- (id)shouldDeferBlockForXPCActivity:(id)a3
{
  v9[0] = 0LL;
  v9[1] = v9;
  v9[2] = 0x2020000000LL;
  char v10 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100003B7C;
  v6[3] = &unk_10001CA50;
  id v7 = a3;
  v8 = v9;
  id v3 = v7;
  id v4 = objc_retainBlock(v6);

  _Block_object_dispose(v9, 8);
  return v4;
}

- (void)updateContentWithActivity:(id)a3 identifier:(id)a4 preferredNotificationIdentifiers:(id)a5 multiuserModeOn:(BOOL)a6 contextualEligibility:(BOOL)a7 widgetEligibility:(BOOL)a8 notificationEligibility:(BOOL)a9
{
  BOOL v24 = a8;
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v32 = v15;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Update content with event %@.", buf, 0xCu);
  }

  v18 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue( -[TPSDaemon shouldDeferBlockForXPCActivity:]( self,  "shouldDeferBlockForXPCActivity:",  v14));
  id v19 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[TPSDaemon xpcActivitySetStateBlockForIdentifier:]( self,  "xpcActivitySetStateBlockForIdentifier:",  v15));
  int v20 = v18[2](v18);
  if (((v20 | v10) & 1) != 0
    || (unsigned __int8 v21 = atomic_load(byte_100022190), (v21 & 1) == 0)
    || !-[TPSDaemon setupCompleted](self, "setupCompleted"))
  {
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v23 = atomic_load(byte_100022190);
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)v32 = v20;
      *(_WORD *)&v32[4] = 1024;
      *(_DWORD *)&v32[6] = v10;
      __int16 v33 = 1024;
      int v34 = v23 & 1;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Update content skipped. deferBlock %d, multiuserModeOn %d, deviceUnlockedSinceBoot %d",  buf,  0x14u);
    }

    goto LABEL_11;
  }

  if (!((unsigned int (*)(void, id, uint64_t))v19[2])(v19, v14, 4LL))
  {
LABEL_11:
    ((void (**)(void, id, uint64_t))v19)[2](v19, v14, 5LL);
    goto LABEL_12;
  }

  objc_initWeak((id *)buf, self);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100003EBC;
  v25[3] = &unk_10001CA78;
  objc_copyWeak(&v29, (id *)buf);
  BOOL v30 = a9;
  dispatch_queue_attr_t v27 = v18;
  BOOL v28 = v19;
  id v26 = v14;
  -[TPSDaemon updateContentFromOrigin:contextualEligibility:widgetEligibility:notificationEligibility:preferredNotificationIdentifiers:shouldDeferBlock:completionHandler:]( self,  "updateContentFromOrigin:contextualEligibility:widgetEligibility:notificationEligibility:preferredNotificationIdentif iers:shouldDeferBlock:completionHandler:",  1LL,  v9,  v24,  a9,  v16,  v27,  v25);

  objc_destroyWeak(&v29);
  objc_destroyWeak((id *)buf);
LABEL_12:
}

- (BOOL)contentUpdatePostProcessingContentPackage:(id)a3 shouldUpdateNotification:(BOOL)a4 shouldDeferBlock:(id)a5 error:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  v11 = (uint64_t (**)(void))a5;
  id v12 = a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 domain]);
  else {
    BOOL v14 = 0;
  }

  if (v14 || !v8 || (-[TPSDaemon updateNotificationStatus](self, "updateNotificationStatus"), !v11))
  {
    if (!v14) {
      goto LABEL_8;
    }
LABEL_12:
    BOOL v19 = 1;
    goto LABEL_13;
  }

  if ((v11[2](v11) & 1) != 0) {
    goto LABEL_12;
  }
LABEL_8:
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon welcome](self, "welcome"));
  unsigned __int8 v16 = [v15 isReminderCompleted];

  if ((v16 & 1) == 0)
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon tipsManager](self, "tipsManager"));
    id v18 = [v17 welcomeDocumentFromContentPackage:v10];
  }

  BOOL v19 = 0;
LABEL_13:

  return v19;
}

- (void)registerXPCEventHandlers
{
  unsigned __int8 v3 = -[TPSDaemon multiuserModeOn](self, "multiuserModeOn");
  objc_initWeak(location, self);
  id v4 = (const char *)[@"com.apple.tipsd.postInstall-utility" UTF8String];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10000434C;
  handler[3] = &unk_10001CAA0;
  objc_copyWeak(&v22, location);
  void handler[4] = self;
  unsigned __int8 v23 = v3;
  xpc_activity_register(v4, XPC_ACTIVITY_CHECK_IN, handler);
  v5 = (const char *)[@"com.apple.tipsd.update-content" UTF8String];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10000452C;
  v18[3] = &unk_10001CAC8;
  objc_copyWeak(&v19, location);
  unsigned __int8 v20 = v3;
  xpc_activity_register(v5, XPC_ACTIVITY_CHECK_IN, v18);
  id v6 = (const char *)[@"com.apple.tipsd.analytics-maintenance" UTF8String];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000045C4;
  v15[3] = &unk_10001CAC8;
  objc_copyWeak(&v16, location);
  unsigned __int8 v17 = v3;
  xpc_activity_register(v6, XPC_ACTIVITY_CHECK_IN, v15);
  id v7 = (const char *)kNSURLSessionLaunchOnDemandNotificationName;
  BOOL v8 = &_dispatch_main_q;
  xpc_set_event_stream_handler(v7, &_dispatch_main_q, &stru_10001CB08);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000484C;
  v12[3] = &unk_10001CAC8;
  objc_copyWeak(&v13, location);
  unsigned __int8 v14 = v3;
  xpc_set_event_stream_handler("com.apple.coreduetcontext.client_event_stream", &_dispatch_main_q, v12);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000049FC;
  void v9[3] = &unk_10001CAA0;
  objc_copyWeak(&v10, location);
  unsigned __int8 v11 = v3;
  v9[4] = self;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", &_dispatch_main_q, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v22);
  objc_destroyWeak(location);
}

- (BOOL)tipsAppInstalled
{
  return +[TPSNotificationController supportsNotification]( &OBJC_CLASS___TPSNotificationController,  "supportsNotification");
}

- (BOOL)tipsInValidState
{
  return +[TPSNotificationController supportsNotification]( &OBJC_CLASS___TPSNotificationController,  "supportsNotification");
}

- (BOOL)multiuserModeOn
{
  return 0;
}

- (BOOL)setupCompleted
{
  int HasCompletedInitialRun = BYSetupAssistantHasCompletedInitialRun(self, a2);
  int v3 = BYSetupAssistantNeedsToRun();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109376;
    v6[1] = HasCompletedInitialRun;
    __int16 v7 = 1024;
    int v8 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Buddy setup completed: %d, buddy needs to run %d",  (uint8_t *)v6,  0xEu);
  }

  return HasCompletedInitialRun & (v3 ^ 1);
}

- (void)reloadAppGroupDefaults
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCommonDefines sharedInstance](&OBJC_CLASS___TPSCommonDefines, "sharedInstance"));
  id v4 = [v3 reloadAppGroupDefaults];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCommonDefines sharedInstance](&OBJC_CLASS___TPSCommonDefines, "sharedInstance"));
  id v6 = (TPSTipStatusController *)objc_claimAutoreleasedReturnValue([v5 tipStatusController]);
  tipStatusController = self->_tipStatusController;
  self->_tipStatusController = v6;

  -[TPSDiscoverabilityController setTipStatusController:]( self->_discoverabilityController,  "setTipStatusController:",  self->_tipStatusController);
}

- (void)registerForNotificationTimingDarwinNotification
{
  if (self->_notificationTimingDarwinNotificationRegistered)
  {
    unsigned __int8 v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Already registered for lock screen.", buf, 2u);
    }
  }

  else
  {
    self->_notificationTimingDarwinNotificationRegistered = 1;
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[TPSDaemon notificationTimingDarwinKey](self, "notificationTimingDarwinKey"));
    -[TPSDaemon registerDarwinNotification:](self, "registerDarwinNotification:", v4);
  }

- (void)registerDarwinNotification:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
    id v6 = (const char *)[v5 cStringUsingEncoding:4];
    xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_string(v7, "Notification", v6);
    xpc_set_event("com.apple.notifyd.matching", v6, v7);
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Register for %@.", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)unregisterDarwinNotification:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon notificationTimingDarwinKey](self, "notificationTimingDarwinKey"));
    unsigned int v6 = [v4 isEqualToString:v5];

    if (v6) {
      self->_notificationTimingDarwinNotificationRegistered = 0;
    }
    id v7 = v4;
    xpc_set_event("com.apple.notifyd.matching", [v7 cStringUsingEncoding:4], 0);
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unregister for %@.", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)registerImmediateNotifications
{
  if ((+[TPSTipsManager needImmediateNotificationForType:]( &OBJC_CLASS___TPSTipsManager,  "needImmediateNotificationForType:",  0LL) & 1) != 0 || +[TPSTipsManager needImmediateNotificationForType:]( &OBJC_CLASS___TPSTipsManager,  "needImmediateNotificationForType:",  1LL))
  {
    id v3 = -[TPSDaemon registerDarwinNotification:]( self,  "registerDarwinNotification:",  @"com.apple.bluetooth.pairing");
  }

  else
  {
    id v3 = -[TPSDaemon unregisterDarwinNotification:]( self,  "unregisterDarwinNotification:",  @"com.apple.bluetooth.pairing");
  }

  uint64_t v4 = TPSHMManagerSpeakersConfiguredChangedNotificationString(v3);
  id v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  if (+[TPSTipsManager needImmediateNotificationForType:]( &OBJC_CLASS___TPSTipsManager,  "needImmediateNotificationForType:",  2LL)) {
    -[TPSDaemon registerDarwinNotification:](self, "registerDarwinNotification:", v5);
  }
  else {
    -[TPSDaemon unregisterDarwinNotification:](self, "unregisterDarwinNotification:", v5);
  }
}

- (void)unregisterImmediateNotifications
{
  uint64_t v3 = TPSHMManagerSpeakersConfiguredChangedNotificationString(self);
  id v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  -[TPSDaemon unregisterDarwinNotification:](self, "unregisterDarwinNotification:", v4);
  -[TPSDaemon unregisterDarwinNotification:]( self,  "unregisterDarwinNotification:",  @"com.apple.bluetooth.pairing");
}

- (void)prepareForNotifications
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon notificationTimingDarwinKey](self, "notificationTimingDarwinKey"));

  if (v3) {
    -[TPSDaemon registerForNotificationTimingDarwinNotification]( self,  "registerForNotificationTimingDarwinNotification");
  }
  else {
    -[TPSDaemon showNewTipNotification](self, "showNewTipNotification");
  }
}

- (void)updateNotificationStatus
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon notificationController](self, "notificationController"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 notificationCache]);

  if (v4)
  {
    if (+[TPSNotificationController supportsRemoteIcon]( &OBJC_CLASS___TPSNotificationController,  "supportsRemoteIcon"))
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon notificationController](self, "notificationController"));
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472LL;
      _DWORD v6[2] = sub_1000053F8;
      v6[3] = &unk_10001CB30;
      id v7 = v4;
      int v8 = self;
      [v5 fetchNotificationAssetIfNeededCompletionHandler:v6];
    }

    else
    {
      -[TPSDaemon prepareForNotifications](self, "prepareForNotifications");
    }
  }
}

- (void)showNewTipNotification
{
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Show new tip notification.", (uint8_t *)buf, 2u);
  }

  if (-[TPSDaemon tipsAppInstalled](self, "tipsAppInstalled"))
  {
    objc_initWeak(buf, self);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon notificationController](self, "notificationController"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    _DWORD v6[2] = sub_100005630;
    v6[3] = &unk_10001CB58;
    objc_copyWeak(&v7, buf);
    [v4 showNotificationWithCompletionHandler:v6];

    objc_destroyWeak(&v7);
    objc_destroyWeak(buf);
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon notificationController](self, "notificationController"));
    [v5 clearNotificationCache];
  }

- (void)updateContentFromOrigin:(BOOL)a3 contextualEligibility:(BOOL)a4 widgetEligibility:(BOOL)a5 notificationEligibility:(BOOL)a6 preferredNotificationIdentifiers:(id)a7 shouldDeferBlock:(id)a8 completionHandler:(id)a9
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  BOOL v12 = a4;
  BOOL v13 = a3;
  id v15 = a7;
  id v16 = (unsigned int (**)(void))a8;
  id v17 = a9;
  if (!v16 || !v16[2](v16))
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon notificationController](self, "notificationController"));
    unsigned int v20 = [v19 isNotificationSettingValid] ^ 1;

    unsigned int v21 = -[TPSDaemon tipsAppInstalled](self, "tipsAppInstalled");
    unsigned int v22 = v21;
    if ((v20 & 1) != 0 || (v21 & 1) == 0)
    {
      if (v10)
      {
        id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          unsigned int v31 = v20;
          __int16 v32 = 1024;
          unsigned int v33 = v22;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Skip checking notification. Notification disabled %d Tips app installed %d",  buf,  0xEu);
        }
      }

      id v25 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon notificationController](self, "notificationController"));
      [v25 clearNotificationCache];
    }

    else
    {
      if (!v10)
      {
LABEL_16:
        dispatch_queue_attr_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon tipsManager](self, "tipsManager"));
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472LL;
        v28[2] = sub_100005B70;
        v28[3] = &unk_10001CB80;
        v28[4] = self;
        id v29 = v17;
        [v27 contentFromOrigin:v13 processTipKitContent:v12 contextualEligibility:v12 widgetEligibility:v11 notificationEligibility:v10 preferr edNotificationIdentifiers:v15 shouldDeferBlock:v16 completionHandler:v28];

        goto LABEL_17;
      }

      unsigned __int8 v23 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon welcome](self, "welcome"));
      unsigned int v24 = [v23 shouldShowWelcomeNotification];

      if (!v24)
      {
        BOOL v10 = 1LL;
        goto LABEL_16;
      }

      id v25 = (void *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
      if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v25,  OS_LOG_TYPE_DEFAULT,  "Skip checking notification. Welcome notification in progress",  buf,  2u);
      }
    }

    BOOL v10 = 0LL;
    goto LABEL_16;
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  TPSTipsManagerErrorDomain,  4LL,  0LL));
  (*((void (**)(id, void, void *))v17 + 2))(v17, 0LL, v18);

LABEL_17:
}

- (void)indexContentPackage:(id)a3
{
  id v3 = a3;
  v16[0] = 0LL;
  v16[1] = v16;
  v16[2] = 0x3032000000LL;
  v16[3] = sub_100005DC0;
  v16[4] = sub_100005DD0;
  id v17 = (id)objc_claimAutoreleasedReturnValue( +[TPSOSTransaction transactionWithName:]( &OBJC_CLASS___TPSOSTransaction,  "transactionWithName:",  @"com.apple.tips.index-content-package"));
  id v4 = objc_alloc(&OBJC_CLASS___TPSAsyncBlockOperation);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100005DD8;
  v14[3] = &unk_10001CBD0;
  id v5 = v3;
  id v15 = v5;
  id v6 = [v4 initWithAsyncBlock:v14];
  id v7 = objc_alloc(&OBJC_CLASS___TPSAsyncBlockOperation);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100005F84;
  v12[3] = &unk_10001CBD0;
  id v8 = v5;
  id v13 = v8;
  id v9 = [v7 initWithAsyncBlock:v12];
  BOOL v10 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
  -[NSOperationQueue setName:](v10, "setName:", @"com.apple.tips.index-content-package");
  -[NSOperationQueue setMaxConcurrentOperationCount:](v10, "setMaxConcurrentOperationCount:", 1LL);
  -[NSOperationQueue setSuspended:](v10, "setSuspended:", 1LL);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100006120;
  v11[3] = &unk_10001CBF8;
  v11[4] = v16;
  -[NSOperationQueue addBarrierBlock:](v10, "addBarrierBlock:", v11);
  -[NSOperationQueue setSuspended:](v10, "setSuspended:", 0LL);

  _Block_object_dispose(v16, 8);
}

- (void)cancelLegacyBackgroundTaskIfNeeded
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  if (([v3 BOOLForKey:@"TPSDidCancelLegacyBackgroundTask"] & 1) == 0)
  {
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v10 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Cancelling legacy discretionary background task",  v10,  2u);
    }

    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:]( &OBJC_CLASS___NSURLSessionConfiguration,  "backgroundSessionConfigurationWithIdentifier:",  @"com.apple.tipsd.checkNewTips"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCommonDefines clientBundleIdentifier](&OBJC_CLASS___TPSCommonDefines, "clientBundleIdentifier"));
    objc_msgSend(v5, "set_sourceApplicationBundleIdentifier:", v6);

    [v5 setHTTPCookieStorage:0];
    [v5 setDiscretionary:1];
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:delegate:delegateQueue:",  v5,  self,  v7));
    -[TPSDaemon setTipsFeedURLSession:](self, "setTipsFeedURLSession:", v8);

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon tipsFeedURLSession](self, "tipsFeedURLSession"));
    [v9 invalidateAndCancel];
  }
}

- (void)logDaemonActiveEventWithReason:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unsigned __int8 v5 = atomic_load(byte_100022190);
    if ((v5 & 1) != 0)
    {
      id v7 = v4;
      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[TPSAnalyticsEventDaemonActive eventWithReason:alreadyRunning:]( &OBJC_CLASS___TPSAnalyticsEventDaemonActive,  "eventWithReason:alreadyRunning:",  v4,  self->_alreadyRunning));
      [v6 log];

      id v4 = v7;
      self->_alreadyRunning = 1;
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6
{
  id v8 = a5;
  uint64_t v9 = TPSAnalyticsDaemonActiveReasonContentCheck;
  BOOL v10 = (void (**)(id, id))a6;
  -[TPSDaemon logDaemonActiveEventWithReason:](self, "logDaemonActiveEventWithReason:", v9);
  BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100010A94(v8, v11);
  }

  v10[2](v10, v8);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[TPSDaemon tipsFeedURLSession](self, "tipsFeedURLSession"));

  if (v6 == v5)
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Cleaned up legacy discretionary background task",  v9,  2u);
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v8 setBool:1 forKey:@"TPSDidCancelLegacyBackgroundTask"];
    [v8 synchronize];
    -[TPSDaemon setTipsFeedURLSession:](self, "setTipsFeedURLSession:", 0LL);
  }

- (void)resetAllDataIfNeeded
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v31 = (void *)objc_claimAutoreleasedReturnValue([v3 stringForKey:@"TPSLastMajorVersion"]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCommonDefines sharedInstance](&OBJC_CLASS___TPSCommonDefines, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 majorVersion]);

  unsigned int v6 = [v31 isEqualToString:v5];
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
  int v8 = v6 ^ 1;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v6 ^ 1;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Should reset due to version change: %d",  buf,  8u);
  }

  uint64_t v9 = (void *)MGCopyAnswer(@"ProductVersion", 0LL);
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v9 componentsSeparatedByString:@"."]);
  if ((unint64_t)[v10 count] < 2)
  {
    id v12 = 0LL;
  }

  else
  {
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:1]);
    id v12 = [v11 integerValue];
  }

  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_100010C34();
  }

  if ((unint64_t)[v10 count] < 2 || v12)
  {
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      sub_100010C08();
    }

    [v3 removeObjectForKey:@"TPSNeedsResetOnMajorGM"];
  }

  else
  {
    uint64_t v14 = (uint64_t)[v3 BOOLForKey:@"TPSNeedsResetOnMajorGM"];
    unsigned int v15 = +[TPSUserTypesValidation isBetaBuild](&OBJC_CLASS___TPSUserTypesValidation, "isBetaBuild");
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
    if (v15)
    {
      if (v17) {
        sub_100010B48(v14, v16, v18, v19, v20, v21, v22, v23);
      }

      if ((v14 & 1) == 0)
      {
        *(void *)buf = 0LL;
        int v34 = buf;
        uint64_t v35 = 0x2020000000LL;
        char v36 = 1;
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472LL;
        v32[2] = sub_10000696C;
        v32[3] = &unk_10001CC20;
        v32[4] = buf;
        [v10 enumerateObjectsUsingBlock:v32];
        if (v34[24])
        {
          unsigned int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
            sub_100010B1C();
          }

          [v3 setBool:1 forKey:@"TPSNeedsResetOnMajorGM"];
        }

        _Block_object_dispose(buf, 8);
      }
    }

    else
    {
      if (v17) {
        sub_100010BDC();
      }

      if ((_DWORD)v14)
      {
        BOOL v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
          sub_100010BB0();
        }

        [v3 removeObjectForKey:@"TPSNeedsResetOnMajorGM"];
        int v8 = 1;
      }
    }
  }

  [v3 synchronize];
  id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v8;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Should reset %d", buf, 8u);
  }

  if (v8)
  {
    [v3 setObject:v5 forKey:@"TPSLastMajorVersion"];
    [v3 synchronize];
    dispatch_queue_attr_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon notificationTimingDarwinKey](self, "notificationTimingDarwinKey"));
    -[TPSDaemon unregisterDarwinNotification:](self, "unregisterDarwinNotification:", v27);

    -[TPSDaemon resetBasicDefaults](self, "resetBasicDefaults");
    +[TPSWelcome resetWelcomeNotifications](&OBJC_CLASS___TPSWelcome, "resetWelcomeNotifications");
    +[TPSDataMigrator performMigrationIfNeeded](&OBJC_CLASS___TPSDataMigrator, "performMigrationIfNeeded");
    +[TPSTipsManager removeExperimentCache](&OBJC_CLASS___TPSTipsManager, "removeExperimentCache");
    +[TPSTipsManager removeWelcomeDocumentCache](&OBJC_CLASS___TPSTipsManager, "removeWelcomeDocumentCache");
    +[TPSTipsManager removeWidgetUpdateDate](&OBJC_CLASS___TPSTipsManager, "removeWidgetUpdateDate");
    +[TPSNotificationController removeNotificationCache]( &OBJC_CLASS___TPSNotificationController,  "removeNotificationCache");
    +[TPSNotificationController removeAssetCacheDirectory]( &OBJC_CLASS___TPSNotificationController,  "removeAssetCacheDirectory");
    +[TPSDiscoverabilityController removeContextualInfoCache]( &OBJC_CLASS___TPSDiscoverabilityController,  "removeContextualInfoCache");
    BOOL v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v29 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCommonDefines sharedInstance](&OBJC_CLASS___TPSCommonDefines, "sharedInstance"));
    [v29 setLastMajorVersionUpdateDate:v28];
  }

  +[TPSDataMigrator revertTipStatusArchivalIfNeeded](&OBJC_CLASS___TPSDataMigrator, "revertTipStatusArchivalIfNeeded");
}

- (void)resetBasicDefaults
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v4 removeObjectForKey:TPSWidgetShownDocuments];
  [v4 removeObjectForKey:@"TPSWidgetShownTips"];
  [v4 removeObjectForKey:@"TPSFeedLastModified"];
  [v4 removeObjectForKey:@"onPause"];
  [v4 removeObjectForKey:@"TPSPastCollectionIdentifiers"];
  [v4 removeObjectForKey:@"TPSPendingCollectionActivationForIdentifier"];
  [v4 removeObjectForKey:@"TPSWaitingToShowNewTipNotification"];
  [v4 removeObjectForKey:@"TPSPreferredLanguageForCurrentRequest"];
  [v4 removeObjectForKey:@"TPSNotificationsIgnoreCount"];
  [v4 removeObjectForKey:@"TPSFeedDoNotNotify"];
  [v4 removeObjectForKey:@"TPSPendingNotificationTip"];
  [v4 removeObjectForKey:@"TPSPendingCollectionActivationNotificationTips"];
  [v4 removeObjectForKey:@"TPSInvalidTargetedTipIDs"];
  [v4 removeObjectForKey:@"TPSNotificationQuietPeriodEndTime"];
  [v4 removeObjectForKey:@"TPSPendingNotifiedTipIDs"];
  [v4 removeObjectForKey:@"kTipsdNotifiedTipsIDs"];
  [v4 removeObjectForKey:@"TPSDLastPublishedNotificationID"];
  [v4 removeObjectForKey:@"TPSDLastPublisherBulletinID"];
  [v4 removeObjectForKey:@"TipsdUserLaunchesAppAfterNotifications"];
  [v4 removeObjectForKey:@"TPSViewedTipIdentifiers"];
  [v4 removeObjectForKey:@"TPSPendingNotificationTipText"];
  [v4 removeObjectForKey:@"TPSPendingNotificationTipID"];
  [v4 removeObjectForKey:@"TipsdFeedLastNotifiedTipId"];
  [v4 removeObjectForKey:@"TipsdRegisteredForNotificationKey"];
  [v4 removeObjectForKey:@"TipsdWaitingToShowNotification"];
  [v4 removeObjectForKey:@"TipsdWelcomeNotificationNaggingState"];
  [v4 removeObjectForKey:@"validPairedDevices"];
  [v4 removeObjectForKey:@"TPSOfflineLastProcessedRemoteContentIdentifier"];
  [v4 removeObjectForKey:@"TPSOfflineLastProcessedLocalContentIdentifier"];
  [v4 removeObjectForKey:@"TPSOfflineContentMap"];
  [v4 synchronize];
  if (-[TPSDaemon setupCompleted](self, "setupCompleted")) {
    id v3 = +[TPSCommonDefines sharedInstance](&OBJC_CLASS___TPSCommonDefines, "sharedInstance");
  }
}

- (BOOL)_assistantXPCConnectionContainsConnection:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  assistantConnectionQueue = (dispatch_queue_s *)self->_assistantConnectionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100006CC8;
  block[3] = &unk_10001CC48;
  id v9 = v4;
  BOOL v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(assistantConnectionQueue, block);
  LOBYTE(assistantConnectionQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)assistantConnectionQueue;
}

- (void)_addAssistantXPCConnection:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  assistantConnectionQueue = (dispatch_queue_s *)self->_assistantConnectionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100006DCC;
  block[3] = &unk_10001CC70;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(assistantConnectionQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_removeAssistantXPCConnection:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  assistantConnectionQueue = (dispatch_queue_s *)self->_assistantConnectionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100006ED0;
  block[3] = &unk_10001CC70;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(assistantConnectionQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (BOOL)_discoverabilityXPCConnectionContainsConnection:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  assistantConnectionQueue = (dispatch_queue_s *)self->_assistantConnectionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000700C;
  block[3] = &unk_10001CC48;
  id v9 = v4;
  BOOL v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(assistantConnectionQueue, block);
  LOBYTE(assistantConnectionQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)assistantConnectionQueue;
}

- (void)_addDiscoverabilityXPCConnection:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  discoverabilityConnectionQueue = (dispatch_queue_s *)self->_discoverabilityConnectionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100007110;
  block[3] = &unk_10001CC70;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(discoverabilityConnectionQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_removeDiscoverabilityXPCConnection:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  discoverabilityConnectionQueue = (dispatch_queue_s *)self->_discoverabilityConnectionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100007214;
  block[3] = &unk_10001CC70;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(discoverabilityConnectionQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (BOOL)_appXPCConnectionContainsConnection:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0LL;
  v20[0] = &v19;
  v20[1] = 0x2020000000LL;
  char v21 = 0;
  appConnectionQueue = (dispatch_queue_s *)self->_appConnectionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000073A8;
  block[3] = &unk_10001CC48;
  uint64_t v18 = &v19;
  void block[4] = self;
  id v6 = v4;
  id v17 = v6;
  dispatch_sync(appConnectionQueue, block);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger default](&OBJC_CLASS___TPSLogger, "default"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100010CB0((uint64_t)v20, v7, v8, v9, v10, v11, v12, v13);
  }

  char v14 = *(_BYTE *)(v20[0] + 24LL);
  _Block_object_dispose(&v19, 8);

  return v14;
}

- (void)_addAppXPCConnection:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  appConnectionQueue = (dispatch_queue_s *)self->_appConnectionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000074AC;
  block[3] = &unk_10001CC70;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(appConnectionQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_removeAppXPCConnection:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  appConnectionQueue = (dispatch_queue_s *)self->_appConnectionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000075E4;
  block[3] = &unk_10001CC70;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(appConnectionQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  unsigned __int8 v9 = atomic_load(byte_100022190);
  if ((v9 & 1) != 0)
  {
    int v37 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForEntitlement:@"com.apple.tipsd.access"]);
    char v36 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForEntitlement:@"com.apple.tipsd.tips-app-access"]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForEntitlement:@"com.apple.private.tipsd.discoverability"]);
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v37, v12) & 1) != 0) {
      unsigned int v13 = [v37 BOOLValue];
    }
    else {
      unsigned int v13 = 0;
    }
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v36, v14) & 1) != 0) {
      unsigned int v15 = [v36 BOOLValue];
    }
    else {
      unsigned int v15 = 0;
    }
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v11, v16) & 1) != 0) {
      unsigned int v17 = [v11 BOOLValue];
    }
    else {
      unsigned int v17 = 0;
    }
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v8 serviceName]);
    unsigned int v19 = [v18 isEqualToString:@"com.apple.tipsd.assistant"];

    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413314;
      v50 = v8;
      __int16 v51 = 1024;
      unsigned int v52 = v13;
      __int16 v53 = 1024;
      unsigned int v54 = v15;
      __int16 v55 = 1024;
      unsigned int v56 = v17;
      __int16 v57 = 1024;
      unsigned int v58 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "New connection coming in: %@, standardAccess %d, appAccess %d, discoverability access %d, device expert access %d",  buf,  0x24u);
    }

    if (v19)
    {
      char v21 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForEntitlement:@"com.apple.private.tipsd.assistant"]);
      uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0 && [v21 BOOLValue])
      {
        if (-[TPSDaemon _assistantXPCConnectionContainsConnection:]( self,  "_assistantXPCConnectionContainsConnection:",  v8))
        {
          id v23 = 0LL;
        }

        else
        {
          unsigned int v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface assistantSupportInterface]( &OBJC_CLASS___NSXPCInterface,  "assistantSupportInterface"));
          [v8 setExportedInterface:v31];

          [v8 setExportedObject:self];
          id v23 = TPSAnalyticsDaemonActiveReasonAssistantConnection;
          -[TPSDaemon _addAssistantXPCConnection:](self, "_addAssistantXPCConnection:", v8);
          objc_initWeak(&location, self);
          objc_initWeak(&from, v8);
          v44[0] = _NSConcreteStackBlock;
          v44[1] = 3221225472LL;
          v44[2] = sub_100007EC8;
          v44[3] = &unk_10001CC98;
          objc_copyWeak(&v45, &location);
          objc_copyWeak(&v46, &from);
          [v8 setInvalidationHandler:v44];
          __int16 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v50 = v8;
            _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Device Expert connection established. %@",  buf,  0xCu);
          }

          objc_destroyWeak(&v46);
          objc_destroyWeak(&v45);
          objc_destroyWeak(&from);
          objc_destroyWeak(&location);
        }

        goto LABEL_43;
      }

LABEL_32:
      [v8 setInterruptionHandler:&stru_10001CCF8];
      BOOL v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v8;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Connection denied %@.", buf, 0xCu);
      }

      BOOL v10 = 0;
      id v23 = 0LL;
      goto LABEL_46;
    }

    if ((v13 | v15) == 1)
    {
      if (!-[TPSDaemon tipsAppInstalled](self, "tipsAppInstalled")) {
        goto LABEL_32;
      }
      uint64_t v24 = TPSXPCServerInterface();
      id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      [v8 setExportedInterface:v25];

      [v8 setExportedObject:self];
      if (v15)
      {
        if (!-[TPSDaemon _appXPCConnectionContainsConnection:](self, "_appXPCConnectionContainsConnection:", v8))
        {
          id v23 = TPSAnalyticsDaemonActiveReasonTipsAppConnection;
          -[TPSDaemon _addAppXPCConnection:](self, "_addAppXPCConnection:", v8);
          objc_initWeak(&location, self);
          objc_initWeak(&from, v8);
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472LL;
          v41[2] = sub_100007F64;
          v41[3] = &unk_10001CC98;
          objc_copyWeak(&v42, &location);
          objc_copyWeak(&v43, &from);
          [v8 setInvalidationHandler:v41];
          id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v50 = v8;
            _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "App connection established. %@",  buf,  0xCu);
          }

          objc_destroyWeak(&v43);
          objc_destroyWeak(&v42);
          objc_destroyWeak(&from);
          objc_destroyWeak(&location);
          goto LABEL_43;
        }
      }

      else
      {
        [v8 setInvalidationHandler:&stru_10001CCD8];
        unsigned int v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
          sub_100010D48();
        }
      }
    }

    else
    {
      if (!v17) {
        goto LABEL_32;
      }
      if (!-[TPSDaemon _discoverabilityXPCConnectionContainsConnection:]( self,  "_discoverabilityXPCConnectionContainsConnection:",  v8))
      {
        uint64_t v27 = TPSMiniTipContentManagerServiceInterfaceServerInterface();
        BOOL v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
        [v8 setExportedInterface:v28];

        [v8 setExportedObject:self];
        id v23 = TPSAnalyticsDaemonActiveReasonTipKitConnection;
        -[TPSDaemon _addDiscoverabilityXPCConnection:](self, "_addDiscoverabilityXPCConnection:", v8);
        objc_initWeak(&location, self);
        objc_initWeak(&from, v8);
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472LL;
        v38[2] = sub_10000806C;
        v38[3] = &unk_10001CC98;
        objc_copyWeak(&v39, &location);
        objc_copyWeak(&v40, &from);
        [v8 setInvalidationHandler:v38];
        id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v50 = v8;
          _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Discoverability connection established. %@",  buf,  0xCu);
        }

        objc_destroyWeak(&v40);
        objc_destroyWeak(&v39);
        objc_destroyWeak(&from);
        objc_destroyWeak(&location);
        goto LABEL_43;
      }
    }

    id v23 = 0LL;
LABEL_43:
    [v8 setInterruptionHandler:&stru_10001CCF8];
    int v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "xpc connection resume", buf, 2u);
    }

    [v8 resume];
    BOOL v10 = 1;
LABEL_46:
    -[TPSDaemon logDaemonActiveEventWithReason:](self, "logDaemonActiveEventWithReason:", v23);

    goto LABEL_47;
  }

  BOOL v10 = 0;
LABEL_47:

  return v10;
}

- (void)appRemovalCleanupIfNeeded
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  BOOL v4 = -[TPSDaemon tipsAppInstalled](self, "tipsAppInstalled");
  if (v4)
  {
LABEL_6:
    [v3 setBool:v4 forKey:@"TPSTipsAppInstalled"];
    [v3 synchronize];
    goto LABEL_7;
  }

  if ([v3 BOOLForKey:@"TPSTipsAppInstalled"])
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "app removal clean up", v8, 2u);
    }

    -[TPSDaemon unregisterImmediateNotifications](self, "unregisterImmediateNotifications");
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAnalyticsEventAppDeleted event](&OBJC_CLASS___TPSAnalyticsEventAppDeleted, "event"));
    [v6 log];

    -[TPSDaemon resetBasicDefaults](self, "resetBasicDefaults");
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon notificationController](self, "notificationController"));
    [v7 removeAllNotifications];

    goto LABEL_6;
  }

- (void)tipsAppActive
{
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100010D74();
  }

  -[TPSDaemon reloadAppGroupDefaults](self, "reloadAppGroupDefaults");
  -[TPSDaemon processAppInteractedByUser](self, "processAppInteractedByUser");
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon notificationController](self, "notificationController"));
  [v4 clearNotificationCache];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon notificationController](self, "notificationController"));
  [v5 clearNotificationCount];
}

- (void)contentViewedForIdentifier:(id)a3
{
}

- (void)removeNotificationForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TPSDaemon notificationController](self, "notificationController"));
  [v5 removeNotificationWithIdentifier:v4];
}

- (void)hintDisplayedForIdentifier:(id)a3 correlationID:(id)a4 context:(id)a5
{
  discoverabilityController = self->_discoverabilityController;
  id v8 = a4;
  id v12 = a3;
  -[TPSDiscoverabilityController addHintDisplayedForIdentifier:context:]( discoverabilityController,  "addHintDisplayedForIdentifier:context:",  v12,  a5);
  if (v8) {
    unsigned __int8 v9 = v8;
  }
  else {
    unsigned __int8 v9 = v12;
  }
  id v10 = v9;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCloudController sharedInstance](&OBJC_CLASS___TPSCloudController, "sharedInstance"));
  [v11 hintDisplayedForContentID:v10];
}

- (void)hintDismissedForIdentifier:(id)a3 bundleID:(id)a4 context:(id)a5 reason:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  else {
    unsigned int v13 = (id *)*(&off_10001CE68 + a6 - 6);
  }
  id v14 = *v13;
  -[TPSDiscoverabilityController updateHintDismissedForIdentifier:dismissType:context:]( self->_discoverabilityController,  "updateHintDismissedForIdentifier:dismissType:context:",  v10,  v14,  v12);
  if ((-[TPSTipStatusController isHintInelgibileForIdentifier:]( self->_tipStatusController,  "isHintInelgibileForIdentifier:",  v10) & 1) != 0)
  {
    unsigned int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger discoverability](&OBJC_CLASS___TPSLogger, "discoverability"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      id v22 = v10;
      uint64_t v16 = "Hint already marked as ineligible for %@";
      unsigned int v17 = v15;
      uint32_t v18 = 12;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v21, v18);
    }
  }

  else
  {
    discoverabilityController = self->_discoverabilityController;
    id v25 = v10;
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
    -[TPSDiscoverabilityController markHintIneligibleForIdentifiers:bundleID:context:reason:]( discoverabilityController,  "markHintIneligibleForIdentifiers:bundleID:context:reason:",  v20,  v11,  v12,  a6);

    unsigned int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger discoverability](&OBJC_CLASS___TPSLogger, "discoverability"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412546;
      id v22 = v10;
      __int16 v23 = 2112;
      id v24 = v14;
      uint64_t v16 = "Hint %@ marked ineligible with dismissType %@";
      unsigned int v17 = v15;
      uint32_t v18 = 22;
      goto LABEL_9;
    }
  }
}

- (void)restartTrackingForContentIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger discoverability](&OBJC_CLASS___TPSLogger, "discoverability"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "restartTrackingForContentIdentifiers %@",  (uint8_t *)&v7,  0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon discoverabilityController](self, "discoverabilityController"));
  [v6 restartTriggerTrackingIfNotDisplayedForIdentifiers:v4];
}

- (void)processAppInteractedByUser
{
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "User launched the app", v9, 2u);
  }

  if (-[TPSWelcome stopWelcomeNotification](self->_welcome, "stopWelcomeNotification"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon notificationController](self, "notificationController"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 notificationCache]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 collectionIdentifier]);

    int v7 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCommonDefines sharedInstance](&OBJC_CLASS___TPSCommonDefines, "sharedInstance"));
    [v7 notifiedCollection:v6];
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon notificationTimingDarwinKey](self, "notificationTimingDarwinKey"));
  -[TPSDaemon unregisterDarwinNotification:](self, "unregisterDarwinNotification:", v8);
}

- (void)logAnalyticsEvent:(id)a3
{
  uint64_t v4 = TPSAnalyticsDaemonActiveReasonRealTimeAnalytics;
  id v5 = a3;
  -[TPSDaemon logDaemonActiveEventWithReason:](self, "logDaemonActiveEventWithReason:", v4);
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[TPSAnalyticsEventController sharedInstance](&OBJC_CLASS___TPSAnalyticsEventController, "sharedInstance"));
  [v6 logAnalyticsEvent:v5];
}

- (void)logAnalyticsEvents:(id)a3
{
  uint64_t v4 = TPSAnalyticsDaemonActiveReasonRealTimeAnalytics;
  id v5 = a3;
  -[TPSDaemon logDaemonActiveEventWithReason:](self, "logDaemonActiveEventWithReason:", v4);
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[TPSAnalyticsEventController sharedInstance](&OBJC_CLASS___TPSAnalyticsEventController, "sharedInstance"));
  [v6 logAnalyticsEvents:v5];
}

- (void)handleLanguageDidChangeNotification
{
  if (-[TPSDaemon setupCompleted](self, "setupCompleted"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCommonDefines sharedInstance](&OBJC_CLASS___TPSCommonDefines, "sharedInstance"));
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale tps_userLanguageCode](&OBJC_CLASS___NSLocale, "tps_userLanguageCode"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 userLanguage]);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v12 = v4;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Received language did change notification. New language: %@, current language: %@",  buf,  0x16u);
    }

    if ([v4 isEqualToString:v5])
    {
      int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Current user language has not change, skip.",  buf,  2u);
      }
    }

    else
    {
      [v3 clearDataCache];
      [v3 setUserLanguage:v4];
      +[TPSTipsManager removeWelcomeDocumentCache](&OBJC_CLASS___TPSTipsManager, "removeWelcomeDocumentCache");
      unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon notificationController](self, "notificationController"));
      [v9 clearNotificationCache];

      +[TPSNotificationController removeAssetCacheDirectory]( &OBJC_CLASS___TPSNotificationController,  "removeAssetCacheDirectory");
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon notificationTimingDarwinKey](self, "notificationTimingDarwinKey"));
      -[TPSDaemon unregisterDarwinNotification:](self, "unregisterDarwinNotification:", v10);

      -[TPSDaemon updateContentFromOrigin:contextualEligibility:widgetEligibility:notificationEligibility:preferredNotificationIdentifiers:shouldDeferBlock:completionHandler:]( self,  "updateContentFromOrigin:contextualEligibility:widgetEligibility:notificationEligibility:preferredNotificationIde ntifiers:shouldDeferBlock:completionHandler:",  1LL,  1LL,  1LL,  0LL,  0LL,  0LL,  &stru_10001CD38);
    }
  }

  else
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "User is still in set up, exit.", buf, 2u);
    }

    xpc_transaction_exit_clean();
  }

- (void)handleDeviceFirstUnlockNotification
{
  if (-[TPSDaemon setupCompleted](self, "setupCompleted"))
  {
    -[TPSDaemon updateContentFromOrigin:contextualEligibility:widgetEligibility:notificationEligibility:preferredNotificationIdentifiers:shouldDeferBlock:completionHandler:]( self,  "updateContentFromOrigin:contextualEligibility:widgetEligibility:notificationEligibility:preferredNotificationIdent ifiers:shouldDeferBlock:completionHandler:",  1LL,  1LL,  0LL,  0LL,  0LL,  0LL,  &stru_10001CD58);
  }

  else
  {
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "User is still in set up, exit.", buf, 2u);
    }

    xpc_transaction_exit_clean(v4, v5);
  }

- (void)immediateNotificationForIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 description]);
    *(_DWORD *)buf = 138412290;
    int v21 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Request immediate notification for %@",  buf,  0xCu);
  }

  if ([v4 count])
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon notificationController](self, "notificationController"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 notificationCache]);
    unsigned __int8 v9 = (char *)[v8 type];

    if (-[TPSDaemon tipsAppInstalled](self, "tipsAppInstalled") && (unint64_t)(v9 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      objc_initWeak((id *)buf, self);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_100009038;
      v17[3] = &unk_10001CD80;
      objc_copyWeak(&v19, (id *)buf);
      id v18 = v4;
      -[TPSDaemon updateContentFromOrigin:contextualEligibility:widgetEligibility:notificationEligibility:preferredNotificationIdentifiers:shouldDeferBlock:completionHandler:]( self,  "updateContentFromOrigin:contextualEligibility:widgetEligibility:notificationEligibility:preferredNotificationIde ntifiers:shouldDeferBlock:completionHandler:",  0LL,  0LL,  0LL,  1LL,  v18,  0LL,  v17);

      objc_destroyWeak(&v19);
      objc_destroyWeak((id *)buf);
    }

    else
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon notificationController](self, "notificationController"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 notificationCache]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 collectionIdentifier]);
      unsigned __int8 v13 = [v4 containsObject:v12];

      if ((v13 & 1) == 0)
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCommonDefines sharedInstance](&OBJC_CLASS___TPSCommonDefines, "sharedInstance"));
        unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v4));
        [v14 activatedCollections:v15];

        uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Skipping immediate collection notification",  buf,  2u);
        }
      }
    }
  }
}

- (void)userGuideMapWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Retrieve user guide map.", (uint8_t *)buf, 2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon tipsManager](self, "tipsManager"));
  int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 lastFetchedLanguage]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale tps_userLanguageCode](&OBJC_CLASS___NSLocale, "tps_userLanguageCode"));
  unsigned int v9 = [v7 isEqualToString:v8];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon tipsManager](self, "tipsManager"));
  id v11 = v10;
  if (!v9)
  {
    [v10 clearCachedUserGuides];
LABEL_9:

    objc_initWeak(buf, self);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000094A8;
    v13[3] = &unk_10001CDA8;
    objc_copyWeak(&v15, buf);
    id v14 = v4;
    -[TPSDaemon updateContentFromOrigin:contextualEligibility:widgetEligibility:notificationEligibility:preferredNotificationIdentifiers:shouldDeferBlock:completionHandler:]( self,  "updateContentFromOrigin:contextualEligibility:widgetEligibility:notificationEligibility:preferredNotificationIdent ifiers:shouldDeferBlock:completionHandler:",  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v13);

    objc_destroyWeak(&v15);
    objc_destroyWeak(buf);
    goto LABEL_10;
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 cachedUserGuideMap]);

  if (!v12 || ![v12 count])
  {
    id v11 = v12;
    goto LABEL_9;
  }

  (*((void (**)(id, void *, void))v4 + 2))(v4, v12, 0LL);

LABEL_10:
}

- (void)contentWithCompletionHandler:(id)a3
{
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon tipsManager](self, "tipsManager"));
  uint64_t v5 = [v4 hasWidgetDocument] ^ 1;

  -[TPSDaemon updateContentFromOrigin:contextualEligibility:widgetEligibility:notificationEligibility:preferredNotificationIdentifiers:shouldDeferBlock:completionHandler:]( self,  "updateContentFromOrigin:contextualEligibility:widgetEligibility:notificationEligibility:preferredNotificationIdentif iers:shouldDeferBlock:completionHandler:",  0LL,  0LL,  v5,  0LL,  0LL,  0LL,  v6);
}

- (void)contentForVariant:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon tipsManager](self, "tipsManager"));
  id v15 = v6;
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100009754;
  v12[3] = &unk_10001CDD0;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [v8 contentForVariantIdentifiers:v9 completionHandler:v12];
}

- (void)fetchAssetsWithAssetsConfiguration:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100010EB8();
  }

  id v8 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
  -[NSOperationQueue setSuspended:](v8, "setSuspended:", 1LL);
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v5 cacheIdentifierForType:0]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[TPSContentURLController assetPathFromAssetConfiguration:type:]( &OBJC_CLASS___TPSContentURLController,  "assetPathFromAssetConfiguration:type:",  v5,  0LL));
  if ([v9 length] && objc_msgSend(v10, "length")) {
    id v11 = [[TPSAssetsDownloadOperation alloc] initWithAssetIdentifier:v9 assetURLPath:v10];
  }
  else {
    id v11 = 0LL;
  }
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 cacheIdentifierForType:1]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[TPSContentURLController assetPathFromAssetConfiguration:type:]( &OBJC_CLASS___TPSContentURLController,  "assetPathFromAssetConfiguration:type:",  v5,  1LL));
  if ([v12 length] && objc_msgSend(v13, "length")) {
    id v14 = [[TPSAssetsDownloadOperation alloc] initWithAssetIdentifier:v12 assetURLPath:v13];
  }
  else {
    id v14 = 0LL;
  }
  uint64_t v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472LL;
  id v22 = sub_100009B18;
  __int16 v23 = &unk_10001CDF8;
  id v15 = v11;
  id v24 = v15;
  id v16 = v14;
  id v25 = v16;
  id v26 = v5;
  id v27 = v6;
  id v17 = v6;
  id v18 = v5;
  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  &v20));
  if (v15)
  {
    -[NSOperationQueue addOperation:](v8, "addOperation:", v15, v20, v21, v22, v23, v24, v25, v26, v27);
    [v19 addDependency:v15];
  }

  if (v16)
  {
    -[NSOperationQueue addOperation:](v8, "addOperation:", v16);
    [v19 addDependency:v16];
  }

  -[NSOperationQueue addOperation:](v8, "addOperation:", v19, v20, v21, v22, v23);
  -[NSOperationQueue setSuspended:](v8, "setSuspended:", 0LL);
}

- (BOOL)isContentIneligibleDueToViewOnOtherDevices:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipStatusController statusForIdentifier:](self->_tipStatusController, "statusForIdentifier:", a3));
  else {
    unsigned __int8 v4 = [v3 isHintDisplayedOnCloudDevices];
  }

  return v4;
}

- (int64_t)statusCheckForHintIneligibleReasonWithContentID:(id)a3
{
  id v4 = a3;
  int64_t v5 = (int64_t)-[TPSTipStatusController hintInelgibileReasonForIdentifier:]( self->_tipStatusController,  "hintInelgibileReasonForIdentifier:",  v4);
  if ((v5 & 0xFFFFFFFFFFFFFFF7LL) == 0)
  {
    unsigned __int8 v6 = -[TPSTipStatusController isPreconditionMatchedForIdentifier:]( self->_tipStatusController,  "isPreconditionMatchedForIdentifier:",  v4);
    discoverabilityController = self->_discoverabilityController;
    if ((v6 & 1) != 0)
    {
      if ((-[TPSDiscoverabilityController isContextualInfoExistForIdentifier:]( discoverabilityController,  "isContextualInfoExistForIdentifier:",  v4) & 1) == 0) {
        goto LABEL_10;
      }
      if (-[TPSDaemon isContentIneligibleDueToViewOnOtherDevices:]( self,  "isContentIneligibleDueToViewOnOtherDevices:",  v4))
      {
        if (!+[TPSDefaultsManager ignoreCloud](&OBJC_CLASS___TPSDefaultsManager, "ignoreCloud"))
        {
          int64_t v5 = 5LL;
          goto LABEL_12;
        }

        id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int v10 = 138412290;
          id v11 = v4;
          _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Overriding ineligibility due to content %@ already seen on other devices",  (uint8_t *)&v10,  0xCu);
        }
      }

      if (-[TPSTipsManager contextualTipsInactive](self->_tipsManager, "contextualTipsInactive"))
      {
LABEL_10:
        -[TPSDiscoverabilityController restartTriggerTrackingIfNotDisplayedForIdentifier:]( self->_discoverabilityController,  "restartTriggerTrackingIfNotDisplayedForIdentifier:",  v4);
        int64_t v5 = 4LL;
      }
    }

    else
    {
      -[TPSDiscoverabilityController restartTriggerTrackingIfNotDisplayedForIdentifier:]( discoverabilityController,  "restartTriggerTrackingIfNotDisplayedForIdentifier:",  v4);
      int64_t v5 = 15LL;
    }
  }

- (int64_t)displayStatusCheckForHintIneligibleReasonWithContent:(id)a3 context:(id)a4 bypassExperiment:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale tps_userLanguageCode](&OBJC_CLASS___NSLocale, "tps_userLanguageCode"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 userLanguageCode]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Checking language changes for %@", buf, 0xCu);
  }

  if (v10 && ([v10 isEqualToString:v11] & 1) != 0)
  {
    if (-[TPSDiscoverabilityController isContentHintDisplayMaxDisplayedCountExceededForIdentifier:]( self->_discoverabilityController,  "isContentHintDisplayMaxDisplayedCountExceededForIdentifier:",  v12))
    {
      -[TPSDiscoverabilityController updateHintDismissedForIdentifier:dismissType:context:]( self->_discoverabilityController,  "updateHintDismissedForIdentifier:dismissType:context:",  v12,  TPSAnalyticsDismissTypeHintMaxDisplayedCountExceeded,  v9);
      int64_t v14 = 20LL;
    }

    else
    {
      BOOL v23 = v5;
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v12;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Checking preconditions for %@", buf, 0xCu);
      }

      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon tipsManager](self, "tipsManager"));
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v8 preconditions]);
      unsigned int v19 = [v17 isPreconditionValidForIdentifier:v12 preconditionDictionary:v18];

      if (v19) {
        int64_t v14 = 0LL;
      }
      else {
        int64_t v14 = 15LL;
      }
      if (!v23 && v19)
      {
        uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v25 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Checking experiment camp for %@",  buf,  0xCu);
        }

        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon tipsManager](self, "tipsManager"));
        unsigned int v22 = [v21 isContentIdentifierHoldoutCamp:v12];

        if (v22)
        {
          -[TPSDiscoverabilityController updateHintWouldHaveBeenDisplayedForIdentifier:context:]( self->_discoverabilityController,  "updateHintWouldHaveBeenDisplayedForIdentifier:context:",  v12,  v9);
          int64_t v14 = 22LL;
        }

        else
        {
          int64_t v14 = 0LL;
        }
      }
    }
  }

  else
  {
    -[TPSDiscoverabilityController restartTriggerTrackingIfNotDisplayedForIdentifier:]( self->_discoverabilityController,  "restartTriggerTrackingIfNotDisplayedForIdentifier:",  v12);
    int64_t v14 = 11LL;
  }

  return v14;
}

- (void)donateHintIneligibleReason:(int64_t)a3 contentID:(id)a4 bundleID:(id)a5 context:(id)a6
{
  discoverabilityController = self->_discoverabilityController;
  id v20 = a4;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  int64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
  -[TPSDiscoverabilityController markHintIneligibleForIdentifiers:bundleID:context:reason:]( discoverabilityController,  "markHintIneligibleForIdentifiers:bundleID:context:reason:",  v14,  v12,  v11,  a3,  v20);

  id v15 = objc_alloc(&OBJC_CLASS___TPSAnalyticsEventTipNotDisplayed);
  id v16 = (void *)objc_claimAutoreleasedReturnValue( -[TPSDiscoverabilityController tipStatusController]( self->_discoverabilityController,  "tipStatusController"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 correlationIdentifierForIdentifier:v13]);
  id v18 = [v15 initWithTipID:v13 correlationID:v17 bundleID:v12 reason:a3 context:v11 date:0];

  unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue( +[TPSAnalyticsEventController sharedInstance]( &OBJC_CLASS___TPSAnalyticsEventController,  "sharedInstance"));
  [v19 logAnalyticsEvent:v18];
}

- (void)personalizationFailedForContentID:(id)a3 bundleID:(id)a4 context:(id)a5
{
  discoverabilityController = self->_discoverabilityController;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  -[TPSDiscoverabilityController restartTriggerTrackingIfNotDisplayedForIdentifier:]( discoverabilityController,  "restartTriggerTrackingIfNotDisplayedForIdentifier:",  v11);
  -[TPSDaemon donateHintIneligibleReason:contentID:bundleID:context:]( self,  "donateHintIneligibleReason:contentID:bundleID:context:",  21LL,  v11,  v10,  v9);
}

- (void)validateAndPrepareContentForDisplay:(id)a3 bundleID:(id)a4 context:(id)a5 skipUsageCheck:(BOOL)a6 completionHandler:(id)a7
{
  id v7 = a7;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "validateAndPrepareContentForDisplay", v9, 2u);
  }

  (*((void (**)(id, void, void, void))v7 + 2))(v7, 0LL, 0LL, 0LL);
}

- (id)miniTipMetadataForContent:(id)a3 bundleID:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v42 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 miniContent]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 bodyText]);
  if (v12)
  {

    goto LABEL_4;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 bodyContent]);

  if (v13)
  {
LABEL_4:
    int64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale tps_userLanguageCode](&OBJC_CLASS___NSLocale, "tps_userLanguageCode", v42));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 language]);
    if ([v15 length])
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v8 language]);
      unsigned int v17 = [v16 isEqualToString:v14];

      if (v17)
      {
        id v18 = 0LL;
        uint64_t v19 = TPSTipsManagerErrorDomain;
LABEL_11:

        goto LABEL_12;
      }
    }

    else
    {
    }

    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger discoverability](&OBJC_CLASS___TPSLogger, "discoverability"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v8 language]);
      *(_DWORD *)buf = 138412546;
      id v46 = v21;
      __int16 v47 = 2112;
      v48 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Content language code (%@) does not match user preferred language (%@)",  buf,  0x16u);
    }

    uint64_t v19 = TPSTipsManagerErrorDomain;
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  TPSTipsManagerErrorDomain,  3LL,  0LL));
    goto LABEL_11;
  }

  id v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger discoverability](&OBJC_CLASS___TPSLogger, "discoverability"));
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Content does not contain body text", buf, 2u);
  }

  if (v11) {
    BOOL v40 = v8 == 0LL;
  }
  else {
    BOOL v40 = 0;
  }
  if (v40) {
    uint64_t v41 = 2LL;
  }
  else {
    uint64_t v41 = 1LL;
  }
  uint64_t v19 = TPSTipsManagerErrorDomain;
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  TPSTipsManagerErrorDomain,  v41,  0LL,  v42));
LABEL_12:
  id v22 = [[TPSMiniTipMetadata alloc] initWithContent:v8];
  [v22 setError:v18];
  BOOL v23 = (void *)objc_claimAutoreleasedReturnValue([v18 domain]);
  unsigned int v24 = [v23 isEqualToString:v19];

  if (v24)
  {
    id v25 = [v18 code];
    uint64_t v26 = 13LL;
    if (v25 != (id)3) {
      uint64_t v26 = 1LL;
    }
    if (v25 == (id)2) {
      uint64_t v27 = 14LL;
    }
    else {
      uint64_t v27 = v26;
    }
    BOOL v28 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon discoverabilityController](self, "discoverabilityController"));
    [v28 restartTriggerTrackingIfNotDisplayedForIdentifier:v10];

    id v29 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon discoverabilityController](self, "discoverabilityController"));
    objc_super v44 = v10;
    BOOL v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v44, 1LL));
    [v29 markHintIneligibleForIdentifiers:v30 bundleID:v43 context:v9 reason:v27];
  }

  if (v18
    || [v8 isLocalContent]
    && (int64_t v33 = -[TPSDaemon displayStatusCheckForHintIneligibleReasonWithContent:context:bypassExperiment:]( self,  "displayStatusCheckForHintIneligibleReasonWithContent:context:bypassExperiment:",  v8,  v9,  1LL),  (v33 & 0xFFFFFFFFFFFFFFF7LL) != 0)
    && (id v18 = (void *)objc_claimAutoreleasedReturnValue( -[TPSDaemon _errorForHintIneligibleReason:contentID:]( self,  "_errorForHintIneligibleReason:contentID:",  v33,  v10)),  -[TPSDaemon donateHintIneligibleReason:contentID:bundleID:context:]( self,  "donateHintIneligibleReason:contentID:bundleID:context:",  21LL,  v10,  v43,  v9),  v18))
  {
    unsigned int v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v46 = v18;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Mini tip is not valid due to %@", buf, 0xCu);
    }
  }

  else
  {
    int v34 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon tipStatusController](self, "tipStatusController"));
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v34 userInfoForIdentifier:v10]);
    [v22 setUserInfo:v35];

    char v36 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon discoverabilityController](self, "discoverabilityController"));
    objc_msgSend(v22, "setCustomizationID:", objc_msgSend(v36, "customizationIDForContentID:", v10));

    int v37 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon discoverabilityController](self, "discoverabilityController"));
    unsigned __int8 v38 = (void *)objc_claimAutoreleasedReturnValue([v37 monitoringEventsForContentID:v10]);
    [v22 setMonitoringEvents:v38];

    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](&OBJC_CLASS___TPSLogger, "daemon"));
    if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v46 = v22;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v18, OS_LOG_TYPE_DEFAULT, "Mini tip metadata %@", buf, 0xCu);
    }
  }

  return v22;
}

- (void)donateContentRetrieved:(id)a3 bundleID:(id)a4 context:(id)a5 error:(id)a6
{
  id v18 = a3;
  id v10 = a4;
  id v11 = a5;
  if (a6)
  {
    id v12 = a6;
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 domain]);
    id v14 = [v12 code];

    a6 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@: %ld", v13, v14));
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon tipStatusController](self, "tipStatusController"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 correlationIdentifierForIdentifier:v18]);
  unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue( +[TPSAnalyticsEventContentRetrieved eventWithTipID:correlationID:bundleID:context:serviceError:]( &OBJC_CLASS___TPSAnalyticsEventContentRetrieved,  "eventWithTipID:correlationID:bundleID:context:serviceError:",  v18,  v16,  v10,  v11,  a6));
  [v17 log];
}

- (void)contentWithContentIdentifiers:(id)a3 bundleID:(id)a4 context:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v25 = a6;
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger discoverability](&OBJC_CLASS___TPSLogger, "discoverability"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v43 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Fetching for content %@", buf, 0xCu);
  }

  unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v10 count]));
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v10 count]));
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id obj = v10;
  id v14 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v36;
    uint64_t v26 = kTPSMiniTipContentManagerServiceInterfaceErrorDomain;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v36 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v35 + 1) + 8LL * (void)i);
        int64_t v18 = -[TPSDaemon statusCheckForHintIneligibleReasonWithContentID:]( self,  "statusCheckForHintIneligibleReasonWithContentID:",  v17);
        if ((v18 & 0xFFFFFFFFFFFFFFF7LL) != 0)
        {
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( -[TPSDaemon _errorForHintIneligibleReason:contentID:]( self,  "_errorForHintIneligibleReason:contentID:",  v18,  v17));
          -[TPSDaemon donateContentRetrieved:bundleID:context:error:]( self,  "donateContentRetrieved:bundleID:context:error:",  v17,  v11,  v12,  v19);
        }

        else
        {
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( -[TPSTipStatusController variantIdentifierForIdentifier:]( self->_tipStatusController,  "variantIdentifierForIdentifier:",  v17));
          if (v19)
          {
            [v27 addObject:v19];
          }

          else
          {
            NSErrorUserInfoKey v39 = NSLocalizedDescriptionKey;
            BOOL v40 = @"Invalid Content ID";
            id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v40,  &v39,  1LL));
            uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v26,  5LL,  v20));

            -[TPSDaemon donateContentRetrieved:bundleID:context:error:]( self,  "donateContentRetrieved:bundleID:context:error:",  v17,  v11,  v12,  v21);
          }
        }
      }

      id v14 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
    }

    while (v14);
  }

  if ([v27 count])
  {
    objc_initWeak((id *)buf, self);
    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon tipsManager](self, "tipsManager"));
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_10000AD98;
    v29[3] = &unk_10001CE20;
    objc_copyWeak(&v34, (id *)buf);
    v29[4] = self;
    id v30 = v11;
    id v31 = v12;
    id v32 = v24;
    id v33 = v25;
    [v22 contentForVariantIdentifiers:v27 completionHandler:v29];

    objc_destroyWeak(&v34);
    objc_destroyWeak((id *)buf);
  }

  else if (v24)
  {
    id v23 = [v24 copy];
    (*((void (**)(id, id, void))v25 + 2))(v25, v23, 0LL);
  }

  else
  {
    (*((void (**)(id, void, void))v25 + 2))(v25, 0LL, 0LL);
  }
}

- (id)_errorForHintIneligibleReason:(int64_t)a3 contentID:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    if ((a3 & 0xFFFFFFFFFFFFFFF7LL) == 0)
    {
      id v13 = 0LL;
      id v7 = 0LL;
      goto LABEL_7;
    }

    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue( +[TPSAnalyticsCommonDefines ineligibleReasonStringForReason:]( &OBJC_CLASS___TPSAnalyticsCommonDefines,  "ineligibleReasonStringForReason:",  a3));
    id v7 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Content (%@) ineligible due to reason: %@",  v5,  v6));

    uint64_t v8 = kTPSMiniTipContentManagerServiceInterfaceErrorDomain;
    NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
    id v16 = v7;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
    uint64_t v10 = v8;
    uint64_t v11 = 2LL;
  }

  else
  {
    uint64_t v12 = kTPSMiniTipContentManagerServiceInterfaceErrorDomain;
    id v7 = @"Invalid Content ID";
    NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
    int64_t v18 = @"Invalid Content ID";
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
    uint64_t v10 = v12;
    uint64_t v11 = 1LL;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v10,  v11,  v9));

LABEL_7:
  return v13;
}

- (void)welcome:(id)a3 contentAvailableRemotelyWithCompletionHandler:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000B194;
  v5[3] = &unk_10001CB80;
  unsigned __int8 v6 = self;
  id v7 = a4;
  id v4 = v7;
  -[TPSDaemon updateContentFromOrigin:contextualEligibility:widgetEligibility:notificationEligibility:preferredNotificationIdentifiers:shouldDeferBlock:completionHandler:]( v6,  "updateContentFromOrigin:contextualEligibility:widgetEligibility:notificationEligibility:preferredNotificationIdentif iers:shouldDeferBlock:completionHandler:",  1LL,  0LL,  1LL,  0LL,  0LL,  0LL,  v5);
}

- (void)welcome:(id)a3 notifyWelcomeDocument:(id)a4
{
  id v8 = a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon notificationController](self, "notificationController"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  id v7 =  [v5 updateNotificationCacheWithCollectionIdentifier:v6 document:v8 type:1 extensionPayload:0];

  -[TPSDaemon updateNotificationStatus](self, "updateNotificationStatus");
}

- (id)contextualInfoMap
{
  id v3 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon usageEventManager](self, "usageEventManager"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 contextualInfoMap]);
  unsigned __int8 v6 = -[NSMutableDictionary initWithDictionary:](v3, "initWithDictionary:", v5);

  discoverabilityController = self->_discoverabilityController;
  if (!discoverabilityController) {
    discoverabilityController = (TPSDiscoverabilityController *)&OBJC_CLASS___TPSDiscoverabilityController;
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDiscoverabilityController contextualInfoMap](discoverabilityController, "contextualInfoMap"));
  -[NSMutableDictionary addEntriesFromDictionary:](v6, "addEntriesFromDictionary:", v8);
  id v9 = -[NSMutableDictionary copy](v6, "copy");

  return v9;
}

- (id)analyticsExperiment
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon tipsManager](self, "tipsManager"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon tipsManager](self, "tipsManager"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 experiment]);
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TPSTipsManager experiment](&OBJC_CLASS___TPSTipsManager, "experiment"));
  }

  return v5;
}

- (id)deliveryInfoVersion
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon tipsManager](self, "tipsManager"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon tipsManager](self, "tipsManager"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 rulesVersion]);
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TPSTipsManager rulesVersion](&OBJC_CLASS___TPSTipsManager, "rulesVersion"));
  }

  return v5;
}

- (id)tipStatusForIdentifier:(id)a3
{
  return -[TPSTipStatusController statusForIdentifier:](self->_tipStatusController, "statusForIdentifier:", a3);
}

- (id)contextualInfoForIdentifier:(id)a3
{
  discoverabilityController = self->_discoverabilityController;
  if (discoverabilityController)
  {
    id v4 = a3;
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[TPSDiscoverabilityController contextualInfoForIdentifier:]( discoverabilityController,  "contextualInfoForIdentifier:",  v4));
  }

  else
  {
    id v6 = a3;
    id v4 = (id)objc_claimAutoreleasedReturnValue( +[TPSDiscoverabilityController contextualInfoMap]( &OBJC_CLASS___TPSDiscoverabilityController,  "contextualInfoMap"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v6]);
  }

  return v5;
}

- (id)displayTypeForIdentifier:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon tipStatusForIdentifier:](self, "tipStatusForIdentifier:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[TPSAnalyticsCommonDefines displayTypeStringForDisplayType:]( TPSAnalyticsCommonDefines,  "displayTypeStringForDisplayType:",  [v3 displayType]));

  return v4;
}

- (id)experimentCampID
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon analyticsExperiment](self, "analyticsExperiment"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[TPSDaemon experimentCampIDStringForCamp:]( self,  "experimentCampIDStringForCamp:",  [v3 camp]));

  return v4;
}

- (id)experimentID
{
  unsigned __int8 v2 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon analyticsExperiment](self, "analyticsExperiment"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%ld",  [v2 identifier]));

  return v3;
}

- (id)experimentCampIDStringForCamp:(int64_t)a3
{
  return +[TPSAnalyticsCommonDefines experimentCampIDStringForCamp:]( &OBJC_CLASS___TPSAnalyticsCommonDefines,  "experimentCampIDStringForCamp:",  a3);
}

- (id)bundleIDForIdentifier:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon contextualInfoForIdentifier:](self, "contextualInfoForIdentifier:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 displayBundleID]);

  return v4;
}

- (id)correlationIDForIdentifier:(id)a3
{
  return -[TPSTipStatusController correlationIdentifierForIdentifier:]( self->_tipStatusController,  "correlationIdentifierForIdentifier:",  a3);
}

- (id)contextForIdentifier:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon tipStatusForIdentifier:](self, "tipStatusForIdentifier:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 lastDisplayContext]);

  return v4;
}

- (unint64_t)hintDisplayedCountForIdentifier:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon tipStatusForIdentifier:](self, "tipStatusForIdentifier:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 hintDisplayedDates]);
  id v5 = [v4 count];

  return (unint64_t)v5;
}

- (void)tipsManager:(id)a3 eligibilityCompletedWithTipIdentifiers:(id)a4 contextualTipIdentifiers:(id)a5 tipsDeliveryInfoMap:(id)a6 deliveryInfoMap:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v16 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](&OBJC_CLASS___NSMutableSet, "setWithSet:", a4));
  [v16 minusSet:v13];

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon usageEventManager](self, "usageEventManager"));
  NSErrorUserInfoKey v15 = (void *)objc_claimAutoreleasedReturnValue([v16 allObjects]);
  [v14 updateContextualInfoForIdentifiers:v15 tipsDeliveryInfoMap:v12 deliveryInfoMap:v11];
}

- (void)tipsManager:(id)a3 contextualEligibilityWithTipIdentifiers:(id)a4 tipsDeliveryInfoMap:(id)a5 deliveryInfoMap:(id)a6 experimentCampChangesToAll:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = (id)objc_claimAutoreleasedReturnValue(-[TPSDaemon discoverabilityController](self, "discoverabilityController"));
  [v14 contextualEligibilityWithTipIdentifiers:v13 tipsDeliveryInfoMap:v12 deliveryInfoMap:v11 experimentCampChangesToAll:v7];
}

- (void)tipsManagerContentUpdateOverrideCompleted:(id)a3 contentPackage:(id)a4 shouldUpdateNotification:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v9 = a6;
  if (v10) {
    -[TPSDaemon indexContentPackage:](self, "indexContentPackage:", v10);
  }
  -[TPSDaemon contentUpdatePostProcessingContentPackage:shouldUpdateNotification:shouldDeferBlock:error:]( self,  "contentUpdatePostProcessingContentPackage:shouldUpdateNotification:shouldDeferBlock:error:",  v10,  v7,  0LL,  v9);
}

- (BOOL)canCheckForNewTipNotification:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon welcome](self, "welcome", a3));
  char v4 = [v3 shouldShowWelcomeNotification] ^ 1;

  return v4;
}

- (id)currentExperimentWithDiscoverabilityController:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon tipsManager](self, "tipsManager", a3));
  char v4 = (void *)objc_claimAutoreleasedReturnValue([v3 experiment]);

  return v4;
}

- (void)notificationController:(id)a3 markIdentifier:(id)a4 type:(int64_t)a5 ineligibleWithReason:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  if (a5 == 2)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCommonDefines sharedInstance](&OBJC_CLASS___TPSCommonDefines, "sharedInstance"));
    [v14 notifiedCollection:v11];

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon discoverabilityController](self, "discoverabilityController"));
    NSErrorUserInfoKey v15 = (void *)objc_claimAutoreleasedReturnValue([v12 tipStatusController]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 correlationIdentifierForIdentifier:v11]);
    NSErrorUserInfoKey v17 = (void *)objc_claimAutoreleasedReturnValue( +[TPSAnalyticsEventContentIneligible eventWithTipID:correlationID:bundleID:context:displayType:reason:date:]( &OBJC_CLASS___TPSAnalyticsEventContentIneligible,  "eventWithTipID:correlationID:bundleID:context:displayType:reason:date:",  v11,  v16,  0LL,  0LL,  0LL,  a6,  0LL));
    [v17 log];

    goto LABEL_5;
  }

  if (a5 == 1)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon discoverabilityController](self, "discoverabilityController"));
    id v18 = v11;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
    [v12 markHintIneligibleForIdentifiers:v13 context:0 reason:a6];

LABEL_5:
  }
}

- (void)notificationController:(id)a3 registrableEventReceivedForDocumentIdentifier:(id)a4
{
  id v5 = a4;
  if ([v5 length])
  {
    id v7 = v5;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));
    -[TPSDaemon immediateNotificationForIdentifiers:](self, "immediateNotificationForIdentifiers:", v6);
  }
}

- (void)performQuery:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[TPSSearchQueryManager shared](&OBJC_CLASS___TPSSearchQueryManager, "shared"));
  [v7 performQuery:v6 completion:v5];
}

- (void)cancelQueryWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[TPSSearchQueryManager shared](&OBJC_CLASS___TPSSearchQueryManager, "shared"));
  [v4 cancelQueryWithIdentifier:v3];
}

- (void)reindexAllSearchableItemsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger indexing](&OBJC_CLASS___TPSLogger, "indexing"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "reindex all searchableItems request from extension",  v7,  2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon tipsManager](self, "tipsManager"));
  [v6 reindexAllSearchableItemsWithCompletionHandler:v4];
}

- (void)reindexSearchableItemsWithIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger indexing](&OBJC_CLASS___TPSLogger, "indexing"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v10 = 134217984;
    id v11 = [v6 count];
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "reindex reindexSearchableItemsWithIdentifiers request from extension: %lu",  (uint8_t *)&v10,  0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon tipsManager](self, "tipsManager"));
  [v9 reindexSearchableItemsWithIdentifiers:v6 completionHandler:v7];
}

- (void)deleteAllSearchableItemsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger indexing](&OBJC_CLASS___TPSLogger, "indexing"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "delete all searchableItems request from extension",  v7,  2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSDaemon tipsManager](self, "tipsManager"));
  [v6 deleteAllSearchableItemsWithCompletionHandler:v4];
}

- (TPSTipsManager)tipsManager
{
  return self->_tipsManager;
}

- (void)setTipsManager:(id)a3
{
}

- (NSString)notificationTimingDarwinKey
{
  return self->_notificationTimingDarwinKey;
}

- (OS_dispatch_queue)discoverabilityConnectionQueue
{
  return self->_discoverabilityConnectionQueue;
}

- (void)setDiscoverabilityConnectionQueue:(id)a3
{
}

- (OS_dispatch_queue)appConnectionQueue
{
  return self->_appConnectionQueue;
}

- (void)setAppConnectionQueue:(id)a3
{
}

- (OS_dispatch_queue)assistantConnectionQueue
{
  return self->_assistantConnectionQueue;
}

- (void)setAssistantConnectionQueue:(id)a3
{
}

- (NSURLSession)tipsFeedURLSession
{
  return self->_tipsFeedURLSession;
}

- (void)setTipsFeedURLSession:(id)a3
{
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (NSMutableSet)discoverabilityConnections
{
  return self->_discoverabilityConnections;
}

- (void)setDiscoverabilityConnections:(id)a3
{
}

- (NSMutableSet)appConnections
{
  return self->_appConnections;
}

- (void)setAppConnections:(id)a3
{
}

- (NSMutableSet)assistantConnections
{
  return self->_assistantConnections;
}

- (void)setAssistantConnections:(id)a3
{
}

- (TPSTipStatusController)tipStatusController
{
  return self->_tipStatusController;
}

- (void)setTipStatusController:(id)a3
{
}

- (TPSDiscoverabilityController)discoverabilityController
{
  return self->_discoverabilityController;
}

- (void)setDiscoverabilityController:(id)a3
{
}

- (TPSNotificationController)notificationController
{
  return self->_notificationController;
}

- (void)setNotificationController:(id)a3
{
}

- (TPSFullTipUsageEventManager)usageEventManager
{
  return self->_usageEventManager;
}

- (void)setUsageEventManager:(id)a3
{
}

- (TPSWelcome)welcome
{
  return self->_welcome;
}

- (void)setWelcome:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)findMatchingResultIdFromContexts:(id)a3 reply:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = type metadata accessor for ResultContext(0LL);
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  _Block_copy(v6);
  id v9 = self;
  sub_10000FD48(v8, (void (**)(void, void, void))v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease(v8);
}

- (void)availableUserGuideIdentifiersWithReply:(id)a3
{
  id v4 = _Block_copy(a3);
  _Block_copy(v4);
  id v5 = self;
  sub_100010034((uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)fetchDocumentWithIdentifier:(id)a3 reply:(id)a4
{
  uint64_t v7 = sub_10000CA48(&qword_1000227A0);
  __chkstk_darwin(v7);
  id v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  int v10 = _Block_copy(a4);
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v13 = v12;
  uint64_t v14 = swift_allocObject(&unk_10001CFC0, 24LL, 7LL);
  *(void *)(v14 + 16) = v10;
  uint64_t v15 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56LL))(v9, 1LL, 1LL, v15);
  id v16 = (void *)swift_allocObject(&unk_10001CFE8, 72LL, 7LL);
  v16[2] = 0LL;
  v16[3] = 0LL;
  v16[4] = self;
  void v16[5] = sub_10000FC24;
  v16[6] = v14;
  v16[7] = v11;
  v16[8] = v13;
  NSErrorUserInfoKey v17 = self;
  swift_retain(v14);
  swift_bridgeObjectRetain(v13);
  uint64_t v18 = sub_10000E594((uint64_t)v9, (uint64_t)&unk_1000227C8, (uint64_t)v16);

  swift_bridgeObjectRelease(v13);
  swift_release(v14);
  swift_release(v18);
}

@end