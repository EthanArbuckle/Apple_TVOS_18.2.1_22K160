void sub_100001B70(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_100001BE0()
{
}

id sub_100001BFC(uint64_t a1, void *a2)
{
  uint64_t v7 = kCFErrorDebugDescriptionKey;
  v8 = a2;
  id v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"AUHSXPCSharedListenerErrorDomain",  a1,  v4));

  return v5;
}

id sub_100001E94(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  if ([v7 length]) {
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"'%@'", v7));
  }
  else {
    v10 = @"for whole-service management";
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ for listener %@; BEFORE ASSIGNING A BUG TO ANYONE ELSE, search backward for earlier logging regarding service/extension '%@'",
                    v9,
                    v10,
                    v8));

  id v12 = sub_100001BFC(a1, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  return v13;
}

void sub_100001F6C(os_unfair_lock_s *a1, void *a2)
{
  id v3 = a2;
  os_unfair_lock_lock(a1);
  v3[2]();
  os_unfair_lock_unlock(a1);
}

void sub_100001FB8(void *a1)
{
}

void sub_100001FCC(_Unwind_Exception *a1)
{
}

void sub_100002264( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_1000025C4(void *a1)
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100002698;
  handler[3] = &unk_10000CA50;
  id v3 = a1;
  v1 = (_xpc_connection_s *)v3;
  xpc_connection_set_event_handler(v1, handler);
  xpc_connection_resume(v1);
}

void sub_100002698(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  xpc_object_t xdict = v3;
  xpc_type_t type = xpc_get_type(xdict);
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (xdict != &_xpc_error_connection_invalid)
    {
      string = xpc_dictionary_get_string(xdict, _xpc_error_key_description);
      NSLog(@"%s %s", "xpc_event_handler_no_catch", string);
    }
  }

  else if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_object_t value = xpc_dictionary_get_value(xdict, off_100011618);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(value);
    id v9 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_string_get_string_ptr(v8));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000028A0;
    v14[3] = &unk_10000C700;
    id v15 = (id)objc_claimAutoreleasedReturnValue( +[AUHSXPCSharedListener sharedServiceListener]( &OBJC_CLASS___AUHSXPCSharedListener,  "sharedServiceListener"));
    id v16 = v10;
    id v17 = v4;
    id v18 = xdict;
    id v11 = v10;
    id v12 = v15;
    [v12 whileHoldingLock:v14];
  }

  else
  {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"connection received unknown message type");
  }
}

void sub_1000028A0(uint64_t a1)
{
  id v12 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) listeners]);
  v2 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:*(void *)(a1 + 40)]);
  if (v2)
  {
    if ([*(id *)(a1 + 32) shouldAcceptNewConnection:*(void *)(a1 + 48) forListenerNamed:*(void *)(a1 + 40)])
    {
      [*(id *)(a1 + 32) didAcceptNewConnection:*(void *)(a1 + 48)];
      int64_t v3 = 0LL;
      char v4 = 1;
    }

    else
    {

      v2 = 0LL;
      char v4 = 0;
      int64_t v3 = 5LL;
    }
  }

  else
  {
    NSLog(@"listener named %@ not found", *(void *)(a1 + 40));
    char v4 = 0;
    int64_t v3 = 3LL;
  }

  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 56));
  v6 = (_xpc_connection_s *)*(id *)(a1 + 48);
  id v7 = v2;
  id v8 = reply;
  id v9 = v8;
  if ((v4 & 1) == 0) {
    xpc_dictionary_set_int64(v8, "error-code", v3);
  }
  if (v7)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v7 endpoint]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 _endpoint]);
    xpc_dictionary_set_value(v9, "listener-endpoint", v11);
  }

  xpc_connection_send_message(v6, v9);
}

void sub_1000029F0(void *a1)
{
}

void sub_1000029FC(_Unwind_Exception *a1)
{
}

uint64_t sub_100002A10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100002A20(uint64_t a1)
{
}

void sub_100002A28(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) listeners]);
  id v6 = (id)objc_claimAutoreleasedReturnValue([v2 objectForKey:*(void *)(a1 + 40)]);

  uint64_t v3 = objc_claimAutoreleasedReturnValue([v6 endpoint]);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8LL);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_100002A94(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) listeners]);
  [v2 setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
}

