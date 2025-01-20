@interface InformationColumnView
- (_TtC6Arcade21InformationColumnView)initWithCoder:(id)a3;
- (_TtC6Arcade21InformationColumnView)initWithFrame:(CGRect)a3;
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
  sub_1000C4408(a3);
}

- (_TtC6Arcade21InformationColumnView)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade21InformationColumnView *)sub_1000C475C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC6Arcade21InformationColumnView)initWithCoder:(id)a3
{
  result = (_TtC6Arcade21InformationColumnView *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100243980LL,  "Arcade/InformationColumnView.swift",  34LL,  2LL,  60LL,  0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000C4A40();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC6Arcade21InformationColumnView_annotations));
}

@end