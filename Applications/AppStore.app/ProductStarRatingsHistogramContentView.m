@interface ProductStarRatingsHistogramContentView
- (_TtC8AppStore38ProductStarRatingsHistogramContentView)initWithCoder:(id)a3;
- (_TtC8AppStore38ProductStarRatingsHistogramContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ProductStarRatingsHistogramContentView

- (_TtC8AppStore38ProductStarRatingsHistogramContentView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore38ProductStarRatingsHistogramContentView *)sub_100155688( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (_TtC8AppStore38ProductStarRatingsHistogramContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10015658C((uint64_t)v3, v4);
}

  ;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100155ED0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore38ProductStarRatingsHistogramContentView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore38ProductStarRatingsHistogramContentView_subtitleLabel));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore38ProductStarRatingsHistogramContentView_starViews));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore38ProductStarRatingsHistogramContentView_progressBarViews));
}

@end