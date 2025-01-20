void sub_100001C1C(const char *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  int *v10;
  char *v11;
  int *v12;
  char *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  int v29;
  void *v30;
  unsigned int v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  unsigned __int8 v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  unsigned __int8 v43;
  id v44;
  id v45;
  NSSortDescriptor *v46;
  void *v47;
  NSMutableArray *v48;
  id v49;
  id v50;
  uint64_t v51;
  void *i;
  int v53;
  int v54;
  id v55;
  id v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  void *v62;
  id v63;
  NSMutableArray *v64;
  unsigned __int8 v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  stat v73;
  id v74;
  id v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  id v81;
  uint8_t v82[32];
  __int128 v83;
  __int128 v84;
  stat buf;
  _BYTE v86[128];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!chdir(a1))
  {
    v54 = open(a1, 32);
    if (v54 < 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v10 = __error();
      v11 = strerror(*v10);
      buf.st_dev = 136315394;
      *(void *)&buf.st_mode = a1;
      WORD2(buf.st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v11;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Could not open and lock %s: %s. Proceeding with copy anyway.",  (uint8_t *)&buf,  0x16u);
    }

    memset(&v73, 0, sizeof(v73));
    if (stat("/Library/Logs/CrashReporter/Baseband", &v73))
    {
      v53 = -1;
    }

    else
    {
      v53 = open("/Library/Logs/CrashReporter/Baseband", 32);
      if (v53 < 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v12 = __error();
        v13 = strerror(*v12);
        buf.st_dev = 136315394;
        *(void *)&buf.st_mode = "/Library/Logs/CrashReporter/Baseband";
        WORD2(buf.st_ino) = 2080;
        *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v13;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Could not open and lock %s: %s. Proceeding with copy anyway.",  (uint8_t *)&buf,  0x16u);
      }
    }

    v57 = v7;
    v61 = v7;
    v56 = v8;
    v60 = v8;
    v55 = v9;
    v63 = v9;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v15 = objc_claimAutoreleasedReturnValue([v14 stringWithFileSystemRepresentation:"." length:1]);
    v62 = (void *)objc_claimAutoreleasedReturnValue( [v14 stringWithFileSystemRepresentation:"/var/mobile/Library/Logs/CrashReporter" length:38]);
    v81 = 0LL;
    v67 = v14;
    v70 = (void *)v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue([v14 subpathsOfDirectoryAtPath:v15 error:&v81]);
    v71 = v81;
    v64 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 511LL));
    v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v17,  NSFilePosixPermissions,  0LL));

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 438LL));
    v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v18,  NSFilePosixPermissions,  0LL));

    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v19 = v16;
    v20 = [v19 countByEnumeratingWithState:&v77 objects:v86 count:16];
    v68 = v19;
    if (v20)
    {
      v21 = v20;
      v22 = *(void *)v78;
      v23 = v61;
      v24 = v70;
      do
      {
        v25 = 0LL;
        do
        {
          if (*(void *)v78 != v22) {
            objc_enumerationMutation(v19);
          }
          v26 = *(void **)(*((void *)&v77 + 1) + 8LL * (void)v25);
          v27 = objc_autoreleasePoolPush();
          v28 = objc_claimAutoreleasedReturnValue([v24 stringByAppendingPathComponent:v26]);
          if (!lstat((const char *)[v28 fileSystemRepresentation], &buf))
          {
            v29 = buf.st_mode & 0xF000;
            if (v29 == 0x4000)
            {
              -[NSMutableArray addObject:](v64, "addObject:", v28);
              goto LABEL_16;
            }

            if (v29 == 40960)
            {
              unlink((const char *)[v28 fileSystemRepresentation]);
              goto LABEL_16;
            }

            if (v29 != 0x8000) {
              goto LABEL_16;
            }
            if (v23)
            {
              v30 = (void *)objc_claimAutoreleasedReturnValue([v26 pathExtension]);
              v31 = [v23 containsObject:v30];

              v19 = v68;
              if (!v31)
              {
                v24 = v70;
                goto LABEL_16;
              }
            }

            v32 = (void *)objc_claimAutoreleasedReturnValue([v26 stringByDeletingLastPathComponent]);
            v33 = (void *)objc_claimAutoreleasedReturnValue([v62 stringByAppendingPathComponent:v32]);
            if ([v63 length])
            {
              v34 = objc_claimAutoreleasedReturnValue([v33 stringByAppendingPathComponent:v63]);
              v35 = v33;
              v33 = (void *)v34;
            }

            v69 = v32;
            v36 = [v67 fileExistsAtPath:v33];
            v37 = v33;
            v24 = v70;
            v72 = v37;
            if ((v36 & 1) != 0)
            {
LABEL_28:
              v39 = objc_claimAutoreleasedReturnValue([v70 stringByAppendingPathComponent:v26]);
              v40 = (void *)objc_claimAutoreleasedReturnValue([v26 lastPathComponent]);
              v41 = (void *)objc_claimAutoreleasedReturnValue([v72 stringByAppendingPathComponent:v40]);

              if (v60)
              {
                v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "stringByAppendingPathExtension:"));

                v41 = (void *)v42;
              }

              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v82 = 138412546;
                *(void *)&v82[4] = v39;
                *(_WORD *)&v82[12] = 2112;
                *(void *)&v82[14] = v41;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Moving '%@' -> '%@'",  v82,  0x16u);
              }

              v75 = v71;
              v66 = (void *)v39;
              v43 = [v67 moveItemAtPath:v39 toPath:v41 error:&v75];
              v38 = v75;

              if ((v43 & 1) != 0)
              {
                v74 = v38;
                [v67 setAttributes:v58 ofItemAtPath:v41 error:&v74];
                v44 = v74;

                v38 = v44;
              }

              else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v82 = 138412802;
                *(void *)&v82[4] = v66;
                *(_WORD *)&v82[12] = 2112;
                *(void *)&v82[14] = v41;
                *(_WORD *)&v82[22] = 2112;
                *(void *)&v82[24] = v38;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to move log file '%@' to '%@': %@",  v82,  0x20u);
              }

              v23 = v61;
              v32 = v69;
              v24 = v70;
            }

            else
            {
              v76 = v71;
              v65 = objc_msgSend( v67,  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
              v38 = v76;

              if ((v65 & 1) != 0)
              {
                v71 = v38;
                goto LABEL_28;
              }

              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v82 = 138412546;
                *(void *)&v82[4] = v72;
                *(_WORD *)&v82[12] = 2112;
                *(void *)&v82[14] = v38;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to create log directory '%@': %@",  v82,  0x16u);
              }
            }

            v71 = v38;
            v19 = v68;
          }

