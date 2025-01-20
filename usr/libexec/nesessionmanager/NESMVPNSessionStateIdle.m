@interface NESMVPNSessionStateIdle
- (BOOL)handleClearConfiguration;
- (BOOL)handleSetConfiguration;
- (NESMVPNSessionStateIdle)init;
- (void)enterWithSession:(id)a3;
- (void)handleClearConfigurationResult:(BOOL)a3;
- (void)handleEstablishIPC;
- (void)handleSetConfigurationResult:(BOOL)a3;
- (void)handleStartMessage:(id)a3;
- (void)handleUpdateConfiguration;
- (void)leave;
@end

@implementation NESMVPNSessionStateIdle

- (NESMVPNSessionStateIdle)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateIdle;
  return -[NESMVPNSessionState initWithType:andTimeout:](&v3, "initWithType:andTimeout:", 1LL, 0LL);
}

- (void)enterWithSession:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateIdle;
  id v4 = a3;
  -[NESMVPNSessionState enterWithSession:](&v18, "enterWithSession:", v4);
  sub_100029040(v4);

  if (self)
  {
    id Property = objc_getProperty(self, v5, 16LL, 1);
    id v8 = objc_getProperty(self, v7, 16LL, 1);
  }

  else
  {
    unsigned __int8 v17 = objc_msgSend(0, "sleepOnDisconnect", v18.receiver, v18.super_class);
    id v8 = 0LL;
    id v16 = 0LL;
    if ((v17 & 1) == 0) {
      goto LABEL_16;
    }
  }

  if ([v8 parentType] == (id)2)
  {
    if (self) {
      id v10 = objc_getProperty(self, v9, 16LL, 1);
    }
    else {
      id v10 = 0LL;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue([v10 parent]);
    if (self) {
      objc_getProperty(self, v11, 16LL, 1);
    }
    sub_100085770(v12);
  }

  else
  {
    if (self) {
      id v13 = objc_getProperty(self, v9, 16LL, 1);
    }
    else {
      id v13 = 0LL;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue([v13 server]);
    sub_100051C0C(v12, v14);
  }

  if (!self)
  {
    [0 setSleepOnDisconnect:0];
    id v16 = 0LL;
    goto LABEL_16;
  }

  objc_msgSend(objc_getProperty(self, v15, 16, 1), "setSleepOnDisconnect:", 0);
LABEL_15:
  self->_establishIPCWhenEnabled = 0;
  id v16 = objc_getProperty(self, v7, 16LL, 1);
LABEL_16:
  [v16 setRestartPending:0];
}

- (void)leave
{
  v2 = self;
  if (self) {
    self = (NESMVPNSessionStateIdle *)objc_getProperty(self, a2, 16LL, 1);
  }
  sub_100029040(self);
  v3.receiver = v2;
  v3.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateIdle;
  -[NESMVPNSessionState leave](&v3, "leave");
}

- (void)handleStartMessage:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateIdle;
  -[NESMVPNSessionState handleStartMessage:](&v8, "handleStartMessage:", v4);
  if (self)
  {
    objc_msgSend(objc_getProperty(self, v5, 16, 1), "createConnectParametersWithStartMessage:", v4);
    id Property = objc_getProperty(self, v6, 16LL, 1);
  }

  else
  {
    [0 createConnectParametersWithStartMessage:v4];
    id Property = 0LL;
  }

  [Property setState:2];
}

- (void)handleEstablishIPC
{
  uint64_t v3 = ne_log_obj(self, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v5, 16LL, 1);
    }
    else {
      id Property = 0LL;
    }
    v7 = (objc_class *)objc_opt_class(self);
    objc_super v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v29 = 138412546;
    id v30 = Property;
    __int16 v31 = 2112;
    v32 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: received establish IPC message",  (uint8_t *)&v29,  0x16u);
  }

  if (self) {
    id v11 = objc_getProperty(self, v10, 16LL, 1);
  }
  else {
    id v11 = 0LL;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 configuration]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 VPN]);
  if ([v13 isEnabled])
  {

LABEL_12:
    if (self) {
      id v21 = objc_getProperty(self, v15, 16LL, 1);
    }
    else {
      id v21 = 0LL;
    }
    [v21 setState:10];
    return;
  }

  if (self) {
    id v16 = objc_getProperty(self, v14, 16LL, 1);
  }
  else {
    id v16 = 0LL;
  }
  unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 configuration]);
  objc_super v18 = (void *)objc_claimAutoreleasedReturnValue([v17 appVPN]);
  unsigned __int8 v19 = [v18 isEnabled];

  if ((v19 & 1) != 0) {
    goto LABEL_12;
  }
  uint64_t v22 = ne_log_obj(v20, v15);
  v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id v25 = objc_getProperty(self, v24, 16LL, 1);
    }
    else {
      id v25 = 0LL;
    }
    v26 = (objc_class *)objc_opt_class(self);
    v27 = NSStringFromClass(v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    int v29 = 138412546;
    id v30 = v25;
    __int16 v31 = 2112;
    v32 = v28;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: delaying IPC establish until the configuration is enabled",  (uint8_t *)&v29,  0x16u);
  }

  if (self) {
    self->_establishIPCWhenEnabled = 1;
  }
}

