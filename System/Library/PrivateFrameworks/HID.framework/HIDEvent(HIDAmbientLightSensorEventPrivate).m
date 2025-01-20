@interface HIDEvent(HIDAmbientLightSensorEventPrivate)
- (BOOL)ambientLightDisplayBrightnessChanged;
- (uint64_t)ambientLightColorComponent0;
- (uint64_t)ambientLightColorComponent1;
- (uint64_t)ambientLightColorComponent2;
- (uint64_t)ambientLightColorSpace;
- (uint64_t)ambientLightSensorColorTemperature;
- (uint64_t)ambientLightSensorIlluminance;
- (uint64_t)ambientLightSensorLevel;
- (uint64_t)ambientLightSensorRawChannel0;
- (uint64_t)ambientLightSensorRawChannel1;
- (uint64_t)ambientLightSensorRawChannel2;
- (uint64_t)ambientLightSensorRawChannel3;
- (uint64_t)setAmbientLightColorComponent0:()HIDAmbientLightSensorEventPrivate;
- (uint64_t)setAmbientLightColorComponent1:()HIDAmbientLightSensorEventPrivate;
- (uint64_t)setAmbientLightColorComponent2:()HIDAmbientLightSensorEventPrivate;
- (uint64_t)setAmbientLightColorSpace:()HIDAmbientLightSensorEventPrivate;
- (uint64_t)setAmbientLightDisplayBrightnessChanged:()HIDAmbientLightSensorEventPrivate;
- (uint64_t)setAmbientLightSensorColorTemperature:()HIDAmbientLightSensorEventPrivate;
- (uint64_t)setAmbientLightSensorIlluminance:()HIDAmbientLightSensorEventPrivate;
- (uint64_t)setAmbientLightSensorLevel:()HIDAmbientLightSensorEventPrivate;
- (uint64_t)setAmbientLightSensorRawChannel0:()HIDAmbientLightSensorEventPrivate;
- (uint64_t)setAmbientLightSensorRawChannel1:()HIDAmbientLightSensorEventPrivate;
- (uint64_t)setAmbientLightSensorRawChannel2:()HIDAmbientLightSensorEventPrivate;
- (uint64_t)setAmbientLightSensorRawChannel3:()HIDAmbientLightSensorEventPrivate;
@end

@implementation HIDEvent(HIDAmbientLightSensorEventPrivate)

- (uint64_t)ambientLightColorComponent0
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setAmbientLightColorComponent0:()HIDAmbientLightSensorEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)ambientLightColorComponent1
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setAmbientLightColorComponent1:()HIDAmbientLightSensorEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)ambientLightColorComponent2
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setAmbientLightColorComponent2:()HIDAmbientLightSensorEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)ambientLightColorSpace
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setAmbientLightColorSpace:()HIDAmbientLightSensorEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (BOOL)ambientLightDisplayBrightnessChanged
{
  return IOHIDEventGetIntegerValue() != 0;
}

- (uint64_t)setAmbientLightDisplayBrightnessChanged:()HIDAmbientLightSensorEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)ambientLightSensorColorTemperature
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setAmbientLightSensorColorTemperature:()HIDAmbientLightSensorEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)ambientLightSensorIlluminance
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setAmbientLightSensorIlluminance:()HIDAmbientLightSensorEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)ambientLightSensorLevel
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setAmbientLightSensorLevel:()HIDAmbientLightSensorEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)ambientLightSensorRawChannel0
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setAmbientLightSensorRawChannel0:()HIDAmbientLightSensorEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)ambientLightSensorRawChannel1
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setAmbientLightSensorRawChannel1:()HIDAmbientLightSensorEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)ambientLightSensorRawChannel2
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setAmbientLightSensorRawChannel2:()HIDAmbientLightSensorEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)ambientLightSensorRawChannel3
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setAmbientLightSensorRawChannel3:()HIDAmbientLightSensorEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

@end