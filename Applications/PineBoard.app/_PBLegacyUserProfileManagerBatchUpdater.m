@interface _PBLegacyUserProfileManagerBatchUpdater
- (NSDictionary)userProfiles;
- (NSSet)errors;
- (NSString)primaryUserProfileIdentifier;
- (NSString)selectedUserProfileIdentifier;
- (PBSUserProfileStoreBatchUpdater)updater;
- (_PBLegacyUserProfileManagerBatchUpdater)init;
- (void)setErrors:(id)a3;
- (void)setUpdater:(id)a3;
- (void)updateUserProfileWithIdentifier:(id)a3 attributes:(id)a4;
@end

@implementation _PBLegacyUserProfileManagerBatchUpdater

- (_PBLegacyUserProfileManagerBatchUpdater)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____PBLegacyUserProfileManagerBatchUpdater;
  v2 = -[_PBLegacyUserProfileManagerBatchUpdater init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    mutableErrors = v2->_mutableErrors;
    v2->_mutableErrors = v3;
  }

  return v2;
}

- (NSSet)errors
{
  return (NSSet *)-[NSMutableSet copy](self->_mutableErrors, "copy");
}

- (NSDictionary)userProfiles
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updater);
  v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained userProfiles]);

  return (NSDictionary *)v3;
}

- (NSString)selectedUserProfileIdentifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updater);
  v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained selectedUserProfileIdentifier]);

  return (NSString *)v3;
}

- (NSString)primaryUserProfileIdentifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updater);
  v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained primaryUserProfileIdentifier]);

  return (NSString *)v3;
}

- (void)updateUserProfileWithIdentifier:(id)a3 attributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updater);
  id v11 = 0LL;
  id v9 = [WeakRetained updateUserProfileWithIdentifier:v6 attributes:v7 error:&v11];
  id v10 = v11;

  -[NSMutableSet bs_safeAddObject:](self->_mutableErrors, "bs_safeAddObject:", v10);
}

- (void)setErrors:(id)a3
{
}

- (PBSUserProfileStoreBatchUpdater)updater
{
  return (PBSUserProfileStoreBatchUpdater *)objc_loadWeakRetained((id *)&self->_updater);
}

- (void)setUpdater:(id)a3
{
}

- (void).cxx_destruct
{
}

@end