@interface PlatformSelectorView
- (_TtC8AppStore16DynamicTypeLabel)accessibilityDescriptionLabel;
- (_TtC8AppStore20PlatformSelectorView)initWithCoder:(id)a3;
- (_TtC8AppStore20PlatformSelectorView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PlatformSelectorView

- (_TtC8AppStore20PlatformSelectorView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore20PlatformSelectorView *)sub_10001DF40(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore20PlatformSelectorView)initWithCoder:(id)a3
{
  result = (_TtC8AppStore20PlatformSelectorView *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100247230LL,  "AppStore/PlatformSelectorView.swift",  35LL,  2LL,  65LL,  0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10001E184();
}

- (_TtC8AppStore16DynamicTypeLabel)accessibilityDescriptionLabel
{
  return (_TtC8AppStore16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC8AppStore20PlatformSelectorView_descriptionLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore20PlatformSelectorView_descriptionLabel));
}

@end