@interface PBBlackScreenRecoveryManager
+ (PBDependencyDescription)dependencyDescription;
+ (id)sharedInstance;
- (BOOL)isIterating;
- (BOOL)isPresenting;
- (PBBlackScreenRecoveryManager)init;
- (PBSystemOverlayController)overlayController;
- (TVSUIBlackScreenRecoveryIterator)recoveryIterator;
- (void)dismiss;
- (void)presentForDisplayModes:(id)a3 selectionHandler:(id)a4;
@end

@implementation PBBlackScreenRecoveryManager

+ (PBDependencyDescription)dependencyDescription
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000977BC;
  v8[3] = &unk_1003CFF78;
  v8[4] = a1;
  v2 = -[PBDependencyDescription initWithInstanceProvider:]( objc_alloc(&OBJC_CLASS___PBDependencyDescription),  "initWithInstanceProvider:",  v8);
  uint64_t v4 = objc_opt_self(&OBJC_CLASS___PBWindowManager, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v9 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
  -[PBDependencyDescription addDependencies:](v2, "addDependencies:", v6);

  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100097854;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_100470838 != -1) {
    dispatch_once(&qword_100470838, block);
  }
  return (id)qword_100470830;
}

- (PBBlackScreenRecoveryManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PBBlackScreenRecoveryManager;
  v2 = -[PBBlackScreenRecoveryManager init](&v7, "init");
  uint64_t v3 = v2;
  if (v2)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100097918;
    v5[3] = &unk_1003D0FA8;
    v6 = v2;
    +[PBDependencyCoordinator registerInstance:dependencyBlock:]( &OBJC_CLASS___PBDependencyCoordinator,  "registerInstance:dependencyBlock:",  v6,  v5);
  }

  return v3;
}

- (BOOL)isPresenting
{
  return -[PBSystemOverlayController hasActivePresentation](self->_overlayController, "hasActivePresentation");
}

- (BOOL)isIterating
{
  return self->_recoveryIterator != 0LL;
}

- (void)presentForDisplayModes:(id)a3 selectionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!-[PBBlackScreenRecoveryManager isIterating](self, "isIterating") && [v6 count])
  {
    objc_initWeak(location, self);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_100097CCC;
    v26[3] = &unk_1003D4670;
    objc_copyWeak(&v28, location);
    id v27 = v7;
    v8 = objc_retainBlock(v26);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100097D38;
    v24[3] = &unk_1003D46C0;
    objc_copyWeak(&v25, location);
    v24[4] = self;
    v24[5] = v8;
    v9 = objc_retainBlock(v24);
    if ((unint64_t)[v6 count] < 2)
    {
      if ([v6 count] == (id)1)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);
        v13 = (void *)objc_claimAutoreleasedReturnValue( +[TVSUIBlackScreenRecoveryViewController recoveryControllerWithDisplayMode:timeoutDuration:]( &OBJC_CLASS___TVSUIBlackScreenRecoveryViewController,  "recoveryControllerWithDisplayMode:timeoutDuration:",  v12,  20.0));
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472LL;
        v15[2] = sub_100098294;
        v15[3] = &unk_1003D4738;
        v17 = v8;
        id v14 = v12;
        id v16 = v14;
        objc_copyWeak(&v18, location);
        [v13 setDismissBlock:v15];
        ((void (*)(void *, void *))v9[2])(v9, v13);
        objc_destroyWeak(&v18);
      }
    }

    else
    {
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_1000980C8;
      v19[3] = &unk_1003D4710;
      v21 = v8;
      id v20 = v6;
      objc_copyWeak(&v23, location);
      v22 = v9;
      v10 = (TVSUIBlackScreenRecoveryIterator *)objc_claimAutoreleasedReturnValue( +[TVSUIBlackScreenRecoveryIterator scheduleIterationForDisplayModes:iterationInterval:iterationBlock:]( &OBJC_CLASS___TVSUIBlackScreenRecoveryIterator,  "scheduleIterationForDisplayModes:iterationInterval:iterationBlock:",  v20,  v19,  20.0));
      recoveryIterator = self->_recoveryIterator;
      self->_recoveryIterator = v10;

      objc_destroyWeak(&v23);
    }

    objc_destroyWeak(&v25);
    objc_destroyWeak(&v28);
    objc_destroyWeak(location);
  }
}

- (void)dismiss
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemOverlayController activeSession](self->_overlayController, "activeSession"));
  if (v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[PBSystemOverlayDismissalRequest dismissalRequestForSession:]( &OBJC_CLASS___PBMutableSystemOverlayDismissalRequest,  "dismissalRequestForSession:",  v3));
    [v4 setAnimated:0];
    overlayController = self->_overlayController;
    id v6 = [v4 copy];
    -[PBSystemOverlayController dismissWithRequest:completion:]( overlayController,  "dismissWithRequest:completion:",  v6,  0LL);
  }
}

- (PBSystemOverlayController)overlayController
{
  return self->_overlayController;
}

- (TVSUIBlackScreenRecoveryIterator)recoveryIterator
{
  return self->_recoveryIterator;
}

- (void).cxx_destruct
{
}

@end