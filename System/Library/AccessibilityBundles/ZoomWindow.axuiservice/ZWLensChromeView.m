@interface ZWLensChromeView
- (BOOL)isAccessibilityElement;
- (BOOL)showingResizeHandles;
- (CALayer)backdropLayer;
- (CALayer)grabberOverlayLayer;
- (CAShapeLayer)backdropGrabberMaskLayer;
- (CAShapeLayer)backdropMaskShapeLayer;
- (CAShapeLayer)backdropResizingMaskLayer;
- (CAShapeLayer)chromeInnerBorderLayer;
- (CAShapeLayer)chromeOuterBorderLayer;
- (CAShapeLayer)lensResizingHandlesLayer;
- (CAShapeLayer)touchStealerShapeLayer;
- (CGRect)previousResizeBounds;
- (NSArray)resizeElements;
- (ZWLensChromeView)initWithFrame:(CGRect)a3;
- (id)accessibilityElements;
- (void)layoutSubviews;
- (void)setBackdropGrabberMaskLayer:(id)a3;
- (void)setBackdropLayer:(id)a3;
- (void)setBackdropMaskShapeLayer:(id)a3;
- (void)setBackdropResizingMaskLayer:(id)a3;
- (void)setChromeInnerBorderLayer:(id)a3;
- (void)setChromeOuterBorderLayer:(id)a3;
- (void)setGrabberOverlayLayer:(id)a3;
- (void)setLensResizingHandlesLayer:(id)a3;
- (void)setPreviousResizeBounds:(CGRect)a3;
- (void)setResizeElements:(id)a3;
- (void)setShowingResizeHandles:(BOOL)a3;
- (void)setTouchStealerShapeLayer:(id)a3;
- (void)showLensResizingHandles:(BOOL)a3 animated:(BOOL)a4;
- (void)updateChromeVisibility:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
@end

@implementation ZWLensChromeView

