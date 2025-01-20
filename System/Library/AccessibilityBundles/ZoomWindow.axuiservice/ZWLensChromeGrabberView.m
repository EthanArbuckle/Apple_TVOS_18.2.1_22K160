@interface ZWLensChromeGrabberView
- (BOOL)isAccessibilityElement;
- (BOOL)isExpanded;
- (CAShapeLayer)etchLayer;
- (CAShapeLayer)outerBorderLayer;
- (ZWLensChromeGrabberView)initWithCoder:(id)a3;
- (ZWLensChromeGrabberView)initWithEdge:(int64_t)a3 startExpanded:(BOOL)a4;
- (ZWLensChromeGrabberView)initWithFrame:(CGRect)a3;
- (id)_grabberEtchPathForCurrentEdge;
- (id)_grabberPathForCurrentEdgeIncludingFlatEdge:(BOOL)a3;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (int64_t)grabberEdge;
- (unint64_t)accessibilityTraits;
- (void)collapseGrabberAnimated:(BOOL)a3;
- (void)expandGrabberAnimated:(BOOL)a3;
- (void)layoutSubviews;
- (void)setEtchLayer:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setGrabberEdge:(int64_t)a3;
- (void)setOuterBorderLayer:(id)a3;
@end

@implementation ZWLensChromeGrabberView

- (ZWLensChromeGrabberView)initWithFrame:(CGRect)a3
{
  return -[ZWLensChromeGrabberView initWithEdge:startExpanded:](self, "initWithEdge:startExpanded:", 2LL, 1LL);
}

- (ZWLensChromeGrabberView)initWithCoder:(id)a3
{
  return -[ZWLensChromeGrabberView initWithEdge:startExpanded:](self, "initWithEdge:startExpanded:", 2LL, 1LL);
}

- (ZWLensChromeGrabberView)initWithEdge:(int64_t)a3 startExpanded:(BOOL)a4
{
  BOOL v4 = a4;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___ZWLensChromeGrabberView;
  v6 = -[ZWLensChromeGrabberView initWithFrame:]( &v29,  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  v7 = v6;
  if (v6)
  {
    -[ZWLensChromeGrabberView setGrabberEdge:](v6, "setGrabberEdge:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](&OBJC_CLASS___CAShapeLayer, "layer"));
    -[ZWLensChromeGrabberView setOuterBorderLayer:](v7, "setOuterBorderLayer:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeGrabberView layer](v7, "layer"));
    [v9 addSublayer:v8];

    id v10 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    objc_msgSend(v8, "setFillColor:", objc_msgSend(v10, "CGColor"));

    id v11 = ZWLensOuterColor();
    id v12 = objc_claimAutoreleasedReturnValue(v11);
    objc_msgSend(v8, "setStrokeColor:", objc_msgSend(v12, "CGColor"));

    double v13 = ZWLensOuterBorderWidth();
    [v8 setLineWidth:v13 + v13];
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](&OBJC_CLASS___CAShapeLayer, "layer"));
    -[ZWLensChromeGrabberView setEtchLayer:](v7, "setEtchLayer:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeGrabberView layer](v7, "layer"));
    [v15 addSublayer:v14];

    id v16 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    objc_msgSend(v14, "setFillColor:", objc_msgSend(v16, "CGColor"));

    id v17 = ZWLensOuterColor();
    id v18 = objc_claimAutoreleasedReturnValue(v17);
    objc_msgSend(v14, "setStrokeColor:", objc_msgSend(v18, "CGColor"));

    [v14 setLineWidth:ZWLensOuterBorderWidth()];
    [v14 setLineJoin:kCALineJoinBevel];
    if (-[ZWLensChromeGrabberView grabberEdge](v7, "grabberEdge"))
    {
      v19 = -[ZWLensChromeGrabberView grabberEdge](v7, "grabberEdge");
      if (v19 == (_BYTE *)&dword_0 + 2) {
        uint64_t v20 = 7LL;
      }
      else {
        uint64_t v20 = 8LL;
      }
      if (v19 == (_BYTE *)&dword_0 + 2) {
        uint64_t v21 = 8LL;
      }
      else {
        uint64_t v21 = 7LL;
      }
    }

    else
    {
      uint64_t v21 = 8LL;
      uint64_t v20 = 7LL;
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v7,  v20,  0LL,  0LL,  0LL,  0.0,  90.0));
    LODWORD(v23) = 1148829696;
    [v22 setPriority:v23];
    -[ZWLensChromeGrabberView addConstraint:](v7, "addConstraint:", v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v7,  v21,  0LL,  0LL,  0LL,  0.0,  20.0));

    LODWORD(v25) = 1148829696;
    [v24 setPriority:v25];
    -[ZWLensChromeGrabberView addConstraint:](v7, "addConstraint:", v24);

    if (v4) {
      -[ZWLensChromeGrabberView expandGrabberAnimated:](v7, "expandGrabberAnimated:", 0LL);
    }
    else {
      -[ZWLensChromeGrabberView collapseGrabberAnimated:](v7, "collapseGrabberAnimated:", 0LL);
    }
    id v26 = ZWLensInnerColor();
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    -[ZWLensChromeGrabberView setBackgroundColor:](v7, "setBackgroundColor:", v27);
  }

  return v7;
}

