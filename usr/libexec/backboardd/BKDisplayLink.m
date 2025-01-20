@interface BKDisplayLink
- (BKDisplayLink)initWithDisplayLinkClass:(Class)a3 display:(id)a4 target:(id)a5 action:(SEL)a6;
- (BOOL)isPaused;
- (NSString)displayUUID;
- (void)_thread_displayLinkFired;
- (void)_thread_invalidate;
- (void)_thread_setPaused:(id)a3;
- (void)_thread_startRunLoop;
- (void)dealloc;
- (void)invalidate;
- (void)setDisplayUUID:(id)a3;
- (void)setPaused:(BOOL)a3;
@end

@implementation BKDisplayLink

- (BKDisplayLink)initWithDisplayLinkClass:(Class)a3 display:(id)a4 target:(id)a5 action:(SEL)a6
{
  id v11 = a4;
  id v12 = a5;
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___BKDisplayLink;
  v13 = -[BKDisplayLink init](&v35, "init");
  v14 = v13;
  if (v13)
  {
    v13->_displayLinkClass = a3;
    objc_storeStrong((id *)&v13->_display, a4);
    id v15 = (id)objc_claimAutoreleasedReturnValue(-[CADisplay uniqueId](v14->_display, "uniqueId"));
    id v16 = [v15 length];
    v17 = (void *)BKSDisplayUUIDMainKey;
    if (v16) {
      v17 = v15;
    }
    v18 = v17;

    displayUUID = v14->_displayUUID;
    v14->_displayUUID = v18;

    objc_storeStrong(&v14->_target, a5);
    v14->_action = a6;
    uint64_t v23 = BKLogMousePointer(v20, v21, v22);
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = v14->_displayUUID;
      *(_DWORD *)buf = 134218242;
      v38 = v14;
      __int16 v39 = 2114;
      v40 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "BKDisplayLink init %p %{public}@",  buf,  0x16u);
    }

    v26 = -[NSThread initWithTarget:selector:object:]( objc_alloc(&OBJC_CLASS___NSThread),  "initWithTarget:selector:object:",  v14,  "_thread_startRunLoop",  0LL);
    thread = v14->_thread;
    v14->_thread = v26;

    -[NSThread start](v14->_thread, "start");
    id v29 = objc_msgSend((id)objc_opt_class(v12, v28), "description");
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ BKDisplayLink:%p for %@",  v30,  v14,  v14->_displayUUID));

    -[NSThread setName:](v14->_thread, "setName:", v31);
    v32 = v14->_thread;
    NSRunLoopMode v36 = NSRunLoopCommonModes;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v36, 1LL));
    -[BKDisplayLink performSelector:onThread:withObject:waitUntilDone:modes:]( v14,  "performSelector:onThread:withObject:waitUntilDone:modes:",  "description",  v32,  0LL,  0LL,  v33);
  }

  return v14;
}

- (void)dealloc
{
  if (!self->_thread_invalid)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"must -invalidate before dealloc"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v5 = NSStringFromSelector(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      v8 = (objc_class *)objc_opt_class(self, v7);
      v9 = NSStringFromClass(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      *(_DWORD *)buf = 138544642;
      v13 = v6;
      __int16 v14 = 2114;
      id v15 = v10;
      __int16 v16 = 2048;
      v17 = self;
      __int16 v18 = 2114;
      v19 = @"BKDisplayLink.m";
      __int16 v20 = 1024;
      int v21 = 55;
      __int16 v22 = 2114;
      uint64_t v23 = v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v4 UTF8String]);
    __break(0);
    JUMPOUT(0x10000596CLL);
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___BKDisplayLink;
  -[BKDisplayLink dealloc](&v11, "dealloc");
}

- (void)invalidate
{
  uint64_t v3 = BKLogMousePointer(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    v10 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "BKDisplayLink %p invalidate start ",  (uint8_t *)&v9,  0xCu);
  }

  id v5 = -[BKDisplayLink performSelector:onThread:withObject:waitUntilDone:]( self,  "performSelector:onThread:withObject:waitUntilDone:",  "_thread_invalidate",  self->_thread,  0LL,  0LL);
  uint64_t v7 = BKLogMousePointer(v5, v6);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    v10 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "BKDisplayLink %p invalidate finish",  (uint8_t *)&v9,  0xCu);
  }
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
  thread = self->_thread;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:"));
  -[BKDisplayLink performSelector:onThread:withObject:waitUntilDone:]( self,  "performSelector:onThread:withObject:waitUntilDone:",  "_thread_setPaused:",  thread,  v5,  0LL);
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)_thread_setPaused:(id)a3
{
}

- (void)_thread_invalidate
{
  BOOL thread_invalid = self->_thread_invalid;
  uint64_t v4 = BKLogMousePointer(self, a2);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = v5;
  if (thread_invalid)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v10 = 134217984;
      objc_super v11 = self;
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "BKDisplayLink %p _thread_invalidate already invalid",  (uint8_t *)&v10,  0xCu);
    }
  }

  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134217984;
      objc_super v11 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "BKDisplayLink %p _thread_invalidate",  (uint8_t *)&v10,  0xCu);
    }

    self->_BOOL thread_invalid = 1;
    -[CADisplayLink invalidate](self->_thread_displayLink, "invalidate");
    thread_displayLink = self->_thread_displayLink;
    self->_thread_displayLink = 0LL;

    display = self->_display;
    self->_display = 0LL;

    Current = CFRunLoopGetCurrent();
    CFRunLoopStop(Current);
    CFRunLoopWakeUp(Current);
  }

- (void)_thread_displayLinkFired
{
  if (!self->_thread_invalid) {
    objc_msgSend(self->_target, self->_action);
  }
}

- (void)_thread_startRunLoop
{
  sched_param v12 = (sched_param)63LL;
  uint64_t v3 = pthread_self();
  uint64_t v4 = pthread_setschedparam(v3, 2, &v12);
  if ((_DWORD)v4)
  {
    int v5 = v4;
    uint64_t v6 = BKLogCommon(v4);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v14 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "cannot set event router thread priority (error %d)",  buf,  8u);
    }
  }

  v8 = (NSRunLoop *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  runLoop = self->_runLoop;
  self->_runLoop = v8;

  int v10 = (CADisplayLink *)objc_claimAutoreleasedReturnValue( -[objc_class displayLinkWithDisplay:target:selector:]( self->_displayLinkClass,  "displayLinkWithDisplay:target:selector:",  self->_display,  self,  "_thread_displayLinkFired"));
  thread_displayLink = self->_thread_displayLink;
  self->_thread_displayLink = v10;

  -[CADisplayLink addToRunLoop:forMode:]( self->_thread_displayLink,  "addToRunLoop:forMode:",  self->_runLoop,  NSRunLoopCommonModes);
  CFRunLoopRun();
}

- (NSString)displayUUID
{
  return self->_displayUUID;
}

- (void)setDisplayUUID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end