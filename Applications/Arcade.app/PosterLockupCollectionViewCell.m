@interface PosterLockupCollectionViewCell
- (NSString)accessibilityTitle;
- (_TtC6Arcade30PosterLockupCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation PosterLockupCollectionViewCell

- (_TtC6Arcade30PosterLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade30PosterLockupCollectionViewCell *)sub_1000587E8( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000590EC();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_10005955C();
}

- (NSString)accessibilityTitle
{
  uint64_t v2 = *(void *)&self->super.state[OBJC_IVAR____TtC6Arcade30PosterLockupCollectionViewCell_title];
  if (v2)
  {
    swift_bridgeObjectRetain(*(void *)&self->super.state[OBJC_IVAR____TtC6Arcade30PosterLockupCollectionViewCell_title]);
    NSString v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v2);
  }

  else
  {
    NSString v3 = 0LL;
  }

  return (NSString *)v3;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade30PosterLockupCollectionViewCell_headingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade30PosterLockupCollectionViewCell_epicHeaderView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade30PosterLockupCollectionViewCell_fallbackTitleColor));
  swift_bridgeObjectRelease(*(void *)&self->super.state[OBJC_IVAR____TtC6Arcade30PosterLockupCollectionViewCell_title]);
  swift_bridgeObjectRelease(*(void *)&self->super.state[OBJC_IVAR____TtC6Arcade30PosterLockupCollectionViewCell_fallbackTitle]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade30PosterLockupCollectionViewCell_offerButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade30PosterLockupCollectionViewCell_footerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade30PosterLockupCollectionViewCell_mediaView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC6Arcade30PosterLockupCollectionViewCell_video));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade30PosterLockupCollectionViewCell_videoContainer));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC6Arcade30PosterLockupCollectionViewCell_videoView);
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC6Arcade30PosterLockupCollectionViewCell_epicHeadingArtwork));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC6Arcade30PosterLockupCollectionViewCell_artwork));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade30PosterLockupCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade30PosterLockupCollectionViewCell_wordmark));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade30PosterLockupCollectionViewCell_gradientView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade30PosterLockupCollectionViewCell_fallbackTitleView));
}

@end