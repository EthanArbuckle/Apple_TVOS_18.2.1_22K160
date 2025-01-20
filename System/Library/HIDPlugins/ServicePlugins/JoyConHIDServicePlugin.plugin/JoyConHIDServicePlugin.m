uint64_t sub_4490()
{
  if (qword_2B428 != -1) {
    dispatch_once(&qword_2B428, &stru_244B8);
  }
  return byte_2B420;
}

void sub_44D0(id a1)
{
  byte_2B420 = os_variant_has_internal_diagnostics("com.apple.gamecontroller");
}

id sub_44F4()
{
  if (qword_2B438 != -1) {
    dispatch_once(&qword_2B438, &stru_244D8);
  }
  return (id)qword_2B430;
}

void sub_4534(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController", "default");
  v2 = (void *)qword_2B430;
  qword_2B430 = (uint64_t)v1;
}

id sub_4564()
{
  if (qword_2B448 != -1) {
    dispatch_once(&qword_2B448, &stru_244F8);
  }
  return (id)qword_2B440;
}

void sub_45A4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController", "monitor");
  v2 = (void *)qword_2B440;
  qword_2B440 = (uint64_t)v1;
}

id sub_45D4()
{
  if (qword_2B458 != -1) {
    dispatch_once(&qword_2B458, &stru_24518);
  }
  return (id)qword_2B450;
}

void sub_4614(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController", "init");
  v2 = (void *)qword_2B450;
  qword_2B450 = (uint64_t)v1;
}

id sub_4644()
{
  if (qword_2B468 != -1) {
    dispatch_once(&qword_2B468, &stru_24538);
  }
  return (id)qword_2B460;
}

void sub_4684(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController", "analytics");
  v2 = (void *)qword_2B460;
  qword_2B460 = (uint64_t)v1;
}

id sub_46B4()
{
  if (qword_2B478 != -1) {
    dispatch_once(&qword_2B478, &stru_24558);
  }
  return (id)qword_2B470;
}

void sub_46F4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController.Daemon", "default");
  v2 = (void *)qword_2B470;
  qword_2B470 = (uint64_t)v1;
}

void sub_4724(char *category)
{
  os_log_t v1 = os_log_create("com.apple.GameController.HID", category);
  v2 = (void *)qword_2B480;
  qword_2B480 = (uint64_t)v1;
}

id sub_4750()
{
  if (qword_2B488 != -1) {
    dispatch_once(&qword_2B488, &stru_24578);
  }
  return (id)qword_2B480;
}

void sub_4790(id a1)
{
  if (!qword_2B480) {
    objc_storeStrong((id *)&qword_2B480, &_os_log_default);
  }
}

id sub_47B4()
{
  if (qword_2B498 != -1) {
    dispatch_once(&qword_2B498, &stru_24598);
  }
  return (id)qword_2B490;
}

void sub_47F4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController.Settings", "default");
  v2 = (void *)qword_2B490;
  qword_2B490 = (uint64_t)v1;
}

id sub_4824()
{
  if (qword_2B4A8 != -1) {
    dispatch_once(&qword_2B4A8, &stru_245B8);
  }
  return (id)qword_2B4A0;
}

void sub_4864(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController.Haptics", "default");
  v2 = (void *)qword_2B4A0;
  qword_2B4A0 = (uint64_t)v1;
}

id sub_4894()
{
  if (qword_2B4B8 != -1) {
    dispatch_once(&qword_2B4B8, &stru_245D8);
  }
  return (id)qword_2B4B0;
}

void sub_48D4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.gamecontroller", "Signposts");
  v2 = (void *)qword_2B4B0;
  qword_2B4B0 = (uint64_t)v1;
}

id sub_4904()
{
  if (qword_2B4C8 != -1) {
    dispatch_once(&qword_2B4C8, &stru_245F8);
  }
  return (id)qword_2B4C0;
}

void sub_4944(id a1)
{
  os_log_t v1 = os_log_create("com.apple.runtime-issues", "GameController");
  v2 = (void *)qword_2B4C0;
  qword_2B4C0 = (uint64_t)v1;
}

NSXPCInterface *sub_4974()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCGameIntentServiceClientInterface);
}

NSXPCInterface *sub_4988()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCGameIntentServiceServerInterface);
}

dispatch_source_s *sub_499C(uint64_t a1, uint64_t a2, dispatch_queue_s *a3, void *a4)
{
  id v7 = a4;
  v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, a3);
  if (v8)
  {
    dispatch_time_t v9 = dispatch_walltime(0LL, 0LL);
    dispatch_source_set_timer(v8, v9, a1, a2);
    dispatch_source_set_event_handler(v8, v7);
    dispatch_resume(v8);
  }

  return v8;
}

void sub_4BD8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_4C08(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = sub_4750();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl( &dword_0,  v3,  OS_LOG_TYPE_DEFAULT,  "Connection to com.apple.GameController.gamecontrollerd.driver invalidated",  v4,  2u);
  }

  [WeakRetained setInterruptionHandler:0];
  [WeakRetained setInvalidationHandler:0];
  [WeakRetained invalidate];
}

void sub_4C9C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = sub_4750();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl( &dword_0,  v3,  OS_LOG_TYPE_DEFAULT,  "Connection to com.apple.GameController.gamecontrollerd.driver interrupted.  Attempting to re-establish.",  v5,  2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained remoteObjectProxy]);
  [v4 driverCheckIn];
}

void sub_5180(uint64_t a1, int a2, int a3, uint64_t a4)
{
  if (a3 | a2)
  {
    switch(a2)
    {
      case 3:
        id v11 = sub_4750();
        v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 134217984;
          uint64_t v14 = a1;
          id v7 = "BTSessionEventCallback: failed session = %p";
LABEL_15:
          _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v13, 0xCu);
        }

        break;
      case 2:
        id v12 = sub_4750();
        v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 134217984;
          uint64_t v14 = a1;
          id v7 = "BTSessionEventCallback: terminated session = %p";
          goto LABEL_15;
        }

        break;
      case 1:
        id v5 = sub_4750();
        v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
          break;
        }
        int v13 = 134217984;
        uint64_t v14 = a1;
        id v7 = "BTSessionEventCallback: detached session = %p";
        goto LABEL_15;
      default:
        return;
    }

    return;
  }

  id v9 = sub_4750();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134217984;
    uint64_t v14 = a1;
    _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_DEFAULT,  "BTSessionEventCallback: attached session = %p",  (uint8_t *)&v13,  0xCu);
  }

  if (!*(void *)(a4 + 40)) {
    *(void *)(a4 + 40) = a1;
  }
}

void sub_5324(uint64_t a1, void *a2)
{
  id v3 = sub_4750();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_176EC(v4, v5, v6, v7, v8, v9, v10, v11);
  }

  if (a2) {
    [a2 disconnect];
  }
}

void sub_54FC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_5514(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_5524(uint64_t a1)
{
}

void sub_552C(uint64_t a1)
{
  id v2 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  dispatch_queue_get_label(*(dispatch_queue_t *)(a1 + 32)),  4LL);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = sub_4750();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    uint64_t v9 = v3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Freeing HIDDevice on %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0LL;
}

LABEL_18:
  return v9;
}
}

BOOL sub_590C(id a1, NSDictionary *a2, NSDictionary *a3)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", @"DeviceUsagePage"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", @"DeviceUsage"));
    char v7 = (![v5 isEqual:&off_25F50]
       || ([v6 isEqual:&off_25F68] & 1) == 0)
      && (![v5 isEqual:&off_25F50]
       || ([v6 isEqual:&off_25F80] & 1) == 0)
  }

  else
  {
    char v7 = 1;
  }

  return v7;
}

void sub_5E4C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_5E70(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = sub_4750();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "calling cancel handler", v5, 2u);
    }

    (*(void (**)(void))(WeakRetained[1] + 16LL))();
    uint64_t v4 = (void *)WeakRetained[1];
    WeakRetained[1] = 0LL;
  }
}

void sub_603C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(dispatch_source_s **)(v2 + 32);
  if (v3)
  {
    dispatch_source_cancel(v3);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = 0LL;

    uint64_t v2 = *(void *)(a1 + 32);
  }

  uint64_t v6 = *(dispatch_source_s **)(v2 + 536);
  if (v6)
  {
    dispatch_source_cancel(v6);
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = *(void **)(v7 + 536);
    *(void *)(v7 + 536) = 0LL;
  }
}

LABEL_17:
        return;
      }

      *(void *)v22 = 0LL;
      v15 = BTDeviceFromAddress(self->_session, v21, v22);
      if (v15)
      {
        v16 = v15;
        v17 = sub_4750();
        uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_17;
        }
        *(_DWORD *)buf = 67109120;
        v26 = v16;
        uint64_t v10 = "GCHIDLog::disconnect: unable to get BTDevice; error code = %d";
LABEL_15:
        uint64_t v11 = buf;
        id v12 = v9;
        int v13 = 8;
        goto LABEL_16;
      }

      v18 = BTDeviceDisconnect(*(void *)v22);
      v19 = sub_4750();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      v20 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (v18)
      {
        if (!v20) {
          goto LABEL_17;
        }
        *(_DWORD *)buf = 67109120;
        v26 = v18;
        uint64_t v10 = "GCHIDLog::disconnect: error code = %d";
        goto LABEL_15;
      }

      if (!v20) {
        goto LABEL_17;
      }
      *(_WORD *)buf = 0;
      uint64_t v10 = "GCHIDLog::disconnect: SUCCESS";
      uint64_t v11 = buf;
    }

    else
    {
      uint64_t v14 = sub_4750();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      *(_WORD *)v22 = 0;
      uint64_t v10 = "GCHIDLog::disconnect: unable to get BTDevice; no valid BTSession";
      uint64_t v11 = v22;
    }

    id v12 = v9;
    int v13 = 2;
    goto LABEL_16;
  }

void sub_69C4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(dispatch_queue_s **)(v2 + 560);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_6A50;
  v8[3] = &unk_246B0;
  v8[4] = v2;
  uint64_t v4 = sub_499C(0x6FC23AC00uLL, 0x3B9ACA00uLL, v3, v8);
  uint64_t v5 = objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v5;
}

id sub_6A50(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateIdleState];
}

void sub_6C2C(id a1)
{
}

void sub_6C88(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  if (a1)
  {
    id v7 = v5;
    if (a3) {
      *(void *)(a1 + 664) = [v5 timestamp];
    }
    kdebug_trace( 835453000,  *(void *)(a1 + 656),  [v7 timestamp],  objc_msgSend(v7, "type"),  0);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 624));
    [WeakRetained dispatchEvent:v7];

    id v5 = v7;
  }
}

uint64_t sub_6D24(uint64_t result)
{
  if (result) {
    return *(void *)(result + 656);
  }
  return result;
}

id sub_6E5C(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchEvent:*(void *)(a1 + 40)];
}

id sub_6F7C(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchIdleEvent:*(void *)(a1 + 40)];
}

void sub_802C(uint64_t a1)
{
  os_log_t v1 = (id *)(a1 + 32);
  id WeakRetained = (timespec *)objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if (!LOBYTE(WeakRetained[30].tv_nsec))
    {
      LOBYTE(WeakRetained[30].tv_nsec) = 1;
      if (!WeakRetained[33].tv_nsec)
      {
        clock_gettime(_CLOCK_MONOTONIC_RAW, WeakRetained + 32);
        tv_sec = (dispatch_queue_s *)v3[35].tv_sec;
        v8[0] = _NSConcreteStackBlock;
        v8[1] = 3221225472LL;
        v8[2] = sub_8108;
        v8[3] = &unk_24620;
        objc_copyWeak(&v9, v1);
        id v5 = sub_499C(0xF4240uLL, 0x186A0uLL, tv_sec, v8);
        uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);
        tv_nsec = (void *)v3[33].tv_nsec;
        v3[33].tv_nsec = v6;

        objc_destroyWeak(&v9);
      }
    }
  }
}

void sub_8108(uint64_t a1)
{
  id WeakRetained = (timespec *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    clock_gettime(_CLOCK_MONOTONIC_RAW, &v13);
    if ((double)(uint64_t)((double)v13.tv_nsec
                         + (double)v13.tv_sec * 1000000000.0
                         - ((double)WeakRetained[32].tv_nsec
                          + (double)WeakRetained[32].tv_sec * 1000000000.0))
       * 0.000000001 >= *(float *)&WeakRetained[31].tv_sec)
    {
      WeakRetained[32] = v13;
      unsigned __int8 v2 = -[timespec isAnyHapticMotorEnabled](WeakRetained, "isAnyHapticMotorEnabled");
      id v3 = sub_4750();
      uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
      BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
      if ((v2 & 1) != 0)
      {
        if (v5) {
          sub_177A0(v4, v6, v7, v8, v9, v10, v11, v12);
        }

        HIDWORD(WeakRetained[30].tv_nsec) = 0;
        -[timespec dispatchHapticEvent](WeakRetained, "dispatchHapticEvent");
      }

      else
      {
        if (v5) {
          sub_177D0(v4, v6, v7, v8, v9, v10, v11, v12);
        }

        -[timespec stopHaptics](WeakRetained, "stopHaptics");
      }
    }
  }
}

void sub_87BC( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

LABEL_13:
  return (pair<BOOL, float>)(v12 | v11);
}

  return v10;
}
}

  return v10;
}

void sub_8DA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_8E38( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
}

LABEL_14:
  return v6;
}
}
}
}
}
}
}
}
}

void sub_8F9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_9070(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_91EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_92A4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

id sub_92B8(uint64_t a1, int a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](&OBJC_CLASS___NSMutableString, "stringWithCapacity:", 2 * a2));
  if (a2 >= 1)
  {
    unint64_t v5 = a2 + 1LL;
    do
    {
      if ((_DWORD)v5 == 2) {
        uint64_t v6 = &stru_24F58;
      }
      else {
        uint64_t v6 = @":";
      }
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%02x%@",  *(unsigned __int8 *)(a1 + (v5 - 2)),  v6));
      [v4 appendString:v7];

      --v5;
    }

    while (v5 > 1);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", v4));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 uppercaseString]);

  return v9;
}

uint64_t sub_93AC()
{
  if (qword_2B4E0 != -1) {
    dispatch_once(&qword_2B4E0, &stru_24718);
  }
  return byte_2B4E8;
}

void sub_93EC(id a1)
{
  os_log_t v1 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.GameController");
  byte_2B4E8 = -[NSUserDefaults BOOLForKey:](v1, "BOOLForKey:", @"GCPartnersEnable");
  id v2 = sub_4750();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = byte_2B4E8;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Partners mode enabled? %d", (uint8_t *)v4, 8u);
  }
}

NSData *sub_94C8()
{
  return +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &unk_20188, 37LL);
}

NSXPCInterface *sub_94E0()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCNintendoJoyConFusionGestureServiceClientInterface);
}

NSXPCInterface *sub_94F4()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCNintendoJoyConFusionGestureServiceServerInterface);
}

NSXPCInterface *sub_9508()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCAdaptiveTriggersServiceClientInterface);
}

NSXPCInterface *sub_951C()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCAdaptiveTriggersServiceServerInterface);
}

void sub_9530()
{
}

void sub_9694(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_996C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_9A98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_9AB0(uint64_t a1)
{
  uint64_t result = _os_feature_enabled_impl("GameController", "wired_nintendo_switch");
  uint64_t v3 = *(void *)(a1 + 32);
  if ((result & 1) == 0
    || (uint64_t result = (uint64_t)[*(id *)(a1 + 32) isBluetoothClassic],
        uint64_t v3 = *(void *)(a1 + 32),
        (result & 1) != 0)
    || (result = (uint64_t)[*(id *)(a1 + 32) isBluetoothLE], uint64_t v3 = *(void *)(a1 + 32), (result & 1) != 0))
  {
    if (!v3) {
      return result;
    }
    goto LABEL_5;
  }

  if (*(_WORD *)(v3 + 708) == 5)
  {
LABEL_5:
    [(id)v3 setLowPower:0];
    [(id)v3 refreshDeviceInfo];
    [(id)v3 refreshCalibrationData];
    return (uint64_t)[(id)v3 refreshLowPowerSetting];
  }

  *(_BYTE *)(v3 + 704) = 1;
  uint64_t v4 = *(void **)(a1 + 32);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_9BE8;
  v5[3] = &unk_24740;
  v5[4] = v4;
  return (uint64_t)[v4 setupUSBWithCompletion:v5];
}

id sub_9BA8(id result)
{
  if (result)
  {
    os_log_t v1 = result;
    [result setLowPower:0];
    [v1 refreshDeviceInfo];
    [v1 refreshCalibrationData];
    return [v1 refreshLowPowerSetting];
  }

  return result;
}

id sub_9BE8(id result)
{
  os_log_t v1 = (void *)*((void *)result + 4);
  if (v1)
  {
    [*((id *)result + 4) setLowPower:0];
    [v1 refreshDeviceInfo];
    [v1 refreshCalibrationData];
    return [v1 refreshLowPowerSetting];
  }

  return result;
}

void sub_9E00( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
  _Unwind_Resume(a1);
}

void sub_9F10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_9F2C(uint64_t a1)
{
}

void sub_9F34(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = *(id **)(a1 + 1048);
    if (v2)
    {
      uint64_t v3 = (dispatch_source_s *)*(id *)(a1 + 1056);
      uint64_t v4 = *(void **)(a1 + 1056);
      *(void *)(a1 + 1056) = 0LL;
      *(void *)(a1 + 1064) = 0LL;

      *(void *)(a1 + 104_Block_object_dispose(va, 8) = 0LL;
      dispatch_source_cancel(v3);
      sub_15060((uint64_t)v2);

      free(v2);
    }

    unint64_t v5 = *(id **)(a1 + 1024);
    if (v5)
    {
      do
      {
        uint64_t v6 = (id *)*v5;
        sub_15060((uint64_t)v5);

        free(v5);
        unint64_t v5 = v6;
      }

      while (v6);
    }

    *(void *)(a1 + 1024) = 0LL;
    *(void *)(a1 + 1032) = a1 + 1024;
  }

void sub_A00C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_A78C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_A828(uint64_t a1)
{
  char v1 = a1 - 1;
  if ((a1 - 1) < 0xC && ((0xF07u >> v1) & 1) != 0)
  {
    uint64_t v3 = *(&off_24B58 + v1);
  }

  else
  {
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", a1));
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 description]);
  }

  return v3;
}

