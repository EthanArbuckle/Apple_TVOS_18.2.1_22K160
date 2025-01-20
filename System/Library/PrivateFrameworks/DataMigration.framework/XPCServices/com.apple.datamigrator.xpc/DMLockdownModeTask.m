@interface DMLockdownModeTask
+ (id)createTaskIfAppropriateWithEnvironment:(id)a3;
- (NSString)name;
- (NSString)telemetryIdentifier;
- (double)estimatedDurationTimeInterval;
- (id)workBlock;
- (void)setEstimatedDurationTimeInterval:(double)a3;
- (void)setName:(id)a3;
- (void)setTelemetryIdentifier:(id)a3;
- (void)setWorkBlock:(id)a3;
@end

@implementation DMLockdownModeTask

+ (id)createTaskIfAppropriateWithEnvironment:(id)a3
{
  return 0LL;
}

- (id)workBlock
{
  return objc_getProperty(self, a2, 8LL, 1);
}

- (void)setWorkBlock:(id)a3
{
}

- (double)estimatedDurationTimeInterval
{
  return self->_estimatedDurationTimeInterval;
}

- (void)setEstimatedDurationTimeInterval:(double)a3
{
  self->_estimatedDurationTimeInterval = a3;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setName:(id)a3
{
}

- (NSString)telemetryIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setTelemetryIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end