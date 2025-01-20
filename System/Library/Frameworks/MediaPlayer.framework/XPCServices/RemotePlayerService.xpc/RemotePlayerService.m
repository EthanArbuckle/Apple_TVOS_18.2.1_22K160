id sub_1000049CC()
{
  if (qword_10000CC80 != -1) {
    dispatch_once(&qword_10000CC80, &stru_1000083C8);
  }
  return (id)qword_10000CC78;
}

void sub_100004A0C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.amp.MediaPlayer", "MPRemotePlayerService");
  v2 = (void *)qword_10000CC78;
  qword_10000CC78 = (uint64_t)v1;
}

void sub_100004A3C(uint64_t a1, int a2)
{
  id v4 = sub_1000049CC();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(v7 + 56);
      int v9 = *(_DWORD *)(v7 + 12);
      int v14 = 134218496;
      uint64_t v15 = v7;
      __int16 v16 = 2048;
      uint64_t v17 = v8;
      __int16 v18 = 1024;
      int v19 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "MPRemotePlayerService: %p: took process assertion %p for pid %d",  (uint8_t *)&v14,  0x1Cu);
    }
  }

  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(v11 + 56);
      int v13 = *(_DWORD *)(v11 + 12);
      int v14 = 134218496;
      uint64_t v15 = v11;
      __int16 v16 = 2048;
      uint64_t v17 = v12;
      __int16 v18 = 1024;
      int v19 = v13;
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "MPRemotePlayerService: %p: clearing process assertion %p for pid %d [failed to acquire assertion]",  (uint8_t *)&v14,  0x1Cu);
    }

    uint64_t v10 = *(void *)(a1 + 32);
    v6 = *(os_log_s **)(v10 + 56);
    *(void *)(v10 + 56) = 0LL;
  }
}

id sub_100004B8C(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _shouldPreventSuspensionForBackgroundPlayback] & 1) == 0)
  {
    id v2 = sub_1000049CC();
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(v4 + 56);
      int v6 = *(_DWORD *)(v4 + 12);
      int v10 = 134218496;
      uint64_t v11 = v4;
      __int16 v12 = 2048;
      uint64_t v13 = v5;
      __int16 v14 = 1024;
      int v15 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "MPRemotePlayerService: %p: invalidated process assertion %p for %d [!shouldPreventSuspensionForBackgroundPlayback]",  (uint8_t *)&v10,  0x1Cu);
    }

    [*(id *)(*(void *)(a1 + 32) + 56) invalidate];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 56);
    *(void *)(v7 + 56) = 0LL;
  }

  return [*(id *)(a1 + 32) _cancelAssertionInvalidationTimerWithReason:@"event handler"];
}

void sub_100004C88()
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  v0 = off_10000CC68;
  int v9 = off_10000CC68;
  if (!off_10000CC68)
  {
    os_log_t v1 = sub_100004E60();
    v0 = dlsym(v1, "MPSharedBackgroundTaskProvider");
    v7[3] = (uint64_t)v0;
    off_10000CC68 = v0;
  }

  _Block_object_dispose(&v6, 8);
  if (v0)
  {
    uint64_t v2 = ((uint64_t (*)(void))v0)();
    id v3 = (id)objc_claimAutoreleasedReturnValue(v2);
  }

  else
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "id<MSVBackgroundTaskProviding> _sharedBackgroundTaskProvider(void)"));
    objc_msgSend( v4,  "handleFailureInFunction:file:lineNumber:description:",  v5,  @"MPRemotePlayerService.m",  41,  @"%s",  dlerror());

    __break(1u);
  }
}

void sub_100004D68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

void sub_100004D80(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 10LL) = *(_BYTE *)(a1 + 48);
  [*(id *)(a1 + 32) _updateProcessAssertion];
  id v2 = sub_1000049CC();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = *(unsigned __int8 *)(a1 + 48);
    int v8 = 134218240;
    uint64_t v9 = v4;
    __int16 v10 = 1024;
    int v11 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "MPRemotePlayerService: %p: setWantsReverseProcessAssertion: %{BOOL}u",  (uint8_t *)&v8,  0x12u);
  }

  sub_100004C88();
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v7 endTask:*(void *)(a1 + 40)];
}

void *sub_100004E60()
{
  uint64_t v4 = 0LL;
  if (!qword_10000CC70)
  {
    __int128 v5 = off_100008390;
    uint64_t v6 = 0LL;
    qword_10000CC70 = _sl_dlopen(&v5, &v4);
  }

  v0 = (void *)qword_10000CC70;
  if (!qword_10000CC70)
  {
    v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void *MediaPlayerLibrary(void)"));
    objc_msgSend( v0,  "handleFailureInFunction:file:lineNumber:description:",  v3,  @"MPRemotePlayerService.m",  34,  @"%s",  v4);

    __break(1u);
    goto LABEL_7;
  }

  os_log_t v1 = v4;
  if (v4) {
LABEL_7:
  }
    free(v1);
  return v0;
}

