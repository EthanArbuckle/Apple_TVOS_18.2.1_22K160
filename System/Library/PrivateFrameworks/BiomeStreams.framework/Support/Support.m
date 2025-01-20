void start()
{
  void *v0;
  uint64_t v1;
  void *v2;
  int v3;
  const char *v4;
  uint64_t v5;
  int v6;
  char *v7;
  uint64_t v8;
  int v9;
  void *v10;
  uint64_t v11;
  os_log_s *v12;
  dispatch_workloop_t inactive;
  void *v14;
  dispatch_workloop_t v15;
  void *v16;
  int v17;
  int v18;
  uint8_t buf[1032];
  v0 = objc_autoreleasePoolPush();
  bzero(buf, 0x400uLL);
  if ((_set_user_dir_suffix("com.apple.biomed") & 1) != 0)
  {
    if (confstr(65537, (char *)buf, 0x400uLL))
    {
      v7 = realpath_DARWIN_EXTSN((const char *)buf, 0LL);
      if (v7)
      {
        free(v7);
        +[NSError _setFileNameLocalizationEnabled:](&OBJC_CLASS___NSError, "_setFileNameLocalizationEnabled:", 0LL);
        v10 = (void *)os_transaction_create("biomed main");
        v11 = __biome_log_for_category(0LL);
        v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Launching biomed...", buf, 2u);
        }

        +[BMDaemonLibraryLoader loadRootLibrary](&OBJC_CLASS____TtC6biomed21BMDaemonLibraryLoader, "loadRootLibrary");
        +[BMDaemon runLaunchTasks](&OBJC_CLASS___BMDaemon, "runLaunchTasks");
        inactive = dispatch_workloop_create_inactive("com.apple.biome.access-workloop");
        v14 = (void *)qword_1000081A0;
        qword_1000081A0 = (uint64_t)inactive;

        dispatch_set_qos_class_fallback(qword_1000081A0, 9LL);
        dispatch_activate((dispatch_object_t)qword_1000081A0);
        dispatch_async_and_wait((dispatch_queue_t)qword_1000081A0, &stru_1000041A0);
        v15 = dispatch_workloop_create_inactive("com.apple.biomed.compute-workloop");
        v16 = (void *)qword_1000081B0;
        qword_1000081B0 = (uint64_t)v15;

        dispatch_set_qos_class_fallback(qword_1000081B0, 9LL);
        dispatch_activate((dispatch_object_t)qword_1000081B0);
        dispatch_async_and_wait((dispatch_queue_t)qword_1000081B0, &stru_1000041C0);
        [(id)qword_1000081B8 setUpNotificationHandler];
        +[BMDaemon registerXPCActivities](&OBJC_CLASS___BMDaemon, "registerXPCActivities");
        +[CCDaemon resetRootDirectoryIfNecessary](&OBJC_CLASS___CCDaemon, "resetRootDirectoryIfNecessary");
        +[CCDaemon registerXPCActivities](&OBJC_CLASS___CCDaemon, "registerXPCActivities");

        objc_autoreleasePoolPop(v0);
        dispatch_main();
      }

      v8 = __biome_log_for_category(0LL);
      v2 = (void *)objc_claimAutoreleasedReturnValue(v8);
      if (!os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_ERROR))
      {
LABEL_8:

        exit(1);
      }

      v9 = *__error();
      v17 = 67109120;
      v18 = v9;
      v4 = "failed to resolve temporary directory: %{darwin.errno}d";
    }

    else
    {
      v1 = __biome_log_for_category(0LL);
      v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
      if (!os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_ERROR)) {
        goto LABEL_8;
      }
      v3 = *__error();
      v17 = 67109120;
      v18 = v3;
      v4 = "failed to initialize temporary directory: %{darwin.errno}d";
    }
  }

  else
  {
    v5 = __biome_log_for_category(0LL);
    v2 = (void *)objc_claimAutoreleasedReturnValue(v5);
    if (!os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    v6 = *__error();
    v17 = 67109120;
    v18 = v6;
    v4 = "failed to set user dir suffix: %{darwin.errno}d";
  }

  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v2, OS_LOG_TYPE_ERROR, v4, (uint8_t *)&v17, 8u);
  goto LABEL_8;
}

