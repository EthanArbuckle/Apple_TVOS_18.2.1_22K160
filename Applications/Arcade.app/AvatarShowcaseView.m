@interface AvatarShowcaseView
- (_TtC6Arcade18AvatarShowcaseView)initWithCoder:(id)a3;
- (_TtC6Arcade18AvatarShowcaseView)initWithFrame:(CGRect)a3;
@end

@implementation AvatarShowcaseView

- (_TtC6Arcade18AvatarShowcaseView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6Arcade18AvatarShowcaseView_artworkLoader) = 0LL;
  id v4 = a3;

  result = (_TtC6Arcade18AvatarShowcaseView *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100243980LL,  "Arcade/AvatarShowcaseView.swift",  31LL,  2LL,  37LL,  0);
  __break(1u);
  return result;
}

- (_TtC6Arcade18AvatarShowcaseView)initWithFrame:(CGRect)a3
{
  result = (_TtC6Arcade18AvatarShowcaseView *)_swift_stdlib_reportUnimplementedInitializer( "Arcade.AvatarShowcaseView",  25LL,  "init(frame:)",  12LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC6Arcade18AvatarShowcaseView_layoutConfiguration;
  uint64_t v4 = type metadata accessor for AvatarShowcaseLayoutConfiguration(0LL, a2);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC6Arcade18AvatarShowcaseView_artworkLoader));
}

@end