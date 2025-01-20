@interface CLGnssProviderAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetActiveGnssBands:(void *)a3;
- (BOOL)syncgetControlPlaneStatusReport:(CLGnssControlPlaneStatusReport *)a3;
- (BOOL)syncgetIonosphereParameters:(ThinShellIonosphereParameters *)a3;
- (CLGnssProviderAdapter)init;
- (void)addRhythmicGnssClient:(int)a3;
- (void)beginService;
- (void)cacheEmergencyAWDStatistics:(CLDaemonLocation *)a3;
- (void)emergencySettingsChange:(id)a3 withReason:(int)a4;
- (void)emergencyStateChange:(id)a3;
- (void)endService;
- (void)removeRhythmicGnssClient:(int)a3;
- (void)resetControlPlaneStatus;
- (void)shouldLockoutNilr:(BOOL)a3;
@end

@implementation CLGnssProviderAdapter

+ (BOOL)isSupported
{
  return 0;
}

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10199A638 != -1) {
    dispatch_once(&qword_10199A638, &stru_10186D170);
  }
  return (id)qword_10199A630;
}

- (CLGnssProviderAdapter)init
{
}

- (void)beginService
{
}

- (void)endService
{
}

- (void)resetControlPlaneStatus
{
}

- (BOOL)syncgetControlPlaneStatusReport:(CLGnssControlPlaneStatusReport *)a3
{
}

- (BOOL)syncgetActiveGnssBands:(void *)a3
{
}

- (void)cacheEmergencyAWDStatistics:(CLDaemonLocation *)a3
{
}

- (BOOL)syncgetIonosphereParameters:(ThinShellIonosphereParameters *)a3
{
  if (qword_101934880 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    v3 = (os_log_s *)qword_101934888;
    if (os_log_type_enabled((os_log_t)qword_101934888, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v7 = 0;
      __int16 v8 = 2082;
      v9 = "";
      __int16 v10 = 2082;
      v11 = "assert";
      __int16 v12 = 2081;
      v13 = "false";
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:Assertion failed, syncgetIonosphereParameters stub should not be called., event:%{p ublic, location:escape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x26u);
      if (qword_101934880 != -1) {
        dispatch_once(&qword_101934880, &stru_10186D190);
      }
    }

    v4 = (os_log_s *)qword_101934888;
    if (os_signpost_enabled((os_log_t)qword_101934888))
    {
      *(_DWORD *)buf = 68289539;
      int v7 = 0;
      __int16 v8 = 2082;
      v9 = "";
      __int16 v10 = 2082;
      v11 = "assert";
      __int16 v12 = 2081;
      v13 = "false";
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v4,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "Assertion failed, syncgetIonosphereParameters stub should not be called.",  "{msg%{public}.0s:Assertion failed, syncgetIonosphereParameters stub should not be called., event:%{p ublic, location:escape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x26u);
      if (qword_101934880 != -1) {
        dispatch_once(&qword_101934880, &stru_10186D190);
      }
    }

    unint64_t v5 = (os_log_s *)qword_101934888;
    if (os_log_type_enabled((os_log_t)qword_101934888, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v7 = 0;
      __int16 v8 = 2082;
      v9 = "";
      __int16 v10 = 2082;
      v11 = "assert";
      __int16 v12 = 2081;
      v13 = "false";
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:Assertion failed, syncgetIonosphereParameters stub should not be called., event:%{p ublic, location:escape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x26u);
    }

    abort_report_np( "%s:%d: assertion failure in %s",  "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Positioning/GPS/CLGnssProviderStub.mm",  81,  "-[CLGnssProviderAdapter syncgetIonosphereParameters:]");
LABEL_11:
    dispatch_once(&qword_101934880, &stru_10186D190);
  }

- (void)emergencyStateChange:(id)a3
{
}

- (void)emergencySettingsChange:(id)a3 withReason:(int)a4
{
}

- (void)shouldLockoutNilr:(BOOL)a3
{
}

- (void)addRhythmicGnssClient:(int)a3
{
}

- (void)removeRhythmicGnssClient:(int)a3
{
}

@end