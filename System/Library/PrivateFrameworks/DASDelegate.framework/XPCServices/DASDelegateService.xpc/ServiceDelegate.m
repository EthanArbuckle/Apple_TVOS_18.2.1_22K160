@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForEntitlement:@"com.apple.dasd.DASDelegateService.allow"]);
  v6 = v5;
  if (v5 && [v5 BOOLValue])
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___DASDelegateServiceProtocol));
    [v4 setExportedInterface:v7];

    v8 = objc_opt_new(&OBJC_CLASS___DASDelegateService);
    [v4 setExportedObject:v8];
    [v4 resume];
    v9 = (void *)qword_100008818;
    if (os_log_type_enabled((os_log_t)qword_100008818, OS_LOG_TYPE_DEBUG)) {
      sub_100002E68(v9);
    }

    BOOL v10 = 1;
  }

  else
  {
    v11 = (void *)qword_100008818;
    if (os_log_type_enabled((os_log_t)qword_100008818, OS_LOG_TYPE_ERROR)) {
      sub_100002DE0(v11);
    }
    BOOL v10 = 0;
  }

  return v10;
}

@end