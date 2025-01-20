@interface NSBackgroundActivityScheduler
- (BOOL)_isAppRefresh;
- (BOOL)isPreregistered;
- (BOOL)repeats;
- (BOOL)shouldDefer;
- (NSBackgroundActivityScheduler)init;
- (NSBackgroundActivityScheduler)initWithIdentifier:(NSString *)identifier;
- (NSQualityOfService)qualityOfService;
- (NSString)identifier;
- (NSTimeInterval)interval;
- (NSTimeInterval)tolerance;
- (double)delay;
- (id)checkInHandler;
- (id)currentActivity;
- (void)_setAdditionalXPCActivityProperties:(id)a3;
- (void)_updateCriteria:(id)a3;
- (void)_updateCriteriaForCompletedActivity:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)scheduleWithBlock:(void *)block;
- (void)setCheckInHandler:(id)a3;
- (void)setCurrentActivity:(id)a3;
- (void)setDelay:(double)a3;
- (void)setInterval:(NSTimeInterval)interval;
- (void)setPreregistered:(BOOL)a3;
- (void)setQualityOfService:(NSQualityOfService)qualityOfService;
- (void)setRepeats:(BOOL)repeats;
- (void)setTolerance:(NSTimeInterval)tolerance;
- (void)set_appRefresh:(BOOL)a3;
@end

@implementation NSBackgroundActivityScheduler

- (NSBackgroundActivityScheduler)init
{
  return -[NSBackgroundActivityScheduler initWithIdentifier:](v2, v3, v4);
}

- (NSBackgroundActivityScheduler)initWithIdentifier:(NSString *)identifier
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (!identifier || !-[NSString length](identifier, "length")) {
    objc_exception_throw((id)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603A60],  @"The identifier should be a reverse-DNS style string, for example com.mycompany.myapp.activity_name",  0));
  }
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSBackgroundActivityScheduler;
  v5 = -[NSBackgroundActivityScheduler init](&v7, sel_init);
  v5->_qualityOfService = 9LL;
  v5->_identifier = (NSString *)-[NSString copy](identifier, "copy");
  v5->_invalidateLock._os_unfair_lock_opaque = 0;
  return v5;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1895F89C0];

  currentActivity = self->_currentActivity;
  if (currentActivity) {
    xpc_release(currentActivity);
  }
  additionalProperties = self->_additionalProperties;
  if (additionalProperties) {
    xpc_release(additionalProperties);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSBackgroundActivityScheduler;
  -[NSBackgroundActivityScheduler dealloc](&v5, sel_dealloc);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSQualityOfService)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(NSQualityOfService)qualityOfService
{
  self->_qualityOfService = qualityOfService;
  p_flags = &self->_flags;
  do
    unsigned __int8 v4 = __ldxr((unsigned __int8 *)p_flags);
  while (__stxr(v4 | 0x20, (unsigned __int8 *)p_flags));
}

- (BOOL)repeats
{
  return self->_repeats;
}

- (void)setRepeats:(BOOL)repeats
{
  self->_repeats = repeats;
  p_flags = &self->_flags;
  do
    unsigned __int8 v4 = __ldxr((unsigned __int8 *)p_flags);
  while (__stxr(v4 | 0x20, (unsigned __int8 *)p_flags));
}

- (BOOL)_isAppRefresh
{
  return self->_appRefresh;
}

- (void)set_appRefresh:(BOOL)a3
{
  self->_appRefresh = a3;
  p_flags = &self->_flags;
  do
    unsigned __int8 v4 = __ldxr((unsigned __int8 *)p_flags);
  while (__stxr(v4 | 0x20, (unsigned __int8 *)p_flags));
}

- (NSTimeInterval)interval
{
  return self->_interval;
}

- (void)setInterval:(NSTimeInterval)interval
{
  if (interval < 1.0)
  {
    objc_super v5 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: Invalid value for interval (%f). The value must be >= 1.",  self,  *(void *)&interval);
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v5 userInfo:0]);
    -[NSBackgroundActivityScheduler tolerance](v6, v7);
  }

  else
  {
    self->_interval = interval;
    p_flags = &self->_flags;
    do
      unsigned __int8 v4 = __ldxr((unsigned __int8 *)p_flags);
    while (__stxr(v4 | 0x20, (unsigned __int8 *)p_flags));
  }

- (NSTimeInterval)tolerance
{
  return self->_tolerance;
}

- (void)setTolerance:(NSTimeInterval)tolerance
{
  if (tolerance < 0.0)
  {
    objc_super v5 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: Invalid value for tolerance (%f). The value must be >= 0.",  self,  *(void *)&tolerance);
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v5 userInfo:0]);
    -[NSBackgroundActivityScheduler isPreregistered](v6, v7);
  }

  else
  {
    self->_tolerance = tolerance;
    p_flags = &self->_flags;
    do
      unsigned __int8 v4 = __ldxr((unsigned __int8 *)p_flags);
    while (__stxr(v4 | 0x20, (unsigned __int8 *)p_flags));
  }

- (BOOL)isPreregistered
{
  return self->_preregistered;
}

