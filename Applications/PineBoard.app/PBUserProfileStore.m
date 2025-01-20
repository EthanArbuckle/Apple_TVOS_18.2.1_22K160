@interface PBUserProfileStore
- (BOOL)_workQueue_addUserProfile:(id)a3 error:(id *)a4;
- (BOOL)_workQueue_addUserProfile:(id)a3 knownHomeUserIdentifiers:(id)a4 error:(id *)a5;
- (BOOL)_workQueue_hasUserProfileWithHomeUserIdentifier:(id)a3 excludingUserProfile:(id)a4 error:(id *)a5;
- (BOOL)isPerformingBatchUpdates;
- (NSMutableDictionary)mutableGroupRecommendationsSessions;
- (NSMutableDictionary)mutableHomeUsersIdentifiers;
- (NSMutableDictionary)mutableUserProfiles;
- (NSString)primaryUserProfileIdentifier;
- (NSString)selectedUserProfileIdentifier;
- (OS_dispatch_queue)workQueue;
- (PBSUserProfile)primaryUserProfile;
- (PBSUserProfile)selectedUserProfile;
- (PBSUserProfilesSnapshot)snapshot;
- (PBUserProfileStore)initWithType:(int64_t)a3;
- (PBUserProfileStoreDelegate)delegate;
- (id)_workQueue_createUserProfileWithAttributes:(id)a3 error:(id *)a4;
- (id)_workQueue_updateUserProfileWithIdentifier:(id)a3 attributes:(id)a4 error:(id *)a5;
- (id)_workQueue_updateUserProfileWithIdentifier:(id)a3 usingBlock:(id)a4 error:(id *)a5;
- (id)_workQueue_userProfileIdentifierForHomeUserIdentifier:(id)a3 inHomeIdentifier:(id)a4 homeOwnerIdentifier:(id)a5;
- (id)knownHomeUserIdentifiersForUserProfileWithIdentifier:(id)a3;
- (id)lastGroupRecommendationSessionForUserWithIdentifier:(id)a3;
- (id)userProfileIdentifierForHomeUserIdentifier:(id)a3 inHomeIdentifier:(id)a4 homeOwnerIdentifier:(id)a5;
- (int64_t)type;
- (os_unfair_lock_s)snapshotLock;
- (void)_workQueue_initializeUserProfileStore;
- (void)_workQueue_insertOrUpdateUserProfile:(id)a3;
- (void)_workQueue_insertOrUpdateUserProfile:(id)a3 removedSelectedUserProfile:(id)a4;
- (void)_workQueue_removeUserProfileWithIdentifier:(id)a3;
- (void)_workQueue_takeSnapshot;
- (void)_workQueue_writeUserProfilesArchive;
- (void)addUserProfile:(id)a3;
- (void)addUserProfile:(id)a3 knownHomeUserIdentifiers:(id)a4;
- (void)performBatchUpdatesUsingBlock:(id)a3;
- (void)removeUserProfileWithIdentifier:(id)a3;
- (void)save;
- (void)setDelegate:(id)a3;
- (void)setLastGroupRecommendationsSession:(id)a3 forUserWithIdentifier:(id)a4;
- (void)setSnapshotLock:(os_unfair_lock_s)a3;
- (void)updateUserProfileWithIdentifier:(id)a3 usingBlock:(id)a4;
@end

@implementation PBUserProfileStore

- (PBUserProfileStore)initWithType:(int64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PBUserProfileStore;
  v4 = -[PBUserProfileStore init](&v12, "init");
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    uint64_t Serial = BSDispatchQueueCreateSerial(@"com.apple.PineBoard.PBUserProfileStore.workQueue");
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)Serial;

    v5->_snapshotLock._os_unfair_lock_opaque = 0;
    v8 = (dispatch_queue_s *)v5->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100073F70;
    block[3] = &unk_1003CFF08;
    v11 = v5;
    dispatch_sync(v8, block);
  }

  return v5;
}

- (PBSUserProfilesSnapshot)snapshot
{
  p_snapshotLock = &self->_snapshotLock;
  os_unfair_lock_lock(&self->_snapshotLock);
  v4 = self->_snapshot;
  os_unfair_lock_unlock(p_snapshotLock);
  return v4;
}

- (PBSUserProfile)primaryUserProfile
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserProfileStore snapshot](self, "snapshot"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 primaryUserProfile]);

  return (PBSUserProfile *)v3;
}

- (PBSUserProfile)selectedUserProfile
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserProfileStore snapshot](self, "snapshot"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 selectedUserProfile]);

  return (PBSUserProfile *)v3;
}

