uint64_t sub_3614(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  id v7;
  void *v8;
  void v10[7];
  int v11;
  v6 = objc_autoreleasePoolPush();
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_3A28;
  v10[3] = &unk_40E0;
  v10[4] = a1;
  v10[5] = a2;
  v11 = 3;
  v10[6] = a3;
  v7 = [[WiFiP2PDNSServiceDiscoveryManager alloc] initUsingWiFiAware:1 serviceCallback:v10];
  v8 = (void *)qword_8088;
  qword_8088 = (uint64_t)v7;

  objc_autoreleasePoolPop(v6);
  return 0LL;
}

uint64_t sub_36EC()
{
  v0 = objc_autoreleasePoolPush();
  v1 = (void *)qword_8088;
  qword_8088 = 0LL;

  objc_autoreleasePoolPop(v0);
  return 0LL;
}

uint64_t sub_3728(uint64_t a1, uint64_t a2)
{
  v4 = objc_autoreleasePoolPush();
  v5 = (void *)qword_8088;
  id v6 = [[AWDLServiceDiscoveryConfiguration alloc] initWithKey:a1 value:a2 resolve:0];
  [v5 startServiceDiscoveryWithConfiguration:v6];

  objc_autoreleasePoolPop(v4);
  return 0LL;
}

void sub_379C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_37AC(uint64_t a1, uint64_t a2)
{
  v4 = objc_autoreleasePoolPush();
  v5 = (void *)qword_8088;
  id v6 = [[AWDLServiceDiscoveryConfiguration alloc] initWithKey:a1 value:a2 resolve:0];
  [v5 stopServiceDiscoveryWithConfiguration:v6];

  objc_autoreleasePoolPop(v4);
  return 0LL;
}

void sub_3820(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_3830(uint64_t a1)
{
  v2 = objc_autoreleasePoolPush();
  v3 = (void *)qword_8088;
  id v4 = [[AWDLServiceDiscoveryConfiguration alloc] initWithKey:a1];
  [v3 startServiceDiscoveryWithConfiguration:v4];

  objc_autoreleasePoolPop(v2);
  return 0LL;
}

void sub_3898(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_38A8(uint64_t a1)
{
  v2 = objc_autoreleasePoolPush();
  v3 = (void *)qword_8088;
  id v4 = [[AWDLServiceDiscoveryConfiguration alloc] initWithKey:a1];
  [v3 stopServiceDiscoveryWithConfiguration:v4];

  objc_autoreleasePoolPop(v2);
  return 0LL;
}

void sub_3910(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_3920(uint64_t a1, uint64_t a2)
{
  id v4 = objc_autoreleasePoolPush();
  v5 = (void *)qword_8088;
  id v6 = [[AWDLServiceDiscoveryConfiguration alloc] initWithKey:a1 value:a2 resolve:1];
  [v5 startServiceDiscoveryWithConfiguration:v6];

  objc_autoreleasePoolPop(v4);
}

void sub_398C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_399C(uint64_t a1, uint64_t a2)
{
  id v4 = objc_autoreleasePoolPush();
  v5 = (void *)qword_8088;
  id v6 = [[AWDLServiceDiscoveryConfiguration alloc] initWithKey:a1 value:a2 resolve:1];
  [v5 stopServiceDiscoveryWithConfiguration:v6];

  objc_autoreleasePoolPop(v4);
}

void sub_3A08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_3A18()
{
  return 0LL;
}

uint64_t sub_3A20()
{
  return 0LL;
}

void sub_3A28(uint64_t a1, int a2, int a3, void *a4, void *a5)
{
  id v9 = a4;
  id v10 = a5;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_3B78;
  block[3] = &unk_40C0;
  v11 = *(__CFRunLoop **)(a1 + 32);
  uint64_t v18 = *(void *)(a1 + 40);
  int v20 = a2;
  int v21 = a3;
  int v22 = *(_DWORD *)(a1 + 56);
  id v12 = v9;
  id v16 = v12;
  id v13 = v10;
  uint64_t v14 = *(void *)(a1 + 48);
  id v17 = v13;
  uint64_t v19 = v14;
  CFRunLoopPerformBlock(v11, kCFRunLoopDefaultMode, block);
  CFRunLoopWakeUp(*(CFRunLoopRef *)(a1 + 32));
}

void sub_3B48( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

uint64_t sub_3B78(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, id, id, id, id, void))(a1 + 48))( *(unsigned int *)(a1 + 64), *(unsigned int *)(a1 + 68), 0, *(unsigned int *)(a1 + 72), [*(id *)(a1 + 32) bytes], objc_msgSend(*(id *)(a1 + 32), "length"), objc_msgSend(*(id *)(a1 + 40), "bytes"), objc_msgSend(*(id *)(a1 + 40), "length"), *(void *)(a1 + 56));
}

id objc_msgSend_stopServiceDiscoveryWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopServiceDiscoveryWithConfiguration:");
}