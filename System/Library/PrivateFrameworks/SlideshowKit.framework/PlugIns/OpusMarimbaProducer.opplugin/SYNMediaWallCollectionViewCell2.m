@interface SYNMediaWallCollectionViewCell2
- (BOOL)hasImage;
- (BOOL)isFiltered;
- (CGRect)_contentsRectForRegionOfInterestContainerBounds:(CGRect)a3;
- (CGRect)imageContentsRect;
- (MCAssetVideo)mediaItem;
- (MZMediaManagement)assetManagementDelegate;
- (SYNMediaWallCollectionViewCell2)initWithFrame:(CGRect)a3;
- (UIColor)borderColor;
- (UIColor)selectedBorderColor;
- (id)image;
- (id)snapshot;
- (void)animatePop;
- (void)blinkSelection;
- (void)dealloc;
- (void)prepareForReuse;
- (void)setAntialiasing:(BOOL)a3;
- (void)setAssetManagementDelegate:(id)a3;
- (void)setBadge:(id)a3;
- (void)setBorderColor:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImage:(id)a3 animated:(BOOL)a4;
- (void)setIsFiltered:(BOOL)a3;
- (void)setMediaItem:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectedBorderColor:(id)a3;
- (void)setUseShadow:(BOOL)a3;
- (void)updateImageContentsRect;
- (void)updateShadowPath;
- (void)updateVideoFooter;
@end

@implementation SYNMediaWallCollectionViewCell2