void sub_100004F64(void *a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1[4] + 24) serverEndpoint]);
  (*(void (**)(void))(a1[5] + 16LL))();
  id v3 = sub_1000049CC();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    int v8 = 134218242;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    int v11 = v2;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "MPRemotePlayerService: %p: Got server endpoint: %@",  (uint8_t *)&v8,  0x16u);
  }

  sub_100004C88();
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v7 endTask:a1[6]];
}

void sub_10000505C(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100005198;
  v2[3] = &unk_100008258;
  id v3 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  dispatch_async(&_dispatch_main_q, v2);
}

void sub_1000050E4(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 objectForKeyedSubscript:BKSApplicationStateKey]);
  id v4 = [v3 integerValue];

  if (v4 == (id)2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100005190;
    block[3] = &unk_100008280;
    id v6 = *(id *)(a1 + 32);
    dispatch_async(&_dispatch_main_q, block);
  }

id sub_100005190(uint64_t a1)
{
  return [*(id *)(a1 + 32) reportUserBackgroundedApplication];
}

id sub_100005198(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 9LL) = 1;
  [*(id *)(a1 + 40) reportUserBackgroundedApplication];
  return [*(id *)(a1 + 32) _updateProcessAssertion];
}

void sub_1000053A4(uint64_t a1)
{
  id v2 = sub_10000569C();
  id v3 = *(void **)(a1 + 32);
  if (v3) {
    [v3 auditToken];
  }
  else {
    memset(v20, 0, sizeof(v20));
  }
  [v2 setGlobalPrivacyClientWithAuditToken:v20];
  uint64_t v21 = 0LL;
  v22 = &v21;
  uint64_t v23 = 0x2050000000LL;
  id v4 = (void *)qword_10000CC90;
  uint64_t v24 = qword_10000CC90;
  if (!qword_10000CC90)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472LL;
    *(void *)&buf[16] = sub_100005750;
    v26 = &unk_100008370;
    v27 = &v21;
    sub_100005750((uint64_t)buf);
    id v4 = (void *)v22[3];
  }

  id v5 = v4;
  _Block_object_dispose(&v21, 8);
  [v5 setXPCHostApplicationIdentifier:*(void *)(a1 + 40)];
  if (!*(void *)(*(void *)(a1 + 48) + 8LL))
  {
    uint64_t v21 = 0LL;
    v22 = &v21;
    uint64_t v23 = 0x2050000000LL;
    id v6 = (void *)qword_10000CC98;
    uint64_t v24 = qword_10000CC98;
    if (!qword_10000CC98)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472LL;
      *(void *)&buf[16] = sub_100005814;
      v26 = &unk_100008370;
      v27 = &v21;
      sub_100005814((uint64_t)buf);
      id v6 = (void *)v22[3];
    }

    uint64_t v7 = v6;
    _Block_object_dispose(&v21, 8);
    id v8 = [[v7 alloc] initWithPlayerID:*(void *)(a1 + 40)];
    uint64_t v9 = *(void *)(a1 + 48);
    __int16 v10 = *(void **)(v9 + 8);
    *(void *)(v9 + _Block_object_dispose(va, 8) = v8;

    [*(id *)(*(void *)(a1 + 48) + 8) setDisableAutoPlay:1];
    [*(id *)(*(void *)(a1 + 48) + 8) start];
    uint64_t LocalOrigin = MRMediaRemoteGetLocalOrigin([*(id *)(*(void *)(a1 + 48) + 8) becomeActive]);
    MRMediaRemoteSetParentApplication(LocalOrigin, *(void *)(a1 + 40));
  }

  __int16 v12 = -[MPRemotePlayerServiceConnection initWithConnection:bundleID:pid:playbackEngine:]( objc_alloc(&OBJC_CLASS___MPRemotePlayerServiceConnection),  "initWithConnection:bundleID:pid:playbackEngine:",  *(void *)(a1 + 32),  *(void *)(a1 + 40),  *(unsigned int *)(a1 + 64),  *(void *)(*(void *)(a1 + 48) + 8LL));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___MPRemotePlayerServiceProtocol));
  [*(id *)(a1 + 32) setExportedInterface:v13];

  [*(id *)(a1 + 32) setExportedObject:v12];
  [*(id *)(a1 + 32) resume];
  id v14 = sub_1000049CC();
  int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = *(void *)(a1 + 48);
    uint64_t v17 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218242;
    *(void *)&buf[4] = v16;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "MPRemotePlayerService: %p: Resumed XPC connection: %@",  buf,  0x16u);
  }

  sub_100004C88();
  int v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  [v19 endTask:*(void *)(a1 + 56)];
}

void sub_100005678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
}