void sub_1000030F4(id a1)
{
  uint64_t v1 = __biome_log_for_category(6LL);
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Launching access service...", v11, 2u);
  }

  id v3 = objc_alloc(&OBJC_CLASS___BMAccessDelegate);
  v12[0] = &off_100004278;
  v4 = (void *)objc_opt_new(&OBJC_CLASS___BMDatabasesAccessDaemonDelegate);
  v12[1] = &off_100004290;
  v13[0] = v4;
  v5 = (void *)objc_opt_new(&OBJC_CLASS___CCSetsAccessDaemonDelegate);
  v13[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  2LL));
  id v7 = [v3 initWithDelegates:v6];

  id v8 = objc_alloc(&OBJC_CLASS___BMAccessDaemon);
  id v9 = [v8 initWithQueue:qword_1000081A0 delegate:v7];
  v10 = (void *)qword_1000081A8;
  qword_1000081A8 = (uint64_t)v9;
}

void sub_100003248(id a1)
{
  uint64_t v1 = __biome_log_for_category(8LL);
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Launching compute services...", v10, 2u);
  }

  +[BMDaemon donateLaunchEventsWithQueue:](&OBJC_CLASS___BMDaemon, "donateLaunchEventsWithQueue:", qword_1000081B0);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[GDComputeOrchestration start](&OBJC_CLASS___GDComputeOrchestration, "start"));
  id v4 = objc_alloc(&OBJC_CLASS___BMDaemon);
  id v5 = [v4 initWithQueue:qword_1000081B0 eventReporter:v3];
  v6 = (void *)qword_1000081B8;
  qword_1000081B8 = (uint64_t)v5;

  id v7 = objc_alloc(&OBJC_CLASS___CCDaemon);
  id v8 = [v7 initWithQueue:qword_1000081B0];
  id v9 = (void *)qword_1000081C0;
  qword_1000081C0 = (uint64_t)v8;
}

uint64_t static BMDaemonLibraryLoader.loadRootLibrary()()
{
  uint64_t v0 = type metadata accessor for Library(0LL);
  unint64_t v1 = sub_10000335C();
  return static UnifiedLibrary.add(library:)(v0, v1);
}

unint64_t sub_10000335C()
{
  unint64_t result = qword_100008170;
  if (!qword_100008170)
  {
    uint64_t v1 = type metadata accessor for Library(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Library, v1);
    atomic_store(result, (unint64_t *)&qword_100008170);
  }

  return result;
}

id BMDaemonLibraryLoader.__allocating_init()()
{
  return [objc_allocWithZone(v0) init];
}

id BMDaemonLibraryLoader.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BMDaemonLibraryLoader();
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t type metadata accessor for BMDaemonLibraryLoader()
{
  return objc_opt_self(&OBJC_CLASS____TtC6biomed21BMDaemonLibraryLoader);
}

id BMDaemonLibraryLoader.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BMDaemonLibraryLoader();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id objc_msgSend__setFileNameLocalizationEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setFileNameLocalizationEnabled:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_donateLaunchEventsWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "donateLaunchEventsWithQueue:");
}

id objc_msgSend_initWithDelegates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegates:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:");
}

id objc_msgSend_initWithQueue_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:delegate:");
}

id objc_msgSend_initWithQueue_eventReporter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:eventReporter:");
}

id objc_msgSend_loadRootLibrary(void *a1, const char *a2, ...)
{
  return _[a1 loadRootLibrary];
}

id objc_msgSend_registerXPCActivities(void *a1, const char *a2, ...)
{
  return _[a1 registerXPCActivities];
}

id objc_msgSend_resetRootDirectoryIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 resetRootDirectoryIfNecessary];
}

id objc_msgSend_runLaunchTasks(void *a1, const char *a2, ...)
{
  return _[a1 runLaunchTasks];
}

id objc_msgSend_setUpNotificationHandler(void *a1, const char *a2, ...)
{
  return _[a1 setUpNotificationHandler];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}