@interface ZWLensZoomView
- (BOOL)lensResizingHandlesShowing;
- (BOOL)offsetZoomWindowFromFinger;
- (BOOL)roundedLensCorners;
- (CABackdropLayer)zoomBackdropLayer;
- (CAReplicatorLayer)zoomReplicatorLayer;
- (CAShapeLayer)maskLayer;
- (CGPoint)updateZoomPanOffset:(CGPoint)a3 zoomFactor:(double)a4 roundedLensCorners:(BOOL)a5 animated:(BOOL)a6 animationDuration:(double)a7 completion:(id)a8;
- (CGPoint)zoomPanOffset;
- (CGRect)_effectiveRectForBounds:(CGRect)a3 position:(CGPoint)a4 scaleFactor:(double)a5;
- (CGRect)effectiveZoomViewFrame;
- (CGRect)sampleRect;
- (CGSize)_prescaledSizeForFinalSize:(CGSize)a3 zoomFactor:(double)a4;
- (CGSize)sampledContentSizeWithZoomFactor:(double)a3;
- (UIView)zoomView;
- (ZWLensZoomView)initWithFrame:(CGRect)a3;
- (double)zoomFactor;
- (void)animationDidStart:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)layoutSubviews;
- (void)setLensResizingHandlesShowing:(BOOL)a3;
- (void)setMaskLayer:(id)a3;
- (void)setOffsetZoomWindowFromFinger:(BOOL)a3;
- (void)setRoundedLensCorners:(BOOL)a3;
- (void)setZoomBackdropLayer:(id)a3;
- (void)setZoomFactor:(double)a3;
- (void)setZoomPanOffset:(CGPoint)a3;
- (void)setZoomReplicatorLayer:(id)a3;
- (void)setZoomView:(id)a3;
- (void)showLensResizingHandlesShowing:(BOOL)a3;
- (void)updateLensEffect:(id)a3 animated:(BOOL)a4 completion:(id)a5;
@end

@implementation ZWLensZoomView

- (ZWLensZoomView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ZWLensZoomView;
  v3 = -[ZWLensZoomView initWithFrame:](&v12, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[ZWLensZoomView setTranslatesAutoresizingMaskIntoConstraints:]( v3,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[ZWLensZoomView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    -[ZWLensZoomView setClipsToBounds:](v4, "setClipsToBounds:", 1LL);
    -[ZWLensZoomView setZoomFactor:](v4, "setZoomFactor:", AXZoomMinimumZoomLevel);
    -[ZWLensZoomView setZoomPanOffset:](v4, "setZoomPanOffset:", CGPointZero.x, CGPointZero.y);
    v6 = -[UIView initWithFrame:]( objc_alloc(&OBJC_CLASS___UIView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
    -[ZWLensZoomView setZoomView:](v4, "setZoomView:", v6);
    -[ZWLensZoomView addSubview:](v4, "addSubview:", v6);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
    id v7 = -[UIView ax_pinConstraintsInAllDimensionsToView:](v6, "ax_pinConstraintsInAllDimensionsToView:", v4);
    v8 = objc_alloc_init(&OBJC_CLASS___CAReplicatorLayer);
    -[CAReplicatorLayer setAllowsHitTesting:](v8, "setAllowsHitTesting:", 0LL);
    -[CAReplicatorLayer setInstanceCount:](v8, "setInstanceCount:", 2LL);
    -[ZWLensZoomView setZoomReplicatorLayer:](v4, "setZoomReplicatorLayer:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v6, "layer"));
    [v9 addSublayer:v8];

    v10 = objc_alloc_init(&OBJC_CLASS___CABackdropLayer);
    -[CABackdropLayer setEnabled:](v10, "setEnabled:", 1LL);
    -[CABackdropLayer setAllowsHitTesting:](v10, "setAllowsHitTesting:", 1LL);
    -[ZWLensZoomView setZoomBackdropLayer:](v4, "setZoomBackdropLayer:", v10);
    -[CAReplicatorLayer addSublayer:](v8, "addSublayer:", v10);
  }

  return v4;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ZWLensZoomView;
  -[ZWLensZoomView layoutSubviews](&v8, "layoutSubviews");
  -[ZWLensZoomView zoomPanOffset](self, "zoomPanOffset");
  double v4 = v3;
  double v6 = v5;
  -[ZWLensZoomView zoomFactor](self, "zoomFactor");
  -[ZWLensZoomView updateZoomPanOffset:zoomFactor:roundedLensCorners:animated:animationDuration:completion:]( self,  "updateZoomPanOffset:zoomFactor:roundedLensCorners:animated:animationDuration:completion:",  -[ZWLensZoomView roundedLensCorners](self, "roundedLensCorners"),  0LL,  0LL,  v4,  v6,  v7,  -1.0);
}

- (CGSize)sampledContentSizeWithZoomFactor:(double)a3
{
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)showLensResizingHandlesShowing:(BOOL)a3
{
}

- (CGRect)effectiveZoomViewFrame
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensZoomView zoomReplicatorLayer](self, "zoomReplicatorLayer"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensZoomView zoomReplicatorLayer](self, "zoomReplicatorLayer"));
  [v12 position];
  double v14 = v13;
  double v16 = v15;

  -[ZWLensZoomView _effectiveRectForBounds:position:scaleFactor:]( self,  "_effectiveRectForBounds:position:scaleFactor:",  v5,  v7,  v9,  v11,  v14,  v16,  1.0);
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)animationDidStart:(id)a3
{
  double v4 = ZOTMainScreenSize(self, a2);
  double v7 = ZOTMainScreenSize(v5, v6);
  if (v4 < v8) {
    double v4 = v8;
  }
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[ZWLensZoomView zoomBackdropLayer](self, "zoomBackdropLayer", v7));
  [v9 setMarginWidth:v4];
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensZoomView zoomBackdropLayer](self, "zoomBackdropLayer", a3, a4));
  [v5 setMarginWidth:0.0];

  if (-[ZWLensZoomView roundedLensCorners](self, "roundedLensCorners"))
  {
    -[ZWLensZoomView zoomFactor](self, "zoomFactor");
    CGFloat v7 = 1.0 / v6;
    -[ZWLensZoomView zoomFactor](self, "zoomFactor");
    CGAffineTransformMakeScale(&m, v7, 1.0 / v8);
    CATransform3DMakeAffineTransform(&v13, &m);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensZoomView maskLayer](self, "maskLayer"));
    CATransform3D v11 = v13;
    [v9 setTransform:&v11];
  }

  else
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue(-[ZWLensZoomView layer](self, "layer"));
    [v10 setCornerRadius:0.0];
  }