id sub_100002AD4(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 16LL);
  if (!v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;

    id v2 = *(void **)(*(void *)(a1 + 32) + 16LL);
  }

  return [v2 addObject:*(void *)(a1 + 40)];
}

id sub_100002B28(uint64_t a1)
{
  return [*(id *)(a1 + 32) setListeners:0];
}

void sub_100002DC0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100002EC8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

LABEL_18:
        NSLog(@"%@ should but cannot work around rdar://problem/35553241", a1);
        if (v48)
        {
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_100004EA8;
          block[3] = &unk_10000C6D8;
          v65 = v51;
          dispatch_async(v15, block);
        }

        else
        {
          (*((void (**)(id, void, void))v51 + 2))(v51, 0LL, 0LL);
        }

LABEL_21:
        goto LABEL_22;
      }

      NSLog( @"%s encountered insufficiently BOOLish value of %@",  "canWorkAroundRadar35553241",  @"com.apple.private.xpc.launchd.per-user-lookup");
    }

    goto LABEL_18;
  }

  (*((void (**)(id, id, void))v51 + 2))(v51, v52, 0LL);
LABEL_22:
}

void sub_1000033FC(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    objc_exception_rethrow();
    __break(1u);
    JUMPOUT(0x100003414LL);
  }

  _Unwind_Resume(exception_object);
}

void sub_100003910( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

void sub_100003930(_Unwind_Exception *a1)
{
}

void sub_100003BF8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100003E2C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100004098(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___AUHSXPCSharedListenerManager));
    [v5 setRemoteObjectInterface:v6];

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000041E4;
    v13[3] = &unk_10000C988;
    id v14 = *(id *)(a1 + 32);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteObjectProxyWithErrorHandler:v13]);
    [v5 resume];
    uint64_t v8 = *(unsigned int *)(a1 + 40);
    uint64_t v9 = *(unsigned int *)(a1 + 44);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000041F4;
    v10[3] = &unk_10000CA00;
    id v12 = *(id *)(a1 + 32);
    id v11 = v5;
    [v7 builtForPlatform:v8 againstMinimumSDK:v9 reply:v10];
  }
}

uint64_t sub_1000041E4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1000041F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  [*(id *)(a1 + 32) invalidate];
}

void sub_100004268(_Unwind_Exception *a1)
{
}

void sub_100004284()
{
}

void sub_100004294(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___AUHSXPCSharedListenerManager));
    [v5 setRemoteObjectInterface:v6];

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000043CC;
    v11[3] = &unk_10000C988;
    id v12 = *(id *)(a1 + 32);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteObjectProxyWithErrorHandler:v11]);
    [v5 resume];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000043E0;
    v8[3] = &unk_10000C9B0;
    id v10 = *(id *)(a1 + 32);
    id v9 = v5;
    [v7 getProgramSDKVersion:v8];
  }
}

uint64_t sub_1000043CC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_1000043E0(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

void sub_100004424(_Unwind_Exception *a1)
{
}

void sub_100004440()
{
}

void sub_100004450(id *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    [a1[6] _failedToWarmUpClassNamed:a1[4] inServiceNamed:a1[5] dueTo:a3];
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___AUHSXPCSharedListenerManager));
    [v5 setRemoteObjectInterface:v6];

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100004594;
    v11[3] = &unk_10000C910;
    id v14 = a1[6];
    id v12 = a1[4];
    id v13 = a1[5];
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteObjectProxyWithErrorHandler:v11]);
    [v5 resume];
    id v8 = a1[4];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000045A8;
    v9[3] = &unk_10000C938;
    id v10 = v5;
    [v7 warmUpClassNamed:v8 withReply:v9];
  }
}

id sub_100004594(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 48) _failedToWarmUpClassNamed:*(void *)(a1 + 32) inServiceNamed:*(void *)(a1 + 40) dueTo:a2];
}

