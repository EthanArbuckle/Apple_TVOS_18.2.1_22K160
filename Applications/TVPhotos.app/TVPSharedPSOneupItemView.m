@interface TVPSharedPSOneupItemView
- (BOOL)isVideoItem;
- (TVImageProxy)imageProxy;
- (TVPImageView)oneUpItemView;
- (TVPImageView)playImageView;
- (TVPImageView)videoBadgeView;
- (UIActivityIndicatorView)spinnerView;
- (UIVisualEffectView)backdropView;
- (unint64_t)oneupMode;
- (void)_configureVideoBadgeView;
- (void)didAnimateToCaptionMode;
- (void)didAnimateToFullScreenMode;
- (void)layoutSubviews;
- (void)setBackdropView:(id)a3;
- (void)setImageProxy:(id)a3;
- (void)setIsVideoItem:(BOOL)a3;
- (void)setOneupMode:(unint64_t)a3;
- (void)setPlayImageView:(id)a3;
- (void)setSpinnerView:(id)a3;
- (void)setVideoBadgeView:(id)a3;
- (void)willAnimateToCaptionMode;
- (void)willAnimateToFullScreenMode;
@end

@implementation TVPSharedPSOneupItemView

- (void)setImageProxy:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)&self->_imageProxy, a3);
    -[UIActivityIndicatorView stopAnimating](self->_spinnerView, "stopAnimating");
    -[UIActivityIndicatorView removeFromSuperview](self->_spinnerView, "removeFromSuperview");
    spinnerView = self->_spinnerView;
    self->_spinnerView = 0LL;

    if (!self->_oneUpItemView)
    {
      v7 = objc_alloc_init(&OBJC_CLASS___TVPImageView);
      oneUpItemView = self->_oneUpItemView;
      self->_oneUpItemView = v7;

      v9 = self->_oneUpItemView;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
      -[TVPImageView setBackgroundColor:](v9, "setBackgroundColor:", v10);

      -[TVPSharedPSOneupItemView addSubview:](self, "addSubview:", self->_oneUpItemView);
    }

    objc_initWeak(&location, self);
    v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472LL;
    v16 = sub_100076BB4;
    v17 = &unk_1000CC5F0;
    objc_copyWeak(&v18, &location);
    v11 = objc_retainBlock(&v14);
    -[TVPImageView setContentMode:](self->_oneUpItemView, "setContentMode:", 4LL, v14, v15, v16, v17);
    if ((-[TVImageProxy isImageAvailable](self->_imageProxy, "isImageAvailable") & 1) == 0)
    {
      v12 = -[UIActivityIndicatorView initWithActivityIndicatorStyle:]( objc_alloc(&OBJC_CLASS___UIActivityIndicatorView),  "initWithActivityIndicatorStyle:",  20LL);
      v13 = self->_spinnerView;
      self->_spinnerView = v12;

      -[UIActivityIndicatorView startAnimating](self->_spinnerView, "startAnimating");
      -[TVPSharedPSOneupItemView addSubview:](self, "addSubview:", self->_spinnerView);
    }

    -[TVPImageView setImageProxy:completion:](self->_oneUpItemView, "setImageProxy:completion:", v5, v11);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

- (void)setIsVideoItem:(BOOL)a3
{
  self->_isVideoItem = a3;
  backdropView = self->_backdropView;
  if (a3)
  {
    if (!backdropView)
    {
      id v5 = objc_alloc(&OBJC_CLASS___UIVisualEffectView);
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 4005LL));
      v7 = -[UIVisualEffectView initWithEffect:](v5, "initWithEffect:", v6);
      v8 = self->_backdropView;
      self->_backdropView = v7;

      -[UIVisualEffectView setClipsToBounds:](self->_backdropView, "setClipsToBounds:", 1LL);
      -[TVPSharedPSOneupItemView addSubview:](self, "addSubview:", self->_backdropView);
      backdropView = self->_backdropView;
    }

    -[UIVisualEffectView setHidden:](backdropView, "setHidden:", self->_oneupMode != 1);
    playImageView = self->_playImageView;
    if (!playImageView)
    {
      v10 = objc_alloc_init(&OBJC_CLASS___TVPImageView);
      v11 = self->_playImageView;
      self->_playImageView = v10;

      v12 = self->_playImageView;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
      -[TVPImageView setBackgroundColor:](v12, "setBackgroundColor:", v13);

      -[TVPImageView setClipsToBounds:](self->_playImageView, "setClipsToBounds:", 1LL);
      if (!qword_100103390)
      {
        uint64_t v14 = objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"PlayVideo"));
        uint64_t v15 = (void *)qword_100103390;
        qword_100103390 = v14;
      }

      -[TVPImageView setImage:](self->_playImageView, "setImage:");
      -[TVPSharedPSOneupItemView addSubview:](self, "addSubview:", self->_playImageView);
      playImageView = self->_playImageView;
    }

    -[TVPImageView setHidden:](playImageView, "setHidden:", self->_oneupMode != 1);
    videoBadgeView = self->_videoBadgeView;
    if (!videoBadgeView)
    {
      v17 = objc_alloc_init(&OBJC_CLASS___TVPImageView);
      id v18 = self->_videoBadgeView;
      self->_videoBadgeView = v17;

      v19 = self->_videoBadgeView;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
      -[TVPImageView setBackgroundColor:](v19, "setBackgroundColor:", v20);

      -[TVPImageView setClipsToBounds:](self->_videoBadgeView, "setClipsToBounds:", 1LL);
      if (!qword_100103398)
      {
        uint64_t v21 = objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"Video"));
        v22 = (void *)qword_100103398;
        qword_100103398 = v21;
      }

      -[TVPImageView setImage:](self->_videoBadgeView, "setImage:");
      -[TVPImageView addSubview:](self->_oneUpItemView, "addSubview:", self->_videoBadgeView);
      videoBadgeView = self->_videoBadgeView;
    }

    -[TVPImageView setHidden:](videoBadgeView, "setHidden:", self->_oneupMode == 1);
  }

  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView superview](backdropView, "superview"));

    if (v23)
    {
      -[UIVisualEffectView removeFromSuperview](self->_backdropView, "removeFromSuperview");
      v24 = self->_backdropView;
      self->_backdropView = 0LL;
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVPImageView superview](self->_playImageView, "superview"));

    if (v25)
    {
      -[TVPImageView removeFromSuperview](self->_playImageView, "removeFromSuperview");
      v26 = self->_playImageView;
      self->_playImageView = 0LL;
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[TVPImageView superview](self->_videoBadgeView, "superview"));

    if (v27)
    {
      -[TVPImageView removeFromSuperview](self->_videoBadgeView, "removeFromSuperview");
      v28 = self->_videoBadgeView;
      self->_videoBadgeView = 0LL;
    }
  }

