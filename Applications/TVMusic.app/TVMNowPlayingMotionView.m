@interface TVMNowPlayingMotionView
- (TVMNowPlayingMotionArtwork)artwork;
- (TVMNowPlayingMotionView)initWithCoder:(id)a3;
- (TVMNowPlayingMotionView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setArtwork:(id)a3;
@end

@implementation TVMNowPlayingMotionView

- (TVMNowPlayingMotionArtwork)artwork
{
  return (TVMNowPlayingMotionArtwork *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                               + OBJC_IVAR___TVMNowPlayingMotionView_artwork));
}

- (void)setArtwork:(id)a3
{
  v4 = *(char **)((char *)&self->super.super.super.isa + OBJC_IVAR___TVMNowPlayingMotionView_artwork);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___TVMNowPlayingMotionView_artwork) = (Class)a3;
  id v6 = a3;
  v5 = self;
  sub_1000DDD04(v4);
}

- (TVMNowPlayingMotionView)initWithFrame:(CGRect)a3
{
  return (TVMNowPlayingMotionView *)sub_1000DE474(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (TVMNowPlayingMotionView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000E0244();
}

  ;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)swift_getObjectType(self);
  v2 = (char *)v13.receiver;
  -[TVMNowPlayingMotionView layoutSubviews](&v13, "layoutSubviews");
  id v3 = *(void **)&v2[OBJC_IVAR___TVMNowPlayingMotionView_playerLayer];
  id v4 = objc_msgSend(v2, "layer", v13.receiver, v13.super_class);
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  objc_msgSend(v3, "setFrame:", v6, v8, v10, v12);
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR___TVMNowPlayingMotionView_keyframeArtworkTokenObservation));
}

@end