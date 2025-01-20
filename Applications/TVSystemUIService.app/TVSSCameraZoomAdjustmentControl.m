@interface TVSSCameraZoomAdjustmentControl
- (BOOL)canBecomeFocused;
- (BOOL)isContinuous;
- (CGPoint)_contentOffsetForValue:(double)a3;
- (CGPoint)lastThumbLocation;
- (NSArray)zoomMarkers;
- (NSDictionary)zoomMarkerViews;
- (NSLayoutConstraint)markerPointerHeightConstraint;
- (TVSSCameraZoomAdjustmentControl)initWithFrame:(CGRect)a3;
- (TVSUIGradientView)graidentView;
- (UIScrollView)scrollView;
- (UIStackView)markerStackView;
- (UIView)backgroundView;
- (UIView)markerPointerView;
- (UIView)scrollViewContainerView;
- (double)_valueForContentOffset:(CGPoint)a3;
- (double)maximumValue;
- (double)minimumValue;
- (double)value;
- (void)_didPressDecrease:(id)a3;
- (void)_didPressIncrease:(id)a3;
- (void)_panUpdated:(id)a3;
- (void)_setValue:(double)a3 animated:(BOOL)a4 notify:(BOOL)a5;
- (void)_updateMarkers;
- (void)_updateScrollPositionAndMarkerAppearance;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)setContinuous:(BOOL)a3;
- (void)setMaximumValue:(double)a3;
- (void)setMinimumValue:(double)a3;
- (void)setValue:(double)a3;
@end

@implementation TVSSCameraZoomAdjustmentControl

