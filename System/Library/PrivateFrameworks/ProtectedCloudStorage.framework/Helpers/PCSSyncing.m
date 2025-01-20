@interface PCSSyncing
+ (id)defaultPCSSyncing;
- (BOOL)activityIsScheduled:(id)a3;
- (BOOL)ensureMKExists:(_PCSIdentitySetData *)a3 error:(__CFError *)a4;
- (BOOL)forceSyncNeeded:(id)a3 dsid:(id)a4;
- (BOOL)getServicesToRoll:(id)a3 handler:(id)a4;
- (BOOL)shouldRoll;
- (BOOL)shouldRollStingray;
- (NSOperationQueue)serialOperationQueue;
- (NSUserDefaults)settings;
- (OS_dispatch_queue)internalQueue;
- (OS_dispatch_queue)registryQueue;
- (OS_xpc_object)scheduledKeyrollActivity;
- (PCSAccountsModel)accounts;
- (PCSKeySyncing)manager;
- (PCSMobileBackup)mobileBackup;
- (PCSSyncing)initWithPCSKeySyncing:(id)a3;
- (PCSUserRegistry)registry;
- (_PCSIdentitySetData)identityCopySet:(id)a3;
- (id)getRollEpoch;
- (id)healthSummary;
- (id)initForTesting;
- (int64_t)attemptTimer;
- (void)checkForBackupStateChange;
- (void)clearNextSyncNegativeCache;
- (void)createIdentity:(id)a3 dsid:(id)a4 roll:(BOOL)a5 sync:(BOOL)a6 forceSync:(BOOL)a7 complete:(id)a8;
- (void)disableWalrusForAccount:(id)a3 withParameters:(id)a4 complete:(id)a5;
- (void)enableWalrusForAccount:(id)a3 withParameters:(id)a4 complete:(id)a5;
- (void)fetchAllDeviceKeys:(id)a3 withReply:(id)a4;
- (void)fetchStats:(id)a3;
- (void)getAllClients:(id)a3;
- (void)getHealthSummary:(id)a3;
- (void)keyRollPending:(id)a3 complete:(id)a4;
- (void)manateeStatus:(id)a3 complete:(id)a4;
- (void)migrateToiCDPForAccount:(id)a3 withParameters:(id)a4 complete:(id)a5;
- (void)mobileBackupRecordIDsWithReply:(id)a3;
- (void)mobileBackupStatus:(id)a3;
- (void)notifyDailyEvent;
- (void)notifyEvent:(id)a3;
- (void)notifyInternalEvent:(id)a3;
- (void)queuedCheckRegistry:(id)a3 withReply:(id)a4;
- (void)recordEpochForKeyroll;
- (void)repairWalrus;
- (void)restoreMobileBackup:(BOOL)a3 dsid:(id)a4 withReply:(id)a5;
- (void)rollingComplete:(BOOL)a3;
- (void)scheduleRollAttempt;
- (void)setAccounts:(id)a3;
- (void)setInternalQueue:(id)a3;
- (void)setManager:(id)a3;
- (void)setMobileBackup:(id)a3;
- (void)setRegistry:(id)a3;
- (void)setRegistryQueue:(id)a3;
- (void)setScheduledKeyrollActivity:(id)a3;
- (void)setSerialOperationQueue:(id)a3;
- (void)setSettings:(id)a3;
- (void)setupIdentitiesForAccount:(id)a3 withParameters:(id)a4 optional:(BOOL)a5;
- (void)setupIdentitiesWithParameters:(id)a3 complete:(id)a4;
- (void)syncKeys:(id)a3 withReply:(id)a4;
- (void)triggerCKKSSyncForService:(id)a3 dsid:(id)a4 publicKeys:(id)a5 complete:(id)a6;
- (void)triggerDaily:(id)a3 withReply:(id)a4;
- (void)triggerEscrowSyncWithDSID:(id)a3 accountIdentifier:(id)a4 settingsKeyExpirationDate:(id)a5 settingsKeyIdentifier:(id)a6 complete:(id)a7;
- (void)triggerKeyRolling;
- (void)triggerSyncingWithEscrowProxy:(id)a3 dsid:(id)a4 publicKeys:(id)a5 accountIdentifier:(id)a6 settingsKeyExpirationDate:(id)a7 settingsKeyIdentifier:(id)a8 complete:(id)a9;
- (void)triggerUserRegistryCheck:(id)a3 withReply:(id)a4;
- (void)triggerWatchSyncing:(id)a3;
- (void)userDBBackupRecordIDsWithReply:(id)a3;
- (void)wStateChanged;
@end

@implementation PCSSyncing

+ (id)defaultPCSSyncing
{
  if (qword_10002BDB0 != -1) {
    dispatch_once(&qword_10002BDB0, &stru_100024FE8);
  }
  return (id)qword_10002BDA8;
}

- (id)initForTesting
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PCSSyncing;
  v2 = -[PCSSyncing init](&v13, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.ProtectedCloudStorage", v4);
    -[PCSSyncing setInternalQueue:](v2, "setInternalQueue:", v5);

    v6 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    serialOperationQueue = v2->_serialOperationQueue;
    v2->_serialOperationQueue = v6;

    -[NSOperationQueue setMaxConcurrentOperationCount:]( v2->_serialOperationQueue,  "setMaxConcurrentOperationCount:",  1LL);
    v8 = objc_alloc_init(&OBJC_CLASS___NSUserDefaults);
    settings = v2->_settings;
    v2->_settings = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[PCSAccountsModel defaultAccountsModel](&OBJC_CLASS___PCSAccountsModel, "defaultAccountsModel"));
    -[PCSSyncing setAccounts:](v2, "setAccounts:", v10);

    v11 = v2;
  }

  return v2;
}

- (PCSSyncing)initWithPCSKeySyncing:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___PCSSyncing;
  dispatch_queue_t v5 = -[PCSSyncing init](&v17, "init");
  if (v5)
  {
    dispatch_queue_attr_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v6);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.ProtectedCloudStorage", v7);
    -[PCSSyncing setInternalQueue:](v5, "setInternalQueue:", v8);

    v9 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    serialOperationQueue = v5->_serialOperationQueue;
    v5->_serialOperationQueue = v9;

    -[NSOperationQueue setMaxConcurrentOperationCount:]( v5->_serialOperationQueue,  "setMaxConcurrentOperationCount:",  1LL);
    v11 = objc_alloc_init(&OBJC_CLASS___NSUserDefaults);
    settings = v5->_settings;
    v5->_settings = v11;

    -[PCSSyncing setManager:](v5, "setManager:", v4);
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(+[PCSAccountsModel defaultAccountsModel](&OBJC_CLASS___PCSAccountsModel, "defaultAccountsModel"));
    -[PCSSyncing setAccounts:](v5, "setAccounts:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[PCSMobileBackup defaultMobileBackup](&OBJC_CLASS___PCSMobileBackup, "defaultMobileBackup"));
    -[PCSSyncing setMobileBackup:](v5, "setMobileBackup:", v14);

    -[PCSSyncing scheduleRollAttempt](v5, "scheduleRollAttempt");
    v15 = v5;
  }

  return v5;
}

