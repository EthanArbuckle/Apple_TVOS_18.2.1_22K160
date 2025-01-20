@interface MTPlaylist
+ (id)containerOrderOptionArray:(BOOL)a3;
+ (id)containerOrderOptionValues;
+ (id)insertNewPlaylistInManagedObjectContext:(id)a3;
+ (id)insertNewPlaylistInManagedObjectContext:(id)a3 uuid:(id)a4 defaultSettings:(id)a5;
+ (id)predicateForFlag:(int)a3 isTrue:(BOOL)a4;
+ (id)predicateForMediaLibraryId:(int64_t)a3;
+ (id)predicateForVisiblePlaylistWithUUID:(id)a3;
+ (id)stringForContainerOrder:(int)a3 short:(BOOL)a4;
+ (id)topLevelPlaylistsExcludingFoldersPredicate;
+ (int64_t)getITunesPlaylistsCount;
- (BOOL)hasBeenSynced;
- (BOOL)includesAllPodcasts;
- (BOOL)isBuiltIn;
- (BOOL)isEditable;
- (BOOL)isFolder;
- (BOOL)isItunesPlaylist;
- (BOOL)isItunesSmartPlaylist;
- (BOOL)isUngroupedList;
- (BOOL)updateUnplayedCount;
- (MTEpisode)nextEpisode;
- (double)totalDuration;
- (id)metricsAdditionalData;
- (id)metricsContentIdentifier;
- (id)podcasts;
- (int64_t)getFolderSubPlaylistsCount;
- (void)forceUpdate;
- (void)recalculateEpisodeCounts;
- (void)removeEpisode:(id)a3;
- (void)removeEpisode:(id)a3 inBulkTransaction:(BOOL)a4;
- (void)removeEpisodes:(id)a3;
- (void)removePodcast:(id)a3;
- (void)removePodcastEpisodes:(id)a3 shouldSave:(BOOL)a4;
- (void)setEpisodes:(id)a3;
- (void)setHasBeenSynced:(BOOL)a3;
- (void)setIncludesAllPodcasts:(BOOL)a3;
- (void)setIsBuiltIn:(BOOL)a3;
- (void)setIsFolder:(BOOL)a3;
- (void)setIsItunesPlaylist:(BOOL)a3;
- (void)setIsItunesSmartPlaylist:(BOOL)a3;
- (void)setIsUngroupedList:(BOOL)a3;
- (void)setPodcasts:(id)a3;
@end

@implementation MTPlaylist

+ (id)insertNewPlaylistInManagedObjectContext:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[MTPodcastPlaylistSettings insertNewSettingsInManagedObjectContext:]( &OBJC_CLASS___MTPodcastPlaylistSettings,  "insertNewSettingsInManagedObjectContext:",  v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString UUID](&OBJC_CLASS___NSString, "UUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 insertNewPlaylistInManagedObjectContext:v4 uuid:v6 defaultSettings:v5]);

  return v7;
}

+ (id)insertNewPlaylistInManagedObjectContext:(id)a3 uuid:(id)a4 defaultSettings:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "insertNewObjectForEntityForName:inManagedObjectContext:",  kMTPlaylistEntityName,  v8));
  if (!v10) {
    id v10 = (id)objc_claimAutoreleasedReturnValue( +[MTPodcastPlaylistSettings insertNewSettingsInManagedObjectContext:]( &OBJC_CLASS___MTPodcastPlaylistSettings,  "insertNewSettingsInManagedObjectContext:",  v8));
  }
  [v11 setUuid:v9];
  [v11 setDefaultSettings:v10];
  [v11 setNeedsUpdate:1];
  [v11 setIsUngroupedList:1];
  uint64_t v12 = kPlaylistSortOrder;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate truePredicate](&OBJC_CLASS___NSPredicate, "truePredicate"));
  v14 = (void *)objc_claimAutoreleasedReturnValue( [a1 aggregateOperation:@"max:" attribute:v12 predicate:v13 managedObjectContext:v8]);

  objc_msgSend(v11, "setSortOrder:", (char *)objc_msgSend(v14, "integerValue") + 1);
  [a1 prepareForPlatform:v11];

  return v11;
}

