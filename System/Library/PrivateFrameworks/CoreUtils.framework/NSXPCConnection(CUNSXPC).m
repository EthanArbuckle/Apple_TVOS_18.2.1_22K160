@interface NSXPCConnection(CUNSXPC)
- (id)cuValueForEntitlementNoCache:()CUNSXPC;
@end

@implementation NSXPCConnection(CUNSXPC)

- (id)cuValueForEntitlementNoCache:()CUNSXPC
{
  v4 = (void *)[a3 UTF8String];
  if (v4)
  {
    [a1 auditToken];
    v5 = (void *)xpc_copy_entitlement_for_token();
    if (v5) {
      v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    }
    else {
      v4 = 0LL;
    }
  }

  return v4;
}

@end