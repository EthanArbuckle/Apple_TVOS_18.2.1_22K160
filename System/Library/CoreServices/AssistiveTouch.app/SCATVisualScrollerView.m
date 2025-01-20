@interface SCATVisualScrollerView
+ (CGSize)scrollerSize;
- (BOOL)scatBeginScanningFromSelfAfterActivation;
- (BOOL)scatHidesGroupCursorWhenFocused;
- (BOOL)scatIndicatesOwnFocus;
- (BOOL)scatIsAuxiliaryElement;
- (BOOL)scatPerformAction:(int)a3;
- (BOOL)scatShouldAllowDeferFocusToNativeFocusedElement;
- (BOOL)updateFocusState:(int64_t)a3;
- (CAShapeLayer)triangleKnockoutLayer;
- (CAShapeLayer)triangleStrokeLayer;
- (SCATVisualScrollerView)initWithTriangle:(unint64_t)a3;
- (id)activateActionHandler;
- (id)description;
- (unint64_t)triangle;
- (void)layoutSubviews;
- (void)setActivateActionHandler:(id)a3;
- (void)setTriangle:(unint64_t)a3;
- (void)setTriangleKnockoutLayer:(id)a3;
- (void)setTriangleStrokeLayer:(id)a3;
@end

@implementation SCATVisualScrollerView

- (SCATVisualScrollerView)initWithTriangle:(unint64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SCATVisualScrollerView;
  v4 = -[SCATCustomFocusingView initWithFrame:]( &v14,  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  v5 = v4;
  if (v4)
  {
    -[SCATVisualScrollerView setTranslatesAutoresizingMaskIntoConstraints:]( v4,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[SCATVisualScrollerView setTriangle:](v5, "setTriangle:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerView layer](v5, "layer"));
    [v6 setMasksToBounds:1];

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](&OBJC_CLASS___CAShapeLayer, "layer"));
    [v7 setLineWidth:1.0];
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerView triangleKnockoutLayer](v5, "triangleKnockoutLayer"));
    [v8 setFillRule:kCAFillRuleEvenOdd];

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerView layer](v5, "layer"));
    [v9 addSublayer:v7];

    -[SCATVisualScrollerView setTriangleKnockoutLayer:](v5, "setTriangleKnockoutLayer:", v7);
    [v7 setLineCap:kCALineCapRound];
    [v7 setLineJoin:kCALineJoinRound];
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](&OBJC_CLASS___CAShapeLayer, "layer"));
    id v11 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    objc_msgSend(v10, "setFillColor:", objc_msgSend(v11, "CGColor"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerView layer](v5, "layer"));
    [v12 addSublayer:v10];

    -[SCATVisualScrollerView setTriangleStrokeLayer:](v5, "setTriangleStrokeLayer:", v10);
    [v10 setLineCap:kCALineCapRound];
    [v10 setLineJoin:kCALineJoinRound];
  }

  return v5;
}

