@interface ADUserProfileService
+ (id)sharedService;
- (ADUserProfileService)init;
- (BOOL)_postProfileUpdateNotificationsIfNeeded:(id)a3;
- (BOOL)userProfileExistsWithiCloudAltDSID:(id)a3;
- (NSDictionary)allUserProfileEntries;
- (NSMutableArray)profilesChangedHandlers;
- (UPProfileStore)profileStore;
- (id)_init;
- (id)dictionaryFromPBSUserProfile:(id)a3;
- (id)dictionaryFromUPProfile:(id)a3;
- (id)getLocalProfileNames;
- (id)getUserProfileAceCommand;
- (os_unfair_lock_s)lock;
- (void)_addProfileNamesToSharedStore:(id)a3;
- (void)_donateToVocabularyWithUserProfiles:(id)a3;
- (void)_fetchProfiles;
- (void)_loadProfileNamesFromCloudWithCompletion:(id)a3;
- (void)_setUserProfileAceCommand;
- (void)_start;
- (void)_startProfileStoreMonitoring;
- (void)_updateUserProfilesFromSnapshot:(id)a3;
- (void)_withLock:(id)a3;
- (void)getUserProfileDictionariesWithCompletion:(id)a3;
- (void)mergeHomeProfileNamesWithNamesFromCloud:(id)a3;
- (void)refreshUserProfilesWithCompletion:(id)a3;
- (void)registerUserProfilesChangedHandler:(id)a3;
- (void)resetAllProfiles:(BOOL)a3 withCompletion:(id)a4;
- (void)setAllUserProfileEntries:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setProfilesChangedHandlers:(id)a3;
- (void)syncProfileNamesToCloudWithCompletion:(id)a3;
- (void)syncUserProfileNamesIfNeeded;
- (void)userProfileManagerDidUpdate:(id)a3;
@end

@implementation ADUserProfileService

- (ADUserProfileService)init
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v4 handleFailureInMethod:a2 object:self file:@"ADUserProfileService.m" lineNumber:103 description:@"Use + sharedService"];

  return 0LL;
}

- (id)_init
{
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___ADUserProfileService;
  v2 = -[ADUserProfileService init](&v26, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_DEFAULT, 0);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.assistant.user-profile-service", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    namesToDelete = v2->_namesToDelete;
    v2->_namesToDelete = (NSMutableSet *)v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    homeUserProfileNames = v2->_homeUserProfileNames;
    v2->_homeUserProfileNames = (NSMutableSet *)v11;

    v2->_needsProfileNameSync = 1;
    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    profilesChangedHandlers = v2->_profilesChangedHandlers;
    v2->_profilesChangedHandlers = (NSMutableArray *)v13;

    v15 = objc_alloc_init(&OBJC_CLASS___UPProfileStore);
    profileStore = v2->_profileStore;
    v2->_profileStore = v15;

    id v19 = (id)AFSupportsMultiUser(v17, v18);
    if ((_DWORD)v19)
    {
      if (v2->isATVOnly)
      {
        v21 = (dispatch_queue_s *)v2->_queue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10021C8DC;
        block[3] = &unk_1004FD940;
        v25 = v2;
        dispatch_async(v21, block);
      }

      else
      {
        id v19 = -[ADUserProfileService refreshUserProfilesWithCompletion:]( v2,  "refreshUserProfilesWithCompletion:",  &stru_1004F6C98);
      }
    }

    v2->isATVOnly = AFIsATV(v19, v20);
  }

  v22 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "-[ADUserProfileService _init]";
    __int16 v29 = 2048;
    v30 = v2;
    _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "%s %p", buf, 0x16u);
  }

  return v2;
}

- (void)syncUserProfileNamesIfNeeded
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10021C600;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)syncProfileNamesToCloudWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_queue_attr_t v5 = (void (**)(void, void))v4;
  if (self->isATVOnly)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10021C4B0;
    v8[3] = &unk_1004FD990;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(queue, v8);
  }

  else
  {
    dispatch_queue_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:]( &OBJC_CLASS___AFError,  "errorWithCode:description:",  6002LL,  @"Ignoring profile name upload from invalid platform."));
    ((void (**)(void, void *))v5)[2](v5, v7);
  }
}

