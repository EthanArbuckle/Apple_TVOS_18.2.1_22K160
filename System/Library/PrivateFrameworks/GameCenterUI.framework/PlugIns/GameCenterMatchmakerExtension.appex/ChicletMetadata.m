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
- (_TtC29GameCenterMatchmakerExtension15ChicletMetadata)initWithCoder:(id)a3;
- (_TtC29GameCenterMatchmakerExtension15ChicletMetadata)initWithFrame:(CGRect)a3;
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
  return (NSLayoutConstraint *)sub_100005718();
}

- (void)setSubtitleToBadgeTrailingConstraint:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10000578C((uint64_t)a3);
}

- (UILabel)rank
{
  return (UILabel *)(id)sub_1000057B8();
}

- (void)setRank:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10000580C();
}

- (UILabel)caption
{
  return (UILabel *)(id)sub_100005854();
}

- (void)setCaption:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1000058A8();
}

- (UILabel)subtitle
{
  return (UILabel *)(id)sub_1000058F0();
}

- (void)setSubtitle:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100005944();
}

- (UILabel)badge
{
  return (UILabel *)(id)sub_10000598C();
}

- (void)setBadge:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1000059E0();
}

- (UIView)badgeContainer
{
  return (UIView *)(id)sub_100005A28();
}

- (void)setBadgeContainer:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100005A7C();
}

- (UIStackView)stackView
{
  return (UIStackView *)(id)sub_100005AC4();
}

- (void)setStackView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100005B18();
}

- (UIVisualEffectView)vibrancyView
{
  return (UIVisualEffectView *)sub_100005B60();
}

- (void)setVibrancyView:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100005BD4((uint64_t)a3);
}

- (void)awakeFromNib
{
  v2 = self;
  sub_100005BE0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100005E90();
}

- (UILabel)accessibilityChicletRank
{
  return (UILabel *)(id)sub_10000604C();
}

- (UILabel)accessibilityChicletCaption
{
  return (UILabel *)(id)sub_100006078();
}

- (UILabel)accessibilityChicletSubtitle
{
  return (UILabel *)(id)sub_1000060A4();
}

- (_TtC29GameCenterMatchmakerExtension15ChicletMetadata)initWithFrame:(CGRect)a3
{
  return result;
}

- (_TtC29GameCenterMatchmakerExtension15ChicletMetadata)initWithCoder:(id)a3
{
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_subtitleToBadgeTrailingConstraint));
  sub_100006444(OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_rank);
  sub_100006444(OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_caption);
  sub_100006444(OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_subtitle);
  sub_100006444(OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_badge);
  sub_100006444(OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_badgeContainer);
  sub_100006444(OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_stackView);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_vibrancyView));
  swift_bridgeObjectRelease(*(void *)&self->subtitleToBadgeTrailingConstraint[OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_visualEffectGroupName]);
}

@end