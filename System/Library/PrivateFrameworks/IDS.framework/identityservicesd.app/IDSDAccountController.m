@interface IDSDAccountController
+ (BOOL)isDefaultPairedDeviceFromID:(id)a3 accountUniqueID:(id)a4 serviceName:(id)a5;
+ (IDSDAccountController)sharedInstance;
- (BOOL)_isAccountInfoRegistered:(id)a3;
- (BOOL)_loadAndEnableStoredAccounts;
- (BOOL)accountsLoaded;
- (BOOL)hasActiveSMSAccount;
- (BOOL)hasForcedReRegistered;
- (BOOL)hasHardDeregistered;
- (BOOL)hasiCloudAccount;
- (BOOL)isEnabledAccount:(id)a3;
- (BOOL)isLoading;
- (BOOL)isLocalSetupEnabled;
- (BOOL)isTraditionalLocalSetupEnabled;
- (BOOL)isiCloudHSA2;
- (BOOL)isiCloudSignedIn;
- (BOOL)isiTunesSignedIn;
- (CUTDeferredTaskQueue)storeAccountTask;
- (IDSDAccountController)init;
- (IDSDAccountController)initWithServiceController:(id)a3 registrationController:(id)a4 systemAccountAdapter:(id)a5 deviceSupport:(id)a6;
- (IDSDAccountControllerDelegate)delegate;
- (NSArray)accounts;
- (NSSet)enabledAccounts;
- (id)_createAccountWithDictionary:(id)a3 service:(id)a4 uniqueID:(id)a5;
- (id)_inUseProfileIDs;
- (id)_inUseUsernames;
- (id)_legacyAccountsOnService:(id)a3;
- (id)_preferencesOnDomain:(id)a3;
- (id)_strippedAccountInfo:(id)a3;
- (id)accountOnService:(id)a3 withAliasURI:(id)a4;
- (id)accountOnService:(id)a3 withLoginID:(id)a4;
- (id)accountOnService:(id)a3 withVettedAliasURI:(id)a4;
- (id)accountUniqueIDsWithType:(int)a3;
- (id)accountWithServiceName:(id)a3 aliasURI:(id)a4;
- (id)accountWithServiceName:(id)a3 loginID:(id)a4;
- (id)accountWithServiceName:(id)a3 myID:(id)a4;
- (id)accountWithUniqueID:(id)a3;
- (id)accountsOfAdHocType:(unsigned int)a3;
- (id)accountsOnService:(id)a3;
- (id)accountsOnService:(id)a3 withType:(int)a4;
- (id)accountsWithType:(int)a3;
- (id)appleIDAccountOnService:(id)a3;
- (id)cloudPairedIDForDeviceID:(id)a3;
- (id)daemon;
- (id)deviceAccountOnService:(id)a3;
- (id)deviceCertificateForService:(id)a3 uri:(id)a4;
- (id)deviceIDForPushToken:(id)a3;
- (id)deviceNameForDeviceID:(id)a3;
- (id)enabledAccountsOnService:(id)a3;
- (id)existingAccountOnService:(id)a3 withType:(int)a4 loginID:(id)a5;
- (id)localAccountOnService:(id)a3;
- (id)primaryAccountForAdHocAccount:(id)a3;
- (id)propertiesForDeviceWithUniqueID:(id)a3;
- (id)publicKeyForDeviceID:(id)a3;
- (id)pushTokenForDeviceID:(id)a3;
- (id)registeredAccountsOnService:(id)a3;
- (id)registeredLocalURIsOnService:(id)a3;
- (id)registrationListener;
- (id)threadSafeServiceWithAccountUniqueID:(id)a3;
- (id)userDefaults;
- (void)_addAccount:(id)a3;
- (void)_addAccountDuringInitialSetup:(id)a3;
- (void)_attachOrphanedPhoneAliases:(id)a3 toRecipientAccounts:(id)a4 withAccountsToEnable:(id)a5;
- (void)_cleanUpAccountCredentialForRemovedAccount:(id)a3;
- (void)_cleanUpAccountCredentialStore;
- (void)_cleanupLegacyAccounts;
- (void)_cleanupLegacyLocalAccounts;
- (void)_cleanupLocalAccounts;
- (void)_disableAccountWithUniqueID:(id)a3;
- (void)_disablePrimaryAccountWithUniqueID:(id)a3 userAction:(BOOL)a4;
- (void)_enableAccountWithUniqueID:(id)a3;
- (void)_forceDisableAccountWithUniqueID:(id)a3;
- (void)_forceDisablePrimaryAccountWithUniqueID:(id)a3;
- (void)_kickRemoteCacheWipe;
- (void)_loadAndEnableStoredLegacyAccounts;
- (void)_migrateLegacyAccounts;
- (void)_migrateLegacyAccounts1;
- (void)_migrateLegacyAccounts2;
- (void)_persistAccounts:(id)a3;
- (void)_refreshLocalAccounts;
- (void)_registerForAllRegistrationsSucceeded;
- (void)_registerStateToSysdiagnoseWithLogTitle:(id)a3 queue:(id)a4 block:(id)a5;
- (void)_removeAccount:(id)a3;
- (void)_removePrimaryAccount:(id)a3;
- (void)_resumeGDRReAuthenticateIfNecessary;
- (void)_servicesChanged;
- (void)_servicesRemoved:(id)a3;
- (void)_setupAdHocAccounts;
- (void)_setupAdHocAccountsForPrimaryAccount:(id)a3;
- (void)_setupForLocal;
- (void)_setupLinkedAccounts;
- (void)_setupLocalAccounts;
- (void)_storeAccounts;
- (void)_updateDeviceProperties;
- (void)addAccount:(id)a3;
- (void)addPrimaryAccount:(id)a3;
- (void)authKitAccountUpdate:(id)a3;
- (void)dealloc;
- (void)delayedSaveSettings;
- (void)deliveryController:(id)a3 uniqueID:(id)a4 isCloudConnected:(BOOL)a5;
- (void)deliveryController:(id)a3 uniqueID:(id)a4 isConnected:(BOOL)a5;
- (void)deliveryController:(id)a3 uniqueID:(id)a4 isNearby:(BOOL)a5;
- (void)disableAccountWithUniqueID:(id)a3;
- (void)disablePrimaryAccountWithUniqueID:(id)a3;
- (void)enableAccountWithUniqueID:(id)a3;
- (void)enablePrimaryAccountWithUniqueID:(id)a3;
- (void)forceDisableAccountWithUniqueID:(id)a3;
- (void)forceRemoveAccount:(id)a3;
- (void)hardDeregister;
- (void)issueDependentIDQueriesWithCompletionBlock:(id)a3;
- (void)issueGetDependentAndGetHandlesRequest;
- (void)issueGetDependentRequest;
- (void)issueGetDependentRequestForAccount:(id)a3;
- (void)loadDeviceProperties;
- (void)loadStoredAccounts;
- (void)removeAccount:(id)a3;
- (void)saveDevicePropertiesWithOldKeys:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHasHardDeregistered:(BOOL)a3;
- (void)setNSUUID:(id)a3 onDeviceWithUniqueID:(id)a4;
- (void)setupLocalAccountForService:(id)a3;
- (void)startLocalSetup;
- (void)stopLocalSetup;
- (void)triggerFinalDeregister;
- (void)updateDevicePropertiesWithDevices:(id)a3;
- (void)updateExpiredDependent;
@end

@implementation IDSDAccountController

+ (IDSDAccountController)sharedInstance
{
  if (qword_1009BEB88 != -1) {
    dispatch_once(&qword_1009BEB88, &stru_1008FB7E8);
  }
  return (IDSDAccountController *)(id)qword_1009BEB90;
}

+ (BOOL)isDefaultPairedDeviceFromID:(id)a3 accountUniqueID:(id)a4 serviceName:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 isEqualToIgnoringCase:IDSDefaultPairedDevice])
  {
    uint64_t v10 = OSLogHandleForIDSCategory("IDSDAccountController");
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Found default paired ID", buf, 2u);
    }

    DLCSessionLogWithLevel(v9, @"IDSDAccountController", 0LL, 0LL, @"Found default paired ID");
    BOOL v12 = 1;
  }

  else
  {
    id v38 = 0LL;
    id v13 = [v7 _stripPotentialTokenURIWithToken:&v38];
    id v14 = v38;
    else {
      v15 = 0LL;
    }
    if ([v14 length] || objc_msgSend(v15, "length"))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
      v17 = (void *)objc_claimAutoreleasedReturnValue([v16 accountWithUniqueID:v8]);

      if (v17)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue([v17 defaultPairedDependentRegistration]);
        v19 = v18;
        if (v18)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:IDSDevicePropertyPushToken]);
          v21 = v20;
          if (v20 && [v20 isEqualToData:v14])
          {
            uint64_t v22 = OSLogHandleForIDSCategory("IDSDAccountController");
            v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "This is the default paired device",  buf,  2u);
            }

            DLCSessionLogWithLevel( v9,  @"IDSDAccountController",  0LL,  0LL,  @"This is the default paired device");
            BOOL v12 = 1;
          }

          else
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKey:IDSDevicePropertyIdentifierOverride]);
            if ([v15 length] && objc_msgSend(v15, "isEqualToIgnoringCase:", v26))
            {
              uint64_t v27 = OSLogHandleForIDSCategory("IDSDAccountController");
              v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "This is the default paired device",  buf,  2u);
              }

              BOOL v12 = 1;
              v29 = @"This is the default paired device";
            }

            else
            {
              uint64_t v33 = OSLogHandleForIDSCategory("IDSDAccountController");
              v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "This is not the default paired device",  buf,  2u);
              }

              BOOL v12 = 0;
              v29 = @"This is not the default paired device";
            }

            DLCSessionLogWithLevel(v9, @"IDSDAccountController", 0LL, 0LL, v29);
          }
        }

        else
        {
          uint64_t v30 = OSLogHandleForIDSCategory("IDSDAccountController");
          v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            v32 = (void *)objc_claimAutoreleasedReturnValue([v17 smallDescription]);
            *(_DWORD *)buf = 138412290;
            id v40 = v32;
            _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Did not find a default paired device on this account %@",  buf,  0xCu);
          }

          v21 = (void *)objc_claimAutoreleasedReturnValue([v17 smallDescription]);
          DLCSessionLogWithLevel( v9,  @"IDSDAccountController",  0LL,  0LL,  @"Did not find a default paired device on this account %@");
          BOOL v12 = 0;
        }
      }

      else
      {
        uint64_t v24 = OSLogHandleForIDSCategory("IDSDAccountController");
        v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Did not find an account with that ID",  buf,  2u);
        }

        DLCSessionLogWithLevel( v9,  @"IDSDAccountController",  0LL,  0LL,  @"Did not find an account with that ID");
        BOOL v12 = 0;
      }
    }

    else
    {
      uint64_t v36 = OSLogHandleForIDSCategory("IDSDAccountController");
      v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v40 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Did not find fromToken or FromDeviceUniqueID in %@",  buf,  0xCu);
      }

      DLCSessionLogWithLevel( v9,  @"IDSDAccountController",  0LL,  0LL,  @"Did not find fromToken or FromDeviceUniqueID in %@");
      BOOL v12 = 0;
    }
  }

  return v12;
}

- (id)daemon
{
  return +[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance");
}

- (id)registrationListener
{
  return +[IDSDRegistrationListener sharedInstance](&OBJC_CLASS___IDSDRegistrationListener, "sharedInstance");
}

- (id)userDefaults
{
  return +[IDSDependencyProvider userDefaults](&OBJC_CLASS___IDSDependencyProvider, "userDefaults");
}

- (IDSDAccountController)initWithServiceController:(id)a3 registrationController:(id)a4 systemAccountAdapter:(id)a5 deviceSupport:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v46.receiver = self;
  v46.super_class = (Class)&OBJC_CLASS___IDSDAccountController;
  v15 = -[IDSDAccountController init](&v46, "init");
  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
    [v16 addListener:v15];

    if (!v15->_enabledAccounts)
    {
      v17 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      enabledAccounts = v15->_enabledAccounts;
      v15->_enabledAccounts = v17;
    }

    if (!v15->_accountIDMap)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      accountIDMap = v15->_accountIDMap;
      v15->_accountIDMap = (NSMutableDictionary *)Mutable;
    }

    v15->_accountsLoaded = 0;
    v21 = objc_alloc_init(&OBJC_CLASS___NSRecursiveLock);
    accountIDMapLock = v15->_accountIDMapLock;
    v15->_accountIDMapLock = v21;

    v23 = (void *)objc_claimAutoreleasedReturnValue( +[IDSUTunDeliveryController sharedInstance]( &OBJC_CLASS___IDSUTunDeliveryController,  "sharedInstance"));
    [v23 addConnectivityDelegate:v15];

    dispatch_queue_attr_t v24 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v25 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v24);
    dispatch_queue_t v26 = dispatch_queue_create("ids_authkit", v25);
    authkitQueue = v15->_authkitQueue;
    v15->_authkitQueue = (OS_dispatch_queue *)v26;

    objc_storeStrong((id *)&v15->_serviceController, a3);
    objc_storeStrong((id *)&v15->_registrationController, a4);
    objc_storeStrong((id *)&v15->_systemAccountAdapter, a5);
    objc_storeStrong((id *)&v15->_deviceSupport, a6);
    v28 = objc_alloc(&OBJC_CLASS___CUTDeferredTaskQueue);
    uint64_t v30 = im_primary_queue(v28, v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    v32 = -[CUTDeferredTaskQueue initWithCapacity:queue:block:]( v28,  "initWithCapacity:queue:block:",  1LL,  v31,  &stru_1008FB828);
    storeAccountTask = v15->_storeAccountTask;
    v15->_storeAccountTask = v32;

    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v34 addObserver:v15 selector:"_servicesRemoved:" name:@"_kIDSDServiceControllerServicesRemovedNotification" object:0];
    [v34 addObserver:v15 selector:"_servicesChanged" name:@"_kIDSDServiceControllerServicesChangedNotification" object:0];
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    id inited = objc_initWeak(&location, v15);
    uint64_t v37 = im_primary_queue(inited, v36);
    id v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    id v40 = _NSConcreteStackBlock;
    uint64_t v41 = 3221225472LL;
    v42 = sub_10013A200;
    v43 = &unk_1008F97C8;
    objc_copyWeak(&v44, &location);
    -[IDSDAccountController _registerStateToSysdiagnoseWithLogTitle:queue:block:]( v15,  "_registerStateToSysdiagnoseWithLogTitle:queue:block:",  @"IDS-List",  v38,  &v40);

    -[IDSDAccountController _registerForAllRegistrationsSucceeded]( v15,  "_registerForAllRegistrationsSucceeded",  v40,  v41,  v42,  v43);
    -[IDSDAccountController loadDeviceProperties](v15, "loadDeviceProperties");
    objc_destroyWeak(&v44);
    objc_destroyWeak(&location);
  }

  return v15;
}

- (void)_registerStateToSysdiagnoseWithLogTitle:(id)a3 queue:(id)a4 block:(id)a5
{
}

- (IDSDAccountController)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationController sharedInstance](&OBJC_CLASS___IDSRegistrationController, "sharedInstance"));
  v5 = objc_alloc(&OBJC_CLASS___IDSSystemAccountAdapter);
  uint64_t v7 = im_primary_queue(v5, v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = -[IDSSystemAccountAdapter initWithQueue:](v5, "initWithQueue:", v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  id v11 = -[IDSDAccountController initWithServiceController:registrationController:systemAccountAdapter:deviceSupport:]( self,  "initWithServiceController:registrationController:systemAccountAdapter:deviceSupport:",  v3,  v4,  v9,  v10);

  return v11;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
  [v4 removeListener:self];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSUTunDeliveryController sharedInstance](&OBJC_CLASS___IDSUTunDeliveryController, "sharedInstance"));
  [v5 removeConnectivityDelegate:self];

  -[IDSDAccountController _storeAccounts](self, "_storeAccounts");
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___IDSDAccountController;
  -[IDSDAccountController dealloc](&v6, "dealloc");
}

- (NSArray)accounts
{
  return (NSArray *)-[NSMutableDictionary allValues](self->_accountIDMap, "allValues");
}

- (NSSet)enabledAccounts
{
  return (NSSet *)self->_enabledAccounts;
}

- (void)hardDeregister
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Hard deregister requested", buf, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationCenter sharedInstance](&OBJC_CLASS___IDSRegistrationCenter, "sharedInstance"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10013B614;
  v5[3] = &unk_1008F6010;
  v5[4] = self;
  [v4 sendHardDeregisterCompletionBlock:v5];
}

- (void)triggerFinalDeregister
{
  if (!self->_hasHardDeregistered)
  {
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Triggering final deregister", buf, 2u);
    }

    -[IDSDAccountController setHasHardDeregistered:](self, "setHasHardDeregistered:", 1LL);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController accounts](self, "accounts"));
    id v5 = [v4 _copyForEnumerating];

    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    id v6 = v5;
    id v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
          if (objc_msgSend(v11, "accountType", (void)v12) != 2
            && ([v11 isAdHocAccount] & 1) == 0)
          {
            -[IDSDAccountController removeAccount:](self, "removeAccount:", v11);
          }
        }

        id v8 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }

      while (v8);
    }
  }

- (void)_removeAccount:(id)a3
{
  id v4 = a3;
  id v5 = objc_autoreleasePoolPush();
  if (v4)
  {
    accountIDMap = self->_accountIDMap;
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueID]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](accountIDMap, "objectForKey:", v7));

    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    uint64_t v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138412290;
        id v19 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Removing account %@",  (uint8_t *)&v18,  0xCu);
      }

      [v4 setIsBeingRemoved:1];
      [v4 cleanupAccount];
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueID]);
      -[IDSDAccountController _disableAccountWithUniqueID:](self, "_disableAccountWithUniqueID:", v11);

      -[NSRecursiveLock lock](self->_accountIDMapLock, "lock");
      __int128 v12 = self->_accountIDMap;
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueID]);
      -[NSMutableDictionary removeObjectForKey:](v12, "removeObjectForKey:", v13);

      -[NSRecursiveLock unlock](self->_accountIDMapLock, "unlock");
      -[IDSDAccountController delayedSaveSettings](self, "delayedSaveSettings");
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v4 service]);
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 pushTopic]);
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 broadcasterForTopic:v16 ignoreServiceListener:1 messageContext:0]);

      v17 = (void *)objc_claimAutoreleasedReturnValue([v4 accountSetupInfo]);
      -[os_log_s accountRemoved:](v10, "accountRemoved:", v17);

      -[IDSDAccountController _cleanUpAccountCredentialForRemovedAccount:]( self,  "_cleanUpAccountCredentialForRemovedAccount:",  v4);
    }

    else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      sub_10069D4A4(v4, v10);
    }
  }

  objc_autoreleasePoolPop(v5);
}

- (void)_removePrimaryAccount:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if ([v4 isAdHocAccount])
    {
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueID]);
        *(_DWORD *)buf = 138412290;
        v20 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Tried to remove ad hoc account directly, ignoring... { uniqueID: %@ }",  buf,  0xCu);
      }
    }

    else
    {
      id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      -[NSMutableArray addObject:](v8, "addObject:", v5);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 adHocAccounts]);
      -[NSMutableArray addObjectsFromArray:](v8, "addObjectsFromArray:", v9);

      __int128 v16 = 0u;
      __int128 v17 = 0u;
      __int128 v14 = 0u;
      __int128 v15 = 0u;
      id v6 = v8;
      id v10 = -[os_log_s countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v15;
        do
        {
          for (i = 0LL; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v15 != v12) {
              objc_enumerationMutation(v6);
            }
            -[IDSDAccountController _removeAccount:]( self,  "_removeAccount:",  *(void *)(*((void *)&v14 + 1) + 8LL * (void)i),  (void)v14);
          }

          id v11 = -[os_log_s countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
        }

        while (v11);
      }
    }
  }

  else
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Tried to remove a nil account, ignoring...",  buf,  2u);
    }
  }
}

- (id)_inUseUsernames
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController accounts](self, "accounts", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v11 + 1) + 8 * (void)v8) loginID]);
        if (v9) {
          -[NSMutableSet addObject:](v3, "addObject:", v9);
        }

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

  return v3;
}

- (id)_inUseProfileIDs
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController accounts](self, "accounts", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v11 + 1) + 8 * (void)v8) dsID]);
        if (v9) {
          -[NSMutableSet addObject:](v3, "addObject:", v9);
        }

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

  return v3;
}

