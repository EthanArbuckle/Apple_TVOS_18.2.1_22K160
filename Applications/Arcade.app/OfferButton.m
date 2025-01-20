@interface OfferButton
- (BOOL)isHighlighted;
- (CGRect)frame;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC6Arcade11OfferButton)initWithFrame:(CGRect)a3;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)invalidateIntrinsicContentSize;
- (void)layoutSubviews;
- (void)setFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation OfferButton

- (_TtC6Arcade11OfferButton)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade11OfferButton *)sub_10019E5CC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType(self);
  -[OfferButton frame](&v6, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType(self);
  v19.receiver = self;
  v19.super_class = ObjectType;
  v9 = self;
  -[OfferButton frame](&v19, "frame");
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  v18.receiver = v9;
  v18.super_class = ObjectType;
  -[OfferButton setFrame:](&v18, "setFrame:", x, y, width, height);
  sub_10019F178(v11, v13, v15, v17);
}

- (void)layoutSubviews
{
  double v2 = self;
  sub_10019FB1C();
}

- (void)invalidateIntrinsicContentSize
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType(self);
  double v2 = (char *)v4.receiver;
  -[OfferButton invalidateIntrinsicContentSize](&v4, "invalidateIntrinsicContentSize");
  double v3 = &v2[OBJC_IVAR____TtC6Arcade11OfferButton_cachedIntrinsicContentSize];
  *(void *)double v3 = 0LL;
  *((void *)v3 + 1) = 0LL;
  v3[16] = 1;
}

- (CGSize)intrinsicContentSize
{
  double v2 = self;
  double v3 = sub_10019FD54();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = self;
  double v4 = sub_10019FD54();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  return -[OfferButton isHighlighted](&v3, "isHighlighted");
}

- (void)setHighlighted:(BOOL)a3
{
  double v4 = self;
  sub_10019FED0(a3);
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  ObjectType = (objc_class *)swift_getObjectType(self);
  v13.receiver = self;
  v13.super_class = ObjectType;
  double v4 = self;
  -[OfferButton _dynamicUserInterfaceTraitDidChange](&v13, "_dynamicUserInterfaceTraitDidChange");
  uint64_t v5 = (uint64_t)v4 + OBJC_IVAR____TtC6Arcade11OfferButton__configuration;
  swift_beginAccess((char *)v4 + OBJC_IVAR____TtC6Arcade11OfferButton__configuration, &v9, 0LL, 0LL);
  sub_10001F010(v5, (uint64_t)v10);
  uint64_t v6 = v11;
  uint64_t v7 = v12;
  sub_100005F8C(v10, v11);
  unint64_t v8 = sub_1001A09BC();
  dispatch thunk of OfferButtonConfiguration.reapply<A>(colorsTo:)(v4, ObjectType, v8, v6, v7);
  _s6Arcade17PillOverlayLayoutVwxx_0(v10);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1001A042C((uint64_t)a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC6Arcade11OfferButton_targetActions));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC6Arcade11OfferButton_objectGraph));
  sub_100006060((uint64_t)self + OBJC_IVAR____TtC6Arcade11OfferButton_presenter, (uint64_t *)&unk_1002DF680);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC6Arcade11OfferButton_layoutDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade11OfferButton_effectShape));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade11OfferButton_outlineShape));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade11OfferButton_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade11OfferButton_label));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade11OfferButton_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade11OfferButton_backgroundEffectView));
  _s6Arcade17PillOverlayLayoutVwxx_0((Class *)((char *)&self->super.super.super.super.super.super.isa
                                             + OBJC_IVAR____TtC6Arcade11OfferButton__configuration));
}

@end