- (CGPoint)updateZoomPanOffset:(CGPoint)a3 zoomFactor:(double)a4 roundedLensCorners:(BOOL)a5 animated:(BOOL)a6 animationDuration:(double)a7 completion:(id)a8
{
  BOOL v9 = a6;
  BOOL v10 = a5;
  double y = a3.y;
  double x = a3.x;
  double v15 = (void (**)(void))a8;
  -[ZWLensZoomView zoomFactor](self, "zoomFactor");
  uint64_t v17 = v16;
  -[ZWLensZoomView setZoomFactor:](self, "setZoomFactor:", a4);
  -[ZWLensZoomView setZoomPanOffset:](self, "setZoomPanOffset:", x, y);
  -[ZWLensZoomView setRoundedLensCorners:](self, "setRoundedLensCorners:", v10);
  -[ZWLensZoomView bounds](self, "bounds");
  if (CGRectIsEmpty(v195))
  {
    if (v15) {
      v15[2](v15);
    }
    CGFloat v18 = CGPointZero.x;
    CGFloat v19 = CGPointZero.y;
    goto LABEL_65;
  }

  BOOL v20 = vabdd_f64(a4, AXZoomMinimumZoomLevel) <= 0.0001;
  char v21 = AXZoomMinimumZoomLevel >= a4 || v20;
  v191[0] = _NSConcreteStackBlock;
  v191[1] = 3221225472LL;
  v191[2] = __106__ZWLensZoomView_updateZoomPanOffset_zoomFactor_roundedLensCorners_animated_animationDuration_completion___block_invoke;
  v191[3] = &unk_6CE40;
  v191[4] = self;
  char v193 = v21;
  v192 = v15;
  v22 = objc_retainBlock(v191);
  v23 = v22;
  if (!v9)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensZoomView zoomReplicatorLayer](self, "zoomReplicatorLayer"));
    [v24 removeAllAnimations];

    v23 = 0LL;
  }

  double v164 = a7;
  +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin", v17);
  +[CATransaction setDisableActions:](&OBJC_CLASS___CATransaction, "setDisableActions:", 1LL);
  +[CATransaction setCompletionBlock:](&OBJC_CLASS___CATransaction, "setCompletionBlock:", v23);
  if ((v21 & 1) == 0)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensZoomView zoomBackdropLayer](self, "zoomBackdropLayer"));
    [v25 setEnabled:1];
  }

  -[ZWLensZoomView zoomPanOffset](self, "zoomPanOffset");
  double v27 = v26;
  double v29 = v28;
  -[ZWLensZoomView bounds](self, "bounds");
  double v179 = v31;
  double v180 = v30;
  double v177 = v33;
  double v178 = v32;
  -[ZWLensZoomView zw_boundsCenter](self, "zw_boundsCenter");
  double v35 = v34;
  double v37 = v36;
  -[ZWLensZoomView bounds](self, "bounds");
  double v39 = v38;
  double v41 = v40;
  -[ZWLensZoomView zoomFactor](self, "zoomFactor");
  -[ZWLensZoomView _prescaledSizeForFinalSize:zoomFactor:]( self,  "_prescaledSizeForFinalSize:zoomFactor:",  v39,  v41,  v42);
  double v44 = v43;
  double v46 = v45;
  double v167 = v37;
  double v168 = v35;
  double v47 = v27 + v35;
  -[ZWLensZoomView bounds](self, "bounds");
  double v49 = v48 * 0.5 - ZWZoomEdgeSlackAmount();
  if (-[ZWLensZoomView offsetZoomWindowFromFinger](self, "offsetZoomWindowFromFinger")) {
    double v50 = v49;
  }
  else {
    double v50 = -0.0;
  }
  double v51 = 0.0;
  double v165 = v46;
  double v166 = v44;
  -[ZWLensZoomView _effectiveRectForBounds:position:scaleFactor:]( self,  "_effectiveRectForBounds:position:scaleFactor:",  0.0,  0.0,  v44,  v46,  v47,  v29 + v37 + v50,  1.0);
  double v56 = fabs(v52);
  if (v52 >= v180) {
    double v56 = -0.0;
  }
  double v57 = v27 + v56;
  double v58 = v52 + v54;
  if (v58 <= v178) {
    double v59 = 0.0;
  }
  else {
    double v59 = v58 - v178;
  }
  double v60 = v57 - v59;
  double v61 = fabs(v53);
  if (v53 >= v179) {
    double v61 = -0.0;
  }
  double v62 = v29 + v61;
  double v63 = v53 + v55;
  if (v63 <= v177) {
    double v64 = 0.0;
  }
  else {
    double v64 = v63 - v177;
  }
  double v65 = v62 - v64;
  if (-[ZWLensZoomView offsetZoomWindowFromFinger](self, "offsetZoomWindowFromFinger")) {
    double v66 = v49;
  }
  else {
    double v66 = -0.0;
  }
  __int128 v175 = *(_OWORD *)&CATransform3DIdentity.m33;
  __int128 v176 = *(_OWORD *)&CATransform3DIdentity.m31;
  *(_OWORD *)&v190.m31 = v176;
  *(_OWORD *)&v190.m33 = v175;
  __int128 v173 = *(_OWORD *)&CATransform3DIdentity.m43;
  __int128 v174 = *(_OWORD *)&CATransform3DIdentity.m41;
  *(_OWORD *)&v190.m41 = v174;
  *(_OWORD *)&v190.m43 = v173;
  __int128 v171 = *(_OWORD *)&CATransform3DIdentity.m13;
  __int128 v172 = *(_OWORD *)&CATransform3DIdentity.m11;
  *(_OWORD *)&v190.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
  *(_OWORD *)&v190.m13 = v171;
  __int128 v169 = *(_OWORD *)&CATransform3DIdentity.m23;
  __int128 v170 = *(_OWORD *)&CATransform3DIdentity.m21;
  *(_OWORD *)&v190.m21 = v170;
  *(_OWORD *)&v190.m23 = v169;
  if (-[ZWLensZoomView offsetZoomWindowFromFinger](self, "offsetZoomWindowFromFinger")) {
    double v67 = v49;
  }
  else {
    double v67 = -0.0;
  }
  double v68 = v65;
  *(_OWORD *)&v189.m31 = v176;
  *(_OWORD *)&v189.m33 = v175;
  *(_OWORD *)&v189.m41 = v174;
  *(_OWORD *)&v189.m43 = v173;
  *(_OWORD *)&v189.m11 = v172;
  *(_OWORD *)&v189.m13 = v171;
  *(_OWORD *)&v189.m21 = v170;
  *(_OWORD *)&v189.m23 = v169;
  CATransform3DTranslate(&v190, &v189, -v60, -(v67 + v65), 0.0);
  -[ZWLensZoomView zoomFactor](self, "zoomFactor");
  CGFloat v70 = v69;
  -[ZWLensZoomView zoomFactor](self, "zoomFactor");
  CATransform3D v188 = v190;
  CATransform3DScale(&v189, &v188, v70, v71, 1.0);
  CATransform3D v190 = v189;
  if (v10) {
    double v51 = ZWLensCornerRadius();
  }
  if (!v9 || v51 != 0.0)
  {
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensZoomView layer](self, "layer"));
    [v72 setCornerRadius:v51];
  }

  double v73 = v168 + v60;
  double v74 = v66 + v167 + v68;
  if (v9)
  {
    double v75 = v164;
    if (v164 <= 0.0) {
      double v75 = ZWDefaultZoomAnimationDuration();
    }
    v76 = (void *)objc_claimAutoreleasedReturnValue( +[CABasicAnimation animationWithKeyPath:]( &OBJC_CLASS___CABasicAnimation,  "animationWithKeyPath:",  @"instanceTransform"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensZoomView zoomReplicatorLayer](self, "zoomReplicatorLayer"));
    v78 = v77;
    if (v77) {
      [v77 instanceTransform];
    }
    else {
      memset(v187, 0, sizeof(v187));
    }
    v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCATransform3D:](&OBJC_CLASS___NSValue, "valueWithCATransform3D:", v187));
    [v76 setFromValue:v79];

    CATransform3D v189 = v190;
    v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCATransform3D:](&OBJC_CLASS___NSValue, "valueWithCATransform3D:", &v189));
    [v76 setToValue:v80];

    [v76 setDuration:v75];
    [v76 setDelegate:self];
    [v76 setCumulative:1];
    v81 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensZoomView zoomReplicatorLayer](self, "zoomReplicatorLayer"));
    [v81 addAnimation:v76 forKey:@"RepInstanceTransform"];

    -[ZWLensZoomView zoomFactor](self, "zoomFactor");
    if (v82 >= v163)
    {
      -[ZWLensZoomView zoomFactor](self, "zoomFactor");
      if (v88 != v163) {
        goto LABEL_49;
      }
      v89 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensZoomView zoomReplicatorLayer](self, "zoomReplicatorLayer"));
      [v89 position];
      double v91 = v90;
      double v93 = v92;

      if (v91 == v73 && v93 == v74) {
        goto LABEL_49;
      }
      usleep(0x3E8u);
      v83 = (void *)objc_claimAutoreleasedReturnValue( +[CABasicAnimation animationWithKeyPath:]( &OBJC_CLASS___CABasicAnimation,  "animationWithKeyPath:",  @"position"));
      v94 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensZoomView zoomReplicatorLayer](self, "zoomReplicatorLayer"));
      [v94 position];
      v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](&OBJC_CLASS___NSValue, "valueWithCGPoint:"));
      [v83 setFromValue:v95];

      v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](&OBJC_CLASS___NSValue, "valueWithCGPoint:", v73, v74));
      [v83 setToValue:v96];
    }

    else
    {
      v83 = (void *)objc_claimAutoreleasedReturnValue( +[CABasicAnimation animationWithKeyPath:]( &OBJC_CLASS___CABasicAnimation,  "animationWithKeyPath:",  @"position"));
      v84 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensZoomView zoomReplicatorLayer](self, "zoomReplicatorLayer"));
      [v84 position];
      v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](&OBJC_CLASS___NSValue, "valueWithCGPoint:"));
      [v83 setFromValue:v85];

      v86 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensZoomView zoomReplicatorLayer](self, "zoomReplicatorLayer"));
      [v86 position];
      v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](&OBJC_CLASS___NSValue, "valueWithCGPoint:"));
      [v83 setToValue:v87];
    }

    [v83 setDuration:v75];
    v97 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensZoomView zoomReplicatorLayer](self, "zoomReplicatorLayer"));
    [v97 addAnimation:v83 forKey:@"RepPosition"];

