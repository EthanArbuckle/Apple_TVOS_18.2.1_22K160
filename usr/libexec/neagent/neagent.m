void sub_10000365C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  os_log_s *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  v3 = a2;
  if (v3)
  {
    v4 = ne_log_obj();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = *(void *)(a1 + 32);
      v10 = 138412546;
      v11 = v9;
      v12 = 2112;
      v13 = v3;
      _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%@ provider failed to process signal request error %@",  (uint8_t *)&v10,  0x16u);
    }

    v6 = *(void **)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    v8 = v3;
  }

  else
  {
    v6 = *(void **)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    v8 = 0LL;
  }

  sub_100003740(v6, v8, v7);
}

void sub_100003740(void *a1, void *a2, void *a3)
{
  if (a1)
  {
    id v5 = a3;
    id v6 = a2;
    v7 = (void *)objc_claimAutoreleasedReturnValue([a1 managerObjectFactory]);
    id v8 = (id)objc_claimAutoreleasedReturnValue([v7 managerObject]);

    [v8 handleProviderError:v6 forMessageID:v5];
  }
}

void sub_1000037C4(uint64_t a1)
{
  uint64_t v2 = ne_log_obj();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138412290;
    uint64_t v9 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%@ provider stopped", (uint8_t *)&v8, 0xCu);
  }

  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 managerObjectFactory]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 managerObject]);

    [v6 handleProviderStopped];
  }

void sub_10000389C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = ne_log_obj();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412546;
      uint64_t v10 = v8;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%@ failed to start the provider, error %@",  (uint8_t *)&v9,  0x16u);
    }

    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = v3;
  }

  else
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = 0LL;
  }

  sub_100003980(v6, v7);
}

void sub_100003980(void *a1, void *a2)
{
  if (a1)
  {
    id v3 = a2;
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1 managerObjectFactory]);
    id v5 = (id)objc_claimAutoreleasedReturnValue([v4 managerObject]);

    [v5 handleProviderError:v3];
  }

void sub_1000039E8(void *a1, uint64_t a2)
{
  if (a1)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([a1 managerObjectFactory]);
    id v4 = (id)objc_claimAutoreleasedReturnValue([v3 managerObject]);

    [v4 handleProviderInstallationStatus:a2];
  }

void sub_100003A40(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___NEAppPushPluginDriver));
  uint64_t v2 = (void *)qword_10000DA50;
  qword_10000DA50 = v1;
}

void sub_100003A74(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___NEAppPushPluginManager));
  uint64_t v2 = (void *)qword_10000DA40;
  qword_10000DA40 = v1;
}

uint64_t start()
{
  v0 = objc_autoreleasePoolPush();
  id v1 = sub_10000474C();
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  if (v2)
  {
    id v3 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.neagent");
    objc_setProperty_atomic(v2, v4, v3, 16LL);

    if (!objc_getProperty(v2, v5, 16LL, 1))
    {
      uint64_t v11 = ne_log_obj();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v13 = 136315138;
        v14 = "com.apple.neagent";
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to create an XPC listener for service %s",  (uint8_t *)&v13,  0xCu);
      }

      exit(1);
    }

    objc_msgSend(objc_getProperty(v2, v6, 16, 1), "setDelegate:", v2);
    objc_msgSend(objc_getProperty(v2, v7, 16, 1), "resume");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
    [v8 addObserver:v2];
  }

  objc_autoreleasePoolPop(v0);
  int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
  [v9 run];

  return 0LL;
}

