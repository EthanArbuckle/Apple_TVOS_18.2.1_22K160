@interface MCTVRemoveProfileViewController
- (BOOL)_isDeviceProvisionallyEnrolled;
- (BOOL)isMDMProfile:(id)a3;
- (BOOL)isUnremovableProfile:(id)a3;
- (MCTVRemoveProfileViewController)initWithProfile:(id)a3;
- (MCTVRemoveProfileViewController)initWithProfile:(id)a3 mode:(int)a4;
- (UIAlertController)activeAlertController;
- (UITextField)passwordField;
- (id)_mdmProfileRemovalAlertBody;
- (id)loadSettingGroups;
- (id)title;
- (void)_cancelActiveAlertController:(BOOL)a3;
- (void)_leaveRemoteManagementAndErase;
- (void)_profileRemovalDidFinish;
- (void)_profilesUpdated:(id)a3;
- (void)_removeProfileAction;
- (void)_resetDevice;
- (void)_showEraseDeviceAlert;
- (void)_showReEnrollFailureAlert;
- (void)_showWrongRemovalPasswordAlert;
- (void)_updateProfileAction;
- (void)dealloc;
- (void)performRemoveAfterFinalVerification;
- (void)setActiveAlertController:(id)a3;
- (void)setPasswordField:(id)a3;
@end

@implementation MCTVRemoveProfileViewController

- (MCTVRemoveProfileViewController)initWithProfile:(id)a3
{
  return -[MCTVRemoveProfileViewController initWithProfile:mode:](self, "initWithProfile:mode:", a3, 2LL);
}

- (MCTVRemoveProfileViewController)initWithProfile:(id)a3 mode:(int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MCTVRemoveProfileViewController;
  v4 = -[MCTVInstallProfileViewController initWithProfile:mode:](&v7, "initWithProfile:mode:", a3, *(void *)&a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v5 addObserver:v4 selector:"_profilesUpdated:" name:@"kMCUIProfilesUpdatedNotification" object:0];
  }

  return v4;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:@"kMCUIProfilesUpdatedNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MCTVRemoveProfileViewController;
  -[MCTVInstallProfileViewController dealloc](&v4, "dealloc");
}

- (id)title
{
  return MCUILocalizedString(@"SINGULAR_BLOBS_DESIGNATION");
}

- (void)_profilesUpdated:(id)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVRemoveProfileViewController navigationController](self, "navigationController", a3));
  v5 = (MCTVRemoveProfileViewController *)objc_claimAutoreleasedReturnValue([v4 visibleViewController]);

  if (v5 == self)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVProfileViewController profile](self, "profile"));
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);

    if (!v7)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVRemoveProfileViewController navigationController](self, "navigationController"));
      id v19 = [v18 popViewControllerAnimated:1];

LABEL_16:
      return;
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 installedProfilesWithFilterFlags:1]);

    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v10 = v9;
    id v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      id v12 = v11;
      char v13 = 0;
      uint64_t v14 = *(void *)v23;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v10);
          }
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * (void)i), "identifier", (void)v22));
          unsigned __int8 v17 = [v7 isEqualToString:v16];

          v13 |= v17;
        }

        id v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }

      while (v12);

      if ((v13 & 1) != 0) {
        goto LABEL_15;
      }
    }

    else
    {
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVRemoveProfileViewController navigationController](self, "navigationController", (void)v22));
    id v21 = [v20 popViewControllerAnimated:1];

