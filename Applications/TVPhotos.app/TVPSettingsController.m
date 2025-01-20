@interface TVPSettingsController
- (BOOL)hasWarnedForOverrides;
- (PTSettings)rootSettings;
- (PXSettings)currentSettings;
- (TVPSettingsController)initWithRootSettings:(id)a3;
- (id)onViewDidDisappearBlock;
- (void)_clearSettingsOverride;
- (void)_warnForSettingsOverride;
- (void)callOnViewDidDisappearBlock;
- (void)setHasWarnedForOverrides:(BOOL)a3;
- (void)setOnViewDidDisappearBlock:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation TVPSettingsController

- (TVPSettingsController)initWithRootSettings:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVPSettingsController;
  v6 = -[TVPSettingsController initWithRootSettings:](&v9, "initWithRootSettings:", v5);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_rootSettings, a3);
    -[TVPSettingsController setDismissButton:](v7, "setDismissButton:", 0LL);
  }

  return v7;
}

- (PXSettings)currentSettings
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSettingsController topViewController](self, "topViewController"));
  if (v5)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___PTUIModuleController, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      v13 = (objc_class *)objc_opt_class(&OBJC_CLASS___PTUIModuleController, v12);
      v14 = NSStringFromClass(v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "px_descriptionForAssertionMessage"));
      [v11 handleFailureInMethod:a2, self, @"TVPSettingsController.m", 36, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"self.topViewController", v15, v16 object file lineNumber description];
    }
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 settings]);
  if (v8)
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___PXSettings, v7);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      v19 = (objc_class *)objc_opt_class(&OBJC_CLASS___PXSettings, v18);
      v20 = NSStringFromClass(v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "px_descriptionForAssertionMessage"));
      [v17 handleFailureInMethod:a2, self, @"TVPSettingsController.m", 37, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"moduleController.settings", v21, v22 object file lineNumber description];
    }
  }

  return (PXSettings *)v8;
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVPSettingsController;
  -[TVPSettingsController viewDidAppear:](&v6, "viewDidAppear:", a3);
  if (!-[TVPSettingsController hasWarnedForOverrides](self, "hasWarnedForOverrides"))
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSettingsController currentSettings](self, "currentSettings"));
    unsigned int v5 = [v4 hasUserDefaultsOverrides];

    if (v5)
    {
      -[TVPSettingsController setHasWarnedForOverrides:](self, "setHasWarnedForOverrides:", 1LL);
      -[TVPSettingsController _warnForSettingsOverride](self, "_warnForSettingsOverride");
    }
  }

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVPSettingsController;
  -[TVPSettingsController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  -[TVPSettingsController callOnViewDidDisappearBlock](self, "callOnViewDidDisappearBlock");
}

- (void)callOnViewDidDisappearBlock
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSettingsController onViewDidDisappearBlock](self, "onViewDidDisappearBlock"));

  if (v3)
  {
    objc_super v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[TVPSettingsController onViewDidDisappearBlock](self, "onViewDidDisappearBlock"));
    v4[2]();
  }

- (void)_warnForSettingsOverride
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  @"Internal Settings Are Overridden",  @"Internal settings have been overridden by a defaults write. Changes made here may not be saved.",  1LL));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  @"OK",  1LL,  0LL));
  [v3 addAction:v4];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10002775C;
  v6[3] = &unk_1000CA418;
  v6[4] = self;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  @"Clear Overrides",  2LL,  v6));
  [v3 addAction:v5];

  -[TVPSettingsController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v3,  1LL,  0LL);
}

- (void)_clearSettingsOverride
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSettingsController currentSettings](self, "currentSettings"));
  [v3 clearManualOverrides];

  id v6 = (id)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  @"Overrides Cleared",  @"Internal settings overrides have been cleared. This will take effect on the next launch of Photos.",  1LL));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  @"OK",  1LL,  0LL));
  [v6 addAction:v4];

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  @"Quit",  2LL,  &stru_1000CA458));
  [v6 addAction:v5];

  -[TVPSettingsController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v6,  1LL,  0LL);
}

- (PTSettings)rootSettings
{
  return self->_rootSettings;
}

- (id)onViewDidDisappearBlock
{
  return self->_onViewDidDisappearBlock;
}

- (void)setOnViewDidDisappearBlock:(id)a3
{
}

- (BOOL)hasWarnedForOverrides
{
  return self->_hasWarnedForOverrides;
}

- (void)setHasWarnedForOverrides:(BOOL)a3
{
  self->_hasWarnedForOverrides = a3;
}

- (void).cxx_destruct
{
}

@end