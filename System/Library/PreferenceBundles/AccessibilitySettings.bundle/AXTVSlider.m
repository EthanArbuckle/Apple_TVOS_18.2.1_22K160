@interface AXTVSlider
- (AXTVSlider)initWithFrame:(CGRect)a3;
- (AXTVSliderAccessibilityDelegate)accessibilityDelegate;
- (BOOL)_accessibilityDisplayFocusIndicatorForFocusEverywhereView;
- (BOOL)_accessibilityShouldIgnoreSoundForFailedMoveAttempt;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (CALayer)defaultTickLayer;
- (CAShapeLayer)filledTrackLayer;
- (CAShapeLayer)grabberLayer;
- (CAShapeLayer)unfilledTrackLayer;
- (NSNumber)defaultTickValue;
- (double)value;
- (unint64_t)accessibilityTraits;
- (void)_updateColorsForUserInterfaceStyle:(int64_t)a3;
- (void)_updateSliderPosition;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)layoutSubviews;
- (void)setAccessibilityDelegate:(id)a3;
- (void)setDefaultTickLayer:(id)a3;
- (void)setDefaultTickValue:(id)a3;
- (void)setFilledTrackLayer:(id)a3;
- (void)setGrabberLayer:(id)a3;
- (void)setUnfilledTrackLayer:(id)a3;
- (void)setValue:(double)a3;
@end

@implementation AXTVSlider

- (AXTVSlider)initWithFrame:(CGRect)a3
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___AXTVSlider;
  v3 = -[AXTVSlider initWithFrame:](&v23, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_value = 0.5;
    -[AXTVSlider setClipsToBounds:](v3, "setClipsToBounds:", 0LL);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](&OBJC_CLASS___CAShapeLayer, "layer"));
    -[AXTVSlider setUnfilledTrackLayer:](v4, "setUnfilledTrackLayer:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSlider layer](v4, "layer"));
    [v6 addSublayer:v5];

    [v5 setLineWidth:20.0];
    [v5 setLineCap:kCALineCapRound];
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](&OBJC_CLASS___CAShapeLayer, "layer"));

    -[AXTVSlider setFilledTrackLayer:](v4, "setFilledTrackLayer:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSlider layer](v4, "layer"));
    [v8 addSublayer:v7];

    [v7 setLineWidth:20.0];
    [v7 setLineCap:kCALineCapRound];
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](&OBJC_CLASS___CAShapeLayer, "layer"));
    -[AXTVSlider setGrabberLayer:](v4, "setGrabberLayer:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSlider layer](v4, "layer"));
    [v10 addSublayer:v9];

    v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithOvalInRect:]( &OBJC_CLASS___UIBezierPath,  "bezierPathWithOvalInRect:",  0.0,  0.0,  60.0,  60.0));
    objc_msgSend(v9, "setBounds:", 0.0, 0.0, 60.0, 60.0);
    id v12 = v11;
    objc_msgSend(v9, "setPath:", objc_msgSend(v12, "CGPath"));
    id v13 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    objc_msgSend(v9, "setFillColor:", objc_msgSend(v13, "CGColor"));

    [v9 setShadowRadius:30.0];
    objc_msgSend(v9, "setShadowOffset:", 0.0, 25.0);
    LODWORD(v14) = 0.25;
    [v9 setShadowOpacity:v14];
    id v15 = objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    objc_msgSend(v9, "setShadowColor:", objc_msgSend(v15, "CGColor"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSlider traitCollection](v4, "traitCollection"));
    -[AXTVSlider _updateColorsForUserInterfaceStyle:]( v4,  "_updateColorsForUserInterfaceStyle:",  [v16 userInterfaceStyle]);

    objc_initWeak(&location, v4);
    uint64_t v24 = objc_opt_class(&OBJC_CLASS___UITraitUserInterfaceStyle);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v24, 1LL));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1014C;
    v20[3] = &unk_65958;
    objc_copyWeak(&v21, &location);
    id v18 = -[AXTVSlider registerForTraitChanges:withHandler:](v4, "registerForTraitChanges:withHandler:", v17, v20);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v4;
}

