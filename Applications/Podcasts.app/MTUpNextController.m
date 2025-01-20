@interface MTUpNextController
+ (id)_encodedUpNextClasses;
+ (id)_filePath;
+ (id)unarchivedIdentifiers;
- (BOOL)containsEpisodeUuid:(id)a3;
- (BOOL)hasItemsInQueue;
- (BOOL)isPlayingFromUpNext;
- (BOOL)moveEpisodeFrom:(unint64_t)a3 to:(unint64_t)a4;
- (MTCoalescableWorkController)saveController;
- (MTPlayerController)playerController;
- (MTUpNextController)initWithPlayerController:(id)a3;
- (NSArray)items;
- (NSMutableArray)playerItems;
- (OS_dispatch_queue)workQueue;
- (id)_encodedUpNext;
- (unint64_t)_currentUpNextIndex;
- (unint64_t)count;
- (unint64_t)upNextOffset;
- (unint64_t)updateCount;
- (void)_reportUpNextChangeType:(id)a3 forPlayerItem:(id)a4 withData:(id)a5;
- (void)_reportUpNextChangeType:(id)a3 forPlayerItems:(id)a4 withData:(id)a5;
- (void)_restoreUpNext;
- (void)_upNextDidChange;
- (void)addEpisodeUuidToPlayNext:(id)a3;
- (void)addEpisodeUuidToUpNext:(id)a3;
- (void)addEpisodeUuidsToPlayNext:(id)a3;
- (void)addEpisodeUuidsToUpNext:(id)a3;
- (void)addPlayerItemToPlayNext:(id)a3;
- (void)addPlayerItemToUpNext:(id)a3;
- (void)addPlayerItemsToPlayNext:(id)a3;
- (void)addPlayerItemsToUpNext:(id)a3;
- (void)beginUpdates;
- (void)clear;
- (void)clearQueueItems;
- (void)endUpdates;
- (void)removeEpisodeAtIndex:(unint64_t)a3;
- (void)removeEpisodesForUuid:(id)a3;
- (void)setPlayerController:(id)a3;
- (void)setPlayerItems:(id)a3;
- (void)setSaveController:(id)a3;
- (void)setUpdateCount:(unint64_t)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation MTUpNextController

- (MTUpNextController)initWithPlayerController:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MTUpNextController;
  v5 = -[MTUpNextController init](&v11, "init");
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("MTUpNextController.workQueue", 0LL);
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v6;

    v8 = -[MTCoalescableWorkController initWithWorkQueue:identifier:]( objc_alloc(&OBJC_CLASS___MTCoalescableWorkController),  "initWithWorkQueue:identifier:",  v5->_workQueue,  @"MTUpNextController.workQueue");
    saveController = v5->_saveController;
    v5->_saveController = v8;

    objc_storeWeak((id *)&v5->_playerController, v4);
    -[MTUpNextController _restoreUpNext](v5, "_restoreUpNext");
  }

  return v5;
}

- (void)addEpisodeUuidToUpNext:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[MTBaseEpisodeListManifest mediaItemForEpisodeWithUUID:]( &OBJC_CLASS___MTBaseEpisodeListManifest,  "mediaItemForEpisodeWithUUID:",  a3));
  -[MTUpNextController addPlayerItemToUpNext:](self, "addPlayerItemToUpNext:", v4);
}

- (void)addEpisodeUuidsToUpNext:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v17 = self;
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v4 count]));
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_super v11 = (void *)objc_claimAutoreleasedReturnValue( +[MTBaseEpisodeListManifest mediaItemForEpisodeWithUUID:]( &OBJC_CLASS___MTBaseEpisodeListManifest,  "mediaItemForEpisodeWithUUID:",  *(void *)(*((void *)&v18 + 1) + 8LL * (void)i)));
          id v12 = [v5 addObject:v11];
          uint64_t v14 = _MTLogCategoryPlayback(v12, v13);
          v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue([v11 title]);
            *(_DWORD *)buf = 138412290;
            v23 = v16;
            _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "Added episode to array to add to Up Next Queue: %@",  buf,  0xCu);
          }
        }

        id v8 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
      }

      while (v8);
    }

    -[MTUpNextController addPlayerItemsToUpNext:](v17, "addPlayerItemsToUpNext:", v5);
  }
}

