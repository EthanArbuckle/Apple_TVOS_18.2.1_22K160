@interface IDSAccountSync
+ (double)retryTimeForKey:(id)a3 attempts:(int64_t)a4;
+ (id)sharedInstance;
+ (id)usefulLoggingDescriptionAccountInfos:(id)a3;
- (IDSAccountSync)init;
- (IDSAccountSync)initWithPairingManager:(id)a3 serviceController:(id)a4 accountController:(id)a5 pushHandler:(id)a6 userDefaults:(id)a7 remoteCredential:(id)a8;
- (IDSDAccountController)accountController;
- (IDSDServiceController)serviceController;
- (IDSPairingManager)pairingManager;
- (IDSPushHandler)pushHandler;
- (IDSRemoteCredential)syncCredential;
- (IMUserDefaults)userDefaults;
- (NSMutableDictionary)currentInFlightSyncAttempts;
- (id)_constructAccountInfo:(id)a3;
- (id)_sendAccountSyncMessage:(id)a3 withPersistentKey:(id)a4;
- (id)constructRAResponseDictionary:(id)a3;
- (void)_addPhoneNumbersToAccount:(id)a3 withNonPreferredPhoneAccounts:(id)a4;
- (void)_noteShouldSynchronizeServices:(id)a3;
- (void)_noteShouldSynchronizeTinkerDeviceInfo;
- (void)_registerAccountsWithRemoteInfo:(id)a3;
- (void)_startRetryForKey:(id)a3 withAction:(id)a4;
- (void)_stopAllPendingActions;
- (void)_syncTinkerDeviceInfo;
- (void)_updatePreferredAccountWithAccountInfo:(id)a3 withAccountSyncCommand:(unsigned int)a4;
- (void)_updateTinkerDeviceWithURIs:(id)a3 pushToken:(id)a4;
- (void)incomingSyncMessage:(id)a3;
- (void)kickAnyUnfinishedSynchronization;
- (void)noteShouldFetchRemoteAccountInfoForAllServices;
- (void)noteShouldSynchronizeAllServices;
- (void)noteShouldSynchronizePreferredAccount;
- (void)noteShouldSynchronizeTinkerDeviceInfo;
- (void)resetAndResynchronizeEverything;
- (void)saveTracking;
- (void)setAccountController:(id)a3;
- (void)setCurrentInFlightSyncAttempts:(id)a3;
- (void)setPairingManager:(id)a3;
- (void)setPushHandler:(id)a3;
- (void)setServiceController:(id)a3;
- (void)setSyncCredential:(id)a3;
- (void)setUserDefaults:(id)a3;
- (void)stopAnyUnfinishedSynchronization;
- (void)synchronizeAccountsWithRemoteInfo:(id)a3 service:(id)a4;
@end

@implementation IDSAccountSync

+ (id)sharedInstance
{
  if (qword_1009BE9B0 != -1) {
    dispatch_once(&qword_1009BE9B0, &stru_1008F9AB0);
  }
  return (id)qword_1009BE9B8;
}

- (IDSAccountSync)init
{
  v3 = objc_alloc_init(&OBJC_CLASS___IDSRemoteCredential);
  -[IDSRemoteCredential setWantsRetries:](v3, "setWantsRetries:", 1LL);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPushHandler sharedInstance](&OBJC_CLASS___IDSPushHandler, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[IMUserDefaults sharedDefaults](&OBJC_CLASS___IMUserDefaults, "sharedDefaults"));
  v9 = -[IDSAccountSync initWithPairingManager:serviceController:accountController:pushHandler:userDefaults:remoteCredential:]( self,  "initWithPairingManager:serviceController:accountController:pushHandler:userDefaults:remoteCredential:",  v4,  v5,  v6,  v7,  v8,  v3);

  return v9;
}

- (IDSAccountSync)initWithPairingManager:(id)a3 serviceController:(id)a4 accountController:(id)a5 pushHandler:(id)a6 userDefaults:(id)a7 remoteCredential:(id)a8
{
  id v25 = a3;
  id v24 = a4;
  id v23 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___IDSAccountSync;
  v18 = -[IDSAccountSync init](&v26, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_pairingManager, a3);
    objc_storeStrong((id *)&v19->_serviceController, a4);
    objc_storeStrong((id *)&v19->_accountController, a5);
    objc_storeStrong((id *)&v19->_pushHandler, a6);
    objc_storeStrong((id *)&v19->_userDefaults, a7);
    objc_storeStrong((id *)&v19->_syncCredential, a8);
    v20 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    currentInFlightSyncAttempts = v19->_currentInFlightSyncAttempts;
    v19->_currentInFlightSyncAttempts = v20;
  }

  return v19;
}

- (void)saveTracking
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[IDSAccountSync userDefaults](self, "userDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync currentInFlightSyncAttempts](self, "currentInFlightSyncAttempts"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allKeys]);
  [v5 setAppValue:v4 forKey:@"AccountSyncSyncedServices"];
}

- (void)stopAnyUnfinishedSynchronization
{
}

- (void)kickAnyUnfinishedSynchronization
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "beginning watch<>phone account synchronization",  buf,  2u);
  }

  if (!-[NSMutableDictionary count](self->_currentInFlightSyncAttempts, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync userDefaults](self, "userDefaults"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 appValueForKey:@"AccountSyncSyncedServices"]);

    if (v5
      && (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSArray, v6), (objc_opt_isKindOfClass(v5, v7) & 1) != 0)
      && [v5 count])
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_1000DBCD4;
      v14[3] = &unk_1008F64D0;
      v14[4] = self;
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "__imArrayByApplyingBlock:", v14));
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Loaded syncing services {serviceInstances : %@}",  buf,  0xCu);
      }

      -[IDSAccountSync _noteShouldSynchronizeServices:](self, "_noteShouldSynchronizeServices:", v8);
      if ([v5 containsObject:@"PreferredAccount"])
      {
        v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Should continue syncing preferred account",  buf,  2u);
        }

        -[IDSAccountSync noteShouldSynchronizePreferredAccount](self, "noteShouldSynchronizePreferredAccount");
      }

      if ([v5 containsObject:@"FetchRemote"])
      {
        v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Should continue fetching remote account",  buf,  2u);
        }

        -[IDSAccountSync noteShouldFetchRemoteAccountInfoForAllServices]( self,  "noteShouldFetchRemoteAccountInfoForAllServices");
      }

      if ([v5 containsObject:@"TinkerDeviceInfo"])
      {
        v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Should continue syncing tinker device info",  buf,  2u);
        }

        -[IDSAccountSync noteShouldSynchronizeTinkerDeviceInfo](self, "noteShouldSynchronizeTinkerDeviceInfo");
      }
    }

    else
    {
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "No readable saved syncing services -- returning",  buf,  2u);
      }
    }
  }

