@interface SearchButton
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC6Arcade12SearchButton)initWithFrame:(CGRect)a3;
- (double)lastBaselineFromBottom;
- (void)layoutSubviews;
- (void)tintColorDidChange;
@end

@implementation SearchButton

- (void)layoutSubviews
{
  v2 = self;
  sub_10006C884();
}

- (CGSize)intrinsicContentSize
{
  double v2 = 70.0;
  double v3 = 70.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double v4 = 70.0;
  double v5 = 0.0;
  double v6 = 70.0;
  double v7 = 70.0;
  result.var3 = v5;
  result.var2 = v7;
  result.var1 = v6;
  result.var0 = v4;
  return result;
}

- (double)lastBaselineFromBottom
{
  return 0.0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = 70.0;
  double v4 = 70.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)tintColorDidChange
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType(self);
  id v2 = v7.receiver;
  -[SearchButton tintColorDidChange](&v7, "tintColorDidChange");
  id v3 = objc_msgSend(v2, "tintColor", v7.receiver, v7.super_class);
  if (v3)
  {
    double v4 = v3;
    char v5 = UIColor.isDark.getter();

    if ((v5 & 1) != 0) {
      uint64_t v6 = 1LL;
    }
    else {
      uint64_t v6 = 2LL;
    }
  }

  else
  {
    uint64_t v6 = 1LL;
  }

  [v2 setOverrideUserInterfaceStyle:v6];
}

- (_TtC6Arcade12SearchButton)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC6Arcade12SearchButton *)_swift_stdlib_reportUnimplementedInitializer( "Arcade.SearchButton",  19LL,  "init(frame:)",  12LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC6Arcade12SearchButton_objectGraph));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade12SearchButton_backgroundEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade12SearchButton_imageView));
}

@end