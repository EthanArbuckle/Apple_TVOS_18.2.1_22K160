@interface DebugActionTableViewCell
- (_TtC8AppStore24DebugActionTableViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore24DebugActionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)prepareForReuse;
@end

@implementation DebugActionTableViewCell

- (_TtC8AppStore24DebugActionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType(self);
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    uint64_t v9 = v8;
    a4 = String._bridgeToObjectiveC()();
    *(void *)&double v7 = swift_bridgeObjectRelease(v9).n128_u64[0];
  }

  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = -[DebugActionTableViewCell initWithStyle:reuseIdentifier:](&v12, "initWithStyle:reuseIdentifier:", 3LL, a4, v7);

  return v10;
}

- (_TtC8AppStore24DebugActionTableViewCell)initWithCoder:(id)a3
{
  result = (_TtC8AppStore24DebugActionTableViewCell *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100247230LL,  "AppStore/DebugActionTableViewCell.swift",  39LL,  2LL,  27LL,  0);
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1000AE3C8();
}

@end