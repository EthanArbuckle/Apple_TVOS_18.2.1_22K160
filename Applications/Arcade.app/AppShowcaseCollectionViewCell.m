@interface AppShowcaseCollectionViewCell
- (BOOL)canBecomeFocused;
- (_TtC6Arcade29AppShowcaseCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation AppShowcaseCollectionViewCell

- (_TtC6Arcade29AppShowcaseCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade29AppShowcaseCollectionViewCell *)sub_1000C3178( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000C3334();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade29AppShowcaseCollectionViewCell_mediaCollectionView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade29AppShowcaseCollectionViewCell_lockupView));
}

@end