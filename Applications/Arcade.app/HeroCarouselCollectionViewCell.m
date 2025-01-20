@interface HeroCarouselCollectionViewCell
- (BOOL)canBecomeFocused;
- (_TtC6Arcade30HeroCarouselCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)carouselView:(id)a3 cellForItemAtIndex:(int64_t)a4;
- (int64_t)indexForPreferredCenteredViewInCarouselView:(id)a3;
- (int64_t)numberOfItemsInCarouselView:(id)a3;
- (void)carouselView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndex:(int64_t)a5;
- (void)carouselView:(id)a3 didFocusItemAtIndex:(int64_t)a4;
- (void)carouselView:(id)a3 willDisplayCell:(id)a4 forItemAtIndex:(int64_t)a5;
- (void)carouselViewDidScroll:(id)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation HeroCarouselCollectionViewCell

- (_TtC6Arcade30HeroCarouselCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade30HeroCarouselCollectionViewCell *)sub_1001C0A54( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1001C191C();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1001C1EE8();
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1001C21E8(v6, v7);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade30HeroCarouselCollectionViewCell_focusGuide));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade30HeroCarouselCollectionViewCell_leadingArrow));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade30HeroCarouselCollectionViewCell_trailingArrow));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade30HeroCarouselCollectionViewCell_carouselView));
  sub_100006060( (uint64_t)self + OBJC_IVAR____TtC6Arcade30HeroCarouselCollectionViewCell_heroCarousel,  (uint64_t *)&unk_1002EB6C0);
  sub_100006060((uint64_t)self + OBJC_IVAR____TtC6Arcade30HeroCarouselCollectionViewCell_stateLens, &qword_1002EB698);
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC6Arcade30HeroCarouselCollectionViewCell_impressionsCalculator);
  sub_10000D3D8( *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR____TtC6Arcade30HeroCarouselCollectionViewCell_impressionsUpdateBlock),  *(void *)&self->super.state[OBJC_IVAR____TtC6Arcade30HeroCarouselCollectionViewCell_impressionsUpdateBlock]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade30HeroCarouselCollectionViewCell_previouslyFocusedCarouselItemView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade30HeroCarouselCollectionViewCell_focusedCarouselItemView));
  v3 = (char *)self + OBJC_IVAR____TtC6Arcade30HeroCarouselCollectionViewCell_autoScrollConfiguration;
  uint64_t v4 = type metadata accessor for AutoScrollConfiguration(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  sub_100006060( (uint64_t)self + OBJC_IVAR____TtC6Arcade30HeroCarouselCollectionViewCell_currentTitleEffect,  (uint64_t *)&unk_1002EA730);
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC6Arcade30HeroCarouselCollectionViewCell_onUpdatePageTitleEffect));
  sub_1000087D8((uint64_t)self + OBJC_IVAR____TtC6Arcade30HeroCarouselCollectionViewCell_playbackId);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC6Arcade30HeroCarouselCollectionViewCell_visibilityTrackingView);
}

- (int64_t)numberOfItemsInCarouselView:(id)a3
{
  id v4 = a3;
  v5 = self;
  int64_t v6 = sub_1001C4844();

  return v6;
}

- (id)carouselView:(id)a3 cellForItemAtIndex:(int64_t)a4
{
  id v6 = a3;
  id v7 = self;
  v8 = (void *)sub_1001C49EC(v6, a4);

  return v8;
}

- (void)carouselView:(id)a3 willDisplayCell:(id)a4 forItemAtIndex:(int64_t)a5
{
  id v8 = a3;
  v9 = (uint64_t (*)(char *, uint64_t))a4;
  v10 = self;
  sub_1001C4AE0(v9, a5);
}

- (void)carouselView:(id)a3 didFocusItemAtIndex:(int64_t)a4
{
  id v6 = a3;
  id v7 = self;
  sub_1001C4EE0(a4);
}

- (void)carouselView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndex:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_1001C5070(v8);
}

- (void)carouselViewDidScroll:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1001C31D4(v4);
}

- (int64_t)indexForPreferredCenteredViewInCarouselView:(id)a3
{
  id v4 = a3;
  v5 = self;
  int64_t v6 = sub_1001C536C();

  return v6;
}

@end