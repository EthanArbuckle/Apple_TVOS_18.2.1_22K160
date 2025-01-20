@interface CNXPCActivity
+ (const)activityIdentifier;
+ (id)_stringFromXPCActivityState:(int64_t)a3;
+ (void)registerActivity;
+ (void)run;
@end

@implementation CNXPCActivity

+ (void)registerActivity
{
  v3 = (const char *)[a1 activityIdentifier];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100009708;
  handler[3] = &unk_100018C70;
  v6 = -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", v3);
  v7 = v3;
  id v8 = a1;
  v4 = v6;
  xpc_activity_register(v3, XPC_ACTIVITY_CHECK_IN, handler);
}

+ (id)_stringFromXPCActivityState:(int64_t)a3
{
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[CNContactsDaemonLogs xpc](&OBJC_CLASS___CNContactsDaemonLogs, "xpc"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10000E258(a3, v5);
  }

  return 0LL;
}

+ (const)activityIdentifier
{
  uint64_t v2 = CNUnimplementedMethodException(a1, a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue(v2);
  objc_exception_throw(v3);
  +[CNXPCActivity run](v4, v5);
  return result;
}

+ (void)run
{
  uint64_t v2 = CNUnimplementedMethodException(a1, a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue(v2);
  objc_exception_throw(v3);
  sub_10000993C();
}

@end