@interface NESMVPNSessionState
+ (NESMVPNSessionState)stateWithType:(int64_t)a3;
- (BOOL)canSleep;
- (BOOL)handleClearConfiguration;
- (BOOL)handleSetConfiguration;
- (BOOL)handleSleep;
- (NESMVPNSessionState)initWithType:(int64_t)a3 andTimeout:(unint64_t)a4;
- (int64_t)type;
- (void)enterWithSession:(id)a3;
- (void)handleClearConfigurationResult:(BOOL)a3;
- (void)handleEstablishIPC;
- (void)handleEstablishIPCReplySent;
- (void)handleInterfaceAvailable:(id)a3 changed:(BOOL)a4;
- (void)handleInterfaceUnavailable:(id)a3;
- (void)handlePlugin:(id)a3 authenticationCompleteWithResults:(id)a4 status:(int)a5 andError:(id)a6;
- (void)handlePlugin:(id)a3 didAttachIPCWithEndpoint:(id)a4;
- (void)handlePlugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5;
- (void)handlePlugin:(id)a3 statusDidChangeToDisconnectedWithReason:(int)a4;
- (void)handlePlugin:(id)a3 statusDidChangeToDisconnectingWithReason:(int)a4;
- (void)handlePluginDidDetachIPC:(id)a3;
- (void)handlePluginDisposeComplete:(id)a3;
- (void)handlePluginStatusDidChangeToAuthenticating:(id)a3;
- (void)handlePluginStatusDidChangeToConnected:(id)a3;
- (void)handlePluginStatusDidChangeToContacting:(id)a3;
- (void)handlePluginStatusDidChangeToNegotiating:(id)a3;
- (void)handlePluginStatusDidChangeToReasserting:(id)a3;
- (void)handlePluginStatusDidChangeToUpdating:(id)a3;
- (void)handleSetConfigurationResult:(BOOL)a3;
- (void)handleStartMessage:(id)a3;
- (void)handleStop;
- (void)handleTimeout;
- (void)handleUpdateConfiguration;
- (void)handleUserLogout;
- (void)handleUserSwitch;
- (void)handleWakeup;
- (void)leave;
@end

@implementation NESMVPNSessionState

- (NESMVPNSessionState)initWithType:(int64_t)a3 andTimeout:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NESMVPNSessionState;
  v6 = -[NESMVPNSessionState init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    session = v6->_session;
    v6->_type = a3;
    v6->_session = 0LL;
    v6->_timeout = a4;
  }

  return v7;
}

- (void)enterWithSession:(id)a3
{
  id v4 = a3;
  v6 = v4;
  if (self)
  {
    objc_setProperty_atomic(self, v5, v4, 16LL);
    if (self->_timeout)
    {
      uint64_t v7 = ne_log_obj(v4, v5);
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (objc_class *)objc_opt_class(self);
        objc_super v10 = NSStringFromClass(v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        unint64_t timeout = self->_timeout;
        *(_DWORD *)buf = 138412802;
        v26 = v6;
        __int16 v27 = 2112;
        v28 = v11;
        __int16 v29 = 2048;
        unint64_t v30 = timeout;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@: Entering state %@, timeout %llu seconds",  buf,  0x20u);
      }

LABEL_9:
      if (self->_timeout && (objc_opt_respondsToSelector(self, "handleTimeout") & 1) != 0)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue([v6 queue]);
        unint64_t v19 = self->_timeout;
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472LL;
        v23[2] = sub_100068264;
        v23[3] = &unk_1000BEBE0;
        v23[4] = self;
        id v24 = v6;
        uint64_t v20 = NECreateTimerSource(v18, v19, v23);
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        objc_setProperty_atomic(self, v22, v21, 32LL);
      }

      goto LABEL_12;
    }
  }

  uint64_t v13 = ne_log_obj(v4, v5);
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (objc_class *)objc_opt_class(self);
    v16 = NSStringFromClass(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    *(_DWORD *)buf = 138412546;
    v26 = v6;
    __int16 v27 = 2112;
    v28 = v17;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@: Entering state %@", buf, 0x16u);
  }

  if (self) {
    goto LABEL_9;
  }
