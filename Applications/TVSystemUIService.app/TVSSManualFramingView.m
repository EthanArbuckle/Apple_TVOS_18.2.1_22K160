@interface TVSSManualFramingView
- (BOOL)isManualFramingControlsHidden;
- (BOOL)isManuallyFraming;
- (BOOL)isUsingWideForFraming;
- (NSLayoutConstraint)lensSwitcherBottomConstraint;
- (TVSSCameraFramingButton)oneShotFramingButton;
- (TVSSCameraLensSwitcherView)lensSwitcherView;
- (TVSSCameraZoomAdjustmentControl)zoomAdjustmentControl;
- (TVSSManualFramingView)initWithCurrentZoomFactor:(double)a3 minZoomFactor:(double)a4 maxZoomFactor:(double)a5 defaultWideZoomFactor:(double)a6 defaultUltraWideZoomFactor:(double)a7 supportsWideCamera:(BOOL)a8 supportsUltraWideCamera:(BOOL)a9 isUsingWideForFraming:(BOOL)a10;
- (TVSSManualFramingViewDelegate)delegate;
- (TVSSVideoPreviewView)previewView;
- (UITapGestureRecognizer)menuGestureRecognizer;
- (double)zoomFactor;
- (id)preferredFocusEnvironments;
- (void)_menuPressed:(id)a3;
- (void)cameraLensSwitcherViewDidChangeLensSelection:(BOOL)a3;
- (void)cameraLensSwitcherViewDidChangeManuallyFraming:(BOOL)a3;
- (void)cameraLensSwitcherViewDidResetDefaultZoomFactor:(double)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)enqueueSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)selectOneShotFraming;
- (void)setDelegate:(id)a3;
- (void)setLensSwitcherBottomConstraint:(id)a3;
- (void)setLensSwitcherView:(id)a3;
- (void)setManualFramingControlsHidden:(BOOL)a3;
- (void)setManuallyFraming:(BOOL)a3;
- (void)setMenuGestureRecognizer:(id)a3;
- (void)setOneShotFramingButton:(id)a3;
- (void)setPreviewView:(id)a3;
- (void)setUsingWideForFraming:(BOOL)a3;
- (void)setZoomAdjustmentControl:(id)a3;
- (void)setZoomFactor:(double)a3;
- (void)setZoomFactor:(double)a3 minZoomFactor:(double)a4 maxZoomFactor:(double)a5;
- (void)toggleTransform:(BOOL)a3;
- (void)updateConstraints;
- (void)zoomSliderValueChanged:(id)a3;
@end

@implementation TVSSManualFramingView

