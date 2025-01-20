id sub_100002678()
{
  if (qword_100011520 != -1) {
    dispatch_once(&qword_100011520, &stru_10000C5A8);
  }
  return (id)qword_100011518;
}

void sub_1000026B8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.SplashBoard", "Snapshot");
  v2 = (void *)qword_100011518;
  qword_100011518 = (uint64_t)v1;
}

id sub_1000026E8()
{
  if (qword_100011530 != -1) {
    dispatch_once(&qword_100011530, &stru_10000C5C8);
  }
  return (id)qword_100011528;
}

void sub_100002728(id a1)
{
  os_log_t v1 = os_log_create("com.apple.SplashBoard", "Memory");
  v2 = (void *)qword_100011528;
  qword_100011528 = (uint64_t)v1;
}

id sub_100002758()
{
  if (qword_100011540 != -1) {
    dispatch_once(&qword_100011540, &stru_10000C5E8);
  }
  return (id)qword_100011538;
}

void sub_100002798(id a1)
{
  os_log_t v1 = os_log_create("com.apple.SplashBoard", "FetchRequests");
  v2 = (void *)qword_100011538;
  qword_100011538 = (uint64_t)v1;
}

id sub_1000027C8()
{
  if (qword_100011550 != -1) {
    dispatch_once(&qword_100011550, &stru_10000C608);
  }
  return (id)qword_100011548;
}

void sub_100002808(id a1)
{
  os_log_t v1 = os_log_create("com.apple.SplashBoard", "SnapshotReaper");
  v2 = (void *)qword_100011548;
  qword_100011548 = (uint64_t)v1;
}

id sub_100002838()
{
  if (qword_100011560 != -1) {
    dispatch_once(&qword_100011560, &stru_10000C628);
  }
  return (id)qword_100011558;
}

void sub_100002878(id a1)
{
  os_log_t v1 = os_log_create("com.apple.SplashBoard", "DaemonLifecycle");
  v2 = (void *)qword_100011558;
  qword_100011558 = (uint64_t)v1;
}

id sub_1000028A8()
{
  if (qword_100011570 != -1) {
    dispatch_once(&qword_100011570, &stru_10000C648);
  }
  return (id)qword_100011568;
}

void sub_1000028E8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.SplashBoard", "Capture");
  v2 = (void *)qword_100011568;
  qword_100011568 = (uint64_t)v1;
}

id sub_100002918()
{
  if (qword_100011580 != -1) {
    dispatch_once(&qword_100011580, &stru_10000C668);
  }
  return (id)qword_100011578;
}

void sub_100002958(id a1)
{
  os_log_t v1 = os_log_create("com.apple.SplashBoard", "FileManifest");
  v2 = (void *)qword_100011578;
  qword_100011578 = (uint64_t)v1;
}

id sub_100002988()
{
  if (qword_100011590 != -1) {
    dispatch_once(&qword_100011590, &stru_10000C688);
  }
  return (id)qword_100011588;
}

void sub_1000029C8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.SplashBoard", "Purge");
  v2 = (void *)qword_100011588;
  qword_100011588 = (uint64_t)v1;
}

id sub_1000029F8()
{
  if (qword_1000115A0 != -1) {
    dispatch_once(&qword_1000115A0, &stru_10000C6A8);
  }
  return (id)qword_100011598;
}

void sub_100002A38(id a1)
{
  os_log_t v1 = os_log_create("com.apple.SplashBoard", "Common");
  v2 = (void *)qword_100011598;
  qword_100011598 = (uint64_t)v1;
}

uint64_t sub_100002B90(uint64_t result)
{
  if (result)
  {
    if (result == 2) {
      return _UIAppStatusBarDefaultDoubleHeight();
    }
    else {
      return _UIAppStatusBarDefaultHeight();
    }
  }

  return result;
}

LABEL_17:
  if (a6 && !v12 && !*a6)
  {
    v22 = objc_alloc(&OBJC_CLASS___XBLaunchImageError);
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Could not load any content for the interface named %@.",  v9));
    *a6 =  -[XBLaunchImageError initWithCode:bundleID:reason:fatal:]( v22,  "initWithCode:bundleID:reason:fatal:",  3LL,  v26,  v23,  0LL);
  }

  return v12;
}