LABEL_15:
    goto LABEL_16;
  }

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVProfileViewController profile](self, "profile"));
  if (v3)
  {
    id v4 = MCUILocalizedString(@"PROFILE_UPDATE_PROFILE");
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v5,  0LL,  0LL,  0LL,  self,  "_updateProfileAction"));

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_116E4;
    v27[3] = &unk_28660;
    id v7 = v3;
    id v28 = v7;
    [v6 setUpdateBlock:v27];
    v31 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v31, 1LL));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v8));

    if (-[MCTVRemoveProfileViewController isMDMProfile:](self, "isMDMProfile:", v7)
      && -[MCTVRemoveProfileViewController _isDeviceProvisionallyEnrolled](self, "_isDeviceProvisionallyEnrolled"))
    {
      id v10 = @"MOBILE_DEVICE_MANAGEMENT_LEAVE_REMOTE_MANAGEMENT";
    }

    else
    {
      id v10 = @"BLOB_REMOVE_TITLE";
    }

    id v11 = MCUILocalizedString(v10);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    objc_initWeak(&location, self);
    char v13 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v12,  0LL,  0LL,  0LL,  self,  "_removeProfileAction"));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_11780;
    v23[3] = &unk_28638;
    objc_copyWeak(&v25, &location);
    id v24 = v7;
    [v13 setUpdateBlock:v23];
    v30 = v13;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v30, 1LL));
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v14));

    v22.receiver = self;
    v22.super_class = (Class)&OBJC_CLASS___MCTVRemoveProfileViewController;
    id v16 = -[MCTVInstallProfileViewController loadSettingGroups](&v22, "loadSettingGroups");
    unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v29[0] = v9;
    v29[1] = v15;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v29, 2LL));
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v17 arrayByAddingObjectsFromArray:v18]);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  else
  {
    id v20 = MCTVLoggingFacility();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location) = 0;
      _os_log_impl( &dword_0,  (os_log_t)v6,  OS_LOG_TYPE_DEFAULT,  "Ignoring MCTVRemoveProfileViewController loadSettingsGroup because profile is nil",  (uint8_t *)&location,  2u);
    }

    id v19 = &__NSArray0__struct;
  }

  return v19;
}

- (BOOL)isMDMProfile:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___MCConfigurationProfile);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    unsigned __int8 v5 = [v3 isMDMProfile];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)isUnremovableProfile:(id)a3
{
  id v4 = a3;
  if (-[MCTVRemoveProfileViewController isMDMProfile:](self, "isMDMProfile:", v4)) {
    unsigned int v5 = !-[MCTVRemoveProfileViewController _isDeviceProvisionallyEnrolled](self, "_isDeviceProvisionallyEnrolled");
  }
  else {
    LOBYTE(v5) = 1;
  }
  if ([v4 isLocked])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 removalPasscode]);
    if (v6) {
      LOBYTE(v5) = 0;
    }
  }

  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)_isDeviceProvisionallyEnrolled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  unsigned __int8 v3 = [v2 isProvisionallyEnrolled];

  return v3;
}

- (void)_updateProfileAction
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVProfileViewController profile](self, "profile"));
  unsigned int v4 = [v3 isManagedByProfileService];

  if (v4) {
    -[MCTVInstallProfileViewController _performReEnroll](self, "_performReEnroll");
  }
  else {
    -[MCTVRemoveProfileViewController _showReEnrollFailureAlert](self, "_showReEnrollFailureAlert");
  }
}

