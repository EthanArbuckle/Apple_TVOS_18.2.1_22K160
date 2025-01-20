uint64_t SGM2PerfSuggestdLaunchedReadFrom(uint64_t a1, uint64_t a2)
{
  char v4;
  unsigned int v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  int v10;
  uint64_t String;
  uint64_t v13;
  void *v14;
  uint64_t result;
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    v4 = 0;
    v5 = 0;
    v6 = 0LL;
    while (1)
    {
      v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1LL || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      v8 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      if (v5++ >= 9)
      {
        v6 = 0LL;
        v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }

    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      v6 = 0LL;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 1)
    {
      String = PBReaderReadString(a2);
      v13 = objc_claimAutoreleasedReturnValue(String);
      v14 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v13;
    }

    else
    {
      result = PBReaderSkipValueWithTag(a2);
      if (!(_DWORD)result) {
        return result;
      }
    }
  }

  return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}
}

int main(int argc, const char **argv, const char **envp)
{
  v3 = objc_autoreleasePoolPush();
  uint64_t v4 = ii_default_log_handle(v3);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Starting suggestd", buf, 2u);
  }

  v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, 0LL);
  dispatch_source_set_event_handler(v6, &stru_1000042D0);
  dispatch_resume(v6);
  v36.rlim_cur = 0LL;
  v36.rlim_max = 0LL;
  uint64_t v7 = getrlimit(8, &v36);
  if ((_DWORD)v7)
  {
    uint64_t v8 = ii_default_log_handle(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if (!os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
    {
LABEL_7:

      goto LABEL_12;
    }

    int v10 = *__error();
    v11 = __error();
    v12 = strerror(*v11);
    *(_DWORD *)buf = 67109378;
    int v39 = v10;
    __int16 v40 = 2080;
    v41 = v12;
    v13 = "Unable to getrlimit: [%i] %s";
LABEL_6:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v9, OS_LOG_TYPE_DEFAULT, v13, buf, 0x12u);
    goto LABEL_7;
  }

  if (v36.rlim_cur <= 0x4FF)
  {
    v36.rlim_cur = 1280LL;
    uint64_t v14 = setrlimit(8, &v36);
    if ((_DWORD)v14)
    {
      uint64_t v15 = ii_default_log_handle(v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v15);
      if (!os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_7;
      }
      int v16 = *__error();
      v17 = __error();
      v18 = strerror(*v17);
      *(_DWORD *)buf = 67109378;
      int v39 = v16;
      __int16 v40 = 2080;
      v41 = v18;
      v13 = "Unable to setrlimit: [%i] %s";
      goto LABEL_6;
    }
  }

LABEL_12:
  zone = malloc_create_zone(0LL, 0);
  malloc_set_zone_name(zone, "ICU");
  int v37 = 0;
  uint64_t v20 = u_setMemoryFunctions(zone, &malloc_zone_malloc, &malloc_zone_realloc, &malloc_zone_free, &v37);
  if (v37)
  {
    uint64_t v21 = ii_default_log_handle(v20);
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v39 = v37;
      _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "Could not set up ICU malloc zone; err = %i",
        buf,
        8u);
    }
  }

  v23 = (void *)objc_opt_new(&OBJC_CLASS____PASProbablisticCrashesConfig);
  +[_PASCrashHelper optInCurrentProcessForLogFaultProbabalisticCrashesWithConfig:]( &OBJC_CLASS____PASCrashHelper,  "optInCurrentProcessForLogFaultProbabalisticCrashesWithConfig:",  v23);

  +[CLLocationManager sg_swizzle](&OBJC_CLASS___CLLocationManager, "sg_swizzle");
  Class v24 = NSClassFromString(@"SGSuggestionsSystem");
  if (v24 && (v25 = v24, Class v24 = (Class)objc_opt_respondsToSelector(v24, "start"), (v24 & 1) != 0))
  {
    [v25 performSelector:"start"];
  }

  else
  {
    uint64_t v26 = ii_default_log_handle(v24);
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "SGSuggestionsSystem could not be found, CoreSuggestionsInternals likely does not exist on this type of device.",  buf,  2u);
    }
  }

  SGDServerRun();
  v28 = objc_opt_new(&OBJC_CLASS___SGM2PerfSuggestdLaunched);
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[PETEventTracker2 sharedInstance](&OBJC_CLASS___PETEventTracker2, "sharedInstance"));
  [v29 trackScalarForMessage:v28];

  v30 = objc_alloc(&OBJC_CLASS___NSString);
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[SGM2PerfSuggestdLaunched key](v28, "key"));
  v32 = -[NSString initWithFormat:](v30, "initWithFormat:", @"%@.%@", @"com.apple.Proactive.suggestd", v31);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[SGM2PerfSuggestdLaunched dictionaryRepresentation](v28, "dictionaryRepresentation"));
  AnalyticsSendEvent(v32, v33);

  objc_autoreleasePoolPop(v3);
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  [v34 run];

  return 0;
}

