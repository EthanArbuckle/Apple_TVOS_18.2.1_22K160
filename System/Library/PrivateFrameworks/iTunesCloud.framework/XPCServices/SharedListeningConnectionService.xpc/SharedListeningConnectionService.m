void sub_100001734( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, id location)
{
  id *v26;
  id *v27;
  id *v28;
  id *v29;
  uint64_t v30;
  objc_destroyWeak(v27);
  objc_destroyWeak(v26);
  objc_destroyWeak(v29);
  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v30 - 144));
  _Unwind_Resume(a1);
}

id sub_1000017A4()
{
  if (qword_100008BB8 != -1) {
    dispatch_once(&qword_100008BB8, &stru_1000041B8);
  }
  return (id)qword_100008BB0;
}

void sub_1000017E4(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  id v3 = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    id v4 = sub_1000017A4();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134217984;
      id v11 = WeakRetained;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "ICSharedListeningService: %p: invalidated.",  (uint8_t *)&v10,  0xCu);
    }

    if (v3)
    {
      id v6 = sub_1000017A4();
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue([v3 xpcConnection]);
        int v10 = 134218242;
        id v11 = WeakRetained;
        __int16 v12 = 2112;
        v13 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "ICSharedListeningService: %p: Removing controller for connection %@.",  (uint8_t *)&v10,  0x16u);
      }

      v9 = (void *)objc_claimAutoreleasedReturnValue([a1[4] controllers]);
      [v9 removeObject:v3];
    }
  }
}

void sub_100001948(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  id v3 = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    id v4 = sub_1000017A4();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134217984;
      id v11 = WeakRetained;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "ICSharedListeningService: %p: connection interrupted.",  (uint8_t *)&v10,  0xCu);
    }

    if (v3)
    {
      id v6 = sub_1000017A4();
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue([v3 xpcConnection]);
        int v10 = 134218242;
        id v11 = WeakRetained;
        __int16 v12 = 2112;
        v13 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "ICSharedListeningService: %p: Removing controller for connection %@.",  (uint8_t *)&v10,  0x16u);
      }

      v9 = (void *)objc_claimAutoreleasedReturnValue([a1[4] controllers]);
      [v9 removeObject:v3];
    }
  }
}

void sub_100001AAC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
  v2 = (void *)qword_100008BB0;
  qword_100008BB0 = (uint64_t)v1;
}

uint64_t start()
{
  id v0 = sub_1000017A4();
  os_log_t v1 = (os_log_s *)objc_claimAutoreleasedReturnValue(v0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEFAULT,  "ICSharedListeningService starting.",  (uint8_t *)v7,  2u);
  }

  uint64_t v8 = 0LL;
  v9 = &v8;
  uint64_t v10 = 0x2050000000LL;
  v2 = (void *)qword_100008BC0;
  uint64_t v11 = qword_100008BC0;
  if (!qword_100008BC0)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100001C10;
    v7[3] = &unk_1000042D8;
    v7[4] = &v8;
    sub_100001C10((uint64_t)v7);
    v2 = (void *)v9[3];
  }

  id v3 = v2;
  _Block_object_dispose(&v8, 8);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  v5 = objc_opt_new(&OBJC_CLASS___ICSharedListeningService);
  [v4 setDelegate:v5];
  [v4 resume];

  return 0LL;
}

void sub_100001BF8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

Class sub_100001C10(uint64_t a1)
{
  id v6 = 0LL;
  if (!qword_100008BC8)
  {
    __int128 v7 = off_1000041D8;
    uint64_t v8 = 0LL;
    qword_100008BC8 = _sl_dlopen(&v7, &v6);
  }

  if (!qword_100008BC8)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void *iTunesCloudLibrary(void)"));
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"main.m", 23, @"%s", v6);

    goto LABEL_10;
  }

  if (v6) {
    free(v6);
  }
  Class result = objc_getClass("ICLiveLinkIdentity");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Class getICLiveLinkIdentityClass(void)_block_invoke"));
    objc_msgSend( v3,  "handleFailureInFunction:file:lineNumber:description:",  v5,  @"main.m",  24,  @"Unable to find class %s",  "ICLiveLinkIdentity");

LABEL_10:
    __break(1u);
  }

  qword_100008BC0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

void sub_100002004( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_1000021EC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000024B4(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = objc_getClass("_ICLLProtocolMessage");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_100008BF0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Class get_ICLLProtocolMessageClass(void)_block_invoke"));
    objc_msgSend( v2,  "handleFailureInFunction:file:lineNumber:description:",  v3,  @"ICHostedSharedListeningConnectionController.m",  22,  @"Unable to find class %s",  "_ICLLProtocolMessage");

    __break(1u);
  }
}

void sub_100002578()
{
  id v3 = 0LL;
  if (!qword_100008BE8)
  {
    __int128 v4 = off_1000042F8;
    uint64_t v5 = 0LL;
    qword_100008BE8 = _sl_dlopen(&v4, &v3);
  }

  if (!qword_100008BE8)
  {
    os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void *iTunesCloudLibrary(void)"));
    objc_msgSend( v1,  "handleFailureInFunction:file:lineNumber:description:",  v2,  @"ICHostedSharedListeningConnectionController.m",  19,  @"%s",  v3);

    __break(1u);
    goto LABEL_7;
  }

  id v0 = v3;
  if (v3) {
LABEL_7:
  }
    free(v0);
}

id sub_100002678()
{
  if (qword_100008BD8 != -1) {
    dispatch_once(&qword_100008BD8, &stru_1000042B0);
  }
  return (id)qword_100008BD0;
}

void sub_1000026B8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
  v2 = (void *)qword_100008BD0;
  qword_100008BD0 = (uint64_t)v1;
}

Class sub_1000026E8(uint64_t a1)
{
  Class result = objc_getClass("ICSharedListeningConnectionController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_100008BE0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    __int128 v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Class getICSharedListeningConnectionControllerClass(void)_block_invoke"));
    objc_msgSend( v3,  "handleFailureInFunction:file:lineNumber:description:",  v4,  @"ICHostedSharedListeningConnectionController.m",  20,  @"Unable to find class %s",  "ICSharedListeningConnectionController");

    __break(1u);
    return (Class)MSVBundleIDForAuditToken(v5);
  }

  return result;
}

id objc_msgSend_xpcConnection(void *a1, const char *a2, ...)
{
  return [a1 xpcConnection];
}