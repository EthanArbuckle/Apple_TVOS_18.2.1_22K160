@interface ArcadeSubscribePageView
- (_TtC6Arcade23ArcadeSubscribePageView)initWithCoder:(id)a3;
- (_TtC6Arcade23ArcadeSubscribePageView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ArcadeSubscribePageView

- (_TtC6Arcade23ArcadeSubscribePageView)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade23ArcadeSubscribePageView *)sub_100148488(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC6Arcade23ArcadeSubscribePageView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100148D70();
}

  ;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100148638();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade23ArcadeSubscribePageView_gridContentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade23ArcadeSubscribePageView_artworkContentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade23ArcadeSubscribePageView_detailsView));
}

@end