+ (double)retryTimeForKey:(id)a3 attempts:(int64_t)a4
{
  int64_t v5 = 60 * a4;
  if (60 * a4 >= 3600) {
    int64_t v5 = 3600LL;
  }
  double v6 = (double)v5;
  if ([a3 isEqualToString:@"TinkerDeviceInfo"])
  {
    int64_t v7 = 5 * a4 * a4;
  }

  return v6;
}

- (void)_startRetryForKey:(id)a3 withAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync currentInFlightSyncAttempts](self, "currentInFlightSyncAttempts"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v6]);
  [v9 stop];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync currentInFlightSyncAttempts](self, "currentInFlightSyncAttempts"));
  [v10 setObject:0 forKeyedSubscript:v6];

  v11 = objc_alloc(&OBJC_CLASS___IDSBlockRetryHandler);
  uint64_t v13 = im_primary_queue(v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  id v23 = v7;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1000DBF48;
  v24[3] = &unk_1008F9AD8;
  id v25 = v6;
  v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472LL;
  v21 = sub_1000DBF60;
  v22 = &unk_1008F9B00;
  id v15 = v7;
  id v16 = v6;
  id v17 = -[IDSBlockRetryHandler initWithQueue:backoffProvider:block:]( v11,  "initWithQueue:backoffProvider:block:",  v14,  v24,  &v19);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync currentInFlightSyncAttempts](self, "currentInFlightSyncAttempts", v19, v20, v21, v22));
  [v18 setObject:v17 forKeyedSubscript:v16];

  -[IDSAccountSync saveTracking](self, "saveTracking");
  -[IDSBlockRetryHandler start](v17, "start");
}

- (void)_stopAllPendingActions
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync currentInFlightSyncAttempts](self, "currentInFlightSyncAttempts"));
    int64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
    *(_DWORD *)buf = 138412290;
    v21 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Stopping all pending account sync actions { pending: %@ }",  buf,  0xCu);
  }

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync currentInFlightSyncAttempts](self, "currentInFlightSyncAttempts", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)v10);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync currentInFlightSyncAttempts](self, "currentInFlightSyncAttempts"));
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v11]);
        [v13 stop];

        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v8);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync currentInFlightSyncAttempts](self, "currentInFlightSyncAttempts"));
  [v14 removeAllObjects];

  -[IDSAccountSync saveTracking](self, "saveTracking");
}

- (id)_sendAccountSyncMessage:(id)a3 withPersistentKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.identityservice.accountsync-%@",  v7));
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000DC2A4;
  v17[3] = &unk_1008F9B50;
  objc_copyWeak(&v23, &location);
  id v10 = v6;
  id v18 = v10;
  id v11 = v8;
  id v19 = v11;
  id v12 = v9;
  id v20 = v12;
  v21 = self;
  id v13 = v7;
  id v22 = v13;
  -[IDSAccountSync _startRetryForKey:withAction:](self, "_startRetryForKey:withAction:", v13, v17);
  v14 = v22;
  id v15 = v11;

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

  return v15;
}

- (void)resetAndResynchronizeEverything
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSAccountSync sharedInstance](&OBJC_CLASS___IDSAccountSync, "sharedInstance"));
  [v2 stopAnyUnfinishedSynchronization];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSAccountSync sharedInstance](&OBJC_CLASS___IDSAccountSync, "sharedInstance"));
  [v3 noteShouldSynchronizeAllServices];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSAccountSync sharedInstance](&OBJC_CLASS___IDSAccountSync, "sharedInstance"));
  [v4 noteShouldSynchronizePreferredAccount];

  id v5 = (id)objc_claimAutoreleasedReturnValue(+[IDSAccountSync sharedInstance](&OBJC_CLASS___IDSAccountSync, "sharedInstance"));
  [v5 noteShouldSynchronizeTinkerDeviceInfo];
}

- (void)noteShouldSynchronizeTinkerDeviceInfo
{
}

- (void)noteShouldSynchronizeAllServices
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Note should sync all services", v6, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync serviceController](self, "serviceController"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allServices]);
  -[IDSAccountSync _noteShouldSynchronizeServices:](self, "_noteShouldSynchronizeServices:", v5);
}

- (void)noteShouldSynchronizePreferredAccount
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync pairingManager](self, "pairingManager"));
  unsigned __int8 v4 = [v3 isPaired];

  if ((v4 & 1) == 0)
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_51;
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync pairingManager](self, "pairingManager"));
    v28 = (char *)objc_claimAutoreleasedReturnValue([v27 pairedDeviceUniqueID]);
    *(_DWORD *)buf = 138412290;
    v80 = v28;
    v29 = "Not syncing preferred account because device %@ is not paired";
LABEL_21:
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v29, buf, 0xCu);

    goto LABEL_51;
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync pairingManager](self, "pairingManager"));
  unsigned __int8 v6 = [v5 activePairedDeviceHasPairingType:0];

  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if ((v6 & 1) == 0)
  {
    if (!v8) {
      goto LABEL_51;
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync pairingManager](self, "pairingManager"));
    v28 = (char *)objc_claimAutoreleasedReturnValue([v27 pairedDeviceUniqueID]);
    *(_DWORD *)buf = 138412290;
    v80 = v28;
    v29 = "Not syncing preferred account because device %@ is tinker paired";
    goto LABEL_21;
  }

  if (v8)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Note should sync preferred account, Syncing iMessage account now",  buf,  2u);
  }

  uint64_t v9 = IMPreferredAccountMap();
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"iMessage"]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync accountController](self, "accountController"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", @"guid"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 accountWithUniqueID:v12]);

  if ([v13 isEnabled]
    && [v13 accountType] != 2
    && (v14 = (void *)objc_claimAutoreleasedReturnValue([v13 accountInfo]), v14, v14))
  {
    v61 = v7;
    __int128 v71 = 0u;
    __int128 v72 = 0u;
    __int128 v69 = 0u;
    __int128 v70 = 0u;
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 service]);
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync _constructAccountInfo:](self, "_constructAccountInfo:", v15));

    id obj = v16;
    id v17 = [v16 countByEnumeratingWithState:&v69 objects:v78 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v70;
      uint64_t v20 = kIDSServiceDefaultsUniqueIDKey;
LABEL_10:
      v21 = 0LL;
      while (1)
      {
        if (*(void *)v70 != v19) {
          objc_enumerationMutation(obj);
        }
        id v22 = *(void **)(*((void *)&v69 + 1) + 8LL * (void)v21);
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v20]);
        id v24 = v13;
        id v25 = (void *)objc_claimAutoreleasedReturnValue([v13 uniqueID]);
        unsigned __int8 v26 = [v23 isEqualToString:v25];

        if ((v26 & 1) != 0) {
          break;
        }
        v21 = (char *)v21 + 1;
        id v13 = v24;
        if (v18 == v21)
        {
          id v18 = [obj countByEnumeratingWithState:&v69 objects:v78 count:16];
          if (v18) {
            goto LABEL_10;
          }
          goto LABEL_16;
        }
      }

      v30 = v22;

      id v13 = v24;
      if (v30) {
        goto LABEL_26;
      }
    }

    else
    {
LABEL_16:
    }

    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 accountInfo]);
