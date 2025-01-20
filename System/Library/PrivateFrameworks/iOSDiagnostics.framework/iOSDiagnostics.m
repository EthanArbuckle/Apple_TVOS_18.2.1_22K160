LABEL_15:
    v22 = 0LL;
    goto LABEL_20;
  }

  if (v8) {
    v11[2](v11, @"destinationMismatch", 0LL);
  }
LABEL_23:
}

void sub_1000052E0(uint64_t a1)
{
  uint64_t v2 = DiagnosticLogHandleForCategory(7LL);
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v8 = 138412290;
    uint64_t v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Syncing Device State: %@", (uint8_t *)&v8, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) messenger]);
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) destination]);
  [v5 sendMessage:@"deviceState" data:v6 toDestination:v7 forceLocalDelivery:1 expectsResponse:0 response:&stru_100018538];
}

void sub_1000053E8(id a1, BOOL a2, NSError *a3, NSString *a4, DAIDSMessageObject *a5)
{
  BOOL v5 = a2;
  uint64_t v6 = DiagnosticLogHandleForCategory(7LL);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  int v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Synced device state.", v9, 2u);
    }
  }

  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    sub_10000E680(v8);
  }
}

void sub_100005768(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___DADeviceConnectionConfigurator);
  uint64_t v2 = (void *)qword_100022560;
  qword_100022560 = (uint64_t)v1;
}

uint64_t start()
{
  v0 = objc_autoreleasePoolPush();
  id v1 = +[DDMain sharedInstance](&OBJC_CLASS___DDMain, "sharedInstance");
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___DDXPCServiceDelegate);
  v3 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.iosdiagnosticsd");
  -[NSXPCListener setDelegate:](v3, "setDelegate:", v2);
  -[NSXPCListener resume](v3, "resume");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  [v4 run];

  objc_autoreleasePoolPop(v0);
  return 0LL;
}

LABEL_12:
  v20 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"fullscreenPromptsEnabled"]);
  if (v20)
  {
    v21 = objc_opt_class(&OBJC_CLASS___NSNumber, v19);
    if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0) {
      v6->_fullscreenPromptsEnabled = [v20 BOOLValue];
    }
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"allowCellularSizeThreshold"]);
  if (v23)
  {
    v24 = objc_opt_class(&OBJC_CLASS___NSNumber, v22);
    if ((objc_opt_isKindOfClass(v23, v24) & 1) != 0)
    {
      v25 = [v23 integerValue];
      else {
        v26 = (uint64_t)v25;
      }
      v6->_allowCellularSizeThreshold = v26;
    }
  }

LABEL_22:
  return v6;
}

void sub_1000063F4(id a1)
{
  uint64_t v1 = objc_opt_class(&OBJC_CLASS___NSArray);
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSNumber);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSMutableArray);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSMutableString);
  int v8 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v1,  v2,  v3,  v4,  v5,  v6,  v7,  objc_opt_class(&OBJC_CLASS___NSNull),  0LL);
  uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)qword_100022570;
  qword_100022570 = v9;
}

void sub_100006948( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
}

void sub_100006980(id *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[DDMain sharedInstance](&OBJC_CLASS___DDMain, "sharedInstance"));
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  [v2 removeConnection:WeakRetained];

  id v4 = objc_loadWeakRetained(a1);
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 serviceName]);
  uint64_t v6 = (void *)v5;
  uint64_t v7 = @"com.apple.iosdiagnosticsd";
  if (v5) {
    uint64_t v7 = (__CFString *)v5;
  }
  int v8 = v7;

  id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v8,  0LL,  0LL));
  +[DSAnalytics sendAnalyticsWithEvent:error:](&OBJC_CLASS___DSAnalytics, "sendAnalyticsWithEvent:error:", 3LL, v9);
}

void sub_100006A5C(id *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[DDMain sharedInstance](&OBJC_CLASS___DDMain, "sharedInstance"));
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  [v2 removeConnection:WeakRetained];

  id v4 = objc_loadWeakRetained(a1);
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 serviceName]);
  uint64_t v6 = (void *)v5;
  uint64_t v7 = @"com.apple.iosdiagnosticsd";
  if (v5) {
    uint64_t v7 = (__CFString *)v5;
  }
  int v8 = v7;

  id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v8,  0LL,  0LL));
  +[DSAnalytics sendAnalyticsWithEvent:error:](&OBJC_CLASS___DSAnalytics, "sendAnalyticsWithEvent:error:", 4LL, v9);
}

