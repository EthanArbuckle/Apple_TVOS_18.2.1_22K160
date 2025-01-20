@interface MPCloudKit_Manatee
+ (id)sharedInstance;
- (BOOL)initializedCKAfterFirstUnlockedSinceBoot;
- (BOOL)isAccountActive;
- (BOOL)isFetchInProgress;
- (BOOL)isFetchMasterKeyInProgress;
- (BOOL)isWriteMasterKeysInProgress;
- (BOOL)manateeZoneUpgraded;
- (BOOL)reinitAfterBuddy;
- (BOOL)shouldPauseFetch;
- (BTStateWatcher)buddyStateWatcher;
- (CKContainer)cloudKitContainer;
- (CKDatabase)cloudKitDatabase;
- (CKRecordZone)recordZoneAccessoryDatabase;
- (CKRecordZone)recordZoneBlob;
- (CKSubscription)cloudSubscription;
- (MPCloudKit_Manatee)init;
- (MPCloudKit_Manatee)initWithRecordZoneName;
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
- (id)readUserPreference:(id)a3;
- (void)_fetchAccessoryKeyBlob:(unint64_t)a3;
- (void)_fetchKeyBlob:(unint64_t)a3;
- (void)_pushTimerFired:(id)a3;
- (void)_updateMasterZoneBlob:(id)a3 accessoryblob:(id)a4;
- (void)accountStatusDidChange:(id)a3;
- (void)buddySetupDone;
- (void)checkAccountStatusWithCompletionHandler:(id)a3;
- (void)checkAccountStatusWithCompletionHandler:(id)a3 withRetryCount:(unint64_t)a4;
- (void)createSubscritionForRecordType:(id)a3;
- (void)dealloc;
- (void)deleteCloudKitAccessoryZone;
- (void)didReceiveWithMessage:(id)a3;
- (void)didReceiveWithPublicToken:(id)a3;
- (void)didReceiveWithToken:(id)a3 forTopic:(id)a4 identifier:(id)a5;
- (void)fetchAccessoryKeyBlob:(unint64_t)a3;
- (void)fetchAccountStatusWithCompletion:(id)a3;
- (void)fetchKeyBlob:(unint64_t)a3;
- (void)fetchSubscriptionForRecordType:(id)a3 andPrefKey:(id)a4;
- (void)forceAccountStatus;
- (void)getAccountStatus;
- (void)handleAccessoryModifyError:(id)a3 forBlob:(id)a4 withRetryCount:(unint64_t)a5;
- (void)handleModifyMasterKeyError:(id)a3 forBlob:(id)a4 withRetryCount:(unint64_t)a5;
- (void)initializeCloudKit;
- (void)modifyAccessoryBlob:(id)a3 withRetryCount:(unint64_t)a4;
- (void)modifyKeyBlob:(id)a3 withRetryCount:(unint64_t)a4;
- (void)pushDisable;
- (void)pushEnable;
- (void)removeSubscritionForRecordType:(id)a3;
- (void)removeuserPreference:(id)a3 sync:(BOOL)a4;
- (void)resetAccessoryZone:(id)a3;
- (void)resetCloudContainerManateeIdentityLost;
- (void)resetMasterZone:(id)a3 accessoryblob:(id)a4;
- (void)resetPushTimer;
- (void)setBuddyStateWatcher:(id)a3;
- (void)setCloudKitContainer:(id)a3;
- (void)setCloudKitDatabase:(id)a3;
- (void)setCloudSubscription:(id)a3;
- (void)setCountdownTimer:(id)a3;
- (void)setIsAccountActive:(BOOL)a3;
- (void)setIsFetchInProgress:(BOOL)a3;
- (void)setIsFetchMasterKeyInProgress:(BOOL)a3;
- (void)setIsWriteMasterKeysInProgress:(BOOL)a3;
- (void)setMasterBlob:(id)a3;
- (void)setModifyOperationQueue:(id)a3;
- (void)setModifyOperationTimer:(id)a3;
- (void)setPauseErrorReason:(id)a3;
- (void)setPushQueue:(id)a3;
- (void)setPushTimer:(id)a3;
- (void)setRecordZoneAccessoryDatabase:(id)a3;
- (void)setRecordZoneBlob:(id)a3;
- (void)setReinitAfterBuddy:(BOOL)a3;
- (void)setShouldPauseFetch:(BOOL)a3;
- (void)setupSubscriptions;
- (void)setuserPreference:(id)a3 value:(id)a4 sync:(BOOL)a5;
- (void)updateCloudKitAccessoryZone:(id)a3 delete:(BOOL)a4;
- (void)updateCloudKitBlobZone:(id)a3;
- (void)upgradeAccessoryBlob:(id)a3 withRetryCount:(unint64_t)a4;
- (void)verifyAndCacheSubscriptionID:(id)a3;
- (void)writeAccessoryBlob:(id)a3 withRetryCount:(unint64_t)a4;
- (void)writeKeyBlob:(id)a3 withRetryCount:(unint64_t)a4;
@end

@implementation MPCloudKit_Manatee

+ (id)sharedInstance
{
  return 0LL;
}

- (MPCloudKit_Manatee)init
{
  return -[MPCloudKit_Manatee initWithRecordZoneName](self, "initWithRecordZoneName");
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MPCloudKit_Manatee;
  -[MPCloudKit_Manatee dealloc](&v4, "dealloc");
}

- (NSString)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee cloudContainerIdentifier](self, "cloudContainerIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"MPCloudKit_Manatee: Container - %@",  v2));

  return (NSString *)v3;
}

- (MPCloudKit_Manatee)initWithRecordZoneName
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___MPCloudKit_Manatee;
  v2 = -[MPCloudKit_Manatee init](&v18, "init");
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
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Manatee BYSetupAssistantNeedsToRun : true ",  (uint8_t *)buf,  2u);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
    [v12 beginTransaction:@"com.apple.bluetooth.user.services.mpcloudkitmanatee.buddysetup"];

    v3->_reinitAfterBuddy = 1;
    objc_initWeak(buf, v3);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10007AE4C;
    v15[3] = &unk_100207CB8;
    objc_copyWeak(&v16, buf);
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[BTStateWatcher monitorBuddyStateWithAction:]( &OBJC_CLASS___BTStateWatcher,  "monitorBuddyStateWithAction:",  v15));
    -[MPCloudKit_Manatee setBuddyStateWatcher:](v3, "setBuddyStateWatcher:", v13);

    objc_destroyWeak(&v16);
    objc_destroyWeak(buf);
    goto LABEL_12;
  }

  if (v11)
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Manatee BYSetupAssistantNeedsToRun : false ",  (uint8_t *)buf,  2u);
  }

  v3->_reinitAfterBuddy = 0;
  if (!-[MPCloudKit_Manatee initializedCKAfterFirstUnlockedSinceBoot](v3, "initializedCKAfterFirstUnlockedSinceBoot")) {
LABEL_12:
  }
    -[MPCloudKit_Manatee initializedCKAfterFirstUnlockedSinceBoot](v3, "initializedCKAfterFirstUnlockedSinceBoot");
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
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Manatee: Unlocked since boot = %{public}@",  buf,  0xCu);
  }

  if (v3 == 1)
  {
    os_log_t v7 = sub_100060178("MagicPairing");
    unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Manatee: device is already unlocked after boot ",  buf,  2u);
    }

    -[MPCloudKit_Manatee initializeCloudKit](self, "initializeCloudKit");
  }

  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10007B0A8;
    block[3] = &unk_100206058;
    block[4] = self;
    if (qword_100237288 != -1) {
      dispatch_once(&qword_100237288, block);
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
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Manatee: Forcing account update to bluetoothd",  v6,  2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee cloudKitContainer](self, "cloudKitContainer"));
  [v5 accountStatusWithCompletionHandler:&stru_100208C58];
}