- (void)setPreregistered:(BOOL)a3
{
  self->_preregistered = a3;
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
  p_flags = &self->_flags;
  do
    unsigned __int8 v4 = __ldxr((unsigned __int8 *)p_flags);
  while (__stxr(v4 | 0x20, (unsigned __int8 *)p_flags));
}

- (void)_setAdditionalXPCActivityProperties:(id)a3
{
  additionalProperties = self->_additionalProperties;
  if (additionalProperties != a3)
  {
    if (additionalProperties)
    {
      xpc_release(additionalProperties);
      self->_additionalProperties = 0LL;
    }

    if (a3) {
      self->_additionalProperties = (OS_xpc_object *)xpc_retain(a3);
    }
  }

- (void)_updateCriteria:(id)a3
{
  applier[5] = *MEMORY[0x1895F89C0];
  -[NSBackgroundActivityScheduler tolerance](self, "tolerance");
  double v6 = v5;
  -[NSBackgroundActivityScheduler interval](self, "interval");
  double v8 = v7;
  if (v6 == 0.0 && v7 != 0.0)
  {
    double v6 = v7 * 0.5;
    if (v7 * 0.5 < 1.0) {
      double v6 = 0.0;
    }
  }

  if (v7 > 0.0)
  {
    -[NSBackgroundActivityScheduler delay](self, "delay");
    int64_t v10 = llround(v9);
    if (!v10)
    {
      int64_t v10 = llround(v8 - v6);
      if (v10 <= 0)
      {
        v15 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: Invalid value for tolerance (%f). The value must be less than the interval.",  self,  *(void *)&v6);
        objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v15 userInfo:0]);
        __49__NSBackgroundActivityScheduler__updateCriteria___block_invoke(v16, v17, v18);
        return;
      }
    }

    xpc_dictionary_set_int64(a3, (const char *)*MEMORY[0x1895F8688], v10);
    xpc_dictionary_set_BOOL( a3,  (const char *)*MEMORY[0x1895F86E8],  -[NSBackgroundActivityScheduler repeats](self, "repeats"));
    xpc_dictionary_set_int64(a3, (const char *)*MEMORY[0x1895F86A0], llround(v8));
  }

  if (-[NSBackgroundActivityScheduler _isAppRefresh](self, "_isAppRefresh"))
  {
    xpc_dictionary_set_BOOL(a3, (const char *)*MEMORY[0x1895F8678], 1);
    xpc_dictionary_set_BOOL( a3,  (const char *)*MEMORY[0x1895F86E8],  -[NSBackgroundActivityScheduler repeats](self, "repeats"));
  }

  if (v6 != 0.0) {
    xpc_dictionary_set_int64(a3, (const char *)*MEMORY[0x1895F8690], llround(v6));
  }
  v11 = (const char *)*MEMORY[0x1895F86D0];
  unint64_t v12 = __ROR8__(-[NSBackgroundActivityScheduler qualityOfService](self, "qualityOfService") - 9, 3);
  if (v12 > 3) {
    v13 = (const char **)MEMORY[0x1895F86D8];
  }
  else {
    v13 = (const char **)qword_189CA0B80[v12];
  }
  xpc_dictionary_set_string(a3, v11, *v13);
  additionalProperties = self->_additionalProperties;
  if (additionalProperties)
  {
    if (object_getClass(additionalProperties) == (Class)MEMORY[0x1895F9250])
    {
      applier[0] = MEMORY[0x1895F87A8];
      applier[1] = 3221225472LL;
      applier[2] = __49__NSBackgroundActivityScheduler__updateCriteria___block_invoke;
      applier[3] = &unk_189CA0B38;
      applier[4] = a3;
      xpc_dictionary_apply(additionalProperties, applier);
    }
  }

uint64_t __49__NSBackgroundActivityScheduler__updateCriteria___block_invoke( uint64_t a1,  const char *a2,  void *a3)
{
  return 1LL;
}

