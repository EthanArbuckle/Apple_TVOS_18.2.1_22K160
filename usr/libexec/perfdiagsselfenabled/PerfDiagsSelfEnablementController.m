@interface PerfDiagsSelfEnablementController
+ (BOOL)getKillSwitchSettingForPrefix:(id)a3;
+ (BOOL)hasTimeoutExpiredForPrefix:(id)a3;
+ (BOOL)isAnyModeActive;
+ (double)getTimeoutForPrefix:(id)a3;
+ (id)clientClasses;
+ (id)timeoutPrefNameForPrefix:(id)a3;
+ (void)evaluateSelfEnablement;
@end

@implementation PerfDiagsSelfEnablementController

+ (BOOL)isAnyModeActive
{
  v17[0] = @"PDSEHangTracer";
  v17[1] = @"PDSEHTThirdParty";
  v17[2] = @"PDSESentry";
  v17[3] = @"PDSEAppLaunch";
  v17[4] = @"PDSEWorkflowResponsiveness";
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 5LL));
  id v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    id v4 = v3;
    char v5 = 0;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        v8 = sub_100001F60(@"com.apple.da", @"mobile", *(void *)(*((void *)&v12 + 1) + 8LL * (void)i));
        v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
        id v10 = objc_msgSend(v9, "count", (void)v12);

        v5 |= v10 != 0LL;
      }

      id v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v4);
  }

  else
  {
    char v5 = 0;
  }

  return v5 & 1;
}

+ (id)clientClasses
{
  if (qword_10001A368 != -1) {
    dispatch_once(&qword_10001A368, &stru_1000146F8);
  }
  return (id)qword_10001A360;
}

