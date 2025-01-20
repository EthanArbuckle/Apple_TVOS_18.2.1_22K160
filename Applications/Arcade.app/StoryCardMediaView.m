@interface StoryCardMediaView
- (BOOL)hasContent;
- (CGSize)sizeThatFits:(CGSize)a3;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC6Arcade18StoryCardMediaView)initWithCoder:(id)a3;
- (_TtC6Arcade18StoryCardMediaView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation StoryCardMediaView

- (_TtC6Arcade18StoryCardMediaView)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade18StoryCardMediaView *)sub_1001B6C5C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC6Arcade18StoryCardMediaView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001B7A38();
}

  ;
}

- (BOOL)hasContent
{
  id v3 = (uint64_t *)((char *)self + OBJC_IVAR____TtC6Arcade18StoryCardMediaView_config);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC6Arcade18StoryCardMediaView_config, v13, 0LL, 0LL);
  sub_10009F830(v3, (uint64_t)v12);
  sub_10009F830(v12, (uint64_t)v10);
  LODWORD(v3) = v11;
  int8x16_t v4 = vorrq_s8(vorrq_s8(v10[0], v10[2]), vorrq_s8(v10[1], v10[3]));
  int8x8_t v5 = vorr_s8(*(int8x8_t *)v4.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v4, v4, 8uLL));
  v6 = self;
  if ((_DWORD)v3 == 3 && *(void *)&v5 == 0LL)
  {
    BOOL v8 = 0;
  }

  else
  {
    sub_100035420(v10);
    BOOL v8 = 1;
  }

  sub_100035420(v12);

  return v8;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1001B7000();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double width = a3.width;
  uint64_t v7 = qword_1002DD098;
  swift_unknownObjectRetain(a4);
  BOOL v8 = self;
  if (v7 != -1) {
    swift_once(&qword_1002DD098, sub_1001B6C0C);
  }
  uint64_t v9 = type metadata accessor for AspectRatio(0LL);
  sub_1000061F4(v9, (uint64_t)qword_1002F1590);
  double v10 = AspectRatio.height(fromWidth:)(width);
  swift_unknownObjectRelease(a4);

  double v11 = floor(v10);
  double v12 = 0.0;
  double v13 = width;
  double v14 = v11;
  result.var3 = v12;
  result.var2 = v14;
  result.var1 = v11;
  result.var0 = v13;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  uint64_t v4 = qword_1002DD098;
  int8x8_t v5 = self;
  if (v4 != -1) {
    swift_once(&qword_1002DD098, sub_1001B6C0C);
  }
  uint64_t v6 = type metadata accessor for AspectRatio(0LL);
  sub_1000061F4(v6, (uint64_t)qword_1002F1590);
  double v7 = AspectRatio.height(fromWidth:)(width);

  double v8 = floor(v7);
  double v9 = width;
  result.height = v8;
  result.double width = v9;
  return result;
}

- (void).cxx_destruct
{
}

@end