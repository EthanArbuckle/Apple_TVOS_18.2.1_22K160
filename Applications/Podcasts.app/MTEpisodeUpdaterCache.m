@interface MTEpisodeUpdaterCache
+ (id)defaultPropertiesToFetch;
+ (id)episodeCacheWithPredicate:(id)a3 inCtx:(id)a4;
+ (id)episodeCacheWithPredicate:(id)a3 inCtx:(id)a4 extraProperties:(id)a5;
- (MTEpisodeUpdaterCache)initWithPredicate:(id)a3 inCtx:(id)a4 extraProperties:(id)a5;
- (MTManagedObjectContext)ctx;
- (NSArray)propertiesToFetch;
- (NSCache)managedObjectCache;
- (NSDictionary)lookupDict;
- (NSMutableSet)unvisitedUUIDs;
- (id)episodeForAssetUrl:(id)a3;
- (id)episodeForEnclosure:(id)a3;
- (id)episodeForGuid:(id)a3;
- (id)episodeForPersistentID:(id)a3;
- (id)episodeForTitle:(id)a3 pubDate:(double)a4;
- (id)episodeForUUID:(id)a3;
- (id)episodeWithValue:(id)a3 forPropertyKey:(id)a4;
- (id)searchCacheForEpisodeMatchingFeedItem:(id)a3 enclosureUrl:(id)a4;
- (id)searchCacheForEpisodeMatchingMediaItem:(id)a3;
- (id)unvisitedEpisodes;
- (void)setCtx:(id)a3;
- (void)setLookupDict:(id)a3;
- (void)setManagedObjectCache:(id)a3;
- (void)setPropertiesToFetch:(id)a3;
- (void)setUnvisitedUUIDs:(id)a3;
@end

@implementation MTEpisodeUpdaterCache

+ (id)defaultPropertiesToFetch
{
  v3[0] = kEpisodeEnclosureUrl;
  v3[1] = kEpisodePodcastUuid;
  v3[2] = kEpisodeTitle;
  v3[3] = kEpisodeUuid;
  v3[4] = kEpisodeGuid;
  v3[5] = kEpisodePubDate;
  v3[6] = kEpisodeByteSize;
  v3[7] = kEpisodeAssetURL;
  v3[8] = kEpisodePersistentID;
  v3[9] = kEpisodeStoreTrackId;
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  10LL));
}

+ (id)episodeCacheWithPredicate:(id)a3 inCtx:(id)a4
{
  return _[a1 episodeCacheWithPredicate:a3 inCtx:a4 extraProperties:0];
}

+ (id)episodeCacheWithPredicate:(id)a3 inCtx:(id)a4 extraProperties:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) initWithPredicate:v10 inCtx:v9 extraProperties:v8];

  return v11;
}

- (MTEpisodeUpdaterCache)initWithPredicate:(id)a3 inCtx:(id)a4 extraProperties:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v57.receiver = self;
  v57.super_class = (Class)&OBJC_CLASS___MTEpisodeUpdaterCache;
  id v11 = -[MTEpisodeUpdaterCache init](&v57, "init");
  if (v11)
  {
    v44 = v8;
    v12 = &__NSArray0__struct;
    if (v10) {
      v12 = v10;
    }
    id v13 = v12;

    id v14 = [(id)objc_opt_class(v11) defaultPropertiesToFetch];
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 arrayByAddingObjectsFromArray:v13]);

    objc_storeStrong((id *)&v11->_propertiesToFetch, v16);
    objc_storeStrong((id *)&v11->_ctx, a4);
    v17 = v9;
    else {
      v41 = objc_alloc_init(&OBJC_CLASS___NSCache);
    }
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472LL;
    v45[2] = sub_10011EF10;
    v45[3] = &unk_100245478;
    v43 = v17;
    id v46 = v17;
    id v47 = v44;
    id v10 = v16;
    id v48 = v10;
    id v49 = v38;
    id v50 = v18;
    id v51 = v19;
    id v52 = v40;
    id v53 = v20;
    v23 = v41;
    v54 = v23;
    id v55 = v21;
    v24 = v22;
    v56 = v24;
    id v25 = v21;
    id v39 = v20;
    id v26 = v40;
    id v27 = v19;
    id v28 = v18;
    id v29 = v38;
    [v46 performBlockAndWait:v45];
    unvisitedUUIDs = v11->_unvisitedUUIDs;
    v11->_unvisitedUUIDs = v24;
    v42 = v24;

    v58[0] = kEpisodeTitle;
    v58[1] = kEpisodeEnclosureUrl;
    v59[0] = v29;
    v59[1] = v28;
    v58[2] = kEpisodeGuid;
    v58[3] = kEpisodePersistentID;
    v59[2] = v27;
    v59[3] = v26;
    v31 = v26;
    v58[4] = kEpisodeAssetURL;
    v58[5] = kEpisodeUuid;
    v59[4] = v39;
    v59[5] = v25;
    uint64_t v32 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v59,  v58,  6LL));
    lookupDict = v11->_lookupDict;
    v11->_lookupDict = (NSDictionary *)v32;

    managedObjectCache = v11->_managedObjectCache;
    v11->_managedObjectCache = v23;
    v35 = v23;

    id v8 = v44;
    v36 = v11;

    id v9 = v43;
  }

  return v11;
}