- (ZWLensChromeView)initWithFrame:(CGRect)a3
{
  v60.receiver = self;
  v60.super_class = (Class)&OBJC_CLASS___ZWLensChromeView;
  v3 = -[ZWLensChromeView initWithFrame:]( &v60,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (CABackdropLayer *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView layer](v3, "layer"));
    if (ZWEnableLensEyeCandy() && ZWUseVibrantBlendModes())
    {
      v6 = objc_alloc_init(&OBJC_CLASS___CABackdropLayer);
      -[CABackdropLayer setEnabled:](v6, "setEnabled:", 1LL);
      -[CABackdropLayer setAllowsHitTesting:](v6, "setAllowsHitTesting:", 0LL);
      -[CABackdropLayer setMarginWidth:](v6, "setMarginWidth:", 12.0);
      -[CABackdropLayer setMasksToBounds:](v6, "setMasksToBounds:", 0LL);
      -[ZWLensChromeView setBackdropLayer:](v4, "setBackdropLayer:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView layer](v4, "layer"));
      [v7 addSublayer:v6];

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[CALayer layer](&OBJC_CLASS___CALayer, "layer"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView backdropLayer](v4, "backdropLayer"));
      [v9 setMask:v8];

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](&OBJC_CLASS___CAShapeLayer, "layer"));
      -[ZWLensChromeView setBackdropMaskShapeLayer:](v4, "setBackdropMaskShapeLayer:", v10);

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](&OBJC_CLASS___CAShapeLayer, "layer"));
      -[ZWLensChromeView setBackdropResizingMaskLayer:](v4, "setBackdropResizingMaskLayer:", v11);

      id v12 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
      id v13 = [v12 CGColor];
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView backdropResizingMaskLayer](v4, "backdropResizingMaskLayer"));
      [v14 setBackgroundColor:v13];

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView backdropResizingMaskLayer](v4, "backdropResizingMaskLayer"));
      LODWORD(v16) = 0;
      [v15 setOpacity:v16];

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](&OBJC_CLASS___CAShapeLayer, "layer"));
      -[ZWLensChromeView setBackdropGrabberMaskLayer:](v4, "setBackdropGrabberMaskLayer:", v17);

      id v18 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
      id v19 = [v18 CGColor];
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView backdropGrabberMaskLayer](v4, "backdropGrabberMaskLayer"));
      [v20 setBackgroundColor:v19];

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView backdropGrabberMaskLayer](v4, "backdropGrabberMaskLayer"));
      [v21 setCornerRadius:5.0];

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView backdropLayer](v4, "backdropLayer"));
      v23 = (void *)objc_claimAutoreleasedReturnValue([v22 mask]);
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView backdropMaskShapeLayer](v4, "backdropMaskShapeLayer"));
      [v23 addSublayer:v24];

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView backdropLayer](v4, "backdropLayer"));
      v26 = (void *)objc_claimAutoreleasedReturnValue([v25 mask]);
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView backdropGrabberMaskLayer](v4, "backdropGrabberMaskLayer"));
      [v26 addSublayer:v27];

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView backdropLayer](v4, "backdropLayer"));
      v29 = (void *)objc_claimAutoreleasedReturnValue([v28 mask]);
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView backdropResizingMaskLayer](v4, "backdropResizingMaskLayer"));
      [v29 addSublayer:v30];

      v5 = v6;
    }

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](&OBJC_CLASS___CAShapeLayer, "layer"));
    -[ZWLensChromeView setChromeInnerBorderLayer:](v4, "setChromeInnerBorderLayer:", v31);
    -[CABackdropLayer addSublayer:](v5, "addSublayer:", v31);
    id v32 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    objc_msgSend(v31, "setFillColor:", objc_msgSend(v32, "CGColor"));

    id v33 = ZWLensInnerColor();
    id v34 = objc_claimAutoreleasedReturnValue(v33);
    objc_msgSend(v31, "setStrokeColor:", objc_msgSend(v34, "CGColor"));

    [v31 setLineWidth:ZWLensInnerBorderWidth()];
    uint64_t v35 = kCAFilterPlusL;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterPlusL));
    [v31 setCompositingFilter:v36];

    v37 = objc_alloc_init(&OBJC_CLASS___CALayer);
    id v38 = ZWLensInnerColor();
    id v39 = objc_claimAutoreleasedReturnValue(v38);
    -[CALayer setBackgroundColor:](v37, "setBackgroundColor:", [v39 CGColor]);

    -[CALayer setMasksToBounds:](v37, "setMasksToBounds:", 1LL);
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", v35));
    -[CALayer setCompositingFilter:](v37, "setCompositingFilter:", v40);

    -[ZWLensChromeView setGrabberOverlayLayer:](v4, "setGrabberOverlayLayer:", v37);
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView grabberOverlayLayer](v4, "grabberOverlayLayer"));
    [v41 setCornerRadius:5.0];

    -[CABackdropLayer addSublayer:](v5, "addSublayer:", v37);
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](&OBJC_CLASS___CAShapeLayer, "layer"));
    -[ZWLensChromeView setChromeOuterBorderLayer:](v4, "setChromeOuterBorderLayer:", v42);
    -[CABackdropLayer addSublayer:](v5, "addSublayer:", v42);
    id v43 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    objc_msgSend(v42, "setFillColor:", objc_msgSend(v43, "CGColor"));

    id v44 = ZWLensOuterColor();
    id v45 = objc_claimAutoreleasedReturnValue(v44);
    objc_msgSend(v42, "setStrokeColor:", objc_msgSend(v45, "CGColor"));

    [v42 setLineWidth:ZWLensOuterBorderWidth()];
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterPlusD));
    [v42 setCompositingFilter:v46];

    v47 = (void *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](&OBJC_CLASS___CAShapeLayer, "layer"));
    -[ZWLensChromeView setLensResizingHandlesLayer:](v4, "setLensResizingHandlesLayer:", v47);
    LODWORD(v48) = 0;
    [v47 setOpacity:v48];
    id v49 = ZWLensInnerColor();
    id v50 = objc_claimAutoreleasedReturnValue(v49);
    objc_msgSend(v47, "setFillColor:", objc_msgSend(v50, "CGColor"));

    v51 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", v35));
    [v47 setCompositingFilter:v51];

    v52 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView layer](v4, "layer"));
    [v52 addSublayer:v47];

    v53 = (void *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](&OBJC_CLASS___CAShapeLayer, "layer"));
    -[ZWLensChromeView setTouchStealerShapeLayer:](v4, "setTouchStealerShapeLayer:", v53);
    LODWORD(v54) = 1.0;
    [v53 setOpacity:v54];
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    id v56 = objc_claimAutoreleasedReturnValue([v55 colorWithAlphaComponent:0.00392156863]);
    objc_msgSend(v53, "setStrokeColor:", objc_msgSend(v56, "CGColor"));

    id v57 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    objc_msgSend(v53, "setFillColor:", objc_msgSend(v57, "CGColor"));

    [v53 setLineWidth:ZWZoomLensBorderThicknessForTouches()];
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView layer](v4, "layer"));
    [v58 addSublayer:v53];
  }

  return v4;
}