LABEL_49:
  }

  double v98 = fabs(v74);
  if (fabs(v73) != INFINITY && v98 != INFINITY)
  {
    v196.origin.double x = 0.0;
    v196.origin.double y = 0.0;
    v196.size.height = v165;
    v196.size.width = v166;
    if (!CGRectIsEmpty(v196))
    {
      v100 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensZoomView zoomReplicatorLayer](self, "zoomReplicatorLayer"));
      objc_msgSend(v100, "setPosition:", v73, v74);

      v101 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensZoomView zoomReplicatorLayer](self, "zoomReplicatorLayer"));
      objc_msgSend(v101, "setBounds:", 0.0, 0.0, v166, v165);

      v102 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensZoomView zoomBackdropLayer](self, "zoomBackdropLayer"));
      objc_msgSend(v102, "setBounds:", 0.0, 0.0, v166, v165);

      v197.origin.double x = 0.0;
      v197.origin.double y = 0.0;
      v197.size.width = v166;
      v197.size.height = v165;
      double MidX = CGRectGetMidX(v197);
      v198.origin.double x = 0.0;
      v198.origin.double y = 0.0;
      v198.size.width = v166;
      v198.size.height = v165;
      double MidY = CGRectGetMidY(v198);
      v105 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensZoomView zoomBackdropLayer](self, "zoomBackdropLayer"));
      objc_msgSend(v105, "setPosition:", MidX, MidY);

      CATransform3D v186 = v190;
      v106 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensZoomView zoomReplicatorLayer](self, "zoomReplicatorLayer"));
      CATransform3D v185 = v186;
      [v106 setInstanceTransform:&v185];
    }
  }

  if (v10)
  {
    v107 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensZoomView maskLayer](self, "maskLayer"));
    v108 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensZoomView zoomBackdropLayer](self, "zoomBackdropLayer"));
    [v108 setMask:v107];

    v109 = ZWInnerLensBorderForBounds( -[ZWLensZoomView lensResizingHandlesShowing](self, "lensResizingHandlesShowing"),  v180,  v179,  v178,  v177);
    id v110 = objc_claimAutoreleasedReturnValue(v109);
    id v111 = [v110 CGPath];
    v112 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensZoomView maskLayer](self, "maskLayer"));
    [v112 setPath:v111];

    id v113 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    id v114 = [v113 CGColor];
    v115 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensZoomView maskLayer](self, "maskLayer"));
    [v115 setFillColor:v114];

    id v116 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    id v117 = [v116 CGColor];
    v118 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensZoomView maskLayer](self, "maskLayer"));
    [v118 setStrokeColor:v117];

    double v119 = ZWLensInnerBorderWidth();
    v120 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensZoomView maskLayer](self, "maskLayer"));
    [v120 setLineWidth:v119];

    id v121 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    id v122 = [v121 CGColor];
    v123 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensZoomView maskLayer](self, "maskLayer"));
    [v123 setBackgroundColor:v122];

    v124 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensZoomView zoomBackdropLayer](self, "zoomBackdropLayer"));
    [v124 position];
    double v126 = v125;
    double v128 = v127;
    v129 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensZoomView maskLayer](self, "maskLayer"));
    objc_msgSend(v129, "setPosition:", v126, v128);

    v130 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensZoomView layer](self, "layer"));
    [v130 bounds];
    double v132 = v131;
    double v134 = v133;
    double v136 = v135;
    double v138 = v137;
    v139 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensZoomView maskLayer](self, "maskLayer"));
    objc_msgSend(v139, "setBounds:", v132, v134, v136, v138);

    if (v9)
    {
      v140 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensZoomView maskLayer](self, "maskLayer"));
      id v141 = v140;
      v184[4] = v176;
      v184[5] = v175;
      v184[6] = v174;
      v184[7] = v173;
      v184[0] = v172;
      v184[1] = v171;
      v184[2] = v170;
      v184[3] = v169;
      v142 = (CATransform3D *)v184;
    }

    else
    {
      -[ZWLensZoomView zoomFactor](self, "zoomFactor");
      CGFloat v157 = 1.0 / v156;
      -[ZWLensZoomView zoomFactor](self, "zoomFactor");
      CGAffineTransformMakeScale(&m, v157, 1.0 / v158);
      CATransform3DMakeAffineTransform(&v183, &m);
      v140 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensZoomView maskLayer](self, "maskLayer"));
      id v141 = v140;
      CATransform3D v181 = v183;
      v142 = &v181;
    }

    [v140 setTransform:v142];
  }

  else
  {
    v143 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensZoomView zoomBackdropLayer](self, "zoomBackdropLayer"));
    [v143 setMask:0];

    v144 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensZoomView layer](self, "layer"));
    [v144 bounds];
    double v146 = v145;
    double v148 = v147;
    double v150 = v149;
    double v152 = v151;
    v153 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensZoomView maskLayer](self, "maskLayer"));
    objc_msgSend(v153, "setFrame:", v146, v148, v150, v152);

    id v141 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    id v154 = [v141 CGColor];
    v155 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensZoomView maskLayer](self, "maskLayer"));
    [v155 setBackgroundColor:v154];
  }

  -[ZWLensZoomView setZoomPanOffset:](self, "setZoomPanOffset:", v60, v68);
  +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
  if (!v9) {
    ((void (*)(void *))v22[2])(v22);
  }
  -[ZWLensZoomView zoomPanOffset](self, "zoomPanOffset");
  CGFloat v18 = v159;
  CGFloat v19 = v160;

