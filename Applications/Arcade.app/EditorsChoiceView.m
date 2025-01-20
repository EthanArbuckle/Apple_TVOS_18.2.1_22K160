@interface EditorsChoiceView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC6Arcade17EditorsChoiceView)initWithCoder:(id)a3;
- (_TtC6Arcade17EditorsChoiceView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation EditorsChoiceView

- (_TtC6Arcade17EditorsChoiceView)initWithCoder:(id)a3
{
  result = (_TtC6Arcade17EditorsChoiceView *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100243980LL,  "Arcade/EditorsChoiceView.swift",  30LL,  2LL,  108LL,  0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10015FF2C();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  id v9 = [a4 traitCollection];
  sub_1001601FC((uint64_t)v9, v14, width, height);
  swift_unknownObjectRelease(a4);

  double v10 = v14[12];
  double v11 = v14[13];
  double v12 = v14[14];
  double v13 = v14[15];
  result.var3 = v13;
  result.var2 = v12;
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

- (_TtC6Arcade17EditorsChoiceView)initWithFrame:(CGRect)a3
{
  JUMeasurements result = (_TtC6Arcade17EditorsChoiceView *)_swift_stdlib_reportUnimplementedInitializer( "Arcade.EditorsChoiceView",  24LL,  "init(frame:)",  12LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade17EditorsChoiceView_leadingLaurelImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade17EditorsChoiceView_trailingLaurelImageView));
}

@end