@interface ATVHIDSystemClient
+ (BOOL)isLoopbackVolumeEvent:(__IOHIDEvent *)a3;
+ (BOOL)isVolumeEvent:(__IOHIDEvent *)a3;
+ (id)sharedInstance;
- (ATVHIDSystemClient)init;
- (int)_init;
- (void)_processAppleVendorDebugEvent:(__IOHIDEvent *)a3;
- (void)_processAppleVendorIRRemoteEvent:(__IOHIDEvent *)a3;
- (void)_processBatterySystemEvent:(__IOHIDEvent *)a3;
- (void)_processGenericDesktopEvent:(__IOHIDEvent *)a3;
- (void)_processHIDEvent:(__IOHIDEvent *)a3;
- (void)_setSILState_Off:(id)a3;
- (void)_setSILState_On:(id)a3;
- (void)dealloc;
- (void)flashSILMorseCode:(id)a3;
- (void)setSILState_Off;
- (void)setSILState_On;
- (void)setupHIDEventRouters;
@end

@implementation ATVHIDSystemClient

+ (id)sharedInstance
{
  if (qword_100470B10 != -1) {
    dispatch_once(&qword_100470B10, &stru_1003D6A30);
  }
  return (id)qword_100470B08;
}

- (ATVHIDSystemClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ATVHIDSystemClient;
  v2 = -[ATVHIDSystemClient init](&v6, "init");
  v3 = v2;
  if (v2 && !-[ATVHIDSystemClient _init](v2, "_init")) {
    v4 = v3;
  }
  else {
    v4 = 0LL;
  }

  return v4;
}

- (int)_init
{
  uint64_t v3 = IOHIDEventSystemClientCreate(0LL, a2);
  if (!v3) {
    return -6700;
  }
  v4 = (__IOHIDEventSystemClient *)v3;
  IOHIDEventSystemClientRegisterEventCallback(v3, sub_1000EE02C, 0LL, self);
  CFRunLoopRef Main = CFRunLoopGetMain();
  IOHIDEventSystemClientScheduleWithRunLoop(v4, Main, kCFRunLoopDefaultMode);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  2LL));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
  [v6 setObject:v7 forKey:@"PrimaryUsagePage"];
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 128LL));
  [v6 setObject:v8 forKey:@"PrimaryUsage"];
  IOHIDEventSystemClientSetMatching(v4, v6);
  self->_hidSystemClient = v4;
  CFRetain(v4);
  v9 = objc_alloc_init(&OBJC_CLASS___SSIndicatorLight);
  sil = self->_sil;
  self->_sil = v9;

  CFRelease(v4);
  return 0;
}

- (void)dealloc
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  hidSystemClient = self->_hidSystemClient;
  if (hidSystemClient) {
    CFRelease(hidSystemClient);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ATVHIDSystemClient;
  -[ATVHIDSystemClient dealloc](&v5, "dealloc");
}

+ (BOOL)isLoopbackVolumeEvent:(__IOHIDEvent *)a3
{
  if (!+[ATVHIDSystemClient isVolumeEvent:](&OBJC_CLASS___ATVHIDSystemClient, "isVolumeEvent:")) {
    return 0;
  }
  uint64_t IntegerValue = IOHIDEventGetIntegerValue(a3, 196610LL);
  objc_super v5 = @"release";
  if (IntegerValue == 1) {
    objc_super v5 = @"press";
  }
  objc_super v6 = v5;
  uint64_t SenderID = IOHIDEventGetSenderID(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBDisplayManager sharedInstance](&OBJC_CLASS___PBDisplayManager, "sharedInstance"));
  unint64_t v9 = (unint64_t)[v8 eARCStatus];

  unint64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
  unsigned int v11 = +[PBHIDInterface isCECButtonEvent:](&OBJC_CLASS___PBHIDInterface, "isCECButtonEvent:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[PBExternalControlSystem sharedSystem](&OBJC_CLASS___PBExternalControlSystem, "sharedSystem"));
  id v13 = [v12 volumeButtonBehavior];

  id v14 = sub_100082C04();
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136316418;
    v20 = sub_1000EDB38((uint64_t)a3);
    __int16 v21 = 2114;
    v22 = v6;
    __int16 v23 = 1024;
    BOOL v24 = v10 == 2;
    __int16 v25 = 1024;
    unsigned int v26 = v11;
    __int16 v27 = 1024;
    BOOL v28 = v13 == 0LL;
    __int16 v29 = 2048;
    uint64_t v30 = SenderID;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "ARC: %s %{public}@ event, ARC:%{BOOL}d FromCEC:%{BOOL}d behaviorIsCEC:%{BOOL}d senderID:%llx",  (uint8_t *)&v19,  0x32u);
  }

  if (v13) {
    char v16 = 0;
  }
  else {
    char v16 = v11;
  }
  if (v10 == 2) {
    BOOL v17 = v16;
  }
  else {
    BOOL v17 = 0;
  }

  return v17;
}

