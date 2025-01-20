@interface AuthBrokerAgentXPCListenerDelegate
- (AuthBrokerAgentXPCListenerDelegate)init;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)dealloc;
@end

@implementation AuthBrokerAgentXPCListenerDelegate

- (AuthBrokerAgentXPCListenerDelegate)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AuthBrokerAgentXPCListenerDelegate;
  v2 = -[AuthBrokerAgentXPCListenerDelegate init](&v4, "init");
  if (v2) {
    v2->_requestHandler = objc_opt_new(&OBJC_CLASS___ABRequestHandler);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AuthBrokerAgentXPCListenerDelegate;
  -[AuthBrokerAgentXPCListenerDelegate dealloc](&v3, "dealloc");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  if (self) {
    id Property = objc_getProperty(self, v6, 16LL, 1);
  }
  else {
    id Property = 0LL;
  }
  [a4 setExportedObject:Property];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412290;
    id v10 = a4;
    _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Resuming newConnection %@",  (uint8_t *)&v9,  0xCu);
  }

  [a4 resume];
  return 1;
}

@end