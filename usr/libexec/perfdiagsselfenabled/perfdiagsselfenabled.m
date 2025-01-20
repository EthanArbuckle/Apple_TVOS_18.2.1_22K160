NSString *sub_100001F2C(uint64_t a1, uint64_t a2)
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@.%@", a2, a1);
}

NSMutableArray *sub_100001F60(const __CFString *a1, void *a2, uint64_t a3)
{
  v5 = a2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@.", a3));
  v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  v8 = CFPreferencesCopyKeyList(a1, v5, kCFPreferencesAnyHost);
  id v9 = -[__CFArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
      }

      id v10 = -[__CFArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    }

    while (v10);
  }

  return v7;
}

void sub_1000023B4( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void start()
{
  id v0 = sub_10000AC04();
  v1 = (os_log_s *)objc_claimAutoreleasedReturnValue(v0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "perfdiagsselfenabled: launched", buf, 2u);
  }

  xpc_activity_register("com.apple.perfdiagsselfenabled", XPC_ACTIVITY_CHECK_IN, &stru_100014370);
  id v2 = sub_10000AC04();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "perfdiagsselfenabled: setup prefs", v5, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  [v4 setupPrefsWithQueue:&_dispatch_main_q];

  dispatch_main();
}

void sub_1000024B4(id a1, OS_xpc_object *a2)
{
  id v2 = a2;
  if (!xpc_activity_get_state(v2))
  {
    id v21 = sub_10000AC04();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_10000B6C0(v13, v22, v23, v24, v25, v26, v27, v28);
    }
    goto LABEL_9;
  }

  if (xpc_activity_get_state(v2) == 2)
  {
    id v3 = sub_10000AC04();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_10000B720(v4, v5, v6, v7, v8, v9, v10, v11);
    }

    dispatch_sync(&_dispatch_main_q, &stru_100014390);
    id v12 = sub_10000AC04();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_10000B6F0(v13, v14, v15, v16, v17, v18, v19, v20);
    }
LABEL_9:
  }
}

void sub_100002578(id a1)
{
  id v1 = sub_10000AC04();
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "perfdiagsselfenabled: begin evaluateSelfEnablement",  buf,  2u);
  }

  +[PerfDiagsSelfEnablementController evaluateSelfEnablement]( &OBJC_CLASS___PerfDiagsSelfEnablementController,  "evaluateSelfEnablement");
  id v3 = sub_10000AC04();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "perfdiagsselfenabled: finished evaluateSelfEnablement",  v8,  2u);
  }

  id v5 = sub_10000AC04();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "perfdiagsselfenabled: exit cleanly", v7, 2u);
  }

  xpc_transaction_exit_clean();
}

void sub_100002674( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_10000287C(id a1)
{
  v3[0] = objc_opt_class(&OBJC_CLASS___PDSEHangTracer);
  v3[1] = objc_opt_class(&OBJC_CLASS___PDSEHangTracerThirdParty);
  v3[2] = objc_opt_class(&OBJC_CLASS___PDSEWorkflowResponsiveness);
  v3[3] = objc_opt_class(&OBJC_CLASS___PDSEHangTracerRateOnly);
  v3[4] = objc_opt_class(&OBJC_CLASS___PDSESentry);
  v3[5] = objc_opt_class(&OBJC_CLASS___PDSECATailspin);
  v3[6] = objc_opt_class(&OBJC_CLASS___PDSEAppLaunch);
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v3, 7LL));
  id v2 = (void *)qword_10001A360;
  qword_10001A360 = v1;
}

