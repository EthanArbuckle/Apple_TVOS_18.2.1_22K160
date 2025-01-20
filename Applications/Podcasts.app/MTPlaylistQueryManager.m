@interface MTPlaylistQueryManager
+ (BOOL)updatePlaylist:(id)a3 inContext:(id)a4;
+ (id)_allEligiblePodcastsForPlaylistInCtx:(id)a3;
+ (void)_fixSortOrder:(id)a3 generated_p:(BOOL *)a4;
+ (void)_sortUngroupedList:(id)a3 inPlaylist:(id)a4;
+ (void)updateEpisodesForSettings:(id)a3 ctx:(id)a4;
- (BOOL)updatePlaylistWithUuid:(id)a3 inContext:(id)a4;
- (BOOL)updatePlaylistWithUuid:(id)a3 inContext:(id)a4 applyAdditionalChangesBlock:(id)a5;
- (BOOL)updatePlaylistsWithUuids:(id)a3;
- (BOOL)updatePlaylistsWithUuids:(id)a3 context:(id)a4 applyAdditionalChangesBlock:(id)a5;
- (MTPlaylistQueryManager)init;
- (id)entityName;
- (id)predicate;
- (void)createDefaultPlaylists;
- (void)feedUpdateDidComplete:(id)a3;
- (void)resultsChangedWithDeletedIds:(id)a3 insertIds:(id)a4 updatedIds:(id)a5;
- (void)updateAllPlaylistsWithCompletion:(id)a3;
@end

@implementation MTPlaylistQueryManager

- (MTPlaylistQueryManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTPlaylistQueryManager;
  v2 = -[MTBaseProcessor init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 addObserver:v2 selector:"feedUpdateDidComplete:" name:@"MTFeedUpdateDidEndUpdatingAllFeeds" object:0];
  }

  return v2;
}

- (void)feedUpdateDidComplete:(id)a3
{
}

- (id)entityName
{
  return kMTPlaylistEntityName;
}

- (id)predicate
{
  return +[MTPlaylist predicateForFlag:isTrue:](&OBJC_CLASS___MTPlaylist, "predicateForFlag:isTrue:", 5LL, 1LL);
}

- (void)resultsChangedWithDeletedIds:(id)a3 insertIds:(id)a4 updatedIds:(id)a5
{
  id v6 = a4;
  if ([v6 count])
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(-2LL, 0LL);
    v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000A467C;
    v9[3] = &unk_100240240;
    v9[4] = self;
    id v10 = v6;
    dispatch_async(v8, v9);
  }
}

+ (void)_fixSortOrder:(id)a3 generated_p:(BOOL *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mutableOrderedSetValueForKey:kPlaylistSettings]);
  switch([v5 containerOrder])
  {
    case 0u:
      v7 = &stru_100243500;
      goto LABEL_15;
    case 1u:
      v7 = &stru_100243520;
      goto LABEL_15;
    case 3u:
      v7 = &stru_100243540;
      goto LABEL_15;
    case 4u:
      v7 = &stru_100243560;
      goto LABEL_15;
    case 5u:
      v7 = &stru_100243580;
LABEL_15:
      [v6 sortUsingComparator:v7];
      break;
    default:
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      __int128 v14 = 0u;
      __int128 v15 = 0u;
      id v8 = v6;
      id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = 0LL;
        uint64_t v12 = *(void *)v15;
        do
        {
          for (i = 0LL; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v15 != v12) {
              objc_enumerationMutation(v8);
            }
            objc_msgSend( *(id *)(*((void *)&v14 + 1) + 8 * (void)i),  "setSortOrder:",  (char *)i + v11,  (void)v14);
          }

          id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
          v11 += (uint64_t)i;
        }

        while (v10);
      }

      *a4 = 1;
      break;
  }
}