- (id)healthSummary
{
  dispatch_queue_attr_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  &off_100026640,  @"version");
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[PCSAccountsModel accountForCurrentPersona]( &OBJC_CLASS___PCSAccountsModel,  "accountForCurrentPersona"));
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "aa_personID"));

  if (v5)
  {
    dispatch_queue_attr_t v6 = -[PCSSyncing identityCopySet:](self, "identityCopySet:", v5);
    if (v6)
    {
      v7 = v6;
      char v8 = 0;
      goto LABEL_6;
    }
  }

  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"noDSID");
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"noIdentitySet");
  v7 = 0LL;
  char v8 = 1;
LABEL_6:
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[PCSSyncing shouldRoll](self, "shouldRoll")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v9, @"shouldRoll");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PCSSyncing getRollEpoch](self, "getRollEpoch"));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  +[PCSAnalytics fuzzyDaysSinceDate:](&OBJC_CLASS___PCSAnalytics, "fuzzyDaysSinceDate:", v10)));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v11, @"roll");

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PCSSyncing scheduledKeyrollActivity](self, "scheduledKeyrollActivity"));
  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[PCSSyncing activityIsScheduled:](self, "activityIsScheduled:", v12)));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v13,  @"keyrollScheduled");

  if ((v8 & 1) == 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[PCSMetrics metrics](&OBJC_CLASS___PCSMetrics, "metrics"));
    [v14 addMetricsToHealthSummary:v3 withIdentitySet:v7];

    CFRelease(v7);
  }

  return v3;
}

- (void)triggerWatchSyncing:(id)a3
{
}

- (void)notifyInternalEvent:(id)a3
{
  id v4 = a3;
  if (qword_10002BDB8 != -1) {
    dispatch_once(&qword_10002BDB8, &stru_100025008);
  }
  dispatch_queue_t v5 = (os_log_s *)qword_10002BDE0;
  if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Got darwin notification %@",  (uint8_t *)&v9,  0xCu);
  }

  if ([v4 isEqualToString:@"_CDPWalrusStateChangeDarwinNotification"])
  {
    -[PCSSyncing wStateChanged](self, "wStateChanged");
  }

  else
  {
    if (-[PCSSyncing shouldRoll](self, "shouldRoll")) {
      -[PCSSyncing triggerKeyRolling](self, "triggerKeyRolling");
    }
    if (([(id)qword_10002BDC8 containsObject:v4] & 1) != 0
      || [(id)qword_10002BDD0 containsObject:v4])
    {
      dispatch_queue_attr_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[PCSSyncing mobileBackup](self, "mobileBackup"));
      unsigned int v7 = [v6 isBackupEnabled];

      if (v7)
      {
        char v8 = (os_log_s *)qword_10002BDE0;
        if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v9) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "MOBSTATE Notifying registry.",  (uint8_t *)&v9,  2u);
        }

        -[PCSSyncing notifyKeyRegistry](self, "notifyKeyRegistry");
      }
    }
  }
}

- (void)wStateChanged
{
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[PCSAccountsModel accountForCurrentPersona]( &OBJC_CLASS___PCSAccountsModel,  "accountForCurrentPersona"));
  uint64_t v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "aa_personID"));

  id v4 = (void *)v8;
  if (v8)
  {
    dispatch_queue_t v5 = -[PCSSyncing identityCopySet:](self, "identityCopySet:", v8);
    id v4 = (void *)v8;
    if (v5)
    {
      dispatch_queue_attr_t v6 = v5;
      unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[PCSMetrics metrics](&OBJC_CLASS___PCSMetrics, "metrics"));
      [v7 updateCurrentWState:v6];

      CFRelease(v6);
      id v4 = (void *)v8;
    }
  }
}

- (void)clearNextSyncNegativeCache
{
  id v15 = 0LL;
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[PCSAccountsModel settingsKeyForKey:error:]( &OBJC_CLASS___PCSAccountsModel,  "settingsKeyForKey:error:",  @"nextRegistrySync",  &v15));
  id v4 = v15;
  dispatch_queue_t v5 = v4;
  if (v3) {
    BOOL v6 = v4 == 0LL;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PCSSyncing settings](self, "settings"));
    [v8 removeObjectForKey:v3];
  }

  else
  {
    unsigned int v7 = (os_log_s *)qword_10002BDE0;
    if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      objc_super v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Failed to get key: %@", buf, 0xCu);
    }
  }

  id v14 = 0LL;
  int v9 = (void *)objc_claimAutoreleasedReturnValue( +[PCSAccountsModel settingsKeyForKey:error:]( &OBJC_CLASS___PCSAccountsModel,  "settingsKeyForKey:error:",  @"nextRegistrySyncEnterprise",  &v14));
  id v10 = v14;
  v11 = v10;
  if (!v3 || v10)
  {
    objc_super v13 = (os_log_s *)qword_10002BDE0;
    if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      objc_super v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Failed to get key: %@", buf, 0xCu);
    }
  }

  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PCSSyncing settings](self, "settings"));
    [v12 removeObjectForKey:v9];
  }
}

- (void)mobileBackupStatus:(id)a3
{
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[PCSSyncing mobileBackup](self, "mobileBackup"));
  (*((void (**)(id, id, void))a3 + 2))(v5, [v6 isBackupEnabled], 0);
}

- (id)getRollEpoch
{
  id v15 = 0LL;
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[PCSAccountsModel settingsKeyForKey:error:]( &OBJC_CLASS___PCSAccountsModel,  "settingsKeyForKey:error:",  kPCSPendingRollEpoch,  &v15));
  id v4 = v15;
  id v5 = v4;
  if (v3) {
    BOOL v6 = v4 == 0LL;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue(-[PCSSyncing settings](self, "settings"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v3]);

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      if ([v10 compare:v11] == (id)1 || (objc_msgSend(v10, "timeIntervalSince1970"), v12 == 0.0))
      {
        objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(-[PCSSyncing settings](self, "settings"));
        [v13 removeObjectForKey:v3];

        id v8 = 0LL;
      }

      else
      {
        id v8 = v10;
      }
    }

    else
    {
      id v8 = 0LL;
    }
  }

  else
  {
    unsigned int v7 = (os_log_s *)qword_10002BDE0;
    if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      objc_super v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Failed to get key: %@", buf, 0xCu);
    }

    id v8 = 0LL;
  }

  return v8;
}

- (void)recordEpochForKeyroll
{
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v10 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[PCSAccountsModel settingsKeyForKey:error:]( &OBJC_CLASS___PCSAccountsModel,  "settingsKeyForKey:error:",  kPCSPendingRollEpoch,  &v10));
  id v5 = v10;
  BOOL v6 = v5;
  if (v4) {
    BOOL v7 = v5 == 0LL;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue(-[PCSSyncing settings](self, "settings"));
    [v9 setObject:v3 forKey:v4];
  }

  else
  {
    id v8 = (os_log_s *)qword_10002BDE0;
    if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      double v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Failed to get key: %@", buf, 0xCu);
    }
  }
}

