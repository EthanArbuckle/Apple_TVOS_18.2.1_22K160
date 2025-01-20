@interface MTLibrary
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)sharedInstance;
+ (void)initialize;
+ (void)setConfigurationForTests:(id)a3;
- (BOOL)iTunesMatchEnabled;
- (BOOL)setEpisodesOrder:(id)a3 forStation:(id)a4;
- (BOOL)setPlayState:(int64_t)a3 fromContextActions:(BOOL)a4 manually:(BOOL)a5 forUserActionOnEpisode:(id)a6 saveChanges:(BOOL)a7;
- (BOOL)setPlayState:(int64_t)a3 manually:(BOOL)a4 forUserActionOnEpisode:(id)a5 saveChanges:(BOOL)a6;
- (BOOL)setPlayState:(int64_t)a3 manually:(BOOL)a4 forUserActionOnEpisodeUuid:(id)a5;
- (BOOL)setPlayed:(BOOL)a3 manually:(BOOL)a4 forUserActionOnEpisode:(id)a5 saveChanges:(BOOL)a6;
- (BOOL)setPlayed:(BOOL)a3 manually:(BOOL)a4 forUserActionOnEpisodeUuid:(id)a5;
- (BOOL)setPodcastsOrder:(id)a3;
- (BOOL)setStationShowGroupOrder:(id)a3 forStation:(id)a4;
- (BOOL)setStationsOrder:(id)a3;
- (MTLibrary)init;
- (MTLibrary)initWithConfiguration:(id)a3;
- (MTLibraryConfiguration)config;
- (MTSecureDownloadRenewalManager)secureDownloadRenewalManager;
- (PFFairPlayInvalidationManager)fairPlayInvalidationManager;
- (id)_predicateForOpportunisticHiddenPodcastDeletion;
- (id)_updateUpNextDeleting:(id)a3 inContext:(id)a4 forced:(BOOL)a5 podcastUuids:(id)a6;
- (id)copy;
- (void)_cleanUpOldHiddenAndRecentlyUnfollowedPodcasts;
- (void)_cleanUpOldHiddenPodcasts;
- (void)_cleanupHiddenPodcasts;
- (void)_deleteEpisodeUuids:(id)a3 forced:(BOOL)a4;
- (void)_deleteEpisodes:(id)a3 forced:(BOOL)a4 ctx:(id)a5;
- (void)_deleteFromRecentlyUnfollowedForPredicate:(id)a3;
- (void)_deletePodcastForPredicate:(id)a3;
- (void)_immediatelyDeleteAllHiddenPodcasts;
- (void)_markAsHiddenPodcast:(id)a3 inContext:(id)a4;
- (void)_markAsHiddenPodcastsWithUuids:(id)a3 setSubscriptionsSyncDirty:(BOOL)a4 ctx:(id)a5;
- (void)_markPlaylistsForUpdateForPodcastUuids:(id)a3;
- (void)_removeDownloadAssetsForEpisodes:(id)a3 shouldKeep:(id)a4 forced:(BOOL)a5;
- (void)_unsafeDeletePodcast:(id)a3 ctx:(id)a4;
- (void)_userDefaultsDidChange:(id)a3;
- (void)cleanUpNeutralInterests;
- (void)cleanUpOldHiddenPodcasts;
- (void)deleteAllInterestsBlockingCaller;
- (void)deleteAllTopLevelStationsExcludingFolders;
- (void)deleteEpisodeUuids:(id)a3;
- (void)deleteEpisodes:(id)a3;
- (void)deleteOrphanedEpisodes;
- (void)deletePlaylist:(id)a3;
- (void)deletePodcastWithUuid:(id)a3;
- (void)deleteStationWithUuid:(id)a3;
- (void)immediatelyDeleteAllHiddenPodcasts;
- (void)setConfig:(id)a3;
- (void)setFairPlayInvalidationManager:(id)a3;
- (void)setITunesMatchEnabled:(BOOL)a3;
- (void)setSecureDownloadRenewalManager:(id)a3;
- (void)synchronouslyMarkAsHiddenAllPodcastsWithoutResettingSyncVersions;
- (void)updateiTunesPlaylistForiTunesMatchState;
@end

