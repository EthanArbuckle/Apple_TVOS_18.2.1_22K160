uint64_t sub_4118()
{
  if (qword_1F2B8 != -1) {
    dispatch_once(&qword_1F2B8, &stru_18578);
  }
  return byte_1F2B0;
}

void sub_4158(id a1)
{
  byte_1F2B0 = os_variant_has_internal_diagnostics("com.apple.gamecontroller");
}

id sub_417C()
{
  if (qword_1F2C8 != -1) {
    dispatch_once(&qword_1F2C8, &stru_18598);
  }
  return (id)qword_1F2C0;
}

void sub_41BC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController", "default");
  v2 = (void *)qword_1F2C0;
  qword_1F2C0 = (uint64_t)v1;
}

id sub_41EC()
{
  if (qword_1F2D8 != -1) {
    dispatch_once(&qword_1F2D8, &stru_185B8);
  }
  return (id)qword_1F2D0;
}

void sub_422C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController", "monitor");
  v2 = (void *)qword_1F2D0;
  qword_1F2D0 = (uint64_t)v1;
}

id sub_425C()
{
  if (qword_1F2E8 != -1) {
    dispatch_once(&qword_1F2E8, &stru_185D8);
  }
  return (id)qword_1F2E0;
}

void sub_429C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController", "init");
  v2 = (void *)qword_1F2E0;
  qword_1F2E0 = (uint64_t)v1;
}

id sub_42CC()
{
  if (qword_1F2F8 != -1) {
    dispatch_once(&qword_1F2F8, &stru_185F8);
  }
  return (id)qword_1F2F0;
}

void sub_430C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController", "analytics");
  v2 = (void *)qword_1F2F0;
  qword_1F2F0 = (uint64_t)v1;
}

id sub_433C()
{
  if (qword_1F308 != -1) {
    dispatch_once(&qword_1F308, &stru_18618);
  }
  return (id)qword_1F300;
}

void sub_437C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController.Daemon", "default");
  v2 = (void *)qword_1F300;
  qword_1F300 = (uint64_t)v1;
}

void sub_43AC(char *category)
{
  os_log_t v1 = os_log_create("com.apple.GameController.HID", category);
  v2 = (void *)qword_1F310;
  qword_1F310 = (uint64_t)v1;
}

id sub_43D8()
{
  if (qword_1F318 != -1) {
    dispatch_once(&qword_1F318, &stru_18638);
  }
  return (id)qword_1F310;
}

void sub_4418(id a1)
{
  if (!qword_1F310) {
    objc_storeStrong((id *)&qword_1F310, &_os_log_default);
  }
}

id sub_443C()
{
  if (qword_1F328 != -1) {
    dispatch_once(&qword_1F328, &stru_18658);
  }
  return (id)qword_1F320;
}

void sub_447C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController.Settings", "default");
  v2 = (void *)qword_1F320;
  qword_1F320 = (uint64_t)v1;
}

id sub_44AC()
{
  if (qword_1F338 != -1) {
    dispatch_once(&qword_1F338, &stru_18678);
  }
  return (id)qword_1F330;
}

void sub_44EC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController.Haptics", "default");
  v2 = (void *)qword_1F330;
  qword_1F330 = (uint64_t)v1;
}

id sub_451C()
{
  if (qword_1F348 != -1) {
    dispatch_once(&qword_1F348, &stru_18698);
  }
  return (id)qword_1F340;
}

void sub_455C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.gamecontroller", "Signposts");
  v2 = (void *)qword_1F340;
  qword_1F340 = (uint64_t)v1;
}

id sub_458C()
{
  if (qword_1F358 != -1) {
    dispatch_once(&qword_1F358, &stru_186B8);
  }
  return (id)qword_1F350;
}

void sub_45CC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.runtime-issues", "GameController");
  v2 = (void *)qword_1F350;
  qword_1F350 = (uint64_t)v1;
}

NSXPCInterface *sub_45FC()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCGameIntentServiceClientInterface);
}

NSXPCInterface *sub_4610()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCGameIntentServiceServerInterface);
}

dispatch_source_s *sub_4624(uint64_t a1, uint64_t a2, dispatch_queue_s *a3, void *a4)
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

void sub_4860( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_4890(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = sub_43D8();
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

void sub_4924(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = sub_43D8();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl( &dword_0,  v3,  OS_LOG_TYPE_DEFAULT,  "Connection to com.apple.GameController.gamecontrollerd.driver interrupted.  Attempting to re-establish.",  v5,  2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained remoteObjectProxy]);
  [v4 driverCheckIn];
}

void sub_4E08(uint64_t a1, int a2, int a3, uint64_t a4)
{
  if (a3 | a2)
  {
    switch(a2)
    {
      case 3:
        id v11 = sub_43D8();
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
        id v12 = sub_43D8();
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
        id v5 = sub_43D8();
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

  id v9 = sub_43D8();
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

void sub_4FAC(uint64_t a1, void *a2)
{
  id v3 = sub_43D8();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_FEC4(v4, v5, v6, v7, v8, v9, v10, v11);
  }

  if (a2) {
    [a2 disconnect];
  }
}

void sub_5184( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_519C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_51AC(uint64_t a1)
{
}

void sub_51B4(uint64_t a1)
{
  id v2 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  dispatch_queue_get_label(*(dispatch_queue_t *)(a1 + 32)),  4LL);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = sub_43D8();
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

BOOL sub_5594(id a1, NSDictionary *a2, NSDictionary *a3)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", @"DeviceUsagePage"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", @"DeviceUsage"));
    char v7 = (![v5 isEqual:&off_199B8]
       || ([v6 isEqual:&off_199D0] & 1) == 0)
      && (![v5 isEqual:&off_199B8]
       || ([v6 isEqual:&off_199E8] & 1) == 0)
  }

  else
  {
    char v7 = 1;
  }

  return v7;
}

void sub_5AD4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_5AF8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = sub_43D8();
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

void sub_5CC4(uint64_t a1)
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
        v17 = sub_43D8();
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
      v19 = sub_43D8();
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
      uint64_t v14 = sub_43D8();
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

void sub_66A8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(dispatch_queue_s **)(v2 + 560);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_6734;
  v8[3] = &unk_18770;
  v8[4] = v2;
  uint64_t v4 = sub_4624(0x6FC23AC00uLL, 0x3B9ACA00uLL, v3, v8);
  uint64_t v5 = objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v5;
}

id sub_6734(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateIdleState];
}

void sub_6910(id a1)
{
}

void sub_696C(uint64_t a1, void *a2, int a3)
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

uint64_t sub_6A08(uint64_t result)
{
  if (result) {
    return *(void *)(result + 656);
  }
  return result;
}

id sub_6B40(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchEvent:*(void *)(a1 + 40)];
}

id sub_6C60(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchIdleEvent:*(void *)(a1 + 40)];
}

void sub_7D10(uint64_t a1)
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
        v8[2] = sub_7DEC;
        v8[3] = &unk_186E0;
        objc_copyWeak(&v9, v1);
        id v5 = sub_4624(0xF4240uLL, 0x186A0uLL, tv_sec, v8);
        uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);
        tv_nsec = (void *)v3[33].tv_nsec;
        v3[33].tv_nsec = v6;

        objc_destroyWeak(&v9);
      }
    }
  }
}

void sub_7DEC(uint64_t a1)
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
      id v3 = sub_43D8();
      uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
      BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
      if ((v2 & 1) != 0)
      {
        if (v5) {
          sub_FF78(v4, v6, v7, v8, v9, v10, v11, v12);
        }

        HIDWORD(WeakRetained[30].tv_nsec) = 0;
        -[timespec dispatchHapticEvent](WeakRetained, "dispatchHapticEvent");
      }

      else
      {
        if (v5) {
          sub_FFA8(v4, v6, v7, v8, v9, v10, v11, v12);
        }

        -[timespec stopHaptics](WeakRetained, "stopHaptics");
      }
    }
  }
}

void sub_84A0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

NSXPCInterface *sub_892C()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCMotionServiceClientInterface);
}

NSXPCInterface *sub_8940()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCMotionServiceServerInterface);
}

NSXPCInterface *sub_8954()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCNintendoJoyConFusionGestureServiceClientInterface);
}

NSXPCInterface *sub_8968()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCNintendoJoyConFusionGestureServiceServerInterface);
}

id sub_897C()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL____GCDriverClientInterface));
  os_log_t v1 = sub_8954();
  unsigned __int8 v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  [v0 setInterface:v2 forSelector:"connectToNintendoJoyConFusionGestureServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  id v3 = sub_8968();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  [v0 setInterface:v4 forSelector:"connectToNintendoJoyConFusionGestureServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  BOOL v5 = sub_F7EC();
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v0 setInterface:v6 forSelector:"connectToLightServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  uint64_t v7 = sub_F800();
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v0 setInterface:v8 forSelector:"connectToLightServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  uint64_t v9 = sub_F7C4();
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  [v0 setInterface:v10 forSelector:"connectToAdaptiveTriggersServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  uint64_t v11 = sub_F7D8();
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  [v0 setInterface:v12 forSelector:"connectToAdaptiveTriggersServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  timespec v13 = sub_892C();
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  [v0 setInterface:v14 forSelector:"connectToMotionServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  v15 = sub_8940();
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  [v0 setInterface:v16 forSelector:"connectToMotionServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  v17 = sub_FE84();
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  [v0 setInterface:v18 forSelector:"connectToBatteryServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  v19 = sub_FE98();
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  [v0 setInterface:v20 forSelector:"connectToBatteryServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  v21 = sub_45FC();
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  [v0 setInterface:v22 forSelector:"connectToGameIntentServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  v23 = sub_4610();
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  [v0 setInterface:v24 forSelector:"connectToGameIntentServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  uint64_t v25 = GCGenericDeviceDriverConfigurationServiceClientInterface();
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  [v0 setInterface:v26 forSelector:"connectToGenericDeviceDriverConfigurationServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  uint64_t v27 = GCGenericDeviceDriverConfigurationServiceServerInterface();
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  [v0 setInterface:v28 forSelector:"connectToGenericDeviceDriverConfigurationServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  return v0;
}

NSXPCInterface *sub_8C24()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL____GCDriverServerInterface);
}

void sub_8C38()
{
}

uint64_t sub_8C44(uint64_t a1, uint64_t a2)
{
  kern_return_t ParentEntry;
  id v4;
  os_log_s *v5;
  io_registry_entry_t parent;
  char className[136];
  objc_opt_self();
  IOObjectRetain(a2);
  if ((_DWORD)a2)
  {
    while (!IOObjectConformsTo(a2, "IOHIDDevice"))
    {
      memset(className, 0, 128);
      IOObjectGetClass(a2, className);
      parent = 0;
      ParentEntry = IORegistryEntryGetParentEntry(a2, "IOService", &parent);
      IOObjectRelease(a2);
      if (ParentEntry)
      {
        uint64_t v4 = sub_43D8();
        BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          sub_FFD8();
        }

        return 0LL;
      }

      a2 = parent;
      if (!parent) {
        return a2;
      }
    }
  }

  return a2;
}

void sub_9014(_Unwind_Exception *a1)
{
}

void sub_9284(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) device]);
  unsigned __int8 v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "gc_snapshot"));
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);
}

void sub_938C(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    unsigned __int8 v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) dispatchQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_94FC;
    block[3] = &unk_18808;
    int8x16_t v8 = *(int8x16_t *)(a1 + 32);
    id v3 = (id)v8.i64[0];
    int8x16_t v10 = vextq_s8(v8, v8, 8uLL);
    id v11 = *(id *)(a1 + 48);
    dispatch_async(v2, block);
  }

  else
  {
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = GCGenericDeviceErrorDomain;
    NSErrorUserInfoKey v12 = NSLocalizedFailureReasonErrorKey;
    timespec v13 = @"'model' can not be nil.";
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v5,  1LL,  v6));
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0LL, v7);
  }

