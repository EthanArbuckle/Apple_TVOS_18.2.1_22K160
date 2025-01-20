@interface BasicTableViewCell
- (_TtC6Arcade18BasicTableViewCell)initWithCoder:(id)a3;
- (_TtC6Arcade18BasicTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation BasicTableViewCell

- (_TtC6Arcade18BasicTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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

  return (_TtC6Arcade18BasicTableViewCell *)sub_100151234(a3, (uint64_t)a4, v6);
}

- (_TtC6Arcade18BasicTableViewCell)initWithCoder:(id)a3
{
  result = (_TtC6Arcade18BasicTableViewCell *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100243980LL,  "Arcade/BasicTableViewCell.swift",  31LL,  2LL,  52LL,  0);
  __break(1u);
  return result;
}

@end