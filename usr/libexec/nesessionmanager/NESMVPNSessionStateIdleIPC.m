@interface NESMVPNSessionStateIdleIPC
- (NESMVPNSessionStateIdleIPC)init;
- (void)enterWithSession:(id)a3;
- (void)handleEstablishIPC;
- (void)handleEstablishIPCReplySent;
- (void)handlePlugin:(id)a3 didAttachIPCWithEndpoint:(id)a4;
- (void)handlePlugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5;
- (void)handlePluginDidDetachIPC:(id)a3;
- (void)handlePluginDisposeComplete:(id)a3;
- (void)handleStartMessage:(id)a3;
- (void)handleStop;
- (void)handleUpdateConfiguration;
@end

@implementation NESMVPNSessionStateIdleIPC

- (NESMVPNSessionStateIdleIPC)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateIdleIPC;
  return -[NESMVPNSessionState initWithType:andTimeout:](&v3, "initWithType:andTimeout:", 10LL, 0LL);
}

- (void)enterWithSession:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateIdleIPC;
  -[NESMVPNSessionState enterWithSession:](&v10, "enterWithSession:", v4);
  if (self) {
    self->_didAttachIPC = 0;
  }
  if (![v4 initializePlugins]
    || ![v4 prepareConfigurationForStart]
    || ((v6 = (_BYTE *)objc_claimAutoreleasedReturnValue([v4 primaryTunnelPlugin]), !self)
      ? (id Property = 0LL)
      : (id Property = objc_getProperty(self, v5, 16LL, 1)),
        v8 = (void *)objc_claimAutoreleasedReturnValue([Property configuration]),
        BOOL v9 = sub_100014E78(v6, v8),
        v8,
        v6,
        !v9))
  {
    [v4 sendEstablishIPCReply];
  }
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
    v8 = NSStringFromClass(v7);
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v10 = 138412546;
    id v11 = Property;
    __int16 v12 = 2112;
    v13 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: ignoring duplicate request to establish IPC",  (uint8_t *)&v10,  0x16u);
  }
}

- (void)handleStartMessage:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateIdleIPC;
  -[NESMVPNSessionState handleStartMessage:](&v24, "handleStartMessage:", v4);
  if (self) {
    id Property = objc_getProperty(self, v5, 16LL, 1);
  }
  else {
    id Property = 0LL;
  }
  v7 = (_BYTE *)objc_claimAutoreleasedReturnValue([Property primaryTunnelPlugin]);
  if (v7) {
    int v8 = v7[16] & 1;
  }
  else {
    int v8 = 0;
  }

  uint64_t v11 = ne_log_obj(v9, v10);
  __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v13)
    {
      if (self) {
        id v15 = objc_getProperty(self, v14, 16LL, 1);
      }
      else {
        id v15 = 0LL;
      }
      v16 = (objc_class *)objc_opt_class(self);
      v17 = NSStringFromClass(v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      *(_DWORD *)buf = 138412546;
      id v26 = v15;
      __int16 v27 = 2112;
      v28 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: plugin previously started, going back to the idle state to handle the start message",  buf,  0x16u);
    }

    sub_100069118(self, v4);
  }

  else
  {
    if (v13)
    {
      if (self) {
        id v19 = objc_getProperty(self, v14, 16LL, 1);
      }
      else {
        id v19 = 0LL;
      }
      v20 = (objc_class *)objc_opt_class(self);
      v21 = NSStringFromClass(v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      *(_DWORD *)buf = 138412546;
      id v26 = v19;
      __int16 v27 = 2112;
      v28 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: plugin has not yet started, saving the start message",  buf,  0x16u);
    }

    if (self) {
      objc_setProperty_atomic(self, v23, v4, 48LL);
    }
  }
}

