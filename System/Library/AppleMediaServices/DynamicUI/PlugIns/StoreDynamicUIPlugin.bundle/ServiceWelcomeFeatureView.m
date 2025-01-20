@interface ServiceWelcomeFeatureView
- (CGSize)sizeThatFits:(CGSize)a3;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC20StoreDynamicUIPlugin25ServiceWelcomeFeatureView)initWithCoder:(id)a3;
- (_TtC20StoreDynamicUIPlugin25ServiceWelcomeFeatureView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ServiceWelcomeFeatureView

- (_TtC20StoreDynamicUIPlugin25ServiceWelcomeFeatureView)initWithFrame:(CGRect)a3
{
  return (_TtC20StoreDynamicUIPlugin25ServiceWelcomeFeatureView *)sub_9CFC8( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (_TtC20StoreDynamicUIPlugin25ServiceWelcomeFeatureView)initWithCoder:(id)a3
{
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_9D50C((uint64_t)a3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_9D63C();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_getObjectType(a4);
  swift_unknownObjectRetain(a4);
  v8 = self;
  double v9 = sub_9DEF4((uint64_t)a4, width, height);
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

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = self;
  double v6 = sub_9DD9C(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin25ServiceWelcomeFeatureView_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin25ServiceWelcomeFeatureView_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin25ServiceWelcomeFeatureView_titleLabel));
}

@end