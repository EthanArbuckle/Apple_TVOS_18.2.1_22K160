@interface ChicletCell
- (UILabel)accessibilityTitleLabel;
- (UILabel)titleLabel;
- (UIView)accessibilityMetadataContainer;
- (UIView)container;
- (UIView)iconContainer;
- (UIView)metadataContainer;
- (_TtC28GameCenterDashboardExtension11ChicletCell)initWithCoder:(id)a3;
- (_TtC28GameCenterDashboardExtension11ChicletCell)initWithFrame:(CGRect)a3;
- (void)awakeFromNib;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setContainer:(id)a3;
- (void)setIconContainer:(id)a3;
- (void)setMetadataContainer:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation ChicletCell

- (UIView)container
{
  return (UIView *)(id)sub_100005E9C();
}

- (void)setContainer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100005EF0();
}

- (UIView)metadataContainer
{
  return (UIView *)(id)sub_100005F38();
}

- (void)setMetadataContainer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100005F8C();
}

- (UIView)iconContainer
{
  return (UIView *)(id)sub_100005FD4();
}

- (void)setIconContainer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100006028();
}

- (UILabel)titleLabel
{
  return (UILabel *)(id)sub_100006070();
}

- (void)setTitleLabel:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000060C4();
}

- (void)awakeFromNib
{
  v2 = self;
  sub_1000062B4();
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_100006A24((uint64_t)v6, v7);
}

- (UILabel)accessibilityTitleLabel
{
  return (UILabel *)(id)sub_100006E2C();
}

- (UIView)accessibilityMetadataContainer
{
  return (UIView *)(id)sub_100006E58();
}

- (_TtC28GameCenterDashboardExtension11ChicletCell)initWithFrame:(CGRect)a3
{
  return (_TtC28GameCenterDashboardExtension11ChicletCell *)sub_100006E90();
}

- (_TtC28GameCenterDashboardExtension11ChicletCell)initWithCoder:(id)a3
{
  return (_TtC28GameCenterDashboardExtension11ChicletCell *)sub_100006FFC(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC28GameCenterDashboardExtension11ChicletCell_customBackgroundBlur));
  sub_100005774(OBJC_IVAR____TtC28GameCenterDashboardExtension11ChicletCell_coordinator);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28GameCenterDashboardExtension11ChicletCell_visualEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28GameCenterDashboardExtension11ChicletCell_vibrancyView));
  swift_bridgeObjectRelease(*(void *)&self->container[OBJC_IVAR____TtC28GameCenterDashboardExtension11ChicletCell_visualEffectGroupName]);
  sub_100007558(*(id *)((char *)&self->super.super.super.super.super.super.isa
                      + OBJC_IVAR____TtC28GameCenterDashboardExtension11ChicletCell_floatingView));
}

@end