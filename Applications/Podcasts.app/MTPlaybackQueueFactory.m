@interface MTPlaybackQueueFactory
+ (BOOL)_isContinuousPlaybackEnabledForLimit:(int64_t)a3;
+ (id)_episodeToPlayForPodcastUuid:(id)a3 playbackOrder:(int64_t)a4 excludeExplicit:(int64_t)a5 ctx:(id)a6;
+ (id)_latestEpisodeForPodcastUuid:(id)a3 restrictToUserEpisodes:(BOOL)a4 excludeExplicit:(int64_t)a5 ctx:(id)a6;
+ (id)_latestOrOldestEpisodeForPodcastUuid:(id)a3 restrictToUserEpisodes:(BOOL)a4 excludeExplicit:(int64_t)a5 latest:(BOOL)a6 ctx:(id)a7;
+ (id)_manifestForPlayMyLatestPodcasts;
+ (id)_manifestForPlayMyOldestPodcasts;
+ (id)_manifestForPlayMyPodcasts;
+ (id)_oldestEpisodeForPodcastUuid:(id)a3 restrictToUserEpisodes:(BOOL)a4 excludeExplicit:(int64_t)a5 ctx:(id)a6;
+ (id)_uuidForEpisode:(id)a3;
+ (id)playEpisodeUuid:(id)a3;
+ (id)playEpisodeUuid:(id)a3 context:(int64_t)a4;
+ (id)playEpisodeUuid:(id)a3 context:(int64_t)a4 limit:(int64_t)a5;
+ (id)playEpisodeUuid:(id)a3 context:(int64_t)a4 sortType:(int64_t)a5 limit:(int64_t)a6 pubDateLimit:(int64_t)a7;
+ (id)playEpisodeUuid:(id)a3 limit:(int64_t)a4;
+ (id)playListenNow;
+ (id)playMyPodcastsWithOrder:(int64_t)a3;
+ (id)playPodcastUuid:(id)a3;
+ (id)playPodcastUuid:(id)a3 limit:(int64_t)a4;
+ (id)playPodcastUuid:(id)a3 order:(int64_t)a4;
+ (id)playPodcastUuid:(id)a3 order:(int64_t)a4 limit:(int64_t)a5;
+ (id)playPodcastUuid:(id)a3 order:(int64_t)a4 limit:(int64_t)a5 error:(int64_t *)a6;
+ (id)playStationUuid:(id)a3;
+ (id)playStationUuid:(id)a3 episodeUuid:(id)a4;
+ (id)playStationUuid:(id)a3 episodeUuid:(id)a4 limit:(int64_t)a5;
+ (id)playStationUuid:(id)a3 limit:(int64_t)a4;
@end

@implementation MTPlaybackQueueFactory

+ (id)playListenNow
{
  uint64_t v14 = 0LL;
  v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  v17 = sub_1001243F4;
  v18 = sub_100124404;
  id v19 = 0LL;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode sortDescriptorsForListenNow](&OBJC_CLASS___MTEpisode, "sortDescriptorsForListenNow"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 mainOrPrivateContext]);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10012440C;
  v10[3] = &unk_100240558;
  id v6 = v5;
  id v11 = v6;
  id v7 = v3;
  id v12 = v7;
  v13 = &v14;
  [v6 performBlockAndWait:v10];
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 playEpisodeUuid:v15[5]]);

  _Block_object_dispose(&v14, 8);
  return v8;
}

+ (id)playMyPodcastsWithOrder:(int64_t)a3
{
  if (a3 == 2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue([a1 _manifestForPlayMyOldestPodcasts]);
  }

  else if (a3 == 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue([a1 _manifestForPlayMyLatestPodcasts]);
  }

  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue([a1 _manifestForPlayMyPodcasts]);
  }

  return v3;
}

+ (id)playPodcastUuid:(id)a3
{
  return _[a1 playPodcastUuid:a3 order:0];
}

