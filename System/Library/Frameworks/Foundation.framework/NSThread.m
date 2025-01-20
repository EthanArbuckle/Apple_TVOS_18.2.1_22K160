@interface NSThread
+ (BOOL)isDying;
+ (BOOL)isMainThread;
+ (BOOL)isMultiThreaded;
+ (BOOL)setThreadPriority:(double)p;
+ (NSArray)callStackReturnAddresses;
+ (NSArray)callStackSymbols;
+ (NSThread)currentThread;
+ (NSThread)mainThread;
+ (double)threadPriority;
+ (void)detachNewThreadSelector:(SEL)selector toTarget:(id)target withObject:(id)argument;
+ (void)detachNewThreadWithBlock:(void *)block;
+ (void)exit;
+ (void)sleepForTimeInterval:(NSTimeInterval)ti;
+ (void)sleepUntilDate:(NSDate *)date;
- (BOOL)_setThreadPriority:(double)a3;
- (BOOL)isCancelled;
- (BOOL)isDying;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (BOOL)isMainThread;
- (BOOL)startAndReturnError:(id *)a3;
- (NSMutableDictionary)threadDictionary;
- (NSQualityOfService)qualityOfService;
- (NSString)name;
- (NSThread)init;
- (NSThread)initWithBlock:(void *)block;
- (NSThread)initWithTarget:(id)target selector:(SEL)selector object:(id)argument;
- (NSUInteger)stackSize;
- (double)threadPriority;
- (id)description;
- (id)runLoop;
- (pthread_override_s)_beginQoSOverride:(unsigned int)a3 relativePriority:(int)a4;
- (void)_endQoSOverride:(pthread_override_s *)a3;
- (void)_nq:(id)a3;
- (void)cancel;
- (void)dealloc;
- (void)main;
- (void)setName:(NSString *)name;
- (void)setQualityOfService:(NSQualityOfService)qualityOfService;
- (void)setStackSize:(NSUInteger)stackSize;
- (void)start;
@end

@implementation NSThread

+ (NSThread)currentThread
{
  if (!_NSIsMultiThreaded && pthread_main_np() != 1)
  {
    _NSIsMultiThreaded = 1;
    objc_msgSend( +[NSNotificationCenter _defaultCenterWithoutCreating]( NSNotificationCenter,  "_defaultCenterWithoutCreating"),  "postNotificationName:object:userInfo:",  @"NSWillBecomeMultiThreadedNotification",  0,  0);
  }

  return (NSThread *)_NSThreadGet0(1);
}

- (NSMutableDictionary)threadDictionary
{
  return (NSMutableDictionary *)*((void *)self->_private + 4);
}

+ (NSArray)callStackReturnAddresses
{
  v2 = malloc(0x800uLL);
  if (v2) {
    thread_stack_async_pcs();
  }
  return (NSArray *)+[_NSCallStackArray arrayWithFrames:count:symbols:]( &OBJC_CLASS____NSCallStackArray,  "arrayWithFrames:count:symbols:",  v2,  0LL,  0LL);
}

+ (NSArray)callStackSymbols
{
  v2 = malloc(0x800uLL);
  if (v2) {
    thread_stack_async_pcs();
  }
  return (NSArray *)+[_NSCallStackArray arrayWithFrames:count:symbols:]( &OBJC_CLASS____NSCallStackArray,  "arrayWithFrames:count:symbols:",  v2,  0LL,  1LL);
}

+ (BOOL)isMainThread
{
  return pthread_main_np() == 1;
}

+ (BOOL)isMultiThreaded
{
  return _NSIsMultiThreaded;
}

+ (double)threadPriority
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  qos_class_t v2 = qos_class_self();
  if (v2 != QOS_CLASS_DEFAULT && v2)
  {
    int v6 = 0;
    v4 = pthread_self();
    int qos_class_np = pthread_get_qos_class_np(v4, &__qos_class, &v6);
    double result = -1.0;
    if (!qos_class_np) {
      return (double)(v6 + 15) / 30.0;
    }
  }

  else
  {
    -[NSThread threadPriority](+[NSThread currentThread](&OBJC_CLASS___NSThread, "currentThread"), "threadPriority");
  }

  return result;
}

