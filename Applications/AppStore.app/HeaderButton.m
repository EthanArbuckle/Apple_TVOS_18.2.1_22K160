@interface HeaderButton
- (_TtC8AppStore12HeaderButton)init;
- (_TtC8AppStore12HeaderButton)initWithFrame:(CGRect)a3;
@end

@implementation HeaderButton

- (_TtC8AppStore12HeaderButton)init
{
  return (_TtC8AppStore12HeaderButton *)sub_100029FCC();
}

- (_TtC8AppStore12HeaderButton)initWithFrame:(CGRect)a3
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