+ (id)playPodcastUuid:(id)a3 order:(int64_t)a4
{
  return _[a1 playPodcastUuid:a3 order:a4 limit:0];
}

+ (id)playPodcastUuid:(id)a3 limit:(int64_t)a4
{
  return _[a1 playPodcastUuid:a3 order:0 limit:a4];
}

+ (id)playPodcastUuid:(id)a3 order:(int64_t)a4 limit:(int64_t)a5 error:(int64_t *)a6
{
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 mainOrPrivateContext]);

  uint64_t v13 = objc_claimAutoreleasedReturnValue([a1 _episodeToPlayForPodcastUuid:v10 playbackOrder:a4 excludeExplicit:0 ctx:v12]);
  uint64_t v14 = (void *)v13;
  if (!a4 && !v13) {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( [a1 _episodeToPlayForPodcastUuid:v10 playbackOrder:1 excludeExplicit:0 ctx:v12]);
  }
  if (!v14)
  {
    if (!a6) {
      goto LABEL_16;
    }
    uint64_t v24 = 0LL;
    v25 = &v24;
    uint64_t v26 = 0x2020000000LL;
    char v27 = 0;
    if ([v10 length])
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_100124724;
      v20[3] = &unk_100240558;
      id v15 = v12;
      id v21 = v15;
      id v16 = v10;
      id v22 = v16;
      v23 = &v24;
      [v15 performBlockAndWait:v20];

      if (!*((_BYTE *)v25 + 24))
      {
        if ((+[PFRestrictionsController isExplicitContentAllowed]( &OBJC_CLASS___PFRestrictionsController,  "isExplicitContentAllowed") & 1) == 0)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue( [a1 _episodeToPlayForPodcastUuid:v16 playbackOrder:a4 excludeExplicit:2 ctx:v15]);
          if (v17)
          {
            *a6 = 3LL;

LABEL_15:
            _Block_object_dispose(&v24, 8);
            a6 = 0LL;
            goto LABEL_16;
          }
        }

        int64_t v18 = 2LL;
LABEL_14:
        *a6 = v18;
        goto LABEL_15;
      }
    }

    else
    {
      *((_BYTE *)v25 + 24) = 1;
    }

    int64_t v18 = 1LL;
    goto LABEL_14;
  }

  a6 = (int64_t *)objc_claimAutoreleasedReturnValue([a1 playEpisodeUuid:v14 limit:a5]);
LABEL_16:

  return a6;
}

+ (id)playPodcastUuid:(id)a3 order:(int64_t)a4 limit:(int64_t)a5
{
  return [a1 playPodcastUuid:a3 order:a4 limit:a5 error:0];
}

+ (id)playStationUuid:(id)a3
{
  return [a1 playStationUuid:a3 episodeUuid:0];
}

+ (id)playStationUuid:(id)a3 episodeUuid:(id)a4
{
  return [a1 playStationUuid:a3 episodeUuid:a4 limit:0];
}

+ (id)playStationUuid:(id)a3 limit:(int64_t)a4
{
  return [a1 playStationUuid:a3 episodeUuid:0 limit:a4];
}

+ (id)playStationUuid:(id)a3 episodeUuid:(id)a4 limit:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 length] && objc_msgSend(a1, "_isContinuousPlaybackEnabledForLimit:", a5))
  {
    id v10 = -[MTPlaylistManifest initWithPlaylistUuid:initialEpisodeUuid:]( objc_alloc(&OBJC_CLASS___MTPlaylistManifest),  "initWithPlaylistUuid:initialEpisodeUuid:",  v8,  v9);
LABEL_6:
    id v11 = (MTEpisodeManifest *)v10;
    goto LABEL_7;
  }

  if ([v9 length])
  {
    id v10 = -[MTEpisodeManifest initWithEpisodeUuid:]( objc_alloc(&OBJC_CLASS___MTEpisodeManifest),  "initWithEpisodeUuid:",  v9);
    goto LABEL_6;
  }

  if ([v8 length])
  {
    uint64_t v21 = 0LL;
    id v22 = &v21;
    uint64_t v23 = 0x3032000000LL;
    uint64_t v24 = sub_1001243F4;
    v25 = sub_100124404;
    id v26 = 0LL;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 mainOrPrivateContext]);

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100124980;
    v17[3] = &unk_100240558;
    id v15 = v14;
    id v18 = v15;
    id v19 = v8;
    v20 = &v21;
    [v15 performBlockAndWait:v17];
    if ([(id)v22[5] length])
    {
      id v16 = objc_alloc(&OBJC_CLASS___MTEpisodeManifest);
      id v11 = -[MTEpisodeManifest initWithEpisodeUuid:](v16, "initWithEpisodeUuid:", v22[5]);
    }

    else
    {
      id v11 = 0LL;
    }

    _Block_object_dispose(&v21, 8);
  }

  else
  {
    id v11 = 0LL;
  }