- (void)checkForBackupStateChange
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PCSSyncing serialOperationQueue](self, "serialOperationQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100011224;
  v6[3] = &unk_100025030;
  objc_copyWeak(&v9, &location);
  id v5 = v3;
  BOOL v7 = v5;
  id v8 = self;
  [v4 addOperationWithBlock:v6];

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

- (BOOL)shouldRoll
{
  dispatch_semaphore_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PCSSyncing getRollEpoch](self, "getRollEpoch"));
  if (v3)
  {
    id v4 = (os_log_s *)qword_10002BDE0;
    if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "There is a pending keyRoll for epoch %@",  (uint8_t *)&v7,  0xCu);
    }

    BOOL v5 = 1;
  }

  else
  {
    BOOL v5 = -[PCSSyncing shouldRollStingray](self, "shouldRollStingray");
  }

  return v5;
}

- (BOOL)shouldRollStingray
{
  if (!_os_feature_enabled_impl("ProtectedCloudStorage", "ADPRoll"))
  {
    id v22 = 0LL;
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( +[PCSAccountsModel settingsKeyForKey:error:]( &OBJC_CLASS___PCSAccountsModel,  "settingsKeyForKey:error:",  kPCSSettingStingrayRoll,  &v22));
    id v6 = v22;
    int v7 = v6;
    if (v5) {
      BOOL v8 = v6 == 0LL;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PCSSyncing settings](self, "settings"));
      v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v5]);

      if (v11)
      {
        uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDate);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0) {
          id v13 = v11;
        }
        else {
          id v13 = (id)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
        }
        id v15 = v13;
        else {
          int64_t v16 = XPC_ACTIVITY_INTERVAL_8_HOURS;
        }
        objc_super v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
        [v17 timeIntervalSinceDate:v15];
        double v19 = v18;

        if (v19 > (double)v16)
        {

          BOOL v4 = 1;
          goto LABEL_26;
        }

        v20 = (os_log_s *)qword_10002BDE0;
        if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v24 = v15;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Insufficient time elapsed since previous Stingray key roll attempt (%{public}@)",  buf,  0xCu);
        }
      }

      else
      {
        id v14 = (os_log_s *)qword_10002BDE0;
        if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Stingray key roll not required", buf, 2u);
        }
      }
    }

    else
    {
      id v9 = (os_log_s *)qword_10002BDE0;
      BOOL v4 = 0;
      if (!os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
      {
LABEL_26:

        return v4;
      }

      *(_DWORD *)buf = 138412290;
      v24 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Failed to get key: %@", buf, 0xCu);
    }

    BOOL v4 = 0;
    goto LABEL_26;
  }

  dispatch_semaphore_t v3 = (os_log_s *)qword_10002BDE0;
  BOOL v4 = 0;
  if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Feature enabled, no stingray roll", buf, 2u);
    return 0;
  }

  return v4;
}

- (int64_t)attemptTimer
{
  dispatch_semaphore_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PCSSyncing getRollEpoch](self, "getRollEpoch"));
  BOOL v4 = v3;
  if (v3)
  {
    [v3 timeIntervalSinceNow];
    if (v5 <= 0.0)
    {
      double v12 = -v5;
      int64_t v6 = XPC_ACTIVITY_INTERVAL_5_MIN;
      if (v12 >= (double)XPC_ACTIVITY_INTERVAL_5_MIN)
      {
        int64_t v6 = XPC_ACTIVITY_INTERVAL_30_MIN;
        if (v12 >= (double)XPC_ACTIVITY_INTERVAL_30_MIN)
        {
          int64_t v6 = XPC_ACTIVITY_INTERVAL_1_HOUR;
          if (v12 >= (double)XPC_ACTIVITY_INTERVAL_1_HOUR)
          {
            int64_t v6 = XPC_ACTIVITY_INTERVAL_4_HOURS;
          }
        }
      }
    }

    else
    {
      int64_t v6 = 0LL;
    }
  }

  else
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue(-[PCSSyncing settings](self, "settings"));
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:kPCSSettingStingrayRoll]);

    int v9 = _os_feature_enabled_impl("ProtectedCloudStorage", "ShorterRollInterval");
    id v10 = &XPC_ACTIVITY_INTERVAL_1_MIN;
    if (!v9) {
      id v10 = &XPC_ACTIVITY_INTERVAL_8_HOURS;
    }
    int64_t v11 = *v10;
    if (v8) {
      int64_t v6 = v11;
    }
    else {
      int64_t v6 = 0LL;
    }
  }

  return v6;
}

- (BOOL)activityIsScheduled:(id)a3
{
  if (!a3) {
    return 0;
  }
  xpc_object_t v3 = xpc_activity_copy_criteria((xpc_activity_t)a3);
  BOOL v4 = v3;
  if (v3)
  {
    xpc_object_t value = xpc_dictionary_get_value(v3, XPC_ACTIVITY_RANDOM_INITIAL_DELAY);
    int64_t v6 = (void *)objc_claimAutoreleasedReturnValue(value);
    BOOL v7 = v6 == 0LL;
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)scheduleRollAttempt
{
  int64_t v3 = -[PCSSyncing attemptTimer](self, "attemptTimer");
  if (v3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100011CD8;
    v5[3] = &unk_100025058;
    v5[4] = self;
    v5[5] = v3;
    xpc_activity_register("com.apple.ProtectedCloudStorage.scheduledKeyroll", XPC_ACTIVITY_CHECK_IN, v5);
  }

  else
  {
    BOOL v4 = (os_log_s *)qword_10002BDE0;
    if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "No identity key roll is required, unscheduling keyroll activity.",  buf,  2u);
    }

    -[PCSSyncing setScheduledKeyrollActivity:](self, "setScheduledKeyrollActivity:", 0LL);
    xpc_activity_unregister("com.apple.ProtectedCloudStorage.scheduledKeyroll");
  }

- (BOOL)getServicesToRoll:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[PCSSyncing getRollEpoch](self, "getRollEpoch"));
  int v9 = -[PCSSyncing identityCopySet:](self, "identityCopySet:", v6);
  id v10 = v9;
  if (v9)
  {
    uint64_t v35 = 0LL;
    char v11 = PCSIdentitySetIsWalrusWithForceFetch(v9, 1LL, &v35);
    if (v35) {
      char v12 = 1;
    }
    else {
      char v12 = v11;
    }
    char v13 = _os_feature_enabled_impl("ProtectedCloudStorage", "ADPRoll") ^ 1;
    uint64_t NoRollStingrayServiceTypes = _PCSServiceItemsGetNoRollStingrayServiceTypes();
    id v15 = (void *)objc_claimAutoreleasedReturnValue(NoRollStingrayServiceTypes);
    *(void *)buf = 0LL;
    v30 = buf;
    uint64_t v31 = 0x3032000000LL;
    v32 = sub_100012114;
    v33 = sub_100012124;
    id v34 = 0LL;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10001212C;
    v19[3] = &unk_100025080;
    id v20 = v8;
    v26 = v10;
    id v24 = v7;
    char v27 = v12;
    char v28 = v13;
    id v16 = v15;
    id v21 = v16;
    v25 = buf;
    id v22 = v6;
    v23 = self;
    PCSServiceItemsInfoIteration(v19);
    CFRelease(v10);

    _Block_object_dispose(buf, 8);
  }

  else
  {
    objc_super v17 = (os_log_s *)qword_10002BDE0;
    if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "getServicesToRoll: no identity set", buf, 2u);
    }
  }

  return v10 != 0LL;
}

