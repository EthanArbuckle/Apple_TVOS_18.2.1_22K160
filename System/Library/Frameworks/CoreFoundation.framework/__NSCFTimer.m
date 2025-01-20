@interface __NSCFTimer
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (__NSCFTimer)init;
- (__NSCFTimer)initWithFireDate:(id)a3 interval:(double)a4 target:(id)a5 selector:(SEL)a6 userInfo:(id)a7 repeats:(BOOL)a8;
- (id)fireDate;
- (id)userInfo;
- (void)fire;
- (void)setFireDate:(id)a3;
@end

@implementation __NSCFTimer

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  if (self == a3) {
    return 1;
  }
  return _CFNonObjCEqual((unint64_t *)self, (unint64_t *)a3) != 0;
}

- (BOOL)_tryRetain
{
  return _CFTryRetain((unint64_t *)self) != 0LL;
}

- (BOOL)_isDeallocating
{
  return _CFIsDeallocating((uint64_t)self) != 0;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return 0LL;
}

- (BOOL)isValid
{
  return CFRunLoopTimerIsValid((CFRunLoopTimerRef)self) != 0;
}

- (id)fireDate
{
  return +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  CFRunLoopTimerGetNextFireDate((CFRunLoopTimerRef)self));
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
  if (-[__NSCFTimer isValid](self, "isValid"))
  {
    CFRunLoopTimerContext v3 = self;
    v5.version = 0LL;
    CFRunLoopTimerGetContext((CFRunLoopTimerRef)self, &v5);
    __CFFireTimer(self, (uint64_t)v5.info);
    -[__NSCFTimer timeInterval](self, "timeInterval");
    if (v4 == 0.0) {
      -[__NSCFTimer invalidate](self, "invalidate");
    }
  }

- (__NSCFTimer)initWithFireDate:(id)a3 interval:(double)a4 target:(id)a5 selector:(SEL)a6 userInfo:(id)a7 repeats:(BOOL)a8
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
  return (__NSCFTimer *)CFRunLoopTimerCreate(0LL, v17, v18, 0LL, 0LL, (CFRunLoopTimerCallBack)__CFFireTimer, &v20);
}

- (__NSCFTimer)init
{
  return 0LL;
}

@end