void sub_A898(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_A8A8(int a1)
{
  v7[0] = @"red";
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  a1));
  v8[0] = v2;
  v7[1] = @"green";
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", BYTE1(a1)));
  v8[1] = v3;
  v7[2] = @"blue";
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", BYTE2(a1)));
  v8[2] = v4;
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  3LL));

  return v5;
}

void sub_A9A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_A9D4(uint64_t a1, unint64_t a2, int a3)
{
  v13[0] = @"x.last";
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  (unsigned __int16)a2));
  v14[0] = v5;
  v13[1] = @"y.last";
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", WORD1(a2)));
  v14[1] = v6;
  v13[2] = @"x.min";
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", WORD2(a2)));
  v14[2] = v7;
  v13[3] = @"x.max";
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", HIWORD(a2)));
  v14[3] = v8;
  v13[4] = @"y.min";
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  (unsigned __int16)a3));
  v14[4] = v9;
  v13[5] = @"y.max";
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", HIWORD(a3)));
  v14[5] = v10;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  6LL));

  return v11;
}

void sub_AB60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *sub_ABB4(uint64_t a1)
{
  if ((_DWORD)a1 == 63)
  {
    char v1 = @"HID";
  }

  else if ((_DWORD)a1 == 48)
  {
    char v1 = @"STANDARD-FULL";
  }

  else
  {
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", a1));
    char v1 = (__CFString *)objc_claimAutoreleasedReturnValue([v2 description]);
  }

  return v1;
}

void sub_AC20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_AD44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_B18C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

id sub_B240(unint64_t a1, int a2)
{
  v21[0] = @"center";
  v19[0] = @"x";
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  (unsigned __int16)a1));
  v19[1] = @"y";
  v20[0] = v14;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", WORD1(a1)));
  v20[1] = v4;
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  2LL));
  v22[0] = v5;
  v21[1] = @"min";
  v17[0] = @"x";
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", WORD2(a1)));
  v17[1] = @"y";
  v18[0] = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", HIWORD(a1)));
  v18[1] = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  2LL));
  v22[1] = v8;
  v21[2] = @"max";
  v15[0] = @"x";
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  (unsigned __int16)a2));
  v15[1] = @"y";
  v16[0] = v9;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", HIWORD(a2)));
  v16[1] = v10;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  2LL));
  v22[2] = v11;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  3LL));

  return v12;
}

void sub_B440( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

id sub_B4BC(unsigned __int16 *a1)
{
  v16[0] = @"unknown1";
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", a1[2]));
  v17[0] = v15;
  v16[1] = @"unknown2";
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", a1[3]));
  v17[1] = v14;
  void v16[2] = @"inner_dead_zone";
  timespec v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", a1[4]));
  void v17[2] = v13;
  v16[3] = @"unknown4";
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", a1[5]));
  v17[3] = v2;
  v16[4] = @"unknown5";
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", a1[6]));
  v17[4] = v3;
  v16[5] = @"unknown6";
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", a1[7]));
  v17[5] = v4;
  v16[6] = @"unknown7";
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", a1[8]));
  v17[6] = v5;
  v16[7] = @"unknown8";
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", a1[9]));
  v17[7] = v6;
  v16[8] = @"unknown9";
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", a1[10]));
  v17[8] = v7;
  v16[9] = @"unknown10";
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", a1[11]));
  v17[9] = v8;
  v16[10] = @"unknown11";
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", a1[12]));
  v17[10] = v9;
  v16[11] = @"unknown12";
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", a1[13]));
  v17[11] = v10;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  12LL));

  return v11;
}

void sub_B744( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

LABEL_15:
    v15 = 0;
    goto LABEL_16;
  }

  uint64_t v11 = 63LL;
LABEL_13:

  -[JoyConHIDServicePlugin setInputMode:](self, "setInputMode:", v11);
LABEL_14:
  v15 = 1;
LABEL_16:

  return v15;
}

void sub_B960(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_16:
  }

  v26 = i > 3;
  uint64_t v9 = v34[0];
  uint64_t v8 = v33;
LABEL_35:

LABEL_36:
  -[JoyConHIDServicePlugin setPlayerLights:](self, "setPlayerLights:", v9);
LABEL_37:

  return v26;
}

void sub_BD3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_BEEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_BEFC(uint64_t a1)
{
}

void sub_BF14(id a1, BOOL a2, NSError *a3)
{
  uint64_t v4 = a3;
  if (!a2)
  {
    id v5 = sub_4750();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_17800();
    }
  }
}

void sub_BF6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_BF7C(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a1)
  {
    int v6 = HIBYTE(a2);
    int v7 = a2;
    int v8 = BYTE1(a2);
    int v9 = BYTE2(a2);
    char v10 = ((HIBYTE(a2) == 2) << 7) | (16 * (a2 == 2)) | (a2 == 1) | (8 * (HIBYTE(a2) == 1)) | ((BYTE2(a2) == 2) << 6) | (32 * (BYTE1(a2) == 2)) | (2 * (BYTE1(a2) == 1)) | (4 * (BYTE2(a2) == 1));
    char v20 = v10;
    id v11 = sub_4750();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      if (v7 == 1) {
        int v13 = 111;
      }
      else {
        int v13 = 45;
      }
      if (v7 == 2) {
        int v13 = 42;
      }
      if (v8 == 1) {
        int v14 = 111;
      }
      else {
        int v14 = 45;
      }
      if (v8 == 2) {
        int v14 = 42;
      }
      if (v9 == 1) {
        int v15 = 111;
      }
      else {
        int v15 = 45;
      }
      if (v9 == 2) {
        int v15 = 42;
      }
      *(_DWORD *)buf = 67109888;
      int v22 = v13;
      if (v6 == 1) {
        int v16 = 111;
      }
      else {
        int v16 = 45;
      }
      __int16 v23 = 1024;
      int v24 = v14;
      __int16 v25 = 1024;
      int v26 = v15;
      if (v10 < 0) {
        int v17 = 42;
      }
      else {
        int v17 = v16;
      }
      __int16 v27 = 1024;
      int v28 = v17;
      _os_log_debug_impl(&dword_0, v12, OS_LOG_TYPE_DEBUG, "Set Player Lights Request: %c%c%c%c", buf, 0x1Au);
    }

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    void v18[2] = sub_160DC;
    v18[3] = &unk_24AF8;
    id v19 = v5;
    sub_151C4(a1, 0x30u, &v20, 1uLL, v18);
  }
}

void sub_C17C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_C2FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_C318(uint64_t a1)
{
}

void sub_C330(id a1, BOOL a2, NSError *a3)
{
  uint64_t v4 = a3;
  if (!a2)
  {
    id v5 = sub_4750();
    int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_17864();
    }
  }
}

void sub_C388(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_C398(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a1)
  {
    char v10 = a2;
    id v6 = sub_4750();
    int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_178C8();
    }

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_15AA8;
    void v8[3] = &unk_24AF8;
    id v9 = v5;
    sub_151C4(a1, 3u, &v10, 1uLL, v8);
  }
}

void sub_C45C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_C5FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_C614(uint64_t a1)
{
}

void sub_C62C(id a1, BOOL a2, NSError *a3)
{
  uint64_t v4 = a3;
  if (!a2)
  {
    id v5 = sub_4750();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_17928();
    }
  }
}

void sub_C684(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_C694(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a1)
  {
    char v10 = a2;
    id v6 = sub_4750();
    int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_1798C();
    }

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_15BE4;
    void v8[3] = &unk_24AF8;
    id v9 = v5;
    sub_151C4(a1, 8u, &v10, 1uLL, v8);
  }
}

void sub_C758( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_C8F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_C908(uint64_t a1)
{
}

void sub_C920(id a1, BOOL a2, NSError *a3)
{
  uint64_t v4 = a3;
  if (!a2)
  {
    id v5 = sub_4750();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_179EC();
    }
  }
}

void sub_C978(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_C988(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a1)
  {
    char v10 = a2;
    id v6 = sub_4750();
    int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_17A50();
    }

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_16218;
    void v8[3] = &unk_24AF8;
    id v9 = v5;
    sub_151C4(a1, 0x40u, &v10, 1uLL, v8);
  }
}

void sub_CA4C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_CBCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_CBE4(uint64_t a1)
{
}

void sub_CBFC(id a1, BOOL a2, NSError *a3)
{
  uint64_t v4 = a3;
  if (!a2)
  {
    id v5 = sub_4750();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_17AB0();
    }
  }
}

void sub_CC54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_CC64(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a1)
  {
    char v10 = a2;
    id v6 = sub_4750();
    int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_17B14();
    }

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_16354;
    void v8[3] = &unk_24AF8;
    id v9 = v5;
    sub_151C4(a1, 0x48u, &v10, 1uLL, v8);
  }
}

void sub_CD28( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_CEC0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  id v19 = va_arg(va1, id);

  objc_destroyWeak(v9);
  _Block_object_dispose(va, 8);

  _Block_object_dispose(va1, 8);
  objc_destroyWeak((id *)(v11 - 72));

  _Unwind_Resume(a1);
}

id sub_CF04(uint64_t a1, uint64_t a2)
{
  id result = objc_retainBlock(*(id *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_CF2C(uint64_t a1)
{
}

void sub_CF34(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  _DWORD v4[2] = sub_CFF0;
  v4[3] = &unk_24878;
  objc_copyWeak(&v6, v2);
  __int128 v5 = *(_OWORD *)(a1 + 32);
  sub_D1B4((uint64_t)WeakRetained, 20480LL, 1uLL, v4);

  objc_destroyWeak(&v6);
}

void sub_CFD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_CFF0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (!v5 || v6)
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8LL);
      if (*(_BYTE *)(v10 + 24))
      {
        *(_BYTE *)(v10 + 24) = 0;
        (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) + 16LL))();
      }

      else
      {
        id v20 = sub_4750();
        v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          objc_claimAutoreleasedReturnValue([v6 localizedDescription]);
          sub_17B74();
        }
      }
    }

    else
    {
      id v8 = v5;
      id v9 = [v8 bytes];
      if ([v8 length])
      {
        *((_BYTE *)WeakRetained + 963) = *v9;
      }

      else
      {
        id v11 = sub_4750();
        uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_17BB0(v12, v13, v14, v15, v16, v17, v18, v19);
        }
      }
    }
  }
}

void sub_D178(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_D1B4(uint64_t a1, uint64_t a2, unint64_t a3, void *a4)
{
  id v7 = a4;
  if (a1)
  {
    if (a3 < 0x1E)
    {
      int v17 = a2;
      char v18 = a3;
      id v12 = sub_4750();
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        sub_17C28(a3, a2, v13);
      }

      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_15D20;
      v14[3] = &unk_24B20;
      id v15 = v7;
      int v16 = a2;
      sub_151C4(a1, 0x10u, &v17, 5uLL, v14);
    }

    else
    {
      id v8 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Requesting SPI flash read with length [%zd bytes] > MAX_READ_SIZE [%zd bytes].",  a3,  29LL);
      id v9 = objc_alloc(&OBJC_CLASS___NSError);
      NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
      id v20 = v8;
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
      id v11 = -[NSError initWithDomain:code:userInfo:]( v9,  "initWithDomain:code:userInfo:",  @"JoyConErrorDomain",  18LL,  v10);

      (*((void (**)(id, void, NSError *))v7 + 2))(v7, 0LL, v11);
    }
  }
}

void sub_D368( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_D698( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, void *a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, void *a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, void *a39)
{
  objc_destroyWeak(v45);
  _Block_object_dispose(&a17, 8);

  objc_destroyWeak(v42);
  _Block_object_dispose(&a29, 8);

  objc_destroyWeak(v40);
  _Block_object_dispose((const void *)(v46 - 216), 8);

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v46 - 128));
  os_activity_scope_leave((os_activity_scope_state_t)(v46 - 120));

  _Unwind_Resume(a1);
}

void sub_D740(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[749])
  {
    WeakRetained[696] |= 2u;
    [WeakRetained ready];
  }
}

void sub_D7A8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_D7BC(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_D890;
  v6[3] = &unk_248F0;
  objc_copyWeak(&v8, v2);
  __int128 v5 = *(_OWORD *)(a1 + 32);
  id v4 = (id)v5;
  __int128 v7 = v5;
  sub_DAD8((uint64_t)WeakRetained, v6);

  objc_destroyWeak(&v8);
}

void sub_D870( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  objc_destroyWeak(v17);
  _Unwind_Resume(a1);
}

void sub_D890(uint64_t a1, unsigned __int16 *a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 48));
  __int128 v7 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[748] = 1;
    if (a2 && !v5)
    {
      *((_WORD *)WeakRetained + 36_Block_object_dispose(va, 8) = *a2;
      WeakRetained[738] = *((_BYTE *)a2 + 2);
      int v8 = *((_DWORD *)a2 + 1);
      *(_WORD *)(WeakRetained + 743) = a2[4];
      *(_DWORD *)(WeakRetained + 739) = v8;
      WeakRetained[745] = *((_BYTE *)a2 + 3);
      *((_WORD *)WeakRetained + 373) = a2[5];
      WeakRetained[749] = 1;
      id v9 = sub_4750();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v11 = *((unsigned __int8 *)a2 + 2) - 1;
        if (v11 < 0xC && ((0xF07u >> v11) & 1) != 0)
        {
          uint64_t v13 = *(&off_24B58 + (char)v11);
        }

        else
        {
          id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:"));
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 description]);
        }

        int v14 = *a2;
        int v20 = 138543618;
        v21 = v13;
        __int16 v22 = 1024;
        int v23 = v14;
        _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_DEFAULT,  "Device is a '%{public}@' with f/w version %#x.",  (uint8_t *)&v20,  0x12u);
      }

      uint64_t v15 = a1 + 32;
      goto LABEL_11;
    }

    id v16 = sub_4750();
    int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue([v5 localizedDescription]);
      sub_17C98();
    }

    char v18 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedRecoverySuggestion]);
    BOOL v19 = v18 == 0LL;

    if (!v19)
    {
      uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8LL) + 40LL;
LABEL_11:
      (*(void (**)(void))(*(void *)v15 + 16LL))();
    }
  }
}

void sub_DA98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_DAD8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id v4 = sub_4750();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_17CD4();
    }

    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_15814;
    v6[3] = &unk_24AF8;
    id v7 = v3;
    sub_151C4(a1, 2u, 0LL, 0LL, v6);
  }
}

void sub_DB90( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_DBB0(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  _DWORD v4[2] = sub_DC6C;
  v4[3] = &unk_24940;
  objc_copyWeak(&v5, v2);
  void v4[4] = *(void *)(a1 + 32);
  sub_D1B4((uint64_t)WeakRetained, 24576LL, 0x10uLL, v4);

  objc_destroyWeak(&v5);
}

void sub_DC54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_DC6C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (void **)objc_loadWeakRetained((id *)(a1 + 40));
  int v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = WeakRetained + 90;
    *((_BYTE *)WeakRetained + 72_Block_object_dispose(va, 8) = 1;
    if (!v5 || v6)
    {
      id v17 = sub_4750();
      char v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue([v6 localizedDescription]);
        sub_17D00();
      }

      BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedRecoverySuggestion]);
      BOOL v20 = v19 == 0LL;

      if (!v20) {
        (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) + 16LL))();
      }
    }

    else
    {
      id v10 = v5;
      unsigned int v11 = (char *)[v10 bytes];
      if ((unint64_t)[v10 length] <= 0xF)
      {
        id v21 = sub_4750();
        __int16 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_17D3C();
        }
      }

      else if ((*v11 & 0x80000000) == 0)
      {
        uint64_t v12 = 0LL;
        unsigned int v13 = 0;
        v23[0] = 0LL;
        v23[1] = 0LL;
        char v24 = 0;
        do
        {
          int v14 = v11[v12];
          if (v14 >= 1) {
            *((_BYTE *)v23 + v13++) = v14;
          }
          ++v12;
        }

        while (v12 != 16);
        uint64_t v15 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  v23,  strnlen((const char *)v23, 0xFuLL),  1LL);
        id v16 = *v9;
        *id v9 = v15;
      }
    }
  }
}