- (TVSSManualFramingView)initWithCurrentZoomFactor:(double)a3 minZoomFactor:(double)a4 maxZoomFactor:(double)a5 defaultWideZoomFactor:(double)a6 defaultUltraWideZoomFactor:(double)a7 supportsWideCamera:(BOOL)a8 supportsUltraWideCamera:(BOOL)a9 isUsingWideForFraming:(BOOL)a10
{
  SEL v88 = a2;
  double v87 = a3;
  double v86 = a4;
  double v85 = a5;
  double v84 = a6;
  double v83 = a7;
  BOOL v82 = a8;
  BOOL v81 = a9;
  BOOL v80 = a10;
  id location = 0LL;
  v79.receiver = self;
  v79.super_class = (Class)&OBJC_CLASS___TVSSManualFramingView;
  id location = -[TVSSManualFramingView initWithFrame:]( &v79,  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  objc_storeStrong(&location, location);
  if (location)
  {
    v71 = objc_alloc_init(&OBJC_CLASS___TVSSVideoPreviewView);
    v10 = (void *)*((void *)location + 4);
    *((void *)location + 4) = v71;

    [*((id *)location + 4) setTranslatesAutoresizingMaskIntoConstraints:0];
    [location addSubview:*((void *)location + 4)];
    id v70 = [*((id *)location + 4) leadingAnchor];
    id v69 = [location leadingAnchor];
    id v68 = objc_msgSend(v70, "constraintEqualToAnchor:");
    v93[0] = v68;
    id v67 = [*((id *)location + 4) trailingAnchor];
    id v66 = [location trailingAnchor];
    id v65 = objc_msgSend(v67, "constraintEqualToAnchor:");
    v93[1] = v65;
    id v64 = [*((id *)location + 4) topAnchor];
    id v63 = [location topAnchor];
    id v62 = objc_msgSend(v64, "constraintEqualToAnchor:");
    v93[2] = v62;
    id v61 = [*((id *)location + 4) bottomAnchor];
    id v60 = [location bottomAnchor];
    id v59 = objc_msgSend(v61, "constraintEqualToAnchor:");
    v93[3] = v59;
    v58 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v93, 4LL);
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

    v57 = objc_alloc(&OBJC_CLASS___TVSSCameraLensSwitcherView);
    v56 = -[TVSSCameraLensSwitcherView initWithCurrentZoomFactor:supportsWideCamera:supportsUltraWideCamera:isUsingWideForFraming:defaultWideZoomFactor:defaultUltraWideZoomFactor:]( v57,  "initWithCurrentZoomFactor:supportsWideCamera:supportsUltraWideCamera:isUsingWideForFraming:defaultWideZoomFa ctor:defaultUltraWideZoomFactor:",  v82,  v81,  v80,  v87,  v84,  v83);
    v11 = (void *)*((void *)location + 6);
    *((void *)location + 6) = v56;

    [*((id *)location + 6) setTranslatesAutoresizingMaskIntoConstraints:0];
    [*((id *)location + 6) setDelegate:location];
    [location addSubview:*((void *)location + 6)];
    id v55 = [*((id *)location + 6) bottomAnchor];
    id v54 = [location bottomAnchor];
    id v12 = objc_msgSend(v55, "constraintEqualToAnchor:constant:", -24.0);
    v13 = (void *)*((void *)location + 8);
    *((void *)location + 8) = v12;

    id v53 = [*((id *)location + 6) centerXAnchor];
    id v52 = [location centerXAnchor];
    id v51 = objc_msgSend(v53, "constraintEqualToAnchor:");
    v92[0] = v51;
    v92[1] = *((void *)location + 8);
    v50 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v92, 2LL);
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

    objc_initWeak(&from, location);
    v49 = objc_alloc(&OBJC_CLASS___TVSSCameraFramingButton);
    v72 = _NSConcreteStackBlock;
    int v73 = -1073741824;
    int v74 = 0;
    v75 = sub_100093044;
    v76 = &unk_1001B7578;
    objc_copyWeak(&v77, &from);
    v47 = +[UIAction actionWithHandler:](&OBJC_CLASS___UIAction, "actionWithHandler:", &v72);
    v48 = -[TVSSCameraFramingButton initWithFrame:primaryAction:]( v49,  "initWithFrame:primaryAction:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
    v14 = (void *)*((void *)location + 5);
    *((void *)location + 5) = v48;

    [*((id *)location + 5) setTranslatesAutoresizingMaskIntoConstraints:0];
    [location addSubview:*((void *)location + 5)];
    id v46 = [*((id *)location + 5) leadingAnchor];
    id v45 = [location leadingAnchor];
    id v44 = objc_msgSend(v46, "constraintEqualToAnchor:constant:", 24.0);
    v91[0] = v44;
    id v43 = [*((id *)location + 5) trailingAnchor];
    id v42 = [*((id *)location + 6) leadingAnchor];
    id v41 = objc_msgSend(v43, "constraintLessThanOrEqualToAnchor:constant:", -24.0);
    v91[1] = v41;
    id v40 = [*((id *)location + 5) centerYAnchor];
    id v39 = [*((id *)location + 6) centerYAnchor];
    id v38 = objc_msgSend(v40, "constraintEqualToAnchor:");
    v91[2] = v38;
    v37 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v91, 3LL);
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

    if (v86 < v85)
    {
      v36 = objc_alloc_init(&OBJC_CLASS___TVSSCameraZoomAdjustmentControl);
      v15 = (void *)*((void *)location + 7);
      *((void *)location + 7) = v36;

      [*((id *)location + 7) setMinimumValue:v86];
      [*((id *)location + 7) setMaximumValue:v85];
      [*((id *)location + 7) setValue:v87];
      [*((id *)location + 7) setContinuous:1];
      [*((id *)location + 7) setTranslatesAutoresizingMaskIntoConstraints:0];
      [*((id *)location + 7) addTarget:location action:"zoomSliderValueChanged:" forControlEvents:4096];
      [*((id *)location + 7) setHidden:1];
      [location addSubview:*((void *)location + 7)];
      id v35 = [*((id *)location + 7) leadingAnchor];
      id v34 = [location leadingAnchor];
      id v33 = objc_msgSend(v35, "constraintEqualToAnchor:constant:", 24.0);
      v90[0] = v33;
      id v32 = [*((id *)location + 7) trailingAnchor];
      id v31 = [location trailingAnchor];
      id v30 = objc_msgSend(v32, "constraintEqualToAnchor:constant:", -24.0);
      v90[1] = v30;
      id v29 = [*((id *)location + 7) centerXAnchor];
      id v28 = [location centerXAnchor];
      id v27 = objc_msgSend(v29, "constraintEqualToAnchor:");
      v90[2] = v27;
      id v26 = [*((id *)location + 7) bottomAnchor];
      id v25 = [location bottomAnchor];
      id v24 = objc_msgSend(v26, "constraintEqualToAnchor:constant:", -4.0);
      v90[3] = v24;
      id v23 = [*((id *)location + 7) heightAnchor];
      id v22 = [v23 constraintEqualToConstant:24.0];
      v90[4] = v22;
      v21 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v90, 5LL);
      +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");
    }

    v20 = objc_alloc(&OBJC_CLASS___UITapGestureRecognizer);
    v19 = -[UITapGestureRecognizer initWithTarget:action:](v20, "initWithTarget:action:", location, "_menuPressed:");
    v16 = (void *)*((void *)location + 9);
    *((void *)location + 9) = v19;

    [*((id *)location + 9) setAllowedPressTypes:&off_1001C8600];
    [*((id *)location + 9) setEnabled:0];
    [location addGestureRecognizer:*((void *)location + 9)];
    objc_destroyWeak(&v77);
    objc_destroyWeak(&from);
  }

  v18 = (TVSSManualFramingView *)location;
  objc_storeStrong(&location, 0LL);
  return v18;
}

