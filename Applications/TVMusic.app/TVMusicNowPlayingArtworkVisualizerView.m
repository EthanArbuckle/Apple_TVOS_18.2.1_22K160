@interface TVMusicNowPlayingArtworkVisualizerView
+ (BOOL)isSupported;
- (BOOL)isBlurDisabled;
- (TVMusicNowPlayingArtworkVisualizerView)initWithCoder:(id)a3;
- (TVMusicNowPlayingArtworkVisualizerView)initWithFrame:(CGRect)a3;
- (UIImage)image;
- (float)customBlackScrimAlpha;
- (void)beginThrottle;
- (void)endThrottle;
- (void)layoutSubviews;
- (void)setCustomBlackScrimAlpha:(float)a3;
- (void)setImage:(id)a3;
@end

@implementation TVMusicNowPlayingArtworkVisualizerView

- (float)customBlackScrimAlpha
{
  return *(float *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR___TVMusicNowPlayingArtworkVisualizerView_customBlackScrimAlpha);
}

- (void)setCustomBlackScrimAlpha:(float)a3
{
}

- (BOOL)isBlurDisabled
{
  return 1;
}

- (UIImage)image
{
  return (UIImage *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR___TVMusicNowPlayingArtworkVisualizerView_image));
}

- (void)setImage:(id)a3
{
  uint64_t v4 = OBJC_IVAR___TVMusicNowPlayingArtworkVisualizerView_image;
  v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___TVMusicNowPlayingArtworkVisualizerView_image);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___TVMusicNowPlayingArtworkVisualizerView_image) = (Class)a3;
  v9 = (TVMusicNowPlayingArtworkVisualizerView *)a3;
  v6 = self;

  if (*(Class *)((char *)&v6->super.super.super.isa + OBJC_IVAR___TVMusicNowPlayingArtworkVisualizerView_visualizer))
  {
    v7 = *(Class *)((char *)&self->super.super.super.isa + v4);
    v8 = v7;
    sub_10010741C(v7, 1);

    v6 = v9;
    v9 = v8;
  }
}

- (void)beginThrottle
{
}

- (void)endThrottle
{
}

+ (BOOL)isSupported
{
  id v2 = [(id)objc_opt_self(TVMusicPlayerManager) defaultPlayer];
  id v3 = [v2 playbackEngine];

  if (!v3) {
    return 0;
  }
  if (qword_1002B7138 != -1) {
    swift_once(&qword_1002B7138, sub_100114708);
  }
  return qword_1002C5A20 != 0;
}

- (TVMusicNowPlayingArtworkVisualizerView)initWithFrame:(CGRect)a3
{
  return (TVMusicNowPlayingArtworkVisualizerView *)sub_10016B1D4( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (TVMusicNowPlayingArtworkVisualizerView)initWithCoder:(id)a3
{
  *(_DWORD *)((char *)&self->super.super.super.isa
            + OBJC_IVAR___TVMusicNowPlayingArtworkVisualizerView_customBlackScrimAlpha) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___TVMusicNowPlayingArtworkVisualizerView_image) = 0LL;
  uint64_t v4 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___TVMusicNowPlayingArtworkVisualizerView_visualizer);
  id v5 = a3;
  *uint64_t v4 = sub_10016AFE0();
  v4[1] = v6;

  result = (TVMusicNowPlayingArtworkVisualizerView *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100223C30LL,  "TVMusic/ArtworkVisualizerView.swift",  35LL,  2LL,  94LL,  0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ArtworkVisualizerView();
  id v2 = (char *)v5.receiver;
  -[TVMusicNowPlayingArtworkVisualizerView layoutSubviews](&v5, "layoutSubviews");
  id v3 = *(void **)&v2[OBJC_IVAR___TVMusicNowPlayingArtworkVisualizerView_visualizer];
  if (v3)
  {
    objc_msgSend(v2, "bounds", v5.receiver, v5.super_class);
    CGFloat v4 = CGRectGetWidth(v6) * 0.5;
    [v2 bounds];
    objc_msgSend(v3, "setDrawableSize:", v4, CGRectGetHeight(v7) * 0.5);
  }
}

- (void).cxx_destruct
{
}

@end