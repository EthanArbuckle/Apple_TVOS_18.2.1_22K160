@interface HIDEvent(HIDDigitizerEventPrivate)
- (uint64_t)digitizerAltitude;
- (uint64_t)digitizerAuxiliaryPressure;
- (uint64_t)digitizerAzimuth;
- (uint64_t)digitizerButtonMask;
- (uint64_t)digitizerChildEventMask;
- (uint64_t)digitizerCollection;
- (uint64_t)digitizerDensity;
- (uint64_t)digitizerDidUpdateMask;
- (uint64_t)digitizerEventMask;
- (uint64_t)digitizerGenerationCount;
- (uint64_t)digitizerIdentity;
- (uint64_t)digitizerIndex;
- (uint64_t)digitizerIrregularity;
- (uint64_t)digitizerIsDisplayIntegrated;
- (uint64_t)digitizerMajorRadius;
- (uint64_t)digitizerMinorRadius;
- (uint64_t)digitizerOrientationType;
- (uint64_t)digitizerPressure;
- (uint64_t)digitizerQuality;
- (uint64_t)digitizerQualityRadiiAccuracy;
- (uint64_t)digitizerRange;
- (uint64_t)digitizerRoll;
- (uint64_t)digitizerTiltX;
- (uint64_t)digitizerTiltY;
- (uint64_t)digitizerTouch;
- (uint64_t)digitizerTwist;
- (uint64_t)digitizerType;
- (uint64_t)digitizerWillUpdateMask;
- (uint64_t)digitizerX;
- (uint64_t)digitizerY;
- (uint64_t)digitizerZ;
- (uint64_t)setDigitizerAltitude:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerAuxiliaryPressure:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerAzimuth:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerButtonMask:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerChildEventMask:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerCollection:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerDensity:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerDidUpdateMask:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerEventMask:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerGenerationCount:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerIdentity:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerIndex:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerIrregularity:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerIsDisplayIntegrated:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerMajorRadius:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerMinorRadius:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerPressure:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerQuality:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerQualityRadiiAccuracy:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerRange:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerRoll:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerTiltX:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerTiltY:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerTouch:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerTwist:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerType:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerWillUpdateMask:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerX:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerY:()HIDDigitizerEventPrivate;
- (uint64_t)setDigitizerZ:()HIDDigitizerEventPrivate;
@end

@implementation HIDEvent(HIDDigitizerEventPrivate)

- (uint64_t)digitizerAltitude
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setDigitizerAltitude:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)digitizerAuxiliaryPressure
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setDigitizerAuxiliaryPressure:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)digitizerAzimuth
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setDigitizerAzimuth:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)digitizerButtonMask
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setDigitizerButtonMask:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)digitizerChildEventMask
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setDigitizerChildEventMask:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)digitizerCollection
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setDigitizerCollection:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)digitizerDensity
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setDigitizerDensity:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)digitizerDidUpdateMask
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setDigitizerDidUpdateMask:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)digitizerEventMask
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setDigitizerEventMask:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)digitizerGenerationCount
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setDigitizerGenerationCount:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)digitizerIdentity
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setDigitizerIdentity:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)digitizerIndex
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setDigitizerIndex:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)digitizerIrregularity
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setDigitizerIrregularity:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)digitizerIsDisplayIntegrated
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setDigitizerIsDisplayIntegrated:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)digitizerMajorRadius
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setDigitizerMajorRadius:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)digitizerMinorRadius
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setDigitizerMinorRadius:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)digitizerOrientationType
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)digitizerPressure
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setDigitizerPressure:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)digitizerQuality
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setDigitizerQuality:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)digitizerQualityRadiiAccuracy
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setDigitizerQualityRadiiAccuracy:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)digitizerRange
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setDigitizerRange:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)digitizerRoll
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setDigitizerRoll:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)digitizerTiltX
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setDigitizerTiltX:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)digitizerTiltY
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setDigitizerTiltY:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)digitizerTouch
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setDigitizerTouch:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)digitizerTwist
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setDigitizerTwist:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)digitizerType
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setDigitizerType:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)digitizerWillUpdateMask
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setDigitizerWillUpdateMask:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)digitizerX
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setDigitizerX:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)digitizerY
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setDigitizerY:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)digitizerZ
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setDigitizerZ:()HIDDigitizerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

@end