@implementation MTLibrary

+ (void)initialize
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___MTLibrary;
  objc_msgSendSuper2(&v4, "initialize");
  if ((id)objc_opt_class(&OBJC_CLASS___MTLibrary, v3) == a1)
  {
    +[MTPreferences registerDefaults](&OBJC_CLASS___MTPreferences, "registerDefaults");
    +[MTPreferences copySettingsToSharedContainer](&OBJC_CLASS___MTPreferences, "copySettingsToSharedContainer");
  }

+ (void)setConfigurationForTests:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue([a1 sharedInstance]);
  [v5 setConfig:v4];
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000CD9C;
  block[3] = &unk_100240300;
  block[4] = a1;
  if (qword_1002B68D8 != -1) {
    dispatch_once(&qword_1002B68D8, block);
  }
  return (id)qword_1002B68D0;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedInstance", a3));
}

- (MTLibrary)init
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[MTLibraryConfiguration defaultConfiguration]( &OBJC_CLASS___MTLibraryConfiguration,  "defaultConfiguration"));
  id v4 = -[MTLibrary initWithConfiguration:](self, "initWithConfiguration:", v3);

  return v4;
}

- (MTLibrary)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MTLibrary;
  id v5 = -[MTLibrary init](&v14, "init");
  if (v5)
  {
    v6 = objc_opt_new(&OBJC_CLASS___PFFairPlayInvalidationManager);
    -[MTLibrary setFairPlayInvalidationManager:](v5, "setFairPlayInvalidationManager:", v6);

    v7 = -[MTSecureDownloadRenewalManager initWithDelegate:]( objc_alloc(&OBJC_CLASS___MTSecureDownloadRenewalManager),  "initWithDelegate:",  v5);
    -[MTLibrary setSecureDownloadRenewalManager:](v5, "setSecureDownloadRenewalManager:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue( +[MTMediaContentSourceiOSMusicLibrary sharedInstance]( &OBJC_CLASS___MTMediaContentSourceiOSMusicLibrary,  "sharedInstance"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10000CFB0;
    v12[3] = &unk_100240328;
    v9 = v5;
    v13 = v9;
    [v8 determineiTunesMatchEnabledWithCompletion:v12];

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v10 addObserver:v9 selector:"_userDefaultsDidChange:" name:NSUserDefaultsDidChangeNotification object:0];

    -[MTLibrary setConfig:](v9, "setConfig:", v4);
  }

  return v5;
}

- (id)copy
{
  return (id)objc_claimAutoreleasedReturnValue(+[MTLibrary sharedInstance](&OBJC_CLASS___MTLibrary, "sharedInstance"));
}

- (BOOL)iTunesMatchEnabled
{
  return self->_iTunesMatchEnabled;
}

- (void)updateiTunesPlaylistForiTunesMatchState
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 privateQueueContext]);

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000D0D4;
  v6[3] = &unk_100240350;
  id v7 = v4;
  unsigned __int8 v8 = -[MTLibrary iTunesMatchEnabled](self, "iTunesMatchEnabled");
  id v5 = v4;
  [v5 performBlockAndWait:v6];
}

- (void)_userDefaultsDidChange:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a3 object]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "_applePodcastsFoundationSharedUserDefaults"));

  if (v3 != v4) {
    +[MTPreferences copySettingsToSharedContainer](&OBJC_CLASS___MTPreferences, "copySettingsToSharedContainer");
  }
}

