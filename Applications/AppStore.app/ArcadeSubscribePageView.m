@interface ArcadeSubscribePageView
- (_TtC8AppStore23ArcadeSubscribePageView)initWithCoder:(id)a3;
- (_TtC8AppStore23ArcadeSubscribePageView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ArcadeSubscribePageView

- (_TtC8AppStore23ArcadeSubscribePageView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore23ArcadeSubscribePageView *)sub_1001E79A8( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (_TtC8AppStore23ArcadeSubscribePageView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001E836C();
}

  ;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1001E7B58();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23ArcadeSubscribePageView_gridContentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23ArcadeSubscribePageView_artworkContentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23ArcadeSubscribePageView_detailsView));
}

@end