@interface TVSSCameraLensSwitcherView
- (BOOL)containsFocusedButton;
- (BOOL)isManuallyFraming;
- (BOOL)isUsingWideForFraming;
- (BOOL)supportsUltraWideCamera;
- (BOOL)supportsWideCamera;
- (TVSSCameraLensSwitcherView)initWithCurrentZoomFactor:(double)a3 supportsWideCamera:(BOOL)a4 supportsUltraWideCamera:(BOOL)a5 isUsingWideForFraming:(BOOL)a6 defaultWideZoomFactor:(double)a7 defaultUltraWideZoomFactor:(double)a8;
- (TVSSCameraLensSwitcherViewDelegate)delegate;
- (TVSSCameraZoomButton)ultraWideLensButton;
- (TVSSCameraZoomButton)wideLensButton;
- (UIStackView)stackView;
- (UIView)platterView;
- (double)defaultUltraWideZoomFactor;
- (double)defaultWideZoomFactor;
- (double)zoomFactor;
- (void)_updateButtonSelection;
- (void)_updatePlatterAnimated:(BOOL)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)selectUltraWideLensButton;
- (void)selectWideLensButton;
- (void)setContainsFocusedButton:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setManuallyFraming:(BOOL)a3;
- (void)setPlatterView:(id)a3;
- (void)setStackView:(id)a3;
- (void)setUltraWideLensButton:(id)a3;
- (void)setUsingWideForFraming:(BOOL)a3;
- (void)setWideLensButton:(id)a3;
- (void)setZoomFactor:(double)a3;
- (void)updateButtonTitleForUltraWideZoomFactor:(double)a3;
- (void)updateButtonTitleForWideZoomFactor:(double)a3;
@end

@implementation TVSSCameraLensSwitcherView

