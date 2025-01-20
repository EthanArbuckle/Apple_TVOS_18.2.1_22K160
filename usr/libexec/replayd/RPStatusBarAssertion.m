@interface RPStatusBarAssertion
- (BOOL)broadcasting;
- (BOOL)microphoneEnabled;
- (BOOL)paused;
- (NSDate)timerPauseDate;
- (NSDate)timerStartDate;
- (NSString)broadcastServiceName;
- (NSTimer)timer;
- (RPStatusBarAssertionDelegate)assertionDelegate;
- (SBSStatusBarStyleOverridesAssertion)assertion;
- (SBSStatusBarStyleOverridesCoordinator)coordinator;
- (SBSStatusBarStyleOverridesCoordinatorDelegate)delegate;
- (double)totalPausedTime;
- (id)rpLocalizedStatusStringForPaused:(BOOL)a3;
- (id)stringWithTimeInterval:(double)a3;
- (void)acquireAssertionWithPid:(int)a3;
- (void)pauseSession;
- (void)resumeSession;
- (void)setAssertion:(id)a3;
- (void)setAssertionDelegate:(id)a3;
- (void)setBroadcastServiceName:(id)a3;
- (void)setBroadcasting:(BOOL)a3;
- (void)setCoordinator:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMicrophoneEnabled:(BOOL)a3;
- (void)setPaused:(BOOL)a3;
- (void)setTimer:(id)a3;
- (void)setTimerPauseDate:(id)a3;
- (void)setTimerStartDate:(id)a3;
- (void)setTotalPausedTime:(double)a3;
- (void)startRepeatingTimer;
- (void)statusBarCoordinator:(id)a3 invalidatedRegistrationWithError:(id)a4;
@end

@implementation RPStatusBarAssertion

- (void)acquireAssertionWithPid:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  -[RPStatusBarAssertion acquireAssertionWithPidWaitForCompletion:](self, "acquireAssertionWithPidWaitForCompletion:");
  if (!self->_assertion) {
    -[RPStatusBarAssertion acquireAssertionWithPidWaitForCompletion:]( self,  "acquireAssertionWithPidWaitForCompletion:",  v3);
  }
}

- (void)startRepeatingTimer
{
  self->_totalPausedTime = 0.0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100015270;
  block[3] = &unk_100070D30;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (id)stringWithTimeInterval:(double)a3
{
  v4 = objc_alloc_init(&OBJC_CLASS___NSDateComponentsFormatter);
  -[NSDateComponentsFormatter setUnitsStyle:](v4, "setUnitsStyle:", 0LL);
  -[NSDateComponentsFormatter setIncludesApproximationPhrase:](v4, "setIncludesApproximationPhrase:", 0LL);
  -[NSDateComponentsFormatter setIncludesTimeRemainingPhrase:](v4, "setIncludesTimeRemainingPhrase:", 0LL);
  -[NSDateComponentsFormatter setMaximumUnitCount:](v4, "setMaximumUnitCount:", 2LL);
  if (a3 >= 60.0)
  {
    uint64_t v5 = 240LL;
  }

  else
  {
    -[NSDateComponentsFormatter setZeroFormattingBehavior:](v4, "setZeroFormattingBehavior:", 0x10000LL);
    uint64_t v5 = 192LL;
  }

  -[NSDateComponentsFormatter setAllowedUnits:](v4, "setAllowedUnits:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateComponentsFormatter stringFromTimeInterval:](v4, "stringFromTimeInterval:", a3));

  return v6;
}

- (id)rpLocalizedStatusStringForPaused:(BOOL)a3
{
  if (self->_broadcasting)
  {
    if (a3) {
      v4 = @"BROADCASTING_PAUSED_STATUS_BAR_FORMAT";
    }
    else {
      v4 = @"BROADCASTING_STATUS_BAR_FORMAT";
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:]( &OBJC_CLASS___NSBundle,  "_rpLocalizedStringFromFrameworkBundleWithKey:",  v4));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  v6,  self->_broadcastServiceName));
  }

  else
  {
    if (a3) {
      uint64_t v5 = @"RECORDING_PAUSED_STATUS_BAR";
    }
    else {
      uint64_t v5 = @"RECORDING_STATUS_BAR";
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:]( &OBJC_CLASS___NSBundle,  "_rpLocalizedStringFromFrameworkBundleWithKey:",  v5));
  }

  return v7;
}

- (void)statusBarCoordinator:(id)a3 invalidatedRegistrationWithError:(id)a4
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    id v6 = [a4 code];
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RPStatusBarAssertion: coordinator registartion invalidated with error %li",  (uint8_t *)&v5,  0xCu);
  }

- (void)pauseSession
{
  uint64_t v3 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  timerPauseDate = self->_timerPauseDate;
  self->_timerPauseDate = v3;
}

- (void)resumeSession
{
  double totalPausedTime = self->_totalPausedTime;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v5 timeIntervalSinceDate:self->_timerPauseDate];
  self->_double totalPausedTime = totalPausedTime + v4;
}

- (BOOL)microphoneEnabled
{
  return self->_microphoneEnabled;
}

- (void)setMicrophoneEnabled:(BOOL)a3
{
  self->_microphoneEnabled = a3;
}

- (BOOL)broadcasting
{
  return self->_broadcasting;
}

- (void)setBroadcasting:(BOOL)a3
{
  self->_broadcasting = a3;
}

- (NSString)broadcastServiceName
{
  return self->_broadcastServiceName;
}

- (void)setBroadcastServiceName:(id)a3
{
}

- (SBSStatusBarStyleOverridesCoordinatorDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (RPStatusBarAssertionDelegate)assertionDelegate
{
  return self->_assertionDelegate;
}

- (void)setAssertionDelegate:(id)a3
{
}

- (SBSStatusBarStyleOverridesAssertion)assertion
{
  return self->_assertion;
}

- (void)setAssertion:(id)a3
{
}

- (SBSStatusBarStyleOverridesCoordinator)coordinator
{
  return self->_coordinator;
}

- (void)setCoordinator:(id)a3
{
}

- (BOOL)paused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (NSDate)timerStartDate
{
  return self->_timerStartDate;
}

- (void)setTimerStartDate:(id)a3
{
}

- (double)totalPausedTime
{
  return self->_totalPausedTime;
}

- (void)setTotalPausedTime:(double)a3
{
  self->_double totalPausedTime = a3;
}

- (NSDate)timerPauseDate
{
  return self->_timerPauseDate;
}

- (void)setTimerPauseDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end