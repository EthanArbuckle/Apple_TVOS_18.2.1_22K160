@interface ProductTapToRateContentView
- (_TtC6Arcade27ProductTapToRateContentView)initWithCoder:(id)a3;
- (_TtC6Arcade27ProductTapToRateContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ProductTapToRateContentView

- (_TtC6Arcade27ProductTapToRateContentView)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade27ProductTapToRateContentView *)sub_100116644( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (_TtC6Arcade27ProductTapToRateContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100117D74((uint64_t)v3, v4);
}

  ;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100116ACC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade27ProductTapToRateContentView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade27ProductTapToRateContentView_starRatingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade27ProductTapToRateContentView_ratingLabel));
}

@end