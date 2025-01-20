@interface MCVPNPayload
- (id)handlerWithProfileHandler:(id)a3;
@end

@implementation MCVPNPayload

- (id)handlerWithProfileHandler:(id)a3
{
  id v4 = a3;
  v5 = -[MCVPNPayloadHandlerBase initWithPayload:profileHandler:]( objc_alloc(&OBJC_CLASS___MCNewVPNPayloadHandler),  "initWithPayload:profileHandler:",  self,  v4);

  return v5;
}

@end