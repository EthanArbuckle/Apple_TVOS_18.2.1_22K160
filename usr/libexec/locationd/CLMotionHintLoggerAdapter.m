@interface CLMotionHintLoggerAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLMotionHintLoggerAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
@end

@implementation CLMotionHintLoggerAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_1019A07C8 != -1) {
    dispatch_once(&qword_1019A07C8, &stru_1018A3FF0);
  }
  return (id)qword_1019A07C0;
}

- (CLMotionHintLoggerAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLMotionHintLoggerAdapter;
  return -[CLMotionHintLoggerAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLMotionHintLoggerProtocol,  &OBJC_PROTOCOL___CLMotionHintLoggerClientProtocol);
}

- (void)beginService
{
  uint64_t block = (uint64_t)_NSConcreteStackBlock;
  *(void *)v7 = 3221225472LL;
  *(void *)&v7[8] = sub_10121C92C;
  *(void *)&v7[16] = &unk_10181A288;
  *(void *)&v7[24] = -[CLMotionHintLoggerAdapter universe](self, "universe");
  if (qword_1019A07D0 != -1) {
    dispatch_once(&qword_1019A07D0, &block);
  }
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", qword_1019A07B8);
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
  {
    if (qword_1019349D0 != -1) {
      dispatch_once(&qword_1019349D0, &stru_1018A4120);
    }
    objc_super v3 = (os_log_s *)qword_1019349D8;
    if (os_log_type_enabled((os_log_t)qword_1019349D8, OS_LOG_TYPE_FAULT))
    {
      uint64_t block = 68289539LL;
      *(_WORD *)v7 = 2082;
      *(void *)&v7[2] = "";
      *(_WORD *)&v7[10] = 2082;
      *(void *)&v7[12] = "assert";
      *(_WORD *)&v7[20] = 2081;
      *(void *)&v7[22] = "__null != self.notifier";
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:Assertion failed, event:%{public, location:escape_only}s, condition:%{private, location:escape_only}s}",  (uint8_t *)&block,  0x26u);
      if (qword_1019349D0 != -1) {
        dispatch_once(&qword_1019349D0, &stru_1018A4120);
      }
    }

    v4 = (os_log_s *)qword_1019349D8;
    if (os_signpost_enabled((os_log_t)qword_1019349D8))
    {
      uint64_t block = 68289539LL;
      *(_WORD *)v7 = 2082;
      *(void *)&v7[2] = "";
      *(_WORD *)&v7[10] = 2082;
      *(void *)&v7[12] = "assert";
      *(_WORD *)&v7[20] = 2081;
      *(void *)&v7[22] = "__null != self.notifier";
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v4,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "Assertion failed",  "{msg%{public}.0s:Assertion failed, event:%{public, location:escape_only}s, condition:%{private, location:escape_only}s}",  (uint8_t *)&block,  0x26u);
      if (qword_1019349D0 != -1) {
        dispatch_once(&qword_1019349D0, &stru_1018A4120);
      }
    }

    unint64_t v5 = (os_log_s *)qword_1019349D8;
    if (os_log_type_enabled((os_log_t)qword_1019349D8, OS_LOG_TYPE_INFO))
    {
      uint64_t block = 68289539LL;
      *(_WORD *)v7 = 2082;
      *(void *)&v7[2] = "";
      *(_WORD *)&v7[10] = 2082;
      *(void *)&v7[12] = "assert";
      *(_WORD *)&v7[20] = 2081;
      *(void *)&v7[22] = "__null != self.notifier";
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:Assertion failed, event:%{public, location:escape_only}s, condition:%{private, location:escape_only}s}",  (uint8_t *)&block,  0x26u);
    }

    abort_report_np( "%s:%d: assertion failure in %s",  "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Motion/Utilities/CLMotionHintLogger.mm",  31,  "-[CLMotionHintLoggerAdapter beginService]");
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

+ (BOOL)isSupported
{
  return 1;
}

@end