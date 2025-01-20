@interface ProductStarRatingsContentView
- (UILabel)accessibilityCurrentRatingLabel;
- (_TtC8AppStore29ProductStarRatingsContentView)initWithCoder:(id)a3;
- (_TtC8AppStore29ProductStarRatingsContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ProductStarRatingsContentView

- (_TtC8AppStore29ProductStarRatingsContentView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore29ProductStarRatingsContentView *)sub_100070EE4( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (_TtC8AppStore29ProductStarRatingsContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100071C14((uint64_t)v3, v4);
}

  ;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10007143C();
}

- (UILabel)accessibilityCurrentRatingLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC8AppStore29ProductStarRatingsContentView_ratingLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29ProductStarRatingsContentView_ratingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29ProductStarRatingsContentView_outOfRatingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29ProductStarRatingsContentView_starRatingView));
}

@end