- (void)updateConstraints
{
  v6 = self;
  SEL v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSSManualFramingView;
  -[TVSSManualFramingView updateConstraints](&v4, "updateConstraints");
  unsigned __int8 v3 = 0;
  if (v6->_zoomAdjustmentControl) {
    unsigned __int8 v3 = -[TVSSCameraZoomAdjustmentControl isHidden](v6->_zoomAdjustmentControl, "isHidden");
  }
  if ((v3 & 1) != 0) {
    double v2 = 24.0;
  }
  else {
    double v2 = 5.0 + 34.0;
  }
  -[NSLayoutConstraint setConstant:](v6->_lensSwitcherBottomConstraint, "setConstant:", -v2);
}

- (id)preferredFocusEnvironments
{
  v3[0] = self->_oneShotFramingButton;
  v3[1] = self->_lensSwitcherView;
  return +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v3, 2LL);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v10 = 0LL;
  objc_storeStrong(&v10, a4);
  id v9 = -[TVSSManualFramingView delegate](v12, "delegate");
  if ((objc_opt_respondsToSelector(v9, "didUpdateFocusOnZoomControl:") & 1) != 0)
  {
    objc_super v4 = (TVSSCameraZoomAdjustmentControl *)[location[0] nextFocusedView];
    BOOL v7 = v4 != v12->_zoomAdjustmentControl;

    if (v7)
    {
      SEL v5 = (TVSSCameraZoomAdjustmentControl *)[location[0] previouslyFocusedView];
      BOOL v6 = v5 != v12->_zoomAdjustmentControl;

      if (!v6) {
        [v9 didUpdateFocusOnZoomControl:0];
      }
    }

    else
    {
      [v9 didUpdateFocusOnZoomControl:1];
    }
  }

  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_menuPressed:(id)a3
{
  objc_super v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if ([location[0] state] == (id)3) {
    -[TVSSCameraLensSwitcherView setManuallyFraming:](v4->_lensSwitcherView, "setManuallyFraming:", 0LL);
  }
  objc_storeStrong(location, 0LL);
}