void sub_1000072FC(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = DiagnosticLogHandleForCategory(8LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10000E85C();
  }

  +[DSAnalytics sendAnalyticsWithEvent:error:](&OBJC_CLASS___DSAnalytics, "sendAnalyticsWithEvent:error:", 5LL, v2);
}

void sub_100007430(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = DiagnosticLogHandleForCategory(8LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10000E8CC();
  }

  +[DSAnalytics sendAnalyticsWithEvent:error:](&OBJC_CLASS___DSAnalytics, "sendAnalyticsWithEvent:error:", 5LL, v2);
}

void sub_1000075B0(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) receiver]);
  [v2 receiveMessage:*(void *)(a1 + 40) data:*(void *)(a1 + 48) fromDestination:*(void *)(a1 + 56) expectsResponse:*(unsigned __int8 *)(a1 + 72) response:*(void *)(a1 + 64)];
}

void sub_1000078A0(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.iosdiagnosticsd",  0LL,  0LL));
  +[DSAnalytics sendAnalyticsWithEvent:error:](&OBJC_CLASS___DSAnalytics, "sendAnalyticsWithEvent:error:", 3LL, v1);
}

void sub_100007900(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.iosdiagnosticsd",  0LL,  0LL));
  +[DSAnalytics sendAnalyticsWithEvent:error:](&OBJC_CLASS___DSAnalytics, "sendAnalyticsWithEvent:error:", 4LL, v1);
}

void sub_1000079A0(id a1)
{
  uint64_t v16 = objc_opt_class(&OBJC_CLASS___DADeviceState);
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___DKAssetUploadItem);
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___DKAssetUploadItems);
  uint64_t v1 = objc_opt_class(&OBJC_CLASS___DAIDSMessageObject);
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSArray);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSSet);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSOrderedSet);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSURL);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSData);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDate);
  v11 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v16,  v15,  v14,  v1,  v2,  v3,  v4,  v5,  v6,  v7,  v8,  v9,  v10,  objc_opt_class(&OBJC_CLASS___NSNull),  0LL);
  uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)qword_100022580;
  qword_100022580 = v12;
}

void sub_100007B88( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_100007C78(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___DDMain);
  uint64_t v2 = (void *)qword_100022590;
  qword_100022590 = (uint64_t)v1;
}

void sub_100007D0C(_Unwind_Exception *a1)
{
}

void sub_100007DD4(_Unwind_Exception *a1)
{
}

void sub_100007EA4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
}

void sub_10000835C(_Unwind_Exception *a1)
{
}

void sub_100008378(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = DiagnosticLogHandleForCategory(8LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10000E93C((uint64_t)v2, v4);
  }

  +[DSAnalytics sendAnalyticsWithEvent:error:](&OBJC_CLASS___DSAnalytics, "sendAnalyticsWithEvent:error:", 5LL, v2);
}
}

void sub_100008B8C( _Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, __int128 buf, int a14, __int16 a15, __int16 a16, void *a17)
{
  if (a2 == 1)
  {
    id v17 = objc_begin_catch(a1);
    uint64_t v18 = DiagnosticLogHandleForCategory(1LL);
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue([v17 name]);
      v21 = (void *)objc_claimAutoreleasedReturnValue([v17 reason]);
      v22 = (void *)objc_claimAutoreleasedReturnValue([v17 userInfo]);
      v23 = (void *)objc_claimAutoreleasedReturnValue([v22 description]);
      LODWORD(buf) = 138412802;
      *(void *)((char *)&buf + 4) = v20;
      WORD6(buf) = 2112;
      *(void *)((char *)&buf + 14) = v21;
      a16 = 2112;
      a17 = v23;
      _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Exception raised while taking SHA256 of file: %@: %@ (%@)",  (uint8_t *)&buf,  0x20u);
    }

    objc_end_catch();
    JUMPOUT(0x100008B4CLL);
  }

  _Unwind_Resume(a1);
}