- (void)layoutSubviews
{
  v148.receiver = self;
  v148.super_class = (Class)&OBJC_CLASS___ZWLensChromeView;
  -[ZWLensChromeView layoutSubviews](&v148, "layoutSubviews");
  +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
  +[CATransaction setDisableActions:](&OBJC_CLASS___CATransaction, "setDisableActions:", 1LL);
  -[ZWLensChromeView bounds](self, "bounds");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView chromeInnerBorderLayer](self, "chromeInnerBorderLayer"));
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[ZWLensChromeView bounds](self, "bounds");
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView chromeOuterBorderLayer](self, "chromeOuterBorderLayer"));
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

  -[ZWLensChromeView bounds](self, "bounds");
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView lensResizingHandlesLayer](self, "lensResizingHandlesLayer"));
  objc_msgSend(v29, "setFrame:", v22, v24, v26, v28);

  -[ZWLensChromeView bounds](self, "bounds");
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  id v38 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView backdropLayer](self, "backdropLayer"));
  id v39 = (void *)objc_claimAutoreleasedReturnValue([v38 mask]);
  objc_msgSend(v39, "setFrame:", v31, v33, v35, v37);

  -[ZWLensChromeView bounds](self, "bounds");
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;
  double v47 = v46;
  double v48 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView backdropResizingMaskLayer](self, "backdropResizingMaskLayer"));
  objc_msgSend(v48, "setFrame:", v41, v43, v45, v47);

  -[ZWLensChromeView bounds](self, "bounds");
  double v50 = v49;
  double v52 = v51;
  double v54 = v53;
  double v56 = v55;
  id v57 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView backdropMaskShapeLayer](self, "backdropMaskShapeLayer"));
  objc_msgSend(v57, "setFrame:", v50, v52, v54, v56);

  -[ZWLensChromeView bounds](self, "bounds");
  double v59 = v58;
  double v61 = v60;
  double v63 = v62;
  double v65 = v64;
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView touchStealerShapeLayer](self, "touchStealerShapeLayer"));
  objc_msgSend(v66, "setFrame:", v59, v61, v63, v65);

  -[ZWLensChromeView bounds](self, "bounds");
  id v67 = objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithRect:]( &OBJC_CLASS___UIBezierPath, "bezierPathWithRect:"));
  id v68 = [v67 CGPath];
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView touchStealerShapeLayer](self, "touchStealerShapeLayer"));
  [v69 setPath:v68];

  -[ZWLensChromeView bounds](self, "bounds");
  id v74 = ZWOuterLensBorderForBounds( -[ZWLensChromeView showingResizeHandles](self, "showingResizeHandles"),  v70,  v71,  v72,  v73);
  v75 = (void *)objc_claimAutoreleasedReturnValue(v74);
  -[ZWLensChromeView bounds](self, "bounds");
  v80 = ZWInnerLensBorderForBounds( -[ZWLensChromeView showingResizeHandles](self, "showingResizeHandles"),  v76,  v77,  v78,  v79);
  v81 = (void *)objc_claimAutoreleasedReturnValue(v80);
  id v82 = v75;
  id v83 = [v82 CGPath];
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView chromeOuterBorderLayer](self, "chromeOuterBorderLayer"));
  [v84 setPath:v83];

  id v85 = v81;
  id v86 = [v85 CGPath];
  v87 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView chromeInnerBorderLayer](self, "chromeInnerBorderLayer"));
  [v87 setPath:v86];

  -[ZWLensChromeView bounds](self, "bounds");
  CGFloat v88 = CGRectGetMidX(v149) + -23.0;
  -[ZWLensChromeView bounds](self, "bounds");
  CGFloat v89 = CGRectGetMaxY(v150) + -5.0;
  v90 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView grabberOverlayLayer](self, "grabberOverlayLayer"));
  objc_msgSend(v90, "setFrame:", v88, v89, 46.0, 10.0);

  v91 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView grabberOverlayLayer](self, "grabberOverlayLayer"));
  [v91 frame];
  double v93 = v92;
  double v95 = v94;
  double v97 = v96;
  double v99 = v98;
  v100 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView backdropGrabberMaskLayer](self, "backdropGrabberMaskLayer"));
  objc_msgSend(v100, "setFrame:", v93, v95, v97, v99);

  -[ZWLensChromeView bounds](self, "bounds");
  double v102 = v101;
  double v104 = v103;
  double v106 = v105;
  double v108 = v107;
  v109 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView backdropLayer](self, "backdropLayer"));
  objc_msgSend(v109, "setFrame:", v102, v104, v106, v108);

  -[ZWLensChromeView bounds](self, "bounds");
  v114 = ZWResizeGrabberPath(v110, v111, v112, v113);
  id v115 = objc_claimAutoreleasedReturnValue(v114);
  id v116 = [v115 CGPath];
  v117 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView lensResizingHandlesLayer](self, "lensResizingHandlesLayer"));
  [v117 setPath:v116];

  -[ZWLensChromeView bounds](self, "bounds");
  v122 = ZWResizeGrabberPath(v118, v119, v120, v121);
  id v123 = objc_claimAutoreleasedReturnValue(v122);
  id v124 = [v123 CGPath];
  v125 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView backdropResizingMaskLayer](self, "backdropResizingMaskLayer"));
  [v125 setPath:v124];

  id v126 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  id v127 = [v126 CGColor];
  v128 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView backdropResizingMaskLayer](self, "backdropResizingMaskLayer"));
  [v128 setFillColor:v127];

  id v129 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  id v130 = [v129 CGColor];
  v131 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView backdropResizingMaskLayer](self, "backdropResizingMaskLayer"));
  [v131 setBackgroundColor:v130];

  id v132 = [v85 copy];
  [v132 appendPath:v82];
  id v133 = v132;
  id v134 = [v133 CGPath];
  v135 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView backdropMaskShapeLayer](self, "backdropMaskShapeLayer"));
  [v135 setPath:v134];

  id v136 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  id v137 = [v136 CGColor];
  v138 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView backdropMaskShapeLayer](self, "backdropMaskShapeLayer"));
  [v138 setFillColor:v137];

  id v139 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  id v140 = [v139 CGColor];
  v141 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView backdropMaskShapeLayer](self, "backdropMaskShapeLayer"));
  [v141 setStrokeColor:v140];

  double v142 = ZWLensInnerBorderWidth();
  double v143 = ZWLensOuterBorderWidth();
  if (v142 < v143) {
    double v142 = v143;
  }
  v144 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView backdropMaskShapeLayer](self, "backdropMaskShapeLayer"));
  [v144 setLineWidth:v142];

  id v145 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  id v146 = [v145 CGColor];
  v147 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView backdropMaskShapeLayer](self, "backdropMaskShapeLayer"));
  [v147 setBackgroundColor:v146];

  +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
}

