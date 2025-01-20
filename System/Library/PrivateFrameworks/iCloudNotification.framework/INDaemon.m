@interface INDaemon
+ (id)sharedInstance;
- (ACAccountStore)accountStore;
- (APSConnection)apsConnection;
- (BOOL)_isFirstLaunchAfterBoot;
- (BOOL)_isFirstLaunchAfterBootMacOS;
- (BOOL)_isFirstLaunchAfterBootiOS;
- (BOOL)hasCheckedForFirstLaunch;
- (BOOL)isRunning;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (INActivity)hearbeatActivity;
- (INDaemon)init;
- (INRegistrar)registrar;
- (INRegistrationDigestCache)registrationDigestCache;
- (NSArray)pushTopics;
- (NSMutableSet)accountsToReconsiderAfterReboot;
- (NSString)activeAPSEnvironment;
- (NSXPCListener)listener;
- (id)_currentBootSessionUUID;
- (id)accountPushNotificationHandlerForEventType:(id)a3;
- (id)familyPushNotificationHandlerForEventType:(id)a3;
- (id)pushToken;
- (id)quotaPushNotificationHandlerForEventType:(id)a3;
- (void)_cleanUpIfNoAccountsAreLeftOtherThanAccount:(id)a3;
- (void)_disablePushTopics;
- (void)_enablePushTopics;
- (void)_ensureDesiredAPSEnvironmentIsInUseWithCompletion:(id)a3;
- (void)_exitClean;
- (void)_handleGMSAvailabilityChange;
- (void)_handleModelCatalogChange;
- (void)_handleOSEligibilityChange;
- (void)_initiateAPSConnectionWithCompletion:(id)a3;
- (void)_performHeartbeatRegistration;
- (void)_performLoggedOutHeartbeatRegistrationIfNeeded;
- (void)_planForRegistrationTTL:(unint64_t)a3 account:(id)a4;
- (void)_registrationDigestCacheDidBecomeAvailable:(id)a3;
- (void)_stopHeartbeat;
- (void)_unregisterAccount:(id)a3 fromiCloudNotificationsWithCompletion:(id)a4;
- (void)_unregisterAccount:(id)a3 fromiCloudNotificationsWithReason:(unint64_t)a4 completion:(id)a5;
- (void)_validateEnabledTopics;
- (void)_validateRegistrationStateIfFirstLaunch;
- (void)appLaunchLinkDidPresentForBundleIdentifier:(id)a3;
- (void)clearAllRegistrationDigestsWithCompletion:(id)a3;
- (void)commonHeadersForRequest:(id)a3 withCompletion:(id)a4;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)dealloc;
- (void)diagnosticReportWithCompletion:(id)a3;
- (void)displayDelayedOfferWithContext:(id)a3 completion:(id)a4;
- (void)handleICloudQuotaPush:(id)a3;
- (void)handlePushRegistrationWithAccount:(id)a3 reason:(unint64_t)a4;
- (void)handlePushUnregistrationWithAccount:(id)a3 completion:(id)a4;
- (void)iCloudServerOfferForAccountWithID:(id)a3 options:(id)a4 completion:(id)a5;
- (void)notifyDeviceStorageLevel:(int64_t)a3 completion:(id)a4;
- (void)presentHiddenFreshmintWithContext:(id)a3 completion:(id)a4;
- (void)registerAccountWithID:(id)a3 foriCloudNotificationsWithReason:(unint64_t)a4 completion:(id)a5;
- (void)registerDeviceForLoggedOutiCloudNotificationsWithReason:(unint64_t)a3 completion:(id)a4;
- (void)registerForPushNotificationsWithAccount:(id)a3 reason:(unint64_t)a4 completion:(id)a5;
- (void)remoteFreshmintFlowCompletedWithSuccess:(BOOL)a3 error:(id)a4;
- (void)renewCredentialsWithCompletion:(id)a3;
- (void)setAccountStore:(id)a3;
- (void)setAccountsToReconsiderAfterReboot:(id)a3;
- (void)setActiveAPSEnvironment:(id)a3;
- (void)setApsConnection:(id)a3;
- (void)setHasCheckedForFirstLaunch:(BOOL)a3;
- (void)setHearbeatActivity:(id)a3;
- (void)setIsRunning:(BOOL)a3;
- (void)setListener:(id)a3;
- (void)setRegistrar:(id)a3;
- (void)setRegistrationDigestCache:(id)a3;
- (void)start;
- (void)startDelayedOfferFailsafeActivityWithDelaySecs:(int64_t)a3 completion:(id)a4;
- (void)stopDelayedOfferFailsafeActivityWithCompletion:(id)a3;
- (void)teardownOffersForAccount:(id)a3 withCompletion:(id)a4;
- (void)unregisterAccountWithID:(id)a3 fromiCloudNotificationsWithCompletion:(id)a4;
- (void)unregisterDeviceFromLoggedOutiCloudNotificationsWithReason:(unint64_t)a3 completion:(id)a4;
- (void)updateOfferForAccountWithID:(id)a3 offerId:(id)a4 buttonId:(id)a5 info:(id)a6 completion:(id)a7;
@end

@implementation INDaemon

+ (id)sharedInstance
{
  if (qword_10002C228 != -1) {
    dispatch_once(&qword_10002C228, &stru_100024DA8);
  }
  return (id)qword_10002C220;
}

