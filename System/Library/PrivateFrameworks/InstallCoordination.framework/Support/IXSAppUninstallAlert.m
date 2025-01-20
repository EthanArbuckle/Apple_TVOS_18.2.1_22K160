@interface IXSAppUninstallAlert
+ (id)_loadHBMCloudSyncUtilityClass;
- (BOOL)appManagedByManagedSettings;
- (BOOL)deviceHasOneHomeEnabled;
- (IXSAppUninstallAlert)initWithAppRecord:(id)a3 bundleIdentifier:(id)a4 removability:(unint64_t)a5 isManagedByManagedSettings:(BOOL)a6 deletionIsRestricted:(BOOL)a7;
- (NSString)appStringsTableName;
- (__CFBundle)appStringsBundle;
- (id)appInstalledFonts;
- (id)cancelButtonLabel;
- (id)customizedLocalizedStringForKey:(id)a3;
- (id)defaultButtonLabel;
- (id)localizedStringForKey:(id)a3 withFormatHint:(id)a4;
- (id)message;
- (id)optionalButtonForNotRemovableAppActionURL;
- (id)optionalButtonForNotRemovableAppLabel;
- (id)otherButtonLabel;
- (id)title;
- (void)dealloc;
- (void)otherButtonActionWithCompletion:(id)a3;
@end

@implementation IXSAppUninstallAlert

- (IXSAppUninstallAlert)initWithAppRecord:(id)a3 bundleIdentifier:(id)a4 removability:(unint64_t)a5 isManagedByManagedSettings:(BOOL)a6 deletionIsRestricted:(BOOL)a7
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___IXSAppUninstallAlert;
  v8 = -[IXSUninstallAlert initWithAppRecord:bundleIdentifier:removability:deletionIsRestricted:]( &v12,  "initWithAppRecord:bundleIdentifier:removability:deletionIsRestricted:",  a3,  a4,  a5,  a7);
  v9 = v8;
  if (v8)
  {
    -[IXSUninstallAlert setTypeDescription:](v8, "setTypeDescription:", @"App");
    v9->_appManagedByManagedSettings = a6;
    v9->_appStringsBundle = 0LL;
    appStringsTableName = v9->_appStringsTableName;
    v9->_appStringsTableName = 0LL;
  }

  return v9;
}

+ (id)_loadHBMCloudSyncUtilityClass
{
  if (qword_1000E8EB8 != -1) {
    dispatch_once(&qword_1000E8EB8, &stru_1000CD9A0);
  }
  return (id)qword_1000E8EC0;
}

- (BOOL)deviceHasOneHomeEnabled
{
  v2 = (char *)objc_claimAutoreleasedReturnValue( +[IXSAppUninstallAlert _loadHBMCloudSyncUtilityClass]( &OBJC_CLASS___IXSAppUninstallAlert,  "_loadHBMCloudSyncUtilityClass"));
  if (v2) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = qword_1000E8EC8 == 0;
  }
  if (v3)
  {
    v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315650;
      v13 = "-[IXSAppUninstallAlert deviceHasOneHomeEnabled]";
      __int16 v14 = 2112;
      v15 = v2;
      __int16 v16 = 2048;
      uint64_t v17 = qword_1000E8EC8;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to load HeadBoardCloudSyncUtility with error %@, when trying to read state of One Home (_HBMCloudSync UtilityClass = %p)",  (uint8_t *)&v12,  0x20u);
    }

    goto LABEL_14;
  }

  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([(id)qword_1000E8EC8 sharedInstance]);
  v5 = v6;
  if (!v6)
  {
LABEL_14:
    LOBYTE(v7) = 0;
    goto LABEL_15;
  }

  unsigned int v7 = -[os_log_s isOneHomeScreenEnabled](v6, "isOneHomeScreenEnabled");
  v8 = sub_1000047B4((uint64_t)off_1000E8CA0);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = "is not";
    if (v7) {
      v10 = "is";
    }
    int v12 = 136315394;
    v13 = "-[IXSAppUninstallAlert deviceHasOneHomeEnabled]";
    __int16 v14 = 2080;
    v15 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: One Home Screen %s enabled on this device",  (uint8_t *)&v12,  0x16u);
  }

LABEL_15:
  return v7;
}

- (id)customizedLocalizedStringForKey:(id)a3
{
  v4 = (__CFString *)a3;
  v5 = -[IXSAppUninstallAlert appStringsBundle](self, "appStringsBundle");
  v6 = (const __CFString *)objc_claimAutoreleasedReturnValue(-[IXSAppUninstallAlert appStringsTableName](self, "appStringsTableName"));
  unsigned int v7 = (__CFString *)v6;
  v8 = 0LL;
  if (v5)
  {
    if (v6)
    {
      v8 = (__CFString *)CFBundleCopyLocalizedString(v5, v4, 0LL, v6);
      if (v8 == v4)
      {

        v9 = sub_1000047B4((uint64_t)off_1000E8CA0);
        v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[IXSUninstallAlert bundleIdentifier](self, "bundleIdentifier"));
          int v13 = 136315906;
          __int16 v14 = "-[IXSAppUninstallAlert customizedLocalizedStringForKey:]";
          __int16 v15 = 2112;
          __int16 v16 = v4;
          __int16 v17 = 2112;
          v18 = v7;
          __int16 v19 = 2112;
          v20 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s: A value for the custom uninstall message key %@ was not found in the strings file named %@ for the curre nt language in app %@; using default value instead",
            (uint8_t *)&v13,
            0x2Au);
        }

        v8 = 0LL;
      }
    }
  }

  return v8;
}

