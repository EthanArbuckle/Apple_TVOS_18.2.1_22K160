@interface ArcadeWelcomeItemsView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC8AppStore22ArcadeWelcomeItemsView)initWithCoder:(id)a3;
- (_TtC8AppStore22ArcadeWelcomeItemsView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ArcadeWelcomeItemsView

- (_TtC8AppStore22ArcadeWelcomeItemsView)initWithCoder:(id)a3
{
  result = (_TtC8AppStore22ArcadeWelcomeItemsView *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100247230LL,  "AppStore/ArcadeWelcomeItemsView.swift",  37LL,  2LL,  29LL,  0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000BF4E8();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  sub_100014198((uint64_t)self + OBJC_IVAR____TtC8AppStore22ArcadeWelcomeItemsView_layoutMetrics, (uint64_t)v26);
  v8 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8AppStore22ArcadeWelcomeItemsView_itemViews);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8AppStore22ArcadeWelcomeItemsView_itemViews, &v25, 0LL, 0LL);
  uint64_t v9 = *v8;
  swift_unknownObjectRetain(a4);
  v10 = self;
  uint64_t v11 = swift_bridgeObjectRetain(v9);
  uint64_t v12 = sub_1000CA6EC(v11);
  swift_bridgeObjectRelease(v9);
  v26[10] = v12;
  ArcadeWelcomeItemsViewLayout.measurements(fitting:in:)((uint64_t)a4, width, height);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  sub_1000BF7B0(v26);
  swift_unknownObjectRelease(a4);

  double v21 = v14;
  double v22 = v16;
  double v23 = v18;
  double v24 = v20;
  result.var3 = v24;
  result.var2 = v23;
  result.var1 = v22;
  result.var0 = v21;
  return result;
}

- (_TtC8AppStore22ArcadeWelcomeItemsView)initWithFrame:(CGRect)a3
{
  JUMeasurements result = (_TtC8AppStore22ArcadeWelcomeItemsView *)_swift_stdlib_reportUnimplementedInitializer( "AppStore.ArcadeWelcomeItemsView",  31LL,  "init(frame:)",  12LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000141D4((Class *)((char *)&self->super.super.super.isa
                        + OBJC_IVAR____TtC8AppStore22ArcadeWelcomeItemsView_layoutMetrics));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore22ArcadeWelcomeItemsView_itemViews));
}

@end