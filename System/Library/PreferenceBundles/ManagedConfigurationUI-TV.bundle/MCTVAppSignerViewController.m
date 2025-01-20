@interface MCTVAppSignerViewController
- (BOOL)isRemovingApps;
- (BOOL)isTrustingApps;
- (BOOL)isVerifyingApps;
- (MCTVAppSignerViewController)initWithAppSigner:(id)a3;
- (MCUIAppSigner)appSigner;
- (MDMProvisioningProfileTrust)profileTrust;
- (TSKSettingGroup)appsGroup;
- (id)_sharedGroup;
- (id)_signerMessageString;
- (id)loadSettingGroups;
- (id)previewForItemAtIndexPath:(id)a3;
- (void)_appSignersDidChange;
- (void)_appSignersUpdated:(id)a3;
- (void)_presentAlertWithTitle:(id)a3 message:(id)a4;
- (void)_presentNetworkRequiredAlert;
- (void)_presentTrustFailedAlert;
- (void)_removeAppSignerApps;
- (void)_trust;
- (void)_verify;
- (void)dealloc;
- (void)removeApps:(id)a3;
- (void)setIsRemovingApps:(BOOL)a3;
- (void)setIsTrustingApps:(BOOL)a3;
- (void)setIsVerifyingApps:(BOOL)a3;
- (void)setProfileTrust:(id)a3;
- (void)trustProfile:(id)a3;
- (void)verifyApps:(id)a3;
@end

@implementation MCTVAppSignerViewController

- (MCTVAppSignerViewController)initWithAppSigner:(id)a3
{
  id v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___MCTVAppSignerViewController;
  v6 = -[MCTVAppSignerViewController initWithStyle:](&v27, "initWithStyle:", 1LL);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_appSigner, a3);
    v8 = objc_alloc(&OBJC_CLASS___MDMProvisioningProfileTrust);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    v10 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    v11 = -[MDMProvisioningProfileTrust initWithValidationQueue:](v8, "initWithValidationQueue:", v10);
    profileTrust = v7->_profileTrust;
    v7->_profileTrust = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue([v5 displayName]);
    -[MCTVAppSignerViewController setTitle:](v7, "setTitle:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v14 addObserver:v7 selector:"_appSignersUpdated:" name:@"kMCUIAppSignersUpdatedNotification" object:v5];

    objc_initWeak(&location, v7);
    v15 = (const char *)[DMCSettingsChangedNotification UTF8String];
    v16 = &_dispatch_main_q;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_2E1C;
    handler[3] = &unk_285E8;
    objc_copyWeak(&v25, &location);
    notify_register_dispatch(v15, &dword_311B8, &_dispatch_main_q, handler);

    v17 = (const char *)[DMCUPPTrustFailedNotification UTF8String];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_2E4C;
    v22[3] = &unk_285E8;
    objc_copyWeak(&v23, &location);
    notify_register_dispatch(v17, &dword_311BC, &_dispatch_main_q, v22);

    v18 = (const char *)[DMCUPPVerificationOfflineNotification UTF8String];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_2E7C;
    v20[3] = &unk_285E8;
    objc_copyWeak(&v21, &location);
    notify_register_dispatch(v18, (int *)&unk_311C0, &_dispatch_main_q, v20);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MCTVAppSignerViewController;
  -[MCTVAppSignerViewController dealloc](&v4, "dealloc");
}