- (SYNMediaWallCollectionViewCell2)initWithFrame:(CGRect)a3
{
  double width = a3.size.width;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___SYNMediaWallCollectionViewCell2;
  v4 = -[SYNMediaWallCollectionViewCell2 initWithFrame:]( &v22,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v5 = v4;
  if (v4)
  {
    v4->_mediaItem = 0LL;
    v4->_mediaWallViewController = 0LL;
    v4->_videoLabelView = 0LL;
    v4->_isFiltered = 0;
    v6 = objc_alloc(&OBJC_CLASS___SYNMediaWallCollectionViewCellMainView2);
    objc_msgSend(-[SYNMediaWallCollectionViewCell2 contentView](v5, "contentView"), "bounds");
    v7 = -[SYNMediaWallCollectionViewCellMainView2 initWithFrame:](v6, "initWithFrame:");
    v5->_mainView = v7;
    -[SYNMediaWallCollectionViewCellMainView2 setAutoresizingMask:](v7, "setAutoresizingMask:", 18LL);
    -[SYNMediaWallCollectionViewCellMainView2 setBackgroundColor:]( v5->_mainView,  "setBackgroundColor:",  +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.200000003, 1.0));
    -[SYNMediaWallCollectionViewCellMainView2 setOpaque:](v5->_mainView, "setOpaque:", 1LL);
    objc_msgSend( -[SYNMediaWallCollectionViewCellMainView2 layer](v5->_mainView, "layer"),  "setEdgeAntialiasingMask:",  0);
    objc_msgSend( -[SYNMediaWallCollectionViewCellMainView2 layer](v5->_mainView, "layer"),  "setShadowColor:",  -[UIColor CGColor]( +[UIColor colorWithRed:green:blue:alpha:]( UIColor,  "colorWithRed:green:blue:alpha:",  0.0,  0.0,  0.0,  1.0),  "CGColor"));
    objc_msgSend(-[SYNMediaWallCollectionViewCellMainView2 layer](v5->_mainView, "layer"), "setShadowOffset:", 0.0, 0.0);
    UIUserInterfaceIdiom v8 = -[UIDevice userInterfaceIdiom]( +[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"),  "userInterfaceIdiom");
    id v9 = -[SYNMediaWallCollectionViewCellMainView2 layer](v5->_mainView, "layer");
    double v10 = 2.0;
    if (v8 == UIUserInterfaceIdiomPhone) {
      double v10 = 1.0;
    }
    [v9 setShadowRadius:v10];
    id v11 = -[SYNMediaWallCollectionViewCellMainView2 layer](v5->_mainView, "layer");
    LODWORD(v12) = 1.0;
    [v11 setShadowOpacity:v12];
    -[SYNMediaWallCollectionViewCell2 bounds](v5, "bounds");
    objc_msgSend( -[SYNMediaWallCollectionViewCellMainView2 layer](v5->_mainView, "layer"),  "setShadowPath:",  -[UIBezierPath CGPath]( +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:"),  "CGPath"));
    objc_msgSend(-[SYNMediaWallCollectionViewCellMainView2 layer](v5->_mainView, "layer"), "setBorderColor:", 0);
    objc_msgSend(-[SYNMediaWallCollectionViewCellMainView2 layer](v5->_mainView, "layer"), "setBorderWidth:", 0.0);
    v13 = objc_alloc(&OBJC_CLASS___UIImageView);
    -[SYNMediaWallCollectionViewCellMainView2 bounds](v5->_mainView, "bounds");
    v14 = -[UIImageView initWithFrame:](v13, "initWithFrame:");
    v5->_imageView = v14;
    -[UIImageView setAutoresizingMask:](v14, "setAutoresizingMask:", 18LL);
    -[UIImageView setClipsToBounds:](v5->_imageView, "setClipsToBounds:", 1LL);
    -[UIImageView setContentMode:](v5->_imageView, "setContentMode:", 2LL);
    -[UIImageView setOpaque:](v5->_imageView, "setOpaque:", 1LL);
    objc_msgSend(-[UIImageView layer](v5->_imageView, "layer"), "setEdgeAntialiasingMask:", 0);
    if (-[UIDevice userInterfaceIdiom]( +[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"),  "userInterfaceIdiom"))
    {
      double v15 = 18.0;
    }

    else
    {
      double v15 = 12.0;
    }

    v16 = -[UIImageView initWithFrame:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithFrame:", 4.0, 4.0, v15, v15);
    v5->_badgeView = v16;
    -[UIImageView setAutoresizingMask:](v16, "setAutoresizingMask:", 36LL);
    -[UIImageView setClipsToBounds:](v5->_badgeView, "setClipsToBounds:", 1LL);
    -[UIImageView setContentMode:](v5->_badgeView, "setContentMode:", 0LL);
    -[UIImageView setOpaque:](v5->_badgeView, "setOpaque:", 0LL);
    -[UIImageView setAlpha:](v5->_badgeView, "setAlpha:", 0.5);
    objc_msgSend(-[UIImageView layer](v5->_badgeView, "layer"), "setEdgeAntialiasingMask:", 0);
    -[UIImageView setHidden:](v5->_badgeView, "setHidden:", 1LL);
    objc_msgSend(-[SYNMediaWallCollectionViewCell2 contentView](v5, "contentView"), "addSubview:", v5->_mainView);
    -[SYNMediaWallCollectionViewCellMainView2 addSubview:](v5->_mainView, "addSubview:", v5->_imageView);
    -[SYNMediaWallCollectionViewCellMainView2 addSubview:](v5->_mainView, "addSubview:", v5->_badgeView);
    UIUserInterfaceIdiom v17 = -[UIDevice userInterfaceIdiom]( +[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"),  "userInterfaceIdiom");
    if (v17) {
      double v18 = 22.0;
    }
    else {
      double v18 = 15.0;
    }
    if (v17) {
      double v19 = 23.0;
    }
    else {
      double v19 = 16.0;
    }
    v20 = -[UIImageView initWithFrame:]( objc_alloc(&OBJC_CLASS___UIImageView),  "initWithFrame:",  round(width - v19 + -2.0),  2.0,  v19,  v18);
    v5->_commentsView = v20;
    -[UIImageView setAutoresizingMask:](v20, "setAutoresizingMask:", 33LL);
    -[UIImageView setClipsToBounds:](v5->_commentsView, "setClipsToBounds:", 1LL);
    -[UIImageView setContentMode:](v5->_commentsView, "setContentMode:", 0LL);
    -[UIImageView setOpaque:](v5->_commentsView, "setOpaque:", 0LL);
    objc_msgSend(-[UIImageView layer](v5->_commentsView, "layer"), "setEdgeAntialiasingMask:", 0);
    -[UIImageView setHidden:](v5->_commentsView, "setHidden:", 1LL);
    objc_msgSend(-[SYNMediaWallCollectionViewCell2 contentView](v5, "contentView"), "addSubview:", v5->_commentsView);
    v5->_borderColor = 0LL;
  }

  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SYNMediaWallCollectionViewCell2;
  -[SYNMediaWallCollectionViewCell2 dealloc](&v3, "dealloc");
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[SYNMediaWallCollectionViewCell2 frame](self, "frame");
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SYNMediaWallCollectionViewCell2;
  -[SYNMediaWallCollectionViewCell2 setBounds:](&v13, "setBounds:", x, y, width, height);
  if (v9 != width || v11 != height) {
    -[SYNMediaWallCollectionViewCell2 updateShadowPath](self, "updateShadowPath");
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[SYNMediaWallCollectionViewCell2 frame](self, "frame");
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SYNMediaWallCollectionViewCell2;
  -[SYNMediaWallCollectionViewCell2 setFrame:](&v13, "setFrame:", x, y, width, height);
  if (v9 != width || v11 != height) {
    -[SYNMediaWallCollectionViewCell2 updateShadowPath](self, "updateShadowPath");
  }
}

- (void)updateShadowPath
{
}

- (void)setBorderColor:(id)a3
{
  if ((-[SYNMediaWallCollectionViewCell2 isSelected](self, "isSelected") & 1) == 0)
  {
    id v5 = -[SYNMediaWallCollectionViewCellMainView2 layer](self->_mainView, "layer");
    if (a3)
    {
      [v5 setBorderWidth:1.0];
      id v6 = [a3 CGColor];
    }

    else
    {
      [v5 setBorderWidth:0.0];
      id v6 = 0LL;
    }

    objc_msgSend(-[SYNMediaWallCollectionViewCellMainView2 layer](self->_mainView, "layer"), "setBorderColor:", v6);
  }

  self->_borderColor = (UIColor *)a3;
}

- (void)setSelectedBorderColor:(id)a3
{
  if (-[SYNMediaWallCollectionViewCell2 isSelected](self, "isSelected"))
  {
    id v5 = -[SYNMediaWallCollectionViewCellMainView2 layer](self->_mainView, "layer");
    if (a3)
    {
      [v5 setBorderWidth:1.0];
      objc_msgSend( -[SYNMediaWallCollectionViewCellMainView2 layer](self->_mainView, "layer"),  "setBorderColor:",  objc_msgSend(a3, "CGColor"));
      id v6 = (UIColor *)a3;
    }

    else
    {
      [v5 setBorderWidth:0.0];
      objc_msgSend(-[SYNMediaWallCollectionViewCellMainView2 layer](self->_mainView, "layer"), "setBorderColor:", 0);
      id v6 = +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.0,  0.0,  0.0,  1.0);
    }

    objc_msgSend( -[SYNMediaWallCollectionViewCellMainView2 layer](self->_mainView, "layer"),  "setShadowColor:",  -[UIColor CGColor](v6, "CGColor"));
  }

  self->_selectedBorderColor = (UIColor *)a3;
}

- (void)setAssetManagementDelegate:(id)a3
{
}

- (MZMediaManagement)assetManagementDelegate
{
  return (MZMediaManagement *)objc_loadWeak((id *)&self->_assetManagementDelegate);
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SYNMediaWallCollectionViewCell2;
  -[SYNMediaWallCollectionViewCell2 prepareForReuse](&v4, "prepareForReuse");
  -[SYNMediaWallCollectionViewCell2 setMediaItem:](self, "setMediaItem:", 0LL);
  -[SYNMediaWallCollectionViewCell2 setIsFiltered:](self, "setIsFiltered:", 0LL);
  -[SYNMediaWallCollectionViewCell2 setImage:animated:](self, "setImage:animated:", 0LL, 0LL);
  -[SYNMediaWallCollectionViewCell2 setBadge:](self, "setBadge:", 0LL);
  -[UIImageView setHidden:](self->_commentsView, "setHidden:", 1LL);
  videoLabelView = self->_videoLabelView;
  if (videoLabelView)
  {
    -[UIView removeFromSuperview](videoLabelView, "removeFromSuperview");

    self->_videoLabelView = 0LL;
  }

- (void)setAntialiasing:(BOOL)a3
{
  if (a3) {
    uint64_t v4 = 15LL;
  }
  else {
    uint64_t v4 = 0LL;
  }
  objc_msgSend( -[SYNMediaWallCollectionViewCellMainView2 layer](self->_mainView, "layer"),  "setEdgeAntialiasingMask:",  v4);
  objc_msgSend(-[UIImageView layer](self->_imageView, "layer"), "setEdgeAntialiasingMask:", v4);
}

- (void)setUseShadow:(BOOL)a3
{
  if (a3) {
    float v3 = 1.0;
  }
  else {
    float v3 = 0.0;
  }
  id v4 = -[SYNMediaWallCollectionViewCellMainView2 layer](self->_mainView, "layer");
  *(float *)&double v5 = v3;
  [v4 setShadowOpacity:v5];
}

- (void)setImage:(id)a3 animated:(BOOL)a4
{
  if (a3)
  {
    if (a4)
    {
      id v6 = +[CABasicAnimation animationWithKeyPath:]( &OBJC_CLASS___CABasicAnimation,  "animationWithKeyPath:",  @"opacity");
      -[CABasicAnimation setDuration:](v6, "setDuration:", 0.150000006);
      LODWORD(v7) = 0;
      -[CABasicAnimation setFromValue:]( v6,  "setFromValue:",  +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v7));
      LODWORD(v8) = 1.0;
      -[CABasicAnimation setToValue:]( v6,  "setToValue:",  +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v8));
      -[CABasicAnimation setRemovedOnCompletion:](v6, "setRemovedOnCompletion:", 1LL);
      objc_msgSend(-[UIImageView layer](self->_imageView, "layer"), "addAnimation:forKey:", v6, @"opacity");
      id v9 = -[UIImageView layer](self->_imageView, "layer");
      LODWORD(v10) = 1.0;
      [v9 setOpacity:v10];
    }

    -[UIImageView setImage:](self->_imageView, "setImage:", a3);
    -[SYNMediaWallCollectionViewCellMainView2 setBackgroundColor:]( self->_mainView,  "setBackgroundColor:",  +[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  }

  else
  {
    -[SYNMediaWallCollectionViewCellMainView2 setBackgroundColor:]( self->_mainView,  "setBackgroundColor:",  +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0LL, a4, 0.200000003, 1.0));
    objc_msgSend(-[UIImageView layer](self->_imageView, "layer"), "removeAllAnimations");
    -[UIImageView setImage:](self->_imageView, "setImage:", 0LL);
  }

  -[SYNMediaWallCollectionViewCell2 updateImageContentsRect](self, "updateImageContentsRect");
}

- (void)setBadge:(id)a3
{
  -[UIImageView setHidden:](self->_badgeView, "setHidden:", a3 == 0LL);
}

- (BOOL)hasImage
{
  return -[UIImageView image](self->_imageView, "image") != 0LL;
}

- (id)image
{
  return -[UIImageView image](self->_imageView, "image");
}

- (void)setIsFiltered:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = -[SYNMediaWallCollectionViewCell2 contentView](self, "contentView");
  double v6 = 0.200000003;
  if (!v3) {
    double v6 = 1.0;
  }
  [v5 setAlpha:v6];
  self->_isFiltered = v3;
}

- (BOOL)isFiltered
{
  return self->_isFiltered;
}

- (void)blinkSelection
{
  if (-[SYNMediaWallCollectionViewCell2 isSelected](self, "isSelected"))
  {
    if (-[SYNMediaWallCollectionViewCell2 borderColor](self, "borderColor"))
    {
      objc_msgSend( -[SYNMediaWallCollectionViewCellMainView2 layer](self->_mainView, "layer"),  "setBorderColor:",  -[UIColor CGColor](-[SYNMediaWallCollectionViewCell2 borderColor](self, "borderColor"), "CGColor"));
      objc_msgSend(-[SYNMediaWallCollectionViewCellMainView2 layer](self->_mainView, "layer"), "setBorderWidth:", 1.0);
    }

    else
    {
      objc_msgSend(-[SYNMediaWallCollectionViewCellMainView2 layer](self->_mainView, "layer"), "setBorderWidth:", 0.0);
      objc_msgSend( -[SYNMediaWallCollectionViewCellMainView2 layer](self->_mainView, "layer"),  "setShadowColor:",  -[UIColor CGColor]( +[UIColor colorWithRed:green:blue:alpha:]( UIColor,  "colorWithRed:green:blue:alpha:",  0.0,  0.0,  0.0,  1.0),  "CGColor"));
    }

    -[NSRunLoop runUntilDate:]( +[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"),  "runUntilDate:",  +[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 0.100000001));
    selectedBorderColor = self->_selectedBorderColor;
    p_mainView = &self->_mainView;
    id v8 = -[SYNMediaWallCollectionViewCellMainView2 layer](self->_mainView, "layer");
    if (selectedBorderColor)
    {
      [v8 setBorderWidth:2.0];
      objc_msgSend( -[SYNMediaWallCollectionViewCellMainView2 layer](*p_mainView, "layer"),  "setBorderColor:",  -[UIColor CGColor](self->_selectedBorderColor, "CGColor"));
      id v9 = self->_selectedBorderColor;
    }

    else
    {
      [v8 setBorderWidth:0.0];
      objc_msgSend(-[SYNMediaWallCollectionViewCellMainView2 layer](*p_mainView, "layer"), "setBorderColor:", 0);
      id v9 = +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.0,  0.0,  0.0,  1.0);
    }

    double v10 = -[UIColor CGColor](v9, "CGColor");
  }

  else
  {
    BOOL v3 = self->_selectedBorderColor;
    id v4 = -[SYNMediaWallCollectionViewCellMainView2 layer](self->_mainView, "layer");
    if (v3)
    {
      [v4 setBorderWidth:2.0];
      objc_msgSend( -[SYNMediaWallCollectionViewCellMainView2 layer](self->_mainView, "layer"),  "setBorderColor:",  -[UIColor CGColor](self->_selectedBorderColor, "CGColor"));
      id v5 = self->_selectedBorderColor;
    }

    else
    {
      [v4 setBorderWidth:0.0];
      objc_msgSend(-[SYNMediaWallCollectionViewCellMainView2 layer](self->_mainView, "layer"), "setBorderColor:", 0);
      id v5 = +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.0,  0.0,  0.0,  1.0);
    }

    objc_msgSend( -[SYNMediaWallCollectionViewCellMainView2 layer](self->_mainView, "layer"),  "setShadowColor:",  -[UIColor CGColor](v5, "CGColor"));
    -[NSRunLoop runUntilDate:]( +[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"),  "runUntilDate:",  +[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 0.100000001));
    if (-[SYNMediaWallCollectionViewCell2 borderColor](self, "borderColor"))
    {
      objc_msgSend( -[SYNMediaWallCollectionViewCellMainView2 layer](self->_mainView, "layer"),  "setBorderColor:",  -[UIColor CGColor](-[SYNMediaWallCollectionViewCell2 borderColor](self, "borderColor"), "CGColor"));
      objc_msgSend(-[SYNMediaWallCollectionViewCellMainView2 layer](self->_mainView, "layer"), "setBorderWidth:", 1.0);
    }

    else
    {
      objc_msgSend(-[SYNMediaWallCollectionViewCellMainView2 layer](self->_mainView, "layer"), "setBorderWidth:", 0.0);
      objc_msgSend(-[SYNMediaWallCollectionViewCellMainView2 layer](self->_mainView, "layer"), "setBorderColor:", 0);
    }

    double v10 = -[UIColor CGColor]( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.0,  0.0,  0.0,  1.0),  "CGColor");
    p_mainView = &self->_mainView;
  }

  objc_msgSend(-[SYNMediaWallCollectionViewCellMainView2 layer](*p_mainView, "layer"), "setShadowColor:", v10);
  -[NSRunLoop runUntilDate:]( +[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"),  "runUntilDate:",  +[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 0.100000001));
}

- (void)animatePop
{
  BOOL v3 = +[CABasicAnimation animationWithKeyPath:]( &OBJC_CLASS___CABasicAnimation,  "animationWithKeyPath:",  @"transform");
  id v4 = objc_msgSend(-[SYNMediaWallCollectionViewCell2 contentView](self, "contentView"), "layer");
  if (v4) {
    [v4 transform];
  }
  else {
    memset(&v8, 0, sizeof(v8));
  }
  CATransform3DGetAffineTransform(&v9, &v8);
  CGAffineTransform m = v9;
  CGAffineTransformScale(&v7, &m, 0.970000029, 0.970000029);
  -[CABasicAnimation setDuration:](v3, "setDuration:", 0.100000001);
  CGAffineTransform m = v7;
  CATransform3DMakeAffineTransform(&v5, &m);
  -[CABasicAnimation setToValue:]( v3,  "setToValue:",  +[NSValue valueWithCATransform3D:](&OBJC_CLASS___NSValue, "valueWithCATransform3D:", &v5));
  -[CABasicAnimation setRemovedOnCompletion:](v3, "setRemovedOnCompletion:", 1LL);
  -[CABasicAnimation setAutoreverses:](v3, "setAutoreverses:", 1LL);
  objc_msgSend( objc_msgSend(-[SYNMediaWallCollectionViewCell2 contentView](self, "contentView"), "layer"),  "addAnimation:forKey:",  v3,  @"transform");
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  CATransform3D v5 = -[SYNMediaWallCollectionViewCell2 borderColor](self, "borderColor");
  double v6 = v5;
  if (!v3)
  {
    if (v5)
    {
      objc_msgSend( -[SYNMediaWallCollectionViewCellMainView2 layer](self->_mainView, "layer"),  "setBorderColor:",  -[UIColor CGColor](-[SYNMediaWallCollectionViewCell2 borderColor](self, "borderColor"), "CGColor"));
      double v10 = 1.0;
    }

    else
    {
      double v10 = 0.0;
    }

    p_mainView = &self->_mainView;
    objc_msgSend(-[SYNMediaWallCollectionViewCellMainView2 layer](self->_mainView, "layer"), "setBorderWidth:", v10);
    goto LABEL_9;
  }

  p_mainView = &self->_mainView;
  id v8 = -[SYNMediaWallCollectionViewCellMainView2 layer](self->_mainView, "layer");
  if (!v6)
  {
    [v8 setBorderWidth:0.0];
    objc_msgSend(-[SYNMediaWallCollectionViewCellMainView2 layer](*p_mainView, "layer"), "setBorderColor:", 0);
LABEL_9:
    selectedBorderColor = +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.0,  0.0,  0.0,  1.0);
    goto LABEL_10;
  }

  [v8 setBorderWidth:2.0];
  objc_msgSend( -[SYNMediaWallCollectionViewCellMainView2 layer](*p_mainView, "layer"),  "setBorderColor:",  -[UIColor CGColor](self->_selectedBorderColor, "CGColor"));
  selectedBorderColor = self->_selectedBorderColor;
LABEL_10:
  objc_msgSend( -[SYNMediaWallCollectionViewCellMainView2 layer](*p_mainView, "layer"),  "setShadowColor:",  -[UIColor CGColor](selectedBorderColor, "CGColor"));
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SYNMediaWallCollectionViewCell2;
  -[SYNMediaWallCollectionViewCell2 setSelected:](&v11, "setSelected:", v3);
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if (!a3) {
    objc_msgSend(-[SYNMediaWallCollectionViewCellMainView2 layer](self->_mainView, "layer"), "setFilters:", 0);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SYNMediaWallCollectionViewCell2;
  -[SYNMediaWallCollectionViewCell2 setHighlighted:](&v5, "setHighlighted:", v3);
}

- (CGRect)_contentsRectForRegionOfInterestContainerBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = -[UIImageView image](self->_imageView, "image");
  double v9 = 1.0;
  double v10 = 0.0;
  if (!v8) {
    goto LABEL_3;
  }
  objc_super v11 = v8;
  v81.origin.double x = CGRectZero.origin.x;
  v81.origin.double y = CGRectZero.origin.y;
  v81.size.double width = CGRectZero.size.width;
  v81.size.double height = CGRectZero.size.height;
  v70.origin.double x = x;
  v70.origin.double y = y;
  v70.size.double width = width;
  v70.size.double height = height;
  if (CGRectEqualToRect(v70, v81))
  {
LABEL_3:
    double v12 = 0.0;
LABEL_10:
    double v39 = 1.0;
    goto LABEL_11;
  }

  -[UIImage size](v11, "size");
  double v14 = v13;
  -[UIImage size](v11, "size");
  double v16 = v14 / v15;
  -[SYNMediaWallCollectionViewCell2 bounds](self, "bounds");
  double v18 = v17;
  -[SYNMediaWallCollectionViewCell2 bounds](self, "bounds");
  double v20 = v18 / v19;
  -[SYNMediaWallCollectionViewCell2 bounds](self, "bounds");
  if (v16 >= v20)
  {
    double v23 = v16 * v22;
    -[SYNMediaWallCollectionViewCell2 bounds](self, "bounds");
    double v25 = v31;
    -[SYNMediaWallCollectionViewCell2 bounds](self, "bounds");
    double v33 = v32;
    -[SYNMediaWallCollectionViewCell2 bounds](self, "bounds");
    double v30 = -(v34 - v16 * v33) * 0.5;
    double v29 = 0.0;
  }

  else
  {
    double v23 = v21;
    -[SYNMediaWallCollectionViewCell2 bounds](self, "bounds");
    double v25 = v24 / v16;
    -[SYNMediaWallCollectionViewCell2 bounds](self, "bounds");
    double v27 = v26 / v16;
    -[SYNMediaWallCollectionViewCell2 bounds](self, "bounds");
    double v29 = (v27 - v28) * 0.5;
    double v30 = 0.0;
  }

  double v69 = v30;
  double v35 = -(v30 - x * v23);
  double v36 = -(v29 - (1.0 - y - height) * v25);
  double v37 = width * v23;
  double v38 = v29;
  -[SYNMediaWallCollectionViewCell2 bounds](self, "bounds");
  v82.origin.double x = v35;
  v82.origin.double y = v36;
  v82.size.double width = v37;
  v82.size.double height = height * v25;
  if (CGRectContainsRect(v71, v82))
  {
    double v12 = 0.0;
    double v9 = 1.0;
LABEL_9:
    double v10 = 0.0;
    goto LABEL_10;
  }

  double v65 = v25;
  CGFloat v66 = v36;
  double v67 = height * v25;
  CGFloat rect = v37;
  double v44 = v23;
  -[SYNMediaWallCollectionViewCell2 bounds](self, "bounds");
  double v46 = v45;
  -[SYNMediaWallCollectionViewCell2 bounds](self, "bounds");
  double v48 = v47;
  -[SYNMediaWallCollectionViewCell2 bounds](self, "bounds");
  if (v69 <= 0.0)
  {
    double v10 = 0.0;
    if (v38 <= 0.0)
    {
      double v12 = 0.0;
      double v9 = 1.0;
      goto LABEL_10;
    }

    double v55 = v38;
    CGFloat v56 = -v38;
    double v57 = v48 * 0.5;
    double v39 = v50 / v65;
    -[SYNMediaWallCollectionViewCell2 bounds](self, "bounds");
    v75.origin.double x = 0.0;
    v75.origin.double y = v56;
    v75.size.double height = v55;
    v84.origin.double x = v35;
    v84.origin.double y = v36;
    double v58 = v55;
    v84.size.double width = rect;
    v84.size.double height = v67;
    BOOL v59 = CGRectIntersectsRect(v75, v84);
    v76.origin.double x = v35;
    v76.origin.double y = v66;
    v76.size.double width = rect;
    v76.size.double height = v67;
    double v60 = v48 * 0.5 - CGRectGetMidY(v76);
    if (v60 < 0.0) {
      double v60 = -v60;
    }
    if (v59)
    {
      if (v60 >= v55)
      {
        double v12 = 0.0;
      }

      else
      {
        v77.origin.double x = v35;
        v77.origin.double y = v66;
        v77.size.double width = rect;
        v77.size.double height = v67;
        double v61 = v57 - CGRectGetMidY(v77);
        if (v61 < 0.0) {
          double v61 = -v61;
        }
        double v12 = (v55 - v61) / v65;
      }

      double v9 = 1.0;
    }

    else
    {
      double v9 = 1.0;
      double v12 = 1.0 - v39;
      if (v60 < v58)
      {
        v79.origin.double x = v35;
        v79.origin.double y = v66;
        v79.size.double height = v67;
        v79.size.double width = rect;
        double v64 = v57 - CGRectGetMidY(v79);
        if (v64 < 0.0) {
          double v64 = -v64;
        }
        double v12 = v12 - (v58 - v64) / v65;
      }
    }
  }

  else
  {
    double v51 = v46 * 0.5;
    double v9 = v49 / v23;
    -[SYNMediaWallCollectionViewCell2 bounds](self, "bounds");
    double v12 = 0.0;
    v72.origin.double y = 0.0;
    v72.origin.double x = -v69;
    v72.size.double width = v69;
    v83.origin.double x = v35;
    v83.origin.double y = v36;
    v83.size.double width = v37;
    v83.size.double height = v67;
    BOOL v52 = CGRectIntersectsRect(v72, v83);
    v73.origin.double x = v35;
    v73.origin.double y = v36;
    v73.size.double width = v37;
    v73.size.double height = v67;
    double v53 = v51 - CGRectGetMidX(v73);
    if (v53 < 0.0) {
      double v53 = -v53;
    }
    if (v52)
    {
      if (v53 < v69)
      {
        v74.origin.double x = v35;
        v74.size.double height = v67;
        v74.origin.double y = v36;
        v74.size.double width = v37;
        double v54 = v51 - CGRectGetMidX(v74);
        if (v54 < 0.0) {
          double v54 = -v54;
        }
        double v10 = (v69 - v54) / v23;
        goto LABEL_10;
      }

      goto LABEL_9;
    }

    double v62 = v51;
    double v39 = 1.0;
    double v10 = 1.0 - v9;
    if (v53 < v69)
    {
      v78.origin.double x = v35;
      v78.size.double height = v67;
      v78.origin.double y = v36;
      v78.size.double width = rect;
      double v63 = v62 - CGRectGetMidX(v78);
      if (v63 < 0.0) {
        double v63 = -v63;
      }
      double v10 = v10 - (v69 - v63) / v44;
    }
  }

- (CGRect)imageContentsRect
{
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)updateImageContentsRect
{
}

- (void)updateVideoFooter
{
  if (-[MZMediaManagement isSupportedMovieForAssetAtPath:]( self->_assetManagementDelegate,  "isSupportedMovieForAssetAtPath:",  -[MCAsset path](self->_mediaItem, "path")))
  {
    -[MZMediaManagement stopTimeForAssetAtPath:]( self->_assetManagementDelegate,  "stopTimeForAssetAtPath:",  -[MCAsset path](self->_mediaItem, "path"));
    double v4 = v3;
    -[MZMediaManagement startTimeForAssetAtPath:]( self->_assetManagementDelegate,  "startTimeForAssetAtPath:",  -[MCAsset path](self->_mediaItem, "path"));
    double v6 = v4 - v5;
    videoLabelView = self->_videoLabelView;
    if (videoLabelView)
    {
      id v8 = -[UIView viewWithTag:](videoLabelView, "viewWithTag:", 1LL);
      if (v6 <= 0.0)
      {
        double v10 = &stru_259C60;
      }

      else
      {
        unint64_t v9 = (unint64_t)div((int)v6, 60);
        double v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%02d:%02d",  v9,  HIDWORD(v9));
      }

      -[UIView setText:](v8, "setText:", v10);
    }

    else
    {
      double v12 = objc_alloc(&OBJC_CLASS___UIView);
      -[SYNMediaWallCollectionViewCell2 bounds](self, "bounds");
      double v14 = v13 + -20.0;
      -[SYNMediaWallCollectionViewCell2 bounds](self, "bounds");
      self->_videoLabelView = -[UIView initWithFrame:](v12, "initWithFrame:", 0.0, v14);
      if (-[UIDevice userInterfaceIdiom]( +[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"),  "userInterfaceIdiom"))
      {
        -[UIView setBackgroundColor:]( self->_videoLabelView,  "setBackgroundColor:",  +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.400000006));
        if (v6 > 0.0)
        {
          double v15 = objc_alloc(&OBJC_CLASS___UILabel);
          -[UIView bounds](self->_videoLabelView, "bounds");
          double v16 = -[UILabel initWithFrame:](v15, "initWithFrame:");
          -[UILabel setAutoresizingMask:](v16, "setAutoresizingMask:", 9LL);
          -[UILabel setTag:](v16, "setTag:", 1LL);
          -[UILabel setTextAlignment:](v16, "setTextAlignment:", 2LL);
          -[UILabel setTextColor:](v16, "setTextColor:", +[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
          unint64_t v17 = (unint64_t)div((int)v6, 60);
          -[UILabel setText:]( v16,  "setText:",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%02d:%02d",  v17,  HIDWORD(v17)));
          -[UILabel setBackgroundColor:]( v16,  "setBackgroundColor:",  +[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
          -[UILabel setFont:]( v16,  "setFont:",  +[UIFont boldSystemFontOfSize:](&OBJC_CLASS___UIFont, "boldSystemFontOfSize:", 11.0));
          -[UIView addSubview:](self->_videoLabelView, "addSubview:", v16);

          -[UILabel sizeToFit](v16, "sizeToFit");
          -[UIView frame](self->_videoLabelView, "frame");
          double v19 = v18;
          -[UILabel frame](v16, "frame");
          double v21 = v19 - v20 + -6.0;
          -[UIView frame](self->_videoLabelView, "frame");
          double v23 = v22;
          -[UILabel frame](v16, "frame");
          double v25 = (v23 - v24) * 0.5;
          -[UILabel frame](v16, "frame");
          double v27 = v26;
          -[UILabel frame](v16, "frame");
          -[UILabel setFrame:](v16, "setFrame:", v21, v25, v27);
        }
      }

      else
      {
        -[UIView setBackgroundColor:]( self->_videoLabelView,  "setBackgroundColor:",  +[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
      }

      -[UIView setAutoresizingMask:](self->_videoLabelView, "setAutoresizingMask:", 10LL);
      -[SYNMediaWallCollectionViewCellMainView2 addSubview:](self->_mainView, "addSubview:", self->_videoLabelView);
    }
  }

  else
  {
    objc_super v11 = self->_videoLabelView;
    if (v11)
    {
      -[UIView removeFromSuperview](v11, "removeFromSuperview");

      self->_videoLabelView = 0LL;
    }
  }

- (id)snapshot
{
  return 0LL;
}

- (MCAssetVideo)mediaItem
{
  return (MCAssetVideo *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setMediaItem:(id)a3
{
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (UIColor)selectedBorderColor
{
  return self->_selectedBorderColor;
}

@end