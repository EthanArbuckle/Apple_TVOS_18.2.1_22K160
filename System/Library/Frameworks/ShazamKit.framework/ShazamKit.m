void sub_1000032BC(id a1)
{
  uint64_t v1;
  void *v2;
  v1 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToWeakObjectsMapTable](&OBJC_CLASS___NSMapTable, "weakToWeakObjectsMapTable"));
  v2 = (void *)qword_100088918;
  qword_100088918 = v1;
}

void sub_100003328(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.shazamd.globalworkers.dispatch", 0LL);
  v2 = (void *)qword_100088928;
  qword_100088928 = (uint64_t)v1;
}

void sub_1000035F4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_100003620(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained shutdownWorker];
}

void sub_10000364C(uint64_t a1)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[SHServiceStateHandler globallyScopedWorkers]( &OBJC_CLASS___SHServiceStateHandler,  "globallyScopedWorkers"));
  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 workerID]);
  [v4 setObject:v2 forKey:v3];
}

void sub_1000037D8(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[SHServiceStateHandler globallyScopedWorkers]( &OBJC_CLASS___SHServiceStateHandler,  "globallyScopedWorkers"));
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) workerID]);
  [v3 removeObjectForKey:v2];
}

void sub_100003B4C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100003B6C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100003B7C(uint64_t a1)
{
}

void sub_100003B84(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[SHServiceStateHandler globallyScopedWorkers]( &OBJC_CLASS___SHServiceStateHandler,  "globallyScopedWorkers"));
  uint64_t v2 = objc_claimAutoreleasedReturnValue([v5 objectForKey:*(void *)(a1 + 32)]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_100003F24( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100003F48(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = sh_log_object(v3, v4);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v10 = 138412290;
    id v11 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Failed to setup the remote proxy %@",  (uint8_t *)&v10,  0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = (void *)*((void *)WeakRetained + 1);
    *((void *)WeakRetained + 1) = 0LL;
  }
}

uint64_t sub_1000042E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sh_log_object(a1, a2);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Watchdog timer fired", v6, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}
}

void sub_1000055F4(_Unwind_Exception *a1)
{
}

void sub_100005614(uint64_t a1)
{
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 2);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[os_unfair_lock_s connectionHandles](v3, "connectionHandles"));
    [v4 removeObject:*(void *)(a1 + 32)];

    uint64_t v7 = sh_log_object(v5, v6);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[os_unfair_lock_s connectionHandles](v3, "connectionHandles"));
      int v15 = 134217984;
      id v16 = [v9 count];
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Connection listener removed a handle, now we have %lu left",  (uint8_t *)&v15,  0xCu);
    }

    int v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) exportedObject]);
    uint64_t v12 = sh_log_object(v10, v11);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      int v15 = 138412546;
      id v16 = v10;
      __int16 v17 = 2112;
      uint64_t v18 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Calling shutdown on the service %@ of the handle %@",  (uint8_t *)&v15,  0x16u);
    }

    if ((objc_opt_respondsToSelector(v10, "shutdownService") & 1) != 0) {
      [v10 shutdownService];
    }
    os_unfair_lock_unlock(v3 + 2);
  }
}

uint64_t sub_1000057B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sh_log_object(a1, a2);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = *(_DWORD *)(a1 + 56);
    int v9 = 138412802;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    __int16 v13 = 1024;
    int v14 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Interruption handler called for service %@ from %@:%i",  (uint8_t *)&v9,  0x1Cu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

uint64_t sub_10000587C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sh_log_object(a1, a2);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = *(_DWORD *)(a1 + 56);
    int v9 = 138412802;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    __int16 v13 = 1024;
    int v14 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Invalidation handler called for service %@ from %@:%i",  (uint8_t *)&v9,  0x1Cu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

uint64_t start()
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  dispatch_queue_t v1 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  uint64_t v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, v1);
  uint64_t v3 = _set_user_dir_suffix("com.apple.shazamd");
  if ((v3 & 1) == 0)
  {
    uint64_t v5 = sh_log_object(v3, v4);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int16 v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to set tmp dir suffix", v11, 2u);
    }
  }

  int v7 = objc_alloc_init(&OBJC_CLASS___SHServer);
  v8 = (void *)qword_100088938;
  qword_100088938 = (uint64_t)v7;

  [(id)qword_100088938 start];
  if (v2)
  {
    dispatch_source_set_event_handler(v2, &stru_10006CCC0);
    dispatch_resume(v2);
  }

  int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  [v9 run];

  return 0LL;
}

void sub_100005ACC(id a1)
{
  uint64_t v1 = sh_log_object(a1);
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_ERROR,  "Software termination signal from kill. Exiting...",  v3,  2u);
  }

  [(id)qword_100088938 stop];
}

LABEL_9:
}
}

void sub_100007174( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100007190(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (!v7
    || (__int16 v11 = *(void **)(a1 + 32),
        id v18 = v10,
        unsigned __int8 v12 = [v11 appendBuffer:v7 atTime:v8 error:&v18],
        id v13 = v18,
        v10,
        uint64_t v10 = v13,
        (v12 & 1) == 0))
  {
    uint64_t v14 = sh_log_object(v9);
    int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = 0LL;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Signature generator failed to flow audio - error %@, tearing down and creating a new instance",  buf,  0xCu);
    }

    id v16 = -[SHSignatureGenerator initSignatureRingBufferWithDuration:]( objc_alloc(&OBJC_CLASS___SHSignatureGenerator),  "initSignatureRingBufferWithDuration:",  3.0);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained setSignatureGenerator:v16];
  }
}

void sub_1000073F0(_Unwind_Exception *a1)
{
}

uint64_t sub_100007414(uint64_t a1, void *a2)
{
  if (!a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
  [a2 recordingIntermission];
  double v4 = v3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setDefaultRecordingIntermissionInSeconds:v4];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100007578(_Unwind_Exception *a1)
{
}

uint64_t sub_10000759C(uint64_t a1, void *a2)
{
  if (!a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
  double v3 = (void *)objc_claimAutoreleasedReturnValue([a2 tokenForClientIdentifier:*(void *)(a1 + 32)]);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setCampaignToken:v3];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_1000078C8(_Unwind_Exception *a1)
{
}

void sub_1000078EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&to, (id *)(a1 + 56));
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) locationProvider]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 location]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SHServerMatchResponseParser matcherResponseFromServerData:signature:location:context:]( &OBJC_CLASS___SHServerMatchResponseParser,  "matcherResponseFromServerData:signature:location:context:",  v4,  v5,  v7,  v3));

  id v9 = objc_loadWeakRetained(&to);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 delegate]);
  id v11 = objc_loadWeakRetained(&to);
  [v10 matcher:v11 didProduceResponse:v8];

  objc_destroyWeak(&to);
}

void sub_1000079D4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_100007B5C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100007B80(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_copyWeak(&to, (id *)(a1 + 40));
  if (v5)
  {
    id v7 = objc_loadWeakRetained(&to);
    [v7 matchSignature:*(void *)(a1 + 32) tokenizedURL:v5];
  }

  else
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue( +[SHError errorWithCode:underlyingError:]( &OBJC_CLASS___SHError,  "errorWithCode:underlyingError:",  202LL,  v6));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SHMatcherResponse errorResponseForSignature:error:]( &OBJC_CLASS___SHMatcherResponse,  "errorResponseForSignature:error:",  *(void *)(a1 + 32),  v7));
    id v9 = objc_loadWeakRetained(&to);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 delegate]);
    id v11 = objc_loadWeakRetained(&to);
    [v10 matcher:v11 didProduceResponse:v8];
  }

  objc_destroyWeak(&to);
}

void sub_100007C8C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_100007E94( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_100007EC0(id *a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&to, a1 + 6);
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 data]);
  id v5 = (void *)v4;
  if (!v4
    || (id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 data]),
        BOOL v7 = [v6 length] == 0,
        v6,
        v5,
        v7))
  {
    uint64_t v10 = sh_log_object(v4);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v3 error]);
      *(_DWORD *)buf = 138412290;
      v40 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Received network response, no data %@",  buf,  0xCu);
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v3 error]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 domain]);
    if ([v14 isEqualToString:NSURLErrorDomain])
    {
      int v15 = (void *)objc_claimAutoreleasedReturnValue([v3 error]);
      if ([v15 code] == (id)-1009)
      {
      }

      else
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v3 error]);
        BOOL v17 = [v16 code] == (id)-1005;

        if (!v17) {
          goto LABEL_15;
        }
      }

      [a1[4] duration];
      double v19 = v18;
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([a1[4] metrics]);
      [v20 signatureRecordingOffset];
      double v22 = v21;
      v23 = (void *)objc_claimAutoreleasedReturnValue([a1[5] catalog]);
      [v23 maximumQuerySignatureDuration];
      BOOL v25 = v19 + v22 < v24;

      if (v25)
      {
        uint64_t v27 = sh_log_object(v26);
        v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "Signature length not max so continuing recording until max",  buf,  2u);
        }

        v29 = (void *)objc_claimAutoreleasedReturnValue([a1[4] metrics]);
        [v29 signatureRecordingOffset];
        double v31 = v30;
        v32 = (void *)objc_claimAutoreleasedReturnValue([a1[5] catalog]);
        [v32 maximumQuerySignatureDuration];
        id v8 = (id)objc_claimAutoreleasedReturnValue( +[SHMatcherResponse noMatchWithRecordingIntermission:recordingSignatureOffset:retrySeconds:signature:]( &OBJC_CLASS___SHMatcherResponse,  "noMatchWithRecordingIntermission:recordingSignatureOffset:retrySeconds:signature:",  a1[4],  0.0,  v31,  v33));

        id v9 = objc_loadWeakRetained(&to);
        v34 = (void *)objc_claimAutoreleasedReturnValue([v9 delegate]);
        id v35 = objc_loadWeakRetained(&to);
        [v34 matcher:v35 didProduceResponse:v8];
        goto LABEL_16;
      }
    }

    else
    {
    }

LABEL_15:
    id v36 = a1[4];
    v37 = (void *)objc_claimAutoreleasedReturnValue([v3 error]);
    id v8 = (id)objc_claimAutoreleasedReturnValue( +[SHMatcherResponse errorResponseForSignature:error:]( &OBJC_CLASS___SHMatcherResponse,  "errorResponseForSignature:error:",  v36,  v37));

    id v9 = objc_loadWeakRetained(&to);
    v34 = (void *)objc_claimAutoreleasedReturnValue([v9 delegate]);
    id v35 = objc_loadWeakRetained(&to);
    [v34 matcher:v35 didProduceResponse:v8];
LABEL_16:

    goto LABEL_17;
  }

  id v8 = objc_loadWeakRetained(&to);
  id v9 = (id)objc_claimAutoreleasedReturnValue([v3 data]);
  [v8 responseForServerData:v9 signature:a1[4]];
LABEL_17:

  objc_destroyWeak(&to);
}

    id v13 = 0LL;
    goto LABEL_16;
  }

  unsigned __int8 v12 = (os_log_s *)v11;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLRequest requestWithURL:](&OBJC_CLASS___NSURLRequest, "requestWithURL:", v11));
LABEL_16:

  return v13;
}

void sub_10000825C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_100008DDC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_100008E08(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sh_log_object(v3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 data]);
    *(_DWORD *)buf = 134217984;
    id v22 = [v6 length];
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Haptics request complete with response data %lu.",  buf,  0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mediaItem]);
  [v8 duration];
  id v20 = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "hapticSongItemFromResponse:songDuration:error:", v3, &v20));
  id v10 = v20;

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 hapticsURL]);
  uint64_t v13 = sh_log_object(v12);
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v22) = v11 != 0LL;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Song attributes fetched. Media Item Has Haptic Track?: %d",  buf,  8u);
  }

  BOOL v15 = v11 != 0LL;

  uint64_t v16 = *(void *)(a1 + 40);
  uint64_t v17 = objc_claimAutoreleasedReturnValue([v3 error]);
  double v18 = (void *)v17;
  if (v17) {
    id v19 = (id)v17;
  }
  else {
    id v19 = v10;
  }
  (*(void (**)(uint64_t, BOOL, id))(v16 + 16))(v16, v15, v19);
}

void sub_1000095DC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,id location)
{
}

void sub_100009608(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = objc_alloc(&OBJC_CLASS___SHHapticsEndpointResponse);
  id v6 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) mediaItem]);
  uint64_t v4 = -[SHNetworkDownloadResponse initWithDownloadedFileLocation:urlResponse:error:]( objc_alloc(&OBJC_CLASS___SHNetworkDownloadResponse),  "initWithDownloadedFileLocation:urlResponse:error:",  0LL,  0LL,  *(void *)(a1 + 48));
  id v5 = -[SHHapticsEndpointResponse initWithRequestMediaItem:networkDownloadResponse:]( v3,  "initWithRequestMediaItem:networkDownloadResponse:",  v6,  v4);
  [v2 addObject:v5];
}

void sub_1000096A4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mediaItem]);
  [v5 duration];
  id v55 = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "hapticSongItemFromResponse:songDuration:error:", v3, &v55));
  id v37 = v55;

  id v7 = objc_loadWeakRetained((id *)(a1 + 64));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mediaItem]);
  v38 = (void *)objc_claimAutoreleasedReturnValue([v7 cachedHapticsResponseForSongItem:v6 representingMediaItem:v8]);

  if (v38
    && (id v9 = objc_loadWeakRetained((id *)(a1 + 64)),
        unsigned int v10 = [v9 allowsCachedAssets],
        v9,
        v10))
  {
    uint64_t v12 = sh_log_object(v11);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 appleMusicID]);
      BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mediaItem]);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 isrc]);
      *(_DWORD *)buf = 138412546;
      id v57 = v14;
      __int16 v58 = 2112;
      id v59 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "Returning cached apple archive for request. AppleMusicID: %@, ISRC: %@",  buf,  0x16u);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100009BBC;
    block[3] = &unk_10006CE28;
    uint64_t v17 = *(dispatch_queue_s **)(a1 + 40);
    id v53 = *(id *)(a1 + 48);
    id v54 = v38;
    dispatch_sync(v17, block);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

    double v18 = v53;
  }

  else
  {
    double v18 = (void *)objc_claimAutoreleasedReturnValue([v6 hapticsURL]);
    if (v18)
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v6 spatialOffsets]);
      id v20 = (void *)objc_claimAutoreleasedReturnValue( +[SHServerSpatialOffsetsParser offsetsFromResponse:]( &OBJC_CLASS___SHServerSpatialOffsetsParser,  "offsetsFromResponse:",  v19));

      id v21 = objc_loadWeakRetained((id *)(a1 + 64));
      id v36 = (void *)objc_claimAutoreleasedReturnValue([v21 hapticsDownloadRequestFromDownloadURL:v18]);

      id v22 = (void *)objc_claimAutoreleasedReturnValue([v6 appleMusicID]);
      v23 = v22;
      if (v22)
      {
        id v24 = v22;
      }

      else
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
        id v24 = (id)objc_claimAutoreleasedReturnValue([v29 globallyUniqueString]);
      }

      uint64_t v31 = sh_log_object(v30);
      v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        id v33 = [v20 count];
        *(_DWORD *)buf = 138412546;
        id v57 = v24;
        __int16 v58 = 2048;
        id v59 = v33;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEBUG,  "Attempting to download archive with filename %@. Spatial offsets count %ld",  buf,  0x16u);
      }

      id v34 = objc_loadWeakRetained((id *)(a1 + 64));
      id v35 = (void *)objc_claimAutoreleasedReturnValue([v34 endpointRequester]);
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472LL;
      v39[2] = sub_100009C90;
      v39[3] = &unk_10006CEA0;
      id v40 = *(id *)(a1 + 40);
      id v41 = *(id *)(a1 + 48);
      objc_copyWeak(&v46, (id *)(a1 + 64));
      uint64_t v42 = *(void *)(a1 + 32);
      id v43 = v6;
      id v28 = v20;
      id v44 = v28;
      id v45 = *(id *)(a1 + 56);
      [v35 performDownloadRequest:v36 filename:v24 fileType:UTTypeAppleArchive reply:v39];

      objc_destroyWeak(&v46);
    }

    else
    {
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472LL;
      v47[2] = sub_100009BC8;
      v47[3] = &unk_10006CE50;
      BOOL v25 = *(dispatch_queue_s **)(a1 + 40);
      id v26 = *(id *)(a1 + 48);
      uint64_t v27 = *(void *)(a1 + 32);
      id v48 = v26;
      uint64_t v49 = v27;
      id v50 = v3;
      id v51 = v37;
      dispatch_sync(v25, v47);
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

      id v28 = v48;
    }
  }
}

void sub_100009BA0(_Unwind_Exception *a1)
{
}

id sub_100009BBC(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
}

void sub_100009BC8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = objc_alloc(&OBJC_CLASS___SHHapticsEndpointResponse);
  id v9 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) mediaItem]);
  uint64_t v4 = objc_alloc(&OBJC_CLASS___SHNetworkDownloadResponse);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) error]);
  id v6 = v5;
  if (!v5) {
    id v6 = *(void **)(a1 + 56);
  }
  id v7 = -[SHNetworkDownloadResponse initWithDownloadedFileLocation:urlResponse:error:]( v4,  "initWithDownloadedFileLocation:urlResponse:error:",  0LL,  0LL,  v6);
  id v8 = -[SHHapticsEndpointResponse initWithRequestMediaItem:networkDownloadResponse:]( v3,  "initWithRequestMediaItem:networkDownloadResponse:",  v9,  v7);
  [v2 addObject:v8];
}

void sub_100009C90(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100009D74;
  v7[3] = &unk_10006CE78;
  uint64_t v4 = *(dispatch_queue_s **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  objc_copyWeak(&v13, (id *)(a1 + 80));
  id v5 = *(void **)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 48);
  id v10 = v5;
  id v11 = *(id *)(a1 + 64);
  id v12 = v3;
  id v6 = v3;
  dispatch_sync(v4, v7);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));

  objc_destroyWeak(&v13);
}

