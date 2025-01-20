@interface SYDKeyID
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)key;
- (NSString)storeIdentifier;
- (_TtC13syncdefaultsd8SYDKeyID)init;
- (_TtC13syncdefaultsd8SYDKeyID)initWithKey:(id)a3 storeIdentifier:(id)a4;
- (int64_t)hash;
@end

@implementation SYDKeyID

- (NSString)key
{
  return (NSString *)sub_10002A804((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC13syncdefaultsd8SYDKeyID_key);
}

- (NSString)storeIdentifier
{
  return (NSString *)sub_10002A804( (uint64_t)self,  (uint64_t)a2,  &OBJC_IVAR____TtC13syncdefaultsd8SYDKeyID_storeIdentifier);
}

- (_TtC13syncdefaultsd8SYDKeyID)initWithKey:(id)a3 storeIdentifier:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
  uint64_t v8 = v7;
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v10 = (uint64_t *)((char *)self + OBJC_IVAR____TtC13syncdefaultsd8SYDKeyID_key);
  uint64_t *v10 = v6;
  v10[1] = v8;
  v11 = (uint64_t *)((char *)self + OBJC_IVAR____TtC13syncdefaultsd8SYDKeyID_storeIdentifier);
  uint64_t *v11 = v9;
  v11[1] = v12;
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for SYDKeyID();
  return -[SYDKeyID init](&v14, "init");
}

- (NSString)description
{
  v2 = self;
  SYDKeyID.description.getter();
  uint64_t v4 = v3;

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (int64_t)hash
{
  unint64_t v3 = sub_10002AC6C();
  uint64_t v4 = self;
  uint64_t v5 = StringProtocol.hash.getter(&type metadata for String, v3);
  uint64_t v6 = StringProtocol.hash.getter(&type metadata for String, v3);

  return v6 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v5 = self;
    uint64_t v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v10, v6);
    swift_unknownObjectRelease(a3);
  }

  else
  {
    memset(v10, 0, sizeof(v10));
    uint64_t v7 = self;
  }

  char v8 = SYDKeyID.isEqual(_:)((uint64_t)v10);

  sub_10002AE28((uint64_t)v10);
  return v8 & 1;
}

- (_TtC13syncdefaultsd8SYDKeyID)init
{
  result = (_TtC13syncdefaultsd8SYDKeyID *)_swift_stdlib_reportUnimplementedInitializer( "syncdefaultsd.SYDKeyID",  22LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end