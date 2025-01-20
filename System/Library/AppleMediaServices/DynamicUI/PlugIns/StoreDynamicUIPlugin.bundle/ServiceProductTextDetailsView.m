@interface ServiceProductTextDetailsView
- (CGSize)sizeThatFits:(CGSize)a3;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView)initWithCoder:(id)a3;
- (_TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView)initWithFrame:(CGRect)a3;
- (void)didTapPrimaryButton:(id)a3;
- (void)didTapSecondaryButton:(id)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ServiceProductTextDetailsView

- (_TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView)initWithFrame:(CGRect)a3
{
  return (_TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView *)sub_95FD0( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (_TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_967E4();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_968E8((uint64_t)a3);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = self;
  double v6 = sub_96A68(width, height);
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
  sub_96B58();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_getObjectType(a4);
  swift_unknownObjectRetain(a4);
  double v8 = self;
  double v9 = sub_979FC((uint64_t)a4, width, height);
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

- (void)didTapPrimaryButton:(id)a3
{
}

- (void)didTapSecondaryButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView_badgeWordmark));
  sub_118C8(OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView_primaryButton);
  sub_119F4(OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView_primaryButtonHandler);
  sub_118C8(OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView_secondaryButton);
  sub_119F4(OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView_secondaryButtonHandler);
  sub_118C8(OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView____lazy_storage___bodyLabel);
  sub_118C8(OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView____lazy_storage___footnoteLabel);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView____lazy_storage___titleLabel));
}

@end