@interface TVHAccountSettingsViewController
- (BOOL)isAuthenticationInProgress;
- (TVHAccountSettingsViewController)initWithStyle:(int64_t)a3;
- (id)externalValue;
- (id)loadSettingGroups;
- (void)_disableHomeSharing;
- (void)_enableHomeSharing;
- (void)_showConfirmDisableDialog;
- (void)_showSuccessDialogWithAccountName:(id)a3;
- (void)_startObservingMediaServerDiscoverySettings;
- (void)_stopObservingMediaServerDiscoverySettings;
- (void)_updateDisableItem:(id)a3;
- (void)_updateEnableItem:(id)a3;
- (void)_updateExternalValue;
- (void)accountSetupViewController:(id)a3 didSucceedWithAccountName:(id)a4;
- (void)accountSetupViewControllerDidCancel:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAuthenticationInProgress:(BOOL)a3;
- (void)setExternalValue:(id)a3;
@end

@implementation TVHAccountSettingsViewController

- (TVHAccountSettingsViewController)initWithStyle:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVHAccountSettingsViewController;
  v3 = -[TVHAccountSettingsViewController initWithStyle:](&v6, "initWithStyle:", a3);
  v4 = v3;
  if (v3) {
    -[TVHAccountSettingsViewController _startObservingMediaServerDiscoverySettings]( v3,  "_startObservingMediaServerDiscoverySettings");
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVHAccountSettingsViewController;
  -[TVHAccountSettingsViewController dealloc](&v3, "dealloc");
}

- (id)loadSettingGroups
{
  id v3 = objc_alloc_init(&OBJC_CLASS___TSKSettingGroup);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVHomeSharingAccountSettings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:@"ENABLE_HOME_SHARING_TITLE" value:0 table:0]);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVHomeSharingAccountSettings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( [v6 localizedStringForKey:@"ENABLE_HOME_SHARING_DESCRIPTION" value:0 table:0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v5,  v7,  0LL,  0LL,  self,  "_enableHomeSharing"));

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_5880;
  v17[3] = &unk_C398;
  objc_copyWeak(&v18, &location);
  [v8 setUpdateBlock:v17];
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVHomeSharingAccountSettings"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedStringForKey:@"DISABLE_HOME_SHARING_TITLE" value:0 table:0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v10,  0LL,  0LL,  0LL,  self,  "_disableHomeSharing"));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_58C8;
  v15[3] = &unk_C398;
  objc_copyWeak(&v16, &location);
  [v11 setUpdateBlock:v15];
  v21[0] = v8;
  v21[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 2LL));
  [v3 setSettingItems:v12];

  id v20 = v3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
  objc_destroyWeak(&v16);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
  return v13;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_11148 == a6)
  {
    -[TVHAccountSettingsViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded", a3, a4, a5);
    -[TVHAccountSettingsViewController _updateExternalValue](self, "_updateExternalValue");
  }

  else
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___TVHAccountSettingsViewController;
    -[TVHAccountSettingsViewController observeValueForKeyPath:ofObject:change:context:]( &v7,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (void)_startObservingMediaServerDiscoverySettings
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[TVHKMediaServerDiscoverySettings sharedInstance]( &OBJC_CLASS___TVHKMediaServerDiscoverySettings,  "sharedInstance"));
  [v3 addObserver:self forKeyPath:@"mediaServerDiscoveryConfiguration" options:5 context:off_11148];
}

- (void)_stopObservingMediaServerDiscoverySettings
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[TVHKMediaServerDiscoverySettings sharedInstance]( &OBJC_CLASS___TVHKMediaServerDiscoverySettings,  "sharedInstance"));
  [v3 removeObserver:self forKeyPath:@"mediaServerDiscoveryConfiguration" context:off_11148];
}

- (void)_updateExternalValue
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaServerDiscoverySettings sharedInstance]( &OBJC_CLASS___TVHKMediaServerDiscoverySettings,  "sharedInstance"));
  id v6 = (id)objc_claimAutoreleasedReturnValue([v3 mediaServerDiscoveryConfiguration]);

  v4 = (void *)objc_claimAutoreleasedReturnValue([v6 homeSharingAccountName]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHAccountSettingsViewController externalValue](self, "externalValue"));

  if (v4 != v5) {
    -[TVHAccountSettingsViewController setExternalValue:](self, "setExternalValue:", v4);
  }
}

- (void)_enableHomeSharing
{
  v4 = objc_alloc_init(&OBJC_CLASS___TVHAccountSetupViewController);
  -[TVHAccountSetupViewController setDelegate:](v4, "setDelegate:", self);
  -[TVHAccountSettingsViewController setAuthenticationInProgress:](self, "setAuthenticationInProgress:", 1LL);
  -[TVHAccountSettingsViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHAccountSettingsViewController navigationController](self, "navigationController"));
  [v3 pushViewController:v4 animated:1];
}