LABEL_26:
    v76[0] = IDSAccountSyncKeyCommand;
    v76[1] = IDSAccountSyncKeyAccountInfo;
    v77[0] = &off_100946BE8;
    v77[1] = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v77,  v76,  2LL));
    v32 = (char *)objc_claimAutoreleasedReturnValue( -[IDSAccountSync _sendAccountSyncMessage:withPersistentKey:]( self,  "_sendAccountSyncMessage:withPersistentKey:",  v31,  @"PreferredAccount"));
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue([v13 uniqueID]);
      *(_DWORD *)buf = 138412546;
      v80 = v32;
      __int16 v81 = 2112;
      v82 = v34;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Syncing preferred account for iMessage {guid: %@, uniqueID: %@}",  buf,  0x16u);
    }

    id v7 = v61;
  }

  else
  {
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v80 = "-[IDSAccountSync noteShouldSynchronizePreferredAccount]";
      __int16 v81 = 2112;
      v82 = v13;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%s: invalid iMessage account %@", buf, 0x16u);
    }
  }

  v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Note should sync preferred account, Syncing FaceTime account now",  buf,  2u);
  }

  uint64_t v36 = IMPreferredAccountMap();
  v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
  v38 = (void *)objc_claimAutoreleasedReturnValue([v37 objectForKey:@"FaceTime"]);

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync accountController](self, "accountController"));
  v40 = (void *)objc_claimAutoreleasedReturnValue([v38 objectForKeyedSubscript:@"guid"]);
  v41 = (void *)objc_claimAutoreleasedReturnValue([v39 accountWithUniqueID:v40]);

  if ([v41 isEnabled]
    && [v41 accountType] != 2
    && (v42 = (void *)objc_claimAutoreleasedReturnValue([v41 accountInfo]), v42, v42))
  {
    v59 = v41;
    v60 = v38;
    id obja = v13;
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    v43 = (void *)objc_claimAutoreleasedReturnValue([v41 service]);
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync _constructAccountInfo:](self, "_constructAccountInfo:", v43));

    id v62 = v44;
    id v45 = [v44 countByEnumeratingWithState:&v65 objects:v75 count:16];
    if (v45)
    {
      id v46 = v45;
      uint64_t v47 = *(void *)v66;
      uint64_t v48 = kIDSServiceDefaultsUniqueIDKey;
LABEL_36:
      uint64_t v49 = 0LL;
      while (1)
      {
        if (*(void *)v66 != v47) {
          objc_enumerationMutation(v62);
        }
        v50 = *(void **)(*((void *)&v65 + 1) + 8 * v49);
        v51 = (void *)objc_claimAutoreleasedReturnValue([v50 objectForKeyedSubscript:v48]);
        v52 = (void *)objc_claimAutoreleasedReturnValue([obja uniqueID]);
        unsigned __int8 v53 = [v51 isEqualToString:v52];

        if ((v53 & 1) != 0) {
          break;
        }
        if (v46 == (id)++v49)
        {
          id v46 = [v62 countByEnumeratingWithState:&v65 objects:v75 count:16];
          if (v46) {
            goto LABEL_36;
          }
          goto LABEL_42;
        }
      }

      v54 = v50;

      v41 = v59;
      if (v54) {
        goto LABEL_47;
      }
    }

    else
    {
LABEL_42:

      v41 = v59;
    }

    v54 = (os_log_s *)objc_claimAutoreleasedReturnValue([v41 accountInfo]);
LABEL_47:
    v73[0] = IDSAccountSyncKeyCommand;
    v73[1] = IDSAccountSyncKeyAccountInfo;
    v74[0] = &off_100946C00;
    v74[1] = v54;
    v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v74,  v73,  2LL));
    v56 = (char *)objc_claimAutoreleasedReturnValue( -[IDSAccountSync _sendAccountSyncMessage:withPersistentKey:]( self,  "_sendAccountSyncMessage:withPersistentKey:",  v55,  @"PreferredAccount"));
    v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
    id v13 = obja;
    v38 = v60;
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      v58 = (void *)objc_claimAutoreleasedReturnValue([v41 uniqueID]);
      *(_DWORD *)buf = 138412546;
      v80 = v56;
      __int16 v81 = 2112;
      v82 = v58;
      _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_DEFAULT,  "Syncing preferred account for FaceTime {guid: %@, uniqueID: %@}",  buf,  0x16u);
    }
  }

  else
  {
    v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v80 = "-[IDSAccountSync noteShouldSynchronizePreferredAccount]";
      __int16 v81 = 2112;
      v82 = v13;
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "%s: invalid FaceTime account %@", buf, 0x16u);
    }
  }

LABEL_51:
}

