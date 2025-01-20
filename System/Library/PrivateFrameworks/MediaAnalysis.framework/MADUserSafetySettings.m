@interface MADUserSafetySettings
+ (BOOL)isEnabledForTask:(__SecTask *)a3;
+ (BOOL)isTaskEntitled:(__SecTask *)a3;
+ (id)_bundleIDForTask:(__SecTask *)a3;
+ (id)_servicesForTask:(__SecTask *)a3;
+ (id)_valuesForEntitlement:(__CFString *)a3 expectedElementClass:(Class)a4 task:(__SecTask *)a5;
+ (unint64_t)policyForTask:(__SecTask *)a3;
@end

@implementation MADUserSafetySettings

+ (id)_valuesForEntitlement:(__CFString *)a3 expectedElementClass:(Class)a4 task:(__SecTask *)a5
{
  CFErrorRef error = 0LL;
  CFTypeRef v7 = SecTaskCopyValueForEntitlement(a5, a3, &error);
  v40 = (void *)v7;
  if (!error)
  {
    if (v7)
    {
      if ((objc_opt_isKindOfClass(v7, a4) & 1) != 0)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v40));
        goto LABEL_29;
      }

      uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSArray);
      uint64_t isKindOfClass = objc_opt_isKindOfClass(v40, v15);
      if ((isKindOfClass & 1) != 0)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
        __int128 v43 = 0u;
        __int128 v44 = 0u;
        __int128 v41 = 0u;
        __int128 v42 = 0u;
        id v12 = v40;
        id v18 = [v12 countByEnumeratingWithState:&v41 objects:v46 count:16];
        if (v18)
        {
          uint64_t v19 = *(void *)v42;
          os_log_type_t v20 = VCPLogToOSLogType[4];
          do
          {
            for (i = 0LL; i != v18; i = (char *)i + 1)
            {
              if (*(void *)v42 != v19) {
                objc_enumerationMutation(v12);
              }
              uint64_t v22 = *(void *)(*((void *)&v41 + 1) + 8LL * (void)i);
              uint64_t v23 = objc_opt_isKindOfClass(v22, a4);
              if ((v23 & 1) != 0)
              {
                [v14 addObject:v22];
              }

              else
              {
                uint64_t v25 = MediaAnalysisLogLevel(v23, v24);
                if ((int)v25 >= 4)
                {
                  uint64_t v27 = VCPLogInstance(v25, v26);
                  v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
                  if (os_log_type_enabled(v28, v20))
                  {
                    v29 = (objc_class *)objc_opt_class(v22);
                    v30 = NSStringFromClass(v29);
                    v31 = (__CFError *)objc_claimAutoreleasedReturnValue(v30);
                    *(_DWORD *)buf = 138412546;
                    v48 = a3;
                    __int16 v49 = 2112;
                    CFErrorRef v50 = v31;
                    _os_log_impl( (void *)&_mh_execute_header,  v28,  v20,  "[UserSafety] Entitlement %@ has unexpected element type %@",  buf,  0x16u);
                  }
                }
              }
            }

            id v18 = [v12 countByEnumeratingWithState:&v41 objects:v46 count:16];
          }

          while (v18);
        }

        goto LABEL_6;
      }

      uint64_t v32 = MediaAnalysisLogLevel(isKindOfClass, v17);
      if ((int)v32 >= 4)
      {
        uint64_t v34 = VCPLogInstance(v32, v33);
        id v12 = (id)objc_claimAutoreleasedReturnValue(v34);
        os_log_type_t v35 = VCPLogToOSLogType[4];
        if (os_log_type_enabled((os_log_t)v12, v35))
        {
          v36 = (objc_class *)objc_opt_class(v40);
          v37 = NSStringFromClass(v36);
          v38 = (__CFError *)objc_claimAutoreleasedReturnValue(v37);
          *(_DWORD *)buf = 138412546;
          v48 = a3;
          __int16 v49 = 2112;
          CFErrorRef v50 = v38;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v12,  v35,  "[UserSafety] Entitlement %@ has unexpected type %@",  buf,  0x16u);
        }

        goto LABEL_5;
      }
    }

+ (id)_servicesForTask:(__SecTask *)a3
{
  v5 = (void *)objc_opt_class(a1);
  id v6 = [v5 _valuesForEntitlement:@"com.apple.sensitivecontentanalysis.service" expectedElementClass:objc_opt_class(NSString) task:a3];
  CFTypeRef v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (!v7)
  {
    uint64_t v9 = (void *)objc_opt_class(a1);
    id v10 = [v9 _valuesForEntitlement:@"com.apple.usersafety.service" expectedElementClass:objc_opt_class(NSString) task:a3];
    uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
    CFTypeRef v7 = (void *)v11;
    if (v11)
    {
      uint64_t v13 = MediaAnalysisLogLevel(v11, v12);
      if ((int)v13 >= 4)
      {
        uint64_t v15 = VCPLogInstance(v13, v14);
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        os_log_type_t v17 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v16, v17))
        {
          *(_WORD *)id v18 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  v17,  "[UserSafety] Client using deprecated com.apple.usersafety.service entitlement",  v18,  2u);
        }
      }
    }
  }

  return v7;
}

+ (id)_bundleIDForTask:(__SecTask *)a3
{
  CFErrorRef error = 0LL;
  v3 = (__CFString *)SecTaskCopySigningIdentifier(a3, &error);
  v5 = v3;
  if (error)
  {
    uint64_t v6 = MediaAnalysisLogLevel(v3, v4);
    if ((int)v6 >= 3)
    {
      uint64_t v8 = VCPLogInstance(v6, v7);
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      os_log_type_t v10 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v9, v10))
      {
        *(_DWORD *)buf = 138412290;
        CFErrorRef v15 = error;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  v10,  "[UserSafety] Failed to query client bundleID (%@)",  buf,  0xCu);
      }
    }

    uint64_t v11 = 0LL;
  }

  else
  {
    uint64_t v11 = v3;
  }

  sub_10000421C((const void **)&error);
  return v11;
}

+ (BOOL)isTaskEntitled:(__SecTask *)a3
{
  if ((int)MediaAnalysisLogLevel(a1, a2) >= 5)
  {
    uint64_t v3 = VCPLogInstance();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    os_log_type_t v5 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v4, v5))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "[UserSafety] Platform does support User Safety", v7, 2u);
    }
  }

  return 0;
}

+ (unint64_t)policyForTask:(__SecTask *)a3
{
  if ((int)MediaAnalysisLogLevel(a1, a2) >= 5)
  {
    uint64_t v3 = VCPLogInstance();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    os_log_type_t v5 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v4, v5))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "[UserSafety] Platform does support User Safety", v7, 2u);
    }
  }

  return 0LL;
}

+ (BOOL)isEnabledForTask:(__SecTask *)a3
{
  if ((int)MediaAnalysisLogLevel(a1, a2) >= 5)
  {
    uint64_t v3 = VCPLogInstance();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    os_log_type_t v5 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v4, v5))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "[UserSafety] Platform does support User Safety", v7, 2u);
    }
  }

  return 0;
}

@end