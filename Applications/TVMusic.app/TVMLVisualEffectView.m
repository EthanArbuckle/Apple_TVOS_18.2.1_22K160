@interface TVMLVisualEffectView
- (CGSize)intrinsicContentSize;
- (_TtC7TVMusic20TVMLVisualEffectView)init;
- (_TtC7TVMusic20TVMLVisualEffectView)initWithCoder:(id)a3;
- (_TtC7TVMusic20TVMLVisualEffectView)initWithFrame:(CGRect)a3;
@end

@implementation TVMLVisualEffectView

- (_TtC7TVMusic20TVMLVisualEffectView)init
{
  return -[TVMLVisualEffectView initWithFrame:](self, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
}

- (_TtC7TVMusic20TVMLVisualEffectView)initWithFrame:(CGRect)a3
{
  return (_TtC7TVMusic20TVMLVisualEffectView *)sub_1000F0B94(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7TVMusic20TVMLVisualEffectView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000F2020();
}

  ;
}

- (CGSize)intrinsicContentSize
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7TVMusic20TVMLVisualEffectView_viewLayout);
  if (v2)
  {
    id v3 = self;
    id v4 = v2;
    [v4 width];
    double v6 = v5;
    [v4 height];
    double v8 = v7;
  }

  else
  {
    v13.receiver = self;
    v13.super_class = (Class)swift_getObjectType(self);
    -[TVMLVisualEffectView intrinsicContentSize](&v13, "intrinsicContentSize");
    double v6 = v9;
    double v8 = v10;
  }

  double v11 = v6;
  double v12 = v8;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7TVMusic20TVMLVisualEffectView_visualEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7TVMusic20TVMLVisualEffectView_backgroundView));
}

@end