id sub_1000045A8(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

void sub_1000045B0(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___AUHSXPCSharedListener);
  id v2 = (void *)qword_1000118D0;
  qword_1000118D0 = (uint64_t)v1;

  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  0LL));
  [(id)qword_1000118D0 setListeners:v3];

  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSXPCListener anonymousListener](&OBJC_CLASS___NSXPCListener, "anonymousListener"));
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___AUHSXPCSharedListenerManagerDelegate);
  id v5 = (void *)qword_1000118D8;
  qword_1000118D8 = (uint64_t)v4;

  [(id)qword_1000118D8 setListener:v6];
  [v6 setDelegate:qword_1000118D8];
  [(id)qword_1000118D0 addListener:v6 withName:&stru_10000CE08];
}

void sub_100004674(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    if (*(void *)(a1 + 56))
    {
      id v8 = v6;
LABEL_4:
      **(void **)(a1 + 56) = v8;
    }
  }

  else
  {
    if (!v11)
    {
      if (!*(void *)(a1 + 56)) {
        goto LABEL_10;
      }
      id v10 = sub_100001E94(3LL, @"could not obtain endpoint", *(void **)(a1 + 32), *(void **)(a1 + 40));
      id v8 = (id)objc_claimAutoreleasedReturnValue(v10);
      goto LABEL_4;
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), a2);
    id v9 = *(void **)(a1 + 56);
    if (v9) {
      *id v9 = 0LL;
    }
  }

LABEL_10:
}
}

void sub_100004734(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = (uint64_t)v5;
    id v7 = 0LL;
  }

  else
  {
    id v8 = a2;
    id v7 = -[NSXPCConnection initWithListenerEndpoint:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithListenerEndpoint:",  v8);

    if (v7)
    {
      uint64_t v6 = 0LL;
    }

    else
    {
      id v9 = sub_100001E94( 4LL,  @"could not create connection given endpoint",  *(void **)(a1 + 32),  *(void **)(a1 + 40));
      uint64_t v6 = objc_claimAutoreleasedReturnValue(v9);
    }
  }

  id v10 = (id)v6;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_1000047E4(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    if (*(void *)(a1 + 56))
    {
      id v7 = v5;
LABEL_4:
      **(void **)(a1 + 56) = v7;
    }
  }

  else
  {
    if (!v13)
    {
      if (!*(void *)(a1 + 56)) {
        goto LABEL_10;
      }
      id v12 = sub_100001E94(3LL, @"could not obtain endpoint", *(void **)(a1 + 32), *(void **)(a1 + 40));
      id v7 = (id)objc_claimAutoreleasedReturnValue(v12);
      goto LABEL_4;
    }

    id v8 = -[NSXPCConnection initWithListenerEndpoint:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithListenerEndpoint:",  v13);
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8LL);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    id v11 = *(void **)(a1 + 56);
    if (v11) {
      void *v11 = 0LL;
    }
  }

void sub_1000048AC(uint64_t a1)
{
  id v2 = *(void **)(a1 + 72);
  uint64_t v4 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100004970;
  v7[3] = &unk_10000C858;
  id v8 = v3;
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 64);
  [v2 endpointForListenerNamed:v4 fromServiceNamed:v8 instanceIdentifier:v5 queue:v6 completion:v7];
}