- (void)noteShouldFetchRemoteAccountInfoForAllServices
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync pairingManager](self, "pairingManager"));
  unsigned __int8 v4 = [v3 isPaired];

  if ((v4 & 1) != 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync pairingManager](self, "pairingManager"));
    unsigned __int8 v6 = [v5 activePairedDeviceHasPairingType:0];

    if ((v6 & 1) != 0)
    {
      id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync serviceController](self, "serviceController"));
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allServices]);

      id v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v26;
        do
        {
          for (i = 0LL; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v26 != v11) {
              objc_enumerationMutation(v9);
            }
            id v13 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
            if ([v13 shouldSyncAccounts])
            {
              v14 = (void *)objc_claimAutoreleasedReturnValue([v13 pushTopic]);
              -[NSMutableSet addObject:](v7, "addObject:", v14);
            }
          }

          id v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }

        while (v10);
      }

      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Fetching remote account info {servicesToSync: %@}",  buf,  0xCu);
      }

      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_1000DD250;
      v21[3] = &unk_1008F9B78;
      objc_copyWeak(&v24, (id *)buf);
      __int128 v16 = v7;
      id v22 = v16;
      id v23 = self;
      -[IDSAccountSync _startRetryForKey:withAction:](self, "_startRetryForKey:withAction:", @"FetchRemote", v21);

      objc_destroyWeak(&v24);
      objc_destroyWeak((id *)buf);
    }

    else
    {
      __int128 v16 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync pairingManager](self, "pairingManager"));
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 pairedDeviceUniqueID]);
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v20;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v16,  OS_LOG_TYPE_DEFAULT,  "Not fetching remote account info because device %@ is tinker paired",  buf,  0xCu);
      }
    }
  }

  else
  {
    __int128 v16 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync pairingManager](self, "pairingManager"));
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 pairedDeviceUniqueID]);
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v18;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v16,  OS_LOG_TYPE_DEFAULT,  "Not fetching remote account info because device %@ is not paired",  buf,  0xCu);
    }
  }
}

- (void)_noteShouldSynchronizeTinkerDeviceInfo
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync pairingManager](self, "pairingManager"));
  unsigned __int8 v4 = [v3 isPaired];

  if ((v4 & 1) != 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync pairingManager](self, "pairingManager"));
    unsigned __int8 v6 = [v5 activePairedDeviceHasPairingType:1];

    if ((v6 & 1) != 0)
    {
      -[IDSAccountSync _syncTinkerDeviceInfo](self, "_syncTinkerDeviceInfo");
      return;
    }

    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync pairingManager](self, "pairingManager"));
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 pairedDeviceUniqueID]);
      int v11 = 138412290;
      id v12 = v9;
      id v10 = "Not syncing tinker info because device %@ is not tinker paired";
      goto LABEL_8;
    }
  }

  else
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync pairingManager](self, "pairingManager"));
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 pairedDeviceUniqueID]);
      int v11 = 138412290;
      id v12 = v9;
      id v10 = "Not syncing tinker info because device %@ is not paired";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)_noteShouldSynchronizeServices:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync pairingManager](self, "pairingManager"));
  unsigned __int8 v6 = [v5 isPaired];

  if ((v6 & 1) == 0)
  {
    __int128 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync pairingManager](self, "pairingManager"));
    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 pairedDeviceUniqueID]);
    *(_DWORD *)buf = 138412290;
    v39 = v27;
    __int128 v28 = "Not syncing services because device %@ is not paired";
LABEL_19:
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, v28, buf, 0xCu);

    goto LABEL_21;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync pairingManager](self, "pairingManager"));
  unsigned __int8 v8 = [v7 activePairedDeviceHasPairingType:0];

  if ((v8 & 1) == 0)
  {
    __int128 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync pairingManager](self, "pairingManager"));
    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 pairedDeviceUniqueID]);
    *(_DWORD *)buf = 138412290;
    v39 = v27;
    __int128 v28 = "Not syncing services because device %@ is tinker paired";
    goto LABEL_19;
  }

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id obj = v4;
  id v9 = [obj countByEnumeratingWithState:&v34 objects:v46 count:16];
  if (v9)
  {
    id v10 = v9;
    id v29 = v4;
    uint64_t v11 = *(void *)v35;
    uint64_t v33 = IDSAccountSyncKeyCommand;
    uint64_t v32 = IDSAccountSyncKeyService;
    uint64_t v31 = IDSAccountSyncKeyAccountInfo;
    id v12 = obj;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(v12);
        }
        v14 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync _constructAccountInfo:](self, "_constructAccountInfo:", v14));
        if (v15)
        {
          v45[0] = &off_100946C18;
          v44[0] = v33;
          v44[1] = v32;
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
          v44[2] = v31;
          v45[1] = v16;
          v45[2] = v15;
          id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v45,  v44,  3LL));

          id v18 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( -[IDSAccountSync _sendAccountSyncMessage:withPersistentKey:]( self,  "_sendAccountSyncMessage:withPersistentKey:",  v17,  v18));

          uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
            id v23 = objc_msgSend((id)objc_opt_class(self, v22), "usefulLoggingDescriptionAccountInfos:", v15);
            id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
            *(_DWORD *)buf = 138412802;
            v39 = v21;
            __int16 v40 = 2112;
            v41 = v19;
            __int16 v42 = 2112;
            v43 = v24;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Syncing account changes to paired device {serviceIdentifier : %@, guid: %@, accountInfo : %@}",  buf,  0x20u);

            id v12 = obj;
          }
        }
      }

      id v10 = [v12 countByEnumeratingWithState:&v34 objects:v46 count:16];
    }

    while (v10);
    __int128 v25 = (os_log_s *)v12;
    id v4 = v29;
  }

  else
  {
    __int128 v25 = (os_log_s *)obj;
  }

- (id)constructRAResponseDictionary:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Constructing RA response dictionary for services: %@",  buf,  0xCu);
  }

  unsigned __int8 v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(const void **)(*((void *)&v17 + 1) + 8LL * (void)v11);
        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync serviceController](self, "serviceController", (void)v17));
        v14 = (void *)objc_claimAutoreleasedReturnValue([v13 serviceWithPushTopic:v12]);

        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync _constructAccountInfo:](self, "_constructAccountInfo:", v14));
        if (v15) {
          CFDictionarySetValue((CFMutableDictionaryRef)v6, v12, v15);
        }

        uint64_t v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v9);
  }

  return v6;
}

- (id)_constructAccountInfo:(id)a3
{
  id v4 = a3;
  if ([v4 shouldSyncAccounts])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync pairingManager](self, "pairingManager"));
    unsigned int v6 = [v5 pairedDeviceServiceMinCompatibilityVersion];
    id v7 = [v4 accountSyncMinCompatibilityVersion];

    if ((unint64_t)v7 > v6)
    {
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 pushTopic]);
        *(_DWORD *)buf = 138412290;
        unsigned __int8 v53 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Skipping %@, paired device doesn't support syncing of that service",  buf,  0xCu);
      }

      uint64_t v10 = 0LL;
