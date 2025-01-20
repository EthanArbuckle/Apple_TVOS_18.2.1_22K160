@interface DDWatchMessageReceiver
- (BOOL)isDeviceLocked;
- (DAIDSDestination)destination;
- (DDWatchMessageReceiver)initWithDestination:(id)a3;
- (void)receiveMessage:(id)a3 data:(id)a4 fromDestination:(id)a5 expectsResponse:(BOOL)a6 response:(id)a7;
- (void)setDestination:(id)a3;
@end

@implementation DDWatchMessageReceiver

- (DDWatchMessageReceiver)initWithDestination:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___DDWatchMessageReceiver;
  v6 = -[DDWatchMessageReceiver init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_destination, a3);
  }

  return v7;
}

- (void)receiveMessage:(id)a3 data:(id)a4 fromDestination:(id)a5 expectsResponse:(BOOL)a6 response:(id)a7
{
  id v18 = a3;
  v10 = (void (**)(id, __CFString *, void))a7;
  id v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DDWatchMessageReceiver destination](self, "destination"));
  unsigned int v13 = [v11 isEqual:v12];

  if (v13)
  {
    if ([v18 isEqualToString:@"wakeDevice"])
    {
      v14 = @"messageReceived";
      if (-[DDWatchMessageReceiver isDeviceLocked](self, "isDeviceLocked"))
      {
        v15 = @"deviceIsLocked";

        v14 = v15;
      }

      v10[2](v10, v14, 0LL);
      goto LABEL_8;
    }

    if ([v18 isEqualToString:@"requestDeviceState"])
    {
      v14 = objc_alloc_init(&OBJC_CLASS___DADeviceState);
      v16 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  mach_absolute_time());
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      -[__CFString setTimestamp:](v14, "setTimestamp:", v17);

      ((void (**)(id, __CFString *, __CFString *))v10)[2](v10, @"messageReceived", v14);
LABEL_8:
    }
  }
}

- (BOOL)isDeviceLocked
{
  int v2 = MKBGetDeviceLockState(0LL, a2);
  uint64_t v3 = DiagnosticLogHandleForCategory(8LL);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v2;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Current device lock state: %i",  (uint8_t *)v7,  8u);
  }

  return v2 == -1 || (v2 - 1) < 2;
}

- (DAIDSDestination)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
}

- (void).cxx_destruct
{
}

@end