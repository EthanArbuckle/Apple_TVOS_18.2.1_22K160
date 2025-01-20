@interface IXSHealthKitDataUninstallAlert
+ (BOOL)healthKitDataSupportedOnDevice;
+ (Class)hkBehaviorClass;
+ (Class)hkHealthStoreClass;
+ (Class)hkSourceStoreClass;
+ (void)healthKitDataPresentForAppWithBundleID:(id)a3 completion:(id)a4;
+ (void)openHealthKitClasses;
+ (void)viewHealthKitDataForAppWithBundleID:(id)a3;
- (IXSHealthKitDataUninstallAlert)initWithAppRecord:(id)a3 bundleIdentifier:(id)a4;
- (id)cancelButtonLabel;
- (id)defaultButtonLabel;
- (id)message;
- (id)title;
- (unint64_t)notificationFlags;
@end

@implementation IXSHealthKitDataUninstallAlert

+ (void)openHealthKitClasses
{
  if (qword_1000E8F88 != -1) {
    dispatch_once(&qword_1000E8F88, &stru_1000CE838);
  }
}

+ (Class)hkHealthStoreClass
{
  return (Class)(id)qword_1000E8FA0;
}

+ (Class)hkSourceStoreClass
{
  return (Class)(id)qword_1000E8FA8;
}

+ (Class)hkBehaviorClass
{
  return (Class)(id)qword_1000E8FB0;
}

+ (BOOL)healthKitDataSupportedOnDevice
{
  if (qword_1000E8F98 != -1) {
    dispatch_once(&qword_1000E8F98, &stru_1000CE858);
  }
  return byte_1000E8F90;
}

- (IXSHealthKitDataUninstallAlert)initWithAppRecord:(id)a3 bundleIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___IXSHealthKitDataUninstallAlert;
  v4 = -[IXSUninstallAlert initWithAppRecord:bundleIdentifier:removability:deletionIsRestricted:]( &v7,  "initWithAppRecord:bundleIdentifier:removability:deletionIsRestricted:",  a3,  a4,  1LL,  0LL);
  v5 = v4;
  if (v4)
  {
    -[IXSUninstallAlert setTypeDescription:](v4, "setTypeDescription:", @"HealthKit data");
    -[IXSUninstallAlert setDefaultButtonAppearsDestructive:](v5, "setDefaultButtonAppearsDestructive:", 0LL);
  }

  return v5;
}

- (id)title
{
  v3 = @"HEALTHKIT_SHOW_DATA_TITLE";
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue( -[IXSUninstallAlert localizedStringForKey:withFormatHint:]( self,  "localizedStringForKey:withFormatHint:",  @"HEALTHKIT_SHOW_DATA_TITLE",  @"There is data from “%@” saved in Health"));
  if (v4 != @"There is data from “%@” saved in Health")
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXSUninstallAlert appRecord](self, "appRecord"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedName]);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v4, v6));
  }

  return v3;
}

- (id)message
{
  v2 = @"HEALTHKIT_SHOW_DATA_BODY";
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue( -[IXSUninstallAlert localizedStringForKey:withFormatHint:]( self,  "localizedStringForKey:withFormatHint:",  @"HEALTHKIT_SHOW_DATA_BODY",  @"This data will remain in Health unless you choose to delete it."));
  if (v3 != @"This data will remain in Health unless you choose to delete it.") {
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v3));
  }

  return v2;
}

- (id)defaultButtonLabel
{
  return -[IXSUninstallAlert localizedStringForKey:withFormatHint:]( self,  "localizedStringForKey:withFormatHint:",  @"HEALTHKIT_SHOW_DATA_DISMISS",  @"OK");
}

- (id)cancelButtonLabel
{
  if ([(id)objc_opt_class(self) healthKitDataSupportedOnDevice]) {
    v3 = (void *)objc_claimAutoreleasedReturnValue( -[IXSUninstallAlert localizedStringForKey:withFormatHint:]( self,  "localizedStringForKey:withFormatHint:",  @"HEALTHKIT_SHOW_DATA_VIEW",  @"View"));
  }
  else {
    v3 = 0LL;
  }
  return v3;
}

- (unint64_t)notificationFlags
{
  else {
    return 35LL;
  }
}

+ (void)healthKitDataPresentForAppWithBundleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  objc_super v7 = (void (**)(id, void))a4;
  if ([@"com.apple.Health" isEqualToString:v6])
  {
LABEL_11:
    v7[2](v7, 0LL);
    goto LABEL_12;
  }

  v8 = sub_1000047B4((uint64_t)off_1000E8CA0);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "+[IXSHealthKitDataUninstallAlert healthKitDataPresentForAppWithBundleID:completion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: Checking if HealthKit data is available",  buf,  0xCu);
  }

  unsigned int v10 = objc_msgSend(objc_msgSend(a1, "hkHealthStoreClass"), "isHealthDataAvailable");
  v11 = sub_1000047B4((uint64_t)off_1000E8CA0);
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (!v10)
  {
    if (v13)
    {
      *(_DWORD *)buf = 136315138;
      v20 = "+[IXSHealthKitDataUninstallAlert healthKitDataPresentForAppWithBundleID:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s: No HealthKit data available on the device",  buf,  0xCu);
    }

    goto LABEL_11;
  }

  if (v13)
  {
    *(_DWORD *)buf = 136315138;
    v20 = "+[IXSHealthKitDataUninstallAlert healthKitDataPresentForAppWithBundleID:completion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s: Checking if this app has HealthKit data",  buf,  0xCu);
  }

  id v14 = objc_alloc_init((Class)[a1 hkHealthStoreClass]);
  id v15 = objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "hkSourceStoreClass")), "initWithHealthStore:", v14);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10005A2C8;
  v16[3] = &unk_1000CE880;
  id v17 = v6;
  v18 = v7;
  [v15 fetchHasSampleWithBundleIdentifier:v17 completion:v16];

LABEL_12:
}

+ (void)viewHealthKitDataForAppWithBundleID:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(objc_msgSend(a1, "hkBehaviorClass"), "sharedBehavior"));
  unsigned int v6 = [v5 healthAppHiddenOrNotInstalled];

  if (v6)
  {
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", @"prefs:root=HEALTH"));
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"x-apple-health://AuthorizationManagement/%@",  v4));
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v8));
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  id v14 = 0LL;
  unsigned __int8 v10 = [v9 openSensitiveURL:v7 withOptions:0 error:&v14];
  id v11 = v14;

  if ((v10 & 1) == 0)
  {
    v12 = sub_1000047B4((uint64_t)off_1000E8CA0);
    BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v16 = "+[IXSHealthKitDataUninstallAlert viewHealthKitDataForAppWithBundleID:]";
      __int16 v17 = 2112;
      v18 = v7;
      __int16 v19 = 2112;
      id v20 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to open url at %@: %@",  buf,  0x20u);
    }
  }
}

@end