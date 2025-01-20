@interface IDSUserAccountSynchronizer
- (BOOL)_allowHomeNumberForUser:(id)a3 simCarrierIdentifiers:(id)a4 userCarrierIdentifiers:(id)a5;
- (BOOL)midSynchronize;
- (CUTPromise)migrationPromise;
- (IDSCTAdapter)ctAdapter;
- (IDSDAccountController)accountController;
- (IDSDServiceController)serviceController;
- (IDSDataMigrationTracker)migrationTracker;
- (IDSRestrictions)restrictions;
- (IDSUserAccountSynchronizer)initWithUserStore:(id)a3 accountController:(id)a4 serviceController:(id)a5 migrationTracker:(id)a6 restrictions:(id)a7 queue:(id)a8;
- (IDSUserAccountSynchronizer)initWithUserStore:(id)a3 accountController:(id)a4 serviceController:(id)a5 migrationTracker:(id)a6 userDefaults:(id)a7 restrictions:(id)a8 ctAdapter:(id)a9 queue:(id)a10 accountBuilder:(id)a11;
- (IDSUserStore)userStore;
- (IMUserDefaults)userDefaults;
- (NSMutableDictionary)cachedDisabledByService;
- (OS_dispatch_queue)queue;
- (id)_accountsForUser:(id)a3;
- (id)accountBuilder;
- (void)_restrictionsChangedNotification:(id)a3;
- (void)dealloc;
- (void)setAccountBuilder:(id)a3;
- (void)setAccountController:(id)a3;
- (void)setCachedDisabledByService:(id)a3;
- (void)setCtAdapter:(id)a3;
- (void)setMidSynchronize:(BOOL)a3;
- (void)setMigrationPromise:(id)a3;
- (void)setMigrationTracker:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRestrictions:(id)a3;
- (void)setServiceController:(id)a3;
- (void)setUserDefaults:(id)a3;
- (void)setUserStore:(id)a3;
- (void)synchronize;
- (void)userStore:(id)a3 didRemoveAuthenticationCertificateForUser:(id)a4;
- (void)userStore:(id)a3 didUpdateUser:(id)a4;
@end

@implementation IDSUserAccountSynchronizer

- (IDSUserAccountSynchronizer)initWithUserStore:(id)a3 accountController:(id)a4 serviceController:(id)a5 migrationTracker:(id)a6 restrictions:(id)a7 queue:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[IMUserDefaults sharedDefaults](&OBJC_CLASS___IMUserDefaults, "sharedDefaults"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCTAdapter sharedInstance](&OBJC_CLASS___IDSCTAdapter, "sharedInstance"));
  v22 = -[IDSUserAccountSynchronizer initWithUserStore:accountController:serviceController:migrationTracker:userDefaults:restrictions:ctAdapter:queue:accountBuilder:]( self,  "initWithUserStore:accountController:serviceController:migrationTracker:userDefaults:restrictions:ctAdapter:que ue:accountBuilder:",  v19,  v18,  v17,  v16,  v20,  v15,  v21,  v14,  &stru_100902B00);

  return v22;
}

- (IDSUserAccountSynchronizer)initWithUserStore:(id)a3 accountController:(id)a4 serviceController:(id)a5 migrationTracker:(id)a6 userDefaults:(id)a7 restrictions:(id)a8 ctAdapter:(id)a9 queue:(id)a10 accountBuilder:(id)a11
{
  id v32 = a3;
  id v31 = a4;
  id v30 = a5;
  id v29 = a6;
  id v28 = a7;
  id v27 = a8;
  id v26 = a9;
  id v25 = a10;
  id v18 = a11;
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___IDSUserAccountSynchronizer;
  id v19 = -[IDSUserAccountSynchronizer init](&v33, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_accountController, a4);
    objc_storeStrong((id *)&v20->_serviceController, a5);
    id v21 = objc_retainBlock(v18);
    id accountBuilder = v20->_accountBuilder;
    v20->_id accountBuilder = v21;

    objc_storeStrong((id *)&v20->_restrictions, a8);
    objc_storeStrong((id *)&v20->_migrationTracker, a6);
    objc_storeStrong((id *)&v20->_userDefaults, a7);
    objc_storeStrong((id *)&v20->_queue, a10);
    objc_storeStrong((id *)&v20->_userStore, a3);
    objc_storeStrong((id *)&v20->_ctAdapter, a9);
    -[IDSUserStore addActionListener:]( v20->_userStore,  "addActionListener:",  v20,  v25,  v26,  v27,  v28,  v29,  v30,  v31,  v32);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v23 addObserver:v20 selector:"_restrictionsChangedNotification:" name:@"__kIDSRestrictionsChangedNotification" object:0];
  }

  return v20;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___IDSUserAccountSynchronizer;
  -[IDSUserAccountSynchronizer dealloc](&v3, "dealloc");
}

- (void)userStore:(id)a3 didRemoveAuthenticationCertificateForUser:(id)a4
{
  id v5 = a4;
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Did remove auth cert -- reidentifying {user: %@}",  buf,  0xCu);
  }

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUserAccountSynchronizer _accountsForUser:](self, "_accountsForUser:", v5, 0LL));
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) _reregisterAndReidentify:1];
        v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v9);
  }
}

- (void)userStore:(id)a3 didUpdateUser:(id)a4
{
  id v5 = a4;
  if ([v5 realm] == (id)2)
  {
    id v6 = v5;
    if ([v6 hasBeenProvisioned])
    {
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUserAccountSynchronizer _accountsForUser:](self, "_accountsForUser:", v6));
      id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v17;
        do
        {
          v11 = 0LL;
          do
          {
            if (*(void *)v17 != v10) {
              objc_enumerationMutation(v7);
            }
            __int128 v12 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)v11);
            __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v6 expirationDate]);
            [v12 setExpirationDate:v13];

            v11 = (char *)v11 + 1;
          }

          while (v9 != v11);
          id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }

        while (v9);
      }
    }

    if (-[IDSUserAccountSynchronizer midSynchronize](self, "midSynchronize"))
    {
      __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Mid synchronize -- ignoring", v15, 2u);
      }
    }

    else
    {
      -[IDSUserAccountSynchronizer synchronize](self, "synchronize");
    }
  }
}

