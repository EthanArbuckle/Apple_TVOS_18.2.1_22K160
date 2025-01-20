@interface APSSystemMonitor
+ (id)sharedInstance;
- (APSSystemMonitor)init;
- (BOOL)isActive;
- (BOOL)isScreenLit;
- (BOOL)isSystemLocked;
- (BOOL)systemIsSleeping;
- (BOOL)usesPowerNotifications;
- (BOOL)watchesScreenLightState;
- (BOOL)watchesSystemLockState;
- (NSDate)dateScreenLightLastChanged;
- (NSDate)dateSystemLockLastChanged;
- (void)_deliverNotificationSelector:(SEL)a3;
- (void)_setSystemLockState:(BOOL)a3;
- (void)_setSystemScreenState:(BOOL)a3;
- (void)_systemDidWake;
- (void)_systemWillSleep;
- (void)addListener:(id)a3;
- (void)dealloc;
- (void)removeListener:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setUsesPowerNotifications:(BOOL)a3;
- (void)setWatchesScreenLightState:(BOOL)a3;
- (void)setWatchesSystemLockState:(BOOL)a3;
@end

@implementation APSSystemMonitor

+ (id)sharedInstance
{
  if (qword_10014EA00 != -1) {
    dispatch_once(&qword_10014EA00, &stru_1001211A0);
  }
  return (id)qword_10014E9F8;
}

- (APSSystemMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___APSSystemMonitor;
  v2 = -[APSSystemMonitor init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    listeners = v2->_listeners;
    v2->_listeners = (NSHashTable *)v3;
  }

  return v2;
}

- (void)dealloc
{
  if (dword_10014E1B8 != -1)
  {
    notify_cancel(dword_10014E1B8);
    dword_10014E1B8 = -1;
  }

  if (dword_10014E1BC != -1)
  {
    notify_cancel(dword_10014E1BC);
    dword_10014E1BC = -1;
  }

  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:0 object:0];

  sub_1000A2F50();
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___APSSystemMonitor;
  -[APSSystemMonitor dealloc](&v4, "dealloc");
}

