@interface ZWDockedLensChromeBorderView
- (CAShapeLayer)chromeInnerBorderLayer;
- (CAShapeLayer)chromeOuterBorderLayer;
- (CAShapeLayer)touchStealerShapeLayer;
- (ZWDockedLensChromeBorderView)initWithFrame:(CGRect)a3;
- (id)innerBorderPathForCurrentDockPositionForBounds:(CGRect)a3;
- (id)outerBorderPathForCurrentDockPositionForBounds:(CGRect)a3;
- (int64_t)dockPosition;
- (void)layoutSubviews;
- (void)setChromeInnerBorderLayer:(id)a3;
- (void)setChromeOuterBorderLayer:(id)a3;
- (void)setDockPosition:(int64_t)a3;
- (void)setTouchStealerShapeLayer:(id)a3;
@end

@implementation ZWDockedLensChromeBorderView

- (ZWDockedLensChromeBorderView)initWithFrame:(CGRect)a3
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___ZWDockedLensChromeBorderView;
  v3 = -[ZWDockedLensChromeBorderView initWithFrame:]( &v23,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWDockedLensChromeBorderView layer](v3, "layer"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](&OBJC_CLASS___CAShapeLayer, "layer"));
    -[ZWDockedLensChromeBorderView setChromeInnerBorderLayer:](v4, "setChromeInnerBorderLayer:", v6);
    [v5 addSublayer:v6];
    id v7 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    objc_msgSend(v6, "setFillColor:", objc_msgSend(v7, "CGColor"));

    id v8 = ZWLensInnerColor();
    id v9 = objc_claimAutoreleasedReturnValue(v8);
    objc_msgSend(v6, "setStrokeColor:", objc_msgSend(v9, "CGColor"));

    [v6 setLineWidth:ZWLensInnerBorderWidth()];
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterPlusL));
    [v6 setCompositingFilter:v10];

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](&OBJC_CLASS___CAShapeLayer, "layer"));
    -[ZWDockedLensChromeBorderView setChromeOuterBorderLayer:](v4, "setChromeOuterBorderLayer:", v11);
    [v5 addSublayer:v11];
    id v12 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    objc_msgSend(v11, "setFillColor:", objc_msgSend(v12, "CGColor"));

    id v13 = ZWLensOuterColor();
    id v14 = objc_claimAutoreleasedReturnValue(v13);
    objc_msgSend(v11, "setStrokeColor:", objc_msgSend(v14, "CGColor"));

    [v11 setLineWidth:ZWLensOuterBorderWidth()];
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterPlusD));
    [v11 setCompositingFilter:v15];

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](&OBJC_CLASS___CAShapeLayer, "layer"));
    -[ZWDockedLensChromeBorderView setTouchStealerShapeLayer:](v4, "setTouchStealerShapeLayer:", v16);
    LODWORD(v17) = 1.0;
    [v16 setOpacity:v17];
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    id v19 = objc_claimAutoreleasedReturnValue([v18 colorWithAlphaComponent:0.00392156863]);
    objc_msgSend(v16, "setStrokeColor:", objc_msgSend(v19, "CGColor"));

    id v20 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    objc_msgSend(v16, "setFillColor:", objc_msgSend(v20, "CGColor"));

    [v16 setLineWidth:ZWZoomLensBorderThicknessForTouches()];
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ZWDockedLensChromeBorderView layer](v4, "layer"));
    [v21 addSublayer:v16];
  }

  return v4;
}

