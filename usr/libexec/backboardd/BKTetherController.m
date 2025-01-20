@interface BKTetherController
+ (id)sharedInstance;
- (BKTetherController)init;
- (BOOL)_reverseTetheringActive;
- (BOOL)_serviceExists:(__CFString *)a3;
- (BOOL)isOrientationNotificationDisabled;
- (BOOL)isTethered;
- (BOOL)usesDisplayPortTethering;
- (unsigned)_demoCardConnection;
- (void)_handleDemoModeChanged;
- (void)_postDisplayPortNotificationCode:(int)a3;
- (void)_setTetherState:(int)a3;
- (void)dealloc;
- (void)noteInterfaceOrientationChangedWithInterfaceOrientation:(int)a3;
- (void)setDitheringEnabled:(int)a3;
- (void)setOrientationNotificationDisabled:(BOOL)a3;
- (void)updatePreferencesIfNeeded;
@end

@implementation BKTetherController

- (BKTetherController)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___BKTetherController;
  v2 = -[BKTetherController init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    if (-[BKTetherController usesDisplayPortTethering](v2, "usesDisplayPortTethering"))
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver( DarwinNotifyCenter,  v3,  (CFNotificationCallback)sub_100042AE0,  @"com.apple.mobile.demo_mode_changed",  0LL,  CFNotificationSuspensionBehaviorDrop);
      v3->_lastOrientationCode = -1;
    }

    if (-[BKTetherController isTethered](v3, "isTethered"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKSDefaults localDefaults](&OBJC_CLASS___BKSDefaults, "localDefaults"));
      id v6 = [v5 isDitheringEnabled];

      -[BKTetherController setDitheringEnabled:](v3, "setDitheringEnabled:", v6);
    }
  }

  return v3;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___BKTetherController;
  -[BKTetherController dealloc](&v4, "dealloc");
}

- (unsigned)_demoCardConnection
{
  kern_return_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  io_iterator_t existing;
  mach_port_t mainPort;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  const char *v25;
  p_demoCardConnection = &self->_demoCardConnection;
  unsigned int result = self->_demoCardConnection;
  if (!result)
  {
    uint64_t v4 = IOMainPort(0, &mainPort);
    if ((_DWORD)v4)
    {
      uint64_t v5 = BKLogCommon(v4);
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v23 = "-[BKTetherController _demoCardConnection]";
        v7 = "%s IOMainPort failed";
LABEL_5:
        objc_super v8 = v6;
        uint32_t v9 = 12;
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
        goto LABEL_14;
      }

      goto LABEL_14;
    }

    v10 = IOServiceMatching("AppleTetheredDevice");
    if (v10)
    {
      uint64_t MatchingServices = IOServiceGetMatchingServices(mainPort, v10, &existing);
      if ((_DWORD)MatchingServices)
      {
        uint64_t v12 = BKLogCommon(MatchingServices);
        id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v23 = "-[BKTetherController _demoCardConnection]";
          v7 = "%s IOServiceGetMatchingServices failed";
          goto LABEL_5;
        }

- (void)_postDisplayPortNotificationCode:(int)a3
{
  uint64_t v4 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"com.apple.mobile.demo.mode-%d",  *(void *)&a3);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v4, 0LL, 0LL, 1u);
  uint64_t v6 = BKLogDetailed();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    int v9 = a3;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "DEMO MODE NOTIFICATION: %d", buf, 8u);
  }
}

- (void)_setTetherState:(int)a3
{
  if (self->_tetherState != a3)
  {
    if (-[BKTetherController usesDisplayPortTethering](self, "usesDisplayPortTethering"))
    {
      if (a3 == 1)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterAddObserver( DarwinNotifyCenter,  self,  (CFNotificationCallback)sub_100042A94,  @"com.apple.backboardd.deviceinterfaceorientation",  0LL,  CFNotificationSuspensionBehaviorDrop);
        CFNotificationCenterAddObserver( DarwinNotifyCenter,  self,  (CFNotificationCallback)sub_100042A94,  @"com.apple.springboard.hasBlankedScreen",  0LL,  CFNotificationSuspensionBehaviorDrop);
      }

      else if (self->_tetherState == 1)
      {
        uint64_t v6 = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterRemoveObserver(v6, self, @"com.apple.backboardd.deviceinterfaceorientation", 0LL);
        CFNotificationCenterRemoveObserver(v6, self, @"com.apple.springboard.hasBlankedScreen", 0LL);
        self->_lastOrientationCode = -1;
      }
    }

    self->_tetherState = a3;
  }