LABEL_65:
  double v161 = v18;
  double v162 = v19;
  result.double y = v162;
  result.double x = v161;
  return result;
}

uint64_t __106__ZWLensZoomView_updateZoomPanOffset_zoomFactor_roundedLensCorners_animated_animationDuration_completion___block_invoke( uint64_t a1)
{
  BOOL v2 = *(_BYTE *)(a1 + 48) == 0;
  double v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) zoomBackdropLayer]);
  [v3 setEnabled:v2];

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (CGRect)sampleRect
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensZoomView zoomReplicatorLayer](self, "zoomReplicatorLayer"));
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  [v2 position];
  double v8 = v7;
  [v2 bounds];
  double v10 = v8 - v9 * 0.5;
  [v2 position];
  double v12 = v11;
  [v2 bounds];
  double v14 = v12 - v13 * 0.5;

  double v15 = v10;
  double v16 = v14;
  double v17 = v4;
  double v18 = v6;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (void)updateLensEffect:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  if (a5) {
    (*((void (**)(id))a5 + 2))(a5);
  }
}

- (CGSize)_prescaledSizeForFinalSize:(CGSize)a3 zoomFactor:(double)a4
{
  double v4 = a3.width / a4;
  double v5 = a3.height / a4;
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGRect)_effectiveRectForBounds:(CGRect)a3 position:(CGPoint)a4 scaleFactor:(double)a5
{
  double v5 = a3.size.width * a5;
  double v6 = a3.size.height * a5;
  double v7 = a4.x - v5 * 0.5;
  double v8 = a4.y - v6 * 0.5;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.double y = v8;
  result.origin.double x = v7;
  return result;
}