- (void)enqueueSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  if (a3)
  {
    id v4 = -[TVSSVideoPreviewView layer](self->_previewView, "layer");
    id v3 = [v4 sampleBufferRenderer];
    [v3 enqueueSampleBuffer:a3];
  }

- (void)toggleTransform:(BOOL)a3
{
  v16 = self;
  SEL v15 = a2;
  BOOL v14 = a3;
  id v6 = -[TVSSVideoPreviewView layer](self->_previewView, "layer");
  if (v6) {
    [v6 affineTransform];
  }
  else {
    memset(&__b, 0, sizeof(__b));
  }
  BOOL v5 = !CGAffineTransformIsIdentity(&__b);

  BOOL v13 = v5;
  if (v14)
  {
    if (!v13)
    {
      memcpy(&__dst, &CGAffineTransformIdentity, sizeof(__dst));
      CGAffineTransformRotate(&v10, &__dst, 0.0);
      CGAffineTransformScale(&v11, &v10, -1.0, 1.0);
      id v4 = -[TVSSVideoPreviewView layer](v16->_previewView, "layer");
      memcpy(v8, &v11, sizeof(v8));
      [v4 setAffineTransform:v8];
    }
  }

  else if (v13)
  {
    id v3 = -[TVSSVideoPreviewView layer](v16->_previewView, "layer");
    memcpy(v7, &CGAffineTransformIdentity, sizeof(v7));
    [v3 setAffineTransform:v7];
  }

- (void)setManualFramingControlsHidden:(BOOL)a3
{
  if (self->_manualFramingControlsHidden != a3)
  {
    self->_manualFramingControlsHidden = a3;
    if (a3)
    {
      -[TVSSCameraFramingButton setHidden:](self->_oneShotFramingButton, "setHidden:", 1LL);
      -[TVSSCameraLensSwitcherView setHidden:](self->_lensSwitcherView, "setHidden:", 1LL);
      -[TVSSCameraZoomAdjustmentControl setHidden:](self->_zoomAdjustmentControl, "setHidden:", 1LL);
    }

    else
    {
      -[TVSSCameraFramingButton setHidden:](self->_oneShotFramingButton, "setHidden:", 0LL);
      -[TVSSCameraLensSwitcherView setHidden:](self->_lensSwitcherView, "setHidden:", 0LL);
    }

    -[TVSSCameraLensSwitcherView setManuallyFraming:](self->_lensSwitcherView, "setManuallyFraming:", 0LL);
  }

- (void)setUsingWideForFraming:(BOOL)a3
{
}

- (BOOL)isUsingWideForFraming
{
  return -[TVSSCameraLensSwitcherView isUsingWideForFraming](self->_lensSwitcherView, "isUsingWideForFraming", a2, self);
}

- (void)selectOneShotFraming
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained manualFramingViewDidTriggerOneShotFraming];
}

