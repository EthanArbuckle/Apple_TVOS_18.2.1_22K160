@interface StarView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8AppStore8StarView)initWithCoder:(id)a3;
- (_TtC8AppStore8StarView)initWithFrame:(CGRect)a3;
- (_TtC8AppStore8StarView)initWithImage:(id)a3;
- (_TtC8AppStore8StarView)initWithImage:(id)a3 highlightedImage:(id)a4;
@end

@implementation StarView

- (_TtC8AppStore8StarView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore8StarView *)sub_10014DDA0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore8StarView)initWithCoder:(id)a3
{
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8AppStore8StarView_state) = 0;
  id v4 = a3;

  result = (_TtC8AppStore8StarView *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100247230LL,  "AppStore/StarView.swift",  23LL,  2LL,  57LL,  0);
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v3 = qword_1002E0D70;
  id v4 = self;
  if (v3 != -1) {
    swift_once(&qword_1002E0D70, sub_10014DCE8);
  }
  unsigned __int128 v5 = xmmword_1002F4B80;

  *(void *)&double v7 = v5 >> 64;
  *(void *)&double v6 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (_TtC8AppStore8StarView)initWithImage:(id)a3
{
  id v3 = a3;
  CGSize result = (_TtC8AppStore8StarView *)_swift_stdlib_reportUnimplementedInitializer( "AppStore.StarView",  17LL,  "init(image:)",  12LL,  0LL);
  __break(1u);
  return result;
}

- (_TtC8AppStore8StarView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  CGSize result = (_TtC8AppStore8StarView *)_swift_stdlib_reportUnimplementedInitializer( "AppStore.StarView",  17LL,  "init(image:highlightedImage:)",  29LL,  0LL);
  __break(1u);
  return result;
}

@end