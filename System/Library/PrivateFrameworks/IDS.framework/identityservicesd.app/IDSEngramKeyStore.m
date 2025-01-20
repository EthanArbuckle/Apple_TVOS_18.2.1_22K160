@interface IDSEngramKeyStore
+ (id)_keychainIdentifier;
- (BOOL)isEngramEnabled;
- (CUTPromiseSeal)seal;
- (IDSCloudKitContainer)ckContainer;
- (IDSEngramKeyStore)initWithQueue:(id)a3;
- (IDSKeychainWrapper)keychainWrapper;
- (NSData)deviceKey;
- (NSHashTable)listeners;
- (OS_dispatch_queue)queue;
- (id)accountIdentityElector;
- (id)rollFullDeviceIdentityWithCluster:(id)a3 error:(id *)a4;
- (void)accountIdentityClusterForRegistrationWithCompletion:(id)a3;
- (void)addListener:(id)a3;
- (void)existingAccountIdentityClusterWithCompletion:(id)a3;
- (void)existingFullDeviceIdentityWithCompletion:(id)a3;
- (void)notifyListenersEngramKeyStoreDidUpdateIdentities;
- (void)removeListener:(id)a3;
- (void)rollAccountIdentityWithCompletion:(id)a3;
- (void)setKeychainWrapper:(id)a3;
- (void)setListeners:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSeal:(id)a3;
@end

@implementation IDSEngramKeyStore

- (IDSEngramKeyStore)initWithQueue:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___IDSEngramKeyStore;
  v6 = -[IDSEngramKeyStore init](&v15, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    if (+[IMUserDefaults isEngramEnabled](&OBJC_CLASS___IMUserDefaults, "isEngramEnabled"))
    {
      v8 = -[IDSCloudKitContainer initWithIdentifier:queue:]( objc_alloc(&OBJC_CLASS___IDSCloudKitContainer),  "initWithIdentifier:queue:",  @"iCloud.com.apple.Engram.Development",  v5);
      ckContainer = v7->_ckContainer;
      v7->_ckContainer = v8;
    }

    v10 = objc_alloc_init(&OBJC_CLASS___IDSKeychainWrapper);
    keychainWrapper = v7->_keychainWrapper;
    v7->_keychainWrapper = v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    listeners = v7->_listeners;
    v7->_listeners = (NSHashTable *)v12;
  }

  return v7;
}

- (BOOL)isEngramEnabled
{
  return +[IMUserDefaults isEngramEnabled](&OBJC_CLASS___IMUserDefaults, "isEngramEnabled");
}

- (id)accountIdentityElector
{
  v3 = objc_alloc(&OBJC_CLASS___IDSKeychainKeyElectionStore);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSEngramKeyStore keychainWrapper](self, "keychainWrapper"));
  id v5 = -[IDSKeychainKeyElectionStore initWithKeychainWrapper:](v3, "initWithKeychainWrapper:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSEngramKeyStore ckContainer](self, "ckContainer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 keyElectionStore]);

  v8 = objc_alloc_init(&OBJC_CLASS___IDSGroupServerKeyElectionStore);
  v9 = -[IDSAccountIdentityElector initWithKeychainElectionStore:cloudKitElectionStore:groupServerElectionStore:]( objc_alloc(&OBJC_CLASS___IDSAccountIdentityElector),  "initWithKeychainElectionStore:cloudKitElectionStore:groupServerElectionStore:",  v5,  v7,  v8);

  return v9;
}

- (void)accountIdentityClusterForRegistrationWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IDSEngramKeyStore queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog engram](&OBJC_CLASS___IMRGLog, "engram"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "accountIdentitiesClusterForRegistration -- start",  buf,  2u);
  }

  v7 = objc_alloc(&OBJC_CLASS___CUTPromiseSeal);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSEngramKeyStore queue](self, "queue"));
  v9 = -[CUTPromiseSeal initWithQueue:](v7, "initWithQueue:", v8);
  -[IDSEngramKeyStore setSeal:](self, "setSeal:", v9);

  if (-[IDSEngramKeyStore isEngramEnabled](self, "isEngramEnabled"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSEngramKeyStore accountIdentityElector](self, "accountIdentityElector"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100125B2C;
    v19[3] = &unk_1008FB098;
    v19[4] = self;
    [v10 getKeysForServiceTypeName:IDSMPServiceIdentityTypeNameA completion:v19];
  }

  else
  {
    NSErrorUserInfoKey v22 = NSLocalizedDescriptionKey;
    v23 = @"Engram is disabled on this device";
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IDSEngramKeyStoreErrorDomain",  -2000LL,  v11));

    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog engram](&OBJC_CLASS___IMRGLog, "engram"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v21 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Engram inactive -- not fetching {error: %{public}@}",  buf,  0xCu);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSEngramKeyStore seal](self, "seal"));
    [v13 failWithError:v10];
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSEngramKeyStore seal](self, "seal"));
  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v14 promise]);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100125CD0;
  v17[3] = &unk_1008F8760;
  id v18 = v4;
  id v16 = v4;
  [v15 registerResultBlock:v17];
}

- (void)existingAccountIdentityClusterWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IDSEngramKeyStore queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSEngramKeyStore seal](self, "seal"));
  if (!v6)
  {
    v7 = objc_alloc(&OBJC_CLASS___CUTPromiseSeal);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSEngramKeyStore queue](self, "queue"));
    v9 = -[CUTPromiseSeal initWithQueue:](v7, "initWithQueue:", v8);
    -[IDSEngramKeyStore setSeal:](self, "setSeal:", v9);

    if (-[IDSEngramKeyStore isEngramEnabled](self, "isEngramEnabled"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSEngramKeyStore seal](self, "seal"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSEngramKeyStore accountIdentityElector](self, "accountIdentityElector"));
      uint64_t v12 = IDSMPServiceIdentityTypeNameA;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_100126018;
      v21[3] = &unk_1008FB0C0;
      v21[4] = self;
      id v22 = v10;
      id v13 = v10;
      [v11 getKeysForServiceTypeName:v12 completion:v21];
    }

    else
    {
      NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
      v26 = @"Engram is disabled on this device. Update UserDefaults as described in IMUserDefaults";
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IDSEngramKeyStoreErrorDomain",  -2000LL,  v14));

      objc_super v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog engram](&OBJC_CLASS___IMRGLog, "engram"));
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v24 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "Tried to get account identity cluster with Engram disabled {error: %{public}@}",  buf,  0xCu);
      }

      id v13 = (id)objc_claimAutoreleasedReturnValue(-[IDSEngramKeyStore seal](self, "seal"));
      [v13 failWithError:v11];
    }
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSEngramKeyStore seal](self, "seal"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 promise]);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1001261AC;
  v19[3] = &unk_1008F8760;
  id v20 = v4;
  id v18 = v4;
  [v17 registerResultBlock:v19];
}

- (id)rollFullDeviceIdentityWithCluster:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IDSEngramKeyStore queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 adminServiceIdentityWithType:1]);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[IDSMPFullDeviceIdentity deviceIdentityWithFullAdminServiceIdentity:error:]( &OBJC_CLASS___IDSMPFullDeviceIdentity,  "deviceIdentityWithFullAdminServiceIdentity:error:",  v8,  a4));
  v10 = v9;
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v9 dataRepresentationWithError:a4]);
    if (v11
      && (uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSEngramKeyStore keychainWrapper](self, "keychainWrapper")),
          id v14 = objc_msgSend((id)objc_opt_class(self, v13), "_keychainIdentifier"),
          objc_super v15 = (void *)objc_claimAutoreleasedReturnValue(v14),
          unsigned int v16 = [v12 saveData:v11 forIdentifier:v15 allowSync:0 dataProtectionClass:2 error:a4],  v15,  v12,  v16))
    {
      id v17 = v10;
    }

    else
    {
      id v17 = 0LL;
    }
  }

  else
  {
    id v17 = 0LL;
  }

  return v17;
}

- (void)existingFullDeviceIdentityWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IDSEngramKeyStore queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog engram](&OBJC_CLASS___IMRGLog, "engram"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "existingFullDeviceIdentity -- start", buf, 2u);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100126440;
  v8[3] = &unk_1008FB0E8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  -[IDSEngramKeyStore existingAccountIdentityClusterWithCompletion:]( self,  "existingAccountIdentityClusterWithCompletion:",  v8);
}

- (void)rollAccountIdentityWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IDSEngramKeyStore queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  NSErrorUserInfoKey v8 = NSLocalizedDescriptionKey;
  id v9 = @"Account key rolling not implemented";
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IDSEngramKeyStoreErrorDomain",  -2000LL,  v6));

  v4[2](v4, 0LL, v7);
}

+ (id)_keychainIdentifier
{
  uint64_t v2 = _IDSEngramKeyElectorVersion(a1, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  @"kIDSEngramKeyStoreFullDeviceIdentity",  v3));

  return v4;
}

- (void)addListener:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[IDSEngramKeyStore listeners](self, "listeners"));
  [v5 addObject:v4];
}

- (void)removeListener:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[IDSEngramKeyStore listeners](self, "listeners"));
  [v5 removeObject:v4];
}

- (void)notifyListenersEngramKeyStoreDidUpdateIdentities
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog engram](&OBJC_CLASS___IMRGLog, "engram"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSEngramKeyStore listeners](self, "listeners"));
    *(_DWORD *)buf = 138412290;
    id v17 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "Notifying Engram key store that identities did update {listeners: %@}",  buf,  0xCu);
  }

  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSEngramKeyStore listeners](self, "listeners", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v10, "engramKeyStoreDidUpdateIdentities:") & 1) != 0) {
          [v10 engramKeyStoreDidUpdateIdentities:self];
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (IDSCloudKitContainer)ckContainer
{
  return self->_ckContainer;
}

- (CUTPromiseSeal)seal
{
  return self->_seal;
}

- (void)setSeal:(id)a3
{
}

- (NSHashTable)listeners
{
  return self->_listeners;
}

- (void)setListeners:(id)a3
{
}

- (NSData)deviceKey
{
  return self->_deviceKey;
}

- (IDSKeychainWrapper)keychainWrapper
{
  return self->_keychainWrapper;
}

- (void)setKeychainWrapper:(id)a3
{
}

- (void).cxx_destruct
{
}

@end