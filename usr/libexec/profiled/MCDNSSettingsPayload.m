@interface MCDNSSettingsPayload
- (id)handlerWithProfileHandler:(id)a3;
@end

@implementation MCDNSSettingsPayload

- (id)handlerWithProfileHandler:(id)a3
{
  id v4 = a3;
  v5 = -[MCDNSSettingsPayloadHandler initWithPayload:profileHandler:]( objc_alloc(&OBJC_CLASS___MCDNSSettingsPayloadHandler),  "initWithPayload:profileHandler:",  self,  v4);

  return v5;
}

@end