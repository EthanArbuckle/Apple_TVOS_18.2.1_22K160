@interface MPCloudKit
+ (id)sharedInstance;
- (BOOL)initializedCKAfterFirstUnlockedSinceBoot;
- (BOOL)isAccountActive;
- (BOOL)isFetchInProgress;
- (BOOL)isFetchMasterKeyInProgress;
- (BOOL)isOldContainerResetInProcess;
- (BOOL)isWriteMasterKeysInProgress;
- (BOOL)manateeZoneUpgraded;
- (BOOL)pushReceived;
- (BOOL)reinitAfterBuddy;
- (BOOL)shouldPauseFetch;
- (BTStateWatcher)buddyStateWatcher;
- (CKContainer)cloudKitContainer;
- (CKDatabase)cloudKitDatabase;
- (CKRecordZone)recordZoneAccessoryDatabase;
- (CKRecordZone)recordZoneBlob;
- (CKSubscription)cloudSubscription;
- (MPCloudKit)init;
- (MPCloudKit)initWithRecordZoneName;
- (NSError)pauseErrorReason;
- (NSMutableData)masterBlob;
- (NSOperationQueue)modifyOperationQueue;
- (NSString)cloudContainerIdentifier;
- (NSString)description;
- (NSTimer)countdownTimer;
- (NSTimer)modifyOperationTimer;
- (NSTimer)pushTimer;
- (OS_dispatch_queue)pushDelegateQueue;
- (OS_dispatch_queue)pushQueue;
- (id)apsEnvironmentString;
- (id)hexStringForData:(id)a3;
- (id)readUserPreference:(id)a3;
- (void)_pushTimerFired:(id)a3;
- (void)accountStatusDidChange:(id)a3;
- (void)buddySetupDone;
- (void)checkAccountStatusWithCompletionHandler:(id)a3;
- (void)checkAccountStatusWithCompletionHandler:(id)a3 withRetryCount:(unint64_t)a4;
- (void)createSubscritionForRecordType:(id)a3;
- (void)dealloc;
- (void)deleteCloudKitAccessoryZone;
- (void)deleteLegacyMasterKey;
- (void)didReceiveWithMessage:(id)a3;
- (void)didReceiveWithPublicToken:(id)a3;
- (void)didReceiveWithToken:(id)a3 forTopic:(id)a4 identifier:(id)a5;
- (void)fetchAccessoryKeyBlob:(unint64_t)a3;
- (void)fetchAccountStatusWithCompletion:(id)a3;
- (void)fetchKeyBlob:(unint64_t)a3;
- (void)fetchSubscriptionForRecordType:(id)a3 andPrefKey:(id)a4;
- (void)forceAccountStatus;
- (void)getAccountStatus;
- (void)handleAccessoryKeyModifyError:(id)a3 forBlob:(id)a4 withRetryCount:(unint64_t)a5;
- (void)handleModifyMasterKeyError:(id)a3 forBlob:(id)a4 withRetryCount:(unint64_t)a5;
- (void)initializeCloudKit;
- (void)markLegacyNonManateeContainerMigrated;
- (void)modifyAccessoryBlob:(id)a3 withRetryCount:(unint64_t)a4;
- (void)modifyKeyBlob:(id)a3 withRetryCount:(unint64_t)a4;
- (void)pushDisable;
- (void)pushEnable;
- (void)removeSubscritionForRecordType:(id)a3;
- (void)removeuserPreference:(id)a3 sync:(BOOL)a4;
- (void)resetOldZones;
- (void)setBuddyStateWatcher:(id)a3;
- (void)setCloudKitContainer:(id)a3;
- (void)setCloudKitDatabase:(id)a3;
- (void)setCloudSubscription:(id)a3;
- (void)setCountdownTimer:(id)a3;
- (void)setIsAccountActive:(BOOL)a3;
- (void)setIsFetchInProgress:(BOOL)a3;
- (void)setIsFetchMasterKeyInProgress:(BOOL)a3;
- (void)setIsOldContainerResetInProcess:(BOOL)a3;
- (void)setIsWriteMasterKeysInProgress:(BOOL)a3;
- (void)setMasterBlob:(id)a3;
- (void)setModifyOperationQueue:(id)a3;
- (void)setModifyOperationTimer:(id)a3;
- (void)setPauseErrorReason:(id)a3;
- (void)setPushQueue:(id)a3;
- (void)setPushReceived:(BOOL)a3;
- (void)setPushTimer:(id)a3;
- (void)setRecordZoneAccessoryDatabase:(id)a3;
- (void)setRecordZoneBlob:(id)a3;
- (void)setReinitAfterBuddy:(BOOL)a3;
- (void)setShouldPauseFetch:(BOOL)a3;
- (void)setupSubscriptions;
- (void)setuserPreference:(id)a3 value:(id)a4 sync:(BOOL)a5;
- (void)updateCloudKitAccessoryZone:(id)a3 delete:(BOOL)a4;
- (void)updateCloudKitBlobZone:(id)a3;
- (void)upgradeLegacyNonManateeContainerToManatee;
- (void)verifyAndCacheSubscriptionID:(id)a3;
- (void)writeAccessoryBlob:(id)a3 withRetryCount:(unint64_t)a4;
- (void)writeKeyBlob:(id)a3 withRetryCount:(unint64_t)a4;
@end

@implementation MPCloudKit

+ (id)sharedInstance
{
  if (qword_100237250 != -1) {
    dispatch_once(&qword_100237250, &stru_1002081F8);
  }
  return (id)qword_100237248;
}

- (MPCloudKit)init
{
  return -[MPCloudKit initWithRecordZoneName](self, "initWithRecordZoneName");
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MPCloudKit;
  -[MPCloudKit dealloc](&v4, "dealloc");
}

- (NSString)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit cloudContainerIdentifier](self, "cloudContainerIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"MPCloudKit: Container - %@",  v2));

  return (NSString *)v3;
}

- (MPCloudKit)initWithRecordZoneName
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___MPCloudKit;
  v2 = -[MPCloudKit init](&v18, "init");
  v3 = v2;
  if (!v2) {
    return v3;
  }
  countdownTimer = v2->_countdownTimer;
  if (countdownTimer)
  {
    -[NSTimer invalidate](countdownTimer, "invalidate");
    v5 = v3->_countdownTimer;
    v3->_countdownTimer = 0LL;
  }

  v6 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
  modifyOperationQueue = v3->_modifyOperationQueue;
  v3->_modifyOperationQueue = v6;

  -[NSOperationQueue setMaxConcurrentOperationCount:](v3->_modifyOperationQueue, "setMaxConcurrentOperationCount:", 1LL);
  unsigned int v8 = +[BTSystemConfiguration isBuddyComplete](&OBJC_CLASS___BTSystemConfiguration, "isBuddyComplete");
  os_log_t v9 = sub_100060178("MagicPairing");
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (!v8)
  {
    if (v11)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "MP BYSetupAssistantNeedsToRun : true ",  (uint8_t *)buf,  2u);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
    [v12 beginTransaction:@"com.apple.bluetooth.user.services.mpcloudkit.buddysetup"];

    v3->_reinitAfterBuddy = 1;
    objc_initWeak(buf, v3);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100060598;
    v15[3] = &unk_100207CB8;
    objc_copyWeak(&v16, buf);
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[BTStateWatcher monitorBuddyStateWithAction:]( &OBJC_CLASS___BTStateWatcher,  "monitorBuddyStateWithAction:",  v15));
    -[MPCloudKit setBuddyStateWatcher:](v3, "setBuddyStateWatcher:", v13);

    objc_destroyWeak(&v16);
    objc_destroyWeak(buf);
    goto LABEL_12;
  }

  if (v11)
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "MP BYSetupAssistantNeedsToRun : false ",  (uint8_t *)buf,  2u);
  }

  v3->_reinitAfterBuddy = 0;
  if (!-[MPCloudKit initializedCKAfterFirstUnlockedSinceBoot](v3, "initializedCKAfterFirstUnlockedSinceBoot")) {
LABEL_12:
  }
    -[MPCloudKit initializedCKAfterFirstUnlockedSinceBoot](v3, "initializedCKAfterFirstUnlockedSinceBoot");
  return v3;
}