- (TVSSCameraZoomAdjustmentControl)initWithFrame:(CGRect)a3
{
  CGRect v113 = a3;
  SEL v111 = a2;
  id v112 = 0LL;
  v110.receiver = self;
  v110.super_class = (Class)&OBJC_CLASS___TVSSCameraZoomAdjustmentControl;
  v106 = -[TVSSCameraZoomAdjustmentControl initWithFrame:]( &v110,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  id v112 = v106;
  objc_storeStrong(&v112, v106);
  if (v106)
  {
    [v112 setTranslatesAutoresizingMaskIntoConstraints:0];
    v3 = objc_alloc_init(&OBJC_CLASS___UIView);
    v4 = (void *)*((void *)v112 + 5);
    *((void *)v112 + 5) = v3;

    v26 = (void *)*((void *)v112 + 5);
    v27 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:");
    objc_msgSend(v26, "setBackgroundColor:");

    [*((id *)v112 + 5) setTranslatesAutoresizingMaskIntoConstraints:0];
    [*((id *)v112 + 5) setAlpha:0.0];
    [v112 addSubview:*((void *)v112 + 5)];
    v5 = objc_alloc_init(&OBJC_CLASS___UIView);
    v6 = (void *)*((void *)v112 + 6);
    *((void *)v112 + 6) = v5;

    [*((id *)v112 + 6) setTranslatesAutoresizingMaskIntoConstraints:0];
    [v112 addSubview:*((void *)v112 + 6)];
    v7 = objc_alloc_init(&OBJC_CLASS___UIScrollView);
    v8 = (void *)*((void *)v112 + 9);
    *((void *)v112 + 9) = v7;

    [*((id *)v112 + 9) setDirectionalLockEnabled:1];
    [*((id *)v112 + 9) setContentInsetAdjustmentBehavior:2];
    [*((id *)v112 + 9) setTranslatesAutoresizingMaskIntoConstraints:0];
    [*((id *)v112 + 6) addSubview:*((void *)v112 + 9)];
    v9 = objc_alloc_init(&OBJC_CLASS___TVSUIGradientView);
    v10 = (void *)*((void *)v112 + 7);
    *((void *)v112 + 7) = v9;

    [*((id *)v112 + 7) setUserInteractionEnabled:0];
    [*((id *)v112 + 7) setTranslatesAutoresizingMaskIntoConstraints:0];
    id v33 = [*((id *)v112 + 7) gradientLayer];
    v32 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:");
    v115[0] = -[UIColor CGColor](v32, "CGColor");
    v31 = +[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor");
    v115[1] = -[UIColor CGColor](v31, "CGColor");
    v30 = +[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor");
    v115[2] = -[UIColor CGColor](v30, "CGColor");
    v29 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.0);
    v115[3] = -[UIColor CGColor](v29, "CGColor");
    v28 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v115, 4LL);
    objc_msgSend(v33, "setColors:");

    id v34 = [*((id *)v112 + 7) gradientLayer];
    [v34 setLocations:&off_1001C8678];

    id v35 = [*((id *)v112 + 7) gradientLayer];
    sub_10009DC68();
    v109[3] = v11;
    v109[4] = v12;
    objc_msgSend(v35, "setStartPoint:", *(double *)&v11, *(double *)&v12);

    id v36 = [*((id *)v112 + 7) gradientLayer];
    sub_10009DC68();
    v109[1] = v13;
    v109[2] = v14;
    objc_msgSend(v36, "setEndPoint:", *(double *)&v13, *(double *)&v14);

    id v38 = [*((id *)v112 + 7) layer];
    v37 = +[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterMultiply);
    objc_msgSend(v38, "setCompositingFilter:");

    [*((id *)v112 + 6) addSubview:*((void *)v112 + 7)];
    v15 = objc_alloc_init(&OBJC_CLASS___UIStackView);
    v16 = (void *)*((void *)v112 + 8);
    *((void *)v112 + 8) = v15;

    [*((id *)v112 + 8) setAxis:0];
    [*((id *)v112 + 8) setSpacing:9.0];
    [*((id *)v112 + 8) setAlignment:3];
    [*((id *)v112 + 8) setTranslatesAutoresizingMaskIntoConstraints:0];
    [*((id *)v112 + 9) addSubview:*((void *)v112 + 8)];
    v17 = objc_alloc_init(&OBJC_CLASS___UIView);
    v18 = (void *)*((void *)v112 + 11);
    *((void *)v112 + 11) = v17;

    v39 = (void *)*((void *)v112 + 11);
    v40 = +[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor");
    objc_msgSend(v39, "setBackgroundColor:");

    [*((id *)v112 + 11) _setCornerRadius:4.0];
    id v41 = [*((id *)v112 + 11) layer];
    [v41 setBorderWidth:3.0];

    id v43 = [*((id *)v112 + 11) layer];
    id v42 = +[UIColor systemYellowColor](&OBJC_CLASS___UIColor, "systemYellowColor");
    objc_msgSend(v43, "setBorderColor:", objc_msgSend(v42, "CGColor"));

    [*((id *)v112 + 11) setTranslatesAutoresizingMaskIntoConstraints:0];
    [*((id *)v112 + 11) setAlpha:0.0];
    [v112 addSubview:*((void *)v112 + 11)];
    id v44 = [*((id *)v112 + 11) heightAnchor];
    id v19 = [v44 constraintEqualToConstant:22.0];
    v20 = (void *)*((void *)v112 + 13);
    *((void *)v112 + 13) = v19;

    id v105 = [*((id *)v112 + 5) leadingAnchor];
    id v104 = [v112 leadingAnchor];
    id v103 = objc_msgSend(v105, "constraintEqualToAnchor:");
    v114[0] = v103;
    id v102 = [*((id *)v112 + 5) trailingAnchor];
    id v101 = [v112 trailingAnchor];
    id v100 = objc_msgSend(v102, "constraintEqualToAnchor:");
    v114[1] = v100;
    id v99 = [*((id *)v112 + 5) topAnchor];
    id v98 = [v112 topAnchor];
    id v97 = objc_msgSend(v99, "constraintEqualToAnchor:");
    v114[2] = v97;
    id v96 = [*((id *)v112 + 5) bottomAnchor];
    id v95 = [v112 bottomAnchor];
    id v94 = objc_msgSend(v96, "constraintEqualToAnchor:");
    v114[3] = v94;
    id v93 = [*((id *)v112 + 6) leadingAnchor];
    id v92 = [v112 leadingAnchor];
    id v91 = objc_msgSend(v93, "constraintEqualToAnchor:");
    v114[4] = v91;
    id v90 = [*((id *)v112 + 6) trailingAnchor];
    id v89 = [v112 trailingAnchor];
    id v88 = objc_msgSend(v90, "constraintEqualToAnchor:");
    v114[5] = v88;
    id v87 = [*((id *)v112 + 6) centerYAnchor];
    id v86 = [v112 centerYAnchor];
    id v85 = objc_msgSend(v87, "constraintEqualToAnchor:");
    v114[6] = v85;
    id v84 = [*((id *)v112 + 6) heightAnchor];
    id v83 = objc_msgSend(v84, "constraintEqualToConstant:");
    v114[7] = v83;
    id v82 = [*((id *)v112 + 9) leadingAnchor];
    id v81 = [*((id *)v112 + 6) leadingAnchor];
    id v80 = objc_msgSend(v82, "constraintEqualToAnchor:");
    v114[8] = v80;
    id v79 = [*((id *)v112 + 9) trailingAnchor];
    id v78 = [*((id *)v112 + 6) trailingAnchor];
    id v77 = objc_msgSend(v79, "constraintEqualToAnchor:");
    v114[9] = v77;
    id v76 = [*((id *)v112 + 9) centerYAnchor];
    id v75 = [*((id *)v112 + 6) centerYAnchor];
    id v74 = objc_msgSend(v76, "constraintEqualToAnchor:");
    v114[10] = v74;
    id v73 = [*((id *)v112 + 9) heightAnchor];
    id v72 = [v73 constraintEqualToConstant:16.0];
    v114[11] = v72;
    id v71 = [*((id *)v112 + 7) centerXAnchor];
    id v70 = [*((id *)v112 + 9) centerXAnchor];
    id v69 = objc_msgSend(v71, "constraintEqualToAnchor:");
    v114[12] = v69;
    id v68 = [*((id *)v112 + 7) centerYAnchor];
    id v67 = [*((id *)v112 + 9) centerYAnchor];
    id v66 = objc_msgSend(v68, "constraintEqualToAnchor:");
    v114[13] = v66;
    id v65 = [*((id *)v112 + 7) widthAnchor];
    id v64 = [*((id *)v112 + 9) widthAnchor];
    id v63 = objc_msgSend(v65, "constraintEqualToAnchor:");
    v114[14] = v63;
    id v62 = [*((id *)v112 + 7) heightAnchor];
    id v61 = [*((id *)v112 + 9) heightAnchor];
    id v60 = objc_msgSend(v62, "constraintEqualToAnchor:");
    v114[15] = v60;
    id v59 = [*((id *)v112 + 8) leftAnchor];
    id v58 = [*((id *)v112 + 9) leftAnchor];
    id v57 = objc_msgSend(v59, "constraintEqualToAnchor:");
    v114[16] = v57;
    id v56 = [*((id *)v112 + 8) centerYAnchor];
    id v55 = [*((id *)v112 + 9) centerYAnchor];
    id v54 = objc_msgSend(v56, "constraintEqualToAnchor:");
    v114[17] = v54;
    id v53 = [*((id *)v112 + 11) centerXAnchor];
    id v52 = [v112 centerXAnchor];
    id v51 = objc_msgSend(v53, "constraintEqualToAnchor:");
    v114[18] = v51;
    id v50 = [*((id *)v112 + 11) centerYAnchor];
    id v49 = [v112 centerYAnchor];
    id v48 = objc_msgSend(v50, "constraintEqualToAnchor:");
    v114[19] = v48;
    id v47 = [*((id *)v112 + 11) widthAnchor];
    id v46 = [v47 constraintEqualToConstant:8.0];
    v114[20] = v46;
    v114[21] = *((void *)v112 + 13);
    v45 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v114, 22LL);
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

    v21 = objc_alloc(&OBJC_CLASS___UITapGestureRecognizer);
    v109[0] = -[UITapGestureRecognizer initWithTarget:action:]( v21,  "initWithTarget:action:",  v112,  "_didPressIncrease:");
    [v109[0] setAllowedPressTypes:&off_1001C8690];
    v22 = objc_alloc(&OBJC_CLASS___UITapGestureRecognizer);
    v108 = -[UITapGestureRecognizer initWithTarget:action:](v22, "initWithTarget:action:", v112, "_didPressDecrease:");
    -[UITapGestureRecognizer setAllowedPressTypes:](v108, "setAllowedPressTypes:", &off_1001C86A8);
    v23 = objc_alloc(&OBJC_CLASS___UIPanGestureRecognizer);
    v107 = -[UIPanGestureRecognizer initWithTarget:action:](v23, "initWithTarget:action:", v112, "_panUpdated:");
    -[UIPanGestureRecognizer _setHysteresis:](v107, "_setHysteresis:", 200.0);
    [v112 addGestureRecognizer:v109[0]];
    [v112 addGestureRecognizer:v108];
    [v112 addGestureRecognizer:v107];
    [v112 _updateMarkers];
    objc_storeStrong((id *)&v107, 0LL);
    objc_storeStrong((id *)&v108, 0LL);
    objc_storeStrong(v109, 0LL);
  }

  v25 = (TVSSCameraZoomAdjustmentControl *)v112;
  objc_storeStrong(&v112, 0LL);
  return v25;
}

  ;
}