- (void)layoutSubviews
{
  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS___ZWDockedLensChromeBorderView;
  -[ZWDockedLensChromeBorderView layoutSubviews](&v41, "layoutSubviews");
  +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
  +[CATransaction setDisableActions:](&OBJC_CLASS___CATransaction, "setDisableActions:", 1LL);
  -[ZWDockedLensChromeBorderView bounds](self, "bounds");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ZWDockedLensChromeBorderView chromeInnerBorderLayer](self, "chromeInnerBorderLayer"));
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[ZWDockedLensChromeBorderView bounds](self, "bounds");
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[ZWDockedLensChromeBorderView chromeOuterBorderLayer](self, "chromeOuterBorderLayer"));
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

  -[ZWDockedLensChromeBorderView bounds](self, "bounds");
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[ZWDockedLensChromeBorderView touchStealerShapeLayer](self, "touchStealerShapeLayer"));
  objc_msgSend(v29, "setFrame:", v22, v24, v26, v28);

  -[ZWDockedLensChromeBorderView bounds](self, "bounds");
  id v30 = objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithRect:]( &OBJC_CLASS___UIBezierPath, "bezierPathWithRect:"));
  id v31 = [v30 CGPath];
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[ZWDockedLensChromeBorderView touchStealerShapeLayer](self, "touchStealerShapeLayer"));
  [v32 setPath:v31];

  -[ZWDockedLensChromeBorderView bounds](self, "bounds");
  v33 = (void *)objc_claimAutoreleasedReturnValue( -[ZWDockedLensChromeBorderView outerBorderPathForCurrentDockPositionForBounds:]( self,  "outerBorderPathForCurrentDockPositionForBounds:"));
  -[ZWDockedLensChromeBorderView bounds](self, "bounds");
  v34 = (void *)objc_claimAutoreleasedReturnValue( -[ZWDockedLensChromeBorderView innerBorderPathForCurrentDockPositionForBounds:]( self,  "innerBorderPathForCurrentDockPositionForBounds:"));
  id v35 = v33;
  id v36 = [v35 CGPath];
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[ZWDockedLensChromeBorderView chromeOuterBorderLayer](self, "chromeOuterBorderLayer"));
  [v37 setPath:v36];

  id v38 = v34;
  id v39 = [v38 CGPath];
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[ZWDockedLensChromeBorderView chromeInnerBorderLayer](self, "chromeInnerBorderLayer"));
  [v40 setPath:v39];

  +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
}