LABEL_12:
}

- (void)leave
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
    uint64_t v7 = (objc_class *)objc_opt_class(self);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v14 = 138412546;
    id v15 = Property;
    __int16 v16 = 2112;
    v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@: Leaving state %@", (uint8_t *)&v14, 0x16u);
  }

  if (self)
  {
    if (objc_getProperty(self, v10, 32LL, 1))
    {
      v12 = (dispatch_source_s *)objc_getProperty(self, v11, 32LL, 1);
      dispatch_source_cancel(v12);
      objc_setProperty_atomic(self, v13, 0LL, 32LL);
    }

    objc_setProperty_atomic(self, v11, 0LL, 16LL);
  }

- (void)handleStartMessage:(id)a3
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
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    int v11 = 138412546;
    id v12 = Property;
    __int16 v13 = 2112;
    int v14 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: received start message",  (uint8_t *)&v11,  0x16u);
  }
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
    uint64_t v7 = (objc_class *)objc_opt_class(self);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v20 = 138412546;
    id v21 = Property;
    __int16 v22 = 2112;
    v23 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: received establish IPC message",  (uint8_t *)&v20,  0x16u);
  }

  if (self) {
    id v11 = objc_getProperty(self, v10, 16LL, 1);
  }
  else {
    id v11 = 0LL;
  }
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 primaryTunnelPlugin]);
  if (v12)
  {
    int v14 = (void *)v12;
    if (self) {
      id v15 = objc_getProperty(self, v13, 16LL, 1);
    }
    else {
      id v15 = 0LL;
    }
    __int16 v16 = (_BYTE *)objc_claimAutoreleasedReturnValue([v15 primaryTunnelPlugin]);
    if (v16)
    {
      char v17 = v16[16];

      if ((v17 & 1) == 0) {
        return;
      }
      if (self) {
        id v19 = objc_getProperty(self, v18, 16LL, 1);
      }
      else {
        id v19 = 0LL;
      }
      int v14 = (void *)objc_claimAutoreleasedReturnValue([v19 primaryTunnelPlugin]);
      sub_100016944(v14);
    }
  }

- (void)handleEstablishIPCReplySent
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
    uint64_t v7 = (objc_class *)objc_opt_class(self);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v10 = 138412546;
    id v11 = Property;
    __int16 v12 = 2112;
    __int16 v13 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: sent establish IPC reply",  (uint8_t *)&v10,  0x16u);
  }
}

- (void)handleStop
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
    uint64_t v7 = (objc_class *)objc_opt_class(self);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v12 = 138412546;
    id v13 = Property;
    __int16 v14 = 2112;
    id v15 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: received stop message",  (uint8_t *)&v12,  0x16u);
  }

  if (self) {
    id v11 = objc_getProperty(self, v10, 16LL, 1);
  }
  else {
    id v11 = 0LL;
  }
  [v11 setState:5];
}

- (void)handleInterfaceUnavailable:(id)a3
{
  id v4 = a3;
  uint64_t v6 = ne_log_obj(v4, v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v8, 16LL, 1);
    }
    else {
      id Property = 0LL;
    }
    int v10 = (objc_class *)objc_opt_class(self);
    id v11 = NSStringFromClass(v10);
    int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    int v13 = 138412802;
    id v14 = Property;
    __int16 v15 = 2112;
    __int16 v16 = v12;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: interface %@ is now unavailable",  (uint8_t *)&v13,  0x20u);
  }
}

- (void)handleInterfaceAvailable:(id)a3 changed:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v8 = ne_log_obj(v6, v7);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v10, 16LL, 1);
    }
    else {
      id Property = 0LL;
    }
    int v12 = (objc_class *)objc_opt_class(self);
    int v13 = NSStringFromClass(v12);
    uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
    __int16 v15 = (void *)v14;
    __int16 v16 = "did not change";
    int v17 = 138413058;
    id v18 = Property;
    __int16 v19 = 2112;
    if (v4) {
      __int16 v16 = "changed";
    }
    uint64_t v20 = v14;
    __int16 v21 = 2112;
    id v22 = v6;
    __int16 v23 = 2080;
    id v24 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: interface %@ is now available, address %s",  (uint8_t *)&v17,  0x2Au);
  }
}

