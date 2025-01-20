@interface NEAgentServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NEAgentServer)init;
- (void)applicationInstallsDidStart:(id)a3;
- (void)applicationsWillInstall:(id)a3;
- (void)applicationsWillUninstall:(id)a3;
- (void)pluginsDidInstall:(id)a3;
- (void)pluginsWillUninstall:(id)a3;
@end

@implementation NEAgentServer

- (NEAgentServer)init
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForEntitlement:@"com.apple.private.neagent-client"]);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0 || ([v8 BOOLValue] & 1) == 0)
  {
    uint64_t v26 = ne_log_obj();
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v29) = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "Rejecting un-entitled XPC client",  (uint8_t *)&v29,  2u);
    }

    goto LABEL_15;
  }

  if (self) {
    id Property = objc_getProperty(self, v10, 16LL, 1);
  }
  else {
    id Property = 0LL;
  }
  if (Property != v6)
  {
LABEL_15:
    BOOL v25 = 0;
    goto LABEL_16;
  }

  kdebug_trace(726990956LL, 0LL, 0LL, 0LL, 0LL);
  v12 = objc_alloc(&OBJC_CLASS___NEAgentSession);
  id v13 = v7;
  if (v12)
  {
    v34.receiver = v12;
    v34.super_class = (Class)&OBJC_CLASS___NEAgentSession;
    v12 = -[NEAgentServer init](&v34, "init");
    if (v12)
    {
      dispatch_queue_attr_t v14 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v15 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v14);
      dispatch_queue_t v16 = dispatch_queue_create("NEAgentSession queue", v15);
      queue = v12->_queue;
      v12->_queue = (OS_dispatch_queue *)v16;

      v29 = _NSConcreteStackBlock;
      uint64_t v30 = 3221225472LL;
      v31 = sub_1000054C4;
      v32 = &unk_100008338;
      v12 = v12;
      v33 = v12;
      v18 = objc_retainBlock(&v29);
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___NEAgentControl,  v29,  v30,  v31,  v32));
      [v13 setExportedInterface:v19];

      [v13 setExportedObject:v12];
      [v13 setInvalidationHandler:v18];
      [v13 setInterruptionHandler:v18];
      uint64_t v20 = os_transaction_create("com.apple.neagent.session");
      transaction = v12->_transaction;
      v12->_transaction = (OS_os_transaction *)v20;

      objc_storeStrong((id *)&v12->_connection, a4);
      [v13 resume];
      v22 = (NSXPCListener *)objc_claimAutoreleasedReturnValue(+[NSXPCListener anonymousListener](&OBJC_CLASS___NSXPCListener, "anonymousListener"));
      -[NSXPCListener setDelegate:](v22, "setDelegate:", v12);
      -[NSXPCListener resume](v22, "resume");
      delegateListener = v12->_delegateListener;
      v12->_delegateListener = v22;
    }
  }

  os_unfair_lock_lock(&self->_lock);
  if (self) {
    activeSessions = self->_activeSessions;
  }
  else {
    activeSessions = 0LL;
  }
  -[NSMutableArray addObject:](activeSessions, "addObject:", v12);
  os_unfair_lock_unlock(&self->_lock);

  BOOL v25 = 1;
LABEL_16:

  return v25;
}

- (void)applicationInstallsDidStart:(id)a3
{
}

- (void)applicationsWillInstall:(id)a3
{
}

- (void)pluginsWillUninstall:(id)a3
{
}

- (void)pluginsDidInstall:(id)a3
{
}

- (void)applicationsWillUninstall:(id)a3
{
}

- (void).cxx_destruct
{
}

@end