- (id)localizedStringForKey:(id)a3 withFormatHint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IXSAppUninstallAlert customizedLocalizedStringForKey:](self, "customizedLocalizedStringForKey:", v6));
  if (!v8)
  {
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___IXSAppUninstallAlert;
    id v9 = -[IXSUninstallAlert localizedStringForKey:withFormatHint:]( &v11,  "localizedStringForKey:withFormatHint:",  v6,  v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }

  return v8;
}

- (id)appInstalledFonts
{
  return 0LL;
}

- (id)title
{
  if ((id)-[IXSUninstallAlert appRemovability](self, "appRemovability") == (id)1)
  {
    if (-[IXSUninstallAlert needsDemoteOptionButton](self, "needsDemoteOptionButton"))
    {
      BOOL v3 = @"UNINSTALL_ICON_TITLE_MOVE_TO_APP_LIBRARY_OR_DELETE";
      v4 = @"Remove “%@”?";
    }

    else
    {
      BOOL v3 = @"UNINSTALL_ICON_TITLE_DELETE_WITH_NAME";
      v4 = @"Delete “%@”?";
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[IXSAppUninstallAlert localizedStringForKey:withFormatHint:]( self,  "localizedStringForKey:withFormatHint:",  v3,  v4));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXSUninstallAlert appRecord](self, "appRecord"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedName]);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v6, v8));
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( -[IXSAppUninstallAlert localizedStringForKey:withFormatHint:]( self,  "localizedStringForKey:withFormatHint:",  @"UNINSTALL_ICON_TITLE_NOT_ALLOWED",  @"Uninstall Not Allowed"));
  }

  return v5;
}

- (id)message
{
  if (!-[IXSUninstallAlert appIsRemovable](self, "appIsRemovable"))
  {
    id v18 = 0LL;
    unsigned int v9 = -[IXSUninstallAlert isMDMRestrictedWithOrganizationName:](self, "isMDMRestrictedWithOrganizationName:", &v18);
    id v10 = v18;
    objc_super v11 = v10;
    if (v9)
    {
      if (v10)
      {
        int v12 = (void *)objc_claimAutoreleasedReturnValue( -[IXSAppUninstallAlert localizedStringForKey:withFormatHint:]( self,  "localizedStringForKey:withFormatHint:",  @"UNINSTALL_ICON_BODY_RESTRICTED_BY_ORGANIZATION",  @"This app cannot be deleted because it is required by %@."));
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v12, v11));

LABEL_16:
        return v8;
      }

      __int16 v15 = @"UNINSTALL_ICON_BODY_RESTRICTED_BY_UNKNOWN_ORGANIZATION";
      __int16 v16 = @"This app cannot be deleted because it is required.";
    }

    else
    {
      __int16 v15 = @"UNINSTALL_ICON_BODY_NOT_ALLOWED";
      __int16 v16 = @"It is not possible to uninstall this app at this time.";
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue( -[IXSAppUninstallAlert localizedStringForKey:withFormatHint:]( self,  "localizedStringForKey:withFormatHint:",  v15,  v16));
    goto LABEL_16;
  }

  if (!-[IXSAppUninstallAlert appManagedByManagedSettings](self, "appManagedByManagedSettings"))
  {
    if (-[IXSUninstallAlert needsDemoteOptionButton](self, "needsDemoteOptionButton"))
    {
      int v13 = @"UNINSTALL_ICON_BODY_DELETE_OR_OFFLOAD";
      __int16 v14 = @"Deleting the app will also delete its data. You can offload the app to free up storage but keep its data.";
    }

    else
    {
      if (-[IXSAppUninstallAlert deviceHasOneHomeEnabled](self, "deviceHasOneHomeEnabled"))
      {
        BOOL v3 = @"UNINSTALL_ONE_HOME_ICON_BODY_DELETE_WITH_NAME";
        v4 = @"When you delete the “%@” app, you’ll delete it from any other Apple TVs with this default user. You will also delete all of its data.";
        goto LABEL_4;
      }

      if (-[IXSUninstallAlert appHasiCloudDataOrDocuments](self, "appHasiCloudDataOrDocuments"))
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue( -[IXSAppUninstallAlert localizedStringForKey:withFormatHint:]( self,  "localizedStringForKey:withFormatHint:",  @"UNINSTALL_ICON_BODY_DELETE_DATA_LEAVES_DOCUMENTS_IN_CLOUD",  @"Deleting this app will also delete its data, but any documents or data stored in iCloud will not be deleted."));
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v5));
        goto LABEL_5;
      }

      int v13 = @"UNINSTALL_ICON_BODY_DELETE_DATA";
      __int16 v14 = @"Deleting this app will also delete its data.";
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue( -[IXSAppUninstallAlert localizedStringForKey:withFormatHint:]( self,  "localizedStringForKey:withFormatHint:",  v13,  v14));
    return v8;
  }

  BOOL v3 = @"UNINSTALL_ICON_BODY_DELETE_APP_ENROLLED_IN_FAMILY_CONTROLS_WITH_NAME";
  v4 = @"“%@” is managing restrictions on this device, and deleting the app will require parent or guardian approval.";