+ (id)playEpisodeUuid:(id)a3
{
  return [a1 playEpisodeUuid:a3 limit:0];
}

+ (id)playEpisodeUuid:(id)a3 context:(int64_t)a4
{
  return [a1 playEpisodeUuid:a3 context:a4 limit:0];
}

+ (id)playEpisodeUuid:(id)a3 limit:(int64_t)a4
{
  return [a1 playEpisodeUuid:a3 context:0 limit:a4];
}

+ (id)playEpisodeUuid:(id)a3 context:(int64_t)a4 limit:(int64_t)a5
{
  return _[a1 playEpisodeUuid:a3 context:a4 sortType:0 limit:a5 pubDateLimit:3];
}

+ (id)playEpisodeUuid:(id)a3 context:(int64_t)a4 sortType:(int64_t)a5 limit:(int64_t)a6 pubDateLimit:(int64_t)a7
{
  id v12 = a3;
  if ([v12 length])
  {
    id v13 = [a1 _isContinuousPlaybackEnabledForLimit:a6];
    if ((_DWORD)v13)
    {
      id v15 = 0LL;
      switch(a5)
      {
        case 0LL:
        case 1LL:
          goto LABEL_17;
        case 2LL:
          uint64_t v16 = 1LL;
          goto LABEL_18;
        case 3LL:
          uint64_t v18 = objc_claimAutoreleasedReturnValue(+[MTEpisode sortDescriptorsForTitle](&OBJC_CLASS___MTEpisode, "sortDescriptorsForTitle"));
          goto LABEL_19;
        case 4LL:
          uint64_t v19 = 0LL;
          goto LABEL_10;
        case 5LL:
          uint64_t v19 = 1LL;
LABEL_10:
          uint64_t v18 = objc_claimAutoreleasedReturnValue( +[MTEpisode sortDescriptorsForLastBookmarkedDateAscending:]( &OBJC_CLASS___MTEpisode,  "sortDescriptorsForLastBookmarkedDateAscending:",  v19));
          goto LABEL_19;
        case 7LL:
          uint64_t v20 = 1LL;
          goto LABEL_13;
        case 8LL:
          uint64_t v20 = 0LL;
LABEL_13:
          uint64_t v18 = objc_claimAutoreleasedReturnValue( +[MTEpisode sortDescriptorsForDownloadedDateAscending:]( &OBJC_CLASS___MTEpisode,  "sortDescriptorsForDownloadedDateAscending:",  v20));
          goto LABEL_19;
        case 9LL:
          uint64_t v21 = _MTLogCategoryPlayback(v13, v14);
          id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "Invalid sort type enum MTEpisodeContextSortType_ENUM_COUNT, using default",  buf,  2u);
          }

LABEL_17:
          uint64_t v16 = 0LL;
LABEL_18:
          uint64_t v18 = objc_claimAutoreleasedReturnValue( +[MTEpisode sortDescriptorsForPubDateAscending:]( &OBJC_CLASS___MTEpisode,  "sortDescriptorsForPubDateAscending:",  v16));
LABEL_19:
          id v15 = (void *)v18;
          break;
        default:
          break;
      }

      switch(a4)
      {
        case 2LL:
        case 7LL:
          uint64_t v23 = (NSFetchRequest *)objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForPubDateLimit:]( &OBJC_CLASS___MTEpisode,  "predicateForPubDateLimit:",  a7));
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForListenNowLatestEpisodes]( &OBJC_CLASS___MTEpisode,  "predicateForListenNowLatestEpisodes"));
          v25 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForVisuallyPlayed:]( &OBJC_CLASS___MTEpisode,  "predicateForVisuallyPlayed:",  0LL));
          id v26 = (void *)objc_claimAutoreleasedReturnValue([v24 AND:v25]);
          char v27 = (void *)objc_claimAutoreleasedReturnValue([v26 AND:v23]);

          v28 = objc_alloc(&OBJC_CLASS___NSFetchRequest);
          v29 = -[NSFetchRequest initWithEntityName:](v28, "initWithEntityName:", kMTEpisodeEntityName);
          -[NSFetchRequest setPredicate:](v29, "setPredicate:", v27);
          -[NSFetchRequest setSortDescriptors:](v29, "setSortDescriptors:", v15);
          v17 = -[MTPredicateManifest initWithInitialEpisodeUuid:fetchRequest:]( objc_alloc(&OBJC_CLASS___MTPredicateManifest),  "initWithInitialEpisodeUuid:fetchRequest:",  v12,  v29);

          goto LABEL_31;
        case 3LL:
          uint64_t v30 = objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForDownloaded:excludeHidden:]( &OBJC_CLASS___MTEpisode,  "predicateForDownloaded:excludeHidden:",  1LL,  1LL));
          goto LABEL_27;
        case 8LL:
          uint64_t v30 = objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForBookmarkedEpisodes](&OBJC_CLASS___MTEpisode, "predicateForBookmarkedEpisodes"));
