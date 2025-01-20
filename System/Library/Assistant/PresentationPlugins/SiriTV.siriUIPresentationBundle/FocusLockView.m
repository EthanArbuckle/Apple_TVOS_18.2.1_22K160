@interface FocusLockView
- (BOOL)canBecomeFocused;
- (_TtC6SiriTV13FocusLockView)initWithCoder:(id)a3;
- (_TtC6SiriTV13FocusLockView)initWithFrame:(CGRect)a3;
@end

@implementation FocusLockView

- (BOOL)canBecomeFocused
{
  return sub_3BD00() & 1;
}

- (_TtC6SiriTV13FocusLockView)initWithFrame:(CGRect)a3
{
  return (_TtC6SiriTV13FocusLockView *)sub_3BD10(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC6SiriTV13FocusLockView)initWithCoder:(id)a3
{
  return (_TtC6SiriTV13FocusLockView *)sub_3BD9C(a3);
}

@end