+ (BOOL)updatePlaylist:(id)a3 inContext:(id)a4
{
  id v5 = a3;
  id v55 = a4;
  v51 = v5;
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v55 playlistForUuid:v5]);
  v56 = (void *)v6;
  if (!v6)
  {
    LOBYTE(v52) = 0;
    goto LABEL_60;
  }

  uint64_t v7 = _MTLogCategoryDatabase(v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Calling refreshObject:mergeChanges: for playlist.",  buf,  2u);
  }

  [v55 refreshObject:v56 mergeChanges:1];
  unsigned int v52 = [v56 needsUpdate];
  if (v52) {
    [v56 setNeedsUpdate:0];
  }
  if (([v56 hidden] & 1) == 0)
  {
    if ([v56 isItunesPlaylist])
    {
      if ((v52 & 1) != 0) {
        LOBYTE(v52) = 1;
      }
      else {
        LOBYTE(v52) = [v56 updateUnplayedCount];
      }
      goto LABEL_60;
    }

    if ([v56 includesAllPodcasts])
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue([a1 _allEligiblePodcastsForPlaylistInCtx:v55]);
    }

    else
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v56 podcasts]);
      v50 = (void *)objc_claimAutoreleasedReturnValue([v9 array]);
    }

    if ([v50 count])
    {
      buf[0] = 0;
      if (!v52)
      {
LABEL_56:
        [0 report];
        char v45 = v52;
        if (buf[0]) {
          char v45 = 1;
        }
        goto LABEL_58;
      }

      [0 reportWithMarker:@"*** Update start ***"];
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v56 settings]);
      id v11 = [v10 copy];

      __int128 v63 = 0u;
      __int128 v64 = 0u;
      __int128 v61 = 0u;
      __int128 v62 = 0u;
      id v12 = v11;
      id v13 = [v12 countByEnumeratingWithState:&v61 objects:v67 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v62;
        uint64_t v53 = kEpisodeTitle;
        do
        {
          for (i = 0LL; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v62 != v14) {
              objc_enumerationMutation(v12);
            }
            __int128 v16 = *(void **)(*((void *)&v61 + 1) + 8LL * (void)i);
            __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 podcast]);
            if (v17)
            {
              if ([v16 needsUpdate])
              {
                v18 = (void *)objc_claimAutoreleasedReturnValue([v16 podcast]);
                v19 = (void *)objc_claimAutoreleasedReturnValue([v18 title]);
                v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Settings needs update: %@",  v19));
                [0 reportWithMarker:v20];

                [a1 updateEpisodesForSettings:v16 ctx:v55];
                [v16 setNeedsUpdate:0];
                v21 = (void *)objc_claimAutoreleasedReturnValue([v16 episodes]);
                v22 = (void *)objc_claimAutoreleasedReturnValue([v21 valueForKey:v53]);
                v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\n%@",  v22));
                [0 reportWithMarker:v23];
              }
            }

            else
            {
              v24 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](&OBJC_CLASS___IMLogger, "sharedLogger"));
              [v24 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Library/Playlists/MTPlaylistQueryManager.m" lineNumber:225 format:@"Settings object with no podcast set"];

              [v55 deleteObject:v16];
              __int128 v17 = 0LL;
            }
          }

          id v13 = [v12 countByEnumeratingWithState:&v61 objects:v67 count:16];
        }

        while (v13);
      }

      objc_msgSend(a1, "_fixSortOrder:generated_p:", v56, buf);
      v25 = (void *)objc_claimAutoreleasedReturnValue([v56 settings]);
      id v26 = [v25 copy];

      v27 = objc_opt_new(&OBJC_CLASS___NSMutableOrderedSet);
      __int128 v59 = 0u;
      __int128 v60 = 0u;
      __int128 v57 = 0u;
      __int128 v58 = 0u;
      id v28 = v26;
      id v29 = [v28 countByEnumeratingWithState:&v57 objects:v66 count:16];
      if (v29)
      {
        uint64_t v30 = *(void *)v58;
        do
        {
          for (j = 0LL; j != v29; j = (char *)j + 1)
          {
            if (*(void *)v58 != v30) {
              objc_enumerationMutation(v28);
            }
            v32 = *(void **)(*((void *)&v57 + 1) + 8LL * (void)j);
            v33 = (void *)objc_claimAutoreleasedReturnValue([v32 episodes]);
            id v34 = [v33 mutableCopy];

            v35 = (void *)objc_claimAutoreleasedReturnValue([v56 deletedEpisodes]);
            [v34 minusSet:v35];

            v36 = (void *)objc_claimAutoreleasedReturnValue([v32 episodes]);
            unsigned __int8 v37 = [v34 isEqualToOrderedSet:v36];

            if ((v37 & 1) == 0)
            {
              [v32 setEpisodes:v34];
              buf[0] = 1;
            }

            v38 = (void *)objc_claimAutoreleasedReturnValue([v32 episodes]);
            -[NSMutableOrderedSet unionOrderedSet:](v27, "unionOrderedSet:", v38);

            objc_msgSend(v32, "setEpisodeCount:", objc_msgSend(v34, "count"));
          }

          id v29 = [v28 countByEnumeratingWithState:&v57 objects:v66 count:16];
        }

        while (v29);
      }

      v39 = (void *)objc_claimAutoreleasedReturnValue([v56 deletedEpisodes]);
      -[NSMutableOrderedSet minusSet:](v27, "minusSet:", v39);

      v40 = (void *)objc_claimAutoreleasedReturnValue([v56 episodes]);
      if (-[NSMutableOrderedSet isEqualToOrderedSet:](v27, "isEqualToOrderedSet:", v40))
      {
        unsigned __int8 v41 = [v56 isUngroupedList];

        if ((v41 & 1) == 0)
        {
LABEL_51:
          v46 = (void *)objc_claimAutoreleasedReturnValue([v56 episodes]);
          if ([v46 count])
          {
          }

          else
          {
            BOOL v47 = -[NSMutableOrderedSet count](v27, "count") == 0LL;

            if (v47) {
              buf[0] = 1;
            }
          }

          +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
          objc_msgSend(v56, "setUpdatedDate:");

          goto LABEL_56;
        }
      }

      else
      {
      }

      [v56 setEpisodes:v27];
      [v56 updateUnplayedCount];
      buf[0] = 1;
      [0 reportWithMarker:@"Playlist generated"];
      goto LABEL_51;
    }

    v42 = (void *)objc_claimAutoreleasedReturnValue([v56 podcasts]);
    if (![v42 count])
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue([v56 deletedEpisodes]);
      if (![v43 count])
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue([v56 episodes]);
        if (![v44 count])
        {
          BOOL v49 = [v56 unplayedCount] == 0;

          if (v49) {
            goto LABEL_59;
          }
          goto LABEL_46;
        }
      }
    }