LABEL_96:
        v81 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
        v82 = [v81 pdseAllowEnableTailspin];

        v83 = sub_10000AC04();
        v84 = (os_log_s *)objc_claimAutoreleasedReturnValue(v83);
        v85 = os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT);
        if (v82)
        {
          if (v85)
          {
            *(_DWORD *)buf = 138412290;
            v135 = v29;
            _os_log_impl( v26,  v84,  OS_LOG_TYPE_DEFAULT,  "PDSE: evaluateSelfEnablement %@: get desired tailspin config",  buf,  0xCu);
          }

          v86 = [v28 desiredTailspinConfig];
          if (v86)
          {
            v87 = (uint64_t)v86;
            tailspin_config_free(v97);
            v97 = v87;
          }
        }

        else
        {
          if (v85)
          {
            *(_WORD *)buf = 0;
            _os_log_impl( v26,  v84,  OS_LOG_TYPE_DEFAULT,  "PDSE: evaluateSelfEnablement: will NOT enable tailspin due to PDSE Enable Tailspin is FALSE",  buf,  2u);
          }
        }

        v77 = 1LL;
        j__ADClientSetValueForScalarKey( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.pdse.%@.EnableToday",  v29),  1LL);
        uint64_t v25 = 1LL;
LABEL_90:
        v109[0] = _NSConcreteStackBlock;
        v109[1] = 3221225472LL;
        v109[2] = sub_100003C38;
        v109[3] = &unk_100014748;
        v110 = v29;
        v111 = v40;
        v78 = v29;
        AnalyticsSendEventLazy(@"com.apple.perfdiagsselfenable.EnabledToday", v109);

        uint64_t v27 = (char *)v27 + 1;
      }

      while (v105 != v27);
      v88 = [obj countByEnumeratingWithState:&v120 objects:v138 count:16];
      v105 = v88;
      if (!v88)
      {
LABEL_107:

        goto LABEL_108;
      }
    }
  }

  v101 = 0;
  id v5 = 0LL;
  v106 = *(void *)v131;
  uint64_t v6 = v4;
  v99 = v2;
  hostName = v3;
  do
  {
    uint64_t v7 = 0LL;
    v102 = v6;
    do
    {
      if (*(void *)v131 != v106) {
        objc_enumerationMutation(v3);
      }
      v107 = *(void **)(*((void *)&v130 + 1) + 8LL * (void)v7);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v107 prefixForDefaults]);
      if ([v2 hasTimeoutExpiredForPrefix:v8])
      {
        v104 = v7;
        v128 = 0u;
        v129 = 0u;
        v126 = 0u;
        v127 = 0u;
        v108 = v8;
        uint64_t v9 = sub_100001F60(@"com.apple.da", @"mobile", (uint64_t)v8);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v126 objects:v139 count:16];
        if (v11)
        {
          id v12 = v11;
          v13 = *(void *)v127;
          do
          {
            for (i = 0LL; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v127 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(const __CFString **)(*((void *)&v126 + 1) + 8LL * (void)i);
              CFPreferencesSetValue(v15, 0LL, @"com.apple.da", @"mobile", kCFPreferencesAnyHost);
              uint64_t v16 = sub_10000AC04();
              uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
              if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v135 = v15;
                _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "PDSE: Timeout Force Disable, delete setting %@",  buf,  0xCu);
              }
            }

            id v12 = [v10 countByEnumeratingWithState:&v126 objects:v139 count:16];
          }

          while (v12);
        }

        id v2 = v99;
        CFPreferencesSetValue( (CFStringRef)[v99 timeoutPrefNameForPrefix:v108],  0,  @"com.apple.da",  @"mobile",  kCFPreferencesAnyHost);
        uint64_t v18 = sub_10000AC04();
        uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v20 = (__CFString *)objc_claimAutoreleasedReturnValue([v99 timeoutPrefNameForPrefix:v108]);
          *(_DWORD *)buf = 138412290;
          v135 = v20;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "PDSE: Timeout Force Disable, delete timeout setting %@",  buf,  0xCu);
        }

        CFPreferencesSynchronize(@"com.apple.da", @"mobile", kCFPreferencesAnyHost);
        j__ADClientAddValueForScalarKey( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.pdse.%@.TimeoutForceDisable",  v108),  1LL);
        v124[0] = _NSConcreteStackBlock;
        v124[1] = 3221225472LL;
        v124[2] = sub_100003938;
        v124[3] = &unk_100014720;
        id v21 = v108;
        v125 = (__CFString *)v21;
        AnalyticsSendEventLazy(@"com.apple.perfdiagsselfenable.TimeoutForceDisable", v124);
        uint64_t v22 = sub_10000AC04();
        uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        id v3 = (__CFString *)hostName;
        uint64_t v7 = v104;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v135 = v21;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "PDSE: Timeout Force Disable, call %@'s didDisableDiagnostics method",  buf,  0xCu);
        }

        [v107 didDisableDiagnostics];
        v101 = 1;
        id v5 = 1LL;
        uint64_t v6 = v102;
        uint64_t v8 = v108;
      }

      uint64_t v7 = (char *)v7 + 1;
    }

    while (v7 != v6);
    uint64_t v6 = -[__CFString countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v130,  v140,  16LL);
  }

  while (v6);

  uint64_t v24 = (id)v5;
  if ((v101 & 1) == 0) {
    goto LABEL_26;
  }