- (void)layoutSubviews
{
  unsigned int v3 = -[AXTVSlider _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___AXTVSlider;
  -[AXTVSlider layoutSubviews](&v36, "layoutSubviews");
  -[AXTVSlider bounds](self, "bounds");
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPath](&OBJC_CLASS___UIBezierPath, "bezierPath"));
  double v13 = v5;
  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  if (v3)
  {
    double MaxX = CGRectGetMaxX(*(CGRect *)&v13);
    v37.origin.x = v5;
    v37.origin.y = v7;
    v37.size.width = v9;
    v37.size.height = v11;
    double MinX = CGRectGetMinX(v37);
  }

  else
  {
    double MaxX = CGRectGetMinX(*(CGRect *)&v13);
    v38.origin.x = v5;
    v38.origin.y = v7;
    v38.size.width = v9;
    v38.size.height = v11;
    double MinX = CGRectGetMaxX(v38);
  }

  double v19 = MinX;
  v39.origin.x = v5;
  v39.origin.y = v7;
  v39.size.width = v9;
  v39.size.height = v11;
  objc_msgSend(v12, "moveToPoint:", MaxX, CGRectGetMidY(v39));
  v40.origin.x = v5;
  v40.origin.y = v7;
  v40.size.width = v9;
  v40.size.height = v11;
  objc_msgSend(v12, "addLineToPoint:", v19, CGRectGetMidY(v40));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSlider unfilledTrackLayer](self, "unfilledTrackLayer"));
  objc_msgSend(v20, "setFrame:", v5, v7, v9, v11);

  id v21 = v12;
  id v22 = [v21 CGPath];
  objc_super v23 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSlider unfilledTrackLayer](self, "unfilledTrackLayer"));
  [v23 setPath:v22];

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSlider filledTrackLayer](self, "filledTrackLayer"));
  objc_msgSend(v24, "setFrame:", v5, v7, v9, v11);

  id v25 = v21;
  id v26 = [v25 CGPath];
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSlider filledTrackLayer](self, "filledTrackLayer"));
  [v27 setPath:v26];

  -[AXTVSlider _updateSliderPosition](self, "_updateSliderPosition");
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSlider defaultTickValue](self, "defaultTickValue"));

  v29 = (CALayer *)objc_claimAutoreleasedReturnValue(-[AXTVSlider defaultTickLayer](self, "defaultTickLayer"));
  v30 = v29;
  if (!v28)
  {
    -[CALayer removeFromSuperlayer](v29, "removeFromSuperlayer");
    goto LABEL_8;
  }

  if (!v30)
  {
    v30 = objc_opt_new(&OBJC_CLASS___CALayer);
    -[CALayer setCornerRadius:](v30, "setCornerRadius:", 8.0);
    -[CALayer setBounds:](v30, "setBounds:", 0.0, 0.0, 20.0, 60.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSlider defaultTickValue](self, "defaultTickValue"));
    [v31 floatValue];
    double v33 = v32 * v9 + -20.0;
    v41.origin.x = v5;
    v41.origin.y = v7;
    v41.size.width = v9;
    v41.size.height = v11;
    -[CALayer setPosition:](v30, "setPosition:", v33, CGRectGetMidY(v41));

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSlider layer](self, "layer"));
    [v34 insertSublayer:v30 atIndex:0];

    -[AXTVSlider setDefaultTickLayer:](self, "setDefaultTickLayer:", v30);
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSlider traitCollection](self, "traitCollection"));
    -[AXTVSlider _updateColorsForUserInterfaceStyle:]( self,  "_updateColorsForUserInterfaceStyle:",  [v35 userInterfaceStyle]);

LABEL_8:
  }
}

- (void)setDefaultTickValue:(id)a3
{
}

- (void)_updateSliderPosition
{
  unsigned int v3 = -[AXTVSlider _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
  +[CATransaction setDisableActions:](&OBJC_CLASS___CATransaction, "setDisableActions:", 1LL);
  -[AXTVSlider value](self, "value");
  double v5 = v4;
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSlider filledTrackLayer](self, "filledTrackLayer"));
  [v6 setStrokeEnd:v5];

  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSlider unfilledTrackLayer](self, "unfilledTrackLayer"));
  [v7 setStrokeStart:v5];

  -[AXTVSlider bounds](self, "bounds");
  if (v3) {
    double v12 = v10 - v10 * v5;
  }
  else {
    double v12 = v5 * v10;
  }
  double MidY = CGRectGetMidY(*(CGRect *)&v8);
  double v14 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSlider grabberLayer](self, "grabberLayer"));
  objc_msgSend(v14, "setPosition:", v12, MidY);

  +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
}

