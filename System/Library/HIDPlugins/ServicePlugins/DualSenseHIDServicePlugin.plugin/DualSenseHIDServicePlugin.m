uint64_t sub_1674()
{
  if (qword_1B608 != -1) {
    dispatch_once(&qword_1B608, &stru_14418);
  }
  return byte_1B600;
}

void sub_16B4(id a1)
{
  byte_1B600 = os_variant_has_internal_diagnostics("com.apple.gamecontroller");
}

id sub_16D8()
{
  if (qword_1B618 != -1) {
    dispatch_once(&qword_1B618, &stru_14438);
  }
  return (id)qword_1B610;
}

void sub_1718(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController", "default");
  v2 = (void *)qword_1B610;
  qword_1B610 = (uint64_t)v1;
}

id sub_1748()
{
  if (qword_1B628 != -1) {
    dispatch_once(&qword_1B628, &stru_14458);
  }
  return (id)qword_1B620;
}

void sub_1788(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController", "monitor");
  v2 = (void *)qword_1B620;
  qword_1B620 = (uint64_t)v1;
}

id sub_17B8()
{
  if (qword_1B638 != -1) {
    dispatch_once(&qword_1B638, &stru_14478);
  }
  return (id)qword_1B630;
}

void sub_17F8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController", "init");
  v2 = (void *)qword_1B630;
  qword_1B630 = (uint64_t)v1;
}

id sub_1828()
{
  if (qword_1B648 != -1) {
    dispatch_once(&qword_1B648, &stru_14498);
  }
  return (id)qword_1B640;
}

void sub_1868(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController", "analytics");
  v2 = (void *)qword_1B640;
  qword_1B640 = (uint64_t)v1;
}

id sub_1898()
{
  if (qword_1B658 != -1) {
    dispatch_once(&qword_1B658, &stru_144B8);
  }
  return (id)qword_1B650;
}

void sub_18D8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController.Daemon", "default");
  v2 = (void *)qword_1B650;
  qword_1B650 = (uint64_t)v1;
}

void sub_1908(char *category)
{
  os_log_t v1 = os_log_create("com.apple.GameController.HID", category);
  v2 = (void *)qword_1B660;
  qword_1B660 = (uint64_t)v1;
}

id sub_1934()
{
  if (qword_1B668 != -1) {
    dispatch_once(&qword_1B668, &stru_144D8);
  }
  return (id)qword_1B660;
}

void sub_1974(id a1)
{
  if (!qword_1B660) {
    objc_storeStrong((id *)&qword_1B660, &_os_log_default);
  }
}

id sub_1998()
{
  if (qword_1B678 != -1) {
    dispatch_once(&qword_1B678, &stru_144F8);
  }
  return (id)qword_1B670;
}

void sub_19D8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController.Settings", "default");
  v2 = (void *)qword_1B670;
  qword_1B670 = (uint64_t)v1;
}

id sub_1A08()
{
  if (qword_1B688 != -1) {
    dispatch_once(&qword_1B688, &stru_14518);
  }
  return (id)qword_1B680;
}

void sub_1A48(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController.Haptics", "default");
  v2 = (void *)qword_1B680;
  qword_1B680 = (uint64_t)v1;
}

id sub_1A78()
{
  if (qword_1B698 != -1) {
    dispatch_once(&qword_1B698, &stru_14538);
  }
  return (id)qword_1B690;
}

void sub_1AB8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.gamecontroller", "Signposts");
  v2 = (void *)qword_1B690;
  qword_1B690 = (uint64_t)v1;
}

id sub_1AE8()
{
  if (qword_1B6A8 != -1) {
    dispatch_once(&qword_1B6A8, &stru_14558);
  }
  return (id)qword_1B6A0;
}

void sub_1B28(id a1)
{
  os_log_t v1 = os_log_create("com.apple.runtime-issues", "GameController");
  v2 = (void *)qword_1B6A0;
  qword_1B6A0 = (uint64_t)v1;
}

NSXPCInterface *sub_1B58()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCGameIntentServiceClientInterface);
}

NSXPCInterface *sub_1B6C()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCGameIntentServiceServerInterface);
}

id sub_1B80()
{
  return +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &unk_127A0, 37LL);
}

LABEL_13:
  return (pair<BOOL, float>)(v12 | v11);
}

void sub_1CF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D88( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
}

LABEL_14:
  return v6;
}

void sub_1EEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1FC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_213C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21F4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

NSXPCInterface *sub_2208()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCNintendoJoyConFusionGestureServiceClientInterface);
}

NSXPCInterface *sub_221C()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCNintendoJoyConFusionGestureServiceServerInterface);
}

