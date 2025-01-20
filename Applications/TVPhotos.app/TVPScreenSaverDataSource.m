@interface TVPScreenSaverDataSource
- (NSIndexPath)selectedIndexPath;
- (PHAssetCollection)activityFeedAssetCollection;
- (PHPhotoLibrary)photoLibrary;
- (TVPScreenSaverDataSource)initWithAllowedCollectionSubtypes:(id)a3;
- (id)albumForIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_fetchPhotoCollections;
- (void)_loadExistingSelection;
- (void)setActivityFeedAssetCollection:(id)a3;
- (void)setPhotoLibrary:(id)a3;
- (void)setSelectedIndexPath:(id)a3;
@end

@implementation TVPScreenSaverDataSource

- (TVPScreenSaverDataSource)initWithAllowedCollectionSubtypes:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___TVPScreenSaverDataSource;
  v5 = -[TVPScreenSaverDataSource init](&v16, "init");
  if (v5)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    fetchResults = v5->_fetchResults;
    v5->_fetchResults = v6;

    v8 = (NSArray *)[v4 copy];
    allowedSubtypes = v5->_allowedSubtypes;
    v5->_allowedSubtypes = v8;

    activityFeedAssetCollection = v5->_activityFeedAssetCollection;
    v5->_activityFeedAssetCollection = 0LL;

    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[TVPPhotoUtilities tvPhotoLibrary](&OBJC_CLASS___TVPPhotoUtilities, "tvPhotoLibrary"));
    photoLibrary = v5->_photoLibrary;
    v5->_photoLibrary = (PHPhotoLibrary *)v11;

    if (v5->_photoLibrary)
    {
      -[TVPScreenSaverDataSource _fetchPhotoCollections](v5, "_fetchPhotoCollections");
      -[TVPScreenSaverDataSource _loadExistingSelection](v5, "_loadExistingSelection");
    }

    else
    {
      uint64_t v13 = PLUIGetLog();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v18 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_FAULT,  "nil photo library for subtypes '%{public}@'",  buf,  0xCu);
      }
    }
  }

  return v5;
}

- (id)albumForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [v4 section];
  if (v5 >= (id)-[NSArray count](self->_filteredTypeArray, "count"))
  {
    id v11 = 0LL;
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSArray objectAtIndexedSubscript:]( self->_filteredTypeArray,  "objectAtIndexedSubscript:",  [v4 section]));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPScreenSaverDataSource activityFeedAssetCollection](self, "activityFeedAssetCollection"));
    if ([v6 integerValue] != (id)1000000401 || v7 == 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_fetchResults,  "objectForKeyedSubscript:",  v6));
      id v10 = [v4 row];
      if (v10 >= [v9 count]) {
        id v11 = 0LL;
      }
      else {
        id v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v4, "row")));
      }
    }

    else
    {
      id v11 = v7;
    }
  }

  return v11;
}

