uint64_t start()
{
  CFRunLoopRef Current;
  uint64_t i;
  int v2;
  dispatch_source_s *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  _opaque_pthread_t *v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t v20[8];
  void v21[5];
  int out_token;
  int __relative_priority[2];
  void handler[6];
  uint8_t buf[8];
  uint8_t *v26;
  uint64_t v27;
  char v28;
  +[NSError _setFileNameLocalizationEnabled:](&OBJC_CLASS___NSError, "_setFileNameLocalizationEnabled:", 0LL);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "cameracaptured is launching...",  buf,  2u);
  }

  Current = CFRunLoopGetCurrent();
  *(void *)buf = 0LL;
  v26 = buf;
  v27 = 0x2020000000LL;
  v28 = 0;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100003538;
  handler[3] = &unk_100004170;
  handler[4] = buf;
  handler[5] = Current;
  _set_user_dir_suffix("com.apple.cameracaptured");
  for (i = 0LL; i != 3; ++i)
  {
    v2 = dword_1000037F8[i];
    signal(v2, (void (__cdecl *)(int))1);
    v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, v2, 0LL, &_dispatch_main_q);
    qword_100008008[i] = v3;
    dispatch_source_set_event_handler(v3, handler);
    dispatch_activate(qword_100008008[i]);
  }

  if (_os_feature_enabled_impl("CameraCapture", "cameracaptured"))
  {
    v4 = FigCommonMediaProcessInitialization(7LL, 0LL);
    FigSandboxRegistrationServerStart(v4);
    v5 = setiopolicy_np(9, 0, 1);
    v6 = pthread_set_fixedpriority_self(v5);
    *(void *)__relative_priority = 0LL;
    v7 = pthread_self();
    if (pthread_get_qos_class_np(v7, (qos_class_t *)&__relative_priority[1], __relative_priority)) {
      v8 = 0;
    }
    else {
      v8 = pthread_set_qos_class_self_np(QOS_CLASS_USER_INITIATED, 0) == 0;
    }
    v9 = getpid();
    proc_disable_wakemon(v9);
    v10 = getpid();
    proc_disable_cpumon(v10);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10000355C;
    v21[3] = &unk_100004198;
    v21[4] = handler;
    notify_register_dispatch("AppleLanguagePreferencesChangedNotification", &out_token, &_dispatch_main_q, v21);
    if (gGMFigKTraceEnabled == 1) {
      kdebug_trace(538247193LL, 0LL, 0LL, 0LL, 0LL);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "cameracaptured servers starting",  v20,  2u);
    }

    v11 = objc_autoreleasePoolPush();
    v12 = FigCapturePreloadShaders();
    v13 = FigCaptureSourceServerStart(v12);
    v14 = FigCameraViewfinderServerStart(v13);
    v15 = FigCaptureSessionServerStart(v14);
    v16 = FigFlashlightServerStart(v15);
    v17 = FigCaptureDeferredContainerManagerServerStart(v16);
    FigCaptureTempFileManagerStart(v17);
    objc_autoreleasePoolPop(v11);
    v18 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)v18)
    {
      *(_WORD *)v20 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "cameracaptured servers have finished starting",  v20,  2u);
    }

    if (gGMFigKTraceEnabled == 1) {
      v18 = kdebug_trace(538247194LL, 0LL, 0LL, 0LL, 0LL);
    }
    if (v8) {
      v18 = pthread_set_qos_class_self_np((qos_class_t)__relative_priority[1], __relative_priority[0]);
    }
    if (!v6) {
      pthread_set_timeshare_self(v18);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "cameracaptured has finished launching",  v20,  2u);
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000035CC();
  }

  while (!v26[24])
    CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0e10, 0);
  _Block_object_dispose(buf, 8);
  return 0LL;
}

void sub_10000350C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

void sub_100003538(uint64_t a1)
{
  v2 = *(__CFRunLoop **)(a1 + 40);
  if (v2)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
    CFRunLoopStop(v2);
  }
}

uint64_t sub_10000355C(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "User's preferred language has changed.  Exiting...",  v3,  2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1000035CC()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "cameracaptured is not enabled.  Running idle in the background.",  v0,  2u);
}

id objc_msgSend__setFileNameLocalizationEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setFileNameLocalizationEnabled:");
}