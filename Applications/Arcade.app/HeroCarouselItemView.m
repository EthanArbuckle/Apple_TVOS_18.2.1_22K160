@interface HeroCarouselItemView
- (BOOL)canBecomeFocused;
- (NSArray)preferredFocusEnvironments;
- (_TtC6Arcade20HeroCarouselItemView)initWithCoder:(id)a3;
- (_TtC6Arcade20HeroCarouselItemView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation HeroCarouselItemView

- (_TtC6Arcade20HeroCarouselItemView)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade20HeroCarouselItemView *)sub_10004EC84(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC6Arcade20HeroCarouselItemView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10004FAE0();
}

  ;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (NSArray)preferredFocusEnvironments
{
  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC6Arcade20HeroCarouselItemView_overlayView);
  id v3 = self;
  id v4 = [v2 preferredFocusEnvironments];
  uint64_t v5 = sub_1000031E8((uint64_t *)&unk_1002DF9C0);
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v4, v5);

  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  return (NSArray *)isa;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10004EFD8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade20HeroCarouselItemView_focusGuide));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC6Arcade20HeroCarouselItemView_heroCarouselItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade20HeroCarouselItemView_contentBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade20HeroCarouselItemView_overlayView));
}

@end