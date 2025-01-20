@interface CLSensorRecorderAlmanacListener
- (int)subscriptionType;
- (void)notifier;
- (void)sensorWriterWillStartMonitoring:(id)a3;
- (void)setNotifier:(void *)a3;
- (void)setSubscriptionType:(int)a3;
@end

@implementation CLSensorRecorderAlmanacListener

- (void)sensorWriterWillStartMonitoring:(id)a3
{
  if (self->_notifier)
  {
    unsigned int v4 = 100;
    if (-[CLSensorRecorderAlmanacListener subscriptionType](self, "subscriptionType", a3) == 2)
    {
      else {
        unsigned int v4 = 25;
      }
    }

    sub_100E7D4EC( (uint64_t)self->_notifier,  -[CLSensorRecorderAlmanacListener subscriptionType](self, "subscriptionType"),  v4);
  }

- (void)notifier
{
  return self->_notifier;
}

- (void)setNotifier:(void *)a3
{
  self->_notifier = a3;
}

- (int)subscriptionType
{
  return self->_subscriptionType;
}

- (void)setSubscriptionType:(int)a3
{
  self->_subscriptionType = a3;
}

@end