- (id)innerBorderPathForCurrentDockPositionForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = objc_alloc_init(&OBJC_CLASS___UIBezierPath);
  double v9 = x + 2.0;
  double v10 = y + 2.0;
  double v11 = width + -4.0;
  double v12 = height + -4.0;
  switch(-[ZWDockedLensChromeBorderView dockPosition](self, "dockPosition"))
  {
    case 0LL:
      v43.origin.double x = v9;
      v43.origin.double y = v10;
      v43.size.double width = v11;
      v43.size.double height = v12;
      double MaxX = CGRectGetMaxX(v43);
      v44.origin.double x = v9;
      v44.origin.double y = v10;
      v44.size.double width = v11;
      v44.size.double height = v12;
      -[UIBezierPath addArcWithCenter:radius:startAngle:endAngle:clockwise:]( v8,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  1LL,  MaxX,  CGRectGetMaxY(v44),  0.0,  0.0);
      v45.origin.double x = v9;
      v45.origin.double y = v10;
      v45.size.double width = v11;
      v45.size.double height = v12;
      CGFloat v14 = CGRectGetMidX(v45) + 25.0 + 1.0;
      v46.origin.double x = v9;
      v46.origin.double y = v10;
      v46.size.double width = v11;
      v46.size.double height = v12;
      -[UIBezierPath addLineToPoint:](v8, "addLineToPoint:", v14, CGRectGetMaxY(v46));
      v47.origin.double x = v9;
      v47.origin.double y = v10;
      v47.size.double width = v11;
      v47.size.double height = v12;
      CGFloat v15 = CGRectGetMidX(v47) + 25.0 + -6.5 + 1.0;
      v48.origin.double x = v9;
      v48.origin.double y = v10;
      v48.size.double width = v11;
      v48.size.double height = v12;
      -[UIBezierPath addArcWithCenter:radius:startAngle:endAngle:clockwise:]( v8,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  0LL,  v15,  CGRectGetMaxY(v48) + 1.0,  6.5,  0.0,  -1.57079633);
      v49.origin.double x = v9;
      v49.origin.double y = v10;
      v49.size.double width = v11;
      v49.size.double height = v12;
      CGFloat v16 = CGRectGetMidX(v49) + -25.0 + 6.5 + -1.0;
      v50.origin.double x = v9;
      v50.origin.double y = v10;
      v50.size.double width = v11;
      v50.size.double height = v12;
      -[UIBezierPath addArcWithCenter:radius:startAngle:endAngle:clockwise:]( v8,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  0LL,  v16,  CGRectGetMaxY(v50) + 1.0,  6.5,  -1.57079633,  -3.14159265);
      v51.origin.double x = v9;
      v51.origin.double y = v10;
      v51.size.double width = v11;
      v51.size.double height = v12;
      CGFloat v17 = CGRectGetMidX(v51) + -25.0 + -1.0;
      v52.origin.double x = v9;
      v52.origin.double y = v10;
      v52.size.double width = v11;
      v52.size.double height = v12;
      -[UIBezierPath addLineToPoint:](v8, "addLineToPoint:", v17, CGRectGetMaxY(v52));
      v53.origin.double x = v9;
      v53.origin.double y = v10;
      v53.size.double width = v11;
      v53.size.double height = v12;
      CGFloat MinX = CGRectGetMinX(v53);
      v54.origin.double x = v9;
      v54.origin.double y = v10;
      v54.size.double width = v11;
      v54.size.double height = v12;
      double MaxY = CGRectGetMaxY(v54);
      goto LABEL_7;
    case 1LL:
      v55.origin.double x = v9;
      v55.origin.double y = v10;
      v55.size.double width = v11;
      v55.size.double height = v12;
      double v20 = CGRectGetMaxX(v55);
      v56.origin.double x = v9;
      v56.origin.double y = v10;
      v56.size.double width = v11;
      v56.size.double height = v12;
      -[UIBezierPath addArcWithCenter:radius:startAngle:endAngle:clockwise:]( v8,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  1LL,  v20,  CGRectGetMaxY(v56),  0.0,  1.57079633,  3.14159265);
      v57.origin.double x = v9;
      v57.origin.double y = v10;
      v57.size.double width = v11;
      v57.size.double height = v12;
      double v21 = CGRectGetMaxX(v57);
      v58.origin.double x = v9;
      v58.origin.double y = v10;
      v58.size.double width = v11;
      v58.size.double height = v12;
      -[UIBezierPath addLineToPoint:](v8, "addLineToPoint:", v21, CGRectGetMidY(v58) + 25.0 + 1.0);
      v59.origin.double x = v9;
      v59.origin.double y = v10;
      v59.size.double width = v11;
      v59.size.double height = v12;
      CGFloat v22 = CGRectGetMaxX(v59) + 1.0;
      v60.origin.double x = v9;
      v60.origin.double y = v10;
      v60.size.double width = v11;
      v60.size.double height = v12;
      -[UIBezierPath addArcWithCenter:radius:startAngle:endAngle:clockwise:]( v8,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  1LL,  v22,  CGRectGetMidY(v60) + 25.0 + -6.5 + 1.0,  6.5,  1.57079633,  3.14159265);
      v61.origin.double x = v9;
      v61.origin.double y = v10;
      v61.size.double width = v11;
      v61.size.double height = v12;
      CGFloat v23 = CGRectGetMaxX(v61) + 1.0;
      v62.origin.double x = v9;
      v62.origin.double y = v10;
      v62.size.double width = v11;
      v62.size.double height = v12;
      -[UIBezierPath addArcWithCenter:radius:startAngle:endAngle:clockwise:]( v8,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  1LL,  v23,  CGRectGetMidY(v62) + -25.0 + 6.5 + -1.0,  6.5,  3.14159265,  -1.57079633);
      v63.origin.double x = v9;
      v63.origin.double y = v10;
      v63.size.double width = v11;
      v63.size.double height = v12;
      double v24 = CGRectGetMaxX(v63);
      v64.origin.double x = v9;
      v64.origin.double y = v10;
      v64.size.double width = v11;
      v64.size.double height = v12;
      -[UIBezierPath addLineToPoint:](v8, "addLineToPoint:", v24, CGRectGetMidY(v64) + -25.0 + -1.0);
      v65.origin.double x = v9;
      v65.origin.double y = v10;
      v65.size.double width = v11;
      v65.size.double height = v12;
      CGFloat v25 = CGRectGetMaxX(v65);
      v66.origin.double x = v9;
      v66.origin.double y = v10;
      v66.size.double width = v11;
      v66.size.double height = v12;
      double MinY = CGRectGetMinY(v66);
      double v27 = v8;
      double v28 = v25;
      double v29 = 3.14159265;
      goto LABEL_5;
    case 2LL:
      v67.origin.double x = v9;
      v67.origin.double y = v10;
      v67.size.double width = v11;
      v67.size.double height = v12;
      double v30 = CGRectGetMinX(v67);
      v68.origin.double x = v9;
      v68.origin.double y = v10;
      v68.size.double width = v11;
      v68.size.double height = v12;
      -[UIBezierPath addArcWithCenter:radius:startAngle:endAngle:clockwise:]( v8,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  1LL,  v30,  CGRectGetMaxY(v68),  0.0,  1.57079633);
      v69.origin.double x = v9;
      v69.origin.double y = v10;
      v69.size.double width = v11;
      v69.size.double height = v12;
      double v31 = CGRectGetMinX(v69);
      v70.origin.double x = v9;
      v70.origin.double y = v10;
      v70.size.double width = v11;
      v70.size.double height = v12;
      -[UIBezierPath addLineToPoint:](v8, "addLineToPoint:", v31, CGRectGetMidY(v70) + 25.0 + 1.0);
      v71.origin.double x = v9;
      v71.origin.double y = v10;
      v71.size.double width = v11;
      v71.size.double height = v12;
      CGFloat v32 = CGRectGetMinX(v71) + -1.0;
      v72.origin.double x = v9;
      v72.origin.double y = v10;
      v72.size.double width = v11;
      v72.size.double height = v12;
      -[UIBezierPath addArcWithCenter:radius:startAngle:endAngle:clockwise:]( v8,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  0LL,  v32,  CGRectGetMidY(v72) + 25.0 + -6.5 + 1.0,  6.5,  1.57079633,  0.0);
      v73.origin.double x = v9;
      v73.origin.double y = v10;
      v73.size.double width = v11;
      v73.size.double height = v12;
      CGFloat v33 = CGRectGetMinX(v73) + -1.0;
      v74.origin.double x = v9;
      v74.origin.double y = v10;
      v74.size.double width = v11;
      v74.size.double height = v12;
      -[UIBezierPath addArcWithCenter:radius:startAngle:endAngle:clockwise:]( v8,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  0LL,  v33,  CGRectGetMidY(v74) + -25.0 + 6.5 + -1.0,  6.5,  0.0,  -1.57079633);
      v75.origin.double x = v9;
      v75.origin.double y = v10;
      v75.size.double width = v11;
      v75.size.double height = v12;
      double v34 = CGRectGetMinX(v75);
      v76.origin.double x = v9;
      v76.origin.double y = v10;
      v76.size.double width = v11;
      v76.size.double height = v12;
      -[UIBezierPath addLineToPoint:](v8, "addLineToPoint:", v34, CGRectGetMidY(v76) + -25.0 + -1.0);
      v77.origin.double x = v9;
      v77.origin.double y = v10;
      v77.size.double width = v11;
      v77.size.double height = v12;
      CGFloat v35 = CGRectGetMinX(v77);
      v78.origin.double x = v9;
      v78.origin.double y = v10;
      v78.size.double width = v11;
      v78.size.double height = v12;
      double MinY = CGRectGetMinY(v78);
      double v27 = v8;
      double v28 = v35;
      double v29 = 3.14159265;
LABEL_5:
      double v36 = -1.57079633;
      goto LABEL_8;
    case 3LL:
      v79.origin.double x = v9;
      v79.origin.double y = v10;
      v79.size.double width = v11;
      v79.size.double height = v12;
      double v37 = CGRectGetMaxX(v79);
      v80.origin.double x = v9;
      v80.origin.double y = v10;
      v80.size.double width = v11;
      v80.size.double height = v12;
      -[UIBezierPath addArcWithCenter:radius:startAngle:endAngle:clockwise:]( v8,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  1LL,  v37,  CGRectGetMinY(v80),  0.0,  0.0);
      v81.origin.double x = v9;
      v81.origin.double y = v10;
      v81.size.double width = v11;
      v81.size.double height = v12;
      CGFloat v38 = CGRectGetMidX(v81) + 25.0 + 1.0;
      v82.origin.double x = v9;
      v82.origin.double y = v10;
      v82.size.double width = v11;
      v82.size.double height = v12;
      -[UIBezierPath addLineToPoint:](v8, "addLineToPoint:", v38, CGRectGetMinY(v82));
      v83.origin.double x = v9;
      v83.origin.double y = v10;
      v83.size.double width = v11;
      v83.size.double height = v12;
      CGFloat v39 = CGRectGetMidX(v83) + 25.0 + -6.5 + 1.0;
      v84.origin.double x = v9;
      v84.origin.double y = v10;
      v84.size.double width = v11;
      v84.size.double height = v12;
      -[UIBezierPath addArcWithCenter:radius:startAngle:endAngle:clockwise:]( v8,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  0LL,  v39,  CGRectGetMinY(v84) + 1.0,  6.5,  0.0,  -1.57079633);
      v85.origin.double x = v9;
      v85.origin.double y = v10;
      v85.size.double width = v11;
      v85.size.double height = v12;
      CGFloat v40 = CGRectGetMidX(v85) + -25.0 + 6.5 + -1.0;
      v86.origin.double x = v9;
      v86.origin.double y = v10;
      v86.size.double width = v11;
      v86.size.double height = v12;
      -[UIBezierPath addArcWithCenter:radius:startAngle:endAngle:clockwise:]( v8,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  0LL,  v40,  CGRectGetMinY(v86) + 1.0,  6.5,  -1.57079633,  -3.14159265);
      v87.origin.double x = v9;
      v87.origin.double y = v10;
      v87.size.double width = v11;
      v87.size.double height = v12;
      CGFloat v41 = CGRectGetMidX(v87) + -25.0 + -1.0;
      v88.origin.double x = v9;
      v88.origin.double y = v10;
      v88.size.double width = v11;
      v88.size.double height = v12;
      -[UIBezierPath addLineToPoint:](v8, "addLineToPoint:", v41, CGRectGetMinY(v88));
      v89.origin.double x = v9;
      v89.origin.double y = v10;
      v89.size.double width = v11;
      v89.size.double height = v12;
      CGFloat MinX = CGRectGetMinX(v89);
      v90.origin.double x = v9;
      v90.origin.double y = v10;
      v90.size.double width = v11;
      v90.size.double height = v12;
      double MaxY = CGRectGetMinY(v90);
LABEL_7:
      double MinY = MaxY;
      double v36 = 3.14159265;
      double v27 = v8;
      double v28 = MinX;
      double v29 = 1.57079633;
LABEL_8:
      -[UIBezierPath addArcWithCenter:radius:startAngle:endAngle:clockwise:]( v27,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  1LL,  v28,  MinY,  0.0,  v29,  v36);
      break;
    default:
      return v8;
  }

  return v8;
}

