@interface ServiceDetailView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC20StoreDynamicUIPlugin17ServiceDetailView)init;
- (_TtC20StoreDynamicUIPlugin17ServiceDetailView)initWithCoder:(id)a3;
- (_TtC20StoreDynamicUIPlugin17ServiceDetailView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ServiceDetailView

- (_TtC20StoreDynamicUIPlugin17ServiceDetailView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_84EC8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_8519C();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  v6 = self;
  double v7 = sub_85370((uint64_t)a4);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  swift_unknownObjectRelease(a4);

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.var3 = v17;
  result.var2 = v16;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

- (_TtC20StoreDynamicUIPlugin17ServiceDetailView)init
{
}

- (_TtC20StoreDynamicUIPlugin17ServiceDetailView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  sub_AC90( *(void *)&self->AMSUICommonView_opaque[OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_applyCachedArtwork],  *(void *)&self->artworkImageView[OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_applyCachedArtwork]);
}

@end