@interface TVPPhotoView
- (BOOL)isVideoView;
- (CGRect)_rectForProgressIndicator;
- (CGSize)imageSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (ISAnimatedImageView)animatedImageView;
- (ISWrappedAVPlayer)videoPlayer;
- (PHLivePhotoView)playerView;
- (PXRoundProgressView)progressView;
- (PXVideoPlayerView)videoPlayerView;
- (TVPPhotoView)initWithFrame:(CGRect)a3;
- (UIActivityIndicatorView)spinner;
- (UIGestureRecognizer)livePhotoGestureRecognizer;
- (UIImageView)badgeImageView;
- (UIImageView)errorView;
- (UIImageView)imageView;
- (UIView)currentView;
- (UIView)irisGestureRecognizerView;
- (UIView)overlayView;
- (double)progress;
- (id)displayedImage;
- (int)currentRequestID;
- (int64_t)progressStyle;
- (unint64_t)_autoresizingMask;
- (void)_hideError;
- (void)_removeAllSubviews;
- (void)_removeLivePhotoGesture;
- (void)_removeVideoOverlayViews;
- (void)didAnimateToCaptionMode;
- (void)didAnimateToFullScreenMode;
- (void)displayAnimatedImage:(id)a3;
- (void)displayAutoloopVideo:(id)a3 placeholderImage:(id)a4;
- (void)displayError;
- (void)displayImage:(id)a3;
- (void)displayLivePhoto:(id)a3;
- (void)displaySpinner;
- (void)displayVideoLoadingSpinnerOverlay;
- (void)displayVideoOverlayIcon:(id)a3 isVideoBadge:(BOOL)a4;
- (void)hideProgress;
- (void)layoutSubviews;
- (void)playVitalityHint;
- (void)prepareForReuse;
- (void)removeBadgeImageView;
- (void)setAnimatedImageView:(id)a3;
- (void)setBadgeImageView:(id)a3;
- (void)setCurrentRequestID:(int)a3;
- (void)setCurrentView:(id)a3;
- (void)setErrorView:(id)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setImageView:(id)a3;
- (void)setIrisGestureRecognizerView:(id)a3;
- (void)setIsVideoView:(BOOL)a3;
- (void)setOverlayView:(id)a3;
- (void)setPlayerView:(id)a3;
- (void)setProgress:(double)a3;
- (void)setProgressStyle:(int64_t)a3;
- (void)setProgressView:(id)a3;
- (void)setSpinner:(id)a3;
- (void)setUpBadgeImageViewWithImage:(id)a3;
- (void)setUpErrorView;
- (void)setUpProgressIndicator;
- (void)setUpVideoOverlayWithImage:(id)a3;
- (void)setUpVideoOverlayWithSpinner;
- (void)setVideoPlayer:(id)a3;
- (void)setVideoPlayerView:(id)a3;
- (void)willAnimateToCaptionMode;
- (void)willAnimateToFullScreenMode;
- (void)willMoveToWindow:(id)a3;
@end

@implementation TVPPhotoView

