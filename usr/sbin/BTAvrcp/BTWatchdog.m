@interface BTWatchdog
- (BOOL)isTransacting;
- (OS_dispatch_source)timer;
- (unint64_t)timerTransactionCount;
- (unint64_t)transactionCount;
- (void)_startTimer;
- (void)_stopTimer;
- (void)_timeout;
- (void)_timerEvent;
- (void)beginTransaction;
- (void)endTransaction;
- (void)setIsTransacting:(BOOL)a3;
- (void)setTimer:(id)a3;
- (void)setTimerTransactionCount:(unint64_t)a3;
- (void)setTransactionCount:(unint64_t)a3;
@end

@implementation BTWatchdog

- (void)beginTransaction
{
  obj = self;
  objc_sync_enter(obj);
  -[BTWatchdog setIsTransacting:](obj, "setIsTransacting:", 1LL);
  -[BTWatchdog setTransactionCount:]( obj,  "setTransactionCount:",  (char *)-[BTWatchdog transactionCount](obj, "transactionCount") + 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BTWatchdog timer](obj, "timer"));

  if (!v2) {
    -[BTWatchdog _startTimer](obj, "_startTimer");
  }
  objc_sync_exit(obj);
}

- (void)endTransaction
{
  obj = self;
  objc_sync_enter(obj);
  -[BTWatchdog setIsTransacting:](obj, "setIsTransacting:", 0LL);
  objc_sync_exit(obj);
}

- (void)_startTimer
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(17LL, 0LL);
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_source_t v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v4);
  -[BTWatchdog setTimer:](self, "setTimer:", v5);

  v6 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[BTWatchdog timer](self, "timer"));
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100004C78;
  handler[3] = &unk_100018998;
  handler[4] = self;
  dispatch_source_set_event_handler(v6, handler);

  v7 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[BTWatchdog timer](self, "timer"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100004C80;
  v11[3] = &unk_100018998;
  v11[4] = self;
  dispatch_source_set_cancel_handler(v7, v11);

  v8 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[BTWatchdog timer](self, "timer"));
  dispatch_time_t v9 = dispatch_time(0LL, 10000000000LL);
  dispatch_source_set_timer(v8, v9, 0x2540BE400uLL, 0x3B9ACA00uLL);

  v10 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[BTWatchdog timer](self, "timer"));
  dispatch_resume(v10);
}

- (void)_stopTimer
{
  v2 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[BTWatchdog timer](self, "timer"));
  dispatch_source_cancel(v2);
}

- (void)_timerEvent
{
  obj = self;
  objc_sync_enter(obj);
  id v2 = -[BTWatchdog timerTransactionCount](obj, "timerTransactionCount");
  if (v2 == (id)-[BTWatchdog transactionCount](obj, "transactionCount"))
  {
    if (-[BTWatchdog isTransacting](obj, "isTransacting")) {
      -[BTWatchdog _timeout](obj, "_timeout");
    }
    else {
      -[BTWatchdog _stopTimer](obj, "_stopTimer");
    }
  }

  else
  {
    -[BTWatchdog setTimerTransactionCount:]( obj,  "setTimerTransactionCount:",  -[BTWatchdog transactionCount](obj, "transactionCount"));
  }

  objc_sync_exit(obj);
}

- (void)_timeout
{
  uint64_t v2 = getpid();
  WriteStackshotReportWithPID(@"Watchdog timeout", 195948557LL, v2);
  abort();
}

- (BOOL)isTransacting
{
  return self->_isTransacting;
}

- (void)setIsTransacting:(BOOL)a3
{
  self->_isTransacting = a3;
}

- (unint64_t)transactionCount
{
  return self->_transactionCount;
}

- (void)setTransactionCount:(unint64_t)a3
{
  self->_transactionCount = a3;
}

- (unint64_t)timerTransactionCount
{
  return self->_timerTransactionCount;
}

- (void)setTimerTransactionCount:(unint64_t)a3
{
  self->_timerTransactionCount = a3;
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end