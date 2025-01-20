@interface CDNotifydMonitor
+ (id)xpcDictionaryToFoundation:(id)a3;
- (CDNotifydMonitor)init;
@end

@implementation CDNotifydMonitor

+ (id)xpcDictionaryToFoundation:(id)a3
{
  id v3 = a3;
  string = xpc_dictionary_get_string(v3, (const char *)[@"Notification" UTF8String]);
  if (string)
  {
    v5 = string;
    uint64_t uint64 = xpc_dictionary_get_uint64(v3, (const char *)[@"_State" UTF8String]);
    v11[0] = @"Notification";
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v5));
    v11[1] = @"_State";
    v12[0] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  uint64));
    v12[1] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  2LL));
  }

  else
  {
    v9 = 0LL;
  }

  return v9;
}

- (CDNotifydMonitor)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CDNotifydMonitor;
  v2 = -[CDNotifydMonitor init](&v4, "init");
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100005FDC();
    }
    xpc_set_event_stream_handler("com.apple.notifyd.matching", &_dispatch_main_q, &stru_100008498);
  }

  return v2;
}

@end