- (INDaemon)init
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___INDaemon;
  v2 = -[INDaemon init](&v23, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[AARemoteServer sharedServerWithNoUrlCache](&OBJC_CLASS___AARemoteServer, "sharedServerWithNoUrlCache"));
    aaSharedRemoteServer = v2->_aaSharedRemoteServer;
    v2->_aaSharedRemoteServer = (AARemoteServer *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
    accountStore = v2->_accountStore;
    v2->_accountStore = (ACAccountStore *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[INRegistrationDigestCache sharedInstance](&OBJC_CLASS___INRegistrationDigestCache, "sharedInstance"));
    registrationDigestCache = v2->_registrationDigestCache;
    v2->_registrationDigestCache = (INRegistrationDigestCache *)v7;

    v9 = objc_alloc_init(&OBJC_CLASS___INRegistrar);
    registrar = v2->_registrar;
    v2->_registrar = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v11 addObserver:v2 selector:"_registrationDigestCacheDidBecomeAvailable:" name:@"INRegistrationDigestCacheDidBecomeAvailable" object:v2->_registrationDigestCache];

    v12 = -[INActivity initWithTarget:action:]( objc_alloc(&OBJC_CLASS___INActivity),  "initWithTarget:action:",  v2,  "_performHeartbeatRegistration");
    hearbeatActivity = v2->_hearbeatActivity;
    v2->_hearbeatActivity = v12;

    -[INActivity setActivityID:](v2->_hearbeatActivity, "setActivityID:", off_10002BEB8);
    -[INActivity setActivityNextFireDateKey:]( v2->_hearbeatActivity,  "setActivityNextFireDateKey:",  INNextHeartbeatDateKey);
    -[INActivity checkIn](v2->_hearbeatActivity, "checkIn");
    v14 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    accountsToReconsiderAfterReboot = v2->_accountsToReconsiderAfterReboot;
    v2->_accountsToReconsiderAfterReboot = v14;

    dispatch_queue_attr_t v16 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v16);
    dispatch_queue_attr_t v18 = dispatch_queue_attr_make_with_qos_class(v17, QOS_CLASS_UTILITY, 0);
    v19 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v18);
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.ind.aps-connection-delegate", v19);
    apsConnectionDelegateQueue = v2->_apsConnectionDelegateQueue;
    v2->_apsConnectionDelegateQueue = (OS_dispatch_queue *)v20;
  }

  return v2;
}

- (void)start
{
  if (!self->_isRunning)
  {
    uint64_t v3 = _INLogSystem(self);
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_100015FD4();
    }

    uint64_t v5 = objc_alloc(&OBJC_CLASS___NSXPCListener);
    v6 = -[NSXPCListener initWithMachServiceName:](v5, "initWithMachServiceName:", INDaemonMachServiceName);
    listener = self->_listener;
    self->_listener = v6;

    -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", self);
    -[NSXPCListener resume](self->_listener, "resume");
    self->_isRunning = 1;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100007598;
    v8[3] = &unk_100024AB8;
    v8[4] = self;
    -[INDaemon _initiateAPSConnectionWithCompletion:](self, "_initiateAPSConnectionWithCompletion:", v8);
  }

- (void)dealloc
{
  uint64_t v3 = _INLogSystem(self);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100016000();
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 removeObserver:self];

  listener = self->_listener;
  if (listener)
  {
    -[NSXPCListener setDelegate:](listener, "setDelegate:", 0LL);
    -[NSXPCListener invalidate](self->_listener, "invalidate");
  }

  -[APSConnection setDelegate:](self->_apsConnection, "setDelegate:", 0LL);
  -[APSConnection shutdown](self->_apsConnection, "shutdown");
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___INDaemon;
  -[INDaemon dealloc](&v7, "dealloc");
}

- (void)registerForPushNotificationsWithAccount:(id)a3 reason:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100007758;
  v12[3] = &unk_100024E70;
  objc_copyWeak(v16, &location);
  id v10 = v9;
  id v15 = v10;
  id v11 = v8;
  v16[1] = (id)a4;
  id v13 = v11;
  v14 = self;
  -[INDaemon _ensureDesiredAPSEnvironmentIsInUseWithCompletion:]( self,  "_ensureDesiredAPSEnvironmentIsInUseWithCompletion:",  v12);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

- (void)_planForRegistrationTTL:(unint64_t)a3 account:(id)a4
{
  id v6 = a4;
  uint64_t v7 = _INLogSystem(v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100016390();
  }

  if (a3)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  (double)a3));
    if (v6)
    {
      objc_msgSend(v6, "in_setRegistrationExpirationDate:", v9);
      dispatch_semaphore_t v10 = dispatch_semaphore_create(0LL);
      accountStore = self->_accountStore;
      v14 = _NSConcreteStackBlock;
      uint64_t v15 = 3221225472LL;
      dispatch_queue_attr_t v16 = sub_1000081E8;
      v17 = &unk_100024E98;
      id v18 = v6;
      dispatch_semaphore_t v19 = v10;
      v12 = v10;
      -[ACAccountStore saveAccount:withDataclassActions:doVerify:completion:]( accountStore,  "saveAccount:withDataclassActions:doVerify:completion:",  v18,  0LL,  0LL,  &v14);
      dispatch_time_t v13 = dispatch_time(0LL, 300000000000LL);
      dispatch_semaphore_wait(v12, v13);
    }

    else
    {
      +[LoggedOutPushCache registeredDeviceWithExpirationDate:]( &OBJC_CLASS____TtC3ind18LoggedOutPushCache,  "registeredDeviceWithExpirationDate:",  v9);
    }

    -[INActivity ensureNextActivityWillOccurBeforeDate:]( self->_hearbeatActivity,  "ensureNextActivityWillOccurBeforeDate:",  v9,  v14,  v15,  v16,  v17);
  }
}

- (void)_unregisterAccount:(id)a3 fromiCloudNotificationsWithCompletion:(id)a4
{
}

- (void)_unregisterAccount:(id)a3 fromiCloudNotificationsWithReason:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100008384;
  v12[3] = &unk_100024F10;
  objc_copyWeak(v15, &location);
  id v10 = v9;
  id v14 = v10;
  id v11 = v8;
  id v13 = v11;
  v15[1] = (id)a4;
  -[INDaemon _ensureDesiredAPSEnvironmentIsInUseWithCompletion:]( self,  "_ensureDesiredAPSEnvironmentIsInUseWithCompletion:",  v12);

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
}

