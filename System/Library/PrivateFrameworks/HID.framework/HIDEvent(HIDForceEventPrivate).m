@interface HIDEvent(HIDForceEventPrivate)
- (uint64_t)forceBehavior;
- (uint64_t)forceProgress;
- (uint64_t)forceStage;
- (uint64_t)forceStagePressure;
- (uint64_t)setForceBehavior:()HIDForceEventPrivate;
- (uint64_t)setForceProgress:()HIDForceEventPrivate;
- (uint64_t)setForceStage:()HIDForceEventPrivate;
- (uint64_t)setForceStagePressure:()HIDForceEventPrivate;
@end

@implementation HIDEvent(HIDForceEventPrivate)

- (uint64_t)forceBehavior
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setForceBehavior:()HIDForceEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)forceProgress
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setForceProgress:()HIDForceEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)forceStage
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setForceStage:()HIDForceEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)forceStagePressure
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setForceStagePressure:()HIDForceEventPrivate
{
  return IOHIDEventSetFloatValue();
}

@end