id sub_26A4(uint64_t a1, int a2)
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](&OBJC_CLASS___NSMutableString, "stringWithCapacity:", 2 * a2));
  if (a2 >= 1)
  {
    unint64_t v5 = a2 + 1LL;
    do
    {
      if ((_DWORD)v5 == 2) {
        v6 = &stru_14A20;
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

uint64_t sub_2798()
{
  if (qword_1B6B0 != -1) {
    dispatch_once(&qword_1B6B0, &stru_14578);
  }
  return byte_1B6B8;
}

void sub_27D8(id a1)
{
  os_log_t v1 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.GameController");
  byte_1B6B8 = -[NSUserDefaults BOOLForKey:](v1, "BOOLForKey:", @"GCPartnersEnable");
  id v2 = sub_1934();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = byte_1B6B8;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Partners mode enabled? %d", (uint8_t *)v4, 8u);
  }
}

id sub_28B4()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL____GCDriverClientInterface));
  os_log_t v1 = sub_2208();
  id v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  [v0 setInterface:v2 forSelector:"connectToNintendoJoyConFusionGestureServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  v3 = sub_221C();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  [v0 setInterface:v4 forSelector:"connectToNintendoJoyConFusionGestureServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  unint64_t v5 = sub_BCD0();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v0 setInterface:v6 forSelector:"connectToLightServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  v7 = sub_BCE4();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v0 setInterface:v8 forSelector:"connectToLightServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  v9 = sub_2B70();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  [v0 setInterface:v10 forSelector:"connectToAdaptiveTriggersServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  v11 = sub_2B84();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  [v0 setInterface:v12 forSelector:"connectToAdaptiveTriggersServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  v13 = sub_BCA8();
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  [v0 setInterface:v14 forSelector:"connectToMotionServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  v15 = sub_BCBC();
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  [v0 setInterface:v16 forSelector:"connectToMotionServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  v17 = sub_BCF8();
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  [v0 setInterface:v18 forSelector:"connectToBatteryServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  v19 = sub_BD0C();
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  [v0 setInterface:v20 forSelector:"connectToBatteryServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  v21 = sub_1B58();
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  [v0 setInterface:v22 forSelector:"connectToGameIntentServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  v23 = sub_1B6C();
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

NSXPCInterface *sub_2B5C()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL____GCDriverServerInterface);
}

NSXPCInterface *sub_2B70()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCAdaptiveTriggersServiceClientInterface);
}

NSXPCInterface *sub_2B84()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCAdaptiveTriggersServiceServerInterface);
}

dispatch_source_s *sub_2B98(uint64_t a1, uint64_t a2, dispatch_queue_s *a3, void *a4)
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

void sub_2DD4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_2E04(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = sub_1934();
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

void sub_2E98(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = sub_1934();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v5 = 0;
    _os_log_impl( &dword_0,  v3,  OS_LOG_TYPE_DEFAULT,  "Connection to com.apple.GameController.gamecontrollerd.driver interrupted.  Attempting to re-establish.",  v5,  2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained remoteObjectProxy]);
  [v4 driverCheckIn];
}

void sub_337C(uint64_t a1, int a2, int a3, uint64_t a4)
{
  if (a3 | a2)
  {
    switch(a2)
    {
      case 3:
        id v11 = sub_1934();
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
        id v12 = sub_1934();
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
        id v5 = sub_1934();
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

  id v9 = sub_1934();
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

void sub_3520(uint64_t a1, void *a2)
{
  id v3 = sub_1934();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_BD20(v4, v5, v6, v7, v8, v9, v10, v11);
  }

  if (a2) {
    [a2 disconnect];
  }
}

void sub_36F8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_3710(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_3720(uint64_t a1)
{
}

void sub_3728(uint64_t a1)
{
  id v2 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  dispatch_queue_get_label(*(dispatch_queue_t *)(a1 + 32)),  4LL);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = sub_1934();
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

  free(*(void **)(a1 + 48));
  free(*(void **)(a1 + 56));
}

BOOL sub_3B08(id a1, NSDictionary *a2, NSDictionary *a3)
{
  id v3 = a2;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", @"DeviceUsagePage"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", @"DeviceUsage"));
    char v8 = (![v6 isEqual:&off_15638]
       || ([v7 isEqual:&off_15650] & 1) == 0)
      && (![v6 isEqual:&off_15638]
       || ([v7 isEqual:&off_15668] & 1) == 0)
  }

  else
  {
    char v8 = 1;
  }

  return v8;
}

void sub_4048( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_406C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = sub_1934();
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

void sub_4238(uint64_t a1)
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
    char v8 = *(void **)(v7 + 536);
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
        v17 = sub_1934();
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
      v19 = sub_1934();
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
      uint64_t v14 = sub_1934();
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

void sub_4BC0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(dispatch_queue_s **)(v2 + 560);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_4C4C;
  v8[3] = &unk_14630;
  v8[4] = v2;
  uint64_t v4 = sub_2B98(0x6FC23AC00uLL, 0x3B9ACA00uLL, v3, v8);
  uint64_t v5 = objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v5;
}

id sub_4C4C(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateIdleState];
}

void sub_4E28(id a1)
{
}

void sub_4E84(uint64_t a1, void *a2, int a3)
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

uint64_t sub_4F20(uint64_t result)
{
  if (result) {
    return *(void *)(result + 656);
  }
  return result;
}

id sub_5058(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchEvent:*(void *)(a1 + 40)];
}

id sub_5178(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchIdleEvent:*(void *)(a1 + 40)];
}

void sub_6228(uint64_t a1)
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
        v8[2] = sub_6304;
        v8[3] = &unk_145A0;
        objc_copyWeak(&v9, v1);
        id v5 = sub_2B98(0xF4240uLL, 0x186A0uLL, tv_sec, v8);
        uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);
        tv_nsec = (void *)v3[33].tv_nsec;
        v3[33].tv_nsec = v6;

        objc_destroyWeak(&v9);
      }
    }
  }
}

void sub_6304(uint64_t a1)
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
      id v3 = sub_1934();
      uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
      BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
      if ((v2 & 1) != 0)
      {
        if (v5) {
          sub_BDD4(v4, v6, v7, v8, v9, v10, v11, v12);
        }

        HIDWORD(WeakRetained[30].tv_nsec) = 0;
        -[timespec dispatchHapticEvent](WeakRetained, "dispatchHapticEvent");
      }

      else
      {
        if (v5) {
          sub_BE04(v4, v6, v7, v8, v9, v10, v11, v12);
        }

        -[timespec stopHaptics](WeakRetained, "stopHaptics");
      }
    }
  }
}

void sub_69B8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_69D0()
{
}

void sub_70D8(uint64_t a1, int a2, const void *a3, unint64_t a4)
{
  if (a2)
  {
    id v8 = sub_1934();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_BE98();
    }
  }

  else
  {
    if (a4 >= 0x40) {
      size_t v10 = 64LL;
    }
    else {
      size_t v10 = a4;
    }
    memcpy((void *)(*(void *)(a1 + 32) + 904LL), a3, v10);
    id v11 = sub_1934();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = sub_7220((const char *)(*(void *)(a1 + 32) + 904LL));
      timespec v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      int v14 = 138412290;
      v15 = v13;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "(Async) Firmware Info = %@", (uint8_t *)&v14, 0xCu);
    }
  }

  free(*(void **)(a1 + 48));
  free(*(void **)(a1 + 56));
}

