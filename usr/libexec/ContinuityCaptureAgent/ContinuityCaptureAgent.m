id sub_100004C90()
{
  sub_100005E48();
  return [(id)qword_10000CED0 executeUserDisconnect];
}

void sub_100004CAC()
{
  if (qword_10000CEB0)
  {
    v0 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  qword_10000CEB0));
    if (qword_10000CEB8)
    {
      v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithUTF8String:](&OBJC_CLASS___NSMutableString, "stringWithUTF8String:"));
      id v26 = 0LL;
      v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"0[xX][0-9a-f]+",  1LL,  &v26));
      uint64_t v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstMatchInString:options:range:", v1, 0, 0, objc_msgSend(v1, "length")));
      if (v3)
      {
        v4 = (void *)v3;
        do
        {
          id v5 = [v4 range];
          v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "substringWithRange:", v5, v6));
          v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](&OBJC_CLASS___NSScanner, "scannerWithString:", v7));

          uint64_t v25 = 0LL;
          [v8 scanHexLongLong:&v25];
          v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%llu", v25));
          id v10 = [v4 range];
          objc_msgSend(v1, "replaceCharactersInRange:withString:", v10, v11, v9);
          id v12 = [v4 range];
          v13 = (char *)[v9 length] + (void)v12;

          uint64_t v14 = objc_claimAutoreleasedReturnValue( objc_msgSend( v2,  "firstMatchInString:options:range:",  v1,  0,  v13,  (_BYTE *)objc_msgSend(v1, "length") - v13));
          v4 = (void *)v14;
        }

        while (v14);
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue([v1 dataUsingEncoding:4]);
      id v26 = 0LL;
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v15,  1LL,  &v26));
      id v17 = v26;

      if (v17)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100006178((uint64_t)v17, v18, v19, v20, v21, v22, v23, v24);
        }
      }

      [(id)qword_10000CED0 executePostEvent:v0 data:v16];
    }
  }
}

id sub_100004F0C()
{
  return [(id)qword_10000CED0 logDebugInfo];
}

id sub_100004F28()
{
  return [(id)qword_10000CED0 disableAutoTransportSwitch:1];
}

id sub_100004F48()
{
  return [(id)qword_10000CED0 disableAutoTransportSwitch:0];
}

void sub_100004F68()
{
  if (qword_10000CEB0)
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s", qword_10000CEB0));
    if (qword_10000CEB8) {
      uint64_t v0 = atol((const char *)qword_10000CEB8);
    }
    else {
      uint64_t v0 = 0LL;
    }
    v1 = (void *)qword_10000CED0;
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v0));
    [v1 setControlValue:v3 value:v2];
  }

id sub_100005018()
{
  return [(id)qword_10000CED0 unhideDevice];
}

id sub_100005034()
{
  qword_10000CEC0 = (uint64_t)"Unknown";
  sub_100005E48();
  return [(id)qword_10000CED0 currentDeviceList];
}

void sub_100005408(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8LL);
    int v3 = 138412290;
    uint64_t v4 = v2;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Execute state change for %@ failed",  (uint8_t *)&v3,  0xCu);
  }

  if (!gCLIInteractiveMode) {
    exit(1);
  }
}

void sub_100005730(id a1, NSDictionary *a2)
{
  uint64_t v2 = a2;
  NSLog(@"%@", v2);
  if (!gCLIInteractiveMode) {
    exit(0);
  }
}