void sub_DE4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_DE8C(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  _DWORD v4[2] = sub_DF48;
  v4[3] = &unk_24940;
  objc_copyWeak(&v5, v2);
  void v4[4] = *(void *)(a1 + 32);
  sub_D1B4((uint64_t)WeakRetained, 24656LL, 6uLL, v4);

  objc_destroyWeak(&v5);
}

void sub_DF30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_DF48(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (!v5 || v6)
    {
      id v10 = sub_4750();
      unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue([v6 localizedDescription]);
        sub_17DA4();
      }

      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedRecoverySuggestion]);
      BOOL v13 = v12 == 0LL;

      if (!v13) {
        (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) + 16LL))();
      }
    }

    else
    {
      id v8 = v5;
      id v9 = (char *)[v8 bytes];
      if ((unint64_t)[v8 length] <= 5)
      {
        id v14 = sub_4750();
        uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_17DE0();
        }
      }

      else
      {
        WeakRetained[750] = *v9;
        *(_WORD *)(WeakRetained + 751) = *(_WORD *)(v9 + 1);
        WeakRetained[753] = v9[6];
        *((_WORD *)WeakRetained + 377) = *(_WORD *)(v9 + 7);
        WeakRetained[757] = 1;
      }
    }
  }
}

void sub_E0D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_E64C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, id *location, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, void *a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, void *a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, void *a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62,uint64_t a63)
{
  objc_destroyWeak(v71);
  objc_destroyWeak(v70);

  objc_destroyWeak(v69);
  objc_destroyWeak(v67);
  _Block_object_dispose(&a62, 8);

  _Block_object_dispose((const void *)(v72 - 216), 8);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v72 - 144));

  _Unwind_Resume(a1);
}

void sub_E734(uint64_t a1)
{
  id WeakRetained = (float32x2_t *)objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (!WeakRetained
    || (~WeakRetained[98].u8[0] & 3) != 0
    || (~WeakRetained[108].u8[4] & 3) != 0
    || (~WeakRetained[112].u8[6] & 3) != 0
    || (WeakRetained[116].i8[6] & 1) == 0)
  {
    goto LABEL_6;
  }

  int v4 = WeakRetained[92].u8[2];
  if ((v4 - 1) >= 2)
  {
    if (v4 == 3)
    {
      WeakRetained[101].i32[1] = 81002511;
      WeakRetained[105].i32[0] = 81002511;
      unsigned int v5 = 15;
      int v6 = 1236;
    }

    else
    {
      unsigned int v5 = WeakRetained[101].u16[2];
      int v6 = WeakRetained[101].u16[3];
    }
  }

  else
  {
    WeakRetained[101].i32[1] = 55705615;
    WeakRetained[105].i32[0] = 55705615;
    unsigned int v5 = 15;
    int v6 = 850;
  }

  *(float *)&double v2 = (float)v5 / (float)(v6 - WeakRetained[102].u16[2]);
  -[float32x2_t setLeftThumbstickNoiseBuffer:](WeakRetained, "setLeftThumbstickNoiseBuffer:", v2);
  id v7 = (_WORD *)&v3[105] + 1;
  LOWORD(v_Block_object_dispose(va, 8) = v3[105].i16[0];
  *(float *)&double v9 = (float)v8 / (float)(v3[105].u16[1] - v3[106].u16[0]);
  -[float32x2_t setRightThumbstickNoiseBuffer:](v3, "setRightThumbstickNoiseBuffer:", v9);
  float32_t v10 = (float)(1.0 / (float)(v3[110].i16[1] - v3[109].i16[2])) * 4.0;
  v11.i32[0] = v3[109].i16[3];
  v11.i32[1] = v3[110].i16[0];
  v12.i32[0] = v3[109].i16[0];
  v12.i32[1] = v3[109].i16[1];
  float32x2_t v13 = vcvt_f32_s32(vsub_s32(v11, v12));
  __asm { FMOV            V2.2S, #1.0 }

  float32x2_t v19 = vdiv_f32(_D2, v13);
  __asm { FMOV            V2.2S, #4.0 }

  v3[117] = vmul_f32(v19, _D2);
  v19.f32[0] = 816.0 / (float)(v3[112].i16[0] - v3[111].i16[1]);
  float32_t v21 = 816.0 / (float)(v3[112].i16[1] - v3[111].i16[2]);
  _D2.f32[0] = 816.0 / (float)(v3[112].i16[2] - v3[111].i16[3]);
  v3[118].f32[0] = v10;
  v3[118].i32[1] = v19.i32[0];
  v3[119].f32[0] = v21;
  v3[119].f32[1] = _D2.f32[0];
  int v22 = v3[92].u8[2];
  switch(v22)
  {
    case 1:
      int v44 = v3[96].u16[0] - v3[95].u16[2];
      if (v44 < 0) {
        int v44 = v3[95].u16[2] - v3[96].u16[0];
      }
      if (v44 <= 1)
      {
        int v45 = v3[96].u16[1] - v3[95].u16[3];
        if (v45 < 0) {
          int v45 = v3[95].u16[3] - v3[96].u16[1];
        }
        if (v45 <= 1)
        {
          v3[87].i32[1] |= 4u;
          id v46 = sub_4750();
          v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v56 = 0;
            _os_log_impl( &dword_0,  v47,  OS_LOG_TYPE_DEFAULT,  "#Quirks: Suspiciously good left stick factory calibration data.",  v56,  2u);
          }

          unsigned int v48 = v3[96].u16[0];
          if (v48 >= v3[96].u16[1]) {
            LOWORD(v4_Block_object_dispose(va, 8) = v3[96].i16[1];
          }
          v3[101].i16[3] = v48;
        }
      }

      if ((v3[101].i8[2] & 4) != 0)
      {
        int v28 = (unsigned __int16 *)&v3[99] + 1;
        int v49 = v3[99].u16[1] - v3[98].u16[3];
        if (v49 < 0) {
          int v49 = v3[98].u16[3] - v3[99].u16[1];
        }
        if (v49 <= 1)
        {
          int v50 = v3[99].u16[2] - v3[99].u16[0];
          if (v50 < 0) {
            int v50 = v3[99].u16[0] - v3[99].u16[2];
          }
          if (v50 <= 1)
          {
            v3[87].i32[1] |= 8u;
            id v51 = sub_4750();
            v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
            id v7 = (_WORD *)&v3[101] + 3;
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v55 = 0;
              _os_log_impl( &dword_0,  v33,  OS_LOG_TYPE_DEFAULT,  "#Quirks: Suspiciously good left stick user calibration data.",  v55,  2u);
            }

            v30 = (float32x2_t *)((char *)v3 + 796);
            goto LABEL_76;
          }
        }
      }

      break;
    case 2:
      int v36 = v3[97].u16[2] - v3[97].u16[0];
      if (v36 < 0) {
        int v36 = v3[97].u16[0] - v3[97].u16[2];
      }
      if (v36 <= 1)
      {
        int v37 = v3[97].u16[3] - v3[97].u16[1];
        if (v37 < 0) {
          int v37 = v3[97].u16[1] - v3[97].u16[3];
        }
        if (v37 <= 1)
        {
          v3[87].i32[1] |= 4u;
          id v38 = sub_4750();
          v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v54 = 0;
            _os_log_impl( &dword_0,  v39,  OS_LOG_TYPE_DEFAULT,  "#Quirks: Suspiciously good right stick factory calibration data.",  v54,  2u);
          }

          unsigned int v40 = v3[97].u16[2];
          if (v40 >= v3[97].u16[3]) {
            LOWORD(v40) = v3[97].i16[3];
          }
          v3[105].i16[1] = v40;
        }
      }

      if ((v3[101].i8[2] & 8) != 0)
      {
        int v28 = (unsigned __int16 *)&v3[100] + 3;
        int v41 = v3[100].u16[3] - v3[100].u16[1];
        if (v41 < 0) {
          int v41 = v3[100].u16[1] - v3[100].u16[3];
        }
        if (v41 <= 1)
        {
          v30 = v3 + 101;
          int v42 = v3[101].u16[0] - v3[100].u16[2];
          if (v42 < 0) {
            int v42 = v3[100].u16[2] - v3[101].u16[0];
          }
          if (v42 <= 1)
          {
            v3[87].i32[1] |= 8u;
            id v43 = sub_4750();
            v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v53 = 0;
              v34 = "#Quirks: Suspiciously good right stick user calibration data.";
              v35 = (uint8_t *)&v53;
              goto LABEL_54;
            }

LABEL_76:
            unsigned int v52 = *v28;
            if (v52 >= v30->u16[0]) {
              LOWORD(v52) = v30->i16[0];
            }
            *id v7 = v52;
          }
        }
      }

      break;
    case 3:
      int v23 = v3[96].u16[0] - v3[95].u16[2];
      if (v23 < 0) {
        int v23 = v3[95].u16[2] - v3[96].u16[0];
      }
      if (v23 <= 1)
      {
        int v24 = v3[96].u16[1] - v3[95].u16[3];
        if (v24 < 0) {
          int v24 = v3[95].u16[3] - v3[96].u16[1];
        }
        if (v24 <= 1)
        {
          v3[87].i32[1] |= 4u;
          id v25 = sub_4750();
          int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( &dword_0,  v26,  OS_LOG_TYPE_DEFAULT,  "#Quirks: Suspiciously good left stick factory calibration data.",  buf,  2u);
          }

          unsigned int v27 = v3[96].u16[0];
          if (v27 >= v3[96].u16[1]) {
            LOWORD(v27) = v3[96].i16[1];
          }
          v3[101].i16[3] = v27;
        }
      }

      int v28 = (unsigned __int16 *)&v3[97] + 2;
      int v29 = v3[97].u16[2] - v3[97].u16[0];
      if (v29 < 0) {
        int v29 = v3[97].u16[0] - v3[97].u16[2];
      }
      if (v29 <= 1)
      {
        v30 = (float32x2_t *)((char *)v3 + 782);
        int v31 = v3[97].u16[3] - v3[97].u16[1];
        if (v31 < 0) {
          int v31 = v3[97].u16[1] - v3[97].u16[3];
        }
        if (v31 <= 1)
        {
          v3[87].i32[1] |= 4u;
          id v32 = sub_4750();
          v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v57 = 0;
            v34 = "#Quirks: Suspiciously good right stick factory calibration data.";
            v35 = (uint8_t *)&v57;
LABEL_54:
            _os_log_impl(&dword_0, v33, OS_LOG_TYPE_DEFAULT, v34, v35, 2u);
            goto LABEL_76;
          }

          goto LABEL_76;
        }
      }

      break;
  }

LABEL_6:
}

void sub_ECC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_ECE8(uint64_t a1)
{
  double v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_EDCC;
  v6[3] = &unk_24990;
  objc_copyWeak(&v9, v2);
  uint64_t v8 = *(void *)(a1 + 48);
  __int128 v5 = *(_OWORD *)(a1 + 32);
  id v4 = (id)v5;
  __int128 v7 = v5;
  sub_D1B4((uint64_t)WeakRetained, 24637LL, 0x12uLL, v6);

  objc_destroyWeak(&v9);
}

void sub_EDAC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  objc_destroyWeak(v16);
  _Unwind_Resume(a1);
}

void sub_EDCC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (!v5 || v6)
    {
      id v22 = sub_4750();
      int v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue([v6 localizedDescription]);
        sub_17E40();
      }

      int v24 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedRecoverySuggestion]);
      if (v24)
      {
        BOOL v25 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) > 0;

        if (v25)
        {
          --*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
          (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) + 16LL))();
        }
      }
    }

    else
    {
      id v8 = v5;
      id v9 = (unsigned __int16 *)[v8 bytes];
      if ((unint64_t)[v8 length] <= 0x11)
      {
        id v26 = sub_4750();
        unsigned int v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          sub_17E7C();
        }
      }

      else
      {
        int v10 = *v9;
        unsigned int v11 = v10 | (*((unsigned __int8 *)v9 + 2) << 16);
        int v12 = *(unsigned __int16 *)((char *)v9 + 3);
        unsigned int v13 = v12 | (*((unsigned __int8 *)v9 + 5) << 16);
        int v14 = v9[3];
        unsigned int v15 = v14 | (*((unsigned __int8 *)v9 + 8) << 16);
        WeakRetained[380] = v12 & 0xFFF;
        WeakRetained[381] = v13 >> 12;
        WeakRetained[382] = v14 & 0xFFF;
        WeakRetained[383] = v15 >> 12;
        WeakRetained[384] = v10 & 0xFFF;
        WeakRetained[385] = v11 >> 12;
        LOBYTE(v11) = *((_BYTE *)WeakRetained + 784);
        *((_BYTE *)WeakRetained + 784) = v11 | 1;
        int v16 = *(unsigned __int16 *)((char *)v9 + 9);
        unsigned int v17 = v16 | (*((unsigned __int8 *)v9 + 11) << 16);
        int v18 = v9[6];
        unsigned int v19 = v18 | (*((unsigned __int8 *)v9 + 14) << 16);
        int v20 = *(unsigned __int16 *)((char *)v9 + 15);
        unsigned int v21 = v20 | (*((unsigned __int8 *)v9 + 17) << 16);
        WeakRetained[386] = v16 & 0xFFF;
        WeakRetained[387] = v17 >> 12;
        WeakRetained[388] = v18 & 0xFFF;
        WeakRetained[389] = v19 >> 12;
        WeakRetained[390] = v20 & 0xFFF;
        WeakRetained[391] = v21 >> 12;
        *((_BYTE *)WeakRetained + 784) = v11 | 3;
        (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
      }
    }
  }
}

void sub_F018(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_F058(uint64_t a1)
{
  double v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_F13C;
  v6[3] = &unk_24990;
  objc_copyWeak(&v9, v2);
  uint64_t v8 = *(void *)(a1 + 48);
  __int128 v5 = *(_OWORD *)(a1 + 32);
  id v4 = (id)v5;
  __int128 v7 = v5;
  sub_D1B4((uint64_t)WeakRetained, 32784LL, 0x16uLL, v6);

  objc_destroyWeak(&v9);
}

void sub_F11C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  objc_destroyWeak(v16);
  _Unwind_Resume(a1);
}

void sub_F13C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (!v5 || v6)
    {
      id v22 = sub_4750();
      int v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue([v6 localizedDescription]);
        sub_17EDC();
      }

      int v24 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedRecoverySuggestion]);
      if (v24)
      {
        BOOL v25 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) > 0;

        if (v25)
        {
          --*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
          (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) + 16LL))();
        }
      }
    }

    else
    {
      id v8 = v5;
      id v9 = (unsigned __int16 *)[v8 bytes];
      if ((unint64_t)[v8 length] <= 0x15)
      {
        id v26 = sub_4750();
        unsigned int v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          sub_17F18();
        }
      }

      else
      {
        int v10 = v9[1];
        unsigned int v11 = v10 | (*((unsigned __int8 *)v9 + 4) << 16);
        int v12 = *(unsigned __int16 *)((char *)v9 + 5);
        unsigned int v13 = v12 | (*((unsigned __int8 *)v9 + 7) << 16);
        int v14 = v9[4];
        unsigned int v15 = v14 | (*((unsigned __int8 *)v9 + 10) << 16);
        WeakRetained[393] = v12 & 0xFFF;
        WeakRetained[394] = v13 >> 12;
        WeakRetained[395] = v14 & 0xFFF;
        WeakRetained[396] = v15 >> 12;
        WeakRetained[397] = v10 & 0xFFF;
        WeakRetained[398] = v11 >> 12;
        LOBYTE(v11) = *((_BYTE *)WeakRetained + 810) | 1;
        *((_BYTE *)WeakRetained + 810) = v11;
        LOBYTE(v11) = v11 & 0xFB | (4 * (*v9 == 41394));
        *((_BYTE *)WeakRetained + 810) = v11;
        int v16 = *(unsigned __int16 *)((char *)v9 + 13);
        unsigned int v17 = v16 | (*((unsigned __int8 *)v9 + 15) << 16);
        int v18 = v9[8];
        unsigned int v19 = v18 | (*((unsigned __int8 *)v9 + 18) << 16);
        int v20 = *(unsigned __int16 *)((char *)v9 + 19);
        unsigned int v21 = v20 | (*((unsigned __int8 *)v9 + 21) << 16);
        WeakRetained[399] = v16 & 0xFFF;
        WeakRetained[400] = v17 >> 12;
        WeakRetained[401] = v18 & 0xFFF;
        WeakRetained[402] = v19 >> 12;
        WeakRetained[403] = v20 & 0xFFF;
        WeakRetained[404] = v21 >> 12;
        LOBYTE(v11) = v11 | 2;
        *((_BYTE *)WeakRetained + 810) = v11;
        *((_BYTE *)WeakRetained + 810) = v11 & 0xF7 | (8 * (*(unsigned __int16 *)((char *)v9 + 11) == 41394));
        (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
      }
    }
  }
}