void sub_100004970(uint64_t a1, void *a2, void *a3)
{
  unint64_t v7 = a2;
  uint64_t v5 = a3;
  if (!(v7 | v5))
  {
    id v6 = sub_100001E94(3LL, @"could not obtain endpoint", *(void **)(a1 + 32), *(void **)(a1 + 40));
    uint64_t v5 = objc_claimAutoreleasedReturnValue(v6);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_1000049EC(uint64_t a1)
{
  v1 = *(void **)(a1 + 80);
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100004ADC;
  v8[3] = &unk_10000C808;
  __int128 v7 = *(_OWORD *)(a1 + 64);
  id v6 = (id)v7;
  __int128 v9 = v7;
  [v1 endpointForListenerNamed:v2 fromServiceNamed:v3 instanceIdentifier:v4 queue:v5 completion:v8];
}

void sub_100004ADC(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v6 = a3;
  __int128 v7 = v6;
  if (v6) {
    NSLog( @"%s failed to obtain endpoint due to %@",  "+[AUHSXPCSharedListener connectionForListenerNamed:fromServiceNamed:instanceIdentifier:]_block_invoke_2",  v6);
  }
  else {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100004BD4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = a3;
  id v6 = a2;
  os_log_t v7 = os_log_create("com.apple.ViewBridge.AUHSXPCSharedListener", "AUHSXPCSharedListener");
  if (os_signpost_enabled(v7))
  {
    id v8 = v7;
    __int128 v9 = v8;
    os_signpost_id_t v10 = *(void *)(a1 + 40);
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v11 = @"success";
      if (v5) {
        id v11 = v5;
      }
      int v12 = 138412290;
      id v13 = v11;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_END,  v10,  "endpoint-lookup",  "%@",  (uint8_t *)&v12,  0xCu);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_100004D04(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  v11[0] = @"listenerName";
  v11[1] = @"serviceName";
  v12[0] = v5;
  v12[1] = v6;
  v11[2] = @"instanceIdentifier";
  id v8 = v7;
  if (!v7) {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v12[2] = v8;
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  3LL));
  if (!v7) {

  }
  return v9;
}

void sub_100004DFC(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue([a2 objectForKeyedSubscript:*(void *)(a1 + 32)]);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_100004E38(void *a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000054C8;
  v2[3] = &unk_10000C6D8;
  id v3 = a1;
  id v1 = v3;
  sub_100001F6C((os_unfair_lock_s *)&unk_1000118F0, v2);
}

uint64_t sub_100004EA8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100004EBC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000053C0;
  v6[3] = &unk_10000C700;
  id v7 = v3;
  id v8 = v4;
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  id v5 = v3;
  [v8 whileHoldingLock:v6];
}

void sub_100004F80(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100005070;
  v7[3] = &unk_10000C790;
  id v5 = v4;
  uint64_t v14 = *(void *)(a1 + 72);
  id v8 = v5;
  id v9 = v3;
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 56);
  id v13 = *(id *)(a1 + 64);
  id v6 = v3;
  [v5 whileHoldingLock:v7];
}

void sub_100005070(uint64_t a1)
{
  uint64_t v15 = 0LL;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 80) endpointForReply:*(void *)(a1 + 40) withListenerName:*(void *)(*(void *)(a1 + 32) + 32) replyErrorCode:&v15]);
  if (v15) {
    [*(id *)(a1 + 32) addError:v15 description:"returned by service" forListenerNamed:*(void *)(a1 + 48) fromServiceNamed:*(void *)(a1 + 56)];
  }
  if ((unint64_t)[*(id *)(*(void *)(a1 + 32) + 16) count] >= 2) {
    NSLog( @"while attempting to connect to %@, multiple errors occurred: %@",  *(void *)(a1 + 48),  *(void *)(*(void *)(a1 + 32) + 16LL));
  }
  if (![*(id *)(*(void *)(a1 + 32) + 16) count])
  {
    id v3 = *(void **)(a1 + 56);
    uint64_t v4 = *(void **)(a1 + 64);
    id v5 = *(id *)(a1 + 48);
    id v6 = v3;
    id v7 = v4;
    id v8 = v2;
    uint64_t v22 = 0LL;
    v23 = &v22;
    uint64_t v24 = 0x2020000000LL;
    char v25 = 0;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1000052A8;
    v19[3] = &unk_10000CA78;
    v21 = &v22;
    id v9 = v6;
    id v20 = v9;
    sub_1000052DC(v19);
    if (*((_BYTE *)v23 + 24))
    {
      id v10 = sub_100004D04(v5, v9, v7);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_10000534C;
      v16[3] = &unk_10000CAA0;
      id v12 = v11;
      id v17 = v12;
      id v18 = v8;
      sub_100004E38(v16);
    }

    _Block_object_dispose(&v22, 8);
  }

  uint64_t v13 = *(void *)(a1 + 72);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 16) firstObject]);
  (*(void (**)(uint64_t, void *, void *))(v13 + 16))(v13, v2, v14);
}

void sub_10000528C(_Unwind_Exception *a1)
{
}

