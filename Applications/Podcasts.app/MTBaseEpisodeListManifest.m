@interface MTBaseEpisodeListManifest
+ (id)_mediaItemForEpisode:(id)a3;
+ (id)mediaItemForEpisodeWithManagedObjectID:(id)a3;
+ (id)mediaItemForEpisodeWithUUID:(id)a3;
+ (void)episodeUuidForActivity:(id)a3 completion:(id)a4;
- (BOOL)defaultToInitialIndexZero;
- (BOOL)isInitialPrepare;
- (MTBaseEpisodeListManifest)init;
- (MTBaseEpisodeListManifest)initWithInitialEpisodeUuid:(id)a3;
- (NSArray)episodeUuids;
- (NSDictionary)uuidToManagedObjectIDMap;
- (NSMutableDictionary)uuidToPlayerItemMap;
- (NSString)initialEpisodeUuid;
- (id)_predicateForFilteringExplicitEpisodes;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (void)enumerateObjectsUsingBlock:(id)a3;
- (void)postManifestDidChangeNotification;
- (void)setEpisodeUuids:(id)a3;
- (void)setInitialEpisodeUuid:(id)a3;
- (void)setIsInitialPrepare:(BOOL)a3;
- (void)setUuidToManagedObjectIDMap:(id)a3;
- (void)setUuidToPlayerItemMap:(id)a3;
@end

@implementation MTBaseEpisodeListManifest

- (MTBaseEpisodeListManifest)initWithInitialEpisodeUuid:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTBaseEpisodeListManifest;
  v5 = -[MTPlayerManifest init](&v8, "init");
  if (v5)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[MTBaseEpisodeListManifest setUuidToPlayerItemMap:](v5, "setUuidToPlayerItemMap:", v6);

    -[MTBaseEpisodeListManifest setInitialEpisodeUuid:](v5, "setInitialEpisodeUuid:", v4);
    -[MTBaseEpisodeListManifest setIsInitialPrepare:](v5, "setIsInitialPrepare:", 1LL);
  }

  return v5;
}

- (MTBaseEpisodeListManifest)init
{
  return (MTBaseEpisodeListManifest *)-[MTBaseEpisodeListManifest count](v2, v3);
}

- (unint64_t)count
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseEpisodeListManifest episodeUuids](self, "episodeUuids"));
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (id)objectAtIndex:(unint64_t)a3
{
  if (-[MTBaseEpisodeListManifest count](self, "count") <= a3)
  {
    id v10 = 0LL;
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseEpisodeListManifest episodeUuids](self, "episodeUuids"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:a3]);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseEpisodeListManifest uuidToPlayerItemMap](self, "uuidToPlayerItemMap"));
    objc_sync_enter(v7);
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseEpisodeListManifest uuidToPlayerItemMap](self, "uuidToPlayerItemMap"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v6]);

    objc_sync_exit(v7);
    if (v9)
    {
      [v9 setManifestIndex:a3];
      id v10 = v9;
    }

    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseEpisodeListManifest uuidToManagedObjectIDMap](self, "uuidToManagedObjectIDMap"));
      objc_sync_enter(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseEpisodeListManifest uuidToManagedObjectIDMap](self, "uuidToManagedObjectIDMap"));
      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v6]);

      objc_sync_exit(v11);
      v14 = (void *)objc_opt_class(self);
      if (v13) {
        v15 = (void *)objc_claimAutoreleasedReturnValue([v14 mediaItemForEpisodeWithManagedObjectID:v13]);
      }
      else {
        v15 = (void *)objc_claimAutoreleasedReturnValue([v14 mediaItemForEpisodeWithUUID:v6]);
      }
      id v10 = v15;
      [v15 setManifestIndex:a3];
      [v10 setManifest:self];
      if (v10)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseEpisodeListManifest uuidToPlayerItemMap](self, "uuidToPlayerItemMap"));
        objc_sync_enter(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseEpisodeListManifest uuidToPlayerItemMap](self, "uuidToPlayerItemMap"));
        [v17 setObject:v10 forKey:v6];

        objc_sync_exit(v16);
      }
    }
  }

  return v10;
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 mainOrPrivateContext]);

    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000E9BB8;
    v7[3] = &unk_1002405F8;
    v7[4] = self;
    id v8 = v6;
    [v5 performBlockAndWait:v7];
  }
}

+ (void)episodeUuidForActivity:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 itemIdentifier]);
  if ([v7 length])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 containerIdentifier]);
    if ([v8 length]) {
      uint64_t v9 = objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForEpisodeGuid:onFeedURL:]( &OBJC_CLASS___MTEpisode,  "predicateForEpisodeGuid:onFeedURL:",  v7,  v8));
    }
    else {
      uint64_t v9 = objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForEpisodeGuid:](&OBJC_CLASS___MTEpisode, "predicateForEpisodeGuid:", v7));
    }
    id v10 = (void *)v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 playbackContext]);

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000E9D50;
    v15[3] = &unk_100244770;
    id v16 = v12;
    id v17 = v10;
    id v18 = v6;
    id v13 = v10;
    id v14 = v12;
    [v14 performBlock:v15];
  }

  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0LL);
  }
}

