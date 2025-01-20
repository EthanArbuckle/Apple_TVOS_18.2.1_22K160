@interface JSMediaAPI
- (_TtC14amsengagementd10JSMediaAPI)init;
- (id)lookup:(id)a3;
@end

@implementation JSMediaAPI

- (id)lookup:(id)a3
{
  uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  v5 = self;
  v6 = (void *)sub_10009E094(v4);

  swift_bridgeObjectRelease();
  return v6;
}

- (_TtC14amsengagementd10JSMediaAPI)init
{
}

- (void).cxx_destruct
{
  v3 = *(void **)&self->config[OBJC_IVAR____TtC14amsengagementd10JSMediaAPI_config];
  uint64_t v4 = *(void *)&self->config[OBJC_IVAR____TtC14amsengagementd10JSMediaAPI_config + 24];
  swift_bridgeObjectRelease(*(void *)&self->config[OBJC_IVAR____TtC14amsengagementd10JSMediaAPI_config + 40]);

  swift_bridgeObjectRelease(v4);
}

@end