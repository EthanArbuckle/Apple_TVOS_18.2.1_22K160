@interface TVSMExpanseModule
+ (id)availableStyles;
- (TVSMButtonViewController)buttonVC;
- (TVSMCAPackageView)packageView;
- (TVSMExpanseModule)init;
- (id)contentViewController;
- (void)dealloc;
- (void)expanseContextDidUpdate:(id)a3;
- (void)handleAction;
- (void)setButtonVC:(id)a3;
- (void)setPackageView:(id)a3;
- (void)showNoSessionAvailableAlert;
- (void)updateContextSpecificUI;
@end

@implementation TVSMExpanseModule

+ (id)availableStyles
{
  return &off_10770;
}

- (TVSMExpanseModule)init
{
  SEL v9 = a2;
  v10 = 0LL;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVSMExpanseModule;
  v7 = -[TVSMExpanseModule init](&v8, "init");
  v10 = v7;
  objc_storeStrong((id *)&v10, v7);
  if (v7)
  {
    id v6 = +[TVCSExpanseContext sharedContext](&OBJC_CLASS___TVCSExpanseContext, "sharedContext");
    v4 = v10;
    v5 = &_dispatch_main_q;
    objc_msgSend(v6, "addObserver:queue:", v4);
  }

  v3 = v10;
  objc_storeStrong((id *)&v10, 0LL);
  return v3;
}

- (void)dealloc
{
  v5 = self;
  SEL v4 = a2;
  id v2 = +[TVCSExpanseContext sharedContext](&OBJC_CLASS___TVCSExpanseContext, "sharedContext");
  [v2 removeObserver:v5];

  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_CLASS___TVSMExpanseModule;
  -[TVSMExpanseModule dealloc](&v3, "dealloc");
}

- (TVSMCAPackageView)packageView
{
  if (!self->_packageView)
  {
    v5 = objc_alloc(&OBJC_CLASS___TVSMCAPackageView);
    id v6 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
    id v2 = -[TVSMCAPackageView initWithPackageName:inBundle:]( v5,  "initWithPackageName:inBundle:",  @"controlcenter_SharePlay_active");
    packageView = self->_packageView;
    self->_packageView = v2;

    v7 = self->_packageView;
    objc_super v8 =  +[UITraitCollection traitCollectionWithUserInterfaceStyle:]( &OBJC_CLASS___UITraitCollection,  "traitCollectionWithUserInterfaceStyle:");
    -[TVSMCAPackageView setStateName:forPackageViewState:traitCollection:]( v7,  "setStateName:forPackageViewState:traitCollection:");

    SEL v9 = self->_packageView;
    v10 =  +[UITraitCollection traitCollectionWithUserInterfaceStyle:]( &OBJC_CLASS___UITraitCollection,  "traitCollectionWithUserInterfaceStyle:");
    -[TVSMCAPackageView setStateName:forPackageViewState:traitCollection:]( v9,  "setStateName:forPackageViewState:traitCollection:",  @"Joined",  1LL);

    v11 = self->_packageView;
    id v13 = (id)TVSMDynamicVibrantBlueColor();
    v12 =  +[UITraitCollection traitCollectionWithUserInterfaceStyle:]( &OBJC_CLASS___UITraitCollection,  "traitCollectionWithUserInterfaceStyle:",  1LL);
    -[TVSMCAPackageView setColorOverride:forPackageViewState:traitCollection:focused:filter:]( v11,  "setColorOverride:forPackageViewState:traitCollection:focused:filter:",  v13,  1LL);

    v14 = self->_packageView;
    id v16 = (id)TVSMDynamicVibrantBlueColor();
    v15 =  +[UITraitCollection traitCollectionWithUserInterfaceStyle:]( &OBJC_CLASS___UITraitCollection,  "traitCollectionWithUserInterfaceStyle:",  2LL);
    -[TVSMCAPackageView setColorOverride:forPackageViewState:traitCollection:focused:filter:]( v14,  "setColorOverride:forPackageViewState:traitCollection:focused:filter:",  v16,  1LL);

    v17 = self->_packageView;
    id v19 = (id)TVSMDynamicVibrantBlueColor();
    v18 =  +[UITraitCollection traitCollectionWithUserInterfaceStyle:]( &OBJC_CLASS___UITraitCollection,  "traitCollectionWithUserInterfaceStyle:",  2LL);
    -[TVSMCAPackageView setColorOverride:forPackageViewState:traitCollection:focused:filter:]( v17,  "setColorOverride:forPackageViewState:traitCollection:focused:filter:",  v19,  1LL);
  }

  return self->_packageView;
}

