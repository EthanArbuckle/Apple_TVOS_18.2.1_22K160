@interface UPProfileStoreSnapshot
- (PBSUserProfilesSnapshot)pb_userProfilesSnapshot;
@end

@implementation UPProfileStoreSnapshot

- (PBSUserProfilesSnapshot)pb_userProfilesSnapshot
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UPProfileStoreSnapshot profiles](self, "profiles", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pb_userProfile"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pb_identifier"));
        -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v10, v11);
      }

      id v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v6);
  }

  v12 = objc_alloc(&OBJC_CLASS___PBSUserProfilesSnapshot);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UPProfileStoreSnapshot primaryProfile](self, "primaryProfile"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "pb_identifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UPProfileStoreSnapshot activeProfile](self, "activeProfile"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "pb_identifier"));
  v17 = -[PBSUserProfilesSnapshot initWithUserProfiles:primaryProfileIdentifier:selectedProfileIdentifier:]( v12,  "initWithUserProfiles:primaryProfileIdentifier:selectedProfileIdentifier:",  v3,  v14,  v16);

  return v17;
}

@end