- (void)addPlayerItemToUpNext:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    [v4 setEditingStyleFlags:3];
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextController playerItems](self, "playerItems"));
    [v6 addObject:v5];

    id v7 = -[MTUpNextController _upNextDidChange](self, "_upNextDidChange");
    uint64_t v9 = _MTLogCategoryPlayback(v7, v8);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v5 title]);
      int v12 = 138412290;
      uint64_t v13 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "Added episode to Up Next Queue: %@",  (uint8_t *)&v12,  0xCu);
    }

    -[MTUpNextController _reportUpNextChangeType:forPlayerItem:withData:]( self,  "_reportUpNextChangeType:forPlayerItem:withData:",  @"add_to_up_next",  v5,  0LL);
  }
}

- (void)addPlayerItemsToUpNext:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * (void)v9) setEditingStyleFlags:3];
          uint64_t v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v7);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextController playerItems](self, "playerItems"));
    [v10 addObjectsFromArray:v5];

    id v11 = -[MTUpNextController _upNextDidChange](self, "_upNextDidChange");
    uint64_t v13 = _MTLogCategoryPlayback(v11, v12);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "Added array of episodes to Up Next Queue",  v15,  2u);
    }

    -[MTUpNextController _reportUpNextChangeType:forPlayerItems:withData:]( self,  "_reportUpNextChangeType:forPlayerItems:withData:",  @"add_multiple_to_up_next",  v5,  0LL);
  }
}

- (void)addEpisodeUuidToPlayNext:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[MTBaseEpisodeListManifest mediaItemForEpisodeWithUUID:]( &OBJC_CLASS___MTBaseEpisodeListManifest,  "mediaItemForEpisodeWithUUID:",  a3));
  -[MTUpNextController addPlayerItemToUpNext:](self, "addPlayerItemToUpNext:", v4);
}

- (void)addEpisodeUuidsToPlayNext:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    __int128 v17 = self;
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v4 count]));
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = (void *)objc_claimAutoreleasedReturnValue( +[MTBaseEpisodeListManifest mediaItemForEpisodeWithUUID:]( &OBJC_CLASS___MTBaseEpisodeListManifest,  "mediaItemForEpisodeWithUUID:",  *(void *)(*((void *)&v18 + 1) + 8LL * (void)i)));
          id v12 = [v5 addObject:v11];
          uint64_t v14 = _MTLogCategoryPlayback(v12, v13);
          v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v11 title]);
            *(_DWORD *)buf = 138412290;
            v23 = v16;
            _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "Added episode to array to add to Up Next Queue: %@",  buf,  0xCu);
          }
        }

        id v8 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
      }

      while (v8);
    }

    -[MTUpNextController addPlayerItemsToPlayNext:](v17, "addPlayerItemsToPlayNext:", v5);
  }
}

- (void)addPlayerItemToPlayNext:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    [v4 setEditingStyleFlags:3];
    if (-[MTUpNextController isPlayingFromUpNext](self, "isPlayingFromUpNext")) {
      id v6 = (char *)-[MTUpNextController _currentUpNextIndex](self, "_currentUpNextIndex") + 1;
    }
    else {
      id v6 = 0LL;
    }
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextController playerItems](self, "playerItems"));
    [v7 insertObject:v5 atIndex:v6];

    id v8 = -[MTUpNextController _upNextDidChange](self, "_upNextDidChange");
    uint64_t v10 = _MTLogCategoryPlayback(v8, v9);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 title]);
      *(_DWORD *)buf = 138412546;
      __int128 v18 = v12;
      __int16 v19 = 2048;
      __int128 v20 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "Added episode to Play Next \bQueue: %@ at index: %lu",  buf,  0x16u);
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v6,  @"index"));
    __int128 v16 = v13;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
    -[MTUpNextController _reportUpNextChangeType:forPlayerItem:withData:]( self,  "_reportUpNextChangeType:forPlayerItem:withData:",  @"add_to_play_next",  v5,  v14);
  }
}