- (void)_cleanUpIfNoAccountsAreLeftOtherThanAccount:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _INLogSystem(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100016580();
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccountStore aa_appleAccounts](self->_accountStore, "aa_appleAccounts"));
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v28;
    while (2)
    {
      v12 = 0LL;
      do
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v27 + 1) + 8 * (void)v12) identifier]);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);

        if (v13 != v14)
        {

          uint64_t v19 = _INLogSystem(v18);
          dispatch_queue_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "We have remaining iCloud accounts. Not cleaning up.",  buf,  2u);
          }

          goto LABEL_17;
        }

        v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  uint64_t v16 = _INLogSystem(v15);
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "No remaining iCloud accounts. Turning off APS topics and heartbeat.",  buf,  2u);
  }

  -[INDaemon _disablePushTopics](self, "_disablePushTopics");
  -[INActivity stop](self->_hearbeatActivity, "stop");
LABEL_17:
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccountStore aa_primaryAppleAccount](self->_accountStore, "aa_primaryAppleAccount"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "aa_altDSID"));
  objc_super v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "aa_altDSID"));
  if ([v22 isEqualToString:v23])
  {

LABEL_20:
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_100008A2C;
    v25[3] = &unk_100024F58;
    v25[4] = self;
    +[CSFFeatureManager deviceHasAnyTicket:](&OBJC_CLASS___CSFFeatureManager, "deviceHasAnyTicket:", v25);
    goto LABEL_21;
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccountStore aa_primaryAppleAccount](self->_accountStore, "aa_primaryAppleAccount"));

  if (!v24) {
    goto LABEL_20;
  }
LABEL_21:
}

- (void)handlePushUnregistrationWithAccount:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(void))a4;
  uint64_t v7 = _INLogSystem(v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Handling push un-registration.", v9, 2u);
  }

  v6[2](v6);
  if (!a3)
  {
    -[INDaemon _stopHeartbeat](self, "_stopHeartbeat");
    +[LoggedOutPushCache unregisteredDevice](&OBJC_CLASS____TtC3ind18LoggedOutPushCache, "unregisteredDevice");
  }

- (void)handlePushRegistrationWithAccount:(id)a3 reason:(unint64_t)a4
{
  uint64_t v4 = _INLogSystem(self, a2, a3, a4);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Handling push registration.", v6, 2u);
  }
}

- (void)_registrationDigestCacheDidBecomeAvailable:(id)a3
{
  uint64_t v4 = _INLogSystem(self);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000165AC();
  }

  -[INDaemon _validateRegistrationStateIfFirstLaunch](self, "_validateRegistrationStateIfFirstLaunch");
}

- (void)_validateRegistrationStateIfFirstLaunch
{
  uint64_t v2 = _INLogSystem(self);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100016630();
  }

  BOOL v4 = -[INDaemon _isFirstLaunchAfterBoot](self, "_isFirstLaunchAfterBoot");
  if (v4)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccountStore aa_appleAccounts](self->_accountStore, "aa_appleAccounts"));
    if (![v21 count])
    {
      BOOL v5 = +[LoggedOutPushCache wasDeviceRegistered](&OBJC_CLASS____TtC3ind18LoggedOutPushCache, "wasDeviceRegistered");
      if (v5)
      {
        -[INDaemon registerForPushNotificationsWithAccount:reason:completion:]( self,  "registerForPushNotificationsWithAccount:reason:completion:",  0LL,  5LL,  &stru_100024F78);
      }

      else
      {
        uint64_t v9 = _INLogSystem(v5);
        id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          sub_1000165D8();
        }
      }
    }

    BOOL v11 = +[INRegistrationDigestCache isAvailable](&OBJC_CLASS___INRegistrationDigestCache, "isAvailable");
    if (v11)
    {
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      id obj = v21;
      id v12 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v27;
        do
        {
          id v14 = 0LL;
          do
          {
            if (*(void *)v27 != v13) {
              objc_enumerationMutation(obj);
            }
            uint64_t v15 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)v14);
            uint64_t v16 = self;
            objc_sync_enter(v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "aa_altDSID"));
            if (v17)
            {
              uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[INDaemon accountsToReconsiderAfterReboot](v16, "accountsToReconsiderAfterReboot"));
              [v18 addObject:v17];
            }

            objc_sync_exit(v16);
            v25[0] = _NSConcreteStackBlock;
            v25[1] = 3221225472LL;
            v25[2] = sub_100008FB8;
            v25[3] = &unk_100024FA0;
            v25[4] = v15;
            -[INDaemon registerForPushNotificationsWithAccount:reason:completion:]( v16,  "registerForPushNotificationsWithAccount:reason:completion:",  v15,  5LL,  v25);
            id v14 = (char *)v14 + 1;
          }

          while (v12 != v14);
          id v12 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
        }

        while (v12);
      }

      uint64_t v19 = (os_log_s *)obj;
    }

    else
    {
      uint64_t v20 = _INLogSystem(v11);
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "INRegistrationDigestCache is not available. Skipping FLAB registration validation!",  buf,  2u);
      }
    }

    id v8 = (os_log_s *)v21;
  }

  else
  {
    uint64_t v6 = _INLogSystem(v4);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    id v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      sub_100016604();
      id v8 = v7;
    }
  }
}

- (BOOL)_isFirstLaunchAfterBoot
{
  BOOL v2 = -[INDaemon _isFirstLaunchAfterBootiOS](self, "_isFirstLaunchAfterBootiOS");
  uint64_t v3 = _INLogSystem(v2);
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = @"NO";
    if (v2) {
      BOOL v5 = @"YES";
    }
    int v7 = 136315394;
    id v8 = "-[INDaemon _isFirstLaunchAfterBoot]";
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v7, 0x16u);
  }

  return v2;
}

