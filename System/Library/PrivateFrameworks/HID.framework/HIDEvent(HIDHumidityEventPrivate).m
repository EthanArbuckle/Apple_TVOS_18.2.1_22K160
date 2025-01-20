@interface HIDEvent(HIDHumidityEventPrivate)
- (uint64_t)humidityRH;
- (uint64_t)humiditySequence;
- (uint64_t)setHumidityRH:()HIDHumidityEventPrivate;
- (uint64_t)setHumiditySequence:()HIDHumidityEventPrivate;
@end

@implementation HIDEvent(HIDHumidityEventPrivate)

- (uint64_t)humidityRH
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setHumidityRH:()HIDHumidityEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)humiditySequence
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setHumiditySequence:()HIDHumidityEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

@end