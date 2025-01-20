@interface NearbyIDSServiceController
- (_TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController)init;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
@end

@implementation NearbyIDSServiceController

- (_TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController)init
{
  result = (_TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController *)_swift_stdlib_reportUnimplementedInitializer( "com_apple_SharePlay_Nearb yInvitationsService.Nearb yIDSServiceController",  71LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0Tm((Class *)((char *)&self->super.isa
                                                       + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_service));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_joinRequestsController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_queue));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_requesterCredentialsByOwnerPseudonym));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController____lazy_storage___contactStore));
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = a5;
  if (a5)
  {
    id v12 = a3;
    id v13 = a4;
    id v14 = a6;
    id v15 = a7;
    v16 = self;
    id v17 = v9;
    id v9 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(v9);
    unint64_t v19 = v18;

    if (a6) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v20 = 0LL;
    uint64_t v22 = 0LL;
    if (a3) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }

  id v24 = a3;
  id v25 = a4;
  id v26 = a6;
  id v27 = a7;
  v28 = self;
  unint64_t v19 = 0xF000000000000000LL;
  if (!a6) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  uint64_t v22 = v21;

  if (a3)
  {
LABEL_4:
    id v23 = a3;
    specialized NearbyIDSServiceController.handleIncomingMessage(_:account:incomingData:fromIDWithToken:context:)( (uint64_t)v9,  v19,  v20,  v22,  a7,  (uint64_t)self);

    swift_bridgeObjectRelease(v22);
    outlined consume of Data?((uint64_t)v9, v19);

    return;
  }

@end