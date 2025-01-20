@interface HeroCarouselItemBackgroundView
- (_TtC6Arcade30HeroCarouselItemBackgroundView)initWithCoder:(id)a3;
- (_TtC6Arcade30HeroCarouselItemBackgroundView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation HeroCarouselItemBackgroundView

- (_TtC6Arcade30HeroCarouselItemBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade30HeroCarouselItemBackgroundView *)sub_10012E9E8( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (_TtC6Arcade30HeroCarouselItemBackgroundView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10012F6F4();
}

  ;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10012EBD0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade30HeroCarouselItemBackgroundView_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade30HeroCarouselItemBackgroundView_videoContainer));
}

@end