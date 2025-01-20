@interface IconRowView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC8AppStore11IconRowView)initWithCoder:(id)a3;
- (_TtC8AppStore11IconRowView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation IconRowView

- (_TtC8AppStore11IconRowView)initWithCoder:(id)a3
{
  result = (_TtC8AppStore11IconRowView *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100247230LL,  "AppStore/IconRowView.swift",  26LL,  2LL,  47LL,  0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000EB570();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v8 = type metadata accessor for IconRowViewLayout.Metrics(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __n128 v10 = __chkstk_darwin(v8);
  v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for IconRowViewLayout(0LL, v10);
  uint64_t v14 = *(void *)(v13 - 8);
  __n128 v15 = __chkstk_darwin(v13);
  v17 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, char *, uint64_t, __n128))(v9 + 16))( v12,  (char *)self + OBJC_IVAR____TtC8AppStore11IconRowView_layoutMetrics,  v8,  v15);
  uint64_t v18 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore11IconRowView_iconViews);
  swift_unknownObjectRetain(a4);
  v19 = self;
  uint64_t v20 = sub_1000CA710(v18);
  IconRowViewLayout.init(metrics:iconViews:)(v12, v20);
  double v21 = IconRowViewLayout.measurements(fitting:in:)(a4, width, height);
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
  swift_unknownObjectRelease(a4);

  double v28 = v21;
  double v29 = v23;
  double v30 = v25;
  double v31 = v27;
  result.var3 = v31;
  result.var2 = v30;
  result.var1 = v29;
  result.var0 = v28;
  return result;
}

- (_TtC8AppStore11IconRowView)initWithFrame:(CGRect)a3
{
  JUMeasurements result = (_TtC8AppStore11IconRowView *)_swift_stdlib_reportUnimplementedInitializer( "AppStore.IconRowView",  20LL,  "init(frame:)",  12LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore11IconRowView_iconViews));
  v3 = (char *)self + OBJC_IVAR____TtC8AppStore11IconRowView_layoutMetrics;
  uint64_t v4 = type metadata accessor for IconRowViewLayout.Metrics(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
}

@end