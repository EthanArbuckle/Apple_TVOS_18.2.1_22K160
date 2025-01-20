@interface CLNotifierClientAdapter
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)valid;
- (CLNotifierClientAdapter)init;
- (CLNotifierClientAdapter)initWithClient:(CLNotifierClientBase *)a3;
- (NSString)debugDescription;
- (void)invalidate;
- (void)onNotification:(int)a3 withData:(id)a4;
- (void)setValid:(BOOL)a3;
@end

@implementation CLNotifierClientAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

- (CLNotifierClientAdapter)init
{
  if (qword_1019349D0 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    v2 = (os_log_s *)qword_1019349D8;
    if (os_log_type_enabled((os_log_t)qword_1019349D8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      v8 = "";
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "0";
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:Assertion failed, event:%{public, location:escape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x26u);
      if (qword_1019349D0 != -1) {
        dispatch_once(&qword_1019349D0, &stru_101890A20);
      }
    }

    v3 = (os_log_s *)qword_1019349D8;
    if (os_signpost_enabled((os_log_t)qword_1019349D8))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      v8 = "";
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "0";
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v3,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "Assertion failed",  "{msg%{public}.0s:Assertion failed, event:%{public, location:escape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x26u);
      if (qword_1019349D0 != -1) {
        dispatch_once(&qword_1019349D0, &stru_101890A20);
      }
    }

    v4 = (os_log_s *)qword_1019349D8;
    if (os_log_type_enabled((os_log_t)qword_1019349D8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      v8 = "";
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "0";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:Assertion failed, event:%{public, location:escape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x26u);
    }

    abort_report_np( "%s:%d: assertion failure in %s",  "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Shared/Utilities/CLNotifierClientAdapter.mm",  25,  "-[CLNotifierClientAdapter init]");
LABEL_11:
    dispatch_once(&qword_1019349D0, &stru_101890A20);
  }

- (CLNotifierClientAdapter)initWithClient:(CLNotifierClientBase *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CLNotifierClientAdapter;
  v4 = -[CLNotifierClientAdapter init](&v7, "init");
  unint64_t v5 = v4;
  if (v4) {
    v4->_client = a3;
  }
  -[CLNotifierClientAdapter setValid:](v4, "setValid:", 1LL);
  return v5;
}

- (void)invalidate
{
  self->_client = 0LL;
}

- (void)onNotification:(int)a3 withData:(id)a4
{
  client = self->_client;
  if (!client) {
    sub_10127BBA0();
  }
  (*((void (**)(CLNotifierClientBase *, void, id))client->var0 + 2))(client, *(void *)&a3, a4);
}

- (NSString)debugDescription
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLNotifierClientAdapter;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@\nCLNotifierClientBase: %p",  -[CLNotifierClientAdapter debugDescription](&v3, "debugDescription"),  self->_client);
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end