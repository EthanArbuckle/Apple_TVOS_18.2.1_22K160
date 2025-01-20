@interface TextCardCollectionViewCell
- (_TtC8AppStore16DynamicTypeLabel)accessibilitySubtitleLabel;
- (_TtC8AppStore16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC8AppStore17CollapsedTextView)accessibilityBodyTextView;
- (_TtC8AppStore26TextCardCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation TextCardCollectionViewCell

- (_TtC8AppStore26TextCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore26TextCardCollectionViewCell *)sub_100057A78( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100057F00();
}

- (_TtC8AppStore16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC8AppStore16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC8AppStore26TextCardCollectionViewCell_titleLabel));
}

- (_TtC8AppStore16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC8AppStore16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC8AppStore26TextCardCollectionViewCell_subtitleLabel));
}

- (_TtC8AppStore17CollapsedTextView)accessibilityBodyTextView
{
  return (_TtC8AppStore17CollapsedTextView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                                                                                     + OBJC_IVAR____TtC8AppStore26TextCardCollectionViewCell_bodyTextView));
}

- (void).cxx_destruct
{
  sub_100058790((Class *)((char *)&self->super.super.super.super.super.super.super.isa
                        + OBJC_IVAR____TtC8AppStore26TextCardCollectionViewCell_metrics));
  sub_10000B314((uint64_t)self + OBJC_IVAR____TtC8AppStore26TextCardCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore26TextCardCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore26TextCardCollectionViewCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore26TextCardCollectionViewCell_bodyTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore26TextCardCollectionViewCell_editorsChoiceView));
  sub_10000A450( *(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa + OBJC_IVAR____TtC8AppStore26TextCardCollectionViewCell_actionClosure),  *(void *)&self->super.super.state[OBJC_IVAR____TtC8AppStore26TextCardCollectionViewCell_actionClosure]);
}

@end