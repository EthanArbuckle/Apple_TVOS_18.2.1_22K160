double timebaseConversionFactor()
{
  if (qword_100015FA8 != -1) {
    dispatch_once(&qword_100015FA8, &stru_1000103A8);
  }
  return *(double *)&qword_100015FA0;
}

void sub_100001F54(id a1)
{
  *(double *)&qword_100015FA0 = (float)((float)((float)info.numer * 0.000001) / (float)info.denom);
}

uint64_t applyTailspinConfig(uint64_t a1)
{
  id v2 = shared_ht_log_handle();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
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
      *(_WORD *)v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "ApplyTailspinConfig: provided desiredConfig is null",  v6,  2u);
    }

    return 0LL;
  }
}

BOOL sub_100002048()
{
  v0 = arrayOfCFPrefsWithPrefix(@"com.apple.da", @"mobile", (uint64_t)@"HTThirdPartyDevSupport");
  v1 = (void *)objc_claimAutoreleasedReturnValue(v0);
  BOOL v2 = [v1 count] != 0;

  return v2;
}

uint64_t configureTailspinForEPL(int a1)
{
  unsigned __int8 v2 = +[PerfDiagsSelfEnablementController isAnyModeActive]( &OBJC_CLASS___PerfDiagsSelfEnablementController,  "isAnyModeActive");
  BOOL v3 = sub_100002048();
  id v4 = shared_ht_log_handle();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if ((v2 & 1) != 0 || v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = 0;
      v10 = "ConfigureTailspinForEPL: A different HangTracer enablement mode is ACTIVE, do not attempt to configure tailspin";
      v11 = (uint8_t *)&v14;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
    }

LABEL_14:
    return 0LL;
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "ConfigureTailspinForEPL: Other HangTracer enablement modes are NOT active, attempt to configure tailspin",  buf,  2u);
  }

  uint64_t v7 = tailspin_config_create_with_default_config();
  if (!v7)
  {
    id v12 = shared_ht_log_handle();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      v10 = "ConfigureTailspinForEPL: Failed to create tailspin config object";
      v11 = v15;
      goto LABEL_13;
    }

    goto LABEL_14;
  }

  uint64_t v8 = v7;
  if (a1) {
    tailspin_enabled_set(v7, 1LL);
  }
  uint64_t v9 = applyTailspinConfig(v8);
  tailspin_config_free(v8);
  return v9;
}

void sub_100002224(id a1)
{
  v3[0] = @"HTProfile";
  v3[1] = @"HTEPL";
  v3[2] = @"HTThirdPartyDevSupport";
  v3[3] = @"PLTasking";
  v3[4] = &stru_100010A08;
  v3[5] = @"PDSEHangTracer";
  v3[6] = @"PDSEHTThirdParty";
  v3[7] = @"PDSEWorkflowResponsiveness";
  v3[8] = @"PDSEHTRateOnly";
  v3[9] = @"PDSESentry";
  v3[10] = @"PDSEAppLaunch";
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v3, 11LL));
  unsigned __int8 v2 = (void *)qword_100015FB8;
  qword_100015FB8 = v1;
}

void sub_10000400C(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___HTPrefs);
  unsigned __int8 v2 = (void *)qword_100015FC0;
  qword_100015FC0 = (uint64_t)v1;
}

void sub_100005F20( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, char a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33)
{
}

void sub_100005F84(uint64_t a1, int a2)
{
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) == a2)
  {
    id v3 = shared_ht_log_handle();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v5 = "HTPrefs: Tasking Changed";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, v5, buf, 2u);
    }
  }

  else if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) == a2)
  {
    id v6 = shared_ht_log_handle();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v5 = "HTPrefs: Telemetry Changed";
      goto LABEL_16;
    }
  }

  else if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) == a2)
  {
    id v7 = shared_ht_log_handle();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v5 = "HTPrefs: Profile List Changed";
      goto LABEL_16;
    }
  }

  else if (*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) == a2)
  {
    id v8 = shared_ht_log_handle();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v5 = "HTPrefs: EPL State Changed";
      goto LABEL_16;
    }
  }

  else
  {
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) != a2) {
      goto LABEL_18;
    }
    id v9 = shared_ht_log_handle();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v5 = "HTPrefs: HT Self-Enablement State Changed Triggered Refresh";
      goto LABEL_16;
    }
  }