- (TVPPhotoView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVPPhotoView;
  result = -[TVPPhotoView initWithFrame:]( &v4,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (result)
  {
    result->_progressStyle = 1LL;
    result->_currentRequestID = 0;
  }

  return result;
}

- (void)willMoveToWindow:(id)a3
{
  if (!a3) {
    -[TVPPhotoView _removeLivePhotoGesture](self, "_removeLivePhotoGesture");
  }
}

- (void)displaySpinner
{
  self->_isVideoView = 0;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVPPhotoView spinner](self, "spinner"));
  objc_storeStrong((id *)&self->_currentView, v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue([v4 superview]);

  if (!v3)
  {
    -[TVPPhotoView _removeAllSubviews](self, "_removeAllSubviews");
    -[TVPPhotoView addSubview:](self, "addSubview:", v4);
  }

  -[TVPPhotoView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setImageSize:(CGSize)a3
{
  if (a3.width != self->_imageSize.width || a3.height != self->_imageSize.height)
  {
    self->_imageSize = a3;
    -[TVPPhotoView setNeedsLayout](self, "setNeedsLayout");
  }

- (void)displayImage:(id)a3
{
  id v4 = a3;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[TVPPhotoView imageView](self, "imageView"));
  [obj setImage:v4];
  objc_storeStrong((id *)&self->_currentView, obj);
  [v4 size];
  double v6 = v5;
  double v8 = v7;

  -[TVPPhotoView setImageSize:](self, "setImageSize:", v6, v8);
  -[TVPPhotoView setProgressStyle:](self, "setProgressStyle:", 1LL);
  v9 = (void *)objc_claimAutoreleasedReturnValue([obj superview]);

  if (!v9)
  {
    -[TVPPhotoView _removeAllSubviews](self, "_removeAllSubviews");
    -[TVPPhotoView addSubview:](self, "addSubview:", obj);
  }

  -[TVPPhotoView setNeedsLayout](self, "setNeedsLayout");
}

- (void)displayVideoLoadingSpinnerOverlay
{
  self->_isVideoView = 1;
  -[TVPPhotoView _removeVideoOverlayViews](self, "_removeVideoOverlayViews");
  -[TVPPhotoView setUpVideoOverlayWithSpinner](self, "setUpVideoOverlayWithSpinner");
}

- (void)displayVideoOverlayIcon:(id)a3 isVideoBadge:(BOOL)a4
{
  self->_isVideoView = 1;
  id v6 = a3;
  -[TVPPhotoView _removeVideoOverlayViews](self, "_removeVideoOverlayViews");
  if (a4) {
    -[TVPPhotoView setUpBadgeImageViewWithImage:](self, "setUpBadgeImageViewWithImage:", v6);
  }
  else {
    -[TVPPhotoView setUpVideoOverlayWithImage:](self, "setUpVideoOverlayWithImage:", v6);
  }
}

- (void)displayLivePhoto:(id)a3
{
  id v4 = a3;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[TVPPhotoView playerView](self, "playerView"));
  [obj setLivePhoto:v4];
  objc_storeStrong((id *)&self->_currentView, obj);
  [v4 size];
  double v6 = v5;
  double v8 = v7;

  -[TVPPhotoView setImageSize:](self, "setImageSize:", v6, v8);
  -[TVPPhotoView setProgressStyle:](self, "setProgressStyle:", 3LL);
  v9 = (void *)objc_claimAutoreleasedReturnValue([obj superview]);

  if (!v9)
  {
    -[TVPPhotoView _removeAllSubviews](self, "_removeAllSubviews");
    -[TVPPhotoView addSubview:](self, "addSubview:", obj);
  }

  -[TVPPhotoView setNeedsLayout](self, "setNeedsLayout");
}

- (void)displayAnimatedImage:(id)a3
{
  id v4 = a3;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[TVPPhotoView animatedImageView](self, "animatedImageView"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pf_animatedImage"));
  [obj setImage:v5];

  objc_storeStrong((id *)&self->_currentView, obj);
  double v6 = (double)(unint64_t)[v4 pixelWidth];
  id v7 = [v4 pixelHeight];

  -[TVPPhotoView setImageSize:](self, "setImageSize:", v6, (double)(unint64_t)v7);
  -[TVPPhotoView setProgressStyle:](self, "setProgressStyle:", 1LL);
  double v8 = (void *)objc_claimAutoreleasedReturnValue([obj superview]);

  if (!v8)
  {
    -[TVPPhotoView _removeAllSubviews](self, "_removeAllSubviews");
    -[TVPPhotoView addSubview:](self, "addSubview:", obj);
  }

  [obj setPlaying:1];
  -[TVPPhotoView setNeedsLayout](self, "setNeedsLayout");
}

- (void)displayAutoloopVideo:(id)a3 placeholderImage:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[TVPPhotoView videoPlayerView](self, "videoPlayerView"));
  double v8 = (ISWrappedAVPlayer *)objc_claimAutoreleasedReturnValue(-[TVPPhotoView videoPlayer](self, "videoPlayer"));
  if (!v8)
  {
    double v8 = objc_alloc_init(&OBJC_CLASS___ISWrappedAVPlayer);
    -[TVPPhotoView setVideoPlayer:](self, "setVideoPlayer:", v8);
  }

  -[ISWrappedAVPlayer replaceCurrentItemWithPlayerItem:](v8, "replaceCurrentItemWithPlayerItem:", v7);
  LODWORD(v9) = 1.0;
  -[ISWrappedAVPlayer setRate:](v8, "setRate:", v9);
  -[ISWrappedAVPlayer setLoopingEnabled:withTemplateItem:](v8, "setLoopingEnabled:withTemplateItem:", 1LL, v7);

  [obj setPlayer:v8];
  [obj setPlaceholderImage:v6];
  objc_storeStrong((id *)&self->_currentView, obj);
  [v6 size];
  double v11 = v10;
  double v13 = v12;

  -[TVPPhotoView setImageSize:](self, "setImageSize:", v11, v13);
  -[TVPPhotoView setProgressStyle:](self, "setProgressStyle:", 3LL);
  v14 = (void *)objc_claimAutoreleasedReturnValue([obj superview]);

  if (!v14)
  {
    -[TVPPhotoView _removeAllSubviews](self, "_removeAllSubviews");
    -[TVPPhotoView addSubview:](self, "addSubview:", obj);
  }

  -[TVPPhotoView setNeedsLayout](self, "setNeedsLayout");
}

