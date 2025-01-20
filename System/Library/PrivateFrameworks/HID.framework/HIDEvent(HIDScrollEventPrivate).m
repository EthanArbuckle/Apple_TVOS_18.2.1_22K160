@interface HIDEvent(HIDScrollEventPrivate)
- (uint64_t)scrollIsPixels;
- (uint64_t)scrollX;
- (uint64_t)scrollY;
- (uint64_t)scrollZ;
- (uint64_t)setScrollIsPixels:()HIDScrollEventPrivate;
- (uint64_t)setScrollX:()HIDScrollEventPrivate;
- (uint64_t)setScrollY:()HIDScrollEventPrivate;
- (uint64_t)setScrollZ:()HIDScrollEventPrivate;
@end

@implementation HIDEvent(HIDScrollEventPrivate)

- (uint64_t)scrollIsPixels
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setScrollIsPixels:()HIDScrollEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)scrollX
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setScrollX:()HIDScrollEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)scrollY
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setScrollY:()HIDScrollEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)scrollZ
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setScrollZ:()HIDScrollEventPrivate
{
  return IOHIDEventSetFloatValue();
}

@end