@interface CLStreamedLocationProviderAssertion
- (CLStreamedLocationProviderProtocol)proxy;
- (id)initInUniverse:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)releaseAssertion;
- (void)setProxy:(id)a3;
- (void)takeAssertion;
@end

@implementation CLStreamedLocationProviderAssertion

- (id)initInUniverse:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CLStreamedLocationProviderAssertion;
  v4 = -[CLStreamedLocationProviderAssertion init](&v6, "init");
  if (v4)
  {
    -[CLStreamedLocationProviderAssertion setProxy:]( v4,  "setProxy:",  objc_msgSend(objc_msgSend(a3, "vendor"), "proxyForService:", @"CLStreamedLocationProvider"));
    -[CLStreamedLocationProviderAssertion takeAssertion](v4, "takeAssertion");
  }

  return v4;
}

- (void)invalidate
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLStreamedLocationProviderAssertion;
  -[CLStreamedLocationProviderAssertion dealloc](&v3, "dealloc");
}

- (void)takeAssertion
{
  if (qword_101934990 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    v2 = (os_log_s *)qword_101934998;
    if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      v8 = "";
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "false";
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:Must be overridden, event:%{public, location:escape_only}s, condition:%{private , location:escape_only}s}",  buf,  0x26u);
      if (qword_101934990 != -1) {
        dispatch_once(&qword_101934990, &stru_10182C2F8);
      }
    }

    objc_super v3 = (os_log_s *)qword_101934998;
    if (os_signpost_enabled((os_log_t)qword_101934998))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      v8 = "";
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "false";
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v3,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "Must be overridden",  "{msg%{public}.0s:Must be overridden, event:%{public, location:escape_only}s, condition:%{private , location:escape_only}s}",  buf,  0x26u);
      if (qword_101934990 != -1) {
        dispatch_once(&qword_101934990, &stru_10182C2F8);
      }
    }

    v4 = (os_log_s *)qword_101934998;
    if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      v8 = "";
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "false";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:Must be overridden, event:%{public, location:escape_only}s, condition:%{private , location:escape_only}s}",  buf,  0x26u);
    }

    abort_report_np( "%s:%d: assertion failure in %s",  "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Shared/Streaming/CLStreamedLocationProvider.mm",  932,  "-[CLStreamedLocationProviderAssertion takeAssertion]");
LABEL_11:
    dispatch_once(&qword_101934990, &stru_10182C2F8);
  }

- (void)releaseAssertion
{
  if (qword_101934990 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    v2 = (os_log_s *)qword_101934998;
    if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      v8 = "";
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "false";
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:Must be overridden, event:%{public, location:escape_only}s, condition:%{private , location:escape_only}s}",  buf,  0x26u);
      if (qword_101934990 != -1) {
        dispatch_once(&qword_101934990, &stru_10182C2F8);
      }
    }

    objc_super v3 = (os_log_s *)qword_101934998;
    if (os_signpost_enabled((os_log_t)qword_101934998))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      v8 = "";
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "false";
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v3,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "Must be overridden",  "{msg%{public}.0s:Must be overridden, event:%{public, location:escape_only}s, condition:%{private , location:escape_only}s}",  buf,  0x26u);
      if (qword_101934990 != -1) {
        dispatch_once(&qword_101934990, &stru_10182C2F8);
      }
    }

    v4 = (os_log_s *)qword_101934998;
    if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      v8 = "";
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "false";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:Must be overridden, event:%{public, location:escape_only}s, condition:%{private , location:escape_only}s}",  buf,  0x26u);
    }

    abort_report_np( "%s:%d: assertion failure in %s",  "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Shared/Streaming/CLStreamedLocationProvider.mm",  937,  "-[CLStreamedLocationProviderAssertion releaseAssertion]");
LABEL_11:
    dispatch_once(&qword_101934990, &stru_10182C2F8);
  }

- (CLStreamedLocationProviderProtocol)proxy
{
  return self->_proxy;
}

- (void)setProxy:(id)a3
{
}

@end