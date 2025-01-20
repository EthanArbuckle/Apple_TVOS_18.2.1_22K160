@interface HIDEvent(HIDBiometricEventPrivate)
- (uint64_t)biometricEventType;
- (uint64_t)biometricLevel;
- (uint64_t)biometricTapCount;
- (uint64_t)biometricUsage;
- (uint64_t)biometricUsagePage;
- (uint64_t)setBiometricEventType:()HIDBiometricEventPrivate;
- (uint64_t)setBiometricLevel:()HIDBiometricEventPrivate;
- (uint64_t)setBiometricTapCount:()HIDBiometricEventPrivate;
- (uint64_t)setBiometricUsage:()HIDBiometricEventPrivate;
- (uint64_t)setBiometricUsagePage:()HIDBiometricEventPrivate;
@end

@implementation HIDEvent(HIDBiometricEventPrivate)

- (uint64_t)biometricEventType
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setBiometricEventType:()HIDBiometricEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)biometricLevel
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setBiometricLevel:()HIDBiometricEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)biometricTapCount
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setBiometricTapCount:()HIDBiometricEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)biometricUsage
{
  return (unsigned __int16)IOHIDEventGetIntegerValue();
}

- (uint64_t)setBiometricUsage:()HIDBiometricEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)biometricUsagePage
{
  return (unsigned __int16)IOHIDEventGetIntegerValue();
}

- (uint64_t)setBiometricUsagePage:()HIDBiometricEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

@end