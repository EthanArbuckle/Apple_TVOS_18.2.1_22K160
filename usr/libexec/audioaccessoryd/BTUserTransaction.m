@interface BTUserTransaction
- (NSString)description;
- (_TtC15audioaccessoryd17BTUserTransaction)init;
- (void)dealloc;
@end

@implementation BTUserTransaction

- (void)dealloc
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC15audioaccessoryd17BTUserTransaction_underlyingTransaction));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC15audioaccessoryd17BTUserTransaction_underlyingActivity));
}

- (_TtC15audioaccessoryd17BTUserTransaction)init
{
  result = (_TtC15audioaccessoryd17BTUserTransaction *)_swift_stdlib_reportUnimplementedInitializer( "audioaccessoryd.BTUserTransaction",  33LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (NSString)description
{
  v13[2] = 0x3A4E58545BLL;
  unint64_t v14 = 0xE500000000000000LL;
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd17BTUserTransaction_name);
  uint64_t v3 = *(void *)&self->name[OBJC_IVAR____TtC15audioaccessoryd17BTUserTransaction_name];
  v13[0] = v4;
  v13[1] = v3;
  swift_bridgeObjectRetain(v3);
  v5 = self;
  uint64_t v6 = sub_100098CD8(&qword_100236640);
  v7._countAndFlagsBits = String.init<A>(describing:)(v13, v6);
  object = v7._object;
  String.append(_:)(v7);
  swift_bridgeObjectRelease(object);
  v9._countAndFlagsBits = 93LL;
  v9._object = (void *)0xE100000000000000LL;
  String.append(_:)(v9);

  unint64_t v10 = v14;
  NSString v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v10);
  return (NSString *)v11;
}

@end