- (TVSSCameraLensSwitcherView)initWithCurrentZoomFactor:(double)a3 supportsWideCamera:(BOOL)a4 supportsUltraWideCamera:(BOOL)a5 isUsingWideForFraming:(BOOL)a6 defaultWideZoomFactor:(double)a7 defaultUltraWideZoomFactor:(double)a8
{
  SEL v75 = a2;
  double v74 = a3;
  BOOL v73 = a4;
  BOOL v72 = a5;
  BOOL v71 = a6;
  double v70 = a7;
  double v69 = a8;
  id location = 0LL;
  v68.receiver = self;
  v68.super_class = (Class)&OBJC_CLASS___TVSSCameraLensSwitcherView;
  id location = -[TVSSCameraLensSwitcherView initWithFrame:]( &v68,  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  objc_storeStrong(&location, location);
  if (location)
  {
    *((double *)location + 3) = v74;
    *((_BYTE *)location + 8) = v73;
    *((_BYTE *)location + 9) = v72;
    *((_BYTE *)location + 10) = v71;
    *((double *)location + 8) = v70;
    *((double *)location + 9) = v69;
    objc_initWeak(&from, location);
    v54 = objc_alloc(&OBJC_CLASS___TVSSCameraZoomButton);
    v61 = _NSConcreteStackBlock;
    int v62 = -1073741824;
    int v63 = 0;
    v64 = sub_10003A298;
    v65 = &unk_1001B7578;
    objc_copyWeak(&v66, &from);
    v52 = +[UIAction actionWithHandler:](&OBJC_CLASS___UIAction, "actionWithHandler:", &v61);
    v53 = -[TVSSCameraZoomButton initWithFrame:primaryAction:]( v54,  "initWithFrame:primaryAction:",  CGRectNull.origin.x,  CGRectNull.origin.y,  CGRectNull.size.width,  CGRectNull.size.height);
    v8 = (void *)*((void *)location + 6);
    *((void *)location + 6) = v53;

    if (v71) {
      double v51 = v74;
    }
    else {
      double v51 = v70;
    }
    v60[1] = *(id *)&v51;
    [*((id *)location + 6) setZoomFactor:0 forManualFraming:v51];
    [*((id *)location + 6) setTranslatesAutoresizingMaskIntoConstraints:0];
    char v50 = 1;
    if (v73) {
      char v50 = !v71;
    }
    [*((id *)location + 6) setHidden:v50 & 1];
    v49 = objc_alloc(&OBJC_CLASS___TVSSCameraZoomButton);
    v55 = _NSConcreteStackBlock;
    int v56 = -1073741824;
    int v57 = 0;
    v58 = sub_10003A310;
    v59 = &unk_1001B7578;
    objc_copyWeak(v60, &from);
    v47 = +[UIAction actionWithHandler:](&OBJC_CLASS___UIAction, "actionWithHandler:", &v55);
    v48 = -[TVSSCameraZoomButton initWithFrame:primaryAction:]( v49,  "initWithFrame:primaryAction:",  CGRectNull.origin.x,  CGRectNull.origin.y,  CGRectNull.size.width,  CGRectNull.size.height);
    v9 = (void *)*((void *)location + 7);
    *((void *)location + 7) = v48;

    if (v71) {
      double v46 = v69;
    }
    else {
      double v46 = v74;
    }
    [*((id *)location + 7) setZoomFactor:0 forManualFraming:v46];
    [*((id *)location + 7) setTranslatesAutoresizingMaskIntoConstraints:0];
    char v45 = 1;
    if (v72) {
      char v45 = v71;
    }
    [*((id *)location + 7) setHidden:v45 & 1];
    v44 = objc_alloc_init(&OBJC_CLASS___UIView);
    v10 = (void *)*((void *)location + 4);
    *((void *)location + 4) = v44;

    [*((id *)location + 4) _setCornerRadius:25.0];
    v43 = (void *)*((void *)location + 4);
    v42 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.5);
    objc_msgSend(v43, "setBackgroundColor:");

    [*((id *)location + 4) setAlpha:0.0];
    [*((id *)location + 4) setTranslatesAutoresizingMaskIntoConstraints:0];
    [location addSubview:*((void *)location + 4)];
    v41 = objc_alloc(&OBJC_CLASS___UIStackView);
    v78[0] = *((void *)location + 7);
    v78[1] = *((void *)location + 6);
    v39 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v78, 2LL);
    v40 = -[UIStackView initWithArrangedSubviews:](v41, "initWithArrangedSubviews:");
    v11 = (void *)*((void *)location + 5);
    *((void *)location + 5) = v40;

    [*((id *)location + 5) setTranslatesAutoresizingMaskIntoConstraints:0];
    [*((id *)location + 5) setAxis:0];
    [*((id *)location + 5) setAlignment:3];
    [*((id *)location + 5) setSpacing:10.0];
    [location addSubview:*((void *)location + 5)];
    id v38 = [*((id *)location + 5) leadingAnchor];
    id v37 = [location leadingAnchor];
    id v36 = objc_msgSend(v38, "constraintEqualToAnchor:");
    v77[0] = v36;
    id v35 = [*((id *)location + 5) trailingAnchor];
    id v34 = [location trailingAnchor];
    id v33 = objc_msgSend(v35, "constraintEqualToAnchor:");
    v77[1] = v33;
    id v32 = [*((id *)location + 5) topAnchor];
    id v31 = [location topAnchor];
    id v30 = objc_msgSend(v32, "constraintEqualToAnchor:");
    v77[2] = v30;
    id v29 = [*((id *)location + 5) bottomAnchor];
    id v28 = [location bottomAnchor];
    id v27 = objc_msgSend(v29, "constraintEqualToAnchor:");
    v77[3] = v27;
    id v26 = [*((id *)location + 4) leadingAnchor];
    id v25 = [*((id *)location + 5) leadingAnchor];
    id v24 = objc_msgSend(v26, "constraintEqualToAnchor:constant:", -5.0);
    v77[4] = v24;
    id v23 = [*((id *)location + 4) trailingAnchor];
    id v22 = [*((id *)location + 5) trailingAnchor];
    id v21 = objc_msgSend(v23, "constraintEqualToAnchor:constant:", 5.0);
    v77[5] = v21;
    id v20 = [*((id *)location + 4) topAnchor];
    id v19 = [*((id *)location + 5) topAnchor];
    id v18 = objc_msgSend(v20, "constraintEqualToAnchor:constant:", -5.0);
    v77[6] = v18;
    id v17 = [*((id *)location + 4) bottomAnchor];
    id v16 = [*((id *)location + 5) bottomAnchor];
    id v15 = objc_msgSend(v17, "constraintEqualToAnchor:constant:", 5.0);
    v77[7] = v15;
    v14 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v77, 8LL);
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

    [location _updateButtonSelection];
    objc_destroyWeak(v60);
    objc_destroyWeak(&v66);
    objc_destroyWeak(&from);
  }

  v13 = (TVSSCameraLensSwitcherView *)location;
  objc_storeStrong(&location, 0LL);
  return v13;
}

