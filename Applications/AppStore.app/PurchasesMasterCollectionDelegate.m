@interface PurchasesMasterCollectionDelegate
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (_TtC8AppStore33PurchasesMasterCollectionDelegate)init;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6;
@end

@implementation PurchasesMasterCollectionDelegate

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v9 = type metadata accessor for IndexPath(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  id v13 = a3;
  id v14 = a4;
  v15 = self;
  double v16 = sub_100047E10(v13);
  double v18 = v17;

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  double v19 = v16;
  double v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v4 = a3;
  v5 = self;
  int64_t v6 = TVPurchasesPagePresenter.sectionCount.getter();

  return v6;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  Swift::Int v8 = TVPurchasesPagePresenter.numberOfItems(in:)(a4);

  return v8;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7 = type metadata accessor for IndexPath(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v11 = type metadata accessor for TextDetailCollectionViewCell();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(v11);
  id v13 = a3;
  id v14 = self;
  v15 = NSStringFromClass(ObjCClassFromMetadata);
  static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
  uint64_t v17 = v16;

  NSString v18 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v17);
  double v19 = (void *)IndexPath._bridgeToObjectiveC()();
  id v20 = [v13 dequeueReusableCellWithReuseIdentifier:v18 forIndexPath:v19];

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v20;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9 = type metadata accessor for IndexPath(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  id v13 = a3;
  id v14 = a4;
  v15 = self;
  sub_100047FC8(v14, (uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v9 = type metadata accessor for IndexPath(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v15 = v14;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  id v16 = a3;
  uint64_t v17 = self;
  id v18 = sub_100048260(v16, v13, v15);

  __n128 v19 = swift_bridgeObjectRelease(v15);
  (*(void (**)(char *, uint64_t, __n128))(v10 + 8))(v12, v9, v19);
  return v18;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  Swift::String_optional v11 = TVPurchasesPagePresenter.title(for:)(a5);
  if (v11.value._object)
  {
    [v8 bounds];
    CGRect.subtracting(insets:)([v8 contentInset]);
    double v13 = v12;
    double v15 = v14;
    if (qword_1002E0F28 != -1) {
      swift_once(&qword_1002E0F28, sub_100171228);
    }
    uint64_t v16 = type metadata accessor for TitleHeaderView.Style(0LL);
    uint64_t v17 = sub_10000A634(v16, (uint64_t)qword_1002F51B0);
    sub_10020A8CC( 0LL,  0LL,  0LL,  v11.value._countAndFlagsBits,  (char *)v11.value._object,  0LL,  0LL,  0LL,  v13,  v15,  0.0,  0.0,  0.0,  20.0,  0.0,  20.0,  1LL,  v17,  v8);
    double v19 = v18;

    swift_bridgeObjectRelease(v11.value._object);
  }

  else
  {

    double v13 = 0.0;
    double v19 = 0.0;
  }

  double v20 = v13;
  double v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  uint64_t v11 = type metadata accessor for IndexPath(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  double v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  uint64_t v17 = v16;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a6);
  id v18 = a3;
  id v19 = a4;
  double v20 = self;
  sub_1000483D0(v19, v15, v17);

  __n128 v21 = swift_bridgeObjectRelease(v17);
  (*(void (**)(char *, uint64_t, __n128))(v12 + 8))(v14, v11, v21);
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = self;
  sub_1000485C8(v8, v9);
}

- (_TtC8AppStore33PurchasesMasterCollectionDelegate)init
{
  CGSize result = (_TtC8AppStore33PurchasesMasterCollectionDelegate *)_swift_stdlib_reportUnimplementedInitializer( "AppStore.PurchasesMasterCollectionDelegate",  42LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8AppStore33PurchasesMasterCollectionDelegate_presenter));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8AppStore33PurchasesMasterCollectionDelegate_showDetailsWorkItem));
}

@end