- (void)addUserProfile:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000740D4;
  v7[3] = &unk_1003CFEB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(workQueue, v7);
}

- (void)addUserProfile:(id)a3 knownHomeUserIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100074224;
  block[3] = &unk_1003D09B8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(workQueue, block);
}

- (void)removeUserProfileWithIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100074354;
  v7[3] = &unk_1003CFEB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(workQueue, v7);
}

- (void)updateUserProfileWithIdentifier:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = v7;
    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
    workQueue = (dispatch_queue_s *)self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100074490;
    block[3] = &unk_1003D2F08;
    void block[4] = self;
    id v14 = v6;
    id v15 = v8;
    id v10 = v8;
    id v11 = v6;
    dispatch_sync(workQueue, block);
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"updateBlock != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027703C();
    }
    _bs_set_crash_log_message([v12 UTF8String]);
    __break(0);
  }

- (void)performBatchUpdatesUsingBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = v4;
    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
    workQueue = (dispatch_queue_s *)self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000745B8;
    block[3] = &unk_1003D0070;
    void block[4] = self;
    id v10 = v5;
    id v7 = v5;
    dispatch_sync(workQueue, block);
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"block != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002770E4();
    }
    _bs_set_crash_log_message([v8 UTF8String]);
    __break(0);
  }

- (id)knownHomeUserIdentifiersForUserProfileWithIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  v17 = sub_1000749BC;
  v18 = sub_1000749CC;
  id v19 = 0LL;
  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000749E4;
  block[3] = &unk_1003D0AD8;
  id v13 = &v14;
  void block[4] = self;
  id v6 = v4;
  id v12 = v6;
  dispatch_sync(workQueue, block);
  id v7 = (void *)v15[5];
  if (v7) {
    id v8 = v7;
  }
  else {
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
  }
  id v9 = v8;

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (id)userProfileIdentifierForHomeUserIdentifier:(id)a3 inHomeIdentifier:(id)a4 homeOwnerIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v22 = 0LL;
  v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  v25 = sub_1000749BC;
  v26 = sub_1000749CC;
  id v27 = 0LL;
  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100074B5C;
  block[3] = &unk_1003D2F30;
  void block[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  v21 = &v22;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(workQueue, block);
  id v15 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v15;
}

- (void)setLastGroupRecommendationsSession:(id)a3 forUserWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  id v8 = sub_100084770();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v17 = v7;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Updating last group recommendation session for user. {identifier=%{public}@, session=%@}",  buf,  0x16u);
  }

  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100074CFC;
  block[3] = &unk_1003D09B8;
  void block[4] = self;
  id v14 = v7;
  id v15 = v6;
  id v11 = v6;
  id v12 = v7;
  dispatch_sync(workQueue, block);
}

- (id)lastGroupRecommendationSessionForUserWithIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = sub_1000749BC;
  uint64_t v16 = sub_1000749CC;
  id v17 = 0LL;
  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100074E08;
  block[3] = &unk_1003D0238;
  void block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(workQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)save
{
  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100074FD0;
  block[3] = &unk_1003CFF08;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)_workQueue_initializeUserProfileStore
{
  id v3 = sub_100084770();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Initializing user profile store.", buf, 2u);
  }

  if (self->_type == 1 && (v5 = sub_10017E87C(0LL), (uint64_t v6 = objc_claimAutoreleasedReturnValue(v5)) != 0))
  {
    id v7 = (NSMutableDictionary *)v6;
    id v8 = sub_100084770();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Reading user profiles archive from disk...",  buf,  2u);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary userProfiles](v7, "userProfiles"));
    id v11 = (NSMutableDictionary *)[v10 mutableCopy];
    mutableUserProfiles = self->_mutableUserProfiles;
    self->_mutableUserProfiles = v11;

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary homeUsersIdentifiers](v7, "homeUsersIdentifiers"));
    uint64_t v14 = (NSMutableDictionary *)[v13 mutableCopy];
    mutableHomeUsersIdentifiers = self->_mutableHomeUsersIdentifiers;
    self->_mutableHomeUsersIdentifiers = v14;

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary groupRecommendationsSessions](v7, "groupRecommendationsSessions"));
    id v17 = (NSMutableDictionary *)[v16 mutableCopy];
    mutableGroupRecommendationsSessions = self->_mutableGroupRecommendationsSessions;
    self->_mutableGroupRecommendationsSessions = v17;

    *(void *)buf = 0LL;
    v37 = buf;
    uint64_t v38 = 0x3032000000LL;
    v39 = sub_1000749BC;
    v40 = sub_1000749CC;
    id v41 = 0LL;
    uint64_t v30 = 0LL;
    v31 = &v30;
    uint64_t v32 = 0x3032000000LL;
    v33 = sub_1000749BC;
    v34 = sub_1000749CC;
    id v35 = 0LL;
    id v19 = self->_mutableUserProfiles;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_100075274;
    v29[3] = &unk_1003D2F58;
    v29[4] = buf;
    v29[5] = &v30;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v19, "enumerateKeysAndObjectsUsingBlock:", v29);
    id v20 = (NSString *)[*((id *)v37 + 5) copy];
    primaryUserProfileIdentifier = self->_primaryUserProfileIdentifier;
    self->_primaryUserProfileIdentifier = v20;

    uint64_t v22 = (NSString *)[(id)v31[5] copy];
    selectedUserProfileIdentifier = self->_selectedUserProfileIdentifier;
    self->_selectedUserProfileIdentifier = v22;

    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(buf, 8);
  }

  else
  {
    uint64_t v24 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v25 = self->_mutableUserProfiles;
    self->_mutableUserProfiles = v24;

    v26 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v27 = self->_mutableHomeUsersIdentifiers;
    self->_mutableHomeUsersIdentifiers = v26;

    v28 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v7 = self->_mutableGroupRecommendationsSessions;
    self->_mutableGroupRecommendationsSessions = v28;
  }

  -[PBUserProfileStore _workQueue_takeSnapshot](self, "_workQueue_takeSnapshot");
}