LABEL_27:
          uint64_t v23 = (NSFetchRequest *)v30;
          v37 = -[MTPredicateManifest initWithInitialEpisodeUuid:predicateToTrack:sortDescriptors:]( objc_alloc(&OBJC_CLASS___MTPredicateManifest),  "initWithInitialEpisodeUuid:predicateToTrack:sortDescriptors:",  v12,  v30,  v15);
          goto LABEL_29;
        case 9LL:
          v41 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
          v42 = (void *)objc_claimAutoreleasedReturnValue([v41 mainOrPrivateContext]);

          *(void *)buf = 0LL;
          v58 = buf;
          uint64_t v59 = 0x3032000000LL;
          uint64_t v60 = (uint64_t)sub_1001243F4;
          v61 = sub_100124404;
          id v62 = 0LL;
          v53[0] = _NSConcreteStackBlock;
          v53[1] = 3221225472LL;
          v53[2] = sub_100124FB4;
          v53[3] = &unk_100240558;
          uint64_t v23 = v42;
          v54 = v23;
          id v43 = v12;
          id v55 = v43;
          v56 = buf;
          -[NSFetchRequest performBlockAndWait:](v23, "performBlockAndWait:", v53);
          v44 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForAllEpisodesOnPodcastUuid:includeNonAudioEpisodes:]( &OBJC_CLASS___MTEpisode,  "predicateForAllEpisodesOnPodcastUuid:includeNonAudioEpisodes:",  *((void *)v58 + 5),  1LL));
          v45 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForDownloaded:excludeHidden:]( &OBJC_CLASS___MTEpisode,  "predicateForDownloaded:excludeHidden:",  1LL,  1LL));
          v46 = (void *)objc_claimAutoreleasedReturnValue([v44 AND:v45]);

          v17 = -[MTPredicateManifest initWithInitialEpisodeUuid:predicateToTrack:sortDescriptors:]( objc_alloc(&OBJC_CLASS___MTPredicateManifest),  "initWithInitialEpisodeUuid:predicateToTrack:sortDescriptors:",  v43,  v46,  v15);
          _Block_object_dispose(buf, 8);

          goto LABEL_31;
        case 10LL:
          v38 = objc_alloc(&OBJC_CLASS___NSFetchRequest);
          uint64_t v23 = -[NSFetchRequest initWithEntityName:](v38, "initWithEntityName:", kMTEpisodeEntityName);
          v39 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForPreviouslyPlayedHidingFutureTimestamps]( &OBJC_CLASS___MTEpisode,  "predicateForPreviouslyPlayedHidingFutureTimestamps"));
          -[NSFetchRequest setPredicate:](v23, "setPredicate:", v39);

          v40 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode sortDescriptorsForRecentlyPlayed]( &OBJC_CLASS___MTEpisode,  "sortDescriptorsForRecentlyPlayed"));
          -[NSFetchRequest setSortDescriptors:](v23, "setSortDescriptors:", v40);

          v37 = -[MTPredicateManifest initWithInitialEpisodeUuid:fetchRequest:]( objc_alloc(&OBJC_CLASS___MTPredicateManifest),  "initWithInitialEpisodeUuid:fetchRequest:",  v12,  v23);