- (void)addPlayerItemsToPlayNext:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v20;
      do
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)v9), "setEditingStyleFlags:", 3, (void)v19);
          uint64_t v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }

      while (v7);
    }

    if (-[MTUpNextController isPlayingFromUpNext](self, "isPlayingFromUpNext")) {
      uint64_t v10 = (char *)-[MTUpNextController _currentUpNextIndex](self, "_currentUpNextIndex") + 1;
    }
    else {
      uint64_t v10 = 0LL;
    }
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexSet indexSetWithIndexesInRange:]( NSIndexSet,  "indexSetWithIndexesInRange:",  v10,  objc_msgSend(v5, "count", (void)v19)));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextController playerItems](self, "playerItems"));
    [v12 insertObjects:v5 atIndexes:v11];

    id v13 = -[MTUpNextController _upNextDidChange](self, "_upNextDidChange");
    uint64_t v15 = _MTLogCategoryPlayback(v13, v14);
    __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v26 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "Added array of episodes to Play Next Queue at index: %lu",  buf,  0xCu);
    }

    v23 = @"starting_index";
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v10));
    v24 = v17;
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
    -[MTUpNextController _reportUpNextChangeType:forPlayerItems:withData:]( self,  "_reportUpNextChangeType:forPlayerItems:withData:",  @"add_multiple_to_play_next",  v5,  v18);
  }
}

- (BOOL)containsEpisodeUuid:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextController playerItems](self, "playerItems"));
  id v6 = [v5 copy];

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * (void)i), "episodeUuid", (void)v14));
        unsigned __int8 v12 = [v11 isEqualToString:v4];

        if ((v12 & 1) != 0)
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }

      id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

- (void)removeEpisodeAtIndex:(unint64_t)a3
{
  if (-[MTUpNextController count](self, "count") > a3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextController playerItems](self, "playerItems"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:a3]);

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextController playerItems](self, "playerItems"));
    [v7 removeObjectAtIndex:a3];

    id v8 = -[MTUpNextController _upNextDidChange](self, "_upNextDidChange");
    uint64_t v10 = _MTLogCategoryPlayback(v8, v9);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v6 title]);
      *(_DWORD *)buf = 138412546;
      __int128 v18 = v12;
      __int16 v19 = 2048;
      unint64_t v20 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "Removed item from Up Next Controller items: %@ from index: %lu",  buf,  0x16u);
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  a3,  @"index"));
    __int128 v16 = v13;
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
    -[MTUpNextController _reportUpNextChangeType:forPlayerItem:withData:]( self,  "_reportUpNextChangeType:forPlayerItem:withData:",  @"remove_index",  v6,  v14);
  }

- (void)removeEpisodesForUuid:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextController playerItems](self, "playerItems"));
  __int128 v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  __int128 v18 = sub_1000B01C4;
  __int16 v19 = &unk_100243848;
  id v20 = v4;
  __int128 v21 = self;
  id v6 = v4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 indexesOfObjectsPassingTest:&v16]);

  if (objc_msgSend(v7, "firstIndex", v16, v17, v18, v19) != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextController playerItems](self, "playerItems"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v7, "firstIndex")));

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextController playerItems](self, "playerItems"));
    [v10 removeObjectsAtIndexes:v7];

    id v11 = -[MTUpNextController _upNextDidChange](self, "_upNextDidChange");
    uint64_t v13 = _MTLogCategoryPlayback(v11, v12);
    __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v9 title]);
      *(_DWORD *)buf = 138412290;
      v23 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "Removed item from Up Next Controller items: %@",  buf,  0xCu);
    }

    -[MTUpNextController _reportUpNextChangeType:forPlayerItem:withData:]( self,  "_reportUpNextChangeType:forPlayerItem:withData:",  @"remove_uuid",  v9,  0LL);
  }
}

