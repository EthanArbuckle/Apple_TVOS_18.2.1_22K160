@interface CLIntersiloDelegate
- (BOOL)valid;
- (void)setValid:(BOOL)a3;
@end

@implementation CLIntersiloDelegate

- (BOOL)valid
{
  return 1;
}

- (void)setValid:(BOOL)a3
{
  if (qword_101934980 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    v3 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v7 = 0;
      __int16 v8 = 2082;
      v9 = "";
      __int16 v10 = 2082;
      v11 = "assert";
      __int16 v12 = 2081;
      v13 = "false";
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:This delegate cannot be invalidated, event:%{public, location:escape_only}s, cond ition:%{private, location:escape_only}s}",  buf,  0x26u);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_1018A2D08);
      }
    }

    v4 = (os_log_s *)qword_101934988;
    if (os_signpost_enabled((os_log_t)qword_101934988))
    {
      *(_DWORD *)buf = 68289539;
      int v7 = 0;
      __int16 v8 = 2082;
      v9 = "";
      __int16 v10 = 2082;
      v11 = "assert";
      __int16 v12 = 2081;
      v13 = "false";
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v4,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "This delegate cannot be invalidated",  "{msg%{public}.0s:This delegate cannot be invalidated, event:%{public, location:escape_only}s, cond ition:%{private, location:escape_only}s}",  buf,  0x26u);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_1018A2D08);
      }
    }

    v5 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v7 = 0;
      __int16 v8 = 2082;
      v9 = "";
      __int16 v10 = 2082;
      v11 = "assert";
      __int16 v12 = 2081;
      v13 = "false";
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:This delegate cannot be invalidated, event:%{public, location:escape_only}s, cond ition:%{private, location:escape_only}s}",  buf,  0x26u);
    }

    abort_report_np( "%s:%d: assertion failure in %s",  "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Core/ClientManagement/CLInternalService.mm",  173,  "-[CLIntersiloDelegate setValid:]");
LABEL_11:
    dispatch_once(&qword_101934980, &stru_1018A2D08);
  }

@end