- (void)handlePlugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v11 = ne_log_obj(v9, v10);
  int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v13, 16LL, 1);
    }
    else {
      id Property = 0LL;
    }
    __int16 v15 = (objc_class *)objc_opt_class(self);
    __int16 v16 = NSStringFromClass(v15);
    int v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    int v18 = 138413314;
    id v19 = Property;
    __int16 v20 = 2112;
    __int16 v21 = v17;
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 1024;
    int v25 = a4;
    __int16 v26 = 2112;
    id v27 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: plugin %@ started with PID %d error %@",  (uint8_t *)&v18,  0x30u);
  }
}

- (void)handlePlugin:(id)a3 didAttachIPCWithEndpoint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = ne_log_obj(v7, v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v11, 16LL, 1);
    }
    else {
      id Property = 0LL;
    }
    int v13 = (objc_class *)objc_opt_class(self);
    uint64_t v14 = NSStringFromClass(v13);
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    int v24 = 138413058;
    id v25 = Property;
    __int16 v26 = 2112;
    id v27 = v15;
    __int16 v28 = 2112;
    id v29 = v6;
    __int16 v30 = 2048;
    id v31 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: plugin %@ attached IPC with endpoint %p",  (uint8_t *)&v24,  0x2Au);
  }

  if (self)
  {
    id v18 = objc_getProperty(self, v17, 16LL, 1);
  }

  else
  {
    unsigned __int8 v23 = [0 establishIPCPending];
    id v18 = 0LL;
    if ((v23 & 1) == 0) {
      goto LABEL_16;
    }
  }

  id v19 = (id)objc_claimAutoreleasedReturnValue([v18 primaryTunnelPlugin]);

  if (v19 == v6)
  {
    if (v7)
    {
      if (self) {
        id v21 = objc_getProperty(self, v20, 16LL, 1);
      }
      else {
        id v21 = 0LL;
      }
      [v21 setEndpointInEstablishIPCReply:v7 forPlugin:v6];
    }

    else
    {
      if (self) {
        id v22 = objc_getProperty(self, v20, 16LL, 1);
      }
      else {
        id v22 = 0LL;
      }
      [v22 sendEstablishIPCReply];
    }
  }

- (void)handlePlugin:(id)a3 statusDidChangeToDisconnectedWithReason:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v8 = ne_log_obj(v6, v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v10, 16LL, 1);
    }
    else {
      id Property = 0LL;
    }
    int v12 = (objc_class *)objc_opt_class(self);
    int v13 = NSStringFromClass(v12);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    int v26 = 138413058;
    id v27 = Property;
    __int16 v28 = 2112;
    id v29 = v14;
    __int16 v30 = 2112;
    id v31 = v6;
    __int16 v32 = 2080;
    uint64_t v33 = ne_session_stop_reason_to_string(v4);
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: plugin %@ disconnected with reason %s",  (uint8_t *)&v26,  0x2Au);
  }

  if (self) {
    id v16 = objc_getProperty(self, v15, 16LL, 1);
  }
  else {
    id v16 = 0LL;
  }
  id v17 = [v16 setLastStopReason:v4];
  if ((_DWORD)v4 == 6)
  {
    uint64_t v19 = ne_log_obj(v17, v18);
    __int16 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      if (self) {
        id v22 = objc_getProperty(self, v21, 16LL, 1);
      }
      else {
        id v22 = 0LL;
      }
      int v26 = 138412290;
      id v27 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%@ re-setting on demand configuration because the plugin was disabled",  (uint8_t *)&v26,  0xCu);
    }

    if (self) {
      id v24 = objc_getProperty(self, v23, 16LL, 1);
    }
    else {
      id v24 = 0LL;
    }
    sub_10007B8E8((uint64_t)v24, 1);
  }

  if (self) {
    id v25 = objc_getProperty(self, v18, 16LL, 1);
  }
  else {
    id v25 = 0LL;
  }
  [v25 setState:5];
}