- (void)prepareForReuse
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[TVPPhotoView videoPlayer](self, "videoPlayer"));
  [v2 replaceCurrentItemWithPlayerItem:0];
}

- (void)playVitalityHint
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoView playerView](self, "playerView"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 superview]);

  if (v4)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVPPhotoView playerView](self, "playerView"));
    [v5 startPlaybackWithStyle:2];
  }

- (void)removeBadgeImageView
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView superview](self->_badgeImageView, "superview"));

  if (v3)
  {
    -[UIImageView removeFromSuperview](self->_badgeImageView, "removeFromSuperview");
    badgeImageView = self->_badgeImageView;
    self->_badgeImageView = 0LL;
  }

- (id)displayedImage
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoView imageView](self, "imageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 superview]);

  if (v3) {
    v3 = (void *)objc_claimAutoreleasedReturnValue([v2 image]);
  }

  return v3;
}

- (void)willAnimateToCaptionMode
{
}

- (void)willAnimateToFullScreenMode
{
}

- (void)didAnimateToCaptionMode
{
  badgeImageView = self->_badgeImageView;
  if (badgeImageView || !self->_isVideoView)
  {
    -[UIImageView setHidden:](badgeImageView, "setHidden:", 0LL);
  }

  else
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"Video"));
    -[TVPPhotoView setUpBadgeImageViewWithImage:](self, "setUpBadgeImageViewWithImage:", v4);
  }

- (void)didAnimateToFullScreenMode
{
  overlayView = self->_overlayView;
  if (overlayView || !self->_isVideoView)
  {
    -[UIView setHidden:](overlayView, "setHidden:", 0LL);
  }

  else
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"PlayVideo"));
    -[TVPPhotoView setUpVideoOverlayWithImage:](self, "setUpVideoOverlayWithImage:", v4);
  }

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen", a3.width, a3.height));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___TVPPhotoView;
  -[TVPPhotoView layoutSubviews](&v31, "layoutSubviews");
  currentView = self->_currentView;
  double v4 = (UIView *)objc_claimAutoreleasedReturnValue(-[TVPPhotoView spinner](self, "spinner"));

  double v5 = self->_currentView;
  if (currentView == v4)
  {
    -[TVPPhotoView frame](self, "frame");
    double v7 = v6 * 0.5;
    -[TVPPhotoView frame](self, "frame");
    -[UIView setCenter:](v5, "setCenter:", v7, v8 * 0.5);
  }

  else
  {
    -[TVPPhotoView bounds](self, "bounds");
    -[UIView setFrame:](v5, "setFrame:");
  }

  progressView = self->_progressView;
  if (progressView)
  {
    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[PXRoundProgressView superview](progressView, "superview"));

    if (!v10) {
      -[TVPPhotoView addSubview:](self, "addSubview:", self->_progressView);
    }
    -[TVPPhotoView bringSubviewToFront:](self, "bringSubviewToFront:", self->_progressView);
    -[TVPPhotoView _rectForProgressIndicator](self, "_rectForProgressIndicator");
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoView progressView](self, "progressView"));
    objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);
  }

  errorView = self->_errorView;
  if (errorView)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView superview](errorView, "superview"));

    if (!v21) {
      -[TVPPhotoView addSubview:](self, "addSubview:", self->_errorView);
    }
    -[TVPPhotoView bringSubviewToFront:](self, "bringSubviewToFront:", self->_errorView);
    -[TVPPhotoView _rectForProgressIndicator](self, "_rectForProgressIndicator");
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoView errorView](self, "errorView"));
    objc_msgSend(v30, "setFrame:", v23, v25, v27, v29);
  }

