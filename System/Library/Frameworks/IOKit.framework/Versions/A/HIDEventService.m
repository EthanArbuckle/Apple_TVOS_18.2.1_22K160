@interface HIDEventService
- (id)description;
- (void)dealloc;
@end

@implementation HIDEventService

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___HIDEventService;
  -[HIDEventService dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)(id)IOHIDServiceCopyDescription((uint64_t)self);
}

@end