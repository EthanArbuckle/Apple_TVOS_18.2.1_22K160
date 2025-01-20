@interface ServiceDelegate
- (BOOL)hasEntitlement:(id)a3 connection:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (ServiceDelegate)init;
@end

@implementation ServiceDelegate

- (ServiceDelegate)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ServiceDelegate;
  v2 = -[ServiceDelegate init](&v6, "init");
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v8 = "-[ServiceDelegate init]";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
    }

    v3 = objc_opt_new(&OBJC_CLASS___Categories_Service);
    sharedXPCService = v2->_sharedXPCService;
    v2->_sharedXPCService = v3;
  }

  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___CategoriesServiceProtocol));
  [v5 setExportedInterface:v6];

  [v5 setExportedObject:self->_sharedXPCService];
  [v5 resume];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "CategoriesService connection accepted.",  v8,  2u);
  }

  return 1;
}

- (BOOL)hasEntitlement:(id)a3 connection:(id)a4
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a4 valueForEntitlement:a3]);
  BOOL v6 = 0;
  if (v4)
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber);
  }

  return v6;
}

- (void).cxx_destruct
{
}

@end