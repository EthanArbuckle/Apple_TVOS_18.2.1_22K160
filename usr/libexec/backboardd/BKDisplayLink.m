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
  v35.super_class = [BKDisplayLink class];
  BKDisplayLink *v13 = [[BKDisplayLink alloc] init];
  v14 = v13;
  if (v13)
  {
    v13->_displayLinkClass = a3;
    v13->_display = a4;
    id v15 = [v14->_display uniqueId];
    id v16 = [v15 length];
    v17 = (void *)BKSDisplayUUIDMainKey;
    if (v16) {
      v17 = v15;
    }
    v18 = v17;

    displayUUID = v14->_displayUUID;
    v14->_displayUUID = v18;

    v14->_target = a5;
    v14->_action = a6;
    uint64_t v23 = BKLogMousePointer(v20, v21, v22);
    v24 = v23;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = v14->_displayUUID;
      *(_DWORD *)buf = 134218242;
      v38 = v14;
      __int16 v39 = 2114;
      v40 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "BKDisplayLink init %p %{public}@",  buf,  0x16u);
    }

    NSThread *v26 = [[NSThread alloc] initWithTarget:v14 selector:@selector(_thread_startRunLoop) object:nil];
    thread = v14->_thread;
    v14->_thread = v26;

    [v14->_thread start];
    [v12 description];
    v30 = [v29 autorelease];
    v31 = [NSString stringWithFormat:@"%@ BKDisplayLink:%p for %@", v30, v14, v14->_displayUUID];

    [v14->_thread setName:v31];
    v32 = v14->_thread;
    NSRunLoopMode v36 = NSRunLoopCommonModes;
    NSArray *v33 = [NSArray arrayWithObjects:v36, nil];
    [v14 performSelectorOnMainThread:description withObject:v32 waitUntilDone:0 modes:v33];
  }

  return v14;
}

- (void)dealloc
{
  if (!self->_thread_invalid)
  {
    v4 = [NSString stringWithFormat:@"must -invalidate before dealloc"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v5 = NSStringFromSelector(a2);
      v6 = [v5 autorelease];
      v8 = [self class];
      v9 = NSStringFromClass(v8);
      v10 = [v9 autorelease];
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
  v11.super_class = [BKDisplayLink class];
  [v11 dealloc];
}

- (void)invalidate
{
  uint64_t v3 = BKLogMousePointer(self, a2);
  v4 = v3;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    v10 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "BKDisplayLink %p invalidate start ",  (uint8_t *)&v9,  0xCu);
  }

  [self performSelector:_thread_invalidate onThread:self->_thread withObject:nil waitUntilDone:0LL];
  uint64_t v7 = BKLogMousePointer(v5, v6);
  v8 = [v7 autorelease];
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
  id v5 = [NSNumber numberWithBool:];
  [self performSelector:@selector(_thread_setPaused:) onThread:thread withObject:v5 waitUntilDone:0];
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
  os_log_s *v5 = v4;
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
    [self->_thread_displayLink invalidate];
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
    [self->_target self->_action];
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
    uint64_t v7 = [v6 autorelease];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v14 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "cannot set event router thread priority (error %d)",  buf,  8u);
    }
  }

  v8 = [NSRunLoop currentRunLoop];
  runLoop = self->_runLoop;
  self->_runLoop = v8;

  int v10 = [objc_class displayLinkWithDisplay:self->_display target:self selector:@selector(_thread_displayLinkFired)];
  thread_displayLink = self->_thread_displayLink;
  self->_thread_displayLink = v10;

  [self->_thread_displayLink addToRunLoop:self->_runLoop forMode:NSRunLoopCommonModes];
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