- (void)updateChromeVisibility:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  double v9 = 0.0;
  if (v5) {
    double v9 = ZWDefaultFadeAnimationDuration();
  }
  id v12 = v8;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = __63__ZWLensChromeView_updateChromeVisibility_animated_completion___block_invoke;
  v13[3] = &unk_6CAB0;
  v13[4] = self;
  BOOL v14 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = __63__ZWLensChromeView_updateChromeVisibility_animated_completion___block_invoke_2;
  v11[3] = &unk_6CC50;
  id v10 = v8;
  +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v13,  v11,  v9);
}

id __63__ZWLensChromeView_updateChromeVisibility_animated_completion___block_invoke(uint64_t a1)
{
  double v1 = 1.0;
  if (!*(_BYTE *)(a1 + 40)) {
    double v1 = 0.0;
  }
  return [*(id *)(a1 + 32) setAlpha:v1];
}

uint64_t __63__ZWLensChromeView_updateChromeVisibility_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)showLensResizingHandles:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
  +[CATransaction setDisableActions:](&OBJC_CLASS___CATransaction, "setDisableActions:", !v4);
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView lensResizingHandlesLayer](self, "lensResizingHandlesLayer"));
  double v9 = v7;
  if (v5) {
    float v10 = 1.0;
  }
  else {
    float v10 = 0.0;
  }
  if (v5) {
    float v11 = 0.0;
  }
  else {
    float v11 = 1.0;
  }
  *(float *)&double v8 = v10;
  [v7 setOpacity:v8];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView grabberOverlayLayer](self, "grabberOverlayLayer"));
  *(float *)&double v13 = v11;
  [v12 setOpacity:v13];

  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView backdropResizingMaskLayer](self, "backdropResizingMaskLayer"));
  *(float *)&double v15 = v10;
  [v14 setOpacity:v15];

  double v16 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView backdropGrabberMaskLayer](self, "backdropGrabberMaskLayer"));
  *(float *)&double v17 = v11;
  [v16 setOpacity:v17];

  -[ZWLensChromeView setShowingResizeHandles:](self, "setShowingResizeHandles:", v5);
  -[ZWLensChromeView layoutSubviews](self, "layoutSubviews");
  +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElements
{
  double v3 = ZWZoomLensBorderThicknessForTouches();
  -[ZWLensChromeView bounds](self, "bounds");
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v92[0] = _NSConcreteStackBlock;
  v92[1] = 3221225472LL;
  v92[2] = __41__ZWLensChromeView_accessibilityElements__block_invoke;
  v92[3] = &__block_descriptor_40_e42__CGRect__CGPoint_dd__CGSize_dd__24__0d8d16l;
  *(double *)&v92[4] = v3;
  id v12 = objc_retainBlock(v92);
  if (-[ZWLensChromeView showingResizeHandles](self, "showingResizeHandles"))
  {
    double v13 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView resizeElements](self, "resizeElements"));

    if (!v13)
    {
      BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      double v15 = -[UIAccessibilityElement initWithAccessibilityContainer:]( objc_alloc(&OBJC_CLASS___UIAccessibilityElement),  "initWithAccessibilityContainer:",  self);
      id v16 = ZWLocString(@"ZW_RESIZE_HANDLE_UPPER_LEFT");
      double v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      -[UIAccessibilityElement setAccessibilityLabel:](v15, "setAccessibilityLabel:", v17);

      id v86 = v15;
      [v14 addObject:v15];
      double v18 = -[UIAccessibilityElement initWithAccessibilityContainer:]( objc_alloc(&OBJC_CLASS___UIAccessibilityElement),  "initWithAccessibilityContainer:",  self);
      id v19 = ZWLocString(@"ZW_RESIZE_HANDLE_UPPER");
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      -[UIAccessibilityElement setAccessibilityLabel:](v18, "setAccessibilityLabel:", v20);

      id v85 = v18;
      [v14 addObject:v18];
      double v21 = -[UIAccessibilityElement initWithAccessibilityContainer:]( objc_alloc(&OBJC_CLASS___UIAccessibilityElement),  "initWithAccessibilityContainer:",  self);
      id v22 = ZWLocString(@"ZW_RESIZE_HANDLE_UPPER_RIGHT");
      double v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      -[UIAccessibilityElement setAccessibilityLabel:](v21, "setAccessibilityLabel:", v23);

      v84 = v21;
      [v14 addObject:v21];
      double v24 = -[UIAccessibilityElement initWithAccessibilityContainer:]( objc_alloc(&OBJC_CLASS___UIAccessibilityElement),  "initWithAccessibilityContainer:",  self);
      id v25 = ZWLocString(@"ZW_RESIZE_HANDLE_LEFT");
      double v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      -[UIAccessibilityElement setAccessibilityLabel:](v24, "setAccessibilityLabel:", v26);

      id v83 = v24;
      [v14 addObject:v24];
      double v27 = -[UIAccessibilityElement initWithAccessibilityContainer:]( objc_alloc(&OBJC_CLASS___UIAccessibilityElement),  "initWithAccessibilityContainer:",  self);
      id v28 = ZWLocString(@"ZW_RESIZE_HANDLE_RIGHT");
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      -[UIAccessibilityElement setAccessibilityLabel:](v27, "setAccessibilityLabel:", v29);

      id v82 = v27;
      [v14 addObject:v27];
      double v30 = -[UIAccessibilityElement initWithAccessibilityContainer:]( objc_alloc(&OBJC_CLASS___UIAccessibilityElement),  "initWithAccessibilityContainer:",  self);
      id v31 = ZWLocString(@"ZW_RESIZE_HANDLE_LOWER_LEFT");
      double v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
      -[UIAccessibilityElement setAccessibilityLabel:](v30, "setAccessibilityLabel:", v32);

      v81 = v30;
      [v14 addObject:v30];
      double v33 = -[UIAccessibilityElement initWithAccessibilityContainer:]( objc_alloc(&OBJC_CLASS___UIAccessibilityElement),  "initWithAccessibilityContainer:",  self);
      id v34 = ZWLocString(@"ZW_RESIZE_HANDLE_LOWER");
      double v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      -[UIAccessibilityElement setAccessibilityLabel:](v33, "setAccessibilityLabel:", v35);

      v80 = v33;
      [v14 addObject:v33];
      double v36 = -[UIAccessibilityElement initWithAccessibilityContainer:]( objc_alloc(&OBJC_CLASS___UIAccessibilityElement),  "initWithAccessibilityContainer:",  self);
      id v37 = ZWLocString(@"ZW_RESIZE_HANDLE_LOWER_RIGHT");
      id v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
      -[UIAccessibilityElement setAccessibilityLabel:](v36, "setAccessibilityLabel:", v38);

      [v14 addObject:v36];
      __int128 v90 = 0u;
      __int128 v91 = 0u;
      __int128 v88 = 0u;
      __int128 v89 = 0u;
      id v39 = v14;
      id v40 = [v39 countByEnumeratingWithState:&v88 objects:v93 count:16];
      if (v40)
      {
        id v41 = v40;
        uint64_t v42 = *(void *)v89;
        do
        {
          for (i = 0LL; i != v41; i = (char *)i + 1)
          {
            if (*(void *)v89 != v42) {
              objc_enumerationMutation(v39);
            }
            double v44 = *(void **)(*((void *)&v88 + 1) + 8LL * (void)i);
            [v44 setIsAccessibilityElement:1];
            id v45 = ZWLocString(@"ZW_RESIZE_HANDLE_HINT");
            double v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
            [v44 setAccessibilityHint:v46];
          }

          id v41 = [v39 countByEnumeratingWithState:&v88 objects:v93 count:16];
        }

        while (v41);
      }

      -[ZWLensChromeView setResizeElements:](self, "setResizeElements:", v39);
    }

    -[ZWLensChromeView previousResizeBounds](self, "previousResizeBounds");
    v127.origin.x = v5;
    v127.origin.y = v7;
    v127.size.width = v9;
    v127.size.height = v11;
    if (!CGRectEqualToRect(v94, v127))
    {
      double v47 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView resizeElements](self, "resizeElements"));
      v87 = (void *)objc_claimAutoreleasedReturnValue([v47 objectAtIndexedSubscript:0]);

      double v48 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView resizeElements](self, "resizeElements"));
      double v49 = (void *)objc_claimAutoreleasedReturnValue([v48 objectAtIndexedSubscript:1]);

      double v50 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView resizeElements](self, "resizeElements"));
      double v51 = (void *)objc_claimAutoreleasedReturnValue([v50 objectAtIndexedSubscript:2]);

      double v52 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView resizeElements](self, "resizeElements"));
      double v53 = (void *)objc_claimAutoreleasedReturnValue([v52 objectAtIndexedSubscript:3]);

      double v54 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView resizeElements](self, "resizeElements"));
      double v55 = (void *)objc_claimAutoreleasedReturnValue([v54 objectAtIndexedSubscript:4]);

      double v56 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView resizeElements](self, "resizeElements"));
      id v57 = (void *)objc_claimAutoreleasedReturnValue([v56 objectAtIndexedSubscript:5]);

      double v58 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView resizeElements](self, "resizeElements"));
      double v59 = (void *)objc_claimAutoreleasedReturnValue([v58 objectAtIndexedSubscript:6]);

      double v60 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView resizeElements](self, "resizeElements"));
      double v61 = (void *)objc_claimAutoreleasedReturnValue([v60 objectAtIndexedSubscript:7]);

      v95.origin.x = v5;
      v95.origin.y = v7;
      v95.size.width = v9;
      v95.size.height = v11;
      double MinX = CGRectGetMinX(v95);
      v96.origin.x = v5;
      v96.origin.y = v7;
      v96.size.width = v9;
      v96.size.height = v11;
      CGFloat MinY = CGRectGetMinY(v96);
      v97.origin.x = ((double (*)(void *, double, CGFloat))v12[2])(v12, MinX, MinY);
      CGRect v98 = UIAccessibilityConvertFrameToScreenCoordinates(v97, &self->super);
      objc_msgSend(v87, "setAccessibilityFrame:", v98.origin.x, v98.origin.y, v98.size.width, v98.size.height);
      v99.origin.x = v5;
      v99.origin.y = v7;
      v99.size.width = v9;
      v99.size.height = v11;
      double MidX = CGRectGetMidX(v99);
      v100.origin.x = v5;
      v100.origin.y = v7;
      v100.size.width = v9;
      v100.size.height = v11;
      CGFloat v65 = CGRectGetMinY(v100);
      v101.origin.x = ((double (*)(void *, double, CGFloat))v12[2])(v12, MidX, v65);
      CGRect v102 = UIAccessibilityConvertFrameToScreenCoordinates(v101, &self->super);
      objc_msgSend(v49, "setAccessibilityFrame:", v102.origin.x, v102.origin.y, v102.size.width, v102.size.height);
      v103.origin.x = v5;
      v103.origin.y = v7;
      v103.size.width = v9;
      v103.size.height = v11;
      double MaxX = CGRectGetMaxX(v103);
      v104.origin.x = v5;
      v104.origin.y = v7;
      v104.size.width = v9;
      v104.size.height = v11;
      CGFloat v67 = CGRectGetMinY(v104);
      v105.origin.x = ((double (*)(void *, double, CGFloat))v12[2])(v12, MaxX, v67);
      CGRect v106 = UIAccessibilityConvertFrameToScreenCoordinates(v105, &self->super);
      objc_msgSend(v51, "setAccessibilityFrame:", v106.origin.x, v106.origin.y, v106.size.width, v106.size.height);
      v107.origin.x = v5;
      v107.origin.y = v7;
      v107.size.width = v9;
      v107.size.height = v11;
      double v68 = CGRectGetMaxX(v107);
      v108.origin.x = v5;
      v108.origin.y = v7;
      v108.size.width = v9;
      v108.size.height = v11;
      CGFloat MidY = CGRectGetMidY(v108);
      v109.origin.x = ((double (*)(void *, double, CGFloat))v12[2])(v12, v68, MidY);
      CGRect v110 = UIAccessibilityConvertFrameToScreenCoordinates(v109, &self->super);
      objc_msgSend(v55, "setAccessibilityFrame:", v110.origin.x, v110.origin.y, v110.size.width, v110.size.height);
      v111.origin.x = v5;
      v111.origin.y = v7;
      v111.size.width = v9;
      v111.size.height = v11;
      double v70 = CGRectGetMinX(v111);
      v112.origin.x = v5;
      v112.origin.y = v7;
      v112.size.width = v9;
      v112.size.height = v11;
      CGFloat MaxY = CGRectGetMaxY(v112);
      v113.origin.x = ((double (*)(void *, double, CGFloat))v12[2])(v12, v70, MaxY);
      CGRect v114 = UIAccessibilityConvertFrameToScreenCoordinates(v113, &self->super);
      objc_msgSend(v57, "setAccessibilityFrame:", v114.origin.x, v114.origin.y, v114.size.width, v114.size.height);
      v115.origin.x = v5;
      v115.origin.y = v7;
      v115.size.width = v9;
      v115.size.height = v11;
      double v72 = CGRectGetMinX(v115);
      v116.origin.x = v5;
      v116.origin.y = v7;
      v116.size.width = v9;
      v116.size.height = v11;
      CGFloat v73 = CGRectGetMidY(v116);
      v117.origin.x = ((double (*)(void *, double, CGFloat))v12[2])(v12, v72, v73);
      CGRect v118 = UIAccessibilityConvertFrameToScreenCoordinates(v117, &self->super);
      objc_msgSend(v53, "setAccessibilityFrame:", v118.origin.x, v118.origin.y, v118.size.width, v118.size.height);
      v119.origin.x = v5;
      v119.origin.y = v7;
      v119.size.width = v9;
      v119.size.height = v11;
      double v74 = CGRectGetMidX(v119);
      v120.origin.x = v5;
      v120.origin.y = v7;
      v120.size.width = v9;
      v120.size.height = v11;
      CGFloat v75 = CGRectGetMaxY(v120);
      v121.origin.x = ((double (*)(void *, double, CGFloat))v12[2])(v12, v74, v75);
      CGRect v122 = UIAccessibilityConvertFrameToScreenCoordinates(v121, &self->super);
      objc_msgSend(v59, "setAccessibilityFrame:", v122.origin.x, v122.origin.y, v122.size.width, v122.size.height);
      v123.origin.x = v5;
      v123.origin.y = v7;
      v123.size.width = v9;
      v123.size.height = v11;
      double v76 = CGRectGetMaxX(v123);
      v124.origin.x = v5;
      v124.origin.y = v7;
      v124.size.width = v9;
      v124.size.height = v11;
      CGFloat v77 = CGRectGetMaxY(v124);
      v125.origin.x = ((double (*)(void *, double, CGFloat))v12[2])(v12, v76, v77);
      CGRect v126 = UIAccessibilityConvertFrameToScreenCoordinates(v125, &self->super);
      objc_msgSend(v61, "setAccessibilityFrame:", v126.origin.x, v126.origin.y, v126.size.width, v126.size.height);
      -[ZWLensChromeView setPreviousResizeBounds:](self, "setPreviousResizeBounds:", v5, v7, v9, v11);
    }

    CGFloat v78 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensChromeView resizeElements](self, "resizeElements"));
  }

  else
  {
    CGFloat v78 = 0LL;
  }

  return v78;
}