- (void)buddySetupDone
{
  os_log_t v3 = sub_100060178("MagicPairing");
  os_log_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Manatee: buddySetupDone : reset timer now ",  buf,  2u);
  }

  if (self->_reinitAfterBuddy)
  {
    -[MPCloudKit_Manatee initializeCloudKit](self, "initializeCloudKit");
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
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Manatee: buddySetupDone : re-intt cloud kit not needed",  v9,  2u);
    }
  }

  self->_reinitAfterBuddy = 0;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
  [v8 endTransaction:@"com.apple.bluetooth.user.services.mpcloudkitmanatee.buddysetup"];
}

- (void)initializeCloudKit
{
  os_log_t v3 = sub_100060178("MagicPairing");
  os_log_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Manatee: initializeCloudKit : start ", v16, 2u);
  }

  v5 = (CKContainer *)objc_claimAutoreleasedReturnValue( +[CKContainer containerWithIdentifier:]( &OBJC_CLASS___CKContainer,  "containerWithIdentifier:",  @"com.apple.securedBluetooth"));
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
  -[MPCloudKit_Manatee pushEnable](self, "pushEnable");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v13 addObserver:self selector:"accountStatusDidChange:" name:CKAccountChangedNotification object:0];

  -[MPCloudKit_Manatee accountStatusDidChange:](self, "accountStatusDidChange:", 0LL);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee pushTimer](self, "pushTimer"));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee pushTimer](self, "pushTimer"));
    [v15 invalidate];

    -[MPCloudKit_Manatee setPushTimer:](self, "setPushTimer:", 0LL);
  }

- (void)fetchAccountStatusWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee cloudKitContainer](self, "cloudKitContainer"));

  if (v5)
  {
    cloudKitContainer = self->_cloudKitContainer;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10007B774;
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
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Manatee fetchAccountStatusWithCompletion cloudKitContainer is nil",  buf,  2u);
  }

  if (v4)
  {
    os_log_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"CloudKit Account Not Active",  0LL,  0LL));
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0LL, v7);
    goto LABEL_7;
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
  os_log_t v5 = sub_100060178("MagicPairing");
  os_log_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Manatee accountStatusDidChange calling accountStatusWithCompletionHandler",  (uint8_t *)buf,  2u);
  }

  objc_initWeak(buf, self);
  os_log_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee cloudKitContainer](self, "cloudKitContainer"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10007BB2C;
  v8[3] = &unk_100208C80;
  objc_copyWeak(&v9, buf);
  v8[4] = self;
  [v7 accountStatusWithCompletionHandler:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(buf);
}

- (void)setupSubscriptions
{
}

- (void)resetPushTimer
{
  os_log_t v3 = sub_100060178("MagicPairing");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee pushTimer](self, "pushTimer"));
    int v9 = 138412290;
    v10 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Manatee: resetPushTimer called %@",  (uint8_t *)&v9,  0xCu);
  }

  os_log_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee pushTimer](self, "pushTimer"));
  if (v6)
  {
    os_log_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee pushTimer](self, "pushTimer"));
    [v7 invalidate];

    -[MPCloudKit_Manatee setPushTimer:](self, "setPushTimer:", 0LL);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "_pushTimerFired:",  0LL,  0LL,  5.0));
  -[MPCloudKit_Manatee setPushTimer:](self, "setPushTimer:", v8);
}

- (void)_pushTimerFired:(id)a3
{
  os_log_t v4 = sub_100060178("MagicPairing");
  os_log_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Manatee: Push Fetch", buf, 2u);
  }

  os_log_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee pushTimer](self, "pushTimer"));
  if (v6)
  {
    os_log_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee pushTimer](self, "pushTimer"));
    [v7 invalidate];

    -[MPCloudKit_Manatee setPushTimer:](self, "setPushTimer:", 0LL);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007C22C;
  block[3] = &unk_100206058;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)fetchKeyBlob:(unint64_t)a3
{
  cloudKitContainer = self->_cloudKitContainer;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10007C2C0;
  v4[3] = &unk_100208CA8;
  v4[4] = self;
  v4[5] = a3;
  -[CKContainer accountInfoWithCompletionHandler:](cloudKitContainer, "accountInfoWithCompletionHandler:", v4);
}

- (void)_fetchKeyBlob:(unint64_t)a3
{
  os_log_t v5 = sub_100060178("MagicPairing");
  os_log_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v37 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Manatee: fetchKeyBlob: retry count -  %lu",  buf,  0xCu);
  }

  if (a3 >= 5)
  {
    os_log_t v7 = sub_100060178("MagicPairing");
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v37 = a3;
      int v9 = "Manatee: Exhausted all retries...: %lu";
      v10 = v8;
      uint32_t v11 = 12;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
      goto LABEL_15;
    }

    goto LABEL_15;
  }

  if (-[MPCloudKit_Manatee isWriteMasterKeysInProgress](self, "isWriteMasterKeysInProgress"))
  {
    os_log_t v12 = sub_100060178("MagicPairing");
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    int v9 = "Manatee: already writing new key";
LABEL_9:
    v10 = v8;
    uint32_t v11 = 2;
    goto LABEL_10;
  }

  int v13 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee masterBlob](self, "masterBlob"));
  BOOL v14 = [v13 length] == (id)33;

  if (v14)
  {
    os_log_t v15 = sub_100060178("MagicPairing");
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee masterBlob](self, "masterBlob"));
      *(_DWORD *)buf = 138412290;
      unint64_t v37 = (unint64_t)v17;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Manatee: fetchKeyBlob: already have master blob read  %@",  buf,  0xCu);
    }

    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
    objc_super v18 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee masterBlob](self, "masterBlob"));
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  v18,  @"kMasterKeyBlob",  0LL));
    -[os_log_s sendCloudKitMsg:args:](v8, "sendCloudKitMsg:args:", @"MasterKeysAvailable", v19);

    goto LABEL_15;
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneBlob](self, "recordZoneBlob"));
  BOOL v21 = v20 == 0LL;

  if (v21)
  {
    os_log_t v27 = sub_100060178("MagicPairing");
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    int v9 = "Manatee recordZoneBlob is nil";
    goto LABEL_9;
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 deviceManager]);
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 cloudAccountInfo]);
  unsigned __int8 v25 = [v24 manateeAvailable];

  if ((v25 & 1) == 0)
  {
    os_log_t v28 = sub_100060178("MagicPairing");
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100190C20();
    }
    goto LABEL_15;
  }

  if (!-[MPCloudKit_Manatee isFetchMasterKeyInProgress](self, "isFetchMasterKeyInProgress"))
  {
    -[MPCloudKit_Manatee setIsFetchMasterKeyInProgress:](self, "setIsFetchMasterKeyInProgress:", 1LL);
    v29 = objc_alloc(&OBJC_CLASS___CKRecordID);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneBlob](self, "recordZoneBlob"));
    v31 = (void *)objc_claimAutoreleasedReturnValue([v30 zoneID]);
    id v8 = -[CKRecordID initWithRecordName:zoneID:]( v29,  "initWithRecordName:zoneID:",  @"EncryptedMasterKeyBlob",  v31);

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
    [v32 beginTransaction:@"ManateefetchKeyBlob"];

    objc_initWeak((id *)buf, self);
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee cloudKitDatabase](self, "cloudKitDatabase"));
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_10007C8C8;
    v34[3] = &unk_100208CF0;
    v34[4] = self;
    v35[1] = (id)a3;
    objc_copyWeak(v35, (id *)buf);
    [v33 fetchRecordWithID:v8 completionHandler:v34];

    objc_destroyWeak(v35);
    objc_destroyWeak((id *)buf);
    goto LABEL_15;
  }

  os_log_t v26 = sub_100060178("MagicPairing");
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    int v9 = "Manatee fetchKeyBlob already fetching defer";
    goto LABEL_9;
  }

