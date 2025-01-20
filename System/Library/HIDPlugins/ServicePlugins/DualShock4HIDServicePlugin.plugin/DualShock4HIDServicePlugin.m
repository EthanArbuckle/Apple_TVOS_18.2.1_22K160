NSXPCInterface *sub_407C()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCNintendoJoyConFusionGestureServiceClientInterface);
}

NSXPCInterface *sub_4090()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCNintendoJoyConFusionGestureServiceServerInterface);
}

NSXPCInterface *sub_40A4()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCGameIntentServiceClientInterface);
}

NSXPCInterface *sub_40B8()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCGameIntentServiceServerInterface);
}

uint64_t sub_40CC()
{
  if (qword_1B3A8 != -1) {
    dispatch_once(&qword_1B3A8, &stru_14408);
  }
  return byte_1B3A0;
}

void sub_410C(id a1)
{
  byte_1B3A0 = os_variant_has_internal_diagnostics("com.apple.gamecontroller");
}

id sub_4130()
{
  if (qword_1B3B8 != -1) {
    dispatch_once(&qword_1B3B8, &stru_14428);
  }
  return (id)qword_1B3B0;
}

void sub_4170(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController", "default");
  v2 = (void *)qword_1B3B0;
  qword_1B3B0 = (uint64_t)v1;
}

id sub_41A0()
{
  if (qword_1B3C8 != -1) {
    dispatch_once(&qword_1B3C8, &stru_14448);
  }
  return (id)qword_1B3C0;
}

void sub_41E0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController", "monitor");
  v2 = (void *)qword_1B3C0;
  qword_1B3C0 = (uint64_t)v1;
}

id sub_4210()
{
  if (qword_1B3D8 != -1) {
    dispatch_once(&qword_1B3D8, &stru_14468);
  }
  return (id)qword_1B3D0;
}

void sub_4250(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController", "init");
  v2 = (void *)qword_1B3D0;
  qword_1B3D0 = (uint64_t)v1;
}

id sub_4280()
{
  if (qword_1B3E8 != -1) {
    dispatch_once(&qword_1B3E8, &stru_14488);
  }
  return (id)qword_1B3E0;
}

void sub_42C0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController", "analytics");
  v2 = (void *)qword_1B3E0;
  qword_1B3E0 = (uint64_t)v1;
}

id sub_42F0()
{
  if (qword_1B3F8 != -1) {
    dispatch_once(&qword_1B3F8, &stru_144A8);
  }
  return (id)qword_1B3F0;
}

void sub_4330(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController.Daemon", "default");
  v2 = (void *)qword_1B3F0;
  qword_1B3F0 = (uint64_t)v1;
}

void sub_4360(char *category)
{
  os_log_t v1 = os_log_create("com.apple.GameController.HID", category);
  v2 = (void *)qword_1B400;
  qword_1B400 = (uint64_t)v1;
}

id sub_438C()
{
  if (qword_1B408 != -1) {
    dispatch_once(&qword_1B408, &stru_144C8);
  }
  return (id)qword_1B400;
}

void sub_43CC(id a1)
{
  if (!qword_1B400) {
    objc_storeStrong((id *)&qword_1B400, &_os_log_default);
  }
}

id sub_43F0()
{
  if (qword_1B418 != -1) {
    dispatch_once(&qword_1B418, &stru_144E8);
  }
  return (id)qword_1B410;
}

void sub_4430(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController.Settings", "default");
  v2 = (void *)qword_1B410;
  qword_1B410 = (uint64_t)v1;
}

id sub_4460()
{
  if (qword_1B428 != -1) {
    dispatch_once(&qword_1B428, &stru_14508);
  }
  return (id)qword_1B420;
}

void sub_44A0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController.Haptics", "default");
  v2 = (void *)qword_1B420;
  qword_1B420 = (uint64_t)v1;
}

id sub_44D0()
{
  if (qword_1B438 != -1) {
    dispatch_once(&qword_1B438, &stru_14528);
  }
  return (id)qword_1B430;
}

void sub_4510(id a1)
{
  os_log_t v1 = os_log_create("com.apple.gamecontroller", "Signposts");
  v2 = (void *)qword_1B430;
  qword_1B430 = (uint64_t)v1;
}

id sub_4540()
{
  if (qword_1B448 != -1) {
    dispatch_once(&qword_1B448, &stru_14548);
  }
  return (id)qword_1B440;
}

void sub_4580(id a1)
{
  os_log_t v1 = os_log_create("com.apple.runtime-issues", "GameController");
  v2 = (void *)qword_1B440;
  qword_1B440 = (uint64_t)v1;
}

id sub_45B0()
{
  return +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &unk_12BA0, 37LL);
}

LABEL_13:
  return (pair<BOOL, float>)(v12 | v11);
}

void sub_4720(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_47B8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
}

LABEL_14:
  return v6;
}