void sub_10000413C(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a1)
  {
    id v6 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v5 count]);
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id v26 = v5;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v31 objects:v42 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v32;
      do
      {
        uint64_t v11 = 0LL;
        do
        {
          if (*(void *)v32 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v31 + 1) + 8 * (void)v11) bundleIdentifier]);
          -[NSMutableArray addObject:](v6, "addObject:", v12);

          uint64_t v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v31 objects:v42 count:16];
      }

      while (v9);
    }

    int v13 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    id v14 = *(id *)(a1 + 24);
    os_unfair_lock_unlock(v13);
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id v15 = v14;
    id v16 = [v15 countByEnumeratingWithState:&v27 objects:v41 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v28;
      do
      {
        v19 = 0LL;
        do
        {
          if (*(void *)v28 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)v19);
          if (a2 == 3)
          {
            v22 = v6;
            if (v20)
            {
              Property = (dispatch_queue_s *)objc_getProperty(v20, v25, 16LL, 1);
              block = _NSConcreteStackBlock;
              uint64_t v36 = 3221225472LL;
              v24 = sub_1000054CC;
              goto LABEL_20;
            }
          }

          else
          {
            if (a2) {
              goto LABEL_22;
            }
            v22 = v6;
            if (v20)
            {
              Property = (dispatch_queue_s *)objc_getProperty(v20, v21, 16LL, 1);
              block = _NSConcreteStackBlock;
              uint64_t v36 = 3221225472LL;
              v24 = sub_100005500;
LABEL_20:
              v37 = v24;
              v38 = &unk_1000083D8;
              v39 = v20;
              v40 = v22;
              dispatch_async(Property, &block);
            }
          }

LABEL_22:
          v19 = (char *)v19 + 1;
        }

        while (v17 != v19);
        id v17 = [v15 countByEnumeratingWithState:&v27 objects:v41 count:16];
      }

      while (v17);
    }

    id v5 = v26;
  }
}

void sub_1000043FC(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v29 = a1;
  if (a1)
  {
    id v6 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v5 count]);
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    id v28 = v5;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v35;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v35 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
          int v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pluginIdentifier", v28));

          if (v13)
          {
            id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 pluginIdentifier]);
            -[NSMutableArray addObject:](v6, "addObject:", v14);
          }

          else
          {
            uint64_t v15 = ne_log_obj();
            id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&buf[4] = a2;
              _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Got a LSPlugInKitProxy with a nil identifier with event %d",  buf,  8u);
            }
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }

      while (v9);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(v29 + 8));
    id v16 = [*(id *)(v29 + 24) copy];
    os_unfair_lock_unlock((os_unfair_lock_t)(v29 + 8));
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    id v17 = v16;
    id v18 = [v17 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v31;
      do
      {
        for (j = 0LL; j != v19; j = (char *)j + 1)
        {
          if (*(void *)v31 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)j);
          if (a2 == 2)
          {
            v24 = v6;
            if (v22)
            {
              Property = (dispatch_queue_s *)objc_getProperty(v22, v27, 16LL, 1);
              *(void *)buf = _NSConcreteStackBlock;
              uint64_t v41 = 3221225472LL;
              id v26 = sub_100005568;
              goto LABEL_24;
            }
          }

          else
          {
            if (a2 != 1) {
              continue;
            }
            v24 = v6;
            if (v22)
            {
              Property = (dispatch_queue_s *)objc_getProperty(v22, v23, 16LL, 1);
              *(void *)buf = _NSConcreteStackBlock;
              uint64_t v41 = 3221225472LL;
              id v26 = sub_100005534;
LABEL_24:
              v42 = v26;
              v43 = &unk_1000083D8;
              v44 = v22;
              v45 = v24;
              dispatch_async(Property, buf);
            }
          }
        }

        id v19 = [v17 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }

      while (v19);
    }

    id v5 = v28;
  }
}

id sub_10000474C()
{
  if (qword_10000DA68 != -1) {
    dispatch_once(&qword_10000DA68, &stru_100008310);
  }
  return (id)qword_10000DA60;
}

void sub_100004790(id a1)
{
  id v1 = objc_alloc(&OBJC_CLASS___NEAgentServer);
  if (v1)
  {
    v8.receiver = v1;
    v8.super_class = (Class)&OBJC_CLASS___NEAgentServer;
    uint64_t v2 = objc_msgSendSuper2(&v8, "init");
    if (v2)
    {
      id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      SEL v4 = (void *)v2[3];
      v2[3] = v3;

      id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      id v6 = (void *)v2[4];
      v2[4] = v5;

      *((_DWORD *)v2 + 2) = 0;
    }
  }

  else
  {
    uint64_t v2 = 0LL;
  }

  id v7 = (void *)qword_10000DA60;
  qword_10000DA60 = (uint64_t)v2;
}

