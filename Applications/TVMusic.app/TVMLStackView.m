@interface TVMLStackView
- (_TtC7TVMusic13TVMLStackView)initWithCoder:(id)a3;
- (_TtC7TVMusic13TVMLStackView)initWithFrame:(CGRect)a3;
- (double)systemLayoutSizeFittingSize:(double)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5;
@end

@implementation TVMLStackView

- (_TtC7TVMusic13TVMLStackView)initWithFrame:(CGRect)a3
{
  return (_TtC7TVMusic13TVMLStackView *)sub_10013ABB0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7TVMusic13TVMLStackView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10014153C();
}

  ;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10013AD3C();
}

- (double)systemLayoutSizeFittingSize:(double)a3
{
  id v5 = a1;
  sub_10013B4C8(a2, a3);
  double v7 = v6;

  return v7;
}

- (void)setHighlighted:(BOOL)a3
{
  v4 = self;
  sub_10013BA38(a3);
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  id v9 = a5;
  v10 = self;
  sub_10013BB9C(a3, a4, a5);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  double v6 = self;
  sub_10013BFA4(a3, a4);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  id v8 = a5;
  id v9 = self;
  sub_10013C120(a3, a4, (uint64_t)v8);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10013C2CC(v6, v7);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC7TVMusic13TVMLStackView_viewElementMap));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC7TVMusic13TVMLStackView_stackViewElements));
}

@end