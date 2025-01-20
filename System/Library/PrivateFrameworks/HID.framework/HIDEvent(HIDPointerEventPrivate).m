@interface HIDEvent(HIDPointerEventPrivate)
- (uint64_t)pointerButtonMask;
- (uint64_t)pointerX;
- (uint64_t)pointerY;
- (uint64_t)pointerZ;
- (uint64_t)setPointerButtonMask:()HIDPointerEventPrivate;
- (uint64_t)setPointerX:()HIDPointerEventPrivate;
- (uint64_t)setPointerY:()HIDPointerEventPrivate;
- (uint64_t)setPointerZ:()HIDPointerEventPrivate;
@end

@implementation HIDEvent(HIDPointerEventPrivate)

- (uint64_t)pointerButtonMask
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setPointerButtonMask:()HIDPointerEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)pointerX
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setPointerX:()HIDPointerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)pointerY
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setPointerY:()HIDPointerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

- (uint64_t)pointerZ
{
  return IOHIDEventGetFloatValue();
}

- (uint64_t)setPointerZ:()HIDPointerEventPrivate
{
  return IOHIDEventSetFloatValue();
}

@end