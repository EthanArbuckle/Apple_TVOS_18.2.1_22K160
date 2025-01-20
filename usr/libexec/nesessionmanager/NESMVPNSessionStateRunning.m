@interface NESMVPNSessionStateRunning
- (BOOL)handleSleep;
- (NESMVPNSessionStateRunning)init;
- (void)handleInterfaceUnavailable:(id)a3;
- (void)handlePluginStatusDidChangeToReasserting:(id)a3;
- (void)handleUserLogout;
- (void)handleUserSwitch;
@end

@implementation NESMVPNSessionStateRunning

- (NESMVPNSessionStateRunning)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateRunning;
  return -[NESMVPNSessionState initWithType:andTimeout:](&v3, "initWithType:andTimeout:", 4LL, 0LL);
}

- (BOOL)handleSleep
{
  v2 = self;
  if (self) {
    self = (NESMVPNSessionStateRunning *)objc_getProperty(self, a2, 16LL, 1);
  }
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSessionStateRunning protocol](self, "protocol"));
  unsigned int v4 = [v3 disconnectOnSleep];

  if (v4)
  {
    uint64_t v7 = ne_log_obj(v5, v6);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (v2) {
        id Property = objc_getProperty(v2, v9, 16LL, 1);
      }
      else {
        id Property = 0LL;
      }
      v11 = (objc_class *)objc_opt_class(v2);
      v12 = NSStringFromClass(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      *(_DWORD *)buf = 138412546;
      id v21 = Property;
      __int16 v22 = 2112;
      v23 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: delaying sleep until disconnected",  buf,  0x16u);
    }

    if (v2)
    {
      objc_msgSend(objc_getProperty(v2, v14, 16, 1), "setSleepOnDisconnect:", 1);
      objc_msgSend(objc_getProperty(v2, v15, 16, 1), "setLastStopReason:", 9);
      id v17 = objc_getProperty(v2, v16, 16LL, 1);
    }

    else
    {
      [0 setSleepOnDisconnect:1];
      [0 setLastStopReason:9];
      id v17 = 0LL;
    }

    [v17 setState:5];
  }

  else
  {
    v19.receiver = v2;
    v19.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateRunning;
    -[NESMVPNSessionState handleSleep](&v19, "handleSleep");
  }

  return 1;
}

- (void)handleUserSwitch
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateRunning;
  -[NESMVPNSessionState handleUserSwitch](&v2, "handleUserSwitch");
}

- (void)handleUserLogout
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateRunning;
  -[NESMVPNSessionState handleUserLogout](&v2, "handleUserLogout");
}

- (void)handlePluginStatusDidChangeToReasserting:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateRunning;
  -[NESMVPNSessionState handlePluginStatusDidChangeToReasserting:](&v6, "handlePluginStatusDidChangeToReasserting:", a3);
  if (self) {
    id Property = objc_getProperty(self, v4, 16LL, 1);
  }
  else {
    id Property = 0LL;
  }
  [Property setState:6];
}

- (void)handleInterfaceUnavailable:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateRunning;
  -[NESMVPNSessionState handleInterfaceUnavailable:](&v6, "handleInterfaceUnavailable:", a3);
  if (self) {
    id Property = objc_getProperty(self, v4, 16LL, 1);
  }
  else {
    id Property = 0LL;
  }
  [Property setState:6];
}

@end