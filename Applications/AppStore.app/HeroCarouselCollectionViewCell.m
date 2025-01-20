@interface HeroCarouselCollectionViewCell
- (BOOL)canBecomeFocused;
- (_TtC8AppStore30HeroCarouselCollectionViewCell)initWithFrame:(CGRect)a3;
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

- (_TtC8AppStore30HeroCarouselCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore30HeroCarouselCollectionViewCell *)sub_1001C6A08( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1001C78D0();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1001C7E9C();
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1001C819C(v6, v7);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30HeroCarouselCollectionViewCell_focusGuide));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30HeroCarouselCollectionViewCell_leadingArrow));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30HeroCarouselCollectionViewCell_trailingArrow));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30HeroCarouselCollectionViewCell_carouselView));
  sub_1000077E0( (uint64_t)self + OBJC_IVAR____TtC8AppStore30HeroCarouselCollectionViewCell_heroCarousel,  &qword_1002EF720);
  sub_1000077E0((uint64_t)self + OBJC_IVAR____TtC8AppStore30HeroCarouselCollectionViewCell_stateLens, &qword_1002EF6F8);
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC8AppStore30HeroCarouselCollectionViewCell_impressionsCalculator);
  sub_10000A450( *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR____TtC8AppStore30HeroCarouselCollectionViewCell_impressionsUpdateBlock),  *(void *)&self->super.state[OBJC_IVAR____TtC8AppStore30HeroCarouselCollectionViewCell_impressionsUpdateBlock]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30HeroCarouselCollectionViewCell_previouslyFocusedCarouselItemView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30HeroCarouselCollectionViewCell_focusedCarouselItemView));
  v3 = (char *)self + OBJC_IVAR____TtC8AppStore30HeroCarouselCollectionViewCell_autoScrollConfiguration;
  uint64_t v4 = type metadata accessor for AutoScrollConfiguration(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  sub_1000077E0( (uint64_t)self + OBJC_IVAR____TtC8AppStore30HeroCarouselCollectionViewCell_currentTitleEffect,  &qword_1002EF6F0);
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore30HeroCarouselCollectionViewCell_onUpdatePageTitleEffect));
  sub_1000077AC((uint64_t)self + OBJC_IVAR____TtC8AppStore30HeroCarouselCollectionViewCell_playbackId);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8AppStore30HeroCarouselCollectionViewCell_visibilityTrackingView);
}

- (int64_t)numberOfItemsInCarouselView:(id)a3
{
  id v4 = a3;
  v5 = self;
  int64_t v6 = sub_1001CA7F8();

  return v6;
}

- (id)carouselView:(id)a3 cellForItemAtIndex:(int64_t)a4
{
  id v6 = a3;
  id v7 = self;
  v8 = (void *)sub_1001CA9A0(v6, a4);

  return v8;
}

- (void)carouselView:(id)a3 willDisplayCell:(id)a4 forItemAtIndex:(int64_t)a5
{
  id v8 = a3;
  v9 = (uint64_t (*)(char *, uint64_t))a4;
  v10 = self;
  sub_1001CAA94(v9, a5);
}

- (void)carouselView:(id)a3 didFocusItemAtIndex:(int64_t)a4
{
  id v6 = a3;
  id v7 = self;
  sub_1001CAE94(a4);
}

- (void)carouselView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndex:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_1001CB024(v8);
}

- (void)carouselViewDidScroll:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1001C9188(v4);
}

- (int64_t)indexForPreferredCenteredViewInCarouselView:(id)a3
{
  id v4 = a3;
  v5 = self;
  int64_t v6 = sub_1001CB320();

  return v6;
}

@end