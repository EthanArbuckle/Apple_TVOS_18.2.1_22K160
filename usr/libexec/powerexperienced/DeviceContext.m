@interface DeviceContext
+ (DeviceContext)sharedInstance;
- (DeviceContext)init;
- (NSMutableDictionary)currentContext;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (id)objectForKeyedSubscript:(id)a3;
- (void)handleBatteryLevelChange;
- (void)handleLockStateChange;
- (void)handlePowerSourceChange;
- (void)handleXPCEvent:(id)a3;
- (void)initLockStateChange;
- (void)initPowerSourceChange;
- (void)initializeMonitors;
- (void)setCurrentContext:(id)a3;
- (void)setLog:(id)a3;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
- (void)setQueue:(id)a3;
- (void)start;
@end

@implementation DeviceContext

- (DeviceContext)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___DeviceContext;
  v2 = -[DeviceContext init](&v10, "init");
  if (v2)
  {
    id v3 = sub_100009834();
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    -[DeviceContext setQueue:](v2, "setQueue:", v4);

    os_log_t v5 = os_log_create("com.apple.powerexperienced", "contextmonitor");
    log = v2->_log;
    v2->_log = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    currentContext = v2->_currentContext;
    v2->_currentContext = v7;
  }

  return v2;
}

- (void)start
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Starting Device Context", v4, 2u);
  }

  -[DeviceContext initializeMonitors](self, "initializeMonitors");
}

- (void)initializeMonitors
{
  id v3 = (void *)MGGetStringAnswer(@"DeviceClass", a2);
  v4 = @"iPhone";
  unsigned __int8 v5 = [v3 isEqualToString:@"iPhone"];

  if ((v5 & 1) != 0) {
    goto LABEL_5;
  }
  v7 = (void *)MGGetStringAnswer(@"DeviceClass", v6);
  v4 = @"Watch";
  unsigned __int8 v8 = [v7 isEqualToString:@"Watch"];

  if ((v8 & 1) != 0) {
    goto LABEL_5;
  }
  objc_super v10 = (void *)MGGetStringAnswer(@"DeviceClass", v9);
  unsigned int v11 = [v10 isEqualToString:@"AppleTV"];

  if (v11)
  {
    v4 = @"TV";
LABEL_5:
    -[DeviceContext setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v4, @"kPlatformContext");
  }

  -[DeviceContext initPowerSourceChange](self, "initPowerSourceChange");
  -[DeviceContext initLockStateChange](self, "initLockStateChange");
}

- (void)handleXPCEvent:(id)a3
{
  id v4 = a3;
  id v5 = sub_100009834();
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  dispatch_assert_queue_V2(v6);

  string = xpc_dictionary_get_string(v4, _xpc_event_key_name);
  if (!strcmp(string, "com.apple.system.powersources.source"))
  {
    -[DeviceContext handlePowerSourceChange](self, "handlePowerSourceChange");
  }

  else if (!strcmp(string, "com.apple.springboard.lockstate"))
  {
    -[DeviceContext handleLockStateChange](self, "handleLockStateChange");
  }

- (void)handlePowerSourceChange
{
  uint64_t v3 = IOPSDrawingUnlimitedPower(self, a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
  -[DeviceContext setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v4, @"kPluggedInContext");

  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[DeviceContext log](self, "log"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Power source update. AC powered %d",  (uint8_t *)v6,  8u);
  }
}

- (void)handleBatteryLevelChange
{
  if (!IOPSGetPercentRemaining(&v8, &v7, &v6))
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v8));
    -[DeviceContext setObject:forKeyedSubscript:]( self,  "setObject:forKeyedSubscript:",  v3,  @"kBatteryLevelContext");

    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[DeviceContext log](self, "log"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue( -[DeviceContext objectForKeyedSubscript:]( self,  "objectForKeyedSubscript:",  @"kBatteryLevelContext"));
      *(_DWORD *)buf = 138412290;
      objc_super v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "battery level %@", buf, 0xCu);
    }
  }

- (void)initPowerSourceChange
{
  if (notify_register_check("com.apple.system.powersources.source", &dword_10001B708))
  {
    uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[DeviceContext log](self, "log"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10000D600(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }

  unsigned int v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DeviceContext queue](self, "queue"));
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100008B00;
  handler[3] = &unk_1000145F8;
  handler[4] = self;
  uint32_t v12 = notify_register_dispatch("com.apple.system.powersources.percent", &dword_10001B70C, v11, handler);

  if (v12)
  {
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[DeviceContext log](self, "log"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10000D5D0(v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }

  v21 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DeviceContext queue](self, "queue"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100008B08;
  v22[3] = &unk_1000145B0;
  v22[4] = self;
  dispatch_async(v21, v22);
}

- (void)initLockStateChange
{
  if (notify_register_check("com.apple.springboard.lockstate", &dword_10001B710))
  {
    uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[DeviceContext log](self, "log"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10000D630(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }

  -[DeviceContext handleLockStateChange](self, "handleLockStateChange");
}

- (void)handleLockStateChange
{
  id v3 = sub_100009834();
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  dispatch_assert_queue_V2(v4);

  uint64_t state64 = 0LL;
  if (notify_get_state(dword_10001B710, &state64))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  state64));
    -[DeviceContext setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v5, @"kLockStateContext");
  }

+ (DeviceContext)sharedInstance
{
  if (qword_10001B720 != -1) {
    dispatch_once(&qword_10001B720, &stru_100014618);
  }
  return (DeviceContext *)(id)qword_10001B718;
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceContext currentContext](self, "currentContext"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v4]);
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  return v7;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[DeviceContext willChangeValueForKey:](self, "willChangeValueForKey:", @"currentContext");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceContext currentContext](self, "currentContext"));
  [v8 setObject:v7 forKeyedSubscript:v6];

  -[DeviceContext didChangeValueForKey:](self, "didChangeValueForKey:", @"currentContext");
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (NSMutableDictionary)currentContext
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setCurrentContext:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
}

@end