- (void)_cleanUpAccountCredentialForRemovedAccount:(id)a3
{
  id v12 = a3;
  id v4 = objc_autoreleasePoolPush();
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v12 loginID]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v12 dsID]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[FTPasswordManager sharedInstance](&OBJC_CLASS___FTPasswordManager, "sharedInstance"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController _inUseUsernames](self, "_inUseUsernames"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allObjects]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController _inUseProfileIDs](self, "_inUseProfileIDs"));
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 allObjects]);
  [v7 cleanUpAccountsWithUsername:v5 orProfileID:v6 basedOnInUseUsernames:v9 profileIDs:v11 completionBlock:0];

  objc_autoreleasePoolPop(v4);
}

- (void)_cleanUpAccountCredentialStore
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FTPasswordManager sharedInstance](&OBJC_CLASS___FTPasswordManager, "sharedInstance"));
  v4[4] = self;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10013C06C;
  v5[3] = &unk_1008FB890;
  v5[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10013C0A8;
  v4[3] = &unk_1008FB890;
  [v3 cleanUpAccountsBasedOnInUseUsernamesBlock:v5 profileIDBlock:v4 completionBlock:0];
}

- (void)_addAccount:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      __int128 v11 = "Tried to add a nil account, ignoring...";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v23, 2u);
    }

- (void)addPrimaryAccount:(id)a3
{
  id v4 = a3;
  id v5 = objc_autoreleasePoolPush();
  if (v4)
  {
    if ([v4 isAdHocAccount])
    {
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 uniqueID]);
        int v16 = 138412290;
        __int128 v17 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Tried to add ad hoc account directly, ignoring... { uniqueID: %@ }",  (uint8_t *)&v16,  0xCu);
      }
    }

    else
    {
      accountIDMap = self->_accountIDMap;
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueID]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](accountIDMap, "objectForKey:", v9));

      if (v10)
      {
        id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
          sub_10069D5A4(v4, v6);
        }
      }

      else
      {
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v4 service]);
        id v12 = [v4 accountType];
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v4 loginID]);
        id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[IDSDAccountController existingAccountOnService:withType:loginID:]( self,  "existingAccountOnService:withType:loginID:",  v11,  v12,  v13));

        if (v6)
        {
          __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            int v16 = 138412290;
            __int128 v17 = v6;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "  ** Found existing matching account, removing: %@",  (uint8_t *)&v16,  0xCu);
          }

          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s linkedAccounts](v6, "linkedAccounts"));
          objc_msgSend(v15, "__imForEach:", &stru_1008FB8B0);

          -[IDSDAccountController _removeAccount:](self, "_removeAccount:", v6);
        }

        -[IDSDAccountController _addAccount:](self, "_addAccount:", v4);
        -[IDSDAccountController _setupAdHocAccountsForPrimaryAccount:]( self,  "_setupAdHocAccountsForPrimaryAccount:",  v4);
      }
    }
  }

  else
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Tried to add a nil primary account, ignoring...",  (uint8_t *)&v16,  2u);
    }
  }

  objc_autoreleasePoolPop(v5);
}

- (void)addAccount:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueID]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 deviceInformationString]);
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Client requested add account with unique ID %@ (Environment: %@)",  (uint8_t *)&v9,  0x16u);
  }

  -[IDSDAccountController addPrimaryAccount:](self, "addPrimaryAccount:", v4);
}

- (void)removeAccount:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueID]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 deviceInformationString]);
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Client requested remove account with unique ID %@ (Environment: %@)",  (uint8_t *)&v9,  0x16u);
  }

  -[IDSDAccountController _removePrimaryAccount:](self, "_removePrimaryAccount:", v4);
}

- (void)forceRemoveAccount:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 smallDescription]);
    int v8 = 138412290;
    int v9 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Force removing account {account: %@}",  (uint8_t *)&v8,  0xCu);
  }

  if (v4)
  {
    else {
      -[IDSDAccountController _removePrimaryAccount:](self, "_removePrimaryAccount:", v4);
    }
  }

  else
  {
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Tried to remove a nil account, ignoring...",  (uint8_t *)&v8,  2u);
    }
  }
}

- (void)disablePrimaryAccountWithUniqueID:(id)a3
{
}

- (void)_disablePrimaryAccountWithUniqueID:(id)a3 userAction:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 length])
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController accountWithUniqueID:](self, "accountWithUniqueID:", v6));
    int v8 = v7;
    if (v7)
    {
      if (![v7 isAdHocAccount])
      {
        if (v4) {
          [v8 setIsUserDisabled:1];
        }
        __int16 v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        -[NSMutableArray addObject:](v11, "addObject:", v8);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 adHocAccounts]);
        -[NSMutableArray addObjectsFromArray:](v11, "addObjectsFromArray:", v12);

        __int128 v34 = 0u;
        __int128 v35 = 0u;
        __int128 v32 = 0u;
        __int128 v33 = 0u;
        int v9 = v11;
        id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v32,  v37,  16LL);
        if (v13)
        {
          id v15 = v13;
          int v16 = 0LL;
          uint64_t v17 = *(void *)v33;
          *(void *)&__int128 v14 = 138412290LL;
          __int128 v27 = v14;
          while (2)
          {
            int v18 = 0LL;
            id v19 = v16;
            do
            {
              if (*(void *)v33 != v17) {
                objc_enumerationMutation(v9);
              }

              if ((-[NSMutableSet containsObject:](self->_enabledAccounts, "containsObject:", v16) & 1) != 0)
              {

                __int128 v30 = 0u;
                __int128 v31 = 0u;
                __int128 v28 = 0u;
                __int128 v29 = 0u;
                v21 = v9;
                id v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v28,  v36,  16LL);
                if (v22)
                {
                  id v23 = v22;
                  uint64_t v24 = *(void *)v29;
                  do
                  {
                    for (i = 0LL; i != v23; i = (char *)i + 1)
                    {
                      if (*(void *)v29 != v24) {
                        objc_enumerationMutation(v21);
                      }
                      -[IDSDAccountController _disableAccountWithUniqueID:](self, "_disableAccountWithUniqueID:", v26);
                    }

                    id v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v28,  v36,  16LL);
                  }

                  while (v23);
                }

                goto LABEL_33;
              }

              v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = v27;
                id v39 = v16;
                _os_log_debug_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "Account with unique ID %@ is already disabled, ignoring...",  buf,  0xCu);
              }

              int v18 = (char *)v18 + 1;
              id v19 = v16;
            }

            while (v15 != v18);
            id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v32,  v37,  16LL);
            if (v15) {
              continue;
            }
            break;
          }
        }

        else
        {
          int v16 = 0LL;
        }

- (void)_forceDisablePrimaryAccountWithUniqueID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController accountWithUniqueID:](self, "accountWithUniqueID:", v4));
    id v6 = v5;
    if (v5)
    {
      if (![v5 isAdHocAccount])
      {
        [v6 setIsUserDisabled:1];
        int v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        -[NSMutableArray addObject:](v9, "addObject:", v6);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 adHocAccounts]);
        -[NSMutableArray addObjectsFromArray:](v9, "addObjectsFromArray:", v10);

        __int128 v18 = 0u;
        __int128 v19 = 0u;
        __int128 v16 = 0u;
        __int128 v17 = 0u;
        uint64_t v7 = v9;
        id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v17;
          do
          {
            for (i = 0LL; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v17 != v13) {
                objc_enumerationMutation(v7);
              }
              -[IDSDAccountController _forceDisableAccountWithUniqueID:](self, "_forceDisableAccountWithUniqueID:", v15);
            }

            id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
          }

          while (v12);
        }

        goto LABEL_19;
      }

      uint64_t v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v4;
        int v8 = "Tried to disable ad hoc account directly, ignoring... { uniqueID: %@ }";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, v8, buf, 0xCu);
      }
    }

    else
    {
      uint64_t v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v4;
        int v8 = "Tried to disable a primary account we don't know about, ignoring... { uniqueID: %@ }";
        goto LABEL_10;
      }
    }

- (void)_forceDisableAccountWithUniqueID:(id)a3
{
  id v4 = (os_log_s *)a3;
  if (-[os_log_s length](v4, "length"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController accountWithUniqueID:](self, "accountWithUniqueID:", v4));
    if (v5)
    {
      if (-[NSMutableSet containsObject:](self->_enabledAccounts, "containsObject:", v4))
      {
        id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 loginID]);
          int v8 = (void *)objc_claimAutoreleasedReturnValue([v5 service]);
          int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
          id v10 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceInformationString]);
          int v23 = 138413314;
          uint64_t v24 = v4;
          __int16 v25 = 2112;
          dispatch_queue_t v26 = v7;
          __int16 v27 = 2112;
          __int128 v28 = v9;
          __int16 v29 = 2112;
          __int128 v30 = v11;
          __int16 v31 = 2112;
          __int128 v32 = self;
          _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Force disable account with uniqueID %@ login ID %@ service %@ called (Environment: %@) %@",  (uint8_t *)&v23,  0x34u);
        }

        -[NSMutableSet removeObject:](self->_enabledAccounts, "removeObject:", v4);
      }

      [v5 deactivateRegistration];
      [v5 resetErrorState];
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 service]);
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 identifier]);

      __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 138412290;
        uint64_t v24 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Clearing service's cache {serviceIdentifier: %@}",  (uint8_t *)&v23,  0xCu);
      }

      id v15 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPeerIDManager sharedInstance](&OBJC_CLASS___IDSPeerIDManager, "sharedInstance"));
      [v15 forgetPeerTokensForService:v13];

      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( +[IDSIDStatusQueryController sharedInstance]( &OBJC_CLASS___IDSIDStatusQueryController,  "sharedInstance"));
      [v16 removeCachedEntriesForService:v13];

      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v5 service]);
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 pushTopic]);
      v20 = (void *)objc_claimAutoreleasedReturnValue([v17 broadcasterForTopic:v19 ignoreServiceListener:1 messageContext:0]);

      v21 = (void *)objc_claimAutoreleasedReturnValue([v5 service]);
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 identifier]);
      [v20 accountDisabled:v4 onService:v22];
    }

    else
    {
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Tried to force disable an account we don't know about, ignoring...",  (uint8_t *)&v23,  2u);
      }
    }
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v5,  OS_LOG_TYPE_DEFAULT,  "Tried to force disable an account with no unique ID, ignoring...",  (uint8_t *)&v23,  2u);
    }
  }
}

- (void)_disableAccountWithUniqueID:(id)a3
{
  id v4 = (os_log_s *)a3;
  if (-[os_log_s length](v4, "length"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController accountWithUniqueID:](self, "accountWithUniqueID:", v4));
    if (!v5)
    {
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Tried to disable an account we don't know about, ignoring...",  (uint8_t *)&v23,  2u);
      }

      goto LABEL_16;
    }

    if ((-[NSMutableSet containsObject:](self->_enabledAccounts, "containsObject:", v4) & 1) == 0)
    {
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        sub_10069D624();
      }
      goto LABEL_16;
    }

    if (-[NSMutableSet containsObject:](self->_enabledAccounts, "containsObject:", v4))
    {
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 loginID]);
        int v8 = (void *)objc_claimAutoreleasedReturnValue([v5 service]);
        int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceInformationString]);
        int v23 = 138413314;
        uint64_t v24 = v4;
        __int16 v25 = 2112;
        dispatch_queue_t v26 = v7;
        __int16 v27 = 2112;
        __int128 v28 = v9;
        __int16 v29 = 2112;
        __int128 v30 = v11;
        __int16 v31 = 2112;
        __int128 v32 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Disable account with uniqueID %@ login ID %@ service %@ called (Environment: %@) %@",  (uint8_t *)&v23,  0x34u);
      }

      -[NSMutableSet removeObject:](self->_enabledAccounts, "removeObject:", v4);
      [v5 deactivateRegistration];
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 service]);
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 identifier]);

      __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 138412290;
        uint64_t v24 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Clearing service's cache {serviceIdentifier: %@}",  (uint8_t *)&v23,  0xCu);
      }

      id v15 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPeerIDManager sharedInstance](&OBJC_CLASS___IDSPeerIDManager, "sharedInstance"));
      [v15 forgetPeerTokensForService:v13];

      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( +[IDSIDStatusQueryController sharedInstance]( &OBJC_CLASS___IDSIDStatusQueryController,  "sharedInstance"));
      [v16 removeCachedEntriesForService:v13];

      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v5 service]);
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 pushTopic]);
      v20 = (void *)objc_claimAutoreleasedReturnValue([v17 broadcasterForTopic:v19 ignoreServiceListener:1 messageContext:0]);

      v21 = (void *)objc_claimAutoreleasedReturnValue([v5 service]);
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 identifier]);
      [v20 accountDisabled:v4 onService:v22];

LABEL_16:
    }
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v5,  OS_LOG_TYPE_DEFAULT,  "Tried to disable an account with no unique ID, ignoring...",  (uint8_t *)&v23,  2u);
    }
  }
}

- (void)enablePrimaryAccountWithUniqueID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController accountWithUniqueID:](self, "accountWithUniqueID:", v4));
    id v6 = v5;
    if (v5)
    {
      if ([v5 isAdHocAccount])
      {
        uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v40 = v4;
          int v8 = "Tried to enable ad hoc account directly, ignoring.. { uniqueID: %@ }";
LABEL_13:
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 0xCu);
        }
      }

      else
      {
        int v9 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRestrictions sharedInstance](&OBJC_CLASS___IDSRestrictions, "sharedInstance"));
        [v9 refreshStateForAccount:v6];

        id v10 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRestrictions sharedInstance](&OBJC_CLASS___IDSRestrictions, "sharedInstance"));
        unsigned int v11 = [v10 shouldDisableAccount:v6];

        if (!v11)
        {
          [v6 setIsUserDisabled:0];
          id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          -[NSMutableArray addObject:](v12, "addObject:", v6);
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 adHocAccounts]);
          -[NSMutableArray addObjectsFromArray:](v12, "addObjectsFromArray:", v13);

          __int128 v35 = 0u;
          __int128 v36 = 0u;
          __int128 v33 = 0u;
          __int128 v34 = 0u;
          uint64_t v7 = v12;
          id v14 = -[os_log_s countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v33,  v38,  16LL);
          if (v14)
          {
            id v16 = v14;
            __int128 v17 = 0LL;
            uint64_t v18 = *(void *)v34;
            *(void *)&__int128 v15 = 138412290LL;
            __int128 v28 = v15;
            while (2)
            {
              __int128 v19 = 0LL;
              v20 = v17;
              do
              {
                if (*(void *)v34 != v18) {
                  objc_enumerationMutation(v7);
                }

                if (!-[NSMutableSet containsObject:](self->_enabledAccounts, "containsObject:", v17))
                {

                  __int128 v31 = 0u;
                  __int128 v32 = 0u;
                  __int128 v29 = 0u;
                  __int128 v30 = 0u;
                  id v22 = v7;
                  id v23 = -[os_log_s countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v29,  v37,  16LL);
                  if (v23)
                  {
                    id v24 = v23;
                    uint64_t v25 = *(void *)v30;
                    do
                    {
                      for (i = 0LL; i != v24; i = (char *)i + 1)
                      {
                        if (*(void *)v30 != v25) {
                          objc_enumerationMutation(v22);
                        }
                        -[IDSDAccountController _enableAccountWithUniqueID:](self, "_enableAccountWithUniqueID:", v27);
                      }

                      id v24 = -[os_log_s countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v29,  v37,  16LL);
                    }

                    while (v24);
                  }

                  goto LABEL_34;
                }

                v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
                if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = v28;
                  id v40 = v17;
                  _os_log_debug_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "Account with unique ID %@ is already enabled, ignoring...",  buf,  0xCu);
                }

                __int128 v19 = (char *)v19 + 1;
                v20 = v17;
              }

              while (v16 != v19);
              id v16 = -[os_log_s countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v33,  v38,  16LL);
              if (v16) {
                continue;
              }
              break;
            }
          }

          else
          {
            __int128 v17 = 0LL;
          }

- (void)_enableAccountWithUniqueID:(id)a3
{
  id v4 = (os_log_s *)a3;
  id v5 = objc_autoreleasePoolPush();
  if (-[os_log_s length](v4, "length"))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController accountWithUniqueID:](self, "accountWithUniqueID:", v4));
    uint64_t v7 = v6;
    if (v6)
    {
      int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 serviceType]);
      id v9 = [v7 accountType];
      if (-[IDSRegistrationController systemSupportsServiceType:accountType:isTemporary:]( self->_registrationController,  "systemSupportsServiceType:accountType:isTemporary:",  v8,  v9,  [v7 isTemporary]))
      {
        if (-[NSMutableSet containsObject:](self->_enabledAccounts, "containsObject:", v4))
        {
          id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
            sub_10069D688();
          }
        }

        else
        {
          v48 = v8;
          v49 = v5;
          v50 = v7;
          if ((-[NSMutableSet containsObject:](self->_enabledAccounts, "containsObject:", v4) & 1) == 0)
          {
            __int128 v19 = objc_autoreleasePoolPush();
            v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              v21 = (void *)objc_claimAutoreleasedReturnValue([v7 loginID]);
              id v22 = (void *)objc_claimAutoreleasedReturnValue([v7 service]);
              id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 identifier]);
              id v24 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
              uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 deviceInformationString]);
              *(_DWORD *)buf = 138413314;
              v65 = v4;
              __int16 v66 = 2112;
              v67 = v21;
              __int16 v68 = 2112;
              v69 = v23;
              __int16 v70 = 2112;
              v71 = v25;
              __int16 v72 = 2112;
              v73 = self;
              _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Enable account with uniqueID %@ login ID %@ service %@ called (Environment: %@) %@",  buf,  0x34u);

              uint64_t v7 = v50;
            }

            -[NSMutableSet addObject:](self->_enabledAccounts, "addObject:", v4);
            [v7 activateRegistration];
            dispatch_queue_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController daemon](self, "daemon"));
            __int16 v27 = (void *)objc_claimAutoreleasedReturnValue([v7 service]);
            __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v27 pushTopic]);
            __int128 v29 = (void *)objc_claimAutoreleasedReturnValue( [v26 broadcasterForTopic:v28 ignoreServiceListener:1 messageContext:0]);

            __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v7 service]);
            __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v30 identifier]);
            [v29 accountEnabled:v4 onService:v31];

            objc_autoreleasePoolPop(v19);
          }

          v53 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
          v52 = (void *)objc_claimAutoreleasedReturnValue([v7 service]);
          __int128 v58 = 0u;
          __int128 v59 = 0u;
          __int128 v60 = 0u;
          __int128 v61 = 0u;
          __int128 v32 = self->_enabledAccounts;
          id v33 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v32,  "countByEnumeratingWithState:objects:count:",  &v58,  v63,  16LL);
          if (v33)
          {
            id v34 = v33;
            uint64_t v35 = *(void *)v59;
            do
            {
              for (i = 0LL; i != v34; i = (char *)i + 1)
              {
                if (*(void *)v59 != v35) {
                  objc_enumerationMutation(v32);
                }
                uint64_t v37 = *(os_log_s **)(*((void *)&v58 + 1) + 8LL * (void)i);
                if ((-[os_log_s isEqualToIgnoringCase:](v37, "isEqualToIgnoringCase:", v4) & 1) == 0
                  && (_DWORD)v9)
                {
                  id v38 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController accountWithUniqueID:](self, "accountWithUniqueID:", v37));
                  if ([v38 accountType] == (_DWORD)v9)
                  {
                    id v39 = (void *)objc_claimAutoreleasedReturnValue([v38 service]);

                    if (v39 == v52)
                    {
                      id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
                      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412290;
                        v65 = v37;
                        _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  " Will disable similar account with accountID: %@",  buf,  0xCu);
                      }

                      -[NSMutableSet addObject:](v53, "addObject:", v37);
                    }
                  }
                }
              }

              id v34 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v32,  "countByEnumeratingWithState:objects:count:",  &v58,  v63,  16LL);
            }

            while (v34);
          }

          v51 = v4;

          __int128 v56 = 0u;
          __int128 v57 = 0u;
          __int128 v54 = 0u;
          __int128 v55 = 0u;
          uint64_t v41 = v53;
          id v42 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v41,  "countByEnumeratingWithState:objects:count:",  &v54,  v62,  16LL);
          if (v42)
          {
            id v43 = v42;
            uint64_t v44 = *(void *)v55;
            do
            {
              for (j = 0LL; j != v43; j = (char *)j + 1)
              {
                if (*(void *)v55 != v44) {
                  objc_enumerationMutation(v41);
                }
                objc_super v46 = *(os_log_s **)(*((void *)&v54 + 1) + 8LL * (void)j);
                v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
                if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v65 = v46;
                  _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "   Forcing account to disable: %@",  buf,  0xCu);
                }

                -[IDSDAccountController _disableAccountWithUniqueID:](self, "_disableAccountWithUniqueID:", v46);
              }

              id v43 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v41,  "countByEnumeratingWithState:objects:count:",  &v54,  v62,  16LL);
            }

            while (v43);
          }

          uint64_t v7 = v50;
          id v4 = v51;
          int v8 = v48;
          id v5 = v49;
        }
      }

      else
      {
        unsigned int v11 = objc_autoreleasePoolPush();
        id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v65 = v8;
          __int16 v66 = 1024;
          LODWORD(v67) = (_DWORD)v9;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Tried to enable an account with unsupported type -- ignoring and disabling... { serviceType: %@, accountType: %d }",  buf,  0x12u);
        }

        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 service]);
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 pushTopic]);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 broadcasterForTopic:v15 ignoreServiceListener:1 messageContext:0]);

        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v7 service]);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 identifier]);
        [v16 accountDisabled:v4 onService:v18];

        objc_autoreleasePoolPop(v11);
      }
    }

    else
    {
      int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Tried to enable an account we don't know about, ignoring...",  buf,  2u);
      }
    }
  }

  else
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_DEFAULT,  "Tried to enable an account with no unique ID, ignoring...",  buf,  2u);
    }
  }

  objc_autoreleasePoolPop(v5);
}