- (id)description
{
  unint64_t triangle = self->_triangle;
  if (triangle > 3) {
    v4 = 0LL;
  }
  else {
    v4 = off_100121EC0[triangle];
  }
  -[SCATVisualScrollerView frame](self, "frame");
  v5 = NSStringFromCGRect(v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SCATVisualScrollerView: %p. %@. frame:%@ ",  self,  v4,  v6));

  return v7;
}

+ (CGSize)scrollerSize
{
  double v2 = 20.0;
  double v3 = 20.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  v68.receiver = self;
  v68.super_class = (Class)&OBJC_CLASS___SCATVisualScrollerView;
  -[SCATVisualScrollerView layoutSubviews](&v68, "layoutSubviews");
  -[SCATVisualScrollerView bounds](self, "bounds");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerView triangleKnockoutLayer](self, "triangleKnockoutLayer"));
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerView triangleStrokeLayer](self, "triangleStrokeLayer"));
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

  if (v8 >= v10) {
    double v13 = v10;
  }
  else {
    double v13 = v8;
  }
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithRect:]( &OBJC_CLASS___UIBezierPath,  "bezierPathWithRect:",  v4,  v6,  v8,  v10));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPath](&OBJC_CLASS___UIBezierPath, "bezierPath"));
  unint64_t v16 = -[SCATVisualScrollerView triangle](self, "triangle");
  double v17 = v13 * 0.5 + -4.0;
  double v18 = v17 * 1.73205081;
  switch(v16)
  {
    case 0uLL:
      double v19 = v17 + v17;
      double v20 = 4.0;
      double v21 = 4.0;
      CGRect v69 = CGRectIntegral(*(CGRect *)(&v18 - 3));
      CGFloat x = v69.origin.x;
      CGFloat y = v69.origin.y;
      CGFloat width = v69.size.width;
      CGFloat height = v69.size.height;
      double MinX = CGRectGetMinX(v69);
      v70.origin.CGFloat x = x;
      v70.origin.CGFloat y = y;
      v70.size.CGFloat width = width;
      v70.size.CGFloat height = height;
      objc_msgSend(v15, "moveToPoint:", MinX, CGRectGetMaxY(v70));
      v71.origin.CGFloat x = x;
      v71.origin.CGFloat y = y;
      v71.size.CGFloat width = width;
      v71.size.CGFloat height = height;
      double MidX = CGRectGetMidX(v71);
      v72.origin.CGFloat x = x;
      v72.origin.CGFloat y = y;
      v72.size.CGFloat width = width;
      v72.size.CGFloat height = height;
      objc_msgSend(v15, "addLineToPoint:", MidX, CGRectGetMinY(v72));
      v73.origin.CGFloat x = x;
      v73.origin.CGFloat y = y;
      v73.size.CGFloat width = width;
      v73.size.CGFloat height = height;
      double MaxX = CGRectGetMaxX(v73);
      CGFloat v29 = x;
      CGFloat v30 = y;
      CGFloat v31 = width;
      CGFloat v32 = height;
      goto LABEL_9;
    case 1uLL:
      double v33 = v17 + v17;
      uint64_t v34 = 0LL;
      double v35 = 4.0;
      CGRect v74 = CGRectIntegral(*(CGRect *)(&v18 - 3));
      CGFloat v36 = v74.origin.y;
      CGFloat v37 = v74.size.width;
      CGFloat v38 = v74.size.height;
      CGFloat v39 = v8 - v74.size.width + -4.0;
      v74.origin.CGFloat x = v39;
      v74.size.CGFloat width = v74.size.height;
      v74.size.CGFloat height = v37;
      double v40 = CGRectGetMinX(v74);
      v75.origin.CGFloat x = v39;
      v75.origin.CGFloat y = v36;
      v75.size.CGFloat width = v38;
      v75.size.CGFloat height = v37;
      objc_msgSend(v15, "moveToPoint:", v40, CGRectGetMinY(v75));
      v76.origin.CGFloat x = v39;
      v76.origin.CGFloat y = v36;
      v76.size.CGFloat width = v38;
      v76.size.CGFloat height = v37;
      double v41 = CGRectGetMaxX(v76);
      v77.origin.CGFloat x = v39;
      v77.origin.CGFloat y = v36;
      v77.size.CGFloat width = v38;
      v77.size.CGFloat height = v37;
      objc_msgSend(v15, "addLineToPoint:", v41, CGRectGetMidY(v77));
      v78.origin.CGFloat x = v39;
      v78.origin.CGFloat y = v36;
      v78.size.CGFloat width = v38;
      v78.size.CGFloat height = v37;
      double MaxX = CGRectGetMinX(v78);
      CGFloat v29 = v39;
      CGFloat v30 = v36;
      CGFloat v31 = v38;
      CGFloat v32 = v37;
      goto LABEL_9;
    case 2uLL:
      double v42 = v17 + v17;
      double v43 = 4.0;
      uint64_t v44 = 0LL;
      CGRect v79 = CGRectIntegral(*(CGRect *)(&v18 - 3));
      CGFloat v45 = v79.origin.x;
      CGFloat v46 = v79.size.width;
      CGFloat v47 = v79.size.height;
      CGFloat v48 = v10 - v79.size.height + -4.0;
      v79.origin.CGFloat y = v48;
      double v49 = CGRectGetMinX(v79);
      v80.origin.CGFloat x = v45;
      v80.origin.CGFloat y = v48;
      v80.size.CGFloat width = v46;
      v80.size.CGFloat height = v47;
      objc_msgSend(v15, "moveToPoint:", v49, CGRectGetMinY(v80));
      v81.origin.CGFloat x = v45;
      v81.origin.CGFloat y = v48;
      v81.size.CGFloat width = v46;
      v81.size.CGFloat height = v47;
      double v50 = CGRectGetMidX(v81);
      v82.origin.CGFloat x = v45;
      v82.origin.CGFloat y = v48;
      v82.size.CGFloat width = v46;
      v82.size.CGFloat height = v47;
      objc_msgSend(v15, "addLineToPoint:", v50, CGRectGetMaxY(v82));
      v83.origin.CGFloat x = v45;
      v83.origin.CGFloat y = v48;
      v83.size.CGFloat width = v46;
      v83.size.CGFloat height = v47;
      double MaxX = CGRectGetMaxX(v83);
      v84.origin.CGFloat x = v45;
      v84.origin.CGFloat y = v48;
      v84.size.CGFloat width = v46;
      v84.size.CGFloat height = v47;
      double MinY = CGRectGetMinY(v84);
      goto LABEL_10;
    case 3uLL:
      double v52 = v17 + v17;
      double v53 = 4.0;
      double v54 = 4.0;
      CGRect v85 = CGRectIntegral(*(CGRect *)(&v18 - 3));
      CGFloat v55 = v85.origin.x;
      CGFloat v56 = v85.origin.y;
      CGFloat v57 = v85.size.width;
      CGFloat v58 = v85.size.height;
      v85.size.CGFloat width = v85.size.height;
      v85.size.CGFloat height = v57;
      double v59 = CGRectGetMinX(v85);
      v86.origin.CGFloat x = v55;
      v86.origin.CGFloat y = v56;
      v86.size.CGFloat width = v58;
      v86.size.CGFloat height = v57;
      objc_msgSend(v15, "moveToPoint:", v59, CGRectGetMidY(v86));
      v87.origin.CGFloat x = v55;
      v87.origin.CGFloat y = v56;
      v87.size.CGFloat width = v58;
      v87.size.CGFloat height = v57;
      double v60 = CGRectGetMaxX(v87);
      v88.origin.CGFloat x = v55;
      v88.origin.CGFloat y = v56;
      v88.size.CGFloat width = v58;
      v88.size.CGFloat height = v57;
      objc_msgSend(v15, "addLineToPoint:", v60, CGRectGetMinY(v88));
      v89.origin.CGFloat x = v55;
      v89.origin.CGFloat y = v56;
      v89.size.CGFloat width = v58;
      v89.size.CGFloat height = v57;
      double MaxX = CGRectGetMaxX(v89);
      CGFloat v29 = v55;
      CGFloat v30 = v56;
      CGFloat v31 = v58;
      CGFloat v32 = v57;
LABEL_9:
      double MinY = CGRectGetMaxY(*(CGRect *)&v29);
LABEL_10:
      objc_msgSend(v15, "addLineToPoint:", MaxX, MinY);
      [v15 closePath];
      break;
    default:
      break;
  }

  [v14 appendPath:v15];
  [v14 setUsesEvenOddFillRule:1];
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerView triangleKnockoutLayer](self, "triangleKnockoutLayer"));
  [v61 setFillRule:kCAFillRuleEvenOdd];

  id v62 = v14;
  id v63 = [v62 CGPath];
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerView triangleKnockoutLayer](self, "triangleKnockoutLayer"));
  [v64 setPath:v63];

  id v65 = v15;
  id v66 = [v65 CGPath];
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerView triangleStrokeLayer](self, "triangleStrokeLayer"));
  [v67 setPath:v66];
}

