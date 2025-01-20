@interface NSUserDefaults
+ (id)AUDeveloperSettingsObjectWithKey:(id)a3;
+ (void)AUDeveloperSettingsSetObject:(id)a3 withKey:(id)a4;
@end

@implementation NSUserDefaults

+ (void)AUDeveloperSettingsSetObject:(id)a3 withKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  if (getuid() == 278)
  {
    v7 = objc_alloc(&OBJC_CLASS___NSUserDefaults);
    v8 = MapPreferenceSuiteToString(1LL);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v11 = -[NSUserDefaults initWithSuiteName:](v7, "initWithSuiteName:", v9);

    -[NSUserDefaults setObject:forKey:](v11, "setObject:forKey:", v6, v5);
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[AUHelperInstance sharedInstance](&OBJC_CLASS___AUHelperInstance, "sharedInstance"));
    v11 = (NSUserDefaults *)objc_claimAutoreleasedReturnValue([v10 remoteObject]);

    -[NSUserDefaults userPreferenceSetObject:forSuite:withKey:]( v11,  "userPreferenceSetObject:forSuite:withKey:",  v6,  1LL,  v5);
  }
}

+ (id)AUDeveloperSettingsObjectWithKey:(id)a3
{
  id v3 = a3;
  if (getuid() == 278)
  {
    v4 = objc_alloc(&OBJC_CLASS___NSUserDefaults);
    id v5 = MapPreferenceSuiteToString(1LL);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = -[NSUserDefaults initWithSuiteName:](v4, "initWithSuiteName:", v6);

    id v8 = (id)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v7, "objectForKey:", v3));
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[AUHelperInstance sharedInstance](&OBJC_CLASS___AUHelperInstance, "sharedInstance"));
    v7 = (NSUserDefaults *)objc_claimAutoreleasedReturnValue([v9 remoteObject]);

    uint64_t v12 = 0LL;
    v13 = &v12;
    uint64_t v14 = 0x3032000000LL;
    v15 = sub_100012678;
    v16 = sub_100012688;
    id v17 = 0LL;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100012690;
    v11[3] = &unk_10002DA08;
    v11[4] = &v12;
    -[NSUserDefaults userPreferenceObjectForSuite:withKey:withReply:]( v7,  "userPreferenceObjectForSuite:withKey:withReply:",  1LL,  v3,  v11);
    id v8 = (id)v13[5];
    _Block_object_dispose(&v12, 8);
  }

  return v8;
}

@end