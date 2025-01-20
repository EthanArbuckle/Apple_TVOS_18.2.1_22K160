@interface MainServiceListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation MainServiceListener

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = LALogForCategory(256LL);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v17 = v6;
    __int16 v18 = 1024;
    unsigned int v19 = [v6 hash];
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "MainServiceListener has accepted a new connection: %{public}@ hash:%x",  buf,  0x12u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedInstance](&OBJC_CLASS___Daemon, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[LAInternalProtocols interfaceWithInternalProtocol:]( &OBJC_CLASS___LAInternalProtocols,  "interfaceWithInternalProtocol:",  &OBJC_PROTOCOL___LADaemonXPC));
  [v6 setExportedInterface:v10];

  [v6 setExportedObject:v9];
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[DaemonUtils sharedInstance](&OBJC_CLASS___DaemonUtils, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 serverQueue]);
  [v6 _setQueue:v12];

  [v6 resume];
  objc_initWeak((id *)buf, v6);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000041F4;
  v14[3] = &unk_100030A20;
  objc_copyWeak(&v15, (id *)buf);
  [v6 setInvalidationHandler:v14];
  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);

  return 1;
}

@end