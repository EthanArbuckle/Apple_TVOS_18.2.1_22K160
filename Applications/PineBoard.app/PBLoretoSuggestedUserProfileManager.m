@interface PBLoretoSuggestedUserProfileManager
+ (id)_updateProfileRequestsForLegacySuggestedUserProfilesArchive:(id)a3;
- (PBLoretoSuggestedUserProfileManager)init;
- (PBLoretoSuggestedUserProfileManager)initWithSuggestedUserProfilesArchiveController:(id)a3;
- (PBSSuggestedUserProfileSnapshot)suggestedUserProfileSnapshot;
- (void)_migrateSuggestedUserProfilesWithController:(id)a3;
- (void)_notifyObservers;
- (void)_removeSuggestedUserProfilesArchiveWithController:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)updateSuppressedForSuggestedUserWithIdentifier:(id)a3 suppressed:(id)a4;
@end

@implementation PBLoretoSuggestedUserProfileManager

- (PBLoretoSuggestedUserProfileManager)init
{
  v3 = objc_alloc_init(&OBJC_CLASS___PBSuggestedUserProfilesArchiveController);
  v4 = -[PBLoretoSuggestedUserProfileManager initWithSuggestedUserProfilesArchiveController:]( self,  "initWithSuggestedUserProfilesArchiveController:",  v3);

  return v4;
}

- (PBLoretoSuggestedUserProfileManager)initWithSuggestedUserProfilesArchiveController:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    v20.receiver = self;
    v20.super_class = (Class)&OBJC_CLASS___PBLoretoSuggestedUserProfileManager;
    v7 = -[PBLoretoSuggestedUserProfileManager init](&v20, "init");
    if (v7)
    {
      v8 = objc_alloc_init(&OBJC_CLASS___TVSObserverSet);
      observers = v7->_observers;
      v7->_observers = v8;

      v10 = objc_alloc_init(&OBJC_CLASS___UPCandidateProfileStore);
      profileStore = v7->_profileStore;
      v7->_profileStore = v10;

      objc_initWeak(&location, v7);
      v12 = v7->_profileStore;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_100056590;
      v17[3] = &unk_1003D2158;
      objc_copyWeak(&v18, &location);
      uint64_t v13 = objc_claimAutoreleasedReturnValue(-[UPCandidateProfileStore observeUpdatesUsingHandler:](v12, "observeUpdatesUsingHandler:", v17));
      profileStoreObserverToken = v7->_profileStoreObserverToken;
      v7->_profileStoreObserverToken = (BSInvalidatable *)v13;

      -[PBLoretoSuggestedUserProfileManager _migrateSuggestedUserProfilesWithController:]( v7,  "_migrateSuggestedUserProfilesWithController:",  v6);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }

    return v7;
  }

  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"profileArchiveController"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027469C(a2);
    }
    result = (PBLoretoSuggestedUserProfileManager *)_bs_set_crash_log_message([v16 UTF8String]);
    __break(0);
  }

  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBLoretoSuggestedUserProfileManager;
  -[PBLoretoSuggestedUserProfileManager dealloc](&v3, "dealloc");
}