LABEL_46:
    [v56 setPodcasts:0];
    [v56 setDeletedEpisodes:0];
    [v56 setEpisodes:0];
    [v56 setUnplayedCount:0];
    char v45 = 1;
LABEL_58:
    LOBYTE(v52) = v45;
LABEL_59:
  }

+ (void)_sortUngroupedList:(id)a3 inPlaylist:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  switch([v5 containerOrder])
  {
    case 0u:
      uint64_t v6 = &stru_1002435C0;
      goto LABEL_7;
    case 1u:
      uint64_t v6 = &stru_1002435E0;
      goto LABEL_7;
    case 2u:
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 episodes]);
      id v8 = [v7 mutableCopy];

      id v9 = [v10 mutableCopy];
      [v9 minusOrderedSet:v8];
      [v8 intersectOrderedSet:v10];
      [v10 removeAllObjects];
      [v10 unionOrderedSet:v9];
      [v10 unionOrderedSet:v8];

      break;
    case 3u:
      uint64_t v6 = &stru_100243600;
      goto LABEL_7;
    case 4u:
      uint64_t v6 = &stru_100243620;
LABEL_7:
      [v10 sortUsingComparator:v6];
      break;
    default:
      break;
  }
}

+ (void)updateEpisodesForSettings:(id)a3 ctx:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 predicateForSettings]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 podcast]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 sortDescriptorsForPlayOrderByPubDate]);

  id v10 = [v5 integerForEpisodesToShow];
  uint64_t v30 = v6;
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = kEpisodeLevel;
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K < %ld",  kEpisodeLevel,  v10));
    uint64_t v29 = objc_claimAutoreleasedReturnValue([v7 AND:v13]);

    uint64_t v14 = kMTEpisodeEntityName;
    __int128 v15 = v9;
    id v16 = v6;
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  kEpisodePubDate,  0LL));
    v31[0] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  kEpisodeEpisodeNumber,  0LL));
    v31[1] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  v12,  1LL));
    v31[2] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:selector:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:selector:",  kEpisodeTitle,  1LL,  "localizedStandardCompare:"));
    v31[3] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v31, 4LL));
    v22 = v16;
    id v9 = v15;
    v23 = (void *)objc_claimAutoreleasedReturnValue( [v22 objectsInEntity:v14 predicate:v29 sortDescriptors:v21 returnsObjectsAsFaults:1 limit:v11]);

    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 sortedArrayUsingDescriptors:v15]);
    uint64_t v7 = (void *)v29;
  }

  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue( [v6 objectsInEntity:kMTEpisodeEntityName predicate:v7 sortDescriptors:v9 returnsObjectsAsFaults:1 limit:0]);
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithArray:](&OBJC_CLASS___NSOrderedSet, "orderedSetWithArray:", v24));
  id v26 = (void *)objc_claimAutoreleasedReturnValue([v5 episodes]);
  unsigned __int8 v27 = [v25 isEqualToOrderedSet:v26];

  if ((v27 & 1) == 0)
  {
    id v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithArray:](&OBJC_CLASS___NSOrderedSet, "orderedSetWithArray:", v24));
    [v5 setEpisodes:v28];
  }

  objc_msgSend(v5, "setVisible:", objc_msgSend(v24, "count") != 0);
  [v5 latestEpisodeDate];
  objc_msgSend(v5, "setLatestEpisodeAvailabilityDate:");
  [v5 oldestEpisodeDate];
  objc_msgSend(v5, "setEarliestEpisodeAvailabilityDate:");
}

