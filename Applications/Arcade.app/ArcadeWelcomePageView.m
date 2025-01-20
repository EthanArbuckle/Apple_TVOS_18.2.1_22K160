@interface ArcadeWelcomePageView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC6Arcade21ArcadeWelcomePageView)initWithCoder:(id)a3;
- (_TtC6Arcade21ArcadeWelcomePageView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ArcadeWelcomePageView

- (_TtC6Arcade21ArcadeWelcomePageView)initWithCoder:(id)a3
{
  *(void *)&self->layoutMetrics[OBJC_IVAR____TtC6Arcade21ArcadeWelcomePageView_delegate] = 0LL;
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtC6Arcade21ArcadeWelcomePageView *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100243980LL,  "Arcade/ArcadeWelcomePageView.swift",  34LL,  2LL,  51LL,  0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100015324();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  double v9 = sub_10001555C((uint64_t)a4, width, height);
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

- (_TtC6Arcade21ArcadeWelcomePageView)initWithFrame:(CGRect)a3
{
  JUMeasurements result = (_TtC6Arcade21ArcadeWelcomePageView *)_swift_stdlib_reportUnimplementedInitializer( "Arcade.ArcadeWelcomePageView",  28LL,  "init(frame:)",  12LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100015AE0((Class *)((char *)&self->super.super.super.isa
                        + OBJC_IVAR____TtC6Arcade21ArcadeWelcomePageView_layoutMetrics));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade21ArcadeWelcomePageView_continueButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade21ArcadeWelcomePageView_backgroundMaterialView));
  sub_100015B48((uint64_t)self + OBJC_IVAR____TtC6Arcade21ArcadeWelcomePageView_delegate);
}

@end