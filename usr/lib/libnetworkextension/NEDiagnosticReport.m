@interface NEDiagnosticReport
+ (void)logInternalError:(id)a3 subType:(id)a4 context:(id)a5;
@end

@implementation NEDiagnosticReport

+ (void)logInternalError:(id)a3 subType:(id)a4 context:(id)a5
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7 && v8)
  {
    [MEMORY[0x1896079D8] processInfo];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 processName];

    if (v11) {
      v12 = (__CFString *)v11;
    }
    else {
      v12 = @"<unknown>";
    }
    os_unfair_lock_lock((os_unfair_lock_t)&logInternalError_subType_context__lock);
    [(id)logInternalError_subType_context__timestampLoggedError timeIntervalSinceNow];
    if (v13 == 0.0 || fabs(v13) >= *(double *)&logInternalError_subType_context__frequencyLoggedError)
    {
      uint64_t v14 = [MEMORY[0x189603F50] date];
      v15 = (void *)logInternalError_subType_context__timestampLoggedError;
      logInternalError_subType_context__timestampLoggedError = v14;

      logInternalError_subType_context__frequencyLoggedError = 0x40F5180000000000LL;
      os_unfair_lock_unlock((os_unfair_lock_t)&logInternalError_subType_context__lock);
      ne_log_obj();
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 138412802;
        id v23 = v8;
        __int16 v24 = 2112;
        v25 = v12;
        __int16 v26 = 2112;
        id v27 = v9;
        _os_log_impl( &dword_187528000,  v16,  OS_LOG_TYPE_DEFAULT,  "NEDiagnosticReport - subType <%@> for %@ with context <%@>",  (uint8_t *)&v22,  0x20u);
      }

      id v17 = objc_alloc_init(MEMORY[0x189612A50]);
      v18 = v17;
      if (v17)
      {
        [v17 signatureWithDomain:@"NetworkExtension" type:v7 subType:v8 detectedProcess:v12 triggerThresholdValues:0];
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v19)
        {
          if (v9) {
            [v19 setObject:v9 forKeyedSubscript:*MEMORY[0x189612A58]];
          }
          [v18 snapshotWithSignature:v20 delay:0 events:0 payload:0 actions:&__block_literal_global reply:0.0];
        }

        else
        {
          ne_log_obj();
          v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v22) = 0;
            _os_log_error_impl( &dword_187528000,  v21,  OS_LOG_TYPE_ERROR,  "NEDiagnosticReport - failed to get signature",  (uint8_t *)&v22,  2u);
          }
        }
      }
    }

    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)&logInternalError_subType_context__lock);
    }
  }
}

void __55__NEDiagnosticReport_logInternalError_subType_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  ne_log_obj();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v2;
    _os_log_impl( &dword_187528000,  v3,  OS_LOG_TYPE_DEFAULT,  "NEDiagnosticReport - submission response = %@",  (uint8_t *)&v5,  0xCu);
  }

  [v2 objectForKeyedSubscript:@"success"];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v4 intValue] != 1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&logInternalError_subType_context__lock);
    logInternalError_subType_context__frequencyLoggedError = 0x40AC200000000000LL;
    os_unfair_lock_unlock((os_unfair_lock_t)&logInternalError_subType_context__lock);
  }
}

@end