void sub_94FC(void *a1)
{
  unsigned __int8 v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  v5[0] = 0LL;
  objc_msgSend(v2, "_onqueue_configureWithModel:error:", v3, v5);
  id v4 = v5[0];
  (*(void (**)(void))(a1[6] + 16LL))();
}

LABEL_73:
          goto LABEL_74;
        }

        v17 = v69 + 1;
      }

      while ((id)(v69 + 1) != v67);
      v42 = [obj countByEnumeratingWithState:&v79 objects:v93 count:16];
      v67 = v42;
    }

    while (v42);
  }

  v43 = (NSDictionary *)-[NSMutableDictionary copy](v64, "copy");
  v44 = self->_trackedElementsByIdentifier;
  self->_trackedElementsByIdentifier = v43;

  -[GCHIDDeviceInput setInputElements:](self->_deviceInput, "setInputElements:", v62);
  v45 = (NSDictionary *)-[NSMutableDictionary copy](v60, "copy");
  v46 = self->_trackedInputElementsByIdentifier;
  self->_trackedInputElementsByIdentifier = v45;

  v47 = (NSDictionary *)-[NSMutableDictionary copy](v58, "copy");
  v48 = self->_trackedOutputElementsByIdentifier;
  self->_trackedOutputElementsByIdentifier = v47;

  objc_storeStrong((id *)&self->_elementObservers, v56);
  v49 = sub_43D8();
  v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
    sub_10094(v64, v62, v50);
  }

  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v64, "enumerateKeysAndObjectsUsingBlock:", &stru_18870);
  v65 = (void *)objc_claimAutoreleasedReturnValue([v59 properties]);
  if (v65 && !sub_A1F0(self, v65, a4))
  {
    v51 = 0;
  }

  else
  {
    v61 = (void *)objc_claimAutoreleasedReturnValue([v59 input]);
    if (v61 && !sub_A450((uint64_t)self, v61, a4))
    {
      v51 = 0;
    }

    else
    {
      v62 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v59 rumble]);
      if (v62 && !sub_A8F8((uint64_t)self, v62, a4)) {
LABEL_74:
      }
        v51 = 0;
      else {
        v51 = 1;
      }
    }
  }

  return v51;
}

void sub_A168(_Unwind_Exception *a1)
{
}

void sub_A184(id a1, NSString *a2, HIDElement *a3, BOOL *a4)
{
  uint64_t v5 = a2;
  uint64_t v6 = a3;
  id v7 = sub_43D8();
  int8x16_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_101C8();
  }
}

BOOL sub_A1F0(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  if (a1)
  {
    objc_initWeak(&location, a1);
    uint64_t v29 = 0LL;
    v30 = &v29;
    uint64_t v31 = 0x3032000000LL;
    v32 = sub_B08C;
    v33 = sub_B0B4;
    id v34 = 0LL;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_B108;
    v28[3] = &unk_18900;
    v28[4] = a1;
    v28[5] = &v29;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_B398;
    v25[3] = &unk_18928;
    v26 = &stru_188B0;
    uint64_t v6 = objc_retainBlock(v28);
    id v27 = v6;
    id v7 = objc_retainBlock(v25);
    int8x16_t v8 = objc_retainBlock(v7);
    uint64_t v9 = (void *)v30[5];
    v30[5] = (uint64_t)v8;

    uint64_t v19 = 0LL;
    v20 = &v19;
    uint64_t v21 = 0x3032000000LL;
    v22 = sub_B548;
    v23 = sub_B558;
    id v24 = 0LL;
    int8x16_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 properties]);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_B560;
    v15[3] = &unk_18978;
    v17 = &v19;
    id v11 = v7;
    id v16 = v11;
    objc_copyWeak(&v18, &location);
    [v10 enumerateObjectsUsingBlock:v15];

    NSErrorUserInfoKey v12 = (void *)v20[5];
    BOOL v13 = v12 == 0LL;
    if (a3 && v12) {
      *a3 = v12;
    }
    objc_destroyWeak(&v18);

    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(&v29, 8);

    objc_destroyWeak(&location);
  }

  else
  {
    BOOL v13 = 0LL;
  }

  return v13;
}

void sub_A414( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
}

BOOL sub_A450(uint64_t a1, void *a2, void *a3)
{
  id v33 = a2;
  if (a1)
  {
    uint64_t v64 = 0LL;
    v65 = &v64;
    uint64_t v66 = 0x3032000000LL;
    v67 = sub_B08C;
    v68 = sub_B0B4;
    id v69 = 0LL;
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472LL;
    v63[2] = sub_B9C4;
    v63[3] = &unk_189C8;
    v63[4] = a1;
    uint64_t v31 = objc_retainBlock(v63);
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472LL;
    v62[2] = sub_BC78;
    v62[3] = &unk_189F0;
    v62[4] = a1;
    id v4 = objc_retainBlock(v62);
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472LL;
    v61[2] = sub_BFBC;
    v61[3] = &unk_18A88;
    v61[4] = &v64;
    id v5 = objc_retainBlock(v61);
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472LL;
    v60[2] = sub_C4B4;
    v60[3] = &unk_18AD8;
    v60[4] = &v64;
    uint64_t v6 = objc_retainBlock(v60);
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472LL;
    v59[2] = sub_C6F4;
    v59[3] = &unk_18B00;
    v59[4] = &v64;
    id v7 = objc_retainBlock(v59);
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472LL;
    v58[2] = sub_C934;
    v58[3] = &unk_18B50;
    v58[4] = &v64;
    int8x16_t v8 = objc_retainBlock(v58);
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472LL;
    v57[2] = sub_CD4C;
    v57[3] = &unk_18BA0;
    v57[4] = &v64;
    uint64_t v9 = objc_retainBlock(v57);
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472LL;
    v56[2] = sub_D3A8;
    v56[3] = &unk_18BF0;
    v56[4] = &v64;
    int8x16_t v10 = objc_retainBlock(v56);
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472LL;
    v55[2] = sub_DDD0;
    v55[3] = &unk_18900;
    v55[4] = a1;
    v55[5] = &v64;
    id v11 = objc_retainBlock(v55);
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472LL;
    v44[2] = sub_E060;
    v44[3] = &unk_18C18;
    v32 = v31;
    id v45 = v32;
    v30 = v4;
    id v46 = v30;
    uint64_t v29 = v5;
    id v47 = v29;
    v48 = &stru_18A10;
    v28 = v6;
    id v49 = v28;
    id v27 = v7;
    id v50 = v27;
    NSErrorUserInfoKey v12 = v8;
    id v51 = v12;
    BOOL v13 = v9;
    id v52 = v13;
    uint64_t v14 = v10;
    id v53 = v14;
    v15 = v11;
    id v54 = v15;
    id v16 = objc_retainBlock(v44);
    uint64_t v17 = objc_retainBlock(v16);
    id v18 = (void *)v65[5];
    v65[5] = (uint64_t)v17;

    uint64_t v38 = 0LL;
    v39 = &v38;
    uint64_t v40 = 0x3032000000LL;
    v41 = sub_B548;
    v42 = sub_B558;
    id v43 = 0LL;
    uint64_t v19 = v33;
    v20 = (void *)objc_claimAutoreleasedReturnValue([v33 gamepadEventFields]);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_E350;
    v35[3] = &unk_18C68;
    v37 = &v38;
    uint64_t v21 = v16;
    v35[4] = a1;
    id v36 = v21;
    [v20 enumerateObjectsUsingBlock:v35];

    v22 = (void *)v39[5];
    BOOL v23 = v22 == 0LL;
    if (v22)
    {
      if (a3) {
        *a3 = v22;
      }
    }

    else
    {
      id v24 = *(void **)(a1 + 712);
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472LL;
      v34[2] = sub_E61C;
      v34[3] = &unk_18C88;
      v34[4] = a1;
      [v24 setBatchInputElementHandler:v34];
    }

    _Block_object_dispose(&v38, 8);
    _Block_object_dispose(&v64, 8);
  }

  else
  {
    BOOL v23 = 0LL;
    uint64_t v19 = v33;
  }

  return v23;
}

void sub_A8D0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, char a28)
{
}

uint64_t sub_A8F8(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = v4;
  if (a1)
  {
    [v4 dispatchFrequency];
    objc_msgSend((id)a1, "setHapticDispatchFrequency:");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 actuators]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "gc_arrayByTransformingElementsUsingBlock:", &stru_18CC8));
    [(id)a1 setHapticMotors:v7];

    v91[0] = _NSConcreteStackBlock;
    v91[1] = 3221225472LL;
    v91[2] = sub_E904;
    v91[3] = &unk_18D18;
    v91[4] = a1;
    int8x16_t v8 = objc_retainBlock(v91);
    v90[0] = _NSConcreteStackBlock;
    v90[1] = 3221225472LL;
    v90[2] = sub_EB74;
    v90[3] = &unk_18D60;
    v90[4] = a1;
    uint64_t v9 = objc_retainBlock(v90);
    v87[0] = _NSConcreteStackBlock;
    v87[1] = 3221225472LL;
    v87[2] = sub_EE9C;
    v87[3] = &unk_18D88;
    int8x16_t v10 = v8;
    id v88 = v10;
    id v11 = v9;
    id v89 = v11;
    NSErrorUserInfoKey v12 = objc_retainBlock(v87);
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSMapTable strongToStrongObjectsMapTable]( &OBJC_CLASS___NSMapTable,  "strongToStrongObjectsMapTable"));
    uint64_t v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v83 = 0u;
    __int128 v84 = 0u;
    __int128 v85 = 0u;
    __int128 v86 = 0u;
    id v15 = (id)objc_claimAutoreleasedReturnValue([v5 outputs]);
    id v16 = [v15 countByEnumeratingWithState:&v83 objects:v99 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v84;
      uint64_t v66 = v14;
      id v62 = v15;
      uint64_t v54 = *(void *)v84;
      uint64_t v55 = a1;
LABEL_4:
      uint64_t v18 = 0LL;
      id v56 = v16;
      while (1)
      {
        if (*(void *)v84 != v17)
        {
          uint64_t v19 = v18;
          objc_enumerationMutation(v15);
          uint64_t v18 = v19;
        }

        uint64_t v61 = v18;
        v20 = *(void **)(*((void *)&v83 + 1) + 8 * v18);
        id v21 = sub_43D8();
        v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v98 = v20;
          _os_log_debug_impl(&dword_0, v22, OS_LOG_TYPE_DEBUG, "Processing rumble output model %@", buf, 0xCu);
        }

        uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue([v20 elementIdentifier]);
        uint64_t v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 736), "objectForKeyedSubscript:"));
        if (!v23) {
          break;
        }
        id v24 = (void *)v23;
        uint64_t Length = _IOHIDElementGetLength();
        if (Length >= 65)
        {
          if (a3)
          {
            uint64_t v53 = GCGenericDeviceErrorDomain;
            v94[0] = @"Invalid Element.";
            v93[0] = NSLocalizedDescriptionKey;
            v93[1] = NSLocalizedFailureReasonErrorKey;
            id v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Element with identifier %@ has too large length: %zi.",  v64,  Length));
            v94[1] = v49;
            id v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v94,  v93,  2LL));
            uint64_t v51 = v53;
            uint64_t v52 = 0LL;
