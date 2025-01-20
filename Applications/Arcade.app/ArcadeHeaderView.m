@interface ArcadeHeaderView
- (_TtC6Arcade16ArcadeHeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ArcadeHeaderView

- (_TtC6Arcade16ArcadeHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade16ArcadeHeaderView *)sub_1001B2520(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1001B29DC();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC6Arcade16ArcadeHeaderView_effect;
  uint64_t v4 = type metadata accessor for TitleEffect(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade16ArcadeHeaderView_gradientLayer));
}

@end