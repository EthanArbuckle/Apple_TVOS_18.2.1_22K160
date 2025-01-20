@interface StarRatingView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC8AppStore14StarRatingView)initWithCoder:(id)a3;
- (_TtC8AppStore14StarRatingView)initWithFrame:(CGRect)a3;
- (double)accessibilityRating;
- (double)lastBaselineFromBottom;
- (void)drawRect:(CGRect)a3;
@end

@implementation StarRatingView

- (_TtC8AppStore14StarRatingView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore14StarRatingView *)sub_10017E300(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore14StarRatingView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore14StarRatingView_overrideFillColor) = 0LL;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore14StarRatingView_overrideEmptyColor) = 0LL;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore14StarRatingView_rating) = 0LL;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore14StarRatingView_starSize) = 1;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore14StarRatingView_showsEmptyStars) = 1;
  id v4 = a3;

  result = (_TtC8AppStore14StarRatingView *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100247230LL,  "AppStore/StarRatingView.swift",  29LL,  2LL,  61LL,  0);
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  sub_10017E670(x, y, width, height);
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  v6 = self;
  double v7 = sub_10017EED8();
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

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = self;
  double v4 = sub_10017F3BC();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (double)lastBaselineFromBottom
{
  double v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore14StarRatingView_starGlyph);
  double v3 = self;
  id v4 = v2;
  double v5 = COERCE_DOUBLE(UIImage.baselineOffsetFromBottom.getter());
  char v7 = v6;

  double result = v5;
  if ((v7 & 1) != 0) {
    return 0.0;
  }
  return result;
}

- (double)accessibilityRating
{
  return *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore14StarRatingView_rating);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore14StarRatingView_overrideEmptyColor));
}

@end