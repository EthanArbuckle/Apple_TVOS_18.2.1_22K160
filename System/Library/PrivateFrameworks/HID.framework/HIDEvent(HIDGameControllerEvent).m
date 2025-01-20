@interface HIDEvent(HIDGameControllerEvent)
+ (char)gameControllerEvent:()HIDGameControllerEvent controllerType:options:;
@end

@implementation HIDEvent(HIDGameControllerEvent)

+ (char)gameControllerEvent:()HIDGameControllerEvent controllerType:options:
{
  v5 = (char *)_IOHIDEventCreate();
  *(_DWORD *)(*(void *)&v5[*MEMORY[0x1896085C8] + 96] + 16LL) = a4;
  return v5;
}

@end