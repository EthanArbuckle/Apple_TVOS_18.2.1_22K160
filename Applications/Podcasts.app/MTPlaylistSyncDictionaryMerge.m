@interface MTPlaylistSyncDictionaryMerge
+ (void)mergeArray:(id)a3 fromArray:(id)a4 lookupKey:(id)a5 updateBlock:(id)a6 insertBlock:(id)a7 deleteBlock:(id)a8;
- (BOOL)refreshContentsOfUpdatedOrInsertedPlaylists;
- (BOOL)syncMergeIsFromCloud;
- (MTPlaylistSyncDictionaryMerge)initWithLoggingCategory:(id)a3 dictionariesToMerge:(id)a4;
- (NSArray)dictionariesToMerge;
- (OS_os_log)loggingCategory;
- (id)canDeletePlaylistUUIDBlock;
- (void)_addSetting:(id)a3 syncObj:(id)a4 playlist:(id)a5;
- (void)_applyOrderingInSyncDictionary:(id)a3 playlist:(id)a4;
- (void)_mergeSetting:(id)a3 syncObj:(id)a4;
- (void)performAndWaitWithContext:(id)a3 save:(BOOL)a4;
- (void)setCanDeletePlaylistUUIDBlock:(id)a3;
- (void)setRefreshContentsOfUpdatedOrInsertedPlaylists:(BOOL)a3;
- (void)setSyncMergeIsFromCloud:(BOOL)a3;
@end

@implementation MTPlaylistSyncDictionaryMerge

- (MTPlaylistSyncDictionaryMerge)initWithLoggingCategory:(id)a3 dictionariesToMerge:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MTPlaylistSyncDictionaryMerge;
  v9 = -[MTPlaylistSyncDictionaryMerge init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_loggingCategory, a3);
    objc_storeStrong((id *)&v10->_dictionariesToMerge, a4);
    v10->_syncMergeIsFromCloud = 1;
  }

  return v10;
}

- (void)performAndWaitWithContext:(id)a3 save:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v35 = self;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSyncDictionaryMerge loggingCategory](self, "loggingCategory"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSyncDictionaryMerge dictionariesToMerge](self, "dictionariesToMerge"));
  unsigned int v9 = -[MTPlaylistSyncDictionaryMerge refreshContentsOfUpdatedOrInsertedPlaylists]( self,  "refreshContentsOfUpdatedOrInsertedPlaylists");
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472LL;
  v55[2] = sub_1000B6CEC;
  v55[3] = &unk_100243A08;
  v55[4] = self;
  v10 = objc_retainBlock(v55);
  v11 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  objc_super v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v53[0] = 0LL;
  v53[1] = v53;
  v53[2] = 0x3032000000LL;
  v53[3] = sub_1000B6D64;
  v53[4] = sub_1000B6D74;
  v54 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  v13 = v7;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v14 = [v8 count];
    *(_DWORD *)buf = 67109120;
    LODWORD(v57) = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "merging %d playlists", buf, 8u);
  }

  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472LL;
  v51[2] = sub_1000B6D7C;
  v51[3] = &unk_100243A30;
  id v15 = v6;
  id v52 = v15;
  v29 = objc_retainBlock(v51);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_1000B6D8C;
  v42[3] = &unk_100243B48;
  id v32 = v15;
  id v43 = v32;
  v44 = v35;
  id v26 = v8;
  id v45 = v26;
  v33 = v13;
  v46 = v33;
  v50 = v53;
  v28 = v11;
  v47 = v28;
  v34 = v12;
  v48 = v34;
  v27 = v10;
  id v49 = v27;
  ((void (*)(void *, BOOL, void *))v29[2])(v29, v4, v42);
  if (v9)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MTBaseProcessor sharedInstance](&OBJC_CLASS___MTPlaylistQueryManager, "sharedInstance"));
    context = objc_autoreleasePoolPush();
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    obj = v28;
    id v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v38,  v60,  16LL);
    if (v17)
    {
      uint64_t v18 = *(void *)v39;
      uint64_t v30 = kPlaylistTitle;
      do
      {
        for (i = 0LL; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v39 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = *(void *)(*((void *)&v38 + 1) + 8LL * (void)i);
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v34, "objectForKeyedSubscript:", v20));
          v22 = v33;
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue([v21 valueForKey:v30]);
            *(_DWORD *)buf = 138543618;
            uint64_t v57 = v20;
            __int16 v58 = 2112;
            v59 = v23;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "sync processor is refreshing playlist (uuid=%{public}@ - title='%@')",  buf,  0x16u);
          }

          v36[0] = _NSConcreteStackBlock;
          v36[1] = 3221225472LL;
          v36[2] = sub_1000B79CC;
          v36[3] = &unk_100243B70;
          v36[4] = v35;
          id v24 = v21;
          id v37 = v24;
          [v16 updatePlaylistWithUuid:v20 inContext:v32 applyAdditionalChangesBlock:v36];
        }

        id v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v38,  v60,  16LL);
      }

      while (v17);
    }

    objc_autoreleasePoolPop(context);
  }

  _Block_object_dispose(v53, 8);
}

