@interface MTTVFloatingView
- (BOOL)appliesContentFilters;
- (BOOL)canBecomeFocused;
- (BOOL)enableFocusDirection;
- (BOOL)isContentOpaque;
- (BOOL)isSelected;
- (BOOL)isShadowEnabled;
- (BOOL)roundContentWhenDeselected;
- (BOOL)scalesBackwards;
- (CGPoint)focusDirection;
- (CGSize)shadowSize;
- (MTTVFloatingView)initWithFrame:(CGRect)a3;
- (UIColor)selectedBackgroundColor;
- (UIView)contentView;
- (double)cornerRadius;
- (double)scaleFactor;
- (id)backgroundColor;
- (int64_t)scrollDirection;
- (void)_applyFocusDirectionTransform;
- (void)_setFocusDirection:(CGPoint)a3 duration:(double)a4;
- (void)_setSelected:(BOOL)a3 duration:(double)a4;
- (void)_updateContainerFilters;
- (void)_updateScale;
- (void)_updateShadowMask;
- (void)layoutSubviews;
- (void)setAppliesContentFilters:(BOOL)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setContentOpaque:(BOOL)a3;
- (void)setCornerRadius:(double)a3;
- (void)setEnableFocusDirection:(BOOL)a3;
- (void)setFocusDirection:(CGPoint)a3;
- (void)setFocusDirection:(CGPoint)a3 animated:(BOOL)a4;
- (void)setRoundContentWhenDeselected:(BOOL)a3;
- (void)setScaleFactor:(double)a3;
- (void)setScalesBackwards:(BOOL)a3;
- (void)setScrollDirection:(int64_t)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelectedBackgroundColor:(id)a3;
- (void)setShadowEnabled:(BOOL)a3;
- (void)setShadowSize:(CGSize)a3;
@end

@implementation MTTVFloatingView

- (MTTVFloatingView)initWithFrame:(CGRect)a3
{
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___MTTVFloatingView;
  v3 = -[MTTVFloatingView initWithFrame:]( &v33,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MTTVFloatingView setOpaque:](v3, "setOpaque:", 0LL);
    -[MTTVFloatingView setBackgroundColor:](v4, "setBackgroundColor:", 0LL);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFloatingView layer](v4, "layer"));
    __int128 v6 = *(_OWORD *)&CATransform3DIdentity.m23;
    v28[2] = *(_OWORD *)&CATransform3DIdentity.m21;
    v28[3] = v6;
    v28[4] = *(_OWORD *)&CATransform3DIdentity.m31;
    CGFloat m33 = CATransform3DIdentity.m33;
    __int128 v8 = *(_OWORD *)&CATransform3DIdentity.m13;
    v28[0] = *(_OWORD *)&CATransform3DIdentity.m11;
    v28[1] = v8;
    CGFloat v29 = m33;
    unint64_t v30 = 0xBF50624DD2F1A9FCLL;
    __int128 v9 = *(_OWORD *)&CATransform3DIdentity.m43;
    __int128 v31 = *(_OWORD *)&CATransform3DIdentity.m41;
    __int128 v32 = v9;
    [v5 setSublayerTransform:v28];

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
    id v11 = [v10 _graphicsQuality];

    if (v11 == (id)10)
    {
      v4->_cornerRadius = 0.0;
      v4->_appliesContentFilters = 0;
      uint64_t v12 = objc_claimAutoreleasedReturnValue(+[UIColor grayColor](&OBJC_CLASS___UIColor, "grayColor"));
      selectedBackgroundColor = v4->_selectedBackgroundColor;
      v4->_selectedBackgroundColor = (UIColor *)v12;
    }

    else
    {
      v4->_cornerRadius = 5.0;
      v4->_shadowEnabled = 1;
      -[MTTVFloatingView _updateShadowMask](v4, "_updateShadowMask");
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
      uint64_t v15 = objc_claimAutoreleasedReturnValue([v14 colorWithAlphaComponent:0.2]);
      v16 = v4->_selectedBackgroundColor;
      v4->_selectedBackgroundColor = (UIColor *)v15;

      v17 = objc_alloc(&OBJC_CLASS____MTTVKTSpecialAnimatingView);
      double y = CGRectZero.origin.y;
      double width = CGRectZero.size.width;
      double height = CGRectZero.size.height;
      v21 = -[_MTTVKTSpecialAnimatingView initWithFrame:](v17, "initWithFrame:", CGRectZero.origin.x, y, width, height);
      highlightView = v4->_highlightView;
      v4->_highlightView = v21;

      -[_MTTVKTSpecialAnimatingView setOpaque:](v4->_highlightView, "setOpaque:", 0LL);
      -[_MTTVKTSpecialAnimatingView setBackgroundColor:]( v4->_highlightView,  "setBackgroundColor:",  v4->_selectedBackgroundColor);
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[_MTTVKTSpecialAnimatingView layer](v4->_highlightView, "layer"));
      [v23 setCornerRadius:v4->_cornerRadius];

      -[_MTTVKTSpecialAnimatingView setAlpha:](v4->_highlightView, "setAlpha:", 0.0);
      -[MTTVFloatingView addSubview:](v4, "addSubview:", v4->_highlightView);
      v24 = -[_MTTVKTSpecialAnimatingView initWithFrame:]( objc_alloc(&OBJC_CLASS____MTTVKTSpecialAnimatingView),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
      containerView = v4->_containerView;
      v4->_containerView = v24;

      -[_MTTVKTSpecialAnimatingView setOpaque:](v4->_containerView, "setOpaque:", 0LL);
      -[_MTTVKTSpecialAnimatingView setBackgroundColor:](v4->_containerView, "setBackgroundColor:", 0LL);
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[_MTTVKTSpecialAnimatingView layer](v4->_containerView, "layer"));
      [v26 setCornerRadius:v4->_cornerRadius];

      -[_MTTVKTSpecialAnimatingView setClipsToBounds:](v4->_containerView, "setClipsToBounds:", 1LL);
      -[MTTVFloatingView addSubview:](v4, "addSubview:", v4->_containerView);
      v4->_appliesContentFilters = 1;
    }

    v4->_zDepth = 20.0;
    v4->_scrollDirection = 0x7FFFFFFFFFFFFFFFLL;
    v4->_enableFocusDirection = 0;
    v4->_roundContentWhenDeselected = 1;
  }

  return v4;
}

