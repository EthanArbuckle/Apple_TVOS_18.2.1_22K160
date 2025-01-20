@interface PBHotBlackManager
+ (PBDependencyDescription)dependencyDescription;
+ (id)sharedInstance;
- (BOOL)_dismiss;
- (BOOL)isPresenting;
- (BSCompoundAssertion)presentationCompoundAssertion;
- (BSInvalidatable)proceduralPresentationAssertion;
- (PBBulletinPausedAssertion)welcomeBackPauseBulletinsAssertion;
- (PBHotBlackManager)init;
- (PBSystemOverlayController)overlayController;
- (id)acquirePresentationAssertionForReason:(id)a3;
- (void)_presentWithActivityIndicator:(BOOL)a3;
- (void)_presentWithStyle:(int64_t)a3;
- (void)_updatePresentationUsingAssertionState:(id)a3;
- (void)dealloc;
- (void)dismiss;
- (void)displayState:(id)a3 didChangeWithConnection:(int64_t)a4;
- (void)overlayController:(id)a3 didDismissSession:(id)a4;
- (void)powerManager:(id)a3 willWakeSystemWithReason:(int64_t)a4 completion:(id)a5;
- (void)present;
- (void)presentWithActivityIndicator;
@end

@implementation PBHotBlackManager

+ (PBDependencyDescription)dependencyDescription
{
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000984D4;
  v14[3] = &unk_1003CFF78;
  v14[4] = a1;
  v2 = -[PBDependencyDescription initWithInstanceProvider:]( objc_alloc(&OBJC_CLASS___PBDependencyDescription),  "initWithInstanceProvider:",  v14);
  uint64_t v4 = objc_opt_self(&OBJC_CLASS___PBDisplayManager, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v15[0] = v5;
  uint64_t v7 = objc_opt_self(&OBJC_CLASS___PBPowerManager, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v15[1] = v8;
  uint64_t v10 = objc_opt_self(&OBJC_CLASS___PBWindowManager, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v15[2] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 3LL));
  -[PBDependencyDescription addDependencies:](v2, "addDependencies:", v12);

  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009856C;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_100470848 != -1) {
    dispatch_once(&qword_100470848, block);
  }
  return (id)qword_100470840;
}

- (PBHotBlackManager)init
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___PBHotBlackManager;
  v2 = -[PBHotBlackManager init](&v17, "init");
  if (v2)
  {
    objc_initWeak(&location, v2);
    uint64_t v3 = (objc_class *)objc_opt_class(v2);
    uint64_t v4 = NSStringFromClass(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10009871C;
    v14[3] = &unk_1003D1970;
    objc_copyWeak(&v15, &location);
    uint64_t v6 = objc_claimAutoreleasedReturnValue( +[BSCompoundAssertion assertionWithIdentifier:stateDidChangeHandler:]( &OBJC_CLASS___BSCompoundAssertion,  "assertionWithIdentifier:stateDidChangeHandler:",  v5,  v14));
    presentationCompoundAssertion = v2->_presentationCompoundAssertion;
    v2->_presentationCompoundAssertion = (BSCompoundAssertion *)v6;

    v8 = v2->_presentationCompoundAssertion;
    id v9 = sub_1000F6FC4();
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    -[BSCompoundAssertion setLog:](v8, "setLog:", v10);

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10009875C;
    v12[3] = &unk_1003D0FA8;
    v13 = v2;
    +[PBDependencyCoordinator registerInstance:dependencyBlock:]( &OBJC_CLASS___PBDependencyCoordinator,  "registerInstance:dependencyBlock:",  v13,  v12);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)dealloc
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBDisplayManager sharedInstance](&OBJC_CLASS___PBDisplayManager, "sharedInstance"));
  [v3 removeStateObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PBHotBlackManager;
  -[PBHotBlackManager dealloc](&v4, "dealloc");
}

- (BOOL)isPresenting
{
  return -[PBSystemOverlayController hasActivePresentation](self->_overlayController, "hasActivePresentation");
}

- (void)present
{
}

- (void)presentWithActivityIndicator
{
}

- (id)acquirePresentationAssertionForReason:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue( -[BSCompoundAssertion acquireForReason:withContext:]( self->_presentationCompoundAssertion,  "acquireForReason:withContext:",  a3,  &off_1003FD9F8));
}

- (void)dismiss
{
  proceduralPresentationAssertion = self->_proceduralPresentationAssertion;
  self->_proceduralPresentationAssertion = 0LL;
}

- (void)_presentWithActivityIndicator:(BOOL)a3
{
  BOOL v4 = a3;
  presentationCompoundAssertion = self->_presentationCompoundAssertion;
  uint64_t v6 = self->_proceduralPresentationAssertion;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v4));
  v8 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue( -[BSCompoundAssertion acquireForReason:withContext:]( presentationCompoundAssertion,  "acquireForReason:withContext:",  @"ProceduralPresentation",  v7));
  proceduralPresentationAssertion = self->_proceduralPresentationAssertion;
  self->_proceduralPresentationAssertion = v8;

  -[BSInvalidatable invalidate](v6, "invalidate");
}

