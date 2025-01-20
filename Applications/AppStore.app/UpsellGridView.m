@interface UpsellGridView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC8AppStore14UpsellGridView)initWithCoder:(id)a3;
- (_TtC8AppStore14UpsellGridView)initWithFrame:(CGRect)a3;
- (id)impressionItems;
- (void)layoutSubviews;
@end

@implementation UpsellGridView

- (_TtC8AppStore14UpsellGridView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType(self);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore14UpsellGridView_iconViews) = (Class)&_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore14UpsellGridView_impressionsCalculator) = 0LL;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore14UpsellGridView_amsImpressionItems) = (Class)&_swiftEmptyArrayStorage;
  v15.receiver = self;
  v15.super_class = ObjectType;
  v9 = -[UpsellGridView initWithFrame:](&v15, "initWithFrame:", x, y, width, height);
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  v13 = v9;
  -[UpsellGridView setLayoutMargins:](v13, "setLayoutMargins:", UIEdgeInsetsZero.top, left, bottom, right);
  -[UpsellGridView setClipsToBounds:](v13, "setClipsToBounds:", 1LL);

  return v13;
}

- (_TtC8AppStore14UpsellGridView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore14UpsellGridView_iconViews) = (Class)&_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore14UpsellGridView_impressionsCalculator) = 0LL;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore14UpsellGridView_amsImpressionItems) = (Class)&_swiftEmptyArrayStorage;
  id v4 = a3;

  result = (_TtC8AppStore14UpsellGridView *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100247230LL,  "AppStore/UpsellGridView.swift",  29LL,  2LL,  38LL,  0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1001CD19C();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  uint64_t v8 = qword_1002E10C0;
  swift_unknownObjectRetain(a4);
  v9 = self;
  if (v8 != -1) {
    swift_once(&qword_1002E10C0, sub_1001CCE3C);
  }
  sub_100085DF0((uint64_t)&qword_1002F5668, (uint64_t)v17);
  uint64_t v10 = *(uint64_t *)((char *)&v9->super.super.super.isa + OBJC_IVAR____TtC8AppStore14UpsellGridView_iconViews);
  swift_bridgeObjectRetain(v10);
  uint64_t v12 = sub_1000CA710(v11);
  swift_bridgeObjectRelease(v10);
  v17[7] = v12;
  sub_1001CE10C(v17);
  swift_unknownObjectRelease(a4);

  double v13 = 0.0;
  double v14 = width;
  double v15 = height;
  double v16 = height;
  result.var3 = v13;
  result.var2 = v16;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

- (id)impressionItems
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore14UpsellGridView_amsImpressionItems);
  sub_1001CE0D0();
  swift_bridgeObjectRetain(v2);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return isa;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore14UpsellGridView_iconViews));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore14UpsellGridView_impressionsCalculator));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore14UpsellGridView_amsImpressionItems));
}

@end