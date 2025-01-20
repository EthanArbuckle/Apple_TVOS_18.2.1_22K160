@interface ArticleCardTextView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC8AppStore19ArticleCardTextView)initWithCoder:(id)a3;
- (_TtC8AppStore19ArticleCardTextView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ArticleCardTextView

- (_TtC8AppStore19ArticleCardTextView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore19ArticleCardTextView *)sub_100142978(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore19ArticleCardTextView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10014420C((uint64_t)v3, v4);
}

  ;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100143230();
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType(self);
  id v4 = a3;
  id v5 = v6.receiver;
  -[ArticleCardTextView traitCollectionDidChange:](&v6, "traitCollectionDidChange:", v4);
  sub_100142C4C();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_getObjectType(a4);
  swift_unknownObjectRetain(a4);
  v8 = self;
  double v9 = sub_100144090((uint64_t)a4, (uint64_t)v8, width, height);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  swift_unknownObjectRelease(a4);

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.var3 = v19;
  result.var2 = v18;
  result.var1 = v17;
  result.var0 = v16;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore19ArticleCardTextView_descriptionLabel));
  sub_10000B43C((Class *)((char *)&self->super.super.super.isa
                        + OBJC_IVAR____TtC8AppStore19ArticleCardTextView_layoutMetrics));
  sub_1000D6DF4((uint64_t)self + OBJC_IVAR____TtC8AppStore19ArticleCardTextView_config);
}

@end