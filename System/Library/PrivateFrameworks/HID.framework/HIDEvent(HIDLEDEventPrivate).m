@interface HIDEvent(HIDLEDEventPrivate)
- (uint64_t)ledMask;
- (uint64_t)ledNumber;
- (uint64_t)ledState;
- (uint64_t)setLedMask:()HIDLEDEventPrivate;
- (uint64_t)setLedNumber:()HIDLEDEventPrivate;
- (uint64_t)setLedState:()HIDLEDEventPrivate;
@end

@implementation HIDEvent(HIDLEDEventPrivate)

- (uint64_t)ledMask
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setLedMask:()HIDLEDEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)ledNumber
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setLedNumber:()HIDLEDEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)ledState
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setLedState:()HIDLEDEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

@end