- (BOOL)initializedCKAfterFirstUnlockedSinceBoot
{
  int v3 = MKBDeviceUnlockedSinceBoot(self, a2);
  os_log_t v4 = sub_100060178("MagicPairing");
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = @"YES";
    if (!v3) {
      v6 = @"NO";
    }
    *(_DWORD *)buf = 138543362;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Unlocked since boot = %{public}@", buf, 0xCu);
  }

  if (v3 == 1)
  {
    os_log_t v7 = sub_100060178("MagicPairing");
    unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "device is already unlocked after boot ",  buf,  2u);
    }

    -[MPCloudKit initializeCloudKit](self, "initializeCloudKit");
  }

  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100060750;
    block[3] = &unk_100206058;
    block[4] = self;
    if (qword_100237258 != -1) {
      dispatch_once(&qword_100237258, block);
    }
  }

  return v3 == 1;
}

- (void)getAccountStatus
{
}

- (void)forceAccountStatus
{
  os_log_t v3 = sub_100060178("MagicPairing");
  os_log_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Forcing account update to bluetoothd", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit cloudKitContainer](self, "cloudKitContainer"));
  [v5 accountStatusWithCompletionHandler:&stru_100208260];
}

- (void)buddySetupDone
{
  os_log_t v3 = sub_100060178("MagicPairing");
  os_log_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "buddySetupDone : reset timer now ", buf, 2u);
  }

  if (self->_reinitAfterBuddy)
  {
    -[MPCloudKit initializedCKAfterFirstUnlockedSinceBoot](self, "initializedCKAfterFirstUnlockedSinceBoot");
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v5 addObserver:self selector:"accountStatusDidChange:" name:CKAccountChangedNotification object:0];

    os_log_t v6 = sub_100060178("MagicPairing");
    os_log_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)os_log_t v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "buddySetupDone : re-intt cloud kit not needed",  v9,  2u);
    }
  }

  self->_reinitAfterBuddy = 0;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
  [v8 endTransaction:@"com.apple.bluetooth.user.services.mpcloudkit.buddysetup"];
}

- (void)initializeCloudKit
{
  os_log_t v3 = sub_100060178("MagicPairing");
  os_log_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "non manatee initializeCloudKit : start ",  v14,  2u);
  }

  v5 = (CKContainer *)objc_claimAutoreleasedReturnValue( +[CKContainer containerWithIdentifier:]( &OBJC_CLASS___CKContainer,  "containerWithIdentifier:",  @"com.apple.bluetooth"));
  cloudKitContainer = self->_cloudKitContainer;
  self->_cloudKitContainer = v5;

  os_log_t v7 = (CKDatabase *)objc_claimAutoreleasedReturnValue(-[CKContainer privateCloudDatabase](self->_cloudKitContainer, "privateCloudDatabase"));
  cloudKitDatabase = self->_cloudKitDatabase;
  self->_cloudKitDatabase = v7;

  os_log_t v9 = -[CKRecordZone initWithZoneName:]( objc_alloc(&OBJC_CLASS___CKRecordZone),  "initWithZoneName:",  @"MagicCloudPairingCustomKeyBlobZone");
  recordZoneBlob = self->_recordZoneBlob;
  self->_recordZoneBlob = v9;

  BOOL v11 = -[CKRecordZone initWithZoneName:]( objc_alloc(&OBJC_CLASS___CKRecordZone),  "initWithZoneName:",  @"MagicCloudPairingCustomAccessoryZone");
  recordZoneAccessoryDatabase = self->_recordZoneAccessoryDatabase;
  self->_recordZoneAccessoryDatabase = v11;

  self->_isWriteMasterKeysInProgress = 0;
  -[MPCloudKit pushEnable](self, "pushEnable");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v13 addObserver:self selector:"accountStatusDidChange:" name:CKAccountChangedNotification object:0];

  -[MPCloudKit accountStatusDidChange:](self, "accountStatusDidChange:", 0LL);
}

- (id)readUserPreference:(id)a3
{
  return (id)(id)CFPreferencesCopyValue( (CFStringRef)a3,  kCFPreferencesCurrentApplication,  kCFPreferencesCurrentUser,  kCFPreferencesAnyHost);
}

- (void)setuserPreference:(id)a3 value:(id)a4 sync:(BOOL)a5
{
  BOOL v5 = a5;
  os_log_t v7 = (__CFString *)a3;
  id v8 = a4;
  os_log_t v9 = sub_100060178("MagicPairing");
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    v14 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[setSystemPreference] prefName %@\n",  (uint8_t *)&v13,  0xCu);
  }

  CFPreferencesSetValue(v7, v8, kCFPreferencesCurrentApplication, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  if (v5 && !CFPreferencesSynchronize(@"com.apple.cloudpaird", kCFPreferencesCurrentUser, kCFPreferencesAnyHost))
  {
    os_log_t v11 = sub_100060178("MagicPairing");
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[setSystemPreference] syncs returns false\n",  (uint8_t *)&v13,  2u);
    }
  }
}

- (void)removeuserPreference:(id)a3 sync:(BOOL)a4
{
  BOOL v4 = a4;
  CFPreferencesSetValue( (CFStringRef)a3,  0LL,  @"com.apple.cloudpaird",  kCFPreferencesCurrentUser,  kCFPreferencesAnyHost);
  if (v4 && !CFPreferencesSynchronize(@"com.apple.cloudpaird", kCFPreferencesCurrentUser, kCFPreferencesAnyHost))
  {
    os_log_t v5 = sub_100060178("MagicPairing");
    os_log_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)os_log_t v7 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[setSystemPreference] syncs returns false\n",  v7,  2u);
    }
  }

- (void)accountStatusDidChange:(id)a3
{
  id v4 = a3;
  unsigned int v5 = -[MPCloudKit manateeZoneUpgraded](self, "manateeZoneUpgraded");
  os_log_t v6 = sub_100060178("MagicPairing");
  os_log_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "accountStatusDidChange check on manatee side",  (uint8_t *)buf,  2u);
    }

    os_log_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit_Manatee sharedInstance](&OBJC_CLASS___MPCloudKit_Manatee, "sharedInstance"));
    [v9 getAccountStatus];
  }

  else
  {
    if (v8)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "accountStatusDidChange calling accountStatusWithCompletionHandler",  (uint8_t *)buf,  2u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit cloudKitContainer](self, "cloudKitContainer"));
    if (!v10)
    {
      os_log_t v11 = sub_100060178("MagicPairing");
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "non-Manatee accountStatusDidChange cloudKitContainer is nil",  (uint8_t *)buf,  2u);
      }

      -[MPCloudKit initializeCloudKit](self, "initializeCloudKit");
    }

    objc_initWeak(buf, self);
    int v13 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit cloudKitContainer](self, "cloudKitContainer"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100061118;
    v14[3] = &unk_100208288;
    objc_copyWeak(&v15, buf);
    [v13 accountStatusWithCompletionHandler:v14];

    objc_destroyWeak(&v15);
    objc_destroyWeak(buf);
  }
}

- (void)setupSubscriptions
{
}

- (void)fetchAccountStatusWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit cloudKitContainer](self, "cloudKitContainer"));

  if (v5)
  {
    cloudKitContainer = self->_cloudKitContainer;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100061750;
    v10[3] = &unk_1002082B0;
    id v11 = v4;
    -[CKContainer accountInfoWithCompletionHandler:](cloudKitContainer, "accountInfoWithCompletionHandler:", v10);
    os_log_t v7 = v11;
LABEL_7:

    goto LABEL_8;
  }

  os_log_t v8 = sub_100060178("MagicPairing");
  os_log_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "non-Manatee fetchAccountStatusWithCompletion cloudKitContainer is nil",  buf,  2u);
  }

  if (v4)
  {
    os_log_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"CloudKit Account Not Active",  0LL,  0LL));
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0LL, v7);
    goto LABEL_7;
  }