void sub_491C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_49F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4B6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4C24( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

id sub_50AC(uint64_t a1, int a2)
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](&OBJC_CLASS___NSMutableString, "stringWithCapacity:", 2 * a2));
  if (a2 >= 1)
  {
    unint64_t v5 = a2 + 1LL;
    do
    {
      if ((_DWORD)v5 == 2) {
        v6 = &stru_14970;
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

uint64_t sub_51A0()
{
  if (qword_1B450 != -1) {
    dispatch_once(&qword_1B450, &stru_14568);
  }
  return byte_1B458;
}

void sub_51E0(id a1)
{
  os_log_t v1 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.GameController");
  byte_1B458 = -[NSUserDefaults BOOLForKey:](v1, "BOOLForKey:", @"GCPartnersEnable");
  id v2 = sub_438C();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = byte_1B458;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Partners mode enabled? %d", (uint8_t *)v4, 8u);
  }
}

id sub_52BC()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL____GCDriverClientInterface));
  os_log_t v1 = sub_407C();
  id v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  [v0 setInterface:v2 forSelector:"connectToNintendoJoyConFusionGestureServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  v3 = sub_4090();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  [v0 setInterface:v4 forSelector:"connectToNintendoJoyConFusionGestureServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  unint64_t v5 = sub_8B78();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v0 setInterface:v6 forSelector:"connectToLightServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  v7 = sub_8B8C();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v0 setInterface:v8 forSelector:"connectToLightServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  v9 = sub_5578();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  [v0 setInterface:v10 forSelector:"connectToAdaptiveTriggersServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  v11 = sub_558C();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  [v0 setInterface:v12 forSelector:"connectToAdaptiveTriggersServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  v13 = sub_8B50();
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  [v0 setInterface:v14 forSelector:"connectToMotionServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  v15 = sub_8B64();
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  [v0 setInterface:v16 forSelector:"connectToMotionServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  v17 = sub_C9D0();
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  [v0 setInterface:v18 forSelector:"connectToBatteryServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  v19 = sub_C9E4();
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  [v0 setInterface:v20 forSelector:"connectToBatteryServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  v21 = sub_40A4();
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  [v0 setInterface:v22 forSelector:"connectToGameIntentServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  v23 = sub_40B8();
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

NSXPCInterface *sub_5564()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL____GCDriverServerInterface);
}

NSXPCInterface *sub_5578()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCAdaptiveTriggersServiceClientInterface);
}

NSXPCInterface *sub_558C()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCAdaptiveTriggersServiceServerInterface);
}

void sub_55A0()
{
}
}

void sub_5CD0(uint64_t a1, int a2, const void *a3, unint64_t a4)
{
  if (a2)
  {
    id v8 = sub_438C();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_CA5C();
    }
  }

  else
  {
    if (a4 >= 0x35) {
      size_t v10 = 53LL;
    }
    else {
      size_t v10 = a4;
    }
    memcpy((void *)(*(void *)(a1 + 32) + 857LL), a3, v10);
    *(_BYTE *)(*(void *)(a1 + 32) + 873LL) = 0;
    *(_BYTE *)(*(void *)(a1 + 32) + 889LL) = 0;
    id v11 = sub_438C();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v12 = *(_OWORD *)(*(void *)(a1 + 32) + 857LL);
      __int128 v13 = *(_OWORD *)(*(void *)(a1 + 32) + 873LL);
      __int128 v14 = *(_OWORD *)(*(void *)(a1 + 32) + 889LL);
      *(void *)&v18[13] = *(void *)(*(void *)(a1 + 32) + 902LL);
      v17[1] = v13;
      *(_OWORD *)v18 = v14;
      v17[0] = v12;
      id v15 = sub_5E4C((uint64_t)v17);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      LODWORD(v17[0]) = 138412290;
      *(void *)((char *)v17 + 4) = v16;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "(Async) Firmware Info = %@", (uint8_t *)v17, 0xCu);
    }
  }

  free(*(void **)(a1 + 48));
  free(*(void **)(a1 + 56));
}

id sub_5E4C(uint64_t a1)
{
  if (!*(_BYTE *)a1) {
    return (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
  }
  v18[0] = @"ReportID";
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:"));
  v19[0] = v17;
  v18[1] = @"Build Date";
  uint64_t v2 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a1 + 1));
  v3 = (void *)v2;
  if (v2) {
    v4 = (const __CFString *)v2;
  }
  else {
    v4 = @"<invalid>";
  }
  v19[1] = v4;
  v18[2] = @"Build Time";
  uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a1 + 17));
  v6 = (void *)v5;
  if (v5) {
    v7 = (const __CFString *)v5;
  }
  else {
    v7 = @"<invalid>";
  }
  v19[2] = v7;
  v18[3] = @"Device Revision";
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  *(unsigned __int16 *)(a1 + 33)));
  v19[3] = v8;
  v18[4] = @"Hardware Version";
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  *(unsigned __int16 *)(a1 + 35)));
  v19[4] = v9;
  v18[5] = @"Software Version";
  size_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(a1 + 37)));
  v19[5] = v10;
  v18[6] = @"Software Subversion";
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  *(unsigned __int16 *)(a1 + 41)));
  v19[6] = v11;
  v18[7] = @"Software Series Info";
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  *(unsigned __int16 *)(a1 + 43)));
  v19[7] = v12;
  v18[8] = @"Code Size";
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(a1 + 45)));
  v19[8] = v13;
  v18[9] = @"CRC 32";
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(a1 + 49)));
  v19[9] = v14;
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  10LL));

  return v15;
}