void sub_10000910C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_100009130(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_10000A388( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10000A438(_Unwind_Exception *a1)
{
}

void sub_10000A4E8(_Unwind_Exception *a1)
{
}

void sub_10000A598(_Unwind_Exception *a1)
{
}

void sub_10000A648(_Unwind_Exception *a1)
{
}

void sub_10000A6F8(_Unwind_Exception *a1)
{
}

void sub_10000A7A8(_Unwind_Exception *a1)
{
}

void sub_10000A838( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10000A8E8(_Unwind_Exception *a1)
{
}

void sub_10000A998(_Unwind_Exception *a1)
{
}

void sub_10000AA48(_Unwind_Exception *a1)
{
}

void sub_10000AAF8(_Unwind_Exception *a1)
{
}

void sub_10000AD64(_Unwind_Exception *a1)
{
}

void sub_10000AE38(_Unwind_Exception *a1)
{
}

void sub_10000B084( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_10000B358(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v6 = @"info";
  uint64_t v7 = v3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
  [v2 postNotificationName:@"com.apple.Diagnostics.deviceStateChangedNotification" object:v4 userInfo:v5];
}

LABEL_21:
  return v8;
}

void sub_10000C300( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_10000C53C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
}

Class sub_10000C834(uint64_t a1)
{
  Class result = objc_getClass("NRDevice");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_1000225A8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    sub_10000EBF0();
    return (Class)sub_10000C888();
  }

  return result;
}

uint64_t sub_10000C888()
{
  uint64_t v3 = 0LL;
  if (!qword_1000225A0)
  {
    __int128 v4 = off_1000188B0;
    uint64_t v5 = 0LL;
    qword_1000225A0 = _sl_dlopen(&v4, &v3);
  }

  uint64_t v0 = qword_1000225A0;
  uint64_t v1 = v3;
  if (!qword_1000225A0)
  {
    uint64_t v1 = (char *)abort_report_np("%s", v3);
    goto LABEL_7;
  }

  if (v3) {
LABEL_7:
  }
    free(v1);
  return v0;
}

Class sub_10000C938(uint64_t a1)
{
  __int128 v4 = 0LL;
  if (!qword_1000225B0)
  {
    __int128 v5 = off_1000188F0;
    uint64_t v6 = 0LL;
    qword_1000225B0 = _sl_dlopen(&v5, &v4);
    uint64_t v2 = v4;
    if (!qword_1000225B0)
    {
      abort_report_np("%s", v4);
      goto LABEL_7;
    }

    if (v4) {
      goto LABEL_8;
    }
  }

  while (1)
  {
    Class result = objc_getClass("SFDevice");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (char *)sub_10000EC14();
LABEL_8:
    free(v2);
  }

  qword_1000225B8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

DDIDSService *sub_10000CA2C(uint64_t a1)
{
  Class result = (DDIDSService *)objc_getClass("NRPairedDeviceRegistry");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_1000225C8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    uint64_t v3 = (DDIDSService *)sub_10000EC38();
    return -[DDIDSService initWithServiceType:](v3, v4, v5);
  }

  return result;
}

LABEL_11:
  return (char)v11;
}

void sub_10000D368(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) messageStorage]);
  [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
}

LABEL_18:
}

void sub_10000DAEC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = objc_alloc(&OBJC_CLASS___DDIDSOutgoingMessage);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) destination]);
  uint64_t v9 = -[DDIDSOutgoingMessage initWithDestination:message:data:](v7, "initWithDestination:message:data:", v8, v6, v5);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) outgoingResponseIdentifier]);
  -[DDIDSOutgoingMessage setPeerResponseIdentifier:](v9, "setPeerResponseIdentifier:", v10);

  uint64_t v11 = DiagnosticLogHandleForCategory(7LL);
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DDIDSOutgoingMessage peerResponseIdentifier](v9, "peerResponseIdentifier"));
    uint64_t v14 = *(void *)(a1 + 48);
    int v15 = 138412802;
    uint64_t v16 = v13;
    __int16 v17 = 2112;
    uint64_t v18 = v14;
    __int16 v19 = 2112;
    v20 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[%@] > Responding to message: %@, with message: %@",  (uint8_t *)&v15,  0x20u);
  }

  [*(id *)(a1 + 56) _sendIDSMessage:v9];
}

