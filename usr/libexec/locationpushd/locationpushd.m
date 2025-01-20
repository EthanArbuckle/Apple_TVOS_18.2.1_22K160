NSNotification *sub_100004250()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSNotification *v6;
  v0 = _CFXPCCreateCFObjectFromXPCObject();
  v1 = (void *)objc_claimAutoreleasedReturnValue(v0);
  v2 = v1;
  if (v1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue([v1 objectForKeyedSubscript:@"Name"]);
    v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"Object"]);
    v5 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"UserInfo"]);
    v6 = -[NSNotification initWithName:object:userInfo:]( objc_alloc(&OBJC_CLASS___NSNotification),  "initWithName:object:userInfo:",  v3,  v4,  v5);
  }

  else
  {
    v6 = 0LL;
  }

  return v6;
}

void sub_100004510(uint64_t a1)
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pendingReplies", 0));
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      v6 = 0LL;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8LL * (void)v6) + 16LL))();
        v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v4);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pendingReplies]);
  [v7 removeAllObjects];
}

void sub_1000046BC(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pendingReplies]);
  id v2 = objc_retainBlock(*(id *)(a1 + 40));
  [v3 addObject:v2];
}

void sub_1000047A8(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifier]);
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@.location-query", v2));

  id v3 = (const void *)CPPowerAssertionCreate(v4, 30.0);
  objc_msgSend(*(id *)(a1 + 32), "_extensionQueue_deliverLocationPayloadToExtension:", *(void *)(a1 + 40));
  CFRelease(v3);
}

void sub_100005228(_Unwind_Exception *a1)
{
}

id sub_100005260(uint64_t a1)
{
  if (qword_100010D10 != -1) {
    dispatch_once(&qword_100010D10, &stru_10000C398);
  }
  id v2 = (os_log_s *)qword_100010D18;
  if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Extension will be killed because it used its runtime in starting up",  (uint8_t *)&v5,  0xCu);
  }

  return [*(id *)(a1 + 40) _kill:9];
}

uint64_t sub_100005334(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100005344(uint64_t a1)
{
}

id sub_10000534C(uint64_t a1)
{
  if (qword_100010D10 != -1) {
    dispatch_once(&qword_100010D10, &stru_10000C398);
  }
  id v2 = (os_log_s *)qword_100010D18;
  if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Service extension exceeded allowed time: sessionUUID=%{public}@",  (uint8_t *)&v6,  0x16u);
  }

  return [*(id *)(a1 + 48) cancelExtensionRequestWithIdentifier:*(void *)(a1 + 40)];
}

void sub_100005428(uint64_t a1)
{
  if (qword_100010D10 != -1) {
    dispatch_once(&qword_100010D10, &stru_10000C398);
  }
  id v2 = (void *)qword_100010D18;
  if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    int v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
    uint64_t v6 = *(void *)(a1 + 40);
    int v9 = 138543618;
    __int128 v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Entering grace time: sessionUUID=%{public}@",  (uint8_t *)&v9,  0x16u);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) _auxiliaryConnection]);
  __int16 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 remoteObjectProxy]);
  [v8 serviceExtensionWillTerminate];
}

void sub_100005550(void *a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8LL) + 40LL), a2);
  if (qword_100010D10 != -1) {
    dispatch_once(&qword_100010D10, &stru_10000C398);
  }
  int v5 = (os_log_s *)qword_100010D18;
  if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = a1[4];
    uint64_t v7 = a1[5];
    int v8 = 138543874;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Service extension connection encountered an error: sessionUUID=%{public}@, error=%{public}@",  (uint8_t *)&v8,  0x20u);
  }
}

void sub_100005658(uint64_t a1)
{
  if (qword_100010D10 != -1) {
    dispatch_once(&qword_100010D10, &stru_10000C398);
  }
  id v2 = (os_log_s *)qword_100010D18;
  if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138543618;
    uint64_t v6 = v3;
    __int16 v7 = 2114;
    uint64_t v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Service extension finished: sessionUUID=%{public}@",  (uint8_t *)&v5,  0x16u);
  }
}

void sub_100005904(id a1)
{
  os_log_t v1 = os_log_create("com.apple.locationpushd", "PushDaemon");
  id v2 = (void *)qword_100010D18;
  qword_100010D18 = (uint64_t)v1;
}

