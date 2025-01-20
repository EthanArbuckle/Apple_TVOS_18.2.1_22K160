@interface HeaderButton
- (_TtC6Arcade12HeaderButton)init;
- (_TtC6Arcade12HeaderButton)initWithFrame:(CGRect)a3;
@end

@implementation HeaderButton

- (_TtC6Arcade12HeaderButton)init
{
  return (_TtC6Arcade12HeaderButton *)sub_10002BCA8();
}

- (_TtC6Arcade12HeaderButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for HeaderButton(0LL);
  return -[DynamicTypeButton initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

@end