LABEL_34:
            *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v51,  v52,  v50));

            uint64_t v14 = v66;
            id v15 = v62;
          }

          goto LABEL_35;
        }

        v68 = -[NSMutableData initWithLength:](objc_alloc(&OBJC_CLASS___NSMutableData), "initWithLength:", Length);
        v63 = v24;
        objc_msgSend(v13, "setObject:forKey:");
        __int128 v81 = 0u;
        __int128 v82 = 0u;
        __int128 v79 = 0u;
        __int128 v80 = 0u;
        id obj = (id)objc_claimAutoreleasedReturnValue([v20 fields]);
        id v26 = [obj countByEnumeratingWithState:&v79 objects:v92 count:16];
        if (v26)
        {
          id v27 = v26;
          uint64_t v28 = *(void *)v80;
          v59 = v10;
          v60 = v5;
          v57 = v13;
          v58 = v11;
          while (2)
          {
            for (i = 0LL; i != v27; i = (char *)i + 1)
            {
              if (*(void *)v80 != v28) {
                objc_enumerationMutation(obj);
              }
              v30 = *(void **)(*((void *)&v79 + 1) + 8LL * (void)i);
              uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 valueExpression]);
              v32 = (void *)objc_claimAutoreleasedReturnValue([v31 buildPullExpressionWithOverrideBuilder:v12 error:a3]);

              if (!v32) {
                goto LABEL_26;
              }
              id v33 = (void *)objc_claimAutoreleasedReturnValue([v30 offsetExpression]);
              id v34 = (void *)objc_claimAutoreleasedReturnValue([v33 buildPullExpressionWithOverrideBuilder:v12 error:a3]);

              if (!v34) {
                goto LABEL_25;
              }
              v35 = (void *)objc_claimAutoreleasedReturnValue([v30 sizeExpression]);
              id v36 = (void *)objc_claimAutoreleasedReturnValue([v35 buildPullExpressionWithOverrideBuilder:v12 error:a3]);

              if (!v36)
              {

LABEL_25:
LABEL_26:

                uint64_t v45 = 0LL;
                int8x16_t v10 = v59;
                id v5 = v60;
                BOOL v13 = v57;
                id v11 = v58;
                uint64_t v14 = v66;
                id v15 = v62;
                goto LABEL_27;
              }

              v74[0] = _NSConcreteStackBlock;
              v74[1] = 3221225472LL;
              v74[2] = sub_EF40;
              v74[3] = &unk_18DB0;
              id v77 = v34;
              id v78 = v36;
              id v76 = v32;
              v74[4] = v30;
              v75 = v68;
              id v37 = v36;
              id v38 = v34;
              id v39 = v32;
              uint64_t v40 = objc_retainBlock(v74);
              -[NSMutableArray addObject:](v66, "addObject:", v40);
            }

            id v27 = [obj countByEnumeratingWithState:&v79 objects:v92 count:16];
            int8x16_t v10 = v59;
            id v5 = v60;
            BOOL v13 = v57;
            id v11 = v58;
            uint64_t v14 = v66;
            id v15 = v62;
            if (v27) {
              continue;
            }
            break;
          }
        }

        uint64_t v18 = v61 + 1;
        a1 = v55;
        uint64_t v17 = v54;
        if ((id)(v61 + 1) == v56)
        {
          id v16 = [v15 countByEnumeratingWithState:&v83 objects:v99 count:16];
          if (v16) {
            goto LABEL_4;
          }
          goto LABEL_23;
        }
      }

      id v24 = 0LL;
      if (a3)
      {
        uint64_t v48 = GCGenericDeviceErrorDomain;
        v96[0] = @"Invalid Rumble Output.";
        v95[0] = NSLocalizedDescriptionKey;
        v95[1] = NSLocalizedFailureReasonErrorKey;
        id v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Not tracking any output element with identifier %@",  v64));
        v96[1] = v49;
        id v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v96,  v95,  2LL));
        uint64_t v51 = v48;
        uint64_t v52 = 2LL;
        goto LABEL_34;
      }

LABEL_35:
      uint64_t v45 = 0LL;
LABEL_27:
      id v46 = v64;
      goto LABEL_28;
    }

LABEL_23:
    v41 = (void *)objc_claimAutoreleasedReturnValue([(id)a1 device]);
    uint64_t v42 = sub_6A08(a1);
    v69[0] = _NSConcreteStackBlock;
    v69[1] = 3221225472LL;
    v69[2] = sub_F0E8;
    v69[3] = &unk_18DD8;
    id v70 = v13;
    id v72 = v41;
    uint64_t v73 = v42;
    v71 = v14;
    id v15 = v41;
    id v43 = objc_retainBlock(v69);
    v44 = *(void **)(a1 + 744);
    *(void *)(a1 + 744) = v43;

    uint64_t v45 = 1LL;
    id v46 = v70;
LABEL_28:
  }

  else
  {
    uint64_t v45 = 0LL;
  }

  return v45;
}

id sub_B08C(uint64_t a1, uint64_t a2)
{
  id result = objc_retainBlock(*(id *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_B0B4(uint64_t a1)
{
}

NSError *__cdecl sub_B0BC(id a1, GCGenericDeviceDataConstantExpressionModel *a2, id a3)
{
  id v5 = a3;
  -[GCGenericDeviceDataConstantExpressionModel value](a2, "value");
  (*((void (**)(id))a3 + 2))(v5);

  return 0LL;
}

id sub_B108(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v20 = (void *)objc_claimAutoreleasedReturnValue([v5 elementIdentifier]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(void *)(a1 + 32) + 696), "objectForKeyedSubscript:"));
  BOOL v8 = v7 != 0LL;

  v32[0] = 0LL;
  v32[1] = v32;
  v32[2] = 0x2020000000LL;
  v32[3] = 0LL;
  v31[0] = 0LL;
  v31[1] = v31;
  v31[2] = 0x2020000000LL;
  v31[3] = 0LL;
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  int8x16_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 trueExpression]);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_B328;
  v26[3] = &unk_188D8;
  uint64_t v28 = v32;
  id v11 = v6;
  BOOL v30 = v8;
  id v27 = v11;
  uint64_t v29 = v31;
  uint64_t v12 = (*(uint64_t (**)(uint64_t, void *, void *))(v9 + 16))(v9, v10, v26);
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  uint64_t v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }

  else
  {
    uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v5 falseExpression]);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_B360;
    v21[3] = &unk_188D8;
    uint64_t v23 = v31;
    BOOL v25 = v8;
    id v22 = v11;
    id v24 = v32;
    uint64_t v18 = (*(uint64_t (**)(uint64_t, void *, void *))(v16 + 16))(v16, v17, v21);
    id v15 = (id)objc_claimAutoreleasedReturnValue(v18);
  }

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v32, 8);

  return v15;
}

void sub_B304( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, char a26)
{
}

uint64_t sub_B328(uint64_t a1, double a2)
{
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(_BYTE *)(a1 + 56)) {
    uint64_t v4 = *(void *)(a1 + 40);
  }
  else {
    uint64_t v4 = *(void *)(a1 + 48);
  }
  return (*(uint64_t (**)(double))(v3 + 16))(*(double *)(*(void *)(v4 + 8) + 24LL));
}

uint64_t sub_B360(uint64_t a1, double a2)
{
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(_BYTE *)(a1 + 56)) {
    uint64_t v4 = *(void *)(a1 + 48);
  }
  else {
    uint64_t v4 = *(void *)(a1 + 40);
  }
  return (*(uint64_t (**)(double))(v3 + 16))(*(double *)(*(void *)(v4 + 8) + 24LL));
}

id sub_B398(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_opt_class(v5);
  if (v7 == objc_opt_class(&OBJC_CLASS___GCGenericDeviceDataConstantExpressionModel))
  {
    uint64_t v16 = *(void *)(a1 + 32);
LABEL_6:
    uint64_t v17 = (*(uint64_t (**)(uint64_t, id, id))(v16 + 16))(v16, v5, v6);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v17);
    goto LABEL_7;
  }

  uint64_t v8 = objc_opt_class(v5);
  if (v8 == objc_opt_class(&OBJC_CLASS___GCGenericDeviceDataElementExistsExpressionModel))
  {
    uint64_t v16 = *(void *)(a1 + 40);
    goto LABEL_6;
  }

  uint64_t v9 = GCGenericDeviceErrorDomain;
  int8x16_t v10 = (objc_class *)objc_opt_class(v5);
  id v11 = NSStringFromClass(v10);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unsupported expression class: %@.",  v12,  NSLocalizedDescriptionKey,  NSLocalizedFailureReasonErrorKey,  @"Invalid expression."));
  v20[1] = v13;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  &v19,  2LL));
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v9,  2LL,  v14));

LABEL_7:
  return v15;
}

uint64_t sub_B548(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_B558(uint64_t a1)
{
}

void sub_B560(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5 = a2;
  id v6 = sub_43D8();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1023C();
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
  if (v8)
  {
    if (([&off_19A08 containsObject:v8] & 1) == 0)
    {
      v34[0] = NSLocalizedDescriptionKey;
      v34[1] = NSLocalizedFailureReasonErrorKey;
      v35[0] = @"Invalid property";
      id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Property '%@' is not supported.",  v8));
      v35[1] = v24;
      BOOL v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v35,  v34,  2LL));
      uint64_t v26 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  GCGenericDeviceErrorDomain,  2LL,  v25));
      uint64_t v27 = *(void *)(*(void *)(a1 + 40) + 8LL);
      uint64_t v28 = *(void **)(v27 + 40);
      *(void *)(v27 + 40) = v26;
    }

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 valueExpression]);
    if (v9)
    {
      uint64_t v10 = *(void *)(a1 + 32);
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472LL;
      v29[2] = sub_B90C;
      v29[3] = &unk_18950;
      objc_copyWeak(&v31, (id *)(a1 + 48));
      id v30 = v8;
      uint64_t v11 = (*(uint64_t (**)(uint64_t, void *, void *))(v10 + 16))(v10, v9, v29);
      uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8LL);
      uint64_t v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;

      uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
      if (v15)
      {
        v32[0] = NSLocalizedDescriptionKey;
        v32[1] = NSLocalizedFailureReasonErrorKey;
        v33[0] = @"Invalid property";
        v33[1] = @"Invalid value expression.";
        v32[2] = NSUnderlyingErrorKey;
        v33[2] = v15;
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v33,  v32,  3LL));
        uint64_t v17 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  GCGenericDeviceErrorDomain,  2LL,  v16));
        uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8LL);
        uint64_t v19 = *(void **)(v18 + 40);
        *(void *)(v18 + 40) = v17;

        *a3 = 1;
      }

      objc_destroyWeak(&v31);
    }
  }

  else
  {
    v36[0] = NSLocalizedDescriptionKey;
    v36[1] = NSLocalizedFailureReasonErrorKey;
    v37[0] = @"Invalid property";
    v37[1] = @"Property has no name.";
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v37,  v36,  2LL));
    uint64_t v21 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  GCGenericDeviceErrorDomain,  2LL,  v20));
    uint64_t v22 = *(void *)(*(void *)(a1 + 40) + 8LL);
    uint64_t v23 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = v21;

    *a3 = 1;
  }
}

void sub_B8EC(_Unwind_Exception *a1)
{
}

void sub_B90C(uint64_t a1, double a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v7 = WeakRetained;
    id v5 = WeakRetained[88];
    objc_sync_enter(v5);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a2));
    [v7[88] setObject:v6 forKeyedSubscript:*(void *)(a1 + 32)];

    objc_sync_exit(v5);
    id WeakRetained = v7;
  }
}

void sub_B9B0(_Unwind_Exception *a1)
{
}

id sub_B9C4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 elementIdentifier]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 720) objectForKeyedSubscript:v7]);
  if (!v8)
  {
    uint64_t v13 = GCGenericDeviceErrorDomain;
    v23[0] = @"Invalid 'Input Element Value' expression.";
    v22[0] = NSLocalizedDescriptionKey;
    v22[1] = NSLocalizedFailureReasonErrorKey;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Not tracking any element with identifier %@",  v7));
    v23[1] = v14;
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v22,  2LL));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v13,  2LL,  v15));