- (void)handlePluginStatusDidChangeToContacting:(id)a3
{
  id v4 = a3;
  uint64_t v6 = ne_log_obj(v4, v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v8, 16LL, 1);
    }
    else {
      id Property = 0LL;
    }
    uint64_t v10 = (objc_class *)objc_opt_class(self);
    uint64_t v11 = NSStringFromClass(v10);
    int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    int v13 = 138412802;
    id v14 = Property;
    __int16 v15 = 2112;
    id v16 = v12;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: plugin %@ status changed to contacting",  (uint8_t *)&v13,  0x20u);
  }
}

- (void)handlePluginStatusDidChangeToAuthenticating:(id)a3
{
  id v4 = a3;
  uint64_t v6 = ne_log_obj(v4, v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v8, 16LL, 1);
    }
    else {
      id Property = 0LL;
    }
    uint64_t v10 = (objc_class *)objc_opt_class(self);
    uint64_t v11 = NSStringFromClass(v10);
    int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    int v13 = 138412802;
    id v14 = Property;
    __int16 v15 = 2112;
    id v16 = v12;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: plugin %@ status changed to authenticating",  (uint8_t *)&v13,  0x20u);
  }
}

- (void)handlePluginStatusDidChangeToNegotiating:(id)a3
{
  id v4 = a3;
  uint64_t v6 = ne_log_obj(v4, v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v8, 16LL, 1);
    }
    else {
      id Property = 0LL;
    }
    uint64_t v10 = (objc_class *)objc_opt_class(self);
    uint64_t v11 = NSStringFromClass(v10);
    int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    int v13 = 138412802;
    id v14 = Property;
    __int16 v15 = 2112;
    id v16 = v12;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: plugin %@ status changed to negotiating",  (uint8_t *)&v13,  0x20u);
  }
}

- (void)handlePluginStatusDidChangeToConnected:(id)a3
{
  id v4 = a3;
  uint64_t v6 = ne_log_obj(v4, v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v8, 16LL, 1);
    }
    else {
      id Property = 0LL;
    }
    uint64_t v10 = (objc_class *)objc_opt_class(self);
    uint64_t v11 = NSStringFromClass(v10);
    int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    int v15 = 138412802;
    id v16 = Property;
    __int16 v17 = 2112;
    id v18 = v12;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: plugin %@ status changed to connected",  (uint8_t *)&v15,  0x20u);
  }

  if (self) {
    id v14 = objc_getProperty(self, v13, 16LL, 1);
  }
  else {
    id v14 = 0LL;
  }
  [v14 setReassertedByPlugin:0];
}

- (void)handlePluginStatusDidChangeToReasserting:(id)a3
{
  id v4 = a3;
  uint64_t v6 = ne_log_obj(v4, v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v8, 16LL, 1);
    }
    else {
      id Property = 0LL;
    }
    uint64_t v10 = (objc_class *)objc_opt_class(self);
    uint64_t v11 = NSStringFromClass(v10);
    int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    int v15 = 138412802;
    id v16 = Property;
    __int16 v17 = 2112;
    id v18 = v12;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: plugin %@ status changed to reasserting",  (uint8_t *)&v15,  0x20u);
  }

  if (self) {
    id v14 = objc_getProperty(self, v13, 16LL, 1);
  }
  else {
    id v14 = 0LL;
  }
  [v14 setReassertedByPlugin:1];
}

- (void)handlePlugin:(id)a3 statusDidChangeToDisconnectingWithReason:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v8 = ne_log_obj(v6, v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v10, 16LL, 1);
    }
    else {
      id Property = 0LL;
    }
    int v12 = (objc_class *)objc_opt_class(self);
    int v13 = NSStringFromClass(v12);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    int v17 = 138413058;
    id v18 = Property;
    __int16 v19 = 2112;
    id v20 = v14;
    __int16 v21 = 2112;
    id v22 = v6;
    __int16 v23 = 2080;
    uint64_t v24 = ne_session_stop_reason_to_string(v4);
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: plugin %@ status changed to disconnecting with reason %s",  (uint8_t *)&v17,  0x2Au);
  }

  if (self) {
    id v16 = objc_getProperty(self, v15, 16LL, 1);
  }
  else {
    id v16 = 0LL;
  }
  [v16 setState:5];
}

