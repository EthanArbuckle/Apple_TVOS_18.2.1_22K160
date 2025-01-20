@interface PBPIPAvoidanceController
- (BSCompoundAssertion)pausedCompoundAssertion;
- (CGRect)pictureInPictureFrame;
- (PBOverlayLayoutController)pipController;
- (PBOverlayLayoutCoordinator)layoutCoordinator;
- (PBPIPAvoidanceController)init;
- (PBPIPAvoidanceController)initWithParentLayoutCoordinator:(id)a3;
- (PBPIPAvoidanceController)initWithParentLayoutCoordinator:(id)a3 pictureInPictureMargin:(CGSize)a4;
- (PBPIPAvoidanceControllerDelegate)delegate;
- (PBPIPOverlayInsetsReporter)overlayInsetsReporter;
- (PBSOverlayLayoutElement)pipElement;
- (PBSOverlayLayoutElementHint)pictureInPictureHint;
- (id)pauseUpdatesForReason:(id)a3;
- (id)setPictureInPictureFrame:(CGRect)a3;
- (os_unfair_lock_s)lock;
- (void)_handlePausedCompoundAssertionStateChange:(id)a3;
- (void)dealloc;
- (void)layoutController:(id)a3 didUpdateHints:(id)a4 withTransitionContext:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation PBPIPAvoidanceController

- (PBPIPAvoidanceController)initWithParentLayoutCoordinator:(id)a3 pictureInPictureMargin:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___PBPIPAvoidanceController;
  v8 = -[PBPIPAvoidanceController init](&v37, "init");
  if (v8)
  {
    v9 = -[PBOverlayLayoutCoordinator initWithParentLayoutCoordinator:]( objc_alloc(&OBJC_CLASS___PBOverlayLayoutCoordinator),  "initWithParentLayoutCoordinator:",  v7);
    layoutCoordinator = v8->_layoutCoordinator;
    v8->_layoutCoordinator = v9;

    double v11 = sub_100026C70(width, height);
    v15 = -[PBPIPOverlayInsetsReporter initWithLayoutCoordinator:insetsAdjustment:]( objc_alloc(&OBJC_CLASS___PBPIPOverlayInsetsReporter),  "initWithLayoutCoordinator:insetsAdjustment:",  v8->_layoutCoordinator,  v11,  v12,  v13,  v14);
    overlayInsetsReporter = v8->_overlayInsetsReporter;
    v8->_overlayInsetsReporter = v15;

    v17 = -[PBOverlayLayoutController initWithLayoutCoordinator:name:]( objc_alloc(&OBJC_CLASS___PBOverlayLayoutController),  "initWithLayoutCoordinator:name:",  v8->_layoutCoordinator,  @"com.apple.PineBoard.pip.pictureInPicture");
    pipController = v8->_pipController;
    v8->_pipController = v17;

    -[PBOverlayLayoutController setDelegate:](v8->_pipController, "setDelegate:", v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[PBSOverlayLayoutElementIdentifier identifierWithString:]( &OBJC_CLASS___PBSOverlayLayoutElementIdentifier,  "identifierWithString:",  @"com.apple.PineBoard.pip.pictureInPicture"));
    v20 = -[PBSOverlayLayoutElement initWithIdentifier:layoutLevel:]( objc_alloc(&OBJC_CLASS___PBSOverlayLayoutElement),  "initWithIdentifier:layoutLevel:",  v19,  10LL);
    pipElement = v8->_pipElement;
    v8->_pipElement = v20;

    -[PBSOverlayLayoutElement setStickiness:]( v8->_pipElement,  "setStickiness:",  PBSOverlayLayoutElementStickinessPictureInPicture[0],  PBSOverlayLayoutElementStickinessPictureInPicture[1]);
    -[PBSOverlayLayoutElement setSymmetricalMargin:](v8->_pipElement, "setSymmetricalMargin:", width, height);
    objc_initWeak(&location, v8);
    v22 = (objc_class *)objc_opt_class(v8);
    v23 = NSStringFromClass(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v31 = _NSConcreteStackBlock;
    uint64_t v32 = 3221225472LL;
    v33 = sub_10006B54C;
    v34 = &unk_1003D1970;
    objc_copyWeak(&v35, &location);
    uint64_t v25 = objc_claimAutoreleasedReturnValue( +[BSCompoundAssertion assertionWithIdentifier:stateDidChangeHandler:]( &OBJC_CLASS___BSCompoundAssertion,  "assertionWithIdentifier:stateDidChangeHandler:",  v24,  &v31));
    pausedCompoundAssertion = v8->_pausedCompoundAssertion;
    v8->_pausedCompoundAssertion = (BSCompoundAssertion *)v25;

    v27 = v8->_pausedCompoundAssertion;
    id v28 = sub_1000F730C();
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    -[BSCompoundAssertion setLog:](v27, "setLog:", v29, v31, v32, v33, v34);

    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (PBPIPAvoidanceController)initWithParentLayoutCoordinator:(id)a3
{
  return -[PBPIPAvoidanceController initWithParentLayoutCoordinator:pictureInPictureMargin:]( self,  "initWithParentLayoutCoordinator:pictureInPictureMargin:",  a3,  20.0,  40.0);
}

- (PBPIPAvoidanceController)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[PBOverlayLayoutCoordinator defaultCoordinator]( &OBJC_CLASS___PBOverlayLayoutCoordinator,  "defaultCoordinator"));
  v4 = -[PBPIPAvoidanceController initWithParentLayoutCoordinator:](self, "initWithParentLayoutCoordinator:", v3);

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBPIPAvoidanceController;
  -[PBPIPAvoidanceController dealloc](&v3, "dealloc");
}