+ (void)evaluateSelfEnablement
{
  id v2 = a1;
  uint64_t v97 = tailspin_config_create_with_default_config(a1, a2);
  __int128 v130 = 0u;
  __int128 v131 = 0u;
  __int128 v132 = 0u;
  __int128 v133 = 0u;
  id v3 = (__CFString *)objc_claimAutoreleasedReturnValue([v2 clientClasses]);
  id v4 = -[__CFString countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v130,  v140,  16LL);
  if (!v4)
  {

    id v24 = 0LL;
LABEL_26:
    __int128 v122 = 0u;
    __int128 v123 = 0u;
    __int128 v120 = 0u;
    __int128 v121 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue([v2 clientClasses]);
    id v105 = [obj countByEnumeratingWithState:&v120 objects:v138 count:16];
    if (!v105) {
      goto LABEL_107;
    }
    uint64_t v25 = 0LL;
    v26 = (mach_header_64 *)&_mh_execute_header;
    uint64_t v103 = *(void *)v121;
    while (1)
    {
      v27 = 0LL;
      do
      {
        if (*(void *)v121 != v103) {
          objc_enumerationMutation(obj);
        }
        v28 = *(void **)(*((void *)&v120 + 1) + 8LL * (void)v27);
        v29 = (__CFString *)objc_claimAutoreleasedReturnValue([v28 prefixForDefaults]);
        unsigned int v30 = [v2 getKillSwitchSettingForPrefix:v29];
        int v31 = DiagnosticLogSubmissionEnabled();
        id v32 = sub_10000AC04();
        v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138413058;
          v135 = v29;
          __int16 v136 = 1024;
          *(_DWORD *)v137 = v30;
          *(_WORD *)&v137[4] = 1024;
          *(_DWORD *)&v137[6] = v31;
          *(_WORD *)&v137[10] = 1024;
          *(_DWORD *)&v137[12] = v25 & 1;
          _os_log_impl( v26,  v33,  OS_LOG_TYPE_DEFAULT,  "PDSE: evaluateSelfEnablement %@: kill switch setting = %{BOOL}i, diagCollectionEnable = %{BOOL}i, haveEnable dClientAlready = %{BOOL}i",  buf,  0x1Eu);
        }

        char v34 = v30 | ~(_BYTE)v31;
        else {
          char v35 = v34;
        }
        char v36 = v35 | v25;
        id v37 = sub_10000AC04();
        v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
        BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT);
        if ((v36 & 1) != 0)
        {
          if (v39)
          {
            *(_DWORD *)buf = 138412290;
            v135 = v29;
            _os_log_impl( v26,  v38,  OS_LOG_TYPE_DEFAULT,  "PDSE: evaluateSelfEnablement %@: shouldDisable == TRUE, do not enable today",  buf,  0xCu);
          }

          unsigned int v40 = 0;
        }

        else
        {
          if (v39)
          {
            *(_DWORD *)buf = 138412290;
            v135 = v29;
            _os_log_impl( v26,  v38,  OS_LOG_TYPE_DEFAULT,  "PDSE: evaluateSelfEnablement %@: calling client's to determine if it wantsEnablement",  buf,  0xCu);
          }

          unsigned int v40 = [v28 wantsEnablement];
          id v41 = sub_10000AC04();
          v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v42 = @"NO";
            if (v40) {
              v42 = @"YES";
            }
            v135 = v29;
            __int16 v136 = 2112;
            *(void *)v137 = v42;
            _os_log_impl( v26,  v38,  OS_LOG_TYPE_DEFAULT,  "PDSE: evaluateSelfEnablement %@: client's wantsEnablement returned %@",  buf,  0x16u);
          }
        }

        v43 = sub_100001F60(@"com.apple.da", @"mobile", (uint64_t)v29);
        v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
        id v45 = [v44 count];

        id v46 = sub_10000AC04();
        v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138413058;
          v135 = v29;
          __int16 v136 = 1024;
          *(_DWORD *)v137 = v45 != 0LL;
          *(_WORD *)&v137[4] = 2048;
          *(void *)&v137[6] = v45;
          *(_WORD *)&v137[14] = 2112;
          *(void *)&v137[16] = v29;
          _os_log_impl( v26,  v47,  OS_LOG_TYPE_DEFAULT,  "PDSE: evaluateSelfEnablement %@: client enabled state = %{BOOL}i, found %lu settings with prefix %@",  buf,  0x26u);
        }

        if (v45) {
          char v48 = 1;
        }
        else {
          char v48 = v40;
        }
        if ((v48 & 1) == 0)
        {
          id v49 = sub_10000AC04();
          v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
          if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v135 = v29;
            _os_log_impl( v26,  v50,  OS_LOG_TYPE_INFO,  "PDSE: evaluateSelfEnablement %@: Transition from Disable to Disable",  buf,  0xCu);
          }

          j__ADClientAddValueForScalarKey( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.pdse.%@.DisableToDisable",  v29),  1LL);
          v118[0] = _NSConcreteStackBlock;
          v118[1] = 3221225472LL;
          v118[2] = sub_1000039A8;
          v118[3] = &unk_100014720;
          v119 = v29;
          AnalyticsSendEventLazy(@"com.apple.perfdiagsselfenable.transition", v118);
        }

        uint64_t v51 = (uint64_t)v24;
        uint64_t v52 = v25;
        v53 = v26;
        int v54 = v40 ^ 1;
        if (v45 || (v54 & 1) != 0)
        {
          BOOL v68 = v45 == 0LL;
          if (v45) {
            char v69 = v40;
          }
          else {
            char v69 = 1;
          }
          if ((v69 & 1) == 0)
          {
            id v70 = sub_10000AC04();
            v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
            if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v135 = v29;
              _os_log_impl( v53,  v71,  OS_LOG_TYPE_DEFAULT,  "PDSE: evaluateSelfEnablement %@: Transition from Enable to Disable",  buf,  0xCu);
            }

            j__ADClientAddValueForScalarKey( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.pdse.%@.EnableToDisable",  v29),  1LL);
            CFPreferencesSetValue( (CFStringRef)[v2 timeoutPrefNameForPrefix:v29],  0,  @"com.apple.da",  @"mobile",  kCFPreferencesAnyHost);
            unsigned __int8 v72 = [v28 didDisableDiagnostics];
            id v73 = sub_10000AC04();
            v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
            BOOL v75 = os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT);
            if ((v72 & 1) != 0)
            {
              if (v75)
              {
                *(_DWORD *)buf = 138412290;
                v135 = v29;
                _os_log_impl( v53,  v74,  OS_LOG_TYPE_DEFAULT,  "PDSE: evaluateSelfEnablement %@: Successful Transition from Enable to Disable",  buf,  0xCu);
              }
            }

            else
            {
              if (v75)
              {
                *(_DWORD *)buf = 138412290;
                v135 = v29;
                _os_log_impl( v53,  v74,  OS_LOG_TYPE_DEFAULT,  "PDSE: evaluateSelfEnablement %@: FAILED Transition from Enable to Disable",  buf,  0xCu);
              }

              j__ADClientAddValueForScalarKey( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.pdse.%@.EnableToDisable.Failed",  v29),  1LL);
            }

            v113[0] = _NSConcreteStackBlock;
            v113[1] = 3221225472LL;
            v113[2] = sub_100003AF0;
            v113[3] = &unk_100014748;
            v114 = v29;
            unsigned __int8 v115 = v72;
            AnalyticsSendEventLazy(@"com.apple.perfdiagsselfenable.transition", v113);

            BOOL v68 = 0;
            uint64_t v51 = 1LL;
          }

          if (((v68 | v54) & 1) != 0)
          {
            v26 = v53;
            uint64_t v25 = v52;
            id v24 = (id)v51;
            if (!v40) {
              goto LABEL_88;
            }
            goto LABEL_96;
          }

          id v79 = sub_10000AC04();
          v80 = (os_log_s *)objc_claimAutoreleasedReturnValue(v79);
          v26 = v53;
          if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v135 = v29;
            _os_log_impl( v53,  v80,  OS_LOG_TYPE_INFO,  "PDSE: evaluateSelfEnablement %@: Transition from Enable to Enable",  buf,  0xCu);
          }

          j__ADClientAddValueForScalarKey( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.pdse.%@.EnableToEnable",  v29),  1LL);
          v112[0] = _NSConcreteStackBlock;
          v112[1] = 3221225472LL;
          v112[2] = sub_100003BB4;
          v112[3] = &unk_100014720;
          v112[4] = v29;
          v76 = v112;
          uint64_t v25 = v52;
          id v24 = (id)v51;
        }

        else
        {
          id v55 = sub_10000AC04();
          v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
          v26 = v53;
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v135 = v29;
            __int16 v136 = 2112;
            *(void *)v137 = v29;
            _os_log_impl( v53,  v56,  OS_LOG_TYPE_DEFAULT,  "PDSE: evaluateSelfEnablement %@: Transition from Disable to Enable, calling %@'s willEnableDiagnostics",  buf,  0x16u);
          }

          j__ADClientAddValueForScalarKey( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.pdse.%@.DisableToEnable",  v29),  1LL);
          [v28 timeoutDurationSec];
          if (v57 <= 432000.0) {
            double v58 = v57;
          }
          else {
            double v58 = 432000.0;
          }
          v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
          [v59 timeIntervalSinceReferenceDate];
          double v61 = v58 + v60;

          CFPreferencesSetValue( (CFStringRef)[v2 timeoutPrefNameForPrefix:v29],  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v61),  @"com.apple.da",  @"mobile",  kCFPreferencesAnyHost);
          id v62 = sub_10000AC04();
          v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
          uint64_t v25 = v52;
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
          {
            v64 = (void *)objc_claimAutoreleasedReturnValue([v2 timeoutPrefNameForPrefix:v29]);
            *(_DWORD *)buf = 138413058;
            v135 = v29;
            __int16 v136 = 2112;
            *(void *)v137 = v64;
            *(_WORD *)&v137[8] = 2048;
            *(double *)&v137[10] = v61;
            *(_WORD *)&v137[18] = 2048;
            *(double *)&v137[20] = v58;
            _os_log_impl( v26,  v63,  OS_LOG_TYPE_DEFAULT,  "PDSE: evaluateSelfEnablement %@: set setting %@ to %f secs_after_ref_date, which is %f seconds in the future",  buf,  0x2Au);
          }

          id v24 = [v28 willEnableDiagnostics];
          id v65 = sub_10000AC04();
          v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
          BOOL v67 = os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT);
          if ((_DWORD)v24)
          {
            if (v67)
            {
              *(_DWORD *)buf = 138412290;
              v135 = v29;
              _os_log_impl( v26,  v66,  OS_LOG_TYPE_DEFAULT,  "PDSE: evaluateSelfEnablement %@: Successful Transition from Disable to Enable",  buf,  0xCu);
            }
          }

          else
          {
            if (v67)
            {
              *(_DWORD *)buf = 138412290;
              v135 = v29;
              _os_log_impl( v26,  v66,  OS_LOG_TYPE_DEFAULT,  "PDSE: evaluateSelfEnablement %@: FAILED Transition from Disable to Enable",  buf,  0xCu);
            }

            j__ADClientAddValueForScalarKey( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.pdse.%@.DisableToEnable.Failed",  v29),  1LL);
          }

          v116[0] = _NSConcreteStackBlock;
          v116[1] = 3221225472LL;
          v116[2] = sub_100003A2C;
          v116[3] = &unk_100014748;
          v116[4] = v29;
          char v117 = (char)v24;
          v76 = v116;
        }

        AnalyticsSendEventLazy(@"com.apple.perfdiagsselfenable.transition", v76);

        if (!v40)
        {
LABEL_88:
          j__ADClientSetValueForScalarKey( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.pdse.%@.EnableToday",  v29),  0LL);
          uint64_t v77 = 0LL;
LABEL_89:
          j__ADClientSetValueForScalarKey(@"com.apple.hangtracer.HTSE.EnabledToday", v77);
          goto LABEL_90;
        }

+ (BOOL)getKillSwitchSettingForPrefix:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PDSEHangTracer"])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
    unsigned __int8 v5 = [v4 pdseHangTracerKillSwitch];
  }

  else if ([v3 isEqualToString:@"PDSEHTRateOnly"])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
    unsigned __int8 v5 = [v4 pdseHTRateOnlyKillSwitch];
  }

  else if ([v3 isEqualToString:@"PDSEHTThirdParty"])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
    unsigned __int8 v5 = [v4 pdseHTThirdPartyKillSwitch];
  }

  else if ([v3 isEqualToString:@"PDSESentry"])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
    unsigned __int8 v5 = [v4 pdseSentryKillSwitch];
  }

  else if ([v3 isEqualToString:@"PDSEWorkflowResponsiveness"])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
    unsigned __int8 v5 = [v4 pdseWorkflowResponsivenessKillSwitch];
  }

  else if ([v3 isEqualToString:@"PDSECATailspin"])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
    unsigned __int8 v5 = [v4 pdseCATailspinKillSwitch];
  }

  else
  {
    if (![v3 isEqualToString:@"PDSEAppLaunch"])
    {
      BOOL v6 = 1;
      goto LABEL_16;
    }

    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
    unsigned __int8 v5 = [v4 pdseAppLaunchKillSwitch];
  }

  BOOL v6 = v5;