- (BOOL)_isFirstLaunchAfterBootiOS
{
  BOOL v2 = self;
  objc_sync_enter(v2);
  if (v2->_hasCheckedForFirstLaunch) {
    goto LABEL_4;
  }
  uint64_t v3 = sem_open("ind.boot_check", 0);
  v2->_hasCheckedForFirstLaunch = 1;
  if (v3 != (sem_t *)-1LL)
  {
    sem_close(v3);
LABEL_4:
    BOOL v4 = 0;
    goto LABEL_5;
  }

  uint64_t v6 = sem_open("ind.boot_check", 512, 256LL, 0LL);
  if (v6 == (sem_t *)-1LL)
  {
    uint64_t v10 = _INLogSystem(-1LL, v7, v8, v9);
    BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = __error();
      uint64_t v13 = strerror(*v12);
      *(_DWORD *)buf = 136315394;
      uint64_t v15 = "ind.boot_check";
      __int16 v16 = 2080;
      v17 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Failed to create FLAB semaphore %s: %s",  buf,  0x16u);
    }
  }

  else
  {
    sem_close(v6);
  }

  BOOL v4 = 1;
LABEL_5:
  objc_sync_exit(v2);

  return v4;
}

- (BOOL)_isFirstLaunchAfterBootMacOS
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringForKey:@"com.apple.iCloudNotification.sessionUUID"]);

  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[INDaemon _currentBootSessionUUID](self, "_currentBootSessionUUID"));
  uint64_t v6 = _INLogSystem(v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    uint64_t v15 = v4;
    __int16 v16 = 2112;
    v17 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Saved session UUID: %@, current session UUID: %@",  (uint8_t *)&v14,  0x16u);
  }

  unsigned __int8 v8 = [v4 isEqualToString:v5];
  if ((v8 & 1) == 0)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v9 setObject:v5 forKey:@"com.apple.iCloudNotification.sessionUUID"];

    uint64_t v11 = _INLogSystem(v10);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      uint64_t v15 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Updated saved session UUID to: %@",  (uint8_t *)&v14,  0xCu);
    }
  }

  return v8 ^ 1;
}

- (id)_currentBootSessionUUID
{
  size_t __size = 0LL;
  sysctlbyname("kern.bootsessionuuid", 0LL, &__size, 0LL, 0LL);
  BOOL v2 = malloc(__size);
  sysctlbyname("kern.bootsessionuuid", v2, &__size, 0LL, 0LL);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v2));
  free(v2);
  return v3;
}

- (void)_handleOSEligibilityChange
{
  uint64_t v2 = _INLogSystem(self);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Received os_eligibility change. Revalidating CFU.",  v4,  2u);
  }

  +[CSFFeatureManager revalidateCFU](&OBJC_CLASS___CSFFeatureManager, "revalidateCFU");
}

- (void)_handleGMSAvailabilityChange
{
  uint64_t v2 = _INLogSystem(self);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Received GMS Availability change. Revalidating CFU.",  v4,  2u);
  }

  +[CSFFeatureManager revalidateCFU](&OBJC_CLASS___CSFFeatureManager, "revalidateCFU");
}

- (void)_handleModelCatalogChange
{
  uint64_t v2 = _INLogSystem(self);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Handling model catalog change notification.",  v4,  2u);
  }

  +[CSFFeatureManager postCFUIfEligible](&OBJC_CLASS___CSFFeatureManager, "postCFUIfEligible");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  uint64_t v6 = _INLogSystem(v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "New connection request received.", buf, 2u);
  }

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.private.ind.client"]);
  unsigned __int8 v9 = [v8 BOOLValue];

  if ((v9 & 1) != 0)
  {
    [v5 setExportedObject:self];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[INDaemonInterface XPCInterface](&OBJC_CLASS___INDaemonInterface, "XPCInterface"));
    [v5 setExportedInterface:v11];

    [v5 setInterruptionHandler:&stru_100024FC0];
    [v5 setInvalidationHandler:&stru_100024FC0];
    [v5 resume];
  }

  else
  {
    uint64_t v12 = _INLogSystem(v10);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "INDaemon: incoming connection denied for lacking entitlement.",  v15,  2u);
    }
  }

  return v9;
}