- (void)handlePlugin:(id)a3 authenticationCompleteWithResults:(id)a4 status:(int)a5 andError:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v14 = ne_log_obj(v12, v13);
  int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v16, 16LL, 1);
    }
    else {
      id Property = 0LL;
    }
    id v18 = (objc_class *)objc_opt_class(self);
    __int16 v19 = NSStringFromClass(v18);
    id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    int v21 = 138413570;
    id v22 = Property;
    __int16 v23 = 2112;
    uint64_t v24 = v20;
    __int16 v25 = 2112;
    id v26 = v10;
    __int16 v27 = 2048;
    id v28 = v11;
    __int16 v29 = 1024;
    int v30 = a5;
    __int16 v31 = 2112;
    id v32 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: plugin %@ authentication is complete with results %p, status %d, error %@",  (uint8_t *)&v21,  0x3Au);
  }
}

- (void)handlePluginDisposeComplete:(id)a3
{
  id v4 = a3;
  uint64_t v6 = ne_log_obj(v4, v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v8, 16LL, 1);
    }
    else {
      id Property = 0LL;
    }
    id v10 = (objc_class *)objc_opt_class(self);
    id v11 = NSStringFromClass(v10);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    int v17 = 138412802;
    id v18 = Property;
    __int16 v19 = 2112;
    id v20 = v12;
    __int16 v21 = 2112;
    id v22 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: plugin %@ dispose complete",  (uint8_t *)&v17,  0x20u);
  }

  if (!self)
  {
    unsigned __int8 v16 = [0 establishIPCPending];
    id v15 = 0LL;
    if ((v16 & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }

  if (objc_msgSend(objc_getProperty(self, v13, 16, 1), "establishIPCPending"))
  {
    id v15 = objc_getProperty(self, v14, 16LL, 1);
LABEL_8:
    [v15 sendEstablishIPCReply];
  }

- (void)handlePluginDidDetachIPC:(id)a3
{
  id v4 = a3;
  uint64_t v6 = ne_log_obj(v4, v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v8, 16LL, 1);
    }
    else {
      id Property = 0LL;
    }
    id v10 = (objc_class *)objc_opt_class(self);
    id v11 = NSStringFromClass(v10);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    int v17 = 138412802;
    id v18 = Property;
    __int16 v19 = 2112;
    id v20 = v12;
    __int16 v21 = 2112;
    id v22 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: plugin %@ did detach from IPC",  (uint8_t *)&v17,  0x20u);
  }

  if (!self)
  {
    unsigned __int8 v16 = [0 establishIPCPending];
    id v15 = 0LL;
    if ((v16 & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }

  if (objc_msgSend(objc_getProperty(self, v13, 16, 1), "establishIPCPending"))
  {
    id v15 = objc_getProperty(self, v14, 16LL, 1);
LABEL_8:
    [v15 sendEstablishIPCReply];
  }

- (BOOL)handleSleep
{
  uint64_t v3 = ne_log_obj(self, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    if (self) {
      id Property = objc_getProperty(self, v5, 16LL, 1);
    }
    else {
      id Property = 0LL;
    }
    uint64_t v7 = (objc_class *)objc_opt_class(self);
    uint64_t v8 = NSStringFromClass(v7);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v27 = 138412546;
    id v28 = Property;
    __int16 v29 = 2112;
    int v30 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%@ in state %@: received sleep event",  (uint8_t *)&v27,  0x16u);
  }

  if (self) {
    id v11 = objc_getProperty(self, v10, 16LL, 1);
  }
  else {
    id v11 = 0LL;
  }
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 primaryTunnelPlugin]);
  if (v12
    && ((uint64_t v14 = (void *)v12, !self) ? (v15 = 0LL) : (v15 = objc_getProperty(self, v13, 16LL, 1)),
        unsigned __int8 v16 = (unsigned int *)objc_claimAutoreleasedReturnValue([v15 primaryTunnelPlugin]),
        unsigned int v17 = sub_100016694(v16),
        v16,
        v14,
        v17))
  {
    if (self) {
      id v18 = objc_getProperty(self, v13, 16LL, 1);
    }
    else {
      id v18 = 0LL;
    }
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 primaryTunnelPlugin]);
    sub_100016378(v19);
  }

  else
  {
    if (self) {
      id v20 = objc_getProperty(self, v13, 16LL, 1);
    }
    else {
      id v20 = 0LL;
    }
    if ([v20 parentType] == (id)2)
    {
      if (self) {
        id v22 = objc_getProperty(self, v21, 16LL, 1);
      }
      else {
        id v22 = 0LL;
      }
      __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v22 parent]);
      if (self) {
        objc_getProperty(self, v23, 16LL, 1);
      }
      sub_100085770(v19);
    }

    else
    {
      if (self) {
        id v24 = objc_getProperty(self, v21, 16LL, 1);
      }
      else {
        id v24 = 0LL;
      }
      __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v24 server]);
      sub_100051C0C(v19, v25);
    }
  }

  return 1;
}