- (void)enableAccountWithUniqueID:(id)a3
{
  id v4 = a3;
  id v5 = objc_autoreleasePoolPush();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
    int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 deviceInformationString]);
    int v9 = 138412546;
    id v10 = v4;
    __int16 v11 = 2112;
    id v12 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Client requested enable account with unique ID %@ (Environment: %@)",  (uint8_t *)&v9,  0x16u);
  }

  -[IDSDAccountController enablePrimaryAccountWithUniqueID:](self, "enablePrimaryAccountWithUniqueID:", v4);
  objc_autoreleasePoolPop(v5);
}

- (void)disableAccountWithUniqueID:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceInformationString]);
    int v8 = 138412546;
    id v9 = v4;
    __int16 v10 = 2112;
    __int16 v11 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Client requested disable account with unique ID %@ (Environment: %@)",  (uint8_t *)&v8,  0x16u);
  }

  -[IDSDAccountController _disablePrimaryAccountWithUniqueID:userAction:]( self,  "_disablePrimaryAccountWithUniqueID:userAction:",  v4,  1LL);
}

- (void)forceDisableAccountWithUniqueID:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceInformationString]);
    int v8 = 138412546;
    id v9 = v4;
    __int16 v10 = 2112;
    __int16 v11 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Client requested force disable account with unique ID %@ (Environment: %@)",  (uint8_t *)&v8,  0x16u);
  }

  -[IDSDAccountController _forceDisablePrimaryAccountWithUniqueID:]( self,  "_forceDisablePrimaryAccountWithUniqueID:",  v4);
}

- (id)accountOnService:(id)a3 withAliasURI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_t v26 = v6;
  if (v6)
  {
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    int v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController accountsOnService:](self, "accountsOnService:", v6));
    id v9 = [v8 countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v28;
      while (2)
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
          uint64_t v13 = OSLogHandleForIDSCategory("Registration");
          id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            __int128 v32 = v12;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Checking %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled(v15)
            && _IDSShouldLog(1LL, @"Registration"))
          {
            uint64_t v25 = v12;
            _IDSLogV(1LL, @"IDSFoundation", @"Registration", @"Checking %@");
          }

          if (objc_msgSend(v12, "isEnabled", v25, v26))
          {
            if ([v12 hasAliasURI:v7])
            {
              uint64_t v20 = OSLogHandleForIDSCategory("Registration");
              v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                __int128 v32 = v12;
                _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Account matches: %@", buf, 0xCu);
              }

              if (os_log_shim_legacy_logging_enabled(v23)
                && _IDSShouldLog(1LL, @"Registration"))
              {
                _IDSLogV(1LL, @"IDSFoundation", @"Registration", @"Account matches: %@");
              }

              id v19 = v12;
              goto LABEL_30;
            }
          }

          else
          {
            uint64_t v16 = OSLogHandleForIDSCategory("Registration");
            __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, " => Account disabled", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled(v18)
              && _IDSShouldLog(1LL, @"Registration"))
            {
              _IDSLogV(1LL, @"IDSFoundation", @"Registration", @" => Account disabled");
            }
          }
        }

        id v9 = [v8 countByEnumeratingWithState:&v27 objects:v33 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    id v19 = 0LL;
LABEL_30:
  }

  else
  {
    id v19 = 0LL;
  }

  return v19;
}

- (id)accountOnService:(id)a3 withVettedAliasURI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_t v26 = v6;
  if (v6)
  {
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    int v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController accountsOnService:](self, "accountsOnService:", v6));
    id v9 = [v8 countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v28;
      while (2)
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
          uint64_t v13 = OSLogHandleForIDSCategory("Registration");
          id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            __int128 v32 = v12;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Checking %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled(v15)
            && _IDSShouldLog(1LL, @"Registration"))
          {
            uint64_t v25 = v12;
            _IDSLogV(1LL, @"IDSFoundation", @"Registration", @"Checking %@");
          }

          if (objc_msgSend(v12, "isEnabled", v25, v26))
          {
            if ([v12 hasVettedAliasURI:v7])
            {
              uint64_t v20 = OSLogHandleForIDSCategory("Registration");
              v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                __int128 v32 = v12;
                _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Account matches: %@", buf, 0xCu);
              }

              if (os_log_shim_legacy_logging_enabled(v23)
                && _IDSShouldLog(1LL, @"Registration"))
              {
                _IDSLogV(1LL, @"IDSFoundation", @"Registration", @"Account matches: %@");
              }

              id v19 = v12;
              goto LABEL_30;
            }
          }

          else
          {
            uint64_t v16 = OSLogHandleForIDSCategory("Registration");
            __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, " => Account disabled", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled(v18)
              && _IDSShouldLog(1LL, @"Registration"))
            {
              _IDSLogV(1LL, @"IDSFoundation", @"Registration", @" => Account disabled");
            }
          }
        }

        id v9 = [v8 countByEnumeratingWithState:&v27 objects:v33 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    id v19 = 0LL;
LABEL_30:
  }

  else
  {
    id v19 = 0LL;
  }

  return v19;
}

- (id)accountOnService:(id)a3 withLoginID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  __int128 v29 = v7;
  if (v7)
  {
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue(-[IDSDAccountController accountsOnService:](self, "accountsOnService:", v7));
    id v9 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v32;
      while (2)
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v32 != v10) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
          uint64_t v13 = OSLogHandleForIDSCategory("Registration");
          id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            __int128 v36 = v12;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Checking %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled(v15)
            && _IDSShouldLog(1LL, @"Registration"))
          {
            __int128 v28 = v12;
            _IDSLogV(1LL, @"IDSFoundation", @"Registration", @"Checking %@");
          }

          if (objc_msgSend(v12, "isEnabled", v28, v29))
          {
            id v16 = [v8 length];
            if (!v16)
            {
              id v4 = (void *)objc_claimAutoreleasedReturnValue([v12 loginID]);
              if (![v4 length])
              {

LABEL_29:
                uint64_t v24 = OSLogHandleForIDSCategory("Registration");
                uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  __int128 v36 = v12;
                  _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "Account matches: %@", buf, 0xCu);
                }

                if (os_log_shim_legacy_logging_enabled(v26)
                  && _IDSShouldLog(1LL, @"Registration"))
                {
                  _IDSLogV(1LL, @"IDSFoundation", @"Registration", @"Account matches: %@");
                }

                id v23 = v12;
                goto LABEL_35;
              }
            }

            BOOL v17 = v16 == 0LL;
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v12 loginID]);
            unsigned int v19 = [v18 isEqualToIgnoringCase:v8];

            if (v17)
            {

              if ((v19 & 1) != 0) {
                goto LABEL_29;
              }
            }

            else if (v19)
            {
              goto LABEL_29;
            }
          }

          else
          {
            uint64_t v20 = OSLogHandleForIDSCategory("Registration");
            v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, " => Account disabled", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled(v22)
              && _IDSShouldLog(1LL, @"Registration"))
            {
              _IDSLogV(1LL, @"IDSFoundation", @"Registration", @" => Account disabled");
            }
          }
        }

        id v9 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    id v23 = 0LL;
LABEL_35:
  }

  else
  {
    id v23 = 0LL;
  }

  return v23;
}

- (id)localAccountOnService:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController accountsOnService:](self, "accountsOnService:", v4, 0LL));
    id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v12;
      while (2)
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
          if ([v9 accountType] == 2)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }

        id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

- (id)appleIDAccountOnService:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController accountsOnService:](self, "accountsOnService:", v4, 0LL));
    id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v12;
      while (2)
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
          if ([v9 accountType] == 1)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }

        id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

- (id)deviceAccountOnService:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController accountsOnService:](self, "accountsOnService:", v4, 0LL));
    id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v12;
      while (2)
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
          if ([v9 accountType] == 3)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }

        id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

- (id)accountsOnService:(id)a3 withType:(int)a4
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = objc_autoreleasePoolPush();
    id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController accountsOnService:](self, "accountsOnService:", v6, 0LL));
    id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          __int128 v14 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        }

        id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v11);
    }

    objc_autoreleasePoolPop(v7);
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (id)accountWithServiceName:(id)a3 aliasURI:(id)a4
{
  id v6 = a3;
  id v36 = a4;
  uint64_t v37 = v6;
  if ([v6 length])
  {
    uint64_t v7 = OSLogHandleForIDSCategory("Registration");
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      id v44 = v6;
      __int16 v45 = 2112;
      id v46 = v36;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "Finding account with service name %@ aliasURI %@",  buf,  0x16u);
    }

    if (os_log_shim_legacy_logging_enabled(v9) && _IDSShouldLog(1LL, @"Registration"))
    {
      id v33 = v6;
      id v35 = v36;
      _IDSLogV( 1LL,  @"IDSFoundation",  @"Registration",  @"Finding account with service name %@ aliasURI %@");
    }

    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController accounts](self, "accounts", v33, v35));
    id v11 = [v10 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v39;
      while (2)
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v39 != v12) {
            objc_enumerationMutation(v10);
          }
          __int128 v14 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)i);
          uint64_t v15 = OSLogHandleForIDSCategory("Registration");
          __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            id v44 = v14;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Checking %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled(v17)
            && _IDSShouldLog(1LL, @"Registration"))
          {
            __int128 v34 = v14;
            _IDSLogV(1LL, @"IDSFoundation", @"Registration", @"Checking %@");
          }

          if (objc_msgSend(v14, "isEnabled", v34))
          {
            __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v14 service]);
            __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 identifier]);
            if ([v19 isEqualToIgnoringCase:v37])
            {
              unsigned int v20 = [v14 hasAliasURI:v36];

              if (v20)
              {
                uint64_t v28 = OSLogHandleForIDSCategory("Registration");
                __int128 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "Account matches !", buf, 2u);
                }

                if (os_log_shim_legacy_logging_enabled(v31)
                  && _IDSShouldLog(1LL, @"Registration"))
                {
                  _IDSLogV(1LL, @"IDSFoundation", @"Registration", @"Account matches !");
                }

                id v27 = v14;

                goto LABEL_41;
              }
            }

            else
            {
            }
          }

          else
          {
            uint64_t v21 = OSLogHandleForIDSCategory("Registration");
            uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, " => Account disabled", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled(v23)
              && _IDSShouldLog(1LL, @"Registration"))
            {
              _IDSLogV(1LL, @"IDSFoundation", @"Registration", @" => Account disabled");
            }
          }
        }

        id v11 = [v10 countByEnumeratingWithState:&v38 objects:v42 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    uint64_t v24 = OSLogHandleForIDSCategory("Registration");
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "Found no match", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled(v26)
      && _IDSShouldLog(1LL, @"Registration"))
    {
      _IDSLogV(1LL, @"IDSFoundation", @"Registration", @"Found no match");
    }
  }

  id v27 = 0LL;
LABEL_41:

  return v27;
}

- (id)accountWithServiceName:(id)a3 loginID:(id)a4
{
  id v6 = a3;
  id v36 = a4;
  uint64_t v37 = v6;
  if ([v6 length])
  {
    uint64_t v7 = OSLogHandleForIDSCategory("Registration");
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v45 = v37;
      __int16 v46 = 2112;
      id v47 = v36;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "Finding account with service name %@ loginID %@",  buf,  0x16u);
    }

    if (os_log_shim_legacy_logging_enabled(v9) && _IDSShouldLog(1LL, @"Registration"))
    {
      id v33 = v37;
      id v35 = v36;
      _IDSLogV( 1LL,  @"IDSFoundation",  @"Registration",  @"Finding account with service name %@ loginID %@");
    }

    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue(-[IDSDAccountController accounts](self, "accounts", v33, v35));
    id v10 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v40;
      while (2)
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v40 != v11) {
            objc_enumerationMutation(obj);
          }
          __int128 v13 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)i);
          uint64_t v14 = OSLogHandleForIDSCategory("Registration");
          uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            __int16 v45 = v13;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Checking %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled(v16)
            && _IDSShouldLog(1LL, @"Registration"))
          {
            __int128 v34 = v13;
            _IDSLogV(1LL, @"IDSFoundation", @"Registration", @"Checking %@");
          }

          if (objc_msgSend(v13, "isEnabled", v34))
          {
            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v13 service]);
            __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 identifier]);
            if ([v18 isEqualToIgnoringCase:v37])
            {
              __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v13 loginID]);
              int v20 = IMAreEmailsLogicallyTheSame(v19, v36);

              if (v20)
              {
                uint64_t v28 = OSLogHandleForIDSCategory("Registration");
                __int128 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "Account matches !", buf, 2u);
                }

                if (os_log_shim_legacy_logging_enabled(v31)
                  && _IDSShouldLog(1LL, @"Registration"))
                {
                  _IDSLogV(1LL, @"IDSFoundation", @"Registration", @"Account matches !");
                }

                id v27 = v13;

                goto LABEL_41;
              }
            }

            else
            {
            }
          }

          else
          {
            uint64_t v21 = OSLogHandleForIDSCategory("Registration");
            uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, " => Account disabled", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled(v23)
              && _IDSShouldLog(1LL, @"Registration"))
            {
              _IDSLogV(1LL, @"IDSFoundation", @"Registration", @" => Account disabled");
            }
          }
        }

        id v10 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    uint64_t v24 = OSLogHandleForIDSCategory("Registration");
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "Found no match", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled(v26)
      && _IDSShouldLog(1LL, @"Registration"))
    {
      _IDSLogV(1LL, @"IDSFoundation", @"Registration", @"Found no match");
    }
  }

  id v27 = 0LL;
LABEL_41:

  return v27;
}

- (id)accountWithUniqueID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_accountIDMap, "objectForKey:", v4));
    if (!v5)
    {
      uint64_t v6 = OSLogHandleForIDSCategory("Registration");
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v11 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "  => No account found for unique ID: %@",  buf,  0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v8)
        && _IDSShouldLog(1LL, @"Registration"))
      {
        _IDSLogV(1LL, @"IDSFoundation", @"Registration", @"  => No account found for unique ID: %@");
      }
    }
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (id)accountWithServiceName:(id)a3 myID:(id)a4
{
  id v6 = a3;
  id v55 = a4;
  __int128 v57 = v6;
  if ([v6 length])
  {
    uint64_t v7 = OSLogHandleForIDSCategory("Registration");
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      id v69 = v6;
      __int16 v70 = 2112;
      id v71 = v55;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "Finding account with service name %@ myID %@",  buf,  0x16u);
    }

    if (os_log_shim_legacy_logging_enabled(v9) && _IDSShouldLog(1LL, @"Registration"))
    {
      id v51 = v6;
      id v53 = v55;
      _IDSLogV( 1LL,  @"IDSFoundation",  @"Registration",  @"Finding account with service name %@ myID %@");
    }

    if (objc_msgSend(v55, "hasPrefix:", @"P:", v51, v53))
    {
      __int128 v64 = 0u;
      __int128 v65 = 0u;
      __int128 v62 = 0u;
      __int128 v63 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue(-[IDSDAccountController accounts](self, "accounts"));
      id v10 = [obj countByEnumeratingWithState:&v62 objects:v67 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v63;
        while (2)
        {
          for (i = 0LL; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v63 != v11) {
              objc_enumerationMutation(obj);
            }
            __int128 v13 = *(void **)(*((void *)&v62 + 1) + 8LL * (void)i);
            if ([v13 isEnabled])
            {
              uint64_t v14 = OSLogHandleForIDSCategory("Registration");
              uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                id v69 = v13;
                _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Checking %@", buf, 0xCu);
              }

              if (os_log_shim_legacy_logging_enabled(v16)
                && _IDSShouldLog(1LL, @"Registration"))
              {
                v52 = v13;
                _IDSLogV(1LL, @"IDSFoundation", @"Registration", @"Checking %@");
              }

              uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "service", v52));
              __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 identifier]);
              if ([v18 isEqualToIgnoringCase:v57])
              {
                v52 = (void *)objc_claimAutoreleasedReturnValue([v13 loginID]);
                __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"P:%@"));
                unsigned int v20 = [v55 isEqualToString:v19];

                if (v20)
                {
                  uint64_t v39 = OSLogHandleForIDSCategory("Registration");
                  __int128 v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
                  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "Account matches!", buf, 2u);
                  }

                  if (os_log_shim_legacy_logging_enabled(v42)
                    && _IDSShouldLog(1LL, @"Registration"))
                  {
                    _IDSLogV(1LL, @"IDSFoundation", @"Registration", @"Account matches!");
                  }

                  id v43 = v13;
                  goto LABEL_70;
                }
              }

              else
              {
              }
            }

            else
            {
              uint64_t v21 = OSLogHandleForIDSCategory("Registration");
              uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, " => Account disabled", buf, 2u);
              }

              if (os_log_shim_legacy_logging_enabled(v23)
                && _IDSShouldLog(1LL, @"Registration"))
              {
                _IDSLogV(1LL, @"IDSFoundation", @"Registration", @" => Account disabled");
              }
            }
          }

          id v10 = [obj countByEnumeratingWithState:&v62 objects:v67 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }

      id v24 = 0LL;
    }

    else
    {
      if (![v55 hasPrefix:@"D:"])
      {
        id v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
        __int16 v45 = v44;
        if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
        {
          sub_10069D6EC();
          id v24 = 0LL;
          __int16 v45 = v44;
        }

        else
        {
          id v24 = 0LL;
        }

        goto LABEL_72;
      }

      __int128 v60 = 0u;
      __int128 v61 = 0u;
      __int128 v58 = 0u;
      __int128 v59 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue(-[IDSDAccountController accounts](self, "accounts"));
      id v24 = [obj countByEnumeratingWithState:&v58 objects:v66 count:16];
      if (v24)
      {
        uint64_t v25 = *(void *)v59;
        uint64_t v54 = kIDSServiceDefaultsAuthorizationIDKey;
        while (2)
        {
          for (j = 0LL; j != v24; j = (char *)j + 1)
          {
            if (*(void *)v59 != v25) {
              objc_enumerationMutation(obj);
            }
            id v27 = *(void **)(*((void *)&v58 + 1) + 8LL * (void)j);
            uint64_t v28 = OSLogHandleForIDSCategory("Registration");
            __int128 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              id v69 = v27;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "Checking %@", buf, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled(v30)
              && _IDSShouldLog(1LL, @"Registration"))
            {
              v52 = v27;
              _IDSLogV(1LL, @"IDSFoundation", @"Registration", @"Checking %@");
            }

            if (objc_msgSend(v27, "isEnabled", v52))
            {
              uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v27 service]);
              __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v31 identifier]);
              if ([v32 isEqualToIgnoringCase:v57])
              {
                id v33 = (void *)objc_claimAutoreleasedReturnValue([v27 accountInfo]);
                __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKey:v54]);
                unsigned int v35 = [v55 isEqualToString:v34];

                if (v35)
                {
                  uint64_t v46 = OSLogHandleForIDSCategory("Registration");
                  id v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
                  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEBUG, "Account matches!", buf, 2u);
                  }

                  if (os_log_shim_legacy_logging_enabled(v49)
                    && _IDSShouldLog(1LL, @"Registration"))
                  {
                    _IDSLogV(1LL, @"IDSFoundation", @"Registration", @"Account matches!");
                  }

                  id v43 = v27;
