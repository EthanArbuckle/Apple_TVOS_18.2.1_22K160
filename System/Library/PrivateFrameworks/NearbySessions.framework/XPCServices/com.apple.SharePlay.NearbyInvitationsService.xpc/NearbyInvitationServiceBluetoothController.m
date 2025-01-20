@interface NearbyInvitationServiceBluetoothController
- (_TtC44com_apple_SharePlay_NearbyInvitationsService42NearbyInvitationServiceBluetoothController)init;
@end

@implementation NearbyInvitationServiceBluetoothController

- (_TtC44com_apple_SharePlay_NearbyInvitationsService42NearbyInvitationServiceBluetoothController)init
{
  return (_TtC44com_apple_SharePlay_NearbyInvitationsService42NearbyInvitationServiceBluetoothController *)NearbyInvitationServiceBluetoothController.init()();
}

- (void).cxx_destruct
{
  v3 = (char *)self
     + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService42NearbyInvitationServiceBluetoothController_queue;
  uint64_t v4 = type metadata accessor for AsyncSerialQueue(0LL, a2);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService42NearbyInvitationServiceBluetoothController_ongoingBroadcasts));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService42NearbyInvitationServiceBluetoothController_participantInvitationScan));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService42NearbyInvitationServiceBluetoothController_ongoingInviteRequests));
}

@end