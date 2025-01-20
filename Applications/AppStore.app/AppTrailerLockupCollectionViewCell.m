@interface AppTrailerLockupCollectionViewCell
- (_TtC8AppStore34AppTrailerLockupCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation AppTrailerLockupCollectionViewCell

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  id v2 = v3.receiver;
  -[MixedMediaLockupCollectionViewCell layoutSubviews](&v3, "layoutSubviews");
  sub_10008EBE4();
  AvatarShowcaseDisplaying.placeAvatarShowcase()();
}

- (_TtC8AppStore34AppTrailerLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType(self);
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore34AppTrailerLockupCollectionViewCell_avatarShowcase) = 0LL;
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[MixedMediaLockupCollectionViewCell initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore34AppTrailerLockupCollectionViewCell_avatarShowcase));
}

@end