LABEL_70:
                  id v24 = v43;
                  goto LABEL_71;
                }
              }

              else
              {
              }
            }

            else
            {
              uint64_t v36 = OSLogHandleForIDSCategory("Registration");
              uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, " => Account disabled", buf, 2u);
              }

              if (os_log_shim_legacy_logging_enabled(v38)
                && _IDSShouldLog(1LL, @"Registration"))
              {
                _IDSLogV(1LL, @"IDSFoundation", @"Registration", @" => Account disabled");
              }
            }
          }

          id v24 = [obj countByEnumeratingWithState:&v58 objects:v66 count:16];
          if (v24) {
            continue;
          }
          break;
        }
      }
    }

- (id)accountsWithType:(int)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController accounts](self, "accounts", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
      }

      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v8);
  }

  return v5;
}

- (id)accountUniqueIDsWithType:(int)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController accounts](self, "accounts", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        if ([v11 accountType] == a3)
        {
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueID]);
          -[NSMutableArray addObject:](v5, "addObject:", v12);
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }

  return v5;
}

- (BOOL)isEnabledAccount:(id)a3
{
  if (a3) {
    return -[NSMutableSet containsObject:](self->_enabledAccounts, "containsObject:");
  }
  else {
    return 0;
  }
}

- (id)primaryAccountForAdHocAccount:(id)a3
{
  id v4 = a3;
  if ([v4 isAdHocAccount])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController accounts](self, "accounts"));
    id v6 = [v5 _copyForEnumerating];

    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "adHocAccounts", (void)v14));
          if ([v12 containsObject:v4])
          {
            id v8 = v11;

            goto LABEL_13;
          }
        }

        id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

- (id)existingAccountOnService:(id)a3 withType:(int)a4 loginID:(id)a5
{
  id v6 = *(void **)&a4;
  id v8 = a3;
  id v38 = a5;
  uint64_t v9 = 0LL;
  if (!v8 || !(_DWORD)v6) {
    goto LABEL_39;
  }
  __int128 v34 = self;
  id v35 = v8;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController accountsOnService:withType:](self, "accountsOnService:withType:", v8, v6));
  id v11 = [v10 _copyForEnumerating];

  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id obj = v11;
  id v12 = [obj countByEnumeratingWithState:&v43 objects:v52 count:16];
  if (!v12)
  {
    __int128 v14 = 0LL;
    uint64_t v9 = 0LL;
    goto LABEL_31;
  }

  id v13 = v12;
  __int128 v14 = 0LL;
  char v15 = 0;
  uint64_t v9 = 0LL;
  uint64_t v16 = *(void *)v44;
  int v37 = (int)v6;
  do
  {
    for (i = 0LL; i != v13; i = (char *)i + 1)
    {
      if (*(void *)v44 != v16) {
        objc_enumerationMutation(obj);
      }
      __int128 v18 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)i);
      if (v9)
      {
        __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          id v6 = (void *)objc_claimAutoreleasedReturnValue([v18 smallDescription]);
          *(_DWORD *)buf = 138412290;
          uint64_t v49 = v6;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "  => Found **extra** account %@, deleting...",  buf,  0xCu);

          LODWORD(v6) = v37;
        }

        char v15 = 1;
      }

      if ((_DWORD)v6 != 2)
      {
        unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([v18 loginID]);
        id v21 = [v20 length];
        if (v38 || v21)
        {
          id v6 = (void *)objc_claimAutoreleasedReturnValue([v18 loginID]);
          unsigned __int8 v22 = [v6 isEqualToIgnoringCase:v38];

          LODWORD(v6) = v37;
          if ((v22 & 1) == 0)
          {
            uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              id v27 = (void *)objc_claimAutoreleasedReturnValue([v18 smallDescription]);
              *(_DWORD *)buf = 138412546;
              uint64_t v49 = v27;
              __int16 v50 = 2112;
              id v51 = v38;
              _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "  => Found **mismatched** account %@ ID %@, deleting...",  buf,  0x16u);
            }

            goto LABEL_24;
          }
        }

        else
        {
        }
      }

      if ((v15 & 1) == 0)
      {
        id v23 = v18;

        id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v23 smallDescription]);
          *(_DWORD *)buf = 138412290;
          uint64_t v49 = v25;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "  => Found existing account %@",  buf,  0xCu);
        }

        char v15 = 0;
        uint64_t v9 = v23;
        continue;
      }

- (id)threadSafeServiceWithAccountUniqueID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    -[NSRecursiveLock lock](self->_accountIDMapLock, "lock");
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_accountIDMap, "objectForKey:", v4));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 service]);
    if (v6)
    {
      uint64_t v7 = OSLogHandleForIDSCategory("Registration");
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218242;
        id v17 = v6;
        __int16 v18 = 2112;
        id v19 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "  => (Thread Safe) Found service: %p (for UID: %@)",  buf,  0x16u);
      }

      if (os_log_shim_legacy_logging_enabled(v9)
        && _IDSShouldLog(1LL, @"Registration"))
      {
        id v14 = v6;
        id v15 = v4;
        _IDSLogV( 1LL,  @"IDSFoundation",  @"Registration",  @"  => (Thread Safe) Found service: %p (for UID: %@)");
      }
    }

    else
    {
      uint64_t v10 = OSLogHandleForIDSCategory("Registration");
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "  => (Thread Safe) No service found for unique ID: %@",  buf,  0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v12)
        && _IDSShouldLog(1LL, @"Registration"))
      {
        id v14 = v4;
        _IDSLogV( 1LL,  @"IDSFoundation",  @"Registration",  @"  => (Thread Safe) No service found for unique ID: %@");
      }
    }

    -[NSRecursiveLock unlock](self->_accountIDMapLock, "unlock", v14, v15);
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (id)registeredLocalURIsOnService:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 serviceWithIdentifier:v4]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController registeredAccountsOnService:](self, "registeredAccountsOnService:", v6));

  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      id v13 = 0LL;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v18 + 1) + 8 * (void)v13),  "prefixedURIStringsFromRegistration",  (void)v18));
        id v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "__imArrayByApplyingBlock:", &stru_1008FB8D0));
        if (v15) {
          -[NSMutableSet addObjectsFromArray:](v8, "addObjectsFromArray:", v15);
        }

        id v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v11);
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v8, "allObjects"));
  return v16;
}

- (void)setupLocalAccountForService:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDAccountController existingAccountOnService:withType:loginID:]( self,  "existingAccountOnService:withType:loginID:",  v4,  2LL,  0LL));
  if (!v5)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
      *(_DWORD *)buf = 138412290;
      id v15 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  " => Creating a local account for service %@",  buf,  0xCu);
    }

    id v8 = objc_alloc(&OBJC_CLASS___IDSDAccount);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
    id v10 = -[IDSDAccount initWithLoginID:service:uniqueID:accountType:accountConfig:]( v8,  "initWithLoginID:service:uniqueID:accountType:accountConfig:",  &stru_100912B50,  v4,  v9,  2LL,  0LL);

    -[IDSDAccountController addPrimaryAccount:](self, "addPrimaryAccount:", v10);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](v10, "uniqueID"));
    -[IDSDAccountController enablePrimaryAccountWithUniqueID:](self, "enablePrimaryAccountWithUniqueID:", v11);

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount linkedAccounts](v10, "linkedAccounts"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1001417D0;
    v13[3] = &unk_1008F9CE0;
    v13[4] = self;
    objc_msgSend(v12, "__imForEach:", v13);
  }
}

- (void)_setupLocalAccounts
{
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Setting up local accounts", buf, 2u);
  }

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
  id obj = (id)objc_claimAutoreleasedReturnValue([v3 allServices]);

  id v4 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
        if (![v7 adHocServiceType])
        {
          unsigned int v9 = [v8 isEqualToIgnoringCase:@"com.apple.madrid"];
          unsigned int v10 = [v8 isEqualToIgnoringCase:@"com.apple.private.alloy.sms"];
          unsigned int v11 = [v8 isEqualToIgnoringCase:@"com.apple.ess"];
          unsigned int v12 = [v8 isEqualToIgnoringCase:@"com.apple.private.ac"];
          unsigned int v13 = [v8 isEqualToIgnoringCase:@"com.apple.private.alloy.facetime.multi"];
          if (((v9 | v10 | v11 | v12 | [v8 isEqualToIgnoringCase:@"com.apple.private.alloy.electrictouch"] | v13) & 1) == 0) {
            -[IDSDAccountController setupLocalAccountForService:](self, "setupLocalAccountForService:", v7);
          }
        }
      }

      id v4 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    }

    while (v4);
  }

  uint64_t v14 = OSLogHandleForTransportCategory("Accounts");
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Finished setting up local accounts", buf, 2u);
  }

  uint64_t v17 = os_log_shim_legacy_logging_enabled(v16);
  if ((_DWORD)v17 && _IDSShouldLogTransport(v17))
  {
    _IDSLogTransport(@"Accounts", @"IDS", @"Finished setting up local accounts");
  }

- (void)_refreshLocalAccounts
{
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Refreshing local accounts", buf, 2u);
  }

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allServices]);

  id obj = v4;
  id v5 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        unsigned int v9 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
        if (![v9 adHocServiceType])
        {
          unsigned __int8 v11 = [v10 isEqualToIgnoringCase:@"com.apple.madrid"];
          unsigned __int8 v12 = [v10 isEqualToIgnoringCase:@"com.apple.private.alloy.sms"];
          unsigned __int8 v13 = [v10 isEqualToIgnoringCase:@"com.apple.ess"];
          unsigned __int8 v14 = [v10 isEqualToIgnoringCase:@"com.apple.private.ac"];
          unsigned __int8 v15 = [v10 isEqualToIgnoringCase:@"com.apple.private.alloy.facetime.multi"];
          unsigned __int8 v16 = [v10 isEqualToIgnoringCase:@"com.apple.private.alloy.electrictouch"];
          if ((v11 & 1) == 0 && (v12 & 1) == 0 && (v13 & 1) == 0 && (v14 & 1) == 0 && (v16 & 1) == 0 && (v15 & 1) == 0)
          {
            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDAccountController existingAccountOnService:withType:loginID:]( self,  "existingAccountOnService:withType:loginID:",  v9,  2LL,  0LL));
            -[IDSDAccountController _setupAdHocAccountsForPrimaryAccount:]( self,  "_setupAdHocAccountsForPrimaryAccount:",  v17);
          }
        }
      }

      id v6 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    }

    while (v6);
  }
}

- (void)_cleanupLocalAccounts
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController accounts](self, "accounts"));
  id v4 = [v3 _copyForEnumerating];

  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v33 objects:v40 count:16];
  if (!v6)
  {
    unsigned __int8 v9 = 0;
    id v10 = 0LL;
    goto LABEL_30;
  }

  id v8 = v6;
  unsigned __int8 v9 = 0;
  id v10 = 0LL;
  uint64_t v11 = *(void *)v34;
  *(void *)&__int128 v7 = 138412290LL;
  __int128 v27 = v7;
  do
  {
    for (i = 0LL; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v34 != v11) {
        objc_enumerationMutation(obj);
      }
      unsigned __int8 v13 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
      if ([v13 accountType] != 2)
      {
        unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue([v13 service]);
        unsigned int v17 = [v16 adHocServiceType];

        if (v17 == 2)
        {
          __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v13 smallDescription]);
            *(_DWORD *)buf = v27;
            __int128 v39 = v19;
            _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Cleaning up account for local service %@",  buf,  0xCu);
          }

          -[NSMutableSet addObject:](v5, "addObject:", v13);
          if ((v9 & 1) != 0)
          {
            unsigned __int8 v9 = 1;
            goto LABEL_18;
          }

          unsigned __int8 v9 = [v13 isRegistered];
          if (v10) {
            continue;
          }
        }

        else
        {
LABEL_18:
          if (v10) {
            continue;
          }
        }

- (id)_strippedAccountInfo:(id)a3
{
  id v3 = a3;
  id v4 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  v3);

  -[NSMutableDictionary removeObjectForKey:](v4, "removeObjectForKey:", kIDSServiceDefaultsAccountTypeKey);
  -[NSMutableDictionary removeObjectForKey:](v4, "removeObjectForKey:", kIDSServiceDefaultsHasEverRegistered);
  -[NSMutableDictionary removeObjectForKey:](v4, "removeObjectForKey:", kIDSServiceDefaultsRegistrationInfoKey);
  -[NSMutableDictionary removeObjectForKey:](v4, "removeObjectForKey:", kIDSServiceDefaultsUniqueIDKey);
  return v4;
}

- (BOOL)_isAccountInfoRegistered:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKey:kIDSServiceDefaultsRegistrationInfoKey]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kIDSServiceDefaultsRegistrationInfoStatusKey]);
  unsigned int v5 = [v4 intValue];

  return v5 == 5;
}

- (void)_setupForLocal
{
}

- (BOOL)isLocalSetupEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
  unsigned __int8 v3 = [v2 isCurrentDevicePairedOrPairing];

  return v3;
}

- (BOOL)isTraditionalLocalSetupEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
  unsigned __int8 v3 = [v2 isTraditionalDevicePairedOrPairing];

  return v3;
}

- (void)startLocalSetup
{
  unsigned __int8 v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting local setup", v6, 2u);
  }

  -[IDSDAccountController setHasHardDeregistered:](self, "setHasHardDeregistered:", 0LL);
  -[IDSDAccountController _setupForLocal](self, "_setupForLocal");
  -[IDSDAccountController _setupAdHocAccounts](self, "_setupAdHocAccounts");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
  [v4 updateTopics];

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSUTunDeliveryController sharedInstance](&OBJC_CLASS___IDSUTunDeliveryController, "sharedInstance"));
  [v5 localAccountSetupCompleted];
}

- (void)stopLocalSetup
{
  unsigned __int8 v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Stopping local setup", v5, 2u);
  }

  -[IDSDAccountController _cleanupLocalAccounts](self, "_cleanupLocalAccounts");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
  [v4 updateTopics];

  -[IDSDAccountController setHasHardDeregistered:](self, "setHasHardDeregistered:", 0LL);
}

- (void)_setupAdHocAccountsForPrimaryAccount:(id)a3
{
  id v4 = a3;
  unsigned int v5 = objc_autoreleasePoolPush();
  if (v4)
  {
    id v6 = &IMInsertBoolsToXPCDictionary_ptr;
    if ([v4 isAdHocAccount])
    {
      v95 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v95, OS_LOG_TYPE_DEBUG)) {
        sub_10069D74C(v4, v95);
      }
      goto LABEL_130;
    }

    v89 = v5;
    __int128 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 service]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
    v95 = v7;
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s identifier](v7, "identifier"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 adHocServicesForIdentifier:v9]);
    id v11 = [v10 _copyForEnumerating];

    v91 = v11;
    id v12 = [v11 count];
    unsigned __int8 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    unsigned __int8 v14 = v13;
    if (!v12)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        sub_10069D7CC();
      }
      goto LABEL_129;
    }

    unsigned __int8 v15 = &off_100717000;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v16 = (uint64_t (*__ptr32 *)(int, int, id))objc_claimAutoreleasedReturnValue([v4 smallDescription]);
      *(_DWORD *)buf = 138412290;
      v128 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  " * Setting up adhoc accounts for %@",  buf,  0xCu);
    }

    v107 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 loginID]);
    unint64_t v17 = (unint64_t)[v4 accountType];
    v106 = (void *)objc_claimAutoreleasedReturnValue([v4 userUniqueIdentifier]);
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v4 registration]);
    v90 = (void *)objc_claimAutoreleasedReturnValue([v18 adHocServiceNames]);

    __int128 v121 = 0u;
    __int128 v122 = 0u;
    __int128 v119 = 0u;
    __int128 v120 = 0u;
    id v19 = v11;
    id v102 = [v19 countByEnumeratingWithState:&v119 objects:v135 count:16];
    if (v102)
    {
      BOOL v97 = v17 == 1;
      uint64_t v101 = *(void *)v120;
      uint64_t v93 = kIDSServiceDefaultsPrimaryAccountKey;
      uint64_t v94 = kIDSServiceDefaultsPrimaryServiceNameKey;
      uint64_t v92 = kIDSServiceDefaultsUserUniqueIdentifier;
      unsigned int v108 = v17;
      v96 = v4;
      id v99 = v19;
      v100 = self;
      do
      {
        for (i = 0LL; i != v102; i = (char *)i + 1)
        {
          if (*(void *)v120 != v101) {
            objc_enumerationMutation(v19);
          }
          __int128 v21 = *(void **)(*((void *)&v119 + 1) + 8LL * (void)i);
          __int128 v18 = objc_autoreleasePoolPush();
          if ([v21 adHocServiceType] == 2
            && !-[IDSDAccountController isLocalSetupEnabled](self, "isLocalSetupEnabled")
            || [v21 adHocServiceType] == 5
            && !-[IDSDAccountController isLocalSetupEnabled](self, "isLocalSetupEnabled"))
          {
            goto LABEL_111;
          }

          v103 = i;
          v104 = v18;
          unsigned __int8 v15 = (uint64_t (*__ptr32 *)(int, int, id))[v21 enabledOnlyWhenPaired];
          id v22 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
          unsigned int v23 = [v22 isCurrentDeviceTinkerConfiguredWatch];

          if ([v21 enabledOnlyOnStandaloneDevices])
          {
            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
            if ([v24 deviceType] == (id)6) {
              int v25 = v23 ^ 1;
            }
            else {
              int v25 = 0;
            }
          }

          else
          {
            int v25 = 0;
          }

          unsigned int v26 = [v21 disabledOnTinkerWatch] & v23;
          if ((_DWORD)v15)
          {
            if (((!-[IDSDAccountController isTraditionalLocalSetupEnabled](self, "isTraditionalLocalSetupEnabled") | v25 | v26) & 1) != 0) {
              goto LABEL_30;
            }
          }

          else if ((v25 | v26) == 1)
          {
LABEL_30:
            unsigned __int8 v15 = (uint64_t (*__ptr32 *)(int, int, id))v21;
            __int128 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v28 = @"NO";
              if (v23) {
                __int128 v29 = @"YES";
              }
              else {
                __int128 v29 = @"NO";
              }
              *(_DWORD *)buf = 138413058;
              v128 = v15;
              if (v25) {
                __int128 v30 = @"YES";
              }
              else {
                __int128 v30 = @"NO";
              }
              __int16 v129 = 2112;
              if (v26) {
                uint64_t v28 = @"YES";
              }
              v130 = v29;
              __int16 v131 = 2112;
              v132 = v30;
              __int16 v133 = 2112;
              v134 = v28;
              _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Cannot enable adhoc service {service: %@, isTinker: %@, cannotEnableOnTraditionalWatch: %@, cannotEnable OnTinkerWatch: %@}",  buf,  0x2Au);
            }

            i = v103;
            goto LABEL_110;
          }

          if ((_DWORD)v17 == 3)
          {
            i = v103;
            __int128 v18 = v104;
            BOOL v109 = 0;
          }

          else
          {
            i = v103;
            __int128 v18 = v104;
            if (!(_DWORD)v17)
            {
              BOOL v109 = 0;
LABEL_44:
              if ([v21 adHocServiceType] == 2)
              {
                __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v21 pushTopic]);
                unsigned __int8 v15 = (uint64_t (*__ptr32 *)(int, int, id))[v31 isEqualToIgnoringCase:@"com.apple.private.alloy.electrictouch"];

                __int128 v18 = v104;
                if (!(_DWORD)v15) {
                  goto LABEL_111;
                }
              }

              goto LABEL_47;
            }

            BOOL v109 = v97;
          }

- (void)_setupAdHocAccounts
{
  unsigned __int8 v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setting up ad hoc accounts", buf, 2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController accounts](self, "accounts"));
  id v5 = [v4 _copyForEnumerating];

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ((objc_msgSend(v11, "isAdHocAccount", (void)v13) & 1) == 0) {
          -[IDSDAccountController _setupAdHocAccountsForPrimaryAccount:]( self,  "_setupAdHocAccountsForPrimaryAccount:",  v11);
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }

    while (v8);
  }

  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, " => Done setting up ad hoc accounts", buf, 2u);
  }
}