- (BOOL)moveEpisodeFrom:(unint64_t)a3 to:(unint64_t)a4
{
  if (-[MTUpNextController count](self, "count") <= a3) {
    return 0;
  }
  unint64_t v7 = -[MTUpNextController count](self, "count");
  BOOL result = 0;
  if (a3 != a4 && v7 > a4)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextController playerItems](self, "playerItems"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndex:a3]);

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextController playerItems](self, "playerItems"));
    [v11 removeObjectAtIndex:a3];

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextController playerItems](self, "playerItems"));
    [v12 insertObject:v10 atIndex:a4];

    id v13 = -[MTUpNextController _upNextDidChange](self, "_upNextDidChange");
    uint64_t v15 = _MTLogCategoryPlayback(v13, v14);
    __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v10 title]);
      *(_DWORD *)buf = 138412802;
      v24 = v17;
      __int16 v25 = 2048;
      unint64_t v26 = a3;
      __int16 v27 = 2048;
      unint64_t v28 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "Moved episode %@ in Up Next Controller items from index %lu to index %lu",  buf,  0x20u);
    }

    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  a3,  @"from"));
    v21[1] = @"to";
    v22[0] = v18;
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
    v22[1] = v19;
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  2LL));
    -[MTUpNextController _reportUpNextChangeType:forPlayerItem:withData:]( self,  "_reportUpNextChangeType:forPlayerItem:withData:",  @"move",  v10,  v20);

    return 1;
  }

  return result;
}

- (void)clear
{
  id v3 = -[MTUpNextController count](self, "count");
  if (v3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextController playerItems](self, "playerItems"));
    [v5 removeAllObjects];

    id v3 = -[MTUpNextController _upNextDidChange](self, "_upNextDidChange");
  }

  uint64_t v6 = _MTLogCategoryPlayback(v3, v4);
  unint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "Cleared all items from Up Next Controller items",  v8,  2u);
  }
}

- (void)clearQueueItems
{
  id v3 = -[MTUpNextController count](self, "count");
  if (v3)
  {
    unsigned int v5 = -[MTUpNextController isPlayingFromUpNext](self, "isPlayingFromUpNext");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextController playerItems](self, "playerItems"));
    unint64_t v7 = v6;
    if (v5)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_1000B0610;
      v13[3] = &unk_100243870;
      v13[4] = self;
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 indexesOfObjectsPassingTest:v13]);

      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextController playerItems](self, "playerItems"));
      [v9 removeObjectsAtIndexes:v8];
    }

    else
    {
      [v6 removeAllObjects];
    }

    id v3 = -[MTUpNextController _upNextDidChange](self, "_upNextDidChange");
  }

  uint64_t v10 = _MTLogCategoryPlayback(v3, v4);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "Cleared all queued items from Up Next Controller items, leaving currently playing if applicable",  v12,  2u);
  }
}

- (BOOL)isPlayingFromUpNext
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextController playerController](self, "playerController"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 compositeManifest]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v2 upNextManifest]);
  unsigned __int8 v5 = [v3 isPlayingFromManifest:v4];

  return v5;
}

- (unint64_t)upNextOffset
{
  return -[MTUpNextController isPlayingFromUpNext](self, "isPlayingFromUpNext");
}

- (BOOL)hasItemsInQueue
{
  unint64_t v3 = -[MTUpNextController count](self, "count");
  return v3 > -[MTUpNextController upNextOffset](self, "upNextOffset");
}

- (void)beginUpdates
{
}

- (void)endUpdates
{
  if (!-[MTUpNextController updateCount](self, "updateCount")) {
    -[MTUpNextController _upNextDidChange](self, "_upNextDidChange");
  }
}

- (NSArray)items
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextController playerItems](self, "playerItems"));
  id v3 = [v2 copy];

  return (NSArray *)v3;
}

- (unint64_t)count
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextController playerItems](self, "playerItems"));
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (unint64_t)_currentUpNextIndex
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextController playerController](self, "playerController"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 upNextManifest]);
  id v4 = [v3 currentIndex];

  return (unint64_t)v4;
}

