@interface CollectionViewTableFlowLayout
- (BOOL)sectionFootersPinToVisibleBounds;
- (BOOL)sectionHeadersPinToVisibleBounds;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGSize)collectionViewContentSize;
- (_TtC8AppStore29CollectionViewTableFlowLayout)init;
- (id)finalLayoutAttributesForDisappearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4;
- (id)initialLayoutAttributesForAppearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4;
- (id)invalidationContextForBoundsChange:(CGRect)a3;
- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (void)invalidateLayoutWithContext:(id)a3;
- (void)prepareLayout;
- (void)setSectionFootersPinToVisibleBounds:(BOOL)a3;
- (void)setSectionHeadersPinToVisibleBounds:(BOOL)a3;
@end

@implementation CollectionViewTableFlowLayout

- (_TtC8AppStore29CollectionViewTableFlowLayout)init
{
  return (_TtC8AppStore29CollectionViewTableFlowLayout *)sub_1001F87B0();
}

- (BOOL)sectionHeadersPinToVisibleBounds
{
  return 0;
}

- (void)setSectionHeadersPinToVisibleBounds:(BOOL)a3
{
  v3 = self;
  sub_1001FA22C((void *)0x8000000100252500LL);
}

- (BOOL)sectionFootersPinToVisibleBounds
{
  return 0;
}

- (void)setSectionFootersPinToVisibleBounds:(BOOL)a3
{
  v3 = self;
  sub_1001FA22C((void *)0x80000001002524C0LL);
}

- (void)prepareLayout
{
  v2 = self;
  sub_1001F8A70();
}

- (CGSize)collectionViewContentSize
{
  v2 = self;
  double v3 = sub_1001F8C8C();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v5 = type metadata accessor for IndexPath(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  v10 = sub_1001F8D94();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v10;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  return sub_1001F93C0( self,  (uint64_t)a2,  (uint64_t)a3,  (uint64_t)a4,  (uint64_t (*)(uint64_t, uint64_t, char *))sub_1001F8FAC);
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  return sub_1001F93C0( self,  (uint64_t)a2,  (uint64_t)a3,  (uint64_t)a4,  (uint64_t (*)(uint64_t, uint64_t, char *))sub_1001F9230);
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v7 = self;
  uint64_t v8 = sub_1001F9494(x, y, width, height);

  if (v8)
  {
    sub_1000BFF50();
    v9.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v8);
  }

  else
  {
    v9.super.isa = 0LL;
  }

  return v9.super.isa;
}

- (id)finalLayoutAttributesForDisappearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4
{
  return sub_1001F9880( self,  (uint64_t)a2,  (uint64_t)a3,  (uint64_t)a4,  (SEL *)&selRef_finalLayoutAttributesForDisappearingSupplementaryElementOfKind_atIndexPath_);
}

- (id)initialLayoutAttributesForAppearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4
{
  return sub_1001F9880( self,  (uint64_t)a2,  (uint64_t)a3,  (uint64_t)a4,  (SEL *)&selRef_initialLayoutAttributesForAppearingSupplementaryElementOfKind_atIndexPath_);
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v7 = self;
  char v8 = sub_1001F99B0(x, y, width, height);

  return v8 & 1;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v7 = self;
  char v8 = sub_1001F9B44(x, y, width, height);

  return v8;
}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1001F9DD0(v4);
}

- (void).cxx_destruct
{
}

@end