- (void)_fetchPhotoCollections
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  obj = self->_allowedSubtypes;
  v30 = v3;
  id v32 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v33,  v37,  16LL);
  if (v32)
  {
    uint64_t v4 = *(void *)v34;
    v29 = self;
    id v26 = 0LL;
    uint64_t v28 = *(void *)v34;
    do
    {
      for (i = 0LL; i != v32; i = (char *)i + 1)
      {
        if (*(void *)v34 != v4) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
        int64_t v7 = +[PHAssetCollection parentTypeForSubtype:]( PHAssetCollection,  "parentTypeForSubtype:",  objc_msgSend(v6, "integerValue", v26));
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPScreenSaverDataSource photoLibrary](self, "photoLibrary"));
        v9 = (void *)objc_claimAutoreleasedReturnValue([v8 librarySpecificFetchOptions]);

        if (v7 == 2)
        {
          id v13 = [v6 integerValue];
          if (v13 == (id)1000000211) {
            [v9 setIncludeProResSmartAlbum:1];
          }
          v14 = (void *)objc_claimAutoreleasedReturnValue( +[PHAssetCollection fetchAssetCollectionsWithType:subtype:options:]( &OBJC_CLASS___PHAssetCollection,  "fetchAssetCollectionsWithType:subtype:options:",  2LL,  v13,  v9));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_fetchResults,  "setObject:forKeyedSubscript:",  v14,  v6);
          v15 = (void *)objc_claimAutoreleasedReturnValue([v14 firstObject]);
          objc_super v16 = (void *)objc_claimAutoreleasedReturnValue([v15 photoLibrary]);
          v17 = (void *)objc_claimAutoreleasedReturnValue([v16 librarySpecificFetchOptions]);

          [v17 setFetchLimit:1];
          id v18 = (void *)objc_claimAutoreleasedReturnValue([v14 firstObject]);
          v19 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsInAssetCollection:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsInAssetCollection:options:",  v18,  v17));

          if ([v19 count])
          {
            v3 = v30;
            -[NSMutableArray addObject:](v30, "addObject:", v6);
            uint64_t v4 = v28;
            if (v13 == (id)203) {
              id v26 = -[NSMutableArray count](v30, "count");
            }
          }

          else
          {
            v3 = v30;
            uint64_t v4 = v28;
          }

          self = v29;
        }

        else
        {
          if (v7 == 4)
          {
            id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(favorite == YES)"));
            [v9 setPredicate:v10];

            uint64_t v11 = 4LL;
            uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
          }

          else
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(estimatedAssetCount != 0)"));
            [v9 setPredicate:v20];

            uint64_t v12 = (uint64_t)[v6 integerValue];
            uint64_t v11 = v7;
          }

          v14 = (void *)objc_claimAutoreleasedReturnValue( +[PHAssetCollection fetchAssetCollectionsWithType:subtype:options:]( &OBJC_CLASS___PHAssetCollection,  "fetchAssetCollectionsWithType:subtype:options:",  v11,  v12,  v9));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_fetchResults,  "setObject:forKeyedSubscript:",  v14,  v6);
          if ([v14 count]) {
            -[NSMutableArray addObject:](v3, "addObject:", v6);
          }
        }
      }

      id v32 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v33,  v37,  16LL);
    }

    while (v32);
  }

  else
  {
    id v26 = 0LL;
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue( +[TVPSharedAlbumsActivityFeedCache sharedInstance]( &OBJC_CLASS___TVPSharedAlbumsActivityFeedCache,  "sharedInstance"));
  [v21 loadCache];
  if ([v21 hasFeedInfo])
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[TVPSharedAlbumsActivityFeedCache sharedInstance]( &OBJC_CLASS___TVPSharedAlbumsActivityFeedCache,  "sharedInstance"));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 activityFeedCollection]);
    -[TVPScreenSaverDataSource setActivityFeedAssetCollection:](self, "setActivityFeedAssetCollection:", v23);

    v3 = v30;
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVPScreenSaverDataSource activityFeedAssetCollection](self, "activityFeedAssetCollection", v26));

  if (v24) {
    -[NSMutableArray insertObject:atIndex:](v3, "insertObject:atIndex:", &off_1000D1698, v27);
  }
  filteredTypeArray = self->_filteredTypeArray;
  self->_filteredTypeArray = &v3->super;
}

