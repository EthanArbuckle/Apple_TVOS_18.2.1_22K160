@interface ProductStarRatingsContentView
- (UILabel)accessibilityCurrentRatingLabel;
- (_TtC6Arcade29ProductStarRatingsContentView)initWithCoder:(id)a3;
- (_TtC6Arcade29ProductStarRatingsContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ProductStarRatingsContentView

- (_TtC6Arcade29ProductStarRatingsContentView)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade29ProductStarRatingsContentView *)sub_100211668( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (_TtC6Arcade29ProductStarRatingsContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002124BC((uint64_t)v3, v4);
}

  ;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100211BC0();
}

- (UILabel)accessibilityCurrentRatingLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC6Arcade29ProductStarRatingsContentView_ratingLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade29ProductStarRatingsContentView_ratingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade29ProductStarRatingsContentView_outOfRatingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade29ProductStarRatingsContentView_starRatingView));
}

@end