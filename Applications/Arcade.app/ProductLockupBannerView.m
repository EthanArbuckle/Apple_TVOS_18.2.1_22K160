@interface ProductLockupBannerView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC6Arcade23ProductLockupBannerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ProductLockupBannerView

- (_TtC6Arcade23ProductLockupBannerView)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade23ProductLockupBannerView *)sub_100152FE0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)swift_getObjectType(self);
  id v2 = v17.receiver;
  -[ProductLockupBannerView layoutSubviews](&v17, "layoutSubviews");
  sub_1001537B0(v14);
  uint64_t v3 = v15;
  uint64_t v4 = v16;
  sub_100005F8C(v14, v15);
  [v2 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  id v13 = [v2 traitCollection];
  dispatch thunk of Placeable.place(at:with:)(v13, v3, v4, v6, v8, v10, v12);

  _s6Arcade17PillOverlayLayoutVwxx_0(v14);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = self;
  double v6 = sub_100153B80(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade23ProductLockupBannerView_messageLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade23ProductLockupBannerView_artworkView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC6Arcade23ProductLockupBannerView_artwork));
  sub_1001545B0( *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR____TtC6Arcade23ProductLockupBannerView_messageLabelText),  *(void *)&self->super.state[OBJC_IVAR____TtC6Arcade23ProductLockupBannerView_messageLabelText],  *(void *)&self->super.shadowRadius[OBJC_IVAR____TtC6Arcade23ProductLockupBannerView_messageLabelText + 6],  *(void *)&self->super.shadowRadius[OBJC_IVAR____TtC6Arcade23ProductLockupBannerView_messageLabelText + 14],  *(void *)&self->super.shadowRadius[OBJC_IVAR____TtC6Arcade23ProductLockupBannerView_messageLabelText + 22],  *(void *)&self->super.shadowRadius[OBJC_IVAR____TtC6Arcade23ProductLockupBannerView_messageLabelText + 30]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade23ProductLockupBannerView_backgroundEffectView));
}

@end