- (void)_updateCriteriaForCompletedActivity:(id)a3
{
  p_flags = &self->_flags;
  do
    unsigned __int8 v6 = __ldxr((unsigned __int8 *)p_flags);
  while (__stxr(v6 & 0xDF, (unsigned __int8 *)p_flags));
  if ((v6 & 0x20) != 0)
  {
    xpc_object_t v7 = xpc_activity_copy_criteria((xpc_activity_t)a3);
    -[NSBackgroundActivityScheduler _updateCriteria:](self, "_updateCriteria:", v7);
    xpc_activity_set_criteria((xpc_activity_t)a3, v7);
    xpc_release(v7);
  }

- (id)currentActivity
{
  return self->_currentActivity;
}

- (void)setCurrentActivity:(id)a3
{
  currentActivity = self->_currentActivity;
  if (currentActivity != a3)
  {
    if (currentActivity)
    {
      xpc_release(currentActivity);
      self->_currentActivity = 0LL;
    }

    if (a3) {
      self->_currentActivity = (OS_xpc_object *)xpc_retain(a3);
    }
  }

- (void)scheduleWithBlock:(void *)block
{
  handler[5] = *MEMORY[0x1895F89C0];
  if (!block)
  {
    int64_t v10 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: The argument may not be nil", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v10);
  }

  id activity = self->_activity;
  if (activity != block)
  {

    self->_id activity = (id)[block copy];
  }

  if (-[NSBackgroundActivityScheduler isPreregistered](self, "isPreregistered"))
  {
    xpc_object_t v6 = (xpc_object_t)*MEMORY[0x1895F8680];
    xpc_retain((xpc_object_t)*MEMORY[0x1895F8680]);
  }

  else
  {
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    -[NSBackgroundActivityScheduler _updateCriteria:](self, "_updateCriteria:", v6);
  }

  p_flags = &self->_flags;
  do
    unsigned __int8 v8 = __ldxr((unsigned __int8 *)p_flags);
  while (__stxr(v8 & 0xDF, (unsigned __int8 *)p_flags));
  double v9 = -[NSString UTF8String](-[NSBackgroundActivityScheduler identifier](self, "identifier"), "UTF8String");
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __51__NSBackgroundActivityScheduler_scheduleWithBlock___block_invoke;
  handler[3] = &unk_189C9F968;
  handler[4] = self;
  xpc_activity_register(v9, v6, handler);
  xpc_release(v6);
}

void __51__NSBackgroundActivityScheduler_scheduleWithBlock___block_invoke( uint64_t a1,  xpc_activity_t activity)
{
  xpc_activity_state_t state = xpc_activity_get_state(activity);
  if (state == 2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 88LL));
    id v14 = *(id *)(*(void *)(a1 + 32) + 40LL);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 88LL));
    if (v14)
    {
      [*(id *)(a1 + 32) setCurrentActivity:activity];
      if (!xpc_activity_set_state(activity, 4LL)) {
        NSLog((NSString *)@"Unknown error: state transition to CONTINUE failed");
      }
      __NSINDEXSET_IS_CALLING_OUT_TO_A_RANGE_BLOCK__((uint64_t)v14);
    }
  }

  else if (!state)
  {
    xpc_object_t v5 = xpc_activity_copy_criteria(activity);
    if (v5)
    {
      xpc_object_t v6 = v5;
      int64_t int64 = xpc_dictionary_get_int64(v5, (const char *)*MEMORY[0x1895F86A0]);
      BOOL v8 = int64 != 0;
      int64_t v9 = xpc_dictionary_get_int64(v6, (const char *)*MEMORY[0x1895F8688]);
      if (v9) {
        [*(id *)(a1 + 32) setDelay:(double)v9];
      }
      int64_t v10 = xpc_dictionary_get_int64(v6, (const char *)*MEMORY[0x1895F8690]);
      if (v10) {
        [*(id *)(a1 + 32) setTolerance:(double)v10];
      }
      v11 = (const char *)*MEMORY[0x1895F86E8];
      [*(id *)(a1 + 32) setRepeats:v8];
      string = xpc_dictionary_get_string(v6, (const char *)*MEMORY[0x1895F86D0]);
      else {
        uint64_t v13 = 9LL;
      }
      [*(id *)(a1 + 32) setQualityOfService:v13];
      xpc_release(v6);
      v15 = (unsigned __int8 *)(*(void *)(a1 + 32) + 80LL);
      do
        unsigned __int8 v16 = __ldxr(v15);
      while (__stxr(v16 & 0xDF, v15));
    }

    uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 48LL);
    if (v17)
    {
      (*(void (**)(void))(v17 + 16))();
      [*(id *)(a1 + 32) _updateCriteriaForCompletedActivity:activity];
    }
  }

void __51__NSBackgroundActivityScheduler_scheduleWithBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2 == 2)
  {
    if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 3LL)) {
      NSLog((NSString *)@"Unknown error: state transition to DEFER failed");
    }
    [*(id *)(a1 + 32) _updateCriteriaForCompletedActivity:*(void *)(a1 + 40)];
  }

  else if (a2 == 1 && !xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 5LL))
  {
    NSLog((NSString *)@"Unknown error: state transition to DONE failed");
  }

- (void)invalidate
{
  p_invalidateLock = &self->_invalidateLock;
  os_unfair_lock_lock(&self->_invalidateLock);
  xpc_activity_unregister(-[NSString UTF8String](-[NSBackgroundActivityScheduler identifier](self, "identifier"), "UTF8String"));

  self->_id activity = 0LL;
  os_unfair_lock_unlock(p_invalidateLock);
}

- (BOOL)shouldDefer
{
  unsigned __int8 v4 = -[NSBackgroundActivityScheduler currentActivity](self, "currentActivity");
  if (v4) {
    return xpc_activity_should_defer(v4);
  }
  xpc_object_t v6 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B40], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: This method may only be called during the invocation of the activity block or asynchronous activity", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
  objc_exception_throw(v6);
  return -[NSBackgroundActivityScheduler checkInHandler](v7, v8);
}

- (id)checkInHandler
{
  return objc_getProperty(self, a2, 48LL, 1);
}

- (void)setCheckInHandler:(id)a3
{
}

@end