- (void)_applyOrderingInSyncDictionary:(id)a3 playlist:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSyncDictionaryMerge loggingCategory](self, "loggingCategory"));
  if ([v7 isUngroupedList] && objc_msgSend(v7, "containerOrder") == 2)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"episodeSortOrderArray"]);
    if ([v8 count])
    {
      id v39 = v6;
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      __int128 v50 = 0u;
      __int128 v51 = 0u;
      __int128 v52 = 0u;
      __int128 v53 = 0u;
      __int128 v38 = v8;
      id v10 = v8;
      id v43 = [v10 countByEnumeratingWithState:&v50 objects:v60 count:16];
      if (v43)
      {
        uint64_t v42 = *(void *)v51;
        id v40 = v10;
        while (2)
        {
          for (i = 0LL; i != v43; i = (char *)i + 1)
          {
            if (*(void *)v51 != v42) {
              objc_enumerationMutation(v10);
            }
            objc_super v12 = *(void **)(*((void *)&v50 + 1) + 8LL * (void)i);
            id v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", @"mediaItemPersistentID", v38));
            id v14 = [v13 longLongValue];
            id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"sortOrder"]);
            id v16 = [v15 longLongValue];
            if (!v14)
            {
              v35 = v44;
              id v8 = v38;
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
              {
                v36 = (void *)objc_claimAutoreleasedReturnValue([v7 uuid]);
                id v37 = (void *)objc_claimAutoreleasedReturnValue([v7 title]);
                *(_DWORD *)buf = 138543874;
                v55 = v36;
                __int16 v56 = 2112;
                uint64_t v57 = v37;
                __int16 v58 = 2114;
                v59 = @"mediaItemPersistentID";
                _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "ERROR: syncInfo ordering can't be be applied to playlist (uuid=%{public}@ - title='%@').  No %{public} @ found in info dictionary",  buf,  0x20u);

                id v10 = v40;
              }

              id v6 = v39;
              goto LABEL_22;
            }

            id v17 = v16;
            if (!v15)
            {
              uint64_t v18 = v44;
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                v19 = (void *)objc_claimAutoreleasedReturnValue([v7 uuid]);
                uint64_t v20 = v9;
                id v21 = v7;
                v22 = (void *)objc_claimAutoreleasedReturnValue([v7 title]);
                *(_DWORD *)buf = 138543874;
                v55 = v19;
                __int16 v56 = 2112;
                uint64_t v57 = v22;
                __int16 v58 = 2114;
                v59 = @"sortOrder";
                _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "ERROR: syncInfo ordering can't be be applied to playlist (uuid=%{public}@ - title='%@').  No %{public} @ found in info dictionary",  buf,  0x20u);

                id v7 = v21;
                unsigned int v9 = v20;
                id v10 = v40;
              }
            }

            v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v17));
            id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v14));
            [v9 setObject:v23 forKeyedSubscript:v24];
          }

          id v43 = [v10 countByEnumeratingWithState:&v50 objects:v60 count:16];
          if (v43) {
            continue;
          }
          break;
        }
      }

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v7 episodes]);
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472LL;
      v48[2] = sub_1000B7F30;
      v48[3] = &unk_100243B98;
      id v27 = v25;
      id v49 = v27;
      [v26 enumerateObjectsUsingBlock:v48];
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472LL;
      v45[2] = sub_1000B7FD0;
      v45[3] = &unk_100243BC0;
      id v46 = v9;
      id v47 = v27;
      id v13 = v27;
      __int128 v41 = v26;
      v28 = (void *)objc_claimAutoreleasedReturnValue([v26 sortedArrayUsingComparator:v45]);
      v29 = v44;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v7 uuid]);
        id v31 = v7;
        id v32 = (void *)objc_claimAutoreleasedReturnValue([v7 title]);
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue([v28 valueForKey:@"persistentID"]);
        *(_DWORD *)buf = 138543874;
        v55 = v30;
        __int16 v56 = 2112;
        uint64_t v57 = v32;
        __int16 v58 = 2114;
        v59 = v33;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "syncInfo ordering will be applied to playlist (uuid=%{public}@ - title='%@'), episodePIDs = %{public}@",  buf,  0x20u);

        id v7 = v31;
      }

      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithArray:](&OBJC_CLASS___NSOrderedSet, "orderedSetWithArray:", v28));
      [v7 setEpisodes:v34];

      id v15 = v49;
      id v8 = v38;
      id v6 = v39;
      id v10 = v41;
