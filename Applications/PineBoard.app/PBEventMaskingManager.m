@interface PBEventMaskingManager
+ (PBDependencyDescription)dependencyDescription;
+ (id)sharedInstance;
- (BOOL)isPresenting;
- (PBEventMaskingManager)init;
- (PBSystemOverlayController)overlayController;
- (void)dismiss;
- (void)prepareUIForSystemOverlayPresentationWithCompletion:(id)a3;
- (void)present;
@end

@implementation PBEventMaskingManager

+ (PBDependencyDescription)dependencyDescription
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100106FAC;
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
  block[2] = sub_100107044;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_100470EF8 != -1) {
    dispatch_once(&qword_100470EF8, block);
  }
  return (id)qword_100470EF0;
}

- (PBEventMaskingManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PBEventMaskingManager;
  v2 = -[PBEventMaskingManager init](&v7, "init");
  uint64_t v3 = v2;
  if (v2)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100107108;
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

- (void)present
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___PBMutableSystemOverlayPresentationRequest);
  uint64_t v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[PBMutableSystemOverlayPresentationRequest setIdentifier:](v3, "setIdentifier:", v6);

  -[PBMutableSystemOverlayPresentationRequest setAnimated:](v3, "setAnimated:", 0LL);
  -[PBMutableSystemOverlayPresentationRequest setProvider:](v3, "setProvider:", self);
  overlayController = self->_overlayController;
  id v8 = -[PBMutableSystemOverlayPresentationRequest copy](v3, "copy");
  -[PBSystemOverlayController presentWithRequest:completion:]( overlayController,  "presentWithRequest:completion:",  v8,  0LL);
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

- (void)prepareUIForSystemOverlayPresentationWithCompletion:(id)a3
{
  uint64_t v3 = (void (**)(id, id, void))a3;
  uint64_t v4 = objc_alloc(&OBJC_CLASS___PBContentPresentingContainmentViewController);
  v5 = objc_alloc_init(&OBJC_CLASS___UIViewController);
  id v6 = -[PBContentPresentingContainmentViewController initWithChildViewController:allowsInteraction:expectsEventForwarding:]( v4,  "initWithChildViewController:allowsInteraction:expectsEventForwarding:",  v5,  1LL,  0LL);

  v3[2](v3, v6, 0LL);
}

- (PBSystemOverlayController)overlayController
{
  return self->_overlayController;
}

- (void).cxx_destruct
{
}

@end