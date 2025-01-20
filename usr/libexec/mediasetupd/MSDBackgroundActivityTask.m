@interface MSDBackgroundActivityTask
- (BOOL)allowBattery;
- (BOOL)repeats;
- (BOOL)requireInexpensiveNetworkConnection;
- (BOOL)requireNetworkConnection;
- (MSDBackgroundActivityTask)initWithIdentifier:(id)a3;
- (NSString)identifier;
- (double)interval;
- (id)activityBlock;
- (int64_t)qualityOfService;
- (void)checkIn;
- (void)invalidate;
- (void)schedule;
- (void)setActivityBlock:(id)a3;
- (void)setAllowBattery:(BOOL)a3;
- (void)setInterval:(double)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setRepeats:(BOOL)a3;
- (void)setRequireInexpensiveNetworkConnection:(BOOL)a3;
- (void)setRequireNetworkConnection:(BOOL)a3;
@end

@implementation MSDBackgroundActivityTask

- (MSDBackgroundActivityTask)initWithIdentifier:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v19.receiver = self;
    v19.super_class = (Class)&OBJC_CLASS___MSDBackgroundActivityTask;
    v6 = -[MSDBackgroundActivityTask init](&v19, "init");
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_identifier, a3);
      v7->_qualityOfService = 9LL;
    }

    self = v7;
    v8 = self;
  }

  else
  {
    id v9 = sub_10003E9DC();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10000BAF4(v10, v11, v12, v13, v14, v15, v16, v17);
    }

    v8 = 0LL;
  }

  return v8;
}

- (void)checkIn
{
  id v3 = sub_10003E9DC();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    int v15 = 136315395;
    uint64_t v16 = "-[MSDBackgroundActivityTask checkIn]";
    __int16 v17 = 2113;
    v18 = identifier;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s Checking-in with identifier %{private}@",  (uint8_t *)&v15,  0x16u);
  }

  if (self->_activityBlock)
  {
    v6 = -[NSBackgroundActivityScheduler initWithIdentifier:]( objc_alloc(&OBJC_CLASS___NSBackgroundActivityScheduler),  "initWithIdentifier:",  self->_identifier);
    -[NSBackgroundActivityScheduler setPreregistered:](v6, "setPreregistered:", 1LL);
  }

  else
  {
    id v7 = sub_10003E9DC();
    v6 = (NSBackgroundActivityScheduler *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR)) {
      sub_10000BB24((os_log_s *)v6, v8, v9, v10, v11, v12, v13, v14);
    }
  }
}

- (void)invalidate
{
  v2 = -[NSBackgroundActivityScheduler initWithIdentifier:]( objc_alloc(&OBJC_CLASS___NSBackgroundActivityScheduler),  "initWithIdentifier:",  self->_identifier);
  -[NSBackgroundActivityScheduler invalidate](v2, "invalidate");
}

- (void)schedule
{
  id activityBlock = self->_activityBlock;
  id v4 = sub_10003E9DC();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (activityBlock)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      identifier = self->_identifier;
      BOOL repeats = self->_repeats;
      BOOL allowBattery = self->_allowBattery;
      BOOL requireNetworkConnection = self->_requireNetworkConnection;
      BOOL requireInexpensiveNetworkConnection = self->_requireInexpensiveNetworkConnection;
      double interval = self->_interval;
      int64_t qualityOfService = self->_qualityOfService;
      int v22 = 138479363;
      v23 = identifier;
      __int16 v24 = 1024;
      BOOL v25 = repeats;
      __int16 v26 = 2048;
      double v27 = interval;
      __int16 v28 = 1024;
      BOOL v29 = allowBattery;
      __int16 v30 = 1024;
      BOOL v31 = requireNetworkConnection;
      __int16 v32 = 1024;
      BOOL v33 = requireInexpensiveNetworkConnection;
      __int16 v34 = 2048;
      int64_t v35 = qualityOfService;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Scheduling block for execution at a later time: identifier %{private}@, repeats: %d, interval %f, allowBattery: %d, networkConnection: %d, inexpensiveNetworkConnection: %d, Quality of service %ld",  (uint8_t *)&v22,  0x38u);
    }

    v6 = -[NSBackgroundActivityScheduler initWithIdentifier:]( objc_alloc(&OBJC_CLASS___NSBackgroundActivityScheduler),  "initWithIdentifier:",  self->_identifier);
    -[os_log_s setInterval:](v6, "setInterval:", fmax(self->_interval, 2.0));
    -[os_log_s setQualityOfService:](v6, "setQualityOfService:", self->_qualityOfService);
    -[os_log_s setRepeats:](v6, "setRepeats:", self->_repeats);
    xpc_object_t v14 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_BOOL(v14, XPC_ACTIVITY_ALLOW_BATTERY, self->_allowBattery);
    xpc_dictionary_set_BOOL( v14,  XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY,  self->_requireInexpensiveNetworkConnection);
    xpc_dictionary_set_BOOL(v14, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, self->_requireNetworkConnection);
    -[os_log_s _setAdditionalXPCActivityProperties:](v6, "_setAdditionalXPCActivityProperties:", v14);
    -[os_log_s scheduleWithBlock:](v6, "scheduleWithBlock:", self->_activityBlock);
  }

  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    sub_10000BB54(v6, v15, v16, v17, v18, v19, v20, v21);
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)activityBlock
{
  return self->_activityBlock;
}

- (void)setActivityBlock:(id)a3
{
}

- (BOOL)allowBattery
{
  return self->_allowBattery;
}

- (void)setAllowBattery:(BOOL)a3
{
  self->_BOOL allowBattery = a3;
}

- (double)interval
{
  return self->_interval;
}

- (void)setInterval:(double)a3
{
  self->_double interval = a3;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_int64_t qualityOfService = a3;
}

- (BOOL)repeats
{
  return self->_repeats;
}

- (void)setRepeats:(BOOL)a3
{
  self->_BOOL repeats = a3;
}

- (BOOL)requireInexpensiveNetworkConnection
{
  return self->_requireInexpensiveNetworkConnection;
}

- (void)setRequireInexpensiveNetworkConnection:(BOOL)a3
{
  self->_BOOL requireInexpensiveNetworkConnection = a3;
}

- (BOOL)requireNetworkConnection
{
  return self->_requireNetworkConnection;
}

- (void)setRequireNetworkConnection:(BOOL)a3
{
  self->_BOOL requireNetworkConnection = a3;
}

- (void).cxx_destruct
{
}

@end