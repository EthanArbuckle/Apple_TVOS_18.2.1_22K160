void CleanPidSet(void *a1)
{
  id v1;
  dispatch_queue_s *v2;
  id v3;
  void block[4];
  id v5;
  v1 = a1;
  v2 = (dispatch_queue_s *)qword_45D0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1ACC;
  block[3] = &unk_4268;
  v5 = v1;
  v3 = v1;
  dispatch_async(v2, block);
}

void sub_1ACC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) copy];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1B48;
  v3[3] = &unk_4240;
  id v4 = *(id *)(a1 + 32);
  [v2 enumerateObjectsUsingBlock:v3];
}

void sub_1B48(uint64_t a1, void *a2)
{
  id v3 = a2;
}

void CleanupPidSets()
{
}

void HandleJetsamEvent()
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_1CE0;
  v11 = sub_1CF0;
  id v12 = 0LL;
  uint64_t v1 = 0LL;
  id v2 = &v1;
  uint64_t v3 = 0x3032000000LL;
  id v4 = sub_1CE0;
  v5 = sub_1CF0;
  id v6 = 0LL;
  v0[0] = _NSConcreteStackBlock;
  v0[1] = 3221225472LL;
  v0[2] = sub_1CF8;
  v0[3] = &unk_4290;
  v0[4] = &v7;
  v0[5] = &v1;
  dispatch_sync((dispatch_queue_t)qword_45D0, v0);
  WriteJetsamMemoryReport(v2[5], v8[5]);
  CleanPidSet((void *)qword_45D8);
  CleanPidSet((void *)qword_45E0);
  _Block_object_dispose(&v1, 8);

  _Block_object_dispose(&v7, 8);
}

void sub_1CBC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_1CE0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1CF0(uint64_t a1)
{
}

void sub_1CF8(uint64_t a1)
{
  id v2 = [(id)qword_45D8 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = [(id)qword_45E0 copy];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void MonitorAssertions()
{
  if (qword_45E8 != -1) {
    dispatch_once(&qword_45E8, &stru_42D0);
  }
}

void sub_1D78(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_BACKGROUND, 0);
  v14 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.MemoryMonitor.RBMonitor", v14);
  uint64_t v3 = (void *)qword_45D0;
  qword_45D0 = (uint64_t)v2;

  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v5 = (void *)qword_45D8;
  qword_45D8 = (uint64_t)v4;

  uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  uint64_t v7 = (void *)qword_45E0;
  qword_45E0 = (uint64_t)v6;

  os_log_t v8 = os_log_create("com.apple.MemoryMonitor", "RBMonitor");
  uint64_t v9 = -[NSSet initWithObjects:](objc_alloc(&OBJC_CLASS___NSSet), "initWithObjects:", &off_45A0, &off_45B8, 0LL);
  v10 = objc_alloc_init(&OBJC_CLASS___NSSet);
  v11 = -[NSSet initWithObjects:]( objc_alloc(&OBJC_CLASS___NSSet),  "initWithObjects:",  @"com.apple.frontboard.visibility",  0LL);
  if (objc_opt_class(&OBJC_CLASS___RBSProcessMonitor))
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1F30;
    v15[3] = &unk_4398;
    v16 = v11;
    v17 = v8;
    v18 = v9;
    v19 = v10;
    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[RBSProcessMonitor monitorWithConfiguration:]( &OBJC_CLASS___RBSProcessMonitor,  "monitorWithConfiguration:",  v15));
    v13 = (void *)qword_45F0;
    qword_45F0 = v12;
  }
}

void sub_1F30(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(NSClassFromString(&cfstr_Rbsprocessever.isa));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessPredicate predicateMatching:](&OBJC_CLASS___RBSProcessPredicate, "predicateMatching:", v4));

  id v6 = objc_alloc_init(&OBJC_CLASS___RBSProcessStateDescriptor);
  [v6 setValues:24];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a1[4] allObjects]);
  [v6 setEndowmentNamespaces:v7];

  v14 = v5;
  os_log_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
  [v3 setPredicates:v8];

  [v3 setStateDescriptor:v6];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_20D4;
  v9[3] = &unk_4370;
  id v10 = a1[5];
  id v11 = a1[4];
  id v12 = a1[6];
  id v13 = a1[7];
  [v3 setUpdateHandler:v9];
}