void sub_F3B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_F3F8(uint64_t a1)
{
  double v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_F4DC;
  v6[3] = &unk_24990;
  objc_copyWeak(&v9, v2);
  uint64_t v8 = *(void *)(a1 + 48);
  __int128 v5 = *(_OWORD *)(a1 + 32);
  id v4 = (id)v5;
  __int128 v7 = v5;
  sub_D1B4((uint64_t)WeakRetained, 24710LL, 0x12uLL, v6);

  objc_destroyWeak(&v9);
}

void sub_F4BC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  objc_destroyWeak(v16);
  _Unwind_Resume(a1);
}

void sub_F4DC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (!v5 || v6)
    {
      id v10 = sub_4750();
      unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue([v6 localizedDescription]);
        sub_17F80();
      }

      int v12 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedRecoverySuggestion]);
      if (v12)
      {
        BOOL v13 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) > 0;

        if (v13)
        {
          --*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
          (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) + 16LL))();
        }
      }
    }

    else
    {
      id v8 = v5;
      id v9 = [v8 bytes];
      if ((unint64_t)[v8 length] <= 0x11)
      {
        id v14 = sub_4750();
        unsigned int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_17FBC();
        }
      }

      else
      {
        WeakRetained[408] = *v9 & 0xFFF;
        WeakRetained[409] = (*(_DWORD *)v9 >> 12) & 0xFFF;
        WeakRetained[410] = *(_WORD *)((char *)v9 + 3) & 0xFFF;
        WeakRetained[411] = (*(void *)v9 >> 36) & 0xFFF;
        WeakRetained[412] = v9[3] & 0xFFF;
        WeakRetained[413] = ((*(void *)v9 >> 60) | (16 * v9[4])) & 0xFFF;
        WeakRetained[414] = *(_WORD *)((char *)v9 + 9) & 0xFFF;
        WeakRetained[415] = *((_DWORD *)v9 + 2) >> 20;
        WeakRetained[416] = v9[6] & 0xFFF;
        WeakRetained[417] = (*((void *)v9 + 1) >> 44) & 0xFFF;
        WeakRetained[418] = *(_WORD *)((char *)v9 + 15) & 0xFFF;
        WeakRetained[419] = v9[8] >> 4;
        *((_BYTE *)WeakRetained + 868) |= 1u;
        (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
      }
    }
  }
}

void sub_F714(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_F754(uint64_t a1)
{
  double v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_F838;
  v6[3] = &unk_24990;
  objc_copyWeak(&v9, v2);
  uint64_t v8 = *(void *)(a1 + 48);
  __int128 v5 = *(_OWORD *)(a1 + 32);
  id v4 = (id)v5;
  __int128 v7 = v5;
  sub_D1B4((uint64_t)WeakRetained, 24728LL, 0x12uLL, v6);

  objc_destroyWeak(&v9);
}

void sub_F818( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  objc_destroyWeak(v16);
  _Unwind_Resume(a1);
}

void sub_F838(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (!v5 || v6)
    {
      id v10 = sub_4750();
      unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue([v6 localizedDescription]);
        sub_1801C();
      }

      int v12 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedRecoverySuggestion]);
      if (v12)
      {
        BOOL v13 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) > 0;

        if (v13)
        {
          --*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
          (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) + 16LL))();
        }
      }
    }

    else
    {
      id v8 = v5;
      id v9 = [v8 bytes];
      if ((unint64_t)[v8 length] <= 0x11)
      {
        id v14 = sub_4750();
        unsigned int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_18058();
        }
      }

      else
      {
        WeakRetained[422] = *v9 & 0xFFF;
        WeakRetained[423] = (*(_DWORD *)v9 >> 12) & 0xFFF;
        WeakRetained[424] = *(_WORD *)((char *)v9 + 3) & 0xFFF;
        WeakRetained[425] = (*(void *)v9 >> 36) & 0xFFF;
        WeakRetained[426] = v9[3] & 0xFFF;
        WeakRetained[427] = ((*(void *)v9 >> 60) | (16 * v9[4])) & 0xFFF;
        WeakRetained[428] = *(_WORD *)((char *)v9 + 9) & 0xFFF;
        WeakRetained[429] = *((_DWORD *)v9 + 2) >> 20;
        WeakRetained[430] = v9[6] & 0xFFF;
        WeakRetained[431] = (*((void *)v9 + 1) >> 44) & 0xFFF;
        WeakRetained[432] = *(_WORD *)((char *)v9 + 15) & 0xFFF;
        WeakRetained[433] = v9[8] >> 4;
        *((_BYTE *)WeakRetained + 868) |= 2u;
        (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
      }
    }
  }
}

void sub_FA70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_FAB0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v5)
    {
      id v8 = v5;
      id v9 = (char *)[v8 bytes];
      if ((unint64_t)[v8 length] > 0x17)
      {
        *((void *)WeakRetained + 109) = *(void *)v9;
        *((_DWORD *)WeakRetained + 220) = *((_DWORD *)v9 + 2);
        *(void *)(WeakRetained + 890) = *(void *)(v9 + 12);
        *(_DWORD *)(WeakRetained + 89_Block_object_dispose(va, 8) = *((_DWORD *)v9 + 5);
        WeakRetained[902] |= 1u;
        (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
        goto LABEL_8;
      }

      id v12 = sub_4750();
      unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1811C();
      }
    }

    else
    {
      id v10 = sub_4750();
      unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_180B8();
      }
    }
  }

LABEL_8:
}
}
}

void sub_FBD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_FBFC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v5)
    {
      id v8 = v5;
      id v9 = (unsigned __int16 *)[v8 bytes];
      if ((unint64_t)[v8 length] > 0x19)
      {
        *((void *)WeakRetained + 113) = *(void *)(v9 + 1);
        *((_DWORD *)WeakRetained + 22_Block_object_dispose(va, 8) = *(_DWORD *)(v9 + 5);
        *(void *)(WeakRetained + 922) = *(void *)(v9 + 7);
        *(_DWORD *)(WeakRetained + 930) = *(_DWORD *)(v9 + 11);
        char v10 = WeakRetained[934] | 1;
        WeakRetained[934] = v10;
        WeakRetained[934] = v10 & 0xFD | (2 * (*v9 == 41394));
        (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
        goto LABEL_8;
      }

      id v13 = sub_4750();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_18184();
      }
    }

    else
    {
      id v11 = sub_4750();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_180B8();
      }
    }
  }

void sub_FD3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_FD64(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v5)
    {
      id v8 = v5;
      id v9 = (char *)[v8 bytes];
      if ((unint64_t)[v8 length] > 5)
      {
        *((_WORD *)WeakRetained + 442) = *(_WORD *)v9;
        *(_DWORD *)(WeakRetained + 886) = *(_DWORD *)(v9 + 2);
        WeakRetained[902] |= 2u;
        (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
        goto LABEL_8;
      }

      id v12 = sub_4750();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_181EC();
      }
    }

    else
    {
      id v10 = sub_4750();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_180B8();
      }
    }
  }

void sub_FE78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100C8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, id a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, id a27, uint64_t a28, uint64_t a29, char a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, id a35)
{
  int v42 = v40;

  objc_destroyWeak(v39);
  _Block_object_dispose(&a17, 8);

  objc_destroyWeak(v37);
  _Block_object_dispose(&a30, 8);

  objc_destroyWeak((id *)(v41 - 120));
  os_activity_scope_leave((os_activity_scope_state_t)(v41 - 112));

  _Unwind_Resume(a1);
}

void sub_10148(uint64_t a1)
{
  double v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1021C;
  v6[3] = &unk_24A08;
  objc_copyWeak(&v8, v2);
  __int128 v5 = *(_OWORD *)(a1 + 32);
  id v4 = (id)v5;
  __int128 v7 = v5;
  sub_1033C(WeakRetained, v6);

  objc_destroyWeak(&v8);
}

void sub_101FC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  objc_destroyWeak(v17);
  _Unwind_Resume(a1);
}

void sub_1021C(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (!v5 && (a2 & 1) != 0) {
      goto LABEL_4;
    }
    id v8 = sub_4750();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue([v5 localizedDescription]);
      sub_1824C();
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedRecoverySuggestion]);
    BOOL v11 = v10 == 0LL;

    if (v11) {
LABEL_4:
    }
      uint64_t v7 = a1 + 32;
    else {
      uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8LL) + 40LL;
    }
    (*(void (**)(void))(*(void *)v7 + 16LL))();
  }
}

void sub_10310(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1033C(void *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id v4 = sub_4750();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_18288();
    }

    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_149E4;
    v6[3] = &unk_24AF8;
    id v7 = v3;
    [a1 enqueueProprietaryCommand:4 expectsResponse:0 data:0 length:0 replyHandler:v6];
  }
}

void sub_103F8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10418(uint64_t a1)
{
  double v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  _DWORD v4[2] = sub_10504;
  v4[3] = &unk_24A30;
  objc_copyWeak(&v8, v2);
  uint64_t v7 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  sub_1062C(WeakRetained, v4);

  objc_destroyWeak(&v8);
}

void sub_104DC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  objc_destroyWeak(v15);
  _Unwind_Resume(a1);
}

void sub_10504(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v5 || (a2 & 1) == 0)
    {
      id v8 = sub_4750();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue([v5 localizedDescription]);
        sub_182B4();
      }

      id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedRecoverySuggestion]);
      BOOL v11 = v10 == 0LL;

      if (v11) {
        uint64_t v7 = a1 + 32;
      }
      else {
        uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8LL) + 40LL;
      }
    }

    else
    {
      uint64_t v7 = a1 + 40;
    }

    (*(void (**)(void))(*(void *)v7 + 16LL))();
  }
}

void sub_10600(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1062C(void *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id v4 = sub_4750();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_182F0();
    }

    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_14690;
    v6[3] = &unk_24AF8;
    id v7 = v3;
    [a1 enqueueProprietaryCommand:2 expectsResponse:1 data:0 length:0 replyHandler:v6];
  }
}

void sub_106E8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_107B0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_107D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v10 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v12 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v13 = sub_6D24((uint64_t)WeakRetained);
    kdebug_trace(835452996LL, v13, a3, a4, a5);
    v12[136] = a3;
    if (a5 > 62)
    {
      if (a5 == 63)
      {
        [v12 handleHIDControllerPayload:63 withData:v10 timestamp:a3];
        goto LABEL_14;
      }

      if (a5 == 129)
      {
        sub_10D60((uint64_t)v12, 129LL, v10);
        goto LABEL_14;
      }
    }

    else
    {
      if (a5 == 33)
      {
        sub_109D4((uint64_t)v12, 33LL, v10);
        goto LABEL_14;
      }

      if (a5 == 48)
      {
        [v12 handleStandardFullPayload:48 withData:v10 timestamp:a3];
        goto LABEL_14;
      }
    }

    id v14 = sub_4750();
    unsigned int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      int v16 = 134218755;
      uint64_t v17 = a4;
      __int16 v18 = 2048;
      uint64_t v19 = a5;
      __int16 v20 = 1040;
      unsigned int v21 = [v10 length];
      __int16 v22 = 2097;
      id v23 = [v10 bytes];
      _os_log_debug_impl( &dword_0,  v15,  OS_LOG_TYPE_DEBUG,  "Received unknown report: type = %li, reportID = %#lx, bytes = %{private}.*P",  (uint8_t *)&v16,  0x26u);
    }
  }

void sub_109A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_109D4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a1)
  {
    id v6 = _os_activity_create( &dword_0,  "Sub-command Reply",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v6, &state);
    id v7 = v5;
    id v8 = (unsigned __int8 *)[v7 bytes];
    id v9 = (char *)[v7 length];
    if ((unint64_t)v9 <= 0xE)
    {
      id v22 = sub_4750();
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      *(_DWORD *)buf = 134218496;
      *(void *)id v32 = a2;
      *(_WORD *)&v32[8] = 2048;
      v33 = v9;
      __int16 v34 = 2048;
      uint64_t v35 = 8LL;
      uint64_t v19 = "Payload for input report [%#zx] has length [%{bytes}zu], which is less than the minimum expected length [%{b"
            "ytes}zu]. Ignoring.";
      __int16 v20 = v13;
      uint32_t v21 = 32;
    }

    else
    {
      sub_1288C((void *)a1, (uint64_t)(v8 + 1));
      id v10 = sub_4750();
      BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        sub_1831C();
      }

      uint64_t v12 = *(void *)(a1 + 1048);
      if (v12)
      {
        uint64_t v13 = (os_log_s *)*(id *)(a1 + 1056);
        id v14 = *(void **)(a1 + 1056);
        *(void *)(a1 + 1056) = 0LL;
        *(void *)(a1 + 1064) = 0LL;

        *(void *)(a1 + 104_Block_object_dispose(va, 8) = 0LL;
        dispatch_source_cancel((dispatch_source_t)v13);
        unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subdataWithRange:", 15, v9 - 15));
        if (sub_129B8(v12, v16, (uint64_t)v8, v15))
        {
          sub_12CA4(a1);
        }

        else
        {
          id v23 = sub_4750();
          int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            int v25 = v8[14];
            int v26 = *(unsigned __int8 *)(v12 + 42);
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)id v32 = v25;
            *(_WORD *)&v32[4] = 1024;
            *(_DWORD *)&v32[6] = v26;
            _os_log_impl( &dword_0,  v24,  OS_LOG_TYPE_DEFAULT,  "Received a reply for sub-command [%#x].  Expected reply for [%#x].",  buf,  0xEu);
          }

          dispatch_time_t v27 = dispatch_time(0LL, 1000000000LL);
          int v28 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([(id)a1 dispatchQueue]);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_12EC4;
          block[3] = &unk_24740;
          block[4] = a1;
          dispatch_after(v27, v28, block);
        }

        free((void *)v12);
        goto LABEL_12;
      }

      id v17 = sub_4750();
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
LABEL_12:

        os_activity_scope_leave(&state);
        goto LABEL_13;
      }

      int v18 = v8[14];
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)id v32 = v18;
      uint64_t v19 = "Received an unexpected reply for sub-command [%#x].";
      __int16 v20 = v13;
      uint32_t v21 = 8;
    }

    _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
    goto LABEL_12;
  }

void sub_10D0C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_10D60(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a1)
  {
    id v6 = _os_activity_create( &dword_0,  "Proprietary Ack",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v6, &state);
    id v7 = v5;
    id v8 = [v7 bytes];
    id v9 = (char *)[v7 length];
    if ((unint64_t)v9 <= 1)
    {
      id v25 = sub_4750();
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      *(_DWORD *)buf = 134218496;
      *(void *)uint64_t v35 = a2;
      *(_WORD *)&v35[8] = 2048;
      int v36 = v9;
      __int16 v37 = 2048;
      uint64_t v38 = 8LL;
      __int16 v20 = "Payload for input report [%#zx] has length [%{bytes}zu], which is less than the minimum expected length [%{b"
            "ytes}zu]. Ignoring.";
      uint32_t v21 = v13;
      uint32_t v22 = 32;
    }

    else
    {
      id v10 = sub_4750();
      BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        sub_183A0();
      }

      uint64_t v12 = *(void *)(a1 + 1000);
      if (v12)
      {
        uint64_t v13 = (os_log_s *)*(id *)(a1 + 1008);
        id v14 = *(void **)(a1 + 1008);
        *(void *)(a1 + 100_Block_object_dispose(va, 8) = 0LL;
        *(void *)(a1 + 1016) = 0LL;

        *(void *)(a1 + 1000) = 0LL;
        dispatch_source_cancel((dispatch_source_t)v13);
        unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subdataWithRange:", 2, v9 - 2));
        uint64_t v16 = v15;
        if (v15) {
          id v17 = v15;
        }
        else {
          id v17 = (id)objc_claimAutoreleasedReturnValue(+[NSData data](&OBJC_CLASS___NSData, "data"));
        }
        id v23 = v17;

        if (sub_12ECC(v12, v24, (uint64_t)v8, v23))
        {
          sub_130CC(a1);
        }

        else
        {
          id v26 = sub_4750();
          dispatch_time_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            int v28 = v8[1];
            int v29 = *(unsigned __int8 *)(v12 + 41);
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)uint64_t v35 = v28;
            *(_WORD *)&v35[4] = 1024;
            *(_DWORD *)&v35[6] = v29;
            _os_log_impl( &dword_0,  v27,  OS_LOG_TYPE_DEFAULT,  "Received an ack for proprietary command [%#x].  Expected reply for [%#x].",  buf,  0xEu);
          }

          dispatch_time_t v30 = dispatch_time(0LL, 1000000000LL);
          int v31 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([(id)a1 dispatchQueue]);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_132F0;
          block[3] = &unk_24740;
          block[4] = a1;
          dispatch_after(v30, v31, block);
        }

        free((void *)v12);
        goto LABEL_16;
      }

      if (v8[1] == 1)
      {
LABEL_17:
        os_activity_scope_leave(&state);

        goto LABEL_18;
      }

      id v18 = sub_4750();
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
LABEL_16:

        goto LABEL_17;
      }

      int v19 = v8[1];
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)uint64_t v35 = v19;
      __int16 v20 = "Received an unexpected ack for proprietary command [%#x].";
      uint32_t v21 = v13;
      uint32_t v22 = 8;
    }

    _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
    goto LABEL_16;
  }

