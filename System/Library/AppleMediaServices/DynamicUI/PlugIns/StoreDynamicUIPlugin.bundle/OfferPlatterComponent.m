@interface OfferPlatterComponent
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (UIView)preferredFocusedView;
- (_TtC20StoreDynamicUIPlugin21OfferPlatterComponent)initWithCoder:(id)a3;
- (_TtC20StoreDynamicUIPlugin21OfferPlatterComponent)initWithFrame:(CGRect)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation OfferPlatterComponent

- (_TtC20StoreDynamicUIPlugin21OfferPlatterComponent)initWithFrame:(CGRect)a3
{
  return (_TtC20StoreDynamicUIPlugin21OfferPlatterComponent *)sub_782F0( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (_TtC20StoreDynamicUIPlugin21OfferPlatterComponent)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_78630();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_78A6C();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_78B68((uint64_t)a3);
}

- (UIView)preferredFocusedView
{
  return (UIView *)sub_30014();
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_78C3C((uint64_t)v6, v7);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_78DC0();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  id v5 = self;
  sub_79278();
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_buttonLabel));
  sub_118C8(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_infoLabel);
  sub_118C8(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_subtitleLabel);
  sub_118C8(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_titleLabel);
  sub_118C8(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_artworkView);
  sub_118C8(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_containerView);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_separatorView));
}

@end