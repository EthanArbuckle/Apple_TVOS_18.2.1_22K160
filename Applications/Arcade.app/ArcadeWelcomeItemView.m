@interface ArcadeWelcomeItemView
- (CGRect)frame;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC6Arcade21ArcadeWelcomeItemView)initWithCoder:(id)a3;
- (_TtC6Arcade21ArcadeWelcomeItemView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setFrame:(CGRect)a3;
@end

@implementation ArcadeWelcomeItemView

- (_TtC6Arcade21ArcadeWelcomeItemView)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade21ArcadeWelcomeItemView *)sub_1000F129C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC6Arcade21ArcadeWelcomeItemView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6Arcade21ArcadeWelcomeItemView_artwork) = 0LL;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6Arcade21ArcadeWelcomeItemView_artworkLoader) = 0LL;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC6Arcade21ArcadeWelcomeItemView_shouldUpdateArtwork) = 0;
  id v4 = a3;

  result = (_TtC6Arcade21ArcadeWelcomeItemView *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100243980LL,  "Arcade/ArcadeWelcomeItemView.swift",  34LL,  2LL,  54LL,  0);
  __break(1u);
  return result;
}

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType(self);
  -[ArcadeWelcomeItemView frame](&v6, "frame");
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
  v7 = self;
  sub_1000F1730(x, y, width, height);
}

- (void)layoutSubviews
{
  double v2 = self;
  sub_1000F1840();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height = a3.height;
  CGFloat width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  v9.n128_f64[0] = width;
  double v10 = sub_1000F1D50((uint64_t)a4, v9, height);
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

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade21ArcadeWelcomeItemView_headlineLabel));

  swift_release(*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6Arcade21ArcadeWelcomeItemView_artwork));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC6Arcade21ArcadeWelcomeItemView_artworkLoader));
}

@end