@interface VOTSpringBoardConnection
+ (id)defaultConnection;
- (BOOL)isConnected;
- (__CFMachPort)_sbPort;
- (void)dealloc;
- (void)informConnectionDied;
- (void)restartConnection;
- (void)sendProgrammaticAppSwitch:(BOOL)a3;
- (void)setInPassthroughMode:(BOOL)a3;
- (void)setScreenCurtainEnabled:(BOOL)a3;
- (void)showElementLabelPanel:(BOOL)a3 currentLabel:(id)a4;
@end

@implementation VOTSpringBoardConnection

+ (id)defaultConnection
{
  return 0LL;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VOTSpringBoardConnection;
  -[VOTSpringBoardConnection dealloc](&v3, "dealloc");
}

- (BOOL)isConnected
{
  sbPort = self->_sbPort;
  if (sbPort) {
    LOBYTE(sbPort) = CFMachPortIsValid(sbPort) != 0;
  }
  return (char)sbPort;
}

- (void)restartConnection
{
  uint64_t v3 = bootstrap_look_up(bootstrap_port, "com.apple.SpringBoard.VOT", &sp);
  if ((_DWORD)v3)
  {
    uint64_t v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemVoiceOver sharedInstance](&OBJC_CLASS___AXSubsystemVoiceOver, "sharedInstance"));
    unsigned __int8 v6 = [v5 ignoreLogging];

    if ((v6 & 1) == 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemVoiceOver identifier](&OBJC_CLASS___AXSubsystemVoiceOver, "identifier"));
      uint64_t v8 = ((uint64_t (*)(void))AXLoggerForFacility)();
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);

      os_log_type_t v10 = AXOSLogLevelFromAXLogLevel(2LL);
      if (os_log_type_enabled(v9, v10))
      {
        uint64_t v11 = AXColorizeFormatLog(2LL, @"Could not look up SB VOT port %d");
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        uint64_t v37 = v4;
        uint64_t v13 = _AXStringForArgs(v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v9, v10))
        {
          LODWORD(buf.version) = 138543362;
          *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)v14;
          _os_log_impl((void *)&_mh_execute_header, v9, v10, "%{public}@", (uint8_t *)&buf, 0xCu);
        }
      }
    }
  }

  uint64_t v15 = sub_1000E6EAC(sp, 0x3A98u, &v39);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemVoiceOver sharedInstance](&OBJC_CLASS___AXSubsystemVoiceOver, "sharedInstance"));
  unsigned __int8 v17 = [v16 ignoreLogging];

  if ((v17 & 1) == 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemVoiceOver identifier](&OBJC_CLASS___AXSubsystemVoiceOver, "identifier"));
    uint64_t v19 = AXLoggerForFacility(v18);
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);

    os_log_type_t v21 = AXOSLogLevelFromAXLogLevel(2LL);
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = AXColorizeFormatLog(2LL, @"Restarting SB connection: status: %d");
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      uint64_t v37 = v15;
      uint64_t v24 = _AXStringForArgs(v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v20, v21))
      {
        LODWORD(buf.version) = 138543362;
        *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)v25;
        _os_log_impl((void *)&_mh_execute_header, v20, v21, "%{public}@", (uint8_t *)&buf, 0xCu);
      }
    }
  }

  -[VOTSpringBoardConnection informConnectionDied](self, "informConnectionDied", v37);
  if ((_DWORD)v15 || !v39)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemVoiceOver sharedInstance](&OBJC_CLASS___AXSubsystemVoiceOver, "sharedInstance"));
    unsigned __int8 v28 = [v27 ignoreLogging];

    if ((v28 & 1) == 0)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemVoiceOver identifier](&OBJC_CLASS___AXSubsystemVoiceOver, "identifier"));
      uint64_t v30 = AXLoggerForFacility(v29);
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);

      os_log_type_t v32 = AXOSLogLevelFromAXLogLevel(2LL);
      if (os_log_type_enabled(v31, v32))
      {
        uint64_t v33 = AXColorizeFormatLog(2LL, @"Could not connect: port: %d");
        v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
        uint64_t v35 = _AXStringForArgs(v34);
        v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v31, v32))
        {
          LODWORD(buf.version) = 138543362;
          *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)v36;
          _os_log_impl((void *)&_mh_execute_header, v31, v32, "%{public}@", (uint8_t *)&buf, 0xCu);
        }
      }
    }
  }

  else
  {
    memset(&buf, 0, sizeof(buf));
    self->_sbPort = CFMachPortCreateWithPort(0LL, sp, 0LL, &buf, 0LL);
    if (mach_port_mod_refs(mach_task_self_, sp, 0, 1) == 17)
    {
      mach_port_mod_refs(mach_task_self_, sp, 4u, 1);
      mach_port_t sp = 0;
      sbPort = self->_sbPort;
      if (sbPort)
      {
        CFRelease(sbPort);
        self->_sbPort = 0LL;
      }
    }

    [(id)VOTSharedWorkspace handleRingerSwitchSwitched:0];
  }

- (void)informConnectionDied
{
  sbmach_port_name_t Port = self->_sbPort;
  if (sbPort)
  {
    mach_port_name_t Port = CFMachPortGetPort(sbPort);
    if (Port) {
      mach_port_deallocate(mach_task_self_, Port);
    }
    v5 = self->_sbPort;
    if (v5)
    {
      CFRelease(v5);
      self->_sbmach_port_name_t Port = 0LL;
    }
  }

- (__CFMachPort)_sbPort
{
  return self->_sbPort;
}

- (void)sendProgrammaticAppSwitch:(BOOL)a3
{
  id v3 = [objc_allocWithZone(NSNumber) initWithBool:a3];
  sub_10003951C(1521, (uint64_t)v3);
}

- (void)showElementLabelPanel:(BOOL)a3 currentLabel:(id)a4
{
  uint64_t v4 = &kCFBooleanFalse;
  if (a3) {
    uint64_t v4 = &kCFBooleanTrue;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", *v4, a4, 0LL));
  sub_10003951C(1519, (uint64_t)v5);
}

- (void)setInPassthroughMode:(BOOL)a3
{
}

- (void)setScreenCurtainEnabled:(BOOL)a3
{
}

@end