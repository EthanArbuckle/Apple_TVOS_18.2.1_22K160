@interface PBSiriOptInViewController
- (BOOL)_shouldOfferDataSharing;
- (BOOL)_shouldOfferSiri;
- (BOOL)_shouldOnlyOfferDataSharing;
- (PBSiriOptInViewController)initWithMode:(int64_t)a3;
- (UINavigationController)navigationController;
- (id)dismissalCompletion;
- (id)preferredFocusEnvironments;
- (int64_t)mode;
- (void)_dismissViewControllerWithValue:(BOOL)a3;
- (void)_updateSiriDataSharingOptInSettingsWithOptInStatus:(unint64_t)a3;
- (void)_updateSiriOptInSettingsWithOptedIn:(BOOL)a3;
- (void)dealloc;
- (void)setDismissalCompletion:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)siriDataSharingOptInOfferViewController:(id)a3 didCompleteOptIn:(BOOL)a4;
- (void)siriDataSharingOptInOfferViewControllerDidNotCompleteOptIn:(id)a3;
- (void)siriOptInOfferViewController:(id)a3 didCompleteOptIn:(BOOL)a4;
- (void)siriOptInOfferViewControllerDidNotCompleteOptIn:(id)a3;
- (void)viewDidLoad;
@end

@implementation PBSiriOptInViewController

- (PBSiriOptInViewController)initWithMode:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PBSiriOptInViewController;
  v4 = -[PBSiriOptInViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", 0LL, 0LL);
  v5 = v4;
  if (v4)
  {
    v4->_mode = a3;
    -[PBSiriOptInViewController setOverrideUserInterfaceStyle:](v4, "setOverrideUserInterfaceStyle:", 2LL);
    -[PBSiriOptInViewController setModalPresentationStyle:](v5, "setModalPresentationStyle:", 8LL);
  }

  return v5;
}

- (void)dealloc
{
  v3 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[PBSiriOptInViewController dismissalCompletion]( self,  "dismissalCompletion"));
  id dismissalCompletion = self->_dismissalCompletion;
  self->_id dismissalCompletion = 0LL;

  if (v3) {
    v3[2](v3, 0LL);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PBSiriOptInViewController;
  -[PBSiriOptInViewController dealloc](&v5, "dealloc");
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PBSiriOptInViewController;
  -[PBSiriOptInViewController viewDidLoad](&v10, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSiriOptInViewController view](self, "view"));
  unint64_t v4 = -[PBSiriOptInViewController mode](self, "mode");
  if (v4 < 4)
  {
    objc_super v5 = -[PBSiriOptInOfferViewController initWithOfferDictationOnly:]( objc_alloc(&OBJC_CLASS___PBSiriOptInOfferViewController),  "initWithOfferDictationOnly:",  -[PBSiriOptInViewController _shouldOfferSiri](self, "_shouldOfferSiri") ^ 1);
LABEL_6:
    v9 = v5;
    -[PBSiriOptInOfferViewController setDelegate:](v5, "setDelegate:", self);
    goto LABEL_7;
  }

  if (v4 == 4)
  {
    objc_super v5 = objc_alloc_init(&OBJC_CLASS___PBSiriDataSharingOptInOfferViewController);
    goto LABEL_6;
  }

  v9 = 0LL;
LABEL_7:
  v6 = -[UINavigationController initWithRootViewController:]( objc_alloc(&OBJC_CLASS___UINavigationController),  "initWithRootViewController:",  v9);
  navigationController = self->_navigationController;
  self->_navigationController = v6;

  -[PBSiriOptInViewController addChildViewController:](self, "addChildViewController:", self->_navigationController);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController view](self->_navigationController, "view"));
  [v8 setAutoresizingMask:18];
  [v3 addSubview:v8];
  -[UINavigationController didMoveToParentViewController:]( self->_navigationController,  "didMoveToParentViewController:",  self);
}

- (id)preferredFocusEnvironments
{
  return (id)objc_claimAutoreleasedReturnValue( -[UINavigationController preferredFocusEnvironments]( self->_navigationController,  "preferredFocusEnvironments"));
}

- (void)siriOptInOfferViewControllerDidNotCompleteOptIn:(id)a3
{
}