- (void)handleStop
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
    int v8 = NSStringFromClass(v7);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v11 = 138412546;
    id v12 = Property;
    __int16 v13 = 2112;
    v14 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: received stop message",  (uint8_t *)&v11,  0x16u);
  }

  if (self) {
    objc_setProperty_atomic(self, v10, 0LL, 48LL);
  }
}

- (void)handlePlugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateIdleIPC;
  -[NESMVPNSessionState handlePlugin:didStartWithPID:error:](&v40, "handlePlugin:didStartWithPID:error:", v8, v6, a5);
  if ((int)v6 < 1)
  {
    if (self) {
      id Property = objc_getProperty(self, v9, 16LL, 1);
    }
    else {
      id Property = 0LL;
    }
    id v23 = [Property establishIPCPending];
    if ((_DWORD)v23)
    {
      uint64_t v25 = ne_log_obj(v23, v24);
      id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        if (self) {
          id v28 = objc_getProperty(self, v27, 16LL, 1);
        }
        else {
          id v28 = 0LL;
        }
        v29 = (objc_class *)objc_opt_class(self);
        v30 = NSStringFromClass(v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
        *(_DWORD *)buf = 138412546;
        id v42 = v28;
        __int16 v43 = 2112;
        v44 = v31;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: plugin failed to start, cannot attach IPC",  buf,  0x16u);
      }

      if (self) {
        id v33 = objc_getProperty(self, v32, 16LL, 1);
      }
      else {
        id v33 = 0LL;
      }
      [v33 sendEstablishIPCReply];
    }
  }

  else
  {
    if (self) {
      id v10 = objc_getProperty(self, v9, 16LL, 1);
    }
    else {
      id v10 = 0LL;
    }
    id v11 = [v10 shouldSendIPCAttachForPlugin:v8];
    int v12 = (int)v11;
    uint64_t v14 = ne_log_obj(v11, v13);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v16)
      {
        if (self) {
          id v18 = objc_getProperty(self, v17, 16LL, 1);
        }
        else {
          id v18 = 0LL;
        }
        id v19 = (objc_class *)objc_opt_class(self);
        v20 = NSStringFromClass(v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        *(_DWORD *)buf = 138412546;
        id v42 = v18;
        __int16 v43 = 2112;
        v44 = v21;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@ in state %@: attaching IPC", buf, 0x16u);
      }

      sub_100016944(v8);
    }

    else
    {
      if (v16)
      {
        if (self) {
          id v34 = objc_getProperty(self, v17, 16LL, 1);
        }
        else {
          id v34 = 0LL;
        }
        v35 = (objc_class *)objc_opt_class(self);
        v36 = NSStringFromClass(v35);
        v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
        *(_DWORD *)buf = 138412546;
        id v42 = v34;
        __int16 v43 = 2112;
        v44 = v37;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: IPC is no longer needed, going back to idle",  buf,  0x16u);
      }

      if (self)
      {
        id v39 = objc_getProperty(self, v38, 48LL, 1);
        sub_100069118(self, v39);
      }
    }
  }
}

- (void)handlePlugin:(id)a3 didAttachIPCWithEndpoint:(id)a4
{
  if (self && a4) {
    self->_didAttachIPC = 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateIdleIPC;
  -[NESMVPNSessionState handlePlugin:didAttachIPCWithEndpoint:](&v4, "handlePlugin:didAttachIPCWithEndpoint:", a3, a4);
}

- (void)handleEstablishIPCReplySent
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateIdleIPC;
  id v3 = -[NESMVPNSessionState handleEstablishIPCReplySent](&v16, "handleEstablishIPCReplySent");
  if (!self || !self->_didAttachIPC || (id v3 = objc_getProperty(self, v4, 48LL, 1)) != 0LL)
  {
    uint64_t v5 = ne_log_obj(v3, v4);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (self) {
        id Property = objc_getProperty(self, v7, 16LL, 1);
      }
      else {
        id Property = 0LL;
      }
      uint64_t v9 = (objc_class *)objc_opt_class(self);
      id v10 = NSStringFromClass(v9);
      int v12 = (void *)objc_claimAutoreleasedReturnValue(v10);
      if (self) {
        id v13 = objc_getProperty(self, v11, 48LL, 1);
      }
      else {
        id v13 = 0LL;
      }
      *(_DWORD *)buf = 138412802;
      id v18 = Property;
      __int16 v19 = 2112;
      v20 = v12;
      __int16 v21 = 2048;
      id v22 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: IPC did not attach or there is a pending start message, moving to idle and handling pending start message (%p)",  buf,  0x20u);
    }

    if (self)
    {
      id v15 = objc_getProperty(self, v14, 48LL, 1);
      sub_100069118(self, v15);
    }
  }

