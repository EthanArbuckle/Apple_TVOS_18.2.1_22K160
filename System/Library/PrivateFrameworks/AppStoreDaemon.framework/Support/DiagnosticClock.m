@interface DiagnosticClock
- (DiagnosticClock)init;
- (NSDate)now;
- (void)dealloc;
@end

@implementation DiagnosticClock

- (DiagnosticClock)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___DiagnosticClock;
  v2 = -[DiagnosticClock init](&v11, "init");
  if (v2)
  {
    v2->_double timeOffset = sub_1002F92B8((uint64_t)&OBJC_CLASS___AppDefaultsManager);
    uint64_t v3 = ASDLogHandleForCategory(14LL);
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      double timeOffset = v2->_timeOffset;
      *(_DWORD *)buf = 134217984;
      double v13 = timeOffset;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Diagnostic clock enabled, current offset: %.0f",  buf,  0xCu);
    }

    v2->_notifyToken = -1;
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100305378;
    handler[3] = &unk_1003F2BE0;
    v10 = v2;
    notify_register_dispatch("com.apple.appstored.defaultschange", &v2->_notifyToken, v7, handler);
  }

  return v2;
}

- (void)dealloc
{
  int notifyToken = self->_notifyToken;
  if (notifyToken != -1)
  {
    notify_cancel(notifyToken);
    self->_int notifyToken = -1;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___DiagnosticClock;
  -[DiagnosticClock dealloc](&v4, "dealloc");
}

- (NSDate)now
{
  return +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  self->_timeOffset);
}

@end