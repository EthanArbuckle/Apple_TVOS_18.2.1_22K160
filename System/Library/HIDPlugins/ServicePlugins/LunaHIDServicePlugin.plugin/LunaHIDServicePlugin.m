uint64_t sub_4BB8()
{
  if (qword_16E10 != -1) {
    dispatch_once(&qword_16E10, &stru_103E0);
  }
  return byte_16E08;
}

void sub_4BF8(id a1)
{
  byte_16E08 = os_variant_has_internal_diagnostics("com.apple.gamecontroller");
}

id sub_4C1C()
{
  if (qword_16E20 != -1) {
    dispatch_once(&qword_16E20, &stru_10400);
  }
  return (id)qword_16E18;
}

void sub_4C5C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController", "default");
  v2 = (void *)qword_16E18;
  qword_16E18 = (uint64_t)v1;
}

id sub_4C8C()
{
  if (qword_16E30 != -1) {
    dispatch_once(&qword_16E30, &stru_10420);
  }
  return (id)qword_16E28;
}

void sub_4CCC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController", "monitor");
  v2 = (void *)qword_16E28;
  qword_16E28 = (uint64_t)v1;
}

id sub_4CFC()
{
  if (qword_16E40 != -1) {
    dispatch_once(&qword_16E40, &stru_10440);
  }
  return (id)qword_16E38;
}

void sub_4D3C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController", "init");
  v2 = (void *)qword_16E38;
  qword_16E38 = (uint64_t)v1;
}

id sub_4D6C()
{
  if (qword_16E50 != -1) {
    dispatch_once(&qword_16E50, &stru_10460);
  }
  return (id)qword_16E48;
}

void sub_4DAC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController", "analytics");
  v2 = (void *)qword_16E48;
  qword_16E48 = (uint64_t)v1;
}

id sub_4DDC()
{
  if (qword_16E60 != -1) {
    dispatch_once(&qword_16E60, &stru_10480);
  }
  return (id)qword_16E58;
}

void sub_4E1C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController.Daemon", "default");
  v2 = (void *)qword_16E58;
  qword_16E58 = (uint64_t)v1;
}

void sub_4E4C(char *category)
{
  os_log_t v1 = os_log_create("com.apple.GameController.HID", category);
  v2 = (void *)qword_16E68;
  qword_16E68 = (uint64_t)v1;
}

id sub_4E78()
{
  if (qword_16E70 != -1) {
    dispatch_once(&qword_16E70, &stru_104A0);
  }
  return (id)qword_16E68;
}

void sub_4EB8(id a1)
{
  if (!qword_16E68) {
    objc_storeStrong((id *)&qword_16E68, &_os_log_default);
  }
}

id sub_4EDC()
{
  if (qword_16E80 != -1) {
    dispatch_once(&qword_16E80, &stru_104C0);
  }
  return (id)qword_16E78;
}

void sub_4F1C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController.Settings", "default");
  v2 = (void *)qword_16E78;
  qword_16E78 = (uint64_t)v1;
}

id sub_4F4C()
{
  if (qword_16E90 != -1) {
    dispatch_once(&qword_16E90, &stru_104E0);
  }
  return (id)qword_16E88;
}

void sub_4F8C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController.Haptics", "default");
  v2 = (void *)qword_16E88;
  qword_16E88 = (uint64_t)v1;
}

id sub_4FBC()
{
  if (qword_16EA0 != -1) {
    dispatch_once(&qword_16EA0, &stru_10500);
  }
  return (id)qword_16E98;
}

void sub_4FFC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.gamecontroller", "Signposts");
  v2 = (void *)qword_16E98;
  qword_16E98 = (uint64_t)v1;
}

id sub_502C()
{
  if (qword_16EB0 != -1) {
    dispatch_once(&qword_16EB0, &stru_10520);
  }
  return (id)qword_16EA8;
}

void sub_506C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.runtime-issues", "GameController");
  v2 = (void *)qword_16EA8;
  qword_16EA8 = (uint64_t)v1;
}

NSXPCInterface *sub_509C()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCGameIntentServiceClientInterface);
}

NSXPCInterface *sub_50B0()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCGameIntentServiceServerInterface);
}

id sub_50C4()
{
  return +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &unk_F590, 37LL);
}

LABEL_13:
  return (pair<BOOL, float>)(v12 | v11);
}

void sub_5234(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_52CC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
}

LABEL_14:
  return v6;
}

void sub_5430(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5504(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5680(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5738( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

NSXPCInterface *sub_574C()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCNintendoJoyConFusionGestureServiceClientInterface);
}

NSXPCInterface *sub_5760()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCNintendoJoyConFusionGestureServiceServerInterface);
}