void sub_100004D24(void *a1, const char *a2)
{
  if (a1)
  {
    Property = (dispatch_queue_s *)objc_getProperty(a1, a2, 16LL, 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100004D90;
    block[3] = &unk_100008338;
    block[4] = a1;
    dispatch_async(Property, block);
  }

void sub_100004D90(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 24LL, 1);
  }
  [Property invalidate];
  id v5 = *(id *)(a1 + 32);
  if (v5)
  {
    objc_setProperty_atomic(v5, v4, 0LL, 24LL);
    id v5 = *(id *)(a1 + 32);
    if (v5) {
      id v5 = objc_getProperty(v5, v6, 32LL, 1);
    }
  }

  [v5 invalidate];
  id v8 = *(id *)(a1 + 32);
  if (v8)
  {
    objc_setProperty_atomic(v8, v7, 0LL, 32LL);
    id v8 = *(id *)(a1 + 32);
    if (v8) {
      id v8 = objc_getProperty(v8, v9, 8LL, 1);
    }
  }

  [v8 handleCancel];
  id v11 = *(id *)(a1 + 32);
  if (v11)
  {
    objc_setProperty_atomic(v11, v10, 0LL, 8LL);
    id v11 = *(id *)(a1 + 32);
    if (v11) {
      id v11 = objc_getProperty(v11, v12, 40LL, 1);
    }
  }

  [v11 invalidate];
  id v14 = *(void **)(a1 + 32);
  if (v14) {
    objc_setProperty_atomic(v14, v13, 0LL, 40LL);
  }
  id v15 = sub_10000474C();
  uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
  if (v16)
  {
    id v17 = *(id *)(a1 + 32);
    os_unfair_lock_lock((os_unfair_lock_t)(v16 + 8));
    [*(id *)(v16 + 24) removeObject:v17];

    os_unfair_lock_unlock((os_unfair_lock_t)(v16 + 8));
  }

  uint64_t v18 = *(void *)(a1 + 32);
  if (!v18 || !*(void *)(v18 + 48))
  {
    uint64_t v19 = ne_log_obj();
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "exiting", v21, 2u);
    }

    exit(0);
  }

void sub_100004F14(uint64_t a1, const char *a2)
{
  id v3 = *(void **)(a1 + 32);
  if (v3 && objc_getProperty(v3, a2, 8LL, 1))
  {
    id v5 = *(void **)(a1 + 32);
    if (v5)
    {
      id Property = objc_getProperty(v5, v4, 8LL, 1);
      uint64_t v7 = *(void *)(a1 + 32);
    }

    else
    {
      uint64_t v7 = 0LL;
      id Property = 0LL;
    }

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100005014;
    v10[3] = &unk_1000083B0;
    v10[4] = v7;
    id v11 = *(id *)(a1 + 40);
    [Property handleDisposeWithCompletionHandler:v10];
  }

  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"NEAgentErrorDomain",  1LL,  0LL);
    (*(void (**)(uint64_t, NSError *))(v8 + 16))(v8, v9);
  }

uint64_t sub_100005014(uint64_t a1)
{
  uint64_t v2 = ne_log_obj();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Dispose complete", v7, 2u);
  }

  id v5 = *(void **)(a1 + 32);
  if (v5) {
    objc_setProperty_atomic(v5, v4, 0LL, 8LL);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_1000050A0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    *(void *)(v2 + 48) = *(void *)(a1 + 64);
  }
  uint64_t v3 = ((uint64_t (*)(void))ne_log_obj)();
  SEL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Initializing the delegate", buf, 2u);
  }

  id v5 = (__objc2_class **)&OBJC_CLASS___NEAgentPacketTunnelExtension_ptr;
  switch(*(void *)(a1 + 72))
  {
    case 1LL:
      uint64_t v7 = ne_log_obj(&OBJC_CLASS___NEAgentPacketTunnelExtension_ptr);
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Legacy plugins are not supported on iOS",  buf,  2u);
      }

      id v9 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"NEAgentErrorDomain",  2LL,  0LL);
      goto LABEL_27;
    case 2LL:
      id v5 = (__objc2_class **)&OBJC_CLASS___NEAgentAppProxyExtension_ptr;
      goto LABEL_14;
    case 3LL:
      id v5 = (__objc2_class **)&OBJC_CLASS___NEAgentDNSProxyExtension_ptr;
      goto LABEL_14;
    case 4LL:
    case 6LL:
      id v5 = (__objc2_class **)&OBJC_CLASS___NEAgentFilterExtension_ptr;
      goto LABEL_14;
    case 5LL:
      goto LABEL_14;
    case 7LL:
      id v5 = &off_100008018;