- (void)layoutSubviews
{
  v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSSCameraZoomAdjustmentControl;
  -[TVSSCameraZoomAdjustmentControl layoutSubviews](&v3, "layoutSubviews");
  backgroundView = v5->_backgroundView;
  -[TVSSCameraZoomAdjustmentControl bounds](v5, "bounds");
  -[UIView _setCornerRadius:](backgroundView, "_setCornerRadius:", CGRectGetHeight(v6) / 2.0);
  -[TVSSCameraZoomAdjustmentControl _updateScrollPositionAndMarkerAppearance]( v5,  "_updateScrollPositionAndMarkerAppearance");
}

- (void)setValue:(double)a3
{
  if (self->_value != a3) {
    -[TVSSCameraZoomAdjustmentControl _setValue:animated:notify:](self, "_setValue:animated:notify:", 0LL, 0LL, a3);
  }
}

- (void)setMinimumValue:(double)a3
{
  self->_minimumValue = a3;
  -[TVSSCameraZoomAdjustmentControl _updateMarkers](self, "_updateMarkers");
}

- (void)setMaximumValue:(double)a3
{
  self->_maximumValue = a3;
  -[TVSSCameraZoomAdjustmentControl _updateMarkers](self, "_updateMarkers");
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v24 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v22 = 0LL;
  objc_storeStrong(&v22, a4);
  SEL v4 = (TVSSCameraZoomAdjustmentControl *)[location[0] nextFocusedItem];
  BOOL v8 = v4 == v24;

  BOOL v21 = v8;
  if (v8)
  {
    id v6 = v22;
    v15 = _NSConcreteStackBlock;
    int v16 = -1073741824;
    int v17 = 0;
    v18 = sub_10009DFF8;
    id v19 = &unk_1001B5A60;
    v20 = v24;
    objc_msgSend(v6, "addCoordinatedAnimations:completion:", &v15);
    objc_storeStrong((id *)&v20, 0LL);
  }

  else
  {
    id v5 = v22;
    v9 = _NSConcreteStackBlock;
    int v10 = -1073741824;
    int v11 = 0;
    v12 = sub_10009E060;
    v13 = &unk_1001B5A60;
    v14 = v24;
    objc_msgSend(v5, "addCoordinatedAnimations:completion:", &v9);
    objc_storeStrong((id *)&v14, 0LL);
  }

  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_didPressIncrease:(id)a3
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  double maximumValue = v15->_maximumValue;
  memset(__b, 0, sizeof(__b));
  obj = v15->_zoomMarkers;
  id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v16,  16LL);
  if (v8)
  {
    uint64_t v4 = *(void *)__b[2];
    uint64_t v5 = 0LL;
    id v6 = v8;
    while (1)
    {
      uint64_t v3 = v5;
      if (*(void *)__b[2] != v4) {
        objc_enumerationMutation(obj);
      }
      id v12 = *(id *)(__b[1] + 8 * v5);
      [v12 getValue:v9];
      if (v10 > v15->_value + 0.00000011920929) {
        break;
      }
      ++v5;
      if (v3 + 1 >= (unint64_t)v6)
      {
        uint64_t v5 = 0LL;
        id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v16,  16LL,  v10);
        if (!v6) {
          goto LABEL_9;
        }
      }
    }

    double maximumValue = v10;
  }

