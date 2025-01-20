@interface NESMVPNSessionStateStarting
- (BOOL)handleSetConfiguration;
- (NESMVPNSessionStateStarting)init;
- (void)enterWithSession:(id)a3;
- (void)handlePlugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5;
- (void)handlePluginStatusDidChangeToConnected:(id)a3;
- (void)handleSetConfigurationResult:(BOOL)a3;
- (void)handleTimeout;
@end

@implementation NESMVPNSessionStateStarting

- (NESMVPNSessionStateStarting)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateStarting;
  return -[NESMVPNSessionState initWithType:andTimeout:](&v3, "initWithType:andTimeout:", 3LL, 0LL);
}

- (void)enterWithSession:(id)a3
{
  id v4 = a3;
  kdebug_trace(726990912LL, 0LL, 0LL, 0LL, 0LL);
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateStarting;
  -[NESMVPNSessionState enterWithSession:](&v16, "enterWithSession:", v4);

  if (self)
  {
    self->_tunnelConfigurationInstallState = 1LL;
    if (!objc_msgSend(objc_getProperty(self, v5, 16, 1), "prepareConfigurationForStart"))
    {
LABEL_8:
      objc_msgSend(objc_getProperty(self, v6, 16, 1), "setLastStopReason:", 7);
      id Property = objc_getProperty(self, v13, 16LL, 1);
LABEL_9:
      [Property setState:5];
      return;
    }

    id v7 = objc_getProperty(self, v6, 16LL, 1);
  }

  else
  {
    unsigned __int8 v15 = [0 prepareConfigurationForStart];
    id v7 = 0LL;
    if ((v15 & 1) == 0) {
      goto LABEL_12;
    }
  }

  v9 = (_BYTE *)objc_claimAutoreleasedReturnValue([v7 primaryTunnelPlugin]);
  if (self) {
    id v10 = objc_getProperty(self, v8, 16LL, 1);
  }
  else {
    id v10 = 0LL;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 configuration]);
  BOOL v12 = sub_100014E78(v9, v11);

  if (!v12)
  {
    if (self) {
      goto LABEL_8;
    }
LABEL_12:
    [0 setLastStopReason:7];
    id Property = 0LL;
    goto LABEL_9;
  }

- (void)handlePlugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  kdebug_trace(726990916LL, 0LL, 0LL, 0LL, 0LL);
  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateStarting;
  -[NESMVPNSessionState handlePlugin:didStartWithPID:error:](&v36, "handlePlugin:didStartWithPID:error:", v8, v6, v9);
  if ((int)v6 < 1)
  {
    if (v9)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue([v9 domain]);
      if ([v30 isEqualToString:@"NEAgentErrorDomain"])
      {
        id v31 = [v9 code];

        if (v31 == (id)2)
        {
          if (self) {
            id Property = objc_getProperty(self, v10, 16LL, 1);
          }
          else {
            id Property = 0LL;
          }
          uint64_t v33 = 6LL;
LABEL_27:
          [Property setLastStopReason:v33];
          if (self) {
            id v35 = objc_getProperty(self, v34, 16LL, 1);
          }
          else {
            id v35 = 0LL;
          }
          [v35 setState:5];
          goto LABEL_30;
        }
      }

      else
      {
      }
    }

    if (self) {
      id Property = objc_getProperty(self, v10, 16LL, 1);
    }
    else {
      id Property = 0LL;
    }
    uint64_t v33 = 7LL;
    goto LABEL_27;
  }

  if (self) {
    id v11 = objc_getProperty(self, v10, 16LL, 1);
  }
  else {
    id v11 = 0LL;
  }
  id v12 = [v11 shouldSendIPCAttachForPlugin:v8];
  if ((_DWORD)v12)
  {
    uint64_t v14 = ne_log_obj(v12, v13);
    unsigned __int8 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      if (self) {
        id v17 = objc_getProperty(self, v16, 16LL, 1);
      }
      else {
        id v17 = 0LL;
      }
      v18 = (objc_class *)objc_opt_class(self);
      v19 = NSStringFromClass(v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      *(_DWORD *)buf = 138412546;
      id v38 = v17;
      __int16 v39 = 2112;
      v40 = v20;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@ in state %@: attaching IPC", buf, 0x16u);
    }

    sub_100016944(v8);
  }

  kdebug_trace(726990984LL, 0LL, 0LL, 0LL, 0LL);
  if (self) {
    id v22 = objc_getProperty(self, v21, 16LL, 1);
  }
  else {
    id v22 = 0LL;
  }
  v24 = (_DWORD *)objc_claimAutoreleasedReturnValue([v22 primaryTunnelPlugin]);
  if (self) {
    id v25 = objc_getProperty(self, v23, 16LL, 1);
  }
  else {
    id v25 = 0LL;
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 connectParameters]);
  v27 = v26;
  if (v24)
  {
    v24[16] = 1;
    id v28 = v26;
    v29 = (void *)objc_claimAutoreleasedReturnValue([v24 remotePluginObject]);
    [v29 connectWithParameters:v28];
  }

LABEL_30:
}

- (void)handlePluginStatusDidChangeToConnected:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateStarting;
  -[NESMVPNSessionState handlePluginStatusDidChangeToConnected:](&v6, "handlePluginStatusDidChangeToConnected:", a3);
  if (self)
  {
    int64_t tunnelConfigurationInstallState = self->_tunnelConfigurationInstallState;
    if (tunnelConfigurationInstallState == 3)
    {
      objc_msgSend(objc_getProperty(self, v4, 16, 1), "setState:", 4);
    }

    else if (tunnelConfigurationInstallState == 1)
    {
      objc_msgSend(objc_getProperty(self, v4, 16, 1), "requestInstall");
    }
  }

- (BOOL)handleSetConfiguration
{
  if (self) {
    self->_int64_t tunnelConfigurationInstallState = 2LL;
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateStarting;
  return -[NESMVPNSessionState handleSetConfiguration](&v4, "handleSetConfiguration");
}

- (void)handleSetConfigurationResult:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateStarting;
  -[NESMVPNSessionState handleSetConfigurationResult:](&v9, "handleSetConfigurationResult:", a3);
  kdebug_trace(726990932LL, 0LL, 0LL, 0LL, 0LL);
  if (self)
  {
    self->_int64_t tunnelConfigurationInstallState = 3LL;
    id v5 = objc_msgSend(objc_getProperty(self, v4, 16, 1), "primaryTunnelPlugin");
    objc_super v6 = (_DWORD *)objc_claimAutoreleasedReturnValue(v5);
    if (v6)
    {
      int v7 = v6[16];

      if (v7 == 4) {
        objc_msgSend(objc_getProperty(self, v8, 16, 1), "setState:", 4);
      }
    }
  }

- (void)handleTimeout
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateStarting;
  -[NESMVPNSessionState handleTimeout](&v6, "handleTimeout");
  if (self)
  {
    objc_msgSend(objc_getProperty(self, v3, 16, 1), "setLastStopReason:", 12);
    id Property = objc_getProperty(self, v4, 16LL, 1);
  }

  else
  {
    [0 setLastStopReason:12];
    id Property = 0LL;
  }

  [Property setState:5];
}

@end