void sub_110BC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1181C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_11874(void *a1, unsigned __int16 *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = v5;
  int32x2_t v7 = vdup_n_s32(a2[1] & 0xF);
  __asm { FMOV            V10.2S, #1.0 }

  int8x8_t v13 = vand_s8((int8x8_t)vceq_s32(v7, (int32x2_t)0x300000007LL), _D10);
  if ((a2[1] & 0xE) != 0) {
    float v14 = *(float *)v13.i32;
  }
  else {
    float v14 = 1.0;
  }
  if ((a2[1] & 0xE) == 4) {
    float v15 = 1.0;
  }
  else {
    float v15 = *(float *)&v13.i32[1];
  }
  unsigned int v16 = *a2;
  int v17 = v5[738];
  float v18 = 0.0;
  if (v17 == 1)
  {
    int8x8_t v22 = v13;
    [v5 dispatchMenuButtonEventWithValue:(v16 >> 8) & 1 timestamp:a3];
    [v6 homeButtonPressed:(*a2 >> 13) & 1];
    float v21 = (float)((v16 >> 10) & 1);
    float v20 = (float)(v16 >> 15);
    float v19 = (float)((v16 >> 14) & 1);
  }

  else
  {
    if (v17 != 2)
    {
      float v19 = 0.0;
      float v20 = 0.0;
      float v21 = 0.0;
      goto LABEL_13;
    }

    int8x8_t v22 = v13;
    [v5 dispatchMenuButtonEventWithValue:(v16 >> 9) & 1 timestamp:a3];
    [v6 homeButtonPressed:(*a2 >> 12) & 1];
    float v18 = (float)((v16 >> 10) & 1);
    float v19 = (float)(v16 >> 15);
    float v20 = (float)((v16 >> 14) & 1);
    float v21 = 0.0;
  }

  int8x8_t v13 = v22;
LABEL_13:
  uint64_t v23 = 0LL;
  float v24 = v14;
  float v25 = v15;
  int8x8_t v26 = vbsl_s8( (int8x8_t)vcgt_u32( (uint32x2_t)0x200000002LL,  (uint32x2_t)(*(void *)&vadd_s32(v7, (int32x2_t)0xFF000000FBLL) & 0xFFFFFEFFFFFFFEFFLL)),  _D10,  v13);
  float v27 = (float)(v16 & 1);
  float32x4_t v28 = vcvtq_f32_u32(vmovl_u16((uint16x4_t)(*(void *)&vshl_u16( (uint16x4_t)(*(void *)&vdup_n_s16(v16) & 0xFF00FF00FF00FFLL),  (uint16x4_t)0xFFFCFFFDFFFFFFFELL) & 0xFF01FF01FF01FF01LL)));
  float v29 = (float)((v16 >> 5) & 1);
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  float v32 = v19;
  float v33 = v20;
  float v34 = v21;
  float v35 = v18;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  uint64_t v42 = 0LL;
  [v6 dispatchGameControllerExtendedEventWithState:&v23 timestamp:a3];
}

void sub_11A68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_123:
            sub_11874(v12, (unsigned __int16 *)buf, a5);
          }

LABEL_124:
          goto LABEL_125;
        }

        v94 = v25;
        v66 = *((unsigned __int8 *)v9 + 5);
        v67 = *(unsigned __int16 *)((char *)v9 + 3);
        v68 = (unsigned __int16)v67 | (v66 << 16);
        if (type == 1)
        {
          v70 = 0x2000;
        }

        else
        {
          v69 = *(unsigned __int16 *)((char *)v9 + 3) | (*((unsigned __int8 *)v9 + 5) << 16);
          if (type != 2)
          {
LABEL_71:
            -[GCGamepadHIDServicePlugin dispatchMenuButtonEventWithValue:timestamp:]( v12,  "dispatchMenuButtonEventWithValue:timestamp:",  (v69 >> 9) & 1,  a5,  v94);
            -[GCGamepadHIDServicePlugin dispatchOptionsButtonEventWithValue:timestamp:]( v12,  "dispatchOptionsButtonEventWithValue:timestamp:",  HIBYTE(*(unsigned __int16 *)((char *)v9 + 3)) & 1,  a5);
            v75 = vdupq_n_s32(v68);
            v76 = (float32x2_t)vrev64_s32((int32x2_t)v96);
            *(void *)buf = 0LL;
            *(float32x4_t *)&buf[8] = vcvtq_f32_u32(vmovl_u16((uint16x4_t)(*(void *)&vmovn_s32((int32x4_t)vshlq_u32((uint32x4_t)(*(_OWORD *)&v75 & __PAIR128__(0xFFFFFF00FFFFFFLL, 0xFFFFFF00FFFFFFLL)), (uint32x4_t)xmmword_20300)) & 0xFF01FF01FF01FF01LL)));
            v99 = vcvt_f32_u32((uint32x2_t)(*(void *)&vshl_u32( (uint32x2_t)vand_s8( *(int8x8_t *)v75.i8,  (int8x8_t)0xFF000000FFLL),  (uint32x2_t)0xFFFFFFFEFFFFFFFDLL) & 0xFFFFFFC1FFFFFFC1LL));
            *(float *)&v100 = (float)((v67 >> 1) & 1);
            *((float *)&v100 + 1) = (float)(v67 & 1);
            *(float *)v101 = (float)((v66 >> 6) & 1);
            *(float *)&v101[4] = (float)((v67 >> 6) & 1);
            *(_DWORD *)&v101[8] = fmaxf(v96.f32[1], 0.0);
            v77 = (float32x2_t)vrev64_s32(v95);
            *(int8x8_t *)&v101[12] = vand_s8((int8x8_t)vneg_f32(v76), (int8x8_t)vcltz_f32(v76));
            *(float32x2_t *)&v101[20] = vmaxnm_f32((float32x2_t)__PAIR64__(v95.u32[1], v96.u32[0]), 0LL);
            *(int8x8_t *)&v101[28] = vand_s8((int8x8_t)vneg_f32(v77), (int8x8_t)vcltz_f32(v77));
            *(_DWORD *)&v101[36] = fmaxf(*(float *)v95.i32, 0.0);
            *(float *)&v102 = (float)((unsigned __int16)v66 >> 7);
            *((float *)&v102 + 1) = (float)((v68 >> 7) & 1);
            *((float32x2_t *)&v102 + 1) = vcvt_f32_u32((uint32x2_t)vand_s8( (int8x8_t)vshl_u32( (uint32x2_t)(v75.i64[0] & 0xFFFFFF00FFFFFFLL),  (uint32x2_t)0xFFFFFFF6FFFFFFF5LL),  (int8x8_t)0x100000001LL));
            v103 = 0u;
            v104 = 0u;
            v105 = 0u;
            v106 = 0u;
            v107 = 0u;
            v108 = 0u;
            v109 = 0LL;
            -[GCGamepadHIDServicePlugin dispatchGameControllerExtendedEventWithState:timestamp:]( v12,  "dispatchGameControllerExtendedEventWithState:timestamp:",  buf,  a5);
            goto LABEL_124;
          }

          v70 = 4096;
        }

        -[JoyConHIDServicePlugin homeButtonPressed:](v12, "homeButtonPressed:", (v70 & v68) != 0);
        v69 = *(unsigned __int16 *)((char *)v9 + 3) | (*((unsigned __int8 *)v9 + 5) << 16);
        goto LABEL_71;
      case 3u:
        __int128 v37 = self;
        __int128 v38 = v37;
        if ((v37->_setupState & 4) != 0)
        {
          self->_statistics.sticks.left.last.x = v9[3] & 0xFFF;
          self->_statistics.sticks.left.last.y = (v9[3] | (*((unsigned __int8 *)v9 + 8) << 16)) >> 12;
          __int128 v39 = self->_statistics.sticks.left.extents.x.min;
          if (v39 >= (v9[3] & 0xFFFu)) {
            LOWORD(v39) = v9[3] & 0xFFF;
          }
          self->_statistics.sticks.left.extents.x.min = v39;
          __int128 v40 = self->_statistics.sticks.left.extents.x.max;
          if (v40 <= (v9[3] & 0xFFFu)) {
            LOWORD(v40) = v9[3] & 0xFFF;
          }
          self->_statistics.sticks.left.extents.x.max = v40;
          __int128 v41 = self->_statistics.sticks.left.extents.y.min;
          self->_statistics.sticks.left.extents.y.min = v41;
          uint64_t v42 = self->_statistics.sticks.left.extents.y.max;
          self->_statistics.sticks.left.extents.y.max = v42;
          self->_statistics.sticks.right.last.x = *(unsigned __int16 *)((char *)v9 + 9) & 0xFFF;
          self->_statistics.sticks.right.last.y = (*(unsigned __int16 *)((char *)v9 + 9) | (*((unsigned __int8 *)v9 + 11) << 16)) >> 12;
          id v43 = self->_statistics.sticks.right.extents.x.min;
          self->_statistics.sticks.right.extents.x.min = v43;
          int v44 = self->_statistics.sticks.right.extents.x.max;
          self->_statistics.sticks.right.extents.x.max = v44;
          int v45 = self->_statistics.sticks.right.extents.y.min;
          self->_statistics.sticks.right.extents.y.min = v45;
          id v46 = self->_statistics.sticks.right.extents.y.max;
          self->_statistics.sticks.right.extents.y.max = v46;
          v47 = &v37->_calibration;
          v97 = sub_17194( v9[3] & 0xFFF,  (v9[3] | (*((unsigned __int8 *)v9 + 8) << 16)) >> 12,  &v37->_calibration.stick.factory.left.center.x,  (uint64_t)&v37->_calibration.stick.user + 24);
          v93 = sub_17194( *(unsigned __int16 *)((char *)v9 + 9) & 0xFFF,  (*(unsigned __int16 *)((char *)v9 + 9) | (*((unsigned __int8 *)v9 + 11) << 16)) >> 12,  &v47->stick.factory.right.center.x,  (uint64_t)&v47->stick.parameters.left.unknown11);
          LODWORD(v47) = *((unsigned __int8 *)v9 + 5);
          unsigned int v48 = *(unsigned __int16 *)((char *)v9 + 3);
          int v49 = (unsigned __int16)v48 | ((_DWORD)v47 << 16);
          -[GCGamepadHIDServicePlugin dispatchHomeButtonEventWithValue:timestamp:]( v38,  "dispatchHomeButtonEventWithValue:timestamp:",  (v49 >> 12) & 1,  a5);
          -[GCGamepadHIDServicePlugin dispatchMenuButtonEventWithValue:timestamp:]( v38,  "dispatchMenuButtonEventWithValue:timestamp:",  (*(unsigned __int16 *)((char *)v9 + 3) >> 9) & 1,  a5);
          -[GCGamepadHIDServicePlugin dispatchOptionsButtonEventWithValue:timestamp:]( v38,  "dispatchOptionsButtonEventWithValue:timestamp:",  HIBYTE(*(unsigned __int16 *)((char *)v9 + 3)) & 1,  a5);
          -[GCGamepadHIDServicePlugin dispatchShareButtonEventWithValue:timestamp:]( v38,  "dispatchShareButtonEventWithValue:timestamp:",  (*(unsigned __int16 *)((char *)v9 + 3) >> 13) & 1,  a5);
          int v50 = (uint32x4_t)vdupq_n_s32(v49);
          id v51 = (float32x2_t)vrev64_s32((int32x2_t)v97);
          *(void *)buf = 0LL;
          *(float32x4_t *)&buf[8] = vcvtq_f32_u32(vmovl_u16((uint16x4_t)(*(void *)&vmovn_s32((int32x4_t)vshlq_u32(v50, (uint32x4_t)xmmword_20300)) & 0xFF01FF01FF01FF01LL)));
          v99 = vcvt_f32_u32((uint32x2_t)(*(void *)&vshl_u32( (uint32x2_t)vand_s8( *(int8x8_t *)v50.i8,  (int8x8_t)0xFF000000FFLL),  (uint32x2_t)0xFFFFFFFEFFFFFFFDLL) & 0xFFFFFFC1FFFFFFC1LL));
          *(float *)&v100 = (float)((v48 >> 1) & 1);
          *((float *)&v100 + 1) = (float)(v48 & 1);
          *(float *)v101 = (float)((v47 >> 6) & 1);
          *(float *)&v101[4] = (float)((v48 >> 6) & 1);
          *(_DWORD *)&v101[8] = fmaxf(v97.f32[1], 0.0);
          unsigned int v52 = (float32x2_t)vrev64_s32((int32x2_t)v93);
          *(int8x8_t *)&v101[12] = vand_s8((int8x8_t)vneg_f32(v51), (int8x8_t)vcltz_f32(v51));
          *(float32x2_t *)&v101[20] = vmaxnm_f32((float32x2_t)__PAIR64__(v93.u32[1], v97.u32[0]), 0LL);
          *(int8x8_t *)&v101[28] = vand_s8((int8x8_t)vneg_f32(v52), (int8x8_t)vcltz_f32(v52));
          *(_DWORD *)&v101[36] = fmaxf(v93.f32[0], 0.0);
          *(float *)&v102 = (float)((unsigned __int16)v47 >> 7);
          *((float *)&v102 + 1) = (float)((v49 >> 7) & 1);
          *((float32x2_t *)&v102 + 1) = vcvt_f32_u32((uint32x2_t)vand_s8( (int8x8_t)vshl_u32( *(uint32x2_t *)v50.i8,  (uint32x2_t)0xFFFFFFF6FFFFFFF5LL),  (int8x8_t)0x100000001LL));
          v103 = 0u;
          v104 = 0u;
          v105 = 0u;
          v106 = 0u;
          v107 = 0u;
          v108 = 0u;
          v109 = 0LL;
          -[GCGamepadHIDServicePlugin dispatchGameControllerExtendedEventWithState:timestamp:]( v38,  "dispatchGameControllerExtendedEventWithState:timestamp:",  buf,  a5);
        }

        if (v38->_playerLights.LED[1])
        {
          *(_DWORD *)&uint8_t buf[4] = 0;
          *(_DWORD *)&buf[1] = 0;
          *(_DWORD *)((char *)&v100 + 1) = 0;
          HIDWORD(v100) = 0;
          *(_OWORD *)&v101[24] = 0u;
          v102 = 0u;
          *(void *)&v103 = 0LL;
          v53.f32[0] = -(float)*(__int16 *)((char *)v9 + 13);
          v54 = (float)*(__int16 *)((char *)v9 + 15);
          v55 = (float)-(float)((float)*(__int16 *)((char *)v9 + 17) * v38->_calibration.motion.coefficients.accel.y);
          *(double *)&v56 = (float)(v38->_calibration.motion.coefficients.gyro.y
                                  * (float)((float)*(__int16 *)((char *)v9 + 23)
          buf[0] = 1;
          v58.f32[1] = v57;
          v59 = (int8x16_t)vmulq_f64( vcvtq_f64_f32(vmul_f32(*(float32x2_t *)&v38->_calibration.motion.coefficients.accel.z, v58)),  (float64x2_t)vdupq_n_s64(0x3F91DF46371BDC3FuLL));
          *(int8x16_t *)&buf[8] = vextq_s8(v59, v59, 8uLL);
          v99 = v56;
          LOBYTE(v100) = 1;
          v53.f32[1] = v54;
          v60 = (int8x16_t)vcvtq_f64_f32(vmul_f32(*(float32x2_t *)&v38->_calibration.motion.user.data.gyro.sensitivity.z, v53));
          *(int8x16_t *)v101 = vextq_s8(v60, v60, 8uLL);
          *(double *)&v101[16] = v55;
          -[GCGamepadHIDServicePlugin dispatchMotionEventWithState:timestamp:]( v38,  "dispatchMotionEventWithState:timestamp:",  buf,  a5);
        }

        goto LABEL_125;
      case 9u:
      case 0xAu:
        float v27 = self;
        float32x4_t v28 = *((unsigned __int8 *)v9 + 5);
        float v29 = *(unsigned __int16 *)((char *)v9 + 3);
        __int128 v30 = v29 | (v28 << 16);
        -[GCGamepadHIDServicePlugin dispatchMenuButtonEventWithValue:timestamp:]( v27,  "dispatchMenuButtonEventWithValue:timestamp:",  (v30 >> 9) & 1,  a5);
        -[GCGamepadHIDServicePlugin dispatchOptionsButtonEventWithValue:timestamp:]( v27,  "dispatchOptionsButtonEventWithValue:timestamp:",  HIBYTE(*(unsigned __int16 *)((char *)v9 + 3)) & 1,  a5);
        __int128 v31 = (uint32x4_t)vdupq_n_s32(v30);
        *(float32x4_t *)&buf[8] = vcvtq_f32_u32(vmovl_u16((uint16x4_t)(*(void *)&vmovn_s32((int32x4_t)vshlq_u32(v31, (uint32x4_t)xmmword_20300)) & 0xFF01FF01FF01FF01LL)));
        *(void *)buf = 0LL;
        v99 = vcvt_f32_u32((uint32x2_t)(*(void *)&vshl_u32( (uint32x2_t)vand_s8(*(int8x8_t *)v31.i8, (int8x8_t)0xFF000000FFLL),  (uint32x2_t)0xFFFFFFFEFFFFFFFDLL) & 0xFFFFFFC1FFFFFFC1LL));
        v100 = 0LL;
        *(float *)v101 = (float)((v28 >> 6) & 1);
        *(float *)&v101[4] = (float)((v29 >> 6) & 1);
        memset(&v101[8], 0, 32);
        v102 = 0u;
        v103 = 0u;
        v104 = 0u;
        v105 = 0u;
        v106 = 0u;
        v107 = 0u;
        v108 = 0u;
        v109 = 0LL;
        -[GCGamepadHIDServicePlugin dispatchGameControllerExtendedEventWithState:timestamp:]( v27,  "dispatchGameControllerExtendedEventWithState:timestamp:",  buf,  a5);

        goto LABEL_125;
      case 0xBu:
        float v32 = self;
        float v33 = *((unsigned __int8 *)v9 + 5);
        float v34 = *(unsigned __int16 *)((char *)v9 + 3);
        float v35 = v34 | (v33 << 16);
        -[GCGamepadHIDServicePlugin dispatchMenuButtonEventWithValue:timestamp:]( v32,  "dispatchMenuButtonEventWithValue:timestamp:",  (v35 >> 9) & 1,  a5);
        -[GCGamepadHIDServicePlugin dispatchOptionsButtonEventWithValue:timestamp:]( v32,  "dispatchOptionsButtonEventWithValue:timestamp:",  HIBYTE(*(unsigned __int16 *)((char *)v9 + 3)) & 1,  a5);
        __int128 v36 = (uint32x4_t)vdupq_n_s32(v35);
        *(float32x4_t *)&buf[8] = vcvtq_f32_u32(vmovl_u16((uint16x4_t)(*(void *)&vmovn_s32((int32x4_t)vshlq_u32(v36, (uint32x4_t)xmmword_20300)) & 0xFF01FF01FF01FF01LL)));
        *(void *)buf = 0LL;
        v99 = vcvt_f32_u32((uint32x2_t)(*(void *)&vshl_u32( (uint32x2_t)vand_s8(*(int8x8_t *)v36.i8, (int8x8_t)0xFF000000FFLL),  (uint32x2_t)0xFFFFFFFEFFFFFFFDLL) & 0xFFFFFFC1FFFFFFC1LL));
        *(float *)&v100 = (float)((v34 >> 1) & 1);
        *((float *)&v100 + 1) = (float)(v34 & 1);
        *(float *)v101 = (float)((v33 >> 6) & 1);
        *(float *)&v101[4] = (float)((v34 >> 6) & 1);
        memset(&v101[8], 0, 32);
        v102 = 0u;
        v103 = 0u;
        v104 = 0u;
        v105 = 0u;
        v106 = 0u;
        v107 = 0u;
        v108 = 0u;
        v109 = 0LL;
        -[GCGamepadHIDServicePlugin dispatchGameControllerExtendedEventWithState:timestamp:]( v32,  "dispatchGameControllerExtendedEventWithState:timestamp:",  buf,  a5);

LABEL_125:
        sub_1288C(self, (uint64_t)v9 + 1);
        goto LABEL_126;
      default:
        goto LABEL_126;
    }
  }

  v82 = sub_4750();
  v83 = (os_log_s *)objc_claimAutoreleasedReturnValue(v82);
  if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218496;
    *(void *)&uint8_t buf[4] = a3;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2048;
    v99 = (float32x2_t)8LL;
    _os_log_impl( &dword_0,  v83,  OS_LOG_TYPE_INFO,  "Payload for input report [%#zx] has length [%{bytes}zu], which is less than the minimum expected length [%{bytes}zu]. Ignoring.",  buf,  0x20u);
  }

