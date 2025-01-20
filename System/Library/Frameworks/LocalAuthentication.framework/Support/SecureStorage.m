@interface SecureStorage
- (LACSecureStorage)coreStorage;
- (LACSecureStorageConfiguration)config;
- (SecureStorage)init;
- (SecureStorage)initWithConfig:(id)a3;
- (id)_makeStorageRequestWithKey:(int64_t)a3 contextUUID:(id)a4;
- (id)_makeStorageRequestWithKey:(int64_t)a3 contextUUID:(id)a4 acl:(id)a5;
- (id)acmContextForUUID:(id)a3 error:(id *)a4;
- (id)bundleIDForRequest:(id)a3;
- (void)aclForKey:(int64_t)a3 contextUUID:(id)a4 completionHandler:(id)a5;
- (void)aclForKey:(int64_t)a3 contextUUID:(id)a4 connection:(id)a5 completionHandler:(id)a6;
- (void)objectForKey:(int64_t)a3 contextUUID:(id)a4 completionHandler:(id)a5;
- (void)objectForKey:(int64_t)a3 contextUUID:(id)a4 connection:(id)a5 completionHandler:(id)a6;
- (void)removeObjectForKey:(int64_t)a3 contextUUID:(id)a4 completionHandler:(id)a5;
- (void)removeObjectForKey:(int64_t)a3 contextUUID:(id)a4 connection:(id)a5 completionHandler:(id)a6;
- (void)setObject:(id)a3 acl:(id)a4 forKey:(int64_t)a5 contextUUID:(id)a6 completionHandler:(id)a7;
- (void)setObject:(id)a3 acl:(id)a4 forKey:(int64_t)a5 contextUUID:(id)a6 connection:(id)a7 completionHandler:(id)a8;
@end

@implementation SecureStorage

- (SecureStorage)initWithConfig:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SecureStorage;
  v6 = -[SecureStorage init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_config, a3);
    v8 = -[LACSecureStorage initWithConfig:](objc_alloc(&OBJC_CLASS___LACSecureStorage), "initWithConfig:", v5);
    coreStorage = v7->_coreStorage;
    v7->_coreStorage = v8;

    -[LACSecureStorage setDelegate:](v7->_coreStorage, "setDelegate:", v7);
  }

  return v7;
}

- (SecureStorage)init
{
  v3 = objc_alloc_init(&OBJC_CLASS___LACSecureStorageConfiguration);
  v4 = -[SecureStorage initWithConfig:](self, "initWithConfig:", v3);

  return v4;
}

- (void)setObject:(id)a3 acl:(id)a4 forKey:(int64_t)a5 contextUUID:(id)a6 completionHandler:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  id v16 = (id)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  -[SecureStorage setObject:acl:forKey:contextUUID:connection:completionHandler:]( self,  "setObject:acl:forKey:contextUUID:connection:completionHandler:",  v15,  v14,  a5,  v13,  v16,  v12);
}

- (void)setObject:(id)a3 acl:(id)a4 forKey:(int64_t)a5 contextUUID:(id)a6 connection:(id)a7 completionHandler:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a3;
  id v17 = (id)objc_claimAutoreleasedReturnValue( -[SecureStorage _makeStorageRequestWithKey:contextUUID:acl:]( self,  "_makeStorageRequestWithKey:contextUUID:acl:",  a5,  a6,  a4));
  -[LACSecureStorage setObject:forRequest:connection:completionHandler:]( self->_coreStorage,  "setObject:forRequest:connection:completionHandler:",  v16,  v17,  v15,  v14);
}

- (void)objectForKey:(int64_t)a3 contextUUID:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  -[SecureStorage objectForKey:contextUUID:connection:completionHandler:]( self,  "objectForKey:contextUUID:connection:completionHandler:",  a3,  v9,  v10,  v8);
}

- (void)objectForKey:(int64_t)a3 contextUUID:(id)a4 connection:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = (id)objc_claimAutoreleasedReturnValue( -[SecureStorage _makeStorageRequestWithKey:contextUUID:]( self,  "_makeStorageRequestWithKey:contextUUID:",  a3,  a4));
  -[LACSecureStorage objectForRequest:connection:completionHandler:]( self->_coreStorage,  "objectForRequest:connection:completionHandler:",  v12,  v11,  v10);
}