- (void)handleUpdateConfiguration
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateIdle;
  -[NESMVPNSessionState handleUpdateConfiguration](&v21, "handleUpdateConfiguration");
  if (self) {
    id Property = objc_getProperty(self, v3, 16LL, 1);
  }
  else {
    id Property = 0LL;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue([Property configuration]);
  SEL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 VPN]);
  if ([v6 isEnabled])
  {

    if (!self) {
      return;
    }
  }

  else
  {
    if (self) {
      id v10 = objc_getProperty(self, v7, 16LL, 1);
    }
    else {
      id v10 = 0LL;
    }
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 configuration]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 appVPN]);
    unsigned int v13 = [v12 isEnabled];

    if (!self || !v13) {
      return;
    }
  }

  if (self->_establishIPCWhenEnabled)
  {
    uint64_t v14 = ne_log_obj(v8, v9);
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = objc_getProperty(self, v16, 16LL, 1);
      objc_super v18 = (objc_class *)objc_opt_class(self);
      unsigned __int8 v19 = NSStringFromClass(v18);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      *(_DWORD *)buf = 138412546;
      id v23 = v17;
      __int16 v24 = 2112;
      id v25 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: the configuration is now enabled, establishing IPC",  buf,  0x16u);
    }

    self->_establishIPCWhenEnabled = 0;
    -[NESMVPNSessionStateIdle handleEstablishIPC](self, "handleEstablishIPC");
  }

- (BOOL)handleSetConfiguration
{
  uint64_t v3 = ne_log_obj(self, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v5, 16LL, 1);
    }
    else {
      id Property = 0LL;
    }
    v7 = (objc_class *)objc_opt_class(self);
    uint64_t v8 = NSStringFromClass(v7);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v11 = 138412546;
    id v12 = Property;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: plugin is idle, ignoring set configuration request",  (uint8_t *)&v11,  0x16u);
  }

  return 0;
}

- (void)handleSetConfigurationResult:(BOOL)a3
{
  uint64_t v4 = ne_log_obj(self, a2);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v6, 16LL, 1);
    }
    else {
      id Property = 0LL;
    }
    uint64_t v8 = (objc_class *)objc_opt_class(self);
    uint64_t v9 = NSStringFromClass(v8);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    int v11 = 138412546;
    id v12 = Property;
    __int16 v13 = 2112;
    uint64_t v14 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: plugin is idle, ignoring set configuration result",  (uint8_t *)&v11,  0x16u);
  }
}

- (BOOL)handleClearConfiguration
{
  uint64_t v3 = ne_log_obj(self, a2);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v5, 16LL, 1);
    }
    else {
      id Property = 0LL;
    }
    v7 = (objc_class *)objc_opt_class(self);
    uint64_t v8 = NSStringFromClass(v7);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v11 = 138412546;
    id v12 = Property;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: plugin is idle, ignoring clear configuration request",  (uint8_t *)&v11,  0x16u);
  }

  return 0;
}

- (void)handleClearConfigurationResult:(BOOL)a3
{
  uint64_t v4 = ne_log_obj(self, a2);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v6, 16LL, 1);
    }
    else {
      id Property = 0LL;
    }
    uint64_t v8 = (objc_class *)objc_opt_class(self);
    uint64_t v9 = NSStringFromClass(v8);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    int v11 = 138412546;
    id v12 = Property;
    __int16 v13 = 2112;
    uint64_t v14 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: plugin is idle, ignoring clear configuration result",  (uint8_t *)&v11,  0x16u);
  }
}

@end