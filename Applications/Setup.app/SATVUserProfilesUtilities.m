@interface SATVUserProfilesUtilities
+ (void)deletePrimaryUserIfAnyWithCompletionHandler:(id)a3;
+ (void)deleteUserProfileWithIdentifier:(id)a3 completionHandler:(id)a4;
@end

@implementation SATVUserProfilesUtilities

+ (void)deletePrimaryUserIfAnyWithCompletionHandler:(id)a3
{
  v5 = (void (**)(void))a3;
  if (!v5)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"completionHandler != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100078964(a2);
    }
    _bs_set_crash_log_message([v15 UTF8String]);
    __break(0);
    JUMPOUT(0x10005E0B8LL);
  }

  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBSUserProfileManager sharedInstance](&OBJC_CLASS___PBSUserProfileManager, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 userProfilesSnapshot]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 primaryUserProfile]);

  id v10 = sub_10005E0C0();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
      *(_DWORD *)buf = 138543362;
      v17 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Deleting exiting primary user profile. {identifier=%{public}@}",  buf,  0xCu);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
    [a1 deleteUserProfileWithIdentifier:v14 completionHandler:v6];
  }

  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "No existing primary user profile, moving on.",  buf,  2u);
    }

    v6[2](v6);
  }
}

+ (void)deleteUserProfileWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"userProfileIdentifier != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100078A10(a2);
    }
    _bs_set_crash_log_message([v14 UTF8String]);
    __break(0);
    JUMPOUT(0x10005E2A4LL);
  }

  v8 = v7;
  if (!v7)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"completionHandler != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100078ABC(a2);
    }
    _bs_set_crash_log_message([v15 UTF8String]);
    __break(0);
    JUMPOUT(0x10005E308LL);
  }

  id v9 = sub_10005E0C0();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Deleting user profile... {identifier=%{public}@}",  buf,  0xCu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[PBSUserProfileManager sharedInstance](&OBJC_CLASS___PBSUserProfileManager, "sharedInstance"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10005E310;
  v16[3] = &unk_1000CA980;
  id v17 = v6;
  id v18 = v8;
  id v12 = v8;
  id v13 = v6;
  [v11 removeUserProfileWithIdentifier:v13 completionHandler:v16];
}

@end