- (id)contentViewController
{
  v7 = self;
  SEL v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSMExpanseModule;
  id v2 = (TVSMButtonViewController *)-[TVSMExpanseModule contentViewController](&v5, "contentViewController");
  buttonVC = v7->_buttonVC;
  v7->_buttonVC = v2;

  -[TVSMExpanseModule updateContextSpecificUI](v7, "updateContextSpecificUI");
  return v7->_buttonVC;
}

- (void)handleAction
{
  SEL v9 = self;
  SEL v8 = a2;
  id v2 = +[TVCSExpanseContext sharedContext](&OBJC_CLASS___TVCSExpanseContext, "sharedContext");
  id v3 = [v2 sessionState];

  unint64_t v7 = (unint64_t)v3;
  id location = sub_A9E0();
  os_log_type_t v5 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
  {
    sub_AA58((uint64_t)v11, v7);
    _os_log_impl(&dword_0, (os_log_t)location, v5, "Handling action for state: %zd", v11, 0xCu);
  }

  objc_storeStrong(&location, 0LL);
  if (v7 <= 4) {
    __asm { BR              X8 }
  }

  id v4 = sub_A9E0();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
  {
    sub_AA58((uint64_t)v10, v7);
    _os_log_error_impl( &dword_0,  (os_log_t)v4,  OS_LOG_TYPE_ERROR,  "Unexpected state received while handling Expanse module action: %zd",  v10,  0xCu);
  }

  objc_storeStrong(&v4, 0LL);
}

- (void)showNoSessionAvailableAlert
{
  v15 = self;
  v14[1] = (id)a2;
  id v2 = objc_alloc(&OBJC_CLASS___TVSUITextAlertController);
  SEL v6 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v15));
  os_log_type_t v5 =  -[NSBundle localizedStringForKey:value:table:]( v6,  "localizedStringForKey:value:table:",  @"TVSMExpanseTitle");
  id v4 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v15));
  id v3 =  -[NSBundle localizedStringForKey:value:table:]( v4,  "localizedStringForKey:value:table:",  @"TVSMExpanseNoSessionAvailableModalMessage",  &stru_102F0,  @"Localizable-Expanse");
  v14[0] = objc_msgSend(v2, "initWithTitle:text:", v5);

  id v7 = v14[0];
  id v8 = sub_AD08();
  objc_msgSend(v7, "setHeaderImage:");

  id v9 = [v14[0] headerImageView];
  [v9 setContentMode:1];

  id v10 = v14[0];
  id v13 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v15));
  v12 =  -[NSBundle localizedStringForKey:value:table:]( v13,  "localizedStringForKey:value:table:",  @"TVSMExpanseNoSessionAvailableConfirmButtonTitle",  &stru_102F0,  @"Localizable-Expanse");
  v11 =  +[TVSUITextAlertButton buttonWithTitle:type:handler:]( &OBJC_CLASS___TVSUITextAlertButton,  "buttonWithTitle:type:handler:");
  objc_msgSend(v10, "addButton:");

  -[TVSMButtonViewController presentViewController:animated:completion:]( v15->_buttonVC,  "presentViewController:animated:completion:",  v14[0],  1LL,  0LL);
  objc_storeStrong(v14, 0LL);
}

- (void)updateContextSpecificUI
{
  id v9 = self;
  SEL v8 = a2;
  id v2 = +[TVCSExpanseContext sharedContext](&OBJC_CLASS___TVCSExpanseContext, "sharedContext");
  id v3 = (char *)[v2 sessionState];

  id v7 = v3;
  id location = sub_A9E0();
  os_log_type_t v5 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
  {
    sub_AA58((uint64_t)v11, (uint64_t)v7);
    _os_log_impl(&dword_0, (os_log_t)location, v5, "Updating expanse module UI for state: %zd", v11, 0xCu);
  }

  objc_storeStrong(&location, 0LL);
  if ((unint64_t)(v7 - 1) <= 3) {
    __asm { BR              X8 }
  }

  os_log_t oslog = (os_log_t)sub_A9E0();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
  {
    sub_AA58((uint64_t)v10, (uint64_t)v7);
    _os_log_error_impl( &dword_0,  oslog,  OS_LOG_TYPE_ERROR,  "Unexpected state received while updating Expanse module UI: %zd",  v10,  0xCu);
  }

  objc_storeStrong((id *)&oslog, 0LL);
}

- (void)expanseContextDidUpdate:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSMExpanseModule updateContextSpecificUI](v4, "updateContextSpecificUI");
  objc_storeStrong(location, 0LL);
}

- (TVSMButtonViewController)buttonVC
{
  return self->_buttonVC;
}

- (void)setButtonVC:(id)a3
{
}

- (void)setPackageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end