void sub_100009D74(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = objc_alloc(&OBJC_CLASS___SHHapticsEndpointResponse);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) mediaItem]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained updateMediaItem:v4 withSongItem:*(void *)(a1 + 48)]);
  id v6 = -[SHHapticsEndpointResponse initWithRequestMediaItem:spatialOffsets:networkDownloadResponse:]( v3,  "initWithRequestMediaItem:spatialOffsets:networkDownloadResponse:",  v5,  *(void *)(a1 + 56),  *(void *)(a1 + 64));
  [v2 addObject:v6];
}

void sub_100009E20(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0LL);
}

void sub_10000A308(id a1)
{
  uint64_t v1 = -[UNUserNotificationCenter initWithBundleIdentifier:]( objc_alloc(&OBJC_CLASS___UNUserNotificationCenter),  "initWithBundleIdentifier:",  @"com.apple.ShazamNotifications");
  id v2 = (void *)qword_100088948;
  qword_100088948 = (uint64_t)v1;

  id v3 = (void *)qword_100088948;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SHMatchResultUserNotificationContentProvider notificationCategories]( &OBJC_CLASS___SHMatchResultUserNotificationContentProvider,  "notificationCategories"));
  [v3 setNotificationCategories:v4];

  id v5 = objc_alloc_init(&OBJC_CLASS___SHMatchResultUserNotificationCenterDelegate);
  id v6 = (void *)qword_100088940;
  qword_100088940 = (uint64_t)v5;

  [(id)qword_100088948 setDelegate:qword_100088940];
  [(id)qword_100088948 setWantsNotificationResponsesDelivered];
}

LABEL_16:
    if (!v22 || !v16)
    {
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"resources"]);
      id v50 = sh_log_object(v31);
      id v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
      {
        -[SHServerResultsResponse recordingIntermissionSeconds](v22, "recordingIntermissionSeconds");
        id v53 = v52;
        -[SHServerResultsResponse retrySeconds](v22, "retrySeconds");
        *(_DWORD *)buf = 134218240;
        v109 = v53;
        v110 = 2048;
        v111 = v54;
        _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEBUG,  "Server response parser: Returning results, recording intermission %f, retry %f",  buf,  0x16u);
      }

      if (v31)
      {
        v94 = v21;
        v95 = v16;
        v96 = v15;
        v97 = v13;
        v98 = v11;
        v56 = v31;
        id v57 = v22;
        __int16 v58 = v10;
        v92 = v56;
        id v59 = -[SHServerResourcesResponse initWithResourcesDictionary:]( objc_alloc(&OBJC_CLASS___SHServerResourcesResponse),  "initWithResourcesDictionary:",  v56);
        v93 = v57;
        v60 = (void *)objc_claimAutoreleasedReturnValue(-[SHServerResultsResponse shazamIDs](v57, "shazamIDs"));
        v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v60 count]));
        v102 = 0u;
        v103 = 0u;
        v104 = 0u;
        v105 = 0u;
        obj = v60;
        v62 = [obj countByEnumeratingWithState:&v102 objects:v107 count:16];
        if (v62)
        {
          v63 = v62;
          v64 = *(void *)v103;
          do
          {
            for (i = 0LL; i != v63; i = (char *)i + 1)
            {
              if (*(void *)v103 != v64) {
                objc_enumerationMutation(obj);
              }
              v66 = *(void *)(*((void *)&v102 + 1) + 8LL * (void)i);
              v67 = (void *)objc_claimAutoreleasedReturnValue([v58 audioStartDate]);
              v68 = (void *)objc_claimAutoreleasedReturnValue([v101 campaignToken]);
              v69 = (void *)objc_claimAutoreleasedReturnValue( [a1 mediaItemFromResourcesResponse:v59 shazamID:v66 signatureStartDate:v67 campaignToken:v68 location:v100]);

              [v61 addObject:v69];
            }

            v63 = [obj countByEnumeratingWithState:&v102 objects:v107 count:16];
          }

          while (v63);
        }

        if ([v61 count])
        {
          id v10 = v58;
          v70 = -[SHMatch initWithMediaItems:forSignature:]( objc_alloc(&OBJC_CLASS___SHMatch),  "initWithMediaItems:forSignature:",  v61,  v58);
          v71 = sh_log_object(v70);
          v72 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);
          id v13 = v97;
          id v21 = v94;
          if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v109 = v70;
            _os_log_impl( (void *)&_mh_execute_header,  v72,  OS_LOG_TYPE_DEBUG,  "Server response parser: has match %@",  buf,  0xCu);
          }

          id v22 = v93;
          -[SHServerResultsResponse recordingIntermissionSeconds](v93, "recordingIntermissionSeconds");
          v74 = v73;
          -[SHServerResultsResponse recordingSignatureOffsetSeconds](v93, "recordingSignatureOffsetSeconds");
          v76 = v75;
          -[SHServerResultsResponse retrySeconds](v93, "retrySeconds");
          id v19 = (void *)objc_claimAutoreleasedReturnValue( +[SHMatcherResponse matchWithRecordingIntermission:recordingSignatureOffset:retrySeconds:match:]( &OBJC_CLASS___SHMatcherResponse,  "matchWithRecordingIntermission:recordingSignatureOffset:retrySeconds:match:",  v70,  v74,  v76,  v77));
        }

        else
        {
          v85 = sh_log_object(0LL);
          v86 = (os_log_s *)objc_claimAutoreleasedReturnValue(v85);
          id v10 = v58;
          id v13 = v97;
          id v21 = v94;
          if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v86,  OS_LOG_TYPE_DEBUG,  "Server response parser: has no match",  buf,  2u);
          }

          id v22 = v93;
          -[SHServerResultsResponse recordingIntermissionSeconds](v93, "recordingIntermissionSeconds");
          v88 = v87;
          -[SHServerResultsResponse recordingSignatureOffsetSeconds](v93, "recordingSignatureOffsetSeconds");
          v90 = v89;
          -[SHServerResultsResponse retrySeconds](v93, "retrySeconds");
          id v19 = (void *)objc_claimAutoreleasedReturnValue( +[SHMatcherResponse noMatchWithRecordingIntermission:recordingSignatureOffset:retrySeconds:signature:]( &OBJC_CLASS___SHMatcherResponse,  "noMatchWithRecordingIntermission:recordingSignatureOffset:retrySeconds:signature:",  v10,  v88,  v90,  v91));
        }

        id v11 = v98;

        uint64_t v16 = v95;
        BOOL v15 = v96;
        uint64_t v31 = v92;
        goto LABEL_23;
      }

      v78 = sh_log_object(v55);
      v79 = (os_log_s *)objc_claimAutoreleasedReturnValue(v78);
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v79,  OS_LOG_TYPE_DEBUG,  "Server response parser: has no match",  buf,  2u);
      }

      -[SHServerResultsResponse recordingIntermissionSeconds](v22, "recordingIntermissionSeconds");
      v81 = v80;
      -[SHServerResultsResponse recordingSignatureOffsetSeconds](v22, "recordingSignatureOffsetSeconds");
      v83 = v82;
      -[SHServerResultsResponse retrySeconds](v22, "retrySeconds");
      id v48 = (id)objc_claimAutoreleasedReturnValue( +[SHMatcherResponse noMatchWithRecordingIntermission:recordingSignatureOffset:retrySeconds:signature:]( &OBJC_CLASS___SHMatcherResponse,  "noMatchWithRecordingIntermission:recordingSignatureOffset:retrySeconds:signature:",  v10,  v81,  v83,  v84));
LABEL_22:
      id v19 = v48;
LABEL_23:

      goto LABEL_24;
    }

    id v36 = sh_log_object(v20);
    id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      -[SHServerResultsResponse recordingIntermissionSeconds](v22, "recordingIntermissionSeconds");
      v39 = v38;
      -[SHServerResultsResponse retrySeconds](v22, "retrySeconds");
      *(_DWORD *)buf = 134218240;
      v109 = v39;
      v110 = 2048;
      v111 = v40;
      _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_ERROR,  "Server response parser: Error, returning results, recording intermission %f, retry %f",  buf,  0x16u);
    }

    id v41 = objc_alloc(&OBJC_CLASS___SHMatcherResponse);
    -[SHServerResultsResponse recordingIntermissionSeconds](v22, "recordingIntermissionSeconds");
    id v43 = v42;
    -[SHServerResultsResponse recordingSignatureOffsetSeconds](v22, "recordingSignatureOffsetSeconds");
    id v45 = v44;
    -[SHServerResultsResponse retrySeconds](v22, "retrySeconds");
    v47 = v46;
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[SHServerErrorResponse error](v16, "error"));
    id v33 = v41;
    id v34 = v43;
    id v35 = v45;
    v32 = v47;
LABEL_21:
    id v48 = [v33 initWithRecordingIntermission:0 recordingSignatureOffset:v10 retrySeconds:0 match:v31 signature:v34 runningAssociatedRequestID:v35 error:v32];
    goto LABEL_22;
  }

  uint64_t v17 = sh_log_object(v12);
  double v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v109 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "Server response parser: No response %@",  buf,  0xCu);
  }

  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue( +[SHError errorWithCode:underlyingError:]( &OBJC_CLASS___SHError,  "errorWithCode:underlyingError:",  202LL,  v13));
  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[SHMatcherResponse errorResponseForSignature:error:]( &OBJC_CLASS___SHMatcherResponse,  "errorResponseForSignature:error:",  v10,  v15));
LABEL_24:

  return v19;
}

void sub_10000B0E4(id a1)
{
  id v6 = objc_alloc_init(&OBJC_CLASS___SHAudioSessionManager);
  uint64_t v1 = objc_alloc(&OBJC_CLASS___SHAudioRecordingManager);
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[SHAudioRecorderProvider availableRecorders]( &OBJC_CLASS___SHAudioRecorderProvider,  "availableRecorders"));
  id v3 = -[SHAudioRecordingManager initWithRecorders:](v1, "initWithRecorders:", v2);

  uint64_t v4 = -[SHAudioManager initWithAudioSessionManager:audioRecordingManager:]( objc_alloc(&OBJC_CLASS___SHAudioManager),  "initWithAudioSessionManager:audioRecordingManager:",  v6,  v3);
  id v5 = (void *)qword_100088958;
  qword_100088958 = (uint64_t)v4;
}

void sub_10000DE90( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_10000DEB4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained session]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 dataTaskPromiseWithRequest:v5]);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10000E0A8;
    v16[3] = &unk_10006CF58;
    objc_copyWeak(&v18, (id *)(a1 + 40));
    id v17 = *(id *)(a1 + 32);
    [v10 addFinishBlock:v16];

    objc_destroyWeak(&v18);
  }

  else
  {
    uint64_t v11 = sh_log_object(v6);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to encode network request %@",  buf,  0xCu);
    }

    id v13 = objc_alloc(&OBJC_CLASS___SHNetworkResponse);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[SHError errorWithCode:underlyingError:]( &OBJC_CLASS___SHError,  "errorWithCode:underlyingError:",  202LL,  v7));
    BOOL v15 = -[SHNetworkResponse initWithData:urlResponse:error:](v13, "initWithData:urlResponse:error:", 0LL, 0LL, v14);

    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

void sub_10000E08C(_Unwind_Exception *a1)
{
}

void sub_10000E0A8(uint64_t a1, void *a2, void *a3)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 data]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 response]);

  [WeakRetained handleResultData:v8 forResponse:v9 callback:*(void *)(a1 + 32) error:v6];
}

void sub_10000E294( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void sub_10000E2B8(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 7);
    uint64_t v9 = (SHNetworkDownloadResponse *)objc_claimAutoreleasedReturnValue([WeakRetained session]);

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SHNetworkDownloadResponse session](v9, "session"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10000E4A4;
    v16[3] = &unk_10006CFA8;
    id v19 = a1[6];
    id v17 = a1[4];
    id v18 = a1[5];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 downloadTaskWithRequest:v5 completionHandler:v16]);

    [v11 resume];
  }

  else
  {
    uint64_t v12 = sh_log_object(v6);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Failed to encode network request %@",  buf,  0xCu);
    }

    uint64_t v14 = objc_alloc(&OBJC_CLASS___SHNetworkDownloadResponse);
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue( +[SHError errorWithCode:underlyingError:]( &OBJC_CLASS___SHError,  "errorWithCode:underlyingError:",  202LL,  v7));
    uint64_t v9 = -[SHNetworkDownloadResponse initWithDownloadedFileLocation:urlResponse:error:]( v14,  "initWithDownloadedFileLocation:urlResponse:error:",  0LL,  0LL,  v15);

    (*((void (**)(void))a1[6] + 2))();
  }
}

void sub_10000E4A4(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a4;
  if (a2)
  {
    uint64_t v8 = a1[4];
    uint64_t v9 = a1[5];
    id v17 = 0LL;
    id v10 = a3;
    uint64_t v11 = (SHNetworkDownloadResponse *)objc_claimAutoreleasedReturnValue( +[SHNetworkDownloadUtilities renameDownloadedFile:withFilename:usingType:error:]( &OBJC_CLASS___SHNetworkDownloadUtilities,  "renameDownloadedFile:withFilename:usingType:error:",  a2,  v8,  v9,  &v17));
    id v12 = v17;
    uint64_t v13 = a1[6];
    uint64_t v14 = -[SHNetworkDownloadResponse initWithDownloadedFileLocation:urlResponse:error:]( objc_alloc(&OBJC_CLASS___SHNetworkDownloadResponse),  "initWithDownloadedFileLocation:urlResponse:error:",  v11,  v10,  v12);

    (*(void (**)(uint64_t, SHNetworkDownloadResponse *))(v13 + 16))(v13, v14);
  }

  else
  {
    uint64_t v15 = a1[6];
    id v16 = a3;
    uint64_t v11 = -[SHNetworkDownloadResponse initWithDownloadedFileLocation:urlResponse:error:]( objc_alloc(&OBJC_CLASS___SHNetworkDownloadResponse),  "initWithDownloadedFileLocation:urlResponse:error:",  0LL,  v16,  v7);

    (*(void (**)(uint64_t, SHNetworkDownloadResponse *))(v15 + 16))(v15, v11);
  }
}

LABEL_8:
    v6[2](v6);
  }

    uint64_t v8 = v7 == 111;
  }

void sub_10000F090(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = v3;
  if (v3)
  {
    uint64_t v6 = sh_log_object(v3, v4);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      uint64_t v9 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Error adding notification request %@",  (uint8_t *)&v8,  0xCu);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10000F210(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 shazamID]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[UNNotificationRequest requestWithIdentifier:content:trigger:]( &OBJC_CLASS___UNNotificationRequest,  "requestWithIdentifier:content:trigger:",  v5,  v4,  0LL));

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SHMatchResultNotificationScheduler userNotificationCenter]( &OBJC_CLASS___SHMatchResultNotificationScheduler,  "userNotificationCenter"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000F2F0;
  v8[3] = &unk_10006CFF8;
  id v9 = *(id *)(a1 + 40);
  [v7 addNotificationRequest:v6 withCompletionHandler:v8];
}

void sub_10000F2F0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = v3;
  if (v3)
  {
    uint64_t v6 = sh_log_object(v3, v4);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Failed to schedule notification: %@",  (uint8_t *)&v8,  0xCu);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10000F5DC(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10000F648;
  v2[3] = &unk_10006D048;
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "sh_setDefaultValuesWithCompletion:", v2);
}

void sub_10000F648(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = v3;
  if (v3)
  {
    uint64_t v6 = sh_log_object(v3, v4);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Failed to add default values to response context %@",  (uint8_t *)&v8,  0xCu);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10000F708(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10000F77C;
  v3[3] = &unk_10006D048;
  id v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "sh_setCampaignTokenForClientIdentifier:completion:", v2, v3);
}

void sub_10000F77C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = v3;
  if (v3)
  {
    uint64_t v6 = sh_log_object(v3, v4);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Failed to add campaign token to response context %@",  (uint8_t *)&v8,  0xCu);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_10000F83C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void sub_10000F88C(id a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[SHLCloudContext sharedContext](&OBJC_CLASS___SHLCloudContext, "sharedContext"));
  uint64_t v2 = objc_claimAutoreleasedReturnValue([v1 manateeContainer]);
  id v3 = (void *)qword_100088970;
  qword_100088970 = v2;

  id v4 = (id)objc_claimAutoreleasedReturnValue([(id)qword_100088970 options]);
  [v4 setApplicationBundleIdentifierOverrideForTCC:@"com.apple.musicrecognition"];
}

void sub_10000FD9C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_10000FDC8(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    [v5 updateToken:4 withValue:&stru_10006E730];
    id v7 = (void *)objc_claimAutoreleasedReturnValue([a1[4] URLBuilder]);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10000FF00;
    v8[3] = &unk_10006D0E0;
    id v11 = a1[6];
    objc_copyWeak(&v12, a1 + 7);
    id v9 = v5;
    id v10 = a1[5];
    [v7 defaultValuesWithCompletion:v8];

    objc_destroyWeak(&v12);
  }

  else
  {
    (*((void (**)(void))a1[6] + 2))();
  }
}

void sub_10000FEEC(_Unwind_Exception *a1)
{
}

void sub_10000FF00(id *a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 7);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([a1[4] URLRepresentation]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SHMediaItemFetcher urlRequestsForBaseURL:shazamIDs:batchSize:]( SHMediaItemFetcher,  "urlRequestsForBaseURL:shazamIDs:batchSize:",  v5,  a1[5],  [v3 lookupBatchSize]));

    id v7 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained networkRequester]);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100010038;
    v8[3] = &unk_10006D0B8;
    id v10 = a1[6];
    void v8[4] = WeakRetained;
    id v9 = a1[5];
    [v7 performRequests:v6 completionHandler:v8];
  }

  else
  {
    (*((void (**)(void))a1[6] + 2))();
  }
}

