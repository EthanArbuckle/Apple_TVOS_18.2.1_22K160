@interface SplashScreenConfirmView
- (_TtC8FaceTime23SplashScreenConfirmView)initWithCoder:(id)a3;
- (_TtC8FaceTime23SplashScreenConfirmView)initWithFrame:(CGRect)a3;
- (void)didMoveToSuperview;
@end

@implementation SplashScreenConfirmView

- (void)didMoveToSuperview
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SplashScreenConfirmView((uint64_t)self, (uint64_t)a2);
  v2 = (char *)v4.receiver;
  -[SplashScreenConfirmView didMoveToSuperview](&v4, "didMoveToSuperview");
  id v3 =  objc_msgSend( *(id *)&v2[OBJC_IVAR____TtC8FaceTime23SplashScreenConfirmView_packageView],  "layer",  v4.receiver,  v4.super_class);
  [v3 setBeginTime:CACurrentMediaTime() + 0.25];
}

- (_TtC8FaceTime23SplashScreenConfirmView)initWithCoder:(id)a3
{
  result = (_TtC8FaceTime23SplashScreenConfirmView *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000001000D8750LL,  "FaceTime/SplashScreenConfirmView.swift",  38LL,  2LL,  75LL,  0);
  __break(1u);
  return result;
}

- (_TtC8FaceTime23SplashScreenConfirmView)initWithFrame:(CGRect)a3
{
  result = (_TtC8FaceTime23SplashScreenConfirmView *)_swift_stdlib_reportUnimplementedInitializer( "FaceTime.SplashScreenConfirmView",  32LL,  "init(frame:)",  12LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime23SplashScreenConfirmView_packageView));
}

@end