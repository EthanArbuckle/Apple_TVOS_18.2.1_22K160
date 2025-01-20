@interface ADBackgroundContextCache
+ (id)_backgroundContextWithObjects:(id)a3;
- (NSDictionary)allMusicPersonalizationTokenStatuses;
- (NSDictionary)allMusicPersonalizationTokens;
- (NSString)musicPersonalizationToken;
- (NSString)preferredMediaUserHomeUserID;
- (NSString)preferredMediaUserSharedUserID;
- (SAErrorIndicatorStatus)errorIndicatorStatus;
- (SAHACurrentHome)currentHome;
- (SAHomeCommunicationAnnouncement)homeAnnouncement;
- (SALocalSearchGetNavigationStatusCompleted)localSearchGetNavigationStatusCompleted;
- (SAMPQueueState)queueState;
- (SANavStatus)navStatus;
- (SAPhoneCallState)phoneCallState;
- (SARemotePlaybackDeviceList)playbackDeviceList;
- (SAUserTokenStatus)musicPersonalizationTokenStatus;
- (id)backgroundContextWithCachedObjects;
- (void)_setDefaultToken:(id)a3 inDynamiteClientState:(id)a4;
- (void)_updateDefaultTokenInDynamiteClientState:(id)a3;
- (void)setAllMusicPersonalizationTokenStatuses:(id)a3;
- (void)setAllMusicPersonalizationTokens:(id)a3;
- (void)setCurrentHome:(id)a3;
- (void)setErrorIndicatorStatus:(id)a3;
- (void)setHomeAnnouncement:(id)a3;
- (void)setLocalSearchGetNavigationStatusCompleted:(id)a3;
- (void)setMusicPersonalizationToken:(id)a3;
- (void)setMusicPersonalizationTokenStatus:(id)a3;
- (void)setNavStatus:(id)a3;
- (void)setPhoneCallState:(id)a3;
- (void)setPlaybackDeviceList:(id)a3;
- (void)setPreferredMediaUserHomeUserID:(id)a3;
- (void)setPreferredMediaUserSharedUserID:(id)a3;
- (void)setQueueState:(id)a3;
@end

@implementation ADBackgroundContextCache

- (void)_setDefaultToken:(id)a3 inDynamiteClientState:(id)a4
{
  id v8 = a4;
  id v6 = a3;
  [v8 setUserToken:v6];
  id v7 = objc_alloc_init(&OBJC_CLASS___SAUserState);
  [v7 setUserToken:v6];

  if (self->_musicPersonalizationTokenStatus)
  {
    objc_msgSend(v8, "setUserTokenStatus:");
    [v7 setUserTokenStatus:self->_musicPersonalizationTokenStatus];
  }

  [v8 setDefaultUserState:v7];
}

- (void)_updateDefaultTokenInDynamiteClientState:(id)a3
{
  id v4 = a3;
  uint64_t v6 = AFIsHorseman(v4, v5);
  if ((_DWORD)v6 && (preferredMediaUserSharedUserID = self->_preferredMediaUserSharedUserID) != 0LL)
  {
    v9 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v28 = 136315395;
      *(void *)&v28[4] = "-[ADBackgroundContextCache _updateDefaultTokenInDynamiteClientState:]";
      *(_WORD *)&v28[12] = 2113;
      *(void *)&v28[14] = preferredMediaUserSharedUserID;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "%s Have a preferredMediaUserSharedUserID (%{private}@)",  v28,  0x16u);
      preferredMediaUserSharedUserID = self->_preferredMediaUserSharedUserID;
    }

    uint64_t v10 = objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKey:]( self->_allMusicPersonalizationTokens,  "objectForKey:",  preferredMediaUserSharedUserID));
    if (v10)
    {
      v11 = (void *)v10;
      -[ADBackgroundContextCache _setDefaultToken:inDynamiteClientState:]( self,  "_setDefaultToken:inDynamiteClientState:",  v10,  v4);
      v12 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v28 = 136315138;
        *(void *)&v28[4] = "-[ADBackgroundContextCache _updateDefaultTokenInDynamiteClientState:]";
        _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "%s Successfully set token based on preferredMediaUserSharedUserID",  v28,  0xCu);
      }

