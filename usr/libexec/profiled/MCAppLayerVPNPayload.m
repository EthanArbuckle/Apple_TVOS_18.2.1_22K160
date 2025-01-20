@interface MCAppLayerVPNPayload
- (id)handlerWithProfileHandler:(id)a3;
@end

@implementation MCAppLayerVPNPayload

- (id)handlerWithProfileHandler:(id)a3
{
  id v4 = a3;
  v5 = -[MCVPNPayloadHandlerBase initWithPayload:profileHandler:]( objc_alloc(&OBJC_CLASS___MCAppLayerVPNHandler),  "initWithPayload:profileHandler:",  self,  v4);

  return v5;
}

@end