LABEL_108:
  v89 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
  v90 = [v89 isInternal];

  v91 = sub_10000AC04();
  v92 = (os_log_s *)objc_claimAutoreleasedReturnValue(v91);
  v93 = os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT);
  if ((v90 & 1) != 0)
  {
    if (v93)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v92,  OS_LOG_TYPE_DEFAULT,  "PDSE: evaluateSelfEnablement: will NOT configure tailspin for internal install",  buf,  2u);
    }

    v94 = v97;
  }

  else
  {
    if (v93)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v92,  OS_LOG_TYPE_DEFAULT,  "PDSE: evaluateSelfEnablement: configure tailspin for desired tailspin config",  buf,  2u);
    }

    v94 = v97;
    sub_100009CD4(v97);
  }

  tailspin_config_free(v94);
  if ((v24 & 1) != 0)
  {
    v95 = sub_10000AC04();
    v96 = (os_log_s *)objc_claimAutoreleasedReturnValue(v95);
    if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v96,  OS_LOG_TYPE_INFO,  "PDSE: Posting notification regarding enablement state change",  buf,  2u);
    }

    notify_post(off_10001A358);
  }
}

id sub_100003938(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v3 = @"client";
  uint64_t v4 = v1;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL));
}

id sub_1000039A8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v3[0] = @"client";
  v3[1] = @"transitionType";
  v4[0] = v1;
  v4[1] = @"DisableToDisable";
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  2LL));
}

id sub_100003A2C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v5[0] = @"client";
  v5[1] = @"transitionType";
  v6[0] = v1;
  v6[1] = @"DisableToEnable";
  v5[2] = @"success";
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 40)));
  v6[2] = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v6,  v5,  3LL));

  return v3;
}

id sub_100003AF0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v5[0] = @"client";
  v5[1] = @"transitionType";
  v6[0] = v1;
  v6[1] = @"EnableToDisable";
  v5[2] = @"success";
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 40)));
  v6[2] = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v6,  v5,  3LL));

  return v3;
}

id sub_100003BB4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v3[0] = @"client";
  v3[1] = @"transitionType";
  v4[0] = v1;
  v4[1] = @"EnableToEnable";
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  2LL));
}

id sub_100003C38(uint64_t a1)
{
  v8[0] = *(void *)(a1 + 32);
  v7[0] = @"client";
  v7[1] = @"enabled";
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 40)));
  v8[1] = v1;
  v7[2] = @"hasMetricKitClients";
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  +[MXSourceUtilities anyClientsAvailable](&OBJC_CLASS___MXSourceUtilities, "anyClientsAvailable")));
  v8[2] = v2;
  v7[3] = @"thirdPartyLogUploadEnabled";
  else {
    uint64_t v3 = 0LL;
  }
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v3));
  v8[3] = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  4LL));

  return v5;
}

uint64_t sub_100004900()
{
  return v0;
}

  ;
}

  ;
}

void sub_1000050F8(id a1)
{
  v3[0] = @"HTProfile";
  v3[1] = @"HTEPL";
  void v3[2] = @"HTThirdPartyDevSupport";
  v3[3] = @"PLTasking";
  v3[4] = &stru_100014898;
  v3[5] = @"PDSEHangTracer";
  v3[6] = @"PDSEHTThirdParty";
  void v3[7] = @"PDSEWorkflowResponsiveness";
  v3[8] = @"PDSEHTRateOnly";
  v3[9] = @"PDSESentry";
  v3[10] = @"PDSEAppLaunch";
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v3, 11LL));
  id v2 = (void *)qword_10001A378;
  qword_10001A378 = v1;
}

void sub_100006EE0(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___HTPrefs);
  id v2 = (void *)qword_10001A380;
  qword_10001A380 = (uint64_t)v1;
}

void sub_100008DF4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, char a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33)
{
}

void sub_100008E58(uint64_t a1, int a2)
{
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) == a2)
  {
    id v3 = sub_10000AC04();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v5 = "HTPrefs: Tasking Changed";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, v5, buf, 2u);
    }
  }

  else if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) == a2)
  {
    id v6 = sub_10000AC04();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v5 = "HTPrefs: Telemetry Changed";
      goto LABEL_16;
    }
  }

  else if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) == a2)
  {
    id v7 = sub_10000AC04();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v5 = "HTPrefs: Profile List Changed";
      goto LABEL_16;
    }
  }

  else if (*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) == a2)
  {
    id v8 = sub_10000AC04();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v5 = "HTPrefs: EPL State Changed";
      goto LABEL_16;
    }
  }

  else
  {
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) != a2) {
      goto LABEL_18;
    }
    id v9 = sub_10000AC04();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v5 = "HTPrefs: HT Self-Enablement State Changed Triggered Refresh";
      goto LABEL_16;
    }
  }