- (void)_loadExistingSelection
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVScreenSaverProvider sharedInstance](&OBJC_CLASS___TVScreenSaverProvider, "sharedInstance"));
  unsigned int v4 = [v3 isCurrentScreenSaver];

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVScreenSaverProvider sharedInstance](&OBJC_CLASS___TVScreenSaverProvider, "sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentScreenSaverInfo]);
    int64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"CollectionID"]);

    uint64_t v28 = 0LL;
    v29 = &v28;
    uint64_t v30 = 0x3032000000LL;
    v31 = sub_1000506BC;
    id v32 = sub_1000506CC;
    id v33 = 0LL;
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVPScreenSaverDataSource activityFeedAssetCollection](self, "activityFeedAssetCollection"));
    if (v18)
    {
      if ([v7 isEqualToString:@"ActivityFeedCollection"])
      {
        NSUInteger v8 = -[NSArray indexOfObject:](self->_filteredTypeArray, "indexOfObject:", &off_1000D1698);
        if (v8 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v9 = objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  0LL,  v8));
          id v10 = (void *)v29[5];
          v29[5] = v9;
        }
      }
    }

    uint64_t v11 = v29[5];
    if (v11) {
      goto LABEL_16;
    }
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    uint64_t v12 = self->_filteredTypeArray;
    id v13 = -[NSArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v24,  v34,  16LL);
    if (v13)
    {
      uint64_t v14 = *(void *)v25;
LABEL_9:
      uint64_t v15 = 0LL;
      while (1)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * v15);
        uint64_t v17 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_fetchResults, "objectForKeyedSubscript:", v16));
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472LL;
        v19[2] = sub_1000506D4;
        v19[3] = &unk_1000CBA68;
        id v20 = v7;
        v21 = self;
        uint64_t v22 = v16;
        v23 = &v28;
        [(id)v17 enumerateObjectsUsingBlock:v19];

        LOBYTE(v17) = v29[5] == 0;
        if ((v17 & 1) == 0) {
          break;
        }
        if (v13 == (id)++v15)
        {
          id v13 = -[NSArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v24,  v34,  16LL);
          if (v13) {
            goto LABEL_9;
          }
          break;
        }
      }
    }

    uint64_t v11 = v29[5];
    if (v11) {
LABEL_16:
    }
      -[TVPScreenSaverDataSource setSelectedIndexPath:](self, "setSelectedIndexPath:", v11, v8);

    _Block_object_dispose(&v28, 8);
  }

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (-[NSArray count](self->_filteredTypeArray, "count", a3) <= a4) {
    return 0LL;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_filteredTypeArray, "objectAtIndexedSubscript:", a4));
  if ([v6 integerValue] == (id)1000000401)
  {
    int64_t v7 = 1LL;
  }

  else
  {
    NSUInteger v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_fetchResults, "objectForKeyedSubscript:", v6));
    int64_t v7 = (int64_t)[v8 count];
  }

  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_filteredTypeArray, "objectAtIndexedSubscript:", a4));
  id v5 = [v4 integerValue];
  if (v5 == (id)101)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    int64_t v7 = v6;
    NSUInteger v8 = @"sharedHeader";
  }

  else
  {
    if (v5 != (id)2)
    {
      uint64_t v9 = &stru_1000CC6C8;
      goto LABEL_7;
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    int64_t v7 = v6;
    NSUInteger v8 = @"albumsHeader";
  }

  uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 localizedStringForKey:v8 value:&stru_1000CC6C8 table:0]);

LABEL_7:
  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue( [a3 dequeueReusableCellWithIdentifier:@"slideshowReuseIdentifier" forIndexPath:v6]);
  id v8 = [v6 section];
  if (v8 >= (id)-[NSArray count](self->_filteredTypeArray, "count"))
  {
    uint64_t v11 = &stru_1000CC6C8;
  }

  else
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSArray objectAtIndexedSubscript:]( self->_filteredTypeArray,  "objectAtIndexedSubscript:",  [v6 section]));
    if ([v9 integerValue] == (id)1000000401)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue( [v10 localizedStringForKey:@"ActivityTitleHeader" value:&stru_1000CC6C8 table:0]);
    }

    else
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_fetchResults,  "objectForKeyedSubscript:",  v9));
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "row")));
      uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue([v12 localizedTitle]);
    }
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 textLabel]);
  [v13 setText:v11];

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v7 textLabel]);
  [v14 setTextAlignment:4];

  selectedIndexPath = self->_selectedIndexPath;
  else {
    uint64_t v16 = 0LL;
  }
  [v7 setAccessoryType:v16];

  return v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSArray count](self->_filteredTypeArray, "count", a3);
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setSelectedIndexPath:(id)a3
{
}

- (PHAssetCollection)activityFeedAssetCollection
{
  return self->_activityFeedAssetCollection;
}

- (void)setActivityFeedAssetCollection:(id)a3
{
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setPhotoLibrary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end