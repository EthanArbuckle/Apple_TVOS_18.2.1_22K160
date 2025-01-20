@interface TVMusicNowPlayingContentView
- (BOOL)canBecomeFocused;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (TVMNowPlayingMotionView)motionView;
- (TVMusicNowPlayingContentConfiguration)nowPlayingConfiguration;
- (TVMusicNowPlayingContentView)initWithCoder:(id)a3;
- (TVMusicNowPlayingContentView)initWithFrame:(CGRect)a3;
- (UILabel)subtitleLabel;
- (UIStackView)headerView;
- (_UIStackedImageContainerView)imageView;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)handleSelect:(id)a3;
- (void)layoutSubviews;
- (void)setNowPlayingConfiguration:(id)a3;
- (void)setNowPlayingConfiguration:(id)a3 withAnimationCoordinator:(id)a4;
@end

@implementation TVMusicNowPlayingContentView

- (TVMusicNowPlayingContentConfiguration)nowPlayingConfiguration
{
  return (TVMusicNowPlayingContentConfiguration *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                          + OBJC_IVAR___TVMusicNowPlayingContentView_nowPlayingConfiguration));
}

- (void)setNowPlayingConfiguration:(id)a3
{
  uint64_t v4 = OBJC_IVAR___TVMusicNowPlayingContentView_nowPlayingConfiguration;
  v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___TVMusicNowPlayingContentView_nowPlayingConfiguration);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR___TVMusicNowPlayingContentView_nowPlayingConfiguration) = (Class)a3;
  id v6 = a3;
  v7 = self;

  v8 = *(id *)((char *)&self->super.super.super.super.isa + v4);
  sub_1000FB0E8(v8);
}

- (void)setNowPlayingConfiguration:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1000FB9E4(v6, v7);
}

- (TVMNowPlayingMotionView)motionView
{
  return (TVMNowPlayingMotionView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                            + OBJC_IVAR___TVMusicNowPlayingContentView_motionView));
}

- (_UIStackedImageContainerView)imageView
{
  return (_UIStackedImageContainerView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                 + OBJC_IVAR___TVMusicNowPlayingContentView_imageView));
}

- (UIStackView)headerView
{
  return (UIStackView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                + OBJC_IVAR___TVMusicNowPlayingContentView_headerView));
}

- (UILabel)subtitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR___TVMusicNowPlayingContentView_subtitleLabel));
}

- (TVMusicNowPlayingContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000FF300();
}

  ;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000FD1A8();
}

- (BOOL)canBecomeFocused
{
  return *((_BYTE *)&(*(Class *)((char *)&self->super.super.super.super.isa
                               + OBJC_IVAR___TVMusicNowPlayingContentView_nowPlayingConfiguration))->isa
         + OBJC_IVAR___TVMusicNowPlayingContentConfiguration_isFocusable);
}

- (void)handleSelect:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000FD684(v4);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1000FE204((uint64_t)v6, v7);
}

- (TVMusicNowPlayingContentView)initWithFrame:(CGRect)a3
{
  result = (TVMusicNowPlayingContentView *)_swift_stdlib_reportUnimplementedInitializer( "TVMusic.NowPlayingContentView",  29LL,  "init(frame:)",  12LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___TVMusicNowPlayingContentView_nowPlayingConfiguration));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___TVMusicNowPlayingContentView_videoContainerView));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___TVMusicNowPlayingContentView_musicBarsView));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___TVMusicNowPlayingContentView_imageContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___TVMusicNowPlayingContentView_specularLayer));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___TVMusicNowPlayingContentView_titleGroupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___TVMusicNowPlayingContentView_attributionViewModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___TVMusicNowPlayingContentView_attributionView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___TVMusicNowPlayingContentView_attributionBottomConstraint));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___TVMusicNowPlayingContentView_subtitleLabel));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___TVMusicNowPlayingContentView_widthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___TVMusicNowPlayingContentView_heightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___TVMusicNowPlayingContentView_headerTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___TVMusicNowPlayingContentView_titleCenterXConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___TVMusicNowPlayingContentView_subtitleFirstBaselineContraint));
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

@end