- (void)_removeDownloadAssetsForEpisodes:(id)a3 shouldKeep:(id)a4 forced:(BOOL)a5
{
  id v7 = a3;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_10000D580;
  v37[3] = &unk_100240378;
  id v31 = a4;
  id v38 = v31;
  BOOL v39 = a5;
  unsigned __int8 v8 = objc_retainBlock(v37);
  v9 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v34;
    do
    {
      objc_super v14 = 0LL;
      do
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)v14);
        uint64_t v16 = _MTLogCategoryDownload(v11);
        v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          id v18 = objc_msgSend(v15, "storeTrackId", v31);
          *(_DWORD *)buf = 134217984;
          id v41 = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Deleting episode %lld", buf, 0xCu);
        }

        uint64_t v19 = ((uint64_t (*)(void *, void *))v8[2])(v8, v15);
        if ((_DWORD)v19)
        {
          uint64_t v20 = _MTLogCategoryDownload(v19);
          v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            id v22 = [v15 storeTrackId];
            *(_DWORD *)buf = 134217984;
            id v41 = v22;
            _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Skip deleting episode %lld because we should keep",  buf,  0xCu);
          }

          goto LABEL_16;
        }

        if ([v15 persistentID])
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v15 persistentID]));
          -[NSMutableArray addObject:](v9, "addObject:", v23);
        }

        objc_msgSend(v15, "setAssetURL:", 0, v31);
        v24 = (void *)objc_claimAutoreleasedReturnValue( +[PFFairPlayRolloutController sharedInstance]( &OBJC_CLASS___PFFairPlayRolloutController,  "sharedInstance"));
        unsigned __int8 v25 = [v24 isEnabled];

        if ((v25 & 1) == 0)
        {
          id v11 = +[MTStoreIdentifier isNotEmpty:]( MTStoreIdentifier,  "isNotEmpty:",  [v15 storeTrackId]);
          if ((_DWORD)v11)
          {
            v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[MTLibrary secureDownloadRenewalManager](self, "secureDownloadRenewalManager"));
            -[os_log_s requestSecureDeletionOf:completionHandler:]( v21,  "requestSecureDeletionOf:completionHandler:",  [v15 storeTrackId],  0);
LABEL_16:
          }
        }

        objc_super v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v11 = [v10 countByEnumeratingWithState:&v33 objects:v42 count:16];
      id v12 = v11;
    }

    while (v11);
  }

  id v26 = -[NSMutableArray count](v9, "count");
  uint64_t v27 = _MTLogCategoryDownload(v26);
  v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
  if (v26)
  {
    if (v29)
    {
      id v30 = -[NSMutableArray count](v9, "count");
      *(_DWORD *)buf = 134217984;
      id v41 = v30;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Delete %ld assets from Media Library",  buf,  0xCu);
    }

    +[MTMediaLibraryUtil deleteMediaItems:completion:]( &OBJC_CLASS___MTMediaLibraryUtil,  "deleteMediaItems:completion:",  v9,  0LL);
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    -[os_log_s postNotificationName:object:]( v28,  "postNotificationName:object:",  PFMediaDownloadWasDeletedNotification,  0LL);
  }

  else if (v29)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "No downloaded assets in Media Library. Nothing to delete.",  buf,  2u);
  }
}

- (PFFairPlayInvalidationManager)fairPlayInvalidationManager
{
  return self->_fairPlayInvalidationManager;
}

- (void)setFairPlayInvalidationManager:(id)a3
{
}

- (MTSecureDownloadRenewalManager)secureDownloadRenewalManager
{
  return self->_secureDownloadRenewalManager;
}

- (void)setSecureDownloadRenewalManager:(id)a3
{
}

- (void)setITunesMatchEnabled:(BOOL)a3
{
  self->_iTunesMatchEnabled = a3;
}

- (MTLibraryConfiguration)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_markPlaylistsForUpdateForPodcastUuids:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 mainOrPrivateContext]);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100021FDC;
  v8[3] = &unk_100240240;
  id v9 = v5;
  id v10 = v3;
  id v6 = v3;
  id v7 = v5;
  [v7 performBlock:v8];
}

