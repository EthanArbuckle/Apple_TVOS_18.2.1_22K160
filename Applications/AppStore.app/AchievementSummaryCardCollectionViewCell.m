@interface AchievementSummaryCardCollectionViewCell
- (_TtC19AppStoreKitInternal20AchievementGroupView)accessibilityAchievementGroupView;
- (_TtC8AppStore16DynamicTypeLabel)accessibilityCompletedLabel;
- (_TtC8AppStore16DynamicTypeLabel)accessibilityNumberCompletedLabel;
- (_TtC8AppStore16DynamicTypeLabel)accessibilityOutOfTotalLabel;
- (_TtC8AppStore40AchievementSummaryCardCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation AchievementSummaryCardCollectionViewCell

- (_TtC8AppStore40AchievementSummaryCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore40AchievementSummaryCardCollectionViewCell *)sub_100136400( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1001367E4();
}

- (_TtC19AppStoreKitInternal20AchievementGroupView)accessibilityAchievementGroupView
{
  return (_TtC19AppStoreKitInternal20AchievementGroupView *)*(id *)((char *)&self->super.super.super.super.super.super.super.isa + OBJC_IVAR____TtC8AppStore40AchievementSummaryCardCollectionViewCell_achievementGroupView);
}

- (_TtC8AppStore16DynamicTypeLabel)accessibilityNumberCompletedLabel
{
  return (_TtC8AppStore16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC8AppStore40AchievementSummaryCardCollectionViewCell_numberCompletedLabel));
}

- (_TtC8AppStore16DynamicTypeLabel)accessibilityOutOfTotalLabel
{
  return (_TtC8AppStore16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC8AppStore40AchievementSummaryCardCollectionViewCell_outOfTotalLabel));
}

- (_TtC8AppStore16DynamicTypeLabel)accessibilityCompletedLabel
{
  return (_TtC8AppStore16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC8AppStore40AchievementSummaryCardCollectionViewCell_completedLabel));
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC8AppStore40AchievementSummaryCardCollectionViewCell_metrics;
  uint64_t v4 = type metadata accessor for AchievementSummaryLayout.Metrics(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  sub_10000B314((uint64_t)self + OBJC_IVAR____TtC8AppStore40AchievementSummaryCardCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore40AchievementSummaryCardCollectionViewCell_achievementGroupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore40AchievementSummaryCardCollectionViewCell_numberCompletedLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore40AchievementSummaryCardCollectionViewCell_outOfTotalLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore40AchievementSummaryCardCollectionViewCell_completedLabel));
}

@end