- (void)_appSignersUpdated:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_2F98;
  v3[3] = &unk_28610;
  objc_copyWeak(&v4, &location);
  dispatch_async(&_dispatch_main_q, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_appSignersDidChange
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVAppSignerViewController appSigner](self, "appSigner"));
  [v3 refreshApplications];

  -[MCTVAppSignerViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
}

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVAppSignerViewController appSigner](self, "appSigner"));
  objc_initWeak(&location, self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  0LL,  0LL,  0LL,  0LL,  self,  0LL));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_33E0;
  v26[3] = &unk_28638;
  objc_copyWeak(&v28, &location);
  id v5 = v3;
  id v27 = v5;
  [v4 setUpdateBlock:v26];
  v32 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v32, 1LL));
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v6));

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  0LL,  0LL,  0LL,  0LL,  self,  "trustProfile:"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_3578;
  v23[3] = &unk_28638;
  objc_copyWeak(&v25, &location);
  id v8 = v5;
  id v24 = v8;
  [v7 setUpdateBlock:v23];
  v31 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v31, 1LL));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v9));

  uint64_t v11 = TSKLocString(@"SignedAppsSectionTitleFormat");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v8 displayName]);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v12, v13));

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_3700;
  v20[3] = &unk_28688;
  objc_copyWeak(&v22, &location);
  id v15 = v8;
  id v21 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  v14,  v15,  @"applications",  v20));
  objc_storeStrong((id *)&self->_appsGroup, v16);
  v30[0] = v19;
  v30[1] = v10;
  v30[2] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v30, 3LL));

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v25);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

  return v17;
}

- (id)previewForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = (TSKSettingGroup *)objc_claimAutoreleasedReturnValue( -[MCTVAppSignerViewController settingGroupAtIndex:]( self,  "settingGroupAtIndex:",  [v4 section]));
  if (v5 == self->_appsGroup)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVAppSignerViewController settingItemAtIndexPath:](self, "settingItemAtIndexPath:", v4));

    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 representedObject]);
    v10 = objc_alloc(&OBJC_CLASS___UIImageView);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 iconForVariant:0]);
    v12 = -[UIImageView initWithImage:](v10, "initWithImage:", v11);

    -[UIImageView setBounds:](v12, "setBounds:", 0.0, 0.0, 370.0, 222.0);
    id v7 = objc_alloc_init(&OBJC_CLASS___TSKPreviewViewController);
    [v7 setContentView:v12];
  }

  else
  {
    v14.receiver = self;
    v14.super_class = (Class)&OBJC_CLASS___MCTVAppSignerViewController;
    id v6 = -[MCTVAppSignerViewController previewForItemAtIndexPath:](&v14, "previewForItemAtIndexPath:", v4);
    id v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  }

  return v7;
}

- (id)_sharedGroup
{
  if (qword_311D0 != -1) {
    dispatch_once(&qword_311D0, &stru_286C8);
  }
  return (id)qword_311C8;
}

- (void)verifyApps:(id)a3
{
  id v4 = a3;
  if (+[TVSNetworkUtilities internetAvailable](&OBJC_CLASS___TVSNetworkUtilities, "internetAvailable"))
  {
    -[MCTVAppSignerViewController _presentNetworkRequiredAlert](self, "_presentNetworkRequiredAlert");
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCUIAppSigner applications](self->_appSigner, "applications"));
    id v6 = (char *)[v5 count];

    if (v6)
    {
      if (v6 == (_BYTE *)&dword_0 + 1)
      {
        id v7 = MCUILocalizedString(@"APP_SIGNER_VERIFY_APP_SINGULAR_ALERT_TITLE_%@");
        id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVAppSignerViewController appSigner](self, "appSigner"));
        v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identity]);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v8, v10));
        v12 = @"APP_SIGNER_VERIFY_APP_SINGULAR_ALERT";
      }

      else
      {
        id v13 = MCUILocalizedString(@"APP_SIGNER_VERIFY_APP_PLURAL_ALERT_TITLE_%@");
        id v8 = (void *)objc_claimAutoreleasedReturnValue(v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVAppSignerViewController appSigner](self, "appSigner"));
        v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identity]);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v8, v10));
        v12 = @"APP_SIGNER_VERIFY_APP_PLURAL_ALERT";
      }

      id v14 = MCUILocalizedStringByDevice(v12);
      id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v11,  v15,  1LL));
      objc_initWeak(&location, self);
      id v17 = MCUILocalizedString(@"VERIFY");
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_3D14;
      v24[3] = &unk_286F0;
      objc_copyWeak(&v25, &location);
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v18,  0LL,  v24));
      [v16 addAction:v19];

      id v20 = MCUILocalizedString(@"CANCEL");
      id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      id v22 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v21,  1LL,  0LL));
      [v16 addAction:v22];

      id v23 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVAppSignerViewController navigationController](self, "navigationController"));
      [v23 presentViewController:v16 animated:1 completion:0];

      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);
    }
  }
}