LABEL_16:
  return v6;
}

+ (id)timeoutPrefNameForPrefix:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PDSEHangTracer"])
  {
    id v4 = &off_1000145E8;
  }

  else if ([v3 isEqualToString:@"PDSEHTRateOnly"])
  {
    id v4 = &off_1000145F0;
  }

  else if ([v3 isEqualToString:@"PDSEHTThirdParty"])
  {
    id v4 = &off_1000145F8;
  }

  else if ([v3 isEqualToString:@"PDSESentry"])
  {
    id v4 = &off_100014600;
  }

  else if ([v3 isEqualToString:@"PDSEWorkflowResponsiveness"])
  {
    id v4 = &off_100014618;
  }

  else if ([v3 isEqualToString:@"PDSECATailspin"])
  {
    id v4 = &off_100014608;
  }

  else
  {
    if (![v3 isEqualToString:@"PDSEAppLaunch"])
    {
      unsigned __int8 v5 = @"PDSEUnknownPrefixTimeout";
      goto LABEL_16;
    }

    id v4 = &off_100014610;
  }

  unsigned __int8 v5 = *v4;
LABEL_16:

  return v5;
}

+ (double)getTimeoutForPrefix:(id)a3
{
  id v3 = (void *)CFPreferencesCopyValue( (CFStringRef)[a1 timeoutPrefNameForPrefix:a3],  @"com.apple.da",  @"mobile",  kCFPreferencesAnyHost);
  double v4 = 0.0;
  if ((objc_opt_respondsToSelector(v3, "doubleValue") & 1) != 0)
  {
    [v3 doubleValue];
    double v4 = v5;
  }

  return v4;
}