LABEL_18:
  uint64_t v10 = (id *)(a1 + 80);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  unsigned int v12 = [WeakRetained hangtracerDaemonEnabled];

  [*(id *)(a1 + 32) refreshHTPrefs];
  id v13 = objc_loadWeakRetained((id *)(a1 + 80));
  LODWORD(WeakRetained) = [v13 hangtracerDaemonEnabled];

  if (v12 != (_DWORD)WeakRetained)
  {
    id v14 = sub_10000AC04();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      if (v12) {
        uint64_t v16 = @"ON";
      }
      else {
        uint64_t v16 = @"OFF";
      }
      id v17 = objc_loadWeakRetained(v10);
      else {
        uint64_t v18 = @"OFF";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v27 = v16;
      __int16 v28 = 2112;
      v29 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "HTPrefs: HangTracer Enabled State Changed: %@ -> %@",  buf,  0x16u);
    }

    id v19 = objc_loadWeakRetained(v10);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  objc_msgSend(v19, "hangtracerDaemonEnabled", @"Enabled")));
    uint64_t v25 = v20;
    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    id v23 = objc_loadWeakRetained(v10);
    [v22 postNotificationName:@"com.apple.hangtracer.daemonstate" object:v23 userInfo:v21];
  }

void sub_1000091A8(uint64_t a1, int a2)
{
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) == a2)
  {
    id v2 = sub_10000AC04();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "HTPrefs: Test Reset Log Limits", v4, 2u);
    }
  }

void sub_100009BF0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

  ;
}

  ;
}

uint64_t sub_100009C28(uint64_t a1)
{
  id v2 = sub_10000AC04();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (a1)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "ApplyTailspinConfig: change tailspin config",  buf,  2u);
    }

    return tailspin_config_apply_sync(a1);
  }

  else
  {
    if (v4)
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "ApplyTailspinConfig: provided desiredConfig is null",  v6,  2u);
    }

    return 0LL;
  }

uint64_t sub_100009CD4(uint64_t a1)
{
  id v2 = sub_100001F60(@"com.apple.da", @"mobile", (uint64_t)@"HTEPL");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  unint64_t v4 = (unint64_t)[v3 count];

  id v5 = sub_100001F60(@"com.apple.da", @"mobile", (uint64_t)@"HTThirdPartyDevSupport");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  unint64_t v7 = v4 | (unint64_t)[v6 count];

  id v8 = sub_10000AC04();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "ConfigureTailspinForSelfEnableConfig: Other HangTracer enablement modes are ACTIVE, do not attempt to configure tailspin",  v14,  2u);
    }

    if (!v4) {
      return 0LL;
    }
    uint64_t v11 = @"com.apple.pdse.NoConfigureTailspinDueToEPL";
LABEL_10:
    j__ADClientAddValueForScalarKey(v11, 1LL);
    return 0LL;
  }

  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "ConfigureTailspinForSelfEnableConfig: Other HangTracer enablement modes are NOT active, attempt to configure tailspin",  buf,  2u);
  }

  uint64_t v12 = 1LL;
  j__ADClientAddValueForScalarKey(@"com.apple.pdse.AttemptConfigureTailspin", 1LL);
  if ((sub_100009C28(a1) & 1) == 0)
  {
    uint64_t v11 = @"com.apple.pdse.FailConfigureTailspin";
    goto LABEL_10;
  }

  return v12;
}

id sub_100009E40()
{
  if (qword_10001A398 != -1) {
    dispatch_once(&qword_10001A398, &stru_1000147F8);
  }
  return (id)qword_10001A390;
}

void sub_100009E80(id a1)
{
  os_log_t v1 = os_log_create("com.apple.hangtracer", "hangtracer_enablement");
  id v2 = (void *)qword_10001A390;
  qword_10001A390 = (uint64_t)v1;
}

id sub_10000AC04()
{
  if (qword_10001A3A8 != -1) {
    dispatch_once(&qword_10001A3A8, &stru_100014818);
  }
  return (id)qword_10001A3A0;
}

void sub_10000AC44(id a1)
{
  os_log_t v1 = os_log_create("com.apple.hangtracer", "");
  id v2 = (void *)qword_10001A3A0;
  qword_10001A3A0 = (uint64_t)v1;
}