- (void)handleUpdateConfiguration
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateIdleIPC;
  -[NESMVPNSessionState handleUpdateConfiguration](&v23, "handleUpdateConfiguration");
  if (self) {
    id Property = objc_getProperty(self, v3, 16LL, 1);
  }
  else {
    id Property = 0LL;
  }
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([Property configuration]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 VPN]);
  if ([v6 isEnabled])
  {

LABEL_15:
    return;
  }

  if (self) {
    id v8 = objc_getProperty(self, v7, 16LL, 1);
  }
  else {
    id v8 = 0LL;
  }
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 configuration]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 appVPN]);
  unsigned __int8 v11 = [v10 isEnabled];

  if ((v11 & 1) == 0)
  {
    uint64_t v14 = ne_log_obj(v12, v13);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      if (self) {
        id v17 = objc_getProperty(self, v16, 16LL, 1);
      }
      else {
        id v17 = 0LL;
      }
      id v18 = (objc_class *)objc_opt_class(self);
      __int16 v19 = NSStringFromClass(v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      *(_DWORD *)buf = 138412546;
      id v25 = v17;
      __int16 v26 = 2112;
      __int16 v27 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: the configuration is now disabled, tearing down IPC",  buf,  0x16u);
    }

    if (self) {
      id v22 = objc_getProperty(self, v21, 16LL, 1);
    }
    else {
      id v22 = 0LL;
    }
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v22 primaryTunnelPlugin]);
    -[NESMVPNSessionStateIdleIPC handlePluginDidDetachIPC:](self, "handlePluginDidDetachIPC:", v5);
    goto LABEL_15;
  }

- (void)handlePluginDidDetachIPC:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateIdleIPC;
  -[NESMVPNSessionState handlePluginDidDetachIPC:](&v16, "handlePluginDidDetachIPC:", v4);
  if (self) {
    id Property = objc_getProperty(self, v5, 16LL, 1);
  }
  else {
    id Property = 0LL;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue([Property primaryTunnelPlugin]);

  if (v7)
  {
    if (self)
    {
      id v9 = objc_msgSend(objc_getProperty(self, v8, 16, 1), "primaryTunnelPlugin");
      id v10 = (_BYTE *)objc_claimAutoreleasedReturnValue(v9);
      sub_100015E44(v10, v11);

      id v13 = objc_getProperty(self, v12, 16LL, 1);
    }

    else
    {
      uint64_t v14 = (_BYTE *)objc_claimAutoreleasedReturnValue([0 primaryTunnelPlugin]);
      sub_100015E44(v14, v15);

      id v13 = 0LL;
    }

    [v13 setPrimaryTunnelPlugin:0];
  }

  else
  {
    -[NESMVPNSessionStateIdleIPC handlePluginDisposeComplete:](self, "handlePluginDisposeComplete:", v4);
  }
}

- (void)handlePluginDisposeComplete:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateIdleIPC;
  -[NESMVPNSessionState handlePluginDisposeComplete:](&v6, "handlePluginDisposeComplete:", a3);
  if (self)
  {
    id Property = objc_getProperty(self, v4, 48LL, 1);
    sub_100069118(self, Property);
  }

- (void).cxx_destruct
{
}

@end