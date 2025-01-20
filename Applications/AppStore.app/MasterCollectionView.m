@interface MasterCollectionView
- (BOOL)canBecomeFocused;
- (NSArray)preferredFocusEnvironments;
- (_TtC8AppStoreP33_9B8EC19F588D22825F9FBF534CFC415C20MasterCollectionView)initWithCoder:(id)a3;
- (_TtC8AppStoreP33_9B8EC19F588D22825F9FBF534CFC415C20MasterCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
@end

@implementation MasterCollectionView

- (BOOL)canBecomeFocused
{
  v2 = self;
  uint64_t v3 = (uint64_t)sub_100009C18();
  if (v3)
  {
    uint64_t v4 = v3;
    if ((unint64_t)v3 >> 62)
    {
      if (v3 >= 0) {
        v3 &= 0xFFFFFFFFFFFFFF8uLL;
      }
      uint64_t v5 = _CocoaArrayWrapper.endIndex.getter(v3);
    }

    else
    {
      uint64_t v5 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
    }

    swift_bridgeObjectRelease(v4);
    return v5 != 0;
  }

  else
  {

    return 0;
  }

- (NSArray)preferredFocusEnvironments
{
  v2 = self;
  id v3 = sub_100009C18();
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = sub_1000CA058((uint64_t)v3);

    swift_bridgeObjectRelease(v4);
  }

  else
  {
    v10.receiver = v2;
    v10.super_class = (Class)type metadata accessor for MasterCollectionView();
    v6 = -[MasterCollectionView preferredFocusEnvironments](&v10, "preferredFocusEnvironments");
    uint64_t v7 = sub_1000038E8((uint64_t *)&unk_1002E3880);
    uint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v6, v7);
  }

  sub_1000038E8((uint64_t *)&unk_1002E3880);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v5);
  return (NSArray *)isa;
}

- (_TtC8AppStoreP33_9B8EC19F588D22825F9FBF534CFC415C20MasterCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for MasterCollectionView();
  return -[MasterCollectionView initWithFrame:collectionViewLayout:]( &v10,  "initWithFrame:collectionViewLayout:",  a4,  x,  y,  width,  height);
}

- (_TtC8AppStoreP33_9B8EC19F588D22825F9FBF534CFC415C20MasterCollectionView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MasterCollectionView();
  return -[MasterCollectionView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end