void sub_100010038(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    int v8 = (void *)objc_claimAutoreleasedReturnValue([a1[4] contextBuilder]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([a1[4] bundleIdentifier]);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000101C0;
    v12[3] = &unk_10006D090;
    id v13 = a1[5];
    id v14 = v5;
    id v15 = a1[6];
    [v8 loadContextForClientIdentifier:v9 completion:v12];
  }

  else
  {
    uint64_t v10 = sh_log_object(v6);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Error fetching media items %@", buf, 0xCu);
    }

    (*((void (**)(void))a1[6] + 2))();
  }
}

void sub_1000101C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [*(id *)(a1 + 32) count]));
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  uint64_t v16 = a1;
  id v5 = *(id *)(a1 + 40);
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "data", v16));

        if (v11)
        {
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 data]);
          uint64_t v17 = 0LL;
          id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SHServerGetResponseParser mediaItemsFromServerData:context:error:]( &OBJC_CLASS___SHServerGetResponseParser,  "mediaItemsFromServerData:context:error:",  v12,  v3,  &v17));

          if (v13) {
            [v4 addObjectsFromArray:v13];
          }
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v7);
  }

  uint64_t v14 = *(void *)(v16 + 48);
  id v15 = [v4 copy];
  (*(void (**)(uint64_t, id, void))(v14 + 16))(v14, v15, 0LL);
}

void sub_10001089C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v8 = v3;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
    [*(id *)(a1 + 32) setAttachments:v5];
  }

  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = [*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
}

void sub_100012F14(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if (v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 globallyUniqueString]);

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 temporaryDirectory]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 URLByAppendingPathComponent:v10]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 URLByAppendingPathExtension:@"png"]);

    if (v13)
    {
      id v15 = 0LL;
      [v8 moveItemAtURL:v6 toURL:v13 error:&v15];
      id v14 = v15;
      (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    }

    else
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    }
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

void sub_100013748(id a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue( +[SHNotificationCenterProvider matchResultNotificationCenter]( &OBJC_CLASS___SHNotificationCenterProvider,  "matchResultNotificationCenter"));
  +[SHMatchResultNotificationScheduler setUserNotificationCenter:]( &OBJC_CLASS___SHMatchResultNotificationScheduler,  "setUserNotificationCenter:",  v1);

  id v2 = (id)objc_claimAutoreleasedReturnValue(+[SHRemoteConfiguration sharedInstance](&OBJC_CLASS___SHRemoteConfiguration, "sharedInstance"));
  [v2 populateRemoteConfiguration];
}

void sub_100014650(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a2;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[SHError normalizedError:](&OBJC_CLASS___SHError, "normalizedError:", a3));
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v5, v6);
}

void sub_10001476C(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a2;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[SHError normalizedError:](&OBJC_CLASS___SHError, "normalizedError:", a3));
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v5, v6);
}

void sub_100014888(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[SHError normalizedError:](&OBJC_CLASS___SHError, "normalizedError:"));
  (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, a2, v4);
}

void sub_10001773C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_10001775C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10001776C(uint64_t a1)
{
}

void sub_100017774(uint64_t a1, int a2, id obj)
{
}

void sub_100017968( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100017980(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) fetchedObjects]);
  uint64_t v3 = objc_autoreleasePoolPush();
  id v4 = NSStringFromSelector("date");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  v5,  [*(id *)(a1 + 40) ascending]));

  uint64_t v30 = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v30, 1LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v2 sortedArrayUsingDescriptors:v7]);

  objc_autoreleasePoolPop(v3);
  if ([*(id *)(a1 + 40) resultsLimit] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = [v8 count];
    id v10 = [*(id *)(a1 + 40) resultsLimit];
    if (v9 >= v10) {
      id v11 = v10;
    }
    else {
      id v11 = v9;
    }
    uint64_t v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subarrayWithRange:", 0, v11));

    id v8 = (void *)v12;
  }

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v13 = v8;
  id v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v26;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)i);
        __int128 v19 = objc_alloc(&OBJC_CLASS___SHMediaLibraryTrack);
        __int128 v20 = -[SHMediaLibraryTrack initWithManagedTrack:](v19, "initWithManagedTrack:", v18, (void)v25);
        __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) providerIdentifier]);

        if (!v21
          || (id v22 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryTrack providerIdentifier](v20, "providerIdentifier")),
              v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) providerIdentifier]),
              unsigned int v24 = [v22 isEqualToString:v23],
              v23,
              v22,
              v24))
        {
          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v20];
        }
      }

      id v15 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }

    while (v15);
  }
}

void sub_100017E60( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

void sub_100017E80(uint64_t a1)
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8LL * (void)v6);
        id v8 = objc_alloc(&OBJC_CLASS___SHMediaLibraryTrack);
        id v9 = -[SHMediaLibraryTrack initWithManagedTrack:](v8, "initWithManagedTrack:", v7, (void)v10);
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v9];

        id v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v4);
  }
}

void sub_1000181B8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_1000181D8(uint64_t a1)
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8LL * (void)v6);
        id v8 = objc_alloc(&OBJC_CLASS___SHMediaLibraryGroup);
        id v9 = -[SHMediaLibraryGroup initWithManagedGroup:](v8, "initWithManagedGroup:", v7, (void)v10);
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v9];

        id v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v4);
  }
}

void sub_100018420( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100018438(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) fetchedObjects]);
  if ([*(id *)(a1 + 40) resultsLimit] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v3 = [v2 count];
    id v4 = [*(id *)(a1 + 40) resultsLimit];
    if (v3 >= v4) {
      id v5 = v4;
    }
    else {
      id v5 = v3;
    }
    id v6 = objc_msgSend(v2, "subarrayWithRange:", 0, v5);
  }

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v7 = v2;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)i);
        __int128 v13 = objc_alloc(&OBJC_CLASS___SHMediaLibraryGroup);
        id v14 = -[SHMediaLibraryGroup initWithManagedGroup:](v13, "initWithManagedGroup:", v12, (void)v15);
        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v14];
      }

      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v9);
  }
}

void sub_100018678(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) updateReportForLibraryTrack:*(void *)(a1 + 40)]);
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  id v59 = v2;
  id obj = (id)objc_claimAutoreleasedReturnValue([v2 locallyFoundTracks]);
  id v3 = [obj countByEnumeratingWithState:&v65 objects:v72 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v66;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v66 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v65 + 1) + 8LL * (void)i);
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 updatedTrack]);
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 metadata]);

        if (v9)
        {
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 localTrack]);
          __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 metadata]);

          if (v11)
          {
            uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 updatedTrack]);
            __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 metadata]);
            id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 encodedSystemData]);
            __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v7 localTrack]);
            __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 metadata]);
            [v16 setData:v14];
          }

          else
          {
            __int128 v17 = *(void **)(a1 + 32);
            uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 updatedTrack]);
            __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 metadata]);
            id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 encodedSystemData]);
            __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v7 localTrack]);
            id v18 =  [v17 createMetadataWithData:v14 track:v15 group:0 context:*(void *)(a1 + 48)];
          }
        }

        __int128 v19 = *(void **)(a1 + 32);
        __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v7 localTrack]);
        __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v7 updatedTrack]);
        [v19 updateManagedTrack:v20 withUpdatedTrack:v21];
      }

      id v4 = [obj countByEnumeratingWithState:&v65 objects:v72 count:16];
    }

    while (v4);
  }

  id v22 = (void *)objc_claimAutoreleasedReturnValue([v59 locallyFoundTracks]);
  id v23 = [v22 count];

  if (v23)
  {
    uint64_t v25 = sh_log_object(v24);
    __int128 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v59 locallyFoundTracks]);
      id v28 = [v27 count];
      *(_DWORD *)buf = 134217984;
      id v71 = v28;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEBUG,  "Updating existing entries for %lu library track(s)",  buf,  0xCu);
    }
  }

  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  v29 = (void *)objc_claimAutoreleasedReturnValue([v59 missingFromLocalStoreTracks]);
  id v30 = [v29 countByEnumeratingWithState:&v61 objects:v69 count:16];
  if (v30)
  {
    id v32 = v30;
    uint64_t v33 = *(void *)v62;
    do
    {
      for (j = 0LL; j != v32; j = (char *)j + 1)
      {
        if (*(void *)v62 != v33) {
          objc_enumerationMutation(v29);
        }
        id v35 = *(void **)(*((void *)&v61 + 1) + 8LL * (void)j);
        id v36 = (objc_class *)objc_opt_class(&OBJC_CLASS___SHTrackMO, v31);
        id v37 = NSStringFromClass(v36);
        v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "insertNewObjectForEntityForName:inManagedObjectContext:",  v38,  *(void *)(a1 + 48)));

        [*(id *)(a1 + 32) updateManagedTrack:v39 withUpdatedTrack:v35];
        id v40 = (void *)objc_claimAutoreleasedReturnValue([v35 associatedGroupIdentifier]);

        if (v40)
        {
          id v41 = *(void **)(a1 + 32);
          uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v35 associatedGroupIdentifier]);
          [v41 associateTrack:v39 toGroupWithIdentifier:v42 context:*(void *)(a1 + 48)];
        }

        id v43 = (void *)objc_claimAutoreleasedReturnValue([v35 metadata]);

        if (v43)
        {
          id v44 = *(void **)(a1 + 32);
          id v45 = (void *)objc_claimAutoreleasedReturnValue([v35 metadata]);
          id v46 = (void *)objc_claimAutoreleasedReturnValue([v45 encodedSystemData]);
          id v47 = [v44 createMetadataWithData:v46 track:v39 group:0 context:*(void *)(a1 + 48)];
        }
      }

      id v32 = [v29 countByEnumeratingWithState:&v61 objects:v69 count:16];
    }

    while (v32);
  }

  id v48 = (void *)objc_claimAutoreleasedReturnValue([v59 missingFromLocalStoreTracks]);
  id v49 = [v48 count];

  if (v49)
  {
    uint64_t v51 = sh_log_object(v50);
    v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
    {
      id v53 = (void *)objc_claimAutoreleasedReturnValue([v59 missingFromLocalStoreTracks]);
      id v54 = [v53 count];
      *(_DWORD *)buf = 134217984;
      id v71 = v54;
      _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEBUG,  "Creating entries for %lu library track(s)",  buf,  0xCu);
    }
  }

  uint64_t v55 = *(void *)(a1 + 56);
  v56 = (void *)objc_claimAutoreleasedReturnValue([v59 missingFromLocalStoreTracks]);
  id v57 = [v56 count];
  __int16 v58 = (void *)objc_claimAutoreleasedReturnValue([v59 locallyFoundTracks]);
  (*(void (**)(uint64_t, id, id))(v55 + 16))(v55, v57, [v58 count]);
}

void sub_100018D70(id *a1)
{
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id obj = a1[4];
  id v2 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v16;
    do
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v16 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)v5);
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472LL;
        v14[2] = sub_100018F54;
        v14[3] = &unk_10006D2A0;
        v14[4] = v6;
        id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", v14));
        id v8 = objc_autoreleasePoolPush();
        id v9 = (void *)objc_claimAutoreleasedReturnValue([a1[5] filteredArrayUsingPredicate:v7]);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);

        objc_autoreleasePoolPop(v8);
        if (v10)
        {
          __int128 v11 = -[SHUpdatedTrackLocalTrackPair initWithUpdatedTrack:localTrack:]( objc_alloc(&OBJC_CLASS___SHUpdatedTrackLocalTrackPair),  "initWithUpdatedTrack:localTrack:",  v6,  v10);
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([a1[6] locallyFoundTracks]);
          [v12 addObject:v11];
        }

        else
        {
          __int128 v11 = (SHUpdatedTrackLocalTrackPair *)objc_claimAutoreleasedReturnValue([a1[6] missingFromLocalStoreTracks]);
          -[SHUpdatedTrackLocalTrackPair addObject:](v11, "addObject:", v6);
        }

        uint64_t v5 = (char *)v5 + 1;
      }

      while (v3 != v5);
      id v3 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v3);
  }
}

id sub_100018F54(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 syncID]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
  id v5 = [v3 isEqualToString:v4];

  return v5;
}

void sub_100019080(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) updateReportForLibraryGroups:*(void *)(a1 + 40)]);
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  __int128 v61 = v2;
  id obj = (id)objc_claimAutoreleasedReturnValue([v2 locallyFoundGroups]);
  id v3 = [obj countByEnumeratingWithState:&v68 objects:v77 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v69;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v69 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v68 + 1) + 8LL * (void)i);
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 updatedGroup]);
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 metadata]);

        if (v9)
        {
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 localGroup]);
          __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 metadata]);

          if (v11)
          {
            uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 updatedGroup]);
            __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 metadata]);
            id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 encodedSystemData]);
            __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v7 localGroup]);
            __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 metadata]);
            [v16 setData:v14];
          }

          else
          {
            __int128 v17 = *(void **)(a1 + 32);
            uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 updatedGroup]);
            __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 metadata]);
            id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 encodedSystemData]);
            __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v7 localGroup]);
            id v18 =  [v17 createMetadataWithData:v14 track:0 group:v15 context:*(void *)(a1 + 48)];
          }

          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v7 updatedGroup]);
          __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 identifier]);
          __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v7 localGroup]);
          [v21 setSyncID:v20];
        }
      }

      id v4 = [obj countByEnumeratingWithState:&v68 objects:v77 count:16];
    }

    while (v4);
  }

  id v22 = (void *)objc_claimAutoreleasedReturnValue([v61 locallyFoundGroups]);
  id v23 = [v22 count];

  if (v23)
  {
    uint64_t v24 = NSStringFromSelector("updatedGroup");
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    __int128 v26 = NSStringFromSelector("identifier");
    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"@unionOfObjects.%@.%@",  v25,  v27));

    uint64_t v30 = sh_log_object(v29);
    uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      id v32 = (void *)objc_claimAutoreleasedReturnValue([v61 locallyFoundGroups]);
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v32 valueForKeyPath:v28]);
      *(_DWORD *)buf = 134218242;
      id v74 = v23;
      __int16 v75 = 2112;
      v76 = v33;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEBUG,  "Updating existing entries for %lu Library Group IDs: %@",  buf,  0x16u);
    }
  }

  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  id obja = (id)objc_claimAutoreleasedReturnValue([v61 missingFromLocalStoreGroups]);
  id v34 = [obja countByEnumeratingWithState:&v64 objects:v72 count:16];
  if (v34)
  {
    id v36 = v34;
    uint64_t v37 = *(void *)v65;
    do
    {
      for (j = 0LL; j != v36; j = (char *)j + 1)
      {
        if (*(void *)v65 != v37) {
          objc_enumerationMutation(obja);
        }
        v39 = *(void **)(*((void *)&v64 + 1) + 8LL * (void)j);
        id v40 = (objc_class *)objc_opt_class(&OBJC_CLASS___SHGroupMO, v35);
        id v41 = NSStringFromClass(v40);
        uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
        id v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "insertNewObjectForEntityForName:inManagedObjectContext:",  v42,  *(void *)(a1 + 48)));

        id v44 = (void *)objc_claimAutoreleasedReturnValue([v39 identifier]);
        [v43 setSyncID:v44];

        id v45 = (void *)objc_claimAutoreleasedReturnValue([v39 metadata]);
        if (v45)
        {
          id v46 = *(void **)(a1 + 32);
          id v47 = (void *)objc_claimAutoreleasedReturnValue([v39 metadata]);
          id v48 = (void *)objc_claimAutoreleasedReturnValue([v47 encodedSystemData]);
          id v49 = [v46 createMetadataWithData:v48 track:0 group:v43 context:*(void *)(a1 + 48)];
        }
      }

      id v36 = [obja countByEnumeratingWithState:&v64 objects:v72 count:16];
    }

    while (v36);
  }

  uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue([v61 missingFromLocalStoreGroups]);
  id v51 = [v50 count];

  if (v51)
  {
    uint64_t v53 = sh_log_object(v52);
    id v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue([v61 missingFromLocalStoreGroups]);
      id v56 = [v55 count];
      *(_DWORD *)buf = 134217984;
      id v74 = v56;
      _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEBUG,  "Creating entries for %lu library group(s)",  buf,  0xCu);
    }
  }

  uint64_t v57 = *(void *)(a1 + 56);
  __int16 v58 = (void *)objc_claimAutoreleasedReturnValue([v61 missingFromLocalStoreGroups]);
  id v59 = [v58 count];
  v60 = (void *)objc_claimAutoreleasedReturnValue([v61 locallyFoundGroups]);
  (*(void (**)(uint64_t, id, id))(v57 + 16))(v57, v59, [v60 count]);
}

void sub_1000197D4(id *a1)
{
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id obj = a1[4];
  id v2 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v16;
    do
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v16 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)v5);
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472LL;
        v14[2] = sub_1000199B8;
        v14[3] = &unk_10006D2C8;
        v14[4] = v6;
        id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", v14));
        id v8 = objc_autoreleasePoolPush();
        id v9 = (void *)objc_claimAutoreleasedReturnValue([a1[5] filteredArrayUsingPredicate:v7]);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);

        objc_autoreleasePoolPop(v8);
        if (v10)
        {
          __int128 v11 = -[SHUpdatedGroupLocalGroupPair initWithUpdatedGroup:localGroup:]( objc_alloc(&OBJC_CLASS___SHUpdatedGroupLocalGroupPair),  "initWithUpdatedGroup:localGroup:",  v6,  v10);
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([a1[6] locallyFoundGroups]);
          [v12 addObject:v11];
        }

        else
        {
          __int128 v11 = (SHUpdatedGroupLocalGroupPair *)objc_claimAutoreleasedReturnValue([a1[6] missingFromLocalStoreGroups]);
          -[SHUpdatedGroupLocalGroupPair addObject:](v11, "addObject:", v6);
        }

        uint64_t v5 = (char *)v5 + 1;
      }

      while (v3 != v5);
      id v3 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v3);
  }
}

id sub_1000199B8(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 syncID]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
  id v5 = [v3 isEqualToString:v4];

  return v5;
}

