@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForEntitlement:entitlement]);
  if (v5
    && (uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    && ([v5 BOOLValue] & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___SKRemoteTaskRunnerProtocol));
    [v4 setExportedInterface:v7];

    v8 = -[SKRemoteTaskRunner initWithConnection:]( objc_alloc(&OBJC_CLASS___SKRemoteTaskRunner),  "initWithConnection:",  v4);
    [v4 setExportedObject:v8];
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___SKRemoteTaskDataProtocol));
    [v4 setRemoteObjectInterface:v9];

    [v4 resume];
    BOOL v10 = 1;
  }

  else
  {
    id v11 = SKGetOSLog();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315138;
      v15 = "-[ServiceDelegate listener:shouldAcceptNewConnection:]";
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s: Missing entitlement for client",  (uint8_t *)&v14,  0xCu);
    }

    BOOL v10 = 0;
  }

  return v10;
}

@end