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
  return [BKSystemAppHeartbeat initWithFireCount:10 interval:15.0];
}

- (BKSystemAppHeartbeat)initWithFireCount:(unint64_t)a3 interval:(double)a4
{
  v7.receiver = self;
  v7.super_class = [BKSystemAppHeartbeat class];
  result = [BKSystemAppHeartbeat init];
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
  v3.super_class = [BKSystemAppHeartbeat class];
  [v3 dealloc];
}

- (void)_handleTimer:(id)a3
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification( DarwinNotifyCenter,  @"com.apple.backboard.systemAppHeartbeat",  0LL,  0LL,  1u);
  if (self->_firedCount == self->_numberOfTimesToFire)
  {
    [self->_timer invalidate];
    timer = self->_timer;
    self->_timer = 0LL;
  }

- (void)start
{
  self->_firedCount = 0LL;
  [self->_timer invalidate];
  NSTimer *v3 = [NSTimer scheduledTimerWithTimeInterval:self->_interval target:self selector:@selector(_handleTimer:) userInfo:nil repeats:1];
  timer = self->_timer;
  self->_timer = v3;

  [self _handleTimer:self->_timer];
}

- (void).cxx_destruct
{
}

@end