@interface PBPIPStashHintOverlayViewController
- (BOOL)isHidden;
- (CAShapeLayer)leftVisualEffectBorder;
- (CAShapeLayer)leftVisualEffectMask;
- (CAShapeLayer)rightVisualEffectBorder;
- (CAShapeLayer)rightVisualEffectMask;
- (NSArray)leftLayoutConstraints;
- (NSArray)rightLayoutConstraints;
- (PBAttentionAwarenessMonitor)attentionAwarenessMonitor;
- (PBPIPStashHintOverlayViewController)initWithCoder:(id)a3;
- (PBPIPStashHintOverlayViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PBPIPStashHintOverlayViewController)initWithQuadrant:(int64_t)a3;
- (UIColor)strokeColor;
- (UIImageView)tvButtonImageView;
- (UIVisualEffectView)visualEffectView;
- (double)visualEffectViewBorderWidth;
- (int64_t)quadrant;
- (unint64_t)layout;
- (void)_updateAppearanceForLayout:(unint64_t)a3 shouldReplaceSublayers:(BOOL)a4;
- (void)attentionAwarenessMonitorDidLoseAttention:(id)a3;
- (void)attentionAwarenessMonitorDidRegainAttention:(id)a3;
- (void)dealloc;
- (void)setAttentionAwarenessMonitor:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setLayout:(unint64_t)a3;
- (void)setLeftLayoutConstraints:(id)a3;
- (void)setLeftVisualEffectBorder:(id)a3;
- (void)setLeftVisualEffectMask:(id)a3;
- (void)setQuadrant:(int64_t)a3;
- (void)setRightLayoutConstraints:(id)a3;
- (void)setRightVisualEffectBorder:(id)a3;
- (void)setRightVisualEffectMask:(id)a3;
- (void)setStrokeColor:(id)a3;
- (void)setTvButtonImageView:(id)a3;
- (void)setVisualEffectView:(id)a3;
- (void)viewDidLoad;
@end

@implementation PBPIPStashHintOverlayViewController

- (PBPIPStashHintOverlayViewController)initWithCoder:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[PBPictureInPictureManager sharedInstance]( &OBJC_CLASS___PBPictureInPictureManager,  "sharedInstance",  a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currentState]);
  v6 = -[PBPIPStashHintOverlayViewController initWithQuadrant:]( self,  "initWithQuadrant:",  [v5 currentQuadrant]);

  return v6;
}

- (PBPIPStashHintOverlayViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[PBPictureInPictureManager sharedInstance]( &OBJC_CLASS___PBPictureInPictureManager,  "sharedInstance",  a3,  a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentState]);
  v7 = -[PBPIPStashHintOverlayViewController initWithQuadrant:]( self,  "initWithQuadrant:",  [v6 currentQuadrant]);

  return v7;
}

