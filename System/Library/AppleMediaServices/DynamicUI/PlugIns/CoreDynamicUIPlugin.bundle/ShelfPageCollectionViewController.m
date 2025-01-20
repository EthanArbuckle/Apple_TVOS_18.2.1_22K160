@interface ShelfPageCollectionViewController
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (_TtC19CoreDynamicUIPlugin33ShelfPageCollectionViewController)init;
- (_TtC19CoreDynamicUIPlugin33ShelfPageCollectionViewController)initWithCoder:(id)a3;
- (_TtC19CoreDynamicUIPlugin33ShelfPageCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)collectionView:(id)a3 didEndDisplayingItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)collectionViewDidScroll:(id)a3;
- (void)loadView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation ShelfPageCollectionViewController

- (_TtC19CoreDynamicUIPlugin33ShelfPageCollectionViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_3E04C();
}

- (void)loadView
{
  v2 = self;
  sub_3E3AC();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_3E45C();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_3E4C0();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_3E5A0(a3, (SEL *)&selRef_viewDidAppear_, 1LL);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_3E5A0(a3, (SEL *)&selRef_viewDidDisappear_, 0LL);
}

- (_TtC19CoreDynamicUIPlugin33ShelfPageCollectionViewController)init
{
}

- (_TtC19CoreDynamicUIPlugin33ShelfPageCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
  }
  id v5 = a4;
  sub_3F1F4();
}

- (void).cxx_destruct
{
}

- (void)collectionViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_400A8(v4);
}

- (void)collectionView:(id)a3 didEndDisplayingItemAtIndexPath:(id)a4
{
  uint64_t v7 = type metadata accessor for IndexPath(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __n128 v9 = __chkstk_darwin(v7);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4, v9);
  id v12 = a3;
  v13 = self;
  sub_4022C((uint64_t)v12, (uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7 = type metadata accessor for IndexPath(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __n128 v9 = __chkstk_darwin(v7);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4, v9);
  id v12 = a3;
  v13 = self;
  sub_408A0();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  uint64_t v7 = type metadata accessor for IndexPath(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __n128 v9 = __chkstk_darwin(v7);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4, v9);
  id v12 = a3;
  v13 = self;
  LOBYTE(self) = sub_415E0();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  return self & 1;
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_41ADC();
}

@end