id sub_1000052A8(uint64_t a1, void *a2)
{
  id result = [a2 containsObject:*(void *)(a1 + 32)];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_BYTE)result;
  return result;
}

void sub_1000052DC(void *a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100005368;
  v2[3] = &unk_10000C6D8;
  id v3 = a1;
  id v1 = v3;
  sub_100001F6C((os_unfair_lock_s *)&unk_1000118E0, v2);
}

void *sub_10000534C(void *result, void *a2)
{
  if ((byte_1000118C0 & 1) == 0) {
    return _[a2 setObject:result[5] forKeyedSubscript:result[4]];
  }
  return result;
}

uint64_t sub_100005368(uint64_t a1)
{
  if (!qword_1000118E8)
  {
    uint64_t v2 = objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](&OBJC_CLASS___NSMutableSet, "setWithCapacity:", 10LL));
    id v3 = (void *)qword_1000118E8;
    qword_1000118E8 = v2;
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1000053C0(uint64_t a1)
{
  xpc_type_t type = xpc_get_type(*(xpc_object_t *)(a1 + 32));
  id v3 = xpc_copy_description(*(xpc_object_t *)(a1 + 32));
  uint64_t v4 = v3;
  if (type == (xpc_type_t)&_xpc_type_error) {
    [*(id *)(a1 + 40) addError:2 description:v3 forListenerNamed:*(void *)(a1 + 48) fromServiceNamed:*(void *)(a1 + 56)];
  }
  else {
    NSLog( @"while attempting to connect to %@, %s received %s",  *(void *)(a1 + 48),  "+[AUHSXPCSharedListener _endpointForListenerNamed:fromServiceNamed:instanceIdentifier:queue:async:completion:]_block_invoke_3",  v3);
  }
  free(v4);
}

uint64_t sub_1000054C8(uint64_t a1)
{
  if (!qword_1000118F8)
  {
    uint64_t v2 = objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  10LL));
    id v3 = (void *)qword_1000118F8;
    qword_1000118F8 = v2;
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10000551C(uint64_t a1, void *a2)
{
  id v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_100005550(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 removeAllObjects];
  if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1000055EC;
    v5[3] = &unk_10000C688;
    id v3 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    id v6 = v4;
    [v3 enumerateKeysAndObjectsUsingBlock:v5];
  }
}

void sub_1000055EC(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"serviceName"]);
}

void sub_100005678(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  a2));
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_1000056B8(id a1, NSMutableDictionary *a2)
{
  byte_1000118C0 = 1;
}

id sub_1000056DC(uint64_t a1, void *a2)
{
  return [a2 addObject:*(void *)(a1 + 32)];
}

void sub_10000599C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100005AD4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100006044( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}
}

void sub_1000062E0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1000063B0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  id v11 = v10;

  a9.super_class = (Class)&OBJC_CLASS___AUHostingService;
  -[_Unwind_Exception dealloc](&a9, "dealloc");
  _Unwind_Resume(a1);
}

void sub_100006440(void *a1)
{
}

void *sub_100006450(uint64_t a1, char a2)
{
  v6[0] = _NSConcreteStackBlock;
  v6[2] = sub_1000064D4;
  v6[3] = &unk_10000CAC8;
  uint64_t v3 = *(void **)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  v6[1] = 3221225472LL;
  char v8 = *(_BYTE *)(a1 + 48);
  id v7 = v3;
  char v9 = a2;
  uint64_t v4 = objc_retainBlock(v6);

  return v4;
}

