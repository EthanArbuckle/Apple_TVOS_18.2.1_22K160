@interface TextCardCollectionViewCell
- (_TtC6Arcade16DynamicTypeLabel)accessibilitySubtitleLabel;
- (_TtC6Arcade16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC6Arcade17CollapsedTextView)accessibilityBodyTextView;
- (_TtC6Arcade26TextCardCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation TextCardCollectionViewCell

- (_TtC6Arcade26TextCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade26TextCardCollectionViewCell *)sub_10005D7B4( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10005DC3C();
}

- (_TtC6Arcade16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC6Arcade16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                                                                                  + OBJC_IVAR____TtC6Arcade26TextCardCollectionViewCell_titleLabel));
}

- (_TtC6Arcade16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC6Arcade16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                                                                                  + OBJC_IVAR____TtC6Arcade26TextCardCollectionViewCell_subtitleLabel));
}

- (_TtC6Arcade17CollapsedTextView)accessibilityBodyTextView
{
  return (_TtC6Arcade17CollapsedTextView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                                                                                   + OBJC_IVAR____TtC6Arcade26TextCardCollectionViewCell_bodyTextView));
}

- (void).cxx_destruct
{
  sub_10005E4CC((Class *)((char *)&self->super.super.super.super.super.super.super.isa
                        + OBJC_IVAR____TtC6Arcade26TextCardCollectionViewCell_metrics));
  sub_10000AA2C((uint64_t)self + OBJC_IVAR____TtC6Arcade26TextCardCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade26TextCardCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade26TextCardCollectionViewCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade26TextCardCollectionViewCell_bodyTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade26TextCardCollectionViewCell_editorsChoiceView));
  sub_10000D3D8( *(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa + OBJC_IVAR____TtC6Arcade26TextCardCollectionViewCell_actionClosure),  *(void *)&self->super.super.state[OBJC_IVAR____TtC6Arcade26TextCardCollectionViewCell_actionClosure]);
}

@end