- (void)checkAccountStatusWithCompletionHandler:(id)a3
{
}

- (void)checkAccountStatusWithCompletionHandler:(id)a3 withRetryCount:(unint64_t)a4
{
  id v6 = a3;
  os_log_t v7 = sub_100060178("MagicPairing");
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (a4 <= 4)
  {
    if (v9)
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v16 = a4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Manatee: checkAccountStatus: %lu", buf, 0xCu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
    [v10 beginTransaction:@"ManateeCheckAccountStatusWithCompletionHandler"];

    objc_initWeak((id *)buf, self);
    uint32_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee cloudKitContainer](self, "cloudKitContainer"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10007D5F4;
    v12[3] = &unk_100208D18;
    objc_copyWeak(v14, (id *)buf);
    id v13 = v6;
    v14[1] = (id)a4;
    [v11 accountStatusWithCompletionHandler:v12];

    objc_destroyWeak(v14);
    objc_destroyWeak((id *)buf);
  }

  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v16 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Manatee: Exhausted all retries for: %lu",  buf,  0xCu);
    }
  }
}

- (void)fetchAccessoryKeyBlob:(unint64_t)a3
{
  cloudKitContainer = self->_cloudKitContainer;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10007D868;
  v4[3] = &unk_100208CA8;
  v4[4] = self;
  v4[5] = a3;
  -[CKContainer accountInfoWithCompletionHandler:](cloudKitContainer, "accountInfoWithCompletionHandler:", v4);
}

- (void)_fetchAccessoryKeyBlob:(unint64_t)a3
{
  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 deviceManager]);
  os_log_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 cloudAccountInfo]);
  unsigned __int8 v8 = [v7 manateeAvailable];

  if ((v8 & 1) != 0)
  {
    os_log_t v9 = sub_100060178("MagicPairing");
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (a3 <= 4)
    {
      if (v11)
      {
        *(_DWORD *)buf = 134217984;
        v29 = (const char *)a3;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Manatee: fetchAccessoryKeyBlob: %lu",  buf,  0xCu);
      }

      if (-[MPCloudKit_Manatee isFetchInProgress](self, "isFetchInProgress"))
      {
        os_log_t v16 = sub_100060178("MagicPairing");
        v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v17 = -[MPCloudKit_Manatee isFetchInProgress](self, "isFetchInProgress");
          *(_DWORD *)buf = 67109120;
          LODWORD(v29) = v17;
          os_log_t v12 = "Manatee: fetchAccessoryKeyBlob already in-progress: %i";
          id v13 = v10;
          uint32_t v14 = 8;
          goto LABEL_16;
        }
      }

      else
      {
        objc_super v18 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
        BOOL v19 = v18 == 0LL;

        if (v19)
        {
          os_log_t v25 = sub_100060178("MagicPairing");
          v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            os_log_t v12 = "Manatee: recordZoneAccessoryDatabase is nil";
            id v13 = v10;
            uint32_t v14 = 2;
            goto LABEL_16;
          }
        }

        else
        {
          -[MPCloudKit_Manatee setIsFetchInProgress:](self, "setIsFetchInProgress:", 1LL);
          v20 = objc_alloc(&OBJC_CLASS___CKRecordID);
          BOOL v21 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
          v22 = (void *)objc_claimAutoreleasedReturnValue([v21 zoneID]);
          v10 = -[CKRecordID initWithRecordName:zoneID:]( v20,  "initWithRecordName:zoneID:",  @"EncryptedAccessoryBlob",  v22);

          v23 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
          [v23 beginTransaction:@"ManateeFetchAccessoryKeyBlob"];

          objc_initWeak((id *)buf, self);
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee cloudKitDatabase](self, "cloudKitDatabase"));
          v26[0] = _NSConcreteStackBlock;
          v26[1] = 3221225472LL;
          v26[2] = sub_10007DD44;
          v26[3] = &unk_100208CF0;
          v26[4] = self;
          v27[1] = (id)a3;
          objc_copyWeak(v27, (id *)buf);
          [v24 fetchRecordWithID:v10 completionHandler:v26];

          objc_destroyWeak(v27);
          objc_destroyWeak((id *)buf);
        }
      }
    }

    else if (v11)
    {
      *(_DWORD *)buf = 136315138;
      v29 = "-[MPCloudKit_Manatee _fetchAccessoryKeyBlob:]";
      os_log_t v12 = "Manatee: Exhausted all retries...: %s";
      id v13 = v10;
      uint32_t v14 = 12;
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
    }
  }

  else
  {
    os_log_t v15 = sub_100060178("MagicPairing");
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100190CA4();
    }
  }
}

- (void)updateCloudKitBlobZone:(id)a3
{
  id v4 = a3;
  if (-[MPCloudKit_Manatee manateeZoneUpgraded](self, "manateeZoneUpgraded"))
  {
    unsigned int v5 = -[MPCloudKit_Manatee isWriteMasterKeysInProgress](self, "isWriteMasterKeysInProgress");
    os_log_t v6 = sub_100060178("MagicPairing");
    os_log_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Manatee: updateCloudKitBlobZone already in the process...",  buf,  2u);
      }
    }

    else
    {
      if (v8)
      {
        *(_WORD *)os_log_t v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Manatee: updating CloudKit Blob", v9, 2u);
      }

      -[MPCloudKit_Manatee setIsWriteMasterKeysInProgress:](self, "setIsWriteMasterKeysInProgress:", 1LL);
      -[MPCloudKit_Manatee modifyKeyBlob:withRetryCount:](self, "modifyKeyBlob:withRetryCount:", v4, 0LL);
    }
  }
}