void sub_1000026B8(id a1)
{
  uint64_t v1 = ii_default_log_handle(a1);
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Received SIGTERM; exiting", v3, 2u);
  }

  exit(0);
}

void SGDServerRun()
{
  if (qword_100008328 != -1) {
    dispatch_once(&qword_100008328, &stru_100004310);
  }
}

void sub_100002758(id a1)
{
  uint64_t v1 = ii_default_log_handle(a1);
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    LOWORD(v8[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Starting suggestd...", (uint8_t *)v8, 2u);
  }

  xpc_set_event_stream_handler("com.apple.notifyd.matching", &_dispatch_main_q, &stru_100004350);
  xpc_set_event_stream_handler("com.apple.distnoted.matching", &_dispatch_main_q, &stru_100004370);

  uint64_t v9 = 0LL;
  int v10 = &v9;
  uint64_t v11 = 0x2050000000LL;
  v3 = (void *)qword_100008330;
  uint64_t v12 = qword_100008330;
  if (!qword_100008330)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100002908;
    v8[3] = &unk_100004398;
    v8[4] = &v9;
    sub_100002908((uint64_t)v8);
    v3 = (void *)v10[3];
  }

  id v4 = v3;
  _Block_object_dispose(&v9, 8);
  [v4 start];
  +[PPXPCServer registerXPCListeners](&OBJC_CLASS___PPXPCServer, "registerXPCListeners");
  uint64_t v5 = _os_feature_enabled_impl("ProactiveHarvesting", "BiomeHarvesting");
  if ((_DWORD)v5)
  {
    uint64_t v6 = ii_default_log_handle(v5);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v8[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "ProactiveHarvesting enabled, starting system.",  (uint8_t *)v8,  2u);
    }
  }

  +[PPPortraitSystem start](&OBJC_CLASS___PPPortraitSystem, "start");
}

void sub_1000028F0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

Class sub_100002908(uint64_t a1)
{
  if (!qword_100008338)
  {
    __int128 v3 = off_1000043B8;
    uint64_t v4 = 0LL;
    qword_100008338 = _sl_dlopen(&v3, 0LL);
  }

  Class result = objc_getClass("PSUSummarizationXPCServer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  qword_100008330 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

void sub_1000029BC(id a1, OS_xpc_object *a2)
{
  v2 = a2;
  string = xpc_dictionary_get_string(v2, _xpc_event_key_name);
  if (string)
  {
    uint64_t v4 = string;
    uint64_t v5 = objc_autoreleasePoolPush();
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v4));
    objc_autoreleasePoolPop(v5);
    uint64_t v8 = ii_default_log_handle(v7);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      uint64_t v15 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "launch event: distnoted: %@",  (uint8_t *)&v14,  0xCu);
    }

    if (v6)
    {
      +[PPEventStreamHandler prepareToHandleNotificationWithName:]( &OBJC_CLASS___PPEventStreamHandler,  "prepareToHandleNotificationWithName:",  v6);
      xpc_object_t value = xpc_dictionary_get_value(v2, "UserInfo");
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(value);
      uint64_t v12 = (void *)_CFXPCCreateCFObjectFromXPCObject();
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v13 postNotificationName:v6 object:0 userInfo:v12];
    }
  }
}

void sub_100002B1C(id a1, OS_xpc_object *a2)
{
  v2 = a2;
  string = xpc_dictionary_get_string(v2, _xpc_event_key_name);
  if (string)
  {
    uint64_t v4 = string;
    uint64_t v5 = objc_autoreleasePoolPush();
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v4));
    objc_autoreleasePoolPop(v5);
    uint64_t v8 = ii_default_log_handle(v7);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      uint64_t v12 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "launch event: notifyd: %@",  (uint8_t *)&v11,  0xCu);
    }

    if (v6)
    {
      +[PPEventStreamHandler prepareToHandleNotificationWithName:]( &OBJC_CLASS___PPEventStreamHandler,  "prepareToHandleNotificationWithName:",  v6);
      int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v10 postNotificationName:v6 object:0 userInfo:0];
    }
  }
}

id objc_msgSend_trackScalarForMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trackScalarForMessage:");
}