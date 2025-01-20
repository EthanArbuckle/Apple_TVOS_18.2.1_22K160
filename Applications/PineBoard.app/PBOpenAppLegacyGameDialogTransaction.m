@interface PBOpenAppLegacyGameDialogTransaction
- (NSNumber)legacyGameValue;
- (PBOpenAppLegacyGameDialogTransaction)initWithRequest:(id)a3;
- (PBOpenApplicationRequest)request;
- (void)_begin;
@end

@implementation PBOpenAppLegacyGameDialogTransaction

- (PBOpenAppLegacyGameDialogTransaction)initWithRequest:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    v7 = v6;
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___PBOpenAppLegacyGameDialogTransaction;
    v8 = -[PBOpenAppLegacyGameDialogTransaction init](&v12, "init");
    v9 = v8;
    if (v8) {
      objc_storeStrong((id *)&v8->_request, a3);
    }

    return v9;
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"request != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002784F0(a2, (uint64_t)self, (uint64_t)v11);
    }
    result = (PBOpenAppLegacyGameDialogTransaction *)_bs_set_crash_log_message([v11 UTF8String]);
    __break(0);
  }

  return result;
}

- (void)_begin
{
  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___PBOpenAppLegacyGameDialogTransaction;
  -[PBOpenAppLegacyGameDialogTransaction _begin](&v36, "_begin");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v4 = objc_msgSend(v3, "pb_multiUserLegacyGameAlertEnabled");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBOpenApplicationRequest toAppInfo](self->_request, "toAppInfo"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 applicationInfo]);

    if (v6
      && [v6 isGameCenterEnabled]
      && ([v6 hasRunAsCurrentUserEntitlement] & 1) == 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBUserProfileManager sharedInstance](&OBJC_CLASS___PBUserProfileManager, "sharedInstance"));
      v8 = (void *)objc_claimAutoreleasedReturnValue([v7 userProfilesSnapshot]);

      v9 = (void *)objc_claimAutoreleasedReturnValue([v8 primaryUserProfile]);
      v10 = (void *)objc_claimAutoreleasedReturnValue([v8 selectedUserProfile]);
      v11 = v10;
      if (v10 && [v10 type] == (id)1)
      {
        objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
        v13 = (void *)objc_claimAutoreleasedReturnValue( +[FBSApplicationDataStore storeForApplication:]( &OBJC_CLASS___FBSApplicationDataStore,  "storeForApplication:",  v12));

        v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"com.apple.PineBoard.legacyGameUserProfileInfo"]);
        uint64_t v16 = objc_opt_self(&OBJC_CLASS___PBLegacyGameAlertInfo, v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSObject bs_secureObjectFromData:ofClass:]( &OBJC_CLASS___NSObject,  "bs_secureObjectFromData:ofClass:",  v14,  v17));

        v19 = (void *)objc_claimAutoreleasedReturnValue([v18 userProfileIdentifiers]);
        v20 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
        unsigned __int8 v21 = [v19 containsObject:v20];

        if ((v21 & 1) == 0)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue([v18 userProfileIdentifiers]);
          id v23 = [v22 mutableCopy];
          v24 = v23;
          if (v23) {
            id v25 = v23;
          }
          else {
            id v25 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
          }
          v26 = v25;

          v27 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
          [v26 addObject:v27];

          v28 = -[PBLegacyGameAlertInfo initWithUserProfileIdentifiers:]( objc_alloc(&OBJC_CLASS___PBLegacyGameAlertInfo),  "initWithUserProfileIdentifiers:",  v26);
          sub_1000877F4(v13, (uint64_t)v28);

          -[PBOpenAppLegacyGameDialogTransaction addMilestone:](self, "addMilestone:", @"UserNotification");
          objc_initWeak(&location, self);
          dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
          v30 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
          v31[0] = _NSConcreteStackBlock;
          v31[1] = 3221225472LL;
          v31[2] = sub_100087858;
          v31[3] = &unk_1003D3FD0;
          id v32 = v6;
          id v33 = v9;
          objc_copyWeak(&v34, &location);
          dispatch_async(v30, v31);

          objc_destroyWeak(&v34);
          objc_destroyWeak(&location);
        }
      }
    }
  }

- (PBOpenApplicationRequest)request
{
  return self->_request;
}

- (NSNumber)legacyGameValue
{
  return self->_legacyGameValue;
}

- (void).cxx_destruct
{
}

@end