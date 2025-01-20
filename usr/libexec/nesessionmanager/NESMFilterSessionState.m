@interface NESMFilterSessionState
+ (id)stateWithType:(int64_t)a3;
- (BOOL)canSleep;
- (BOOL)handleSleep;
- (NESMFilterSessionState)initWithType:(int64_t)a3 andTimeout:(int64_t)a4;
- (int64_t)type;
- (void)enterWithSession:(id)a3;
- (void)handlePlugin:(id)a3 statusDidChangeToIdleWithError:(int64_t)a4;
- (void)handlePlugin:(id)a3 statusDidChangeToStoppingWithError:(int64_t)a4;
- (void)handlePluginDisposeComplete:(id)a3;
- (void)handlePluginStatusDidChangeToRunning:(id)a3;
- (void)handlePluginStatusDidChangeToStarting:(id)a3;
- (void)handlePluginStatusDidChangeToUpdating:(id)a3;
- (void)handleStartMessage:(id)a3;
- (void)handleStop;
- (void)handleTimeout;
- (void)handleUpdateConfiguration;
- (void)handleWakeup;
- (void)leave;
@end

@implementation NESMFilterSessionState

- (NESMFilterSessionState)initWithType:(int64_t)a3 andTimeout:(int64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NESMFilterSessionState;
  v6 = -[NESMFilterSessionState init](&v10, "init");
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
  if (self) {
    objc_setProperty_atomic(self, v5, v4, 16LL);
  }
  uint64_t v7 = ne_log_obj(v4, v5);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (objc_class *)objc_opt_class(self);
    objc_super v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    *(_DWORD *)buf = 138412546;
    v16 = v6;
    __int16 v17 = 2112;
    v18 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@: Entering state %@", buf, 0x16u);
  }

  if (self && self->_timeout >= 1 && (objc_opt_respondsToSelector(self, "handleTimeout") & 1) != 0)
  {
    dispatch_time_t v12 = dispatch_time(0LL, 1000000000 * self->_timeout);
    v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 queue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005CC68;
    block[3] = &unk_1000BEC08;
    block[4] = self;
    dispatch_after(v12, v13, block);
  }
}

- (void)leave
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
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v11 = 138412546;
    id v12 = Property;
    __int16 v13 = 2112;
    v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@: Leaving state %@", (uint8_t *)&v11, 0x16u);
  }

  if (self) {
    objc_setProperty_atomic(self, v10, 0LL, 16LL);
  }
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
    v14 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: received start message",  (uint8_t *)&v11,  0x16u);
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
    v15 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: received stop message",  (uint8_t *)&v12,  0x16u);
  }

  if (self) {
    int v11 = (id *)objc_getProperty(self, v10, 16LL, 1);
  }
  else {
    int v11 = 0LL;
  }
  sub_1000714E4(v11, (const char *)4);
}

- (void)handlePlugin:(id)a3 statusDidChangeToIdleWithError:(int64_t)a4
{
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
    id v13 = NSStringFromClass(v12);
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    int v19 = 138413058;
    id v20 = Property;
    __int16 v21 = 2112;
    v22 = v14;
    __int16 v23 = 2112;
    id v24 = v6;
    __int16 v25 = 2048;
    int64_t v26 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: plugin %@ status changed to idle with error: %ld",  (uint8_t *)&v19,  0x2Au);
  }

  if (a4 == 2)
  {
    if (self) {
      id v16 = objc_getProperty(self, v15, 16LL, 1);
    }
    else {
      id v16 = 0LL;
    }
    uint64_t v17 = 6LL;
  }

  else
  {
    if (a4 != 1) {
      goto LABEL_14;
    }
    if (self) {
      id v16 = objc_getProperty(self, v15, 16LL, 1);
    }
    else {
      id v16 = 0LL;
    }
    uint64_t v17 = 7LL;
  }

  [v16 setLastStopReason:v17];
LABEL_14:
  if (self) {
    v18 = (id *)objc_getProperty(self, v15, 16LL, 1);
  }
  else {
    v18 = 0LL;
  }
  sub_1000714E4(v18, (const char *)4);
}

