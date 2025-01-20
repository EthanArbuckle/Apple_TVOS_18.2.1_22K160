@interface GridView
- (CGRect)frame;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC6Arcade8GridView)initWithCoder:(id)a3;
- (_TtC6Arcade8GridView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setFrame:(CGRect)a3;
@end

@implementation GridView

- (_TtC6Arcade8GridView)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade8GridView *)sub_1001E3BA0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC6Arcade8GridView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001E4E58();
}

  ;
}

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType(self);
  -[GridView frame](&v6, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType(self);
  v22.receiver = self;
  v22.super_class = ObjectType;
  v9 = self;
  -[GridView frame](&v22, "frame");
  double v11 = v10;
  double v13 = v12;
  v21.receiver = v9;
  v21.super_class = ObjectType;
  -[GridView setFrame:](&v21, "setFrame:", x, y, width, height);
  v20.receiver = v9;
  v20.super_class = ObjectType;
  -[GridView frame](&v20, "frame");
  if (v11 != v15 || v13 != v14)
  {
    sub_1001E40FC();
    v19.receiver = v9;
    v19.super_class = ObjectType;
    -[GridView frame](&v19, "frame");
    sub_1001E4294(v17, v18);
  }
}

- (void)layoutSubviews
{
  double v2 = self;
  sub_1001E4584();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v8 = (_OWORD *)((char *)self + OBJC_IVAR____TtC6Arcade8GridView_layoutMetrics);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC6Arcade8GridView_layoutMetrics, v17, 0LL, 0LL);
  sub_100158D28(v8, v18);
  uint64_t v9 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6Arcade8GridView_iconViews);
  swift_unknownObjectRetain(a4);
  double v10 = self;
  swift_bridgeObjectRetain(v9);
  uint64_t v12 = sub_10005A46C(v11);
  swift_bridgeObjectRelease(v9);
  uint64_t v19 = v12;
  sub_1001E4E24((uint64_t)v18);
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

- (void).cxx_destruct
{
}

@end