- (void)_showReEnrollFailureAlert
{
  id v3 = MCUILocalizedString(@"OK");
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  uint64_t v14 = sub_11ACC;
  v15 = &unk_286F0;
  objc_copyWeak(&v16, &location);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v4,  1LL,  &v12));

  id v6 = MCUILocalizedString(@"PROFILE_UPDATE_ERROR");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = MCUILocalizedString(@"PROFILE_REENROLL_ERROR");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v7,  v9,  1LL,  v12,  v13,  v14,  v15));

  [v10 addAction:v5];
  -[MCTVRemoveProfileViewController setActiveAlertController:](self, "setActiveAlertController:", v10);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVRemoveProfileViewController navigationController](self, "navigationController"));
  [v11 presentViewController:v10 animated:1 completion:0];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)_removeProfileAction
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVProfileViewController profile](self, "profile"));
  if ([v3 isLocked])
  {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 removalPasscode]);
    BOOL v5 = v4 != 0LL;
  }

  else
  {
    BOOL v5 = 0;
  }

  unsigned int v6 = -[MCTVRemoveProfileViewController isMDMProfile:](self, "isMDMProfile:", v3);
  unsigned int v7 = -[MCTVRemoveProfileViewController _isDeviceProvisionallyEnrolled](self, "_isDeviceProvisionallyEnrolled");
  if (v6)
  {
    BOOL v8 = v7 == 0;
    if (v7) {
      v9 = @"MOBILE_DEVICE_MANAGEMENT_LEAVE_REMOTE_MANAGEMENT";
    }
    else {
      v9 = @"MOBILE_DEVICE_MANAGEMENT_REMOVE_TITLE";
    }
    if (v8) {
      id v10 = @"REMOVE";
    }
    else {
      id v10 = @"LEAVE";
    }
    id v11 = MCUILocalizedString(v9);
    id v28 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVRemoveProfileViewController _mdmProfileRemovalAlertBody](self, "_mdmProfileRemovalAlertBody"));
  }

  else
  {
    if (v5) {
      id v12 = @"PROFILE_REMOVE_WARNING_TITLE_PROTECTED";
    }
    else {
      id v12 = @"PROFILE_REMOVE_WARNING_TITLE";
    }
    if (v5) {
      uint64_t v13 = @"PROFILE_REMOVE_WARNING_PROTECTED";
    }
    else {
      uint64_t v13 = @"PROFILE_REMOVE_WARNING";
    }
    id v14 = MCUILocalizedString(v12);
    id v28 = (void *)objc_claimAutoreleasedReturnValue(v14);
    id v15 = MCUILocalizedStringByDevice(v13);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v15);
    id v10 = @"REMOVE";
  }

  id v16 = MCUILocalizedString(v10);
  unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  objc_initWeak(location, self);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_11E70;
  v34[3] = &unk_286F0;
  objc_copyWeak(&v35, location);
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v17,  2LL,  v34));
  id v19 = MCUILocalizedString(@"CANCEL");
  id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_12014;
  v32[3] = &unk_286F0;
  objc_copyWeak(&v33, location);
  id v21 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v20,  1LL,  v32));

  objc_super v22 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v28,  v27,  1LL));
  [v22 addAction:v18];
  [v22 addAction:v21];
  if (v5)
  {
    id v23 = MCUILocalizedString(@"REMOVAL_PASSCODE");
    id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    void v29[2] = sub_12048;
    v29[3] = &unk_28D08;
    objc_copyWeak(&v31, location);
    id v25 = v24;
    id v30 = v25;
    [v22 addTextFieldWithConfigurationHandler:v29];

    objc_destroyWeak(&v31);
  }

  -[MCTVRemoveProfileViewController setActiveAlertController:](self, "setActiveAlertController:", v22);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVRemoveProfileViewController navigationController](self, "navigationController"));
  [v26 presentViewController:v22 animated:1 completion:0];

  objc_destroyWeak(&v33);
  objc_destroyWeak(&v35);
  objc_destroyWeak(location);
}

- (void)_showEraseDeviceAlert
{
  id v3 = MCUILocalizedString(@"ERASE_ALERT_TITLE_APPLETV");
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = MCUILocalizedString(@"ERASE_ALERT_BODY");
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v4,  v6,  1LL));
  -[MCTVRemoveProfileViewController setActiveAlertController:](self, "setActiveAlertController:", v7);

  objc_initWeak(&location, self);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVRemoveProfileViewController activeAlertController](self, "activeAlertController"));
  id v9 = MCUILocalizedString(@"ERASE");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_12304;
  v19[3] = &unk_286F0;
  objc_copyWeak(&v20, &location);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v10,  2LL,  v19));
  [v8 addAction:v11];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVRemoveProfileViewController activeAlertController](self, "activeAlertController"));
  id v13 = MCUILocalizedString(@"CANCEL");
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_123D8;
  v17[3] = &unk_286F0;
  objc_copyWeak(&v18, &location);
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v14,  1LL,  v17));
  [v12 addAction:v15];

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVRemoveProfileViewController activeAlertController](self, "activeAlertController"));
  -[MCTVRemoveProfileViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v16,  1LL,  0LL);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (void)_leaveRemoteManagementAndErase
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_124D0;
  v3[3] = &unk_28D30;
  objc_copyWeak(&v4, &location);
  [v2 unenrollWithCompletionBlock:v3];

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_resetDevice
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[PBSSystemServiceConnection sharedConnection]( &OBJC_CLASS___PBSSystemServiceConnection,  "sharedConnection"));
  v2 = (void *)objc_claimAutoreleasedReturnValue([v3 osUpdateServiceProxy]);
  [v2 obliterateDataPreservingPaths:0 withCompletion:&stru_28D70];
}

