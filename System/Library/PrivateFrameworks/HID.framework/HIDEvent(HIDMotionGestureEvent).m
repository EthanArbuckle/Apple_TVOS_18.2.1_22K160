@interface HIDEvent(HIDMotionGestureEvent)
+ (char)motionGestureEvent:()HIDMotionGestureEvent gestureType:progress:options:;
@end

@implementation HIDEvent(HIDMotionGestureEvent)

+ (char)motionGestureEvent:()HIDMotionGestureEvent gestureType:progress:options:
{
  v7 = (char *)_IOHIDEventCreate();
  uint64_t v8 = *(void *)&v7[*MEMORY[0x1896085C8] + 96];
  *(_DWORD *)(v8 + 16) = a5;
  *(_DWORD *)(v8 + 20) = vcvtd_n_s64_f64(a1, 0x10uLL);
  return v7;
}

@end