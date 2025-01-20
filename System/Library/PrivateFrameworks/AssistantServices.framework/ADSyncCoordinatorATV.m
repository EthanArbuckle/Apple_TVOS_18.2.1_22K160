@interface ADSyncCoordinatorATV
+ (id)_defaultATVUser;
- (ADSyncCoordinatorATV)init;
- (id)_profileUserId;
@end

@implementation ADSyncCoordinatorATV

- (ADSyncCoordinatorATV)init
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Initializing ADSyncCoordinatorATV", buf, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADSyncCoordinatorATV _defaultATVUser](&OBJC_CLASS___ADSyncCoordinatorATV, "_defaultATVUser"));
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___ADSyncCoordinatorATV;
  v5 = -[ADSyncCoordinatorCommunalDevices initWithProfileUserId:](&v7, "initWithProfileUserId:", v4);

  return v5;
}

- (id)_profileUserId
{
  return +[ADSyncCoordinatorATV _defaultATVUser](&OBJC_CLASS___ADSyncCoordinatorATV, "_defaultATVUser");
}

+ (id)_defaultATVUser
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBSUserProfileManager sharedInstance](&OBJC_CLASS___PBSUserProfileManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 userProfilesSnapshot]);

  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 primaryUserProfile]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 selectedUserProfile]);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsIdentifiersUtils logger](&OBJC_CLASS___ADAnalyticsIdentifiersUtils, "logger"));
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
    goto LABEL_11;
  }
  if (!v4)
  {
    objc_super v7 = 0LL;
    if (v5) {
      goto LABEL_4;
    }
LABEL_6:
    v8 = 0LL;
    goto LABEL_7;
  }

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v4 iCloudAltDSID]);
  if (!v5) {
    goto LABEL_6;
  }
LABEL_4:
  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 iCloudAltDSID]);
LABEL_7:
  int v11 = 138412546;
  v12 = v7;
  __int16 v13 = 2112;
  v14 = v8;
  _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Primary user %@; selected user %@",
    (uint8_t *)&v11,
    0x16u);
  if (v5) {

  }
  if (v4) {
LABEL_11:
  }

  if (v4) {
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 iCloudAltDSID]);
  }
  else {
    v9 = @"userNotYetDetermined";
  }

  return v9;
}

@end