- (UIView)zoomView
{
  return self->_zoomView;
}

- (void)setZoomView:(id)a3
{
}

- (CAReplicatorLayer)zoomReplicatorLayer
{
  return self->_zoomReplicatorLayer;
}

- (void)setZoomReplicatorLayer:(id)a3
{
}

- (CABackdropLayer)zoomBackdropLayer
{
  return self->_zoomBackdropLayer;
}

- (void)setZoomBackdropLayer:(id)a3
{
}

- (CGPoint)zoomPanOffset
{
  double x = self->_zoomPanOffset.x;
  double y = self->_zoomPanOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setZoomPanOffset:(CGPoint)a3
{
  self->_zoomPanOffset = a3;
}

- (BOOL)offsetZoomWindowFromFinger
{
  return self->_offsetZoomWindowFromFinger;
}

- (void)setOffsetZoomWindowFromFinger:(BOOL)a3
{
  self->_offsetZoomWindowFromFinger = a3;
}

- (CAShapeLayer)maskLayer
{
  return self->_maskLayer;
}

- (void)setMaskLayer:(id)a3
{
}

- (double)zoomFactor
{
  return self->_zoomFactor;
}

- (void)setZoomFactor:(double)a3
{
  self->_zoomFactor = a3;
}

- (BOOL)roundedLensCorners
{
  return self->_roundedLensCorners;
}

- (void)setRoundedLensCorners:(BOOL)a3
{
  self->_roundedLensCorners = a3;
}

- (BOOL)lensResizingHandlesShowing
{
  return self->_lensResizingHandlesShowing;
}

- (void)setLensResizingHandlesShowing:(BOOL)a3
{
  self->_lensResizingHandlesShowing = a3;
}

- (void).cxx_destruct
{
}

@end