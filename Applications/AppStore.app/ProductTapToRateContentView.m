@interface ProductTapToRateContentView
- (_TtC8AppStore27ProductTapToRateContentView)initWithCoder:(id)a3;
- (_TtC8AppStore27ProductTapToRateContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ProductTapToRateContentView

- (_TtC8AppStore27ProductTapToRateContentView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore27ProductTapToRateContentView *)sub_10005EC78( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (_TtC8AppStore27ProductTapToRateContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100060038((uint64_t)v3, v4);
}

  ;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10005F100();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore27ProductTapToRateContentView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore27ProductTapToRateContentView_starRatingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore27ProductTapToRateContentView_ratingLabel));
}

@end