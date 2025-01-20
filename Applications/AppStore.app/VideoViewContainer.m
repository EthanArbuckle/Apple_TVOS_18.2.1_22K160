@interface VideoViewContainer
- (_TtC8AppStore18VideoViewContainer)initWithCoder:(id)a3;
- (_TtC8AppStore18VideoViewContainer)initWithFrame:(CGRect)a3;
- (double)_continuousCornerRadius;
- (double)_cornerRadius;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)_setCornerRadius:(double)a3;
- (void)layoutSubviews;
@end

@implementation VideoViewContainer

- (_TtC8AppStore18VideoViewContainer)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore18VideoViewContainer_roundedCorners) = (Class)-1LL;
  id v5 = a3;

  result = (_TtC8AppStore18VideoViewContainer *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100247230LL,  "AppStore/VideoViewContainer.swift",  33LL,  2LL,  31LL,  0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1001AE538();
}

- (double)_cornerRadius
{
  return result;
}

- (void)_setCornerRadius:(double)a3
{
}

- (double)_continuousCornerRadius
{
  return result;
}

- (void)_setContinuousCornerRadius:(double)a3
{
}

- (_TtC8AppStore18VideoViewContainer)initWithFrame:(CGRect)a3
{
  double result = (_TtC8AppStore18VideoViewContainer *)_swift_stdlib_reportUnimplementedInitializer( "AppStore.VideoViewContainer",  27LL,  "init(frame:)",  12LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end