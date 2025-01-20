@interface ActionCollectionViewCell
- (_TtC8AppStore16DynamicTypeLabel)accessibilityTextLabel;
- (_TtC8AppStore24ActionCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation ActionCollectionViewCell

- (_TtC8AppStore24ActionCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore24ActionCollectionViewCell *)sub_1000A7C70( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)swift_getObjectType(self);
  id v6 = v11.receiver;
  id v7 = a4;
  id v8 =  -[ActionCollectionViewCell _preferredConfigurationForFocusAnimation:inContext:]( &v11,  "_preferredConfigurationForFocusAnimation:inContext:",  a3,  v7);
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "setFocusingBaseDuration:", 0.2, v11.receiver, v11.super_class);
    [v9 setUnfocusingBaseDuration:0.2];
    objc_msgSend(v9, "setAs_animationOptions:", 131078);
  }

  return v9;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000A876C();
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  v2 = v3.receiver;
  -[BaseCollectionViewCell prepareForReuse](&v3, "prepareForReuse");
  v2[OBJC_IVAR____TtC8AppStore24ActionCollectionViewCell_isShowingSeeAll] = 0;
}

- (_TtC8AppStore16DynamicTypeLabel)accessibilityTextLabel
{
  return (_TtC8AppStore16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC8AppStore24ActionCollectionViewCell_textLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore24ActionCollectionViewCell_textLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore24ActionCollectionViewCell_lazilyCreatedArtworkView));
}

@end