- (id)searchCacheForEpisodeMatchingMediaItem:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 persistentId]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeUpdaterCache episodeForPersistentID:](self, "episodeForPersistentID:", v5));

  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 assetUrl]);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeUpdaterCache episodeForAssetUrl:](self, "episodeForAssetUrl:", v7));

    if (!v6)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 guid]);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeUpdaterCache episodeForGuid:](self, "episodeForGuid:", v8));

      if (!v6)
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 title]);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByStrippingHTML]);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 pubDate]);
        [v11 timeIntervalSinceReferenceDate];
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeUpdaterCache episodeForTitle:pubDate:](self, "episodeForTitle:pubDate:", v10));
      }
    }
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue([v6 uuid]);

  if (v12)
  {
    unvisitedUUIDs = self->_unvisitedUUIDs;
    v15 = (void *)objc_claimAutoreleasedReturnValue([v6 uuid]);
    -[NSMutableSet removeObject:](unvisitedUUIDs, "removeObject:", v15);
  }

  else if (v6)
  {
    uint64_t v16 = _MTLogCategoryDatabase(v13);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue([v6 title]);
      int v20 = 138412290;
      v21 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "MTEpisodeUpdaterCache encountered episode without UUID %@",  (uint8_t *)&v20,  0xCu);
    }
  }

  return v6;
}

- (id)searchCacheForEpisodeMatchingFeedItem:(id)a3 enclosureUrl:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 guid]);

  if (!v8
    || (id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 guid]),
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeUpdaterCache episodeForGuid:](self, "episodeForGuid:", v9)),
        v9,
        !v10))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeUpdaterCache episodeForEnclosure:](self, "episodeForEnclosure:", v7));
    if (!v10)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 title]);
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 stringByStrippingHTML]);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 pubDate]);
      [v13 timeIntervalSinceReferenceDate];
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeUpdaterCache episodeForTitle:pubDate:](self, "episodeForTitle:pubDate:", v12));
    }
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 uuid]);

  if (v14)
  {
    unvisitedUUIDs = self->_unvisitedUUIDs;
    v17 = (void *)objc_claimAutoreleasedReturnValue([v10 uuid]);
    -[NSMutableSet removeObject:](unvisitedUUIDs, "removeObject:", v17);
  }

  else if (v10)
  {
    uint64_t v18 = _MTLogCategoryDatabase(v15);
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v20 = (void *)objc_claimAutoreleasedReturnValue([v10 title]);
      int v22 = 138412290;
      v23 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "MTEpisodeUpdaterCache encountered episode without UUID %@",  (uint8_t *)&v22,  0xCu);
    }
  }

  return v10;
}

- (id)unvisitedEpisodes
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  -[NSMutableSet count](self->_unvisitedUUIDs, "count")));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](&OBJC_CLASS___NSMutableSet, "setWithSet:", self->_unvisitedUUIDs));
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  v5 = self->_unvisitedUUIDs;
  id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    uint64_t v9 = kEpisodeUuid;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue( -[MTEpisodeUpdaterCache episodeWithValue:forPropertyKey:]( self,  "episodeWithValue:forPropertyKey:",  v11,  v9,  (void)v19));
        if (v12)
        {
          [v3 addObject:v12];
          [v4 removeObject:v11];
        }
      }

      id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
    }

    while (v7);
  }

  if ([v4 count])
  {
    ctx = self->_ctx;
    uint64_t v14 = kMTEpisodeEntityName;
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForEpisodeUuids:](&OBJC_CLASS___MTEpisode, "predicateForEpisodeUuids:", v4));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[MTManagedObjectContext objectsInEntity:predicate:propertiesToFetch:batchSize:]( ctx,  "objectsInEntity:predicate:propertiesToFetch:batchSize:",  v14,  v15,  self->_propertiesToFetch,  0LL));

    [v3 addObjectsFromArray:v16];
  }

  id v17 = objc_msgSend(v3, "copy", (void)v19);

  return v17;
}

- (id)episodeForUUID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x3032000000LL;
    id v17 = sub_10011FA5C;
    uint64_t v18 = sub_10011FA6C;
    id v19 = 0LL;
    if (-[MTManagedObjectContext isResetable](self->_ctx, "isResetable"))
    {
      ctx = self->_ctx;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_10011FA74;
      v13[3] = &unk_1002404B8;
      id v6 = v13;
      v13[6] = &v14;
      v13[4] = self;
      v13[5] = v4;
      -[MTManagedObjectContext performBlockAndWait:](ctx, "performBlockAndWait:", v13);
    }

    else
    {
      uint64_t v8 = objc_claimAutoreleasedReturnValue(-[NSCache objectForKey:](self->_managedObjectCache, "objectForKey:", v4));
      uint64_t v9 = (void *)v15[5];
      v15[5] = v8;

      if (v15[5])
      {
LABEL_8:
        id v7 = (id)v15[5];
        _Block_object_dispose(&v14, 8);

        goto LABEL_9;
      }

      id v10 = self->_ctx;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_10011FABC;
      v12[3] = &unk_1002404B8;
      id v6 = v12;
      v12[6] = &v14;
      v12[4] = self;
      v12[5] = v4;
      -[MTManagedObjectContext performBlockAndWait:](v10, "performBlockAndWait:", v12);
    }

    goto LABEL_8;
  }

  id v7 = 0LL;