- (void)setPodcasts:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylist settings](self, "settings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForKey:kPlaylistSettingPodcast]);

  if (([v6 isEqualToOrderedSet:v4] & 1) == 0)
  {
    id v18 = [v4 mutableCopy];
    [v18 minusOrderedSet:v6];
    v19 = v6;
    id v7 = [v6 mutableCopy];
    id v20 = v4;
    [v7 minusOrderedSet:v4];
    id v8 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylist settings](self, "settings"));
    id v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v25;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue([v14 podcast]);
          unsigned int v16 = [v7 containsObject:v15];

          if (v16) {
            -[NSMutableSet addObject:](v8, "addObject:", v14);
          }
        }

        id v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }

      while (v11);
    }

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10008F988;
    v23[3] = &unk_100242E30;
    v23[4] = self;
    -[NSMutableSet enumerateObjectsUsingBlock:](v8, "enumerateObjectsUsingBlock:", v23);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10008F9D4;
    v21[3] = &unk_100242E58;
    v21[4] = self;
    id v22 = (id)objc_claimAutoreleasedReturnValue(-[MTPlaylist defaultSettings](self, "defaultSettings"));
    id v17 = v22;
    [v18 enumerateObjectsUsingBlock:v21];

    v6 = v19;
    id v4 = v20;
  }
}

- (void)setEpisodes:(id)a3
{
  id v7 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylist episodes](self, "episodes"));
  unsigned __int8 v5 = [v7 isEqualToOrderedSet:v4];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = kPlaylistEpisodes;
    -[MTPlaylist willChangeValueForKey:](self, "willChangeValueForKey:", kPlaylistEpisodes);
    -[MTPlaylist setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v7, v6);
    -[MTPlaylist didChangeValueForKey:](self, "didChangeValueForKey:", v6);
  }
}

- (id)podcasts
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylist settings](self, "settings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 valueForKey:kPlaylistSettingPodcast]);

  return v3;
}

- (void)setIsFolder:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = (unint64_t)-[MTPlaylist flags](self, "flags");
  if (((((v5 & 1) == 0) ^ v3) & 1) == 0) {
    -[MTPlaylist setFlags:](self, "setFlags:", v5 & 0xFFFFFFFFFFFFFFFELL | v3);
  }
}

- (BOOL)isFolder
{
  return -[MTPlaylist flags](self, "flags") & 1;
}

- (void)setIsItunesPlaylist:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = (unint64_t)-[MTPlaylist flags](self, "flags");
  if (((((v5 & 2) == 0) ^ v3) & 1) == 0)
  {
    uint64_t v6 = 2LL;
    if (!v3) {
      uint64_t v6 = 0LL;
    }
    -[MTPlaylist setFlags:](self, "setFlags:", v5 & 0xFFFFFFFFFFFFFFFDLL | v6);
  }

- (BOOL)isItunesPlaylist
{
  return ((unint64_t)-[MTPlaylist flags](self, "flags") >> 1) & 1;
}

- (void)setIsBuiltIn:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = (unint64_t)-[MTPlaylist flags](self, "flags");
  if (((((v5 & 8) == 0) ^ v3) & 1) == 0)
  {
    uint64_t v6 = 8LL;
    if (!v3) {
      uint64_t v6 = 0LL;
    }
    -[MTPlaylist setFlags:](self, "setFlags:", v5 & 0xFFFFFFFFFFFFFFF7LL | v6);
  }

- (BOOL)isBuiltIn
{
  return ((unint64_t)-[MTPlaylist flags](self, "flags") >> 3) & 1;
}

