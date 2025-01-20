@interface SmallGameCenterPlayerCollectionViewCell
- (_TtC8AppStore39SmallGameCenterPlayerCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SmallGameCenterPlayerCollectionViewCell

- (_TtC8AppStore39SmallGameCenterPlayerCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore39SmallGameCenterPlayerCollectionViewCell *)sub_1000E8BC4( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000E91F8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore39SmallGameCenterPlayerCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore39SmallGameCenterPlayerCollectionViewCell_alias));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore39SmallGameCenterPlayerCollectionViewCell_displayName));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore39SmallGameCenterPlayerCollectionViewCell_separatorView));
}

@end