@interface HIDServiceClient
- (id)description;
- (void)dealloc;
@end

@implementation HIDServiceClient

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___HIDServiceClient;
  -[HIDServiceClient dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return IOHIDServiceClientCopyDescription((uint64_t)self);
}

@end