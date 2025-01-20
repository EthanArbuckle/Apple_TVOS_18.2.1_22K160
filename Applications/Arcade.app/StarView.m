@interface StarView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC6Arcade8StarView)initWithCoder:(id)a3;
- (_TtC6Arcade8StarView)initWithFrame:(CGRect)a3;
- (_TtC6Arcade8StarView)initWithImage:(id)a3;
- (_TtC6Arcade8StarView)initWithImage:(id)a3 highlightedImage:(id)a4;
@end

@implementation StarView

- (_TtC6Arcade8StarView)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade8StarView *)sub_10013C94C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC6Arcade8StarView)initWithCoder:(id)a3
{
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6Arcade8StarView_state) = 0;
  id v4 = a3;

  result = (_TtC6Arcade8StarView *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100243980LL,  "Arcade/StarView.swift",  21LL,  2LL,  57LL,  0);
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v3 = qword_1002DCD18;
  id v4 = self;
  if (v3 != -1) {
    swift_once(&qword_1002DCD18, sub_10013C894);
  }
  unsigned __int128 v5 = xmmword_1002F0AB0;

  *(void *)&double v7 = v5 >> 64;
  *(void *)&double v6 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (_TtC6Arcade8StarView)initWithImage:(id)a3
{
  id v3 = a3;
  CGSize result = (_TtC6Arcade8StarView *)_swift_stdlib_reportUnimplementedInitializer( "Arcade.StarView",  15LL,  "init(image:)",  12LL,  0LL);
  __break(1u);
  return result;
}

- (_TtC6Arcade8StarView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  CGSize result = (_TtC6Arcade8StarView *)_swift_stdlib_reportUnimplementedInitializer( "Arcade.StarView",  15LL,  "init(image:highlightedImage:)",  29LL,  0LL);
  __break(1u);
  return result;
}

@end