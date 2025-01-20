@interface IXATestAppRelayServer
+ (id)sharedServer;
- (BOOL)_checkEntitlement:(id)a3 withAuditToken:(id *)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (IXATestAppRelayServer)init;
- (NSMutableDictionary)registrations;
- (NSXPCListener)listener;
- (OS_dispatch_queue)queue;
- (void)dealloc;
- (void)fetchEndpointForServiceName:(id)a3 completion:(id)a4;
- (void)registerEndpoint:(id)a3 forServiceName:(id)a4 withEntitlement:(id)a5 canReplace:(BOOL)a6 completion:(id)a7;
- (void)setListener:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRegistrations:(id)a3;
- (void)unregisterEndpointForServiceName:(id)a3 completion:(id)a4;
@end

@implementation IXATestAppRelayServer

+ (id)sharedServer
{
  if (qword_10001E1D8 != -1) {
    dispatch_once(&qword_10001E1D8, &stru_1000146E0);
  }
  return (id)qword_10001E1D0;
}

- (IXATestAppRelayServer)init
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___IXATestAppRelayServer;
  v2 = -[IXATestAppRelayServer init](&v17, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_UTILITY, 0);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.inputanalytics.testAppRelay", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v9 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.inputanalytics.testAppRelay");
    listener = v2->_listener;
    v2->_listener = v9;

    -[NSXPCListener _setQueue:](v2->_listener, "_setQueue:", v2->_queue);
    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_listener, "resume");
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    registrations = v2->_registrations;
    v2->_registrations = (NSMutableDictionary *)v11;

    id v13 = IXATestAppRelayLog();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "The service was initialized.", v16, 2u);
    }
  }

  return v2;
}

- (void)dealloc
{
  registrations = self->_registrations;
  self->_registrations = 0LL;

  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", 0LL);
  -[NSXPCListener invalidate](self->_listener, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___IXATestAppRelayServer;
  -[IXATestAppRelayServer dealloc](&v4, "dealloc");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  if ((TI_IS_INTERNAL_INSTALL() & 1) == 0)
  {
    [v5 invalidate];
    id v6 = IXATestAppRelayLog();
    dispatch_queue_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10000ADD8();
    }
    goto LABEL_13;
  }

  if (v5) {
    [v5 auditToken];
  }
  else {
    memset(v15, 0, sizeof(v15));
  }
  if (!-[IXATestAppRelayServer _checkEntitlement:withAuditToken:]( self,  "_checkEntitlement:withAuditToken:",  @"com.apple.inputanalytics.testAppRelay",  v15))
  {
    [v5 invalidate];
    id v13 = IXATestAppRelayLog();
    dispatch_queue_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10000ADAC();
    }
LABEL_13:

    BOOL v12 = 0;
    goto LABEL_14;
  }

  id v8 = IXATestAppRelayLog();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v10 = [v5 processIdentifier];
    *(_DWORD *)buf = 67109120;
    unsigned int v17 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Accepting connection from client (pid=%d).",  buf,  8u);
  }

  [v5 setExportedObject:self];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___IXATestAppRelayProtocol));
  [v5 setExportedInterface:v11];

  [v5 resume];
  BOOL v12 = 1;
LABEL_14:

  return v12;
}

- (void)registerEndpoint:(id)a3 forServiceName:(id)a4 withEntitlement:(id)a5 canReplace:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = (void (**)(id, void))a7;
  if ((TI_IS_INTERNAL_INSTALL() & 1) == 0)
  {
    id v22 = IXATestAppRelayLog();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_10000ADD8();
    }
    goto LABEL_14;
  }

  if (!v12 || ![v13 length] || !objc_msgSend(v14, "length"))
  {
    id v24 = IXATestAppRelayLog();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_10000AE04();
    }
LABEL_14:

    v15[2](v15, 0LL);
    goto LABEL_15;
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[IXATestAppRelayServer registrations](self, "registrations"));
  unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:v13]);

  if (v17 && ([v17 canReplace] & 1) == 0)
  {
    id v25 = IXATestAppRelayLog();
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_10000AE30((uint64_t)v13, v26, v27, v28, v29, v30, v31, v32);
    }

    v15[2](v15, 0LL);
  }

  else
  {
    v18 = -[IXATestAppRelayRegistration initWithEndpoint:andEntitlement:canReplace:]( objc_alloc(&OBJC_CLASS___IXATestAppRelayRegistration),  "initWithEndpoint:andEntitlement:canReplace:",  v12,  v14,  v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[IXATestAppRelayServer registrations](self, "registrations"));
    [v19 setObject:v18 forKey:v13];

    id v20 = IXATestAppRelayLog();
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v33 = 138412290;
      id v34 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Registered endpoint for service name '%@'.",  (uint8_t *)&v33,  0xCu);
    }

    v15[2](v15, 1LL);
  }