LABEL_53:

      goto LABEL_54;
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    unsigned int v12 = [v11 isEqualToString:@"com.apple.madrid"];

    if (v12)
    {
      uint64_t v13 = IMPreferredAccountMap();
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"iMessage"]);
      uint64_t v46 = objc_claimAutoreleasedReturnValue([v15 objectForKey:@"guid"]);
    }

    else
    {
      uint64_t v46 = 0LL;
    }

    __int128 v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v47 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    v44 = self;
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync accountController](self, "accountController"));
    id v45 = v4;
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 accountsOnService:v4]);

    id v19 = [v18 countByEnumeratingWithState:&v48 objects:v56 count:16];
    if (v19)
    {
      id v20 = v19;
      v43 = v16;
      v21 = 0LL;
      uint64_t v22 = 0LL;
      char v23 = 0;
      uint64_t v24 = *(void *)v49;
      do
      {
        for (i = 0LL; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v49 != v24) {
            objc_enumerationMutation(v18);
          }
          __int128 v26 = *(void **)(*((void *)&v48 + 1) + 8LL * (void)i);
          if ([v26 isEnabled]
            && [v26 isRegistered]
            && [v26 accountType] != 2)
          {
            if ([v26 accountType])
            {
              uint64_t v27 = objc_claimAutoreleasedReturnValue([v26 accountInfo]);

              v21 = (void *)v27;
            }

            else
            {
              if (v22
                || v46
                && (__int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v26 uniqueID]),
                    unsigned int v29 = [v28 isEqualToString:v46],
                    v28,
                    !v29))
              {
                -[NSMutableArray addObject:](v47, "addObject:", v26);
              }

              else
              {
                uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v26 accountInfo]);
              }

              char v23 = 1;
            }
          }
        }

        id v20 = [v18 countByEnumeratingWithState:&v48 objects:v56 count:16];
      }

      while (v20);

      __int128 v16 = v43;
      v30 = v47;
      if (v22)
      {
LABEL_33:
        id v32 = [v22 mutableCopy];
        if (!v21) {
          -[IDSAccountSync _addPhoneNumbersToAccount:withNonPreferredPhoneAccounts:]( v44,  "_addPhoneNumbersToAccount:withNonPreferredPhoneAccounts:",  v32,  v30);
        }
        -[NSMutableArray addObject:](v16, "addObject:", v32);

        char v33 = 0;
        if (!v21) {
          goto LABEL_47;
        }
        goto LABEL_39;
      }
    }

    else
    {

      char v23 = 0;
      v21 = 0LL;
      v30 = v47;
    }

    if (-[NSMutableArray count](v30, "count"))
    {
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v30, "firstObject"));
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v31 accountInfo]);

      -[NSMutableArray removeFirstObject](v30, "removeFirstObject");
      if (v22) {
        goto LABEL_33;
      }
    }

    else
    {
      uint64_t v22 = 0LL;
    }

    char v33 = 1;
    if (!v21)
    {
LABEL_47:
      id v4 = v45;
      if ([v45 shouldNotSyncPhoneNumberAccounts]
        && ((-[NSMutableArray count](v16, "count") == (id)1) & v23) == 1)
      {
        v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          unsigned __int8 v53 = v45;
          __int16 v54 = 2112;
          v55 = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "Trying to sync only phone number account, but this is disallowed by the service. { service : %@, accountInfo : %@ }",  buf,  0x16u);
        }

        -[NSMutableArray removeAllObjects](v16, "removeAllObjects");
      }

      uint64_t v10 = v16;

      id v8 = (os_log_s *)v46;
      goto LABEL_53;
    }

- (void)_addPhoneNumbersToAccount:(id)a3 withNonPreferredPhoneAccounts:(id)a4
{
  id v5 = a3;
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "__imArrayByApplyingBlock:", &stru_1008F9BD8));
  if ([v6 count])
  {
    uint64_t v21 = kIDSServiceDefaultsAliasesKey;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:"));
    id v22 = [v7 mutableCopy];

    uint64_t v20 = kIDSServiceDefaultsVettedAliasesKey;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:"));
    id v9 = [v8 mutableCopy];

    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v10 = v6;
    id v11 = [v10 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v24;
      uint64_t v14 = kIDSServiceDefaultsAliasKey;
      uint64_t v15 = kIDSServiceDefaultsAliasStatusKey;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)i);
          [v9 addObject:v17];
          v29[0] = v14;
          v29[1] = v15;
          v30[0] = v17;
          v30[1] = &off_100946C30;
          __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v29,  2LL));
          [v22 addObject:v18];
        }

        id v12 = [v10 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }

      while (v12);
    }

    [v5 setObject:v22 forKey:v21];
    [v5 setObject:v9 forKey:v20];
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Adding additional phone numbers to sync {phoneNumbersToAdd: %@}",  buf,  0xCu);
    }
  }
}

- (void)_syncTinkerDeviceInfo
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync serviceController](self, "serviceController"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 iCloudService]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync accountController](self, "accountController"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 appleIDAccountOnService:v4]);

  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "prefixedURIStringsFromRegistration", 0));
  id v9 = [v8 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
      }

      id v10 = [v8 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }

    while (v10);
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync pushHandler](self, "pushHandler"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 pushToken]);

  if (-[NSMutableSet count](v7, "count") && v15)
  {
    v32[0] = &off_100946C48;
    v31[0] = IDSAccountSyncKeyCommand;
    v31[1] = IDSAccountSyncKeyiCloudURIs;
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v7, "allObjects"));
    v31[2] = IDSAccountSyncKeyPushToken;
    v32[1] = v16;
    v32[2] = v15;
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v32,  v31,  3LL));

    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( -[IDSAccountSync _sendAccountSyncMessage:withPersistentKey:]( self,  "_sendAccountSyncMessage:withPersistentKey:",  v17,  @"TinkerDeviceInfo"));
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      __int128 v26 = v18;
      __int16 v27 = 2112;
      id v28 = v7;
      __int16 v29 = 2112;
      v30 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Syncing tinker device info to paired device { guid : %@, uris : %@, pushToken : %@ }",  buf,  0x20u);
    }
  }

  else
  {
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = (NSMutableSet *)-[NSMutableSet count](v7, "count");
      *(_DWORD *)buf = 138412546;
      __int128 v26 = v15;
      __int16 v27 = 2048;
      id v28 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Don't have tinker device info to sync { token : %@, accounts_count : %ld }",  buf,  0x16u);
    }
  }
}