LABEL_5:
    goto LABEL_6;
  }

  if ((unint64_t)[v5 scaleType] + 3 > 5)
  {
    uint64_t v17 = GCGenericDeviceErrorDomain;
    v20[0] = NSLocalizedDescriptionKey;
    v20[1] = NSLocalizedFailureReasonErrorKey;
    v21[0] = @"Invalid 'Input Element Value' expression.";
    v21[1] = @"Unsupported valueType.";
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  2LL));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v17,  2LL,  v14));
    goto LABEL_5;
  }

  id v9 = [v5 scaleType];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_BC6C;
  v18[3] = &unk_189A0;
  uint64_t v10 = (void (**)(void))v6;
  id v19 = v10;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 registerScaled:v9 valueChangedHandler:v18]);
  [*(id *)(*(void *)(a1 + 32) + 728) addObject:v11];

  objc_msgSend(v8, "scaledValue:", objc_msgSend(v5, "scaleType"));
  v10[2](v10);
  uint64_t v12 = 0LL;
LABEL_6:

  return v12;
}

uint64_t sub_BC6C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_BC78(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 elementIdentifier]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 attribute]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 720) objectForKeyedSubscript:v7]);
  uint64_t v10 = v9;
  if (!v9)
  {
    uint64_t v15 = GCGenericDeviceErrorDomain;
    v26[0] = NSLocalizedDescriptionKey;
    v26[1] = NSLocalizedFailureReasonErrorKey;
    v27[0] = @"Invalid 'Input Element Attribute' expression.";
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Not tracking any element with identifier %@",  v7));
    v27[1] = v12;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v27,  v26,  2LL));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v15,  2LL,  v16));
LABEL_9:

    goto LABEL_10;
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 element]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 valueForElementKey:v8]);

  if (!v12)
  {
    uint64_t v17 = GCGenericDeviceErrorDomain;
    v24[0] = NSLocalizedDescriptionKey;
    v24[1] = NSLocalizedFailureReasonErrorKey;
    v25[0] = @"Invalid 'Input Element Attribute' expression.";
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Element with identifier '%@' does not have a '%@' attribute.",  v7,  v8));
    v25[1] = v16;
    uint64_t v18 = v25;
    id v19 = v24;
LABEL_8:
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v19,  2LL));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v17,  2LL,  v20));

    goto LABEL_9;
  }

  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v12, v13) & 1) == 0)
  {
    uint64_t v17 = GCGenericDeviceErrorDomain;
    v22[0] = NSLocalizedDescriptionKey;
    v22[1] = NSLocalizedFailureReasonErrorKey;
    v23[0] = @"Invalid 'Input Element Attribute' expression.";
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Element with identifier '%@' has an '%@' attribute, but it's not a number.",  v7,  v8));
    v23[1] = v16;
    uint64_t v18 = v23;
    id v19 = v22;
    goto LABEL_8;
  }

  [v12 doubleValue];
  v5[2](v5);
  uint64_t v14 = 0LL;
LABEL_10:

  return v14;
}

NSError *__cdecl sub_BF70(id a1, GCGenericDeviceDataConstantExpressionModel *a2, id a3)
{
  id v5 = a3;
  -[GCGenericDeviceDataConstantExpressionModel value](a2, "value");
  (*((void (**)(id))a3 + 2))(v5);

  return 0LL;
}

id sub_BFBC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v57[0] = 0LL;
  v57[1] = v57;
  v57[2] = 0x2020000000LL;
  v57[3] = 0LL;
  v56[0] = 0LL;
  v56[1] = v56;
  v56[2] = 0x2020000000LL;
  v56[3] = 0LL;
  v55[0] = 0LL;
  v55[1] = v55;
  v55[2] = 0x2020000000LL;
  v55[3] = 0LL;
  v54[0] = 0LL;
  v54[1] = v54;
  v54[2] = 0x2020000000LL;
  v54[3] = 0LL;
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 inputExpression]);
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472LL;
  v48[2] = sub_C344;
  v48[3] = &unk_18A38;
  id v50 = v57;
  uint64_t v51 = v56;
  id v9 = v6;
  id v49 = v9;
  uint64_t v52 = v55;
  uint64_t v53 = v54;
  uint64_t v10 = (*(uint64_t (**)(uint64_t, void *, void *))(v7 + 16))(v7, v8, v48);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }

  else
  {
    uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v5 maskExpression]);
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    v42[2] = sub_C3A0;
    v42[3] = &unk_18A38;
    v44 = v56;
    uint64_t v45 = v57;
    id v16 = v9;
    id v43 = v16;
    id v46 = v55;
    id v47 = v54;
    uint64_t v17 = (*(uint64_t (**)(uint64_t, void *, void *))(v14 + 16))(v14, v15, v42);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    id v19 = v18;
    if (v18)
    {
      id v13 = v18;
    }

    else
    {
      uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v5 trueExpression]);
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472LL;
      void v36[2] = sub_C3FC;
      v36[3] = &unk_18A60;
      id v38 = v55;
      id v39 = v57;
      uint64_t v40 = v56;
      id v29 = v16;
      id v37 = v29;
      v41 = v54;
      uint64_t v22 = (*(uint64_t (**)(uint64_t, void *, void *))(v20 + 16))(v20, v21, v36);
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      id v24 = v23;
      if (v23)
      {
        id v13 = v23;
      }

      else
      {
        uint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v5 falseExpression]);
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472LL;
        v30[2] = sub_C458;
        v30[3] = &unk_18A60;
        v32 = v54;
        id v33 = v57;
        id v34 = v56;
        id v31 = v29;
        v35 = v55;
        uint64_t v27 = (*(uint64_t (**)(uint64_t, void *, void *))(v25 + 16))(v25, v26, v30);
        id v13 = (id)objc_claimAutoreleasedReturnValue(v27);
      }
    }
  }

  _Block_object_dispose(v54, 8);
  _Block_object_dispose(v55, 8);
  _Block_object_dispose(v56, 8);
  _Block_object_dispose(v57, 8);

  return v13;
}

void sub_C308(_Unwind_Exception *a1)
{
}

uint64_t sub_C344(void *a1, double a2)
{
  *(double *)(*(void *)(a1[5] + 8LL) + 24LL) = a2;
  if (((uint64_t)rint(*(double *)(*(void *)(a1[6] + 8LL) + 24LL)) & (uint64_t)rint(*(double *)(*(void *)(a1[5] + 8LL)
                                                                                              + 24LL))) != 0)
    uint64_t v2 = a1[7];
  else {
    uint64_t v2 = a1[8];
  }
  return (*(uint64_t (**)(void, double))(a1[4] + 16LL))(a1[4], *(double *)(*(void *)(v2 + 8) + 24LL));
}

uint64_t sub_C3A0(void *a1, double a2)
{
  *(double *)(*(void *)(a1[5] + 8LL) + 24LL) = a2;
  if (((uint64_t)rint(*(double *)(*(void *)(a1[5] + 8LL) + 24LL)) & (uint64_t)rint(*(double *)(*(void *)(a1[6] + 8LL)
                                                                                              + 24LL))) != 0)
    uint64_t v2 = a1[7];
  else {
    uint64_t v2 = a1[8];
  }
  return (*(uint64_t (**)(void, double))(a1[4] + 16LL))(a1[4], *(double *)(*(void *)(v2 + 8) + 24LL));
}

uint64_t sub_C3FC(void *a1, double a2)
{
  *(double *)(*(void *)(a1[5] + 8LL) + 24LL) = a2;
  if (((uint64_t)rint(*(double *)(*(void *)(a1[7] + 8LL) + 24LL)) & (uint64_t)rint(*(double *)(*(void *)(a1[6] + 8LL)
                                                                                              + 24LL))) != 0)
    uint64_t v2 = a1[5];
  else {
    uint64_t v2 = a1[8];
  }
  return (*(uint64_t (**)(void, double))(a1[4] + 16LL))(a1[4], *(double *)(*(void *)(v2 + 8) + 24LL));
}

uint64_t sub_C458(void *a1, double a2)
{
  *(double *)(*(void *)(a1[5] + 8LL) + 24LL) = a2;
  if (((uint64_t)rint(*(double *)(*(void *)(a1[7] + 8LL) + 24LL)) & (uint64_t)rint(*(double *)(*(void *)(a1[6] + 8LL)
                                                                                              + 24LL))) != 0)
    uint64_t v2 = a1[8];
  else {
    uint64_t v2 = a1[5];
  }
  return (*(uint64_t (**)(void, double))(a1[4] + 16LL))(a1[4], *(double *)(*(void *)(v2 + 8) + 24LL));
}

id sub_C4B4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v27[0] = 0LL;
  v27[1] = v27;
  void v27[2] = 0x2020000000LL;
  v27[3] = 0LL;
  v26[0] = 0LL;
  v26[1] = v26;
  void v26[2] = 0x2020000000LL;
  v26[3] = 0LL;
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 leftExpression]);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  void v22[2] = sub_C68C;
  v22[3] = &unk_18AB0;
  id v24 = v27;
  id v9 = v6;
  id v23 = v9;
  uint64_t v25 = v26;
  uint64_t v10 = (*(uint64_t (**)(uint64_t, void *, void *))(v7 + 16))(v7, v8, v22);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }

  else
  {
    uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v5 rightExpression]);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_C6C0;
    v18[3] = &unk_18AB0;
    uint64_t v20 = v26;
    id v19 = v9;
    uint64_t v21 = v27;
    uint64_t v16 = (*(uint64_t (**)(uint64_t, void *, void *))(v14 + 16))(v14, v15, v18);
    id v13 = (id)objc_claimAutoreleasedReturnValue(v16);
  }

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v27, 8);

  return v13;
}

void sub_C668( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

uint64_t sub_C68C(void *a1, double a2)
{
  *(double *)(*(void *)(a1[5] + 8LL) + 24LL) = a2;
  return (*(uint64_t (**)(void, double))(a1[4] + 16LL))( a1[4],  *(double *)(*(void *)(a1[5] + 8LL) + 24LL) * *(double *)(*(void *)(a1[6] + 8LL) + 24LL));
}

uint64_t sub_C6C0(void *a1, double a2)
{
  *(double *)(*(void *)(a1[5] + 8LL) + 24LL) = a2;
  return (*(uint64_t (**)(void, double))(a1[4] + 16LL))( a1[4],  *(double *)(*(void *)(a1[6] + 8LL) + 24LL) * *(double *)(*(void *)(a1[5] + 8LL) + 24LL));
}

id sub_C6F4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v27[0] = 0LL;
  v27[1] = v27;
  void v27[2] = 0x2020000000LL;
  v27[3] = 0LL;
  v26[0] = 0LL;
  v26[1] = v26;
  void v26[2] = 0x2020000000LL;
  v26[3] = 0LL;
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 leftExpression]);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  void v22[2] = sub_C8CC;
  v22[3] = &unk_18AB0;
  id v24 = v27;
  id v9 = v6;
  id v23 = v9;
  uint64_t v25 = v26;
  uint64_t v10 = (*(uint64_t (**)(uint64_t, void *, void *))(v7 + 16))(v7, v8, v22);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }

  else
  {
    uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v5 rightExpression]);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_C900;
    v18[3] = &unk_18AB0;
    uint64_t v20 = v26;
    id v19 = v9;
    uint64_t v21 = v27;
    uint64_t v16 = (*(uint64_t (**)(uint64_t, void *, void *))(v14 + 16))(v14, v15, v18);
    id v13 = (id)objc_claimAutoreleasedReturnValue(v16);
  }

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v27, 8);

  return v13;
}

void sub_C8A8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

uint64_t sub_C8CC(void *a1, double a2)
{
  *(double *)(*(void *)(a1[5] + 8LL) + 24LL) = a2;
  return (*(uint64_t (**)(void, double))(a1[4] + 16LL))( a1[4],  *(double *)(*(void *)(a1[5] + 8LL) + 24LL) + *(double *)(*(void *)(a1[6] + 8LL) + 24LL));
}

uint64_t sub_C900(void *a1, double a2)
{
  *(double *)(*(void *)(a1[5] + 8LL) + 24LL) = a2;
  return (*(uint64_t (**)(void, double))(a1[4] + 16LL))( a1[4],  *(double *)(*(void *)(a1[6] + 8LL) + 24LL) + *(double *)(*(void *)(a1[5] + 8LL) + 24LL));
}

