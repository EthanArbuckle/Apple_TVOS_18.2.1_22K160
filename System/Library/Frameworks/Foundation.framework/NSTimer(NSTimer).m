@interface NSTimer(NSTimer)
+ (NSCFTimer)allocWithZone:()NSTimer;
+ (__CFRunLoopTimer)scheduledTimerWithTimeInterval:()NSTimer invocation:repeats:;
+ (__CFRunLoopTimer)scheduledTimerWithTimeInterval:()NSTimer repeats:block:;
+ (__CFRunLoopTimer)scheduledTimerWithTimeInterval:()NSTimer target:selector:userInfo:repeats:;
+ (id)timerWithFireDate:()NSTimer target:selector:userInfo:;
+ (id)timerWithTimeInterval:()NSTimer invocation:repeats:;
+ (id)timerWithTimeInterval:()NSTimer repeats:block:;
+ (id)timerWithTimeInterval:()NSTimer target:selector:userInfo:repeats:;
- (double)context;
- (id)copyDebugDescription;
- (uint64_t)_cffireTime;
- (uint64_t)fireTime;
- (uint64_t)initWithFireDate:()NSTimer interval:repeats:block:;
- (uint64_t)order;
- (uint64_t)setFireTime:()NSTimer;
- (uint64_t)userInfo;
- (void)fire;
- (void)fireDate;
- (void)initWithFireDate:()NSTimer interval:target:selector:userInfo:repeats:;
- (void)invalidate;
- (void)isValid;
- (void)setFireDate:()NSTimer;
- (void)setTolerance:()NSTimer;
- (void)timeInterval;
- (void)tolerance;
@end

@implementation NSTimer(NSTimer)

+ (NSCFTimer)allocWithZone:()NSTimer
{
  if ((objc_class *)MEMORY[0x189604028] == a1) {
    return +[NSCFTimer allocWithZone:](&OBJC_CLASS___NSCFTimer, "allocWithZone:");
  }
  else {
    return (NSCFTimer *)NSAllocateObject(a1, 0LL, a3);
  }
}

+ (id)timerWithTimeInterval:()NSTimer invocation:repeats:
{
  id v9 = objc_allocWithZone(a1);
  return (id)objc_msgSend( v9,  "initWithFireDate:interval:target:selector:userInfo:repeats:",  objc_msgSend(MEMORY[0x189603F50], "dateWithTimeIntervalSinceNow:", a2),  a4,  sel_invoke,  0,  a5,  a2);
}

+ (__CFRunLoopTimer)scheduledTimerWithTimeInterval:()NSTimer invocation:repeats:
{
  id v9 = objc_allocWithZone(a1);
  v10 = (__CFRunLoopTimer *)(id)objc_msgSend( v9,  "initWithFireDate:interval:target:selector:userInfo:repeats:",  objc_msgSend( MEMORY[0x189603F50],  "dateWithTimeIntervalSinceNow:",  a2),  a4,  sel_invoke,  0,  a5,  a2);
  Current = CFRunLoopGetCurrent();
  CFRunLoopAddTimer(Current, v10, (CFRunLoopMode)*MEMORY[0x1896051B0]);
  return v10;
}

+ (id)timerWithTimeInterval:()NSTimer target:selector:userInfo:repeats:
{
  id v12 = objc_allocWithZone(a1);
  return (id)objc_msgSend( v12,  "initWithFireDate:interval:target:selector:userInfo:repeats:",  objc_msgSend(MEMORY[0x189603F50], "dateWithTimeIntervalSinceNow:", a2),  a4,  a5,  a6,  a7,  a2);
}

+ (__CFRunLoopTimer)scheduledTimerWithTimeInterval:()NSTimer target:selector:userInfo:repeats:
{
  id v12 = objc_allocWithZone(a1);
  v13 = (__CFRunLoopTimer *)(id)objc_msgSend( v12,  "initWithFireDate:interval:target:selector:userInfo:repeats:",  objc_msgSend( MEMORY[0x189603F50],  "dateWithTimeIntervalSinceNow:",  a2),  a4,  a5,  a6,  a7,  a2);
  Current = CFRunLoopGetCurrent();
  CFRunLoopAddTimer(Current, v13, (CFRunLoopMode)*MEMORY[0x1896051B0]);
  return v13;
}

