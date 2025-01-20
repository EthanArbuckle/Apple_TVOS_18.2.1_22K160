@interface ProductBackgroundUberEffectView
- (_TtC8AppStore31ProductBackgroundUberEffectView)initWithCoder:(id)a3;
- (_TtC8AppStore31ProductBackgroundUberEffectView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ProductBackgroundUberEffectView

- (_TtC8AppStore31ProductBackgroundUberEffectView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore31ProductBackgroundUberEffectView *)sub_10014F884( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (_TtC8AppStore31ProductBackgroundUberEffectView)initWithCoder:(id)a3
{
  result = (_TtC8AppStore31ProductBackgroundUberEffectView *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100247230LL,  "AppStore/ProductBackgroundUberEffectView.swift",  46LL,  2LL,  44LL,  0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10014FC8C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductBackgroundUberEffectView_layer1));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductBackgroundUberEffectView_layer2));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductBackgroundUberEffectView_layer3));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31ProductBackgroundUberEffectView_maskingView));
}

@end