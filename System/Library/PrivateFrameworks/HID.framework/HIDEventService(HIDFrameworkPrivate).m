@interface HIDEventService(HIDFrameworkPrivate)
- (uint64_t)dispatchEvent:()HIDFrameworkPrivate;
@end

@implementation HIDEventService(HIDFrameworkPrivate)

- (uint64_t)dispatchEvent:()HIDFrameworkPrivate
{
  return _IOHIDServiceDispatchEvent();
}

@end