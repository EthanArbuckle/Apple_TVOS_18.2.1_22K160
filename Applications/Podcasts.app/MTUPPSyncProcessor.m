@interface MTUPPSyncProcessor
- (BOOL)shouldSync:(id)a3;
- (id)controller;
- (id)entityName;
- (id)predicate;
- (void)playerPaused;
- (void)processResults;
- (void)updatePredicate;
@end

@implementation MTUPPSyncProcessor

- (id)entityName
{
  return kMTEpisodeEntityName;
}

- (id)predicate
{
  uint64_t v2 = kEpisodeMetadataTimestamp;
  +[MTUniversalPlaybackPositionDataSource uppLastSyncTime]( &OBJC_CLASS___MTUniversalPlaybackPositionDataSource,  "uppLastSyncTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateForDateKey:isGreaterThanDate:]( &OBJC_CLASS___NSPredicate,  "predicateForDateKey:isGreaterThanDate:",  v2,  v3));

  return v4;
}

- (void)updatePredicate
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTUPPSyncProcessor;
  -[MTBaseProcessor updatePredicate](&v5, "updatePredicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseProcessor queryObserver](self, "queryObserver"));
  unsigned int v4 = [v3 isObserving];

  if (v4) {
    -[MTUPPSyncProcessor processResults](self, "processResults");
  }
}

- (void)processResults
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v10 = 0LL;
  v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  v13 = sub_1000F88E4;
  v14 = sub_1000F88F4;
  id v15 = 0LL;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000F88FC;
  v9[3] = &unk_1002424F8;
  v9[4] = &v10;
  -[MTBaseProcessor results:](v2, "results:", v9);
  BOOL v3 = -[MTUPPSyncProcessor shouldSync:](v2, "shouldSync:", v11[5]);
  if (v3)
  {
    uint64_t v4 = _MTLogCategoryUPPSync(v3);
    objc_super v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(id)v11[5] count];
      *(_DWORD *)buf = 134217984;
      id v17 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "MTUPPSyncProcessor - Episodes to sync: %ld",  buf,  0xCu);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue( +[SyncControllerFactory resolvedSyncController]( &OBJC_CLASS____TtC8Podcasts21SyncControllerFactory,  "resolvedSyncController"));
    [v7 performUniversalPlaybackPositionSync];
  }

  else
  {
    uint64_t v8 = _MTLogCategoryUPPSync(v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_ERROR,  "MTUPPSyncProcessor - skipping sync",  buf,  2u);
    }
  }

  _Block_object_dispose(&v10, 8);
  objc_sync_exit(v2);
}

- (BOOL)shouldSync:(id)a3
{
  id v4 = a3;
  if (![v4 count])
  {
    uint64_t v6 = _MTLogCategoryUPPSync(0LL);
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "MTUPPSyncProcessor - skipping sync because no items to sync.",  buf,  2u);
    }

    BOOL v5 = 0;
    goto LABEL_23;
  }

  if ((unint64_t)[v4 count] <= 1)
  {
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
    if ((os_feature_enabled_bluemoon(v7) & 1) != 0)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTUPPSyncProcessor controller](self, "controller"));
      [v8 reloadIfNeeded];

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTUPPSyncProcessor controller](self, "controller"));
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 response]);

      if ([v10 state] != (id)2) {
        goto LABEL_18;
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue([v10 tracklist]);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 playingItem]);
      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 metadataObject]);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 identifiers]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 library]);
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 databaseID]);
      unsigned int v17 = [v16 isEqualToString:v7];

      if (!v17)
      {
LABEL_18:
        BOOL v5 = 1;
LABEL_22:

LABEL_23:
        goto LABEL_24;
      }

      uint64_t v19 = _MTLogCategoryUPPSync(v18);
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "MTUPPSyncProcessor - Trying to sync the currently playing item. Skipping UPP sync.",  v26,  2u);
      }

      BOOL v5 = 0;
    }

    else
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](&OBJC_CLASS___MTPlayerController, "defaultInstance"));
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 currentItem]);
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s episodeUuid](v20, "episodeUuid"));
      if (-[os_log_s isEqualToString:](v7, "isEqualToString:", v21)
        && (id v22 = [v10 isPlayingLocally], (_DWORD)v22))
      {
        uint64_t v23 = _MTLogCategoryUPPSync(v22);
        v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v27 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "MTUPPSyncProcessor - skipping sync on currently playing item.",  v27,  2u);
        }

        BOOL v5 = 0;
      }

      else
      {
        BOOL v5 = 1;
      }
    }

    goto LABEL_22;
  }

  BOOL v5 = 1;
LABEL_24:

  return v5;
}

- (void)playerPaused
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000F8C18;
  v2[3] = &unk_10023FF98;
  v2[4] = self;
  -[MTBaseProcessor enqueueWorkBlock:](self, "enqueueWorkBlock:", v2);
}

- (id)controller
{
  controller = self->_controller;
  if (!controller)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___MPCPlayerRequest);
    [v4 setLabel:@"com.apple.podcasts.MTUPPSyncProcessor"];
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[MPAVRoutingController systemRoute](&OBJC_CLASS___MPAVRoutingController, "systemRoute"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[MPCPlayerPath pathWithRoute:bundleID:playerID:]( &OBJC_CLASS___MPCPlayerPath,  "pathWithRoute:bundleID:playerID:",  v5,  kMRMediaRemoteSystemPodcastApplicationDisplayIdentifier,  kPodcastsPlayerID));
    [v4 setPlayerPath:v6];

    uint64_t v13 = MPModelRelationshipGenericPodcastEpisode;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet emptyPropertySet](&OBJC_CLASS___MPPropertySet, "emptyPropertySet"));
    v14 = v7;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithRelationships:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithRelationships:",  v8));
    [v4 setPlayingItemProperties:v9];

    uint64_t v10 = objc_alloc_init(&OBJC_CLASS___MPRequestResponseController);
    v11 = self->_controller;
    self->_controller = v10;

    -[MPRequestResponseController setRequest:](self->_controller, "setRequest:", v4);
    -[MPRequestResponseController beginAutomaticResponseLoading](self->_controller, "beginAutomaticResponseLoading");

    controller = self->_controller;
  }

  return controller;
}

- (void).cxx_destruct
{
}

@end