- (void)setIncludesAllPodcasts:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = (unint64_t)-[MTPlaylist flags](self, "flags");
  if (((((v5 & 0x10) == 0) ^ v3) & 1) == 0)
  {
    uint64_t v6 = 16LL;
    if (!v3) {
      uint64_t v6 = 0LL;
    }
    -[MTPlaylist setFlags:](self, "setFlags:", v5 & 0xFFFFFFFFFFFFFFEFLL | v6);
  }

- (BOOL)includesAllPodcasts
{
  return ((unint64_t)-[MTPlaylist flags](self, "flags") >> 4) & 1;
}

- (BOOL)isItunesSmartPlaylist
{
  return ((unint64_t)-[MTPlaylist flags](self, "flags") >> 7) & 1;
}

- (void)setIsItunesSmartPlaylist:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = (unint64_t)-[MTPlaylist flags](self, "flags");
  if (((((v5 & 0x80) == 0) ^ v3) & 1) == 0)
  {
    uint64_t v6 = 128LL;
    if (!v3) {
      uint64_t v6 = 0LL;
    }
    -[MTPlaylist setFlags:](self, "setFlags:", v5 & 0xFFFFFFFFFFFFFF7FLL | v6);
  }

- (BOOL)isUngroupedList
{
  return ((unint64_t)-[MTPlaylist flags](self, "flags") >> 8) & 1;
}

- (void)setIsUngroupedList:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = (unint64_t)-[MTPlaylist flags](self, "flags");
  if (((((v5 & 0x100) == 0) ^ v3) & 1) == 0)
  {
    uint64_t v6 = 256LL;
    if (!v3) {
      uint64_t v6 = 0LL;
    }
    -[MTPlaylist setFlags:](self, "setFlags:", v5 & 0xFFFFFFFFFFFFFEFFLL | v6);
  }

- (void)forceUpdate
{
}

- (BOOL)isEditable
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylist uuid](self, "uuid"));
  char v3 = [v2 isEqualToString:kPlaylistITunesPlaylistUuid] ^ 1;

  return v3;
}

- (BOOL)updateUnplayedCount
{
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  char v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylist episodes](self, "episodes", 0LL));
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0LL;
    id v7 = 0LL;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v3);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        v6 += [v10 isPlayed] ^ 1;
        if ([v10 persistentID]) {
          ++v7;
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v5);
  }

  else
  {
    uint64_t v6 = 0LL;
    id v7 = 0LL;
  }

  id v11 = (char *)-[MTPlaylist unplayedCount](self, "unplayedCount");
  BOOL v12 = v11 != v6;
  if (v11 != v6) {
    -[MTPlaylist setUnplayedCount:](self, "setUnplayedCount:", v6);
  }
  if (-[MTPlaylist downloadedCount](self, "downloadedCount") != v7)
  {
    -[MTPlaylist setDownloadedCount:](self, "setDownloadedCount:", v7);
    return 1;
  }

  return v12;
}

- (void)setHasBeenSynced:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = (unint64_t)-[MTPlaylist flags](self, "flags");
  if (((((v5 & 0x40) == 0) ^ v3) & 1) == 0)
  {
    uint64_t v6 = 64LL;
    if (!v3) {
      uint64_t v6 = 0LL;
    }
    -[MTPlaylist setFlags:](self, "setFlags:", v5 & 0xFFFFFFFFFFFFFFBFLL | v6);
  }

- (BOOL)hasBeenSynced
{
  return ((unint64_t)-[MTPlaylist flags](self, "flags") >> 6) & 1;
}

- (void)recalculateEpisodeCounts
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylist episodes](self, "episodes", 0LL));
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0LL;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 += [*(id *)(*((void *)&v9 + 1) + 8 * (void)i) isPlayed] ^ 1;
      }

      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v5);
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  -[MTPlaylist setUnplayedCount:](self, "setUnplayedCount:", v6);
}

