@interface TVHPosterLockupPlaybackProgressOverlayView
- (UIView)playbackProgressView;
- (double)playbackProgress;
- (id)_playbackProgressViewForType:(unint64_t)a3;
- (unint64_t)_playbackProgressViewType;
- (void)layoutSubviews;
- (void)setPlaybackProgress:(double)a3;
- (void)setPlaybackProgressView:(id)a3;
@end

@implementation TVHPosterLockupPlaybackProgressOverlayView

- (void)setPlaybackProgress:(double)a3
{
  double v4 = fmin(fmax(a3, 0.0), 1.0);
  if ((BSFloatEqualToFloat(self->_playbackProgress, v4) & 1) == 0)
  {
    unint64_t v5 = -[TVHPosterLockupPlaybackProgressOverlayView _playbackProgressViewType](self, "_playbackProgressViewType");
    self->_playbackProgress = v4;
    unint64_t v6 = -[TVHPosterLockupPlaybackProgressOverlayView _playbackProgressViewType](self, "_playbackProgressViewType");
    if (v5 != v6)
    {
      unint64_t v7 = v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPosterLockupPlaybackProgressOverlayView playbackProgressView](self, "playbackProgressView"));
      [v8 removeFromSuperview];

      v9 = (void *)objc_claimAutoreleasedReturnValue( -[TVHPosterLockupPlaybackProgressOverlayView _playbackProgressViewForType:]( self,  "_playbackProgressViewForType:",  v7));
      if (v9) {
        -[TVHPosterLockupPlaybackProgressOverlayView addSubview:](self, "addSubview:", v9);
      }
      -[TVHPosterLockupPlaybackProgressOverlayView setPlaybackProgressView:](self, "setPlaybackProgressView:", v9);
      -[TVHPosterLockupPlaybackProgressOverlayView setNeedsLayout](self, "setNeedsLayout");
    }

    id v11 = (id)objc_claimAutoreleasedReturnValue(-[TVHPosterLockupPlaybackProgressOverlayView playbackProgressView](self, "playbackProgressView"));
    objc_opt_class(&OBJC_CLASS____TVProgressView);
    if ((objc_opt_isKindOfClass(v11, v10) & 1) != 0) {
      [v11 setProgress:self->_playbackProgress];
    }
  }

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___TVHPosterLockupPlaybackProgressOverlayView;
  -[TVHPosterLockupPlaybackProgressOverlayView layoutSubviews](&v17, "layoutSubviews");
  -[TVHPosterLockupPlaybackProgressOverlayView bounds](self, "bounds");
  double v4 = v3;
  double v6 = v5;
  unint64_t v7 = -[TVHPosterLockupPlaybackProgressOverlayView _playbackProgressViewType](self, "_playbackProgressViewType");
  if (v7 == 2)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPosterLockupPlaybackProgressOverlayView playbackProgressView](self, "playbackProgressView"));
    [v13 frame];
    double width = v14;
    double height = v15;

    double x = v4 + -10.0 - width;
    double y = v6 + -12.0 - height;
  }

  else
  {
    double v8 = v4 + -20.0;
    if (v7 == 1) {
      double x = 10.0;
    }
    else {
      double x = CGRectZero.origin.x;
    }
    if (v7 == 1) {
      double y = v6 + -18.0;
    }
    else {
      double y = CGRectZero.origin.y;
    }
    if (v7 == 1) {
      double width = v8;
    }
    else {
      double width = CGRectZero.size.width;
    }
    if (v7 == 1) {
      double height = 6.0;
    }
    else {
      double height = CGRectZero.size.height;
    }
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPosterLockupPlaybackProgressOverlayView playbackProgressView](self, "playbackProgressView"));
  objc_msgSend(v16, "setFrame:", x, y, width, height);
}

- (id)_playbackProgressViewForType:(unint64_t)a3
{
  if (a3 == 2)
  {
    double v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithPointSize:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithPointSize:",  23.0));
    double v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  @"checkmark.circle.fill",  v4));
    double v3 = -[UIImageView initWithImage:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithImage:", v5);
  }

  else if (a3 == 1)
  {
    double v3 = (UIImageView *)objc_alloc_init(&OBJC_CLASS____TVProgressView);
  }

  else
  {
    double v3 = 0LL;
  }

  return v3;
}

- (unint64_t)_playbackProgressViewType
{
  id v2 = -[TVHPosterLockupPlaybackProgressOverlayView playbackProgress](self, "playbackProgress");
  double v4 = v3;
  if ((BSFloatIsZero(v2, v3) & 1) != 0) {
    return 0LL;
  }
  return 1LL;
}

- (double)playbackProgress
{
  return self->_playbackProgress;
}

- (UIView)playbackProgressView
{
  return self->_playbackProgressView;
}

- (void)setPlaybackProgressView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end