- (void)modifyKeyBlob:(id)a3 withRetryCount:(unint64_t)a4
{
  id v6 = a3;
  os_log_t v7 = sub_100060178("MagicPairing");
  BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v20 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Manatee: modifyKeyBlob with retry count: %lu",  buf,  0xCu);
  }

  os_log_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
  [v9 beginTransaction:@"ManateeModifyKeyBlob"];

  v10 = objc_alloc(&OBJC_CLASS___CKRecordID);
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneBlob](self, "recordZoneBlob"));
  os_log_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 zoneID]);
  id v13 = -[CKRecordID initWithRecordName:zoneID:]( v10,  "initWithRecordName:zoneID:",  @"EncryptedMasterKeyBlob",  v12);

  uint32_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee cloudKitDatabase](self, "cloudKitDatabase"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10007E9F0;
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
    goto LABEL_48;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]);
  if ([v10 isEqualToString:CKErrorDomain])
  {
    if ([v8 code] == (id)3
      || [v8 code] == (id)7
      || [v8 code] == (id)4
      || [v8 code] == (id)9)
    {

      goto LABEL_9;
    }

    id v51 = [v8 code];

    if (v51 == (id)6)
    {
LABEL_9:
      os_log_t v11 = sub_100060178("MagicPairing");
      os_log_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100190E60();
      }

      id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 userInfo]);
      uint32_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:CKErrorRetryAfterKey]);

      if (v14)
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 userInfo]);
        os_log_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:CKErrorRetryAfterKey]);
        [v16 doubleValue];
        double v18 = v17;

        os_log_t v19 = sub_100060178("MagicPairing");
        unint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          id v62 = v8;
          __int16 v63 = 2048;
          unint64_t v64 = a5;
          __int16 v65 = 2048;
          unint64_t v66 = (unint64_t)v18;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Manatee: Updating master key failed with error %@, retry count = %lu with time: %lu",  buf,  0x20u);
        }

        dispatch_time_t v21 = dispatch_time(0LL, (uint64_t)(v18 * 1000000000.0));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10007F338;
        block[3] = &unk_1002071F0;
        block[4] = self;
        id v58 = v9;
        unint64_t v59 = a5;
        dispatch_after(v21, &_dispatch_main_q, block);

        goto LABEL_49;
      }

      goto LABEL_48;
    }
  }

  else
  {
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]);
  if ([v22 isEqualToString:CKErrorDomain])
  {
    if ([v8 code] == (id)26)
    {

LABEL_44:
      os_log_t v44 = sub_100060178("MagicPairing");
      v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        sub_100190ECC();
      }

      -[MPCloudKit_Manatee writeKeyBlob:withRetryCount:](self, "writeKeyBlob:withRetryCount:", v9, 0LL);
      goto LABEL_49;
    }

    id v43 = [v8 code];

    if (v43 == (id)11) {
      goto LABEL_44;
    }
  }

  else
  {
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]);
  if ([v23 isEqualToString:CKErrorDomain])
  {
    id v24 = [v8 code];

    if (v24 == (id)112)
    {
      os_log_t v25 = sub_100060178("MagicPairing");
      os_log_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Manatee: handleModifyMasterKeyError lost access to manatee data. Reset and recreate zone.",  buf,  2u);
      }

      os_log_t v27 = sub_100060178("MagicPairing");
      os_log_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Manatee: handleModifyMasterKeyError Reset and recreate zone DONE!",  buf,  2u);
      }

      -[MPCloudKit_Manatee resetCloudContainerManateeIdentityLost](self, "resetCloudContainerManateeIdentityLost");
      goto LABEL_49;
    }
  }

  else
  {
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]);
  if (([v29 isEqualToString:CKErrorDomain] & 1) == 0)
  {

    goto LABEL_48;
  }

  v30 = (void *)objc_claimAutoreleasedReturnValue([v8 userInfo]);
  v31 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:CKPartialErrorsByItemIDKey]);

  if (!v31)
  {
LABEL_48:
    -[MPCloudKit_Manatee setIsWriteMasterKeysInProgress:](self, "setIsWriteMasterKeysInProgress:", 0LL);
    goto LABEL_49;
  }

  id v52 = v9;
  v32 = (void *)objc_claimAutoreleasedReturnValue([v8 userInfo]);
  v33 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:CKPartialErrorsByItemIDKey]);

  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  id v34 = v33;
  id v35 = [v34 countByEnumeratingWithState:&v53 objects:v60 count:16];
  if (v35)
  {
    id v36 = v35;
    uint64_t v37 = *(void *)v54;
    while (2)
    {
      for (i = 0LL; i != v36; i = (char *)i + 1)
      {
        if (*(void *)v54 != v37) {
          objc_enumerationMutation(v34);
        }
        v39 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKey:*(void *)(*((void *)&v53 + 1) + 8 * (void)i)]);
        uint64_t v40 = objc_opt_class(&OBJC_CLASS___NSError);
        if ((objc_opt_isKindOfClass(v39, v40) & 1) != 0)
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue([v39 domain]);
          if ([v41 isEqualToString:CKErrorDomain])
          {
            id v42 = [v39 code];

            if (v42 == (id)112)
            {
              os_log_t v46 = sub_100060178("MagicPairing");
              v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v62 = v39;
                _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "Manatee: handleModifyMasterKeyError lost access to manatee data. Reset and recreate zone due to - %@",  buf,  0xCu);
              }

              os_log_t v49 = sub_100060178("MagicPairing");
              v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
              if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "Manatee: handleModifyMasterKeyError. Reset and recreate zone DONE!",  buf,  2u);
              }

              -[MPCloudKit_Manatee resetCloudContainerManateeIdentityLost]( self,  "resetCloudContainerManateeIdentityLost");
              goto LABEL_55;
            }
          }

          else
          {
          }
        }
      }

      id v36 = [v34 countByEnumeratingWithState:&v53 objects:v60 count:16];
      if (v36) {
        continue;
      }
      break;
    }
  }

- (void)writeKeyBlob:(id)a3 withRetryCount:(unint64_t)a4
{
  id v6 = a3;
  if (-[MPCloudKit_Manatee manateeZoneUpgraded](self, "manateeZoneUpgraded"))
  {
    os_log_t v7 = sub_100060178("MagicPairing");
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneBlob](self, "recordZoneBlob"));
      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneID]);
      os_log_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneName]);
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  " >>>writeKeyBlob  Record Zone %@",  (uint8_t *)&buf,  0xCu);
    }

    os_log_t v12 = objc_alloc(&OBJC_CLASS___CKRecordID);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneBlob](self, "recordZoneBlob"));
    uint32_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 zoneID]);
    id v15 = -[CKRecordID initWithRecordName:zoneID:]( v12,  "initWithRecordName:zoneID:",  @"EncryptedMasterKeyBlob",  v14);

    os_log_t v16 = -[CKRecord initWithRecordType:recordID:]( objc_alloc(&OBJC_CLASS___CKRecord),  "initWithRecordType:recordID:",  @"MasterKey",  v15);
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v50 = 0x3032000000LL;
    id v51 = sub_10007F81C;
    id v52 = sub_10007F82C;
    id v53 = 0LL;
    dispatch_semaphore_t v17 = dispatch_semaphore_create(0LL);
    double v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValues](v16, "encryptedValues"));
    [v18 setObject:v6 forKeyedSubscript:@"EncryptedMasterKeyBlob"];

    os_log_t v19 = sub_100060178("MagicPairing");
    unint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v45 = 138412290;
      id v46 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "writeKeyBlob: kMagicCloudPairingProtectedMasterBlob fetch: encryptedBlob %@",  v45,  0xCu);
    }

    dispatch_time_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
    [v21 beginTransaction:@"ManateeWriteKeyBlob"];

    objc_initWeak(&location, self);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee cloudKitDatabase](self, "cloudKitDatabase"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneBlob](self, "recordZoneBlob"));
    id v34 = _NSConcreteStackBlock;
    uint64_t v35 = 3221225472LL;
    id v36 = sub_10007F834;
    uint64_t v37 = &unk_100208DA8;
    v43[1] = (id)a4;
    p___int128 buf = &buf;
    v38 = self;
    id v39 = v6;
    objc_copyWeak(v43, &location);
    id v24 = v16;
    uint64_t v40 = v24;
    os_log_t v25 = v17;
    v41 = v25;
    [v22 saveRecordZone:v23 completionHandler:&v34];

    dispatch_time_t v26 = dispatch_time(0LL, 60000000000LL);
    dispatch_semaphore_wait(v25, v26);
    -[MPCloudKit_Manatee setIsWriteMasterKeysInProgress:]( self,  "setIsWriteMasterKeysInProgress:",  0LL,  v34,  v35,  v36,  v37,  v38);
    -[MPCloudKit_Manatee setMasterBlob:](self, "setMasterBlob:", 0LL);
    os_log_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
    [v27 endTransaction:@"ManateeWriteKeyBlob"];

    if (*(void *)(*((void *)&buf + 1) + 40LL))
    {
      os_log_t v28 = sub_100060178("MagicPairing");
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneBlob](self, "recordZoneBlob"));
        v31 = (void *)objc_claimAutoreleasedReturnValue([v30 zoneID]);
        v32 = (void *)objc_claimAutoreleasedReturnValue([v31 zoneName]);
        uint64_t v33 = *(void *)(*((void *)&buf + 1) + 40LL);
        *(_DWORD *)v45 = 138412546;
        id v46 = v32;
        __int16 v47 = 2112;
        uint64_t v48 = v33;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  " >>>writeKeyBlob  Record Zone %@ failed with error %@",  v45,  0x16u);
      }
    }

    objc_destroyWeak(v43);
    objc_destroyWeak(&location);

    _Block_object_dispose(&buf, 8);
  }

  else
  {
    -[MPCloudKit_Manatee setIsWriteMasterKeysInProgress:](self, "setIsWriteMasterKeysInProgress:", 0LL);
  }
}