- (BOOL)canSleep
{
  uint64_t v3 = ne_log_obj(self, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    if (self) {
      id Property = objc_getProperty(self, v5, 16LL, 1);
    }
    else {
      id Property = 0LL;
    }
    uint64_t v7 = (objc_class *)objc_opt_class(self);
    uint64_t v8 = NSStringFromClass(v7);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v11 = 138412546;
    id v12 = Property;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%@ in state %@: received can sleep query",  (uint8_t *)&v11,  0x16u);
  }

  return 1;
}

- (void)handleWakeup
{
  uint64_t v3 = ne_log_obj(self, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    if (self) {
      id Property = objc_getProperty(self, v5, 16LL, 1);
    }
    else {
      id Property = 0LL;
    }
    uint64_t v7 = (objc_class *)objc_opt_class(self);
    uint64_t v8 = NSStringFromClass(v7);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v21 = 138412546;
    id v22 = Property;
    __int16 v23 = 2112;
    id v24 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%@ in state %@: received wake event",  (uint8_t *)&v21,  0x16u);
  }

  if (self) {
    id v11 = objc_getProperty(self, v10, 16LL, 1);
  }
  else {
    id v11 = 0LL;
  }
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 primaryTunnelPlugin]);
  if (v12)
  {
    uint64_t v14 = (void *)v12;
    id v15 = self ? objc_getProperty(self, v13, 16LL, 1) : 0LL;
    unsigned __int8 v16 = (unsigned int *)objc_claimAutoreleasedReturnValue([v15 primaryTunnelPlugin]);
    unsigned int v17 = sub_100016694(v16);

    if (v17)
    {
      if (self) {
        id v19 = objc_getProperty(self, v18, 16LL, 1);
      }
      else {
        id v19 = 0LL;
      }
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 primaryTunnelPlugin]);
      sub_10001663C(v20);
    }
  }

- (void)handleTimeout
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
    uint64_t v7 = (objc_class *)objc_opt_class(self);
    uint64_t v8 = NSStringFromClass(v7);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v10 = 138412546;
    id v11 = Property;
    __int16 v12 = 2112;
    __int16 v13 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: timed out",  (uint8_t *)&v10,  0x16u);
  }
}

- (void)handleUserSwitch
{
  uint64_t v3 = ne_log_obj(self, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    if (self) {
      id Property = objc_getProperty(self, v5, 16LL, 1);
    }
    else {
      id Property = 0LL;
    }
    uint64_t v7 = (objc_class *)objc_opt_class(self);
    uint64_t v8 = NSStringFromClass(v7);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v10 = 138412546;
    id v11 = Property;
    __int16 v12 = 2112;
    __int16 v13 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%@ in state %@: console user switch",  (uint8_t *)&v10,  0x16u);
  }
}

- (void)handleUserLogout
{
  uint64_t v3 = ne_log_obj(self, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    if (self) {
      id Property = objc_getProperty(self, v5, 16LL, 1);
    }
    else {
      id Property = 0LL;
    }
    uint64_t v7 = (objc_class *)objc_opt_class(self);
    uint64_t v8 = NSStringFromClass(v7);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v10 = 138412546;
    id v11 = Property;
    __int16 v12 = 2112;
    __int16 v13 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%@ in state %@: console user logout",  (uint8_t *)&v10,  0x16u);
  }
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
    uint64_t v7 = (objc_class *)objc_opt_class(self);
    uint64_t v8 = NSStringFromClass(v7);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v13 = 138412546;
    id v14 = Property;
    __int16 v15 = 2112;
    unsigned __int8 v16 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: set configuration started",  (uint8_t *)&v13,  0x16u);
  }

  if (self) {
    id v11 = objc_getProperty(self, v10, 16LL, 1);
  }
  else {
    id v11 = 0LL;
  }
  [v11 requestInstall];
  return 1;
}