LABEL_29:
          v17 = (MTEpisodeManifest *)v37;
LABEL_31:

          break;
        default:
          *(void *)buf = 0LL;
          v58 = buf;
          uint64_t v59 = 0x2020000000LL;
          uint64_t v60 = 9LL;
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
          v32 = (void *)objc_claimAutoreleasedReturnValue([v31 mainOrPrivateContext]);

          v48[0] = _NSConcreteStackBlock;
          v48[1] = 3221225472LL;
          v48[2] = sub_10012500C;
          v48[3] = &unk_1002442B0;
          id v33 = v32;
          id v49 = v33;
          id v34 = v12;
          id v50 = v34;
          v51 = buf;
          int64_t v52 = a4;
          [v33 performBlockAndWait:v48];
          v35 = off_10023E2D0;
          if (a4 != 6) {
            v35 = &off_10023E318;
          }
          id v36 = objc_alloc(*v35);
          v17 = (MTEpisodeManifest *)[v36 initWithInitialEpisodeUuid:v34 sectionType:*((void *)v58 + 3)];

          _Block_object_dispose(buf, 8);
          break;
      }
    }

    else
    {
      v17 = -[MTEpisodeManifest initWithEpisodeUuid:]( objc_alloc(&OBJC_CLASS___MTEpisodeManifest),  "initWithEpisodeUuid:",  v12);
    }
  }

  else
  {
    v17 = 0LL;
  }

  return v17;
}

+ (id)_manifestForPlayMyPodcasts
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 playListenNow]);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }

  else
  {
    if (!+[MTPodcast totalUnplayedCount](&OBJC_CLASS___MTPodcast, "totalUnplayedCount"))
    {
      v5 = 0LL;
      goto LABEL_6;
    }

    v4 = -[MTUnplayedManifest initWithInitialEpisodeUuid:]( objc_alloc(&OBJC_CLASS___MTUnplayedManifest),  "initWithInitialEpisodeUuid:",  0LL);
  }

  v5 = v4;
LABEL_6:

  return v5;
}

+ (id)_manifestForPlayMyLatestPodcasts
{
  v2 = (MTUnplayedManifest *)+[MTPodcast totalUnplayedCount](&OBJC_CLASS___MTPodcast, "totalUnplayedCount");
  if (v2) {
    v2 = -[MTUnplayedManifest initWithInitialEpisodeUuid:newestToOldest:]( objc_alloc(&OBJC_CLASS___MTUnplayedManifest),  "initWithInitialEpisodeUuid:newestToOldest:",  0LL,  1LL);
  }
  return v2;
}

