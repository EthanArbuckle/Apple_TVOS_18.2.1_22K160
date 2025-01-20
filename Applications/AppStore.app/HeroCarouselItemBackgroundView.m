@interface HeroCarouselItemBackgroundView
- (_TtC8AppStore30HeroCarouselItemBackgroundView)initWithCoder:(id)a3;
- (_TtC8AppStore30HeroCarouselItemBackgroundView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation HeroCarouselItemBackgroundView

- (_TtC8AppStore30HeroCarouselItemBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore30HeroCarouselItemBackgroundView *)sub_100133354( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (_TtC8AppStore30HeroCarouselItemBackgroundView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100134060();
}

  ;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10013353C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30HeroCarouselItemBackgroundView_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30HeroCarouselItemBackgroundView_videoContainer));
}

@end