void sub_6230(uint64_t a1, int a2, const void *a3, unint64_t a4)
{
  if (a2)
  {
    id v8 = sub_438C();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_CB20();
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
  memcpy((void *)(*(void *)(a1 + 32) + 816LL), a3, v10);
  if (sub_40CC())
  {
    id v15 = sub_438C();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = (_OWORD *)(*(void *)(a1 + 32) + 816LL);
      *(_OWORD *)buf = *v17;
      v47[0] = v17[1];
      *(_OWORD *)((char *)v47 + 9) = *(_OWORD *)((char *)v17 + 25);
      id v18 = sub_695C((uint64_t)buf);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v19;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "(Async) Sensor Calibration Info = %@", buf, 0xCu);
    }
  }

  uint64_t v11 = *(void *)(a1 + 32);
  double v12 = (double)(*(__int16 *)(v11 + 837) + *(__int16 *)(v11 + 835)) * 0.5;
  *(double *)(v11 + 736) = v12
                         / ((fabs((double)(*(__int16 *)(v11 + 823) - *(__int16 *)(v11 + 817)))
  *(double *)(*(void *)(a1 + 32) + 736LL) = *(double *)(*(void *)(a1 + 32) + 736LL) * 0.0174532925;
  uint64_t v13 = *(void *)(a1 + 32);
  *(double *)(v13 + 744) = v12
                         / ((fabs((double)(*(__int16 *)(v13 + 827) - *(__int16 *)(v13 + 819)))
  *(double *)(*(void *)(a1 + 32) + 744LL) = *(double *)(*(void *)(a1 + 32) + 744LL) * 0.0174532925;
  uint64_t v14 = *(void *)(a1 + 32);
  *(double *)(v14 + 752) = v12
                         / ((fabs((double)(*(__int16 *)(v14 + 831) - *(__int16 *)(v14 + 821)))
  *(double *)(*(void *)(a1 + 32) + 752LL) = *(double *)(*(void *)(a1 + 32) + 752LL) * 0.0174532925;
  *(double *)(*(void *)(a1 + 32) + 760LL) = (double)(*(__int16 *)(*(void *)(a1 + 32) + 841LL)
  *(double *)(*(void *)(a1 + 32) + 768LL) = (double)(*(__int16 *)(*(void *)(a1 + 32) + 845LL)
  *(double *)(*(void *)(a1 + 32) + 776LL) = (double)(*(__int16 *)(*(void *)(a1 + 32) + 849LL)
  *(double *)(*(void *)(a1 + 32) + 784LL) = 2.0
  *(double *)(*(void *)(a1 + 32) + 792LL) = 2.0
  *(double *)(*(void *)(a1 + 32) + 800LL) = 2.0
  if (sub_40CC())
  {
    id v20 = sub_438C();
    log = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 736LL);
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v21;
      _os_log_impl(&dword_0, log, OS_LOG_TYPE_INFO, "(Async) Gyro Pitch Sensitivity = %f", buf, 0xCu);
    }
  }

  if (sub_40CC())
  {
    id v22 = sub_438C();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = *(void *)(*(void *)(a1 + 32) + 744LL);
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v24;
      _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "(Async) Gyro Yaw Sensitivity = %f", buf, 0xCu);
    }
  }

  if (sub_40CC())
  {
    id v25 = sub_438C();
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      uint64_t v27 = *(void *)(*(void *)(a1 + 32) + 752LL);
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v27;
      _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "(Async) Gyro Roll Sensitivity = %f", buf, 0xCu);
    }
  }

  if (sub_40CC())
  {
    id v28 = sub_438C();
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      uint64_t v30 = *(void *)(*(void *)(a1 + 32) + 760LL);
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v30;
      _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "(Async) Accelerometer X Bias = %f", buf, 0xCu);
    }
  }

  if (sub_40CC())
  {
    id v31 = sub_438C();
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      uint64_t v33 = *(void *)(*(void *)(a1 + 32) + 768LL);
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v33;
      _os_log_impl(&dword_0, v32, OS_LOG_TYPE_INFO, "(Async) Accelerometer Y Bias = %f", buf, 0xCu);
    }
  }

  if (sub_40CC())
  {
    id v34 = sub_438C();
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      uint64_t v36 = *(void *)(*(void *)(a1 + 32) + 776LL);
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v36;
      _os_log_impl(&dword_0, v35, OS_LOG_TYPE_INFO, "(Async) Accelerometer Z Bias = %f", buf, 0xCu);
    }
  }

  if (sub_40CC())
  {
    id v37 = sub_438C();
    v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      uint64_t v39 = *(void *)(*(void *)(a1 + 32) + 784LL);
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v39;
      _os_log_impl(&dword_0, v38, OS_LOG_TYPE_INFO, "(Async) Accelerometer X Sensitivity = %f", buf, 0xCu);
    }
  }

  if (sub_40CC())
  {
    id v40 = sub_438C();
    v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      uint64_t v42 = *(void *)(*(void *)(a1 + 32) + 792LL);
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v42;
      _os_log_impl(&dword_0, v41, OS_LOG_TYPE_INFO, "(Async) Accelerometer Y Sensitivity = %f", buf, 0xCu);
    }
  }

  if (sub_40CC())
  {
    id v43 = sub_438C();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v44 = *(void *)(*(void *)(a1 + 32) + 800LL);
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v44;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "(Async) Accelerometer Z Sensitivity = %f", buf, 0xCu);
    }

    goto LABEL_4;
  }