- (void)layoutSubviews
{
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___ZWLensChromeGrabberView;
  -[ZWLensChromeGrabberView layoutSubviews](&v31, "layoutSubviews");
  +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
  +[CATransaction setDisableActions:](&OBJC_CLASS___CATransaction, "setDisableActions:", 1LL);
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[ZWLensChromeGrabberView _grabberPathForCurrentEdgeIncludingFlatEdge:]( self,  "_grabberPathForCurrentEdgeIncludingFlatEdge:",  1LL));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](&OBJC_CLASS___CAShapeLayer, "layer"));
  id v5 = v3;
  objc_msgSend(v4, "setPath:", objc_msgSend(v5, "CGPath"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeGrabberView layer](self, "layer"));
  [v6 setMask:v4];

  -[ZWLensChromeGrabberView bounds](self, "bounds");
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeGrabberView outerBorderLayer](self, "outerBorderLayer"));
  objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

  id v16 = objc_claimAutoreleasedReturnValue( -[ZWLensChromeGrabberView _grabberPathForCurrentEdgeIncludingFlatEdge:]( self, "_grabberPathForCurrentEdgeIncludingFlatEdge:", 0LL));
  id v17 = [v16 CGPath];
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeGrabberView outerBorderLayer](self, "outerBorderLayer"));
  [v18 setPath:v17];

  -[ZWLensChromeGrabberView bounds](self, "bounds");
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeGrabberView etchLayer](self, "etchLayer"));
  objc_msgSend(v27, "setFrame:", v20, v22, v24, v26);

  id v28 = objc_claimAutoreleasedReturnValue( -[ZWLensChromeGrabberView _grabberEtchPathForCurrentEdge]( self, "_grabberEtchPathForCurrentEdge"));
  id v29 = [v28 CGPath];
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeGrabberView etchLayer](self, "etchLayer"));
  [v30 setPath:v29];

  +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
}