LABEL_16:
          objc_autoreleasePoolPop(v27);
          v25 = (char *)v25 + 1;
        }

        while (v21 != v25);
        v45 = [v19 countByEnumeratingWithState:&v77 objects:v86 count:16];
        v21 = v45;
      }

      while (v45);
    }

    v46 = -[NSSortDescriptor initWithKey:ascending:]( objc_alloc(&OBJC_CLASS___NSSortDescriptor),  "initWithKey:ascending:",  @"length",  0LL);
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v46));
    -[NSMutableArray sortUsingDescriptors:](v64, "sortUsingDescriptors:", v47);

    v83 = 0u;
    v84 = 0u;
    memset(v82, 0, sizeof(v82));
    v48 = v64;
    v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v48,  "countByEnumeratingWithState:objects:count:",  v82,  &buf,  16LL);
    if (v49)
    {
      v50 = v49;
      v51 = **(void **)&v82[16];
      do
      {
        for (i = 0LL; i != v50; i = (char *)i + 1)
        {
          if (**(void **)&v82[16] != v51) {
            objc_enumerationMutation(v48);
          }
          rmdir((const char *)[*(id *)(*(void *)&v82[8] + 8 * (void)i) fileSystemRepresentation]);
        }

        v50 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v48,  "countByEnumeratingWithState:objects:count:",  v82,  &buf,  16LL);
      }

      while (v50);
    }

    if ((v53 & 0x80000000) == 0) {
      close(v53);
    }
    close(v54);
    v8 = v56;
    v7 = v57;
    v9 = v55;
  }
}