- (BOOL)updateFocusState:(int64_t)a3
{
  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___SCATVisualScrollerView;
  BOOL v6 = -[SCATCustomFocusingView updateFocusState:](&v36, "updateFocusState:");
  if (!v6) {
    return v6;
  }
  switch(a3)
  {
    case 0LL:
      id v17 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
      id v18 = [v17 CGColor];
      double v19 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerView triangleKnockoutLayer](self, "triangleKnockoutLayer"));
      [v19 setFillColor:v18];

      id v21 = objc_msgSend((id)objc_opt_class(self, v20), "unfocusedStateColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
LABEL_8:
      id v28 = v22;
      id v29 = [v28 CGColor];
      CGFloat v30 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerView triangleStrokeLayer](self, "triangleStrokeLayer"));
      [v30 setStrokeColor:v29];

      objc_msgSend((id)objc_opt_class(self, v31), "unfocusedStateBorderThickness");
      double v33 = v32;
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerView triangleStrokeLayer](self, "triangleStrokeLayer"));
      [v34 setLineWidth:v33];

      objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerView triangleStrokeLayer](self, "triangleStrokeLayer"));
      v15 = v14;
      LODWORD(v16) = 1053609165;
      goto LABEL_9;
    case 2LL:
      id v23 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
      id v24 = [v23 CGColor];
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerView triangleKnockoutLayer](self, "triangleKnockoutLayer"));
      [v25 setFillColor:v24];

      id v27 = objc_msgSend((id)objc_opt_class(self, v26), "focusedGroupStateColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue(v27);
      goto LABEL_8;
    case 1LL:
      id v7 = objc_msgSend((id)objc_opt_class(self, v5), "focusedStateColor");
      id v8 = objc_claimAutoreleasedReturnValue(v7);
      id v9 = [v8 CGColor];
      double v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerView triangleKnockoutLayer](self, "triangleKnockoutLayer"));
      [v10 setFillColor:v9];

      id v11 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
      id v12 = [v11 CGColor];
      double v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerView triangleStrokeLayer](self, "triangleStrokeLayer"));
      [v13 setStrokeColor:v12];

      objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerView triangleStrokeLayer](self, "triangleStrokeLayer"));
      v15 = v14;
      LODWORD(v16) = 1.0;
