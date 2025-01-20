@interface BundleTwoPanelTextDetailsView
- (CGSize)sizeThatFits:(CGSize)a3;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC20StoreDynamicUIPlugin29BundleTwoPanelTextDetailsView)initWithCoder:(id)a3;
- (_TtC20StoreDynamicUIPlugin29BundleTwoPanelTextDetailsView)initWithFrame:(CGRect)a3;
- (void)didTapButton:(id)a3;
- (void)layoutSubviews;
@end

@implementation BundleTwoPanelTextDetailsView

- (_TtC20StoreDynamicUIPlugin29BundleTwoPanelTextDetailsView)initWithFrame:(CGRect)a3
{
  return (_TtC20StoreDynamicUIPlugin29BundleTwoPanelTextDetailsView *)sub_3CA48( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (_TtC20StoreDynamicUIPlugin29BundleTwoPanelTextDetailsView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_3CD8C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  double v6 = sub_3D62C(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_3D718();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_getObjectType(a4);
  swift_unknownObjectRetain(a4);
  double v8 = self;
  double v9 = sub_3E4F4((uint64_t)a4, width, height);
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

- (void)didTapButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_3E32C(v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin29BundleTwoPanelTextDetailsView_badgeLabel));
  sub_118C8(OBJC_IVAR____TtC20StoreDynamicUIPlugin29BundleTwoPanelTextDetailsView_descriptionLabel);
  sub_118C8(OBJC_IVAR____TtC20StoreDynamicUIPlugin29BundleTwoPanelTextDetailsView_disclaimerLabel);
  sub_118C8(OBJC_IVAR____TtC20StoreDynamicUIPlugin29BundleTwoPanelTextDetailsView_titleLabel);
  sub_ACC4( (uint64_t)self + OBJC_IVAR____TtC20StoreDynamicUIPlugin29BundleTwoPanelTextDetailsView_titleLabelBox,  &qword_F5108);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end