BOOL sub_1000024A4(void *a1, void *a2)
{
  id v3 = a1;
  v4 = a2;
  if (qword_1000080E8 != -1) {
    dispatch_once(&qword_1000080E8, &stru_100004310);
  }
  uint64_t v5 = dispatch_semaphore_wait(v4, 0LL);
  BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Another instance of PLMovePowerlogsToCR() is in progress. Skipping",  buf,  2u);
    }
  }

  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Calling PLMovePowerlogsToCR()",  buf,  2u);
    }

    v7 = (dispatch_queue_s *)qword_1000080E0;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100002658;
    v9[3] = &unk_100004338;
    id v10 = v3;
    v11 = v4;
    dispatch_async(v7, v9);
  }

  return v5 == 0;
}

void sub_100002604(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_BACKGROUND, 0);
  v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.osanalytics.crash_mover.powerlog_mover", v4);
  id v3 = (void *)qword_1000080E0;
  qword_1000080E0 = (uint64_t)v2;
}

uint64_t sub_100002658(uint64_t a1)
{
  dispatch_queue_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v2 timeIntervalSinceDate:*(void *)(a1 + 32)];
  double v4 = v3;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    double v7 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "PLMovePowerlogsToCR() took %f seconds",  (uint8_t *)&v6,  0xCu);
  }

  ADClientPushValueForDistributionKey(@"com.apple.osanalytics.crash_mover.powerlog_movement_time", v4);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100002740(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  if (qword_1000080F8 != -1) {
    dispatch_once(&qword_1000080F8, &stru_100004358);
  }
  else {
    BOOL v6 = 0;
  }
  sub_100001C1C("/Library/Logs/CrashReporter", v4, 0LL, 0LL);
  sub_100001C1C("/var/wireless/Library/Logs/CrashReporter/CrashTracer", v4, 0LL, 0LL);
  sub_100001C1C("/var/wireless/Library/Logs/CrashReporter", v4, 0LL, 0LL);
  sub_100001C1C("/var/wireless/awdd/metriclogs", v4, 0LL, 0LL);
  sub_100001C1C("/var/wireless/awdd/anonlogs", v4, @"anon", 0LL);
  sub_100001C1C("/var/networkd/Library/Logs/CrashReporter", v4, 0LL, 0LL);

  [v3 containsObject:@"lockdown"];
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue( @"powerlogWaitDurationSecs",  @"com.apple.crash_mover",  &keyExistsAndHasValidFormat);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v8 timeIntervalSinceDate:v5];
  double v10 = v9;

  if (v6)
  {
    double v11 = (double)AppIntegerValue - v10;
    if (v11 > 0.0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        CFIndex v16 = AppIntegerValue;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "waiting max %ld secs for PLMovePowerlogsToCR() to complete",  buf,  0xCu);
      }

      v12 = (dispatch_semaphore_s *)qword_1000080F0;
      dispatch_time_t v13 = dispatch_time(0LL, (uint64_t)(v11 * 1000000000.0));
      if (dispatch_semaphore_wait(v12, v13))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          CFIndex v16 = AppIntegerValue;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "PLMovePowerlogsToCR() timed out after %ld secs",  buf,  0xCu);
        }
      }

      else
      {
        dispatch_semaphore_signal((dispatch_semaphore_t)qword_1000080F0);
      }
    }
  }
}

void sub_100002A00(id a1)
{
  dispatch_semaphore_t v1 = dispatch_semaphore_create(1LL);
  dispatch_queue_t v2 = (void *)qword_1000080F0;
  qword_1000080F0 = (uint64_t)v1;
}

