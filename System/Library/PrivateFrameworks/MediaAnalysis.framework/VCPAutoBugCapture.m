@interface VCPAutoBugCapture
+ (BOOL)captureCrashWithKnownTimeoutRisk:(unint64_t)a3;
+ (BOOL)captureTimeoutCrashWithSubType:(id)a3;
+ (id)timeoutSubTypeForKnownTimeoutRisk:(unint64_t)a3;
@end

@implementation VCPAutoBugCapture

+ (id)timeoutSubTypeForKnownTimeoutRisk:(unint64_t)a3
{
  v3 = @"CoreML";
  if (a3 != 3) {
    v3 = 0LL;
  }
  if (a3 == 1) {
    return @"Photos";
  }
  else {
    return (id)v3;
  }
}

+ (BOOL)captureCrashWithKnownTimeoutRisk:(unint64_t)a3
{
  int v3 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "timeoutSubTypeForKnownTimeoutRisk:"));
  if (v6)
  {
    unsigned __int8 v7 = [a1 captureTimeoutCrashWithSubType:v6];
  }

  else
  {
    uint64_t v8 = MediaAnalysisLogLevel(0LL, v5);
    if ((int)v8 >= 3)
    {
      uint64_t v10 = VCPLogInstance(v8, v9);
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      os_log_type_t v12 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v11, v12))
      {
        v14[0] = 67109120;
        v14[1] = v3;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  v12,  "[VCPAutoBugCapture] unknown bug type: %d",  (uint8_t *)v14,  8u);
      }
    }

    unsigned __int8 v7 = 0;
  }

  return v7;
}

+ (BOOL)captureTimeoutCrashWithSubType:(id)a3
{
  return 0;
}

@end