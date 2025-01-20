@interface ProductLockupBadgeView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC6Arcade22ProductLockupBadgeView)initWithCoder:(id)a3;
- (_TtC6Arcade22ProductLockupBadgeView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ProductLockupBadgeView

- (_TtC6Arcade22ProductLockupBadgeView)initWithCoder:(id)a3
{
  result = (_TtC6Arcade22ProductLockupBadgeView *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100243980LL,  "Arcade/ProductLockupBadge.swift",  31LL,  2LL,  149LL,  0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000FECE4();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  sub_1001002CC(width, height);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  swift_unknownObjectRelease(a4);

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.var3 = v20;
  result.var2 = v19;
  result.var1 = v18;
  result.var0 = v17;
  return result;
}

- (_TtC6Arcade22ProductLockupBadgeView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC6Arcade22ProductLockupBadgeView_supplementaryViews));
}

@end