- (void)_workQueue_writeUserProfilesArchive
{
  if (self->_type == 1)
  {
    id v3 = -[PBUserProfilesArchive initWithUserProfiles:homeUsersIdentifiers:groupRecommendationSessions:]( objc_alloc(&OBJC_CLASS___PBUserProfilesArchive),  "initWithUserProfiles:homeUsersIdentifiers:groupRecommendationSessions:",  self->_mutableUserProfiles,  self->_mutableHomeUsersIdentifiers,  self->_mutableGroupRecommendationsSessions);
    id v8 = 0LL;
    unsigned __int8 v4 = sub_10017E8DC(v3, (uint64_t)&v8);
    id v5 = v8;
    if ((v4 & 1) == 0)
    {
      id v6 = sub_100084770();
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        sub_10027718C(v5, v7);
      }
    }
  }

- (BOOL)_workQueue_addUserProfile:(id)a3 error:(id *)a4
{
  return -[PBUserProfileStore _workQueue_addUserProfile:knownHomeUserIdentifiers:error:]( self,  "_workQueue_addUserProfile:knownHomeUserIdentifiers:error:",  a3,  0LL,  a4);
}

- (BOOL)_workQueue_addUserProfile:(id)a3 knownHomeUserIdentifiers:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  mutableUserProfiles = self->_mutableUserProfiles;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](mutableUserProfiles, "objectForKey:", v11));

  if (!v12)
  {
    if ([v8 type]
      || (uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserProfileStore primaryUserProfileIdentifier](self, "primaryUserProfileIdentifier")),
          v22,
          !v22))
    {
      if ([v8 type]
        || (v23 = (void *)objc_claimAutoreleasedReturnValue([v8 personaUniqueString]),
            v23,
            !v23))
      {
        if ([v8 type] == (id)1)
        {
          __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v8 personaUniqueString]);

          if (!v18)
          {
            if (a5)
            {
              uint64_t v13 = PBSUserProfileServiceErrorDomain;
              NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
              v29 = @"Guest user profiles must have a persona unique string.";
              uint64_t v14 = &v29;
              id v15 = &v28;
              goto LABEL_4;
            }

            goto LABEL_26;
          }
        }

        id v19 = (void *)objc_claimAutoreleasedReturnValue([v8 iTunesAltDSID]);
        if (v19)
        {
        }

        else
        {
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v8 homeUserIdentifier]);

          if (v24)
          {
            if (a5)
            {
              uint64_t v13 = PBSUserProfileServiceErrorDomain;
              NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
              id v27 = @"A user profile may not have an associated home user if it does not have an associated iTunes account.";
              uint64_t v14 = &v27;
              id v15 = &v26;
              goto LABEL_4;
            }

            goto LABEL_26;
          }
        }

        id v20 = (void *)objc_claimAutoreleasedReturnValue([v8 homeUserIdentifier]);
        unsigned __int8 v21 = -[PBUserProfileStore _workQueue_hasUserProfileWithHomeUserIdentifier:excludingUserProfile:error:]( self,  "_workQueue_hasUserProfileWithHomeUserIdentifier:excludingUserProfile:error:",  v20,  v8,  a5);

        if ((v21 & 1) == 0)
        {
          -[PBUserProfileStore _workQueue_insertOrUpdateUserProfile:](self, "_workQueue_insertOrUpdateUserProfile:", v8);
          if (![v9 count])
          {
            BOOL v17 = 1;
            goto LABEL_27;
          }

          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
          -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_mutableHomeUsersIdentifiers,  "setObject:forKeyedSubscript:",  v9,  v16);
          BOOL v17 = 1;
          goto LABEL_5;
        }

        goto LABEL_26;
      }

      if (a5)
      {
        uint64_t v13 = PBSUserProfileServiceErrorDomain;
        NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
        v31 = @"The primary user profile may not have a persona unique string.";
        uint64_t v14 = &v31;
        id v15 = &v30;
        goto LABEL_4;
      }
    }

    else if (a5)
    {
      uint64_t v13 = PBSUserProfileServiceErrorDomain;
      NSErrorUserInfoKey v32 = NSLocalizedDescriptionKey;
      v33 = @"The primary user profile already exists.";
      uint64_t v14 = &v33;
      id v15 = &v32;
      goto LABEL_4;
    }