void sub_1000032AC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  if (a2 == 1)
  {
    id v15 = objc_begin_catch(exception_object);
    if (a14) {
      *a14 = (id)objc_claimAutoreleasedReturnValue([v14 _errorForParsingException:v15 bundleID:a13]);
    }

    objc_end_catch();
    JUMPOUT(0x1000031E4LL);
  }

  _Unwind_Resume(exception_object);
}

void sub_1000038E8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20, uint64_t a21, uint64_t a22, void *a23)
{
  if (a2 == 1)
  {
    id v23 = objc_begin_catch(exception_object);
    if (a19)
    {
      v24 = objc_alloc(&OBJC_CLASS___XBLaunchImageError);
      v26 = (void *)objc_claimAutoreleasedReturnValue([v23 description]);
      v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Exception thrown during configuration load: %@"));
      *a19 =  -[XBLaunchImageError initWithCode:bundleID:reason:fatal:]( v24,  "initWithCode:bundleID:reason:fatal:",  2LL,  a21,  v25,  0LL);
    }

    objc_end_catch();
    JUMPOUT(0x100003894LL);
  }

  _Unwind_Resume(exception_object);
}

LABEL_10:
    v24 = 0LL;
    goto LABEL_20;
  }

  if ([v12 isStoryboard])
  {
    v16 = sub_1000028A8();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_100006F8C();
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[XBLaunchInterface name](self->_launchInterface, "name"));
    v19 = objc_claimAutoreleasedReturnValue( -[XBLaunchImageContextWrapper _parseInterfaceWithStoryboardName:bundle:bundleID:error:]( self,  "_parseInterfaceWithStoryboardName:bundle:bundleID:error:",  v18,  v13,  v15,  a7));
LABEL_19:
    v24 = (void *)v19;

    goto LABEL_20;
  }

  if ([v12 isXIB])
  {
    v25 = sub_1000028A8();
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      sub_100006FB8();
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[XBLaunchInterface name](self->_launchInterface, "name"));
    v19 = objc_claimAutoreleasedReturnValue( -[XBLaunchImageContextWrapper _parseInterfaceWithNibName:bundle:bundleID:error:]( self,  "_parseInterfaceWithNibName:bundle:bundleID:error:",  v18,  v13,  v15,  a7));
    goto LABEL_19;
  }

  if ([v12 isConfiguration])
  {
    v27 = sub_1000028A8();
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      sub_100006FE4();
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[XBLaunchInterface configuration](self->_launchInterface, "configuration"));
    v19 = objc_claimAutoreleasedReturnValue( -[XBLaunchImageContextWrapper _parseInterfaceConfiguration:bundle:bundleID:error:]( self,  "_parseInterfaceConfiguration:bundle:bundleID:error:",  v18,  v13,  v15,  a7));
    goto LABEL_19;
  }

  if (!a7) {
    goto LABEL_10;
  }
  v30 = sub_1000028A8();
  v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
    sub_100007010();
  }

  v24 = 0LL;
  *a7 =  -[XBLaunchImageError initWithCode:bundleID:reason:fatal:]( objc_alloc(&OBJC_CLASS___XBLaunchImageError),  "initWithCode:bundleID:reason:fatal:",  1LL,  v15,  @"No such interface found.",  0LL);
LABEL_20:

  return v24;
}

void sub_100003D48(void *a1)
{
  id v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue([v1 subviews]);

  if (v2)
  {
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "subviews", 0));
    id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        v7 = 0LL;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          sub_100003D48(*(void *)(*((void *)&v8 + 1) + 8LL * (void)v7));
          v7 = (char *)v7 + 1;
        }

        while (v5 != v7);
        id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }

      while (v5);
    }
  }

  [v1 setSemanticContentAttribute:4];
}