id sub_C934(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v43[0] = 0LL;
  v43[1] = v43;
  v43[2] = 0x2020000000LL;
  v43[3] = 0LL;
  v42[0] = 0LL;
  v42[1] = v42;
  v42[2] = 0x2020000000LL;
  v42[3] = 0LL;
  v41[0] = 0LL;
  v41[1] = v41;
  v41[2] = 0x2020000000LL;
  v41[3] = 0LL;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 minExpression]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 maxExpression]);
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 inputExpression]);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  void v34[2] = sub_CC38;
  v34[3] = &unk_18B28;
  BOOL v39 = v8 != 0LL;
  id v36 = v43;
  id v37 = v41;
  BOOL v40 = v7 != 0LL;
  id v38 = v42;
  id v11 = v6;
  id v35 = v11;
  uint64_t v12 = (*(uint64_t (**)(uint64_t, void *, void *))(v9 + 16))(v9, v10, v34);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  uint64_t v15 = v13;
  if (!v13)
  {
    if (v7)
    {
      uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472LL;
      v30[2] = sub_CC94;
      v30[3] = &unk_18B28;
      v31[1] = v42;
      v31[2] = v43;
      BOOL v32 = v8 != 0LL;
      v31[3] = v41;
      BOOL v33 = v7 != 0LL;
      v31[0] = v11;
      uint64_t v18 = (*(uint64_t (**)(uint64_t, void *, void *))(v17 + 16))(v17, v7, v30);
      id v16 = (id)objc_claimAutoreleasedReturnValue(v18);
      uint64_t v14 = (id *)v31;
      if (v16 || !v8) {
        goto LABEL_9;
      }
    }

    else if (!v8)
    {
      id v16 = 0LL;
      goto LABEL_10;
    }

    uint64_t v22 = v14;
    uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    void v23[2] = sub_CCF0;
    v23[3] = &unk_18B28;
    uint64_t v25 = v41;
    uint64_t v26 = v43;
    BOOL v28 = v8 != 0LL;
    BOOL v29 = v7 != 0LL;
    uint64_t v27 = v42;
    id v24 = v11;
    uint64_t v20 = (*(uint64_t (**)(uint64_t, void *, void *))(v19 + 16))(v19, v8, v23);
    id v16 = (id)objc_claimAutoreleasedReturnValue(v20);

    uint64_t v14 = v22;
    if (!v7) {
      goto LABEL_10;
    }
LABEL_9:

    goto LABEL_10;
  }

  id v16 = v13;
LABEL_10:

  _Block_object_dispose(v41, 8);
  _Block_object_dispose(v42, 8);
  _Block_object_dispose(v43, 8);

  return v16;
}

void sub_CC00(_Unwind_Exception *a1)
{
}

uint64_t sub_CC38(uint64_t a1, __n128 a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a2.n128_u64[0];
  a2.n128_u64[0] = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8LL);
  }

  if (*(_BYTE *)(a1 + 65))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8LL);
  }

  return (*(uint64_t (**)(__n128))(*(void *)(a1 + 32) + 16LL))(a2);
}

uint64_t sub_CC94(uint64_t a1, __n128 a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a2.n128_u64[0];
  a2.n128_u64[0] = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 56) + 8LL);
  }

  if (*(_BYTE *)(a1 + 65))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  }

  return (*(uint64_t (**)(__n128))(*(void *)(a1 + 32) + 16LL))(a2);
}

uint64_t sub_CCF0(uint64_t a1, __n128 a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a2.n128_u64[0];
  a2.n128_u64[0] = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8LL);
  }

  if (*(_BYTE *)(a1 + 65))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8LL);
  }

  return (*(uint64_t (**)(__n128))(*(void *)(a1 + 32) + 16LL))(a2);
}

id sub_CD4C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v82[0] = 0LL;
  v82[1] = v82;
  v82[2] = 0x2020000000LL;
  v82[3] = 0LL;
  v81[0] = 0LL;
  v81[1] = v81;
  v81[2] = 0x2020000000LL;
  v81[3] = 0LL;
  v80[0] = 0LL;
  v80[1] = v80;
  v80[2] = 0x2020000000LL;
  v80[3] = 0LL;
  v79[0] = 0LL;
  v79[1] = v79;
  v79[2] = 0x2020000000LL;
  v79[3] = 0LL;
  v78[0] = 0LL;
  v78[1] = v78;
  v78[2] = 0x2020000000LL;
  v78[3] = 0LL;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 inputMinExpression]);
  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v5 inputMaxExpression]);
  v41 = (void *)objc_claimAutoreleasedReturnValue([v5 outputMinExpression]);
  BOOL v40 = (void *)objc_claimAutoreleasedReturnValue([v5 outputMaxExpression]);
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 inputExpression]);
  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472LL;
  v71[2] = sub_D1BC;
  v71[3] = &unk_18B78;
  uint64_t v73 = v82;
  v74 = v81;
  v75 = v80;
  id v76 = v79;
  id v77 = v78;
  id v10 = v6;
  id v72 = v10;
  uint64_t v11 = (*(uint64_t (**)(uint64_t, void *, void *))(v8 + 16))(v8, v9, v71);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }

  else
  {
    uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472LL;
    v64[2] = sub_D220;
    v64[3] = &unk_18B78;
    uint64_t v66 = v81;
    v67 = v82;
    v68 = v80;
    id v69 = v79;
    id v70 = v78;
    id v16 = v10;
    id v65 = v16;
    uint64_t v17 = (*(uint64_t (**)(uint64_t, void *, void *))(v15 + 16))(v15, v7, v64);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    uint64_t v19 = v18;
    if (v18)
    {
      id v14 = v18;
    }

    else
    {
      BOOL v39 = v7;
      uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472LL;
      v57[2] = sub_D284;
      v57[3] = &unk_18B78;
      v59 = v80;
      v60 = v82;
      uint64_t v61 = v81;
      id v62 = v79;
      v63 = v78;
      id v21 = v16;
      id v58 = v21;
      uint64_t v22 = *(uint64_t (**)(uint64_t, void *, void *))(v20 + 16);
      uint64_t v23 = v20;
      uint64_t v7 = v39;
      uint64_t v24 = v22(v23, v42, v57);
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      if (v25)
      {
        uint64_t v26 = v25;
        id v14 = v25;
      }

      else
      {
        uint64_t v27 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472LL;
        v50[2] = sub_D2E8;
        v50[3] = &unk_18B78;
        uint64_t v52 = v79;
        uint64_t v53 = v82;
        uint64_t v54 = v81;
        uint64_t v55 = v80;
        id v56 = v78;
        id v28 = v21;
        id v51 = v28;
        BOOL v29 = *(uint64_t (**)(uint64_t, void *, void *))(v27 + 16);
        uint64_t v30 = v27;
        uint64_t v7 = v39;
        uint64_t v31 = v29(v30, v41, v50);
        BOOL v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
        if (v32)
        {
          BOOL v33 = v32;
          id v14 = v32;
        }

        else
        {
          uint64_t v34 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
          v43[0] = _NSConcreteStackBlock;
          v43[1] = 3221225472LL;
          v43[2] = sub_D348;
          v43[3] = &unk_18B78;
          uint64_t v45 = v78;
          id v46 = v82;
          id v47 = v81;
          uint64_t v48 = v80;
          id v49 = v79;
          BOOL v33 = 0LL;
          id v44 = v28;
          id v35 = *(uint64_t (**)(uint64_t, void *, void *))(v34 + 16);
          uint64_t v36 = v34;
          uint64_t v7 = v39;
          uint64_t v37 = v35(v36, v40, v43);
          id v14 = (id)objc_claimAutoreleasedReturnValue(v37);
        }

        uint64_t v26 = 0LL;
      }
    }
  }

  _Block_object_dispose(v78, 8);
  _Block_object_dispose(v79, 8);
  _Block_object_dispose(v80, 8);
  _Block_object_dispose(v81, 8);
  _Block_object_dispose(v82, 8);

  return v14;
}

void sub_D168( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
}

uint64_t sub_D1BC(void *a1, double a2)
{
  *(double *)(*(void *)(a1[5] + 8LL) + 24LL) = a2;
  double v2 = *(double *)(*(void *)(a1[6] + 8LL) + 24LL);
  double v3 = *(double *)(*(void *)(a1[8] + 8LL) + 24LL);
  return (*(uint64_t (**)(void, double))(a1[4] + 16LL))( a1[4],  v3 + fabs((*(double *)(*(void *)(a1[5] + 8LL) + 24LL) - v2) / (*(double *)(*(void *)(a1[7] + 8LL) + 24LL) - v2))
         * (*(double *)(*(void *)(a1[9] + 8LL) + 24LL) - v3));
}

uint64_t sub_D220(void *a1, double a2)
{
  *(double *)(*(void *)(a1[5] + 8LL) + 24LL) = a2;
  double v2 = *(double *)(*(void *)(a1[5] + 8LL) + 24LL);
  double v3 = *(double *)(*(void *)(a1[8] + 8LL) + 24LL);
  return (*(uint64_t (**)(void, double))(a1[4] + 16LL))( a1[4],  v3 + fabs((*(double *)(*(void *)(a1[6] + 8LL) + 24LL) - v2) / (*(double *)(*(void *)(a1[7] + 8LL) + 24LL) - v2))
         * (*(double *)(*(void *)(a1[9] + 8LL) + 24LL) - v3));
}

uint64_t sub_D284(void *a1, double a2)
{
  *(double *)(*(void *)(a1[5] + 8LL) + 24LL) = a2;
  double v2 = *(double *)(*(void *)(a1[7] + 8LL) + 24LL);
  double v3 = *(double *)(*(void *)(a1[8] + 8LL) + 24LL);
  return (*(uint64_t (**)(void, double))(a1[4] + 16LL))( a1[4],  v3 + fabs((*(double *)(*(void *)(a1[6] + 8LL) + 24LL) - v2) / (*(double *)(*(void *)(a1[5] + 8LL) + 24LL) - v2))
         * (*(double *)(*(void *)(a1[9] + 8LL) + 24LL) - v3));
}

uint64_t sub_D2E8(void *a1, double a2)
{
  *(double *)(*(void *)(a1[5] + 8LL) + 24LL) = a2;
  double v2 = *(double *)(*(void *)(a1[7] + 8LL) + 24LL);
  double v3 = *(double *)(*(void *)(a1[5] + 8LL) + 24LL);
  return (*(uint64_t (**)(double))(a1[4] + 16LL))( v3 + fabs((*(double *)(*(void *)(a1[6] + 8LL) + 24LL) - v2) / (*(double *)(*(void *)(a1[8] + 8LL) + 24LL) - v2))
         * (*(double *)(*(void *)(a1[9] + 8LL) + 24LL) - v3));
}

uint64_t sub_D348(void *a1, double a2)
{
  *(double *)(*(void *)(a1[5] + 8LL) + 24LL) = a2;
  double v2 = *(double *)(*(void *)(a1[7] + 8LL) + 24LL);
  double v3 = (*(double *)(*(void *)(a1[6] + 8LL) + 24LL) - v2) / (*(double *)(*(void *)(a1[8] + 8LL) + 24LL) - v2);
  double v4 = *(double *)(*(void *)(a1[9] + 8LL) + 24LL);
}

