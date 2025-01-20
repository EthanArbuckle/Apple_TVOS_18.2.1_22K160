@interface ChicletMetadata
- (NSLayoutConstraint)subtitleToBadgeTrailingConstraint;
- (UILabel)accessibilityChicletCaption;
- (UILabel)accessibilityChicletRank;
- (UILabel)accessibilityChicletSubtitle;
- (UILabel)badge;
- (UILabel)caption;
- (UILabel)rank;
- (UILabel)subtitle;
- (UIStackView)stackView;
- (UIView)badgeContainer;
- (UIVisualEffectView)vibrancyView;
- (_TtC28GameCenterDashboardExtension15ChicletMetadata)initWithCoder:(id)a3;
- (_TtC28GameCenterDashboardExtension15ChicletMetadata)initWithFrame:(CGRect)a3;
- (void)awakeFromNib;
- (void)layoutSubviews;
- (void)setBadge:(id)a3;
- (void)setBadgeContainer:(id)a3;
- (void)setCaption:(id)a3;
- (void)setRank:(id)a3;
- (void)setStackView:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleToBadgeTrailingConstraint:(id)a3;
- (void)setVibrancyView:(id)a3;
@end

@implementation ChicletMetadata

- (NSLayoutConstraint)subtitleToBadgeTrailingConstraint
{
  return (NSLayoutConstraint *)sub_100004A48();
}

- (void)setSubtitleToBadgeTrailingConstraint:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100004ABC((uint64_t)a3);
}

- (UILabel)rank
{
  return (UILabel *)(id)sub_100004AE8();
}

- (void)setRank:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100004B3C();
}

- (UILabel)caption
{
  return (UILabel *)(id)sub_100004B84();
}

- (void)setCaption:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100004BD8();
}

- (UILabel)subtitle
{
  return (UILabel *)(id)sub_100004C20();
}

- (void)setSubtitle:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100004C74();
}

- (UILabel)badge
{
  return (UILabel *)(id)sub_100004CBC();
}

- (void)setBadge:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100004D10();
}

- (UIView)badgeContainer
{
  return (UIView *)(id)sub_100004D58();
}

- (void)setBadgeContainer:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100004DAC();
}

- (UIStackView)stackView
{
  return (UIStackView *)(id)sub_100004DF4();
}

- (void)setStackView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100004E48();
}

- (UIVisualEffectView)vibrancyView
{
  return (UIVisualEffectView *)sub_100004E90();
}

- (void)setVibrancyView:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100004F04((uint64_t)a3);
}

- (void)awakeFromNib
{
  v2 = self;
  sub_100004F10();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000051C0();
}

- (UILabel)accessibilityChicletRank
{
  return (UILabel *)(id)sub_10000537C();
}

- (UILabel)accessibilityChicletCaption
{
  return (UILabel *)(id)sub_1000053A8();
}

- (UILabel)accessibilityChicletSubtitle
{
  return (UILabel *)(id)sub_1000053D4();
}

- (_TtC28GameCenterDashboardExtension15ChicletMetadata)initWithFrame:(CGRect)a3
{
  return result;
}

- (_TtC28GameCenterDashboardExtension15ChicletMetadata)initWithCoder:(id)a3
{
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_subtitleToBadgeTrailingConstraint));
  sub_100005774(OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_rank);
  sub_100005774(OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_caption);
  sub_100005774(OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_subtitle);
  sub_100005774(OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_badge);
  sub_100005774(OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_badgeContainer);
  sub_100005774(OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_stackView);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_vibrancyView));
  swift_bridgeObjectRelease(*(void *)&self->subtitleToBadgeTrailingConstraint[OBJC_IVAR____TtC28GameCenterDashboardExtension15ChicletMetadata_visualEffectGroupName]);
}

@end