- (void)_addProfileNamesToSharedStore:(id)a3
{
  id v4 = a3;
  dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADCloudKitManager sharedManager](&OBJC_CLASS___ADCloudKitManager, "sharedManager"));
  v8 = @"profileNames";
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_homeUserProfileNames, "allObjects"));
  id v9 = v6;
  dispatch_queue_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
  [v5 addDictionaryToSharedStore:v7 completion:v4];
}

- (void)_loadProfileNamesFromCloudWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  dispatch_queue_attr_t v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v11 = "-[ADUserProfileService _loadProfileNamesFromCloudWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  if (self->_isFetchingProfileNames)
  {
    v6 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v11 = "-[ADUserProfileService _loadProfileNamesFromCloudWithCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Profile name fetch in progress.", buf, 0xCu);
    }

    v4[2](v4, 0LL);
  }

  else
  {
    self->_isFetchingProfileNames = 1;
    dispatch_queue_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[ADCloudKitManager sharedManager](&OBJC_CLASS___ADCloudKitManager, "sharedManager"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10021BFA8;
    v8[3] = &unk_1004F6CC0;
    v8[4] = self;
    id v9 = v4;
    [v7 fetchValueForKeyFromSharedStore:@"profileNames" completion:v8];
  }
}

- (void)_donateToVocabularyWithUserProfiles:(id)a3
{
  id v4 = a3;
  BOOL isATVOnly = self->isATVOnly;
  v6 = (void *)AFSiriLogContextDaemon;
  BOOL v7 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
  if (isATVOnly)
  {
    if (v7)
    {
      v8 = v6;
      *(_DWORD *)buf = 136315394;
      uint64_t v13 = "-[ADUserProfileService _donateToVocabularyWithUserProfiles:]";
      __int16 v14 = 2048;
      id v15 = [v4 count];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Donating %ld TV profiles", buf, 0x16u);
    }

    id v11 = 0LL;
    +[ADVocabDonationBridge bulkDonate:withAppId:itemClass:error:]( &OBJC_CLASS___ADVocabDonationBridge,  "bulkDonate:withAppId:itemClass:error:",  v4,  KVOriginAppIdUserAccount,  objc_opt_class(&OBJC_CLASS___PBSUserProfile),  &v11);
    id v9 = v11;
    v10 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v13 = "-[ADUserProfileService _donateToVocabularyWithUserProfiles:]";
      __int16 v14 = 2112;
      id v15 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s Donation completed with error %@",  buf,  0x16u);
    }
  }

  else if (v7)
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v13 = "-[ADUserProfileService _donateToVocabularyWithUserProfiles:]";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v6,  OS_LOG_TYPE_INFO,  "%s PBSUserProfile donation allowed only from ATV",  buf,  0xCu);
  }
}