- (void)_workQueue_insertOrUpdateUserProfile:(id)a3
{
  workQueue = (dispatch_queue_s *)self->_workQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(workQueue);
  -[PBUserProfileStore _workQueue_insertOrUpdateUserProfile:removedSelectedUserProfile:]( self,  "_workQueue_insertOrUpdateUserProfile:removedSelectedUserProfile:",  v5,  0LL);
}

- (void)_workQueue_insertOrUpdateUserProfile:(id)a3 removedSelectedUserProfile:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    NSErrorUserInfoKey v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"userProfile != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027724C();
    }
    _bs_set_crash_log_message([v30 UTF8String]);
    __break(0);
    JUMPOUT(0x100075B64LL);
  }

  id v8 = v7;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);

  if (!v9)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[userProfile identifier] != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002772F4();
    }
    _bs_set_crash_log_message([v31 UTF8String]);
    __break(0);
    JUMPOUT(0x100075BC8LL);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  if (!-[NSMutableDictionary count](self->_mutableUserProfiles, "count")
    && ([v6 isSelected] & 1) == 0)
  {
    id v11 = sub_100084770();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      BOOL isPerformingBatchUpdates = self->_isPerformingBatchUpdates;
      *(_DWORD *)buf = 67109378;
      BOOL v36 = isPerformingBatchUpdates;
      __int16 v37 = 2114;
      uint64_t v38 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Inserting first user profile, making it the selected one. {isPerformingBatchUpdates=%{BOOL}d, identifier=%{public}@}",  buf,  0x12u);
    }

    id v14 = [v6 mutableCopy];
    [v14 setSelected:1];
    id v15 = [v14 copy];

    id v6 = v15;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_mutableUserProfiles,  "setObject:forKeyedSubscript:",  v6,  v10);
  if (!self->_primaryUserProfileIdentifier && ![v6 type]) {
    objc_storeStrong((id *)&self->_primaryUserProfileIdentifier, v10);
  }
  if ([v6 isSelected])
  {
    p_selectedUserProfileIdentifier = &self->_selectedUserProfileIdentifier;
    selectedUserProfileIdentifier = self->_selectedUserProfileIdentifier;
    if (selectedUserProfileIdentifier)
    {
      selectedUserProfileIdentifier = *p_selectedUserProfileIdentifier;
    }

    uint64_t v18 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_mutableUserProfiles,  "objectForKeyedSubscript:",  selectedUserProfileIdentifier));
    id v19 = (void *)v18;
    if (v18) {
      id v20 = (void *)v18;
    }
    else {
      id v20 = v8;
    }
    id v21 = v20;

    if (v21)
    {
      id v22 = [v21 mutableCopy];
      [v22 setSelected:0];
      id v23 = [v22 copy];

      uint64_t v24 = *p_selectedUserProfileIdentifier;
      v25 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
      LOBYTE(v24) = -[NSString isEqualToString:](v24, "isEqualToString:", v25);

      if ((v24 & 1) == 0 && *p_selectedUserProfileIdentifier) {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_mutableUserProfiles,  "setObject:forKeyedSubscript:",  v23);
      }
    }

    else
    {
      id v23 = 0LL;
    }

    objc_storeStrong((id *)&self->_selectedUserProfileIdentifier, v10);
    id v26 = sub_100084770();
    id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v28 = self->_isPerformingBatchUpdates;
      v29 = (void *)objc_claimAutoreleasedReturnValue([v23 identifier]);
      *(_DWORD *)buf = 67109634;
      BOOL v36 = v28;
      __int16 v37 = 2114;
      uint64_t v38 = v10;
      __int16 v39 = 2114;
      v40 = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Selected user profile changed. {isPerformingBatchUpdates=%{BOOL}d, selectedIdentifier=%{public}@, previousSelect edIdentifier=%{public}@}",  buf,  0x1Cu);
    }

    if (!self->_isPerformingBatchUpdates)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100075BD0;
      block[3] = &unk_1003D09B8;
      void block[4] = self;
      id v33 = v6;
      id v34 = v23;
      dispatch_async(&_dispatch_main_q, block);
    }
  }