- (BOOL)setStationsOrder:(id)a3
{
  id v3 = a3;
  uint64_t v13 = 0LL;
  objc_super v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  char v16 = 0;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 mainOrPrivateContext]);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10002237C;
  v9[3] = &unk_100240558;
  id v6 = v5;
  id v10 = v6;
  id v7 = v3;
  id v11 = v7;
  id v12 = &v13;
  [v6 performBlockAndWait:v9];
  LOBYTE(v4) = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)v4;
}

- (BOOL)setPodcastsOrder:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0LL;
  char v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  char v18 = 0;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mainOrPrivateContext]);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000226BC;
  v10[3] = &unk_100240A80;
  id v7 = v6;
  id v11 = v7;
  id v8 = v4;
  uint64_t v13 = self;
  objc_super v14 = &v15;
  id v12 = v8;
  [v7 performBlockAndWait:v10];
  LOBYTE(self) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)self;
}

- (BOOL)setEpisodesOrder:(id)a3 forStation:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  char v21 = 0;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 mainOrPrivateContext]);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100022AD0;
  v13[3] = &unk_100240AD0;
  id v9 = v8;
  id v14 = v9;
  id v10 = v6;
  id v15 = v10;
  id v11 = v5;
  id v16 = v11;
  uint64_t v17 = &v18;
  [v9 performBlockAndWait:v13];
  LOBYTE(v7) = *((_BYTE *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return (char)v7;
}

- (BOOL)setStationShowGroupOrder:(id)a3 forStation:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  char v21 = 0;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 mainOrPrivateContext]);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100022E30;
  v13[3] = &unk_100240AD0;
  id v9 = v8;
  id v14 = v9;
  id v10 = v6;
  id v15 = v10;
  id v11 = v5;
  id v16 = v11;
  uint64_t v17 = &v18;
  [v9 performBlockAndWait:v13];
  LOBYTE(v7) = *((_BYTE *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return (char)v7;
}

- (BOOL)setPlayed:(BOOL)a3 manually:(BOOL)a4 forUserActionOnEpisodeUuid:(id)a5
{
  id v8 = a5;
  uint64_t v22 = 0LL;
  v23 = &v22;
  uint64_t v24 = 0x2020000000LL;
  char v25 = 0;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 mainOrPrivateContext]);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10002EF14;
  v15[3] = &unk_100241130;
  id v11 = v10;
  id v16 = v11;
  id v12 = v8;
  uint64_t v18 = self;
  uint64_t v19 = &v22;
  id v17 = v12;
  BOOL v20 = a3;
  BOOL v21 = a4;
  [v11 performBlockAndWait:v15];
  char v13 = *((_BYTE *)v23 + 24);

  _Block_object_dispose(&v22, 8);
  return v13;
}

- (BOOL)setPlayed:(BOOL)a3 manually:(BOOL)a4 forUserActionOnEpisode:(id)a5 saveChanges:(BOOL)a6
{
  if (a3) {
    uint64_t v6 = 0LL;
  }
  else {
    uint64_t v6 = 2LL;
  }
  return -[MTLibrary setPlayState:manually:forUserActionOnEpisode:saveChanges:]( self,  "setPlayState:manually:forUserActionOnEpisode:saveChanges:",  v6,  a4,  a5,  a6);
}

- (BOOL)setPlayState:(int64_t)a3 manually:(BOOL)a4 forUserActionOnEpisodeUuid:(id)a5
{
  id v8 = a5;
  uint64_t v22 = 0LL;
  v23 = &v22;
  uint64_t v24 = 0x2020000000LL;
  char v25 = 0;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 mainOrPrivateContext]);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10002F0A8;
  v15[3] = &unk_100241158;
  id v11 = v10;
  id v16 = v11;
  id v12 = v8;
  id v17 = v12;
  uint64_t v18 = self;
  uint64_t v19 = &v22;
  int64_t v20 = a3;
  BOOL v21 = a4;
  [v11 performBlockAndWait:v15];
  char v13 = *((_BYTE *)v23 + 24);

  _Block_object_dispose(&v22, 8);
  return v13;
}