- (void)userProfileManagerDidUpdate:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10021BE0C;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (BOOL)_postProfileUpdateNotificationsIfNeeded:(id)a3
{
  id v4 = a3;
  dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v5));

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allKeys](self->_userProfiles, "allKeys"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v7));

  id v9 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 allObjects]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
    *(_DWORD *)buf = 136315650;
    v60 = "-[ADUserProfileService _postProfileUpdateNotificationsIfNeeded:]";
    __int16 v61 = 2112;
    id v62 = v11;
    __int16 v63 = 2112;
    id v64 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Profile update %@ -> %@", buf, 0x20u);
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](&OBJC_CLASS___NSMutableSet, "setWithSet:", v6));
  [v13 minusSet:v8];
  v45 = v8;
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](&OBJC_CLASS___NSMutableSet, "setWithSet:", v8));
  v46 = (void *)v6;
  [v14 minusSet:v6];
  id v15 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v42 = v15;
    id v43 = [v13 count];
    id v44 = [v14 count];
    *(_DWORD *)buf = 136315650;
    v60 = "-[ADUserProfileService _postProfileUpdateNotificationsIfNeeded:]";
    __int16 v61 = 2048;
    id v62 = v43;
    __int16 v63 = 2048;
    id v64 = v44;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEBUG,  "%s Profile update %ld added, %ld removed",  buf,  0x20u);
  }

  id v16 = [v13 count];
  BOOL v17 = v16 != 0LL;
  v47 = v14;
  v48 = v13;
  if (v16)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    id v19 = v13;
    id v20 = [v19 countByEnumeratingWithState:&v53 objects:v58 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v54;
      do
      {
        for (i = 0LL; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v54 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:*(void *)(*((void *)&v53 + 1) + 8 * (void)i)]);
          v25 = (void *)objc_claimAutoreleasedReturnValue([v24 iCloudAltDSID]);

          if (v25)
          {
            objc_super v26 = (void *)objc_claimAutoreleasedReturnValue( -[ADUserProfileService dictionaryFromPBSUserProfile:]( self,  "dictionaryFromPBSUserProfile:",  v24));
            [v18 addObject:v26];
          }
        }

        id v21 = [v19 countByEnumeratingWithState:&v53 objects:v58 count:16];
      }

      while (v21);
    }

    v27 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v60 = "-[ADUserProfileService _postProfileUpdateNotificationsIfNeeded:]";
      __int16 v61 = 2112;
      id v62 = v18;
      _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "%s Profile added payload %@", buf, 0x16u);
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v28 postNotificationName:@"ADUserProfilesAddedNotification" object:v18];

    __int16 v14 = v47;
    uint64_t v13 = v48;
  }

  if ([v14 count])
  {
    __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    id v30 = v14;
    id v31 = [v30 countByEnumeratingWithState:&v49 objects:v57 count:16];
    if (v31)
    {
      id v32 = v31;
      uint64_t v33 = *(void *)v50;
      do
      {
        v34 = 0LL;
        do
        {
          if (*(void *)v50 != v33) {
            objc_enumerationMutation(v30);
          }
          v35 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKey:]( self->_userProfiles,  "objectForKey:",  *(void *)(*((void *)&v49 + 1) + 8LL * (void)v34)));
          v36 = (void *)objc_claimAutoreleasedReturnValue( -[ADUserProfileService dictionaryFromPBSUserProfile:]( self,  "dictionaryFromPBSUserProfile:",  v35));

          [v29 addObject:v36];
          v37 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKey:@"ADUserProfileKeyICloudIdentifier"]);

          if (!v37)
          {
            v38 = (os_log_s *)AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315394;
              v60 = "-[ADUserProfileService _postProfileUpdateNotificationsIfNeeded:]";
              __int16 v61 = 2112;
              id v62 = v36;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEBUG,  "%s Untracking %@ since it has no iCloud identifier",  buf,  0x16u);
            }

            [v29 addObject:v36];
          }

          v34 = (char *)v34 + 1;
        }

        while (v32 != v34);
        id v32 = [v30 countByEnumeratingWithState:&v49 objects:v57 count:16];
      }

      while (v32);
    }

    v39 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v60 = "-[ADUserProfileService _postProfileUpdateNotificationsIfNeeded:]";
      __int16 v61 = 2112;
      id v62 = v29;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEBUG,  "%s Profile removed payload %@",  buf,  0x16u);
    }

    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v40 postNotificationName:@"ADUserProfilesRemovedNotification" object:v29];

    BOOL v17 = 1;
    __int16 v14 = v47;
    uint64_t v13 = v48;
  }

  return v17;
}

- (void)_updateUserProfilesFromSnapshot:(id)a3
{
  id v4 = a3;
  dispatch_queue_attr_t v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[ADUserProfileService _updateUserProfilesFromSnapshot:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userProfiles]);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v27 = 0x3032000000LL;
  v28 = sub_10021B71C;
  __int16 v29 = sub_10021B72C;
  id v30 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  uint64_t v18 = sub_10021BD34;
  id v19 = &unk_1004F6D08;
  p___int128 buf = &buf;
  id v8 = v7;
  id v20 = v8;
  [v6 enumerateKeysAndObjectsUsingBlock:&v16];
  unsigned int v9 = -[ADUserProfileService _postProfileUpdateNotificationsIfNeeded:]( self,  "_postProfileUpdateNotificationsIfNeeded:",  *(void *)(*((void *)&buf + 1) + 40LL),  v16,  v17,  v18,  v19);
  v10 = (NSDictionary *)[*(id *)(*((void *)&buf + 1) + 40) copy];
  userProfiles = self->_userProfiles;
  self->_userProfiles = v10;

  v12 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)uint64_t v22 = 136315395;
    v23 = "-[ADUserProfileService _updateUserProfilesFromSnapshot:]";
    __int16 v24 = 2113;
    id v25 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%s %{private}@", v22, 0x16u);
  }

  -[NSMutableSet unionSet:](self->_namesToDelete, "unionSet:", self->_localUserProfileNames);
  -[NSMutableSet minusSet:](self->_namesToDelete, "minusSet:", v8);
  uint64_t v13 = (NSSet *)[v8 copy];
  localUserProfileNames = self->_localUserProfileNames;
  self->_localUserProfileNames = v13;

  -[NSMutableSet minusSet:](self->_homeUserProfileNames, "minusSet:", self->_namesToDelete);
  -[NSMutableSet unionSet:](self->_homeUserProfileNames, "unionSet:", self->_localUserProfileNames);
  -[ADUserProfileService _setUserProfileAceCommand](self, "_setUserProfileAceCommand");
  if (v9)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 allValues]);
    -[ADUserProfileService _donateToVocabularyWithUserProfiles:](self, "_donateToVocabularyWithUserProfiles:", v15);
  }

  _Block_object_dispose(&buf, 8);
}

