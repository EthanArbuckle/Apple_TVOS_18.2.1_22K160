@interface SDAutoUnlockLocalDeviceController
- (BOOL)faceIDEnabled;
- (BOOL)lastUnlockUsedMask;
- (BOOL)shouldPrewarmAttempt;
- (BOOL)supportsPeriocular;
- (NSArray)wakeGestureDates;
- (OS_dispatch_queue)queue;
- (SDAutoUnlockLocalDeviceController)init;
- (SDAutoUnlockLocalDeviceController)initWithQueue:(id)a3;
- (id)deviceEnteredBioLockoutHandler;
- (void)deviceUnlockedWithMask:(BOOL)a3;
- (void)lockDevice;
- (void)setDeviceEnteredBioLockoutHandler:(id)a3;
- (void)setLastUnlockUsedMask:(BOOL)a3;
- (void)setWakeGestureDates:(id)a3;
@end

@implementation SDAutoUnlockLocalDeviceController

- (SDAutoUnlockLocalDeviceController)init
{
  return -[SDAutoUnlockLocalDeviceController initWithQueue:](self, "initWithQueue:", &_dispatch_main_q);
}

- (SDAutoUnlockLocalDeviceController)initWithQueue:(id)a3
{
  v4 = (OS_dispatch_queue *)a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SDAutoUnlockLocalDeviceController;
  v5 = -[SDAutoUnlockLocalDeviceController init](&v8, "init");
  queue = v5->_queue;
  v5->_queue = v4;

  return v5;
}

- (BOOL)faceIDEnabled
{
  return 0;
}

- (BOOL)supportsPeriocular
{
  return 0;
}

- (void)lockDevice
{
  uint64_t v2 = auto_unlock_log(self);
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Locking current device", v4, 2u);
  }

  sub_100112D88();
}

- (void)deviceUnlockedWithMask:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = auto_unlock_log(self);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Stored last unlocked with mask: %d",  (uint8_t *)v7,  8u);
  }

  -[SDAutoUnlockLocalDeviceController setLastUnlockUsedMask:](self, "setLastUnlockUsedMask:", v3);
}

- (BOOL)shouldPrewarmAttempt
{
  return -[SDAutoUnlockLocalDeviceController lastUnlockUsedMask](self, "lastUnlockUsedMask");
}

- (id)deviceEnteredBioLockoutHandler
{
  return self->_deviceEnteredBioLockoutHandler;
}

- (void)setDeviceEnteredBioLockoutHandler:(id)a3
{
}

- (NSArray)wakeGestureDates
{
  return self->_wakeGestureDates;
}

- (void)setWakeGestureDates:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)lastUnlockUsedMask
{
  return self->_lastUnlockUsedMask;
}

- (void)setLastUnlockUsedMask:(BOOL)a3
{
  self->_lastUnlockUsedMask = a3;
}

- (void).cxx_destruct
{
}

@end