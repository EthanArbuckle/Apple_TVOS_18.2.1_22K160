@interface TVHPosterLockup
+ (id)_contentViewWithLockupLayout:(id)a3;
- (NSString)subtitle;
- (NSString)title;
- (TVHPlaceholder)placeholder;
- (TVImageProxy)imageProxy;
- (UIImage)image;
- (double)cornerRadius;
- (double)imageCornerRadius;
- (double)playbackProgress;
- (unint64_t)overlayType;
- (void)_updatePlaybackProggressOverlayView:(id)a3;
- (void)_updatePlaybackProggressOverlayViewIfPossible;
- (void)setFocusedSizeIncrease:(double)a3;
- (void)setImage:(id)a3;
- (void)setImageCornerRadius:(double)a3;
- (void)setImageProxy:(id)a3;
- (void)setOverlayType:(unint64_t)a3;
- (void)setPlaceholder:(id)a3;
- (void)setPlaybackProgress:(double)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation TVHPosterLockup

- (void)setImage:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHPosterLockup _lockupImageView](self, "_lockupImageView"));
  [v5 setImage:v4];
}

- (UIImage)image
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPosterLockup _lockupImageView](self, "_lockupImageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 image]);

  return (UIImage *)v3;
}

- (void)setImageProxy:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHPosterLockup _lockupImageView](self, "_lockupImageView"));
  [v5 setImageProxy:v4];
}

- (TVImageProxy)imageProxy
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPosterLockup _lockupImageView](self, "_lockupImageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 imageProxy]);

  return (TVImageProxy *)v3;
}

- (void)setPlaceholder:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHPosterLockup _lockupImageView](self, "_lockupImageView"));
  [v5 setPlaceholder:v4];
}

- (TVHPlaceholder)placeholder
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPosterLockup _lockupImageView](self, "_lockupImageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 placeholder]);

  return (TVHPlaceholder *)v3;
}

- (void)setImageCornerRadius:(double)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVHPosterLockup _lockupImageView](self, "_lockupImageView"));
  [v4 setCornerRadius:a3];
}

- (double)imageCornerRadius
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPosterLockup _lockupImageView](self, "_lockupImageView"));
  [v2 cornerRadius];
  double v4 = v3;

  return v4;
}

- (void)setOverlayType:(unint64_t)a3
{
  if (self->_overlayType != a3)
  {
    self->_overlayType = a3;
    if (a3 == 1)
    {
      double v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithScale:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithScale:",  3LL));
      id v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  @"video.fill",  v4));

      v7 = objc_alloc_init(&OBJC_CLASS___TVHPosterLockupBadgeOverlayView);
      -[TVHPosterLockupBadgeOverlayView setBadgeImage:](v7, "setBadgeImage:", v5);
    }

    else if (a3 == 2)
    {
      v7 = objc_alloc_init(&OBJC_CLASS___TVHPosterLockupPlaybackProgressOverlayView);
      -[TVHPosterLockup _updatePlaybackProggressOverlayView:](self, "_updatePlaybackProggressOverlayView:");
    }

    else
    {
      v7 = 0LL;
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPosterLockup _lockupImageView](self, "_lockupImageView"));
    [v6 setOverlayView:v7];
  }

- (void)setPlaybackProgress:(double)a3
{
  double v4 = fmin(fmax(a3, 0.0), 1.0);
  if ((BSFloatEqualToFloat(self->_playbackProgress, v4) & 1) == 0)
  {
    self->_playbackProgress = v4;
    -[TVHPosterLockup _updatePlaybackProggressOverlayViewIfPossible]( self,  "_updatePlaybackProggressOverlayViewIfPossible");
  }

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVHSimpleLockup simpleFooterView](self, "simpleFooterView"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 titleLabel]);
  [v5 setText:v4];
}

- (NSString)title
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSimpleLockup simpleFooterView](self, "simpleFooterView"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 titleLabel]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 text]);

  return (NSString *)v4;
}

- (void)setSubtitle:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVHSimpleLockup simpleFooterView](self, "simpleFooterView"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 subtitleLabel]);
  [v5 setText:v4];
}

- (NSString)subtitle
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSimpleLockup simpleFooterView](self, "simpleFooterView"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 subtitleLabel]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 text]);

  return (NSString *)v4;
}

- (void)setFocusedSizeIncrease:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVHPosterLockup;
  -[TVHLockup setFocusedSizeIncrease:](&v6, "setFocusedSizeIncrease:");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPosterLockup _lockupImageView](self, "_lockupImageView"));
  [v5 setFocusedSizeIncrease:a3];
}

+ (id)_contentViewWithLockupLayout:(id)a3
{
  id v5 = -[TVHLockupImageView initWithFrame:]( objc_alloc(&OBJC_CLASS___TVHLockupImageView),  "initWithFrame:",  0.0,  0.0,  v3,  v4);
  -[TVHMediaImageView setContentMode:](v5, "setContentMode:", 1LL);
  return v5;
}

- (void)_updatePlaybackProggressOverlayViewIfPossible
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHPosterLockup _lockupImageView](self, "_lockupImageView"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v5 overlayView]);
  objc_opt_class(&OBJC_CLASS___TVHPosterLockupPlaybackProgressOverlayView);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    -[TVHPosterLockup _updatePlaybackProggressOverlayView:](self, "_updatePlaybackProggressOverlayView:", v3);
  }
}

- (void)_updatePlaybackProggressOverlayView:(id)a3
{
  id v4 = a3;
  -[TVHPosterLockup playbackProgress](self, "playbackProgress");
  objc_msgSend(v4, "setPlaybackProgress:");
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (unint64_t)overlayType
{
  return self->_overlayType;
}

- (double)playbackProgress
{
  return self->_playbackProgress;
}

@end