LABEL_18:
  free(*(void **)(a1 + 48));
  free(*(void **)(a1 + 56));
}

  return v9;
}

id sub_695C(uint64_t a1)
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
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithShort:]( &OBJC_CLASS___NSNumber,  "numberWithShort:",  *(__int16 *)(a1 + 21)));
  v25[11] = v2;
  v24[12] = @"accelRefXPlus";
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithShort:]( &OBJC_CLASS___NSNumber,  "numberWithShort:",  *(__int16 *)(a1 + 23)));
  v25[12] = v3;
  v24[13] = @"accelRefXMinus";
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithShort:]( &OBJC_CLASS___NSNumber,  "numberWithShort:",  *(__int16 *)(a1 + 25)));
  v25[13] = v4;
  v24[14] = @"accelRefYPlus";
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithShort:]( &OBJC_CLASS___NSNumber,  "numberWithShort:",  *(__int16 *)(a1 + 27)));
  v25[14] = v5;
  v24[15] = @"accelRefYMinus";
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithShort:]( &OBJC_CLASS___NSNumber,  "numberWithShort:",  *(__int16 *)(a1 + 29)));
  v25[15] = v6;
  v24[16] = @"accelRefZPlus";
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithShort:]( &OBJC_CLASS___NSNumber,  "numberWithShort:",  *(__int16 *)(a1 + 31)));
  v25[16] = v7;
  v24[17] = @"accelRefZMinus";
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithShort:]( &OBJC_CLASS___NSNumber,  "numberWithShort:",  *(__int16 *)(a1 + 33)));
  v25[17] = v8;
  v24[18] = @"calibrationTemp";
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  *(unsigned __int16 *)(a1 + 35)));
  v25[18] = v9;
  v24[19] = @"CRC 32";
  size_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(a1 + 37)));
  v25[19] = v10;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v25,  v24,  20LL));

  return v11;
}

void sub_70EC(_Unwind_Exception *a1)
{
}

