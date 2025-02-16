@interface HIDEvent(HIDLEDEvent)
+ (char)lEDEvent:()HIDLEDEvent ledMask:number:state:options:;
@end

@implementation HIDEvent(HIDLEDEvent)

+ (char)lEDEvent:()HIDLEDEvent ledMask:number:state:options:
{
  v9 = (char *)_IOHIDEventCreate();
  uint64_t v10 = *(void *)&v9[*MEMORY[0x1896085C8] + 96];
  *(_DWORD *)(v10 + 16) = a4;
  *(_BYTE *)(v10 + 20) = a5;
  *(_DWORD *)(v10 + 24) = a6;
  return v9;
}

@end