LABEL_22:
    }
  }
}

- (void)_addSetting:(id)a3 syncObj:(id)a4 playlist:(id)a5
{
  id v19 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = v7;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"podcastFeedUrl"]);

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"podcastFeedUrl"]);
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v19 podcastForFeedUrl:v11]);

    if (v12)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[MTPodcastPlaylistSettings insertNewSettingsInManagedObjectContext:]( &OBJC_CLASS___MTPodcastPlaylistSettings,  "insertNewSettingsInManagedObjectContext:",  v19));
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:kPlaylistSettingUuid]);
      [v13 setUuid:v14];

      id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"episodesToShowTruth"]);
      objc_msgSend(v13, "setEpisodesToShow:", objc_msgSend(v15, "integerValue"));

      id v16 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:kPlaylistSettingMediaType]);
      objc_msgSend(v13, "setMediaType:", objc_msgSend(v16, "integerValue"));

      id v17 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:kPlaylistSettingShowPlayedEpisodes]);
      objc_msgSend(v13, "setShowPlayedEpisodes:", objc_msgSend(v17, "BOOLValue"));

      [v13 setNeedsUpdate:1];
      [v13 setPlaylist:v8];
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:kPlaylistSettingTracksDefault]);
      objc_msgSend(v13, "setTracksDefault:", objc_msgSend(v18, "BOOLValue"));

      [v13 setPodcast:v12];
    }

    else
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](&OBJC_CLASS___IMLogger, "sharedLogger"));
      [v13 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Library/Sync/MTPlaylistSyncDictionaryMerge.m" lineNumber:268 format:@"Trying to add a setting for a non-existent podcast"];
    }
  }
}