- (void)_setUserProfileAceCommand
{
  dispatch_queue_attr_t v3 = objc_alloc_init(&OBJC_CLASS___SAUserProfile);
  userProfileCommand = self->_userProfileCommand;
  self->_userProfileCommand = v3;

  dispatch_queue_attr_t v5 = self->_userProfileCommand;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_homeUserProfileNames, "allObjects"));
  -[SAUserProfile setNames:](v5, "setNames:", v6);
}

- (id)dictionaryFromPBSUserProfile:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
    [v4 setValue:v6 forKey:@"ADUserProfileKeyPBSIdentifier"];
  }

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v3 iCloudAltDSID]);

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 iCloudAltDSID]);
    [v4 setValue:v8 forKey:@"ADUserProfileKeyICloudIdentifier"];
  }

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v3 homeUserIdentifier]);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v3 homeUserIdentifier]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 UUIDString]);
    [v4 setValue:v11 forKey:@"ADUserProfileKeyHomeUserIdentifier"];
  }

  id v12 = [v4 copy];

  return v12;
}

- (id)dictionaryFromUPProfile:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 iCloudAltDSID]);

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 iCloudAltDSID]);
    [v4 setValue:v6 forKey:@"ADUserProfileKeyICloudIdentifier"];
  }

  id v7 = [v4 copy];

  return v7;
}

- (BOOL)userProfileExistsWithiCloudAltDSID:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  char v17 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10021BBD0;
  block[3] = &unk_1004FBE80;
  void block[4] = self;
  id v6 = v4;
  id v12 = v6;
  uint64_t v13 = &v14;
  dispatch_sync(queue, block);
  id v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    if (*((_BYTE *)v15 + 24)) {
      id v8 = @"YES";
    }
    else {
      id v8 = @"NO";
    }
    *(_DWORD *)__int128 buf = 136315651;
    id v19 = "-[ADUserProfileService userProfileExistsWithiCloudAltDSID:]";
    __int16 v20 = 2113;
    id v21 = v6;
    __int16 v22 = 2112;
    v23 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s Profile exists with %{private}@? : %@",  buf,  0x20u);
  }

  char v9 = *((_BYTE *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (void)getUserProfileDictionariesWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_queue_attr_t v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v11 = "-[ADUserProfileService getUserProfileDictionariesWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10021BA44;
  v8[3] = &unk_1004FD990;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

- (id)getUserProfileAceCommand
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_10021B71C;
  v10 = sub_10021B72C;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10021B9FC;
  v5[3] = &unk_1004FCDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)getLocalProfileNames
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_10021B71C;
  v10 = sub_10021B72C;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10021B9C4;
  v5[3] = &unk_1004FCDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)refreshUserProfilesWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_queue_attr_t v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v11 = "-[ADUserProfileService refreshUserProfilesWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10021B9B8;
  v8[3] = &unk_1004FD990;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

- (void)mergeHomeProfileNamesWithNamesFromCloud:(id)a3
{
  id v4 = a3;
  uint64_t v6 = v4;
  if (v4 && AFSupportsMultiUser(v4, v5))
  {
    id v7 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315395;
      id v12 = "-[ADUserProfileService mergeHomeProfileNamesWithNamesFromCloud:]";
      __int16 v13 = 2113;
      uint64_t v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s %{private}@", buf, 0x16u);
    }

    queue = (dispatch_queue_s *)self->_queue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10021B92C;
    v9[3] = &unk_1004FD968;
    v9[4] = self;
    id v10 = v6;
    dispatch_async(queue, v9);
  }
}

