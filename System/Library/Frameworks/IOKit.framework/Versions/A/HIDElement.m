@interface HIDElement
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation HIDElement

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___HIDElement;
  -[HIDElement dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  return IOHIDElementGetCookie((IOHIDElementRef)self);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  IOHIDElementCookie Cookie = IOHIDElementGetCookie((IOHIDElementRef)self);
  return Cookie == IOHIDElementGetCookie((IOHIDElementRef)a3);
}

@end