void sub_1000064D4(uint64_t a1)
{
  uint64_t v2 = (void *)(a1 + 32);
  CAFormatter::CAFormatter((CAFormatter *)&v16, (const AudioComponentDescription *)(*(void *)(a1 + 32) + 24LL));
  uint64_t v3 = *v2;
  uint64_t v4 = (void *)(*v2 + 48LL);
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)&qword_100011950);
  if ((v5 & 1) == 0 && __cxa_guard_acquire(&qword_100011950))
  {
    sub_100006880("com.apple.coreaudio", "AUHostingService");
    __cxa_guard_release(&qword_100011950);
  }

  id v6 = (os_log_s *) (id) qword_100011940;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    id v18 = "AUHostingService.mm";
    __int16 v19 = 1024;
    int v20 = 186;
    __int16 v21 = 2080;
    uint64_t v22 = v16;
    __int16 v23 = 2080;
    uint64_t v24 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%25s:%-5d Releasing Audio Unit %s and disconnecting from Hosting Service %s",  buf,  0x26u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[AUHostingServiceInstanceMap sharedInstance]( &OBJC_CLASS___AUHostingServiceInstanceMap,  "sharedInstance"));
  char v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 8) audioUnitUUID]);
  [v7 unregisterInstance:v8];

  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 8);
  *(void *)(v9 + _Block_object_dispose((const void *)(v1 - 112), 8) = 0LL;

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16LL));
  [WeakRetained invalidate];

  id v12 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16LL));
  [v12 setExportedObject:0];

  if (*(_BYTE *)(a1 + 48))
  {
    atomic_load((unsigned int *)&unk_100011900);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  if (*(_BYTE *)(a1 + 49))
  {
    unsigned __int8 v13 = atomic_load((unsigned __int8 *)&qword_100011950);
    if ((v13 & 1) == 0 && __cxa_guard_acquire(&qword_100011950))
    {
      sub_100006880("com.apple.coreaudio", "AUHostingService");
      __cxa_guard_release(&qword_100011950);
    }

    uint64_t v14 = (os_log_s *) (id) qword_100011940;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      id v18 = "AUHostingService.mm";
      __int16 v19 = 1024;
      int v20 = 202;
      __int16 v21 = 2080;
      uint64_t v22 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%25s:%-5d Shutting down Audio Unit Hosting Service %s",  buf,  0x1Cu);
    }

    unsigned __int8 v15 = atomic_load((unsigned __int8 *)&qword_100011930);
    if ((v15 & 1) == 0 && __cxa_guard_acquire(&qword_100011930))
    {
      dword_100011908 = 0;
      qword_100011910 = (uint64_t)&off_10000CB20;
      qword_100011928 = (uint64_t)&qword_100011910;
      __cxa_guard_release(&qword_100011930);
    }

    os_unfair_lock_lock((os_unfair_lock_t)&dword_100011908);
    if (!qword_100011928) {
      sub_1000068B0();
    }
    (*(void (**)(uint64_t))(*(void *)qword_100011928 + 48LL))(qword_100011928);
    os_unfair_lock_unlock((os_unfair_lock_t)&dword_100011908);
  }

  if (v16) {
    free(v16);
  }
}

void sub_10000681C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10)
{
  if (a10) {
    free(a10);
  }
  _Unwind_Resume(a1);
}

void sub_100006880(const char *a1, const char *a2)
{
  qword_100011940 = 0LL;
  qword_100011948 = 0LL;
  os_log_t v2 = os_log_create(a1, a2);
  uint64_t v3 = (void *)qword_100011940;
  qword_100011940 = (uint64_t)v2;
}

void sub_1000068B0()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = &off_10000CB90;
}

void sub_1000068E4(std::exception *a1)
{
}

void *sub_100006900()
{
  id result = operator new(0x10uLL);
  *id result = &off_10000CB20;
  return result;
}

void sub_100006924(uint64_t a1, void *a2)
{
  *a2 = &off_10000CB20;
}

void sub_10000693C()
{
}

std::string *sub_10000694C(std::string *a1, char *__s)
{
  size_t v4 = strlen(__s);
  return sub_100006980(a1, __s, v4);
}

