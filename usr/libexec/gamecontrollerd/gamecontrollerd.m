id sub_1000034EC(uint64_t a1, int a2)
{
  void *v4;
  unint64_t v5;
  CFStringRef v6;
  void *v7;
  void *v8;
  void *v9;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](&OBJC_CLASS___NSMutableString, "stringWithCapacity:", 2 * a2));
  if (a2 >= 1)
  {
    v5 = a2 + 1LL;
    do
    {
      if ((_DWORD)v5 == 2) {
        v6 = &stru_10000C668;
      }
      else {
        v6 = @":";
      }
      v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%02x%@",  *(unsigned __int8 *)(a1 + (v5 - 2)),  v6));
      [v4 appendString:v7];

      --v5;
    }

    while (v5 > 1);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", v4));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 uppercaseString]);

  return v9;
}

uint64_t sub_1000035E0()
{
  if (qword_100011F08 != -1) {
    dispatch_once(&qword_100011F08, &stru_10000C320);
  }
  return byte_100011F10;
}

void sub_100003620(id a1)
{
  v1 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.GameController");
  byte_100011F10 = -[NSUserDefaults BOOLForKey:](v1, "BOOLForKey:", @"GCPartnersEnable");
  id v2 = sub_1000068BC();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = byte_100011F10;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Partners mode enabled? %d", (uint8_t *)v4, 8u);
  }
}
}

void sub_100003AC0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, id a17)
{
}

void sub_100003B08(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v12 = WeakRetained;
    [WeakRetained setInterruptionHandler:0];
    [v12 setInvalidationHandler:0];
    id v3 = objc_loadWeakRetained((id *)(a1 + 48));
    v4 = v3;
    if (v3)
    {
      id v5 = v3;
      objc_sync_enter(v5);
      id v6 = *(id *)(*(void *)(a1 + 32) + 16LL);
      objc_sync_enter(v6);
      if ([*(id *)(*(void *)(a1 + 32) + 16) containsObject:v12])
      {
        uint64_t v7 = GCBundleWithPID([v12 processIdentifier]);
        v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue([v8 resourcePath]);
        unsigned __int8 v10 = [v9 containsString:@"/System/Library/PrivateFrameworks/MediaRemote.framework/Support"];

        objc_sync_exit(v6);
        if ((v10 & 1) == 0) {
          GCSetRemoteInputMode(0LL);
        }
      }

      else
      {
        objc_sync_exit(v6);
      }

      [v5 removeObject:v12];
      objc_sync_exit(v5);

      id v11 = *(id *)(*(void *)(a1 + 32) + 16LL);
      objc_sync_enter(v11);
      [*(id *)(*(void *)(a1 + 32) + 16) removeObject:v12];
      objc_sync_exit(v11);
    }

    id WeakRetained = v12;
  }
}

void sub_100003C5C(_Unwind_Exception *a1)
{
}

void sub_100003E74( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_100003E98(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained setInterruptionHandler:0];
    [v2 setInvalidationHandler:0];
    id WeakRetained = v2;
  }
}

void sub_100004218(_Unwind_Exception *a1)
{
}

void sub_1000043BC(_Unwind_Exception *a1)
{
}

void sub_1000046EC(_Unwind_Exception *a1)
{
}

void sub_100005360( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, id *a11, id *a12, id *a13, id *a14, id *a15, id *a16, id *a17, id *a18, id *a19, id *a20, id *a21, id *a22, id *a23, id *a24, id *a25, id *a26, id *a27, id *a28, id *a29, id *a30)
{
}