- (void)removePodcast:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylist managedObjectContext](self, "managedObjectContext"));
  uint64_t v17 = 0LL;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  id v20 = sub_1000902F4;
  v21 = sub_100090304;
  id v22 = 0LL;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylist settings](self, "settings"));
  __int128 v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  v13 = sub_10009030C;
  __int128 v14 = &unk_100242C00;
  id v7 = v4;
  id v15 = v7;
  __int128 v16 = &v17;
  [v6 enumerateObjectsUsingBlock:&v11];

  if (v18[5]) {
    objc_msgSend(v5, "deleteObject:", v11, v12, v13, v14);
  }
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[MTPlaylist mutableSetValueForKey:]( self,  "mutableSetValueForKey:",  kPlaylistDeletedEpisodes,  v11,  v12,  v13,  v14));
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v7 episodes]);
  [v8 minusSet:v9];

  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylist mutableOrderedSetValueForKey:](self, "mutableOrderedSetValueForKey:", kPlaylistPodcasts));
  [v10 removeObject:v7];

  -[MTPlaylist setNeedsUpdate:](self, "setNeedsUpdate:", 1LL);
  _Block_object_dispose(&v17, 8);
}

- (void)removePodcastEpisodes:(id)a3 shouldSave:(BOOL)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100090460;
  v8[3] = &unk_100242E80;
  __int128 v9 = self;
  id v10 = a3;
  BOOL v12 = a4;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[MTPlaylist managedObjectContext](v9, "managedObjectContext"));
  id v5 = v11;
  id v7 = v10;
  [v5 performBlockAndWait:v8];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](&OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  [v6 setIsPlaylistSyncDirty:1];
}

- (void)removeEpisodes:(id)a3
{
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        -[MTPlaylist removeEpisode:inBulkTransaction:]( self,  "removeEpisode:inBulkTransaction:",  *(void *)(*((void *)&v13 + 1) + 8LL * (void)v8),  1LL);
        uint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v6);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000907F4;
  v11[3] = &unk_10023FF98;
  id v12 = (id)objc_claimAutoreleasedReturnValue(-[MTPlaylist managedObjectContext](self, "managedObjectContext"));
  id v9 = v12;
  [v9 performBlockAndWait:v11];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](&OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  [v10 setIsPlaylistSyncDirty:1];
}

- (void)removeEpisode:(id)a3
{
}

- (void)removeEpisode:(id)a3 inBulkTransaction:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylist managedObjectContext](self, "managedObjectContext"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000908DC;
  v11[3] = &unk_100242E80;
  void v11[4] = self;
  id v10 = v6;
  id v12 = v10;
  BOOL v14 = a4;
  id v8 = v7;
  id v13 = v8;
  [v8 performBlockAndWait:v11];
  if (!a4)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](&OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
    [v9 setIsPlaylistSyncDirty:1];
  }
}

- (double)totalDuration
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylist episodes](self, "episodes", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    double v6 = 0.0;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)i) duration];
        double v6 = v6 + v8;
      }

      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v4);
  }

  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (MTEpisode)nextEpisode
{
  if (-[MTPlaylist isFolder](self, "isFolder"))
  {
    id v3 = 0LL;
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylist episodes](self, "episodes"));
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
  }

  return (MTEpisode *)v3;
}

- (int64_t)getFolderSubPlaylistsCount
{
  uint64_t v11 = 0LL;
  __int128 v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  uint64_t v14 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 mainOrPrivateContext]);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100090B9C;
  v8[3] = &unk_100240558;
  void v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  __int128 v10 = &v11;
  [v5 performBlockAndWait:v8];
  int64_t v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

+ (int64_t)getITunesPlaylistsCount
{
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  uint64_t v13 = 0LL;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 mainOrPrivateContext]);

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100090D54;
  v7[3] = &unk_1002409A8;
  id v4 = v3;
  id v8 = v4;
  id v9 = &v10;
  [v4 performBlockAndWait:v7];
  int64_t v5 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v5;
}