- (void)resetAllProfiles:(BOOL)a3 withCompletion:(id)a4
{
  id v6 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10021B8B4;
  block[3] = &unk_1004FCB38;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)registerUserProfilesChangedHandler:(id)a3
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10021B868;
  v9[3] = &unk_1004FD990;
  id v10 = self;
  id v3 = a3;
  id v11 = v3;
  -[ADUserProfileService _withLock:](v10, "_withLock:", v9);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(9LL, 0LL);
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10021B8A8;
  block[3] = &unk_1004FC838;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, block);
}

- (NSDictionary)allUserProfileEntries
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_10021B71C;
  id v10 = sub_10021B72C;
  id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10021B830;
  v5[3] = &unk_1004FCDB0;
  v5[4] = self;
  v5[5] = &v6;
  -[ADUserProfileService _withLock:](self, "_withLock:", v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

- (void)_start
{
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[ADUserProfileService _start]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s ADUserProfileService starting UserProfile monitoring",  (uint8_t *)&v4,  0xCu);
  }

  -[ADUserProfileService _startProfileStoreMonitoring](self, "_startProfileStoreMonitoring");
}

- (void)_startProfileStoreMonitoring
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADUserProfileService profileStore](self, "profileStore"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10021B770;
  v5[3] = &unk_1004F6D30;
  objc_copyWeak(&v6, &location);
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 observeUpdatesUsingHandler:v5]);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_fetchProfiles
{
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__int128 buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[ADUserProfileService _fetchProfiles]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s Fetching profiles", buf, 0xCu);
  }

  int v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADUserProfileService profileStore](self, "profileStore"));
  id v34 = 0LL;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allProfilesWithError:&v34]);
  id v6 = v34;

  id v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ADUserProfileService _fetchProfiles]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s Got profiles %@", buf, 0x16u);
    if (v6)
    {
LABEL_5:
      uint64_t v8 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[ADUserProfileService _fetchProfiles]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v6;
        _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s Unable to fetch profiles from ProfileStore. Error = %@",  buf,  0x16u);
      }

      goto LABEL_27;
    }
  }

  else if (v6)
  {
    goto LABEL_5;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v10 = v5;
  id v11 = [v10 countByEnumeratingWithState:&v30 objects:v44 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v31;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v31 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 iCloudAltDSID]);
        if (v15) {
          [v9 setObject:v14 forKey:v15];
        }
      }

      id v11 = [v10 countByEnumeratingWithState:&v30 objects:v44 count:16];
    }

    while (v11);
  }

  *(void *)__int128 buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  v41 = sub_10021B71C;
  v42 = sub_10021B72C;
  id v43 = 0LL;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_10021B734;
  v27[3] = &unk_1004FBE80;
  v27[4] = self;
  id v16 = v9;
  id v28 = v16;
  __int16 v29 = buf;
  -[ADUserProfileService _withLock:](self, "_withLock:", v27);
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v17 = *(id *)(*(void *)&buf[8] + 40LL);
  id v18 = [v17 countByEnumeratingWithState:&v23 objects:v39 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v24;
    do
    {
      for (j = 0LL; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v17);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v23 + 1) + 8LL * (void)j) + 16LL))(*(void *)(*((void *)&v23 + 1) + 8LL * (void)j));
      }

      id v18 = [v17 countByEnumeratingWithState:&v23 objects:v39 count:16];
    }

    while (v18);
  }

  id v21 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    allUserProfileEntries = self->_allUserProfileEntries;
    *(_DWORD *)v35 = 136315394;
    v36 = "-[ADUserProfileService _fetchProfiles]";
    __int16 v37 = 2112;
    v38 = allUserProfileEntries;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "%s UserProfile has new enrolled users list = %@",  v35,  0x16u);
  }

  _Block_object_dispose(buf, 8);
LABEL_27:
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  int v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (UPProfileStore)profileStore
{
  return self->_profileStore;
}

- (NSMutableArray)profilesChangedHandlers
{
  return self->_profilesChangedHandlers;
}

- (void)setProfilesChangedHandlers:(id)a3
{
}

- (void)setAllUserProfileEntries:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
}

+ (id)sharedService
{
  if (qword_1005781C0 != -1) {
    dispatch_once(&qword_1005781C0, &stru_1004F6C78);
  }
  return (id)qword_1005781B8;
}

@end