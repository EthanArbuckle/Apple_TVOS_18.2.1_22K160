@interface HIDEvent(HIDProximityEvent)
+ (char)proximityEvent:()HIDProximityEvent detectionMask:options:;
@end

@implementation HIDEvent(HIDProximityEvent)

+ (char)proximityEvent:()HIDProximityEvent detectionMask:options:
{
  v5 = (char *)_IOHIDEventCreate();
  *(_WORD *)(*(void *)&v5[*MEMORY[0x1896085C8] + 96] + 16LL) = a4;
  return v5;
}

@end