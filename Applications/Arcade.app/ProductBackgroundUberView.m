@interface ProductBackgroundUberView
- (_TtC6Arcade25ProductBackgroundUberView)initWithCoder:(id)a3;
- (_TtC6Arcade25ProductBackgroundUberView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)layoutSubviews;
@end

@implementation ProductBackgroundUberView

- (_TtC6Arcade25ProductBackgroundUberView)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade25ProductBackgroundUberView *)sub_100213B38( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (_TtC6Arcade25ProductBackgroundUberView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100214C88();
}

  ;
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC6Arcade25ProductBackgroundUberView_forgetFetchBlock);
  if (v4)
  {
    uint64_t v5 = *(void *)&self->videoContainer[OBJC_IVAR____TtC6Arcade25ProductBackgroundUberView_forgetFetchBlock];
    v6 = self;
    uint64_t v7 = sub_100017A40((uint64_t)v4, v5);
    v4(v7);
    sub_10000D3D8((uint64_t)v4, v5);
  }

  else
  {
    v8 = self;
  }

  v9.receiver = self;
  v9.super_class = ObjectType;
  -[ProductBackgroundUberView dealloc](&v9, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade25ProductBackgroundUberView_videoContainer));
  swift_bridgeObjectRelease(*(void *)&self->videoContainer[OBJC_IVAR____TtC6Arcade25ProductBackgroundUberView_artworkFetchKey]);
  sub_10000D3D8( *(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6Arcade25ProductBackgroundUberView_forgetFetchBlock),  *(void *)&self->videoContainer[OBJC_IVAR____TtC6Arcade25ProductBackgroundUberView_forgetFetchBlock]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade25ProductBackgroundUberView_uberView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade25ProductBackgroundUberView_uberBlurView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6Arcade25ProductBackgroundUberView_uber));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade25ProductBackgroundUberView_fallbackArtworkEffectView));
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100213FC4();
}

@end