double sub_10000B114()
{
  if (qword_10001A3B8 != -1) {
    dispatch_once(&qword_10001A3B8, &stru_100014838);
  }
  return *(double *)&qword_10001A3B0;
}

void sub_10000B154(id a1)
{
  *(double *)&qword_10001A3B0 = (float)((float)((float)info.numer * 0.000001) / (float)info.denom);
}

BOOL sub_10000B19C(int a1, int a2, int a3)
{
  id v6 = sub_10000AC04();
  unint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109632;
    LODWORD(v27) = a1;
    WORD2(v27) = 1024;
    *(_DWORD *)((char *)&v27 + 6) = a2;
    WORD5(v27) = 1024;
    HIDWORD(v27) = a3;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "PDSE: determineTodayEnablement: repeatPeriod = %i, enableDurationLengthInDays = %i, CRKeyOffset = %i",  buf,  0x14u);
  }

  int v8 = a1 / a2;
  id v9 = (void *)MGCopyAnswer(@"InverseDeviceID", 0LL);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "substringWithRange:", a3, 8));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](&OBJC_CLASS___NSScanner, "scannerWithString:", v10));
  [v11 scanHexInt:&v25];

  int v12 = v25 % v8;
  id v13 = sub_10000AC04();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109634;
    LODWORD(v27) = v12;
    WORD2(v27) = 2112;
    *(void *)((char *)&v27 + 6) = v9;
    HIWORD(v27) = 1024;
    int v28 = v25;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "PDSE: determineTodayEnablement: targetEnableDurationNum based off crKey = %i (crKey string = %@ numerical = %u)",  buf,  0x18u);
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v15 timeIntervalSinceReferenceDate];
  int v17 = (int)(v16 / ((double)a2 * 86400.0));

  int v18 = v17 % v8;
  id v19 = sub_10000AC04();
  uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    sub_10000C2D0(v17 % v8, v17, v20);
  }

  id v21 = sub_10000AC04();
  uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    id v23 = @"Disable";
    *(_DWORD *)buf = 138412802;
    if (v12 == v18) {
      id v23 = @"Enable";
    }
    *(void *)&__int128 v27 = v23;
    WORD4(v27) = 1024;
    *(_DWORD *)((char *)&v27 + 10) = v12;
    HIWORD(v27) = 1024;
    int v28 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "PDSE: determineTodayEnablement: Should %@ Today, since TargetEnableDurationNum = %i and TodayEnableDurationNum = %i",  buf,  0x18u);
  }

  return v12 == v18;
}

uint64_t sub_10000B43C(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"PDSEHangTracer"])
  {
    uint64_t v2 = 0LL;
  }

  else if ([v1 isEqualToString:@"PDSESentry"])
  {
    uint64_t v2 = 1LL;
  }

  else if ([v1 isEqualToString:@"PDSECATailspin"])
  {
    uint64_t v2 = 2LL;
  }

  else if ([v1 isEqualToString:@"PDSEHTRateOnly"])
  {
    uint64_t v2 = 3LL;
  }

  else if ([v1 isEqualToString:@"PDSEHTThirdParty"])
  {
    uint64_t v2 = 4LL;
  }

  else if ([v1 isEqualToString:@"PDSEAppLaunch"])
  {
    uint64_t v2 = 5LL;
  }

  else if ([v1 isEqualToString:@"PDSEWorkflowResponsiveness"])
  {
    uint64_t v2 = 6LL;
  }

  else
  {
    id v3 = sub_10000AC04();
    unint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v1;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "PDSE: getCRKeyOffsetForPrefix: Unknown prefix %@",  (uint8_t *)&v6,  0xCu);
    }

    uint64_t v2 = 10LL;
  }

  return v2;
}

void sub_10000B5C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_100001F2C(a1, a2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_1000023B4( (void *)&_mh_execute_header,  v4,  v5,  "PDSE: Enable CA Tailspin collection: set setting %@ to TRUE",  v6,  v7,  v8,  v9,  2u);

  sub_1000023C8();
}

