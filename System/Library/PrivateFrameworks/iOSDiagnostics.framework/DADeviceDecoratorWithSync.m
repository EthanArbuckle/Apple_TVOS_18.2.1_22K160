@interface DADeviceDecoratorWithSync
+ (id)decorateDevice:(id)a3;
- (BOOL)_isDeviceLocked;
- (BOOL)isKindOfClass:(Class)a3;
- (DADevice)original;
- (DADeviceDecoratorWithSync)initWithDevice:(id)a3;
- (DADeviceDelegate)delegate;
- (DAIDSDestination)destination;
- (DAIDSMessageSender)messenger;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)_deviceStateDidChange:(id)a3;
- (void)_syncState:(id)a3;
- (void)end;
- (void)forwardInvocation:(id)a3;
- (void)idle;
- (void)receiveMessage:(id)a3 data:(id)a4 fromDestination:(id)a5 expectsResponse:(BOOL)a6 response:(id)a7;
- (void)resumeTests;
- (void)setDelegate:(id)a3;
- (void)setDestination:(id)a3;
- (void)setMessenger:(id)a3;
- (void)setOriginal:(id)a3;
- (void)start;
- (void)suspendTests;
@end

@implementation DADeviceDecoratorWithSync

+ (id)decorateDevice:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithDevice:v4];

  return v5;
}

- (DADeviceDecoratorWithSync)initWithDevice:(id)a3
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithSync original](self, "original"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 state]);
  [v6 addObserver:self selector:"_deviceStateDidChange:" name:@"com.apple.Diagnostics.deviceStateChangedNotification" object:v8];

  return self;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  uint64_t v5 = DiagnosticLogHandleForCategory(10LL);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = NSStringFromSelector(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithSync original](self, "original"));
    int v14 = 138412546;
    v15 = v8;
    __int16 v16 = 2112;
    v17 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Fast forwarding %@ to %@",  (uint8_t *)&v14,  0x16u);
  }

  v10 = (DADeviceDecoratorWithSync *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithSync original](self, "original"));
  if ((objc_opt_respondsToSelector(v10, a3) & 1) != 0) {
    v11 = v10;
  }
  else {
    v11 = self;
  }
  v12 = v11;

  return v12;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = DiagnosticLogHandleForCategory(10LL);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = NSStringFromSelector((SEL)[v4 selector]);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithSync original](self, "original"));
    int v11 = 138412546;
    v12 = v8;
    __int16 v13 = 2112;
    int v14 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Slow forwarding %@ to %@",  (uint8_t *)&v11,  0x16u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithSync original](self, "original"));
  [v4 invokeWithTarget:v10];
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithSync original](self, "original"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 methodSignatureForSelector:a3]);

  return v5;
}

- (BOOL)isKindOfClass:(Class)a3
{
  if ((Class)objc_opt_class(self, a2) == a3)
  {
    char isKindOfClass = 1;
  }

  else
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithSync original](self, "original"));
    char isKindOfClass = objc_opt_isKindOfClass(v5, a3);
  }

  return isKindOfClass & 1;
}

- (void)receiveMessage:(id)a3 data:(id)a4 fromDestination:(id)a5 expectsResponse:(BOOL)a6 response:(id)a7
{
  BOOL v8 = a6;
  id v28 = a3;
  int v11 = (void (**)(id, __CFString *, id))a7;
  id v12 = a5;
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithSync destination](self, "destination"));
  unsigned int v14 = [v12 isEqual:v13];

  if (v14)
  {
    v15 = @"messageReceived";
    if ([v28 isEqualToString:@"wakeDevice"])
    {
      if (-[DADeviceDecoratorWithSync _isDeviceLocked](self, "_isDeviceLocked"))
      {
        __int16 v16 = off_100018938;
LABEL_19:
        v27 = *v16;

        id v22 = 0LL;
        v15 = v27;
        goto LABEL_20;
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithSync original](self, "original"));
      v18 = (void *)objc_claimAutoreleasedReturnValue([v17 state]);
      if ([v18 phase] == (id)1)
      {

LABEL_14:
        -[DADeviceDecoratorWithSync start](self, "start");
        goto LABEL_15;
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithSync original](self, "original"));
      v20 = (void *)objc_claimAutoreleasedReturnValue([v19 state]);
      id v21 = [v20 phase];

      if (!v21) {
        goto LABEL_14;
      }
    }

    else if ([v28 isEqualToString:@"endDevice"])
    {
      -[DADeviceDecoratorWithSync end](self, "end");
    }

    else
    {
      if (![v28 isEqualToString:@"idleDevice"])
      {
        if (![v28 isEqualToString:@"requestDeviceState"])
        {
          __int16 v16 = off_100018940;
          goto LABEL_19;
        }

        v23 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithSync original](self, "original"));
        v24 = (void *)objc_claimAutoreleasedReturnValue([v23 state]);
        id v22 = [v24 copy];

        v25 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  mach_absolute_time());
        v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
        [v22 setTimestamp:v26];

LABEL_20:
        if (v8) {
          v11[2](v11, v15, v22);
        }

        goto LABEL_23;
      }

      -[DADeviceDecoratorWithSync idle](self, "idle");
    }

- (void)start
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithSync original](self, "original"));
  [v2 start];
}

- (void)idle
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithSync original](self, "original"));
  [v2 idle];
}

- (void)suspendTests
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithSync original](self, "original"));
  [v2 suspendTests];
}

- (void)resumeTests
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithSync original](self, "original"));
  [v2 resumeTests];
}

- (void)end
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithSync original](self, "original"));
  [v2 end];
}

- (void)_syncState:(id)a3
{
  id v4 = a3;
  if (-[DADeviceDecoratorWithSync _isDeviceLocked](self, "_isDeviceLocked"))
  {
    uint64_t v5 = DiagnosticLogHandleForCategory(7LL);
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Device is locked. Will not sync device state: %@",  buf,  0xCu);
    }
  }

  else
  {
    id v7 = [v4 copy];
    BOOL v8 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  mach_absolute_time());
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    [v7 setTimestamp:v9];

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    int v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000052E0;
    v12[3] = &unk_100018560;
    id v13 = v7;
    unsigned int v14 = self;
    v6 = (os_log_s *)v7;
    dispatch_async(v11, v12);
  }
}

- (void)_deviceStateDidChange:(id)a3
{
  id v13 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v13 userInfo]);
  uint64_t v5 = v13;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v13 userInfo]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"info"]);

    uint64_t v5 = v13;
    if (v7)
    {
      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v13 userInfo]);
      v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"info"]);

      uint64_t v11 = objc_opt_class(&OBJC_CLASS___DADeviceStateChangeNotificationInfo, v10);
      if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0)
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 snapshot]);
        -[DADeviceDecoratorWithSync _syncState:](self, "_syncState:", v12);
      }

      uint64_t v5 = v13;
    }
  }
}

- (BOOL)_isDeviceLocked
{
  int v2 = MKBGetDeviceLockState(0LL, a2);
  uint64_t v3 = DiagnosticLogHandleForCategory(8LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v2;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Current device lock state: %i",  (uint8_t *)v7,  8u);
  }

  return v2 == -1 || (v2 - 1) < 2;
}

- (DAIDSMessageSender)messenger
{
  return self->_messenger;
}

- (void)setMessenger:(id)a3
{
}

- (DAIDSDestination)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
}

- (DADeviceDelegate)delegate
{
  return (DADeviceDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
}

- (DADevice)original
{
  return self->_original;
}

- (void)setOriginal:(id)a3
{
}

- (void).cxx_destruct
{
}

@end