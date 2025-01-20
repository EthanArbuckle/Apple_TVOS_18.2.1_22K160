@interface HIDConnection
- (id)description;
- (void)dealloc;
@end

@implementation HIDConnection

- (id)description
{
  return (id)(id)IOHIDEventSystemConnectionCopyDescription((time_t *)self);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___HIDConnection;
  -[HIDConnection dealloc](&v3, sel_dealloc);
}

@end