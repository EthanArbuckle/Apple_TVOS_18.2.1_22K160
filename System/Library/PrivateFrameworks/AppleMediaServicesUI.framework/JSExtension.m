@interface JSExtension
- (_TtC14amsengagementd11JSExtension)init;
- (id)request:(id)a3 :(id)a4 :(id)a5;
- (id)requestSync:(id)a3 :(id)a4 :(id)a5;
- (void)requestAsyncEvent:(id)a3 :(id)a4 :(id)a5;
@end

@implementation JSExtension

- (id)request:(id)a3 :(id)a4 :(id)a5
{
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v10 = v9;
  swift_unknownObjectRetain(a4);
  id v11 = a5;
  v12 = self;
  _bridgeAnyObjectToAny(_:)(a4);
  swift_unknownObjectRelease(a4);
  uint64_t v13 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v11,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);

  v14 = (void *)sub_100090194(v8, v10, (uint64_t)v16, v13);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000D3A0(v16);
  return v14;
}

- (id)requestSync:(id)a3 :(id)a4 :(id)a5
{
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v10 = v9;
  swift_unknownObjectRetain(a4);
  id v11 = a5;
  v12 = self;
  _bridgeAnyObjectToAny(_:)(a4);
  swift_unknownObjectRelease(a4);
  uint64_t v13 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v11,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);

  uint64_t v14 = sub_100090B68(v8, v10, (uint64_t)v17, v13);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000D3A0(v17);
  if (!v14) {
    return 0LL;
  }
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (void)requestAsyncEvent:(id)a3 :(id)a4 :(id)a5
{
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v10 = v9;
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v13 = v12;
  swift_unknownObjectRetain(a5);
  uint64_t v14 = self;
  _bridgeAnyObjectToAny(_:)(a5);
  swift_unknownObjectRelease(a5);
  sub_100091084(v8, v10, v11, v13, (uint64_t)v15);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000D3A0(v15);
}

- (_TtC14amsengagementd11JSExtension)init
{
}

- (void).cxx_destruct
{
  v2 = *(void **)&self->config[OBJC_IVAR____TtC14amsengagementd11JSExtension_config];
  swift_bridgeObjectRelease();

  sub_100009070();
  swift_release();
}

@end