void sub_7114(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v15 = a2;
  id v16 = a6;
  v17 = (id *)(a1 + 32);
  WeakRetained = (dispatch_once_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v19 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_38;
  }
  uint64_t v20 = sub_AF28((uint64_t)WeakRetained);
  kdebug_trace(835452996LL, v20, a3, a4, a5);
  memset(v118, 0, 43);
  __int128 v116 = 0u;
  __int128 v117 = 0u;
  if (a5 == 17)
  {
    id v26 = v16;
    uint64_t v27 = (char *)[v26 bytes];
    if (!*((_BYTE *)v19 + 944)) {
      -[dispatch_once_t setExtendedSupportEnabled:](v19, "setExtendedSupportEnabled:", 1LL);
    }
    id v28 = v27 + 3;
    id v29 = [v26 length];
    else {
      uint64_t v30 = (uint64_t)v29;
    }
    __memcpy_chk(&v116, v28, v30, 75LL);
  }

  else
  {
    if (a5 != 1) {
      goto LABEL_38;
    }
    id v21 = v16;
    id v22 = (char *)[v21 bytes];
    if (-[dispatch_once_t isBluetoothClassic](v19, "isBluetoothClassic"))
    {
    }

    if ((-[dispatch_once_t isBluetoothClassic](v19, "isBluetoothClassic") & 1) == 0
      && [v21 length] != &stru_20.vmsize)
    {
      goto LABEL_38;
    }

    v23 = v22 + 1;
    id v24 = [v21 length];
    else {
      uint64_t v25 = (uint64_t)v24;
    }
    __memcpy_chk(&v116, v23, v25, 75LL);
    if (-[dispatch_once_t isBluetoothClassic](v19, "isBluetoothClassic")
      && [v21 length] == (char *)&dword_8 + 2)
    {
      BYTE13(v117) = BYTE13(v117) & 0xF0 | 0xA;
    }
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_7910;
  block[3] = &unk_145E0;
  id v31 = v19;
  v114 = v31;
  objc_copyWeak(&v115, v17);
  if (v19[101] != -1) {
    dispatch_once(v19 + 101, block);
  }
  -[dispatch_once_t updateBatteryLevel:isPowerSupplyConnected:]( v31,  "updateBatteryLevel:isPowerSupplyConnected:",  BYTE13(v117) & 0xF,  (BYTE13(v117) >> 4) & 1);
  if (*((_BYTE *)v31 + 728))
  {
    double v81 = *((double *)v31 + 93) * (double)(SHIWORD(v116) - *(__int16 *)((char *)v31 + 819));
    double v82 = *((double *)v31 + 92) * (double)(SWORD6(v116) - *(__int16 *)((char *)v31 + 817));
    double v79 = -(((double)SWORD1(v117) - *((double *)v31 + 95)) * *((double *)v31 + 98));
    double v80 = *((double *)v31 + 94) * (double)(*(__int16 *)((char *)v31 + 821) - (__int16)v117);
    double v32 = -(((double)SWORD2(v117) - *((double *)v31 + 96)) * *((double *)v31 + 99));
    double v75 = v32;
    double v77 = ((double)SWORD3(v117) - *((double *)v31 + 97)) * *((double *)v31 + 100);
    char v33 = 1;
  }

  else
  {
    char v33 = 0;
    double v32 = 0.0;
    double v75 = 0.0;
    double v77 = 0.0;
    double v79 = 0.0;
    double v80 = 0.0;
    double v81 = 0.0;
    double v82 = 0.0;
  }

  LOBYTE(v32) = BYTE1(v116);
  *(double *)&unint64_t v34 = ((double)*(unint64_t *)&v32 + -127.5) / -127.5;
  float v35 = *(double *)&v34;
  LOBYTE(v34) = BYTE3(v116);
  float v36 = ((double)v34 + -127.5) / -127.5;
  float v37 = 0.0;
  float v38 = 0.0;
  float v39 = 0.0;
  float v40 = 0.0;
  int8x8_t v41 = 0LL;
  int8x8_t v42 = 0LL;
  if (LOBYTE(v118[0]))
  {
    uint64_t v43 = LOBYTE(v118[0]) - 1;
    if ((*((char *)v118 + 9 * v43 + 2) & 0x80000000) == 0)
    {
      unsigned int v44 = *(_WORD *)((_BYTE *)v118 + 9 * v43 + 3) & 0xFFF;
      unsigned int v45 = (*(unsigned __int16 *)((char *)v118 + 9 * v43 + 3) | (*((unsigned __int8 *)v118 + 9 * v43 + 5) << 16)) >> 12;
      float v46 = (float)((float)((float)v45 / 941.0) + (float)((float)v45 / 941.0)) + -1.0;
      float v37 = fmaxf(-v46, 0.0);
      float v38 = fmaxf(v46, 0.0);
      *(float *)v47.i32 = -(float)((float)((float)((float)v44 / 1919.0) + (float)((float)v44 / 1919.0)) + -1.0);
      v48.i32[0] = 0;
      v48.f32[1] = (float)((float)((float)v44 / 1919.0) + (float)((float)v44 / 1919.0)) + -1.0;
      *(float *)&v47.i32[1] = v48.f32[1];
      int8x8_t v41 = vand_s8(v47, (int8x8_t)vcgt_f32(v48, (float32x2_t)v48.u32[1]));
    }

    uint64_t v49 = 9 * v43;
    if ((*((char *)v118 + v49 + 6) & 0x80000000) == 0)
    {
      unsigned int v50 = *(unsigned __int16 *)((char *)v118 + v49 + 7) | (*((unsigned __int8 *)v118 + v49 + 9) << 16);
      *(float *)&unsigned int v51 = (float)((float)((float)(v50 & 0xFFF) / 1919.0) + (float)((float)(v50 & 0xFFF) / 1919.0)) + -1.0;
      float v52 = (float)((float)((float)(v50 >> 12) / 941.0) + (float)((float)(v50 >> 12) / 941.0)) + -1.0;
      float v39 = fmaxf(-v52, 0.0);
      float v40 = fmaxf(v52, 0.0);
      *(float *)v53.i32 = -*(float *)&v51;
      v54.i32[0] = 0;
      v54.f32[1] = *(float *)&v51;
      v53.i32[1] = v51;
      int8x8_t v42 = vand_s8(v53, (int8x8_t)vcgt_f32(v54, (float32x2_t)v51));
    }
  }

  int8x8_t v85 = v41;
  int8x8_t v86 = v42;
  float v87 = v38;
  float v88 = v37;
  float v89 = v39;
  LOBYTE(v6) = v116;
  LOBYTE(v7) = BYTE2(v116);
  unsigned int v55 = BYTE6(v116);
  unsigned int v56 = WORD2(v116);
  if (v35 >= 0.0) {
    float v57 = 0.0;
  }
  else {
    float v57 = -v35;
  }
  float v58 = -v36;
  if (v36 >= 0.0) {
    float v58 = 0.0;
  }
  float v83 = v58;
  float v84 = v40;
  LOBYTE(v8) = BYTE8(v116);
  LOBYTE(v9) = BYTE7(v116);
  -[dispatch_once_t dispatchHomeButtonEventWithValue:timestamp:]( v31,  "dispatchHomeButtonEventWithValue:timestamp:",  BYTE6(v116) & 1,  a3,  *(void *)&v75,  *(void *)&v77);
  -[dispatch_once_t dispatchMenuButtonEventWithValue:timestamp:]( v31,  "dispatchMenuButtonEventWithValue:timestamp:",  (WORD2(v116) >> 13) & 1,  a3);
  -[dispatch_once_t dispatchOptionsButtonEventWithValue:timestamp:]( v31,  "dispatchOptionsButtonEventWithValue:timestamp:",  (WORD2(v116) >> 12) & 1,  a3);
  unsigned int v59 = v56 | (v55 << 16);
  int32x2_t v60 = vdup_n_s32(v56 & 0xF);
  int8x8_t v61 = (int8x8_t)vdup_n_s32(v59);
  *(float *)&unsigned int v62 = ((double)v6 + -127.5) / 127.5;
  *(float *)&unsigned int v63 = ((double)v7 + -127.5) / 127.5;
  __asm { FMOV            V16.2S, #1.0 }

  float32x2_t v69 = vcvt_f32_u32((uint32x2_t)(*(void *)&vshl_u32( (uint32x2_t)vand_s8(v61, (int8x8_t)0xFF000000FFLL),  (uint32x2_t)0xFFFFFFFAFFFFFFFBLL) & 0xFFFFFFF1FFFFFFF1LL));
  *(void *)&v61 &= 0xFFFFFF00FFFFFFuLL;
  v70.i32[0] = 0;
  v70.i32[1] = v62;
  *(float *)v71.i32 = -*(float *)&v62;
  v71.i32[1] = v62;
  int8x8_t v72 = vand_s8(v71, (int8x8_t)vcgt_f32(v70, (float32x2_t)v62));
  v73.i32[0] = 0;
  v73.i32[1] = v63;
  int8x8_t v74 = (int8x8_t)vcgt_f32(v73, (float32x2_t)v63);
  v73.f32[0] = -*(float *)&v63;
  v73.i32[1] = v63;
  uint64_t v90 = 0LL;
  int8x8_t v91 = vbsl_s8( (int8x8_t)vceq_s32(v60, (int32x2_t)0x400000000LL),  _D16,  (int8x8_t)vcvt_f32_u32((uint32x2_t)vand_s8( vorr_s8( (int8x8_t)vceq_s32(v60, (int32x2_t)0x500000001LL),  (int8x8_t)vceq_s32(v60, (int32x2_t)0x300000007LL)),  (int8x8_t)0x100000001LL)));
  int8x8_t v92 = vbsl_s8( (int8x8_t)vceq_s32(v60, (int32x2_t)0x200000006LL),  _D16,  vand_s8((int8x8_t)vceq_s32(vdup_n_s32(v56 & 0xD), (int32x2_t)0x100000005LL), _D16));
  double v93 = *(double *)&v69;
  *(float *)&uint64_t v94 = (float)((v56 >> 4) & 1);
  *((float *)&v94 + 1) = (float)((v59 >> 7) & 1);
  float32x2_t v95 = vcvt_f32_u32((uint32x2_t)vand_s8( (int8x8_t)vshl_u32((uint32x2_t)v61, (uint32x2_t)0xFFFFFFF7FFFFFFF8LL),  (int8x8_t)0x100000001LL));
  unint64_t v96 = __PAIR64__(LODWORD(v57), COERCE_UNSIGNED_INT(fmaxf(v35, 0.0)));
  int8x8_t v97 = v72;
  *(void *)&__int128 v98 = __PAIR64__(LODWORD(v83), COERCE_UNSIGNED_INT(fmaxf(v36, 0.0)));
  *((int8x8_t *)&v98 + 1) = vand_s8((int8x8_t)v73, v74);
  *(float *)&__int128 v99 = (float)v9 / 255.0;
  *((float *)&v99 + 1) = (float)v8 / 255.0;
  *((float32x2_t *)&v99 + 1) = vcvt_f32_u32((uint32x2_t)vand_s8( (int8x8_t)vshl_u32( (uint32x2_t)v61,  (uint32x2_t)0xFFFFFFF1FFFFFFF2LL),  (int8x8_t)0x100000001LL));
  uint64_t v100 = 0LL;
  int v101 = 0;
  float v102 = v88;
  float v103 = v87;
  int8x8_t v104 = v85;
  float v105 = v89;
  float v106 = v84;
  int8x8_t v107 = v86;
  float v108 = (float)((v55 >> 1) & 1);
  uint64_t v112 = 0LL;
  __int128 v111 = 0u;
  __int128 v110 = 0u;
  __int128 v109 = 0u;
  -[dispatch_once_t dispatchGameControllerExtendedEventWithState:timestamp:]( v31,  "dispatchGameControllerExtendedEventWithState:timestamp:",  &v90,  a3);
  if (*((_BYTE *)v31 + 728))
  {
    LOBYTE(v90) = v33;
    *(_DWORD *)((char *)&v90 + 1) = 0;
    HIDWORD(v90) = 0;
    int8x8_t v91 = *(int8x8_t *)&v82;
    int8x8_t v92 = *(int8x8_t *)&v80;
    double v93 = v81;
    LOBYTE(v94) = v33;
    *(_DWORD *)((char *)&v94 + 1) = 0;
    HIDWORD(v94) = 0;
    float32x2_t v95 = *(float32x2_t *)&v79;
    unint64_t v96 = v78;
    int8x8_t v97 = v76;
    __int128 v98 = 0u;
    __int128 v99 = 0u;
    uint64_t v100 = 0LL;
    -[dispatch_once_t dispatchMotionEventWithState:timestamp:](v31, "dispatchMotionEventWithState:timestamp:", &v90, a3);
  }

  objc_destroyWeak(&v115);

LABEL_38:
}

void sub_78F8(_Unwind_Exception *a1)
{
}

void sub_7910(uint64_t a1)
{
  uint64_t v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dispatchQueue]);
  if (v2)
  {
    dispatch_time_t v3 = dispatch_time(0LL, 2500000000LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_79D8;
    block[3] = &unk_145B8;
    objc_copyWeak(&v5, (id *)(a1 + 40));
    dispatch_after(v3, v2, block);
    objc_destroyWeak(&v5);
  }

  else
  {
    *(_BYTE *)(*(void *)(a1 + 32) + 707LL) = 1;
  }
}

void sub_79D8(uint64_t a1)
{
  os_log_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    dispatch_time_t v3 = objc_loadWeakRetained(v1);
    v3[707] = 1;
    [v3 sendBatteryReport];
  }

void sub_7DD8(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = sub_438C();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_CC20();
    }
  }

