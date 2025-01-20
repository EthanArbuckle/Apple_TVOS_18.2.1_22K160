@interface MSDSettingsDefaults
+ (id)settingsDefaults;
- (MSDSettingsDefaults)init;
- (NSUserDefaults)userSettingsDefaults;
- (void)setUserSettingsDefaults:(id)a3;
@end

@implementation MSDSettingsDefaults

+ (id)settingsDefaults
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000B438;
  block[3] = &unk_100060A90;
  block[4] = a1;
  if (qword_100070780 != -1) {
    dispatch_once(&qword_100070780, block);
  }
  return (id)qword_100070788;
}

- (MSDSettingsDefaults)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MSDSettingsDefaults;
  v2 = -[MSDSettingsDefaults init](&v7, "init");
  if (v2)
  {
    v3 = objc_alloc(&OBJC_CLASS___NSUserDefaults);
    v4 = -[NSUserDefaults initWithSuiteName:](v3, "initWithSuiteName:", kMediaSetupSettingsDomain);
    userSettingsDefaults = v2->_userSettingsDefaults;
    v2->_userSettingsDefaults = v4;
  }

  return v2;
}

- (NSUserDefaults)userSettingsDefaults
{
  return self->_userSettingsDefaults;
}

- (void)setUserSettingsDefaults:(id)a3
{
}

- (void).cxx_destruct
{
}

@end