+ (id)mediaItemForEpisodeWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  v19 = sub_1000E9FC8;
  v20 = sub_1000E9FD8;
  id v21 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mainOrPrivateContext]);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000E9FE0;
  v11[3] = &unk_1002442B0;
  id v7 = v6;
  id v12 = v7;
  id v8 = v4;
  id v13 = v8;
  id v14 = &v16;
  id v15 = a1;
  [v7 performBlockAndWait:v11];
  id v9 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v9;
}

+ (id)mediaItemForEpisodeWithManagedObjectID:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  v19 = sub_1000E9FC8;
  v20 = sub_1000E9FD8;
  id v21 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mainOrPrivateContext]);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000EA174;
  v11[3] = &unk_1002442B0;
  id v7 = v6;
  id v12 = v7;
  id v8 = v4;
  id v13 = v8;
  id v14 = &v16;
  id v15 = a1;
  [v7 performBlockAndWait:v11];
  id v9 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v9;
}

- (void)postManifestDidChangeNotification
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[MTBaseEpisodeListManifest currentItem](self, "currentItem"));
  if (v3)
  {
    id v4 = (void *)v3;
    episodeUuids = self->_episodeUuids;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseEpisodeListManifest currentItem](self, "currentItem"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 episodeUuid]);
    LOBYTE(episodeUuids) = -[NSArray containsObject:](episodeUuids, "containsObject:", v7);
  }

  if (-[MTBaseEpisodeListManifest count](self, "count"))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseEpisodeListManifest currentItem](self, "currentItem"));
    if (v8)
    {
    }

    else if (-[MTBaseEpisodeListManifest isInitialPrepare](self, "isInitialPrepare"))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseEpisodeListManifest initialEpisodeUuid](self, "initialEpisodeUuid"));

      if (v9)
      {
        id v10 = self->_episodeUuids;
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseEpisodeListManifest initialEpisodeUuid](self, "initialEpisodeUuid"));
        -[MTBaseEpisodeListManifest setCurrentIndex:]( self,  "setCurrentIndex:",  -[NSArray indexOfObject:](v10, "indexOfObject:", v11));
      }

      else if (-[MTBaseEpisodeListManifest defaultToInitialIndexZero](self, "defaultToInitialIndexZero"))
      {
        -[MTBaseEpisodeListManifest setCurrentIndex:](self, "setCurrentIndex:", 0LL);
      }

      -[MTBaseEpisodeListManifest setIsInitialPrepare:](self, "setIsInitialPrepare:", 0LL);
    }
  }

  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MTBaseEpisodeListManifest;
  -[MTBaseEpisodeListManifest postManifestDidChangeNotification](&v12, "postManifestDidChangeNotification");
}

- (BOOL)defaultToInitialIndexZero
{
  return 1;
}

- (id)_predicateForFilteringExplicitEpisodes
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate truePredicate](&OBJC_CLASS___NSPredicate, "truePredicate"));
  if ((+[PFRestrictionsController isExplicitContentAllowed]( &OBJC_CLASS___PFRestrictionsController,  "isExplicitContentAllowed") & 1) == 0)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForExplicit:](&OBJC_CLASS___MTEpisode, "predicateForExplicit:", 0LL));

    v2 = (void *)v3;
  }

  return v2;
}

+ (id)_mediaItemForEpisode:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = -[MTPlayerItem initWithEpisode:](objc_alloc(&OBJC_CLASS___MTPlayerItem), "initWithEpisode:", v3);
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

- (NSString)initialEpisodeUuid
{
  return self->_initialEpisodeUuid;
}

- (void)setInitialEpisodeUuid:(id)a3
{
}

- (NSMutableDictionary)uuidToPlayerItemMap
{
  return self->_uuidToPlayerItemMap;
}

- (void)setUuidToPlayerItemMap:(id)a3
{
}

- (BOOL)isInitialPrepare
{
  return self->_isInitialPrepare;
}

- (void)setIsInitialPrepare:(BOOL)a3
{
  self->_isInitialPrepare = a3;
}

- (NSArray)episodeUuids
{
  return self->_episodeUuids;
}

- (void)setEpisodeUuids:(id)a3
{
}

- (NSDictionary)uuidToManagedObjectIDMap
{
  return self->_uuidToManagedObjectIDMap;
}

- (void)setUuidToManagedObjectIDMap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end