- (void)siriOptInOfferViewController:(id)a3 didCompleteOptIn:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4 && -[PBSiriOptInViewController _shouldOfferDataSharing](self, "_shouldOfferDataSharing"))
  {
    objc_super v7 = objc_alloc_init(&OBJC_CLASS___PBSiriDataSharingOptInOfferViewController);
    -[PBSiriDataSharingOptInOfferViewController setDelegate:](v7, "setDelegate:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBSiriOptInViewController navigationController](self, "navigationController"));
    [v8 pushViewController:v7 animated:1];
  }

  else
  {
    -[PBSiriOptInViewController _updateSiriOptInSettingsWithOptedIn:](self, "_updateSiriOptInSettingsWithOptedIn:", v4);
    -[PBSiriOptInViewController _dismissViewControllerWithValue:](self, "_dismissViewControllerWithValue:", 1LL);
  }
}

- (void)siriDataSharingOptInOfferViewControllerDidNotCompleteOptIn:(id)a3
{
  if (-[PBSiriOptInViewController _shouldOnlyOfferDataSharing](self, "_shouldOnlyOfferDataSharing", a3))
  {
    -[PBSiriOptInViewController _updateSiriDataSharingOptInSettingsWithOptInStatus:]( self,  "_updateSiriDataSharingOptInSettingsWithOptInStatus:",  3LL);
    -[PBSiriOptInViewController _dismissViewControllerWithValue:](self, "_dismissViewControllerWithValue:", 0LL);
  }

  else
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBSiriOptInViewController navigationController](self, "navigationController"));
    id v5 = [v4 popViewControllerAnimated:1];
  }

- (void)siriDataSharingOptInOfferViewController:(id)a3 didCompleteOptIn:(BOOL)a4
{
  BOOL v4 = a4;
  if (!-[PBSiriOptInViewController _shouldOnlyOfferDataSharing](self, "_shouldOnlyOfferDataSharing", a3)) {
    -[PBSiriOptInViewController _updateSiriOptInSettingsWithOptedIn:](self, "_updateSiriOptInSettingsWithOptedIn:", 1LL);
  }
  if (v4) {
    uint64_t v6 = 1LL;
  }
  else {
    uint64_t v6 = 2LL;
  }
  -[PBSiriOptInViewController _updateSiriDataSharingOptInSettingsWithOptInStatus:]( self,  "_updateSiriDataSharingOptInSettingsWithOptInStatus:",  v6);
  -[PBSiriOptInViewController _dismissViewControllerWithValue:](self, "_dismissViewControllerWithValue:", 1LL);
}

- (void)_dismissViewControllerWithValue:(BOOL)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSiriOptInViewController dismissalCompletion](self, "dismissalCompletion"));
  -[PBSiriOptInViewController setDismissalCompletion:](self, "setDismissalCompletion:", 0LL);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBSiriOptInViewController presentingViewController](self, "presentingViewController"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10009F4C4;
  v8[3] = &unk_1003D4980;
  id v9 = v5;
  BOOL v10 = a3;
  id v7 = v5;
  [v6 dismissViewControllerAnimated:1 completion:v8];
}

- (void)_updateSiriOptInSettingsWithOptedIn:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[PBSiriOptInViewController _shouldOfferSiri](self, "_shouldOfferSiri"))
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSiriSettings sharedInstance](&OBJC_CLASS___PBSSiriSettings, "sharedInstance"));
    [v4 setSiriEnabled:v3];
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSiriSettings sharedInstance](&OBJC_CLASS___PBSSiriSettings, "sharedInstance"));
  [v5 setDictationEnabled:v3];
}

- (void)_updateSiriDataSharingOptInSettingsWithOptInStatus:(unint64_t)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSiriSettings sharedInstance](&OBJC_CLASS___PBSSiriSettings, "sharedInstance"));
  [v4 setDataSharingOptInStatus:a3 propagateToHomeAccessories:0 source:0 reason:@"Opt in offer for first Siri invocation"];
}

- (BOOL)_shouldOnlyOfferDataSharing
{
  return (id)-[PBSiriOptInViewController mode](self, "mode") == (id)4;
}

- (BOOL)_shouldOfferDataSharing
{
  unint64_t v2 = -[PBSiriOptInViewController mode](self, "mode");
  return (v2 < 5) & (0x1Au >> v2);
}

- (BOOL)_shouldOfferSiri
{
  return (unint64_t)-[PBSiriOptInViewController mode](self, "mode") < 2;
}

- (int64_t)mode
{
  return self->_mode;
}

- (id)dismissalCompletion
{
  return self->_dismissalCompletion;
}

- (void)setDismissalCompletion:(id)a3
{
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end