@interface NESMFilterSessionStateStopping
- (NESMFilterSessionStateStopping)init;
- (void)enterWithSession:(id)a3;
- (void)handlePluginDisposeComplete:(id)a3;
- (void)handleTimeout;
@end

@implementation NESMFilterSessionStateStopping

- (NESMFilterSessionStateStopping)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NESMFilterSessionStateStopping;
  result = -[NESMFilterSessionState initWithType:andTimeout:](&v3, "initWithType:andTimeout:", 4LL, 20LL);
  if (result) {
    result->_pendingDisposeCount = 0;
  }
  return result;
}

- (void)enterWithSession:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___NESMFilterSessionStateStopping;
  -[NESMFilterSessionState enterWithSession:](&v33, "enterWithSession:", v4);
  if (self) {
    id Property = objc_getProperty(self, v5, 16LL, 1);
  }
  else {
    id Property = 0LL;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue([Property server]);
  v9 = v7;
  if (self)
  {
    objc_msgSend(v7, "requestUninstallForSession:", objc_getProperty(self, v8, 16, 1));

    self->_pendingDisposeCount = 0;
    id v11 = objc_getProperty(self, v10, 16LL, 1);
    if (v11) {
      id v11 = objc_getProperty(v11, v12, 400LL, 1);
    }
  }

  else
  {
    [v7 requestUninstallForSession:0];

    id v11 = 0LL;
  }

  id v13 = v11;

  if (v13)
  {
    if (self)
    {
      ++self->_pendingDisposeCount;
      id v15 = objc_getProperty(self, v14, 16LL, 1);
      if (v15) {
        id v15 = objc_getProperty(v15, v16, 400LL, 1);
      }
    }

    else
    {
      id v15 = 0LL;
    }

    v17 = v15;
    sub_100015E44(v17, v18);
  }

  if (self)
  {
    id v19 = objc_getProperty(self, v14, 16LL, 1);
    if (v19) {
      id v19 = objc_getProperty(v19, v20, 408LL, 1);
    }
  }

  else
  {
    id v19 = 0LL;
  }

  id v21 = v19;

  if (v21)
  {
    if (self)
    {
      ++self->_pendingDisposeCount;
      id v23 = objc_getProperty(self, v22, 16LL, 1);
      if (v23) {
        id v23 = objc_getProperty(v23, v24, 408LL, 1);
      }
    }

    else
    {
      id v23 = 0LL;
    }

    v25 = v23;
    sub_100015E44(v25, v26);
  }

  if (!self) {
    goto LABEL_25;
  }
  if (!self->_pendingDisposeCount)
  {
    id v27 = objc_getProperty(self, v22, 16LL, 1);
    if (v27) {
      objc_setProperty_atomic(v27, v28, 0LL, 400LL);
    }
    id v29 = objc_getProperty(self, v28, 16LL, 1);
    if (v29) {
      objc_setProperty_atomic(v29, v30, 0LL, 408LL);
    }
LABEL_25:
    v31 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 queue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005D540;
    block[3] = &unk_1000BEC08;
    block[4] = self;
    dispatch_async(v31, block);
  }
}

- (void)handlePluginDisposeComplete:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NESMFilterSessionStateStopping;
  -[NESMFilterSessionState handlePluginDisposeComplete:](&v9, "handlePluginDisposeComplete:", a3);
  if (self)
  {
    if (!--self->_pendingDisposeCount)
    {
      id Property = objc_getProperty(self, v4, 16LL, 1);
      if (Property) {
        objc_setProperty_atomic(Property, v6, 0LL, 400LL);
      }
      id v7 = objc_getProperty(self, v6, 16LL, 1);
      if (v7) {
        objc_setProperty_atomic(v7, v8, 0LL, 408LL);
      }
      sub_10005D3B0(self, v8);
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
    id v7 = (objc_class *)objc_opt_class(self);
    v8 = NSStringFromClass(v7);
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v25 = 138412546;
    id v26 = Property;
    __int16 v27 = 2112;
    v28 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: timed out",  (uint8_t *)&v25,  0x16u);
  }

  if (self)
  {
    id v11 = objc_getProperty(self, v10, 16LL, 1);
    if (v11) {
      id v11 = objc_getProperty(v11, v12, 400LL, 1);
    }
    id v13 = v11;
    sub_100016670(v13, v14);

    id v16 = objc_getProperty(self, v15, 16LL, 1);
    if (v16) {
      id v16 = objc_getProperty(v16, v17, 408LL, 1);
    }
  }

  else
  {
    id v16 = 0LL;
  }

  id v18 = v16;
  sub_100016670(v18, v19);

  if (self)
  {
    id v21 = objc_getProperty(self, v20, 16LL, 1);
    if (v21) {
      objc_setProperty_atomic(v21, v22, 0LL, 400LL);
    }
    id v23 = objc_getProperty(self, v22, 16LL, 1);
    if (v23) {
      objc_setProperty_atomic(v23, v24, 0LL, 408LL);
    }
    sub_10005D3B0(self, v24);
  }

@end