LABEL_18:
  v10 = (id *)(a1 + 80);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  unsigned int v12 = [WeakRetained hangtracerDaemonEnabled];

  [*(id *)(a1 + 32) refreshHTPrefs];
  id v13 = objc_loadWeakRetained((id *)(a1 + 80));
  LODWORD(WeakRetained) = [v13 hangtracerDaemonEnabled];

  if (v12 != (_DWORD)WeakRetained)
  {
    id v14 = shared_ht_log_handle();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      if (v12) {
        v16 = @"ON";
      }
      else {
        v16 = @"OFF";
      }
      id v17 = objc_loadWeakRetained(v10);
      else {
        v18 = @"OFF";
      }
      *(_DWORD *)buf = 138412546;
      v27 = v16;
      __int16 v28 = 2112;
      v29 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "HTPrefs: HangTracer Enabled State Changed: %@ -> %@",  buf,  0x16u);
    }

    id v19 = objc_loadWeakRetained(v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  objc_msgSend(v19, "hangtracerDaemonEnabled", @"Enabled")));
    v25 = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    id v23 = objc_loadWeakRetained(v10);
    [v22 postNotificationName:@"com.apple.hangtracer.daemonstate" object:v23 userInfo:v21];
  }

void sub_1000062D4(uint64_t a1, int a2)
{
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) == a2)
  {
    id v2 = shared_ht_log_handle();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "HTPrefs: Test Reset Log Limits", v4, 2u);
    }
  }

void sub_100006D1C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

  ;
}

  ;
}

void cleanupDiagnosticLogsDirectory(void *a1)
{
  id v1 = a1;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v3 = shared_ht_log_handle();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10000948C((uint64_t)v1, v4);
  }

  v18 = v1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v1));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( [v2 enumeratorAtURL:v5 includingPropertiesForKeys:0 options:0 errorHandler:&stru_100010478]);

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)i);
        id v19 = 0LL;
        unsigned __int8 v13 = [v2 removeItemAtURL:v12 error:&v19];
        id v14 = v19;
        id v15 = shared_ht_log_handle();
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        id v17 = v16;
        if ((v13 & 1) != 0)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v25 = v12;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "Successfully deleted file at %@",  buf,  0xCu);
          }
        }

        else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v25 = v12;
          __int16 v26 = 2112;
          id v27 = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Failed to delete file at %@ : %@",  buf,  0x16u);
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }

    while (v9);
  }
}

BOOL sub_100006FBC(id a1, NSURL *a2, NSError *a3)
{
  id v4 = a2;
  v5 = a3;
  id v6 = shared_ht_log_handle();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Failed to enumerate file at %@ : %@",  (uint8_t *)&v9,  0x16u);
  }

  return 1;
}

void persistAndUnredactLogs(int a1)
{
  v33 = @"Subsystems";
  v31[0] = @"com.apple.hangtracer";
  v31[1] = @"com.apple.performancelogging";
  v32[0] = &off_100011B28;
  v32[1] = &off_100011B28;
  v31[2] = @"com.apple.Sentry.Framework";
  v32[2] = &off_100011B28;
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v32,  v31,  3LL));
  uint64_t v34 = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL));

  id v28 = 0LL;
  int v4 = OSLogValidateProfilePayload(v3, &v28);
  id v5 = v28;
  id v6 = v5;
  if (v4)
  {
    id v7 = shared_ht_log_handle();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Successfully validated profile payload", buf, 2u);
    }

    if (a1)
    {
      id v27 = 0LL;
      int v9 = OSLogInstallProfilePayload(v3, &v27);
      id v10 = v27;
      __int16 v11 = v10;
      if (v9)
      {
        id v12 = shared_ht_log_handle();
        unsigned __int8 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          id v14 = "Successfully installed profile payload";
LABEL_14:
          v16 = v13;
          os_log_type_t v17 = OS_LOG_TYPE_INFO;
          uint32_t v18 = 2;
          goto LABEL_15;
        }

        goto LABEL_23;
      }

      if (v10)
      {
        id v22 = shared_ht_log_handle();
        unsigned __int8 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_23;
        }
        __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 localizedDescription]);
        *(_DWORD *)buf = 138412290;
        v30 = v23;
        uint64_t v24 = "Failed to install os log profile payload with error: %@";
LABEL_22:
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v24, buf, 0xCu);

        goto LABEL_23;
      }
    }

    else
    {
      id v26 = 0LL;
      int v19 = OSLogRemoveProfilePayload(v3, &v26);
      id v20 = v26;
      __int16 v11 = v20;
      if (v19)
      {
        id v21 = shared_ht_log_handle();
        unsigned __int8 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          id v14 = "Successfully removed profile payload";
          goto LABEL_14;
        }

LABEL_23:
        goto LABEL_24;
      }

      if (v20)
      {
        id v25 = shared_ht_log_handle();
        unsigned __int8 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_23;
        }
        __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 localizedDescription]);
        *(_DWORD *)buf = 138412290;
        v30 = v23;
        uint64_t v24 = "Failed to remove os log profile payload with error: %@";
        goto LABEL_22;
      }
    }