- (void)_pushTimerFired:(id)a3
{
  id v4 = a3;
  os_log_t v5 = sub_100060178("MagicPairing");
  os_log_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "MP Push Timer Fired: %@", buf, 0xCu);
  }

  os_log_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit pushTimer](self, "pushTimer"));
  if (v7)
  {
    os_log_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit pushTimer](self, "pushTimer"));
    [v8 invalidate];

    -[MPCloudKit setPushTimer:](self, "setPushTimer:", 0LL);
  }

  if (-[MPCloudKit manateeZoneUpgraded](self, "manateeZoneUpgraded"))
  {
    os_log_t v9 = sub_100060178("MagicPairing");
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "MP Push Timer fired but we are now upgraded to manatee",  buf,  2u);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit_Manatee sharedInstance](&OBJC_CLASS___MPCloudKit_Manatee, "sharedInstance"));
    [v11 fetchAccessoryKeyBlob:0];
  }

  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100061918;
    block[3] = &unk_100206058;
    block[4] = self;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (void)fetchKeyBlob:(unint64_t)a3
{
  os_log_t v5 = sub_100060178("MagicPairing");
  os_log_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v30 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "MP fetchKeyBlob: %lu", buf, 0xCu);
  }

  if (-[MPCloudKit manateeZoneUpgraded](self, "manateeZoneUpgraded"))
  {
    os_log_t v7 = (CKRecordID *)objc_claimAutoreleasedReturnValue(+[MPCloudKit_Manatee sharedInstance](&OBJC_CLASS___MPCloudKit_Manatee, "sharedInstance"));
    -[CKRecordID fetchKeyBlob:](v7, "fetchKeyBlob:", 0LL);
    goto LABEL_24;
  }

  if (-[MPCloudKit isWriteMasterKeysInProgress](self, "isWriteMasterKeysInProgress"))
  {
    os_log_t v8 = sub_100060178("MagicPairing");
    os_log_t v7 = (CKRecordID *)objc_claimAutoreleasedReturnValue(v8);
    if (!os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    *(_WORD *)buf = 0;
    os_log_t v9 = "MP already writing new key";
    goto LABEL_8;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit masterBlob](self, "masterBlob"));
  id v13 = [v12 length];

  if (v13 != (id)33)
  {
    if (a3 >= 5)
    {
      os_log_t v19 = sub_100060178("MagicPairing");
      os_log_t v7 = (CKRecordID *)objc_claimAutoreleasedReturnValue(v19);
      if (!os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      *(_DWORD *)buf = 134217984;
      unint64_t v30 = a3;
      os_log_t v9 = "MP Exhausted all retries...: %lu";
      v10 = (os_log_s *)v7;
      uint32_t v11 = 12;
      goto LABEL_9;
    }

    if (-[MPCloudKit isFetchMasterKeyInProgress](self, "isFetchMasterKeyInProgress"))
    {
      os_log_t v20 = sub_100060178("MagicPairing");
      os_log_t v7 = (CKRecordID *)objc_claimAutoreleasedReturnValue(v20);
      if (!os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      *(_WORD *)buf = 0;
      os_log_t v9 = "MP fetchKeyBlob already fetching defer";
    }

    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneBlob](self, "recordZoneBlob"));

      if (v21)
      {
        -[MPCloudKit setIsFetchMasterKeyInProgress:](self, "setIsFetchMasterKeyInProgress:", 1LL);
        -[MPCloudKit setMasterBlob:](self, "setMasterBlob:", 0LL);
        v22 = objc_alloc(&OBJC_CLASS___CKRecordID);
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneBlob](self, "recordZoneBlob"));
        v24 = (void *)objc_claimAutoreleasedReturnValue([v23 zoneID]);
        os_log_t v7 = -[CKRecordID initWithRecordName:zoneID:]( v22,  "initWithRecordName:zoneID:",  @"EncryptedMasterKeyBlob",  v24);

        v25 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
        [v25 beginTransaction:@"fetchKeyBlob"];

        v26 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit cloudKitDatabase](self, "cloudKitDatabase"));
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472LL;
        v28[2] = sub_100061D60;
        v28[3] = &unk_1002082F8;
        v28[4] = self;
        v28[5] = a3;
        [v26 fetchRecordWithID:v7 completionHandler:v28];

        goto LABEL_24;
      }

      os_log_t v27 = sub_100060178("MagicPairing");
      os_log_t v7 = (CKRecordID *)objc_claimAutoreleasedReturnValue(v27);
      if (!os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      *(_WORD *)buf = 0;
      os_log_t v9 = "non-Manatee recordZoneBlob is nil";
    }

- (void)checkAccountStatusWithCompletionHandler:(id)a3
{
}

- (void)checkAccountStatusWithCompletionHandler:(id)a3 withRetryCount:(unint64_t)a4
{
  id v6 = a3;
  if (a4 < 5)
  {
    objc_initWeak((id *)buf, self);
    os_log_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit cloudKitContainer](self, "cloudKitContainer"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100062774;
    v10[3] = &unk_100208348;
    objc_copyWeak(v12, (id *)buf);
    void v10[4] = self;
    id v11 = v6;
    v12[1] = (id)a4;
    [v9 accountStatusWithCompletionHandler:v10];

    objc_destroyWeak(v12);
    objc_destroyWeak((id *)buf);
  }

  else
  {
    os_log_t v7 = sub_100060178("MagicPairing");
    os_log_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      os_log_t v14 = "-[MPCloudKit checkAccountStatusWithCompletionHandler:withRetryCount:]";
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "MP Exhausted all account retries: %s",  buf,  0xCu);
    }
  }
}

- (void)fetchAccessoryKeyBlob:(unint64_t)a3
{
  if (-[MPCloudKit manateeZoneUpgraded](self, "manateeZoneUpgraded"))
  {
    os_log_t v5 = sub_100060178("MagicPairing");
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Accessory zone has been upgraded. Dont generate keys",  buf,  2u);
    }

    os_log_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit_Manatee sharedInstance](&OBJC_CLASS___MPCloudKit_Manatee, "sharedInstance"));
    [v7 fetchAccessoryKeyBlob:a3];
LABEL_5:

    return;
  }

  if (-[MPCloudKit shouldPauseFetch](self, "shouldPauseFetch"))
  {
    os_log_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit_Manatee sharedInstance](&OBJC_CLASS___MPCloudKit_Manatee, "sharedInstance"));
    unsigned int v9 = [v8 shouldPauseFetch];

    if (v9)
    {
      os_log_t v10 = sub_100060178("MagicPairing");
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (char *)objc_claimAutoreleasedReturnValue(-[MPCloudKit pauseErrorReason](self, "pauseErrorReason"));
        *(_DWORD *)buf = 138412290;
        v28 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Fetch is currently paused due to: %@",  buf,  0xCu);
      }

- (void)updateCloudKitBlobZone:(id)a3
{
  id v4 = a3;
  if (!-[MPCloudKit manateeZoneUpgraded](self, "manateeZoneUpgraded"))
  {
    os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[MPCloudKit readUserPreference:]( self,  "readUserPreference:",  @"MagicCloudPairingManateeUpgradedAccount"));

    if (v5)
    {
      os_log_t v6 = sub_100060178("MagicPairing");
      os_log_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Accessory zone has been upgraded. Dont generate keys",  buf,  2u);
      }
    }

    else
    {
      unsigned int v8 = -[MPCloudKit isWriteMasterKeysInProgress](self, "isWriteMasterKeysInProgress");
      os_log_t v9 = sub_100060178("MagicPairing");
      os_log_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      if (v8)
      {
        if (v11)
        {
          *(_WORD *)os_log_t v13 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "updateCloudKitBlobZone already in the process...",  v13,  2u);
        }
      }

      else
      {
        if (v11)
        {
          *(_WORD *)v12 = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "updating CloudKit Blob", v12, 2u);
        }

        -[MPCloudKit setIsWriteMasterKeysInProgress:](self, "setIsWriteMasterKeysInProgress:", 1LL);
        -[MPCloudKit modifyKeyBlob:withRetryCount:](self, "modifyKeyBlob:withRetryCount:", v4, 0LL);
      }
    }
  }
}

- (void)modifyKeyBlob:(id)a3 withRetryCount:(unint64_t)a4
{
  id v6 = a3;
  os_log_t v7 = sub_100060178("MagicPairing");
  unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v20 = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "modifyKeyBlob with retry count: %lu", buf, 0xCu);
  }

  os_log_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
  [v9 beginTransaction:@"modifyKeyBlob"];

  os_log_t v10 = objc_alloc(&OBJC_CLASS___CKRecordID);
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneBlob](self, "recordZoneBlob"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 zoneID]);
  os_log_t v13 = -[CKRecordID initWithRecordName:zoneID:]( v10,  "initWithRecordName:zoneID:",  @"EncryptedMasterKeyBlob",  v12);

  os_log_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit cloudKitDatabase](self, "cloudKitDatabase"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000636CC;
  v16[3] = &unk_100208390;
  id v17 = v6;
  unint64_t v18 = a4;
  v16[4] = self;
  id v15 = v6;
  [v14 fetchRecordWithID:v13 completionHandler:v16];
}

