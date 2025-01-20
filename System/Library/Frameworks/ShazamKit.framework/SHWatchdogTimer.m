@interface SHWatchdogTimer
- (OS_dispatch_source)watchdogTimerSource;
- (void)startWatchdogTimerForInterval:(double)a3 firedCompletion:(id)a4;
- (void)stopWatchdogTimer;
@end

@implementation SHWatchdogTimer

- (void)startWatchdogTimerForInterval:(double)a3 firedCompletion:(id)a4
{
  id v6 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v9 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v8);
  watchdogTimerSource = self->_watchdogTimerSource;
  self->_watchdogTimerSource = v9;

  dispatch_time_t v11 = dispatch_time(0LL, (uint64_t)(a3 * 1000000000.0));
  dispatch_source_set_timer((dispatch_source_t)self->_watchdogTimerSource, v11, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  v12 = self->_watchdogTimerSource;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1000042E4;
  handler[3] = &unk_10006CC50;
  id v15 = v6;
  id v13 = v6;
  dispatch_source_set_event_handler((dispatch_source_t)v12, handler);
  dispatch_resume((dispatch_object_t)self->_watchdogTimerSource);
}

- (void)stopWatchdogTimer
{
  watchdogTimerSource = self->_watchdogTimerSource;
  if (watchdogTimerSource)
  {
    dispatch_source_cancel((dispatch_source_t)watchdogTimerSource);
    v4 = self->_watchdogTimerSource;
    self->_watchdogTimerSource = 0LL;
  }

- (OS_dispatch_source)watchdogTimerSource
{
  return self->_watchdogTimerSource;
}

- (void).cxx_destruct
{
}

@end