LABEL_24:
    goto LABEL_25;
  }

  if (v5)
  {
    id v15 = shared_ht_log_handle();
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 localizedDescription]);
      *(_DWORD *)buf = 138412290;
      v30 = v13;
      id v14 = "Failed to validate os log profile payload with error: %@";
      v16 = (os_log_s *)v11;
      os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
      uint32_t v18 = 12;
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v16, v17, v14, buf, v18);
      goto LABEL_23;
    }

    goto LABEL_24;
  }

LABEL_25:
}

void sub_100007B44(id a1)
{
  id v1 = dlopen("/usr/lib/libMemoryResourceException.dylib", 1);
  qword_100015FD8 = (uint64_t)v1;
  if (v1)
  {
    qword_100015FE0 = (uint64_t)dlsym(v1, "OBJC_CLASS_$_RMECacheEnumerator");
  }

  else
  {
    id v2 = shared_pl_log_handle();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v4 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "libMemoryResourceException.dylib is not present",  v4,  2u);
    }
  }

LABEL_32:
      close(v16);
      id v7 = v55;
LABEL_33:
      unsigned __int8 v13 = v56;
LABEL_34:

      goto LABEL_35;
    }

    v30 = v4;
    v31 = truncate((const char *)[v30 UTF8String], 0);
    v32 = shared_pl_log_handle();
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    uint64_t v34 = v33;
    if (v31 == -1)
    {
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v41 = __error();
        v42 = strerror(*v41);
        *(_DWORD *)buf = 138412546;
        v61 = v30;
        v62 = 2080;
        v63 = v42;
        v35 = "Failed to truncate ReportMemoryException plist at %@ with error %s";
        v36 = v34;
        v37 = OS_LOG_TYPE_DEFAULT;
        v38 = 22;
        goto LABEL_18;
      }
    }

    else if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v61 = v30;
      v35 = "Successfully truncated ReportMemoryException plist at %@";
      v36 = v34;
      v37 = OS_LOG_TYPE_INFO;
      v38 = 12;
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v36, v37, v35, buf, v38);
    }

    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v57 = 0LL;
    v44 = [v43 removeItemAtPath:v30 error:&v57];
    id v6 = (NSDateComponents *)v57;

    v45 = shared_pl_log_handle();
    v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
    v47 = os_log_type_enabled(v46, OS_LOG_TYPE_INFO);
    if (v44)
    {
      if (v47)
      {
        *(_DWORD *)buf = 138412290;
        v61 = v30;
        _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_INFO,  "Successfully deleted ReportMemoryException plist at %@",  buf,  0xCu);
      }
    }

    else if (v47)
    {
      v48 = (char *)objc_claimAutoreleasedReturnValue(-[NSDateComponents localizedDescription](v6, "localizedDescription"));
      *(_DWORD *)buf = 138412546;
      v61 = v30;
      v62 = 2112;
      v63 = v48;
      _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_INFO,  "Failed to delete ReportMemoryException plist at %@ with error %@",  buf,  0x16u);
    }

    goto LABEL_35;
  }

  v29 = shared_pl_log_handle();
  id v6 = (NSDateComponents *)objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v6,  OS_LOG_TYPE_DEFAULT,  "Failed to write ReportMemoryException plist: EPLProfilePath is nil",  buf,  2u);
  }

LABEL_35:
}

LABEL_20:
    id v14 = 0;
    goto LABEL_21;
  }

  if (a4)
  {
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  @"Parameters dictionary is nil",  NSLocalizedDescriptionKey));
    id v14 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"EPLErrorDomain",  1LL,  v11));
LABEL_21:

    goto LABEL_22;
  }

  id v14 = 0;
LABEL_22:

  return v14;
}

void sub_100008CA8(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___NSLock);
  id v2 = (void *)qword_100015FD0;
  qword_100015FD0 = (uint64_t)v1;
}

id shared_pl_log_handle()
{
  if (qword_100016008 != -1) {
    dispatch_once(&qword_100016008, &stru_100010808);
  }
  return (id)qword_100016000;
}

void sub_100008EB8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.performancelogging", "");
  id v2 = (void *)qword_100016000;
  qword_100016000 = (uint64_t)v1;
}