- (void)_presentWithStyle:(int64_t)a3
{
  v5 = objc_alloc_init(&OBJC_CLASS___PBMutableSystemOverlayPresentationRequest);
  uint64_t v6 = (objc_class *)objc_opt_class(self);
  uint64_t v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[PBMutableSystemOverlayPresentationRequest setIdentifier:](v5, "setIdentifier:", v8);

  -[PBMutableSystemOverlayPresentationRequest setAnimated:](v5, "setAnimated:", 0LL);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100098B14;
  v12[3] = &unk_1003D4758;
  void v12[4] = a3;
  id v9 = -[PBBlockSystemOverlayUIProvider initWithBlock:]( objc_alloc(&OBJC_CLASS___PBBlockSystemOverlayUIProvider),  "initWithBlock:",  v12);
  -[PBMutableSystemOverlayPresentationRequest setProvider:](v5, "setProvider:", v9);

  overlayController = self->_overlayController;
  id v11 = -[PBMutableSystemOverlayPresentationRequest copy](v5, "copy");
  -[PBSystemOverlayController presentWithRequest:completion:]( overlayController,  "presentWithRequest:completion:",  v11,  0LL);
}

- (BOOL)_dismiss
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemOverlayController activeSession](self->_overlayController, "activeSession"));
  if (v3)
  {
    welcomeBackPauseBulletinsAssertion = (PBBulletinPausedAssertion *)objc_claimAutoreleasedReturnValue( +[PBSystemOverlayDismissalRequest dismissalRequestForSession:]( &OBJC_CLASS___PBMutableSystemOverlayDismissalRequest,  "dismissalRequestForSession:",  v3));
    -[PBBulletinPausedAssertion setAnimated:](welcomeBackPauseBulletinsAssertion, "setAnimated:", 1LL);
    overlayController = self->_overlayController;
    id v6 = -[PBBulletinPausedAssertion copy](welcomeBackPauseBulletinsAssertion, "copy");
    -[PBSystemOverlayController dismissWithRequest:completion:]( overlayController,  "dismissWithRequest:completion:",  v6,  0LL);

LABEL_7:
    goto LABEL_8;
  }

  if (self->_welcomeBackPauseBulletinsAssertion)
  {
    id v7 = sub_1000827CC();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100279AB8(v8);
    }

    -[PBBulletinPausedAssertion invalidate](self->_welcomeBackPauseBulletinsAssertion, "invalidate");
    welcomeBackPauseBulletinsAssertion = self->_welcomeBackPauseBulletinsAssertion;
    self->_welcomeBackPauseBulletinsAssertion = 0LL;
    goto LABEL_7;
  }

- (void)displayState:(id)a3 didChangeWithConnection:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 3)
  {
    -[PBHotBlackManager present](self, "present");
  }

  else if (a4 == 2)
  {
    dispatch_time_t v7 = dispatch_time(0LL, 5000000000LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100098D00;
    block[3] = &unk_1003CFF08;
    block[4] = self;
    dispatch_after(v7, &_dispatch_main_q, block);
  }
}

- (void)overlayController:(id)a3 didDismissSession:(id)a4
{
  welcomeBackPauseBulletinsAssertion = self->_welcomeBackPauseBulletinsAssertion;
  self->_welcomeBackPauseBulletinsAssertion = 0LL;
}

- (void)powerManager:(id)a3 willWakeSystemWithReason:(int64_t)a4 completion:(id)a5
{
  welcomeBackPauseBulletinsAssertion = self->_welcomeBackPauseBulletinsAssertion;
  dispatch_time_t v7 = (void (**)(void))a5;
  -[PBBulletinPausedAssertion invalidate](welcomeBackPauseBulletinsAssertion, "invalidate");
  v8 = -[PBBulletinPausedAssertion initWithReason:]( objc_alloc(&OBJC_CLASS___PBBulletinPausedAssertion),  "initWithReason:",  @"HotBlack");
  id v9 = self->_welcomeBackPauseBulletinsAssertion;
  self->_welcomeBackPauseBulletinsAssertion = v8;

  v7[2](v7);
}

- (void)_updatePresentationUsingAssertionState:(id)a3
{
  id v4 = a3;
  if ([v4 isActive])
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 orderedContext]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
    id v7 = [v6 integerValue];

    -[PBHotBlackManager _presentWithStyle:](self, "_presentWithStyle:", v7);
  }

  else
  {
    -[PBHotBlackManager _dismiss](self, "_dismiss");
  }
}

- (BSCompoundAssertion)presentationCompoundAssertion
{
  return self->_presentationCompoundAssertion;
}

- (PBSystemOverlayController)overlayController
{
  return self->_overlayController;
}

- (PBBulletinPausedAssertion)welcomeBackPauseBulletinsAssertion
{
  return self->_welcomeBackPauseBulletinsAssertion;
}

- (BSInvalidatable)proceduralPresentationAssertion
{
  return self->_proceduralPresentationAssertion;
}

- (void).cxx_destruct
{
}

@end