+ (BOOL)setThreadPriority:(double)p
{
  qos_class_t v4 = qos_class_self();
  if (v4 == QOS_CLASS_DEFAULT || v4 == QOS_CLASS_UNSPECIFIED) {
    return -[NSThread _setThreadPriority:]( +[NSThread currentThread](&OBJC_CLASS___NSThread, "currentThread"),  "_setThreadPriority:",  p);
  }
  double v6 = 0.0;
  if (p >= 0.0) {
    double v6 = p;
  }
  double v7 = v6 * -2.0 * -15.0;
  BOOL v8 = v6 <= 1.0;
  double v9 = 30.0;
  if (v8) {
    double v9 = v7;
  }
  int v10 = vcvtmd_s64_f64(v9);
  if (v10 >= 15) {
    int v10 = 15;
  }
  int v11 = (v10 & ~(v10 >> 31)) - 15;
  qos_class_t v12 = qos_class_self();
  return pthread_set_qos_class_self_np(v12, v11) == 0;
}

+ (void)sleepUntilDate:(NSDate *)date
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  CFGetSystemUptime();
  double v5 = v4;
  double Current = CFAbsoluteTimeGetCurrent();
  -[NSDate timeIntervalSinceReferenceDate](date, "timeIntervalSinceReferenceDate");
  double v8 = v7 - Current;
  if (v8 > 0.0)
  {
    double v9 = v5 + v8;
    do
    {
      timespec __rqtp = (timespec)xmmword_183979640;
      if (v8 < 9.22337204e18)
      {
        double v10 = modf(v8, &v12);
        __rqtp.tv_sec = (uint64_t)v12;
        __rqtp.tv_nsec = (uint64_t)(v10 * 1000000000.0);
      }

      nanosleep(&__rqtp, 0LL);
      CFGetSystemUptime();
      double v8 = v9 - v11;
    }

    while (v8 > 0.0);
  }

+ (void)sleepForTimeInterval:(NSTimeInterval)ti
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  CFGetSystemUptime();
  if (ti > 0.0)
  {
    double v5 = v4 + ti;
    do
    {
      timespec __rqtp = (timespec)xmmword_183979640;
      if (ti < 9.22337204e18)
      {
        double v6 = modf(ti, &v8);
        __rqtp.tv_sec = (uint64_t)v8;
        __rqtp.tv_nsec = (uint64_t)(v6 * 1000000000.0);
      }

      nanosleep(&__rqtp, 0LL);
      CFGetSystemUptime();
      ti = v5 - v7;
    }

    while (v5 - v7 > 0.0);
  }

+ (NSThread)mainThread
{
  if (!_NSIsMultiThreaded && pthread_main_np() != 1)
  {
    _NSIsMultiThreaded = 1;
    objc_msgSend( +[NSNotificationCenter _defaultCenterWithoutCreating]( NSNotificationCenter,  "_defaultCenterWithoutCreating"),  "postNotificationName:object:userInfo:",  @"NSWillBecomeMultiThreadedNotification",  0,  0);
  }

  return (NSThread *)_NSThreadGet0(0);
}

- (id)runLoop
{
  if (threadRunLoop(*((_opaque_pthread_t **)self->_private + 17))) {
    qos_class_t v2 = (void *)_CFRunLoopGet2();
  }
  else {
    qos_class_t v2 = 0LL;
  }
  _CFAutoreleasePoolPop();
  return v2;
}

+ (void)exit
{
}

- (BOOL)isDying
{
  return *((_BYTE *)self->_private + 52) != 0;
}

+ (BOOL)isDying
{
  return -[NSThread isDying](+[NSThread currentThread](&OBJC_CLASS___NSThread, "currentThread"), "isDying");
}