void sub_100005974(id a1)
{
  os_log_t v1 = objc_alloc_init(&OBJC_CLASS___LPPushRegistrar);
  id v2 = (void *)qword_100010EA8;
  qword_100010EA8 = (uint64_t)v1;
}

void sub_100005BA0(uint64_t a1, void *a2)
{
  id v3 = a2;
  string = xpc_dictionary_get_string(v3, _xpc_event_key_name);
  if (!strcmp(string, "com.apple.locationpushd.app-uninstalled"))
  {
    if (qword_100010D10 != -1) {
      dispatch_once(&qword_100010D10, &stru_10000C450);
    }
    int v5 = (os_log_s *)qword_100010D18;
    if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v9) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "Launched by application uninstalled notification",  (uint8_t *)&v9,  2u);
    }

    uint64_t v6 = sub_100004250();
    __int16 v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    if (v7)
    {
      [*(id *)(a1 + 32) handleApplicationUninstalledNotification:v7];
    }

    else
    {
      if (qword_100010D10 != -1) {
        dispatch_once(&qword_100010D10, &stru_10000C450);
      }
      uint64_t v8 = (os_log_s *)qword_100010D18;
      if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138543362;
        id v10 = v3;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Could not create notification for XPC event %{public}@",  (uint8_t *)&v9,  0xCu);
      }
    }
  }
}

void sub_100006910( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_100006928(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100006938(uint64_t a1)
{
}

void sub_100006940(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifierToApplication]);
  uint64_t v3 = objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:*(void *)(a1 + 40)]);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8LL);
  int v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL))
  {
    uint64_t v6 = -[LPApplication initWithAppBundleIdentifier:]( objc_alloc(&OBJC_CLASS___LPApplication),  "initWithAppBundleIdentifier:",  *(void *)(a1 + 40));
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8LL);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
    if (v9)
    {
      id v10 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifierToApplication]);
      [v10 setObject:v9 forKeyedSubscript:*(void *)(a1 + 40)];
    }
  }

id sub_100006F90(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setTopicEnabled:1 forConnection:*(void *)(a1 + 40) appBundleIdentifier:*(void *)(a1 + 48)];
}

uint64_t sub_1000070C8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    [*(id *)(a1 + 40) _setTopicEnabled:*(unsigned __int8 *)(a1 + 64) forConnection:v2 appBundleIdentifier:*(void *)(a1 + 48)];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

void sub_1000071A4(uint64_t a1)
{
  if (qword_100010D10 != -1) {
    dispatch_once(&qword_100010D10, &stru_10000C450);
  }
  uint64_t v2 = (os_log_s *)qword_100010D18;
  if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v16 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Handling app uninstall %{public}@", buf, 0xCu);
  }

  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "userInfo", 0));
  int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"bundleIDs"]);

  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(a1 + 40) _unregisterLocationPushApplication:*(void *)(*((void *)&v10 + 1) + 8 * (void)i)];
      }

      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v7);
  }
}

void sub_100007524(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIdentifierToApplication]);
  [v2 removeObjectForKey:*(void *)(a1 + 40)];
}

LABEL_42:
}

void sub_10000805C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.locationpushd", "PushDaemon");
  id v2 = (void *)qword_100010D18;
  qword_100010D18 = (uint64_t)v1;
}

uint64_t start()
{
  v0 = objc_autoreleasePoolPush();
  if (qword_100010D10 != -1) {
    dispatch_once(&qword_100010D10, &stru_10000C470);
  }
  os_log_t v1 = (os_log_s *)qword_100010D18;
  if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Starting locationpushd", v6, 2u);
  }

  id v2 = +[LPPushRegistrar sharedInstance](&OBJC_CLASS___LPPushRegistrar, "sharedInstance");
  objc_autoreleasePoolPop(v0);
  uint64_t v3 = objc_autoreleasePoolPush();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
  [v4 run];

  objc_autoreleasePoolPop(v3);
  return 0LL;
}

void sub_100008168(id a1)
{
  os_log_t v1 = os_log_create("com.apple.locationpushd", "PushDaemon");
  id v2 = (void *)qword_100010D18;
  qword_100010D18 = (uint64_t)v1;
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}