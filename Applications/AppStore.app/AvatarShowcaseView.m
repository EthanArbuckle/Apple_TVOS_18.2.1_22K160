@interface AvatarShowcaseView
- (_TtC8AppStore18AvatarShowcaseView)initWithCoder:(id)a3;
- (_TtC8AppStore18AvatarShowcaseView)initWithFrame:(CGRect)a3;
@end

@implementation AvatarShowcaseView

- (_TtC8AppStore18AvatarShowcaseView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore18AvatarShowcaseView_artworkLoader) = 0LL;
  id v4 = a3;

  result = (_TtC8AppStore18AvatarShowcaseView *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100247230LL,  "AppStore/AvatarShowcaseView.swift",  33LL,  2LL,  37LL,  0);
  __break(1u);
  return result;
}

- (_TtC8AppStore18AvatarShowcaseView)initWithFrame:(CGRect)a3
{
  result = (_TtC8AppStore18AvatarShowcaseView *)_swift_stdlib_reportUnimplementedInitializer( "AppStore.AvatarShowcaseView",  27LL,  "init(frame:)",  12LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC8AppStore18AvatarShowcaseView_layoutConfiguration;
  uint64_t v4 = type metadata accessor for AvatarShowcaseLayoutConfiguration(0LL, a2);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore18AvatarShowcaseView_artworkLoader));
}

@end