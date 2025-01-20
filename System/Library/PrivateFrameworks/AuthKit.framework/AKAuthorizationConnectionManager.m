@interface AKAuthorizationConnectionManager
+ (id)sharedManager;
- (AKAuthorizationConnectionManager)init;
- (id)_connectionWithProtocol:(id)a3 forBundleID:(id)a4;
- (id)bundleIDs;
- (id)remoteObjectProxyWithProtocol:(id)a3 forBundleID:(id)a4;
- (id)remoteObjectProxyWithProtocol:(id)a3 forBundleID:(id)a4 errorHandler:(id)a5;
- (id)synchronousRemoteObjectProxyWithProtocol:(id)a3 forBundleID:(id)a4 errorHandler:(id)a5;
- (void)_removeConnectionWithProtocol:(id)a3 forBundleID:(id)a4;
- (void)_setConnection:(id)a3 forBundleID:(id)a4;
- (void)addConnection:(id)a3 forBundleID:(id)a4;
- (void)addConnectionForClient:(id)a3;
@end

@implementation AKAuthorizationConnectionManager

- (AKAuthorizationConnectionManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___AKAuthorizationConnectionManager;
  v2 = -[AKAuthorizationConnectionManager init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    connectionsByBundleID = v3->_connectionsByBundleID;
    v3->_connectionsByBundleID = (NSMutableDictionary *)v4;
  }

  return v3;
}

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007F958;
  block[3] = &unk_1001C8DA0;
  block[4] = a1;
  if (qword_10020F4D8 != -1) {
    dispatch_once(&qword_10020F4D8, block);
  }
  return (id)qword_10020F4D0;
}

- (id)bundleIDs
{
  return -[NSMutableDictionary allKeys](self->_connectionsByBundleID, "allKeys");
}

- (void)addConnectionForClient:(id)a3
{
  id v7 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v7 xpcConnection]);

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v7 xpcConnection]);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleID]);
    -[AKAuthorizationConnectionManager _setConnection:forBundleID:](self, "_setConnection:forBundleID:", v5, v6);
  }
}

- (void)addConnection:(id)a3 forBundleID:(id)a4
{
  id v6 = a3;
  -[AKAuthorizationConnectionManager _setConnection:forBundleID:](self, "_setConnection:forBundleID:", v6, a4);
  [v6 resume];
}

- (id)remoteObjectProxyWithProtocol:(id)a3 forBundleID:(id)a4
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[AKAuthorizationConnectionManager _connectionWithProtocol:forBundleID:]( self,  "_connectionWithProtocol:forBundleID:",  a3,  a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteObjectProxy]);

  return v5;
}

- (id)remoteObjectProxyWithProtocol:(id)a3 forBundleID:(id)a4 errorHandler:(id)a5
{
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue( -[AKAuthorizationConnectionManager _connectionWithProtocol:forBundleID:]( self,  "_connectionWithProtocol:forBundleID:",  a3,  a4));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 remoteObjectProxyWithErrorHandler:v8]);

  return v10;
}

- (id)synchronousRemoteObjectProxyWithProtocol:(id)a3 forBundleID:(id)a4 errorHandler:(id)a5
{
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue( -[AKAuthorizationConnectionManager _connectionWithProtocol:forBundleID:]( self,  "_connectionWithProtocol:forBundleID:",  a3,  a4));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 synchronousRemoteObjectProxyWithErrorHandler:v8]);

  return v10;
}

- (void)_setConnection:(id)a3 forBundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 remoteObjectInterface]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 protocol]);

  objc_initWeak(&location, self);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10007FD1C;
  v24[3] = &unk_1001C9B80;
  objc_copyWeak(&v27, &location);
  id v10 = v9;
  id v25 = v10;
  id v11 = v7;
  id v26 = v11;
  [v6 setInvalidationHandler:v24];
  p_lock = &self->_lock;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v18 = sub_10007FD58;
  v19 = &unk_1001C9BA8;
  v20 = self;
  id v13 = v11;
  id v21 = v13;
  id v14 = v10;
  id v22 = v14;
  id v15 = v6;
  id v23 = v15;
  v16 = v17;
  os_unfair_lock_lock(p_lock);
  v18((uint64_t)v16);

  os_unfair_lock_unlock(p_lock);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

- (void)_removeConnectionWithProtocol:(id)a3 forBundleID:(id)a4
{
  id v6 = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  p_lock = &self->_lock;
  v10[2] = sub_10007FE9C;
  v10[3] = &unk_1001C6510;
  v10[4] = self;
  id v11 = a4;
  id v12 = v6;
  id v8 = v6;
  id v9 = v11;
  os_unfair_lock_lock(p_lock);
  sub_10007FE9C((uint64_t)v10);
  os_unfair_lock_unlock(p_lock);
}

- (id)_connectionWithProtocol:(id)a3 forBundleID:(id)a4
{
  id v6 = a3;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  p_lock = &self->_lock;
  v13[2] = sub_10007FFD8;
  v13[3] = &unk_1001C9BD0;
  v13[4] = self;
  id v14 = a4;
  id v15 = v6;
  id v8 = v6;
  id v9 = v14;
  os_unfair_lock_lock(p_lock);
  id v10 = sub_10007FFD8((uint64_t)v13);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  os_unfair_lock_unlock(p_lock);

  return v11;
}

- (void).cxx_destruct
{
}

@end