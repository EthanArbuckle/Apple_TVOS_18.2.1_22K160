@interface PBSAnimationWatchdogProvider
- (BOOL)shouldWatchdog:(id *)a3;
- (PBSAnimationWatchdogProvider)initWithTimeout:(double)a3;
- (double)timeout;
- (double)watchdogTimeout;
@end

@implementation PBSAnimationWatchdogProvider

- (PBSAnimationWatchdogProvider)initWithTimeout:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PBSAnimationWatchdogProvider;
  result = -[PBSAnimationWatchdogProvider init](&v5, "init");
  if (result) {
    result->_timeout = a3;
  }
  return result;
}

- (double)watchdogTimeout
{
  double v3 = UIAnimationDragCoefficient(self, a2).n128_f32[0];
  int v4 = BSFloatGreaterThanFloat(v3, 0.0);
  double v5 = 1.0;
  if (v4) {
    double v5 = v3;
  }
  return self->_timeout * v5;
}

- (BOOL)shouldWatchdog:(id *)a3
{
  return 1;
}

- (double)timeout
{
  return self->_timeout;
}

@end