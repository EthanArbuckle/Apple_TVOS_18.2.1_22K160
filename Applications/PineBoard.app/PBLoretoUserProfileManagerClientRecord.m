@interface PBLoretoUserProfileManagerClientRecord
- (BOOL)isEntitled;
- (NSString)bundleIdentifier;
- (NSString)debugDescription;
- (NSString)description;
- (PBLoretoUserProfileManagerClientPermission)readUserProfiles;
- (PBLoretoUserProfileManagerClientPermission)selectUserProfile;
- (PBLoretoUserProfileManagerClientPermission)sendAccountNotifications;
- (PBLoretoUserProfileManagerClientPermission)writeGroupRecommendationsConsent;
- (PBLoretoUserProfileManagerClientPermission)writeGroupRecommendationsSession;
- (PBLoretoUserProfileManagerClientPermission)writeUserProfiles;
- (PBLoretoUserProfileManagerClientRecord)initWithProcessHandle:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int)pid;
@end

@implementation PBLoretoUserProfileManagerClientRecord

- (PBLoretoUserProfileManagerClientRecord)initWithProcessHandle:(id)a3
{
  id v5 = a3;
  Class v6 = NSClassFromString(@"BSProcessHandle");
  if (!v5)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100288A98(a2);
    }
    _bs_set_crash_log_message([v26 UTF8String]);
    __break(0);
    JUMPOUT(0x100171894LL);
  }

  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:BSProcessHandleClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100288A98(a2);
    }
    _bs_set_crash_log_message([v27 UTF8String]);
    __break(0);
    JUMPOUT(0x1001718F8LL);
  }

  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___PBLoretoUserProfileManagerClientRecord;
  v7 = -[PBLoretoUserProfileManagerClientRecord init](&v28, "init");
  if (v7)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);
    bundleIdentifier = v7->_bundleIdentifier;
    v7->_bundleIdentifier = (NSString *)v8;

    v7->_pid = [v5 pid];
    v10 = (void *)objc_claimAutoreleasedReturnValue([v5 auditToken]);
    v29[0] = @"com.apple.appletv.pbs.user-profiles.edit";
    v29[1] = @"com.apple.appletv.pbs.user-profiles.group-recommendations-consent.edit";
    v29[2] = @"com.apple.appletv.pbs.user-profiles.group-recommendations-session.edit";
    v29[3] = @"com.apple.appletv.pbs.user-profiles.select";
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v29, 4LL));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v11));

    v13 = -[PBLoretoUserProfileManagerClientPermission initWithAuditToken:entitlement:auxiliaryEntitlements:]( objc_alloc(&OBJC_CLASS___PBLoretoUserProfileManagerClientPermission),  "initWithAuditToken:entitlement:auxiliaryEntitlements:",  v10,  @"com.apple.appletv.pbs.user-profiles",  v12);
    readUserProfiles = v7->_readUserProfiles;
    v7->_readUserProfiles = v13;

    v15 = -[PBLoretoUserProfileManagerClientPermission initWithAuditToken:entitlement:]( objc_alloc(&OBJC_CLASS___PBLoretoUserProfileManagerClientPermission),  "initWithAuditToken:entitlement:",  v10,  @"com.apple.appletv.pbs.user-profiles.edit");
    writeUserProfiles = v7->_writeUserProfiles;
    v7->_writeUserProfiles = v15;

    v17 = -[PBLoretoUserProfileManagerClientPermission initWithAuditToken:entitlement:]( objc_alloc(&OBJC_CLASS___PBLoretoUserProfileManagerClientPermission),  "initWithAuditToken:entitlement:",  v10,  @"com.apple.appletv.pbs.user-profiles.group-recommendations-consent.edit");
    writeGroupRecommendationsConsent = v7->_writeGroupRecommendationsConsent;
    v7->_writeGroupRecommendationsConsent = v17;

    v19 = -[PBLoretoUserProfileManagerClientPermission initWithAuditToken:entitlement:]( objc_alloc(&OBJC_CLASS___PBLoretoUserProfileManagerClientPermission),  "initWithAuditToken:entitlement:",  v10,  @"com.apple.appletv.pbs.user-profiles.group-recommendations-session.edit");
    writeGroupRecommendationsSession = v7->_writeGroupRecommendationsSession;
    v7->_writeGroupRecommendationsSession = v19;

    v21 = -[PBLoretoUserProfileManagerClientPermission initWithAuditToken:entitlement:]( objc_alloc(&OBJC_CLASS___PBLoretoUserProfileManagerClientPermission),  "initWithAuditToken:entitlement:",  v10,  @"com.apple.appletv.pbs.user-profiles.select");
    selectUserProfile = v7->_selectUserProfile;
    v7->_selectUserProfile = v21;

    v23 = -[PBLoretoUserProfileManagerClientPermission initWithAuditToken:entitlement:]( objc_alloc(&OBJC_CLASS___PBLoretoUserProfileManagerClientPermission),  "initWithAuditToken:entitlement:",  v10,  @"com.apple.appletv.pbs.user-profiles.account-notification");
    sendAccountNotifications = v7->_sendAccountNotifications;
    v7->_sendAccountNotifications = v23;
  }

  return v7;
}

- (BOOL)isEntitled
{
  if (-[PBLoretoUserProfileManagerClientPermission isAllowed](self->_readUserProfiles, "isAllowed")) {
    return 1;
  }
  else {
    return -[PBLoretoUserProfileManagerClientPermission isAllowed](self->_sendAccountNotifications, "isAllowed");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  return self;
}

- (NSString)description
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( -[PBLoretoUserProfileManagerClientRecord succinctDescription]( self,  "succinctDescription"));
}

- (NSString)debugDescription
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( -[PBLoretoUserProfileManagerClientRecord descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL));
}

- (id)succinctDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[PBLoretoUserProfileManagerClientRecord succinctDescriptionBuilder]( self,  "succinctDescriptionBuilder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 build]);

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  [v3 appendString:self->_bundleIdentifier withName:@"bundleIdentifier"];
  id v4 = [v3 appendUnsignedInteger:self->_pid withName:@"pid"];
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[PBLoretoUserProfileManagerClientRecord descriptionBuilderWithMultilinePrefix:]( self,  "descriptionBuilderWithMultilinePrefix:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100171AFC;
  v7[3] = &unk_1003CFEB8;
  id v4 = (id)objc_claimAutoreleasedReturnValue( -[PBLoretoUserProfileManagerClientRecord succinctDescriptionBuilder]( self,  "succinctDescriptionBuilder",  a3));
  id v8 = v4;
  v9 = self;
  [v4 appendBodySectionWithName:@"Permissions" multilinePrefix:0 block:v7];
  id v5 = v4;

  return v5;
}

- (PBLoretoUserProfileManagerClientPermission)readUserProfiles
{
  return self->_readUserProfiles;
}

- (PBLoretoUserProfileManagerClientPermission)writeUserProfiles
{
  return self->_writeUserProfiles;
}

- (PBLoretoUserProfileManagerClientPermission)writeGroupRecommendationsConsent
{
  return self->_writeGroupRecommendationsConsent;
}

- (PBLoretoUserProfileManagerClientPermission)writeGroupRecommendationsSession
{
  return self->_writeGroupRecommendationsSession;
}

- (PBLoretoUserProfileManagerClientPermission)selectUserProfile
{
  return self->_selectUserProfile;
}

- (PBLoretoUserProfileManagerClientPermission)sendAccountNotifications
{
  return self->_sendAccountNotifications;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (int)pid
{
  return self->_pid;
}

- (void).cxx_destruct
{
}

  ;
}

@end