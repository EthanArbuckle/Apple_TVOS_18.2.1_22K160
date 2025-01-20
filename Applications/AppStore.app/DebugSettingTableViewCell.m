@interface DebugSettingTableViewCell
- (_TtC8AppStore25DebugSettingTableViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore25DebugSettingTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)prepareForReuse;
@end

@implementation DebugSettingTableViewCell

- (_TtC8AppStore25DebugSettingTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType(self);
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    uint64_t v8 = v7;
    a4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v8);
  }

  v11.receiver = self;
  v11.super_class = ObjectType;
  v9 = -[DebugSettingTableViewCell initWithStyle:reuseIdentifier:](&v11, "initWithStyle:reuseIdentifier:", 1LL, a4);

  return v9;
}

- (_TtC8AppStore25DebugSettingTableViewCell)initWithCoder:(id)a3
{
  result = (_TtC8AppStore25DebugSettingTableViewCell *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100247230LL,  "AppStore/DebugSettingTableViewCell.swift",  40LL,  2LL,  27LL,  0);
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1000AE3C8();
}

@end