@interface SDAirDropService
- (NSString)description;
- (_TtC16DaemoniOSLibrary16SDAirDropService)init;
@end

@implementation SDAirDropService

- (_TtC16DaemoniOSLibrary16SDAirDropService)init
{
  return result;
}

- (NSString)description
{
  v3 = self;
  v4 = (void *)static SFAirDropUserDefaults.shared.getter();
  SFAirDropUserDefaults.description.getter();
  uint64_t v6 = v5;

  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6);
  return (NSString *)v7;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary16SDAirDropService_pseudonymService));

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary16SDAirDropService_transfersSubject));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary16SDAirDropService_transferObserverTask));
  *(void *)&double v3 = swift_bridgeObjectRelease(*(const char **)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC16DaemoniOSLibrary16SDAirDropService_transferObserverClientsBundleIDs)).n128_u64[0];
  swift_bridgeObjectRelease( *(const char **)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary16SDAirDropService_transferPresenters),  v3);

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary16SDAirDropService_sendService));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary16SDAirDropService_receiveService));
  sub_10018709C((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC16DaemoniOSLibrary16SDAirDropService_nearFieldService));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary16SDAirDropService_pairingService));
  sub_10018709C((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC16DaemoniOSLibrary16SDAirDropService_airDropUISessionManager));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary16SDAirDropService_sessionLogger));
}

@end