id sub_7220(const char *a1)
{
  uint64_t v1 = *(unsigned __int8 *)a1;
  if (!*a1) {
    return (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
  }
  __dst[11] = 0;
  strncpy(__dst, a1 + 1, 0xBuLL);
  v27[8] = 0;
  strncpy(v27, a1 + 12, 8uLL);
  v25[0] = @"ReportID";
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", v1));
  v26[0] = v24;
  v25[1] = @"Build Date";
  uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", __dst));
  v23 = (void *)v3;
  if (v3) {
    uint64_t v4 = (const __CFString *)v3;
  }
  else {
    uint64_t v4 = @"<invalid>";
  }
  v26[1] = v4;
  v25[2] = @"Build Time";
  uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v27));
  v22 = (void *)v5;
  if (v5) {
    uint64_t v6 = (const __CFString *)v5;
  }
  else {
    uint64_t v6 = @"<invalid>";
  }
  v26[2] = v6;
  v25[3] = @"Firmware Type";
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  *((unsigned __int16 *)a1 + 10)));
  v26[3] = v21;
  v25[4] = @"Software Series";
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  *((unsigned __int16 *)a1 + 11)));
  v26[4] = v20;
  v25[5] = @"Hardware Info";
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *((unsigned int *)a1 + 6)));
  v26[5] = v19;
  v25[6] = @"Main Firmware Version";
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *((unsigned int *)a1 + 7)));
  v26[6] = v18;
  v25[7] = @"Device Info [0]";
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *((unsigned int *)a1 + 8)));
  v26[7] = v7;
  v25[8] = @"Device Info [1]";
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *((unsigned int *)a1 + 9)));
  v26[8] = v8;
  v25[9] = @"Device Info [2]";
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *((unsigned int *)a1 + 10)));
  v26[9] = v9;
  v25[10] = @"Device Info [3]";
  size_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *((unsigned int *)a1 + 11)));
  v26[10] = v10;
  v25[11] = @"Update Version";
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  *((unsigned __int16 *)a1 + 22)));
  v26[11] = v11;
  v25[12] = @"Update Capability Info";
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  *((unsigned __int8 *)a1 + 46)));
  v26[12] = v12;
  v25[13] = @"Audio Sig Proc FW Version";
  timespec v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *((unsigned int *)a1 + 13)));
  v26[13] = v13;
  v25[14] = @"Audio Codec FW Version";
  int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *((unsigned int *)a1 + 14)));
  v26[14] = v14;
  v25[15] = @"CRC 32";
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *((unsigned int *)a1 + 15)));
  v26[15] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  v25,  16LL));

  return v16;
}

void sub_77B4(uint64_t a1, int a2, const void *a3, unint64_t a4)
{
  if (a2)
  {
    id v8 = sub_1934();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_BF5C();
    }
LABEL_4:

    goto LABEL_18;
  }

  if (a4 >= 0x29) {
    size_t v10 = 41LL;
  }
  else {
    size_t v10 = a4;
  }
  memcpy((void *)(*(void *)(a1 + 32) + 727LL), a3, v10);
  if (sub_1674())
  {
    id v15 = sub_1934();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = (_OWORD *)(*(void *)(a1 + 32) + 727LL);
      *(_OWORD *)buf = *v17;
      v47[0] = v17[1];
      *(_OWORD *)((char *)v47 + 9) = *(_OWORD *)((char *)v17 + 25);
      id v18 = sub_7EE0((uint64_t)buf);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v19;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "(Async) Sensor Calibration Info = %@", buf, 0xCu);
    }
  }

  uint64_t v11 = *(void *)(a1 + 32);
  double v12 = (double)(*(__int16 *)(v11 + 748) + *(__int16 *)(v11 + 746)) * 0.5;
  *(double *)(v11 + 76_Block_object_dispose(va, 8) = v12
                         / ((fabs((double)(*(__int16 *)(v11 + 734) - *(__int16 *)(v11 + 728)))
  *(double *)(*(void *)(a1 + 32) + 768LL) = *(double *)(*(void *)(a1 + 32) + 768LL) * 0.0174532925;
  uint64_t v13 = *(void *)(a1 + 32);
  *(double *)(v13 + 776) = v12
                         / ((fabs((double)(*(__int16 *)(v13 + 738) - *(__int16 *)(v13 + 730)))
  *(double *)(*(void *)(a1 + 32) + 776LL) = *(double *)(*(void *)(a1 + 32) + 776LL) * 0.0174532925;
  uint64_t v14 = *(void *)(a1 + 32);
  *(double *)(v14 + 784) = v12
                         / ((fabs((double)(*(__int16 *)(v14 + 742) - *(__int16 *)(v14 + 732)))
  *(double *)(*(void *)(a1 + 32) + 784LL) = *(double *)(*(void *)(a1 + 32) + 784LL) * 0.0174532925;
  *(double *)(*(void *)(a1 + 32) + 792LL) = (double)(*(__int16 *)(*(void *)(a1 + 32) + 752LL)
  *(double *)(*(void *)(a1 + 32) + 800LL) = (double)(*(__int16 *)(*(void *)(a1 + 32) + 756LL)
  *(double *)(*(void *)(a1 + 32) + 808LL) = (double)(*(__int16 *)(*(void *)(a1 + 32) + 760LL)
  *(double *)(*(void *)(a1 + 32) + 816LL) = 2.0
  *(double *)(*(void *)(a1 + 32) + 824LL) = 2.0
  *(double *)(*(void *)(a1 + 32) + 832LL) = 2.0
  if (sub_1674())
  {
    id v20 = sub_1934();
    log = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 768LL);
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v21;
      _os_log_impl(&dword_0, log, OS_LOG_TYPE_INFO, "(Async) Gyro Pitch Sensitivity = %f", buf, 0xCu);
    }
  }

  if (sub_1674())
  {
    id v22 = sub_1934();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = *(void *)(*(void *)(a1 + 32) + 776LL);
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v24;
      _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "(Async) Gyro Yaw Sensitivity = %f", buf, 0xCu);
    }
  }

  if (sub_1674())
  {
    id v25 = sub_1934();
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      uint64_t v27 = *(void *)(*(void *)(a1 + 32) + 784LL);
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v27;
      _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "(Async) Gyro Roll Sensitivity = %f", buf, 0xCu);
    }
  }

  if (sub_1674())
  {
    id v28 = sub_1934();
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      uint64_t v30 = *(void *)(*(void *)(a1 + 32) + 792LL);
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v30;
      _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "(Async) Accelerometer X Bias = %f", buf, 0xCu);
    }
  }

  if (sub_1674())
  {
    id v31 = sub_1934();
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      uint64_t v33 = *(void *)(*(void *)(a1 + 32) + 800LL);
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v33;
      _os_log_impl(&dword_0, v32, OS_LOG_TYPE_INFO, "(Async) Accelerometer Y Bias = %f", buf, 0xCu);
    }
  }

  if (sub_1674())
  {
    id v34 = sub_1934();
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      uint64_t v36 = *(void *)(*(void *)(a1 + 32) + 808LL);
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v36;
      _os_log_impl(&dword_0, v35, OS_LOG_TYPE_INFO, "(Async) Accelerometer Z Bias = %f", buf, 0xCu);
    }
  }

  if (sub_1674())
  {
    id v37 = sub_1934();
    v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      uint64_t v39 = *(void *)(*(void *)(a1 + 32) + 816LL);
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v39;
      _os_log_impl(&dword_0, v38, OS_LOG_TYPE_INFO, "(Async) Accelerometer X Sensitivity = %f", buf, 0xCu);
    }
  }

  if (sub_1674())
  {
    id v40 = sub_1934();
    v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      uint64_t v42 = *(void *)(*(void *)(a1 + 32) + 824LL);
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v42;
      _os_log_impl(&dword_0, v41, OS_LOG_TYPE_INFO, "(Async) Accelerometer Y Sensitivity = %f", buf, 0xCu);
    }
  }

  if (sub_1674())
  {
    id v43 = sub_1934();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v44 = *(void *)(*(void *)(a1 + 32) + 832LL);
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v44;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "(Async) Accelerometer Z Sensitivity = %f", buf, 0xCu);
    }

    goto LABEL_4;
  }