- (void)updateCloudKitAccessoryZone:(id)a3 delete:(BOOL)a4
{
  id v6 = a3;
  if (-[MPCloudKit_Manatee isAccountActive](self, "isAccountActive"))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100080370;
    block[3] = &unk_100208458;
    BOOL v12 = a4;
    v10 = (os_log_s *)v6;
    os_log_t v11 = self;
    dispatch_async(&_dispatch_main_q, block);
    os_log_t v7 = v10;
  }

  else
  {
    os_log_t v8 = sub_100060178("MagicPairing");
    os_log_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100190F2C();
    }
  }
}

- (void)modifyAccessoryBlob:(id)a3 withRetryCount:(unint64_t)a4
{
  id v6 = a3;
  if (-[MPCloudKit_Manatee manateeZoneUpgraded](self, "manateeZoneUpgraded"))
  {
    os_log_t v7 = sub_100060178("MagicPairing");
    os_log_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134217984;
      unint64_t v23 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  ">>> Manatee: modifyAccessoryBlob - %lu",  buf,  0xCu);
    }

    dispatch_semaphore_t v9 = dispatch_semaphore_create(0LL);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
    [v10 beginTransaction:@"ManateeModifyAccessoryBlob"];

    os_log_t v11 = objc_alloc(&OBJC_CLASS___CKRecordID);
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 zoneID]);
    uint32_t v14 = -[CKRecordID initWithRecordName:zoneID:]( v11,  "initWithRecordName:zoneID:",  @"EncryptedAccessoryBlob",  v13);

    objc_initWeak((id *)buf, self);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee cloudKitDatabase](self, "cloudKitDatabase"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10008090C;
    v18[3] = &unk_100208DD0;
    objc_copyWeak(v21, (id *)buf);
    id v19 = v6;
    v21[1] = (id)a4;
    os_log_t v16 = v9;
    unint64_t v20 = v16;
    [v15 fetchRecordWithID:v14 completionHandler:v18];

    dispatch_time_t v17 = dispatch_time(0LL, 60000000000LL);
    dispatch_semaphore_wait(v16, v17);

    objc_destroyWeak(v21);
    objc_destroyWeak((id *)buf);
  }
}

- (void)handleAccessoryModifyError:(id)a3 forBlob:(id)a4 withRetryCount:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    id v61 = v8;
    if (a5 >= 5)
    {
      os_log_t v9 = sub_100060178("MagicPairing");
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1001910AC();
      }

      goto LABEL_24;
    }

    os_log_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 domain]);
    if ([v11 isEqualToString:CKErrorDomain])
    {
      if ([v7 code] == (id)3 || objc_msgSend(v7, "code") == (id)4 || objc_msgSend(v7, "code") == (id)9)
      {

        goto LABEL_11;
      }

      id v30 = [v7 code];

      if (v30 == (id)6)
      {
LABEL_11:
        os_log_t v12 = sub_100060178("MagicPairing");
        id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_10019110C();
        }
LABEL_13:

        uint32_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
        id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
        os_log_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  v15,  @"kUploadStatus",  0LL));
        [v14 sendCloudKitMsg:@"DeviceInfoUploadStatus" args:v16];

LABEL_24:
        id v8 = v61;
        goto LABEL_25;
      }
    }

    else
    {
    }

    if ([v7 code] == (id)7)
    {
      dispatch_time_t v17 = (void *)objc_claimAutoreleasedReturnValue([v7 userInfo]);
      double v18 = CKErrorRetryAfterKey;
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:CKErrorRetryAfterKey]);
      if (v19)
      {

LABEL_21:
        dispatch_time_t v21 = (void *)objc_claimAutoreleasedReturnValue([v7 userInfo]);
        v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:v18]);
        [v22 doubleValue];
        double v24 = v23;

        os_log_t v25 = sub_100060178("MagicPairing");
        dispatch_time_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        double v27 = v24 + 10.0;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 138412802;
          id v74 = v7;
          __int16 v75 = 2048;
          unint64_t v76 = a5;
          __int16 v77 = 2048;
          unint64_t v78 = (unint64_t)v27;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Manatee: modify AccessoryBlob failed with error %@, retry count = %lu, retry time: %lu",  buf,  0x20u);
        }

        dispatch_time_t v28 = dispatch_time(0LL, (uint64_t)(v27 * 1000000000.0));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_100081774;
        block[3] = &unk_1002071F0;
        void block[4] = self;
        id v70 = v61;
        unint64_t v71 = a5;
        dispatch_after(v28, &_dispatch_main_q, block);

        goto LABEL_24;
      }

      int IsCode = CKErrorIsCode(v7, 15LL);

      if (IsCode) {
        goto LABEL_21;
      }
    }

    else if (CKErrorIsCode(v7, 15LL))
    {
      double v18 = CKErrorRetryAfterKey;
      goto LABEL_21;
    }

    v29 = (void *)objc_claimAutoreleasedReturnValue([v7 domain]);
    if ([v29 isEqualToString:CKErrorDomain])
    {
      if ([v7 code] == (id)26)
      {

LABEL_33:
        os_log_t v32 = sub_100060178("MagicPairing");
        uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          sub_10019116C();
        }

        objc_initWeak((id *)buf, self);
        id v34 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee modifyOperationQueue](self, "modifyOperationQueue"));
        v66[0] = _NSConcreteStackBlock;
        v66[1] = 3221225472LL;
        v66[2] = sub_1000818A0;
        v66[3] = &unk_1002084D0;
        objc_copyWeak(&v68, (id *)buf);
        id v67 = v61;
        [v34 addOperationWithBlock:v66];

        objc_destroyWeak(&v68);
        objc_destroyWeak((id *)buf);
        goto LABEL_24;
      }

      id v31 = [v7 code];

      if (v31 == (id)11) {
        goto LABEL_33;
      }
    }

    else
    {
    }

    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v7 domain]);
    if ([v35 isEqualToString:CKErrorDomain])
    {
      id v36 = [v7 code];

      if (v36 == (id)112)
      {
        os_log_t v37 = sub_100060178("MagicPairing");
        v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "Manatee: handleAccessoryModifyError lost access to manatee data. Reset and recreate zone.",  buf,  2u);
        }

        os_log_t v39 = sub_100060178("MagicPairing");
        uint64_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "Manatee: handleAccessoryModifyError Reset and recreate zone DONE!",  buf,  2u);
        }

        -[MPCloudKit_Manatee resetCloudContainerManateeIdentityLost](self, "resetCloudContainerManateeIdentityLost");
        goto LABEL_24;
      }
    }

    else
    {
    }

    v41 = (void *)objc_claimAutoreleasedReturnValue([v7 domain]);
    if ([v41 isEqualToString:CKErrorDomain])
    {
      id v42 = (void *)objc_claimAutoreleasedReturnValue([v7 userInfo]);
      id v43 = (void *)objc_claimAutoreleasedReturnValue([v42 objectForKeyedSubscript:CKPartialErrorsByItemIDKey]);

      if (v43)
      {
        os_log_t v44 = (void *)objc_claimAutoreleasedReturnValue([v7 userInfo]);
        v45 = (void *)objc_claimAutoreleasedReturnValue([v44 objectForKeyedSubscript:CKPartialErrorsByItemIDKey]);

        __int128 v64 = 0u;
        __int128 v65 = 0u;
        __int128 v62 = 0u;
        __int128 v63 = 0u;
        id v46 = v45;
        id v47 = [v46 countByEnumeratingWithState:&v62 objects:v72 count:16];
        if (v47)
        {
          uint64_t v48 = *(void *)v63;
          while (2)
          {
            for (i = 0LL; i != v47; i = (char *)i + 1)
            {
              if (*(void *)v63 != v48) {
                objc_enumerationMutation(v46);
              }
              uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue([v46 objectForKey:*(void *)(*((void *)&v62 + 1) + 8 * (void)i)]);
              uint64_t v51 = objc_opt_class(&OBJC_CLASS___NSError);
              if ((objc_opt_isKindOfClass(v50, v51) & 1) != 0)
              {
                id v52 = (void *)objc_claimAutoreleasedReturnValue([v50 domain]);
                if ([v52 isEqualToString:CKErrorDomain])
                {
                  BOOL v53 = [v50 code] == (id)112;

                  if (v53)
                  {
                    os_log_t v55 = sub_100060178("MagicPairing");
                    __int128 v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
                    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)__int128 buf = 138412290;
                      id v74 = v50;
                      _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_DEFAULT,  "Manatee: handleAccessoryModifyError lost access to manatee data. Reset and recreate zone due to - %@",  buf,  0xCu);
                    }

                    os_log_t v58 = sub_100060178("MagicPairing");
                    unint64_t v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
                    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)__int128 buf = 0;
                      _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_DEFAULT,  "Manatee: handleAccessoryModifyError. Reset and recreate zone DONE!",  buf,  2u);
                    }

                    -[MPCloudKit_Manatee resetCloudContainerManateeIdentityLost]( self,  "resetCloudContainerManateeIdentityLost");
                    goto LABEL_68;
                  }
                }

                else
                {
                }
              }
            }

            id v47 = [v46 countByEnumeratingWithState:&v62 objects:v72 count:16];
            if (v47) {
              continue;
            }
            break;
          }
        }