std::string *sub_100006980(std::string *__dst, const std::string::value_type *__src, size_t __len)
{
  LODWORD(v6) = (char)__dst->__r_.__value_.__s.__size_;
  if ((v6 & 0x80000000) != 0)
  {
    std::string::size_type cap = __dst->__r_.__value_.__l.__cap_;
    std::string::size_type v9 = (cap & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (v9 < __len)
    {
      std::string::size_type size = __dst->__r_.__value_.__l.__size_;
      goto LABEL_6;
    }

    std::string::size_type v6 = HIBYTE(cap);
    id v7 = (std::string *)__dst->__r_.__value_.__r.__words[0];
  }

  else
  {
    id v7 = __dst;
    if (__len > 0x16)
    {
      std::string::size_type size = __dst->__r_.__value_.__s.__size_;
      std::string::size_type v9 = 22LL;
LABEL_6:
      std::string::__grow_by_and_replace(__dst, v9, __len - v9, size, 0LL, size, __len, __src);
      return __dst;
    }
  }

  if (__len)
  {
    memmove(v7, __src, __len);
    LOBYTE(v6) = __dst->__r_.__value_.__s.__size_;
  }

  if ((v6 & 0x80) != 0) {
    __dst->__r_.__value_.__l.__size_ = __len;
  }
  else {
    __dst->__r_.__value_.__s.__size_ = __len & 0x7F;
  }
  v7->__r_.__value_.__s.__data_[__len] = 0;
  return __dst;
}

void sub_100006A98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006C24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006C70()
{
  unsigned __int8 v0 = atomic_load((unsigned __int8 *)&qword_100011950);
  if ((v0 & 1) == 0)
  {
    if (__cxa_guard_acquire(&qword_100011950))
    {
      qword_100011948 = 0LL;
      qword_100011940 = (uint64_t)os_log_create("com.apple.coreaudio", "AUHostingService");
      __cxa_guard_release(&qword_100011950);
    }
  }

uint64_t start()
{
  unsigned __int8 v0 = objc_autoreleasePoolPush();
  unsigned __int8 v1 = atomic_load((unsigned __int8 *)&qword_100011950);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_100011950))
  {
    sub_100006880("com.apple.coreaudio", "AUHostingService");
    __cxa_guard_release(&qword_100011950);
  }

  os_log_t v2 = (os_log_s *) (id) qword_100011940;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    std::string::size_type v9 = "AUHostingServiceMain.mm";
    __int16 v10 = 1024;
    int v11 = 112;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%25s:%-5d entering main()", (uint8_t *)&v8, 0x12u);
  }

  id v3 = +[AUHostingServiceInstanceMap sharedInstance](&OBJC_CLASS___AUHostingServiceInstanceMap, "sharedInstance");
  size_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener anonymousListener](&OBJC_CLASS___NSXPCListener, "anonymousListener"));
  unsigned __int8 v5 = objc_opt_new(&OBJC_CLASS___AUHostingServiceDelegate);
  [v4 setDelegate:v5];
  objc_storeStrong((id *)&qword_100011938, v4);
  atexit(sub_100007058);
  std::string::size_type v6 = (void *)objc_claimAutoreleasedReturnValue( +[AUHSXPCSharedListener sharedServiceListener]( &OBJC_CLASS___AUHSXPCSharedListener,  "sharedServiceListener"));
  [v6 addListener:v4 withName:@"AUHostingServiceMain"];
  [v6 resume];

  objc_autoreleasePoolPop(v0);
  return 0LL;
}

void sub_100006EA0( _Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, __int128 a10, int a11, __int16 a12, __int16 a13, void *a14, __int128 a15)
{
  if (a2 == 1)
  {
    id v20 = objc_begin_catch(a1);
    sub_100006C70();
    __int16 v21 = (os_log_s *)*(id *)(v17 + 2368);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = (id)objc_claimAutoreleasedReturnValue([v20 name]);
      id v23 = (id)objc_claimAutoreleasedReturnValue([v20 reason]);
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v20 userInfo]);
      char v25 = (void *)objc_claimAutoreleasedReturnValue([v20 callStackSymbols]);
      LODWORD(va_start(va, a9) = 136316418;
      *(void *)((char *)&a9 + 4) = "AUHostingServiceMain.mm";
      WORD6(va_start(va, a9) = 1024;
      *(_DWORD *)((char *)&a9 + 14) = 119;
      WORD1(a10) = 2112;
      *(void *)((char *)&a10 + 4) = v22;
      WORD6(a10) = 2112;
      *(void *)((char *)&a10 + 14) = v23;
      a13 = 2112;
      a14 = v24;
      LOWORD(a15) = 2112;
      *(void *)((char *)&a15 + 2) = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%25s:%-5d caught %@: '%@' with user dictionary %@ and call stack %@",  (uint8_t *)&a9,  0x3Au);
    }

    objc_end_catch();
    JUMPOUT(0x100006E28LL);
  }

  _Unwind_Resume(a1);
}

