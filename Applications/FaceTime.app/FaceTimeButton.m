@interface FaceTimeButton
- (BOOL)canBecomeFocused;
- (BOOL)isEnabled;
- (CGSize)intrinsicContentSize;
- (_TtC8FaceTime14FaceTimeButton)initWithCoder:(id)a3;
- (_TtC8FaceTime14FaceTimeButton)initWithFrame:(CGRect)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation FaceTimeButton

- (CGSize)intrinsicContentSize
{
  double v2 = *(double *)((char *)&self->super.super.super.super.super.super.isa
                 + OBJC_IVAR____TtC8FaceTime14FaceTimeButton_size);
  double v3 = *(double *)&self->super.label[OBJC_IVAR____TtC8FaceTime14FaceTimeButton_size];
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)canBecomeFocused
{
  return -[FaceTimeButton isEnabled](self, "isEnabled");
}

- (_TtC8FaceTime14FaceTimeButton)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC8FaceTime14FaceTimeButton____lazy_storage___activityIndicator) = 0LL;
  *(_OWORD *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR____TtC8FaceTime14FaceTimeButton_size) = xmmword_1000C3F80;
  *((_BYTE *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC8FaceTime14FaceTimeButton_isWaitingForCallToStart) = 0;
  id v4 = a3;

  CGSize result = (_TtC8FaceTime14FaceTimeButton *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000001000D8750LL,  "FaceTime/FaceTimeButton.swift",  29LL,  2LL,  123LL,  0);
  __break(1u);
  return result;
}

- (BOOL)isEnabled
{
  return sub_100044DCC( self,  (uint64_t)a2,  (uint64_t (*)(void))type metadata accessor for FaceTimeButton,  (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FaceTimeButton((uint64_t)self, (uint64_t)a2);
  id v4 = v5.receiver;
  -[FaceTimeButton setEnabled:](&v5, "setEnabled:", v3);
  sub_100043EE0();
}

- (_TtC8FaceTime14FaceTimeButton)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC8FaceTime14FaceTimeButton *)_swift_stdlib_reportUnimplementedInitializer( "FaceTime.FaceTimeButton",  23LL,  "init(frame:)",  12LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(void *)&self->super.label[OBJC_IVAR____TtC8FaceTime14FaceTimeButton_viewModel];
  id v4 = *(void **)&self->super.defaultBackgroundColor[OBJC_IVAR____TtC8FaceTime14FaceTimeButton_viewModel];
  objc_super v5 = *(void **)&self->super.highlightedBackgroundColor[OBJC_IVAR____TtC8FaceTime14FaceTimeButton_viewModel];
  v6 = *(void **)&self->super.buttonFont[OBJC_IVAR____TtC8FaceTime14FaceTimeButton_viewModel];
  v7 = *(void **)&self->super.defaultForegroundColor[OBJC_IVAR____TtC8FaceTime14FaceTimeButton_viewModel];

  swift_bridgeObjectRelease(v3);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime14FaceTimeButton____lazy_storage___activityIndicator));
}

@end