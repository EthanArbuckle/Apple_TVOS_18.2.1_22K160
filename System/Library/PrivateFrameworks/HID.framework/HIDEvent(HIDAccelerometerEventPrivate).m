@interface HIDEvent(HIDAccelerometerEventPrivate)
- (uint64_t)accelerometerSequence;
- (uint64_t)accelerometerSubType;
- (uint64_t)accelerometerType;
- (uint64_t)accelerometerX;
- (uint64_t)accelerometerY;
- (uint64_t)accelerometerZ;
- (uint64_t)setAccelerometerSequence:()HIDAccelerometerEventPrivate;
- (uint64_t)setAccelerometerSubType:()HIDAccelerometerEventPrivate;
- (uint64_t)setAccelerometerType:()HIDAccelerometerEventPrivate;
- (uint64_t)setAccelerometerX:()HIDAccelerometerEventPrivate;
- (uint64_t)setAccelerometerY:()HIDAccelerometerEventPrivate;
- (uint64_t)setAccelerometerZ:()HIDAccelerometerEventPrivate;
@end

@implementation HIDEvent(HIDAccelerometerEventPrivate)

- (uint64_t)accelerometerSequence
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setAccelerometerSequence:()HIDAccelerometerEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)accelerometerSubType
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setAccelerometerSubType:()HIDAccelerometerEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)accelerometerType
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setAccelerometerType:()HIDAccelerometerEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)accelerometerX
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setAccelerometerX:()HIDAccelerometerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)accelerometerY
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setAccelerometerY:()HIDAccelerometerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)accelerometerZ
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setAccelerometerZ:()HIDAccelerometerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

@end