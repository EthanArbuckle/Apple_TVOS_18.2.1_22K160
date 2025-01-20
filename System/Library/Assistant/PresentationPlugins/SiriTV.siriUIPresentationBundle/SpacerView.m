@interface SpacerView
- (BOOL)canBecomeFocused;
- (CGSize)intrinsicContentSize;
- (_TtC6SiriTV10SpacerView)initWithCoder:(id)a3;
- (_TtC6SiriTV10SpacerView)initWithFrame:(CGRect)a3;
@end

@implementation SpacerView

- (CGSize)intrinsicContentSize
{
  double v2 = sub_5B42C();
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)canBecomeFocused
{
  return sub_5B464() & 1;
}

- (_TtC6SiriTV10SpacerView)initWithFrame:(CGRect)a3
{
  return (_TtC6SiriTV10SpacerView *)sub_5B474(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC6SiriTV10SpacerView)initWithCoder:(id)a3
{
  return (_TtC6SiriTV10SpacerView *)sub_5B510(a3);
}

@end