- (void)_showWrongRemovalPasswordAlert
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVRemoveProfileViewController activeAlertController](self, "activeAlertController"));

  if (v3)
  {
    id v4 = MCTVLoggingFacility();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl( &dword_0,  v5,  OS_LOG_TYPE_DEFAULT,  "MCTVRemoveProfileViewController: Shouldn't already have an alert",  (uint8_t *)buf,  2u);
    }
  }

  else
  {
    id v6 = MCUILocalizedString(@"BLOB_REMOVE_TITLE_PROTECTED");
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    id v7 = MCUILocalizedString(@"BLOB_REMOVE_FAILURE_PROTECTED");
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v5,  v8,  1LL));
    objc_initWeak(buf, self);
    id v10 = MCUILocalizedString(@"CANCEL");
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_12AB8;
    v14[3] = &unk_286F0;
    objc_copyWeak(&v15, buf);
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v11,  1LL,  v14));
    [v9 addAction:v12];

    -[MCTVRemoveProfileViewController setActiveAlertController:](self, "setActiveAlertController:", v9);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVRemoveProfileViewController navigationController](self, "navigationController"));
    [v13 presentViewController:v9 animated:1 completion:0];

    objc_destroyWeak(&v15);
    objc_destroyWeak(buf);
  }
}

- (void)_profileRemovalDidFinish
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVProfileViewController profile](self, "profile"));
  unsigned int v4 = [v3 needsReboot];

  if (v4)
  {
    objc_initWeak(&location, self);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_12BF0;
    v7[3] = &unk_28610;
    objc_copyWeak(&v8, &location);
    -[MCTVInstallProfileViewController _showRebootAlert:](self, "_showRebootAlert:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

  else
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[MCTVRemoveProfileViewController navigationController](self, "navigationController"));
    id v5 = [v6 popViewControllerAnimated:1];
  }

- (void)performRemoveAfterFinalVerification
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVProfileViewController profile](self, "profile"));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___MCConfigurationProfile);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0
    && [v3 isMDMProfile]
    && -[MCTVRemoveProfileViewController _isDeviceProvisionallyEnrolled](self, "_isDeviceProvisionallyEnrolled"))
  {
    -[MCTVRemoveProfileViewController _showEraseDeviceAlert](self, "_showEraseDeviceAlert");
  }

  else
  {
    objc_initWeak(&location, self);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVProfileViewController profile](self, "profile"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_12D94;
    v8[3] = &unk_28610;
    objc_copyWeak(&v9, &location);
    [v5 removeProfileWithIdentifier:v7 completion:v8];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)_cancelActiveAlertController:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVRemoveProfileViewController activeAlertController](self, "activeAlertController"));
  [v5 dismissViewControllerAnimated:v3 completion:0];

  -[MCTVRemoveProfileViewController setActiveAlertController:](self, "setActiveAlertController:", 0LL);
}

- (id)_mdmProfileRemovalAlertBody
{
  if (-[MCTVRemoveProfileViewController _isDeviceProvisionallyEnrolled](self, "_isDeviceProvisionallyEnrolled"))
  {
    id v2 = MCUILocalizedString(@"MOBILE_DEVICE_MANAGEMENT_LEAVE_REMOTE_MANAGEMENT_ALERT_BODY_APPLETV");
    return (id)objc_claimAutoreleasedReturnValue(v2);
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[MDMManagedMediaReader managedAppIDsWithFlags:excludeDDMApps:]( &OBJC_CLASS___MDMManagedMediaReader,  "managedAppIDsWithFlags:excludeDDMApps:",  1LL,  1LL));
  id v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)i);
      }

      id v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }

    while (v9);
  }

  id v13 = v5;
  id v14 = (char *)-[NSMutableArray count](v13, "count");
  id v15 = v14;
  if ((uint64_t)v14 < 2)
  {
    if (v14 != (_BYTE *)&dword_0 + 1)
    {
      id v18 = 0LL;
      goto LABEL_18;
    }

    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v13, "firstObject"));
    unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v19));

    id v20 = MCUILocalizedStringByDevice(@"MOBILE_DEVICE_MANAGEMENT_REMOVE_WARNING_SINGULAR_APP_%@");
    id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    objc_super v22 = (void *)objc_claimAutoreleasedReturnValue([v17 localizedName]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v21, v22));
  }

  else
  {
    id v16 = MCUILocalizedStringByDevice(@"MOBILE_DEVICE_MANAGEMENT_REMOVE_WARNING_MULTIPLE_APPS_%ld");
    unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v17, v15));
  }

LABEL_18:
  return v18;
}

- (UITextField)passwordField
{
  return self->_passwordField;
}

- (void)setPasswordField:(id)a3
{
}

- (UIAlertController)activeAlertController
{
  return self->_activeAlertController;
}

- (void)setActiveAlertController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end