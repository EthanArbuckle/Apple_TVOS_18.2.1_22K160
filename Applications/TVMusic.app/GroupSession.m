@interface GroupSession
- (BOOL)isEqual:(id)a3;
- (_TtC7TVMusic12GroupSession)init;
- (void)groupSession:(id)a3 didInvalidateWithError:(id)a4;
- (void)groupSession:(id)a3 didUpdateParticipants:(id)a4;
- (void)groupSession:(id)a3 didUpdatePendingParticipants:(id)a4;
- (void)groupSessionDidConnect:(id)a3;
@end

@implementation GroupSession

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v9);
    swift_unknownObjectRelease(a3);
  }

  else
  {
    memset(v9, 0, sizeof(v9));
    v6 = self;
  }

  unsigned __int8 v7 = sub_10014317C((uint64_t)v9);

  sub_1000E03B4((uint64_t)v9, &qword_1002B7850);
  return v7 & 1;
}

- (_TtC7TVMusic12GroupSession)init
{
  result = (_TtC7TVMusic12GroupSession *)_swift_stdlib_reportUnimplementedInitializer( "TVMusic.GroupSession",  20LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7TVMusic12GroupSession__participants);
  swift_bridgeObjectRelease(*(void *)&self->_participants[OBJC_IVAR____TtC7TVMusic12GroupSession__participants]);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC7TVMusic12GroupSession__participantSocialProfiles));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7TVMusic12GroupSession__socialProfileTask));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7TVMusic12GroupSession__mrGroupSession));
  sub_100148B48( *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7TVMusic12GroupSession__host),  *(void *)&self->_participants[OBJC_IVAR____TtC7TVMusic12GroupSession__host],  *(void *)&self->_participants[OBJC_IVAR____TtC7TVMusic12GroupSession__host + 8]);
  v4 = (char *)self + OBJC_IVAR____TtC7TVMusic12GroupSession___observationRegistrar;
  uint64_t v5 = type metadata accessor for ObservationRegistrar(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8LL))(v4, v5);
}

- (void)groupSessionDidConnect:(id)a3
{
  uint64_t v5 = sub_1000DFE10(&qword_1002BB500);
  __chkstk_darwin(v5, v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56LL))(v8, 1LL, 1LL, v9);
  type metadata accessor for MainActor(0LL);
  v10 = self;
  uint64_t v11 = swift_unknownObjectRetain(a3);
  uint64_t v12 = static MainActor.shared.getter(v11);
  v13 = (void *)swift_allocObject(&unk_1002743C8, 40LL, 7LL);
  v13[2] = v12;
  v13[3] = &protocol witness table for MainActor;
  v13[4] = v10;
  uint64_t v14 = sub_100125950((uint64_t)v8, (uint64_t)&unk_1002BB5C8, (uint64_t)v13);
  swift_release(v14);
  sub_100144FA0(a3);
  swift_unknownObjectRelease(a3);
}

- (void)groupSession:(id)a3 didUpdateParticipants:(id)a4
{
  uint64_t v6 = self;
  sub_100144FA0(a3);
  swift_unknownObjectRelease(a3);
}

- (void)groupSession:(id)a3 didUpdatePendingParticipants:(id)a4
{
  uint64_t v7 = sub_1000DFE10(&qword_1002BB500);
  __chkstk_darwin(v7, v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = static Set._unconditionallyBridgeFromObjectiveC(_:)( a4,  &type metadata for AnyHashable,  &protocol witness table for AnyHashable);
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v10, 1LL, 1LL, v12);
  type metadata accessor for MainActor(0LL);
  v13 = self;
  swift_unknownObjectRetain(a3);
  uint64_t v14 = swift_bridgeObjectRetain(v11);
  uint64_t v15 = static MainActor.shared.getter(v14);
  v16 = (void *)swift_allocObject(&unk_100274300, 48LL, 7LL);
  v16[2] = v15;
  v16[3] = &protocol witness table for MainActor;
  v16[4] = v13;
  v16[5] = v11;
  uint64_t v17 = sub_100125950((uint64_t)v10, (uint64_t)&unk_1002BB528, (uint64_t)v16);
  swift_release(v17);
  sub_100144FA0(a3);
  swift_unknownObjectRelease(a3);

  swift_bridgeObjectRelease(v11);
}

- (void)groupSession:(id)a3 didInvalidateWithError:(id)a4
{
  uint64_t v7 = sub_1000DFE10(&qword_1002BB500);
  __chkstk_darwin(v7, v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56LL))(v10, 1LL, 1LL, v11);
  type metadata accessor for MainActor(0LL);
  uint64_t v12 = self;
  swift_unknownObjectRetain(a3);
  id v13 = a4;
  uint64_t v14 = static MainActor.shared.getter(v13);
  uint64_t v15 = (void *)swift_allocObject(&unk_1002742D8, 40LL, 7LL);
  v15[2] = v14;
  v15[3] = &protocol witness table for MainActor;
  v15[4] = v12;
  uint64_t v16 = sub_100125950((uint64_t)v10, (uint64_t)&unk_1002BB510, (uint64_t)v15);
  swift_unknownObjectRelease(a3);

  swift_release(v16);
}

@end