- (void)rollingComplete:(BOOL)a3
{
  id v18 = 0LL;
  double v5 = (void *)objc_claimAutoreleasedReturnValue( +[PCSAccountsModel settingsKeyForKey:error:]( &OBJC_CLASS___PCSAccountsModel,  "settingsKeyForKey:error:",  kPCSPendingRollEpoch,  &v18));
  id v6 = v18;
  id v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0LL;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PCSSyncing settings](self, "settings"));
    [v10 removeObjectForKey:v5];
  }

  else
  {
    int v9 = (os_log_s *)qword_10002BDE0;
    if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Failed to get key: %@", buf, 0xCu);
    }
  }

  if (!a3)
  {
    id v17 = 0LL;
    char v11 = (void *)objc_claimAutoreleasedReturnValue( +[PCSAccountsModel settingsKeyForKey:error:]( &OBJC_CLASS___PCSAccountsModel,  "settingsKeyForKey:error:",  kPCSSettingStingrayRoll,  &v17));
    id v12 = v17;
    char v13 = v12;
    if (v11) {
      BOOL v14 = v12 == 0LL;
    }
    else {
      BOOL v14 = 0;
    }
    if (v14)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[PCSSyncing settings](self, "settings"));
      [v16 removeObjectForKey:v11];
    }

    else
    {
      id v15 = (os_log_s *)qword_10002BDE0;
      if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v13;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Failed to get key: %@", buf, 0xCu);
      }
    }
  }

  -[PCSSyncing scheduleRollAttempt](self, "scheduleRollAttempt");
}