- (PBPIPAvoidanceControllerDelegate)delegate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0x10000LL);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lock_delegate);
  os_unfair_lock_unlock(p_lock);
  return (PBPIPAvoidanceControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options(p_lock, 0x10000LL);
  objc_storeWeak((id *)&self->_lock_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (CGRect)pictureInPictureFrame
{
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)setPictureInPictureFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[PBSOverlayLayoutElement frame](self->_pipElement, "frame");
  v16.origin.double x = x;
  v16.origin.double y = y;
  v16.size.double width = width;
  v16.size.double height = height;
  if (CGRectEqualToRect(v15, v16))
  {
    os_unfair_lock_lock_with_options(&self->_lock, 0x10000LL);
    v9 = self->_lock_lastPIPElementHint;
    os_unfair_lock_unlock(&self->_lock);
    return v9;
  }

  -[PBSOverlayLayoutElement setFrame:](self->_pipElement, "setFrame:", x, y, width, height);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[PBSOverlayLayoutBatchUpdate batchUpdateWithUpdatedElement:]( &OBJC_CLASS___PBSOverlayLayoutBatchUpdate,  "batchUpdateWithUpdatedElement:",  self->_pipElement));
  double v11 = (void *)objc_claimAutoreleasedReturnValue( -[PBOverlayLayoutController performBatchUpdate:withTransitionContext:]( self->_pipController,  "performBatchUpdate:withTransitionContext:",  v10,  0LL));
  if ((unint64_t)[v11 count] < 2)
  {
    double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 firstObject]);
    v9 = (PBSOverlayLayoutElementHint *)[v12 copy];

    os_unfair_lock_lock_with_options(&self->_lock, 0x10000LL);
    objc_storeStrong((id *)&self->_lock_lastPIPElementHint, v9);
    os_unfair_lock_unlock(&self->_lock);

    return v9;
  }

  double v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"controller manages exactly one element"));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100276394(a2);
  }
  id result = (id) _bs_set_crash_log_message([v14 UTF8String]);
  __break(0);
  return result;
}

- (PBSOverlayLayoutElementHint)pictureInPictureHint
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0x10000LL);
  double v4 = self->_lock_lastPIPElementHint;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)pauseUpdatesForReason:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue( -[BSCompoundAssertion acquireForReason:]( self->_pausedCompoundAssertion,  "acquireForReason:",  a3));
}

- (void)layoutController:(id)a3 didUpdateHints:(id)a4 withTransitionContext:(id)a5
{
  v9 = (PBOverlayLayoutController *)a3;
  id v10 = a4;
  id v11 = a5;
  if (self->_pipController != v9)
  {
    CGRect v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"controller == _pipController"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002764EC(a2);
    }
LABEL_11:
    _bs_set_crash_log_message([v16 UTF8String]);
    __break(0);
    JUMPOUT(0x10006BA80LL);
  }

  double v12 = v11;
  if ([v10 count] != (id)1)
  {
    CGRect v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"controller manages exactly one element"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100276440(a2);
    }
    goto LABEL_11;
  }

  double v13 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);
  id v14 = [v13 copy];

  os_unfair_lock_lock_with_options(&self->_lock, 0x10000LL);
  objc_storeStrong((id *)&self->_lock_lastPIPElementHint, v14);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lock_delegate);
  os_unfair_lock_unlock(&self->_lock);
  if ((-[BSCompoundAssertion isActive](self->_pausedCompoundAssertion, "isActive") & 1) == 0)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10006BADC;
    v17[3] = &unk_1003D1998;
    v17[4] = WeakRetained;
    v17[5] = self;
    v17[6] = v14;
    id v18 = v12;
    BSDispatchMain(v17);
  }
}

- (void)_handlePausedCompoundAssertionStateChange:(id)a3
{
  if (([a3 isActive] & 1) == 0)
  {
    os_unfair_lock_lock_with_options(&self->_lock, 0x10000LL);
    double v4 = self->_lock_lastPIPElementHint;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_lock_delegate);
    os_unfair_lock_unlock(&self->_lock);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10006BBAC;
    v6[3] = &unk_1003D09B8;
    v6[4] = WeakRetained;
    v6[5] = self;
    v6[6] = v4;
    BSDispatchMain(v6);
  }

- (PBPIPOverlayInsetsReporter)overlayInsetsReporter
{
  return self->_overlayInsetsReporter;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (PBOverlayLayoutCoordinator)layoutCoordinator
{
  return self->_layoutCoordinator;
}

- (PBOverlayLayoutController)pipController
{
  return self->_pipController;
}

- (PBSOverlayLayoutElement)pipElement
{
  return self->_pipElement;
}

- (BSCompoundAssertion)pausedCompoundAssertion
{
  return self->_pausedCompoundAssertion;
}

- (void).cxx_destruct
{
}

@end