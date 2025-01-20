@interface SiriTVSpinnerView
- (BOOL)isHighlighted;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC6SiriTV17SiriTVSpinnerView)init;
- (_TtC6SiriTV17SiriTVSpinnerView)initWithCoder:(id)a3;
- (_TtC6SiriTV17SiriTVSpinnerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation SiriTVSpinnerView

- (_TtC6SiriTV17SiriTVSpinnerView)init
{
  return (_TtC6SiriTV17SiriTVSpinnerView *)sub_8739C();
}

- (_TtC6SiriTV17SiriTVSpinnerView)initWithFrame:(CGRect)a3
{
  return (_TtC6SiriTV17SiriTVSpinnerView *)sub_873DC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC6SiriTV17SiriTVSpinnerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_876FC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_8782C();
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  sub_8796C();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = self;
  double v4 = sub_87A44();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (BOOL)isHighlighted
{
  v2 = self;
  unsigned __int8 v3 = sub_87AB8();

  return v3 & 1;
}

- (void)setHighlighted:(BOOL)a3
{
  double v4 = self;
  sub_87B28(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_effectShape));
  sub_1B4DC(OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_outlineShape);
  sub_1B4DC(OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_imageView);
  sub_1B4DC(OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_label);
  sub_1B4DC(OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_subtitleLabel);
  sub_21190((uint64_t)self + OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_presenter);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_layoutDelegate);
  sub_1B4DC(OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_tapOutsideGestureRecognizer);
  sub_DBAC((Class *)((char *)&self->super.super.super.super.isa
                   + OBJC_IVAR____TtC6SiriTV17SiriTVSpinnerView_configuration));
}

@end