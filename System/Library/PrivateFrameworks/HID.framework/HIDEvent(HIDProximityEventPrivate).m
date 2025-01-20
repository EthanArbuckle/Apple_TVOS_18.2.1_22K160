@interface HIDEvent(HIDProximityEventPrivate)
- (uint64_t)probabilityLevel;
- (uint64_t)proximityDetectionMask;
- (uint64_t)proximityLevel;
- (uint64_t)proximityProximityType;
- (uint64_t)setProbabilityLevel:()HIDProximityEventPrivate;
- (uint64_t)setProximityDetectionMask:()HIDProximityEventPrivate;
- (uint64_t)setProximityLevel:()HIDProximityEventPrivate;
- (uint64_t)setProximityProximityType:()HIDProximityEventPrivate;
@end

@implementation HIDEvent(HIDProximityEventPrivate)

- (uint64_t)probabilityLevel
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setProbabilityLevel:()HIDProximityEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)proximityDetectionMask
{
  return (unsigned __int16)IOHIDEventGetIntegerValue();
}

- (uint64_t)setProximityDetectionMask:()HIDProximityEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)proximityLevel
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setProximityLevel:()HIDProximityEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)proximityProximityType
{
  return (unsigned __int16)IOHIDEventGetIntegerValue();
}

- (uint64_t)setProximityProximityType:()HIDProximityEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

@end