- (UIActivityIndicatorView)spinner
{
  spinner = self->_spinner;
  if (!spinner)
  {
    double v4 = -[UIActivityIndicatorView initWithActivityIndicatorStyle:]( objc_alloc(&OBJC_CLASS___UIActivityIndicatorView),  "initWithActivityIndicatorStyle:",  20LL);
    double v5 = self->_spinner;
    self->_spinner = v4;

    -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
    -[UIActivityIndicatorView setAutoresizingMask:]( self->_spinner,  "setAutoresizingMask:",  -[TVPPhotoView _autoresizingMask](self, "_autoresizingMask"));
    spinner = self->_spinner;
  }

  return spinner;
}

- (UIImageView)imageView
{
  imageView = self->_imageView;
  if (!imageView)
  {
    double v4 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    double v5 = self->_imageView;
    self->_imageView = v4;

    -[UIImageView setContentMode:](self->_imageView, "setContentMode:", 1LL);
    -[UIImageView setAutoresizingMask:]( self->_imageView,  "setAutoresizingMask:",  -[TVPPhotoView _autoresizingMask](self, "_autoresizingMask"));
    imageView = self->_imageView;
  }

  return imageView;
}

- (PHLivePhotoView)playerView
{
  playerView = self->_playerView;
  if (!playerView)
  {
    double v4 = objc_alloc_init(&OBJC_CLASS___PHLivePhotoView);
    double v5 = self->_playerView;
    self->_playerView = v4;

    -[PHLivePhotoView setContentMode:](self->_playerView, "setContentMode:", 1LL);
    -[PHLivePhotoView setDelegate:](self->_playerView, "setDelegate:", self);
    -[PHLivePhotoView setAutoresizingMask:]( self->_playerView,  "setAutoresizingMask:",  -[TVPPhotoView _autoresizingMask](self, "_autoresizingMask"));
    playerView = self->_playerView;
  }

  return playerView;
}

- (ISAnimatedImageView)animatedImageView
{
  animatedImageView = self->_animatedImageView;
  if (!animatedImageView)
  {
    double v4 = -[ISAnimatedImageView initWithAnimatedImagePlayer:]( objc_alloc(&OBJC_CLASS___ISAnimatedImageView),  "initWithAnimatedImagePlayer:",  0LL);
    double v5 = self->_animatedImageView;
    self->_animatedImageView = v4;

    -[ISAnimatedImageView setContentMode:](self->_animatedImageView, "setContentMode:", 1LL);
    animatedImageView = self->_animatedImageView;
  }

  return animatedImageView;
}

- (PXVideoPlayerView)videoPlayerView
{
  videoPlayerView = self->_videoPlayerView;
  if (!videoPlayerView)
  {
    double v4 = objc_alloc_init(&OBJC_CLASS___PXVideoPlayerView);
    double v5 = self->_videoPlayerView;
    self->_videoPlayerView = v4;

    -[PXVideoPlayerView setAllowsEdgeAntialiasing:](self->_videoPlayerView, "setAllowsEdgeAntialiasing:", 1LL);
    -[PXVideoPlayerView setVideoViewContentMode:](self->_videoPlayerView, "setVideoViewContentMode:", 1LL);
    -[PXVideoPlayerView setAutoresizingMask:]( self->_videoPlayerView,  "setAutoresizingMask:",  -[TVPPhotoView _autoresizingMask](self, "_autoresizingMask"));
    videoPlayerView = self->_videoPlayerView;
  }

  return videoPlayerView;
}