- (id)_grabberPathForCurrentEdgeIncludingFlatEdge:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[ZWLensChromeGrabberView grabberEdge](self, "grabberEdge"))
  {
    int64_t v5 = -[ZWLensChromeGrabberView grabberEdge](self, "grabberEdge");
    if (v5 == 2) {
      double v6 = 20.0;
    }
    else {
      double v6 = 90.0;
    }
    if (v5 == 2) {
      double v7 = 90.0;
    }
    else {
      double v7 = 20.0;
    }
  }

  else
  {
    double v6 = 20.0;
    double v7 = 90.0;
  }

  v23.origin.x = 0.0;
  v23.origin.y = 0.0;
  v23.size.width = v7;
  v23.size.height = v6;
  double MidX = CGRectGetMidX(v23);
  v24.origin.x = 0.0;
  v24.origin.y = 0.0;
  v24.size.width = v7;
  v24.size.height = v6;
  double MidY = CGRectGetMidY(v24);
  double v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPath](&OBJC_CLASS___UIBezierPath, "bezierPath"));
  objc_msgSend(v10, "moveToPoint:", 0.0, 0.0);
  if (-[ZWLensChromeGrabberView grabberEdge](self, "grabberEdge")
    && (char *)-[ZWLensChromeGrabberView grabberEdge](self, "grabberEdge") != (char *)&dword_0 + 2)
  {
    objc_msgSend( v10,  "addCurveToPoint:controlPoint1:controlPoint2:",  v7 + 0.0,  v6 * 0.5 + 0.0,  0.0,  v6 * 0.25 + 0.0,  v7 + 0.0,  v6 * 0.25 + 0.0);
    double v15 = v6 * 3.0 * 0.25 + 0.0;
    double v12 = v10;
    double v13 = 0.0;
    double v14 = v6 + 0.0;
    double v11 = v7 + 0.0;
    double v16 = 0.0;
    double v17 = v15;
  }

  else
  {
    objc_msgSend( v10,  "addCurveToPoint:controlPoint1:controlPoint2:",  v7 * 0.5 + 0.0,  v6 + 0.0,  v7 * 0.25 + 0.0,  0.0,  v7 * 0.25 + 0.0,  v6 + 0.0);
    double v11 = v7 * 3.0 * 0.25 + 0.0;
    double v12 = v10;
    double v13 = v7 + 0.0;
    double v14 = 0.0;
    double v15 = v6 + 0.0;
    double v16 = v11;
    double v17 = 0.0;
  }

  objc_msgSend(v12, "addCurveToPoint:controlPoint1:controlPoint2:", v13, v14, v11, v15, v16, v17);
  if (v3) {
    [v10 closePath];
  }
  if (!-[ZWLensChromeGrabberView grabberEdge](self, "grabberEdge")
    || (char *)-[ZWLensChromeGrabberView grabberEdge](self, "grabberEdge") == (char *)&dword_0 + 3)
  {
    __int128 v18 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v22.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v22.c = v18;
    *(_OWORD *)&v22.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    *(_OWORD *)&v21.a = *(_OWORD *)&v22.a;
    *(_OWORD *)&v21.c = v18;
    *(_OWORD *)&v21.tx = *(_OWORD *)&v22.tx;
    CGAffineTransformTranslate(&v22, &v21, MidX, MidY);
    CGAffineTransform v20 = v22;
    CGAffineTransformRotate(&v21, &v20, 3.14159265);
    CGAffineTransform v22 = v21;
    CGAffineTransform v20 = v21;
    CGAffineTransformTranslate(&v21, &v20, -MidX, -MidY);
    CGAffineTransform v22 = v21;
    [v10 applyTransform:&v21];
  }

  return v10;
}