uint64_t sub_100019BAC(uint64_t a1)
{
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(a1 + 40) deleteObject:*(void *)(*((void *)&v17 + 1) + 8 * (void)v6)];
        uint64_t v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }

    while (v4);
  }

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v7 = *(id *)(a1 + 48);
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      __int128 v11 = 0LL;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend( *(id *)(a1 + 40),  "deleteObject:",  *(void *)(*((void *)&v13 + 1) + 8 * (void)v11),  (void)v13);
        __int128 v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }

    while (v9);
  }

  return (*(uint64_t (**)(void, char *))(*(void *)(a1 + 56) + 16))( *(void *)(a1 + 56),  (char *)[*(id *)(a1 + 32) count] + (void)objc_msgSend(*(id *)(a1 + 48), "count"));
}

void sub_100019FBC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
}

uint64_t sub_100019FD4(uint64_t a1)
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend( *(id *)(a1 + 40),  "deleteObject:",  *(void *)(*((void *)&v8 + 1) + 8 * (void)v6),  (void)v8);
        uint64_t v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v4);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_10001A0D4(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v1 = a1[5];
  uint64_t v3 = a1[6];
  uint64_t v4 = *(void *)(a1[7] + 8LL);
  id obj = *(id *)(v4 + 40);
  id v5 = [v2 executeRequest:v1 withContext:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
}

void sub_10001A1A0(id a1, NSError *a2)
{
  id v2 = a2;
  uint64_t v4 = v2;
  if (v2)
  {
    uint64_t v5 = sh_log_object(v2, v3);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      __int128 v8 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Failed to purge local group objects: %@",  (uint8_t *)&v7,  0xCu);
    }
  }
}

void sub_10001A24C(id a1, NSError *a2)
{
  id v2 = a2;
  uint64_t v4 = v2;
  if (v2)
  {
    uint64_t v5 = sh_log_object(v2, v3);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      __int128 v8 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Failed to purge local track objects: %@",  (uint8_t *)&v7,  0xCu);
    }
  }
}

void sub_10001A344(id a1, NSError *a2)
{
  id v2 = a2;
  uint64_t v4 = v2;
  if (v2)
  {
    uint64_t v5 = sh_log_object(v2, v3);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      __int128 v8 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Failed to delete sync metadata: %@",  (uint8_t *)&v7,  0xCu);
    }
  }
}

void sub_10001A59C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10001A5CC(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasChanges])
  {
    id v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
    id obj = *(id *)(v3 + 40);
    unsigned __int8 v4 = [v2 save:&obj];
    objc_storeStrong((id *)(v3 + 40), obj);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v4;
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }

id sub_10001A6BC(uint64_t a1)
{
  return [*(id *)(a1 + 32) reset];
}

void sub_10001A890( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10001A8C0(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8LL);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v2 executeFetchRequest:v3 error:&obj]);
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[6] + 8LL);
  int v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void sub_10001B1D8(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[SHFetchedResultsControllerFactory trackFetchedResultsControllerWithContext:]( &OBJC_CLASS___SHFetchedResultsControllerFactory,  "trackFetchedResultsControllerWithContext:",  *(void *)(a1 + 40)));
  [*(id *)(a1 + 32) setTracksFetchedResultsController:v2];

  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 tracksFetchedResultsController]);
  [(id)v4 setDelegate:v3];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) tracksFetchedResultsController]);
  id v10 = 0LL;
  LOBYTE(v4) = [v5 performFetch:&v10];
  id v6 = v10;

  if ((v4 & 1) == 0)
  {
    uint64_t v8 = sh_log_object(v7);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Failed to observe local track changes: %@",  buf,  0xCu);
    }
  }
}

void sub_10001B374(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[SHFetchedResultsControllerFactory groupFetchedResultsControllerWithContext:]( &OBJC_CLASS___SHFetchedResultsControllerFactory,  "groupFetchedResultsControllerWithContext:",  *(void *)(a1 + 40)));
  [*(id *)(a1 + 32) setGroupsFetchedResultsController:v2];

  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 groupsFetchedResultsController]);
  [(id)v4 setDelegate:v3];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) groupsFetchedResultsController]);
  id v10 = 0LL;
  LOBYTE(v4) = [v5 performFetch:&v10];
  id v6 = v10;

  if ((v4 & 1) == 0)
  {
    uint64_t v8 = sh_log_object(v7);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Failed to observe local group changes: %@",  buf,  0xCu);
    }
  }
}

void sub_10001B768( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10001B780(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (objc_class *)objc_opt_class(&OBJC_CLASS___SHTrackMO, a2);
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v20 = (id)objc_claimAutoreleasedReturnValue( +[NSEntityDescription entityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "entityForName:inManagedObjectContext:",  v5,  *(void *)(a1 + 32)));

  uint64_t v7 = (objc_class *)objc_opt_class(&OBJC_CLASS___SHGroupMO, v6);
  uint64_t v8 = NSStringFromClass(v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSEntityDescription entityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "entityForName:inManagedObjectContext:",  v9,  *(void *)(a1 + 32)));

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) entity]);
  unsigned int v12 = [v11 isKindOfEntity:v20];

  uint64_t v13 = *(void **)(a1 + 40);
  if (v12)
  {
    id v14 = v13;
    uint64_t v15 = -[SHMediaLibraryTrack initWithManagedTrack:]( objc_alloc(&OBJC_CLASS___SHMediaLibraryTrack),  "initWithManagedTrack:",  v14);
LABEL_5:
    uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8LL);
    __int128 v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v15;

    goto LABEL_6;
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v13 entity]);
  unsigned int v17 = [v16 isKindOfEntity:v10];

  if (v17)
  {
    id v14 = *(id *)(a1 + 40);
    uint64_t v15 = -[SHMediaLibraryGroup initWithManagedGroup:]( objc_alloc(&OBJC_CLASS___SHMediaLibraryGroup),  "initWithManagedGroup:",  v14);
    goto LABEL_5;
  }

LABEL_6:
}

void sub_10001BE3C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_10001BE68(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 snapshot]);
  [v5 mergeSnapshot:v4];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) snapshot]);
  [WeakRetained removeInvalidChangesFromSnapshot:v7];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) snapshot]);
  id v16 = 0LL;
  unsigned __int8 v9 = [WeakRetained _synchronizeLocalSnapshot:v8 error:&v16];
  id v10 = v16;

  if ((v9 & 1) != 0)
  {
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) snapshot]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) startCondition]);
    [WeakRetained synchronizeRemoteSnapshot:v12 startCondition:v13];
  }

  else
  {
    uint64_t v14 = sh_log_object(v11);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Failed to sync local changes with error %@",  buf,  0xCu);
    }

    [WeakRetained failedToSyncContext:*(void *)(a1 + 32)];
  }
}

void sub_10001C134(_Unwind_Exception *a1)
{
}

void sub_10001C158(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained dataStore]);
  unsigned __int8 v9 = *(void **)(a1 + 32);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10001C26C;
  v10[3] = &unk_10006D488;
  id v11 = v9;
  id v12 = *(id *)(a1 + 40);
  objc_copyWeak(&v13, (id *)(a1 + 48));
  [v8 fetchLibraryItemsWithParameters:v11 completionHandler:v10];

  objc_destroyWeak(&v13);
}

void sub_10001C258(_Unwind_Exception *a1)
{
}

void sub_10001C26C(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v23 = v8;
  if ([a1[4] shouldUpdate])
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v7 count]));
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    id v11 = v7;
    id v12 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v31;
      do
      {
        uint64_t v14 = 0LL;
        do
        {
          if (*(void *)v31 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = -[SHMediaLibraryChange initWithLibraryItem:changeType:]( objc_alloc(&OBJC_CLASS___SHMediaLibraryChange),  "initWithLibraryItem:changeType:",  *(void *)(*((void *)&v30 + 1) + 8LL * (void)v14),  1LL,  v23);
          [v10 addObject:v15];

          uint64_t v14 = (char *)v14 + 1;
        }

        while (v12 != v14);
        id v12 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }

      while (v12);
    }

    id v16 = objc_alloc(&OBJC_CLASS___SHMediaLibrarySnapshot);
    id v17 = [v10 copy];
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithArray:](&OBJC_CLASS___NSOrderedSet, "orderedSetWithArray:", v17));
    __int128 v19 = -[SHMediaLibrarySnapshot initWithChanges:](v16, "initWithChanges:", v18);

    id WeakRetained = objc_loadWeakRetained(a1 + 6);
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained snapshotUpdater]);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10001C548;
    v24[3] = &unk_10006D460;
    objc_copyWeak(&v29, a1 + 6);
    id v22 = v19;
    uint64_t v25 = v22;
    id v28 = a1[5];
    id v26 = v23;
    id v27 = v9;
    [v21 updateSnapshot:v22 completionHandler:v24];

    objc_destroyWeak(&v29);
  }

  else
  {
    (*((void (**)(id))a1[5] + 2))(a1[5]);
  }
}

void sub_10001C52C(_Unwind_Exception *a1)
{
}

void sub_10001C548(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 tracksForChangeType:1]);
  if ([v4 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained dataStore]);
    id v7 = [v4 copy];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10001C72C;
    v18[3] = &unk_10006D438;
    id v8 = v4;
    id v19 = v8;
    [v6 persistUpdatedTracks:v7 completionHandler:v18];

    id v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained dataStore]);
    id v17 = 0LL;
    unsigned __int8 v10 = [v9 commitChangesWithError:&v17];
    id v11 = v17;

    if ((v10 & 1) == 0)
    {
      uint64_t v13 = sh_log_object(v12);
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v15 = [v8 count];
        *(_DWORD *)buf = 134218242;
        id v21 = v15;
        __int16 v22 = 2112;
        id v23 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Failed to save %ld updated changes with error %@",  buf,  0x16u);
      }
    }
  }

  [*(id *)(a1 + 32) mergeSnapshot:v3];
  id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) tracksForChangeType:1]);
  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

void sub_10001C72C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sh_log_object(a1);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [*(id *)(a1 + 32) count];
    int v9 = 134218496;
    id v10 = v8;
    __int16 v11 = 2048;
    uint64_t v12 = a2;
    __int16 v13 = 2048;
    uint64_t v14 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Processed %lu returned track changes after update. Inserted %ld & Updated %ld local entries",  (uint8_t *)&v9,  0x20u);
  }
}

LABEL_21:
        uint64_t v14 = (char *)v14 + 1;
      }

      while (v14 != v11);
      __int16 v11 = [v9 countByEnumeratingWithState:&v66 objects:v73 count:16];
    }

    while (v11);
  }

  id v36 = sh_log_object(v35);
  uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryController syncID](self, "syncID"));
    *(_DWORD *)buf = 138412290;
    __int128 v71 = v38;
    _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "[Local] Media Library sync starts. Sync ID: %@",  buf,  0xCu);
  }

  if ([v54 count])
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryController dataStore](self, "dataStore"));
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472LL;
    v60[2] = sub_10001CD74;
    v60[3] = &unk_10006D438;
    __int128 v61 = v54;
    [v39 persistLibraryGroups:v61 completionHandler:v60];
  }

  if ([v5 count])
  {
    id v40 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryController dataStore](self, "dataStore"));
    id v41 = (void *)objc_claimAutoreleasedReturnValue([v5 allObjects]);
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472LL;
    v58[2] = sub_10001CE40;
    v58[3] = &unk_10006D438;
    id v59 = v5;
    [v40 persistUpdatedTracks:v41 completionHandler:v58];
  }

  uint64_t v42 = [v8 count];
  if (v42)
  {
    id v43 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryController dataStore](self, "dataStore"));
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472LL;
    v56[2] = sub_10001CF0C;
    v56[3] = &unk_10006D4D8;
    uint64_t v57 = v8;
    [v43 deleteItemsByIdentifiers:v57 completionHandler:v56];
  }

  id v44 = sh_log_object(v42);
  id v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    id v46 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryController syncID](self, "syncID"));
    *(_DWORD *)buf = 138412290;
    __int128 v71 = v46;
    _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "[Local] Media Library completed sync. Sync ID: %@",  buf,  0xCu);
  }

  id v47 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryController dataStore](self, "dataStore"));
  id v48 = [v47 commitChangesWithError:a4];

  return v48;
}

void sub_10001CD74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sh_log_object(a1);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [*(id *)(a1 + 32) count];
    int v9 = 134218496;
    id v10 = v8;
    __int16 v11 = 2048;
    uint64_t v12 = a2;
    __int16 v13 = 2048;
    uint64_t v14 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Processed %lu changes before sync. Inserted %ld & Updated %ld local group entries",  (uint8_t *)&v9,  0x20u);
  }
}

void sub_10001CE40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sh_log_object(a1);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [*(id *)(a1 + 32) count];
    int v9 = 134218496;
    id v10 = v8;
    __int16 v11 = 2048;
    uint64_t v12 = a2;
    __int16 v13 = 2048;
    uint64_t v14 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Processed %lu changes before sync. Inserted %ld & Updated %ld local track entries",  (uint8_t *)&v9,  0x20u);
  }
}

void sub_10001CF0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sh_log_object(a1);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [*(id *)(a1 + 32) count];
    int v7 = 134218240;
    id v8 = v6;
    __int16 v9 = 2048;
    uint64_t v10 = a2;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Processed %lu deletions before sync. Deleted %ld local entries",  (uint8_t *)&v7,  0x16u);
  }
}

void sub_10001D0B8(_Unwind_Exception *a1)
{
}

void sub_10001D0DC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_copyWeak(&to, (id *)(a1 + 48));
  id v7 = [v5 status];
  if (v7 || (id v7 = [v5 isEncrypted], !(_DWORD)v7))
  {
    uint64_t v9 = sh_log_object(v7);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v19 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "iCloud account is not available or device to device encryption is not supported, skipping remote sync",  v19,  2u);
    }

    if ([v5 status] || (objc_msgSend(v5, "isEncrypted") & 1) != 0)
    {
      uint64_t v11 = 0LL;
      id v8 = 0LL;
    }

    else
    {
      uint64_t v21 = SHErrorDeviceToDeviceEncryptionKey;
      __int16 v22 = &__kCFBooleanFalse;
      id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
      uint64_t v11 = 2LL;
    }

    id v12 = objc_loadWeakRetained(&to);
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(+[SHLError errorWithCode:](&OBJC_CLASS___SHLError, "errorWithCode:", v11));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 mapInternalLibraryErrorToMediaLibrary:v13 keyOverrides:v8]);

    id v15 = objc_loadWeakRetained(&to);
    [v15 beginLibrarySync];

    id v16 = objc_loadWeakRetained(&to);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) allItemIdentifiers]);
    [v16 handleLibraryError:v14 failedItemIdentifiers:v17];

    id v18 = objc_loadWeakRetained(&to);
    [v18 persistChangesAndCompleteSyncWithCompletionHandler:0];
  }

  else
  {
    id v8 = objc_loadWeakRetained(&to);
    [v8 _synchronizeRemoteSnapshot:*(void *)(a1 + 32) startCondition:*(void *)(a1 + 40)];
  }

  objc_destroyWeak(&to);
}

void sub_10001D2F8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id location)
{
}

void sub_10001DFB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sh_log_object(a1);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [*(id *)(a1 + 32) count];
    int v9 = 134218496;
    id v10 = v8;
    __int16 v11 = 2048;
    uint64_t v12 = a2;
    __int16 v13 = 2048;
    uint64_t v14 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Processed %lu returned track changes. Inserted %ld & Updated %ld local entries",  (uint8_t *)&v9,  0x20u);
  }
}

void sub_10001E25C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sh_log_object(a1);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [*(id *)(a1 + 32) count];
    int v9 = 134218496;
    id v10 = v8;
    __int16 v11 = 2048;
    uint64_t v12 = a2;
    __int16 v13 = 2048;
    uint64_t v14 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Processed %lu returned group changes. Inserted %ld & Updated %ld local entries",  (uint8_t *)&v9,  0x20u);
  }
}

void sub_10001E3BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sh_log_object(a1);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [*(id *)(a1 + 32) count];
    int v7 = 134218240;
    id v8 = v6;
    __int16 v9 = 2048;
    uint64_t v10 = a2;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Processed %lu returned deletions. Deleted %ld local entries",  (uint8_t *)&v7,  0x16u);
  }
}

void sub_10001E5AC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_10001E5D0(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) tracksForChangeType:1]);
  if ([v4 count])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained dataStore]);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10001E6A4;
    v6[3] = &unk_10006D438;
    id v7 = v4;
    [v5 persistUpdatedTracks:v7 completionHandler:v6];
  }

  [WeakRetained persistChangesAndCompleteSyncWithCompletionHandler:*(void *)(a1 + 40)];
}

void sub_10001E6A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sh_log_object(a1);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [*(id *)(a1 + 32) count];
    int v9 = 134218496;
    id v10 = v8;
    __int16 v11 = 2048;
    uint64_t v12 = a2;
    __int16 v13 = 2048;
    uint64_t v14 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Processed %lu returned track changes after update. Inserted %ld & Updated %ld local entries",  (uint8_t *)&v9,  0x20u);
  }
}

void sub_10001F308( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

uint64_t sub_10001F334(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 libraryItem]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___SHMediaLibraryTrack, v5);
  char isKindOfClass = objc_opt_isKindOfClass(v4, v6);

  if ((isKindOfClass & 1) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained snapshotUpdater]);
    id v10 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v9 condition]);
    uint64_t v11 = ((uint64_t (**)(void, id))v10)[2](v10, v3);
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  return v11;
}