- (void)incomingSyncMessage:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:IDSAccountSyncKeyCommand]);
  unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[IDSLogFormatter descriptionForDictionary:options:]( &OBJC_CLASS___IDSLogFormatter,  "descriptionForDictionary:options:",  v4,  5LL));
    int v21 = 138412546;
    __int128 v22 = v5;
    __int16 v23 = 2112;
    __int128 v24 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Incoming account sync message {command: %@, message: %@}",  (uint8_t *)&v21,  0x16u);
  }

  if (v5)
  {
    switch([v5 unsignedIntValue])
    {
      case 1u:
        id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync pairingManager](self, "pairingManager"));
        unsigned int v9 = [v8 activePairedDeviceHasPairingType:0];

        if (v9)
        {
          id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:IDSAccountSyncKeyAccountInfo]);
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:IDSAccountSyncKeyService]);
          -[IDSAccountSync synchronizeAccountsWithRemoteInfo:service:]( self,  "synchronizeAccountsWithRemoteInfo:service:",  v10,  v11);
          goto LABEL_13;
        }

        id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
          goto LABEL_26;
        }
        break;
      case 2u:
        id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync pairingManager](self, "pairingManager"));
        unsigned int v13 = [v12 activePairedDeviceHasPairingType:0];

        if (v13)
        {
          id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:IDSAccountSyncKeyAccountInfo]);
          uint64_t v14 = self;
          uint64_t v15 = v10;
          uint64_t v16 = 2LL;
          goto LABEL_16;
        }

        id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
          goto LABEL_26;
        }
        break;
      case 3u:
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync pairingManager](self, "pairingManager"));
        unsigned int v18 = [v17 activePairedDeviceHasPairingType:1];

        if (v18)
        {
          id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:IDSAccountSyncKeyiCloudURIs]);
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:IDSAccountSyncKeyPushToken]);
          -[IDSAccountSync _updateTinkerDeviceWithURIs:pushToken:]( self,  "_updateTinkerDeviceWithURIs:pushToken:",  v10,  v11);
LABEL_13:
        }

        else
        {
          id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
          if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
            sub_10069A6A8();
          }
        }

        break;
      case 4u:
        id v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync pairingManager](self, "pairingManager"));
        unsigned int v20 = [v19 activePairedDeviceHasPairingType:0];

        if (v20)
        {
          id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:IDSAccountSyncKeyAccountInfo]);
          uint64_t v14 = self;
          uint64_t v15 = v10;
          uint64_t v16 = 4LL;
LABEL_16:
          -[IDSAccountSync _updatePreferredAccountWithAccountInfo:withAccountSyncCommand:]( v14,  "_updatePreferredAccountWithAccountInfo:withAccountSyncCommand:",  v15,  v16);
        }

        else
        {
          id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
          if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
LABEL_26:
          }
            sub_10069A67C();
        }

        break;
      default:
        id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_10069A650();
        }
        break;
    }
  }

  else
  {
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10069A624();
    }
  }
}

- (void)synchronizeAccountsWithRemoteInfo:(id)a3 service:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync accountController](self, "accountController"));
  v57 = self;
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync serviceController](self, "serviceController"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 serviceWithPushTopic:v7]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 accountsOnService:v10]);

  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( +[IDSAccountSync usefulLoggingDescriptionAccountInfos:]( &OBJC_CLASS___IDSAccountSync,  "usefulLoggingDescriptionAccountInfos:",  v6));
    *(_DWORD *)buf = 138412546;
    id v76 = v7;
    __int16 v77 = 2112;
    v78 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Synchronizing accounts {service: %@, accountInfo: %@}",  buf,  0x16u);
  }

  if ([v6 count])
  {
    id v54 = v6;
    v56 = v7;
    id v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "__imArrayByApplyingBlock:", &stru_1008F9C38));
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    unsigned __int8 v53 = v11;
    id v15 = v11;
    id v16 = [v15 countByEnumeratingWithState:&v63 objects:v73 count:16];
    if (v16)
    {
      id v17 = v16;
      char v18 = 0;
      uint64_t v19 = *(void *)v64;
      do
      {
        for (i = 0LL; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v64 != v19) {
            objc_enumerationMutation(v15);
          }
          int v21 = *(void **)(*((void *)&v63 + 1) + 8LL * (void)i);
          __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 loginID]);
          __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 lowercaseString]);
          unsigned __int8 v24 = [v14 containsObject:v23];

          if ((v24 & 1) == 0)
          {
            if ([v21 accountType] == 1
              && (__int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v21 service]),
                  unsigned int v26 = [v25 iCloudBasedService],
                  v25,
                  v26))
            {
              __int16 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v76 = v21;
                _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "This is an AppleID account on an iCloud based service, not removing account %@",  buf,  0xCu);
              }
            }

            else
            {
              id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                __int16 v29 = (void *)objc_claimAutoreleasedReturnValue([v21 smallDescription]);
                *(_DWORD *)buf = 138412290;
                id v76 = v29;
                _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Removing account %@", buf, 0xCu);
              }

              __int16 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync accountController](v57, "accountController"));
              -[os_log_s removeAccount:](v27, "removeAccount:", v21);
              char v18 = 1;
            }
          }
        }

        id v17 = [v15 countByEnumeratingWithState:&v63 objects:v73 count:16];
      }

      while (v17);
    }

    else
    {
      char v18 = 0;
    }

    id v6 = v54;
    -[IDSAccountSync _registerAccountsWithRemoteInfo:](v57, "_registerAccountsWithRemoteInfo:", v54);
    id v7 = v56;
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    __int16 v42 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync serviceController](v57, "serviceController"));
    v43 = (void *)objc_claimAutoreleasedReturnValue([v42 allServices]);

    id v44 = [v43 countByEnumeratingWithState:&v59 objects:v72 count:16];
    if (v44)
    {
      id v45 = v44;
      uint64_t v46 = *(void *)v60;
      do
      {
        for (j = 0LL; j != v45; j = (char *)j + 1)
        {
          if (*(void *)v60 != v46) {
            objc_enumerationMutation(v43);
          }
          __int128 v48 = *(void **)(*((void *)&v59 + 1) + 8LL * (void)j);
          if (([v48 useiMessageCallerID] & 1) == 0)
          {
            __int128 v49 = (void *)objc_claimAutoreleasedReturnValue([v48 pushTopic]);
            unsigned int v50 = [v49 isEqualToIgnoringCase:@"com.apple.madrid"];

            if (!v50) {
              continue;
            }
          }

          memset(v58, 0, sizeof(v58));
          __int128 v51 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync accountController](v57, "accountController"));
          v52 = (void *)objc_claimAutoreleasedReturnValue([v51 accountsOnService:v48 withType:1]);

          if ([v52 countByEnumeratingWithState:v58 objects:v71 count:16]) {
            [**((id **)&v58[0] + 1) clearDisplayName];
          }
        }

        id v45 = [v43 countByEnumeratingWithState:&v59 objects:v72 count:16];
      }

      while (v45);
    }

