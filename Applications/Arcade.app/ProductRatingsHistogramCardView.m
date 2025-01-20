@interface ProductRatingsHistogramCardView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC6Arcade31ProductRatingsHistogramCardView)initWithFrame:(CGRect)a3;
- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4;
- (void)layoutSubviews;
@end

@implementation ProductRatingsHistogramCardView

- (_TtC6Arcade31ProductRatingsHistogramCardView)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade31ProductRatingsHistogramCardView *)sub_1000EC8D0( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000ED490();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v3 = qword_1002DCB50;
  v4 = self;
  if (v3 != -1) {
    swift_once(&qword_1002DCB50, sub_1000EC64C);
  }
  unsigned __int128 v5 = xmmword_1002F03B0;

  *(void *)&double v7 = v5 >> 64;
  *(void *)&double v6 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for ProductRatingsHistogramCardView();
  id v6 = v11.receiver;
  id v7 = a4;
  id v8 =  -[ProductRatingsHistogramCardView _preferredConfigurationForFocusAnimation:inContext:]( &v11,  "_preferredConfigurationForFocusAnimation:inContext:",  a3,  v7);
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "setFocusingBaseDuration:", 0.2, v11.receiver, v11.super_class);
    [v9 setUnfocusingBaseDuration:0.2];
    objc_msgSend(v9, "setAs_animationOptions:", 131078);
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade31ProductRatingsHistogramCardView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade31ProductRatingsHistogramCardView_subtitleLabel));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC6Arcade31ProductRatingsHistogramCardView_starViews));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC6Arcade31ProductRatingsHistogramCardView_progressBarViews));
}

@end