@interface MCConferenceRoomDisplayPayload
- (id)handlerWithProfileHandler:(id)a3;
@end

@implementation MCConferenceRoomDisplayPayload

- (id)handlerWithProfileHandler:(id)a3
{
  id v4 = a3;
  v5 = -[MCNewPayloadHandler initWithPayload:profileHandler:]( objc_alloc(&OBJC_CLASS___MCConferenceRoomDisplayPayloadHandler),  "initWithPayload:profileHandler:",  self,  v4);

  return v5;
}

@end