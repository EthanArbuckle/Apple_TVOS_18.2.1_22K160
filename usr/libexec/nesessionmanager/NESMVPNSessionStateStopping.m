@interface NESMVPNSessionStateStopping
- (BOOL)handleClearConfiguration;
- (BOOL)handleSetConfiguration;
- (NESMVPNSessionStateStopping)init;
- (void)enterWithSession:(id)a3;
- (void)handleClearConfigurationResult:(BOOL)a3;
- (void)handleEstablishIPC;
- (void)handlePlugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5;
- (void)handlePlugin:(id)a3 statusDidChangeToDisconnectedWithReason:(int)a4;
- (void)handleSetConfigurationResult:(BOOL)a3;
- (void)handleTimeout;
@end

@implementation NESMVPNSessionStateStopping

- (NESMVPNSessionStateStopping)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateStopping;
  return -[NESMVPNSessionState initWithType:andTimeout:](&v3, "initWithType:andTimeout:", 5LL, 20LL);
}

- (void)enterWithSession:(id)a3
{
  if (self)
  {
    self->_isUninstalled = 0;
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateStopping;
    -[NESMVPNSessionState enterWithSession:](&v6, "enterWithSession:", a3);
    id Property = objc_getProperty(self, v4, 16LL, 1);
  }

  else
  {
    v6.receiver = 0LL;
    v6.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateStopping;
    -[NESMVPNSessionState enterWithSession:](&v6, "enterWithSession:", a3);
    id Property = 0LL;
  }

  [Property requestUninstall];
}

