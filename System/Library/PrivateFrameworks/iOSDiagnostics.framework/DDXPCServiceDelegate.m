@interface DDXPCServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation DDXPCServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = DiagnosticLogHandleForCategory(8LL);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "-[DDXPCServiceDelegate listener:shouldAcceptNewConnection:]";
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: %@", buf, 0x16u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[DDMain sharedInstance](&OBJC_CLASS___DDMain, "sharedInstance"));
  [v6 setExportedObject:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___DAIDSMessageSender));
  [v6 setExportedInterface:v10];

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___DAIDSMessageReceiver));
  [v6 setRemoteObjectInterface:v11];

  objc_initWeak((id *)buf, v6);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100006980;
  v19[3] = &unk_100018610;
  objc_copyWeak(&v20, (id *)buf);
  [v6 setInterruptionHandler:v19];
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  v16 = sub_100006A5C;
  v17 = &unk_100018610;
  objc_copyWeak(&v18, (id *)buf);
  [v6 setInvalidationHandler:&v14];
  objc_msgSend(v6, "resume", v14, v15, v16, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[DDMain sharedInstance](&OBJC_CLASS___DDMain, "sharedInstance"));
  [v12 addConnection:v6];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);

  return 1;
}

@end