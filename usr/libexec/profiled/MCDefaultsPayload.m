@interface MCDefaultsPayload
- (id)handlerWithProfileHandler:(id)a3;
@end

@implementation MCDefaultsPayload

- (id)handlerWithProfileHandler:(id)a3
{
  id v4 = a3;
  v5 = -[MCNewDefaultsPayloadHandler initWithPayload:profileHandler:]( objc_alloc(&OBJC_CLASS___MCNewDefaultsPayloadHandler),  "initWithPayload:profileHandler:",  self,  v4);

  return v5;
}

@end