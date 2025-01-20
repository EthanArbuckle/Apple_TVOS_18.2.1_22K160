@interface ProductMediaCollectionView.DataSource
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (_TtCC6Arcade26ProductMediaCollectionViewP33_ABD4D9B5E11AA1EEFB4E3F7AB5D7A38C10DataSource)init;
- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5;
- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)scrollViewDidScroll:(id)a3;
@end

@implementation ProductMediaCollectionView.DataSource

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return (int64_t)(*(Class *)((char *)&self->super.isa
                                   + OBJC_IVAR____TtCC6Arcade26ProductMediaCollectionViewP33_ABD4D9B5E11AA1EEFB4E3F7AB5D7A38C10DataSource_displayedMedia))[2].isa;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7 = type metadata accessor for IndexPath(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  id v11 = a3;
  v12 = self;
  v13 = (void *)sub_10020FEA4(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7 = type metadata accessor for IndexPath(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  id v11 = a3;
  v12 = self;
  sub_1002103EC(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v9 = type metadata accessor for IndexPath(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  id v13 = a3;
  id v14 = a4;
  uint64_t v15 = self;
  sub_1002112AC();
  double v17 = v16;
  double v19 = v18;

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  double v20 = v17;
  double v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  return 40.0;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  return 40.0;
}

- (void)scrollViewDidScroll:(id)a3
{
}

- (_TtCC6Arcade26ProductMediaCollectionViewP33_ABD4D9B5E11AA1EEFB4E3F7AB5D7A38C10DataSource)init
{
  UIEdgeInsets result = (_TtCC6Arcade26ProductMediaCollectionViewP33_ABD4D9B5E11AA1EEFB4E3F7AB5D7A38C10DataSource *)_swift_stdlib_reportUnimplementedInitializer("Arcade.DataSource", 17LL, "init()", 6LL, 0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtCC6Arcade26ProductMediaCollectionViewP33_ABD4D9B5E11AA1EEFB4E3F7AB5D7A38C10DataSource_displayedMedia));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtCC6Arcade26ProductMediaCollectionViewP33_ABD4D9B5E11AA1EEFB4E3F7AB5D7A38C10DataSource_pageTraits));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtCC6Arcade26ProductMediaCollectionViewP33_ABD4D9B5E11AA1EEFB4E3F7AB5D7A38C10DataSource_objectGraph));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtCC6Arcade26ProductMediaCollectionViewP33_ABD4D9B5E11AA1EEFB4E3F7AB5D7A38C10DataSource_artworkLoader));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC6Arcade26ProductMediaCollectionViewP33_ABD4D9B5E11AA1EEFB4E3F7AB5D7A38C10DataSource_compoundScrollObserver));
  sub_10000D3D8( *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtCC6Arcade26ProductMediaCollectionViewP33_ABD4D9B5E11AA1EEFB4E3F7AB5D7A38C10DataSource_artworkSelectionHandler),  *(void *)&self->displayedMedia[OBJC_IVAR____TtCC6Arcade26ProductMediaCollectionViewP33_ABD4D9B5E11AA1EEFB4E3F7AB5D7A38C10DataSource_artworkSelectionHandler]);
}

@end