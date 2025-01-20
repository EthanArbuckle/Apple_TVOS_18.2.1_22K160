@interface LargeGameCenterPlayerCollectionViewCell
- (_TtC6Arcade39LargeGameCenterPlayerCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4;
- (void)layoutSubviews;
@end

@implementation LargeGameCenterPlayerCollectionViewCell

- (_TtC6Arcade39LargeGameCenterPlayerCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade39LargeGameCenterPlayerCollectionViewCell *)sub_100126E44( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1001271BC();
}

- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for LargeGameCenterPlayerCollectionViewCell(0LL);
  id v6 = v11.receiver;
  id v7 = a4;
  id v8 =  -[LargeGameCenterPlayerCollectionViewCell _preferredConfigurationForFocusAnimation:inContext:]( &v11,  "_preferredConfigurationForFocusAnimation:inContext:",  a3,  v7);
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "setFocusingBaseDuration:", 0.2, v11.receiver, v11.super_class);
    [v9 setUnfocusingBaseDuration:0.2];
    objc_msgSend(v9, "setAs_animationOptions:", 131078);
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade39LargeGameCenterPlayerCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade39LargeGameCenterPlayerCollectionViewCell_alias));
}

@end