- (void)_reportUpNextChangeType:(id)a3 forPlayerItem:(id)a4 withData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MTUpNextController workQueue](self, "workQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000B0914;
  v15[3] = &unk_100240C10;
  id v16 = v8;
  id v17 = v10;
  __int128 v18 = self;
  id v19 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)_reportUpNextChangeType:(id)a3 forPlayerItems:(id)a4 withData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MTUpNextController workQueue](self, "workQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000B0ABC;
  v15[3] = &unk_100240C10;
  id v16 = v8;
  id v17 = v10;
  __int128 v18 = self;
  id v19 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (id)_encodedUpNext
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextController playerItems](self, "playerItems"));
  id v5 = [v4 copy];

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)v10);
        id v12 = (void *)objc_claimAutoreleasedReturnValue( +[MTPlaybackIdentifierUtil sharedInstance]( &OBJC_CLASS___MTPlaybackIdentifierUtil,  "sharedInstance",  (void)v15));
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 requestIdentifierForPlayerItem:v11]);

        [v3 addObject:v13];
        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v8);
  }

  return v3;
}

+ (id)_encodedUpNextClasses
{
  if (qword_1002B6AD8 != -1) {
    dispatch_once(&qword_1002B6AD8, &stru_100243890);
  }
  return (id)qword_1002B6AD0;
}

- (void)_upNextDidChange
{
  if (!-[MTUpNextController updateCount](self, "updateCount"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 postNotificationName:@"MTUpNextControllerItemsDidChange" object:self];

    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextController saveController](self, "saveController"));
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1000B0E90;
    v5[3] = &unk_10023FF98;
    v5[4] = self;
    [v4 schedule:v5];
  }

+ (id)unarchivedIdentifiers
{
  id v3 = [(id)objc_opt_class(a1) _encodedUpNextClasses];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = [(id)objc_opt_class(a1) _filePath];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v6));
  uint64_t v13 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v4,  v7,  &v13));
  uint64_t v9 = v13;

  if (v8) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10) {
    id v11 = [v8 copy];
  }
  else {
    id v11 = &__NSArray0__struct;
  }

  return v11;
}

- (void)_restoreUpNext
{
  uint64_t v3 = _MTLogCategoryPlayback(self, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Restoring Up Next", buf, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  -[MTUpNextController setPlayerItems:](self, "setPlayerItems:", v5);

  id v6 = [(id)objc_opt_class(self) unarchivedIdentifiers];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v9 = _MTLogCategoryPlayback(v7, v8);
  BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "Up Next Controller items after restore:",  buf,  2u);
  }

  *(void *)buf = 0LL;
  id v14 = buf;
  uint64_t v15 = 0x2020000000LL;
  char v16 = 0;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlaybackIdentifierUtil sharedInstance](&OBJC_CLASS___MTPlaybackIdentifierUtil, "sharedInstance"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000B1178;
  v12[3] = &unk_1002438B8;
  v12[4] = self;
  v12[5] = buf;
  [v11 fetchPlayerItemsForPlaybackQueueRequestIdentifiers:v7 completion:v12];

  v14[24] = 1;
  _Block_object_dispose(buf, 8);
}

+ (id)_filePath
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTConstants sharedDocumentsDirectory](&OBJC_CLASS___MTConstants, "sharedDocumentsDirectory"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 URLByAppendingPathComponent:@"upnext_items.data"]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);
  return v4;
}

- (MTPlayerController)playerController
{
  return (MTPlayerController *)objc_loadWeakRetained((id *)&self->_playerController);
}

- (void)setPlayerController:(id)a3
{
}

- (NSMutableArray)playerItems
{
  return self->_playerItems;
}

- (void)setPlayerItems:(id)a3
{
}

- (unint64_t)updateCount
{
  return self->_updateCount;
}

- (void)setUpdateCount:(unint64_t)a3
{
  self->_updateCount = a3;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (MTCoalescableWorkController)saveController
{
  return self->_saveController;
}

- (void)setSaveController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end