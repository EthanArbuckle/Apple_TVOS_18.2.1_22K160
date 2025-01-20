@interface ArcadeHeaderView
- (_TtC8AppStore16ArcadeHeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ArcadeHeaderView

- (_TtC8AppStore16ArcadeHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore16ArcadeHeaderView *)sub_10003B16C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10003B628();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC8AppStore16ArcadeHeaderView_effect;
  uint64_t v4 = type metadata accessor for TitleEffect(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore16ArcadeHeaderView_gradientLayer));
}

@end