void sub_100005970(uint64_t a1, void *a2)
{
  id v3 = a2;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
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
        NSLog(@"%@", *(void *)(*((void *)&v8 + 1) + 8LL * (void)v7));
        v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v5);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t start(uint64_t a1, uint64_t a2)
{
  if ((int)a1 >= 2 && !strcmp(*(const char **)(a2 + 8), "server"))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "200.0.1";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "cca start, log version:%s",  (uint8_t *)&buf,  0xCu);
    }

    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    TargetingWorkloopWithPriority = (void *)FigDispatchQueueCreateTargetingWorkloopWithPriority( "com.apple.continuitycapture.provider",  v6,  14LL);

    __int128 v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v9 =  [v8 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.portrait.BackgroundReplacement"];

    id v10 = [[CMContinuityCaptureProvider alloc] initWithQueue:TargetingWorkloopWithPriority];
    __int128 v11 = (void *)qword_10000CEC8;
    qword_10000CEC8 = (uint64_t)v10;

    if (qword_10000CEC8)
    {
      [(id)qword_10000CEC8 activate];
      if (qword_10000CEC8)
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue( +[CMContinuityCaptureXPCServerCCA sharedInstance]( &OBJC_CLASS___CMContinuityCaptureXPCServerCCA,  "sharedInstance"));
        [v12 startListeningWithDelegate:qword_10000CEC8];

        v13 = (void *)qword_10000CEC8;
      }

      else
      {
        v13 = 0LL;
      }

      objc_initWeak(&location, v13);
      *(void *)&__int128 buf = _NSConcreteStackBlock;
      *((void *)&buf + 1) = 3221225472LL;
      uint64_t v20 = sub_100005ED8;
      uint64_t v21 = &unk_100008328;
      objc_copyWeak(&v22, &location);
      if (qword_10000CED8 != -1) {
        dispatch_once(&qword_10000CED8, &buf);
      }
      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
      uint64_t v14 = TargetingWorkloopWithPriority;
      objc_initWeak(&location, (id)qword_10000CEC8);
      dispatch_source_t v15 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, v14);
      v16 = (void *)qword_10000CEE0;
      qword_10000CEE0 = (uint64_t)v15;

      id v17 = (dispatch_source_s *)qword_10000CEE0;
      *(void *)&__int128 buf = _NSConcreteStackBlock;
      *((void *)&buf + 1) = 3221225472LL;
      uint64_t v20 = sub_1000060AC;
      uint64_t v21 = &unk_100008328;
      objc_copyWeak(&v22, &location);
      dispatch_source_set_event_handler(v17, &buf);
      dispatch_activate((dispatch_object_t)qword_10000CEE0);
      if ((objc_opt_respondsToSelector(&OBJC_CLASS___CMIOExtensionProvider, "ignoreSIGTERM") & 1) != 0) {
        +[CMIOExtensionProvider ignoreSIGTERM](&OBJC_CLASS___CMIOExtensionProvider, "ignoreSIGTERM");
      }
      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);

      CFRunLoopRun();
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "ContinuityCaptureAgent client, start",  (uint8_t *)&buf,  2u);
    }

    CLIInit(a1, a2);
    CLIParse(&unk_10000C8A8, 0LL);
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "ContinuityCaptureAgent, exit",  (uint8_t *)&buf,  2u);
  }

  return 0LL;
}

void sub_100005E24( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_100005E48()
{
  if (qword_10000CEC0) {
    BOOL v0 = qword_10000CED0 == 0;
  }
  else {
    BOOL v0 = 0;
  }
  if (v0)
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s", qword_10000CEC0));
    v1 = -[CMContinuityCaptureAgentXPCClient initWithDeviceIdentifier:]( objc_alloc(&OBJC_CLASS___CMContinuityCaptureAgentXPCClient),  "initWithDeviceIdentifier:",  v3);
    uint64_t v2 = (void *)qword_10000CED0;
    qword_10000CED0 = (uint64_t)v1;
  }

void sub_100005ED8(uint64_t a1)
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100005F70;
  v4[3] = &unk_100008300;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  os_state_add_handler(v3, v4);

  objc_destroyWeak(&v5);
}

_DWORD *sub_100005F70(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(a2 + 16) & 0xFFFFFFFE) != 2) {
    return 0LL;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained && (uint64_t v4 = objc_claimAutoreleasedReturnValue([WeakRetained debugInfo])) != 0)
  {
    id v5 = (void *)v4;
    id v18 = 0LL;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v4,  100LL,  0LL,  &v18));
    id v7 = v18;
    if (v7)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000061E8((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
      }
      dispatch_source_t v15 = 0LL;
    }

    else
    {
      id v16 = [v6 length];
      dispatch_source_t v15 = calloc(1uLL, (size_t)v16 + 200);
      __strlcpy_chk(v15 + 34, "ContinuityCaptureAgent state", 64LL, 64LL);
      _DWORD *v15 = 1;
      v15[1] = (_DWORD)v16;
      [v6 getBytes:v15 + 50 length:v16];
    }
  }

  else
  {
    dispatch_source_t v15 = 0LL;
  }

  return v15;
}

id sub_1000060AC(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "ContinuityCaptureAgent, SIGTERM called ",  buf,  2u);
  }

  id result = objc_loadWeakRetained((id *)(a1 + 32));
  if (result)
  {
    [result cancel];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "ContinuityCaptureAgent, SIGTERM cancel complete, exiting ",  v3,  2u);
    }

    exit(0);
  }

  return result;
}

void sub_100006168( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100006178( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000061E8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}