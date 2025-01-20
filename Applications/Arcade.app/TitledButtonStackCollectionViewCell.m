@interface TitledButtonStackCollectionViewCell
- (BOOL)canBecomeFocused;
- (NSArray)preferredFocusEnvironments;
- (_TtC6Arcade35TitledButtonStackCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation TitledButtonStackCollectionViewCell

- (BOOL)canBecomeFocused
{
  v2 = self;
  v3 = -[TitledButtonStackCollectionViewCell preferredFocusEnvironments](v2, "preferredFocusEnvironments");
  uint64_t v4 = sub_1000031E8((uint64_t *)&unk_1002DF9C0);
  uint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v3, v4);

  if ((unint64_t)v5 >> 62)
  {
    if (v5 < 0) {
      uint64_t v8 = v5;
    }
    else {
      uint64_t v8 = v5 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v5);
    uint64_t v6 = _CocoaArrayWrapper.endIndex.getter(v8);

    swift_bridgeObjectRelease(v5);
  }

  else
  {
    uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  }

  swift_bridgeObjectRelease(v5);
  return v6 > 0;
}

- (NSArray)preferredFocusEnvironments
{
  v2 = self;
  v3 = sub_1000A9C20();

  sub_1000031E8((uint64_t *)&unk_1002DF9C0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000AA504();
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TitledButtonStackCollectionViewCell(0LL);
  id v2 = v3.receiver;
  -[BaseCollectionViewCell prepareForReuse](&v3, "prepareForReuse");
  sub_1000A9E18();
}

- (_TtC6Arcade35TitledButtonStackCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = sub_1000031E8((uint64_t *)&unk_1002E5A00);
  __chkstk_darwin(v8);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v11 = (char *)self + OBJC_IVAR____TtC6Arcade35TitledButtonStackCollectionViewCell_itemLayoutContext;
  uint64_t v12 = type metadata accessor for ItemLayoutContext(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v11, 1LL, 1LL, v12);
  v13 = (char *)self + OBJC_IVAR____TtC6Arcade35TitledButtonStackCollectionViewCell_lineBreaks;
  uint64_t v14 = sub_1000031E8(&qword_1002E27A8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56LL))(v13, 1LL, 1LL, v14);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC6Arcade35TitledButtonStackCollectionViewCell_buttons) = (Class)_swiftEmptyArrayStorage;
  uint64_t v15 = type metadata accessor for DynamicTypeButton(0LL);
  v16 = self;
  ViewRecycler.init()(v15);
  unint64_t v17 = sub_1000AAC94();
  ReusePool.init(recycler:limit:)(v10, 4LL, v8, v17);

  v18 = (objc_class *)type metadata accessor for TitledButtonStackCollectionViewCell(0LL);
  v20.receiver = v16;
  v20.super_class = v18;
  return -[BaseCollectionViewCell initWithFrame:](&v20, "initWithFrame:", x, y, width, height);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC6Arcade35TitledButtonStackCollectionViewCell_buttons));
  objc_super v3 = (char *)self + OBJC_IVAR____TtC6Arcade35TitledButtonStackCollectionViewCell_reusePool;
  uint64_t v4 = sub_1000031E8(&qword_1002E27F0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
}

@end