- (void)_didPressDecrease:(id)a3
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  double minimumValue = v15->_minimumValue;
  memset(__b, 0, sizeof(__b));
  obj = -[NSArray reverseObjectEnumerator](v15->_zoomMarkers, "reverseObjectEnumerator");
  id v8 = -[NSEnumerator countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v16,  16LL);
  if (v8)
  {
    uint64_t v4 = *(void *)__b[2];
    uint64_t v5 = 0LL;
    id v6 = v8;
    while (1)
    {
      uint64_t v3 = v5;
      if (*(void *)__b[2] != v4) {
        objc_enumerationMutation(obj);
      }
      id v12 = *(id *)(__b[1] + 8 * v5);
      [v12 getValue:v9];
      if (v10 < v15->_value - 0.00000011920929) {
        break;
      }
      ++v5;
      if (v3 + 1 >= (unint64_t)v6)
      {
        uint64_t v5 = 0LL;
        id v6 = -[NSEnumerator countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v16,  16LL,  v10);
        if (!v6) {
          goto LABEL_9;
        }
      }
    }

    double minimumValue = v10;
  }

- (void)_panUpdated:(id)a3
{
  v28 = (CGPoint *)self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v26 = [location[0] state];
  if (v26 == (id)1)
  {
    id v19 = v28;
    [location[0] locationInView:v28];
    v25.x = v3;
    v25.y = v4;
    v19[7] = v25;
  }

  else if (v26 == (id)2)
  {
    [location[0] locationInView:v28];
    v24.x = v5;
    v24.y = v6;
    double v18 = v6;
    -[CGPoint frame](v28, "frame");
    double v22 = v18 - CGRectGetHeight(v29) / 2.0;
    if (v22 >= 0.0) {
      double v17 = v22;
    }
    else {
      double v17 = -v22;
    }
    if (v17 <= 170.0)
    {
      if (v17 <= 120.0)
      {
        if (v17 <= 50.0) {
          float v23 = 0.25;
        }
        else {
          float v23 = 0.125;
        }
      }

      else
      {
        float v23 = 0.0625;
      }
    }

    else
    {
      float v23 = 0.03125;
    }

    CGFloat v14 = v24.x - v28[7].x;
    -[CGPoint frame](v28, "frame");
    CGFloat v16 = v14 / CGRectGetWidth(v30);
    -[CGPoint maximumValue](v28, "maximumValue");
    double v15 = v7;
    -[CGPoint minimumValue](v28, "minimumValue");
    double v21 = v16 * (v15 - v8) * v23;
    -[CGPoint minimumValue](v28, "minimumValue");
    double v20 = v9;
    -[CGPoint value](v28, "value");
    if (v20 >= v10 + v21) {
      double v13 = v20;
    }
    else {
      double v13 = v10 + v21;
    }
    -[CGPoint maximumValue](v28, "maximumValue");
    if (v13 >= v11) {
      double v12 = v11;
    }
    else {
      double v12 = v13;
    }
    -[CGPoint _setValue:animated:notify:](v28, "_setValue:animated:notify:", 1LL, 0LL, v12, *(void *)&v12);
    v28[7] = v24;
  }

  else
  {
    v28[7] = CGPointZero;
    if (v26 == (id)3) {
      -[CGPoint sendActionsForControlEvents:](v28, "sendActionsForControlEvents:", 4096LL);
    }
  }

  objc_storeStrong(location, 0LL);
}