void sub_100004498( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a2 == 1)
  {
    id v10 = objc_begin_catch(exception_object);
    __int128 v11 = objc_alloc(&OBJC_CLASS___XBLaunchImageError);
    v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v9 + 32) bundleIdentifier]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 description]);
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Exception thrown during display: %@"));
    v14 = -[XBLaunchImageError initWithCode:bundleID:reason:fatal:]( v11,  "initWithCode:bundleID:reason:fatal:",  7LL,  v12,  v13,  1LL);

    objc_end_catch();
    if (!v14) {
      JUMPOUT(0x100004318LL);
    }
    JUMPOUT(0x1000042C4LL);
  }

  _Unwind_Resume(exception_object);
}

void sub_1000053CC( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

uint64_t start()
{
  v0 = objc_autoreleasePoolPush();
  id v1 = objc_autoreleasePoolPush();
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[XBLaunchImageProviderServer sharedInstance]( &OBJC_CLASS___XBLaunchImageProviderServer,  "sharedInstance"));
  [v2 run];

  objc_autoreleasePoolPop(v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
  [v3 run];

  objc_autoreleasePoolPop(v0);
  return 0xFFFFFFFFLL;
}

void sub_1000054C4(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___XBLaunchImageProviderServer);
  v2 = (void *)qword_1000115A8;
  qword_1000115A8 = (uint64_t)v1;
}

void sub_10000565C(id a1)
{
  if (!+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
  {
    id v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[XBLaunchImageProviderServer run]_block_invoke"));
    [v1 handleFailureInFunction:v2 file:@"XBLaunchImageProviderServer.m" lineNumber:96 description:@"this call must be made on the main thread"];
  }

  qword_1000115C0 = (uint64_t)pthread_self();
}

void sub_1000056EC(id a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v2 = sub_100002838();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Warming up", (uint8_t *)&v12, 2u);
  }

  id v4 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  id v5 = +[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale");
  id v6 = +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults");
  id v7 = +[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen");
  +[UIKeyboard usesInputSystemUI](&OBJC_CLASS___UIKeyboard, "usesInputSystemUI");
  objc_opt_class(&OBJC_CLASS___UIApplicationSceneSettings);
  UIAnimationDragCoefficient(+[UIFont preferredFontForTextStyle:](&OBJC_CLASS___UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  +[UIWindow setShouldRestrictViewsForSplashboard:]( &OBJC_CLASS___UIWindow,  "setShouldRestrictViewsForSplashboard:",  1LL);
  +[UIWindow setRestrictedSplashboardClasses:]( &OBJC_CLASS___UIWindow,  "setRestrictedSplashboardClasses:",  &off_10000CC08);

  id v8 = sub_1000028A8();
  _XBDebugCaptureIsEnabled(v8);
  id v9 = sub_100002838();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    [v1 timeIntervalSinceNow];
    int v12 = 134217984;
    double v13 = -v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Warm-up complete after %.3fs",  (uint8_t *)&v12,  0xCu);
  }
}

void sub_100005A60(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _transactionWorkForClient:*(void *)(a1 + 40)]);
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 contextWrapper]);
  id v4 = v3;
  if (v3)
  {
    [v3 invalidate];
    [v2 setContextWrapper:0];
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100005B1C;
  block[3] = &unk_10000C730;
  id v6 = *(id *)(a1 + 48);
  dispatch_async(&_dispatch_main_q, block);
}

