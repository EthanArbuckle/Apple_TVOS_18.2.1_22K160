@interface BKDisplayBrightnessUpdateTransactionManager
+ (BKDisplayBrightnessUpdateTransactionManager)sharedInstance;
- (float)systemDisplayBrightness;
- (id)_initWithBrightnessController:(id)a3;
- (void)_beginUpdateTransaction:(id)a3;
- (void)_endUpdateTransaction:(id)a3;
- (void)_lock_commitDisplayBrightness;
- (void)restoreSystemDisplayBrightness;
- (void)setDisplayBrightness:(float)a3 permanently:(BOOL)a4;
- (void)synchronizeALSPreferencesAndSystemDisplayBrightness;
@end

@implementation BKDisplayBrightnessUpdateTransactionManager

- (id)_initWithBrightnessController:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = [BKDisplayBrightnessUpdateTransactionManager class];
  BKDisplayBrightnessUpdateTransactionManager *v6 = [[BKDisplayBrightnessUpdateTransactionManager alloc] init];
  v7 = v6;
  if (v6)
  {
    *(void *)&v6->_lock._os_unfair_lock_opaque = 0LL;
    v6->_commitPending = 0;
    v8 = [BKSDefaults externalDefaults];
    v9 = [v8 springBoardDefaults];
    [v9 brightness];
    v7->_systemDisplayBrightness = v10;

    [v7 setBrightnessController:a3];
  }

  return v7;
}

- (void)synchronizeALSPreferencesAndSystemDisplayBrightness
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  float v4 = self->_systemDisplayBrightness;
  [self->_brightnessController setBrightnessLevel:@"synchronizeALSPreferencesAndDisplayBrightness" reason:2 options:v4];
  if (sub_1000538D0())
  {
    [self->_brightnessController brightnessLevel];
    self->_systemDisplayBrightness = v5;
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)setDisplayBrightness:(float)a3 permanently:(BOOL)a4
{
  BOOL v4 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  int numPendingTransactions = self->_numPendingTransactions;
  if (numPendingTransactions) {
    uint64_t v10 = 2LL;
  }
  else {
    uint64_t v10 = 3LL;
  }
  if (v4) {
    v11 = @"setDisplayBrightness (permanent)";
  }
  else {
    v11 = @"setDisplayBrightness (transient)";
  }
  *(float *)&double v8 = a3;
  [self->_brightnessController setBrightnessLevel:v11 reason:v10 options:v8];
  if (!v4 && self->_systemDisplayBrightness >= 0.0)
  {
    self->_shouldRestoreSystemBrightness = 1;
    if (numPendingTransactions) {
      goto LABEL_10;
    }
LABEL_12:
    [_lock_commitDisplayBrightness];
    goto LABEL_13;
  }

  self->_systemDisplayBrightness = a3;
  if (!numPendingTransactions) {
    goto LABEL_12;
  }
LABEL_10:
  self->_commitPending = 1;
LABEL_13:
  os_unfair_lock_unlock(p_lock);
}

- (float)systemDisplayBrightness
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  float systemDisplayBrightness = self->_systemDisplayBrightness;
  os_unfair_lock_unlock(p_lock);
  return systemDisplayBrightness;
}

- (void)restoreSystemDisplayBrightness
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  if (self->_shouldRestoreSystemBrightness)
  {
    float systemDisplayBrightness = self->_systemDisplayBrightness;
    if (systemDisplayBrightness >= 0.0)
    {
      self->_shouldRestoreSystemBrightness = 0;
      brightnessController = self->_brightnessController;
      v7 = NSStringFromSelector(a2);
      double v8 = v7;
      float v9 = systemDisplayBrightness;
      [brightnessController setBrightnessLevel:v8 reason:10 options:v9];

      sub_1000538D0();
    }
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)_beginUpdateTransaction:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  int numPendingTransactions = self->_numPendingTransactions;
  self->_int numPendingTransactions = numPendingTransactions + 1;
  if (!numPendingTransactions)
  {
    v6 = [self->_brightnessController suppressBrightnessNotificationsForReason:@"update-transaction"];
    suppressBrightnessNotifications = self->_suppressBrightnessNotifications;
    self->_suppressBrightnessNotifications = v6;
  }

  uint64_t v8 = BKLogBacklight();
  double v9 = (os_log_s *)v8;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = self->_numPendingTransactions;
    int v11 = 138543618;
    id v12 = v4;
    __int16 v13 = 1024;
    int v14 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Begin transaction: %{public}@; %d now exist",
      (uint8_t *)&v11,
      0x12u);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_endUpdateTransaction:(id)a3
{
  id v5 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  --self->_numPendingTransactions;
  uint64_t v6 = BKLogBacklight();
  os_log_s *v7 = v6;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int numPendingTransactions = self->_numPendingTransactions;
    int v18 = 138543618;
    id v19 = v5;
    __int16 v20 = 1024;
    LODWORD(v21) = numPendingTransactions;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Ending transaction: %{public}@; %d remain",
      (uint8_t *)&v18,
      0x12u);
  }

  int v9 = self->_numPendingTransactions;
  if (v9 < 0)
  {
    NSString *v11 = [NSString stringWithFormat:@"There shouldn't be a negative number of pending transactions"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v12 = NSStringFromSelector(a2);
      __int16 v13 = [v12 autorelease];
      v15 = [self class];
      v16 = NSStringFromClass(v15);
      v17 = v16;
      int v18 = 138544642;
      id v19 = v13;
      __int16 v20 = 2114;
      v21 = v17;
      __int16 v22 = 2048;
      v23 = self;
      __int16 v24 = 2114;
      v25 = @"BKDisplayBrightnessUpdateTransactionManager.m";
      __int16 v26 = 1024;
      int v27 = 292;
      __int16 v28 = 2114;
      v29 = v11;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  (uint8_t *)&v18,  0x3Au);
    }

    _bs_set_crash_log_message([v11 UTF8String]);
    __break(0);
    JUMPOUT(0x10005249CLL);
  }

  if (!v9)
  {
    [self->_suppressBrightnessNotifications invalidate];
    suppressBrightnessNotifications = self->_suppressBrightnessNotifications;
    self->_suppressBrightnessNotifications = 0LL;

    [self _lock_commitDisplayBrightness];
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_lock_commitDisplayBrightness
{
  if (self->_commitPending)
  {
    [self->_brightnessController brightnessLevel];
    float v4 = v3;
    [self->_brightnessController setBrightnessLevel:@"commitDisplayBrightness" reason:7 options:nil];
    if (vabds_f32(self->_systemDisplayBrightness, v4) < 0.0001)
    {
      sub_100053828();
      BKSDefaults *v5 = [BKSDefaults externalDefaults];
      uint64_t v6 = (void *)[v5 springBoardDefaults];
      *(float *)&double v7 = v4;
      [v6 setBrightness:v7];
    }

    self->_commitPending = 0;
  }

- (void).cxx_destruct
{
}

+ (BKDisplayBrightnessUpdateTransactionManager)sharedInstance
{
  if (qword_1000DC1D8 != -1) {
    dispatch_once(&qword_1000DC1D8, &stru_1000B75E0);
  }
  return (BKDisplayBrightnessUpdateTransactionManager *)(id)qword_1000DC1D0;
}

@end