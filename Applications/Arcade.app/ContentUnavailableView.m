@interface ContentUnavailableView
- (BOOL)canBecomeFocused;
- (CGSize)_buttonSize;
- (_TtC6Arcade22ContentUnavailableView)initWithCoder:(id)a3;
- (_TtC6Arcade22ContentUnavailableView)initWithFrame:(CGRect)a3;
- (_TtC6Arcade22ContentUnavailableView)initWithFrame:(CGRect)a3 title:(id)a4 style:(unint64_t)a5;
- (_TtC6Arcade22ContentUnavailableView)initWithFrame:(CGRect)a3 title:(id)a4 style:(unint64_t)a5 includeBackdrop:(BOOL)a6;
- (double)_buttonAlpha;
- (double)_buttonVerticalSpacing;
- (double)_labelAlpha;
- (double)_labelVerticalSpacing;
- (id)_buttonBackgroundImageForStyle:(unint64_t)a3 controlState:(unint64_t)a4;
- (id)_flatTextColor;
- (id)_titleFont;
- (void)setCanBecomeFocused:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ContentUnavailableView

- (_TtC6Arcade22ContentUnavailableView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10010BA58();
}

  ;
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType(self);
  id v4 = a3;
  id v5 = v6.receiver;
  -[ContentUnavailableView traitCollectionDidChange:](&v6, "traitCollectionDidChange:", v4);
  objc_msgSend(v5, "setNeedsLayout", v6.receiver, v6.super_class);
}

- (BOOL)canBecomeFocused
{
  return self->_UIContentUnavailableView_opaque[OBJC_IVAR____TtC6Arcade22ContentUnavailableView__canBecomeFocused];
}

- (void)setCanBecomeFocused:(BOOL)a3
{
  self->_UIContentUnavailableView_opaque[OBJC_IVAR____TtC6Arcade22ContentUnavailableView__canBecomeFocused] = a3;
}

- (id)_titleFont
{
  return   [(id)objc_opt_self(UIFont) preferredFontForTextStyle:UIFontTextStyleHeadline];
}

- (double)_labelAlpha
{
  return 1.0;
}

- (double)_buttonAlpha
{
  return 1.0;
}

- (CGSize)_buttonSize
{
  double v2 = 320.0;
  double v3 = 72.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)_labelVerticalSpacing
{
  return 68.0;
}

- (double)_buttonVerticalSpacing
{
  return 100.0;
}

- (id)_flatTextColor
{
  uint64_t v2 = qword_1002DCC00;
  double v3 = self;
  if (v2 != -1) {
    swift_once(&qword_1002DCC00, sub_10010B514);
  }
  uint64_t v4 = sub_1000031E8((uint64_t *)&unk_1002DE240);
  sub_1000061F4(v4, (uint64_t)qword_1002F0660);
  objc_super v6 = v3;
  Conditional.evaluate(with:)(&v7, &v6, v4);

  return v7;
}

- (id)_buttonBackgroundImageForStyle:(unint64_t)a3 controlState:(unint64_t)a4
{
  return 0LL;
}

- (_TtC6Arcade22ContentUnavailableView)initWithFrame:(CGRect)a3 title:(id)a4 style:(unint64_t)a5
{
  CGSize result = (_TtC6Arcade22ContentUnavailableView *)_swift_stdlib_reportUnimplementedInitializer( "Arcade.ContentUnavailableView",  29LL,  "init(frame:title:style:)",  24LL,  0LL);
  __break(1u);
  return result;
}

- (_TtC6Arcade22ContentUnavailableView)initWithFrame:(CGRect)a3 title:(id)a4 style:(unint64_t)a5 includeBackdrop:(BOOL)a6
{
  CGSize result = (_TtC6Arcade22ContentUnavailableView *)_swift_stdlib_reportUnimplementedInitializer( "Arcade.ContentUnavailableView",  29LL,  "init(frame:title:style:includeBackdrop:)",  40LL,  0LL);
  __break(1u);
  return result;
}

- (_TtC6Arcade22ContentUnavailableView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC6Arcade22ContentUnavailableView *)_swift_stdlib_reportUnimplementedInitializer( "Arcade.ContentUnavailableView",  29LL,  "init(frame:)",  12LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end