void sub_10000B644(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_100001F2C(a1, a2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_1000023B4( (void *)&_mh_execute_header,  v4,  v5,  "PDSE: Enable CA Tailspin collection: Delete setting %@",  v6,  v7,  v8,  v9,  2u);

  sub_1000023C8();
}

void sub_10000B6C0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000B6F0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000B720( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000B750(char a1, char a2, os_log_t log)
{
  v3[0] = 67109376;
  v3[1] = a1 & 1;
  __int16 v4 = 1024;
  int v5 = a2 & 1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "PDSE: PDSEHTThirdParty: determining enabling HT 3rd Party mode with these device settings: (enableForMetricKit=%{BOO L}d enableForLogUpload=%{BOOL}d",  (uint8_t *)v3,  0xEu);
}

void sub_10000B7DC()
{
  uint64_t v2 = sub_100004900();
  __int16 v4 = sub_100001F2C(v2, v3);
  int v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_10000491C();
  sub_1000023B4( (void *)&_mh_execute_header,  v6,  v7,  "PDSE: Enable Third Party HangTracer: set setting %@ to 0",  v8,  v9,  v10,  v11,  v12);

  sub_1000048F0();
}

void sub_10000B868()
{
  uint64_t v2 = sub_100004900();
  __int16 v4 = sub_100001F2C(v2, v3);
  int v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_10000491C();
  sub_1000023B4( (void *)&_mh_execute_header,  v6,  v7,  "PDSE: Enable Third Party HangTracer: set setting %@ to FALSE",  v8,  v9,  v10,  v11,  v12);

  sub_1000048F0();
}

void sub_10000B8F4()
{
  uint64_t v2 = sub_100004900();
  __int16 v4 = sub_100001F2C(v2, v3);
  int v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_10000491C();
  sub_1000023B4( (void *)&_mh_execute_header,  v6,  v7,  "PDSE: Enable Third Party HangTracer: set setting %@ to TRUE",  v8,  v9,  v10,  v11,  v12);

  sub_1000048F0();
}

void sub_10000B980()
{
  uint64_t v2 = sub_100004900();
  __int16 v4 = sub_100001F2C(v2, v3);
  int v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_10000491C();
  sub_1000023B4( (void *)&_mh_execute_header,  v6,  v7,  "PDSE: Enable Third Party HangTracer: set setting %@ to 3600",  v8,  v9,  v10,  v11,  v12);

  sub_1000048F0();
}

void sub_10000BA0C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_100001F2C(a1, a2);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_1000023B4( (void *)&_mh_execute_header,  v4,  v5,  "PDSE: Enable App Launch Monitoring: setting %@ to TRUE",  v6,  v7,  v8,  v9,  2u);

  sub_1000023C8();
}

void sub_10000BA88(void *a1)
{
  uint64_t v2 = sub_100004900();
  uint64_t v4 = sub_100001F2C(v2, v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_1000023B4( (void *)&_mh_execute_header,  v6,  v7,  "PDSE: Enable HangTracer Rate Only: set setting %@ to FALSE",  v8,  v9,  v10,  v11,  2u);

  sub_1000048F0();
}

void sub_10000BB1C(void *a1)
{
  uint64_t v2 = sub_100004900();
  uint64_t v4 = sub_100001F2C(v2, v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_1000023B4( (void *)&_mh_execute_header,  v6,  v7,  "PDSE: Enable HangTracer Rate Only: set setting %@ to 3600",  v8,  v9,  v10,  v11,  2u);

  sub_1000048F0();
}

void sub_10000BBB0(void *a1)
{
  uint64_t v2 = sub_100004900();
  uint64_t v4 = sub_100001F2C(v2, v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_1000023B4( (void *)&_mh_execute_header,  v6,  v7,  "PDSE: Enable HangTracer Rate Only: set setting %@ to TRUE",  v8,  v9,  v10,  v11,  2u);

  sub_1000048F0();
}

void sub_10000BC44(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "HTPrefs: %@ was not found in the %@ domain, a profile, by EPL, by PowerLog Tasking domain, by HT Self Enablement or by HT Sentry Enablement",  (uint8_t *)&v3,  0x16u);
}

void sub_10000BCC8(uint64_t a1, void *a2, os_log_s *a3)
{
  *(_DWORD *)int v3 = 138412802;
  *(void *)&v3[4] = @"enablementPrefix";
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  *(_WORD *)&v3[22] = 2112;
  sub_100009BF0( (void *)&_mh_execute_header,  (uint64_t)a2,  a3,  "HTPrefs: %@: %@ -> %@",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16],  *a2);
  sub_100009C14();
}

void sub_10000BD4C()
{
}

void sub_10000BDE0()
{
}

void sub_10000BE74()
{
}

void sub_10000BF08()
{
}

void sub_10000BF9C(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Preparing prefInitList", v1, 2u);
}

void sub_10000BFDC()
{
  __assert_rtn("-[HTPrefs setupPrefsWithQueue:]", "HTPrefs.m", 1486, "prefsQueue != NULL");
}

void sub_10000C004()
{
  uint64_t v2 = sub_100004900();
  uint64_t v4 = sub_100001F2C(v2, v3);
  __int16 v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_10000491C();
  sub_1000023B4( (void *)&_mh_execute_header,  v6,  v7,  "PDSE: Enable HangTracer: set setting %@ to TRUE",  v8,  v9,  v10,  v11,  v12);

  sub_1000048F0();
}

void sub_10000C090()
{
  uint64_t v2 = sub_100004900();
  uint64_t v4 = sub_100001F2C(v2, v3);
  __int16 v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_10000491C();
  sub_1000023B4( (void *)&_mh_execute_header,  v6,  v7,  "PDSE: Enable HangTracer: set setting %@ to 0",  v8,  v9,  v10,  v11,  v12);

  sub_1000048F0();
}

void sub_10000C11C()
{
  uint64_t v2 = sub_100004900();
  uint64_t v4 = sub_100001F2C(v2, v3);
  __int16 v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_10000491C();
  sub_1000023B4( (void *)&_mh_execute_header,  v6,  v7,  "PDSE: Enable HangTracer: set setting %@ to 3600",  v8,  v9,  v10,  v11,  v12);

  sub_1000048F0();
}

void sub_10000C1A8(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v4 = sub_100001F2C(a1, a2);
  __int16 v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  int v6 = 138412290;
  uint64_t v7 = v5;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_DEBUG,  "HTSTYE: Enable HTSTYE: set setting %@ to TRUE",  (uint8_t *)&v6,  0xCu);
}

