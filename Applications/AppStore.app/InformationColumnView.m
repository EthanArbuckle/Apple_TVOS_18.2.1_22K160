@interface InformationColumnView
- (_TtC8AppStore21InformationColumnView)initWithCoder:(id)a3;
- (_TtC8AppStore21InformationColumnView)initWithFrame:(CGRect)a3;
- (int64_t)overrideUserInterfaceStyle;
- (void)layoutSubviews;
- (void)setOverrideUserInterfaceStyle:(int64_t)a3;
@end

@implementation InformationColumnView

- (int64_t)overrideUserInterfaceStyle
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  return -[InformationColumnView overrideUserInterfaceStyle](&v3, "overrideUserInterfaceStyle");
}

- (void)setOverrideUserInterfaceStyle:(int64_t)a3
{
  v4 = self;
  sub_1000CAB14(a3);
}

- (_TtC8AppStore21InformationColumnView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore21InformationColumnView *)sub_1000CB080(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore21InformationColumnView)initWithCoder:(id)a3
{
  result = (_TtC8AppStore21InformationColumnView *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100247230LL,  "AppStore/InformationColumnView.swift",  36LL,  2LL,  60LL,  0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000CB364();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore21InformationColumnView_annotations));
}

@end