- (UIView)contentView
{
  contentView = self->_contentView;
  if (!contentView)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
    id v5 = [v4 _graphicsQuality];

    if (v5 == (id)10)
    {
      __int128 v6 = objc_alloc(&OBJC_CLASS____MTTVKTSpecialAnimatingView);
      -[MTTVFloatingView bounds](self, "bounds");
      v7 = -[_MTTVKTSpecialAnimatingView initWithFrame:](v6, "initWithFrame:");
      __int128 v8 = self->_contentView;
      self->_contentView = v7;

      __int128 v9 = self->_contentView;
      containerView = self;
    }

    else
    {
      id v11 = objc_alloc(&OBJC_CLASS___UIView);
      -[MTTVFloatingView bounds](self, "bounds");
      uint64_t v12 = -[UIView initWithFrame:](v11, "initWithFrame:");
      v13 = self->_contentView;
      self->_contentView = v12;

      containerView = self->_containerView;
      __int128 v9 = self->_contentView;
    }

    [containerView addSubview:v9];
    -[UIView setAutoresizingMask:](self->_contentView, "setAutoresizingMask:", 18LL);
    -[MTTVFloatingView setNeedsLayout](self, "setNeedsLayout");
    contentView = self->_contentView;
  }

  return contentView;
}

- (void)setCornerRadius:(double)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
  id v6 = [v5 _graphicsQuality];

  if (v6 != (id)10 && self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    -[CALayer setCornerRadius:](self->_shadowMaskLayer, "setCornerRadius:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_MTTVKTSpecialAnimatingView layer](self->_containerView, "layer"));
    __int128 v8 = v7;
    double v9 = a3;
    if (!self->_roundContentWhenDeselected)
    {
      double v9 = 0.0;
      if (self->_selected) {
        double v9 = a3;
      }
    }

    [v7 setCornerRadius:v9];

    id v10 = (id)objc_claimAutoreleasedReturnValue(-[_MTTVKTSpecialAnimatingView layer](self->_highlightView, "layer"));
    [v10 setCornerRadius:a3];
  }

- (void)setRoundContentWhenDeselected:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
  id v6 = [v5 _graphicsQuality];

  if (v6 != (id)10 && self->_roundContentWhenDeselected != v3)
  {
    self->_roundContentWhenDeselected = v3;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_MTTVKTSpecialAnimatingView layer](self->_containerView, "layer"));
    if (self->_roundContentWhenDeselected || self->_selected) {
      double cornerRadius = self->_cornerRadius;
    }
    else {
      double cornerRadius = 0.0;
    }
    id v9 = v7;
    [v7 setCornerRadius:cornerRadius];
  }

