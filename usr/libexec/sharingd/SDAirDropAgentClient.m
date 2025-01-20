@interface SDAirDropAgentClient
- (NSDate)startTime;
- (NSString)bundleID;
- (NSUUID)id;
- (OS_nw_agent_client)client;
- (_TtC16DaemoniOSLibrary20SDAirDropAgentClient)init;
- (_TtC16DaemoniOSLibrary20SDAirDropAgentClient)initWithClient:(id)a3 browseDescriptor:(id)a4 browseResponse:(id)a5;
- (id)browseResponse;
- (int)pid;
@end

@implementation SDAirDropAgentClient

- (OS_nw_agent_client)client
{
  return (OS_nw_agent_client *)objc_autoreleaseReturnValue((id)swift_unknownObjectRetain(*(Class *)((char *)&self->super.isa
                                                                                                  + OBJC_IVAR____TtC16DaemoniOSLibrary20SDAirDropAgentClient_client)));
}

- (NSUUID)id
{
  return (NSUUID *)UUID._bridgeToObjectiveC()().super.isa;
}

- (NSString)bundleID
{
  uint64_t v2 = *(void *)&self->client[OBJC_IVAR____TtC16DaemoniOSLibrary20SDAirDropAgentClient_bundleID];
  swift_bridgeObjectRetain(v2);
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (int)pid
{
  return *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary20SDAirDropAgentClient_pid);
}

- (NSDate)startTime
{
  return (NSDate *)Date._bridgeToObjectiveC()().super.isa;
}

- (id)browseResponse
{
  uint64_t v2 = *(void *)&self->client[OBJC_IVAR____TtC16DaemoniOSLibrary20SDAirDropAgentClient_browseResponse];
  v6[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary20SDAirDropAgentClient_browseResponse);
  uint64_t v7 = v2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 1107296256LL;
  v6[2] = sub_10036FCE0;
  v6[3] = &unk_1005E2300;
  NSString v3 = _Block_copy(v6);
  uint64_t v4 = v7;
  swift_retain();
  swift_release(v4);
  return v3;
}

- (_TtC16DaemoniOSLibrary20SDAirDropAgentClient)init
{
  result = (_TtC16DaemoniOSLibrary20SDAirDropAgentClient *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0LL,  0xE000000000000000LL,  "DaemoniOSLibrary/SDAirDropAgentClient.swift",  43LL,  2LL,  40LL,  0);
  __break(1u);
  return result;
}

- (_TtC16DaemoniOSLibrary20SDAirDropAgentClient)initWithClient:(id)a3 browseDescriptor:(id)a4 browseResponse:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  uint64_t v8 = swift_allocObject(&unk_1005E22E8, 24LL, 7LL);
  *(void *)(v8 + 16) = v7;
  swift_unknownObjectRetain(a3);
  swift_unknownObjectRetain(a4);
  v9 = (_TtC16DaemoniOSLibrary20SDAirDropAgentClient *)sub_10044BA70( (uint64_t)a3,  (uint64_t)a4,  (uint64_t)sub_100419DD8,  v8);
  swift_unknownObjectRelease(a3);
  swift_unknownObjectRelease(a4);
  swift_release(v8);
  return v9;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC16DaemoniOSLibrary20SDAirDropAgentClient_client));
  NSString v3 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary20SDAirDropAgentClient_id;
  uint64_t v4 = type metadata accessor for UUID(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  swift_bridgeObjectRelease(*(void *)&self->client[OBJC_IVAR____TtC16DaemoniOSLibrary20SDAirDropAgentClient_bundleID]);
  v5 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary20SDAirDropAgentClient_startTime;
  uint64_t v6 = type metadata accessor for Date(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8LL))(v5, v6);
  swift_release(*(void *)&self->client[OBJC_IVAR____TtC16DaemoniOSLibrary20SDAirDropAgentClient_browseResponse]);
}

@end