void sub_10001FEF8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SHLError errorWithCode:](&OBJC_CLASS___SHLError, "errorWithCode:", 2LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SHLTaskPreconditionResult resultWithError:]( &OBJC_CLASS___SHLTaskPreconditionResult,  "resultWithError:",  v7));
  if (v5)
  {
    if ([v5 supportsDeviceToDeviceEncryption])
    {
      id v9 = sub_10002D0D8();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        LOWORD(v16) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Account supports device to device encryption",  (uint8_t *)&v16,  2u);
      }

      uint64_t v11 = objc_claimAutoreleasedReturnValue(+[SHLTaskPreconditionResult fulfilledResult](&OBJC_CLASS___SHLTaskPreconditionResult, "fulfilledResult"));
      id v8 = (void *)v11;
    }
  }

  else
  {
    id v12 = sub_10002D0D8();
    __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138412290;
      id v17 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Failed to fetch account info %@",  (uint8_t *)&v16,  0xCu);
    }

    if (v6)
    {
      uint64_t v14 = objc_claimAutoreleasedReturnValue( +[SHLError errorWithCode:underlyingError:]( &OBJC_CLASS___SHLError,  "errorWithCode:underlyingError:",  2LL,  v6));

      uint64_t v15 = objc_claimAutoreleasedReturnValue( +[SHLTaskPreconditionResult resultWithError:]( &OBJC_CLASS___SHLTaskPreconditionResult,  "resultWithError:",  v14));
      id v8 = (void *)v15;
      id v7 = (void *)v14;
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1000206BC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1000206D8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v19 = a2;
  id v7 = a3;
  id v8 = a4;
  id v9 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v11 = WeakRetained;
  if (v8)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained delegate]);
    id v13 = objc_loadWeakRetained(v9);
    id v14 = objc_loadWeakRetained(v9);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 request]);
    int v16 = (void *)objc_claimAutoreleasedReturnValue([v13 responseSignatureForRequest:v15]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[SHMatcherResponse errorResponseForSignature:error:]( &OBJC_CLASS___SHMatcherResponse,  "errorResponseForSignature:error:",  v16,  v8));
    [v12 matcher:v13 didProduceResponse:v17];

    [v11 _stop];
  }

  else
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained sessionDriver]);
    [v18 flow:v19 time:v7];
  }
}

void sub_1000213F8(id a1)
{
  id v1 = -[SHLOperationQueue initOperationQueue](objc_alloc(&OBJC_CLASS___SHLOperationQueue), "initOperationQueue");
  uint64_t v2 = (void *)qword_100088988;
  qword_100088988 = (uint64_t)v1;
}

void sub_100021C38( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100021C50(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:CKErrorRetryAfterKey]);

  id v5 = v8;
  if (v8)
  {
    if (*(double *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) == 0.0
      || ([v8 doubleValue], id v5 = v8, v6 < *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)))
    {
      [v8 doubleValue];
      id v5 = v8;
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v7;
    }
  }
}

LABEL_7:
  return v8;
}

void sub_100021E80( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_100021E98(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  id result = objc_msgSend(*(id *)(a1 + 40), "canRetryForError:");
  if ((result & 1) == 0)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
    *a4 = 1;
  }

  return result;
}

SHAudioTapMatcher *sub_100022710(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 signatureGenerator]);
  [*(id *)(a1 + 32) maximumQuerySignatureDuration];
  id v27 = 0LL;
  unsigned __int8 v5 = objc_msgSend(v4, "updateRingBufferDuration:error:", &v27);
  id v6 = v27;

  if ((v5 & 1) == 0)
  {
    uint64_t v8 = sh_log_object(v7);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Failed to update ring for recording buffer duration %@",  buf,  0xCu);
    }
  }

  id v10 = objc_alloc(&OBJC_CLASS___SHSignatureBuffer);
  [*(id *)(a1 + 32) minimumQuerySignatureDuration];
  double v12 = v11;
  [*(id *)(a1 + 32) maximumQuerySignatureDuration];
  double v14 = v13;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _configuration]);
  [v15 streamingBufferDuration];
  double v17 = v16;
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v3 signatureGenerator]);
  id v19 = [v10 initWithMinimumSignatureDuration:v18 maximumSignatureDuration:v12 bufferDuration:v14 signatureGenerator:v17];

  id v20 = objc_alloc(&OBJC_CLASS___SHAudioTapMatcher);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v3 tap]);

  id v22 = [[SHStreamingSessionDriver alloc] initWithSignatureBuffer:v19];
  id v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) audioTapProvider]);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 audioRecordingManager]);
  uint64_t v25 = -[SHAudioTapMatcher initWithAudioTap:sessionDriver:audioRecordingManager:catalog:]( v20,  "initWithAudioTap:sessionDriver:audioRecordingManager:catalog:",  v21,  v22,  v24,  *(void *)(a1 + 32));

  return v25;
}

SHSignatureGeneratorMatcher *sub_100022920(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 signatureGenerator]);
  [*(id *)(a1 + 32) maximumQuerySignatureDuration];
  id v27 = 0LL;
  unsigned __int8 v5 = objc_msgSend(v4, "updateRingBufferDuration:error:", &v27);
  id v6 = v27;

  if ((v5 & 1) == 0)
  {
    uint64_t v8 = sh_log_object(v7);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Failed to update ring buffer for signature generation duration %@",  buf,  0xCu);
    }
  }

  id v10 = objc_alloc(&OBJC_CLASS___SHSignatureBuffer);
  [*(id *)(a1 + 32) minimumQuerySignatureDuration];
  double v12 = v11;
  [*(id *)(a1 + 32) maximumQuerySignatureDuration];
  double v14 = v13;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _configuration]);
  [v15 streamingBufferDuration];
  double v17 = v16;
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v3 signatureGenerator]);
  id v19 = [v10 initWithMinimumSignatureDuration:v18 maximumSignatureDuration:v12 bufferDuration:v14 signatureGenerator:v17];

  id v20 = objc_alloc(&OBJC_CLASS___SHSignatureGeneratorMatcher);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v3 tap]);

  id v22 = [[SHStreamingSessionDriver alloc] initWithSignatureBuffer:v19];
  id v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) audioTapProvider]);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 audioRecordingManager]);
  uint64_t v25 = -[SHSignatureGeneratorMatcher initWithAudioTap:sessionDriver:audioRecordingManager:]( v20,  "initWithAudioTap:sessionDriver:audioRecordingManager:",  v21,  v22,  v24);

  return v25;
}

void sub_1000232CC(void *a1, uint64_t a2, AudioQueueBuffer *a3, uint64_t a4)
{
  id v6 = a1;
  double v12 = -[AVAudioFormat initWithStreamDescription:]( objc_alloc(&OBJC_CLASS___AVAudioFormat),  "initWithStreamDescription:",  v6 + 8);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[SHAudioUtilities audioBufferFromData:byteSize:inFormat:]( &OBJC_CLASS___SHAudioUtilities,  "audioBufferFromData:byteSize:inFormat:",  a3->mAudioData,  a3->mAudioDataByteSize,  v12));
  uint64_t v8 = objc_alloc(&OBJC_CLASS___AVAudioTime);
  -[AVAudioFormat sampleRate](v12, "sampleRate");
  id v9 = -[AVAudioTime initWithAudioTimeStamp:sampleRate:](v8, "initWithAudioTimeStamp:sampleRate:", a4);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 delegate]);
  [v10 recorder:v6 producedAudioBuffer:v7 atTime:v9];

  double v11 = (OpaqueAudioQueue *)v6[6];
  AudioQueueEnqueueBuffer(v11, a3, 0, 0LL);
}

void sub_1000233BC(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = sh_log_object(v3);
  unsigned __int8 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412546;
    id v7 = v3;
    __int16 v8 = 1024;
    unsigned int v9 = +[SHAudioRecorder isAudioQueueRunning:](&OBJC_CLASS___SHAudioRecorder, "isAudioQueueRunning:", a2);
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "Audio queue for audio recorder %@ has changed running state %i",  (uint8_t *)&v6,  0x12u);
  }
}

void sub_100023844(_Unwind_Exception *a1)
{
}

void sub_100023858(uint64_t a1)
{
  id WeakRetained = (AudioQueueRef *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = AudioQueueStart(WeakRetained[6], 0LL);
  id v12 = 0LL;
  unsigned int v5 = objc_msgSend( (id)objc_opt_class(WeakRetained, v4),  "hasAudioQueueFailedWithStatus:annotateError:",  v3,  &v12);
  id v6 = v12;
  id v7 = v6;
  if (v5)
  {
    uint64_t v8 = sh_log_object(v6);
    unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v11 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Failed to start audio queue after a retry",  v11,  2u);
    }

    -[AudioQueueRef stopRecordingWithError:](WeakRetained, "stopRecordingWithError:", 0LL);
    id v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16LL);
  }

  else
  {
    id v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16LL);
  }

  v10();
}

void sub_1000254A0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1000254BC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v11 = WeakRetained;
  if (WeakRetained)
  {
    if (v7)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained session]);
      [v12 matchStreamingBuffer:v7 atTime:v8];
    }

    else
    {
      uint64_t v13 = sh_log_object(WeakRetained);
      double v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v17 = 138412290;
        id v18 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "No buffer received in tap completion - error %@",  (uint8_t *)&v17,  0xCu);
      }

      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v11 errorResponseSignature]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SHMatcherResponse errorResponseForSignature:error:]( &OBJC_CLASS___SHMatcherResponse,  "errorResponseForSignature:error:",  v15,  v9));

      double v16 = (void *)objc_claimAutoreleasedReturnValue([v11 delegate]);
      [v16 matcher:v11 didProduceResponse:v12];

      [v11 _stop];
    }
  }
}

void sub_1000268E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v70 = a1;
  if ([v3 count])
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) fetchTaskTransformer]);
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 cloudBackedZoneChangesOperationFromFetchTask:*(void *)(a1 + 40) forChangedZones:v3 container:*(void *)(a1 + 48)]);

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SHLOperationQueue defaultQueue](&OBJC_CLASS___SHLOperationQueue, "defaultQueue"));
    __int128 v68 = v5;
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 operation]);
    [v6 addOperation:v7];

    a1 = v70;
    __int128 v71 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));
    __int128 v76 = 0u;
    __int128 v77 = 0u;
    __int128 v78 = 0u;
    __int128 v79 = 0u;
    id v69 = v3;
    id obj = v3;
    id v8 = [obj countByEnumeratingWithState:&v76 objects:v88 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v77;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v77 != v10) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v76 + 1) + 8LL * (void)i);
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) cache]);
          double v14 = (void *)objc_claimAutoreleasedReturnValue([v12 zone]);
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 zoneID]);
          double v16 = (void *)objc_claimAutoreleasedReturnValue([v15 zoneName]);
          unsigned __int8 v17 = [v13 subscriptionExistsForZoneIdentifier:v16];

          if ((v17 & 1) == 0)
          {
            id v18 = sub_10002D0D8();
            id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v21 = (objc_class *)objc_opt_class(*(void *)(a1 + 40), v20);
              id v22 = NSStringFromClass(v21);
              id v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
              uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) identifier]);
              uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v12 zone]);
              id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 zoneID]);
              id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 zoneName]);
              *(_DWORD *)buf = 138543874;
              id v83 = v23;
              __int16 v84 = 2112;
              v85 = v24;
              __int16 v86 = 2114;
              v87 = v27;
              _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "<task: %{public}@ %@> Local subscription for <zone: %{public}@> does not exist, creating one now",  buf,  0x20u);

              a1 = v70;
            }

            [v71 addObject:v12];
          }
        }

        id v9 = [obj countByEnumeratingWithState:&v76 objects:v88 count:16];
      }

      while (v9);
    }

    if ([v71 count])
    {
      id v28 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) subscriptionTaskTransformer]);
      id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 cloudBackedOperationForZones:v71 container:*(void *)(a1 + 48)]);

      __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(+[SHLOperationQueue defaultQueue](&OBJC_CLASS___SHLOperationQueue, "defaultQueue"));
      __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v29 operation]);
      [v30 addOperation:v31];

      a1 = v70;
    }

    id v3 = v69;
  }

  __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(+[SHLCloudContext sharedContext](&OBJC_CLASS___SHLCloudContext, "sharedContext"));
  __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v32 shazamLibraryZone]);

  if (([*(id *)(a1 + 32) cloudBackedZones:v3 containsZone:v33] & 1) == 0)
  {
    id v34 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) cache]);
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v33 zoneID]);
    id v36 = (void *)objc_claimAutoreleasedReturnValue([v35 zoneName]);
    unsigned __int8 v37 = [v34 zoneExistsForIdentifier:v36];

    if ((v37 & 1) == 0)
    {
      v38 = -[SHLCloudBackedZone initWithZone:](objc_alloc(&OBJC_CLASS___SHLCloudBackedZone), "initWithZone:", v33);
      v39 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v70 + 32) cache]);
      id v40 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudBackedZone zone](v38, "zone"));
      id v41 = (void *)objc_claimAutoreleasedReturnValue([v40 zoneID]);
      uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v41 zoneName]);
      id v75 = 0LL;
      unsigned __int8 v43 = [v39 storeZoneIdentifier:v42 error:&v75];
      id v44 = v75;

      if ((v43 & 1) == 0)
      {
        id v45 = sub_10002D0D8();
        id v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v83 = v44;
          _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_ERROR,  "Failed to cache zone identifier for shazamLibraryZone in fetch task with error %{public}@",  buf,  0xCu);
        }
      }

      id obja = v44;
      id v47 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v70 + 32) zoneTransformer]);
      v81 = v38;
      id v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v81, 1LL));
      id v49 = (void *)objc_claimAutoreleasedReturnValue([v47 cloudBackedOperationForZonesToSave:v48 container:*(void *)(v70 + 48)]);

      uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue(+[SHLOperationQueue defaultQueue](&OBJC_CLASS___SHLOperationQueue, "defaultQueue"));
      id v51 = (void *)objc_claimAutoreleasedReturnValue([v49 operation]);
      [v50 addOperation:v51];

      id v52 = sub_10002D0D8();
      uint64_t v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v55 = (objc_class *)objc_opt_class(*(void *)(v70 + 40), v54);
        id v56 = NSStringFromClass(v55);
        v72 = v49;
        uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
        __int16 v58 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v70 + 40) identifier]);
        id v59 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudBackedZone zone](v38, "zone"));
        id v60 = v3;
        __int128 v61 = (void *)objc_claimAutoreleasedReturnValue([v59 zoneID]);
        __int128 v62 = (void *)objc_claimAutoreleasedReturnValue([v61 zoneName]);
        *(_DWORD *)buf = 138543874;
        id v83 = v57;
        __int16 v84 = 2112;
        v85 = v58;
        __int16 v86 = 2114;
        v87 = v62;
        _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEBUG,  "<task: %{public}@ %@> <zone: %{public}@> does not exist, so we are attempting to create one with a subscription",  buf,  0x20u);

        id v3 = v60;
        id v49 = v72;
      }

      __int128 v63 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v70 + 32) subscriptionTaskTransformer]);
      v80 = v38;
      __int128 v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v80, 1LL));
      __int128 v65 = (void *)objc_claimAutoreleasedReturnValue([v63 cloudBackedOperationForZones:v64 container:*(void *)(v70 + 48)]);

      __int128 v66 = (void *)objc_claimAutoreleasedReturnValue(+[SHLOperationQueue defaultQueue](&OBJC_CLASS___SHLOperationQueue, "defaultQueue"));
      __int128 v67 = (void *)objc_claimAutoreleasedReturnValue([v65 operation]);
      [v66 addOperation:v67];
    }
  }
}

LABEL_11:
  return (char)v7;
}
    }
  }

  else
  {
    id v12 = sub_10002D0D8();
    id v7 = (SHLCloudBackedItem *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v5 recordName]);
      double v16 = 138412290;
      unsigned __int8 v17 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_ERROR,  "Failed to fetch changes for record (%@)",  (uint8_t *)&v16,  0xCu);
    }
  }
}

void sub_10002777C(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.shazamd.location.dispatch", 0LL);
  uint64_t v2 = (void *)qword_100088998;
  qword_100088998 = (uint64_t)v1;
}

void sub_1000277E8(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToWeakObjectsMapTable](&OBJC_CLASS___NSMapTable, "weakToWeakObjectsMapTable"));
  uint64_t v2 = (void *)qword_1000889A8;
  qword_1000889A8 = v1;
}

void sub_100027964( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100027980(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100027990(uint64_t a1)
{
}

void sub_100027998(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[SHLocationProvider activeLocationProviders](&OBJC_CLASS___SHLocationProvider, "activeLocationProviders"));
  uint64_t v2 = objc_claimAutoreleasedReturnValue([v5 objectForKey:*(void *)(a1 + 32)]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_100027AD4(uint64_t a1)
{
  uint64_t v2 = objc_alloc(&OBJC_CLASS___CLLocationManager);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[SHLocationProvider locationQueue](&OBJC_CLASS___SHLocationProvider, "locationQueue"));
  id v5 = -[CLLocationManager initWithEffectiveBundleIdentifier:delegate:onQueue:]( v2,  "initWithEffectiveBundleIdentifier:delegate:onQueue:",  @"com.apple.musicrecognition",  v3,  v4);
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  [*(id *)(*(void *)(a1 + 32) + 40) setDesiredAccuracy:-1.0];
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[SHLocationProvider activeLocationProviders](&OBJC_CLASS___SHLocationProvider, "activeLocationProviders"));
  [v8 setObject:*(void *)(a1 + 32) forKey:*(void *)(a1 + 40)];
}

void sub_10002834C(_Unwind_Exception *a1)
{
}

void sub_100028370(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v4 = (void *)WeakRetained[2];
    WeakRetained[2] = 0LL;
  }
}

void sub_10002846C(_Unwind_Exception *a1)
{
}

void sub_100028488(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v5 = WeakRetained;
    if (WeakRetained)
    {
      uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([WeakRetained connectionQueue]);
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_100028538;
      v7[3] = &unk_10006CE28;
      void v7[4] = v5;
      id v8 = v3;
      dispatch_async(v6, v7);
    }
  }
}

void sub_100028538(uint64_t a1)
{
  uint64_t v2 = objc_alloc(&OBJC_CLASS___APSConnection);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connectionQueue]);
  id v5 = -[APSConnection initWithEnvironmentName:namedDelegatePort:queue:]( v2,  "initWithEnvironmentName:namedDelegatePort:queue:",  v3,  @"com.apple.aps.shazamd",  v4);
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v5;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "setDelegate:");
  id v8 = (void *)objc_claimAutoreleasedReturnValue([@"com.apple.icloud-container." stringByAppendingString:SHShazamKitServiceName]);
  uint64_t v15 = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
  [*(id *)(*(void *)(a1 + 32) + 32) _setEnabledTopics:v9];

  uint64_t v11 = sh_log_object(v10);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    double v14 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "APS Push listening for topic: '%@'",  (uint8_t *)&v13,  0xCu);
  }
}

