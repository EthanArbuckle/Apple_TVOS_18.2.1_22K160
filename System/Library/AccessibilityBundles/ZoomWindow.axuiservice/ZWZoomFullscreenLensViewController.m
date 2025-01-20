@interface ZWZoomFullscreenLensViewController
- (CGPoint)maximumPanOffsetWithZoomFactor:(double)a3;
- (id)identifier;
- (void)_applyInitialLayoutConstraints;
@end

@implementation ZWZoomFullscreenLensViewController

- (void)_applyInitialLayoutConstraints
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ZWZoomFullscreenLensViewController;
  -[ZWZoomLensViewController _applyInitialLayoutConstraints](&v9, "_applyInitialLayoutConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomFullscreenLensViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController lensZoomView](self, "lensZoomView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v4,  1LL,  0LL,  v3,  1LL,  1.0,  0.0));
  [v3 addConstraint:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v4,  2LL,  0LL,  v3,  2LL,  1.0,  0.0));
  [v3 addConstraint:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v4,  3LL,  0LL,  v3,  3LL,  1.0,  0.0));
  [v3 addConstraint:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v4,  4LL,  0LL,  v3,  4LL,  1.0,  0.0));
  [v3 addConstraint:v8];
}

- (id)identifier
{
  return AXZoomLensModeFullscreen;
}

- (CGPoint)maximumPanOffsetWithZoomFactor:(double)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomFullscreenLensViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 window]);
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;

  double v11 = ZWGetTestingScreenSize();
  if (v11 != CGSizeZero.width || v12 != CGSizeZero.height)
  {
    double v8 = ZWGetTestingScreenSize();
    double v11 = ZWGetTestingScreenSize();
    double v10 = v14;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ZWZoomLensViewController lensZoomView](self, "lensZoomView", v11));
  [v15 sampledContentSizeWithZoomFactor:a3];
  double v17 = v16;
  double v19 = v18;

  double v20 = (v8 - v17) * 0.5;
  double v21 = (v10 - v19) * 0.5;
  result.y = v21;
  result.x = v20;
  return result;
}

@end