- (PBSSuggestedUserProfileSnapshot)suggestedUserProfileSnapshot
{
  id v3 = objc_alloc_init(&OBJC_CLASS___UPFetchCandidateProfileStoreSnapshotRequest);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UPSettingKey nameComponentsSettingKey](&OBJC_CLASS___UPSettingKey, "nameComponentsSettingKey"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[UPSettingRequest settingRequestWithKey:]( &OBJC_CLASS___UPSettingRequest,  "settingRequestWithKey:",  v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v5));
  [v3 setSettingRequests:v6];

  id v7 = sub_100083FF0();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[PBLoretoSuggestedUserProfileManager suggestedUserProfileSnapshot]";
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s: Retrieving snapshot from candidate profile store.",  buf,  0xCu);
  }

  profileStore = self->_profileStore;
  id v23 = 0LL;
  v10 = (void *)objc_claimAutoreleasedReturnValue( -[UPCandidateProfileStore snapshotForFetchRequest:error:]( profileStore,  "snapshotForFetchRequest:error:",  v3,  &v23));
  id v11 = v23;
  id v12 = sub_100083FF0();
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  v14 = v13;
  if (v10)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[PBLoretoSuggestedUserProfileManager suggestedUserProfileSnapshot]";
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s: Successfully retrieved snapshot from candidate profile store.",  buf,  0xCu);
    }
  }

  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10027474C((uint64_t)v11, v14, v15, v16, v17, v18, v19, v20);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue( +[UPCandidateProfileStoreSnapshot emptySnapshot]( &OBJC_CLASS___UPCandidateProfileStoreSnapshot,  "emptySnapshot"));
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pb_suggestedUserProfilesSnapshot"));

  return (PBSSuggestedUserProfileSnapshot *)v21;
}

- (void)updateSuppressedForSuggestedUserWithIdentifier:(id)a3 suppressed:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[UPCandidateProfilePredicate predicateForSystemAppCandidateUserIdentifier:]( &OBJC_CLASS___UPCandidateProfilePredicate,  "predicateForSystemAppCandidateUserIdentifier:",  v6));
  v9 = -[UPUpdateCandidateProfileRequest initWithPredicate:]( objc_alloc(&OBJC_CLASS___UPUpdateCandidateProfileRequest),  "initWithPredicate:",  v8);
  -[UPUpdateCandidateProfileRequest setSuppressed:](v9, "setSuppressed:", [v7 BOOLValue]);
  id v10 = sub_100083FF0();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v26 = "-[PBLoretoSuggestedUserProfileManager updateSuppressedForSuggestedUserWithIdentifier:suppressed:]";
    __int16 v27 = 2112;
    id v28 = v6;
    __int16 v29 = 1024;
    unsigned int v30 = [v7 BOOLValue];
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s: Updating candidate profile. identifier=%@, suppressed=%{BOOL}d",  buf,  0x1Cu);
  }

  profileStore = self->_profileStore;
  id v24 = 0LL;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[UPCandidateProfileStore updateCandidateProfileForRequest:error:]( profileStore,  "updateCandidateProfileForRequest:error:",  v9,  &v24));
  id v14 = v24;
  id v15 = sub_100083FF0();
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  uint64_t v17 = v16;
  if (v13)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[PBLoretoSuggestedUserProfileManager updateSuppressedForSuggestedUserWithIdentifier:suppressed:]";
      __int16 v27 = 2112;
      id v28 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%s: Successfully updated candidate profile. profile=%@",  buf,  0x16u);
    }
  }

  else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    sub_1002747B0((uint64_t)v14, v17, v18, v19, v20, v21, v22, v23);
  }
}

- (void)addObserver:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    id v7 = -[TVSObserverSet addObserver:](self->_observers, "addObserver:", v5);
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"observer"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100274814(a2);
    }
    _bs_set_crash_log_message([v8 UTF8String]);
    __break(0);
  }

- (void)removeObserver:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    -[TVSObserverSet removeObserver:](self->_observers, "removeObserver:", v5);
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"observer"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002748C0(a2);
    }
    _bs_set_crash_log_message([v7 UTF8String]);
    __break(0);
  }

- (void)_notifyObservers
{
  observers = self->_observers;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100056BD4;
  v3[3] = &unk_1003D2180;
  v3[4] = self;
  -[TVSObserverSet enumerateObserversUsingBlock:](observers, "enumerateObserversUsingBlock:", v3);
}