id sub_7EE0(uint64_t a1)
{
  if (!*(_BYTE *)a1) {
    return (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
  }
  v24[0] = @"ReportID";
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:"));
  v25[0] = v23;
  v24[1] = @"gyroPitchBias";
  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithShort:]( &OBJC_CLASS___NSNumber,  "numberWithShort:",  *(__int16 *)(a1 + 1)));
  v25[1] = v22;
  v24[2] = @"gyroYawBias";
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithShort:]( &OBJC_CLASS___NSNumber,  "numberWithShort:",  *(__int16 *)(a1 + 3)));
  v25[2] = v21;
  v24[3] = @"gyroRollBias";
  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithShort:]( &OBJC_CLASS___NSNumber,  "numberWithShort:",  *(__int16 *)(a1 + 5)));
  v25[3] = v20;
  v24[4] = @"gyroRefPitchPlus";
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithShort:]( &OBJC_CLASS___NSNumber,  "numberWithShort:",  *(__int16 *)(a1 + 7)));
  v25[4] = v19;
  v24[5] = @"gyroRefPitchMinus";
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithShort:]( &OBJC_CLASS___NSNumber,  "numberWithShort:",  *(__int16 *)(a1 + 9)));
  v25[5] = v18;
  v24[6] = @"gyroRefYawPlus";
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithShort:]( &OBJC_CLASS___NSNumber,  "numberWithShort:",  *(__int16 *)(a1 + 11)));
  v25[6] = v17;
  v24[7] = @"gyroRefYawMinus";
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithShort:]( &OBJC_CLASS___NSNumber,  "numberWithShort:",  *(__int16 *)(a1 + 13)));
  v25[7] = v16;
  v24[8] = @"gyroRefRollPlus";
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithShort:]( &OBJC_CLASS___NSNumber,  "numberWithShort:",  *(__int16 *)(a1 + 15)));
  v25[8] = v15;
  v24[9] = @"gyroRefRollMinus";
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithShort:]( &OBJC_CLASS___NSNumber,  "numberWithShort:",  *(__int16 *)(a1 + 17)));
  v25[9] = v14;
  v24[10] = @"gyroRefSpeedPlus";
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithShort:]( &OBJC_CLASS___NSNumber,  "numberWithShort:",  *(__int16 *)(a1 + 19)));
  v25[10] = v13;
  v24[11] = @"gyroRefSpeedMinus";
  unsigned __int8 v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithShort:]( &OBJC_CLASS___NSNumber,  "numberWithShort:",  *(__int16 *)(a1 + 21)));
  v25[11] = v2;
  v24[12] = @"accelRefXPlus";
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithShort:]( &OBJC_CLASS___NSNumber,  "numberWithShort:",  *(__int16 *)(a1 + 23)));
  v25[12] = v3;
  v24[13] = @"accelRefXMinus";
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithShort:]( &OBJC_CLASS___NSNumber,  "numberWithShort:",  *(__int16 *)(a1 + 25)));
  v25[13] = v4;
  v24[14] = @"accelRefYPlus";
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithShort:]( &OBJC_CLASS___NSNumber,  "numberWithShort:",  *(__int16 *)(a1 + 27)));
  v25[14] = v5;
  v24[15] = @"accelRefYMinus";
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithShort:]( &OBJC_CLASS___NSNumber,  "numberWithShort:",  *(__int16 *)(a1 + 29)));
  v25[15] = v6;
  v24[16] = @"accelRefZPlus";
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithShort:]( &OBJC_CLASS___NSNumber,  "numberWithShort:",  *(__int16 *)(a1 + 31)));
  void v25[16] = v7;
  v24[17] = @"accelRefZMinus";
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithShort:]( &OBJC_CLASS___NSNumber,  "numberWithShort:",  *(__int16 *)(a1 + 33)));
  v25[17] = v8;
  v24[18] = @"calibrationTemp";
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  *(unsigned __int16 *)(a1 + 35)));
  v25[18] = v9;
  v24[19] = @"CRC 32";
  size_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(a1 + 37)));
  v25[19] = v10;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v25,  v24,  20LL));

  return v11;
}

void sub_86A0(_Unwind_Exception *a1)
{
}