- (void)_setupLinkedAccounts
{
  unsigned __int8 v3 = (void **)&IMInsertBoolsToXPCDictionary_ptr;
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Setting up linked accounts, if necessary",  buf,  2u);
  }

  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController accounts](self, "accounts"));
  id v6 = [v5 _copyForEnumerating];

  id obj = v6;
  id v43 = [v6 countByEnumeratingWithState:&v56 objects:v65 count:16];
  if (v43)
  {
    p_cache = &OBJC_CLASS___IDSActivityPushListener.cache;
    uint64_t v42 = *(void *)v57;
    *(void *)&__int128 v7 = 138412546LL;
    __int128 v40 = v7;
    id v47 = self;
    do
    {
      for (i = 0LL; i != v43; i = (char *)i + 1)
      {
        if (*(void *)v57 != v42) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v56 + 1) + 8LL * (void)i);
        id v11 = (IDSDAccount *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "service", v40));
        id v12 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 linkedServicesForService:v11]);

        if ([v13 count])
        {
          __int128 v46 = i;
          __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3[440] registration]);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v40;
            __int128 v62 = v11;
            __int16 v63 = 2112;
            __int128 v64 = v13;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  " Service: %@  has linked services: %@",  buf,  0x16u);
          }

          __int128 v45 = v11;

          __int128 v54 = 0u;
          __int128 v55 = 0u;
          __int128 v52 = 0u;
          __int128 v53 = 0u;
          __int128 v44 = v13;
          id v48 = v13;
          id v50 = [v48 countByEnumeratingWithState:&v52 objects:v60 count:16];
          if (v50)
          {
            uint64_t v49 = *(void *)v53;
            do
            {
              for (j = 0LL; j != v50; j = (char *)j + 1)
              {
                if (*(void *)v53 != v49) {
                  objc_enumerationMutation(v48);
                }
                __int128 v16 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)j);
                if ([v16 disabledOnTinkerWatch])
                {
                  unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([p_cache + 408 sharedInstance]);
                  unsigned __int8 v18 = [v17 isCurrentDeviceTinkerConfiguredWatch];

                  if ((v18 & 1) != 0) {
                    continue;
                  }
                }

                id v19 = (void *)objc_claimAutoreleasedReturnValue([v10 linkedAccounts]);
                v51[0] = _NSConcreteStackBlock;
                v51[1] = 3221225472LL;
                v51[2] = sub_100143B04;
                v51[3] = &unk_1008FB8F8;
                v51[4] = v16;
                __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "__imArrayByFilteringWithBlock:", v51));
                __int128 v21 = (IDSDAccount *)objc_claimAutoreleasedReturnValue([v20 firstObject]);

                if (v21)
                {
                  id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3[440] registration]);
                  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  " We already have linked accounts, let's just double check the activation",  buf,  2u);
                  }

                  unsigned int v23 = [v10 isEnabled];
                  if (v23 != -[IDSDAccount isEnabled](v21, "isEnabled"))
                  {
                    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3[440] registration]);
                    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  " * They're not the same, let's fix that",  buf,  2u);
                    }

                    unsigned int v25 = [v10 isEnabled];
                    unsigned int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3[440] registration]);
                    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
                    if (v25)
                    {
                      if (v27)
                      {
                        *(_DWORD *)buf = 138412290;
                        __int128 v62 = v21;
                        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  " * Enabling account: %@",  buf,  0xCu);
                      }

                      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](v21, "uniqueID"));
                      -[IDSDAccountController enableAccountWithUniqueID:](self, "enableAccountWithUniqueID:", v28);
                    }

                    else
                    {
                      if (v27)
                      {
                        *(_DWORD *)buf = 138412290;
                        __int128 v62 = v21;
                        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  " * Disabling account: %@",  buf,  0xCu);
                      }

                      char v38 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](v21, "uniqueID"));
                      -[IDSDAccountController disableAccountWithUniqueID:](self, "disableAccountWithUniqueID:", v38);
                    }
                  }
                }

                else if ([v10 accountType] == 1)
                {
                  __int128 v29 = objc_alloc(&OBJC_CLASS___IDSDAccount);
                  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v10 loginID]);
                  __int128 v31 = v3;
                  __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
                  id v33 = [v10 accountType];
                  id v34 = (void *)objc_claimAutoreleasedReturnValue([v10 accountInfo]);
                  __int128 v21 = -[IDSDAccount initWithLoginID:service:uniqueID:accountType:accountConfig:]( v29,  "initWithLoginID:service:uniqueID:accountType:accountConfig:",  v30,  v16,  v32,  v33,  v34);

                  unsigned __int8 v3 = v31;
                  id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue([v31[440] registration]);
                  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    __int128 v62 = v21;
                    _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "  Creating a linked account: %@",  buf,  0xCu);
                  }

                  self = v47;
                  -[IDSDAccountController addAccount:](v47, "addAccount:", v21);
                  p_cache = (void **)(&OBJC_CLASS___IDSActivityPushListener + 16);
                  if ([v10 isEnabled])
                  {
                    id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3[440] registration]);
                    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "  ... and enabling it",  buf,  2u);
                    }

                    int v37 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](v21, "uniqueID"));
                    -[IDSDAccountController enableAccountWithUniqueID:](v47, "enableAccountWithUniqueID:", v37);

                    -[IDSDAccount registerAccount](v21, "registerAccount");
                    p_cache = (void **)(&OBJC_CLASS___IDSActivityPushListener + 16);
                  }
                }

                else
                {
                  __int128 v21 = 0LL;
                }
              }

              id v50 = [v48 countByEnumeratingWithState:&v52 objects:v60 count:16];
            }

            while (v50);
          }

          id v11 = v45;
          i = v46;
          __int128 v13 = v44;
        }
      }

      id v43 = [obj countByEnumeratingWithState:&v56 objects:v65 count:16];
    }

    while (v43);
  }

  uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3[440] registration]);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, " => Done setting up linked accounts", buf, 2u);
  }
}

- (void)_migrateLegacyAccounts
{
}

- (void)_migrateLegacyAccounts1
{
  v2 = self;
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController userDefaults](self, "userDefaults"));
  unsigned int v4 = [v3 appBoolForKey:@"ImportedLegacyIMAccounts"];

  if (v4)
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Not importing legacy accounts, we've already done this",  buf,  2u);
    }
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController userDefaults](v2, "userDefaults"));
    [v6 setAppBool:1 forKey:@"ImportedLegacyIMAccounts"];

    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v7 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 allServices]);

    id v48 = -[os_log_s countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v51,  v59,  16LL);
    if (v48)
    {
      uint64_t v47 = *(void *)v52;
      uint64_t v42 = kIDSServiceDefaultsEnabledAccounts;
      uint64_t v43 = kIDSServiceDefaultsAccounts;
      __int128 v44 = v5;
      __int128 v41 = v2;
      do
      {
        for (i = 0LL; i != v48; i = (char *)i + 1)
        {
          if (*(void *)v52 != v47) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)i);
          id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier", v41));
          unsigned __int8 v11 = [v10 isEqualToIgnoringCase:@"com.apple.madrid"];
          id v12 = @"com.apple.imservice.iMessage";
          if ((v11 & 1) == 0)
          {
            unsigned int v13 = [v10 isEqualToIgnoringCase:@"com.apple.ess"];
            id v12 = @"com.apple.imservice.FaceTime";
            if (!v13) {
              id v12 = 0LL;
            }
          }

          __int128 v14 = v12;

          if (-[__CFString length](v14, "length"))
          {
            __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              __int128 v56 = (os_log_s *)v14;
              __int16 v57 = 2112;
              id v58 = v9;
              _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Importing from domain %@ => %@",  buf,  0x16u);
            }

            __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController userDefaults](v2, "userDefaults"));
            unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v9 preferencesDomain]);
            id v18 = [v16 copyKeyListForAppID:v17];

            id v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController userDefaults](v2, "userDefaults"));
            __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v9 preferencesDomain]);
            id v21 = [v19 copyMultipleForCurrentKeys:v18 appID:v20];

            id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKey:@"Accounts"]);
            id v23 = [v22 count];

            if (v23)
            {
              uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                __int128 v56 = (os_log_s *)v9;
                __int16 v57 = 2112;
                id v58 = v21;
                _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Skipping service import: %@, we already have accounts: %@",  buf,  0x16u);
              }
            }

            else
            {
              unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController userDefaults](v2, "userDefaults"));
              uint64_t v24 = (os_log_s *)[v25 copyKeyListForAppID:v14];

              unsigned int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                __int128 v56 = v24;
                _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Legacy Keys: %@", buf, 0xCu);
              }

              if (-[os_log_s count](v24, "count"))
              {
                BOOL v27 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController userDefaults](v2, "userDefaults"));
                uint64_t v28 = (os_log_s *)[v27 copyMultipleForCurrentKeys:v24 appID:v14];

                __int128 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  __int128 v56 = v28;
                  _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Legacy Preferences: %@",  buf,  0xCu);
                }

                __int128 v30 = v28;
                __int128 v46 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v28, "objectForKey:", @"Accounts"));
                id v31 = [v46 count];
                __int128 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
                BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
                if (v31)
                {
                  if (v33)
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Importing accounts...",  buf,  2u);
                  }

                  __int128 v32 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
                  id v34 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
                  v49[0] = _NSConcreteStackBlock;
                  v49[1] = 3221225472LL;
                  v49[2] = sub_100144208;
                  v49[3] = &unk_1008F8418;
                  id v50 = v34;
                  __int128 v45 = v34;
                  [v46 enumerateKeysAndObjectsUsingBlock:v49];
                  -[os_log_s setObject:forKey:](v32, "setObject:forKey:", v45, v43);
                  id v35 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v30, "objectForKey:", @"ActiveAccounts"));
                  -[os_log_s setObject:forKey:](v32, "setObject:forKey:", v35, v42);

                  id v36 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController userDefaults](v41, "userDefaults"));
                  int v37 = (void *)objc_claimAutoreleasedReturnValue([v9 preferencesDomain]);
                  [v36 setMultiple:v32 remove:0 appID:v37];

                  char v38 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController userDefaults](v41, "userDefaults"));
                  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v9 preferencesDomain]);
                  [v38 synchronizeAppID:v39];

                  v2 = v41;
                  __int128 v40 = v46;
                }

                else
                {
                  if (v33)
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "  => Nothing interesting in the accounts, moving along",  buf,  2u);
                  }

                  __int128 v40 = v46;
                }

                id v5 = v44;
              }
            }
          }
        }

        id v48 = -[os_log_s countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v51,  v59,  16LL);
      }

      while (v48);
    }
  }
}

- (void)_migrateLegacyAccounts2
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController userDefaults](self, "userDefaults"));
  unsigned int v4 = [v3 appBoolForKey:@"ImportedLegacyIDSAccounts2"];

  if (v4)
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Not importing legacy accounts, we've already done this",  (uint8_t *)&buf,  2u);
    }
  }

  else
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDServiceController allServices](self->_serviceController, "allServices"));
    id v7 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v7)
    {
      uint64_t v9 = *(void *)v17;
      *(void *)&__int128 v8 = 138412546LL;
      __int128 v15 = v8;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          unsigned __int8 v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
          id v12 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDAccountController _legacyAccountsOnService:]( self,  "_legacyAccountsOnService:",  v11,  v15));
          unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v11 preferencesDomain]);
          -[os_log_s setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v12, v13);
        }

        id v7 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }

      while (v7);
    }

    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController userDefaults](self, "userDefaults"));
    [v14 setAppBool:1 forKey:@"ImportedLegacyIDSAccounts2"];

    -[IDSDAccountController _persistAccounts:](self, "_persistAccounts:", v5);
  }
}

- (id)_legacyAccountsOnService:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 preferencesDomain]);
  if ([v5 length])
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138412546;
      id v25 = v5;
      __int16 v26 = 2112;
      id v27 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Importing from domain %@ => %@",  (uint8_t *)&v24,  0x16u);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController _preferencesOnDomain:](self, "_preferencesOnDomain:", v5));
    __int128 v8 = (const void *)kIDSServiceDefaultsAccounts;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:kIDSServiceDefaultsAccounts]);
    id v10 = [v9 count];

    if (v10)
    {
      unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDAccountController _preferencesOnDomain:]( self,  "_preferencesOnDomain:",  @"com.apple.identityservicesd"));
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"services"]);
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v4 preferencesDomain]);
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v13]);

      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v8]);
      id v16 = [v15 count];

      if (v16)
      {
        __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          int v24 = 138412546;
          id v25 = v4;
          __int16 v26 = 2112;
          id v27 = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Skipping service import: %@, we already have accounts: %@",  (uint8_t *)&v24,  0x16u);
        }

        id v18 = 0LL;
      }

      else
      {
        __int128 v19 = (const void *)kIDSServiceDefaultsEnabledAccounts;
        __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:kIDSServiceDefaultsEnabledAccounts]);
        if (!-[os_log_s count](v17, "count"))
        {
          __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            int v24 = 138412290;
            id v25 = v5;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Migrating legacy account found no enabled accounts { legacyDomain : %@ }",  (uint8_t *)&v24,  0xCu);
          }
        }

        id v21 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        id v22 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v8]);
        if (v22)
        {
          CFDictionarySetValue((CFMutableDictionaryRef)v21, v8, v22);
        }

        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_10069D8A4();
        }

        if (v17) {
          CFDictionarySetValue((CFMutableDictionaryRef)v21, v19, v17);
        }
        id v18 = -[NSMutableDictionary copy](v21, "copy");
      }
    }

    else
    {
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v14,  OS_LOG_TYPE_DEFAULT,  "  => Nothing interesting in the accounts, moving along",  (uint8_t *)&v24,  2u);
      }

      id v18 = 0LL;
    }
  }

  else
  {
    id v18 = 0LL;
  }

  return v18;
}

- (void)_persistAccounts:(id)a3
{
  id v4 = a3;
  id v5 = objc_autoreleasePoolPush();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v4 count]));
    int v12 = 138412290;
    unsigned int v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Persisting %@ accounts", (uint8_t *)&v12, 0xCu);
  }

  uint64_t v8 = JWEncodeDictionary(v4);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = [v9 _FTCopyOptionallyGzippedData];

  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController userDefaults](self, "userDefaults"));
  [v11 setValue:v10 forKey:@"services" appID:@"com.apple.identityservicesd"];

  objc_autoreleasePoolPop(v5);
}

- (id)_preferencesOnDomain:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController userDefaults](self, "userDefaults"));
  id v6 = [v5 copyKeyListForAppID:v4];

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController userDefaults](self, "userDefaults"));
    id v8 = [v7 copyMultipleForCurrentKeys:v6 appID:v4];
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (BOOL)hasForcedReRegistered
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController userDefaults](self, "userDefaults"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 appValueForKey:@"ReRegisteredForDevicesHash"]);

  if (v4 && (uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString, v5), (objc_opt_isKindOfClass(v4, v6) & 1) != 0))
  {
    uint64_t v7 = _IDSServiceDictionaryRepresentableHash();
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    unsigned int v9 = [v4 isEqualToString:v8];
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v11 = @"NO";
      *(_DWORD *)id v21 = 138412802;
      if (v9) {
        unsigned __int8 v11 = @"YES";
      }
      *(void *)&v21[4] = v11;
      __int16 v22 = 2112;
      id v23 = v4;
      __int16 v24 = 2112;
      id v25 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Computed force register hash {matched: %@, old: %@, new: %@}",  v21,  0x20u);
    }
  }

  else
  {
    LOBYTE(v9) = 1;
  }

  int v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController userDefaults](self, "userDefaults", *(void *)v21));
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 appValueForKey:@"ReRegisteredForDevices"]);

  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSNumber, v14);
  if ((objc_opt_isKindOfClass(v13, v15) & 1) != 0)
  {
    id v16 = [v13 integerValue];
    BOOL v17 = v16 == (id)sub_100144C00();
  }

  else
  {
    BOOL v17 = 0;
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController userDefaults](self, "userDefaults"));
  unsigned __int8 v19 = [v18 appBoolForKey:@"ReRegisterForAliasRepair"];

  return v17 & ~v19 & v9;
}

- (void)_cleanupLegacyAccounts
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController userDefaults](self, "userDefaults"));
  unsigned __int8 v4 = [v3 appBoolForKey:@"DidCleanLegacyAccountPrefs"];

  if ((v4 & 1) == 0)
  {
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue(-[IDSDServiceController allServices](self->_serviceController, "allServices"));
    id v5 = [obj countByEnumeratingWithState:&v24 objects:v34 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v22 = *(void *)v25;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v25 != v22) {
            objc_enumerationMutation(obj);
          }
          id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v24 + 1) + 8 * (void)i) preferencesDomain]);
          unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController userDefaults](self, "userDefaults"));
          id v10 = [v9 copyKeyListForAppID:v8];

          unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController userDefaults](self, "userDefaults"));
          [v11 setMultiple:0 remove:v10 appID:v8];

          int v12 = NSHomeDirectory();
          unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/Library/Preferences/%@.plist",  v13,  v8));
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
          id v23 = 0LL;
          unsigned int v16 = [v15 removeItemAtPath:v14 error:&v23];
          id v17 = v23;

          id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)int buf = 138412802;
            unsigned __int8 v19 = @"NO";
            if (v16) {
              unsigned __int8 v19 = @"YES";
            }
            __int128 v29 = v14;
            __int16 v30 = 2112;
            id v31 = v19;
            __int16 v32 = 2112;
            id v33 = v17;
            _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "Deleting legacy account prefs {path: %@, success: %@, error: %@}",  buf,  0x20u);
          }
        }

        id v6 = [obj countByEnumeratingWithState:&v24 objects:v34 count:16];
      }

      while (v6);
    }

    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController userDefaults](self, "userDefaults"));
    [v20 setAppBool:1 forKey:@"DidCleanLegacyAccountPrefs"];
  }

- (void)_cleanupLegacyLocalAccounts
{
  unsigned __int8 v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "SU cleanup", buf, 2u);
  }

  id v31 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController userDefaults](self, "userDefaults"));
  unsigned __int8 v5 = [v4 appBoolForKey:@"MigratedToNewDisabledState"];

  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id v33 = self;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController accounts](self, "accounts"));
  id v7 = [v6 countByEnumeratingWithState:&v41 objects:v48 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v42;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v42 != v9) {
          objc_enumerationMutation(v6);
        }
        unsigned __int8 v11 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)i);
        int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 service]);
        unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 pushTopic]);

        if ([v13 isEqualToIgnoringCase:@"com.apple.private.alloy.willow"]
          && ![v11 accountType])
        {
          -[NSMutableArray addObject:](v31, "addObject:", v11);
          if ((v5 & 1) != 0) {
            goto LABEL_15;
          }
        }

        else if ((v5 & 1) != 0)
        {
          goto LABEL_15;
        }

        if (([v11 isAdHocAccount] & 1) == 0)
        {
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueID]);
          unsigned __int8 v15 = -[IDSDAccountController isEnabledAccount:](v33, "isEnabledAccount:", v14);

          if ((v15 & 1) == 0) {
            [v11 setIsUserDisabled:1];
          }
        }

- (void)_servicesChanged
{
  if (-[IDSDAccountController isLocalSetupEnabled](self, "isLocalSetupEnabled")) {
    -[IDSDAccountController _refreshLocalAccounts](self, "_refreshLocalAccounts");
  }
}

- (void)_servicesRemoved:(id)a3
{
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"RemovedServices"]);

  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog sub_services](&OBJC_CLASS___IMRGLog, "sub_services"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int buf = 138412290;
    uint64_t v23 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "All services to remove: %@", buf, 0xCu);
  }

  if ([v5 count])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_accountIDMap, "allKeys"));
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        unsigned __int8 v11 = 0LL;
        do
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          int v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_accountIDMap,  "objectForKey:",  *(void *)(*((void *)&v17 + 1) + 8LL * (void)v11)));
          unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 service]);
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
          unsigned int v15 = [v5 containsObject:v14];

          if (v15) {
            -[IDSDAccountController _removeAccount:](self, "_removeAccount:", v12);
          }

          unsigned __int8 v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }

      while (v9);
    }

    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
    [v16 performBlockSyncPriority:&stru_1008FB918];
  }
}