- (void)_workQueue_removeUserProfileWithIdentifier:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"identifier != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027739C();
    }
    _bs_set_crash_log_message([v27 UTF8String]);
    __break(0);
    JUMPOUT(0x100075F84LL);
  }

  id v5 = v4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v6 = sub_100084770();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isPerformingBatchUpdates = self->_isPerformingBatchUpdates;
    *(_DWORD *)buf = 138543618;
    NSErrorUserInfoKey v32 = v5;
    __int16 v33 = 1024;
    BOOL v34 = isPerformingBatchUpdates;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Removing user. {identifier=%{public}@, isPerformingBatchUpdates=%{BOOL}d}",  buf,  0x12u);
  }

  -[NSMutableDictionary removeObjectForKey:](self->_mutableHomeUsersIdentifiers, "removeObjectForKey:", v5);
  -[NSMutableDictionary removeObjectForKey:](self->_mutableGroupRecommendationsSessions, "removeObjectForKey:", v5);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary bs_takeObjectForKey:](self->_mutableUserProfiles, "bs_takeObjectForKey:", v5));
  if (![v9 type])
  {
    primaryUserProfileIdentifier = self->_primaryUserProfileIdentifier;
    self->_primaryUserProfileIdentifier = 0LL;
  }

  if (-[NSMutableDictionary count](self->_mutableUserProfiles, "count"))
  {
    if ([v9 isSelected])
    {
      id v11 = sub_100084770();
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v13 = self->_isPerformingBatchUpdates;
        *(_DWORD *)buf = 67109120;
        LODWORD(v32) = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Selected user profile was removed. {isPerformingBatchUpdates=%{BOOL}d}",  buf,  8u);
      }

      id v14 = self->_primaryUserProfileIdentifier;
      if (v14)
      {
        id v15 = v14;
      }

      else
      {
        id v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_mutableUserProfiles, "allKeys"));
        id v15 = (NSString *)objc_claimAutoreleasedReturnValue([v23 firstObject]);
      }

      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_mutableUserProfiles,  "objectForKeyedSubscript:",  v15));
      id v25 = [v24 mutableCopy];

      if (!v25)
      {
        BOOL v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"newSelectedUser != nil"));
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100277444();
        }
        _bs_set_crash_log_message([v28 UTF8String]);
        __break(0);
        JUMPOUT(0x100075FE8LL);
      }

      [v25 setSelected:1];
      id v26 = [v25 copy];
      -[PBUserProfileStore _workQueue_insertOrUpdateUserProfile:removedSelectedUserProfile:]( self,  "_workQueue_insertOrUpdateUserProfile:removedSelectedUserProfile:",  v26,  v9);
    }

    else if (!self->_isPerformingBatchUpdates)
    {
      -[PBUserProfileStore _workQueue_takeSnapshot](self, "_workQueue_takeSnapshot");
    }
  }

  else
  {
    uint64_t v16 = self->_primaryUserProfileIdentifier;
    self->_primaryUserProfileIdentifier = 0LL;

    selectedUserProfileIdentifier = self->_selectedUserProfileIdentifier;
    self->_selectedUserProfileIdentifier = 0LL;

    id v18 = sub_100084770();
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v20 = self->_isPerformingBatchUpdates;
      *(_DWORD *)buf = 67109120;
      LODWORD(v32) = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Last user removed, selected user changed to none. {isPerformingBatchUpdates=%{BOOL}d}",  buf,  8u);
    }

    if (!self->_isPerformingBatchUpdates)
    {
      -[PBUserProfileStore _workQueue_takeSnapshot](self, "_workQueue_takeSnapshot");
      else {
        id v21 = 0LL;
      }
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100075FF0;
      block[3] = &unk_1003CFEB8;
      void block[4] = self;
      id v30 = v21;
      id v22 = v30;
      dispatch_async(&_dispatch_main_q, block);
    }
  }
}

