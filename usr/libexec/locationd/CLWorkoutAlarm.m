@interface CLWorkoutAlarm
- (BOOL)eligibleForDataCollection;
- (CLWorkoutAlarm)initWithType:(int64_t)a3 dataCollection:(BOOL)a4;
- (int64_t)eventType;
- (void)setEligibleForDataCollection:(BOOL)a3;
- (void)setEventType:(int64_t)a3;
@end

@implementation CLWorkoutAlarm

- (CLWorkoutAlarm)initWithType:(int64_t)a3 dataCollection:(BOOL)a4
{
  BOOL v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CLWorkoutAlarm;
  v6 = -[CLWorkoutAlarm init](&v8, "init");
  -[CLWorkoutAlarm setEventType:](v6, "setEventType:", a3);
  -[CLWorkoutAlarm setEligibleForDataCollection:](v6, "setEligibleForDataCollection:", v4);
  return v6;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int64_t)a3
{
  self->_eventType = a3;
}

- (BOOL)eligibleForDataCollection
{
  return self->_eligibleForDataCollection;
}

- (void)setEligibleForDataCollection:(BOOL)a3
{
  self->_eligibleForDataCollection = a3;
}

@end