id sub_D3A8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v95[0] = 0LL;
  v95[1] = v95;
  void v95[2] = 0x2020000000LL;
  v95[3] = 0LL;
  v94[0] = 0LL;
  v94[1] = v94;
  void v94[2] = 0x2020000000LL;
  v94[3] = 0LL;
  v93[0] = 0LL;
  v93[1] = v93;
  void v93[2] = 0x2020000000LL;
  v93[3] = 0LL;
  v92[0] = 0LL;
  v92[1] = v92;
  v92[2] = 0x2020000000LL;
  v92[3] = 0LL;
  v91[0] = 0LL;
  v91[1] = v91;
  v91[2] = 0x2020000000LL;
  v91[3] = 0LL;
  v90[0] = 0LL;
  v90[1] = v90;
  v90[2] = 0x2020000000LL;
  v90[3] = 0LL;
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  v41 = (void *)objc_claimAutoreleasedReturnValue([v5 inputExpression]);
  v82[0] = _NSConcreteStackBlock;
  v82[1] = 3221225472LL;
  v82[2] = sub_D938;
  v82[3] = &unk_18BC8;
  __int128 v84 = v95;
  id v8 = v6;
  id v83 = v8;
  __int128 v85 = v93;
  __int128 v86 = v94;
  v87 = v92;
  id v88 = v91;
  id v89 = v90;
  uint64_t v9 = (*(uint64_t (**)(uint64_t, void *, void *))(v7 + 16))(v7, v41, v82);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }

  else
  {
    uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 inputMinExpression]);
    v74[0] = _NSConcreteStackBlock;
    v74[1] = 3221225472LL;
    v74[2] = sub_D9FC;
    v74[3] = &unk_18BC8;
    id v76 = v94;
    id v15 = v8;
    id v75 = v15;
    id v77 = v95;
    id v78 = v93;
    __int128 v79 = v92;
    __int128 v80 = v91;
    __int128 v81 = v90;
    uint64_t v16 = (*(uint64_t (**)(uint64_t, void *, void *))(v13 + 16))(v13, v14, v74);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    uint64_t v18 = v17;
    if (v17)
    {
      id v12 = v17;
    }

    else
    {
      uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v5 inputMaxExpression]);
      v66[0] = _NSConcreteStackBlock;
      v66[1] = 3221225472LL;
      v66[2] = sub_DAC0;
      v66[3] = &unk_18BC8;
      v68 = v93;
      id v21 = v15;
      id v67 = v21;
      id v69 = v95;
      id v70 = v94;
      v71 = v92;
      id v72 = v91;
      uint64_t v73 = v90;
      uint64_t v22 = (*(uint64_t (**)(uint64_t, void *, void *))(v19 + 16))(v19, v20, v66);
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      uint64_t v24 = v23;
      if (v23)
      {
        id v12 = v23;
      }

      else
      {
        uint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
        BOOL v40 = (void *)objc_claimAutoreleasedReturnValue([v5 maskExpression]);
        v58[0] = _NSConcreteStackBlock;
        v58[1] = 3221225472LL;
        v58[2] = sub_DB84;
        v58[3] = &unk_18BC8;
        v60 = v92;
        id v26 = v21;
        id v59 = v26;
        uint64_t v61 = v95;
        id v62 = v93;
        v63 = v94;
        uint64_t v64 = v91;
        id v65 = v90;
        uint64_t v27 = (*(uint64_t (**)(uint64_t, void *, void *))(v25 + 16))(v25, v40, v58);
        id v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
        BOOL v29 = v28;
        if (v28)
        {
          id v12 = v28;
        }

        else
        {
          uint64_t v30 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
          BOOL v39 = (void *)objc_claimAutoreleasedReturnValue([v5 trueExpression]);
          v50[0] = _NSConcreteStackBlock;
          v50[1] = 3221225472LL;
          v50[2] = sub_DC48;
          v50[3] = &unk_18BC8;
          uint64_t v52 = v91;
          id v31 = v26;
          id v51 = v31;
          uint64_t v53 = v95;
          uint64_t v54 = v93;
          uint64_t v55 = v94;
          id v56 = v92;
          v57 = v90;
          uint64_t v32 = (*(uint64_t (**)(uint64_t, void *, void *))(v30 + 16))(v30, v39, v50);
          BOOL v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
          uint64_t v34 = v33;
          if (v33)
          {
            id v12 = v33;
          }

          else
          {
            uint64_t v35 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
            id v38 = (void *)objc_claimAutoreleasedReturnValue([v5 falseExpression]);
            v42[0] = _NSConcreteStackBlock;
            v42[1] = 3221225472LL;
            v42[2] = sub_DD0C;
            v42[3] = &unk_18BC8;
            id v44 = v90;
            id v43 = v31;
            uint64_t v45 = v95;
            id v46 = v93;
            id v47 = v94;
            uint64_t v48 = v92;
            id v49 = v91;
            uint64_t v36 = (*(uint64_t (**)(uint64_t, void *, void *))(v35 + 16))(v35, v38, v42);
            id v12 = (id)objc_claimAutoreleasedReturnValue(v36);
          }

          BOOL v29 = 0LL;
        }
      }
    }
  }

  _Block_object_dispose(v90, 8);
  _Block_object_dispose(v91, 8);
  _Block_object_dispose(v92, 8);
  _Block_object_dispose(v93, 8);
  _Block_object_dispose(v94, 8);
  _Block_object_dispose(v95, 8);

  return v12;
}

void sub_D8E4(_Unwind_Exception *a1)
{
}

uint64_t sub_D938(void *a1, double a2)
{
  *(double *)(*(void *)(a1[5] + 8LL) + 24LL) = a2;
  double v2 = *(double *)(*(void *)(a1[7] + 8LL) + 24LL);
  double v3 = *(double *)(*(void *)(a1[6] + 8LL) + 24LL) - v2 + 1.0;
  double v4 = *(double *)(*(void *)(a1[5] + 8LL) + 24LL) - v2;
  if (v3 == 4.0)
  {
    double v4 = v4 + v4;
  }

  else if (v3 != 8.0)
  {
    double v4 = -1.0;
  }

  double v5 = rint(v4);
  else {
    uint64_t v6 = qword_16E48[(uint64_t)v5];
  }
  else {
    uint64_t v7 = a1[10];
  }
  return (*(uint64_t (**)(void, double))(a1[4] + 16LL))(a1[4], *(double *)(*(void *)(v7 + 8) + 24LL));
}

uint64_t sub_D9FC(void *a1, double a2)
{
  *(double *)(*(void *)(a1[5] + 8LL) + 24LL) = a2;
  double v2 = *(double *)(*(void *)(a1[5] + 8LL) + 24LL);
  double v3 = *(double *)(*(void *)(a1[7] + 8LL) + 24LL) - v2 + 1.0;
  double v4 = *(double *)(*(void *)(a1[6] + 8LL) + 24LL) - v2;
  if (v3 == 4.0)
  {
    double v4 = v4 + v4;
  }

  else if (v3 != 8.0)
  {
    double v4 = -1.0;
  }

  double v5 = rint(v4);
  else {
    uint64_t v6 = qword_16E48[(uint64_t)v5];
  }
  else {
    uint64_t v7 = a1[10];
  }
  return (*(uint64_t (**)(void, double))(a1[4] + 16LL))(a1[4], *(double *)(*(void *)(v7 + 8) + 24LL));
}

uint64_t sub_DAC0(void *a1, double a2)
{
  *(double *)(*(void *)(a1[5] + 8LL) + 24LL) = a2;
  double v2 = *(double *)(*(void *)(a1[7] + 8LL) + 24LL);
  double v3 = *(double *)(*(void *)(a1[5] + 8LL) + 24LL) - v2 + 1.0;
  double v4 = *(double *)(*(void *)(a1[6] + 8LL) + 24LL) - v2;
  if (v3 == 4.0)
  {
    double v4 = v4 + v4;
  }

  else if (v3 != 8.0)
  {
    double v4 = -1.0;
  }

  double v5 = rint(v4);
  else {
    uint64_t v6 = qword_16E48[(uint64_t)v5];
  }
  else {
    uint64_t v7 = a1[10];
  }
  return (*(uint64_t (**)(void, double))(a1[4] + 16LL))(a1[4], *(double *)(*(void *)(v7 + 8) + 24LL));
}

uint64_t sub_DB84(void *a1, double a2)
{
  *(double *)(*(void *)(a1[5] + 8LL) + 24LL) = a2;
  double v2 = *(double *)(*(void *)(a1[8] + 8LL) + 24LL);
  double v3 = *(double *)(*(void *)(a1[7] + 8LL) + 24LL) - v2 + 1.0;
  double v4 = *(double *)(*(void *)(a1[6] + 8LL) + 24LL) - v2;
  if (v3 == 4.0)
  {
    double v4 = v4 + v4;
  }

  else if (v3 != 8.0)
  {
    double v4 = -1.0;
  }

  double v5 = rint(v4);
  else {
    uint64_t v6 = qword_16E48[(uint64_t)v5];
  }
  else {
    uint64_t v7 = a1[10];
  }
  return (*(uint64_t (**)(void, double))(a1[4] + 16LL))(a1[4], *(double *)(*(void *)(v7 + 8) + 24LL));
}

uint64_t sub_DC48(void *a1, double a2)
{
  *(double *)(*(void *)(a1[5] + 8LL) + 24LL) = a2;
  double v2 = *(double *)(*(void *)(a1[8] + 8LL) + 24LL);
  double v3 = *(double *)(*(void *)(a1[7] + 8LL) + 24LL) - v2 + 1.0;
  double v4 = *(double *)(*(void *)(a1[6] + 8LL) + 24LL) - v2;
  if (v3 == 4.0)
  {
    double v4 = v4 + v4;
  }

  else if (v3 != 8.0)
  {
    double v4 = -1.0;
  }

  double v5 = rint(v4);
  else {
    uint64_t v6 = qword_16E48[(uint64_t)v5];
  }
  else {
    uint64_t v7 = a1[10];
  }
  return (*(uint64_t (**)(void, double))(a1[4] + 16LL))(a1[4], *(double *)(*(void *)(v7 + 8) + 24LL));
}

uint64_t sub_DD0C(void *a1, double a2)
{
  *(double *)(*(void *)(a1[5] + 8LL) + 24LL) = a2;
  double v2 = *(double *)(*(void *)(a1[8] + 8LL) + 24LL);
  double v3 = *(double *)(*(void *)(a1[7] + 8LL) + 24LL) - v2 + 1.0;
  double v4 = *(double *)(*(void *)(a1[6] + 8LL) + 24LL) - v2;
  if (v3 == 4.0)
  {
    double v4 = v4 + v4;
  }

  else if (v3 != 8.0)
  {
    double v4 = -1.0;
  }

  double v5 = rint(v4);
  else {
    uint64_t v6 = qword_16E48[(uint64_t)v5];
  }
  else {
    uint64_t v7 = a1[5];
  }
  return (*(uint64_t (**)(void, double))(a1[4] + 16LL))(a1[4], *(double *)(*(void *)(v7 + 8) + 24LL));
}

id sub_DDD0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v5 elementIdentifier]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(void *)(a1 + 32) + 720), "objectForKeyedSubscript:"));
  BOOL v8 = v7 != 0LL;

  v32[0] = 0LL;
  v32[1] = v32;
  v32[2] = 0x2020000000LL;
  void v32[3] = 0LL;
  v31[0] = 0LL;
  v31[1] = v31;
  v31[2] = 0x2020000000LL;
  v31[3] = 0LL;
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 trueExpression]);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  void v26[2] = sub_DFF0;
  v26[3] = &unk_188D8;
  id v28 = v32;
  id v11 = v6;
  BOOL v30 = v8;
  id v27 = v11;
  BOOL v29 = v31;
  uint64_t v12 = (*(uint64_t (**)(uint64_t, void *, void *))(v9 + 16))(v9, v10, v26);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }

  else
  {
    uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v5 falseExpression]);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    void v21[2] = sub_E028;
    v21[3] = &unk_188D8;
    uint64_t v23 = v31;
    BOOL v25 = v8;
    id v22 = v11;
    uint64_t v24 = v32;
    uint64_t v18 = (*(uint64_t (**)(uint64_t, void *, void *))(v16 + 16))(v16, v17, v21);
    id v15 = (id)objc_claimAutoreleasedReturnValue(v18);
  }

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v32, 8);

  return v15;
}

void sub_DFCC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, char a26)
{
}