- (BOOL)isTethered
{
  if (self->_tetherState) {
    return self->_tetherState == 1;
  }
  if (!-[BKTetherController usesDisplayPortTethering](self, "usesDisplayPortTethering"))
  {
    mach_port_t v10 = -[BKTetherController _demoCardConnection](self, "_demoCardConnection");
    if (v10)
    {
      uint64_t input = 0LL;
      uint32_t outputCnt = 0;
      if (IOConnectCallScalarMethod(v10, 0, &input, 1u, 0LL, &outputCnt)) {
        uint64_t v11 = 2LL;
      }
      else {
        uint64_t v11 = 1LL;
      }
    }

    else
    {
      uint64_t v11 = 2LL;
    }

    uint64_t v6 = self;
    goto LABEL_15;
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKSDefaults externalDefaults](&OBJC_CLASS___BKSDefaults, "externalDefaults"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 lockdownDefaults]);
  unsigned int v5 = [v4 tetheredDisplayPortMode];

  uint64_t v6 = self;
  if (!v5)
  {
    uint64_t v11 = 2LL;
LABEL_15:
    -[BKTetherController _setTetherState:](v6, "_setTetherState:", v11);
    return self->_tetherState == 1;
  }

  else {
    uint64_t v7 = 8LL;
  }
  -[BKTetherController _postDisplayPortNotificationCode:](self, "_postDisplayPortNotificationCode:", v7);
  id v8 = sub_100065B98();
  int v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[BKTetherController noteInterfaceOrientationChangedWithInterfaceOrientation:]( self,  "noteInterfaceOrientationChangedWithInterfaceOrientation:",  sub_1000667B0((uint64_t)v9));

  return self->_tetherState == 1;
}

- (BOOL)usesDisplayPortTethering
{
  if (qword_1000DC118 != -1) {
    dispatch_once(&qword_1000DC118, &stru_1000B6ED0);
  }
  return byte_1000DC110;
}

- (void)_handleDemoModeChanged
{
  if (-[BKTetherController usesDisplayPortTethering](self, "usesDisplayPortTethering"))
  {
    -[BKTetherController _setTetherState:](self, "_setTetherState:", 0LL);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 postNotificationName:@"BKTetherControllerTetherStateChangedNotification" object:self];

    uint64_t v4 = BKLogDetailed();
    unsigned int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v7 = -[BKTetherController isTethered](self, "isTethered");
      id v8 = @"not tethered";
      if (v7) {
        id v8 = @"tethered";
      }
      int v9 = 138412290;
      mach_port_t v10 = v8;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "DEMO MODE CHANGED: Now %@",  (uint8_t *)&v9,  0xCu);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification( DarwinNotifyCenter,  @"com.apple.backboardd.tetherStateChanged",  0LL,  0LL,  1u);
  }