- (void)loadStoredAccounts
{
  if (!self->_accountsLoaded)
  {
    *(_WORD *)&self->_accountsLoaded = 257;
    -[IDSDAccountController _migrateLegacyAccounts](self, "_migrateLegacyAccounts");
    uint64_t v3 = OSLogHandleForIDSCategory("IDSDAcountController");
    unsigned __int8 v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int buf = 136315138;
      unsigned int v13 = "-[IDSDAccountController loadStoredAccounts]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v5)
      && _IDSShouldLog(0LL, @"IDSDAcountController"))
    {
      unsigned __int8 v11 = "-[IDSDAccountController loadStoredAccounts]";
      _IDSLogV(0LL, @"IDSFoundation", @"IDSDAcountController", @"%s");
    }

    -[NSMutableSet removeAllObjects](self->_enabledAccounts, "removeAllObjects", v11);
    if (!-[IDSDAccountController _loadAndEnableStoredAccounts](self, "_loadAndEnableStoredAccounts")) {
      -[IDSDAccountController _loadAndEnableStoredLegacyAccounts](self, "_loadAndEnableStoredLegacyAccounts");
    }
    self->_isLoading = 0;
    -[IDSDAccountController _cleanupLegacyAccounts](self, "_cleanupLegacyAccounts");
    -[IDSDAccountController _cleanupLegacyLocalAccounts](self, "_cleanupLegacyLocalAccounts");
    -[IDSDAccountController _setupLinkedAccounts](self, "_setupLinkedAccounts");
    unsigned int v6 = -[IDSDAccountController isLocalSetupEnabled](self, "isLocalSetupEnabled");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        *(_WORD *)int buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setting up local", buf, 2u);
      }

      -[IDSDAccountController startLocalSetup](self, "startLocalSetup");
    }

    else
    {
      if (v8)
      {
        *(_WORD *)int buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Not setting up local", buf, 2u);
      }

      -[IDSDAccountController _cleanupLocalAccounts](self, "_cleanupLocalAccounts");
      -[IDSDAccountController _setupAdHocAccounts](self, "_setupAdHocAccounts");
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController daemon](self, "daemon"));
      [v9 updateTopics];
    }

    -[IDSDAccountController _cleanUpAccountCredentialStore](self, "_cleanUpAccountCredentialStore");
    -[IDSDAccountController _resumeGDRReAuthenticateIfNecessary](self, "_resumeGDRReAuthenticateIfNecessary");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController delegate](self, "delegate"));
    [v10 accountControllerDidFinishLoadingAccounts:self];
  }

- (id)_createAccountWithDictionary:(id)a3 service:(id)a4 uniqueID:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = -[IDSDAccount initWithDictionary:service:uniqueID:]( objc_alloc(&OBJC_CLASS___IDSDAccount),  "initWithDictionary:service:uniqueID:",  v9,  v8,  v7);

  return v10;
}

- (void)_addAccountDuringInitialSetup:(id)a3
{
  accountIDMapLock = self->_accountIDMapLock;
  id v5 = a3;
  -[NSRecursiveLock lock](accountIDMapLock, "lock");
  accountIDMap = self->_accountIDMap;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueID]);
  -[NSMutableDictionary setObject:forKey:](accountIDMap, "setObject:forKey:", v5, v7);

  -[NSRecursiveLock unlock](self->_accountIDMapLock, "unlock");
}

- (void)_attachOrphanedPhoneAliases:(id)a3 toRecipientAccounts:(id)a4 withAccountsToEnable:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v24 = a5;
  if ([v7 count])
  {
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v7 count]));
      *(_DWORD *)int buf = 138412290;
      char v36 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Dropped aliases { count: %@ }", buf, 0xCu);
    }

    unsigned __int8 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v8 count]));
      *(_DWORD *)int buf = 138412290;
      char v36 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Donor accounts { count: %@ }", buf, 0xCu);
    }

    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    id obj = v8;
    id v25 = [obj countByEnumeratingWithState:&v31 objects:v40 count:16];
    if (v25)
    {
      uint64_t v23 = *(void *)v32;
      do
      {
        uint64_t v13 = 0LL;
        do
        {
          if (*(void *)v32 != v23) {
            objc_enumerationMutation(obj);
          }
          uint64_t v26 = v13;
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:*(void *)(*((void *)&v31 + 1) + 8 * v13)]);
          __int128 v27 = 0u;
          __int128 v28 = 0u;
          __int128 v29 = 0u;
          __int128 v30 = 0u;
          id v15 = v7;
          id v16 = [v15 countByEnumeratingWithState:&v27 objects:v39 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v28;
            do
            {
              for (i = 0LL; i != v17; i = (char *)i + 1)
              {
                if (*(void *)v28 != v18) {
                  objc_enumerationMutation(v15);
                }
                __int128 v20 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
                id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
                if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)int buf = 138412546;
                  char v36 = v20;
                  __int16 v37 = 2112;
                  __int128 v38 = v14;
                  _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Adding %@ to %@", buf, 0x16u);
                }

                [v14 addAliases:v20];
              }

              id v17 = [v15 countByEnumeratingWithState:&v27 objects:v39 count:16];
            }

            while (v17);
          }

          uint64_t v13 = v26 + 1;
        }

        while ((id)(v26 + 1) != v25);
        id v25 = [obj countByEnumeratingWithState:&v31 objects:v40 count:16];
      }

      while (v25);
    }
  }
}

- (BOOL)_loadAndEnableStoredAccounts
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController userDefaults](self, "userDefaults"));
  id v4 = [v3 copyValueForKey:@"services" appID:@"com.apple.identityservicesd"];

  __int128 v64 = v4;
  id v5 = v4;
  unsigned int v6 = self;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 _FTOptionallyDecompressData]);
  uint64_t v8 = JWDecodeDictionary(v7);
  id v69 = (void *)objc_claimAutoreleasedReturnValue(v8);

  v74 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDServiceController allServices](self->_serviceController, "allServices"));
  uint64_t v10 = &IMInsertBoolsToXPCDictionary_ptr;
  unsigned __int8 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  p_isa = (id *)&v6->super.isa;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v9 count]));
    *(_DWORD *)int buf = 138412290;
    v104 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Loaded services { count: %@ }", buf, 0xCu);

    unsigned int v6 = (IDSDAccountController *)p_isa;
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController userDefaults](v6, "userDefaults"));
  unsigned __int8 v78 = [v13 appBoolForKey:@"performed-user-intent-migrate"];

  uint64_t v14 = p_isa;
  __int128 v99 = 0u;
  __int128 v100 = 0u;
  __int128 v97 = 0u;
  __int128 v98 = 0u;
  id obj = v9;
  id v70 = [obj countByEnumeratingWithState:&v97 objects:v112 count:16];
  if (v70)
  {
    uint64_t v67 = kIDSServiceDefaultsAccounts;
    uint64_t v68 = *(void *)v98;
    uint64_t v66 = kIDSServiceDefaultsEnabledAccounts;
    do
    {
      for (i = 0LL; i != v70; i = (char *)i + 1)
      {
        if (*(void *)v98 != v68) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(os_log_s **)(*((void *)&v97 + 1) + 8LL * (void)i);
        id v17 = objc_autoreleasePoolPush();
        v83 = v16;
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s preferencesDomain](v16, "preferencesDomain"));
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKeyedSubscript:v18]);

        __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:v67]);
        v79 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:v66]);
        if (v19)
        {
          id v71 = v19;
          id v72 = v17;
          uint64_t v73 = i;
          uint64_t v81 = v20;
          v76 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          unsigned int v75 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          __int128 v93 = 0u;
          __int128 v94 = 0u;
          __int128 v95 = 0u;
          __int128 v96 = 0u;
          id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 allKeys]);
          id v22 = [v21 countByEnumeratingWithState:&v93 objects:v111 count:16];
          if (!v22) {
            goto LABEL_55;
          }
          id v23 = v22;
          uint64_t v84 = *(void *)v94;
          v82 = v21;
          while (1)
          {
            id v24 = 0LL;
            do
            {
              if (*(void *)v94 != v84) {
                objc_enumerationMutation(v21);
              }
              id v25 = *(void **)(*((void *)&v93 + 1) + 8LL * (void)v24);
              uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:v25]);
              if (v26)
              {
                __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v14 accountWithUniqueID:v25]);
                if (v27)
                {
                  __int128 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10[440] warning]);
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
                  {
                    __int128 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue([v27 accountSetupInfo]);
                    *(_DWORD *)int buf = 138412802;
                    v104 = v25;
                    __int16 v105 = 2112;
                    v106 = v29;
                    __int16 v107 = 2112;
                    *(void *)unsigned int v108 = v26;
                    _os_log_fault_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_FAULT,  "We already have an existing account with for this uniqueID -- not loading { uniqueID: %@, existing AccountInfo: %@, newAccountInfo: %@ }",  buf,  0x20u);

                    __int128 v20 = v81;
                  }

                  goto LABEL_49;
                }

                __int128 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 _createAccountWithDictionary:v26 service:v83 uniqueID:v25]);
                __int128 v28 = v30;
                if (!v30)
                {
                  __int128 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10[440] warning]);
                  if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)int buf = 138412802;
                    v104 = v25;
                    __int16 v105 = 2112;
                    v106 = v83;
                    __int16 v107 = 2112;
                    *(void *)unsigned int v108 = v26;
                    _os_log_fault_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_FAULT,  "Failed to create account { uniqueID: %@, service: %@, accountInfo: %@ }",  buf,  0x20u);
                  }

                  goto LABEL_48;
                }

                __int128 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s serviceType](v30, "serviceType"));
                id v32 = -[os_log_s accountType](v28, "accountType");
                if ((objc_msgSend( v14[9],  "systemSupportsServiceType:accountType:isTemporary:",  v31,  v32,  -[os_log_s isTemporary](v28, "isTemporary")) & 1) == 0)
                {
                  if (!(_DWORD)v32)
                  {
                    id v35 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s aliases](v28, "aliases"));
                    id v36 = [v35 count];

                    if (v36)
                    {
                      __int16 v37 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s aliases](v28, "aliases"));
                      -[NSMutableArray addObject:](v76, "addObject:", v37);
                    }
                  }

                  uint64_t v10 = &IMInsertBoolsToXPCDictionary_ptr;
                  __int128 v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)int buf = 138413058;
                    v104 = v25;
                    __int16 v105 = 2112;
                    v106 = v31;
                    __int16 v107 = 1024;
                    *(_DWORD *)unsigned int v108 = (_DWORD)v32;
                    *(_WORD *)&v108[4] = 2112;
                    *(void *)&v108[6] = v26;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_ERROR,  "Tried to load account on a device that does not support this service/account type -- dropping! { u niqueID: %@, serviceType: %@, accountType: %d, accountInfo: %@ }",  buf,  0x26u);
                  }

                  uint64_t v14 = p_isa;
                  __int128 v20 = v81;
                  goto LABEL_48;
                }

                if ((_DWORD)v32
                  || (-[os_log_s wantsPhoneNumberAccount](v83, "wantsPhoneNumberAccount") & 1) != 0)
                {
                  if (-[os_log_s disabledOnTinkerWatch](v83, "disabledOnTinkerWatch"))
                  {
                    __int128 v33 = (void *)objc_claimAutoreleasedReturnValue( +[IDSPairingManager sharedInstance]( &OBJC_CLASS___IDSPairingManager,  "sharedInstance"));
                    unsigned int v34 = [v33 isCurrentDeviceTinkerConfiguredWatch];

                    uint64_t v14 = p_isa;
                    if (v34)
                    {
                      uint64_t v10 = &IMInsertBoolsToXPCDictionary_ptr;
                      log = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
                      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)int buf = 138413314;
                        v104 = v25;
                        __int16 v105 = 2112;
                        v106 = v83;
                        __int16 v107 = 2112;
                        *(void *)unsigned int v108 = v31;
                        *(_WORD *)&v108[8] = 1024;
                        *(_DWORD *)&v108[10] = (_DWORD)v32;
                        __int16 v109 = 2112;
                        v110 = v26;
                        _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Tried to load a tinker disabled account -- dropping! { uniqueID: %@, service: %@, serviceType: %@, accountType: %d, accountInfo: %@ }",  buf,  0x30u);
                      }

LABEL_47:
                      __int128 v20 = v81;
LABEL_48:

                      id v21 = v82;
LABEL_49:

                      goto LABEL_50;
                    }
                  }

                  if ((_DWORD)v32 != 3
                    || (-[os_log_s wantsATVDeviceAccount](v83, "wantsATVDeviceAccount") & 1) != 0)
                  {
                    uint64_t v10 = &IMInsertBoolsToXPCDictionary_ptr;
                    if ((v78 & 1) == 0) {
                      -[os_log_s loadAliasUserIntentMetadataIfNeeded](v28, "loadAliasUserIntentMetadataIfNeeded");
                    }
                    if ((_DWORD)v32 == 1) {
                      -[NSMutableArray addObject:](v75, "addObject:", v25);
                    }
                    [v14 _addAccountDuringInitialSetup:v28];
                    __int128 v20 = v81;
                    goto LABEL_48;
                  }

                  uint64_t v10 = &IMInsertBoolsToXPCDictionary_ptr;
                  __int128 v39 = (void *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
                  if (!os_log_type_enabled((os_log_t)v39, OS_LOG_TYPE_ERROR))
                  {
LABEL_46:

                    goto LABEL_47;
                  }

                  *(_DWORD *)int buf = 138413058;
                  v104 = v25;
                  __int16 v105 = 2112;
                  v106 = v31;
                  __int16 v107 = 1024;
                  *(_DWORD *)unsigned int v108 = 3;
                  *(_WORD *)&v108[4] = 2112;
                  *(void *)&v108[6] = v26;
                  __int128 v40 = (os_log_s *)v39;
                  __int128 v41 = "Tried to load a device account for a service that does not support device accounts -- dropping! "
                        "{ uniqueID: %@, serviceType: %@, accountType: %d, accountInfo: %@ }";
                }

                else
                {
                  __int128 v39 = (void *)objc_claimAutoreleasedReturnValue([v10[440] warning]);
                  if (!os_log_type_enabled((os_log_t)v39, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_46;
                  }
                  *(_DWORD *)int buf = 138413058;
                  v104 = v25;
                  __int16 v105 = 2112;
                  v106 = v31;
                  __int16 v107 = 1024;
                  *(_DWORD *)unsigned int v108 = 0;
                  *(_WORD *)&v108[4] = 2112;
                  *(void *)&v108[6] = v26;
                  __int128 v40 = (os_log_s *)v39;
                  __int128 v41 = "Tried to load a phone number account for a service that does not support phone number accounts -"
                        "- dropping! { uniqueID: %@, serviceType: %@, accountType: %d, accountInfo: %@ }";
                }

                _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, v41, buf, 0x26u);
                goto LABEL_46;
              }

- (void)_loadAndEnableStoredLegacyAccounts
{
  v2 = self;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDServiceController allServices](self->_serviceController, "allServices"));
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v3 count]));
    *(_DWORD *)int buf = 138412290;
    id v102 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Loaded services { count: %@ }", buf, 0xCu);
  }

  v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v94 = 0u;
  __int128 v95 = 0u;
  __int128 v96 = 0u;
  __int128 v97 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v94 objects:v108 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v95;
    uint64_t v64 = kIDSServiceDefaultsAccounts;
    uint64_t v63 = kIDSServiceDefaultsEnabledAccounts;
    v76 = v2;
    uint64_t v66 = *(void *)v95;
    id v67 = v6;
    do
    {
      uint64_t v10 = 0LL;
      id v71 = v8;
      do
      {
        if (*(void *)v95 != v9) {
          objc_enumerationMutation(v6);
        }
        unsigned __int8 v11 = *(void **)(*((void *)&v94 + 1) + 8LL * (void)v10);
        int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 preferencesDomain]);
        id v13 = [v12 length];

        if (v13)
        {
          uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 legacyPreferencesDomain]);
          id v15 = objc_alloc(&OBJC_CLASS___NSMutableArray);
          id v16 = v11;
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v11 preferencesDomain]);
          uint64_t v18 = -[NSMutableArray initWithObjects:](v15, "initWithObjects:", v17, 0LL);

          if (v14) {
            -[NSMutableArray addObject:](v18, "addObject:", v14);
          }
          __int128 v92 = 0u;
          __int128 v93 = 0u;
          __int128 v90 = 0u;
          __int128 v91 = 0u;
          id obj = v18;
          id v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v90,  v107,  16LL);
          if (v19)
          {
            id v20 = v19;
            uint64_t v21 = *(void *)v91;
LABEL_14:
            uint64_t v22 = 0LL;
            while (1)
            {
              if (*(void *)v91 != v21) {
                objc_enumerationMutation(obj);
              }
              id v23 = *(os_log_s **)(*((void *)&v90 + 1) + 8 * v22);
              id v24 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController userDefaults](v2, "userDefaults"));
              id v25 = [v24 copyKeyListForAppID:v23];

              if (v25) {
                break;
              }
              if (v20 == (id)++v22)
              {
                id v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v90,  v107,  16LL);
                uint64_t v9 = v66;
                id v6 = v67;
                id v8 = v71;
                if (!v20) {
                  goto LABEL_57;
                }
                goto LABEL_14;
              }
            }

            id v69 = v14;
            id v70 = v10;
            uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController userDefaults](v2, "userDefaults"));
            id v72 = v25;
            id v27 = [v26 copyMultipleForCurrentKeys:v25 appID:v23];

            __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:v64]);
            uint64_t v68 = v27;
            unsigned int v75 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:v63]);
            __int128 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
            __int128 v30 = v28;
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              id v54 = (void *)objc_claimAutoreleasedReturnValue([v28 allKeys]);
              *(_DWORD *)int buf = 138412802;
              id v102 = v23;
              __int16 v103 = 2112;
              uint64_t v104 = (uint64_t)v54;
              __int16 v105 = 2112;
              v106 = v75;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEBUG,  "Defaults dictionary loaded { domain: %@, accounts: %@, enabledAccounts: %@ }",  buf,  0x20u);

              __int128 v28 = v30;
            }

            __int128 v65 = v23;

            __int128 v88 = 0u;
            __int128 v89 = 0u;
            __int128 v86 = 0u;
            __int128 v87 = 0u;
            id v77 = (id)objc_claimAutoreleasedReturnValue([v28 allKeys]);
            id v31 = [v77 countByEnumeratingWithState:&v86 objects:v100 count:16];
            if (v31)
            {
              id v32 = v31;
              uint64_t v33 = *(void *)v87;
              do
              {
                unsigned int v34 = 0LL;
                do
                {
                  if (*(void *)v87 != v33) {
                    objc_enumerationMutation(v77);
                  }
                  id v35 = *(os_log_s **)(*((void *)&v86 + 1) + 8LL * (void)v34);
                  id v36 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKeyedSubscript:v35]);
                  __int16 v37 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController accountWithUniqueID:](v2, "accountWithUniqueID:", v35));
                  __int128 v38 = -[IDSDAccount initWithDictionary:service:uniqueID:]( objc_alloc(&OBJC_CLASS___IDSDAccount),  "initWithDictionary:service:uniqueID:",  v36,  v16,  v35);
                  __int128 v39 = v38;
                  if (v36)
                  {
                    if (v37)
                    {
                      __int128 v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
                      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
                      {
                        uint64_t v41 = objc_claimAutoreleasedReturnValue([v37 accountSetupInfo]);
                        *(_DWORD *)int buf = 138412802;
                        id v102 = v35;
                        __int16 v103 = 2112;
                        uint64_t v104 = v41;
                        id v42 = (void *)v41;
                        __int16 v105 = 2112;
                        v106 = v36;
                        _os_log_fault_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_FAULT,  "We already have an existing account with for this uniqueID -- not loading { uniqueID: %@, exis tingAccountInfo: %@, newAccountInfo: %@ }",  buf,  0x20u);
                      }

- (BOOL)isLoading
{
  return !self->_accountsLoaded || self->_isLoading;
}

- (BOOL)accountsLoaded
{
  return self->_accountsLoaded;
}

- (void)delayedSaveSettings
{
  uint64_t v3 = objc_autoreleasePoolPush();
  -[CUTDeferredTaskQueue cancelPendingExecutions](self->_storeAccountTask, "cancelPendingExecutions");
  -[CUTDeferredTaskQueue enqueueExecutionWithTarget:afterDelay:]( self->_storeAccountTask,  "enqueueExecutionWithTarget:afterDelay:",  self,  5.0);
  objc_autoreleasePoolPop(v3);
}

- (void)_storeAccounts
{
  if (-[IDSDAccountController isLoading](self, "isLoading"))
  {
    uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Waiting on accounts to load, the account controller isn't ready yet",  buf,  2u);
    }
  }

  else
  {
    uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v23 = objc_autoreleasePoolPush();
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue(-[IDSDServiceController allServices](self->_serviceController, "allServices"));
    id v29 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v29)
    {
      uint64_t v26 = kIDSServiceDefaultsAccounts;
      uint64_t v27 = *(void *)v41;
      uint64_t v25 = kIDSServiceDefaultsEnabledAccounts;
      __int128 v28 = v3;
      do
      {
        uint64_t v4 = 0LL;
        do
        {
          if (*(void *)v41 != v27) {
            objc_enumerationMutation(obj);
          }
          uint64_t v33 = v4;
          id v5 = *(void **)(*((void *)&v40 + 1) + 8 * v4);
          context = objc_autoreleasePoolPush();
          unsigned int v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
          id v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
          __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
          id v31 = v5;
          id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController accountsOnService:](self, "accountsOnService:", v5));
          __int128 v36 = 0u;
          __int128 v37 = 0u;
          __int128 v38 = 0u;
          __int128 v39 = 0u;
          id v7 = v6;
          id v8 = [v7 countByEnumeratingWithState:&v36 objects:v45 count:16];
          if (v8)
          {
            id v9 = v8;
            uint64_t v10 = *(void *)v37;
            do
            {
              for (i = 0LL; i != v9; i = (char *)i + 1)
              {
                if (*(void *)v37 != v10) {
                  objc_enumerationMutation(v7);
                }
                int v12 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)i);
                id v13 = objc_autoreleasePoolPush();
                uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 accountInfo]);
                if (v14)
                {
                  id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 uniqueID]);

                  if (v15)
                  {
                    id v16 = (void *)objc_claimAutoreleasedReturnValue([v12 uniqueID]);
                    [v34 setObject:v14 forKeyedSubscript:v16];
                  }
                }

                id v17 = (void *)objc_claimAutoreleasedReturnValue([v12 uniqueID]);
                unsigned int v18 = -[IDSDAccountController isEnabledAccount:](self, "isEnabledAccount:", v17);

                if (v18)
                {
                  id v19 = (void *)objc_claimAutoreleasedReturnValue([v12 uniqueID]);
                  [v35 addObject:v19];
                }

                objc_autoreleasePoolPop(v13);
              }

              id v9 = [v7 countByEnumeratingWithState:&v36 objects:v45 count:16];
            }

            while (v9);
          }

          [v30 setObject:v34 forKeyedSubscript:v26];
          [v30 setObject:v35 forKeyedSubscript:v25];
          id v20 = [v34 count];
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v31 preferencesDomain]);
          if (v20) {
            uint64_t v22 = v30;
          }
          else {
            uint64_t v22 = 0LL;
          }
          uint64_t v3 = v28;
          -[os_log_s setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v22, v21);

          objc_autoreleasePoolPop(context);
          uint64_t v4 = v33 + 1;
        }

        while ((id)(v33 + 1) != v29);
        id v29 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
      }

      while (v29);
    }

    objc_autoreleasePoolPop(v23);
    -[IDSDAccountController _persistAccounts:](self, "_persistAccounts:", v3);
  }
}

