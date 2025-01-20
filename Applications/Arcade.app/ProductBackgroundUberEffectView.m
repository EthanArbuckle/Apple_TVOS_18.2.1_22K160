@interface ProductBackgroundUberEffectView
- (_TtC6Arcade31ProductBackgroundUberEffectView)initWithCoder:(id)a3;
- (_TtC6Arcade31ProductBackgroundUberEffectView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ProductBackgroundUberEffectView

- (_TtC6Arcade31ProductBackgroundUberEffectView)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade31ProductBackgroundUberEffectView *)sub_100149C04( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (_TtC6Arcade31ProductBackgroundUberEffectView)initWithCoder:(id)a3
{
  result = (_TtC6Arcade31ProductBackgroundUberEffectView *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100243980LL,  "Arcade/ProductBackgroundUberEffectView.swift",  44LL,  2LL,  44LL,  0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10014A00C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade31ProductBackgroundUberEffectView_layer1));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade31ProductBackgroundUberEffectView_layer2));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade31ProductBackgroundUberEffectView_layer3));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade31ProductBackgroundUberEffectView_maskingView));
}

@end