- (PBPIPStashHintOverlayViewController)initWithQuadrant:(int64_t)a3
{
  v90.receiver = self;
  v90.super_class = (Class)&OBJC_CLASS___PBPIPStashHintOverlayViewController;
  v4 = -[PBPIPStashHintOverlayViewController initWithNibName:bundle:](&v90, "initWithNibName:bundle:", 0LL, 0LL);
  v5 = v4;
  if (v4)
  {
    v4->_quadrant = a3;
    BOOL v7 = a3 == 3 || a3 == 0;
    v4->_layout = v7;
    v4->_double visualEffectViewBorderWidth = 1.0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.9, 0.5));
    v9 = -[UIVisualEffectView initWithFrame:]( objc_alloc(&OBJC_CLASS___UIVisualEffectView),  "initWithFrame:",  0.0,  0.0,  25.0,  120.0);
    visualEffectView = v5->_visualEffectView;
    v5->_visualEffectView = v9;

    v11 = v5->_visualEffectView;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 4007LL));
    -[UIVisualEffectView setEffect:](v11, "setEffect:", v12);

    -[UIVisualEffectView bounds](v5->_visualEffectView, "bounds");
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    v21 = objc_alloc_init(&OBJC_CLASS___CAShapeLayer);
    id v22 = objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:]( &OBJC_CLASS___UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 5LL, v14, v16, v18, v20, 25.0, 25.0));
    -[CAShapeLayer setPath:](v21, "setPath:", [v22 CGPath]);

    rightVisualEffectMask = v5->_rightVisualEffectMask;
    v5->_rightVisualEffectMask = v21;

    -[UIVisualEffectView bounds](v5->_visualEffectView, "bounds");
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    double visualEffectViewBorderWidth = v5->_visualEffectViewBorderWidth;
    id v33 = v8;
    v34 = objc_alloc_init(&OBJC_CLASS___CAShapeLayer);
    id v35 = objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:]( &OBJC_CLASS___UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 5LL, v25, v27, v29, v31, 25.0, 25.0));
    -[CAShapeLayer setPath:](v34, "setPath:", [v35 CGPath]);

    -[CAShapeLayer setLineWidth:](v34, "setLineWidth:", visualEffectViewBorderWidth);
    id v36 = v33;
    -[CAShapeLayer setStrokeColor:](v34, "setStrokeColor:", [v36 CGColor]);
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));

    id v38 = v37;
    -[CAShapeLayer setFillColor:](v34, "setFillColor:", [v38 CGColor]);

    -[CAShapeLayer setFrame:](v34, "setFrame:", v25, v27, v29, v31);
    rightVisualEffectBorder = v5->_rightVisualEffectBorder;
    v5->_rightVisualEffectBorder = v34;

    -[UIVisualEffectView bounds](v5->_visualEffectView, "bounds");
    double v41 = v40;
    double v43 = v42;
    double v45 = v44;
    double v47 = v46;
    v48 = objc_alloc_init(&OBJC_CLASS___CAShapeLayer);
    id v49 = objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:]( &OBJC_CLASS___UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 10LL, v41, v43, v45, v47, 25.0, 25.0));
    -[CAShapeLayer setPath:](v48, "setPath:", [v49 CGPath]);

    leftVisualEffectMask = v5->_leftVisualEffectMask;
    v5->_leftVisualEffectMask = v48;

    -[UIVisualEffectView bounds](v5->_visualEffectView, "bounds");
    double v52 = v51;
    double v54 = v53;
    double v56 = v55;
    double v58 = v57;
    double v59 = v5->_visualEffectViewBorderWidth;
    id v60 = v36;
    v61 = objc_alloc_init(&OBJC_CLASS___CAShapeLayer);
    id v62 = objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:]( &OBJC_CLASS___UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 10LL, v52, v54, v56, v58, 25.0, 25.0));
    -[CAShapeLayer setPath:](v61, "setPath:", [v62 CGPath]);

    -[CAShapeLayer setLineWidth:](v61, "setLineWidth:", v59);
    id v63 = v60;
    -[CAShapeLayer setStrokeColor:](v61, "setStrokeColor:", [v63 CGColor]);
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));

    id v65 = v64;
    -[CAShapeLayer setFillColor:](v61, "setFillColor:", [v65 CGColor]);

    -[CAShapeLayer setFrame:](v61, "setFrame:", v52, v54, v56, v58);
    leftVisualEffectBorder = v5->_leftVisualEffectBorder;
    v5->_leftVisualEffectBorder = v61;

    v67 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont systemFontOfSize:weight:]( &OBJC_CLASS___UIFont,  "systemFontOfSize:weight:",  24.0,  UIFontWeightThin));
    id v91 = v63;
    v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v91, 1LL));
    v69 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration pb_configurationWithFont:scale:paletteColors:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "pb_configurationWithFont:scale:paletteColors:",  v67,  -1LL,  v68));

    v70 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  @"tv.circle",  v69));
    v71 = -[UIImageView initWithImage:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithImage:", v70);
    tvButtonImageView = v5->_tvButtonImageView;
    v5->_tvButtonImageView = v71;

    v73 = -[PBAttentionAwarenessMonitor initWithTimeout:observerQueue:]( objc_alloc(&OBJC_CLASS___PBAttentionAwarenessMonitor),  "initWithTimeout:observerQueue:",  &_dispatch_main_q,  8.0);
    attentionAwarenessMonitor = v5->_attentionAwarenessMonitor;
    v5->_attentionAwarenessMonitor = v73;

    -[PBAttentionAwarenessMonitor addObserver:](v5->_attentionAwarenessMonitor, "addObserver:", v5);
    v75 = v5->_attentionAwarenessMonitor;
    id v89 = 0LL;
    unsigned int v76 = -[PBAttentionAwarenessMonitor resumeWithError:](v75, "resumeWithError:", &v89);
    id v77 = v89;
    id v78 = sub_100083780();
    v79 = (os_log_s *)objc_claimAutoreleasedReturnValue(v78);
    v80 = v79;
    if (v76)
    {
      if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
      {
        __int16 v88 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v80,  OS_LOG_TYPE_INFO,  "Starting attention awareness",  (uint8_t *)&v88,  2u);
      }
    }

    else if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
    {
      sub_100279B6C((uint64_t)v77, v80, v81, v82, v83, v84, v85, v86);
    }
  }

  return v5;
}