LABEL_54:
    id v7 = v56;
LABEL_55:
    uint64_t v11 = v53;
    goto LABEL_56;
  }

  v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "No accounts, disabling all", buf, 2u);
  }

  __int128 v69 = 0u;
  __int128 v70 = 0u;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  id v14 = v11;
  id v31 = [v14 countByEnumeratingWithState:&v67 objects:v74 count:16];
  if (v31)
  {
    id v32 = v31;
    unsigned __int8 v53 = v11;
    id v55 = v6;
    v56 = v7;
    uint64_t v33 = *(void *)v68;
    do
    {
      for (k = 0LL; k != v32; k = (char *)k + 1)
      {
        if (*(void *)v68 != v33) {
          objc_enumerationMutation(v14);
        }
        uint64_t v35 = *(void **)(*((void *)&v67 + 1) + 8LL * (void)k);
        if ([v35 accountType] == 1
          && (__int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v35 service]),
              unsigned int v37 = [v36 iCloudBasedService],
              v36,
              v37))
        {
          v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v76 = v35;
            _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "This is an AppleID account on an iCloud based service, not disabling account %@",  buf,  0xCu);
          }
        }

        else
        {
          v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v40 = (void *)objc_claimAutoreleasedReturnValue([v35 smallDescription]);
            *(_DWORD *)buf = 138412290;
            id v76 = v40;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Disabling account %@", buf, 0xCu);
          }

          v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync accountController](v57, "accountController"));
          v41 = (void *)objc_claimAutoreleasedReturnValue([v35 uniqueID]);
          -[os_log_s disableAccountWithUniqueID:](v38, "disableAccountWithUniqueID:", v41);
        }
      }

      id v32 = [v14 countByEnumeratingWithState:&v67 objects:v74 count:16];
    }

    while (v32);
    id v6 = v55;
    goto LABEL_54;
  }

- (void)_registerAccountsWithRemoteInfo:(id)a3
{
  id v4 = a3;
  if (![v4 count])
  {
    __int16 v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "No accounts in account info, ignoring...",  buf,  2u);
    }

    goto LABEL_71;
  }

  __int128 v114 = 0u;
  __int128 v115 = 0u;
  __int128 v112 = 0u;
  __int128 v113 = 0u;
  id obj = v4;
  id v105 = [obj countByEnumeratingWithState:&v112 objects:v125 count:16];
  if (!v105)
  {
    __int16 v40 = 0LL;
    id v5 = 0LL;
    goto LABEL_69;
  }

  id v91 = v4;
  id v5 = 0LL;
  id v96 = 0LL;
  uint64_t v103 = *(void *)v113;
  uint64_t v6 = kIDSServiceDefaultsAccountTypeKey;
  uint64_t v7 = kIDSServiceDefaultsRegistrationInfoKey;
  uint64_t v101 = kIDSServiceDefaultsRegistrationInfoStatusKey;
  uint64_t v94 = kIDSServiceDefaultsLoginAsKey;
  uint64_t v98 = kIDSServiceDefaultsHasEverRegistered;
  uint64_t v97 = kIDSServiceDefaultsUniqueIDKey;
  uint64_t v93 = kIDSServiceDefaultsAliasesKey;
  uint64_t v92 = kIDSServiceDefaultsServiceNameKey;
  v95 = self;
  do
  {
    for (i = 0LL; i != v105; i = (char *)i + 1)
    {
      if (*(void *)v113 != v103) {
        objc_enumerationMutation(obj);
      }
      unsigned int v9 = *(void **)(*((void *)&v112 + 1) + 8LL * (void)i);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v6]);
      unsigned int v11 = [v10 intValue];

      id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v7]);
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v101]);
      unsigned int v14 = [v13 intValue];

      if (v14 == 5)
      {
        id v15 = [v9 mutableCopy];
        [v15 removeObjectForKey:v6];
        [v15 removeObjectForKey:v98];
        [v15 removeObjectForKey:v7];
        [v15 removeObjectForKey:v97];
        if (v11)
        {
          if (v11 != 1) {
            goto LABEL_32;
          }
          id v16 = v96;
          uint64_t v17 = (uint64_t)v5;
          id v96 = v15;
        }

        else
        {
          uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            int v21 = (void *)objc_opt_class(self, v20);
            id v124 = v15;
            __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v124,  1LL));
            __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v21 usefulLoggingDescriptionAccountInfos:v22]);
            *(_DWORD *)buf = 138412290;
            uint64_t v121 = (uint64_t)v23;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Found valid phone number account %@",  buf,  0xCu);
          }

          unsigned __int8 v24 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v93]);
          __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "__imArrayByApplyingBlock:", &stru_1008F9C58));
          uint64_t v17 = objc_claimAutoreleasedReturnValue([v25 firstObject]);

          unsigned int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v121 = v17;
            _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Retrieved phone number alias %@",  buf,  0xCu);
          }

          id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v92]);
          __int16 v27 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync serviceController](self, "serviceController"));
          id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 serviceWithIdentifier:v16]);

          if (v28 && ![v28 shouldNotSyncPhoneNumberAccounts])
          {
            id v32 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync accountController](self, "accountController"));
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v32 existingAccountOnService:v28 withType:2 loginID:0]);

            if (!v33)
            {
              id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Didn't find a local account, setting one up",  buf,  2u);
              }

              uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync accountController](self, "accountController"));
              [v35 setupLocalAccountForService:v28];

              __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync accountController](self, "accountController"));
              uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v36 localAccountOnService:v28]);
            }

            unsigned int v37 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync accountController](self, "accountController"));
            v38 = (void *)objc_claimAutoreleasedReturnValue([v33 uniqueID]);
            [v37 enablePrimaryAccountWithUniqueID:v38];

            v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v121 = (uint64_t)v33;
              _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "Updating local account {localAccount: %@}",  buf,  0xCu);
            }

            [v33 _updateAccountWithAccountInfo:v15];
            self = v95;
          }

          else
          {
            __int16 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              unsigned int v30 = [v28 shouldNotSyncPhoneNumberAccounts];
              *(_DWORD *)buf = 138412546;
              id v31 = @"NO";
              if (v30) {
                id v31 = @"YES";
              }
              uint64_t v121 = (uint64_t)v16;
              __int16 v122 = 2112;
              v123 = v31;
              _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Can't find eligible service, bailing { serviceName : %@, shouldNotSyncPhoneNumberAccounts: %@ }",  buf,  0x16u);
            }
          }
        }

        id v5 = (void *)v17;
      }

      else
      {
        id v15 = (id)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
        if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
        {
          char v18 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v94]);
          *(_DWORD *)buf = 138412290;
          uint64_t v121 = (uint64_t)v18;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v15,  OS_LOG_TYPE_DEFAULT,  "Account info for %@ is not registered, ignoring...",  buf,  0xCu);

          self = v95;
        }
      }