- (void)setZoomFactor:(double)a3
{
  if (self->_zoomFactor != a3)
  {
    self->_zoomFactor = a3;
    -[TVSSCameraZoomAdjustmentControl setValue:](self->_zoomAdjustmentControl, "setValue:", a3);
    -[TVSSCameraLensSwitcherView setZoomFactor:](self->_lensSwitcherView, "setZoomFactor:", a3);
  }

- (void)setZoomFactor:(double)a3 minZoomFactor:(double)a4 maxZoomFactor:(double)a5
{
}

- (void)zoomSliderValueChanged:(id)a3
{
  BOOL v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&v5->_delegate);
  [location[0] value];
  objc_msgSend(WeakRetained, "manualFramingViewDidChangeZoomFactor:");

  objc_storeStrong(location, 0LL);
}

- (void)cameraLensSwitcherViewDidChangeLensSelection:(BOOL)a3
{
  BOOL v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained manualFramingViewDidChangeLensSelection:v4];
}

- (void)cameraLensSwitcherViewDidChangeManuallyFraming:(BOOL)a3
{
  CGAffineTransform v11 = self;
  SEL v10 = a2;
  BOOL v9 = a3;
  if (a3)
  {
    -[TVSSCameraZoomAdjustmentControl setNeedsLayout](v11->_zoomAdjustmentControl, "setNeedsLayout");
    -[TVSSCameraZoomAdjustmentControl layoutIfNeeded](v11->_zoomAdjustmentControl, "layoutIfNeeded");
    -[TVSSCameraZoomAdjustmentControl setHidden:](v11->_zoomAdjustmentControl, "setHidden:", 0LL);
    -[UITapGestureRecognizer setEnabled:](v11->_menuGestureRecognizer, "setEnabled:", 1LL);
  }

  else
  {
    -[TVSSCameraZoomAdjustmentControl setHidden:](v11->_zoomAdjustmentControl, "setHidden:", 1LL);
    -[UITapGestureRecognizer setEnabled:](v11->_menuGestureRecognizer, "setEnabled:", 0LL);
  }

  -[TVSSManualFramingView updateConstraints](v11, "updateConstraints");
  id v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  id v6 = sub_100093C5C;
  BOOL v7 = &unk_1001B5A60;
  v8 = v11;
  +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:",  0LL,  &v3,  &stru_1001B9578,  0.4,  0.0,  2.0);
  objc_storeStrong((id *)&v8, 0LL);
}

- (void)cameraLensSwitcherViewDidResetDefaultZoomFactor:(double)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained manualFramingViewDidChangeZoomFactor:a3];
}

- (TVSSManualFramingViewDelegate)delegate
{
  return (TVSSManualFramingViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (double)zoomFactor
{
  return self->_zoomFactor;
}

- (BOOL)isManualFramingControlsHidden
{
  return self->_manualFramingControlsHidden;
}

- (TVSSVideoPreviewView)previewView
{
  return self->_previewView;
}

- (void)setPreviewView:(id)a3
{
}

- (TVSSCameraFramingButton)oneShotFramingButton
{
  return self->_oneShotFramingButton;
}

- (void)setOneShotFramingButton:(id)a3
{
}

- (TVSSCameraLensSwitcherView)lensSwitcherView
{
  return self->_lensSwitcherView;
}

- (void)setLensSwitcherView:(id)a3
{
}

- (TVSSCameraZoomAdjustmentControl)zoomAdjustmentControl
{
  return self->_zoomAdjustmentControl;
}

- (void)setZoomAdjustmentControl:(id)a3
{
}

- (NSLayoutConstraint)lensSwitcherBottomConstraint
{
  return self->_lensSwitcherBottomConstraint;
}

- (void)setLensSwitcherBottomConstraint:(id)a3
{
}

- (UITapGestureRecognizer)menuGestureRecognizer
{
  return self->_menuGestureRecognizer;
}

- (void)setMenuGestureRecognizer:(id)a3
{
}

- (BOOL)isManuallyFraming
{
  return self->_manuallyFraming;
}

- (void)setManuallyFraming:(BOOL)a3
{
  self->_manuallyFraming = a3;
}

- (void).cxx_destruct
{
}

@end