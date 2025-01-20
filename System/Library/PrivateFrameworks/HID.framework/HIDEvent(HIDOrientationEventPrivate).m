@interface HIDEvent(HIDOrientationEventPrivate)
- (uint64_t)orientationAltitude;
- (uint64_t)orientationAzimuth;
- (uint64_t)orientationDeviceOrientationUsage;
- (uint64_t)orientationOrientationType;
- (uint64_t)orientationQuatW;
- (uint64_t)orientationQuatX;
- (uint64_t)orientationQuatY;
- (uint64_t)orientationQuatZ;
- (uint64_t)orientationRadius;
- (uint64_t)orientationTiltX;
- (uint64_t)orientationTiltY;
- (uint64_t)orientationTiltZ;
- (uint64_t)setOrientationAltitude:()HIDOrientationEventPrivate;
- (uint64_t)setOrientationAzimuth:()HIDOrientationEventPrivate;
- (uint64_t)setOrientationDeviceOrientationUsage:()HIDOrientationEventPrivate;
- (uint64_t)setOrientationQuatW:()HIDOrientationEventPrivate;
- (uint64_t)setOrientationQuatX:()HIDOrientationEventPrivate;
- (uint64_t)setOrientationQuatY:()HIDOrientationEventPrivate;
- (uint64_t)setOrientationQuatZ:()HIDOrientationEventPrivate;
- (uint64_t)setOrientationRadius:()HIDOrientationEventPrivate;
- (uint64_t)setOrientationTiltX:()HIDOrientationEventPrivate;
- (uint64_t)setOrientationTiltY:()HIDOrientationEventPrivate;
- (uint64_t)setOrientationTiltZ:()HIDOrientationEventPrivate;
@end

@implementation HIDEvent(HIDOrientationEventPrivate)

- (uint64_t)orientationAltitude
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setOrientationAltitude:()HIDOrientationEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)orientationAzimuth
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setOrientationAzimuth:()HIDOrientationEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)orientationDeviceOrientationUsage
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setOrientationDeviceOrientationUsage:()HIDOrientationEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)orientationOrientationType
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)orientationQuatW
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setOrientationQuatW:()HIDOrientationEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)orientationQuatX
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setOrientationQuatX:()HIDOrientationEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)orientationQuatY
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setOrientationQuatY:()HIDOrientationEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)orientationQuatZ
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setOrientationQuatZ:()HIDOrientationEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)orientationRadius
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setOrientationRadius:()HIDOrientationEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)orientationTiltX
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setOrientationTiltX:()HIDOrientationEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)orientationTiltY
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setOrientationTiltY:()HIDOrientationEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)orientationTiltZ
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setOrientationTiltZ:()HIDOrientationEventPrivate
{
  return IOHIDEventSetFloatValue();
}

@end