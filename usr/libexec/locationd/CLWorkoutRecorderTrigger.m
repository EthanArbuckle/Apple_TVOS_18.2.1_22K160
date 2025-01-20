@interface CLWorkoutRecorderTrigger
- (BOOL)valid;
- (CLWorkoutRecorderTrigger)initWithDelegate:(id)a3 andUniverse:(id)a4;
- (void)setValid:(BOOL)a3;
@end

@implementation CLWorkoutRecorderTrigger

- (CLWorkoutRecorderTrigger)initWithDelegate:(id)a3 andUniverse:(id)a4
{
  return 0LL;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end