- (id)accountsOnService:(id)a3
{
  id v4 = a3;
  id v5 = objc_autoreleasePoolPush();
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v7 = self->_accountIDMap;
  id v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      unsigned __int8 v11 = 0LL;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        int v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_accountIDMap,  "objectForKey:",  *(void *)(*((void *)&v15 + 1) + 8LL * (void)v11),  (void)v15));
        id v13 = (id)objc_claimAutoreleasedReturnValue([v12 service]);

        if (v13 == v4) {
          -[NSMutableArray addObject:](v6, "addObject:", v12);
        }

        unsigned __int8 v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    }

    while (v9);
  }

  objc_autoreleasePoolPop(v5);
  return v6;
}

- (id)enabledAccountsOnService:(id)a3
{
  id v4 = a3;
  id v5 = objc_autoreleasePoolPush();
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v7 = self->_accountIDMap;
  id v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      unsigned __int8 v11 = 0LL;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        int v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_accountIDMap,  "objectForKey:",  *(void *)(*((void *)&v16 + 1) + 8LL * (void)v11),  (void)v16));
        id v13 = (id)objc_claimAutoreleasedReturnValue([v12 service]);
        if (v13 == v4)
        {
          unsigned int v14 = [v12 isEnabled];

          if (v14) {
            -[NSMutableArray addObject:](v6, "addObject:", v12);
          }
        }

        else
        {
        }

        unsigned __int8 v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    }

    while (v9);
  }

  objc_autoreleasePoolPop(v5);
  return v6;
}

- (id)registeredAccountsOnService:(id)a3
{
  id v4 = a3;
  id v5 = objc_autoreleasePoolPush();
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if ([v4 adHocServiceType] != 5)
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController accountsOnService:](self, "accountsOnService:", v4, 0LL));
    id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          int v12 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        }

        id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }

      while (v9);
    }
  }

  objc_autoreleasePoolPop(v5);

  return v6;
}

- (id)accountsOfAdHocType:(unsigned int)a3
{
  context = objc_autoreleasePoolPush();
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v6 = self->_accountIDMap;
  id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_accountIDMap,  "objectForKey:",  *(void *)(*((void *)&v17 + 1) + 8LL * (void)v10)));
        int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 service]);
        unsigned int v13 = [v12 adHocServiceType];

        if (v13 == a3)
        {
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueID]);
          -[NSMutableArray addObject:](v5, "addObject:", v14);
        }

        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
    }

    while (v8);
  }

  objc_autoreleasePoolPop(context);
  return v5;
}

- (BOOL)hasActiveSMSAccount
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController accounts](self, "accounts", 0LL));
  uint64_t v3 = (os_log_s *)[v2 countByEnumeratingWithState:&v8 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0LL; i != v3; i = (os_log_s *)((char *)i + 1))
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v8 + 1) + 8LL * (void)i);
        if (![v6 accountType]
          && [v6 isEnabled]
          && [v6 registrationStatus] == 5
          && ([v6 isAdHocAccount] & 1) == 0)
        {
          uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)int buf = 138412290;
            unsigned int v13 = v6;
            _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "  ** Found active SMS based account: %@",  buf,  0xCu);
          }

          LOBYTE(v3) = 1;
          goto LABEL_16;
        }
      }

      uint64_t v3 = (os_log_s *)[v2 countByEnumeratingWithState:&v8 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

- (void)issueDependentIDQueriesWithCompletionBlock:(id)a3
{
  id v27 = a3;
  im_assert_primary_base_queue(v27, v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController accounts](self, "accounts"));
  id v6 = [v5 _copyForEnumerating];

  group = dispatch_group_create();
  v45[0] = 0LL;
  v45[1] = v45;
  v45[2] = 0x2020000000LL;
  char v46 = 1;
  v43[0] = 0LL;
  v43[1] = v43;
  v43[2] = 0x2020000000LL;
  char v44 = 0;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id obj = v6;
  id v7 = [obj countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v40;
    uint64_t v28 = kIDSServiceDefaultsSentinelAlias;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v40 != v8) {
          objc_enumerationMutation(obj);
        }
        __int128 v10 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)i);
        __int128 v11 = objc_autoreleasePoolPush();
        if (([v10 isAdHocAccount] & 1) == 0
          && [v10 isEnabled]
          && [v10 isRegistered]
          && ([v10 shouldRegisterUsingDSHandle] & 1) == 0)
        {
          int v12 = (void *)objc_claimAutoreleasedReturnValue([v10 prefixedURIStringsFromRegistration]);
          unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 firstObject]);

          if ([v13 isEqualToIgnoringCase:v28])
          {

            unsigned int v13 = 0LL;
          }

          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v10 registration]);
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 registrationCert]);

          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v10 service]);
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 identifier]);

          if (v13 && v15 && v17)
          {
            dispatch_group_enter(group);
            __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[IDSURI URIWithPrefixedURI:withServiceLoggingHint:]( &OBJC_CLASS___IDSURI,  "URIWithPrefixedURI:withServiceLoggingHint:",  v13,  v17));
            __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPeerIDManager sharedInstance](&OBJC_CLASS___IDSPeerIDManager, "sharedInstance"));
            id v47 = v18;
            __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v47,  1LL));
            v35[0] = _NSConcreteStackBlock;
            v35[1] = 3221225472LL;
            v35[2] = sub_100148988;
            v35[3] = &unk_1008FB940;
            __int128 v37 = v45;
            __int128 v38 = v43;
            __int128 v36 = group;
            LOBYTE(v26) = 0;
            [v19 startQueryForURIs:v20 fromIdentity:v15 fromURI:v18 fromService:v17 forSending:0 forRefresh:0 isForced:v26 reason:@"GDRQuery" completionBlock:v35];
          }
        }

        objc_autoreleasePoolPop(v11);
      }

      id v7 = [obj countByEnumeratingWithState:&v39 objects:v48 count:16];
    }

    while (v7);
  }

  uint64_t v23 = im_primary_queue(v21, v22);
  id v24 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v23);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001489C0;
  block[3] = &unk_1008FB968;
  id v32 = v27;
  uint64_t v33 = v45;
  unsigned int v34 = v43;
  id v25 = v27;
  dispatch_group_notify(group, v24, block);

  _Block_object_dispose(v43, 8);
  _Block_object_dispose(v45, 8);
}

- (void)issueGetDependentRequest
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController accounts](self, "accounts"));
  id v3 = [v2 _copyForEnumerating];

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        __int128 v9 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        if ((objc_msgSend(v9, "isAdHocAccount", (void)v14) & 1) == 0)
        {
          __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 registration]);
          __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 dependentRegistrationResponseCode]);
          id v12 = [v11 integerValue];

          if ([v9 isEnabled])
          {
            else {
              BOOL v13 = 0;
            }
            if (v13) {
              [v9 _issueDependentCheck];
            }
          }
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v6);
  }
}

- (void)_resumeGDRReAuthenticateIfNecessary
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController accounts](self, "accounts"));
  id v3 = [v2 _copyForEnumerating];

  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        __int128 v9 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)i);
      }

      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v6);
  }
}

- (void)updateExpiredDependent
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController accounts](self, "accounts"));
  id v3 = [v2 _copyForEnumerating];

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        __int128 v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ((objc_msgSend(v9, "isAdHocAccount", (void)v13) & 1) == 0
          && [v9 isEnabled]
          && [v9 isRegistered])
        {
          __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 registration]);
          __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 dependentRegistrationsTTL]);

          if (v11)
          {
            [v11 timeIntervalSinceNow];
            if (v12 < 1.0) {
              [v9 _issueDependentCheck];
            }
          }
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v6);
  }
}

- (void)issueGetDependentRequestForAccount:(id)a3
{
  id v3 = a3;
  if (([v3 isAdHocAccount] & 1) == 0
    && [v3 isEnabled]
    && [v3 isRegistered])
  {
    [v3 _issueDependentCheck];
  }
}

- (void)issueGetDependentAndGetHandlesRequest
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController accounts](self, "accounts"));
  id v3 = [v2 _copyForEnumerating];

  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        __int128 v9 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)i);
        if ((objc_msgSend(v9, "isAdHocAccount", (void)v10) & 1) == 0
          && [v9 isEnabled]
          && [v9 isRegistered])
        {
          [v9 _issueDependentCheck];
          [v9 _updateHandles:1];
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v6);
  }
}

- (BOOL)hasiCloudAccount
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 iCloudService]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController appleIDAccountOnService:](self, "appleIDAccountOnService:", v4));
  LOBYTE(self) = v5 != 0LL;

  return (char)self;
}

- (BOOL)isiCloudSignedIn
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[IDSSystemAccountAdapter iCloudSystemAccountWithError:]( self->_systemAccountAdapter,  "iCloudSystemAccountWithError:",  0LL));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (BOOL)isiTunesSignedIn
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[IDSSystemAccountAdapter iTunesSystemAccountWithError:]( self->_systemAccountAdapter,  "iTunesSystemAccountWithError:",  0LL));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (void)_registerForAllRegistrationsSucceeded
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController registrationListener](self, "registrationListener"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001490D8;
  v5[3] = &unk_1008FB990;
  v5[4] = self;
  id v4 = [v3 addBlockForRegistrationCompletion:v5];
}

- (void)_kickRemoteCacheWipe
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController userDefaults](self, "userDefaults"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 appValueForKey:@"triggeredRemoteSessionVersion"]);

  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    uint64_t v7 = (uint64_t)[v4 integerValue];
    if (v7 >= 1)
    {
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)int buf = 134218498;
        uint64_t v37 = v7;
        __int16 v38 = 2048;
        uint64_t v39 = 1LL;
        __int16 v40 = 2112;
        uint64_t v41 = (uint64_t)&off_1009487D8;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Not triggering remote session update, already updated {appIntegerValue: %llu, latestVersion: %llu, interestingServices: %@}",  buf,  0x20u);
      }

      goto LABEL_28;
    }
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 0LL));
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"ids-upgrade-triggered-reg-update-msg"]);

  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSNumber, v10);
  if ((objc_opt_isKindOfClass(v8, v11) & 1) != 0 && (-[os_log_s BOOLValue](v8, "BOOLValue") & 1) == 0)
  {
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int buf = 138413058;
      uint64_t v37 = (uint64_t)v8;
      __int16 v38 = 2048;
      uint64_t v39 = v7;
      __int16 v40 = 2048;
      uint64_t v41 = 1LL;
      __int16 v42 = 2112;
      __int128 v43 = &off_1009487F0;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Not triggering remote session update, server bag disabled {bagDisabledValue: %@, appIntegerValue: %llu, latestVe rsion: %llu, interestingServices: %@}",  buf,  0x2Au);
    }
  }

  else
  {
    __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration", v8, v4));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int buf = 134218498;
      uint64_t v37 = v7;
      __int16 v38 = 2048;
      uint64_t v39 = 1LL;
      __int16 v40 = 2112;
      uint64_t v41 = (uint64_t)&off_100948808;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Triggering remote session update {appIntegerValue: %llu, latestVersion: %llu, interestingServices: %@}",  buf,  0x20u);
    }

    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    id v13 = [&off_100948820 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v31;
      do
      {
        __int128 v16 = 0LL;
        do
        {
          if (*(void *)v31 != v15) {
            objc_enumerationMutation(&off_100948820);
          }
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDServiceController serviceWithIdentifier:]( self->_serviceController,  "serviceWithIdentifier:",  *(void *)(*((void *)&v30 + 1) + 8LL * (void)v16)));
          if (v17)
          {
            __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController accountsOnService:](self, "accountsOnService:", v17));
            __int128 v26 = 0u;
            __int128 v27 = 0u;
            __int128 v28 = 0u;
            __int128 v29 = 0u;
            id v19 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
            if (v19)
            {
              id v20 = v19;
              uint64_t v21 = *(void *)v27;
              do
              {
                uint64_t v22 = 0LL;
                do
                {
                  if (*(void *)v27 != v21) {
                    objc_enumerationMutation(v18);
                  }
                  [*(id *)(*((void *)&v26 + 1) + 8 * (void)v22) _updateSessionsForAllRegisteredURIs];
                  uint64_t v22 = (char *)v22 + 1;
                }

                while (v20 != v22);
                id v20 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
              }

              while (v20);
            }
          }

          __int128 v16 = (char *)v16 + 1;
        }

        while (v16 != v14);
        id v14 = [&off_100948820 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }

      while (v14);
    }

    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController userDefaults](self, "userDefaults"));
    -[os_log_s setAppValue:forKey:](v23, "setAppValue:forKey:", &off_100947308, @"triggeredRemoteSessionVersion");
    uint64_t v8 = v24;
    id v4 = v25;
  }

LABEL_28:
}

- (id)cloudPairedIDForDeviceID:(id)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_deviceProperties, "objectForKey:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"nsuuid"]);

  return v4;
}

- (id)deviceIDForPushToken:(id)a3
{
  id v4 = a3;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  uint64_t v22 = self;
  id obj = self->_accountIDMap;
  id v23 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v30,  v37,  16LL);
  if (v23)
  {
    uint64_t v21 = *(void *)v31;
    do
    {
      for (i = 0LL; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v31 != v21) {
          objc_enumerationMutation(obj);
        }
        id v25 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( v22->_accountIDMap,  "objectForKey:",  *(void *)(*((void *)&v30 + 1) + 8LL * (void)i)));
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v25 dependentRegistrations]);
        id v7 = [v6 countByEnumeratingWithState:&v26 objects:v36 count:16];
        if (v7)
        {
          uint64_t v8 = *(void *)v27;
          while (2)
          {
            for (j = 0LL; j != v7; j = (char *)j + 1)
            {
              if (*(void *)v27 != v8) {
                objc_enumerationMutation(v6);
              }
              uint64_t v10 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)j);
              uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 _dataForKey:@"push-token"]);
              unsigned int v12 = [v11 isEqualToData:v4];

              if (v12)
              {
                uint64_t v14 = OSLogHandleForIDSCategory("IDSDAccountController");
                uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
                if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
                {
                  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v10 _dictionaryForKey:@"private-device-data"]);
                  *(_DWORD *)int buf = 138412290;
                  id v35 = v16;
                  _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "       found push token in: %@",  buf,  0xCu);
                }

                if (os_log_shim_legacy_logging_enabled(v17)
                  && _IDSShouldLog(0LL, @"IDSDAccountController"))
                {
                  id v20 = (void *)objc_claimAutoreleasedReturnValue([v10 _dictionaryForKey:@"private-device-data"]);
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccountController",  @"       found push token in: %@");
                }

                __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_dictionaryForKey:", @"private-device-data", v20));
                id v13 = (void *)objc_claimAutoreleasedReturnValue([v18 _stringForKey:IDSPrivateDeviceDataUniqueID]);

                goto LABEL_24;
              }
            }

            id v7 = [v6 countByEnumeratingWithState:&v26 objects:v36 count:16];
            if (v7) {
              continue;
            }
            break;
          }
        }
      }

      id v23 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v30,  v37,  16LL);
      id v13 = 0LL;
    }

    while (v23);
  }

  else
  {
    id v13 = 0LL;
  }

- (id)pushTokenForDeviceID:(id)a3
{
  id v4 = a3;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  uint64_t v5 = self->_accountIDMap;
  id v23 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v31,  v36,  16LL);
  if (v23)
  {
    uint64_t v6 = *(void *)v32;
    uint64_t v7 = IDSPrivateDeviceDataUniqueID;
    id v25 = v5;
    uint64_t v21 = *(void *)v32;
    uint64_t v22 = self;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v32 != v6) {
          objc_enumerationMutation(v5);
        }
        uint64_t v24 = v8;
        __int128 v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_accountIDMap,  "objectForKey:",  *(void *)(*((void *)&v31 + 1) + 8 * v8),  v21,  v22));
        __int128 v27 = 0u;
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        __int128 v30 = 0u;
        __int128 v26 = v9;
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 dependentRegistrations]);
        id v11 = [v10 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v28;
          while (2)
          {
            for (i = 0LL; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v28 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
              __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 _dictionaryForKey:@"private-device-data"]);
              uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 _stringForKey:v7]);
              unsigned __int8 v18 = [v17 isEqualToIgnoringCase:v4];

              if ((v18 & 1) != 0)
              {
                id v19 = (void *)objc_claimAutoreleasedReturnValue([v15 _dataForKey:@"push-token"]);

                uint64_t v5 = v25;
                goto LABEL_19;
              }
            }

            id v12 = [v10 countByEnumeratingWithState:&v27 objects:v35 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }

        uint64_t v8 = v24 + 1;
        uint64_t v5 = v25;
        uint64_t v6 = v21;
        self = v22;
      }

      while ((id)(v24 + 1) != v23);
      id v19 = 0LL;
      id v23 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v31,  v36,  16LL);
    }

    while (v23);
  }

  else
  {
    id v19 = 0LL;
  }