- (void)noteInterfaceOrientationChangedWithInterfaceOrientation:(int)a3
{
  if (-[BKTetherController usesDisplayPortTethering](self, "usesDisplayPortTethering"))
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKDisplayController sharedInstance](&OBJC_CLASS___BKDisplayController, "sharedInstance"));
    unsigned __int8 v6 = [v5 displayIsBlanked:0];

    if ((v6 & 1) == 0)
    {
      buf[0] = 0;
      input[0] = (uint64_t)_NSConcreteStackBlock;
      input[1] = 3221225472LL;
      input[2] = (uint64_t)sub_100019A3C;
      input[3] = (uint64_t)&unk_1000B5E90;
      memset(&input[4], 0, 24);
      input[7] = (uint64_t)buf;
      input[8] = 0LL;
      input[9] = 0LL;
      sub_1000196F4(input);
      switch(a3)
      {
        case 1:
          if (buf[0] == 3) {
            unsigned int v10 = 2;
          }
          else {
            unsigned int v10 = 1;
          }
          BOOL v11 = buf[0] == 1;
          unsigned int v12 = 3;
          goto LABEL_34;
        case 2:
          if (buf[0] == 3) {
            unsigned int v10 = 3;
          }
          else {
            unsigned int v10 = 4;
          }
          BOOL v11 = buf[0] == 1;
          unsigned int v12 = 2;
          goto LABEL_34;
        case 3:
          if (buf[0] == 3) {
            unsigned int v17 = 4;
          }
          else {
            unsigned int v17 = 2;
          }
          if (buf[0] == 1) {
            uint64_t v7 = 1LL;
          }
          else {
            uint64_t v7 = v17;
          }
          goto LABEL_37;
        case 4:
          if (buf[0] == 3) {
            unsigned int v10 = 1;
          }
          else {
            unsigned int v10 = 3;
          }
          BOOL v11 = buf[0] == 1;
          unsigned int v12 = 4;
LABEL_34:
          if (v11) {
            uint64_t v7 = v12;
          }
          else {
            uint64_t v7 = v10;
          }
          goto LABEL_37;
        default:
          return;
      }
    }

    uint64_t v7 = 5LL;
LABEL_37:
    if ((_DWORD)v7 != self->_lastOrientationCode)
    {
      if (!self->_orientationNotificationsDisabled) {
        -[BKTetherController _postDisplayPortNotificationCode:](self, "_postDisplayPortNotificationCode:", v7);
      }
      self->_lastOrientationCode = v7;
    }

    return;
  }

  mach_port_t v8 = -[BKTetherController _demoCardConnection](self, "_demoCardConnection");
  if (!v8) {
    return;
  }
  uint64_t v9 = a3;
  input[0] = 0LL;
  if (a3 == 4LL)
  {
    uint64_t v9 = 2LL;
  }

  else if (a3 != 3LL)
  {
    if (a3 != 2LL) {
      goto LABEL_16;
    }
    uint64_t v9 = 1LL;
  }

  input[0] = v9;
LABEL_16:
  uint32_t outputCnt = 0;
  uint64_t v13 = IOConnectCallScalarMethod(v8, 1u, input, 1u, 0LL, &outputCnt);
  if ((_DWORD)v13)
  {
    int v14 = v13;
    uint64_t v15 = BKLogCommon(v13);
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v21 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Demo card rotation failed, unsigned int result = %08x\n",  buf,  8u);
    }
  }