- (void)triggerKeyRolling
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PCSSyncing serialOperationQueue](self, "serialOperationQueue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100012700;
  v4[3] = &unk_100024DF8;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  [v3 addOperationWithBlock:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (BOOL)ensureMKExists:(_PCSIdentitySetData *)a3 error:(__CFError *)a4
{
  CFTypeRef cf = 0LL;
  uint64_t v6 = _PCSIdentitySetCopyCurrentIdentityInternal(a3, kPCSServiceMaster, &cf);
  if (v6)
  {
    id v7 = (const void *)v6;
    LOBYTE(v8) = 1;
    goto LABEL_3;
  }

  if (CFErrorGetCode((CFErrorRef)cf) != -25300)
  {
    LODWORD(v8) = 0;
    goto LABEL_18;
  }

  CFTypeRef v11 = cf;
  if (cf)
  {
    CFTypeRef cf = 0LL;
    CFRelease(v11);
  }

  id v15 = 0LL;
  unsigned __int8 v12 = +[PCSCKKS fetchWithTimeout:error:]( &OBJC_CLASS___PCSCKKS,  "fetchWithTimeout:error:",  20LL,  &v15);
  id v13 = v15;
  BOOL v8 = v13;
  if ((v12 & 1) != 0)
  {
    id v7 = (const void *)_PCSIdentitySetCopyCurrentIdentityInternal(a3, kPCSServiceMaster, &cf);

    LODWORD(v8) = v7 != 0LL;
    if (v7)
    {
LABEL_3:
      CFTypeRef v9 = cf;
      if (a4 && cf)
      {
        *a4 = (__CFError *)CFRetain(cf);
        CFTypeRef v9 = cf;
      }

      if (v9)
      {
        CFTypeRef cf = 0LL;
        CFRelease(v9);
      }

      if (v7) {
        CFRelease(v7);
      }
      return (char)v8;
    }

- (void)triggerEscrowSyncWithDSID:(id)a3 accountIdentifier:(id)a4 settingsKeyExpirationDate:(id)a5 settingsKeyIdentifier:(id)a6 complete:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  objc_initWeak(&location, self);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[PCSSyncing serialOperationQueue](self, "serialOperationQueue"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10001340C;
  v23[3] = &unk_100025120;
  objc_copyWeak(&v30, &location);
  id v18 = v16;
  id v29 = v18;
  id v19 = v12;
  id v24 = v19;
  id v20 = v13;
  id v25 = v20;
  v26 = self;
  id v21 = v15;
  id v27 = v21;
  id v22 = v14;
  id v28 = v22;
  [v17 addOperationWithBlock:v23];

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

- (BOOL)forceSyncNeeded:(id)a3 dsid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    LOBYTE(v11) = 0;
    goto LABEL_22;
  }

  if (![v6 count])
  {
    id v15 = (os_log_s *)qword_10002BDE0;
    if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v16 = "received empty public keys array, will force CKKS fetch";
LABEL_20:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 2u);
    }

- (void)triggerCKKSSyncForService:(id)a3 dsid:(id)a4 publicKeys:(id)a5 complete:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id inited = objc_initWeak(&location, self);
  if ((PCSSupportsPersonaMultiuser(inited) & 1) == 0)
  {
    id v26 = 0LL;
    unsigned __int8 v15 = +[PCSAccountsModel currentPersonaSupportsPrimaryAccount:]( &OBJC_CLASS___PCSAccountsModel,  "currentPersonaSupportsPrimaryAccount:",  &v26);
    id v16 = v26;
    id v17 = v16;
    if ((v15 & 1) == 0)
    {
      (*((void (**)(id, void, void, id))v13 + 2))(v13, 0LL, 0LL, v16);

      goto LABEL_6;
    }
  }

  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[PCSSyncing serialOperationQueue](self, "serialOperationQueue"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100013DB0;
  v19[3] = &unk_100025170;
  objc_copyWeak(&v25, &location);
  id v24 = v13;
  id v20 = v10;
  __int128 v21 = self;
  id v22 = v12;
  id v23 = v11;
  [v18 addOperationWithBlock:v19];

  objc_destroyWeak(&v25);
LABEL_6:
  objc_destroyWeak(&location);
}

- (void)triggerSyncingWithEscrowProxy:(id)a3 dsid:(id)a4 publicKeys:(id)a5 accountIdentifier:(id)a6 settingsKeyExpirationDate:(id)a7 settingsKeyIdentifier:(id)a8 complete:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  CFTypeRef cf = 0LL;
  if (CFEqual(v15, kPCSServiceMaster))
  {
    id v22 = @"unsupported service";
    uint64_t v23 = 34LL;
LABEL_3:
    _PCSError(&cf, v23, v22);
    goto LABEL_4;
  }

  id v25 = -[PCSSyncing identityCopySet:](self, "identityCopySet:", v16);
  if (!v25)
  {
    id v22 = @"cannot create identity set";
    uint64_t v23 = 27LL;
    goto LABEL_3;
  }

  CFTypeRef v24 = v25;
  if (v15) {
    int IsManatee = PCSServiceItemTypeIsManatee(v15);
  }
  else {
    int IsManatee = 0;
  }
  int v27 = PCSIdentitySetIsWalrusWithForceFetch(v24, 1LL, &cf);
  if (cf)
  {
    int v34 = v27;
    int v32 = IsManatee;
    id v33 = v17;
    CFErrorDomain Domain = CFErrorGetDomain((CFErrorRef)cf);
    CFIndex Code = CFErrorGetCode((CFErrorRef)cf);
    if ((!CFEqual(Domain, kPCSErrorDomain) || Code != 90) && (!CFEqual(Domain, OctagonErrorDomain) || Code != 29))
    {
      CFRelease(v24);
      uint64_t v31 = (os_log_s *)qword_10002BDE0;
      if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFTypeRef v37 = cf;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Failed to get W status: %@", buf, 0xCu);
      }

      (*((void (**)(id, void, void, CFTypeRef))v21 + 2))(v21, 0LL, 0LL, cf);
      CFTypeRef v24 = cf;
      id v17 = v33;
      if (cf) {
        goto LABEL_5;
      }
      goto LABEL_7;
    }

    CFTypeRef v30 = cf;
    id v17 = v33;
    int IsManatee = v32;
    int v27 = v34;
    if (cf)
    {
      CFTypeRef cf = 0LL;
      CFRelease(v30);
      int v27 = v34;
    }
  }

  if (!v27)
  {
    if (!IsManatee)
    {
      -[PCSSyncing triggerEscrowSyncWithDSID:accountIdentifier:settingsKeyExpirationDate:settingsKeyIdentifier:complete:]( self,  "triggerEscrowSyncWithDSID:accountIdentifier:settingsKeyExpirationDate:settingsKeyIdentifier:complete:",  v16,  v18,  v19,  v20,  v21);
      goto LABEL_6;
    }

    goto LABEL_25;
  }

  if (-[PCSSyncing ensureMKExists:error:](self, "ensureMKExists:error:", v24, &cf))
  {
    if ((IsManatee & 1) == 0) {
      -[PCSSyncing triggerEscrowSyncWithDSID:accountIdentifier:settingsKeyExpirationDate:settingsKeyIdentifier:complete:]( self,  "triggerEscrowSyncWithDSID:accountIdentifier:settingsKeyExpirationDate:settingsKeyIdentifier:complete:",  v16,  v18,  v19,  v20,  &stru_1000251B0);
    }
LABEL_25:
    -[PCSSyncing triggerCKKSSyncForService:dsid:publicKeys:complete:]( self,  "triggerCKKSSyncForService:dsid:publicKeys:complete:",  v15,  v16,  v17,  v21);
    goto LABEL_6;
  }

  CFRelease(v24);
LABEL_4:
  (*((void (**)(id, void, void, CFTypeRef))v21 + 2))(v21, 0LL, 0LL, cf);
  CFTypeRef v24 = cf;
  if (cf)
  {
LABEL_5:
    CFTypeRef cf = 0LL;
LABEL_6:
    CFRelease(v24);
  }

- (void)setupIdentitiesForAccount:(id)a3 withParameters:(id)a4 optional:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_initWeak(&location, self);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PCSSyncing serialOperationQueue](self, "serialOperationQueue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000144E4;
  v13[3] = &unk_100024BB0;
  objc_copyWeak(&v16, &location);
  id v11 = v9;
  id v14 = v11;
  BOOL v17 = a5;
  id v12 = v8;
  id v15 = v12;
  [v10 addOperationWithBlock:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)migrateToiCDPForAccount:(id)a3 withParameters:(id)a4 complete:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PCSSyncing serialOperationQueue](self, "serialOperationQueue"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100014810;
  v14[3] = &unk_100024B38;
  objc_copyWeak(&v17, &location);
  id v12 = v9;
  id v15 = v12;
  id v13 = v10;
  id v16 = v13;
  [v11 addOperationWithBlock:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)enableWalrusForAccount:(id)a3 withParameters:(id)a4 complete:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PCSSyncing serialOperationQueue](self, "serialOperationQueue"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10001499C;
  v14[3] = &unk_100024B38;
  objc_copyWeak(&v17, &location);
  id v12 = v9;
  id v15 = v12;
  id v13 = v10;
  id v16 = v13;
  [v11 addOperationWithBlock:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)disableWalrusForAccount:(id)a3 withParameters:(id)a4 complete:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PCSSyncing serialOperationQueue](self, "serialOperationQueue"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100014C10;
  v14[3] = &unk_100024B38;
  objc_copyWeak(&v17, &location);
  id v12 = v9;
  id v15 = v12;
  id v13 = v10;
  id v16 = v13;
  [v11 addOperationWithBlock:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)createIdentity:(id)a3 dsid:(id)a4 roll:(BOOL)a5 sync:(BOOL)a6 forceSync:(BOOL)a7 complete:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  uint64_t v35 = 0LL;
  if (v14)
  {
    if (v15)
    {
      id v17 = -[PCSSyncing identityCopySet:](self, "identityCopySet:", v15);
      id v18 = v17;
      if (v17 && !PCSIdentityGetCDPStatus(v17, v14, &v35))
      {
        id v22 = [[PCSCKKS alloc] initWithIdentitySet:v18 dsid:v15];
        if (v22)
        {
          if (v10 && [v14 isEqualToString:kPCSMessages3])
          {
            v33[0] = _NSConcreteStackBlock;
            v33[1] = 3221225472LL;
            v33[2] = sub_1000150B0;
            v33[3] = &unk_1000251D8;
            uint64_t v23 = dispatch_semaphore_create(0LL);
            int v34 = v23;
            -[PCSSyncing restoreMobileBackup:dsid:withReply:]( self,  "restoreMobileBackup:dsid:withReply:",  0LL,  v15,  v33);
            dispatch_time_t v24 = dispatch_time(0LL, 60000000000LL);
            if (dispatch_semaphore_wait(v23, v24))
            {
              log = (os_log_s *)qword_10002BDE0;
              if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(buf[0]) = 0;
                _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "Timeout expired for best-effort backup recovery. Continuing with CKKS sync.",  (uint8_t *)buf,  2u);
              }
            }
          }

          objc_initWeak(buf, self);
          v28[0] = _NSConcreteStackBlock;
          v28[1] = 3221225472LL;
          v28[2] = sub_1000151C0;
          v28[3] = &unk_100025200;
          objc_copyWeak(&v31, buf);
          id v29 = v14;
          id v30 = v16;
          [v22 createNewIdentity:v29 roll:v11 sync:v10 forceSync:v9 complete:v28];
          CFRelease(v18);

          objc_destroyWeak(&v31);
          objc_destroyWeak(buf);
        }

        else
        {
          _PCSError(&v35, 87LL, @"Manatee not supported on this device");
          (*((void (**)(id, void, void, _PCSIdentitySetData *))v16 + 2))(v16, 0LL, 0LL, v35);
          id v25 = v35;
          if (v35)
          {
            uint64_t v35 = 0LL;
            CFRelease(v25);
          }

          CFRelease(v18);
        }
      }

      else
      {
        _PCSError(&v35, 130LL, @"CDP not supported on this account: %@");
        (*((void (**)(id, void, void, _PCSIdentitySetData *))v16 + 2))(v16, 0LL, 0LL, v35);
        id v21 = v35;
        if (v35)
        {
          uint64_t v35 = 0LL;
          CFRelease(v21);
        }

        if (v18)
        {
          id v20 = v18;
          goto LABEL_14;
        }
      }

      goto LABEL_15;
    }

    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[PCSSyncing accounts](self, "accounts"));
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v19 lastError]);
    _PCSError(&v35, 121LL, @"Failed getting dsid: %@");
  }

  else
  {
    _PCSError(&v35, 124LL, @"No ServiceName Specified");
  }

  (*((void (**)(id, void, void, _PCSIdentitySetData *))v16 + 2))(v16, 0LL, 0LL, v35);
  id v20 = v35;
  if (v35)
  {
    uint64_t v35 = 0LL;
LABEL_14:
    CFRelease(v20);
  }

