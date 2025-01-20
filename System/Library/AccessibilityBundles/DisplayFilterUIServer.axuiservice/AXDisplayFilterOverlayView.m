@interface AXDisplayFilterOverlayView
- (AXDisplayFilterOverlayView)initWithFrame:(CGRect)a3;
- (CABackdropLayer)effectBackdropLayer;
- (CAReplicatorLayer)effectReplicatorLayer;
- (NSArray)filters;
- (UIView)effectView;
- (void)_setupLayers;
- (void)_updateLensEffect;
- (void)layoutSubviews;
- (void)setEffectBackdropLayer:(id)a3;
- (void)setEffectReplicatorLayer:(id)a3;
- (void)setEffectView:(id)a3;
- (void)setFilters:(id)a3;
@end

@implementation AXDisplayFilterOverlayView

- (AXDisplayFilterOverlayView)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___AXDisplayFilterOverlayView;
  v3 = -[AXDisplayFilterOverlayView initWithFrame:]( &v14,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[AXDisplayFilterOverlayView setTranslatesAutoresizingMaskIntoConstraints:]( v3,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[AXDisplayFilterOverlayView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    -[AXDisplayFilterOverlayView setClipsToBounds:](v4, "setClipsToBounds:", 1LL);
    v6 = -[UIView initWithFrame:]( objc_alloc(&OBJC_CLASS___UIView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
    -[AXDisplayFilterOverlayView setEffectView:](v4, "setEffectView:", v6);
    -[AXDisplayFilterOverlayView addSubview:](v4, "addSubview:", v6);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
    id v7 = -[UIView ax_pinConstraintsInAllDimensionsToView:](v6, "ax_pinConstraintsInAllDimensionsToView:", v4);
    v8 = objc_alloc_init(&OBJC_CLASS___CAReplicatorLayer);
    -[CAReplicatorLayer setAllowsHitTesting:](v8, "setAllowsHitTesting:", 0LL);
    -[CAReplicatorLayer setInstanceCount:](v8, "setInstanceCount:", 2LL);
    -[AXDisplayFilterOverlayView setEffectReplicatorLayer:](v4, "setEffectReplicatorLayer:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v6, "layer"));
    [v9 addSublayer:v8];

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v6, "layer"));
    [v10 setAllowsHitTesting:0];

    v11 = objc_alloc_init(&OBJC_CLASS___CABackdropLayer);
    -[CABackdropLayer setEnabled:](v11, "setEnabled:", 1LL);
    -[CABackdropLayer setAllowsHitTesting:](v11, "setAllowsHitTesting:", 0LL);
    -[AXDisplayFilterOverlayView setEffectBackdropLayer:](v4, "setEffectBackdropLayer:", v11);
    -[CAReplicatorLayer addSublayer:](v8, "addSublayer:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[AXDisplayFilterOverlayView effectView](v4, "effectView"));
    -[AXDisplayFilterOverlayView sendSubviewToBack:](v4, "sendSubviewToBack:", v12);

    -[AXDisplayFilterOverlayView layoutSubviews](v4, "layoutSubviews");
  }

  return v4;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AXDisplayFilterOverlayView;
  -[AXDisplayFilterOverlayView layoutSubviews](&v3, "layoutSubviews");
  -[AXDisplayFilterOverlayView _setupLayers](self, "_setupLayers");
}

- (void)_setupLayers
{
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v12 = (id)objc_claimAutoreleasedReturnValue(-[AXDisplayFilterOverlayView effectReplicatorLayer](self, "effectReplicatorLayer"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AXDisplayFilterOverlayView effectBackdropLayer](self, "effectBackdropLayer"));
  objc_msgSend(v12, "setBounds:", v4, v6, v8, v10);
  objc_msgSend(v12, "setPosition:", v8, v10);
  objc_msgSend(v11, "setBounds:", v4, v6, v8, v10);
  objc_msgSend(v11, "setPosition:", CGPointZero.x, CGPointZero.y);
  +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
}

- (void)setFilters:(id)a3
{
}

- (void)_updateLensEffect
{
  id v12 = (id)objc_claimAutoreleasedReturnValue(-[AXDisplayFilterOverlayView filters](self, "filters"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXDisplayFilterOverlayView effectBackdropLayer](self, "effectBackdropLayer"));
  id v4 = [v12 count];
  BOOL v5 = v4 == 0LL;
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXDisplayFilterOverlayView effectReplicatorLayer](self, "effectReplicatorLayer"));
  double v7 = v6;
  if (!v4)
  {
    [v6 removeFromSuperlayer];
LABEL_6:
    BOOL v9 = v4 != 0LL;

    goto LABEL_7;
  }

  double v8 = (void *)objc_claimAutoreleasedReturnValue([v6 superlayer]);

  if (!v8)
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[AXDisplayFilterOverlayView effectView](self, "effectView"));
    double v10 = (void *)objc_claimAutoreleasedReturnValue([v7 layer]);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[AXDisplayFilterOverlayView effectReplicatorLayer](self, "effectReplicatorLayer"));
    [v10 addSublayer:v11];

    goto LABEL_6;
  }

  BOOL v5 = 0LL;
  BOOL v9 = 1LL;
LABEL_7:
  [v3 setHidden:v5];
  [v3 setEnabled:v9];
  [v3 setFilters:v12];
  +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
}

- (NSArray)filters
{
  return self->_filters;
}

- (UIView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
}

- (CAReplicatorLayer)effectReplicatorLayer
{
  return self->_effectReplicatorLayer;
}

- (void)setEffectReplicatorLayer:(id)a3
{
}

- (CABackdropLayer)effectBackdropLayer
{
  return self->_effectBackdropLayer;
}

- (void)setEffectBackdropLayer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end