uint64_t sub_DFF0(uint64_t a1, double a2)
{
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(_BYTE *)(a1 + 56)) {
    uint64_t v4 = *(void *)(a1 + 40);
  }
  else {
    uint64_t v4 = *(void *)(a1 + 48);
  }
  return (*(uint64_t (**)(double))(v3 + 16))(*(double *)(*(void *)(v4 + 8) + 24LL));
}

uint64_t sub_E028(uint64_t a1, double a2)
{
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(_BYTE *)(a1 + 56)) {
    uint64_t v4 = *(void *)(a1 + 48);
  }
  else {
    uint64_t v4 = *(void *)(a1 + 40);
  }
  return (*(uint64_t (**)(double))(v3 + 16))(*(double *)(*(void *)(v4 + 8) + 24LL));
}

id sub_E060(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_opt_class(v5);
  if (v7 == objc_opt_class(&OBJC_CLASS___GCGenericDeviceDataInputElementValueExpressionModel))
  {
    uint64_t v24 = a1[4];
LABEL_22:
    uint64_t v25 = (*(uint64_t (**)(uint64_t, id, id))(v24 + 16))(v24, v5, v6);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v25);
    goto LABEL_23;
  }

  uint64_t v8 = objc_opt_class(v5);
  if (v8 == objc_opt_class(&OBJC_CLASS___GCGenericDeviceDataInputElementAttributeExpressionModel))
  {
    uint64_t v24 = a1[5];
    goto LABEL_22;
  }

  uint64_t v9 = objc_opt_class(v5);
  if (v9 == objc_opt_class(&OBJC_CLASS___GCGenericDeviceDataBitTestExpressionModel))
  {
    uint64_t v24 = a1[6];
    goto LABEL_22;
  }

  uint64_t v10 = objc_opt_class(v5);
  if (v10 == objc_opt_class(&OBJC_CLASS___GCGenericDeviceDataConstantExpressionModel))
  {
    uint64_t v24 = a1[7];
    goto LABEL_22;
  }

  uint64_t v11 = objc_opt_class(v5);
  if (v11 == objc_opt_class(&OBJC_CLASS___GCGenericDeviceDataMultiplyExpressionModel))
  {
    uint64_t v24 = a1[8];
    goto LABEL_22;
  }

  uint64_t v12 = objc_opt_class(v5);
  if (v12 == objc_opt_class(&OBJC_CLASS___GCGenericDeviceDataAddExpressionModel))
  {
    uint64_t v24 = a1[9];
    goto LABEL_22;
  }

  uint64_t v13 = objc_opt_class(v5);
  if (v13 == objc_opt_class(&OBJC_CLASS___GCGenericDeviceDataClampExpressionModel))
  {
    uint64_t v24 = a1[10];
    goto LABEL_22;
  }

  uint64_t v14 = objc_opt_class(v5);
  if (v14 == objc_opt_class(&OBJC_CLASS___GCGenericDeviceDataInterpolateExpressionModel))
  {
    uint64_t v24 = a1[11];
    goto LABEL_22;
  }

  uint64_t v15 = objc_opt_class(v5);
  if (v15 == objc_opt_class(&OBJC_CLASS___GCGenericDeviceDataSDLHatFunctionExpressionModel))
  {
    uint64_t v24 = a1[12];
    goto LABEL_22;
  }

  uint64_t v16 = objc_opt_class(v5);
  if (v16 == objc_opt_class(&OBJC_CLASS___GCGenericDeviceDataElementExistsExpressionModel))
  {
    uint64_t v24 = a1[13];
    goto LABEL_22;
  }

  uint64_t v17 = GCGenericDeviceErrorDomain;
  uint64_t v18 = (objc_class *)objc_opt_class(v5);
  uint64_t v19 = NSStringFromClass(v18);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unsupported expression class: %@.",  v20,  NSLocalizedDescriptionKey,  NSLocalizedFailureReasonErrorKey,  @"Invalid expression."));
  v28[1] = v21;
  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v28,  &v27,  2LL));
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v17,  2LL,  v22));

LABEL_23:
  return v23;
}

void sub_E350(void *a1, void *a2, _BYTE *a3)
{
  id v5 = a2;
  id v6 = sub_43D8();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_102A0();
  }

  id v8 = [v5 extendedIndex];
  if ((unint64_t)v8 < 0x2F)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v5 sourceExpression]);
    if (v15)
    {
      uint64_t v27 = _NSConcreteStackBlock;
      uint64_t v28 = 3221225472LL;
      BOOL v29 = sub_E5FC;
      BOOL v30 = &unk_18C40;
      uint64_t v16 = a1[5];
      uint64_t v31 = a1[4];
      id v32 = v8;
      uint64_t v17 = (*(uint64_t (**)(void))(v16 + 16))();
      uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);
      uint64_t v19 = *(void *)(a1[6] + 8LL);
      uint64_t v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;

      uint64_t v21 = *(void *)(*(void *)(a1[6] + 8LL) + 40LL);
      if (v21)
      {
        v33[0] = NSLocalizedDescriptionKey;
        v33[1] = NSLocalizedFailureReasonErrorKey;
        v34[0] = @"Invalid field";
        v34[1] = @"Invalid source expression.";
        uint64_t v22 = GCGenericDeviceErrorDomain;
        v33[2] = NSUnderlyingErrorKey;
        void v34[2] = v21;
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v34,  v33,  3LL));
        uint64_t v24 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v22,  2LL,  v23));
        uint64_t v25 = *(void *)(a1[6] + 8LL);
        uint64_t v26 = *(void **)(v25 + 40);
        *(void *)(v25 + 40) = v24;

        *a3 = 1;
      }
    }
  }

  else
  {
    uint64_t v9 = GCGenericDeviceErrorDomain;
    v36[0] = @"Invalid field";
    v35[0] = NSLocalizedDescriptionKey;
    v35[1] = NSLocalizedFailureReasonErrorKey;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid extendedIndex '%zi'.",  v8));
    v36[1] = v10;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v36,  v35,  2LL));
    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v9,  2LL,  v11));
    uint64_t v13 = *(void *)(a1[6] + 8LL);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    *a3 = 1;
  }
}

float sub_E5FC(uint64_t a1, double a2)
{
  float result = a2;
  *(float *)(*(void *)(a1 + 32) + 752LL + 4LL * *(void *)(a1 + 40) + _Block_object_dispose((const void *)(v26 - 136), 8) = result;
  return result;
}

void sub_E61C(uint64_t a1, void *a2, uint64_t a3)
{
  if ([a2 count])
  {
    id v5 = _os_activity_create(&dword_0, "Post Event", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v5, &state);
    uint64_t v6 = sub_6A08(*(void *)(a1 + 32));
    kdebug_trace(835452996LL, v6, a3, 0LL, 0LL);
    uint64_t v7 = *(void *)(a1 + 32);
    v23[0] = *(_OWORD *)(v7 + 752);
    __int128 v8 = *(_OWORD *)(v7 + 768);
    __int128 v9 = *(_OWORD *)(v7 + 784);
    __int128 v10 = *(_OWORD *)(v7 + 816);
    v23[3] = *(_OWORD *)(v7 + 800);
    void v23[4] = v10;
    v23[1] = v8;
    void v23[2] = v9;
    __int128 v11 = *(_OWORD *)(v7 + 832);
    __int128 v12 = *(_OWORD *)(v7 + 848);
    __int128 v13 = *(_OWORD *)(v7 + 880);
    v23[7] = *(_OWORD *)(v7 + 864);
    v23[8] = v13;
    v23[5] = v11;
    v23[6] = v12;
    __int128 v14 = *(_OWORD *)(v7 + 896);
    __int128 v15 = *(_OWORD *)(v7 + 912);
    __int128 v16 = *(_OWORD *)(v7 + 928);
    uint64_t v24 = *(void *)(v7 + 944);
    v23[10] = v15;
    v23[11] = v16;
    v23[9] = v14;
    [(id)v7 dispatchGameControllerExtendedEventWithState:v23 timestamp:a3];
    uint64_t v17 = *(float **)(a1 + 32);
    float v18 = v17[212];
    if (v18 != v17[238])
    {
      [v17 dispatchHomeButtonEventWithValue:v18 != 0.0 timestamp:a3];
      *(_DWORD *)(*(void *)(a1 + 32) + 952LL) = *(_DWORD *)(*(void *)(a1 + 32) + 848LL);
      uint64_t v17 = *(float **)(a1 + 32);
    }

    float v19 = v17[213];
    if (v19 != v17[239])
    {
      [v17 dispatchMenuButtonEventWithValue:v19 != 0.0 timestamp:a3];
      *(_DWORD *)(*(void *)(a1 + 32) + 956LL) = *(_DWORD *)(*(void *)(a1 + 32) + 852LL);
      uint64_t v17 = *(float **)(a1 + 32);
    }

    float v20 = v17[214];
    if (v20 != v17[240])
    {
      [v17 dispatchOptionsButtonEventWithValue:v20 != 0.0 timestamp:a3];
      *(_DWORD *)(*(void *)(a1 + 32) + 960LL) = *(_DWORD *)(*(void *)(a1 + 32) + 856LL);
      uint64_t v17 = *(float **)(a1 + 32);
    }

    float v21 = v17[229];
    if (v21 != v17[241])
    {
      [v17 dispatchSearchButtonEventWithValue:v21 != 0.0 timestamp:a3];
      *(_DWORD *)(*(void *)(a1 + 32) + 964LL) = *(_DWORD *)(*(void *)(a1 + 32) + 916LL);
      uint64_t v17 = *(float **)(a1 + 32);
    }

    float v22 = v17[230];
    if (v22 != v17[242])
    {
      [v17 dispatchShareButtonEventWithValue:v22 != 0.0 timestamp:a3];
      *(_DWORD *)(*(void *)(a1 + 32) + 968LL) = *(_DWORD *)(*(void *)(a1 + 32) + 920LL);
    }

    os_activity_scope_leave(&state);
  }

GCHapticMotor *__cdecl sub_E894(id a1, GCGenericDeviceRumbleActuatorModel *a2, unint64_t a3)
{
  uint64_t v4 = a2;
  id v5 = objc_alloc(&OBJC_CLASS___GCHapticMotor);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[GCGenericDeviceRumbleActuatorModel name](v4, "name"));

  uint64_t v7 = -[GCHapticMotor initWithIndex:name:](v5, "initWithIndex:name:", a3, v6);
  return v7;
}

void *sub_E904(uint64_t a1, void *a2, void *a3)
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a2 motorName]);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) hapticMotors]);
  id v7 = [v6 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v23;
LABEL_3:
    uint64_t v10 = 0LL;
    while (1)
    {
      if (*(void *)v23 != v9) {
        objc_enumerationMutation(v6);
      }
      __int128 v11 = *(void **)(*((void *)&v22 + 1) + 8 * v10);
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 name]);
      unsigned __int8 v13 = [v12 isEqualToString:v5];

      if ((v13 & 1) != 0) {
        break;
      }
      if (v8 == (id)++v10)
      {
        id v8 = [v6 countByEnumeratingWithState:&v22 objects:v28 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    id v14 = v11;

    if (!v14) {
      goto LABEL_12;
    }
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    void v20[2] = sub_EB58;
    v20[3] = &unk_18CF0;
    id v21 = v14;
    id v15 = v14;
    __int128 v16 = objc_retainBlock(v20);
    uint64_t v17 = v21;
  }

  else
  {
LABEL_9:

LABEL_12:
    if (!a3)
    {
      __int128 v16 = 0LL;
      goto LABEL_16;
    }

    uint64_t v18 = GCGenericDeviceErrorDomain;
    v26[0] = NSLocalizedDescriptionKey;
    v26[1] = NSLocalizedFailureReasonErrorKey;
    v27[0] = @"Invalid 'Rumble Motor Value' expression.";
    id v15 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No motor with name %@",  v5));
    v27[1] = v15;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v27,  v26,  2LL));
    __int128 v16 = 0LL;
    *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v18,  2LL,  v17));
  }

