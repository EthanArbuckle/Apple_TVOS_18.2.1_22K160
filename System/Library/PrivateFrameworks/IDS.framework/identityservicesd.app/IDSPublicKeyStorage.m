@interface IDSPublicKeyStorage
+ (IDSPublicKeyStorage)sharedInstance;
- (IDSDAccountController)accountController;
- (IDSPeerIDManager)peerIDManager;
- (IDSPublicKeyStorage)init;
- (IDSPublicKeyStorage)initWithPeerIDManager:(id)a3 accountController:(id)a4;
- (IDSPublicKeyStorageCache)cache;
- (_opaque_pthread_mutex_t)lock;
- (id)publicDeviceIdentityContainerForDeviceID:(id)a3;
- (void)_removeOldPersistence;
- (void)clearCache;
- (void)dealloc;
- (void)logState;
- (void)setAccountController:(id)a3;
- (void)setCache:(id)a3;
- (void)setLock:(_opaque_pthread_mutex_t *)a3;
- (void)setPeerIDManager:(id)a3;
@end

@implementation IDSPublicKeyStorage

+ (IDSPublicKeyStorage)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10020065C;
  block[3] = &unk_1008F6558;
  block[4] = a1;
  if (qword_1009C05F8 != -1) {
    dispatch_once(&qword_1009C05F8, block);
  }
  return (IDSPublicKeyStorage *)(id)qword_1009C05F0;
}

- (IDSPublicKeyStorage)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPeerIDManager sharedInstance](&OBJC_CLASS___IDSPeerIDManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
  v5 = -[IDSPublicKeyStorage initWithPeerIDManager:accountController:]( self,  "initWithPeerIDManager:accountController:",  v3,  v4);

  return v5;
}

- (IDSPublicKeyStorage)initWithPeerIDManager:(id)a3 accountController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___IDSPublicKeyStorage;
  v9 = -[IDSPublicKeyStorage init](&v20, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_peerIDManager, a3);
    objc_storeStrong((id *)&v10->_accountController, a4);
    v11 = objc_alloc_init(&OBJC_CLASS___IDSPublicKeyStorageCache);
    cache = v10->_cache;
    v10->_cache = v11;

    pthread_mutex_init(&v10->_lock, 0LL);
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v10);
    v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472LL;
    v16 = sub_100200844;
    v17 = &unk_1008FDE88;
    objc_copyWeak(&v18, &location);
    [v7 addPurgeClientDataBlock:&v14 forToken:@"kIDSPublicKeyStorageToken"];
    -[IDSPublicKeyStorage _removeOldPersistence](v10, "_removeOldPersistence", v14, v15, v16, v17);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (void)_removeOldPersistence
{
  v2 = objc_alloc_init(&OBJC_CLASS___IDSKeychainWrapper);
  -[IDSKeychainWrapper removeDataForIdentifier:dataProtectionClass:error:]( v2,  "removeDataForIdentifier:dataProtectionClass:error:",  @"personal-public-key-cache",  2LL,  0LL);
  -[IDSKeychainWrapper removeDataForIdentifier:dataProtectionClass:error:]( v2,  "removeDataForIdentifier:dataProtectionClass:error:",  @"personal-public-key-cache-v1",  2LL,  0LL);
  -[IDSKeychainWrapper removeDataForIdentifier:dataProtectionClass:error:]( v2,  "removeDataForIdentifier:dataProtectionClass:error:",  @"personal-public-key-cache-v2",  2LL,  0LL);
  -[IDSKeychainWrapper removeDataForIdentifier:dataProtectionClass:error:]( v2,  "removeDataForIdentifier:dataProtectionClass:error:",  @"personal-public-key-cache-v3",  2LL,  0LL);
  -[IDSKeychainWrapper removeDataForIdentifier:dataProtectionClass:error:]( v2,  "removeDataForIdentifier:dataProtectionClass:error:",  @"personal-public-key-cache-v4",  2LL,  0LL);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___IDSPublicKeyStorage;
  -[IDSPublicKeyStorage dealloc](&v3, "dealloc");
}

- (void)clearCache
{
  objc_super v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Clearing public and personal keys", v4, 2u);
  }

  pthread_mutex_lock(&self->_lock);
  -[IDSPublicKeyStorageCache clearCache](self->_cache, "clearCache");
  pthread_mutex_unlock(&self->_lock);
}

- (id)publicDeviceIdentityContainerForDeviceID:(id)a3
{
  id v4 = a3;
  pthread_mutex_lock(&self->_lock);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPublicKeyStorageCache cachedIdentityForDeviceID:](self->_cache, "cachedIdentityForDeviceID:", v4));
  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccountController pushTokenForDeviceID:](self->_accountController, "pushTokenForDeviceID:", v4));
    peerIDManager = self->_peerIDManager;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPushToken pushTokenWithData:](&OBJC_CLASS___IDSPushToken, "pushTokenWithData:", v6));
    v5 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager publicDeviceIdentityContainerForPushToken:]( peerIDManager,  "publicDeviceIdentityContainerForPushToken:",  v8));

    if (v5) {
      -[IDSPublicKeyStorageCache cacheIdentity:forDeviceID:andPushToken:]( self->_cache,  "cacheIdentity:forDeviceID:andPushToken:",  v5,  v4,  v6);
    }
  }

  pthread_mutex_unlock(&self->_lock);

  return v5;
}

- (void)logState
{
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  -[IDSPublicKeyStorageCache logState](self->_cache, "logState");
  pthread_mutex_unlock(p_lock);
}

- (IDSPeerIDManager)peerIDManager
{
  return self->_peerIDManager;
}

- (void)setPeerIDManager:(id)a3
{
}

- (IDSDAccountController)accountController
{
  return self->_accountController;
}

- (void)setAccountController:(id)a3
{
}

- (_opaque_pthread_mutex_t)lock
{
  __int128 v3 = *(_OWORD *)&self->__opaque[40];
  *(_OWORD *)&retstr->__sig = *(_OWORD *)&self->__opaque[24];
  *(_OWORD *)&retstr->__opaque[8] = v3;
  __int128 v4 = *(_OWORD *)&self[1].__opaque[8];
  *(_OWORD *)&retstr->__opaque[24] = *(_OWORD *)&self[1].__sig;
  *(_OWORD *)&retstr->__opaque[40] = v4;
  return self;
}

- (void)setLock:(_opaque_pthread_mutex_t *)a3
{
  __int128 v3 = *(_OWORD *)&a3->__sig;
  __int128 v4 = *(_OWORD *)&a3->__opaque[8];
  __int128 v5 = *(_OWORD *)&a3->__opaque[40];
  *(_OWORD *)&self->_lock.__opaque[24] = *(_OWORD *)&a3->__opaque[24];
  *(_OWORD *)&self->_lock.__opaque[40] = v5;
  *(_OWORD *)&self->_lock.__sig = v3;
  *(_OWORD *)&self->_lock.__opaque[8] = v4;
}

- (IDSPublicKeyStorageCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end