void sub_86C8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v124 = a2;
  id v125 = a6;
  id v15 = (id *)(a1 + 32);
  id WeakRetained = (dispatch_once_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v17 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v18 = sub_4F20((uint64_t)WeakRetained);
    kdebug_trace(835452996LL, v18, a3, a4, a5);
    __int128 v152 = 0u;
    memset(v153, 0, 28);
    memset(v151, 0, sizeof(v151));
    if (a5 == 49)
    {
      id v24 = v125;
      id v25 = (char *)[v24 bytes];
      if (!*((_BYTE *)v17 + 1029)) {
        -[dispatch_once_t setExtendedSupportEnabled:](v17, "setExtendedSupportEnabled:", 1LL);
      }
      v26 = v25 + 2;
      id v27 = [v24 length];
      else {
        uint64_t v28 = (uint64_t)v27;
      }
      __memcpy_chk(v151, v26, v28, 76LL);
LABEL_16:
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_92B8;
      block[3] = &unk_146C8;
      v29 = v17;
      v127 = v29;
      objc_copyWeak(&v128, v15);
      if (v17[87] != -1) {
        dispatch_once(v17 + 87, block);
      }
      [v29 updateBatteryLevel:v153[2] & 0xF chargeStatus:LOBYTE(v153[2]) >> 4];
      if (*((_BYTE *)v29 + 721))
      {
        double v31 = *((double *)v29 + 96) * (double)(*(__int16 *)((char *)v151 + 15) - *((__int16 *)v29 + 364));
        double v32 = *((double *)v29 + 98) * (double)(*((__int16 *)v29 + 366) - *(__int16 *)((char *)&v151[1] + 3));
        double v33 = *((double *)v29 + 97) * (double)(*(__int16 *)((char *)&v151[1] + 1) - *((__int16 *)v29 + 365));
        double v34 = -(((double)*(__int16 *)((char *)&v151[1] + 5) - *((double *)v29 + 99)) * *((double *)v29 + 102));
        double v35 = ((double)*(__int16 *)((char *)&v151[1] + 9) - *((double *)v29 + 101)) * *((double *)v29 + 104);
        double v30 = (double)*(__int16 *)((char *)&v151[1] + 7) - *((double *)v29 + 100);
        double v36 = -(v30 * *((double *)v29 + 103));
        char v37 = 1;
      }

      else
      {
        char v37 = 0;
        double v36 = 0.0;
        double v35 = 0.0;
        double v34 = 0.0;
        double v33 = 0.0;
        double v32 = 0.0;
        double v31 = 0.0;
      }

      LOBYTE(v30) = BYTE1(v151[0]);
      *(double *)&unint64_t v41 = (double)*(unint64_t *)&v30;
      double v42 = *(double *)&v41 + -127.5;
      LOBYTE(v41) = BYTE3(v151[0]);
      double v43 = (double)v41 + -127.5;
      int8x8_t v44 = 0LL;
      float v45 = 0.0;
      float v46 = 0.0;
      float v47 = 0.0;
      int8x8_t v48 = 0LL;
      if (((char)v152 & 0x80000000) == 0)
      {
        unsigned int v49 = (*(unsigned __int16 *)((char *)&v152 + 1) | (BYTE3(v152) << 16)) >> 12;
        float v50 = (float)((float)((float)v49 / 1079.0) + (float)((float)v49 / 1079.0)) + -1.0;
        float v46 = fmaxf(-v50, 0.0);
        float v47 = fmaxf(v50, 0.0);
        *(float *)v51.i32 = -(float)((float)((float)((float)(*(_WORD *)((_BYTE *)&v152 + 1) & 0xFFF) / 1919.0)
        v52.i32[0] = 0;
        v52.f32[1] = (float)((float)((float)(*(_WORD *)((_BYTE *)&v152 + 1) & 0xFFF) / 1919.0)
        *(float *)&v51.i32[1] = v52.f32[1];
        int8x8_t v48 = vand_s8(v51, (int8x8_t)vcgt_f32(v52, (float32x2_t)v52.u32[1]));
      }

      double v53 = v42 / -127.5;
      float v54 = 0.0;
      double v55 = v43 / -127.5;
      if ((SBYTE4(v152) & 0x80000000) == 0)
      {
        *(float *)&unsigned int v56 = (float)((float)((float)(*(_WORD *)((_BYTE *)&v152 + 5) & 0xFFF) / 1919.0)
        unsigned int v57 = (*(unsigned __int16 *)((char *)&v152 + 5) | (BYTE7(v152) << 16)) >> 12;
        float v58 = (float)((float)((float)v57 / 1079.0) + (float)((float)v57 / 1079.0)) + -1.0;
        float v45 = fmaxf(-v58, 0.0);
        float v54 = fmaxf(v58, 0.0);
        *(float *)v59.i32 = -*(float *)&v56;
        v60.i32[0] = 0;
        v60.f32[1] = *(float *)&v56;
        v59.i32[1] = v56;
        int8x8_t v44 = vand_s8(v59, (int8x8_t)vcgt_f32(v60, (float32x2_t)v56));
      }

      float v61 = v53;
      float v62 = v55;
      unsigned int v63 = BYTE9(v151[0]);
      unsigned int v64 = *(unsigned __int16 *)((char *)v151 + 7) | (BYTE9(v151[0]) << 16);
      unsigned int v65 = BYTE7(v151[0]) & 0xF;
      double v113 = v33;
      double v114 = v31;
      double v111 = v34;
      double v112 = v32;
      double v109 = v36;
      double v110 = v35;
      float v122 = v46;
      float v123 = v45;
      float v121 = v47;
      int8x8_t v119 = v48;
      int8x8_t v120 = v44;
      float v118 = v54;
      if (v65)
      {
        BOOL v67 = v65 == 1 || v65 == 7;
        float v117 = (float)v67;
        if (v65 == 4)
        {
          BOOL v68 = 1;
          goto LABEL_50;
        }
      }

      else
      {
        float v117 = 1.0;
      }

      BOOL v68 = v65 == 5 || v65 == 3;
LABEL_50:
      LOBYTE(v9) = v151[0];
      LOBYTE(v6) = BYTE2(v151[0]);
      if (v61 >= 0.0) {
        float v70 = 0.0;
      }
      else {
        float v70 = -v61;
      }
      float v71 = -v62;
      if (v62 >= 0.0) {
        float v71 = 0.0;
      }
      float v115 = v71;
      float v116 = v70;
      LOBYTE(v7) = BYTE5(v151[0]);
      LOBYTE(v_Block_object_dispose(va, 8) = BYTE4(v151[0]);
      [v29 dispatchHomeButtonEventWithValue:HIWORD(v64) & 1 timestamp:a3];
      [v29 dispatchMenuButtonEventWithValue:(*(unsigned __int16 *)((char *)v151 + 7) >> 13) & 1 timestamp:a3];
      [v29 dispatchOptionsButtonEventWithValue:(*(unsigned __int16 *)((char *)v151 + 7) >> 12) & 1 timestamp:a3];
      int8x8_t v72 = (int8x8_t)vdup_n_s32(v64);
      *(float *)&unsigned int v73 = ((double)v9 + -127.5) / 127.5;
      *(float *)&unsigned int v74 = ((double)v6 + -127.5) / 127.5;
      v75.i32[0] = 0;
      v75.i32[1] = v73;
      v76.i32[0] = 0;
      int8x8_t v77 = (int8x8_t)vcgt_f32(v75, (float32x2_t)v73);
      v75.f32[0] = -*(float *)&v73;
      v75.i32[1] = v73;
      int8x8_t v78 = vand_s8((int8x8_t)v75, v77);
      v76.i32[1] = v74;
      int8x8_t v79 = (int8x8_t)vcgt_f32(v76, (float32x2_t)v74);
      v76.f32[0] = -*(float *)&v74;
      v76.i32[1] = v74;
      *(void *)&__int128 buf = 0LL;
      *((float *)&buf + 2) = v117;
      *((float *)&buf + 3) = (float)v68;
      float32x2_t v130 = vcvt_f32_u32((uint32x2_t)vand_s8( vorr_s8( (int8x8_t)vceq_s32(vdup_n_s32(v65), (int32x2_t)0x200000006LL),  (int8x8_t)vceq_s32(vdup_n_s32(v64 & 0xD), (int32x2_t)0x100000005LL)),  (int8x8_t)0x100000001LL));
      float32x2_t v131 = vcvt_f32_u32((uint32x2_t)(*(void *)&vshl_u32( (uint32x2_t)vand_s8(v72, (int8x8_t)0xFF000000FFLL),  (uint32x2_t)0xFFFFFFFAFFFFFFFBLL) & 0xFFFFFFF1FFFFFFF1LL));
      *(float *)&uint64_t v132 = (float)((v64 >> 4) & 1);
      *((float *)&v132 + 1) = (float)((v64 >> 7) & 1);
      float32x2_t v133 = vcvt_f32_u32((uint32x2_t)vand_s8( (int8x8_t)vshl_u32((uint32x2_t)v72, (uint32x2_t)0xFFFFFFF7FFFFFFF8LL),  (int8x8_t)0x100000001LL));
      unint64_t v134 = __PAIR64__(LODWORD(v116), COERCE_UNSIGNED_INT(fmaxf(v61, 0.0)));
      int8x8_t v135 = v78;
      *(void *)&__int128 v136 = __PAIR64__(LODWORD(v115), COERCE_UNSIGNED_INT(fmaxf(v62, 0.0)));
      *((int8x8_t *)&v136 + 1) = vand_s8((int8x8_t)v76, v79);
      *(float *)&__int128 v137 = (float)v8 / 255.0;
      *((float *)&v137 + 1) = (float)v7 / 255.0;
      *((float32x2_t *)&v137 + 1) = vcvt_f32_u32((uint32x2_t)vand_s8( (int8x8_t)vshl_u32( (uint32x2_t)v72,  (uint32x2_t)0xFFFFFFF1FFFFFFF2LL),  (int8x8_t)0x100000001LL));
      uint64_t v138 = 0LL;
      int v139 = 0;
      float v140 = v122;
      float v141 = v121;
      int8x8_t v142 = v119;
      float v143 = v123;
      float v144 = v118;
      int8x8_t v145 = v120;
      float v146 = (float)((v63 >> 1) & 1);
      __int128 v147 = 0u;
      __int128 v148 = 0u;
      __int128 v149 = 0u;
      uint64_t v150 = 0LL;
      [v29 dispatchGameControllerExtendedEventWithState:&buf timestamp:a3];
      if (*((_BYTE *)v29 + 721))
      {
        LOBYTE(buf) = v37;
        *(_DWORD *)((char *)&buf + 1) = 0;
        DWORD1(buf) = 0;
        *((double *)&buf + 1) = v114;
        float32x2_t v130 = *(float32x2_t *)&v112;
        float32x2_t v131 = *(float32x2_t *)&v113;
        LOBYTE(v132) = v37;
        *(_DWORD *)((char *)&v132 + 1) = 0;
        HIDWORD(v132) = 0;
        float32x2_t v133 = *(float32x2_t *)&v111;
        unint64_t v134 = *(void *)&v110;
        int8x8_t v135 = *(int8x8_t *)&v109;
        __int128 v136 = 0u;
        __int128 v137 = 0u;
        uint64_t v138 = 0LL;
        [v29 dispatchMotionEventWithState:&buf timestamp:a3];
      }

      unsigned int v80 = HIBYTE(v152);
      int v81 = HIBYTE(v152) & 0xF;
      unsigned int v82 = BYTE9(v152);
      unsigned int v83 = BYTE10(v152);
      int v84 = *((unsigned __int8 *)v29 + 901);
      BOOL v85 = v81 != v84;
      if (v81 != v84)
      {
        id v86 = sub_1934();
        v87 = (os_log_s *)objc_claimAutoreleasedReturnValue(v86);
        if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 67109120;
          DWORD1(buf) = v81;
          _os_log_impl(&dword_0, v87, OS_LOG_TYPE_INFO, "(Right Trigger) Working Mode = %d", (uint8_t *)&buf, 8u);
        }

        *((_BYTE *)v29 + 901) = v81;
      }

      if ((v82 & 0xF) != *((_BYTE *)v29 + 902))
      {
        id v88 = sub_1934();
        v89 = (os_log_s *)objc_claimAutoreleasedReturnValue(v88);
        if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 67109120;
          DWORD1(buf) = v82 & 0xF;
          _os_log_impl(&dword_0, v89, OS_LOG_TYPE_INFO, "(Right Trigger) Arm Position = %d", (uint8_t *)&buf, 8u);
        }

        *((_BYTE *)v29 + 902) = v82 & 0xF;
        BOOL v85 = 1;
      }

      unsigned int v90 = v82 >> 4;
      BOOL v92 = v81 == 1 || v81 == 4;
      int v93 = *((unsigned __int8 *)v29 + 903);
      if (v90 != v93 || v81 == 4 || v81 == 1)
      {
        if (v90 != 1) {
          BOOL v92 = 0;
        }
        if (v92 && BYTE5(v151[0]) == 0) {
          unsigned int v94 = 0;
        }
        else {
          unsigned int v94 = v82 >> 4;
        }
        if (v93 != v94)
        {
          id v95 = sub_1934();
          v96 = (os_log_s *)objc_claimAutoreleasedReturnValue(v95);
          if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
          {
            LODWORD(buf) = 67109120;
            DWORD1(buf) = v94;
            _os_log_impl( &dword_0,  v96,  OS_LOG_TYPE_INFO,  "(Right Trigger) AD-T Control Status = %d",  (uint8_t *)&buf,  8u);
          }

          BOOL v85 = 1;
        }

        *((_BYTE *)v29 + 903) = v94;
      }

      unsigned int v97 = v80 >> 4;
      if (v80 >> 4 != *((unsigned __int8 *)v29 + 869))
      {
        id v98 = sub_1934();
        v99 = (os_log_s *)objc_claimAutoreleasedReturnValue(v98);
        if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 67109120;
          DWORD1(buf) = v80 >> 4;
          _os_log_impl(&dword_0, v99, OS_LOG_TYPE_INFO, "(Left Trigger) Working Mode = %d", (uint8_t *)&buf, 8u);
        }

        *((_BYTE *)v29 + 869) = v97;
        BOOL v85 = 1;
      }

      uint64_t v100 = v83 & 0xF;
      if ((_DWORD)v100 != *((unsigned __int8 *)v29 + 870))
      {
        id v101 = sub_1934();
        v102 = (os_log_s *)objc_claimAutoreleasedReturnValue(v101);
        if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 67109120;
          DWORD1(buf) = v83 & 0xF;
          _os_log_impl(&dword_0, v102, OS_LOG_TYPE_INFO, "(Left Trigger) Arm Position = %d", (uint8_t *)&buf, 8u);
        }

        *((_BYTE *)v29 + 870) = v83 & 0xF;
        BOOL v85 = 1;
      }

      uint64_t v103 = v83 >> 4;
      BOOL v105 = v97 == 1 || v97 == 4;
      int v106 = *((unsigned __int8 *)v29 + 871);
      if ((_DWORD)v103 != v106 || v97 == 4 || v97 == 1)
      {
        if ((_DWORD)v103 != 1) {
          BOOL v105 = 0;
        }
        if (v105 && BYTE4(v151[0]) == 0) {
          uint64_t v103 = 0LL;
        }
        else {
          uint64_t v103 = v103;
        }
        if (v106 == (_DWORD)v103)
        {
          if (!v85)
          {
LABEL_113:
            objc_destroyWeak(&v128);

            goto LABEL_114;
          }

          uint64_t v103 = *((unsigned __int8 *)v29 + 871);
        }

        else
        {
          id v107 = sub_1934();
          v108 = (os_log_s *)objc_claimAutoreleasedReturnValue(v107);
          if (os_log_type_enabled(v108, OS_LOG_TYPE_INFO))
          {
            LODWORD(buf) = 67109120;
            DWORD1(buf) = v103;
            _os_log_impl( &dword_0,  v108,  OS_LOG_TYPE_INFO,  "(Left Trigger) AD-T Control Status = %d",  (uint8_t *)&buf,  8u);
          }

          *((_BYTE *)v29 + 871) = v103;
          uint64_t v100 = *((unsigned __int8 *)v29 + 870);
        }
      }

      else if (!v85)
      {
        goto LABEL_113;
      }

      [v29[126] updateAdaptiveTriggerStatusWithLeftMode:*((unsigned __int8 *)v29 + 848) leftStatus:v103 leftArmPosition:v100 rightMode:*((unsigned __int8 *)v29 + 880) rightStatus:*((unsigned __int8 *)v29 + 903) rightArmPosition:*((unsigned __int8 *)v29 + 902)];
      goto LABEL_113;
    }

    if (a5 == 1)
    {
      id v19 = v125;
      id v20 = (char *)[v19 bytes];
      if (-[dispatch_once_t isBluetoothClassic](v17, "isBluetoothClassic")
        && [v19 length] == (char *)&dword_8 + 2)
      {
        BYTE8(buf) = 0;
        *(void *)&__int128 buf = 0LL;
        uint64_t v21 = v20 + 1;
        id v22 = [v19 length];
        else {
          uint64_t v23 = (uint64_t)v22;
        }
        __memcpy_chk(&buf, v21, v23, 9LL);
        LODWORD(v151[0]) = buf;
        BYTE9(v151[0]) = BYTE6(buf) & 3;
        *(_WORD *)((char *)v151 + 7) = WORD2(buf) & 0xF3FF;
        WORD2(v151[0]) = *(_WORD *)((char *)&buf + 7);
        goto LABEL_26;
      }

      if ((-[dispatch_once_t isBluetoothClassic](v17, "isBluetoothClassic") & 1) == 0
        && [v19 length] == &stru_20.vmsize)
      {
        v38 = v20 + 1;
        id v39 = [v19 length];
        else {
          uint64_t v40 = (uint64_t)v39;
        }
        __memcpy_chk(v151, v38, v40, 76LL);
LABEL_26:
        if (-[dispatch_once_t isBluetoothClassic](v17, "isBluetoothClassic")
          && [v19 length] == (char *)&dword_8 + 2)
        {
          v153[2] = v153[2] & 0xFFF0 | 0xA;
        }

        goto LABEL_16;
      }
    }
  }

LABEL_114:
}