- (void)_performHeartbeatRegistration
{
  uint64_t v2 = self;
  uint64_t v3 = _INLogSystem(self);
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Thump thump!", buf, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccountStore aa_appleAccounts](v2->_accountStore, "aa_appleAccounts"));
  v45 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v54 objects:v61 count:16];
  if (v7)
  {
    id v8 = v7;
    v43 = v2;
    unsigned __int8 v9 = 0LL;
    uint64_t v10 = *(void *)v55;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v55 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v54 + 1) + 8LL * (void)i);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "in_registrationExpirationDate"));
        if (v13)
        {
          int v14 = v9;
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
          id v16 = [v13 compare:v15];

          if (v16 == (id)1)
          {
            unsigned __int8 v9 = v14;
            if (!v14 || (id v17 = [v14 compare:v13], v17 == (id)1))
            {
              uint64_t v18 = _INLogSystem(v17);
              uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v60 = v13;
                _os_log_debug_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "Updating soonest expiration date to %@",  buf,  0xCu);
              }

              id v20 = v13;
              unsigned __int8 v9 = v20;
            }
          }

          else
          {
            uint64_t v23 = _INLogSystem(v17);
            v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
            unsigned __int8 v9 = v14;
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v60 = v12;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEBUG,  "Adding account %@ to expired registration list.",  buf,  0xCu);
            }

            -[NSMutableArray addObject:](v45, "addObject:", v12);
          }
        }

        else
        {
          uint64_t v21 = _INLogSystem(0LL);
          v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v60 = v12;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEBUG,  "No registration expiration date found for account %@.",  buf,  0xCu);
          }
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v54 objects:v61 count:16];
    }

    while (v8);

    uint64_t v2 = v43;
    if (v9) {
      -[INActivity ensureNextActivityWillOccurBeforeDate:]( v43->_hearbeatActivity,  "ensureNextActivityWillOccurBeforeDate:",  v9);
    }
  }

  else
  {

    unsigned __int8 v9 = 0LL;
  }

  BOOL v25 = -[INActivity setActivityState:](v2->_hearbeatActivity, "setActivityState:", 4LL);
  if (v25)
  {
    v41 = v9;
    id v42 = v6;
    __int128 v26 = (void *)os_transaction_create("com.apple.iCloudNotification.registration");
    __int128 v27 = dispatch_group_create();
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    id obj = v45;
    id v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v50,  v58,  16LL);
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v51;
      do
      {
        v31 = 0LL;
        do
        {
          if (*(void *)v51 != v30) {
            objc_enumerationMutation(obj);
          }
          v32 = *(void **)(*((void *)&v50 + 1) + 8LL * (void)v31);
          uint64_t v33 = _INLogSystem(v28);
          v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v60 = v32;
            _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Forcing registration for account %@",  buf,  0xCu);
          }

          dispatch_group_enter(v27);
          v47[0] = _NSConcreteStackBlock;
          v47[1] = 3221225472LL;
          v47[2] = sub_100009D7C;
          v47[3] = &unk_100024E98;
          id v48 = v26;
          v49 = v27;
          -[INDaemon registerForPushNotificationsWithAccount:reason:completion:]( v2,  "registerForPushNotificationsWithAccount:reason:completion:",  v32,  0LL,  v47);

          v31 = (char *)v31 + 1;
        }

        while (v29 != v31);
        id v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v50,  v58,  16LL);
        id v29 = v28;
      }

      while (v28);
    }

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    v36 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100009E48;
    block[3] = &unk_100024AB8;
    block[4] = v2;
    dispatch_group_notify(v27, v36, block);

    unsigned __int8 v9 = v41;
  }

  else
  {
    uint64_t v37 = _INLogSystem(v25);
    v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      sub_10001665C();
    }

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccountStore aa_primaryAppleAccount](v2->_accountStore, "aa_primaryAppleAccount"));
    if (v39) {
      -[INDaemon _exitClean](v2, "_exitClean");
    }
  }

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccountStore aa_primaryAppleAccount](v2->_accountStore, "aa_primaryAppleAccount", v41, v42));

  if (!v40) {
    -[INDaemon _performLoggedOutHeartbeatRegistrationIfNeeded](v2, "_performLoggedOutHeartbeatRegistrationIfNeeded");
  }
}

- (void)_performLoggedOutHeartbeatRegistrationIfNeeded
{
  BOOL v3 = +[LoggedOutPushCache wasDeviceRegistered](&OBJC_CLASS____TtC3ind18LoggedOutPushCache, "wasDeviceRegistered");
  if (v3)
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[LoggedOutPushCache expirationDate](&OBJC_CLASS____TtC3ind18LoggedOutPushCache, "expirationDate"));
    -[INActivity ensureNextActivityWillOccurBeforeDate:]( self->_hearbeatActivity,  "ensureNextActivityWillOccurBeforeDate:",  v4);
    BOOL v5 = -[INActivity setActivityState:](self->_hearbeatActivity, "setActivityState:", 4LL);
    if (v5)
    {
      id v6 = (void *)os_transaction_create("com.apple.iCloudNotification.registration");
      id v7 = dispatch_group_create();
      uint64_t v8 = _INLogSystem(v7);
      unsigned __int8 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Forcing logged-out push registration for device",  buf,  2u);
      }

      dispatch_group_enter(v7);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_10000A0E8;
      v19[3] = &unk_100024E98;
      id v20 = v6;
      uint64_t v21 = v7;
      uint64_t v10 = v7;
      id v11 = v6;
      -[INDaemon registerForPushNotificationsWithAccount:reason:completion:]( self,  "registerForPushNotificationsWithAccount:reason:completion:",  0LL,  0LL,  v19);
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
      uint64_t v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10000A1B4;
      block[3] = &unk_100024AB8;
      block[4] = self;
      dispatch_group_notify(v10, v13, block);
    }

    else
    {
      uint64_t v16 = _INLogSystem(v5);
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10001665C();
      }

      -[INDaemon _exitClean](self, "_exitClean");
    }
  }

  else
  {
    uint64_t v14 = _INLogSystem(v3);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "No iCloud accounts found, and device wasn't registered for logged-out push, so there's nothing to do.",  buf,  2u);
    }

    -[INDaemon _stopHeartbeat](self, "_stopHeartbeat");
    -[INDaemon _exitClean](self, "_exitClean");
  }

- (void)registerAccountWithID:(id)a3 foriCloudNotificationsWithReason:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  unsigned __int8 v9 = (void (**)(id, void, void *))a5;
  uint64_t v10 = _INLogSystem(v9);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412546;
    id v21 = v8;
    __int16 v22 = 2080;
    uint64_t v23 = "-[INDaemon registerAccountWithID:foriCloudNotificationsWithReason:completion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Received registration request for account %@ over XPC. %s",  (uint8_t *)&v20,  0x16u);
  }

  if (v8
    && (uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccountStore accountWithIdentifier:](self->_accountStore, "accountWithIdentifier:", v8))) != 0LL)
  {
    uint64_t v13 = v12;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 accountType]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
    unsigned __int8 v16 = [v15 isEqualToString:ACAccountTypeIdentifierAppleAccount];

    if ((v16 & 1) != 0)
    {
      -[INDaemon registerForPushNotificationsWithAccount:reason:completion:]( self,  "registerForPushNotificationsWithAccount:reason:completion:",  v13,  a4,  v9);
    }

    else
    {
      uint64_t v18 = INCreateError(9LL);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v9[2](v9, 0LL, v19);
    }
  }

  else
  {
    uint64_t v17 = INCreateError(8LL);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v9[2](v9, 0LL, v13);
  }
}