- (void)willAnimateToCaptionMode
{
}

- (void)didAnimateToCaptionMode
{
}

- (void)willAnimateToFullScreenMode
{
}

- (void)didAnimateToFullScreenMode
{
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___TVPSharedPSOneupItemView;
  -[TVPSharedPSOneupItemView layoutSubviews](&v21, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[TVPSharedPSOneupItemView setBackgroundColor:](self, "setBackgroundColor:", v3);

  -[TVPSharedPSOneupItemView bounds](self, "bounds");
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  -[TVPImageView setFrame:](self->_oneUpItemView, "setFrame:");
  id v12 = +[UIActivityIndicatorView defaultSizeForStyle:]( &OBJC_CLASS___UIActivityIndicatorView,  "defaultSizeForStyle:",  20LL);
  UIRectCenteredIntegralRect(v12, CGPointZero.x, CGPointZero.y, v13, v14, v5, v7, v9, v11);
  -[UIActivityIndicatorView setFrame:](self->_spinnerView, "setFrame:");
  if (self->_isVideoItem)
  {
    float v15 = (v9 + -140.0) * 0.5;
    float v16 = (v11 + -140.0) * 0.5;
    -[UIVisualEffectView setFrame:](self->_backdropView, "setFrame:", floorf(v15), floorf(v16), 140.0, 140.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView layer](self->_backdropView, "layer"));
    [v17 setCornerRadius:70.0];

    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVPImageView image](self->_playImageView, "image"));
    [v18 size];
    -[TVPImageView setFrame:]( self->_playImageView,  "setFrame:",  floor((v9 - v19) * 0.5),  floor((v11 - v20) * 0.5),  v19,  v20);
  }

- (void)_configureVideoBadgeView
{
  if (self->_oneupMode == 4 && self->_isVideoItem)
  {
    -[TVPSharedPSOneupItemView bounds](self, "bounds");
    double v4 = v3;
    double v6 = v5;
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPImageView image](self->_oneUpItemView, "image"));
    [v7 size];
    double v9 = v8;
    double v11 = v10;

    double v12 = v4 / v9;
    if (v4 / v9 >= v6 / v11) {
      double v12 = v6 / v11;
    }
    float v13 = v9 * v12;
    float v14 = v11 * v12;
    double v15 = floorf(v14);
    float v16 = (v4 - floorf(v13)) * 0.5;
    double v17 = floorf(v16) + 20.0;
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVPImageView image](self->_videoBadgeView, "image"));
    [v18 size];
    double v20 = v19 + 20.0;
    *(float *)&double v19 = (v6 - v15) * 0.5;
    double v21 = v20 + floorf(*(float *)&v19);

    double v22 = v6 - v21;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVPImageView image](self->_videoBadgeView, "image"));
    [v23 size];
    double v25 = v24;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[TVPImageView image](self->_videoBadgeView, "image"));
    [v26 size];
    double v28 = v27;

    -[TVPImageView setFrame:](self->_videoBadgeView, "setFrame:", v17, v22, v25, v28);
  }

- (TVImageProxy)imageProxy
{
  return self->_imageProxy;
}

- (TVPImageView)oneUpItemView
{
  return self->_oneUpItemView;
}

- (unint64_t)oneupMode
{
  return self->_oneupMode;
}

- (void)setOneupMode:(unint64_t)a3
{
  self->_oneupMode = a3;
}

- (BOOL)isVideoItem
{
  return self->_isVideoItem;
}

- (UIVisualEffectView)backdropView
{
  return self->_backdropView;
}

- (void)setBackdropView:(id)a3
{
}

- (TVPImageView)playImageView
{
  return self->_playImageView;
}

- (void)setPlayImageView:(id)a3
{
}

- (TVPImageView)videoBadgeView
{
  return self->_videoBadgeView;
}

- (void)setVideoBadgeView:(id)a3
{
}

- (UIActivityIndicatorView)spinnerView
{
  return self->_spinnerView;
}

- (void)setSpinnerView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end