void sub_20D4(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v36[0] = 0LL;
  v36[1] = v36;
  v36[2] = 0x2020000000LL;
  char v37 = 0;
  v34[0] = 0LL;
  v34[1] = v34;
  v34[2] = 0x2020000000LL;
  char v35 = 0;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 state]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 endowmentNamespaces]);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_234C;
  v29[3] = &unk_42F8;
  id v30 = a1[4];
  id v12 = v8;
  id v31 = v12;
  id v32 = a1[5];
  v33 = v34;
  [v11 enumerateObjectsUsingBlock:v29];

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 state]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 assertions]);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_247C;
  v23[3] = &unk_4320;
  id v24 = a1[4];
  id v15 = v12;
  id v25 = v15;
  id v26 = a1[6];
  v28 = v36;
  id v27 = a1[7];
  [v14 enumerateObjectsUsingBlock:v23];

  v16 = (dispatch_queue_s *)qword_45D0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_2738;
  block[3] = &unk_4348;
  v21 = v34;
  id v19 = a1[4];
  id v20 = v15;
  v22 = v36;
  id v17 = v15;
  dispatch_async(v16, block);

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);
}

void sub_2328(_Unwind_Exception *a1)
{
}

void sub_234C(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = *(void **)(a1 + 40);
    id v8 = v6;
    id v9 = objc_claimAutoreleasedReturnValue([v7 name]);
    id v10 = [v9 UTF8String];
    unsigned int v11 = [*(id *)(a1 + 40) pid];
    int v12 = 136315650;
    id v13 = v10;
    __int16 v14 = 1024;
    unsigned int v15 = v11;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_debug_impl(&dword_0, v8, OS_LOG_TYPE_DEBUG, "%s (%d) has endowment: %@", (uint8_t *)&v12, 0x1Cu);
  }

  if ([*(id *)(a1 + 48) containsObject:v5])
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
    *a3 = 1;
  }
}

void sub_247C(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5 = a2;
  unsigned int v6 = [v5 type];
  id v7 = *(os_log_s **)(a1 + 32);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6 == 3)
  {
    if (v8)
    {
      id v13 = *(void **)(a1 + 40);
      __int16 v14 = v7;
      id v15 = objc_claimAutoreleasedReturnValue([v13 name]);
      id v16 = [v15 UTF8String];
      unsigned int v17 = [*(id *)(a1 + 40) pid];
      v18 = (void *)objc_claimAutoreleasedReturnValue([v5 description]);
      int v25 = 136315906;
      id v26 = v16;
      __int16 v27 = 1024;
      unsigned int v28 = v17;
      __int16 v29 = 2112;
      id v30 = v18;
      __int16 v31 = 2048;
      id v32 = [v5 reason];
      _os_log_debug_impl( &dword_0,  v14,  OS_LOG_TYPE_DEBUG,  "%s (%d) took legacy assertion: %@ (%llu)",  (uint8_t *)&v25,  0x26u);
    }

    id v9 = *(void **)(a1 + 48);
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v5 reason]));
    LOBYTE(v9) = [v9 containsObject:v10];

LABEL_9:
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 1;
    *a3 = 1;
    goto LABEL_10;
  }

  if (v8)
  {
    id v19 = *(void **)(a1 + 40);
    id v20 = v7;
    id v21 = objc_claimAutoreleasedReturnValue([v19 name]);
    id v22 = [v21 UTF8String];
    unsigned int v23 = [*(id *)(a1 + 40) pid];
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v5 description]);
    int v25 = 136316162;
    id v26 = v22;
    __int16 v27 = 1024;
    unsigned int v28 = v23;
    __int16 v29 = 2112;
    id v30 = v24;
    __int16 v31 = 2048;
    id v32 = [v5 reason];
    __int16 v33 = 1024;
    unsigned int v34 = [v5 type];
    _os_log_debug_impl( &dword_0,  v20,  OS_LOG_TYPE_DEBUG,  "%s (%d) took other assertion: %@ (%llu) (%u)",  (uint8_t *)&v25,  0x2Cu);
  }

  unsigned int v11 = *(void **)(a1 + 56);
  int v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v5 reason]));
  LODWORD(v11) = [v11 containsObject:v12];

  if ((_DWORD)v11) {
    goto LABEL_9;
  }
LABEL_10:
}