LABEL_126:
}

void sub_1282C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1288C(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v9 = v3;
  if (v3[960])
  {
    unsigned int v4 = *(unsigned __int8 *)(a2 + 1);
  }

  else
  {
    unsigned int v4 = *(unsigned __int8 *)(a2 + 1);
  }

  v3[962] = v4 >> 5;
  v3[961] = (*(_BYTE *)(a2 + 1) & 0x10) != 0;
  v3[960] = 1;
  char v5 = v3[961];
  *((_BYTE *)[v3 batteryReport] + 2) = v5;
  id v6 = v9;
  switch(v9[962])
  {
    case 1:
      int32x2_t v7 = (char *)[v9 batteryReport];
      char v8 = 10;
      goto LABEL_11;
    case 2:
      int32x2_t v7 = (char *)[v9 batteryReport];
      char v8 = 30;
      goto LABEL_11;
    case 3:
      int32x2_t v7 = (char *)[v9 batteryReport];
      char v8 = 60;
      goto LABEL_11;
    case 4:
      int32x2_t v7 = (char *)[v9 batteryReport];
      char v8 = 100;
LABEL_11:
      *int32x2_t v7 = v8;
      id v6 = v9;
      break;
    default:
      break;
  }

  [v6 sendBatteryReport];
LABEL_13:
}

void sub_129A4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

BOOL sub_129B8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  uint64_t v7 = voucher_adopt(*(id *)(a1 + 16));
  int v8 = *(unsigned __int8 *)(a3 + 14);
  int v9 = *(unsigned __int8 *)(a1 + 42);
  if (v8 != v9)
  {
    int v17 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Received reply for a different sub-command [%#x].",  *(unsigned __int8 *)(a3 + 14));
    float v18 = objc_alloc(&OBJC_CLASS___NSError);
    v29[0] = NSLocalizedDescriptionKey;
    v29[1] = NSLocalizedRecoverySuggestionErrorKey;
    v30[0] = v17;
    v30[1] = @"Try again.";
    float v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v29,  2LL));
    uint64_t v12 = -[NSError initWithDomain:code:userInfo:]( v18,  "initWithDomain:code:userInfo:",  @"JoyConErrorDomain",  15LL,  v19);

    uint64_t v21 = *(void *)(a1 + 8);
    float v14 = (void **)(a1 + 8);
    uint64_t v20 = v21;
    if (v21)
    {
      (*(void (**)(uint64_t, void, NSError *))(v20 + 16))(v20, 0LL, v12);
      goto LABEL_8;
    }

LABEL_11:
    unsigned int v16 = 0LL;
    goto LABEL_12;
  }

  if (*(char *)(a3 + 13) < 0)
  {
    id v10 = sub_4750();
    BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_18540();
    }
    uint64_t v12 = 0LL;
  }

  else
  {
    id v23 = sub_4750();
    float v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      sub_184DC();
    }

    BOOL v11 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Device rejected sub-command.");
    float v25 = objc_alloc(&OBJC_CLASS___NSError);
    NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
    float32x4_t v28 = v11;
    int8x8_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
    uint64_t v12 = -[NSError initWithDomain:code:userInfo:]( v25,  "initWithDomain:code:userInfo:",  @"JoyConErrorDomain",  14LL,  v26);
  }

  uint64_t v15 = *(void *)(a1 + 8);
  float v14 = (void **)(a1 + 8);
  uint64_t v13 = v15;
  if (!v15) {
    goto LABEL_11;
  }
  (*(void (**)(uint64_t, id, NSError *))(v13 + 16))(v13, v6, v12);
LABEL_8:
  unsigned int v16 = *v14;
LABEL_12:
  *float v14 = 0LL;

  return v8 == v9;
}

void sub_12C34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_12CA4(uint64_t a1)
{
  if (a1)
  {
    if (!*(void *)(a1 + 1048))
    {
      double v2 = *(id **)(a1 + 1024);
      if (v2)
      {
        id v3 = *v2;
        *(void *)(a1 + 1024) = *v2;
        if (!v3) {
          *(void *)(a1 + 1032) = a1 + 1024;
        }
        --*(_DWORD *)(a1 + 1040);
        uint64_t v4 = mach_absolute_time();
        if (sub_14BE4((uint64_t)v2, (void *)a1))
        {
          objc_initWeak(&location, (id)a1);
          dispatch_time_t v5 = dispatch_time(0LL, 2000000000LL);
          id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([(id)a1 dispatchQueue]);
          uint64_t v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v6);

          dispatch_source_set_timer(v7, v5, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_15740;
          block[3] = &unk_24AD0;
          objc_copyWeak(v13, &location);
          v13[1] = v2;
          dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_DETACHED, block);
          dispatch_source_set_event_handler(v7, v8);

          dispatch_resume(v7);
          int v9 = *(void **)(a1 + 1056);
          *(void *)(a1 + 104_Block_object_dispose(va, 8) = v2;
          *(void *)(a1 + 1056) = v7;

          *(void *)(a1 + 1064) = v4;
          objc_destroyWeak(v13);
          objc_destroyWeak(&location);
        }

        else
        {

          free(v2);
          id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([(id)a1 dispatchQueue]);
          v11[0] = _NSConcreteStackBlock;
          v11[1] = 3221225472LL;
          v11[2] = sub_1580C;
          v11[3] = &unk_24740;
          v11[4] = a1;
          dispatch_async(v10, v11);
        }
      }
    }
  }

void sub_12EB0(_Unwind_Exception *a1)
{
}

void sub_12EC4(uint64_t a1)
{
}

BOOL sub_12ECC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  uint64_t v7 = voucher_adopt(*(id *)(a1 + 16));
  int v8 = *(unsigned __int8 *)(a3 + 1);
  int v9 = *(unsigned __int8 *)(a1 + 41);
  if (v8 == v9)
  {
    uint64_t v10 = *(void *)(a1 + 8);
    if (v10)
    {
      (*(void (**)(uint64_t, id, void))(v10 + 16))(v10, v6, 0LL);
      BOOL v11 = *(void **)(a1 + 8);
    }

    else
    {
      BOOL v11 = 0LL;
    }

    *(void *)(a1 + _Block_object_dispose(va, 8) = 0LL;
  }

  else
  {
    uint64_t v13 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Received reply for a different proprietary command [%#x].",  *(unsigned __int8 *)(a3 + 1));
    float v14 = objc_alloc(&OBJC_CLASS___NSError);
    v19[0] = NSLocalizedDescriptionKey;
    v19[1] = NSLocalizedRecoverySuggestionErrorKey;
    v20[0] = v13;
    v20[1] = @"Try again.";
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  2LL));
    unsigned int v16 = -[NSError initWithDomain:code:userInfo:]( v14,  "initWithDomain:code:userInfo:",  @"JoyConErrorDomain",  34LL,  v15);

    uint64_t v17 = *(void *)(a1 + 8);
    if (v17)
    {
      (*(void (**)(uint64_t, void, NSError *))(v17 + 16))(v17, 0LL, v16);
      float v18 = *(void **)(a1 + 8);
    }

    else
    {
      float v18 = 0LL;
    }

    *(void *)(a1 + _Block_object_dispose(va, 8) = 0LL;
  }

  return v8 == v9;
}

void sub_13088(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_130CC(uint64_t a1)
{
  if (a1)
  {
    if (!*(void *)(a1 + 1000))
    {
      double v2 = *(uint64_t **)(a1 + 976);
      if (v2)
      {
        uint64_t v3 = *v2;
        *(void *)(a1 + 976) = *v2;
        if (!v3) {
          *(void *)(a1 + 984) = a1 + 976;
        }
        --*(_DWORD *)(a1 + 992);
        uint64_t v4 = mach_absolute_time();
        if (sub_1398C((uint64_t)v2, (void *)a1) && *((_BYTE *)v2 + 24))
        {
          objc_initWeak(&location, (id)a1);
          dispatch_time_t v5 = dispatch_time(0LL, 1000000000LL);
          id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([(id)a1 dispatchQueue]);
          uint64_t v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v6);

          dispatch_source_set_timer(v7, v5, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_1457C;
          block[3] = &unk_24AD0;
          objc_copyWeak(v13, &location);
          v13[1] = v2;
          dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_DETACHED, block);
          dispatch_source_set_event_handler(v7, v8);

          dispatch_resume(v7);
          int v9 = *(void **)(a1 + 1008);
          *(void *)(a1 + 1000) = v2;
          *(void *)(a1 + 100_Block_object_dispose(va, 8) = v7;

          *(void *)(a1 + 1016) = v4;
          objc_destroyWeak(v13);
          objc_destroyWeak(&location);
        }

        else
        {

          free(v2);
          uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([(id)a1 dispatchQueue]);
          v11[0] = _NSConcreteStackBlock;
          v11[1] = 3221225472LL;
          v11[2] = sub_14688;
          v11[3] = &unk_24740;
          v11[4] = a1;
          dispatch_async(v10, v11);
        }
      }
    }
  }

void sub_132DC(_Unwind_Exception *a1)
{
}

void sub_132F0(uint64_t a1)
{
}

void sub_136FC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

uint64_t sub_137CC(uint64_t result, float a2)
{
  if (result)
  {
    double v2 = a2;
    if (a2 >= 0.035863824)
    {
      if (v2 >= 0.047502641)
      {
        if (v2 >= 0.065562582)
        {
          if (v2 >= 0.096642284)
          {
            if (v2 >= 0.128740086)
            {
              if (v2 >= 0.187285343)
              {
                if (v2 >= 0.263212876)
                {
                  if (v2 >= 0.364076932)
                  {
                    if (v2 >= 0.510491764)
                    {
                      if (v2 >= 0.713429339)
                      {
                        if (a2 >= 1.0) {
                          return 1LL;
                        }
                        else {
                          return 2LL;
                        }
                      }

                      else
                      {
                        return 3LL;
                      }
                    }

                    else
                    {
                      return 4LL;
                    }
                  }

                  else
                  {
                    return 5LL;
                  }
                }

                else
                {
                  return 6LL;
                }
              }

              else
              {
                return 7LL;
              }
            }

            else
            {
              return 8LL;
            }
          }

          else
          {
            return 9LL;
          }
        }

        else
        {
          return 10LL;
        }
      }

      else
      {
        return 11LL;
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

void *sub_138D8(char a1, char a2, const void *a3, size_t a4, void *a5)
{
  id v9 = a5;
  uint64_t v10 = calloc(1uLL, a4 + 48);
  id v11 = [v9 copy];
  uint64_t v12 = (void *)v10[1];
  v10[1] = v11;

  uint64_t v13 = voucher_copy();
  float v14 = (void *)v10[2];
  v10[2] = v13;

  *((_BYTE *)v10 + 24) = a2;
  v10[4] = a4;
  *((_BYTE *)v10 + 40) = 0x80;
  *((_BYTE *)v10 + 41) = a1;
  if (a4) {
    memmove((char *)v10 + 42, a3, a4);
  }

  return v10;
}

void sub_1397C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1398C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = voucher_adopt(*(id *)(a1 + 16));
  id v5 = sub_4750();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_18634();
  }

  id v7 = sub_4750();
  dispatch_block_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_185A4();
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 device]);
  id v10 = objc_msgSend(v9, "setReport:reportLength:withIdentifier:forType:error:");
  id v11 = 0LL;

  if ((v10 & 1) == 0)
  {
    unsigned int v16 = *(void **)(a1 + 8);
    uint64_t v13 = a1 + 8;
    uint64_t v15 = v16;
    if (!v16)
    {
LABEL_12:
      *(void *)uint64_t v13 = 0LL;

      goto LABEL_13;
    }

    uint64_t v17 = objc_alloc(&OBJC_CLASS___NSError);
    v23[0] = NSLocalizedDescriptionKey;
    v23[1] = NSLocalizedFailureReasonErrorKey;
    v24[0] = @"Error sending report.";
    float v18 = (void *)objc_claimAutoreleasedReturnValue([v11 localizedDescription]);
    float v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v18));
    v24[1] = v19;
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v23,  2LL));
    uint64_t v21 = -[NSError initWithDomain:code:userInfo:]( v17,  "initWithDomain:code:userInfo:",  @"JoyConErrorDomain",  32LL,  v20);

    (*(void (**)(void))(*(void *)v13 + 16LL))();
LABEL_11:
    uint64_t v15 = *(void **)v13;
    goto LABEL_12;
  }

  if (!*(_BYTE *)(a1 + 24))
  {
    uint64_t v14 = *(void *)(a1 + 8);
    uint64_t v13 = a1 + 8;
    uint64_t v12 = v14;
    if (!v14)
    {
      uint64_t v15 = 0LL;
      goto LABEL_12;
    }

    (*(void (**)(uint64_t, void, void))(v12 + 16))(v12, 0LL, 0LL);
    goto LABEL_11;
  }

void sub_13BD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_13C44(uint64_t a1)
{
  uint64_t v2 = voucher_adopt(*(id *)(a1 + 16));
  id v3 = *(void **)(a1 + 8);
  if (v3)
  {
    uint64_t v4 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Device did not respond to proprietary command.");
    id v5 = objc_alloc(&OBJC_CLASS___NSError);
    v8[0] = NSLocalizedDescriptionKey;
    v8[1] = NSLocalizedRecoverySuggestionErrorKey;
    v9[0] = v4;
    v9[1] = @"Try again.";
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  2LL));
    id v7 = -[NSError initWithDomain:code:userInfo:]( v5,  "initWithDomain:code:userInfo:",  @"JoyConErrorDomain",  33LL,  v6);

    (*(void (**)(void))(*(void *)(a1 + 8) + 16LL))();
    id v3 = *(void **)(a1 + 8);
  }

  *(void *)(a1 + _Block_object_dispose(va, 8) = 0LL;
}