void sub_7E40(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = sub_438C();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_CC80();
    }
  }

id sub_8608(uint64_t a1)
{
  id v2 = sub_438C();
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

  unint64_t v7 = *(_BYTE **)(a1 + 32);
  if (!v7[944])
  {
    [v7 setExtendedSupportEnabled:1];
    unint64_t v7 = *(_BYTE **)(a1 + 32);
  }

  v7[729] = (int)(float)(*(float *)(a1 + 40) * 255.0);
  *(_BYTE *)(*(void *)(a1 + 32) + 730LL) = (int)(float)(*(float *)(a1 + 44) * 255.0);
  *(_BYTE *)(*(void *)(a1 + 32) + 731LL) = (int)(float)(*(float *)(a1 + 48) * 255.0);
  id result = [*(id *)(a1 + 32) isHapticsActive];
  return result;
}

void sub_88D8(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 40))
  {
    id v2 = *(_BYTE **)(a1 + 32);
    if (!v2[944]) {
      [v2 setExtendedSupportEnabled:1];
    }
  }

  id v3 = sub_438C();
  double v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = *(unsigned __int8 *)(a1 + 40);
    v6[0] = 67109120;
    v6[1] = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "updateSensorsEnabled %d", (uint8_t *)v6, 8u);
  }

  *(_BYTE *)(*(void *)(a1 + 32) + 728LL) = *(_BYTE *)(a1 + 40);
}

