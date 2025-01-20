@interface PBCriticalAlertManager
+ (PBDependencyDescription)dependencyDescription;
+ (id)sharedInstance;
- (BOOL)isPresenting;
- (PBCriticalAlertManager)init;
- (PBSystemOverlayController)overlayController;
- (void)dismissAlertWithContext:(id)a3;
- (void)presentAlertWithContext:(id)a3;
@end

@implementation PBCriticalAlertManager

+ (PBDependencyDescription)dependencyDescription
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100158634;
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
  block[2] = sub_1001586CC;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_1004710E8 != -1) {
    dispatch_once(&qword_1004710E8, block);
  }
  return (id)qword_1004710E0;
}

- (PBCriticalAlertManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PBCriticalAlertManager;
  v2 = -[PBCriticalAlertManager init](&v7, "init");
  uint64_t v3 = v2;
  if (v2)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100158790;
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

- (void)presentAlertWithContext:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 viewController]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  unsigned int v7 = [v6 isEqualToString:@"CritialAlert-Thermal"];

  if (v7) {
    +[PBSSystemStatus _setThermalState:](&OBJC_CLASS___PBSSystemStatus, "_setThermalState:", 2LL);
  }
  v8 = objc_alloc(&OBJC_CLASS___PBBlockSystemOverlayUIProvider);
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  v18 = sub_1001589C8;
  v19 = &unk_1003D9888;
  id v20 = v5;
  id v21 = v4;
  id v9 = v4;
  id v10 = v5;
  v11 = -[PBBlockSystemOverlayUIProvider initWithBlock:](v8, "initWithBlock:", &v16);
  v12 = objc_alloc_init(&OBJC_CLASS___PBMutableSystemOverlayPresentationRequest);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier", v16, v17, v18, v19));
  -[PBMutableSystemOverlayPresentationRequest setIdentifier:](v12, "setIdentifier:", v13);

  -[PBMutableSystemOverlayPresentationRequest setAnimated:](v12, "setAnimated:", 1LL);
  -[PBMutableSystemOverlayPresentationRequest setProvider:](v12, "setProvider:", v11);
  overlayController = self->_overlayController;
  id v15 = -[PBMutableSystemOverlayPresentationRequest copy](v12, "copy");
  -[PBSystemOverlayController presentWithRequest:completion:]( overlayController,  "presentWithRequest:completion:",  v15,  0LL);
}

- (void)dismissAlertWithContext:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 identifier]);
  v5 = objc_alloc_init(&OBJC_CLASS___PBMutableSystemOverlayDismissalRequest);
  -[PBMutableSystemOverlayDismissalRequest setAnimated:](v5, "setAnimated:", 1LL);
  -[PBMutableSystemOverlayDismissalRequest setIdentifier:](v5, "setIdentifier:", v4);
  overlayController = self->_overlayController;
  id v7 = -[PBMutableSystemOverlayDismissalRequest copy](v5, "copy");
  -[PBSystemOverlayController dismissWithRequest:completion:]( overlayController,  "dismissWithRequest:completion:",  v7,  0LL);
}

- (PBSystemOverlayController)overlayController
{
  return self->_overlayController;
}

- (void).cxx_destruct
{
}

@end