- (void)writeAccessoryBlob:(id)a3 withRetryCount:(unint64_t)a4
{
  id v6 = a3;
  if (-[MPCloudKit_Manatee manateeZoneUpgraded](self, "manateeZoneUpgraded"))
  {
    os_log_t v7 = sub_100060178("MagicPairing");
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneID]);
      os_log_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneName]);
      *(_DWORD *)__int128 buf = 138412290;
      id v33 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Manatee: >>> writeAccessoryBlob Record Zone %@",  buf,  0xCu);
    }

    os_log_t v12 = objc_alloc(&OBJC_CLASS___CKRecordID);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
    uint32_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 zoneID]);
    id v15 = -[CKRecordID initWithRecordName:zoneID:]( v12,  "initWithRecordName:zoneID:",  @"EncryptedAccessoryBlob",  v14);

    os_log_t v16 = -[CKRecord initWithRecordType:recordID:]( objc_alloc(&OBJC_CLASS___CKRecord),  "initWithRecordType:recordID:",  @"AccessoryDatabase",  v15);
    dispatch_time_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValues](v16, "encryptedValues"));
    [v17 setObject:v6 forKeyedSubscript:@"EncryptedAccessoryBlob"];

    os_log_t v18 = sub_100060178("MagicPairing");
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v33 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Manatee: writeAccessoryBlob: MagicCloudPairingProtectedAccessoryBlob fetch: encryptedBlob %@",  buf,  0xCu);
    }

    unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
    [v20 beginTransaction:@"ManateeWriteAccessoryBlob"];

    dispatch_semaphore_t v21 = dispatch_semaphore_create(0LL);
    objc_initWeak((id *)buf, self);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee cloudKitDatabase](self, "cloudKitDatabase"));
    double v23 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    id v27[2] = sub_100081C40;
    v27[3] = &unk_100208DF8;
    objc_copyWeak(v31, (id *)buf);
    v27[4] = self;
    double v24 = v16;
    dispatch_time_t v28 = v24;
    v31[1] = (id)a4;
    id v29 = v6;
    os_log_t v25 = v21;
    id v30 = v25;
    [v22 saveRecordZone:v23 completionHandler:v27];

    dispatch_time_t v26 = dispatch_time(0LL, 60000000000LL);
    dispatch_semaphore_wait(v25, v26);

    objc_destroyWeak(v31);
    objc_destroyWeak((id *)buf);
  }
}

- (void)deleteCloudKitAccessoryZone
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
  os_log_t v4 = sub_100060178("MagicPairing");
  unsigned int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
    os_log_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneID]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneName]);
    *(_DWORD *)__int128 buf = 138412290;
    double v23 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Manatee: >>> deleteCloudKitAccessoryZone %@",  buf,  0xCu);
  }

  os_log_t v9 = objc_alloc(&OBJC_CLASS___CKRecordID);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
  os_log_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneID]);
  os_log_t v12 = -[CKRecordID initWithRecordName:zoneID:](v9, "initWithRecordName:zoneID:", @"EncryptedAccessoryBlob", v11);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
  [v13 beginTransaction:@"ManateeDeleteCloudKitAccessoryZone"];

  uint32_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee cloudKitDatabase](self, "cloudKitDatabase"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100082A68;
  v20[3] = &unk_100208548;
  dispatch_semaphore_t v21 = v3;
  id v15 = v3;
  [v14 deleteRecordWithID:v12 completionHandler:v20];

  dispatch_time_t v16 = dispatch_time(0LL, 60000000000LL);
  dispatch_semaphore_wait(v15, v16);
  dispatch_time_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
  os_log_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 deviceManager]);
  [v18 deleteLegacyMagicPairingRecordsWithUserInitiated:1 completion:&stru_100208E18];

  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
  [v19 endTransaction:@"ManateeDeleteCloudKitAccessoryZone"];
}

