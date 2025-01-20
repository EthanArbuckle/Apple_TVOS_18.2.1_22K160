@interface TVHMediaItemsFetchPlaybackViewController
- (BOOL)allowRepeat;
- (BOOL)shuffle;
- (TVHKMediaLibrary)mediaLibrary;
- (TVHMediaItemsFetchPlaybackViewController)init;
- (TVHMediaItemsFetchPlaybackViewController)initWithCoder:(id)a3;
- (TVHMediaItemsFetchPlaybackViewController)initWithMediaLibrary:(id)a3 fetchRequest:(id)a4 shuffle:(BOOL)a5 allowRepeat:(BOOL)a6;
- (TVHMediaItemsFetchPlaybackViewController)initWithMediaLibrary:(id)a3 mediaCategoryType:(unint64_t)a4 mediaEntityCollectionType:(unint64_t)a5 mediaEntityCollectionIdentifier:(id)a6;
- (TVHMediaItemsFetchPlaybackViewController)initWithMediaLibrary:(id)a3 mediaCategoryType:(unint64_t)a4 mediaItemIdentifier:(id)a5;
- (TVHMediaItemsFetchPlaybackViewController)initWithMediaLibrary:(id)a3 musicAlbums:(id)a4 shuffle:(BOOL)a5;
- (TVHMediaItemsFetchPlaybackViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)_fetchRequestDidCompleteWithMediaItems:(id)a3 error:(id)a4;
- (void)setAllowRepeat:(BOOL)a3;
- (void)setMediaLibrary:(id)a3;
- (void)setShuffle:(BOOL)a3;
@end

@implementation TVHMediaItemsFetchPlaybackViewController

- (TVHMediaItemsFetchPlaybackViewController)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHMediaItemsFetchPlaybackViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v6);

  return 0LL;
}

- (TVHMediaItemsFetchPlaybackViewController)initWithCoder:(id)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHMediaItemsFetchPlaybackViewController)initWithMediaLibrary:(id)a3 fetchRequest:(id)a4 shuffle:(BOOL)a5 allowRepeat:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  v13 = v12;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
  }

  else
  {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ parameter must not be nil.",  @"mediaLibrary");
    if (v13) {
      goto LABEL_3;
    }
  }

  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ parameter must not be nil.",  @"fetchRequest");
LABEL_3:
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___TVHMediaItemsFetchPlaybackViewController;
  v14 = -[TVHMediaItemsFetchPlaybackViewController initWithNibName:bundle:](&v24, "initWithNibName:bundle:", 0LL, 0LL);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_mediaLibrary, a3);
    v15->_shuffle = a5;
    v15->_allowRepeat = a6;
    v16 = objc_alloc_init(&OBJC_CLASS___TVHLoadingViewController);
    -[TVHMediaItemsFetchPlaybackViewController tvh_setFullViewChildViewController:]( v15,  "tvh_setFullViewChildViewController:",  v16);
    objc_initWeak(&location, v15);
    mediaLibrary = v15->_mediaLibrary;
    v25 = v13;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100025210;
    v21[3] = &unk_1000FD898;
    objc_copyWeak(&v22, &location);
    id v19 =  -[TVHKMediaLibrary enqueueFetchRequests:completionHandler:]( mediaLibrary,  "enqueueFetchRequests:completionHandler:",  v18,  v21);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v15;
}

- (TVHMediaItemsFetchPlaybackViewController)initWithMediaLibrary:(id)a3 musicAlbums:(id)a4 shuffle:(BOOL)a5
{
  BOOL v31 = a5;
  id v32 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest mediaItemsFetchRequestWithMediaCategoryType:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "mediaItemsFetchRequestWithMediaCategoryType:",  1LL));
  uint64_t v8 = TVHKMusicMediaItemProperties(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v7 setProperties:v9];
  v29 = v6;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForKey:@"identifier"]);
  id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v12 = v10;
  id v13 = [v12 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v34;
    do
    {
      v16 = 0LL;
      do
      {
        if (*(void *)v34 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate tvhk_mediaEntityAlbumIdentifierPredicateWithIdentifier:]( &OBJC_CLASS___NSPredicate,  "tvhk_mediaEntityAlbumIdentifierPredicateWithIdentifier:",  *(void *)(*((void *)&v33 + 1) + 8LL * (void)v16)));
        -[NSMutableArray addObject:](v11, "addObject:", v17);

        v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }

    while (v14);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate tvhk_predicateWithSubpredicates:compoundPredicateType:]( &OBJC_CLASS___NSPredicate,  "tvhk_predicateWithSubpredicates:compoundPredicateType:",  v11,  2LL));
  [v7 setPredicate:v18];
  id v19 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v12 valueForKey:@"DMAPPersistentID"]);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithArray:](&OBJC_CLASS___NSOrderedSet, "orderedSetWithArray:", v20));
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_100025A90;
  v37[3] = &unk_1000FD8C0;
  id v38 = v21;
  id v22 = v21;
  v23 = objc_retainBlock(v37);
  objc_super v24 = objc_retainBlock(v23);

  v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:comparator:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:comparator:",  0LL,  1LL,  v24));
  -[NSMutableArray addObject:](v19, "addObject:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor tvhk_ascendingMusicAlbumItemSortDescriptor]( &OBJC_CLASS___NSSortDescriptor,  "tvhk_ascendingMusicAlbumItemSortDescriptor"));
  -[NSMutableArray addObject:](v19, "addObject:", v26);
  [v7 setSortDescriptors:v19];

  v27 = -[TVHMediaItemsFetchPlaybackViewController initWithMediaLibrary:fetchRequest:shuffle:allowRepeat:]( self,  "initWithMediaLibrary:fetchRequest:shuffle:allowRepeat:",  v32,  v7,  v31,  0LL);
  return v27;
}

