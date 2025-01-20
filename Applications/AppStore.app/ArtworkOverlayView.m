@interface ArtworkOverlayView
- (_TtC8AppStore18ArtworkOverlayView)initWithCoder:(id)a3;
- (_TtC8AppStore18ArtworkOverlayView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ArtworkOverlayView

- (_TtC8AppStore18ArtworkOverlayView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore18ArtworkOverlayView_pillView) = 0LL;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore18ArtworkOverlayView_avatarShowcase) = 0LL;
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC8AppStore18ArtworkOverlayView_placeAvatarShowcaseBlock);
  void *v4 = 0LL;
  v4[1] = 0LL;
  id v5 = a3;

  result = (_TtC8AppStore18ArtworkOverlayView *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100247230LL,  "AppStore/ArtworkOverlayView.swift",  33LL,  2LL,  33LL,  0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType(self);
  v2 = (char *)v6.receiver;
  -[ArtworkOverlayView layoutSubviews](&v6, "layoutSubviews");
  sub_100167920( v2,  *(double *)&v2[OBJC_IVAR____TtC8AppStore18ArtworkOverlayView_metrics],  *(double *)&v2[OBJC_IVAR____TtC8AppStore18ArtworkOverlayView_metrics + 8],  *(double *)&v2[OBJC_IVAR____TtC8AppStore18ArtworkOverlayView_metrics + 16],  *(double *)&v2[OBJC_IVAR____TtC8AppStore18ArtworkOverlayView_metrics + 24]);
  v3 = *(void (**)(__n128))&v2[OBJC_IVAR____TtC8AppStore18ArtworkOverlayView_placeAvatarShowcaseBlock];
  if (v3)
  {
    uint64_t v4 = *(void *)&v2[OBJC_IVAR____TtC8AppStore18ArtworkOverlayView_placeAvatarShowcaseBlock + 8];
    __n128 v5 = swift_retain(v4);
    v3(v5);
    sub_10000A450((uint64_t)v3, v4);
  }
}

- (_TtC8AppStore18ArtworkOverlayView)initWithFrame:(CGRect)a3
{
  result = (_TtC8AppStore18ArtworkOverlayView *)_swift_stdlib_reportUnimplementedInitializer( "AppStore.ArtworkOverlayView",  27LL,  "init(frame:)",  12LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore18ArtworkOverlayView_avatarShowcase));
  sub_10000A450( *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore18ArtworkOverlayView_placeAvatarShowcaseBlock),  *(void *)&self->metrics[OBJC_IVAR____TtC8AppStore18ArtworkOverlayView_placeAvatarShowcaseBlock]);
}

@end