id sub_5BE8(uint64_t a1, int a2)
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](&OBJC_CLASS___NSMutableString, "stringWithCapacity:", 2 * a2));
  if (a2 >= 1)
  {
    unint64_t v5 = a2 + 1LL;
    do
    {
      if ((_DWORD)v5 == 2) {
        v6 = &stru_10888;
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

uint64_t sub_5CDC()
{
  if (qword_16EB8 != -1) {
    dispatch_once(&qword_16EB8, &stru_10540);
  }
  return byte_16EC0;
}

void sub_5D1C(id a1)
{
  os_log_t v1 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.GameController");
  byte_16EC0 = -[NSUserDefaults BOOLForKey:](v1, "BOOLForKey:", @"GCPartnersEnable");
  id v2 = sub_4E78();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = byte_16EC0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Partners mode enabled? %d", (uint8_t *)v4, 8u);
  }
}

void sub_5DF8()
{
}

void sub_5FDC(_Unwind_Exception *a1)
{
}

void sub_6004(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v10 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v12 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v13 = sub_89F4((uint64_t)WeakRetained);
    kdebug_trace(835452996LL, v13, a3, a4, a5);
    id v14 = v10;
    id v15 = [v14 bytes];
    if (a5 == 2)
    {
      LOWORD(v50) = 0;
      id v43 = [v14 length];
      else {
        uint64_t v44 = (uint64_t)v43;
      }
      __memcpy_chk(&v50, v15, v44, 2LL);
      [v12 dispatchHomeButtonEventWithValue:BYTE1(v50) & 1 timestamp:a3];
    }

    else if (a5 == 1)
    {
      memset(v75, 0, 17);
      id v16 = [v14 length];
      else {
        uint64_t v17 = (uint64_t)v16;
      }
      __memcpy_chk(v75, v15, v17, 17LL);
      v20.i32[0] = *(unsigned __int16 *)((char *)v75 + 1);
      v20.i32[1] = *(unsigned __int16 *)((char *)v75 + 3);
      float32x2_t v21 = (float32x2_t)vdup_n_s32(0x477E0000u);
      int32x2_t v22 = (int32x2_t)vmul_f32( vadd_f32(vdiv_f32(vcvt_f32_u32(v20), v21), (float32x2_t)0xBF000000BF000000LL),  (float32x2_t)0xC000000040000000LL);
      v23.i32[0] = *(unsigned __int16 *)((char *)v75 + 5);
      v23.i32[1] = *(unsigned __int16 *)((char *)v75 + 7);
      float32x2_t v24 = (float32x2_t)vrev64_s32(v22);
      int32x2_t v25 = (int32x2_t)vmul_f32( vadd_f32(vdiv_f32(vcvt_f32_u32(v23), v21), (float32x2_t)0xBF000000BF000000LL),  (float32x2_t)0xC000000040000000LL);
      float32x2_t v26 = (float32x2_t)vrev64_s32(v25);
      unint64_t v27 = *(void *)((char *)&v75[1] + 1);
      uint64_t v28 = HIDWORD(*(void *)((char *)&v75[1] + 1)) & 0xFLL;
      float v29 = 1.0;
      float v30 = 1.0;
      if ((_DWORD)v28 != 1 && (_DWORD)v28 != 8)
      {
        if ((_DWORD)v28 == 2) {
          float v30 = 1.0;
        }
        else {
          float v30 = 0.0;
        }
      }

      unsigned int v31 = BYTE5(v75[1]) & 0xE;
      if ((_DWORD)v28 == 4) {
        float v32 = 1.0;
      }
      else {
        float v32 = 0.0;
      }
      if (v31 != 2) {
        float v29 = v32;
      }
      float v49 = v29;
      int8x8_t v48 = (int8x8_t)vceq_s32(vdup_n_s32(v28), (int32x2_t)0x800000006LL);
      float v33 = fmaxf(*(float *)&v22.i32[1], 0.0);
      int8x8_t v34 = (int8x8_t)vcltz_f32(v24);
      int8x8_t v35 = (int8x8_t)vneg_f32(v24);
      int8x8_t v47 = (int8x8_t)vcltz_f32(v26);
      int8x8_t v36 = (int8x8_t)vneg_f32(v26);
      float v37 = fmaxf(*(float *)v25.i32, 0.0);
      objc_msgSend( v12,  "dispatchMenuButtonEventWithValue:timestamp:",  (*(void *)((char *)&v75[1] + 1) >> 51) & 1,  a3,  *(void *)&v22,  v18,  *(void *)&v25,  v19);
      [v12 dispatchOptionsButtonEventWithValue:HIBYTE(*(void *)((char *)&v75[1] + 1)) & 1 timestamp:a3];
      uint64_t v50 = 0LL;
      float v51 = v30;
      __asm { FMOV            V1.2S, #1.0 }

      int8x8_t v52 = vbsl_s8((int8x8_t)vceq_s32(vdup_n_s32(v31), (int32x2_t)0x600000004LL), _D1, vand_s8(v48, _D1));
      float v53 = v49;
      float v54 = (float)((v27 >> 40) & 1);
      float v55 = (float)((v27 >> 41) & 1);
      float v56 = (float)((v27 >> 43) & 1);
      float v57 = (float)((v27 >> 44) & 1);
      float v58 = (float)((v27 >> 46) & 1);
      float v59 = (float)((v27 >> 47) & 1);
      float v60 = v33;
      int8x8_t v61 = vand_s8(v35, v34);
      float32x2_t v62 = vmaxnm_f32((float32x2_t)__PAIR64__(v46, v45), 0LL);
      int8x8_t v63 = vand_s8(v36, v47);
      float v64 = v37;
      float32x2_t v65 = vdiv_f32( vcvt_f32_s32((int32x2_t)vand_s8((int8x8_t)__PAIR64__(WORD1(v27), v27), (int8x8_t)0x300000003LL)),  (float32x2_t)vdup_n_s32(0x447FC000u));
      float v66 = (float)((v27 >> 53) & 1);
      float v67 = (float)((v27 >> 54) & 1);
      __int128 v68 = 0u;
      __int128 v69 = 0u;
      __int128 v70 = 0u;
      __int128 v71 = 0u;
      __int128 v72 = 0u;
      __int128 v73 = 0u;
      uint64_t v74 = 0LL;
      [v12 dispatchGameControllerExtendedEventWithState:&v50 timestamp:a3];
    }
  }
}

NSXPCInterface *sub_6388()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCAdaptiveTriggersServiceClientInterface);
}

