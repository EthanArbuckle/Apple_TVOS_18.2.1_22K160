@interface MTMediaQueryManifest
- (MPMediaQuery)query;
- (MTMediaQueryManifest)initWithMediaQuery:(id)a3 initialItem:(id)a4;
- (NSArray)persistentIds;
- (NSMutableDictionary)pidToUuidMapping;
- (void)_processResults:(id)a3;
- (void)_updateSortOrder;
- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)controllerDidChangeContent:(id)a3;
- (void)setPersistentIds:(id)a3;
- (void)setPidToUuidMapping:(id)a3;
- (void)setQuery:(id)a3;
@end

@implementation MTMediaQueryManifest

- (MTMediaQueryManifest)initWithMediaQuery:(id)a3 initialItem:(id)a4
{
  id v25 = a3;
  id v23 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTMLMediaItem itemWithMPMediaItem:](&OBJC_CLASS___MTMLMediaItem, "itemWithMPMediaItem:"));
  uint64_t v35 = 0LL;
  v36 = &v35;
  uint64_t v37 = 0x3032000000LL;
  v38 = sub_10003BD60;
  v39 = sub_10003BD70;
  id v40 = 0LL;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 mainOrPrivateContext]);

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_10003BD78;
  v31[3] = &unk_100240558;
  id v8 = v7;
  id v32 = v8;
  id v9 = v5;
  id v33 = v9;
  v34 = &v35;
  [v8 performBlockAndWait:v31];
  v10 = (void *)objc_claimAutoreleasedReturnValue([v25 items]);
  v11 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v10 count]);
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v12 = v10;
  id v13 = [v12 countByEnumeratingWithState:&v27 objects:v41 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v28;
    do
    {
      v15 = 0LL;
      do
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v12);
        }
        v16 = (void *)objc_claimAutoreleasedReturnValue( +[MTMLMediaItem itemWithMPMediaItem:]( &OBJC_CLASS___MTMLMediaItem,  "itemWithMPMediaItem:",  *(void *)(*((void *)&v27 + 1) + 8LL * (void)v15)));
        v17 = (void *)objc_claimAutoreleasedReturnValue([v16 persistentId]);
        -[NSMutableArray addObject:](v11, "addObject:", v17);

        v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v12 countByEnumeratingWithState:&v27 objects:v41 count:16];
    }

    while (v13);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K IN %@",  kEpisodePersistentID,  v11));
  uint64_t v19 = v36[5];
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___MTMediaQueryManifest;
  v20 = -[MTPredicateManifest initWithInitialEpisodeUuid:predicateToTrack:sortDescriptors:]( &v26,  "initWithInitialEpisodeUuid:predicateToTrack:sortDescriptors:",  v19,  v18,  0LL);
  v21 = v20;
  if (v20)
  {
    -[MTMediaQueryManifest setQuery:](v20, "setQuery:", v25);
    -[MTMediaQueryManifest setPersistentIds:](v21, "setPersistentIds:", v11);
  }

  _Block_object_dispose(&v35, 8);
  return v21;
}

- (void)_processResults:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[MTMediaQueryManifest setPidToUuidMapping:](self, "setPidToUuidMapping:", v5);

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)v10);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaQueryManifest pidToUuidMapping](self, "pidToUuidMapping", (void)v15));
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 uuid]);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v11 persistentID]));
        [v12 setObject:v13 forKey:v14];

        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v8);
  }

  -[MTMediaQueryManifest _updateSortOrder](self, "_updateSortOrder");
}

- (void)_updateSortOrder
{
  v3 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaQueryManifest persistentIds](self, "persistentIds"));
  v5 = -[NSMutableArray initWithCapacity:](v3, "initWithCapacity:", [v4 count]);

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaQueryManifest persistentIds](self, "persistentIds", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)v10);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaQueryManifest pidToUuidMapping](self, "pidToUuidMapping"));
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v11]);

        if (v13) {
          -[NSMutableArray addObject:](v5, "addObject:", v13);
        }

        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }

  -[MTPredicateManifest setExplicitSortOrder:](self, "setExplicitSortOrder:", v5);
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v19 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if (a6 == 2)
  {
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaQueryManifest pidToUuidMapping](self, "pidToUuidMapping"));
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v12 persistentID]));
    [v15 removeObjectForKey:v16];
    goto LABEL_5;
  }

  if (a6 == 1)
  {
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTMediaQueryManifest pidToUuidMapping](self, "pidToUuidMapping"));
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v12 uuid]);
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v12 persistentID]));
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 stringValue]);
    [v15 setValue:v16 forKey:v18];

LABEL_5:
  }
}

- (void)controllerDidChangeContent:(id)a3
{
  id v4 = a3;
  -[MTMediaQueryManifest _updateSortOrder](self, "_updateSortOrder");
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTMediaQueryManifest;
  -[MTPredicateManifest controllerDidChangeContent:](&v5, "controllerDidChangeContent:", v4);
}

- (MPMediaQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (NSArray)persistentIds
{
  return self->_persistentIds;
}

- (void)setPersistentIds:(id)a3
{
}

- (NSMutableDictionary)pidToUuidMapping
{
  return self->_pidToUuidMapping;
}

- (void)setPidToUuidMapping:(id)a3
{
}

- (void).cxx_destruct
{
}

@end