@interface LargeHeroBreakoutCollectionViewCell
- (_TtC8AppStore35LargeHeroBreakoutCollectionViewCell)initWithFrame:(CGRect)a3;
@end

@implementation LargeHeroBreakoutCollectionViewCell

- (_TtC8AppStore35LargeHeroBreakoutCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for LargeHeroBreakoutCollectionViewCell(0LL);
  return -[LargeBreakoutCollectionViewCell initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

@end