- (void)setSelectedBackgroundColor:(id)a3
{
  id v5 = (UIColor *)a3;
  if (self->_selectedBackgroundColor != v5)
  {
    objc_storeStrong((id *)&self->_selectedBackgroundColor, a3);
    -[_MTTVKTSpecialAnimatingView setBackgroundColor:](self->_highlightView, "setBackgroundColor:", v5);
  }
}

- (void)setContentOpaque:(BOOL)a3
{
  if (self->_contentOpaque != a3)
  {
    self->_contentOpaque = a3;
    -[MTTVFloatingView _updateShadowMask](self, "_updateShadowMask");
  }

- (void)setScaleFactor:(double)a3
{
  if (a3 >= 0.6 && a3 <= 1.4)
  {
    self->_zDepth = (1.0 - 1.0 / a3) * 1000.0;
    -[MTTVFloatingView _updateScale](self, "_updateScale");
  }

- (void)setShadowEnabled:(BOOL)a3
{
  if (self->_shadowEnabled != a3)
  {
    self->_shadowEnabled = a3;
    -[MTTVFloatingView _updateShadowMask](self, "_updateShadowMask");
    -[MTTVFloatingView setNeedsLayout](self, "setNeedsLayout");
  }

- (double)scaleFactor
{
  return 1000.0 / (1000.0 - self->_zDepth);
}

- (void)setScalesBackwards:(BOOL)a3
{
  if (self->_scalesBackwards != a3)
  {
    self->_scalesBackwards = a3;
    -[MTTVFloatingView _updateScale](self, "_updateScale");
  }

- (void)setBackgroundColor:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_unselectedBackgroundColor, a3);
  if (!-[MTTVFloatingView isSelected](self, "isSelected"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
    id v6 = [v5 _graphicsQuality];

    v7 = &OBJC_IVAR___MTTVFloatingView__containerView;
    if (v6 == (id)10) {
      v7 = &OBJC_IVAR___MTTVFloatingView__contentView;
    }
    [*(id *)((char *)&self->super.super.super.isa + *v7) setBackgroundColor:v8];
  }
}

- (id)backgroundColor
{
  return self->_unselectedBackgroundColor;
}

- (void)layoutSubviews
{
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
  if ([v11 _graphicsQuality] == (id)10)
  {
LABEL_15:

    goto LABEL_16;
  }

  unsigned int v12 = -[MTTVFloatingView isShadowEnabled](self, "isShadowEnabled");

  if (v12)
  {
    -[MTTVFloatingView shadowSize](self, "shadowSize");
    BOOL v15 = v13 == CGSizeZero.width;
    BOOL v16 = v14 == CGSizeZero.height;
    if (v15 && v16) {
      double v17 = v8;
    }
    else {
      double v17 = v13;
    }
    if (v15 && v16) {
      double v18 = v10;
    }
    else {
      double v18 = v14;
    }
    if (qword_1002B6B90 != -1) {
      dispatch_once(&qword_1002B6B90, &stru_100244B08);
    }
    CGFloat v19 = UIRectCenteredIntegralRect(0.0, 0.0, v17, v18, v4, v6, v8, v10);
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    *(double *)v35 = v22;
    *(double *)&v35[1] = v24;
    -[MTTVFloatingView cornerRadius](self, "cornerRadius");
    v35[2] = v26;
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSValue valueWithBytes:objCType:]( &OBJC_CLASS___NSValue,  "valueWithBytes:objCType:",  v35,  "{?={CGSize=dd}d}"));
    id v27 = [(id)qword_1002B6B88 objectForKey:v11];
    if (!v27)
    {
      v36.origin.double x = v19;
      v36.origin.double y = v21;
      v36.size.double width = v23;
      v36.size.double height = v25;
      CGRect v37 = CGRectInset(v36, -25.0, -25.0);
      double x = v37.origin.x;
      double y = v37.origin.y;
      double width = v37.size.width;
      double height = v37.size.height;
      -[MTTVFloatingView cornerRadius](self, "cornerRadius");
      id v33 = objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:]( &OBJC_CLASS___UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, v32));
      id v27 = [v33 CGPath];

      if (v27) {
        [(id)qword_1002B6B88 setObject:v27 forKey:v11];
      }
    }

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[_MTTVKTSpecialAnimatingView layer](self->_shadowView, "layer"));
    [v34 setShadowPath:v27];

    -[_MTTVKTSpecialAnimatingView setFrame:](self->_shadowView, "setFrame:", v4, v6, v8, v10);
    -[CALayer setFrame:](self->_shadowMaskLayer, "setFrame:", v4, v6, v8, v10);
    goto LABEL_15;
  }

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void)setSelected:(BOOL)a3
{
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
  if ([v7 _graphicsQuality] == (id)10) {
    double v8 = 0.3;
  }
  else {
    double v8 = 0.5;
  }

  double v9 = 0.2;
  if (!v5) {
    double v9 = v8;
  }
  if (!v4) {
    double v9 = 0.0;
  }
  -[MTTVFloatingView _setSelected:duration:](self, "_setSelected:duration:", v5, v9);
}

