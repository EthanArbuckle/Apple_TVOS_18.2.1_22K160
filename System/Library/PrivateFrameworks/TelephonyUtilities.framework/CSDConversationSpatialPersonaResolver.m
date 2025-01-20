@interface CSDConversationSpatialPersonaResolver
- (BOOL)upsertWithParticipantID:(unint64_t)a3 generationID:(unint64_t)a4 spatialPersonaState:(int64_t)a5;
- (NSString)description;
- (_TtC13callservicesd37CSDConversationSpatialPersonaResolver)init;
- (_TtC13callservicesd37CSDConversationSpatialPersonaResolver)initWithQueue:(id)a3;
- (id)participantStateStrWithTruncate:(BOOL)a3;
- (int64_t)conversationState;
- (int64_t)localParticipantState;
- (unint64_t)generationCounter;
- (unint64_t)localGenerationCounter;
- (void)configWithLocalParticipantID:(unint64_t)a3 groupUUID:(id)a4 activeParticipantIdentifiers:(id)a5;
- (void)removeParticipantWithIdentifier:(unint64_t)a3;
- (void)reset;
- (void)setLocalGenerationCounter:(unint64_t)a3;
- (void)setLocalParticipantState:(int64_t)a3;
@end

@implementation CSDConversationSpatialPersonaResolver

- (unint64_t)localGenerationCounter
{
  return sub_1001ACE6C();
}

- (void)setLocalGenerationCounter:(unint64_t)a3
{
}

- (int64_t)localParticipantState
{
  return sub_1001ACED0();
}

- (void)setLocalParticipantState:(int64_t)a3
{
}

- (_TtC13callservicesd37CSDConversationSpatialPersonaResolver)initWithQueue:(id)a3
{
  return result;
}

- (_TtC13callservicesd37CSDConversationSpatialPersonaResolver)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13callservicesd37CSDConversationSpatialPersonaResolver_queue));
  sub_1001AFF54((uint64_t)self + OBJC_IVAR____TtC13callservicesd37CSDConversationSpatialPersonaResolver_groupUUID);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC13callservicesd37CSDConversationSpatialPersonaResolver_participantState));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC13callservicesd37CSDConversationSpatialPersonaResolver_initialParticipantIdentifiers));
}

- (unint64_t)generationCounter
{
  v2 = self;
  sub_1001AD4F0();
  unint64_t v4 = v3;

  return v4;
}

- (int64_t)conversationState
{
  v2 = self;
  sub_1001AD6E4();
  int64_t v4 = v3;

  return v4;
}

- (void)reset
{
  v2 = self;
  sub_1001ADDF0();
}

- (void)configWithLocalParticipantID:(unint64_t)a3 groupUUID:(id)a4 activeParticipantIdentifiers:(id)a5
{
  uint64_t v8 = type metadata accessor for UUID(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v12 = static Set._unconditionallyBridgeFromObjectiveC(_:)( a5,  &type metadata for UInt64,  &protocol witness table for UInt64);
  v13 = self;
  sub_1001AE04C();

  swift_bridgeObjectRelease(v12);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (BOOL)upsertWithParticipantID:(unint64_t)a3 generationID:(unint64_t)a4 spatialPersonaState:(int64_t)a5
{
  v5 = self;
  BOOL v6 = sub_1001AEE1C();

  return v6;
}

- (void)removeParticipantWithIdentifier:(unint64_t)a3
{
  int64_t v4 = self;
  sub_1001AF8E0(a3);
}

- (id)participantStateStrWithTruncate:(BOOL)a3
{
  int64_t v4 = self;
  sub_1001AF968(a3);
  uint64_t v6 = v5;

  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6);
  return v7;
}

- (NSString)description
{
  v2 = self;
  CSDConversationSpatialPersonaResolver.description.getter();
  uint64_t v4 = v3;

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

@end