- (void)_migrateSuggestedUserProfilesWithController:(id)a3
{
  id v4 = a3;
  if ([v4 isArchiveAvailable])
  {
    id v39 = 0LL;
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 loadArchiveWithError:&v39]);
    id v6 = v39;
    id v7 = sub_100083FF0();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    v9 = v8;
    if (v5)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 suggestedUserProfilesByIdentifier]);
        id v11 = [v10 count];
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 suggestedUserProfilesByIdentifier]);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 allKeys]);
        *(_DWORD *)buf = 136315650;
        v41 = "-[PBLoretoSuggestedUserProfileManager _migrateSuggestedUserProfilesWithController:]";
        __int16 v42 = 2048;
        id v43 = v11;
        __int16 v44 = 2112;
        v45 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: Migrating %lu legacy suggested profiles. identifiers=%@",  buf,  0x20u);
      }

      id v14 = [(id)objc_opt_class(self) _updateProfileRequestsForLegacySuggestedUserProfilesArchive:v5];
      id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      id v16 = [v15 count];
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v5 suggestedUserProfilesByIdentifier]);
      id v18 = [v17 count];

      if (v16 != v18)
      {
        id v19 = sub_100083FF0();
        uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_100274A84(v20, v21, v22, v23, v24, v25, v26, v27);
        }
      }

      if ([v15 count])
      {
        id v28 = objc_alloc_init(&OBJC_CLASS___UPUpdateCandidateProfileStoreRequest);
        [v28 setOptions:0x8000];
        [v28 setUpdateProfileRequests:v15];
        profileStore = self->_profileStore;
        id v38 = 0LL;
        unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue( -[UPCandidateProfileStore updateForRequest:error:]( profileStore,  "updateForRequest:error:",  v28,  &v38));
        id v31 = v38;

        id v32 = sub_100083FF0();
        v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
        v34 = v33;
        if (v30)
        {
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            id v35 = [v15 count];
            v36 = (void *)objc_claimAutoreleasedReturnValue([v15 valueForKey:@"predicate"]);
            *(_DWORD *)buf = 136315650;
            v41 = "-[PBLoretoSuggestedUserProfileManager _migrateSuggestedUserProfilesWithController:]";
            __int16 v42 = 2048;
            id v43 = v35;
            __int16 v44 = 2112;
            v45 = v36;
            _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "%s: Successfully migrated %lu legacy suggested profile(s). predicates=%@",  buf,  0x20u);
          }
        }

        else if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
        {
          sub_1002749D8(v15, (uint64_t)v31, v34);
        }

        id v6 = v31;
      }

      -[PBLoretoSuggestedUserProfileManager _removeSuggestedUserProfilesArchiveWithController:]( self,  "_removeSuggestedUserProfilesArchiveWithController:",  v4);
    }

    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        sub_10027496C();
      }

      -[PBLoretoSuggestedUserProfileManager _removeSuggestedUserProfilesArchiveWithController:]( self,  "_removeSuggestedUserProfilesArchiveWithController:",  v4);
    }
  }

  else
  {
    id v37 = sub_100083FF0();
    id v6 = (id)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v41 = "-[PBLoretoSuggestedUserProfileManager _migrateSuggestedUserProfilesWithController:]";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v6,  OS_LOG_TYPE_DEFAULT,  "%s: No legacy suggested profile archive exists. Nothing to migrate.",  buf,  0xCu);
    }
  }
}

- (void)_removeSuggestedUserProfilesArchiveWithController:(id)a3
{
  id v8 = 0LL;
  unsigned int v3 = [a3 removeArchiveWithError:&v8];
  id v4 = v8;
  id v5 = sub_100083FF0();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v10 = "-[PBLoretoSuggestedUserProfileManager _removeSuggestedUserProfilesArchiveWithController:]";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: Successfully removed legacy suggested profiles archive.",  buf,  0xCu);
    }
  }

  else if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    sub_100274AF4();
  }
}

+ (id)_updateProfileRequestsForLegacySuggestedUserProfilesArchive:(id)a3
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([a3 suggestedUserProfilesByIdentifier]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allValues]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bs_compactMap:", &stru_1003D21C0));

  return v5;
}

- (void).cxx_destruct
{
}

@end