+ (BOOL)isVolumeEvent:(__IOHIDEvent *)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t IntegerValue = IOHIDEventGetIntegerValue(a3, 196608LL);
  uint64_t v5 = IOHIDEventGetIntegerValue(a3, 196609LL);
  BOOL v7 = v5 == 226 || (unint64_t)(v5 - 233) < 2;
  return IntegerValue == 12 && v7;
}

- (void)setupHIDEventRouters
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBHIDInterface sharedInstance](&OBJC_CLASS___PBHIDInterface, "sharedInstance"));
  [v2 setMode:1];
}

- (void)_processHIDEvent:(__IOHIDEvent *)a3
{
  uint64_t IntegerValue = IOHIDEventGetIntegerValue(a3, 0x10000LL);
  if (IntegerValue == 65295)
  {
    id v12 = sub_100082C04();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = sub_1000EDB38((uint64_t)a3);
      uint64_t v15 = IOHIDEventGetIntegerValue(a3, 196608LL);
      uint64_t v16 = IOHIDEventGetIntegerValue(a3, 196609LL);
      if (IOHIDEventGetIntegerValue(a3, 196610LL)) {
        BOOL v17 = "down";
      }
      else {
        BOOL v17 = "up";
      }
      int v26 = 136316418;
      __int16 v27 = "-[ATVHIDSystemClient _processHIDEvent:]";
      __int16 v28 = 2080;
      __int16 v29 = v14;
      __int16 v30 = 2048;
      uint64_t v31 = v15;
      __int16 v32 = 2048;
      uint64_t v33 = v16;
      __int16 v34 = 2080;
      v35 = v17;
      __int16 v36 = 2048;
      uint64_t SenderID = IOHIDEventGetSenderID(a3);
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s: %s 0x%lx 0x%lx %s 0x%llx",  (uint8_t *)&v26,  0x3Eu);
    }

    -[ATVHIDSystemClient _processAppleVendorDebugEvent:](self, "_processAppleVendorDebugEvent:", a3);
  }

  else if (IntegerValue == 65294)
  {
    id v6 = sub_100082C04();
    BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = sub_1000EDB38((uint64_t)a3);
      uint64_t v9 = IOHIDEventGetIntegerValue(a3, 196608LL);
      uint64_t v10 = IOHIDEventGetIntegerValue(a3, 196609LL);
      if (IOHIDEventGetIntegerValue(a3, 196610LL)) {
        unsigned int v11 = "down";
      }
      else {
        unsigned int v11 = "up";
      }
      int v26 = 136316418;
      __int16 v27 = "-[ATVHIDSystemClient _processHIDEvent:]";
      __int16 v28 = 2080;
      __int16 v29 = v8;
      __int16 v30 = 2048;
      uint64_t v31 = v9;
      __int16 v32 = 2048;
      uint64_t v33 = v10;
      __int16 v34 = 2080;
      v35 = v11;
      __int16 v36 = 2048;
      uint64_t SenderID = IOHIDEventGetSenderID(a3);
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: %s 0x%lx 0x%lx %s 0x%llx",  (uint8_t *)&v26,  0x3Eu);
    }

    -[ATVHIDSystemClient _processAppleVendorIRRemoteEvent:](self, "_processAppleVendorIRRemoteEvent:", a3);
  }

  uint64_t v18 = IOHIDEventGetIntegerValue(a3, 196608LL);
  if (v18 == 1)
  {
    -[ATVHIDSystemClient _processGenericDesktopEvent:](self, "_processGenericDesktopEvent:", a3);
  }

  else if (v18 == 133)
  {
    id v19 = sub_100082C04();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v21 = sub_1000EDB38((uint64_t)a3);
      uint64_t v22 = IOHIDEventGetIntegerValue(a3, 196608LL);
      uint64_t v23 = IOHIDEventGetIntegerValue(a3, 196609LL);
      if (IOHIDEventGetIntegerValue(a3, 196610LL)) {
        BOOL v24 = "down";
      }
      else {
        BOOL v24 = "up";
      }
      uint64_t v25 = IOHIDEventGetSenderID(a3);
      int v26 = 136316418;
      __int16 v27 = "-[ATVHIDSystemClient _processHIDEvent:]";
      __int16 v28 = 2080;
      __int16 v29 = v21;
      __int16 v30 = 2048;
      uint64_t v31 = v22;
      __int16 v32 = 2048;
      uint64_t v33 = v23;
      __int16 v34 = 2080;
      v35 = v24;
      __int16 v36 = 2048;
      uint64_t SenderID = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%s: %s 0x%lx 0x%lx %s 0x%llx",  (uint8_t *)&v26,  0x3Eu);
    }

    -[ATVHIDSystemClient _processBatterySystemEvent:](self, "_processBatterySystemEvent:", a3);
  }

- (void)_processAppleVendorIRRemoteEvent:(__IOHIDEvent *)a3
{
  if (IOHIDEventGetIntegerValue(a3, 65537LL) == 4)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v4 postNotificationName:@"ATVHIDSystemClientNotification_DidReceivePeripheralPairingRequest" object:self];
  }