- (void)setUpVideoOverlayWithImage:(id)a3
{
  if (!self->_overlayView)
  {
    double v4 = objc_alloc(&OBJC_CLASS___UIVisualEffectView);
    double v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 4005LL));
    double v6 = -[UIVisualEffectView initWithEffect:](v4, "initWithEffect:", v5);

    -[UIView setClipsToBounds:](v6, "setClipsToBounds:", 1LL);
    -[TVPPhotoView bounds](self, "bounds");
    float v8 = (v7 + -140.0) * 0.5;
    double v9 = floorf(v8);
    -[TVPPhotoView bounds](self, "bounds");
    float v11 = (v10 + -140.0) * 0.5;
    -[UIView setFrame:](v6, "setFrame:", v9, floorf(v11), 140.0, 140.0);
    double v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v6, "layer"));
    [v12 setCornerRadius:70.0];

    -[UIView setAutoresizingMask:](v6, "setAutoresizingMask:", 45LL);
    double v13 = objc_alloc(&OBJC_CLASS___UIImageView);
    double v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"PlayVideo"));
    double v26 = -[UIImageView initWithImage:](v13, "initWithImage:", v14);

    double v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIView contentView](v6, "contentView"));
    [v15 addSubview:v26];

    double v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](v26, "image"));
    [v16 size];
    double v18 = v17;
    double v20 = v19;
    -[UIView bounds](v6, "bounds");
    double v22 = floor((v21 - v18) * 0.5);
    -[UIView bounds](v6, "bounds");
    -[UIImageView setFrame:](v26, "setFrame:", v22, floor((v23 - v20) * 0.5), v18, v20);
    overlayView = self->_overlayView;
    self->_overlayView = v6;
    double v25 = v6;

    -[TVPPhotoView addSubview:](self, "addSubview:", self->_overlayView);
  }

- (void)setUpBadgeImageViewWithImage:(id)a3
{
  if (!self->_badgeImageView)
  {
    id v4 = a3;
    -[TVPPhotoView bounds](self, "bounds");
    double v6 = v5;
    double v8 = v7;
    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoView imageView](self, "imageView"));
    double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 image]);
    [v10 size];
    double v12 = v11;
    double v14 = v13;

    double v15 = v6 / v12;
    if (v6 / v12 >= v8 / v14) {
      double v15 = v8 / v14;
    }
    float v16 = v12 * v15;
    float v17 = v14 * v15;
    double v18 = floorf(v17);
    float v19 = (v6 - floorf(v16)) * 0.5;
    double v20 = floorf(v19) + 20.0;
    [v4 size];
    double v22 = v21 + 20.0;
    *(float *)&double v21 = (v8 - v18) * 0.5;
    double v23 = v8 - (v22 + floorf(*(float *)&v21));
    [v4 size];
    double v25 = v24;
    [v4 size];
    double v27 = -[UIImageView initWithFrame:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithFrame:", v20, v23, v25, v26);
    badgeImageView = self->_badgeImageView;
    self->_badgeImageView = v27;

    -[UIImageView setImage:](self->_badgeImageView, "setImage:", v4);
    -[TVPPhotoView addSubview:](self, "addSubview:", self->_badgeImageView);
  }