- (void)removeApps:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCUIAppSigner applications](self->_appSigner, "applications"));
  id v6 = (char *)[v5 count];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCUIAppSigner applications](self->_appSigner, "applications"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);

  if (v8)
  {
    id v9 = [[DMCApplicationProxy alloc] initWithBundleID:v8 dataSource:0];
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);
  }

  else
  {
    v10 = 0LL;
  }

  if (v6 == (_BYTE *)&dword_0 + 1)
  {
    id v11 = MCUILocalizedString(@"DELETE_APP_WARNING_ONE_%@");
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v12, v10));

    objc_initWeak(&location, self);
LABEL_8:
    id v18 = MCUILocalizedString(@"DELETE_APP_SINGULAR");
    uint64_t v17 = objc_claimAutoreleasedReturnValue(v18);
    goto LABEL_9;
  }

  id v14 = MCUILocalizedString(@"DELETE_APP_WARNING_MULTIPLE_%d_%@");
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v15,  ((_DWORD)v6 - 1),  v10));

  objc_initWeak(&location, self);
  if (!v6) {
    goto LABEL_8;
  }
  id v16 = MCUILocalizedString(@"DELETE_APP_PLURAL");
  uint64_t v17 = objc_claimAutoreleasedReturnValue(v16);
LABEL_9:
  v19 = (void *)v17;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_4090;
  v26[3] = &unk_286F0;
  objc_copyWeak(&v27, &location);
  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v19,  2LL,  v26));
  id v21 = MCUILocalizedString(@"CANCEL");
  id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  id v23 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v22,  1LL,  0LL));

  id v24 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  0LL,  v13,  1LL));
  [v24 addAction:v20];
  [v24 addAction:v23];
  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVAppSignerViewController navigationController](self, "navigationController"));
  [v25 presentViewController:v24 animated:1 completion:0];

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

- (void)_presentTrustFailedAlert
{
  id v3 = MCUILocalizedString(@"APP_SIGNER_TRUST_FAILED_TITLE_%@");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVAppSignerViewController appSigner](self, "appSigner"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identity]);
  id v12 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v4, v6));

  id v7 = MCUILocalizedString(@"APP_SIGNER_TRUST_FAILED_MESSAGE_%@");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVAppSignerViewController appSigner](self, "appSigner"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identity]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v8, v10));

  -[MCTVAppSignerViewController _presentAlertWithTitle:message:](self, "_presentAlertWithTitle:message:", v12, v11);
}

- (void)_presentNetworkRequiredAlert
{
  id v3 = MCUILocalizedString(@"APP_SIGNER_REQUIRES_NETWORK_TITLE_%@");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVAppSignerViewController appSigner](self, "appSigner"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identity]);
  id v12 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v4, v6));

  id v7 = MCUILocalizedStringByDevice(@"APP_SIGNER_REQUIRES_NETWORK_ALERT_%@");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVAppSignerViewController appSigner](self, "appSigner"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identity]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v8, v10));

  -[MCTVAppSignerViewController _presentAlertWithTitle:message:](self, "_presentAlertWithTitle:message:", v12, v11);
}

- (void)_presentAlertWithTitle:(id)a3 message:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVAppSignerViewController presentedViewController](self, "presentedViewController"));

  if (!v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v13,  v6,  1LL));
    id v9 = MCUILocalizedString(@"CANCEL");
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v10,  1LL,  0LL));

    [v8 addAction:v11];
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVAppSignerViewController navigationController](self, "navigationController"));
    [v12 presentViewController:v8 animated:1 completion:0];
  }
}

