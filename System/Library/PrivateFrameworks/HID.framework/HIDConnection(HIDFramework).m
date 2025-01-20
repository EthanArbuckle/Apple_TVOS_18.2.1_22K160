@interface HIDConnection(HIDFramework)
- (uint64_t)getAuditToken:()HIDFramework;
@end

@implementation HIDConnection(HIDFramework)

- (uint64_t)getAuditToken:()HIDFramework
{
  return IOHIDEventSystemConnectionGetAuditToken();
}

@end