- (void)_setValue:(double)a3 animated:(BOOL)a4 notify:(BOOL)a5
{
  double v15 = self;
  SEL v14 = a2;
  double v13 = a3;
  BOOL v12 = a4;
  BOOL v11 = a5;
  self->_value = a3;
  if (v11) {
    -[TVSSCameraZoomAdjustmentControl sendActionsForControlEvents:](v15, "sendActionsForControlEvents:", 4096LL);
  }
  if (v12)
  {
    CGFloat v5 = _NSConcreteStackBlock;
    int v6 = -1073741824;
    int v7 = 0;
    double v8 = sub_10009EAF4;
    double v9 = &unk_1001B5A60;
    double v10 = v15;
    +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", &v5, 0.2);
    objc_storeStrong((id *)&v10, 0LL);
  }

  else
  {
    -[TVSSCameraZoomAdjustmentControl _updateScrollPositionAndMarkerAppearance]( v15,  "_updateScrollPositionAndMarkerAppearance");
  }

- (void)_updateMarkers
{
  id v42 = self;
  SEL v41 = a2;
  memset(__b, 0, sizeof(__b));
  obj = -[NSDictionary allValues](v42->_zoomMarkerViews, "allValues");
  id v22 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v43,  16LL);
  if (v22)
  {
    uint64_t v18 = *(void *)__b[2];
    uint64_t v19 = 0LL;
    id v20 = v22;
    while (1)
    {
      uint64_t v17 = v19;
      if (*(void *)__b[2] != v18) {
        objc_enumerationMutation(obj);
      }
      id v40 = *(id *)(__b[1] + 8 * v19);
      [v40 removeFromSuperview];
      ++v19;
      if (v17 + 1 >= (unint64_t)v20)
      {
        uint64_t v19 = 0LL;
        id v20 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v43,  16LL);
        if (!v20) {
          break;
        }
      }
    }
  }

  double minimumValue = v42->_minimumValue;
  v37 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v36 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  while (minimumValue <= v42->_maximumValue + 0.00000011920929)
  {
    BOOL v35 = minimumValue < 1.0;
    double v2 = 0.05;
    if (minimumValue >= 1.0) {
      double v2 = 0.1;
    }
    double v34 = v2;
    unint64_t v33 = vcvtmd_u64_f64(minimumValue);
    unint64_t v32 = llround((minimumValue - (double)v33) / v2);
    BOOL v31 = v32 % 5 == 0;
    double v29 = minimumValue;
    double maximumValue = v42->_maximumValue;
    if (minimumValue >= maximumValue) {
      double v16 = maximumValue;
    }
    else {
      double v16 = v29;
    }
    *(double *)&__src[5] = v16;
    double v30 = v16;
    __src[0] = v33;
    __src[1] = v32;
    __src[2] = v31;
    __src[3] = v35;
    *(double *)&__src[4] = v16;
    double v10 = v37;
    memcpy(__dst, __src, sizeof(__dst));
    BOOL v11 = +[NSValue valueWithBytes:objCType:](&OBJC_CLASS___NSValue, "valueWithBytes:objCType:", __dst);
    -[NSMutableArray addObject:](v10, "addObject:");

    BOOL v12 = objc_alloc(&OBJC_CLASS____TVSSCameraZoomMarkerView);
    memcpy(v24, __src, sizeof(v24));
    CGPoint v25 = -[_TVSSCameraZoomMarkerView initWithMarker:](v12, "initWithMarker:", v24);
    SEL v14 = v36;
    double v13 = v25;
    memcpy(v23, __src, sizeof(v23));
    double v15 =  +[NSValue valueWithBytes:objCType:]( &OBJC_CLASS___NSValue,  "valueWithBytes:objCType:",  v23,  "{_TVSSZoomMarker=QQQQd}");
    -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v13);

    -[_TVSSCameraZoomMarkerView setTranslatesAutoresizingMaskIntoConstraints:]( v25,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIStackView addSubview:](v42->_markerStackView, "addSubview:", v25);
    -[UIStackView addArrangedSubview:](v42->_markerStackView, "addArrangedSubview:", v25);
    double minimumValue = minimumValue + v34;
    objc_storeStrong((id *)&v25, 0LL);
  }

  CGFloat v3 = (NSArray *)-[NSMutableArray copy](v37, "copy", minimumValue);
  zoomMarkers = v42->_zoomMarkers;
  v42->_zoomMarkers = v3;

  CGFloat v5 = (NSDictionary *)-[NSMutableDictionary copy](v36, "copy");
  zoomMarkerViews = v42->_zoomMarkerViews;
  v42->_zoomMarkerViews = v5;

  -[UIStackView systemLayoutSizeFittingSize:]( v42->_markerStackView,  "systemLayoutSizeFittingSize:",  UILayoutFittingCompressedSize.width,  UILayoutFittingCompressedSize.height);
  scrollView = v42->_scrollView;
  sub_10009F0FC();
  -[UIScrollView setContentSize:](scrollView, "setContentSize:", v7, v8);
  -[TVSSCameraZoomAdjustmentControl setNeedsLayout](v42, "setNeedsLayout");
  objc_storeStrong((id *)&v36, 0LL);
  objc_storeStrong((id *)&v37, 0LL);
}

  ;
}