void sub_2738(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
  id v3 = *(os_log_s **)(a1 + 32);
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4)
    {
      int v12 = *(void **)(a1 + 40);
      id v13 = v3;
      id v14 = objc_claimAutoreleasedReturnValue([v12 name]);
      id v15 = [v14 UTF8String];
      unsigned int v16 = [*(id *)(a1 + 40) pid];
      int v27 = 136315394;
      id v28 = v15;
      __int16 v29 = 1024;
      unsigned int v30 = v16;
      _os_log_debug_impl(&dword_0, v13, OS_LOG_TYPE_DEBUG, "%s (%d) is visibile", (uint8_t *)&v27, 0x12u);
    }

    id v5 = (void *)qword_45E0;
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [*(id *)(a1 + 40) pid]));
    [v5 addObject:v6];
  }

  else
  {
    if (v4)
    {
      id v22 = *(void **)(a1 + 40);
      unsigned int v23 = v3;
      id v24 = objc_claimAutoreleasedReturnValue([v22 name]);
      id v25 = [v24 UTF8String];
      unsigned int v26 = [*(id *)(a1 + 40) pid];
      int v27 = 136315394;
      id v28 = v25;
      __int16 v29 = 1024;
      unsigned int v30 = v26;
      _os_log_debug_impl(&dword_0, v23, OS_LOG_TYPE_DEBUG, "%s (%d) is not visibile", (uint8_t *)&v27, 0x12u);
    }

    id v7 = (void *)qword_45E0;
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [*(id *)(a1 + 40) pid]));
    [v7 removeObject:v6];
  }

  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL))
  {
    BOOL v8 = *(void **)(a1 + 32);
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v17 = *(void **)(a1 + 40);
      v18 = v8;
      id v19 = objc_claimAutoreleasedReturnValue([v17 name]);
      id v20 = [v19 UTF8String];
      unsigned int v21 = [*(id *)(a1 + 40) pid];
      int v27 = 136315394;
      id v28 = v20;
      __int16 v29 = 1024;
      unsigned int v30 = v21;
      _os_log_debug_impl(&dword_0, v18, OS_LOG_TYPE_DEBUG, "%s (%d) took media assertion", (uint8_t *)&v27, 0x12u);
    }

    id v9 = (void *)qword_45D8;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [*(id *)(a1 + 40) pid]));
    [v9 addObject:v10];
  }

  else
  {
    unsigned int v11 = (void *)qword_45D8;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [*(id *)(a1 + 40) pid]));
    [v11 removeObject:v10];
  }
}

uint64_t init_memory_monitor()
{
  v0 = os_log_create("com.apple.MemoryMonitor", "plugin");
  log_handle = (uint64_t)v0;
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v5.__sig) = 0;
    _os_log_debug_impl(&dword_0, v0, OS_LOG_TYPE_DEBUG, "memory monitor plugin initialized", (uint8_t *)&v5, 2u);
  }

  pthread_attr_init(&v5);
  pthread_attr_setdetachstate(&v5, 2);
  if (pthread_create(&v4, &v5, (void *(__cdecl *)(void *))sub_2B58, 0LL))
  {
    uint64_t v1 = (os_log_s *)log_handle;
    if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v3 = 0;
      _os_log_error_impl(&dword_0, v1, OS_LOG_TYPE_ERROR, "error creating memory monitor thread", v3, 2u);
    }
  }

  return pthread_attr_destroy(&v5);
}

uint64_t sub_2B58(uint64_t a1)
{
  CFSocketContext context = off_43B8;
  int v2 = socket(32, 3, 1);
  if (v2 == -1)
  {
    BOOL v8 = (os_log_s *)log_handle;
    if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_ERROR))
    {
      id v9 = __error();
      id v10 = strerror(*v9);
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = v10;
      _os_log_error_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "could not open event socket, socket() failed: %s", buf, 0xCu);
    }

    goto LABEL_10;
  }

  int v3 = v2;
  *(void *)buf = 0x300000001LL;
  *(_DWORD *)&buf[8] = 3;
  if (ioctl(v2, 0x800C6502uLL, buf))
  {
    pthread_t v4 = (os_log_s *)log_handle;
    if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_ERROR))
    {
      pthread_attr_t v5 = __error();
      unsigned int v6 = strerror(*v5);
      *(_DWORD *)unsigned int v21 = 136315138;
      id v22 = v6;
      id v7 = "could not establish event filter, ioctl() failed: %s";
LABEL_19:
      _os_log_error_impl(&dword_0, v4, OS_LOG_TYPE_ERROR, v7, v21, 0xCu);
      goto LABEL_9;
    }

    goto LABEL_9;
  }

  int v19 = 1;
  if (ioctl(v3, 0x8004667EuLL, &v19))
  {
    pthread_t v4 = (os_log_s *)log_handle;
    if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_ERROR))
    {
      unsigned int v17 = __error();
      v18 = strerror(*v17);
      *(_DWORD *)unsigned int v21 = 136315138;
      id v22 = v18;
      id v7 = "could not set non-blocking io, ioctl() failed: %s";
      goto LABEL_19;
    }

LABEL_9:
    close(v3);
LABEL_10:
    unsigned int v11 = (os_log_s *)log_handle;
    if (!os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_ERROR)) {
      return a1;
    }
    *(_WORD *)unsigned int v21 = 0;
    unsigned int v16 = "memory monitor disabled";
