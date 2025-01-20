@interface MCGlobalEthernetPayload
- (id)handlerWithProfileHandler:(id)a3;
@end

@implementation MCGlobalEthernetPayload

- (id)handlerWithProfileHandler:(id)a3
{
  id v4 = a3;
  v5 = -[MCGlobalEthernetPayloadHandler initWithPayload:profileHandler:]( objc_alloc(&OBJC_CLASS___MCGlobalEthernetPayloadHandler),  "initWithPayload:profileHandler:",  self,  v4);

  return v5;
}

@end