- (void)_updateScrollPositionAndMarkerAppearance
{
  float v23 = self;
  SEL v22 = a2;
  -[TVSSCameraZoomAdjustmentControl _contentOffsetForValue:](self, "_contentOffsetForValue:", self->_value);
  double v20 = v2;
  double v21 = v3;
  -[UIScrollView setContentOffset:](v23->_scrollView, "setContentOffset:", v2, v3);
  BOOL v19 = 1;
  double v18 = 1.79769313e308;
  memset(__b, 0, sizeof(__b));
  obj = v23->_zoomMarkers;
  id v11 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v24,  16LL);
  if (v11)
  {
    uint64_t v7 = *(void *)__b[2];
    uint64_t v8 = 0LL;
    id v9 = v11;
    while (1)
    {
      uint64_t v6 = v8;
      if (*(void *)__b[2] != v7) {
        objc_enumerationMutation(obj);
      }
      id v17 = *(id *)(__b[1] + 8 * v8);
      objc_msgSend(v17, "getValue:", v13, v9);
      double v12 = vabdd_f64(v23->_value, v15);
      if (v12 < v18)
      {
        double v18 = v12;
        BOOL v19 = v14 != 0;
      }

      ++v8;
      id v9 = (id)v5;
      if (v6 + 1 >= v5)
      {
        uint64_t v8 = 0LL;
        id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v24,  16LL);
        if (!v9) {
          break;
        }
      }
    }
  }

  double v4 = 22.0;
  if (!v19) {
    double v4 = 14.0;
  }
  -[NSLayoutConstraint setConstant:](v23->_markerPointerHeightConstraint, "setConstant:", v4);
}

