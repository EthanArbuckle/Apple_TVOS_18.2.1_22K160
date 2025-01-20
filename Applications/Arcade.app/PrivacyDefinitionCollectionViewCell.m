@interface PrivacyDefinitionCollectionViewCell
- (BOOL)canBecomeFocused;
- (_TtC6Arcade16DynamicTypeLabel)accessibilityDefinitionLabel;
- (_TtC6Arcade16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC6Arcade35PrivacyDefinitionCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation PrivacyDefinitionCollectionViewCell

- (_TtC6Arcade35PrivacyDefinitionCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade35PrivacyDefinitionCollectionViewCell *)sub_100010C3C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100010660();
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void)prepareForReuse
{
  v2 = self;
  sub_10001099C();
}

- (_TtC6Arcade16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC6Arcade16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                  + OBJC_IVAR____TtC6Arcade35PrivacyDefinitionCollectionViewCell_titleLabel));
}

- (_TtC6Arcade16DynamicTypeLabel)accessibilityDefinitionLabel
{
  return (_TtC6Arcade16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                  + OBJC_IVAR____TtC6Arcade35PrivacyDefinitionCollectionViewCell_definitionLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade35PrivacyDefinitionCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade35PrivacyDefinitionCollectionViewCell_definitionLabel));
  sub_10000AA2C((uint64_t)self + OBJC_IVAR____TtC6Arcade35PrivacyDefinitionCollectionViewCell_itemLayoutContext);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC6Arcade35PrivacyDefinitionCollectionViewCell_pageTraits));
}

@end