+ (BOOL)hasTimeoutExpiredForPrefix:(id)a3
{
  id v4 = a3;
  [a1 getTimeoutForPrefix:v4];
  double v6 = v5;
  id v7 = sub_10000AC04();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v21 = 138412546;
    id v22 = v4;
    __int16 v23 = 2048;
    double v24 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "PDSE: Fetching timeout for %@, it has value = %f",  (uint8_t *)&v21,  0x16u);
  }

  if (v6 == 0.0
    || (v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date")),
        [v9 timeIntervalSinceReferenceDate],
        double v11 = v10,
        v9,
        v11 < v6))
  {
    id v12 = sub_10000AC04();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v14 timeIntervalSinceReferenceDate];
      int v21 = 138412802;
      id v22 = v4;
      __int16 v23 = 2048;
      double v24 = v6;
      __int16 v25 = 2048;
      uint64_t v26 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "PDSE: Timeout for %@ has not expired (timeout = %f, current time = %f)",  (uint8_t *)&v21,  0x20u);
    }

    BOOL v16 = 0;
  }

  else
  {
    id v18 = sub_10000AC04();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v19 timeIntervalSinceReferenceDate];
      int v21 = 138412802;
      id v22 = v4;
      __int16 v23 = 2048;
      double v24 = v6;
      __int16 v25 = 2048;
      uint64_t v26 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "PDSE: Timeout for %@ has EXPIRED! (timeout = %f, current time = %f)",  (uint8_t *)&v21,  0x20u);
    }

    BOOL v16 = 1;
  }

  return v16;
}

@end