@interface SearchResultsViewController
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation SearchResultsViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10008EC88();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_10008F2C0();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_10008F4EC(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_10008F610(a3);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10008F710((uint64_t)a3);
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

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  uint64_t v7 = type metadata accessor for IndexPath(0LL);
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  id v9 = a3;
  v10 = self;
  sub_100090E50(v8);

  swift_bridgeObjectRelease(v8);
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC6Arcade27SearchResultsViewController_presenter));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC6Arcade27SearchResultsViewController_appStateController));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC6Arcade27SearchResultsViewController_artworkLoader));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC6Arcade27SearchResultsViewController_artworkIconFetcher));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade27SearchResultsViewController_searchResultsCollectionViewDataSource));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade27SearchResultsViewController_noResultsView));
}

@end