double __41__ZWLensChromeView_accessibilityElements__block_invoke(uint64_t a1, double a2)
{
  return a2 - *(double *)(a1 + 32) * 0.5;
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

- (CAShapeLayer)lensResizingHandlesLayer
{
  return self->_lensResizingHandlesLayer;
}

- (void)setLensResizingHandlesLayer:(id)a3
{
}

- (CAShapeLayer)touchStealerShapeLayer
{
  return self->_touchStealerShapeLayer;
}

- (void)setTouchStealerShapeLayer:(id)a3
{
}

- (CALayer)grabberOverlayLayer
{
  return self->_grabberOverlayLayer;
}

- (void)setGrabberOverlayLayer:(id)a3
{
}

- (CALayer)backdropLayer
{
  return self->_backdropLayer;
}

- (void)setBackdropLayer:(id)a3
{
}

- (CAShapeLayer)backdropMaskShapeLayer
{
  return self->_backdropMaskShapeLayer;
}

- (void)setBackdropMaskShapeLayer:(id)a3
{
}

- (CAShapeLayer)backdropGrabberMaskLayer
{
  return self->_backdropGrabberMaskLayer;
}

- (void)setBackdropGrabberMaskLayer:(id)a3
{
}

- (CAShapeLayer)backdropResizingMaskLayer
{
  return self->_backdropResizingMaskLayer;
}

- (void)setBackdropResizingMaskLayer:(id)a3
{
}

- (NSArray)resizeElements
{
  return self->_resizeElements;
}

- (void)setResizeElements:(id)a3
{
}

- (CGRect)previousResizeBounds
{
  double x = self->_previousResizeBounds.origin.x;
  double y = self->_previousResizeBounds.origin.y;
  double width = self->_previousResizeBounds.size.width;
  double height = self->_previousResizeBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPreviousResizeBounds:(CGRect)a3
{
  self->_previousResizeBounds = a3;
}

- (BOOL)showingResizeHandles
{
  return self->_showingResizeHandles;
}

- (void)setShowingResizeHandles:(BOOL)a3
{
  self->_showingResizeHandles = a3;
}

- (void).cxx_destruct
{
}

@end