id sub_10000569C()
{
  uint64_t v4 = 0LL;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000LL;
  v0 = (void *)qword_10000CC88;
  uint64_t v7 = qword_10000CC88;
  if (!qword_10000CC88)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_1000059B0;
    v3[3] = &unk_100008370;
    v3[4] = &v4;
    sub_1000059B0((uint64_t)v3);
    v0 = (void *)v5[3];
  }

  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100005738( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100005750(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = objc_getClass("MPServerObjectDatabase");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_10000CC90 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Class getMPServerObjectDatabaseClass(void)_block_invoke"));
    objc_msgSend( v2,  "handleFailureInFunction:file:lineNumber:description:",  v3,  @"MPRemotePlayerService.m",  40,  @"Unable to find class %s",  "MPServerObjectDatabase");

    __break(1u);
  }

Class sub_100005814(uint64_t a1)
{
  uint64_t v6 = 0LL;
  if (!qword_10000CCA0)
  {
    __int128 v7 = off_1000083E8;
    uint64_t v8 = 0LL;
    qword_10000CCA0 = _sl_dlopen(&v7, &v6);
  }

  if (!qword_10000CCA0)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void *MediaPlaybackCoreLibrary(void)"));
    objc_msgSend( v3,  "handleFailureInFunction:file:lineNumber:description:",  v4,  @"MPRemotePlayerService.m",  35,  @"%s",  v6);

    goto LABEL_10;
  }

  if (v6) {
    free(v6);
  }
  Class result = objc_getClass("MPCPlaybackEngine");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Class getMPCPlaybackEngineClass(void)_block_invoke"));
    objc_msgSend( v3,  "handleFailureInFunction:file:lineNumber:description:",  v5,  @"MPRemotePlayerService.m",  42,  @"Unable to find class %s",  "MPCPlaybackEngine");

LABEL_10:
    __break(1u);
  }

  qword_10000CC98 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

void sub_1000059B0(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = objc_getClass("MPMediaLibrary");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_10000CC88 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Class getMPMediaLibraryClass(void)_block_invoke"));
    objc_msgSend( v2,  "handleFailureInFunction:file:lineNumber:description:",  v3,  @"MPRemotePlayerService.m",  38,  @"Unable to find class %s",  "MPMediaLibrary");

    __break(1u);
  }

uint64_t start()
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
  id v1 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async(v1, &stru_100008400);

  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  id v3 = objc_opt_new(&OBJC_CLASS___MPRemotePlayerService);
  [v2 setDelegate:v3];
  [v2 resume];

  return 0LL;
}

void sub_100005AF4(id a1)
{
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2050000000LL;
  id v1 = (void *)qword_10000CCA8;
  uint64_t v19 = qword_10000CCA8;
  if (!qword_10000CCA8)
  {
    int v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472LL;
    uint64_t v13 = sub_100005CE8;
    id v14 = &unk_100008370;
    int v15 = &v16;
    sub_100005CE8((uint64_t)&v11);
    id v1 = (void *)v17[3];
  }

  id v2 = v1;
  _Block_object_dispose(&v16, 8);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 sharedCloudController]);
  [v3 becomeActive];

  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2050000000LL;
  uint64_t v4 = (void *)qword_10000CCB0;
  uint64_t v19 = qword_10000CCB0;
  if (!qword_10000CCB0)
  {
    int v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472LL;
    uint64_t v13 = sub_100005DAC;
    id v14 = &unk_100008370;
    int v15 = &v16;
    sub_100005DAC((uint64_t)&v11);
    uint64_t v4 = (void *)v17[3];
  }

  id v5 = v4;
  _Block_object_dispose(&v16, 8);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 sharedController]);
  [v6 beginObservingCloudLibraryEnabled];

  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2050000000LL;
  __int128 v7 = (void *)qword_10000CCB8;
  uint64_t v19 = qword_10000CCB8;
  if (!qword_10000CCB8)
  {
    int v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472LL;
    uint64_t v13 = sub_100005E70;
    id v14 = &unk_100008370;
    int v15 = &v16;
    sub_100005E70((uint64_t)&v11);
    __int128 v7 = (void *)v17[3];
  }

  id v8 = v7;
  _Block_object_dispose(&v16, 8);
  [v8 setFilteringDisabled:1];
  id v9 = [sub_10000569C() defaultMediaLibrary];
  __int16 v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  [v10 beginGeneratingLibraryChangeNotifications];
}

void sub_100005CC8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100005CE8(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = objc_getClass("MPCloudController");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_10000CCA8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Class getMPCloudControllerClass(void)_block_invoke"));
    objc_msgSend( v2,  "handleFailureInFunction:file:lineNumber:description:",  v3,  @"MPRemotePlayerService.m",  36,  @"Unable to find class %s",  "MPCloudController");

    __break(1u);
  }

void sub_100005DAC(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = objc_getClass("MPCloudServiceStatusController");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_10000CCB0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Class getMPCloudServiceStatusControllerClass(void)_block_invoke"));
    objc_msgSend( v2,  "handleFailureInFunction:file:lineNumber:description:",  v3,  @"MPRemotePlayerService.m",  37,  @"Unable to find class %s",  "MPCloudServiceStatusController");

    __break(1u);
  }

Class sub_100005E70(uint64_t a1)
{
  Class result = objc_getClass("MPMediaQuery");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_10000CCB8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Class getMPMediaQueryClass(void)_block_invoke"));
    objc_msgSend( v3,  "handleFailureInFunction:file:lineNumber:description:",  v4,  @"MPRemotePlayerService.m",  39,  @"Unable to find class %s",  "MPMediaQuery");

    __break(1u);
    return (Class)MRMediaRemoteGetLocalOrigin(v5);
  }

  return result;
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}