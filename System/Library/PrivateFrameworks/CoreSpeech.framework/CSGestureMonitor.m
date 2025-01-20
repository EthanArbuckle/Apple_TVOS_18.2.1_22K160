@interface CSGestureMonitor
+ (id)sharedInstance;
- (BOOL)isTriggerHandheld;
- (unint64_t)dismissalTimestamp;
- (unint64_t)wakeGestureTimestamp;
- (void)setDismissalTimestamp:(unint64_t)a3;
- (void)setWakeGestureTimestamp:(unint64_t)a3;
@end

@implementation CSGestureMonitor

+ (id)sharedInstance
{
  return 0LL;
}

- (BOOL)isTriggerHandheld
{
  return 0;
}

- (unint64_t)wakeGestureTimestamp
{
  return self->_wakeGestureTimestamp;
}

- (void)setWakeGestureTimestamp:(unint64_t)a3
{
  self->_wakeGestureTimestamp = a3;
}

- (unint64_t)dismissalTimestamp
{
  return self->_dismissalTimestamp;
}

- (void)setDismissalTimestamp:(unint64_t)a3
{
  self->_dismissalTimestamp = a3;
}

@end