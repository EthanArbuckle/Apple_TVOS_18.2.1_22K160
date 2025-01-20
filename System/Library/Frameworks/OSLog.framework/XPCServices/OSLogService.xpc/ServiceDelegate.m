@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 _xpcConnection]);
  xpc_connection_get_audit_token(v7, &v14);

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___OSLogServiceProtocol));
  [v6 setExportedInterface:v8];

  v9 = objc_opt_new(&OBJC_CLASS___OSLogService);
  audit_token_t atoken = v14;
  -[OSLogService setCallingProcessIdentifier:](v9, "setCallingProcessIdentifier:", audit_token_to_pid(&atoken));
  audit_token_t atoken = v14;
  -[OSLogService setCallingProcessIdentifierVersion:]( v9,  "setCallingProcessIdentifierVersion:",  audit_token_to_pidversion(&atoken));
  [v6 setExportedObject:v9];
  objc_initWeak((id *)&atoken, v9);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100002B84;
  v11[3] = &unk_100004378;
  objc_copyWeak(&v12, (id *)&atoken);
  [v6 setInvalidationHandler:v11];
  [v6 resume];
  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)&atoken);

  return 1;
}

@end