- (TVHMediaItemsFetchPlaybackViewController)initWithMediaLibrary:(id)a3 mediaCategoryType:(unint64_t)a4 mediaItemIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest mediaItemsFetchRequestWithMediaCategoryType:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "mediaItemsFetchRequestWithMediaCategoryType:",  a4));
  uint64_t v11 = TVHKAllMediaItemProperties(v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  [v10 setProperties:v12];
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate tvhk_identifierPredicateWithIdentifier:]( &OBJC_CLASS___NSPredicate,  "tvhk_identifierPredicateWithIdentifier:",  v9));

  [v10 setPredicate:v13];
  if (v10)
  {
    self =  -[TVHMediaItemsFetchPlaybackViewController initWithMediaLibrary:fetchRequest:shuffle:allowRepeat:]( self,  "initWithMediaLibrary:fetchRequest:shuffle:allowRepeat:",  v8,  v10,  0LL,  0LL);
    id v14 = self;
  }

  else
  {
    id v14 = 0LL;
  }

  return v14;
}

- (TVHMediaItemsFetchPlaybackViewController)initWithMediaLibrary:(id)a3 mediaCategoryType:(unint64_t)a4 mediaEntityCollectionType:(unint64_t)a5 mediaEntityCollectionIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if (a4 != 1) {
    goto LABEL_5;
  }
  if (a5 != 2)
  {
    if (a5 == 1)
    {
      id v12 = (TVHMediaItemsFetchPlaybackViewController *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest mediaItemsFetchRequestWithMediaCategoryType:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "mediaItemsFetchRequestWithMediaCategoryType:",  1LL));
      uint64_t v13 = TVHKMusicMediaItemProperties(v12);
      id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      -[TVHMediaItemsFetchPlaybackViewController setProperties:](v12, "setProperties:", v14);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate tvhk_mediaEntityAlbumIdentifierPredicateWithIdentifier:]( &OBJC_CLASS___NSPredicate,  "tvhk_mediaEntityAlbumIdentifierPredicateWithIdentifier:",  v11));
      -[TVHMediaItemsFetchPlaybackViewController setPredicate:](v12, "setPredicate:", v15);
      uint64_t v16 = objc_claimAutoreleasedReturnValue( +[NSSortDescriptor tvhk_ascendingMusicAlbumItemSortDescriptor]( &OBJC_CLASS___NSSortDescriptor,  "tvhk_ascendingMusicAlbumItemSortDescriptor"));
      goto LABEL_7;
    }

- (void)_fetchRequestDidCompleteWithMediaItems:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    if (-[TVHMediaItemsFetchPlaybackViewController allowRepeat](self, "allowRepeat")) {
      uint64_t v8 = 2LL;
    }
    else {
      uint64_t v8 = 0LL;
    }
    uint64_t v9 = v8 | -[TVHMediaItemsFetchPlaybackViewController shuffle](self, "shuffle");
    id v10 = objc_alloc(&OBJC_CLASS___TVHPlayerPlaylist);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaItemsFetchPlaybackViewController mediaLibrary](self, "mediaLibrary"));
    id v12 = -[TVHPlayerPlaylist initWithHomeSharingMediaItems:mediaLibrary:index:options:]( v10,  "initWithHomeSharingMediaItems:mediaLibrary:index:options:",  v6,  v11,  0LL,  v9);

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaItemsFetchPlaybackViewController tvh_mediaLibrariesEnviroment]( self,  "tvh_mediaLibrariesEnviroment"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 playbackManager]);
    id v19 = self;
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
    [v14 playPlaylist:v12 andRemoveViewControllers:v15];
  }

  else
  {
    id v16 = sub_100079DD8();
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10009C0E8((uint64_t)v7, v17);
    }

    id v12 = (TVHPlayerPlaylist *)objc_claimAutoreleasedReturnValue( -[TVHMediaItemsFetchPlaybackViewController navigationController]( self,  "navigationController"));
    id v18 = -[TVHPlayerPlaylist popViewControllerAnimated:](v12, "popViewControllerAnimated:", 1LL);
  }
}

- (TVHKMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (void)setMediaLibrary:(id)a3
{
}

- (BOOL)shuffle
{
  return self->_shuffle;
}

- (void)setShuffle:(BOOL)a3
{
  self->_shuffle = a3;
}

- (BOOL)allowRepeat
{
  return self->_allowRepeat;
}

- (void)setAllowRepeat:(BOOL)a3
{
  self->_allowRepeat = a3;
}

- (void).cxx_destruct
{
}

@end