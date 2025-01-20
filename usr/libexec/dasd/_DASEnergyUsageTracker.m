@interface _DASEnergyUsageTracker
- (BOOL)initialReading;
- (void)setInitialReading:(BOOL)a3;
@end

@implementation _DASEnergyUsageTracker

- (BOOL)initialReading
{
  return self->_initialReading;
}

- (void)setInitialReading:(BOOL)a3
{
  self->_initialReading = a3;
}

@end