- (void)_disableHomeSharing
{
}

- (void)_updateEnableItem:(id)a3
{
  id v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaServerDiscoverySettings sharedInstance]( &OBJC_CLASS___TVHKMediaServerDiscoverySettings,  "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 mediaServerDiscoveryConfiguration]);

  objc_msgSend(v10, "setHidden:", objc_msgSend(v5, "isDiscoveringHomeShareServers"));
  if (-[TVHAccountSettingsViewController isAuthenticationInProgress](self, "isAuthenticationInProgress"))
  {
    [v10 setEnabled:0];
    [v10 setAccessoryTypes:4];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVHomeSharingAccountSettings"));
    objc_super v7 = v6;
    v8 = @"SIGNING_IN_TITLE";
  }

  else
  {
    [v10 setEnabled:1];
    [v10 setAccessoryTypes:0];
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVHomeSharingAccountSettings"));
    objc_super v7 = v6;
    v8 = @"ENABLE_HOME_SHARING_TITLE";
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedStringForKey:v8 value:0 table:0]);
  [v10 setLocalizedTitle:v9];
}

- (void)_updateDisableItem:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaServerDiscoverySettings sharedInstance]( &OBJC_CLASS___TVHKMediaServerDiscoverySettings,  "sharedInstance"));
  id v10 = (id)objc_claimAutoreleasedReturnValue([v4 mediaServerDiscoveryConfiguration]);

  unsigned int v5 = [v10 isDiscoveringHomeShareServers];
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v10 homeSharingAccountName]);
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVHomeSharingAccountSettings"));
    v8 = (void *)objc_claimAutoreleasedReturnValue( [v7 localizedStringForKey:@"DISABLE_HOME_SHARING_DESCRIPTION_FORMAT" value:0 table:0]);

    if (v6) {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v8, v6));
    }
    else {
      v9 = 0LL;
    }
  }

  else
  {
    v9 = 0LL;
  }

  [v3 setLocalizedDescription:v9];
  [v3 setHidden:v5 ^ 1];
}

- (void)_showSuccessDialogWithAccountName:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVHomeSharingAccountSettings"));
  id v14 = (id)objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:@"HOME_SHARING_ENABLED_TITLE" value:0 table:0]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVHomeSharingAccountSettings"));
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue( [v6 localizedStringForKey:@"HOME_SHARING_ENABLED_DESCRIPTION_FORMAT" value:0 table:0]);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v7, v4));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v14,  v8,  1LL));

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVHomeSharingAccountSettings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedStringForKey:@"OK_TITLE" value:0 table:0]);

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v11,  1LL,  0LL));
  [v9 addAction:v12];
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVHAccountSettingsViewController navigationController](self, "navigationController"));
  [v13 presentViewController:v9 animated:1 completion:0];
}

- (void)_showConfirmDisableDialog
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVHomeSharingAccountSettings"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:@"CONFIRM_DISABLE_TITLE" value:0 table:0]);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVHomeSharingAccountSettings"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:@"CONFIRM_DISABLE_MESSAGE" value:0 table:0]);
  id v14 = (id)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v4,  v6,  1LL));

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVHomeSharingAccountSettings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedStringForKey:@"DISABLE_TITLE" value:0 table:0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v8,  0LL,  &stru_C3D8));

  [v14 addAction:v9];
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVHomeSharingAccountSettings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedStringForKey:@"CANCEL_TITLE" value:0 table:0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v11,  1LL,  0LL));

  [v14 addAction:v12];
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVHAccountSettingsViewController navigationController](self, "navigationController"));
  [v13 presentViewController:v14 animated:1 completion:0];
}

- (void)accountSetupViewController:(id)a3 didSucceedWithAccountName:(id)a4
{
  id v7 = a4;
  -[TVHAccountSettingsViewController setAuthenticationInProgress:](self, "setAuthenticationInProgress:", 0LL);
  -[TVHAccountSettingsViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHAccountSettingsViewController navigationController](self, "navigationController"));
  id v6 = [v5 popToViewController:self animated:1];

  -[TVHAccountSettingsViewController _showSuccessDialogWithAccountName:](self, "_showSuccessDialogWithAccountName:", v7);
}

- (void)accountSetupViewControllerDidCancel:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHAccountSettingsViewController navigationController](self, "navigationController"));
  id v4 = [v5 popToViewController:self animated:1];
}

- (id)externalValue
{
  return self->_externalValue;
}

- (void)setExternalValue:(id)a3
{
}

- (BOOL)isAuthenticationInProgress
{
  return self->_authenticationInProgress;
}

- (void)setAuthenticationInProgress:(BOOL)a3
{
  self->_authenticationInProgress = a3;
}

- (void).cxx_destruct
{
}

@end