- (id)backgroundContextWithCachedObjects
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v4 = v3;
  if (self->_navStatus) {
    -[NSMutableArray addObject:](v3, "addObject:");
  }
  if (self->_localSearchGetNavigationStatusCompleted) {
    -[NSMutableArray addObject:](v4, "addObject:");
  }
  if (self->_queueState) {
    -[NSMutableArray addObject:](v4, "addObject:");
  }
  if (self->_errorIndicatorStatus) {
    -[NSMutableArray addObject:](v4, "addObject:");
  }
  if (self->_currentHome) {
    -[NSMutableArray addObject:](v4, "addObject:");
  }
  if (self->_phoneCallState) {
    -[NSMutableArray addObject:](v4, "addObject:");
  }
  if (self->_playbackDeviceList) {
    -[NSMutableArray addObject:](v4, "addObject:");
  }
  if (self->_homeAnnouncement) {
    -[NSMutableArray addObject:](v4, "addObject:");
  }
  if (self->_musicPersonalizationToken
    || self->_musicPersonalizationTokenStatus
    || -[NSDictionary count](self->_allMusicPersonalizationTokens, "count")
    || -[NSDictionary count](self->_allMusicPersonalizationTokenStatuses, "count"))
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___SADynamiteClientState);
    -[ADBackgroundContextCache _updateDefaultTokenInDynamiteClientState:]( self,  "_updateDefaultTokenInDynamiteClientState:",  v5);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    if (-[NSDictionary count](self->_allMusicPersonalizationTokens, "count"))
    {
      allMusicPersonalizationTokens = self->_allMusicPersonalizationTokens;
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_10021891C;
      v27[3] = &unk_1004F6C08;
      id v28 = v7;
      id v29 = v6;
      -[NSDictionary enumerateKeysAndObjectsUsingBlock:]( allMusicPersonalizationTokens,  "enumerateKeysAndObjectsUsingBlock:",  v27);
    }

    if (-[NSDictionary count](self->_allMusicPersonalizationTokenStatuses, "count"))
    {
      allMusicPersonalizationTokenStatuses = self->_allMusicPersonalizationTokenStatuses;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_1002189AC;
      v24[3] = &unk_1004F6C30;
      id v25 = v6;
      id v26 = v7;
      -[NSDictionary enumerateKeysAndObjectsUsingBlock:]( allMusicPersonalizationTokenStatuses,  "enumerateKeysAndObjectsUsingBlock:",  v24);
    }

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 getSyncableSharedUserIdsForSharedUserIds:v7]);

    if ([v6 count])
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService"));
      id v13 = [v12 countVoiceProfiles];

      if (v13)
      {
        v14 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v6 count]);
        v18 = _NSConcreteStackBlock;
        uint64_t v19 = 3221225472LL;
        v20 = sub_100218A64;
        v21 = &unk_1004F6C58;
        id v22 = v11;
        v23 = v14;
        v15 = v14;
        [v6 enumerateKeysAndObjectsUsingBlock:&v18];
        objc_msgSend(v5, "setInContextUsersStates:", v15, v18, v19, v20, v21);
      }
    }

    -[NSMutableArray addObject:](v4, "addObject:", v5);
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[ADBackgroundContextCache _backgroundContextWithObjects:]( &OBJC_CLASS___ADBackgroundContextCache,  "_backgroundContextWithObjects:",  v4));

  return v16;
}

- (SANavStatus)navStatus
{
  return self->_navStatus;
}

- (void)setNavStatus:(id)a3
{
}

- (SALocalSearchGetNavigationStatusCompleted)localSearchGetNavigationStatusCompleted
{
  return self->_localSearchGetNavigationStatusCompleted;
}

- (void)setLocalSearchGetNavigationStatusCompleted:(id)a3
{
}

- (SAMPQueueState)queueState
{
  return self->_queueState;
}

- (void)setQueueState:(id)a3
{
}

- (SAErrorIndicatorStatus)errorIndicatorStatus
{
  return self->_errorIndicatorStatus;
}

- (void)setErrorIndicatorStatus:(id)a3
{
}

- (SAHACurrentHome)currentHome
{
  return self->_currentHome;
}

- (void)setCurrentHome:(id)a3
{
}

- (SAPhoneCallState)phoneCallState
{
  return self->_phoneCallState;
}

- (void)setPhoneCallState:(id)a3
{
}

- (NSString)musicPersonalizationToken
{
  return self->_musicPersonalizationToken;
}

- (void)setMusicPersonalizationToken:(id)a3
{
}

- (SAUserTokenStatus)musicPersonalizationTokenStatus
{
  return self->_musicPersonalizationTokenStatus;
}

- (void)setMusicPersonalizationTokenStatus:(id)a3
{
}

- (NSDictionary)allMusicPersonalizationTokens
{
  return self->_allMusicPersonalizationTokens;
}

- (void)setAllMusicPersonalizationTokens:(id)a3
{
}

- (NSDictionary)allMusicPersonalizationTokenStatuses
{
  return self->_allMusicPersonalizationTokenStatuses;
}

- (void)setAllMusicPersonalizationTokenStatuses:(id)a3
{
}

- (NSString)preferredMediaUserSharedUserID
{
  return self->_preferredMediaUserSharedUserID;
}

- (void)setPreferredMediaUserSharedUserID:(id)a3
{
}

- (NSString)preferredMediaUserHomeUserID
{
  return self->_preferredMediaUserHomeUserID;
}

- (void)setPreferredMediaUserHomeUserID:(id)a3
{
}

- (SARemotePlaybackDeviceList)playbackDeviceList
{
  return self->_playbackDeviceList;
}

- (void)setPlaybackDeviceList:(id)a3
{
}

- (SAHomeCommunicationAnnouncement)homeAnnouncement
{
  return self->_homeAnnouncement;
}

- (void)setHomeAnnouncement:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)_backgroundContextWithObjects:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___SASetBackgroundContext);
  if ([v3 count]) {
    [v4 setObjects:v3];
  }

  return v4;
}

@end