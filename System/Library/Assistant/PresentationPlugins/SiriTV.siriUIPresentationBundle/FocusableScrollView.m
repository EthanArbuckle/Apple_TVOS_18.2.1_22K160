@interface FocusableScrollView
- (BOOL)canBecomeFocused;
- (_TtC6SiriTV19FocusableScrollView)initWithCoder:(id)a3;
- (_TtC6SiriTV19FocusableScrollView)initWithFrame:(CGRect)a3;
@end

@implementation FocusableScrollView

- (BOOL)canBecomeFocused
{
  return sub_AE18() & 1;
}

- (_TtC6SiriTV19FocusableScrollView)initWithFrame:(CGRect)a3
{
  return (_TtC6SiriTV19FocusableScrollView *)sub_AE28(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC6SiriTV19FocusableScrollView)initWithCoder:(id)a3
{
  return (_TtC6SiriTV19FocusableScrollView *)sub_AEB4(a3);
}

@end