- (void)_restrictionsChangedNotification:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10039E2DC;
  block[3] = &unk_1008F6010;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)_accountsForUser:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueIdentifier]);
  if ([v4 realm] && objc_msgSend(v4, "realm") != (id)2)
  {
    if ([v4 realm] != (id)3)
    {
      id v9 = &__NSArray0__struct;
      goto LABEL_5;
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController accountsWithType:](self->_accountController, "accountsWithType:", 3LL));
    v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472LL;
    __int128 v13 = sub_10039E490;
    __int128 v14 = &unk_1008FB8F8;
    v7 = &v15;
    id v15 = v5;
    id v8 = &v11;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController accountsWithType:](self->_accountController, "accountsWithType:", 0LL));
    __int128 v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472LL;
    __int128 v18 = sub_10039E438;
    __int128 v19 = &unk_1008FB8F8;
    v7 = &v20;
    id v20 = v5;
    id v8 = &v16;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v6,  "__imArrayByFilteringWithBlock:",  v8,  v11,  v12,  v13,  v14,  v15,  v16,  v17,  v18,  v19,  v20));

LABEL_5:
  return v9;
}

- (NSMutableDictionary)cachedDisabledByService
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUserAccountSynchronizer userDefaults](self, "userDefaults"));
  id v4 = [v3 copyKeyListForAppID:@"com.apple.identityservices.serviceDisablement"];

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUserAccountSynchronizer userDefaults](self, "userDefaults"));
    id v6 = [v5 copyMultipleForCurrentKeys:v4 appID:@"com.apple.identityservices.serviceDisablement"];

    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary, v7);
    if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0) {
      id v9 = v6;
    }
    else {
      id v9 = 0LL;
    }
    id v10 = v9;
  }

  else
  {
    id v10 = 0LL;
  }

  return (NSMutableDictionary *)v10;
}

- (void)setCachedDisabledByService:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUserAccountSynchronizer userDefaults](self, "userDefaults"));
  [v5 setMultiple:v4 remove:0 appID:@"com.apple.identityservices.serviceDisablement"];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[IDSUserAccountSynchronizer userDefaults](self, "userDefaults"));
  [v6 synchronizeAppID:@"com.apple.identityservices.serviceDisablement"];
}

- (void)synchronize
{
  v2 = self;
  if (-[IDSDAccountController isLoading](self->_accountController, "isLoading"))
  {
    objc_super v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Marshaller is waiting on accounts to load, the account controller isn't ready yet",  buf,  2u);
    }

- (BOOL)_allowHomeNumberForUser:(id)a3 simCarrierIdentifiers:(id)a4 userCarrierIdentifiers:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 realm] == (id)2)
  {
    id v10 = v7;
    uint64_t v11 = objc_alloc(&OBJC_CLASS___IMPair);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 countryCode]);
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v10 networkCode]);
    __int128 v14 = -[IMPair initWithFirst:second:](v11, "initWithFirst:second:", v12, v13);

    if (+[IMUserDefaults bypassHomeNumberCarrierCheck](&OBJC_CLASS___IMUserDefaults, "bypassHomeNumberCarrierCheck")) {
      goto LABEL_3;
    }
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v10 countryCode]);
    if ([v16 length])
    {
    }

    else
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v10 networkCode]);
      id v18 = [v17 length];

      if (!v18)
      {
LABEL_3:
        if ([v8 count]) {
          char v15 = 1;
        }
        else {
          char v15 = [v9 count] != 0;
        }
LABEL_21:

        goto LABEL_22;
      }
    }

    if ([v8 count])
    {
      else {
        LOBYTE(v19) = 1;
      }
    }

    else
    {
      LOBYTE(v19) = 0;
    }

    if ([v9 count])
    {
      else {
        LOBYTE(v20) = 1;
      }
    }

    else
    {
      LOBYTE(v20) = 0;
    }

    char v15 = v19 | v20;
    goto LABEL_21;
  }

  char v15 = 0;
LABEL_22:

  return v15;
}

- (IDSUserStore)userStore
{
  return self->_userStore;
}

- (void)setUserStore:(id)a3
{
}

- (IDSDAccountController)accountController
{
  return self->_accountController;
}

- (void)setAccountController:(id)a3
{
}

- (IDSDServiceController)serviceController
{
  return self->_serviceController;
}

- (void)setServiceController:(id)a3
{
}

- (IDSDataMigrationTracker)migrationTracker
{
  return self->_migrationTracker;
}

- (void)setMigrationTracker:(id)a3
{
}

- (IMUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (IDSRestrictions)restrictions
{
  return self->_restrictions;
}

- (void)setRestrictions:(id)a3
{
}

- (IDSCTAdapter)ctAdapter
{
  return self->_ctAdapter;
}

- (void)setCtAdapter:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (id)accountBuilder
{
  return self->_accountBuilder;
}

- (void)setAccountBuilder:(id)a3
{
}

- (CUTPromise)migrationPromise
{
  return self->_migrationPromise;
}

- (void)setMigrationPromise:(id)a3
{
}

- (BOOL)midSynchronize
{
  return self->_midSynchronize;
}

- (void)setMidSynchronize:(BOOL)a3
{
  self->_midSynchronize = a3;
}

- (void).cxx_destruct
{
}

@end