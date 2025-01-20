@interface KTManagerWatchdogControl
- (BOOL)maybeDoFastExit;
- (BOOL)watchDogFastRudeExit;
- (BOOL)watchdogDisableDebuggerCheck;
- (KTManagerWatchdogControl)initWithDew:(id)a3;
- (double)watchdogInterval;
- (double)watchdogNiceWaitTime;
- (void)setMaybeDoFastExit:(BOOL)a3;
- (void)watchdogNiceExit;
- (void)watchdogRudeExitWithReason:(id)a3;
@end

@implementation KTManagerWatchdogControl

- (KTManagerWatchdogControl)initWithDew:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___KTManagerWatchdogControl;
  v5 = -[KTManagerWatchdogControl init](&v8, "init");
  if (v5)
  {
    -[KTManagerWatchdogControl setMaybeDoFastExit:](v5, "setMaybeDoFastExit:", [v4 fastWatchdogExit]);
    v6 = v5;
  }

  return v5;
}

- (double)watchdogInterval
{
  return 300.0;
}

- (double)watchdogNiceWaitTime
{
  return 120.0;
}

- (BOOL)watchDogFastRudeExit
{
  return (os_variant_has_internal_diagnostics("kt-watchdog", a2) & 1) != 0
      || -[KTManagerWatchdogControl maybeDoFastExit](self, "maybeDoFastExit") && !arc4random_uniform(0x3E8u);
}

- (void)watchdogNiceExit
{
  if (qword_1002E64C0 != -1) {
    dispatch_once(&qword_1002E64C0, &stru_100279158);
  }
  v2 = (os_log_s *)qword_1002E64C8;
  if (os_log_type_enabled((os_log_t)qword_1002E64C8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "watchdogNiceExit", v3, 2u);
  }

  xpc_transaction_exit_clean();
}

- (void)watchdogRudeExitWithReason:(id)a3
{
  id v3 = a3;
  if (qword_1002E64C0 != -1) {
    goto LABEL_8;
  }
  while (1)
  {
    id v4 = (os_log_s *)qword_1002E64C8;
    if (os_log_type_enabled((os_log_t)qword_1002E64C8, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "watchdogRudeExit: %@", (uint8_t *)&v7, 0xCu);
    }

    v5 = (const char *)[v3 UTF8String];
    if (v5) {
      v6 = v5;
    }
    else {
      v6 = "watchdog";
    }
    abort_with_payload(26LL, 4711LL, 0LL, 0LL, v6, 0LL);
LABEL_8:
    dispatch_once(&qword_1002E64C0, &stru_100279178);
  }

- (BOOL)watchdogDisableDebuggerCheck
{
  return 0;
}

- (BOOL)maybeDoFastExit
{
  return self->_maybeDoFastExit;
}

- (void)setMaybeDoFastExit:(BOOL)a3
{
  self->_maybeDoFastExit = a3;
}

@end