- (void)handleModifyMasterKeyError:(id)a3 forBlob:(id)a4 withRetryCount:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8 || a5 > 3) {
    goto LABEL_17;
  }
  os_log_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]);
  if ([v10 isEqualToString:CKErrorDomain]
    && ([v8 code] == (id)3
     || [v8 code] == (id)7
     || [v8 code] == (id)4
     || [v8 code] == (id)9
     || [v8 code] == (id)6))
  {

    os_log_t v11 = sub_100060178("MagicPairing");
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v28 = v8;
      __int16 v29 = 2048;
      unint64_t v30 = a5;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Updating master key failed with error %@, retry count = %lu",  buf,  0x16u);
    }

    os_log_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 userInfo]);
    os_log_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:CKErrorRetryAfterKey]);

    if (v14)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 userInfo]);
      os_log_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:CKErrorRetryAfterKey]);
      [v16 doubleValue];
      double v18 = v17;

      dispatch_time_t v19 = dispatch_time(0LL, (uint64_t)(v18 * 1000000000.0));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100063D84;
      block[3] = &unk_1002071F0;
      block[4] = self;
      id v25 = v9;
      unint64_t v26 = a5;
      dispatch_after(v19, &_dispatch_main_q, block);

      goto LABEL_18;
    }

- (void)writeKeyBlob:(id)a3 withRetryCount:(unint64_t)a4
{
  id v6 = a3;
  if (!-[MPCloudKit manateeZoneUpgraded](self, "manateeZoneUpgraded"))
  {
    os_log_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[MPCloudKit readUserPreference:]( self,  "readUserPreference:",  @"MagicCloudPairingManateeUpgradedAccount"));

    BOOL v8 = v7 == 0LL;
    os_log_t v9 = sub_100060178("MagicPairing");
    os_log_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneBlob](self, "recordZoneBlob"));
        os_log_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 zoneID]);
        os_log_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 zoneName]);
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  " >>>writeKeyBlob  Record Zone %@",  (uint8_t *)&buf,  0xCu);
      }

      id v15 = objc_alloc(&OBJC_CLASS___CKRecordID);
      os_log_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneBlob](self, "recordZoneBlob"));
      double v17 = (void *)objc_claimAutoreleasedReturnValue([v16 zoneID]);
      os_log_t v10 = -[CKRecordID initWithRecordName:zoneID:]( v15,  "initWithRecordName:zoneID:",  @"EncryptedMasterKeyBlob",  v17);

      double v18 = -[CKRecord initWithRecordType:recordID:]( objc_alloc(&OBJC_CLASS___CKRecord),  "initWithRecordType:recordID:",  @"MasterKey",  v10);
      *(void *)&__int128 buf = 0LL;
      *((void *)&buf + 1) = &buf;
      uint64_t v50 = 0x3032000000LL;
      v51 = sub_10006427C;
      v52 = sub_10006428C;
      id v53 = 0LL;
      v43[0] = 0LL;
      v43[1] = v43;
      v43[2] = 0x2020000000LL;
      char v44 = 0;
      dispatch_semaphore_t v19 = dispatch_semaphore_create(0LL);
      unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValues](v18, "encryptedValues"));
      [v20 setObject:v6 forKeyedSubscript:@"EncryptedMasterKeyBlob"];

      os_log_t v21 = sub_100060178("MagicPairing");
      os_log_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v45 = 138412290;
        id v46 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "writeKeyBlob: kMagicCloudPairingProtectedMasterBlob fetch: encryptedBlob %@",  v45,  0xCu);
      }

      v23 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
      [v23 beginTransaction:@"writeKeyBlob"];

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit cloudKitDatabase](self, "cloudKitDatabase"));
      id v25 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneBlob](self, "recordZoneBlob"));
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472LL;
      v36[2] = sub_100064294;
      v36[3] = &unk_1002083E0;
      v41 = v43;
      unint64_t v42 = a4;
      p___int128 buf = &buf;
      v36[4] = self;
      id v37 = v6;
      unint64_t v26 = v18;
      v38 = v26;
      os_log_t v27 = v19;
      v39 = v27;
      [v24 saveRecordZone:v25 completionHandler:v36];

      dispatch_time_t v28 = dispatch_time(0LL, 60000000000LL);
      dispatch_semaphore_wait(v27, v28);
      -[MPCloudKit setIsWriteMasterKeysInProgress:](self, "setIsWriteMasterKeysInProgress:", 0LL);
      __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
      [v29 endTransaction:@"writeKeyBlob"];

      if (*(void *)(*((void *)&buf + 1) + 40LL))
      {
        os_log_t v30 = sub_100060178("MagicPairing");
        v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneBlob](self, "recordZoneBlob"));
          v33 = (void *)objc_claimAutoreleasedReturnValue([v32 zoneID]);
          v34 = (void *)objc_claimAutoreleasedReturnValue([v33 zoneName]);
          uint64_t v35 = *(void *)(*((void *)&buf + 1) + 40LL);
          *(_DWORD *)v45 = 138412546;
          id v46 = v34;
          __int16 v47 = 2112;
          uint64_t v48 = v35;
          _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  " >>>writeKeyBlob  Record Zone %@ failed with error %@",  v45,  0x16u);
        }
      }

      _Block_object_dispose(v43, 8);
      _Block_object_dispose(&buf, 8);
    }

    else if (v11)
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Accessory zone has been upgraded. Dont generate keys",  (uint8_t *)&buf,  2u);
    }
  }
}

- (void)updateCloudKitAccessoryZone:(id)a3 delete:(BOOL)a4
{
  id v6 = a3;
  if (!-[MPCloudKit manateeZoneUpgraded](self, "manateeZoneUpgraded"))
  {
    os_log_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[MPCloudKit readUserPreference:]( self,  "readUserPreference:",  @"MagicCloudPairingManateeUpgradedAccount"));

    if (v7)
    {
      os_log_t v8 = sub_100060178("MagicPairing");
      os_log_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Accessory zone has been upgraded. Dont update keys to this container",  buf,  2u);
      }
    }

    else if (-[MPCloudKit isAccountActive](self, "isAccountActive"))
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100064B14;
      block[3] = &unk_100208458;
      BOOL v14 = a4;
      v12 = (os_log_s *)v6;
      os_log_t v13 = self;
      dispatch_async(&_dispatch_main_q, block);
      os_log_t v9 = v12;
    }

    else
    {
      os_log_t v10 = sub_100060178("MagicPairing");
      os_log_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10018F354();
      }
    }
  }
}

- (void)modifyAccessoryBlob:(id)a3 withRetryCount:(unint64_t)a4
{
  id v6 = a3;
  os_log_t v7 = sub_100060178("MagicPairing");
  os_log_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 134217984;
    unint64_t v23 = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, " >>> modifyAccessoryBlob - %lu", buf, 0xCu);
  }

  dispatch_semaphore_t v9 = dispatch_semaphore_create(0LL);
  os_log_t v10 = objc_alloc(&OBJC_CLASS___CKRecordID);
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 zoneID]);
  os_log_t v13 = -[CKRecordID initWithRecordName:zoneID:]( v10,  "initWithRecordName:zoneID:",  @"EncryptedAccessoryBlob",  v12);

  objc_initWeak((id *)buf, self);
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit cloudKitDatabase](self, "cloudKitDatabase"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100065080;
  v18[3] = &unk_100208480;
  id v15 = v9;
  dispatch_semaphore_t v19 = v15;
  objc_copyWeak(v21, (id *)buf);
  id v16 = v6;
  id v20 = v16;
  v21[1] = (id)a4;
  [v14 fetchRecordWithID:v13 completionHandler:v18];

  dispatch_time_t v17 = dispatch_time(0LL, 60000000000LL);
  dispatch_semaphore_wait(v15, v17);

  objc_destroyWeak(v21);
  objc_destroyWeak((id *)buf);
}