- (void)layoutSubviews
{
  v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSSCameraLensSwitcherView;
  -[TVSSCameraLensSwitcherView layoutSubviews](&v3, "layoutSubviews");
  platterView = v5->_platterView;
  -[UIView bounds](platterView, "bounds");
  -[UIView _setCornerRadius:](platterView, "_setCornerRadius:", CGRectGetHeight(v6) / 2.0);
}

- (void)updateButtonTitleForWideZoomFactor:(double)a3
{
}

- (void)updateButtonTitleForUltraWideZoomFactor:(double)a3
{
}

- (void)setZoomFactor:(double)a3
{
  if (self->_zoomFactor != a3)
  {
    self->_zoomFactor = a3;
    if (self->_usingWideForFraming)
    {
      -[TVSSCameraLensSwitcherView updateButtonTitleForWideZoomFactor:](self, "updateButtonTitleForWideZoomFactor:", a3);
      -[TVSSCameraLensSwitcherView updateButtonTitleForUltraWideZoomFactor:]( self,  "updateButtonTitleForUltraWideZoomFactor:",  self->_defaultUltraWideZoomFactor);
    }

    else
    {
      -[TVSSCameraLensSwitcherView updateButtonTitleForWideZoomFactor:]( self,  "updateButtonTitleForWideZoomFactor:",  self->_defaultWideZoomFactor);
      -[TVSSCameraLensSwitcherView updateButtonTitleForUltraWideZoomFactor:]( self,  "updateButtonTitleForUltraWideZoomFactor:",  a3);
    }
  }

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v14 = 0LL;
  objc_storeStrong(&v14, a4);
  v13.receiver = v16;
  v13.super_class = (Class)&OBJC_CLASS___TVSSCameraLensSwitcherView;
  -[TVSSCameraLensSwitcherView didUpdateFocusInContext:withAnimationCoordinator:]( &v13,  "didUpdateFocusInContext:withAnimationCoordinator:",  location[0],  v14);
  id v5 = v14;
  CGRect v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  v9 = sub_10003A70C;
  v10 = &unk_1001B61C0;
  id v11 = location[0];
  v12 = v16;
  objc_msgSend(v5, "addCoordinatedAnimations:completion:");
  objc_storeStrong((id *)&v12, 0LL);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)setManuallyFraming:(BOOL)a3
{
  BOOL v4 = a3;
  if (self->_manuallyFraming != a3)
  {
    self->_manuallyFraming = a3;
    if (a3)
    {
      if (-[TVSSCameraLensSwitcherView supportsWideCamera](self, "supportsWideCamera")) {
        -[TVSSCameraZoomButton setHidden:](self->_wideLensButton, "setHidden:", 0LL);
      }
      if (-[TVSSCameraLensSwitcherView supportsUltraWideCamera](self, "supportsUltraWideCamera")) {
        -[TVSSCameraZoomButton setHidden:](self->_ultraWideLensButton, "setHidden:", 0LL);
      }
    }

    else
    {
      if (-[TVSSCameraLensSwitcherView supportsWideCamera](self, "supportsWideCamera")) {
        -[TVSSCameraZoomButton setHidden:](self->_wideLensButton, "setHidden:", !self->_usingWideForFraming);
      }
      if (-[TVSSCameraLensSwitcherView supportsUltraWideCamera](self, "supportsUltraWideCamera")) {
        -[TVSSCameraZoomButton setHidden:](self->_ultraWideLensButton, "setHidden:", self->_usingWideForFraming);
      }
    }

    -[TVSSCameraLensSwitcherView _updatePlatterAnimated:](self, "_updatePlatterAnimated:", 1LL);
    -[TVSSCameraLensSwitcherView _updateButtonSelection](self, "_updateButtonSelection");
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained cameraLensSwitcherViewDidChangeManuallyFraming:v4];
  }