- (void)registerDeviceForLoggedOutiCloudNotificationsWithReason:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = _INLogSystem(v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    uint64_t v10 = "-[INDaemon registerDeviceForLoggedOutiCloudNotificationsWithReason:completion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Received logged-out push registration request over XPC. %s",  (uint8_t *)&v9,  0xCu);
  }

  -[INDaemon registerForPushNotificationsWithAccount:reason:completion:]( self,  "registerForPushNotificationsWithAccount:reason:completion:",  0LL,  a3,  v6);
}

- (void)unregisterAccountWithID:(id)a3 fromiCloudNotificationsWithCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _INLogSystem(v7);
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v29 = v6;
    __int16 v30 = 2080;
    v31 = "-[INDaemon unregisterAccountWithID:fromiCloudNotificationsWithCompletion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Received unregistration request for account %@ over XPC. %s",  buf,  0x16u);
  }

  if (!v6) {
    goto LABEL_9;
  }
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[ACAccountStore accountWithIdentifier:](self->_accountStore, "accountWithIdentifier:", v6));
  uint64_t v12 = _INLogSystem(v11);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_100016718();
  }

  if (v11)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 accountType]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
    unsigned __int8 v16 = [v15 isEqualToString:ACAccountTypeIdentifierAppleAccount];

    if ((v16 & 1) != 0)
    {
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_10000A72C;
      v25[3] = &unk_100024EC0;
      v25[4] = self;
      id v26 = v11;
      id v27 = v7;
      id v11 = v11;
      -[INDaemon _unregisterAccount:fromiCloudNotificationsWithCompletion:]( self,  "_unregisterAccount:fromiCloudNotificationsWithCompletion:",  v11,  v25);
    }

    else
    {
      uint64_t v21 = _INLogSystem(v17);
      __int16 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_1000166B4();
      }

      uint64_t v23 = INCreateError(9LL);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v24);
    }
  }

  else
  {
LABEL_9:
    uint64_t v18 = _INLogSystem(v10);
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100016688();
    }

    uint64_t v20 = INCreateError(8LL);
    id v11 = (id)objc_claimAutoreleasedReturnValue(v20);
    (*((void (**)(id, void, id))v7 + 2))(v7, 0LL, v11);
  }
}

- (void)unregisterDeviceFromLoggedOutiCloudNotificationsWithReason:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = _INLogSystem(v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v13 = "-[INDaemon unregisterDeviceFromLoggedOutiCloudNotificationsWithReason:completion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Received logged-out push unregistration request over XPC. %s",  buf,  0xCu);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10000A900;
  v10[3] = &unk_100025010;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  -[INDaemon _unregisterAccount:fromiCloudNotificationsWithReason:completion:]( self,  "_unregisterAccount:fromiCloudNotificationsWithReason:completion:",  0LL,  a3,  v10);
}

- (void)teardownOffersForAccount:(id)a3 withCompletion:(id)a4
{
  id v4 = a3;
  uint64_t v5 = _INLogSystem(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    id v8 = v4;
    __int16 v9 = 2080;
    uint64_t v10 = "-[INDaemon teardownOffersForAccount:withCompletion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Received teardown offers request for account %@ over XPC. %s",  (uint8_t *)&v7,  0x16u);
  }
}

- (void)clearAllRegistrationDigestsWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v5 = _INLogSystem(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100016778();
  }

  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccountStore aa_appleAccounts](self->_accountStore, "aa_appleAccounts"));
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (!v8) {
    goto LABEL_14;
  }
  id v9 = v8;
  uint64_t v18 = v4;
  id v10 = 0LL;
  uint64_t v11 = *(void *)v21;
  do
  {
    uint64_t v12 = 0LL;
    uint64_t v13 = v10;
    do
    {
      if (*(void *)v21 != v11) {
        objc_enumerationMutation(v7);
      }
      uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)v12);
      uint64_t v15 = _INLogSystem(v8);
      unsigned __int8 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v25 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Removing registration digest for account: %@",  buf,  0xCu);
      }

      registrationDigestCache = self->_registrationDigestCache;
      id v19 = v13;
      -[INRegistrationDigestCache removeRegistrationDigestForAccount:withError:]( registrationDigestCache,  "removeRegistrationDigestForAccount:withError:",  v14,  &v19);
      id v10 = v19;

      uint64_t v12 = (char *)v12 + 1;
      uint64_t v13 = v10;
    }

    while (v9 != v12);
    id v8 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
    id v9 = v8;
  }

  while (v8);
  id v4 = v18;
  if (v10)
  {
    ((void (**)(id, uint64_t, id))v18)[2](v18, 0LL, v10);
  }

  else
  {
LABEL_14:
    v4[2](v4, 1LL, 0LL);
  }
}

- (void)diagnosticReportWithCompletion:(id)a3
{
  uint64_t v11 = (void (**)(id, id, void))a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___INDiagnosticReport);
  [v4 setDisabled:0];
  [v4 setPushEnvironment:self->_activeAPSEnvironment];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnection publicToken](self->_apsConnection, "publicToken"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 description]);
  [v4 setPushToken:v6];

  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnection enabledTopics](self->_apsConnection, "enabledTopics"));
  [v4 setPushTopics:v7];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[INManagedDefaults sharedInstance](&OBJC_CLASS___INManagedDefaults, "sharedInstance"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForManagedDefault:INNextHeartbeatDateKey]);

  if (v9)
  {
    [v9 doubleValue];
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
    [v4 setNextHeartbeatDate:v10];
  }

  v11[2](v11, v4, 0LL);
}