NSXPCInterface *sub_639C()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCAdaptiveTriggersServiceServerInterface);
}

id sub_63B0()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL____GCDriverClientInterface));
  os_log_t v1 = sub_574C();
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  [v0 setInterface:v2 forSelector:"connectToNintendoJoyConFusionGestureServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  v3 = sub_5760();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  [v0 setInterface:v4 forSelector:"connectToNintendoJoyConFusionGestureServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  unint64_t v5 = sub_A4CC();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v0 setInterface:v6 forSelector:"connectToLightServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  v7 = sub_A4E0();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v0 setInterface:v8 forSelector:"connectToLightServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  v9 = sub_6388();
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  [v0 setInterface:v10 forSelector:"connectToAdaptiveTriggersServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  v11 = sub_639C();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  [v0 setInterface:v12 forSelector:"connectToAdaptiveTriggersServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  uint64_t v13 = sub_A4A4();
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  [v0 setInterface:v14 forSelector:"connectToMotionServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  id v15 = sub_A4B8();
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  [v0 setInterface:v16 forSelector:"connectToMotionServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  uint64_t v17 = sub_A4F4();
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  [v0 setInterface:v18 forSelector:"connectToBatteryServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  uint64_t v19 = sub_A508();
  uint32x2_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  [v0 setInterface:v20 forSelector:"connectToBatteryServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  float32x2_t v21 = sub_509C();
  int32x2_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  [v0 setInterface:v22 forSelector:"connectToGameIntentServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  uint32x2_t v23 = sub_50B0();
  float32x2_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  [v0 setInterface:v24 forSelector:"connectToGameIntentServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  uint64_t v25 = GCGenericDeviceDriverConfigurationServiceClientInterface();
  float32x2_t v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  [v0 setInterface:v26 forSelector:"connectToGenericDeviceDriverConfigurationServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  uint64_t v27 = GCGenericDeviceDriverConfigurationServiceServerInterface();
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  [v0 setInterface:v28 forSelector:"connectToGenericDeviceDriverConfigurationServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  return v0;
}

NSXPCInterface *sub_6658()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL____GCDriverServerInterface);
}

dispatch_source_s *sub_666C(uint64_t a1, uint64_t a2, dispatch_queue_s *a3, void *a4)
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

void sub_68A8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_68D8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = sub_4E78();
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

void sub_696C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = sub_4E78();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v5 = 0;
    _os_log_impl( &dword_0,  v3,  OS_LOG_TYPE_DEFAULT,  "Connection to com.apple.GameController.gamecontrollerd.driver interrupted.  Attempting to re-establish.",  v5,  2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained remoteObjectProxy]);
  [v4 driverCheckIn];
}

void sub_6E50(uint64_t a1, int a2, int a3, uint64_t a4)
{
  if (a3 | a2)
  {
    switch(a2)
    {
      case 3:
        id v11 = sub_4E78();
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
        id v12 = sub_4E78();
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
        id v5 = sub_4E78();
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

  id v9 = sub_4E78();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
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

void sub_6FF4(uint64_t a1, void *a2)
{
  id v3 = sub_4E78();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_A51C(v4, v5, v6, v7, v8, v9, v10, v11);
  }

  if (a2) {
    [a2 disconnect];
  }
}

void sub_71CC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_71E4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_71F4(uint64_t a1)
{
}

void sub_71FC(uint64_t a1)
{
  id v2 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  dispatch_queue_get_label(*(dispatch_queue_t *)(a1 + 32)),  4LL);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = sub_4E78();
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

BOOL sub_75DC(id a1, NSDictionary *a2, NSDictionary *a3)
{
  id v3 = a2;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", @"DeviceUsagePage"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", @"DeviceUsage"));
    char v8 = (![v6 isEqual:&off_10E20]
       || ([v7 isEqual:&off_10E38] & 1) == 0)
      && (![v6 isEqual:&off_10E20]
       || ([v7 isEqual:&off_10E50] & 1) == 0)
  }

  else
  {
    char v8 = 1;
  }

  return v8;
}

void sub_7B1C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_7B40(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = sub_4E78();
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

void sub_7D0C(uint64_t a1)
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

      *(void *)int32x2_t v22 = 0LL;
      id v15 = BTDeviceFromAddress(self->_session, v21, v22);
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = sub_4E78();
        uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_17;
        }
        *(_DWORD *)buf = 67109120;
        float32x2_t v26 = v16;
        uint64_t v10 = "GCHIDLog::disconnect: unable to get BTDevice; error code = %d";
LABEL_15:
        uint64_t v11 = buf;
        id v12 = v9;
        int v13 = 8;
        goto LABEL_16;
      }

      uint64_t v18 = BTDeviceDisconnect(*(void *)v22);
      uint64_t v19 = sub_4E78();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      uint32x2_t v20 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (v18)
      {
        if (!v20) {
          goto LABEL_17;
        }
        *(_DWORD *)buf = 67109120;
        float32x2_t v26 = v18;
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
      uint64_t v14 = sub_4E78();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      *(_WORD *)int32x2_t v22 = 0;
      uint64_t v10 = "GCHIDLog::disconnect: unable to get BTDevice; no valid BTSession";
      uint64_t v11 = v22;
    }

    id v12 = v9;
    int v13 = 2;
    goto LABEL_16;
  }

void sub_8694(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(dispatch_queue_s **)(v2 + 560);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_8720;
  v8[3] = &unk_10620;
  v8[4] = v2;
  uint64_t v4 = sub_666C(0x6FC23AC00uLL, 0x3B9ACA00uLL, v3, v8);
  uint64_t v5 = objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v5;
}

id sub_8720(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateIdleState];
}

void sub_88FC(id a1)
{
}

void sub_8958(uint64_t a1, void *a2, int a3)
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

uint64_t sub_89F4(uint64_t result)
{
  if (result) {
    return *(void *)(result + 656);
  }
  return result;
}

id sub_8B2C(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchEvent:*(void *)(a1 + 40)];
}

