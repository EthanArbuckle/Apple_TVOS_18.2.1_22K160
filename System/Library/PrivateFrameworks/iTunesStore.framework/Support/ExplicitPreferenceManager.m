@interface ExplicitPreferenceManager
+ (id)sharedManager;
- (BOOL)explicitPreferencesDisabled:(char *)a3;
- (BOOL)lastChangeInducingBagExplicitOff:(char *)a3;
- (ExplicitPreferenceManager)init;
- (void)setExplicitPreferencesDisabled:(BOOL)a3;
- (void)setLastChangeInducingBagExplicitOff:(BOOL)a3;
@end

@implementation ExplicitPreferenceManager

- (ExplicitPreferenceManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ExplicitPreferenceManager;
  v2 = -[ExplicitPreferenceManager init](&v9, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v4 = ISURLBagDidLoadNotification;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100132D4C;
    v7[3] = &unk_10034F718;
    v8 = v2;
    id v5 = [v3 addObserverForName:v4 object:0 queue:0 usingBlock:v7];
  }

  return v2;
}

- (void)setLastChangeInducingBagExplicitOff:(BOOL)a3
{
  v3 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3);
  CFPreferencesSetAppValue(@"ExplicitPreferenceManagerDefaultsKeyExplicitOff", v3, kITunesStoreDaemonDefaultsID);
}

- (BOOL)lastChangeInducingBagExplicitOff:(char *)a3
{
  return CFPreferencesGetAppBooleanValue( @"ExplicitPreferenceManagerDefaultsKeyExplicitOff",  kSSUserDefaultsIdentifier,  (Boolean *)a3) != 0;
}

- (void)setExplicitPreferencesDisabled:(BOOL)a3
{
  v3 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3);
  CFPreferencesSetAppValue( @"ExplicitPreferenceManagerDefaultsKeyExplicitPreferencesDisabled",  v3,  kITunesStoreDaemonDefaultsID);
}

- (BOOL)explicitPreferencesDisabled:(char *)a3
{
  return CFPreferencesGetAppBooleanValue( @"ExplicitPreferenceManagerDefaultsKeyExplicitPreferencesDisabled",  kSSUserDefaultsIdentifier,  (Boolean *)a3) != 0;
}

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100133650;
  block[3] = &unk_10034AC90;
  block[4] = a1;
  if (qword_1003A34F8 != -1) {
    dispatch_once(&qword_1003A34F8, block);
  }
  return (id)qword_1003A34F0;
}

@end