- (void)iCloudServerOfferForAccountWithID:(id)a3 options:(id)a4 completion:(id)a5
{
  uint64_t v5 = (void (**)(id, void, void *))a5;
  uint64_t v6 = _INLogSystem(v5);
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Subclass must override if they support freshmint.",  v10,  2u);
  }

  uint64_t v8 = INCreateError(6LL);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v5[2](v5, 0LL, v9);
}

- (void)updateOfferForAccountWithID:(id)a3 offerId:(id)a4 buttonId:(id)a5 info:(id)a6 completion:(id)a7
{
  int v7 = (void (**)(id, void, void *))a7;
  uint64_t v8 = _INLogSystem(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_1000167A4();
  }

  uint64_t v10 = INCreateError(6LL);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v7[2](v7, 0LL, v11);
}

- (void)notifyDeviceStorageLevel:(int64_t)a3 completion:(id)a4
{
  id v4 = (void (**)(id, void, void *))a4;
  uint64_t v5 = _INLogSystem(v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Subclass must override if they support freshmint.",  v9,  2u);
  }

  uint64_t v7 = INCreateError(6LL);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v4[2](v4, 0LL, v8);
}

- (void)presentHiddenFreshmintWithContext:(id)a3 completion:(id)a4
{
  id v4 = (void (**)(id, void, void *))a4;
  uint64_t v5 = _INLogSystem(v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Subclass must override if they support freshmint.",  v9,  2u);
  }

  uint64_t v7 = INCreateError(6LL);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v4[2](v4, 0LL, v8);
}

- (void)remoteFreshmintFlowCompletedWithSuccess:(BOOL)a3 error:(id)a4
{
  uint64_t v4 = _INLogSystem(self);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Subclass must override if they support freshmint.",  v6,  2u);
  }
}

- (void)appLaunchLinkDidPresentForBundleIdentifier:(id)a3
{
  uint64_t v3 = _INLogSystem(self);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Subclass must override if they support freshmint.",  v5,  2u);
  }
}

- (void)commonHeadersForRequest:(id)a3 withCompletion:(id)a4
{
  uint64_t v4 = (void (**)(id, void))a4;
  uint64_t v5 = _INLogSystem(v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Subclass must override if they support freshmint.",  v7,  2u);
  }

  v4[2](v4, 0LL);
}

- (void)renewCredentialsWithCompletion:(id)a3
{
  uint64_t v3 = (void (**)(id, uint64_t, void))a3;
  uint64_t v4 = _INLogSystem(v3);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Subclass must override if they support freshmint.",  v6,  2u);
  }

  v3[2](v3, 2LL, 0LL);
}

- (id)accountPushNotificationHandlerForEventType:(id)a3
{
  uint64_t v3 = _INLogSystem(self);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1000167D0();
  }

  return 0LL;
}

- (id)familyPushNotificationHandlerForEventType:(id)a3
{
  uint64_t v3 = _INLogSystem(self);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1000167D0();
  }

  return 0LL;
}

- (id)quotaPushNotificationHandlerForEventType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_quotaPushNotificationHandlersByEventType,  "objectForKeyedSubscript:",  v4));
  if (!v5)
  {
    uint64_t v6 = _INLogSystem(0LL);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "No quota push handler found for event type: %@",  (uint8_t *)&v9,  0xCu);
    }
  }

  return v5;
}

- (void)handleICloudQuotaPush:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"category"]);

  id v6 = [v5 isEqualToString:@"cloudsubscriptionfeatures"];
  int v7 = (int)v6;
  uint64_t v8 = _INLogSystem(v6);
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
      int v12 = 138412290;
      uint64_t v13 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Handling CloudSubscriptionFeatures plan change notification: %@",  (uint8_t *)&v12,  0xCu);
    }

    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
    +[CSFFeatureManager processPushNotificationDictionary:]( &OBJC_CLASS___CSFFeatureManager,  "processPushNotificationDictionary:",  v10);
  }

  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    sub_1000167FC();
  }
}

- (id)pushToken
{
  return -[APSConnection publicToken](self->_apsConnection, "publicToken");
}

- (void)_initiateAPSConnectionWithCompletion:(id)a3
{
  id v4 = a3;
  aaSharedRemoteServer = self->_aaSharedRemoteServer;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000B4CC;
  v7[3] = &unk_100025038;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[AARemoteServer configurationWithCompletion:](aaSharedRemoteServer, "configurationWithCompletion:", v7);
}

- (void)_ensureDesiredAPSEnvironmentIsInUseWithCompletion:(id)a3
{
  id v4 = a3;
  aaSharedRemoteServer = self->_aaSharedRemoteServer;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000B7AC;
  v7[3] = &unk_100025060;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[AARemoteServer configurationWithCompletion:](aaSharedRemoteServer, "configurationWithCompletion:", v7);
}

- (void)_validateEnabledTopics
{
  uint64_t v3 = _INLogSystem(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100016A14();
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[INDaemon accountStore](self, "accountStore"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aa_appleAccounts"));

  if ([v6 count])
  {
    id v7 = -[INDaemon _enablePushTopics](self, "_enablePushTopics");
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnection enabledTopics](self->_apsConnection, "enabledTopics"));
    id v9 = [v8 count];

    if (v9)
    {
      uint64_t v10 = _INLogSystem(v7);
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v14 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "We have stale APS enabled topics. Clearing...",  v14,  2u);
      }

      id v7 = -[INDaemon _disablePushTopics](self, "_disablePushTopics");
    }
  }

  uint64_t v12 = _INLogSystem(v7);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_1000169E8();
  }
}

- (void)_enablePushTopics
{
  uint64_t v3 = _INLogSystem(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100016A40(self, v4);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[INDaemon pushTopics](self, "pushTopics"));
  -[APSConnection _setEnabledTopics:](self->_apsConnection, "_setEnabledTopics:", v5);
}