- (CGPoint)_contentOffsetForValue:(double)a3
{
  result.y = v4;
  result.x = v3;
  return result;
}

- (double)_valueForContentOffset:(CGPoint)a3
{
  double x = a3.x;
  -[TVSSCameraZoomAdjustmentControl bounds](self, "bounds");
  double v7 = (x + (CGRectGetWidth(v10) - 2.0) / 2.0) / 11.0;
  double minimumValue = self->_minimumValue;
  if (minimumValue < 1.0)
  {
    if (v7 >= (1.0 - minimumValue) / 0.05) {
      double v5 = (1.0 - minimumValue) / 0.05;
    }
    else {
      double v5 = v7;
    }
    double minimumValue = minimumValue + v5 * 0.05;
    double v7 = v7 - v5;
  }

  if (v7 > 0.0) {
    double minimumValue = minimumValue + v7 * 0.1;
  }
  if (minimumValue >= self->_maximumValue) {
    return self->_maximumValue;
  }
  else {
    return minimumValue;
  }
}

- (double)value
{
  return self->_value;
}

- (double)minimumValue
{
  return self->_minimumValue;
}

- (double)maximumValue
{
  return self->_maximumValue;
}

- (BOOL)isContinuous
{
  return self->_continuous;
}

- (void)setContinuous:(BOOL)a3
{
  self->_continuous = a3;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (UIView)scrollViewContainerView
{
  return self->_scrollViewContainerView;
}

- (TVSUIGradientView)graidentView
{
  return self->_graidentView;
}

- (UIStackView)markerStackView
{
  return self->_markerStackView;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (NSArray)zoomMarkers
{
  return self->_zoomMarkers;
}

- (UIView)markerPointerView
{
  return self->_markerPointerView;
}

- (NSDictionary)zoomMarkerViews
{
  return self->_zoomMarkerViews;
}

- (NSLayoutConstraint)markerPointerHeightConstraint
{
  return self->_markerPointerHeightConstraint;
}

- (CGPoint)lastThumbLocation
{
  double y = self->_lastThumbLocation.y;
  double x = self->_lastThumbLocation.x;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void).cxx_destruct
{
}

@end