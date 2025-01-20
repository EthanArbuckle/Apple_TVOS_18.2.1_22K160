@interface MCWatchSettingsMirror
+ (id)sharedMirror;
- (MCWatchSettingsMirror)init;
- (NSDictionary)syncableSettings;
@end

@implementation MCWatchSettingsMirror

+ (id)sharedMirror
{
  if (qword_1000DC170 != -1) {
    dispatch_once(&qword_1000DC170, &stru_1000C3B58);
  }
  return (id)qword_1000DC168;
}

- (MCWatchSettingsMirror)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MCWatchSettingsMirror;
  v2 = -[MCWatchSettingsMirror init](&v7, "init");
  v9[0] = MCRestrictedBoolKey;
  v8[0] = MCFeatureAppInstallationAllowed;
  v8[1] = MCFeatureAutomaticAppDownloadsAllowed;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 2LL));
  v10[0] = v3;
  v10[1] = &__NSArray0__struct;
  v9[1] = MCRestrictedValueKey;
  v9[2] = MCIntersectionKey;
  v9[3] = MCUnionKey;
  v10[2] = &__NSArray0__struct;
  v10[3] = &__NSArray0__struct;
  uint64_t v4 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  4LL));
  syncableSettings = v2->_syncableSettings;
  v2->_syncableSettings = (NSDictionary *)v4;

  return v2;
}

- (NSDictionary)syncableSettings
{
  return self->_syncableSettings;
}

- (void).cxx_destruct
{
}

@end