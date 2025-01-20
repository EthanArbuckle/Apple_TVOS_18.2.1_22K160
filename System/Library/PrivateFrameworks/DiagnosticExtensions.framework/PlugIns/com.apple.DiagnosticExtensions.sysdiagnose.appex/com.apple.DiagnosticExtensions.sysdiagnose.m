id sub_1000013AC(void *a1)
{
  id v1;
  dispatch_queue_global_t global_queue;
  dispatch_queue_s *v3;
  _xpc_connection_s *mach_service;
  xpc_object_t v5;
  void *v6;
  id v7;
  uint8_t v9[16];
  v1 = a1;
  global_queue = dispatch_get_global_queue(33LL, 0LL);
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  mach_service = xpc_connection_create_mach_service("com.apple.sysdiagnose.service.xpc", v3, 2uLL);
  xpc_connection_set_event_handler(mach_service, &stru_100004318);
  xpc_connection_resume(mach_service);
  if (mach_service)
  {
    v5 = xpc_connection_send_message_with_reply_sync(mach_service, v1);
    v6 = v5;
    if (v5
      && xpc_get_type(v5) == (xpc_type_t)&_xpc_type_dictionary
      && xpc_dictionary_get_uint64(v6, "RESPONSE_TYPE") == 1)
    {
      v7 = v6;
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Couldn't get valid reply from sysdiagnose server",  v9,  2u);
      }

      v7 = 0LL;
    }
  }

  else
  {
    v7 = 0LL;
  }

  return v7;
}

void sub_1000018B4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_1000018D8(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    if (qword_1000082B8 != -1) {
      dispatch_once(&qword_1000082B8, &stru_100004358);
    }
    if (byte_1000082B0)
    {
      v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "substringFromIndex:", objc_msgSend(v1, "rangeOfString:", @"/Library/Logs")));
      if ([v1 rangeOfString:@"/private/var/mobile"] != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v3 = objc_claimAutoreleasedReturnValue( [v2 stringByReplacingOccurrencesOfString:@"CrashReporter" withString:@"DiagnosticReports"]);

        v2 = (void *)v3;
      }

      if (qword_1000082C8 != -1) {
        dispatch_once(&qword_1000082C8, &stru_100004378);
      }
      id v4 = (id)qword_1000082C0;
      id v5 = (id)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:v2]);
    }

    else
    {
      id v5 = v1;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412546;
      id v8 = v1;
      __int16 v9 = 2112;
      id v10 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "File %@ realpath %@",  (uint8_t *)&v7,  0x16u);
    }
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

uint64_t sub_100001A98(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100001AA8(uint64_t a1)
{
}

void sub_100001AB0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Remote Path: %@",  (uint8_t *)&v6,  0xCu);
  }

  id v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[DEAttachmentItem attachmentWithPath:](&OBJC_CLASS___DEAttachmentItem, "attachmentWithPath:", v3));
  [v4 addObject:v5];
}

void sub_100002204(uint64_t a1, void *a2, unsigned __int8 *a3)
{
  if (a1 && a2)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([a2 objectForKey:a1]);
    if (v4)
    {
      id v8 = v4;
      uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber);
      char isKindOfClass = objc_opt_isKindOfClass(v8, v5);
      id v4 = v8;
      if (a3)
      {
        if ((isKindOfClass & 1) != 0)
        {
          unsigned __int8 v7 = [v8 BOOLValue];
          id v4 = v8;
          *a3 = v7;
        }
      }
    }
  }
}

void sub_100002628(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    id v10 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Reporting progress to DE. Received progressDict: %@",  (uint8_t *)&v9,  0xCu);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:sdProgressPercent]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:sdProgressDiagnosticId]);
  if (v4)
  {
    [v4 doubleValue];
    id v7 = [[DECollectionProgress alloc] initWithPercentComplete:v6];
    id v8 = v7;
    if (v5) {
      [v7 setStatusString:v5];
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100002B18();
  }
}

void sub_1000027F8(id a1, OS_xpc_object *a2)
{
  if (xpc_get_type(a2) == (xpc_type_t)&_xpc_type_error
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136315138;
    id v3 = "com.apple.sysdiagnose.service.xpc";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "XPC connection to %s failed",  (uint8_t *)&v2,  0xCu);
  }

void sub_1000028A8(id a1)
{
  byte_1000082B0 = OSAInMultiUserMode(a1);
}

void sub_1000028C4(id a1)
{
  if (qword_1000082B8 != -1) {
    dispatch_once(&qword_1000082B8, &stru_100004358);
  }
  if (byte_1000082B0)
  {
    uint64_t v8 = 1LL;
    uint64_t v1 = container_system_group_path_for_identifier(0LL, "systemgroup.com.apple.osanalytics", &v8);
    if (v1)
    {
      int v2 = (void *)v1;
      id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:",  v1,  1LL,  0LL));
      uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 path]);
      uint64_t v5 = (void *)qword_1000082C0;
      qword_1000082C0 = v4;

      free(v2);
    }

    else
    {
      id v7 = (void *)qword_1000082C0;
      qword_1000082C0 = (uint64_t)@"/private/var/mobile/";

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v10 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Error finding path %llu",  buf,  0xCu);
      }
    }
  }

  else
  {
    double v6 = (void *)qword_1000082C0;
    qword_1000082C0 = (uint64_t)@"/private/var/mobile/";
  }

BOOL sub_100002A54(id a1, NSURL *a2, NSError *a3)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSError localizedDescription](a3, "localizedDescription"));
    int v7 = 138412546;
    uint64_t v8 = a2;
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "DE Enumeration error for url: %@: %@\n",  (uint8_t *)&v7,  0x16u);
  }

  return 1;
}

void sub_100002B18()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Received malformed progressDict — no progress percent found. Not reporting to DE",  v0,  2u);
}

id objc_msgSend_tryReusingSysdiagnoseForParameters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tryReusingSysdiagnoseForParameters:");
}