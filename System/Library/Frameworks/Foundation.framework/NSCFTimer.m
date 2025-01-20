@interface NSCFTimer
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)allowsWeakReference;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (BOOL)retainWeakReference;
- (NSCFTimer)init;
- (NSCFTimer)initWithFireDate:(id)a3 interval:(double)a4 target:(id)a5 selector:(SEL)a6 userInfo:(id)a7 repeats:(BOOL)a8;
- (id)fireDate;
- (id)userInfo;
- (void)fire;
- (void)setFireDate:(id)a3;
@end

@implementation NSCFTimer

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  if (self == a3) {
    return 1;
  }
  return _CFNonObjCEqual() != 0;
}

- (BOOL)allowsWeakReference
{
  return _CFIsDeallocating() == 0;
}

- (BOOL)retainWeakReference
{
  return _CFTryRetain() != 0;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  v4[5] = *MEMORY[0x1895F89C0];
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __27__NSCFTimer_allocWithZone___block_invoke;
  v4[3] = &unk_189C9A030;
  v4[4] = a1;
  if (qword_18C496C30 != -1) {
    dispatch_once(&qword_18C496C30, v4);
  }
  return (id)_MergedGlobals_122;
}

id __27__NSCFTimer_allocWithZone___block_invoke(uint64_t a1)
{
  id result = NSAllocateObject(*(Class *)(a1 + 32), 0LL, 0LL);
  _MergedGlobals_122 = (uint64_t)result;
  return result;
}

- (BOOL)isValid
{
  return CFRunLoopTimerIsValid((CFRunLoopTimerRef)self) != 0;
}

- (id)fireDate
{
  return (id)[MEMORY[0x189603F50] dateWithTimeIntervalSinceReferenceDate:CFRunLoopTimerGetNextFireDate((CFRunLoopTimerRef)self)];
}

- (void)setFireDate:(id)a3
{
}

- (id)userInfo
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.version = 0LL;
  CFRunLoopTimerGetContext((CFRunLoopTimerRef)self, &v3);
  return (id)*((void *)v3.info + 3);
}

- (void)fire
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (-[NSCFTimer isValid](self, "isValid"))
  {
    CFRunLoopTimerContext v3 = self;
    v5.version = 0LL;
    CFRunLoopTimerGetContext((CFRunLoopTimerRef)self, &v5);
    __NSFireTimer(self, (uint64_t)v5.info);
    -[NSCFTimer timeInterval](self, "timeInterval");
    if (v4 == 0.0) {
      -[NSCFTimer invalidate](self, "invalidate");
    }
  }

- (NSCFTimer)initWithFireDate:(id)a3 interval:(double)a4 target:(id)a5 selector:(SEL)a6 userInfo:(id)a7 repeats:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v21 = *MEMORY[0x1895F89C0];
  v14 = malloc_default_zone();
  v15 = malloc_zone_calloc(v14, 1uLL, 0x20uLL);
  v16 = v15;
  v20.version = 0LL;
  v20.info = v15;
  v20.retain = (const void *(__cdecl *)(const void *))_timerRetain;
  v20.release = (void (__cdecl *)(const void *))_timerRelease;
  v20.copyDescription = 0LL;
  if (a4 <= 0.0) {
    a4 = 0.0001;
  }
  *(_DWORD *)v15 = 0;
  v15[1] = a5;
  v16[2] = a6;
  v16[3] = a7;
  objc_msgSend( a3,  "timeIntervalSinceReferenceDate",  v20.version,  v20.info,  v20.retain,  v20.release,  v20.copyDescription,  v21);
  double v18 = 0.0;
  if (v8) {
    double v18 = a4;
  }
  return (NSCFTimer *)CFRunLoopTimerCreate(0LL, v17, v18, 0LL, 0LL, (CFRunLoopTimerCallBack)__NSFireTimer, &v20);
}

- (NSCFTimer)init
{
  return 0LL;
}

@end