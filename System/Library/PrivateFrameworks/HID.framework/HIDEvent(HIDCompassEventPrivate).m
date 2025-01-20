@interface HIDEvent(HIDCompassEventPrivate)
- (uint64_t)compassSequence;
- (uint64_t)compassSubType;
- (uint64_t)compassType;
- (uint64_t)compassX;
- (uint64_t)compassY;
- (uint64_t)compassZ;
- (uint64_t)setCompassSequence:()HIDCompassEventPrivate;
- (uint64_t)setCompassSubType:()HIDCompassEventPrivate;
- (uint64_t)setCompassType:()HIDCompassEventPrivate;
- (uint64_t)setCompassX:()HIDCompassEventPrivate;
- (uint64_t)setCompassY:()HIDCompassEventPrivate;
- (uint64_t)setCompassZ:()HIDCompassEventPrivate;
@end

@implementation HIDEvent(HIDCompassEventPrivate)

- (uint64_t)compassSequence
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setCompassSequence:()HIDCompassEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)compassSubType
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setCompassSubType:()HIDCompassEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)compassType
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setCompassType:()HIDCompassEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)compassX
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setCompassX:()HIDCompassEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)compassY
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setCompassY:()HIDCompassEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)compassZ
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setCompassZ:()HIDCompassEventPrivate
{
  return IOHIDEventSetFloatValue();
}

@end