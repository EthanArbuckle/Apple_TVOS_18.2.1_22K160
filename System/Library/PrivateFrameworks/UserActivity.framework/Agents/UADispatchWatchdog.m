@interface UADispatchWatchdog
- (BOOL)hasFired;
- (NSString)name;
- (OS_dispatch_source)source;
- (UADispatchWatchdog)initWithName:(id)a3 timeout:(double)a4 block:(id)a5;
- (double)timeout;
- (id)handler;
- (void)_triggerWatchdog;
- (void)cancel;
- (void)dealloc;
- (void)poke;
- (void)setHandler:(id)a3;
- (void)setHasFired:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setSource:(id)a3;
- (void)setTimeout:(double)a3;
- (void)start;
@end

@implementation UADispatchWatchdog

- (UADispatchWatchdog)initWithName:(id)a3 timeout:(double)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___UADispatchWatchdog;
  v10 = -[UADispatchWatchdog init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    -[UADispatchWatchdog setName:](v10, "setName:", v8);
    -[UADispatchWatchdog setTimeout:](v11, "setTimeout:", a4);
    -[UADispatchWatchdog setHandler:](v11, "setHandler:", v9);
    -[UADispatchWatchdog setHasFired:](v11, "setHasFired:", 0LL);
  }

  return v11;
}

- (void)dealloc
{
  v3 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[UADispatchWatchdog source](self, "source"));
  v4 = v3;
  if (v3) {
    dispatch_source_cancel(v3);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___UADispatchWatchdog;
  -[UADispatchWatchdog dealloc](&v5, "dealloc");
}

- (void)start
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UADispatchWatchdog source](self, "source"));

  if (v3)
  {
    v4 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[UADispatchWatchdog source](self, "source"));
    dispatch_source_cancel(v4);
  }

  os_log_t v5 = sub_100039584(@"pasteboard-server");
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UADispatchWatchdog name](self, "name"));
    -[UADispatchWatchdog timeout](self, "timeout");
    *(_DWORD *)buf = 138412546;
    v14 = v7;
    __int16 v15 = 2048;
    uint64_t v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Starting watchdog: %@ - %fs", buf, 0x16u);
  }

  dispatch_source_t v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, 0LL);
  dispatch_set_qos_class_floor(v9, QOS_CLASS_USER_INTERACTIVE, 0);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1000162C8;
  handler[3] = &unk_1000BCC58;
  handler[4] = self;
  dispatch_source_set_event_handler(v9, handler);
  -[UADispatchWatchdog timeout](self, "timeout");
  dispatch_time_t v11 = dispatch_walltime(0LL, (uint64_t)(v10 * 1000000000.0));
  dispatch_source_set_timer(v9, v11, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  dispatch_activate(v9);
  -[UADispatchWatchdog setSource:](self, "setSource:", v9);
}

- (void)poke
{
  source = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[UADispatchWatchdog source](self, "source"));
  if (!-[UADispatchWatchdog hasFired](self, "hasFired") && source)
  {
    -[UADispatchWatchdog timeout](self, "timeout");
    dispatch_time_t v4 = dispatch_walltime(0LL, (uint64_t)(v3 * 1000000000.0));
    dispatch_source_set_timer(source, v4, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  }
}

- (void)cancel
{
  os_log_t v3 = sub_100039584(@"pasteboard-server");
  dispatch_time_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UADispatchWatchdog name](self, "name"));
    int v8 = 138412290;
    dispatch_source_t v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Canceling watchdog: %@", (uint8_t *)&v8, 0xCu);
  }

  v6 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[UADispatchWatchdog source](self, "source"));
  v7 = v6;
  if (v6) {
    dispatch_source_cancel(v6);
  }
}

- (void)_triggerWatchdog
{
  os_log_t v3 = sub_100039584(@"pasteboard-server");
  dispatch_time_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UADispatchWatchdog name](self, "name"));
    -[UADispatchWatchdog timeout](self, "timeout");
    uint64_t v7 = v6;
    int v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[UADispatchWatchdog hasFired](self, "hasFired")));
    int v10 = 138412802;
    dispatch_time_t v11 = v5;
    __int16 v12 = 2048;
    uint64_t v13 = v7;
    __int16 v14 = 2112;
    __int16 v15 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "Triggering watchdog: %@ - %fs - %@",  (uint8_t *)&v10,  0x20u);
  }

  if (!-[UADispatchWatchdog hasFired](self, "hasFired"))
  {
    -[UADispatchWatchdog setHasFired:](self, "setHasFired:", 1LL);
    dispatch_source_t v9 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[UADispatchWatchdog handler](self, "handler"));
    v9[2]();
  }

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setName:(id)a3
{
}

- (id)handler
{
  return objc_getProperty(self, a2, 24LL, 1);
}

- (void)setHandler:(id)a3
{
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (OS_dispatch_source)source
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setSource:(id)a3
{
}

- (BOOL)hasFired
{
  return self->_hasFired;
}

- (void)setHasFired:(BOOL)a3
{
  self->_hasFired = a3;
}

- (void).cxx_destruct
{
}

@end