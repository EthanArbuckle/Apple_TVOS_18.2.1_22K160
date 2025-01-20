@interface TIAutofillServer
+ (id)sharedAutofillServer;
- (BOOL)checkEntitlementForAddEntryStringWithAuditToken:(id *)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (OS_dispatch_queue)dispatchQueue;
- (TIAutofillServer)init;
- (void)dealloc;
@end

@implementation TIAutofillServer

+ (id)sharedAutofillServer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000467C;
  block[3] = &unk_100014728;
  block[4] = a1;
  if (qword_10001E220 != -1) {
    dispatch_once(&qword_10001E220, block);
  }
  return (id)qword_10001E218;
}

- (TIAutofillServer)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TIAutofillServer;
  v2 = -[TIAutofillServer init](&v11, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INTERACTIVE, 0);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.TextInput.autofill-server", v4);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc(&OBJC_CLASS___NSXPCListener);
    v8 = -[NSXPCListener initWithMachServiceName:](v7, "initWithMachServiceName:", TIAutofillServiceName);
    listener = v2->_listener;
    v2->_listener = v8;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener _setQueue:](v2->_listener, "_setQueue:", v2->_dispatchQueue);
    -[NSXPCListener resume](v2->_listener, "resume");
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TIAutofillServer;
  -[TIAutofillServer dealloc](&v3, "dealloc");
}

- (BOOL)checkEntitlementForAddEntryStringWithAuditToken:(id *)a3
{
  __int128 v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)cf.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&cf.val[4] = v3;
  v4 = SecTaskCreateWithAuditToken(0LL, &cf);
  if (!v4) {
    return 0;
  }
  dispatch_queue_t v5 = v4;
  *(void *)cf.val = 0LL;
  v6 = (const __CFBoolean *)SecTaskCopyValueForEntitlement( v4,  @"com.apple.TextInput.autofill-action",  (CFErrorRef *)&cf);
  if (v6)
  {
    v7 = v6;
    CFTypeID v8 = CFGetTypeID(v6);
    BOOL v9 = v8 == CFBooleanGetTypeID() && CFBooleanGetValue(v7) != 0;
    CFRelease(v7);
  }

  else
  {
    if (*(void *)cf.val)
    {
      if (TICanLogMessageAtLevel(0LL))
      {
        uint64_t v10 = TIOSLogFacility();
        objc_super v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          sub_10000AF8C(&cf, v11);
        }
      }

      CFRelease(*(CFTypeRef *)cf.val);
    }

    BOOL v9 = 0;
  }

  CFRelease(v5);
  return v9;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFTypeID v8 = v7;
  if (v7) {
    [v7 auditToken];
  }
  else {
    memset(v14, 0, sizeof(v14));
  }
  BOOL v9 = -[TIAutofillServer checkEntitlementForAddEntryStringWithAuditToken:]( self,  "checkEntitlementForAddEntryStringWithAuditToken:",  v14);
  if (v9)
  {
    uint64_t v10 = objc_alloc_init(&OBJC_CLASS___TIAutofillDataHandler);
    [v8 setExportedObject:v10];
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___TIAutofillReportCandidateSelectiontHandler));
    [v8 setExportedInterface:v11];

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TIAutofillServer dispatchQueue](self, "dispatchQueue"));
    [v8 _setQueue:v12];

    [v8 resume];
  }

  else
  {
    [v8 invalidate];
  }

  return v9;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void).cxx_destruct
{
}

@end