@interface TYATypologyAccessServer
+ (id)sharedServer;
- (BOOL)_checkEntitlementForAddEntryStringWithAuditToken:(id *)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListener)listener;
- (OS_dispatch_queue)queue;
- (TYATypologyAccessServer)init;
- (void)dealloc;
- (void)setListener:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation TYATypologyAccessServer

+ (id)sharedServer
{
  if (qword_10001E260 != -1) {
    dispatch_once(&qword_10001E260, &stru_100014990);
  }
  return (id)qword_10001E258;
}

- (TYATypologyAccessServer)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TYATypologyAccessServer;
  v2 = -[TYATypologyAccessServer init](&v12, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_UTILITY, 0);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.TextInput.typologyAccess", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v9 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.TextInput.typologyAccess");
    listener = v2->_listener;
    v2->_listener = v9;

    -[NSXPCListener _setQueue:](v2->_listener, "_setQueue:", v2->_queue);
    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_listener, "resume");
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TYATypologyAccessServer;
  -[TYATypologyAccessServer dealloc](&v3, "dealloc");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7) {
    [v7 auditToken];
  }
  else {
    memset(v19, 0, sizeof(v19));
  }
  BOOL v9 = -[TYATypologyAccessServer _checkEntitlementForAddEntryStringWithAuditToken:]( self,  "_checkEntitlementForAddEntryStringWithAuditToken:",  v19);
  if (v9)
  {
    id v10 = TYALog();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      unsigned int v12 = [v8 processIdentifier];
      *(_DWORD *)buf = 67109120;
      unsigned int v21 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Server is accepting new connection to client (pid=%d).",  buf,  8u);
    }

    v13 = objc_alloc(&OBJC_CLASS___TYATypologyAccessSession);
    if (v8) {
      [v8 auditToken];
    }
    else {
      memset(v18, 0, sizeof(v18));
    }
    v15 = -[TYATypologyAccessSession initWithAuditToken:](v13, "initWithAuditToken:", v18);
    [v8 setExportedObject:v15];
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___TYATypologyAccessProtocol_WithTestSupport));
    [v8 setExportedInterface:v16];

    [v8 resume];
  }

  else
  {
    [v8 invalidate];
    id v14 = TYALog();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10000B370(v15);
    }
  }

  return v9;
}

- (BOOL)_checkEntitlementForAddEntryStringWithAuditToken:(id *)a3
{
  __int128 v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)cf.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&cf.val[4] = v3;
  v4 = SecTaskCreateWithAuditToken(0LL, &cf);
  if (!v4) {
    return 0;
  }
  dispatch_queue_attr_t v5 = v4;
  *(void *)cf.val = 0LL;
  id v6 = (const __CFBoolean *)SecTaskCopyValueForEntitlement( v4,  @"com.apple.TextInput.typologyAccess",  (CFErrorRef *)&cf);
  if (v6)
  {
    id v7 = v6;
    CFTypeID v8 = CFGetTypeID(v6);
    BOOL v9 = v8 == CFBooleanGetTypeID() && CFBooleanGetValue(v7) != 0;
    CFRelease(v7);
  }

  else
  {
    if (*(void *)cf.val)
    {
      id v10 = TYALog();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10000B3B0((uint64_t *)&cf, v11);
      }

      CFRelease(*(CFTypeRef *)cf.val);
    }

    BOOL v9 = 0;
  }

  CFRelease(v5);
  return v9;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (void).cxx_destruct
{
}

@end