- (void)dealloc
{
  id v3 = sub_100083780();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Stopping attention awareness", buf, 2u);
  }

  attentionAwarenessMonitor = self->_attentionAwarenessMonitor;
  id v17 = 0LL;
  -[PBAttentionAwarenessMonitor suspendWithError:](attentionAwarenessMonitor, "suspendWithError:", &v17);
  id v6 = v17;
  if (v6)
  {
    id v7 = sub_100083780();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100279BD4((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);
    }
  }

  -[PBAttentionAwarenessMonitor removeObserver:](self->_attentionAwarenessMonitor, "removeObserver:", self);
  double v15 = self->_attentionAwarenessMonitor;
  self->_attentionAwarenessMonitor = 0LL;

  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___PBPIPStashHintOverlayViewController;
  -[PBPIPStashHintOverlayViewController dealloc](&v16, "dealloc");
}

- (void)viewDidLoad
{
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___PBPIPStashHintOverlayViewController;
  -[PBPIPStashHintOverlayViewController viewDidLoad](&v32, "viewDidLoad");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPStashHintOverlayViewController view](self, "view"));
  [v3 addSubview:self->_visualEffectView];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPStashHintOverlayViewController view](self, "view"));
  [v4 addSubview:self->_tvButtonImageView];

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( self->_tvButtonImageView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPStashHintOverlayViewController view](self, "view"));
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView centerYAnchor](self->_visualEffectView, "centerYAnchor"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPStashHintOverlayViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 centerYAnchor]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 constraintEqualToAnchor:v8]);
  v35[0] = v9;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](self->_tvButtonImageView, "centerYAnchor"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView centerYAnchor](self->_visualEffectView, "centerYAnchor"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 constraintEqualToAnchor:v11]);
  v35[1] = v12;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v35, 2LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v13);

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView rightAnchor](self->_visualEffectView, "rightAnchor"));
  double v15 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPStashHintOverlayViewController view](self, "view"));
  objc_super v16 = (void *)objc_claimAutoreleasedReturnValue([v15 rightAnchor]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v14 constraintEqualToAnchor:v16]);
  v34[0] = v17;
  double v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView rightAnchor](self->_tvButtonImageView, "rightAnchor"));
  double v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView leftAnchor](self->_visualEffectView, "leftAnchor"));
  double v20 = (void *)objc_claimAutoreleasedReturnValue([v18 constraintEqualToAnchor:v19 constant:-10.0]);
  v34[1] = v20;
  v21 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v34, 2LL));
  rightLayoutConstraints = self->_rightLayoutConstraints;
  self->_rightLayoutConstraints = v21;

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView leftAnchor](self->_visualEffectView, "leftAnchor"));
  double v24 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPStashHintOverlayViewController view](self, "view"));
  double v25 = (void *)objc_claimAutoreleasedReturnValue([v24 leftAnchor]);
  double v26 = (void *)objc_claimAutoreleasedReturnValue([v23 constraintEqualToAnchor:v25]);
  v33[0] = v26;
  double v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leftAnchor](self->_tvButtonImageView, "leftAnchor"));
  double v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView rightAnchor](self->_visualEffectView, "rightAnchor"));
  double v29 = (void *)objc_claimAutoreleasedReturnValue([v27 constraintEqualToAnchor:v28 constant:10.0]);
  v33[1] = v29;
  double v30 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v33, 2LL));
  leftLayoutConstraints = self->_leftLayoutConstraints;
  self->_leftLayoutConstraints = v30;

  -[PBPIPStashHintOverlayViewController _updateAppearanceForLayout:shouldReplaceSublayers:]( self,  "_updateAppearanceForLayout:shouldReplaceSublayers:",  self->_layout,  0LL);
}

- (void)setHidden:(BOOL)a3
{
}

- (void)setHidden:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)setHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  if (self->_hidden != v6)
  {
    self->_hidden = v6;
    if (v6) {
      double v9 = 0.0;
    }
    else {
      double v9 = 1.0;
    }
    if (v5)
    {
      uint64_t v10 = objc_alloc_init(&OBJC_CLASS___UISpringTimingParameters);
      uint64_t v11 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator),  "initWithDuration:timingParameters:",  v10,  0.75);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_10009B6A8;
      v14[3] = &unk_1003D05A8;
      v14[4] = self;
      *(double *)&v14[5] = v9;
      -[UIViewPropertyAnimator addAnimations:](v11, "addAnimations:", v14);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_10009B6E0;
      v12[3] = &unk_1003D3F80;
      id v13 = v8;
      -[UIViewPropertyAnimator addCompletion:](v11, "addCompletion:", v12);
      -[UIViewPropertyAnimator startAnimation](v11, "startAnimation");
    }

    else
    {
      uint64_t v10 = (UISpringTimingParameters *)objc_claimAutoreleasedReturnValue(-[PBPIPStashHintOverlayViewController view](self, "view"));
      -[UISpringTimingParameters setAlpha:](v10, "setAlpha:", v9);
    }
  }
}

