@interface NESMVPNSessionStateUpdating
- (BOOL)handleClearConfiguration;
- (BOOL)handleSetConfiguration;
- (BOOL)handleSleep;
- (NESMVPNSessionStateUpdating)init;
- (void)enterWithSession:(id)a3;
- (void)handleEstablishIPC;
- (void)handlePlugin:(id)a3 statusDidChangeToDisconnectedWithReason:(int)a4;
- (void)handlePlugin:(id)a3 statusDidChangeToDisconnectingWithReason:(int)a4;
- (void)handleStop;
- (void)handleTimeout;
- (void)handleUpdateConfiguration;
- (void)leave;
@end

@implementation NESMVPNSessionStateUpdating

- (NESMVPNSessionStateUpdating)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateUpdating;
  return -[NESMVPNSessionState initWithType:andTimeout:](&v3, "initWithType:andTimeout:", 9LL, 300LL);
}

- (void)enterWithSession:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateUpdating;
  -[NESMVPNSessionState enterWithSession:](&v7, "enterWithSession:", a3);
  if (self)
  {
    objc_msgSend(objc_getProperty(self, v4, 16, 1), "requestUninstall");
    id Property = objc_getProperty(self, v5, 16LL, 1);
  }

  else
  {
    [0 requestUninstall];
    id Property = 0LL;
  }

  sub_10007B8E8((uint64_t)Property, 1);
}

- (void)leave
{
  v2 = self;
  if (self) {
    self = (NESMVPNSessionStateUpdating *)objc_getProperty(self, a2, 16LL, 1);
  }
  objc_super v3 = self;
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMVPNSessionStateUpdating queue](v3, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100069C6C;
  block[3] = &unk_1000BEC08;
  v8 = v3;
  SEL v5 = v3;
  dispatch_async(v4, block);

  v6.receiver = v2;
  v6.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateUpdating;
  -[NESMVPNSessionState leave](&v6, "leave");
}

- (void)handleEstablishIPC
{
  uint64_t v3 = ne_log_obj(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v5, 16LL, 1);
    }
    else {
      id Property = 0LL;
    }
    objc_super v7 = (objc_class *)objc_opt_class(self);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v12 = 138412546;
    id v13 = Property;
    __int16 v14 = 2112;
    v15 = v9;
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

- (void)handleTimeout
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateUpdating;
  -[NESMVPNSessionState handleTimeout](&v5, "handleTimeout");
  if (self) {
    id Property = objc_getProperty(self, v3, 16LL, 1);
  }
  else {
    id Property = 0LL;
  }
  [Property setState:8];
}

- (void)handleStop
{
  uint64_t v3 = ne_log_obj(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v5, 16LL, 1);
    }
    else {
      id Property = 0LL;
    }
    objc_super v7 = (objc_class *)objc_opt_class(self);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v10 = 138412546;
    id v11 = Property;
    __int16 v12 = 2112;
    id v13 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: received stop message",  (uint8_t *)&v10,  0x16u);
  }
}

- (BOOL)handleSleep
{
  uint64_t v3 = ne_log_obj(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v5, 16LL, 1);
    }
    else {
      id Property = 0LL;
    }
    objc_super v7 = (objc_class *)objc_opt_class(self);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v11 = 138412546;
    id v12 = Property;
    __int16 v13 = 2112;
    __int16 v14 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: received sleep event",  (uint8_t *)&v11,  0x16u);
  }

  return 0;
}

- (void)handleUpdateConfiguration
{
  uint64_t v3 = ne_log_obj(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v5, 16LL, 1);
    }
    else {
      id Property = 0LL;
    }
    objc_super v7 = (objc_class *)objc_opt_class(self);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v10 = 138412546;
    id v11 = Property;
    __int16 v12 = 2112;
    __int16 v13 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: update configuration",  (uint8_t *)&v10,  0x16u);
  }
}

- (void)handlePlugin:(id)a3 statusDidChangeToDisconnectedWithReason:(int)a4
{
  uint64_t v4 = *(void *)&a4;
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
    __int16 v12 = (objc_class *)objc_opt_class(self);
    __int16 v13 = NSStringFromClass(v12);
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    int v17 = 138413058;
    id v18 = Property;
    __int16 v19 = 2112;
    v20 = v14;
    __int16 v21 = 2112;
    id v22 = v6;
    __int16 v23 = 2080;
    uint64_t v24 = ne_session_stop_reason_to_string(v4);
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: plugin %@ disconnected with reason %s",  (uint8_t *)&v17,  0x2Au);
  }

  if (self) {
    id v16 = objc_getProperty(self, v15, 16LL, 1);
  }
  else {
    id v16 = 0LL;
  }
  [v16 setState:8];
}

- (void)handlePlugin:(id)a3 statusDidChangeToDisconnectingWithReason:(int)a4
{
  uint64_t v4 = *(void *)&a4;
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
    __int16 v12 = (objc_class *)objc_opt_class(self);
    __int16 v13 = NSStringFromClass(v12);
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    int v15 = 138413058;
    id v16 = Property;
    __int16 v17 = 2112;
    id v18 = v14;
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2080;
    uint64_t v22 = ne_session_stop_reason_to_string(v4);
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: plugin %@ status changed to disconnecting with reason %s",  (uint8_t *)&v15,  0x2Au);
  }
}

- (BOOL)handleSetConfiguration
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
    uint64_t v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v11 = 138412546;
    id v12 = Property;
    __int16 v13 = 2112;
    __int16 v14 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: rejecting set configuration",  (uint8_t *)&v11,  0x16u);
  }

  return 0;
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
    uint64_t v7 = (objc_class *)objc_opt_class(self);
    uint64_t v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v11 = 138412546;
    id v12 = Property;
    __int16 v13 = 2112;
    __int16 v14 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: rejecting clear configuration",  (uint8_t *)&v11,  0x16u);
  }

  return 0;
}

@end