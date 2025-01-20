@interface LineScore
- (BOOL)isEqual:(id)a3;
- (_TtC6SiriTV9LineScore)init;
- (int64_t)hash;
@end

@implementation LineScore

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v9);
    swift_unknownObjectRelease(a3);
  }

  else
  {
    memset(v9, 0, sizeof(v9));
    v6 = self;
  }

  char v7 = sub_412BC((uint64_t)v9);

  sub_A068((uint64_t)v9, (uint64_t *)&unk_E4F30);
  return v7 & 1;
}

- (int64_t)hash
{
  v2 = self;
  Swift::Int v3 = sub_41468();

  return v3;
}

- (_TtC6SiriTV9LineScore)init
{
}

- (void).cxx_destruct
{
}

@end