+ (id)_manifestForPlayMyOldestPodcasts
{
  v2 = (MTUnplayedManifest *)+[MTPodcast totalUnplayedCount](&OBJC_CLASS___MTPodcast, "totalUnplayedCount");
  if (v2) {
    v2 = -[MTUnplayedManifest initWithInitialEpisodeUuid:newestToOldest:]( objc_alloc(&OBJC_CLASS___MTUnplayedManifest),  "initWithInitialEpisodeUuid:newestToOldest:",  0LL,  0LL);
  }
  return v2;
}

+ (BOOL)_isContinuousPlaybackEnabledForLimit:(int64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    return 1;
  }
  if (a3 == 1) {
    return 0;
  }
  return MTPlaybackContinuousPlaybackEnabled(a1, a2);
}

+ (id)_episodeToPlayForPodcastUuid:(id)a3 playbackOrder:(int64_t)a4 excludeExplicit:(int64_t)a5 ctx:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  uint64_t v23 = 0LL;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  id v26 = sub_1001243F4;
  char v27 = sub_100124404;
  id v28 = 0LL;
  if (a4 == 2)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( [a1 _oldestEpisodeForPodcastUuid:v10 restrictToUserEpisodes:1 excludeExplicit:a5 ctx:v11]);
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 uuid]);
  }

  else if (a4 == 1)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( [a1 _latestEpisodeForPodcastUuid:v10 restrictToUserEpisodes:0 excludeExplicit:a5 ctx:v11]);
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 uuid]);
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[MTRecencyUtil upNextForPodcastUuid:excludeExplicit:ctx:]( &OBJC_CLASS___MTRecencyUtil,  "upNextForPodcastUuid:excludeExplicit:ctx:",  v10,  a5,  v11));
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 episodeUuid]);
  }

  uint64_t v14 = (void *)v24[5];
  v24[5] = v13;

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1001253C8;
  v19[3] = &unk_100240558;
  id v15 = v11;
  id v20 = v15;
  id v16 = v10;
  id v21 = v16;
  id v22 = &v23;
  [v15 performBlockAndWait:v19];
  id v17 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  return v17;
}

+ (id)_latestEpisodeForPodcastUuid:(id)a3 restrictToUserEpisodes:(BOOL)a4 excludeExplicit:(int64_t)a5 ctx:(id)a6
{
  return _[a1 _latestOrOldestEpisodeForPodcastUuid:a3 restrictToUserEpisodes:a4 excludeExplicit:a5 latest:1 ctx:a6];
}

+ (id)_oldestEpisodeForPodcastUuid:(id)a3 restrictToUserEpisodes:(BOOL)a4 excludeExplicit:(int64_t)a5 ctx:(id)a6
{
  return _[a1 _latestOrOldestEpisodeForPodcastUuid:a3 restrictToUserEpisodes:a4 excludeExplicit:a5 latest:0 ctx:a6];
}

+ (id)_latestOrOldestEpisodeForPodcastUuid:(id)a3 restrictToUserEpisodes:(BOOL)a4 excludeExplicit:(int64_t)a5 latest:(BOOL)a6 ctx:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  if ([v11 length])
  {
    uint64_t v22 = 0LL;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x3032000000LL;
    uint64_t v25 = sub_1001243F4;
    id v26 = sub_100124404;
    id v27 = 0LL;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100125580;
    v15[3] = &unk_1002457C8;
    id v16 = v12;
    BOOL v20 = a4;
    id v17 = v11;
    uint64_t v18 = &v22;
    BOOL v21 = a6;
    int64_t v19 = a5;
    [v16 performBlockAndWait:v15];
    id v13 = (id)v23[5];

    _Block_object_dispose(&v22, 8);
  }

  else
  {
    id v13 = 0LL;
  }

  return v13;
}

+ (id)_uuidForEpisode:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  uint64_t v14 = sub_1001243F4;
  id v15 = sub_100124404;
  id v16 = 0LL;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 managedObjectContext]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10012572C;
  v8[3] = &unk_1002404E0;
  id v10 = &v11;
  id v5 = v3;
  id v9 = v5;
  [v4 performBlockAndWait:v8];

  id v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

@end