@interface HIDElement(HIDFramework)
- (CFIndex)integerValue;
- (double)scaleValue:()HIDFramework;
- (id)dataValue;
- (uint64_t)description;
- (uint64_t)reportID;
- (uint64_t)reportSize;
- (uint64_t)setValueRef:()HIDFramework;
- (uint64_t)timestamp;
- (uint64_t)type;
- (uint64_t)unit;
- (uint64_t)unitExponent;
- (uint64_t)usage;
- (uint64_t)usagePage;
- (void)setDataValue:()HIDFramework;
- (void)setIntegerValue:()HIDFramework;
@end

@implementation HIDElement(HIDFramework)

- (uint64_t)description
{
  return objc_msgSend( NSString,  "stringWithFormat:",  @"timestamp: %llu type: %ld usagePage: %ld usage: %ld reportID: %ld value: %ld",  objc_msgSend(a1, "timestamp"),  objc_msgSend(a1, "type"),  objc_msgSend(a1, "usagePage"),  objc_msgSend(a1, "usage"),  objc_msgSend(a1, "reportID"),  objc_msgSend(a1, "integerValue"));
}

- (uint64_t)setValueRef:()HIDFramework
{
  return _IOHIDElementSetValue();
}

- (double)scaleValue:()HIDFramework
{
  if ([a1 valueRef]) {
    return IOHIDValueGetScaledValue((IOHIDValueRef)[a1 valueRef], a3);
  }
  else {
    return 0.0;
  }
}

- (CFIndex)integerValue
{
  CFIndex result = [a1 valueRef];
  if (result) {
    return IOHIDValueGetIntegerValue((IOHIDValueRef)[a1 valueRef]);
  }
  return result;
}

- (void)setIntegerValue:()HIDFramework
{
  IOHIDValueRef v4 = IOHIDValueCreateWithIntegerValue((CFAllocatorRef)*MEMORY[0x189604DB0], element, 0LL, value);
  if (v4)
  {
    IOHIDValueRef v5 = v4;
    -[__IOHIDElement setValueRef:](element, "setValueRef:", v4);
    CFRelease(v5);
  }

- (id)dataValue
{
  v2 = (void *)[a1 valueRef];
  if (v2)
  {
    v3 = (void *)MEMORY[0x189603F48];
    BytePtr = IOHIDValueGetBytePtr((IOHIDValueRef)[a1 valueRef]);
    objc_msgSend(v3, "dataWithBytes:length:", BytePtr, IOHIDValueGetLength((IOHIDValueRef)objc_msgSend(a1, "valueRef")));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v2;
}

- (void)setDataValue:()HIDFramework
{
  IOHIDValueRef v4 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  id v5 = a3;
  v6 = (const uint8_t *)[v5 bytes];
  CFIndex v7 = [v5 length];

  IOHIDValueRef v8 = IOHIDValueCreateWithBytes(v4, a1, 0LL, v6, v7);
  if (v8)
  {
    IOHIDValueRef v9 = v8;
    -[__IOHIDElement setValueRef:](a1, "setValueRef:", v8);
    CFRelease(v9);
  }

- (uint64_t)type
{
  return IOHIDElementGetType(a1);
}

- (uint64_t)usagePage
{
  return IOHIDElementGetUsagePage(a1);
}

- (uint64_t)usage
{
  return IOHIDElementGetUsage(a1);
}

- (uint64_t)reportID
{
  return IOHIDElementGetReportID(a1);
}

- (uint64_t)reportSize
{
  return IOHIDElementGetReportSize(a1);
}

- (uint64_t)unit
{
  return IOHIDElementGetUnit(a1);
}

- (uint64_t)unitExponent
{
  return IOHIDElementGetUnitExponent(a1);
}

- (uint64_t)timestamp
{
  uint64_t result = [a1 valueRef];
  if (result) {
    return IOHIDValueGetTimeStamp((IOHIDValueRef)[a1 valueRef]);
  }
  return result;
}

@end