- (id)_workQueue_updateUserProfileWithIdentifier:(id)a3 usingBlock:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"block != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002774EC();
    }
    _bs_set_crash_log_message([v27 UTF8String]);
    __break(0);
    JUMPOUT(0x100076400LL);
  }

  id v10 = (void (**)(void, void))v9;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (v8)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_mutableUserProfiles, "objectForKey:", v8));
    id v12 = [v11 mutableCopy];

    if (!v12)
    {
      id v17 = 0LL;
      if (a5) {
        *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PBSUserProfileServiceErrorDomain,  200LL,  0LL));
      }
      goto LABEL_21;
    }

    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v12 iTunesAltDSID]);
    ((void (**)(void, id))v10)[2](v10, v12);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 iTunesAltDSID]);
    if (v14)
    {
    }

    else
    {
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v12 homeUserIdentifier]);

      if (v23)
      {
        if (a5)
        {
          uint64_t v24 = PBSUserProfileServiceErrorDomain;
          NSErrorUserInfoKey v40 = NSLocalizedDescriptionKey;
          id v41 = @"A user profile may not have an associated home user if it does not have an associated iTunes account.";
          id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v41,  &v40,  1LL));
          *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v24,  300LL,  v25));
        }

        goto LABEL_19;
      }
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 homeUserIdentifier]);
    unsigned __int8 v16 = -[PBUserProfileStore _workQueue_hasUserProfileWithHomeUserIdentifier:excludingUserProfile:error:]( self,  "_workQueue_hasUserProfileWithHomeUserIdentifier:excludingUserProfile:error:",  v15,  v12,  a5);

    if ((v16 & 1) == 0)
    {
      id v17 = [v12 copy];
      -[PBUserProfileStore _workQueue_insertOrUpdateUserProfile:](self, "_workQueue_insertOrUpdateUserProfile:", v17);
      if ([v17 isSelected])
      {
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 iTunesAltDSID]);
        unsigned __int8 v19 = [v18 isEqualToString:v13];

        if ((v19 & 1) == 0)
        {
          id v20 = sub_100084770();
          id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            id v22 = (void *)objc_claimAutoreleasedReturnValue([v17 iTunesAltDSID]);
            *(_DWORD *)buf = 138544386;
            id v31 = v8;
            __int16 v32 = 2160;
            uint64_t v33 = 1752392040LL;
            __int16 v34 = 2112;
            id v35 = v13;
            __int16 v36 = 2160;
            uint64_t v37 = 1752392040LL;
            __int16 v38 = 2112;
            __int16 v39 = v22;
            _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Selected user profile got its iTunes account updated, activating it. {identifier=%{public}@, oldiTunesAltD SID=%{mask.hash}@, newiTunesAltDSID=%{mask.hash}@}",  buf,  0x34u);
          }

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_100076408;
          block[3] = &unk_1003CFEB8;
          void block[4] = self;
          id v17 = v17;
          id v29 = v17;
          dispatch_async(&_dispatch_main_q, block);
        }
      }

      goto LABEL_20;
    }

- (void)_workQueue_takeSnapshot
{
  if (self->_isPerformingBatchUpdates)
  {
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"!_isPerformingBatchUpdates"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100277594();
    }
    _bs_set_crash_log_message([v13 UTF8String]);
    __break(0);
    JUMPOUT(0x1000765D8LL);
  }

  os_unfair_lock_lock(&self->_snapshotLock);
  id v3 = objc_alloc(&OBJC_CLASS___PBSUserProfilesSnapshot);
  id v4 = -[NSMutableDictionary copy](self->_mutableUserProfiles, "copy");
  id v5 = -[PBSUserProfilesSnapshot initWithUserProfiles:primaryProfileIdentifier:selectedProfileIdentifier:]( v3,  "initWithUserProfiles:primaryProfileIdentifier:selectedProfileIdentifier:",  v4,  self->_primaryUserProfileIdentifier,  self->_selectedUserProfileIdentifier);
  snapshot = self->_snapshot;
  self->_snapshot = v5;

  id v7 = sub_100084770();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBSUserProfilesSnapshot userProfiles](self->_snapshot, "userProfiles"));
    id v10 = [v9 count];
    primaryUserProfileIdentifier = self->_primaryUserProfileIdentifier;
    selectedUserProfileIdentifier = self->_selectedUserProfileIdentifier;
    *(_DWORD *)buf = 134218498;
    id v15 = v10;
    __int16 v16 = 2114;
    id v17 = primaryUserProfileIdentifier;
    __int16 v18 = 2114;
    unsigned __int8 v19 = selectedUserProfileIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "New Snapshot taken. {usersCount=%ld, primaryIdentifier=%{public}@, selectedIdentifier=%{public}@}",  buf,  0x20u);
  }

  os_unfair_lock_unlock(&self->_snapshotLock);
}

