@interface GCTVSettingsCustomizationControllerRepresentedObject_Legacy
- (GCTVSettingsCustomizationController)customizatonController;
- (NSArray)configurableControllerButtons;
- (NSArray)configurableControllerDpads;
- (NSArray)configurableControllerSystemButtons;
- (void)promptEraseAllSettings;
- (void)setConfigurableControllerButtons:(id)a3;
- (void)setConfigurableControllerDpads:(id)a3;
- (void)setConfigurableControllerSystemButtons:(id)a3;
- (void)setCustomizatonController:(id)a3;
@end

@implementation GCTVSettingsCustomizationControllerRepresentedObject_Legacy

- (void)promptEraseAllSettings
{
  id v3 = sub_EA9C(@"RESTORE_DEFAULTS_PROMPT_RESET");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  v17 = sub_15BDC;
  v18 = &unk_4CD80;
  objc_copyWeak(&v19, &location);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v4,  2LL,  &v15));

  id v6 = sub_EA9C(@"RESTORE_DEFAULTS_PROMPT_TITLE");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = sub_EA9C(@"RESTORE_DEFAULTS_PROMPT_MESSAGE");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v7,  v9,  1LL,  v15,  v16,  v17,  v18));

  [v10 addAction:v5];
  id v11 = sub_EA9C(@"RESTORE_DEFAULTS_PROMPT_CANCEL");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v12,  1LL,  0LL));
  [v10 addAction:v13];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_customizatonController);
  [WeakRetained presentViewController:v10 animated:1 completion:0];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (NSArray)configurableControllerButtons
{
  return self->_configurableControllerButtons;
}

- (void)setConfigurableControllerButtons:(id)a3
{
}

- (NSArray)configurableControllerSystemButtons
{
  return self->_configurableControllerSystemButtons;
}

- (void)setConfigurableControllerSystemButtons:(id)a3
{
}

- (NSArray)configurableControllerDpads
{
  return self->_configurableControllerDpads;
}

- (void)setConfigurableControllerDpads:(id)a3
{
}

- (GCTVSettingsCustomizationController)customizatonController
{
  return (GCTVSettingsCustomizationController *)objc_loadWeakRetained((id *)&self->_customizatonController);
}

- (void)setCustomizatonController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end