- (void)handleAccessoryKeyModifyError:(id)a3 forBlob:(id)a4 withRetryCount:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8) {
    goto LABEL_37;
  }
  if (a5 >= 5)
  {
    os_log_t v10 = sub_100060178("MagicPairing");
    BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10018F4D4();
    }

    goto LABEL_37;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]);
  if ([v12 isEqualToString:CKErrorDomain])
  {
    if ([v8 code] == (id)3 || objc_msgSend(v8, "code") == (id)4 || objc_msgSend(v8, "code") == (id)9)
    {

      goto LABEL_11;
    }

    id v28 = [v8 code];

    if (v28 == (id)6)
    {
LABEL_11:
      os_log_t v13 = sub_100060178("MagicPairing");
      BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10018F534();
      }
LABEL_36:

      v34 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
      v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  v35,  @"kUploadStatus",  0LL));
      [v34 sendCloudKitMsg:@"DeviceInfoUploadStatus" args:v36];

      goto LABEL_37;
    }
  }

  else
  {
  }

  if ([v8 code] == (id)7)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 userInfo]);
    id v16 = CKErrorRetryAfterKey;
    dispatch_time_t v17 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:CKErrorRetryAfterKey]);
    if (v17)
    {

LABEL_21:
      dispatch_semaphore_t v19 = (void *)objc_claimAutoreleasedReturnValue([v8 userInfo]);
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:v16]);
      [v20 doubleValue];
      double v22 = v21;

      os_log_t v23 = sub_100060178("MagicPairing");
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      double v25 = v22 + 10.0;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412802;
        id v44 = v8;
        __int16 v45 = 2048;
        unint64_t v46 = a5;
        __int16 v47 = 2048;
        unint64_t v48 = (unint64_t)v25;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "modify AccessoryBlob failed with error %@, retry count = %lu, retry time: %lu",  buf,  0x20u);
      }

      dispatch_time_t v26 = dispatch_time(0LL, (uint64_t)(v25 * 1000000000.0));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100065C74;
      block[3] = &unk_1002071F0;
      void block[4] = self;
      id v41 = v9;
      unint64_t v42 = a5;
      dispatch_after(v26, &_dispatch_main_q, block);

      goto LABEL_37;
    }

    int IsCode = CKErrorIsCode(v8, 15LL);

    if (IsCode) {
      goto LABEL_21;
    }
  }

  else if (CKErrorIsCode(v8, 15LL))
  {
    id v16 = CKErrorRetryAfterKey;
    goto LABEL_21;
  }

  os_log_t v27 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]);
  if (![v27 isEqualToString:CKErrorDomain])
  {

    goto LABEL_34;
  }

  if ([v8 code] != (id)26)
  {
    id v29 = [v8 code];

    if (v29 == (id)11) {
      goto LABEL_31;
    }
LABEL_34:
    os_log_t v33 = sub_100060178("MagicPairing");
    BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10018F5F4();
    }
    goto LABEL_36;
  }

LABEL_31:
  os_log_t v30 = sub_100060178("MagicPairing");
  v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
    sub_10018F594();
  }

  objc_initWeak((id *)buf, self);
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit modifyOperationQueue](self, "modifyOperationQueue"));
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_100065DA0;
  v37[3] = &unk_1002084D0;
  objc_copyWeak(&v39, (id *)buf);
  id v38 = v9;
  [v32 addOperationWithBlock:v37];

  objc_destroyWeak(&v39);
  objc_destroyWeak((id *)buf);
LABEL_37:
}

- (void)writeAccessoryBlob:(id)a3 withRetryCount:(unint64_t)a4
{
  id v6 = a3;
  if (!-[MPCloudKit manateeZoneUpgraded](self, "manateeZoneUpgraded"))
  {
    os_log_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[MPCloudKit readUserPreference:]( self,  "readUserPreference:",  @"MagicCloudPairingManateeUpgradedAccount"));

    os_log_t v8 = sub_100060178("MagicPairing");
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v10)
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Accessory zone has been upgraded. Dont generate keys",  buf,  2u);
      }
    }

    else
    {
      if (v10)
      {
        BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
        v12 = (void *)objc_claimAutoreleasedReturnValue([v11 zoneID]);
        os_log_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 zoneName]);
        *(_DWORD *)__int128 buf = 138412290;
        id v34 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  " >>> writeAccessoryBlob Record Zone %@",  buf,  0xCu);
      }

      BOOL v14 = objc_alloc(&OBJC_CLASS___CKRecordID);
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 zoneID]);
      id v9 = -[CKRecordID initWithRecordName:zoneID:]( v14,  "initWithRecordName:zoneID:",  @"EncryptedAccessoryBlob",  v16);

      dispatch_time_t v17 = -[CKRecord initWithRecordType:recordID:]( objc_alloc(&OBJC_CLASS___CKRecord),  "initWithRecordType:recordID:",  @"AccessoryDatabase",  v9);
      double v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValues](v17, "encryptedValues"));
      [v18 setObject:v6 forKeyedSubscript:@"EncryptedAccessoryBlob"];

      os_log_t v19 = sub_100060178("MagicPairing");
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        id v34 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "writeAccessoryBlob: MagicCloudPairingProtectedAccessoryBlob fetch:  encryptedBlob %@",  buf,  0xCu);
      }

      double v21 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
      [v21 beginTransaction:@"WriteAccessoryBlob"];

      dispatch_semaphore_t v22 = dispatch_semaphore_create(0LL);
      os_log_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit cloudKitDatabase](self, "cloudKitDatabase"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472LL;
      v28[2] = sub_10006611C;
      v28[3] = &unk_100208520;
      v28[4] = self;
      id v29 = v17;
      unint64_t v32 = a4;
      id v30 = v6;
      dispatch_semaphore_t v31 = v22;
      double v25 = v22;
      dispatch_time_t v26 = v17;
      [v23 saveRecordZone:v24 completionHandler:v28];

      dispatch_time_t v27 = dispatch_time(0LL, 60000000000LL);
      dispatch_semaphore_wait(v25, v27);
    }
  }
}

- (void)deleteCloudKitAccessoryZone
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
  os_log_t v4 = sub_100060178("MagicPairing");
  os_log_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
    os_log_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneID]);
    os_log_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneName]);
    *(_DWORD *)__int128 buf = 138412290;
    double v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, " >>> deleteCloudKitAccessoryZone %@", buf, 0xCu);
  }

  id v9 = objc_alloc(&OBJC_CLASS___CKRecordID);
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneID]);
  v12 = -[CKRecordID initWithRecordName:zoneID:](v9, "initWithRecordName:zoneID:", @"EncryptedAccessoryBlob", v11);

  os_log_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit cloudKitDatabase](self, "cloudKitDatabase"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100066BCC;
  v18[3] = &unk_100208548;
  dispatch_semaphore_t v19 = v3;
  BOOL v14 = v3;
  [v13 deleteRecordWithID:v12 completionHandler:v18];

  dispatch_time_t v15 = dispatch_time(0LL, 60000000000LL);
  dispatch_semaphore_wait(v14, v15);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
  dispatch_time_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 deviceManager]);
  [v17 deleteLegacyMagicPairingRecordsWithUserInitiated:1 completion:&stru_100208568];
}

- (void)createSubscritionForRecordType:(id)a3
{
  os_log_t v4 = (os_log_s *)a3;
  unsigned int v5 = -[MPCloudKit manateeZoneUpgraded](self, "manateeZoneUpgraded");
  os_log_t v6 = sub_100060178("MagicPairing");
  os_log_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Setup manatee zone for push notifications",  buf,  2u);
    }

    goto LABEL_23;
  }

  if (v8)
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v34 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "createSubscritionForRecordType: %@", buf, 0xCu);
  }

  if (-[os_log_s isEqualToString:](v4, "isEqualToString:", @"EncryptedMasterKeyBlob"))
  {
    id v9 = objc_alloc(&OBJC_CLASS___CKRecordZoneSubscription);
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneBlob](self, "recordZoneBlob"));
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneID]);
    os_log_t v7 = -[CKRecordZoneSubscription initWithZoneID:](v9, "initWithZoneID:", v11);

    uint64_t v12 = objc_claimAutoreleasedReturnValue( -[MPCloudKit readUserPreference:]( self,  "readUserPreference:",  @"MagicCloudPairingMasterSubscriptionID"));
    if (v12)
    {
      os_log_t v13 = (os_log_s *)v12;
      os_log_t v14 = sub_100060178("MagicPairing");
      dispatch_time_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        id v34 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Master subscription already exists: %@",  buf,  0xCu);
      }

      goto LABEL_22;
    }

    dispatch_semaphore_t v19 = objc_alloc(&OBJC_CLASS___CKRecordZoneSubscription);
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneBlob](self, "recordZoneBlob"));
    double v21 = (void *)objc_claimAutoreleasedReturnValue([v20 zoneID]);
    dispatch_semaphore_t v22 = -[CKRecordZoneSubscription initWithZoneID:](v19, "initWithZoneID:", v21);

    os_log_t v23 = @"MagicCloudPairingMasterSubscriptionID";
    os_log_t v7 = v22;
    goto LABEL_18;
  }

  if (!-[os_log_s isEqualToString:](v4, "isEqualToString:", @"EncryptedAccessoryBlob"))
  {
LABEL_20:
    os_log_t v26 = sub_100060178("MagicPairing");
    os_log_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    os_log_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneBlob](self, "recordZoneBlob"));
    dispatch_time_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s zoneID](v13, "zoneID"));
    id v28 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
    id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 zoneID]);
    *(_DWORD *)__int128 buf = 138412546;
    id v34 = v27;
    __int16 v35 = 2112;
    v36 = v29;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Unable to create zone subscription key %@ or Accessory %@",  buf,  0x16u);