- (id)_workQueue_createUserProfileWithAttributes:(id)a3 error:(id *)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (v6)
  {
    id v23 = objc_alloc(&OBJC_CLASS___PBSUserProfile);
    id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v26 UUIDString]);
    id v22 = [v6 type];
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 iCloudAltDSID]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 iTunesAltDSID]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 gameCenterAltDSID]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 personaUniqueString]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 homeUserIdentifier]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 overrideName]);
    id v25 = self;
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v6 preferredLanguages]);
    uint64_t v24 = a4;
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 preferredInputModes]);
    LOBYTE(v20) = 0;
    id v15 = -[PBSUserProfile initWithIdentifier:type:iCloudAltDSID:iTunesAltDSID:gameCenterAltDSID:personaUniqueString:homeUserIdentifier:selected:overrideName:groupRecommendationsConsent:lastSelectedDate:preferredLanguages:preferredInputModes:]( v23,  "initWithIdentifier:type:iCloudAltDSID:iTunesAltDSID:gameCenterAltDSID:personaUniqueString:homeUserIdentifier :selected:overrideName:groupRecommendationsConsent:lastSelectedDate:preferredLanguages:preferredInputModes:",  v21,  v22,  v7,  v8,  v9,  v10,  v11,  v20,  v12,  0LL,  0LL,  v13,  v14);

    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v6 knownHomeUserIdentifiers]);
    LODWORD(v11) = -[PBUserProfileStore _workQueue_addUserProfile:knownHomeUserIdentifiers:error:]( v25,  "_workQueue_addUserProfile:knownHomeUserIdentifiers:error:",  v15,  v16,  v24);

    if ((_DWORD)v11)
    {
      id v15 = v15;
      id v17 = v15;
    }

    else
    {
      id v17 = 0LL;
    }
  }

  else
  {
    if (!a4)
    {
      id v17 = 0LL;
      goto LABEL_8;
    }

    uint64_t v18 = PBSUserProfileServiceErrorDomain;
    NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
    BOOL v28 = @"Failed to create user profile with nil attributes.";
    id v15 = (PBSUserProfile *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
    id v17 = 0LL;
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v18,  300LL,  v15));
  }

LABEL_8:
  return v17;
}

- (id)_workQueue_updateUserProfileWithIdentifier:(id)a3 attributes:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (v9)
  {
    id v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472LL;
    id v17 = sub_1000769E4;
    uint64_t v18 = &unk_1003D2F80;
    id v19 = v9;
    id v10 = objc_retainBlock(&v15);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( -[PBUserProfileStore _workQueue_updateUserProfileWithIdentifier:usingBlock:error:]( self,  "_workQueue_updateUserProfileWithIdentifier:usingBlock:error:",  v8,  v10,  a5,  v15,  v16,  v17,  v18));

    id v12 = v19;
  }

  else
  {
    if (!a5)
    {
      id v11 = 0LL;
      goto LABEL_6;
    }

    uint64_t v13 = PBSUserProfileServiceErrorDomain;
    NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
    id v21 = @"Failed to update user profile with nil attributes.";
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
    id v11 = 0LL;
    *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v13,  300LL,  v12));
  }

LABEL_6:
  return v11;
}

- (id)_workQueue_userProfileIdentifierForHomeUserIdentifier:(id)a3 inHomeIdentifier:(id)a4 homeOwnerIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (!v9)
  {
    id v11 = sub_100084770();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "No homeUniqueIdentifier, we won't be able to match known home user identifiers.",  buf,  2u);
    }
  }

  uint64_t v36 = 0LL;
  uint64_t v37 = (id *)&v36;
  uint64_t v38 = 0x3032000000LL;
  __int16 v39 = sub_1000749BC;
  NSErrorUserInfoKey v40 = sub_1000749CC;
  id v41 = 0LL;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_mutableUserProfiles, "allValues"));
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_100077180;
  v34[3] = &unk_1003D2FA8;
  id v14 = v8;
  id v35 = v14;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bs_firstObjectPassingTest:", v34));

  if (v15)
  {
    id v16 = sub_100084770();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 141558274;
      uint64_t v43 = 1752392040LL;
      __int16 v44 = 2112;
      id v45 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Found existing home user matching the user unique identifier. {userUniqueIdentifier=%{mask.hash}@}",  buf,  0x16u);
    }

    uint64_t v18 = objc_claimAutoreleasedReturnValue([v15 identifier]);
    id v19 = v37[5];
    v37[5] = (id)v18;
