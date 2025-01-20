@interface LargeLockupCollectionViewCell
- (_TtC8AppStore29LargeLockupCollectionViewCell)initWithFrame:(CGRect)a3;
@end

@implementation LargeLockupCollectionViewCell

- (_TtC8AppStore29LargeLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType(self);
  return -[TVLockupCollectionViewCell initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

@end