void sub_927C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, id *location)
{
}

void sub_92B8(uint64_t a1)
{
  uint64_t v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dispatchQueue]);
  if (v2)
  {
    dispatch_time_t v3 = dispatch_time(0LL, 2500000000LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_9380;
    block[3] = &unk_145A0;
    objc_copyWeak(&v5, (id *)(a1 + 40));
    dispatch_after(v3, v2, block);
    objc_destroyWeak(&v5);
  }

  else
  {
    *(_BYTE *)(*(void *)(a1 + 32) + 708LL) = 1;
  }
}

void sub_9380(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    dispatch_time_t v3 = objc_loadWeakRetained(v1);
    v3[708] = 1;
    [v3 sendBatteryReport];
  }

void sub_9B54(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = sub_1934();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_C05C();
    }
  }

void sub_9BBC(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = sub_1934();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_C0BC();
    }
  }

id sub_A464(uint64_t a1)
{
  id v2 = sub_1934();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = *(unsigned __int8 *)(a1 + 40);
    int v5 = *(unsigned __int8 *)(a1 + 41);
    int v6 = *(unsigned __int8 *)(a1 + 42);
    int v7 = *(unsigned __int8 *)(a1 + 43);
    int v8 = *(unsigned __int8 *)(a1 + 44);
    v12[0] = 67110144;
    v12[1] = v4;
    __int16 v13 = 1024;
    int v14 = v5;
    __int16 v15 = 1024;
    int v16 = v6;
    __int16 v17 = 1024;
    int v18 = v7;
    __int16 v19 = 1024;
    int v20 = v8;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "setPlayerLights: %d%d%d%d%d", (uint8_t *)v12, 0x20u);
  }

  uint64_t v9 = *(void *)(a1 + 32) + 1024LL;
  char v10 = *(_BYTE *)(a1 + 44);
  *(_DWORD *)uint64_t v9 = *(_DWORD *)(a1 + 40);
  *(_BYTE *)(v9 + 4) = v10;
  id result = [*(id *)(a1 + 32) isHapticsActive];
  return result;
}