- (void)setQuadrant:(int64_t)a3
{
  if (self->_quadrant != a3)
  {
    self->_quadrant = a3;
    BOOL v4 = a3 == 3 || a3 == 0;
    -[PBPIPStashHintOverlayViewController setLayout:](self, "setLayout:", v4);
  }

- (void)setLayout:(unint64_t)a3
{
  if (self->_layout != a3)
  {
    self->_layout = a3;
    -[PBPIPStashHintOverlayViewController _updateAppearanceForLayout:shouldReplaceSublayers:]( self,  "_updateAppearanceForLayout:shouldReplaceSublayers:");
  }

- (void)_updateAppearanceForLayout:(unint64_t)a3 shouldReplaceSublayers:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3 == 1)
  {
    +[NSLayoutConstraint deactivateConstraints:]( &OBJC_CLASS___NSLayoutConstraint,  "deactivateConstraints:",  self->_leftLayoutConstraints);
    +[NSLayoutConstraint activateConstraints:]( &OBJC_CLASS___NSLayoutConstraint,  "activateConstraints:",  self->_rightLayoutConstraints);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView layer](self->_visualEffectView, "layer"));
    [v10 setMask:self->_rightVisualEffectMask];

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView layer](self->_visualEffectView, "layer"));
    if (v4)
    {
      leftVisualEffectBorder = self->_leftVisualEffectBorder;
      uint64_t v9 = 10LL;
      goto LABEL_7;
    }

    uint64_t v11 = 10LL;
LABEL_10:
    [v7 addSublayer:(&self->super.super.super.isa)[v11]];
    goto LABEL_11;
  }

  if (a3) {
    return;
  }
  +[NSLayoutConstraint deactivateConstraints:]( &OBJC_CLASS___NSLayoutConstraint,  "deactivateConstraints:",  self->_rightLayoutConstraints);
  +[NSLayoutConstraint activateConstraints:]( &OBJC_CLASS___NSLayoutConstraint,  "activateConstraints:",  self->_leftLayoutConstraints);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView layer](self->_visualEffectView, "layer"));
  [v6 setMask:self->_leftVisualEffectMask];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView layer](self->_visualEffectView, "layer"));
  if (!v4)
  {
    uint64_t v11 = 13LL;
    goto LABEL_10;
  }

  leftVisualEffectBorder = self->_rightVisualEffectBorder;
  uint64_t v9 = 13LL;
LABEL_7:
  [v7 replaceSublayer:leftVisualEffectBorder with:(&self->super.super.super.isa)[v9]];
LABEL_11:
}

- (void)attentionAwarenessMonitorDidLoseAttention:(id)a3
{
  if (!self->_hidden) {
    -[PBPIPStashHintOverlayViewController setHidden:animated:](self, "setHidden:animated:", 1LL, 1LL);
  }
}

- (void)attentionAwarenessMonitorDidRegainAttention:(id)a3
{
  if (self->_hidden) {
    -[PBPIPStashHintOverlayViewController setHidden:animated:](self, "setHidden:animated:", 0LL, 1LL);
  }
}

- (double)visualEffectViewBorderWidth
{
  return self->_visualEffectViewBorderWidth;
}

- (int64_t)quadrant
{
  return self->_quadrant;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (void)setStrokeColor:(id)a3
{
}

- (UIImageView)tvButtonImageView
{
  return self->_tvButtonImageView;
}

- (void)setTvButtonImageView:(id)a3
{
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void)setVisualEffectView:(id)a3
{
}

- (unint64_t)layout
{
  return self->_layout;
}

- (NSArray)rightLayoutConstraints
{
  return self->_rightLayoutConstraints;
}

- (void)setRightLayoutConstraints:(id)a3
{
}

- (CAShapeLayer)rightVisualEffectMask
{
  return self->_rightVisualEffectMask;
}

- (void)setRightVisualEffectMask:(id)a3
{
}

- (CAShapeLayer)rightVisualEffectBorder
{
  return self->_rightVisualEffectBorder;
}

- (void)setRightVisualEffectBorder:(id)a3
{
}

- (NSArray)leftLayoutConstraints
{
  return self->_leftLayoutConstraints;
}

- (void)setLeftLayoutConstraints:(id)a3
{
}

- (CAShapeLayer)leftVisualEffectMask
{
  return self->_leftVisualEffectMask;
}

- (void)setLeftVisualEffectMask:(id)a3
{
}

- (CAShapeLayer)leftVisualEffectBorder
{
  return self->_leftVisualEffectBorder;
}

- (void)setLeftVisualEffectBorder:(id)a3
{
}

- (PBAttentionAwarenessMonitor)attentionAwarenessMonitor
{
  return self->_attentionAwarenessMonitor;
}

- (void)setAttentionAwarenessMonitor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end