@interface TVMusicNowPlayingCollectionView
- (BOOL)_shouldReverseLayoutDirection;
- (NSArray)preferredFocusEnvironments;
- (_TtC7TVMusic31TVMusicNowPlayingCollectionView)initWithCoder:(id)a3;
- (_TtC7TVMusic31TVMusicNowPlayingCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
@end

@implementation TVMusicNowPlayingCollectionView

- (NSArray)preferredFocusEnvironments
{
  v2 = self;
  v3 = sub_1001491A8();

  sub_1000DFE10((uint64_t *)&unk_1002B7E50);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (BOOL)_shouldReverseLayoutDirection
{
  return 0;
}

- (_TtC7TVMusic31TVMusicNowPlayingCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for TVMusicNowPlayingCollectionView();
  return -[TVMusicNowPlayingCollectionView initWithFrame:collectionViewLayout:]( &v10,  "initWithFrame:collectionViewLayout:",  a4,  x,  y,  width,  height);
}

- (_TtC7TVMusic31TVMusicNowPlayingCollectionView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TVMusicNowPlayingCollectionView();
  return -[TVMusicNowPlayingCollectionView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end