+ (id)stringForContainerOrder:(int)a3 short:(BOOL)a4
{
  switch(a3)
  {
    case 0:
      id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      int64_t v5 = v4;
      if (a4) {
        int64_t v6 = @"MY_PODCASTS_ORDER_SHORT";
      }
      else {
        int64_t v6 = @"My Podcasts Order";
      }
      goto LABEL_9;
    case 1:
      id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      int64_t v5 = v4;
      int64_t v6 = @"Newest To Oldest";
      goto LABEL_9;
    case 2:
      id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      int64_t v5 = v4;
      int64_t v6 = @"Manual";
      goto LABEL_9;
    case 3:
      id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      int64_t v5 = v4;
      int64_t v6 = @"Oldest To Newest";
      goto LABEL_9;
    case 4:
    case 5:
      id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      int64_t v5 = v4;
      int64_t v6 = @"STATION_SORT_BY_SHOW_TITLE";
LABEL_9:
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:v6 value:&stru_100248948 table:0]);

      break;
    default:
      uint64_t v7 = 0LL;
      break;
  }

  return v7;
}

+ (id)containerOrderOptionArray:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 stringForContainerOrder:0 short:a3]);
  int64_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stringForContainerOrder:short:", 1, v3, v5));
  v12[1] = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a1 stringForContainerOrder:3 short:v3]);
  v12[2] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 stringForContainerOrder:2 short:v3]);
  v12[3] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 stringForContainerOrder:4 short:v3]);
  v12[4] = v9;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 5LL));

  return v10;
}

+ (id)containerOrderOptionValues
{
  return +[NSOrderedSet orderedSetWithArray:](&OBJC_CLASS___NSOrderedSet, "orderedSetWithArray:", &off_100255200);
}

+ (id)topLevelPlaylistsExcludingFoldersPredicate
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([a1 topLevelPlaylistsPredicate]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForFlag:0 isTrue:0]);
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 AND:v4]);

  return v5;
}

+ (id)predicateForFlag:(int)a3 isTrue:(BOOL)a4
{
  uint64_t v4 = (1 << a3);
  if (a4) {
    int64_t v5 = @"%K != NULL && (%K & %d) != 0";
  }
  else {
    int64_t v5 = @"%K == NULL || (%K & %d) == 0";
  }
  return (id)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  v5,  kPlaylistFlags,  kPlaylistFlags,  v4));
}

+ (id)predicateForVisiblePlaylistWithUUID:(id)a3
{
  return +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K == %@ && %K == 0",  kPlaylistUuid,  a3,  kPlaylistHidden);
}

+ (id)predicateForMediaLibraryId:(int64_t)a3
{
  uint64_t v3 = kPlaylistMediaLibraryId;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = %@",  v3,  v4));

  return v5;
}

- (id)metricsContentIdentifier
{
  if (-[MTPlaylist isBuiltIn](self, "isBuiltIn")) {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylist uuid](self, "uuid"));
  }
  else {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylist title](self, "title"));
  }
  return v3;
}

- (id)metricsAdditionalData
{
  v22[0] = kPlaylistMediaLibraryId;
  v22[1] = kPlaylistIsFolder;
  v22[2] = kPlaylistUngroupedList;
  v22[3] = kPlaylistIncludesAllPodcasts;
  v22[4] = kPlaylistContainerOrder;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 5LL));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylist dictionaryWithValuesForKeys:](self, "dictionaryWithValuesForKeys:", v17));
  id v4 = [v3 mutableCopy];

  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylist defaultSettings](self, "defaultSettings"));
  int64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 metricsKeys]);
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v5 dictionaryWithValuesForKeys:v6]);

  [v4 addEntriesFromDictionary:v16];
  v20[0] = @"settings";
  v20[1] = @"counts";
  v21[0] = v4;
  v18[0] = @"episodes";
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylist episodes](self, "episodes"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v7 count]));
  v19[0] = v8;
  v18[1] = @"podcasts";
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylist podcasts](self, "podcasts"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v9 count]));
  v19[1] = v10;
  v18[2] = @"deletedEpisodes";
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylist deletedEpisodes](self, "deletedEpisodes"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v11 count]));
  v19[2] = v12;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  3LL));
  v21[1] = v13;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  2LL));

  return v14;
}

@end