LABEL_15:
}

- (void)unregisterEndpointForServiceName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  dispatch_queue_t v7 = (void (**)(void))a4;
  if ((TI_IS_INTERNAL_INSTALL() & 1) != 0)
  {
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[IXATestAppRelayServer registrations](self, "registrations"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v6]);

    if (v9)
    {
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 entitlement]);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
      id v12 = v11;
      if (v11) {
        [v11 auditToken];
      }
      else {
        memset(v27, 0, sizeof(v27));
      }
      unsigned __int8 v23 = -[IXATestAppRelayServer _checkEntitlement:withAuditToken:]( self,  "_checkEntitlement:withAuditToken:",  v10,  v27);

      if ((v23 & 1) != 0)
      {
        id v24 = (void *)objc_claimAutoreleasedReturnValue(-[IXATestAppRelayServer registrations](self, "registrations"));
        [v24 removeObjectForKey:v6];

        id v25 = IXATestAppRelayLog();
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v29 = v6;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Unregistered endpoint for service name '%@'.",  buf,  0xCu);
        }
      }

      else
      {
        id v26 = IXATestAppRelayLog();
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_10000AEF8();
        }
      }
    }

    else
    {
      id v15 = IXATestAppRelayLog();
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10000AE94((uint64_t)v6, v16, v17, v18, v19, v20, v21, v22);
      }
    }

    v7[2](v7);
  }

  else
  {
    id v13 = IXATestAppRelayLog();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10000ADD8();
    }

    v7[2](v7);
  }
}

- (void)fetchEndpointForServiceName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  dispatch_queue_t v7 = (void (**)(id, void *))a4;
  if ((TI_IS_INTERNAL_INSTALL() & 1) != 0)
  {
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[IXATestAppRelayServer registrations](self, "registrations"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v6]);

    if (v9)
    {
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 entitlement]);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
      id v12 = v11;
      if (v11) {
        [v11 auditToken];
      }
      else {
        memset(v27, 0, sizeof(v27));
      }
      unsigned __int8 v23 = -[IXATestAppRelayServer _checkEntitlement:withAuditToken:]( self,  "_checkEntitlement:withAuditToken:",  v10,  v27);

      id v24 = IXATestAppRelayLog();
      id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      v16 = v25;
      if ((v23 & 1) != 0)
      {
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v29 = v6;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Fetched endpoint for service name '%@'.",  buf,  0xCu);
        }

        id v26 = (void *)objc_claimAutoreleasedReturnValue([v9 endpoint]);
        v7[2](v7, v26);

        goto LABEL_18;
      }

      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_10000AEF8();
      }
    }

    else
    {
      id v15 = IXATestAppRelayLog();
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10000AE94((uint64_t)v6, v16, v17, v18, v19, v20, v21, v22);
      }
    }

    v7[2](v7, 0LL);
LABEL_18:

    goto LABEL_19;
  }

  id v13 = IXATestAppRelayLog();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_10000ADD8();
  }

  v7[2](v7, 0LL);
LABEL_19:
}

- (BOOL)_checkEntitlement:(id)a3 withAuditToken:(id *)a4
{
  id v5 = (__CFString *)a3;
  __int128 v6 = *(_OWORD *)&a4->var0[4];
  *(_OWORD *)cf.val = *(_OWORD *)a4->var0;
  *(_OWORD *)&cf.val[4] = v6;
  dispatch_queue_t v7 = SecTaskCreateWithAuditToken(0LL, &cf);
  if (v7)
  {
    BOOL v8 = v7;
    *(void *)cf.val = 0LL;
    v9 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v7, v5, (CFErrorRef *)&cf);
    if (v9)
    {
      unsigned int v10 = v9;
      CFTypeID v11 = CFGetTypeID(v9);
      BOOL v12 = v11 == CFBooleanGetTypeID() && CFBooleanGetValue(v10) != 0;
      CFRelease(v10);
    }

    else
    {
      if (*(void *)cf.val)
      {
        id v13 = IXATestAppRelayLog();
        id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_10000AF24((uint64_t)&cf, v14, v15, v16, v17, v18, v19, v20);
        }

        CFRelease(*(CFTypeRef *)cf.val);
      }

      BOOL v12 = 0;
    }

    CFRelease(v8);
  }

  else
  {
    BOOL v12 = 0;
  }

  return v12;
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

- (NSMutableDictionary)registrations
{
  return self->_registrations;
}

- (void)setRegistrations:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

  ;
}

@end