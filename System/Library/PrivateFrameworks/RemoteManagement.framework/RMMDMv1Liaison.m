@interface RMMDMv1Liaison
+ (BOOL)isEnrolledInMDMv1;
+ (BOOL)isEnrollmentInMDMv1Restricted;
+ (void)_didEnroll:(BOOL)a3;
+ (void)refreshState;
+ (void)remoteManagementDidEnroll;
+ (void)remoteManagementDidUnenroll;
@end

@implementation RMMDMv1Liaison

+ (BOOL)isEnrolledInMDMv1
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 installedMDMProfileIdentifier]);
  BOOL v4 = v3 != 0LL;

  return v4;
}

+ (BOOL)isEnrollmentInMDMv1Restricted
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  BOOL v3 = [v2 BOOLRestrictionForFeature:MCFeatureMDMEnrollmentAllowed] == 2;

  return v3;
}

+ (void)remoteManagementDidEnroll
{
}

+ (void)remoteManagementDidUnenroll
{
}

+ (void)_didEnroll:(BOOL)a3
{
  if (a3)
  {
    BOOL v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary MCSetBoolRestriction:value:]( v3,  "MCSetBoolRestriction:value:",  MCFeatureMDMEnrollmentAllowed,  0LL);
  }

  else
  {
    BOOL v3 = 0LL;
  }

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  id v8 = 0LL;
  unsigned __int8 v5 = [v4 applyRestrictionDictionary:v3 clientType:@"com.apple.remotemanagementd" clientUUID:@"com.apple.RemoteManagement.MDMv1Liaison" localizedClientDescription:0 localizedWarningMe ssage:0 outRestrictionChanged:0 outEffectiveSettingsChanged:0 outError:&v8];
  id v6 = v8;

  if ((v5 & 1) == 0)
  {
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog mdmv1Liaison](&OBJC_CLASS___RMLog, "mdmv1Liaison"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100049A64((uint64_t)v3, (uint64_t)v6, v7);
    }
  }
}

+ (void)refreshState
{
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog mdmv1Liaison](&OBJC_CLASS___RMLog, "mdmv1Liaison"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100049AE8(v2);
  }

  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[RMManagedDevice currentManagedDevice](&OBJC_CLASS___RMManagedDevice, "currentManagedDevice"));
  [v3 refreshState];
}

@end