LABEL_22:
    goto LABEL_23;
  }

  uint64_t v16 = objc_claimAutoreleasedReturnValue( -[MPCloudKit readUserPreference:]( self,  "readUserPreference:",  @"MagicCloudPairingAccessorySubscriptionID"));
  if (!v16)
  {
    v24 = objc_alloc(&OBJC_CLASS___CKRecordZoneSubscription);
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
    double v21 = (void *)objc_claimAutoreleasedReturnValue([v20 zoneID]);
    os_log_t v7 = -[CKRecordZoneSubscription initWithZoneID:](v24, "initWithZoneID:", v21);
    os_log_t v23 = @"MagicCloudPairingAccessorySubscriptionID";
LABEL_18:

    if (v7)
    {
      double v25 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit cloudKitDatabase](self, "cloudKitDatabase"));
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472LL;
      v30[2] = sub_1000671B0;
      v30[3] = &unk_100208590;
      dispatch_semaphore_t v31 = (__CFString *)v23;
      unint64_t v32 = self;
      [v25 saveSubscription:v7 completionHandler:v30];

      goto LABEL_23;
    }

    goto LABEL_20;
  }

  os_log_t v7 = (os_log_s *)v16;
  os_log_t v17 = sub_100060178("MagicPairing");
  double v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v34 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Accessory subscription already exists: %@",  buf,  0xCu);
  }

LABEL_23:
}

- (void)fetchSubscriptionForRecordType:(id)a3 andPrefKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit readUserPreference:](self, "readUserPreference:", v7));
  os_log_t v9 = sub_100060178("MagicPairing");
  BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412546;
    dispatch_semaphore_t v22 = v8;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Verify Fetch cached Subscription ID - %@ for record - %@",  buf,  0x16u);
  }

  os_log_t v11 = sub_100060178("MagicPairing");
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v13)
    {
      *(_DWORD *)__int128 buf = 138412290;
      dispatch_semaphore_t v22 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Found cached Subscription ID - %@",  buf,  0xCu);
    }

    os_log_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit cloudKitDatabase](self, "cloudKitDatabase"));
    dispatch_time_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit readUserPreference:](self, "readUserPreference:", v7));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100067654;
    v16[3] = &unk_1002085B8;
    id v17 = v8;
    double v18 = self;
    id v19 = v7;
    id v20 = v6;
    [v14 fetchSubscriptionWithID:v15 completionHandler:v16];
  }

  else
  {
    if (v13)
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Subscription cannot be Fetched, create it...",  buf,  2u);
    }

    -[MPCloudKit createSubscritionForRecordType:](self, "createSubscritionForRecordType:", v6);
  }
}

- (void)verifyAndCacheSubscriptionID:(id)a3
{
  id v4 = a3;
  os_log_t v5 = sub_100060178("MagicPairing");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "verifyAndCacheSubscriptionID - %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit cloudKitDatabase](self, "cloudKitDatabase"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100067A04;
  v9[3] = &unk_1002085E0;
  objc_copyWeak(&v11, (id *)buf);
  id v8 = v4;
  id v10 = v8;
  [v7 fetchSubscriptionWithID:v8 completionHandler:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

- (void)removeSubscritionForRecordType:(id)a3
{
  id v4 = a3;
  v13[0] = 0LL;
  v13[1] = v13;
  v13[2] = 0x2020000000LL;
  char v14 = 0;
  os_log_t v5 = sub_100060178("MagicPairing");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v16 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Attempting to delete Subscription for record type - %@ ",  buf,  0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit cloudKitDatabase](self, "cloudKitDatabase"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100067D80;
  v9[3] = &unk_100208630;
  objc_copyWeak(&v12, (id *)buf);
  id v8 = v4;
  id v10 = v8;
  id v11 = v13;
  [v7 fetchAllSubscriptionsWithCompletionHandler:v9];

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
  _Block_object_dispose(v13, 8);
}

- (id)apsEnvironmentString
{
  uint64_t v3 = xpc_copy_entitlement_for_token("aps-environment", 0LL);
  id v4 = (void *)v3;
  uint64_t v22 = 0LL;
  __int16 v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  double v25 = sub_10006427C;
  os_log_t v26 = sub_10006428C;
  id v27 = 0LL;
  if (v3)
  {
    uint64_t v5 = _CFXPCCreateCFObjectFromXPCObject(v3);
    id v6 = (void *)v23[5];
    v23[5] = v5;

    id v7 = (void *)v23[5];
    if (v7)
    {
      if (![v7 compare:CKPushEnvironmentServerPreferred options:1])
      {
        dispatch_semaphore_t v8 = dispatch_semaphore_create(0LL);
        os_log_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit cloudKitContainer](self, "cloudKitContainer"));
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472LL;
        v19[2] = sub_1000684A8;
        v19[3] = &unk_100208658;
        double v21 = &v22;
        id v10 = v8;
        id v20 = v10;
        [v9 serverPreferredPushEnvironmentWithCompletionHandler:v19];

        dispatch_time_t v11 = dispatch_time(0LL, 2000000000LL);
        if (dispatch_semaphore_wait(v10, v11))
        {
          os_log_t v12 = sub_100060178("MagicPairing");
          id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)__int128 buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Timeout getting server preferred push environment",  buf,  2u);
          }
        }
      }
    }
  }

  char v14 = (void *)v23[5];
  if (!v14) {
    char v14 = (void *)APSEnvironmentProduction;
  }
  id v15 = v14;
  os_log_t v16 = sub_100060178("MagicPairing");
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v29 = v15;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, ">>>>> Using push environment %@", buf, 0xCu);
  }

  _Block_object_dispose(&v22, 8);
  return v15;
}

- (id)hexStringForData:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  uint64_t v5 = (uint64_t)[v3 length];
  id v6 = v3;
  id v7 = (unsigned __int8 *)[v6 bytes];
  if (v5 >= 1)
  {
    dispatch_semaphore_t v8 = v7;
    do
    {
      unsigned int v9 = *v8++;
      objc_msgSend(v4, "appendFormat:", @"%02X", v9);
      --v5;
    }

    while (v5);
  }

  id v10 = [v4 copy];

  return v10;
}

- (void)pushEnable
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);

  if (![v4 length])
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 executablePath]);
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 lastPathComponent]);

    id v4 = (void *)v7;
  }

  os_log_t v8 = sub_100060178("MagicPairing");
  unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    os_log_t v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Enable Push Notification Updated for bundle ID: %@",  (uint8_t *)&v11,  0xCu);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[CloudPushService shared](&OBJC_CLASS____TtC15audioaccessoryd16CloudPushService, "shared"));
  [v10 addWithDelegate:self];
}

- (void)pushDisable
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[CloudPushService shared](&OBJC_CLASS____TtC15audioaccessoryd16CloudPushService, "shared"));
  [v3 removeWithDelegate:self];
}

- (BOOL)manateeZoneUpgraded
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[MPCloudKit readUserPreference:]( self,  "readUserPreference:",  @"MagicCloudPairingManateeUpgradedAccount"));

  if (v2)
  {
    os_log_t v3 = sub_100060178("MagicPairing");
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Master zone has been upgraded. Dont generate keys",  v6,  2u);
    }
  }

  return v2 != 0LL;
}

