@interface CarouselItemLockupOverlay
- (BOOL)canBecomeFocused;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC6Arcade25CarouselItemLockupOverlay)initWithCoder:(id)a3;
- (_TtC6Arcade25CarouselItemLockupOverlay)initWithFrame:(CGRect)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation CarouselItemLockupOverlay

- (_TtC6Arcade25CarouselItemLockupOverlay)initWithFrame:(CGRect)a3
{
  return result;
}

- (_TtC6Arcade25CarouselItemLockupOverlay)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100135244();
}

  ;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10013498C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6Arcade25CarouselItemLockupOverlay_focusGuide);
  v6 = self;
  objc_msgSend(v5, "_setManualLayoutFrame:", 0.0, 0.0, width, height);
  sub_100134B9C(1, v13, v7);
  double v8 = sub_10013404C((uint64_t)v13, width, height);
  double v10 = v9;
  _s6Arcade17PillOverlayLayoutVwxx_0(v13);

  double v11 = fmax(v10, 100.0);
  double v12 = v8;
  result.double height = v11;
  result.double width = v12;
  return result;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for CarouselItemLockupOverlay();
  id v6 = a3;
  id v7 = a4;
  double v8 = (char *)v11.receiver;
  -[CarouselItemLockupOverlay didUpdateFocusInContext:withAnimationCoordinator:]( &v11,  "didUpdateFocusInContext:withAnimationCoordinator:",  v6,  v7);
  double v9 = *(void **)&v8[OBJC_IVAR____TtC6Arcade25CarouselItemLockupOverlay_floatingView];
  else {
    uint64_t v10 = 0LL;
  }
  [v9 setControlState:v10 withAnimationCoordinator:v7];
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v7 = sub_100006028(0LL, (unint64_t *)&qword_1002DD600, &OBJC_CLASS___UIPress_ptr);
  unint64_t v8 = sub_10006B6B4();
  uint64_t v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  id v10 = a4;
  objc_super v11 = self;
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  v13.receiver = v11;
  v13.super_class = (Class)type metadata accessor for CarouselItemLockupOverlay();
  -[CarouselItemLockupOverlay pressesBegan:withEvent:](&v13, "pressesBegan:withEvent:", isa, v10);

  [*(id *)((char *)&v11->super.super.super.isa + OBJC_IVAR____TtC6Arcade25CarouselItemLockupOverlay_floatingView) setControlState:0 animated:1];
  swift_bridgeObjectRelease(v9);
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v7 = sub_100006028(0LL, (unint64_t *)&qword_1002DD600, &OBJC_CLASS___UIPress_ptr);
  unint64_t v8 = sub_10006B6B4();
  uint64_t v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  id v10 = a4;
  objc_super v11 = self;
  sub_100134FE4(v9, (uint64_t)a4);

  swift_bridgeObjectRelease(v9);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade25CarouselItemLockupOverlay_focusGuide));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade25CarouselItemLockupOverlay_floatingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade25CarouselItemLockupOverlay_materialBackground));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade25CarouselItemLockupOverlay_smallLockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade25CarouselItemLockupOverlay_chevronView));
  sub_10000D3D8( *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6Arcade25CarouselItemLockupOverlay_selectionHandler),  *(void *)&self->focusGuide[OBJC_IVAR____TtC6Arcade25CarouselItemLockupOverlay_selectionHandler]);
}

@end