- (id)_grabberEtchPathForCurrentEdge
{
  if (-[ZWLensChromeGrabberView grabberEdge](self, "grabberEdge"))
  {
    int64_t v3 = -[ZWLensChromeGrabberView grabberEdge](self, "grabberEdge");
    if (v3 == 2) {
      double v4 = 20.0;
    }
    else {
      double v4 = 90.0;
    }
    if (v3 == 2) {
      double v5 = 90.0;
    }
    else {
      double v5 = 20.0;
    }
  }

  else
  {
    double v4 = 20.0;
    double v5 = 90.0;
  }

  v19.origin.x = 0.0;
  v19.origin.y = 0.0;
  v19.size.width = v5;
  v19.size.height = v4;
  double MidX = CGRectGetMidX(v19);
  v20.origin.x = 0.0;
  v20.origin.y = 0.0;
  v20.size.width = v5;
  v20.size.height = v4;
  double MidY = CGRectGetMidY(v20);
  double v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPath](&OBJC_CLASS___UIBezierPath, "bezierPath"));
  if (-[ZWLensChromeGrabberView grabberEdge](self, "grabberEdge")
    && (char *)-[ZWLensChromeGrabberView grabberEdge](self, "grabberEdge") != (char *)&dword_0 + 2)
  {
    double v11 = MidX + -10.0;
    double v13 = MidY + -10.0;
    double v10 = MidY + 10.0;
    double v12 = v8;
    double v9 = MidX + -10.0;
  }

  else
  {
    double v9 = MidX + -10.0;
    double v10 = MidY + -10.0;
    double v11 = MidX + 10.0;
    double v12 = v8;
    double v13 = MidY + -10.0;
  }

  objc_msgSend(v12, "moveToPoint:", v9, v13);
  objc_msgSend(v8, "addLineToPoint:", MidX, MidY);
  objc_msgSend(v8, "addLineToPoint:", v11, v10);
  if (!-[ZWLensChromeGrabberView grabberEdge](self, "grabberEdge")
    || (char *)-[ZWLensChromeGrabberView grabberEdge](self, "grabberEdge") == (char *)&dword_0 + 3)
  {
    __int128 v14 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v18.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v18.c = v14;
    *(_OWORD *)&v18.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    *(_OWORD *)&v17.a = *(_OWORD *)&v18.a;
    *(_OWORD *)&v17.c = v14;
    *(_OWORD *)&v17.tx = *(_OWORD *)&v18.tx;
    CGAffineTransformTranslate(&v18, &v17, MidX, MidY);
    CGAffineTransform v16 = v18;
    CGAffineTransformRotate(&v17, &v16, 3.14159265);
    CGAffineTransform v18 = v17;
    CGAffineTransform v16 = v17;
    CGAffineTransformTranslate(&v17, &v16, -MidX, -MidY);
    CGAffineTransform v18 = v17;
    [v8 applyTransform:&v17];
  }

  return v8;
}

- (void)expandGrabberAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  -[ZWLensChromeGrabberView setExpanded:](self, "setExpanded:", 1LL);
  double v4 = 0.0;
  if (v3) {
    double v4 = ZWDefaultFadeAnimationDuration();
  }
  +[UIView animateWithDuration:animations:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:",  &__block_literal_global_0,  v4);
}

- (void)collapseGrabberAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  -[ZWLensChromeGrabberView setExpanded:](self, "setExpanded:", 0LL);
  double v5 = 0.0;
  if (v3) {
    double v5 = ZWDefaultFadeAnimationDuration();
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __51__ZWLensChromeGrabberView_collapseGrabberAnimated___block_invoke;
  v6[3] = &unk_6CBC0;
  v6[4] = self;
  +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v6, v5);
}

id __51__ZWLensChromeGrabberView_collapseGrabberAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

- (BOOL)isAccessibilityElement
{
  if (v3 <= 0.0) {
    return 0;
  }
  else {
    return -[ZWLensChromeGrabberView isHidden](self, "isHidden") ^ 1;
  }
}

- (id)accessibilityLabel
{
  unint64_t v2 = -[ZWLensChromeGrabberView grabberEdge](self, "grabberEdge");
  if (v2 <= 3)
  {
    id v4 = ZWLocString(off_6CC28[v2]);
    double v3 = (void *)objc_claimAutoreleasedReturnValue(v4);
  }

  return v3;
}

- (id)accessibilityHint
{
  return ZWLocString(@"ZW_GRABBER_HINT");
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

- (int64_t)grabberEdge
{
  return self->_grabberEdge;
}

- (void)setGrabberEdge:(int64_t)a3
{
  self->_grabberEdge = a3;
}

- (CAShapeLayer)outerBorderLayer
{
  return self->_outerBorderLayer;
}

- (void)setOuterBorderLayer:(id)a3
{
}

- (CAShapeLayer)etchLayer
{
  return self->_etchLayer;
}

- (void)setEtchLayer:(id)a3
{
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (void)setExpanded:(BOOL)a3
{
  self->_expanded = a3;
}

- (void).cxx_destruct
{
}

@end