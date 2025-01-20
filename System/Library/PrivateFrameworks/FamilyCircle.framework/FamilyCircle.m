void sub_1000029B0()
{
  void *v0;
  CFRunLoopRef Current;
  dispatch_source_s *v2;
  void handler[5];
  signal(15, (void (__cdecl *)(int))1);
  v0 = objc_autoreleasePoolPush();
  Current = CFRunLoopGetCurrent();
  v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, &_dispatch_main_q);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100002A64;
  handler[3] = &unk_100040E10;
  handler[4] = Current;
  dispatch_source_set_event_handler(v2, handler);
  dispatch_resume(v2);
  CFRunLoopRun();

  objc_autoreleasePoolPop(v0);
}

void sub_100002A64(uint64_t a1)
{
}

void start()
{
  v0 = objc_autoreleasePoolPush();
  v1 = objc_alloc_init(&OBJC_CLASS___FAServiceDelegateQueueProvider);
  v2 = -[FamilyCircleServiceDelegate initWithQueueProvider:]( objc_alloc(&OBJC_CLASS___FamilyCircleServiceDelegate),  "initWithQueueProvider:",  v1);
  v3 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.familycircle.agent");
  -[NSXPCListener setDelegate:](v3, "setDelegate:", v2);
  -[NSXPCListener resume](v3, "resume");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyCircleServiceDelegate familyRefreshActivityScheduler](v2, "familyRefreshActivityScheduler"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FAPushHelperService sharedInstance](&OBJC_CLASS___FAPushHelperService, "sharedInstance"));
  [v5 setFamilyRefreshActivityScheduler:v4];

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FAPushHelperService sharedInstance](&OBJC_CLASS___FAPushHelperService, "sharedInstance"));
  [v6 start];

  objc_autoreleasePoolPop(v0);
  dispatch_main();
}

void *sub_100002D08(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) networkService]);
  +[FAFamilyCircleDaemonChangeHandler handleDidRemoveMemberWithNetworkService:completion:]( &OBJC_CLASS___FAFamilyCircleDaemonChangeHandler,  "handleDidRemoveMemberWithNetworkService:completion:",  v4,  0LL);

  uint64_t v7 = _FALogSystem(v5, v6);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "FARemoveFamilyMemberOperation removeMember complete with: %@",  (uint8_t *)&v10,  0xCu);
  }

  return &__kCFBooleanTrue;
}

id sub_10000320C(uint64_t a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) networkService]);
  v2 = (void *)objc_claimAutoreleasedReturnValue([v1 ensureAccount]);

  return v2;
}

id sub_100003248(uint64_t a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 88) load]);
  v2 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v1 catch]);
  uint64_t v3 = ((uint64_t (**)(void, Block_layout *))v2)[2](v2, &stru_100040EE0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

id sub_1000032B4(id a1, NSError *a2)
{
  return 0LL;
}

id sub_1000032BC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) _shouldFetchFromServer:v3])
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) fetchCircleFromServerWithCacheResponse:v3]);
    uint64_t v5 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v4 catch]);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100003444;
    v18[3] = &unk_100040F30;
    id v19 = v3;
    uint64_t v6 = ((uint64_t (**)(void, void *))v5)[2](v5, v18);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    unsigned __int8 v9 = [v8 BOOLForKey:FAFamilyMarqueeHasEverBeenCalled];

    if ((v9 & 1) == 0)
    {
      uint64_t v12 = _FALogSystem(v10, v11);
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Requested marquee for first time and setting member count on familycircle cache hit.",  v17,  2u);
      }

      [*(id *)(*(void *)(a1 + 32) + 40) updateMarqueeCache];
    }

    v14 = *(void **)(a1 + 32);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v3 familyCircle]);
    [v14 updateUserDefaultsWithFamilyCircle:v15];

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 familyCircle]);
  }

  return v7;
}

id sub_100003444(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = _FALogSystem(v3, v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_100029D48(v3, v6);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) familyCircle]);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[FAFailedFetchInfoError errorWithCachedFamilyCircle:underlyingError:]( &OBJC_CLASS___FAFailedFetchInfoError,  "errorWithCachedFamilyCircle:underlyingError:",  v7,  v3));

  return v8;
}

LABEL_19:
      id v3 = 1;
      goto LABEL_20;
    }

    if (v6 == 2)
    {
      uint64_t v11 = _FALogSystem(2LL, v7);
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Attempting to fetch the family circle from the server because cachePolicy=FACachePolicyReloadIgnoringCache",  buf,  2u);
      }

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[FAFetchFamilyCircleOperation rateLimiter](self, "rateLimiter"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[FAFetchFamilyCircleOperation clientProcess](self, "clientProcess"));
      id v3 = [v13 isAllowedWithClientName:v14];
    }
  }

  else if (v6)
  {
    if (v6 == 1)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue([v5 familyCircle]);

      if (v8)
      {
        id v3 = !-[FAFetchFamilyCircleOperation _isCacheValid:](self, "_isCacheValid:", v5);
        goto LABEL_20;
      }

      v21 = _FALogSystem(v9, v10);
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v23 = 0;
        id v19 = "Attempting to fetch the family circle from the server because there is no cache";
        v20 = (uint8_t *)&v23;
        goto LABEL_18;
      }

      goto LABEL_19;
    }
  }

  else
  {
    v15 = _FALogSystem(0LL, v7);
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Skipping fetching the family circle from the server because cachePolicy=FACachePolicyReturnCacheDontLoad",  v24,  2u);
    }

    id v3 = 0;
  }

    uint64_t v6 = v20;
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

LABEL_20:
  return v3 & 1;
}

LABEL_13:
    uint64_t v10 = [v6 isParent];
    uint64_t v12 = _FALogSystem(v10, v11);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)v10)
    {
      if (v14)
      {
        *(_DWORD *)buf = 138412290;
        v22 = v6;
        v15 = "The is-me member %@ is a parent/approver as expected in the cached family circle";
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v15, buf, 0xCu);
      }
    }

    else if (v14)
    {
      *(_DWORD *)buf = 138412290;
      v22 = v6;
      v15 = "Forcing a server fetch of the family circle because the is-me member %@ is not a parent/approver";
      goto LABEL_18;
    }

    goto LABEL_20;
  }

  LOBYTE(v10) = 1;
LABEL_20:

  return (char)v10;
}
}

    result = sub_100021B58(a5, a6);
    *a1 = v13;
    return result;
  }

  if ((a6 & 0x1000000000000000LL) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000LL) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }

  v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Unexpectedly found nil while unwrapping an Optional value",  57LL,  2LL,  "Swift/StringTesting.swift",  25LL,  2,  151LL,  0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableRawPointer.initializeMemory overlapping range",  58LL,  2LL,  "Swift/UnsafeRawPointer.swift",  28LL,  v14,  1173LL,  0);
    __break(1u);
    return result;
  }

id sub_100003A4C(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _fetchCircleRequestWithCacheResponse:*(void *)(a1 + 40)]);
  id v3 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v2 catch]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100003B5C;
  v12[3] = &unk_100040FA8;
  uint64_t v4 = *(void **)(a1 + 40);
  v12[4] = *(void *)(a1 + 32);
  id v13 = v4;
  uint64_t v5 = ((uint64_t (**)(void, void *))v3)[2](v3, v12);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v6 then]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100003C64;
  v11[3] = &unk_100040FD0;
  v11[4] = *(void *)(a1 + 32);
  uint64_t v8 = ((uint64_t (**)(void, void *))v7)[2](v7, v11);
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

id sub_100003B5C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 code] == (id)401
    && (uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]),
        unsigned int v5 = [v4 isEqual:@"com.apple.appleaccount"],
        v4,
        v5))
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _renewCredentials]);
    uint64_t v7 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v6 then]);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100003C58;
    v12[3] = &unk_100040F80;
    uint64_t v8 = *(void **)(a1 + 40);
    v12[4] = *(void *)(a1 + 32);
    id v13 = v8;
    uint64_t v9 = ((uint64_t (**)(void, void *))v7)[2](v7, v12);
    id v10 = (id)objc_claimAutoreleasedReturnValue(v9);
  }

  else
  {
    id v10 = v3;
  }

  return v10;
}

id sub_100003C58(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchCircleRequestWithCacheResponse:*(void *)(a1 + 40)];
}

id sub_100003C64(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(*(void *)(a1 + 32) + 32) reschedule];
  +[FAFamilyCFUScheduler scheduleWakeupIfNeeded](&OBJC_CLASS___FAFamilyCFUScheduler, "scheduleWakeupIfNeeded");
  return v3;
}

void sub_100003DA0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_alloc(&OBJC_CLASS___FAFamilyDetailsRequest);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) networkService]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 account]);
  uint64_t v7 = -[FAFamilyDetailsRequest initWithAccount:](v4, "initWithAccount:", v6);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[FAFamilyDetailsRequest urlRequest](v7, "urlRequest"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allHTTPHeaderFields]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"Authorization"]);

  if (v10 && (id v11 = [v10 length]) != 0)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientProcess]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) context]);
    id v16 = [v15 length];

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientProcess]);
      v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) context]);
      uint64_t v19 = objc_claimAutoreleasedReturnValue([v17 stringByAppendingFormat:@"-%@", v18]);

      v14 = (void *)v19;
    }

    [v13 setObject:v14 forKeyedSubscript:@"X-Apple-Client-Process"];
    v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) cachePolicyString]);
    [v13 setObject:v20 forKeyedSubscript:@"X-Apple-Cache-Policy"];

    v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) familyCircle]);
    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) cacheDate]);
      [v22 timeIntervalSince1970];
      v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%ld",  (uint64_t)v23));
      [v13 setObject:v24 forKeyedSubscript:@"X-Apple-Cache-Date"];

      [*(id *)(a1 + 40) maxAge];
      v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%ld",  (uint64_t)v25));
      [v13 setObject:v26 forKeyedSubscript:@"X-Apple-Cache-MaxAge"];

      v27 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) serverTag]);
      [v13 setObject:v27 forKeyedSubscript:@"X-Apple-Cache-ServerTag"];
    }

    id v28 = [v13 copy];
    -[FAFamilyDetailsRequest setCustomHeaders:](v7, "setCustomHeaders:", v28);

    uint64_t v29 = _FASignpostLogSystem();
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    uint64_t v31 = _FASignpostCreate();
    uint64_t v33 = v32;

    uint64_t v34 = _FASignpostLogSystem();
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    v36 = v35;
    if ((unint64_t)(v31 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v36,  OS_SIGNPOST_INTERVAL_BEGIN,  v31,  "FetchFamilyCircleRequest",  " enableTelemetry=YES ",  buf,  2u);
    }

    uint64_t v37 = _FASignpostLogSystem();
    v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
      sub_100029E1C(v31, v38);
    }

    uint64_t v41 = _FALogSystem(v39, v40);
    v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Perform family details request.", buf, 2u);
    }

    v43 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) networkService]);
    v44 = (void *)objc_claimAutoreleasedReturnValue([v43 urlSession]);
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472LL;
    v47[2] = sub_100004214;
    v47[3] = &unk_100041020;
    uint64_t v49 = v31;
    uint64_t v50 = v33;
    id v48 = v3;
    -[FAFamilyDetailsRequest performRequestWithSession:withHandler:]( v7,  "performRequestWithSession:withHandler:",  v44,  v47);
  }

  else
  {
    uint64_t v45 = _FALogSystem(v11, v12);
    v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      sub_100029DDC(v46);
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  FAErrorDomain,  -1007LL,  0LL));
    (*((void (**)(id, void, void *))v3 + 2))(v3, 0LL, v13);
  }
}

void sub_100004214(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  unint64_t Nanoseconds = _FASignpostGetNanoseconds(a1[5], a1[6]);
  uint64_t v9 = _FASignpostLogSystem();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = v10;
  os_signpost_id_t v12 = a1[5];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    int v19 = 67240448;
    *(_DWORD *)v20 = [v6 statusCode];
    *(_WORD *)&v20[4] = 1026;
    *(_DWORD *)&v20[6] = [v7 code];
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v11,  OS_SIGNPOST_INTERVAL_END,  v12,  "FetchFamilyCircleRequest",  " StatusCode=%{public,signpost.telemetry:number1,name=StatusCode}d  ErrorCode=%{public,signpost.telemetry:number2,n ame=ErrorCode}d ",  (uint8_t *)&v19,  0xEu);
  }

  uint64_t v13 = _FASignpostLogSystem();
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    double v15 = (double)Nanoseconds / 1000000000.0;
    uint64_t v16 = a1[5];
    unsigned int v17 = [v6 statusCode];
    unsigned int v18 = [v7 code];
    int v19 = 134218752;
    *(void *)v20 = v16;
    *(_WORD *)&v20[8] = 2048;
    double v21 = v15;
    __int16 v22 = 1026;
    unsigned int v23 = v17;
    __int16 v24 = 1026;
    unsigned int v25 = v18;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "END [%lld] %fs:FetchFamilyCircleRequest  StatusCode=%{public,signpost.telemetry:number1,name=StatusCode}d  ErrorCo de=%{public,signpost.telemetry:number2,name=ErrorCode}d ",  (uint8_t *)&v19,  0x22u);
  }

  (*(void (**)(void))(a1[4] + 16LL))();
}

id sub_1000043E8(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _familyCircleWithResponse:a2];
}

void sub_100004490(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = _FALogSystem(v3, v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Handling server response.", v14, 2u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) responseDictionary]);
  if (v7)
  {
    uint64_t v8 = *(void **)(a1 + 40);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) responseDictionary]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) httpResponse]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 allHeaderFields]);
    [v8 familyCircleWithServerResponse:v9 responseHeaders:v11 completion:v3];
  }

  else
  {
    os_signpost_id_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) error]);

    if (v12) {
      uint64_t v13 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) error]);
    }
    else {
      uint64_t v13 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  FAErrorDomain,  -1002LL,  0LL));
    }
    uint64_t v9 = (void *)v13;
    v3[2](v3, 0LL, v13);
  }
}

void sub_100004648(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = _FALogSystem(v3, v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Family details request returned 401. We need to re-auth...",  buf,  2u);
  }

  v19[0] = kACRenewCredentialsShouldForceKey;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [*(id *)(a1 + 32) promptUserToResolveAuthenticatonFailure]));
  v20[0] = v7;
  v19[1] = kACRenewCredentialsShouldAvoidUIKey;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [*(id *)(a1 + 32) promptUserToResolveAuthenticatonFailure] ^ 1));
  v20[1] = v8;
  v19[2] = kACRenewCredentialsServicesKey;
  uint64_t v18 = AAGrandSlamAppTokenIDiCloudSettings;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
  v20[2] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  3LL));

  id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _accountStore]);
  os_signpost_id_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) networkService]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 account]);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100004860;
  v15[3] = &unk_100041098;
  id v16 = v3;
  id v14 = v3;
  [v11 renewCredentialsForAccount:v13 options:v10 completion:v15];
}

void sub_100004860(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v7 = _FALogSystem(v5, v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134218242;
    uint64_t v12 = a2;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Result of renewing credentials for family details request: %ld. Error: %@",  (uint8_t *)&v11,  0x16u);
  }

  uint64_t v9 = *(void *)(a1 + 32);
  if (a2)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a2));
    (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v10, v5);
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 0LL));
    (*(void (**)(uint64_t, void *, void))(v9 + 16))(v9, v10, 0LL);
  }
}

void sub_1000050B4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [*(id *)(*(void *)(a1 + 32) + 40) updateMarqueeCache];
  uint64_t v7 = _FALogSystem(v5, v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v9)
    {
      int v10 = 136315394;
      int v11 = "-[FAFetchFamilyCircleOperation familyCircleWithServerResponse:responseHeaders:completion:]_block_invoke";
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s: failed to update family circle cache. Error: %@",  (uint8_t *)&v10,  0x16u);
    }
  }

  else
  {
    if (v9)
    {
      int v10 = 136315138;
      int v11 = "-[FAFetchFamilyCircleOperation familyCircleWithServerResponse:responseHeaders:completion:]_block_invoke";
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s: successfully updated family circle cache.",  (uint8_t *)&v10,  0xCu);
    }

    if ([*(id *)(a1 + 32) cachePolicy] != (id)2) {
      +[FABroadcaster broadcastFamilyChangedNotification]( &OBJC_CLASS___FABroadcaster,  "broadcastFamilyChangedNotification");
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_1000053D0(id a1, id a2)
{
  id v2 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[AMSBag bagForProfile:profileVersion:]( &OBJC_CLASS___AMSBag,  "bagForProfile:profileVersion:",  @"AppStore",  @"1"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringForKey:@"countryCode"]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:NSLocaleCountryCode]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 uppercaseString]);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000054EC;
  v10[3] = &unk_100041168;
  id v11 = v7;
  id v12 = v2;
  id v8 = v2;
  id v9 = v7;
  [v4 valueWithCompletion:v10];
}

void sub_1000054EC(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id v9 = v7;
  if (v6)
  {
    id v10 = v6;
    id v12 = v10;
  }

  else
  {
    uint64_t v13 = _FALogSystem(v7, v8);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100029F64(a1, v14, v15, v16, v17, v18, v19, v20);
    }

    id v10 = *(id *)(a1 + 32);
    id v12 = v10;
    if (!v10)
    {
      id v12 = FAUnknownStoreFrontCode;
      uint64_t v22 = _FALogSystem(v12, v21);
      unsigned int v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_100029F00((uint64_t)v12, v23, v24, v25, v26, v27, v28, v29);
      }
    }
  }

  uint64_t v30 = _FALogSystem(v10, v11);
  uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
    sub_100029E90((uint64_t)v12, v31);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_100005604( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

id sub_100005948(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 networkService]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v5,  "standardRequestWithURL:method:body:requestFormat:responseFormat:",  v4,  @"POST",  *(void *)(a1 + 40),  1,  objc_msgSend(*(id *)(a1 + 32), "responseFormat")));

  return v6;
}

id sub_1000059C4(id a1, id a2)
{
  return &__kCFBooleanTrue;
}

id sub_100005B8C(id a1, id a2)
{
  id v2 = a2;
  uint64_t v3 = _FALogSystem();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v2;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "FADeleteFamilyOperation deleteFamily complete with: %@",  (uint8_t *)&v6,  0xCu);
  }

  return &__kCFBooleanTrue;
}

void sub_100005F04(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dsid]);

  uint64_t v7 = _FALogSystem(v5, v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Fetching presets from screentime client",  buf,  2u);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) presetsProvider]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dsid]);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10000606C;
    v13[3] = &unk_100041230;
    id v12 = *(void **)(a1 + 48);
    v13[4] = *(void *)(a1 + 40);
    id v14 = v12;
    id v15 = v3;
    [v10 currentConfigurationForDSID:v11 completion:v13];
  }

  else
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No current presets, dsid == nil", buf, 2u);
    }

    (*((void (**)(id, void, void))v3 + 2))(v3, 0LL, 0LL);
  }
}

void sub_10000606C(void *a1, uint64_t a2, void *a3)
{
  uint64_t v5 = (void *)a1[4];
  uint64_t v6 = a1[5];
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue([v5 _presetsWithCurrentConfiguration:a2 expectedPreset:v6]);
  (*(void (**)(void))(a1[6] + 16LL))();
}

LABEL_34:
LABEL_36:
  return v16;
}

id sub_100006750(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:0]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  unsigned int v6 = [v4 isEqual:v5];

  if (v6)
  {

    id v4 = 0LL;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:1]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  unsigned int v9 = [v7 isEqual:v8];

  if (v9)
  {

    id v7 = 0LL;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 memberForAltDSID:*(void *)(a1 + 32)]);
  id v11 = [v10 age];
  id v13 = v11;
  if ((uint64_t)v11 <= 0)
  {
    uint64_t v14 = _FALogSystem(v11, v12);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v13));
      uint64_t v17 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v31 = v16;
      __int16 v32 = 2112;
      uint64_t v33 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Invalid FAFamilyMember age (%@) falling back to passed in age (%@)",  buf,  0x16u);
    }

    id v13 = [*(id *)(a1 + 40) integerValue];
  }

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_100006A14;
  v28[3] = &unk_100041278;
  v28[4] = v13;
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fa_firstObjectMatching:", v28));
  if (!v19)
  {
    uint64_t v20 = _FALogSystem(0LL, v18);
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100029FCC(v21);
    }
  }

  uint64_t v22 = -[AAFPromise initWithValue:](objc_alloc(&OBJC_CLASS___AAFPromise), "initWithValue:", v10);
  v29[0] = v22;
  unsigned int v23 = -[AAFPromise initWithValue:](objc_alloc(&OBJC_CLASS___AAFPromise), "initWithValue:", v19);
  v29[1] = v23;
  uint64_t v24 = -[AAFPromise initWithValue:](objc_alloc(&OBJC_CLASS___AAFPromise), "initWithValue:", v7);
  v29[2] = v24;
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v29, 3LL));
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[AAFPromise all:](&OBJC_CLASS___AAFPromise, "all:", v25));

  return v26;
}

BOOL sub_100006A14(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 minAge];
  uint64_t v5 = *(void *)(a1 + 32);
  BOOL v6 = (uint64_t)v4 <= v5 && v5 <= (uint64_t)[v3 maxAge];

  return v6;
}

id sub_100006A68(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:0]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  unsigned int v6 = [v4 isEqual:v5];

  if (v6)
  {

    id v4 = 0LL;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:1]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:2]);

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  unsigned int v10 = [v7 isEqual:v9];

  if (v10)
  {

    id v7 = 0LL;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _currentPresets:v4 expectedPreset:v7]);
  uint64_t v12 = -[AAFPromise initWithValue:](objc_alloc(&OBJC_CLASS___AAFPromise), "initWithValue:", v7, v11);
  v17[1] = v12;
  id v13 = -[AAFPromise initWithValue:](objc_alloc(&OBJC_CLASS___AAFPromise), "initWithValue:", v8);
  v17[2] = v13;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 3LL));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[AAFPromise all:](&OBJC_CLASS___AAFPromise, "all:", v14));

  return v15;
}

FASettingsPresetsResponse *__cdecl sub_100006C1C(id a1, NSArray *a2)
{
  id v2 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](v2, "objectAtIndexedSubscript:", 0LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  unsigned int v5 = [v3 isEqual:v4];

  if (v5)
  {

    id v3 = 0LL;
  }

  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](v2, "objectAtIndexedSubscript:", 1LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  unsigned int v8 = [v6 isEqual:v7];

  if (v8)
  {

    unsigned int v6 = 0LL;
  }

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](v2, "objectAtIndexedSubscript:", 2LL));
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  unsigned int v11 = [v9 isEqual:v10];

  if (v11)
  {

    unsigned int v9 = 0LL;
  }

  uint64_t v12 = -[FASettingsPresetsResponse initWithAvailablePresets:expectedPreset:currentPreset:]( objc_alloc(&OBJC_CLASS___FASettingsPresetsResponse),  "initWithAvailablePresets:expectedPreset:currentPreset:",  v9,  v6,  v3);

  return v12;
}

id sub_100006FD0(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 networkService]);
  uint64_t v5 = FAURLEndpointAgePresetsDefinition;
  unsigned int v9 = @"X-Mme-Country";
  id v10 = v3;
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 signedRequestWithEndpoint:v5 method:@"GET" headers:v6 plistBody:0]);
  return v7;
}

id sub_1000070AC(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 cache]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 URL]);

  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 loadForURL:v5]);
  return v6;
}

AAFPromise *__cdecl sub_10000711C(id a1, NSArray *a2)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray fa_map:](a2, "fa_map:", &stru_1000413D8));
  id v3 = -[AAFPromise initWithValue:](objc_alloc(&OBJC_CLASS___AAFPromise), "initWithValue:", v2);

  return v3;
}

id sub_10000716C(id a1, NSDictionary *a2)
{
  id v2 = a2;
  id v3 = [[FASettingsPreset alloc] initWithDictionary:v2];

  return v3;
}

void sub_1000073B0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1000073D4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained performHeartbeatCheckinWithCompletion:&stru_100041418];
}

void sub_100007408(id a1, int64_t a2)
{
  uint64_t v2 = _FALogSystem(a1, a2);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10002A00C(v3);
  }
}

uint64_t sub_1000075C0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16LL))(*(void *)(a1 + 32), a2 > 0);
}

void sub_100007774(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.screenTimeSettingsCacheOperation", v4);
  id v3 = (void *)qword_1000526E0;
  qword_1000526E0 = (uint64_t)v2;
}

id sub_1000078F0(id a1, NSArray *a2)
{
  dispatch_queue_t v2 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](v2, "objectAtIndexedSubscript:", 0LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](v2, "objectAtIndexedSubscript:", 1LL));

  id v12 = 0LL;
  [v3 writeToURL:v4 options:0x40000000 error:&v12];
  id v5 = v12;
  id v7 = v5;
  if (v5)
  {
    uint64_t v8 = _FALogSystem(v5, v6);
    unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10002A04C((uint64_t)v4, (uint64_t)v7, v9);
    }
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v7 == 0LL));

  return v10;
}

void sub_100007A34(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v38 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 _fetchData:&v38]);
  id v6 = v38;
  uint64_t v8 = v6;
  if (v6)
  {
    uint64_t v9 = _FALogSystem(v6, v7);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10002A19C((uint64_t)v8, v10, v11, v12, v13, v14, v15, v16);
    }

    v3[2](v3, 0LL, v8);
  }

  else
  {
    if (v5)
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[FAScreentimeSettingsObjectCache objectWithData:]( &OBJC_CLASS___FAScreentimeSettingsObjectCache,  "objectWithData:",  v5));
      if (v18)
      {
        ((void (**)(id, void *, void *))v3)[2](v3, v18, 0LL);
      }

      else
      {
        uint64_t v28 = _FALogSystem(0LL, v17);
        uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          sub_10002A134(v29, v30, v31, v32, v33, v34, v35, v36);
        }

        uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  FAErrorDomain,  -1012LL,  0LL));
        v3[2](v3, 0LL, v37);
      }
    }

    else
    {
      uint64_t v19 = _FALogSystem(0LL, v7);
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_10002A0CC(v20, v21, v22, v23, v24, v25, v26, v27);
      }

      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  FAErrorDomain,  -1012LL,  0LL));
      v3[2](v3, 0LL, v18);
    }
  }
}

id sub_100007C84(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100007D0C;
  v8[3] = &unk_100041530;
  id v9 = v3;
  id v5 = v3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 _onQueue:v8]);

  return v6;
}

id sub_100007D0C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) checkResourceIsReachableAndReturnError:0];
  if ((_DWORD)v2)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    uint64_t v5 = *(void *)(a1 + 32);
    id v16 = 0LL;
    [v4 removeItemAtURL:v5 error:&v16];
    id v6 = v16;
  }

  else
  {
    uint64_t v7 = _FALogSystem(v2, v3);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
      sub_10002A200((os_log_s *)v4, v8, v9, v10, v11, v12, v13, v14);
    }
    id v6 = 0LL;
  }

  return v6;
}
}

void sub_100008010( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_100008028(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100008038(uint64_t a1)
{
}

void sub_100008040(void *a1)
{
  id v2 = (void *)a1[4];
  id v9 = 0LL;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 _cacheURLWithError:&v9]);
  id v4 = v9;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);

  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  v5,  0LL,  a1[6]));
    uint64_t v7 = *(void *)(a1[5] + 8LL);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }

  else if (v4 && a1[6])
  {
    *(void *)a1[6] = v4;
  }
}

void sub_100008168(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v6 = 0LL;
  uint64_t v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 _cacheURLWithError:&v6]);
  id v5 = v6;
  v3[2](v3, v4, v5);
}

id sub_100008274(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000082FC;
  v8[3] = &unk_100041530;
  id v9 = v3;
  id v5 = v3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 _onQueue:v8]);

  return v6;
}

id sub_1000082FC(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) path]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByDeletingLastPathComponent]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v5 = [v4 fileExistsAtPath:v3];

  if ((v5 & 1) != 0
    || (id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager")),
        id v11 = 0LL,
        [v6 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v11],
        id v7 = v11,
        v6,
        (uint64_t v8 = v7) == 0LL))
  {
    id v7 = 0LL;
    uint64_t v8 = *(void **)(a1 + 32);
  }

  id v9 = v8;

  return v9;
}

void sub_100008470(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [(id)objc_opt_class(*(void *)(a1 + 32)) cacheQueue];
  unsigned __int8 v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v4);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000851C;
  v7[3] = &unk_1000415A8;
  id v8 = *(id *)(a1 + 40);
  id v9 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

void sub_10000851C(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  id v6 = (id)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSError);
  if ((objc_opt_isKindOfClass(v6, v3) & 1) != 0)
  {
    id v4 = 0LL;
    id v5 = v6;
  }

  else
  {
    id v4 = v6;
    id v5 = 0LL;
  }

  (*(void (**)(void, id, id))(*(void *)(a1 + 40) + 16LL))(*(void *)(a1 + 40), v4, v5);
}

void sub_1000085B8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_1000088D4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v8 = _FALogSystem(v6, v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10002A2CC(v6, v10);
    }
  }

  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Successfully fetched family followup: %@",  (uint8_t *)&v16,  0xCu);
    }

    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"adsid"]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:AKFollowUpPushPayloadKey]);
    uint64_t v12 = v11;
    if (v10 && v11)
    {
      uint64_t v13 = *(void **)(a1 + 32);
      id v14 = [v11 mutableCopy];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v13 removeFamilyInvites:v14]);

      +[FAFollowupManager synchronizeFollowupWithPayload:altDSID:]( &OBJC_CLASS___FAFollowupManager,  "synchronizeFollowupWithPayload:altDSID:",  v15,  v10);
    }
  }
}

void sub_100008A44(uint64_t a1)
{
  uint64_t v2 = objc_alloc(&OBJC_CLASS___FANetworkService);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appleAccount]);
  id v4 = objc_alloc_init(&OBJC_CLASS___FADeviceInfo);
  id v5 = objc_alloc_init(&OBJC_CLASS___FAURLConfiguration);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AAURLSession sharedSession](&OBJC_CLASS___AAURLSession, "sharedSession"));
  id v9 = -[FANetworkService initWithAccount:deviceInfo:urlProvider:urlSession:]( v2,  "initWithAccount:deviceInfo:urlProvider:urlSession:",  v3,  v4,  v5,  v6);

  uint64_t v7 = -[FANetworkClient initWithNetworkService:]( objc_alloc(&OBJC_CLASS___FAFetchFollowupOperation),  "initWithNetworkService:",  v9);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[FAFetchFollowupOperation fetchFollowUps](v7, "fetchFollowUps"));
  [v8 onComplete:*(void *)(a1 + 40)];
}

void sub_100008EA8(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v4 = _FALogSystem(v2, v3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (v2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10002A360((uint64_t)v2, v6);
    }
  }

  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Family heartbeat activity registration has been completed!",  v7,  2u);
  }
}

void sub_1000091B4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (![*(id *)(a1 + 32) _checkAndDeferActivityIfNeeded:*(void *)(a1 + 40)])
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"callbackInterval"]);

    uint64_t v10 = _FALogSystem(v8, v9);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v12)
      {
        LOWORD(v1_Block_object_dispose(va, 8) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Family heartbeat operation completed successfully",  (uint8_t *)&v18,  2u);
      }

      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"callbackInterval"]);
      [v13 longLongValue];

      uint64_t v14 = *(void *)(a1 + 48);
      if (v14)
      {
        uint64_t v15 = *(void (**)(void))(v14 + 16);
LABEL_12:
        v15();
        goto LABEL_13;
      }

      goto LABEL_13;
    }

    if (v12)
    {
      int v16 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);
      int v18 = 138412290;
      uint64_t v19 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Failed to receive heartbeat callback interval with error: %@",  (uint8_t *)&v18,  0xCu);
    }
  }

  uint64_t v17 = *(void *)(a1 + 48);
  if (v17)
  {
    uint64_t v15 = *(void (**)(void))(v17 + 16);
    goto LABEL_12;
  }

void sub_1000096CC(id *a1, void *a2)
{
  id v3 = a1[4];
  id v6 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 account]);
  objc_msgSend(v6, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", v4, 0);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1[4] account]);
  objc_msgSend(v6, "aa_addLoggedInAppleIDHeaderWithAccount:", v5);

  [a1[5] signURLRequest:v6];
  [a1[6] signURLRequest:v6];
}

id sub_100009A38(uint64_t a1)
{
  dispatch_queue_attr_t v1 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) networkService]);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 ensureAccount]);

  return v2;
}

id sub_100009A74(uint64_t a1)
{
  dispatch_queue_attr_t v1 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) networkService]);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 signedRequestWithEndpoint:@"updateMemberFlag"]);

  return v2;
}

id sub_100009AB8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 mutableCopy];
  id v5 = *(void **)(a1 + 32);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 URL]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 urlByAddingParamsToURL:v6]);
  [v4 setURL:v7];

  [v4 setHTTPMethod:@"POST"];
  [*(id *)(a1 + 32) _addHeadersToRequest:v4];
  [*(id *)(a1 + 32) _addBodyToRequest:v4];
  id v8 = [v4 copy];

  return v8;
}

id sub_100009B70(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 networkService]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 plistWithRequest:v3]);

  return v5;
}

NSNumber *sub_100009BC8(uint64_t a1)
{
  return +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  *(unsigned __int8 *)(*(void *)(a1 + 32) + 16LL));
}

void sub_10000A53C(id a1)
{
  dispatch_queue_attr_t v1 = objc_alloc_init(&OBJC_CLASS___FAPushHelperService);
  uint64_t v2 = (void *)qword_1000526F0;
  qword_1000526F0 = (uint64_t)v1;
}

void sub_10000A82C(uint64_t a1)
{
  id v2 = objc_alloc_init(&OBJC_CLASS___FAURLConfiguration);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10000A8A0;
  v3[3] = &unk_100041770;
  v3[4] = *(void *)(a1 + 32);
  [v2 fetchAAURLConfigurationWithCompletion:v3];
}

void sub_10000A8A0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 apsEnvironment]);
  id v8 = [v7 length];
  if (!v8
    || (uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 apsEnvironment]),
        unsigned __int8 v11 = +[APSConnection isValidEnvironment:]( &OBJC_CLASS___APSConnection,  "isValidEnvironment:",  v10),  v10,  v9 = v7,  (v11 & 1) == 0))
  {
    uint64_t v12 = _FALogSystem(v8, v9);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10002A4C4((uint64_t)v7, v6, v13);
    }

    uint64_t v9 = (void *)APSEnvironmentProduction;
  }

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24LL), v9);
  uint64_t v16 = _FALogSystem(v14, v15);
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 24LL);
    int v35 = 138412290;
    uint64_t v36 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Starting APS connection with environment: %@",  (uint8_t *)&v35,  0xCu);
  }

  uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 24LL);
  uint64_t v20 = APSEnvironmentProduction;
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[PDSRegistrarService sharedInstance](&OBJC_CLASS___PDSRegistrarService, "sharedInstance"));
  uint64_t v22 = v21;
  if (v19 == v20)
  {
    [v21 registerToPDS:0];

    uint64_t v30 = _FALogSystem(v28, v29);
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v35) = 0;
      uint64_t v27 = "Registered PDSEnvironment Production";
      goto LABEL_13;
    }
  }

  else
  {
    [v21 registerToPDS:1];

    uint64_t v25 = _FALogSystem(v23, v24);
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v35) = 0;
      uint64_t v27 = "Registered PDSEnvironment Sandbox";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v27, (uint8_t *)&v35, 2u);
    }
  }

  uint64_t v31 = -[APSConnection initWithEnvironmentName:namedDelegatePort:queue:]( objc_alloc(&OBJC_CLASS___APSConnection),  "initWithEnvironmentName:namedDelegatePort:queue:",  *(void *)(*(void *)(a1 + 32) + 24LL),  @"com.apple.aps.family",  &_dispatch_main_q);
  uint64_t v32 = *(void *)(a1 + 32);
  uint64_t v33 = *(void **)(v32 + 8);
  *(void *)(v32 + _Block_object_dispose(va, 8) = v31;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setDelegate:");
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 16) allObjects]);
  [*(id *)(*(void *)(a1 + 32) + 8) _setEnabledTopics:v34];
}

void sub_10000B270( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

uint64_t sub_10000B288(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000B298(uint64_t a1)
{
}

id sub_10000B2A0(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 networkService]);
  uint64_t v5 = FAURLEndpointAgePresetsDefinition;
  uint64_t v9 = @"X-Mme-Country";
  id v10 = v3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 signedRequestWithEndpoint:v5 method:@"GET" headers:v6 plistBody:0]);
  return v7;
}

id sub_10000B37C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 URL]);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) networkService]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 serverRequest:v3 toFormat:2]);

  return v8;
}

id sub_10000B3F4(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 body]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"SettingsPresets"]);

  uint64_t v7 = _FALogSystem(v5, v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10002A5B4((uint64_t)v4, v8);
  }

  id v9 =  [*(id *)(a1 + 32) updateWithPresets:v4 requestURL:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fa_map:", &stru_1000417E0));

  return v10;
}

id sub_10000B4A8(id a1, NSDictionary *a2)
{
  id v2 = a2;
  id v3 = [[FASettingsPreset alloc] initWithDictionary:v2];

  return v3;
}

LABEL_8:
  return v9;
}

void sub_10000B9A4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

id sub_10000BD58(uint64_t a1)
{
  dispatch_queue_attr_t v1 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) networkService]);
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 ensureAccount]);

  return v2;
}

id sub_10000BD94(uint64_t a1)
{
  return _[*(id *)(a1 + 32) familyMemberMatchingDSID];
}

id sub_10000BD9C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = _FALogSystem(v3, v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = (void *)objc_opt_class(*(void *)(a1 + 32));
    *(_DWORD *)buf = 138412546;
    v55 = v7;
    __int16 v56 = 2112;
    id v57 = v3;
    id v8 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%@: Fetching photo for family member %@",  buf,  0x16u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 contact]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 thumbnailImageData]);

  if (v10)
  {
    uint64_t v13 = _FALogSystem(v11, v12);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_10002A740(v14);
    }

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v9 thumbnailImageData]);
    uint64_t v16 = *(double **)(a1 + 32);
    double v17 = v16[6];
    [v16 screenScale];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v15 _faCircularImageDataWithDiameter:v17 * v18]);
    goto LABEL_17;
  }

  uint64_t v20 = *(void **)(a1 + 32);
  if (v3)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v20 fetchCachedPhotoForFamilyMember:v3]);
    uint64_t v21 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v15 catch]);
    uint64_t v22 = ((uint64_t (**)(void, Block_layout *))v21)[2](v21, &stru_100041830);
    id v48 = (void *)objc_claimAutoreleasedReturnValue(v22);
    uint64_t v23 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v48 then]);
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472LL;
    v52[2] = sub_10000C278;
    v52[3] = &unk_100041858;
    v52[4] = *(void *)(a1 + 32);
    id v24 = v3;
    id v53 = v24;
    uint64_t v25 = ((uint64_t (**)(void, void *))v23)[2](v23, v52);
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    uint64_t v27 = (uint64_t (**)(void, void, void))objc_claimAutoreleasedReturnValue([v26 catchOnQueue]);
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472LL;
    v49[2] = sub_10000C2C0;
    v49[3] = &unk_100041880;
    v49[4] = *(void *)(a1 + 32);
    id v50 = v9;
    id v51 = v24;
    uint64_t v28 = ((uint64_t (**)(void, dispatch_queue_s *, void *))v27)[2](v27, &_dispatch_main_q, v49);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v28);

LABEL_9:
    goto LABEL_17;
  }

  uint64_t v29 = objc_claimAutoreleasedReturnValue([v20 fullname]);
  if (v29)
  {
    uint64_t v31 = (void *)v29;
    unsigned int v32 = [*(id *)(a1 + 32) useMonogramAsLastResort];

    if (v32)
    {
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) fullname]);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v33 componentsSeparatedByString:@" "]);

      uint64_t v21 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v15 firstObject]);
      else {
        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v15 lastObject]);
      }
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _monogramWithFirstName:v21 lastName:v34]);
      uint64_t v42 = _FALogSystem(v19, v41);
      v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        v44 = (void *)objc_opt_class(*(void *)(a1 + 32));
        uint64_t v45 = *(void **)(a1 + 32);
        id v46 = v44;
        v47 = (void *)objc_claimAutoreleasedReturnValue([v45 fullname]);
        *(_DWORD *)buf = 138412802;
        v55 = v44;
        __int16 v56 = 2048;
        id v57 = v19;
        __int16 v58 = 2112;
        v59 = v47;
        _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "%@: Monogram of caller-supplied full name returned %p for %@",  buf,  0x20u);
      }

      goto LABEL_9;
    }
  }

  uint64_t v35 = _FALogSystem(v29, v30);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v36 = (void *)objc_opt_class(*(void *)(a1 + 32));
    uint64_t v37 = *(void **)(a1 + 32);
    id v38 = v36;
    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v37 dsid]);
    *(_DWORD *)buf = 138412546;
    v55 = v36;
    __int16 v56 = 2112;
    id v57 = v39;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v15,  OS_LOG_TYPE_DEFAULT,  "%@: DSID %@ not found in family, and no full name was supplied. No image will be generated",  buf,  0x16u);
  }

  uint64_t v19 = 0LL;
LABEL_17:

  return v19;
}

id sub_10000C220(id a1, NSError *a2)
{
  id v2 = a2;
  uint64_t v4 = v2;
  if (v2)
  {
    uint64_t v5 = _FALogSystem(v2, v3);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10002A780((uint64_t)v4, v6);
    }
  }

  return 0LL;
}

id sub_10000C278(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) fetchRemotePhotoForFamilyMember:*(void *)(a1 + 40)]);
  }
  uint64_t v6 = v5;

  return v6;
}

id sub_10000C2C0(id *a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([a1[5] givenName]);
  if ([v2 length])
  {
  }

  else
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1[5] familyName]);
    id v5 = [v4 length];

    if (!v5)
    {
      id v14 = a1[4];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([a1[6] firstName]);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([a1[6] lastName]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v14 _monogramWithFirstName:v15 lastName:v16]);

      goto LABEL_7;
    }
  }

  uint64_t v6 = objc_claimAutoreleasedReturnValue([a1[4] _monogramForContact:a1[5]]);
  id v8 = (void *)v6;
LABEL_7:
  uint64_t v9 = _FALogSystem(v6, v7);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = (void *)objc_opt_class(a1[4]);
    id v12 = a1[6];
    int v17 = 138412802;
    double v18 = v11;
    __int16 v19 = 2048;
    uint64_t v20 = v8;
    __int16 v21 = 2112;
    id v22 = v12;
    id v13 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%@: Monogram of members first and last name returned %p for member %@",  (uint8_t *)&v17,  0x20u);
  }

  return v8;
}

void sub_10000C4B4(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = *(void **)(a1 + 32);
  if (v5[3] || v5[4])
  {
    uint64_t v6 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue([v5 fetchFamilyFactory]);
    uint64_t v7 = v6[2]();
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientProcess]);
    [v8 setClientProcess:v9];

    id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) context]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 runFetchFamilyCircleOperation:v8]);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10000C614;
    v14[3] = &unk_1000418D0;
    v14[4] = *(void *)(a1 + 32);
    id v15 = v4;
    [v11 onComplete:v14];
  }

  else
  {
    uint64_t v12 = _FALogSystem(v5, v3);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10002A7F4(v13);
    }

    (*((void (**)(id, void, void))v4 + 2))(v4, 0LL, 0LL);
  }
}

void sub_10000C614(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___FAFailedFetchInfoError);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    id v8 = v6;
    uint64_t v9 = v8;
    if (!v5) {
      id v5 = (id)objc_claimAutoreleasedReturnValue([v8 cachedFamilyCircle]);
    }
    id v6 = (id)objc_claimAutoreleasedReturnValue([v9 underlyingError]);
  }

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 members]);
  id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    id v20 = v6;
    uint64_t v12 = *(void *)v22;
    while (2)
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v10);
        }
        id v14 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        uint64_t v15 = *(void *)(a1 + 32);
        if (*(void *)(v15 + 24))
        {
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v21 + 1) + 8 * (void)i) dsid]);
          unsigned __int8 v17 = [v16 isEqualToNumber:*(void *)(*(void *)(a1 + 32) + 24)];

          if ((v17 & 1) != 0) {
            goto LABEL_18;
          }
          uint64_t v15 = *(void *)(a1 + 32);
        }

        if (*(void *)(v15 + 32))
        {
          double v18 = (void *)objc_claimAutoreleasedReturnValue([v14 hashedDSID]);
          unsigned __int8 v19 = [v18 isEqualToString:*(void *)(*(void *)(a1 + 32) + 32)];

          if ((v19 & 1) != 0)
          {
LABEL_18:
            id v11 = v14;
            goto LABEL_19;
          }
        }
      }

      id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v11) {
        continue;
      }
      break;
    }

AAFPromise *sub_10000CAE8(uint64_t a1)
{
  id v2 = objc_alloc(&OBJC_CLASS___AAFPromise);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000CB74;
  v7[3] = &unk_100041048;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v5 = -[AAFPromise initWithBlock:](v2, "initWithBlock:", v7);

  return v5;
}

void sub_10000CB74(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "aa_primaryAppleAccount"));
  id v6 = [[FAFamilyMemberPhotoRequest alloc] initWithAppleAccount:v5 grandSlamAccount:0 accountStore:v4];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dsid]);
  [v6 setFamilyMemberDSID:v7];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) context]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000CCA8;
  v12[3] = &unk_100041948;
  id v14 = v3;
  int8x16_t v11 = *(int8x16_t *)(a1 + 32);
  id v9 = (id)v11.i64[0];
  int8x16_t v13 = vextq_s8(v11, v11, 8uLL);
  id v10 = v3;
  [v8 runAAFamilyMemberPhotoRequest:v6 withCompletionHandler:v12];
}

void sub_10000CCA8(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___AAPhotoResponse);
  uint64_t isKindOfClass = objc_opt_isKindOfClass(v6, v8);
  if ((isKindOfClass & 1) != 0
    && (int8x16_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 photoData]), v11, v11))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000CE0C;
    block[3] = &unk_100041920;
    id v12 = v6;
    uint64_t v13 = *(void *)(a1 + 32);
    id v19 = v12;
    uint64_t v20 = v13;
    id v21 = *(id *)(a1 + 48);
    dispatch_async(&_dispatch_main_q, block);
  }

  else
  {
    uint64_t v14 = _FALogSystem(isKindOfClass, v10);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10002A834(a1, (uint64_t)v7, v15);
    }

    uint64_t v16 = *(void *)(a1 + 48);
    if (v7)
    {
      (*(void (**)(uint64_t, void, id))(v16 + 16))(v16, 0LL, v7);
    }

    else
    {
      unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError fa_familyErrorWithCode:](&OBJC_CLASS___NSError, "fa_familyErrorWithCode:", -1009LL));
      (*(void (**)(uint64_t, void, void *))(v16 + 16))(v16, 0LL, v17);
    }
  }
}

void sub_10000CE0C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  CGSize size = CGRectZero.size;
  CGPoint origin = CGRectZero.origin;
  CGSize v19 = size;
  id v4 = v2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 cropRect]);
  [v5 getValue:&origin size:32];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 photoData]);
  id v7 = *(double **)(a1 + 40);
  double v8 = v7[6];
  [v7 screenScale];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[AAFImage circularImageData:withDiameter:crop:]( &OBJC_CLASS___AAFImage,  "circularImageData:withDiameter:crop:",  v6,  v8 * v9,  origin,  v19));

  int8x16_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) cache]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 updateWithData:v10]);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000CF5C;
  v15[3] = &unk_1000418F8;
  id v13 = *(id *)(a1 + 48);
  id v16 = v10;
  id v17 = v13;
  id v14 = v10;
  [v12 onComplete:v15];
}

uint64_t sub_10000CF5C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32),  0LL);
}

void sub_10000D144( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

Class sub_10000D400(uint64_t a1)
{
  id v4 = 0LL;
  if (!qword_100052708)
  {
    __int128 v5 = off_100041990;
    uint64_t v6 = 0LL;
    qword_100052708 = _sl_dlopen(&v5, &v4);
    id v2 = v4;
    if (!qword_100052708)
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
    Class result = objc_getClass("UIScreen");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
      break;
    }
LABEL_7:
    id v2 = (char *)sub_10002A8E4();
LABEL_8:
    free(v2);
  }

  qword_100052700 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

void sub_10000D67C(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_t v2 = dispatch_queue_create("FAFetchFamilyCircleOperation Cache Queue", v4);
  id v3 = (void *)qword_100052710;
  qword_100052710 = (uint64_t)v2;
}

void sub_10000D7A4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_10000D7BC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000D7CC(uint64_t a1)
{
}

void sub_10000D7D4(void *a1)
{
  dispatch_queue_t v2 = (void *)a1[4];
  id v9 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 _cacheURLWithError:&v9]);
  id v4 = v9;
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);

  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  v5,  0LL,  a1[6]));
    uint64_t v7 = *(void *)(a1[5] + 8LL);
    double v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }

  else if (v4 && a1[6])
  {
    *(void *)a1[6] = v4;
  }
}

void sub_10000D934(uint64_t a1, void *a2)
{
  dispatch_queue_t v2 = *(void **)(a1 + 32);
  id v6 = 0LL;
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 loadWithError:&v6]);
  id v5 = v6;
  v3[2](v3, v4, v5);
}

void sub_10000E2EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v4 setObject:v5 forKeyedSubscript:@"timestamp"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _username]);
  [v4 setObject:v6 forKeyedSubscript:@"username"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) _serverResponse]);
  [v4 setObject:v7 forKeyedSubscript:@"circle"];

  [v4 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"serverTag"];
  uint64_t v9 = 0LL;
  double v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v4,  100LL,  0LL,  &v9));
  v3[2](v3, v8, v9);
}

void sub_10000E478(uint64_t a1, void *a2)
{
  dispatch_queue_t v2 = *(void **)(a1 + 32);
  id v6 = 0LL;
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 _cacheURLWithError:&v6]);
  id v5 = v6;
  v3[2](v3, v4, v5);
}

id sub_10000E584(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000E60C;
  v8[3] = &unk_100041530;
  id v9 = v3;
  id v5 = v3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 _onQueue:v8]);

  return v6;
}

id sub_10000E60C(uint64_t a1)
{
  dispatch_queue_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) path]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByDeletingLastPathComponent]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v5 = [v4 fileExistsAtPath:v3];

  if ((v5 & 1) != 0
    || (id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager")),
        id v11 = 0LL,
        [v6 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v11],
        id v7 = v11,
        v6,
        (double v8 = v7) == 0LL))
  {
    id v7 = 0LL;
    double v8 = *(void **)(a1 + 32);
  }

  id v9 = v8;

  return v9;
}

void sub_10000E7A4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [(id)objc_opt_class(*(void *)(a1 + 32)) cacheQueue];
  unsigned __int8 v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v4);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000E868;
  v8[3] = &unk_1000419F0;
  id v6 = *(void **)(a1 + 40);
  void v8[4] = *(void *)(a1 + 32);
  id v9 = v6;
  id v10 = *(id *)(a1 + 48);
  id v11 = v3;
  id v7 = v3;
  dispatch_async(v5, v8);
}

void sub_10000E868(uint64_t a1)
{
  dispatch_queue_t v2 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) _cacheDataWithFamilyCircle:*(void *)(a1 + 40) serverTag:*(void *)(a1 + 48)]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _createCacheFile]);
  v9[0] = v2;
  v9[1] = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 2LL));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[AAFPromise all:](&OBJC_CLASS___AAFPromise, "all:", v4));
  id v6 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v5 then]);
  uint64_t v7 = ((uint64_t (**)(void, Block_layout *))v6)[2](v6, &stru_1000419C8);
  double v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v8 onComplete:*(void *)(a1 + 56)];
}

id sub_10000E974(id a1, NSArray *a2)
{
  dispatch_queue_t v2 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](v2, "objectAtIndexedSubscript:", 0LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](v2, "objectAtIndexedSubscript:", 1LL));

  id v10 = 0LL;
  [v3 writeToURL:v4 options:1073741825 error:&v10];
  id v5 = v10;
  uint64_t v7 = _FALogSystem(v5, v6);
  double v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v12 = "-[FAFamilyCircleCache updateWithFamilyCircle:serverTag:]_block_invoke_3";
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: writeToURL completed error:%@", buf, 0x16u);
  }

  return v5;
}

void sub_10000EB2C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [(id)objc_opt_class(*(void *)(a1 + 32)) cacheQueue];
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v4);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000EBD8;
  v7[3] = &unk_1000415A8;
  id v8 = *(id *)(a1 + 40);
  id v9 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

void sub_10000EBD8(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  id v6 = (id)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSError);
  if ((objc_opt_isKindOfClass(v6, v3) & 1) != 0)
  {
    id v4 = 0LL;
    id v5 = v6;
  }

  else
  {
    id v4 = v6;
    id v5 = 0LL;
  }

  (*(void (**)(void, id, id))(*(void *)(a1 + 40) + 16LL))(*(void *)(a1 + 40), v4, v5);
}

id sub_10000ECE8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000ED70;
  v8[3] = &unk_100041530;
  id v9 = v3;
  id v5 = v3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 _onQueue:v8]);

  return v6;
}

id sub_10000ED70(uint64_t a1)
{
  id v2 = 0LL;
  if ([*(id *)(a1 + 32) checkResourceIsReachableAndReturnError:0])
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    uint64_t v4 = *(void *)(a1 + 32);
    id v6 = 0LL;
    [v3 removeItemAtURL:v4 error:&v6];
    id v2 = v6;
  }

  return v2;
}

void sub_10000EE14( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

id sub_10000F124(uint64_t a1)
{
  dispatch_queue_attr_t v1 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) networkService]);
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 ensureAccount]);

  return v2;
}

id sub_10000F160(uint64_t a1)
{
  dispatch_queue_attr_t v1 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) networkService]);
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 signedRequestWithEndpoint:@"updateFamilyMemberFlags"]);

  return v2;
}

id sub_10000F1A4(uint64_t a1, void *a2)
{
  id v3 = [a2 mutableCopy];
  [v3 setHTTPMethod:@"POST"];
  [*(id *)(a1 + 32) _addHeadersToRequest:v3];
  [*(id *)(a1 + 32) _addBodyToRequest:v3];
  id v4 = [v3 copy];

  return v4;
}

id sub_10000F204(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 networkService]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 plistWithRequest:v3]);

  return v5;
}

void *sub_10000F25C(uint64_t a1, void *a2)
{
  if (([a2 familyRefreshTriggered] & 1) == 0)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) networkService]);
    +[FAFamilyCircleDaemonChangeHandler handleDidUpdateMemberFlagWithNetworkService:completion:]( &OBJC_CLASS___FAFamilyCircleDaemonChangeHandler,  "handleDidUpdateMemberFlagWithNetworkService:completion:",  v3,  0LL);
  }

  return &__kCFBooleanTrue;
}

id sub_10000F820(id a1, id a2)
{
  id v2 = a2;
  uint64_t v5 = _FALogSystem(v2, v3, v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v2;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Got value %@", (uint8_t *)&v8, 0xCu);
  }

  return v2;
}

id sub_10000FD70(uint64_t a1)
{
  dispatch_queue_attr_t v1 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) networkService]);
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 ensureAccount]);

  return v2;
}

id sub_10000FDAC(uint64_t a1)
{
  id v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKey:](v2, "setObject:forKey:", @"application/x-plist", @"Content-Type");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) networkService]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( [v3 signedRequestWithEndpoint:@"familyHeartbeat" method:@"POST" headers:v2 plistBody:*(void *)(a1 + 40)]);

  return v4;
}

id sub_10000FE58(uint64_t a1, void *a2)
{
  id v3 = [a2 mutableCopy];
  [*(id *)(*(void *)(a1 + 32) + 16) signURLRequest:v3];
  [*(id *)(*(void *)(a1 + 32) + 24) signURLRequest:v3];
  id v4 = [v3 copy];

  return v4;
}

id sub_10000FEC4(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 networkService]);
  id v5 = [v3 copy];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 plistWithRequest:v5]);
  return v6;
}

NSDictionary *__cdecl sub_10000FF30(id a1, FAHTTPResponse *a2)
{
  return (NSDictionary *)-[FAHTTPResponse body](a2, "body");
}

void sub_10000FFF8(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (id)objc_claimAutoreleasedReturnValue([a2 uniqueIdentifier]);
  [v2 addObject:v3];
}

void sub_100010270( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_100010298(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 processName]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( [WeakRetained _fetchFamilyCircleWithCachePolicy:1000 signedInAccountShouldBeApprover:0 clientProcess:v6 context:@"refresh_xpc_activity" promptUserToR esolveAuthenticatonFailure:0]);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  void v9[2] = sub_100010388;
  v9[3] = &unk_100041AF8;
  id v10 = v3;
  id v8 = v3;
  [v7 onComplete:v9];
}

uint64_t sub_100010388(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100010398(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(&OBJC_CLASS___FAFamilyCircleCache);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _primaryAccount]);
  id v6 = -[FAFamilyCircleCache initWithAccount:](v4, "initWithAccount:", v5);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[FAFamilyCircleCache load](v6, "load"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  void v9[2] = sub_100010468;
  v9[3] = &unk_100041B48;
  id v10 = v3;
  id v8 = v3;
  [v7 onComplete:v9];
}

uint64_t sub_100010468(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1000108E0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 72);
  id v4 = *(void **)(a1 + 32);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"ClientProcess"]);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 40) objectForKeyedSubscript:@"promptUserToResolveAuthenticatonFailure"]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v4,  "_fetchFamilyCircleWithCachePolicy:signedInAccountShouldBeApprover:clientProcess:context:promptUserToR esolveAuthenticatonFailure:",  v2,  v3,  v5,  v6,  objc_msgSend(v7, "BOOLValue")));

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  void v9[2] = sub_1000109D8;
  v9[3] = &unk_100041B98;
  id v10 = *(id *)(a1 + 56);
  [v8 onComplete:v9];
}

void sub_1000109D8(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___FAFailedFetchInfoError);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    id v7 = v5;
    uint64_t v8 = (uint64_t)v11;
    if (!v11) {
      uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 cachedFamilyCircle]);
    }
    id v11 = (id)v8;
    id v5 = (id)objc_claimAutoreleasedReturnValue([v7 underlyingError]);
  }

  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v11 _serverResponse]);
  (*(void (**)(uint64_t, void *, id, id))(v9 + 16))(v9, v10, v11, v5);
}

void sub_100010B8C(id *a1)
{
  uint64_t v2 = objc_alloc(&OBJC_CLASS___FARemoveFamilyMemberOperation);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1[4] _networkService]);
  id v4 = -[FARemoveFamilyMemberOperation initWithNetworkService:dsidOfMemberToRemove:]( v2,  "initWithNetworkService:dsidOfMemberToRemove:",  v3,  a1[5]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[FARemoveFamilyMemberOperation removeMember](v4, "removeMember"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100010C68;
  v6[3] = &unk_100041BE8;
  id v8 = a1[6];
  id v7 = a1[5];
  [v5 onComplete:v6];
}

void sub_100010C68(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = a3;
  (*(void (**)(uint64_t, id, void, id))(v5 + 16))( v5,  [a2 BOOLValue],  *(void *)(a1 + 32),  v6);
}

void sub_100010D74(uint64_t a1)
{
  uint64_t v2 = objc_alloc(&OBJC_CLASS___FADeleteFamilyOperation);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _networkService]);
  id v4 = -[FADeleteFamilyOperation initWithNetworkService:](v2, "initWithNetworkService:", v3);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[FADeleteFamilyOperation deleteFamily](v4, "deleteFamily"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100010E38;
  v6[3] = &unk_100041C10;
  id v7 = *(id *)(a1 + 40);
  [v5 onComplete:v6];
}

void sub_100010E38(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, [a2 BOOLValue], v5);
}

void sub_100010FC0(uint64_t a1)
{
  uint64_t v2 = objc_alloc(&OBJC_CLASS___FAFetchFamilyPhotoOperation);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _networkService]);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 72);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 80);
  id v8 = objc_alloc_init(&OBJC_CLASS___FAFetchFamilyPhotoOperationContext);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[FARequestCoalescer sharedInstance](&OBJC_CLASS___FARequestCoalescer, "sharedInstance"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100011240;
  v21[3] = &unk_100041C38;
  v21[4] = *(void *)(a1 + 32);
  id v10 = -[FAFetchFamilyPhotoOperation initWithNetworkService:memberDSID:memberHashedDSID:size:localFallback:context:requestCoalescer:fetchFamilyFactory:]( v2,  "initWithNetworkService:memberDSID:memberHashedDSID:size:localFallback:context:requestCoalescer:fetchFamilyFactory:",  v3,  v4,  v5,  v6,  v7,  v8,  v9,  v21);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) objectForKeyedSubscript:@"backgroundType"]);
  -[FAFetchFamilyPhotoOperation setBackgroundType:](v10, "setBackgroundType:", [v11 integerValue]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) objectForKeyedSubscript:@"monogramDiameter"]);
  [v12 doubleValue];
  -[FAFetchFamilyPhotoOperation setMonogramDiameter:](v10, "setMonogramDiameter:");

  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) objectForKeyedSubscript:@"emailAddress"]);
  -[FAFetchFamilyPhotoOperation setEmailAddress:](v10, "setEmailAddress:", v13);

  id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) objectForKeyedSubscript:@"fullname"]);
  -[FAFetchFamilyPhotoOperation setFullname:](v10, "setFullname:", v14);

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) objectForKeyedSubscript:@"phoneNumber"]);
  -[FAFetchFamilyPhotoOperation setPhoneNumber:](v10, "setPhoneNumber:", v15);

  id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) objectForKeyedSubscript:@"ClientProcess"]);
  -[FAFetchFamilyPhotoOperation setClientProcess:](v10, "setClientProcess:", v16);

  id v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) objectForKeyedSubscript:@"useMonogramAsLastResort"]);
  -[FAFetchFamilyPhotoOperation setUseMonogramAsLastResort:]( v10,  "setUseMonogramAsLastResort:",  [v17 BOOLValue]);

  double v18 = (void *)objc_claimAutoreleasedReturnValue(-[FAFetchFamilyPhotoOperation fetchPhoto](v10, "fetchPhoto"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10001132C;
  void v19[3] = &unk_100041C60;
  id v20 = *(id *)(a1 + 64);
  [v18 onComplete:v19];
}

FAFetchFamilyCircleOperation *sub_100011240(uint64_t a1)
{
  uint64_t v2 = objc_alloc(&OBJC_CLASS___FAFamilyCircleCache);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _primaryAccount]);
  uint64_t v4 = -[FAFamilyCircleCache initWithAccount:](v2, "initWithAccount:", v3);

  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___FAMarqueeUpdateHandler);
  uint64_t v6 = objc_alloc(&OBJC_CLASS___FAFetchFamilyCircleOperation);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _networkService]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[FARequestCoalescer sharedInstance](&OBJC_CLASS___FARequestCoalescer, "sharedInstance"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) familyRefreshActivityScheduler]);
  id v10 = -[FAFetchFamilyCircleOperation initWithNetworkService:cache:marqueeCacheHanlder:requestCoalescer:familyRefreshActivityScheduler:]( v6,  "initWithNetworkService:cache:marqueeCacheHanlder:requestCoalescer:familyRefreshActivityScheduler:",  v7,  v4,  v5,  v8,  v9);

  return v10;
}

uint64_t sub_10001132C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100011428(uint64_t a1)
{
  uint64_t v2 = objc_alloc(&OBJC_CLASS___FARegisterPushTokenOperation);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _networkService]);
  uint64_t v4 = -[FARegisterPushTokenOperation initWithNetworkService:pushToken:]( v2,  "initWithNetworkService:pushToken:",  v3,  *(void *)(a1 + 40));

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[FARegisterPushTokenOperation registerToken](v4, "registerToken"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000114F0;
  v6[3] = &unk_100041C10;
  id v7 = *(id *)(a1 + 48);
  [v5 onComplete:v6];
}

uint64_t sub_1000114F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

void sub_1000115B4(uint64_t a1)
{
  uint64_t v2 = objc_alloc(&OBJC_CLASS___FAFamilyCircleCache);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _primaryAccount]);
  uint64_t v4 = -[FAFamilyCircleCache initWithAccount:](v2, "initWithAccount:", v3);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[FAFamilyCircleCache invalidate](v4, "invalidate"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100011678;
  v6[3] = &unk_100041AF8;
  id v7 = *(id *)(a1 + 40);
  [v5 onComplete:v6];
}

void sub_100011678(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v6 = _FALogSystem(v4, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    id v11 = "-[FamilyCircleServiceDelegate clearFamilyCircleCacheWithReplyBlock:]_block_invoke_2";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: delete cached family count",  (uint8_t *)&v10,  0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v8 removeObjectForKey:FAFamilySettingRowFamilyCountKey];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v9 removeObjectForKey:FAFamilySettingRowPendingInvitesKey];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10001183C(uint64_t a1)
{
  uint64_t v2 = -[FAFamilyPhotoCache initWithAltDSID:]( objc_alloc(&OBJC_CLASS___FAFamilyPhotoCache),  "initWithAltDSID:",  &stru_100043C20);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[FAFamilyPhotoCache invalidateFamilyPhotos](v2, "invalidateFamilyPhotos"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000118E4;
  v4[3] = &unk_100041AF8;
  id v5 = *(id *)(a1 + 32);
  [v3 onComplete:v4];
}

void sub_1000118E4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v7 = _FALogSystem(v4, v5, v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    int v10 = "-[FamilyCircleServiceDelegate clearPhotoCacheWithReplyBlock:]_block_invoke_2";
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s: delete cached family photo.s",  (uint8_t *)&v9,  0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_100011A6C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100011BA8(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v5 = _FALogSystem(v2, v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v7) {
      sub_10002AB6C(v6, v8, v9);
    }

    int v10 = objc_alloc(&OBJC_CLASS___FAUpdateFamilyMemberFlagOperation);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) _networkService]);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100011D8C;
    void v20[3] = &unk_100041CD8;
    id v21 = *(id *)(a1 + 32);
    id v12 = -[FAUpdateFamilyMemberFlagOperation initWithNetworkService:accountSigner:memberDSID:flag:enabled:]( v10,  "initWithNetworkService:accountSigner:memberDSID:flag:enabled:",  v11,  v20,  *(void *)(a1 + 48),  *(void *)(a1 + 56),  *(unsigned __int8 *)(a1 + 72));

    __int16 v13 = v21;
  }

  else
  {
    if (v7) {
      sub_10002AAF4(v6, v8, v9);
    }

    id v14 = objc_alloc(&OBJC_CLASS___FAUpdateFamilyMemberFlagOperation);
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) _networkService]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) _grandSlamSignerWithAccountStore:v2]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) _familyGrandSlamSignerWithAccountStore:v2]);
    id v12 = -[FAUpdateFamilyMemberFlagOperation initWithNetworkService:grandSlamSigner:familyGrandSlamSigner:memberDSID:flag:enabled:]( v14,  "initWithNetworkService:grandSlamSigner:familyGrandSlamSigner:memberDSID:flag:enabled:",  v13,  v15,  v16,  *(void *)(a1 + 48),  *(void *)(a1 + 56),  *(unsigned __int8 *)(a1 + 72));
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[FAUpdateFamilyMemberFlagOperation updateMemberFlag](v12, "updateMemberFlag"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100011DEC;
  v18[3] = &unk_100041C10;
  id v19 = *(id *)(a1 + 64);
  [v17 onComplete:v18];
}

void sub_100011D8C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[FARequestEphemeralSigner alloc] initWithEphemeralAuthResults:*(void *)(a1 + 32)];
  [v4 signURLRequest:v3];
}

uint64_t sub_100011DEC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100011EF4(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
  id v3 = objc_alloc(&OBJC_CLASS___FAUpdateFamilyMemberFlagsOperation);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _networkService]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _grandSlamSignerWithAccountStore:v2]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _familyGrandSlamSignerWithAccountStore:v2]);
  BOOL v7 = -[FAUpdateFamilyMemberFlagsOperation initWithNetworkService:grandSlamSigner:familyGrandSlamSigner:memberDSID:flags:]( v3,  "initWithNetworkService:grandSlamSigner:familyGrandSlamSigner:memberDSID:flags:",  v4,  v5,  v6,  *(void *)(a1 + 40),  *(void *)(a1 + 48));

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[FAUpdateFamilyMemberFlagsOperation updateMemberFlags](v7, "updateMemberFlags"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  void v9[2] = sub_100012014;
  v9[3] = &unk_100041C10;
  id v10 = *(id *)(a1 + 56);
  [v8 onComplete:v9];
}

void sub_100012014(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, [a2 BOOLValue], v5);
}

uint64_t sub_1000121DC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_1000122C0(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v11 = a3;
  if (a4)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }

  else
  {
    uint64_t v6 = objc_alloc(&OBJC_CLASS___FAEligibilityEvaluator);
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) queueProvider]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 requestQueueWithOptions:0]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v11 eligibilityRequirements]);
    id v10 = -[FAEligibilityEvaluator initWithQueue:requirements:](v6, "initWithQueue:requirements:", v8, v9);

    -[FAEligibilityEvaluator fetchEligibilityForPropertyName:bundleID:completion:]( v10,  "fetchEligibilityForPropertyName:bundleID:completion:",  *(void *)(a1 + 40),  *(void *)(a1 + 48),  *(void *)(a1 + 56));
  }
}

void sub_100012458(uint64_t a1)
{
  uint64_t v2 = objc_alloc(&OBJC_CLASS___FAFetchFollowupOperation);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _networkService]);
  id v5 = -[FANetworkClient initWithNetworkService:](v2, "initWithNetworkService:", v3);

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[FAFetchFollowupOperation fetchFollowUps](v5, "fetchFollowUps"));
  [v4 onComplete:*(void *)(a1 + 40)];
}

void sub_100012544(id a1, AAURLConfiguration *a2, NSError *a3)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[AAURLConfiguration apsEnvironment](a2, "apsEnvironment", a3));
  BOOL v3 = v5 != (id)APSEnvironmentProduction;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[PDSRegistrarService sharedInstance](&OBJC_CLASS___PDSRegistrarService, "sharedInstance"));
  [v4 registerToPDS:v3];
}

void sub_10001298C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = _FALogSystem(a1, a2);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10002ACC8();
  }

  id v5 = objc_alloc_init(&OBJC_CLASS___FADeviceInfo);
  uint64_t v6 = objc_alloc(&OBJC_CLASS___FANetworkService);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _primaryAccount]);
  uint64_t v8 = (void *)objc_opt_new(&OBJC_CLASS___FAURLConfiguration);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[AAURLSession sharedSession](&OBJC_CLASS___AAURLSession, "sharedSession"));
  id v10 = -[FANetworkService initWithAccount:deviceInfo:urlProvider:urlSession:]( v6,  "initWithAccount:deviceInfo:urlProvider:urlSession:",  v7,  v5,  v8,  v9);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
  id v12 = objc_alloc(&OBJC_CLASS___FAHeartbeatOperation);
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _grandSlamSignerWithAccountStore:v11]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _familyGrandSlamSignerWithAccountStore:v11]);
  uint64_t v15 = -[FAHeartbeatOperation initWithNetworkService:grandSlamSigner:familyGrandSlamSigner:]( v12,  "initWithNetworkService:grandSlamSigner:familyGrandSlamSigner:",  v10,  v13,  v14);

  -[FAHeartbeatOperation setForcePush:](v15, "setForcePush:", 1LL);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[FAHeartbeatOperation fetchHeartbeatData](v15, "fetchHeartbeatData"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100012B54;
  void v17[3] = &unk_100041AF8;
  id v18 = *(id *)(a1 + 40);
  [v16 onComplete:v17];
}

void sub_100012B54(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v8 = _FALogSystem(v6, v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (a2)
  {
    if (v10) {
      sub_10002AD78();
    }
  }

  else if (v10)
  {
    sub_10002ACF4(v5, v9);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100012CF8(uint64_t a1)
{
  uint64_t v2 = objc_alloc(&OBJC_CLASS___FAFetchSettingsPresetsOperation);
  id v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472LL;
  uint64_t v8 = sub_100012DB0;
  uint64_t v9 = &unk_100040FF8;
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = v3;
  uint64_t v4 = -[FAFetchSettingsPresetsOperation initWithFamilyCircleProvider:fetchFromCache:]( v2,  "initWithFamilyCircleProvider:fetchFromCache:",  &v6,  *(unsigned __int8 *)(a1 + 64));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[FAFetchSettingsPresetsOperation presetsForMemberWithAltDSID:age:]( v4,  "presetsForMemberWithAltDSID:age:",  *(void *)(a1 + 48),  0LL,  v6,  v7,  v8,  v9,  v10));
  [v5 onComplete:*(void *)(a1 + 56)];
}

id sub_100012DB0(uint64_t a1)
{
  dispatch_queue_attr_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"ClientProcess"]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( [v1 _fetchFamilyCircleWithCachePolicy:0 signedInAccountShouldBeApprover:0 clientProcess:v2 context:0 promptUserToR esolveAuthenticatonFailure:0]);

  return v3;
}

void sub_100012EFC(uint64_t a1)
{
  uint64_t v3 = -[FAFetchSettingsPresetsOperation initWithFamilyCircleProvider:fetchFromCache:]( objc_alloc(&OBJC_CLASS___FAFetchSettingsPresetsOperation),  "initWithFamilyCircleProvider:fetchFromCache:",  &stru_100041DF8,  *(unsigned __int8 *)(a1 + 48));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( -[FAFetchSettingsPresetsOperation presetsForMemberWithAltDSID:age:]( v3,  "presetsForMemberWithAltDSID:age:",  0LL,  *(void *)(a1 + 32)));
  [v2 onComplete:*(void *)(a1 + 40)];
}

AAFPromise *__cdecl sub_100012F64(id a1)
{
  return -[AAFPromise initWithValue:](objc_alloc(&OBJC_CLASS___AAFPromise), "initWithValue:", 0LL);
}

void sub_1000130AC(uint64_t a1)
{
  uint64_t v2 = objc_alloc(&OBJC_CLASS___FAUpdateFamilyInviteStatusOperation);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _networkService]);
  uint64_t v4 = -[FAUpdateFamilyInviteStatusOperation initWithNetworkService:inviteCode:inviteStatus:responseFormat:additionalRequestParameters:]( v2,  "initWithNetworkService:inviteCode:inviteStatus:responseFormat:additionalRequestParameters:",  v3,  *(void *)(a1 + 40),  *(void *)(a1 + 64),  *(void *)(a1 + 72),  *(void *)(a1 + 48));

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[FAUpdateFamilyInviteStatusOperation updateInviteStatus](v4, "updateInviteStatus"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100013178;
  v6[3] = &unk_100041C10;
  id v7 = *(id *)(a1 + 56);
  [v5 onComplete:v6];
}

void sub_100013178(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, [a2 BOOLValue], v5);
}

void sub_1000132C0(uint64_t a1)
{
  uint64_t v2 = objc_alloc(&OBJC_CLASS___FACancelInvitationOperation);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _networkService]);
  uint64_t v4 = -[FACancelInvitationOperation initWithNetworkService:email:familyID:]( v2,  "initWithNetworkService:email:familyID:",  v3,  *(void *)(a1 + 40),  *(void *)(a1 + 48));

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[FACancelInvitationOperation cancelInvitation](v4, "cancelInvitation"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100013388;
  v6[3] = &unk_100041AF8;
  id v7 = *(id *)(a1 + 56);
  [v5 onComplete:v6];
}

uint64_t sub_100013388(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10001349C(uint64_t a1)
{
  uint64_t v2 = -[FAScreenTimeSettingsCacheOperation initWithDSID:]( objc_alloc(&OBJC_CLASS___FAScreenTimeSettingsCacheOperation),  "initWithDSID:",  *(void *)(a1 + 32));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[FAScreenTimeSettingsCacheOperation cacheScreenTimeSettingsObject:]( v2,  "cacheScreenTimeSettingsObject:",  *(void *)(a1 + 40)));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100013544;
  v4[3] = &unk_100041C10;
  id v5 = *(id *)(a1 + 48);
  [v3 onComplete:v4];
}

void sub_100013544(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, [a2 BOOLValue], v5);
}

void sub_100013704(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100013770;
  v2[3] = &unk_100041AF8;
  dispatch_queue_attr_t v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 resendChildTransferWithCompletionHandler:v2];
}

void sub_100013770(uint64_t a1, void *a2, void *a3)
{
  if (a3)
  {
    id v5 = a2;
    id v8 = (id)objc_claimAutoreleasedReturnValue([a3 removingNonSecureCodingValues]);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void (**)(uint64_t))(v6 + 16);
    id v8 = a2;
    v7(v6);
  }
}

void sub_10001396C(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000139D8;
  v2[3] = &unk_100041E70;
  dispatch_queue_attr_t v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 cancelChildTransferWithCompletionHandler:v2];
}

void sub_1000139D8(uint64_t a1, void *a2, void *a3)
{
  if (a3)
  {
    id v5 = a2;
    id v8 = (id)objc_claimAutoreleasedReturnValue([a3 removingNonSecureCodingValues]);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void (**)(uint64_t))(v6 + 16);
    id v8 = a2;
    v7(v6);
  }
}

void sub_100013B20(uint64_t a1)
{
  uint64_t v2 = objc_alloc(&OBJC_CLASS____TtC13familycircled39FAFamilyChecklistRankingConfigOperation);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _networkService]);
  uint64_t v4 = -[FAFamilyChecklistRankingConfigOperation initWithNetworkService:](v2, "initWithNetworkService:", v3);

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100013BD4;
  v6[3] = &unk_100041AF8;
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = *(id *)(a1 + 40);
  -[FAFamilyChecklistRankingConfigOperation familyChecklistRankingConfigWith:completionHandler:]( v4,  "familyChecklistRankingConfigWith:completionHandler:",  v5,  v6);
}

void sub_100013BD4(uint64_t a1, void *a2, void *a3)
{
  if (a3)
  {
    id v5 = a2;
    id v8 = (id)objc_claimAutoreleasedReturnValue([a3 removingNonSecureCodingValues]);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void (**)(uint64_t))(v6 + 16);
    id v8 = a2;
    v7(v6);
  }
}

void sub_100013CE4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100013CF4(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

  ;
}

void sub_100013D60(id a1)
{
  dispatch_queue_attr_t v1 = objc_alloc_init(&OBJC_CLASS___FARequestCoalescer);
  uint64_t v2 = (void *)qword_100052720;
  qword_100052720 = (uint64_t)v1;
}

void sub_100013EEC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) coalesceQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100013FB4;
  block[3] = &unk_100041F08;
  id v5 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v8 = v5;
  char v11 = *(_BYTE *)(a1 + 56);
  id v9 = *(id *)(a1 + 48);
  id v10 = v3;
  id v6 = v3;
  dispatch_async(v4, block);
}

void sub_100013FB4(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) inFlightRequests]);
  id v3 = (__CFString *)objc_claimAutoreleasedReturnValue([v2 objectForKey:*(void *)(a1 + 40)]);

  if (v3 && !*(_BYTE *)(a1 + 64))
  {
    uint64_t v15 = _FALogSystem(v4, v5);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v22 = v17;
      __int16 v23 = 2112;
      __int128 v24 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "RequestCoalescer - Returning already in flight promise for key %@ promise: %@",  buf,  0x16u);
    }

    char v11 = v3;
  }

  else
  {
    uint64_t v6 = _FALogSystem(v4, v5);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      if (*(_BYTE *)(a1 + 64)) {
        id v9 = @"YES";
      }
      else {
        id v9 = @"NO";
      }
      *(_DWORD *)buf = 138412802;
      uint64_t v22 = v8;
      __int16 v23 = 2112;
      __int128 v24 = v9;
      __int16 v25 = 2112;
      uint64_t v26 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "RequestCoalescer - Executing block for key %@ force: %@ inFlightPromise: %@",  buf,  0x20u);
    }

    uint64_t v10 = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
    char v11 = (__CFString *)objc_claimAutoreleasedReturnValue(v10);
    if (v11)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) inFlightRequests]);
      [v12 setObject:v11 forKey:*(void *)(a1 + 40)];

      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_1000141E0;
      v18[3] = &unk_100041EE0;
      __int16 v13 = *(void **)(a1 + 40);
      uint64_t v19 = *(void *)(a1 + 32);
      id v20 = v13;
      id v14 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(a1 + 32),  "coalesceQueue",  _NSConcreteStackBlock,  3221225472,  sub_1000141E0,  &unk_100041EE0,  v19));
      -[__CFString onComplete:onQueue:](v11, "onComplete:onQueue:", v18, v14);
    }
  }

  -[__CFString onComplete:](v11, "onComplete:", *(void *)(a1 + 56));
}

void sub_1000141E0(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) inFlightRequests]);
  [v2 removeObjectForKey:*(void *)(a1 + 40)];
}

void sub_100014780(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_t v2 = dispatch_queue_create("FAFamilyPhotoCache Queue", v4);
  id v3 = (void *)qword_100052730;
  qword_100052730 = (uint64_t)v2;
}

void sub_1000148A8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_1000148C0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000148D0(uint64_t a1)
{
}

void sub_1000148D8(uint64_t a1)
{
  dispatch_queue_t v2 = *(void **)(a1 + 32);
  id v15 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 _cacheURLWithError:&v15]);
  id v4 = v15;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);

  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 attributesOfItemAtPath:v5 error:0]);

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:NSFileModificationDate]);
    id v9 = v8;
    if (v8) {
      id v10 = v8;
    }
    else {
      id v10 = (id)objc_claimAutoreleasedReturnValue([v7 objectForKey:NSFileCreationDate]);
    }
    char v11 = v10;

    if (([*(id *)(a1 + 32) _isCacheDate:v11 pastDuration:*(double *)&qword_100051B10] & 1) == 0)
    {
      uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  v5,  0LL,  *(void *)(a1 + 48)));
      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8LL);
      id v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;
    }
  }

  else if (v4 && *(void *)(a1 + 48))
  {
    **(void **)(a1 + 4_Block_object_dispose(va, 8) = v4;
  }
}

void sub_100014A9C(uint64_t a1, void *a2)
{
  dispatch_queue_t v2 = *(void **)(a1 + 32);
  id v6 = 0LL;
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 load:&v6]);
  id v5 = v6;
  v3[2](v3, v4, v5);
}

void sub_100014E88(uint64_t a1, void *a2)
{
  dispatch_queue_t v2 = *(void **)(a1 + 32);
  id v6 = 0LL;
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 _cacheURLWithError:&v6]);
  id v5 = v6;
  v3[2](v3, v4, v5);
}

id sub_100014F80(id a1, NSURL *a2)
{
  dispatch_queue_t v2 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](v2, "path"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByDeletingLastPathComponent]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v6 = [v5 fileExistsAtPath:v4];

  if ((v6 & 1) != 0)
  {
    id v7 = 0LL;
  }

  else
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v12 = 0LL;
    [v8 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v12];
    id v7 = (NSURL *)v12;
  }

  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = v2;
  }
  id v10 = v9;

  return v10;
}

void sub_1000150F8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [(id)objc_opt_class(*(void *)(a1 + 32)) cacheQueue];
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v4);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000151A8;
  block[3] = &unk_100041920;
  unsigned __int8 v6 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v9 = v6;
  id v10 = v3;
  id v7 = v3;
  dispatch_async(v5, block);
}

void sub_1000151A8(id *a1)
{
  dispatch_queue_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1[4] _createCacheFile]);
  id v3 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v2 then]);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100015268;
  v7[3] = &unk_100041FB8;
  id v4 = a1[5];
  id v5 = a1[4];
  id v8 = v4;
  id v9 = v5;
  id v10 = a1[6];
  id v6 = (id)((uint64_t (**)(void, void *))v3)[2](v3, v7);
}

id sub_100015268(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);
  unsigned int v6 = [v4 fileExistsAtPath:v5];

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    [v7 removeItemAtURL:v3 error:0];
  }

  id v8 = *(void **)(a1 + 32);
  id v16 = 0LL;
  [v8 writeToURL:v3 options:0x40000000 error:&v16];
  id v9 = v16;
  uint64_t v11 = _FALogSystem(v9, v10);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10002AEF8(a1, v13);
    }
  }

  else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) altDSID]);
    *(_DWORD *)buf = 138412290;
    id v18 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Updated photo cache for member %@", buf, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  return v9;
}

id sub_1000154B4(uint64_t a1)
{
  dispatch_queue_attr_t v1 = *(void **)(a1 + 32);
  id v16 = 0LL;
  dispatch_queue_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 _cacheDirectoryURLWithError:&v16]);
  id v3 = v16;
  id v5 = v3;
  if (v3)
  {
    uint64_t v6 = _FALogSystem(v3, v4);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Error finding cache photo directory %@",  buf,  0xCu);
    }

    id v8 = v5;
  }

  else
  {
    id v9 = [v2 checkResourceIsReachableAndReturnError:0];
    id v8 = 0LL;
    if ((_DWORD)v9)
    {
      uint64_t v11 = _FALogSystem(v9, v10);
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Photo cache cleared", buf, 2u);
      }

      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      id v15 = 0LL;
      [v13 removeItemAtURL:v2 error:&v15];
      id v8 = v15;
    }
  }

  return v8;
}

void sub_100015644(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_1000157D4(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_t v2 = dispatch_queue_create("FASettingPresetsCache Queue", v4);
  id v3 = (void *)qword_100052740;
  qword_100052740 = (uint64_t)v2;
}

void sub_1000158FC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_100015914(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100015924(uint64_t a1)
{
}

void sub_10001592C(void *a1)
{
  dispatch_queue_t v2 = (void *)a1[4];
  id v9 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 _cacheURLWithError:&v9]);
  id v4 = v9;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);

  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  v5,  0LL,  a1[6]));
    uint64_t v7 = *(void *)(a1[5] + 8LL);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }

  else if (v4 && a1[6])
  {
    *(void *)a1[6] = v4;
  }
}

void sub_100015A88(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v13 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 load:&v13]);
  id v6 = v13;
  if (v6)
  {
    id v7 = v6;
    v3[2](v3, 0LL, v6);
  }

  else
  {
    id v12 = 0LL;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v5,  0LL,  &v12));
    id v7 = v12;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) absoluteString]);

    if (v9)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) absoluteString]);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v10]);
    }

    else
    {
      uint64_t v11 = 0LL;
    }

    ((void (**)(id, void *, id))v3)[2](v3, v11, v7);
  }
}

void sub_100015DA4(uint64_t a1, void *a2)
{
  dispatch_queue_t v2 = *(void **)(a1 + 32);
  id v6 = 0LL;
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 _cacheURLWithError:&v6]);
  id v5 = v6;
  v3[2](v3, v4, v5);
}

id sub_100015E9C(id a1, NSURL *a2)
{
  dispatch_queue_t v2 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](v2, "path"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByDeletingLastPathComponent]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v6 = [v5 fileExistsAtPath:v4];

  if ((v6 & 1) != 0)
  {
    id v7 = 0LL;
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v12 = 0LL;
    [v8 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v12];
    id v7 = (NSURL *)v12;
  }

  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = v2;
  }
  uint64_t v10 = v9;

  return v10;
}

void sub_100016038(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [(id)objc_opt_class(*(void *)(a1 + 32)) cacheQueue];
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v4);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000160FC;
  v8[3] = &unk_1000419F0;
  unsigned __int8 v6 = *(void **)(a1 + 40);
  void v8[4] = *(void *)(a1 + 32);
  id v9 = v6;
  id v10 = *(id *)(a1 + 48);
  id v11 = v3;
  id v7 = v3;
  dispatch_async(v5, v8);
}

void sub_1000160FC(id *a1)
{
  dispatch_queue_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1[4] _createCacheFile]);
  id v3 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v2 then]);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000161CC;
  v5[3] = &unk_100041FB8;
  id v6 = a1[5];
  id v7 = a1[6];
  id v8 = a1[7];
  id v4 = (id)((uint64_t (**)(void, void *))v3)[2](v3, v5);
}

id sub_1000161CC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);
  unsigned int v6 = [v4 fileExistsAtPath:v5];

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    [v7 removeItemAtURL:v3 error:0];
  }

  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) absoluteString]);

  if (v9)
  {
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) absoluteString]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v10, v11);
  }

  id v29 = 0LL;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v8,  0LL,  &v29));
  id v13 = v29;
  id v28 = 0LL;
  [v12 writeToURL:v3 options:0x40000000 error:&v28];
  id v14 = v28;
  uint64_t v16 = _FALogSystem(v14, v15);
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  id v18 = v17;
  if (v14)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10002AFEC(a1 + 32, v18, v19, v20, v21, v22, v23, v24);
    }
  }

  else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v25 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v31 = v25;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Updated presets cache for url %@", buf, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  id v26 = v14;

  return v26;
}

id sub_1000164AC(uint64_t a1)
{
  dispatch_queue_attr_t v1 = *(void **)(a1 + 32);
  id v16 = 0LL;
  dispatch_queue_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 _cacheDirectoryURLWithError:&v16]);
  id v3 = v16;
  id v5 = v3;
  if (v3)
  {
    uint64_t v6 = _FALogSystem(v3, v4);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Error finding cache presets directory %@",  buf,  0xCu);
    }

    id v8 = v5;
  }

  else
  {
    id v9 = [v2 checkResourceIsReachableAndReturnError:0];
    id v8 = 0LL;
    if ((_DWORD)v9)
    {
      uint64_t v11 = _FALogSystem(v9, v10);
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "presets cache cleared", buf, 2u);
      }

      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      id v15 = 0LL;
      [v13 removeItemAtURL:v2 error:&v15];
      id v8 = v15;
    }
  }

  return v8;
}

void sub_100016800(uint64_t a1)
{
  dispatch_queue_t v2 = objc_alloc(&OBJC_CLASS___FAPushDetailRequest);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appleAccount]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) gsAccount]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
  uint64_t v6 = -[FAPushDetailRequest initWithAppleAccount:grandSlamAccount:accountStore:]( v2,  "initWithAppleAccount:grandSlamAccount:accountStore:",  v3,  v4,  v5);

  id v7 = objc_alloc(&OBJC_CLASS___FANetworkService);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appleAccount]);
  id v9 = objc_alloc_init(&OBJC_CLASS___FADeviceInfo);
  id v10 = objc_alloc_init(&OBJC_CLASS___FAURLConfiguration);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[AAURLSession sharedSession](&OBJC_CLASS___AAURLSession, "sharedSession"));
  id v12 = -[FANetworkService initWithAccount:deviceInfo:urlProvider:urlSession:]( v7,  "initWithAccount:deviceInfo:urlProvider:urlSession:",  v8,  v9,  v10,  v11);

  id v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) payload]);
  -[FAPushDetailRequest setPushPayload:](v6, "setPushPayload:", v13);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000169B0;
  v15[3] = &unk_100042088;
  id v16 = *(id *)(a1 + 32);
  uint64_t v17 = v12;
  uint64_t v18 = *(void *)(a1 + 40);
  id v14 = v12;
  -[FAPushDetailRequest performRequestWithHandler:](v6, "performRequestWithHandler:", v15);
}

void sub_1000169B0(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v11 = v9;
  if (v9)
  {
    uint64_t v12 = _FALogSystem(v9, v10);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10002B054(v11, v13);
    }
  }

  else if (v8)
  {
    id v13 = (os_log_s *)v8;
    id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) topic]);
    -[os_log_s setPushTopic:](v13, "setPushTopic:", v14);

    uint64_t v17 = _FALogSystem(v15, v16);
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v34 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "CacheUpdate:Push detail response: %@",  buf,  0xCu);
    }

    id v19 = -[os_log_s isSuccess](v13, "isSuccess");
    if ((_DWORD)v19)
    {
      uint64_t v21 = *(void *)(a1 + 40);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) familyRefreshActivityScheduler]);
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472LL;
      v30[2] = sub_100016C8C;
      v30[3] = &unk_100042020;
      v30[4] = *(void *)(a1 + 48);
      uint64_t v31 = v13;
      id v32 = *(id *)(a1 + 32);
      +[FAFamilyCircleDaemonChangeHandler handleDidReceivePushEventWithNetworkService:familyRefreshActivityScheduler:completion:]( &OBJC_CLASS___FAFamilyCircleDaemonChangeHandler,  "handleDidReceivePushEventWithNetworkService:familyRefreshActivityScheduler:completion:",  v21,  v22,  v30);
    }

    else
    {
      uint64_t v25 = _FALogSystem(v19, v20);
      id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v34 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "CacheUpdate: Handling no op operation %@",  buf,  0xCu);
      }

      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s httpResponse](v13, "httpResponse"));
      uint64_t v28 = *(void *)(a1 + 40);
      id v29 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) familyRefreshActivityScheduler]);
      +[FAFamilyCircleDaemonChangeHandler handleURLResponse:networkService:familyRefreshActivityScheduler:completion:]( &OBJC_CLASS___FAFamilyCircleDaemonChangeHandler,  "handleURLResponse:networkService:familyRefreshActivityScheduler:completion:",  v27,  v28,  v29,  &stru_100042060);
    }
  }

  else
  {
    uint64_t v23 = _FALogSystem(0LL, v10);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 description]);
      *(_DWORD *)buf = 138412290;
      uint64_t v34 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Family push detail request (%@) retunred no response and no error.",  buf,  0xCu);
    }
  }
}

void sub_100016C8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = _FALogSystem(a1, a2);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a3)
  {
    if (v7)
    {
      __int16 v13 = 0;
      id v8 = "FAEventPushHandler received error while refreshing family triggered by push event";
      id v9 = (uint8_t *)&v13;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    }
  }

  else if (v7)
  {
    *(_WORD *)buf = 0;
    id v8 = "FAEventPushHandler refreshed family triggered by push event.";
    id v9 = buf;
    goto LABEL_6;
  }

  uint64_t v10 = *(void **)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) payload]);
  [v10 _deliverNotificationWithResponse:v11 payload:v12];
}

void sub_100016D4C(id a1, FAFamilyCircle *a2, NSError *a3)
{
  uint64_t v4 = _FALogSystem(a1, a2, a3);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a3)
  {
    if (v6)
    {
      __int16 v9 = 0;
      BOOL v7 = "FAEventPushHandler received error while refreshing family triggered by push event";
      id v8 = (uint8_t *)&v9;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    }
  }

  else if (v6)
  {
    *(_WORD *)buf = 0;
    BOOL v7 = "FAEventPushHandler refreshed family triggered by push event.";
    id v8 = buf;
    goto LABEL_6;
  }
}

id sub_1000172EC(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) signedRequestWithURL:a2 method:*(void *)(a1 + 40) headers:*(void *)(a1 + 48) plistBody:*(void *)(a1 + 56)];
}

id sub_100017644(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forHTTPHeaderField:a2];
}

void sub_1000176EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  BOOL v6 = *(void **)(v4 + 8);
  __int16 v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  uint64_t v11 = sub_100017788;
  uint64_t v12 = &unk_100042128;
  uint64_t v13 = v4;
  id v14 = v3;
  id v7 = v3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 dataTaskWithRequest:v5 completion:&v9]);
  objc_msgSend(v8, "resume", v9, v10, v11, v12, v13);
}

void sub_100017788(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 familyRefreshActivityScheduler]);
  BOOL v12 = +[FAFamilyCircleDaemonChangeHandler handleURLResponse:networkService:familyRefreshActivityScheduler:completion:]( &OBJC_CLASS___FAFamilyCircleDaemonChangeHandler,  "handleURLResponse:networkService:familyRefreshActivityScheduler:completion:",  v9,  v7,  v11,  0LL);

  uint64_t v13 = *(void *)(a1 + 40);
  id v14 = -[FAHTTPResponse initWithHTTPResponse:body:familyRefreshTriggered:]( objc_alloc(&OBJC_CLASS___FAHTTPResponse),  "initWithHTTPResponse:body:familyRefreshTriggered:",  v9,  v10,  v12);

  (*(void (**)(uint64_t, FAHTTPResponse *, id))(v13 + 16))(v13, v14, v8);
}

id sub_1000178FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) plistWithResponse:v3]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 then]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000179B8;
  v11[3] = &unk_100040E38;
  id v12 = v3;
  BOOL v6 = (uint64_t (*)(void *, void *))v5[2];
  id v7 = v3;
  uint64_t v8 = v6(v5, v11);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

FAHTTPResponse *sub_1000179B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_alloc(&OBJC_CLASS___FAHTTPResponse);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) HTTPResponse]);
  BOOL v6 = -[FAHTTPResponse initWithHTTPResponse:body:](v4, "initWithHTTPResponse:body:", v5, v3);

  return v6;
}

id sub_100017AC8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _convertServerResponse:v3 toFormat:*(void *)(a1 + 40)]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 then]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100017B84;
  v11[3] = &unk_100040E38;
  id v12 = v3;
  BOOL v6 = (uint64_t (*)(void *, void *))v5[2];
  id v7 = v3;
  uint64_t v8 = v6(v5, v11);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

FAHTTPResponse *sub_100017B84(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_alloc(&OBJC_CLASS___FAHTTPResponse);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) HTTPResponse]);
  BOOL v6 = -[FAHTTPResponse initWithHTTPResponse:body:](v4, "initWithHTTPResponse:body:", v5, v3);

  return v6;
}

id sub_1000180CC(uint64_t a1)
{
  return [*(id *)(a1 + 32) ensureAccount];
}

id sub_1000180D4(uint64_t a1)
{
  dispatch_queue_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) urlProvider]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 URLForEndpoint:*(void *)(a1 + 40)]);

  return v3;
}

id sub_100018118(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) signedRequestWithURL:a2 method:*(void *)(a1 + 40) headers:&__NSDictionary0__struct plistBody:*(void *)(a1 + 48) requestFormat:*(void *)(a1 + 56) responseFormat:*(void *)(a1 + 64)];
}

id sub_100018138(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) serverRequest:a2 toFormat:*(void *)(a1 + 40)];
}

NSDictionary *__cdecl sub_100018148(id a1, FAHTTPResponse *a2)
{
  return (NSDictionary *)-[FAHTTPResponse body](a2, "body");
}

id sub_100018340(uint64_t a1)
{
  return [*(id *)(a1 + 32) ensureAccount];
}

id sub_100018348(uint64_t a1)
{
  return _[*(id *)(a1 + 32) signedRequestWithURL:*(void *)(a1 + 40) method:*(void *)(a1 + 48) headers:&__NSDictionary0__struct plistBody:*(void *)(a1 + 56) requestFormat:*(void *)(a1 + 64) responseFormat:*(void *)(a1 + 72)];
}

id sub_100018364(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) serverRequest:a2 toFormat:*(void *)(a1 + 40)];
}

NSDictionary *__cdecl sub_100018374(id a1, FAHTTPResponse *a2)
{
  return (NSDictionary *)-[FAHTTPResponse body](a2, "body");
}

id sub_1000185C4(uint64_t a1)
{
  return [*(id *)(a1 + 32) ensureAccount];
}

id sub_1000185CC(uint64_t a1)
{
  return _[*(id *)(a1 + 32) signedRequestWithURL:*(void *)(a1 + 40) method:*(void *)(a1 + 48) headers:&__NSDictionary0__struct plistBody:*(void *)(a1 + 56) requestFormat:*(void *)(a1 + 64) responseFormat:*(void *)(a1 + 72)];
}

id sub_1000185E8(uint64_t a1, void *a2)
{
  id v3 = [a2 mutableCopy];
  [*(id *)(a1 + 32) signURLRequest:v3];
  [*(id *)(a1 + 40) signURLRequest:v3];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) serverRequest:v3 toFormat:*(void *)(a1 + 56)]);

  return v4;
}

NSDictionary *__cdecl sub_100018644(id a1, FAHTTPResponse *a2)
{
  return (NSDictionary *)-[FAHTTPResponse body](a2, "body");
}

id sub_10001882C(uint64_t a1)
{
  return [*(id *)(a1 + 32) ensureAccount];
}

id sub_100018834(uint64_t a1)
{
  return _[*(id *)(a1 + 32) signedRequestWithURL:*(void *)(a1 + 40) method:*(void *)(a1 + 48) headers:0 plistBody:*(void *)(a1 + 56)];
}

id sub_100018848(uint64_t a1, void *a2)
{
  id v3 = [a2 mutableCopy];
  id v4 = [[FARequestConfigurator alloc] initWithAccount:*(void *)(*(void *)(a1 + 32) + 16)];
  [v4 addFresnoPayloadToRequest:v3 additionalPayload:0];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) plistWithRequest:v3]);

  return v5;
}

NSDictionary *__cdecl sub_1000188C0(id a1, FAHTTPResponse *a2)
{
  return (NSDictionary *)-[FAHTTPResponse body](a2, "body");
}

void sub_1000199E8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v8 = v6;
  if (v6)
  {
    uint64_t v9 = _FALogSystem(v6, v7);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10002B28C(v8, v10);
    }
  }

  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    (*(void (**)(uint64_t, id, void *))(v11 + 16))(v11, v5, v8);
  }
}

id sub_100019D34(uint64_t a1)
{
  dispatch_queue_attr_t v1 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) networkService]);
  dispatch_queue_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 ensureAccount]);

  return v2;
}

id sub_100019D70(uint64_t a1)
{
  dispatch_queue_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pushTokenString]);
  [v2 setObject:v3 forKeyedSubscript:@"token"];

  [v2 setObject:&off_100044718 forKeyedSubscript:@"topics"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) networkService]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 signedRequestWithEndpoint:@"register_token" method:@"POST" headers:&off_100044730 plistBody:v2]);

  return v5;
}

id sub_100019E2C(uint64_t a1, void *a2)
{
  dispatch_queue_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 networkService]);
  id v5 = [v3 copy];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 plistWithRequest:v5]);
  return v6;
}

id sub_100019E98(id a1, FAHTTPResponse *a2)
{
  return &__kCFBooleanTrue;
}

void sub_10001A5C8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

Class sub_10001A5E0(uint64_t a1)
{
  id v3 = 0LL;
  if (!qword_100052758)
  {
    __int128 v4 = off_100042390;
    uint64_t v5 = 0LL;
    qword_100052758 = _sl_dlopen(&v4, &v3);
    if (!qword_100052758)
    {
      abort_report_np("%s", (const char *)v3);
LABEL_8:
      sub_10002B394();
    }

    if (v3) {
      free(v3);
    }
  }

  Class result = objc_getClass("CNMonogrammer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    goto LABEL_8;
  }
  qword_100052750 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

id sub_10001A830(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _unsafeFetchEligibilityForPropertyName:*(void *)(a1 + 40) bundleID:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

LABEL_39:
  v10[2](v10, v51, 0LL);
}

uint64_t sub_10001AE80(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = sub_10001B6BC(&qword_100051DF8);
    uint64_t v7 = swift_allocObject(v6, 72LL, 7LL);
    *(_OWORD *)(v7 + 16) = xmmword_1000356D0;
    swift_getErrorValue(v5, v24, v23);
    uint64_t v8 = v23[1];
    uint64_t v9 = v23[2];
    swift_errorRetain(v5);
    uint64_t v10 = Error.localizedDescription.getter(v8, v9);
    uint64_t v12 = v11;
    *(void *)(v7 + 56) = &type metadata for String;
    *(void *)(v7 + 64) = sub_10001BC48();
    *(void *)(v7 + 32) = v10;
    *(void *)(v7 + 40) = v12;
    uint64_t v13 = String.init(format:_:)(a2, a3, v7);
    unint64_t v15 = v14;
    uint64_t v16 = swift_bridgeObjectRetain(v14);
    uint64_t v17 = (os_log_s *)Logger.logObject.getter(v16);
    os_log_type_t v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, v18))
    {
      id v19 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v20 = swift_slowAlloc(32LL, -1LL);
      uint64_t v22 = v20;
      *(_DWORD *)id v19 = 136315138;
      swift_bridgeObjectRetain(v15);
      uint64_t v21 = sub_1000218D0(v13, v15, &v22);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, &v22, v19 + 4, v19 + 12);
      swift_bridgeObjectRelease_n(v15, 3LL);
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "%s", v19, 0xCu);
      swift_arrayDestroy(v20, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v20, -1LL, -1LL);
      swift_slowDealloc(v19, -1LL, -1LL);

      return swift_errorRelease(v5);
    }

    else
    {

      swift_errorRelease(v5);
      return swift_bridgeObjectRelease_n(v15, 2LL);
    }
  }

  return result;
}

unint64_t sub_10001B08C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    __int128 v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_10001B6BC(&qword_100051D80);
  uint64_t v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  __int128 v4 = (void *)v3;
  uint64_t v5 = *(void *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }

  uint64_t v6 = v3 + 64;
  uint64_t v7 = a1 + 32;
  swift_retain(v3);
  while (1)
  {
    sub_10001BC8C(v7, (uint64_t)&v16, &qword_100051D88);
    uint64_t v8 = v16;
    uint64_t v9 = v17;
    unint64_t result = sub_100021F20(v16, v17);
    if ((v11 & 1) != 0) {
      break;
    }
    *(void *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    uint64_t v12 = (uint64_t *)(v4[6] + 16 * result);
    *uint64_t v12 = v8;
    v12[1] = v9;
    unint64_t result = (unint64_t)sub_10001BC38(&v18, (_OWORD *)(v4[7] + 32 * result));
    uint64_t v13 = v4[2];
    BOOL v14 = __OFADD__(v13, 1LL);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4[2] = v15;
    v7 += 48LL;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_10001B1C0(uint64_t a1)
{
  uint64_t v2 = sub_10001B6BC(&qword_100051E08);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (uint64_t *)((char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v6 = *(void *)(a1 + 16);
  if (!v6)
  {
    uint64_t v8 = &_swiftEmptyDictionarySingleton;
LABEL_9:
    uint64_t v26 = a1;
LABEL_10:
    swift_bridgeObjectRelease(v26);
    return (unint64_t)v8;
  }

  sub_10001B6BC(&qword_100051E10);
  uint64_t v7 = static _DictionaryStorage.allocate(capacity:)(v6);
  uint64_t v8 = (void *)v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (!v9) {
    goto LABEL_9;
  }
  uint64_t v10 = (uint64_t)v5 + *(int *)(v2 + 48);
  uint64_t v11 = v7 + 64;
  unint64_t v12 = (*(unsigned __int8 *)(v3 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v28 = a1;
  uint64_t v13 = a1 + v12;
  uint64_t v14 = *(void *)(v3 + 72);
  swift_retain(v7);
  while (1)
  {
    sub_10001BC8C(v13, (uint64_t)v5, &qword_100051E08);
    uint64_t v15 = *v5;
    uint64_t v16 = v5[1];
    unint64_t result = sub_100021F20(*v5, v16);
    if ((v18 & 1) != 0) {
      break;
    }
    unint64_t v19 = result;
    *(void *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    uint64_t v20 = (uint64_t *)(v8[6] + 16 * result);
    uint64_t *v20 = v15;
    v20[1] = v16;
    uint64_t v21 = v8[7];
    uint64_t v22 = type metadata accessor for ClientRecord(0LL);
    unint64_t result = sub_10001BCD0(v10, v21 + *(void *)(*(void *)(v22 - 8) + 72LL) * v19);
    uint64_t v23 = v8[2];
    BOOL v24 = __OFADD__(v23, 1LL);
    uint64_t v25 = v23 + 1;
    if (v24) {
      goto LABEL_12;
    }
    v8[2] = v25;
    v13 += v14;
    if (!--v9)
    {
      swift_release(v8);
      uint64_t v26 = v28;
      goto LABEL_10;
    }
  }

  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

unint64_t sub_10001B358(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_10001B6BC(&qword_100051DF0);
  uint64_t v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  uint64_t v4 = (void *)v3;
  uint64_t v5 = *(void *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }

  swift_retain(v3);
  uint64_t v6 = (_OWORD *)(a1 + 48);
  while (1)
  {
    uint64_t v7 = *((void *)v6 - 2);
    uint64_t v8 = *((void *)v6 - 1);
    __int128 v15 = *v6;
    swift_bridgeObjectRetain(v8);
    swift_retain(*((void *)&v15 + 1));
    unint64_t result = sub_100021F20(v7, v8);
    if ((v10 & 1) != 0) {
      break;
    }
    *(void *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    uint64_t v11 = (uint64_t *)(v4[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    *(_OWORD *)(v4[7] + 16 * result) = v15;
    uint64_t v12 = v4[2];
    BOOL v13 = __OFADD__(v12, 1LL);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v4[2] = v14;
    v6 += 2;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t variable initialization expression of RateLimiter.encoder()
{
  return sub_10001B4A8( (uint64_t (*)(void))&type metadata accessor for JSONEncoder,  (uint64_t (*)(void))&JSONEncoder.init());
}

uint64_t variable initialization expression of RateLimiter.decoder()
{
  return sub_10001B4A8( (uint64_t (*)(void))&type metadata accessor for JSONDecoder,  (uint64_t (*)(void))&JSONDecoder.init());
}

uint64_t sub_10001B4A8(uint64_t (*a1)(void), uint64_t (*a2)(void))
{
  uint64_t v3 = a1(0LL);
  swift_allocObject(v3, *(unsigned int *)(v3 + 48), *(unsigned __int16 *)(v3 + 52));
  return a2();
}

uint64_t variable initialization expression of RateLimiter.queue()
{
  uint64_t v0 = type metadata accessor for OS_dispatch_queue.Attributes(0LL);
  __chkstk_darwin();
  uint64_t v2 = (char *)&v14 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  type metadata accessor for DispatchQoS(0LL);
  __chkstk_darwin();
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_10001B680();
  uint64_t v9 = (*(uint64_t (**)(char *, void, uint64_t))(v6 + 104))( v8,  enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:),  v5);
  static DispatchQoS.unspecified.getter(v9);
  __int128 v15 = &_swiftEmptyArrayStorage;
  uint64_t v10 = sub_10001BA20( (unint64_t *)&unk_100052210,  (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes,  (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  uint64_t v11 = sub_10001B6BC((uint64_t *)&unk_100051CE0);
  unint64_t v12 = sub_10001B6FC();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v15, v11, v12, v0, v10);
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)( 0xD000000000000022LL,  0x8000000100037380LL,  v4,  v2,  v8,  0LL);
}

unint64_t sub_10001B680()
{
  unint64_t result = qword_100051CD0;
  if (!qword_100051CD0)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_dispatch_queue);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100051CD0);
  }

  return result;
}

uint64_t sub_10001B6BC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

unint64_t sub_10001B6FC()
{
  unint64_t result = qword_100052220;
  if (!qword_100052220)
  {
    uint64_t v1 = sub_10001B748((uint64_t *)&unk_100051CE0);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100052220);
  }

  return result;
}

uint64_t sub_10001B748(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t variable initialization expression of PDSRegistrarService.pdsRegistrar()
{
  return 0LL;
}

unint64_t variable initialization expression of XPCEventObserver.handlers()
{
  return sub_10001B358((uint64_t)&_swiftEmptyArrayStorage);
}

void type metadata accessor for AAURLEndpoint(uint64_t a1)
{
}

uint64_t sub_10001B7B4(uint64_t a1, uint64_t a2)
{
  return sub_10001BA98(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_10001B7C0(uint64_t a1, id *a2)
{
  uint64_t v7 = 0LL;
  uint64_t v8 = 0LL;
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)(a1, &v7);
  uint64_t v5 = v8;
  if (v8)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    uint64_t result = swift_bridgeObjectRelease(v5);
  }

  else
  {
    NSString v6 = 0LL;
  }

  *a2 = v6;
  return result;
}

uint64_t sub_10001B834(uint64_t a1, id *a2)
{
  uint64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  char v4 = static String._conditionallyBridgeFromObjectiveC(_:result:)(a1, &v8);
  uint64_t v5 = v9;
  if (v9)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }

  else
  {
    NSString v6 = 0LL;
  }

  *a2 = v6;
  return v4 & 1;
}

uint64_t sub_10001B8B0@<X0>(void *a1@<X8>)
{
  uint64_t v3 = v2;
  NSString v4 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease(v3);
  *a1 = v4;
  return result;
}

void sub_10001B8F0(void *a1@<X8>)
{
  *a1 = 0LL;
}

void *sub_10001B8F8@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_10001B904@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 8);
  NSString v4 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease(v3);
  *a2 = v4;
  return result;
}

uint64_t sub_10001B948@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_10001B970(uint64_t a1)
{
  uint64_t v2 = sub_10001BA20( &qword_100051D70,  (uint64_t (*)(uint64_t))type metadata accessor for AAURLEndpoint,  (uint64_t)&unk_1000357BC);
  uint64_t v3 = sub_10001BA20( &qword_100051D78,  (uint64_t (*)(uint64_t))type metadata accessor for AAURLEndpoint,  (uint64_t)&unk_100035764);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_10001B9F4()
{
  return sub_10001BA20( &qword_100051D58,  (uint64_t (*)(uint64_t))type metadata accessor for AAURLEndpoint,  (uint64_t)&unk_10003572C);
}

uint64_t sub_10001BA20(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = a2(255LL);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_10001BA60()
{
  return sub_10001BA20( &qword_100051D60,  (uint64_t (*)(uint64_t))type metadata accessor for AAURLEndpoint,  (uint64_t)&unk_100035704);
}

uint64_t sub_10001BA8C(uint64_t a1, uint64_t a2)
{
  return sub_10001BA98(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_10001BA98(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v3);
  uint64_t v7 = v6;
  uint64_t v8 = a3(v5);
  swift_bridgeObjectRelease(v7);
  return v8;
}

uint64_t sub_10001BAD4(uint64_t a1)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  uint64_t v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_10001BB14(uint64_t a1)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  uint64_t v5 = v4;
  Hasher.init(_seed:)(v8, a1);
  String.hash(into:)(v8, v3, v5);
  Swift::Int v6 = Hasher._finalize()();
  swift_bridgeObjectRelease(v5);
  return v6;
}

uint64_t sub_10001BB84(void *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*a1);
  uint64_t v5 = v4;
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  if (v3 == v6 && v5 == v7)
  {
    char v10 = 1;
    uint64_t v9 = v5;
  }

  else
  {
    uint64_t v9 = v7;
    char v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 0LL);
  }

  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v9);
  return v10 & 1;
}

uint64_t sub_10001BC0C()
{
  return sub_10001BA20( &qword_100051D68,  (uint64_t (*)(uint64_t))type metadata accessor for AAURLEndpoint,  (uint64_t)&unk_100035794);
}

_OWORD *sub_10001BC38(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_10001BC48()
{
  unint64_t result = qword_100051E00;
  if (!qword_100051E00)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100051E00);
  }

  return result;
}

uint64_t sub_10001BC8C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10001B6BC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_10001BCD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ClientRecord(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

void type metadata accessor for FACachePolicy(uint64_t a1)
{
}

void sub_10001BD28(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(0LL, a3);
    if (!v5) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }

NSString sub_10001BD70()
{
  NSString result = String._bridgeToObjectiveC()();
  qword_100051EE0 = (uint64_t)result;
  return result;
}

NSString sub_10001BDA4()
{
  NSString result = String._bridgeToObjectiveC()();
  qword_100051EE8 = (uint64_t)result;
  return result;
}

uint64_t sub_10001BE8C()
{
  v1[46] = v0;
  uint64_t v2 = type metadata accessor for Logger(0LL);
  v1[47] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  v1[48] = v3;
  v1[49] = swift_task_alloc((*(void *)(v3 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for URL(0LL);
  v1[50] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v1[51] = v5;
  v1[52] = swift_task_alloc((*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v6 = (*(void *)(*(void *)(sub_10001B6BC(&qword_100051F50) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v1[53] = swift_task_alloc(v6);
  v1[54] = swift_task_alloc(v6);
  v1[55] = swift_task_alloc(v6);
  return swift_task_switch(sub_10001BF54, 0LL, 0LL);
}

uint64_t sub_10001BF54()
{
  id v1 = [objc_allocWithZone(FAURLConfiguration) init];
  v0[56] = v1;
  v0[7] = v0 + 45;
  v0[2] = v0;
  v0[3] = sub_10001C010;
  v0[43] = swift_continuation_init(v0 + 2, 1LL);
  v0[39] = _NSConcreteStackBlock;
  v0[40] = 0x40000000LL;
  v0[41] = sub_10001C6C4;
  v0[42] = &unk_100042598;
  [v1 fetchAAURLConfigurationWithCompletion:v0 + 39];
  return swift_continuation_await(v0 + 2);
}

uint64_t sub_10001C010()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48LL);
  *(void *)(*(void *)v0 + 456LL) = v1;
  if (v1) {
    uint64_t v2 = sub_10001C558;
  }
  else {
    uint64_t v2 = sub_10001C070;
  }
  return swift_task_switch(v2, 0LL, 0LL);
}

uint64_t sub_10001C070()
{
  uint64_t v1 = (void *)v0[56];
  uint64_t v2 = (void *)v0[45];
  v0[58] = v2;

  if (qword_100051CA0 != -1) {
    swift_once(&qword_100051CA0, sub_10001BD70);
  }
  id v3 = [v2 urlForEndpoint:qword_100051EE0];
  if (v3)
  {
    uint64_t v4 = v3;
    static URL._unconditionallyBridgeFromObjectiveC(_:)(v3);

    uint64_t v5 = 0LL;
  }

  else
  {
    uint64_t v5 = 1LL;
  }

  uint64_t v7 = v0[54];
  uint64_t v6 = v0[55];
  uint64_t v8 = v0[50];
  uint64_t v9 = v0[51];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, v5, 1LL, v8);
  sub_10001D3F4(v7, v6);
  char v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
  int v11 = v10(v6, 1LL, v8);
  uint64_t v12 = v0[55];
  if (v11 == 1)
  {
    sub_10001D43C(v0[55]);
    unint64_t v13 = 0x8000000100037770LL;
    uint64_t v14 = 0xD00000000000003DLL;
  }

  else
  {
    uint64_t v15 = v0[50];
    uint64_t v16 = v0[51];
    uint64_t v14 = URL.absoluteString.getter();
    unint64_t v13 = v17;
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v12, v15);
  }

  uint64_t v18 = v0[53];
  uint64_t v19 = v0[50];
  uint64_t v20 = v0[46];
  uint64_t v21 = sub_10001B6BC(&qword_100051F58);
  uint64_t inited = swift_initStackObject(v21, v0 + 18);
  *(_OWORD *)(inited + 16) = xmmword_100035870;
  *(void *)(inited + 32) = 0x6449656C707061LL;
  *(void *)(inited + 40) = 0xE700000000000000LL;
  uint64_t v23 = *(void *)(v20 + OBJC_IVAR___FAResendChildTransferRequestOperation_email + 8);
  *(void *)(inited + 4_Block_object_dispose(va, 8) = *(void *)(v20 + OBJC_IVAR___FAResendChildTransferRequestOperation_email);
  *(void *)(inited + 56) = v23;
  *(void *)(inited + 72) = &type metadata for String;
  *(void *)(inited + 80) = 0x646E657365527369LL;
  *(void *)(inited + 8_Block_object_dispose(va, 8) = 0xE800000000000000LL;
  *(void *)(inited + 120) = &type metadata for Bool;
  *(_BYTE *)(inited + 96) = 1;
  swift_bridgeObjectRetain(v23);
  unint64_t v24 = sub_10001B08C(inited);
  id v25 = *(id *)(v20 + OBJC_IVAR___FAResendChildTransferRequestOperation_networkService);
  URL.init(string:)(v14, v13);
  if (v10(v18, 1LL, v19) == 1)
  {
    sub_10001D43C(v0[53]);
    return _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0LL,  0xE000000000000000LL,  "familycircled/Optional+Family.swift",  35LL,  2LL,  30LL,  0);
  }

  else
  {
    uint64_t v27 = v0[52];
    uint64_t v28 = v0[50];
    uint64_t v29 = v0[51];
    uint64_t v30 = v0[46];
    (*(void (**)(uint64_t, void, uint64_t))(v29 + 32))(v27, v0[53], v28);
    swift_bridgeObjectRelease(v13);
    URL._bridgeToObjectiveC()(v31);
    uint64_t v33 = v32;
    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v27, v28);
    uint64_t v34 = *(void **)(v30 + OBJC_IVAR___FAResendChildTransferRequestOperation_familyGrandSlamSigner);
    id v35 = *(id *)(v30 + OBJC_IVAR___FAResendChildTransferRequestOperation_aaGrandSlamSigner);
    id v36 = v34;
    NSString v37 = String._bridgeToObjectiveC()();
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v24);
    id v39 =  [v25 standardRequestWithURL:v33 grandSlamSigner:v35 familyGrandSlamSigner:v36 method:v37 body:isa requestFormat:2 responseFormat:2];
    v0[59] = v39;

    v0[15] = v0 + 44;
    v0[10] = v0;
    v0[11] = sub_10001C478;
    v0[38] = swift_continuation_init(v0 + 10, 1LL);
    v0[34] = _NSConcreteStackBlock;
    v0[35] = 0x40000000LL;
    v0[36] = sub_10001D700;
    v0[37] = &unk_1000425B0;
    [v39 onComplete:v0 + 34];
    return swift_continuation_await(v0 + 10);
  }

uint64_t sub_10001C478()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 112LL);
  *(void *)(*(void *)v0 + 480LL) = v1;
  if (v1) {
    uint64_t v2 = sub_10001C5DC;
  }
  else {
    uint64_t v2 = sub_10001C4D8;
  }
  return swift_task_switch(v2, 0LL, 0LL);
}

uint64_t sub_10001C4D8()
{
  uint64_t v1 = *(void **)(v0 + 472);

  uint64_t v2 = *(void *)(v0 + 352);
  uint64_t v3 = *(void *)(v0 + 432);
  uint64_t v5 = *(void *)(v0 + 416);
  uint64_t v4 = *(void *)(v0 + 424);
  uint64_t v6 = *(void *)(v0 + 392);
  swift_task_dealloc(*(void *)(v0 + 440));
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v2);
}

uint64_t sub_10001C558()
{
  uint64_t v1 = *(void **)(v0 + 448);
  uint64_t v2 = *(void *)(v0 + 432);
  uint64_t v3 = *(void *)(v0 + 440);
  uint64_t v5 = *(void *)(v0 + 416);
  uint64_t v4 = *(void *)(v0 + 424);
  uint64_t v6 = *(void *)(v0 + 392);
  swift_willThrow();

  swift_task_dealloc(v3);
  swift_task_dealloc(v2);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001C5DC()
{
  uint64_t v2 = *(void **)(v0 + 472);
  uint64_t v1 = *(void *)(v0 + 480);
  uint64_t v3 = *(void **)(v0 + 464);
  uint64_t v5 = *(void *)(v0 + 384);
  uint64_t v4 = *(void *)(v0 + 392);
  uint64_t v6 = *(void *)(v0 + 376);
  swift_willThrow();

  static FamilyLogger.common.getter();
  swift_errorRetain(v1);
  sub_10001AE80(v1, 0xD000000000000028LL, 0x80000001000377B0LL);

  swift_errorRelease(v1);
  swift_errorRelease(v1);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  uint64_t v7 = *(void *)(v0 + 432);
  uint64_t v9 = *(void *)(v0 + 416);
  uint64_t v8 = *(void *)(v0 + 424);
  uint64_t v10 = *(void *)(v0 + 392);
  swift_task_dealloc(*(void *)(v0 + 440));
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  return (*(uint64_t (**)(void))(v0 + 8))(0LL);
}

uint64_t sub_10001C6C4(uint64_t result, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(result + 32);
  if (a3)
  {
    uint64_t v5 = sub_10001B6BC(&qword_100051F60);
    uint64_t v6 = swift_allocError(v5, &protocol self-conformance witness table for Error, 0LL, 0LL);
    *uint64_t v7 = a3;
    id v8 = a3;
    return swift_continuation_throwingResumeWithError(v3, v6);
  }

  else if (a2)
  {
    **(void **)(*(void *)(v3 + 64) + 40LL) = a2;
    id v9 = a2;
    return swift_continuation_throwingResume(v3);
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t sub_10001C86C(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  uint64_t v4 = dword_100051F44;
  a2;
  uint64_t v5 = (void *)swift_task_alloc(v4);
  void v2[4] = v5;
  void *v5 = v2;
  v5[1] = sub_10001D6F8;
  return sub_10001BE8C();
}

uint64_t sub_10001C8CC()
{
  v1[40] = v0;
  uint64_t v2 = type metadata accessor for Logger(0LL);
  v1[41] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  v1[42] = v3;
  v1[43] = swift_task_alloc((*(void *)(v3 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for URL(0LL);
  v1[44] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v1[45] = v5;
  v1[46] = swift_task_alloc((*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v6 = (*(void *)(*(void *)(sub_10001B6BC(&qword_100051F50) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v1[47] = swift_task_alloc(v6);
  v1[48] = swift_task_alloc(v6);
  v1[49] = swift_task_alloc(v6);
  return swift_task_switch(sub_10001C994, 0LL, 0LL);
}

uint64_t sub_10001C994()
{
  uint64_t v1 = v0 + 10;
  uint64_t v2 = v0[40];
  uint64_t v3 = sub_10001B6BC(&qword_100051F58);
  uint64_t inited = swift_initStackObject(v3, v0 + 18);
  *(_OWORD *)(inited + 16) = xmmword_1000356D0;
  *(void *)(inited + 32) = 0x6449656C707061LL;
  *(void *)(inited + 40) = 0xE700000000000000LL;
  uint64_t v6 = *(void *)(v2 + OBJC_IVAR___FAResendChildTransferRequestOperation_email);
  uint64_t v5 = *(void *)(v2 + OBJC_IVAR___FAResendChildTransferRequestOperation_email + 8);
  *(void *)(inited + 72) = &type metadata for String;
  *(void *)(inited + 4_Block_object_dispose(va, 8) = v6;
  *(void *)(inited + 56) = v5;
  swift_bridgeObjectRetain(v5);
  v0[50] = sub_10001B08C(inited);
  id v7 = [objc_allocWithZone(FAURLConfiguration) init];
  v0[51] = v7;
  v0[15] = v0 + 39;
  v0[10] = v0;
  v0[11] = sub_10001CAC0;
  uint64_t v8 = swift_continuation_init(v0 + 10, 1LL);
  v0[28] = _NSConcreteStackBlock;
  id v9 = v0 + 28;
  v9[1] = 0x40000000LL;
  void v9[2] = sub_10001C6C4;
  v9[3] = &unk_100042568;
  void v9[4] = v8;
  [v7 fetchAAURLConfigurationWithCompletion:v9];
  return swift_continuation_await(v1);
}

uint64_t sub_10001CAC0()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 112);
  *(void *)(*v0 + 416) = v2;
  if (v2)
  {
    swift_bridgeObjectRelease(*(void *)(v1 + 400));
    uint64_t v3 = sub_10001CF78;
  }

  else
  {
    uint64_t v3 = sub_10001CB28;
  }

  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_10001CB28()
{
  uint64_t v1 = (void *)v0[51];
  uint64_t v2 = (void *)v0[39];
  v0[53] = v2;

  if (qword_100051CA8 != -1) {
    swift_once(&qword_100051CA8, sub_10001BDA4);
  }
  id v3 = [v2 urlForEndpoint:qword_100051EE8];
  if (v3)
  {
    uint64_t v4 = v3;
    static URL._unconditionallyBridgeFromObjectiveC(_:)(v3);

    uint64_t v5 = 0LL;
  }

  else
  {
    uint64_t v5 = 1LL;
  }

  uint64_t v6 = v0[48];
  uint64_t v7 = v0[49];
  uint64_t v8 = v0[44];
  uint64_t v9 = v0[45];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v6, v5, 1LL, v8);
  sub_10001D3F4(v6, v7);
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
  int v11 = v10(v7, 1LL, v8);
  uint64_t v12 = v0[49];
  if (v11 == 1)
  {
    sub_10001D43C(v0[49]);
    unint64_t v13 = 0x8000000100037680LL;
    uint64_t v14 = 0xD00000000000003FLL;
  }

  else
  {
    uint64_t v15 = v0[44];
    uint64_t v16 = v0[45];
    uint64_t v14 = URL.absoluteString.getter();
    unint64_t v13 = v17;
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v12, v15);
  }

  uint64_t v18 = v0[47];
  uint64_t v19 = v0[44];
  id v20 = *(id *)(v0[40] + OBJC_IVAR___FAResendChildTransferRequestOperation_networkService);
  URL.init(string:)(v14, v13);
  if (v10(v18, 1LL, v19) == 1)
  {
    sub_10001D43C(v0[47]);
    return _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0LL,  0xE000000000000000LL,  "familycircled/Optional+Family.swift",  35LL,  2LL,  30LL,  0);
  }

  else
  {
    uint64_t v22 = v0[50];
    uint64_t v23 = v0[46];
    uint64_t v24 = v0[44];
    uint64_t v25 = v0[45];
    uint64_t v26 = v0[40];
    (*(void (**)(uint64_t, void, uint64_t))(v25 + 32))(v23, v0[47], v24);
    swift_bridgeObjectRelease(v13);
    URL._bridgeToObjectiveC()(v27);
    uint64_t v29 = v28;
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v23, v24);
    uint64_t v30 = *(void **)(v26 + OBJC_IVAR___FAResendChildTransferRequestOperation_familyGrandSlamSigner);
    id v31 = *(id *)(v26 + OBJC_IVAR___FAResendChildTransferRequestOperation_aaGrandSlamSigner);
    id v32 = v30;
    NSString v33 = String._bridgeToObjectiveC()();
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v22);
    id v35 =  [v20 standardRequestWithURL:v29 grandSlamSigner:v31 familyGrandSlamSigner:v32 method:v33 body:isa requestFormat:2 responseFormat:2];
    v0[54] = v35;

    v0[7] = v0 + 38;
    v0[2] = v0;
    v0[3] = sub_10001CE98;
    v0[37] = swift_continuation_init(v0 + 2, 1LL);
    v0[33] = _NSConcreteStackBlock;
    v0[34] = 0x40000000LL;
    v0[35] = sub_10001D700;
    v0[36] = &unk_100042580;
    [v35 onComplete:v0 + 33];
    return swift_continuation_await(v0 + 2);
  }

uint64_t sub_10001CE98()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48LL);
  *(void *)(*(void *)v0 + 440LL) = v1;
  if (v1) {
    uint64_t v2 = sub_10001CFFC;
  }
  else {
    uint64_t v2 = sub_10001CEF8;
  }
  return swift_task_switch(v2, 0LL, 0LL);
}

uint64_t sub_10001CEF8()
{
  uint64_t v1 = *(void **)(v0 + 432);

  uint64_t v2 = *(void *)(v0 + 304);
  uint64_t v3 = *(void *)(v0 + 384);
  uint64_t v5 = *(void *)(v0 + 368);
  uint64_t v4 = *(void *)(v0 + 376);
  uint64_t v6 = *(void *)(v0 + 344);
  swift_task_dealloc(*(void *)(v0 + 392));
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v2);
}

uint64_t sub_10001CF78()
{
  uint64_t v1 = *(void **)(v0 + 408);
  uint64_t v2 = *(void *)(v0 + 384);
  uint64_t v3 = *(void *)(v0 + 392);
  uint64_t v5 = *(void *)(v0 + 368);
  uint64_t v4 = *(void *)(v0 + 376);
  uint64_t v6 = *(void *)(v0 + 344);
  swift_willThrow();

  swift_task_dealloc(v3);
  swift_task_dealloc(v2);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001CFFC()
{
  uint64_t v2 = *(void **)(v0 + 432);
  uint64_t v1 = *(void *)(v0 + 440);
  uint64_t v3 = *(void **)(v0 + 424);
  uint64_t v5 = *(void *)(v0 + 336);
  uint64_t v4 = *(void *)(v0 + 344);
  uint64_t v6 = *(void *)(v0 + 328);
  swift_willThrow();

  static FamilyLogger.common.getter();
  swift_errorRetain(v1);
  sub_10001AE80(v1, 0xD000000000000022LL, 0x8000000100037720LL);

  swift_errorRelease(v1);
  swift_errorRelease(v1);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  uint64_t v7 = *(void *)(v0 + 384);
  uint64_t v9 = *(void *)(v0 + 368);
  uint64_t v8 = *(void *)(v0 + 376);
  uint64_t v10 = *(void *)(v0 + 344);
  swift_task_dealloc(*(void *)(v0 + 392));
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  return (*(uint64_t (**)(void))(v0 + 8))(0LL);
}

uint64_t sub_10001D200(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  uint64_t v4 = dword_100051F4C;
  a2;
  uint64_t v5 = (void *)swift_task_alloc(v4);
  void v2[4] = v5;
  void *v5 = v2;
  v5[1] = sub_10001D260;
  return sub_10001C8CC();
}

uint64_t sub_10001D260(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = *(void *)(*v2 + 32);
  uint64_t v6 = *(void **)(*v2 + 16);
  uint64_t v7 = *v2;
  swift_task_dealloc(v5);

  uint64_t v8 = *(void (***)(void, void, void))(v7 + 24);
  if (v3)
  {
    uint64_t v9 = (void *)_convertErrorToNSError(_:)(v3);
    swift_errorRelease(v3);
    ((void (**)(void, void, void *))v8)[2](v8, 0LL, v9);

    _Block_release(v8);
  }

  else
  {
    ((void (**)(void, void *, void))v8)[2](v8, a1, 0LL);
    _Block_release(v8);
  }

  return (*(uint64_t (**)(void))(v7 + 8))();
}

id sub_10001D348()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FAResendChildTransferRequestOperation();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for FAResendChildTransferRequestOperation()
{
  return objc_opt_self(&OBJC_CLASS___FAResendChildTransferRequestOperation);
}

uint64_t sub_10001D3F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10001B6BC(&qword_100051F50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001D43C(uint64_t a1)
{
  uint64_t v2 = sub_10001B6BC(&qword_100051F50);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_10001D480()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc(dword_100051F74);
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_10001D4E4;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_100051F70 + dword_100051F70))(v2, v3);
}

uint64_t sub_10001D4E4()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_10001D530()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc(dword_10005264C);
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_10001D6FC;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100052648 + dword_100052648))(v2, v3, v4);
}

uint64_t sub_10001D5AC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc(dword_100052654);
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10001D6FC;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100052650 + dword_100052650))( a1,  v4,  v5,  v6);
}

uint64_t sub_10001D634()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10001D660()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc(dword_100051F94);
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_10001D6FC;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_100051F90 + dword_100051F90))(v2, v3);
}

uint64_t sub_10001D6CC()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_10001D7F4(uint64_t a1)
{
  v2[17] = a1;
  v2[18] = v1;
  uint64_t v3 = (void *)swift_task_alloc(dword_100051FF4);
  v2[19] = v3;
  void *v3 = v2;
  v3[1] = sub_10001D868;
  return sub_10001E4DC();
}

uint64_t sub_10001D868(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(*v2 + 152);
  uint64_t v6 = *(void *)(*v2 + 136);
  uint64_t v7 = *v2;
  *(void *)(v7 + 160) = a1;
  *(void *)(v7 + 16_Block_object_dispose(va, 8) = a2;
  swift_task_dealloc(v5);
  if (v6 == 1)
  {
    uint64_t v9 = (void *)swift_task_alloc(dword_100051FFC);
    *(void *)(v7 + 176) = v9;
    *uint64_t v9 = v7;
    v9[1] = sub_10001DAEC;
    return sub_10001E944();
  }

  else if (v6 == 2)
  {
    return swift_task_switch(sub_10001D9A4, 0LL, 0LL);
  }

  else
  {
    return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, a2);
  }

uint64_t sub_10001D9A4()
{
  uint64_t v1 = v0 + 2;
  uint64_t v2 = (char *)v0[18];
  id v3 = [v2 networkService];
  uint64_t v4 = *(void *)&v2[OBJC_IVAR____TtC13familycircled39FAFamilyChecklistRankingConfigOperation_kFAFamilyChecklistRankingConfigURLEndpoint];
  NSString v5 = String._bridgeToObjectiveC()();
  id v6 =  [v3 standardRequestWithEndpoint:v4 method:v5 plistBody:0 requestFormat:2 responseFormat:2];
  v0[25] = v6;

  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_10001DDC8;
  uint64_t v7 = swift_continuation_init(v0 + 2, 1LL);
  v0[10] = _NSConcreteStackBlock;
  uint64_t v8 = v0 + 10;
  v8[1] = 0x40000000LL;
  v8[2] = sub_10001D700;
  v8[3] = &unk_1000426B8;
  void v8[4] = v7;
  [v6 onComplete:v8];
  return swift_continuation_await(v1);
}

uint64_t sub_10001DAEC(uint64_t a1)
{
  id v3 = (void *)*v1;
  uint64_t v4 = *(void *)(*v1 + 176);
  uint64_t v5 = *v1;
  *(void *)(*v1 + 184) = a1;
  swift_task_dealloc(v4);
  uint64_t v6 = dword_100052000;
  uint64_t v7 = (void *)swift_task_alloc(unk_100052004);
  v3[24] = v7;
  *uint64_t v7 = v5;
  v7[1] = sub_10001DBA8;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_100052000 + v6))(v3[20], v3[21], a1);
}

uint64_t sub_10001DBA8(char a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 192LL);
  *(_BYTE *)(*(void *)v1 + 256LL) = a1;
  swift_task_dealloc(v2);
  return swift_task_switch(sub_10001DC30, 0LL, 0LL);
}

uint64_t sub_10001DC30()
{
  int v1 = *(unsigned __int8 *)(v0 + 256);

  if (v1 == 1) {
    return (*(uint64_t (**)(void, void))(v0 + 8))(*(void *)(v0 + 160), *(void *)(v0 + 168));
  }
  uint64_t v3 = v0 + 16;
  uint64_t v4 = *(char **)(v0 + 144);
  id v5 = [v4 networkService];
  uint64_t v6 = *(void *)&v4[OBJC_IVAR____TtC13familycircled39FAFamilyChecklistRankingConfigOperation_kFAFamilyChecklistRankingConfigURLEndpoint];
  NSString v7 = String._bridgeToObjectiveC()();
  id v8 =  [v5 standardRequestWithEndpoint:v6 method:v7 plistBody:0 requestFormat:2 responseFormat:2];
  *(void *)(v0 + 200) = v8;

  *(void *)(v0 + 56) = v0 + 120;
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 24) = sub_10001DDC8;
  uint64_t v9 = swift_continuation_init(v0 + 16, 1LL);
  *(void *)(v0 + 80) = _NSConcreteStackBlock;
  uint64_t v10 = (void *)(v0 + 80);
  v10[1] = 0x40000000LL;
  v10[2] = sub_10001D700;
  v10[3] = &unk_1000426B8;
  void v10[4] = v9;
  [v8 onComplete:v10];
  return swift_continuation_await(v3);
}

uint64_t sub_10001DDC8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48LL);
  *(void *)(*(void *)v0 + 208LL) = v1;
  if (v1) {
    uint64_t v2 = sub_10001E128;
  }
  else {
    uint64_t v2 = sub_10001DE6C;
  }
  return swift_task_switch(v2, 0LL, 0LL);
}

uint64_t sub_10001DE6C()
{
  uint64_t v1 = *(void **)(v0 + 200);
  uint64_t v2 = *(void **)(v0 + 120);
  *(void *)(v0 + 216) = v2;

  uint64_t v3 = (void *)objc_opt_self(&OBJC_CLASS___NSJSONSerialization);
  *(void *)(v0 + 12_Block_object_dispose(va, 8) = 0LL;
  id v4 = [v3 dataWithJSONObject:v2 options:0 error:v0 + 128];
  id v5 = *(id *)(v0 + 128);
  if (v4)
  {
    uint64_t v6 = *(void *)(v0 + 144);
    uint64_t v7 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v4);
    uint64_t v9 = v8;

    *(void *)(v0 + 224) = v7;
    *(void *)(v0 + 232) = v9;
    uint64_t v10 = (void *)(v6 + OBJC_IVAR____TtC13familycircled39FAFamilyChecklistRankingConfigOperation_cache);
    uint64_t v11 = *(void *)(v6 + OBJC_IVAR____TtC13familycircled39FAFamilyChecklistRankingConfigOperation_cache + 24);
    uint64_t v12 = *(void *)(v6 + OBJC_IVAR____TtC13familycircled39FAFamilyChecklistRankingConfigOperation_cache + 32);
    sub_10001E920(v10, v11);
    unint64_t v13 = *(int **)(v12 + 16);
    uint64_t v14 = *v13;
    uint64_t v15 = (void *)swift_task_alloc(v13[1]);
    *(void *)(v0 + 240) = v15;
    void *v15 = v0;
    v15[1] = sub_10001E004;
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)v13 + v14))(v7, v9, v11, v12);
  }

  else
  {
    unint64_t v17 = v5;
    uint64_t v19 = *(void *)(v0 + 160);
    unint64_t v18 = *(void *)(v0 + 168);
    _convertNSErrorToError(_:)(v5);

    swift_willThrow();
    sub_10001F384(v19, v18);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }

uint64_t sub_10001E004()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 240LL);
  *(void *)(*(void *)v1 + 248LL) = v0;
  swift_task_dealloc(v2);
  if (v0) {
    uint64_t v3 = sub_10001E1AC;
  }
  else {
    uint64_t v3 = sub_10001E0AC;
  }
  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_10001E0AC()
{
  uint64_t v1 = *(void *)(v0 + 160);
  unint64_t v2 = *(void *)(v0 + 168);

  sub_10001F384(v1, v2);
  return (*(uint64_t (**)(void, void))(v0 + 8))(*(void *)(v0 + 224), *(void *)(v0 + 232));
}

uint64_t sub_10001E128()
{
  uint64_t v1 = *(void **)(v0 + 200);
  uint64_t v2 = *(void *)(v0 + 160);
  unint64_t v3 = *(void *)(v0 + 168);
  swift_willThrow();
  sub_10001F384(v2, v3);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001E1AC()
{
  uint64_t v1 = *(void **)(v0 + 216);
  uint64_t v2 = *(void *)(v0 + 160);
  unint64_t v3 = *(void *)(v0 + 168);
  sub_10001F398(*(void *)(v0 + 224), *(void *)(v0 + 232));

  sub_10001F384(v2, v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001E358(uint64_t a1, void *aBlock, void *a3)
{
  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  uint64_t v6 = dword_100051FEC;
  id v7 = a3;
  uint64_t v8 = (void *)swift_task_alloc(v6);
  v3[4] = v8;
  void *v8 = v3;
  v8[1] = sub_10001E3EC;
  v8[17] = a1;
  v8[18] = v7;
  uint64_t v9 = (void *)swift_task_alloc(dword_100051FF4);
  v8[19] = v9;
  *uint64_t v9 = v8;
  v9[1] = sub_10001D868;
  return sub_10001E4DC();
}

uint64_t sub_10001E3EC(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = v2;
  uint64_t v7 = *v3;
  uint64_t v8 = *(void *)(*v3 + 32);
  uint64_t v9 = *(void **)(*v3 + 16);
  uint64_t v10 = *v3;
  swift_task_dealloc(v8);

  if (v4)
  {
    uint64_t v11 = _convertErrorToNSError(_:)(v4);
    swift_errorRelease(v4);
    Class isa = 0LL;
    unint64_t v13 = (void *)v11;
  }

  else if (a2 >> 60 == 15)
  {
    uint64_t v11 = 0LL;
    Class isa = 0LL;
    unint64_t v13 = 0LL;
  }

  else
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    sub_10001F384(a1, a2);
    uint64_t v11 = 0LL;
    unint64_t v13 = isa;
  }

  uint64_t v14 = *(void (***)(void, void, void))(v7 + 24);
  ((void (**)(void, Class, uint64_t))v14)[2](v14, isa, v11);

  _Block_release(v14);
  return (*(uint64_t (**)(void))(v10 + 8))();
}

uint64_t sub_10001E4DC()
{
  v1[5] = v0;
  uint64_t v2 = type metadata accessor for Logger(0LL);
  v1[6] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  v1[7] = v3;
  v1[8] = swift_task_alloc((*(void *)(v3 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_10001E53C, 0LL, 0LL);
}

uint64_t sub_10001E53C()
{
  uint64_t v1 = (void *)(*(void *)(v0 + 40) + OBJC_IVAR____TtC13familycircled39FAFamilyChecklistRankingConfigOperation_cache);
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  sub_10001E920(v1, v2);
  uint64_t v4 = *(int **)(v3 + 8);
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)v4 + *v4);
  id v5 = (void *)swift_task_alloc(v4[1]);
  *(void *)(v0 + 72) = v5;
  void *v5 = v0;
  v5[1] = sub_10001E5C0;
  return v7(v2, v3);
}

uint64_t sub_10001E5C0(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void *)(*v3 + 72);
  uint64_t v7 = *v3;
  *(void *)(v7 + 80) = v2;
  swift_task_dealloc(v6);
  if (v2) {
    return swift_task_switch(sub_10001E650, 0LL, 0LL);
  }
  swift_task_dealloc(*(void *)(v7 + 64));
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, a2);
}

uint64_t sub_10001E650(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + 80);
  static FamilyLogger.daemon.getter(a1);
  swift_errorRetain(v2);
  uint64_t v3 = swift_errorRetain(v2);
  uint64_t v4 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = *(void *)(v1 + 80);
    uint64_t v7 = *(void *)(v1 + 56);
    uint64_t v20 = *(void *)(v1 + 64);
    uint64_t v8 = *(void *)(v1 + 48);
    uint64_t v9 = swift_slowAlloc(22LL, -1LL);
    uint64_t v10 = swift_slowAlloc(64LL, -1LL);
    uint64_t v21 = v10;
    *(_DWORD *)uint64_t v9 = 136315394;
    *(void *)(v1 + 16) = sub_1000218D0(0x6D6F724664616F6CLL, 0xEF29286568636143LL, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 16, v1 + 24, v9 + 4, v9 + 12);
    *(_WORD *)(v9 + 12) = 2080;
    *(void *)(v1 + 24) = v6;
    swift_errorRetain(v6);
    uint64_t v11 = sub_10001B6BC(&qword_100051F60);
    uint64_t v12 = String.init<A>(reflecting:)(v1 + 24, v11);
    unint64_t v14 = v13;
    *(void *)(v1 + 32) = sub_1000218D0(v12, v13, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 32, v1 + 40, v9 + 14, v9 + 22);
    swift_bridgeObjectRelease(v14);
    swift_errorRelease(v6);
    swift_errorRelease(v6);
    _os_log_impl( (void *)&_mh_execute_header,  v4,  v5,  "%s unable to load data from FAFamilyChecklistRankingConfigCache with error: %s",  (uint8_t *)v9,  0x16u);
    swift_arrayDestroy(v10, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v10, -1LL, -1LL);
    swift_slowDealloc(v9, -1LL, -1LL);

    swift_errorRelease(v6);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v20, v8);
  }

  else
  {
    uint64_t v15 = *(void *)(v1 + 80);
    uint64_t v17 = *(void *)(v1 + 56);
    uint64_t v16 = *(void *)(v1 + 64);
    uint64_t v18 = *(void *)(v1 + 48);
    swift_errorRelease(v15);
    swift_errorRelease(v15);
    swift_errorRelease(v15);

    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
  }

  swift_task_dealloc(*(void *)(v1 + 64));
  return (*(uint64_t (**)(void, unint64_t))(v1 + 8))(0LL, 0xF000000000000000LL);
}

id sub_10001E898()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FAFamilyChecklistRankingConfigOperation();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for FAFamilyChecklistRankingConfigOperation()
{
  return objc_opt_self(&OBJC_CLASS____TtC13familycircled39FAFamilyChecklistRankingConfigOperation);
}

void *sub_10001E920(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t sub_10001E944()
{
  uint64_t v1 = type metadata accessor for Logger(0LL);
  v0[19] = v1;
  uint64_t v2 = *(void *)(v1 - 8);
  v0[20] = v2;
  v0[21] = swift_task_alloc((*(void *)(v2 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_10001E9A0, 0LL, 0LL);
}

uint64_t sub_10001E9A0()
{
  uint64_t v1 = v0 + 2;
  id v2 = [objc_allocWithZone(FAFetchFamilyCircleRequest) init];
  v0[22] = v2;
  [v2 setCachePolicy:0];
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_10001EA68;
  uint64_t v3 = swift_continuation_init(v0 + 2, 1LL);
  v0[10] = _NSConcreteStackBlock;
  uint64_t v4 = v0 + 10;
  v4[1] = 0x40000000LL;
  v4[2] = sub_10001D700;
  v4[3] = &unk_1000426D0;
  void v4[4] = v3;
  [v2 startRequestWithCompletionHandler:v4];
  return swift_continuation_await(v1);
}

uint64_t sub_10001EA68()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48LL);
  *(void *)(*(void *)v0 + 184LL) = v1;
  if (v1) {
    id v2 = sub_10001EB08;
  }
  else {
    id v2 = sub_10001EAC8;
  }
  return swift_task_switch(v2, 0LL, 0LL);
}

uint64_t sub_10001EAC8()
{
  uint64_t v1 = *(void *)(v0 + 120);
  swift_task_dealloc(*(void *)(v0 + 168));
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_10001EB08()
{
  uint64_t v1 = *(void *)(v0 + 184);
  uint64_t v2 = swift_willThrow();
  static FamilyLogger.daemon.getter(v2);
  swift_errorRetain(v1);
  uint64_t v3 = swift_errorRetain(v1);
  uint64_t v4 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = *(void **)(v0 + 176);
    uint64_t v7 = *(void *)(v0 + 184);
    uint64_t v19 = *(void *)(v0 + 160);
    uint64_t v20 = *(void *)(v0 + 152);
    uint64_t v21 = *(void *)(v0 + 168);
    uint64_t v8 = swift_slowAlloc(22LL, -1LL);
    uint64_t v9 = swift_slowAlloc(64LL, -1LL);
    v22[0] = v9;
    *(_DWORD *)uint64_t v8 = 136315394;
    *(void *)(v0 + 12_Block_object_dispose(va, 8) = sub_1000218D0(0xD00000000000001CLL, 0x8000000100037960LL, v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 128, v0 + 136, v8 + 4, v8 + 12);
    *(_WORD *)(v8 + 12) = 2080;
    *(void *)(v0 + 136) = v7;
    swift_errorRetain(v7);
    uint64_t v10 = sub_10001B6BC(&qword_100051F60);
    uint64_t v11 = String.init<A>(reflecting:)(v0 + 136, v10);
    unint64_t v13 = v12;
    *(void *)(v0 + 144) = sub_1000218D0(v11, v12, v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 144, v0 + 152, v8 + 14, v8 + 22);
    swift_bridgeObjectRelease(v13);
    swift_errorRelease(v7);
    swift_errorRelease(v7);
    _os_log_impl( (void *)&_mh_execute_header,  v4,  v5,  "%s unable to retrieve familyCircle from cache with error: %s",  (uint8_t *)v8,  0x16u);
    swift_arrayDestroy(v9, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1LL, -1LL);
    swift_slowDealloc(v8, -1LL, -1LL);

    swift_errorRelease(v7);
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v21, v20);
  }

  else
  {
    uint64_t v14 = *(void *)(v0 + 184);
    uint64_t v16 = *(void *)(v0 + 160);
    uint64_t v15 = *(void *)(v0 + 168);
    uint64_t v17 = *(void *)(v0 + 152);

    swift_errorRelease(v14);
    swift_errorRelease(v14);
    swift_errorRelease(v14);

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
  }

  swift_task_dealloc(*(void *)(v0 + 168));
  return (*(uint64_t (**)(void))(v0 + 8))(0LL);
}

uint64_t sub_10001ED60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[18] = a2;
  v3[19] = a3;
  v3[17] = a1;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  v3[20] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[21] = v5;
  unint64_t v6 = (*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v3[22] = swift_task_alloc(v6);
  v3[23] = swift_task_alloc(v6);
  return swift_task_switch(sub_10001EE00, 0LL, 0LL);
}

uint64_t sub_10001EE00()
{
  unint64_t v1 = *(void *)(v0 + 144);
  if (v1 >> 60 == 15)
  {
    char v2 = 0;
    goto LABEL_30;
  }

  uint64_t v3 = *(void **)(v0 + 152);
  uint64_t v4 = *(void *)(v0 + 136);
  if (v3)
  {
    sub_10001F3DC(v4, v1);
    id v5 = [v3 checklistRankingVersion];
    if (v5)
    {
      unint64_t v6 = v5;
      uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
      uint64_t v9 = v8;

      uint64_t v10 = (void *)objc_opt_self(&OBJC_CLASS___NSJSONSerialization);
      Class isa = Data._bridgeToObjectiveC()().super.isa;
      *(void *)(v0 + 12_Block_object_dispose(va, 8) = 0LL;
      id v12 = [v10 JSONObjectWithData:isa options:0 error:v0 + 128];

      unint64_t v13 = *(void **)(v0 + 128);
      if (!v12)
      {
        id v27 = v13;
        swift_bridgeObjectRelease(v9);
        uint64_t v28 = _convertNSErrorToError(_:)(v13);

        uint64_t v29 = swift_willThrow();
        static FamilyLogger.daemon.getter(v29);
        swift_errorRetain(v28);
        uint64_t v30 = swift_errorRetain(v28);
        id v31 = (os_log_s *)Logger.logObject.getter(v30);
        os_log_type_t v32 = static os_log_type_t.error.getter();
        BOOL v33 = os_log_type_enabled(v31, v32);
        uint64_t v35 = *(void *)(v0 + 168);
        uint64_t v34 = *(void *)(v0 + 176);
        uint64_t v36 = *(void *)(v0 + 160);
        if (v33)
        {
          uint64_t v53 = *(void *)(v0 + 136);
          unint64_t v54 = *(void *)(v0 + 144);
          uint64_t v37 = swift_slowAlloc(22LL, -1LL);
          uint64_t v55 = v34;
          uint64_t v38 = swift_slowAlloc(64LL, -1LL);
          uint64_t v56 = v38;
          *(_DWORD *)uint64_t v37 = 136315394;
          *(void *)(v0 + 120) = sub_1000218D0(0xD000000000000032LL, 0x80000001000378F0LL, &v56);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 120, v0 + 128, v37 + 4, v37 + 12);
          *(_WORD *)(v37 + 12) = 2080;
          *(void *)(v0 + 104) = v28;
          swift_errorRetain(v28);
          uint64_t v39 = sub_10001B6BC(&qword_100051F60);
          uint64_t v40 = String.init<A>(reflecting:)(v0 + 104, v39);
          unint64_t v42 = v41;
          *(void *)(v0 + 96) = sub_1000218D0(v40, v41, &v56);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 96, v0 + 104, v37 + 14, v37 + 22);
          swift_bridgeObjectRelease(v42);
          swift_errorRelease(v28);
          swift_errorRelease(v28);
          _os_log_impl( (void *)&_mh_execute_header,  v31,  v32,  "%s unable to create json object from cachedData with error: %s",  (uint8_t *)v37,  0x16u);
          swift_arrayDestroy(v38, 2LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v38, -1LL, -1LL);
          swift_slowDealloc(v37, -1LL, -1LL);
          sub_10001F384(v53, v54);

          swift_errorRelease(v28);
          (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v55, v36);
        }

        else
        {
          sub_10001F384(*(void *)(v0 + 136), *(void *)(v0 + 144));
          swift_errorRelease(v28);
          swift_errorRelease(v28);
          swift_errorRelease(v28);

          (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v34, v36);
        }

        char v2 = 0;
        goto LABEL_30;
      }

      uint64_t v14 = (_OWORD *)(v0 + 48);
      id v15 = v13;
      _bridgeAnyObjectToAny(_:)(v12);
      swift_unknownObjectRelease(v12);
      uint64_t v16 = sub_10001B6BC((uint64_t *)&unk_1000523E0);
      if (swift_dynamicCast(v0 + 112, v0 + 16, (char *)&type metadata for Any + 8, v16, 6LL)
        && (uint64_t v17 = *(void *)(v0 + 112)) != 0)
      {
        if (*(void *)(v17 + 16) && (unint64_t v18 = sub_100021F20(0x6E6F6973726576LL, 0xE700000000000000LL), (v19 & 1) != 0))
        {
          sub_10001F460(*(void *)(v17 + 56) + 32 * v18, v0 + 48);
        }

        else
        {
          _OWORD *v14 = 0u;
          *(_OWORD *)(v0 + 64) = 0u;
        }

        swift_bridgeObjectRelease(v17);
        if (*(void *)(v0 + 72))
        {
          if ((swift_dynamicCast(v0 + 80, v0 + 48, (char *)&type metadata for Any + 8, &type metadata for String, 6LL) & 1) != 0)
          {
            uint64_t v43 = *(void *)(v0 + 80);
            uint64_t v44 = *(void *)(v0 + 88);
            if (v43 == v7 && v44 == v9)
            {
              char v2 = 1;
              uint64_t v44 = v9;
            }

            else
            {
              char v2 = _stringCompareWithSmolCheck(_:_:expecting:)(v43, *(void *)(v0 + 88), v7, v9, 0LL);
            }

            uint64_t v50 = *(void *)(v0 + 136);
            unint64_t v49 = *(void *)(v0 + 144);
            swift_bridgeObjectRelease(v44);
            swift_bridgeObjectRelease(v9);
            sub_10001F384(v50, v49);
          }

          else
          {
            uint64_t v48 = *(void *)(v0 + 136);
            unint64_t v47 = *(void *)(v0 + 144);
            swift_bridgeObjectRelease(v9);
            sub_10001F384(v48, v47);
            char v2 = 0;
          }

          goto LABEL_30;
        }
      }

      else
      {
        _OWORD *v14 = 0u;
        *(_OWORD *)(v0 + 64) = 0u;
      }

      uint64_t v46 = *(void *)(v0 + 136);
      unint64_t v45 = *(void *)(v0 + 144);
      swift_bridgeObjectRelease(v9);
      sub_10001F384(v46, v45);
      sub_10001F420(v0 + 48);
      char v2 = 0;
      goto LABEL_30;
    }
  }

  else
  {
    id v5 = (id)sub_10001F3DC(v4, v1);
  }

  uint64_t v20 = static FamilyLogger.daemon.getter(v5);
  uint64_t v21 = (os_log_s *)Logger.logObject.getter(v20);
  os_log_type_t v22 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v23 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  v22,  "server has not defined checklist ranking version, considering cache as valid",  v23,  2u);
    swift_slowDealloc(v23, -1LL, -1LL);
  }

  uint64_t v24 = *(void *)(v0 + 184);
  uint64_t v25 = *(void *)(v0 + 160);
  uint64_t v26 = *(void *)(v0 + 168);
  sub_10001F384(*(void *)(v0 + 136), *(void *)(v0 + 144));

  (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v24, v25);
  char v2 = 1;
LABEL_30:
  uint64_t v51 = *(void *)(v0 + 176);
  swift_task_dealloc(*(void *)(v0 + 184));
  swift_task_dealloc(v51);
  return (*(uint64_t (**)(void))(v0 + 8))(v2 & 1);
}

uint64_t sub_10001F384(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10001F398(result, a2);
  }
  return result;
}

uint64_t sub_10001F398(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release(result);
  }

  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10001F3DC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    ((void (*)(void))swift_retain)();
  }

  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10001F420(uint64_t a1)
{
  uint64_t v2 = sub_10001B6BC(&qword_100052008);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_10001F460(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10001F49C()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_10001F4C8()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  id v5 = (void *)swift_task_alloc(dword_100052014);
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_10001D4E4;
  return ((uint64_t (*)(uint64_t, void *, void *))((char *)&dword_100052010 + dword_100052010))(v2, v3, v4);
}

uint64_t sub_10001F53C(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10001F55C()
{
  uint64_t v0 = sub_10001B6BC(&qword_1000521F8);
  uint64_t inited = swift_initStackObject(v0, &v4);
  *(_OWORD *)(inited + 16) = xmmword_100035900;
  *(void *)(inited + 32) = 0x6E65726566657250LL;
  *(void *)(inited + 40) = 0xEB00000000736563LL;
  *(void *)(inited + 4_Block_object_dispose(va, 8) = 0x796C696D6146LL;
  *(void *)(inited + 56) = 0xE600000000000000LL;
  *(void *)(inited + 64) = 0x7463796C696D6166LL;
  *(void *)(inited + 72) = 0xE90000000000006CLL;
  strcpy((char *)(inited + 80), "FamilySettings");
  *(_BYTE *)(inited + 95) = -18;
  *(void *)(inited + 96) = 0xD00000000000001CLL;
  *(void *)(inited + 104) = 0x8000000100037CD0LL;
  Swift::Int v2 = sub_1000220EC(inited);
  swift_setDeallocating(inited);
  uint64_t result = swift_arrayDestroy(inited + 32, 5LL, &type metadata for String);
  qword_100052020 = v2;
  return result;
}

uint64_t sub_10001F66C()
{
  uint64_t v0 = sub_10001B6BC(&qword_100052048);
  sub_100022A68(v0, qword_100052028);
  sub_100022678(v0, (uint64_t)qword_100052028);
  id v1 = [(id)objc_opt_self(NSUnitDuration) hours];
  uint64_t v2 = sub_100022AF0(0LL, &qword_1000521E0, &OBJC_CLASS___NSUnitDuration_ptr);
  return Measurement.init(value:unit:)(v1, v2, 24.0);
}

id RateLimiter.__allocating_init(persistence:identifier:getDate:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v11 = objc_allocWithZone(v5);
  id v12 = sub_10002228C(a1, a2, a3, a4, a5);
  swift_unknownObjectRelease(a1);
  swift_release(a5);
  return v12;
}

id RateLimiter.init(persistence:identifier:getDate:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7 = sub_10002228C(a1, a2, a3, a4, a5);
  swift_unknownObjectRelease(a1);
  swift_release(a5);
  return v7;
}

void sub_10001F86C(uint64_t a1)
{
  id v1 = (id)(*(uint64_t (**)(void))(a1 + 16))();
  static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

id RateLimiter.__allocating_init(identifier:)(uint64_t a1, uint64_t a2)
{
  id v4 = objc_allocWithZone(v2);
  id v5 = [(id)objc_opt_self(NSUserDefaults) standardUserDefaults];
  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  void v10[4] = &j___s10Foundation4DateV3nowACvgZ;
  v10[5] = 0LL;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256LL;
  v10[2] = sub_10001FA88;
  v10[3] = &unk_100042768;
  id v7 = _Block_copy(v10);
  id v8 = [v4 initWithPersistence:v5 identifier:v6 getDate:v7];
  _Block_release(v7);

  return v8;
}

id RateLimiter.init(identifier:)(uint64_t a1, uint64_t a2)
{
  id v4 = [(id)objc_opt_self(NSUserDefaults) standardUserDefaults];
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  void v9[4] = &j___s10Foundation4DateV3nowACvgZ;
  v9[5] = 0LL;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256LL;
  void v9[2] = sub_10001FA88;
  v9[3] = &unk_100042790;
  NSString v6 = _Block_copy(v9);
  id v7 = [v2 initWithPersistence:v4 identifier:v5 getDate:v6];
  _Block_release(v6);

  return v7;
}

Class sub_10001FA88(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Date(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  NSString v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v7 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v8 = swift_retain(v6);
  v7(v8);
  swift_release(v6);
  Class isa = Date._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return isa;
}

Swift::Bool __swiftcall RateLimiter.isAllowed(clientName:)(Swift::String clientName)
{
  Swift::String v3 = clientName;
  OS_dispatch_queue.sync<A>(execute:)(&v4, sub_10002252C, &v2, &type metadata for Bool);
  return v4;
}

Swift::Void __swiftcall RateLimiter.recordCall(clientName:)(Swift::String clientName)
{
  object = clientName._object;
  uint64_t countAndFlagsBits = clientName._countAndFlagsBits;
  BOOL v4 = *(dispatch_queue_s **)&v1[OBJC_IVAR___FARateLimiter_queue];
  NSString v5 = (void *)swift_allocObject(&unk_1000427C8, 40LL, 7LL);
  v5[2] = v1;
  v5[3] = countAndFlagsBits;
  void v5[4] = object;
  uint64_t v6 = swift_allocObject(&unk_1000427F0, 32LL, 7LL);
  *(void *)(v6 + 16) = sub_10002256C;
  *(void *)(v6 + 24) = v5;
  void v11[4] = sub_1000225A4;
  uint64_t v12 = v6;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256LL;
  v11[2] = sub_10001FE48;
  v11[3] = &unk_100042808;
  id v7 = _Block_copy(v11);
  uint64_t v8 = v12;
  uint64_t v9 = v1;
  swift_bridgeObjectRetain(object);
  swift_retain(v6);
  swift_release(v8);
  dispatch_sync(v4, v7);
  _Block_release(v7);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation(v6, "", 100LL, 52LL, 20LL, 1LL);
  swift_release(v5);
  swift_release(v6);
  if ((isEscapingClosureAtFileLocation & 1) != 0) {
    __break(1u);
  }
}

uint64_t sub_10001FE48(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_10001FEBC(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = type metadata accessor for Logger(0LL);
  uint64_t v46 = *(void *)(v5 - 8);
  uint64_t v47 = v5;
  __chkstk_darwin(v5);
  uint64_t v50 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for ClientRecord(0LL);
  uint64_t v44 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for Date(0LL);
  uint64_t v49 = *(void *)(v10 - 8);
  uint64_t v11 = __chkstk_darwin(v10);
  unint64_t v45 = (char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v43 - v13;
  id v15 = (void *)sub_100020C9C();
  (*(void (**)(void))(v2 + OBJC_IVAR___FARateLimiter_getDate))();
  swift_bridgeObjectRetain(a2);
  uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v15);
  v52 = v15;
  uint64_t v48 = a1;
  unint64_t v18 = sub_100021F20(a1, a2);
  uint64_t v19 = v15[2];
  BOOL v20 = (v17 & 1) == 0;
  uint64_t v21 = v19 + v20;
  if (__OFADD__(v19, v20))
  {
    __break(1u);
    goto LABEL_13;
  }

  LOBYTE(a1) = v17;
  if (v15[3] >= v21)
  {
    if ((isUniquelyReferenced_nonNull_native & 1) != 0) {
      goto LABEL_6;
    }
LABEL_13:
    sub_100026224();
    id v15 = v52;
    goto LABEL_6;
  }

  sub_100025BC0(v21, isUniquelyReferenced_nonNull_native);
  id v15 = v52;
  unint64_t v22 = sub_100021F20(v48, a2);
  if ((a1 & 1) != (v23 & 1))
  {
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
    __break(1u);
    return result;
  }

  unint64_t v18 = v22;
LABEL_6:
  uint64_t v24 = v50;
  swift_bridgeObjectRelease(0x8000000000000000LL);
  uint64_t v25 = swift_bridgeObjectRetain(v15);
  if ((a1 & 1) == 0)
  {
    static Date.now.getter(v25);
    sub_100022064(v18, v48, a2, (uint64_t)v9, v15);
    swift_bridgeObjectRetain(a2);
  }

  uint64_t v26 = v15[7];
  swift_bridgeObjectRelease(v15);
  uint64_t v27 = v49;
  (*(void (**)(unint64_t, char *, uint64_t))(v49 + 24))(v26 + *(void *)(v44 + 72) * v18, v14, v10);
  swift_bridgeObjectRelease(a2);
  sub_100020E04((unint64_t)v15);
  uint64_t v28 = swift_bridgeObjectRelease(v15);
  uint64_t v29 = v24;
  static FamilyLogger.rateLimiter.getter(v28);
  uint64_t v30 = v45;
  (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v45, v14, v10);
  uint64_t v31 = swift_bridgeObjectRetain_n(a2, 2LL);
  os_log_type_t v32 = (os_log_s *)Logger.logObject.getter(v31);
  os_log_type_t v33 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v34 = swift_slowAlloc(22LL, -1LL);
    uint64_t v35 = swift_slowAlloc(64LL, -1LL);
    v52 = (void *)v35;
    *(_DWORD *)uint64_t v34 = 136315394;
    swift_bridgeObjectRetain(a2);
    uint64_t v51 = sub_1000218D0(v48, a2, (uint64_t *)&v52);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v51, &v52, v34 + 4, v34 + 12);
    swift_bridgeObjectRelease_n(a2, 3LL);
    *(_WORD *)(v34 + 12) = 2080;
    uint64_t v36 = sub_10001BA20( &qword_1000521D8,  (uint64_t (*)(uint64_t))&type metadata accessor for Date,  (uint64_t)&protocol conformance descriptor for Date);
    uint64_t v37 = dispatch thunk of CustomStringConvertible.description.getter(v10, v36);
    unint64_t v39 = v38;
    uint64_t v51 = sub_1000218D0(v37, v38, (uint64_t *)&v52);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v51, &v52, v34 + 14, v34 + 22);
    swift_bridgeObjectRelease(v39);
    uint64_t v40 = *(void (**)(char *, uint64_t))(v49 + 8);
    v40(v30, v10);
    _os_log_impl((void *)&_mh_execute_header, v32, v33, "Client: %s recorded new call at: %s", (uint8_t *)v34, 0x16u);
    swift_arrayDestroy(v35, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v35, -1LL, -1LL);
    swift_slowDealloc(v34, -1LL, -1LL);

    (*(void (**)(char *, uint64_t))(v46 + 8))(v50, v47);
    return ((uint64_t (*)(char *, uint64_t))v40)(v14, v10);
  }

  else
  {

    unint64_t v42 = *(void (**)(char *, uint64_t))(v27 + 8);
    v42(v30, v10);
    swift_bridgeObjectRelease_n(a2, 2LL);
    (*(void (**)(char *, uint64_t))(v46 + 8))(v29, v47);
    return ((uint64_t (*)(char *, uint64_t))v42)(v14, v10);
  }

Swift::Bool __swiftcall RateLimiter.unsafeIsAllowed(clientName:)(Swift::String clientName)
{
  object = clientName._object;
  uint64_t countAndFlagsBits = clientName._countAndFlagsBits;
  uint64_t v3 = type metadata accessor for Logger(0LL);
  uint64_t v84 = *(void *)(v3 - 8);
  uint64_t v85 = v3;
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v6 = (char *)&v74 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v74 - v7;
  uint64_t v9 = sub_10001B6BC(&qword_100052048);
  uint64_t v83 = *(void *)(v9 - 8);
  uint64_t v10 = __chkstk_darwin(v9);
  v81 = (char *)&v74 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10);
  v82 = (char *)&v74 - v12;
  uint64_t v13 = sub_10001B6BC(&qword_100052050);
  __chkstk_darwin(v13);
  id v15 = (char *)&v74 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = sub_10001B6BC(&qword_100052058);
  __chkstk_darwin(v16);
  unint64_t v18 = (char *)&v74 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = type metadata accessor for Date(0LL);
  v86 = *(char **)(v19 - 8);
  uint64_t v20 = __chkstk_darwin(v19);
  unint64_t v22 = (char *)&v74 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v23 = __chkstk_darwin(v20);
  v80 = (char *)&v74 - v24;
  __chkstk_darwin(v23);
  uint64_t v26 = (char *)&v74 - v25;
  if (qword_100051CB0 != -1) {
    swift_once(&qword_100051CB0, sub_10001F55C);
  }
  uint64_t v78 = v1;
  unint64_t v27 = sub_100020C9C();
  uint64_t v28 = *(void *)(v27 + 16);
  uint64_t v77 = v9;
  if (v28)
  {
    v79 = v6;
    swift_bridgeObjectRetain(object);
    unint64_t v29 = sub_100021F20(countAndFlagsBits, (uint64_t)object);
    if ((v30 & 1) != 0)
    {
      unint64_t v31 = v29;
      v76 = object;
      uint64_t v32 = *(void *)(v27 + 56);
      uint64_t v33 = type metadata accessor for ClientRecord(0LL);
      v75 = v26;
      uint64_t v34 = v19;
      uint64_t v35 = v8;
      uint64_t v36 = v22;
      uint64_t v37 = *(void *)(v33 - 8);
      uint64_t v38 = v32 + *(void *)(v37 + 72) * v31;
      object = v76;
      sub_100022690(v38, (uint64_t)v15);
      unint64_t v39 = *(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56);
      unint64_t v22 = v36;
      uint64_t v8 = v35;
      uint64_t v19 = v34;
      uint64_t v26 = v75;
      v39(v15, 0LL, 1LL, v33);
    }

    else
    {
      uint64_t v33 = type metadata accessor for ClientRecord(0LL);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56LL))(v15, 1LL, 1LL, v33);
    }

    swift_bridgeObjectRelease(object);
    uint64_t v6 = v79;
  }

  else
  {
    uint64_t v33 = type metadata accessor for ClientRecord(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56LL))(v15, 1LL, 1LL, v33);
  }

  swift_bridgeObjectRelease(v27);
  type metadata accessor for ClientRecord(0LL);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v33 - 8) + 48LL))(v15, 1LL, v33) == 1)
  {
    sub_100022600((uint64_t)v15, &qword_100052050);
    (*((void (**)(char *, uint64_t, uint64_t, uint64_t))v86 + 7))(v18, 1LL, 1LL, v19);
LABEL_13:
    uint64_t v41 = sub_100022600((uint64_t)v18, &qword_100052058);
    static FamilyLogger.rateLimiter.getter(v41);
    uint64_t v42 = swift_bridgeObjectRetain_n(object, 2LL);
    uint64_t v43 = (os_log_s *)Logger.logObject.getter(v42);
    os_log_type_t v44 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v43, v44))
    {
      unint64_t v45 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v46 = v6;
      uint64_t v47 = swift_slowAlloc(32LL, -1LL);
      uint64_t v89 = v47;
      *(_DWORD *)unint64_t v45 = 136315138;
      swift_bridgeObjectRetain(object);
      uint64_t v88 = sub_1000218D0(countAndFlagsBits, (unint64_t)object, &v89);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v88, &v89, v45 + 4, v45 + 12);
      swift_bridgeObjectRelease_n(object, 3LL);
      _os_log_impl((void *)&_mh_execute_header, v43, v44, "Client: %s allowed to call for the first time", v45, 0xCu);
      char v48 = 1;
      swift_arrayDestroy(v47, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v47, -1LL, -1LL);
      swift_slowDealloc(v45, -1LL, -1LL);

      (*(void (**)(char *, uint64_t))(v84 + 8))(v46, v85);
      return v48 & 1;
    }

    swift_bridgeObjectRelease_n(object, 2LL);
    (*(void (**)(char *, uint64_t))(v84 + 8))(v6, v85);
LABEL_16:
    char v48 = 1;
    return v48 & 1;
  }

  uint64_t v40 = v86;
  (*((void (**)(char *, char *, uint64_t))v86 + 2))(v18, v15, v19);
  sub_10002263C((uint64_t)v15);
  (*((void (**)(char *, void, uint64_t, uint64_t))v40 + 7))(v18, 0LL, 1LL, v19);
  v79 = v22;
  (*((void (**)(char *, char *, uint64_t))v40 + 4))(v26, v18, v19);
  if (qword_100051CB8 != -1) {
    swift_once(&qword_100051CB8, sub_10001F66C);
  }
  uint64_t v50 = v77;
  uint64_t v51 = sub_100022678(v77, (uint64_t)qword_100052028);
  uint64_t v53 = v82;
  uint64_t v52 = v83;
  (*(void (**)(char *, uint64_t, uint64_t))(v83 + 16))(v82, v51, v50);
  id v54 = [(id)objc_opt_self(NSUnitDuration) seconds];
  uint64_t v55 = v81;
  Measurement<>.converted(to:)();

  double v56 = Measurement.value.getter(v50);
  id v57 = *(uint64_t (**)(char *, uint64_t))(v52 + 8);
  uint64_t v58 = v57(v55, v50);
  v59 = v80;
  Date.addingTimeInterval(_:)(v58, v56);
  uint64_t v60 = v57(v53, v50);
  v61 = v79;
  (*(void (**)(uint64_t))(v78 + OBJC_IVAR___FARateLimiter_getDate))(v60);
  uint64_t v62 = sub_10001BA20( &qword_100052068,  (uint64_t (*)(uint64_t))&type metadata accessor for Date,  (uint64_t)&protocol conformance descriptor for Date);
  int v63 = dispatch thunk of static Comparable.< infix(_:_:)(v61, v59, v19, v62);
  v64 = (void (*)(char *, uint64_t))*((void *)v86 + 1);
  v64(v61, v19);
  uint64_t v65 = ((uint64_t (*)(char *, uint64_t))v64)(v59, v19);
  static FamilyLogger.rateLimiter.getter(v65);
  uint64_t v66 = swift_bridgeObjectRetain_n(object, 2LL);
  v67 = v8;
  v68 = (os_log_s *)Logger.logObject.getter(v66);
  os_log_type_t v69 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v68, v69))
  {
    uint64_t v70 = swift_slowAlloc(18LL, -1LL);
    v86 = v67;
    uint64_t v71 = v70;
    uint64_t v72 = swift_slowAlloc(32LL, -1LL);
    LODWORD(v83) = v63;
    uint64_t v73 = v72;
    uint64_t v89 = v72;
    *(_DWORD *)uint64_t v71 = 136315394;
    swift_bridgeObjectRetain(object);
    uint64_t v88 = sub_1000218D0(countAndFlagsBits, (unint64_t)object, &v89);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v88, &v89, v71 + 4, v71 + 12);
    swift_bridgeObjectRelease_n(object, 3LL);
    *(_WORD *)(v71 + 12) = 1024;
    char v48 = v83 ^ 1;
    LODWORD(v8_Block_object_dispose(va, 8) = (v83 ^ 1) & 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v88, (char *)&v88 + 4, v71 + 14, v71 + 18);
    _os_log_impl((void *)&_mh_execute_header, v68, v69, "Client: %s isAllowed: %{BOOL}d", (uint8_t *)v71, 0x12u);
    swift_arrayDestroy(v73, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v73, -1LL, -1LL);
    swift_slowDealloc(v71, -1LL, -1LL);

    (*(void (**)(char *, uint64_t))(v84 + 8))(v86, v85);
    v64(v26, v19);
  }

  else
  {
    swift_bridgeObjectRelease_n(object, 2LL);

    (*(void (**)(char *, uint64_t))(v84 + 8))(v67, v85);
    v64(v26, v19);
    char v48 = v63 ^ 1;
  }

  return v48 & 1;
}

uint64_t sub_100020B68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    Hasher.init(_seed:)(v20, *(void *)(a3 + 40));
    String.hash(into:)(v20, a1, a2);
    Swift::Int v6 = Hasher._finalize()();
    uint64_t v7 = -1LL << *(_BYTE *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if (((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v8) & 1) != 0)
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      uint64_t v12 = v11[1];
      BOOL v13 = *v11 == a1 && v12 == a2;
      if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v11, v12, a1, a2, 0LL) & 1) != 0) {
        return 1LL;
      }
      uint64_t v15 = ~v7;
      unint64_t v16 = (v8 + 1) & v15;
      if (((*(void *)(v9 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v16) & 1) != 0)
      {
        while (1)
        {
          uint64_t v17 = (void *)(v10 + 16 * v16);
          uint64_t v18 = v17[1];
          BOOL v19 = *v17 == a1 && v18 == a2;
          if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v17, v18, a1, a2, 0LL) & 1) != 0) {
            break;
          }
          uint64_t result = 0LL;
          unint64_t v16 = (v16 + 1) & v15;
          if (((*(void *)(v9 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v16) & 1) == 0) {
            return result;
          }
        }

        return 1LL;
      }
    }
  }

  return 0LL;
}

unint64_t sub_100020C9C()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___FARateLimiter_persistence);
  _StringGuts.grow(_:)(37LL);
  swift_bridgeObjectRelease(0xE000000000000000LL);
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR___FARateLimiter_identifier);
  uint64_t v3 = *(void **)(v0 + OBJC_IVAR___FARateLimiter_identifier + 8);
  swift_bridgeObjectRetain(v3);
  v4._uint64_t countAndFlagsBits = v2;
  v4._object = v3;
  String.append(_:)(v4);
  swift_bridgeObjectRelease(v3);
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(0x8000000100037A60LL);
  id v6 = [v1 dataForKey:v5];

  if (!v6) {
    return sub_10001B1C0((uint64_t)&_swiftEmptyArrayStorage);
  }
  uint64_t v7 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v6);
  unint64_t v9 = v8;

  sub_100022AAC();
  dispatch thunk of JSONDecoder.decode<A>(_:from:)(&type metadata for Record);
  sub_10001F398(v7, v9);
  return 0xD000000000000023LL;
}

uint64_t sub_100020E04(unint64_t a1)
{
  uint64_t v3 = type metadata accessor for Logger(0LL);
  __chkstk_darwin(v3);
  unint64_t v16 = a1;
  unint64_t v4 = sub_1000229B4();
  uint64_t v5 = dispatch thunk of JSONEncoder.encode<A>(_:)(&v16, &type metadata for Record, v4);
  unint64_t v7 = v6;
  unint64_t v8 = *(void **)(v1 + OBJC_IVAR___FARateLimiter_persistence);
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  unint64_t v16 = 0LL;
  unint64_t v17 = 0xE000000000000000LL;
  _StringGuts.grow(_:)(37LL);
  swift_bridgeObjectRelease(v17);
  unint64_t v16 = 0xD000000000000023LL;
  unint64_t v17 = 0x8000000100037A60LL;
  uint64_t v10 = *(void *)(v1 + OBJC_IVAR___FARateLimiter_identifier);
  uint64_t v11 = *(void **)(v1 + OBJC_IVAR___FARateLimiter_identifier + 8);
  swift_bridgeObjectRetain(v11);
  v12._uint64_t countAndFlagsBits = v10;
  v12._object = v11;
  String.append(_:)(v12);
  swift_bridgeObjectRelease(v11);
  unint64_t v13 = v17;
  NSString v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v13);
  [v8 setValue:isa forKey:v14];

  return sub_10001F398(v5, v7);
}

id XPCEventObserver.__allocating_init()()
{
  return [objc_allocWithZone(v0) init];
}

void RateLimiter.init()()
{
}

id RateLimiter.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RateLimiter();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100021210()
{
  return 1LL;
}

uint64_t sub_100021224@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_100022C3C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_10002124C()
{
  return 0LL;
}

void sub_100021258(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_100021264(uint64_t a1)
{
  unint64_t v2 = sub_100022EC4();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10002128C(uint64_t a1)
{
  unint64_t v2 = sub_100022EC4();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000212B4(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_10001B6BC(&qword_100052240);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  unint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = a1[3];
  uint64_t v9 = a1[4];
  sub_10001E920(a1, v8);
  unint64_t v10 = sub_100022EC4();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for Record.CodingKeys,  &type metadata for Record.CodingKeys,  v10,  v8,  v9);
  uint64_t v13 = a2;
  sub_10001B6BC(&qword_100052250);
  sub_100022F08();
  KeyedEncodingContainer.encode<A>(_:forKey:)(&v13);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_1000213B8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v18 = a2;
  uint64_t v20 = type metadata accessor for Date(0LL);
  uint64_t v17 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  BOOL v19 = (uint64_t *)((char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v5 = sub_10001B6BC(&qword_1000521A8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for ClientRecord(0LL);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = a1[3];
  uint64_t v13 = a1[4];
  sub_10001E920(a1, v12);
  unint64_t v14 = sub_100022970();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for ClientRecord.CodingKeys,  &type metadata for ClientRecord.CodingKeys,  v14,  v12,  v13);
  if (!v2)
  {
    sub_10001BA20( &qword_1000521B8,  (uint64_t (*)(uint64_t))&type metadata accessor for Date,  (uint64_t)&protocol conformance descriptor for Date);
    KeyedDecodingContainer.decode<A>(_:forKey:)(v19, v20);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    (*(void (**)(char *, void *, uint64_t))(v17 + 32))(v11, v19, v20);
    sub_10001BCD0((uint64_t)v11, v18);
  }

  return sub_10001F53C(a1);
}

void *sub_10002157C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_100022CD8(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_1000215A4(void *a1)
{
  return sub_1000212B4(a1, *v1);
}

Swift::Int sub_1000215BC()
{
  return Hasher._finalize()();
}

void sub_1000215FC()
{
}

Swift::Int sub_100021620(uint64_t a1)
{
  return Hasher._finalize()();
}

uint64_t sub_100021660@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_100022E04(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_100021688(uint64_t a1)
{
  unint64_t v2 = sub_100022970();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000216B0(uint64_t a1)
{
  unint64_t v2 = sub_100022970();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000216D8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000213B8(a1, a2);
}

uint64_t sub_1000216EC(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10001B6BC(&qword_1000521C0);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = a1[3];
  uint64_t v9 = a1[4];
  sub_10001E920(a1, v8);
  unint64_t v10 = sub_100022970();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for ClientRecord.CodingKeys,  &type metadata for ClientRecord.CodingKeys,  v10,  v8,  v9);
  type metadata accessor for Date(0LL);
  sub_10001BA20( &qword_1000521C8,  (uint64_t (*)(uint64_t))&type metadata accessor for Date,  (uint64_t)&protocol conformance descriptor for Date);
  KeyedEncodingContainer.encode<A>(_:forKey:)(v2);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_1000217FC(uint64_t result, _BYTE **a2)
{
  uint64_t v2 = *a2;
  _BYTE *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_10002180C( uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_100021840(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100021860(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  unint64_t v8 = v7;
  uint64_t v9 = sub_1000218D0(v6, v7, a3);
  uint64_t v10 = *a1;
  uint64_t v11 = *a1 + 8;
  uint64_t v13 = v9;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v10, v11);
  uint64_t result = swift_bridgeObjectRelease(v8);
  *a1 = v11;
  return result;
}

uint64_t sub_1000218D0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000219A0(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10001F460((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }

  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_10001F460((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_10001F53C(v12);
  return v7;
}

uint64_t sub_1000219A0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v12 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v12)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v12] || (char *)__src + v12 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter(0LL, HIBYTE(a6) & 0xF, __dst, a3);
            uint64_t result = 0LL;
            *a1 = (uint64_t)__dst;
            return result;
          }

          goto LABEL_17;
        }
      }
    }

LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  else {
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL);
  }
}

uint64_t sub_100021B58(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100021BEC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100021DC4(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100021DC4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100021BEC(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000LL) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000LL) != 0) {
    uint64_t v4 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v4 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v4)
  {
    while (1)
    {
      uint64_t v5 = sub_100021D60(v4, 0LL);
      if (v4 < 0) {
        break;
      }
      uint64_t v6 = v5;
      uint64_t v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0) {
        goto LABEL_14;
      }
      if (v7 == v4) {
        return v6;
      }
      LOBYTE(v10) = 2;
      _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "invalid Collection: less than 'count' elements in collection",  60LL,  2LL,  "Swift/ContiguousArrayBuffer.swift",  33LL,  v10,  1122LL,  0);
      __break(1u);
LABEL_10:
      uint64_t v4 = String.UTF8View._foreignCount()();
      if (!v4) {
        return &_swiftEmptyArrayStorage;
      }
    }

    LOBYTE(v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableBufferPointer with negative count",  46LL,  2LL,  "Swift/UnsafeBufferPointer.swift",  31LL,  v10,  71LL,  0);
    __break(1u);
LABEL_14:
    LOBYTE(v10) = 2;
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Insufficient space allocated to copy string contents",  52LL,  2LL,  "Swift/StringUTF8View.swift",  26LL,  v10,  430LL,  0);
    __break(1u);
  }

  else
  {
    return &_swiftEmptyArrayStorage;
  }

  return result;
}

void *sub_100021D60(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  uint64_t v4 = sub_10001B6BC(&qword_1000521E8);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100021DC4(char a1, int64_t a2, char a3, char *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_30;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_10001B6BC(&qword_1000521E8);
    uint64_t v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }

  else
  {
    uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
  }

  uint64_t v13 = v11 + 32;
  int v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8]) {
      memmove(v13, v14, v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_28;
  }

  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }

LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

_BYTE **sub_100021F10(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  _BYTE *v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

unint64_t sub_100021F20(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_100021F84(a1, a2, v5);
}

unint64_t sub_100021F84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    uint64_t v11 = v10[1];
    BOOL v12 = *v10 == a1 && v11 == a2;
    if (!v12 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v10, v11, a1, a2, 0LL) & 1) == 0)
    {
      uint64_t v13 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v13;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) == 0) {
          break;
        }
        int v14 = (void *)(v9 + 16 * v6);
        uint64_t v15 = v14[1];
        BOOL v16 = *v14 == a1 && v15 == a2;
      }

      while (!v16 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15, a1, a2, 0LL) & 1) == 0);
    }
  }

  return v6;
}

uint64_t sub_100022064(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1LL << a1;
  int64_t v8 = (void *)(a5[6] + 16 * a1);
  void *v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  uint64_t v10 = type metadata accessor for ClientRecord(0LL);
  uint64_t result = sub_10001BCD0(a4, v9 + *(void *)(*(void *)(v10 - 8) + 72LL) * a1);
  uint64_t v12 = a5[2];
  BOOL v13 = __OFADD__(v12, 1LL);
  uint64_t v14 = v12 + 1;
  if (v13) {
    __break(1u);
  }
  else {
    a5[2] = v14;
  }
  return result;
}

Swift::Int sub_1000220EC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_10001B6BC((uint64_t *)&unk_100052200);
    uint64_t v3 = static _SetStorage.allocate(capacity:)(v1);
    uint64_t v4 = 0LL;
    uint64_t v5 = v3 + 56;
    uint64_t v27 = a1 + 32;
    while (1)
    {
      unint64_t v6 = (uint64_t *)(v27 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      Hasher.init(_seed:)(v28, *(void *)(v3 + 40));
      swift_bridgeObjectRetain(v7);
      String.hash(into:)(v28, v8, v7);
      Swift::Int result = Hasher._finalize()();
      uint64_t v10 = -1LL << *(_BYTE *)(v3 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1LL << v11;
      if (((1LL << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        BOOL v16 = (void *)(v15 + 16 * v11);
        uint64_t v17 = v16[1];
        BOOL v18 = *v16 == v8 && v17 == v7;
        if (v18 || (Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)(*v16, v17, v8, v7, 0LL), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease(v7);
          goto LABEL_4;
        }

        uint64_t v19 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v19;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1LL << v11;
          if ((v13 & (1LL << v11)) == 0) {
            break;
          }
          uint64_t v20 = (void *)(v15 + 16 * v11);
          uint64_t v21 = v20[1];
          if (*v20 != v8 || v21 != v7)
          {
            Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)(*v20, v21, v8, v7, 0LL);
            if ((result & 1) == 0) {
              continue;
            }
          }

          goto LABEL_3;
        }
      }

      *(void *)(v5 + 8 * v12) = v14 | v13;
      uint64_t v23 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      *uint64_t v23 = v8;
      v23[1] = v7;
      uint64_t v24 = *(void *)(v3 + 16);
      BOOL v25 = __OFADD__(v24, 1LL);
      uint64_t v26 = v24 + 1;
      if (v25)
      {
        __break(1u);
        return result;
      }

      *(void *)(v3 + 16) = v26;
LABEL_4:
      if (++v4 == v1) {
        return v3;
      }
    }
  }

  return (Swift::Int)&_swiftEmptySetSingleton;
}

id sub_10002228C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v36 = a4;
  uint64_t v37 = a5;
  uint64_t v34 = a2;
  uint64_t v35 = a3;
  uint64_t v33 = a1;
  uint64_t v6 = type metadata accessor for OS_dispatch_queue.Attributes(0LL);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  type metadata accessor for DispatchQoS(0LL);
  __chkstk_darwin();
  uint64_t v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin();
  uint64_t v14 = (char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = OBJC_IVAR___FARateLimiter_encoder;
  uint64_t v16 = type metadata accessor for JSONEncoder(0LL);
  swift_allocObject(v16, *(unsigned int *)(v16 + 48), *(unsigned __int16 *)(v16 + 52));
  uint64_t v17 = v5;
  *(void *)&v5[v15] = JSONEncoder.init()();
  uint64_t v18 = OBJC_IVAR___FARateLimiter_decoder;
  uint64_t v19 = type metadata accessor for JSONDecoder(0LL);
  swift_allocObject(v19, *(unsigned int *)(v19 + 48), *(unsigned __int16 *)(v19 + 52));
  *(void *)&v17[v18] = JSONDecoder.init()();
  uint64_t v20 = OBJC_IVAR___FARateLimiter_queue;
  sub_100022AF0(0LL, (unint64_t *)&qword_100051CD0, &OBJC_CLASS___OS_dispatch_queue_ptr);
  uint64_t v21 = (*(uint64_t (**)(char *, void, uint64_t))(v12 + 104))( v14,  enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:),  v11);
  static DispatchQoS.unspecified.getter(v21);
  unint64_t v39 = &_swiftEmptyArrayStorage;
  uint64_t v22 = sub_10001BA20( (unint64_t *)&unk_100052210,  (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes,  (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  uint64_t v23 = sub_10001B6BC((uint64_t *)&unk_100051CE0);
  unint64_t v24 = sub_10001B6FC();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v39, v23, v24, v6, v22);
  *(void *)&v17[v20] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)( 0xD000000000000022LL,  0x8000000100037380LL,  v10,  v8,  v14,  0LL);
  uint64_t v25 = v33;
  uint64_t v26 = v34;
  *(void *)&v17[OBJC_IVAR___FARateLimiter_persistence] = v33;
  uint64_t v27 = &v17[OBJC_IVAR___FARateLimiter_identifier];
  uint64_t v28 = v35;
  *(void *)uint64_t v27 = v26;
  *((void *)v27 + 1) = v28;
  unint64_t v29 = &v17[OBJC_IVAR___FARateLimiter_getDate];
  uint64_t v30 = v37;
  *(void *)unint64_t v29 = v36;
  *((void *)v29 + 1) = v30;
  swift_unknownObjectRetain(v25);
  swift_retain(v30);

  unint64_t v31 = (objc_class *)type metadata accessor for RateLimiter();
  v38.receiver = v17;
  v38.super_class = v31;
  return objc_msgSendSuper2(&v38, "init");
}

uint64_t sub_100022514(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100022524(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

BOOL sub_10002252C@<W0>(_BYTE *a1@<X8>)
{
  return sub_1000229F8(a1);
}

uint64_t sub_100022540()
{
  swift_bridgeObjectRelease(*(void *)(v0 + 32));
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_10002256C()
{
  return sub_10001FEBC(*(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_100022594()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_1000225A4()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t type metadata accessor for ClientRecord(uint64_t a1)
{
  uint64_t result = qword_100052170;
  if (!qword_100052170) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ClientRecord);
  }
  return result;
}

uint64_t sub_100022600(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10001B6BC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_10002263C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ClientRecord(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_100022678(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100022690(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ClientRecord(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for RateLimiter()
{
  return objc_opt_self(&OBJC_CLASS___FARateLimiter);
}

uint64_t sub_1000226F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Date(0LL);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t sub_100022730(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Date(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
}

uint64_t sub_100022764(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Date(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a1, a2, v4);
  return a1;
}

uint64_t sub_1000227A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Date(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24LL))(a1, a2, v4);
  return a1;
}

uint64_t sub_1000227EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Date(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a1, a2, v4);
  return a1;
}

uint64_t sub_100022830(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Date(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a1, a2, v4);
  return a1;
}

uint64_t sub_100022874(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100022880);
}

uint64_t sub_100022880(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Date(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48LL))(a1, a2, v4);
}

uint64_t sub_1000228BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000228C8);
}

uint64_t sub_1000228C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Date(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56LL))(a1, a2, a2, v4);
}

uint64_t sub_100022908(uint64_t a1)
{
  uint64_t result = type metadata accessor for Date(319LL);
  if (v3 <= 0x3F)
  {
    uint64_t v4 = *(void *)(result - 8) + 64LL;
    swift_initStructMetadata(a1, 256LL, 1LL, &v4, a1 + 16);
    return 0LL;
  }

  return result;
}

unint64_t sub_100022970()
{
  unint64_t result = qword_1000521B0;
  if (!qword_1000521B0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100035AC4, &type metadata for ClientRecord.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000521B0);
  }

  return result;
}

unint64_t sub_1000229B4()
{
  unint64_t result = qword_1000521D0;
  if (!qword_1000521D0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100035A9C, &type metadata for Record);
    atomic_store(result, (unint64_t *)&qword_1000521D0);
  }

  return result;
}

BOOL sub_1000229F8@<W0>(_BYTE *a1@<X8>)
{
  BOOL result = RateLimiter.unsafeIsAllowed(clientName:)(*(Swift::String *)(v1 + 24));
  *a1 = result;
  return result;
}

uint64_t sub_100022A3C()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_100022A60()
{
}

uint64_t *sub_100022A68(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *(void *)(a1 - 8);
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    uint64_t v4 = swift_slowAlloc(*(void *)(v3 + 64), *(_DWORD *)(v3 + 80));
    *a2 = v4;
    return (uint64_t *)v4;
  }

  return a2;
}

unint64_t sub_100022AAC()
{
  unint64_t result = qword_1000521F0;
  if (!qword_1000521F0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100035A74, &type metadata for Record);
    atomic_store(result, (unint64_t *)&qword_1000521F0);
  }

  return result;
}

uint64_t sub_100022AF0(uint64_t a1, unint64_t *a2, void *a3)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t v5 = objc_opt_self(*a3);
    uint64_t result = swift_getObjCClassMetadata(v5);
    atomic_store(result, a2);
  }

  return result;
}

ValueMetadata *type metadata accessor for Record()
{
  return &type metadata for Record;
}

uint64_t sub_100022B48()
{
  return 0LL;
}

ValueMetadata *type metadata accessor for ClientRecord.CodingKeys()
{
  return &type metadata for ClientRecord.CodingKeys;
}

unint64_t sub_100022B68()
{
  unint64_t result = qword_100052228;
  if (!qword_100052228)
  {
    unint64_t result = swift_getWitnessTable(&unk_100035A4C, &type metadata for ClientRecord.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100052228);
  }

  return result;
}

unint64_t sub_100022BB0()
{
  unint64_t result = qword_100052230;
  if (!qword_100052230)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000359BC, &type metadata for ClientRecord.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100052230);
  }

  return result;
}

unint64_t sub_100022BF8()
{
  unint64_t result = qword_100052238;
  if (!qword_100052238)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000359E4, &type metadata for ClientRecord.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100052238);
  }

  return result;
}

uint64_t sub_100022C3C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x73746E65696C63LL && a2 == 0xE700000000000000LL)
  {
    swift_bridgeObjectRelease(a2);
    char v5 = 0;
  }

  else
  {
    char v4 = _stringCompareWithSmolCheck(_:_:expecting:)(0x73746E65696C63LL, 0xE700000000000000LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    char v5 = v4 ^ 1;
  }

  return v5 & 1;
}

uint64_t sub_100022CC0()
{
  return 0x73746E65696C63LL;
}

void *sub_100022CD8(void *a1)
{
  uint64_t v3 = sub_10001B6BC(&qword_100052268);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[4];
  uint64_t v9 = sub_10001E920(a1, v7);
  unint64_t v10 = sub_100022EC4();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for Record.CodingKeys,  &type metadata for Record.CodingKeys,  v10,  v7,  v8);
  if (v1)
  {
    sub_10001F53C(a1);
  }

  else
  {
    uint64_t v11 = sub_10001B6BC(&qword_100052250);
    sub_100022F8C();
    KeyedDecodingContainer.decode<A>(_:forKey:)(&v14, v11);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    uint64_t v9 = v14;
    sub_10001F53C(a1);
  }

  return v9;
}

uint64_t sub_100022E04(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6563655274736F6DLL && a2 == 0xEE006C6C6143746ELL)
  {
    swift_bridgeObjectRelease(a2);
    char v5 = 0;
  }

  else
  {
    char v4 = _stringCompareWithSmolCheck(_:_:expecting:)(0x6563655274736F6DLL, 0xEE006C6C6143746ELL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    char v5 = v4 ^ 1;
  }

  return v5 & 1;
}

uint64_t sub_100022EA0()
{
  return 0x6563655274736F6DLL;
}

unint64_t sub_100022EC4()
{
  unint64_t result = qword_100052248;
  if (!qword_100052248)
  {
    unint64_t result = swift_getWitnessTable(&unk_100035BCC, &type metadata for Record.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100052248);
  }

  return result;
}

unint64_t sub_100022F08()
{
  unint64_t result = qword_100052258;
  if (!qword_100052258)
  {
    uint64_t v1 = sub_10001B748(&qword_100052250);
    sub_10001BA20(&qword_100052260, type metadata accessor for ClientRecord, (uint64_t)&unk_100035958);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> [A : B], v1);
    atomic_store(result, (unint64_t *)&qword_100052258);
  }

  return result;
}

unint64_t sub_100022F8C()
{
  unint64_t result = qword_100052270;
  if (!qword_100052270)
  {
    uint64_t v1 = sub_10001B748(&qword_100052250);
    sub_10001BA20(&qword_100052278, type metadata accessor for ClientRecord, (uint64_t)&unk_100035980);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> [A : B], v1);
    atomic_store(result, (unint64_t *)&qword_100052270);
  }

  return result;
}

uint64_t _s13familycircled12ClientRecordV10CodingKeysOwet_0(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  else {
    int v2 = 2;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

uint64_t _s13familycircled12ClientRecordV10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
{
  else {
    int v3 = 2;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2) {
    return ((uint64_t (*)(void))((char *)sub_1000230A0 + 4 * byte_100035918[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_1000230C0 + 4 * byte_10003591D[v4]))();
  }
}

_BYTE *sub_1000230A0(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

_BYTE *sub_1000230C0(_BYTE *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_1000230C8(_DWORD *result, int a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_1000230D0(_WORD *result, __int16 a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_1000230D8(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_1000230E0(_DWORD *result)
{
  *unint64_t result = 0;
  return result;
}

ValueMetadata *type metadata accessor for Record.CodingKeys()
{
  return &type metadata for Record.CodingKeys;
}

unint64_t sub_100023100()
{
  unint64_t result = qword_100052280;
  if (!qword_100052280)
  {
    unint64_t result = swift_getWitnessTable(&unk_100035BA4, &type metadata for Record.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100052280);
  }

  return result;
}

unint64_t sub_100023148()
{
  unint64_t result = qword_100052288;
  if (!qword_100052288)
  {
    unint64_t result = swift_getWitnessTable(&unk_100035B14, &type metadata for Record.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100052288);
  }

  return result;
}

unint64_t sub_100023190()
{
  unint64_t result = qword_100052290;
  if (!qword_100052290)
  {
    unint64_t result = swift_getWitnessTable(&unk_100035B3C, &type metadata for Record.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100052290);
  }

  return result;
}

id sub_1000231F0()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for PDSRegistrarService()) init];
  static PDSRegistrarService.sharedInstance = (uint64_t)result;
  return result;
}

uint64_t *PDSRegistrarService.sharedInstance.unsafeMutableAddressor()
{
  if (qword_100051CC0 != -1) {
    swift_once(&qword_100051CC0, sub_1000231F0);
  }
  return &static PDSRegistrarService.sharedInstance;
}

id static PDSRegistrarService.sharedInstance.getter()
{
  if (qword_100051CC0 != -1) {
    swift_once(&qword_100051CC0, sub_1000231F0);
  }
  return (id)static PDSRegistrarService.sharedInstance;
}

id sub_1000232DC()
{
  uint64_t v1 = type metadata accessor for Logger(0LL);
  __chkstk_darwin(v1);
  uint64_t v2 = OBJC_IVAR___PDSRegistrarService_pdsRegistrar;
  *(void *)&v0[OBJC_IVAR___PDSRegistrarService_pdsRegistrar] = 0LL;
  id v3 = objc_allocWithZone(&OBJC_CLASS___PDSRegistrar);
  uint64_t v4 = v0;
  id v5 = sub_100023E64(0xD000000000000010LL, 0x8000000100037CF0LL);
  uint64_t v6 = *(void **)&v0[v2];
  *(void *)&v0[v2] = v5;

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for PDSRegistrarService();
  return objc_msgSendSuper2(&v8, "init");
}

uint64_t PDSRegistrarService.registerToPDS(_:)(char a1)
{
  uint64_t v58 = type metadata accessor for Logger(0LL);
  uint64_t v3 = *(void *)(v58 - 8);
  uint64_t v4 = __chkstk_darwin(v58);
  uint64_t v6 = (char *)&v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v9 = (char *)&v55 - v8;
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)&v55 - v11;
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v15 = (char *)&v55 - v14;
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v55 - v16;
  id v18 = [(id)objc_opt_self(FAServerBagFlag) registerDeviceWithPDS];
  unsigned int v19 = [v18 value];

  if (v19)
  {
    id v21 = objc_allocWithZone(&OBJC_CLASS___PDSRegistration);
    NSString v22 = String._bridgeToObjectiveC()();
    id v23 = [v21 initWithTopic:v22 pushEnvironment:a1];

    id v24 = sub_100023F2C();
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void **)(v1 + OBJC_IVAR___PDSRegistrarService_pdsRegistrar);
      if (v26)
      {
        id v61 = 0LL;
        id v27 = v26;
        unsigned int v28 = [v27 ensureRegistrationPresent:v23 forUser:v25 error:&v61];
        id v29 = v61;
        if (v28)
        {
          uint64_t v30 = static FamilyLogger.daemon.getter(v61);
          unint64_t v31 = (os_log_s *)Logger.logObject.getter(v30);
          os_log_type_t v32 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v31, v32))
          {
            uint64_t v33 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
            id v57 = (void *)swift_slowAlloc(32LL, -1LL);
            id v61 = v57;
            double v56 = v33;
            *(_DWORD *)uint64_t v33 = 136315138;
            uint64_t v55 = v33 + 4;
            LOBYTE(v59) = a1;
            uint64_t v34 = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int8,  &protocol witness table for Int8);
            unint64_t v36 = v35;
            uint64_t v59 = sub_1000218D0(v34, v35, (uint64_t *)&v61);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v59, &v60, v55, v33 + 12);
            swift_bridgeObjectRelease(v36);
            uint64_t v37 = v56;
            _os_log_impl( (void *)&_mh_execute_header,  v31,  v32,  "PDS Registration was successful. environment is: %s",  v56,  0xCu);
            objc_super v38 = v57;
            swift_arrayDestroy(v57, 1LL, (char *)&type metadata for Any + 8);
            swift_slowDealloc(v38, -1LL, -1LL);
            swift_slowDealloc(v37, -1LL, -1LL);
          }

          return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v17, v58);
        }

        else
        {
          id v52 = v61;
          uint64_t v53 = _convertNSErrorToError(_:)(v29);

          swift_willThrow();
          static FamilyLogger.daemon.getter(v54);
          swift_errorRetain(v53);
          sub_10001AE80(v53, 0xD000000000000022LL, 0x8000000100037D10LL);

          swift_errorRelease(v53);
          swift_errorRelease(v53);
          return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v58);
        }
      }

      else
      {
        uint64_t v48 = static FamilyLogger.daemon.getter(v24);
        uint64_t v49 = (os_log_s *)Logger.logObject.getter(v48);
        os_log_type_t v50 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v49, v50))
        {
          uint64_t v51 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
          *(_WORD *)uint64_t v51 = 0;
          _os_log_impl((void *)&_mh_execute_header, v49, v50, "PDSRegistrar is nil", v51, 2u);
          swift_slowDealloc(v51, -1LL, -1LL);
        }

        return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v15, v58);
      }
    }

    else
    {
      uint64_t v44 = static FamilyLogger.daemon.getter(0LL);
      unint64_t v45 = (os_log_s *)Logger.logObject.getter(v44);
      os_log_type_t v46 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v45, v46))
      {
        uint64_t v47 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)uint64_t v47 = 0;
        _os_log_impl((void *)&_mh_execute_header, v45, v46, "PDSUser is nil", v47, 2u);
        swift_slowDealloc(v47, -1LL, -1LL);
      }

      return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v12, v58);
    }
  }

  else
  {
    uint64_t v40 = static FamilyLogger.daemon.getter(v20);
    uint64_t v41 = (os_log_s *)Logger.logObject.getter(v40);
    os_log_type_t v42 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v43 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v41,  v42,  "Did not register to PDS since server flag is not enabled",  v43,  2u);
      swift_slowDealloc(v43, -1LL, -1LL);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v9, v58);
  }

Swift::Void __swiftcall PDSRegistrarService.removeRegistrationFromPDS()()
{
  uint64_t v1 = type metadata accessor for Logger(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v5 = &v45[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v6 = __chkstk_darwin(v3);
  uint64_t v8 = &v45[-v7];
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v11 = &v45[-v10];
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = &v45[-v13];
  __chkstk_darwin(v12);
  uint64_t v16 = &v45[-v15];
  id v17 = [(id)objc_opt_self(FAServerBagFlag) registerDeviceWithPDS];
  unsigned int v18 = [v17 value];

  if (v18)
  {
    id v20 = sub_100023F2C();
    if (v20)
    {
      id v21 = v20;
      NSString v22 = *(void **)(v0 + OBJC_IVAR___PDSRegistrarService_pdsRegistrar);
      if (v22)
      {
        id v46 = 0LL;
        id v23 = v22;
        unsigned int v24 = [v23 removeAllRegistrationsFromUser:v21 error:&v46];
        id v25 = v46;
        if (v24)
        {
          uint64_t v26 = static FamilyLogger.daemon.getter(v46);
          id v27 = (os_log_s *)Logger.logObject.getter(v26);
          os_log_type_t v28 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v27, v28))
          {
            id v29 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
            *(_WORD *)id v29 = 0;
            _os_log_impl((void *)&_mh_execute_header, v27, v28, "Removing PDS registration was successful", v29, 2u);
            swift_slowDealloc(v29, -1LL, -1LL);
          }
        }

        else
        {
          id v42 = v46;
          uint64_t v43 = _convertNSErrorToError(_:)(v25);

          swift_willThrow();
          static FamilyLogger.daemon.getter(v44);
          swift_errorRetain(v43);
          sub_10001AE80(v43, 0xD000000000000020LL, 0x8000000100037D40LL);
          swift_errorRelease(v43);
          swift_errorRelease(v43);
          uint64_t v16 = v5;
        }
      }

      else
      {
        uint64_t v38 = static FamilyLogger.daemon.getter(v20);
        unint64_t v39 = (os_log_s *)Logger.logObject.getter(v38);
        os_log_type_t v40 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v39, v40))
        {
          uint64_t v41 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
          *(_WORD *)uint64_t v41 = 0;
          _os_log_impl((void *)&_mh_execute_header, v39, v40, "PDSRegistrar is nil", v41, 2u);
          swift_slowDealloc(v41, -1LL, -1LL);
        }

        uint64_t v16 = v14;
      }
    }

    else
    {
      uint64_t v34 = static FamilyLogger.daemon.getter(0LL);
      unint64_t v35 = (os_log_s *)Logger.logObject.getter(v34);
      os_log_type_t v36 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v35, v36))
      {
        uint64_t v37 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)uint64_t v37 = 0;
        _os_log_impl((void *)&_mh_execute_header, v35, v36, "PDSUser is nil in removing registration", v37, 2u);
        swift_slowDealloc(v37, -1LL, -1LL);
      }

      uint64_t v16 = v11;
    }
  }

  else
  {
    uint64_t v30 = static FamilyLogger.daemon.getter(v19);
    unint64_t v31 = (os_log_s *)Logger.logObject.getter(v30);
    os_log_type_t v32 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v33 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  v32,  "Did not de-register PDS since server flag is not enabled",  v33,  2u);
      swift_slowDealloc(v33, -1LL, -1LL);
    }

    uint64_t v16 = v8;
  }

  (*(void (**)(_BYTE *, uint64_t))(v2 + 8))(v16, v1);
}

id PDSRegistrarService.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PDSRegistrarService();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id sub_100023E64(uint64_t a1, uint64_t a2)
{
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  id v10 = 0LL;
  id v5 = [v2 initWithClientID:v4 error:&v10];

  id v6 = v10;
  if (v5)
  {
    id v7 = v10;
  }

  else
  {
    id v8 = v10;
    _convertNSErrorToError(_:)(v6);

    swift_willThrow();
  }

  return v5;
}

id sub_100023F2C()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v4 = [objc_allocWithZone(ACAccountStore) init];
  id v5 = objc_msgSend(v4, "aida_accountForPrimaryiCloudAccount");

  if (v5 && (id v6 = objc_msgSend(v5, "aida_dsid")) != 0)
  {
    id v7 = v6;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
    uint64_t v9 = v8;

    NSString v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v9);
    id v11 = [(id)objc_opt_self(PDSUser) userWithDSID:v10];
  }

  else
  {
    uint64_t v12 = static FamilyLogger.daemon.getter();
    uint64_t v13 = (os_log_s *)Logger.logObject.getter(v12);
    os_log_type_t v14 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Account is nil, unable to get dsid", v15, 2u);
      swift_slowDealloc(v15, -1LL, -1LL);
      uint64_t v16 = (os_log_s *)v5;
    }

    else
    {
      uint64_t v16 = v13;
      uint64_t v13 = (os_log_s *)v5;
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    return 0LL;
  }

  return v11;
}

uint64_t type metadata accessor for PDSRegistrarService()
{
  return objc_opt_self(&OBJC_CLASS___PDSRegistrarService);
}

uint64_t *FAFamilyChecklistRankingConfigCache.shared.unsafeMutableAddressor()
{
  if (qword_100051CC8 != -1) {
    swift_once(&qword_100051CC8, sub_100024220);
  }
  return &static FAFamilyChecklistRankingConfigCache.shared;
}

BOOL sub_100024150(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100024164()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)(v3, 0LL);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_1000241A8()
{
}

Swift::Int sub_1000241D0(uint64_t a1)
{
  Swift::UInt v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_100024220()
{
  uint64_t v0 = type metadata accessor for FAFamilyChecklistRankingConfigCache();
  uint64_t v1 = swift_allocObject(v0, 112LL, 15LL);
  uint64_t result = swift_defaultActor_initialize();
  static FAFamilyChecklistRankingConfigCache.shared = v1;
  return result;
}

uint64_t static FAFamilyChecklistRankingConfigCache.shared.getter()
{
  if (qword_100051CC8 != -1) {
    swift_once(&qword_100051CC8, sub_100024220);
  }
  return swift_retain(static FAFamilyChecklistRankingConfigCache.shared);
}

uint64_t sub_100024298()
{
  uint64_t v0 = type metadata accessor for URL(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v4 = [(id)objc_opt_self(NSFileManager) defaultManager];
  id v10 = 0LL;
  id v5 = [v4 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:1 error:&v10];

  id v6 = v10;
  if (v5)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(v5);
    id v7 = v6;

    URL.appendingPathComponent(_:)(0xD000000000000033LL, 0x8000000100037E10LL);
    return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }

  else
  {
    id v9 = v10;
    _convertNSErrorToError(_:)(v6);

    return swift_willThrow();
  }

uint64_t FAFamilyChecklistRankingConfigCache.load()()
{
  v1[7] = v0;
  uint64_t v2 = type metadata accessor for Logger(0LL);
  v1[8] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  void v1[9] = v3;
  v1[10] = swift_task_alloc((*(void *)(v3 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for URL(0LL);
  v1[11] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v1[12] = v5;
  unint64_t v6 = (*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v1[13] = swift_task_alloc(v6);
  v1[14] = swift_task_alloc(v6);
  return swift_task_switch(sub_1000244A4, v0, 0LL);
}

uint64_t sub_1000244A4()
{
  id v1 = [(id)objc_opt_self(NSFileManager) defaultManager];
  uint64_t v2 = sub_100024298();
  uint64_t v3 = *(void *)(v0 + 112);
  uint64_t v4 = *(void *)(v0 + 88);
  uint64_t v5 = *(void *)(v0 + 96);
  URL.path.getter(v2);
  uint64_t v7 = v6;
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v8(v3, v4);
  NSString v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  LOBYTE(v4) = [v1 fileExistsAtPath:v9];

  if ((v4 & 1) != 0)
  {
    sub_100024298();
    uint64_t v10 = Data.init(contentsOf:options:)(*(void *)(v0 + 104), 0LL);
    unint64_t v12 = v11;
    v8(*(void *)(v0 + 104), *(void *)(v0 + 88));
  }

  else
  {
    uint64_t v10 = 0LL;
    unint64_t v12 = 0xF000000000000000LL;
  }

  uint64_t v13 = *(void *)(v0 + 104);
  uint64_t v14 = *(void *)(v0 + 80);
  swift_task_dealloc(*(void *)(v0 + 112));
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  return (*(uint64_t (**)(uint64_t, unint64_t))(v0 + 8))(v10, v12);
}

unint64_t sub_10002480C()
{
  unint64_t result = qword_1000522D8;
  if (!qword_1000522D8)
  {
    unint64_t result = swift_getWitnessTable(&unk_100035D6C, &type metadata for FamilyChecklistRankingConfigError);
    atomic_store(result, (unint64_t *)&qword_1000522D8);
  }

  return result;
}

uint64_t FAFamilyChecklistRankingConfigCache.save(with:)(uint64_t a1, uint64_t a2)
{
  v3[8] = a2;
  void v3[9] = v2;
  v3[7] = a1;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  v3[12] = swift_task_alloc((*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for URL(0LL);
  v3[13] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v3[14] = v7;
  v3[15] = swift_task_alloc((*(void *)(v7 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_1000248DC, v2, 0LL);
}

uint64_t sub_1000248DC()
{
  uint64_t v1 = *(void *)(v0 + 120);
  uint64_t v3 = *(void *)(v0 + 96);
  (*(void (**)(uint64_t, void))(*(void *)(v0 + 112) + 8LL))(v1, *(void *)(v0 + 104));
  swift_task_dealloc(v1);
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t FAFamilyChecklistRankingConfigCache.invalidate()()
{
  v1[3] = v0;
  uint64_t v2 = type metadata accessor for URL(0LL);
  v1[4] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  v1[5] = v3;
  v1[6] = swift_task_alloc((*(void *)(v3 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_100024BF8, v0, 0LL);
}

uint64_t sub_100024BF8()
{
  id v1 = [(id)objc_opt_self(NSFileManager) defaultManager];
  uint64_t v2 = sub_100024298();
  uint64_t v4 = *(void *)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v5 = *(void *)(v0 + 32);
  URL.path.getter(v2);
  uint64_t v7 = v6;
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  *(void *)(v0 + 16) = 0LL;
  unsigned int v9 = [v1 removeItemAtPath:v8 error:v0 + 16];

  id v10 = *(id *)(v0 + 16);
  if (!v9)
  {
    unint64_t v11 = v10;
    _convertNSErrorToError(_:)(v10);

    swift_willThrow();
  }

  swift_task_dealloc(*(void *)(v0 + 48));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t FAFamilyChecklistRankingConfigCache.deinit()
{
  return v0;
}

uint64_t FAFamilyChecklistRankingConfigCache.__deallocating_deinit()
{
  return swift_defaultActor_deallocate(v0);
}

uint64_t FAFamilyChecklistRankingConfigCache.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_100024DAC()
{
  id v1 = (void *)swift_task_alloc(dword_1000522D4);
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_100024DF4;
  return FAFamilyChecklistRankingConfigCache.load()();
}

uint64_t sub_100024DF4(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void *)(*v3 + 16);
  uint64_t v7 = *v3;
  uint64_t v8 = swift_task_dealloc(v6);
  if (!v2)
  {
    uint64_t v8 = a1;
    uint64_t v9 = a2;
  }

  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v8, v9);
}

uint64_t sub_100024E58(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc(dword_1000522E4);
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_10001D6FC;
  return FAFamilyChecklistRankingConfigCache.save(with:)(a1, a2);
}

uint64_t sub_100024EB8()
{
  id v1 = (void *)swift_task_alloc(dword_1000522EC);
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_10001D4E4;
  return FAFamilyChecklistRankingConfigCache.invalidate()();
}

uint64_t type metadata accessor for FAFamilyChecklistRankingConfigCache()
{
  return objc_opt_self(&OBJC_CLASS____TtC13familycircled35FAFamilyChecklistRankingConfigCache);
}

_BYTE *initializeBufferWithCopyOfBuffer for FamilyChecklistRankingConfigError(_BYTE *result, _BYTE *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FamilyChecklistRankingConfigError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }

  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }

LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for FamilyChecklistRankingConfigError( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFD) {
    return ((uint64_t (*)(void))((char *)&loc_100025008 + 4 * byte_100035C55[v4]))();
  }
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_10002503C + 4 * asc_100035C50[v4]))();
}

uint64_t sub_10002503C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100025044(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x10002504CLL);
  }
  return result;
}

uint64_t sub_100025058(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x100025060LL);
  }
  *(_BYTE *)unint64_t result = a2 + 2;
  return result;
}

uint64_t sub_100025064(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10002506C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100025078(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100025080(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for FamilyChecklistRankingConfigError()
{
  return &type metadata for FamilyChecklistRankingConfigError;
}

unint64_t sub_10002509C()
{
  unint64_t result = qword_1000523D0;
  if (!qword_1000523D0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100035D44, &type metadata for FamilyChecklistRankingConfigError);
    atomic_store(result, (unint64_t *)&qword_1000523D0);
  }

  return result;
}

id sub_1000250E0()
{
  id v1 = [v0 userInfo];
  uint64_t v2 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v3 = sub_10001B6BC((uint64_t *)&unk_1000523E0);
  v14[3] = v3;
  v14[0] = v2;
  sub_100025284((uint64_t)v14, v15);
  sub_10001F53C(v14);
  if (!v15[3])
  {
    sub_10001F420((uint64_t)v15);
    goto LABEL_5;
  }

  if (!swift_dynamicCast(v14, v15, (char *)&type metadata for Any + 8, v3, 6LL))
  {
LABEL_5:
    unint64_t v4 = sub_10001B08C((uint64_t)&_swiftEmptyArrayStorage);
    goto LABEL_6;
  }

  unint64_t v4 = v14[0];
LABEL_6:
  id v5 = [v0 domain];
  static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
  uint64_t v7 = v6;

  id v8 = [v0 code];
  id v9 = objc_allocWithZone(&OBJC_CLASS___NSError);
  NSString v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  id v12 = [v9 initWithDomain:v10 code:v8 userInfo:isa];

  return v12;
}

uint64_t sub_100025284@<X0>(uint64_t a1@<X0>, char **a2@<X8>)
{
  uint64_t v4 = type metadata accessor for Logger(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v63 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_10001F460(a1, (uint64_t)&v79);
  uint64_t v8 = sub_10001B6BC(&qword_1000523F0);
  if (swift_dynamicCast(&v77, &v79, (char *)&type metadata for Any + 8, v8, 6LL))
  {
    id v9 = a2;
    uint64_t v10 = v77;
    uint64_t v11 = *(void *)(v77 + 16);
    if (v11)
    {
      uint64_t v12 = v77 + 32;
      id v13 = v71;
      swift_bridgeObjectRetain(v10);
      uint64_t v14 = (char *)&_swiftEmptyArrayStorage;
      do
      {
        sub_10001F460(v12, (uint64_t)&v79);
        sub_100025284(&v75, &v79);
        sub_10001F53C(&v79);
        if (v76)
        {
          sub_10001BC38(&v75, &v77);
          sub_10001BC38(&v77, &v75);
          if ((swift_isUniquelyReferenced_nonNull_native(v14) & 1) == 0) {
            uint64_t v14 = sub_100025A6C(0LL, *((void *)v14 + 2) + 1LL, 1, v14);
          }
          unint64_t v16 = *((void *)v14 + 2);
          unint64_t v15 = *((void *)v14 + 3);
          if (v16 >= v15 >> 1) {
            uint64_t v14 = sub_100025A6C((char *)(v15 > 1), v16 + 1, 1, v14);
          }
          *((void *)v14 + 2) = v16 + 1;
          sub_10001BC38(&v75, &v14[32 * v16 + 32]);
        }

        else
        {
          sub_10001F420((uint64_t)&v75);
        }

        v12 += 32LL;
        --v11;
      }

      while (v11);

      uint64_t result = swift_bridgeObjectRelease_n(v10, 2LL);
    }

    else
    {
      uint64_t result = swift_bridgeObjectRelease(v77);
      uint64_t v14 = (char *)&_swiftEmptyArrayStorage;
    }

    v9[3] = (char *)v8;
    *id v9 = v14;
    return result;
  }

  sub_10001F460(a1, (uint64_t)&v79);
  uint64_t v17 = sub_10001B6BC((uint64_t *)&unk_1000523E0);
  if (!swift_dynamicCast(&v77, &v79, (char *)&type metadata for Any + 8, v17, 6LL))
  {
    sub_10001F460(a1, (uint64_t)&v79);
    uint64_t v50 = sub_10001B6BC(&qword_1000523F8);
    uint64_t v51 = swift_dynamicCast(&v77, &v79, (char *)&type metadata for Any + 8, v50, 6LL);
    if ((_DWORD)v51)
    {
      swift_unknownObjectRelease(v77);
      return sub_10001F460(a1, (uint64_t)a2);
    }

    else
    {
      static FamilyLogger.daemon.getter(v51);
      uint64_t v53 = sub_10001F460(a1, (uint64_t)&v79);
      uint64_t v54 = (os_log_s *)Logger.logObject.getter(v53);
      os_log_type_t v55 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v54, v55))
      {
        double v56 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v57 = swift_slowAlloc(32LL, -1LL);
        uint64_t v66 = a2;
        uint64_t v58 = v57;
        *(void *)&__int128 v75 = v57;
        *(_DWORD *)double v56 = 136315138;
        id v71 = v56 + 4;
        sub_10001F460((uint64_t)&v79, (uint64_t)&v77);
        uint64_t v59 = String.init<A>(describing:)(&v77, (char *)&type metadata for Any + 8);
        unint64_t v61 = v60;
        *(void *)&__int128 v77 = sub_1000218D0(v59, v60, (uint64_t *)&v75);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v77, (char *)&v77 + 8, v71, v56 + 12);
        swift_bridgeObjectRelease(v61);
        sub_10001F53C(&v79);
        _os_log_impl((void *)&_mh_execute_header, v54, v55, "Removing non secure value: %s", v56, 0xCu);
        swift_arrayDestroy(v58, 1LL, (char *)&type metadata for Any + 8);
        uint64_t v62 = v58;
        a2 = v66;
        swift_slowDealloc(v62, -1LL, -1LL);
        swift_slowDealloc(v56, -1LL, -1LL);
      }

      else
      {
        sub_10001F53C(&v79);
      }

      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      *(_OWORD *)a2 = 0u;
      *((_OWORD *)a2 + 1) = 0u;
    }

    return result;
  }

  uint64_t v65 = v17;
  uint64_t v66 = a2;
  int64_t v18 = 0LL;
  uint64_t v19 = v77;
  uint64_t v20 = *(void *)(v77 + 64);
  uint64_t v67 = v77 + 64;
  uint64_t v21 = 1LL << *(_BYTE *)(v77 + 32);
  uint64_t v22 = -1LL;
  if (v21 < 64) {
    uint64_t v22 = ~(-1LL << v21);
  }
  unint64_t v23 = v22 & v20;
  os_log_type_t v69 = v78;
  uint64_t v70 = &v81;
  int64_t v68 = (unint64_t)(v21 + 63) >> 6;
  int64_t v64 = v68 - 1;
  unsigned int v24 = (char *)&_swiftEmptyDictionarySingleton;
  if ((v22 & v20) == 0) {
    goto LABEL_20;
  }
LABEL_18:
  unint64_t v25 = __clz(__rbit64(v23));
  v23 &= v23 - 1;
  unint64_t v26 = v25 | (v18 << 6);
LABEL_19:
  uint64_t v27 = *(void *)(v19 + 56);
  os_log_type_t v28 = (void *)(*(void *)(v19 + 48) + 16 * v26);
  uint64_t v29 = v28[1];
  *(void *)&__int128 v77 = *v28;
  *((void *)&v77 + 1) = v29;
  sub_10001F460(v27 + 32 * v26, (uint64_t)v69);
  swift_bridgeObjectRetain(v29);
  while (1)
  {
    sub_100025B78((uint64_t)&v77, (uint64_t)&v79);
    uint64_t v33 = v80;
    if (!v80)
    {
      uint64_t result = swift_release(v19);
      id v52 = v66;
      v66[3] = (char *)v65;
      void *v52 = v24;
      return result;
    }

    uint64_t v34 = v79;
    sub_10001BC38(v70, &v77);
    sub_100025284(&v73, &v77);
    if (!v74)
    {
      sub_10001F53C(&v77);
      swift_bridgeObjectRelease(v33);
      sub_10001F420((uint64_t)&v73);
      if (v23) {
        goto LABEL_18;
      }
      goto LABEL_20;
    }

    sub_10001BC38(&v73, &v75);
    sub_10001F460((uint64_t)&v75, (uint64_t)&v73);
    uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v24);
    uint64_t v72 = v24;
    unint64_t v37 = sub_100021F20(v34, v33);
    uint64_t v38 = *((void *)v24 + 2);
    BOOL v39 = (v36 & 1) == 0;
    uint64_t v40 = v38 + v39;
    if (__OFADD__(v38, v39)) {
      break;
    }
    char v41 = v36;
    if (*((void *)v24 + 3) >= v40)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        sub_100026450();
      }
    }

    else
    {
      sub_100025F28(v40, isUniquelyReferenced_nonNull_native);
      unint64_t v42 = sub_100021F20(v34, v33);
      if ((v41 & 1) != (v43 & 1)) {
        goto LABEL_66;
      }
      unint64_t v37 = v42;
    }

    unsigned int v24 = v72;
    if ((v41 & 1) != 0)
    {
      uint64_t v44 = (void *)(*((void *)v72 + 7) + 32 * v37);
      sub_10001F53C(v44);
      sub_10001BC38(&v73, v44);
    }

    else
    {
      *(void *)&v72[8 * (v37 >> 6) + 64] |= 1LL << v37;
      unint64_t v45 = (uint64_t *)(*((void *)v24 + 6) + 16 * v37);
      *unint64_t v45 = v34;
      v45[1] = v33;
      sub_10001BC38(&v73, (_OWORD *)(*((void *)v24 + 7) + 32 * v37));
      uint64_t v46 = *((void *)v24 + 2);
      BOOL v47 = __OFADD__(v46, 1LL);
      uint64_t v48 = v46 + 1;
      if (v47) {
        goto LABEL_64;
      }
      *((void *)v24 + 2) = v48;
      swift_bridgeObjectRetain(v33);
    }

    swift_bridgeObjectRelease(v33);
    swift_bridgeObjectRelease(0x8000000000000000LL);
    sub_10001F53C(&v75);
    sub_10001F53C(&v77);
    if (v23) {
      goto LABEL_18;
    }
LABEL_20:
    int64_t v30 = v18 + 1;
    if (__OFADD__(v18, 1LL)) {
      goto LABEL_63;
    }
    if (v30 < v68)
    {
      unint64_t v31 = *(void *)(v67 + 8 * v30);
      if (v31) {
        goto LABEL_23;
      }
      int64_t v32 = v18 + 2;
      ++v18;
      if (v30 + 1 < v68)
      {
        unint64_t v31 = *(void *)(v67 + 8 * v32);
        if (v31) {
          goto LABEL_26;
        }
        int64_t v18 = v30 + 1;
        if (v30 + 2 < v68)
        {
          unint64_t v31 = *(void *)(v67 + 8 * (v30 + 2));
          if (v31)
          {
            v30 += 2LL;
            goto LABEL_23;
          }

          int64_t v32 = v30 + 3;
          int64_t v18 = v30 + 2;
          if (v30 + 3 < v68)
          {
            unint64_t v31 = *(void *)(v67 + 8 * v32);
            if (!v31)
            {
              while (1)
              {
                int64_t v30 = v32 + 1;
                if (__OFADD__(v32, 1LL)) {
                  goto LABEL_65;
                }
                if (v30 >= v68)
                {
                  int64_t v18 = v64;
                  goto LABEL_37;
                }

                unint64_t v31 = *(void *)(v67 + 8 * v30);
                ++v32;
                if (v31) {
                  goto LABEL_23;
                }
              }
            }

LABEL_26:
            int64_t v30 = v32;
LABEL_23:
            unint64_t v23 = (v31 - 1) & v31;
            unint64_t v26 = __clz(__rbit64(v31)) + (v30 << 6);
            int64_t v18 = v30;
            goto LABEL_19;
          }
        }
      }
    }

LABEL_37:
    unint64_t v23 = 0LL;
    memset(v78, 0, sizeof(v78));
    __int128 v77 = 0u;
  }

  __break(1u);
LABEL_63:
  __break(1u);
LABEL_64:
  __break(1u);
LABEL_65:
  __break(1u);
LABEL_66:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

char *sub_100025A6C(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }

  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if (v7 + 0x4000000000000000LL >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      uint64_t v10 = sub_10001B6BC(&qword_100052408);
      uint64_t v11 = (char *)swift_allocObject(v10, 32 * v9 + 32, 7LL);
      int64_t v12 = j__malloc_size(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 1;
      }
      *((void *)v11 + 2) = v8;
      *((void *)v11 + 3) = 2 * (v13 >> 5);
      uint64_t v14 = v11 + 32;
      if ((v5 & 1) != 0) {
        goto LABEL_15;
      }
    }

    else
    {
      uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v14 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[32 * v8 + 32]) {
          memmove(v14, a4 + 32, 32 * v8);
        }
        *((void *)a4 + 2) = 0LL;
        goto LABEL_24;
      }
    }

    sub_100026634(0LL, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }

  __break(1u);
  return result;
}

uint64_t sub_100025B78(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10001B6BC(&qword_100052400);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

Swift::Int sub_100025BC0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for ClientRecord(0LL);
  uint64_t v43 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = *v3;
  if (*(void *)(*v3 + 24) > a1) {
    a1 = *(void *)(*v3 + 24);
  }
  sub_10001B6BC(&qword_100051E10);
  int v44 = a2;
  uint64_t v10 = static _DictionaryStorage.resize(original:capacity:move:)(v9, a1, a2);
  uint64_t v11 = v10;
  if (!*(void *)(v9 + 16)) {
    goto LABEL_43;
  }
  uint64_t v12 = 1LL << *(_BYTE *)(v9 + 32);
  uint64_t v13 = *(void *)(v9 + 64);
  unint64_t v42 = (void *)(v9 + 64);
  if (v12 < 64) {
    uint64_t v14 = ~(-1LL << v12);
  }
  else {
    uint64_t v14 = -1LL;
  }
  unint64_t v15 = v14 & v13;
  uint64_t v40 = v3;
  int64_t v41 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v16 = v10 + 64;
  Swift::Int result = swift_retain(v9);
  int64_t v18 = 0LL;
  while (1)
  {
    if (v15)
    {
      unint64_t v21 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v22 = v21 | (v18 << 6);
      goto LABEL_24;
    }

    int64_t v23 = v18 + 1;
    if (__OFADD__(v18, 1LL))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }

    if (v23 >= v41) {
      break;
    }
    unsigned int v24 = v42;
    unint64_t v25 = v42[v23];
    ++v18;
    if (!v25)
    {
      int64_t v18 = v23 + 1;
      if (v23 + 1 >= v41) {
        goto LABEL_36;
      }
      unint64_t v25 = v42[v18];
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v41)
        {
LABEL_36:
          swift_release(v9);
          uint64_t v3 = v40;
          if ((v44 & 1) == 0) {
            goto LABEL_43;
          }
          goto LABEL_39;
        }

        unint64_t v25 = v42[v26];
        if (!v25)
        {
          while (1)
          {
            int64_t v18 = v26 + 1;
            if (__OFADD__(v26, 1LL)) {
              goto LABEL_45;
            }
            if (v18 >= v41) {
              goto LABEL_36;
            }
            unint64_t v25 = v42[v18];
            ++v26;
            if (v25) {
              goto LABEL_23;
            }
          }
        }

        int64_t v18 = v26;
      }
    }

LABEL_23:
    unint64_t v15 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v18 << 6);
LABEL_24:
    uint64_t v27 = (uint64_t *)(*(void *)(v9 + 48) + 16 * v22);
    uint64_t v29 = *v27;
    uint64_t v28 = v27[1];
    uint64_t v30 = *(void *)(v43 + 72);
    uint64_t v31 = *(void *)(v9 + 56) + v30 * v22;
    if ((v44 & 1) != 0)
    {
      sub_10001BCD0(v31, (uint64_t)v8);
    }

    else
    {
      sub_100022690(v31, (uint64_t)v8);
      swift_bridgeObjectRetain(v28);
    }

    Hasher.init(_seed:)(v45, *(void *)(v11 + 40));
    String.hash(into:)(v45, v29, v28);
    Swift::Int result = Hasher._finalize()();
    uint64_t v32 = -1LL << *(_BYTE *)(v11 + 32);
    unint64_t v33 = result & ~v32;
    unint64_t v34 = v33 >> 6;
    if (((-1LL << v33) & ~*(void *)(v16 + 8 * (v33 >> 6))) != 0)
    {
      unint64_t v19 = __clz(__rbit64((-1LL << v33) & ~*(void *)(v16 + 8 * (v33 >> 6)))) | v33 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v35 = 0;
      unint64_t v36 = (unint64_t)(63 - v32) >> 6;
      do
      {
        if (++v34 == v36 && (v35 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }

        BOOL v37 = v34 == v36;
        if (v34 == v36) {
          unint64_t v34 = 0LL;
        }
        v35 |= v37;
        uint64_t v38 = *(void *)(v16 + 8 * v34);
      }

      while (v38 == -1);
      unint64_t v19 = __clz(__rbit64(~v38)) + (v34 << 6);
    }

    *(void *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v19;
    uint64_t v20 = (void *)(*(void *)(v11 + 48) + 16 * v19);
    void *v20 = v29;
    v20[1] = v28;
    Swift::Int result = sub_10001BCD0((uint64_t)v8, *(void *)(v11 + 56) + v30 * v19);
    ++*(void *)(v11 + 16);
  }

  swift_release(v9);
  uint64_t v3 = v40;
  unsigned int v24 = v42;
  if ((v44 & 1) == 0) {
    goto LABEL_43;
  }
LABEL_39:
  uint64_t v39 = 1LL << *(_BYTE *)(v9 + 32);
  if (v39 >= 64) {
    bzero(v24, ((unint64_t)(v39 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
  }
  else {
    void *v24 = -1LL << v39;
  }
  *(void *)(v9 + 16) = 0LL;
LABEL_43:
  Swift::Int result = swift_release(v9);
  uint64_t *v3 = v11;
  return result;
}

uint64_t sub_100025F28(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = *(void *)(*v2 + 24);
  }
  sub_10001B6BC(&qword_100051D80);
  uint64_t v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  uint64_t v8 = v7;
  if (*(void *)(v5 + 16))
  {
    unint64_t v34 = v3;
    uint64_t v9 = 1LL << *(_BYTE *)(v5 + 32);
    unint64_t v36 = (void *)(v5 + 64);
    if (v9 < 64) {
      uint64_t v10 = ~(-1LL << v9);
    }
    else {
      uint64_t v10 = -1LL;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v35 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = v7 + 64;
    uint64_t result = swift_retain(v5);
    int64_t v14 = 0LL;
    while (1)
    {
      if (v11)
      {
        unint64_t v17 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v18 = v17 | (v14 << 6);
      }

      else
      {
        int64_t v19 = v14 + 1;
        if (__OFADD__(v14, 1LL))
        {
LABEL_43:
          __break(1u);
LABEL_44:
          __break(1u);
          return result;
        }

        if (v19 >= v35) {
          goto LABEL_37;
        }
        unint64_t v20 = v36[v19];
        ++v14;
        if (!v20)
        {
          int64_t v14 = v19 + 1;
          if (v19 + 1 >= v35) {
            goto LABEL_37;
          }
          unint64_t v20 = v36[v14];
          if (!v20)
          {
            int64_t v21 = v19 + 2;
            if (v21 >= v35)
            {
LABEL_37:
              swift_release(v5);
              uint64_t v3 = v34;
              if ((a2 & 1) != 0)
              {
                uint64_t v33 = 1LL << *(_BYTE *)(v5 + 32);
                if (v33 >= 64) {
                  bzero(v36, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
                }
                else {
                  void *v36 = -1LL << v33;
                }
                *(void *)(v5 + 16) = 0LL;
              }

              break;
            }

            unint64_t v20 = v36[v21];
            if (!v20)
            {
              while (1)
              {
                int64_t v14 = v21 + 1;
                if (__OFADD__(v21, 1LL)) {
                  goto LABEL_44;
                }
                if (v14 >= v35) {
                  goto LABEL_37;
                }
                unint64_t v20 = v36[v14];
                ++v21;
                if (v20) {
                  goto LABEL_24;
                }
              }
            }

            int64_t v14 = v21;
          }
        }

LABEL_24:
        unint64_t v11 = (v20 - 1) & v20;
        unint64_t v18 = __clz(__rbit64(v20)) + (v14 << 6);
      }

      unint64_t v22 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v18);
      uint64_t v24 = *v22;
      uint64_t v23 = v22[1];
      unint64_t v25 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v18);
      if ((a2 & 1) != 0)
      {
        sub_10001BC38(v25, v38);
      }

      else
      {
        sub_10001F460((uint64_t)v25, (uint64_t)v38);
        swift_bridgeObjectRetain(v23);
      }

      Hasher.init(_seed:)(v37, *(void *)(v8 + 40));
      String.hash(into:)(v37, v24, v23);
      uint64_t result = Hasher._finalize()();
      uint64_t v26 = -1LL << *(_BYTE *)(v8 + 32);
      unint64_t v27 = result & ~v26;
      unint64_t v28 = v27 >> 6;
      if (((-1LL << v27) & ~*(void *)(v12 + 8 * (v27 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1LL << v27) & ~*(void *)(v12 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0LL;
      }

      else
      {
        char v29 = 0;
        unint64_t v30 = (unint64_t)(63 - v26) >> 6;
        do
        {
          if (++v28 == v30 && (v29 & 1) != 0)
          {
            __break(1u);
            goto LABEL_43;
          }

          BOOL v31 = v28 == v30;
          if (v28 == v30) {
            unint64_t v28 = 0LL;
          }
          v29 |= v31;
          uint64_t v32 = *(void *)(v12 + 8 * v28);
        }

        while (v32 == -1);
        unint64_t v15 = __clz(__rbit64(~v32)) + (v28 << 6);
      }

      *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v15;
      uint64_t v16 = (void *)(*(void *)(v8 + 48) + 16 * v15);
      *uint64_t v16 = v24;
      v16[1] = v23;
      uint64_t result = (uint64_t)sub_10001BC38(v38, (_OWORD *)(*(void *)(v8 + 56) + 32 * v15));
      ++*(void *)(v8 + 16);
    }
  }

  uint64_t result = swift_release(v5);
  uint64_t *v3 = v8;
  return result;
}

void *sub_100026224()
{
  id v1 = v0;
  uint64_t v2 = type metadata accessor for ClientRecord(0LL);
  uint64_t v30 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_10001B6BC(&qword_100051E10);
  uint64_t v5 = *v0;
  uint64_t v6 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    uint64_t result = (void *)swift_release(v5);
LABEL_28:
    uint64_t *v1 = v7;
    return result;
  }

  unint64_t v28 = v1;
  uint64_t result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1LL << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  uint64_t v29 = v5 + 64;
  int64_t v11 = 0LL;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v12 = 1LL << *(_BYTE *)(v5 + 32);
  uint64_t v13 = -1LL;
  if (v12 < 64) {
    uint64_t v13 = ~(-1LL << v12);
  }
  unint64_t v14 = v13 & *(void *)(v5 + 64);
  int64_t v15 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v17 = v16 | (v11 << 6);
      goto LABEL_12;
    }

    int64_t v24 = v11 + 1;
    if (__OFADD__(v11, 1LL))
    {
      __break(1u);
      goto LABEL_30;
    }

    if (v24 >= v15) {
      goto LABEL_26;
    }
    unint64_t v25 = *(void *)(v29 + 8 * v24);
    ++v11;
    if (!v25)
    {
      int64_t v11 = v24 + 1;
      if (v24 + 1 >= v15) {
        goto LABEL_26;
      }
      unint64_t v25 = *(void *)(v29 + 8 * v11);
      if (!v25) {
        break;
      }
    }

LABEL_25:
    unint64_t v14 = (v25 - 1) & v25;
    unint64_t v17 = __clz(__rbit64(v25)) + (v11 << 6);
LABEL_12:
    uint64_t v18 = 16 * v17;
    int64_t v19 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
    uint64_t v21 = *v19;
    uint64_t v20 = v19[1];
    unint64_t v22 = *(void *)(v30 + 72) * v17;
    sub_100022690(*(void *)(v5 + 56) + v22, (uint64_t)v4);
    uint64_t v23 = (void *)(*(void *)(v7 + 48) + v18);
    *uint64_t v23 = v21;
    v23[1] = v20;
    sub_10001BCD0((uint64_t)v4, *(void *)(v7 + 56) + v22);
    uint64_t result = (void *)swift_bridgeObjectRetain(v20);
  }

  int64_t v26 = v24 + 2;
  if (v26 >= v15)
  {
LABEL_26:
    uint64_t result = (void *)swift_release(v5);
    id v1 = v28;
    goto LABEL_28;
  }

  unint64_t v25 = *(void *)(v29 + 8 * v26);
  if (v25)
  {
    int64_t v11 = v26;
    goto LABEL_25;
  }

  while (1)
  {
    int64_t v11 = v26 + 1;
    if (__OFADD__(v26, 1LL)) {
      break;
    }
    if (v11 >= v15) {
      goto LABEL_26;
    }
    unint64_t v25 = *(void *)(v29 + 8 * v11);
    ++v26;
    if (v25) {
      goto LABEL_25;
    }
  }

    uint64_t v12 = (v23 - 1) & v23;
    int64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    unint64_t v16 = 16 * v15;
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    int64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_10001F460(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = v19;
    v21[1] = v18;
    sub_10001BC38(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    uint64_t result = (void *)swift_bridgeObjectRetain(v18);
  }

  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release(v2);
    id v1 = v25;
    goto LABEL_28;
  }

  uint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    unint64_t v9 = v24;
    goto LABEL_25;
  }

  while (1)
  {
    unint64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    uint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }

void *sub_100026450()
{
  id v1 = v0;
  sub_10001B6BC(&qword_100051D80);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release(v2);
LABEL_28:
    uint64_t *v1 = v4;
    return result;
  }

  unint64_t v25 = v1;
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1LL << *(_BYTE *)(v2 + 32);
  uint64_t v11 = -1LL;
  if (v10 < 64) {
    uint64_t v11 = ~(-1LL << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }

    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_30;
    }

    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }

uint64_t sub_100026634(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }

  else
  {
    if (v4 < 0)
    {
      uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
      goto LABEL_9;
    }

    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy(a3);
      return v6;
    }
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_9:
  __break(1u);
  return result;
}

void sub_1000267F0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR___FAXPCEventObserver_stream);
  uint64_t v3 = swift_allocObject(&unk_100042C28, 24LL, 7LL);
  swift_unknownObjectWeakInit(v3 + 16, v1);
  swift_unknownObjectRetain(v2);
  swift_retain(v3);
  NSString v4 = String._bridgeToObjectiveC()();
  void v7[4] = sub_100027244;
  uint64_t v8 = v3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 1107296256LL;
  v7[2] = sub_100026B2C;
  v7[3] = &unk_100042C40;
  unint64_t v5 = _Block_copy(v7);
  uint64_t v6 = v8;
  swift_retain(v3);
  swift_release(v6);
  [v2 setEventHandlerForStream:v4 queue:0 handler:v5];
  _Block_release(v5);
  swift_unknownObjectRelease(v2);
  swift_release_n(v3, 2LL);
}

uint64_t sub_100026918(void *a1, uint64_t a2)
{
  uint64_t v3 = a2 + 16;
  swift_beginAccess(a2 + 16, v17, 0LL, 0LL);
  uint64_t result = swift_unknownObjectWeakLoadStrong(v3);
  if (result)
  {
    unint64_t v5 = (char *)result;
    id v6 = [a1 name];
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
    uint64_t v9 = v8;

    uint64_t v10 = *(void *)&v5[OBJC_IVAR___FAXPCEventObserver_handlers];
    swift_bridgeObjectRetain(v10);

    if (*(void *)(v10 + 16) && (unint64_t v11 = sub_100021F20(v7, v9), (v12 & 1) != 0))
    {
      uint64_t v13 = *(void *)(v10 + 56) + 16 * v11;
      unint64_t v15 = *(void (**)(void **))v13;
      uint64_t v14 = *(void *)(v13 + 8);
      swift_retain(v14);
      swift_bridgeObjectRelease(v9);
      swift_bridgeObjectRelease(v10);
      uint64_t v16 = a1;
      swift_retain(v14);
      v15(&v16);
      return swift_release_n(v14, 2LL);
    }

    else
    {
      swift_bridgeObjectRelease(v9);
      return swift_bridgeObjectRelease(v10);
    }
  }

  return result;
}

void XPCEventObserver.init()()
{
}

id XPCEventObserver.__deallocating_deinit()
{
  return sub_100026FC8(type metadata accessor for XPCEventObserver);
}

uint64_t type metadata accessor for XPCEventObserver()
{
  return objc_opt_self(&OBJC_CLASS___FAXPCEventObserver);
}

void sub_100026B30(uint64_t a1, void (*a2)(void))
{
  uint64_t v4 = type metadata accessor for Logger(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = (objc_class *)type metadata accessor for XPCEvent();
  uint64_t v9 = (char *)objc_allocWithZone(v8);
  *(void *)&v9[OBJC_IVAR____TtC13familycircled8XPCEvent_object] = a1;
  v33.receiver = v9;
  v33.super_class = v8;
  swift_unknownObjectRetain(a1);
  id v10 = objc_msgSendSuper2(&v33, "init");
  static FamilyLogger.daemon.getter(v10);
  id v11 = v10;
  char v12 = (os_log_s *)Logger.logObject.getter(v11);
  os_log_type_t v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v30 = v4;
    uint64_t v14 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v29 = swift_slowAlloc(32LL, -1LL);
    uint64_t v32 = v29;
    *(_DWORD *)uint64_t v14 = 136315138;
    unint64_t v15 = v14 + 12;
    int64_t v26 = v14 + 4;
    uint64_t v27 = v14;
    uint64_t v16 = a2;
    id v17 = [v11 name];
    uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(v17);
    uint64_t v28 = v5;
    uint64_t v19 = v18;
    unint64_t v21 = v20;

    a2 = v16;
    uint64_t v31 = sub_1000218D0(v19, v21, &v32);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v31, &v32, v26, v15);

    swift_bridgeObjectRelease(v21);
    int64_t v22 = v27;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "did receive xpc event: %s", v27, 0xCu);
    uint64_t v23 = v29;
    swift_arrayDestroy(v29, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v23, -1LL, -1LL);
    swift_slowDealloc(v22, -1LL, -1LL);

    (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v30);
  }

  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }

  id v24 = v11;
  a2();
}

uint64_t sub_100026D94(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  swift_retain(v3);
  uint64_t v5 = swift_unknownObjectRetain(a2);
  v4(v5);
  swift_release(v3);
  return swift_unknownObjectRelease(a2);
}

id sub_100026F64()
{
  return sub_100026FC8(type metadata accessor for XPCStreamHandler);
}

uint64_t type metadata accessor for XPCStreamHandler()
{
  return objc_opt_self(&OBJC_CLASS____TtC13familycircled16XPCStreamHandler);
}

id sub_100026FBC()
{
  return sub_100026FC8(type metadata accessor for XPCEvent);
}

id sub_100026FC8(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for XPCEvent()
{
  return objc_opt_self(&OBJC_CLASS____TtC13familycircled8XPCEvent);
}

uint64_t sub_10002707C()
{
  uint64_t v1 = type metadata accessor for Logger(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (xpc_dictionary_get_string( *(xpc_object_t *)(v0 + OBJC_IVAR____TtC13familycircled8XPCEvent_object),  _xpc_event_key_name))
  {
    return String.init(cString:)();
  }

  uint64_t v6 = static FamilyLogger.daemon.getter();
  uint64_t v7 = (os_log_s *)Logger.logObject.getter(v6);
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Unknown XPC event name received", v9, 2u);
    swift_slowDealloc(v9, -1LL, -1LL);
  }

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return 0xD000000000000021LL;
}

uint64_t sub_1000271A8()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_1000271CC()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16LL))();
}

uint64_t sub_1000271DC()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

void sub_100027200(uint64_t a1)
{
}

uint64_t sub_100027208(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100027218(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_100027220()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_100027244(void *a1)
{
  return sub_100026918(a1, v1);
}

uint64_t sub_100027254@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = type metadata accessor for SystemBackgroundRequestFactory(0LL);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for FamilyFeatureFlags(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, void, uint64_t))(v7 + 104))( v9,  enum case for FamilyFeatureFlags.systemBackgroundTasks(_:),  v6);
  char v10 = static FamilyFeatureFlags.enabled(_:)(v9);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v11 = swift_allocObject(&unk_100042E98, 24LL, 7LL);
  swift_unknownObjectWeakInit(v11 + 16, v1);
  if ((v10 & 1) != 0)
  {
    uint64_t v12 = sub_10001B6BC(&qword_100052698);
    swift_allocObject(v12, *(unsigned int *)(v12 + 48), *(unsigned __int16 *)(v12 + 52));
    uint64_t v13 = sub_100029AB0(86400LL, (uint64_t)&unk_100052690, v11);
    swift_release(v11);
    uint64_t v14 = (void *)objc_opt_self(&OBJC_CLASS___BGSystemTaskScheduler);
    swift_retain(v13);
    id v15 = [v14 sharedScheduler];
    SystemBackgroundRequestFactory.init()();
    id v26 = v15;
    uint64_t v16 = sub_10001B6BC(&qword_1000526A0);
    swift_allocObject(v16, *(unsigned int *)(v16 + 48), *(unsigned __int16 *)(v16 + 52));
    uint64_t v17 = SystemBackgroundTaskScheduler.init(taskProvider:underlyingScheduler:requestFactory:)(v13, &v26, v5);
    swift_release(v13);
    uint64_t v18 = (unint64_t *)&unk_1000526A8;
    uint64_t v19 = &protocol conformance descriptor for SystemBackgroundTaskScheduler<A, B, C>;
    unint64_t v20 = &qword_1000526A0;
  }

  else
  {
    uint64_t v21 = type metadata accessor for HeartbeatXPCActivityProvider(0LL);
    uint64_t v22 = swift_allocObject(v21, *(unsigned int *)(v21 + 48), *(unsigned __int16 *)(v21 + 52));
    sub_1000280CC(86400LL, (uint64_t)&unk_100052670, v11);
    uint64_t v16 = sub_10001B6BC(&qword_100052678);
    swift_allocObject(v16, *(unsigned int *)(v16 + 48), *(unsigned __int16 *)(v16 + 52));
    uint64_t v23 = swift_retain(v22);
    uint64_t v17 = XPCActivityScheduler.init(taskProvider:)(v23);
    swift_release(v22);
    uint64_t v18 = (unint64_t *)&unk_100052680;
    uint64_t v19 = &protocol conformance descriptor for XPCActivityScheduler<A>;
    unint64_t v20 = &qword_100052678;
  }

  uint64_t result = sub_100029CC8(v18, v20, (uint64_t)v19);
  a1[3] = v16;
  a1[4] = result;
  *a1 = v17;
  return result;
}

uint64_t sub_1000274C4(uint64_t a1)
{
  *(void *)(v1 + 40) = a1;
  return swift_task_switch(sub_1000274DC, 0LL, 0LL);
}

uint64_t sub_1000274DC()
{
  uint64_t v1 = *(void *)(v0 + 40) + 16LL;
  swift_beginAccess(v1, v0 + 16, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(v1);
  *(void *)(v0 + 4_Block_object_dispose(va, 8) = Strong;
  if (!Strong) {
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  uint64_t v3 = (void *)swift_task_alloc(dword_1000526D4);
  *(void *)(v0 + 56) = v3;
  void *v3 = v0;
  v3[1] = sub_100027564;
  return sub_1000275B8();
}

uint64_t sub_100027564()
{
  return swift_task_switch(sub_100029D38, 0LL, 0LL);
}

uint64_t sub_1000275B8()
{
  v1[27] = v0;
  uint64_t v2 = type metadata accessor for XPCActivity.Criteria.Options(0LL);
  v1[28] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  v1[29] = v3;
  v1[30] = swift_task_alloc((*(void *)(v3 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for XPCActivity.Priority(0LL);
  v1[31] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v1[32] = v5;
  v1[33] = swift_task_alloc((*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for XPCActivity.Criteria(0LL);
  v1[34] = swift_task_alloc((*(void *)(*(void *)(v6 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_100027660, 0LL, 0LL);
}

uint64_t sub_100027660()
{
  uint64_t v1 = v0 + 2;
  uint64_t v2 = (void *)v0[27];
  v0[7] = v0 + 25;
  v0[2] = v0;
  v0[3] = sub_1000276F4;
  uint64_t v3 = swift_continuation_init(v0 + 2, 0LL);
  v0[10] = _NSConcreteStackBlock;
  uint64_t v4 = v0 + 10;
  v4[1] = 0x40000000LL;
  v4[2] = sub_100027B90;
  v4[3] = &unk_100042EB0;
  void v4[4] = v3;
  [v2 performHeartbeatCheckinWithCompletion:v4];
  return swift_continuation_await(v1);
}

uint64_t sub_1000276F4()
{
  return swift_task_switch(sub_100027740, 0LL, 0LL);
}

uint64_t sub_100027740()
{
  uint64_t v1 = v0[33];
  uint64_t v22 = v0[34];
  uint64_t v3 = v0[31];
  uint64_t v2 = v0[32];
  uint64_t v4 = v0[29];
  uint64_t v20 = v0[30];
  uint64_t v21 = v0[28];
  id v24 = v0 + 20;
  uint64_t v5 = v0[25];
  sub_100027254(v0 + 15);
  uint64_t v7 = v0[18];
  uint64_t v6 = v0[19];
  sub_10001E920(v0 + 15, v7);
  uint64_t v23 = dispatch thunk of BackgroundTaskScheduler.taskProvider.getter(v7, v6);
  if (v5 <= 86400) {
    uint64_t v5 = 86400LL;
  }
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))( v1,  enum case for XPCActivity.Priority.maintenance(_:),  v3);
  uint64_t v8 = sub_10001B6BC(&qword_1000526B0);
  uint64_t v9 = swift_allocObject( v8,  ((*(unsigned __int8 *)(v4 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))
       + 2LL * *(void *)(v4 + 72),
         *(unsigned __int8 *)(v4 + 80) | 7LL);
  *(_OWORD *)(v9 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_100035870;
  uint64_t v10 = static XPCActivity.Criteria.Options.requiresNetwork.getter(v9);
  static XPCActivity.Criteria.Options.allowBattery.getter(v10);
  v0[26] = v9;
  uint64_t v11 = sub_10001BA20( &qword_1000526B8,  (uint64_t (*)(uint64_t))&type metadata accessor for XPCActivity.Criteria.Options,  (uint64_t)&protocol conformance descriptor for XPCActivity.Criteria.Options);
  uint64_t v12 = sub_10001B6BC(&qword_1000526C0);
  uint64_t v13 = sub_100029CC8(&qword_1000526C8, &qword_1000526C0, (uint64_t)&protocol conformance descriptor for [A]);
  dispatch thunk of SetAlgebra.init<A>(_:)(v0 + 26, v12, v13, v21, v11);
  XPCActivity.Criteria.init(priority:repeating:delay:gracePeriod:interval:options:)(v1, 1LL, v5, 1800LL, v5, v20);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness( 0LL,  v6,  v7,  &protocol requirements base descriptor for BackgroundTaskScheduler,  &associated type descriptor for BackgroundTaskScheduler.TaskProvider);
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness( v6,  v7,  AssociatedTypeWitness,  &protocol requirements base descriptor for BackgroundTaskScheduler,  &associated conformance descriptor for BackgroundTaskScheduler.BackgroundTaskScheduler.TaskProvider: BackgroundTaskProvider);
  dispatch thunk of BackgroundTaskProvider.criteria.setter(v22, AssociatedTypeWitness, AssociatedConformanceWitness);
  swift_unknownObjectRelease(v23);
  sub_10001F53C(v0 + 15);
  sub_100027254(v24);
  uint64_t v16 = v0[23];
  uint64_t v17 = v0[24];
  sub_10001E920(v24, v16);
  v0[35] = (uint64_t)v18;
  unint64_t *v18 = v0;
  v18[1] = (uint64_t *)sub_1000279A4;
  return dispatch thunk of BackgroundTaskScheduler.schedule()(v16, v17);
}

uint64_t sub_1000279A4()
{
  if (v0)
  {
    swift_errorRelease(v0);
    uint64_t v2 = sub_100029D34;
  }

  else
  {
    uint64_t v2 = sub_100027A10;
  }

  return swift_task_switch(v2, 0LL, 0LL);
}

uint64_t sub_100027A10()
{
  uint64_t v1 = *(void *)(v0 + 264);
  uint64_t v2 = *(void *)(v0 + 272);
  uint64_t v3 = *(void *)(v0 + 240);
  sub_10001F53C((void *)(v0 + 160));
  swift_task_dealloc(v2);
  swift_task_dealloc(v1);
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100027A68(uint64_t a1)
{
  *(void *)(v1 + 40) = a1;
  return swift_task_switch(sub_100027A80, 0LL, 0LL);
}

uint64_t sub_100027A80()
{
  uint64_t v1 = *(void *)(v0 + 40) + 16LL;
  swift_beginAccess(v1, v0 + 16, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(v1);
  *(void *)(v0 + 4_Block_object_dispose(va, 8) = Strong;
  if (!Strong) {
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  uint64_t v3 = (void *)swift_task_alloc(dword_1000526D4);
  *(void *)(v0 + 56) = v3;
  void *v3 = v0;
  v3[1] = sub_100027B08;
  return sub_1000275B8();
}

uint64_t sub_100027B08()
{
  return swift_task_switch(sub_100027B5C, 0LL, 0LL);
}

uint64_t sub_100027B5C()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100027B90(uint64_t a1, uint64_t a2)
{
  **(void **)(*(void *)(*(void *)(a1 + 32) + 64LL) + 4_swift_stdlib_reportUnimplementedInitializer("familycircled.XPCEventObserver", 30LL, "init()", 6LL, 0LL) = a2;
  return swift_continuation_resume();
}

uint64_t FAHeartbeatActivity.schedule()()
{
  *(void *)(v1 + 56) = v0;
  return swift_task_switch(sub_100027BBC, 0LL, 0LL);
}

uint64_t sub_100027BBC()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[6];
  sub_10001E920(v0 + 2, v1);
  uint64_t v3 = (uint64_t **)swift_task_alloc(async function pointer to dispatch thunk of BackgroundTaskScheduler.schedule()[1]);
  v0[8] = (uint64_t)v3;
  void *v3 = v0;
  v3[1] = (uint64_t *)sub_100027C38;
  return dispatch thunk of BackgroundTaskScheduler.schedule()(v1, v2);
}

uint64_t sub_100027C38()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 64LL);
  *(void *)(*(void *)v1 + 72LL) = v0;
  swift_task_dealloc(v2);
  if (v0) {
    uint64_t v3 = sub_100027CD0;
  }
  else {
    uint64_t v3 = sub_100027C9C;
  }
  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_100027C9C()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100027CD0()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100027E20(const void *a1, void *a2)
{
  *(void *)(v2 + 56) = a2;
  *(void *)(v2 + 64) = _Block_copy(a1);
  id v4 = a2;
  return swift_task_switch(sub_100027E68, 0LL, 0LL);
}

uint64_t sub_100027E68()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[6];
  sub_10001E920(v0 + 2, v1);
  uint64_t v3 = (uint64_t **)swift_task_alloc(async function pointer to dispatch thunk of BackgroundTaskScheduler.schedule()[1]);
  v0[9] = (uint64_t)v3;
  void *v3 = v0;
  v3[1] = (uint64_t *)sub_100027EE4;
  return dispatch thunk of BackgroundTaskScheduler.schedule()(v1, v2);
}

uint64_t sub_100027EE4()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 72LL);
  *(void *)(*(void *)v1 + 8_swift_stdlib_reportUnimplementedInitializer("familycircled.XPCEventObserver", 30LL, "init()", 6LL, 0LL) = v0;
  swift_task_dealloc(v2);
  if (v0) {
    uint64_t v3 = sub_100027F98;
  }
  else {
    uint64_t v3 = sub_100027F48;
  }
  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_100027F48()
{
  uint64_t v1 = *(void **)(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 64);
  sub_10001F53C((void *)(v0 + 16));

  (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0LL);
  _Block_release(*(const void **)(v0 + 64));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100027F98()
{
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v3 = *(void **)(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 64);
  sub_10001F53C((void *)(v0 + 16));

  id v4 = (void *)_convertErrorToNSError(_:)(v1);
  swift_errorRelease(v1);
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);

  _Block_release(*(const void **)(v0 + 64));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

Swift::Void __swiftcall FAHeartbeatActivity.unregister()()
{
  uint64_t v0 = v3;
  uint64_t v1 = v4;
  sub_10001E920(v2, v3);
  dispatch thunk of BackgroundTaskScheduler.unregister()(v0, v1);
  sub_10001F53C(v2);
}

uint64_t sub_1000280CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v26 = a2;
  uint64_t v27 = a3;
  uint64_t v25 = a1;
  uint64_t v5 = type metadata accessor for XPCActivity.Criteria.Options(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for XPCActivity.Priority(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for XPCActivity.Criteria(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, void, uint64_t))(v10 + 104))( v12,  enum case for XPCActivity.Priority.maintenance(_:),  v9);
  uint64_t v17 = sub_10001B6BC(&qword_1000526B0);
  uint64_t v18 = swift_allocObject( v17,  ((*(unsigned __int8 *)(v6 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))
        + 2LL * *(void *)(v6 + 72),
          *(unsigned __int8 *)(v6 + 80) | 7LL);
  *(_OWORD *)(v18 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_100035870;
  uint64_t v19 = static XPCActivity.Criteria.Options.requiresNetwork.getter();
  static XPCActivity.Criteria.Options.allowBattery.getter(v19);
  uint64_t v28 = v18;
  uint64_t v20 = sub_10001BA20( &qword_1000526B8,  (uint64_t (*)(uint64_t))&type metadata accessor for XPCActivity.Criteria.Options,  (uint64_t)&protocol conformance descriptor for XPCActivity.Criteria.Options);
  uint64_t v21 = sub_10001B6BC(&qword_1000526C0);
  uint64_t v22 = sub_100029CC8(&qword_1000526C8, &qword_1000526C0, (uint64_t)&protocol conformance descriptor for [A]);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v28, v21, v22, v5, v20);
  XPCActivity.Criteria.init(priority:repeating:delay:gracePeriod:interval:options:)(v12, 1LL, v25, 1800LL, v25, v8);
  (*(void (**)(uint64_t, char *, uint64_t))(v14 + 32))( v4 + OBJC_IVAR____TtC13familycircled28HeartbeatXPCActivityProvider_criteria,  v16,  v13);
  uint64_t v23 = v27;
  *(void *)(v4 + swift_unknownObjectWeakDestroy(v0 + 16) = v26;
  *(void *)(v4 + 24) = v23;
  return v4;
}

uint64_t sub_1000282E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10001B6BC(&qword_100051F68);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for TaskPriority(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1LL, 1LL, v9);
  uint64_t v11 = (void *)swift_allocObject(&unk_100042D80, 56LL, 7LL);
  v11[2] = 0LL;
  uint64_t v12 = v11 + 2;
  v11[3] = 0LL;
  void v11[4] = a1;
  void v11[5] = a2;
  v11[6] = a3;
  LODWORD(asub_100027254(v0 + 2) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1LL, v9);
  swift_retain(a1);
  uint64_t v13 = swift_retain(a3);
  if ((_DWORD)a2 == 1)
  {
    sub_100029424((uint64_t)v8);
    uint64_t v14 = 7168LL;
LABEL_6:
    uint64_t v22 = 0LL;
    goto LABEL_7;
  }

  unsigned __int8 v15 = TaskPriority.rawValue.getter(v13);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
  uint64_t v14 = v15 | 0x1C00LL;
  uint64_t v16 = *v12;
  if (!*v12) {
    goto LABEL_6;
  }
  uint64_t v17 = v11[3];
  uint64_t ObjectType = swift_getObjectType(*v12);
  swift_unknownObjectRetain(v16);
  uint64_t v19 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v17);
  uint64_t v21 = v20;
  swift_unknownObjectRelease(v16);
  if (!(v21 | v19)) {
    goto LABEL_6;
  }
  v25[0] = 0LL;
  v25[1] = 0LL;
  uint64_t v22 = v25;
  v25[2] = v19;
  v25[3] = v21;
LABEL_7:
  uint64_t v23 = swift_task_create(v14, v22, (char *)&type metadata for () + 8, &unk_100052620, v11);
  return swift_release(v23);
}

uint64_t sub_1000284AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[5] = a5;
  v6[6] = a6;
  void v6[4] = a4;
  uint64_t v7 = type metadata accessor for Logger(0LL);
  v6[7] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v6[8] = v8;
  unint64_t v9 = (*(void *)(v8 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v6[9] = swift_task_alloc(v9);
  v6[10] = swift_task_alloc(v9);
  return swift_task_switch(sub_100028520, 0LL, 0LL);
}

uint64_t sub_100028520()
{
  if (XPCActivity.shouldDefer()())
  {
    uint64_t updated = static FamilyLogger.osUpdateActivity.getter();
    uint64_t v2 = (os_log_s *)Logger.logObject.getter(updated);
    os_log_type_t v3 = static os_log_type_t.debug.getter();
    BOOL v4 = os_log_type_enabled(v2, v3);
    uint64_t v6 = v0[8];
    uint64_t v5 = v0[9];
    uint64_t v7 = v0[7];
    if (v4)
    {
      uint64_t v26 = v0[9];
      uint64_t v24 = v0[7];
      uint64_t v8 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v9 = swift_slowAlloc(32LL, -1LL);
      uint64_t v28 = v9;
      *(_DWORD *)uint64_t v8 = 136315138;
      v0[3] = sub_1000218D0(0xD000000000000011LL, 0x80000001000380B0LL, &v28);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 3, v0 + 4, v8 + 4, v8 + 12);
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "FAOSUpdatedActivity %s - defering activityBlock", v8, 0xCu);
      swift_arrayDestroy(v9, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v9, -1LL, -1LL);
      swift_slowDealloc(v8, -1LL, -1LL);

      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v26, v24);
    }

    else
    {

      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    }

    uint64_t v19 = v0[9];
    swift_task_dealloc(v0[10]);
    swift_task_dealloc(v19);
    uint64_t v20 = (uint64_t (*)(void))v0[1];
  }

  else
  {
    uint64_t v10 = static FamilyLogger.osUpdateActivity.getter();
    uint64_t v11 = (os_log_s *)Logger.logObject.getter(v10);
    os_log_type_t v12 = static os_log_type_t.debug.getter();
    BOOL v13 = os_log_type_enabled(v11, v12);
    uint64_t v14 = v0[10];
    uint64_t v16 = v0[7];
    uint64_t v15 = v0[8];
    if (v13)
    {
      uint64_t v25 = v0[10];
      uint64_t v17 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v18 = swift_slowAlloc(32LL, -1LL);
      uint64_t v28 = v18;
      *(_DWORD *)uint64_t v17 = 136315138;
      v0[2] = sub_1000218D0(0xD000000000000011LL, 0x80000001000380B0LL, &v28);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 2, v0 + 3, v17 + 4, v17 + 12);
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "FAOSUpdatedActivity %s - executing activityBlock", v17, 0xCu);
      swift_arrayDestroy(v18, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v18, -1LL, -1LL);
      swift_slowDealloc(v17, -1LL, -1LL);

      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v25, v16);
    }

    else
    {

      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
    }

    uint64_t v21 = (int *)v0[5];
    uint64_t v27 = (uint64_t (*)(void))((char *)v21 + *v21);
    uint64_t v22 = (void *)swift_task_alloc(v21[1]);
    v0[11] = v22;
    void *v22 = v0;
    v22[1] = sub_100028828;
    uint64_t v20 = v27;
  }

  return v20();
}

uint64_t sub_100028828()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 88);
  uint64_t v4 = *v1;
  swift_task_dealloc(v3);
  if (!v0) {
    return swift_task_switch(sub_1000288A0, 0LL, 0LL);
  }
  uint64_t v6 = v2 + 72;
  uint64_t v5 = *(void *)(v2 + 72);
  swift_task_dealloc(*(void *)(v6 + 8));
  swift_task_dealloc(v5);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

uint64_t sub_1000288A0()
{
  uint64_t v1 = *(void *)(v0 + 72);
  swift_task_dealloc(*(void *)(v0 + 80));
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000288E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1LL, v6);
  if ((_DWORD)v8 == 1)
  {
    sub_100029424(a1);
    uint64_t v9 = 7168LL;
    uint64_t v10 = *(void *)(a3 + 16);
    if (!v10)
    {
LABEL_6:
      uint64_t v16 = 0LL;
      return swift_task_create(v9, v16, (char *)&type metadata for () + 8, a2, a3);
    }
  }

  else
  {
    unsigned __int8 v17 = TaskPriority.rawValue.getter(v8);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    uint64_t v9 = v17 | 0x1C00LL;
    uint64_t v10 = *(void *)(a3 + 16);
    if (!v10) {
      goto LABEL_6;
    }
  }

  uint64_t v11 = *(void *)(a3 + 24);
  uint64_t ObjectType = swift_getObjectType(v10);
  swift_unknownObjectRetain(v10);
  uint64_t v13 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v11);
  uint64_t v15 = v14;
  swift_unknownObjectRelease(v10);
  if (!(v15 | v13)) {
    goto LABEL_6;
  }
  v19[0] = 0LL;
  v19[1] = 0LL;
  uint64_t v16 = v19;
  v19[2] = v13;
  void v19[3] = v15;
  return swift_task_create(v9, v16, (char *)&type metadata for () + 8, a2, a3);
}

uint64_t sub_100028A10()
{
  return sub_100029124(&OBJC_IVAR____TtC13familycircled28HeartbeatXPCActivityProvider_criteria);
}

uint64_t sub_100028A1C()
{
  return type metadata accessor for HeartbeatXPCActivityProvider(0LL);
}

uint64_t type metadata accessor for HeartbeatXPCActivityProvider(uint64_t a1)
{
  uint64_t result = qword_1000524D8;
  if (!qword_1000524D8) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for HeartbeatXPCActivityProvider);
  }
  return result;
}

uint64_t sub_100028A60(uint64_t a1)
{
  v4[0] = (char *)&value witness table for () + 64;
  uint64_t result = type metadata accessor for XPCActivity.Criteria(319LL);
  if (v3 <= 0x3F)
  {
    v4[1] = *(void *)(result - 8) + 64LL;
    uint64_t result = swift_updateClassMetadata2(a1, 256LL, 2LL, v4, a1 + 80);
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_100028AE0(uint64_t a1)
{
  v4[0] = (char *)&value witness table for () + 64;
  uint64_t result = type metadata accessor for XPCActivity.Criteria(319LL);
  if (v3 <= 0x3F)
  {
    v4[1] = *(void *)(result - 8) + 64LL;
    uint64_t result = swift_initClassMetadata2(a1, 0LL, 2LL, v4, a1 + 96);
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_100028B5C@<X0>(uint64_t a1@<X8>)
{
  return sub_1000291A0(&OBJC_IVAR____TtC13familycircled28HeartbeatXPCActivityProvider_criteria, a1);
}

uint64_t sub_100028B68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10002920C(a1, a2, a3, &OBJC_IVAR____TtC13familycircled28HeartbeatXPCActivityProvider_criteria);
}

void *sub_100028B74(uint64_t a1)
{
  return &j__swift_endAccess;
}

const char *sub_100028BBC()
{
  return "com.apple.family.heartbeat";
}

uint64_t (*sub_100028BD0())(void *a1)
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v3 = swift_allocObject(&unk_100042D30, 32LL, 7LL);
  *(void *)(v3 + swift_unknownObjectWeakDestroy(v0 + 16) = v2;
  *(void *)(v3 + 24) = v1;
  uint64_t v4 = swift_allocObject(&unk_100042D58, 32LL, 7LL);
  *(void *)(v4 + swift_unknownObjectWeakDestroy(v0 + 16) = sub_100029344;
  *(void *)(v4 + 24) = v3;
  swift_retain(v1);
  return sub_10002934C;
}

uint64_t (*sub_100028C4C())(uint64_t a1)
{
  uint64_t v1 = *v0;
  uint64_t v3 = v0[2];
  uint64_t v2 = v0[3];
  uint64_t v4 = (void *)swift_allocObject(&unk_100042DA8, 48LL, 7LL);
  void v4[2] = *(void *)(v1 + 80);
  v4[3] = *(void *)(v1 + 88);
  void v4[4] = v3;
  v4[5] = v2;
  swift_retain(v2);
  return sub_100029724;
}

uint64_t sub_100028CB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = *(void *)(a4 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  __chkstk_darwin(a1);
  uint64_t v12 = sub_10001B6BC(&qword_100051F68);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56LL))(v14, 1LL, 1LL, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))( (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL),  a1,  a4);
  uint64_t v16 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v17 = (v16 + 64) & ~v16;
  uint64_t v18 = (char *)swift_allocObject(&unk_100042DD0, v17 + v11, v16 | 7);
  *((void *)v18 + sub_100027254(v0 + 2) = 0LL;
  *((void *)v18 + 3) = 0LL;
  *((void *)v18 + 4) = a4;
  *((void *)v18 + 5) = a5;
  *((void *)v18 + 6) = a2;
  *((void *)v18 + 7) = a3;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))( &v18[v17],  (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL),  a4);
  swift_retain(a3);
  uint64_t v19 = sub_1000288E4((uint64_t)v14, (uint64_t)&unk_100052630, (uint64_t)v18);
  return swift_release(v19);
}

uint64_t sub_100028E08( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[6] = a7;
  v8[7] = a8;
  void v8[4] = a5;
  void v8[5] = a6;
  v8[3] = a4;
  uint64_t v9 = type metadata accessor for Logger(0LL);
  v8[8] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  void v8[9] = v10;
  v8[10] = swift_task_alloc((*(void *)(v10 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_100028E70, 0LL, 0LL);
}

uint64_t sub_100028E70()
{
  uint64_t updated = static FamilyLogger.osUpdateActivity.getter();
  uint64_t v2 = (os_log_s *)Logger.logObject.getter(updated);
  os_log_type_t v3 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v5 = v0[9];
    uint64_t v4 = v0[10];
    uint64_t v6 = v0[8];
    uint64_t v7 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v8 = swift_slowAlloc(32LL, -1LL);
    uint64_t v16 = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    v0[2] = sub_1000218D0(0xD000000000000011LL, 0x80000001000380B0LL, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 2, v0 + 3, v7 + 4, v7 + 12);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "FAOSUpdatedActivity %s - executing activityBlock", v7, 0xCu);
    swift_arrayDestroy(v8, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v8, -1LL, -1LL);
    swift_slowDealloc(v7, -1LL, -1LL);

    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  }

  else
  {
    uint64_t v10 = v0[9];
    uint64_t v9 = v0[10];
    uint64_t v11 = v0[8];

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  }

  uint64_t v12 = (int *)v0[3];
  uint64_t v15 = (uint64_t (*)(void))((char *)v12 + *v12);
  uint64_t v13 = (void *)swift_task_alloc(v12[1]);
  v0[11] = v13;
  void *v13 = v0;
  v13[1] = sub_100029018;
  return v15();
}

uint64_t sub_100029018()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 88);
  uint64_t v4 = *v1;
  swift_task_dealloc(v3);
  if (!v0) {
    return swift_task_switch(sub_100029088, 0LL, 0LL);
  }
  swift_task_dealloc(*(void *)(v2 + 80));
  return (*(uint64_t (**)(void))(v4 + 8))();
}

uint64_t sub_100029088()
{
  uint64_t v1 = *(void *)(v0 + 80);
  dispatch thunk of SystemBackgroundTaskProtocol.setTaskCompleted()(*(void *)(v0 + 48), *(void *)(v0 + 56));
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000290CC()
{
  uint64_t v1 = v0 + qword_1000534F8;
  uint64_t v2 = type metadata accessor for XPCActivity.Criteria(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(v1, v2);
  return v0;
}

uint64_t sub_100029118()
{
  return sub_100029124(&qword_1000534F8);
}

uint64_t sub_100029124(void *a1)
{
  uint64_t v3 = (char *)v1 + *a1;
  uint64_t v4 = type metadata accessor for XPCActivity.Criteria(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  return swift_deallocClassInstance(v1, *(unsigned int *)(*v1 + 48LL), *(unsigned __int16 *)(*v1 + 52LL));
}

uint64_t type metadata accessor for HeartbeatBackgroundTaskProvider( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100029D08(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for HeartbeatBackgroundTaskProvider);
}

uint64_t sub_100029188(uint64_t a1, uint64_t a2)
{
  return *(void *)(*(void *)(a2 + 88) + 8LL);
}

uint64_t sub_100029194@<X0>(uint64_t a1@<X8>)
{
  return sub_1000291A0(&qword_1000534F8, a1);
}

uint64_t sub_1000291A0@<X0>(void *a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *a1;
  swift_beginAccess(v4, v7, 0LL, 0LL);
  uint64_t v5 = type metadata accessor for XPCActivity.Criteria(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, v4, v5);
}

uint64_t sub_100029200(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10002920C(a1, a2, a3, &qword_1000534F8);
}

uint64_t sub_10002920C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = v4 + *a4;
  swift_beginAccess(v6, v9, 33LL, 0LL);
  uint64_t v7 = type metadata accessor for XPCActivity.Criteria(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 40LL))(v6, a1, v7);
  return swift_endAccess(v9);
}

uint64_t (*sub_100029274(uint64_t a1))(void)
{
  return j_j__swift_endAccess;
}

const char *sub_1000292B8()
{
  return "com.apple.family.heartbeat.backgroundTask";
}

uint64_t (*sub_1000292CC())(uint64_t a1)
{
  return sub_100029724;
}

void *sub_1000292E8()
{
  return &protocol witness table for XPCActivity;
}

uint64_t sub_1000292F4()
{
  return sub_10001BA20( &qword_100052610,  type metadata accessor for HeartbeatXPCActivityProvider,  (uint64_t)&unk_100035F40);
}

uint64_t sub_100029320()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_100029344(uint64_t a1)
{
  return sub_1000282E0(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_10002934C(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_100029370()
{
  return swift_deallocObject(v0, 56LL, 7LL);
}

uint64_t sub_1000293A4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc(dword_10005261C);
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_10001D4E4;
  return sub_1000284AC(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_100029424(uint64_t a1)
{
  uint64_t v2 = sub_10001B6BC(&qword_100051F68);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_100029464(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc(a3[1]);
  *(void *)(v3 + swift_unknownObjectWeakDestroy(v0 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_10001D6FC;
  return v6();
}

uint64_t sub_1000294B8(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc(a4[1]);
  *(void *)(v4 + swift_unknownObjectWeakDestroy(v0 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_10001D6FC;
  return v7();
}

uint64_t sub_10002950C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1LL, v6) == 1)
  {
    sub_100029424(a1);
    uint64_t v8 = 7168LL;
    uint64_t v9 = *(void *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      uint64_t v10 = *(void *)(a3 + 24);
      uint64_t ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9);
      uint64_t v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      uint64_t v14 = v13;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }

  else
  {
    unsigned __int8 v15 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    uint64_t v8 = v15 | 0x1C00LL;
    uint64_t v9 = *(void *)(a3 + 16);
    if (v9) {
      goto LABEL_3;
    }
  }

  uint64_t v12 = 0LL;
  uint64_t v14 = 0LL;
LABEL_6:
  uint64_t v16 = swift_allocObject(&unk_100042E70, 32LL, 7LL);
  *(void *)(v16 + swift_unknownObjectWeakDestroy(v0 + 16) = a2;
  *(void *)(v16 + 24) = a3;
  if (v14 | v12)
  {
    v19[0] = 0LL;
    v19[1] = 0LL;
    uint64_t v17 = v19;
    v19[2] = v12;
    void v19[3] = v14;
  }

  else
  {
    uint64_t v17 = 0LL;
  }

  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &unk_100052660, v16);
}

uint64_t sub_100029650(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_1000296B4;
  return v6(a1);
}

uint64_t sub_1000296B4()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100029700()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_100029724(uint64_t a1)
{
  return sub_100028CB8(a1, v1[4], v1[5], v1[2], v1[3]);
}

uint64_t sub_100029730()
{
  uint64_t v1 = *((void *)v0 + 4);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 64) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease(*((void *)v0 + 2));
  swift_release(*((void *)v0 + 7));
  (*(void (**)(char *, uint64_t))(v2 + 8))(&v0[v4], v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_1000297A4(uint64_t a1)
{
  uint64_t v4 = v1[4];
  uint64_t v5 = v1[5];
  uint64_t v6 = *(unsigned __int8 *)(*(void *)(v4 - 8) + 80LL);
  uint64_t v7 = v1[2];
  uint64_t v8 = v1[3];
  uint64_t v9 = v1[6];
  uint64_t v10 = v1[7];
  uint64_t v11 = (uint64_t)v1 + ((v6 + 64) & ~v6);
  uint64_t v12 = (void *)swift_task_alloc(dword_10005262C);
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v12;
  *uint64_t v12 = v2;
  v12[1] = sub_10001D6FC;
  return sub_100028E08(a1, v7, v8, v9, v10, v11, v4, v5);
}

uint64_t sub_100029848()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_100029874()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc(dword_10005263C);
  *(void *)(v1 + swift_unknownObjectWeakDestroy(v0 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_10001D6FC;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_100052638 + dword_100052638))(v2, v3);
}

uint64_t sub_1000298E0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc(dword_100052654);
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10001D4E4;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100052650 + dword_100052650))( a1,  v4,  v5,  v6);
}

uint64_t sub_100029964(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc(dword_10005265C);
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_10001D6FC;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100052658 + dword_100052658))(a1, v4);
}

uint64_t sub_1000299D4()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_1000299F8()
{
  uint64_t v2 = (void *)swift_task_alloc(dword_10005266C);
  *(void *)(v1 + swift_unknownObjectWeakDestroy(v0 + 16) = v2;
  void *v2 = v1;
  v2[1] = sub_10001D6FC;
  v2[5] = v0;
  return swift_task_switch(sub_100027A80, 0LL, 0LL);
}

uint64_t sub_100029A54()
{
  uint64_t v2 = (void *)swift_task_alloc(dword_10005268C);
  *(void *)(v1 + swift_unknownObjectWeakDestroy(v0 + 16) = v2;
  void *v2 = v1;
  v2[1] = sub_10001D6FC;
  v2[5] = v0;
  return swift_task_switch(sub_1000274DC, 0LL, 0LL);
}

uint64_t sub_100029AB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v28 = a1;
  uint64_t v7 = type metadata accessor for XPCActivity.Criteria.Options(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for XPCActivity.Priority(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = type metadata accessor for XPCActivity.Criteria(0LL);
  uint64_t v26 = *(void *)(v15 - 8);
  uint64_t v27 = v15;
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  *(void *)(v4 + swift_unknownObjectWeakDestroy(v0 + 16) = a2;
  *(void *)(v4 + 24) = a3;
  (*(void (**)(char *, void, uint64_t))(v12 + 104))( v14,  enum case for XPCActivity.Priority.maintenance(_:),  v11);
  uint64_t v18 = sub_10001B6BC(&qword_1000526B0);
  uint64_t v19 = swift_allocObject( v18,  ((*(unsigned __int8 *)(v8 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))
        + 2LL * *(void *)(v8 + 72),
          *(unsigned __int8 *)(v8 + 80) | 7LL);
  *(_OWORD *)(v19 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_100035870;
  uint64_t v20 = swift_retain(a3);
  uint64_t v21 = static XPCActivity.Criteria.Options.requiresNetwork.getter(v20);
  static XPCActivity.Criteria.Options.allowBattery.getter(v21);
  uint64_t v29 = v19;
  uint64_t v22 = sub_10001BA20( &qword_1000526B8,  (uint64_t (*)(uint64_t))&type metadata accessor for XPCActivity.Criteria.Options,  (uint64_t)&protocol conformance descriptor for XPCActivity.Criteria.Options);
  uint64_t v23 = sub_10001B6BC(&qword_1000526C0);
  uint64_t v24 = sub_100029CC8(&qword_1000526C8, &qword_1000526C0, (uint64_t)&protocol conformance descriptor for [A]);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v29, v23, v24, v7, v22);
  XPCActivity.Criteria.init(priority:repeating:delay:gracePeriod:interval:options:)(v14, 1LL, v28, 1800LL, v28, v10);
  (*(void (**)(uint64_t, char *, uint64_t))(v26 + 32))(v4 + qword_1000534F8, v17, v27);
  return v4;
}

uint64_t sub_100029CC8(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = sub_10001B748(a2);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_100029D08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return swift_getGenericMetadata(a1, v6, a5);
}

void sub_100029D48(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 description]);
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to fetch family circle with error: %@, Returning cached info.",  (uint8_t *)&v4,  0xCu);
}

void sub_100029DDC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Missing basic auth header, bailing.", v1, 2u);
}

void sub_100029E1C(uint64_t a1, os_log_s *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "BEGIN [%lld]: FetchFamilyCircleRequest  enableTelemetry=YES ",  (uint8_t *)&v2,  0xCu);
}

void sub_100029E90(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "store front is %@.", (uint8_t *)&v2, 0xCu);
  sub_100005614();
}

void sub_100029F00( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100029F64( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100029FCC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Expected Preset is nil", v1, 2u);
}

void sub_10002A00C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "FAActivityManager OS update activity completed",  v1,  2u);
}

void sub_10002A04C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "failed to write cache to %@: %@.",  (uint8_t *)&v3,  0x16u);
  sub_100005614();
}

void sub_10002A0CC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002A134( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002A19C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002A200( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002A234( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000085B8((void *)&_mh_execute_header, a1, a3, "DSID == nil", a5, a6, a7, a8, 0);
}

void sub_10002A268( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002A2CC(void *a1, os_log_s *a2)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue([a1 description]);
  int v4 = 138412290;
  __int16 v5 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to fetch family followup with error: %@",  (uint8_t *)&v4,  0xCu);
}

void sub_10002A360(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "FAHeartbeatActivity failed to checkIn: %@",  (uint8_t *)&v2,  0xCu);
}

void sub_10002A3D4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002A440(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Could not convert push message body to JSON. Error: %@. Body: %@",  (uint8_t *)&v3,  0x16u);
}

void sub_10002A4C4(uint64_t a1, void *a2, os_log_s *a3)
{
  __int16 v5 = (void *)objc_claimAutoreleasedReturnValue([a2 description]);
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Failed to fetch valid APS environment (%@) from server with error: %@, falling back to Prod.",  (uint8_t *)&v6,  0x16u);
}

void sub_10002A574(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid message received. Ignoring.", v1, 2u);
}

void sub_10002A5B4(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
}

void sub_10002A628(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Push missing some required info.", v1, 2u);
}

void sub_10002A668()
{
}

void sub_10002A6D4()
{
}

void sub_10002A740(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Found contact image.", v1, 2u);
}

void sub_10002A780(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to fetch image from cache error: %@",  (uint8_t *)&v2,  0xCu);
}

void sub_10002A7F4(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "No DSID present, no family member to match",  v1,  2u);
}

void sub_10002A834(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  __int16 v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) dsid]);
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Failed to fetch image for member: %@, error: %@",  (uint8_t *)&v6,  0x16u);
}

uint64_t sub_10002A8E4()
{
  uint64_t v0 = abort_report_np("Unable to find class %s", "UIScreen");
  return sub_10002A908(v0);
}

void sub_10002A908()
{
}

void sub_10002A968()
{
}

void sub_10002A9C8()
{
}

void sub_10002AA28()
{
}

void sub_10002AA88()
{
}

void sub_10002AAF4(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315138;
  uint64_t v4 = "-[FamilyCircleServiceDelegate updateFamilyMemberFlagWithDSID:ephemeralAuthResults:flag:enabled:replyBlock:]_block_invoke";
  sub_100013CF4( (void *)&_mh_execute_header,  a1,  a3,  "%s ephemeralAuthResults is nil using default signer.",  (uint8_t *)&v3);
}

void sub_10002AB6C(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315138;
  uint64_t v4 = "-[FamilyCircleServiceDelegate updateFamilyMemberFlagWithDSID:ephemeralAuthResults:flag:enabled:replyBlock:]_block_invoke";
  sub_100013CF4((void *)&_mh_execute_header, a1, a3, "%s using ephemeralAuth signer.", (uint8_t *)&v3);
}

void sub_10002ABE4(void *a1, os_log_s *a2)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue([a1 description]);
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Error while cleaning up pending CFUs: %@",  (uint8_t *)&v4,  0xCu);

  sub_100013D14();
}

void sub_10002AC70()
{
}

void sub_10002AC9C()
{
}

void sub_10002ACC8()
{
}

void sub_10002ACF4(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 debugDescription]);
  int v5 = 138412290;
  uint8_t v6 = v3;
  sub_100013CF4( (void *)&_mh_execute_header,  a2,  v4,  "Failed to complete heartbeat operation with error: %@",  (uint8_t *)&v5);

  sub_100013D14();
}

void sub_10002AD78()
{
}

void sub_10002ADA4(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = a1;
  sub_100015644( (void *)&_mh_execute_header,  a2,  a3,  "Call to fetch URL for photos cache provided error: %@",  (uint8_t *)&v3);
  sub_100005614();
}

void sub_10002AE0C(uint64_t a1, os_log_s *a2, double a3)
{
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "END [%lld] %fs:LoadFamilyPhotoCache ",  (uint8_t *)&v3,  0x16u);
  sub_100005614();
}

void sub_10002AE88(uint64_t a1, os_log_s *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "BEGIN [%lld]: LoadFamilyPhotoCache ",  (uint8_t *)&v2,  0xCu);
  sub_100005614();
}

void sub_10002AEF8(uint64_t a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) altDSID]);
  int v5 = 138412290;
  double v6 = v3;
  sub_100015644((void *)&_mh_execute_header, a2, v4, "Error updating photo cache for member %@", (uint8_t *)&v5);
}

void sub_10002AF88( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002AFEC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002B054(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 description]);
  int v4 = 138412290;
  int v5 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to fetch family push details with error: %@",  (uint8_t *)&v4,  0xCu);
}

void sub_10002B0E8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002B11C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002B150(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 description]);
  int v4 = 138412290;
  int v5 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to parse response data with error: %@",  (uint8_t *)&v4,  0xCu);
}

void sub_10002B1E4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "FAPushDetailResponse responseData is nil",  v1,  2u);
}

void sub_10002B224( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002B258( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002B28C(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  int v4 = 138412290;
  int v5 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Error fetching family circle from server upon family change push %@",  (uint8_t *)&v4,  0xCu);
}

void sub_10002B320(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%@ deallocated", (uint8_t *)&v2, 0xCu);
}

void sub_10002B394()
{
  uint64_t v0 = abort_report_np("Unable to find class %s", "CNMonogrammer");
  dispatch thunk of JSONDecoder.decode<A>(_:from:)(v0);
}

id objc_msgSend_HTTPResponse(void *a1, const char *a2, ...)
{
  return _[a1 HTTPResponse];
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:");
}

id objc_msgSend_URLForDirectory_inDomain_appropriateForURL_create_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLForDirectory:inDomain:appropriateForURL:create:error:");
}

id objc_msgSend_URLForEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLForEndpoint:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend_XPCInterface(void *a1, const char *a2, ...)
{
  return _[a1 XPCInterface];
}

id objc_msgSend__accountStore(void *a1, const char *a2, ...)
{
  return _[a1 _accountStore];
}

id objc_msgSend__addBodyToRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addBodyToRequest:");
}

id objc_msgSend__addHeadersToRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addHeadersToRequest:");
}

id objc_msgSend__BOOLeanValueOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_BOOLeanValueOfObject:");
}

id objc_msgSend__buildActivationURLWithResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_buildActivationURLWithResponse:");
}

id objc_msgSend__cacheDataWithFamilyCircle_serverTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cacheDataWithFamilyCircle:serverTag:");
}

id objc_msgSend__cacheDirectoryURLWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cacheDirectoryURLWithError:");
}

id objc_msgSend__cacheURL(void *a1, const char *a2, ...)
{
  return _[a1 _cacheURL];
}

id objc_msgSend__cacheURLWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cacheURLWithError:");
}

id objc_msgSend__callCompletionWithResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_callCompletionWithResponse:");
}

id objc_msgSend__checkAndDeferActivityIfNeeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkAndDeferActivityIfNeeded:");
}

id objc_msgSend__convertServerResponse_toFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_convertServerResponse:toFormat:");
}

id objc_msgSend__createCacheFile(void *a1, const char *a2, ...)
{
  return _[a1 _createCacheFile];
}

id objc_msgSend__currentPresets_expectedPreset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_currentPresets:expectedPreset:");
}

id objc_msgSend__deliverNotificationWithResponse_payload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deliverNotificationWithResponse:payload:");
}

id objc_msgSend__endpoint(void *a1, const char *a2, ...)
{
  return _[a1 _endpoint];
}

id objc_msgSend__faCircularImageDataWithDiameter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_faCircularImageDataWithDiameter:");
}

id objc_msgSend__familyGrandSlamSignerWithAccountStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_familyGrandSlamSignerWithAccountStore:");
}

id objc_msgSend__fetchCircleRequestWithCacheResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchCircleRequestWithCacheResponse:");
}

id objc_msgSend__fetchData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchData:");
}

id objc_msgSend__fetchFamilyCircleWithCachePolicy_signedInAccountShouldBeApprover_clientProcess_context_promptUserToResolveAuthenticatonFailure_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "_fetchFamilyCircleWithCachePolicy:signedInAccountShouldBeApprover:clientProcess:context:promptUserToResolveAu thenticatonFailure:");
}

id objc_msgSend__flagKey(void *a1, const char *a2, ...)
{
  return _[a1 _flagKey];
}

id objc_msgSend__flagType(void *a1, const char *a2, ...)
{
  return _[a1 _flagType];
}

id objc_msgSend__followupIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 _followupIdentifiers];
}

id objc_msgSend__getParamsForInviteFromResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getParamsForInviteFromResponse:");
}

id objc_msgSend__grandSlamAccountForAccountStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_grandSlamAccountForAccountStore:");
}

id objc_msgSend__grandSlamSignerWithAccountStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_grandSlamSignerWithAccountStore:");
}

id objc_msgSend__isCacheDate_pastDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isCacheDate:pastDuration:");
}

id objc_msgSend__isCacheValid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isCacheValid:");
}

id objc_msgSend__isCapableOfRecomendingMembers(void *a1, const char *a2, ...)
{
  return _[a1 _isCapableOfRecomendingMembers];
}

id objc_msgSend__isFamilyCircleFresh_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isFamilyCircleFresh:");
}

id objc_msgSend__mediaAltDSID(void *a1, const char *a2, ...)
{
  return _[a1 _mediaAltDSID];
}

id objc_msgSend__monogramForContact_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_monogramForContact:");
}

id objc_msgSend__monogramWithFirstName_lastName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_monogramWithFirstName:lastName:");
}

id objc_msgSend__networkService(void *a1, const char *a2, ...)
{
  return _[a1 _networkService];
}

id objc_msgSend__onQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onQueue:");
}

id objc_msgSend__presetsWithCurrentConfiguration_expectedPreset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presetsWithCurrentConfiguration:expectedPreset:");
}

id objc_msgSend__primaryAccount(void *a1, const char *a2, ...)
{
  return _[a1 _primaryAccount];
}

id objc_msgSend__qosClassForOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_qosClassForOptions:");
}

id objc_msgSend__recommendedMembers(void *a1, const char *a2, ...)
{
  return _[a1 _recommendedMembers];
}

id objc_msgSend__refetchFamilyWithNetworkService_familyRefreshActivityScheduler_context_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_refetchFamilyWithNetworkService:familyRefreshActivityScheduler:context:completion:");
}

id objc_msgSend__renewCredentials(void *a1, const char *a2, ...)
{
  return _[a1 _renewCredentials];
}

id objc_msgSend__serverResponse(void *a1, const char *a2, ...)
{
  return _[a1 _serverResponse];
}

id objc_msgSend__setEnabledTopics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setEnabledTopics:");
}

id objc_msgSend__shouldFetchFromServer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldFetchFromServer:");
}

id objc_msgSend__signedInAccountMatchesApproverRequirementsFromCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_signedInAccountMatchesApproverRequirementsFromCache:");
}

id objc_msgSend__userActionWithInviteStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_userActionWithInviteStatus:");
}

id objc_msgSend__username(void *a1, const char *a2, ...)
{
  return _[a1 _username];
}

id objc_msgSend_aa_addBasicAuthorizationHeaderWithAccount_preferUsingPassword_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:");
}

id objc_msgSend_aa_addLoggedInAppleIDHeaderWithAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_addLoggedInAppleIDHeaderWithAccount:");
}

id objc_msgSend_aa_appleAccountWithAltDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_appleAccountWithAltDSID:");
}

id objc_msgSend_aa_appleAccountWithPersonID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_appleAccountWithPersonID:");
}

id objc_msgSend_aa_grandSlamAccountForiCloudAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_grandSlamAccountForiCloudAccount:");
}

id objc_msgSend_aa_isAccountClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_isAccountClass:");
}

id objc_msgSend_aa_personID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_personID");
}

id objc_msgSend_aa_primaryAppleAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_primaryAppleAccount");
}

id objc_msgSend_aa_setBodyWithParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_setBodyWithParameters:");
}

id objc_msgSend_abbreviation(void *a1, const char *a2, ...)
{
  return _[a1 abbreviation];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _[a1 absoluteString];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return _[a1 account];
}

id objc_msgSend_accountSigner(void *a1, const char *a2, ...)
{
  return _[a1 accountSigner];
}

id objc_msgSend_activateWithContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateWithContext:");
}

id objc_msgSend_activeBundleIDs(void *a1, const char *a2, ...)
{
  return _[a1 activeBundleIDs];
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addFresnoPayloadToRequest_additionalPayload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addFresnoPayloadToRequest:additionalPayload:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_addValue_forHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addValue:forHTTPHeaderField:");
}

id objc_msgSend_age(void *a1, const char *a2, ...)
{
  return _[a1 age];
}

id objc_msgSend_aida_accountForiCloudAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aida_accountForiCloudAccount:");
}

id objc_msgSend_ak_addAnisetteHeaders(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ak_addAnisetteHeaders");
}

id objc_msgSend_ak_addClientInfoHeader(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ak_addClientInfoHeader");
}

id objc_msgSend_ak_addDeviceUDIDHeader(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ak_addDeviceUDIDHeader");
}

id objc_msgSend_ak_addInternalBuildHeader(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ak_addInternalBuildHeader");
}

id objc_msgSend_all_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "all:");
}

id objc_msgSend_allHTTPHeaderFields(void *a1, const char *a2, ...)
{
  return _[a1 allHTTPHeaderFields];
}

id objc_msgSend_allHeaderFields(void *a1, const char *a2, ...)
{
  return _[a1 allHeaderFields];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allowedAppStoreRating(void *a1, const char *a2, ...)
{
  return _[a1 allowedAppStoreRating];
}

id objc_msgSend_allowedMovieRating(void *a1, const char *a2, ...)
{
  return _[a1 allowedMovieRating];
}

id objc_msgSend_allowedTVRating(void *a1, const char *a2, ...)
{
  return _[a1 allowedTVRating];
}

id objc_msgSend_altDSID(void *a1, const char *a2, ...)
{
  return _[a1 altDSID];
}

id objc_msgSend_ams_activeiTunesAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_activeiTunesAccount");
}

id objc_msgSend_ams_altDSID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_altDSID");
}

id objc_msgSend_ams_sharedAccountStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_sharedAccountStore");
}

id objc_msgSend_anonymousListener(void *a1, const char *a2, ...)
{
  return _[a1 anonymousListener];
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appleAccount(void *a1, const char *a2, ...)
{
  return _[a1 appleAccount];
}

id objc_msgSend_apsEnvironment(void *a1, const char *a2, ...)
{
  return _[a1 apsEnvironment];
}

id objc_msgSend_areMusicVideosAllowed(void *a1, const char *a2, ...)
{
  return _[a1 areMusicVideosAllowed];
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attributesOfItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributesOfItemAtPath:error:");
}

id objc_msgSend_availablePresets(void *a1, const char *a2, ...)
{
  return _[a1 availablePresets];
}

id objc_msgSend_backgroundType(void *a1, const char *a2, ...)
{
  return _[a1 backgroundType];
}

id objc_msgSend_bagForProfile_profileVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bagForProfile:profileVersion:");
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_body(void *a1, const char *a2, ...)
{
  return _[a1 body];
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_broadcastFamilyChangedNotification(void *a1, const char *a2, ...)
{
  return _[a1 broadcastFamilyChangedNotification];
}

id objc_msgSend_broadcastServicesChangedNotification(void *a1, const char *a2, ...)
{
  return _[a1 broadcastServicesChangedNotification];
}

id objc_msgSend_buildNotificationWithResponse_payload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buildNotificationWithResponse:payload:");
}

id objc_msgSend_cache(void *a1, const char *a2, ...)
{
  return _[a1 cache];
}

id objc_msgSend_cacheDate(void *a1, const char *a2, ...)
{
  return _[a1 cacheDate];
}

id objc_msgSend_cachePolicy(void *a1, const char *a2, ...)
{
  return _[a1 cachePolicy];
}

id objc_msgSend_cachePolicyString(void *a1, const char *a2, ...)
{
  return _[a1 cachePolicyString];
}

id objc_msgSend_cacheQueue(void *a1, const char *a2, ...)
{
  return _[a1 cacheQueue];
}

id objc_msgSend_cacheScreenTimeSettingsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cacheScreenTimeSettingsObject:");
}

id objc_msgSend_cachedFamilyCircle(void *a1, const char *a2, ...)
{
  return _[a1 cachedFamilyCircle];
}

id objc_msgSend_cancelChildTransferWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelChildTransferWithCompletionHandler:");
}

id objc_msgSend_cancelInvitation(void *a1, const char *a2, ...)
{
  return _[a1 cancelInvitation];
}

id objc_msgSend_catch(void *a1, const char *a2, ...)
{
  return _[a1 catch];
}

id objc_msgSend_catchOnQueue(void *a1, const char *a2, ...)
{
  return _[a1 catchOnQueue];
}

id objc_msgSend_checkResourceIsReachableAndReturnError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkResourceIsReachableAndReturnError:");
}

id objc_msgSend_checkin(void *a1, const char *a2, ...)
{
  return _[a1 checkin];
}

id objc_msgSend_checkinWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkinWithCompletionHandler:");
}

id objc_msgSend_checkinXPCActivities(void *a1, const char *a2, ...)
{
  return _[a1 checkinXPCActivities];
}

id objc_msgSend_childFirstName(void *a1, const char *a2, ...)
{
  return _[a1 childFirstName];
}

id objc_msgSend_childLastName(void *a1, const char *a2, ...)
{
  return _[a1 childLastName];
}

id objc_msgSend_circularImageData_withDiameter_crop_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "circularImageData:withDiameter:crop:");
}

id objc_msgSend_clearPendingFollowUpItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearPendingFollowUpItems:");
}

id objc_msgSend_clientProcess(void *a1, const char *a2, ...)
{
  return _[a1 clientProcess];
}

id objc_msgSend_coalesceQueue(void *a1, const char *a2, ...)
{
  return _[a1 coalesceQueue];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_componentsWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsWithString:");
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return _[a1 configuration];
}

id objc_msgSend_contact(void *a1, const char *a2, ...)
{
  return _[a1 contact];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return _[a1 context];
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

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_cropRect(void *a1, const char *a2, ...)
{
  return _[a1 cropRect];
}

id objc_msgSend_currentConfigurationForDSID_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentConfigurationForDSID:completion:");
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return _[a1 currentLocale];
}

id objc_msgSend_dataRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 dataRepresentation];
}

id objc_msgSend_dataTaskWithRequest_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataTaskWithRequest:completion:");
}

id objc_msgSend_dataWithContentsOfFile_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfFile:options:error:");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_dataWithRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithRequest:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateByAddingTimeInterval:");
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return _[a1 debugDescription];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return _[a1 defaultStore];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _[a1 defaultWorkspace];
}

id objc_msgSend_deleteFamily(void *a1, const char *a2, ...)
{
  return _[a1 deleteFamily];
}

id objc_msgSend_deliverNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deliverNotification:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_deviceInfo(void *a1, const char *a2, ...)
{
  return _[a1 deviceInfo];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_dsid(void *a1, const char *a2, ...)
{
  return _[a1 dsid];
}

id objc_msgSend_eligibilityRequirements(void *a1, const char *a2, ...)
{
  return _[a1 eligibilityRequirements];
}

id objc_msgSend_email(void *a1, const char *a2, ...)
{
  return _[a1 email];
}

id objc_msgSend_endpoint(void *a1, const char *a2, ...)
{
  return _[a1 endpoint];
}

id objc_msgSend_ensureAccount(void *a1, const char *a2, ...)
{
  return _[a1 ensureAccount];
}

id objc_msgSend_ensureDeviceUnlockedSinceBoot(void *a1, const char *a2, ...)
{
  return _[a1 ensureDeviceUnlockedSinceBoot];
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return _[a1 error];
}

id objc_msgSend_errorWithCachedFamilyCircle_underlyingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithCachedFamilyCircle:underlyingError:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_event(void *a1, const char *a2, ...)
{
  return _[a1 event];
}

id objc_msgSend_expectedMediaAltDSID(void *a1, const char *a2, ...)
{
  return _[a1 expectedMediaAltDSID];
}

id objc_msgSend_expiration(void *a1, const char *a2, ...)
{
  return _[a1 expiration];
}

id objc_msgSend_fa_familyErrorWithCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fa_familyErrorWithCode:");
}

id objc_msgSend_fa_firstObjectMatching_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fa_firstObjectMatching:");
}

id objc_msgSend_fa_map_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fa_map:");
}

id objc_msgSend_fa_queryItemsDictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fa_queryItemsDictionary");
}

id objc_msgSend_familyChecklistRankingConfigWith_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "familyChecklistRankingConfigWith:completionHandler:");
}

id objc_msgSend_familyCircle(void *a1, const char *a2, ...)
{
  return _[a1 familyCircle];
}

id objc_msgSend_familyCircleIfFresh(void *a1, const char *a2, ...)
{
  return _[a1 familyCircleIfFresh];
}

id objc_msgSend_familyCircleProvider(void *a1, const char *a2, ...)
{
  return _[a1 familyCircleProvider];
}

id objc_msgSend_familyCircleValidatingAgeWithDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "familyCircleValidatingAgeWithDate:");
}

id objc_msgSend_familyCircleWithServerResponse_responseHeaders_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "familyCircleWithServerResponse:responseHeaders:completion:");
}

id objc_msgSend_familyID(void *a1, const char *a2, ...)
{
  return _[a1 familyID];
}

id objc_msgSend_familyName(void *a1, const char *a2, ...)
{
  return _[a1 familyName];
}

id objc_msgSend_familyNotifier(void *a1, const char *a2, ...)
{
  return _[a1 familyNotifier];
}

id objc_msgSend_familyRefreshActivityScheduler(void *a1, const char *a2, ...)
{
  return _[a1 familyRefreshActivityScheduler];
}

id objc_msgSend_familyRefreshTriggered(void *a1, const char *a2, ...)
{
  return _[a1 familyRefreshTriggered];
}

id objc_msgSend_fetchAAURLConfigurationWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAAURLConfigurationWithCompletion:");
}

id objc_msgSend_fetchCachedPhotoForFamilyMember_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchCachedPhotoForFamilyMember:");
}

id objc_msgSend_fetchCircleFromServerWithCacheResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchCircleFromServerWithCacheResponse:");
}

id objc_msgSend_fetchCurrentStoreFront(void *a1, const char *a2, ...)
{
  return _[a1 fetchCurrentStoreFront];
}

id objc_msgSend_fetchEligibilityForPropertyName_bundleID_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchEligibilityForPropertyName:bundleID:completion:");
}

id objc_msgSend_fetchFamilyCircle(void *a1, const char *a2, ...)
{
  return _[a1 fetchFamilyCircle];
}

id objc_msgSend_fetchFamilyCircleWithCachePolicy_signedInAccountShouldBeApprover_context_options_replyBlock_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "fetchFamilyCircleWithCachePolicy:signedInAccountShouldBeApprover:context:options:replyBlock:");
}

id objc_msgSend_fetchFamilyFactory(void *a1, const char *a2, ...)
{
  return _[a1 fetchFamilyFactory];
}

id objc_msgSend_fetchFamilyMemberSuggestions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchFamilyMemberSuggestions:");
}

id objc_msgSend_fetchFollowUps(void *a1, const char *a2, ...)
{
  return _[a1 fetchFollowUps];
}

id objc_msgSend_fetchHeartbeatData(void *a1, const char *a2, ...)
{
  return _[a1 fetchHeartbeatData];
}

id objc_msgSend_fetchPhoto(void *a1, const char *a2, ...)
{
  return _[a1 fetchPhoto];
}

id objc_msgSend_fetchRemotePhotoForFamilyMember_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchRemotePhotoForFamilyMember:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_firstName(void *a1, const char *a2, ...)
{
  return _[a1 firstName];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_fullname(void *a1, const char *a2, ...)
{
  return _[a1 fullname];
}

id objc_msgSend_getBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBytes:length:");
}

id objc_msgSend_getFamilyPushDetailsURL(void *a1, const char *a2, ...)
{
  return _[a1 getFamilyPushDetailsURL];
}

id objc_msgSend_getValue_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getValue:size:");
}

id objc_msgSend_givenName(void *a1, const char *a2, ...)
{
  return _[a1 givenName];
}

id objc_msgSend_gsAccount(void *a1, const char *a2, ...)
{
  return _[a1 gsAccount];
}

id objc_msgSend_handleAccountAddition_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleAccountAddition:completion:");
}

id objc_msgSend_handleAccountDeletion_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleAccountDeletion:completion:");
}

id objc_msgSend_handleDidReceivePushEventWithNetworkService_familyRefreshActivityScheduler_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleDidReceivePushEventWithNetworkService:familyRefreshActivityScheduler:completion:");
}

id objc_msgSend_handleDidRemoveMemberWithNetworkService_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleDidRemoveMemberWithNetworkService:completion:");
}

id objc_msgSend_handleDidUpdateMemberFlagWithNetworkService_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleDidUpdateMemberFlagWithNetworkService:completion:");
}

id objc_msgSend_handleURLResponse_networkService_familyRefreshActivityScheduler_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleURLResponse:networkService:familyRefreshActivityScheduler:completion:");
}

id objc_msgSend_hasRecommendedMembers(void *a1, const char *a2, ...)
{
  return _[a1 hasRecommendedMembers];
}

id objc_msgSend_hashedDSID(void *a1, const char *a2, ...)
{
  return _[a1 hashedDSID];
}

id objc_msgSend_httpResponse(void *a1, const char *a2, ...)
{
  return _[a1 httpResponse];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_inFlightRequests(void *a1, const char *a2, ...)
{
  return _[a1 inFlightRequests];
}

id objc_msgSend_initWithAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:");
}

id objc_msgSend_initWithAccount_deviceInfo_urlProvider_urlSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:deviceInfo:urlProvider:urlSession:");
}

id objc_msgSend_initWithAccount_deviceInfo_urlProvider_urlSession_familyRefreshActivityScheduler_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:deviceInfo:urlProvider:urlSession:familyRefreshActivityScheduler:");
}

id objc_msgSend_initWithAccountStore_grandSlamAccount_appTokenID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccountStore:grandSlamAccount:appTokenID:");
}

id objc_msgSend_initWithAltDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAltDSID:");
}

id objc_msgSend_initWithAppleAccount_grandSlamAccount_accountStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAppleAccount:grandSlamAccount:accountStore:");
}

id objc_msgSend_initWithAvailablePresets_expectedPreset_currentPreset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAvailablePresets:expectedPreset:currentPreset:");
}

id objc_msgSend_initWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBlock:");
}

id objc_msgSend_initWithCachedFamilyCircle_underlyingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCachedFamilyCircle:underlyingError:");
}

id objc_msgSend_initWithClientIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithClientIdentifier:");
}

id objc_msgSend_initWithDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDSID:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithEnvironmentName_namedDelegatePort_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEnvironmentName:namedDelegatePort:queue:");
}

id objc_msgSend_initWithEphemeralAuthResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEphemeralAuthResults:");
}

id objc_msgSend_initWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithError:");
}

id objc_msgSend_initWithFamilyCircle_serverTag_cacheDate_maxAge_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFamilyCircle:serverTag:cacheDate:maxAge:");
}

id objc_msgSend_initWithFamilyCircleFetchBlock_cacheLoadBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFamilyCircleFetchBlock:cacheLoadBlock:");
}

id objc_msgSend_initWithFamilyCircleProvider_fetchFromCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFamilyCircleProvider:fetchFromCache:");
}

id objc_msgSend_initWithFamilyCircleProvider_presetsProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFamilyCircleProvider:presetsProvider:");
}

id objc_msgSend_initWithHTTPResponse_body_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHTTPResponse:body:");
}

id objc_msgSend_initWithHTTPResponse_body_familyRefreshTriggered_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHTTPResponse:body:familyRefreshTriggered:");
}

id objc_msgSend_initWithHeartbeatActivityHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHeartbeatActivityHandler:");
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:");
}

id objc_msgSend_initWithIdentifier_machServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:machServiceName:");
}

id objc_msgSend_initWithLoadSuccess_error_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLoadSuccess:error:userInfo:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMessage:");
}

id objc_msgSend_initWithMessage_accountStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMessage:accountStore:");
}

id objc_msgSend_initWithName_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:value:");
}

id objc_msgSend_initWithNetworkService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNetworkService:");
}

id objc_msgSend_initWithNetworkService_accountSigner_memberDSID_flag_enabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNetworkService:accountSigner:memberDSID:flag:enabled:");
}

id objc_msgSend_initWithNetworkService_cache_marqueeCacheHanlder_requestCoalescer_familyRefreshActivityScheduler_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithNetworkService:cache:marqueeCacheHanlder:requestCoalescer:familyRefreshActivityScheduler:");
}

id objc_msgSend_initWithNetworkService_cache_marqueeCacheHanlder_requestCoalescer_familyRefreshActivityScheduler_rateLimiter_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithNetworkService:cache:marqueeCacheHanlder:requestCoalescer:familyRefreshActivityScheduler:rateLimiter:");
}

id objc_msgSend_initWithNetworkService_cache_storeFrontProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNetworkService:cache:storeFrontProvider:");
}

id objc_msgSend_initWithNetworkService_dsidOfMemberToRemove_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNetworkService:dsidOfMemberToRemove:");
}

id objc_msgSend_initWithNetworkService_email_familyID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNetworkService:email:familyID:");
}

id objc_msgSend_initWithNetworkService_grandSlamSigner_familyGrandSlamSigner_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNetworkService:grandSlamSigner:familyGrandSlamSigner:");
}

id objc_msgSend_initWithNetworkService_grandSlamSigner_familyGrandSlamSigner_email_isResend_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNetworkService:grandSlamSigner:familyGrandSlamSigner:email:isResend:");
}

id objc_msgSend_initWithNetworkService_grandSlamSigner_familyGrandSlamSigner_memberDSID_flag_enabled_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNetworkService:grandSlamSigner:familyGrandSlamSigner:memberDSID:flag:enabled:");
}

id objc_msgSend_initWithNetworkService_grandSlamSigner_familyGrandSlamSigner_memberDSID_flags_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNetworkService:grandSlamSigner:familyGrandSlamSigner:memberDSID:flags:");
}

id objc_msgSend_initWithNetworkService_inviteCode_inviteStatus_responseFormat_additionalRequestParameters_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNetworkService:inviteCode:inviteStatus:responseFormat:additionalRequestParameters:");
}

id objc_msgSend_initWithNetworkService_memberDSID_memberHashedDSID_size_localFallback_context_requestCoalescer_fetchFamilyFactory_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithNetworkService:memberDSID:memberHashedDSID:size:localFallback:context:requestCoalescer:fetchFamilyFactory:");
}

id objc_msgSend_initWithNetworkService_pushToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNetworkService:pushToken:");
}

id objc_msgSend_initWithNetworkService_storeFrontProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNetworkService:storeFrontProvider:");
}

id objc_msgSend_initWithQueue_requirements_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:requirements:");
}

id objc_msgSend_initWithQueueProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueueProvider:");
}

id objc_msgSend_initWithServerResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithServerResponse:");
}

id objc_msgSend_initWithServiceName_viewControllerClassName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithServiceName:viewControllerClassName:");
}

id objc_msgSend_initWithStream_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStream:delegate:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithStyle_diameter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStyle:diameter:");
}

id objc_msgSend_initWithURL_resolvingAgainstBaseURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:resolvingAgainstBaseURL:");
}

id objc_msgSend_initWithValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithValue:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invalidateFamilyPhotos(void *a1, const char *a2, ...)
{
  return _[a1 invalidateFamilyPhotos];
}

id objc_msgSend_inviteCode(void *a1, const char *a2, ...)
{
  return _[a1 inviteCode];
}

id objc_msgSend_inviteStatus(void *a1, const char *a2, ...)
{
  return _[a1 inviteStatus];
}

id objc_msgSend_isAllowedWithClientName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAllowedWithClientName:");
}

id objc_msgSend_isDeletingAppsAllowed(void *a1, const char *a2, ...)
{
  return _[a1 isDeletingAppsAllowed];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isExplicitMediaAllowed(void *a1, const char *a2, ...)
{
  return _[a1 isExplicitMediaAllowed];
}

id objc_msgSend_isMe(void *a1, const char *a2, ...)
{
  return _[a1 isMe];
}

id objc_msgSend_isParent(void *a1, const char *a2, ...)
{
  return _[a1 isParent];
}

id objc_msgSend_isSuccess(void *a1, const char *a2, ...)
{
  return _[a1 isSuccess];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return _[a1 isValid];
}

id objc_msgSend_isValidEnvironment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidEnvironment:");
}

id objc_msgSend_lastName(void *a1, const char *a2, ...)
{
  return _[a1 lastName];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_launchURLFromServer(void *a1, const char *a2, ...)
{
  return _[a1 launchURLFromServer];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_load(void *a1, const char *a2, ...)
{
  return _[a1 load];
}

id objc_msgSend_load_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "load:");
}

id objc_msgSend_loadForURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadForURL:");
}

id objc_msgSend_loadWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadWithError:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _[a1 lowercaseString];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _[a1 mainScreen];
}

id objc_msgSend_marqueeUpdateHandler(void *a1, const char *a2, ...)
{
  return _[a1 marqueeUpdateHandler];
}

id objc_msgSend_maxAge(void *a1, const char *a2, ...)
{
  return _[a1 maxAge];
}

id objc_msgSend_memberForAltDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "memberForAltDSID:");
}

id objc_msgSend_members(void *a1, const char *a2, ...)
{
  return _[a1 members];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return _[a1 message];
}

id objc_msgSend_minAge(void *a1, const char *a2, ...)
{
  return _[a1 minAge];
}

id objc_msgSend_monogramWithBackgroundType_contact_diameter_scale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "monogramWithBackgroundType:contact:diameter:scale:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_networkService(void *a1, const char *a2, ...)
{
  return _[a1 networkService];
}

id objc_msgSend_newHandleWithDefinition_configurationContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newHandleWithDefinition:configurationContext:");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectWithData:");
}

id objc_msgSend_onComplete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "onComplete:");
}

id objc_msgSend_onComplete_onQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "onComplete:onQueue:");
}

id objc_msgSend_openSensitiveURL_withOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openSensitiveURL:withOptions:");
}

id objc_msgSend_organizerEmail(void *a1, const char *a2, ...)
{
  return _[a1 organizerEmail];
}

id objc_msgSend_organizerFirstName(void *a1, const char *a2, ...)
{
  return _[a1 organizerFirstName];
}

id objc_msgSend_organizerLastName(void *a1, const char *a2, ...)
{
  return _[a1 organizerLastName];
}

id objc_msgSend_osUpdatedActivity(void *a1, const char *a2, ...)
{
  return _[a1 osUpdatedActivity];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return _[a1 payload];
}

id objc_msgSend_pendingFollowUpItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pendingFollowUpItems:");
}

id objc_msgSend_pendingInvitesOnly(void *a1, const char *a2, ...)
{
  return _[a1 pendingInvitesOnly];
}

id objc_msgSend_pendingMembers(void *a1, const char *a2, ...)
{
  return _[a1 pendingMembers];
}

id objc_msgSend_performBlockForKey_force_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performBlockForKey:force:block:");
}

id objc_msgSend_performHeartbeatCheckinWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performHeartbeatCheckinWithCompletion:");
}

id objc_msgSend_performRequestWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performRequestWithHandler:");
}

id objc_msgSend_performRequestWithSession_withHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performRequestWithSession:withHandler:");
}

id objc_msgSend_photoData(void *a1, const char *a2, ...)
{
  return _[a1 photoData];
}

id objc_msgSend_plistWithRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "plistWithRequest:");
}

id objc_msgSend_plistWithResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "plistWithResponse:");
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return _[a1 preferredLanguages];
}

id objc_msgSend_presentRemoteUserInterfaceWithOptions_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentRemoteUserInterfaceWithOptions:completion:");
}

id objc_msgSend_presentationCompletion(void *a1, const char *a2, ...)
{
  return _[a1 presentationCompletion];
}

id objc_msgSend_presetsForMemberWithAltDSID_age_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presetsForMemberWithAltDSID:age:");
}

id objc_msgSend_presetsProvider(void *a1, const char *a2, ...)
{
  return _[a1 presetsProvider];
}

id objc_msgSend_process_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "process:");
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _[a1 processInfo];
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return _[a1 processName];
}

id objc_msgSend_promptUserToResolveAuthenticatonFailure(void *a1, const char *a2, ...)
{
  return _[a1 promptUserToResolveAuthenticatonFailure];
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_pushTokenString(void *a1, const char *a2, ...)
{
  return _[a1 pushTokenString];
}

id objc_msgSend_pushTopic(void *a1, const char *a2, ...)
{
  return _[a1 pushTopic];
}

id objc_msgSend_queueProvider(void *a1, const char *a2, ...)
{
  return _[a1 queueProvider];
}

id objc_msgSend_rateLimiter(void *a1, const char *a2, ...)
{
  return _[a1 rateLimiter];
}

id objc_msgSend_recordCallWithClientName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordCallWithClientName:");
}

id objc_msgSend_registerToPDS_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerToPDS:");
}

id objc_msgSend_registerToken(void *a1, const char *a2, ...)
{
  return _[a1 registerToken];
}

id objc_msgSend_removeFamilyInvites_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeFamilyInvites:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeMember(void *a1, const char *a2, ...)
{
  return _[a1 removeMember];
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeRegistrationFromPDS(void *a1, const char *a2, ...)
{
  return _[a1 removeRegistrationFromPDS];
}

id objc_msgSend_removingNonSecureCodingValues(void *a1, const char *a2, ...)
{
  return _[a1 removingNonSecureCodingValues];
}

id objc_msgSend_renewCredentialsForAccount_options_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renewCredentialsForAccount:options:completion:");
}

id objc_msgSend_requestQueueWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestQueueWithOptions:");
}

id objc_msgSend_requestWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithURL:");
}

id objc_msgSend_requirementsForPropertyName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requirementsForPropertyName:");
}

id objc_msgSend_reschedule(void *a1, const char *a2, ...)
{
  return _[a1 reschedule];
}

id objc_msgSend_resendChildTransferWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resendChildTransferWithCompletionHandler:");
}

id objc_msgSend_responseDictionary(void *a1, const char *a2, ...)
{
  return _[a1 responseDictionary];
}

id objc_msgSend_responseFormat(void *a1, const char *a2, ...)
{
  return _[a1 responseFormat];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_runAAFamilyMemberPhotoRequest_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runAAFamilyMemberPhotoRequest:withCompletionHandler:");
}

id objc_msgSend_runFetchFamilyCircleOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runFetchFamilyCircleOperation:");
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _[a1 scale];
}

id objc_msgSend_scheduleWakeupIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 scheduleWakeupIfNeeded];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return _[a1 scheme];
}

id objc_msgSend_screenScale(void *a1, const char *a2, ...)
{
  return _[a1 screenScale];
}

id objc_msgSend_serverEligibility(void *a1, const char *a2, ...)
{
  return _[a1 serverEligibility];
}

id objc_msgSend_serverRequest_toFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverRequest:toFormat:");
}

id objc_msgSend_serverTag(void *a1, const char *a2, ...)
{
  return _[a1 serverTag];
}

id objc_msgSend_setAcceptHeaderForRequest_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAcceptHeaderForRequest:format:");
}

id objc_msgSend_setActivateActionURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivateActionURL:");
}

id objc_msgSend_setBackgroundType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundType:");
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBool:forKey:");
}

id objc_msgSend_setCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCache:");
}

id objc_msgSend_setCachePolicy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachePolicy:");
}

id objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClass:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setClientProcess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientProcess:");
}

id objc_msgSend_setContactType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContactType:");
}

id objc_msgSend_setContentTypeHeaderForRequest_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentTypeHeaderForRequest:format:");
}

id objc_msgSend_setContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContext:");
}

id objc_msgSend_setCustomHeaders_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCustomHeaders:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setEmailAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEmailAddress:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFamilyMemberDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFamilyMemberDSID:");
}

id objc_msgSend_setFamilyName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFamilyName:");
}

id objc_msgSend_setFamilyRefreshActivityScheduler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFamilyRefreshActivityScheduler:");
}

id objc_msgSend_setForcePush_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setForcePush:");
}

id objc_msgSend_setFullname_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFullname:");
}

id objc_msgSend_setGivenName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGivenName:");
}

id objc_msgSend_setHTTPBody_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPBody:");
}

id objc_msgSend_setHTTPMethod_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPMethod:");
}

id objc_msgSend_setHeaderFieldKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHeaderFieldKey:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setInformativeText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInformativeText:");
}

id objc_msgSend_setInteger_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInteger:forKey:");
}

id objc_msgSend_setMonogramDiameter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMonogramDiameter:");
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:atIndexedSubscript:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPhoneNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhoneNumber:");
}

id objc_msgSend_setPresentationCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresentationCompletion:");
}

id objc_msgSend_setPromptUserToResolveAuthenticatonFailure_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPromptUserToResolveAuthenticatonFailure:");
}

id objc_msgSend_setPushPayload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPushPayload:");
}

id objc_msgSend_setPushTopic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPushTopic:");
}

id objc_msgSend_setQueryItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueryItems:");
}

id objc_msgSend_setShouldPersistWhenActivated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldPersistWhenActivated:");
}

id objc_msgSend_setSignedInAccountShouldBeApprover_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSignedInAccountShouldBeApprover:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setURL:");
}

id objc_msgSend_setUseMonogramAsLastResort_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUseMonogramAsLastResort:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setValue_forHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forHTTPHeaderField:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setXpcEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setXpcEndpoint:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedSession(void *a1, const char *a2, ...)
{
  return _[a1 sharedSession];
}

id objc_msgSend_shouldForcePush(void *a1, const char *a2, ...)
{
  return _[a1 shouldForcePush];
}

id objc_msgSend_shouldProcess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldProcess:");
}

id objc_msgSend_showMessage(void *a1, const char *a2, ...)
{
  return _[a1 showMessage];
}

id objc_msgSend_shutdown(void *a1, const char *a2, ...)
{
  return _[a1 shutdown];
}

id objc_msgSend_signURLRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signURLRequest:");
}

id objc_msgSend_signedInAccountShouldBeApprover(void *a1, const char *a2, ...)
{
  return _[a1 signedInAccountShouldBeApprover];
}

id objc_msgSend_signedRequestWithEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signedRequestWithEndpoint:");
}

id objc_msgSend_signedRequestWithEndpoint_method_headers_plistBody_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signedRequestWithEndpoint:method:headers:plistBody:");
}

id objc_msgSend_sources(void *a1, const char *a2, ...)
{
  return _[a1 sources];
}

id objc_msgSend_standardPlistRequestWithEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "standardPlistRequestWithEndpoint:");
}

id objc_msgSend_standardPlistRequestWithEndpoint_method_plistBody_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "standardPlistRequestWithEndpoint:method:plistBody:");
}

id objc_msgSend_standardPlistRequestWithUrl_method_plistBody_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "standardPlistRequestWithUrl:method:plistBody:");
}

id objc_msgSend_standardRequestWithEndpoint_method_plistBody_requestFormat_responseFormat_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "standardRequestWithEndpoint:method:plistBody:requestFormat:responseFormat:");
}

id objc_msgSend_standardRequestWithURL_method_body_requestFormat_responseFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "standardRequestWithURL:method:body:requestFormat:responseFormat:");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return _[a1 statusCode];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return _[a1 stop];
}

id objc_msgSend_storeFrontProvider(void *a1, const char *a2, ...)
{
  return _[a1 storeFrontProvider];
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCapacity:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_synchronizeFollowupWithPayload_altDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchronizeFollowupWithPayload:altDSID:");
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return _[a1 systemTimeZone];
}

id objc_msgSend_then(void *a1, const char *a2, ...)
{
  return _[a1 then];
}

id objc_msgSend_thenOnQueue(void *a1, const char *a2, ...)
{
  return _[a1 thenOnQueue];
}

id objc_msgSend_thumbnailImageData(void *a1, const char *a2, ...)
{
  return _[a1 thumbnailImageData];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceNow];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _[a1 title];
}

id objc_msgSend_topic(void *a1, const char *a2, ...)
{
  return _[a1 topic];
}

id objc_msgSend_underlyingError(void *a1, const char *a2, ...)
{
  return _[a1 underlyingError];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 uniqueIdentifier];
}

id objc_msgSend_unlockedSinceBoot(void *a1, const char *a2, ...)
{
  return _[a1 unlockedSinceBoot];
}

id objc_msgSend_unregister(void *a1, const char *a2, ...)
{
  return _[a1 unregister];
}

id objc_msgSend_updateInviteStatus(void *a1, const char *a2, ...)
{
  return _[a1 updateInviteStatus];
}

id objc_msgSend_updateMarqueeCache(void *a1, const char *a2, ...)
{
  return _[a1 updateMarqueeCache];
}

id objc_msgSend_updateMemberFlag(void *a1, const char *a2, ...)
{
  return _[a1 updateMemberFlag];
}

id objc_msgSend_updateMemberFlags(void *a1, const char *a2, ...)
{
  return _[a1 updateMemberFlags];
}

id objc_msgSend_updateUserDefaultsWithFamilyCircle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateUserDefaultsWithFamilyCircle:");
}

id objc_msgSend_updateWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithData:");
}

id objc_msgSend_updateWithFamilyCircle_serverTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithFamilyCircle:serverTag:");
}

id objc_msgSend_updateWithPresets_requestURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithPresets:requestURL:");
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return _[a1 uppercaseString];
}

id objc_msgSend_urlByAddingParamsToURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "urlByAddingParamsToURL:");
}

id objc_msgSend_urlConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 urlConfiguration];
}

id objc_msgSend_urlDestinationTo_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "urlDestinationTo:error:");
}

id objc_msgSend_urlDestinationTo_params_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "urlDestinationTo:params:error:");
}

id objc_msgSend_urlForEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "urlForEndpoint:");
}

id objc_msgSend_urlProvider(void *a1, const char *a2, ...)
{
  return _[a1 urlProvider];
}

id objc_msgSend_urlRequest(void *a1, const char *a2, ...)
{
  return _[a1 urlRequest];
}

id objc_msgSend_urlSession(void *a1, const char *a2, ...)
{
  return _[a1 urlSession];
}

id objc_msgSend_useMonogramAsLastResort(void *a1, const char *a2, ...)
{
  return _[a1 useMonogramAsLastResort];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_valueWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithCompletion:");
}

id objc_msgSend_values(void *a1, const char *a2, ...)
{
  return _[a1 values];
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToURL:options:error:");
}