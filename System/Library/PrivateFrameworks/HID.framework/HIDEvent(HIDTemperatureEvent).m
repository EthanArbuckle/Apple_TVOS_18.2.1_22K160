@interface HIDEvent(HIDTemperatureEvent)
+ (char)temperatureEvent:()HIDTemperatureEvent level:options:;
@end

@implementation HIDEvent(HIDTemperatureEvent)

+ (char)temperatureEvent:()HIDTemperatureEvent level:options:
{
  v2 = (char *)_IOHIDEventCreate();
  *(_DWORD *)(*(void *)&v2[*MEMORY[0x1896085C8] + 96] + 16LL) = vcvtd_n_s64_f64(a1, 0x10uLL);
  return v2;
}

@end