- (void)_processAppleVendorDebugEvent:(__IOHIDEvent *)a3
{
  uint64_t IntegerValue = IOHIDEventGetIntegerValue(a3, 65537LL);
  switch(IntegerValue)
  {
    case 4LL:
      id v7 = sub_100082C04();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v13 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "IR Remote triggered black screen receovery.",  v13,  2u);
      }

      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v9 postNotificationName:@"ATVHIDSystemClientNotification_StartBSR" object:self];

      break;
    case 2LL:
      id v10 = sub_100082C04();
      unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "IR Remote triggered stackshot.", v14, 2u);
      }

      WriteStackshotReport_async(@"User triggered stackshot.", 3237998114LL);
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, kBKSHIDServicesStackshotTaken, 0LL, 0LL, 1u);
      break;
    case 1LL:
      id v5 = sub_100082C04();
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "IR Remote triggered screenshot.", buf, 2u);
      }

      sub_100202CDC(0);
      break;
  }

- (void)_processBatterySystemEvent:(__IOHIDEvent *)a3
{
}

- (void)_processGenericDesktopEvent:(__IOHIDEvent *)a3
{
  if (IOHIDEventGetIntegerValue(a3, 196610LL))
  {
    uint64_t IntegerValue = IOHIDEventGetIntegerValue(a3, 196609LL);
    unsigned int v5 = +[PBHIDInterface isCECButtonEvent:](&OBJC_CLASS___PBHIDInterface, "isCECButtonEvent:", a3);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[PBDisplayManager sharedInstance](&OBJC_CLASS___PBDisplayManager, "sharedInstance"));
    unint64_t v7 = (unint64_t)[v6 eARCStatus];

    BOOL v9 = v7 == 1 || (v7 & 0xFFFFFFFFFFFFFFFELL) == 2;
    id v10 = sub_1000838E8();
    unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v19 = 134218496;
      *(void *)v20 = IntegerValue;
      *(_WORD *)&v20[8] = 1024;
      unsigned int v21 = v5;
      __int16 v22 = 2048;
      unint64_t v23 = v7;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "Incoming generic desktop event [usage:%lx WasCEC:%{BOOL}d ARC:%ld]",  (uint8_t *)&v19,  0x1Cu);
    }

    if (IntegerValue == 130)
    {
      id v17 = sub_1000838E8();
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 67109376;
        *(_DWORD *)v20 = v5;
        *(_WORD *)&v20[4] = 1024;
        *(_DWORD *)&v20[6] = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Received request to sleep. WasCEC:%{BOOL}d ARC'd:%{BOOL}d",  (uint8_t *)&v19,  0xEu);
      }

      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[PBAppDelegate sharedApplicationDelegate]( &OBJC_CLASS___PBAppDelegate,  "sharedApplicationDelegate"));
      [v16 handlePowerOffExternalEvent];
    }

    else
    {
      if (IntegerValue != 131) {
        return;
      }
      id v12 = sub_1000838E8();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 67109376;
        *(_DWORD *)v20 = v5;
        *(_WORD *)&v20[4] = 1024;
        *(_DWORD *)&v20[6] = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Received request to wake. WasCEC:%{BOOL}d ARC'd:%{BOOL}d",  (uint8_t *)&v19,  0xEu);
      }

      if (v7 - 1 < 3) {
        unsigned int v14 = v5;
      }
      else {
        unsigned int v14 = 0;
      }
      if (v14 == 1)
      {
        id v15 = sub_1000838E8();
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v19) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v16,  OS_LOG_TYPE_DEFAULT,  "Ignoring request to wake over CEC while we are providing ARC.",  (uint8_t *)&v19,  2u);
        }
      }

      else
      {
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[PBAppDelegate sharedApplicationDelegate]( &OBJC_CLASS___PBAppDelegate,  "sharedApplicationDelegate"));
        [v16 handlePowerOnExternalEvent];
      }
    }
  }

- (void)_setSILState_Off:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"MorseCode"] & 1) == 0)
  {
    id v5 = sub_1000838E8();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      v8 = "-[ATVHIDSystemClient _setSILState_Off:]";
      __int16 v9 = 2114;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s for %{public}@", (uint8_t *)&v7, 0x16u);
    }
  }

  -[SSIndicatorLight setState:completion:](self->_sil, "setState:completion:", 1LL, &stru_1003D6A70);
}

- (void)_setSILState_On:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"MorseCode"] & 1) == 0)
  {
    id v5 = sub_1000838E8();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      v8 = "-[ATVHIDSystemClient _setSILState_On:]";
      __int16 v9 = 2114;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s for %{public}@", (uint8_t *)&v7, 0x16u);
    }
  }

  -[SSIndicatorLight setState:completion:](self->_sil, "setState:completion:", 2LL, &stru_1003D6A90);
}

- (void)setSILState_On
{
}

- (void)setSILState_Off
{
}

- (void)flashSILMorseCode:(id)a3
{
}

- (void).cxx_destruct
{
}

@end