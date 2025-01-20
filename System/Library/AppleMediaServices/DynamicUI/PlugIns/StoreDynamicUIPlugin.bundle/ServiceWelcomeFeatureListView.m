@interface ServiceWelcomeFeatureListView
- (CGSize)sizeThatFits:(CGSize)a3;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC20StoreDynamicUIPlugin29ServiceWelcomeFeatureListView)initWithCoder:(id)a3;
- (_TtC20StoreDynamicUIPlugin29ServiceWelcomeFeatureListView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ServiceWelcomeFeatureListView

- (_TtC20StoreDynamicUIPlugin29ServiceWelcomeFeatureListView)initWithFrame:(CGRect)a3
{
  return (_TtC20StoreDynamicUIPlugin29ServiceWelcomeFeatureListView *)sub_9C4A0( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (_TtC20StoreDynamicUIPlugin29ServiceWelcomeFeatureListView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_9C678();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_9C8DC();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double width = a3.width;
  swift_getObjectType(a4);
  swift_unknownObjectRetain(a4);
  v7 = self;
  double v8 = sub_9CC28((uint64_t)a4, width);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  swift_unknownObjectRelease(a4);

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.var3 = v18;
  result.var2 = v17;
  result.var1 = v16;
  result.var0 = v15;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  double v5 = sub_9CB18(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceWelcomeFeatureListView_featureLeading));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceWelcomeFeatureListView_featureCenter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceWelcomeFeatureListView_featureTrailing));
  sub_9CD9C((Class *)((char *)&self->super.super.super.isa
                    + OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceWelcomeFeatureListView_layoutMetrics));
}

@end