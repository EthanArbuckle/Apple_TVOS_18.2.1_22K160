@interface PrivacyDefinitionCollectionViewCell
- (BOOL)canBecomeFocused;
- (_TtC8AppStore16DynamicTypeLabel)accessibilityDefinitionLabel;
- (_TtC8AppStore16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC8AppStore35PrivacyDefinitionCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation PrivacyDefinitionCollectionViewCell

- (_TtC8AppStore35PrivacyDefinitionCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore35PrivacyDefinitionCollectionViewCell *)sub_10000F38C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10000EDB0();
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void)prepareForReuse
{
  v2 = self;
  sub_10000F0EC();
}

- (_TtC8AppStore16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC8AppStore16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC8AppStore35PrivacyDefinitionCollectionViewCell_titleLabel));
}

- (_TtC8AppStore16DynamicTypeLabel)accessibilityDefinitionLabel
{
  return (_TtC8AppStore16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC8AppStore35PrivacyDefinitionCollectionViewCell_definitionLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore35PrivacyDefinitionCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore35PrivacyDefinitionCollectionViewCell_definitionLabel));
  sub_10000B314((uint64_t)self + OBJC_IVAR____TtC8AppStore35PrivacyDefinitionCollectionViewCell_itemLayoutContext);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore35PrivacyDefinitionCollectionViewCell_pageTraits));
}

@end