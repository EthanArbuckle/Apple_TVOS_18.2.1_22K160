uint64_t start(int a1, char **a2)
{
  void *v4;
  v4 = objc_autoreleasePoolPush();
  UIApplicationMain(a1, a2, @"BluetoothUIService", @"BluetoothUIService");
  objc_autoreleasePoolPop(v4);
  return 0LL;
}

id sub_1000050F8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _xpcListenerEvent:a2];
}

void sub_100005104(id a1, NSNotification *a2)
{
  v2 = a2;
  if (dword_1000114F8 <= 30 && (dword_1000114F8 != -1 || _LogCategory_Initialize(&dword_1000114F8, 30LL))) {
    LogPrintF( &dword_1000114F8,  "-[BluetoothUIService _activate]_block_invoke_2",  30LL,  "Language change notification fired");
  }
  exit(1);
}
}

void sub_100005338( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1000055F4(_Unwind_Exception *a1)
{
}

id sub_100005608(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) xpcConnectionEvent:a2];
}

void sub_1000056D0(_Unwind_Exception *a1)
{
}

void sub_1000056E4(uint64_t a1)
{
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "copy", 0);
  id v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue([v7 xpcCon]);
        v9 = *(void **)(a1 + 40);
        id v10 = v8;
        id v11 = v9;
        if (v10 == v11)
        {

LABEL_11:
          if (dword_1000114F8 <= 50
            && (dword_1000114F8 != -1 || _LogCategory_Initialize(&dword_1000114F8, 50LL)))
          {
            LogPrintF( &dword_1000114F8,  "-[BluetoothUIService xpcConnectionInvalidated:]_block_invoke",  50LL,  "Invalidating banner");
          }

          [v7 invalidate];
          [*(id *)(*(void *)(a1 + 32) + 8) removeObject:v7];
          continue;
        }

        v12 = v11;
        if ((v10 == 0LL) == (v11 != 0LL))
        {

          continue;
        }

        unsigned int v13 = [v10 isEqual:v11];

        if (v13) {
          goto LABEL_11;
        }
      }

      id v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v4);
  }
}

uint64_t sub_1000059C0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000059D0(uint64_t a1)
{
}

void sub_1000059D8(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 8LL))
  {
    id v2 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 8);
    *(void *)(v3 + 8) = v2;
  }

  if (dword_1000114F8 <= 30 && (dword_1000114F8 != -1 || _LogCategory_Initialize(&dword_1000114F8, 30LL))) {
    LogPrintF( &dword_1000114F8,  "-[BluetoothUIService activateBanner:withXPCConnection:]_block_invoke",  30LL,  "Initializing banner!");
  }
  uint64_t v5 = objc_alloc(&OBJC_CLASS___BluetoothUIServiceBanner);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8LL);
  id v13 = *(id *)(v7 + 40);
  v8 = -[BluetoothUIServiceBanner initWithXPCObject:error:](v5, "initWithXPCObject:error:", v6, &v13);
  objc_storeStrong((id *)(v7 + 40), v13);
  [*(id *)(*(void *)(a1 + 32) + 8) addObject:v8];
  -[BluetoothUIServiceBanner setPid:](v8, "setPid:", [*(id *)(a1 + 48) pid]);
  -[BluetoothUIServiceBanner setXpcCon:](v8, "setXpcCon:", *(void *)(a1 + 48));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100005B44;
  v9[3] = &unk_10000C440;
  id v10 = *(id *)(a1 + 48);
  id v11 = v8;
  uint64_t v12 = *(void *)(a1 + 32);
  -[BluetoothUIServiceBanner activateWithActionHandler:](v8, "activateWithActionHandler:", v9);
}

void sub_100005B44(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if ((_DWORD)a2 != 1)
  {
    if ((_DWORD)a2 == 6)
    {
      a2 = 3LL;
    }

    else if ((_DWORD)a2 != 2)
    {
      goto LABEL_7;
    }
  }

  [*(id *)(a1 + 32) xpcSendMessage:a2];
LABEL_7:
  if (dword_1000114F8 <= 50 && (dword_1000114F8 != -1 || _LogCategory_Initialize(&dword_1000114F8, 50LL))) {
    LogPrintF( &dword_1000114F8,  "-[BluetoothUIService activateBanner:withXPCConnection:]_block_invoke_2",  50LL,  "Invalidating banner");
  }
  [*(id *)(a1 + 40) invalidate];
  [*(id *)(*(void *)(a1 + 48) + 8) removeObject:*(void *)(a1 + 40)];
}