- (BOOL)setPlayState:(int64_t)a3 manually:(BOOL)a4 forUserActionOnEpisode:(id)a5 saveChanges:(BOOL)a6
{
  return -[MTLibrary setPlayState:fromContextActions:manually:forUserActionOnEpisode:saveChanges:]( self,  "setPlayState:fromContextActions:manually:forUserActionOnEpisode:saveChanges:",  a3,  0LL,  a4,  a5,  a6);
}

- (BOOL)setPlayState:(int64_t)a3 fromContextActions:(BOOL)a4 manually:(BOOL)a5 forUserActionOnEpisode:(id)a6 saveChanges:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v8 = a5;
  BOOL v9 = a4;
  id v11 = a6;
  id v12 = v11;
  if (v11)
  {
    uint64_t v13 = _MTLogCategoryDefault(v11);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [v12 playState];
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v12 title]);
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v12 uuid]);
      v24[0] = 67241730;
      v24[1] = v9;
      __int16 v25 = 2050;
      id v26 = v15;
      __int16 v27 = 2050;
      int64_t v28 = a3;
      __int16 v29 = 1026;
      int v30 = v8;
      __int16 v31 = 1026;
      BOOL v32 = v7;
      __int16 v33 = 2114;
      __int128 v34 = v16;
      __int16 v35 = 2114;
      __int128 v36 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Setting Playstate from context actions %{public}d: playstate from %{public}lld to %{public}lld , Manual: %{publi c}d, saveChanges: %{public}u For: %{public}@, UUID: %{public}@",  (uint8_t *)v24,  0x3Cu);
    }

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v12 podcast]);
    [v18 resetGoDarkWithReason:4];
    if (v9)
    {
      id v19 = [v12 playState];
      if (a3 == 2 && !v19)
      {
        LODWORD(v20) = 0;
        [v12 setPlayhead:v20];
      }

      if (a3) {
        uint64_t v8 = v8;
      }
      else {
        uint64_t v8 = 0LL;
      }
    }

    if (!a3 && (v8 & 1) == 0)
    {
      +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
      objc_msgSend(v12, "setLastDatePlayed:");
    }

    unsigned __int8 v21 = 1;
    [v12 setPlayState:a3 manually:v8 source:1];
    if (v7)
    {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v12 managedObjectContext]);
      unsigned __int8 v21 = [v22 saveInCurrentBlock];
    }
  }

  else
  {
    unsigned __int8 v21 = 0;
  }

  return v21;
}

- (void)cleanUpOldHiddenPodcasts
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_cleanUpOldHiddenPodcastsWorkController)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[MTCoalescableWorkController controllerWithQosClass:identifier:]( &OBJC_CLASS___MTCoalescableWorkController,  "controllerWithQosClass:identifier:",  9LL,  @"MTLibrary.cleanUpOldHiddenPodcasts"));
    cleanUpOldHiddenPodcastsWorkController = v2->_cleanUpOldHiddenPodcastsWorkController;
    v2->_cleanUpOldHiddenPodcastsWorkController = (MTCoalescableWorkController *)v3;
  }

  objc_sync_exit(v2);

  id v5 = v2->_cleanUpOldHiddenPodcastsWorkController;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000BADAC;
  v6[3] = &unk_10023FF98;
  void v6[4] = v2;
  -[MTCoalescableWorkController schedule:](v5, "schedule:", v6);
}

- (void)immediatelyDeleteAllHiddenPodcasts
{
}