LABEL_9:
      [v14 setOpacity:v16];

      break;
  }

  return v6;
}

- (BOOL)scatIndicatesOwnFocus
{
  return 1;
}

- (BOOL)scatPerformAction:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerView activateActionHandler](self, "activateActionHandler"));

  if (v5)
  {
    BOOL v6 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerView activateActionHandler](self, "activateActionHandler"));
    v6[2]();

    return 1;
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___SCATVisualScrollerView;
    return -[SCATVisualScrollerView scatPerformAction:](&v8, "scatPerformAction:", v3);
  }

- (BOOL)scatShouldAllowDeferFocusToNativeFocusedElement
{
  return 0;
}

- (BOOL)scatIsAuxiliaryElement
{
  return 1;
}

- (BOOL)scatHidesGroupCursorWhenFocused
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerView scatAuxiliaryElementManager](self, "scatAuxiliaryElementManager"));
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___SCATVisualScrollersAuxiliaryElementManager, v4);
  char isKindOfClass = objc_opt_isKindOfClass(v3, v5);

  BOOL result = 0;
  if ((isKindOfClass & 1) != 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATVisualScrollerView scatAuxiliaryElementManager](self, "scatAuxiliaryElementManager"));
    unsigned __int8 v8 = [v7 isTopLevel];

    if ((v8 & 1) != 0) {
      return 1;
    }
  }

  return result;
}

- (BOOL)scatBeginScanningFromSelfAfterActivation
{
  return 1;
}

- (unint64_t)triangle
{
  return self->_triangle;
}

- (void)setTriangle:(unint64_t)a3
{
  self->_unint64_t triangle = a3;
}

- (id)activateActionHandler
{
  return self->_activateActionHandler;
}

- (void)setActivateActionHandler:(id)a3
{
}

- (CAShapeLayer)triangleKnockoutLayer
{
  return self->_triangleKnockoutLayer;
}

- (void)setTriangleKnockoutLayer:(id)a3
{
}

- (CAShapeLayer)triangleStrokeLayer
{
  return self->_triangleStrokeLayer;
}

- (void)setTriangleStrokeLayer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end