void sub_100002A24(void *a1)
{
  xpc_object_t xdict = a1;
  xpc_object_t value = xpc_dictionary_get_value(xdict, "Extensions");
  dispatch_queue_t v2 = (void *)objc_claimAutoreleasedReturnValue(value);
  id v3 = v2;
  if (v2 && xpc_get_type(v2) == (xpc_type_t)&_xpc_type_array) {
    id v4 = (void *)_CFXPCCreateCFObjectFromXPCObject(v3);
  }
  else {
    id v4 = 0LL;
  }
  xpc_object_t v5 = xpc_dictionary_get_value(xdict, "options");
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  double v7 = v6;
  if (v6 && xpc_get_type(v6) == (xpc_type_t)&_xpc_type_array) {
    v8 = (void *)_CFXPCCreateCFObjectFromXPCObject(v7);
  }
  else {
    v8 = 0LL;
  }
  sub_100002740(v4, v8);
  xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(xdict);
  double v10 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
  xpc_object_t reply = xpc_dictionary_create_reply(xdict);
  v12 = reply;
  if (reply)
  {
    xpc_dictionary_set_BOOL(reply, "Success", 1);
    xpc_connection_send_message(v10, v12);
  }
}

void sub_100002B48(void *a1)
{
  connection = a1;
  xpc_connection_set_event_handler(connection, &stru_100004398);
  xpc_connection_resume(connection);
}

void sub_100002B80(id a1, OS_xpc_object *a2)
{
  dispatch_queue_t v2 = a2;
  id v3 = objc_autoreleasePoolPush();
  xpc_type_t type = xpc_get_type(v2);
  if (type != (xpc_type_t)&_xpc_type_dictionary)
  {
    if (v2 == (OS_xpc_object *)&_xpc_error_connection_invalid || type != (xpc_type_t)&_xpc_type_error) {
      goto LABEL_6;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100002FD4(v2);
    }
LABEL_20:
    exit(1);
  }

  int v6 = lockdown_copy_checkin_info(v2, &cf);
  if (v6 != 8)
  {
    if (v6) {
      goto LABEL_6;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "crash_mover is handling host-side invocation",  buf,  2u);
    }

    *(void *)buf = 0LL;
    uint64_t v12 = kLockdownCheckinConnectionInfoKey;
    CFTypeRef v13 = cf;
    double v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
    int v8 = secure_lockdown_checkin(buf, v7, 0LL);
    if (cf) {
      CFRelease(cf);
    }
    if (!v8)
    {
      notify_register_check("com.apple.crash_mover", &out_token);
      notify_set_state(out_token, 1uLL);
      notify_post("com.apple.crash_mover");
      sub_100002740(0LL, &off_1000044D0);
      notify_set_state(out_token, 0LL);
      notify_post("com.apple.crash_mover");
      notify_cancel(out_token);
      lockdown_send(*(void *)buf, aPing, 5LL);
      lockdown_disconnect(*(void *)buf);
      *(void *)buf = 0LL;

      goto LABEL_6;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_100002F90();
    }
    goto LABEL_20;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "crash_mover is handling device-side invocation",  buf,  2u);
  }

  sub_100002A24(v2);
LABEL_6:
  objc_autoreleasePoolPop(v3);
}

void start()
{
  v0 = objc_autoreleasePoolPush();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v4) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "crash_mover is launching",  (uint8_t *)&v4,  2u);
  }

  mach_service = xpc_connection_create_mach_service("com.apple.crash_mover", &_dispatch_main_q, 1uLL);
  if (!mach_service)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315138;
      xpc_object_t v5 = "com.apple.crash_mover";
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Couldn't create the listenerConnection for %s",  (uint8_t *)&v4,  0xCu);
    }

    exit(1);
  }

  dispatch_queue_t v2 = mach_service;
  xpc_connection_set_event_handler(mach_service, &stru_1000043B8);
  xpc_connection_resume(v2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  [v3 run];

  __assert_rtn("main", "crash_mover.m", 459, "false");
}

void sub_100002F0C(id a1, OS_xpc_object *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    sub_100002B48(v3);
  }

  else if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100003054(v3);
    }
    exit(1);
  }
}

void sub_100002F80( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100002F90()
{
  *(_WORD *)v0 = 0;
  _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "Could not checkin with lockdown.",  v0,  2u);
}

void sub_100002FD4(void *a1)
{
}

void sub_100003054(void *a1)
{
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceDate:");
}