void sub_13D84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_13DC0(uint64_t a1)
{
  uint64_t v2 = voucher_adopt(*(id *)(a1 + 16));
  id v3 = *(void **)(a1 + 8);
  if (v3)
  {
    uint64_t v4 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"Device not active.");
    id v5 = objc_alloc(&OBJC_CLASS___NSError);
    NSErrorUserInfoKey v8 = NSLocalizedDescriptionKey;
    id v9 = v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
    id v7 = -[NSError initWithDomain:code:userInfo:]( v5,  "initWithDomain:code:userInfo:",  @"JoyConErrorDomain",  31LL,  v6);

    (*(void (**)(void))(*(void *)(a1 + 8) + 16LL))();
    id v3 = *(void **)(a1 + 8);
  }

  *(void *)(a1 + _Block_object_dispose(va, 8) = 0LL;
}

void sub_13EE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_143B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_14458(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  *(void *)(a1 + 32));
}

uint64_t sub_1446C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  *(void *)(a1 + 32));
}

uint64_t sub_14480(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  *(void *)(a1 + 32));
}

void sub_14494(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = *(id **)(a1 + 1000);
    if (v2)
    {
      id v3 = (dispatch_source_s *)*(id *)(a1 + 1008);
      uint64_t v4 = *(void **)(a1 + 1008);
      *(void *)(a1 + 100_Block_object_dispose(va, 8) = 0LL;
      *(void *)(a1 + 1016) = 0LL;

      *(void *)(a1 + 1000) = 0LL;
      dispatch_source_cancel(v3);
      sub_13DC0((uint64_t)v2);

      free(v2);
    }

    id v5 = *(id **)(a1 + 976);
    if (v5)
    {
      do
      {
        id v6 = (id *)*v5;
        sub_13DC0((uint64_t)v5);

        free(v5);
        id v5 = v6;
      }

      while (v6);
    }

    *(void *)(a1 + 976) = 0LL;
    *(void *)(a1 + 984) = a1 + 976;
  }

void sub_1456C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1457C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = _os_activity_create( &dword_0,  "Proprietary Command Timeout",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v3, &v7);
    uint64_t v4 = (id *)*((void *)WeakRetained + 125);
    id v5 = (dispatch_source_s *)*((id *)WeakRetained + 126);
    if (v4 == *(id **)(a1 + 40))
    {
      id v6 = (void *)*((void *)WeakRetained + 126);
      *((void *)WeakRetained + 126) = 0LL;
      *((void *)WeakRetained + 127) = 0LL;

      *((void *)WeakRetained + 125) = 0LL;
      dispatch_source_cancel(v5);
      sub_13C44((uint64_t)v4);

      free(v4);
    }

    os_activity_scope_leave(&v7);
  }
}

void sub_14668( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

uint64_t sub_14688(uint64_t a1)
{
  return sub_130CC(*(void *)(a1 + 32));
}

void sub_14690(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  os_activity_scope_state_s v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0LL;
  }
  else {
    BOOL v8 = 0;
  }
  uint64_t v9 = v8;
  if (!v8)
  {
    id v14 = sub_4750();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue([v7 localizedDescription]);
      sub_18724();
    }

    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = v7;
    if (!v12) {
      goto LABEL_14;
    }
LABEL_13:
    (*(void (**)(uint64_t, uint64_t, void *))(v12 + 16))(v12, v9, v13);
    goto LABEL_14;
  }

  id v10 = sub_4750();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_186F8();
  }

  uint64_t v12 = *(void *)(a1 + 32);
  if (v12)
  {
    uint64_t v13 = 0LL;
    goto LABEL_13;
  }

void sub_1479C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_147CC(void *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id v4 = sub_4750();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_18760();
    }

    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_148A8;
    v6[3] = &unk_24AF8;
    id v7 = v3;
    [a1 enqueueProprietaryCommand:3 expectsResponse:1 data:0 length:0 replyHandler:v6];
  }
}

void sub_14888( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_148A8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0LL;
  }
  else {
    BOOL v8 = 0;
  }
  uint64_t v9 = v8;
  if (!v8)
  {
    id v14 = sub_4750();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue([v7 localizedDescription]);
      sub_187B8();
    }

    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = v7;
    if (!v12) {
      goto LABEL_14;
    }
LABEL_13:
    (*(void (**)(uint64_t, uint64_t, void *))(v12 + 16))(v12, v9, v13);
    goto LABEL_14;
  }

  id v10 = sub_4750();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_1878C();
  }

  uint64_t v12 = *(void *)(a1 + 32);
  if (v12)
  {
    uint64_t v13 = 0LL;
    goto LABEL_13;
  }

void sub_149B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_149E4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v10 = sub_4750();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue([v6 localizedDescription]);
      sub_18820();
    }

    uint64_t v12 = *(void *)(a1 + 32);
    if (v12) {
      (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0LL, v6);
    }
  }

  else
  {
    id v7 = sub_4750();
    BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_187F4();
    }

    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      (*(void (**)(uint64_t, uint64_t, void))(v9 + 16))(v9, 1LL, 0LL);
    }
  }
}

void sub_14AE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *sub_14B18(char a1, const void *a2, size_t a3, void *a4, int a5)
{
  id v9 = a4;
  if (a3 <= 0x26) {
    uint64_t v10 = 38LL;
  }
  else {
    uint64_t v10 = a3;
  }
  id v11 = calloc(1uLL, v10 + 48);
  id v12 = [v9 copy];
  uint64_t v13 = (void *)v11[1];
  v11[1] = v12;

  uint64_t v14 = voucher_copy();
  uint64_t v15 = (void *)v11[2];
  v11[2] = v14;

  v11[3] = a3;
  *((_BYTE *)v11 + 32) = 1;
  *((_BYTE *)v11 + 42) = a1;
  if (a3) {
    memmove((char *)v11 + 43, a2, a3);
  }
  if (a5) {
    v11[3] = v10;
  }

  return v11;
}

void sub_14BD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_14BE4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = voucher_adopt(*(id *)(a1 + 16));
  id v5 = sub_4750();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_188FC();
  }

  *(void *)(a1 + 33) = [v3 currentRumbleData];
  *(_BYTE *)(a1 + 41) = v7;
  id v8 = sub_4750();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_1885C();
  }

  uint64_t v10 = sub_6D24((uint64_t)v3);
  kdebug_trace(835453457LL, v10, 0LL, 1LL, *(unsigned __int8 *)(a1 + 32));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 device]);
  uint64_t v12 = *(void *)(a1 + 24) + 11LL;
  uint64_t v13 = *(unsigned __int8 *)(a1 + 32);
  id v24 = 0LL;
  id v14 = [v11 setReport:a1 + 32 reportLength:v12 withIdentifier:v13 forType:1 error:&v24];
  id v15 = v24;

  uint64_t v16 = sub_6D24((uint64_t)v3);
  kdebug_trace(835453458, v16, 0, 1, [v15 code]);
  if ((v14 & 1) == 0)
  {
    uint64_t v17 = *(void **)(a1 + 8);
    if (v17)
    {
      float v18 = objc_alloc(&OBJC_CLASS___NSError);
      v25[0] = NSLocalizedDescriptionKey;
      v25[1] = NSLocalizedFailureReasonErrorKey;
      v26[0] = @"Error sending report.";
      float v19 = (void *)objc_claimAutoreleasedReturnValue([v15 localizedDescription]);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v19));
      v26[1] = v20;
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  v25,  2LL));
      int8x8_t v22 = -[NSError initWithDomain:code:userInfo:]( v18,  "initWithDomain:code:userInfo:",  @"JoyConErrorDomain",  12LL,  v21);

      (*(void (**)(void))(*(void *)(a1 + 8) + 16LL))();
      uint64_t v17 = *(void **)(a1 + 8);
    }

    *(void *)(a1 + _Block_object_dispose(va, 8) = 0LL;
  }

  return v14;
}

void sub_14E70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_14EE4(uint64_t a1)
{
  uint64_t v2 = voucher_adopt(*(id *)(a1 + 16));
  id v3 = *(void **)(a1 + 8);
  if (v3)
  {
    uint64_t v4 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Device did not respond to sub-command.");
    id v5 = objc_alloc(&OBJC_CLASS___NSError);
    v8[0] = NSLocalizedDescriptionKey;
    v8[1] = NSLocalizedRecoverySuggestionErrorKey;
    v9[0] = v4;
    v9[1] = @"Try again.";
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  2LL));
    char v7 = -[NSError initWithDomain:code:userInfo:]( v5,  "initWithDomain:code:userInfo:",  @"JoyConErrorDomain",  13LL,  v6);

    (*(void (**)(void))(*(void *)(a1 + 8) + 16LL))();
    id v3 = *(void **)(a1 + 8);
  }

  *(void *)(a1 + _Block_object_dispose(va, 8) = 0LL;
}

void sub_15024(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_15060(uint64_t a1)
{
  uint64_t v2 = voucher_adopt(*(id *)(a1 + 16));
  id v3 = *(void **)(a1 + 8);
  if (v3)
  {
    uint64_t v4 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"Device not active.");
    id v5 = objc_alloc(&OBJC_CLASS___NSError);
    NSErrorUserInfoKey v8 = NSLocalizedDescriptionKey;
    id v9 = v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
    char v7 = -[NSError initWithDomain:code:userInfo:]( v5,  "initWithDomain:code:userInfo:",  @"JoyConErrorDomain",  11LL,  v6);

    (*(void (**)(void))(*(void *)(a1 + 8) + 16LL))();
    id v3 = *(void **)(a1 + 8);
  }

  *(void *)(a1 + _Block_object_dispose(va, 8) = 0LL;
}

void sub_15188(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_151C4(uint64_t a1, unsigned int a2, const void *a3, size_t a4, void *a5)
{
  id v9 = a5;
  if (!a1) {
    goto LABEL_13;
  }
  if (a4 >= 0x27)
  {
    uint64_t v10 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Sub-command [%#x] with length [%zd bytes] > maxSubcommandLength [%zd bytes].",  a2,  a4,  38LL);
    id v11 = objc_alloc(&OBJC_CLASS___NSError);
    NSErrorUserInfoKey v45 = NSLocalizedDescriptionKey;
    id v46 = v10;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v46,  &v45,  1LL));
    uint64_t v13 = -[NSError initWithDomain:code:userInfo:]( v11,  "initWithDomain:code:userInfo:",  @"JoyConErrorDomain",  17LL,  v12);

    if (!v9)
    {
LABEL_7:

      goto LABEL_13;
    }

    id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([(id)a1 dispatchQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_15704;
    block[3] = &unk_24AA8;
    id v15 = block;
    id v38 = v9;
    uint64_t v13 = v13;
    __int128 v37 = v13;
    dispatch_async(v14, block);

    goto LABEL_5;
  }

  if ((*(_BYTE *)(a1 + 696) & 1) == 0)
  {
    uint64_t v20 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Device not active.");
    uint64_t v21 = objc_alloc(&OBJC_CLASS___NSError);
    NSErrorUserInfoKey v43 = NSLocalizedDescriptionKey;
    int v44 = v20;
    int8x8_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v44,  &v43,  1LL));
    uint64_t v13 = -[NSError initWithDomain:code:userInfo:]( v21,  "initWithDomain:code:userInfo:",  @"JoyConErrorDomain",  11LL,  v22);

    if (!v9) {
      goto LABEL_7;
    }
    id v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([(id)a1 dispatchQueue]);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_15718;
    v33[3] = &unk_24AA8;
    id v15 = v33;
    id v35 = v9;
    uint64_t v13 = v13;
    float v34 = v13;
    dispatch_async(v23, v33);

    goto LABEL_5;
  }

  if (*(_DWORD *)(a1 + 1040) >= 0x65u)
  {
    id v24 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Too many pending sub-commands.");
    float v25 = objc_alloc(&OBJC_CLASS___NSError);
    NSErrorUserInfoKey v41 = NSLocalizedDescriptionKey;
    uint64_t v42 = v24;
    int8x8_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v42,  &v41,  1LL));
    uint64_t v13 = -[NSError initWithDomain:code:userInfo:]( v25,  "initWithDomain:code:userInfo:",  @"JoyConErrorDomain",  19LL,  v26);

    if (!v9)
    {
      id v28 = sub_4750();
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        float v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSError localizedDescription](v13, "localizedDescription"));
        *(_DWORD *)buf = 138543362;
        __int128 v40 = v29;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "%{public}@", buf, 0xCu);
      }

      goto LABEL_6;
    }

    NSErrorUserInfoKey v27 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([(id)a1 dispatchQueue]);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    void v30[2] = sub_1572C;
    v30[3] = &unk_24AA8;
    id v15 = v30;
    id v32 = v9;
    uint64_t v13 = v13;
    __int128 v31 = v13;
    dispatch_async(v27, v30);

LABEL_5:
    uint64_t v16 = (os_log_s *)v15[5];
LABEL_6:

    goto LABEL_7;
  }

  uint64_t v17 = sub_14B18(a2, a3, a4, v9, *(unsigned __int8 *)(a1 + 704));
  id v18 = sub_4750();
  float v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    sub_18960();
  }

  void *v17 = 0LL;
  **(void **)(a1 + 1032) = v17;
  *(void *)(a1 + 1032) = v17;
  ++*(_DWORD *)(a1 + 1040);
  sub_12CA4(a1);
LABEL_13:
}

void sub_15660(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_15704(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  *(void *)(a1 + 32));
}

uint64_t sub_15718(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  *(void *)(a1 + 32));
}

uint64_t sub_1572C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  *(void *)(a1 + 32));
}

void sub_15740(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v3 = (id *)*((void *)WeakRetained + 131);
    uint64_t v4 = (dispatch_source_s *)*((id *)WeakRetained + 132);
    if (v3 == *(id **)(a1 + 40))
    {
      id v5 = (void *)v6[132];
      v6[132] = 0LL;
      v6[133] = 0LL;

      v6[131] = 0LL;
      dispatch_source_cancel(v4);
      sub_14EE4((uint64_t)v3);

      free(v3);
    }

    id WeakRetained = v6;
  }
}

void sub_157F4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1580C(uint64_t a1)
{
  return sub_12CA4(*(void *)(a1 + 32));
}

void sub_15814(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  char v7 = v6;
  if (!v5 || v6)
  {
    id v14 = sub_4750();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue([v7 localizedDescription]);
      sub_189C0();
    }

    uint64_t v16 = *(void *)(a1 + 32);
    if (v16) {
      (*(void (**)(uint64_t, void, void *))(v16 + 16))(v16, 0LL, v7);
    }
  }

  else
  {
    id v8 = v5;
    id v9 = [v8 bytes];
    id v10 = [v8 length];
    if ((unint64_t)v10 <= 0xB)
    {
      uint64_t v17 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Payload for sub-command [%#x] response has length [%zu bytes], which is less than the expected length [%zu bytes].",  2LL,  v10,  8LL);
      id v18 = objc_alloc(&OBJC_CLASS___NSError);
      NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
      float v25 = v17;
      float v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));
      uint64_t v20 = -[NSError initWithDomain:code:userInfo:]( v18,  "initWithDomain:code:userInfo:",  @"JoyConErrorDomain",  16LL,  v19);

      id v21 = sub_4750();
      int8x8_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(-[NSError localizedDescription](v20, "localizedDescription"));
        sub_189C0();
      }

      uint64_t v23 = *(void *)(a1 + 32);
      if (v23) {
        (*(void (**)(uint64_t, void, NSError *))(v23 + 16))(v23, 0LL, v20);
      }
    }

    else
    {
      id v11 = sub_4750();
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        sub_189FC();
      }

      uint64_t v13 = *(void *)(a1 + 32);
      if (v13) {
        (*(void (**)(uint64_t, id, void))(v13 + 16))(v13, v9, 0LL);
      }
    }
  }
}

void sub_15A34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_15AA8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  char v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0LL;
  }
  else {
    BOOL v8 = 0;
  }
  uint64_t v9 = v8;
  if (!v8)
  {
    id v14 = sub_4750();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue([v7 localizedDescription]);
      sub_18AA4();
    }

    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = v7;
    if (!v12) {
      goto LABEL_14;
    }
LABEL_13:
    (*(void (**)(uint64_t, uint64_t, void *))(v12 + 16))(v12, v9, v13);
    goto LABEL_14;
  }

  id v10 = sub_4750();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_18A78();
  }

  uint64_t v12 = *(void *)(a1 + 32);
  if (v12)
  {
    uint64_t v13 = 0LL;
    goto LABEL_13;
  }

void sub_15BB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_15BE4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  char v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0LL;
  }
  else {
    BOOL v8 = 0;
  }
  uint64_t v9 = v8;
  if (!v8)
  {
    id v14 = sub_4750();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue([v7 localizedDescription]);
      sub_18B0C();
    }

    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = v7;
    if (!v12) {
      goto LABEL_14;
    }
LABEL_13:
    (*(void (**)(uint64_t, uint64_t, void *))(v12 + 16))(v12, v9, v13);
    goto LABEL_14;
  }

  id v10 = sub_4750();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_18AE0();
  }

  uint64_t v12 = *(void *)(a1 + 32);
  if (v12)
  {
    uint64_t v13 = 0LL;
    goto LABEL_13;
  }