LABEL_17:
    _os_log_error_impl(&dword_0, v11, OS_LOG_TYPE_ERROR, v16, v21, 2u);
    return a1;
  }

  id v13 = CFSocketCreateWithNative(0LL, v3, 1uLL, (CFSocketCallBack)sub_2E2C, &context);
  RunLoopSource = CFSocketCreateRunLoopSource(0LL, v13, 0LL);
  Current = CFRunLoopGetCurrent();
  CFRunLoopAddSource(Current, RunLoopSource, kCFRunLoopDefaultMode);
  if (qword_45E8 != -1) {
    dispatch_once(&qword_45E8, &stru_42D0);
  }
  CFRelease(RunLoopSource);
  CFRelease(v13);
  CFRunLoopRun();
  unsigned int v11 = (os_log_s *)log_handle;
  if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)unsigned int v21 = 0;
    unsigned int v16 = "memory monitor thread returning";
    goto LABEL_17;
  }

  return a1;
}

void sub_2E2C(__CFSocket *a1)
{
  CFSocketNativeHandle Native = CFSocketGetNative(a1);
  ssize_t v3 = recv(Native, v12, 0x20uLL, 0);
  if (v3 != -1)
  {
    if (v3 < v12[0])
    {
      pthread_t v4 = (os_log_s *)log_handle;
      if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v10) = 0;
        _os_log_error_impl( &dword_0,  v4,  OS_LOG_TYPE_ERROR,  "missed SYSPROTO_EVENT event, buffer not big enough",  (uint8_t *)&v10,  2u);
      }

      return;
    }

    if (v12[1] == 1)
    {
      if (v12[2] == 3)
      {
        if (v12[3] == 3)
        {
          if (v12[5] == 2)
          {
            unsigned int v6 = (os_log_s *)log_handle;
            if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v10) = 0;
              _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_DEFAULT,  "kernel jetsam snapshot note received",  (uint8_t *)&v10,  2u);
            }

            HandleJetsamEvent();
            return;
          }

          id v7 = @"Unknown event code";
        }

        else
        {
          id v7 = @"New Apple System subclass";
        }
      }

      else
      {
        id v7 = @"New (Apple) class";
      }
    }

    else
    {
      id v7 = @"New vendor";
    }

    sub_3044((uint64_t)v7, v12);
    return;
  }

  pthread_attr_t v5 = (os_log_s *)log_handle;
  if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_ERROR))
  {
    BOOL v8 = __error();
    id v9 = strerror(*v8);
    int v10 = 136315138;
    unsigned int v11 = v9;
    _os_log_error_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "recv() failed: %s", (uint8_t *)&v10, 0xCu);
    pthread_attr_t v5 = (os_log_s *)log_handle;
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v10) = 0;
    _os_log_error_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "memory monitor disabled", (uint8_t *)&v10, 2u);
  }

  CFSocketInvalidate(a1);
}

void sub_3044(uint64_t a1, unsigned int *a2)
{
  pthread_t v4 = (os_log_s *)log_handle;
  if (os_log_type_enabled((os_log_t)log_handle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)unsigned int v17 = a1;
    _os_log_debug_impl(&dword_0, v4, OS_LOG_TYPE_DEBUG, "%@ event:", buf, 0xCu);
    pthread_t v4 = (os_log_s *)log_handle;
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v10 = *a2;
    unsigned int v11 = a2[1];
    unsigned int v12 = a2[2];
    unsigned int v13 = a2[3];
    unsigned int v14 = a2[4];
    unsigned int v15 = a2[5];
    *(_DWORD *)buf = 67110400;
    *(_DWORD *)unsigned int v17 = v10;
    *(_WORD *)&v17[4] = 1024;
    *(_DWORD *)&v17[6] = v14;
    __int16 v18 = 1024;
    unsigned int v19 = v11;
    __int16 v20 = 1024;
    unsigned int v21 = v12;
    __int16 v22 = 1024;
    unsigned int v23 = v13;
    __int16 v24 = 1024;
    unsigned int v25 = v15;
    _os_log_debug_impl( &dword_0,  v4,  OS_LOG_TYPE_DEBUG,  "Event size=%d, id=%d, vendor=%d, class=%d, subclass=%d, code=%d",  buf,  0x26u);
  }

  unsigned int v5 = *a2;
  if (*a2 >= 0x19)
  {
    int v6 = 0;
    id v7 = (os_log_s *)log_handle;
    uint64_t v8 = 6LL;
    do
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        unsigned int v9 = a2[v8];
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)unsigned int v17 = v6;
        *(_WORD *)&v17[4] = 1024;
        *(_DWORD *)&v17[6] = v9;
        _os_log_debug_impl(&dword_0, v7, OS_LOG_TYPE_DEBUG, "Event data[%2d] = %08x", buf, 0xEu);
        id v7 = (os_log_s *)log_handle;
        unsigned int v5 = *a2;
      }

      ++v6;
      ++v8;
    }

    while ((v8 * 4) < v5);
  }
}

CFStringRef sub_3228()
{
  return CFStringCreateWithFormat(0LL, 0LL, @"<kernel event socket>");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}