LABEL_14:
      id v6 = (objc_class *)objc_opt_class(*v5);
      break;
    default:
      id v6 = 0LL;
      break;
  }

  id v11 = objc_alloc(v6);
  uint64_t v12 = *(void *)(a1 + 72);
  uint64_t v14 = *(void *)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 48);
  id v15 = *(void **)(a1 + 32);
  if (v15)
  {
    id Property = objc_getProperty(v15, v10, 16LL, 1);
    uint64_t v17 = *(void *)(a1 + 32);
  }

  else
  {
    uint64_t v17 = 0LL;
    id Property = 0LL;
  }

  id v19 = [v11 initWithPluginType:v14 pluginClass:v12 pluginInfo:v13 queue:Property factory:v17];
  uint64_t v20 = *(void **)(a1 + 32);
  if (v20) {
    objc_setProperty_atomic(v20, v18, v19, 8LL);
  }

  kdebug_trace(726990968LL, 0LL, 0LL, 0LL, 0LL);
  v22 = *(void **)(a1 + 32);
  if (v22 && objc_getProperty(v22, v21, 8LL, 1))
  {
    v24 = *(void **)(a1 + 32);
    if (v24) {
      id v25 = objc_getProperty(v24, v23, 8LL, 1);
    }
    else {
      id v25 = 0LL;
    }
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_100005398;
    v30[3] = &unk_100008360;
    id v26 = (NSError *)*(id *)(a1 + 56);
    v30[4] = *(void *)(a1 + 32);
    __int128 v31 = v26;
    [v25 handleInitWithCompletionHandler:v30];
    id v9 = v31;
  }

  else
  {
    id v9 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"NEAgentErrorDomain",  2LL,  0LL);
    id v28 = ne_log_obj(v27);
    uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "NEAgentSession: failed to create the delegate",  buf,  2u);
    }

LABEL_27:
    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }
}

void sub_100005398(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
  {
    uint64_t v3 = 0LL;
  }

  else
  {
    uint64_t v4 = ne_log_obj();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "NEAgentSession: failed to initialize the delegate",  v13,  2u);
    }

    uint64_t v3 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"NEAgentErrorDomain",  2LL,  0LL);
  }

  kdebug_trace(726990964LL, 0LL, 0LL, 0LL, 0LL);
  id Property = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, v6, 40LL, 1);
  }
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([Property endpoint]);
  id v11 = *(id *)(a1 + 32);
  if (v11) {
    id v11 = objc_getProperty(v11, v9, 8LL, 1);
  }
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 uuids]);
  (*(void (**)(uint64_t, NSError *, void *, void *))(v8 + 16))(v8, v3, v10, v12);
}

void sub_1000054BC(uint64_t a1, const char *a2)
{
}

void sub_1000054C4(uint64_t a1, const char *a2)
{
}

id sub_1000054CC(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 8LL, 1);
  }
  return [Property handleAppsUninstalled:*(void *)(a1 + 40)];
}

id sub_100005500(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 8LL, 1);
  }
  return [Property handleAppsUpdateBegins:*(void *)(a1 + 40)];
}

id sub_100005534(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 8LL, 1);
  }
  return [Property handleAppsUpdateEnding:*(void *)(a1 + 40)];
}

id sub_100005568(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 8LL, 1);
  }
  return [Property handleAppsUpdateEnds:*(void *)(a1 + 40)];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}