- (id)deviceNameForDeviceID:(id)a3
{
  id v4 = a3;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  uint64_t v5 = self->_accountIDMap;
  id v23 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v31,  v36,  16LL);
  if (v23)
  {
    uint64_t v6 = *(void *)v32;
    uint64_t v7 = IDSPrivateDeviceDataUniqueID;
    id v25 = v5;
    uint64_t v21 = *(void *)v32;
    uint64_t v22 = self;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v32 != v6) {
          objc_enumerationMutation(v5);
        }
        uint64_t v24 = v8;
        __int128 v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_accountIDMap,  "objectForKey:",  *(void *)(*((void *)&v31 + 1) + 8 * v8),  v21,  v22));
        __int128 v27 = 0u;
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        __int128 v30 = 0u;
        __int128 v26 = v9;
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 dependentRegistrations]);
        id v11 = [v10 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v28;
          while (2)
          {
            for (i = 0LL; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v28 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
              __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 _dictionaryForKey:@"private-device-data"]);
              uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 _stringForKey:v7]);
              unsigned __int8 v18 = [v17 isEqualToIgnoringCase:v4];

              if ((v18 & 1) != 0)
              {
                id v19 = (void *)objc_claimAutoreleasedReturnValue([v15 _stringForKey:IDSDevicePropertyName]);

                uint64_t v5 = v25;
                goto LABEL_19;
              }
            }

            id v12 = [v10 countByEnumeratingWithState:&v27 objects:v35 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }

        uint64_t v8 = v24 + 1;
        uint64_t v5 = v25;
        uint64_t v6 = v21;
        self = v22;
      }

      while ((id)(v24 + 1) != v23);
      id v19 = 0LL;
      id v23 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v31,  v36,  16LL);
    }

    while (v23);
  }

  else
  {
    id v19 = 0LL;
  }

- (id)publicKeyForDeviceID:(id)a3
{
  id v29 = a3;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id v4 = self->_accountIDMap;
  id v25 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v34,  v41,  16LL);
  if (v25)
  {
    uint64_t v5 = *(void *)v35;
    uint64_t v6 = IDSDevicePropertyPrivateDeviceData;
    uint64_t v7 = IDSPrivateDeviceDataUniqueID;
    __int128 v27 = v4;
    uint64_t v23 = *(void *)v35;
    uint64_t v24 = self;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v35 != v5) {
          objc_enumerationMutation(v4);
        }
        uint64_t v26 = v8;
        __int128 v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_accountIDMap,  "objectForKey:",  *(void *)(*((void *)&v34 + 1) + 8 * v8)));
        __int128 v30 = 0u;
        __int128 v31 = 0u;
        __int128 v32 = 0u;
        __int128 v33 = 0u;
        __int128 v28 = v9;
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 dependentRegistrations]);
        id v11 = [v10 countByEnumeratingWithState:&v30 objects:v40 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v31;
          while (2)
          {
            for (i = 0LL; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v31 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
              __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 _dictionaryForKey:v6]);
              uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 _stringForKey:v7]);
              unsigned __int8 v18 = [v17 isEqualToIgnoringCase:v29];

              if ((v18 & 1) != 0)
              {
                uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v15 _dictionaryForKey:IDSDevicePropertyClientData]);
                id v20 = (void *)objc_claimAutoreleasedReturnValue([v21 _dataForKey:_IDSIdentityClientDataMessageProtectionIdentityKey]);

                id v19 = (os_log_s *)v27;
                goto LABEL_20;
              }
            }

            id v12 = [v10 countByEnumeratingWithState:&v30 objects:v40 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }

        uint64_t v8 = v26 + 1;
        id v4 = v27;
        uint64_t v5 = v23;
        self = v24;
      }

      while ((id)(v26 + 1) != v25);
      id v25 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v27,  "countByEnumeratingWithState:objects:count:",  &v34,  v41,  16LL);
    }

    while (v25);
  }

  id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int buf = 138412290;
    id v39 = v29;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "No public key found {deviceID: %@}", buf, 0xCu);
  }

  id v20 = 0LL;
LABEL_20:

  return v20;
}

- (void)deliveryController:(id)a3 uniqueID:(id)a4 isConnected:(BOOL)a5
{
  BOOL v5 = a5;
  id v6 = a4;
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = @"NO";
    if (v5) {
      uint64_t v8 = @"YES";
    }
    int v12 = 138412546;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Received connected change to %@ for device with uniqueID %@",  (uint8_t *)&v12,  0x16u);
  }

  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDevicePropertiesStateNotifier sharedInstance]( &OBJC_CLASS___IDSDevicePropertiesStateNotifier,  "sharedInstance"));
  uint64_t v10 = v9;
  if (v5) {
    uint64_t v11 = kIDSDeviceStatePropertiesIsConnected;
  }
  else {
    uint64_t v11 = 0LL;
  }
  [v9 setState:v11 forProperty:kIDSDeviceStatePropertiesIsConnected deviceUniqueID:v6];
}

- (void)deliveryController:(id)a3 uniqueID:(id)a4 isNearby:(BOOL)a5
{
  BOOL v5 = a5;
  id v6 = a4;
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = @"NO";
    if (v5) {
      uint64_t v8 = @"YES";
    }
    int v12 = 138412546;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Received nearby change to %@ for device with uniqueID %@",  (uint8_t *)&v12,  0x16u);
  }

  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDevicePropertiesStateNotifier sharedInstance]( &OBJC_CLASS___IDSDevicePropertiesStateNotifier,  "sharedInstance"));
  uint64_t v10 = v9;
  if (v5) {
    uint64_t v11 = kIDSDeviceStatePropertiesIsNearby;
  }
  else {
    uint64_t v11 = 0LL;
  }
  [v9 setState:v11 forProperty:kIDSDeviceStatePropertiesIsNearby deviceUniqueID:v6];
}

- (void)deliveryController:(id)a3 uniqueID:(id)a4 isCloudConnected:(BOOL)a5
{
  BOOL v5 = a5;
  id v6 = a4;
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = @"NO";
    if (v5) {
      uint64_t v8 = @"YES";
    }
    int v12 = 138412546;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Received cloud connected change to %@ for device with uniqueID %@",  (uint8_t *)&v12,  0x16u);
  }

  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDevicePropertiesStateNotifier sharedInstance]( &OBJC_CLASS___IDSDevicePropertiesStateNotifier,  "sharedInstance"));
  uint64_t v10 = v9;
  if (v5) {
    uint64_t v11 = kIDSDeviceStatePropertiesIsCloudConnected;
  }
  else {
    uint64_t v11 = 0LL;
  }
  [v9 setState:v11 forProperty:kIDSDeviceStatePropertiesIsCloudConnected deviceUniqueID:v6];
}

- (void)setNSUUID:(id)a3 onDeviceWithUniqueID:(id)a4
{
  id v6 = (NSMutableDictionary *)a3;
  id v7 = a4;
  if ([v7 length])
  {
    deviceProperties = self->_deviceProperties;
    if (!deviceProperties)
    {
      CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      uint64_t v10 = self->_deviceProperties;
      self->_deviceProperties = Mutable;

      deviceProperties = self->_deviceProperties;
    }

    uint64_t v11 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](deviceProperties, "objectForKey:", v7));
    int v12 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  v11);
    uint64_t v13 = v12;
    if (v6) {
      CFDictionarySetValue((CFMutableDictionaryRef)v12, IDSDevicePropertyNSUUID, v6);
    }
    else {
      -[NSMutableDictionary removeObjectForKey:](v12, "removeObjectForKey:", IDSDevicePropertyNSUUID);
    }
    -[NSMutableDictionary setObject:forKey:](self->_deviceProperties, "setObject:forKey:", v13, v7);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v16 = self->_deviceProperties;
      *(_DWORD *)int buf = 138412290;
      __int16 v38 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "New properties after set %@", buf, 0xCu);
    }

    id v29 = v13;
    __int128 v31 = (os_log_s *)v11;

    -[IDSDAccountController saveDevicePropertiesWithOldKeys:](self, "saveDevicePropertiesWithOldKeys:", 0LL);
    if (v6)
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[IDSUTunDeliveryController sharedInstance]( &OBJC_CLASS___IDSUTunDeliveryController,  "sharedInstance",  v13));
      [v17 deviceWithUniqueID:v7 updatedUUID:v6];
    }

    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance", v29));
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 allServices]);

    id v20 = [v19 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v33;
      do
      {
        for (i = 0LL; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v33 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
          id v25 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v24 pushTopic]);
          __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v25 broadcasterForTopic:v26 messageContext:0]);

          [v27 device:v7 nsuuidChanged:v6];
        }

        id v21 = [v19 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }

      while (v21);
    }

    __int128 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int buf = 138412290;
      __int16 v38 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Finished broadcasting nsuuid %@ to all services",  buf,  0xCu);
    }

    __int16 v14 = v31;
  }

  else
  {
    __int16 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      sub_10069D990();
    }
  }
}

- (id)propertiesForDeviceWithUniqueID:(id)a3
{
  id v4 = a3;
  if ([v4 length]) {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_deviceProperties, "objectForKey:", v4));
  }
  else {
    BOOL v5 = 0LL;
  }

  return v5;
}

- (void)_updateDeviceProperties
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v3 serviceWithIdentifier:@"com.apple.private.alloy.icloudpairing"]);

  id v4 = (void *)v8;
  if (v8)
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController accountsOnService:](self, "accountsOnService:"));
    if (![v5 count])
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_deviceProperties, "allKeys"));
      deviceProperties = self->_deviceProperties;
      self->_deviceProperties = 0LL;

      -[IDSDAccountController saveDevicePropertiesWithOldKeys:](self, "saveDevicePropertiesWithOldKeys:", v6);
    }

    id v4 = (void *)v8;
  }
}

- (void)updateDevicePropertiesWithDevices:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v33 objects:v40 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v34;
    uint64_t v10 = IDSDevicePropertyPrivateDeviceData;
    uint64_t v11 = IDSPrivateDeviceDataUniqueID;
    do
    {
      int v12 = 0LL;
      do
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v33 + 1) + 8 * (void)v12) objectForKey:v10]);
        __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 _stringForKey:v11]);
        if (v14) {
          -[NSMutableSet addObject:](v5, "addObject:", v14);
        }

        int v12 = (char *)v12 + 1;
      }

      while (v8 != v12);
      id v8 = [v6 countByEnumeratingWithState:&v33 objects:v40 count:16];
    }

    while (v8);
  }

  id v15 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  self->_deviceProperties);
  __int128 v16 = objc_alloc(&OBJC_CLASS___NSMutableSet);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_deviceProperties, "allKeys"));
  unsigned __int8 v18 = -[NSMutableSet initWithArray:](v16, "initWithArray:", v17);

  id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int buf = 138412290;
    id v39 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Device Properties - Current UniqueIDs: %@",  buf,  0xCu);
  }

  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int buf = 138412290;
    id v39 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Device Properties - New Unique IDs: %@",  buf,  0xCu);
  }

  -[NSMutableSet minusSet:](v18, "minusSet:", v5);
  id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int buf = 138412290;
    id v39 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Device Properties - Old Unique IDs: %@",  buf,  0xCu);
  }

  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  uint64_t v22 = v18;
  id v23 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v29,  v37,  16LL);
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v30;
    do
    {
      uint64_t v26 = 0LL;
      do
      {
        if (*(void *)v30 != v25) {
          objc_enumerationMutation(v22);
        }
        -[NSMutableDictionary removeObjectForKey:]( v15,  "removeObjectForKey:",  *(void *)(*((void *)&v29 + 1) + 8LL * (void)v26),  (void)v29);
        uint64_t v26 = (char *)v26 + 1;
      }

      while (v24 != v26);
      id v24 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v29,  v37,  16LL);
    }

    while (v24);
  }

  deviceProperties = self->_deviceProperties;
  self->_deviceProperties = v15;

  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v22, "allObjects"));
  -[IDSDAccountController saveDevicePropertiesWithOldKeys:](self, "saveDevicePropertiesWithOldKeys:", v28);
}

- (void)saveDevicePropertiesWithOldKeys:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController userDefaults](self, "userDefaults"));
    [v5 setMultiple:0 remove:v4 appID:@"com.apple.ids.deviceproperties"];
  }

  if (-[NSMutableDictionary count](self->_deviceProperties, "count"))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController userDefaults](self, "userDefaults"));
    [v6 setMultiple:self->_deviceProperties remove:0 appID:@"com.apple.ids.deviceproperties"];
  }

  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    deviceProperties = self->_deviceProperties;
    *(_DWORD *)int buf = 138412546;
    __int128 v36 = deviceProperties;
    __int16 v37 = 2112;
    __int16 v38 = @"com.apple.ids.deviceproperties";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Saving device properties settings: %@   (domain: %@)",  buf,  0x16u);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController userDefaults](self, "userDefaults"));
  [v9 synchronizeAppID:@"com.apple.ids.deviceproperties"];

  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id obj = v4;
  id v24 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v30;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v30 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v29 + 1) + 8LL * (void)v10);
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        __int128 v28 = 0u;
        int v12 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 allServices]);

        id v14 = [v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = *(void *)v26;
          do
          {
            uint64_t v17 = 0LL;
            do
            {
              if (*(void *)v26 != v16) {
                objc_enumerationMutation(v13);
              }
              unsigned __int8 v18 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)v17);
              id v19 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
              id v20 = (void *)objc_claimAutoreleasedReturnValue([v18 pushTopic]);
              id v21 = (void *)objc_claimAutoreleasedReturnValue([v19 broadcasterForTopic:v20 messageContext:0]);

              [v21 device:v11 nsuuidChanged:0];
              uint64_t v17 = (char *)v17 + 1;
            }

            while (v15 != v17);
            id v15 = [v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }

          while (v15);
        }

        uint64_t v10 = (char *)v10 + 1;
      }

      while (v10 != v24);
      id v24 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }

    while (v24);
  }
}

- (void)loadDeviceProperties
{
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Loading device properties", buf, 2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController userDefaults](self, "userDefaults"));
  BOOL v5 = (os_log_s *)[v4 copyKeyListForAppID:@"com.apple.ids.deviceproperties"];

  deviceProperties = self->_deviceProperties;
  self->_deviceProperties = 0LL;

  id v7 = &off_100717000;
  if (v5)
  {
    id v8 = self;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController userDefaults](self, "userDefaults"));
    id v10 = [v9 copyMultipleForCurrentKeys:v5 appID:@"com.apple.ids.deviceproperties"];

    if (v10)
    {
      id v50 = v5;
      uint64_t v49 = v10;
      uint64_t v11 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  v10);
      int v12 = v8->_deviceProperties;
      v8->_deviceProperties = v11;

      context = objc_autoreleasePoolPush();
      __int128 v57 = 0u;
      __int128 v58 = 0u;
      __int128 v59 = 0u;
      __int128 v60 = 0u;
      uint64_t v13 = v8->_deviceProperties;
      id v14 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v57,  v63,  16LL);
      self = v8;
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = 0LL;
        uint64_t v17 = *(void *)v58;
        uint64_t v51 = IDSDevicePropertyNSUUID;
        unsigned __int8 v18 = &IMInsertBoolsToXPCDictionary_ptr;
        do
        {
          for (i = 0LL; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v58 != v17) {
              objc_enumerationMutation(v13);
            }
            uint64_t v20 = *(void *)(*((void *)&v57 + 1) + 8LL * (void)i);
            id v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_deviceProperties, "objectForKey:", v20, context));
            uint64_t v23 = objc_opt_class(v18[479], v22);
            if ((objc_opt_isKindOfClass(v21, v23) & 1) == 0) {
              goto LABEL_13;
            }
            uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSString, v24);
            if ((objc_opt_isKindOfClass(v20, v25) & 1) == 0) {
              goto LABEL_13;
            }
            __int128 v52 = v16;
            id v26 = v15;
            uint64_t v27 = v17;
            __int128 v28 = v18;
            __int128 v29 = v13;
            __int128 v30 = self;
            __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKey:v51]);
            uint64_t v33 = objc_opt_class(&OBJC_CLASS___NSString, v32);
            char isKindOfClass = objc_opt_isKindOfClass(v31, v33);

            self = v30;
            uint64_t v13 = v29;
            unsigned __int8 v18 = v28;
            uint64_t v17 = v27;
            id v15 = v26;
            uint64_t v16 = v52;
            if ((isKindOfClass & 1) == 0)
            {
LABEL_13:
              if (!v16) {
                uint64_t v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
              }
              -[NSMutableArray addObject:](v16, "addObject:", v20);
            }
          }

          id v15 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v57,  v63,  16LL);
        }

        while (v15);
      }

      else
      {
        uint64_t v16 = 0LL;
      }

      id v7 = &off_100717000;
      if (-[NSMutableArray count](v16, "count"))
      {
        __int128 v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)int buf = 138412290;
          BOOL v62 = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  " => Loaded device properties -- found bad keys! {keysToDelete: %@}",  buf,  0xCu);
        }

        id v36 = -[NSMutableDictionary removeObjectsForKeys:](self->_deviceProperties, "removeObjectsForKeys:", v16);
        uint64_t v38 = im_primary_queue(v36, v37);
        id v39 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v38);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10014B4AC;
        block[3] = &unk_1008F5F80;
        void block[4] = self;
        uint64_t v56 = v16;
        dispatch_async(v39, block);
      }

      objc_autoreleasePoolPop(context);
      __int16 v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v41 = self->_deviceProperties;
        *(_DWORD *)int buf = 138412290;
        BOOL v62 = v41;
        _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  " => Loaded device properties %@",  buf,  0xCu);
      }

      BOOL v5 = 0LL;
    }

    else
    {
      self = v8;
    }
  }

  else
  {
    BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, " => No device properties loaded", buf, 2u);
    }
  }

  if (!self->_deviceProperties)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    __int128 v43 = self->_deviceProperties;
    self->_deviceProperties = Mutable;
  }

  char v44 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v45 = self->_deviceProperties;
  v53[0] = _NSConcreteStackBlock;
  v53[1] = *((void *)v7 + 49);
  v53[2] = sub_10014B4B8;
  v53[3] = &unk_1008FB9B8;
  char v46 = v44;
  id v54 = v46;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v45, "enumerateKeysAndObjectsUsingBlock:", v53);
  if (-[NSMutableDictionary count](v46, "count"))
  {
    id v47 = (void *)objc_claimAutoreleasedReturnValue( +[IDSUTunDeliveryController sharedInstance]( &OBJC_CLASS___IDSUTunDeliveryController,  "sharedInstance"));
    [v47 setDeviceUniqueIDToCBUUID:v46];
  }
}

- (BOOL)isiCloudHSA2
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDServiceController iCloudService](self->_serviceController, "iCloudService"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController appleIDAccountOnService:](self, "appleIDAccountOnService:", v3));

  if (v4 && [v4 accountType] == 1)
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dsID]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 loginID]);
    id v7 = (void *)IMWeakLinkClass(@"AKAccountManager", @"AuthKit");
    if ([v7 isAccountsFrameworkAvailable])
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 sharedInstance]);
      if (v8)
      {
        id v9 = sub_10012F10C(v5);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 authKitAccountWithDSID:v10]);
        if (v11) {
          goto LABEL_11;
        }
        id v16 = 0LL;
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 authKitAccountWithAppleID:v6 error:&v16]);
        id v12 = v16;
        if (v12)
        {
          uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)int buf = 138412290;
            id v18 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Error fetching authkit account with AppleID. { error: %@ }",  buf,  0xCu);
          }
        }

        if (v11)
        {
LABEL_11:
          id v14 = [v8 securityLevelForAccount:v11];
        }

        else
        {
          id v14 = 0LL;
        }
      }

      else
      {
        id v14 = 0LL;
      }
    }

    else
    {
      id v14 = 0LL;
    }
  }

  else
  {
    id v14 = 0LL;
  }

  return v14 == (id)4;
}

- (void)authKitAccountUpdate:(id)a3
{
  id v4 = a3;
  BOOL v5 = (char *)[v4 registrationStatus];
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 serviceType]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 profileID]);

  BOOL v8 = (unint64_t)(v5 - 1) < 0xFFFFFFFFFFFFFFFELL;
  if (v7)
  {
    id v9 = sub_10012F10C(v7);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if (v10)
    {
      else {
        uint64_t v11 = 0LL;
      }
      if (v11)
      {
        authkitQueue = (dispatch_queue_s *)self->_authkitQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10014B84C;
        block[3] = &unk_1008FB9E0;
        id v14 = v10;
        uint64_t v15 = v11;
        BOOL v16 = v8;
        dispatch_async(authkitQueue, block);
      }
    }
  }
}

- (id)deviceCertificateForService:(id)a3 uri:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDAccountController accountWithServiceName:aliasURI:]( self,  "accountWithServiceName:aliasURI:",  v6,  v7));
  id v9 = v8;
  if (!v8)
  {
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v7;
      uint64_t v13 = "Couldn't find account (service %@)  (uri: %@)";
      goto LABEL_7;
    }

- (BOOL)hasHardDeregistered
{
  return self->_hasHardDeregistered;
}

- (void)setHasHardDeregistered:(BOOL)a3
{
  self->_hasHardDeregistered = a3;
}

- (IDSDAccountControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (CUTDeferredTaskQueue)storeAccountTask
{
  return self->_storeAccountTask;
}

- (void).cxx_destruct
{
}

@end