- (void)_updatePreferredAccountWithAccountInfo:(id)a3 withAccountSyncCommand:(unsigned int)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:kIDSServiceDefaultsDisplayNameKey]);
  uint64_t v52 = kIDSServiceDefaultsAccountTypeKey;
  unsigned __int8 v53 = v6;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:"));
  unsigned int v54 = [v8 intValue];

  unsigned int v9 = &IMInsertBoolsToXPCDictionary_ptr;
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v76 = v53;
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v76, 1LL));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[IDSAccountSync usefulLoggingDescriptionAccountInfos:]( &OBJC_CLASS___IDSAccountSync,  "usefulLoggingDescriptionAccountInfos:",  v11));
    *(_DWORD *)buf = 138412546;
    uint64_t v78 = v7;
    __int16 v79 = 2112;
    id v80 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Incoming preferred account update {incomingDisplayName: %@, incomingAccountInfo: %@}",  buf,  0x16u);
  }

  if ([v7 length])
  {
    id v55 = self;
    if (a4 == 4)
    {
      __int128 v62 = 0u;
      __int128 v63 = 0u;
      __int128 v60 = 0u;
      __int128 v61 = 0u;
      id v34 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync serviceController](self, "serviceController"));
      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v34 allServices]);

      id v35 = [v14 countByEnumeratingWithState:&v60 objects:v73 count:16];
      if (v35)
      {
        id v36 = v35;
        uint64_t v37 = *(void *)v61;
        do
        {
          for (i = 0LL; i != v36; i = (char *)i + 1)
          {
            if (*(void *)v61 != v37) {
              objc_enumerationMutation(v14);
            }
            v39 = *(void **)(*((void *)&v60 + 1) + 8LL * (void)i);
            if ([v39 useFaceTimeCallerID])
            {
              __int16 v40 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9[440] accountSync]);
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v39 serviceName]);
                *(_DWORD *)buf = 138412290;
                uint64_t v78 = v41;
                _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "Service: %@ wants to use the FaceTime CallerID, attempting to update it",  buf,  0xCu);
              }

              __int16 v42 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync accountController](self, "accountController"));
              v43 = (void *)objc_claimAutoreleasedReturnValue([v42 accountsOnService:v39 withType:1]);

              if ([v43 count])
              {
                __int128 v58 = 0u;
                __int128 v59 = 0u;
                __int128 v56 = 0u;
                __int128 v57 = 0u;
                id v44 = v43;
                id v45 = [v44 countByEnumeratingWithState:&v56 objects:v72 count:16];
                if (v45)
                {
                  id v46 = v45;
                  uint64_t v47 = *(void *)v57;
                  do
                  {
                    for (j = 0LL; j != v46; j = (char *)j + 1)
                    {
                      if (*(void *)v57 != v47) {
                        objc_enumerationMutation(v44);
                      }
                      [*(id *)(*((void *)&v56 + 1) + 8 * (void)j) setDisplayName:v7];
                    }

                    id v46 = [v44 countByEnumeratingWithState:&v56 objects:v72 count:16];
                  }

                  while (v46);
                }

                self = v55;
                unsigned int v9 = &IMInsertBoolsToXPCDictionary_ptr;
              }
            }
          }

          id v36 = [v14 countByEnumeratingWithState:&v60 objects:v73 count:16];
        }

        while (v36);
      }

- (void)_updateTinkerDeviceWithURIs:(id)a3 pushToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog accountSync](&OBJC_CLASS___IMRGLog, "accountSync"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Incoming tinker device info { uris: %@, pushToken: %@ }",  (uint8_t *)&v10,  0x16u);
  }

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccountSync pairingManager](self, "pairingManager"));
  [v9 updatePairedDeviceiCloudURIs:v6 pushToken:v7];
}

+ (id)usefulLoggingDescriptionAccountInfos:(id)a3
{
  v10[0] = kIDSServiceDefaultsAccountTypeKey;
  v10[1] = kIDSServiceDefaultsVettedAliasesKey;
  v10[2] = kIDSServiceDefaultsAliasesKey;
  v10[3] = kIDSServiceDefaultsLoginAsKey;
  v10[4] = kIDSServiceDefaultsRegistrationInfoKey;
  id v3 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000E0A4C;
  v8[3] = &unk_1008F9D70;
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 5LL));
  id v4 = v9;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "__imArrayByApplyingBlock:", v8));

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[IDSLogFormatter descriptionForArray:options:]( &OBJC_CLASS___IDSLogFormatter,  "descriptionForArray:options:",  v5,  0LL));
  return v6;
}

- (IDSRemoteCredential)syncCredential
{
  return self->_syncCredential;
}

- (void)setSyncCredential:(id)a3
{
}

- (NSMutableDictionary)currentInFlightSyncAttempts
{
  return self->_currentInFlightSyncAttempts;
}

- (void)setCurrentInFlightSyncAttempts:(id)a3
{
}

- (IDSPairingManager)pairingManager
{
  return self->_pairingManager;
}

- (void)setPairingManager:(id)a3
{
}

- (IDSDServiceController)serviceController
{
  return self->_serviceController;
}

- (void)setServiceController:(id)a3
{
}

- (IDSDAccountController)accountController
{
  return self->_accountController;
}

- (void)setAccountController:(id)a3
{
}

- (IDSPushHandler)pushHandler
{
  return self->_pushHandler;
}

- (void)setPushHandler:(id)a3
{
}

- (IMUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (void).cxx_destruct
{
}

@end