- (void)_disablePushTopics
{
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  uint64_t v5 = _INLogSystem(self);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received new public token from APS.", buf, 2u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccountStore aa_appleAccounts](self->_accountStore, "aa_appleAccounts"));
  if (![v7 count])
  {
    BOOL v19 = +[LoggedOutPushCache wasDeviceRegistered](&OBJC_CLASS____TtC3ind18LoggedOutPushCache, "wasDeviceRegistered");
    if (v19)
    {
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_10000C01C;
      v22[3] = &unk_100024FA0;
      v22[4] = self;
      -[INDaemon registerForPushNotificationsWithAccount:reason:completion:]( self,  "registerForPushNotificationsWithAccount:reason:completion:",  0LL,  7LL,  v22);
      goto LABEL_23;
    }

    uint64_t v21 = _INLogSystem(v19);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      __int128 v20 = "Ignoring new push token from APS because we don't have an iCloud account right now, and logged-out pushes are not needed.";
      goto LABEL_21;
    }

- (void)_exitClean
{
  uint64_t v2 = MGGetSInt32Answer(@"DeviceClassNumber", 0LL);
  if ((_DWORD)v2 == 7)
  {
    uint64_t v3 = _INLogSystem(v2);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "The platform detected as HomePod, and ind is no longer running, terminating.",  v5,  2u);
    }

    xpc_transaction_exit_clean();
  }

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v5 = a4;
  uint64_t v6 = _INLogSystem(v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v5 topic]);
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
    int v26 = 138412546;
    id v27 = v8;
    __int16 v28 = 2112;
    id v29 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Received new incoming message from APS. %@ - %@",  (uint8_t *)&v26,  0x16u);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnection enabledTopics](self->_apsConnection, "enabledTopics"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 topic]);
  unsigned __int8 v12 = [v10 containsObject:v11];

  if ((v12 & 1) != 0)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"event"]);

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v5 topic]);
    unsigned int v17 = [v16 isEqualToString:@"com.me.setupservice"];

    if (v17)
    {
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[INDaemon accountPushNotificationHandlerForEventType:]( self,  "accountPushNotificationHandlerForEventType:",  v15));
      BOOL v19 = v18;
    }

    else
    {
      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v5 topic]);
      unsigned int v23 = [v22 isEqualToString:@"com.icloud.quota"];

      if (!v23)
      {
        uint64_t v25 = _INLogSystem(v24);
        BOOL v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_100016AEC(v5, v19);
        }
        goto LABEL_14;
      }

      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[INDaemon quotaPushNotificationHandlerForEventType:]( self,  "quotaPushNotificationHandlerForEventType:",  v15));
      BOOL v19 = v18;
      if (!v18)
      {
        -[INDaemon handleICloudQuotaPush:](self, "handleICloudQuotaPush:", v5);
        goto LABEL_14;
      }
    }

    -[os_log_s handleIncomingPushNotification:](v18, "handleIncomingPushNotification:", v5);
LABEL_14:

    goto LABEL_15;
  }

  uint64_t v20 = _INLogSystem(v13);
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v5 topic]);
    int v26 = 138412290;
    id v27 = v21;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Ignoring push because the topic %@ is not enabled.",  (uint8_t *)&v26,  0xCu);
  }

- (void)_stopHeartbeat
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[INManagedDefaults sharedInstance](&OBJC_CLASS___INManagedDefaults, "sharedInstance"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[INActivity activityNextFireDateKey](self->_hearbeatActivity, "activityNextFireDateKey"));
  [v4 setValue:0 forManagedDefault:v3];
}

- (void)displayDelayedOfferWithContext:(id)a3 completion:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (void (**)(id, void))a4;
  uint64_t v7 = _INLogSystem(v6);
  BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100016BB0();
  }

  uint64_t v10 = _INLogSystem(v9);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_100016B84();
  }

  v6[2](v6, 0LL);
}

- (void)startDelayedOfferFailsafeActivityWithDelaySecs:(int64_t)a3 completion:(id)a4
{
  id v4 = (void (**)(id, id))a4;
  uint64_t v5 = INCreateErrorWithMessage( 13LL,  @"Method startDelayedOfferFailsafeActivityWithDelaySecs not supported in this platform.");
  id v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  v4[2](v4, v6);
}

- (void)stopDelayedOfferFailsafeActivityWithCompletion:(id)a3
{
  uint64_t v3 = (void (**)(id, id))a3;
  uint64_t v4 = INCreateErrorWithMessage( 13LL,  @"Method stopDelayedOfferFailsafeActivityWithCompletion not supported in this platform.");
  id v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  v3[2](v3, v5);
}

- (NSMutableSet)accountsToReconsiderAfterReboot
{
  return self->_accountsToReconsiderAfterReboot;
}

- (void)setAccountsToReconsiderAfterReboot:(id)a3
{
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
}

- (INActivity)hearbeatActivity
{
  return self->_hearbeatActivity;
}

- (void)setHearbeatActivity:(id)a3
{
}

- (INRegistrar)registrar
{
  return self->_registrar;
}

- (void)setRegistrar:(id)a3
{
}

- (INRegistrationDigestCache)registrationDigestCache
{
  return self->_registrationDigestCache;
}

- (void)setRegistrationDigestCache:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (BOOL)hasCheckedForFirstLaunch
{
  return self->_hasCheckedForFirstLaunch;
}

- (void)setHasCheckedForFirstLaunch:(BOOL)a3
{
  self->_hasCheckedForFirstLaunch = a3;
}

- (APSConnection)apsConnection
{
  return self->_apsConnection;
}

- (void)setApsConnection:(id)a3
{
}

- (NSString)activeAPSEnvironment
{
  return self->_activeAPSEnvironment;
}

- (void)setActiveAPSEnvironment:(id)a3
{
}

- (NSArray)pushTopics
{
  return self->_pushTopics;
}

- (void).cxx_destruct
{
}

@end