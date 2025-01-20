@interface FBScene
- (BOOL)pb_isRunningAndScheduled;
- (NSString)clientProcessBundleIdentifier;
- (PBSystemUIServiceSceneClientSettings)pb_systemUIServiceSceneClientSettings;
- (PBSystemUIServiceSceneSettings)pb_systemUIServiceSceneSettings;
- (void)pb_updateSettings:(id)a3;
@end

@implementation FBScene

- (PBSystemUIServiceSceneSettings)pb_systemUIServiceSceneSettings
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBScene settings](self, "settings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[settings pb_isSystemUIServiceSubclass]"));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100275428(a2);
  }
  result = (PBSystemUIServiceSceneSettings *)_bs_set_crash_log_message([v5 UTF8String]);
  __break(0);
  return result;
}

- (PBSystemUIServiceSceneClientSettings)pb_systemUIServiceSceneClientSettings
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBScene clientSettings](self, "clientSettings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[clientSettings pb_isSystemUIServiceSubclass]"));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1002754E4(a2);
  }
  result = (PBSystemUIServiceSceneClientSettings *)_bs_set_crash_log_message([v5 UTF8String]);
  __break(0);
  return result;
}

- (NSString)clientProcessBundleIdentifier
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBScene clientProcess](self, "clientProcess"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBScene clientHandle](self, "clientHandle"));
    id v6 = (id)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
  }

  return (NSString *)v6;
}

- (BOOL)pb_isRunningAndScheduled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FBScene clientHandle](self, "clientHandle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 processHandle]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentState]);
  BOOL v5 = [v4 taskState] == 4;

  return v5;
}

- (void)pb_updateSettings:(id)a3
{
  id v4 = a3;
  if (-[FBScene isValid](self, "isValid"))
  {
    if (-[FBScene isActive](self, "isActive"))
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_10013920C;
      v9[3] = &unk_1003D8B68;
      BOOL v5 = &v10;
      id v10 = v4;
      -[FBScene performUpdate:](self, "performUpdate:", v9);
LABEL_6:

      goto LABEL_7;
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBScene clientProcess](self, "clientProcess"));

    if (!v6)
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_100139228;
      v7[3] = &unk_1003D8B90;
      BOOL v5 = &v8;
      id v8 = v4;
      -[FBScene configureParameters:](self, "configureParameters:", v7);
      goto LABEL_6;
    }
  }

@end