LABEL_19:

    goto LABEL_20;
  }

  if (v9)
  {
    id v20 = sub_100084770();
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 141558786;
      uint64_t v43 = 1752392040LL;
      __int16 v44 = 2112;
      id v45 = v9;
      __int16 v46 = 2160;
      uint64_t v47 = 1752392040LL;
      __int16 v48 = 2112;
      id v49 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Searching the known home user identifiers for the home. {homeUniqueIdentifier=%{mask.hash}@, userUniqueIdentifie r=%{mask.hash}@}",  buf,  0x2Au);
    }

    mutableHomeUsersIdentifiers = self->_mutableHomeUsersIdentifiers;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_1000771C4;
    v30[3] = &unk_1003D2FD0;
    id v31 = v9;
    id v23 = v14;
    id v32 = v23;
    uint64_t v33 = &v36;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( mutableHomeUsersIdentifiers,  "enumerateKeysAndObjectsUsingBlock:",  v30);
    if (!v37[5])
    {
      id v24 = sub_100084770();
      id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        primaryUserProfileIdentifier = self->_primaryUserProfileIdentifier;
        *(_DWORD *)buf = 141559042;
        uint64_t v43 = 1752392040LL;
        __int16 v44 = 2112;
        id v45 = v23;
        __int16 v46 = 2160;
        uint64_t v47 = 1752392040LL;
        __int16 v48 = 2112;
        id v49 = v10;
        __int16 v50 = 2114;
        v51 = primaryUserProfileIdentifier;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Didn't find a user profile matching home user identifier, trying to match with the primary profile. {homeUserI dentifier=%{mask.hash}@, homeOwnerIdentifier=%{mask.hash}@, primaryIdentifier=%{public}@}",  buf,  0x34u);
      }

      if (BSEqualObjects(v23, v10))
      {
        NSErrorUserInfoKey v27 = self->_primaryUserProfileIdentifier;
        if (v27) {
          objc_storeStrong(v37 + 5, v27);
        }
      }
    }

    id v19 = v31;
    goto LABEL_19;
  }

- (BOOL)_workQueue_hasUserProfileWithHomeUserIdentifier:(id)a3 excludingUserProfile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_mutableUserProfiles, "allValues"));
    id v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472LL;
    id v23 = sub_10007748C;
    id v24 = &unk_1003D2FF8;
    id v11 = v8;
    id v25 = v11;
    id v12 = v9;
    id v26 = v12;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bs_firstObjectPassingTest:", &v21));

    if (v13)
    {
      if (a5)
      {
        uint64_t v14 = PBSUserProfileServiceErrorDomain;
        NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
        __int16 v34 = @"A user profile with the home user identifier already exists.";
        id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL,  v21,  v22,  v23,  v24,  v25));
        *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v14,  300LL,  v15));
      }

      id v16 = sub_100084770();
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
        *(_DWORD *)buf = 138412802;
        id v28 = v11;
        __int16 v29 = 2114;
        id v30 = v20;
        __int16 v31 = 2112;
        id v32 = v12;
        _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Another user profile with the home user identifier already exists. {homeUserIdentifier=%@, existingUserProfile Identifier=%{public}@, invalidUserProfile=%@}",  buf,  0x20u);
      }
    }

    BOOL v18 = v13 != 0LL;
  }

  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (PBUserProfileStoreDelegate)delegate
{
  return (PBUserProfileStoreDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSMutableDictionary)mutableUserProfiles
{
  return self->_mutableUserProfiles;
}

- (NSMutableDictionary)mutableHomeUsersIdentifiers
{
  return self->_mutableHomeUsersIdentifiers;
}

- (NSMutableDictionary)mutableGroupRecommendationsSessions
{
  return self->_mutableGroupRecommendationsSessions;
}

- (NSString)primaryUserProfileIdentifier
{
  return self->_primaryUserProfileIdentifier;
}

- (NSString)selectedUserProfileIdentifier
{
  return self->_selectedUserProfileIdentifier;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)isPerformingBatchUpdates
{
  return self->_isPerformingBatchUpdates;
}

- (os_unfair_lock_s)snapshotLock
{
  return self->_snapshotLock;
}

- (void)setSnapshotLock:(os_unfair_lock_s)a3
{
  self->_snapshotLock = a3;
}

- (void).cxx_destruct
{
}

@end