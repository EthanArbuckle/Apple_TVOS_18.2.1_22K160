@interface HIDEvent(HIDGenericGestureEvent)
+ (char)genericGestureEvent:()HIDGenericGestureEvent gestureType:options:;
@end

@implementation HIDEvent(HIDGenericGestureEvent)

+ (char)genericGestureEvent:()HIDGenericGestureEvent gestureType:options:
{
  v5 = (char *)_IOHIDEventCreate();
  *(_DWORD *)(*(void *)&v5[*MEMORY[0x1896085C8] + 96] + 16LL) = a4;
  return v5;
}

@end