- (BOOL)updatePlaylistWithUuid:(id)a3 inContext:(id)a4
{
  return -[MTPlaylistQueryManager updatePlaylistWithUuid:inContext:applyAdditionalChangesBlock:]( self,  "updatePlaylistWithUuid:inContext:applyAdditionalChangesBlock:",  a3,  a4,  0LL);
}

- (BOOL)updatePlaylistWithUuid:(id)a3 inContext:(id)a4 applyAdditionalChangesBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", a3));
  LOBYTE(self) = -[MTPlaylistQueryManager updatePlaylistsWithUuids:context:applyAdditionalChangesBlock:]( self,  "updatePlaylistsWithUuids:context:applyAdditionalChangesBlock:",  v10,  v9,  v8);

  return (char)self;
}

- (void)updateAllPlaylistsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (!v5->_updateAllPlaylistBackgroundWorkController)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue( +[MTCoalescableWorkController controllerWithQosClass:identifier:]( &OBJC_CLASS___MTCoalescableWorkController,  "controllerWithQosClass:identifier:",  21LL,  @"MTPlaylistQueryManager.updateAllPlaylists"));
    updateAllPlaylistBackgroundWorkController = v5->_updateAllPlaylistBackgroundWorkController;
    v5->_updateAllPlaylistBackgroundWorkController = (MTCoalescableWorkController *)v6;
  }

  objc_sync_exit(v5);

  id v8 = v5->_updateAllPlaylistBackgroundWorkController;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000A5A38;
  v9[3] = &unk_10023FF98;
  v9[4] = v5;
  -[MTCoalescableWorkController schedule:completion:](v8, "schedule:completion:", v9, v4);
}

- (BOOL)updatePlaylistsWithUuids:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mainOrPrivateContext]);

  LOBYTE(self) = -[MTPlaylistQueryManager updatePlaylistsWithUuids:context:applyAdditionalChangesBlock:]( self,  "updatePlaylistsWithUuids:context:applyAdditionalChangesBlock:",  v4,  v6,  0LL);
  return (char)self;
}

- (BOOL)updatePlaylistsWithUuids:(id)a3 context:(id)a4 applyAdditionalChangesBlock:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  char v22 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000A5E94;
  v14[3] = &unk_100243648;
  id v10 = v7;
  id v15 = v10;
  v18 = &v19;
  id v11 = v8;
  id v16 = v11;
  id v12 = v9;
  id v17 = v12;
  [v11 performBlockAndWait:v14];
  LOBYTE(v9) = *((_BYTE *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return (char)v9;
}

- (void)createDefaultPlaylists
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 mainOrPrivateContext]);

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000A6084;
  v5[3] = &unk_10023FF98;
  id v6 = v3;
  id v4 = v3;
  [v4 performBlockAndWait:v5];
}

+ (id)_allEligiblePodcastsForPlaylistInCtx:(id)a3
{
  uint64_t v3 = kMTPodcastEntityName;
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[MTPodcast predicateForNotHiddenNotImplicitlyFollowedPodcasts]( &OBJC_CLASS___MTPodcast,  "predicateForNotHiddenNotImplicitlyFollowedPodcasts"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast sortDescriptorsForAllPodcasts](&OBJC_CLASS___MTPodcast, "sortDescriptorsForAllPodcasts"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectsInEntity:v3 predicate:v5 sortDescriptors:v6]);

  return v7;
}

- (void).cxx_destruct
{
}

@end