+ (void)detachNewThreadSelector:(SEL)selector toTarget:(id)target withObject:(id)argument
{
}

+ (void)detachNewThreadWithBlock:(void *)block
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (!block)
  {
    double v5 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: block targets for threads cannot be nil", _NSMethodExceptionProem((objc_class *)a1, a2)), 0 reason userInfo];
    objc_exception_throw(v5);
  }

  pthread_attr_init(&v7);
  pthread_attr_setscope(&v7, 1);
  pthread_attr_setdetachstate(&v7, 2);
  double v4 = _Block_copy(block);
  pthread_create(&v6, &v7, (void *(__cdecl *)(void *))__NSThread__block_start__, v4);
}

- (NSThread)initWithBlock:(void *)block
{
  if (block)
  {
    double v4 = _Block_copy(block);
    double v5 = -[NSThread initWithTarget:selector:object:](self, "initWithTarget:selector:object:", v4, sel_invoke, 0LL);
    _Block_release(v4);
    return v5;
  }

  else
  {
    pthread_attr_t v7 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: block targets for threads cannot be nil",  _NSMethodExceptionProem((objc_class *)self, a2));

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v7 userInfo:0]);
    return -[NSThread init](v8, v9);
  }

- (NSThread)init
{
  v13[1] = *(sched_param *)MEMORY[0x1895F89C0];
  uint64_t v3 = objc_opt_new();
  *(void *)(v3 + 32) = objc_opt_new();
  *(void *)(v3 + 40) = 0LL;
  *(_BYTE *)(v3 + 52) = 0;
  *(void *)(v3 + 16) = 0LL;
  *(void *)(v3 + 24) = 0LL;
  *(void *)(v3 + 8) = 0LL;
  do
  {
    unsigned int v4 = __ldaxr((unsigned int *)&init_seqNum);
    unsigned int v5 = v4 + 1;
  }

  while (__stlxr(v5, (unsigned int *)&init_seqNum));
  *(_DWORD *)(v3 + 48) = v5;
  *(_BYTE *)(v3 + 54) = 0;
  atomic_store(0, (unsigned __int8 *)(v3 + 55));
  *(_BYTE *)(v3 + 53) = 0;
  *(void *)(v3 + 56) = 0LL;
  *(void *)(v3 + 64) = 0LL;
  __asm { FMOV            V0.2D, #-1.0 }

  *(_OWORD *)(v3 + 144) = _Q0;
  pthread_attr_init((pthread_attr_t *)(v3 + 72));
  pthread_attr_setscope((pthread_attr_t *)(v3 + 72), 1);
  pthread_attr_setdetachstate((pthread_attr_t *)(v3 + 72), 2);
  *(void *)(v3 + 136) = 0LL;
  self->_private = (id)v3;
  if (pthread_attr_getschedparam((const pthread_attr_t *)(v3 + 72), v13))
  {
    double v11 = *(double *)(v3 + 152);
  }

  else
  {
    double v11 = (double)v13[0].sched_priority / 62.0;
    *(double *)(v3 + 152) = v11;
  }

  *(double *)(v3 + 144) = v11;
  return self;
}

- (NSThread)initWithTarget:(id)target selector:(SEL)selector object:(id)argument
{
  if (target && (objc_opt_respondsToSelector() & 1) == 0)
  {
    v17 = _NSMethodExceptionProem((objc_class *)self, a2);
    v18 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: target does not implement selector (%@)",  v17,  _NSMethodExceptionProem((objc_class *)target, selector));

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v18 userInfo:0]);
    -[NSThread dealloc](v19, v20);
  }

  else
  {
    uint64_t v10 = -[NSThread init](self, "init");
    id v11 = target;
    double v12 = v10->_private;
    if (v12)
    {
      v12[1] = v11;
      v13 = v10->_private;
      if (v13) {
        sched_param v13[2] = selector;
      }
    }

    id v14 = argument;
    v15 = v10->_private;
    if (v15) {
      v15[3] = v14;
    }
    return v10;
  }

  return result;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  uint64_t v3 = (id *)self->_private;
  if (v3)
  {

    *((void *)self->_private + 5) = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSThread;
  -[NSThread dealloc](&v4, sel_dealloc);
}

