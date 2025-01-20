@interface MCWiFiPayload
- (id)handlerWithProfileHandler:(id)a3;
@end

@implementation MCWiFiPayload

- (id)handlerWithProfileHandler:(id)a3
{
  id v4 = a3;
  v5 = -[MCNewWiFiPayloadHandler initWithPayload:profileHandler:]( objc_alloc(&OBJC_CLASS___MCNewWiFiPayloadHandler),  "initWithPayload:profileHandler:",  self,  v4);

  return v5;
}

@end