void sub_100005560(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:0 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_1000055B4(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:1 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_100005608(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:2 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_10000565C(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:3 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_1000056B0(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:4 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_100005704(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:5 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_100005758(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:6 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_1000057AC(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:7 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_100005800(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:8 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_100005854(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:9 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_1000058A8(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:10 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_1000058FC(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:11 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_100005950(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:12 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_1000059A4(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:13 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_1000059F8(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:14 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_100005A4C(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:15 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_100005AA0(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:16 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_100005AF4(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:17 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_100005B48(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:18 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_100005B9C(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:19 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_100005BF0(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:28 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_100005C44(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:29 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_100005C98(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:27 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_100005CEC(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:26 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_100005D40(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = a2;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:25 forElement:*(unsigned __int8 *)(a1 + 48) forward:v4];
}

void sub_100005D94(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v6 = *(void *)(a1 + 40);
  [v4 gravity];
  float v8 = v7;
  [v4 gravity];
  float v10 = v9;
  [v4 gravity];
  *(float *)&double v11 = v11;
  LODWORD(v12) = 0;
  *(float *)&double v13 = v8;
  *(float *)&double v14 = v10;
  objc_msgSend( WeakRetained,  "controllerWithUDID:setArrayValue:forElement:forward:",  v6,  20,  *(unsigned __int8 *)(a1 + 48),  v13,  v14,  v11,  v12);

  id v26 = objc_loadWeakRetained(v3);
  uint64_t v15 = *(void *)(a1 + 40);
  [v4 userAcceleration];
  float v17 = v16;
  [v4 userAcceleration];
  float v19 = v18;
  [v4 userAcceleration];
  double v21 = v20;

  *(float *)&double v22 = v21;
  LODWORD(v23) = 0;
  *(float *)&double v24 = v17;
  *(float *)&double v25 = v19;
  objc_msgSend( v26,  "controllerWithUDID:setArrayValue:forElement:forward:",  v15,  21,  *(unsigned __int8 *)(a1 + 48),  v24,  v25,  v22,  v23);
}

void sub_100005E9C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  LODWORD(v2) = 1.0;
  [WeakRetained controllerWithUDID:*(void *)(a1 + 40) setValue:24 forElement:*(unsigned __int8 *)(a1 + 48) forward:v2];
}

void sub_1000060D8(_Unwind_Exception *a1)
{
}

void sub_1000063B0(_Unwind_Exception *a1)
{
}

void sub_100006598(_Unwind_Exception *a1)
{
}

uint64_t sub_1000065FC()
{
  if (qword_100011F20 != -1) {
    dispatch_once(&qword_100011F20, &stru_10000C468);
  }
  return byte_100011F18;
}

void sub_10000663C(id a1)
{
  byte_100011F18 = os_variant_has_internal_diagnostics("com.apple.gamecontroller");
}

id sub_100006660()
{
  if (qword_100011F30 != -1) {
    dispatch_once(&qword_100011F30, &stru_10000C488);
  }
  return (id)qword_100011F28;
}

void sub_1000066A0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController", "default");
  double v2 = (void *)qword_100011F28;
  qword_100011F28 = (uint64_t)v1;
}

id sub_1000066D0()
{
  if (qword_100011F40 != -1) {
    dispatch_once(&qword_100011F40, &stru_10000C4A8);
  }
  return (id)qword_100011F38;
}

void sub_100006710(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController", "monitor");
  double v2 = (void *)qword_100011F38;
  qword_100011F38 = (uint64_t)v1;
}

id sub_100006740()
{
  if (qword_100011F50 != -1) {
    dispatch_once(&qword_100011F50, &stru_10000C4C8);
  }
  return (id)qword_100011F48;
}

void sub_100006780(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController", "init");
  double v2 = (void *)qword_100011F48;
  qword_100011F48 = (uint64_t)v1;
}

id sub_1000067B0()
{
  if (qword_100011F60 != -1) {
    dispatch_once(&qword_100011F60, &stru_10000C4E8);
  }
  return (id)qword_100011F58;
}

void sub_1000067F0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController", "analytics");
  double v2 = (void *)qword_100011F58;
  qword_100011F58 = (uint64_t)v1;
}

id sub_100006820()
{
  if (qword_100011F70 != -1) {
    dispatch_once(&qword_100011F70, &stru_10000C508);
  }
  return (id)qword_100011F68;
}

void sub_100006860(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController.Daemon", "default");
  double v2 = (void *)qword_100011F68;
  qword_100011F68 = (uint64_t)v1;
}

void sub_100006890(char *category)
{
  os_log_t v1 = os_log_create("com.apple.GameController.HID", category);
  double v2 = (void *)qword_100011F78;
  qword_100011F78 = (uint64_t)v1;
}

id sub_1000068BC()
{
  if (qword_100011F80 != -1) {
    dispatch_once(&qword_100011F80, &stru_10000C528);
  }
  return (id)qword_100011F78;
}

void sub_1000068FC(id a1)
{
  if (!qword_100011F78) {
    objc_storeStrong((id *)&qword_100011F78, &_os_log_default);
  }
}

id sub_100006920()
{
  if (qword_100011F90 != -1) {
    dispatch_once(&qword_100011F90, &stru_10000C548);
  }
  return (id)qword_100011F88;
}

void sub_100006960(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController.Settings", "default");
  double v2 = (void *)qword_100011F88;
  qword_100011F88 = (uint64_t)v1;
}

id sub_100006990()
{
  if (qword_100011FA0 != -1) {
    dispatch_once(&qword_100011FA0, &stru_10000C568);
  }
  return (id)qword_100011F98;
}

void sub_1000069D0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController.Haptics", "default");
  double v2 = (void *)qword_100011F98;
  qword_100011F98 = (uint64_t)v1;
}

id sub_100006A00()
{
  if (qword_100011FB0 != -1) {
    dispatch_once(&qword_100011FB0, &stru_10000C588);
  }
  return (id)qword_100011FA8;
}

void sub_100006A40(id a1)
{
  os_log_t v1 = os_log_create("com.apple.gamecontroller", "Signposts");
  double v2 = (void *)qword_100011FA8;
  qword_100011FA8 = (uint64_t)v1;
}

id sub_100006A70()
{
  if (qword_100011FC0 != -1) {
    dispatch_once(&qword_100011FC0, &stru_10000C5A8);
  }
  return (id)qword_100011FB8;
}

void sub_100006AB0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.runtime-issues", "GameController");
  double v2 = (void *)qword_100011FB8;
  qword_100011FB8 = (uint64_t)v1;
}

uint64_t start()
{
  if (os_variant_allows_internal_security_policies("com.apple.gamecontroller"))
  {
    float v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned int v9 = [v8 fileExistsAtPath:@"/tmp/gamecontrollerd_prevent_startup"];

    if (v9)
    {
      do
      {
        if (sub_1000065FC())
        {
          id v12 = sub_100006820();
          double v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Deferring startup...", buf, 2u);
          }
        }

        sleep(1u);
        float v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        unsigned __int8 v11 = [v10 fileExistsAtPath:@"/tmp/gamecontrollerd_prevent_startup"];
      }

      while ((v11 & 1) != 0);
    }
  }

  if (sub_1000065FC())
  {
    id v14 = sub_100006820();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)float v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Running...", v19, 2u);
    }
  }

  v0 = objc_autoreleasePoolPush();
  +[GameControllerDaemon run](&OBJC_CLASS___GameControllerDaemon, "run");
  os_log_t v1 = objc_alloc_init(&OBJC_CLASS___GCDGameControllerDaemonDelegate);
  signal(15, (void (__cdecl *)(int))1);
  dispatch_source_t v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, &_dispatch_main_q);
  id v3 = (void *)qword_100011FC8;
  qword_100011FC8 = (uint64_t)v2;

  dispatch_source_set_event_handler((dispatch_source_t)qword_100011FC8, &stru_10000C5C8);
  dispatch_resume((dispatch_object_t)qword_100011FC8);
  do
  {
    id v4 = objc_autoreleasePoolPush();
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 5.0));
    [v5 runUntilDate:v6];

    objc_autoreleasePoolPop(v4);
  }

  while (-[GCDGameControllerDaemonDelegate shouldKeepRunning](v1, "shouldKeepRunning"));
  if (sub_1000065FC())
  {
    id v16 = sub_100006820();
    float v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Stopping...", v18, 2u);
    }
  }

  objc_autoreleasePoolPop(v0);
  return 0LL;
}

void sub_100006D70(id a1)
{
}

void sub_100006E34(id a1)
{
  id v1 = -[GameControllerDaemon _init](objc_alloc(&OBJC_CLASS___GameControllerDaemon), "_init");
  dispatch_source_t v2 = (void *)qword_100011FD0;
  qword_100011FD0 = (uint64_t)v1;
}

void sub_1000070B8(id a1, OS_xpc_object *a2)
{
  dispatch_source_t v2 = a2;
  if (sub_1000065FC())
  {
    id v3 = sub_100006660();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_10000809C((uint64_t)v2, v4);
    }
  }
}

void sub_100007438(_Unwind_Exception *a1)
{
}

void sub_10000760C(_Unwind_Exception *a1)
{
}

void sub_100007768(_Unwind_Exception *a1)
{
}

LABEL_6:
  os_activity_scope_leave(&v21);
  return v13;
}

LABEL_8:
    v15.receiver = self;
    v15.super_class = (Class)&OBJC_CLASS___GameControllerDaemon;
    -[GameControllerDaemon observeValueForKeyPath:ofObject:change:context:]( &v15,  "observeValueForKeyPath:ofObject:change:context:",  v10,  v11,  v12,  a6);
    goto LABEL_9;
  }

  double v13 = objc_opt_class(&OBJC_CLASS____GCIPCRemoteProcess);
  if ((objc_opt_isKindOfClass(v11, v13) & 1) == 0
    || ![v10 isEqualToString:@"connections"])
  {
    goto LABEL_8;
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:NSKeyValueChangeNewKey]);
  -[GameControllerDaemon client:connectionsDidChange:](self, "client:connectionsDidChange:", v11, v14);
LABEL_7:

LABEL_9:
}

void sub_100007E20(_Unwind_Exception *a1)
{
}

void sub_100007ED0(_Unwind_Exception *a1)
{
}

void sub_10000809C(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "XPC Event Stream 'com.apple.iokit.match.gamecontroller' event: %@",  (uint8_t *)&v2,  0xCu);
}

id objc_msgSend_microControllerWithUDID_setDigitizerX_digitizerY_withTimeStamp_touchDown_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "microControllerWithUDID:setDigitizerX:digitizerY:withTimeStamp:touchDown:");
}

id objc_msgSend_processMicroControllerWithUDID_setDigitizerX_withY_withTimeStamp_touchDown_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processMicroControllerWithUDID:setDigitizerX:withY:withTimeStamp:touchDown:");
}

id objc_msgSend_userIdentifier(void *a1, const char *a2, ...)
{
  return [a1 userIdentifier];
}