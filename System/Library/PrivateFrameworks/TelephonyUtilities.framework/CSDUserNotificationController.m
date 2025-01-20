@interface CSDUserNotificationController
- (CSDUserNotificationController)init;
- (CSDUserNotificationController)initWithCallFilterController:(id)a3;
- (void)dealloc;
- (void)momentCapturedForStreamToken:(int64_t)a3 requesterID:(id)a4 reply:(id)a5;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation CSDUserNotificationController

- (CSDUserNotificationController)initWithCallFilterController:(id)a3
{
  id v3 = a3;
  return (CSDUserNotificationController *)sub_10029CED8();
}

- (void)dealloc
{
  v2 = self;
  sub_10029D140();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR___CSDUserNotificationController_phoneNotificationCenter));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR___CSDUserNotificationController_faceTimeNotificationCenter));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___CSDUserNotificationController_providersByIdentifier));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CSDUserNotificationController_providers));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CSDUserNotificationController_badgeManager));
}

- (CSDUserNotificationController)init
{
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject(&unk_1003E6290, 24LL, 7LL);
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  sub_10029DA94();

  swift_release(v9);
}

- (void)momentCapturedForStreamToken:(int64_t)a3 requesterID:(id)a4 reply:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v11 = v10;
  _Block_copy(v8);
  v12 = self;
  sub_10029E058(a3, v9, v11, (uint64_t)v12, (void (**)(void, void))v8);
  _Block_release(v8);

  swift_bridgeObjectRelease(v11);
}

@end