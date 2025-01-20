@interface MDMAppStatus
+ (id)appStatusForApp:(id)a3;
+ (id)connectionForStore:(id)a3;
+ (id)neededAppProperties;
+ (id)stringForAppState:(unint64_t)a3;
+ (id)supportedStatusKeys;
- (void)queryForStatusWithKeyPaths:(id)a3 store:(id)a4 completionHandler:(id)a5;
@end

@implementation MDMAppStatus

+ (id)supportedStatusKeys
{
  uint64_t v5 = RMModelStatusItemMDMApp;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v2));

  return v3;
}

+ (id)neededAppProperties
{
  return &off_1000043A0;
}

- (void)queryForStatusWithKeyPaths:(id)a3 store:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog mDMAppStatus](&OBJC_CLASS___RMLog, "mDMAppStatus"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100003190((uint64_t)v8, v11);
  }

  v12 = (void *)objc_opt_new(&OBJC_CLASS___DMFFetchAppsRequest);
  [v12 setManagedAppsOnly:1];
  id v15 = objc_msgSend((id)objc_opt_class(self, v13, v14), "neededAppProperties");
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  [v12 setPropertyKeys:v16];

  id v19 = objc_msgSend((id)objc_opt_class(self, v17, v18), "connectionForStore:", v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100002DAC;
  v23[3] = &unk_1000041A8;
  id v24 = v8;
  id v25 = v9;
  v23[4] = self;
  id v21 = v8;
  id v22 = v9;
  [v20 performRequest:v12 completion:v23];
}

+ (id)connectionForStore:(id)a3
{
  id v3 = [a3 scope];
  if (v3 == (id)1)
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue(+[DMFConnection systemConnection](&OBJC_CLASS___DMFConnection, "systemConnection"));
  }

  else if (!v3)
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue(+[DMFConnection currentUserConnection](&OBJC_CLASS___DMFConnection, "currentUserConnection"));
  }

  return v3;
}

+ (id)appStatusForApp:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 displayName]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 externalVersionIdentifier]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringValue]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 version]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 shortVersion]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v4 managementInformation]);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stringForAppState:", objc_msgSend(v11, "state")));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelStatusMDMApp buildWithIdentifier:removed:name:externalVersionId:version:shortVersion:state:]( &OBJC_CLASS___RMModelStatusMDMApp,  "buildWithIdentifier:removed:name:externalVersionId:version:shortVersion:state:",  v5,  0LL,  v6,  v8,  v9,  v10,  v12));

  return v13;
}

+ (id)stringForAppState:(unint64_t)a3
{
  if (a3 > 0x12) {
    id v3 = (id *)&RMModelStatusMDMApp_State_unknown;
  }
  else {
    id v3 = (id *)*(&off_1000041C8 + a3);
  }
  return *v3;
}

@end