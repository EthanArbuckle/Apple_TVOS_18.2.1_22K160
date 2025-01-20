@interface TVMLMonogramRow
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC7TVMusic15TVMLMonogramRow)initWithCoder:(id)a3;
- (_TtC7TVMusic15TVMLMonogramRow)initWithFrame:(CGRect)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
@end

@implementation TVMLMonogramRow

- (_TtC7TVMusic15TVMLMonogramRow)initWithFrame:(CGRect)a3
{
  return (_TtC7TVMusic15TVMLMonogramRow *)sub_100155CDC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7TVMusic15TVMLMonogramRow)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10015D58C();
}

  ;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100155EB0();
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_100156A40(v6, v7);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  sub_100156C80(width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC7TVMusic15TVMLMonogramRow_lockupViews));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC7TVMusic15TVMLMonogramRow_layoutItems));
}

@end