- (void)setUsingWideForFraming:(BOOL)a3
{
  BOOL v4 = a3;
  if (self->_usingWideForFraming != a3)
  {
    self->_usingWideForFraming = a3;
    -[TVSSCameraLensSwitcherView _updateButtonSelection](self, "_updateButtonSelection");
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained cameraLensSwitcherViewDidChangeLensSelection:v4];
  }

- (void)_updateButtonSelection
{
  BOOL manuallyFraming = 0;
  if (self->_usingWideForFraming) {
    BOOL manuallyFraming = self->_manuallyFraming;
  }
  -[TVSSCameraZoomButton setSelected:](self->_wideLensButton, "setSelected:", manuallyFraming);
  BOOL v4 = 0;
  if (!self->_usingWideForFraming) {
    BOOL v4 = self->_manuallyFraming;
  }
  -[TVSSCameraZoomButton setSelected:](self->_ultraWideLensButton, "setSelected:", v4);
  if (self->_usingWideForFraming) {
    double zoomFactor = self->_zoomFactor;
  }
  else {
    double zoomFactor = self->_defaultWideZoomFactor;
  }
  -[TVSSCameraLensSwitcherView updateButtonTitleForWideZoomFactor:]( self,  "updateButtonTitleForWideZoomFactor:",  zoomFactor);
  if (self->_usingWideForFraming) {
    double defaultUltraWideZoomFactor = self->_defaultUltraWideZoomFactor;
  }
  else {
    double defaultUltraWideZoomFactor = self->_zoomFactor;
  }
  -[TVSSCameraLensSwitcherView updateButtonTitleForUltraWideZoomFactor:]( self,  "updateButtonTitleForUltraWideZoomFactor:",  defaultUltraWideZoomFactor);
}

- (void)selectWideLensButton
{
  id v15 = self;
  SEL v14 = a2;
  if (!-[TVSSCameraLensSwitcherView supportsWideCamera](self, "supportsWideCamera"))
  {
    objc_super v13 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[self supportsWideCamera]");
    id v12 = &_os_log_default;
    char v11 = 16;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v12;
      os_log_type_t type = v11;
      int v8 = NSStringFromSelector(v14);
      BOOL v4 = v8;
      v10 = v4;
      v2 = (objc_class *)objc_opt_class(v15);
      int v7 = NSStringFromClass(v2);
      v9 = v7;
      sub_10000583C( (uint64_t)v16,  (uint64_t)v4,  (uint64_t)v9,  (uint64_t)v15,  (uint64_t)@"TVSSCameraLensSwitcherView.m",  223,  (uint64_t)v13);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v16,  0x3Au);

      objc_storeStrong((id *)&v9, 0LL);
      objc_storeStrong((id *)&v10, 0LL);
    }

    objc_storeStrong(&v12, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v13, "UTF8String"));
    __break(0);
    JUMPOUT(0x10003ADD4LL);
  }

  if (v15->_manuallyFraming)
  {
    if (v15->_usingWideForFraming)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&v15->_delegate);
      [WeakRetained cameraLensSwitcherViewDidResetDefaultZoomFactor:v15->_defaultWideZoomFactor];
    }

    else
    {
      -[TVSSCameraLensSwitcherView updateButtonTitleForUltraWideZoomFactor:]( v15,  "updateButtonTitleForUltraWideZoomFactor:",  v15->_defaultUltraWideZoomFactor);
    }
  }

  else
  {
    -[TVSSCameraLensSwitcherView setManuallyFraming:](v15, "setManuallyFraming:", 1LL);
  }

  -[TVSSCameraLensSwitcherView setUsingWideForFraming:](v15, "setUsingWideForFraming:", 1LL);
}

