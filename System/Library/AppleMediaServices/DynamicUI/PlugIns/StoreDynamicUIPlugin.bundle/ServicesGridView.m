@interface ServicesGridView
- (BOOL)hasContent;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC20StoreDynamicUIPlugin16ServicesGridView)init;
- (_TtC20StoreDynamicUIPlugin16ServicesGridView)initWithCoder:(id)a3;
- (_TtC20StoreDynamicUIPlugin16ServicesGridView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ServicesGridView

- (_TtC20StoreDynamicUIPlugin16ServicesGridView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_988E0();
}

- (BOOL)hasContent
{
  v2 = self;
  BOOL v3 = sub_98A10();

  return v3;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_98AA8();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  double v9 = sub_98C30((uint64_t)a4, width, height);
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

- (_TtC20StoreDynamicUIPlugin16ServicesGridView)init
{
}

- (_TtC20StoreDynamicUIPlugin16ServicesGridView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
}

@end