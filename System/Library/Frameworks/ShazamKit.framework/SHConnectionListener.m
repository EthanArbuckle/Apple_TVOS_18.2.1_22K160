@interface SHConnectionListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMutableArray)connectionHandles;
- (NSXPCListener)listener;
- (SHConnectionListener)initWithServiceProvider:(id)a3 listener:(id)a4;
- (SHServiceProvider)serviceProvider;
- (os_unfair_lock_s)lock;
- (void)listen;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)stopListening;
@end

@implementation SHConnectionListener

- (SHConnectionListener)initWithServiceProvider:(id)a3 listener:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SHConnectionListener;
  v9 = -[SHConnectionListener init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serviceProvider, a3);
    objc_storeStrong((id *)&v10->_listener, a4);
    -[NSXPCListener setDelegate:](v10->_listener, "setDelegate:", v10);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    connectionHandles = v10->_connectionHandles;
    v10->_connectionHandles = (NSMutableArray *)v11;

    v10->_lock._os_unfair_lock_opaque = 0;
  }

  return v10;
}

- (void)listen
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[SHConnectionListener listener](self, "listener"));
  [v2 resume];
}

- (void)stopListening
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[SHConnectionListener listener](self, "listener"));
  [v2 invalidate];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  id v7 = -[SHClientCredentials initWithConnection:]( objc_alloc(&OBJC_CLASS___SHClientCredentials),  "initWithConnection:",  v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHConnectionListener serviceProvider](self, "serviceProvider"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 handleForConnection:v6 withClientCredentials:v7]);

  os_unfair_lock_lock(&self->_lock);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SHConnectionListener connectionHandles](self, "connectionHandles"));
  [v10 addObject:v9];

  os_unfair_lock_unlock(&self->_lock);
  objc_initWeak(location, self);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_100005614;
  v29[3] = &unk_10006CC78;
  objc_copyWeak(&v31, location);
  id v11 = v9;
  id v30 = v11;
  v12 = objc_retainBlock(v29);
  LODWORD(v10) = [v6 processIdentifier];
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SHClientCredentials attribution](v7, "attribution"));
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleIdentifier]);

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1000057B0;
  v25[3] = &unk_10006CCA0;
  v25[4] = self;
  id v15 = v14;
  id v26 = v15;
  int v28 = (int)v10;
  v16 = v12;
  id v27 = v16;
  [v6 setInterruptionHandler:v25];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10000587C;
  v21[3] = &unk_10006CCA0;
  v21[4] = self;
  id v17 = v15;
  id v22 = v17;
  int v24 = (int)v10;
  v18 = v16;
  id v23 = v18;
  [v6 setInvalidationHandler:v21];
  [v6 resume];

  objc_destroyWeak(&v31);
  objc_destroyWeak(location);

  return 1;
}

- (NSMutableArray)connectionHandles
{
  return self->_connectionHandles;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (SHServiceProvider)serviceProvider
{
  return self->_serviceProvider;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
}

@end