- (void)selectUltraWideLensButton
{
  id v15 = self;
  SEL v14 = a2;
  if (!-[TVSSCameraLensSwitcherView supportsUltraWideCamera](self, "supportsUltraWideCamera"))
  {
    objc_super v13 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[self supportsUltraWideCamera]");
    id v12 = &_os_log_default;
    char v11 = 16;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v12;
      os_log_type_t type = v11;
      int v8 = NSStringFromSelector(v14);
      BOOL v4 = v8;
      v10 = v4;
      v2 = (objc_class *)objc_opt_class(v15);
      int v7 = NSStringFromClass(v2);
      v9 = v7;
      sub_10000583C( (uint64_t)v16,  (uint64_t)v4,  (uint64_t)v9,  (uint64_t)v15,  (uint64_t)@"TVSSCameraLensSwitcherView.m",  248,  (uint64_t)v13);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v16,  0x3Au);

      objc_storeStrong((id *)&v9, 0LL);
      objc_storeStrong((id *)&v10, 0LL);
    }

    objc_storeStrong(&v12, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v13, "UTF8String"));
    __break(0);
    JUMPOUT(0x10003B0B0LL);
  }

  if (v15->_manuallyFraming)
  {
    if (v15->_usingWideForFraming)
    {
      -[TVSSCameraLensSwitcherView updateButtonTitleForWideZoomFactor:]( v15,  "updateButtonTitleForWideZoomFactor:",  v15->_defaultWideZoomFactor);
    }

    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&v15->_delegate);
      [WeakRetained cameraLensSwitcherViewDidResetDefaultZoomFactor:v15->_defaultUltraWideZoomFactor];
    }
  }

  else
  {
    -[TVSSCameraLensSwitcherView setManuallyFraming:](v15, "setManuallyFraming:", 1LL);
  }

  -[TVSSCameraLensSwitcherView setUsingWideForFraming:](v15, "setUsingWideForFraming:", 0LL);
}

- (void)setContainsFocusedButton:(BOOL)a3
{
  self->_containsFocusedButton = a3;
  -[TVSSCameraLensSwitcherView _updatePlatterAnimated:](self, "_updatePlatterAnimated:", 0LL);
}

- (void)_updatePlatterAnimated:(BOOL)a3
{
  id v12 = self;
  SEL v11 = a2;
  BOOL v10 = a3;
  objc_super v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  CGRect v6 = sub_10003B2F4;
  int v7 = &unk_1001B5A60;
  int v8 = self;
  id location = objc_retainBlock(&v3);
  if (v10) {
    +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", location, 0.2);
  }
  else {
    (*((void (**)(void))location + 2))();
  }
  objc_storeStrong(&location, 0LL);
  objc_storeStrong((id *)&v8, 0LL);
}

- (TVSSCameraLensSwitcherViewDelegate)delegate
{
  return (TVSSCameraLensSwitcherViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (double)zoomFactor
{
  return self->_zoomFactor;
}

- (BOOL)supportsWideCamera
{
  return self->_supportsWideCamera;
}

- (BOOL)supportsUltraWideCamera
{
  return self->_supportsUltraWideCamera;
}

- (BOOL)isUsingWideForFraming
{
  return self->_usingWideForFraming;
}

- (BOOL)isManuallyFraming
{
  return self->_manuallyFraming;
}

- (UIView)platterView
{
  return self->_platterView;
}

- (void)setPlatterView:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (TVSSCameraZoomButton)wideLensButton
{
  return self->_wideLensButton;
}

- (void)setWideLensButton:(id)a3
{
}

- (TVSSCameraZoomButton)ultraWideLensButton
{
  return self->_ultraWideLensButton;
}

- (void)setUltraWideLensButton:(id)a3
{
}

- (double)defaultWideZoomFactor
{
  return self->_defaultWideZoomFactor;
}

- (double)defaultUltraWideZoomFactor
{
  return self->_defaultUltraWideZoomFactor;
}

- (BOOL)containsFocusedButton
{
  return self->_containsFocusedButton;
}

- (void).cxx_destruct
{
}

@end