void sub_10000DFD0( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_10000E540(_Unwind_Exception *a1)
{
}

void sub_10000E600(_Unwind_Exception *a1)
{
}

void sub_10000E680(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to sync device state", v1, 2u);
}

void sub_10000E6C0(void *a1, os_log_s *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Error: could not archive object [%@]",  (uint8_t *)&v4,  0xCu);
}

void sub_10000E754(void *a1, void *a2, os_log_s *a3)
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 objectForKeyedSubscript:@"class"]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a2 localizedDescription]);
  int v7 = 138412546;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Error: could not unarchive object of type %@, Reason: [%@]",  (uint8_t *)&v7,  0x16u);
}

void sub_10000E81C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Unable to create CFUserNotificationRef!",  v1,  2u);
}

void sub_10000E85C()
{
}

void sub_10000E8CC()
{
}

void sub_10000E93C(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to get remote object proxy with error: %@",  (uint8_t *)&v2,  0xCu);
}

void sub_10000E9B0()
{
}

void sub_10000E9DC()
{
}

void sub_10000EA08()
{
}

void sub_10000EA34(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 path]);
  int v5 = 138412290;
  uint8_t v6 = v3;
  sub_100009130( (void *)&_mh_execute_header,  a2,  v4,  "Could not create file handle from file at path = %@.",  (uint8_t *)&v5);
}

void sub_10000EAC0()
{
}

void sub_10000EAEC(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "requestAttestationBlobWithOptions failed with error: %@",  (uint8_t *)&v2,  0xCu);
}

void sub_10000EB60(uint64_t *a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  int v4 = 138412290;
  uint64_t v5 = v3;
  sub_100009130( (void *)&_mh_execute_header,  a2,  a3,  "Failed to create device identification public key digest, %@",  (uint8_t *)&v4);
}

uint64_t sub_10000EBD0()
{
  uint64_t v0 = dlerror();
  uint64_t v1 = abort_report_np("%s", v0);
  return sub_10000EBF0(v1);
}

uint64_t sub_10000EBF0()
{
  uint64_t v0 = abort_report_np("Unable to find class %s", "NRDevice");
  return sub_10000EC14(v0);
}

uint64_t sub_10000EC14()
{
  uint64_t v0 = abort_report_np("Unable to find class %s", "SFDevice");
  return sub_10000EC38(v0);
}

uint64_t sub_10000EC38()
{
  uint64_t v0 = abort_report_np("Unable to find class %s", "NRPairedDeviceRegistry");
  return sub_10000EC5C(v0);
}

void sub_10000EC5C(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 identifier]);
  sub_10000DFE4();
  sub_10000DFD0((void *)&_mh_execute_header, v2, v3, "[%@] Retrying IDS message: %@", v4, v5, v6, v7, v8);

  sub_10000DFFC();
}

void sub_10000ECDC(void *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1 identifier]);
  int v7 = 138412802;
  uint8_t v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a1;
  __int16 v11 = 2112;
  uint64_t v12 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "[%@] Retries exhausted to send IDS message: %@, error: %@",  (uint8_t *)&v7,  0x20u);
}

void sub_10000ED94(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 outgoingResponseIdentifier]);
  sub_10000DFE4();
  sub_10000DFD0( (void *)&_mh_execute_header,  v2,  v3,  "[%@] Incoming message from invalid destination: %@",  v4,  v5,  v6,  v7,  v8);

  sub_10000DFFC();
}

id objc_msgSend_initWithDestination_message_data_forceLocalDelivery_expectsResponse_response_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDestination:message:data:forceLocalDelivery:expectsResponse:response:");
}

id objc_msgSend_sendMessage_data_toDestination_forceLocalDelivery_expectsResponse_response_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendMessage:data:toDestination:forceLocalDelivery:expectsResponse:response:");
}

id objc_msgSend_valueForProperty_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForProperty:");
}