@interface AppShowcaseCollectionViewCell
- (BOOL)canBecomeFocused;
- (_TtC8AppStore29AppShowcaseCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation AppShowcaseCollectionViewCell

- (_TtC8AppStore29AppShowcaseCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore29AppShowcaseCollectionViewCell *)sub_1000C303C( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000C31F8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29AppShowcaseCollectionViewCell_mediaCollectionView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29AppShowcaseCollectionViewCell_lockupView));
}

@end