@interface BasicTableViewCell
- (_TtC8AppStore18BasicTableViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore18BasicTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation BasicTableViewCell

- (_TtC8AppStore18BasicTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    uint64_t v6 = v5;
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  return (_TtC8AppStore18BasicTableViewCell *)sub_10015CCA8(a3, (uint64_t)a4, v6);
}

- (_TtC8AppStore18BasicTableViewCell)initWithCoder:(id)a3
{
  result = (_TtC8AppStore18BasicTableViewCell *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100247230LL,  "AppStore/BasicTableViewCell.swift",  33LL,  2LL,  52LL,  0);
  __break(1u);
  return result;
}

@end