- (void)synchronouslyMarkAsHiddenAllPodcastsWithoutResettingSyncVersions
{
  uint64_t v3 = _MTLogCategoryDatabase(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Deleting (hiding) all Podcasts", buf, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 importContext]);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000BAE98;
  v8[3] = &unk_100240240;
  id v9 = v6;
  id v10 = self;
  id v7 = v6;
  [v7 performBlockAndWaitWithSave:v8];
}

- (void)_immediatelyDeleteAllHiddenPodcasts
{
  uint64_t v3 = _MTLogCategoryDatabase(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Immediately deleting all hidden podcasts",  v6,  2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast predicateForHiddenPodcasts](&OBJC_CLASS___MTPodcast, "predicateForHiddenPodcasts"));
  -[MTLibrary _deletePodcastForPredicate:](self, "_deletePodcastForPredicate:", v5);
}

- (void)_cleanUpOldHiddenPodcasts
{
  if ((os_feature_enabled_recently_unfollowed(self, a2) & 1) != 0) {
    -[MTLibrary _cleanUpOldHiddenAndRecentlyUnfollowedPodcasts](self, "_cleanUpOldHiddenAndRecentlyUnfollowedPodcasts");
  }
  else {
    -[MTLibrary _cleanupHiddenPodcasts](self, "_cleanupHiddenPodcasts");
  }
}

- (void)_cleanupHiddenPodcasts
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( -[MTLibrary _predicateForOpportunisticHiddenPodcastDeletion]( self,  "_predicateForOpportunisticHiddenPodcastDeletion"));
  -[MTLibrary _deletePodcastForPredicate:](self, "_deletePodcastForPredicate:", v3);
}

- (void)_cleanUpOldHiddenAndRecentlyUnfollowedPodcasts
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[MTLibrary _predicateForOpportunisticHiddenPodcastDeletion]( self,  "_predicateForOpportunisticHiddenPodcastDeletion"));
  v8[0] = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[MTPodcast predicateForRecentlyUnfollowedOlderThanCutoffDate]( &OBJC_CLASS___MTPodcast,  "predicateForRecentlyUnfollowedOlderThanCutoffDate"));
  v8[1] = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 2LL));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v5));

  -[MTLibrary _deletePodcastForPredicate:](self, "_deletePodcastForPredicate:", v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[MTPodcast predicateForRecentlyUnfollowedOlderThanCutoffDate]( &OBJC_CLASS___MTPodcast,  "predicateForRecentlyUnfollowedOlderThanCutoffDate"));
  -[MTLibrary _deleteFromRecentlyUnfollowedForPredicate:](self, "_deleteFromRecentlyUnfollowedForPredicate:", v7);
}

- (id)_predicateForOpportunisticHiddenPodcastDeletion
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 dateByAddingTimeInterval:-60.0]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast predicateForHiddenPodcasts](&OBJC_CLASS___MTPodcast, "predicateForHiddenPodcasts"));
  v9[0] = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateForDateKey:isGreaterThanDate:]( &OBJC_CLASS___NSPredicate,  "predicateForDateKey:isGreaterThanDate:",  kPodcastAddedDate,  v3));
  v9[1] = v5;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 2LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v6));

  return v7;
}

- (void)_deleteFromRecentlyUnfollowedForPredicate:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 importContext]);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  void v8[2] = sub_1000BB388;
  v8[3] = &unk_100240240;
  id v9 = v5;
  id v10 = v3;
  id v6 = v3;
  id v7 = v5;
  [v7 performBlock:v8];
}

- (void)_deletePodcastForPredicate:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 importContext]);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  void v9[2] = sub_1000BB5C4;
  v9[3] = &unk_100240980;
  id v10 = v6;
  id v11 = v4;
  id v12 = self;
  id v7 = v4;
  id v8 = v6;
  [v8 performBlockAndWait:v9];
  +[MTBaseFeedManager saveSubscriptionMetadata](&OBJC_CLASS___MTBaseFeedManager, "saveSubscriptionMetadata");
}

