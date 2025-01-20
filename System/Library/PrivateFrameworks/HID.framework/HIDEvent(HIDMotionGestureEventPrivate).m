@interface HIDEvent(HIDMotionGestureEventPrivate)
- (uint64_t)motionGestureGestureType;
- (uint64_t)motionGestureProgress;
- (uint64_t)setMotionGestureGestureType:()HIDMotionGestureEventPrivate;
- (uint64_t)setMotionGestureProgress:()HIDMotionGestureEventPrivate;
@end

@implementation HIDEvent(HIDMotionGestureEventPrivate)

- (uint64_t)motionGestureGestureType
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setMotionGestureGestureType:()HIDMotionGestureEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)motionGestureProgress
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setMotionGestureProgress:()HIDMotionGestureEventPrivate
{
  return IOHIDEventSetFloatValue();
}

@end