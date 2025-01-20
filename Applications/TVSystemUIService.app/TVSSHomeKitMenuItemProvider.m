@interface TVSSHomeKitMenuItemProvider
- (BOOL)shouldShowMenuItem;
- (BOOL)updateVisualContentForMenuItem:(id)a3;
- (TVSSBannerPresentable)currentBannerPresentable;
- (TVSSHomeKitController)homeKitController;
- (TVSSHomeKitMenuItemProvider)initWithHomeKitController:(id)a3;
- (id)_currentVisualContent;
- (id)log;
- (id)newMenuItem;
- (void)dealloc;
- (void)dismissBannerWithPresentable:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)presentBannerWithPresentable:(id)a3;
- (void)setCurrentBannerPresentable:(id)a3;
@end

@implementation TVSSHomeKitMenuItemProvider

- (TVSSHomeKitMenuItemProvider)initWithHomeKitController:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0LL;
  v6.receiver = v3;
  v6.super_class = (Class)&OBJC_CLASS___TVSSHomeKitMenuItemProvider;
  v8 = -[TVSSMenuItemProvider initWithIdentifier:](&v6, "initWithIdentifier:", TVSPHomeKitMenuItemProviderIdentifier);
  objc_storeStrong((id *)&v8, v8);
  if (v8)
  {
    objc_storeStrong((id *)&v8->_homeKitController, location[0]);
    -[TVSSHomeKitController addObserver:forKeyPath:options:context:]( v8->_homeKitController,  "addObserver:forKeyPath:options:context:",  v8,  @"hasCamerasOrScenes",  4LL,  off_10021F108);
  }

  v5 = v8;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v8, 0LL);
  return v5;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  -[TVSSHomeKitController removeObserver:forKeyPath:context:]( self->_homeKitController,  "removeObserver:forKeyPath:context:",  self,  @"hasCamerasOrScenes",  off_10021F108);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSSHomeKitMenuItemProvider;
  -[TVSSHomeKitMenuItemProvider dealloc](&v2, "dealloc");
}

- (void)setCurrentBannerPresentable:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v4->_currentBannerPresentable != location[0])
  {
    objc_storeStrong((id *)&v4->_currentBannerPresentable, location[0]);
    if (location[0]) {
      -[TVSSSimpleMenuItemProvider updateMenuItemWithReason:]( v4,  "updateMenuItemWithReason:",  @"Presenting High Priority Banner");
    }
    else {
      -[TVSSSimpleMenuItemProvider updateMenuItemWithReason:]( v4,  "updateMenuItemWithReason:",  @"Dismissing High Priority Banner");
    }
  }

  objc_storeStrong(location, 0LL);
}

- (void)presentBannerWithPresentable:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSHomeKitMenuItemProvider setCurrentBannerPresentable:](v4, "setCurrentBannerPresentable:", location[0]);
  objc_storeStrong(location, 0LL);
}

- (void)dismissBannerWithPresentable:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSHomeKitMenuItemProvider setCurrentBannerPresentable:](v4, "setCurrentBannerPresentable:", 0LL);
  objc_storeStrong(location, 0LL);
}

- (BOOL)shouldShowMenuItem
{
  v4 = -[TVSSHomeKitMenuItemProvider homeKitController](self, "homeKitController");
  unsigned __int8 v5 = -[TVSSHomeKitController hasCamerasOrScenes](v4, "hasCamerasOrScenes");

  objc_super v2 = -[TVSSHomeKitMenuItemProvider currentBannerPresentable](self, "currentBannerPresentable");
  BOOL v6 = v2 != 0LL;

  char v7 = 1;
  if ((v5 & 1) == 0) {
    char v7 = v6;
  }
  return v7 & 1;
}

- (id)newMenuItem
{
  BOOL v6 = self;
  v5[1] = (id)a2;
  v5[0] = -[TVSSMenuItem initWithIdentifier:hasFocusableContent:platterViewControllerClass:]( objc_alloc(&OBJC_CLASS___TVSSMenuItem),  "initWithIdentifier:hasFocusableContent:platterViewControllerClass:",  @"com.apple.TVSystemUIService.homekit.item",  1LL,  objc_opt_class(&OBJC_CLASS___TVSSHomeKitPanelViewController));
  id v3 = -[TVSSHomeKitMenuItemProvider _currentVisualContent](v6, "_currentVisualContent");
  objc_msgSend(v5[0], "setVisualContent:");

  id v4 = v5[0];
  objc_storeStrong(v5, 0LL);
  return v4;
}

- (BOOL)updateVisualContentForMenuItem:(id)a3
{
  BOOL v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = -[TVSSHomeKitMenuItemProvider _currentVisualContent](v6, "_currentVisualContent");
  objc_msgSend(location[0], "setVisualContent:");

  objc_storeStrong(location, 0LL);
  return 1;
}

- (id)_currentVisualContent
{
  v10[2] = self;
  v10[1] = (id)a2;
  v10[0] = -[TVSSHomeKitMenuItemProvider currentBannerPresentable](self, "currentBannerPresentable");
  if (v10[0])
  {
    if (+[TVSSConstants isScaledUI](&OBJC_CLASS___TVSSConstants, "isScaledUI")) {
      objc_super v2 = UIFontTextStyleBody;
    }
    else {
      objc_super v2 = UIFontTextStyleCaption1;
    }
    v9 = v2;
    BOOL v6 = objc_alloc(&OBJC_CLASS___TVSSTextContent);
    id v8 = [v10[0] menuBarShortTitle];
    id v7 =  +[UIFont _preferredFontForTextStyle:weight:]( &OBJC_CLASS___UIFont,  "_preferredFontForTextStyle:weight:",  v9,  UIFontWeightSemibold);
    v11 = -[TVSSTextContent initWithString:font:textEncapsulation:](v6, "initWithString:font:textEncapsulation:", v8);

    objc_storeStrong((id *)&v9, 0LL);
  }

  else
  {
    id v4 = objc_alloc(&OBJC_CLASS___TVSSImageContent);
    id v5 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"homekit");
    v11 = -[TVSSImageContent initWithImage:](v4, "initWithImage:");
  }

  objc_storeStrong(v10, 0LL);
  return v11;
}

- (id)log
{
  id v4 = (dispatch_once_t *)&unk_100221C18;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B72E0);
  if (*v4 != -1) {
    dispatch_once(v4, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221C10;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v12 = 0LL;
  objc_storeStrong(&v12, a4);
  id v11 = 0LL;
  objc_storeStrong(&v11, a5);
  v10 = a6;
  if (a6 == off_10021F108)
  {
    -[TVSSSimpleMenuItemProvider updateMenuItemWithReason:]( v14,  "updateMenuItemWithReason:",  @"Cameras or scenes changed");
  }

  else
  {
    v9.receiver = v14;
    v9.super_class = (Class)&OBJC_CLASS___TVSSHomeKitMenuItemProvider;
    -[TVSSHomeKitMenuItemProvider observeValueForKeyPath:ofObject:change:context:]( &v9,  "observeValueForKeyPath:ofObject:change:context:",  location[0],  v12,  v11,  v10);
  }

  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
}

- (TVSSHomeKitController)homeKitController
{
  return self->_homeKitController;
}

- (TVSSBannerPresentable)currentBannerPresentable
{
  return self->_currentBannerPresentable;
}

- (void).cxx_destruct
{
}

@end