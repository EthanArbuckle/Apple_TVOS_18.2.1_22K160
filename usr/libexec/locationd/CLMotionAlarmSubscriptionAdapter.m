@interface CLMotionAlarmSubscriptionAdapter
- (BOOL)valid;
- (CLMotionAlarmSubscriptionAdapter)initWithMotionAlarmSubscription:(void *)a3;
- (void)fireAlarm:(id)a3 error:(int)a4;
- (void)motionAlarmSubscription;
- (void)setMotionAlarmSubscription:(void *)a3;
- (void)setValid:(BOOL)a3;
@end

@implementation CLMotionAlarmSubscriptionAdapter

- (CLMotionAlarmSubscriptionAdapter)initWithMotionAlarmSubscription:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CLMotionAlarmSubscriptionAdapter;
  result = -[CLMotionAlarmSubscriptionAdapter init](&v5, "init");
  if (result) {
    result->_motionAlarmSubscription = a3;
  }
  return result;
}

- (void)fireAlarm:(id)a3 error:(int)a4
{
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void)motionAlarmSubscription
{
  return self->_motionAlarmSubscription;
}

- (void)setMotionAlarmSubscription:(void *)a3
{
  self->_motionAlarmSubscription = a3;
}

@end