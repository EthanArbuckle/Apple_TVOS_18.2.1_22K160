@interface FramedMediaCaptionView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC8AppStore22FramedMediaCaptionView)initWithCoder:(id)a3;
- (_TtC8AppStore22FramedMediaCaptionView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation FramedMediaCaptionView

- (_TtC8AppStore22FramedMediaCaptionView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore22FramedMediaCaptionView *)sub_1001C42D0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore22FramedMediaCaptionView)initWithCoder:(id)a3
{
  result = (_TtC8AppStore22FramedMediaCaptionView *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100247230LL,  "AppStore/FramedMediaCaptionView.swift",  37LL,  2LL,  59LL,  0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1001C46A0();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  double v9 = sub_1001C48B4((uint64_t)a4, width, height);
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

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore22FramedMediaCaptionView_ordinalLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore22FramedMediaCaptionView_captionLabel));
}

@end