@interface SATVChooseSetupMethodContainerViewController
- (ACAccount)accountForPasswordSettingPrompt;
- (SATVChooseSetupMethodContainerViewController)initWithConfiguration:(id)a3;
- (SATVChooseSetupMethodStepConfiguration)configuration;
- (TVSKNavigationController)internalNavigationController;
- (TVSKTapToSetupDeviceInfo)deferredTapToSetupDeviceInfo;
- (id)_chooseSetupViewController;
- (id)_tapToSetupViewController;
- (id)manualFlowSelectedHandler;
- (id)menuHandler;
- (id)preferredFocusEnvironments;
- (void)_didSelectManualFlow;
- (void)_showTapToSetupViewController;
- (void)setAccountForPasswordSettingPrompt:(id)a3;
- (void)setDeferredTapToSetupDeviceInfo:(id)a3;
- (void)setInternalNavigationController:(id)a3;
- (void)setManualFlowSelectedHandler:(id)a3;
- (void)setMenuHandler:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SATVChooseSetupMethodContainerViewController

- (SATVChooseSetupMethodContainerViewController)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SATVChooseSetupMethodContainerViewController;
  v6 = -[SATVChooseSetupMethodContainerViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", 0LL, 0LL);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_configuration, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SATVChooseSetupMethodContainerViewController;
  -[SATVChooseSetupMethodContainerViewController viewDidLoad](&v10, "viewDidLoad");
  v3 = -[SATVChooseSetupMethodViewController initWithConfiguration:]( objc_alloc(&OBJC_CLASS___SATVChooseSetupMethodViewController),  "initWithConfiguration:",  self->_configuration);
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100033EE0;
  v7[3] = &unk_1000C93A0;
  objc_copyWeak(&v8, &location);
  -[SATVChooseSetupMethodViewController setMenuHandler:](v3, "setMenuHandler:", v7);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100033F40;
  v5[3] = &unk_1000C93C8;
  objc_copyWeak(&v6, &location);
  -[SATVChooseSetupMethodViewController setCompletionHandler:](v3, "setCompletionHandler:", v5);
  v4 = -[TVSKNavigationController initWithRootViewController:]( objc_alloc(&OBJC_CLASS___TVSKNavigationController),  "initWithRootViewController:",  v3);
  -[SATVChooseSetupMethodContainerViewController setInternalNavigationController:]( self,  "setInternalNavigationController:",  v4);
  -[TVSKNavigationController setDelegate:](v4, "setDelegate:", self);
  -[SATVChooseSetupMethodContainerViewController tvsk_addChildViewController:](self, "tvsk_addChildViewController:", v4);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SATVChooseSetupMethodContainerViewController;
  -[SATVChooseSetupMethodContainerViewController viewWillAppear:](&v6, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[SATVChooseSetupMethodContainerViewController internalNavigationController]( self,  "internalNavigationController"));
  id v5 = [v4 popToRootViewControllerAnimated:1];
}

- (id)preferredFocusEnvironments
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[SATVChooseSetupMethodContainerViewController internalNavigationController]( self,  "internalNavigationController"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( -[SATVChooseSetupMethodContainerViewController internalNavigationController]( self,  "internalNavigationController"));
    v7 = v4;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));
  }

  else
  {
    id v5 = &__NSArray0__struct;
  }

  return v5;
}

- (id)_chooseSetupViewController
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[SATVChooseSetupMethodContainerViewController internalNavigationController]( self,  "internalNavigationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 childViewControllers]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);

  return v4;
}

- (id)_tapToSetupViewController
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[SATVChooseSetupMethodContainerViewController internalNavigationController]( self,  "internalNavigationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 childViewControllers]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 lastObject]);

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___SATVTapToSetupViewController);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0) {
    id v6 = v4;
  }
  else {
    id v6 = 0LL;
  }

  return v6;
}

- (void)_showTapToSetupViewController
{
  v3 = (SATVTapToSetupViewController *)objc_claimAutoreleasedReturnValue( -[SATVChooseSetupMethodContainerViewController _tapToSetupViewController]( self,  "_tapToSetupViewController"));
  if (!v3)
  {
    v3 = -[SATVTapToSetupViewController initWithDeviceLanguageCode:]( objc_alloc(&OBJC_CLASS___SATVTapToSetupViewController),  "initWithDeviceLanguageCode:",  0LL);
    objc_initWeak(&location, self);
    uint64_t v5 = _NSConcreteStackBlock;
    uint64_t v6 = 3221225472LL;
    v7 = sub_100034274;
    id v8 = &unk_1000C93A0;
    objc_copyWeak(&v9, &location);
    -[SATVTapToSetupViewController setMenuHandler:](v3, "setMenuHandler:", &v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue( -[SATVChooseSetupMethodContainerViewController internalNavigationController]( self,  "internalNavigationController",  v5,  v6,  v7,  v8));
    [v4 pushViewController:v3 animated:1];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)_didSelectManualFlow
{
  id v3 = sub_10002B074();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[SATVChooseSetupMethodContainerViewController _didSelectManualFlow]";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s: User chose manual flow",  (uint8_t *)&v7,  0xCu);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[SATVChooseSetupMethodContainerViewController manualFlowSelectedHandler]( self,  "manualFlowSelectedHandler"));
  if (v5)
  {
    uint64_t v6 = (void (**)(void))objc_claimAutoreleasedReturnValue( -[SATVChooseSetupMethodContainerViewController manualFlowSelectedHandler]( self,  "manualFlowSelectedHandler"));
    v6[2]();
  }

- (SATVChooseSetupMethodStepConfiguration)configuration
{
  return self->_configuration;
}

- (id)menuHandler
{
  return self->_menuHandler;
}

- (void)setMenuHandler:(id)a3
{
}

- (id)manualFlowSelectedHandler
{
  return self->_manualFlowSelectedHandler;
}

- (void)setManualFlowSelectedHandler:(id)a3
{
}

- (TVSKNavigationController)internalNavigationController
{
  return self->_internalNavigationController;
}

- (void)setInternalNavigationController:(id)a3
{
}

- (ACAccount)accountForPasswordSettingPrompt
{
  return self->_accountForPasswordSettingPrompt;
}

- (void)setAccountForPasswordSettingPrompt:(id)a3
{
}

- (TVSKTapToSetupDeviceInfo)deferredTapToSetupDeviceInfo
{
  return self->_deferredTapToSetupDeviceInfo;
}

- (void)setDeferredTapToSetupDeviceInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end