void sub_100028820(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v8 = v6;
  if (!v5)
  {
    uint64_t v9 = sh_log_object(v6, v7);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Error getting server preferred push environment %@",  (uint8_t *)&v11,  0xCu);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100028ECC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100028EF0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained libraryInfoFetcher]);
  [v1 fetchLibraryInfoWithCompletionHandler:&stru_10006D848];
}

void sub_1000297E4(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) progress]);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) progress]);
  objc_msgSend(v3, "setCompletedUnitCount:", (char *)objc_msgSend(v2, "completedUnitCount") + 1);
}

void sub_100029840(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void **)(a1 + 32);
  uint64_t v83 = a1;
  int v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) identifier]);
  [v10 removeTaskOfType:0 forIdentifier:v11 error:0];

  if (v9 && !+[SHLError canRetryForError:](&OBJC_CLASS___SHLError, "canRetryForError:", v9))
  {
    id v62 = sub_10002D0D8();
    __int128 v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v101 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_ERROR,  "Failed to complete modify operation. Error %@",  buf,  0xCu);
    }

    __int128 v64 = *(void **)(a1 + 32);
    __int128 v65 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) identifier]);
    __int128 v66 = (void *)objc_claimAutoreleasedReturnValue([v64 taskOfType:1 identifier:v65]);

    if (v66)
    {
      __int128 v67 = *(void **)(a1 + 32);
      __int128 v68 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) identifier]);
      [v67 removeTaskOfType:1 forIdentifier:v68 error:0];
    }

    id obj = (id)objc_claimAutoreleasedReturnValue(+[SHLError errorWithUnderlyingError:](&OBJC_CLASS___SHLError, "errorWithUnderlyingError:", v9));
    id v28 = -[SHLTaskOutcome initWithError:](objc_alloc(&OBJC_CLASS___SHLTaskOutcome), "initWithError:", obj);
    id v69 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) delegate]);
    uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) session]);
    v81 = v69;
    [v69 session:v70 task:*(void *)(a1 + 40) didProduceOutcome:v28];
  }

  else
  {
    id v78 = v7;
    if (v7) {
      id v12 = v7;
    }
    else {
      id v12 = &__NSArray0__struct;
    }
    id v13 = v12;
    id v77 = v8;
    if (v8) {
      double v14 = v8;
    }
    else {
      double v14 = &__NSArray0__struct;
    }
    id v79 = v14;
    v81 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v13 count]));
    v80 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v13 count]));
    __int128 v93 = 0u;
    __int128 v94 = 0u;
    __int128 v95 = 0u;
    __int128 v96 = 0u;
    id obj = v13;
    id v15 = [obj countByEnumeratingWithState:&v93 objects:v99 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v94;
      do
      {
        for (i = 0LL; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v94 != v17) {
            objc_enumerationMutation(obj);
          }
          id v19 = *(void **)(*((void *)&v93 + 1) + 8LL * (void)i);
          uint64_t v20 = -[SHLCloudBackedItem initWithRecord:]( objc_alloc(&OBJC_CLASS___SHLCloudBackedItem),  "initWithRecord:",  v19);
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v19 recordType]);
          unsigned int v22 = [v21 isEqualToString:@"Group"];

          if (v22)
          {
            id v23 = (void *)objc_claimAutoreleasedReturnValue( +[SHLCloudGroupTransformer libraryGroupFromCloudBackedItem:]( &OBJC_CLASS___SHLCloudGroupTransformer,  "libraryGroupFromCloudBackedItem:",  v20));
            if (v23)
            {
              uint64_t v24 = v81;
LABEL_20:
              [v24 addObject:v23];
            }
          }

          else
          {
            uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v19 recordType]);
            unsigned int v26 = [v25 isEqualToString:@"Track"];

            if (!v26) {
              goto LABEL_22;
            }
            id v23 = (void *)objc_claimAutoreleasedReturnValue( +[SHLCloudTrackTransformer libraryTrackFromCloudBackedItem:usingEncryption:]( SHLCloudTrackTransformer,  "libraryTrackFromCloudBackedItem:usingEncryption:",  v20,  [*(id *)(v83 + 48) isEncrypted]));
            if (v23)
            {
              uint64_t v24 = v80;
              goto LABEL_20;
            }
          }

LABEL_22:
        }

        id v16 = [obj countByEnumeratingWithState:&v93 objects:v99 count:16];
      }

      while (v16);
    }

    id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v79 count]));
    __int128 v89 = 0u;
    __int128 v90 = 0u;
    __int128 v91 = 0u;
    __int128 v92 = 0u;
    id v28 = (SHLTaskOutcome *)v79;
    id v29 = -[SHLTaskOutcome countByEnumeratingWithState:objects:count:]( v28,  "countByEnumeratingWithState:objects:count:",  &v89,  v98,  16LL);
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v90;
      do
      {
        for (j = 0LL; j != v30; j = (char *)j + 1)
        {
          if (*(void *)v90 != v31) {
            objc_enumerationMutation(v28);
          }
          __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v89 + 1) + 8 * (void)j) recordName]);
          [v27 addObject:v33];
        }

        id v30 = -[SHLTaskOutcome countByEnumeratingWithState:objects:count:]( v28,  "countByEnumeratingWithState:objects:count:",  &v89,  v98,  16LL);
      }

      while (v30);
    }

    if ([v81 count])
    {
      id v34 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v83 + 40) delegate]);
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v83 + 40) session]);
      uint64_t v36 = *(void *)(v83 + 40);
      id v37 = [v81 copy];
      [v34 session:v35 task:v36 didModifyGroups:v37];
    }

    if ([v80 count])
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v83 + 40) delegate]);
      v39 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v83 + 40) session]);
      uint64_t v40 = *(void *)(v83 + 40);
      id v41 = [v80 copy];
      [v38 session:v39 task:v40 didModifyTracks:v41];
    }

    if ([v27 count])
    {
      uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v83 + 40) delegate]);
      unsigned __int8 v43 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v83 + 40) session]);
      uint64_t v44 = *(void *)(v83 + 40);
      id v45 = [v27 copy];
      [v42 session:v43 task:v44 didDeleteItemsWithIdentifiers:v45];
    }

    if (v9)
    {
      __int128 v76 = -[SHLModifyTaskRecovery initWithOriginalTask:savedGroups:savedTracks:deletedIDs:error:]( objc_alloc(&OBJC_CLASS___SHLModifyTaskRecovery),  "initWithOriginalTask:savedGroups:savedTracks:deletedIDs:error:",  *(void *)(v83 + 40),  v81,  v80,  v27,  v9);
      id v46 = (void *)objc_claimAutoreleasedReturnValue(-[SHLModifyTaskRecovery recoverableTasks](v76, "recoverableTasks"));
      __int128 v85 = 0u;
      __int128 v86 = 0u;
      __int128 v87 = 0u;
      __int128 v88 = 0u;
      id v47 = [v46 countByEnumeratingWithState:&v85 objects:v97 count:16];
      if (v47)
      {
        id v48 = v47;
        uint64_t v49 = *(void *)v86;
        do
        {
          for (k = 0LL; k != v48; k = (char *)k + 1)
          {
            if (*(void *)v86 != v49) {
              objc_enumerationMutation(v46);
            }
            uint64_t v51 = *(void *)(*((void *)&v85 + 1) + 8LL * (void)k);
            id v52 = *(void **)(v83 + 32);
            id v84 = 0LL;
            unsigned __int8 v53 = [v52 storeTask:v51 ofType:1 error:&v84];
            id v54 = v84;
            if ((v53 & 1) == 0)
            {
              id v55 = sub_10002D0D8();
              id v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
              if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                id v101 = v54;
                _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_ERROR,  "Failed to store the retry modification task with error %{public}@",  buf,  0xCu);
              }
            }
          }

          id v48 = [v46 countByEnumeratingWithState:&v85 objects:v97 count:16];
        }

        while (v48);
      }

      uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue(+[SHLError errorWithUnderlyingError:](&OBJC_CLASS___SHLError, "errorWithUnderlyingError:", v9));
      __int16 v58 = -[SHLTaskOutcome initWithTasksToRetry:error:]( objc_alloc(&OBJC_CLASS___SHLTaskOutcome),  "initWithTasksToRetry:error:",  v46,  v57);
      id v59 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v83 + 40) delegate]);
      id v60 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v83 + 40) session]);
      [v59 session:v60 task:*(void *)(v83 + 40) didProduceOutcome:v58];

      id v8 = v77;
      id v7 = v78;
      __int128 v61 = (SHLTaskOutcome *)v76;
    }

    else
    {
      __int128 v71 = *(void **)(v83 + 32);
      v72 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v83 + 40) identifier]);
      v73 = (void *)objc_claimAutoreleasedReturnValue([v71 taskOfType:1 identifier:v72]);

      if (v73)
      {
        id v74 = *(void **)(v83 + 32);
        id v75 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v83 + 40) identifier]);
        [v74 removeTaskOfType:1 forIdentifier:v75 error:0];
      }

      __int128 v61 = objc_alloc_init(&OBJC_CLASS___SHLTaskOutcome);
      id v46 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v83 + 40) delegate]);
      uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v83 + 40) session]);
      [v46 session:v57 task:*(void *)(v83 + 40) didProduceOutcome:v61];
      id v7 = v78;
    }

    uint64_t v70 = v80;
  }
}

void sub_10002AD34(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___SHLCloudContext);
  uint64_t v2 = (void *)qword_1000889B8;
  qword_1000889B8 = (uint64_t)v1;
}

void sub_10002C1EC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (a3) {
    a3 = (void *)objc_claimAutoreleasedReturnValue( +[SHError errorWithCode:underlyingError:]( &OBJC_CLASS___SHError,  "errorWithCode:underlyingError:",  400LL,  a3));
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10002C488(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8 = a2;
  id v7 = a3;
  if (a4) {
    a4 = (void *)objc_claimAutoreleasedReturnValue( +[SHError errorWithCode:underlyingError:]( &OBJC_CLASS___SHError,  "errorWithCode:underlyingError:",  400LL,  a4));
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10002CBB8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([a4 userInfo]);
    id v6 = (id)objc_claimAutoreleasedReturnValue([v5 objectForKey:CKPartialErrorsByItemIDKey]);

    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10002CC74;
    v7[3] = &unk_10006D960;
    id v8 = *(id *)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    [v6 enumerateKeysAndObjectsUsingBlock:v7];
  }

void sub_10002CC74(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = [a3 code];
  id v6 = v11;
  if (v5 != (id)15)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKey:v11]);
    id v8 = v7;
    if (v7)
    {
      id v9 = *(void **)(a1 + 40);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneName]);
      [v9 removeSubscriptionForZoneIdentifier:v10 error:0];
    }

    id v6 = v11;
  }
}

id sub_10002D0D8()
{
  unsigned __int8 v0 = atomic_load((unsigned __int8 *)&qword_1000889D0);
  if ((v0 & 1) == 0 && __cxa_guard_acquire(&qword_1000889D0))
  {
    qword_1000889C8 = (uint64_t)os_log_create( "com.apple.shazam.ShazamLibrary",  (const char *)[@"Library" cStringUsingEncoding:4]);
    __cxa_guard_release(&qword_1000889D0);
  }

  return (id)qword_1000889C8;
}

void sub_10002D14C(_Unwind_Exception *a1)
{
}

void sub_10002D24C(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 isSatisfied])
  {
    id v3 = [*(id *)(a1 + 32) mutableCopy];
    [v3 removeObjectAtIndex:0];
    [*(id *)(a1 + 48) evaluatePreconditions:v3 withCompletion:*(void *)(a1 + 40)];
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
}

void sub_10002D390(id a1)
{
  uint64_t v1 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS____SHMediaLibrary));
  id v4 = (id)objc_claimAutoreleasedReturnValue(v1);
  uint64_t v2 = objc_claimAutoreleasedReturnValue([v4 URLForResource:@"ShazamLibrary" withExtension:@"momd"]);
  id v3 = (void *)qword_1000889D8;
  qword_1000889D8 = v2;
}

void sub_10002D934(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SHLTaskPreconditionResult failedResult](&OBJC_CLASS___SHLTaskPreconditionResult, "failedResult"));
  switch(a2)
  {
    case 0LL:
      id v7 = sub_10002D0D8();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v21 = 138412290;
        id v22 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Failed to retrieve iCloud account information with error %@",  (uint8_t *)&v21,  0xCu);
      }

      if (v5)
      {
        uint64_t v9 = objc_claimAutoreleasedReturnValue( +[SHLTaskPreconditionResult resultWithError:]( &OBJC_CLASS___SHLTaskPreconditionResult,  "resultWithError:",  v5));
        goto LABEL_19;
      }

      break;
    case 1LL:
      id v10 = sub_10002D0D8();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
        goto LABEL_18;
      }
      LOWORD(v21) = 0;
      id v12 = "iCloud account is available";
      goto LABEL_17;
    case 2LL:
      id v13 = sub_10002D0D8();
      double v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        LOWORD(v21) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "iCloud account is restricted",  (uint8_t *)&v21,  2u);
      }

      uint64_t v15 = 1LL;
      goto LABEL_14;
    case 3LL:
      id v16 = sub_10002D0D8();
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        LOWORD(v21) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "No iCloud account available",  (uint8_t *)&v21,  2u);
      }

      uint64_t v15 = 0LL;
LABEL_14:
      uint64_t v18 = objc_claimAutoreleasedReturnValue(+[SHLError errorWithCode:](&OBJC_CLASS___SHLError, "errorWithCode:", v15));
      uint64_t v19 = objc_claimAutoreleasedReturnValue( +[SHLTaskPreconditionResult resultWithError:]( &OBJC_CLASS___SHLTaskPreconditionResult,  "resultWithError:",  v18));

      id v6 = (void *)v18;
      goto LABEL_20;
    case 4LL:
      id v20 = sub_10002D0D8();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        LOWORD(v21) = 0;
        id v12 = "iCloud account is temporarily unavailable";
LABEL_17:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v21, 2u);
      }

LABEL_18:
      uint64_t v9 = objc_claimAutoreleasedReturnValue(+[SHLTaskPreconditionResult fulfilledResult](&OBJC_CLASS___SHLTaskPreconditionResult, "fulfilledResult"));
LABEL_19:
      uint64_t v19 = v9;
LABEL_20:

      id v6 = (void *)v19;
      break;
    default:
      break;
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

BOOL sub_10002DCE8(id a1, SHMediaLibraryChange *a2)
{
  uint64_t v2 = a2;
  if (-[SHMediaLibraryChange changeType](v2, "changeType") == (id)1)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryChange libraryItem](v2, "libraryItem"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 lastUpdatedDate]);
    BOOL v5 = v4 == 0LL;
  }

  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

void sub_10002DE50(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = objc_alloc(&OBJC_CLASS___SHMediaLibrarySnapshot);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithArray:](&OBJC_CLASS___NSOrderedSet, "orderedSetWithArray:", v6));

  uint64_t v9 = -[SHMediaLibrarySnapshot initWithChanges:](v7, "initWithChanges:", v8);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10002E1C8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v34 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v5 count]));
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v41;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v41 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)i);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 shazamID]);

        if (v13)
        {
          double v14 = (void *)objc_claimAutoreleasedReturnValue([v12 shazamID]);
          [v6 setObject:v12 forKey:v14];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }

    while (v9);
  }

  __int128 v32 = v7;

  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [*(id *)(a1 + 32) count]));
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  uint64_t v33 = a1;
  id v15 = *(id *)(a1 + 32);
  id v16 = [v15 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v37;
    do
    {
      for (j = 0LL; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v37 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * (void)j), "copy", v32);
        int v21 = (void *)objc_claimAutoreleasedReturnValue([v20 libraryItem]);
        id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 shazamKey]);

        if (v22)
        {
          id v23 = (void *)objc_claimAutoreleasedReturnValue([v20 libraryItem]);
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 shazamKey]);
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 validatedKey]);
          unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v25]);

          if (v26)
          {
            id v27 = (void *)objc_claimAutoreleasedReturnValue([v20 libraryItem]);
            [v27 updateWithMediaItem:v26];

            id v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
            id v29 = (void *)objc_claimAutoreleasedReturnValue([v20 libraryItem]);
            [v29 setLastUpdatedDate:v28];

            [v35 addObject:v20];
          }
        }
      }

      id v17 = [v15 countByEnumeratingWithState:&v36 objects:v44 count:16];
    }

    while (v17);
  }

  uint64_t v30 = *(void *)(v33 + 40);
  id v31 = [v35 copy];
  (*(void (**)(uint64_t, id, id))(v30 + 16))(v30, v31, v34);
}

LABEL_17:
      }

      id v11 = [v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }

    while (v11);
  }

  id v20 = [v24 copy];
  return v20;
}

void sub_100030D70( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, id location)
{
}

void sub_100030DA8(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v7 = WeakRetained;
  if ((a2 & 1) == 0)
  {
    uint64_t v8 = sh_log_object(WeakRetained);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v12 = 138412546;
      uint64_t v13 = v10;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Failed to start recorder %@ with error: %@",  (uint8_t *)&v12,  0x16u);
    }

    [*(id *)(a1 + 40) addObject:*(void *)(a1 + 32)];
  }

  id v11 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue([v7 startRecognitionGroup]);
  dispatch_group_leave(v11);
}

LABEL_25:
    goto LABEL_26;
  }

  int v12 = 0LL;
LABEL_26:

  return v12;
}

void sub_100033E54( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_100033E90(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) tasksToRetry]);
  [WeakRetained retryFailedTasks:v2];
}