- (_PCSIdentitySetData)identityCopySet:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  CFTypeRef cf = 0LL;
  if (!v4)
  {
    id v18 = 0LL;
    unsigned int v9 = +[PCSAccountsModel currentPersonaSupportsPrimaryAccount:]( &OBJC_CLASS___PCSAccountsModel,  "currentPersonaSupportsPrimaryAccount:",  &v18);
    id v10 = v18;
    BOOL v11 = (void *)qword_10002BDE0;
    BOOL v12 = os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v12)
      {
        id v13 = v11;
        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[PCSSyncing accounts](self, "accounts"));
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 lastError]);
        *(_DWORD *)buf = 138412290;
        CFTypeRef v23 = v15;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Fail getting dsid: %@", buf, 0xCu);
      }
    }

    else if (v12)
    {
      *(_DWORD *)buf = 138412290;
      CFTypeRef v23 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v11,  OS_LOG_TYPE_DEFAULT,  "Fail getting dsid, error: %@",  buf,  0xCu);
    }

    id v6 = 0LL;
    goto LABEL_14;
  }

  uint64_t v20 = kPCSSetupDSID;
  id v21 = v4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
  uint64_t v7 = PCSIdentitySetCreate(v6, 0LL, &cf);
  if (!v7)
  {
    if (cf)
    {
      id v16 = (os_log_s *)qword_10002BDE0;
      if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFTypeRef v23 = cf;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Failed to get PCS identities: %@",  buf,  0xCu);
      }

      CFRelease(cf);
    }

- (void)repairWalrus
{
  int64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PCSSyncing internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PCSSyncing accounts](self, "accounts"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dsid]);

  id v6 = -[PCSSyncing identityCopySet:](self, "identityCopySet:", v5);
  if (v6)
  {
    uint64_t v7 = v6;
    CFTypeRef cf = 0LL;
    int v8 = PCSIdentitySetIsWalrusWithForceFetch(v6, 1LL, &cf);
    CFRelease(v7);
    if (cf)
    {
      unsigned int v9 = (os_log_s *)qword_10002BDE0;
      if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFTypeRef v17 = cf;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "repairWalrus: failed to get walrus status: %@",  buf,  0xCu);
      }

      CFTypeRef v10 = cf;
      if (cf)
      {
        CFTypeRef cf = 0LL;
        CFRelease(v10);
      }
    }

    else if (v8)
    {
      uint64_t v14 = kPCSSetupDSID;
      id v15 = v5;
      BOOL v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
      -[PCSSyncing enableWalrusForAccount:withParameters:complete:]( self,  "enableWalrusForAccount:withParameters:complete:",  0LL,  v12,  &stru_100025240);
    }
  }

  else
  {
    BOOL v11 = (os_log_s *)qword_10002BDE0;
    if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "repairWalrus: no identity set", buf, 2u);
    }
  }
}

- (void)notifyDailyEvent
{
  int64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PCSSyncing internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100015880;
  block[3] = &unk_100024DA8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)notifyEvent:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PCSSyncing internalQueue](self, "internalQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100015A04;
  v7[3] = &unk_100024998;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)queuedCheckRegistry:(id)a3 withReply:(id)a4
{
  id v5 = a4;
  uint64_t v6 = PCSErrorCreate(83LL, @"PCSUserRegistry disabled");
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  (*((void (**)(id, id))a4 + 2))(v5, v7);
}

- (void)getAllClients:(id)a3
{
  id v4 = (void (**)(id, id, void))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PCSSyncing manager](self, "manager"));
  id v7 = (id)objc_claimAutoreleasedReturnValue([v5 allClients]);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100015B3C;
  v8[3] = &unk_100025268;
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  CFTypeRef v10 = self;
  id v6 = v9;
  [v7 enumerateObjectsUsingBlock:v8];
  v4[2](v4, v6, 0LL);
}

- (void)syncKeys:(id)a3 withReply:(id)a4
{
}

- (void)triggerDaily:(id)a3 withReply:(id)a4
{
  id v5 = (void (**)(id, void *, void))a4;
  -[PCSSyncing notifyDailyEvent](self, "notifyDailyEvent");
  v5[2](v5, &__NSDictionary0__struct, 0LL);
}

- (void)fetchAllDeviceKeys:(id)a3 withReply:(id)a4
{
  id v4 = a4;
  id v5 = (os_log_s *)qword_10002BDE0;
  if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Fetching all device keys", v8, 2u);
  }

  uint64_t v6 = PCSErrorCreate(85LL, @"No user registry");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  (*((void (**)(id, void, void, void, void, void *))v4 + 2))(v4, 0LL, 0LL, 0LL, 0LL, v7);
}

