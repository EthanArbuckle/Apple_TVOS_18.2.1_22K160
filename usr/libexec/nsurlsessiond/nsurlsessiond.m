void sub_1000033C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}
}

id sub_100003474(void *a1)
{
  if (!a1) {
    return 0LL;
  }
  v1 = (const char *)[a1 UTF8String];
  CC_LONG v2 = strlen(v1);
  CC_SHA1(v1, v2, md);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](&OBJC_CLASS___NSMutableString, "stringWithCapacity:", 40LL));
  for (uint64_t i = 0LL; i != 20; ++i)
    objc_msgSend(v3, "appendFormat:", @"%02x", md[i]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 uppercaseString]);

  return v5;
}

void sub_100003554(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_100003570(BOOL result)
{
  if (result)
  {
    v1 = (void *)result;
    CC_LONG v2 = (void *)objc_claimAutoreleasedReturnValue([(id)result domain]);
    if ([v2 isEqualToString:NSURLErrorDomain])
    {

      goto LABEL_5;
    }

    v3 = (void *)objc_claimAutoreleasedReturnValue([v1 domain]);
    unsigned int v4 = [v3 isEqualToString:kCFErrorDomainCFNetwork];

    if (v4)
    {
LABEL_5:
      id v5 = [v1 code];
      if ((unint64_t)v5 + 1019 <= 0x14)
      {
        if (v5 == (id)-1001LL)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue([v1 userInfo]);
          v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:_kCFStreamErrorCodeKey]);
          id v18 = [v17 integerValue];

          return (((_BYTE)v18 + 58) & 0xF) == 2LL;
        }

        if (v5 == (id)-999LL)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue([v1 userInfo]);
          v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:NSURLErrorBackgroundTaskCancelledReasonKey]);
          id v11 = [v10 integerValue];

          return v11 == (id)2;
        }
      }

      return 0LL;
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue([v1 domain]);
    unsigned int v7 = [v6 isEqualToString:@"_nsurlsessiondErrorDomain"];

    if (v7)
    {
      unint64_t v8 = (unint64_t)[v1 code];
      if (v8 < 0xA) {
        return (0x3F9u >> v8) & 1;
      }
      return 0LL;
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue([v1 domain]);
    unsigned int v14 = [v13 isEqualToString:AVFoundationErrorDomain];

    if (!v14) {
      return 0LL;
    }
    id v15 = [v1 code];
    result = 1LL;
    if (((unint64_t)v15 + 11829 > 0xA || ((1LL << (v15 + 53)) & 0x483) == 0)
      && v15 != (id)-11900LL)
    {
      return 0LL;
    }
  }

  return result;
}

void sub_10000377C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_1000037B0(void *a1)
{
  CC_LONG v2 = (void *)objc_claimAutoreleasedReturnValue([a1 domain]);
  unsigned int v3 = [v2 isEqualToString:@"_nsurlsessiondErrorDomain"];

  return v3 && (char *)[a1 code] - 6 < (char *)4;
}

void sub_100003814(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_100003824(BOOL result)
{
  if (result)
  {
    v1 = (void *)result;
    CC_LONG v2 = (void *)objc_claimAutoreleasedReturnValue([(id)result domain]);
    unsigned __int8 v3 = [v2 isEqualToString:@"_nsurlsessiondErrorDomain"];

    if ((v3 & 1) != 0)
    {
      return 1LL;
    }

    else
    {
      unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v1 domain]);
      unsigned int v5 = [v4 isEqualToString:NSURLErrorDomain];

      return v5 && [v1 code] == (id)-997;
    }
  }

  return result;
}

void sub_1000038BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000038D0(void *a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue([a1 domain]);
  id v2 = [v1 isEqualToString:@"_nsurlsessiondErrorDomain"];

  return v2;
}

void sub_10000390C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

_UNKNOWN **sub_10000391C(void *a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([a1 domain]);
  unsigned int v3 = [v2 isEqualToString:@"_nsurlsessiondErrorDomain"];

  else {
    return 0LL;
  }
}

void sub_100003988(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100003998(void *a1, id a2, void *a3)
{
  id v12 = a3;
  if (a1)
  {
    BOOL v7 = a2 == (id)300 || a2 == (id)400 || a2 == (id)600;
    if (v12 && v7)
    {
      unsigned int v8 = [v12 isForeground];
      if (a2 == (id)300) {
        char v9 = 1;
      }
      else {
        char v9 = v8;
      }
      uint64_t v10 = 350LL;
      if (v8) {
        uint64_t v10 = (uint64_t)a2;
      }
      uint64_t v11 = 650LL;
      if (a2 != (id)600) {
        uint64_t v11 = (uint64_t)a2;
      }
      if (a2 == (id)400) {
        uint64_t v11 = 450LL;
      }
      if ((v9 & 1) != 0) {
        a2 = (id)v10;
      }
      else {
        a2 = (id)v11;
      }
    }

    if (a2 != [a1 _priorityValue]) {
      objc_msgSend(a1, "set_priority:", a2);
    }
  }
}

void sub_100003A4C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

uint64_t sub_100003A60(void *a1)
{
  if (!a1) {
    return 0LL;
  }
  v1 = (void *)objc_claimAutoreleasedReturnValue([a1 _metrics]);
  id v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "_daemon_currentTransactionMetrics"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_daemon_connectionMetrics"));

  if (v3)
  {
    objc_msgSend(v3, "_daemon_establishTime");
    uint64_t v4 = 1LL;
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  return v4;
}

void sub_100003ADC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100003B08(void *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1 valueForEntitlement:v3]);
    if ((objc_opt_respondsToSelector(v4, "BOOLValue") & 1) != 0) {
      id v5 = [v4 BOOLValue];
    }
    else {
      id v5 = 0LL;
    }
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

void sub_100003B84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100003BA0(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_self(a1);
  if (qword_100083900 != -1) {
    dispatch_once(&qword_100083900, &stru_100078C48);
  }
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v5 = [v4 fileExistsAtPath:v3];

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByDeletingLastPathComponent]);
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v3 lastPathComponent]);
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByAppendingString:@"_unsafe"]);
    char v9 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:v8]);

    id v10 = v3;
    uint64_t v11 = (const char *)[v10 fileSystemRepresentation];
    id v12 = v9;
    if (rename(v11, (const char *)[v12 fileSystemRepresentation]))
    {
      v13 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v24 = *__error();
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v29 = v24;
        *(_WORD *)&v29[4] = 2112;
        *(void *)&v29[6] = v10;
        *(_WORD *)&v29[14] = 2112;
        *(void *)&v29[16] = v12;
        _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Error %d renaming item at %@ to %@. Won't try to unarchive.",  buf,  0x1Cu);
      }

      id v14 = 0LL;
      id v15 = 0LL;
      +[NDFileUtilities removeItemAtPath:](&OBJC_CLASS___NDFileUtilities, "removeItemAtPath:", v10);
    }

    else
    {
      uint64_t v17 = qword_1000838F8;
      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v12));
      id v27 = 0LL;
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v17,  v18,  &v27));
      id v14 = v27;

      if (v15)
      {
        id v19 = v12;
        v20 = (const char *)[v19 fileSystemRepresentation];
        id v21 = v10;
        if (rename(v20, (const char *)[v21 fileSystemRepresentation]))
        {
          v22 = (os_log_s *)(id)qword_100083990;
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            int v25 = *__error();
            *(_DWORD *)buf = 67109634;
            *(_DWORD *)v29 = v25;
            *(_WORD *)&v29[4] = 2112;
            *(void *)&v29[6] = v19;
            *(_WORD *)&v29[14] = 2112;
            *(void *)&v29[16] = v21;
            _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "Error %d renaming item at %@ to %@",  buf,  0x1Cu);
          }
        }
      }

      else
      {
        v23 = (os_log_s *)(id)qword_100083990;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          unsigned int v26 = [v14 code];
          *(_DWORD *)buf = 138412802;
          *(void *)v29 = v12;
          *(_WORD *)&v29[8] = 2112;
          *(void *)&v29[10] = v14;
          *(_WORD *)&v29[18] = 1024;
          *(_DWORD *)&v29[20] = v26;
          _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "Failure trying to unarchive file at %@ error: %@ [%d]",  buf,  0x1Cu);
        }

        id v15 = 0LL;
        +[NDFileUtilities removeItemAtPath:](&OBJC_CLASS___NDFileUtilities, "removeItemAtPath:", v12);
      }
    }
  }

  else
  {
    id v15 = 0LL;
  }

  return v15;
}

void sub_100003F4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100003FEC(id a1)
{
  uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSArray);
  uint64_t v1 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSNumber);
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSData);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSDate);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSUUID);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSURL);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSURLRequest);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSURLResponse);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSError);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSURLSessionConfiguration);
  uint64_t v11 = +[NSMutableSet setWithObjects:]( &OBJC_CLASS___NSMutableSet,  "setWithObjects:",  v16,  v15,  v1,  v2,  v3,  v4,  v5,  v6,  v7,  v8,  v9,  v10,  objc_opt_class(&OBJC_CLASS_____NSCFURLSessionTaskInfo),  0LL);
  uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)qword_1000838F8;
  qword_1000838F8 = v12;

  id v14 = sub_10003C77C();
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v14);
  objc_msgSend((id)qword_1000838F8, "unionSet:");
  [(id)qword_1000838F8 addObject:objc_opt_class(AVURLAsset)];
  [(id)qword_1000838F8 addObject:objc_opt_class(AVAssetDownloadConfiguration)];
}

void sub_100004194(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t start(int a1, uint64_t a2)
{
  os_log_t v4 = os_log_create("com.apple.nsurlsessiond", "background");
  uint64_t v5 = (void *)qword_100083990;
  qword_100083990 = (uint64_t)v4;

  bzero(buf, 0x400uLL);
  if ((_set_user_dir_suffix("com.apple.nsurlsessiond") & 1) == 0)
  {
    v23 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      int v24 = *__error();
      int v29 = 67109120;
      int v30 = v24;
      _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "failed to set directory suffix: %{darwin.errno}d",  (uint8_t *)&v29,  8u);
    }

    exit(1);
  }

  if (!confstr(65537, (char *)buf, 0x400uLL))
  {
    int v25 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      int v26 = *__error();
      int v29 = 67109120;
      int v30 = v26;
      _os_log_error_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "failed to initialize temporary directory: %{darwin.errno}d",  (uint8_t *)&v29,  8u);
    }

    exit(1);
  }

  uint64_t v6 = realpath_DARWIN_EXTSN((const char *)buf, 0LL);
  if (!v6)
  {
    id v27 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      int v28 = *__error();
      int v29 = 67109120;
      int v30 = v28;
      _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "failed to resolve temporary directory: %{darwin.errno}d",  (uint8_t *)&v29,  8u);
    }

    exit(1);
  }

  free(v6);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  uint64_t v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, v8);

  dispatch_source_set_event_handler(v9, &stru_100078C98);
  dispatch_resume(v9);
  uint64_t v10 = objc_autoreleasePoolPush();
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedDaemon](&OBJC_CLASS___Daemon, "sharedDaemon"));
  if (a1 >= 2)
  {
    uint64_t v12 = a1 - 1LL;
    v13 = (const char **)(a2 + 8);
    do
    {
      id v14 = *v13;
      if (!strcmp(*v13, "--privileged"))
      {
        [v11 setPrivileged:1];
      }

      else if (!strcmp(v14, "--postlogoutsync"))
      {
        [v11 setInSyncBubble:1];
      }

      ++v13;
      --v12;
    }

    while (v12);
  }

  int v15 = CacheDeleteRegisterInfoCallbacks( @"com.apple.nsurlsessiond-cachedelete",  &stru_100078DA8,  &stru_100078DC8,  0LL,  0LL);
  uint64_t v16 = (os_log_s *)qword_100083990;
  if (v15)
  {
    if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "CacheDelete callback registration failed!",  buf,  2u);
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "CacheDelete callback registration succeeded.",  buf,  2u);
  }

  [v11 start];
  dispatch_queue_global_t v17 = dispatch_get_global_queue(9LL, 0LL);
  id v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v17);
  dispatch_async(v18, &stru_100078CB8);

  [v11 restoreState];
  [v11 setupArchiveTimer];
  id v19 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.nsurlsessiond");
  -[NSXPCListener setDelegate:](v19, "setDelegate:", v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v11 queue]);
  -[NSXPCListener _setQueue:](v19, "_setQueue:", v20);

  -[NSXPCListener resume](v19, "resume");
  objc_autoreleasePoolPop(v10);
  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  [v21 run];

  return 1LL;
}

void sub_100004618(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100004690(id a1)
{
  uint64_t v1 = objc_autoreleasePoolPush();
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedDaemon](&OBJC_CLASS___Daemon, "sharedDaemon"));
  unsigned __int8 v3 = [v2 isInSyncBubble];

  if ((v3 & 1) == 0)
  {
    id v4 = sub_1000109A0();
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    uint64_t v6 = v5;
    if (v5) {
      sub_1000109FC(v5);
    }
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NDFileUtilities defaultDownloadDirectoryContainer]( &OBJC_CLASS___NDFileUtilities,  "defaultDownloadDirectoryContainer"));
    if (v7)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      v12[0] = NSURLIsDirectoryKey;
      v12[1] = NSURLIsSymbolicLinkKey;
      v12[2] = NSURLIsVolumeKey;
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 3LL));
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( [v8 enumeratorAtURL:v7 includingPropertiesForKeys:v9 options:5 errorHandler:&stru_100078D68]);

      while (1)
      {

        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v10 nextObject]);
        if (!v8) {
          break;
        }
        uint64_t v11 = objc_autoreleasePoolPush();
        sub_1000109FC(v8);
        objc_autoreleasePoolPop(v11);
      }
    }
  }

  objc_autoreleasePoolPop(v1);
}

void sub_100004810(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100004874(id a1)
{
  uint64_t v1 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "SIGTERM received, shutting down.", v2, 2u);
  }

  exit(0);
}

void sub_100004BC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_23:
        dispatch_queue_global_t v17 = 0;
        goto LABEL_24;
      }

      id v18 = (os_log_s *)qword_100083990;
      if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v27.f_bsize) = 0;
        id v19 = "Failed to set journal mode";
        goto LABEL_36;
      }
    }

    dispatch_queue_global_t v17 = 0;
    v22 = 1;
    goto LABEL_21;
  }

  id v14 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v27.f_bsize) = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to get dbPath", (uint8_t *)&v27, 2u);
  }

  v13 = 0;
LABEL_27:

  return v13;
}

      goto LABEL_29;
    }

    dispatch_queue_global_t v17 = *p_updateTaskDescriptionForTaskStmt;
    id v18 = objc_claimAutoreleasedReturnValue([v6 sessionID]);
    LOBYTE(v17) = sqlite3_bind_text(v17, 2, (const char *)[v18 UTF8String], -1, 0) == 0;

    if ((v17 & 1) == 0)
    {
      id v14 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v6 sessionID]);
        int v25 = 138412290;
        int v26 = v21;
        _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Failed to bind sessionID (%@) to the select statement",  (uint8_t *)&v25,  0xCu);
      }

      goto LABEL_23;
    }

    if (sqlite3_bind_int(*p_updateTaskDescriptionForTaskStmt, 3, (int)[v6 identifier]))
    {
      id v14 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v22 = [v6 identifier];
        int v25 = 134217984;
        int v26 = v22;
        _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Failed to bind identifier (%lu) to the select statement",  (uint8_t *)&v25,  0xCu);
      }

      goto LABEL_23;
    }

    if (sqlite3_step(*p_updateTaskDescriptionForTaskStmt) != 101)
    {
      id v19 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v23 = [v6 identifier];
        int v24 = sqlite3_errmsg(self->_dbConnection);
        int v25 = 134218242;
        int v26 = v23;
        id v27 = 2080;
        int v28 = v24;
        _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Failed to update task description for task %lu into db. Error= %s",  (uint8_t *)&v25,  0x16u);
      }
    }

    sqlite3_reset(*p_updateTaskDescriptionForTaskStmt);
  }

  else
  {
    int v15 = (os_log_s *)qword_100083990;
    if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "sqlite db not initialized",  (uint8_t *)&v25,  2u);
    }
  }

      goto LABEL_29;
    }

    int v15 = *p_updateShouldCancelOnDisconnectForTaskStmt;
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v6 sessionID]);
    LOBYTE(v15) = sqlite3_bind_text(v15, 2, (const char *)[v16 UTF8String], -1, 0) == 0;

    if ((v15 & 1) == 0)
    {
      uint64_t v12 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v6 sessionID]);
        v23 = 138412290;
        int v24 = v19;
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to bind sessionID (%@) to the select statement",  (uint8_t *)&v23,  0xCu);
      }

      goto LABEL_23;
    }

    if (sqlite3_bind_int(*p_updateShouldCancelOnDisconnectForTaskStmt, 3, (int)[v6 identifier]))
    {
      uint64_t v12 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v20 = [v6 identifier];
        v23 = 134217984;
        int v24 = v20;
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to bind identifier (%lu) to the select statement",  (uint8_t *)&v23,  0xCu);
      }

      goto LABEL_23;
    }

    if (sqlite3_step(*p_updateShouldCancelOnDisconnectForTaskStmt) != 101)
    {
      dispatch_queue_global_t v17 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v21 = [v6 identifier];
        v22 = sqlite3_errmsg(self->_dbConnection);
        v23 = 134218242;
        int v24 = v21;
        int v25 = 2080;
        int v26 = v22;
        _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Failed to update shouldCancelOnDisconnect for task %lu into db. Error= %s",  (uint8_t *)&v23,  0x16u);
      }
    }

    sqlite3_reset(*p_updateShouldCancelOnDisconnectForTaskStmt);
  }

  else
  {
    v13 = (os_log_s *)qword_100083990;
    if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "sqlite db not initialized",  (uint8_t *)&v23,  2u);
    }
  }

      goto LABEL_29;
    }

    int v15 = *p_updateBytesPerSecondLimitForTaskStmt;
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v6 sessionID]);
    LOBYTE(v15) = sqlite3_bind_text(v15, 2, (const char *)[v16 UTF8String], -1, 0) == 0;

    if ((v15 & 1) == 0)
    {
      uint64_t v12 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v6 sessionID]);
        v23 = 138412290;
        int v24 = v19;
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to bind sessionID (%@) to the select statement",  (uint8_t *)&v23,  0xCu);
      }

      goto LABEL_23;
    }

    if (sqlite3_bind_int(*p_updateBytesPerSecondLimitForTaskStmt, 3, (int)[v6 identifier]))
    {
      uint64_t v12 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v20 = [v6 identifier];
        v23 = 134217984;
        int v24 = v20;
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to bind identifier (%lu) to the select statement",  (uint8_t *)&v23,  0xCu);
      }

      goto LABEL_23;
    }

    if (sqlite3_step(*p_updateBytesPerSecondLimitForTaskStmt) != 101)
    {
      dispatch_queue_global_t v17 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v21 = [v6 identifier];
        v22 = sqlite3_errmsg(self->_dbConnection);
        v23 = 134218242;
        int v24 = v21;
        int v25 = 2080;
        int v26 = v22;
        _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Failed to update bytesPerSecondLimit for task %lu into db. Error= %s",  (uint8_t *)&v23,  0x16u);
      }
    }

    sqlite3_reset(*p_updateBytesPerSecondLimitForTaskStmt);
  }

  else
  {
    v13 = (os_log_s *)qword_100083990;
    if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "sqlite db not initialized",  (uint8_t *)&v23,  2u);
    }
  }

      goto LABEL_29;
    }

    uint64_t v16 = *p_updateLoadingPriorityForTaskStmt;
    dispatch_queue_global_t v17 = objc_claimAutoreleasedReturnValue([v6 sessionID]);
    LOBYTE(v16) = sqlite3_bind_text(v16, 2, (const char *)[v17 UTF8String], -1, 0) == 0;

    if ((v16 & 1) == 0)
    {
      v13 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue([v6 sessionID]);
        int v24 = 138412290;
        int v25 = v20;
        _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Failed to bind sessionID (%@) to the select statement",  (uint8_t *)&v24,  0xCu);
      }

      goto LABEL_23;
    }

    if (sqlite3_bind_int(*p_updateLoadingPriorityForTaskStmt, 3, (int)[v6 identifier]))
    {
      v13 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v21 = [v6 identifier];
        int v24 = 134217984;
        int v25 = v21;
        _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Failed to bind identifier (%lu) to the select statement",  (uint8_t *)&v24,  0xCu);
      }

      goto LABEL_23;
    }

    if (sqlite3_step(*p_updateLoadingPriorityForTaskStmt) != 101)
    {
      id v18 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v22 = [v6 identifier];
        v23 = sqlite3_errmsg(self->_dbConnection);
        int v24 = 134218242;
        int v25 = v22;
        int v26 = 2080;
        id v27 = v23;
        _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Failed to update loadingPriority for task %lu into db. Error= %s",  (uint8_t *)&v24,  0x16u);
      }
    }

    sqlite3_reset(*p_updateLoadingPriorityForTaskStmt);
  }

  else
  {
    id v14 = (os_log_s *)qword_100083990;
    if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "sqlite db not initialized",  (uint8_t *)&v24,  2u);
    }
  }

      goto LABEL_29;
    }

    int v15 = *p_updateExpectedProgressTargetForTaskStmt;
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v6 sessionID]);
    LOBYTE(v15) = sqlite3_bind_text(v15, 2, (const char *)[v16 UTF8String], -1, 0) == 0;

    if ((v15 & 1) == 0)
    {
      uint64_t v12 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v6 sessionID]);
        v23 = 138412290;
        int v24 = v19;
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to bind sessionID (%@) to the select statement",  (uint8_t *)&v23,  0xCu);
      }

      goto LABEL_23;
    }

    if (sqlite3_bind_int(*p_updateExpectedProgressTargetForTaskStmt, 3, (int)[v6 identifier]))
    {
      uint64_t v12 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v20 = [v6 identifier];
        v23 = 134217984;
        int v24 = v20;
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to bind identifier (%lu) to the select statement",  (uint8_t *)&v23,  0xCu);
      }

      goto LABEL_23;
    }

    if (sqlite3_step(*p_updateExpectedProgressTargetForTaskStmt) != 101)
    {
      dispatch_queue_global_t v17 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v21 = [v6 identifier];
        v22 = sqlite3_errmsg(self->_dbConnection);
        v23 = 134218242;
        int v24 = v21;
        int v25 = 2080;
        int v26 = v22;
        _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Failed to update expectedProgressTarget for task %lu into db. Error= %s",  (uint8_t *)&v23,  0x16u);
      }
    }

    sqlite3_reset(*p_updateExpectedProgressTargetForTaskStmt);
  }

  else
  {
    v13 = (os_log_s *)qword_100083990;
    if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "sqlite db not initialized",  (uint8_t *)&v23,  2u);
    }
  }
}

      goto LABEL_29;
    }

    int v15 = *p_updateRespondedToWillBeginDelayedRequestCallbackForTaskStmt;
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v6 sessionID]);
    LOBYTE(v15) = sqlite3_bind_text(v15, 2, (const char *)[v16 UTF8String], -1, 0) == 0;

    if ((v15 & 1) == 0)
    {
      uint64_t v12 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v6 sessionID]);
        v23 = 138412290;
        int v24 = v19;
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to bind sessionID (%@) to the select statement",  (uint8_t *)&v23,  0xCu);
      }

      goto LABEL_23;
    }

    if (sqlite3_bind_int( *p_updateRespondedToWillBeginDelayedRequestCallbackForTaskStmt,  3,  (int)[v6 identifier]))
    {
      uint64_t v12 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v20 = [v6 identifier];
        v23 = 134217984;
        int v24 = v20;
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to bind identifier (%lu) to the select statement",  (uint8_t *)&v23,  0xCu);
      }

      goto LABEL_23;
    }

    if (sqlite3_step(*p_updateRespondedToWillBeginDelayedRequestCallbackForTaskStmt) != 101)
    {
      dispatch_queue_global_t v17 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v21 = [v6 identifier];
        v22 = sqlite3_errmsg(self->_dbConnection);
        v23 = 134218242;
        int v24 = v21;
        int v25 = 2080;
        int v26 = v22;
        _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Failed to update respondedToWillBeginDelayedRequestCallback for task %lu into db. Error= %s",  (uint8_t *)&v23,  0x16u);
      }
    }

    sqlite3_reset(*p_updateRespondedToWillBeginDelayedRequestCallbackForTaskStmt);
  }

  else
  {
    v13 = (os_log_s *)qword_100083990;
    if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "sqlite db not initialized",  (uint8_t *)&v23,  2u);
    }
  }

void sub_1000050B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000534C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006354( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20)
{
  _Unwind_Resume(a1);
}

LABEL_36:
      goto LABEL_205;
    }

    if (sqlite3_bind_int64(*p_insertOrUpdateAllEntriesStmt, 2, (sqlite3_int64)[v6 taskKind]))
    {
      uint64_t v12 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v18 = (const char *)[v6 taskKind];
        *(_DWORD *)buf = 134217984;
        v236 = v18;
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to bind taskKind (%lu) to the select statement",  buf,  0xCu);
      }

      goto LABEL_36;
    }

    id v14 = *p_insertOrUpdateAllEntriesStmt;
    [v6 creationTime];
    if (sqlite3_bind_double(v14, 3, v15))
    {
      uint64_t v12 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        [v6 creationTime];
        *(_DWORD *)buf = 134217984;
        v236 = v21;
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to bind creationTime (%f) to the select statement",  buf,  0xCu);
      }

      goto LABEL_36;
    }

    if (sqlite3_bind_int64(*p_insertOrUpdateAllEntriesStmt, 4, (sqlite3_int64)[v6 state]))
    {
      uint64_t v12 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v26 = (const char *)[v6 state];
        *(_DWORD *)buf = 134217984;
        v236 = v26;
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to bind state (%lu) to the select statement",  buf,  0xCu);
      }

      goto LABEL_36;
    }

    if (sqlite3_bind_int64(*p_insertOrUpdateAllEntriesStmt, 5, (sqlite3_int64)[v6 suspendCount]))
    {
      uint64_t v12 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v34 = (const char *)[v6 suspendCount];
        *(_DWORD *)buf = 134217984;
        v236 = v34;
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to bind suspendCount (%lu) to the select statement",  buf,  0xCu);
      }

      goto LABEL_36;
    }

    id v19 = *p_insertOrUpdateAllEntriesStmt;
    v20 = objc_claimAutoreleasedReturnValue([v6 taskDescription]);
    LOBYTE(v19) = sqlite3_bind_text(v19, 6, (const char *)[v20 UTF8String], -1, 0) == 0;

    if ((v19 & 1) == 0)
    {
      uint64_t v12 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v42 = (char *)objc_claimAutoreleasedReturnValue([v6 taskDescription]);
        *(_DWORD *)buf = 138412290;
        v236 = v42;
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to bind taskDescription (%@) to the select statement",  buf,  0xCu);
      }

      goto LABEL_36;
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue([v6 originalRequest]);
    v23 = v22 == 0LL;

    if (v23)
    {
      int v25 = 0LL;
    }

    else
    {
      int v24 = (void *)objc_claimAutoreleasedReturnValue([v6 originalRequest]);
      int v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v24,  1LL,  0LL));
    }

    id v27 = *p_insertOrUpdateAllEntriesStmt;
    int v28 = v25;
    if (sqlite3_bind_blob( v27,  7,  [v28 bytes],  (int)objc_msgSend(v28, "length"),  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      int v29 = (os_log_s *)qword_100083990;
      if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "Failed to bind originalRequest to the select statement",  buf,  2u);
      }

      goto LABEL_204;
    }

    int v30 = (void *)objc_claimAutoreleasedReturnValue([v6 currentRequest]);
    v31 = v30 == 0LL;

    if (v31)
    {
      v33 = 0LL;
    }

    else
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue([v6 currentRequest]);
      v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v32,  1LL,  0LL));
    }

    v35 = *p_insertOrUpdateAllEntriesStmt;
    v36 = v33;
    if (sqlite3_bind_blob( v35,  8,  [v36 bytes],  (int)objc_msgSend(v36, "length"),  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v37 = (os_log_s *)qword_100083990;
      if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_ERROR,  "Failed to bind currentRequestData to the select statement",  buf,  2u);
      }

      goto LABEL_203;
    }

    v38 = (void *)objc_claimAutoreleasedReturnValue([v6 response]);
    v39 = v38 == 0LL;

    if (v39)
    {
      v41 = 0LL;
    }

    else
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue([v6 response]);
      v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v40,  1LL,  0LL));
    }

    v43 = *p_insertOrUpdateAllEntriesStmt;
    v233 = v41;
    v44 = v233;
    if (sqlite3_bind_blob( v43,  9,  [v233 bytes],  (int)objc_msgSend(v233, "length"),  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v45 = (os_log_s *)qword_100083990;
      if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_ERROR,  "Failed to bind responseData to the select statement",  buf,  2u);
      }

      goto LABEL_202;
    }

    v46 = *p_insertOrUpdateAllEntriesStmt;
    v47 = (void *)objc_claimAutoreleasedReturnValue([v6 earliestBeginDate]);
    [v47 timeIntervalSince1970];
    LOBYTE(v46) = sqlite3_bind_double(v46, 10, v48) == 0;

    if ((v46 & 1) == 0)
    {
      v49 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        v67 = (void *)objc_claimAutoreleasedReturnValue([v6 earliestBeginDate]);
        [v67 timeIntervalSince1970];
        *(_DWORD *)buf = 134217984;
        v236 = v68;
        _os_log_error_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_ERROR,  "Failed to bind earlierBeginDate (%f) to the select statement",  buf,  0xCu);
      }
    }

    if (sqlite3_bind_int( *p_insertOrUpdateAllEntriesStmt,  11,  (int)[v6 respondedToWillBeginDelayedRequestCallback]))
    {
      v50 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        v69 = [v6 respondedToWillBeginDelayedRequestCallback];
        *(_DWORD *)buf = 134217984;
        v236 = (const char *)v69;
        _os_log_error_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_ERROR,  "Failed to bind identifier (%lu) to the select statement",  buf,  0xCu);
      }

      goto LABEL_201;
    }

    v51 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
    v52 = v51 == 0LL;

    if (v52)
    {
      v54 = 0LL;
    }

    else
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
      v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v53,  1LL,  0LL));
    }

    v55 = *p_insertOrUpdateAllEntriesStmt;
    v232 = v54;
    if (sqlite3_bind_blob( v55,  12,  [v232 bytes],  (int)objc_msgSend(v232, "length"),  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v56 = (os_log_s *)qword_100083990;
      if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_ERROR,  "Failed to bind errorData to the select statement",  buf,  2u);
      }

      goto LABEL_200;
    }

    v57 = (void *)objc_claimAutoreleasedReturnValue([v6 retryError]);
    v58 = v57 == 0LL;

    if (v58)
    {
      v60 = 0LL;
    }

    else
    {
      v59 = (void *)objc_claimAutoreleasedReturnValue([v6 retryError]);
      v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v59,  1LL,  0LL));
    }

    v61 = *p_insertOrUpdateAllEntriesStmt;
    v231 = v60;
    if (sqlite3_bind_blob( v61,  13,  [v231 bytes],  (int)objc_msgSend(v231, "length"),  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v62 = (os_log_s *)qword_100083990;
      if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_ERROR,  "Failed to bind retryErrorData to the select statement",  buf,  2u);
      }

      goto LABEL_199;
    }

    v63 = (void *)objc_claimAutoreleasedReturnValue([v6 fileURL]);
    v64 = v63 == 0LL;

    if (v64)
    {
      v66 = 0LL;
    }

    else
    {
      v65 = (void *)objc_claimAutoreleasedReturnValue([v6 fileURL]);
      v66 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v65,  1LL,  0LL));
    }

    v70 = *p_insertOrUpdateAllEntriesStmt;
    v230 = v66;
    if (sqlite3_bind_blob( v70,  14,  [v230 bytes],  (int)objc_msgSend(v230, "length"),  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      log = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        v71 = (char *)objc_claimAutoreleasedReturnValue([v6 fileURL]);
        *(_DWORD *)buf = 138412290;
        v236 = v71;
        _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Failed to bind fileURL (%@) to the select statement",  buf,  0xCu);
      }

      goto LABEL_198;
    }

    v72 = (void *)objc_claimAutoreleasedReturnValue([v6 downloadFileURL]);
    v73 = v72 == 0LL;

    if (v73)
    {
      v75 = 0LL;
    }

    else
    {
      v74 = (void *)objc_claimAutoreleasedReturnValue([v6 downloadFileURL]);
      v75 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v74,  1LL,  0LL));
    }

    v76 = *p_insertOrUpdateAllEntriesStmt;
    log = v75;
    if (sqlite3_bind_blob( v76,  15,  -[os_log_s bytes](log, "bytes"),  (int)-[os_log_s length](log, "length"),  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v77 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      {
        v84 = (char *)objc_claimAutoreleasedReturnValue([v6 downloadFileURL]);
        *(_DWORD *)buf = 138412290;
        v236 = v84;
        _os_log_error_impl( (void *)&_mh_execute_header,  v77,  OS_LOG_TYPE_ERROR,  "Failed to bind downloadFileURL (%@) to the select statement",  buf,  0xCu);
      }

        v45 = (id)qword_100083990;
        if (os_log_type_enabled((os_log_t)v45, OS_LOG_TYPE_ERROR))
        {
          v56 = (void *)objc_claimAutoreleasedReturnValue(-[__NSCFURLSessionTaskInfo _loggableDescription](v36, "_loggableDescription"));
          *(_DWORD *)buf = 138543618;
          v77 = v56;
          v78 = 2048;
          v79 = a3;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v45,  OS_LOG_TYPE_ERROR,  "%{public}@ failed to instantiate AVAsset, token %llu",  buf,  0x16u);
        }

        v60 = 0;
        goto LABEL_42;
      }

      if (v62)
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue([(id)v62 _asset]);
        v42 = (void *)objc_claimAutoreleasedReturnValue([v41 URL]);
        -[__NSCFURLSessionTaskInfo setAVAssetURL:](v36, "setAVAssetURL:", v42);
      }
    }

    goto LABEL_31;
  }

  id v27 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession clientBundleID](self, "clientBundleID", v58));
    *(_DWORD *)buf = 138544130;
    v77 = v69;
    v78 = 2048;
    v79 = a11;
    v80 = 2112;
    v81 = (unint64_t)v55;
    v82 = 2112;
    v83 = v26;
    _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "Task <%{public}@>.<%lu> for client %@ does not have write access to destination directory %@",  buf,  0x2Au);
  }

  v23[2](v23, 0LL);
  v67 = v22;
LABEL_43:
}

LABEL_119:
LABEL_198:
LABEL_199:

LABEL_200:
LABEL_201:
      v44 = v233;
LABEL_202:

LABEL_203:
LABEL_204:

      goto LABEL_205;
    }

    v78 = *p_insertOrUpdateAllEntriesStmt;
    v79 = objc_claimAutoreleasedReturnValue([v6 bundleID]);
    v80 = sqlite3_bind_text(v78, 16, (const char *)[v79 UTF8String], -1, 0) == 0;

    if (!v80)
    {
      v77 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      {
        v85 = (char *)objc_claimAutoreleasedReturnValue([v6 bundleID]);
        *(_DWORD *)buf = 138412290;
        v236 = v85;
        _os_log_error_impl( (void *)&_mh_execute_header,  v77,  OS_LOG_TYPE_ERROR,  "Failed to bind bundleID (%@) to the select statement",  buf,  0xCu);
      }

      goto LABEL_119;
    }

    v81 = *p_insertOrUpdateAllEntriesStmt;
    v82 = objc_claimAutoreleasedReturnValue([v6 sessionID]);
    v83 = sqlite3_bind_text(v81, 17, (const char *)[v82 UTF8String], -1, 0) == 0;

    if (!v83)
    {
      v77 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      {
        v86 = (char *)objc_claimAutoreleasedReturnValue([v6 sessionID]);
        *(_DWORD *)buf = 138412290;
        v236 = v86;
        _os_log_error_impl( (void *)&_mh_execute_header,  v77,  OS_LOG_TYPE_ERROR,  "Failed to bind sessionID (%@) to the select statement",  buf,  0xCu);
      }

      goto LABEL_119;
    }

    if (sqlite3_bind_int(*p_insertOrUpdateAllEntriesStmt, 18, (int)[v6 hasStarted]))
    {
      v77 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      {
        v87 = [v6 hasStarted];
        *(_DWORD *)buf = 134217984;
        v236 = (const char *)v87;
        _os_log_error_impl( (void *)&_mh_execute_header,  v77,  OS_LOG_TYPE_ERROR,  "Failed to bind creationTime (%lu) to the select statement",  buf,  0xCu);
      }

      goto LABEL_119;
    }

    if (sqlite3_bind_int(*p_insertOrUpdateAllEntriesStmt, 19, (int)[v6 shouldCancelOnDisconnect]))
    {
      v77 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      {
        v88 = [v6 shouldCancelOnDisconnect];
        *(_DWORD *)buf = 134217984;
        v236 = (const char *)v88;
        _os_log_error_impl( (void *)&_mh_execute_header,  v77,  OS_LOG_TYPE_ERROR,  "Failed to bind shouldCancelOnDisconnect (%lu) to the select statement",  buf,  0xCu);
      }

      goto LABEL_119;
    }

    if (sqlite3_bind_int(*p_insertOrUpdateAllEntriesStmt, 20, (int)[v6 basePriority]))
    {
      v77 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      {
        v89 = (const char *)[v6 basePriority];
        *(_DWORD *)buf = 134217984;
        v236 = v89;
        _os_log_error_impl( (void *)&_mh_execute_header,  v77,  OS_LOG_TYPE_ERROR,  "Failed to bind basePriority (%lu) to the select statement",  buf,  0xCu);
      }

      goto LABEL_119;
    }

    if (sqlite3_bind_int(*p_insertOrUpdateAllEntriesStmt, 21, (int)[v6 basePrioritySetExplicitly]))
    {
      v77 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      {
        v92 = [v6 basePrioritySetExplicitly];
        *(_DWORD *)buf = 134217984;
        v236 = (const char *)v92;
        _os_log_error_impl( (void *)&_mh_execute_header,  v77,  OS_LOG_TYPE_ERROR,  "Failed to bind basePrioritySetExplicitly (%lu) to the select statement",  buf,  0xCu);
      }

      goto LABEL_119;
    }

    if (sqlite3_bind_int(*p_insertOrUpdateAllEntriesStmt, 22, (int)[v6 isDiscretionary]))
    {
      v77 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      {
        v97 = [v6 isDiscretionary];
        *(_DWORD *)buf = 134217984;
        v236 = (const char *)v97;
        _os_log_error_impl( (void *)&_mh_execute_header,  v77,  OS_LOG_TYPE_ERROR,  "Failed to bind discretionary (%lu) to the select statement",  buf,  0xCu);
      }

      goto LABEL_119;
    }

    if (sqlite3_bind_int(*p_insertOrUpdateAllEntriesStmt, 23, (int)[v6 discretionaryOverride]))
    {
      v77 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      {
        v98 = (const char *)[v6 discretionaryOverride];
        *(_DWORD *)buf = 134217984;
        v236 = v98;
        _os_log_error_impl( (void *)&_mh_execute_header,  v77,  OS_LOG_TYPE_ERROR,  "Failed to bind discretionaryOverride (%lu) to the select statement",  buf,  0xCu);
      }

      goto LABEL_119;
    }

    v90 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueIdentifier]);
    [v90 getUUIDBytes:v234];

    if (sqlite3_bind_blob( *p_insertOrUpdateAllEntriesStmt,  24,  v234,  16,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v91 = (os_log_s *)qword_100083990;
      if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v91,  OS_LOG_TYPE_ERROR,  "Failed to bind uniqueIdentifier to the select statement",  buf,  2u);
      }

      goto LABEL_198;
    }

    v93 = *p_insertOrUpdateAllEntriesStmt;
    v94 = objc_claimAutoreleasedReturnValue([v6 storagePartitionIdentifier]);
    v95 = sqlite3_bind_text(v93, 25, (const char *)[v94 UTF8String], -1, 0) == 0;

    if (!v95)
    {
      v96 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v99 = (char *)objc_claimAutoreleasedReturnValue([v6 storagePartitionIdentifier]);
        *(_DWORD *)buf = 138412290;
        v236 = v99;
        _os_log_error_impl( (void *)&_mh_execute_header,  v96,  OS_LOG_TYPE_ERROR,  "Failed to bind storagePartitionIdentifier (%@) to the select statement",  buf,  0xCu);
      }

LABEL_190:
      goto LABEL_198;
    }

    if (sqlite3_bind_int64( *p_insertOrUpdateAllEntriesStmt,  26,  (sqlite3_int64)[v6 countOfBytesClientExpectsToSend]))
    {
      v96 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v100 = (const char *)[v6 countOfBytesClientExpectsToSend];
        *(_DWORD *)buf = 134217984;
        v236 = v100;
        _os_log_error_impl( (void *)&_mh_execute_header,  v96,  OS_LOG_TYPE_ERROR,  "Failed to bind countOfBytesClientExpectsToSend (%lu) to the select statement",  buf,  0xCu);
      }

      goto LABEL_190;
    }

    if (sqlite3_bind_int64( *p_insertOrUpdateAllEntriesStmt,  27,  (sqlite3_int64)[v6 countOfBytesClientExpectsToReceive]))
    {
      v96 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v101 = (const char *)[v6 countOfBytesClientExpectsToReceive];
        *(_DWORD *)buf = 134217984;
        v236 = v101;
        _os_log_error_impl( (void *)&_mh_execute_header,  v96,  OS_LOG_TYPE_ERROR,  "Failed to bind countOfBytesClientExpectsToReceive (%lu) to the select statement",  buf,  0xCu);
      }

      goto LABEL_190;
    }

    if (sqlite3_bind_int64( *p_insertOrUpdateAllEntriesStmt,  28,  (sqlite3_int64)[v6 countOfBytesReceived]))
    {
      v96 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v102 = (const char *)[v6 countOfBytesReceived];
        *(_DWORD *)buf = 134217984;
        v236 = v102;
        _os_log_error_impl( (void *)&_mh_execute_header,  v96,  OS_LOG_TYPE_ERROR,  "Failed to bind countOfBytesReceived (%lu) to the select statement",  buf,  0xCu);
      }

      goto LABEL_190;
    }

    if (sqlite3_bind_int64(*p_insertOrUpdateAllEntriesStmt, 29, (sqlite3_int64)[v6 countOfBytesSent]))
    {
      v96 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v103 = (const char *)[v6 countOfBytesSent];
        *(_DWORD *)buf = 134217984;
        v236 = v103;
        _os_log_error_impl( (void *)&_mh_execute_header,  v96,  OS_LOG_TYPE_ERROR,  "Failed to bind countOfBytesSent (%lu) to the select statement",  buf,  0xCu);
      }

      goto LABEL_190;
    }

    if (sqlite3_bind_int64( *p_insertOrUpdateAllEntriesStmt,  30,  (sqlite3_int64)[v6 countOfBytesExpectedToSend]))
    {
      v96 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v107 = (const char *)[v6 countOfBytesExpectedToSend];
        *(_DWORD *)buf = 134217984;
        v236 = v107;
        _os_log_error_impl( (void *)&_mh_execute_header,  v96,  OS_LOG_TYPE_ERROR,  "Failed to bind countOfBytesExpectedToSend (%lu) to the select statement",  buf,  0xCu);
      }

      goto LABEL_190;
    }

    if (sqlite3_bind_int64( *p_insertOrUpdateAllEntriesStmt,  31,  (sqlite3_int64)[v6 countOfBytesExpectedToReceive]))
    {
      v96 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v108 = (const char *)[v6 countOfBytesExpectedToReceive];
        *(_DWORD *)buf = 134217984;
        v236 = v108;
        _os_log_error_impl( (void *)&_mh_execute_header,  v96,  OS_LOG_TYPE_ERROR,  "Failed to bind countOfBytesExpectedToReceive (%lu) to the select statement",  buf,  0xCu);
      }

      goto LABEL_190;
    }

    if (sqlite3_bind_int64(*p_insertOrUpdateAllEntriesStmt, 32, (sqlite3_int64)[v6 bytesPerSecondLimit]))
    {
      v96 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v109 = (const char *)[v6 bytesPerSecondLimit];
        *(_DWORD *)buf = 134217984;
        v236 = v109;
        _os_log_error_impl( (void *)&_mh_execute_header,  v96,  OS_LOG_TYPE_ERROR,  "Failed to bind bytesPerSecondLimit (%lu) to the select statement",  buf,  0xCu);
      }

      goto LABEL_190;
    }

    v104 = *p_insertOrUpdateAllEntriesStmt;
    v105 = objc_claimAutoreleasedReturnValue([v6 personaUniqueString]);
    v106 = sqlite3_bind_text(v104, 33, (const char *)[v105 UTF8String], -1, 0) == 0;

    if (!v106)
    {
      v96 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v110 = (char *)objc_claimAutoreleasedReturnValue([v6 personaUniqueString]);
        *(_DWORD *)buf = 138412290;
        v236 = v110;
        _os_log_error_impl( (void *)&_mh_execute_header,  v96,  OS_LOG_TYPE_ERROR,  "Failed to bind personaUniqueString (%@) to the select statement",  buf,  0xCu);
      }

      goto LABEL_190;
    }

    if (sqlite3_bind_int64(*p_insertOrUpdateAllEntriesStmt, 34, (int)[v6 expectedProgressTarget]))
    {
      v96 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v111 = (const char *)[v6 expectedProgressTarget];
        *(_DWORD *)buf = 134217984;
        v236 = v111;
        _os_log_error_impl( (void *)&_mh_execute_header,  v96,  OS_LOG_TYPE_ERROR,  "Failed to bind expectedProgressTarget (%lu) to the select statement",  buf,  0xCu);
      }

      goto LABEL_190;
    }

    if (sqlite3_bind_int(*p_insertOrUpdateAllEntriesStmt, 35, (int)[v6 mayBeDemotedToDiscretionary]))
    {
      v96 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v112 = [v6 mayBeDemotedToDiscretionary];
        *(_DWORD *)buf = 134217984;
        v236 = (const char *)v112;
        _os_log_error_impl( (void *)&_mh_execute_header,  v96,  OS_LOG_TYPE_ERROR,  "Failed to bind mayBeDemotedToDiscretionary (%lu) to the select statement",  buf,  0xCu);
      }

      goto LABEL_190;
    }

    if (sqlite3_bind_int( *p_insertOrUpdateAllEntriesStmt,  36,  (int)[v6 _TLSMinimumSupportedProtocolVersion]))
    {
      v96 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v113 = [v6 _TLSMinimumSupportedProtocolVersion];
        *(_DWORD *)buf = 134217984;
        v236 = (const char *)v113;
        _os_log_error_impl( (void *)&_mh_execute_header,  v96,  OS_LOG_TYPE_ERROR,  "Failed to bind _TLSMinimumSupportedProtocolVersion (%lu) to the select statement",  buf,  0xCu);
      }

      goto LABEL_190;
    }

    if (sqlite3_bind_int( *p_insertOrUpdateAllEntriesStmt,  37,  (int)[v6 _TLSMaximumSupportedProtocolVersion]))
    {
      v96 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v114 = [v6 _TLSMaximumSupportedProtocolVersion];
        *(_DWORD *)buf = 134217984;
        v236 = (const char *)v114;
        _os_log_error_impl( (void *)&_mh_execute_header,  v96,  OS_LOG_TYPE_ERROR,  "Failed to bind _TLSMaximumSupportedProtocolVersion (%lu) to the select statement",  buf,  0xCu);
      }

      goto LABEL_190;
    }

    if (sqlite3_bind_int(*p_insertOrUpdateAllEntriesStmt, 38, (int)[v6 _hasSZExtractor]))
    {
      v96 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v115 = [v6 _hasSZExtractor];
        *(_DWORD *)buf = 134217984;
        v236 = (const char *)v115;
        _os_log_error_impl( (void *)&_mh_execute_header,  v96,  OS_LOG_TYPE_ERROR,  "Failed to bind _hasSZExtractor (%lu) to the select statement",  buf,  0xCu);
      }

      goto LABEL_190;
    }

    if (sqlite3_bind_int( *p_insertOrUpdateAllEntriesStmt,  39,  (int)[v6 _doesSZExtractorConsumeExtractedData]))
    {
      v96 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v120 = [v6 _doesSZExtractorConsumeExtractedData];
        *(_DWORD *)buf = 134217984;
        v236 = (const char *)v120;
        _os_log_error_impl( (void *)&_mh_execute_header,  v96,  OS_LOG_TYPE_ERROR,  "Failed to bind _doesSZExtractorConsumeExtractedData (%lu) to the select statement",  buf,  0xCu);
      }

      goto LABEL_190;
    }

    if (sqlite3_bind_int( *p_insertOrUpdateAllEntriesStmt,  40,  (int)[v6 _updatedStreamingZipModificationDate]))
    {
      v96 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v128 = [v6 _updatedStreamingZipModificationDate];
        *(_DWORD *)buf = 134217984;
        v236 = (const char *)v128;
        _os_log_error_impl( (void *)&_mh_execute_header,  v96,  OS_LOG_TYPE_ERROR,  "Failed to bind _updatedStreamingZipModificationDate (%lu) to the select statement",  buf,  0xCu);
      }

      goto LABEL_190;
    }

    if (sqlite3_bind_int(*p_insertOrUpdateAllEntriesStmt, 41, (int)[v6 startedUserInitiated]))
    {
      v96 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v129 = [v6 startedUserInitiated];
        *(_DWORD *)buf = 134217984;
        v236 = (const char *)v129;
        _os_log_error_impl( (void *)&_mh_execute_header,  v96,  OS_LOG_TYPE_ERROR,  "Failed to bind startedUserInitiated (%lu) to the select statement",  buf,  0xCu);
      }

      goto LABEL_190;
    }

    v116 = (void *)objc_claimAutoreleasedReturnValue([v6 additionalProperties]);
    v117 = v116 == 0LL;

    if (v117)
    {
      v119 = 0LL;
    }

    else
    {
      v118 = (void *)objc_claimAutoreleasedReturnValue([v6 additionalProperties]);
      v119 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v118,  1LL,  0LL));
    }

    v121 = *p_insertOrUpdateAllEntriesStmt;
    v228 = v119;
    if (sqlite3_bind_blob( v121,  42,  [v228 bytes],  (int)objc_msgSend(v228, "length"),  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v122 = (os_log_s *)qword_100083990;
      if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v122,  OS_LOG_TYPE_ERROR,  "Failed to bind additionalProperties to the select statement",  buf,  2u);
      }

      goto LABEL_197;
    }

    v123 = *p_insertOrUpdateAllEntriesStmt;
    v124 = objc_claimAutoreleasedReturnValue([v6 pathToDownloadTaskFile]);
    v125 = sqlite3_bind_text(v123, 43, (const char *)[v124 UTF8String], -1, 0) == 0;

    if (!v125)
    {
      v126 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
      {
        v134 = (char *)objc_claimAutoreleasedReturnValue([v6 pathToDownloadTaskFile]);
        *(_DWORD *)buf = 138412290;
        v236 = v134;
        _os_log_error_impl( (void *)&_mh_execute_header,  v126,  OS_LOG_TYPE_ERROR,  "Failed to bind pathToDownloadTaskFile (%@) to the select statement",  buf,  0xCu);
      }
    }

    if (sqlite3_bind_int(*p_insertOrUpdateAllEntriesStmt, 44, (int)[v6 retryCount]))
    {
      v127 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
      {
        v135 = (const char *)[v6 retryCount];
        *(_DWORD *)buf = 134217984;
        v236 = v135;
        _os_log_error_impl( (void *)&_mh_execute_header,  v127,  OS_LOG_TYPE_ERROR,  "Failed to bind retryCount (%lu) to the select statement",  buf,  0xCu);
      }

LABEL_221:
LABEL_197:
      goto LABEL_198;
    }

    v130 = *p_insertOrUpdateAllEntriesStmt;
    [v6 loadingPriority];
    if (sqlite3_bind_double(v130, 45, v131))
    {
      v127 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
      {
        [v6 loadingPriority];
        *(_DWORD *)buf = 134217984;
        v236 = v132;
        _os_log_error_impl( (void *)&_mh_execute_header,  v127,  OS_LOG_TYPE_ERROR,  "Failed to bind loadingPriority (%f) to the select statement",  buf,  0xCu);
      }

      goto LABEL_221;
    }

    if (sqlite3_bind_int64(*p_insertOrUpdateAllEntriesStmt, 46, [v6 qos]))
    {
      v127 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
      {
        v133 = [v6 qos];
        *(_DWORD *)buf = 134217984;
        v236 = (const char *)v133;
        _os_log_error_impl( (void *)&_mh_execute_header,  v127,  OS_LOG_TYPE_ERROR,  "Failed to bind qos (%lu) to the select statement",  buf,  0xCu);
      }

      goto LABEL_221;
    }

    v136 = (void *)objc_claimAutoreleasedReturnValue([v6 _backgroundTrailers]);
    v137 = v136 == 0LL;

    if (v137)
    {
      v139 = 0LL;
    }

    else
    {
      v138 = (void *)objc_claimAutoreleasedReturnValue([v6 _backgroundTrailers]);
      v139 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v138,  1LL,  0LL));
    }

    v140 = *p_insertOrUpdateAllEntriesStmt;
    v219 = v139;
    if (sqlite3_bind_blob( v140,  47,  [v219 bytes],  (int)objc_msgSend(v219, "length"),  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v141 = (os_log_s *)qword_100083990;
      if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v141,  OS_LOG_TYPE_ERROR,  "Failed to bind backgroundTrailersData to the select statement",  buf,  2u);
      }

      goto LABEL_315;
    }

    v142 = (void *)objc_claimAutoreleasedReturnValue([v6 taskMetrics]);
    v143 = v142 == 0LL;

    if (v143)
    {
      v145 = 0LL;
    }

    else
    {
      v144 = (void *)objc_claimAutoreleasedReturnValue([v6 taskMetrics]);
      v145 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v144,  1LL,  0LL));
    }

    v146 = *p_insertOrUpdateAllEntriesStmt;
    v218 = v145;
    if (sqlite3_bind_blob( v146,  48,  [v218 bytes],  (int)objc_msgSend(v218, "length"),  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v147 = (os_log_s *)qword_100083990;
      if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v147,  OS_LOG_TYPE_ERROR,  "Failed to bind taskMetricsData to the select statement",  buf,  2u);
      }

      goto LABEL_314;
    }

    v148 = (void *)objc_claimAutoreleasedReturnValue([v6 URL]);
    v149 = v148 == 0LL;

    if (v149)
    {
      v151 = 0LL;
    }

    else
    {
      v150 = (void *)objc_claimAutoreleasedReturnValue([v6 URL]);
      v151 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v150,  1LL,  0LL));
    }

    v152 = *p_insertOrUpdateAllEntriesStmt;
    v220 = v151;
    if (sqlite3_bind_blob( v152,  49,  [v220 bytes],  (int)objc_msgSend(v220, "length"),  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v224 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v224, OS_LOG_TYPE_ERROR))
      {
        v153 = (char *)objc_claimAutoreleasedReturnValue([v6 URL]);
        *(_DWORD *)buf = 138412290;
        v236 = v153;
        _os_log_error_impl( (void *)&_mh_execute_header,  v224,  OS_LOG_TYPE_ERROR,  "Failed to bind URL (%@) to the select statement",  buf,  0xCu);
      }

      goto LABEL_313;
    }

    v154 = (void *)objc_claimAutoreleasedReturnValue([v6 destinationURL]);
    v155 = v154 == 0LL;

    if (v155)
    {
      v157 = 0LL;
    }

    else
    {
      v156 = (void *)objc_claimAutoreleasedReturnValue([v6 destinationURL]);
      v157 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v156,  1LL,  0LL));
    }

    v158 = *p_insertOrUpdateAllEntriesStmt;
    v224 = v157;
    if (sqlite3_bind_blob(v158, 50, -[os_log_s bytes](v224, "bytes"), (int)-[os_log_s length](v224, "length"), 0LL))
    {
      v223 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v223, OS_LOG_TYPE_ERROR))
      {
        v159 = (char *)objc_claimAutoreleasedReturnValue([v6 destinationURL]);
        *(_DWORD *)buf = 138412290;
        v236 = v159;
        _os_log_error_impl( (void *)&_mh_execute_header,  v223,  OS_LOG_TYPE_ERROR,  "Failed to bind destinationURL (%@) to the select statement",  buf,  0xCu);
      }

      goto LABEL_312;
    }

    v160 = (void *)objc_claimAutoreleasedReturnValue([v6 options]);
    v161 = v160 == 0LL;

    if (v161)
    {
      v163 = 0LL;
    }

    else
    {
      v162 = (void *)objc_claimAutoreleasedReturnValue([v6 options]);
      v163 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v162,  200LL,  0LL,  0LL));
    }

    v164 = *p_insertOrUpdateAllEntriesStmt;
    v223 = v163;
    if (sqlite3_bind_blob( v164,  51,  -[os_log_s bytes](v223, "bytes"),  (int)-[os_log_s length](v223, "length"),  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v165 = (os_log_s *)qword_100083990;
      if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v165,  OS_LOG_TYPE_ERROR,  "Failed to bind optionsData to the select statement",  buf,  2u);
      }

      goto LABEL_312;
    }

    if (sqlite3_bind_int(*p_insertOrUpdateAllEntriesStmt, 52, (int)[v6 initializedWithAVAsset]))
    {
      v166 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v166, OS_LOG_TYPE_ERROR))
      {
        v167 = [v6 initializedWithAVAsset];
        *(_DWORD *)buf = 134217984;
        v236 = (const char *)v167;
        _os_log_error_impl( (void *)&_mh_execute_header,  v166,  OS_LOG_TYPE_ERROR,  "Failed to bind initializedWithAVAsset (%lu) to the select statement",  buf,  0xCu);
      }

      goto LABEL_312;
    }

    v168 = (void *)objc_claimAutoreleasedReturnValue([v6 temporaryDestinationURL]);
    v169 = v168 == 0LL;

    if (v169)
    {
      v171 = 0LL;
    }

    else
    {
      v170 = (void *)objc_claimAutoreleasedReturnValue([v6 temporaryDestinationURL]);
      v171 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v170,  1LL,  0LL));
    }

    v172 = *p_insertOrUpdateAllEntriesStmt;
    v222 = v171;
    if (sqlite3_bind_blob(v172, 53, [v222 bytes], (int)objc_msgSend(v222, "length"), 0))
    {
      v173 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v173, OS_LOG_TYPE_ERROR))
      {
        v174 = (char *)objc_claimAutoreleasedReturnValue([v6 temporaryDestinationURL]);
        *(_DWORD *)buf = 138412290;
        v236 = v174;
        _os_log_error_impl( (void *)&_mh_execute_header,  v173,  OS_LOG_TYPE_ERROR,  "Failed to bind temporaryDestinationURL (%@) to the select statement",  buf,  0xCu);
      }

LABEL_262:
LABEL_311:
LABEL_312:

LABEL_313:
LABEL_314:

LABEL_315:
      goto LABEL_197;
    }

    v175 = *p_insertOrUpdateAllEntriesStmt;
    v176 = objc_claimAutoreleasedReturnValue([v6 assetTitle]);
    v177 = sqlite3_bind_text(v175, 54, (const char *)[v176 UTF8String], -1, 0) == 0;

    if (!v177)
    {
      v173 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v173, OS_LOG_TYPE_ERROR))
      {
        v178 = (char *)objc_claimAutoreleasedReturnValue([v6 assetTitle]);
        *(_DWORD *)buf = 138412290;
        v236 = v178;
        _os_log_error_impl( (void *)&_mh_execute_header,  v173,  OS_LOG_TYPE_ERROR,  "Failed to bind assetTitle (%@) to the select statement",  buf,  0xCu);
      }

      goto LABEL_262;
    }

    v179 = *p_insertOrUpdateAllEntriesStmt;
    v180 = objc_claimAutoreleasedReturnValue([v6 assetArtworkData]);
    v181 = [v180 bytes];
    v226 = (os_log_t)objc_claimAutoreleasedReturnValue([v6 assetArtworkData]);
    LOBYTE(v179) = sqlite3_bind_blob( v179,  55,  v181,  (int)-[os_log_s length](v226, "length"),  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL) == 0;

    if ((v179 & 1) == 0)
    {
      v182 = (os_log_s *)qword_100083990;
      if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v182,  OS_LOG_TYPE_ERROR,  "Failed to bind assetArtworkDataData to the select statement",  buf,  2u);
      }

      goto LABEL_311;
    }

    v183 = (void *)objc_claimAutoreleasedReturnValue([v6 AVAssetURL]);
    v184 = v183 == 0LL;

    if (v184)
    {
      v186 = 0LL;
    }

    else
    {
      v185 = (void *)objc_claimAutoreleasedReturnValue([v6 AVAssetURL]);
      v186 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v185,  1LL,  0LL));
    }

    v187 = *p_insertOrUpdateAllEntriesStmt;
    v225 = v186;
    if (sqlite3_bind_blob(v187, 56, [v225 bytes], (int)objc_msgSend(v225, "length"), 0))
    {
      v227 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v227, OS_LOG_TYPE_ERROR))
      {
        v188 = (char *)objc_claimAutoreleasedReturnValue([v6 AVAssetURL]);
        *(_DWORD *)buf = 138412290;
        v236 = v188;
        _os_log_error_impl( (void *)&_mh_execute_header,  v227,  OS_LOG_TYPE_ERROR,  "Failed to bind AVAssetURL (%@) to the select statement",  buf,  0xCu);
      }

      goto LABEL_310;
    }

    if (sqlite3_bind_int64(*p_insertOrUpdateAllEntriesStmt, 57, (int)[v6 AVAssetDownloadToken]))
    {
      v227 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v227, OS_LOG_TYPE_ERROR))
      {
        v189 = (const char *)[v6 AVAssetDownloadToken];
        *(_DWORD *)buf = 134217984;
        v236 = v189;
        v190 = "Failed to bind AVAssetDownloadToken (%lu) to the select statement";
LABEL_285:
        v196 = v227;
        v197 = 12;
LABEL_292:
        _os_log_error_impl((void *)&_mh_execute_header, v196, OS_LOG_TYPE_ERROR, v190, buf, v197);
        goto LABEL_310;
      }

      goto LABEL_310;
    }

    v191 = *p_insertOrUpdateAllEntriesStmt;
    v192 = objc_claimAutoreleasedReturnValue([v6 avAssetDownloadChildDownloadSessionIdentifier]);
    v193 = sqlite3_bind_text(v191, 58, (const char *)[v192 UTF8String], -1, 0) == 0;

    if (!v193)
    {
      v227 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v227, OS_LOG_TYPE_ERROR))
      {
        v194 = (char *)objc_claimAutoreleasedReturnValue([v6 avAssetDownloadChildDownloadSessionIdentifier]);
        *(_DWORD *)buf = 138412290;
        v236 = v194;
        _os_log_error_impl( (void *)&_mh_execute_header,  v227,  OS_LOG_TYPE_ERROR,  "Failed to bind avAssetDownloadChildDownloadSessionIdentifier (%@) to the select statement",  buf,  0xCu);
      }

      goto LABEL_310;
    }

    if (sqlite3_bind_int(*p_insertOrUpdateAllEntriesStmt, 59, (int)[v6 enableSPIDelegateCallbacks]))
    {
      v227 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v227, OS_LOG_TYPE_ERROR))
      {
        v195 = [v6 enableSPIDelegateCallbacks];
        *(_DWORD *)buf = 134217984;
        v236 = (const char *)v195;
        v190 = "Failed to bind enableSPIDelegateCallbacks (%lu) to the select statement";
        goto LABEL_285;
      }

LABEL_310:
      goto LABEL_311;
    }

    v198 = (void *)objc_claimAutoreleasedReturnValue([v6 downloadConfig]);
    v199 = v198 == 0LL;

    if (v199)
    {
      v201 = 0LL;
    }

    else
    {
      v200 = (void *)objc_claimAutoreleasedReturnValue([v6 downloadConfig]);
      v201 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v200,  1LL,  0LL));
    }

    v202 = *p_insertOrUpdateAllEntriesStmt;
    v227 = v201;
    if (sqlite3_bind_blob( v202,  60,  -[os_log_s bytes](v227, "bytes"),  (int)-[os_log_s length](v227, "length"),  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v203 = qword_100083990;
      if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v190 = "Failed to bind downloadConfigData to the select statement";
        v196 = (os_log_s *)v203;
        v197 = 2;
        goto LABEL_292;
      }

      goto LABEL_310;
    }

    v204 = (void *)objc_claimAutoreleasedReturnValue([v6 assetOptionsPlist]);
    v205 = v204 == 0LL;

    if (v205
      || (v206 = (void *)objc_claimAutoreleasedReturnValue([v6 assetOptionsPlist]),
          v207 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v206,  200LL,  0LL,  0LL)),  v206,  !v207))
    {
      v221 = 0LL;
      v210 = 61;
    }

    else
    {
      v208 = *p_insertOrUpdateAllEntriesStmt;
      v221 = v207;
      if (sqlite3_bind_blob( v208,  61,  [v221 bytes],  (int)objc_msgSend(v221, "length"),  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
      {
        v209 = (os_log_s *)qword_100083990;
        if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl( (void *)&_mh_execute_header,  v209,  OS_LOG_TYPE_ERROR,  "Failed to bind assetOptionsData to the select statement",  buf,  2u);
        }

LABEL_309:
        goto LABEL_310;
      }

      v210 = 62;
    }

    v211 = (void *)objc_claimAutoreleasedReturnValue([v6 resumableUploadData]);
    v212 = *p_insertOrUpdateAllEntriesStmt;
    v217 = v211;
    if (sqlite3_bind_blob( v212,  v210,  [v217 bytes],  (int)objc_msgSend(v217, "length"),  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v213 = (os_log_s *)qword_100083990;
      if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v213,  OS_LOG_TYPE_ERROR,  "Failed to bind resumableUploadData to the select statement",  buf,  2u);
      }
    }

    else
    {
      if (sqlite3_step(*p_insertOrUpdateAllEntriesStmt) != 101)
      {
        v214 = (os_log_s *)(id)qword_100083990;
        if (os_log_type_enabled(v214, OS_LOG_TYPE_ERROR))
        {
          v215 = (const char *)[v6 identifier];
          v216 = sqlite3_errmsg(self->_dbConnection);
          *(_DWORD *)buf = 134218242;
          v236 = v215;
          v237 = 2080;
          v238 = v216;
          _os_log_error_impl( (void *)&_mh_execute_header,  v214,  OS_LOG_TYPE_ERROR,  "Failed to insert task %lu into db. Error= %s",  buf,  0x16u);
        }
      }

      sqlite3_reset(*p_insertOrUpdateAllEntriesStmt);
    }

    goto LABEL_309;
  }

  v13 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "sqlite db not initialized", buf, 2u);
  }

LABEL_205:
}

void sub_100009158( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20, void *a21, void *a22, void *a23, void *a24)
{
  _Unwind_Resume(a1);
}

LABEL_27:
    goto LABEL_28;
  }

  uint64_t v16 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v26) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "sqlite db not initialized",  (uint8_t *)&v26,  2u);
  }

    goto LABEL_28;
  }

  int v15 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v25) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "sqlite db not initialized",  (uint8_t *)&v25,  2u);
  }

    goto LABEL_28;
  }

  uint64_t v16 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v26) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "sqlite db not initialized",  (uint8_t *)&v26,  2u);
  }

      goto LABEL_33;
    }

    if (sqlite3_bind_int( *p_updateTLSSupportedProtocolVersionForTaskStmt,  2,  (int)[v6 _TLSMaximumSupportedProtocolVersion]))
    {
      uint64_t v12 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v19 = [v6 _TLSMaximumSupportedProtocolVersion];
        int v24 = 134217984;
        int v25 = (id)v19;
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to bind _TLSMaximumSupportedProtocolVersion (%lu) to the select statement",  (uint8_t *)&v24,  0xCu);
      }

      goto LABEL_27;
    }

    int v15 = *p_updateTLSSupportedProtocolVersionForTaskStmt;
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v6 sessionID]);
    LOBYTE(v15) = sqlite3_bind_text(v15, 3, (const char *)[v16 UTF8String], -1, 0) == 0;

    if ((v15 & 1) == 0)
    {
      uint64_t v12 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue([v6 sessionID]);
        int v24 = 138412290;
        int v25 = v20;
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to bind sessionID (%@) to the select statement",  (uint8_t *)&v24,  0xCu);
      }

      goto LABEL_27;
    }

    if (sqlite3_bind_int(*p_updateTLSSupportedProtocolVersionForTaskStmt, 4, (int)[v6 identifier]))
    {
      uint64_t v12 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v21 = [v6 identifier];
        int v24 = 134217984;
        int v25 = v21;
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to bind identifier (%lu) to the select statement",  (uint8_t *)&v24,  0xCu);
      }

      goto LABEL_27;
    }

    if (sqlite3_step(*p_updateTLSSupportedProtocolVersionForTaskStmt) != 101)
    {
      id v18 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v22 = [v6 identifier];
        v23 = sqlite3_errmsg(self->_dbConnection);
        int v24 = 134218242;
        int v25 = v22;
        int v26 = 2080;
        id v27 = v23;
        _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Failed to update TLSSupportedProtocolVersions for task %lu into db. Error= %s",  (uint8_t *)&v24,  0x16u);
      }
    }

    sqlite3_reset(*p_updateTLSSupportedProtocolVersionForTaskStmt);
  }

  else
  {
    v13 = (os_log_s *)qword_100083990;
    if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "sqlite db not initialized",  (uint8_t *)&v24,  2u);
    }
  }

      goto LABEL_33;
    }

    if (sqlite3_bind_int64(*p_updateSuspendPathEntriesForTaskStmt, 2, (sqlite3_int64)[v6 suspendCount]))
    {
      uint64_t v12 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v19 = [v6 suspendCount];
        int v24 = 134217984;
        int v25 = v19;
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to bind suspendCount (%lu) to the select statement",  (uint8_t *)&v24,  0xCu);
      }

      goto LABEL_27;
    }

    int v15 = *p_updateSuspendPathEntriesForTaskStmt;
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v6 sessionID]);
    LOBYTE(v15) = sqlite3_bind_text(v15, 3, (const char *)[v16 UTF8String], -1, 0) == 0;

    if ((v15 & 1) == 0)
    {
      uint64_t v12 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue([v6 sessionID]);
        int v24 = 138412290;
        int v25 = v20;
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to bind sessionID (%@) to the select statement",  (uint8_t *)&v24,  0xCu);
      }

      goto LABEL_27;
    }

    if (sqlite3_bind_int(*p_updateSuspendPathEntriesForTaskStmt, 4, (int)[v6 identifier]))
    {
      uint64_t v12 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v21 = [v6 identifier];
        int v24 = 134217984;
        int v25 = v21;
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to bind identifier (%lu) to the select statement",  (uint8_t *)&v24,  0xCu);
      }

      goto LABEL_27;
    }

    if (sqlite3_step(*p_updateSuspendPathEntriesForTaskStmt) != 101)
    {
      id v18 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v22 = [v6 identifier];
        v23 = sqlite3_errmsg(self->_dbConnection);
        int v24 = 134218242;
        int v25 = v22;
        int v26 = 2080;
        id v27 = v23;
        _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Failed to update suspend related entries for task %lu into db. Error= %s",  (uint8_t *)&v24,  0x16u);
      }
    }

    sqlite3_reset(*p_updateSuspendPathEntriesForTaskStmt);
  }

  else
  {
    v13 = (os_log_s *)qword_100083990;
    if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "sqlite db not initialized",  (uint8_t *)&v24,  2u);
    }
  }

LABEL_28:
}
}
}

void sub_100009A6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009ECC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_29:
}
}
}
}
}
}

    v41[2](v41, v40);
    goto LABEL_30;
  }

  if (self->_clientProxy
    || self->_sendsLaunchEvents && -[NDApplication supportsWakes](self->_clientApplication, "supportsWakes"))
  {
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472LL;
    v43[2] = sub_100029DE8;
    v43[3] = &unk_100079220;
    v44 = v13;
    v45 = self;
    v49 = v10;
    id v18 = v40;
    v46 = v18;
    id v19 = v42;
    v47 = v19;
    v48 = v41;
    v20 = objc_retainBlock(v43);
    id v21 = objc_alloc(&OBJC_CLASS___PendingCallback);
    v22 = objc_retainBlock(v20);
    v23 = [v22 copy];
    int v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v18, v23, 0LL));
    int v25 = -[PendingCallback initWithCallbackType:taskIdentifier:args:]( v21,  "initWithCallbackType:taskIdentifier:args:",  5LL,  v10,  v24);

    [v19 _releasePreventIdleSleepAssertionIfAppropriate];
    callbackQueue = self->_callbackQueue;
    if (self->_sendsLaunchEvents)
    {
      if (-[NDApplication supportsWakes](self->_clientApplication, "supportsWakes")) {
        id v27 = 2LL;
      }
      else {
        id v27 = 0LL;
      }
    }

    else
    {
      id v27 = 0LL;
    }

    -[NDCallbackQueue addPendingCallback:wakeRequirement:]( callbackQueue,  "addPendingCallback:wakeRequirement:",  v25,  v27);

    v35 = v44;
  }

  else
  {
    int v30 = [v13 shouldCancelOnDisconnect];
    v31 = (os_log_s *)(id)qword_100083990;
    int v28 = v31;
    if (!v30)
    {
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
        v37 = (NSString *)objc_claimAutoreleasedReturnValue([v42 _loggableDescription]);
        *(_DWORD *)buf = 138543618;
        v51 = v36;
        v52 = 2114;
        v53 = v37;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ using proposed request since the client application is not running and doesn 't support wakes",  buf,  0x16u);
      }

      goto LABEL_29;
    }

    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      v39 = (NSString *)objc_claimAutoreleasedReturnValue([v42 _loggableDescription]);
      *(_DWORD *)buf = 138543618;
      v51 = v38;
      v52 = 2114;
      v53 = v39;
      _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> %{public}@ established a connection which requires the client to be running, but it isn't running and doesn't support app wakes. Canceling the task.",  buf,  0x16u);
    }

    v32 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      v34 = self->_clientBundleID;
      *(_DWORD *)buf = 138543618;
      v51 = v33;
      v52 = 2112;
      v53 = v34;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> Perhaps the client %@ was uninstalled?",  buf,  0x16u);
    }

    v35 = (void *)objc_claimAutoreleasedReturnValue([v42 error:NSURLErrorDomain code:-997]);
    objc_msgSend(v42, "cancel_with_error:", v35);
    v41[2](v41, 0LL);
  }

LABEL_30:
}

void sub_10000A34C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000A7AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000AC30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_33:
}
}

void sub_10000B114(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B570(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B9BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000BE0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_25:
}

void sub_10000C15C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000C450(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000C86C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_22:
}

  return v5;
}

void sub_10000CD0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000D1F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_31:
      goto LABEL_37;
    }

    if (sqlite3_bind_int(*p_updateSetPriorityEntriesForTaskStmt, 2, (int)[v6 basePriority]))
    {
      uint64_t v12 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v18 = [v6 basePriority];
        int v25 = 134217984;
        int v26 = v18;
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to bind basePriority (%lu) to the select statement",  (uint8_t *)&v25,  0xCu);
      }

      goto LABEL_31;
    }

    if (sqlite3_bind_int(*p_updateSetPriorityEntriesForTaskStmt, 3, (int)[v6 basePrioritySetExplicitly]))
    {
      uint64_t v12 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v20 = [v6 basePrioritySetExplicitly];
        int v25 = 134217984;
        int v26 = (id)v20;
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to bind basePrioritySetExplicitly (%lu) to the select statement",  (uint8_t *)&v25,  0xCu);
      }

      goto LABEL_31;
    }

    int v15 = *p_updateSetPriorityEntriesForTaskStmt;
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v6 sessionID]);
    LOBYTE(v15) = sqlite3_bind_text(v15, 4, (const char *)[v16 UTF8String], -1, 0) == 0;

    if ((v15 & 1) == 0)
    {
      uint64_t v12 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v6 sessionID]);
        int v25 = 138412290;
        int v26 = v21;
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to bind sessionID (%@) to the select statement",  (uint8_t *)&v25,  0xCu);
      }

      goto LABEL_31;
    }

    if (sqlite3_bind_int(*p_updateSetPriorityEntriesForTaskStmt, 5, (int)[v6 identifier]))
    {
      uint64_t v12 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v22 = [v6 identifier];
        int v25 = 134217984;
        int v26 = v22;
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to bind identifier (%lu) to the select statement",  (uint8_t *)&v25,  0xCu);
      }

      goto LABEL_31;
    }

    if (sqlite3_step(*p_updateSetPriorityEntriesForTaskStmt) != 101)
    {
      id v19 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v23 = [v6 identifier];
        int v24 = sqlite3_errmsg(self->_dbConnection);
        int v25 = 134218242;
        int v26 = v23;
        id v27 = 2080;
        int v28 = v24;
        _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Failed to update setPriority related entries for task %lu into db. Error= %s",  (uint8_t *)&v25,  0x16u);
      }
    }

    sqlite3_reset(*p_updateSetPriorityEntriesForTaskStmt);
  }

  else
  {
    v13 = (os_log_s *)qword_100083990;
    if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "sqlite db not initialized",  (uint8_t *)&v25,  2u);
    }
  }

LABEL_37:
}

void sub_10000D758(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000DA0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000DCD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000DDEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000E128(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10000E594(uint64_t a1)
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  id v2 = *(id *)(a1 + 40);
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend( *(id *)(a1 + 32),  "_onqueue_deleteEntryForTask:forSession:sessionUUID:",  objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * (void)v5), "unsignedIntValue", (void)v7),  *(void *)(a1 + 48),  *(void *)(a1 + 56));
        uint64_t v5 = (char *)v5 + 1;
      }

      while (v3 != v5);
      id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }

    while (v3);
  }

  return [*(id *)(a1 + 32) _commitSqliteTransaction];
}

void sub_10000E6AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10000E6CC(uint64_t a1)
{
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id obj = *(id *)(a1 + 40);
  id v2 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v2)
  {
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0LL; i != v2; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)i);
        uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKey:v4]);
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) objectForKeyedSubscript:v4]);
        __int128 v17 = 0u;
        __int128 v18 = 0u;
        __int128 v15 = 0u;
        __int128 v16 = 0u;
        id v7 = v5;
        id v8 = [v7 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v8)
        {
          uint64_t v9 = *(void *)v16;
          do
          {
            for (j = 0LL; j != v8; j = (char *)j + 1)
            {
              if (*(void *)v16 != v9) {
                objc_enumerationMutation(v7);
              }
              unsigned int v11 = [*(id *)(*((void *)&v15 + 1) + 8 * (void)j) unsignedIntValue];
              [*(id *)(a1 + 32) _updateDBEntryForTask:v6 updateType:v11 sessionUUID:*(void *)(a1 + 56)];
              if (v11 == 13) {
                [*(id *)(a1 + 48) removeObjectForKey:v4];
              }
            }

            id v8 = [v7 countByEnumeratingWithState:&v15 objects:v23 count:16];
          }

          while (v8);
        }
      }

      id v2 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
    }

    while (v2);
  }

  return [*(id *)(a1 + 32) _commitSqliteTransaction];
}

void sub_10000E8C4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

void sub_10000E914(uint64_t a1)
{
  id v2 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v19 = *(void *)(a1 + 32);
    int v21 = 138412290;
    v22[0] = v19;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEBUG,  "_getAllSessionIDsForBundle for bundleID %@",  (uint8_t *)&v21,  0xCu);
  }

  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(sqlite3 **)(v3 + 40);
  if (!v4 || !*(_BYTE *)(v3 + 24))
  {
    unsigned int v11 = (os_log_s *)qword_100083990;
    if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "sqlite db not initialized",  (uint8_t *)&v21,  2u);
    }

    return;
  }

  id v7 = *(sqlite3_stmt **)(v3 + 192);
  uint64_t v5 = (sqlite3_stmt **)(v3 + 192);
  uint64_t v6 = v7;
  if (v7) {
    goto LABEL_6;
  }
  if (!sqlite3_prepare_v2(v4, "SELECT DISTINCT session_id FROM session_tasks WHERE bundle_id = ?", -1, v5, 0LL))
  {
    uint64_t v6 = *(sqlite3_stmt **)(*(void *)(a1 + 40) + 192LL);
LABEL_6:
    if (sqlite3_bind_text( v6, 1, (const char *)[*(id *)(a1 + 32) UTF8String], -1, 0))
    {
      id v8 = (os_log_s *)qword_100083990;
      if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        int v21 = 138412290;
        v22[0] = v9;
        __int128 v10 = "Failed to bind bundleID (%@) to the select statement";
LABEL_14:
        _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v21, 0xCu);
        return;
      }
    }

    else
    {
      v13 = *(sqlite3_stmt **)(*(void *)(a1 + 40) + 192LL);
      if (v13)
      {
        int v14 = 0;
        while (sqlite3_step(v13) == 100)
        {
          __int128 v15 = sqlite3_column_text(*(sqlite3_stmt **)(*(void *)(a1 + 40) + 192LL), 0);
          if (v15)
          {
            __int128 v16 = *(void **)(a1 + 48);
            __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v15));
            [v16 addObject:v17];
          }

          v13 = *(sqlite3_stmt **)(*(void *)(a1 + 40) + 192LL);
          ++v14;
        }

        __int128 v18 = (os_log_s *)qword_100083990;
        if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v20 = *(void *)(a1 + 32);
          int v21 = 67109378;
          LODWORD(v22[0]) = v14;
          WORD2(v22[0]) = 2112;
          *(void *)((char *)v22 + 6) = v20;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "_getAllSessionIDsForBundle entries: %d for bundle: %@",  (uint8_t *)&v21,  0x12u);
        }

        sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 40) + 192LL));
      }
    }

    return;
  }

  id v8 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    int v21 = 138412290;
    v22[0] = v12;
    __int128 v10 = "Failed to init the _getAllSessionsStmt statement for session_tasks for bundle: %@";
    goto LABEL_14;
  }

void sub_10000EBD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

sqlite3 *sub_10000EBE8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(sqlite3_stmt **)(v2 + 48);
  if (v3)
  {
    sqlite3_finalize(v3);
    uint64_t v2 = *(void *)(a1 + 32);
  }

  uint64_t v4 = *(sqlite3_stmt **)(v2 + 56);
  if (v4)
  {
    sqlite3_finalize(v4);
    uint64_t v2 = *(void *)(a1 + 32);
  }

  uint64_t v5 = *(sqlite3_stmt **)(v2 + 64);
  if (v5)
  {
    sqlite3_finalize(v5);
    uint64_t v2 = *(void *)(a1 + 32);
  }

  uint64_t v6 = *(sqlite3_stmt **)(v2 + 80);
  if (v6)
  {
    sqlite3_finalize(v6);
    uint64_t v2 = *(void *)(a1 + 32);
  }

  id v7 = *(sqlite3_stmt **)(v2 + 88);
  if (v7)
  {
    sqlite3_finalize(v7);
    uint64_t v2 = *(void *)(a1 + 32);
  }

  id v8 = *(sqlite3_stmt **)(v2 + 72);
  if (v8)
  {
    sqlite3_finalize(v8);
    uint64_t v2 = *(void *)(a1 + 32);
  }

  uint64_t v9 = *(sqlite3_stmt **)(v2 + 96);
  if (v9)
  {
    sqlite3_finalize(v9);
    uint64_t v2 = *(void *)(a1 + 32);
  }

  __int128 v10 = *(sqlite3_stmt **)(v2 + 104);
  if (v10)
  {
    sqlite3_finalize(v10);
    uint64_t v2 = *(void *)(a1 + 32);
  }

  unsigned int v11 = *(sqlite3_stmt **)(v2 + 112);
  if (v11)
  {
    sqlite3_finalize(v11);
    uint64_t v2 = *(void *)(a1 + 32);
  }

  uint64_t v12 = *(sqlite3_stmt **)(v2 + 120);
  if (v12)
  {
    sqlite3_finalize(v12);
    uint64_t v2 = *(void *)(a1 + 32);
  }

  v13 = *(sqlite3_stmt **)(v2 + 128);
  if (v13)
  {
    sqlite3_finalize(v13);
    uint64_t v2 = *(void *)(a1 + 32);
  }

  int v14 = *(sqlite3_stmt **)(v2 + 136);
  if (v14)
  {
    sqlite3_finalize(v14);
    uint64_t v2 = *(void *)(a1 + 32);
  }

  __int128 v15 = *(sqlite3_stmt **)(v2 + 152);
  if (v15)
  {
    sqlite3_finalize(v15);
    uint64_t v2 = *(void *)(a1 + 32);
  }

  __int128 v16 = *(sqlite3_stmt **)(v2 + 160);
  if (v16)
  {
    sqlite3_finalize(v16);
    uint64_t v2 = *(void *)(a1 + 32);
  }

  __int128 v17 = *(sqlite3_stmt **)(v2 + 168);
  if (v17)
  {
    sqlite3_finalize(v17);
    uint64_t v2 = *(void *)(a1 + 32);
  }

  __int128 v18 = *(sqlite3_stmt **)(v2 + 176);
  if (v18)
  {
    sqlite3_finalize(v18);
    uint64_t v2 = *(void *)(a1 + 32);
  }

  uint64_t v19 = *(sqlite3_stmt **)(v2 + 184);
  if (v19)
  {
    sqlite3_finalize(v19);
    uint64_t v2 = *(void *)(a1 + 32);
  }

  uint64_t v20 = *(sqlite3_stmt **)(v2 + 144);
  if (v20)
  {
    sqlite3_finalize(v20);
    uint64_t v2 = *(void *)(a1 + 32);
  }

  int v21 = *(sqlite3_stmt **)(v2 + 192);
  if (v21)
  {
    sqlite3_finalize(v21);
    uint64_t v2 = *(void *)(a1 + 32);
  }

  result = *(sqlite3 **)(v2 + 40);
  if (result)
  {
    result = (sqlite3 *)sqlite3_close(result);
    *(void *)(*(void *)(a1 + 32) + 40LL) = 0LL;
    uint64_t v2 = *(void *)(a1 + 32);
  }

  *(_BYTE *)(v2 + 24) = 0;
  return result;
}

id sub_10000ED54(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_onqueue_garbageCollect");
}

id sub_10000ED5C(uint64_t a1)
{
  return _objc_msgSend( *(id *)(a1 + 32),  "_onqueue_deleteAllTaskEntriesForSession:sessionUUID:",  *(void *)(a1 + 40),  *(void *)(a1 + 48));
}

void sub_10000ED6C(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v19 = *(void *)(a1 + 32);
    int v20 = 138412290;
    v21[0] = v19;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEBUG,  "_getAllTasksFromDBForSession: %@",  (uint8_t *)&v20,  0xCu);
  }

  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(sqlite3 **)(v3 + 40);
  if (!v4 || !*(_BYTE *)(v3 + 24))
  {
    unsigned int v11 = (os_log_s *)qword_100083990;
    if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "sqlite db not initialized",  (uint8_t *)&v20,  2u);
    }

    return;
  }

  id v7 = *(sqlite3_stmt **)(v3 + 56);
  uint64_t v5 = (sqlite3_stmt **)(v3 + 56);
  uint64_t v6 = v7;
  if (v7) {
    goto LABEL_6;
  }
  if (!sqlite3_prepare_v2(v4, "SELECT * from session_tasks WHERE session_id = ? LIMIT 512", -1, v5, 0LL))
  {
    uint64_t v6 = *(sqlite3_stmt **)(*(void *)(a1 + 40) + 56LL);
LABEL_6:
    if (sqlite3_bind_text( v6, 1, (const char *)[*(id *)(a1 + 48) UTF8String], -1, 0))
    {
      id v8 = (os_log_s *)qword_100083990;
      if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        int v20 = 138412290;
        v21[0] = v9;
        __int128 v10 = "Failed to bind sessionID (%@) to the select statement";
LABEL_14:
        _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v20, 0xCu);
        return;
      }
    }

    else
    {
      v13 = *(sqlite3_stmt **)(*(void *)(a1 + 40) + 56LL);
      if (v13)
      {
        int v14 = 0;
        while (sqlite3_step(v13) == 100)
        {
          __int128 v15 = objc_autoreleasePoolPush();
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(a1 + 40),  "_onqueue_convertSqlRowToTaskInfoEntry:",  *(void *)(*(void *)(a1 + 40) + 56)));
          if (v16) {
            [*(id *)(a1 + 56) addObject:v16];
          }

          objc_autoreleasePoolPop(v15);
          v13 = *(sqlite3_stmt **)(*(void *)(a1 + 40) + 56LL);
          ++v14;
        }

        __int128 v17 = (os_log_s *)qword_100083990;
        if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = *(void *)(a1 + 32);
          int v20 = 67109378;
          LODWORD(v21[0]) = v14;
          WORD2(v21[0]) = 2112;
          *(void *)((char *)v21 + 6) = v18;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "_getAllTasksFromDB entries: %d for session: %@",  (uint8_t *)&v20,  0x12u);
        }

        sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 40) + 56LL));
      }
    }

    return;
  }

  id v8 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    int v20 = 138412290;
    v21[0] = v12;
    __int128 v10 = "Failed to init the _selectEntriesStmt statement for session_tasks for session: %@";
    goto LABEL_14;
  }

void sub_10000F01C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10000F034(uint64_t a1)
{
  id result = objc_msgSend(*(id *)(a1 + 32), "_onqueue_initDB");
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_BYTE)result;
  return result;
}

void sub_10000F064(id a1)
{
  uint64_t v1 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSArray);
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSSet);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSData);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSURL);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDate);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSUUID);
  __int128 v10 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v1,  v2,  v3,  v4,  v5,  v6,  v7,  v8,  v9,  objc_opt_class(&OBJC_CLASS___NSURLSessionConfiguration),  0LL);
  uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = (void *)qword_100083908;
  qword_100083908 = v11;
}

void sub_10000F334( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

LABEL_30:
  v36 = 0LL;
LABEL_31:
  v38 = [v36 mutableCopy];
  v39 = (void *)objc_claimAutoreleasedReturnValue( [v38 objectForKeyedSubscript:@"AVAssetDownloadTaskMinimumRequiredMediaBitrateKey"]);
  v40 = v39 == 0LL;

  if (!v40)
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue( [v38 objectForKeyedSubscript:@"AVAssetDownloadTaskMinimumRequiredMediaBitrateKey"]);
    [v38 setObject:v41 forKeyedSubscript:AVAssetDownloadSessionMinimumRequiredMediaBitrateKey];

    [v38 removeObjectForKey:@"AVAssetDownloadTaskMinimumRequiredMediaBitrateKey"];
  }

  int v14 = v38;

  objc_storeStrong((id *)&v55->_options, v38);
  objc_storeWeak((id *)&v55->_delegate, v54);
  objc_storeStrong((id *)&v55->_delegateQueue, a7);
  v42 = objc_claimAutoreleasedReturnValue( +[AVAssetDownloadSession assetDownloadSessionWithAsset:mediaSelections:destinationURL:options:]( &OBJC_CLASS___AVAssetDownloadSession,  "assetDownloadSessionWithAsset:mediaSelections:destinationURL:options:",  v13,  v19,  v53,  v14));
  downloadSession = v55->_downloadSession;
  v55->_downloadSession = (AVAssetDownloadSession *)v42;

  v44 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v45 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v44);
  v46 = dispatch_queue_create("com.apple.nsurlsessionf.avassetdownloadersessionwrappercallback", v45);
  callbackQueue = v55->_callbackQueue;
  v55->_callbackQueue = (OS_dispatch_queue *)v46;

  -[AVAssetDownloadSession setDelegate:queue:](v55->_downloadSession, "setDelegate:queue:", v55, v55->_callbackQueue);
  v55->_downloadToken = (unint64_t)-[AVAssetDownloadSession downloadToken]( v55->_downloadSession,  "downloadToken");

LABEL_34:
  return v55;
}

void sub_10000F8F8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_10000FD2C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000FE58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000FEF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000FF3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000FF80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000FFE4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100010038( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_1000105CC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56LL));
  [WeakRetained NDAVAssetDownloadSessionWrapper:*(void *)(a1 + 32) willDownloadVariants:*(void *)(a1 + 40)];
}

void sub_10001060C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_100010620(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) countOfBytesWritten];
  [*(id *)(a1 + 32) setCountOfBytesWritten:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setCountOfBytesExpectedToWrite:*(void *)(a1 + 48)];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56LL));
  objc_msgSend( WeakRetained,  "NDAVAssetDownloadSessionWrapper:didUpdateProgressWithLastBytesWritten:totalBytesWritten:totalBytesExpectedToWrite:",  *(void *)(a1 + 32),  v2 - (void)v3,  objc_msgSend(*(id *)(a1 + 32), "countOfBytesWritten"),  objc_msgSend(*(id *)(a1 + 32), "countOfBytesExpectedToWrite"));
}

void sub_1000106B8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_1000106CC(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 56LL));
    uint64_t v2 = *(void *)(a1 + 40);
    id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) propertyList]);
    [WeakRetained NDAVAssetDownloadSessionWrapper:v2 didResolveMediaSelectionPropertyList:v3];
  }

void sub_100010740( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100010760(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56LL));
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) propertyList]);
  [WeakRetained NDAVAssetDownloadSessionWrapper:v2 didFinishDownloadForMediaSelectionPropertyList:v3];
}

void sub_1000107BC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000107DC(uint64_t a1)
{
  __int128 v2 = *(_OWORD *)(a1 + 72);
  v11[0] = *(_OWORD *)(a1 + 56);
  v11[1] = v2;
  v11[2] = *(_OWORD *)(a1 + 88);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCMTimeRange:](&OBJC_CLASS___NSValue, "valueWithCMTimeRange:", v11));
  __int128 v4 = *(_OWORD *)(a1 + 120);
  v10[0] = *(_OWORD *)(a1 + 104);
  v10[1] = v4;
  v10[2] = *(_OWORD *)(a1 + 136);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCMTimeRange:](&OBJC_CLASS___NSValue, "valueWithCMTimeRange:", v10));
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56LL));
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) propertyList]);
  [WeakRetained NDAVAssetDownloadSessionWrapper:v8 didLoadTimeRange:v3 totalTimeRangesLoaded:v7 timeRangeExpectedToLoad:v5 forMediaSelectionPropertyList:v9];
}

void sub_1000108B4(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1000108E4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56LL));
  [WeakRetained NDAVAssetDownloadSessionWrapper:*(void *)(a1 + 32) didCompleteWithError:*(void *)(a1 + 40)];
}

void sub_10001092C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_100010940(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56LL));
  [WeakRetained NDAVAssetDownloadSessionWrapper:*(void *)(a1 + 32) didCompleteWithError:0];
}

void sub_10001098C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

id sub_1000109A0()
{
  v0 = NSTemporaryDirectory();
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(v0);
  __int128 v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v1, 1LL));

  return v2;
}

void sub_1000109EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000109FC(void *a1)
{
  id v14 = a1;
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  NSURLResourceKey v17 = NSURLIsDirectoryKey;
  __int128 v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( [v1 enumeratorAtURL:v14 includingPropertiesForKeys:v2 options:5 errorHandler:&stru_100078DE8]);

  while (1)
  {
    __int128 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 nextObject]);
    if (!v4) {
      break;
    }
    uint64_t v5 = objc_autoreleasePoolPush();
    id v16 = 0LL;
    unsigned int v6 = [v4 getResourceValue:&v16 forKey:NSURLIsDirectoryKey error:0];
    id v7 = v16;
    uint64_t v8 = v7;
    if (v6 && [v7 BOOLValue])
    {
      if (+[NDFileUtilities itemShouldBePurged:](&OBJC_CLASS___NDFileUtilities, "itemShouldBePurged:", v4))
      {
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        [v9 removeItemAtURL:v4 error:0];
      }

      else
      {
        id v15 = 0LL;
        unsigned int v10 = [v4 getResourceValue:&v15 forKey:NSURLNameKey error:0];
        id v11 = v15;
        uint64_t v9 = v11;
        if (v10
          && [v11 hasPrefix:@"CFNetworkDownload_"]
          && [v9 hasSuffix:@".tmp"])
        {
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NDFileUtilities fetchStreamingZipModificationDate:]( &OBJC_CLASS___NDFileUtilities,  "fetchStreamingZipModificationDate:",  v4));
          BOOL v13 = v12 == 0LL;

          if (v13) {
            +[NDFileUtilities updateStreamingZipModificationDate:]( &OBJC_CLASS___NDFileUtilities,  "updateStreamingZipModificationDate:",  v4);
          }
        }
      }
    }

    objc_autoreleasePoolPop(v5);
  }
}

void sub_100010C20( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

BOOL sub_100010C90(id a1, NSURL *a2, NSError *a3)
{
  __int128 v4 = a2;
  uint64_t v5 = a3;
  unsigned int v6 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138412546;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "NDCacheDeleteFixUpDirectoriesOnStartup enumeration failed at %@ error=%@",  (uint8_t *)&v8,  0x16u);
  }

  return 1;
}

BOOL sub_100010D60(id a1, NSURL *a2, NSError *a3)
{
  __int128 v4 = a2;
  uint64_t v5 = a3;
  unsigned int v6 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138412546;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "NDCacheDeleteFixUpDirectoriesInContainer enumeration failed at %@ error=%@",  (uint8_t *)&v8,  0x16u);
  }

  return 1;
}

__CFDictionary *__cdecl sub_100010E30(id a1, int a2, __CFDictionary *a3)
{
  v32 = a3;
  __int128 v4 = (void *)objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKeyedSubscript:]( v32,  "objectForKeyedSubscript:",  @"CACHE_DELETE_VOLUME"));
  v34 = (void *)objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKeyedSubscript:]( v32,  "objectForKeyedSubscript:",  @"CACHE_DELETE_AMOUNT",  v4));
  id v35 = v4;
  uint64_t v5 = (uint64_t)[v34 longLongValue];
  id v6 = sub_1000113EC(v35, a2);
  v33 = (void *)objc_claimAutoreleasedReturnValue(v6);
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v33 keysSortedByValueUsingComparator:&stru_100078E68]);
  id v7 = [obj countByEnumeratingWithState:&v42 objects:v52 count:16];
  if (v7)
  {
    uint64_t v37 = 0LL;
    uint64_t v39 = *(void *)v43;
LABEL_3:
    id v38 = v7;
    uint64_t v8 = 0LL;
    while (1)
    {
      if (*(void *)v43 != v39) {
        objc_enumerationMutation(obj);
      }
      uint64_t v9 = *(void **)(*((void *)&v42 + 1) + 8 * v8);
      __int16 v10 = objc_autoreleasePoolPush();
      id v11 = sub_100011814(v9);
      id v41 = 0LL;
      unsigned int v12 = [v9 getResourceValue:&v41 forKey:NSURLIsDirectoryKey error:0];
      id v13 = v41;
      id v14 = v13;
      if (v12 && [v13 BOOLValue])
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
        id v40 = 0LL;
        unsigned int v16 = [v9 getResourceValue:&v40 forKey:NSURLParentDirectoryURLKey error:0];
        id v17 = v40;
        if (v16)
        {
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v15 UUIDString]);
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:relativeToURL:",  v18,  1LL,  v17));

          +[NDFileUtilities markItemAsPurged:](&OBJC_CLASS___NDFileUtilities, "markItemAsPurged:", v9);
          int v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
          unsigned int v21 = [v20 moveItemAtURL:v9 toURL:v19 error:0];

          id v22 = v21 ? v19 : 0LL;
        }

        else
        {
          id v22 = 0LL;
        }
      }

      else
      {
        id v22 = v9;
      }

      if (v22)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        unsigned int v24 = [v23 removeItemAtURL:v22 error:0];

        if (v24)
        {
          v37 += (uint64_t)v11;
          v5 -= (uint64_t)v11;
          int v25 = (os_log_s *)qword_100083990;
          if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v49 = v22;
            __int16 v50 = 2048;
            id v51 = v11;
            _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "CacheDelete request - Purged %@ [%zu bytes]",  buf,  0x16u);
          }
        }
      }

      objc_autoreleasePoolPop(v10);
      if (v5 < 1) {
        break;
      }
      if (v38 == (id)++v8)
      {
        id v7 = [obj countByEnumeratingWithState:&v42 objects:v52 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  else
  {
    uint64_t v37 = 0LL;
  }

  int v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v37));
  id v27 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    id v28 = [v26 longLongValue];
    id v29 = [v34 longLongValue];
    *(_DWORD *)v52 = 134218498;
    id v53 = v28;
    __int16 v54 = 2112;
    id v55 = v35;
    __int16 v56 = 2048;
    id v57 = v29;
    _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Purged %lld bytes on volume %@.  CacheDelete requested %lld.",  v52,  0x20u);
  }

  v46[0] = @"CACHE_DELETE_AMOUNT";
  v46[1] = @"CACHE_DELETE_VOLUME";
  v47[0] = v26;
  v47[1] = v35;
  int v30 = (__CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v47,  v46,  2LL));

  return v30;
}

void sub_1000112E4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, void *a18)
{
}

id sub_1000113EC(void *a1, int a2)
{
  id v27 = a1;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:"));
  id v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  dbl_10005E1C0[a2 > 2]));
  id v28 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v3 = sub_1000109A0();
  int v30 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (v30 && sub_100011950(v30, v31))
  {
    id v4 = sub_100011A5C(v30, v29);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    if (v5) {
      [v28 addEntriesFromDictionary:v5];
    }
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NDFileUtilities defaultDownloadDirectoryContainer]( &OBJC_CLASS___NDFileUtilities,  "defaultDownloadDirectoryContainer"));
  id v7 = v6;
  if (v6)
  {
    int v26 = v6;
    unsigned int v8 = sub_100011950(v6, v31);
    id v7 = v26;
    if (v8)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      v35[0] = NSURLIsDirectoryKey;
      v35[1] = NSURLIsSymbolicLinkKey;
      v35[2] = NSURLIsVolumeKey;
      __int16 v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v35, 3LL));
      id v11 = (void *)objc_claimAutoreleasedReturnValue( [v9 enumeratorAtURL:v26 includingPropertiesForKeys:v10 options:5 errorHandler:&stru_100078E08]);

      uint64_t v12 = 0LL;
      while (1)
      {

        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v11 nextObject]);
        if (!v9)
        {
LABEL_22:

          id v7 = v26;
          break;
        }

        id v13 = objc_autoreleasePoolPush();
        id v34 = 0LL;
        unsigned int v14 = [v9 getResourceValue:&v34 forKey:NSURLIsDirectoryKey error:0];
        id v15 = v34;
        unsigned int v16 = v15;
        if (v14 && [v15 BOOLValue])
        {
          id v33 = 0LL;
          unsigned int v17 = [v9 getResourceValue:&v33 forKey:NSURLIsVolumeKey error:0];
          id v18 = v33;
          uint64_t v19 = v18;
          if (v17 && ([v18 BOOLValue] & 1) == 0)
          {
            id v32 = 0LL;
            unsigned int v20 = [v9 getResourceValue:&v32 forKey:NSURLIsSymbolicLinkKey error:0];
            id v21 = v32;
            id v22 = v21;
            if (v20 && ([v21 BOOLValue] & 1) == 0)
            {
              id v23 = sub_100011A5C(v9, v29);
              unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
              if (v24)
              {
                [v28 addEntriesFromDictionary:v24];
                v12 += (uint64_t)[v24 count];
              }
            }

            goto LABEL_21;
          }
        }

        else
        {
          uint64_t v19 = 0LL;
        }

        id v22 = 0LL;
LABEL_21:

        objc_autoreleasePoolPop(v13);
      }
    }
  }

  return v28;
}

void sub_10001173C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

id sub_100011814(void *a1)
{
  id v1 = a1;
  id v13 = 0LL;
  unsigned int v2 = [v1 getResourceValue:&v13 forKey:NSURLIsDirectoryKey error:0];
  id v3 = v13;
  id v4 = v3;
  if (!v2 || ![v3 BOOLValue])
  {
    id v11 = 0LL;
    unsigned int v8 = [v1 getResourceValue:&v11 forKey:NSURLFileAllocatedSizeKey error:0];
    id v9 = v11;
    id v6 = v9;
    if (v8)
    {
      id v7 = [v9 longLongValue];
      goto LABEL_11;
    }

LABEL_10:
    id v7 = 0LL;
    goto LABEL_11;
  }

  id v5 = [v1 fileSystemRepresentation];
  if (!v5)
  {
    id v6 = 0LL;
    goto LABEL_10;
  }

  id v6 = 0LL;
  else {
    id v7 = v12;
  }
LABEL_11:

  return v7;
}

void sub_100011920(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

int64_t sub_100011948(id a1, NSDate *a2, NSDate *a3)
{
  return -[NSDate compare:](a2, "compare:", a3);
}

id sub_100011950(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v4)
  {
    id v11 = 0LL;
    unsigned int v5 = [v3 getResourceValue:&v11 forKey:NSURLVolumeIdentifierKey error:0];
    id v6 = v11;
    if (v5)
    {
      id v10 = 0LL;
      id v7 = [v4 getResourceValue:&v10 forKey:NSURLVolumeIdentifierKey error:0];
      id v8 = v10;
      if ((_DWORD)v7) {
        id v7 = [v6 isEqual:v8];
      }
    }

    else
    {
      id v8 = 0LL;
      id v7 = 0LL;
    }
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

void sub_100011A40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100011A5C(void *a1, void *a2)
{
  id v24 = a1;
  id v26 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v31[0] = NSURLFileAllocatedSizeKey;
  v31[1] = NSURLIsDirectoryKey;
  v31[2] = NSURLIsRegularFileKey;
  v31[3] = NSURLAttributeModificationDateKey;
  v31[4] = NSURLNameKey;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v31, 5LL));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( [v3 enumeratorAtURL:v24 includingPropertiesForKeys:v4 options:5 errorHandler:&stru_100078E28]);

  id v25 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  for (uint64_t i = 10000LL; ; --i)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 nextObject]);
    if (!v7) {
      break;
    }
    id v8 = objc_autoreleasePoolPush();
    id v9 = v7;
    id v30 = 0LL;
    unsigned int v10 = [v9 getResourceValue:&v30 forKey:NSURLIsRegularFileKey error:0];
    id v11 = v30;
    uint64_t v12 = v11;
    if (v10 && ([v11 BOOLValue] & 1) != 0)
    {
      int v13 = 1;
    }

    else
    {
      id v29 = 0LL;
      unsigned int v14 = [v9 getResourceValue:&v29 forKey:NSURLIsDirectoryKey error:0];
      id v15 = v29;

      if (!v14 || ![v15 BOOLValue])
      {
        unsigned int v20 = 0LL;
        goto LABEL_17;
      }

      int v13 = 0;
      uint64_t v12 = v15;
    }

    id v28 = 0LL;
    unsigned int v16 = [v9 getResourceValue:&v28 forKey:NSURLNameKey error:0];
    id v17 = v28;
    id v18 = v17;
    if (v16
      && [v17 hasPrefix:@"CFNetworkDownload_"]
      && [v18 hasSuffix:@".tmp"])
    {
      if (v13)
      {
        id v27 = 0LL;
        [v9 getResourceValue:&v27 forKey:NSURLAttributeModificationDateKey error:0];
        id v19 = v27;
      }

      else
      {
        id v19 = (id)objc_claimAutoreleasedReturnValue( +[NDFileUtilities fetchStreamingZipModificationDate:]( &OBJC_CLASS___NDFileUtilities,  "fetchStreamingZipModificationDate:",  v9));
      }

      unsigned int v20 = v19;
    }

    else
    {
      unsigned int v20 = 0LL;
    }

    id v15 = v12;
LABEL_17:

    if (v20)
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 earlierDate:v26]);
      BOOL v22 = v21 == v20;

      if (v22) {
        [v25 setObject:v20 forKey:v9];
      }
    }

    objc_autoreleasePoolPop(v8);
    if (!i) {
      goto LABEL_25;
    }
  }

  id v9 = 0LL;
LABEL_25:

  return v25;
}

void sub_100011D74( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

BOOL sub_100011E00(id a1, NSURL *a2, NSError *a3)
{
  id v4 = a2;
  unsigned int v5 = a3;
  id v6 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138412546;
    id v9 = v4;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "NDCacheDeletePurgableItemsForVolume enumeration failed at %@ error=%@",  (uint8_t *)&v8,  0x16u);
  }

  return 1;
}

BOOL sub_100011ED0(id a1, NSURL *a2, NSError *a3)
{
  id v4 = a2;
  unsigned int v5 = a3;
  id v6 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138412546;
    id v9 = v4;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "NDCacheDeleteGetPurgableItemsInContainer enumeration failed at %@ error=%@",  (uint8_t *)&v8,  0x16u);
  }

  return 1;
}

__CFDictionary *__cdecl sub_100011FA0(id a1, int a2, __CFDictionary *a3)
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKeyedSubscript:]( v4,  "objectForKeyedSubscript:",  @"CACHE_DELETE_VOLUME"));
  id v6 = sub_1000113EC(v5, a2);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = 0LL;
  id v9 = [v7 countByEnumeratingWithState:&v20 objects:buf count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v21;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)v11);
        int v13 = objc_autoreleasePoolPush();
        id v14 = sub_100011814(v12);
        objc_autoreleasePoolPop(v13);
        v8 += (uint64_t)v14;
        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v20 objects:buf count:16];
    }

    while (v9);
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  v8,  (void)v20));
  unsigned int v16 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = [v15 longLongValue];
    *(_DWORD *)buf = 134218242;
    id v27 = v17;
    __int16 v28 = 2112;
    id v29 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Informing CacheDelete purgable bytes %lld on %@",  buf,  0x16u);
  }

  v24[0] = @"CACHE_DELETE_AMOUNT";
  v24[1] = @"CACHE_DELETE_VOLUME";
  v25[0] = v15;
  v25[1] = v5;
  id v18 = (__CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v25,  v24,  2LL));

  return v18;
}

void sub_1000121A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001248C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_100012554(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100012DD8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, void *a25, uint64_t a26, uint64_t a27, void *a28)
{
  _Unwind_Resume(a1);
}

void sub_100013040(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100013808(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100013A18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100014440( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1000148A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100014A04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100014BD0(_Unwind_Exception *a1)
{
  id v7 = v6;

  _Unwind_Resume(a1);
}

void sub_100014C8C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100014D98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100014E70( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

LABEL_11:
}

void sub_100015054(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000153A4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) enumerateKeysAndObjectsUsingBlock:&stru_100078F50];
}

void sub_1000153B8(id a1, id a2, id a3, BOOL *a4)
{
}

id sub_1000153C0(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) enumerateKeysAndObjectsUsingBlock:&stru_100078F30];
}

void sub_1000153D4(id a1, id a2, id a3, BOOL *a4)
{
}

id sub_1000153DC(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) enumerateKeysAndObjectsUsingBlock:&stru_100078F10];
}

void sub_1000153F0(id a1, id a2, id a3, BOOL *a4)
{
}

void sub_1000153F8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) obliterationCompletion]);

  if (v3)
  {
    id v4 = (void (**)(void))objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) obliterationCompletion]);
    [*(id *)(a1 + 32) setObliterationCompletion:0];
    v4[2]();
  }

void sub_100015480( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_100015494(id a1, id a2, id a3, BOOL *a4)
{
}

uint64_t sub_10001549C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1000154A8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 40))
  {
    id v3 = (os_log_s *)qword_100083990;
    if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(v1 + 24);
      int v8 = 138412290;
      uint64_t v9 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Ending boost activity from %@",  (uint8_t *)&v8,  0xCu);
    }

    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
    [v5 endActivity:*(void *)(*(void *)(a1 + 32) + 40)];

    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0LL;
  }

void sub_100015590(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000155A8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v2 + 64))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NDSpringBoard sharedSpringBoard](&OBJC_CLASS___NDSpringBoard, "sharedSpringBoard"));
    unsigned int v4 = [v3 applicationIsForeground:*(void *)(*(void *)(a1 + 32) + 24)];

    if (!v4)
    {
      uint64_t v9 = (os_log_s *)qword_100083990;
      if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 24LL);
        int v11 = 138412290;
        uint64_t v12 = v10;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "Capturing boost activity from %@ unnecessary",  (uint8_t *)&v11,  0xCu);
      }

      goto LABEL_10;
    }

    uint64_t v2 = *(void *)(a1 + 32);
  }

  if (*(void *)(v2 + 40))
  {
LABEL_10:
    int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
    [v8 endActivity:*(void *)(a1 + 40)];
    goto LABEL_11;
  }

  unsigned int v5 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(v2 + 24);
    int v11 = 138412290;
    uint64_t v12 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Capturing boost activity from %@",  (uint8_t *)&v11,  0xCu);
    uint64_t v2 = *(void *)(a1 + 32);
  }

  id v7 = *(id *)(a1 + 40);
  int v8 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v7;
LABEL_11:
}

void sub_100015724(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100015748(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 24LL);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Triggering periodic update to powerlog for client %@",  (uint8_t *)&v5,  0xCu);
  }

  return [*(id *)(*(void *)(a1 + 32) + 8) enumerateKeysAndObjectsUsingBlock:&stru_100078EA8];
}

void sub_100015800(id a1, id a2, id a3, BOOL *a4)
{
}

void sub_1000158B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100015988( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100016274(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100016D7C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1000171A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100017334(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100017790( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
}

void sub_1000179D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100017BC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100017DD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100017E5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100018060(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100018150(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100018400(_Unwind_Exception *a1)
{
  int v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1000185E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001867C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100019020(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000192E0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000194B0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001963C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100019AB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100019F74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001A604( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_10001AABC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_14:
            }
          }

          id v19 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  objc_msgSend(v11, "identifier", v49)));
          __int16 v56 = 0;
          if ([v11 shouldCancelOnDisconnect] && (uint64_t)objc_msgSend(v11, "state") <= 2)
          {
            [v11 setState:3];
            __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v11 currentRequest]);
            __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 URL]);
            __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLError _web_errorWithDomain:code:URL:]( &OBJC_CLASS___NSURLError,  "_web_errorWithDomain:code:URL:",  NSURLErrorDomain,  -997LL,  v21));
            [v11 setError:v22];

            __int128 v23 = (os_log_s *)(id)qword_100083990;
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              __int128 v42 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
              __int128 v43 = (NSString *)(id)objc_claimAutoreleasedReturnValue([v11 _loggableDescription]);
              __int128 v44 = (NSString *)objc_claimAutoreleasedReturnValue([v11 error]);
              __int128 v45 = (void *)objc_claimAutoreleasedReturnValue([v11 error]);
              v46 = (NSString *)[v45 code];
              *(_DWORD *)buf = 138544130;
              v62 = v42;
              v63 = 2114;
              v64 = v43;
              v65 = 2112;
              v66 = v44;
              v67 = 2048;
              v68 = v46;
              _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> %{public}@ completed with error %@ [%ld] (was active before nsurlsessiond exit)",  buf,  0x2Au);
            }
          }

          id v24 = (void *)objc_claimAutoreleasedReturnValue( -[NDBackgroundSession restoreTask:isOutstanding:]( self,  "restoreTask:isOutstanding:",  v11,  &v56));
          if (v24)
          {
            if (v56)
            {
              id v25 = (os_log_s *)(id)qword_100083990;
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                id v26 = (void *)objc_claimAutoreleasedReturnValue([v11 _loggableDescription]);
                *(_DWORD *)buf = 138543362;
                v62 = v26;
                _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Adding %{public}@ to outstanding tasks",  buf,  0xCu);
              }

              -[NDBackgroundSession addOutstandingTaskWithIdentifier:]( self,  "addOutstandingTaskWithIdentifier:",  [v11 identifier]);
              [v52 addObject:v11];
            }

            -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_identifiersToTaskInfo,  "setObject:forKeyedSubscript:",  v11,  v19);
            -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_identifiersToTasks,  "setObject:forKeyedSubscript:",  v24,  v19);
            -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_tasksToIdentifiers,  "setObject:forKeyedSubscript:",  v19,  v24);
          }

          else
          {
            [v51 addObject:v19];
            id v27 = (os_log_s *)(id)qword_100083990;
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
              identifier = self->_identifier;
              id v40 = self->_clientBundleID;
              *(_DWORD *)buf = 138544130;
              v62 = v39;
              v63 = 2112;
              v64 = v19;
              v65 = 2112;
              v66 = v40;
              v67 = 2112;
              v68 = identifier;
              _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> Couldn't recreate existing task with identifier: %@ in session: <%@>.<%@>",  buf,  0x2Au);
            }
          }
        }

        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      v47 = [obj countByEnumeratingWithState:&v57 objects:v69 count:16];
      int v8 = v47;
    }

    while (v47);
  }

      __int128 v45 = 0LL;
      __int128 v44 = 0LL;
      id v25 = [v15 getResourceValue:&v45 forKey:NSURLIsSymbolicLinkKey error:&v44];
      id v26 = v45;
      __int128 v23 = v44;
      if ((v25 & 1) != 0)
      {
        if (![v26 BOOLValue])
        {
LABEL_22:
          if (v10 >= 1)
          {
            sandbox_extension_release(v10);
            id v29 = (os_log_s *)(id)qword_100083990;
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              id v30 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
              *(_DWORD *)buf = 138543618;
              v47 = v30;
              v48 = 2048;
              id v49 = (_BYTE *)v10;
              _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> Released sandbox extension %lld",  buf,  0x16u);
            }
          }

          id v19 = v15;

          id v24 = v19;
          goto LABEL_39;
        }

        id v27 = (os_log_s *)(id)qword_100083990;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          __int128 v42 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
          *(_DWORD *)buf = 138543362;
          v47 = v42;
          _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> File is a symlink",  buf,  0xCu);
        }
      }

      else
      {
        id v27 = (os_log_s *)(id)qword_100083990;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          id v35 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
          v36 = [v23 code];
          *(_DWORD *)buf = 138543874;
          v47 = v35;
          v48 = 2112;
          id v49 = v23;
          __int16 v50 = 2048;
          id v51 = (uint64_t)v36;
          _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> Error checking resource value: %@ [%ld]",  buf,  0x20u);
        }
      }

      __int16 v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      [v28 removeItemAtURL:v15 error:0];

      id v15 = 0LL;
      goto LABEL_22;
    }

    __int128 v23 = (id)qword_100083990;
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
    {
      id v40 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      id v41 = *__error();
      *(_DWORD *)buf = 138543618;
      v47 = v40;
      v48 = 1024;
      LODWORD(v49) = v41;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v23,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> Error creating file: %{errno}d",  buf,  0x12u);
    }

    id v24 = 0LL;
  }

  else
  {
    __int128 v23 = (id)qword_100083990;
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      *(_DWORD *)buf = 138543618;
      v47 = v37;
      v48 = 1024;
      LODWORD(v49) = v16;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v23,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> Error cloning file: %{errno}d",  buf,  0x12u);
    }

    id v24 = 0LL;
    id v19 = v15;
  }

LABEL_40:
  return v52;
}

        outstandingTaskIDs = self->_outstandingTaskIDs;
        __int128 v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v75));
        LOBYTE(outstandingTaskIDs) = -[NSMutableArray containsObject:]( outstandingTaskIDs,  "containsObject:",  v45);

        if ((outstandingTaskIDs & 1) != 0)
        {
          v74 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          v46 = (void *)objc_claimAutoreleasedReturnValue([v13 _backgroundTrailers]);
          v47 = v46 == 0LL;

          if (!v47)
          {
            v48 = (void *)objc_claimAutoreleasedReturnValue([v13 _backgroundTrailers]);
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v74,  "setObject:forKeyedSubscript:",  v48,  @"trailers");
          }

          id v49 = objc_alloc(&OBJC_CLASS___PendingCallback);
          __int16 v50 = v76;
          if (!v76) {
            __int16 v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
          }
          v83[0] = v50;
          id v51 = (void *)objc_claimAutoreleasedReturnValue([v13 taskMetrics]);
          v52 = v51;
          if (!v51) {
            v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
          }
          v83[1] = v52;
          v83[2] = v74;
          id v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v83, 3LL));
          __int16 v54 = -[PendingCallback initWithCallbackType:taskIdentifier:args:]( v49,  "initWithCallbackType:taskIdentifier:args:",  0LL,  v75,  v53);

          if (!v51) {
          if (!v76)
          }

          -[NDCallbackQueue addPendingCallback:wakeRequirement:]( self->_callbackQueue,  "addPendingCallback:wakeRequirement:",  v54,  0LL);
          -[NDBackgroundSession removeOutstandingTaskWithIdentifier:](self, "removeOutstandingTaskWithIdentifier:", v75);
          -[NDBackgroundSession handleCompletionOfTask:identifier:taskInfo:isRecoverable:suppressWake:]( self,  "handleCompletionOfTask:identifier:taskInfo:isRecoverable:suppressWake:",  v7,  v75,  v13,  0LL,  v72);
          -[NDBackgroundSession removeUploadFileForTaskInfo:](self, "removeUploadFileForTaskInfo:", v13);
          v79[0] = _NSConcreteStackBlock;
          v79[1] = 3221225472LL;
          v79[2] = sub_10002A3C0;
          v79[3] = &unk_100079968;
          v80 = v13;
          v81 = v76;
          v82 = self;
          id v55 = objc_retainBlock(v79);
          if ((v73 & (v8 != 0LL)) == 1
            && (__int16 v56 = (void *)objc_claimAutoreleasedReturnValue([v7 _extractor])) != 0
            && (id v57 = [v7 _extractorFinishedDecoding], v56, (v57 & 1) == 0))
          {
            v77[0] = _NSConcreteStackBlock;
            v77[1] = 3221225472LL;
            v77[2] = sub_10002A450;
            v77[3] = &unk_100079768;
            v78 = v55;
            [v7 terminateExtractorWithError:v8 completion:v77];
          }

          else
          {
            ((void (*)(void *))v55[2])(v55);
          }
        }

        goto LABEL_57;
      }
    }

    else
    {
    }

    id v33 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      id v40 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      id v41 = (void *)objc_claimAutoreleasedReturnValue([v7 _loggableDescription]);
      __int128 v42 = self->_clientBundleID;
      __int128 v43 = [v8 code];
      *(_DWORD *)buf = 138544130;
      v85 = v40;
      v86 = 2114;
      v87 = v41;
      v88 = 2112;
      v89 = v42;
      v90 = 2048;
      v91 = v43;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ for client %@ completed with error - code: %ld",  buf,  0x2Au);
    }

    goto LABEL_40;
  }

void sub_10001B32C()
{
  objc_end_catch();
  JUMPOUT(0x10001B478LL);
}

void sub_10001B340()
{
  JUMPOUT(0x10001B490LL);
}

void sub_10001B350()
{
}

void sub_10001B358()
{
  JUMPOUT(0x10001B4A0LL);
}

void sub_10001B588( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8, uint64_t a9, ...)
{
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001B7C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001B988(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_19:
  return v11 != 0LL;
}

void sub_10001C01C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001C184( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001C200( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_10001C2F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001C448(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001C4F0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001C890(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001CB6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001CE28( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_10001CF6C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_10001D004( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_10001D160(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001D2BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_63:
    goto LABEL_64;
  }

  id v14 = [v7 discretionaryOverride];
  LOBYTE(discretionary) = v14 == (id)1;
  int v8 = (NDApplication *)(id)qword_100083990;
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    id v17 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 _loggableDescription]);
    id v18 = objc_claimAutoreleasedReturnValue(-[NDApplication bundleIdentifier](self->_clientApplication, "bundleIdentifier"));
    id v19 = (void *)v18;
    id v40 = 138544130;
    if (v14 == (id)1) {
      __int128 v20 = 89;
    }
    else {
      __int128 v20 = 78;
    }
    id v41 = v16;
    __int128 v42 = 2114;
    __int128 v43 = v17;
    __int128 v44 = 2112;
    __int128 v45 = v18;
    v46 = 1024;
    v47 = v20;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v8,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ for %@ is overriding discretionary status - forcing to %c",  (uint8_t *)&v40,  0x26u);
  }

LABEL_66:
  return discretionary;
}

void sub_10001D984(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001DB00( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001DEEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_24:
      v6[2](v6);
      goto LABEL_25;
    }

    if (v15)
    {
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v9 _loggableDescription]);
      *(_DWORD *)buf = 138543618;
      __int128 v45 = v21;
      v46 = 2114;
      v47 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ receiving delayed request callback",  buf,  0x16u);
    }

    if (!self->_clientProxy
      && (!self->_sendsLaunchEvents || !-[NDApplication supportsWakes](self->_clientApplication, "supportsWakes")))
    {
      id v30 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
        id v32 = (void *)objc_claimAutoreleasedReturnValue([v9 _loggableDescription]);
        *(_DWORD *)buf = 138543618;
        __int128 v45 = v31;
        v46 = 2114;
        v47 = v32;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ client is not running and doesn't support wakes, continuing load for delayed request",  buf,  0x16u);
      }

      [v12 setRespondedToWillBeginDelayedRequestCallback:1];
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v12 identifier]));
      -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:]( self,  "queueUpdatesForTask:updateType:highPriority:",  v14,  9LL,  0LL);
      goto LABEL_24;
    }

    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 currentRequest]);
    id v35 = _NSConcreteStackBlock;
    v36 = 3221225472LL;
    uint64_t v37 = sub_10002B778;
    id v38 = &unk_100079090;
    uint64_t v39 = self;
    __int128 v42 = a3;
    id v40 = v12;
    id v41 = v6;
    __int128 v23 = objc_retainBlock(&v35);
    id v24 = objc_alloc(&OBJC_CLASS___PendingCallback);
    v43[0] = v18;
    id v25 = objc_retainBlock(v23);
    v43[1] = v25;
    id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v43,  2LL,  v35,  v36,  v37,  v38,  v39));
    id v27 = -[PendingCallback initWithCallbackType:taskIdentifier:args:]( v24,  "initWithCallbackType:taskIdentifier:args:",  9LL,  a3,  v26);

    callbackQueue = self->_callbackQueue;
    if (self->_sendsLaunchEvents)
    {
      if (-[NDApplication supportsWakes](self->_clientApplication, "supportsWakes")) {
        id v29 = 2LL;
      }
      else {
        id v29 = 0LL;
      }
    }

    else
    {
      id v29 = 0LL;
    }

    -[NDCallbackQueue addPendingCallback:wakeRequirement:]( callbackQueue,  "addPendingCallback:wakeRequirement:",  v27,  v29);
  }

  else
  {
    id v18 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v33 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      id v34 = (void *)objc_claimAutoreleasedReturnValue([v12 _loggableDescription]);
      *(_DWORD *)buf = 138544130;
      __int128 v45 = v33;
      v46 = 2114;
      v47 = v34;
      v48 = 2112;
      id v49 = v9;
      __int16 v50 = 2112;
      id v51 = v12;
      _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> %{public}@ cannot handle delayed request callback because task: %@ or taskInfo: %@ is nil",  buf,  0x2Au);
    }
  }

LABEL_25:
}

  [v18 setCurrentRequest:v69];
  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v69 URL]);
  id v40 = -[NDBackgroundSession errorIfBlockedTracker:url:](self, "errorIfBlockedTracker:url:", v68, v39);

  if ((v40 & 1) != 0)
  {
    id v41 = 0LL;
    __int128 v42 = v19;
LABEL_30:
    ((void (*)(void *, id))v42[2])(v42, v41);
    goto LABEL_31;
  }

  __int128 v43 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v44 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    __int128 v45 = (void *)objc_claimAutoreleasedReturnValue([v68 _loggableDescription]);
    *(_DWORD *)buf = 138544130;
    v84 = v44;
    v85 = 2114;
    v86 = v45;
    v87 = 2112;
    v88 = v66;
    v89 = 2112;
    v90 = v69;
    _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ willPerformHTTPRedirection, response: %@, new request: %@",  buf,  0x2Au);
  }

  clientProxy = self->_clientProxy;
  __int128 v42 = v67;
  id v41 = v69;
  if (!clientProxy) {
    goto LABEL_30;
  }
  v74[0] = _NSConcreteStackBlock;
  v74[1] = 3221225472LL;
  v74[2] = sub_10002A6D4;
  v74[3] = &unk_100079180;
  v74[4] = self;
  v47 = v68;
  v75 = v47;
  v48 = v67;
  v77 = v48;
  id v49 = v69;
  v76 = v49;
  __int16 v50 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:]( clientProxy,  "remoteObjectProxyWithErrorHandler:",  v74));
  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472LL;
  v70[2] = sub_10002A814;
  v70[3] = &unk_1000791A8;
  v70[4] = self;
  v71 = v47;
  v72 = v19;
  v73 = v48;
  [v50 backgroundTask:v14 willPerformHTTPRedirection:v66 withNewRequest:v49 reply:v70];

LABEL_31:
}

void sub_10001E4C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001E814(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001EA4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001EB08( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_10001EB64( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

LABEL_39:
  return v24;
}

void sub_10001F2F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001F58C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001F750(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001F8A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001F9E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001FC08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100020248(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000207DC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_100020BCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100020F28( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1000213AC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_100021850( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_100021CD0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_100022044( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1000222B8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_100022498(_Unwind_Exception *a1)
{
  int v5 = v4;

  _Unwind_Resume(a1);
}

void sub_100022688(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000229D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100022C64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100022DC0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000232F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100023694(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000238C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100023A0C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100023B3C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100023C6C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10002403C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100024128( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_100024180( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_100024340(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002447C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100024680(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100024F8C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

LABEL_9:
  if ((v20 & 1) != 0)
  {
LABEL_12:
  }

  return v15;
}

LABEL_13:
  if (v25)
  {
    id v26 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      id v27 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      __int16 v28 = (void *)objc_claimAutoreleasedReturnValue([v68 _loggableDescription]);
      id v29 = (void *)objc_claimAutoreleasedReturnValue([v18 currentRequest]);
      *(_DWORD *)buf = 138544130;
      v84 = v27;
      v85 = 2114;
      v86 = v28;
      v87 = 2112;
      v88 = v69;
      v89 = 2112;
      v90 = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ modifying conditional connection properties since new request %@ is to a diffe rent host than previous request %@",  buf,  0x2Au);
    }

    id v30 = (NSMutableDictionary *)[v68 _copySocketStreamProperties];
    if (!v30) {
      id v30 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    }
    v31 = kCFStreamPropertyConditionalConnectionProperties;
    id v32 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v30,  "objectForKeyedSubscript:",  kCFStreamPropertyConditionalConnectionProperties));
    id v33 = (NSMutableDictionary *)[v32 mutableCopy];

    if (!v33) {
      id v33 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v33,  "setObject:forKeyedSubscript:",  &off_10007B490,  kConditionalConnectionRequirementTimeWindowDelay);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v33,  "setObject:forKeyedSubscript:",  &off_10007B4C0,  kConditionalConnectionRequirementTimeWindowDuration);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v33,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  kConditionalConnectionIsDiscretionary);
    id v34 = (void *)objc_claimAutoreleasedReturnValue([v68 _legacySocketStreamProperties]);
    id v35 = [v34 mutableCopy];
    v36 = v35;
    if (v35) {
      uint64_t v37 = (NSMutableDictionary *)v35;
    }
    else {
      uint64_t v37 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    }
    id v38 = v37;

    -[NSMutableDictionary setObject:forKeyedSubscript:](v38, "setObject:forKeyedSubscript:", v33, v31);
    objc_msgSend(v68, "set_legacySocketStreamProperties:", v38);
  }

  return (char)v9;
}

void sub_1000258A8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, void *a24, void *a25, void *a26, void *a27, void *a28)
{
  _Unwind_Resume(a1);
}

void sub_100025C0C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100025EA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100026160(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_57:
}

void sub_100026D28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000273E4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10002785C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100027B9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100027E80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000280D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100028244( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_100028818( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100028AA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100028C48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100028E84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100028F5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002928C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002976C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100029A9C(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) _loggableDescription]);
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 280LL);
    int v8 = 138544130;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    int v11 = v6;
    __int16 v12 = 2112;
    id v13 = v3;
    __int16 v14 = 2112;
    uint64_t v15 = v7;
    _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> %{public}@ client disconnected (error %@) when attempting to communicate with HTTP Authenti cator for Client %@",  (uint8_t *)&v8,  0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_100029BC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100029BF8(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
    int v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) _loggableDescription]);
    int v12 = 138544386;
    id v13 = v10;
    __int16 v14 = 2114;
    uint64_t v15 = v11;
    __int16 v16 = 1024;
    int v17 = a2;
    __int16 v18 = 2112;
    id v19 = v7;
    __int16 v20 = 2112;
    id v21 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ received auth headers for response, continueLoad: %d authHeaders %@ newRequest %@",  (uint8_t *)&v12,  0x30u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_100029D40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100029D74(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    dup((int)[v3 fileDescriptor]);
    [v4 closeFile];
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100029DD4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_100029DE8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) taskKind] == (id)2)
  {
    [*(id *)(a1 + 32) setShouldCancelOnDisconnect:1];
    id v7 = *(void **)(a1 + 40);
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)(a1 + 72)));
    [v7 queueUpdatesForTask:v8 updateType:10 highPriority:0];
  }

  id v17 = v5;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) HTTPBodyStream]);
  __int16 v10 = v9;
  if (v9 && ![v9 streamStatus])
  {
    [v10 open];
    [v10 close];
  }

  id v11 = v17;
  if (v6)
  {
    id v11 = [v17 mutableCopy];
    int v12 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 40) inputStreamWithFileHandle:v6 taskIdentifier:*(void *)(a1 + 72)]);
    [v11 setHTTPBodyStream:v12];
  }

  uint64_t v13 = *(void *)(a1 + 56);
  __int16 v14 = *(void **)(a1 + 40);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) URL]);
  LODWORD(v13) = [v14 errorIfBlockedTracker:v13 url:v15];

  if ((_DWORD)v13) {
    id v16 = 0LL;
  }
  else {
    id v16 = v11;
  }
  (*(void (**)(void, id))(*(void *)(a1 + 64) + 16LL))(*(void *)(a1 + 64), v16);
}

void sub_100029F60( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100029FCC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) _loggableDescription]);
    int v7 = 138543874;
    id v8 = v5;
    __int16 v9 = 2114;
    __int16 v10 = v6;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> %{public}@ client disconnected (error %@) during didReciveData delegate",  (uint8_t *)&v7,  0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_10002A0DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10002A10C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10002A118(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) _loggableDescription]);
    int v8 = 138543874;
    __int16 v9 = v5;
    __int16 v10 = 2114;
    __int16 v11 = v6;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ client disconnected (error %@) with didReceiveResponse outstanding, responding w ith a cancel disposition",  (uint8_t *)&v8,  0x20u);
  }

  int v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) error:NSURLErrorDomain code:-997]);
  objc_msgSend(*(id *)(a1 + 40), "cancel_with_error:", v7);
  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_10002A258(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10002A294(uint64_t a1, int a2)
{
  id v4 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) _loggableDescription]);
    int v8 = 138543874;
    __int16 v9 = v5;
    __int16 v10 = 2114;
    __int16 v11 = v6;
    __int16 v12 = 1024;
    int v13 = a2;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ client responded to didReceiveResponse with disposition %d",  (uint8_t *)&v8,  0x1Cu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_10002A39C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002A3C0(uint64_t a1)
{
  if (![*(id *)(a1 + 32) taskKind])
  {
    uint64_t v2 = *(void **)(a1 + 40);
    if (v2)
    {
      id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 userInfo]);
      id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:NSURLSessionDownloadTaskResumeData]);

      if (!v4) {
        [*(id *)(a1 + 48) removeDownloadFileForTaskInfo:*(void *)(a1 + 32)];
      }
    }
  }

void sub_10002A440(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10002A450(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10002A45C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) _loggableDescription]);
    int v7 = 138543874;
    int v8 = v5;
    __int16 v9 = 2114;
    __int16 v10 = v6;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> %{public}@ client disconnected (error %@) with new body stream request outstanding, providing no body",  (uint8_t *)&v7,  0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_10002A570(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002A5A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = v3;
  if (v3) {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) inputStreamWithFileHandle:v3 taskIdentifier:*(void *)(a1 + 48)]);
  }
  else {
    id v4 = 0LL;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_10002A60C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_10002A62C(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setCurrentRequest:");
  id v3 = *(void **)(a1 + 40);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)(a1 + 56)));
  [v3 queueUpdatesForTask:v4 updateType:8 highPriority:0];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_10002A6B4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10002A6D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) _loggableDescription]);
    int v7 = 138543874;
    int v8 = v5;
    __int16 v9 = 2114;
    __int16 v10 = v6;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> %{public}@ client disconnected (error %@) with redirection outstanding, following redirect",  (uint8_t *)&v7,  0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

void sub_10002A7E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002A814(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v8 = v3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 URL]);
  LODWORD(v4) = [v4 errorIfBlockedTracker:v5 url:v6];

  uint64_t v7 = 56LL;
  if ((_DWORD)v4) {
    uint64_t v7 = 48LL;
  }
  (*(void (**)(void))(*(void *)(a1 + v7) + 16LL))();
}

void sub_10002A898( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10002A8B8(uint64_t a1)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_10002A8DC(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 protectionSpace]);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 authenticationMethod]);
  if (([v2 isEqualToString:NSURLAuthenticationMethodNTLM] & 1) != 0
    || ([v2 isEqualToString:NSURLAuthenticationMethodNegotiate] & 1) != 0
    || ([v2 isEqualToString:NSURLAuthenticationMethodClientCertificate] & 1) != 0)
  {
    uint64_t v3 = 1LL;
  }

  else
  {
    uint64_t v3 = (uint64_t)[v2 isEqualToString:NSURLAuthenticationMethodServerTrust];
  }

  return v3;
}

void sub_10002A984(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002A9A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) _loggableDescription]);
    int v7 = 138543618;
    id v8 = v5;
    __int16 v9 = 2114;
    __int16 v10 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ received resume data",  (uint8_t *)&v7,  0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_10002AAA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002AAD4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) _loggableDescription]);
    int v7 = 138543618;
    id v8 = v5;
    __int16 v9 = 2114;
    __int16 v10 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ received resume data",  (uint8_t *)&v7,  0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_10002ABD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002AC08(uint64_t a1, void *a2, void *a3)
{
  id v19 = a2;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 user]);
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 password]);
  id v8 = (void *)v7;
  if (v6 && v7)
  {
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([v19 host]);
    __int16 v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@%@",  @"__com.apple.CFNetwork.prefix__",  v9,  *(void *)(*(void *)(a1 + 32) + 280LL)));

    __int16 v11 = objc_alloc(&OBJC_CLASS___NSURLProtectionSpace);
    id v12 = [v19 port];
    int v13 = (void *)objc_claimAutoreleasedReturnValue([v19 protocol]);
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v19 realm]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v19 authenticationMethod]);
    id v16 = -[NSURLProtectionSpace initWithHost:port:protocol:realm:authenticationMethod:]( v11,  "initWithHost:port:protocol:realm:authenticationMethod:",  v10,  v12,  v13,  v14,  v15);

    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLCredential credentialWithUser:password:persistence:]( &OBJC_CLASS___NSURLCredential,  "credentialWithUser:password:persistence:",  v6,  v8,  2LL));
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLCredentialStorage sharedCredentialStorage]( &OBJC_CLASS___NSURLCredentialStorage,  "sharedCredentialStorage"));
    [v18 setDefaultCredential:v17 forProtectionSpace:v16];
  }
}

void sub_10002ADA8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_10002AE38(uint64_t a1, void *a2, void *a3)
{
  id v19 = a2;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 user]);
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 password]);
  id v8 = (void *)v7;
  if (v6 && v7)
  {
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([v19 host]);
    __int16 v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@%@",  @"__com.apple.CFNetwork.prefix__",  v9,  *(void *)(*(void *)(a1 + 32) + 280LL)));

    __int16 v11 = objc_alloc(&OBJC_CLASS___NSURLProtectionSpace);
    id v12 = [v19 port];
    int v13 = (void *)objc_claimAutoreleasedReturnValue([v19 protocol]);
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v19 realm]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v19 authenticationMethod]);
    id v16 = -[NSURLProtectionSpace initWithHost:port:protocol:realm:authenticationMethod:]( v11,  "initWithHost:port:protocol:realm:authenticationMethod:",  v10,  v12,  v13,  v14,  v15);

    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLCredential credentialWithUser:password:persistence:]( &OBJC_CLASS___NSURLCredential,  "credentialWithUser:password:persistence:",  v6,  v8,  2LL));
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLCredentialStorage sharedCredentialStorage]( &OBJC_CLASS___NSURLCredentialStorage,  "sharedCredentialStorage"));
    [v18 setDefaultCredential:v17 forProtectionSpace:v16];
  }
}

void sub_10002AFD8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

id sub_10002B068(uint64_t a1)
{
  return [*(id *)(a1 + 32) wakeUpClient:*(void *)(a1 + 40)];
}

void sub_10002B074(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 56LL);
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)(a1 + 40)));
  id v7 = (id)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:v3]);

  id v4 = *(void **)(*(void *)(a1 + 32) + 224LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)(a1 + 40)));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);

  [*(id *)(a1 + 32) enqueueTaskWithIdentifier:*(void *)(a1 + 40)];
  if (![v6 state] && !objc_msgSend(v6, "suspendCount") && !*(_BYTE *)(a1 + 48))
  {
    [v7 startResourceTimer];
    [*(id *)(a1 + 32) taskShouldResume:*(void *)(a1 + 40)];
  }
}

void sub_10002B144( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10002B17C(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) _loggableDescription]);
    *(_DWORD *)buf = 138543618;
    id v16 = v3;
    __int16 v17 = 2114;
    __int16 v18 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ resuming",  buf,  0x16u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) _backgroundPublishingURL]);
  BOOL v6 = v5 == 0LL;

  if (!v6) {
  uint64_t v7 = *(void *)(a1 + 56);
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10002B398;
  _OWORD v11[3] = &unk_1000790B8;
  id v8 = *(void **)(a1 + 40);
  id v12 = *(id *)(a1 + 32);
  uint64_t v14 = v7;
  id v13 = v8;
  [v12 handleEarliestBeginDateForTaskWithIdentifier:v7 completionHandler:v11];
  if (([*(id *)(a1 + 40) hasStarted] & 1) == 0
    && ([*(id *)(a1 + 40) isDiscretionary] & 1) == 0)
  {
    [*(id *)(a1 + 40) setStartedUserInitiated:1];
  }

  [*(id *)(a1 + 40) setHasStarted:1];
  __int16 v9 = *(void **)(a1 + 32);
  __int16 v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)(a1 + 56)));
  [v9 queueUpdatesForTask:v10 updateType:14 highPriority:1];
}

void sub_10002B348(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002B398(void *a1, char a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002B42C;
  v4[3] = &unk_100078FC8;
  uint64_t v2 = (void *)a1[5];
  uint64_t v3 = a1[6];
  id v5 = (id)a1[4];
  uint64_t v7 = v3;
  char v8 = a2;
  id v6 = v2;
  [v5 handleWillBeginDelayedRequestForTaskWithIdentifier:v3 completionHandler:v4];
}

void sub_10002B418( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
}

void sub_10002B42C(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 56LL);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)(a1 + 48)));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:v3]);

  if (*(_BYTE *)(a1 + 56))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) requestWithAdjustedWindowForTaskInfo:*(void *)(a1 + 40)]);
    [v4 updateCurrentRequest:v5];
  }

  id v6 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
    char v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) _loggableDescription]);
    *(_DWORD *)buf = 138543618;
    __int16 v20 = v7;
    __int16 v21 = 2114;
    __int128 v22 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ will begin",  buf,  0x16u);
  }

  __int16 v9 = *(void **)(*(void *)(a1 + 32) + 64LL);
  __int16 v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)(a1 + 48)));
  __int16 v11 = (NDTaskMonitor *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v10]);

  if (!v11)
  {
    unsigned int v12 = [*(id *)(a1 + 40) isDiscretionary];
    uint64_t v13 = *(void *)(a1 + 32);
    if (*(_BYTE *)(v13 + 142)) {
      uint64_t v14 = v12 | 2LL;
    }
    else {
      uint64_t v14 = v12;
    }
    __int16 v11 = -[NDTaskMonitor initWithTask:taskInfo:clientBundleIdentifier:secondaryIdentifier:monitoredApplication:priority:options:queue:]( [NDTaskMonitor alloc],  "initWithTask:taskInfo:clientBundleIdentifier:secondaryIdentifier:monitoredApplication:priority:options:queue:",  v4,  *(void *)(a1 + 40),  *(void *)(*(void *)(a1 + 32) + 280),  *(void *)(*(void *)(a1 + 32) + 296),  *(void *)(*(void *)(a1 + 32) + 216),  [*(id *)(a1 + 40) basePriority],  v14,  *(void *)(*(void *)(a1 + 32) + 200));
    uint64_t v15 = *(void **)(*(void *)(a1 + 32) + 64LL);
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)(a1 + 48)));
    [v15 setObject:v11 forKeyedSubscript:v16];
  }

  -[NDTaskMonitor taskWillResume](v11, "taskWillResume");
  sub_100035DF4( 0LL,  *(void **)(*(void *)(a1 + 32) + 280LL),  *(void **)(*(void *)(a1 + 32) + 272LL),  *(void **)(*(void *)(a1 + 32) + 288LL),  *(void **)(*(void *)(a1 + 32) + 296LL),  v4,  *(void **)(a1 + 40),  0);
  __int16 v17 = *(void **)(a1 + 32);
  __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentRequest_URL"));
  LOBYTE(v17) = [v17 errorIfBlockedTracker:v4 url:v18];
}

void sub_10002B6F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002B778(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(*(void *)(a1 + 32) + 56LL);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)(a1 + 56)));
  char v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v7]);

  if (a2 == 1 && v5)
  {
    __int16 v9 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
      __int16 v11 = (void *)objc_claimAutoreleasedReturnValue([v8 _loggableDescription]);
      *(_DWORD *)buf = 138543618;
      id v26 = v10;
      __int16 v27 = 2114;
      __int16 v28 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ using new request from delayed request callback",  buf,  0x16u);
    }

    [v8 updateCurrentRequest:v5];
    [*(id *)(a1 + 40) setCurrentRequest:v5];
    unsigned int v12 = *(void **)(a1 + 32);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [*(id *)(a1 + 40) identifier]));
    [v12 queueUpdatesForTask:v13 updateType:8 highPriority:0];
  }

  else
  {
    uint64_t v13 = (os_log_s *)(id)qword_100083990;
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (a2 == 2)
    {
      if (v14)
      {
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v8 _loggableDescription]);
        *(_DWORD *)buf = 138543618;
        id v26 = v15;
        __int16 v27 = 2114;
        __int16 v28 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ will be canceled due to delayed request callback",  buf,  0x16u);
      }

      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 error:NSURLErrorDomain code:-999]);
      objc_msgSend(v8, "cancel_with_error:", v13);
    }

    else if (v14)
    {
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
      __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v8 _loggableDescription]);
      *(_DWORD *)buf = 138543618;
      id v26 = v17;
      __int16 v27 = 2114;
      __int16 v28 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ continuing load from delayed request callback",  buf,  0x16u);
    }
  }

  [*(id *)(a1 + 40) setRespondedToWillBeginDelayedRequestCallback:1];
  id v19 = *(void **)(a1 + 32);
  __int16 v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [*(id *)(a1 + 40) identifier]));
  [v19 queueUpdatesForTask:v20 updateType:9 highPriority:0];

  __int16 v21 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 200LL);
  LODWORD(v20) = [*(id *)(a1 + 40) qos];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002BB80;
  block[3] = &unk_100079768;
  id v24 = *(id *)(a1 + 48);
  dispatch_block_t v22 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0LL, (dispatch_qos_class_t)v20, 0, block);
  dispatch_async(v21, v22);
}

void sub_10002BB00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10002BB80(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10002BB8C(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) resumedAndWaitingForEarliestBeginDate];
  uint64_t v3 = (os_log_s *)(id)qword_100083990;
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uuid]);
      id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _loggableDescription]);
      int v17 = 138543618;
      __int16 v18 = v5;
      __int16 v19 = 2114;
      __int16 v20 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ can now begin - earliest begin date satisfied",  (uint8_t *)&v17,  0x16u);
    }

    [*(id *)(a1 + 32) setResumedAndWaitingForEarliestBeginDate:0];
    uint64_t v7 = *(void **)(*(void *)(a1 + 40) + 56LL);
    char v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)(a1 + 56)));
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v8]);
    if (v9)
    {
      __int16 v10 = *(void **)(*(void *)(a1 + 40) + 224LL);
      __int16 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)(a1 + 56)));
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v11]);
      LOBYTE(v10) = v12 == 0LL;

      if ((v10 & 1) == 0)
      {
        (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
        return;
      }
    }

    else
    {
    }

    uint64_t v3 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uuid]);
      id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _loggableDescription]);
      int v17 = 138543618;
      __int16 v18 = v15;
      __int16 v19 = 2114;
      __int16 v20 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ no longer has a valid task or taskInfo, no need to begin",  (uint8_t *)&v17,  0x16u);
    }
  }

  else if (v4)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uuid]);
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _loggableDescription]);
    int v17 = 138543618;
    __int16 v18 = v13;
    __int16 v19 = 2114;
    __int16 v20 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ ignoring stale delay begin timer",  (uint8_t *)&v17,  0x16u);
  }
}

void sub_10002BE20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002BE88(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) fillInByteCountsForTaskInfo:v5 withTaskID:v6];
  [*(id *)(a1 + 32) fillInPropertiesForTaskInfo:v5 withTaskID:v6];
}

void sub_10002BEE8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10002BF00(uint64_t a1)
{
  unsigned int v2 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 272LL);
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 280LL);
    int v21 = 138543874;
    dispatch_block_t v22 = v3;
    __int16 v23 = 2112;
    uint64_t v24 = v5;
    __int16 v25 = 2112;
    uint64_t v26 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> Received signal to deliver pending events for client session: <%@>.<%@>",  (uint8_t *)&v21,  0x20u);
  }

  id v6 = *(void **)(a1 + 32);
  if (v6[19])
  {
    uint64_t v7 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      char v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 272LL);
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 280LL);
      int v21 = 138543874;
      dispatch_block_t v22 = v8;
      __int16 v23 = 2112;
      uint64_t v24 = v10;
      __int16 v25 = 2112;
      uint64_t v26 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> Delivering pending events for client session: <%@>.<%@>",  (uint8_t *)&v21,  0x20u);
    }

    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v11 = a1 + 32;
    uint64_t v13 = (void (**)(void))objc_retainBlock(*(id *)(v12 + 152));
    BOOL v14 = *(void **)(*(void *)v11 + 152LL);
    *(void *)(*(void *)v11 + 152LL) = 0LL;

    v13[2](v13);
  }

  else
  {
    uint64_t v15 = (void *)v6[4];
    uint64_t v16 = v6[34];
    int v17 = (void *)objc_claimAutoreleasedReturnValue([v6 uuid]);
    LODWORD(v15) = [v15 isHandlingBackgroundURLSessionWithIdentifier:v16 withSessionUUID:v17];

    if ((_DWORD)v15)
    {
      *(_BYTE *)(*(void *)(a1 + 32) + 145LL) = 1;
    }

    else
    {
      __int16 v18 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
        uint64_t v20 = *(void *)(*(void *)(a1 + 32) + 280LL);
        int v21 = 138543618;
        dispatch_block_t v22 = v19;
        __int16 v23 = 2112;
        uint64_t v24 = v20;
        _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> Application %@ is not handling a background URLSession but we still received a signal t o deliver pending events",  (uint8_t *)&v21,  0x16u);
      }
    }
  }

void sub_10002C160(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10002C1A8(uint64_t a1)
{
  unsigned int v2 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> Invoking client reconnection completion block",  (uint8_t *)&v5,  0xCu);
  }

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 232LL), *(id *)(a1 + 40));
  [*(id *)(*(void *)(a1 + 32) + 208) performAllCallbacks];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_10002C290(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002C2A8(uint64_t a1)
{
  unsigned int v2 = *(void **)(*(void *)(a1 + 32) + 224LL);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)(a1 + 40)));
  id v4 = (id)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:v3]);

  if (*(_BYTE *)(a1 + 48)) {
    [v4 setLowThroughputTimerRetryCount:0];
  }
  if (![v4 state] && !objc_msgSend(v4, "suspendCount")) {
    objc_msgSend(*(id *)(a1 + 32), "taskShouldResume:", objc_msgSend(v4, "identifier"));
  }
}

void sub_10002C350( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10002C370(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 downloadFileURL]);

    if (v10)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 downloadFileURL]);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedDaemon](&OBJC_CLASS___Daemon, "sharedDaemon"));
      if ([v12 isPrivileged])
      {
      }

      else
      {
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 path]);
        BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 120) path]);
        unsigned __int8 v15 = [v13 hasPrefix:v14];

        if ((v15 & 1) == 0)
        {
          uint64_t v16 = (os_log_s *)(id)qword_100083990;
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            int v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
            uint64_t v18 = *(void *)(a1 + 32);
            __int16 v19 = *(void **)(v18 + 280);
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v18 + 120) path]);
            int v21 = (void *)objc_claimAutoreleasedReturnValue([v11 path]);
            *(_DWORD *)buf = 138544130;
            v52 = v17;
            __int16 v53 = 2112;
            id v54 = v19;
            __int16 v55 = 2112;
            id v56 = v20;
            __int16 v57 = 2112;
            id v58 = v21;
            _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> Download directory for bundle %@ has moved to %@, but saved download file path is % @. Need to fix download path",  buf,  0x2Au);
          }

          dispatch_block_t v22 = *(void **)(*(void *)(a1 + 32) + 120LL);
          __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v11 lastPathComponent]);
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v22 URLByAppendingPathComponent:v23]);
          [v9 setDownloadFileURL:v24];

          __int16 v25 = (os_log_s *)(id)qword_100083990;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
            __int16 v27 = (void *)objc_claimAutoreleasedReturnValue([v9 downloadFileURL]);
            __int16 v28 = (void *)objc_claimAutoreleasedReturnValue([v27 path]);
            *(_DWORD *)buf = 138543618;
            v52 = v26;
            __int16 v53 = 2112;
            id v54 = v28;
            _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> New download path: %@",  buf,  0x16u);
          }
        }
      }
    }

    char v50 = 0;
    if ([v9 shouldCancelOnDisconnect] && (uint64_t)objc_msgSend(v9, "state") <= 2)
    {
      [v9 setState:3];
      id v29 = (void *)objc_claimAutoreleasedReturnValue([v9 currentRequest]);
      id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 URL]);
      v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLError _web_errorWithDomain:code:URL:]( &OBJC_CLASS___NSURLError,  "_web_errorWithDomain:code:URL:",  NSURLErrorDomain,  -997LL,  v30));
      [v9 setError:v31];

      uint64_t v32 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        __int128 v45 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
        id v46 = (id)objc_claimAutoreleasedReturnValue([v9 _loggableDescription]);
        v47 = (void *)objc_claimAutoreleasedReturnValue([v9 error]);
        v48 = (void *)objc_claimAutoreleasedReturnValue([v9 error]);
        id v49 = [v48 code];
        *(_DWORD *)buf = 138544130;
        v52 = v45;
        __int16 v53 = 2114;
        id v54 = v46;
        __int16 v55 = 2112;
        id v56 = v47;
        __int16 v57 = 2048;
        id v58 = v49;
        _os_log_error_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> %{public}@ completed with error %@ [%ld] (was active before nsurlsessiond exit)",  buf,  0x2Au);
      }
    }

    id v33 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) restoreTask:v9 isOutstanding:&v50]);
    if (v33)
    {
      if (v50)
      {
        objc_msgSend(*(id *)(a1 + 32), "addOutstandingTaskWithIdentifier:", objc_msgSend(v9, "identifier"));
        [*(id *)(a1 + 40) addObject:v9];
      }

      [*(id *)(*(void *)(a1 + 32) + 224) setObject:v9 forKeyedSubscript:v7];
      [*(id *)(*(void *)(a1 + 32) + 56) setObject:v33 forKeyedSubscript:v7];
      [*(id *)(*(void *)(a1 + 32) + 48) setObject:v7 forKeyedSubscript:v33];
    }

    else
    {
      id v34 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        __int128 v42 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
        __int128 v43 = *(void **)(*(void *)(a1 + 32) + 272LL);
        __int128 v44 = *(void **)(*(void *)(a1 + 32) + 280LL);
        *(_DWORD *)buf = 138544130;
        v52 = v42;
        __int16 v53 = 2112;
        id v54 = v7;
        __int16 v55 = 2112;
        id v56 = v44;
        __int16 v57 = 2112;
        id v58 = v43;
        _os_log_error_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> Couldn't recreate existing task with identifier: %@ in session: <%@>.<%@>",  buf,  0x2Au);
      }
    }
  }

  uint64_t v35 = *(void *)(*(void *)(a1 + 56) + 8LL);
  unint64_t v36 = *(void *)(v35 + 24) + 1LL;
  *(void *)(v35 + 24) = v36;
  if (v36 >= 0x201)
  {
    uint64_t v37 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
    {
      uint64_t v38 = *(void *)(a1 + 32);
      uint64_t v39 = *(void **)(v38 + 272);
      id v40 = *(void **)(v38 + 280);
      id v41 = [*(id *)(a1 + 48) count];
      *(_DWORD *)buf = 138543874;
      v52 = v40;
      __int16 v53 = 2112;
      id v54 = v39;
      __int16 v55 = 2048;
      id v56 = v41;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_FAULT,  "Too many tasks for app session <%{public}@>.<%@> (%zu > 512)",  buf,  0x20u);
    }

    *a4 = 1;
  }
}

void sub_10002C948(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10002CB34(uint64_t a1)
{
  unsigned int v2 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
    int v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) _loggableDescription]);
    int v6 = 138543618;
    id v7 = v4;
    __int16 v8 = 2114;
    uint64_t v9 = v5;
    _os_log_error_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> %{public}@ restored but never started, terminating with timeout",  (uint8_t *)&v6,  0x16u);
  }

  return objc_msgSend(*(id *)(a1 + 48), "cancel_with_error:", *(void *)(a1 + 56));
}

void sub_10002CC20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

_BYTE *sub_10002CC44(uint64_t a1)
{
  id result = *(_BYTE **)(a1 + 32);
  if (result[104]) {
    return _[result storeTaskInfoUpdates:1];
  }
  return result;
}

void sub_10002CC5C(uint64_t a1)
{
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 184) objectForKeyedSubscript:*(void *)(a1 + 40)]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 firstObject]);
  unsigned __int8 v4 = [v3 isEqual:&off_10007B4F0];

  if ((v4 & 1) == 0)
  {
    if ((unint64_t)(*(void *)(a1 + 48) - 13LL) <= 1)
    {
      int v5 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(a1 + 32) + 184) objectForKeyedSubscript:*(void *)(a1 + 40)]);
      [v5 removeAllObjects];
    }

    int v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 184) objectForKeyedSubscript:*(void *)(a1 + 40)]);

    if (!v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      [*(id *)(*(void *)(a1 + 32) + 184) setObject:v7 forKeyedSubscript:*(void *)(a1 + 40)];
    }

    __int16 v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 184) objectForKeyedSubscript:*(void *)(a1 + 40)]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)(a1 + 48)));
    [v8 addObject:v9];

    _[*(id *)(a1 + 32) storeTaskInfoUpdates:*(unsigned __int8 *)(a1 + 56)];
  }

void sub_10002CD84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double *sub_10002CDB0(double *result)
{
  uint64_t v1 = result;
  double v2 = result[5];
  uint64_t v3 = *((void *)result + 4);
  if (*((_BYTE *)result + 48) || v2 > *(double *)(v3 + 96) + 5.0)
  {
    *(double *)(v3 + 96) = v2;
    id result = (double *)[*(id *)(*((void *)result + 4) + 184) count];
    if (result)
    {
      uint64_t v4 = *((void *)v1 + 4);
      int v5 = *(void **)(v4 + 240);
      if (v5)
      {
        uint64_t v6 = *(void *)(v4 + 264);
        uint64_t v7 = *(void *)(v4 + 224);
        id v8 = [*(id *)(v4 + 184) copy];
        [v5 _updateDBEntriesForTasksInSession:v6 taskInfos:v7 updates:v8];

        uint64_t v4 = *((void *)v1 + 4);
      }

      return (double *)[*(id *)(v4 + 184) removeAllObjects];
    }
  }

  else
  {
    *(_BYTE *)(v3 + 104) = 1;
  }

  return result;
}

void sub_10002CE70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002CE80(uint64_t a1)
{
  double v2 = *(void **)(*(void *)(a1 + 32) + 280LL);
  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) bundleIdentifier]);
  if (!objc_msgSend(v2, "isEqualToString:")
    || ([*(id *)(a1 + 32) clientIsActive] & 1) != 0
    || ([*(id *)(a1 + 32) sessionHasOutstandingTasks] & 1) != 0
    || (uint64_t v3 = *(void *)(a1 + 32), !*(_BYTE *)(v3 + 141)))
  {
  }

  else
  {
    id v4 = [*(id *)(v3 + 208) count];

    if (v4) {
      [*(id *)(a1 + 32) wakeUpClient:1];
    }
  }

void sub_10002CF30( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

id sub_10002CF44(uint64_t a1)
{
  double v2 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uuid]);
    uint64_t v4 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) bundleIdentifier]);
    id v5 = (void *)v4;
    int v6 = *(_DWORD *)(a1 + 48);
    if (*(void *)(*(void *)(a1 + 32) + 168LL)) {
      int v7 = 89;
    }
    else {
      int v7 = 78;
    }
    int v9 = 138544130;
    uint64_t v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    __int16 v13 = 1024;
    int v14 = v6;
    __int16 v15 = 1024;
    int v16 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> notified associated application %@(%d) was suspended, XPC(%c)",  (uint8_t *)&v9,  0x22u);
  }

  id result = [*(id *)(*(void *)(a1 + 32) + 168) processIdentifier];
  if ((_DWORD)result == *(_DWORD *)(a1 + 48))
  {
    [*(id *)(*(void *)(a1 + 32) + 168) invalidate];
    return [*(id *)(a1 + 32) clientDidDisconnect];
  }

  return result;
}

void sub_10002D080(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002D11C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002D1A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002D2A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002D308( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)&OBJC_CLASS___NDStatusMonitor;
  -[_Unwind_Exception dealloc](&a9, "dealloc");
  _Unwind_Resume(a1);
}

void sub_10002D688(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002D928(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10002DA14(uint64_t a1)
{
  return _[*(id *)(a1 + 32) handleBetterNetworkEvent];
}

id sub_10002DA1C(uint64_t a1, uint64_t a2, void *a3)
{
  return _[a3 handleDynamicStoreCallback:a1 changedKeys:a2];
}

void sub_10002DA30(void *a1)
{
  double v2 = -[NDStatusMonitorClientHolder initWithClient:identifier:]( objc_alloc(&OBJC_CLASS___NDStatusMonitorClientHolder),  "initWithClient:identifier:",  a1[4],  a1[6]);
  if ([*(id *)(a1[5] + 16) containsObject:v2])
  {
    uint64_t v3 = (os_log_s *)qword_100083990;
    if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Simulating network change event", v5, 2u);
    }

    [*(id *)(a1[5] + 16) removeObject:v2];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[NDStatusMonitorClientHolder client](v2, "client"));
    objc_msgSend( v4,  "statusMonitor:callbackForIdentifier:networkChanged:",  a1[5],  -[NDStatusMonitorClientHolder identifier](v2, "identifier"),  0);
  }
}

void sub_10002DB14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002DB30(void *a1)
{
  if (![*(id *)(a1[4] + 16) count])
  {
    uint64_t v2 = symptom_create("com.apple.symptoms.discretionary.tasks.suspended");
    symptom_set_qualifier(v2, 0LL, 0LL);
    symptom_send(v2);
  }

  uint64_t v3 = -[NDStatusMonitorClientHolder initWithClient:identifier:]( objc_alloc(&OBJC_CLASS___NDStatusMonitorClientHolder),  "initWithClient:identifier:",  a1[5],  a1[6]);
  [*(id *)(a1[4] + 16) addObject:v3];
  dispatch_time_t v4 = dispatch_time(0x8000000000000000LL, 1000000000LL * a1[7]);
  uint64_t v5 = a1[4];
  int v6 = *(dispatch_queue_s **)(v5 + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002DC48;
  block[3] = &unk_100079C58;
  void block[4] = v5;
  int v9 = v3;
  uint64_t v10 = a1[7];
  int v7 = v3;
  dispatch_after(v4, v6, block);
}

void sub_10002DC38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002DC48(void *a1)
{
  if ([*(id *)(a1[4] + 16) containsObject:a1[5]])
  {
    uint64_t v2 = (os_log_s *)qword_100083990;
    if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = a1[6];
      int v7 = 134217984;
      uint64_t v8 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Simulating network change event since %lld seconds have passed",  (uint8_t *)&v7,  0xCu);
    }

    uint64_t v5 = a1[4];
    dispatch_time_t v4 = a1 + 4;
    [*(id *)(v5 + 16) removeObject:v4[1]];
    int v6 = (void *)objc_claimAutoreleasedReturnValue([(id)v4[1] client]);
    objc_msgSend( v6,  "statusMonitor:callbackForIdentifier:networkChanged:",  *v4,  objc_msgSend((id)v4[1], "identifier"),  0);
  }

void sub_10002DD48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002DD60(void *a1)
{
}

void sub_10002DDB0(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___NDStatusMonitor);
  uint64_t v2 = (void *)qword_100083920;
  qword_100083920 = (uint64_t)v1;
}

void sub_10002DE94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002E0B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002E37C(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 40) objectForKeyedSubscript:a1[5]]);

  if (v2)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 40) objectForKeyedSubscript:a1[5]]);
    [v3 removeObjectForKey:a1[6]];

    dispatch_time_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 40) objectForKeyedSubscript:a1[5]]);
    id v5 = [v4 count];

    if (!v5) {
      [*(id *)(a1[4] + 40) removeObjectForKey:a1[5]];
    }
  }

void sub_10002E418(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002E42C(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 40) objectForKey:*(void *)(a1 + 40)]);

  if (!v2)
  {
    uint64_t v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    [*(id *)(*(void *)(a1 + 32) + 40) setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];
  }

  id v4 = objc_retainBlock(*(id *)(a1 + 56));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:*(void *)(a1 + 40)]);
  [v5 setObject:v4 forKeyedSubscript:*(void *)(a1 + 48)];

  int v6 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    int v9 = 138412546;
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Will wake client %@ for session %@ if we receive a notification that it supports launch-on-demand",  (uint8_t *)&v9,  0x16u);
  }

void sub_10002E554(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002E57C(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v8 = 138412546;
    uint64_t v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Attempting to launch client %@ for session %@",  (uint8_t *)&v8,  0x16u);
  }

  if (*(void *)(*(void *)(a1 + 48) + 16LL))
  {
    xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_int64(v5, "com.apple.nsurlsessiond-events.message-type", 1LL);
    xpc_dictionary_set_string( v5, kNSURLSessionLaunchOnDemandClientIdentifierKey, (const char *)[*(id *)(a1 + 32) UTF8String]);
    xpc_dictionary_set_string( v5, kNSURLSessionLaunchOnDemandSessionIdentifierKey, (const char *)[*(id *)(a1 + 40) UTF8String]);
    xpc_connection_send_message(*(xpc_connection_t *)(*(void *)(a1 + 48) + 16LL), v5);
  }

  else
  {
    int v6 = (os_log_s *)qword_100083990;
    if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Couldn't launch application %@ because we don't have an xpc connection to UserEventAgent",  (uint8_t *)&v8,  0xCu);
    }
  }

void sub_10002E718(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002E730(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  if (xpc_get_type(xdict) == (xpc_type_t)&_xpc_type_dictionary
    && xpc_dictionary_get_int64(xdict, "com.apple.nsurlsessiond-events.message-type") == 2)
  {
    xpc_object_t value = xpc_dictionary_get_value(xdict, "com.apple.nsurlsessiond-events.registered-clients");
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(value);
    uint64_t v4 = _CFXPCCreateCFObjectFromXPCObject();
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v4;

    uint64_t v7 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 32) allKeys]);
      *(_DWORD *)buf = 138412290;
      id v33 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Updated Registered Launch-On-Demand Clients: %@",  buf,  0xCu);
    }

    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id obj = *(id *)(*(void *)(a1 + 32) + 32LL);
    id v9 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v27;
      do
      {
        for (uint64_t i = 0LL; i != v9; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v26 + 1) + 8LL * (void)i);
          __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:v12]);
          if (v13)
          {
            [*(id *)(*(void *)(a1 + 32) + 40) removeObjectForKey:v12];
            __int128 v24 = 0u;
            __int128 v25 = 0u;
            __int128 v22 = 0u;
            __int128 v23 = 0u;
            id v14 = v13;
            id v15 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
            if (v15)
            {
              uint64_t v16 = *(void *)v23;
              do
              {
                for (j = 0LL; j != v15; j = (char *)j + 1)
                {
                  if (*(void *)v23 != v16) {
                    objc_enumerationMutation(v14);
                  }
                  uint64_t v18 = (void (**)(void))objc_claimAutoreleasedReturnValue( [v14 objectForKeyedSubscript:*(void *)(*((void *)&v22 + 1) + 8 * (void)j)]);
                  v18[2]();
                }

                id v15 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
              }

              while (v15);
            }
          }
        }

        id v9 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
      }

      while (v9);
    }
  }
}

void sub_10002E9DC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_10002EA68(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received xpc event", buf, 2u);
  }

  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_connection)
  {
    uint64_t v5 = (os_log_s *)qword_100083990;
    if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "NDUserEventAgentConnection received connection",  v6,  2u);
    }

    [*(id *)(a1 + 32) handleNewConnection:v3];
  }
}

void sub_10002EB40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002EB90(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___NDUserEventAgentConnection);
  uint64_t v2 = (void *)qword_100083928;
  qword_100083928 = (uint64_t)v1;
}

void sub_10002EC20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002ECAC(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_10002ED50(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_10002EDC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002EEEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002F038(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_16:
  uint64_t v11 = 0;
LABEL_25:

  return v11;
}

void sub_10002F424(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002F5C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002F71C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002F8F4(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_10002F9B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_7:
}

void sub_10002FAD4(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_10002FB78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002FBD4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_10002FDFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002FF80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000304BC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20)
{
}

void sub_100030678(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000308B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_6:
}

  int v8 = [v5 isValid];
  if (v6) {
    goto LABEL_7;
  }
LABEL_8:

  return v8;
}

void sub_100030A34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100030A84()
{
  uint64_t v10 = 1LL;
  v0 = (void *)container_system_group_path_for_identifier( [0 UTF8String],  objc_msgSend(@"systemgroup.com.apple.nsurlstoragedresources", "UTF8String"),  &v10);
  if (v0)
  {
    uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:",  v0,  1LL,  0LL));
    free(v0);
    if (v1)
    {
      uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue([v1 URLByAppendingPathComponent:@"Library" isDirectory:1]);
      id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      id v9 = 0LL;
      unsigned __int8 v4 = [v3 createDirectoryAtURL:v2 withIntermediateDirectories:1 attributes:0 error:&v9];
      id v5 = v9;

      if ((v4 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        id v8 = [v5 code];
        *(_DWORD *)buf = 138412802;
        uint64_t v12 = v2;
        __int16 v13 = 2112;
        id v14 = v5;
        __int16 v15 = 2048;
        id v16 = v8;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Couldn't create directory at %@, error: %@ [%ld]",  buf,  0x20u);
      }

      id v6 = (id)objc_claimAutoreleasedReturnValue( -[__CFString URLByAppendingPathComponent:isDirectory:]( v2,  "URLByAppendingPathComponent:isDirectory:",  @"dafsaData.bin",  0LL));

      return v6;
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v12 = @"systemgroup.com.apple.nsurlstoragedresources";
    _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Error getting the system group container for Group ID %@ ",  buf,  0xCu);
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to get the system container for nsurlstoraged",  buf,  2u);
  }

  id v6 = 0LL;
  return v6;
}

void sub_100030CEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100030D24(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 134217984;
      uint64_t v7 = a2;
      id v3 = "Asset download failed. Result  %ld";
LABEL_7:
      _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  v3,  (uint8_t *)&v6,  0xCu);
    }
  }

  else
  {
    [*(id *)(a1 + 32) queryAndFindBestAsset:1];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = *(int *)(a1 + 40);
      int v6 = 134217984;
      uint64_t v7 = v5;
      id v3 = "Asset download completed. Asset Version downloaded is %lu";
      goto LABEL_7;
    }
  }

void sub_100030E1C(uint64_t a1, uint64_t a2)
{
  BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (a2)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v9 = 138412546;
      uint64_t v10 = v5;
      __int16 v11 = 2048;
      uint64_t v12 = a2;
      int v6 = "Failed to purge the asset with version %@. Purge result = %ld";
      uint32_t v7 = 22;
LABEL_7:
      _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  v6,  (uint8_t *)&v9,  v7);
    }
  }

  else if (v4)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138412290;
    uint64_t v10 = v8;
    int v6 = "Asset version %@ purged";
    uint32_t v7 = 12;
    goto LABEL_7;
  }

void sub_100030F14(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      uint64_t v8 = a2;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Catalogue fetch failed with result %ld. Fall back to the currently installed asset",  (uint8_t *)&v7,  0xCu);
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v7) = 0;
      _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Catalogue fetch succeeded",  (uint8_t *)&v7,  2u);
    }

    id v4 = [[MAAssetQuery alloc] initWithType:@"com.apple.MobileAsset.TopLevelDomainDafsa"];
    [v4 returnTypes:2];
    [v4 queryMetaDataSync];
    uint64_t v5 = *(void **)(a1 + 32);
    int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 results]);
    [v5 findBestAssetFrom:v6 skipDownload:*(unsigned __int8 *)(a1 + 40)];
  }

void sub_100031060(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100031084(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___TLDMobileAssetManager);
  uint64_t v2 = (void *)qword_100083940;
  qword_100083940 = (uint64_t)v1;

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(17LL, 0LL);
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async(v4, &stru_1000794A0);
}

void sub_1000310DC(id a1)
{
}

void sub_100031184(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000311EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003132C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10003140C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_100031498( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000316E0(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 16LL);
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0LL; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        int v7 = *(void **)(*((void *)&v8 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v7, *(void *)(a1 + 40)) & 1) != 0) {
          objc_msgSend(v7, *(SEL *)(a1 + 40), *(void *)(a1 + 32), *(unsigned int *)(a1 + 48), (void)v8);
        }
      }

      id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v4);
  }

  objc_sync_exit(v2);
}

void sub_100031810(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100031840(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 16LL);
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0LL; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        int v7 = *(void **)(*((void *)&v8 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v7, *(void *)(a1 + 40)) & 1) != 0) {
          objc_msgSend(v7, *(SEL *)(a1 + 40), *(void *)(a1 + 32), (void)v8);
        }
      }

      id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v4);
  }

  objc_sync_exit(v2);
}

void sub_10003196C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10003199C(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[NDUserEventAgentConnection sharedUserEventAgentConnection]( &OBJC_CLASS___NDUserEventAgentConnection,  "sharedUserEventAgentConnection"));
  [v2 launchProcessWithIdentifier:*(void *)(a1 + 32) sessionIdentifier:*(void *)(a1 + 40)];
}

void sub_1000319E0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_100031AD8(_Unwind_Exception *a1)
{
  id v4 = v3;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_100031BC4(_Unwind_Exception *a1)
{
  id v4 = v3;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_100031C4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100031D48(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_100031DDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100032060(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000320D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100032160(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000321C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100032218(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000323C4(_Unwind_Exception *a1)
{
  id v4 = v3;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_1000324D8(_Unwind_Exception *a1)
{
  id v4 = v3;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_1000328D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100032964(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000329F8(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "_onqueue_resetRequestDelay");
}

id sub_100032A2C(uint64_t a1)
{
  id v2 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8LL);
    *(_DWORD *)buf = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2048;
    uint64_t v9 = 64800LL;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Application %@ has been in background for %lu seconds. Will reevaluate discretionary downloads",  buf,  0x16u);
  }

  [*(id *)(a1 + 32) setIsInTransitionalDiscretionaryPeriod:0];
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_CLASS___NDSpringBoardApplication;
  return objc_msgSendSuper2( &v5,  "invokeSelectorForAllObservers:",  "applicationEndedTransitionalDiscretionaryBackgroundPeriod:");
}

id sub_100032B14(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "_onqueue_resetRequestDelay");
}

void sub_100032B48(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v3 == 0.0)
  {
    double v4 = 60.0;
  }

  else
  {
    [v2 currentRequestDelay];
    double v6 = v5 + v5;
    double v4 = 3600.0;
    if (v6 <= 3600.0)
    {
      [*(id *)(a1 + 32) currentRequestDelay];
      double v4 = v7 + v7;
    }

    id v2 = *(void **)(a1 + 32);
  }

  [v2 setCurrentRequestDelay:v4];
  __int16 v8 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = v9[1];
    [v9 currentRequestDelay];
    int v18 = 138412546;
    uint64_t v19 = v10;
    __int16 v20 = 2048;
    uint64_t v21 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Set request delay for %@ to %f",  (uint8_t *)&v18,  0x16u);
  }

  __int16 v13 = *(void **)(a1 + 32);
  uint64_t v12 = a1 + 32;
  [v13 setupDelayTimer];
  id v14 = *(void **)v12;
  __int16 v15 = *(dispatch_source_s **)(*(void *)v12 + 40LL);
  [v14 currentRequestDelay];
  dispatch_time_t v17 = dispatch_time(0x8000000000000000LL, (uint64_t)((v16 + v16) * 1000000000.0));
  dispatch_source_set_timer(v15, v17, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
}

void sub_100032CA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100032CC0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_resetRequestDelay");
}

void sub_100032D08(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  double v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_attr_t v2 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_UTILITY, 0);
  double v3 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v2);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.nsurlsessiond.NDSpringBoardApplication.request-delay-queue", v3);
  double v5 = (void *)qword_100083960;
  qword_100083960 = (uint64_t)v4;
}

void sub_100032D78(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  dispatch_queue_attr_t v2 = (void *)qword_100083948;
  qword_100083948 = v1;

  uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  dispatch_queue_t v4 = (void *)qword_100083950;
  qword_100083950 = v3;
}

void sub_100032F0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100032FB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100033150(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000332C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000333E0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_1000334F8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_100033698(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000337C0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

id sub_10003390C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeAllObjects];
}

void sub_10003394C(uint64_t a1)
{
  dispatch_queue_attr_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:*(void *)(a1 + 40)]);

  if (!v2)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "setObject:forKeyedSubscript:");
  }

  uint64_t v3 = *(void **)(a1 + 48);
  if (v3 && (uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 user]), v4, v4))
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) user]);
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "setObject:forKeyedSubscript:");

    uint64_t v5 = *(void *)(a1 + 48);
    id v9 = (id)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:*(void *)(a1 + 40)]);
    double v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) user]);
    [v9 setObject:v5 forKeyedSubscript:v6];
  }

  else
  {
    [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:*(void *)(a1 + 40)];
  }

void sub_100033A78( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v11 = v10;

  _Unwind_Resume(a1);
}

void sub_100033AA4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  double v6 = *(dispatch_queue_s **)(v4 + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100033C30;
  block[3] = &unk_100079968;
  id v9 = v3;
  uint64_t v10 = v4;
  id v11 = v5;
  id v7 = v3;
  dispatch_sync(v6, block);
}

uint64_t sub_100033B40(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100033B50(uint64_t a1)
{
}

void sub_100033B58(void *a1)
{
  id v6 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 24) objectForKeyedSubscript:a1[5]]);
  dispatch_queue_attr_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]]);
  if (v2) {
    BOOL v3 = v6 == 0LL;
  }
  else {
    BOOL v3 = 1;
  }
  int v4 = !v3;
  if (v3) {
    uint64_t v5 = 0LL;
  }
  else {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:v6]);
  }
  objc_storeStrong((id *)(*(void *)(a1[6] + 8LL) + 40LL), v5);
  if (v4) {
}
  }

void sub_100033C10( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100033C30(uint64_t a1)
{
  dispatch_queue_attr_t v2 = *(void **)(a1 + 32);
  if (v2 && (BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 user]), v3, v3))
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) user]);
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 24), "setObject:forKeyedSubscript:");

    int v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 40) + 16) objectForKeyedSubscript:*(void *)(a1 + 48)]);
    if (!v4)
    {
      id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      objc_msgSend(*(id *)(*(void *)(a1 + 40) + 16), "setObject:forKeyedSubscript:");
    }

    uint64_t v5 = *(void *)(a1 + 32);
    id v9 = (id)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 40) + 16) objectForKeyedSubscript:*(void *)(a1 + 48)]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) user]);
    [v9 setObject:v5 forKeyedSubscript:v6];
  }

  else
  {
    [*(id *)(*(void *)(a1 + 40) + 24) removeObjectForKey:*(void *)(a1 + 48)];
  }

void sub_100033D5C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_100033D88(id a1, NSError *a2)
{
  dispatch_queue_attr_t v2 = a2;
  BOOL v3 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    uint64_t v5 = v2;
    _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "An XPC error occurred when obtaining the default credential: %@",  (uint8_t *)&v4,  0xCu);
  }
}

void sub_100033E30(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:*(void *)(a1 + 40)]);
  dispatch_queue_attr_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) user]);
  [v3 removeObjectForKey:v2];
}

void sub_100033E94( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100033EB4(void *a1)
{
  dispatch_queue_attr_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]]);

  if (!v2)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    objc_msgSend(*(id *)(a1[4] + 16), "setObject:forKeyedSubscript:");
  }

  uint64_t v3 = a1[6];
  if (v3)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]]);
    int v4 = (void *)objc_claimAutoreleasedReturnValue([(id)a1[6] user]);
    [v6 setObject:v3 forKeyedSubscript:v4];
  }

void sub_100033F88( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_100033FB0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(dispatch_queue_s **)(v4 + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100034084;
  block[3] = &unk_100079C30;
  void block[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_sync(v5, block);
}

void sub_100034038(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  *(void *)(*(void *)(a1 + 32) + 16LL)));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id sub_100034084(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addEntriesFromDictionary:*(void *)(a1 + 40)];
}

void sub_1000340BC(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "An XPC error occurred when obtaining all credentials %@",  (uint8_t *)&v4,  0xCu);
  }
}

void sub_100034164(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v6 = *(dispatch_queue_s **)(v4 + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100034244;
  block[3] = &unk_100079968;
  void block[4] = v4;
  id v9 = v5;
  id v10 = v3;
  id v7 = v3;
  dispatch_sync(v6, block);
}

void sub_100034200(void *a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]]);
  uint64_t v3 = *(void *)(a1[6] + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_100034244(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  *(void *)(a1 + 48)));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "setObject:forKeyedSubscript:");
}

void sub_10003429C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_1000342B0(id a1, NSError *a2)
{
  id v2 = a2;
  uint64_t v3 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "An XPC error occurred when obtaining a credential: %@",  (uint8_t *)&v4,  0xCu);
  }
}

void sub_100034358(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(dispatch_queue_s **)(v7 + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003440C;
  block[3] = &unk_100079968;
  void block[4] = v7;
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, block);
}

id sub_10003440C(void *a1)
{
  return [*(id *)(a1[4] + 24) addEntriesFromDictionary:a1[6]];
}

void sub_1000345C0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1000348A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100034B40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100034CCC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_100035014(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v1 + 98)
    && [*(id *)(v1 + 16) startedUserInitiated]
    && (sub_100003A60(*(void **)(*(void *)(a1 + 32) + 8LL)) & 1) == 0)
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 8) error:@"_nsurlsessiondErrorDomain" code:9]);
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "cancel_with_error:");
  }

void sub_1000350A4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_1000350B8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 98) && *(_BYTE *)(v2 + 100))
  {
    [(id)v2 startThroughputMonitoring];
    uint64_t v2 = *(void *)(a1 + 32);
  }

  sub_100003998(*(void **)(v2 + 8), *(id *)(v2 + 112), *(void **)(v2 + 80));
}

void sub_100035100(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 98))
  {
    [(id)v2 stopThroughputMonitoring];
    uint64_t v2 = *(void *)(a1 + 32);
    if (!*(_BYTE *)(v2 + 98)) {
      goto LABEL_6;
    }
  }

  if (*(_BYTE *)(v2 + 99)) {
    goto LABEL_6;
  }
  if (*(_BYTE *)(v2 + 97))
  {
    *(void *)(v2 + 112) = 300LL;
    *(_BYTE *)(*(void *)(a1 + 32) + 98LL) = 0;
    [*(id *)(a1 + 32) stopThroughputMonitoring];
    uint64_t v2 = *(void *)(a1 + 32);
LABEL_6:
    sub_100003998(*(void **)(v2 + 8), *(id *)(v2 + 112), *(void **)(v2 + 80));
    return;
  }

  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(v2 + 8) error:@"_nsurlsessiondErrorDomain" code:6]);
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "cancel_with_error:");
}

void sub_1000351BC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_1000351D0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v1 + 98))
  {
    id v3 = *(void **)(v1 + 24);
    id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) bundleIdentifier]);
    LODWORD(v3) = objc_msgSend(v3, "isEqualToString:");

    if ((_DWORD)v3)
    {
      id v5 = (id)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(a1 + 32) + 8) error:@"_nsurlsessiondErrorDomain" code:2]);
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "cancel_with_error:");
    }
  }

void sub_100035274( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
}

void sub_10003528C(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24LL);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) bundleIdentifier]);
  LODWORD(v2) = objc_msgSend(v2, "isEqualToString:");

  if ((_DWORD)v2)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 8) error:@"_nsurlsessiondErrorDomain" code:1]);
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "cancel_with_error:");
  }

void sub_100035324( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
}

void sub_10003533C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  unint64_t v3 = *(void *)(v2 + 72);
  if (v3 > 7)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(v2 + 48));
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = 0LL;
  }

  else
  {
    *(void *)(v2 + 72) = v3 + 1;
    [*(id *)(a1 + 32) setThroughputTimerForCurrentInterval];
  }

void sub_100035394( uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8, void *a9, unsigned __int8 a10, unsigned __int8 a11, char a12, char a13, void *a14)
{
  id v21 = a2;
  id v74 = a3;
  id v71 = a4;
  id v72 = a5;
  id v22 = a6;
  id v70 = a9;
  id v73 = a14;
  if (!v21
    || !v74
    || !v22
    || (__int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 uniqueIdentifier]), v23, !v23))
  {
    __int128 v28 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v22 _loggableDescription]);
      id v30 = (void *)objc_claimAutoreleasedReturnValue([v22 uniqueIdentifier]);
      *(_DWORD *)buf = 138544386;
      v76 = v29;
      __int16 v77 = 2112;
      id v78 = v22;
      __int16 v79 = 2112;
      id v80 = v74;
      __int16 v81 = 2112;
      id v82 = v21;
      __int16 v83 = 2112;
      v84 = v30;
      _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "%{public}@ tried to log a bad event to powerlog -- taskInfo %@, sessionID %@, bundleID %@, taskInfo.uniqueIdentifier: %@",  buf,  0x34u);
    }

    goto LABEL_33;
  }

  if (PLShouldLogRegisteredEvent(14LL, @"Background Transfer"))
  {
    v85[0] = @"state";
    v86[0] = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a1));
    v85[1] = @"taskUUID";
    v68 = (void *)v86[0];
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v22 uniqueIdentifier]);
    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 UUIDString]);
    v86[1] = v25;
    v85[2] = @"taskKind";
    unint64_t v26 = (unint64_t)[v22 taskKind];
    if (v26 > 5) {
      uint64_t v27 = 0LL;
    }
    else {
      uint64_t v27 = qword_10005E100[v26];
    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v27));
    v86[2] = v31;
    v85[3] = @"bundleID";
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@:[%@:%@]",  v21,  v71,  v72));
    v86[3] = v32;
    v86[4] = v74;
    v85[4] = @"sessionID";
    v85[5] = @"taskID";
    id v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v22 identifier]));
    v86[5] = v33;
    v69 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v86,  v85,  6LL));

    id v34 = [v69 mutableCopy];
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithObjects:]( &OBJC_CLASS___NSMutableArray,  "arrayWithObjects:",  @"state",  @"taskUUID",  @"taskKind",  @"bundleID",  @"sessionID",  @"taskID",  0LL));
    if (!a12) {
      goto LABEL_32;
    }
    unint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a7));
    [v34 setObject:v36 forKeyedSubscript:@"bytesSent"];

    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a8));
    [v34 setObject:v37 forKeyedSubscript:@"bytesReceived"];

    if (a13)
    {
      [v34 setObject:&__kCFBooleanTrue forKeyedSubscript:@"willRetry"];
      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v22 retryCount]));
      [v34 setObject:v38 forKeyedSubscript:@"previousFailureCount"];
    }

    [v35 addObject:@"bytesSent"];
    [v35 addObject:@"bytesReceived"];
    if (a13)
    {
      [v35 addObject:@"willRetry"];
      [v35 addObject:@"previousFailureCount"];
    }

    if (v70)
    {
      [v34 setObject:v70 forKeyedSubscript:@"interfaceName"];
      [v35 addObject:@"interfaceName"];
    }

    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a10));
    [v34 setObject:v39 forKeyedSubscript:@"isDiscretionary"];

    [v35 addObject:@"isDiscretionary"];
    id v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a11));
    [v34 setObject:v40 forKeyedSubscript:@"isDataBudgetingEnabled"];

    [v35 addObject:@"isDataBudgetingEnabled"];
    if (!v73) {
      goto LABEL_32;
    }
    id v41 = (void *)objc_claimAutoreleasedReturnValue([v73 domain]);
    if ([v41 isEqualToString:NSURLErrorDomain])
    {
      BOOL v42 = [v73 code] == (id)-999;

      if (v42)
      {
        [v34 setObject:&off_10007B508 forKeyedSubscript:@"state"];
LABEL_32:
        PLLogRegisteredEvent(14LL, @"Background Transfer", v34, v35);

        __int128 v28 = (os_log_s *)v69;
LABEL_33:

        goto LABEL_34;
      }
    }

    else
    {
    }

    [v34 setObject:&off_10007B520 forKeyedSubscript:@"state"];
    __int128 v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    __int128 v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v73 code]));
    [v43 setObject:v44 forKeyedSubscript:@"errorCode"];

    uint64_t v45 = objc_claimAutoreleasedReturnValue([v73 domain]);
    [v43 setObject:v45 forKeyedSubscript:@"errorDomain"];

    id v46 = (void *)objc_claimAutoreleasedReturnValue([v73 userInfo]);
    uint64_t v47 = _kCFStreamErrorCodeKey;
    v48 = (void *)objc_claimAutoreleasedReturnValue([v46 objectForKeyedSubscript:_kCFStreamErrorCodeKey]);
    LOBYTE(v45) = v48 == 0LL;

    if ((v45 & 1) == 0)
    {
      id v49 = (void *)objc_claimAutoreleasedReturnValue([v73 userInfo]);
      char v50 = (void *)objc_claimAutoreleasedReturnValue([v49 objectForKeyedSubscript:v47]);
      [v43 setObject:v50 forKeyedSubscript:@"errorCFStreamErrorCode"];
    }

    id v51 = (void *)objc_claimAutoreleasedReturnValue([v73 userInfo]);
    uint64_t v52 = _kCFStreamErrorDomainKey;
    __int16 v53 = (void *)objc_claimAutoreleasedReturnValue([v51 objectForKeyedSubscript:_kCFStreamErrorDomainKey]);
    BOOL v54 = v53 == 0LL;

    if (!v54)
    {
      __int16 v55 = (void *)objc_claimAutoreleasedReturnValue([v73 userInfo]);
      id v56 = (void *)objc_claimAutoreleasedReturnValue([v55 objectForKeyedSubscript:v52]);
      [v43 setObject:v56 forKeyedSubscript:@"errorCFStreamErrorDomain"];
    }

    __int16 v57 = (void *)objc_claimAutoreleasedReturnValue([v73 userInfo]);
    id v58 = (void *)objc_claimAutoreleasedReturnValue([v57 objectForKeyedSubscript:@"_NSURLErrorFailingURLSessionTaskErrorKey"]);
    BOOL v59 = v58 == 0LL;

    if (!v59)
    {
      v60 = (void *)objc_claimAutoreleasedReturnValue([v73 userInfo]);
      v61 = (void *)objc_claimAutoreleasedReturnValue([v60 objectForKeyedSubscript:@"_NSURLErrorFailingURLSessionTaskErrorKey"]);
      [v43 setObject:v61 forKeyedSubscript:@"errorFailingURLSessionTask"];
    }

    v62 = (void *)objc_claimAutoreleasedReturnValue([v73 userInfo]);
    v63 = (void *)objc_claimAutoreleasedReturnValue([v62 objectForKeyedSubscript:NSURLErrorFailingURLErrorKey]);
    BOOL v64 = v63 == 0LL;

    if (!v64)
    {
      v65 = (void *)objc_claimAutoreleasedReturnValue([v73 userInfo]);
      v66 = (void *)objc_claimAutoreleasedReturnValue([v65 objectForKeyedSubscript:NSURLErrorFailingURLErrorKey]);
      [v43 setObject:v66 forKeyedSubscript:@"errorFailingURL"];
    }

    [v34 addEntriesFromDictionary:v43];
    v67 = (void *)objc_claimAutoreleasedReturnValue([v43 allKeys]);
    [v35 addObjectsFromArray:v67];

    goto LABEL_32;
  }

LABEL_34:
}

void sub_100035C04( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, void *a18, void *a19, void *a20, void *a21, void *a22)
{
  _Unwind_Resume(a1);
}

void sub_100035DF4(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, char a8)
{
  id v39 = a2;
  id v38 = a3;
  id v15 = a4;
  id v37 = a5;
  id v16 = a6;
  id v36 = a7;
  id v40 = v16;
  uint64_t v35 = v15;
  dispatch_time_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 _metrics]);
  uint64_t v34 = a1;
  int v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "_daemon_currentTransactionMetrics"));

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "_daemon_connectionMetrics"));
  uint64_t v20 = objc_claimAutoreleasedReturnValue([v40 _sourceApplicationBundleIdentifierForMobileAsset]);
  id v21 = (void *)v20;
  char v33 = a8;
  if (v20) {
    id v22 = (id)v20;
  }
  else {
    id v22 = v15;
  }
  uint64_t v32 = v22;
  id v31 = objc_msgSend(v18, "_daemon_requestHeaderSize");
  id v30 = objc_msgSend(v18, "_daemon_requestBodyTransferSize");
  id v23 = objc_msgSend(v18, "_daemon_responseHeaderSize");
  id v24 = objc_msgSend(v18, "_daemon_responseBodyTransferSize");
  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "_daemon_interfaceName"));
  unsigned __int8 v26 = objc_msgSend(v19, "_daemon_isDiscretionary");
  unsigned __int8 v27 = objc_msgSend(v19, "_daemon_isDataBudgetingEnabled");
  id v28 = [v40 state];
  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v40 error]);
  sub_100035394( v34,  v39,  v38,  v32,  v37,  v36,  (uint64_t)v31 + (void)v30,  (uint64_t)v23 + (void)v24,  v25,  v26,  v27,  v28 == (id)3,  v33,  v29);
}

void sub_100035FD4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18, void *a19, void *a20, id a21)
{
  _Unwind_Resume(a1);
}

void sub_100036358(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003653C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000365A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100036BC8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_100036E18( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  dispatch_time_t v17 = v16;

  _Unwind_Resume(a1);
}

void sub_100037534( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, void *a25, void *a26)
{
  _Unwind_Resume(a1);
}

void sub_1000379CC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_100037D50( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, void *a26)
{
  _Block_object_dispose((const void *)(v29 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_100037F40(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_100038010(uint64_t a1)
{
  if (MKBDeviceUnlockedSinceBoot() == 1)
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }

  else
  {
    uint64_t v2 = (os_log_s *)qword_100083990;
    if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Device is locked - waiting", v3, 2u);
    }
  }

uint64_t sub_100038094(uint64_t result, int a2)
{
  if (*(_DWORD *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL) == a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16LL))();
  }
  return result;
}

uint64_t sub_1000380B8(uint64_t a1)
{
  uint64_t result = notify_cancel(*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
  return result;
}

void sub_1000380F0(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIDsForAppProxies:*(void *)(a1 + 40)]);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v3 = v2;
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v4)
  {
    uint64_t v6 = *(void *)v15;
    *(void *)&__int128 v5 = 138412290LL;
    __int128 v13 = v5;
    do
    {
      for (uint64_t i = 0LL; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)i);
        id v9 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*(void *)(a1 + 32) + 8),  "objectForKeyedSubscript:",  v8,  v13,  (void)v14));
        BOOL v10 = v9 == 0LL;

        if (!v10)
        {
          id v11 = (os_log_s *)qword_100083990;
          if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v13;
            uint64_t v19 = v8;
            _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Bundle %@ uninstalled. Need to obliterate",  buf,  0xCu);
          }

          id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v8]);
          [v12 obliterate];
        }
      }

      id v4 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }

    while (v4);
  }
}

void sub_100038298(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000382C8(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIDsForAppProxies:*(void *)(a1 + 40)]);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v3 = v2;
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v4)
  {
    uint64_t v6 = *(void *)v15;
    *(void *)&__int128 v5 = 138412290LL;
    __int128 v13 = v5;
    do
    {
      for (uint64_t i = 0LL; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)i);
        id v9 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*(void *)(a1 + 32) + 8),  "objectForKeyedSubscript:",  v8,  v13,  (void)v14));
        BOOL v10 = v9 == 0LL;

        if (!v10)
        {
          id v11 = (os_log_s *)qword_100083990;
          if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v13;
            uint64_t v19 = v8;
            _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Bundle %@ re-installed. Need to adjust download paths",  buf,  0xCu);
          }

          id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v8]);
          [v12 clientApplicationWasReinstalled];
        }
      }

      id v4 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }

    while (v4);
  }
}

void sub_100038470(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000384A0(id a1)
{
}

void sub_1000384AC(id a1)
{
}

uint64_t sub_1000384B8(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 8) count])
  {
    [*(id *)(a1 + 32) archiveState];
  }

  else
  {
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) archivePath]);
    +[NDFileUtilities removeItemAtPath:](&OBJC_CLASS___NDFileUtilities, "removeItemAtPath:", v2);
  }

  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100038548(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100038558(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100038568(uint64_t a1)
{
}

void sub_100038570(void *a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 8) objectForKeyedSubscript:a1[5]]);
  uint64_t v2 = objc_claimAutoreleasedReturnValue([v5 getSessionWithIdentifier:a1[6]]);
  uint64_t v3 = *(void *)(a1[7] + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_1000385CC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_1000385E0(uint64_t a1, int a2)
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) userInfo]);
  id v5 = (os_log_s *)(id)qword_100083990;
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v6)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
      uint64_t v8 = *(void *)(a1 + 40);
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
      int v13 = 138543874;
      __int128 v14 = v7;
      __int16 v15 = 2112;
      uint64_t v16 = v8;
      __int16 v17 = 2112;
      int v18 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@>.<%@>.<%@> Lost connection to app -- connection interrupted",  (uint8_t *)&v13,  0x20u);
    }
  }

  else if (v6)
  {
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
    uint64_t v11 = *(void *)(a1 + 40);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    int v13 = 138543874;
    __int128 v14 = v10;
    __int16 v15 = 2112;
    uint64_t v16 = v11;
    __int16 v17 = 2112;
    int v18 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@>.<%@>.<%@> Lost connection to app -- connection invalidated",  (uint8_t *)&v13,  0x20u);
  }

  [v4 clientDidDisconnect];
  [*(id *)(a1 + 32) setUserInfo:0];
}

void sub_100038780(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000387B8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_1000387C8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_1000387D8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) enumerateKeysAndObjectsUsingBlock:&stru_100079718];
}

void sub_1000387EC(id a1, NSString *a2, NDSessionManager *a3, BOOL *a4)
{
}

void sub_1000387F4(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v5 isSpringBoardApp]));
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
}

void sub_100038870( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

int64_t sub_100038894(id a1, id a2, id a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 creationTime];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  [v5 creationTime];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  id v8 = [v6 compare:v7];

  return (int64_t)v8;
}

void sub_100038930(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003899C(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___Daemon);
  uint64_t v2 = (void *)qword_100083978;
  qword_100083978 = (uint64_t)v1;
}

void sub_100038B8C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100038C00( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)&OBJC_CLASS___NDSpringBoard;
  -[_Unwind_Exception dealloc](&a9, "dealloc");
  _Unwind_Resume(a1);
}

void sub_100038CA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100039144( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, id a22)
{
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_100039270(_Unwind_Exception *a1)
{
  if (v2) {

  }
  _Unwind_Resume(a1);
}

void sub_100039454( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, ...)
{
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100039644(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003981C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000398C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100039A30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100039ED4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

LABEL_5:
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(buf, 8);

  return 1;
}

        v7[2](v7, 2LL, 0LL);
        goto LABEL_18;
      case 0xAu:
        int v18 = (void *)objc_claimAutoreleasedReturnValue([v4 args]);
        id v7 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v18 objectAtIndexedSubscript:0]);

        uint64_t v19 = (os_log_s *)(id)qword_100083990;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( WeakRetained,  "descriptionForTaskWithIdentifier:",  objc_msgSend(v4, "taskIdentifier")));
          id v21 = 138543362;
          id v22 = v20;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%{public}@ draining getAuthHeadersForResponse callback",  (uint8_t *)&v21,  0xCu);
        }

        ((void (*)(void (**)(void, void, void), void, void, void))v7[2])( v7,  0LL,  0LL,  0LL);
LABEL_18:

        break;
      default:
        break;
    }

    [v4 setHasBeenCalled:1];
  }
}

void sub_10003A35C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, id a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, id a32)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a27, 8);

  _Unwind_Resume(a1);
}

void sub_10003A448(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10003A4D0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10003A4E0(uint64_t a1)
{
}

void sub_10003A4E8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8LL);
  BOOL v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_10003A570(uint64_t a1)
{
  return _objc_msgSend( *(id *)(a1 + 32),  "_onqueue_releaseAssertionForBundleID:sessionID:",  *(void *)(a1 + 40),  *(void *)(a1 + 48));
}

id sub_10003A580(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  id result = [*(id *)(a1 + 32) isValidAssertion:a3 withName:*(void *)(a1 + 40)];
  if ((_DWORD)result)
  {
    *a4 = 1;
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
  }

  return result;
}

void sub_10003A5C4(void *a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 32) objectForKeyedSubscript:a1[5]]);
  uint64_t v3 = *(void *)(a1[6] + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(a1[6] + 8LL) + 40LL))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessPredicate predicateMatchingBundleIdentifier:]( &OBJC_CLASS___RBSProcessPredicate,  "predicateMatchingBundleIdentifier:",  a1[5]));
    id v11 = (id)objc_claimAutoreleasedReturnValue( +[RBSProcessHandle handleForPredicate:error:]( &OBJC_CLASS___RBSProcessHandle,  "handleForPredicate:error:",  v5,  0LL));

    id v6 = (void *)objc_claimAutoreleasedReturnValue([v11 currentState]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 endowmentNamespaces]);
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v7 containsObject:@"com.apple.frontboard.visibility"]));
    uint64_t v9 = *(void *)(a1[6] + 8LL);
    BOOL v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    [*(id *)(a1[4] + 32) setObject:*(void *)(*(void *)(a1[6] + 8) + 40) forKeyedSubscript:a1[5]];
  }

void sub_10003A6EC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10003A724(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = [*(id *)(*(void *)(a1 + 32) + 48) count];
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 48LL);
    int v6 = 138412802;
    uint64_t v7 = v3;
    __int16 v8 = 2048;
    id v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Stopped monitoring app %@, now %lu total %@",  (uint8_t *)&v6,  0x20u);
  }
}

void sub_10003A828(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003A840(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 48) containsObject:*(void *)(a1 + 40)] & 1) == 0)
  {
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) getBackgroundSettingsAppList]);
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:*(void *)(a1 + 40)]);
    if (v3) {
      id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:*(void *)(a1 + 40)]);
    }
    else {
      id v4 = &__kCFBooleanTrue;
    }
    [*(id *)(*(void *)(a1 + 32) + 40) setObject:v4 forKeyedSubscript:*(void *)(a1 + 40)];
    if (v3) {

    }
    [*(id *)(*(void *)(a1 + 32) + 48) addObject:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) monitoredBundleIDsUpdated];
    uint64_t v5 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      id v7 = [*(id *)(*(void *)(a1 + 32) + 48) count];
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 48LL);
      int v9 = 138412802;
      uint64_t v10 = v6;
      __int16 v11 = 2048;
      id v12 = v7;
      __int16 v13 = 2112;
      uint64_t v14 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Started monitoring app %@, now %lu total %@",  (uint8_t *)&v9,  0x20u);
    }
  }

void sub_10003A9A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003A9D8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessPredicate predicateMatchingBundleIdentifiers:]( &OBJC_CLASS___RBSProcessPredicate,  "predicateMatchingBundleIdentifiers:",  *(void *)(*(void *)(a1 + 32) + 48LL)));
  uint64_t v6 = v4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  [v3 setPredicates:v5];
}

void sub_10003AA8C(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_10003AAC0(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 24) objectForKeyedSubscript:a1[5]]);
  [v2 removeObject:a1[6]];

  id v3 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = a1[5];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 24) objectForKeyedSubscript:v4]);
    int v6 = 138412546;
    uint64_t v7 = v4;
    __int16 v8 = 2048;
    id v9 = [v5 count];
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Removed observer for app %@, now %lu observers",  (uint8_t *)&v6,  0x16u);
  }
}

void sub_10003ABB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003ABE0(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 24) objectForKeyedSubscript:a1[5]]);

  if (!v2)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    [*(id *)(a1[4] + 24) setObject:v3 forKeyedSubscript:a1[5]];
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 24) objectForKeyedSubscript:a1[5]]);
  [v4 addObject:a1[6]];

  uint64_t v5 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = a1[5];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 24) objectForKeyedSubscript:v6]);
    int v8 = 138412546;
    uint64_t v9 = v6;
    __int16 v10 = 2048;
    id v11 = [v7 count];
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Added observer for app %@, now %lu observers",  (uint8_t *)&v8,  0x16u);
  }
}

void sub_10003AD1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003AD48(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identity]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 embeddedApplicationIdentifier]);

  if (v3
    || (uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundle]),
        id v3 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]),
        v4,
        v3))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) previousState]);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 endowmentNamespaces]);
    unsigned int v7 = [v6 containsObject:@"com.apple.frontboard.visibility"];

    int v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) state]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 endowmentNamespaces]);
    id v10 = [v9 containsObject:@"com.apple.frontboard.visibility"];

    if (((v7 ^ 1 | v10) & 1) == 0)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 48) + 24) objectForKeyedSubscript:v3]);

      id v12 = (os_log_s *)qword_100083990;
      BOOL v13 = os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT);
      if (v11)
      {
        if (v13)
        {
          *(_DWORD *)buf = 138412290;
          v76 = v3;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Application %@ no longer foreground",  buf,  0xCu);
        }

        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 48) + 24) objectForKeyedSubscript:v3]);
        __int128 v69 = 0u;
        __int128 v70 = 0u;
        __int128 v67 = 0u;
        __int128 v68 = 0u;
        id v15 = v14;
        id v16 = [v15 countByEnumeratingWithState:&v67 objects:v74 count:16];
        if (v16)
        {
          uint64_t v17 = *(void *)v68;
          do
          {
            for (uint64_t i = 0LL; i != v16; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v68 != v17) {
                objc_enumerationMutation(v15);
              }
              [*(id *)(*((void *)&v67 + 1) + 8 * (void)i) applicationNoLongerInForeground:v3];
            }

            id v16 = [v15 countByEnumeratingWithState:&v67 objects:v74 count:16];
          }

          while (v16);
        }
      }

      else if (v13)
      {
        *(_DWORD *)buf = 138412290;
        v76 = v3;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Application %@ no longer foreground, and no observers",  buf,  0xCu);
      }
    }

    if ((_DWORD)v10)
    {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 48) + 24) objectForKeyedSubscript:v3]);
      BOOL v20 = v19 == 0LL;

      id v21 = (os_log_s *)qword_100083990;
      BOOL v22 = os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT);
      if (!v20)
      {
        if (v22)
        {
          *(_DWORD *)buf = 138412290;
          v76 = v3;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Application %@ entered foreground",  buf,  0xCu);
        }

        id v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 48) + 24) objectForKeyedSubscript:v3]);
        __int128 v65 = 0u;
        __int128 v66 = 0u;
        __int128 v63 = 0u;
        __int128 v64 = 0u;
        id v24 = v23;
        id v25 = [v24 countByEnumeratingWithState:&v63 objects:v73 count:16];
        if (v25)
        {
          uint64_t v26 = *(void *)v64;
          do
          {
            for (j = 0LL; j != v25; j = (char *)j + 1)
            {
              if (*(void *)v64 != v26) {
                objc_enumerationMutation(v24);
              }
              [*(id *)(*((void *)&v63 + 1) + 8 * (void)j) applicationEnteredForeground:v3];
            }

            id v25 = [v24 countByEnumeratingWithState:&v63 objects:v73 count:16];
          }

          while (v25);
        }

        goto LABEL_62;
      }

      if (v22)
      {
        *(_DWORD *)buf = 138412290;
        v76 = v3;
        char v50 = "Application %@ entered foreground, and no observers";
LABEL_61:
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v50, buf, 0xCu);
      }
    }

    else
    {
      id v28 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) state]);
      BOOL v29 = [v28 taskState] == 3;

      if (v29)
      {
        id v30 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 48) + 24) objectForKeyedSubscript:v3]);
        BOOL v31 = v30 == 0LL;

        id v21 = (os_log_s *)qword_100083990;
        BOOL v32 = os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT);
        if (!v31)
        {
          if (v32)
          {
            *(_DWORD *)buf = 138412290;
            v76 = v3;
            _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Application %@ was suspended",  buf,  0xCu);
          }

          char v33 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 48) + 24) objectForKeyedSubscript:v3]);
          __int128 v61 = 0u;
          __int128 v62 = 0u;
          __int128 v59 = 0u;
          __int128 v60 = 0u;
          id v34 = v33;
          id v35 = [v34 countByEnumeratingWithState:&v59 objects:v72 count:16];
          if (v35)
          {
            uint64_t v36 = *(void *)v60;
            do
            {
              for (k = 0LL; k != v35; k = (char *)k + 1)
              {
                if (*(void *)v60 != v36) {
                  objc_enumerationMutation(v34);
                }
                objc_msgSend( *(id *)(*((void *)&v59 + 1) + 8 * (void)k),  "applicationWasSuspended:pid:",  v3,  objc_msgSend(*(id *)(a1 + 32), "pid"));
              }

              id v35 = [v34 countByEnumeratingWithState:&v59 objects:v72 count:16];
            }

            while (v35);
          }

          goto LABEL_62;
        }

        if (v32)
        {
          *(_DWORD *)buf = 138412290;
          v76 = v3;
          char v50 = "Application %@ was suspended, and no observers";
          goto LABEL_61;
        }
      }

      else
      {
        id v38 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) exitEvent]);
        id v39 = (void *)objc_claimAutoreleasedReturnValue([v38 context]);
        id v40 = (void *)objc_claimAutoreleasedReturnValue([v39 status]);
        BOOL v41 = [v40 code] == (id)3735943697;

        if (v41)
        {
          BOOL v42 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 48) + 24) objectForKeyedSubscript:v3]);
          BOOL v43 = v42 == 0LL;

          id v21 = (os_log_s *)qword_100083990;
          BOOL v44 = os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT);
          if (!v43)
          {
            if (v44)
            {
              *(_DWORD *)buf = 138412290;
              v76 = v3;
              _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Application %@ was quit in the app switcher",  buf,  0xCu);
            }

            uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 48) + 24) objectForKeyedSubscript:v3]);
            __int128 v57 = 0u;
            __int128 v58 = 0u;
            __int128 v55 = 0u;
            __int128 v56 = 0u;
            id v46 = v45;
            id v47 = [v46 countByEnumeratingWithState:&v55 objects:v71 count:16];
            if (v47)
            {
              uint64_t v48 = *(void *)v56;
              do
              {
                for (m = 0LL; m != v47; m = (char *)m + 1)
                {
                  if (*(void *)v56 != v48) {
                    objc_enumerationMutation(v46);
                  }
                  objc_msgSend( *(id *)(*((void *)&v55 + 1) + 8 * (void)m),  "applicationWasQuitFromAppSwitcher:",  v3,  (void)v55);
                }

                id v47 = [v46 countByEnumeratingWithState:&v55 objects:v71 count:16];
              }

              while (v47);
            }

            goto LABEL_62;
          }

          if (v44)
          {
            *(_DWORD *)buf = 138412290;
            v76 = v3;
            char v50 = "Application %@ was quit in the app switcher, and no observers";
            goto LABEL_61;
          }
        }
      }
    }

LABEL_62:
    BOOL v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v10, (void)v55));
    [*(id *)(*(void *)(a1 + 48) + 32) setObject:v54 forKeyedSubscript:v3];

    return;
  }

  id v51 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
  {
    uint64_t v52 = *(void **)(a1 + 32);
    uint64_t v53 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v76 = v52;
    __int16 v77 = 2112;
    uint64_t v78 = v53;
    _os_log_error_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_ERROR,  "Cannot find bundle ID for process %@ state update %@",  buf,  0x16u);
  }

void sub_10003B4AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003B5F8(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  unsigned int v3 = [v2 isAutomaticAppUpdatesAllowed];
  *(_BYTE *)(*(void *)(a1 + 32) + 68LL) = v3;

  uint64_t v4 = (os_log_s *)qword_100083990;
  BOOL v5 = os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Background updates are on", buf, 2u);
    }

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) getBackgroundSettingsAppList]);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10003B738;
    v7[3] = &unk_100079900;
    v7[4] = *(void *)(a1 + 32);
    [v6 enumerateKeysAndObjectsUsingBlock:v7];
  }

  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Background updates were turned off", buf, 2u);
    }

    [*(id *)(*(void *)(a1 + 32) + 24) enumerateKeysAndObjectsUsingBlock:&stru_100079940];
  }

void sub_10003B724(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003B738(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:v5]);
  if (v7)
  {
    int v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:v5]);
    unsigned __int8 v9 = [v8 isEqualToNumber:v6];

    if ((v9 & 1) == 0)
    {
      id v10 = (os_log_s *)qword_100083990;
      if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v35 = v5;
        __int16 v36 = 2112;
        id v37 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Background update setting for %@ was changed to %@",  buf,  0x16u);
      }

      id v11 = [v6 BOOLValue];
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v11));
      [*(id *)(*(void *)(a1 + 32) + 40) setObject:v12 forKeyedSubscript:v5];

      BOOL v13 = (os_log_s *)qword_100083990;
      BOOL v14 = os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT);
      if ((v11 & 1) != 0)
      {
        if (v14)
        {
          *(_DWORD *)buf = 138412290;
          id v35 = v5;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Notifying observers for %@ that background update setting was turned on",  buf,  0xCu);
        }

        id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:v5]);
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        __int128 v24 = 0u;
        __int128 v25 = 0u;
        id v16 = v15;
        id v17 = [v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v17)
        {
          uint64_t v18 = *(void *)v25;
          do
          {
            for (uint64_t i = 0LL; i != v17; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v25 != v18) {
                objc_enumerationMutation(v16);
              }
              objc_msgSend( *(id *)(*((void *)&v24 + 1) + 8 * (void)i),  "applicationBackgroundUpdatesTurnedOn:",  v5,  (void)v24);
            }

            id v17 = [v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }

          while (v17);
        }
      }

      else
      {
        if (v14)
        {
          *(_DWORD *)buf = 138412290;
          id v35 = v5;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Notifying observers for %@ that background update setting was turned off",  buf,  0xCu);
        }

        BOOL v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:v5]);
        __int128 v30 = 0u;
        __int128 v31 = 0u;
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        id v16 = v20;
        id v21 = [v16 countByEnumeratingWithState:&v28 objects:v33 count:16];
        if (v21)
        {
          uint64_t v22 = *(void *)v29;
          do
          {
            for (j = 0LL; j != v21; j = (char *)j + 1)
            {
              if (*(void *)v29 != v22) {
                objc_enumerationMutation(v16);
              }
              [*(id *)(*((void *)&v28 + 1) + 8 * (void)j) applicationBackgroundUpdatesTurnedOff:v5];
            }

            id v21 = [v16 countByEnumeratingWithState:&v28 objects:v33 count:16];
          }

          while (v21);
        }
      }
    }
  }
}

void sub_10003BA68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003BAEC(id a1, NSString *a2, NSArray *a3, BOOL *a4)
{
  id v5 = a2;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v6 = a3;
  id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      unsigned __int8 v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend( *(id *)(*((void *)&v10 + 1) + 8 * (void)v9),  "applicationBackgroundUpdatesTurnedOff:",  v5,  (void)v10);
        unsigned __int8 v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }
}

void sub_10003BBF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003BC18(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessStateDescriptor descriptor](&OBJC_CLASS___RBSProcessStateDescriptor, "descriptor"));
  [v4 setValues:1];
  [v4 setEndowmentNamespaces:&off_10007B578];
  [v3 setStateDescriptor:v4];
  [v3 setEvents:1];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10003BD18;
  v5[3] = &unk_1000798B0;
  id v6 = *(id *)(a1 + 32);
  [v3 setUpdateHandler:v5];
}

void sub_10003BCE4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_10003BD10(uint64_t a1, void *a2)
{
  return _[a2 handleBackgroundSettingsChange];
}

id sub_10003BD18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _[*(id *)(a1 + 32) handleStateUpdate:a4 forProcess:a3];
}

void sub_10003BD6C(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___NDSpringBoard);
  uint64_t v2 = (void *)qword_100083988;
  qword_100083988 = (uint64_t)v1;
}

void sub_10003BE8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003C07C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003C424(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

_BYTE *sub_10003C6A0(uint64_t a1)
{
  id result = *(_BYTE **)(a1 + 32);
  if (!result[65])
  {
    if (result[67]) {
      return [result startThroughputMonitoring];
    }
  }

  return result;
}

void *sub_10003C6BC(uint64_t a1)
{
  id result = *(void **)(a1 + 32);
  if (*((_BYTE *)result + 65)
    || ([result stopThroughputMonitoring], id result = *(void **)(a1 + 32), *((_BYTE *)result + 65)))
  {
    if (!*((_BYTE *)result + 66))
    {
      if (*((_BYTE *)result + 64))
      {
        result[10] = 300LL;
        *(_BYTE *)(*(void *)(a1 + 32) + 65LL) = 0;
        return [*(id *)(a1 + 32) stopThroughputMonitoring];
      }
    }
  }

  return result;
}

void sub_10003C724(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  unint64_t v3 = *(void *)(v2 + 48);
  if (v3 > 7)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(v2 + 24));
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = 0LL;
  }

  else
  {
    *(void *)(v2 + 48) = v3 + 1;
    [*(id *)(a1 + 32) setThroughputTimerForCurrentInterval];
  }

id sub_10003C77C()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue( +[SZExtractor knownSZExtractorImplementations]( &OBJC_CLASS___SZExtractor,  "knownSZExtractorImplementations"));
  id v1 = [v0 setByAddingObject:objc_opt_class(STRemoteExtractor)];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);

  return v2;
}

void sub_10003C7D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

char *sub_10003C7E0(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  if (v3)
  {
    id v6 = objc_claimAutoreleasedReturnValue([v4 stringByDeletingLastPathComponent]);
    id v7 = realpath_DARWIN_EXTSN((const char *)[v6 fileSystemRepresentation], 0);

    if (v7)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      __int128 v11 = sub_10003C908;
      __int128 v12 = &unk_100079A00;
      __int128 v13 = v7;
      [v3 auditToken];
      id v7 = (char *)(sandbox_check_by_audit_token( v9,  "file-write-create",  SANDBOX_CHECK_POSIX_WRITEABLE | 1u) == 0);
      v11((uint64_t)v10);
    }
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

void sub_10003C8D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003C908(uint64_t a1)
{
}

void sub_10003C910(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  __int128 v60 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"effectiveConfig"]);
  if (v60)
  {
    id v5 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      BOOL v54 = (void *)objc_claimAutoreleasedReturnValue([v3 _loggableDescription]);
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v54;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "%{public}@ Updating configuration on daemon",  buf,  0xCu);
    }

    objc_msgSend(v3, "_onqueue_adoptEffectiveConfiguration:", v60);
  }

  __int128 v61 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"StatusCodes"]);
  if (v61)
  {
    [v3 initializeHTTPAuthenticatorWithAppleIDContext:0 statusCodes:v61];
    objc_msgSend(v3, "set_authenticatorConfiguredViaTaskProperty:", 1);
    id v6 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 _loggableDescription]);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v61;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@ initialized appleIDAuthenticator, status codes = %@",  buf,  0x16u);
    }
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"PublishingURL"]);
  objc_msgSend(v3, "set_backgroundPublishingURL:", v8);

  uint64_t v9 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"EarliestBeginDate"]);
  __int128 v58 = (void *)v9;
  if (v9) {
    [v3 setEarliestBeginDate:v9];
  }
  __int128 v59 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"CountOfBytesClientExpectsToSend"]);
  if (v59) {
    objc_msgSend(v3, "setCountOfBytesClientExpectsToSend:", objc_msgSend(v59, "longLongValue"));
  }
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"CountOfBytesClientExpectsToReceive"]);
  __int128 v11 = v10;
  if (v10) {
    objc_msgSend(v3, "setCountOfBytesClientExpectsToReceive:", objc_msgSend(v10, "longLongValue"));
  }
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"pathToDownloadTaskFile"]);
  if (v12) {
    objc_msgSend(v3, "set_pathToDownloadTaskFile:", v12);
  }
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v3 _DuetActivityProperties]);
  BOOL v14 = v13 == 0LL;

  if (!v14)
  {
    id v15 = [v3 countOfBytesClientExpectsToSend];
    id v16 = [v3 countOfBytesClientExpectsToReceive];
    int64_t v17 = (int64_t)v16;
    if ((uint64_t)v15 > NSURLSessionTransferSizeUnknown || (uint64_t)v16 > NSURLSessionTransferSizeUnknown)
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v3 _DuetActivityProperties]);
      id v19 = [v18 mutableCopy];

      if ((uint64_t)v15 > NSURLSessionTransferSizeUnknown)
      {
        BOOL v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v15));
        [v19 setObject:v20 forKeyedSubscript:kConditionalConnectionRequirementUploadBytes];
      }

      if (v17 > NSURLSessionTransferSizeUnknown)
      {
        id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v17));
        [v19 setObject:v21 forKeyedSubscript:kConditionalConnectionRequirementDownloadBytes];
      }

      objc_msgSend(v3, "set_DuetActivityProperties:", v19);
    }
  }

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"SZExtractor"]);
  if (v22)
  {
    id v23 = sub_10003C77C();
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v24,  v22,  0LL));

    if (v25)
    {
      unsigned __int8 v26 = [v3 _extractorPreparedForExtraction];
      __int128 v27 = (os_log_s *)(id)qword_100083990;
      BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
      if ((v26 & 1) != 0)
      {
        if (v28)
        {
          __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v3 _loggableDescription]);
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v29;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "%{public}@ StreamingZip - already prepared for extraction while setting additional properties",  buf,  0xCu);
        }
      }

      else
      {
        if (v28)
        {
          __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v3 _loggableDescription]);
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v30;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "%{public}@ StreamingZip - not yet prepared for extraction while setting additional properties",  buf,  0xCu);
        }

        __int128 v27 = (os_log_s *)dispatch_semaphore_create(0LL);
        __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v3 _extractor]);
        BOOL v32 = v31 == 0LL;

        if (!v32)
        {
          char v33 = (os_log_s *)(id)qword_100083990;
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            id v34 = (void *)objc_claimAutoreleasedReturnValue([v3 _loggableDescription]);
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v34;
            _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "%{public}@ StreamingZip - terminating lingering extractor from previous download attempt",  buf,  0xCu);
          }

          id v35 = (void *)objc_claimAutoreleasedReturnValue([v3 _extractor]);
          __int16 v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSURLErrorDomain,  -999LL,  0LL));
          v63[0] = _NSConcreteStackBlock;
          v63[1] = 3221225472LL;
          v63[2] = sub_10003D3BC;
          v63[3] = &unk_100079A28;
          id v37 = v27;
          __int128 v64 = v37;
          [v35 terminateStreamWithError:v36 completionBlock:v63];

          dispatch_semaphore_wait(v37, 0xFFFFFFFFFFFFFFFFLL);
          objc_msgSend(v3, "set_extractor:", 0);
        }

        if ([v25 conformsToProtocol:&OBJC_PROTOCOL___STExtractor])
        {
          uint64_t v38 = objc_opt_class(&OBJC_CLASS___NSURLSessionDownloadTask);
          if ((objc_opt_isKindOfClass(v3, v38) & 1) != 0) {
            objc_msgSend(v3, "set_extractor:", v25);
          }
        }

        else
        {
          id v39 = (os_log_s *)(id)qword_100083990;
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            __int128 v55 = (void *)objc_claimAutoreleasedReturnValue([v3 _loggableDescription]);
            __int128 v56 = (void *)objc_opt_class(v25);
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v55;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v56;
            id v57 = v56;
            _os_log_error_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_ERROR,  "%{public}@ Object does not support STExtractor protocol.  Dropping this object. Class=%@",  buf,  0x16u);
          }
        }
      }
    }
  }

  id v40 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"TimeoutIntervalForResource"]);
  BOOL v41 = v40;
  if (v40)
  {
    [v40 doubleValue];
    objc_msgSend(v3, "set_timeoutIntervalForResource:");
  }

  BOOL v42 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"DisallowCellularDueToSystemPolicy"]);
  unsigned int v43 = [v42 BOOLValue];

  if (v43) {
    objc_msgSend(v3, "set_disallowCellular:", 1);
  }
  BOOL v44 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"nw_activityUUID"]);
  uint64_t v45 = v44;
  if (v44)
  {
    *(void *)buf = 0LL;
    *(void *)&buf[8] = 0LL;
    [v44 getUUIDBytes:buf];
    id v46 = (void *)nw_activity_create_from_token(buf);
    objc_msgSend(v3, "set_nw_activity:", v46);

    id v47 = (os_log_s *)qword_100083990;
    if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)__int128 v62 = 0;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEBUG,  "[Telemetry]: Assiging taskMetrics on the daemon side",  v62,  2u);
    }
  }

  uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"sourceApplicationBundleIdentifierForMobileAsset"]);
  objc_msgSend(v3, "set_sourceApplicationBundleIdentifierForMobileAsset:", v48);

  id v49 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"preconnect"]);
  unsigned int v50 = [v49 isEqual:&__kCFBooleanTrue];

  if (v50) {
    objc_msgSend(v3, "set_preconnect:", 1);
  }
  id v51 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"cookies"]);
  if (v51)
  {
    uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue([v3 currentRequest]);
    id v53 = [v52 mutableCopy];

    [v53 setValue:v51 forHTTPHeaderField:@"Cookie"];
    [v3 updateCurrentRequest:v53];
  }
}

void sub_10003D1B8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, void *a11, void *a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10003D3BC(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10003D468(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003D50C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10003D5CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003D6DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003E7A0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_10003F048(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003F1C4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10003F2CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003F4B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003F540(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(*(void *)(a1 + 32) + 16LL);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained errorOccurredDuringFinishedCallbackDelivery:v3];
}

void sub_10003F58C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_10003F5A4(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) descriptionForTaskWithIdentifier:*(void *)(a1 + 56)]);
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "%{public}@ client acknowledged completion",  (uint8_t *)&v5,  0xCu);
  }

  [*(id *)(*(void *)(a1 + 40) + 8) removeObject:*(void *)(a1 + 48)];
  return [*(id *)(a1 + 32) clientAcknowledgedTerminalCallbackForTask:*(void *)(a1 + 56)];
}

void sub_10003F680(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10003F698(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) descriptionForTaskWithIdentifier:*(void *)(a1 + 56)]);
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "%{public}@ client acknowledged file download",  (uint8_t *)&v5,  0xCu);
  }

  return [*(id *)(*(void *)(a1 + 40) + 8) removeObject:*(void *)(a1 + 48)];
}

void sub_10003F768(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003F780(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (([*(id *)(a1 + 32) hasBeenCalled] & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16LL));
    [WeakRetained errorOccurredDuringAuthCallbackDelivery:v4 completionHandler:*(void *)(a1 + 48)];

    [*(id *)(*(void *)(a1 + 40) + 8) removeObject:*(void *)(a1 + 32)];
  }
}

void sub_10003F7E8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10003F808(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    id v16 = 0LL;
    id v9 = +[SecKeyProxy createIdentityFromEndpoint:error:]( &OBJC_CLASS___SecKeyProxy,  "createIdentityFromEndpoint:error:",  v8,  &v16);
    id v10 = v16;
    if (v9)
    {
      __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v7 certificates]);
      uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NSURLCredential credentialWithIdentity:certificates:persistence:]( NSURLCredential,  "credentialWithIdentity:certificates:persistence:",  v9,  v11,  [v7 persistence]));

      id v7 = (id)v12;
      CFRelease(v9);
    }

    else
    {
      __int128 v13 = (os_log_s *)qword_100083990;
      if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v10;
        _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Failed to establish client cert proxy: %@",  buf,  0xCu);
      }
    }
  }

  if (([*(id *)(a1 + 32) hasBeenCalled] & 1) == 0)
  {
    BOOL v14 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) descriptionForTaskWithIdentifier:*(void *)(a1 + 64)]);
      *(_DWORD *)buf = 138544130;
      id v18 = v15;
      __int16 v19 = 1024;
      int v20 = a2;
      __int16 v21 = 2112;
      id v22 = v7;
      __int16 v23 = 2112;
      id v24 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@ client responded to task challenge with disp %d, cred %@, trustProxy %@",  buf,  0x26u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
    [*(id *)(a1 + 32) setHasBeenCalled:1];
    [*(id *)(*(void *)(a1 + 48) + 8) removeObject:*(void *)(a1 + 32)];
  }
}

void sub_10003FA34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10003FA74(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObject:*(void *)(a1 + 40)];
}

id sub_10003FA80(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObject:*(void *)(a1 + 40)];
}

id sub_10003FA8C(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) hasBeenCalled];
  if ((result & 1) == 0)
  {
    id v3 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) descriptionForTaskWithIdentifier:*(void *)(a1 + 72)]);
      int v5 = 138543362;
      id v6 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}@ failed to ask client for modified request, using original proposed request",  (uint8_t *)&v5,  0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
    [*(id *)(a1 + 32) setHasBeenCalled:1];
    return [*(id *)(*(void *)(a1 + 56) + 8) removeObject:*(void *)(a1 + 32)];
  }

  return result;
}

void sub_10003FB90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003FBA8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (([*(id *)(a1 + 32) hasBeenCalled] & 1) == 0)
  {
    id v7 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) descriptionForTaskWithIdentifier:*(void *)(a1 + 64)]);
      int v9 = 138543874;
      id v10 = v8;
      __int16 v11 = 2112;
      id v12 = v5;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@ client responded to will send request callback with request %@ handle %@",  (uint8_t *)&v9,  0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
    [*(id *)(a1 + 32) setHasBeenCalled:1];
    [*(id *)(*(void *)(a1 + 48) + 8) removeObject:*(void *)(a1 + 32)];
  }
}

void sub_10003FCE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003FD08(uint64_t a1)
{
  if (([*(id *)(a1 + 32) hasBeenCalled] & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16LL));
    [WeakRetained wakeUpClient:1];
  }

void sub_10003FD64( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_10003FD78(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) hasBeenCalled] & 1) == 0)
  {
    id v4 = (os_log_s *)qword_100083990;
    if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Client responded to open file callback with handle %@",  (uint8_t *)&v5,  0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
    [*(id *)(a1 + 32) setHasBeenCalled:1];
    [*(id *)(*(void *)(a1 + 40) + 8) removeObject:*(void *)(a1 + 32)];
  }
}

void sub_10003FE5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003FE74(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) descriptionForTaskWithIdentifier:*(void *)(a1 + 56)]);
    int v6 = 138543362;
    id v7 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@ failed to deliver resolved MediaSelection",  (uint8_t *)&v6,  0xCu);
  }

  [*(id *)(*(void *)(a1 + 40) + 8) removeObject:*(void *)(a1 + 48)];
}

void sub_10003FF50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10003FF74(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObject:*(void *)(a1 + 40)];
}

void sub_10003FF80(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) descriptionForTaskWithIdentifier:*(void *)(a1 + 56)]);
    int v6 = 138543362;
    id v7 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@ failed to deliver downloaded HLS variants",  (uint8_t *)&v6,  0xCu);
  }

  [*(id *)(*(void *)(a1 + 40) + 8) removeObject:*(void *)(a1 + 48)];
}

void sub_10004005C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100040080(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObject:*(void *)(a1 + 40)];
}

id sub_10004008C(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) hasBeenCalled];
  if ((result & 1) == 0)
  {
    id v3 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) descriptionForTaskWithIdentifier:*(void *)(a1 + 64)]);
      int v5 = 138543362;
      int v6 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}@ failed to ask client for delayed request disposition, continuing load",  (uint8_t *)&v5,  0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
    [*(id *)(a1 + 32) setHasBeenCalled:1];
    return [*(id *)(*(void *)(a1 + 48) + 8) removeObject:*(void *)(a1 + 32)];
  }

  return result;
}

void sub_100040190(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000401A8(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (([*(id *)(a1 + 32) hasBeenCalled] & 1) == 0)
  {
    int v6 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) descriptionForTaskWithIdentifier:*(void *)(a1 + 64)]);
      int v8 = 138543618;
      int v9 = v7;
      __int16 v10 = 1024;
      int v11 = a2;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@ client responded to delayed request callback with disposition %d",  (uint8_t *)&v8,  0x12u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
    [*(id *)(a1 + 32) setHasBeenCalled:1];
    [*(id *)(*(void *)(a1 + 48) + 8) removeObject:*(void *)(a1 + 32)];
  }
}

void sub_1000402CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000402F0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) hasBeenCalled] & 1) == 0)
  {
    id v4 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) descriptionForTaskWithIdentifier:*(void *)(a1 + 64)]);
      int v6 = 138543618;
      id v7 = v5;
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@ failed to ask client for getAuthHeadersForResponse. Error=%@",  (uint8_t *)&v6,  0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
    [*(id *)(a1 + 32) setHasBeenCalled:1];
    [*(id *)(*(void *)(a1 + 48) + 8) removeObject:*(void *)(a1 + 32)];
  }
}

void sub_10004040C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100040430(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (([*(id *)(a1 + 32) hasBeenCalled] & 1) == 0)
  {
    id v9 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) descriptionForTaskWithIdentifier:*(void *)(a1 + 64)]);
      int v11 = @"NO";
      int v12 = 138544130;
      __int16 v13 = v10;
      if ((_DWORD)a2) {
        int v11 = @"YES";
      }
      __int16 v14 = 2112;
      id v15 = v11;
      __int16 v16 = 2112;
      id v17 = v7;
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ client responded to getAuthHeadersForResponse callback with continueLoad=%@, authHeaders=%@, newRequest=%@",  (uint8_t *)&v12,  0x2Au);
    }

    (*(void (**)(void, uint64_t))(*(void *)(a1 + 56) + 16LL))(*(void *)(a1 + 56), a2);
    [*(id *)(a1 + 32) setHasBeenCalled:1];
    [*(id *)(*(void *)(a1 + 48) + 8) removeObject:*(void *)(a1 + 32)];
  }
}

void sub_100040590(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000407C8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  id v22 = v18;

  _Unwind_Resume(a1);
}

void sub_10004098C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100040ABC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100040BDC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100040CB4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000413FC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_100041648( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100041700( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_100041AEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100041BB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100041EC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100042228(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000423CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100042D8C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, uint64_t a17, void *a18, void *a19, void *a20, void *a21, void *a22, uint64_t a23, void *a24, void *a25, void *a26)
{
  _Unwind_Resume(a1);
}

void sub_100043424( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_100043658(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000436F0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_1000437AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100043910(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_21:
  __int16 v36 = (void *)objc_claimAutoreleasedReturnValue([v7 domain]);
  id v37 = [v36 isEqualToString:@"_nsurlsessiondErrorDomain"];

  uint64_t v38 = 1.0;
  if (((v37 | v35) & 1) == 0)
  {
    id v39 = (char *)objc_msgSend(v6, "retryCount", 1.0);
    [v6 setRetryCount:v39 + 1];
    uint64_t v38 = exp2((double)(unint64_t)v39);
  }

  id v40 = fmin(v38, 1800.0);
  BOOL v41 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v42 = (void *)objc_claimAutoreleasedReturnValue([v6 _loggableDescription]);
    id v47 = 138543618;
    uint64_t v48 = v42;
    id v49 = 2048;
    unsigned int v50 = v40;
    _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "%{public}@ will retry after %f seconds",  (uint8_t *)&v47,  0x16u);
  }

  unsigned int v43 = (void *)objc_claimAutoreleasedReturnValue(+[NDStatusMonitor sharedMonitor](&OBJC_CLASS___NDStatusMonitor, "sharedMonitor"));
  objc_msgSend( v43,  "performCallbackAfterNetworkChangedEvent:identifier:delay:",  self,  objc_msgSend(v6, "identifier"),  (uint64_t)v40);

  return 1;
}

void sub_100043FC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004437C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1000445B8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

LABEL_20:
    if (a3 == 100) {
      return a3;
    }
    if (a3 == 200) {
      return 200LL;
    }
    return 300LL;
  }

  if (a3 <= 499)
  {
    if (a3 == 400) {
      return 450LL;
    }
    goto LABEL_25;
  }

  if (a3 == 500) {
    return 500LL;
  }
  if (a3 != 600) {
    goto LABEL_12;
  }
  return 650LL;
}

void sub_1000449BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100044C9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100044F04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004500C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100045108(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100045328(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100045520(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100045AF8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_100045D08( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100045E28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100045F04( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100045F80( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000460F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000463D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000464F8(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _URLToUse]);
  v87 = (void *)objc_claimAutoreleasedReturnValue([v2 scheme]);

  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _URLToUse]);
  id v4 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 host]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _URLToUse]);
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 port]);

  v86 = v6;
  if (v6)
  {
    unsigned int v7 = [v6 unsignedIntegerValue];
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _URLToUse]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 scheme]);
    unsigned int v7 = sub_1000473C0(v9);
  }

  id v10 = v87;
  if ([v10 caseInsensitiveCompare:@"http"])
  {
    id v11 = [v10 caseInsensitiveCompare:@"https"];

    if (v11)
    {

      id v4 = @"configuration.apple.com";
      unsigned int v7 = sub_1000473C0(@"http");
    }
  }

  else
  {
  }

  int v12 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v103 = v4;
    __int16 v104 = 1024;
    LODWORD(v105) = (unsigned __int16)v7;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Creating tcp_connection to host: %@, port: %d",  buf,  0x12u);
  }

  __int16 v13 = v4;
  id v14 = -[__CFString UTF8String](v13, "UTF8String");
  if (v14 && (uint64_t v15 = tcp_connection_create(v14, bswap32(v7) >> 16, *(void *)(*(void *)(a1 + 40) + 200LL))) != 0)
  {
    __int16 v16 = (__CFString *)v15;
    tcp_connection_allow_client_socket_access(v15, 1LL);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _URLToUse]);
    id v18 = objc_claimAutoreleasedReturnValue([v17 absoluteString]);
    tcp_connection_set_url(v16, [v18 UTF8String]);

    id v19 = (os_log_s *)qword_100083990;
    if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v103 = v16;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Created tcp_connection: %@", buf, 0xCu);
    }

    v101.receiver = *(id *)(a1 + 40);
    v101.super_class = (Class)&OBJC_CLASS___NDAVBackgroundSession;
    id v20 = objc_msgSendSuper2(&v101, "monitoredAppBundleID");
    id v21 = objc_claimAutoreleasedReturnValue(v20);
    tcp_connection_set_source_application_by_bundle(v16, [v21 UTF8String]);

    [*(id *)(a1 + 48) startLoadingMetadata];
    v96[0] = _NSConcreteStackBlock;
    v96[1] = 3221225472LL;
    v96[2] = sub_100047470;
    v96[3] = &unk_100079CA8;
    id v22 = *(id *)(a1 + 32);
    uint64_t v23 = *(void *)(a1 + 40);
    id v97 = v22;
    uint64_t v98 = v23;
    id v24 = *(id *)(a1 + 56);
    uint64_t v25 = *(void *)(a1 + 64);
    id v99 = v24;
    uint64_t v100 = v25;
    __int16 v83 = objc_retainBlock(v96);
    unsigned __int8 v26 = *(id **)(a1 + 40);
    [v26[45] timeoutIntervalForResource];
    objc_msgSend(v26, "defaultWindowDurationForResourceTimeout:");
    double v28 = v27;
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    double v30 = v29;
    [*(id *)(a1 + 32) creationTime];
    double v32 = v31;
    v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    __int16 v81 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  v28 - (v30 - v32)));
    uint64_t v33 = getpid();
    id v82 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"nsurl-AV-%d-%lld",  v33,  ++qword_100083998));
    id v34 = (__CFString *)objc_claimAutoreleasedReturnValue( +[_DASActivity activityWithName:priority:duration:startingAfter:startingBefore:]( &OBJC_CLASS____DASActivity,  "activityWithName:priority:duration:startingAfter:startingBefore:"));
    -[__CFString setHandlerQueue:](v34, "setHandlerQueue:", *(void *)(*(void *)(a1 + 40) + 200LL));
    v95[0] = _NSConcreteStackBlock;
    v95[1] = 3221225472LL;
    v95[2] = sub_100047674;
    v95[3] = &unk_100079CD0;
    uint64_t v35 = *(void *)(a1 + 64);
    v95[4] = *(void *)(a1 + 40);
    v95[5] = v35;
    -[__CFString setSuspendHandler:](v34, "setSuspendHandler:", v95);
    -[__CFString setRequiresNetwork:](v34, "setRequiresNetwork:", 1LL);
    -[__CFString setRequiresPlugin:]( v34,  "setRequiresPlugin:",  [*(id *)(*(void *)(a1 + 40) + 360) _requiresPowerPluggedIn]);
    uint64_t v36 = _DASActivityTransferSizeSmall;
    id v37 = *(void **)(*(void *)(a1 + 40) + 56LL);
    uint64_t v38 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)(a1 + 64)));
    v85 = (void *)objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:v38]);

    id v39 = (void *)objc_claimAutoreleasedReturnValue([v85 _DuetActivityProperties]);
    LOBYTE(v38) = v39 == 0LL;

    if ((v38 & 1) == 0)
    {
      id v40 = (void *)objc_claimAutoreleasedReturnValue([v85 _DuetActivityProperties]);
      BOOL v41 = (void *)objc_claimAutoreleasedReturnValue([v40 objectForKeyedSubscript:kConditionalConnectionRequirementDownloadBytes]);

      if (v41)
      {
        id v42 = [v41 unsignedLongLongValue];
        if ((unint64_t)v42 <= 0x40000000)
        {
          if ((unint64_t)v42 <= 0x1F400000)
          {
            if ((unint64_t)v42 <= 0x6400000)
            {
              if ((unint64_t)v42 <= 0xA00000)
              {
                unsigned int v43 = (uint64_t *)&_DASActivityTransferSizeVerySmall;
              }

              else
              {
                unsigned int v43 = (uint64_t *)&_DASActivityTransferSizeModerate;
              }
            }

            else
            {
              unsigned int v43 = (uint64_t *)&_DASActivityTransferSizeLarge;
            }
          }

          else
          {
            unsigned int v43 = (uint64_t *)&_DASActivityTransferSizeVeryLarge;
          }
        }

        else
        {
          unsigned int v43 = (uint64_t *)&_DASActivityTransferSizeGigantic;
        }

        uint64_t v36 = *v43;
      }

      uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue([v85 _DuetActivityProperties]);
      id v53 = (void *)objc_claimAutoreleasedReturnValue([v52 objectForKeyedSubscript:kConditionalConnectionRequirementDuetPreClearedMode]);

      if (v53) {
        -[__CFString setPreClearedMode:](v34, "setPreClearedMode:", (int)[v53 intValue]);
      }
    }

    -[__CFString setDownloadSize:](v34, "setDownloadSize:", v36);
    if (![*(id *)(*(void *)(a1 + 40) + 360) allowsCellularAccess]
      || ([*(id *)(*(void *)(a1 + 40) + 360) allowsExpensiveNetworkAccess] & 1) == 0)
    {
      -[__CFString setRequiresInexpensiveNetworking:](v34, "setRequiresInexpensiveNetworking:", 1LL);
    }

    if ([*(id *)(a1 + 32) isDiscretionary])
    {
      if ((uint64_t)objc_msgSend( *(id *)(a1 + 40),  "adjustedTCPConnectionPriorityForTaskPriority:",  objc_msgSend(*(id *)(a1 + 32), "basePriority")) >= 250)
      {
        if (*(_BYTE *)(*(void *)(a1 + 40) + 142LL)) {
          BOOL v54 = (uint64_t *)&_DASSchedulingPriorityMaintenance;
        }
        else {
          BOOL v54 = (uint64_t *)&_DASSchedulingPriorityBackground;
        }
      }

      else
      {
        BOOL v54 = (uint64_t *)&_DASSchedulingPriorityUserInitiatedOvercommit;
      }
    }

    else
    {
      __int128 v55 = (void *)objc_claimAutoreleasedReturnValue([v84 dateByAddingTimeInterval:10.0]);
      -[__CFString setStartBefore:](v34, "setStartBefore:", v55);

      uint64_t v56 = (uint64_t)objc_msgSend( *(id *)(a1 + 40),  "adjustedTCPConnectionPriorityForTaskPriority:",  objc_msgSend(*(id *)(a1 + 32), "basePriority"));
      BOOL v54 = (uint64_t *)&_DASSchedulingPriorityUserInitiated;
      if (v56 < 250) {
        BOOL v54 = (uint64_t *)&_DASSchedulingPriorityUserInitiatedOvercommit;
      }
    }

    uint64_t v57 = *v54;
    if ([*(id *)(a1 + 32) isDiscretionary]
      && [*(id *)(a1 + 32) startedUserInitiated])
    {
      id v58 = *(id *)(*(void *)(a1 + 40) + 32LL);
      uint64_t v59 = *(void *)(a1 + 40);
      if (*(_BYTE *)(v59 + 146))
      {
        __int128 v60 = *(void **)(v59 + 216);
        if (v60)
        {
          id v61 = v60;

          id v58 = v61;
        }
      }

      if ([v58 isInTransitionalDiscretionaryPeriod])
      {
        __int128 v62 = (os_log_s *)(id)qword_100083990;
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          __int128 v63 = (__CFString *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _loggableDescription]);
          *(_DWORD *)buf = 138543618;
          v103 = v63;
          __int16 v104 = 2112;
          v105 = v34;
          _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_DEFAULT,  "%{public}@ client is in transistional discretionary period - updating activity _DASActivity %@",  buf,  0x16u);
        }

        -[__CFString setDeferred:](v34, "setDeferred:", 1LL);
      }
    }

    -[__CFString setSchedulingPriority:](v34, "setSchedulingPriority:", v57);
    v94.receiver = *(id *)(a1 + 40);
    v94.super_class = (Class)&OBJC_CLASS___NDAVBackgroundSession;
    id v64 = objc_msgSendSuper2(&v94, "monitoredAppBundleID");
    __int128 v65 = (void *)objc_claimAutoreleasedReturnValue(v64);
    -[__CFString setBundleId:](v34, "setBundleId:", v65);

    __int128 v66 = (void *)tcp_connection_copy_endpoint(v16);
    __int128 v67 = (void *)objc_claimAutoreleasedReturnValue(+[NWEndpoint endpointWithCEndpoint:](&OBJC_CLASS___NWEndpoint, "endpointWithCEndpoint:", v66));
    __int128 v68 = (void *)tcp_connection_copy_parameters(v16);
    __int128 v69 = (void *)objc_claimAutoreleasedReturnValue( +[NWParameters parametersWithCParameters:]( &OBJC_CLASS___NWParameters,  "parametersWithCParameters:",  v68));
    __int128 v70 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v67,  kNWEndpointKey,  v69,  kNWParametersKey,  0LL));
    -[__CFString setUserInfo:](v34, "setUserInfo:", v70);

    [*(id *)(*(void *)(a1 + 40) + 344) setObject:v34 forKeyedSubscript:*(void *)(a1 + 56)];
    id v71 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      id v72 = (__CFString *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _loggableDescription]);
      *(_DWORD *)buf = 138543618;
      v103 = v72;
      __int16 v104 = 2112;
      v105 = v34;
      _os_log_impl( (void *)&_mh_execute_header,  v71,  OS_LOG_TYPE_DEFAULT,  "%{public}@ submitting _DASActivity %@",  buf,  0x16u);
    }

    id v73 = (void *)objc_claimAutoreleasedReturnValue(+[_DASScheduler sharedScheduler](&OBJC_CLASS____DASScheduler, "sharedScheduler"));
    [v73 submitActivity:v34 inGroupWithName:@"NSURLSessionBackgroundPoolName"];

    tcp_connection_set_indefinite(v16, 1LL);
    v90[0] = _NSConcreteStackBlock;
    v90[1] = 3221225472LL;
    v90[2] = sub_100047680;
    v90[3] = &unk_100079CF8;
    id v74 = *(id *)(a1 + 32);
    uint64_t v75 = *(void *)(a1 + 40);
    id v91 = v74;
    uint64_t v92 = v75;
    uint64_t v93 = *(void *)(a1 + 64);
    tcp_connection_set_event_handler(v16, v90);
    [*(id *)(*(void *)(a1 + 40) + 336) setObject:v16 forKeyedSubscript:*(void *)(a1 + 56)];
    v88[0] = _NSConcreteStackBlock;
    v88[1] = 3221225472LL;
    v88[2] = sub_100047784;
    v88[3] = &unk_100079D20;
    v76 = v83;
    id v89 = v76;
    -[__CFString setStartHandler:](v34, "setStartHandler:", v88);
    __int16 v77 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) clientBundleID]);
    uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) identifier]);
    __int16 v79 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) monitoredAppBundleID]);
    id v80 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) secondaryID]);
    sub_100035394( 0,  v77,  v78,  v79,  v80,  *(void **)(a1 + 32),  0,  0,  0,  [*(id *)(a1 + 32) isDiscretionary],  0,  0,  0,  0);
  }

  else
  {
    BOOL v44 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      uint64_t v48 = (__CFString *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _loggableDescription]);
      id v49 = *(void **)(a1 + 32);
      uint64_t v50 = *(void *)(*(void *)(a1 + 40) + 200LL);
      id v51 = (void *)objc_claimAutoreleasedReturnValue([v49 _URLToUse]);
      *(_DWORD *)buf = 138544642;
      v103 = v48;
      __int16 v104 = 2112;
      v105 = v13;
      __int16 v106 = 1024;
      int v107 = (unsigned __int16)v7;
      __int16 v108 = 2112;
      uint64_t v109 = v50;
      __int16 v110 = 2112;
      v111 = v49;
      __int16 v112 = 2112;
      v113 = v51;
      _os_log_error_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_ERROR,  "%{public}@ tcp_connection_create() returned NULL (host %@, port %d, queue %@, taskInfo %@, URL %@)",  buf,  0x3Au);
    }

    uint64_t v45 = *(void **)(a1 + 40);
    uint64_t v46 = *(void *)(a1 + 64);
    uint64_t v47 = objc_claimAutoreleasedReturnValue( +[NSURLError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSURLError,  "errorWithDomain:code:userInfo:",  NSURLErrorDomain,  -1LL,  0LL));
    [v45 taskWithIdentifier:v46 didCompleteWithError:v47];
    __int16 v16 = (__CFString *)v47;
  }
}

void sub_10004712C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, uint64_t a16, void *a17, void *a18, void *a19, void *a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, void *a45, uint64_t a46, void *a47)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000473C0(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 lowercaseString]);
  unsigned __int8 v3 = [v2 isEqualToString:@"http"];

  if ((v3 & 1) != 0)
  {
    uint64_t v4 = 80LL;
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v1 lowercaseString]);
    unsigned int v6 = [v5 isEqualToString:@"https"];

    if (v6) {
      uint64_t v4 = 443LL;
    }
    else {
      uint64_t v4 = 0LL;
    }
  }

  return v4;
}

void sub_10004744C(_Unwind_Exception *a1)
{
  unsigned __int8 v3 = v2;

  _Unwind_Resume(a1);
}

void sub_100047470(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _loggableDescription]);
    *(_DWORD *)buf = 138543362;
    id v17 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "%{public}@ got DASActivity startHandler for tcp_connection",  buf,  0xCu);
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 40) + 336) objectForKeyedSubscript:*(void *)(a1 + 48)]);
  if (v4)
  {
    id v5 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _loggableDescription]);
      *(_DWORD *)buf = 138543362;
      id v17 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@ starting tcp_connection",  buf,  0xCu);
    }

    tcp_connection_start(v4);
    dispatch_time_t v7 = dispatch_time(0LL, 10000000000LL);
    id v8 = *(void **)(a1 + 32);
    id v9 = *(dispatch_queue_s **)(*(void *)(a1 + 40) + 200LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100047790;
    block[3] = &unk_100079C58;
    id v10 = v8;
    uint64_t v11 = *(void *)(a1 + 40);
    id v13 = v10;
    uint64_t v14 = v11;
    uint64_t v15 = *(void *)(a1 + 56);
    dispatch_after(v7, v9, block);
  }
}

void sub_100047644(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100047674(uint64_t a1)
{
  return _[*(id *)(a1 + 32) stopAVAssetDownloadSessionWithTaskIdentifier:*(void *)(a1 + 40)];
}

void sub_100047680(uint64_t a1, int a2)
{
  uint64_t v4 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _loggableDescription]);
    int v6 = 138543618;
    dispatch_time_t v7 = v5;
    __int16 v8 = 1024;
    int v9 = a2;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@ received tcp_connection event %d",  (uint8_t *)&v6,  0x12u);
  }

  if (a2 == 1)
  {
    [*(id *)(a1 + 32) setEstablishedConnection:1];
    [*(id *)(a1 + 40) startAVAssetDownloadSessionWithTaskIdentifier:*(void *)(a1 + 48)];
  }

void sub_10004776C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100047784(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100047790(uint64_t a1)
{
  if (([*(id *)(a1 + 32) establishedConnection] & 1) == 0)
  {
    id v2 = (id)objc_claimAutoreleasedReturnValue( +[NSURLError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSURLError,  "errorWithDomain:code:userInfo:",  NSURLErrorDomain,  -1001LL,  0LL));
    objc_msgSend(*(id *)(a1 + 40), "cancelTCPConnectionForTask:withError:", *(void *)(a1 + 48));
    [*(id *)(a1 + 40) retryTask:*(void *)(a1 + 32) originalError:v2];
  }

void sub_100047814( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

id sub_100047828(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)&OBJC_CLASS___NDAVBackgroundSession;
  return objc_msgSendSuper2(&v3, "requeueTask:", v1);
}

void sub_100047860(void *a1)
{
  block[0] = _NSConcreteStackBlock;
  block[2] = sub_1000478DC;
  block[3] = &unk_100079C58;
  uint64_t v1 = a1[4];
  id v2 = (void *)a1[5];
  objc_super v3 = *(dispatch_queue_s **)(v1 + 200);
  block[1] = 3221225472LL;
  uint64_t v4 = a1[6];
  void block[4] = v1;
  uint64_t v7 = v4;
  id v6 = v2;
  dispatch_async(v3, block);
}

id sub_1000478DC(uint64_t a1)
{
  return [*(id *)(a1 + 32) taskWithIdentifier:*(void *)(a1 + 48) didCompleteWithError:*(void *)(a1 + 40)];
}

void sub_1000478EC(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) clientBundleID]);
  unsigned int v4 = [v2 isEqualToString:v3];

  if (v4)
  {
    id v5 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) clientBundleID]);
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) identifier]);
      *(_DWORD *)buf = 138412546;
      id v24 = v6;
      __int16 v25 = 2112;
      unsigned __int8 v26 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Client exited transitional discretionary period.  Re-evaluating task priorities for session <%@>.<%@>",  buf,  0x16u);
    }

    __int16 v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 40) + 224) allKeys]);
    id v9 = [v8 copy];

    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v10 = v9;
    id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0LL; i != v11; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*(void *)(a1 + 40) + 224),  "objectForKeyedSubscript:",  v14,  (void)v18));
          if ([v15 isDiscretionary]
            && [v15 startedUserInitiated]
            && ([v15 establishedConnection] & 1) == 0)
          {
            __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 _URLToUse]);
            id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLError _web_errorWithDomain:code:URL:]( &OBJC_CLASS___NSURLError,  "_web_errorWithDomain:code:URL:",  @"_nsurlsessiondErrorDomain",  9LL,  v16));

            objc_msgSend( *(id *)(a1 + 40),  "cancelAVDownloadAndFailTaskWithIdentifier:withError:",  objc_msgSend(v14, "unsignedIntegerValue"),  v17);
          }
        }

        id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }

      while (v11);
    }
  }

void sub_100047B68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100047BE4(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) clientBundleID]);
  unsigned int v4 = [v2 isEqualToString:v3];

  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = *(void **)(v5 + 232);
    *(void *)(v5 + 232) = 0LL;

    uint64_t v7 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) clientBundleID]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) identifier]);
      *(_DWORD *)buf = 138412546;
      unsigned __int8 v26 = v8;
      __int16 v27 = 2112;
      double v28 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Cancelling AVAssetDownloads for session <%@>.<%@> since client was quit from app switcher",  buf,  0x16u);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 40) + 224) allKeys]);
    id v11 = [v10 copy];

    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id obj = v11;
    id v12 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v21;
      do
      {
        for (uint64_t i = 0LL; i != v12; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
          __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 40) + 224) objectForKeyedSubscript:v15]);
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 _URLToUse]);
          __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLError _web_errorWithDomain:code:URL:]( &OBJC_CLASS___NSURLError,  "_web_errorWithDomain:code:URL:",  @"_nsurlsessiondErrorDomain",  1LL,  v17));

          objc_msgSend( *(id *)(a1 + 40),  "cancelAVDownloadAndFailTaskWithIdentifier:withError:",  objc_msgSend(v15, "unsignedIntegerValue"),  v18);
        }

        id v12 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      }

      while (v12);
    }
  }

void sub_100047E54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100047ED4(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 336) count])
  {
    id v2 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) bundleIdentifier]);
      *(_DWORD *)buf = 138412290;
      __int16 v27 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Bumping priority of AVAssetDownloads for %@ since it entered the foreground",  buf,  0xCu);
    }
  }

  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v5 = *(id *)(*(void *)(a1 + 32) + 336LL);
  id v6 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0LL; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 320) objectForKeyedSubscript:v9]);
        BOOL v11 = v10 == 0LL;

        if (v11) {
          [v4 addObject:v9];
        }
        else {
          [*(id *)(a1 + 32) updatePriorityForTaskID:v9];
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }

    while (v6);
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v12 = v4;
  id v13 = [v12 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v17;
    do
    {
      for (j = 0LL; j != v13; j = (char *)j + 1)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend( *(id *)(a1 + 32),  "updatePriorityForTaskID:",  *(void *)(*((void *)&v16 + 1) + 8 * (void)j),  (void)v16);
      }

      id v13 = [v12 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }

    while (v13);
  }
}

void sub_10004813C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100048178(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 336) count])
  {
    id v2 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) bundleIdentifier]);
      *(_DWORD *)buf = 138412290;
      __int16 v27 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Lowering priority of AVAssetDownloads for %@ since it is no longer in the foreground",  buf,  0xCu);
    }
  }

  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v5 = *(id *)(*(void *)(a1 + 32) + 336LL);
  id v6 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0LL; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 320) objectForKeyedSubscript:v9]);
        BOOL v11 = v10 == 0LL;

        if (v11) {
          [*(id *)(a1 + 32) updatePriorityForTaskID:v9];
        }
        else {
          [v4 addObject:v9];
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }

    while (v6);
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v12 = v4;
  id v13 = [v12 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v17;
    do
    {
      for (j = 0LL; j != v13; j = (char *)j + 1)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend( *(id *)(a1 + 32),  "updatePriorityForTaskID:",  *(void *)(*((void *)&v16 + 1) + 8 * (void)j),  (void)v16);
      }

      id v13 = [v12 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }

    while (v13);
  }
}

void sub_1000483E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004841C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 _destinationURLToUse]);
  __int16 v8 = v7;
  if (v7)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 URLByDeletingLastPathComponent]);
    id v38 = 0LL;
    unsigned __int8 v10 = [v9 checkResourceIsReachableAndReturnError:&v38];
    id v11 = v38;

    if ((v10 & 1) == 0)
    {
      id v12 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 _loggableDescription]);
        *(_DWORD *)buf = 138543874;
        id v42 = v13;
        __int16 v43 = 2112;
        id v44 = v8;
        __int16 v45 = 2112;
        id v46 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}@ not restoring task due to unreachable destination folder %@ (%@)",  buf,  0x20u);
      }

      [v6 setState:3];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLError _web_errorWithDomain:code:failingURL:]( &OBJC_CLASS___NSURLError,  "_web_errorWithDomain:code:failingURL:",  NSURLErrorDomain,  -3000LL,  0LL));
      [v6 setError:v14];

      uint64_t v15 = objc_alloc(&OBJC_CLASS___PendingCallback);
      id v16 = [v6 identifier];
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
      v40[0] = v17;
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      v40[1] = v18;
      v40[2] = &__NSDictionary0__struct;
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v40, 3LL));
      __int128 v20 = -[PendingCallback initWithCallbackType:taskIdentifier:args:]( v15,  "initWithCallbackType:taskIdentifier:args:",  0LL,  v16,  v19);

      [*(id *)(*(void *)(a1 + 32) + 208) addPendingCallback:v20 wakeRequirement:0];
    }
  }

  if ([v6 initializedWithAVAsset] && (uint64_t)objc_msgSend(v6, "state") <= 2)
  {
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v6 AVAssetURL]);
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v6 assetOptionsPlist]);
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue( +[AVURLAsset assetForNSURLSessionWithURL:propertyList:]( &OBJC_CLASS___AVURLAsset,  "assetForNSURLSessionWithURL:propertyList:",  v21,  v22));

    [v6 setAVURLAsset:v23];
    objc_msgSend(v6, "setAVAssetDownloadToken:", objc_msgSend(v23, "downloadToken"));
    if (!v23
      || (id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 URL]),
          BOOL v25 = v24 == 0LL,
          v24,
          v25))
    {
      double v29 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v6 _loggableDescription]);
        id v37 = [v6 AVAssetDownloadToken];
        *(_DWORD *)buf = 138543618;
        id v42 = v36;
        __int16 v43 = 2048;
        id v44 = v37;
        _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "%{public}@ failed to re-instantiate AVURLAsset with token %llu",  buf,  0x16u);
      }

      [v6 setState:3];
      double v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLError _web_errorWithDomain:code:failingURL:]( &OBJC_CLASS___NSURLError,  "_web_errorWithDomain:code:failingURL:",  NSURLErrorDomain,  -1LL,  0LL));
      [v6 setError:v30];

      double v31 = objc_alloc(&OBJC_CLASS___PendingCallback);
      id v32 = [v6 identifier];
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
      v39[0] = v33;
      id v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      v39[1] = v34;
      v39[2] = &__NSDictionary0__struct;
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v39, 3LL));
      unsigned __int8 v26 = -[PendingCallback initWithCallbackType:taskIdentifier:args:]( v31,  "initWithCallbackType:taskIdentifier:args:",  0LL,  v32,  v35);

      [*(id *)(*(void *)(a1 + 32) + 208) addPendingCallback:v26 wakeRequirement:0];
    }

    else
    {
      unsigned __int8 v26 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v27 = (void *)objc_claimAutoreleasedReturnValue([v6 _loggableDescription]);
        id v28 = [v6 AVAssetDownloadToken];
        *(_DWORD *)buf = 138543618;
        id v42 = v27;
        __int16 v43 = 2048;
        id v44 = v28;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "%{public}@ restored asset with token %llu from archivedInfo",  buf,  0x16u);
      }
    }
  }

  if ((uint64_t)[v6 state] <= 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "addOutstandingTaskWithIdentifier:", objc_msgSend(v5, "unsignedIntegerValue"));
    [*(id *)(a1 + 40) addObject:v6];
  }

  [*(id *)(*(void *)(a1 + 32) + 224) setObject:v6 forKeyedSubscript:v5];
}

void sub_100048938(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100048A5C(uint64_t a1)
{
  id v2 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientBundleID]);
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
    int v9 = 138412546;
    unsigned __int8 v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Delayed wake timer fired for session <%@>.<%@>",  (uint8_t *)&v9,  0x16u);
  }

  if ([*(id *)(*(void *)(a1 + 32) + 208) count]
    && ([*(id *)(a1 + 32) clientIsActive] & 1) == 0)
  {
    id v5 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientBundleID]);
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
      int v9 = 138412546;
      unsigned __int8 v10 = v6;
      __int16 v11 = 2112;
      id v12 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Triggering delayed wake for session <%@>.<%@>",  (uint8_t *)&v9,  0x16u);
    }

    [*(id *)(a1 + 32) wakeUpClient:1];
  }

  return [*(id *)(a1 + 32) cancelDelayedCompletionWakeTimer];
}

void sub_100048BF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100048D1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100049068(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id objc_msgSend_AVAssetDownloadToken(void *a1, const char *a2, ...)
{
  return _[a1 AVAssetDownloadToken];
}

id objc_msgSend_AVAssetURL(void *a1, const char *a2, ...)
{
  return _[a1 AVAssetURL];
}

id objc_msgSend_AVURLAsset(void *a1, const char *a2, ...)
{
  return _[a1 AVURLAsset];
}

id objc_msgSend_HTTPAdditionalHeaders(void *a1, const char *a2, ...)
{
  return _[a1 HTTPAdditionalHeaders];
}

id objc_msgSend_HTTPBodyStream(void *a1, const char *a2, ...)
{
  return _[a1 HTTPBodyStream];
}

id objc_msgSend_HTTPMaximumConnectionsPerHost(void *a1, const char *a2, ...)
{
  return _[a1 HTTPMaximumConnectionsPerHost];
}

id objc_msgSend_NDAVAssetDownloadSessionWrapper_didCompleteWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "NDAVAssetDownloadSessionWrapper:didCompleteWithError:");
}

id objc_msgSend_NDAVAssetDownloadSessionWrapper_didFinishDownloadForMediaSelectionPropertyList_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "NDAVAssetDownloadSessionWrapper:didFinishDownloadForMediaSelectionPropertyList:");
}

id objc_msgSend_NDAVAssetDownloadSessionWrapper_didLoadTimeRange_totalTimeRangesLoaded_timeRangeExpectedToLoad_forMediaSelectionPropertyList_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "NDAVAssetDownloadSessionWrapper:didLoadTimeRange:totalTimeRangesLoaded:timeRangeExpectedToLoad:forMediaSelect ionPropertyList:");
}

id objc_msgSend_NDAVAssetDownloadSessionWrapper_didResolveMediaSelectionPropertyList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "NDAVAssetDownloadSessionWrapper:didResolveMediaSelectionPropertyList:");
}

id objc_msgSend_NDAVAssetDownloadSessionWrapper_didUpdateProgressWithLastBytesWritten_totalBytesWritten_totalBytesExpectedToWrite_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "NDAVAssetDownloadSessionWrapper:didUpdateProgressWithLastBytesWritten:totalBytesWritten:totalBytesExpectedToWrite:");
}

id objc_msgSend_NDAVAssetDownloadSessionWrapper_willDownloadVariants_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "NDAVAssetDownloadSessionWrapper:willDownloadVariants:");
}

id objc_msgSend_TLSMaximumSupportedProtocol(void *a1, const char *a2, ...)
{
  return _[a1 TLSMaximumSupportedProtocol];
}

id objc_msgSend_TLSMinimumSupportedProtocol(void *a1, const char *a2, ...)
{
  return _[a1 TLSMinimumSupportedProtocol];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLAssetWithURL_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLAssetWithURL:options:");
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:");
}

id objc_msgSend_URLByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathExtension:");
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_URLForDirectory_inDomain_appropriateForURL_create_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLForDirectory:inDomain:appropriateForURL:create:error:");
}

id objc_msgSend_URLPathAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 URLPathAllowedCharacterSet];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__AVAssetDownloadSessionOptions_config_asset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_AVAssetDownloadSessionOptions:config:asset:");
}

id objc_msgSend__DuetActivityProperties(void *a1, const char *a2, ...)
{
  return _[a1 _DuetActivityProperties];
}

id objc_msgSend__IDSMessageTimeout(void *a1, const char *a2, ...)
{
  return _[a1 _IDSMessageTimeout];
}

id objc_msgSend__TCPAdaptiveReadTimeout(void *a1, const char *a2, ...)
{
  return _[a1 _TCPAdaptiveReadTimeout];
}

id objc_msgSend__TCPAdaptiveWriteTimeout(void *a1, const char *a2, ...)
{
  return _[a1 _TCPAdaptiveWriteTimeout];
}

id objc_msgSend__TLSMaximumSupportedProtocolVersion(void *a1, const char *a2, ...)
{
  return _[a1 _TLSMaximumSupportedProtocolVersion];
}

id objc_msgSend__TLSMinimumSupportedProtocolVersion(void *a1, const char *a2, ...)
{
  return _[a1 _TLSMinimumSupportedProtocolVersion];
}

id objc_msgSend__URLToUse(void *a1, const char *a2, ...)
{
  return _[a1 _URLToUse];
}

id objc_msgSend__allProtocolProperties(void *a1, const char *a2, ...)
{
  return _[a1 _allProtocolProperties];
}

id objc_msgSend__allowsHSTSWithUntrustedRootCertificate(void *a1, const char *a2, ...)
{
  return _[a1 _allowsHSTSWithUntrustedRootCertificate];
}

id objc_msgSend__allowsPowerNapScheduling(void *a1, const char *a2, ...)
{
  return _[a1 _allowsPowerNapScheduling];
}

id objc_msgSend__allowsRetryForBackgroundDataTasks(void *a1, const char *a2, ...)
{
  return _[a1 _allowsRetryForBackgroundDataTasks];
}

id objc_msgSend__allowsTLSECH(void *a1, const char *a2, ...)
{
  return _[a1 _allowsTLSECH];
}

id objc_msgSend__allowsTLSFallback(void *a1, const char *a2, ...)
{
  return _[a1 _allowsTLSFallback];
}

id objc_msgSend__allowsTLSFalseStart(void *a1, const char *a2, ...)
{
  return _[a1 _allowsTLSFalseStart];
}

id objc_msgSend__allowsUCA(void *a1, const char *a2, ...)
{
  return _[a1 _allowsUCA];
}

id objc_msgSend__allowsVirtualInterfaces(void *a1, const char *a2, ...)
{
  return _[a1 _allowsVirtualInterfaces];
}

id objc_msgSend__alwaysPerformDefaultTrustEvaluation(void *a1, const char *a2, ...)
{
  return _[a1 _alwaysPerformDefaultTrustEvaluation];
}

id objc_msgSend__asset(void *a1, const char *a2, ...)
{
  return _[a1 _asset];
}

id objc_msgSend__atsContext(void *a1, const char *a2, ...)
{
  return _[a1 _atsContext];
}

id objc_msgSend__authenticatorStatusCodes(void *a1, const char *a2, ...)
{
  return _[a1 _authenticatorStatusCodes];
}

id objc_msgSend__backgroundPublishingURL(void *a1, const char *a2, ...)
{
  return _[a1 _backgroundPublishingURL];
}

id objc_msgSend__backgroundTrailers(void *a1, const char *a2, ...)
{
  return _[a1 _backgroundTrailers];
}

id objc_msgSend__beginSqliteTransaction(void *a1, const char *a2, ...)
{
  return _[a1 _beginSqliteTransaction];
}

id objc_msgSend__clientIsNotExplicitlyDiscretionary(void *a1, const char *a2, ...)
{
  return _[a1 _clientIsNotExplicitlyDiscretionary];
}

id objc_msgSend__commitSqliteTransaction(void *a1, const char *a2, ...)
{
  return _[a1 _commitSqliteTransaction];
}

id objc_msgSend__connectionIsCellular(void *a1, const char *a2, ...)
{
  return _[a1 _connectionIsCellular];
}

id objc_msgSend__connectionPoolName(void *a1, const char *a2, ...)
{
  return _[a1 _connectionPoolName];
}

id objc_msgSend__copySocketStreamProperties(void *a1, const char *a2, ...)
{
  return _[a1 _copySocketStreamProperties];
}

id objc_msgSend__createDBSchemaForPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createDBSchemaForPath:");
}

id objc_msgSend__daemon_connectionMetrics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_daemon_connectionMetrics");
}

id objc_msgSend__daemon_currentTransactionMetrics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_daemon_currentTransactionMetrics");
}

id objc_msgSend__daemon_establishTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_daemon_establishTime");
}

id objc_msgSend__daemon_interfaceName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_daemon_interfaceName");
}

id objc_msgSend__daemon_isDataBudgetingEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_daemon_isDataBudgetingEnabled");
}

id objc_msgSend__daemon_isDiscretionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_daemon_isDiscretionary");
}

id objc_msgSend__daemon_requestBodyTransferSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_daemon_requestBodyTransferSize");
}

id objc_msgSend__daemon_requestHeaderSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_daemon_requestHeaderSize");
}

id objc_msgSend__daemon_responseBodyTransferSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_daemon_responseBodyTransferSize");
}

id objc_msgSend__daemon_responseHeaderSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_daemon_responseHeaderSize");
}

id objc_msgSend__deleteAllTaskEntriesForSession_sessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deleteAllTaskEntriesForSession:sessionUUID:");
}

id objc_msgSend__deleteTaskEntriesWithIdentifiers_forSession_sessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deleteTaskEntriesWithIdentifiers:forSession:sessionUUID:");
}

id objc_msgSend__destinationURLToUse(void *a1, const char *a2, ...)
{
  return _[a1 _destinationURLToUse];
}

id objc_msgSend__directoryForDownloadedFiles(void *a1, const char *a2, ...)
{
  return _[a1 _directoryForDownloadedFiles];
}

id objc_msgSend__doesSZExtractorConsumeExtractedData(void *a1, const char *a2, ...)
{
  return _[a1 _doesSZExtractorConsumeExtractedData];
}

id objc_msgSend__downloadTaskWithRequest_downloadFilePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_downloadTaskWithRequest:downloadFilePath:");
}

id objc_msgSend__duetPreClearedMode(void *a1, const char *a2, ...)
{
  return _[a1 _duetPreClearedMode];
}

id objc_msgSend__duetPreauthorized(void *a1, const char *a2, ...)
{
  return _[a1 _duetPreauthorized];
}

id objc_msgSend__effectiveConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 _effectiveConfiguration];
}

id objc_msgSend__extractor(void *a1, const char *a2, ...)
{
  return _[a1 _extractor];
}

id objc_msgSend__extractorFinishedDecoding(void *a1, const char *a2, ...)
{
  return _[a1 _extractorFinishedDecoding];
}

id objc_msgSend__extractorPreparedForExtraction(void *a1, const char *a2, ...)
{
  return _[a1 _extractorPreparedForExtraction];
}

id objc_msgSend__getAllSessionIDsForBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getAllSessionIDsForBundle:");
}

id objc_msgSend__getAllTasksFromDBForSession_sessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getAllTasksFromDBForSession:sessionUUID:");
}

id objc_msgSend__groupConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 _groupConfiguration];
}

id objc_msgSend__hasSZExtractor(void *a1, const char *a2, ...)
{
  return _[a1 _hasSZExtractor];
}

id objc_msgSend__infersDiscretionaryFromOriginatingClient(void *a1, const char *a2, ...)
{
  return _[a1 _infersDiscretionaryFromOriginatingClient];
}

id objc_msgSend__initDB_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initDB:");
}

id objc_msgSend__isSafeDirectoryForDownloads_withToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isSafeDirectoryForDownloads:withToken:");
}

id objc_msgSend__isSafeRequestForBackgroundDownload(void *a1, const char *a2, ...)
{
  return _[a1 _isSafeRequestForBackgroundDownload];
}

id objc_msgSend__legacySocketStreamProperties(void *a1, const char *a2, ...)
{
  return _[a1 _legacySocketStreamProperties];
}

id objc_msgSend__loggableDescription(void *a1, const char *a2, ...)
{
  return _[a1 _loggableDescription];
}

id objc_msgSend__loggingPrivacyLevel(void *a1, const char *a2, ...)
{
  return _[a1 _loggingPrivacyLevel];
}

id objc_msgSend__maximumWatchCellularTransferSize(void *a1, const char *a2, ...)
{
  return _[a1 _maximumWatchCellularTransferSize];
}

id objc_msgSend__metrics(void *a1, const char *a2, ...)
{
  return _[a1 _metrics];
}

id objc_msgSend__multipathAlternatePort(void *a1, const char *a2, ...)
{
  return _[a1 _multipathAlternatePort];
}

id objc_msgSend__neTrackerTCCResult(void *a1, const char *a2, ...)
{
  return _[a1 _neTrackerTCCResult];
}

id objc_msgSend__onBehalfOfPairedDevice(void *a1, const char *a2, ...)
{
  return _[a1 _onBehalfOfPairedDevice];
}

id objc_msgSend__onqueue_adoptEffectiveConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_adoptEffectiveConfiguration:");
}

id objc_msgSend__onqueue_convertSqlRowToTaskInfoEntry_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_convertSqlRowToTaskInfoEntry:");
}

id objc_msgSend__onqueue_deleteEntryForTask_forSession_sessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_deleteEntryForTask:forSession:sessionUUID:");
}

id objc_msgSend__onqueue_initDB(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_initDB");
}

id objc_msgSend__onqueue_insertOrUpdateAllEntriesForTask_sessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_insertOrUpdateAllEntriesForTask:sessionUUID:");
}

id objc_msgSend__onqueue_resetRequestDelay(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_resetRequestDelay");
}

id objc_msgSend__onqueue_updateBytesPerSecondLimitForTask_sessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_updateBytesPerSecondLimitForTask:sessionUUID:");
}

id objc_msgSend__onqueue_updateCurrentRequestForTask_sessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_updateCurrentRequestForTask:sessionUUID:");
}

id objc_msgSend__onqueue_updateDownloadFileURLForTask_sessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_updateDownloadFileURLForTask:sessionUUID:");
}

id objc_msgSend__onqueue_updateExpectedProgressTargetForTask_sessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_updateExpectedProgressTargetForTask:sessionUUID:");
}

id objc_msgSend__onqueue_updateLoadingPriorityForTask_sessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_updateLoadingPriorityForTask:sessionUUID:");
}

id objc_msgSend__onqueue_updateRespondedToWillBeginDelayedRequestCallbackForTask_sessionUUID_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_updateRespondedToWillBeginDelayedRequestCallbackForTask:sessionUUID:");
}

id objc_msgSend__onqueue_updateResponseForTask_sessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_updateResponseForTask:sessionUUID:");
}

id objc_msgSend__onqueue_updateResumableUploadDataForTask_sessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_updateResumableUploadDataForTask:sessionUUID:");
}

id objc_msgSend__onqueue_updateSetPriorityEntriesForTask_sessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_updateSetPriorityEntriesForTask:sessionUUID:");
}

id objc_msgSend__onqueue_updateShouldCancelOnDisconnectForTask_sessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_updateShouldCancelOnDisconnectForTask:sessionUUID:");
}

id objc_msgSend__onqueue_updateSuspendPathEntriesForTask_sessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_updateSuspendPathEntriesForTask:sessionUUID:");
}

id objc_msgSend__onqueue_updateTLSSupportedProtocolVersionForTask_sessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_updateTLSSupportedProtocolVersionForTask:sessionUUID:");
}

id objc_msgSend__onqueue_updateTaskDescriptionForTask_sessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_updateTaskDescriptionForTask:sessionUUID:");
}

id objc_msgSend__performsEVCertCheck(void *a1, const char *a2, ...)
{
  return _[a1 _performsEVCertCheck];
}

id objc_msgSend__pidForHAR(void *a1, const char *a2, ...)
{
  return _[a1 _pidForHAR];
}

id objc_msgSend__prefersInfraWiFi(void *a1, const char *a2, ...)
{
  return _[a1 _prefersInfraWiFi];
}

id objc_msgSend__priorityValue(void *a1, const char *a2, ...)
{
  return _[a1 _priorityValue];
}

id objc_msgSend__propertyForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_propertyForKey:");
}

id objc_msgSend__releasePreventIdleSleepAssertionIfAppropriate(void *a1, const char *a2, ...)
{
  return _[a1 _releasePreventIdleSleepAssertionIfAppropriate];
}

id objc_msgSend__removeAllProtocolProperties(void *a1, const char *a2, ...)
{
  return _[a1 _removeAllProtocolProperties];
}

id objc_msgSend__reportsDataStalls(void *a1, const char *a2, ...)
{
  return _[a1 _reportsDataStalls];
}

id objc_msgSend__requestFromResumeData(void *a1, const char *a2, ...)
{
  return _[a1 _requestFromResumeData];
}

id objc_msgSend__requiresPowerPluggedIn(void *a1, const char *a2, ...)
{
  return _[a1 _requiresPowerPluggedIn];
}

id objc_msgSend__requiresSustainedDataDelivery(void *a1, const char *a2, ...)
{
  return _[a1 _requiresSustainedDataDelivery];
}

id objc_msgSend__respectsAllowsCellularAccessForDiscretionaryTasks(void *a1, const char *a2, ...)
{
  return _[a1 _respectsAllowsCellularAccessForDiscretionaryTasks];
}

id objc_msgSend__seenFirstResume(void *a1, const char *a2, ...)
{
  return _[a1 _seenFirstResume];
}

id objc_msgSend__sessionSendsLaunchOnDemandEvents(void *a1, const char *a2, ...)
{
  return _[a1 _sessionSendsLaunchOnDemandEvents];
}

id objc_msgSend__sessionWithConfiguration_delegate_delegateDispatchQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sessionWithConfiguration:delegate:delegateDispatchQueue:");
}

id objc_msgSend__setAllowsUCA_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setAllowsUCA:");
}

id objc_msgSend__setQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setQueue:");
}

id objc_msgSend__setTimeWindowDelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setTimeWindowDelay:");
}

id objc_msgSend__setTimeWindowDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setTimeWindowDuration:");
}

id objc_msgSend__shouldSkipPreferredClientCertificateLookup(void *a1, const char *a2, ...)
{
  return _[a1 _shouldSkipPreferredClientCertificateLookup];
}

id objc_msgSend__socketStreamProperties(void *a1, const char *a2, ...)
{
  return _[a1 _socketStreamProperties];
}

id objc_msgSend__sourceApplicationAuditTokenData(void *a1, const char *a2, ...)
{
  return _[a1 _sourceApplicationAuditTokenData];
}

id objc_msgSend__sourceApplicationBundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 _sourceApplicationBundleIdentifier];
}

id objc_msgSend__sourceApplicationBundleIdentifierForMobileAsset(void *a1, const char *a2, ...)
{
  return _[a1 _sourceApplicationBundleIdentifierForMobileAsset];
}

id objc_msgSend__sourceApplicationSecondaryIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 _sourceApplicationSecondaryIdentifier];
}

id objc_msgSend__sqlBlobHelper_forColumn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sqlBlobHelper:forColumn:");
}

id objc_msgSend__supportsAVAssetDownloads(void *a1, const char *a2, ...)
{
  return _[a1 _supportsAVAssetDownloads];
}

id objc_msgSend__taskGroup(void *a1, const char *a2, ...)
{
  return _[a1 _taskGroup];
}

id objc_msgSend__timeWindowDelay(void *a1, const char *a2, ...)
{
  return _[a1 _timeWindowDelay];
}

id objc_msgSend__timeWindowDuration(void *a1, const char *a2, ...)
{
  return _[a1 _timeWindowDuration];
}

id objc_msgSend__timingDataOptions(void *a1, const char *a2, ...)
{
  return _[a1 _timingDataOptions];
}

id objc_msgSend__tlsSessionCachePrefix(void *a1, const char *a2, ...)
{
  return _[a1 _tlsSessionCachePrefix];
}

id objc_msgSend__tlsTrustPinningPolicyName(void *a1, const char *a2, ...)
{
  return _[a1 _tlsTrustPinningPolicyName];
}

id objc_msgSend__trailers(void *a1, const char *a2, ...)
{
  return _[a1 _trailers];
}

id objc_msgSend__updateDBEntriesForTasksInSession_taskInfos_updates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateDBEntriesForTasksInSession:taskInfos:updates:");
}

id objc_msgSend__updateDBEntryForTask_updateType_sessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateDBEntryForTask:updateType:sessionUUID:");
}

id objc_msgSend__updatedStreamingZipModificationDate(void *a1, const char *a2, ...)
{
  return _[a1 _updatedStreamingZipModificationDate];
}

id objc_msgSend__useTLSSessionCacheFromSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_useTLSSessionCacheFromSession:");
}

id objc_msgSend__web_errorWithDomain_code_URL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_web_errorWithDomain:code:URL:");
}

id objc_msgSend__web_errorWithDomain_code_failingURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_web_errorWithDomain:code:failingURL:");
}

id objc_msgSend__xpcActivityBudgeted(void *a1, const char *a2, ...)
{
  return _[a1 _xpcActivityBudgeted];
}

id objc_msgSend__xpcConnection(void *a1, const char *a2, ...)
{
  return _[a1 _xpcConnection];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _[a1 absoluteString];
}

id objc_msgSend_acquireWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acquireWithError:");
}

id objc_msgSend_activityCanceled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activityCanceled:");
}

id objc_msgSend_activityCompleted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activityCompleted:");
}

id objc_msgSend_activityWithName_priority_duration_startingAfter_startingBefore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activityWithName:priority:duration:startingAfter:startingBefore:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_addObserver_forApplication_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:forApplication:");
}

id objc_msgSend_addOutstandingTaskWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOutstandingTaskWithIdentifier:");
}

id objc_msgSend_addPendingCallback_wakeRequirement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPendingCallback:wakeRequirement:");
}

id objc_msgSend_addPendingCallbackToFront_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPendingCallbackToFront:");
}

id objc_msgSend_addTransaction(void *a1, const char *a2, ...)
{
  return _[a1 addTransaction];
}

id objc_msgSend_additionalProperties(void *a1, const char *a2, ...)
{
  return _[a1 additionalProperties];
}

id objc_msgSend_adjustDiscretionaryStatusForTaskInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adjustDiscretionaryStatusForTaskInfo:");
}

id objc_msgSend_adjustedTCPConnectionPriorityForTaskPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adjustedTCPConnectionPriorityForTaskPriority:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allowReconnect(void *a1, const char *a2, ...)
{
  return _[a1 allowReconnect];
}

id objc_msgSend_allowsCellularAccess(void *a1, const char *a2, ...)
{
  return _[a1 allowsCellularAccess];
}

id objc_msgSend_allowsConstrainedNetworkAccess(void *a1, const char *a2, ...)
{
  return _[a1 allowsConstrainedNetworkAccess];
}

id objc_msgSend_allowsExpensiveNetworkAccess(void *a1, const char *a2, ...)
{
  return _[a1 allowsExpensiveNetworkAccess];
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_application_hasAssertionWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "application:hasAssertionWithName:");
}

id objc_msgSend_application_isHandlingBackgroundSessionWithIdentifier_withSessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "application:isHandlingBackgroundSessionWithIdentifier:withSessionUUID:");
}

id objc_msgSend_applicationBackgroundUpdatesEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationBackgroundUpdatesEnabled:");
}

id objc_msgSend_applicationBackgroundUpdatesTurnedOff_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationBackgroundUpdatesTurnedOff:");
}

id objc_msgSend_applicationBackgroundUpdatesTurnedOn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationBackgroundUpdatesTurnedOn:");
}

id objc_msgSend_applicationEnteredForeground_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationEnteredForeground:");
}

id objc_msgSend_applicationHasBackgroundTaskCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationHasBackgroundTaskCompletion:");
}

id objc_msgSend_applicationIsForeground_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationIsForeground:");
}

id objc_msgSend_applicationIsInstalled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationIsInstalled:");
}

id objc_msgSend_applicationNoLongerInForeground_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationNoLongerInForeground:");
}

id objc_msgSend_applicationWasQuitFromAppSwitcher_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationWasQuitFromAppSwitcher:");
}

id objc_msgSend_applicationWasSuspended_pid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationWasSuspended:pid:");
}

id objc_msgSend_applicationWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationWithIdentifier:");
}

id objc_msgSend_archivePath(void *a1, const char *a2, ...)
{
  return _[a1 archivePath];
}

id objc_msgSend_archiveState(void *a1, const char *a2, ...)
{
  return _[a1 archiveState];
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_args(void *a1, const char *a2, ...)
{
  return _[a1 args];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_assertionNameForSessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assertionNameForSessionUUID:");
}

id objc_msgSend_assertions(void *a1, const char *a2, ...)
{
  return _[a1 assertions];
}

id objc_msgSend_assetArtworkData(void *a1, const char *a2, ...)
{
  return _[a1 assetArtworkData];
}

id objc_msgSend_assetDownloadSessionWithAsset_mediaSelections_destinationURL_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetDownloadSessionWithAsset:mediaSelections:destinationURL:options:");
}

id objc_msgSend_assetDownloadSessionWithURL_destinationURL_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetDownloadSessionWithURL:destinationURL:options:");
}

id objc_msgSend_assetForNSURLSessionWithURL_propertyList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetForNSURLSessionWithURL:propertyList:");
}

id objc_msgSend_assetOptionsPlist(void *a1, const char *a2, ...)
{
  return _[a1 assetOptionsPlist];
}

id objc_msgSend_assetTitle(void *a1, const char *a2, ...)
{
  return _[a1 assetTitle];
}

id objc_msgSend_attributeWithDomain_name_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributeWithDomain:name:");
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return _[a1 attributes];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return _[a1 auditToken];
}

id objc_msgSend_authenticationMethod(void *a1, const char *a2, ...)
{
  return _[a1 authenticationMethod];
}

id objc_msgSend_avAssetDownloadChildDownloadSessionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 avAssetDownloadChildDownloadSessionIdentifier];
}

id objc_msgSend_avAssetDownloadsDirectory(void *a1, const char *a2, ...)
{
  return _[a1 avAssetDownloadsDirectory];
}

id objc_msgSend_avAssetForURL_downloadToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "avAssetForURL:downloadToken:");
}

id objc_msgSend_backgroundAVAssetDownloadTask_didFinishDownloadForMediaSelectionPropertyList_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundAVAssetDownloadTask:didFinishDownloadForMediaSelectionPropertyList:");
}

id objc_msgSend_backgroundAVAssetDownloadTask_didLoadTimeRange_totalTimeRangesLoaded_timeRangeExpectedToLoad_forMediaSelectionPropertyList_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "backgroundAVAssetDownloadTask:didLoadTimeRange:totalTimeRangesLoaded:timeRangeExpectedToLoad:forMediaSelectionPropertyList:");
}

id objc_msgSend_backgroundAVAssetDownloadTask_didReceiveDownloadToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundAVAssetDownloadTask:didReceiveDownloadToken:");
}

id objc_msgSend_backgroundAVAssetDownloadTask_didResolveMediaSelectionProperyList_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundAVAssetDownloadTask:didResolveMediaSelectionProperyList:reply:");
}

id objc_msgSend_backgroundAVAssetDownloadTask_willDownloadToURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundAVAssetDownloadTask:willDownloadToURL:");
}

id objc_msgSend_backgroundAVAssetDownloadTask_willDownloadVariants_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundAVAssetDownloadTask:willDownloadVariants:reply:");
}

id objc_msgSend_backgroundAVAssetDownloadTaskDidUpdateProgress_totalBytesWritten_totalBytesExpectedToWrite_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "backgroundAVAssetDownloadTaskDidUpdateProgress:totalBytesWritten:totalBytesExpectedToWrite:");
}

id objc_msgSend_backgroundDataTask_didReceiveData_withReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundDataTask:didReceiveData:withReply:");
}

id objc_msgSend_backgroundDataTaskDidBecomeDownloadTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundDataTaskDidBecomeDownloadTask:");
}

id objc_msgSend_backgroundDownloadTask_didFinishDownloadingToURL_response_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundDownloadTask:didFinishDownloadingToURL:response:reply:");
}

id objc_msgSend_backgroundDownloadTask_didResumeAtOffset_expectedTotalBytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundDownloadTask:didResumeAtOffset:expectedTotalBytes:");
}

id objc_msgSend_backgroundDownloadTask_didWriteData_totalBytesWritten_totalBytesExpectedToWrite_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundDownloadTask:didWriteData:totalBytesWritten:totalBytesExpectedToWrite:");
}

id objc_msgSend_backgroundSessionDidFinishAppWake_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundSessionDidFinishAppWake:reply:");
}

id objc_msgSend_backgroundSessionDidStartAppWake_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundSessionDidStartAppWake:reply:");
}

id objc_msgSend_backgroundTask__willSendRequestForEstablishedConnection_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundTask:_willSendRequestForEstablishedConnection:reply:");
}

id objc_msgSend_backgroundTask_didCompleteWithError_taskMetrics_info_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundTask:didCompleteWithError:taskMetrics:info:reply:");
}

id objc_msgSend_backgroundTask_didReceiveChallenge_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundTask:didReceiveChallenge:reply:");
}

id objc_msgSend_backgroundTask_didReceiveInformationalResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundTask:didReceiveInformationalResponse:");
}

id objc_msgSend_backgroundTask_didReceiveResponse_transactionMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundTask:didReceiveResponse:transactionMetrics:");
}

id objc_msgSend_backgroundTask_didReceiveResponse_transactionMetrics_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundTask:didReceiveResponse:transactionMetrics:reply:");
}

id objc_msgSend_backgroundTask_didSendBodyData_totalBytesSent_totalBytesExpectedToSend_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundTask:didSendBodyData:totalBytesSent:totalBytesExpectedToSend:");
}

id objc_msgSend_backgroundTask_getAuthHeadersForResponse_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundTask:getAuthHeadersForResponse:reply:");
}

id objc_msgSend_backgroundTask_hasConnectionWaitingWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundTask:hasConnectionWaitingWithError:");
}

id objc_msgSend_backgroundTask_needNewBodyStream_withReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundTask:needNewBodyStream:withReply:");
}

id objc_msgSend_backgroundTask_willBeginDelayedRequest_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundTask:willBeginDelayedRequest:reply:");
}

id objc_msgSend_backgroundTask_willPerformHTTPRedirection_withNewRequest_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundTask:willPerformHTTPRedirection:withNewRequest:reply:");
}

id objc_msgSend_backgroundTaskDidResume_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundTaskDidResume:");
}

id objc_msgSend_backgroundTaskDidSuspend_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundTaskDidSuspend:");
}

id objc_msgSend_backgroundUpdatesEnabled(void *a1, const char *a2, ...)
{
  return _[a1 backgroundUpdatesEnabled];
}

id objc_msgSend_basePriority(void *a1, const char *a2, ...)
{
  return _[a1 basePriority];
}

id objc_msgSend_basePrioritySetExplicitly(void *a1, const char *a2, ...)
{
  return _[a1 basePrioritySetExplicitly];
}

id objc_msgSend_beginActivityWithOptions_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginActivityWithOptions:reason:");
}

id objc_msgSend_bgSessionManagerInterface(void *a1, const char *a2, ...)
{
  return _[a1 bgSessionManagerInterface];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bundle(void *a1, const char *a2, ...)
{
  return _[a1 bundle];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return _[a1 bundleID];
}

id objc_msgSend_bundleIDsForAppProxies_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleIDsForAppProxies:");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bundleManagerPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleManagerPath:");
}

id objc_msgSend_bundleRecordWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_bytesPerSecondLimit(void *a1, const char *a2, ...)
{
  return _[a1 bytesPerSecondLimit];
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cStringUsingEncoding:");
}

id objc_msgSend_canBeSuspended(void *a1, const char *a2, ...)
{
  return _[a1 canBeSuspended];
}

id objc_msgSend_canLaunchProcessWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canLaunchProcessWithIdentifier:");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _[a1 cancel];
}

id objc_msgSend_cancelAVDownloadAndFailTaskWithIdentifier_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelAVDownloadAndFailTaskWithIdentifier:withError:");
}

id objc_msgSend_cancelAndDeliverError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelAndDeliverError:");
}

id objc_msgSend_cancelByProducingResumeData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelByProducingResumeData:");
}

id objc_msgSend_cancelDelayedCompletionWakeTimer(void *a1, const char *a2, ...)
{
  return _[a1 cancelDelayedCompletionWakeTimer];
}

id objc_msgSend_cancelMonitorForTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelMonitorForTask:");
}

id objc_msgSend_cancelTCPConnectionForTask_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelTCPConnectionForTask:withError:");
}

id objc_msgSend_cancelTaskWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelTaskWithIdentifier:");
}

id objc_msgSend_cancelTasksRequiringClientConnectionAndResumeUnstartedTasks(void *a1, const char *a2, ...)
{
  return _[a1 cancelTasksRequiringClientConnectionAndResumeUnstartedTasks];
}

id objc_msgSend_cancelThroughputMonitorForWrapper_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelThroughputMonitorForWrapper:");
}

id objc_msgSend_cancel_with_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancel_with_error:");
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "caseInsensitiveCompare:");
}

id objc_msgSend_certificates(void *a1, const char *a2, ...)
{
  return _[a1 certificates];
}

id objc_msgSend_checkResourceIsReachableAndReturnError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkResourceIsReachableAndReturnError:");
}

id objc_msgSend_cleanupSessionWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cleanupSessionWithCompletionHandler:");
}

id objc_msgSend_cleanupWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cleanupWithCompletionHandler:");
}

id objc_msgSend_client(void *a1, const char *a2, ...)
{
  return _[a1 client];
}

id objc_msgSend_clientAcknowledgedTerminalCallbackForTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientAcknowledgedTerminalCallbackForTask:");
}

id objc_msgSend_clientApplicationWasReinstalled(void *a1, const char *a2, ...)
{
  return _[a1 clientApplicationWasReinstalled];
}

id objc_msgSend_clientBundleID(void *a1, const char *a2, ...)
{
  return _[a1 clientBundleID];
}

id objc_msgSend_clientDidDisconnect(void *a1, const char *a2, ...)
{
  return _[a1 clientDidDisconnect];
}

id objc_msgSend_clientErrorForError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientErrorForError:");
}

id objc_msgSend_clientIsActive(void *a1, const char *a2, ...)
{
  return _[a1 clientIsActive];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return _[a1 close];
}

id objc_msgSend_closeFile(void *a1, const char *a2, ...)
{
  return _[a1 closeFile];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return _[a1 configuration];
}

id objc_msgSend_configurationWithClientConfiguration_discretionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithClientConfiguration:discretionary:");
}

id objc_msgSend_configureAdditionalPropertiesOnTask_taskInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureAdditionalPropertiesOnTask:taskInfo:");
}

id objc_msgSend_configureTask_withTaskInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureTask:withTaskInfo:");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_connection_canUseSharedContainerIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connection:canUseSharedContainerIdentifier:");
}

id objc_msgSend_connectionProxyDictionary(void *a1, const char *a2, ...)
{
  return _[a1 connectionProxyDictionary];
}

id objc_msgSend_containerURL(void *a1, const char *a2, ...)
{
  return _[a1 containerURL];
}

id objc_msgSend_containingBundleRecord(void *a1, const char *a2, ...)
{
  return _[a1 containingBundleRecord];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return _[a1 context];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyAndSanitizeClientConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyAndSanitizeClientConfiguration:");
}

id objc_msgSend_copyItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyItemAtURL:toURL:error:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countOfBytesClientExpectsToReceive(void *a1, const char *a2, ...)
{
  return _[a1 countOfBytesClientExpectsToReceive];
}

id objc_msgSend_countOfBytesClientExpectsToSend(void *a1, const char *a2, ...)
{
  return _[a1 countOfBytesClientExpectsToSend];
}

id objc_msgSend_countOfBytesExpectedToReceive(void *a1, const char *a2, ...)
{
  return _[a1 countOfBytesExpectedToReceive];
}

id objc_msgSend_countOfBytesExpectedToSend(void *a1, const char *a2, ...)
{
  return _[a1 countOfBytesExpectedToSend];
}

id objc_msgSend_countOfBytesExpectedToWrite(void *a1, const char *a2, ...)
{
  return _[a1 countOfBytesExpectedToWrite];
}

id objc_msgSend_countOfBytesReceived(void *a1, const char *a2, ...)
{
  return _[a1 countOfBytesReceived];
}

id objc_msgSend_countOfBytesSent(void *a1, const char *a2, ...)
{
  return _[a1 countOfBytesSent];
}

id objc_msgSend_countOfBytesWritten(void *a1, const char *a2, ...)
{
  return _[a1 countOfBytesWritten];
}

id objc_msgSend_createActivityGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createActivityGroup:");
}

id objc_msgSend_createDaemonDirectory(void *a1, const char *a2, ...)
{
  return _[a1 createDaemonDirectory];
}

id objc_msgSend_createDataVaultDirectoryAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDataVaultDirectoryAtPath:");
}

id objc_msgSend_createDirectoryAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtPath:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createDirectoryAtURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtURL:");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createFileAtPath_contents_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createFileAtPath:contents:attributes:");
}

id objc_msgSend_createIdentityFromEndpoint_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createIdentityFromEndpoint:error:");
}

id objc_msgSend_createNewTaskFromInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createNewTaskFromInfo:");
}

id objc_msgSend_createResumeDataForTaskInfo(void *a1, const char *a2, ...)
{
  return _[a1 createResumeDataForTaskInfo];
}

id objc_msgSend_createResumeInformation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createResumeInformation:");
}

id objc_msgSend_creationTime(void *a1, const char *a2, ...)
{
  return _[a1 creationTime];
}

id objc_msgSend_credStorage_allCredentialsWithReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "credStorage_allCredentialsWithReply:");
}

id objc_msgSend_credStorage_credentialsForProtectionSpace_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "credStorage_credentialsForProtectionSpace:reply:");
}

id objc_msgSend_credStorage_defaultCredentialForProtectionSpace_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "credStorage_defaultCredentialForProtectionSpace:reply:");
}

id objc_msgSend_credStorage_getInitialCredentialDictionariesWithReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "credStorage_getInitialCredentialDictionariesWithReply:");
}

id objc_msgSend_credStorage_setCredential_forProtectionSpace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "credStorage_setCredential:forProtectionSpace:");
}

id objc_msgSend_credStorage_setDefaultCredential_forProtectionSpace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "credStorage_setDefaultCredential:forProtectionSpace:");
}

id objc_msgSend_credentialForTrust_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "credentialForTrust:");
}

id objc_msgSend_credentialWithIdentity_certificates_persistence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "credentialWithIdentity:certificates:persistence:");
}

id objc_msgSend_credentialWithUser_password_persistence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "credentialWithUser:password:persistence:");
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return _[a1 currentConnection];
}

id objc_msgSend_currentDiscretionaryStatus_withOptionalTaskInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentDiscretionaryStatus:withOptionalTaskInfo:");
}

id objc_msgSend_currentIntervalDuration(void *a1, const char *a2, ...)
{
  return _[a1 currentIntervalDuration];
}

id objc_msgSend_currentIntervalEndDelta(void *a1, const char *a2, ...)
{
  return _[a1 currentIntervalEndDelta];
}

id objc_msgSend_currentIntervalThroughputThreshold(void *a1, const char *a2, ...)
{
  return _[a1 currentIntervalThroughputThreshold];
}

id objc_msgSend_currentRequest(void *a1, const char *a2, ...)
{
  return _[a1 currentRequest];
}

id objc_msgSend_currentRequestDelay(void *a1, const char *a2, ...)
{
  return _[a1 currentRequestDelay];
}

id objc_msgSend_currentRequest_URL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentRequest_URL");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 currentRunLoop];
}

id objc_msgSend_currentState(void *a1, const char *a2, ...)
{
  return _[a1 currentState];
}

id objc_msgSend_currentThroughputThreshold(void *a1, const char *a2, ...)
{
  return _[a1 currentThroughputThreshold];
}

id objc_msgSend_dataContainerURL(void *a1, const char *a2, ...)
{
  return _[a1 dataContainerURL];
}

id objc_msgSend_dataTaskWithRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataTaskWithRequest:");
}

id objc_msgSend_dataWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfFile:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateByAddingTimeInterval:");
}

id objc_msgSend_dateWithTimeIntervalSince1970_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSince1970:");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_decodeIntegerForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeIntegerForKey:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_defaultDownloadDirectoryContainer(void *a1, const char *a2, ...)
{
  return _[a1 defaultDownloadDirectoryContainer];
}

id objc_msgSend_defaultDownloadDirectoryForBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultDownloadDirectoryForBundleID:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_defaultSessionConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 defaultSessionConfiguration];
}

id objc_msgSend_defaultTaskGroup(void *a1, const char *a2, ...)
{
  return _[a1 defaultTaskGroup];
}

id objc_msgSend_defaultWindowDurationForResourceTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultWindowDurationForResourceTimeout:");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _[a1 defaultWorkspace];
}

id objc_msgSend_descriptionForRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionForRequest:");
}

id objc_msgSend_descriptionForTaskWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionForTaskWithIdentifier:");
}

id objc_msgSend_descriptor(void *a1, const char *a2, ...)
{
  return _[a1 descriptor];
}

id objc_msgSend_destinationURL(void *a1, const char *a2, ...)
{
  return _[a1 destinationURL];
}

id objc_msgSend_destinationURLToUseForTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "destinationURLToUseForTask:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObject:forKey:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dictionaryWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjectsAndKeys:");
}

id objc_msgSend_disableTransitionalDiscretionaryPeriodTimer(void *a1, const char *a2, ...)
{
  return _[a1 disableTransitionalDiscretionaryPeriodTimer];
}

id objc_msgSend_disablesRetry(void *a1, const char *a2, ...)
{
  return _[a1 disablesRetry];
}

id objc_msgSend_disavowSession(void *a1, const char *a2, ...)
{
  return _[a1 disavowSession];
}

id objc_msgSend_discretionaryOverride(void *a1, const char *a2, ...)
{
  return _[a1 discretionaryOverride];
}

id objc_msgSend_doesAVAssetDownloadSessionSupportMultipleDownloads(void *a1, const char *a2, ...)
{
  return _[a1 doesAVAssetDownloadSessionSupportMultipleDownloads];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_downloadAsset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadAsset:");
}

id objc_msgSend_downloadConfig(void *a1, const char *a2, ...)
{
  return _[a1 downloadConfig];
}

id objc_msgSend_downloadDirectoryToUse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadDirectoryToUse:");
}

id objc_msgSend_downloadFile(void *a1, const char *a2, ...)
{
  return _[a1 downloadFile];
}

id objc_msgSend_downloadFileURL(void *a1, const char *a2, ...)
{
  return _[a1 downloadFileURL];
}

id objc_msgSend_downloadSession(void *a1, const char *a2, ...)
{
  return _[a1 downloadSession];
}

id objc_msgSend_downloadTaskWithResumeData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadTaskWithResumeData:");
}

id objc_msgSend_downloadToken(void *a1, const char *a2, ...)
{
  return _[a1 downloadToken];
}

id objc_msgSend_drainCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "drainCallback:");
}

id objc_msgSend_drainCallbacksForTaskIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "drainCallbacksForTaskIdentifier:");
}

id objc_msgSend_dropBoost(void *a1, const char *a2, ...)
{
  return _[a1 dropBoost];
}

id objc_msgSend_earlierDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "earlierDate:");
}

id objc_msgSend_earliestBeginDate(void *a1, const char *a2, ...)
{
  return _[a1 earliestBeginDate];
}

id objc_msgSend_embeddedApplicationIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 embeddedApplicationIdentifier];
}

id objc_msgSend_enableSPIDelegateCallbacks(void *a1, const char *a2, ...)
{
  return _[a1 enableSPIDelegateCallbacks];
}

id objc_msgSend_encodeInteger_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeInteger:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return _[a1 encodedData];
}

id objc_msgSend_endActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endActivity:");
}

id objc_msgSend_endowmentNamespaces(void *a1, const char *a2, ...)
{
  return _[a1 endowmentNamespaces];
}

id objc_msgSend_endpointWithCEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endpointWithCEndpoint:");
}

id objc_msgSend_enqueueTaskWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueueTaskWithIdentifier:");
}

id objc_msgSend_ensureAVAssetDownloadSessionWrapperForTaskIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ensureAVAssetDownloadSessionWrapperForTaskIdentifier:");
}

id objc_msgSend_ensureSessionDownloadDirectoryExists(void *a1, const char *a2, ...)
{
  return _[a1 ensureSessionDownloadDirectoryExists];
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return _[a1 error];
}

id objc_msgSend_error_code_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "error:code:");
}

id objc_msgSend_errorIfBlockedTracker_url_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorIfBlockedTracker:url:");
}

id objc_msgSend_errorOccurredDuringAuthCallbackDelivery_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorOccurredDuringAuthCallbackDelivery:completionHandler:");
}

id objc_msgSend_errorOccurredDuringFinishedCallbackDelivery_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorOccurredDuringFinishedCallbackDelivery:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_establishedConnection(void *a1, const char *a2, ...)
{
  return _[a1 establishedConnection];
}

id objc_msgSend_exitEvent(void *a1, const char *a2, ...)
{
  return _[a1 exitEvent];
}

id objc_msgSend_expectedProgressTarget(void *a1, const char *a2, ...)
{
  return _[a1 expectedProgressTarget];
}

id objc_msgSend_expectingResumeCallback(void *a1, const char *a2, ...)
{
  return _[a1 expectingResumeCallback];
}

id objc_msgSend_explanation(void *a1, const char *a2, ...)
{
  return _[a1 explanation];
}

id objc_msgSend_fetchStreamingZipModificationDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchStreamingZipModificationDate:");
}

id objc_msgSend_fileDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 fileDescriptor];
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 fileSystemRepresentation];
}

id objc_msgSend_fileURL(void *a1, const char *a2, ...)
{
  return _[a1 fileURL];
}

id objc_msgSend_fileURLWithFileSystemRepresentation_isDirectory_relativeToURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:isDirectory:relativeToURL:");
}

id objc_msgSend_fillInByteCountsForTaskInfo_withTaskID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fillInByteCountsForTaskInfo:withTaskID:");
}

id objc_msgSend_fillInPropertiesForTaskInfo_withTaskID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fillInPropertiesForTaskInfo:withTaskID:");
}

id objc_msgSend_finalizeTaskCompletionWithSuppressedWake_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finalizeTaskCompletionWithSuppressedWake:");
}

id objc_msgSend_findBestAssetFrom_skipDownload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findBestAssetFrom:skipDownload:");
}

id objc_msgSend_finishTasksAndInvalidate(void *a1, const char *a2, ...)
{
  return _[a1 finishTasksAndInvalidate];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_getBackgroundSettingsAppList(void *a1, const char *a2, ...)
{
  return _[a1 getBackgroundSettingsAppList];
}

id objc_msgSend_getClientProxy(void *a1, const char *a2, ...)
{
  return _[a1 getClientProxy];
}

id objc_msgSend_getLocalFileUrl(void *a1, const char *a2, ...)
{
  return _[a1 getLocalFileUrl];
}

id objc_msgSend_getResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getResourceValue:forKey:error:");
}

id objc_msgSend_getSessionWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getSessionWithIdentifier:");
}

id objc_msgSend_getSessionWithIdentifier_forBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getSessionWithIdentifier:forBundleID:");
}

id objc_msgSend_getTLSSessionCachePrefix(void *a1, const char *a2, ...)
{
  return _[a1 getTLSSessionCachePrefix];
}

id objc_msgSend_getTasksForReconnection(void *a1, const char *a2, ...)
{
  return _[a1 getTasksForReconnection];
}

id objc_msgSend_getUUIDBytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getUUIDBytes:");
}

id objc_msgSend_groupContainerURLs(void *a1, const char *a2, ...)
{
  return _[a1 groupContainerURLs];
}

id objc_msgSend_groupWithName_maxConcurrent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupWithName:maxConcurrent:");
}

id objc_msgSend_handleCompletionOfTask_identifier_taskInfo_isRecoverable_suppressWake_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleCompletionOfTask:identifier:taskInfo:isRecoverable:suppressWake:");
}

id objc_msgSend_handleEarliestBeginDateForTaskWithIdentifier_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleEarliestBeginDateForTaskWithIdentifier:completionHandler:");
}

id objc_msgSend_handleForPredicate_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleForPredicate:error:");
}

id objc_msgSend_handleNewConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleNewConnection:");
}

id objc_msgSend_handleSchemaVersionChange(void *a1, const char *a2, ...)
{
  return _[a1 handleSchemaVersionChange];
}

id objc_msgSend_handleWillBeginDelayedRequestForTaskWithIdentifier_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleWillBeginDelayedRequestForTaskWithIdentifier:completionHandler:");
}

id objc_msgSend_hasBackgroundTaskCompletion(void *a1, const char *a2, ...)
{
  return _[a1 hasBackgroundTaskCompletion];
}

id objc_msgSend_hasBeenCalled(void *a1, const char *a2, ...)
{
  return _[a1 hasBeenCalled];
}

id objc_msgSend_hasConnectedClient(void *a1, const char *a2, ...)
{
  return _[a1 hasConnectedClient];
}

id objc_msgSend_hasForegroundBackgroundStates(void *a1, const char *a2, ...)
{
  return _[a1 hasForegroundBackgroundStates];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasStarted(void *a1, const char *a2, ...)
{
  return _[a1 hasStarted];
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return _[a1 host];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_identifierIsForSpringBoardApplication_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifierIsForSpringBoardApplication:");
}

id objc_msgSend_identity(void *a1, const char *a2, ...)
{
  return _[a1 identity];
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_initRequiringSecureCoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initRequiringSecureCoding:");
}

id objc_msgSend_initWithAVAggregateAssetDownloadChildDownloadSessionIdentifier_assetTitle_assetArtworkData_options_taskIdentifier_uniqueIdentifier_bundleID_sessionID_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithAVAggregateAssetDownloadChildDownloadSessionIdentifier:assetTitle:assetArtworkData:options:taskIdenti fier:uniqueIdentifier:bundleID:sessionID:");
}

id objc_msgSend_initWithAVAggregateDownloadTaskNoChildTaskKindWithURL_destinationURL_assetTitle_assetArtworkData_options_taskIdentifier_uniqueIdentifier_bundleID_sessionID_enableSPIDelegateCallbacks_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithAVAggregateDownloadTaskNoChildTaskKindWithURL:destinationURL:assetTitle:assetArtworkData:options:task Identifier:uniqueIdentifier:bundleID:sessionID:enableSPIDelegateCallbacks:");
}

id objc_msgSend_initWithAVAssetDownloadURL_destinationURL_assetTitle_assetArtworkData_options_taskIdentifier_uniqueIdentifier_bundleID_sessionID_downloadConfig_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithAVAssetDownloadURL:destinationURL:assetTitle:assetArtworkData:options:taskIdentifier:uniqueIdentifier :bundleID:sessionID:downloadConfig:");
}

id objc_msgSend_initWithAsset_propertyList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAsset:propertyList:");
}

id objc_msgSend_initWithBackgroundTaskInfo_taskGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBackgroundTaskInfo:taskGroup:");
}

id objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_initWithBundleIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:error:");
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBytes:length:");
}

id objc_msgSend_initWithCallbackType_taskIdentifier_args_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCallbackType:taskIdentifier:args:");
}

id objc_msgSend_initWithClient_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithClient:identifier:");
}

id objc_msgSend_initWithConfiguration_bundleID_isSpringBoardApp_downloadDirectory_options_clientProxy_delegate_workQueue_db_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithConfiguration:bundleID:isSpringBoardApp:downloadDirectory:options:clientProxy:delegate:workQueue:db:");
}

id objc_msgSend_initWithDataTask_uniqueIdentifier_bundleID_sessionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDataTask:uniqueIdentifier:bundleID:sessionID:");
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:");
}

id objc_msgSend_initWithDelegate_bundleID_isSpringBoardApp_forPersona_dataSeparatedPath_db_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:bundleID:isSpringBoardApp:forPersona:dataSeparatedPath:db:");
}

id objc_msgSend_initWithDelegate_forBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:forBundleID:");
}

id objc_msgSend_initWithDownloadTask_uniqueIdentifier_bundleID_sessionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDownloadTask:uniqueIdentifier:bundleID:sessionID:");
}

id objc_msgSend_initWithExplanation_target_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithExplanation:target:attributes:");
}

id objc_msgSend_initWithHost_port_protocol_realm_authenticationMethod_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHost:port:protocol:realm:authenticationMethod:");
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:");
}

id objc_msgSend_initWithKeyOptions_valueOptions_capacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKeyOptions:valueOptions:capacity:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithTask_taskInfo_clientBundleIdentifier_secondaryIdentifier_monitoredApplication_priority_options_queue_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithTask:taskInfo:clientBundleIdentifier:secondaryIdentifier:monitoredApplication:priority:options:queue:");
}

id objc_msgSend_initWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:");
}

id objc_msgSend_initWithURL_destinationURL_options_delegate_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:destinationURL:options:delegate:queue:");
}

id objc_msgSend_initWithURLAsset_destinationURL_options_delegate_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURLAsset:destinationURL:options:delegate:queue:");
}

id objc_msgSend_initWithUUIDBytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDBytes:");
}

id objc_msgSend_initWithUploadTask_uniqueIdentifier_bundleID_sessionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUploadTask:uniqueIdentifier:bundleID:sessionID:");
}

id objc_msgSend_initWithWrapper_monitoredApplication_priority_options_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithWrapper:monitoredApplication:priority:options:queue:");
}

id objc_msgSend_initializeHTTPAuthenticatorWithAppleIDContext_statusCodes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initializeHTTPAuthenticatorWithAppleIDContext:statusCodes:");
}

id objc_msgSend_initializedWithAVAsset(void *a1, const char *a2, ...)
{
  return _[a1 initializedWithAVAsset];
}

id objc_msgSend_inputStreamWithFileHandle_taskIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inputStreamWithFileHandle:taskIdentifier:");
}

id objc_msgSend_installedAssetVersion(void *a1, const char *a2, ...)
{
  return _[a1 installedAssetVersion];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invalidateReply(void *a1, const char *a2, ...)
{
  return _[a1 invalidateReply];
}

id objc_msgSend_isAutomaticAppUpdatesAllowed(void *a1, const char *a2, ...)
{
  return _[a1 isAutomaticAppUpdatesAllowed];
}

id objc_msgSend_isCatalogFetchedWithinThePastFewDays_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCatalogFetchedWithinThePastFewDays:");
}

id objc_msgSend_isDiscretionary(void *a1, const char *a2, ...)
{
  return _[a1 isDiscretionary];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return _[a1 isFileURL];
}

id objc_msgSend_isForeground(void *a1, const char *a2, ...)
{
  return _[a1 isForeground];
}

id objc_msgSend_isHandlingBackgroundURLSessionWithIdentifier_withSessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isHandlingBackgroundURLSessionWithIdentifier:withSessionUUID:");
}

id objc_msgSend_isInSyncBubble(void *a1, const char *a2, ...)
{
  return _[a1 isInSyncBubble];
}

id objc_msgSend_isInTransitionalDiscretionaryPeriod(void *a1, const char *a2, ...)
{
  return _[a1 isInTransitionalDiscretionaryPeriod];
}

id objc_msgSend_isPrivileged(void *a1, const char *a2, ...)
{
  return _[a1 isPrivileged];
}

id objc_msgSend_isResumable(void *a1, const char *a2, ...)
{
  return _[a1 isResumable];
}

id objc_msgSend_isSpringBoardApp(void *a1, const char *a2, ...)
{
  return _[a1 isSpringBoardApp];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return _[a1 isValid];
}

id objc_msgSend_isValidAssertion_withName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidAssertion:withName:");
}

id objc_msgSend_itemShouldBePurged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemShouldBePurged:");
}

id objc_msgSend_keysSortedByValueUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keysSortedByValueUsingComparator:");
}

id objc_msgSend_knownSZExtractorImplementations(void *a1, const char *a2, ...)
{
  return _[a1 knownSZExtractorImplementations];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_launchProcessWithIdentifier_sessionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "launchProcessWithIdentifier:sessionIdentifier:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_loadingPriority(void *a1, const char *a2, ...)
{
  return _[a1 loadingPriority];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_lowThroughputTimerRetryCount(void *a1, const char *a2, ...)
{
  return _[a1 lowThroughputTimerRetryCount];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _[a1 lowercaseString];
}

id objc_msgSend_makeTempUploadFile_withExtensionData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeTempUploadFile:withExtensionData:");
}

id objc_msgSend_managerBecameEmpty_bundleID_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "managerBecameEmpty:bundleID:withCompletionHandler:");
}

id objc_msgSend_markItemAsPurged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markItemAsPurged:");
}

id objc_msgSend_mayBeDemotedToDiscretionary(void *a1, const char *a2, ...)
{
  return _[a1 mayBeDemotedToDiscretionary];
}

id objc_msgSend_maySupportWakesLater(void *a1, const char *a2, ...)
{
  return _[a1 maySupportWakesLater];
}

id objc_msgSend_migrateSchemaToLatestVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migrateSchemaToLatestVersion:");
}

id objc_msgSend_monitorWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "monitorWithConfiguration:");
}

id objc_msgSend_monitoredAppBundleID(void *a1, const char *a2, ...)
{
  return _[a1 monitoredAppBundleID];
}

id objc_msgSend_monitoredBundleIDsUpdated(void *a1, const char *a2, ...)
{
  return _[a1 monitoredBundleIDsUpdated];
}

id objc_msgSend_moveFileAtomically_toLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveFileAtomically:toLocation:");
}

id objc_msgSend_moveInstalledAsset_withVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveInstalledAsset:withVersion:");
}

id objc_msgSend_moveItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveItemAtURL:toURL:error:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_networkServiceType(void *a1, const char *a2, ...)
{
  return _[a1 networkServiceType];
}

id objc_msgSend_newAVAssetDownloadSessionWrapperForTaskInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newAVAssetDownloadSessionWrapperForTaskInfo:");
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return _[a1 nextObject];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _[a1 now];
}

id objc_msgSend_nsurlsessiondLaunchdPath(void *a1, const char *a2, ...)
{
  return _[a1 nsurlsessiondLaunchdPath];
}

id objc_msgSend_nsurlsessiondPath(void *a1, const char *a2, ...)
{
  return _[a1 nsurlsessiondPath];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
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

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLong:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_obliterate(void *a1, const char *a2, ...)
{
  return _[a1 obliterate];
}

id objc_msgSend_obliterationCompletion(void *a1, const char *a2, ...)
{
  return _[a1 obliterationCompletion];
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return _[a1 open];
}

id objc_msgSend_openApplication_withOptions_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openApplication:withOptions:completion:");
}

id objc_msgSend_openFileAtPath_mode_withReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openFileAtPath:mode:withReply:");
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _[a1 options];
}

id objc_msgSend_optionsWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "optionsWithDictionary:");
}

id objc_msgSend_originalNetworkContentURL(void *a1, const char *a2, ...)
{
  return _[a1 originalNetworkContentURL];
}

id objc_msgSend_originalRequest(void *a1, const char *a2, ...)
{
  return _[a1 originalRequest];
}

id objc_msgSend_parametersWithCParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parametersWithCParameters:");
}

id objc_msgSend_password(void *a1, const char *a2, ...)
{
  return _[a1 password];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return _[a1 pathExtension];
}

id objc_msgSend_pathToDownloadTaskFile(void *a1, const char *a2, ...)
{
  return _[a1 pathToDownloadTaskFile];
}

id objc_msgSend_pause(void *a1, const char *a2, ...)
{
  return _[a1 pause];
}

id objc_msgSend_performAllCallbacks(void *a1, const char *a2, ...)
{
  return _[a1 performAllCallbacks];
}

id objc_msgSend_performCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performCallback:");
}

id objc_msgSend_performCallbackAfterNetworkChangedEvent_identifier_delay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performCallbackAfterNetworkChangedEvent:identifier:delay:");
}

id objc_msgSend_performCallbackAfterNetworkChangedEvent_identifier_numberOfPreviousRetries_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performCallbackAfterNetworkChangedEvent:identifier:numberOfPreviousRetries:");
}

id objc_msgSend_performCommonSetupForTask_taskInfo_identifier_discretionaryStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performCommonSetupForTask:taskInfo:identifier:discretionaryStatus:");
}

id objc_msgSend_performSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:");
}

id objc_msgSend_performWake_uponNotification_sessionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performWake:uponNotification:sessionIdentifier:");
}

id objc_msgSend_persistence(void *a1, const char *a2, ...)
{
  return _[a1 persistence];
}

id objc_msgSend_persistentDomainForName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persistentDomainForName:");
}

id objc_msgSend_personaUniqueString(void *a1, const char *a2, ...)
{
  return _[a1 personaUniqueString];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return _[a1 pid];
}

id objc_msgSend_plugInKitPlugins(void *a1, const char *a2, ...)
{
  return _[a1 plugInKitPlugins];
}

id objc_msgSend_pluginIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 pluginIdentifier];
}

id objc_msgSend_populateWithInitialCredentials(void *a1, const char *a2, ...)
{
  return _[a1 populateWithInitialCredentials];
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return _[a1 port];
}

id objc_msgSend_predicateMatchingBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateMatchingBundleIdentifier:");
}

id objc_msgSend_predicateMatchingBundleIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateMatchingBundleIdentifiers:");
}

id objc_msgSend_previousFailureCount(void *a1, const char *a2, ...)
{
  return _[a1 previousFailureCount];
}

id objc_msgSend_previousState(void *a1, const char *a2, ...)
{
  return _[a1 previousState];
}

id objc_msgSend_priorityForDiscretionaryStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "priorityForDiscretionaryStatus:");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 processIdentifier];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _[a1 processInfo];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return _[a1 progress];
}

id objc_msgSend_propertyList(void *a1, const char *a2, ...)
{
  return _[a1 propertyList];
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_proposedCredential(void *a1, const char *a2, ...)
{
  return _[a1 proposedCredential];
}

id objc_msgSend_protectionSpace(void *a1, const char *a2, ...)
{
  return _[a1 protectionSpace];
}

id objc_msgSend_protocol(void *a1, const char *a2, ...)
{
  return _[a1 protocol];
}

id objc_msgSend_purge_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "purge:");
}

id objc_msgSend_qos(void *a1, const char *a2, ...)
{
  return _[a1 qos];
}

id objc_msgSend_queryAndFindBestAsset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryAndFindBestAsset:");
}

id objc_msgSend_queryMetaDataSync(void *a1, const char *a2, ...)
{
  return _[a1 queryMetaDataSync];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return _[a1 queue];
}

id objc_msgSend_queueUpdatesForTask_updateType_highPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queueUpdatesForTask:updateType:highPriority:");
}

id objc_msgSend_realm(void *a1, const char *a2, ...)
{
  return _[a1 realm];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return _[a1 reason];
}

id objc_msgSend_reconnectClient_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reconnectClient:withCompletion:");
}

id objc_msgSend_releaseAssertionForBundleID_sessionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "releaseAssertionForBundleID:sessionID:");
}

id objc_msgSend_releasePowerAssertion(void *a1, const char *a2, ...)
{
  return _[a1 releasePowerAssertion];
}

id objc_msgSend_releaseTransaction(void *a1, const char *a2, ...)
{
  return _[a1 releaseTransaction];
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeCharactersInString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeCharactersInString:");
}

id objc_msgSend_removeDownloadFileForTaskInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeDownloadFileForTaskInfo:");
}

id objc_msgSend_removeItemAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtPath:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeItemAtURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtURL:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return _[a1 removeLastObject];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_forApplication_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:forApplication:");
}

id objc_msgSend_removeOutstandingTaskWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeOutstandingTaskWithIdentifier:");
}

id objc_msgSend_removePendingWakeForClient_sessionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removePendingWakeForClient:sessionIdentifier:");
}

id objc_msgSend_removeStreamingZipModificationDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeStreamingZipModificationDate:");
}

id objc_msgSend_removeUploadFileForTaskInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeUploadFileForTaskInfo:");
}

id objc_msgSend_replaceItemAtURL_withItemAtURL_backupItemName_options_resultingItemURL_error_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:");
}

id objc_msgSend_requestDelayQueue(void *a1, const char *a2, ...)
{
  return _[a1 requestDelayQueue];
}

id objc_msgSend_requestWithAdjustedWindowForTaskInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithAdjustedWindowForTaskInfo:");
}

id objc_msgSend_requeueTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requeueTask:");
}

id objc_msgSend_requeueTask_skipResume_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requeueTask:skipResume:");
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return _[a1 reset];
}

id objc_msgSend_resetStandardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 resetStandardUserDefaults];
}

id objc_msgSend_resourceTimeoutError(void *a1, const char *a2, ...)
{
  return _[a1 resourceTimeoutError];
}

id objc_msgSend_respondedToWillBeginDelayedRequestCallback(void *a1, const char *a2, ...)
{
  return _[a1 respondedToWillBeginDelayedRequestCallback];
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return _[a1 response];
}

id objc_msgSend_restoreCompletedTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restoreCompletedTask:");
}

id objc_msgSend_restoreInProgressTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restoreInProgressTask:");
}

id objc_msgSend_restoreOptionsFromArchivePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restoreOptionsFromArchivePath:");
}

id objc_msgSend_restoreState(void *a1, const char *a2, ...)
{
  return _[a1 restoreState];
}

id objc_msgSend_restoreState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restoreState:");
}

id objc_msgSend_restoreTask_isOutstanding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restoreTask:isOutstanding:");
}

id objc_msgSend_restoreTasks_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restoreTasks:");
}

id objc_msgSend_restoreTasksFromArchivedInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restoreTasksFromArchivedInfo:");
}

id objc_msgSend_restoreTasksFromSqliteDB_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restoreTasksFromSqliteDB:");
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return _[a1 results];
}

id objc_msgSend_resumableUploadData(void *a1, const char *a2, ...)
{
  return _[a1 resumableUploadData];
}

id objc_msgSend_resumableUploadState(void *a1, const char *a2, ...)
{
  return _[a1 resumableUploadState];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_resumeTaskWithIdentifier_withProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resumeTaskWithIdentifier:withProperties:");
}

id objc_msgSend_resumedAndWaitingForEarliestBeginDate(void *a1, const char *a2, ...)
{
  return _[a1 resumedAndWaitingForEarliestBeginDate];
}

id objc_msgSend_retryCount(void *a1, const char *a2, ...)
{
  return _[a1 retryCount];
}

id objc_msgSend_retryError(void *a1, const char *a2, ...)
{
  return _[a1 retryError];
}

id objc_msgSend_retryTask_originalError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retryTask:originalError:");
}

id objc_msgSend_retryTask_originalError_transactionMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retryTask:originalError:transactionMetrics:");
}

id objc_msgSend_returnTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "returnTypes:");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _[a1 run];
}

id objc_msgSend_rusWithResumeData_originalRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rusWithResumeData:originalRequest:");
}

id objc_msgSend_sanitizeTaskProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sanitizeTaskProperties:");
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return _[a1 scheme];
}

id objc_msgSend_secondaryID(void *a1, const char *a2, ...)
{
  return _[a1 secondaryID];
}

id objc_msgSend_serverTrust(void *a1, const char *a2, ...)
{
  return _[a1 serverTrust];
}

id objc_msgSend_serviceWithDefaultShellEndpoint(void *a1, const char *a2, ...)
{
  return _[a1 serviceWithDefaultShellEndpoint];
}

id objc_msgSend_sessionCompleted_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionCompleted:withCompletionHandler:");
}

id objc_msgSend_sessionForDiscretionaryStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionForDiscretionaryStatus:");
}

id objc_msgSend_sessionHasOutstandingTasks(void *a1, const char *a2, ...)
{
  return _[a1 sessionHasOutstandingTasks];
}

id objc_msgSend_sessionID(void *a1, const char *a2, ...)
{
  return _[a1 sessionID];
}

id objc_msgSend_sessionPath_forBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionPath:forBundleID:");
}

id objc_msgSend_sessionSendsLaunchEvents(void *a1, const char *a2, ...)
{
  return _[a1 sessionSendsLaunchEvents];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setAVAssetDownloadToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAVAssetDownloadToken:");
}

id objc_msgSend_setAVAssetURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAVAssetURL:");
}

id objc_msgSend_setAVURLAsset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAVURLAsset:");
}

id objc_msgSend_setAdditionalProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdditionalProperties:");
}

id objc_msgSend_setAllowsCellularAccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsCellularAccess:");
}

id objc_msgSend_setAllowsConstrainedNetworkAccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsConstrainedNetworkAccess:");
}

id objc_msgSend_setAllowsExpensiveNetworkAccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsExpensiveNetworkAccess:");
}

id objc_msgSend_setArgs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArgs:");
}

id objc_msgSend_setAssetArtworkData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssetArtworkData:");
}

id objc_msgSend_setAssetOptionsPlist_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssetOptionsPlist:");
}

id objc_msgSend_setAssetTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssetTitle:");
}

id objc_msgSend_setAttributes_ofItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributes:ofItemAtPath:error:");
}

id objc_msgSend_setAvAssetDownloadChildDownloadSessionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAvAssetDownloadChildDownloadSessionIdentifier:");
}

id objc_msgSend_setBasePriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBasePriority:");
}

id objc_msgSend_setBasePrioritySetExplicitly_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBasePrioritySetExplicitly:");
}

id objc_msgSend_setBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleID:");
}

id objc_msgSend_setBundleId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleId:");
}

id objc_msgSend_setByAddingObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setByAddingObject:");
}

id objc_msgSend_setBytesPerSecondLimit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBytesPerSecondLimit:");
}

id objc_msgSend_setConnectionProxyDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConnectionProxyDictionary:");
}

id objc_msgSend_setCountOfBytesClientExpectsToReceive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountOfBytesClientExpectsToReceive:");
}

id objc_msgSend_setCountOfBytesClientExpectsToSend_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountOfBytesClientExpectsToSend:");
}

id objc_msgSend_setCountOfBytesExpectedToReceive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountOfBytesExpectedToReceive:");
}

id objc_msgSend_setCountOfBytesExpectedToSend_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountOfBytesExpectedToSend:");
}

id objc_msgSend_setCountOfBytesExpectedToWrite_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountOfBytesExpectedToWrite:");
}

id objc_msgSend_setCountOfBytesReceived_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountOfBytesReceived:");
}

id objc_msgSend_setCountOfBytesSent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountOfBytesSent:");
}

id objc_msgSend_setCountOfBytesWritten_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountOfBytesWritten:");
}

id objc_msgSend_setCreationTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCreationTime:");
}

id objc_msgSend_setCurrentRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentRequest:");
}

id objc_msgSend_setCurrentRequestDelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentRequestDelay:");
}

id objc_msgSend_setDefaultCredential_forProtectionSpace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultCredential:forProtectionSpace:");
}

id objc_msgSend_setDeferred_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeferred:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDelegate_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:queue:");
}

id objc_msgSend_setDestinationURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDestinationURL:");
}

id objc_msgSend_setDisablesRetry_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisablesRetry:");
}

id objc_msgSend_setDiscretionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDiscretionary:");
}

id objc_msgSend_setDiscretionaryOverride_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDiscretionaryOverride:");
}

id objc_msgSend_setDownloadConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDownloadConfig:");
}

id objc_msgSend_setDownloadFileURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDownloadFileURL:");
}

id objc_msgSend_setDownloadSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDownloadSession:");
}

id objc_msgSend_setDownloadSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDownloadSize:");
}

id objc_msgSend_setEarliestBeginDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEarliestBeginDate:");
}

id objc_msgSend_setEnableSPIDelegateCallbacks_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnableSPIDelegateCallbacks:");
}

id objc_msgSend_setEndowmentNamespaces_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndowmentNamespaces:");
}

id objc_msgSend_setError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setError:");
}

id objc_msgSend_setEstablishedConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEstablishedConnection:");
}

id objc_msgSend_setEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEvents:");
}

id objc_msgSend_setExpectedProgressTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpectedProgressTarget:");
}

id objc_msgSend_setExpectingResumeCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpectingResumeCallback:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFileURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFileURL:");
}

id objc_msgSend_setHTTPAdditionalHeaders_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPAdditionalHeaders:");
}

id objc_msgSend_setHTTPBodyStream_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPBodyStream:");
}

id objc_msgSend_setHTTPCookieStorage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPCookieStorage:");
}

id objc_msgSend_setHTTPMaximumConnectionsPerHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPMaximumConnectionsPerHost:");
}

id objc_msgSend_setHandlerQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHandlerQueue:");
}

id objc_msgSend_setHasBeenCalled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasBeenCalled:");
}

id objc_msgSend_setHasStarted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasStarted:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setInSyncBubble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInSyncBubble:");
}

id objc_msgSend_setInitializedWithAVAsset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInitializedWithAVAsset:");
}

id objc_msgSend_setInstalledAssetVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInstalledAssetVersion:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidateReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidateReply:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setIsInTransitionalDiscretionaryPeriod_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsInTransitionalDiscretionaryPeriod:");
}

id objc_msgSend_setLoadingPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLoadingPriority:");
}

id objc_msgSend_setLowThroughputTimerRetryCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLowThroughputTimerRetryCount:");
}

id objc_msgSend_setMayBeDemotedToDiscretionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMayBeDemotedToDiscretionary:");
}

id objc_msgSend_setNetworkServiceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNetworkServiceType:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setObliterationCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObliterationCompletion:");
}

id objc_msgSend_setOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOptions:");
}

id objc_msgSend_setOriginalRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOriginalRequest:");
}

id objc_msgSend_setPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPath:");
}

id objc_msgSend_setPathToDownloadTaskFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPathToDownloadTaskFile:");
}

id objc_msgSend_setPersonaUniqueString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPersonaUniqueString:");
}

id objc_msgSend_setPreClearedMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreClearedMode:");
}

id objc_msgSend_setPredicates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPredicates:");
}

id objc_msgSend_setPriority_forTCPConnectionWithTaskIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPriority:forTCPConnectionWithTaskIdentifier:");
}

id objc_msgSend_setPrivileged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrivileged:");
}

id objc_msgSend_setProperty_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProperty:forKey:");
}

id objc_msgSend_setQos_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQos:");
}

id objc_msgSend_setRequiresInexpensiveNetworking_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequiresInexpensiveNetworking:");
}

id objc_msgSend_setRequiresNetwork_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequiresNetwork:");
}

id objc_msgSend_setRequiresPlugin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequiresPlugin:");
}

id objc_msgSend_setResolvedMediaSelectionPlist_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResolvedMediaSelectionPlist:");
}

id objc_msgSend_setRespondedToWillBeginDelayedRequestCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRespondedToWillBeginDelayedRequestCallback:");
}

id objc_msgSend_setResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResponse:");
}

id objc_msgSend_setResumableUploadData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResumableUploadData:");
}

id objc_msgSend_setResumableUploadState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResumableUploadState:");
}

id objc_msgSend_setResumedAndWaitingForEarliestBeginDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResumedAndWaitingForEarliestBeginDate:");
}

id objc_msgSend_setRetryCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRetryCount:");
}

id objc_msgSend_setRetryError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRetryError:");
}

id objc_msgSend_setSchedulingPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSchedulingPriority:");
}

id objc_msgSend_setSessionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSessionID:");
}

id objc_msgSend_setSharedContainerIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSharedContainerIdentifier:");
}

id objc_msgSend_setShouldCancelOnDisconnect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldCancelOnDisconnect:");
}

id objc_msgSend_setShouldUseExtendedBackgroundIdleMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldUseExtendedBackgroundIdleMode:");
}

id objc_msgSend_setSkip_download_unlink_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSkip_download_unlink:");
}

id objc_msgSend_setStartBefore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartBefore:");
}

id objc_msgSend_setStartHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartHandler:");
}

id objc_msgSend_setStartTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartTime:");
}

id objc_msgSend_setStartedUserInitiated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartedUserInitiated:");
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setState:");
}

id objc_msgSend_setStateDescriptor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStateDescriptor:");
}

id objc_msgSend_setStoragePartitionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStoragePartitionIdentifier:");
}

id objc_msgSend_setSuspendCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuspendCount:");
}

id objc_msgSend_setSuspendHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuspendHandler:");
}

id objc_msgSend_setTLSMaximumSupportedProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTLSMaximumSupportedProtocol:");
}

id objc_msgSend_setTLSMinimumSupportedProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTLSMinimumSupportedProtocol:");
}

id objc_msgSend_setTaskDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTaskDescription:");
}

id objc_msgSend_setTaskIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTaskIdentifier:");
}

id objc_msgSend_setTaskKind_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTaskKind:");
}

id objc_msgSend_setTaskMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTaskMetrics:");
}

id objc_msgSend_setTemporaryDestinationURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTemporaryDestinationURL:");
}

id objc_msgSend_setThroughputTimerForCurrentInterval(void *a1, const char *a2, ...)
{
  return _[a1 setThroughputTimerForCurrentInterval];
}

id objc_msgSend_setTimeoutIntervalForRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeoutIntervalForRequest:");
}

id objc_msgSend_setTimeoutIntervalForResource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeoutIntervalForResource:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setType:");
}

id objc_msgSend_setURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setURL:");
}

id objc_msgSend_setURLCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setURLCache:");
}

id objc_msgSend_setURLCredentialStorage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setURLCredentialStorage:");
}

id objc_msgSend_setUniqueIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUniqueIdentifier:");
}

id objc_msgSend_setUpdateHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdateHandler:");
}

id objc_msgSend_setUploadFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUploadFile:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setValue_forHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forHTTPHeaderField:");
}

id objc_msgSend_setValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValues:");
}

id objc_msgSend_setWaitsForConnectivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWaitsForConnectivity:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setWorkState(void *a1, const char *a2, ...)
{
  return _[a1 setWorkState];
}

id objc_msgSend_setXPCConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setXPCConnection:");
}

id objc_msgSend_set_DuetActivityProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_DuetActivityProperties:");
}

id objc_msgSend_set_IDSMessageTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_IDSMessageTimeout:");
}

id objc_msgSend_set_TCPAdaptiveReadTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_TCPAdaptiveReadTimeout:");
}

id objc_msgSend_set_TCPAdaptiveWriteTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_TCPAdaptiveWriteTimeout:");
}

id objc_msgSend_set_TLSMaximumSupportedProtocolVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_TLSMaximumSupportedProtocolVersion:");
}

id objc_msgSend_set_TLSMinimumSupportedProtocolVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_TLSMinimumSupportedProtocolVersion:");
}

id objc_msgSend_set_allowsHSTSWithUntrustedRootCertificate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_allowsHSTSWithUntrustedRootCertificate:");
}

id objc_msgSend_set_allowsPowerNapScheduling_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_allowsPowerNapScheduling:");
}

id objc_msgSend_set_allowsTLSECH_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_allowsTLSECH:");
}

id objc_msgSend_set_allowsTLSFallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_allowsTLSFallback:");
}

id objc_msgSend_set_allowsTLSFalseStart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_allowsTLSFalseStart:");
}

id objc_msgSend_set_allowsVirtualInterfaces_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_allowsVirtualInterfaces:");
}

id objc_msgSend_set_alwaysPerformDefaultTrustEvaluation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_alwaysPerformDefaultTrustEvaluation:");
}

id objc_msgSend_set_atsContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_atsContext:");
}

id objc_msgSend_set_attributedBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_attributedBundleIdentifier:");
}

id objc_msgSend_set_authenticatorConfiguredViaTaskProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_authenticatorConfiguredViaTaskProperty:");
}

id objc_msgSend_set_authenticatorStatusCodes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_authenticatorStatusCodes:");
}

id objc_msgSend_set_backgroundPublishingURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_backgroundPublishingURL:");
}

id objc_msgSend_set_backgroundTrailers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_backgroundTrailers:");
}

id objc_msgSend_set_bytesPerSecondLimit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_bytesPerSecondLimit:");
}

id objc_msgSend_set_clientIsNotExplicitlyDiscretionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_clientIsNotExplicitlyDiscretionary:");
}

id objc_msgSend_set_connectionCachePurgeTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_connectionCachePurgeTimeout:");
}

id objc_msgSend_set_connectionPoolName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_connectionPoolName:");
}

id objc_msgSend_set_directoryForDownloadedFiles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_directoryForDownloadedFiles:");
}

id objc_msgSend_set_disallowCellular_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_disallowCellular:");
}

id objc_msgSend_set_discretionaryOverride_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_discretionaryOverride:");
}

id objc_msgSend_set_doesSZExtractorConsumeExtractedData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_doesSZExtractorConsumeExtractedData:");
}

id objc_msgSend_set_duetPreClearedMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_duetPreClearedMode:");
}

id objc_msgSend_set_duetPreauthorized_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_duetPreauthorized:");
}

id objc_msgSend_set_expectedProgressTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_expectedProgressTarget:");
}

id objc_msgSend_set_extractor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_extractor:");
}

id objc_msgSend_set_forcedNetworkServiceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_forcedNetworkServiceType:");
}

id objc_msgSend_set_hasSZExtractor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_hasSZExtractor:");
}

id objc_msgSend_set_legacySocketStreamProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_legacySocketStreamProperties:");
}

id objc_msgSend_set_loadingPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_loadingPriority:");
}

id objc_msgSend_set_loggingPrivacyLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_loggingPrivacyLevel:");
}

id objc_msgSend_set_longLivedConnectionCachePurgeTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_longLivedConnectionCachePurgeTimeout:");
}

id objc_msgSend_set_maximumWatchCellularTransferSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_maximumWatchCellularTransferSize:");
}

id objc_msgSend_set_metrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_metrics:");
}

id objc_msgSend_set_multipathAlternatePort_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_multipathAlternatePort:");
}

id objc_msgSend_set_neTrackerTCCResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_neTrackerTCCResult:");
}

id objc_msgSend_set_nw_activity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_nw_activity:");
}

id objc_msgSend_set_onBehalfOfPairedDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_onBehalfOfPairedDevice:");
}

id objc_msgSend_set_pathToDownloadTaskFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_pathToDownloadTaskFile:");
}

id objc_msgSend_set_pidForHAR_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_pidForHAR:");
}

id objc_msgSend_set_preconnect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_preconnect:");
}

id objc_msgSend_set_prefersInfraWiFi_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_prefersInfraWiFi:");
}

id objc_msgSend_set_preventsIdleSleepOnceConnected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_preventsIdleSleepOnceConnected:");
}

id objc_msgSend_set_priority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_priority:");
}

id objc_msgSend_set_reportsDataStalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_reportsDataStalls:");
}

id objc_msgSend_set_requiresClientToOpenFiles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_requiresClientToOpenFiles:");
}

id objc_msgSend_set_requiresPowerPluggedIn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_requiresPowerPluggedIn:");
}

id objc_msgSend_set_requiresSustainedDataDelivery_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_requiresSustainedDataDelivery:");
}

id objc_msgSend_set_respectsAllowsCellularAccessForDiscretionaryTasks_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_respectsAllowsCellularAccessForDiscretionaryTasks:");
}

id objc_msgSend_set_shouldSkipPreferredClientCertificateLookup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_shouldSkipPreferredClientCertificateLookup:");
}

id objc_msgSend_set_socketStreamProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_socketStreamProperties:");
}

id objc_msgSend_set_sourceApplicationAuditTokenData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_sourceApplicationAuditTokenData:");
}

id objc_msgSend_set_sourceApplicationBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_sourceApplicationBundleIdentifier:");
}

id objc_msgSend_set_sourceApplicationBundleIdentifierForMobileAsset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_sourceApplicationBundleIdentifierForMobileAsset:");
}

id objc_msgSend_set_sourceApplicationSecondaryIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_sourceApplicationSecondaryIdentifier:");
}

id objc_msgSend_set_storagePartitionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_storagePartitionIdentifier:");
}

id objc_msgSend_set_suspensionThreshhold_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_suspensionThreshhold:");
}

id objc_msgSend_set_tcpConnectionPoolName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_tcpConnectionPoolName:");
}

id objc_msgSend_set_timeoutIntervalForResource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_timeoutIntervalForResource:");
}

id objc_msgSend_set_timingDataOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_timingDataOptions:");
}

id objc_msgSend_set_tlsSessionCachePrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_tlsSessionCachePrefix:");
}

id objc_msgSend_set_tlsTrustPinningPolicyName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_tlsTrustPinningPolicyName:");
}

id objc_msgSend_set_uniqueIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_uniqueIdentifier:");
}

id objc_msgSend_set_updatedStreamingZipModificationDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_updatedStreamingZipModificationDate:");
}

id objc_msgSend_set_watchExtensionBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_watchExtensionBundleIdentifier:");
}

id objc_msgSend_setupArchiveTimer(void *a1, const char *a2, ...)
{
  return _[a1 setupArchiveTimer];
}

id objc_msgSend_setupDASPropertiesOnTask_taskInfo_discretionaryStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupDASPropertiesOnTask:taskInfo:discretionaryStatus:");
}

id objc_msgSend_setupDelayTimer(void *a1, const char *a2, ...)
{
  return _[a1 setupDelayTimer];
}

id objc_msgSend_setupDelayedCompletionWakeTimer(void *a1, const char *a2, ...)
{
  return _[a1 setupDelayedCompletionWakeTimer];
}

id objc_msgSend_setupDownloadDirectory(void *a1, const char *a2, ...)
{
  return _[a1 setupDownloadDirectory];
}

id objc_msgSend_setupNewClassMappingsForUnarchiver(void *a1, const char *a2, ...)
{
  return _[a1 setupNewClassMappingsForUnarchiver];
}

id objc_msgSend_setupThroughputMonitorForWrapper_taskInfo_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupThroughputMonitorForWrapper:taskInfo:identifier:");
}

id objc_msgSend_setupTransitionalDiscretionaryPeriodTimer(void *a1, const char *a2, ...)
{
  return _[a1 setupTransitionalDiscretionaryPeriodTimer];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return _[a1 sharedConnection];
}

id objc_msgSend_sharedContainerIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 sharedContainerIdentifier];
}

id objc_msgSend_sharedCredentialStorage(void *a1, const char *a2, ...)
{
  return _[a1 sharedCredentialStorage];
}

id objc_msgSend_sharedDaemon(void *a1, const char *a2, ...)
{
  return _[a1 sharedDaemon];
}

id objc_msgSend_sharedMonitor(void *a1, const char *a2, ...)
{
  return _[a1 sharedMonitor];
}

id objc_msgSend_sharedScheduler(void *a1, const char *a2, ...)
{
  return _[a1 sharedScheduler];
}

id objc_msgSend_sharedSpringBoard(void *a1, const char *a2, ...)
{
  return _[a1 sharedSpringBoard];
}

id objc_msgSend_sharedUserEventAgentConnection(void *a1, const char *a2, ...)
{
  return _[a1 sharedUserEventAgentConnection];
}

id objc_msgSend_shouldCancelOnDisconnect(void *a1, const char *a2, ...)
{
  return _[a1 shouldCancelOnDisconnect];
}

id objc_msgSend_shouldElevateDiscretionaryPriority(void *a1, const char *a2, ...)
{
  return _[a1 shouldElevateDiscretionaryPriority];
}

id objc_msgSend_simulateNetworkChangedEvent_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "simulateNetworkChangedEvent:identifier:");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_springBoardApplicationExistsWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "springBoardApplicationExistsWithIdentifier:");
}

id objc_msgSend_springboardApplicationWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "springboardApplicationWithBundleIdentifier:");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_startAVAssetDownloadSessionWithTaskIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startAVAssetDownloadSessionWithTaskIdentifier:");
}

id objc_msgSend_startCatalogDownload_then_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startCatalogDownload:then:");
}

id objc_msgSend_startDownload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startDownload:");
}

id objc_msgSend_startLoadingMetadata(void *a1, const char *a2, ...)
{
  return _[a1 startLoadingMetadata];
}

id objc_msgSend_startMonitoringBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startMonitoringBundleID:");
}

id objc_msgSend_startResourceTimer(void *a1, const char *a2, ...)
{
  return _[a1 startResourceTimer];
}

id objc_msgSend_startThroughputMonitoring(void *a1, const char *a2, ...)
{
  return _[a1 startThroughputMonitoring];
}

id objc_msgSend_startThroughputMonitoringIfAppropriate(void *a1, const char *a2, ...)
{
  return _[a1 startThroughputMonitoringIfAppropriate];
}

id objc_msgSend_startTransitionalDiscretionaryPeriodTimer(void *a1, const char *a2, ...)
{
  return _[a1 startTransitionalDiscretionaryPeriodTimer];
}

id objc_msgSend_startedUserInitiated(void *a1, const char *a2, ...)
{
  return _[a1 startedUserInitiated];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return _[a1 status];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return _[a1 statusCode];
}

id objc_msgSend_statusMonitor_callbackForIdentifier_networkChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusMonitor:callbackForIdentifier:networkChanged:");
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return _[a1 stop];
}

id objc_msgSend_stopMonitoringBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopMonitoringBundleID:");
}

id objc_msgSend_stopThroughputMonitoring(void *a1, const char *a2, ...)
{
  return _[a1 stopThroughputMonitoring];
}

id objc_msgSend_storagePartitionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 storagePartitionIdentifier];
}

id objc_msgSend_streamStatus(void *a1, const char *a2, ...)
{
  return _[a1 streamStatus];
}

id objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAddingPercentEncodingWithAllowedCharacters:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCapacity:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_submitActivity_inGroupWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "submitActivity:inGroupWithName:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_supportsWakes(void *a1, const char *a2, ...)
{
  return _[a1 supportsWakes];
}

id objc_msgSend_suspend(void *a1, const char *a2, ...)
{
  return _[a1 suspend];
}

id objc_msgSend_suspendCount(void *a1, const char *a2, ...)
{
  return _[a1 suspendCount];
}

id objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchronousRemoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_takeAssertionForBundleID_sessionID_sessionUUID_pid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "takeAssertionForBundleID:sessionID:sessionUUID:pid:");
}

id objc_msgSend_takePowerAssertion(void *a1, const char *a2, ...)
{
  return _[a1 takePowerAssertion];
}

id objc_msgSend_targetWithPid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "targetWithPid:");
}

id objc_msgSend_taskDescription(void *a1, const char *a2, ...)
{
  return _[a1 taskDescription];
}

id objc_msgSend_taskIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 taskIdentifier];
}

id objc_msgSend_taskKind(void *a1, const char *a2, ...)
{
  return _[a1 taskKind];
}

id objc_msgSend_taskMetrics(void *a1, const char *a2, ...)
{
  return _[a1 taskMetrics];
}

id objc_msgSend_taskShouldResume_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "taskShouldResume:");
}

id objc_msgSend_taskShouldSuspend_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "taskShouldSuspend:");
}

id objc_msgSend_taskState(void *a1, const char *a2, ...)
{
  return _[a1 taskState];
}

id objc_msgSend_taskTransferredData_countOfBytesReceived_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "taskTransferredData:countOfBytesReceived:");
}

id objc_msgSend_taskWillResume(void *a1, const char *a2, ...)
{
  return _[a1 taskWillResume];
}

id objc_msgSend_taskWillSuspend(void *a1, const char *a2, ...)
{
  return _[a1 taskWillSuspend];
}

id objc_msgSend_taskWithIdentifier_didCompleteWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "taskWithIdentifier:didCompleteWithError:");
}

id objc_msgSend_tasksArchivePath(void *a1, const char *a2, ...)
{
  return _[a1 tasksArchivePath];
}

id objc_msgSend_temporaryDestinationURL(void *a1, const char *a2, ...)
{
  return _[a1 temporaryDestinationURL];
}

id objc_msgSend_terminateExtractorWithError_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "terminateExtractorWithError:completion:");
}

id objc_msgSend_terminateStreamWithError_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "terminateStreamWithError:completionBlock:");
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeoutIntervalForRequest(void *a1, const char *a2, ...)
{
  return _[a1 timeoutIntervalForRequest];
}

id objc_msgSend_timeoutIntervalForResource(void *a1, const char *a2, ...)
{
  return _[a1 timeoutIntervalForResource];
}

id objc_msgSend_trustPassesExtendedValidation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trustPassesExtendedValidation:");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_unarchivedDictionaryWithKeysOfClass_objectsOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedDictionaryWithKeysOfClass:objectsOfClass:fromData:error:");
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unionSet:");
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 uniqueIdentifier];
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

id objc_msgSend_updateConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateConfiguration:");
}

id objc_msgSend_updateCurrentRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCurrentRequest:");
}

id objc_msgSend_updateOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateOptions:");
}

id objc_msgSend_updatePriorityForTaskID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePriorityForTaskID:");
}

id objc_msgSend_updateStreamingZipModificationDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateStreamingZipModificationDate:");
}

id objc_msgSend_updateTaskInfoBasedOnCurrentDiscretionaryStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateTaskInfoBasedOnCurrentDiscretionaryStatus:");
}

id objc_msgSend_uploadTaskWithRequest_fromFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uploadTaskWithRequest:fromFile:");
}

id objc_msgSend_uploadTaskWithStreamedRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uploadTaskWithStreamedRequest:");
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return _[a1 uppercaseString];
}

id objc_msgSend_user(void *a1, const char *a2, ...)
{
  return _[a1 user];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_usesContainerManagerForAVAsset(void *a1, const char *a2, ...)
{
  return _[a1 usesContainerManagerForAVAsset];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return _[a1 uuid];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_valueWithBytes_objCType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithBytes:objCType:");
}

id objc_msgSend_valueWithCMTimeRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithCMTimeRange:");
}

id objc_msgSend_waitUntilDeviceIsUnlocked(void *a1, const char *a2, ...)
{
  return _[a1 waitUntilDeviceIsUnlocked];
}

id objc_msgSend_wakeForSessionIdentifier_withSessionUUID_wakeRequirement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wakeForSessionIdentifier:withSessionUUID:wakeRequirement:");
}

id objc_msgSend_wakeUpApp_forSession_withSessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wakeUpApp:forSession:withSessionUUID:");
}

id objc_msgSend_wakeUpClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wakeUpClient:");
}

id objc_msgSend_willRetryBackgroundDataTask_withError_transactionMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willRetryBackgroundDataTask:withError:transactionMetrics:");
}

id objc_msgSend_wrapperTransferredData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wrapperTransferredData:");
}

id objc_msgSend_wrapperWillSuspend(void *a1, const char *a2, ...)
{
  return _[a1 wrapperWillSuspend];
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToFile:atomically:");
}