void sub_8B14( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_8B24( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

NSXPCInterface *sub_8B50()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCMotionServiceClientInterface);
}

NSXPCInterface *sub_8B64()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCMotionServiceServerInterface);
}

NSXPCInterface *sub_8B78()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCLightServiceClientInterface);
}

NSXPCInterface *sub_8B8C()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCLightServiceServerInterface);
}

dispatch_source_s *sub_8BA0(uint64_t a1, uint64_t a2, dispatch_queue_s *a3, void *a4)
{
  id v7 = a4;
  unsigned int v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, a3);
  if (v8)
  {
    dispatch_time_t v9 = dispatch_walltime(0LL, 0LL);
    dispatch_source_set_timer(v8, v9, a1, a2);
    dispatch_source_set_event_handler(v8, v7);
    dispatch_resume(v8);
  }

  return v8;
}

void sub_8DDC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_8E0C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = sub_438C();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl( &dword_0,  v3,  OS_LOG_TYPE_DEFAULT,  "Connection to com.apple.GameController.gamecontrollerd.driver invalidated",  v4,  2u);
  }

  [WeakRetained setInterruptionHandler:0];
  [WeakRetained setInvalidationHandler:0];
  [WeakRetained invalidate];
}

void sub_8EA0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = sub_438C();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl( &dword_0,  v3,  OS_LOG_TYPE_DEFAULT,  "Connection to com.apple.GameController.gamecontrollerd.driver interrupted.  Attempting to re-establish.",  v5,  2u);
  }

  double v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained remoteObjectProxy]);
  [v4 driverCheckIn];
}

