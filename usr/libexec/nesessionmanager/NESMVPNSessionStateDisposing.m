@interface NESMVPNSessionStateDisposing
- (NESMVPNSessionStateDisposing)init;
- (void)enterWithSession:(id)a3;
- (void)handleEstablishIPC;
- (void)handlePluginDisposeComplete:(id)a3;
- (void)handleTimeout;
@end

@implementation NESMVPNSessionStateDisposing

- (NESMVPNSessionStateDisposing)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateDisposing;
  return -[NESMVPNSessionState initWithType:andTimeout:](&v3, "initWithType:andTimeout:", 8LL, 5LL);
}

- (void)enterWithSession:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateDisposing;
  -[NESMVPNSessionState enterWithSession:](&v28, "enterWithSession:", v4);
  if (self)
  {
    self->_pendingDisposeCount = 0;
    id Property = objc_getProperty(self, v5, 16LL, 1);
  }

  else
  {
    id Property = 0LL;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue([Property authenticationPlugin]);

  if (v7)
  {
    if (self)
    {
      ++self->_pendingDisposeCount;
      id v9 = objc_getProperty(self, v8, 16LL, 1);
    }

    else
    {
      id v9 = 0LL;
    }

    v10 = (_BYTE *)objc_claimAutoreleasedReturnValue([v9 authenticationPlugin]);
    sub_100015E44(v10, v11);
  }

  if (self) {
    id v12 = objc_getProperty(self, v8, 16LL, 1);
  }
  else {
    id v12 = 0LL;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 primaryTunnelPlugin]);

  if (v13)
  {
    if (self)
    {
      ++self->_pendingDisposeCount;
      id v16 = objc_getProperty(self, v15, 16LL, 1);
    }

    else
    {
      id v16 = 0LL;
    }

    v17 = (_BYTE *)objc_claimAutoreleasedReturnValue([v16 primaryTunnelPlugin]);
    sub_100015E44(v17, v18);
  }

  if (!self || !self->_pendingDisposeCount)
  {
    uint64_t v19 = ne_log_obj(v14, v15);
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      if (self) {
        id v22 = objc_getProperty(self, v21, 16LL, 1);
      }
      else {
        id v22 = 0LL;
      }
      v23 = (objc_class *)objc_opt_class(self);
      v24 = NSStringFromClass(v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      *(_DWORD *)buf = 138412546;
      id v30 = v22;
      __int16 v31 = 2112;
      v32 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: no plugins to dispose",  buf,  0x16u);
    }

    v26 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 queue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10006A6FC;
    block[3] = &unk_1000BEC08;
    block[4] = self;
    dispatch_async(v26, block);
  }
}

- (void)handlePluginDisposeComplete:(id)a3
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateDisposing;
  id v4 = -[NESMVPNSessionState handlePluginDisposeComplete:](&v23, "handlePluginDisposeComplete:", a3);
  if (!self || (--self->_pendingDisposeCount, !self->_pendingDisposeCount))
  {
    uint64_t v6 = ne_log_obj(v4, v5);
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if (self) {
        id Property = objc_getProperty(self, v8, 16LL, 1);
      }
      else {
        id Property = 0LL;
      }
      v10 = (objc_class *)objc_opt_class(self);
      v11 = NSStringFromClass(v10);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      *(_DWORD *)buf = 138412546;
      id v25 = Property;
      __int16 v26 = 2112;
      v27 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: all plugins have disposed",  buf,  0x16u);
    }

    if (self)
    {
      objc_msgSend(objc_getProperty(self, v13, 16, 1), "setAuthenticationPlugin:", 0);
      objc_msgSend(objc_getProperty(self, v14, 16, 1), "setPrimaryTunnelPlugin:", 0);
      id v16 = objc_msgSend(objc_getProperty(self, v15, 16, 1), "policySession");
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      sub_10002BD40((uint64_t)v17);

      if (objc_msgSend(objc_getProperty(self, v18, 16, 1), "restartPending"))
      {
LABEL_9:
        sub_10006A3E0(self, (uint64_t)v19);
        return;
      }

      id v20 = objc_getProperty(self, v19, 16LL, 1);
    }

    else
    {
      [0 setAuthenticationPlugin:0];
      [0 setPrimaryTunnelPlugin:0];
      v21 = (void *)objc_claimAutoreleasedReturnValue([0 policySession]);
      sub_10002BD40((uint64_t)v21);

      unsigned __int8 v22 = [0 restartPending];
      id v20 = 0LL;
      if ((v22 & 1) != 0) {
        goto LABEL_9;
      }
    }

    [v20 setState:1];
  }

- (void)handleTimeout
{
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___NESMVPNSessionStateDisposing;
  -[NESMVPNSessionState handleTimeout](&v27, "handleTimeout");
  if (self) {
    id Property = objc_getProperty(self, v3, 16LL, 1);
  }
  else {
    id Property = 0LL;
  }
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([Property authenticationPlugin]);

  if (v5)
  {
    if (self)
    {
      id v7 = objc_msgSend(objc_getProperty(self, v6, 16, 1), "authenticationPlugin");
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      sub_100016670(v8, v9);

      id v11 = objc_getProperty(self, v10, 16LL, 1);
    }

    else
    {
      objc_super v23 = (void *)objc_claimAutoreleasedReturnValue([0 authenticationPlugin]);
      sub_100016670(v23, v24);

      id v11 = 0LL;
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 authenticationPlugin]);
    -[NESMVPNSessionStateDisposing handlePluginDisposeComplete:](self, "handlePluginDisposeComplete:", v12);
  }

  if (self) {
    id v13 = objc_getProperty(self, v6, 16LL, 1);
  }
  else {
    id v13 = 0LL;
  }
  SEL v14 = (void *)objc_claimAutoreleasedReturnValue([v13 primaryTunnelPlugin]);

  if (v14)
  {
    if (self)
    {
      id v16 = objc_msgSend(objc_getProperty(self, v15, 16, 1), "primaryTunnelPlugin");
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      sub_100016670(v17, v18);

      id v20 = objc_getProperty(self, v19, 16LL, 1);
    }

    else
    {
      id v25 = (void *)objc_claimAutoreleasedReturnValue([0 primaryTunnelPlugin]);
      sub_100016670(v25, v26);

      id v20 = 0LL;
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 primaryTunnelPlugin]);
    -[NESMVPNSessionStateDisposing handlePluginDisposeComplete:](self, "handlePluginDisposeComplete:", v21);
  }

  else
  {
    if (self) {
      id v22 = objc_getProperty(self, v15, 16LL, 1);
    }
    else {
      id v22 = 0LL;
    }
    [v22 setState:1];
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
    id v7 = (objc_class *)objc_opt_class(self);
    v8 = NSStringFromClass(v7);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v12 = 138412546;
    id v13 = Property;
    __int16 v14 = 2112;
    SEL v15 = v9;
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

@end