- (void)handleSetConfigurationResult:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = ne_log_obj(self, a2);
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
    int v10 = NSStringFromClass(v9);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    int v14 = 138412802;
    id v15 = Property;
    __int16 v16 = 2112;
    unsigned int v17 = v11;
    __int16 v18 = 1024;
    BOOL v19 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: set configuration completed with result %d",  (uint8_t *)&v14,  0x1Cu);
  }

  if (self) {
    id v13 = objc_getProperty(self, v12, 16LL, 1);
  }
  else {
    id v13 = 0LL;
  }
  [v13 notifyChangedExtendedStatus];
}

- (BOOL)handleClearConfiguration
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
    uint64_t v7 = (objc_class *)objc_opt_class(self);
    uint64_t v8 = NSStringFromClass(v7);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v13 = 138412546;
    id v14 = Property;
    __int16 v15 = 2112;
    __int16 v16 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: clear configuration started",  (uint8_t *)&v13,  0x16u);
  }

  if (self) {
    id v11 = objc_getProperty(self, v10, 16LL, 1);
  }
  else {
    id v11 = 0LL;
  }
  [v11 requestUninstall];
  return 1;
}

- (void)handleClearConfigurationResult:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = ne_log_obj(self, a2);
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
    int v10 = NSStringFromClass(v9);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    int v14 = 138412802;
    id v15 = Property;
    __int16 v16 = 2112;
    unsigned int v17 = v11;
    __int16 v18 = 1024;
    BOOL v19 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: clear configuration completed with result %d",  (uint8_t *)&v14,  0x1Cu);
  }

  if (self) {
    id v13 = objc_getProperty(self, v12, 16LL, 1);
  }
  else {
    id v13 = 0LL;
  }
  [v13 notifyChangedExtendedStatus];
}

- (void)handleUpdateConfiguration
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
    uint64_t v7 = (objc_class *)objc_opt_class(self);
    uint64_t v8 = NSStringFromClass(v7);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v17 = 138412546;
    id v18 = Property;
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: update configuration",  (uint8_t *)&v17,  0x16u);
  }

  if (self)
  {
    objc_msgSend(objc_getProperty(self, v10, 16, 1), "prepareConfigurationForStart");
    id v12 = objc_getProperty(self, v11, 16LL, 1);
  }

  else
  {
    [0 prepareConfigurationForStart];
    id v12 = 0LL;
  }

  int v14 = (void *)objc_claimAutoreleasedReturnValue([v12 primaryTunnelPlugin]);
  if (self) {
    id v15 = objc_getProperty(self, v13, 16LL, 1);
  }
  else {
    id v15 = 0LL;
  }
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 configuration]);
  sub_100016324(v14, v16);
}

- (void)handlePluginStatusDidChangeToUpdating:(id)a3
{
  id v4 = a3;
  uint64_t v6 = ne_log_obj(v4, v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v8, 16LL, 1);
    }
    else {
      id Property = 0LL;
    }
    int v10 = (objc_class *)objc_opt_class(self);
    SEL v11 = NSStringFromClass(v10);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    int v15 = 138412802;
    id v16 = Property;
    __int16 v17 = 2112;
    id v18 = v12;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: plugin %@ status changed to updating",  (uint8_t *)&v15,  0x20u);
  }

  if (self) {
    id v14 = objc_getProperty(self, v13, 16LL, 1);
  }
  else {
    id v14 = 0LL;
  }
  [v14 setState:9];
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
}

+ (NESMVPNSessionState)stateWithType:(int64_t)a3
{
  else {
    return (NESMVPNSessionState *)objc_alloc_init(*(&off_1000BE418)[a3 - 1]);
  }
}

@end