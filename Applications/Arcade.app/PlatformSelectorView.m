@interface PlatformSelectorView
- (_TtC6Arcade16DynamicTypeLabel)accessibilityDescriptionLabel;
- (_TtC6Arcade20PlatformSelectorView)initWithCoder:(id)a3;
- (_TtC6Arcade20PlatformSelectorView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PlatformSelectorView

- (_TtC6Arcade20PlatformSelectorView)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade20PlatformSelectorView *)sub_10001FD18(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC6Arcade20PlatformSelectorView)initWithCoder:(id)a3
{
  result = (_TtC6Arcade20PlatformSelectorView *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100243980LL,  "Arcade/PlatformSelectorView.swift",  33LL,  2LL,  65LL,  0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10001FF5C();
}

- (_TtC6Arcade16DynamicTypeLabel)accessibilityDescriptionLabel
{
  return (_TtC6Arcade16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                  + OBJC_IVAR____TtC6Arcade20PlatformSelectorView_descriptionLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade20PlatformSelectorView_descriptionLabel));
}

@end