- (void)setDitheringEnabled:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v4 = IOServiceMatching("AppleH1CLCD");
  uint64_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v4);
  if (!(_DWORD)MatchingService)
  {
    unsigned __int8 v6 = IOServiceMatching("AppleM2CLCD");
    uint64_t v7 = IOServiceGetMatchingService(kIOMainPortDefault, v6);
    uint64_t MatchingService = v7;
    if (!(_DWORD)v7)
    {
      uint64_t v19 = BKLogCommon(v7);
      BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v21 = 0;
        unsigned int v12 = "Couldn't find framebuffer service";
        uint64_t v13 = v21;
        goto LABEL_12;
      }

- (BOOL)_serviceExists:(__CFString *)a3
{
  uint64_t v4 = BKLogCommon(self);
  unsigned int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Reverse-Tethering - Looking for Service",  buf,  2u);
  }

  unsigned __int8 v6 = getprogname();
  uint64_t v7 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%s-%s", v6, "com.apple.Preferences.reverse-tethering");
  SCPreferencesRef v8 = SCPreferencesCreateWithAuthorization(kCFAllocatorDefault, v7, 0LL, 0LL);
  uint64_t v9 = v8;
  if (v7) {
    CFRelease(v7);
  }
  if (!v9
    || !SCPreferencesLock(v9, 1u)
    && (SCPreferencesSynchronize(v9), SCPreferencesRef v8 = (SCPreferencesRef)SCPreferencesLock(v9, 1u), !(_DWORD)v8))
  {
    BOOL v20 = 0;
    BOOL v11 = 0LL;
    int v19 = 1001;
LABEL_22:
    uint64_t v21 = BKLogCommon(v8);
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v27 = v19;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "R-Tether Exists - Error Code: %d", buf, 8u);
    }

    goto LABEL_25;
  }

  uint64_t v10 = SCNetworkServiceCopyAll(v9);
  BOOL v11 = v10;
  if (v10)
  {
    CFIndex Count = CFArrayGetCount(v10);
    if (Count < 1)
    {
LABEL_16:
      int v19 = 0;
      BOOL v20 = 0;
    }

    else
    {
      CFIndex v13 = Count;
      CFIndex v14 = 0LL;
      while (1)
      {
        ValueAtIndex = (const __SCNetworkService *)CFArrayGetValueAtIndex(v11, v14);
        if (ValueAtIndex)
        {
          Interface = SCNetworkServiceGetInterface(ValueAtIndex);
          if (Interface)
          {
            CFStringRef BSDName = SCNetworkInterfaceGetBSDName(Interface);
            if (BSDName)
            {
              uint64_t v18 = CFEqual(BSDName, a3);
              if ((_DWORD)v18) {
                break;
              }
            }
          }
        }

        if (v13 == ++v14) {
          goto LABEL_16;
        }
      }

      uint64_t v24 = BKLogCommon(v18);
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Reverse-Tethering - Service Found",  buf,  2u);
      }

      int v19 = 0;
      BOOL v20 = 1;
    }
  }

  else
  {
    BOOL v20 = 0;
    int v19 = 1001;
  }

  SCPreferencesRef v8 = (SCPreferencesRef)SCPreferencesUnlock(v9);
  if (!(_DWORD)v8)
  {
    SCPreferencesRef v8 = (SCPreferencesRef)SCError();
    int v19 = (int)v8;
  }

  if (v19) {
    goto LABEL_22;
  }
LABEL_25:
  if (v11) {
    CFRelease(v11);
  }
  if (v9) {
    CFRelease(v9);
  }
  return v20;
}

- (BOOL)_reverseTetheringActive
{
  uint64_t v3 = BKLogCommon(self);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Reverse-Tethering - Getting State", buf, 2u);
  }

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v6 = [v5 fileExistsAtPath:@"/Library/Preferences/SystemConfiguration/rtether.plist"];

  if (!v6) {
    goto LABEL_12;
  }
  uint64_t v7 = IOServiceMatching("IOEthernetInterface");
  if (!v7)
  {
    uint64_t v15 = BKLogCommon(0LL);
    BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      unsigned int v12 = "Can't create a service matching dictionary\n";
      CFIndex v13 = v11;
      uint32_t v14 = 2;
      goto LABEL_10;
    }

- (void)updatePreferencesIfNeeded
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[BKSDefaults localDefaults](&OBJC_CLASS___BKSDefaults, "localDefaults"));
  if (-[BKTetherController isTethered](self, "isTethered")
    && ([v6 ignoreTetheringPreferences] & 1) == 0)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification( DarwinNotifyCenter,  @"com.apple.backboardd.tetherPrefsNeedUpdate",  0LL,  0LL,  1u);
    [v6 setDitheringEnabled:0];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKSDefaults externalDefaults](&OBJC_CLASS___BKSDefaults, "externalDefaults"));
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 persistentConnectionDefaults]);

    [v5 setForceDemoMaxHBI:300];
    if (-[BKTetherController _reverseTetheringActive](self, "_reverseTetheringActive")) {
      [v5 setWifiInterfaceName:@"en1"];
    }
  }
}

- (BOOL)isOrientationNotificationDisabled
{
  return self->_orientationNotificationsDisabled;
}

- (void)setOrientationNotificationDisabled:(BOOL)a3
{
  self->_orientationNotificationsDisabled = a3;
}

+ (id)sharedInstance
{
  if (qword_1000DC108 != -1) {
    dispatch_once(&qword_1000DC108, &stru_1000B6EB0);
  }
  return (id)qword_1000DC100;
}

@end