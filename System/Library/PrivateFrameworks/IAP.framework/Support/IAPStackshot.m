@interface IAPStackshot
+ (id)sharedInstance;
- (IAPStackshot)init;
- (id)startTimer:(double)a3 withInfo:(id)a4;
- (void)_saveStackshot:(id)a3;
- (void)_stackshotThread;
- (void)endTimer:(id)a3;
@end

@implementation IAPStackshot

+ (id)sharedInstance
{
  if (qword_10011BB38 != -1) {
    dispatch_once(&qword_10011BB38, &stru_100101D48);
  }
  return (id)qword_10011BB30;
}

- (IAPStackshot)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___IAPStackshot;
  result = -[IAPStackshot init](&v4, "init");
  v3 = result;
  if (!result) {
    return v3;
  }
  if ((((_BYTE)result + 16) & 3) == 0)
  {
    result->_timerID = 0;
    +[NSThread detachNewThreadSelector:toTarget:withObject:]( &OBJC_CLASS___NSThread,  "detachNewThreadSelector:toTarget:withObject:",  "_stackshotThread",  result,  0LL);
    return v3;
  }

  __break(0x5516u);
  return result;
}

- (id)startTimer:(double)a3 withInfo:(id)a4
{
  if ((((unint64_t)self + 8) & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    if (*((void *)self + 1))
    {
      objc_super v4 = (id *)self;
      v5 = -[NSTimer initWithFireDate:interval:target:selector:userInfo:repeats:]( objc_alloc(&OBJC_CLASS___NSTimer),  "initWithFireDate:interval:target:selector:userInfo:repeats:",  +[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", a3),  self,  "_saveStackshot:",  a4,  0LL,  0.0);
      [v4[1] addTimer:v5 forMode:NSDefaultRunLoopMode];
    }

    else
    {
      NSLog( @"ERROR - %s:%s - %d no run loop",  a2,  a4,  a3,  "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPStackshot.m",  "-[IAPStackshot startTimer:withInfo:]",  53LL);
      v5 = 0LL;
    }

    return v5;
  }

  return self;
}

- (void)endTimer:(id)a3
{
}

- (void)_stackshotThread
{
  v6 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  v3 = objc_alloc_init(&OBJC_CLASS___NSPort);
  objc_super v4 = +[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop");
  p_stackshotRunLoop = &self->_stackshotRunLoop;
  if ((p_stackshotRunLoop & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    *p_stackshotRunLoop = v4;
    -[NSRunLoop addPort:forMode:](v4, "addPort:forMode:", v3, NSDefaultRunLoopMode);

    NSLog(@"_stackshotThread started (%hhx)", *p_stackshotRunLoop);
    CFRunLoopRun();
    NSLog(@"_stackshotThread ended (%hhx)", *p_stackshotRunLoop);
  }

- (void)_saveStackshot:(id)a3
{
  else {
    NSLog(@"saveStackshot(%hhx): %@", self->_stackshotRunLoop, [a3 userInfo]);
  }
}

@end