- (void)setUpVideoOverlayWithSpinner
{
  if (!self->_overlayView)
  {
    v3 = -[UIActivityIndicatorView initWithActivityIndicatorStyle:]( objc_alloc(&OBJC_CLASS___UIActivityIndicatorView),  "initWithActivityIndicatorStyle:",  20LL);
    -[UIActivityIndicatorView startAnimating](v3, "startAnimating");
    -[UIActivityIndicatorView setAutoresizingMask:]( v3,  "setAutoresizingMask:",  -[TVPPhotoView _autoresizingMask](self, "_autoresizingMask"));
    -[TVPPhotoView frame](self, "frame");
    double v5 = v4 * 0.5;
    -[TVPPhotoView frame](self, "frame");
    -[UIActivityIndicatorView setCenter:](v3, "setCenter:", v5, v6 * 0.5);
    overlayView = self->_overlayView;
    self->_overlayView = &v3->super;
    double v8 = v3;

    -[TVPPhotoView addSubview:](self, "addSubview:", self->_overlayView);
  }

- (void)setUpProgressIndicator
{
  if (!self->_progressView)
  {
    [0 removeFromSuperview];
    v3 = objc_alloc(&OBJC_CLASS___PXRoundProgressView);
    -[TVPPhotoView _rectForProgressIndicator](self, "_rectForProgressIndicator");
    double v4 = -[PXRoundProgressView initWithFrame:style:](v3, "initWithFrame:style:", self->_progressStyle);
    progressView = self->_progressView;
    self->_progressView = v4;

    -[PXRoundProgressView setAlpha:](self->_progressView, "setAlpha:", 0.0);
    -[TVPPhotoView addSubview:](self, "addSubview:", self->_progressView);
    -[TVPPhotoView _hideError](self, "_hideError");
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10006F4E0;
    v6[3] = &unk_1000C9528;
    v6[4] = self;
    +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v6, 0.5);
  }

- (void)setUpErrorView
{
  if (!self->_errorView)
  {
    v3 = objc_alloc(&OBJC_CLASS___UIImageView);
    -[TVPPhotoView _rectForProgressIndicator](self, "_rectForProgressIndicator");
    double v4 = -[UIImageView initWithFrame:](v3, "initWithFrame:");
    errorView = self->_errorView;
    self->_errorView = v4;

    double v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"Loading_Error"));
    -[UIImageView setImage:](self->_errorView, "setImage:", v6);

    -[UIImageView setAlpha:](self->_errorView, "setAlpha:", 0.0);
    -[TVPPhotoView addSubview:](self, "addSubview:", self->_errorView);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10006F5E8;
    v7[3] = &unk_1000C9528;
    v7[4] = self;
    +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v7, 0.5);
  }

- (CGRect)_rectForProgressIndicator
{
  if (v3 + -68.0 >= 0.0) {
    double v4 = v3 + -68.0;
  }
  else {
    double v4 = 0.0;
  }
  -[TVPPhotoView bounds](self, "bounds");
  if (v5 + -68.0 >= 0.0) {
    double v6 = v5 + -68.0;
  }
  else {
    double v6 = 0.0;
  }
  p_imageSize = &self->_imageSize;
  if (self->_imageSize.height > 0.0 && p_imageSize->width > 0.0)
  {
    -[TVPPhotoView bounds](self, "bounds", p_imageSize->width);
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    v24.double width = p_imageSize->width;
    v24.double height = self->_imageSize.height;
    v27.origin.double x = v9;
    v27.origin.double y = v11;
    v27.size.double width = v13;
    v27.size.double height = v15;
    CGRect v25 = AVMakeRectWithAspectRatioInsideRect(v24, v27);
    double x = v25.origin.x;
    double y = v25.origin.y;
    double width = v25.size.width;
    double height = v25.size.height;
    if (!CGRectIsEmpty(v25))
    {
      if (x + width + -68.0 >= 0.0) {
        double v4 = x + width + -68.0;
      }
      else {
        double v4 = 0.0;
      }
      if (y + height + -68.0 >= 0.0) {
        double v6 = y + height + -68.0;
      }
      else {
        double v6 = 0.0;
      }
    }
  }

  double v20 = 53.0;
  double v21 = v4;
  double v22 = v6;
  double v23 = 53.0;
  result.size.double height = v23;
  result.size.double width = v20;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

- (void)_hideError
{
  if (self->_errorView)
  {
    v2[4] = self;
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_10006F7A0;
    v3[3] = &unk_1000C9528;
    v3[4] = self;
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472LL;
    v2[2] = sub_10006F7B8;
    v2[3] = &unk_1000C9680;
    +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v3,  v2,  0.5);
  }

- (void)hideProgress
{
  if (self->_progressView)
  {
    v2[4] = self;
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_10006F884;
    v3[3] = &unk_1000C9528;
    v3[4] = self;
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472LL;
    v2[2] = sub_10006F89C;
    v2[3] = &unk_1000C9680;
    +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v3,  v2,  0.5);
  }

- (void)setProgress:(double)a3
{
  self->_progress = a3;
  if (a3 < 1.0) {
    -[TVPPhotoView setUpProgressIndicator](self, "setUpProgressIndicator");
  }
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVPPhotoView progressView](self, "progressView"));
  *(float *)&double v5 = a3;
  [v6 setProgress:v5];
}