- (void)_deliverNotificationSelector:(SEL)a3
{
  if (-[APSSystemMonitor isActive](self, "isActive"))
  {
    v5 = self;
    objc_sync_enter(v5);
    if (-[NSHashTable count](v5->_listeners, "count")) {
      id v6 = -[NSHashTable copy](v5->_listeners, "copy");
    }
    else {
      id v6 = 0LL;
    }
    objc_sync_exit(v5);

    sub_1000A2FA4(a3, v6);
  }

- (void)_systemDidWake
{
  self->_willSleep = 0;
  -[APSSystemMonitor _deliverNotificationSelector:](self, "_deliverNotificationSelector:", "systemDidWake");
}

- (void)_systemWillSleep
{
  self->_willSleep = 1;
  -[APSSystemMonitor _deliverNotificationSelector:](self, "_deliverNotificationSelector:", "systemWillSleep");
}

- (void)setWatchesSystemLockState:(BOOL)a3
{
  if (self->_watchesSystemLockState != a3)
  {
    self->_watchesSystemLockState = a3;
    if (a3)
    {
      if (dword_10014E1B8 == -1)
      {
        notify_register_dispatch( "com.apple.springboard.lockstate",  &dword_10014E1B8,  &_dispatch_main_q,  &stru_1001211E0);
        uint64_t state64 = 0LL;
        notify_get_state(dword_10014E1B8, &state64);
        uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[APSSystemMonitor sharedInstance](&OBJC_CLASS___APSSystemMonitor, "sharedInstance"));
        [v3 _setSystemLockState:state64 != 0];
      }
    }

    else if (dword_10014E1B8 != -1)
    {
      notify_cancel(dword_10014E1B8);
      dword_10014E1B8 = -1;
    }
  }

- (void)setWatchesScreenLightState:(BOOL)a3
{
  if (self->_watchesScreenLightState != a3)
  {
    self->_watchesScreenLightState = a3;
    if (a3)
    {
      if (dword_10014E1BC == -1)
      {
        notify_register_dispatch( "com.apple.springboard.hasBlankedScreen",  &dword_10014E1BC,  &_dispatch_main_q,  &stru_100121200);
        uint64_t state64 = 0LL;
        notify_get_state(dword_10014E1BC, &state64);
        uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[APSSystemMonitor sharedInstance](&OBJC_CLASS___APSSystemMonitor, "sharedInstance"));
        [v3 _setSystemScreenState:state64 == 0];
      }
    }

    else if (dword_10014E1BC != -1)
    {
      notify_cancel(dword_10014E1BC);
      dword_10014E1BC = -1;
    }
  }

- (void)setUsesPowerNotifications:(BOOL)a3
{
  if (self->_usesPowerNotifications != a3)
  {
    if (a3)
    {
      if (!dword_10014EA08)
      {
        dword_10014EA08 = IORegisterForSystemPower( 0LL,  (IONotificationPortRef *)&qword_10014EA10,  (IOServiceInterestCallback)sub_1000A38D8,  dword_10014EA18);
        if (dword_10014EA08)
        {
          IONotificationPortSetDispatchQueue((IONotificationPortRef)qword_10014EA10, &_dispatch_main_q);
        }

        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
        {
          sub_1000C0894();
        }
      }
    }

    else
    {
      sub_1000A2F50();
    }
  }

- (void)_setSystemScreenState:(BOOL)a3
{
  if (self->_screenLit != a3)
  {
    BOOL v3 = a3;
    self->_screenLit = a3;
    v5 = self->_dateScreenLightLastChanged;
    id v6 = objc_alloc_init(&OBJC_CLASS___NSDate);
    dateScreenLightLastChanged = self->_dateScreenLightLastChanged;
    self->_dateScreenLightLastChanged = v6;

    BOOL v8 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v8)
      {
        -[NSDate timeIntervalSinceNow](v5, "timeIntervalSinceNow");
        int v12 = 134217984;
        double v13 = fabs(v9);
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Screen did light up (Was down for %f seconds)",  (uint8_t *)&v12,  0xCu);
      }

      v10 = &selRef_systemScreenDidPowerUp;
    }

    else
    {
      if (v8)
      {
        -[NSDate timeIntervalSinceNow](v5, "timeIntervalSinceNow");
        int v12 = 134217984;
        double v13 = fabs(v11);
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Screen did light down (Was lit for %f seconds)",  (uint8_t *)&v12,  0xCu);
      }

      v10 = &selRef_systemScreenDidPowerDown;
    }

    -[APSSystemMonitor _deliverNotificationSelector:](self, "_deliverNotificationSelector:", *v10);
  }

- (void)_setSystemLockState:(BOOL)a3
{
  if (self->_systemLocked != a3)
  {
    BOOL v3 = a3;
    self->_systemLocked = a3;
    v5 = self->_dateSystemLockLastChanged;
    id v6 = objc_alloc_init(&OBJC_CLASS___NSDate);
    dateSystemLockLastChanged = self->_dateSystemLockLastChanged;
    self->_dateSystemLockLastChanged = v6;

    BOOL v8 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v8)
      {
        -[NSDate timeIntervalSinceNow](v5, "timeIntervalSinceNow");
        int v12 = 134217984;
        double v13 = fabs(v9);
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Screen did lock (Was unlocked for %f seconds)",  (uint8_t *)&v12,  0xCu);
      }

      v10 = &selRef_systemDidLock;
    }

    else
    {
      if (v8)
      {
        -[NSDate timeIntervalSinceNow](v5, "timeIntervalSinceNow");
        int v12 = 134217984;
        double v13 = fabs(v11);
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Screen did unlock (Was locked for %f seconds)",  (uint8_t *)&v12,  0xCu);
      }

      v10 = &selRef_systemDidUnlock;
    }

    -[APSSystemMonitor _deliverNotificationSelector:](self, "_deliverNotificationSelector:", *v10);
  }

- (void)addListener:(id)a3
{
  id v5 = a3;
  objc_super v4 = self;
  objc_sync_enter(v4);
  if (!-[NSHashTable containsObject:](v4->_listeners, "containsObject:", v5)) {
    -[NSHashTable addObject:](v4->_listeners, "addObject:", v5);
  }
  objc_sync_exit(v4);
}

- (void)removeListener:(id)a3
{
  id v5 = a3;
  objc_super v4 = self;
  objc_sync_enter(v4);
  -[NSHashTable removeObject:](v4->_listeners, "removeObject:", v5);
  objc_sync_exit(v4);
}

- (BOOL)watchesScreenLightState
{
  return self->_watchesScreenLightState;
}

- (BOOL)systemIsSleeping
{
  return self->_willSleep;
}

- (BOOL)watchesSystemLockState
{
  return self->_watchesSystemLockState;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)isScreenLit
{
  return self->_screenLit;
}

- (NSDate)dateScreenLightLastChanged
{
  return self->_dateScreenLightLastChanged;
}

- (NSDate)dateSystemLockLastChanged
{
  return self->_dateSystemLockLastChanged;
}

- (BOOL)isSystemLocked
{
  return self->_systemLocked;
}

- (BOOL)usesPowerNotifications
{
  return self->_usesPowerNotifications;
}

- (void).cxx_destruct
{
}

@end