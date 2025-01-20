@interface ProductStarRatingsHistogramContentView
- (_TtC6Arcade38ProductStarRatingsHistogramContentView)initWithCoder:(id)a3;
- (_TtC6Arcade38ProductStarRatingsHistogramContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ProductStarRatingsHistogramContentView

- (_TtC6Arcade38ProductStarRatingsHistogramContentView)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade38ProductStarRatingsHistogramContentView *)sub_100008C00( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (_TtC6Arcade38ProductStarRatingsHistogramContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000096EC((uint64_t)v3, v4);
}

  ;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100009448();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade38ProductStarRatingsHistogramContentView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade38ProductStarRatingsHistogramContentView_subtitleLabel));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC6Arcade38ProductStarRatingsHistogramContentView_starViews));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC6Arcade38ProductStarRatingsHistogramContentView_progressBarViews));
}

@end