- (id)outerBorderPathForCurrentDockPositionForBounds:(CGRect)a3
{
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  double v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPath](&OBJC_CLASS___UIBezierPath, "bezierPath"));
  switch(-[ZWDockedLensChromeBorderView dockPosition](self, "dockPosition"))
  {
    case 0LL:
      v47.origin.double x = v5;
      v47.origin.double y = v7;
      v47.size.double width = v9;
      v47.size.double height = v11;
      double MaxX = CGRectGetMaxX(v47);
      v48.origin.double x = v5;
      v48.origin.double y = v7;
      v48.size.double width = v9;
      v48.size.double height = v11;
      objc_msgSend( v12,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  1,  MaxX,  CGRectGetMaxY(v48),  0.0,  0.0,  1.57079633);
      v49.origin.double x = v5;
      v49.origin.double y = v7;
      v49.size.double width = v9;
      v49.size.double height = v11;
      CGFloat v14 = CGRectGetMidX(v49) + 25.0 + -6.0 + -1.0;
      v50.origin.double x = v5;
      v50.origin.double y = v7;
      v50.size.double width = v9;
      v50.size.double height = v11;
      objc_msgSend( v12,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  0,  v14,  CGRectGetMaxY(v50),  6.0,  0.0,  -1.57079633);
      v51.origin.double x = v5;
      v51.origin.double y = v7;
      v51.size.double width = v9;
      v51.size.double height = v11;
      CGFloat v15 = CGRectGetMidX(v51) + -25.0 + 6.0 + 1.0;
      v52.origin.double x = v5;
      v52.origin.double y = v7;
      v52.size.double width = v9;
      v52.size.double height = v11;
      objc_msgSend( v12,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  0,  v15,  CGRectGetMaxY(v52),  6.0,  -1.57079633,  1.57079633);
      v53.origin.double x = v5;
      v53.origin.double y = v7;
      v53.size.double width = v9;
      v53.size.double height = v11;
      CGFloat v16 = CGRectGetMidX(v53) + 25.0 + -6.0 + -1.0;
      v54.origin.double x = v5;
      v54.origin.double y = v7;
      v54.size.double width = v9;
      v54.size.double height = v11;
      objc_msgSend( v12,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  0,  v16,  CGRectGetMaxY(v54),  6.0,  1.57079633,  0.0);
      v55.origin.double x = v5;
      v55.origin.double y = v7;
      v55.size.double width = v9;
      v55.size.double height = v11;
      CGFloat v17 = CGRectGetMidX(v55) + 25.0 + -6.0 + -1.0;
      v56.origin.double x = v5;
      v56.origin.double y = v7;
      v56.size.double width = v9;
      v56.size.double height = v11;
      objc_msgSend( v12,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  0,  v17,  CGRectGetMaxY(v56),  6.0,  0.0,  -1.57079633);
      v57.origin.double x = v5;
      v57.origin.double y = v7;
      v57.size.double width = v9;
      v57.size.double height = v11;
      CGFloat v18 = CGRectGetMidX(v57) + -25.0 + 6.0 + 1.0;
      v58.origin.double x = v5;
      v58.origin.double y = v7;
      v58.size.double width = v9;
      v58.size.double height = v11;
      objc_msgSend( v12,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  0,  v18,  CGRectGetMaxY(v58),  6.0,  -1.57079633,  -3.14159265);
      v59.origin.double x = v5;
      v59.origin.double y = v7;
      v59.size.double width = v9;
      v59.size.double height = v11;
      CGFloat MinX = CGRectGetMinX(v59);
      v60.origin.double x = v5;
      v60.origin.double y = v7;
      v60.size.double width = v9;
      v60.size.double height = v11;
      double MaxY = CGRectGetMaxY(v60);
      goto LABEL_7;
    case 1LL:
      v61.origin.double x = v5;
      v61.origin.double y = v7;
      v61.size.double width = v9;
      v61.size.double height = v11;
      double v21 = CGRectGetMaxX(v61);
      v62.origin.double x = v5;
      v62.origin.double y = v7;
      v62.size.double width = v9;
      v62.size.double height = v11;
      objc_msgSend( v12,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  1,  v21,  CGRectGetMaxY(v62),  0.0,  1.57079633,  3.14159265);
      v63.origin.double x = v5;
      v63.origin.double y = v7;
      v63.size.double width = v9;
      v63.size.double height = v11;
      double v22 = CGRectGetMaxX(v63);
      v64.origin.double x = v5;
      v64.origin.double y = v7;
      v64.size.double width = v9;
      v64.size.double height = v11;
      objc_msgSend( v12,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  0,  v22,  CGRectGetMidY(v64) + 25.0 + -6.0 + -1.0,  6.0,  1.57079633,  0.0);
      v65.origin.double x = v5;
      v65.origin.double y = v7;
      v65.size.double width = v9;
      v65.size.double height = v11;
      double v23 = CGRectGetMaxX(v65);
      v66.origin.double x = v5;
      v66.origin.double y = v7;
      v66.size.double width = v9;
      v66.size.double height = v11;
      objc_msgSend( v12,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  0,  v23,  CGRectGetMidY(v66) + -25.0 + 6.0 + 1.0,  6.0,  0.0,  3.14159265);
      v67.origin.double x = v5;
      v67.origin.double y = v7;
      v67.size.double width = v9;
      v67.size.double height = v11;
      double v24 = CGRectGetMaxX(v67);
      v68.origin.double x = v5;
      v68.origin.double y = v7;
      v68.size.double width = v9;
      v68.size.double height = v11;
      objc_msgSend( v12,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  0,  v24,  CGRectGetMidY(v68) + 25.0 + -6.0 + -1.0,  6.0,  3.14159265,  1.57079633);
      v69.origin.double x = v5;
      v69.origin.double y = v7;
      v69.size.double width = v9;
      v69.size.double height = v11;
      double v25 = CGRectGetMaxX(v69);
      v70.origin.double x = v5;
      v70.origin.double y = v7;
      v70.size.double width = v9;
      v70.size.double height = v11;
      objc_msgSend( v12,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  0,  v25,  CGRectGetMidY(v70) + 25.0 + -6.0 + -1.0,  6.0,  1.57079633,  0.0);
      v71.origin.double x = v5;
      v71.origin.double y = v7;
      v71.size.double width = v9;
      v71.size.double height = v11;
      double v26 = CGRectGetMaxX(v71);
      v72.origin.double x = v5;
      v72.origin.double y = v7;
      v72.size.double width = v9;
      v72.size.double height = v11;
      objc_msgSend( v12,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  0,  v26,  CGRectGetMidY(v72) + -25.0 + 6.0 + 1.0,  6.0,  0.0,  -1.57079633);
      v73.origin.double x = v5;
      v73.origin.double y = v7;
      v73.size.double width = v9;
      v73.size.double height = v11;
      double v27 = CGRectGetMaxX(v73);
      goto LABEL_5;
    case 2LL:
      v74.origin.double x = v5;
      v74.origin.double y = v7;
      v74.size.double width = v9;
      v74.size.double height = v11;
      double v28 = CGRectGetMinX(v74);
      v75.origin.double x = v5;
      v75.origin.double y = v7;
      v75.size.double width = v9;
      v75.size.double height = v11;
      objc_msgSend( v12,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  1,  v28,  CGRectGetMaxY(v75),  0.0,  1.57079633,  3.14159265);
      v76.origin.double x = v5;
      v76.origin.double y = v7;
      v76.size.double width = v9;
      v76.size.double height = v11;
      double v29 = CGRectGetMinX(v76);
      v77.origin.double x = v5;
      v77.origin.double y = v7;
      v77.size.double width = v9;
      v77.size.double height = v11;
      objc_msgSend( v12,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  0,  v29,  CGRectGetMidY(v77) + 25.0 + -6.0 + -1.0,  6.0,  1.57079633,  0.0);
      v78.origin.double x = v5;
      v78.origin.double y = v7;
      v78.size.double width = v9;
      v78.size.double height = v11;
      double v30 = CGRectGetMinX(v78);
      v79.origin.double x = v5;
      v79.origin.double y = v7;
      v79.size.double width = v9;
      v79.size.double height = v11;
      objc_msgSend( v12,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  0,  v30,  CGRectGetMidY(v79) + -25.0 + 6.0 + 1.0,  6.0,  0.0,  3.14159265);
      v80.origin.double x = v5;
      v80.origin.double y = v7;
      v80.size.double width = v9;
      v80.size.double height = v11;
      double v31 = CGRectGetMinX(v80);
      v81.origin.double x = v5;
      v81.origin.double y = v7;
      v81.size.double width = v9;
      v81.size.double height = v11;
      objc_msgSend( v12,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  0,  v31,  CGRectGetMidY(v81) + 25.0 + -6.0 + -1.0,  6.0,  3.14159265,  1.57079633);
      v82.origin.double x = v5;
      v82.origin.double y = v7;
      v82.size.double width = v9;
      v82.size.double height = v11;
      double v32 = CGRectGetMinX(v82);
      v83.origin.double x = v5;
      v83.origin.double y = v7;
      v83.size.double width = v9;
      v83.size.double height = v11;
      objc_msgSend( v12,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  0,  v32,  CGRectGetMidY(v83) + 25.0 + -6.0 + -1.0,  6.0,  1.57079633,  0.0);
      v84.origin.double x = v5;
      v84.origin.double y = v7;
      v84.size.double width = v9;
      v84.size.double height = v11;
      double v33 = CGRectGetMinX(v84);
      v85.origin.double x = v5;
      v85.origin.double y = v7;
      v85.size.double width = v9;
      v85.size.double height = v11;
      objc_msgSend( v12,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  0,  v33,  CGRectGetMidY(v85) + -25.0 + 6.0 + 1.0,  6.0,  0.0,  -1.57079633);
      v86.origin.double x = v5;
      v86.origin.double y = v7;
      v86.size.double width = v9;
      v86.size.double height = v11;
      double v27 = CGRectGetMinX(v86);
LABEL_5:
      double v34 = v27;
      v87.origin.double x = v5;
      v87.origin.double y = v7;
      v87.size.double width = v9;
      v87.size.double height = v11;
      double MinY = CGRectGetMinY(v87);
      double v36 = 0.0;
      double v37 = v12;
      double v38 = v34;
      double v39 = 1.57079633;
      goto LABEL_8;
    case 3LL:
      v88.origin.double x = v5;
      v88.origin.double y = v7;
      v88.size.double width = v9;
      v88.size.double height = v11;
      double v40 = CGRectGetMaxX(v88);
      v89.origin.double x = v5;
      v89.origin.double y = v7;
      v89.size.double width = v9;
      v89.size.double height = v11;
      objc_msgSend( v12,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  1,  v40,  CGRectGetMinY(v89),  0.0,  0.0,  1.57079633);
      v90.origin.double x = v5;
      v90.origin.double y = v7;
      v90.size.double width = v9;
      v90.size.double height = v11;
      CGFloat v41 = CGRectGetMidX(v90) + 25.0 + -6.0 + -1.0;
      v91.origin.double x = v5;
      v91.origin.double y = v7;
      v91.size.double width = v9;
      v91.size.double height = v11;
      objc_msgSend( v12,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  0,  v41,  CGRectGetMinY(v91),  6.0,  0.0,  -1.57079633);
      v92.origin.double x = v5;
      v92.origin.double y = v7;
      v92.size.double width = v9;
      v92.size.double height = v11;
      CGFloat v42 = CGRectGetMidX(v92) + -25.0 + 6.0 + 1.0;
      v93.origin.double x = v5;
      v93.origin.double y = v7;
      v93.size.double width = v9;
      v93.size.double height = v11;
      objc_msgSend( v12,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  0,  v42,  CGRectGetMinY(v93),  6.0,  -1.57079633,  1.57079633);
      v94.origin.double x = v5;
      v94.origin.double y = v7;
      v94.size.double width = v9;
      v94.size.double height = v11;
      CGFloat v43 = CGRectGetMidX(v94) + 25.0 + -6.0 + -1.0;
      v95.origin.double x = v5;
      v95.origin.double y = v7;
      v95.size.double width = v9;
      v95.size.double height = v11;
      objc_msgSend( v12,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  0,  v43,  CGRectGetMinY(v95),  6.0,  1.57079633,  0.0);
      v96.origin.double x = v5;
      v96.origin.double y = v7;
      v96.size.double width = v9;
      v96.size.double height = v11;
      CGFloat v44 = CGRectGetMidX(v96) + 25.0 + -6.0 + -1.0;
      v97.origin.double x = v5;
      v97.origin.double y = v7;
      v97.size.double width = v9;
      v97.size.double height = v11;
      objc_msgSend( v12,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  0,  v44,  CGRectGetMinY(v97),  6.0,  0.0,  -1.57079633);
      v98.origin.double x = v5;
      v98.origin.double y = v7;
      v98.size.double width = v9;
      v98.size.double height = v11;
      CGFloat v45 = CGRectGetMidX(v98) + -25.0 + 6.0 + 1.0;
      v99.origin.double x = v5;
      v99.origin.double y = v7;
      v99.size.double width = v9;
      v99.size.double height = v11;
      objc_msgSend( v12,  "addArcWithCenter:radius:startAngle:endAngle:clockwise:",  0,  v45,  CGRectGetMinY(v99),  6.0,  -1.57079633,  -3.14159265);
      v100.origin.double x = v5;
      v100.origin.double y = v7;
      v100.size.double width = v9;
      v100.size.double height = v11;
      CGFloat MinX = CGRectGetMinX(v100);
      v101.origin.double x = v5;
      v101.origin.double y = v7;
      v101.size.double width = v9;
      v101.size.double height = v11;
      double MaxY = CGRectGetMinY(v101);
LABEL_7:
      double MinY = MaxY;
      double v39 = 0.0;
      double v37 = v12;
      double v38 = MinX;
      double v36 = 1.57079633;
LABEL_8:
      objc_msgSend(v37, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v38, MinY, 0.0, v39, v36);
      break;
    default:
      return v12;
  }

  return v12;
}

- (int64_t)dockPosition
{
  return self->_dockPosition;
}

- (void)setDockPosition:(int64_t)a3
{
  self->_dockPosition = a3;
}

- (CAShapeLayer)chromeOuterBorderLayer
{
  return self->_chromeOuterBorderLayer;
}

- (void)setChromeOuterBorderLayer:(id)a3
{
}

- (CAShapeLayer)chromeInnerBorderLayer
{
  return self->_chromeInnerBorderLayer;
}

- (void)setChromeInnerBorderLayer:(id)a3
{
}

- (CAShapeLayer)touchStealerShapeLayer
{
  return self->_touchStealerShapeLayer;
}

- (void)setTouchStealerShapeLayer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end