- (void)_unsafeDeletePodcast:(id)a3 ctx:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 uuid]);
    if (!v8)
    {
      uint64_t v9 = _MTLogCategoryDefault(0LL);
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v20) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Error deleting podcast without uuid",  (uint8_t *)&v20,  2u);
      }
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTImageStore defaultStore](&OBJC_CLASS___MTImageStore, "defaultStore"));
    [v11 removeItemsWithPrefx:v8];

    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[PUIFeedManagerArtworkBridge shared](&OBJC_CLASS___PUIFeedManagerArtworkBridge, "shared"));
    [v12 invalidateArtworkForPodcast:v6];

    uint64_t v14 = _MTLogCategoryDatabase(v13);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      unsigned __int8 v21 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Deleting episodes for podcast %@ as part of podcast deletion",  (uint8_t *)&v20,  0xCu);
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForAllEpisodesIncludingHiddenOnPodcastUuid:]( &OBJC_CLASS___MTEpisode,  "predicateForAllEpisodesIncludingHiddenOnPodcastUuid:",  v8));
    -[MTLibrary _deleteEpisodes:forced:ctx:](self, "_deleteEpisodes:forced:ctx:", v16, 1LL, v7);

    uint64_t v18 = _MTLogCategoryDatabase(v17);
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      unsigned __int8 v21 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Deleting MTPodcast %@ from context",  (uint8_t *)&v20,  0xCu);
    }

    [v7 deleteObject:v6];
    [v7 saveInCurrentBlock];
  }
}

- (void)_markAsHiddenPodcast:(id)a3 inContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _MTLogCategoryDatabase(v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 uuid]);
    *(_DWORD *)buf = 138412290;
    int64_t v28 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Marking podcast %@ for deletion by hiding it",  buf,  0xCu);
  }

  [v6 setHidden:1];
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTLibrary config](self, "config"));
  unsigned int v12 = [v11 supportsLocalMedia];

  if (v12)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 episodes]);
    -[MTLibrary _removeDownloadAssetsForEpisodes:shouldKeep:forced:]( self,  "_removeDownloadAssetsForEpisodes:shouldKeep:forced:",  v13,  0LL,  1LL);
  }

  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "playlistSettings", 0));
  id v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        int v20 = (void *)objc_claimAutoreleasedReturnValue([v19 playlist]);
        [v20 setNeedsUpdate:1];

        [v7 deleteObject:v19];
      }

      id v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v16);
  }

  unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue([v6 uuid]);
  +[MTBaseFeedManager removeMetadataForPodcastUuid:]( &OBJC_CLASS___MTBaseFeedManager,  "removeMetadataForPodcastUuid:",  v21);
}

- (void)deletePodcastWithUuid:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 importContext]);

  id v8 = v4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));

  -[MTLibrary _markAsHiddenPodcastsWithUuids:setSubscriptionsSyncDirty:ctx:]( self,  "_markAsHiddenPodcastsWithUuids:setSubscriptionsSyncDirty:ctx:",  v7,  1LL,  v6);
}

- (void)_markAsHiddenPodcastsWithUuids:(id)a3 setSubscriptionsSyncDirty:(BOOL)a4 ctx:(id)a5
{
  uint64_t v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  id v16 = sub_1000BBCEC;
  uint64_t v17 = &unk_100242E80;
  id v18 = a3;
  id v8 = a5;
  id v19 = v8;
  int v20 = self;
  LOBYTE(v21) = a4;
  id v9 = v18;
  id v10 = objc_retainBlock(&v14);
  else {
    objc_msgSend(v8, "performBlock:", v10, v14, v15, v16, v17, v18, v19, v20, v21);
  }
}

- (void)_deleteEpisodes:(id)a3 forced:(BOOL)a4 ctx:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTLibrary config](self, "config"));
  if ([v10 supportsLocalMedia])
  {

LABEL_4:
    v19[0] = 0LL;
    v19[1] = v19;
    v19[2] = 0x3032000000LL;
    v19[3] = sub_1000E7B24;
    v19[4] = sub_1000E7B34;
    id v20 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000E7B3C;
    v13[3] = &unk_100244628;
    id v14 = v8;
    uint64_t v15 = self;
    BOOL v18 = a4;
    id v16 = v9;
    uint64_t v17 = v19;
    [v16 performBlockAndWait:v13];

    _Block_object_dispose(v19, 8);
    goto LABEL_5;
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTLibrary config](self, "config"));
  unsigned int v12 = [v11 supportsPlayback];

  if (v12) {
    goto LABEL_4;
  }