id sub_ACF0(uint64_t a1)
{
  id v2 = sub_1934();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    double v4 = *(float *)(a1 + 40);
    double v5 = *(float *)(a1 + 44);
    double v6 = *(float *)(a1 + 48);
    int v9 = 134218496;
    double v10 = v4;
    __int16 v11 = 2048;
    double v12 = v5;
    __int16 v13 = 2048;
    double v14 = v6;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "updateLightWithRed:%f green:%f blue:%f", (uint8_t *)&v9, 0x20u);
  }

  int v7 = *(_BYTE **)(a1 + 32);
  if (!v7[1029])
  {
    [v7 setExtendedSupportEnabled:1];
    int v7 = *(_BYTE **)(a1 + 32);
  }

  v7[722] = (int)(float)(*(float *)(a1 + 40) * 255.0);
  *(_BYTE *)(*(void *)(a1 + 32) + 723LL) = (int)(float)(*(float *)(a1 + 44) * 255.0);
  *(_BYTE *)(*(void *)(a1 + 32) + 724LL) = (int)(float)(*(float *)(a1 + 48) * 255.0);
  id result = [*(id *)(a1 + 32) isHapticsActive];
  return result;
}

void sub_B0A8(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 40))
  {
    id v2 = *(_BYTE **)(a1 + 32);
    if (!v2[1029]) {
      [v2 setExtendedSupportEnabled:1];
    }
  }

  id v3 = sub_1934();
  double v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = *(unsigned __int8 *)(a1 + 40);
    v6[0] = 67109120;
    v6[1] = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "updateSensorsEnabled %d", (uint8_t *)v6, 8u);
  }

  *(_BYTE *)(*(void *)(a1 + 32) + 721LL) = *(_BYTE *)(a1 + 40);
}