void sub_15CF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_15D20(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  char v7 = v6;
  if (!v5 || v6)
  {
    id v14 = sub_4750();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue([v7 localizedDescription]);
      sub_18B48();
    }

    uint64_t v16 = *(void *)(a1 + 32);
    if (v16) {
      (*(void (**)(uint64_t, void, void *))(v16 + 16))(v16, 0LL, v7);
    }
  }

  else
  {
    id v8 = v5;
    uint64_t v9 = (unsigned int *)[v8 bytes];
    id v10 = (char *)[v8 length];
    if ((unint64_t)v10 <= 4)
    {
      uint64_t v17 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Payload for sub-command [%#x] response has length [%zu bytes], which is less than the expected length [%zu bytes].",  16LL,  v10,  8LL);
      id v18 = objc_alloc(&OBJC_CLASS___NSError);
      NSErrorUserInfoKey v29 = NSLocalizedDescriptionKey;
      __int128 v30 = v17;
      float v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v30,  &v29,  1LL));
      uint64_t v13 = -[NSError initWithDomain:code:userInfo:]( v18,  "initWithDomain:code:userInfo:",  @"JoyConErrorDomain",  16LL,  v19);

      id v20 = sub_4750();
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(-[NSError localizedDescription](v13, "localizedDescription"));
        sub_18B48();
      }

      uint64_t v22 = *(void *)(a1 + 32);
      if (v22) {
        (*(void (**)(uint64_t, void, NSError *))(v22 + 16))(v22, 0LL, v13);
      }
      goto LABEL_9;
    }

    if (*v9 != *(_DWORD *)(a1 + 40))
    {
      uint64_t v23 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Received reply for a different read SPI flash request: address = %#.4x, length = %u.",  *v9,  *((unsigned __int8 *)v9 + 4));
      NSErrorUserInfoKey v24 = objc_alloc(&OBJC_CLASS___NSError);
      v27[0] = NSLocalizedDescriptionKey;
      v27[1] = NSLocalizedRecoverySuggestionErrorKey;
      v28[0] = v23;
      v28[1] = @"Try again.";
      float v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v28,  v27,  2LL));
      uint64_t v13 = -[NSError initWithDomain:code:userInfo:]( v24,  "initWithDomain:code:userInfo:",  @"JoyConErrorDomain",  15LL,  v25);

      uint64_t v26 = *(void *)(a1 + 32);
      if (v26) {
        (*(void (**)(uint64_t, void, NSError *))(v26 + 16))(v26, 0LL, v13);
      }
      goto LABEL_9;
    }

    id v11 = sub_4750();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_18B84();
    }

    if (*(void *)(a1 + 32))
    {
      uint64_t v13 = (NSError *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subdataWithRange:", 5, v10 - 5));
      (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
LABEL_9:
    }
  }
}

void sub_16034(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_160DC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  char v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0LL;
  }
  else {
    BOOL v8 = 0;
  }
  uint64_t v9 = v8;
  if (!v8)
  {
    id v14 = sub_4750();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue([v7 localizedDescription]);
      sub_18C44();
    }

    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = v7;
    if (!v12) {
      goto LABEL_14;
    }
LABEL_13:
    (*(void (**)(uint64_t, uint64_t, void *))(v12 + 16))(v12, v9, v13);
    goto LABEL_14;
  }

  id v10 = sub_4750();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_18C18();
  }

  uint64_t v12 = *(void *)(a1 + 32);
  if (v12)
  {
    uint64_t v13 = 0LL;
    goto LABEL_13;
  }

void sub_161E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_16218(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  char v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0LL;
  }
  else {
    BOOL v8 = 0;
  }
  uint64_t v9 = v8;
  if (!v8)
  {
    id v14 = sub_4750();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue([v7 localizedDescription]);
      sub_18CAC();
    }

    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = v7;
    if (!v12) {
      goto LABEL_14;
    }
LABEL_13:
    (*(void (**)(uint64_t, uint64_t, void *))(v12 + 16))(v12, v9, v13);
    goto LABEL_14;
  }

  id v10 = sub_4750();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_18C80();
  }

  uint64_t v12 = *(void *)(a1 + 32);
  if (v12)
  {
    uint64_t v13 = 0LL;
    goto LABEL_13;
  }

void sub_16324(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_16354(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  char v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0LL;
  }
  else {
    BOOL v8 = 0;
  }
  uint64_t v9 = v8;
  if (!v8)
  {
    id v14 = sub_4750();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue([v7 localizedDescription]);
      sub_18D14();
    }

    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = v7;
    if (!v12) {
      goto LABEL_14;
    }
LABEL_13:
    (*(void (**)(uint64_t, uint64_t, void *))(v12 + 16))(v12, v9, v13);
    goto LABEL_14;
  }

  id v10 = sub_4750();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_18CE8();
  }

  uint64_t v12 = *(void *)(a1 + 32);
  if (v12)
  {
    uint64_t v13 = 0LL;
    goto LABEL_13;
  }

void sub_16460(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1653C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_165D0(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIMUEnabled:*(unsigned __int8 *)(a1 + 40)];
}

void sub_16728(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_16914(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_16980(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    id result = *(unsigned __int8 *)(result + 971);
    *(_BYTE *)(v1 + 971) = result + 1;
  }

  return result;
}

uint64_t sub_169B4(float a1, float a2, float a3, float a4)
{
  if (a2 == 0.0 && a4 == 0.0) {
    return 1077936384LL;
  }
  float v7 = (float)(a3 * 1170.8) + 81.752;
  int v8 = (int)(float)(roundf(log2f((float)((float)(a1 * 585.41) + 40.876) / 10.0) * 32.0) + -64.0);
  signed int v9 = vcvts_n_s32_f32(roundf(log2f(v7 / 10.0) * 32.0) + -96.0, 2uLL) & 0xFFFFFFFC;
  if (v8 <= 1) {
    unsigned int v10 = 1;
  }
  else {
    unsigned int v10 = v8;
  }
  if (v10 >= 0x7F) {
    unsigned int v10 = 127;
  }
  if (v9 <= 4) {
    signed int v9 = 4;
  }
  unsigned int v11 = (int)(float)(a4 * 200.0) & 0xFFFE;
  if (v11 >= 0xC8) {
    LOWORD(v11) = 200;
  }
  return (v10 << 16) | ((int)(float)((float)(a2 * 100.0) + 128.0) >> 1 << 24) | v9 & 0x100 | ((unsigned __int16)v11 >> 1 << 9) | v9 & 0xFC;
}

void sub_16BB0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_16C98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_16D40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_16F70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

float32x2_t sub_17108(int a1, int a2)
{
  v2.i32[0] = a1 - 0x7FFF;
  v2.i32[1] = a2 ^ 0x7FFF;
  float32x2_t v3 = vdiv_f32(vcvt_f32_s32(vshr_n_s32(vshl_n_s32(v2, 0x10uLL), 0x10uLL)), (float32x2_t)vdup_n_s32(0x46FFFE00u));
  float v4 = sqrtf(vmlas_n_f32(COERCE_FLOAT(vmul_f32(v3, v3).i32[1]), v3.f32[0], v3.f32[0]));
  float32x2_t result = 0LL;
  if (v4 >= 0.2)
  {
    float32x2_t v6 = vmul_n_f32(v3, (float)((float)(v4 + -0.2) / 0.3) / v4);
    __asm { FMOV            V1.2S, #-1.0 }

    float32x2_t v12 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(_D1, v6), (int8x8_t)_D1, (int8x8_t)v6);
    __asm { FMOV            V1.2S, #1.0 }

    return vminnm_f32(v12, _D1);
  }

  return result;
}

float32x2_t sub_17194(__int16 a1, __int16 a2, _WORD *a3, uint64_t a4)
{
  int v4 = (__int16)(a1 - *a3);
  else {
    int v5 = v4;
  }
  else {
    int v6 = (__int16)(a2 - a3[1]);
  }
  float v7 = (float)v5;
  float v8 = (float)v6;
  float v9 = sqrtf((float)(v8 * v8) + (float)(v7 * v7));
  unsigned int v10 = *(unsigned __int16 *)(a4 + 8);
  if (v10 <= 1) {
    unsigned int v10 = 1;
  }
  float v11 = (float)v10;
  float32x2_t v12 = 0LL;
  if (v9 >= (float)v10)
  {
    float v13 = fabsf(v8 / v9);
    unsigned int v14 = (unsigned __int16)(*(_WORD *)(a4 + 2) - v10);
    float v15 = fabsf(v7 / v9);
    if ((v5 & 0x8000u) == 0) {
      float v16 = -v11;
    }
    else {
      float v16 = v11;
    }
    v12.f32[0] = (float)(v7 + (float)(v16 * v15)) / (float)v14;
    if ((v6 & 0x8000) != 0) {
      float v17 = v8 + (float)(v11 * v13);
    }
    else {
      float v17 = v8 + (float)((float)-v11 * v13);
    }
    v12.f32[1] = v17 / (float)v14;
  }

  __asm { FMOV            V0.2S, #-1.0 }

  float32x2_t v23 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(_D0, v12), (int8x8_t)_D0, (int8x8_t)v12);
  __asm { FMOV            V1.2S, #1.0 }

  return vminnm_f32(v23, _D1);
}

void sub_17284(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
}

void sub_17294(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_172A0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_172B0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

uint64_t sub_172D0(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(void *)(a2 + 4) = result;
  return result;
}

  ;
}

  ;
}

  ;
}

  ;
}

  ;
}

  ;
}

  ;
}

void sub_1734C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

  ;
}

  ;
}

  ;
}

NSXPCInterface *sub_173B8()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCMotionServiceClientInterface);
}

NSXPCInterface *sub_173CC()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCMotionServiceServerInterface);
}

NSXPCInterface *sub_173E0()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCLightServiceClientInterface);
}

NSXPCInterface *sub_173F4()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCLightServiceServerInterface);
}

id sub_17408()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL____GCDriverClientInterface));
  uint64_t v1 = sub_94E0();
  int32x2_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  [v0 setInterface:v2 forSelector:"connectToNintendoJoyConFusionGestureServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  float32x2_t v3 = sub_94F4();
  int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  [v0 setInterface:v4 forSelector:"connectToNintendoJoyConFusionGestureServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  int v5 = sub_173E0();
  int v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v0 setInterface:v6 forSelector:"connectToLightServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  float v7 = sub_173F4();
  float v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v0 setInterface:v8 forSelector:"connectToLightServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  float v9 = sub_9508();
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  [v0 setInterface:v10 forSelector:"connectToAdaptiveTriggersServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  float v11 = sub_951C();
  float32x2_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  [v0 setInterface:v12 forSelector:"connectToAdaptiveTriggersServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  float v13 = sub_173B8();
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  [v0 setInterface:v14 forSelector:"connectToMotionServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  float v15 = sub_173CC();
  float v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  [v0 setInterface:v16 forSelector:"connectToMotionServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  float v17 = sub_176C4();
  id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  [v0 setInterface:v18 forSelector:"connectToBatteryServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  float v19 = sub_176D8();
  id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  [v0 setInterface:v20 forSelector:"connectToBatteryServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  id v21 = sub_4974();
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  [v0 setInterface:v22 forSelector:"connectToGameIntentServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  float32x2_t v23 = sub_4988();
  NSErrorUserInfoKey v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  [v0 setInterface:v24 forSelector:"connectToGameIntentServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  uint64_t v25 = GCGenericDeviceDriverConfigurationServiceClientInterface();
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  [v0 setInterface:v26 forSelector:"connectToGenericDeviceDriverConfigurationServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  uint64_t v27 = GCGenericDeviceDriverConfigurationServiceServerInterface();
  id v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  [v0 setInterface:v28 forSelector:"connectToGenericDeviceDriverConfigurationServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  return v0;
}

NSXPCInterface *sub_176B0()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL____GCDriverServerInterface);
}

NSXPCInterface *sub_176C4()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCBatteryServiceClientInterface);
}

NSXPCInterface *sub_176D8()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCBatteryServiceServerInterface);
}

void sub_176EC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1771C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "setProperty: %@ forKey: %@", (uint8_t *)&v3, 0x16u);
}

void sub_177A0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_177D0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_17800()
{
}

void sub_17864()
{
}

void sub_178C8()
{
  sub_172A0(&dword_0, v0, v1, "Set Input Report Mode Request: mode = %hhx", v2, v3, v4, v5, v6);
  sub_87CC();
}

void sub_17928()
{
}

void sub_1798C()
{
  sub_172A0(&dword_0, v0, v1, "Set Low Power State Request: change = %hhx", v2, v3, v4, v5, v6);
  sub_87CC();
}

void sub_179EC()
{
}

void sub_17A50()
{
  sub_172A0(&dword_0, v0, v1, "Set IMU Enabled Request: change = %hhx", v2, v3, v4, v5, v6);
  sub_87CC();
}

void sub_17AB0()
{
}

void sub_17B14()
{
  sub_172A0(&dword_0, v0, v1, "Set Vibration Enabled Request: change = %hhx", v2, v3, v4, v5, v6);
  sub_87CC();
}

void sub_17B74()
{
  sub_172C8();
}

void sub_17BB0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_17C28(int a1, uint64_t a2, os_log_s *a3)
{
  LODWORD(v3) = 67109376;
  HIDWORD(v3) = a2;
  LOWORD(v4) = 1024;
  *(_DWORD *)((char *)&v4 + 2) = a1;
  sub_1734C(&dword_0, a2, a3, "Read SPI Flash Request: address = %#.4x, length = %{bytes}u", v3, v4);
  sub_172C0();
}

void sub_17C98()
{
  sub_172C8();
}

void sub_17CD4()
{
}

void sub_17D00()
{
  sub_172C8();
}

void sub_17D3C()
{
}

void sub_17DA4()
{
  sub_172C8();
}

void sub_17DE0()
{
}

void sub_17E40()
{
  sub_172C8();
}

void sub_17E7C()
{
}

void sub_17EDC()
{
  sub_172C8();
}

void sub_17F18()
{
}

void sub_17F80()
{
  sub_172C8();
}

void sub_17FBC()
{
}

void sub_1801C()
{
  sub_172C8();
}

void sub_18058()
{
}

void sub_180B8()
{
}

void sub_1811C()
{
}

void sub_18184()
{
}

void sub_181EC()
{
}

void sub_1824C()
{
  sub_172C8();
}

void sub_18288()
{
}

void sub_182B4()
{
  sub_172C8();
}

void sub_182F0()
{
}

void sub_1831C()
{
}

void sub_183A0()
{
  sub_172A0(&dword_0, v0, v1, "Proprietary command ack: identifier = %#x", v2, v3, v4, v5, v6);
  sub_87CC();
}

void sub_18404( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_18470( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_184DC()
{
}

void sub_18540()
{
}

void sub_185A4()
{
}

void sub_18634()
{
}

void sub_18698()
{
}

void sub_186F8()
{
}

void sub_18724()
{
  sub_172C8();
}

void sub_18760()
{
}

void sub_1878C()
{
}

void sub_187B8()
{
  sub_172C8();
}

void sub_187F4()
{
}

void sub_18820()
{
  sub_172C8();
}

void sub_1885C()
{
  __int16 v5 = v0;
  uint64_t v6 = v1;
  __int16 v7 = 1040;
  int v8 = v1;
  __int16 v9 = 2097;
  uint64_t v10 = v2;
  _os_log_debug_impl( &dword_0,  v3,  OS_LOG_TYPE_DEBUG,  "Send report: type = %li, reportID = %#lx, bytes[%zu] = %{private}.*P",  v4,  0x30u);
}

void sub_188FC()
{
}

void sub_18960()
{
}

void sub_189C0()
{
  sub_172C8();
}

void sub_189FC()
{
}

void sub_18A78()
{
}

void sub_18AA4()
{
  sub_172C8();
}

void sub_18AE0()
{
}

void sub_18B0C()
{
  sub_172C8();
}

void sub_18B48()
{
  sub_172C8();
}

void sub_18B84()
{
}

void sub_18C18()
{
}

void sub_18C44()
{
  sub_172C8();
}

void sub_18C80()
{
}

void sub_18CAC()
{
  sub_172C8();
}

void sub_18CE8()
{
}

void sub_18D14()
{
  sub_172C8();
}

void sub_18D50()
{
}

void sub_18D7C()
{
}

void sub_18DA8()
{
}

void sub_18DD4()
{
}

void sub_18E00()
{
}

void sub_18E2C()
{
}

void sub_18E58(unsigned __int8 *a1, uint64_t a2, os_log_s *a3)
{
  LODWORD(v3) = 67109376;
  HIDWORD(v3) = a2;
  LOWORD(v4) = 1024;
  *(_DWORD *)((char *)&v4 + 2) = *a1;
  sub_1734C(&dword_0, a2, a3, "#GESTURE Home button: pressed=%{BOOL}d, wasPressed=%{BOOL}d", v3, v4);
  sub_172C0();
}

id objc_msgSend_valueForNoteParam_inParameters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForNoteParam:inParameters:");
}