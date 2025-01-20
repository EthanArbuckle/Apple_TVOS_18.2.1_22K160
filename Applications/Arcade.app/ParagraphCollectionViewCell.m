@interface ParagraphCollectionViewCell
- (BOOL)canBecomeFocused;
- (_TtC6Arcade16DynamicTypeLabel)accessibilityTextLabel;
- (_TtC6Arcade27ParagraphCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation ParagraphCollectionViewCell

- (_TtC6Arcade27ParagraphCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade27ParagraphCollectionViewCell *)sub_1000362E0( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100036524();
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType(self);
  v2 = (char *)v4.receiver;
  -[BaseCollectionViewCell prepareForReuse](&v4, "prepareForReuse");
  objc_msgSend( *(id *)&v2[OBJC_IVAR____TtC6Arcade27ParagraphCollectionViewCell_textLabel],  "setText:",  0,  v4.receiver,  v4.super_class);
  v3 = &v2[OBJC_IVAR____TtC6Arcade27ParagraphCollectionViewCell_lineLengthLimit];
  *(void *)v3 = 0LL;
  v3[8] = 1;
  [v2 setNeedsLayout];
}

- (_TtC6Arcade16DynamicTypeLabel)accessibilityTextLabel
{
  return (_TtC6Arcade16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                  + OBJC_IVAR____TtC6Arcade27ParagraphCollectionViewCell_textLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade27ParagraphCollectionViewCell_textLabel));
  sub_100006060( (uint64_t)self + OBJC_IVAR____TtC6Arcade27ParagraphCollectionViewCell_itemLayoutContext,  (uint64_t *)&unk_1002DDB60);
}

@end