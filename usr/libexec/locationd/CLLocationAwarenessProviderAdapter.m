@interface CLLocationAwarenessProviderAdapter
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLLocationAwarenessProviderAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)onScenarioTrigger:(id)a3;
@end

@implementation CLLocationAwarenessProviderAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10199DDC8 != -1) {
    dispatch_once(&qword_10199DDC8, &stru_101880488);
  }
  return (id)qword_10199DDC0;
}

- (CLLocationAwarenessProviderAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLLocationAwarenessProviderAdapter;
  return -[CLLocationAwarenessProviderAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLLocationAwarenessProviderProtocol,  &OBJC_PROTOCOL___CLLocationAwarenessProviderClientProtocol);
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier")) {
    sub_10126C33C();
  }
}

- (void)endService
{
  v2 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  (*((void (**)(CLNotifierBase *))v2->var0 + 2))(v2);
}

- (void)adaptee
{
  result = -[CLNotifierServiceAdapter notifier](self, "notifier");
  if (result) {
  return result;
  }
}

- (void)doAsync:(id)a3
{
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

- (void)onScenarioTrigger:(id)a3
{
  if ((objc_opt_isKindOfClass(a3, v5) & 1) != 0)
  {
    v6 = -[CLLocationAwarenessProviderAdapter adaptee](self, "adaptee");
    int v7 = 1;
LABEL_5:
    sub_100D3159C((uint64_t)v6, v7);
    return;
  }

  objc_opt_class(&OBJC_CLASS___RTScenarioTriggerUnsettled);
  if ((objc_opt_isKindOfClass(a3, v8) & 1) != 0)
  {
    v6 = -[CLLocationAwarenessProviderAdapter adaptee](self, "adaptee");
    int v7 = 0;
    goto LABEL_5;
  }

  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_101880630);
  }
  v9 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
  {
    *(void *)&double v10 = objc_opt_class(a3).n128_u64[0];
    int v16 = 68289283;
    int v17 = 0;
    __int16 v18 = 2082;
    v19 = "";
    __int16 v20 = 2081;
    id v21 = objc_msgSend(objc_msgSend(v11, "description", v10), "UTF8String");
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#Awareness Received unexpected Routine notification, triggerClass:%{private, location:escape_only}s}",  (uint8_t *)&v16,  0x1Cu);
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101880630);
    }
  }

  v12 = (os_log_s *)qword_101934988;
  if (os_signpost_enabled((os_log_t)qword_101934988))
  {
    *(void *)&double v13 = objc_opt_class(a3).n128_u64[0];
    id v15 = objc_msgSend(objc_msgSend(v14, "description", v13), "UTF8String");
    int v16 = 68289283;
    int v17 = 0;
    __int16 v18 = 2082;
    v19 = "";
    __int16 v20 = 2081;
    id v21 = v15;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v12,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#Awareness Received unexpected Routine notification",  "{msg%{public}.0s:#Awareness Received unexpected Routine notification, triggerClass:%{private, location:escape_only}s}",  (uint8_t *)&v16,  0x1Cu);
  }

@end