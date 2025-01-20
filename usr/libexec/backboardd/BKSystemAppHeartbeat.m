@interface BKSystemAppHeartbeat
- (BKSystemAppHeartbeat)init;
- (BKSystemAppHeartbeat)initWithFireCount:(unint64_t)a3 interval:(double)a4;
- (void)_handleTimer:(id)a3;
- (void)dealloc;
- (void)start;
@end

@implementation BKSystemAppHeartbeat

- (BKSystemAppHeartbeat)init
{
  return -[BKSystemAppHeartbeat initWithFireCount:interval:](self, "initWithFireCount:interval:", 10LL, 15.0);
}

- (BKSystemAppHeartbeat)initWithFireCount:(unint64_t)a3 interval:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___BKSystemAppHeartbeat;
  result = -[BKSystemAppHeartbeat init](&v7, "init");
  if (result)
  {
    result->_numberOfTimesToFire = a3;
    result->_interval = a4;
  }

  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___BKSystemAppHeartbeat;
  -[BKSystemAppHeartbeat dealloc](&v3, "dealloc");
}

- (void)_handleTimer:(id)a3
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification( DarwinNotifyCenter,  @"com.apple.backboard.systemAppHeartbeat",  0LL,  0LL,  1u);
  if (self->_firedCount == self->_numberOfTimesToFire)
  {
    -[NSTimer invalidate](self->_timer, "invalidate");
    timer = self->_timer;
    self->_timer = 0LL;
  }

- (void)start
{
  self->_firedCount = 0LL;
  -[NSTimer invalidate](self->_timer, "invalidate");
  objc_super v3 = (NSTimer *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "_handleTimer:",  0LL,  1LL,  self->_interval));
  timer = self->_timer;
  self->_timer = v3;

  -[BKSystemAppHeartbeat _handleTimer:](self, "_handleTimer:", self->_timer);
}

- (void).cxx_destruct
{
}

@end