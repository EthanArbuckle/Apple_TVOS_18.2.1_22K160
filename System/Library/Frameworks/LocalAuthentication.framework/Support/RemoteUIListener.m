@interface RemoteUIListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (RemoteUIListener)initWithMachServiceName:(id)a3;
- (id)_workQueue;
- (id)anonymousListener;
@end

@implementation RemoteUIListener

- (RemoteUIListener)initWithMachServiceName:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___RemoteUIListener;
  v3 = -[ListenerWithDelegate initWithMachServiceName:](&v12, "initWithMachServiceName:", a3);
  v4 = v3;
  if (v3)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100004374;
    v10[3] = &unk_100030A48;
    v5 = v3;
    v11 = v5;
    id v6 = sub_100004374((uint64_t)v10);
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    xconnection = v5->super.super._xconnection;
    v5->super.super._xconnection = (void *)v7;
  }

  return v4;
}

- (id)anonymousListener
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener anonymousListener](&OBJC_CLASS___NSXPCListener, "anonymousListener"));
  [v3 setDelegate:self];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RemoteUIListener _workQueue](self, "_workQueue"));
  [v3 _setQueue:v4];

  [v3 resume];
  return v3;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = LALogForCategory(256LL);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v18 = v7;
    __int16 v19 = 1024;
    unsigned int v20 = [v7 hash];
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "RemoteUIListener has accepted a new connection %{public}@ hash:%x",  buf,  0x12u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[LAInternalProtocols interfaceWithInternalProtocol:]( &OBJC_CLASS___LAInternalProtocols,  "interfaceWithInternalProtocol:",  &OBJC_PROTOCOL___LARemoteUIHost));
  [v7 setExportedInterface:v10];

  [v7 setExportedObject:self->super.super._xconnection];
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RemoteUIListener _workQueue](self, "_workQueue"));
  [v7 _setQueue:v11];

  [v7 resume];
  objc_initWeak((id *)buf, v7);
  objc_initWeak(&location, v6);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100004644;
  v13[3] = &unk_100030A90;
  objc_copyWeak(&v14, (id *)buf);
  objc_copyWeak(&v15, &location);
  [v7 setInvalidationHandler:v13];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

  return 1;
}

- (id)_workQueue
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[DaemonUtils sharedInstance](&OBJC_CLASS___DaemonUtils, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 serverQueue]);

  return v3;
}

- (void).cxx_destruct
{
}

@end