LABEL_4:
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[IXSAppUninstallAlert localizedStringForKey:withFormatHint:]( self,  "localizedStringForKey:withFormatHint:",  v3,  v4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXSUninstallAlert appRecord](self, "appRecord"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedName]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v5, v7));

LABEL_5:
  return v8;
}

- (id)defaultButtonLabel
{
  return -[IXSAppUninstallAlert localizedStringForKey:withFormatHint:]( self,  "localizedStringForKey:withFormatHint:",  @"UNINSTALL_ICON_BUTTON_DELETE",  @"Delete");
}

- (id)cancelButtonLabel
{
  return -[IXSAppUninstallAlert localizedStringForKey:withFormatHint:]( self,  "localizedStringForKey:withFormatHint:",  @"UNINSTALL_ICON_BUTTON_CANCEL",  @"Cancel");
}

- (id)otherButtonLabel
{
  if (-[IXSUninstallAlert needsDemoteOptionButton](self, "needsDemoteOptionButton")) {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( -[IXSAppUninstallAlert localizedStringForKey:withFormatHint:]( self,  "localizedStringForKey:withFormatHint:",  @"UNINSTALL_ICON_BUTTON_OFFLOAD",  @"Offload"));
  }
  else {
    BOOL v3 = 0LL;
  }
  return v3;
}

- (id)optionalButtonForNotRemovableAppLabel
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[IXSUninstallAlert appRecord](self, "appRecord"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);
  id v10 = 0LL;
  BOOL v5 = sub_100031830(v4, 14LL, &v10);
  id v6 = v10;

  if (v5)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"UNINSTALL_ICON_OPTION_BUTTON_NOT_ALLOWED"]);
LABEL_6:
    v8 = (void *)v7;
    goto LABEL_7;
  }

  if (!-[IXSUninstallAlert appIsRemovable](self, "appIsRemovable"))
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue( -[IXSAppUninstallAlert localizedStringForKey:withFormatHint:]( self,  "localizedStringForKey:withFormatHint:",  @"UNINSTALL_ICON_OPTION_BUTTON_NOT_ALLOWED",  0LL));
    goto LABEL_6;
  }

  v8 = 0LL;
LABEL_7:

  return v8;
}

- (id)optionalButtonForNotRemovableAppActionURL
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[IXSUninstallAlert appRecord](self, "appRecord"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);
  id v14 = 0LL;
  BOOL v5 = sub_100031830(v4, 14LL, &v14);
  id v6 = v14;

  if (v5)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"SBUninstallIconOverrideNotAllowedButtonURL"]);
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString);
    id v9 = v7;
    if ((objc_opt_isKindOfClass(v9, v8) & 1) != 0) {
      id v10 = v9;
    }
    else {
      id v10 = 0LL;
    }
    objc_super v11 = v9;
  }

  else
  {
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[IXSUninstallAlert appRecord](self, "appRecord"));
    id v9 = (id)objc_claimAutoreleasedReturnValue([v11 infoDictionary]);
    id v12 = [v9 objectForKey:@"SBUninstallIconOverrideNotAllowedButtonURL" ofClass:objc_opt_class(NSString)];
    id v10 = (id)objc_claimAutoreleasedReturnValue(v12);
  }

  return v10;
}

- (void)otherButtonActionWithCompletion:(id)a3
{
  v4 = (void (**)(id, uint64_t, void))a3;
  if (-[IXSUninstallAlert needsDemoteOptionButton](self, "needsDemoteOptionButton"))
  {
    v4[2](v4, 5LL, 0LL);
  }

  else
  {
    BOOL v5 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_10007D488(self, v6);
    }

    v4[2](v4, 0LL, 0LL);
  }
}

- (void)dealloc
{
  appStringsBundle = self->_appStringsBundle;
  if (appStringsBundle) {
    CFRelease(appStringsBundle);
  }
  self->_appStringsBundle = 0LL;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___IXSAppUninstallAlert;
  -[IXSUninstallAlert dealloc](&v4, "dealloc");
}

- (BOOL)appManagedByManagedSettings
{
  return self->_appManagedByManagedSettings;
}

- (__CFBundle)appStringsBundle
{
  return self->_appStringsBundle;
}

- (NSString)appStringsTableName
{
  return self->_appStringsTableName;
}

- (void).cxx_destruct
{
}

@end