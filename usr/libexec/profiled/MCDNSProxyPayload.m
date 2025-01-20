@interface MCDNSProxyPayload
- (id)handlerWithProfileHandler:(id)a3;
@end

@implementation MCDNSProxyPayload

- (id)handlerWithProfileHandler:(id)a3
{
  id v4 = a3;
  v5 = -[MCDNSProxyPayloadHandler initWithPayload:profileHandler:]( objc_alloc(&OBJC_CLASS___MCDNSProxyPayloadHandler),  "initWithPayload:profileHandler:",  self,  v4);

  return v5;
}

@end