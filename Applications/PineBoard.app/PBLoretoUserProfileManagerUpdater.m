@interface PBLoretoUserProfileManagerUpdater
- (NSArray)errors;
- (NSArray)updateProfileRequests;
- (NSDictionary)userProfiles;
- (NSString)primaryUserProfileIdentifier;
- (NSString)selectedUserProfileIdentifier;
- (PBLoretoUserProfileManagerUpdater)initWithProfileStoreSnapshot:(id)a3;
- (void)setErrors:(id)a3;
- (void)setUpdateProfileRequests:(id)a3;
- (void)updateUserProfileWithIdentifier:(id)a3 attributes:(id)a4;
@end

@implementation PBLoretoUserProfileManagerUpdater

- (PBLoretoUserProfileManagerUpdater)initWithProfileStoreSnapshot:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PBLoretoUserProfileManagerUpdater;
  v6 = -[PBLoretoUserProfileManagerUpdater init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_snapshot, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    updateProfileRequests = v7->_updateProfileRequests;
    v7->_updateProfileRequests = v8;

    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    mutableErrors = v7->_mutableErrors;
    v7->_mutableErrors = v10;
  }

  return v7;
}

- (NSDictionary)userProfiles
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UPProfileStoreSnapshot pb_userProfilesSnapshot](self->_snapshot, "pb_userProfilesSnapshot"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 userProfiles]);

  return (NSDictionary *)v3;
}

- (NSString)selectedUserProfileIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UPProfileStoreSnapshot activeProfile](self->_snapshot, "activeProfile"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "pb_identifier"));

  return (NSString *)v3;
}

- (NSString)primaryUserProfileIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UPProfileStoreSnapshot primaryProfile](self->_snapshot, "primaryProfile"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "pb_identifier"));

  return (NSString *)v3;
}

- (void)updateUserProfileWithIdentifier:(id)a3 attributes:(id)a4
{
  uint64_t v6 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[UPUpdateProfileRequest pb_updateProfileRequestWithUserProfileIdentifier:attributes:error:]( &OBJC_CLASS___UPUpdateProfileRequest,  "pb_updateProfileRequestWithUserProfileIdentifier:attributes:error:",  a3,  a4,  &v6));
  if (v5) {
    -[NSMutableArray addObject:](self->_updateProfileRequests, "addObject:", v5);
  }
  else {
    -[NSMutableArray bs_safeAddObject:](self->_mutableErrors, "bs_safeAddObject:", v6);
  }
}

- (NSArray)updateProfileRequests
{
  return &self->_updateProfileRequests->super;
}

- (void)setUpdateProfileRequests:(id)a3
{
}

- (NSArray)errors
{
  return self->_errors;
}

- (void)setErrors:(id)a3
{
}

- (void).cxx_destruct
{
}

@end