- (void)_updateColorsForUserInterfaceStyle:(int64_t)a3
{
  if ((unint64_t)a3 >= 2)
  {
    if (a3 != 2) {
      return;
    }
    id v12 = objc_claimAutoreleasedReturnValue( +[UIColor colorWithWhite:alpha:]( &OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.08));
    id v13 = [v12 CGColor];
    double v14 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSlider unfilledTrackLayer](self, "unfilledTrackLayer"));
    [v14 setStrokeColor:v13];

    id v15 = objc_claimAutoreleasedReturnValue( +[UIColor colorWithWhite:alpha:]( &OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.5, 1.0));
    id v16 = [v15 CGColor];
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSlider defaultTickLayer](self, "defaultTickLayer"));
    [v17 setBackgroundColor:v16];

    double v10 = 0.35;
    double v11 = 1.0;
  }

  else
  {
    id v4 = objc_claimAutoreleasedReturnValue( +[UIColor colorWithWhite:alpha:]( &OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.15));
    id v5 = [v4 CGColor];
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSlider unfilledTrackLayer](self, "unfilledTrackLayer"));
    [v6 setStrokeColor:v5];

    id v7 = objc_claimAutoreleasedReturnValue( +[UIColor colorWithWhite:alpha:]( &OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.5, 1.0));
    id v8 = [v7 CGColor];
    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSlider defaultTickLayer](self, "defaultTickLayer"));
    [v9 setBackgroundColor:v8];

    double v10 = 0.55;
    double v11 = 0.0;
  }

  id v20 = objc_claimAutoreleasedReturnValue( +[UIColor colorWithWhite:alpha:]( &OBJC_CLASS___UIColor, "colorWithWhite:alpha:", v11, v10));
  id v18 = [v20 CGColor];
  double v19 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVSlider filledTrackLayer](self, "filledTrackLayer"));
  [v19 setStrokeColor:v18];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)setValue:(double)a3
{
  if (a3 < 0.0) {
    a3 = 0.0;
  }
  self->_value = fmin(a3, 1.0);
  -[AXTVSlider _updateSliderPosition](self, "_updateSliderPosition");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitAdjustable;
}

- (void)accessibilityIncrement
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[AXTVSlider accessibilityDelegate](self, "accessibilityDelegate"));
  [v3 sliderDidReceiveAccessibilityIncrement:self];
}

- (void)accessibilityDecrement
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[AXTVSlider accessibilityDelegate](self, "accessibilityDelegate"));
  [v3 sliderDidReceiveAccessibilityDecrement:self];
}

- (BOOL)_accessibilityShouldIgnoreSoundForFailedMoveAttempt
{
  return 1;
}

- (BOOL)_accessibilityDisplayFocusIndicatorForFocusEverywhereView
{
  return 1;
}

- (AXTVSliderAccessibilityDelegate)accessibilityDelegate
{
  return (AXTVSliderAccessibilityDelegate *)objc_loadWeakRetained((id *)&self->_accessibilityDelegate);
}

- (void)setAccessibilityDelegate:(id)a3
{
}

- (double)value
{
  return self->_value;
}

- (NSNumber)defaultTickValue
{
  return self->_defaultTickValue;
}

- (CAShapeLayer)filledTrackLayer
{
  return self->_filledTrackLayer;
}

- (void)setFilledTrackLayer:(id)a3
{
}

- (CAShapeLayer)unfilledTrackLayer
{
  return self->_unfilledTrackLayer;
}

- (void)setUnfilledTrackLayer:(id)a3
{
}

- (CAShapeLayer)grabberLayer
{
  return self->_grabberLayer;
}

- (void)setGrabberLayer:(id)a3
{
}

- (CALayer)defaultTickLayer
{
  return self->_defaultTickLayer;
}

- (void)setDefaultTickLayer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end