- (void)_mergeSetting:(id)a3 syncObj:(id)a4
{
  id v41 = a3;
  id v5 = a4;
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 objectForKey:@"episodesToShowTruth"]);
  if (v6
    && (id v7 = (void *)v6,
        id v8 = [v41 episodesToShow],
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"episodesToShowTruth"]),
        id v10 = [v9 integerValue],
        v9,
        v7,
        v8 != v10))
  {
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"episodesToShowTruth"]);
    objc_msgSend(v41, "setEpisodesToShow:", objc_msgSend(v12, "integerValue"));

    uint64_t v11 = 1LL;
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  uint64_t v13 = kPlaylistSettingTracksDefault;
  uint64_t v14 = objc_claimAutoreleasedReturnValue([v5 objectForKey:kPlaylistSettingTracksDefault]);
  if (v14)
  {
    id v15 = (void *)v14;
    unsigned int v16 = [v41 tracksDefault];
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v13]);
    unsigned int v18 = [v17 BOOLValue];

    if (v16 != v18)
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v13]);
      objc_msgSend(v41, "setTracksDefault:", objc_msgSend(v19, "BOOLValue"));

      uint64_t v11 = 1LL;
    }
  }

  uint64_t v20 = kPlaylistSettingMediaType;
  uint64_t v21 = objc_claimAutoreleasedReturnValue([v5 objectForKey:kPlaylistSettingMediaType]);
  if (v21)
  {
    v22 = (void *)v21;
    id v23 = [v41 mediaType];
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v20]);
    id v25 = [v24 integerValue];

    if (v23 != v25)
    {
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v20]);
      objc_msgSend(v41, "setMediaType:", objc_msgSend(v26, "integerValue"));

      uint64_t v11 = 1LL;
    }
  }

  uint64_t v27 = kPlaylistSettingShowPlayedEpisodes;
  uint64_t v28 = objc_claimAutoreleasedReturnValue([v5 objectForKey:kPlaylistSettingShowPlayedEpisodes]);
  if (v28)
  {
    v29 = (void *)v28;
    unsigned int v30 = [v41 showPlayedEpisodes];
    id v31 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v27]);
    unsigned int v32 = [v31 BOOLValue];

    if (v30 != v32)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v27]);
      objc_msgSend(v41, "setShowPlayedEpisodes:", objc_msgSend(v33, "BOOLValue"));

      uint64_t v11 = 1LL;
    }
  }

  uint64_t v34 = kPlaylistSettingSortOrder;
  uint64_t v35 = objc_claimAutoreleasedReturnValue([v5 objectForKey:kPlaylistSettingSortOrder]);
  if (v35)
  {
    v36 = (void *)v35;
    id v37 = [v41 sortOrder];
    __int128 v38 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v34]);
    id v39 = [v38 integerValue];

    if (v37 != v39)
    {
      id v40 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v34]);
      objc_msgSend(v41, "setSortOrder:", objc_msgSend(v40, "longLongValue"));

      uint64_t v11 = 1LL;
    }
  }

  [v41 setNeedsUpdate:v11];
}

+ (void)mergeArray:(id)a3 fromArray:(id)a4 lookupKey:(id)a5 updateBlock:(id)a6 insertBlock:(id)a7 deleteBlock:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  unsigned int v16 = (void (**)(id, void *, void *))a6;
  v29 = (void (**)(id, void *))a7;
  id v27 = a8;
  uint64_t v28 = v13;
  if (v13)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v13 valueForKey:v15]);
    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjects:forKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjects:forKeys:",  v13,  v17));
  }

  else
  {
    unsigned int v18 = 0LL;
  }

  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v19 = v14;
  id v20 = [v19 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v33;
    do
    {
      for (i = 0LL; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(v19);
        }
        id v24 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
        id v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "valueForKey:", v15, v27, v28));
        if (v25)
        {
          id v26 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:v25]);
          if (v26)
          {
            if (v16) {
              v16[2](v16, v26, v24);
            }
          }

          else if (v29)
          {
            v29[2](v29, v24);
          }

          [v18 removeObjectForKey:v25];
        }
      }

      id v21 = [v19 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }

    while (v21);
  }

  if (v27 && [v18 count])
  {
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_1000B8900;
    v30[3] = &unk_100243BE8;
    id v31 = v27;
    [v18 enumerateKeysAndObjectsUsingBlock:v30];
  }
}

- (OS_os_log)loggingCategory
{
  return self->_loggingCategory;
}

- (NSArray)dictionariesToMerge
{
  return self->_dictionariesToMerge;
}

- (id)canDeletePlaylistUUIDBlock
{
  return self->_canDeletePlaylistUUIDBlock;
}

- (void)setCanDeletePlaylistUUIDBlock:(id)a3
{
}

- (BOOL)refreshContentsOfUpdatedOrInsertedPlaylists
{
  return self->_refreshContentsOfUpdatedOrInsertedPlaylists;
}

- (void)setRefreshContentsOfUpdatedOrInsertedPlaylists:(BOOL)a3
{
  self->_refreshContentsOfUpdatedOrInsertedPlaylists = a3;
}

- (BOOL)syncMergeIsFromCloud
{
  return self->_syncMergeIsFromCloud;
}

- (void)setSyncMergeIsFromCloud:(BOOL)a3
{
  self->_syncMergeIsFromCloud = a3;
}

- (void).cxx_destruct
{
}

@end