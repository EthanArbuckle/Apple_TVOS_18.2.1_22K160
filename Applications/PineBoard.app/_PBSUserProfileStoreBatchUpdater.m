@interface _PBSUserProfileStoreBatchUpdater
- (BOOL)addUserProfile:(id)a3 error:(id *)a4;
- (NSDictionary)userProfiles;
- (NSString)primaryUserProfileIdentifier;
- (NSString)selectedUserProfileIdentifier;
- (PBUserProfileStore)userProfileStore;
- (id)createUserProfileWithAttributes:(id)a3 error:(id *)a4;
- (id)updateUserProfileWithIdentifier:(id)a3 attributes:(id)a4 error:(id *)a5;
- (id)updateUserProfileWithIdentifier:(id)a3 usingBlock:(id)a4 error:(id *)a5;
- (id)userProfileIdentifierForHomeUserIdentifier:(id)a3 inHomeIdentifier:(id)a4 homeOwnerIdentifier:(id)a5;
- (void)addUserProfile:(id)a3;
- (void)removeUserProfileWithIdentifier:(id)a3;
- (void)setUserProfileStore:(id)a3;
- (void)updateUserProfileWithIdentifier:(id)a3 usingBlock:(id)a4;
@end

@implementation _PBSUserProfileStoreBatchUpdater

- (NSDictionary)userProfiles
{
  p_userProfileStore = &self->_userProfileStore;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userProfileStore);
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([WeakRetained workQueue]);
  dispatch_assert_queue_V2(v4);

  id v5 = objc_loadWeakRetained((id *)p_userProfileStore);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mutableUserProfiles]);
  id v7 = [v6 copy];

  return (NSDictionary *)v7;
}

- (NSString)primaryUserProfileIdentifier
{
  p_userProfileStore = &self->_userProfileStore;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userProfileStore);
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([WeakRetained workQueue]);
  dispatch_assert_queue_V2(v4);

  id v5 = objc_loadWeakRetained((id *)p_userProfileStore);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 primaryUserProfileIdentifier]);

  return (NSString *)v6;
}

- (NSString)selectedUserProfileIdentifier
{
  p_userProfileStore = &self->_userProfileStore;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userProfileStore);
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([WeakRetained workQueue]);
  dispatch_assert_queue_V2(v4);

  id v5 = objc_loadWeakRetained((id *)p_userProfileStore);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 selectedUserProfileIdentifier]);

  return (NSString *)v6;
}

- (void)addUserProfile:(id)a3
{
  p_userProfileStore = &self->_userProfileStore;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_userProfileStore);
  objc_msgSend(WeakRetained, "_workQueue_addUserProfile:error:", v4, 0);
}

- (void)removeUserProfileWithIdentifier:(id)a3
{
  p_userProfileStore = &self->_userProfileStore;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_userProfileStore);
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([WeakRetained workQueue]);
  dispatch_assert_queue_V2(v6);

  id v7 = objc_loadWeakRetained((id *)p_userProfileStore);
  objc_msgSend(v7, "_workQueue_removeUserProfileWithIdentifier:", v4);
}

- (void)updateUserProfileWithIdentifier:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userProfileStore);
  id v9 = objc_msgSend(WeakRetained, "_workQueue_updateUserProfileWithIdentifier:usingBlock:error:", v6, v7, 0);
}

- (BOOL)addUserProfile:(id)a3 error:(id *)a4
{
  p_userProfileStore = &self->_userProfileStore;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_userProfileStore);
  LOBYTE(a4) = objc_msgSend(WeakRetained, "_workQueue_addUserProfile:error:", v6, a4);

  return (char)a4;
}

- (id)createUserProfileWithAttributes:(id)a3 error:(id *)a4
{
  p_userProfileStore = &self->_userProfileStore;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_userProfileStore);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_workQueue_createUserProfileWithAttributes:error:", v6, a4));

  return v8;
}

- (id)updateUserProfileWithIdentifier:(id)a3 usingBlock:(id)a4 error:(id *)a5
{
  p_userProfileStore = &self->_userProfileStore;
  id v8 = a4;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_userProfileStore);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_workQueue_updateUserProfileWithIdentifier:usingBlock:error:", v9, v8, a5));

  return v11;
}

- (id)updateUserProfileWithIdentifier:(id)a3 attributes:(id)a4 error:(id *)a5
{
  p_userProfileStore = &self->_userProfileStore;
  id v8 = a4;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_userProfileStore);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_workQueue_updateUserProfileWithIdentifier:attributes:error:", v9, v8, a5));

  return v11;
}

- (id)userProfileIdentifierForHomeUserIdentifier:(id)a3 inHomeIdentifier:(id)a4 homeOwnerIdentifier:(id)a5
{
  p_userProfileStore = &self->_userProfileStore;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_userProfileStore);
  v12 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( WeakRetained,  "_workQueue_userProfileIdentifierForHomeUserIdentifier:inHomeIdentifier:homeOwnerIdentifier:",  v10,  v9,  v8));

  return v12;
}

- (PBUserProfileStore)userProfileStore
{
  return (PBUserProfileStore *)objc_loadWeakRetained((id *)&self->_userProfileStore);
}

- (void)setUserProfileStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end