- (void)handlePluginStatusDidChangeToStarting:(id)a3
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
    objc_super v10 = (objc_class *)objc_opt_class(self);
    int v11 = NSStringFromClass(v10);
    int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    int v13 = 138412802;
    id v14 = Property;
    __int16 v15 = 2112;
    id v16 = v12;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: plugin %@ status changed to starting",  (uint8_t *)&v13,  0x20u);
  }
}

- (void)handlePluginStatusDidChangeToRunning:(id)a3
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
    objc_super v10 = (objc_class *)objc_opt_class(self);
    int v11 = NSStringFromClass(v10);
    int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    int v13 = 138412802;
    id v14 = Property;
    __int16 v15 = 2112;
    id v16 = v12;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: plugin %@ status changed to running",  (uint8_t *)&v13,  0x20u);
  }
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
    objc_super v10 = (objc_class *)objc_opt_class(self);
    int v11 = NSStringFromClass(v10);
    int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    int v15 = 138412802;
    id v16 = Property;
    __int16 v17 = 2112;
    id v18 = v12;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: plugin %@ status changed to updating",  (uint8_t *)&v15,  0x20u);
  }

  if (self) {
    id v14 = (id *)objc_getProperty(self, v13, 16LL, 1);
  }
  else {
    id v14 = 0LL;
  }
  sub_1000714E4(v14, (const char *)5);
}

- (void)handlePlugin:(id)a3 statusDidChangeToStoppingWithError:(int64_t)a4
{
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
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    int v18 = 138413058;
    id v19 = Property;
    __int16 v20 = 2112;
    __int16 v21 = v14;
    __int16 v22 = 2112;
    id v23 = v6;
    __int16 v24 = 2048;
    int64_t v25 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: plugin %@ status changed to stopping with error %ld",  (uint8_t *)&v18,  0x2Au);
  }

  if (a4 == 1)
  {
    if (self) {
      id v16 = objc_getProperty(self, v15, 16LL, 1);
    }
    else {
      id v16 = 0LL;
    }
    [v16 setLastStopReason:7];
  }

  if (self) {
    __int16 v17 = (id *)objc_getProperty(self, v15, 16LL, 1);
  }
  else {
    __int16 v17 = 0LL;
  }
  sub_1000714E4(v17, (const char *)4);
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
    objc_super v10 = (objc_class *)objc_opt_class(self);
    int v11 = NSStringFromClass(v10);
    int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    int v13 = 138412802;
    id v14 = Property;
    __int16 v15 = 2112;
    id v16 = v12;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: plugin %@ disposed",  (uint8_t *)&v13,  0x20u);
  }
}

- (BOOL)handleSleep
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
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v11 = 138412546;
    id v12 = Property;
    __int16 v13 = 2112;
    id v14 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: handle sleep",  (uint8_t *)&v11,  0x16u);
  }

  return 0;
}

- (BOOL)canSleep
{
  return 1;
}

- (void)handleWakeup
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
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v10 = 138412546;
    id v11 = Property;
    __int16 v12 = 2112;
    __int16 v13 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: handle wake up",  (uint8_t *)&v10,  0x16u);
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
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v12 = 138412546;
    id v13 = Property;
    __int16 v14 = 2112;
    __int16 v15 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: timed out",  (uint8_t *)&v12,  0x16u);
  }

  if (self) {
    id v11 = (id *)objc_getProperty(self, v10, 16LL, 1);
  }
  else {
    id v11 = 0LL;
  }
  sub_1000714E4(v11, (const char *)4);
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
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v10 = 138412546;
    id v11 = Property;
    __int16 v12 = 2112;
    id v13 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%@ in state %@: configuration changed",  (uint8_t *)&v10,  0x16u);
  }
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
}

+ (id)stateWithType:(int64_t)a3
{
  else {
    return objc_alloc_init(*off_1000BE320[a3 - 1]);
  }
}

@end