LABEL_4:
}

void sub_1000061B8(id a1, OS_xpc_object *a2)
{
  uint64_t v7 = a2;
  uint64_t v2 = CUXPCDecodeNSErrorIfNeeded();
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  if (v3)
  {
    id v5 = (id)NSErrorF(NSOSStatusErrorDomain, 4294960591LL, "No params");
  }

  else
  {
    id v4 = (void *)_CFXPCCreateCFObjectFromXPCObject(v7);
    if (v4)
    {
      if (dword_1000114F8 <= 90
        && (dword_1000114F8 != -1 || _LogCategory_Initialize(&dword_1000114F8, 90LL)))
      {
        LogPrintF( &dword_1000114F8,  "-[BUISAgentXPCConnection xpcSendMessage:]_block_invoke",  90LL,  "### XPC error %@",  v4);
      }
    }

    else
    {
      id v6 = (id)NSErrorF( NSOSStatusErrorDomain,  4294960596LL,  "No error, no response");
    }
  }
}

LABEL_19:
  v9 = v7;
LABEL_20:

  return v9;
}

void sub_1000078F8(uint64_t a1)
{
  if (dword_100011568 <= 90 && (dword_100011568 != -1 || _LogCategory_Initialize(&dword_100011568, 90LL))) {
    LogPrintF( &dword_100011568,  "-[BluetoothUIServiceBanner setBannerTimer]_block_invoke",  90LL,  "Post Banner: Banner is not serviced within 20s. Dismiss the banner");
  }
  [*(id *)(a1 + 32) dismissBanner];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24LL);
  if (v2)
  {
    id v5 = v2;
    dispatch_source_cancel(v5);
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 24);
    *(void *)(v3 + 24) = 0LL;
  }

void sub_100007A2C(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", *(void *)(a1 + 32)));
  uint64_t v1 = objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);
  uint64_t v2 = (void *)qword_100011870;
  qword_100011870 = v1;
}