- (void)restoreMobileBackup:(BOOL)a3 dsid:(id)a4 withReply:(id)a5
{
  BOOL v79 = a3;
  id v7 = a4;
  id v8 = a5;
  if ((PCSSupportsPersonaMultiuser(v8) & 1) == 0)
  {
    id v89 = 0LL;
    unsigned __int8 v9 = +[PCSAccountsModel currentPersonaSupportsPrimaryAccount:]( &OBJC_CLASS___PCSAccountsModel,  "currentPersonaSupportsPrimaryAccount:",  &v89);
    id v10 = v89;
    BOOL v11 = v10;
    if ((v9 & 1) == 0)
    {
      (*((void (**)(id, void, void, void, id))v8 + 2))(v8, 0LL, 0LL, 0LL, v10);
      goto LABEL_72;
    }
  }

  BOOL v12 = (os_log_s *)qword_10002BDE0;
  if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = "restore";
    if (v79) {
      id v13 = "test";
    }
    *(_DWORD *)buf = 136315138;
    *(void *)v91 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "PCSRestoreCKBackupWithCompletion: %s",  buf,  0xCu);
  }

  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[PCSAnalytics logger](&OBJC_CLASS___PCSAnalytics, "logger"));
  uint64_t v77 = PCSEventMobileRestore;
  uint64_t v78 = PCSEventMBValidate;
  if (v79) {
    uint64_t v14 = (void *)PCSEventMBValidate;
  }
  else {
    uint64_t v14 = (void *)PCSEventMobileRestore;
  }
  id v15 = v14;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[PCSSyncing registry](self, "registry"));

  if (!v16)
  {
    id v26 = @"No user registry";
    uint64_t v27 = 85LL;
LABEL_20:
    uint64_t v28 = PCSErrorCreate(v27, v26);
    id v25 = (void *)objc_claimAutoreleasedReturnValue(v28);
    (*((void (**)(id, void, void, void, void *))v8 + 2))(v8, 0LL, 0LL, 0LL, v25);
    [v11 logRecoverableError:v25 forEvent:v15 withAttributes:0];
    goto LABEL_71;
  }

  if (!v7)
  {
    id v26 = @"DSID missing";
    uint64_t v27 = 121LL;
    goto LABEL_20;
  }

  CFTypeRef v17 = (void *)objc_claimAutoreleasedReturnValue(-[PCSSyncing registry](self, "registry"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 syncUserRegistry]);

  [v18 waitUntilFinished];
  id v19 = (void *)qword_10002BDE0;
  v81 = v11;
  if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = v19;
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v18 error]);
    *(_DWORD *)buf = 138412290;
    *(void *)v91 = v21;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "restoreMobileBackup: sync finished with: %@",  buf,  0xCu);

    BOOL v11 = v81;
  }

  id v22 = (void *)objc_claimAutoreleasedReturnValue([v18 error]);

  if (v22)
  {
    CFTypeRef v23 = (void *)objc_claimAutoreleasedReturnValue([v18 error]);
    uint64_t v24 = CKXPCSuitableError();
    id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  }

  else
  {
    id v25 = 0LL;
  }

  id v29 = (void *)objc_claimAutoreleasedReturnValue(-[PCSSyncing registry](self, "registry"));
  uint64_t v30 = objc_claimAutoreleasedReturnValue([v29 allMobileBackupKeys]);

  v75 = (void *)v30;
  if (!v30)
  {
    uint64_t v64 = 0LL;
    unsigned int v80 = 0;
    goto LABEL_68;
  }

  id v31 = (os_log_s *)qword_10002BDE0;
  if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "restoreMobileBackup: got reply from server",  buf,  2u);
  }

  v39 = sub_100016518(kCFAllocatorDefault, v32, v33, v34, v35, v36, v37, v38, kPCSSetupDSID, (uint64_t)v7);
  Keychain = (const void *)PCSIdentitySetCreateKeychain(v39, kPCSServiceEscrow, 0LL);
  v41 = (const void *)PCSIdentitySetCreateKeychain(v39, 0LL, 0LL);
  if (v39) {
    CFRelease(v39);
  }
  if (!Keychain)
  {
    uint64_t v68 = PCSErrorCreate(27LL, @"Failed to get identities");
    uint64_t v69 = objc_claimAutoreleasedReturnValue(v68);

    unsigned int v80 = 0;
    uint64_t v64 = 0LL;
    uint64_t v30 = 0LL;
    id v25 = (void *)v69;
    if (v41) {
      goto LABEL_67;
    }
    goto LABEL_68;
  }

  CFTypeRef v82 = v41;
  v71 = v25;
  v72 = v18;
  id v42 = v15;
  id v73 = v8;
  id v74 = v7;
  __int128 v87 = 0u;
  __int128 v88 = 0u;
  __int128 v85 = 0u;
  __int128 v86 = 0u;
  id v43 = (id)v30;
  id v44 = [v43 countByEnumeratingWithState:&v85 objects:v94 count:16];
  if (!v44)
  {
    uint64_t v30 = 0LL;
    unsigned int v83 = 0;
    unsigned int v80 = 0;
    goto LABEL_64;
  }

  id v45 = v44;
  uint64_t v30 = 0LL;
  unsigned int v83 = 0;
  unsigned int v80 = 0;
  uint64_t v46 = *(void *)v86;
  v47 = @"Would Be";
  if (!v79) {
    v47 = &stru_100025318;
  }
  v76 = v47;
  do
  {
    for (i = 0LL; i != v45; i = (char *)i + 1)
    {
      if (*(void *)v86 != v46) {
        objc_enumerationMutation(v43);
      }
      v49 = *(void **)(*((void *)&v85 + 1) + 8LL * (void)i);
      CFTypeRef cf = 0LL;
      v50 = (void *)objc_claimAutoreleasedReturnValue([v49 data]);
      v51 = (const void *)PCSBackupCopyRecoveredKeyWithIdentitySet(Keychain, 0LL, v50, &cf);

      if (v51)
      {
        ServiceName = (const void *)PCSIdentityGetServiceName(v51);
        if (ServiceName) {
          BOOL v53 = kPCSMessages3 == 0LL;
        }
        else {
          BOOL v53 = 1;
        }
        if (v53)
        {
          if (ServiceName == (const void *)kPCSMessages3)
          {
LABEL_49:
            uint64_t PublicKey = PCSIdentityGetPublicKey(v51);
            v58 = (const void *)PCSIdentitySetCopyIdentity(v82, PublicKey);
            v59 = (os_log_s *)qword_10002BDE0;
            BOOL v60 = os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT);
            if (v58)
            {
              if (v60)
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "Already have identity", buf, 2u);
              }

              CFRelease(v58);
              BOOL v11 = v81;
              [v81 logSuccessForEvent:v42];
              ++v83;
            }

            else
            {
              BOOL v11 = v81;
              if (v60)
              {
                *(_DWORD *)buf = 138412290;
                *(void *)v91 = v76;
                _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_DEFAULT,  "%@ Adding missing identity",  buf,  0xCu);
              }

              if (v79)
              {
                key = (void *)PCSIdentityGetServiceName(v51);
                uint64_t v61 = PCSErrorCreate(120LL, @"%@");
                v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
                objc_msgSend(v81, "logRecoverableError:forEvent:withAttributes:", v62, v78, 0, key);
              }

              else
              {
                PCSIdentitySetAddIdentity(v82, v51);
                [v81 logSuccessForEvent:v77];
              }

              ++v80;
            }
          }
        }

        else if (CFEqual(ServiceName, kPCSMessages3))
        {
          goto LABEL_49;
        }

        CFRelease(v51);
        continue;
      }

      v54 = (os_log_s *)qword_10002BDE0;
      if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v91 = cf;
        _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  "PCSRestoreCKBackupWithCompletion failed with: %@",  buf,  0xCu);
      }

      [v11 logRecoverableError:cf forEvent:v42 withAttributes:0];
      CFTypeRef v55 = cf;
      if (cf)
      {
        CFTypeRef cf = 0LL;
        CFRelease(v55);
      }

      uint64_t v30 = (v30 + 1);
    }

    id v45 = [v43 countByEnumeratingWithState:&v85 objects:v94 count:16];
  }

  while (v45);