- (void)removeObjectForKey:(int64_t)a3 contextUUID:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  -[SecureStorage removeObjectForKey:contextUUID:connection:completionHandler:]( self,  "removeObjectForKey:contextUUID:connection:completionHandler:",  a3,  v9,  v10,  v8);
}

- (void)removeObjectForKey:(int64_t)a3 contextUUID:(id)a4 connection:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = (id)objc_claimAutoreleasedReturnValue( -[SecureStorage _makeStorageRequestWithKey:contextUUID:]( self,  "_makeStorageRequestWithKey:contextUUID:",  a3,  a4));
  -[LACSecureStorage removeObjectForRequest:connection:completionHandler:]( self->_coreStorage,  "removeObjectForRequest:connection:completionHandler:",  v12,  v11,  v10);
}

- (void)aclForKey:(int64_t)a3 contextUUID:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  -[SecureStorage aclForKey:contextUUID:connection:completionHandler:]( self,  "aclForKey:contextUUID:connection:completionHandler:",  a3,  v9,  v10,  v8);
}

- (void)aclForKey:(int64_t)a3 contextUUID:(id)a4 connection:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = (id)objc_claimAutoreleasedReturnValue( -[SecureStorage _makeStorageRequestWithKey:contextUUID:]( self,  "_makeStorageRequestWithKey:contextUUID:",  a3,  a4));
  -[LACSecureStorage aclForRequest:connection:completionHandler:]( self->_coreStorage,  "aclForRequest:connection:completionHandler:",  v12,  v11,  v10);
}

- (id)acmContextForUUID:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ContextManager sharedInstance](&OBJC_CLASS___ContextManager, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 contextForUUID:v5]);

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 plugin]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 module]);
    id v10 = [v9 type];

    if (v10 == (id)1)
    {
      uint64_t v14 = 0LL;
      id v15 = &v14;
      uint64_t v16 = 0x3032000000LL;
      id v17 = sub_10000548C;
      v18 = sub_10000549C;
      id v19 = 0LL;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_1000054A4;
      v13[3] = &unk_100030BB8;
      v13[4] = &v14;
      ACMContextGetExternalForm([v8 underlyingPtr], (uint64_t)v13);
      id v11 = (id)v15[5];
      _Block_object_dispose(&v14, 8);
    }

    else
    {
      id v11 = 0LL;
      if (a4) {
        *a4 = (id)objc_claimAutoreleasedReturnValue( +[LAErrorHelper storageErrorWithCode:message:]( &OBJC_CLASS___LAErrorHelper,  "storageErrorWithCode:message:",  2LL,  @"No ACM plugin."));
      }
    }
  }

  else
  {
    id v11 = 0LL;
    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[LAErrorHelper storageErrorWithCode:message:]( &OBJC_CLASS___LAErrorHelper,  "storageErrorWithCode:message:",  2LL,  @"Context not found."));
    }
  }

  return v11;
}

- (id)bundleIDForRequest:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 client]);
  id v5 = [v4 processId];
  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 client]);

  if (v6) {
    [v6 auditToken];
  }
  else {
    memset(v11, 0, sizeof(v11));
  }
  id v10 = 0LL;
  id v7 =  +[DaemonUtils callerDisplayNameWithPid:auditToken:bundleId:]( &OBJC_CLASS___DaemonUtils,  "callerDisplayNameWithPid:auditToken:bundleId:",  v5,  v11,  &v10);
  id v8 = v10;

  return v8;
}

- (id)_makeStorageRequestWithKey:(int64_t)a3 contextUUID:(id)a4
{
  return -[SecureStorage _makeStorageRequestWithKey:contextUUID:acl:]( self,  "_makeStorageRequestWithKey:contextUUID:acl:",  a3,  a4,  0LL);
}

- (id)_makeStorageRequestWithKey:(int64_t)a3 contextUUID:(id)a4 acl:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [[StorageRequest alloc] initWithStorageDomain:0 key:a3 contextID:v8 acl:v7];

  return v9;
}

- (LACSecureStorage)coreStorage
{
  return self->_coreStorage;
}

- (LACSecureStorageConfiguration)config
{
  return self->_config;
}

- (void).cxx_destruct
{
}

@end