- (void)createSubscritionForRecordType:(id)a3
{
  os_log_t v4 = (os_log_s *)a3;
  unsigned __int8 v5 = -[MPCloudKit_Manatee manateeZoneUpgraded](self, "manateeZoneUpgraded");
  os_log_t v6 = sub_100060178("MagicPairing");
  os_log_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if ((v5 & 1) == 0)
  {
    if (!v8) {
      goto LABEL_25;
    }
    *(_WORD *)__int128 buf = 0;
    id v13 = "Manatee zone not upgraded.";
    uint32_t v14 = v7;
    uint32_t v15 = 2;
LABEL_24:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
    goto LABEL_25;
  }

  if (v8)
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v31 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Manatee: createSubscritionForRecordType: %@",  buf,  0xCu);
  }

  if (-[os_log_s isEqualToString:](v4, "isEqualToString:", @"EncryptedMasterKeyBlob"))
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue( -[MPCloudKit_Manatee readUserPreference:]( self,  "readUserPreference:",  @"MagicCloudPairingMasterSubscriptionManateeID"));
    if (v9)
    {
      os_log_t v7 = (os_log_s *)v9;
      os_log_t v10 = sub_100060178("MagicPairing");
      os_log_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        id v31 = v7;
        os_log_t v12 = "Manatee: master subscription already exists: %@";
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
        goto LABEL_15;
      }

      goto LABEL_15;
    }

    os_log_t v18 = objc_alloc(&OBJC_CLASS___CKRecordZoneSubscription);
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneBlob](self, "recordZoneBlob"));
    unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 zoneID]);
    os_log_t v7 = -[CKRecordZoneSubscription initWithZoneID:](v18, "initWithZoneID:", v20);
    dispatch_semaphore_t v21 = @"MagicCloudPairingMasterSubscriptionManateeID";
  }

  else
  {
    if (!-[os_log_s isEqualToString:](v4, "isEqualToString:", @"EncryptedAccessoryBlob"))
    {
LABEL_22:
      os_log_t v26 = sub_100060178("MagicPairing");
      os_log_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_25;
      }
      *(_DWORD *)__int128 buf = 138412290;
      id v31 = v4;
      id v13 = "Manatee: Unable to create zone subscription key: %@";
      uint32_t v14 = v7;
      uint32_t v15 = 12;
      goto LABEL_24;
    }

    uint64_t v16 = objc_claimAutoreleasedReturnValue( -[MPCloudKit_Manatee readUserPreference:]( self,  "readUserPreference:",  @"MagicCloudPairingAccessorySubscriptionManateeID"));
    if (v16)
    {
      os_log_t v7 = (os_log_s *)v16;
      os_log_t v17 = sub_100060178("MagicPairing");
      os_log_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        id v31 = v7;
        os_log_t v12 = "Manatee: accessory subscription already exists: %@";
        goto LABEL_14;
      }

- (void)fetchSubscriptionForRecordType:(id)a3 andPrefKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee readUserPreference:](self, "readUserPreference:", v7));
  os_log_t v9 = sub_100060178("MagicPairing");
  os_log_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412546;
    v22 = v8;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Manatee: Verify Fetch cached Subscription ID - %@ for record - %@",  buf,  0x16u);
  }

  os_log_t v11 = sub_100060178("MagicPairing");
  os_log_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v13)
    {
      *(_DWORD *)__int128 buf = 138412290;
      v22 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Manatee: Found cached Subscription ID - %@",  buf,  0xCu);
    }

    uint32_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee cloudKitDatabase](self, "cloudKitDatabase"));
    uint32_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee readUserPreference:](self, "readUserPreference:", v7));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1000834A4;
    v16[3] = &unk_1002085B8;
    id v17 = v8;
    os_log_t v18 = self;
    id v19 = v7;
    id v20 = v6;
    [v14 fetchSubscriptionWithID:v15 completionHandler:v16];
  }

  else
  {
    if (v13)
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Manatee: Subscription cannot be Fetched, create it...",  buf,  2u);
    }

    -[MPCloudKit_Manatee createSubscritionForRecordType:](self, "createSubscritionForRecordType:", v6);
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
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Manatee: verifyAndCacheSubscriptionID - %@",  buf,  0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee cloudKitDatabase](self, "cloudKitDatabase"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000837F8;
  v9[3] = &unk_100208590;
  id v10 = v4;
  os_log_t v11 = self;
  id v8 = v4;
  [v7 fetchSubscriptionWithID:v8 completionHandler:v9];
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
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Manatee: Attempting to delete Subscription for record type - %@ ",  buf,  0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee cloudKitDatabase](self, "cloudKitDatabase"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100083B30;
  v9[3] = &unk_100208630;
  objc_copyWeak(&v12, (id *)buf);
  id v8 = v4;
  id v10 = v8;
  os_log_t v11 = v13;
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
  os_log_t v25 = sub_10007F81C;
  os_log_t v26 = sub_10007F82C;
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
        os_log_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee cloudKitContainer](self, "cloudKitContainer"));
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472LL;
        v19[2] = sub_100084258;
        v19[3] = &unk_100208658;
        dispatch_semaphore_t v21 = &v22;
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
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Using push environment %@", buf, 0xCu);
  }

  _Block_object_dispose(&v22, 8);
  return v15;
}

- (void)pushEnable
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);

  if (![v4 length])
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 executablePath]);
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 lastPathComponent]);

    id v4 = (void *)v7;
  }

  os_log_t v8 = sub_100060178("MagicPairing");
  os_log_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    os_log_t v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Manatee: Enable Push Notification Updated for bundle ID: %@",  (uint8_t *)&v11,  0xCu);
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
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[MPCloudKit_Manatee readUserPreference:]( self,  "readUserPreference:",  @"MagicCloudPairingManateeUpgradedAccount"));

  if (v2)
  {
    os_log_t v3 = sub_100060178("MagicPairing");
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Manatee: Master zone has been upgraded. Dont generate keys",  v6,  2u);
    }
  }

  return v2 != 0LL;
}

- (void)resetCloudContainerManateeIdentityLost
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000845BC;
  block[3] = &unk_100206058;
  void block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)resetMasterZone:(id)a3 accessoryblob:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[MPCloudKit_Manatee isAccountActive](self, "isAccountActive"))
  {
    os_log_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
    [v8 beginTransaction:@"resetMasterZone"];

    os_log_t v9 = sub_100060178("MagicPairing");
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneBlob](self, "recordZoneBlob"));
      os_log_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 zoneID]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 zoneName]);
      *(_DWORD *)__int128 buf = 138412290;
      id v36 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  " >>> resetMasterZone Record Zone %@",  buf,  0xCu);
    }

    dispatch_time_t v14 = dispatch_time(0LL, 10000000000LL);
    dispatch_semaphore_t v15 = dispatch_semaphore_create(0LL);
    os_log_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee cloudKitDatabase](self, "cloudKitDatabase"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneBlob](self, "recordZoneBlob"));
    os_log_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 zoneID]);
    id v27 = _NSConcreteStackBlock;
    uint64_t v28 = 3221225472LL;
    id v29 = sub_100085044;
    id v30 = &unk_100208E40;
    dispatch_semaphore_t v31 = v15;
    id v19 = v15;
    [v16 deleteRecordZoneWithID:v18 completionHandler:&v27];

    dispatch_semaphore_wait(v19, v14);
    -[MPCloudKit_Manatee _updateMasterZoneBlob:accessoryblob:]( self,  "_updateMasterZoneBlob:accessoryblob:",  v6,  v7,  v27,  v28,  v29,  v30);
    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
    [v20 endTransaction:@"resetMasterZone"];
  }

  else
  {
    os_log_t v21 = sub_100060178("MagicPairing");
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "resetMasterZone account not active upgrade pref and reload account status",  buf,  2u);
    }

    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue( -[MPCloudKit_Manatee readUserPreference:]( self,  "readUserPreference:",  @"MagicCloudPairingManateeUpgradedAccount"));
    if (!v23)
    {
      -[MPCloudKit_Manatee setuserPreference:value:sync:]( self,  "setuserPreference:value:sync:",  @"MagicCloudPairingManateeUpgradedAccount",  &__kCFBooleanTrue,  1LL);
      os_log_t v24 = sub_100060178("MagicPairing");
      os_log_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "resetMasterZone Master zone has been upgraded successfully",  buf,  2u);
      }

      -[MPCloudKit_Manatee accountStatusDidChange:](self, "accountStatusDidChange:", 0LL);
      dispatch_time_t v26 = dispatch_time(0LL, 10000000000LL);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100085034;
      block[3] = &unk_100206490;
      void block[4] = self;
      id v33 = v6;
      id v34 = v7;
      dispatch_after(v26, &_dispatch_main_q, block);
    }
  }
}