void sub_10000806C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_100008088(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100008098(uint64_t a1)
{
}

void sub_1000080A0(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8LL);
  id v10 = *(id *)(v3 + 40);
  id v4 = [v2 statusOfValueForKey:@"duration" error:&v10];
  objc_storeStrong((id *)(v3 + 40), v10);
  if (v4 == (id)2)
  {
    id v5 = (void *)a1[4];
    if (v5) {
      [v5 duration];
    }
    else {
      memset(&duration, 0, sizeof(duration));
    }
    *(_OWORD *)&v7.start.value = *(_OWORD *)&kCMTimeZero.value;
    v7.start.epoch = kCMTimeZero.epoch;
    CMTimeRangeMake(&v9, &v7.start, &duration);
    id v6 = *(void **)(a1[5] + 16LL);
    CMTimeRange v7 = v9;
    [v6 setLoopTimeRange:&v7];
  }

id sub_100008244()
{
  if (qword_1000118B0 != -1) {
    dispatch_once(&qword_1000118B0, &stru_10000C558);
  }
  v0 = (id *)dlsym((void *)qword_1000118B8, "TVSPBannerPresentableKeyBannerType");
  if (v0) {
    objc_storeStrong((id *)&qword_100011880, *v0);
  }
  off_1000115D8 = (uint64_t (*)())sub_1000082BC;
  return (id)qword_100011880;
}

id sub_1000082BC()
{
  return (id)qword_100011880;
}

void sub_1000082C8(id a1)
{
  qword_1000118B8 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/TVSystemPanelUI.framework/TVSystemPanelUI", 2);
}

id sub_1000082F0()
{
  if (qword_1000118B0 != -1) {
    dispatch_once(&qword_1000118B0, &stru_10000C558);
  }
  v0 = (id *)dlsym((void *)qword_1000118B8, "TVSPBannerPresentableKeyTimeout");
  if (v0) {
    objc_storeStrong((id *)&qword_100011888, *v0);
  }
  off_1000115E0 = (uint64_t (*)())sub_100008368;
  return (id)qword_100011888;
}

id sub_100008368()
{
  return (id)qword_100011888;
}

id sub_100008374()
{
  if (qword_1000118B0 != -1) {
    dispatch_once(&qword_1000118B0, &stru_10000C558);
  }
  v0 = (id *)dlsym((void *)qword_1000118B8, "TVSPBannerPresentableKeyAutoDismissOnAction");
  if (v0) {
    objc_storeStrong((id *)&qword_100011890, *v0);
  }
  off_1000115E8 = (uint64_t (*)())sub_1000083EC;
  return (id)qword_100011890;
}

id sub_1000083EC()
{
  return (id)qword_100011890;
}

id sub_1000083F8()
{
  if (qword_1000118B0 != -1) {
    dispatch_once(&qword_1000118B0, &stru_10000C558);
  }
  v0 = (id *)dlsym((void *)qword_1000118B8, "TVSPBannerPresentableKeyHostedBannerWantsGestureForAction");
  if (v0) {
    objc_storeStrong((id *)&qword_100011898, *v0);
  }
  off_1000115F0 = (uint64_t (*)())sub_100008470;
  return (id)qword_100011898;
}

id sub_100008470()
{
  return (id)qword_100011898;
}

id sub_10000847C()
{
  if (qword_1000118B0 != -1) {
    dispatch_once(&qword_1000118B0, &stru_10000C558);
  }
  v0 = (id *)dlsym((void *)qword_1000118B8, "TVSPBannerPresentableKeyActionTrigger");
  if (v0) {
    objc_storeStrong((id *)&qword_1000118A0, *v0);
  }
  off_1000115F8 = (uint64_t (*)())sub_1000084F4;
  return (id)qword_1000118A0;
}

id sub_1000084F4()
{
  return (id)qword_1000118A0;
}

id sub_100008500()
{
  if (qword_1000118B0 != -1) {
    dispatch_once(&qword_1000118B0, &stru_10000C558);
  }
  v0 = (id *)dlsym((void *)qword_1000118B8, "TVSPBannerPresentableKeyHighPriority");
  if (v0) {
    objc_storeStrong((id *)&qword_1000118A8, *v0);
  }
  off_100011600 = (uint64_t (*)())sub_100008578;
  return (id)qword_1000118A8;
}

id sub_100008578()
{
  return (id)qword_1000118A8;
}

Class sub_100008584()
{
  if (qword_1000118B0 != -1) {
    dispatch_once(&qword_1000118B0, &stru_10000C558);
  }
  Class result = objc_getClass("TVSPBannerPillContentViewConfiguration");
  qword_1000118C0 = (uint64_t)result;
  off_100011608 = (uint64_t (*)())sub_1000085E0;
  return result;
}

id sub_1000085E0()
{
  return (id)qword_1000118C0;
}

uint64_t sub_1000085EC(double a1, double a2, double a3, double a4)
{
  if (qword_1000118B0 != -1) {
    dispatch_once(&qword_1000118B0, &stru_10000C558);
  }
  off_100011858 = (uint64_t (*)())dlsym((void *)qword_1000118B8, "TVSPBannerPillSizesMake");
  return ((uint64_t (*)(double, double, double, double))off_100011858)(a1, a2, a3, a4);
}

uint64_t sub_100008670(double a1, double a2, double a3, double a4)
{
  if (qword_1000118B0 != -1) {
    dispatch_once(&qword_1000118B0, &stru_10000C558);
  }
  off_100011860 = (uint64_t (*)())dlsym((void *)qword_1000118B8, "TVSPBannerPillEdgeInsetsMake");
  return ((uint64_t (*)(double, double, double, double))off_100011860)(a1, a2, a3, a4);
}

Class sub_1000086F4()
{
  if (qword_1000118B0 != -1) {
    dispatch_once(&qword_1000118B0, &stru_10000C558);
  }
  Class result = objc_getClass("TVSPBannerPillContentView");
  qword_1000118C8 = (uint64_t)result;
  off_100011610 = (uint64_t (*)())sub_100008750;
  return result;
}

id sub_100008750()
{
  return (id)qword_1000118C8;
}

id sub_10000875C(void *a1)
{
  uint64_t v1 = qword_1000118B0;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&qword_1000118B0, &stru_10000C558);
  }
  off_100011868 = (uint64_t (*)())dlsym( (void *)qword_1000118B8,  "TVSPBannerSubtitleReplacingButtonImagePlaceholdersInAttributedString");
  uint64_t v3 = ((uint64_t (*)(id))off_100011868)(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

id objc_msgSend_xpcSendMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcSendMessage:");
}