@interface SearchResultCollectionViewCell
- (_TtC6Arcade30SearchResultCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation SearchResultCollectionViewCell

- (_TtC6Arcade30SearchResultCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade30SearchResultCollectionViewCell *)sub_100219414( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100219CA4();
}

- (void)prepareForReuse
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SearchResultCollectionViewCell(0LL);
  v2 = (char *)v8.receiver;
  -[BaseCollectionViewCell prepareForReuse](&v8, "prepareForReuse");
  v3 = *(void **)&v2[OBJC_IVAR____TtC6Arcade30SearchResultCollectionViewCell_resultContents];
  if (v3)
  {
    uint64_t v4 = *(void *)&v2[OBJC_IVAR____TtC6Arcade30SearchResultCollectionViewCell_resultContents + 8];
    uint64_t ObjectType = swift_getObjectType(*(void *)&v2[OBJC_IVAR____TtC6Arcade30SearchResultCollectionViewCell_resultContents]);
    v6 = *(void (**)(uint64_t, uint64_t))(v4 + 48);
    v7 = v3;
    v6(ObjectType, v4);

    v2 = v7;
  }
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v7 = sub_100006028(0LL, (unint64_t *)&qword_1002DD600, &OBJC_CLASS___UIPress_ptr);
  unint64_t v8 = sub_10006B6B4();
  uint64_t v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  id v10 = a4;
  v11 = self;
  sub_10021A1B0(v9, (uint64_t)a4);

  swift_bridgeObjectRelease(v9);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade30SearchResultCollectionViewCell_resultContents));
}

@end