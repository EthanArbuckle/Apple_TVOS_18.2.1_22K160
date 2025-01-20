@interface ServiceWelcomePageView
- (CGSize)sizeThatFits:(CGSize)a3;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC20StoreDynamicUIPlugin22ServiceWelcomePageView)initWithCoder:(id)a3;
- (_TtC20StoreDynamicUIPlugin22ServiceWelcomePageView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ServiceWelcomePageView

- (_TtC20StoreDynamicUIPlugin22ServiceWelcomePageView)initWithFrame:(CGRect)a3
{
  return (_TtC20StoreDynamicUIPlugin22ServiceWelcomePageView *)sub_A0F28( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (_TtC20StoreDynamicUIPlugin22ServiceWelcomePageView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_A10AC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_A1138();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  sub_A12C4((uint64_t)a4, width, height);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  swift_unknownObjectRelease(a4);

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.var3 = v20;
  result.var2 = v19;
  result.var1 = v18;
  result.var0 = v17;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  sub_A18DC();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceWelcomePageView_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceWelcomePageView_featureListView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceWelcomePageView_footerView));
}

@end