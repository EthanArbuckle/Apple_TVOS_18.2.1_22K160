@interface RMDeviceLockStateListener
+ (id)newListenerWithDelegate:(id)a3;
- (RMDebounceTimer)debouncer;
- (RMDeviceLockStateListener)initWithDelegate:(id)a3;
- (RMDeviceLockStateListenerDelegate)delegate;
- (void)didReceiveNotificationForStream:(id)a3 notificationName:(id)a4;
- (void)setDebouncer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startListening;
- (void)stopListening;
- (void)triggerAggregatingTimerAction;
@end

@implementation RMDeviceLockStateListener

+ (id)newListenerWithDelegate:(id)a3
{
  id v3 = a3;
  v4 = -[RMDeviceLockStateListener initWithDelegate:]( objc_alloc(&OBJC_CLASS___RMDeviceLockStateListener),  "initWithDelegate:",  v3);

  return v4;
}

- (RMDeviceLockStateListener)initWithDelegate:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___RMDeviceLockStateListener;
  v5 = -[RMDeviceLockStateListener init](&v13, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    uint64_t v7 = objc_claimAutoreleasedReturnValue( +[RMDebounceTimer debounceTimerWithMinimumInterval:maximumInterval:delegate:identifier:]( &OBJC_CLASS___RMDebounceTimer,  "debounceTimerWithMinimumInterval:maximumInterval:delegate:identifier:",  v6,  @"RMDeviceLockStateListener",  1.0,  5.0));
    debouncer = v6->_debouncer;
    v6->_debouncer = (RMDebounceTimer *)v7;

    v9 = objc_opt_new(&OBJC_CLASS___NSObject);
    syncLock = v6->_syncLock;
    v6->_syncLock = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[RMDevice currentDevice](&OBJC_CLASS___RMDevice, "currentDevice"));
    v6->_previousLockState = [v11 locked];

    v6->_listening = 0;
  }

  return v6;
}

- (void)startListening
{
  if (!self->_listening)
  {
    id v3 = self->_syncLock;
    objc_sync_enter(v3);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog deviceLockState](&OBJC_CLASS___RMLog, "deviceLockState"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_10002753C(v4, v5, v6, v7, v8, v9, v10, v11);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[RMDevice currentDevice](&OBJC_CLASS___RMDevice, "currentDevice"));
    self->_previousLockState = [v12 locked];

    objc_super v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog deviceLockState](&OBJC_CLASS___RMLog, "deviceLockState"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_previousLockState));
      sub_1000274E8(v14, v17, v13);
    }

    if (MKBDeviceFormattedForContentProtection())
    {
      id v15 = +[RMXPCEvent newXPCEventForDarwinNotification:]( &OBJC_CLASS___RMXPCEvent,  "newXPCEventForDarwinNotification:",  @"com.apple.mobile.keybagd.lock_status");
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[RMXPCNotifications sharedNotifier](&OBJC_CLASS___RMXPCNotifications, "sharedNotifier"));
      [v16 addObserverForEvent:v15 observer:self];
    }

    self->_listening = 1;
    objc_sync_exit(v3);
  }

- (void)stopListening
{
  if (self->_listening)
  {
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog deviceLockState](&OBJC_CLASS___RMLog, "deviceLockState"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_100027570(v3, v4, v5, v6, v7, v8, v9, v10);
    }

    uint64_t v11 = self->_syncLock;
    objc_sync_enter(v11);
    id v12 = +[RMXPCEvent newXPCEventForDarwinNotification:]( &OBJC_CLASS___RMXPCEvent,  "newXPCEventForDarwinNotification:",  @"com.apple.mobile.keybagd.lock_status");
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(+[RMXPCNotifications sharedNotifier](&OBJC_CLASS___RMXPCNotifications, "sharedNotifier"));
    [v13 removeObserverForEvent:v12];

    self->_listening = 0;
    objc_sync_exit(v11);
  }

- (void)didReceiveNotificationForStream:(id)a3 notificationName:(id)a4
{
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog deviceLockState](&OBJC_CLASS___RMLog, "deviceLockState", a3, a4));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Device lock state notification", v7, 2u);
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMDeviceLockStateListener debouncer](self, "debouncer"));
  [v6 trigger];
}

- (void)triggerAggregatingTimerAction
{
  id v3 = self->_syncLock;
  objc_sync_enter(v3);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[RMDevice currentDevice](&OBJC_CLASS___RMDevice, "currentDevice"));
  id v5 = [v4 locked];

  if (self->_previousLockState != (_DWORD)v5)
  {
    self->_previousLockState = (char)v5;
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog deviceLockState](&OBJC_CLASS___RMLog, "deviceLockState"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v5));
      int v9 = 138543362;
      uint64_t v10 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Device lock state changed to: %{public}@",  (uint8_t *)&v9,  0xCu);
    }

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[RMDeviceLockStateListener delegate](self, "delegate"));
    [v8 lockStateDidChange:v5];
  }

  objc_sync_exit(v3);
}

- (RMDeviceLockStateListenerDelegate)delegate
{
  return (RMDeviceLockStateListenerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (RMDebounceTimer)debouncer
{
  return self->_debouncer;
}

- (void)setDebouncer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end