void sub_100033FDC(uint64_t a1, int a2)
{
  id v4 = sub_10002D0D8();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = (objc_class *)objc_opt_class(*(void *)(a1 + 32));
    id v7 = NSStringFromClass(v6);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)uint64_t v30 = a2;
    *(_WORD *)&v30[4] = 2114;
    *(void *)&v30[6] = v8;
    *(_WORD *)&v30[14] = 2112;
    *(void *)&v30[16] = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "Client called Library completion with success = %d for <task: %{public}@ %@>",  buf,  0x1Cu);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) syncSession]);
  id v11 = v10;
  if (a2)
  {
    uint64_t v28 = 0LL;
    int v12 = (id *)&v28;
    [v10 commitTransactionWithError:&v28];
  }

  else
  {
    uint64_t v27 = 0LL;
    int v12 = (id *)&v27;
    [v10 undoTransactionWithError:&v27];
  }

  id v13 = *v12;

  id v14 = sub_10002D0D8();
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  id v16 = v15;
  if (v13)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v17 = (objc_class *)objc_opt_class(*(void *)(a1 + 32));
      uint64_t v18 = NSStringFromClass(v17);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      id v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
      *(_DWORD *)buf = 138543874;
      *(void *)uint64_t v30 = v19;
      *(_WORD *)&v30[8] = 2112;
      *(void *)&v30[10] = v20;
      *(_WORD *)&v30[18] = 2112;
      *(void *)&v30[20] = v13;
      int v21 = "Error finishing transaction for <task: %{public}@ %@> %@";
      id v22 = v16;
      os_log_type_t v23 = OS_LOG_TYPE_ERROR;
      uint32_t v24 = 32;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v22, v23, v21, buf, v24);
    }
  }

  else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v25 = (objc_class *)objc_opt_class(*(void *)(a1 + 32));
    unsigned int v26 = NSStringFromClass(v25);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v26);
    id v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
    *(_DWORD *)buf = 138543618;
    *(void *)uint64_t v30 = v19;
    *(_WORD *)&v30[8] = 2112;
    *(void *)&v30[10] = v20;
    int v21 = "Finished handling transaction for <task: %{public}@ %@>";
    id v22 = v16;
    os_log_type_t v23 = OS_LOG_TYPE_DEBUG;
    uint32_t v24 = 22;
    goto LABEL_11;
  }
}

void sub_10003516C(id a1)
{
  uint64_t v1 = objc_alloc(&OBJC_CLASS___SHLShazamLibrary);
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);
  id v3 = -[SHLShazamLibrary initWithScope:callingProcessIdentifier:]( v1,  "initWithScope:callingProcessIdentifier:",  0LL,  v2);
  id v4 = (void *)qword_1000889E8;
  qword_1000889E8 = (uint64_t)v3;
}

LABEL_14:
    id v7 = 0LL;
    goto LABEL_15;
  }

  id v4 = -[SHMediaLibraryClient isEntitledForSPI](self, "isEntitledForSPI");
  if (!v4)
  {
    id v11 = -[SHMediaLibraryClient isTeamIdentifierValid](self, "isTeamIdentifierValid");
    int v12 = v11;
    id v13 = sh_log_object(v11);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    id v14 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v14)
      {
        *(_WORD *)id v16 = 0;
        id v7 = 2LL;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Public Media Library client", v16, 2u);
      }

      else
      {
        id v7 = 2LL;
      }

      goto LABEL_15;
    }

    if (v14)
    {
      *(_WORD *)id v17 = 0;
      id v9 = "Invalid Media Library client, team id is not valid";
      uint64_t v10 = v17;
      goto LABEL_13;
    }

    goto LABEL_14;
  }

  id v5 = sh_log_object(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Entitled Media Library client", buf, 2u);
  }

  id v7 = 1LL;
LABEL_15:

  return v7;
}

void sub_100036554(_Unwind_Exception *a1)
{
}

void sub_100036578(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100036684;
  v10[3] = &unk_10006DBB0;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  id v8 = v5;
  id v11 = v8;
  id v13 = *(id *)(a1 + 32);
  id v9 = v6;
  id v12 = v9;
  [WeakRetained fetchAccountTokensWithAccountInfo:v8 completion:v10];

  objc_destroyWeak(&v14);
}

void sub_100036670(_Unwind_Exception *a1)
{
}

void sub_100036684(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v2 = -[SHMediaLibraryInfo initWithStatus:encrypted:]( [SHMediaLibraryInfo alloc],  "initWithStatus:encrypted:",  +[SHMediaLibraryInfoFetcher libraryStatusForAccountStatus:]( SHMediaLibraryInfoFetcher,  "libraryStatusForAccountStatus:",  [*(id *)(a1 + 32) accountStatus]),  objc_msgSend(*(id *)(a1 + 32), "supportsDeviceToDeviceEncryption"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained currentUserID]);
  -[SHMediaLibraryInfo setIdentityToken:](v2, "setIdentityToken:", v3);

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_100036874( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100036898(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = v5;
  if (!v5) {
    goto LABEL_6;
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 domain]);
  if (([v7 isEqualToString:CKErrorDomain] & 1) == 0)
  {

    goto LABEL_6;
  }

  id v8 = [v6 code];

  if (v8 != (id)9)
  {
LABEL_6:
    id v9 = (id)objc_claimAutoreleasedReturnValue([v11 recordName]);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained setCurrentUserID:v9];

    goto LABEL_7;
  }

  id v9 = objc_loadWeakRetained((id *)(a1 + 40));
  [v9 setCurrentUserID:0];
LABEL_7:

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100037C60(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 zoneName]);
  LOBYTE(v4) = [v4 zoneExistsForIdentifier:v5];

  if ((v4 & 1) == 0)
  {
    id v6 = sub_10002D0D8();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 zoneName]);
      *(_DWORD *)buf = 138412290;
      id v20 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "<zone: %@> does not exist locally, saving now",  buf,  0xCu);
    }

    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v3 zoneName]);
    id v18 = 0LL;
    unsigned __int8 v11 = [v9 storeZoneIdentifier:v10 error:&v18];
    id v12 = v18;

    if ((v11 & 1) == 0)
    {
      id v13 = sub_10002D0D8();
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v3 zoneName]);
        *(_DWORD *)buf = 138412546;
        id v20 = v15;
        __int16 v21 = 2114;
        id v22 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Failed store store zone identifier for %@, with error %{public}@",  buf,  0x16u);
      }
    }
  }

  id v16 = -[CKRecordZone initWithZoneID:](objc_alloc(&OBJC_CLASS___CKRecordZone), "initWithZoneID:", v3);
  id v17 = -[SHLCloudBackedZone initWithZone:](objc_alloc(&OBJC_CLASS___SHLCloudBackedZone), "initWithZone:", v16);
  [*(id *)(a1 + 40) addObject:v17];
}

void sub_100037E50(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10002D0D8();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 zoneName]);
    *(_DWORD *)buf = 138412290;
    id v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<zone: %@> was deleted", buf, 0xCu);
  }

  id v7 = *(void **)(a1 + 32);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 zoneName]);
  id v18 = 0LL;
  unsigned __int8 v9 = [v7 removeZoneIdentifier:v8 error:&v18];
  id v10 = v18;

  if ((v9 & 1) == 0)
  {
    id v11 = sub_10002D0D8();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v3 zoneName]);
      *(_DWORD *)buf = 138412546;
      id v20 = v13;
      __int16 v21 = 2114;
      id v22 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to remove zone identifier for %@, with error %{public}@",  buf,  0x16u);
    }
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[SHLError errorWithCode:](&OBJC_CLASS___SHLError, "errorWithCode:", 7LL));
  id v15 = -[SHLTaskOutcome initWithError:](objc_alloc(&OBJC_CLASS___SHLTaskOutcome), "initWithError:", v14);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) delegate]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) session]);
  [v16 session:v17 task:*(void *)(a1 + 40) didProduceOutcome:v15];
}

void sub_100038050(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10002D0D8();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 zoneName]);
    *(_DWORD *)buf = 138412290;
    id v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<zone: %@> was purged", buf, 0xCu);
  }

  id v7 = *(void **)(a1 + 32);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 zoneName]);
  id v18 = 0LL;
  unsigned __int8 v9 = [v7 removeZoneIdentifier:v8 error:&v18];
  id v10 = v18;

  if ((v9 & 1) == 0)
  {
    id v11 = sub_10002D0D8();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v3 zoneName]);
      *(_DWORD *)buf = 138412546;
      id v20 = v13;
      __int16 v21 = 2114;
      id v22 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to remove zone identifier for %@, with error %{public}@",  buf,  0x16u);
    }
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[SHLError errorWithCode:](&OBJC_CLASS___SHLError, "errorWithCode:", 8LL));
  id v15 = -[SHLTaskOutcome initWithError:](objc_alloc(&OBJC_CLASS___SHLTaskOutcome), "initWithError:", v14);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) delegate]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) session]);
  [v16 session:v17 task:*(void *)(a1 + 40) didProduceOutcome:v15];
}

void sub_100038250(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if (v6)
  {
    id v8 = sub_10002D0D8();
    unsigned __int8 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v21 = 138412290;
      id v22 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "Updated database <token: %@>",  (uint8_t *)&v21,  0xCu);
    }

    id v10 = -[SHLCloudBackedToken initWithToken:](objc_alloc(&OBJC_CLASS___SHLCloudBackedToken), "initWithToken:", v6);
    [*(id *)(a1 + 32) storeDatabaseToken:v10 error:0];
  }

  if ([*(id *)(a1 + 40) count])
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }

  else
  {
    id v11 = *(void **)(a1 + 32);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) identifier]);
    [v11 removeTaskOfType:0 forIdentifier:v12 error:0];

    id v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) progress]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) progress]);
    objc_msgSend(v13, "setCompletedUnitCount:", (char *)objc_msgSend(v14, "completedUnitCount") + 1);

    if (v7)
    {
      if ([v7 code] == (id)21) {
        [*(id *)(a1 + 32) removeDatabaseTokenWithError:0];
      }
      id v15 = (SHLTaskOutcome *)objc_claimAutoreleasedReturnValue( +[SHLError errorWithUnderlyingError:]( &OBJC_CLASS___SHLError,  "errorWithUnderlyingError:",  v7));
      id v16 = -[SHLTaskOutcome initWithError:](objc_alloc(&OBJC_CLASS___SHLTaskOutcome), "initWithError:", v15);
      id v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) delegate]);
      id v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) session]);
      [v17 session:v18 task:*(void *)(a1 + 48) didProduceOutcome:v16];

      (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
    }

    else
    {
      id v15 = objc_alloc_init(&OBJC_CLASS___SHLTaskOutcome);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) delegate]);
      id v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) session]);
      [v19 session:v20 task:*(void *)(a1 + 48) didProduceOutcome:v15];

      (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
    }
  }
}

void sub_1000389AC(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = -[SHLCloudBackedItem initWithRecord:](objc_alloc(&OBJC_CLASS___SHLCloudBackedItem), "initWithRecord:", v6);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 recordType]);
    unsigned int v9 = [v8 isEqualToString:@"Group"];

    if (v9)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SHLCloudGroupTransformer libraryGroupFromCloudBackedItem:]( &OBJC_CLASS___SHLCloudGroupTransformer,  "libraryGroupFromCloudBackedItem:",  v7));
      if (v10)
      {
        id v11 = a1 + 4;
LABEL_10:
        [*v11 addObject:v10];
        goto LABEL_11;
      }

      goto LABEL_11;
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 recordType]);
    unsigned int v15 = [v14 isEqualToString:@"Track"];

    if (v15)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SHLCloudTrackTransformer libraryTrackFromCloudBackedItem:usingEncryption:]( SHLCloudTrackTransformer,  "libraryTrackFromCloudBackedItem:usingEncryption:",  v7,  [a1[5] isEncrypted]));
      if (v10)
      {
        id v11 = a1 + 6;
        goto LABEL_10;
      }

void sub_100038B60(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = (id)objc_claimAutoreleasedReturnValue([a2 recordName]);
  [v2 addObject:v3];
}

void sub_100038BA4(uint64_t a1, void *a2, void *a3)
{
  if (a3)
  {
    id v5 = a3;
    id v6 = a2;
    unsigned int v9 = -[SHLCloudBackedToken initWithToken:](objc_alloc(&OBJC_CLASS___SHLCloudBackedToken), "initWithToken:", v5);

    id v7 = *(void **)(a1 + 32);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneName]);

    [v7 storeZoneToken:v9 forZoneIdentifier:v8 error:0];
  }

void sub_100038C40(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v9 = a2;
  id v10 = a3;
  if (v10)
  {
    id v11 = sub_10002D0D8();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneName]);
      int v21 = 138543618;
      id v22 = v13;
      __int16 v23 = 2112;
      id v24 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "Updated <zone: %{public}@> token: %@>",  (uint8_t *)&v21,  0x16u);
    }

    id v14 = -[SHLCloudBackedToken initWithToken:](objc_alloc(&OBJC_CLASS___SHLCloudBackedToken), "initWithToken:", v10);
    unsigned int v15 = *(void **)(a1 + 32);
    int v16 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneName]);
    [v15 storeZoneToken:v14 forZoneIdentifier:v16 error:0];

LABEL_9:
    goto LABEL_10;
  }

  if ([a6 code] == (id)21)
  {
    id v17 = sub_10002D0D8();
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneName]);
      int v21 = 138543362;
      id v22 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "<zone: %{public}@> token has expired. Removing saved token",  (uint8_t *)&v21,  0xCu);
    }

    id v20 = *(void **)(a1 + 32);
    id v14 = (SHLCloudBackedToken *)objc_claimAutoreleasedReturnValue([v9 zoneName]);
    [v20 removeTokenForZoneIdentifier:v14 error:0];
    goto LABEL_9;
  }

LABEL_10:
}

void sub_100038E18(uint64_t a1, void *a2)
{
  id v25 = a2;
  id v3 = *(void **)(a1 + 32);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) identifier]);
  [v3 removeTaskOfType:0 forIdentifier:v4 error:0];

  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) progress]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) progress]);
  objc_msgSend(v5, "setCompletedUnitCount:", (char *)objc_msgSend(v6, "completedUnitCount") + 1);

  if ([*(id *)(a1 + 48) count])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) delegate]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) session]);
    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = [*(id *)(a1 + 48) copy];
    [v7 session:v8 task:v9 didFetchGroups:v10];
  }

  if ([*(id *)(a1 + 56) count])
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) delegate]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) session]);
    uint64_t v13 = *(void *)(a1 + 40);
    id v14 = [*(id *)(a1 + 56) copy];
    [v11 session:v12 task:v13 didFetchTracks:v14];
  }

  if ([*(id *)(a1 + 64) count])
  {
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) delegate]);
    int v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) session]);
    uint64_t v17 = *(void *)(a1 + 40);
    id v18 = [*(id *)(a1 + 64) copy];
    [v15 session:v16 task:v17 didFetchDeletedItemsWithIdentifiers:v18];
  }

  uint64_t v19 = objc_alloc_init(&OBJC_CLASS___SHLTaskOutcome);
  if (v25)
  {
    id v20 = objc_alloc(&OBJC_CLASS___SHLTaskOutcome);
    int v21 = (void *)objc_claimAutoreleasedReturnValue(+[SHLError errorWithUnderlyingError:](&OBJC_CLASS___SHLError, "errorWithUnderlyingError:", v25));
    id v22 = -[SHLTaskOutcome initWithError:](v20, "initWithError:", v21);

    uint64_t v19 = v22;
  }

  __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) delegate]);
  id v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) session]);
  [v23 session:v24 task:*(void *)(a1 + 40) didProduceOutcome:v19];
}

void sub_10003A2E0(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (([v3 isSatisfied] & 1) == 0)
  {
    id v7 = sub_10002D0D8();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = (objc_class *)objc_opt_class(a1[4]);
      id v10 = NSStringFromClass(v9);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([a1[4] identifier]);
      *(_DWORD *)buf = 138543618;
      id v25 = v11;
      __int16 v26 = 2112;
      uint64_t v27 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Failed to schedule <task: %{public}@ %@> pre-conditions were not satisifed",  buf,  0x16u);
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v3 error]);
    id v14 = v13;
    if (v13) {
      id v15 = v13;
    }
    else {
      id v15 = (id)objc_claimAutoreleasedReturnValue(+[SHLError errorWithCode:](&OBJC_CLASS___SHLError, "errorWithCode:", 5LL));
    }
    id v6 = v15;

    int v16 = objc_alloc(&OBJC_CLASS___SHLTaskOutcome);
    id v23 = a1[4];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v23, 1LL));
    id v18 = -[SHLTaskOutcome initWithTasksToRetry:error:](v16, "initWithTasksToRetry:error:", v17, v6);

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([a1[4] delegate]);
    [v19 session:WeakRetained task:a1[4] didProduceOutcome:v18];

    goto LABEL_10;
  }

  if (WeakRetained)
  {
    id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([WeakRetained sessionDispatchQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10003A518;
    block[3] = &unk_10006CE28;
    id v21 = a1[5];
    id v22 = a1[4];
    dispatch_async(v5, block);

    id v6 = v21;
LABEL_10:
  }
}

id sub_10003A518(uint64_t a1)
{
  return [*(id *)(a1 + 32) scheduleModifyTask:*(void *)(a1 + 40)];
}

void sub_10003A6DC(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (([v3 isSatisfied] & 1) == 0)
  {
    id v7 = sub_10002D0D8();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = (objc_class *)objc_opt_class(a1[4]);
      id v10 = NSStringFromClass(v9);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([a1[4] identifier]);
      *(_DWORD *)buf = 138543618;
      id v22 = v11;
      __int16 v23 = 2112;
      id v24 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Failed to schedule <task: %{public}@ %@> pre-conditions were not satisifed",  buf,  0x16u);
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v3 error]);
    id v14 = v13;
    if (v13) {
      id v15 = v13;
    }
    else {
      id v15 = (id)objc_claimAutoreleasedReturnValue(+[SHLError errorWithCode:](&OBJC_CLASS___SHLError, "errorWithCode:", 5LL));
    }
    id v6 = v15;

    int v16 = -[SHLTaskOutcome initWithError:](objc_alloc(&OBJC_CLASS___SHLTaskOutcome), "initWithError:", v6);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([a1[4] delegate]);
    [v17 session:WeakRetained task:a1[4] didProduceOutcome:v16];

    goto LABEL_10;
  }

  if (WeakRetained)
  {
    id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([WeakRetained sessionDispatchQueue]);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10003A8E0;
    v18[3] = &unk_10006CE28;
    id v19 = a1[5];
    id v20 = a1[4];
    dispatch_async(v5, v18);

    id v6 = v19;
LABEL_10:
  }
}

