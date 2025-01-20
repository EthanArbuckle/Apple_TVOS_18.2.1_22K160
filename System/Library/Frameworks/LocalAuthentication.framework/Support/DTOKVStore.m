@interface DTOKVStore
- (DTOKVStore)initWithWorkQueue:(id)a3;
- (int64_t)_storageKeyForKVSKey:(int64_t)a3;
- (void)_setValue:(id)a3 forKey:(int64_t)a4 contextUUID:(id)a5 connection:(id)a6 storage:(id)a7 completion:(id)a8;
- (void)_valueForKey:(int64_t)a3 connection:(id)a4 storage:(id)a5 completion:(id)a6;
- (void)processReadRequest:(id)a3 completion:(id)a4;
- (void)processWriteRequest:(id)a3 completion:(id)a4;
- (void)setValue:(id)a3 forKey:(int64_t)a4 completion:(id)a5;
- (void)setValue:(id)a3 forKey:(int64_t)a4 connection:(id)a5 completion:(id)a6;
- (void)setValue:(id)a3 forKey:(int64_t)a4 contextUUID:(id)a5 completion:(id)a6;
- (void)setValue:(id)a3 forKey:(int64_t)a4 contextUUID:(id)a5 connection:(id)a6 completion:(id)a7;
- (void)valueForKey:(int64_t)a3 completion:(id)a4;
- (void)valueForKey:(int64_t)a3 connection:(id)a4 completion:(id)a5;
@end

@implementation DTOKVStore

- (DTOKVStore)initWithWorkQueue:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___DTOKVStore;
  v6 = -[DTOKVStore init](&v15, "init");
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SecureStorageProvider sharedInstance](&OBJC_CLASS___SecureStorageProvider, "sharedInstance"));
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 secureStorage]);
    storage = v6->_storage;
    v6->_storage = (LASecureStorageService *)v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SecureStorageProvider sharedInstance](&OBJC_CLASS___SecureStorageProvider, "sharedInstance"));
    v11 = -[LACSecureStorageConfiguration initWithBypassEntitlementChecks:]( objc_alloc(&OBJC_CLASS___LACSecureStorageConfiguration),  "initWithBypassEntitlementChecks:",  1LL);
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v10 secureStorageWithConfig:v11]);
    uncheckedStorage = v6->_uncheckedStorage;
    v6->_uncheckedStorage = (LASecureStorageService *)v12;

    objc_storeStrong((id *)&v6->_workQueue, a3);
  }

  return v6;
}

- (void)valueForKey:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [[LACDTOMutableKVStoreReadRequest alloc] initWithKey:a3];
  -[DTOKVStore processReadRequest:completion:](self, "processReadRequest:completion:", v7, v6);
}

- (void)valueForKey:(int64_t)a3 connection:(id)a4 completion:(id)a5
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100001AB0;
  v12[3] = &unk_1000307B8;
  id v13 = a4;
  int64_t v14 = a3;
  id v11 = v13;
  id v8 = a5;
  id v9 = sub_100001AB0((uint64_t)v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  -[DTOKVStore processReadRequest:completion:](self, "processReadRequest:completion:", v10, v8);
}

- (void)processReadRequest:(id)a3 completion:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [v12 key];
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v12 connection]);
  id v9 = v8;
  if (!v8) {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  }
  unsigned int v10 = [v12 bypassEntitlements];
  uint64_t v11 = 1LL;
  if (v10) {
    uint64_t v11 = 2LL;
  }
  -[DTOKVStore _valueForKey:connection:storage:completion:]( self,  "_valueForKey:connection:storage:completion:",  v7,  v9,  (&self->super.isa)[v11],  v6);

  if (!v8) {
}
  }

- (void)setValue:(id)a3 forKey:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [[LACDTOMutableKVStoreWriteRequest alloc] initWithKey:a4 value:v9];

  -[DTOKVStore processWriteRequest:completion:](self, "processWriteRequest:completion:", v10, v8);
}

- (void)setValue:(id)a3 forKey:(int64_t)a4 connection:(id)a5 completion:(id)a6
{
  id v10 = a3;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100001D14;
  v16[3] = &unk_1000307E0;
  id v18 = a5;
  int64_t v19 = a4;
  id v17 = v10;
  id v11 = v18;
  id v15 = v10;
  id v12 = a6;
  id v13 = sub_100001D14(v16);
  int64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  -[DTOKVStore processWriteRequest:completion:](self, "processWriteRequest:completion:", v14, v12);
}

- (void)setValue:(id)a3 forKey:(int64_t)a4 contextUUID:(id)a5 completion:(id)a6
{
  id v10 = a3;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100001E30;
  v16[3] = &unk_1000307E0;
  id v18 = a5;
  int64_t v19 = a4;
  id v17 = v10;
  id v11 = v18;
  id v15 = v10;
  id v12 = a6;
  id v13 = sub_100001E30(v16);
  int64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  -[DTOKVStore processWriteRequest:completion:](self, "processWriteRequest:completion:", v14, v12);
}

- (void)setValue:(id)a3 forKey:(int64_t)a4 contextUUID:(id)a5 connection:(id)a6 completion:(id)a7
{
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100001F6C;
  v18[3] = &unk_100030808;
  id v19 = a3;
  id v20 = a5;
  id v21 = a6;
  int64_t v22 = a4;
  id v12 = v21;
  id v13 = v20;
  id v17 = v19;
  id v14 = a7;
  id v15 = sub_100001F6C(v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  -[DTOKVStore processWriteRequest:completion:](self, "processWriteRequest:completion:", v16, v14);
}

- (void)processWriteRequest:(id)a3 completion:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v14 value]);
  id v8 = [v14 key];
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v14 contextUUID]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v14 connection]);
  id v11 = v10;
  if (!v10) {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  }
  unsigned int v12 = [v14 bypassEntitlements];
  uint64_t v13 = 1LL;
  if (v12) {
    uint64_t v13 = 2LL;
  }
  -[DTOKVStore _setValue:forKey:contextUUID:connection:storage:completion:]( self,  "_setValue:forKey:contextUUID:connection:storage:completion:",  v7,  v8,  v9,  v11,  (&self->super.isa)[v13],  v6);

  if (!v10) {
}
  }

- (void)_valueForKey:(int64_t)a3 connection:(id)a4 storage:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = -[DTOKVStore _storageKeyForKVSKey:](self, "_storageKeyForKVSKey:", a3);
  objc_initWeak(&location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000021E0;
  v15[3] = &unk_100030830;
  v17[1] = v13;
  objc_copyWeak(v17, &location);
  id v14 = v12;
  id v16 = v14;
  v17[2] = (id)a3;
  [v11 objectForKey:v13 contextUUID:0 connection:v10 completionHandler:v15];

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
}

- (void)_setValue:(id)a3 forKey:(int64_t)a4 contextUUID:(id)a5 connection:(id)a6 storage:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = -[DTOKVStore _storageKeyForKVSKey:](self, "_storageKeyForKVSKey:", a4);
  objc_initWeak(&location, self);
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v14 data]);
  id v21 = objc_opt_new(&OBJC_CLASS___NSData);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000025F8;
  v23[3] = &unk_100030858;
  v25[1] = v19;
  objc_copyWeak(v25, &location);
  id v22 = v18;
  id v24 = v22;
  [v17 setObject:v20 acl:v21 forKey:v19 contextUUID:v15 connection:v16 completionHandler:v23];

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
}

- (int64_t)_storageKeyForKVSKey:(int64_t)a3
{
  else {
    return qword_100025678[a3 - 1];
  }
}

- (void).cxx_destruct
{
}

@end