LABEL_16:
  return v16;
}

double sub_EB58(uint64_t a1)
{
  return v1;
}

void *sub_EB74(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 elementIdentifier]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 attribute]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 736) objectForKeyedSubscript:v6]);
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForElementKey:v7]);
    if (v10)
    {
      uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
      {
        [v10 doubleValue];
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472LL;
        void v20[2] = sub_EE94;
        v20[3] = &unk_18D38;
        void v20[4] = v12;
        a3 = objc_retainBlock(v20);
LABEL_13:

        goto LABEL_14;
      }

      if (!a3) {
        goto LABEL_13;
      }
      uint64_t v15 = GCGenericDeviceErrorDomain;
      v21[0] = NSLocalizedDescriptionKey;
      v21[1] = NSLocalizedFailureReasonErrorKey;
      v22[0] = @"Invalid 'Input Element Attribute' expression.";
      id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Element with identifier '%@' has an '%@' attribute, but it's not a number.",  v6,  v7));
      v22[1] = v14;
      __int128 v16 = v22;
      uint64_t v17 = v21;
    }

    else
    {
      if (!a3) {
        goto LABEL_13;
      }
      uint64_t v15 = GCGenericDeviceErrorDomain;
      v23[0] = NSLocalizedDescriptionKey;
      v23[1] = NSLocalizedFailureReasonErrorKey;
      v24[0] = @"Invalid 'Input Element Attribute' expression.";
      id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Element with identifier '%@' does not have a '%@' attribute.",  v6,  v7));
      v24[1] = v14;
      __int128 v16 = v24;
      uint64_t v17 = v23;
    }

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v17,  2LL));
    *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v15,  2LL,  v18));

LABEL_12:
    a3 = 0LL;
    goto LABEL_13;
  }

  if (a3)
  {
    uint64_t v13 = GCGenericDeviceErrorDomain;
    v26[0] = @"Invalid 'Input Element Attribute' expression.";
    v25[0] = NSLocalizedDescriptionKey;
    v25[1] = NSLocalizedFailureReasonErrorKey;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Not tracking any element with identifier %@",  v6));
    v26[1] = v10;
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  v25,  2LL));
    *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v13,  2LL,  v14));
    goto LABEL_12;
  }

LABEL_14:
  return a3;
}

  return v6;
}

double sub_EE94(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

id sub_EE9C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = ((uint64_t (*)(void))objc_opt_class)();
  if (v4 == objc_opt_class(&OBJC_CLASS___GCGenericDeviceDataRumbleMotorValueExpressionModel))
  {
    uint64_t v7 = a1 + 32;
LABEL_6:
    uint64_t v8 = (*(uint64_t (**)(void))(*(void *)v7 + 16LL))();
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v8);
    goto LABEL_7;
  }

  uint64_t v5 = objc_opt_class(v3);
  if (v5 == objc_opt_class(&OBJC_CLASS___GCGenericDeviceDataInputElementAttributeExpressionModel))
  {
    uint64_t v7 = a1 + 40;
    goto LABEL_6;
  }

  uint64_t v6 = 0LL;
LABEL_7:

  return v6;
}

unint64_t sub_EF40(uint64_t a1)
{
  uint64_t v2 = (uint64_t)rint((*(double (**)(void))(*(void *)(a1 + 48) + 16LL))());
  unint64_t v3 = (uint64_t)rint((*(double (**)(void))(*(void *)(a1 + 56) + 16LL))());
  unint64_t v4 = (uint64_t)rint((*(double (**)(void))(*(void *)(a1 + 64) + 16LL))());
  id v5 = sub_43D8();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v18 = *(void *)(a1 + 32);
    int v19 = 138413058;
    uint64_t v20 = v18;
    __int16 v21 = 2048;
    uint64_t v22 = v2;
    __int16 v23 = 2048;
    unint64_t v24 = v3;
    __int16 v25 = 2048;
    unint64_t v26 = v4;
    _os_log_debug_impl(&dword_0, v6, OS_LOG_TYPE_DEBUG, "%@ value: %lu, offset: %lu, size: %lu", (uint8_t *)&v19, 0x2Au);
  }

  uint64_t v7 = [*(id *)(a1 + 40) bytes];
  unint64_t result = (unint64_t)[*(id *)(a1 + 40) length];
  if (v4 >= 0x40) {
    unint64_t v9 = 64LL;
  }
  else {
    unint64_t v9 = v4;
  }
  if (v3 >= 8 * result - v9) {
    unint64_t v10 = 8 * result - v9;
  }
  else {
    unint64_t v10 = v3;
  }
  if (v9)
  {
    uint64_t v11 = 0LL;
    unint64_t v12 = 0LL;
    unint64_t v13 = v10 >> 3;
    unint64_t v14 = v9 >> 3;
    char v15 = v10 & 7;
    uint64_t v16 = ~(-1 << v9);
    if (v4 >= 0x40) {
      uint64_t v16 = -1LL;
    }
    unint64_t v17 = (v16 & v2) << v15;
    do
    {
      if (v13 + v12 >= result) {
        break;
      }
      v7[v13 + v12++] |= v17 >> v11;
      v11 += 8LL;
    }

    while (v14 >= v12);
  }

  return result;
}

void sub_F0E8(uint64_t a1)
{
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  float v1 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectEnumerator]);
  id v2 = [v1 countByEnumeratingWithState:&v41 objects:v53 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v42;
    do
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v42 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = *(id *)(*((void *)&v41 + 1) + 8LL * (void)i);
        bzero([v6 mutableBytes], (size_t)objc_msgSend(v6, "length"));
      }

      id v3 = [v1 countByEnumeratingWithState:&v41 objects:v53 count:16];
    }

    while (v3);
  }

  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v7 = *(id *)(a1 + 40);
  id v8 = [v7 countByEnumeratingWithState:&v37 objects:v52 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v38;
    do
    {
      for (j = 0LL; j != v9; j = (char *)j + 1)
      {
        if (*(void *)v38 != v10) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v37 + 1) + 8LL * (void)j) + 16LL))();
      }

      id v9 = [v7 countByEnumeratingWithState:&v37 objects:v52 count:16];
    }

    while (v9);
  }

  uint64_t v12 = mach_absolute_time();
  Mutable = CFDictionaryCreateMutable( 0,  (CFIndex)[*(id *)(a1 + 32) count],  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v14 = *(id *)(a1 + 32);
  id v15 = [v14 countByEnumeratingWithState:&v33 objects:v51 count:16];
  if (v15)
  {
    id v17 = v15;
    uint64_t v18 = *(void *)v34;
    *(void *)&__int128 v16 = 138412802LL;
    __int128 v31 = v16;
    do
    {
      for (k = 0LL; k != v17; k = (char *)k + 1)
      {
        if (*(void *)v34 != v18) {
          objc_enumerationMutation(v14);
        }
        uint64_t v20 = *(__IOHIDElement **)(*((void *)&v33 + 1) + 8LL * (void)k);
        __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v20, v31));
        id v22 = sub_43D8();
        __int16 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          unsigned int v26 = [v21 length];
          id v27 = [v21 bytes];
          *(_DWORD *)buf = v31;
          id v46 = v20;
          __int16 v47 = 1040;
          unsigned int v48 = v26;
          __int16 v49 = 2098;
          id v50 = v27;
          _os_log_debug_impl(&dword_0, v23, OS_LOG_TYPE_DEBUG, "%@ -> %{public}.*P", buf, 0x1Cu);
        }

        id v24 = v21;
        IOHIDValueRef v25 = IOHIDValueCreateWithBytes( 0,  v20,  v12,  (const uint8_t *)[v24 bytes],  (CFIndex)objc_msgSend(v24, "length"));
        CFDictionarySetValue(Mutable, v20, v25);
        CFRelease(v25);
      }

      id v17 = [v14 countByEnumeratingWithState:&v33 objects:v51 count:16];
    }

    while (v17);
  }

  kdebug_trace(835453457LL, *(void *)(a1 + 56), 0LL, 1LL, 0LL);
  IOReturn v28 = IOHIDDeviceSetValueMultiple(*(IOHIDDeviceRef *)(a1 + 48), Mutable);
  if (v28)
  {
    id v29 = sub_43D8();
    BOOL v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      sub_10304(v28, v30);
    }
  }

  kdebug_trace(835453458LL, *(void *)(a1 + 56), 0LL, 1LL, v28);
  CFRelease(Mutable);
}

void sub_F588(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

void sub_F5A8(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

id sub_F5B4(uint64_t a1, int a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](&OBJC_CLASS___NSMutableString, "stringWithCapacity:", 2 * a2));
  if (a2 >= 1)
  {
    unint64_t v5 = a2 + 1LL;
    do
    {
      if ((_DWORD)v5 == 2) {
        id v6 = &stru_191F8;
      }
      else {
        id v6 = @":";
      }
      id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%02x%@",  *(unsigned __int8 *)(a1 + (v5 - 2)),  v6));
      [v4 appendString:v7];

      --v5;
    }

    while (v5 > 1);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", v4));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 uppercaseString]);

  return v9;
}

uint64_t sub_F6A8()
{
  if (qword_1F370 != -1) {
    dispatch_once(&qword_1F370, &stru_18DF8);
  }
  return byte_1F378;
}

void sub_F6E8(id a1)
{
  float v1 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.GameController");
  byte_1F378 = -[NSUserDefaults BOOLForKey:](v1, "BOOLForKey:", @"GCPartnersEnable");
  id v2 = sub_43D8();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = byte_1F378;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Partners mode enabled? %d", (uint8_t *)v4, 8u);
  }
}

NSXPCInterface *sub_F7C4()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCAdaptiveTriggersServiceClientInterface);
}

NSXPCInterface *sub_F7D8()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCAdaptiveTriggersServiceServerInterface);
}

NSXPCInterface *sub_F7EC()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCLightServiceClientInterface);
}

NSXPCInterface *sub_F800()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCLightServiceServerInterface);
}

LABEL_13:
  return (pair<BOOL, float>)(v12 | v11);
}

void sub_F96C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_FA04( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
}

void sub_FB68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_FC3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_FDB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_FE70( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

NSXPCInterface *sub_FE84()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCBatteryServiceClientInterface);
}

NSXPCInterface *sub_FE98()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCBatteryServiceServerInterface);
}

id sub_FEAC()
{
  return +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &unk_16EC8, 37LL);
}

void sub_FEC4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_FEF4(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "setProperty: %@ forKey: %@", (uint8_t *)&v3, 0x16u);
}

void sub_FF78( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_FFA8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_FFD8()
{
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl(&dword_0, v1, OS_LOG_TYPE_ERROR, "Could not get parent of service <%s>: %{mach.errno}d", v2, 0x12u);
  sub_F5A0();
}

void sub_10054(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Failed to create device input.", v1, 2u);
}

void sub_10094(void *a1, void *a2, os_log_s *a3)
{
  int v6 = 134218240;
  id v7 = [a1 count];
  __int16 v8 = 2048;
  id v9 = [a2 count];
  sub_F5A8(&dword_0, a3, v5, "Now tracking '%zd' elements; '%zd' input elements:", (uint8_t *)&v6);
}

void sub_1013C(void *a1, os_log_s *a2)
{
  __int16 v3 = (void *)objc_claimAutoreleasedReturnValue([a1 debugDescription]);
  sub_F594();
  sub_F588(&dword_0, a2, v4, "Applying model: %@", v5);
}

void sub_101C8()
{
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  sub_F5A8(&dword_0, v1, (uint64_t)v1, "\t %@ => %{public}@", v2);
  sub_F5A0();
}

void sub_1023C()
{
}

void sub_102A0()
{
}

void sub_10304(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "Set rumble value(s) failed:  %{mach.errno}d", (uint8_t *)v2, 8u);
}

id objc_msgSend_valueForNoteParam_inParameters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForNoteParam:inParameters:");
}