id sub_10003A8E0(uint64_t a1)
{
  return [*(id *)(a1 + 32) scheduleFetchTask:*(void *)(a1 + 40)];
}

void sub_10003ABD8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_10003ABFC(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](&OBJC_CLASS___NSData, "dataWithContentsOfURL:", a2));
  }

  else
  {
    uint64_t v8 = sh_log_object(v5);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) artworkURL]);
      int v12 = 138412546;
      uint64_t v13 = v10;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "Unable to download image URL %@ error %@",  (uint8_t *)&v12,  0x16u);
    }

    id v7 = 0LL;
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained deliverContentForMatchedMediaItem:*(void *)(a1 + 32) imageData:v7 completion:*(void *)(a1 + 40)];
}

void sub_10003B004(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v7 = sh_log_object(v5, v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 138412802;
    uint64_t v11 = v9;
    __int16 v12 = 1024;
    int v13 = a2;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "Bulletin %@ presented {successfully=%i, error=%@}",  (uint8_t *)&v10,  0x1Cu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_10003C3A0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  if (v5)
  {
    id v6 = sub_10002D0D8();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Failed to complete zone operation. Error %@",  buf,  0xCu);
    }

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:CKPartialErrorsByItemIDKey]);

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10003C4D4;
    v10[3] = &unk_10006DDC8;
    id v11 = *(id *)(a1 + 32);
    [v9 enumerateKeysAndObjectsUsingBlock:v10];
  }
}

void sub_10003C4D4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = (id)objc_claimAutoreleasedReturnValue([a2 zoneName]);
  [v2 removeZoneIdentifier:v3 error:0];
}

void sub_10003C948( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_10003C96C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 adamIDURL]);
    if (v8)
    {

LABEL_5:
      uint64_t v10 = sh_log_object(v6);
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        LOWORD(v17) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Making request to fetch song attributes",  (uint8_t *)&v17,  2u);
      }

      __int16 v12 = -[SHHapticsEndpointRequest initWithRequestMediaItem:hapticsEndpoint:]( objc_alloc(&OBJC_CLASS___SHHapticsEndpointRequest),  "initWithRequestMediaItem:hapticsEndpoint:",  *(void *)(a1 + 32),  v5);
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained networkRequester]);
      [v14 performHapticsTrackAvailabilityRequest:v12 completionHandler:*(void *)(a1 + 40)];

      goto LABEL_11;
    }

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 isrcURL]);

    if (v9) {
      goto LABEL_5;
    }
  }

  uint64_t v15 = sh_log_object(v6);
  int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    int v17 = 138412290;
    id v18 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Not requesting for haptics availability because endpoint is missing required URLs. Error: %@",  (uint8_t *)&v17,  0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
LABEL_11:
}

void sub_10003CC50( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_10003CC74(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 adamIDURL]);
    if (v8)
    {

LABEL_5:
      uint64_t v33 = v7;
      __int128 v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [*(id *)(a1 + 32) count]));
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [*(id *)(a1 + 32) count]));
      context = objc_autoreleasePoolPush();
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      uint64_t v34 = a1;
      id obj = *(id *)(a1 + 32);
      id v11 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
      id v35 = v5;
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v42;
        do
        {
          for (i = 0LL; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v42 != v13) {
              objc_enumerationMutation(obj);
            }
            uint64_t v15 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)i);
            int v16 = (void *)objc_claimAutoreleasedReturnValue( +[SHHapticsProviderUtilities cachedHapticTracksForMediaItem:]( &OBJC_CLASS___SHHapticsProviderUtilities,  "cachedHapticTracksForMediaItem:",  v15));
            if ([v16 count]
              && (id WeakRetained = objc_loadWeakRetained((id *)(v34 + 48)),
                  unsigned int v18 = [WeakRetained allowsCachedAssets],
                  WeakRetained,
                  v18))
            {
              uint64_t v20 = sh_log_object(v19);
              id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
              {
                id v22 = [v16 count];
                __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v15 properties]);
                *(_DWORD *)buf = 134218242;
                id v46 = v22;
                __int16 v47 = 2112;
                id v48 = v23;
                _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "Retrieved cached %lu haptic tracks for media item: %@",  buf,  0x16u);

                id v5 = v35;
              }

              id v24 = (SHHapticsEndpointRequest *)[[SHHaptic alloc] initWithHapticTracks:v16 representingMediaItem:v15 spatialOffsets:&__NSArray0__struct error:0];
              id v25 = v36;
            }

            else
            {
              id v24 = -[SHHapticsEndpointRequest initWithRequestMediaItem:hapticsEndpoint:]( objc_alloc(&OBJC_CLASS___SHHapticsEndpointRequest),  "initWithRequestMediaItem:hapticsEndpoint:",  v15,  v5);
              id v25 = v10;
            }

            [v25 addObject:v24];
          }

          id v12 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
        }

        while (v12);
      }

      id v26 = objc_loadWeakRetained((id *)(v34 + 48));
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 networkRequester]);
      id v28 = [v10 copy];
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472LL;
      v38[2] = sub_10003D064;
      v38[3] = &unk_10006DE40;
      id v40 = *(id *)(v34 + 40);
      id v29 = v36;
      id v39 = v29;
      [v27 performRequests:v28 completionHandler:v38];

      objc_autoreleasePoolPop(context);
      id v5 = v35;
      uint64_t v7 = v33;
      goto LABEL_22;
    }

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 isrcURL]);

    if (v9) {
      goto LABEL_5;
    }
  }

  uint64_t v30 = sh_log_object(v6);
  id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v46 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "Not requesting for haptics cause endpoint is missing. Error: %@",  buf,  0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
LABEL_22:
}

void sub_10003D064(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[SHHapticsProviderUtilities hapticsFromDownloadResponses:]( &OBJC_CLASS___SHHapticsProviderUtilities,  "hapticsFromDownloadResponses:",  a2));
    [v7 addObjectsFromArray:v8];

    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = [*(id *)(a1 + 32) copy];
    (*(void (**)(uint64_t, id, void))(v9 + 16))(v9, v10, 0LL);
  }

  else
  {
    uint64_t v11 = sh_log_object(v5);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      __int16 v14 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Error fetching haptics archives %@",  (uint8_t *)&v13,  0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
}

void sub_10003D5D8(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003D67C;
  block[3] = &unk_10006CE28;
  id v4 = *(dispatch_queue_s **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v5 = v3;
  dispatch_sync(v4, block);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

id sub_10003D67C(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
}

void sub_10003D688(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0LL);
}

LABEL_12:
}

        id v21 = 0;
        goto LABEL_13;
      }

      id v21 = 1;
LABEL_13:
      id v22 = [v12 size];
      if ((v21 & 1) != 0 || (uint64_t)v22 >= a3 || !v14)
      {
        [v12 updateProgress];
        [v5 addObject:v12];

        goto LABEL_2;
      }
    }

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v8 firstObject]);
    int v16 = (char *)[v12 size];
    int v17 = &v16[(void)[v15 numberOfItems]];
    __int16 v14 = (uint64_t)v17 <= a3;
    if ((uint64_t)v17 <= a3)
    {
      [v12 setGroupsToModify:v15];
      unsigned int v18 = v8;
      goto LABEL_11;
    }

    goto LABEL_12;
  }

  __int16 v23 = [v5 copy];

  return v23;
}

uint64_t sub_10003E5F0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10003E600(uint64_t a1)
{
}

void sub_10003E608(uint64_t a1)
{
  id v2 = (void (**)(void))objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) retryBlock]);
  v2[2]();

  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

int64_t sub_10003EB60(id a1, SHLLibraryBatch *a2, SHLLibraryBatch *a3)
{
  id v4 = a3;
  int64_t v5 = -[SHLLibraryBatch numberOfItems](a2, "numberOfItems");
  int64_t v6 = -[SHLLibraryBatch numberOfItems](v4, "numberOfItems");

  return v5 < v6;
}

int64_t sub_10003EBB0(id a1, SHLLibraryBatch *a2, SHLLibraryBatch *a3)
{
  id v4 = a3;
  int64_t v5 = -[SHLLibraryBatch numberOfItems](a2, "numberOfItems");
  int64_t v6 = -[SHLLibraryBatch numberOfItems](v4, "numberOfItems");

  return v5 > v6;
}

void sub_10003FF9C(id a1)
{
  uint64_t v1 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  id v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 firstObject]);
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }

  else
  {
    int64_t v6 = NSTemporaryDirectory();
    id v5 = (id)objc_claimAutoreleasedReturnValue(v6);
  }

  id v10 = v5;

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v10));
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 URLByAppendingPathComponent:@"com.apple.shazamd/MusicHaptics"]);
  uint64_t v9 = (void *)qword_1000889F8;
  qword_1000889F8 = v8;
}

void sub_100040080(id a1)
{
  v3[0] = SHHapticPatternAlgorithmDefault;
  v3[1] = SHHapticPatternAlgorithmBalancedMixEnhancedDynamicRange;
  v3[2] = SHHapticPatternAlgorithmPriorityVocalsEnhancedDynamicRange;
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v3, 3LL));
  id v2 = (void *)qword_100088A08;
  qword_100088A08 = v1;
}

void sub_1000404D8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_1000404FC(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 40))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained setAssociatedMatcherController:0];
  }

  id v3 = objc_loadWeakRetained((id *)(a1 + 32));
  [v3 stopRecognition];
}

void sub_100040DC8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100040DEC(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[SHRemoteConfiguration sharedInstance](&OBJC_CLASS___SHRemoteConfiguration, "sharedInstance"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100040F94;
    v11[3] = &unk_10006DFA8;
    id v14 = a1[5];
    id v12 = a1[4];
    objc_copyWeak(&v15, a1 + 6);
    id v13 = v5;
    [v8 endpointsWithCompletion:v11];

    objc_destroyWeak(&v15);
  }

  else
  {
    uint64_t v9 = sh_log_object(v6);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      int v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Missing or invalid host %@", buf, 0xCu);
    }

    (*((void (**)(void))a1[5] + 2))();
  }
}

void sub_100040F78(_Unwind_Exception *a1)
{
}

void sub_100040F94(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 hapticsURLPathForClientIdentifier:*(void *)(a1 + 32) songResourceIDType:1]);
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v5 hapticsURLPathForClientIdentifier:*(void *)(a1 + 32) songResourceIDType:2]);
    uint64_t v9 = (void *)v8;
    if (v7 | v8)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained storefront]);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_10004117C;
      v14[3] = &unk_10006DF80;
      id v15 = (id)v7;
      id v16 = *(id *)(a1 + 40);
      id v17 = v9;
      id v18 = *(id *)(a1 + 48);
      [v11 storefrontCountryCode:v14];
    }

    else
    {
      uint64_t v12 = sh_log_object(v8);
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Missing or invalid haptics endpoint %@",  buf,  0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
    }
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }
}

void sub_10004117C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sh_log_object(v3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138412290;
    id v15 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "Fetching endpoint with storefront %@",  (uint8_t *)&v14,  0xCu);
  }

  if (*(void *)(a1 + 32))
  {
    id v6 = objc_alloc(&OBJC_CLASS___SHTokenizedURL);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) name]);
    uint64_t v8 = -[SHTokenizedURL initWithHost:URLPath:](v6, "initWithHost:URLPath:", v7, *(void *)(a1 + 32));

    -[SHTokenizedURL updateToken:withValue:](v8, "updateToken:withValue:", 3LL, v3);
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  if (*(void *)(a1 + 48))
  {
    uint64_t v9 = objc_alloc(&OBJC_CLASS___SHTokenizedURL);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) name]);
    uint64_t v11 = -[SHTokenizedURL initWithHost:URLPath:](v9, "initWithHost:URLPath:", v10, *(void *)(a1 + 48));

    -[SHTokenizedURL updateToken:withValue:](v11, "updateToken:withValue:", 3LL, v3);
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  uint64_t v12 = *(void *)(a1 + 56);
  id v13 = -[SHHapticsEndpoint initWithAdamIDURL:isrcURL:]( objc_alloc(&OBJC_CLASS___SHHapticsEndpoint),  "initWithAdamIDURL:isrcURL:",  v8,  v11);
  (*(void (**)(uint64_t, SHHapticsEndpoint *, void))(v12 + 16))(v12, v13, 0LL);
}

void sub_100041450(_Unwind_Exception *a1)
{
}

void sub_100041474(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[SHRemoteConfiguration sharedInstance](&OBJC_CLASS___SHRemoteConfiguration, "sharedInstance"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100041638;
    v13[3] = &unk_10006E020;
    id v9 = *(id *)(a1 + 48);
    id v10 = *(void **)(a1 + 64);
    id v17 = v9;
    v18[1] = v10;
    id v14 = *(id *)(a1 + 32);
    objc_copyWeak(v18, (id *)(a1 + 56));
    id v15 = v5;
    id v16 = *(id *)(a1 + 40);
    [v8 endpointsWithCompletion:v13];

    objc_destroyWeak(v18);
  }

  else
  {
    uint64_t v11 = sh_log_object(v6);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Missing or invalid host %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }
}

void sub_10004161C(_Unwind_Exception *a1)
{
}

void sub_100041638(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (*(void *)(a1 + 72) == 2LL) {
      uint64_t v8 = objc_claimAutoreleasedReturnValue([v5 matchURLPathForClientIdentifier:v7]);
    }
    else {
      uint64_t v8 = objc_claimAutoreleasedReturnValue([v5 lookupURLPathForClientIdentifier:v7]);
    }
    id v9 = (void *)v8;
    if (v8)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained storefront]);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_100041820;
      v14[3] = &unk_10006DFF8;
      id v15 = *(id *)(a1 + 40);
      id v16 = v9;
      id v17 = v5;
      id v18 = *(id *)(a1 + 48);
      id v19 = *(id *)(a1 + 56);
      [v11 storefrontCountryCode:v14];
    }

    else
    {
      uint64_t v12 = sh_log_object(0LL);
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Missing or invalid match endpoint %@",  buf,  0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
    }
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }
}

void sub_100041820(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sh_log_object(v3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138412290;
    id v11 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "Fetching endpoint with storefront %@",  (uint8_t *)&v10,  0xCu);
  }

  id v6 = objc_alloc(&OBJC_CLASS___SHTokenizedURL);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
  uint64_t v8 = -[SHTokenizedURL initWithHost:URLPath:](v6, "initWithHost:URLPath:", v7, *(void *)(a1 + 40));

  id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) suggestedLanguage]);
  +[SHShazamKitServerURLBuilder updateTokensForEndpoint:language:storefront:installationID:]( &OBJC_CLASS___SHShazamKitServerURLBuilder,  "updateTokensForEndpoint:language:storefront:installationID:",  v8,  v9,  v3,  *(void *)(a1 + 56));

  (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
}

void sub_100042284(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 40);
  id v9 = v5;
  if (!v5 || a3)
  {
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0LL);
  }

  else
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) shazamID]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[UNNotificationAttachment attachmentWithIdentifier:URL:options:error:]( &OBJC_CLASS___UNNotificationAttachment,  "attachmentWithIdentifier:URL:options:error:",  v7,  v9,  0LL,  0LL));
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v8);
  }
}

id objc_msgSend_commonInitWithBundleIdentifier_clientType_URLBuilder_contextBuilder_networkRequester_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "commonInitWithBundleIdentifier:clientType:URLBuilder:contextBuilder:networkRequester:");
}

id objc_msgSend_commonInitWithDataStore_remoteLibrary_libraryInfoFetcher_snapshotUpdater_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "commonInitWithDataStore:remoteLibrary:libraryInfoFetcher:snapshotUpdater:");
}

id objc_msgSend_decimalNumberHandlerWithRoundingMode_scale_raiseOnExactness_raiseOnOverflow_raiseOnUnderflow_raiseOnDivideByZero_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "decimalNumberHandlerWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:");
}

id objc_msgSend_initWithCallingProcessIdentifier_containerIdentifier_transactionIdentifier_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCallingProcessIdentifier:containerIdentifier:transactionIdentifier:");
}

id objc_msgSend_initWithMinimumSignatureDuration_maximumSignatureDuration_bufferDuration_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMinimumSignatureDuration:maximumSignatureDuration:bufferDuration:");
}

id objc_msgSend_initWithMinimumSignatureDuration_maximumSignatureDuration_bufferDuration_signatureGenerator_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithMinimumSignatureDuration:maximumSignatureDuration:bufferDuration:signatureGenerator:");
}

id objc_msgSend_initWithRecordingIntermission_recordingSignatureOffset_retrySeconds_match_signature_runningAssociatedRequestID_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithRecordingIntermission:recordingSignatureOffset:retrySeconds:match:signature:runningAssociatedRequestID:error:");
}

id objc_msgSend_initWithResultsLimit_filterOptions_ascending_shouldUpdate_providerIdentifier_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithResultsLimit:filterOptions:ascending:shouldUpdate:providerIdentifier:");
}

id objc_msgSend_matchWithRecordingIntermission_recordingSignatureOffset_retrySeconds_match_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "matchWithRecordingIntermission:recordingSignatureOffset:retrySeconds:match:");
}

id objc_msgSend_mediaItemFromResourcesResponse_shazamID_signatureStartDate_campaignToken_location_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mediaItemFromResourcesResponse:shazamID:signatureStartDate:campaignToken:location:");
}

id objc_msgSend_noMatchWithRecordingIntermission_recordingSignatureOffset_retrySeconds_signature_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "noMatchWithRecordingIntermission:recordingSignatureOffset:retrySeconds:signature:");
}

id objc_msgSend_replaceItemAtURL_withItemAtURL_backupItemName_options_resultingItemURL_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:");
}

id objc_msgSend_zonesFolderPath(void *a1, const char *a2, ...)
{
  return [a1 zonesFolderPath];
}