- (void)setName:(NSString *)name
{
  uint64_t v3 = (NSString *)*((void *)self->_private + 5);
  if (v3 != name)
  {

    *((void *)self->_private + 5) = -[NSString copy](name, "copy");
    if (+[NSThread currentThread](&OBJC_CLASS___NSThread, "currentThread") == self)
    {
      pthread_t v6 = (void *)*((void *)self->_private + 5);
      if (v6) {
        pthread_attr_t v7 = (const char *)[v6 UTF8String];
      }
      else {
        pthread_attr_t v7 = "";
      }
      pthread_setname_np(v7);
    }
  }

- (NSString)name
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  id v3 = self->_private;
  double result = (NSString *)*((void *)v3 + 5);
  if (!result)
  {
    if (pthread_getname_np(*((pthread_t *)v3 + 17), v5, 0x12CuLL)) {
      return (NSString *)*((void *)self->_private + 5);
    }
    else {
      return +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v5);
    }
  }

  return result;
}

- (void)setStackSize:(NSUInteger)stackSize
{
  size_t v3 = stackSize;
  if (!(stackSize >> 14))
  {
    objc_super v4 = (void *)MEMORY[0x189603F70];
    uint64_t v5 = *MEMORY[0x189603A60];
    uint64_t v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Can't set stack size to a value lower than %d (requested %lu)",  0x4000LL,  v3);
    goto LABEL_9;
  }

  if (stackSize >= 0x40000000) {
    size_t v3 = 0x40000000LL;
  }
  if (pthread_attr_setstacksize((pthread_attr_t *)((char *)self->_private + 72), v3)
    && dyld_program_sdk_at_least())
  {
    objc_super v4 = (void *)MEMORY[0x189603F70];
    uint64_t v5 = *MEMORY[0x189603A60];
    uint64_t v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Can't set stack size to %lu (it must be a multiple of the system page size and greater than %d)",  v3,  0x4000LL);
LABEL_9:
    objc_exception_throw((id)[v4 exceptionWithName:v5 reason:v6 userInfo:0]);
  }

- (NSUInteger)stackSize
{
  v3[1] = *MEMORY[0x1895F89C0];
  pthread_attr_getstacksize((const pthread_attr_t *)((char *)self->_private + 72), v3);
  return v3[0];
}

- (NSQualityOfService)qualityOfService
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  size_t v3 = (pthread_t *)self->_private;
  NSQualityOfService v4 = *((char *)v3 + 53);
  if (!pthread_equal(v3[17], 0LL))
  {
    pthread_get_qos_class_np(*((pthread_t *)self->_private + 17), &__qos_class, &v7);
    NSQualityOfService v4 = (unint64_t)__qos_class;
  }

  if ((_DWORD)v4 == (NSQualityOfServiceUtility|0x4LL) || v4 == 0) {
    return -1LL;
  }
  else {
    return v4;
  }
}

