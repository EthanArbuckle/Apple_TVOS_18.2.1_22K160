@interface HIDEvent(HIDTouchSensitiveButtonEventPrivate)
- (BOOL)touchSensitiveButtonTouch;
- (uint64_t)setTouchSensitiveButtonEventMask:()HIDTouchSensitiveButtonEventPrivate;
- (uint64_t)setTouchSensitiveButtonMajorRadius:()HIDTouchSensitiveButtonEventPrivate;
- (uint64_t)setTouchSensitiveButtonMinorRadius:()HIDTouchSensitiveButtonEventPrivate;
- (uint64_t)setTouchSensitiveButtonNormalizedPositionDeltaX:()HIDTouchSensitiveButtonEventPrivate;
- (uint64_t)setTouchSensitiveButtonNormalizedPositionDeltaY:()HIDTouchSensitiveButtonEventPrivate;
- (uint64_t)setTouchSensitiveButtonNormalizedPositionX:()HIDTouchSensitiveButtonEventPrivate;
- (uint64_t)setTouchSensitiveButtonNormalizedPositionY:()HIDTouchSensitiveButtonEventPrivate;
- (uint64_t)setTouchSensitiveButtonTouch:()HIDTouchSensitiveButtonEventPrivate;
- (uint64_t)setTouchSensitiveButtonUsage:()HIDTouchSensitiveButtonEventPrivate;
- (uint64_t)setTouchSensitiveButtonUsagePage:()HIDTouchSensitiveButtonEventPrivate;
- (uint64_t)touchSensitiveButtonEventMask;
- (uint64_t)touchSensitiveButtonMajorRadius;
- (uint64_t)touchSensitiveButtonMinorRadius;
- (uint64_t)touchSensitiveButtonNormalizedPositionDeltaX;
- (uint64_t)touchSensitiveButtonNormalizedPositionDeltaY;
- (uint64_t)touchSensitiveButtonNormalizedPositionX;
- (uint64_t)touchSensitiveButtonNormalizedPositionY;
- (uint64_t)touchSensitiveButtonUsage;
- (uint64_t)touchSensitiveButtonUsagePage;
@end

@implementation HIDEvent(HIDTouchSensitiveButtonEventPrivate)

- (uint64_t)touchSensitiveButtonEventMask
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setTouchSensitiveButtonEventMask:()HIDTouchSensitiveButtonEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)touchSensitiveButtonMajorRadius
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setTouchSensitiveButtonMajorRadius:()HIDTouchSensitiveButtonEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)touchSensitiveButtonMinorRadius
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setTouchSensitiveButtonMinorRadius:()HIDTouchSensitiveButtonEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)touchSensitiveButtonNormalizedPositionDeltaX
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setTouchSensitiveButtonNormalizedPositionDeltaX:()HIDTouchSensitiveButtonEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)touchSensitiveButtonNormalizedPositionDeltaY
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setTouchSensitiveButtonNormalizedPositionDeltaY:()HIDTouchSensitiveButtonEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)touchSensitiveButtonNormalizedPositionX
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setTouchSensitiveButtonNormalizedPositionX:()HIDTouchSensitiveButtonEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)touchSensitiveButtonNormalizedPositionY
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setTouchSensitiveButtonNormalizedPositionY:()HIDTouchSensitiveButtonEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (BOOL)touchSensitiveButtonTouch
{
  return IOHIDEventGetIntegerValue() != 0;
}

- (uint64_t)setTouchSensitiveButtonTouch:()HIDTouchSensitiveButtonEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)touchSensitiveButtonUsage
{
  return (unsigned __int16)IOHIDEventGetIntegerValue();
}

- (uint64_t)setTouchSensitiveButtonUsage:()HIDTouchSensitiveButtonEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)touchSensitiveButtonUsagePage
{
  return (unsigned __int16)IOHIDEventGetIntegerValue();
}

- (uint64_t)setTouchSensitiveButtonUsagePage:()HIDTouchSensitiveButtonEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

@end