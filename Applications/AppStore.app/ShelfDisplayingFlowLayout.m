@interface ShelfDisplayingFlowLayout
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (_TtC8AppStore25ShelfDisplayingFlowLayout)init;
- (_TtC8AppStore25ShelfDisplayingFlowLayout)initWithCoder:(id)a3;
- (id)invalidationContextForBoundsChange:(CGRect)a3;
- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (void)prepareLayout;
@end

@implementation ShelfDisplayingFlowLayout

- (_TtC8AppStore25ShelfDisplayingFlowLayout)init
{
  return (_TtC8AppStore25ShelfDisplayingFlowLayout *)sub_1000392A8();
}

- (_TtC8AppStore25ShelfDisplayingFlowLayout)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8AppStore25ShelfDisplayingFlowLayout_multiColumnMinYBySection;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)sub_1000EE938((uint64_t)_swiftEmptyArrayStorage);
  uint64_t v6 = OBJC_IVAR____TtC8AppStore25ShelfDisplayingFlowLayout_multiColumnOrigins;
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v6) = (Class)sub_1000EC4B0((uint64_t)_swiftEmptyArrayStorage);

  result = (_TtC8AppStore25ShelfDisplayingFlowLayout *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100247230LL,  "AppStore/ShelfDisplayingFlowLayout.swift",  40LL,  2LL,  42LL,  0);
  __break(1u);
  return result;
}

- (void)prepareLayout
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ShelfDisplayingFlowLayout();
  id v2 = v3.receiver;
  -[ShelfDisplayingFlowLayout prepareLayout](&v3, "prepareLayout");
  sub_10003A33C();
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = self;
  id v8 = sub_1000394A8(x, y, width, height);

  if (v8)
  {
    sub_10000DFD4(0LL, (unint64_t *)&qword_1002E2B90, &OBJC_CLASS___UICollectionViewLayoutAttributes_ptr);
    v9.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v8);
  }

  else
  {
    v9.super.isa = 0LL;
  }

  return v9.super.isa;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v5 = type metadata accessor for IndexPath(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  id v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a3);
  NSArray v9 = self;
  id v10 = sub_10003995C();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v10;
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v7 = type metadata accessor for IndexPath(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v13 = v12;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  if (v11 == 0xD00000000000001FLL && v13 == 0x80000001002481E0LL
    || (_stringCompareWithSmolCheck(_:_:expecting:)(v11, v13, 0xD00000000000001FLL, 0x80000001002481E0LL, 0LL) & 1) != 0)
  {
    v14 = self;
    id v15 = sub_100039F38(v11, v13);

    __n128 v16 = swift_bridgeObjectRelease(v13);
  }

  else
  {
    v17 = self;
    NSString v18 = String._bridgeToObjectiveC()();
    v19 = (void *)IndexPath._bridgeToObjectiveC()();
    v20 = (objc_class *)type metadata accessor for ShelfDisplayingFlowLayout();
    v22.receiver = v17;
    v22.super_class = v20;
    id v15 =  -[ShelfDisplayingFlowLayout layoutAttributesForDecorationViewOfKind:atIndexPath:]( &v22,  "layoutAttributesForDecorationViewOfKind:atIndexPath:",  v18,  v19);

    swift_bridgeObjectRelease(v13);
  }

  (*(void (**)(char *, uint64_t, __n128))(v8 + 8))(v10, v7, v16);
  return v15;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v7 = self;
  id v8 = -[ShelfDisplayingFlowLayout collectionView](v7, "collectionView");
  if (v8)
  {
    uint64_t v9 = v8;
    [v8 bounds];
    double v11 = v10;
    double v13 = v12;

    if (v11 != width) {
      goto LABEL_7;
    }
  }

  else
  {
    double v13 = 0.0;
    if (width != 0.0)
    {
LABEL_7:

      return 1;
    }
  }

  if (v13 != height) {
    goto LABEL_7;
  }
  v16.receiver = v7;
  v16.super_class = (Class)type metadata accessor for ShelfDisplayingFlowLayout();
  BOOL v14 = -[ShelfDisplayingFlowLayout shouldInvalidateLayoutForBoundsChange:]( &v16,  "shouldInvalidateLayoutForBoundsChange:",  x,  y,  width,  height);

  return v14;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v7 = self;
  id v8 = sub_100039DB4(x, y, width, height);

  return v8;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore25ShelfDisplayingFlowLayout_multiColumnMinYBySection));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore25ShelfDisplayingFlowLayout_multiColumnOrigins));
}

@end