void sub_9384(uint64_t a1, int a2, int a3, uint64_t a4)
{
  if (a3 | a2)
  {
    switch(a2)
    {
      case 3:
        id v11 = sub_438C();
        double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
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
        id v12 = sub_438C();
        double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 134217984;
          uint64_t v14 = a1;
          id v7 = "BTSessionEventCallback: terminated session = %p";
          goto LABEL_15;
        }

        break;
      case 1:
        id v5 = sub_438C();
        double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
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

  id v9 = sub_438C();
  double v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
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

void sub_9528(uint64_t a1, void *a2)
{
  id v3 = sub_438C();
  double v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_CCE0(v4, v5, v6, v7, v8, v9, v10, v11);
  }

  if (a2) {
    [a2 disconnect];
  }
}

void sub_9700( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_9718(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_9728(uint64_t a1)
{
}

void sub_9730(uint64_t a1)
{
  id v2 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  dispatch_queue_get_label(*(dispatch_queue_t *)(a1 + 32)),  4LL);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = sub_438C();
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

BOOL sub_9B10(id a1, NSDictionary *a2, NSDictionary *a3)
{
  id v3 = a2;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", @"DeviceUsagePage"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", @"DeviceUsage"));
    char v8 = (![v6 isEqual:&off_15428]
       || ([v7 isEqual:&off_15440] & 1) == 0)
      && (![v6 isEqual:&off_15428]
       || ([v7 isEqual:&off_15458] & 1) == 0)
  }

  else
  {
    char v8 = 1;
  }

  return v8;
}

void sub_A050( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_A074(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = sub_438C();
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

void sub_A240(uint64_t a1)
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

LABEL_17:
        return;
      }

      *(void *)id v22 = 0LL;
      id v15 = BTDeviceFromAddress(self->_session, v21, v22);
      if (v15)
      {
        id v16 = v15;
        v17 = sub_438C();
        uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_17;
        }
        *(_DWORD *)buf = 67109120;
        id v26 = v16;
        uint64_t v10 = "GCHIDLog::disconnect: unable to get BTDevice; error code = %d";
LABEL_15:
        uint64_t v11 = buf;
        id v12 = v9;
        int v13 = 8;
        goto LABEL_16;
      }

      id v18 = BTDeviceDisconnect(*(void *)v22);
      v19 = sub_438C();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      uint64_t v20 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (v18)
      {
        if (!v20) {
          goto LABEL_17;
        }
        *(_DWORD *)buf = 67109120;
        id v26 = v18;
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
      uint64_t v14 = sub_438C();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      *(_WORD *)id v22 = 0;
      uint64_t v10 = "GCHIDLog::disconnect: unable to get BTDevice; no valid BTSession";
      uint64_t v11 = v22;
    }

    id v12 = v9;
    int v13 = 2;
    goto LABEL_16;
  }

void sub_ABC8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(dispatch_queue_s **)(v2 + 560);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_AC54;
  v8[3] = &unk_14708;
  v8[4] = v2;
  uint64_t v4 = sub_8BA0(0x6FC23AC00uLL, 0x3B9ACA00uLL, v3, v8);
  uint64_t v5 = objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v5;
}

id sub_AC54(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateIdleState];
}

void sub_AE30(id a1)
{
}

void sub_AE8C(uint64_t a1, void *a2, int a3)
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

uint64_t sub_AF28(uint64_t result)
{
  if (result) {
    return *(void *)(result + 656);
  }
  return result;
}

id sub_B060(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchEvent:*(void *)(a1 + 40)];
}

id sub_B180(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchIdleEvent:*(void *)(a1 + 40)];
}

void sub_C230(uint64_t a1)
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
        v8[2] = sub_C30C;
        v8[3] = &unk_145B8;
        objc_copyWeak(&v9, v1);
        id v5 = sub_8BA0(0xF4240uLL, 0x186A0uLL, tv_sec, v8);
        uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);
        tv_nsec = (void *)v3[33].tv_nsec;
        v3[33].tv_nsec = v6;

        objc_destroyWeak(&v9);
      }
    }
  }
}

void sub_C30C(uint64_t a1)
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
      id v3 = sub_438C();
      uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
      BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
      if ((v2 & 1) != 0)
      {
        if (v5) {
          sub_CD94(v4, v6, v7, v8, v9, v10, v11, v12);
        }

        HIDWORD(WeakRetained[30].tv_nsec) = 0;
        -[timespec dispatchHapticEvent](WeakRetained, "dispatchHapticEvent");
      }

      else
      {
        if (v5) {
          sub_CDC4(v4, v6, v7, v8, v9, v10, v11, v12);
        }

        -[timespec stopHaptics](WeakRetained, "stopHaptics");
      }
    }
  }
}

void sub_C9C0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

NSXPCInterface *sub_C9D0()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCBatteryServiceClientInterface);
}

NSXPCInterface *sub_C9E4()
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GCBatteryServiceServerInterface);
}

void sub_C9F8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_CA5C()
{
}

void sub_CABC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_CB20()
{
}

void sub_CB80(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Unable to retreive pairing info from DualShock 4.", v1, 2u);
  sub_8B34();
}

void sub_CBBC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_CC20()
{
}

void sub_CC80()
{
}

void sub_CCE0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_CD10(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "setProperty: %@ forKey: %@", (uint8_t *)&v3, 0x16u);
}

void sub_CD94( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_CDC4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

id objc_msgSend_valueForNoteParam_inParameters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForNoteParam:inParameters:");
}