- (void)markLegacyNonManateeContainerMigrated
{
  os_log_t v3 = sub_100060178("MagicPairing");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneBlob](self, "recordZoneBlob"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneID]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneName]);
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  " >>>markLegacyNonManateeContainerMigrated  Record Zone %@",  (uint8_t *)&buf,  0xCu);
  }

  os_log_t v8 = self->_cloudKitDatabase;
  unsigned int v9 = objc_alloc(&OBJC_CLASS___CKRecordID);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneBlob](self, "recordZoneBlob"));
  int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneID]);
  os_log_t v12 = -[CKRecordID initWithRecordName:zoneID:](v9, "initWithRecordName:zoneID:", @"EncryptedMasterKeyBlob", v11);

  id v13 = objc_alloc(&OBJC_CLASS___CKRecordID);
  char v14 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 zoneID]);
  os_log_t v16 = -[CKRecordID initWithRecordName:zoneID:]( v13,  "initWithRecordName:zoneID:",  @"EncryptedAccessoryBlob",  v15);

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v49 = 0x3032000000LL;
  uint64_t v50 = sub_10006427C;
  v51 = sub_10006428C;
  v52 = -[CKRecord initWithRecordType:recordID:]( objc_alloc(&OBJC_CLASS___CKRecord),  "initWithRecordType:recordID:",  @"MasterKey",  v12);
  uint64_t v41 = 0LL;
  unint64_t v42 = &v41;
  uint64_t v43 = 0x3032000000LL;
  id v44 = sub_10006427C;
  __int16 v45 = sub_10006428C;
  unint64_t v46 = -[CKRecord initWithRecordType:recordID:]( objc_alloc(&OBJC_CLASS___CKRecord),  "initWithRecordType:recordID:",  @"AccessoryDatabase",  v16);
  __int16 v40 = -1;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v40, 2LL));
  double v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&buf + 1) + 40) encryptedValues]);
  [v18 setObject:v17 forKeyedSubscript:@"EncryptedMasterKeyBlob"];

  int v39 = -1;
  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v39, 4LL));
  id v20 = (void *)objc_claimAutoreleasedReturnValue([(id)v42[5] encryptedValues]);
  [v20 setObject:v19 forKeyedSubscript:@"EncryptedAccessoryBlob"];

  double v21 = objc_alloc(&OBJC_CLASS___CKFetchRecordsOperation);
  v47[0] = v12;
  v47[1] = v16;
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v47, 2LL));
  __int16 v23 = -[CKFetchRecordsOperation initWithRecordIDs:](v21, "initWithRecordIDs:", v22);

  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_100068CB0;
  v34[3] = &unk_100208680;
  uint64_t v24 = v12;
  __int16 v35 = v24;
  p___int128 buf = &buf;
  double v25 = v16;
  v36 = v25;
  id v38 = &v41;
  -[CKFetchRecordsOperation setPerRecordCompletionBlock:](v23, "setPerRecordCompletionBlock:", v34);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_100068F18;
  v28[3] = &unk_1002086F8;
  unint64_t v32 = &buf;
  v28[4] = self;
  os_log_t v26 = v24;
  id v29 = v26;
  os_log_t v33 = &v41;
  id v27 = v25;
  id v30 = v27;
  dispatch_semaphore_t v31 = v8;
  -[CKFetchRecordsOperation setCompletionBlock:](v23, "setCompletionBlock:", v28);
  -[CKDatabase addOperation:](v8, "addOperation:", v23);

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&buf, 8);
}

- (void)upgradeLegacyNonManateeContainerToManatee
{
  if (-[MPCloudKit manateeZoneUpgraded](self, "manateeZoneUpgraded"))
  {
    os_log_t v29 = sub_100060178("MagicPairing");
    os_log_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10018FB74();
    }
  }

  else
  {
    os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 networkMonitor]);
    unsigned __int8 v5 = [v4 isNetworkUp];

    os_log_t v6 = sub_100060178("MagicPairing");
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    os_log_t v8 = v7;
    if ((v5 & 1) != 0)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneBlob](self, "recordZoneBlob"));
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneID]);
        int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneName]);
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  " >>>upgradeLegacyNonManateeContainerToManatee Record Zone %@",  (uint8_t *)&buf,  0xCu);
      }

      os_log_t v8 = self->_cloudKitDatabase;
      os_log_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit_Manatee sharedInstance](&OBJC_CLASS___MPCloudKit_Manatee, "sharedInstance"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 cloudKitDatabase]);

      if (v13)
      {
        char v14 = objc_alloc(&OBJC_CLASS___CKRecordID);
        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneBlob](self, "recordZoneBlob"));
        os_log_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 zoneID]);
        id v17 = -[CKRecordID initWithRecordName:zoneID:]( v14,  "initWithRecordName:zoneID:",  @"EncryptedMasterKeyBlob",  v16);

        double v18 = objc_alloc(&OBJC_CLASS___CKRecordID);
        id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 zoneID]);
        double v21 = -[CKRecordID initWithRecordName:zoneID:]( v18,  "initWithRecordName:zoneID:",  @"EncryptedAccessoryBlob",  v20);

        *(void *)&__int128 buf = 0LL;
        *((void *)&buf + 1) = &buf;
        uint64_t v50 = 0x3032000000LL;
        v51 = sub_10006427C;
        v52 = sub_10006428C;
        id v53 = -[CKRecord initWithRecordType:recordID:]( objc_alloc(&OBJC_CLASS___CKRecord),  "initWithRecordType:recordID:",  @"MasterKey",  v17);
        v46[0] = 0LL;
        v46[1] = v46;
        v46[2] = 0x3032000000LL;
        v46[3] = sub_10006427C;
        v46[4] = sub_10006428C;
        __int16 v47 = -[CKRecord initWithRecordType:recordID:]( objc_alloc(&OBJC_CLASS___CKRecord),  "initWithRecordType:recordID:",  @"AccessoryDatabase",  v21);
        uint64_t v22 = objc_alloc(&OBJC_CLASS___CKFetchRecordsOperation);
        v48[0] = v17;
        v48[1] = v21;
        __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v48, 2LL));
        uint64_t v24 = -[CKFetchRecordsOperation initWithRecordIDs:](v22, "initWithRecordIDs:", v23);

        v41[0] = _NSConcreteStackBlock;
        v41[1] = 3221225472LL;
        v41[2] = sub_100069B08;
        v41[3] = &unk_100208680;
        double v25 = v17;
        unint64_t v42 = v25;
        p___int128 buf = &buf;
        os_log_t v26 = v21;
        uint64_t v43 = v26;
        __int16 v45 = v46;
        -[CKFetchRecordsOperation setPerRecordCompletionBlock:](v24, "setPerRecordCompletionBlock:", v41);
        dispatch_semaphore_t v31 = _NSConcreteStackBlock;
        uint64_t v32 = 3221225472LL;
        os_log_t v33 = sub_100069D70;
        id v34 = &unk_100208770;
        int v39 = &buf;
        __int16 v40 = v46;
        id v27 = v25;
        __int16 v35 = v27;
        id v28 = v26;
        v36 = v28;
        id v37 = self;
        id v38 = v13;
        -[CKFetchRecordsOperation setCompletionBlock:](v24, "setCompletionBlock:", &v31);
        -[os_log_s addOperation:](v8, "addOperation:", v24, v31, v32, v33, v34);

        _Block_object_dispose(v46, 8);
        _Block_object_dispose(&buf, 8);
      }

      else
      {
        os_log_t v30 = sub_100060178("MagicPairing");
        id v27 = (CKRecordID *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR)) {
          sub_10018FBA0();
        }
      }
    }

    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      sub_10018FBCC();
    }
  }
}

- (void)deleteLegacyMasterKey
{
  unsigned __int8 v3 = -[MPCloudKit isAccountActive](self, "isAccountActive");
  os_log_t v4 = sub_100060178("MagicPairing");
  unsigned __int8 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if ((v3 & 1) != 0)
  {
    if (v6)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneBlob](self, "recordZoneBlob"));
      os_log_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneID]);
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneName]);
      *(_DWORD *)__int128 buf = 138412290;
      os_log_t v16 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  " >>>deleteLegacyMasterKey  Record Zone %@",  buf,  0xCu);
    }

    id v10 = objc_alloc(&OBJC_CLASS___CKRecordID);
    int v11 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneBlob](self, "recordZoneBlob"));
    os_log_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 zoneID]);
    unsigned __int8 v5 = -[CKRecordID initWithRecordName:zoneID:](v10, "initWithRecordName:zoneID:", @"KeyBlob", v12);

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit cloudKitDatabase](self, "cloudKitDatabase"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10006AB68;
    v14[3] = &unk_100208548;
    void v14[4] = self;
    [v13 deleteRecordWithID:v5 completionHandler:v14];
  }

  else if (v6)
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "No Active Account", buf, 2u);
  }
}