id sub_B3CC(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "setAdaptiveTriggerWithMode:enabledPositions:resistiveStrengths:frequency:forIndex:",  *(void *)(a1 + 40),  *(unsigned __int16 *)(a1 + 52),  *(void *)(a1 + 54),  *(unsigned __int16 *)(a1 + 62),  0,  *(unsigned int *)(a1 + 48));
}

id sub_B604(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "setAdaptiveTriggerWithMode:enabledPositions:resistiveStrengths:frequency:forIndex:",  *(void *)(a1 + 40),  *(unsigned __int16 *)(a1 + 56),  *(void *)(a1 + 58),  *(unsigned __int16 *)(a1 + 66),  (int)*(float *)(a1 + 48),  *(unsigned int *)(a1 + 52));
}

id sub_B830(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "setAdaptiveTriggerWithMode:enabledPositions:resistiveStrengths:frequency:forIndex:",  *(void *)(a1 + 40),  *(unsigned __int16 *)(a1 + 56),  *(void *)(a1 + 58),  *(unsigned __int16 *)(a1 + 66),  (int)*(float *)(a1 + 48),  *(unsigned int *)(a1 + 52));
}

id sub_B9F0(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "setAdaptiveTriggerWithMode:enabledPositions:resistiveStrengths:frequency:forIndex:",  *(void *)(a1 + 40),  *(unsigned __int16 *)(a1 + 52),  *(void *)(a1 + 54),  *(unsigned __int16 *)(a1 + 62),  0,  *(unsigned int *)(a1 + 48));
}

void sub_BA8C(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 40);
  if (v2)
  {
    if (v2 != 1)
    {
      id v3 = *(char **)(a1 + 32);
      goto LABEL_10;
    }

    id v3 = *(char **)(a1 + 32);
    uint64_t v4 = 872LL;
  }

  else
  {
    id v3 = *(char **)(a1 + 32);
    uint64_t v4 = 840LL;
  }

  if (*(void *)&v3[v4 + 8])
  {
LABEL_10:
    [v3 setAdaptiveTriggerWithMode:0 enabledPositions:0 resistiveStrengths:0 frequency:0 forIndex:0];
    return;
  }

  id v5 = sub_1934();
  double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = *(_DWORD *)(a1 + 40);
    v8[0] = 67109120;
    v8[1] = v7;
    _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_INFO,  "Received request to turn off adaptive trigger at index %d, but it is already off. Ignoring.",  (uint8_t *)v8,  8u);
  }
}

void sub_BC74( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_BC84( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

NSXPCInterface *sub_BCA8()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCMotionServiceClientInterface);
}

NSXPCInterface *sub_BCBC()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCMotionServiceServerInterface);
}

NSXPCInterface *sub_BCD0()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCLightServiceClientInterface);
}

NSXPCInterface *sub_BCE4()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCLightServiceServerInterface);
}

NSXPCInterface *sub_BCF8()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCBatteryServiceClientInterface);
}

NSXPCInterface *sub_BD0C()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCBatteryServiceServerInterface);
}

void sub_BD20( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_BD50(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "setProperty: %@ forKey: %@", (uint8_t *)&v3, 0x16u);
}

void sub_BDD4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_BE04( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_BE34( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_BE98()
{
}

void sub_BEF8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_BF5C()
{
}

void sub_BFBC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Unable to retreive pairing info from DualSense.", v1, 2u);
  sub_69C8();
}

void sub_BFF8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_C05C()
{
}

void sub_C0BC()
{
}

id objc_msgSend_updateAdaptiveTriggerStatusWithLeftMode_leftStatus_leftArmPosition_rightMode_rightStatus_rightArmPosition_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "updateAdaptiveTriggerStatusWithLeftMode:leftStatus:leftArmPosition:rightMode:rightStatus:rightArmPosition:");
}

id objc_msgSend_valueForNoteParam_inParameters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForNoteParam:inParameters:");
}