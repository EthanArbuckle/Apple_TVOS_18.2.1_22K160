@interface NESMVPNSessionStateReasserting
- (BOOL)handleSetConfiguration;
- (BOOL)handleSleep;
- (NESMVPNSessionStateReasserting)init;
- (void)enterWithSession:(id)a3;
- (void)handleInterfaceAvailable:(id)a3 changed:(BOOL)a4;
- (void)handlePluginStatusDidChangeToConnected:(id)a3;
- (void)handleSetConfigurationResult:(BOOL)a3;
- (void)handleTimeout;
- (void)handleUserLogout;
- (void)handleUserSwitch;
@end

@implementation NESMVPNSessionStateReasserting

- (NESMVPNSessionStateReasserting)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateReasserting;
  return -[NESMVPNSessionState initWithType:andTimeout:](&v3, "initWithType:andTimeout:", 6LL, 0LL);
}

- (void)enterWithSession:(id)a3
{
  if (self) {
    self->_setConfigurationInProgress = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateReasserting;
  -[NESMVPNSessionState enterWithSession:](&v3, "enterWithSession:", a3);
}

- (void)handleInterfaceAvailable:(id)a3 changed:(BOOL)a4
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateReasserting;
  -[NESMVPNSessionState handleInterfaceAvailable:changed:](&v20, "handleInterfaceAvailable:changed:", a3, a4);
  if (self) {
    id Property = objc_getProperty(self, v5, 16LL, 1);
  }
  else {
    id Property = 0LL;
  }
  v7 = (_DWORD *)objc_claimAutoreleasedReturnValue([Property primaryTunnelPlugin]);
  if (v7)
  {
    int v9 = v7[16];

    if (v9 == 5) {
      return;
    }
  }

  if (!self)
  {
    unsigned __int8 v19 = [0 reassertedByPlugin];
    id v10 = 0LL;
    if ((v19 & 1) != 0) {
      goto LABEL_7;
    }
LABEL_13:
    [v10 setState:4];
    return;
  }

  id v10 = objc_msgSend(objc_getProperty(self, v8, 16, 1), "reassertedByPlugin");
  if (!(_DWORD)v10)
  {
    id v10 = objc_getProperty(self, v11, 16LL, 1);
    goto LABEL_13;
  }

- (void)handleTimeout
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateReasserting;
  -[NESMVPNSessionState handleTimeout](&v6, "handleTimeout");
  if (self)
  {
    objc_msgSend(objc_getProperty(self, v3, 16, 1), "setLastStopReason:", 13);
    id Property = objc_getProperty(self, v4, 16LL, 1);
  }

  else
  {
    [0 setLastStopReason:13];
    id Property = 0LL;
  }

  [Property setState:5];
}

- (void)handlePluginStatusDidChangeToConnected:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateReasserting;
  -[NESMVPNSessionState handlePluginStatusDidChangeToConnected:](&v6, "handlePluginStatusDidChangeToConnected:", a3);
  if (self)
  {
    if (self->_setConfigurationInProgress) {
      return;
    }
    id Property = objc_getProperty(self, v4, 16LL, 1);
  }

  else
  {
    id Property = 0LL;
  }

  [Property setState:4];
}

- (BOOL)handleSleep
{
  v2 = self;
  if (self) {
    self = (NESMVPNSessionStateReasserting *)objc_getProperty(self, a2, 16LL, 1);
  }
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSessionStateReasserting protocol](self, "protocol"));
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
      uint64_t v12 = NSStringFromClass(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      *(_DWORD *)buf = 138412546;
      id v21 = Property;
      __int16 v22 = 2112;
      __int16 v23 = v13;
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
    v19.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateReasserting;
    -[NESMVPNSessionState handleSleep](&v19, "handleSleep");
  }

  return 1;
}

- (void)handleUserSwitch
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateReasserting;
  -[NESMVPNSessionState handleUserSwitch](&v2, "handleUserSwitch");
}

- (void)handleUserLogout
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateReasserting;
  -[NESMVPNSessionState handleUserLogout](&v2, "handleUserLogout");
}

- (BOOL)handleSetConfiguration
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateReasserting;
  BOOL v3 = -[NESMVPNSessionState handleSetConfiguration](&v5, "handleSetConfiguration");
  if (self && v3) {
    self->_setConfigurationInProgress = 1;
  }
  return v3;
}

- (void)handleSetConfigurationResult:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateReasserting;
  -[NESMVPNSessionState handleSetConfigurationResult:](&v10, "handleSetConfigurationResult:", a3);
  if (self)
  {
    self->_setConfigurationInProgress = 0;
    id Property = objc_getProperty(self, v4, 16LL, 1);
  }

  else
  {
    id Property = 0LL;
  }

  uint64_t v6 = (_DWORD *)objc_claimAutoreleasedReturnValue([Property primaryTunnelPlugin]);
  if (v6)
  {
    int v7 = v6[16];

    if (v7 == 4)
    {
      if (self) {
        id v9 = objc_getProperty(self, v8, 16LL, 1);
      }
      else {
        id v9 = 0LL;
      }
      [v9 setState:4];
    }
  }

@end