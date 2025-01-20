@interface PBWallpaperManager
+ (PBDependencyDescription)dependencyDescription;
+ (id)sharedInstance;
- (BOOL)isPresenting;
- (PBSystemOverlayController)overlayController;
- (PBWallpaperManager)init;
- (PBWallpaperViewController)wallpaperViewController;
- (void)dismissWallpaperAnimated:(BOOL)a3 completion:(id)a4;
- (void)prepareUIForSystemOverlayPresentationWithCompletion:(id)a3;
- (void)presentWallpaperAnimated:(BOOL)a3 completion:(id)a4;
- (void)updateWallpaperWithTransitionContext:(id)a3;
@end

@implementation PBWallpaperManager

+ (PBDependencyDescription)dependencyDescription
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10013B438;
  v11[3] = &unk_1003CFF78;
  v11[4] = a1;
  v2 = -[PBDependencyDescription initWithInstanceProvider:]( objc_alloc(&OBJC_CLASS___PBDependencyDescription),  "initWithInstanceProvider:",  v11);
  uint64_t v4 = objc_opt_self(&OBJC_CLASS___PBWindowManager, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v12[0] = v5;
  uint64_t v7 = objc_opt_self(&OBJC_CLASS___PBSnapshotService, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v12[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));
  -[PBDependencyDescription addDependencies:](v2, "addDependencies:", v9);

  return v2;
}

+ (id)sharedInstance
{
  if (qword_100471010 != -1) {
    dispatch_once(&qword_100471010, &stru_1003D8BF8);
  }
  return (id)qword_100471008;
}

- (PBWallpaperManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PBWallpaperManager;
  v2 = -[PBWallpaperManager init](&v8, "init");
  if (v2)
  {
    uint64_t v3 = objc_alloc_init(&OBJC_CLASS___PBWallpaperViewController);
    wallpaperViewController = v2->_wallpaperViewController;
    v2->_wallpaperViewController = v3;

    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10013B57C;
    v6[3] = &unk_1003D0FA8;
    uint64_t v7 = v2;
    +[PBDependencyCoordinator registerInstance:dependencyBlock:]( &OBJC_CLASS___PBDependencyCoordinator,  "registerInstance:dependencyBlock:",  v7,  v6);
  }

  return v2;
}

- (void)presentWallpaperAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___PBMutableSystemOverlayPresentationRequest);
  objc_super v8 = (objc_class *)objc_opt_class(self);
  v9 = NSStringFromClass(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  -[PBMutableSystemOverlayPresentationRequest setIdentifier:](v7, "setIdentifier:", v10);

  -[PBMutableSystemOverlayPresentationRequest setAnimated:](v7, "setAnimated:", v4);
  -[PBMutableSystemOverlayPresentationRequest setProvider:](v7, "setProvider:", self);
  overlayController = self->_overlayController;
  id v12 = -[PBMutableSystemOverlayPresentationRequest copy](v7, "copy");
  -[PBSystemOverlayController presentWithRequest:completion:]( overlayController,  "presentWithRequest:completion:",  v12,  v6);
}

- (void)dismissWallpaperAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemOverlayController activeSession](self->_overlayController, "activeSession"));
  if (v7)
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[PBSystemOverlayDismissalRequest dismissalRequestForSession:]( &OBJC_CLASS___PBMutableSystemOverlayDismissalRequest,  "dismissalRequestForSession:",  v7));
    [v8 setAnimated:v4];
    overlayController = self->_overlayController;
    id v10 = [v8 copy];
    -[PBSystemOverlayController dismissWithRequest:completion:]( overlayController,  "dismissWithRequest:completion:",  v10,  v6);
  }
}

- (void)updateWallpaperWithTransitionContext:(id)a3
{
}

- (BOOL)isPresenting
{
  return -[PBSystemOverlayController hasActivePresentation](self->_overlayController, "hasActivePresentation");
}

- (void)prepareUIForSystemOverlayPresentationWithCompletion:(id)a3
{
}

- (PBSystemOverlayController)overlayController
{
  return self->_overlayController;
}

- (PBWallpaperViewController)wallpaperViewController
{
  return self->_wallpaperViewController;
}

- (void).cxx_destruct
{
}

@end