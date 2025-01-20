@interface CarouselItemButtonOverlay
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)accessibilityLabel;
- (_TtC8AppStore25CarouselItemButtonOverlay)initWithCoder:(id)a3;
- (_TtC8AppStore25CarouselItemButtonOverlay)initWithFrame:(CGRect)a3;
- (unint64_t)accessibilityTraits;
- (void)layoutSubviews;
- (void)setAccessibilityLabel:(id)a3;
- (void)setAccessibilityTraits:(unint64_t)a3;
- (void)setIsAccessibilityElement:(BOOL)a3;
@end

@implementation CarouselItemButtonOverlay

- (_TtC8AppStore25CarouselItemButtonOverlay)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore25CarouselItemButtonOverlay *)sub_1000613E0( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (_TtC8AppStore25CarouselItemButtonOverlay)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000649D8();
}

  ;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000620B4();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  sub_100062290(1, v11);
  double v6 = sub_100138264(v11, width, height);
  double v8 = v7;
  _s8AppStore17PillOverlayLayoutVwxx_0(v11);

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (NSString)accessibilityLabel
{
  v2 = self;
  sub_100063CBC();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
  }

  else
  {
    NSString v5 = 0LL;
  }

  return (NSString *)v5;
}

- (void)setAccessibilityLabel:(id)a3
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v5 = v4;
    double v6 = self;
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }

  else
  {
    double v8 = self;
    NSString v7 = 0LL;
  }

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for CarouselItemButtonOverlay(0LL);
  -[CarouselItemButtonOverlay setAccessibilityLabel:](&v9, "setAccessibilityLabel:", v7);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)setIsAccessibilityElement:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CarouselItemButtonOverlay(0LL);
  -[CarouselItemButtonOverlay setIsAccessibilityElement:](&v4, "setIsAccessibilityElement:", v3);
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

- (void)setAccessibilityTraits:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CarouselItemButtonOverlay(0LL);
  -[CarouselItemButtonOverlay setAccessibilityTraits:](&v4, "setAccessibilityTraits:", a3);
}

- (void).cxx_destruct
{
  BOOL v3 = (char *)self + OBJC_IVAR____TtC8AppStore25CarouselItemButtonOverlay_displayOptions;
  uint64_t v4 = type metadata accessor for HeroCarouselItemOverlay.DisplayOptions(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore25CarouselItemButtonOverlay_materialBackground));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore25CarouselItemButtonOverlay_badgeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore25CarouselItemButtonOverlay_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore25CarouselItemButtonOverlay_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore25CarouselItemButtonOverlay_callToActionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore25CarouselItemButtonOverlay_focusGuide));
  sub_10000A450( *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore25CarouselItemButtonOverlay_selectionHandler),  *(void *)&self->materialBackground[OBJC_IVAR____TtC8AppStore25CarouselItemButtonOverlay_selectionHandler]);
}

@end