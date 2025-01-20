@interface ProxiedGroupSessionParticipantUpdate
- (NSString)debugDescription;
- (_TtC44com_apple_NeighborhoodActivityConduitService36ProxiedGroupSessionParticipantUpdate)init;
@end

@implementation ProxiedGroupSessionParticipantUpdate

- (NSString)debugDescription
{
  v2 = self;
  sub_100006A48();
  uint64_t v4 = v3;

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (_TtC44com_apple_NeighborhoodActivityConduitService36ProxiedGroupSessionParticipantUpdate)init
{
  result = (_TtC44com_apple_NeighborhoodActivityConduitService36ProxiedGroupSessionParticipantUpdate *)_swift_stdlib_reportUnimplementedInitializer("com_apple_NeighborhoodActivityConduitService.ProxiedGroupSessionParticipantUpdate", 81LL, "init()", 6LL, 0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self
     + OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService36ProxiedGroupSessionParticipantUpdate_groupUUID;
  uint64_t v4 = type metadata accessor for UUID(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  swift_bridgeObjectRelease(*(void *)&self->participantIdentifier[OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService36ProxiedGroupSessionParticipantUpdate_participantDestinationID]);
  NSString v5 = (char *)self
     + OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService36ProxiedGroupSessionParticipantUpdate_serverDate;
  uint64_t v6 = type metadata accessor for Date(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8LL))(v5, v6);
  sub_10000C048( *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService36ProxiedGroupSessionParticipantUpdate_participantData),  *(void *)&self->participantIdentifier[OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService36ProxiedGroupSessionParticipantUpdate_participantData]);
  sub_10000C048( *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService36ProxiedGroupSessionParticipantUpdate_clientContextData),  *(void *)&self->participantIdentifier[OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService36ProxiedGroupSessionParticipantUpdate_clientContextData]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService36ProxiedGroupSessionParticipantUpdate_members));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService36ProxiedGroupSessionParticipantUpdate_participantIDs));
}

@end