- (void)_updateMasterZoneBlob:(id)a3 accessoryblob:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  os_log_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
  [v8 beginTransaction:@"updateMasterZoneBlob"];

  os_log_t v9 = sub_100060178("MagicPairing");
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneBlob](self, "recordZoneBlob"));
    os_log_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 zoneID]);
    id v13 = (CKRecord *)objc_claimAutoreleasedReturnValue([v12 zoneName]);
    *(_DWORD *)__int128 buf = 138412290;
    id v30 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  " >>>updateMasterZoneBlob  Record Zone %@",  buf,  0xCu);
  }

  dispatch_time_t v14 = objc_alloc(&OBJC_CLASS___CKRecordID);
  dispatch_semaphore_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneBlob](self, "recordZoneBlob"));
  os_log_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 zoneID]);
  id v17 = -[CKRecordID initWithRecordName:zoneID:]( v14,  "initWithRecordName:zoneID:",  @"EncryptedMasterKeyBlob",  v16);

  os_log_t v18 = -[CKRecord initWithRecordType:recordID:]( objc_alloc(&OBJC_CLASS___CKRecord),  "initWithRecordType:recordID:",  @"MasterKey",  v17);
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValues](v18, "encryptedValues"));
  [v19 setObject:v7 forKeyedSubscript:@"EncryptedMasterKeyBlob"];

  os_log_t v20 = sub_100060178("MagicPairing");
  os_log_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v30 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "updateMasterZoneBlob: kMagicCloudPairingProtectedMasterBlob fetch: encryptedBlob %@",  buf,  0xCu);
  }

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee cloudKitDatabase](self, "cloudKitDatabase"));
  __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneBlob](self, "recordZoneBlob"));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1000853DC;
  v26[3] = &unk_100208F00;
  v26[4] = self;
  id v27 = v18;
  id v28 = v6;
  id v24 = v6;
  os_log_t v25 = v18;
  [v22 saveRecordZone:v23 completionHandler:v26];
}

- (void)resetAccessoryZone:(id)a3
{
  id v4 = a3;
  if (-[MPCloudKit_Manatee isAccountActive](self, "isAccountActive"))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
    [v5 beginTransaction:@"resetAccessoryZone"];

    dispatch_semaphore_t v6 = dispatch_semaphore_create(0LL);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee cloudKitDatabase](self, "cloudKitDatabase"));
    os_log_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
    os_log_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneID]);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100085990;
    v16[3] = &unk_100208E40;
    id v10 = v6;
    id v17 = v10;
    [v7 deleteRecordZoneWithID:v9 completionHandler:v16];

    dispatch_time_t v11 = dispatch_time(0LL, 10000000000LL);
    dispatch_semaphore_wait(v10, v11);
    os_log_t v12 = sub_100060178("MagicPairing");
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_semaphore_t v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "resetAccessoryZone record", v15, 2u);
    }

    -[MPCloudKit_Manatee upgradeAccessoryBlob:withRetryCount:](self, "upgradeAccessoryBlob:withRetryCount:", v4, 4LL);
    dispatch_time_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
    [v14 endTransaction:@"resetAccessoryZone"];
  }
}

- (void)upgradeAccessoryBlob:(id)a3 withRetryCount:(unint64_t)a4
{
  id v6 = a3;
  if (-[MPCloudKit_Manatee isAccountActive](self, "isAccountActive"))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
    [v7 beginTransaction:@"upgradeAccessoryBlob"];

    os_log_t v8 = sub_100060178("MagicPairing");
    os_log_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
      dispatch_time_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneID]);
      os_log_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 zoneName]);
      *(_DWORD *)__int128 buf = 138412290;
      id v29 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Manatee: upgradeAccessoryBlob:  Creating Record Zone %@",  buf,  0xCu);
    }

    id v13 = objc_alloc(&OBJC_CLASS___CKRecordID);
    dispatch_time_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
    dispatch_semaphore_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 zoneID]);
    os_log_t v16 = -[CKRecordID initWithRecordName:zoneID:]( v13,  "initWithRecordName:zoneID:",  @"EncryptedAccessoryBlob",  v15);

    id v17 = -[CKRecord initWithRecordType:recordID:]( objc_alloc(&OBJC_CLASS___CKRecord),  "initWithRecordType:recordID:",  @"AccessoryDatabase",  v16);
    os_log_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValues](v17, "encryptedValues"));
    [v18 setObject:v6 forKeyedSubscript:@"EncryptedAccessoryBlob"];

    os_log_t v19 = sub_100060178("MagicPairing");
    os_log_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v29 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Manatee: upgradeAccessoryBlob: MagicCloudPairingProtectedAccessoryBlob fetch: encryptedBlob %@",  buf,  0xCu);
    }

    os_log_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee cloudKitDatabase](self, "cloudKitDatabase"));
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee recordZoneAccessoryDatabase](self, "recordZoneAccessoryDatabase"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100085D20;
    v24[3] = &unk_100208F28;
    unint64_t v27 = a4;
    v24[4] = self;
    id v25 = v6;
    dispatch_time_t v26 = v17;
    __int16 v23 = v17;
    [v21 saveRecordZone:v22 completionHandler:v24];
  }
}

- (NSString)cloudContainerIdentifier
{
  return (NSString *)@"com.apple.securedBluetooth";
}

- (OS_dispatch_queue)pushDelegateQueue
{
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MPCloudKit_Manatee pushQueue](self, "pushQueue"));

  if (!v3)
  {
    dispatch_queue_attr_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v5 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v4);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.bluetooth.mpcloudkit.push", v5);
    -[MPCloudKit_Manatee setPushQueue:](self, "setPushQueue:", v6);
  }

  return -[MPCloudKit_Manatee pushQueue](self, "pushQueue");
}

- (void)didReceiveWithMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  dispatch_queue_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[CKNotification notificationFromRemoteNotificationDictionary:]( &OBJC_CLASS___CKNotification,  "notificationFromRemoteNotificationDictionary:",  v5));
  os_log_t v7 = sub_100060178("MagicPairing");
  os_log_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 topic]);
    *(_DWORD *)__int128 buf = 138412546;
    os_log_t v16 = v9;
    __int16 v17 = 2112;
    os_log_t v18 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Manatee: ***** APS Push received: %@ \n %@ \n",  buf,  0x16u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 containerIdentifier]);
  unsigned int v11 = [v10 isEqualToString:@"com.apple.securedBluetooth"];

  if (v11)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000866FC;
    v12[3] = &unk_100206358;
    id v13 = v6;
    dispatch_time_t v14 = self;
    dispatch_async(&_dispatch_main_q, v12);
  }
}

- (void)didReceiveWithPublicToken:(id)a3
{
  id v3 = a3;
  if (IsAppleInternalBuild(v3))
  {
    os_log_t v4 = sub_100060178("MagicPairing");
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_queue_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 base64EncodedStringWithOptions:0]);
      int v7 = 138412290;
      os_log_t v8 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Manatee: Received public token %@ on connection",  (uint8_t *)&v7,  0xCu);
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
    unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 base64EncodedStringWithOptions:0]);
      int v13 = 138412802;
      dispatch_time_t v14 = v12;
      __int16 v15 = 2112;
      id v16 = v8;
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Manatee: Received per-topic push token %@ for topic %@ identifier %@ on connection",  (uint8_t *)&v13,  0x20u);
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

- (BOOL)isWriteMasterKeysInProgress
{
  return self->_isWriteMasterKeysInProgress;
}

- (void)setIsWriteMasterKeysInProgress:(BOOL)a3
{
  self->_isWriteMasterKeysInProgress = a3;
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