@interface ChicletCell
- (UILabel)accessibilityTitleLabel;
- (UILabel)titleLabel;
- (UIView)accessibilityMetadataContainer;
- (UIView)container;
- (UIView)iconContainer;
- (UIView)metadataContainer;
- (_TtC29GameCenterMatchmakerExtension11ChicletCell)initWithCoder:(id)a3;
- (_TtC29GameCenterMatchmakerExtension11ChicletCell)initWithFrame:(CGRect)a3;
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
  return (UIView *)(id)sub_1000065C8();
}

- (void)setContainer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000661C();
}

- (UIView)metadataContainer
{
  return (UIView *)(id)sub_100006664();
}

- (void)setMetadataContainer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000066B8();
}

- (UIView)iconContainer
{
  return (UIView *)(id)sub_100006700();
}

- (void)setIconContainer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100006754();
}

- (UILabel)titleLabel
{
  return (UILabel *)(id)sub_10000679C();
}

- (void)setTitleLabel:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000067F0();
}

- (void)awakeFromNib
{
  v2 = self;
  sub_1000069E0();
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_100007150((uint64_t)v6, v7);
}

- (UILabel)accessibilityTitleLabel
{
  return (UILabel *)(id)sub_100007558();
}

- (UIView)accessibilityMetadataContainer
{
  return (UIView *)(id)sub_100007584();
}

- (_TtC29GameCenterMatchmakerExtension11ChicletCell)initWithFrame:(CGRect)a3
{
  return (_TtC29GameCenterMatchmakerExtension11ChicletCell *)sub_1000075BC();
}

- (_TtC29GameCenterMatchmakerExtension11ChicletCell)initWithCoder:(id)a3
{
  return (_TtC29GameCenterMatchmakerExtension11ChicletCell *)sub_100007728(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_customBackgroundBlur));
  sub_100006444(OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_coordinator);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_visualEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_vibrancyView));
  swift_bridgeObjectRelease(*(void *)&self->container[OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_visualEffectGroupName]);
  sub_100007C84(*(id *)((char *)&self->super.super.super.super.super.super.isa
                      + OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_floatingView));
}

@end