LABEL_64:

  v63 = (os_log_s *)qword_10002BDE0;
  uint64_t v64 = v83;
  if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)v91 = v80;
    *(_WORD *)&v91[4] = 1024;
    *(_DWORD *)&v91[6] = v83;
    __int16 v92 = 1024;
    int v93 = v30;
    _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_DEFAULT,  "recover stats: Recovered: %d AlreadyPresent: %d RecoveryIssue: %d",  buf,  0x14u);
  }

  CFRelease(Keychain);
  id v8 = v73;
  id v7 = v74;
  id v15 = v42;
  id v25 = v71;
  id v18 = v72;
  v41 = v82;
  if (v82) {
LABEL_67:
  }
    CFRelease(v41);
LABEL_68:
  v65 = -[NSNumber initWithInt:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithInt:", v30);
  v66 = -[NSNumber initWithInt:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithInt:", v80);
  v67 = -[NSNumber initWithInt:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithInt:", v64);
  (*((void (**)(id, NSNumber *, NSNumber *, NSNumber *, void *))v8 + 2))(v8, v65, v66, v67, v25);

  BOOL v11 = v81;
  if (v25) {
    [v81 logRecoverableError:v25 forEvent:v15 withAttributes:0];
  }

LABEL_71:
LABEL_72:
}

- (void)triggerUserRegistryCheck:(id)a3 withReply:(id)a4
{
}

- (void)mobileBackupRecordIDsWithReply:(id)a3
{
}

- (void)userDBBackupRecordIDsWithReply:(id)a3
{
}

- (void)fetchStats:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___UserRegistryStats);
  (*((void (**)(id, id))a3 + 2))(v4, v5);
}

- (void)manateeStatus:(id)a3 complete:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (void (**)(id, uint64_t))a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[PCSAccountsModel accountForCurrentPersona]( &OBJC_CLASS___PCSAccountsModel,  "accountForCurrentPersona"));
  id v8 = objc_alloc_init(&OBJC_CLASS___OTConfigurationContext);
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "aa_altDSID"));
  [v8 setAltDSID:v9];

  [v8 setContext:OTDefaultContext];
  id v10 = [[OTClique alloc] initWithContextData:v8];
  id v11 = objc_alloc_init(&OBJC_CLASS___OTOperationConfiguration);
  [v11 setUseCachedAccountStatus:1];
  id v29 = 0LL;
  id v12 = [v10 fetchCliqueStatus:v11 error:&v29];
  id v13 = v29;
  if (v12)
  {
    uint64_t v14 = pcsLogObjForScope("reportStatus");
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "PCSReportManateeStatus otStatus: %@",  (uint8_t *)&buf,  0xCu);
    }

    else {
      uint64_t v16 = dword_10001BF90[(void)v12 + 1];
    }
    v6[2](v6, v16);
  }

  if (v5)
  {
    id v28 = 0LL;
    CFTypeRef v17 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSControl controlObject:](&OBJC_CLASS___CKKSControl, "controlObject:", &v28));
    id v24 = v28;
    if (v17)
    {
      *(void *)&__int128 buf = 0LL;
      *((void *)&buf + 1) = &buf;
      uint64_t v35 = 0x2020000000LL;
      int v36 = 9;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_1000169EC;
      v25[3] = &unk_100025290;
      p___int128 buf = &buf;
      id v18 = dispatch_semaphore_create(0LL);
      id v26 = v18;
      [v17 rpcStatus:v5 reply:v25];
      dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
      uint64_t v19 = pcsLogObjForScope("reportStatus");
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = *(_DWORD *)(*((void *)&buf + 1) + 24LL);
        *(_DWORD *)uint64_t v30 = 138412546;
        id v31 = v5;
        __int16 v32 = 1024;
        int v33 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "PCSReportManateeStatus %@ rpcStatus: %d",  v30,  0x12u);
      }

      v6[2](v6, *(unsigned int *)(*((void *)&buf + 1) + 24LL));
      _Block_object_dispose(&buf, 8);
    }

    else
    {
      uint64_t v22 = pcsLogObjForScope("reportStatus");
      CFTypeRef v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v24;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "PCSReportManateeStatus rpcStatus: %@",  (uint8_t *)&buf,  0xCu);
      }

      v6[2](v6, 10LL);
    }
  }

  else
  {
    v6[2](v6, 0LL);
  }
}

- (void)keyRollPending:(id)a3 complete:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  if ((PCSSupportsPersonaMultiuser(v7) & 1) == 0)
  {
    id v14 = 0LL;
    unsigned __int8 v8 = +[PCSAccountsModel currentPersonaSupportsPrimaryAccount:]( &OBJC_CLASS___PCSAccountsModel,  "currentPersonaSupportsPrimaryAccount:",  &v14);
    id v9 = v14;
    id v10 = v9;
    if ((v8 & 1) == 0)
    {
      v7[2](v7, 0LL, v9);
LABEL_11:

      goto LABEL_12;
    }
  }

  if (v6)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[PCSAccountsModel defaultAccountsModel](&OBJC_CLASS___PCSAccountsModel, "defaultAccountsModel"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 dsid]);
    id v12 = -[PCSSyncing identityCopySet:](self, "identityCopySet:", v11);

    if (v12)
    {
      uint64_t IsPending = PCSDaemonKeyRollIsPending(v12, v6);
      CFRelease(v12);
    }

    else
    {
      uint64_t IsPending = 0LL;
    }

    v7[2](v7, IsPending, 0LL);
    goto LABEL_11;
  }

  v7[2](v7, 0LL, 0LL);
LABEL_12:
}

- (void)getHealthSummary:(id)a3
{
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[PCSSyncing healthSummary](self, "healthSummary"));
  (*((void (**)(id, id, void))a3 + 2))(v5, v6, 0LL);
}

- (void)setupIdentitiesWithParameters:(id)a3 complete:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[PCSSyncing serialOperationQueue](self, "serialOperationQueue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000171EC;
  v11[3] = &unk_100024B38;
  objc_copyWeak(&v14, &location);
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  [v8 addOperationWithBlock:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (OS_dispatch_queue)internalQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setInternalQueue:(id)a3
{
}

- (PCSUserRegistry)registry
{
  return (PCSUserRegistry *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setRegistry:(id)a3
{
}

- (OS_dispatch_queue)registryQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setRegistryQueue:(id)a3
{
}

- (PCSKeySyncing)manager
{
  return (PCSKeySyncing *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setManager:(id)a3
{
}

- (PCSAccountsModel)accounts
{
  return (PCSAccountsModel *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setAccounts:(id)a3
{
}

- (NSOperationQueue)serialOperationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setSerialOperationQueue:(id)a3
{
}

- (NSUserDefaults)settings
{
  return (NSUserDefaults *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setSettings:(id)a3
{
}

- (PCSMobileBackup)mobileBackup
{
  return (PCSMobileBackup *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setMobileBackup:(id)a3
{
}

- (OS_xpc_object)scheduledKeyrollActivity
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setScheduledKeyrollActivity:(id)a3
{
}

- (void).cxx_destruct
{
}

@end