- (void)setQualityOfService:(NSQualityOfService)qualityOfService
{
  if (pthread_equal(*((pthread_t *)self->_private + 17), 0LL))
  {
    if ((unint64_t)(qualityOfService + 1) > 0x22
      || ((1LL << (qualityOfService + 1)) & 0x404040401LL) == 0)
    {
      LOBYTE(qualityOfService) = -1;
    }

    *((void *)self->_private + 18) = *((void *)self->_private + 19);
    *((_BYTE *)self->_private + 53) = qualityOfService;
  }

- (pthread_override_s)_beginQoSOverride:(unsigned int)a3 relativePriority:(int)a4
{
  uint64_t v7 = *((void *)self->_private + 17);
  if (v7 == pthread_main_thread_np()) {
    return 0LL;
  }
  else {
    return pthread_override_qos_class_start_np(*((pthread_t *)self->_private + 17), (qos_class_t)a3, a4);
  }
}

- (void)_endQoSOverride:(pthread_override_s *)a3
{
  if (a3) {
    pthread_override_qos_class_end_np(a3);
  }
}

- (double)threadPriority
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (!pthread_equal(*((pthread_t *)self->_private + 17), 0LL))
  {
    BOOLean_t get_default = 0;
    mach_msg_type_number_t policy_infoCnt = 1;
    thread_inspect_t v3 = pthread_mach_thread_np(*((pthread_t *)self->_private + 17));
    if (!thread_policy_get(v3, 3u, &policy_info, &policy_infoCnt, &get_default))
    {
      integer_t v4 = policy_info;
      if (policy_info >= 31) {
        integer_t v4 = 31;
      }
      if (v4 <= -31) {
        integer_t v4 = -31;
      }
      *((double *)self->_private + 18) = (double)(v4 + 31) / 62.0;
    }
  }

  return *((double *)self->_private + 18);
}

- (BOOL)_setThreadPriority:(double)a3
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if (a3 < 0.0) {
    a3 = 0.0;
  }
  if (a3 <= 1.0) {
    double v4 = a3;
  }
  else {
    double v4 = 1.0;
  }
  *((double *)self->_private + 18) = v4;
  if (pthread_equal(*((pthread_t *)self->_private + 17), 0LL)) {
    *((_BYTE *)self->_private + 53) = 0;
  }
  if (pthread_equal(*((pthread_t *)self->_private + 17), 0LL))
  {
    pthread_attr_setschedpolicy((pthread_attr_t *)((char *)self->_private + 72), 1);
    v10.sched_priority = (int)(v4 * 62.0 + 0.5);
    int v5 = pthread_attr_setschedparam((pthread_attr_t *)((char *)self->_private + 72), &v10);
  }

  else
  {
    v10.sched_priority = 1;
    thread_act_t v6 = pthread_mach_thread_np(*((pthread_t *)self->_private + 17));
    thread_policy_set(v6, 1u, (thread_policy_t)&v10, 1u);
    integer_t policy_info = (int)(v4 * 62.0 + 0.5) - 31;
    thread_act_t v7 = pthread_mach_thread_np(*((pthread_t *)self->_private + 17));
    int v5 = thread_policy_set(v7, 3u, &policy_info, 1u);
  }

  return v5 == 0;
}

- (BOOL)isMainThread
{
  return +[NSThread mainThread](&OBJC_CLASS___NSThread, "mainThread") == self;
}

- (BOOL)isExecuting
{
  int v2 = atomic_load((unsigned __int8 *)self->_private + 55);
  return v2 == 14;
}

- (BOOL)isFinished
{
  int v2 = atomic_load((unsigned __int8 *)self->_private + 55);
  return v2 == 15;
}

- (BOOL)isCancelled
{
  return *((_BYTE *)self->_private + 54) != 0;
}

- (void)cancel
{
  if (+[NSThread mainThread](&OBJC_CLASS___NSThread, "mainThread") != self) {
    *((_BYTE *)self->_private + 54) = -86;
  }
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  double v4 = (unsigned int *)self->_private;
  uint64_t v5 = v4[12];
  thread_act_t v6 = (const __CFString *)*((void *)v4 + 5);
  if (!v6)
  {
    int v7 = pthread_main_np();
    thread_act_t v6 = @"main";
    if (v7 != 1) {
      thread_act_t v6 = 0LL;
    }
  }

  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p>{number = %d, name = %@}",  v3,  self,  v5,  v6);
}

- (void)start
{
}