void sub_100007058()
{
  unsigned __int8 v0 = (void *)qword_100011938;
  qword_100011938 = 0LL;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__UUID(void *a1, const char *a2, ...)
{
  return _[a1 _UUID];
}

id objc_msgSend__endpoint(void *a1, const char *a2, ...)
{
  return _[a1 _endpoint];
}

id objc_msgSend__endpointForListenerNamed_fromServiceNamed_instanceIdentifier_queue_async_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_endpointForListenerNamed:fromServiceNamed:instanceIdentifier:queue:async:completion:");
}

id objc_msgSend__failedToWarmUpClassNamed_inServiceNamed_dueTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_failedToWarmUpClassNamed:inServiceNamed:dueTo:");
}

id objc_msgSend__setEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setEndpoint:");
}

id objc_msgSend_addError_description_forListenerNamed_fromServiceNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addError:description:forListenerNamed:fromServiceNamed:");
}

id objc_msgSend_addListener_withName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addListener:withName:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_anonymousListener(void *a1, const char *a2, ...)
{
  return _[a1 anonymousListener];
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_audioUnitUUID(void *a1, const char *a2, ...)
{
  return _[a1 audioUnitUUID];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return _[a1 auditToken];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_builtForPlatform_againstMinimumSDK_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "builtForPlatform:againstMinimumSDK:reply:");
}

id objc_msgSend_callStackSymbols(void *a1, const char *a2, ...)
{
  return _[a1 callStackSymbols];
}

id objc_msgSend_classesForSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "classesForSelector:argumentIndex:ofReply:");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_connectToService_listener_queue_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectToService:listener:queue:completion:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didAcceptNewConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didAcceptNewConnection:");
}

id objc_msgSend_endpoint(void *a1, const char *a2, ...)
{
  return _[a1 endpoint];
}

id objc_msgSend_endpointForListenerNamed_fromServiceNamed_instanceIdentifier_queue_async_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endpointForListenerNamed:fromServiceNamed:instanceIdentifier:queue:async:completion:");
}

id objc_msgSend_endpointForListenerNamed_fromServiceNamed_instanceIdentifier_queue_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endpointForListenerNamed:fromServiceNamed:instanceIdentifier:queue:completion:");
}

id objc_msgSend_endpointForReply_withListenerName_replyErrorCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endpointForReply:withListenerName:replyErrorCode:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_getProgramSDKVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getProgramSDKVersion:");
}

id objc_msgSend_getUUIDBytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getUUIDBytes:");
}

id objc_msgSend_initWithConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConnection:");
}

id objc_msgSend_initWithConnection_config_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConnection:config:");
}

id objc_msgSend_initWithListenerEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithListenerEndpoint:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_instancesRespondToSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "instancesRespondToSelector:");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_listenerEndpointForService_instanceIdentifier_listener_queue_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "listenerEndpointForService:instanceIdentifier:listener:queue:completion:");
}

id objc_msgSend_listeners(void *a1, const char *a2, ...)
{
  return _[a1 listeners];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "raise:format:");
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return _[a1 reason];
}

id objc_msgSend_registerInstance_instance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerInstance:instance:");
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_retrieveInstance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retrieveInstance:");
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setListener_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setListener:");
}

id objc_msgSend_setListeners_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setListeners:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithCapacity:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedServiceListener(void *a1, const char *a2, ...)
{
  return _[a1 sharedServiceListener];
}

id objc_msgSend_shouldAcceptNewConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldAcceptNewConnection:");
}

id objc_msgSend_shouldAcceptNewConnection_forListenerNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldAcceptNewConnection:forListenerNamed:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_superclass(void *a1, const char *a2, ...)
{
  return _[a1 superclass];
}

id objc_msgSend_unregisterInstance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterInstance:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_warmUpClassNamed_withReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "warmUpClassNamed:withReply:");
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return _[a1 weakObjectsHashTable];
}

id objc_msgSend_whileHoldingLock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "whileHoldingLock:");
}