- (void)_setSelected:(BOOL)a3 duration:(double)a4
{
  if (self->_selected != a3)
  {
    BOOL v5 = a3;
    self->_selected = a3;
    self->_animatingSelection = 1;
    double v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
    id v8 = [v7 _graphicsQuality];

    if (v8 == (id)10)
    {
      v23[4] = self;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_1000F70EC;
      v24[3] = &unk_100240350;
      v24[4] = self;
      BOOL v25 = v5;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_1000F716C;
      v23[3] = &unk_100240110;
      double v9 = v24;
      double v10 = v23;
    }

    else
    {
      float v11 = 0.0;
      v27[0] = _NSConcreteStackBlock;
      if (v5) {
        float v11 = 1.0;
      }
      v27[1] = 3221225472LL;
      v27[2] = sub_1000F6FAC;
      v27[3] = &unk_100244B30;
      v27[4] = self;
      float v28 = v11;
      BOOL v29 = v5;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_1000F70D8;
      v26[3] = &unk_100240110;
      v26[4] = self;
      double v9 = v27;
      double v10 = v26;
    }

    +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  6LL,  v9,  v10,  a4,  0.0);
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFloatingView contentView](self, "contentView", 0LL));
    double v13 = (void *)objc_claimAutoreleasedReturnValue([v12 subviews]);

    id v14 = [v13 countByEnumeratingWithState:&v19 objects:v30 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          double v18 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
          if ((objc_opt_respondsToSelector(v18, "setSelected:animated:") & 1) != 0) {
            [v18 setSelected:v5 animated:1];
          }
        }

        id v15 = [v13 countByEnumeratingWithState:&v19 objects:v30 count:16];
      }

      while (v15);
    }
  }

- (void)setFocusDirection:(CGPoint)a3
{
}

- (void)setFocusDirection:(CGPoint)a3 animated:(BOOL)a4
{
}

- (void)_setFocusDirection:(CGPoint)a3 duration:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  id v11 = (id)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
  if ([v11 _graphicsQuality] == (id)10)
  {
  }

  else
  {
    BOOL enableFocusDirection = self->_enableFocusDirection;

    if (enableFocusDirection)
    {
      double v9 = fmax(x, -1.0);
      if (v9 > 1.0) {
        double v9 = 1.0;
      }
      double v10 = fmax(y, -1.0);
      if (v10 > 1.0) {
        double v10 = 1.0;
      }
      if (vabdd_f64(self->_focusDirection.x, v9) > 0.00000011920929
        || vabdd_f64(self->_focusDirection.y, v10) > 0.00000011920929)
      {
        self->_focusDirection.double x = v9;
        self->_focusDirection.double y = v10;
        if (!self->_animatingSelection)
        {
          +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
          +[CATransaction setAnimationDuration:](&OBJC_CLASS___CATransaction, "setAnimationDuration:", a4);
          -[MTTVFloatingView _applyFocusDirectionTransform](self, "_applyFocusDirectionTransform");
          +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
        }
      }
    }
  }