+ (id)timerWithTimeInterval:()NSTimer repeats:block:
{
  id v8 = objc_allocWithZone(a1);
  return (id)objc_msgSend( v8,  "initWithFireDate:interval:repeats:block:",  objc_msgSend(MEMORY[0x189603F50], "dateWithTimeIntervalSinceNow:", a2),  a4,  a5,  a2);
}

+ (__CFRunLoopTimer)scheduledTimerWithTimeInterval:()NSTimer repeats:block:
{
  id v8 = objc_allocWithZone(a1);
  id v9 = (__CFRunLoopTimer *)(id)objc_msgSend( v8,  "initWithFireDate:interval:repeats:block:",  objc_msgSend(MEMORY[0x189603F50], "dateWithTimeIntervalSinceNow:", a2),  a4,  a5,  a2);
  Current = CFRunLoopGetCurrent();
  CFRunLoopAddTimer(Current, v9, (CFRunLoopMode)*MEMORY[0x1896051B0]);
  return v9;
}

+ (id)timerWithFireDate:()NSTimer target:selector:userInfo:
{
  return (id)[objc_allocWithZone(a1) initWithFireDate:a3 interval:a4 target:a5 selector:a6 userInfo:0 repeats:0.0];
}

- (uint64_t)initWithFireDate:()NSTimer interval:repeats:block:
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  v11 = objc_alloc(&OBJC_CLASS____NSTimerBlockTarget);
  if (v11)
  {
    v15.receiver = v11;
    v15.super_class = (Class)&OBJC_CLASS____NSTimerBlockTarget;
    id v12 = objc_msgSendSuper2(&v15, sel_init);
    v12[1] = _Block_copy(a6);
  }

  else
  {
    id v12 = 0LL;
  }

  uint64_t v13 = [a1 initWithFireDate:a4 interval:v12 target:sel_fire_ selector:0 userInfo:a5 repeats:a2];

  return v13;
}

- (void)initWithFireDate:()NSTimer interval:target:selector:userInfo:repeats:
{
}

- (void)invalidate
{
  v4 = NSClassFromString((NSString *)@"NSTimer");
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)isValid
{
  v4 = NSClassFromString((NSString *)@"NSTimer");
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)timeInterval
{
  v4 = NSClassFromString((NSString *)@"NSTimer");
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)tolerance
{
  v4 = NSClassFromString((NSString *)@"NSTimer");
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)setTolerance:()NSTimer
{
  v4 = NSClassFromString((NSString *)@"NSTimer");
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)fire
{
  v4 = NSClassFromString((NSString *)@"NSTimer");
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)fireDate
{
  v4 = NSClassFromString((NSString *)@"NSTimer");
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)setFireDate:()NSTimer
{
  v4 = NSClassFromString((NSString *)@"NSTimer");
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (uint64_t)userInfo
{
  return 0LL;
}

- (id)copyDebugDescription
{
  return (id)[a1 debugDescription];
}

- (uint64_t)order
{
  return 0LL;
}

- (uint64_t)fireTime
{
  return objc_msgSend((id)objc_msgSend(a1, "fireDate"), "timeIntervalSinceReferenceDate");
}

- (uint64_t)setFireTime:()NSTimer
{
  return objc_msgSend(a1, "setFireDate:", objc_msgSend(MEMORY[0x189603F50], "dateWithTimeIntervalSinceReferenceDate:"));
}

- (double)context
{
  *(void *)(a1 + 32) = 0LL;
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

- (uint64_t)_cffireTime
{
  return objc_msgSend((id)objc_msgSend(a1, "fireDate"), "timeIntervalSinceReferenceDate");
}

@end