@interface ProductViewController
- (BOOL)collectionView:(id)a3 layout:(id)a4 shouldLayoutManageMultiColumnAt:(int64_t)a5;
- (BOOL)collectionView:(id)a3 layout:(id)a4 shouldProvideBackgroundAtSection:(int64_t)a5;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForBackgroundAtSection:(int64_t)a5;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (double)collectionView:(id)a3 layout:(id)a4 multiColumnMarginAt:(int64_t)a5;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 layout:(id)a4 multiColumnCountAtSection:(int64_t)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6;
- (void)dealloc;
- (void)didAskToBuy:(id)a3;
- (void)didFailFocusMovement:(id)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation ProductViewController

- (void)dealloc
{
  v3 = (void *)objc_opt_self(&OBJC_CLASS___NSNotificationCenter);
  v4 = self;
  id v5 = [v3 defaultCenter];
  [v5 removeObserver:v4];

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for ProductViewController(0LL);
  -[ProductViewController dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC6Arcade21ProductViewController_shelfDataSource));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC6Arcade21ProductViewController_presenter));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC6Arcade21ProductViewController_artworkLoader));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC6Arcade21ProductViewController_appStateController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade21ProductViewController_compoundScrollObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC6Arcade21ProductViewController_actionRunner));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade21ProductViewController_effectView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade21ProductViewController_footerBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade21ProductViewController_iconImage));
  sub_100006060((uint64_t)self + OBJC_IVAR____TtC6Arcade21ProductViewController_iconStyle, (uint64_t *)&unk_1002DE5F0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade21ProductViewController_iconBackgroundColor));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC6Arcade21ProductViewController_iconRecipients));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC6Arcade21ProductViewController_impressionsScrollObserver));
  sub_100006060( (uint64_t)self + OBJC_IVAR____TtC6Arcade21ProductViewController_footerFirstIndexPath,  (uint64_t *)&unk_1002DF650);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade21ProductViewController_backgroundUberView));
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for ProductViewController(0LL);
  id v4 = v12.receiver;
  -[StoreCollectionViewController viewDidAppear:](&v12, "viewDidAppear:", v3);
  uint64_t v5 = type metadata accessor for MetricsActivity(0LL);
  uint64_t v7 = static MetricsActivity.current.getter(v5, v6);
  uint64_t v9 = dispatch thunk of BasePresenter.referrer.getter(v7, v8);
  uint64_t v11 = v10;
  dispatch thunk of MetricsActivity.changePageReferrerUrl(_:)(v9);

  swift_release(v7);
  swift_bridgeObjectRelease(v11);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ProductViewController(0LL);
  id v4 = v8.receiver;
  -[StoreCollectionViewController viewWillDisappear:](&v8, "viewWillDisappear:", v3);
  uint64_t v5 = type metadata accessor for MetricsActivity(0LL);
  uint64_t v7 = static MetricsActivity.current.getter(v5, v6);
  dispatch thunk of MetricsActivity.changePageReferrerUrl(_:)(0LL);

  swift_release(v7);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1001848A4();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_100184CFC(a3);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain(a4);
  objc_super v8 = self;
  sub_100184F38(a4, width, height);
  swift_unknownObjectRelease(a4);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1001851E8();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_10018535C(a3);
}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  uint64_t v7 = type metadata accessor for IndexPath(0LL);
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  id v9 = a3;
  uint64_t v10 = self;
  sub_100196ABC(v8);

  swift_bridgeObjectRelease(v8);
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  int64_t v6 = dispatch thunk of ProductPresenter.sectionCount.getter(v5);

  return v6;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  int64_t v8 = sub_1000F3ABC(a4);

  return v8;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v9 = type metadata accessor for IndexPath(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  objc_super v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v15 = v14;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  id v16 = a3;
  v17 = self;
  v18 = (void *)sub_1000CBFD4(v13, v15, (uint64_t)v12, v16);

  __n128 v19 = swift_bridgeObjectRelease(v15);
  (*(void (**)(char *, uint64_t, __n128))(v10 + 8))(v12, v9, v19);
  return v18;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7 = type metadata accessor for IndexPath(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  id v11 = a3;
  objc_super v12 = self;
  uint64_t v13 = (void *)sub_100187EDC(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  double v11 = sub_100192284(a5, v10, v8);
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  double v11 = sub_100196C5C(v8, a5);
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v9 = type metadata accessor for IndexPath(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  double v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  id v13 = a3;
  id v14 = a4;
  double v15 = self;
  sub_10018863C((uint64_t)v12, v13);
  double v17 = v16;
  double v19 = v18;

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  double v20 = v17;
  double v21 = v19;
  result.double height = v21;
  result.double width = v20;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5 = sub_10018B640(self, (uint64_t)a2, a3, a4, a5, sub_100196DF0);
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  uint64_t v11 = type metadata accessor for IndexPath(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  id v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  uint64_t v17 = v16;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a6);
  uint64_t v18 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                   + OBJC_IVAR____TtC6Arcade21ProductViewController_shelfDataSource);
  id v19 = a3;
  id v20 = a4;
  double v21 = self;
  IndexPath.section.getter(v21);
  sub_100193500( v20,  v15,  v17,  v22,  v21,  *(uint64_t *)((char *)&v21->super.super.super.super.super.isa + OBJC_IVAR____TtC6Arcade29StoreCollectionViewController_objectGraph),  v19,  v18);

  __n128 v23 = swift_bridgeObjectRelease(v17);
  (*(void (**)(char *, uint64_t, __n128))(v12 + 8))(v14, v11, v23);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v7 = type metadata accessor for IndexPath(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  id v11 = a3;
  uint64_t v12 = self;
  LOBYTE(self) = sub_10018ADE4(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return self & 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7 = type metadata accessor for IndexPath(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  id v11 = a3;
  uint64_t v12 = self;
  sub_10018B0F4(v11, v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v4 = a3;
  double v5 = self;
  LOBYTE(self) = sub_10018B3C4(v4);

  return self & 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for ProductViewController(0LL);
  id v6 = a3;
  id v7 = a4;
  id v8 = v11.receiver;
  -[ProductViewController didUpdateFocusInContext:withAnimationCoordinator:]( &v11,  "didUpdateFocusInContext:withAnimationCoordinator:",  v6,  v7);
  id v9 = objc_msgSend(v8, "collectionView", v11.receiver, v11.super_class);
  if (v9)
  {
    uint64_t v10 = v9;
    sub_10017FF7C(v6, v7, v9);
  }

  else
  {
    __break(1u);
  }

- (BOOL)collectionView:(id)a3 layout:(id)a4 shouldProvideBackgroundAtSection:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  LOBYTE(a5) = sub_100199D78(a5);

  return a5 & 1;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForBackgroundAtSection:(int64_t)a5
{
  double v5 = sub_10018B640(self, (uint64_t)a2, a3, a4, a5, sub_10019A114);
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (BOOL)collectionView:(id)a3 layout:(id)a4 shouldLayoutManageMultiColumnAt:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  LOBYTE(a5) = sub_10019A3C4(a5);

  return a5 & 1;
}

- (int64_t)collectionView:(id)a3 layout:(id)a4 multiColumnCountAtSection:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  int64_t v11 = sub_10019A664(a5);

  return v11;
}

- (double)collectionView:(id)a3 layout:(id)a4 multiColumnMarginAt:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  double v11 = sub_10019A9A4(a5);

  return v11;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_10018B818((uint64_t)v4);
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = self;
  sub_10019AD54(v8, v9);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  *a5 = *(CGPoint *)((char *)&self->super.super.super.super.super.isa
                   + OBJC_IVAR____TtC6Arcade21ProductViewController_desiredContentOffset);
}

- (void)didAskToBuy:(id)a3
{
}

- (void)didFailFocusMovement:(id)a3
{
}

@end