LABEL_9:

  return v7;
}

- (id)episodeWithValue:(id)a3 forPropertyKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7 && ([v7 isEqualToString:kEpisodeTitle] & 1) == 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_lookupDict, "objectForKey:", v8));
    uint64_t v11 = v10;
    if (v10)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v6]);
      if (v12) {
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeUpdaterCache episodeForUUID:](self, "episodeForUUID:", v12));
      }
      else {
        uint64_t v9 = 0LL;
      }
    }

    else
    {
      uint64_t v9 = 0LL;
    }
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  return v9;
}

- (id)episodeForGuid:(id)a3
{
  id v4 = a3;
  if ([v4 length]) {
    v5 = (void *)objc_claimAutoreleasedReturnValue( -[MTEpisodeUpdaterCache episodeWithValue:forPropertyKey:]( self,  "episodeWithValue:forPropertyKey:",  v4,  kEpisodeGuid));
  }
  else {
    v5 = 0LL;
  }

  return v5;
}

- (id)episodeForEnclosure:(id)a3
{
  id v4 = a3;
  if ([v4 length]) {
    v5 = (void *)objc_claimAutoreleasedReturnValue( -[MTEpisodeUpdaterCache episodeWithValue:forPropertyKey:]( self,  "episodeWithValue:forPropertyKey:",  v4,  kEpisodeEnclosureUrl));
  }
  else {
    v5 = 0LL;
  }

  return v5;
}

- (id)episodeForAssetUrl:(id)a3
{
  id v4 = a3;
  if ([v4 length]) {
    v5 = (void *)objc_claimAutoreleasedReturnValue( -[MTEpisodeUpdaterCache episodeWithValue:forPropertyKey:]( self,  "episodeWithValue:forPropertyKey:",  v4,  kEpisodeAssetURL));
  }
  else {
    v5 = 0LL;
  }

  return v5;
}

- (id)episodeForPersistentID:(id)a3
{
  if (a3) {
    return (id)objc_claimAutoreleasedReturnValue( -[MTEpisodeUpdaterCache episodeWithValue:forPropertyKey:]( self,  "episodeWithValue:forPropertyKey:",  a3,  kEpisodePersistentID));
  }
  else {
    return 0LL;
  }
}

- (id)episodeForTitle:(id)a3 pubDate:(double)a4
{
  id v6 = a3;
  if ([v6 length])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeUpdaterCache lookupDict](self, "lookupDict"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:kEpisodeTitle]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v6]);

    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id v10 = v9;
    id v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v11)
    {
      id v12 = v11;
      id v13 = 0LL;
      uint64_t v14 = *(void *)v25;
      double v15 = 1.79769313e308;
LABEL_4:
      uint64_t v16 = 0LL;
      while (1)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v10);
        }
        id v17 = (void *)objc_claimAutoreleasedReturnValue( -[MTEpisodeUpdaterCache episodeForUUID:]( self,  "episodeForUUID:",  *(void *)(*((void *)&v24 + 1) + 8 * v16),  (void)v24));
        if (!v17) {
          break;
        }
        uint64_t v18 = v17;
        [v17 pubDate];
        double v20 = vabdd_f64(v19, a4);
        if (v20 < v15)
        {
          id v21 = v18;

          double v15 = v20;
          id v13 = v21;
        }

        if (v12 == (id)++v16)
        {
          id v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
          if (v12) {
            goto LABEL_4;
          }

          if (v15 < 604800.0)
          {
            id v13 = v13;
            __int128 v22 = v13;
            goto LABEL_18;
          }

          goto LABEL_17;
        }
      }
    }

    else
    {
      id v13 = 0LL;
    }

LABEL_17:
    __int128 v22 = 0LL;
LABEL_18:
  }

  else
  {
    __int128 v22 = 0LL;
  }

  return v22;
}

- (NSDictionary)lookupDict
{
  return self->_lookupDict;
}

- (void)setLookupDict:(id)a3
{
}

- (NSCache)managedObjectCache
{
  return self->_managedObjectCache;
}

- (void)setManagedObjectCache:(id)a3
{
}

- (MTManagedObjectContext)ctx
{
  return self->_ctx;
}

- (void)setCtx:(id)a3
{
}

- (NSArray)propertiesToFetch
{
  return self->_propertiesToFetch;
}

- (void)setPropertiesToFetch:(id)a3
{
}

- (NSMutableSet)unvisitedUUIDs
{
  return self->_unvisitedUUIDs;
}

- (void)setUnvisitedUUIDs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end