- (void)resetOldZones
{
  os_log_t v3 = sub_100060178("MagicPairing");
  os_log_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneBlob](self, "recordZoneBlob"));
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneID]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneName]);
    int v42 = 138412290;
    uint64_t v43 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  ">>> resetOldZones Key Record Zone %@",  (uint8_t *)&v42,  0xCu);
  }

  os_log_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit cloudKitDatabase](self, "cloudKitDatabase"));
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneBlob](self, "recordZoneBlob"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneID]);
  [v8 deleteRecordZoneWithID:v10 completionHandler:&stru_1002087B0];

  os_log_t v11 = sub_100060178("MagicPairing");
  os_log_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
    char v14 = (void *)objc_claimAutoreleasedReturnValue([v13 zoneID]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 zoneName]);
    int v42 = 138412290;
    uint64_t v43 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  ">>> resetOldZones Accessory Record Zone %@",  (uint8_t *)&v42,  0xCu);
  }

  os_log_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit cloudKitDatabase](self, "cloudKitDatabase"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
  double v18 = (void *)objc_claimAutoreleasedReturnValue([v17 zoneID]);
  [v16 deleteRecordZoneWithID:v18 completionHandler:&stru_1002087D0];

  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit_Manatee sharedInstance](&OBJC_CLASS___MPCloudKit_Manatee, "sharedInstance"));
  if (v19)
  {
    os_log_t v20 = sub_100060178("MagicPairing");
    double v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit_Manatee sharedInstance](&OBJC_CLASS___MPCloudKit_Manatee, "sharedInstance"));
      __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 recordZoneBlob]);
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 zoneID]);
      double v25 = (void *)objc_claimAutoreleasedReturnValue([v24 zoneName]);
      int v42 = 138412290;
      uint64_t v43 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  ">>> resetOldZones Key Record Zone %@",  (uint8_t *)&v42,  0xCu);
    }

    os_log_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit_Manatee sharedInstance](&OBJC_CLASS___MPCloudKit_Manatee, "sharedInstance"));
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 cloudKitDatabase]);
    id v28 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit_Manatee sharedInstance](&OBJC_CLASS___MPCloudKit_Manatee, "sharedInstance"));
    os_log_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 recordZoneBlob]);
    os_log_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 zoneID]);
    [v27 deleteRecordZoneWithID:v30 completionHandler:&stru_1002087F0];

    os_log_t v31 = sub_100060178("MagicPairing");
    uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit_Manatee sharedInstance](&OBJC_CLASS___MPCloudKit_Manatee, "sharedInstance"));
      id v34 = (void *)objc_claimAutoreleasedReturnValue([v33 recordZoneBlob]);
      __int16 v35 = (void *)objc_claimAutoreleasedReturnValue([v34 zoneID]);
      v36 = (void *)objc_claimAutoreleasedReturnValue([v35 zoneName]);
      int v42 = 138412290;
      uint64_t v43 = v36;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  " >>> resetOldZones Accessory Record Zone %@",  (uint8_t *)&v42,  0xCu);
    }

    id v37 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit_Manatee sharedInstance](&OBJC_CLASS___MPCloudKit_Manatee, "sharedInstance"));
    id v38 = (void *)objc_claimAutoreleasedReturnValue([v37 cloudKitDatabase]);
    int v39 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit_Manatee sharedInstance](&OBJC_CLASS___MPCloudKit_Manatee, "sharedInstance"));
    __int16 v40 = (void *)objc_claimAutoreleasedReturnValue([v39 recordZoneAccessoryDatabase]);
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v40 zoneID]);
    [v38 deleteRecordZoneWithID:v41 completionHandler:&stru_100208810];
  }

- (NSString)cloudContainerIdentifier
{
  return (NSString *)@"com.apple.bluetooth";
}

- (OS_dispatch_queue)pushDelegateQueue
{
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit pushQueue](self, "pushQueue"));

  if (!v3)
  {
    dispatch_queue_attr_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    unsigned __int8 v5 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v4);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.bluetooth.mpcloudkit.push", v5);
    -[MPCloudKit setPushQueue:](self, "setPushQueue:", v6);
  }

  return -[MPCloudKit pushQueue](self, "pushQueue");
}

- (void)didReceiveWithMessage:(id)a3
{
  id v4 = a3;
  if (-[MPCloudKit manateeZoneUpgraded](self, "manateeZoneUpgraded"))
  {
    os_log_t v5 = sub_100060178("MagicPairing");
    dispatch_queue_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "*****>>>> Push received for non-manatee but we have upgraded reset this container...",  buf,  2u);
    }

    -[MPCloudKit markLegacyNonManateeContainerMigrated](self, "markLegacyNonManateeContainerMigrated");
  }

  else
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    os_log_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[CKNotification notificationFromRemoteNotificationDictionary:]( &OBJC_CLASS___CKNotification,  "notificationFromRemoteNotificationDictionary:",  v7));
    os_log_t v9 = sub_100060178("MagicPairing");
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 topic]);
      *(_DWORD *)__int128 buf = 138412546;
      double v18 = v11;
      __int16 v19 = 2112;
      os_log_t v20 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "***** APS Push received: %@ \n %@ \n",  buf,  0x16u);
    }

    os_log_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 containerIdentifier]);
    unsigned int v13 = [v12 isEqualToString:@"com.apple.bluetooth"];

    if (v13)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_10006B600;
      v14[3] = &unk_100206358;
      id v15 = v8;
      os_log_t v16 = self;
      dispatch_async(&_dispatch_main_q, v14);
    }
  }
}

- (void)didReceiveWithPublicToken:(id)a3
{
  id v3 = a3;
  if (IsAppleInternalBuild(v3))
  {
    os_log_t v4 = sub_100060178("MagicPairing");
    os_log_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_queue_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 base64EncodedStringWithOptions:0]);
      int v7 = 138412290;
      os_log_t v8 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Received public token %@ on connection",  (uint8_t *)&v7,  0xCu);
    }
  }
}

- (void)didReceiveWithToken:(id)a3 forTopic:(id)a4 identifier:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (IsAppleInternalBuild(v9))
  {
    os_log_t v10 = sub_100060178("MagicPairing");
    os_log_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 base64EncodedStringWithOptions:0]);
      int v13 = 138412802;
      char v14 = v12;
      __int16 v15 = 2112;
      id v16 = v8;
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Received per-topic push token %@ for topic %@ identifier %@ on connection",  (uint8_t *)&v13,  0x20u);
    }
  }
}

- (BOOL)isAccountActive
{
  return self->_isAccountActive;
}

- (void)setIsAccountActive:(BOOL)a3
{
  self->_isAccountActive = a3;
}

- (BOOL)isOldContainerResetInProcess
{
  return self->_isOldContainerResetInProcess;
}

- (void)setIsOldContainerResetInProcess:(BOOL)a3
{
  self->_isOldContainerResetInProcess = a3;
}

- (BOOL)isWriteMasterKeysInProgress
{
  return self->_isWriteMasterKeysInProgress;
}

- (void)setIsWriteMasterKeysInProgress:(BOOL)a3
{
  self->_isWriteMasterKeysInProgress = a3;
}

- (BOOL)pushReceived
{
  return self->_pushReceived;
}

- (void)setPushReceived:(BOOL)a3
{
  self->_pushReceived = a3;
}

- (BOOL)reinitAfterBuddy
{
  return self->_reinitAfterBuddy;
}

- (void)setReinitAfterBuddy:(BOOL)a3
{
  self->_reinitAfterBuddy = a3;
}

- (CKContainer)cloudKitContainer
{
  return self->_cloudKitContainer;
}

- (void)setCloudKitContainer:(id)a3
{
}

- (CKDatabase)cloudKitDatabase
{
  return self->_cloudKitDatabase;
}

- (void)setCloudKitDatabase:(id)a3
{
}

- (CKRecordZone)recordZoneBlob
{
  return self->_recordZoneBlob;
}

- (void)setRecordZoneBlob:(id)a3
{
}

- (CKRecordZone)recordZoneAccessoryDatabase
{
  return self->_recordZoneAccessoryDatabase;
}

- (void)setRecordZoneAccessoryDatabase:(id)a3
{
}

- (CKSubscription)cloudSubscription
{
  return self->_cloudSubscription;
}

- (void)setCloudSubscription:(id)a3
{
}

- (NSTimer)countdownTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setCountdownTimer:(id)a3
{
}

- (NSTimer)pushTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setPushTimer:(id)a3
{
}

- (NSMutableData)masterBlob
{
  return (NSMutableData *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setMasterBlob:(id)a3
{
}

- (NSError)pauseErrorReason
{
  return (NSError *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setPauseErrorReason:(id)a3
{
}

- (BOOL)shouldPauseFetch
{
  return self->_shouldPauseFetch;
}

- (void)setShouldPauseFetch:(BOOL)a3
{
  self->_shouldPauseFetch = a3;
}

- (BTStateWatcher)buddyStateWatcher
{
  return self->_buddyStateWatcher;
}

- (void)setBuddyStateWatcher:(id)a3
{
}

- (BOOL)isFetchInProgress
{
  return self->_isFetchInProgress;
}

- (void)setIsFetchInProgress:(BOOL)a3
{
  self->_isFetchInProgress = a3;
}

- (BOOL)isFetchMasterKeyInProgress
{
  return self->_isFetchMasterKeyInProgress;
}

- (void)setIsFetchMasterKeyInProgress:(BOOL)a3
{
  self->_isFetchMasterKeyInProgress = a3;
}

- (OS_dispatch_queue)pushQueue
{
  return self->_pushQueue;
}

- (void)setPushQueue:(id)a3
{
}

- (NSOperationQueue)modifyOperationQueue
{
  return self->_modifyOperationQueue;
}

- (void)setModifyOperationQueue:(id)a3
{
}

- (NSTimer)modifyOperationTimer
{
  return self->_modifyOperationTimer;
}

- (void)setModifyOperationTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end