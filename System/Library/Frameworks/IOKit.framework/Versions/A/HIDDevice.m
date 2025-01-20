@interface HIDDevice
- (id)description;
- (void)dealloc;
@end

@implementation HIDDevice

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___HIDDevice;
  -[HIDDevice dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return IOHIDDeviceCopyDescription((io_object_t *)self);
}

@end