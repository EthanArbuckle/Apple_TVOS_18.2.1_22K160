@interface AchievementSummaryCardCollectionViewCell
- (_TtC19AppStoreKitInternal20AchievementGroupView)accessibilityAchievementGroupView;
- (_TtC6Arcade16DynamicTypeLabel)accessibilityCompletedLabel;
- (_TtC6Arcade16DynamicTypeLabel)accessibilityNumberCompletedLabel;
- (_TtC6Arcade16DynamicTypeLabel)accessibilityOutOfTotalLabel;
- (_TtC6Arcade40AchievementSummaryCardCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation AchievementSummaryCardCollectionViewCell

- (_TtC6Arcade40AchievementSummaryCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade40AchievementSummaryCardCollectionViewCell *)sub_1001304B0( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100130894();
}

- (_TtC19AppStoreKitInternal20AchievementGroupView)accessibilityAchievementGroupView
{
  return (_TtC19AppStoreKitInternal20AchievementGroupView *)*(id *)((char *)&self->super.super.super.super.super.super.super.isa + OBJC_IVAR____TtC6Arcade40AchievementSummaryCardCollectionViewCell_achievementGroupView);
}

- (_TtC6Arcade16DynamicTypeLabel)accessibilityNumberCompletedLabel
{
  return (_TtC6Arcade16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                                                                                  + OBJC_IVAR____TtC6Arcade40AchievementSummaryCardCollectionViewCell_numberCompletedLabel));
}

- (_TtC6Arcade16DynamicTypeLabel)accessibilityOutOfTotalLabel
{
  return (_TtC6Arcade16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                                                                                  + OBJC_IVAR____TtC6Arcade40AchievementSummaryCardCollectionViewCell_outOfTotalLabel));
}

- (_TtC6Arcade16DynamicTypeLabel)accessibilityCompletedLabel
{
  return (_TtC6Arcade16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                                                                                  + OBJC_IVAR____TtC6Arcade40AchievementSummaryCardCollectionViewCell_completedLabel));
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC6Arcade40AchievementSummaryCardCollectionViewCell_metrics;
  uint64_t v4 = type metadata accessor for AchievementSummaryLayout.Metrics(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  sub_10000AA2C((uint64_t)self + OBJC_IVAR____TtC6Arcade40AchievementSummaryCardCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade40AchievementSummaryCardCollectionViewCell_achievementGroupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade40AchievementSummaryCardCollectionViewCell_numberCompletedLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade40AchievementSummaryCardCollectionViewCell_outOfTotalLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade40AchievementSummaryCardCollectionViewCell_completedLabel));
}

@end