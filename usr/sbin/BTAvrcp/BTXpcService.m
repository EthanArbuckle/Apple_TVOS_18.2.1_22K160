@interface BTXpcService
- (BTXpcService)init;
- (BTXpcService)initWithName:(const char *)a3 sessionClass:(Class)a4;
- (Class)sessionClass;
- (OS_xpc_object)server;
- (const)name;
- (void)_handleConnection:(id)a3;
- (void)_handleEvent:(id)a3;
@end

@implementation BTXpcService

- (BTXpcService)init
{
  v3 = [NSString stringWithUTF8String:@""];
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"Calling %@ is not allowed",  v3);

  return 0LL;
}

- (BTXpcService)initWithName:(const char *)a3 sessionClass:(Class)a4
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___BTXpcService;
  v6 = -[BTXpcService init](&v17, "init");
  if (!v6) {
    return 0LL;
  }
  v7 = (xpc_connection_t *)v6;
  v6->_name = a3;
  objc_storeStrong((id *)&v6->_sessionClass, a4);
  xpc_connection_t mach_service = xpc_connection_create_mach_service(a3, &_dispatch_main_q, 1uLL);
  xpc_connection_t v9 = v7[3];
  v7[3] = mach_service;

  v10 = v7[3];
  if (v10)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100003C4C;
    handler[3] = &unk_1000187D0;
    v11 = v7;
    v16 = v11;
    xpc_connection_set_event_handler(v10, handler);
    xpc_connection_resume(v7[3]);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  0LL,  (CFNotificationCallback)sub_100003C58,  @"com.apple.language.changed",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
    v7 = (xpc_connection_t *)v16;
  }

  else
  {
    v13 = (os_log_s *)qword_10001F1C0;
    if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_FAULT)) {
      sub_10000FC18(v13);
    }
    v11 = 0LL;
  }

  return v11;
}

- (void)_handleEvent:(id)a3
{
  id v4 = a3;
  xpc_type_t type = xpc_get_type(v4);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    -[BTXpcService _handleConnection:](self, "_handleConnection:", v4);
  }

  else
  {
    xpc_type_t v6 = type;
    v7 = (os_log_s *)qword_10001F1C0;
    BOOL v8 = os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_ERROR);
    if (v6 == (xpc_type_t)&_xpc_type_error)
    {
      if (v8) {
        sub_10000FC58((uint64_t)v4, v7, v9, v10, v11, v12, v13, v14);
      }
    }

    else if (v8)
    {
      sub_10000FCC0((uint64_t)v4, v7, v9, v10, v11, v12, v13, v14);
    }
  }
}

- (void)_handleConnection:(id)a3
{
  id v4 = (_xpc_connection_s *)a3;
  v5 = (void *)xpc_connection_copy_entitlement_value(v4, -[BTXpcService name](self, "name"));
  xpc_type_t v6 = v5;
  if (v5 && xpc_get_type(v5) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v6))
  {
  }

  else
  {
    v7 = (os_log_s *)qword_10001F1C0;
    if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_ERROR)) {
      sub_10000FD28(v7);
    }
    xpc_connection_cancel(v4);
  }
}

- (const)name
{
  return self->_name;
}

- (Class)sessionClass
{
  return self->_sessionClass;
}

- (OS_xpc_object)server
{
  return self->_server;
}

- (void).cxx_destruct
{
}

@end