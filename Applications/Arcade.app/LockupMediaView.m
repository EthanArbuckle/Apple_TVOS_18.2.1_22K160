@interface LockupMediaView
- (CGSize)sizeThatFits:(CGSize)a3;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC6Arcade15LockupMediaView)initWithCoder:(id)a3;
- (_TtC6Arcade15LockupMediaView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation LockupMediaView

- (_TtC6Arcade15LockupMediaView)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade15LockupMediaView *)sub_1000AE1AC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC6Arcade15LockupMediaView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000B2E00();
}

  ;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000AE4B0();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_getObjectType(a4);
  swift_unknownObjectRetain(a4);
  v8 = self;
  double v9 = sub_1000B27A4((uint64_t)a4, (uint64_t)v8, width, height);
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
  v5 = self;
  double v6 = sub_1000AE7B8(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC6Arcade15LockupMediaView_handlerKeys));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC6Arcade15LockupMediaView_images));
}

@end