uint64_t sub_100005B1C(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100006124( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, char a37)
{
}

uint64_t sub_100006180(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100006190(uint64_t a1)
{
}

void sub_100006198(uint64_t a1)
{
  id v2 = objc_autoreleasePoolPush();
  if (*(_BYTE *)(a1 + 96))
  {
    if (*(_BYTE *)(a1 + 97)) {
      uint64_t v3 = 3LL;
    }
    else {
      uint64_t v3 = 1LL;
    }
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(*(void *)(a1 + 72) + 8LL);
  id v7 = *(void **)(v6 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v10 = *(void *)(*(void *)(a1 + 80) + 8LL);
  id v12 = *(id *)(v10 + 40);
  id obj = v7;
  unsigned int v11 = objc_msgSend( v4,  "_onMain_createLaunchWindowForClient:withLaunchRequest:appInfo:captureInfo:captureOptions:error:",  v5,  v8,  v9,  &obj,  v3,  &v12);
  objc_storeStrong((id *)(v6 + 40), obj);
  objc_storeStrong((id *)(v10 + 40), v12);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = v11;
  pthread_dependency_fulfill_np(*(void *)(a1 + 88), 0LL);
  objc_autoreleasePoolPop(v2);
}

void sub_10000625C(uint64_t a1, void *a2)
{
  id v7 = a2;
  xpc_dictionary_set_int64( v7,  XBLaunchImageProviderMessageKeyContextID,  *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL));
  uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bs_secureEncoded"));
    BSSerializeDataToXPCDictionaryWithKey(v4, v7, XBLaunchImageProviderMessageKeyError);
  }

  if (*(_BYTE *)(a1 + 56))
  {
    uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
    if (v5)
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bs_secureEncoded"));
      BSSerializeDataToXPCDictionaryWithKey(v6, v7, XBLaunchImageProviderMessageKeyCaptureInfo);
    }
  }
}
}

_DWORD *sub_100006B60(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 24);
  *(_DWORD *)(v2 + 24) = dispatch_source_get_data(*(dispatch_source_t *)(v2 + 16));
  result = *(_DWORD **)(a1 + 32);
  int v5 = result[6];
  if (v3 != v5)
  {
    if (v5 == 16)
    {
      uint64_t v6 = @"ProcessMemoryWarning";
      return [result _publishMemoryReportForPressureType:v6];
    }

    if (v5 == 32)
    {
      uint64_t v6 = @"ProcessMemoryCritical";
      return [result _publishMemoryReportForPressureType:v6];
    }
  }

  return result;
}

void sub_100006D68(uint64_t a1, void *a2)
{
  uint64_t v3 = kSymptomDiagnosticReplySuccess;
  id v4 = a2;
  if (objc_msgSend(v4, "bs_BOOLForKey:", v3))
  {
    int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kSymptomDiagnosticReplySessionID]);

    id v6 = sub_1000026E8();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000071FC(a1, (uint64_t)v5, v7);
    }
  }

  else
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bs_safeNumberForKey:", @"reason"));

    id v9 = [v8 longValue];
    id v10 = sub_1000026E8();
    int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100007280(a1, (uint64_t)v9, v5);
    }
  }
}

void sub_100006EF0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_100006F08(void *a1, uint8_t *buf, void *a3, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "[%@] unsupported configuration found in xib - ignoring UIWindow",  buf,  0xCu);
}

void sub_100006F60()
{
}

void sub_100006F8C()
{
}

void sub_100006FB8()
{
}

void sub_100006FE4()
{
}

void sub_100007010()
{
}

void sub_10000703C()
{
  __int16 v3 = v0;
  uint64_t v4 = 25000000LL;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEBUG,  "[%@] estimated size (%zu) is over limit (%zu); proceeding to capture under set default",
    v2,
    0x20u);
}

void sub_1000070C0()
{
}

void sub_100007134( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100007198( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000071FC(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Memory pressure event: %{public}@. Published with sessionID: %{public}@",  (uint8_t *)&v4,  0x16u);
  sub_100006F00();
}

void sub_100007280(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  __int16 v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) description]);
  int v7 = 138543874;
  uint64_t v8 = v5;
  __int16 v9 = 2048;
  uint64_t v10 = a2;
  __int16 v11 = 2114;
  id v12 = v6;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Memory pressure event: %{public}@. Not published for reason code: %ld. Memory history: %{public}@",  (uint8_t *)&v7,  0x20u);
}

id objc_msgSend__onMain_createLaunchWindowForClient_withLaunchRequest_appInfo_captureInfo_captureOptions_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_onMain_createLaunchWindowForClient:withLaunchRequest:appInfo:captureInfo:captureOptions:error:");
}

id objc_msgSend_contextWrapperForApplicationWithCompatibilityInfo_launchRequest_captureOptions_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contextWrapperForApplicationWithCompatibilityInfo:launchRequest:captureOptions:");
}

id objc_msgSend_width(void *a1, const char *a2, ...)
{
  return [a1 width];
}