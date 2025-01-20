@interface GradientLabel
- (_TtC6SiriTV13GradientLabel)initWithCoder:(id)a3;
- (_TtC6SiriTV13GradientLabel)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation GradientLabel

- (_TtC6SiriTV13GradientLabel)initWithFrame:(CGRect)a3
{
  return result;
}

- (_TtC6SiriTV13GradientLabel)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_E66C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_E970();
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC6SiriTV13GradientLabel_logger;
  uint64_t v4 = sub_A5F0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6SiriTV13GradientLabel____lazy_storage___gradientImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6SiriTV13GradientLabel____lazy_storage___label));
}

@end