- (void)_removeAppSignerApps
{
  appSigner = self->_appSigner;
  id v4 = objc_opt_new(&OBJC_CLASS___MCUIConcreteAppSignerUninstaller);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVAppSignerViewController _sharedGroup](self, "_sharedGroup"));
  id v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472LL;
  id v8 = sub_454C;
  id v9 = &unk_28610;
  objc_copyWeak(&v10, &location);
  +[MCUIAppSignerUninstallerUtilities uninstallAppSigner:withUninstaller:dispatchGroup:completion:]( &OBJC_CLASS___MCUIAppSignerUninstallerUtilities,  "uninstallAppSigner:withUninstaller:dispatchGroup:completion:",  appSigner,  v4,  v5,  &v6);

  -[MCTVAppSignerViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded", v6, v7, v8, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)trustProfile:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVAppSignerViewController appSigner](self, "appSigner", a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 applications]);
  id v6 = [v5 count];

  if (v6)
  {
    -[MCTVAppSignerViewController _trust](self, "_trust");
  }

  else
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[MCTVAppSignerViewController appSigner](self, "appSigner"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v8 displayName]);
    NSLog(@"MCTVAppSignerViewController: App signer %@ does not have any apps to trust", v7);
  }

- (void)_trust
{
  id v3 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[MCTVAppSignerViewController _sharedGroup](self, "_sharedGroup"));
  id v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472LL;
  id v6 = sub_4738;
  uint64_t v7 = &unk_28610;
  objc_copyWeak(&v8, &location);
  dispatch_group_notify(v3, &_dispatch_main_q, &v4);

  -[MCTVAppSignerViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded", v4, v5, v6, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_verify
{
  id v3 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[MCTVAppSignerViewController _sharedGroup](self, "_sharedGroup"));
  id v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472LL;
  id v6 = sub_4A20;
  uint64_t v7 = &unk_28610;
  objc_copyWeak(&v8, &location);
  dispatch_group_notify(v3, &_dispatch_main_q, &v4);

  -[MCTVAppSignerViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded", v4, v5, v6, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (id)_signerMessageString
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVAppSignerViewController appSigner](self, "appSigner"));
  unsigned int v4 = [v3 isTrusted];

  if (v4) {
    uint64_t v5 = @"APP_SIGNER_TRUSTED_DESCRIPTION_%@";
  }
  else {
    uint64_t v5 = @"APP_SIGNER_NOT_TRUSTED_DESCRIPTION_%@";
  }
  id v6 = MCUILocalizedStringByDevice(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVAppSignerViewController appSigner](self, "appSigner"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identity]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v7, v9));

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVAppSignerViewController appSigner](self, "appSigner"));
  LODWORD(v8) = [v11 isTrustable];

  if ((_DWORD)v8)
  {
    id v12 = v10;
  }

  else
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVAppSignerViewController appSigner](self, "appSigner"));
    unsigned int v14 = [v13 isTrusted];

    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    if (v14)
    {
      uint64_t v22 = MCFeatureAppRemovalAllowed;
      id v16 = &v22;
    }

    else
    {
      uint64_t v21 = MCFeatureEnterpriseAppTrustAllowed;
      id v16 = &v21;
    }

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 1LL));
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v15 localizedRestrictionSourceDescriptionForFeatures:v17]);

    if (v18) {
      id v19 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@\n\n%@",  v10,  v18));
    }
    else {
      id v19 = v10;
    }
    id v12 = v19;
  }

  return v12;
}

- (MCUIAppSigner)appSigner
{
  return self->_appSigner;
}

- (TSKSettingGroup)appsGroup
{
  return self->_appsGroup;
}

- (BOOL)isRemovingApps
{
  return self->_isRemovingApps;
}

- (void)setIsRemovingApps:(BOOL)a3
{
  self->_isRemovingApps = a3;
}

- (BOOL)isVerifyingApps
{
  return self->_isVerifyingApps;
}

- (void)setIsVerifyingApps:(BOOL)a3
{
  self->_isVerifyingApps = a3;
}

- (BOOL)isTrustingApps
{
  return self->_isTrustingApps;
}

- (void)setIsTrustingApps:(BOOL)a3
{
  self->_isTrustingApps = a3;
}

- (MDMProvisioningProfileTrust)profileTrust
{
  return self->_profileTrust;
}

- (void)setProfileTrust:(id)a3
{
}

- (void).cxx_destruct
{
}

@end