id sub_8C4C(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchIdleEvent:*(void *)(a1 + 40)];
}

void sub_9CFC(uint64_t a1)
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
        v8[2] = sub_9DD8;
        v8[3] = &unk_10590;
        objc_copyWeak(&v9, v1);
        id v5 = sub_666C(0xF4240uLL, 0x186A0uLL, tv_sec, v8);
        uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);
        tv_nsec = (void *)v3[33].tv_nsec;
        v3[33].tv_nsec = v6;

        objc_destroyWeak(&v9);
      }
    }
  }
}

void sub_9DD8(uint64_t a1)
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
      id v3 = sub_4E78();
      uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
      BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
      if ((v2 & 1) != 0)
      {
        if (v5) {
          sub_A5D0(v4, v6, v7, v8, v9, v10, v11, v12);
        }

        HIDWORD(WeakRetained[30].tv_nsec) = 0;
        -[timespec dispatchHapticEvent](WeakRetained, "dispatchHapticEvent");
      }

      else
      {
        if (v5) {
          sub_A600(v4, v6, v7, v8, v9, v10, v11, v12);
        }

        -[timespec stopHaptics](WeakRetained, "stopHaptics");
      }
    }
  }
}

void sub_A48C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

NSXPCInterface *sub_A4A4()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCMotionServiceClientInterface);
}

NSXPCInterface *sub_A4B8()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCMotionServiceServerInterface);
}

NSXPCInterface *sub_A4CC()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCLightServiceClientInterface);
}

NSXPCInterface *sub_A4E0()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCLightServiceServerInterface);
}

NSXPCInterface *sub_A4F4()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCBatteryServiceClientInterface);
}

NSXPCInterface *sub_A508()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCBatteryServiceServerInterface);
}

void sub_A51C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_A54C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "setProperty: %@ forKey: %@", (uint8_t *)&v3, 0x16u);
}

void sub_A5D0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_A600( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

id objc_msgSend_valueForNoteParam_inParameters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForNoteParam:inParameters:");
}