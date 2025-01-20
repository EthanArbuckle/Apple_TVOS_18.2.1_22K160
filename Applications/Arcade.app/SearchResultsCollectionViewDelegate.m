@interface SearchResultsCollectionViewDelegate
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (_TtC6Arcade35SearchResultsCollectionViewDelegate)init;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDecelerating:(id)a3;
@end

@implementation SearchResultsCollectionViewDelegate

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
  dispatch thunk of SearchResultsPresenter.didSelectResult(at:)(v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)scrollViewWillBeginDecelerating:(id)a3
{
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
}

- (void)scrollViewDidScroll:(id)a3
{
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  double v10 = sub_10006EBF4();
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.right = v20;
  result.bottom = v19;
  result.left = v18;
  result.top = v17;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v9 = type metadata accessor for IndexPath(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  double v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  id v13 = a3;
  id v14 = a4;
  double v15 = self;
  double v16 = sub_10006EF20(v14, (uint64_t)v12);
  double v18 = v17;

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  double v19 = v16;
  double v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (_TtC6Arcade35SearchResultsCollectionViewDelegate)init
{
  CGSize result = (_TtC6Arcade35SearchResultsCollectionViewDelegate *)_swift_stdlib_reportUnimplementedInitializer( "Arcade.SearchResultsCollectionViewDelegate",  42LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC6Arcade35SearchResultsCollectionViewDelegate_presenter));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC6Arcade35SearchResultsCollectionViewDelegate_objectGraph));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC6Arcade35SearchResultsCollectionViewDelegate_appStateController));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC6Arcade35SearchResultsCollectionViewDelegate_artworkLoader));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC6Arcade35SearchResultsCollectionViewDelegate_artworkIconFetcher));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC6Arcade35SearchResultsCollectionViewDelegate_infiniteScrollObserver));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC6Arcade35SearchResultsCollectionViewDelegate_impressionsCalculator));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC6Arcade35SearchResultsCollectionViewDelegate_pageTraits));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC6Arcade35SearchResultsCollectionViewDelegate_compoundScrollObserver));
}

@end