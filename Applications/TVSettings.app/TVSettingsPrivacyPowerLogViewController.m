@interface TVSettingsPrivacyPowerLogViewController
- (NSString)logPath;
- (id)loadSettingGroups;
- (void)setLogPath:(id)a3;
@end

@implementation TVSettingsPrivacyPowerLogViewController

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsDiagnosticLogsFacade tableNamesForPowerLog:]( &OBJC_CLASS___TVSettingsDiagnosticLogsFacade,  "tableNamesForPowerLog:",  self->_logPath));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10001969C;
  v8[3] = &unk_10018EFF0;
  v8[4] = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tvs_arrayByMappingObjectsUsingBlock:", v8));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v4));
  v9 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));

  return v6;
}

- (NSString)logPath
{
  return self->_logPath;
}

- (void)setLogPath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end