void sub_10000C23C(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v4 = sub_100001F2C(a1, a2);
  __int16 v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  int v6 = 138412290;
  uint64_t v7 = v5;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_DEBUG,  "HTWRE: Enable HTWRE: set setting %@ to TRUE",  (uint8_t *)&v6,  0xCu);
}

void sub_10000C2D0(int a1, int a2, os_log_t log)
{
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "PDSE: determineTodayEnablement: Today's EnableDurationNum Within Period = %i (total EnableDurationsSinceRef = %i)",  (uint8_t *)v3,  0xEu);
}

id objc_msgSend___createInternalSettings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__createInternalSettings");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_anyClientsAvailable(void *a1, const char *a2, ...)
{
  return _[a1 anyClientsAvailable];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_BOOLProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLProperty:contextPrefixOut:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_clientClasses(void *a1, const char *a2, ...)
{
  return _[a1 clientClasses];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_desiredTailspinConfig(void *a1, const char *a2, ...)
{
  return _[a1 desiredTailspinConfig];
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithContentsOfFile:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didDisableDiagnostics(void *a1, const char *a2, ...)
{
  return _[a1 didDisableDiagnostics];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return _[a1 distantFuture];
}

id objc_msgSend_doubleProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleProperty:contextPrefixOut:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_earlyInitNecessaryPrefs(void *a1, const char *a2, ...)
{
  return _[a1 earlyInitNecessaryPrefs];
}

id objc_msgSend_evaluateSelfEnablement(void *a1, const char *a2, ...)
{
  return _[a1 evaluateSelfEnablement];
}

id objc_msgSend_getKillSwitchSettingForPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getKillSwitchSettingForPrefix:");
}

id objc_msgSend_getTimeoutForPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getTimeoutForPrefix:");
}

id objc_msgSend_hangtracerDaemonEnabled(void *a1, const char *a2, ...)
{
  return _[a1 hangtracerDaemonEnabled];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasTimeoutExpiredForPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasTimeoutExpiredForPrefix:");
}

id objc_msgSend_hudEnabled(void *a1, const char *a2, ...)
{
  return _[a1 hudEnabled];
}

id objc_msgSend_intProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intProperty:contextPrefixOut:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToArray:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isInternal(void *a1, const char *a2, ...)
{
  return _[a1 isInternal];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectProperty_matchingSelector_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectProperty:matchingSelector:contextPrefixOut:");
}

id objc_msgSend_pdseAllowEnableTailspin(void *a1, const char *a2, ...)
{
  return _[a1 pdseAllowEnableTailspin];
}

id objc_msgSend_pdseAppLaunchKillSwitch(void *a1, const char *a2, ...)
{
  return _[a1 pdseAppLaunchKillSwitch];
}

id objc_msgSend_pdseCATailspinKillSwitch(void *a1, const char *a2, ...)
{
  return _[a1 pdseCATailspinKillSwitch];
}

id objc_msgSend_pdseCATailspinPeriodDays(void *a1, const char *a2, ...)
{
  return _[a1 pdseCATailspinPeriodDays];
}

id objc_msgSend_pdseHTPeriodDays(void *a1, const char *a2, ...)
{
  return _[a1 pdseHTPeriodDays];
}

id objc_msgSend_pdseHTRateOnlyKillSwitch(void *a1, const char *a2, ...)
{
  return _[a1 pdseHTRateOnlyKillSwitch];
}

id objc_msgSend_pdseHTRateOnlyPeriodDays(void *a1, const char *a2, ...)
{
  return _[a1 pdseHTRateOnlyPeriodDays];
}

id objc_msgSend_pdseHTThirdPartyKillSwitch(void *a1, const char *a2, ...)
{
  return _[a1 pdseHTThirdPartyKillSwitch];
}

id objc_msgSend_pdseHTThirdPartyNoLogUploadPeriodDays(void *a1, const char *a2, ...)
{
  return _[a1 pdseHTThirdPartyNoLogUploadPeriodDays];
}

id objc_msgSend_pdseHTThirdPartyPeriodDays(void *a1, const char *a2, ...)
{
  return _[a1 pdseHTThirdPartyPeriodDays];
}

id objc_msgSend_pdseHangTracerKillSwitch(void *a1, const char *a2, ...)
{
  return _[a1 pdseHangTracerKillSwitch];
}

id objc_msgSend_pdseSentryKillSwitch(void *a1, const char *a2, ...)
{
  return _[a1 pdseSentryKillSwitch];
}

id objc_msgSend_pdseWorkflowResponsivenessKillSwitch(void *a1, const char *a2, ...)
{
  return _[a1 pdseWorkflowResponsivenessKillSwitch];
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_prefContextPrefixPriorityOrder(void *a1, const char *a2, ...)
{
  return _[a1 prefContextPrefixPriorityOrder];
}

id objc_msgSend_prefInitList(void *a1, const char *a2, ...)
{
  return _[a1 prefInitList];
}

id objc_msgSend_prefNamed_domain_profile_matchingSelector_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prefNamed:domain:profile:matchingSelector:contextPrefixOut:");
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return _[a1 preferredLanguages];
}

id objc_msgSend_prefixForDefaults(void *a1, const char *a2, ...)
{
  return _[a1 prefixForDefaults];
}

id objc_msgSend_refreshHTPrefs(void *a1, const char *a2, ...)
{
  return _[a1 refreshHTPrefs];
}

id objc_msgSend_scanHexInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scanHexInt:");
}