- (void)_applyFocusDirectionTransform
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
  id v4 = [v3 _graphicsQuality];

  if (v4 != (id)10)
  {
    __int128 v6 = *(_OWORD *)&CATransform3DIdentity.m31;
    __int128 v5 = *(_OWORD *)&CATransform3DIdentity.m33;
    *(_OWORD *)&v24.m31 = v6;
    *(_OWORD *)&v24.CGFloat m33 = v5;
    __int128 v8 = *(_OWORD *)&CATransform3DIdentity.m41;
    __int128 v7 = *(_OWORD *)&CATransform3DIdentity.m43;
    *(_OWORD *)&v24.m41 = v8;
    *(_OWORD *)&v24.m43 = v7;
    __int128 v10 = *(_OWORD *)&CATransform3DIdentity.m11;
    __int128 v9 = *(_OWORD *)&CATransform3DIdentity.m13;
    *(_OWORD *)&v24.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
    *(_OWORD *)&v24.m13 = v9;
    __int128 v12 = *(_OWORD *)&CATransform3DIdentity.m21;
    __int128 v11 = *(_OWORD *)&CATransform3DIdentity.m23;
    *(_OWORD *)&v24.m21 = v12;
    *(_OWORD *)&v24.m23 = v11;
    if (!self->_selected || self->_animatingSelection) {
      goto LABEL_10;
    }
    int64_t scrollDirection = self->_scrollDirection;
    if (scrollDirection == 1)
    {
      double v14 = self->_focusDirection.x * 0.2;
      *(_OWORD *)&v23.m31 = v6;
      *(_OWORD *)&v23.CGFloat m33 = v5;
      *(_OWORD *)&v23.m41 = v8;
      *(_OWORD *)&v23.m43 = v7;
      *(_OWORD *)&v23.m11 = v10;
      *(_OWORD *)&v23.m13 = v9;
      *(_OWORD *)&v23.m21 = v12;
      *(_OWORD *)&v23.m23 = v11;
      CGFloat v15 = 0.0;
      CGFloat v16 = 1.0;
    }

    else
    {
      if (scrollDirection)
      {
        CGFloat v17 = self->_focusDirection.y * 0.2;
        *(_OWORD *)&v23.m31 = v6;
        *(_OWORD *)&v23.CGFloat m33 = v5;
        *(_OWORD *)&v23.m41 = v8;
        *(_OWORD *)&v23.m43 = v7;
        *(_OWORD *)&v23.m11 = v10;
        *(_OWORD *)&v23.m13 = v9;
        *(_OWORD *)&v23.m21 = v12;
        *(_OWORD *)&v23.m23 = v11;
        CATransform3DRotate(&v24, &v23, v17, 1.0, 0.0, 0.0);
        CGFloat v18 = self->_focusDirection.x * -0.2;
        CATransform3D v22 = v24;
        CATransform3DRotate(&v23, &v22, v18, 0.0, 1.0, 0.0);
        CATransform3D v24 = v23;
        goto LABEL_10;
      }

      double v14 = self->_focusDirection.y * -0.2;
      *(_OWORD *)&v23.m31 = v6;
      *(_OWORD *)&v23.CGFloat m33 = v5;
      *(_OWORD *)&v23.m41 = v8;
      *(_OWORD *)&v23.m43 = v7;
      *(_OWORD *)&v23.m11 = v10;
      *(_OWORD *)&v23.m13 = v9;
      *(_OWORD *)&v23.m21 = v12;
      *(_OWORD *)&v23.m23 = v11;
      CGFloat v15 = 1.0;
      CGFloat v16 = 0.0;
    }

    CATransform3DRotate(&v24, &v23, v14, v15, v16, 0.0);
LABEL_10:
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[_MTTVKTSpecialAnimatingView layer](self->_containerView, "layer"));
    CATransform3D v23 = v24;
    [v19 setTransform:&v23];

    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[_MTTVKTSpecialAnimatingView layer](self->_shadowView, "layer"));
    CATransform3D v23 = v24;
    [v20 setTransform:&v23];

    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[_MTTVKTSpecialAnimatingView layer](self->_highlightView, "layer"));
    CATransform3D v23 = v24;
    [v21 setTransform:&v23];
  }