NSMutableArray *arrayOfCFPrefsWithPrefix(const __CFString *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@.", a3));
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v8 = CFPreferencesCopyKeyList(a1, v5, kCFPreferencesAnyHost);
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
        unsigned __int8 v13 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
      }

      id v10 = -[__CFArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    }

    while (v10);
  }

  return v7;
}

id shared_ht_log_handle()
{
  if (qword_100016018 != -1) {
    dispatch_once(&qword_100016018, &stru_100010828);
  }
  return (id)qword_100016010;
}

void sub_10000909C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.hangtracer", "");
  id v2 = (void *)qword_100016010;
  qword_100016010 = (uint64_t)v1;
}

void sub_1000090CC(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "HTPrefs: %@ was not found in the %@ domain, a profile, by EPL, by PowerLog Tasking domain, by HT Self Enablement or by HT Sentry Enablement",  (uint8_t *)&v3,  0x16u);
}

void sub_100009150(uint64_t a1, void *a2, os_log_s *a3)
{
  *(_DWORD *)int v3 = 138412802;
  *(void *)&v3[4] = @"enablementPrefix";
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  *(_WORD *)&v3[22] = 2112;
  sub_100006D1C( (void *)&_mh_execute_header,  (uint64_t)a2,  a3,  "HTPrefs: %@: %@ -> %@",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16],  *a2);
  sub_100006D40();
}

void sub_1000091D4()
{
}

void sub_100009268()
{
}

void sub_1000092FC()
{
}

void sub_100009390()
{
}

void sub_100009424(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Preparing prefInitList", v1, 2u);
}

void sub_100009464()
{
  __assert_rtn("-[HTPrefs setupPrefsWithQueue:]", "HTPrefs.m", 1486, "prefsQueue != NULL");
}

void sub_10000948C(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Cleaning up %@", (uint8_t *)&v2, 0xCu);
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend___createInternalSettings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__createInternalSettings");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attachmentWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attachmentWithPath:");
}

id objc_msgSend_BOOLProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLProperty:contextPrefixOut:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return _[a1 currentCalendar];
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateByAddingComponents_toDate_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateByAddingComponents:toDate:options:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithContentsOfFile:");
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObject:forKey:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
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

id objc_msgSend_enableReportMemoryException_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableReportMemoryException:");
}

id objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_getEPLProfilePath(void *a1, const char *a2, ...)
{
  return _[a1 getEPLProfilePath];
}

id objc_msgSend_hangtracerDaemonEnabled(void *a1, const char *a2, ...)
{
  return _[a1 hangtracerDaemonEnabled];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
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

id objc_msgSend_isAnyModeActive(void *a1, const char *a2, ...)
{
  return _[a1 isAnyModeActive];
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

id objc_msgSend_keyWithPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyWithPrefix:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_linkRMEAndGetEPLProfilePath(void *a1, const char *a2, ...)
{
  return _[a1 linkRMEAndGetEPLProfilePath];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return _[a1 lock];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectProperty_matchingSelector_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectProperty:matchingSelector:contextPrefixOut:");
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

id objc_msgSend_refreshHTPrefs(void *a1, const char *a2, ...)
{
  return _[a1 refreshHTPrefs];
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeKey_domain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeKey:domain:");
}

id objc_msgSend_setAttributes_ofItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributes:ofItemAtPath:error:");
}

id objc_msgSend_setBool_key_domain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBool:key:domain:");
}

id objc_msgSend_setDay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDay:");
}

id objc_msgSend_setDeleteOnAttach_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeleteOnAttach:");
}

id objc_msgSend_setDouble_key_domain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDouble:key:domain:");
}

id objc_msgSend_setEPLKeysForParameters_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEPLKeysForParameters:error:");
}

id objc_msgSend_setInteger_key_domain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInteger:key:domain:");
}

id objc_msgSend_setMemoryLoggingIntervalSec_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMemoryLoggingIntervalSec:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setShouldPostHTPrefsChangedNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldPostHTPrefsChangedNotification:");
}

id objc_msgSend_setString_key_domain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setString:key:domain:");
}

id objc_msgSend_setupPrefsWithQueue_profilePath_taskingDomainName_hangtracerDomain_setupInternalPrefs_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupPrefsWithQueue:profilePath:taskingDomainName:hangtracerDomain:setupInternalPrefs:");
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

id objc_msgSend_sysdiagnoseParamsFromDEParams_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sysdiagnoseParamsFromDEParams:");
}

id objc_msgSend_sysdiagnoseWithMetadata_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sysdiagnoseWithMetadata:withError:");
}

id objc_msgSend_takeSysdiagnose_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "takeSysdiagnose:error:");
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return _[a1 unlock];
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