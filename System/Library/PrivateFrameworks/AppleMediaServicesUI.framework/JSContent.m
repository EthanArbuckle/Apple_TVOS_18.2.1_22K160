@interface JSContent
- (_TtC14amsengagementd9JSContent)init;
- (id)batchInfo:(id)a3;
- (id)info:(id)a3 :(id)a4;
- (id)metadataInfo:(id)a3;
- (id)readJSON:(id)a3 :(id)a4;
- (void)batchRemove:(id)a3;
- (void)download:(id)a3 :(id)a4 :(id)a5 :(id)a6;
- (void)extend:(id)a3 :(id)a4;
- (void)remove:(id)a3;
- (void)saveFilePath:(id)a3 :(id)a4 :(id)a5;
@end

@implementation JSContent

- (id)batchInfo:(id)a3
{
  v4 = self;
  sub_100087A4C();
  uint64_t v6 = v5;

  swift_bridgeObjectRelease();
  if (v6)
  {
    v7.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }

  else
  {
    v7.super.isa = 0LL;
  }

  return v7.super.isa;
}

- (void)batchRemove:(id)a3
{
}

- (void)download:(id)a3 :(id)a4 :(id)a5 :(id)a6
{
  v9 = self;
  sub_100087BEC();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)extend:(id)a3 :(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v8 = v7;
  if (a4)
  {
    uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v10;
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  v11 = self;
  sub_1000881D8(v6, v8, v9, (uint64_t)a4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (id)info:(id)a3 :(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v8 = v7;
  uint64_t v9 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a4,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  v10 = self;
  uint64_t v11 = sub_100088810(v6, v8, v9);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v11)
  {
    v12.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }

  else
  {
    v12.super.isa = 0LL;
  }

  return v12.super.isa;
}

- (id)metadataInfo:(id)a3
{
  v4 = self;
  sub_10008909C();
  uint64_t v6 = v5;

  swift_bridgeObjectRelease();
  if (v6)
  {
    v7.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }

  else
  {
    v7.super.isa = 0LL;
  }

  return v7.super.isa;
}

- (id)readJSON:(id)a3 :(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v8 = v7;
  uint64_t v9 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a4,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  v10 = self;
  sub_100089190( v6,  v8,  v9,  v11,  v12,  v13,  v14,  v15,  v23[0],  v23[1],  v23[2],  v24,  v25,  v26,  v27,  v28,  v29,  v30,  vars0,  vars8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v16 = v24;
  if (!v24) {
    return 0LL;
  }
  v17 = sub_10000D37C(v23, v24);
  uint64_t v18 = *(void *)(v16 - 8);
  __chkstk_darwin(v17);
  v20 = (char *)v23 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *))(v18 + 16))(v20);
  v21 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v20, v16);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v16);
  sub_10000D3A0(v23);
  return v21;
}

- (void)remove:(id)a3
{
}

- (void)saveFilePath:(id)a3 :(id)a4 :(id)a5
{
  uint64_t v8 = self;
  sub_10008A5F0();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC14amsengagementd9JSContent)init
{
}

- (void).cxx_destruct
{
  v2 = *(void **)&self->config[OBJC_IVAR____TtC14amsengagementd9JSContent_config];
  uint64_t v3 = *(void *)&self->config[OBJC_IVAR____TtC14amsengagementd9JSContent_config + 24];
  swift_bridgeObjectRelease(*(void *)&self->config[OBJC_IVAR____TtC14amsengagementd9JSContent_config + 40]);

  swift_bridgeObjectRelease(v3);
}

@end