- (void)_updateShadowMask
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
  id v4 = [v3 _graphicsQuality];

  if (v4 == (id)10) {
    return;
  }
  if (!self->_shadowView && -[MTTVFloatingView isShadowEnabled](self, "isShadowEnabled"))
  {
    __int128 v5 = -[_MTTVKTSpecialAnimatingView initWithFrame:]( objc_alloc(&OBJC_CLASS____MTTVKTSpecialAnimatingView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
    shadowView = self->_shadowView;
    self->_shadowView = v5;

    -[_MTTVKTSpecialAnimatingView setOpaque:](self->_shadowView, "setOpaque:", 0LL);
    -[_MTTVKTSpecialAnimatingView setBackgroundColor:](self->_shadowView, "setBackgroundColor:", 0LL);
    -[MTTVFloatingView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_shadowView, 0LL);
    __int128 v7 = (_MTTVKTSpecialAnimatingView *)objc_claimAutoreleasedReturnValue(-[_MTTVKTSpecialAnimatingView layer](self->_shadowView, "layer"));
    LODWORD(v8) = 0;
    -[_MTTVKTSpecialAnimatingView setOpacity:](v7, "setOpacity:", v8);
    -[_MTTVKTSpecialAnimatingView setShadowRadius:](v7, "setShadowRadius:", 25.0);
    -[_MTTVKTSpecialAnimatingView setShadowOffset:](v7, "setShadowOffset:", 0.0, 25.0);
    LODWORD(v9) = 1041865114;
    -[_MTTVKTSpecialAnimatingView setShadowOpacity:](v7, "setShadowOpacity:", v9);
LABEL_8:

    goto LABEL_9;
  }

  if (!-[MTTVFloatingView isShadowEnabled](self, "isShadowEnabled"))
  {
    -[_MTTVKTSpecialAnimatingView removeFromSuperview](self->_shadowView, "removeFromSuperview");
    __int128 v7 = self->_shadowView;
    self->_shadowView = 0LL;
    goto LABEL_8;
  }

- (void)_updateScale
{
  unsigned int v3 = -[MTTVFloatingView scalesBackwards](self, "scalesBackwards");
  unsigned int v4 = -[MTTVFloatingView isSelected](self, "isSelected");
  double zDepth = 0.0;
  if (v3)
  {
    if ((v4 & 1) == 0) {
      double zDepth = -self->_zDepth;
    }
  }

  else if (v4)
  {
    double zDepth = self->_zDepth;
  }

  __int128 v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
  id v7 = [v6 _graphicsQuality];

  if (v7 == (id)10)
  {
    double v8 = &OBJC_IVAR___MTTVFloatingView__contentView;
  }

  else
  {
    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[_MTTVKTSpecialAnimatingView layer](self->_shadowView, "layer"));
    [v9 setZPosition:zDepth];

    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(-[_MTTVKTSpecialAnimatingView layer](self->_containerView, "layer"));
    [v10 setZPosition:zDepth];

    double v8 = &OBJC_IVAR___MTTVFloatingView__highlightView;
  }

  id v11 = (id)objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->super.super.super.isa + *v8) layer]);
  [v11 setZPosition:zDepth];
}

- (void)_updateContainerFilters
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
  id v4 = [v3 _graphicsQuality];

  if (v4 != (id)10)
  {
    if (self->_selected && -[MTTVFloatingView appliesContentFilters](self, "appliesContentFilters"))
    {
      id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      __int128 v5 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterColorSaturate));
      [v5 setValue:&off_1002552F0 forKey:@"inputAmount"];
      [v5 setName:@"saturation"];
      -[NSMutableArray addObject:](v7, "addObject:", v5);
    }

    else
    {
      id v7 = 0LL;
    }

    __int128 v6 = (void *)objc_claimAutoreleasedReturnValue(-[_MTTVKTSpecialAnimatingView layer](self->_containerView, "layer"));
    [v6 setFilters:v7];
  }

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (BOOL)isContentOpaque
{
  return self->_contentOpaque;
}

- (BOOL)appliesContentFilters
{
  return self->_appliesContentFilters;
}

- (void)setAppliesContentFilters:(BOOL)a3
{
  self->_appliesContentFilters = a3;
}

- (BOOL)isShadowEnabled
{
  return self->_shadowEnabled;
}

- (CGSize)shadowSize
{
  double width = self->_shadowSize.width;
  double height = self->_shadowSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setShadowSize:(CGSize)a3
{
  self->_shadowSize = a3;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (BOOL)enableFocusDirection
{
  return self->_enableFocusDirection;
}

- (void)setEnableFocusDirection:(BOOL)a3
{
  self->_BOOL enableFocusDirection = a3;
}

- (CGPoint)focusDirection
{
  double x = self->_focusDirection.x;
  double y = self->_focusDirection.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (UIColor)selectedBackgroundColor
{
  return self->_selectedBackgroundColor;
}

- (int64_t)scrollDirection
{
  return self->_scrollDirection;
}

- (void)setScrollDirection:(int64_t)a3
{
  self->_int64_t scrollDirection = a3;
}

- (BOOL)scalesBackwards
{
  return self->_scalesBackwards;
}

- (BOOL)roundContentWhenDeselected
{
  return self->_roundContentWhenDeselected;
}

- (void).cxx_destruct
{
}

@end