- (void)setProgressStyle:(int64_t)a3
{
  if (self->_progressStyle != a3)
  {
    self->_progressStyle = a3;
    -[PXRoundProgressView setStyle:](self->_progressView, "setStyle:");
  }

- (void)displayError
{
}

- (void)_removeAllSubviews
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoView subviews](self, "subviews"));
  [v3 makeObjectsPerformSelector:"removeFromSuperview"];

  overlayView = self->_overlayView;
  self->_overlayView = 0LL;

  badgeImageView = self->_badgeImageView;
  self->_badgeImageView = 0LL;

  progressView = self->_progressView;
  self->_progressView = 0LL;

  errorView = self->_errorView;
  self->_errorView = 0LL;
}

- (void)_removeVideoOverlayViews
{
  overlayView = self->_overlayView;
  if (overlayView)
  {
    -[UIView removeFromSuperview](overlayView, "removeFromSuperview");
    double v4 = self->_overlayView;
    self->_overlayView = 0LL;
  }

  badgeImageView = self->_badgeImageView;
  if (badgeImageView)
  {
    -[UIImageView removeFromSuperview](badgeImageView, "removeFromSuperview");
    id v6 = self->_badgeImageView;
    self->_badgeImageView = 0LL;
  }

- (UIGestureRecognizer)livePhotoGestureRecognizer
{
  return -[PHLivePhotoView playbackGestureRecognizer](self->_playerView, "playbackGestureRecognizer");
}

- (void)_removeLivePhotoGesture
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVPPhotoView superview](self, "superview"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoView playerView](self, "playerView"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 playbackGestureRecognizer]);
  [v5 removeGestureRecognizer:v4];
}

- (unint64_t)_autoresizingMask
{
  return 18LL;
}

- (int)currentRequestID
{
  return self->_currentRequestID;
}

- (void)setCurrentRequestID:(int)a3
{
  self->_currentRequestID = a3;
}

- (double)progress
{
  return self->_progress;
}

- (void)setSpinner:(id)a3
{
}

- (void)setImageView:(id)a3
{
}

- (UIImageView)badgeImageView
{
  return self->_badgeImageView;
}

- (void)setBadgeImageView:(id)a3
{
}

- (void)setPlayerView:(id)a3
{
}

- (void)setAnimatedImageView:(id)a3
{
}

- (void)setVideoPlayerView:(id)a3
{
}

- (ISWrappedAVPlayer)videoPlayer
{
  return self->_videoPlayer;
}

- (void)setVideoPlayer:(id)a3
{
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (void)setOverlayView:(id)a3
{
}

- (UIView)currentView
{
  return self->_currentView;
}

- (void)setCurrentView:(id)a3
{
}

- (PXRoundProgressView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
}

- (UIImageView)errorView
{
  return self->_errorView;
}

- (void)setErrorView:(id)a3
{
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)progressStyle
{
  return self->_progressStyle;
}

- (UIView)irisGestureRecognizerView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_irisGestureRecognizerView);
}

- (void)setIrisGestureRecognizerView:(id)a3
{
}

- (BOOL)isVideoView
{
  return self->_isVideoView;
}

- (void)setIsVideoView:(BOOL)a3
{
  self->_isVideoView = a3;
}

- (void).cxx_destruct
{
}

@end