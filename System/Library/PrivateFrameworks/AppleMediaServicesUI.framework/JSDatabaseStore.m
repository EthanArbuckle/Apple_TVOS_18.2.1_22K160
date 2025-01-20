@interface JSDatabaseStore
- (_TtC14amsengagementd15JSDatabaseStore)init;
- (id)create:(id)a3;
- (id)scheduleDatabase;
- (id)ubiquitousDatabase;
@end

@implementation JSDatabaseStore

- (id)create:(id)a3
{
  uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for String,  &type metadata for String,  &protocol witness table for String);
  v5 = self;
  sub_10008E558(v4);

  swift_bridgeObjectRelease();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (id)scheduleDatabase
{
  return sub_10008EF24(self, (uint64_t)a2, (uint64_t (*)(void))sub_10008E9A8);
}

- (id)ubiquitousDatabase
{
  return sub_10008EF24(self, (uint64_t)a2, sub_10008ED74);
}

- (_TtC14amsengagementd15JSDatabaseStore)init
{
}

- (void).cxx_destruct
{
  v2 = *(void **)&self->config[OBJC_IVAR____TtC14amsengagementd15JSDatabaseStore_config];
  uint64_t v3 = *(void *)&self->config[OBJC_IVAR____TtC14amsengagementd15JSDatabaseStore_config + 24];
  swift_bridgeObjectRelease(*(void *)&self->config[OBJC_IVAR____TtC14amsengagementd15JSDatabaseStore_config + 40]);

  swift_bridgeObjectRelease(v3);
}

@end