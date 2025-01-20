@interface TVSettingsUserProfilesValidator
- (ACAccountStore)accountStore;
- (BOOL)canAddUserWithAltDSID:(id)a3 error:(id *)a4;
- (BOOL)canAddUserWithiCloudAltDSID:(id)a3 gameCenterAltDSID:(id)a4 error:(id *)a5;
- (BOOL)canSignInUserWithGameCenterAltDSID:(id)a3 error:(id *)a4;
- (BOOL)canSignInUserWithiCloudAltDSID:(id)a3 error:(id *)a4;
- (TVSettingsUserProfilesValidator)init;
- (id)preferredLanguagesFromLanguages:(id)a3 forUserType:(int64_t)a4;
- (int64_t)userActionType;
- (void)setUserActionType:(int64_t)a3;
@end

@implementation TVSettingsUserProfilesValidator

- (TVSettingsUserProfilesValidator)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSettingsUserProfilesValidator;
  v2 = -[TVSettingsUserProfilesValidator init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
    accountStore = v2->_accountStore;
    v2->_accountStore = (ACAccountStore *)v3;
  }

  return v2;
}

- (BOOL)canAddUserWithAltDSID:(id)a3 error:(id *)a4
{
  return sub_1000E8E2C((uint64_t)self, a3, a3, a4);
}

- (BOOL)canAddUserWithiCloudAltDSID:(id)a3 gameCenterAltDSID:(id)a4 error:(id *)a5
{
  return sub_1000E8E2C((uint64_t)self, a3, a4, a5);
}

- (BOOL)canSignInUserWithiCloudAltDSID:(id)a3 error:(id *)a4
{
  return sub_1000E8E2C((uint64_t)self, a3, 0LL, a4);
}

- (BOOL)canSignInUserWithGameCenterAltDSID:(id)a3 error:(id *)a4
{
  return sub_1000E8E2C((uint64_t)self, 0LL, a3, a4);
}

- (id)preferredLanguagesFromLanguages:(id)a3 forUserType:(int64_t)a4
{
  id v5 = a3;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[TVCSPreferredLanguagesManager sharedInstance]( &OBJC_CLASS___TVCSPreferredLanguagesManager,  "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 preferredLanguages]);
  if (a4)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[PBSUserProfileManager sharedInstance](&OBJC_CLASS___PBSUserProfileManager, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 userProfilesSnapshot]);

    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 primaryUserProfile]);
    v12 = v11;
    if (v11)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v11 preferredLanguages]);
      if (v13)
      {
LABEL_8:

        goto LABEL_10;
      }

      id v14 = sub_1000E9768();
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1000FD62C((uint64_t)v12, v15);
      }
    }

    v13 = 0LL;
    goto LABEL_8;
  }

  v13 = 0LL;
LABEL_10:
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", &stru_100195030));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v5 filteredArrayUsingPredicate:v16]);

  id v18 = sub_1000E9768();
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v30 = 138544130;
    v31 = v13;
    __int16 v32 = 2114;
    v33 = v8;
    __int16 v34 = 2114;
    v35 = v17;
    __int16 v36 = 2048;
    int64_t v37 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Calculating preferred languages from {deviceLanguages=%{public}@, primaryUserLanguages=%{public}@, supportedCandid ateLanguges=%{public}@, userProfileType=%ld",  (uint8_t *)&v30,  0x2Au);
  }

  if (![v17 count])
  {
    if ([v13 count])
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue([v13 firstObject]);
      [v6 addObject:v22];

      id v23 = sub_1000E9768();
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_21;
      }
      v24 = (void *)objc_claimAutoreleasedReturnValue([v13 firstObject]);
      int v30 = 138543362;
      v31 = v24;
      v25 = "Fallback to primary user for preferred language: %{public}@";
    }

    else
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue([v8 firstObject]);
      [v6 addObject:v26];

      id v27 = sub_1000E9768();
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_21;
      }
      v24 = (void *)objc_claimAutoreleasedReturnValue([v8 firstObject]);
      int v30 = 138543362;
      v31 = v24;
      v25 = "Fallback to device setting for preferred language: %{public}@";
    }

    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v25, (uint8_t *)&v30, 0xCu);

    goto LABEL_21;
  }

  [v6 setArray:v17];
  id v20 = sub_1000E9768();
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    int v30 = 138543362;
    v31 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Using provided languages as preferred languages: %{public}@",  (uint8_t *)&v30,  0xCu);
  }

- (int64_t)userActionType
{
  return self->_userActionType;
}

- (void)setUserActionType:(int64_t)a3
{
  self->_userActionType = a3;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void).cxx_destruct
{
}

@end