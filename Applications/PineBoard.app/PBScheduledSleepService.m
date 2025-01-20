@interface PBScheduledSleepService
- (BSServiceConnectionHost)remoteConnection;
- (PBScheduledSleepService)initWithRemoteConnection:(id)a3;
- (void)cancelScheduledSleepWithCompletion:(id)a3;
- (void)getAvailableScheduledSleepRequestsWithCompletion:(id)a3;
- (void)getCurrentScheduledSleepWithCompletion:(id)a3;
- (void)scheduleSleepWithRequest:(id)a3 completion:(id)a4;
@end

@implementation PBScheduledSleepService

- (PBScheduledSleepService)initWithRemoteConnection:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PBScheduledSleepService;
  v5 = -[PBScheduledSleepService init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_remoteConnection, v4);
    v7 = v6;
  }

  return v6;
}

- (void)scheduleSleepWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteConnection);
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained remoteProcess]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleIdentifier]);

  id v11 = sub_100083F00();
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Start sleep timer request from %@", buf, 0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10015F574;
  block[3] = &unk_1003D2F08;
  id v17 = v10;
  id v18 = v6;
  id v19 = v7;
  id v13 = v7;
  id v14 = v6;
  id v15 = v10;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)getAvailableScheduledSleepRequestsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = sub_100083F00();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteConnection);
    v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained remoteProcess]);
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleIdentifier]);
    *(_DWORD *)buf = 138412290;
    id v14 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Available sleep timers request from %@",  buf,  0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10015F708;
  block[3] = &unk_1003D0110;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)getCurrentScheduledSleepWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = sub_100083F00();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteConnection);
    v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained remoteProcess]);
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleIdentifier]);
    *(_DWORD *)buf = 138412290;
    id v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Current sleep timer request from %@", buf, 0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10015F898;
  block[3] = &unk_1003D0110;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)cancelScheduledSleepWithCompletion:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteConnection);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained remoteProcess]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);

  id v8 = sub_100083F00();
  objc_super v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Cancel sleep timer request from %@", buf, 0xCu);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10015FA30;
  v12[3] = &unk_1003D0070;
  id v13 = v7;
  id v14 = v4;
  id v10 = v4;
  id v11 = v7;
  dispatch_async(&_dispatch_main_q, v12);
}

- (BSServiceConnectionHost)remoteConnection
{
  return (BSServiceConnectionHost *)objc_loadWeakRetained((id *)&self->_remoteConnection);
}

- (void).cxx_destruct
{
}

@end