- (BOOL)handleSetConfiguration
{
  uint64_t v3 = ne_log_obj(self, a2);
  SEL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v5, 16LL, 1);
    }
    else {
      id Property = 0LL;
    }
    v7 = (objc_class *)objc_opt_class(self);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v11 = 138412546;
    id v12 = Property;
    __int16 v13 = 2112;
    v14 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: plugin disconnecting, ignoring set configuration request",  (uint8_t *)&v11,  0x16u);
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
    v8 = (objc_class *)objc_opt_class(self);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    int v11 = 138412546;
    id v12 = Property;
    __int16 v13 = 2112;
    v14 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: plugin disconnecting, ignoring set configuration result",  (uint8_t *)&v11,  0x16u);
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
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v11 = 138412546;
    id v12 = Property;
    __int16 v13 = 2112;
    v14 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: plugin disconnecting, ignoring clear configuration request",  (uint8_t *)&v11,  0x16u);
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
    v8 = (objc_class *)objc_opt_class(self);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    int v56 = 138412546;
    id v57 = Property;
    __int16 v58 = 2112;
    v59 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: session is now uninstalled",  (uint8_t *)&v56,  0x16u);
  }

  if (self)
  {
    objc_msgSend(objc_getProperty(self, v11, 16, 1), "setPluginConfigurationEntities:", 0);
    self->_isUninstalled = 1;
    id v13 = objc_getProperty(self, v12, 16LL, 1);
  }

  else
  {
    [0 setPluginConfigurationEntities:0];
    id v13 = 0LL;
  }

  if ([v13 virtualInterface])
  {
    if (self)
    {
      id v15 = objc_msgSend(objc_getProperty(self, v14, 16, 1), "virtualInterface");
      NEVirtualInterfaceInvalidate(v15);
      id v17 = objc_getProperty(self, v16, 16LL, 1);
    }

    else
    {
      NEVirtualInterfaceInvalidate([0 virtualInterface]);
      id v17 = 0LL;
    }

    CFRelease([v17 virtualInterface]);
    if (self) {
      id v19 = objc_getProperty(self, v18, 16LL, 1);
    }
    else {
      id v19 = 0LL;
    }
    [v19 setVirtualInterface:0];
  }

  if (self) {
    id v20 = objc_getProperty(self, v14, 16LL, 1);
  }
  else {
    id v20 = 0LL;
  }
  uint64_t v21 = objc_claimAutoreleasedReturnValue([v20 primaryTunnelPlugin]);
  v23 = (void *)v21;
  if (v21 && *(_DWORD *)(v21 + 64) == 6) {
    goto LABEL_32;
  }
  if (self) {
    id v24 = objc_getProperty(self, v22, 16LL, 1);
  }
  else {
    id v24 = 0LL;
  }
  v25 = (_DWORD *)objc_claimAutoreleasedReturnValue([v24 primaryTunnelPlugin]);
  if (!v25)
  {
    v42 = 0LL;
    goto LABEL_31;
  }

  int v26 = v25[16];

  if (!v26) {
    goto LABEL_33;
  }
  uint64_t v29 = ne_log_obj(v27, v28);
  v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id v32 = objc_getProperty(self, v31, 16LL, 1);
    }
    else {
      id v32 = 0LL;
    }
    v33 = (objc_class *)objc_opt_class(self);
    v34 = NSStringFromClass(v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    int v56 = 138412546;
    id v57 = v32;
    __int16 v58 = 2112;
    v59 = v35;
    _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: disconnecting the plugin",  (uint8_t *)&v56,  0x16u);
  }

  if (self) {
    id v37 = objc_getProperty(self, v36, 16LL, 1);
  }
  else {
    id v37 = 0LL;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue([v37 primaryTunnelPlugin]);
  if (self) {
    id v39 = objc_getProperty(self, v38, 16LL, 1);
  }
  else {
    id v39 = 0LL;
  }
  id v40 = [v39 lastStopReason];
  if (v23)
  {
    id v41 = v40;
    v42 = (void *)objc_claimAutoreleasedReturnValue([v23 remotePluginObject]);
    [v42 disconnectWithReason:v41];
LABEL_31:
  }

- (void)handlePlugin:(id)a3 statusDidChangeToDisconnectedWithReason:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateStopping;
  -[NESMVPNSessionState handlePlugin:statusDidChangeToDisconnectedWithReason:]( &v27,  "handlePlugin:statusDidChangeToDisconnectedWithReason:",  a3);
  if (self) {
    id Property = objc_getProperty(self, v6, 16LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v8 = [Property setLastStopReason:v4];
  uint64_t v10 = ne_log_obj(v8, v9);
  int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id v13 = objc_getProperty(self, v12, 16LL, 1);
    }
    else {
      id v13 = 0LL;
    }
    v14 = (objc_class *)objc_opt_class(self);
    id v15 = NSStringFromClass(v14);
    SEL v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    *(_DWORD *)buf = 138412546;
    id v29 = v13;
    __int16 v30 = 2112;
    v31 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: plugin set status to disconnected",  buf,  0x16u);
  }

  if (self && self->_isUninstalled)
  {
    uint64_t v19 = ne_log_obj(v17, v18);
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = objc_getProperty(self, v21, 16LL, 1);
      v23 = (objc_class *)objc_opt_class(self);
      id v24 = NSStringFromClass(v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      *(_DWORD *)buf = 138412546;
      id v29 = v22;
      __int16 v30 = 2112;
      v31 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: disposing all plugins",  buf,  0x16u);
    }

    objc_msgSend(objc_getProperty(self, v26, 16, 1), "setState:", 8);
  }

- (void)handleTimeout
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateStopping;
  -[NESMVPNSessionState handleTimeout](&v5, "handleTimeout");
  if (self) {
    id Property = objc_getProperty(self, v3, 16LL, 1);
  }
  else {
    id Property = 0LL;
  }
  [Property setState:8];
}

- (void)handleEstablishIPC
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
    id v8 = NSStringFromClass(v7);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v12 = 138412546;
    id v13 = Property;
    __int16 v14 = 2112;
    id v15 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: received establish IPC message",  (uint8_t *)&v12,  0x16u);
  }

  if (self) {
    id v11 = objc_getProperty(self, v10, 16LL, 1);
  }
  else {
    id v11 = 0LL;
  }
  [v11 sendEstablishIPCReply];
}

- (void)handlePlugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateStopping;
  -[NESMVPNSessionState handlePlugin:didStartWithPID:error:](&v5, "handlePlugin:didStartWithPID:error:", a3, 0LL, a5);
}

@end