id objc_msgSend_scannerWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scannerWithString:");
}

id objc_msgSend_setMemoryLoggingIntervalSec_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMemoryLoggingIntervalSec:");
}

id objc_msgSend_setShouldPostHTPrefsChangedNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldPostHTPrefsChangedNotification:");
}

id objc_msgSend_setupPrefsWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupPrefsWithQueue:");
}

id objc_msgSend_setupPrefsWithQueue_profilePath_taskingDomainName_hangtracerDomain_setupInternalPrefs_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupPrefsWithQueue:profilePath:taskingDomainName:hangtracerDomain:setupInternalPrefs:");
}

id objc_msgSend_sharedPrefs(void *a1, const char *a2, ...)
{
  return _[a1 sharedPrefs];
}

id objc_msgSend_shouldPostHTPrefsChangedNotification(void *a1, const char *a2, ...)
{
  return _[a1 shouldPostHTPrefsChangedNotification];
}

id objc_msgSend_stringProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringProperty:contextPrefixOut:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeoutDurationSec(void *a1, const char *a2, ...)
{
  return _[a1 timeoutDurationSec];
}

id objc_msgSend_timeoutPrefNameForPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeoutPrefNameForPrefix:");
}

id objc_msgSend_unsignedIntProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntProperty:contextPrefixOut:");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedLongProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedLongProperty:contextPrefixOut:");
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongValue];
}

id objc_msgSend_wantsEnablement(void *a1, const char *a2, ...)
{
  return _[a1 wantsEnablement];
}

id objc_msgSend_willEnableDiagnostics(void *a1, const char *a2, ...)
{
  return _[a1 willEnableDiagnostics];
}

id objc_msgSend_writeEnablementSettings(void *a1, const char *a2, ...)
{
  return _[a1 writeEnablementSettings];
}