LABEL_5:
}

- (void)_deleteEpisodeUuids:(id)a3 forced:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K IN %@",  kEpisodeUuid,  a3));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 mainOrPrivateContext]);
  -[MTLibrary _deleteEpisodes:forced:ctx:](self, "_deleteEpisodes:forced:ctx:", v8, v4, v7);
}

- (id)_updateUpNextDeleting:(id)a3 inContext:(id)a4 forced:(BOOL)a5 podcastUuids:(id)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTLibrary config](self, "config"));
  unsigned int v11 = [v10 supportsPlayback];

  if (v11)
  {
    unsigned int v12 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id v28 = v8;
    id obj = v8;
    id v13 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v32;
      do
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v32 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
          if (+[MTPlayerController hasDefaultInstance](&OBJC_CLASS___MTPlayerController, "hasDefaultInstance"))
          {
            BOOL v18 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](&OBJC_CLASS___MTPlayerController, "defaultInstance"));
            id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 upNextController]);
            id v20 = (void *)objc_claimAutoreleasedReturnValue([v17 uuid]);
            [v19 removeEpisodesForUuid:v20];
          }

          id v21 = [v17 feedDeleted];
          if (!(_DWORD)v21 || (id v21 = [v17 isDownloaded], (_DWORD)v21))
          {
            if (!a5)
            {
              uint64_t v22 = _MTLogCategoryDefault(v21);
              __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v17 uuid]);
                __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v17 podcastUuid]);
                *(_DWORD *)buf = 138412546;
                __int128 v36 = v24;
                __int16 v37 = 2112;
                id v38 = v25;
                _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "Do not delete a downloaded item! episode uuid %@ - podcast uuid %@",  buf,  0x16u);
              }
            }
          }

          id v26 = (void *)objc_claimAutoreleasedReturnValue([v17 uuid]);
          -[NSMutableArray addObject:](v12, "addObject:", v26);

          [v9 deleteObject:v17];
        }

        id v14 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
      }

      while (v14);
    }

    id v8 = v28;
  }

  else
  {
    unsigned int v12 = 0LL;
  }

  return v12;
}

- (void)deleteEpisodes:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 mainOrPrivateContext]);
  -[MTLibrary _deleteEpisodes:forced:ctx:](self, "_deleteEpisodes:forced:ctx:", v4, 0LL, v5);
}

- (void)deleteEpisodeUuids:(id)a3
{
}

- (void)deleteOrphanedEpisodes
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 mainOrPrivateContext]);

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000E830C;
  v6[3] = &unk_100240240;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [v5 performBlockAndWait:v6];
}

- (void)deletePlaylist:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 managedObjectContext]);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000EAAF8;
    v6[3] = &unk_10023FF98;
    id v7 = v4;
    [v5 performBlockAndWaitWithSave:v6];
  }
}

- (void)deleteStationWithUuid:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mainOrPrivateContext]);

  uint64_t v8 = _MTLogCategoryDatabase(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Deleting station with uuid: %@", buf, 0xCu);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000EAC9C;
  v12[3] = &unk_100240980;
  id v13 = v6;
  id v14 = v4;
  uint64_t v15 = self;
  id v10 = v4;
  id v11 = v6;
  [v11 performBlockAndWait:v12];
}

- (void)deleteAllTopLevelStationsExcludingFolders
{
  uint64_t v3 = _MTLogCategoryDatabase(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Deleting all Stations", buf, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mainOrPrivateContext]);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  void v8[2] = sub_1000EADC4;
  v8[3] = &unk_100240240;
  id v9 = v6;
  id v10 = self;
  id v7 = v6;
  [v7 performBlockAndWait:v8];
}

- (void)cleanUpNeutralInterests
{
  v2 = self;
  MTLibrary.cleanUpNeutralInterests()();
}

- (void)deleteAllInterestsBlockingCaller
{
  v2 = self;
  MTLibrary.deleteAllInterestsBlockingCaller()();
}

@end