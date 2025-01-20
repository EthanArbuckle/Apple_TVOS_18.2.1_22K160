@interface MCGmailAccountPayload
- (id)handlerWithProfileHandler:(id)a3;
@end

@implementation MCGmailAccountPayload

- (id)handlerWithProfileHandler:(id)a3
{
  id v4 = a3;
  v5 = -[MCGmailAccountPayloadHandler initWithPayload:profileHandler:]( objc_alloc(&OBJC_CLASS___MCGmailAccountPayloadHandler),  "initWithPayload:profileHandler:",  self,  v4);

  return v5;
}

@end