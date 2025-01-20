@interface ProductLayout
- (_TtC6Arcade13ProductLayout)init;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (void)prepareLayout;
@end

@implementation ProductLayout

- (_TtC6Arcade13ProductLayout)init
{
  return (_TtC6Arcade13ProductLayout *)sub_1000B9614();
}

- (void)prepareLayout
{
  v2 = self;
  sub_1000B972C();
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  v8 = sub_1000B9918(x, y, width, height);

  if (v8)
  {
    sub_1000B9B2C();
    v9.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v8);
  }

  else
  {
    v9.super.isa = 0LL;
  }

  return v9.super.isa;
}

- (void).cxx_destruct
{
}

@end