- (BOOL)startAndReturnError:(id *)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  thread_act_t v6 = (unsigned __int8 *)self->_private + 55;
  do
  {
    if (__ldaxr(v6))
    {
      __clrex();
      v15 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: attempt to start the thread again", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
      objc_exception_throw(v15);
    }
  }

  while (__stlxr(0xDu, v6));
  uint64_t v8 = (char *)self->_private;
  if (v8[54])
  {
    atomic_store(0xFu, (unsigned __int8 *)v8 + 55);
  }

  else
  {
    if (!_NSIsMultiThreaded)
    {
      _NSIsMultiThreaded = 1;
      -[NSNotificationCenter postNotificationName:object:userInfo:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "postNotificationName:object:userInfo:",  @"NSWillBecomeMultiThreadedNotification",  0LL,  0LL);
      uint64_t v8 = (char *)self->_private;
    }

    if (v8[53])
    {
      sched_param v10 = (pthread_attr_t *)(v8 + 72);
      else {
        char v11 = v8[53];
      }
      pthread_attr_set_qos_class_np(v10, (qos_class_t)v11, 0);
      uint64_t v8 = (char *)self->_private;
    }

    int v12 = pthread_create( (pthread_t *)v8 + 17,  (const pthread_attr_t *)(v8 + 72),  (void *(__cdecl *)(void *))__NSThread__start__,  self);
    if (v12)
    {
      int v13 = v12;
      if (a3)
      {
        *a3 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NSPOSIXErrorDomain",  v12,  0LL);
      }

      else
      {
        id v14 = (os_log_s *)_NSOSLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v17 = _NSMethodExceptionProem((objc_class *)self, a2);
          __int16 v18 = 1024;
          int v19 = v13;
          _os_log_error_impl( &dword_182EB1000,  v14,  OS_LOG_TYPE_ERROR,  "%@: Thread creation failed with error %d",  buf,  0x12u);
        }
      }
    }
  }

  return 1;
}

- (void)main
{
  int v2 = self->_private;
  if (v2)
  {
    uint64_t v3 = (const char *)v2[2];
    if (v3)
    {
      double v4 = (void *)v2[1];
      if (v4) {
        objc_msgSend(v4, v3, v2[3]);
      }
    }
  }

- (void)_nq:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  objc_sync_enter(self);
  uint64_t v5 = (void *)*((void *)self->_private + 7);
  if (!v5)
  {
    *((void *)self->_private + 7) = objc_opt_new();
    uint64_t v5 = (void *)*((void *)self->_private + 7);
  }

  [v5 addObject:a3];
  thread_act_t v6 = (__CFRunLoop *)threadRunLoop(*((_opaque_pthread_t **)self->_private + 17));
  if (v6)
  {
    if (!*((void *)self->_private + 8)) {
      *((void *)self->_private + 8) = objc_opt_new();
    }
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    if (a3) {
      a3 = (id)*((void *)a3 + 4);
    }
    uint64_t v7 = [a3 countByEnumeratingWithState:&v15 objects:v14 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v16;
      uint64_t v9 = (const __CFAllocator *)*MEMORY[0x189604DD0];
      do
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(a3);
          }
          char v11 = *(const __CFString **)(*((void *)&v15 + 1) + 8 * i);
          int v12 = (__CFRunLoopSource *)[*((id *)self->_private + 8) objectForKey:v11];
          if (!v12)
          {
            memset(&v13, 0, 72);
            v13.perform = (void (__cdecl *)(void *))__NSThreadPerformPerform;
            v13.info = calloc(1uLL, 8uLL);
            int v12 = CFRunLoopSourceCreate(v9, 0LL, &v13);
            *(void *)v13.info = v12;
            CFRunLoopAddSource(v6, v12, v11);
            [*((id *)self->_private + 8) setObject:v12 forKey:v11];
            CFRelease(v12);
          }

          CFRunLoopSourceSignal(v12);
        }

        uint64_t v7 = [a3 countByEnumeratingWithState:&v15 objects:v14 count:16];
      }

      while (v7);
    }

    CFRunLoopWakeUp(v6);
  }

  objc_sync_exit(self);
}

uint64_t ____NSThread__block_start___block_invoke()
{
  return pthread_key_create((pthread_key_t *)&qword_18C496410, (void (__cdecl *)(void *))__NSThread__block_dispose);
}

@end