@interface HIDEvent(HIDBrightnessEventPrivate)
- (uint64_t)currentBrightness;
- (uint64_t)setCurrentBrightness:()HIDBrightnessEventPrivate;
- (uint64_t)setTargetBrightness:()HIDBrightnessEventPrivate;
- (uint64_t)setTransitionTime:()HIDBrightnessEventPrivate;
- (uint64_t)targetBrightness;
- (uint64_t)transitionTime;
@end

@implementation HIDEvent(HIDBrightnessEventPrivate)

- (uint64_t)currentBrightness
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setCurrentBrightness:()HIDBrightnessEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)targetBrightness
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setTargetBrightness:()HIDBrightnessEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)transitionTime
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setTransitionTime:()HIDBrightnessEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

@end