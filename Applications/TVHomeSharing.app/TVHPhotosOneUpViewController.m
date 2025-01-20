@interface TVHPhotosOneUpViewController
+ (id)new;
- (BOOL)_isReloadOneUpViewRequiredForChangeSet:(id)a3;
- (BOOL)oneUpViewRequiresReload;
- (NSArray)mediaItems;
- (NSMutableDictionary)imageProxyByImageIdentifier;
- (TVHKMediaLibrary)mediaLibrary;
- (TVHOneUpView)oneUpView;
- (TVHPhotosOneUpViewController)init;
- (TVHPhotosOneUpViewController)initWithCoder:(id)a3;
- (TVHPhotosOneUpViewController)initWithMediaItems:(id)a3 mediaLibrary:(id)a4;
- (TVHPhotosOneUpViewController)initWithMediaItems:(id)a3 mediaLibrary:(id)a4 startIndex:(int64_t)a5;
- (TVHPhotosOneUpViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)_imageProxyForIndex:(unint64_t)a3 forCaching:(BOOL)a4;
- (id)_mediaItemAtIndex:(unint64_t)a3;
- (id)oneUpView:(id)a3 viewForItemAtIndex:(unint64_t)a4;
- (int64_t)focusedMediaItemIndex;
- (int64_t)lastCreatedImageViewIndex;
- (int64_t)oneUpView:(id)a3 contentModeForItemAtIndex:(unint64_t)a4;
- (unint64_t)_totalNumberOfMediaEntites;
- (void)_cancelImageProxyLoadAtIndex:(unint64_t)a3;
- (void)_cancelImageProxyLoadForImageIdentifier:(id)a3;
- (void)_configureImageView:(id)a3 atIndex:(unint64_t)a4;
- (void)_configureOneUpViewWithNewIndexByOldIndexMap:(id)a3;
- (void)_preloadImageProxiesAtIndex:(unint64_t)a3;
- (void)_startLoadingImageProxyAtIndex:(unint64_t)a3;
- (void)_updateCachedImageProxiesWithMediaItems:(id)a3 changeSet:(id)a4;
- (void)_updateWithMediaItems:(id)a3 startIndex:(int64_t)a4 changeSet:(id)a5;
- (void)loadView;
- (void)oneUpView:(id)a3 didFocusItemAtIndex:(unint64_t)a4;
- (void)oneUpView:(id)a3 didPlayItemAtIndex:(unint64_t)a4;
- (void)oneUpView:(id)a3 didSelectItemAtIndex:(unint64_t)a4;
- (void)setFocusedMediaItemIndex:(int64_t)a3;
- (void)setImageProxyByImageIdentifier:(id)a3;
- (void)setLastCreatedImageViewIndex:(int64_t)a3;
- (void)setMediaItems:(id)a3;
- (void)setOneUpView:(id)a3;
- (void)setOneUpViewRequiresReload:(BOOL)a3;
- (void)updateWithMediaItems:(id)a3 andChangeSet:(id)a4;
@end

@implementation TVHPhotosOneUpViewController

+ (id)new
{
  return 0LL;
}

- (TVHPhotosOneUpViewController)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHPhotosOneUpViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v6);

  return 0LL;
}

- (TVHPhotosOneUpViewController)initWithCoder:(id)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHPhotosOneUpViewController)initWithMediaItems:(id)a3 mediaLibrary:(id)a4
{
  return -[TVHPhotosOneUpViewController initWithMediaItems:mediaLibrary:startIndex:]( self,  "initWithMediaItems:mediaLibrary:startIndex:",  a3,  a4,  0x7FFFFFFFFFFFFFFFLL);
}

- (TVHPhotosOneUpViewController)initWithMediaItems:(id)a3 mediaLibrary:(id)a4 startIndex:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TVHPhotosOneUpViewController;
  v10 = -[TVHPhotosOneUpViewController initWithNibName:bundle:](&v15, "initWithNibName:bundle:", 0LL, 0LL);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_mediaLibrary, a4);
    v11->_oneUpViewRequiresReload = 0;
    v11->_focusedMediaItemIndex = 0x7FFFFFFFFFFFFFFFLL;
    v11->_lastCreatedImageViewIndex = 0x7FFFFFFFFFFFFFFFLL;
    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    imageProxyByImageIdentifier = v11->_imageProxyByImageIdentifier;
    v11->_imageProxyByImageIdentifier = v12;

    -[TVHPhotosOneUpViewController _updateWithMediaItems:startIndex:changeSet:]( v11,  "_updateWithMediaItems:startIndex:changeSet:",  v8,  a5,  0LL);
  }

  return v11;
}

- (void)updateWithMediaItems:(id)a3 andChangeSet:(id)a4
{
}

- (void)loadView
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  objc_super v15 = -[TVHOneUpView initWithFrame:](objc_alloc(&OBJC_CLASS___TVHOneUpView), "initWithFrame:", v5, v7, v9, v11);
  -[TVHOneUpView setDataSource:](v15, "setDataSource:", self);
  -[TVHOneUpView setDelegate:](v15, "setDelegate:", self);
  -[TVHOneUpView registerItemViewClass:](v15, "registerItemViewClass:", objc_opt_class(&OBJC_CLASS___TVHOneUpImageView));
  -[TVHOneUpView setTransition:](v15, "setTransition:", 3LL);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
  -[TVHOneUpView setBackgroundColor:](v15, "setBackgroundColor:", v12);

  -[TVHPhotosOneUpViewController setView:](self, "setView:", v15);
  -[TVHPhotosOneUpViewController setOneUpView:](self, "setOneUpView:", v15);
  unint64_t v13 = -[TVHPhotosOneUpViewController focusedMediaItemIndex](self, "focusedMediaItemIndex");
  if ((v13 & 0x8000000000000000LL) == 0)
  {
    unint64_t v14 = v13;
    if (v13 < -[TVHPhotosOneUpViewController _totalNumberOfMediaEntites](self, "_totalNumberOfMediaEntites")) {
      -[TVHOneUpView setFocusedItemIndex:](v15, "setFocusedItemIndex:", v14);
    }
  }

  -[TVHOneUpView setAllowedModes:](v15, "setAllowedModes:", 1LL);
  -[TVHOneUpView setCurrentMode:](v15, "setCurrentMode:", 1LL);
}

- (id)oneUpView:(id)a3 viewForItemAtIndex:(unint64_t)a4
{
  double v6 = (void *)objc_claimAutoreleasedReturnValue([a3 dequeueReusableItemView]);
  [v6 setImageProxy:0];
  -[TVHPhotosOneUpViewController setLastCreatedImageViewIndex:](self, "setLastCreatedImageViewIndex:", a4);
  -[TVHPhotosOneUpViewController _configureImageView:atIndex:](self, "_configureImageView:atIndex:", v6, a4);
  return v6;
}

- (int64_t)oneUpView:(id)a3 contentModeForItemAtIndex:(unint64_t)a4
{
  return 1LL;
}

- (void)oneUpView:(id)a3 didFocusItemAtIndex:(unint64_t)a4
{
}

- (void)oneUpView:(id)a3 didSelectItemAtIndex:(unint64_t)a4
{
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPhotosOneUpViewController _mediaItemAtIndex:](self, "_mediaItemAtIndex:", a4));
  if (v5)
  {
    id v12 = v5;
    double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 type]);
    id v7 = [v6 mediaItemType];

    double v5 = v12;
    if (v7 == (id)2)
    {
      double v8 = objc_alloc(&OBJC_CLASS___TVHPlayerPlaylist);
      double v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPhotosOneUpViewController mediaLibrary](self, "mediaLibrary"));
      double v10 = -[TVHPlayerPlaylist initWithHomeSharingMediaItem:mediaLibrary:]( v8,  "initWithHomeSharingMediaItem:mediaLibrary:",  v12,  v9);

      double v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPhotosOneUpViewController tvh_playbackManager](self, "tvh_playbackManager"));
      [v11 playPlaylist:v10];

      double v5 = v12;
    }
  }
}

- (void)oneUpView:(id)a3 didPlayItemAtIndex:(unint64_t)a4
{
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPhotosOneUpViewController _mediaItemAtIndex:](self, "_mediaItemAtIndex:", a4));
  if (v5)
  {
    id v14 = v5;
    double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 type]);
    id v7 = [v6 mediaItemType];

    if (v7 == (id)2)
    {
      double v8 = objc_alloc(&OBJC_CLASS___TVHPlayerPlaylist);
      double v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPhotosOneUpViewController mediaLibrary](self, "mediaLibrary"));
      double v10 = -[TVHPlayerPlaylist initWithHomeSharingMediaItem:mediaLibrary:]( v8,  "initWithHomeSharingMediaItem:mediaLibrary:",  v14,  v9);

      double v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPhotosOneUpViewController tvh_playbackManager](self, "tvh_playbackManager"));
      [v11 playPlaylist:v10];
    }

    else
    {
      double v10 = (TVHPlayerPlaylist *)objc_claimAutoreleasedReturnValue(-[TVHPhotosOneUpViewController mediaItems](self, "mediaItems"));
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPhotosOneUpViewController mediaLibrary](self, "mediaLibrary"));
      double v11 = (void *)objc_claimAutoreleasedReturnValue( +[TVHPhotosSlideshowViewControllerFactory viewControllerWithMediaItems:mediaLibrary:showSettings:]( &OBJC_CLASS___TVHPhotosSlideshowViewControllerFactory,  "viewControllerWithMediaItems:mediaLibrary:showSettings:",  v10,  v12,  0LL));

      if (v11)
      {
        unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPhotosOneUpViewController navigationController](self, "navigationController"));
        [v13 pushViewController:v11 animated:1];
      }
    }

    double v5 = v14;
  }
}

- (void)_startLoadingImageProxyAtIndex:(unint64_t)a3
{
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPhotosOneUpViewController _mediaItemAtIndex:](self, "_mediaItemAtIndex:"));
  if (v5)
  {
    id v9 = v5;
    double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 imageIdentifier]);
    if (v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPhotosOneUpViewController imageProxyByImageIdentifier](self, "imageProxyByImageIdentifier"));
      double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v6]);
      if (!v8)
      {
        double v8 = (void *)objc_claimAutoreleasedReturnValue( -[TVHPhotosOneUpViewController _imageProxyForIndex:forCaching:]( self,  "_imageProxyForIndex:forCaching:",  a3,  1LL));
        if (v8) {
          [v7 setObject:v8 forKey:v6];
        }
      }
    }

    double v5 = v9;
  }
}

- (void)_cancelImageProxyLoadAtIndex:(unint64_t)a3
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPhotosOneUpViewController _mediaItemAtIndex:](self, "_mediaItemAtIndex:", a3));
  if (v4)
  {
    id v6 = v4;
    double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 imageIdentifier]);
    if (v5) {
      -[TVHPhotosOneUpViewController _cancelImageProxyLoadForImageIdentifier:]( self,  "_cancelImageProxyLoadForImageIdentifier:",  v5);
    }

    double v4 = v6;
  }
}

- (void)_cancelImageProxyLoadForImageIdentifier:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVHPhotosOneUpViewController imageProxyByImageIdentifier](self, "imageProxyByImageIdentifier"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v4]);
  [v5 cancel];
  [v6 removeObjectForKey:v4];
}

- (void)_updateCachedImageProxiesWithMediaItems:(id)a3 changeSet:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_10007AEE4;
  v38[3] = &unk_1000FF580;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v39 = v7;
  [v5 enumerateObjectsUsingBlock:v38];
  double v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  v28 = v6;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 amendChanges]);
  id v10 = [v9 countByEnumeratingWithState:&v34 objects:v41 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v35;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v34 + 1) + 8 * (void)i) destinationIndexes]);
        id v15 = [v14 firstIndex];

        v16 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:v15]);
        v17 = (void *)objc_claimAutoreleasedReturnValue([v16 imageIdentifier]);
        if (v17) {
          -[NSMutableSet addObject:](v8, "addObject:", v17);
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v34 objects:v41 count:16];
    }

    while (v11);
  }

  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPhotosOneUpViewController imageProxyByImageIdentifier](self, "imageProxyByImageIdentifier"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v27 allKeys]);
  id v19 = [v18 countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v31;
    do
    {
      for (j = 0LL; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v31 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v30 + 1) + 8LL * (void)j);
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v7, "objectForKey:", v23));
        if (v24)
        {
          if (-[NSMutableSet containsObject:](v8, "containsObject:", v23))
          {
            -[TVHPhotosOneUpViewController _cancelImageProxyLoadForImageIdentifier:]( self,  "_cancelImageProxyLoadForImageIdentifier:",  v23);
            v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v7, "objectForKey:", v23));
            id v26 = [v25 firstIndex];

            -[TVHPhotosOneUpViewController _startLoadingImageProxyAtIndex:]( self,  "_startLoadingImageProxyAtIndex:",  v26);
          }
        }

        else
        {
          -[NSMutableDictionary removeObjectForKey:](v7, "removeObjectForKey:", v23);
        }
      }

      id v20 = [v18 countByEnumeratingWithState:&v30 objects:v40 count:16];
    }

    while (v20);
  }
}

- (id)_imageProxyForIndex:(unint64_t)a3 forCaching:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPhotosOneUpViewController _mediaItemAtIndex:](self, "_mediaItemAtIndex:"));
  if (v7)
  {
    double v8 = objc_alloc(&OBJC_CLASS___TVImageProxy);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPhotosOneUpViewController mediaLibrary](self, "mediaLibrary"));
    id v10 = -[TVImageProxy initWithObject:imageLoader:groupType:]( v8,  "initWithObject:imageLoader:groupType:",  v7,  v9,  0LL);

    id v11 = objc_alloc(&OBJC_CLASS___TVImageScaleDecorator);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    [v12 bounds];
    id v15 = objc_msgSend(v11, "initWithScaleToSize:", v13, v14);

    [v15 setPreservesAlpha:0];
    -[TVImageProxy setDecorator:](v10, "setDecorator:", v15);
    if (v4 && (-[TVImageProxy isImageAvailable](v10, "isImageAvailable") & 1) == 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue([v7 imageIdentifier]);
      if (v16)
      {
        objc_initWeak(&location, self);
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472LL;
        v19[2] = sub_10007B148;
        v19[3] = &unk_1000FF5D0;
        objc_copyWeak(v22, &location);
        id v20 = v16;
        v17 = v10;
        uint64_t v21 = v17;
        v22[1] = (id)a3;
        -[TVImageProxy setWriteCompletionHandler:](v17, "setWriteCompletionHandler:", v19);
        -[TVImageProxy load](v17, "load");

        objc_destroyWeak(v22);
        objc_destroyWeak(&location);
      }
    }
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

- (void)_preloadImageProxiesAtIndex:(unint64_t)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  for (uint64_t i = -1LL; i != 2; ++i)
  {
    if ((uint64_t)(a3 + i) >= 0)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPhotosOneUpViewController _mediaItemAtIndex:](self, "_mediaItemAtIndex:", a3 + i));
      double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 imageIdentifier]);

      if (v8)
      {
        -[NSMutableSet addObject:](v5, "addObject:", v8);
        -[TVHPhotosOneUpViewController _startLoadingImageProxyAtIndex:](self, "_startLoadingImageProxyAtIndex:", a3 + i);
      }
    }
  }

  id v10 = (id)objc_claimAutoreleasedReturnValue(-[TVHPhotosOneUpViewController imageProxyByImageIdentifier](self, "imageProxyByImageIdentifier"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10007B3DC;
  v11[3] = &unk_1000FF5F8;
  uint64_t v12 = v5;
  double v13 = self;
  id v9 = v5;
  [v10 enumerateKeysAndObjectsUsingBlock:v11];
}

- (unint64_t)_totalNumberOfMediaEntites
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPhotosOneUpViewController mediaItems](self, "mediaItems"));
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (id)_mediaItemAtIndex:(unint64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPhotosOneUpViewController mediaItems](self, "mediaItems"));
  if (-[TVHPhotosOneUpViewController _totalNumberOfMediaEntites](self, "_totalNumberOfMediaEntites") <= a3) {
    id v6 = 0LL;
  }
  else {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:a3]);
  }

  return v6;
}

- (BOOL)_isReloadOneUpViewRequiredForChangeSet:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 deleteChange]);
  if (v4)
  {
    BOOL v5 = 1;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 insertChange]);
    if (v6)
    {
      BOOL v5 = 1;
    }

    else
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 moveChanges]);
      BOOL v5 = [v7 count] != 0;
    }
  }

  return v5;
}

- (void)_configureImageView:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  id v12 = (id)objc_claimAutoreleasedReturnValue( -[TVHPhotosOneUpViewController _imageProxyForIndex:forCaching:]( self,  "_imageProxyForIndex:forCaching:",  a4,  0LL));
  [v6 setImageProxy:v12];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;

  objc_msgSend(v6, "setImageSize:", v9, v11);
}

- (void)_configureOneUpViewWithNewIndexByOldIndexMap:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPhotosOneUpViewController oneUpView](self, "oneUpView"));
  if (v5)
  {
    unsigned int v6 = -[TVHPhotosOneUpViewController oneUpViewRequiresReload](self, "oneUpViewRequiresReload");
    id v7 = -[TVHPhotosOneUpViewController focusedMediaItemIndex](self, "focusedMediaItemIndex");
    if (v6)
    {
      -[TVHPhotosOneUpViewController setOneUpViewRequiresReload:](self, "setOneUpViewRequiresReload:", 0LL);
      [v5 setAdjustedFocusIndex:v7];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_10007B738;
      v10[3] = &unk_1000FF620;
      id v11 = v4;
      [v5 reloadDataWithNewIndexByOldIndexMapping:v10];
    }

    else if ([v5 focusedItemIndex] == v7)
    {
      if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPhotosOneUpViewController oneUpView](self, "oneUpView"));
        double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 focusedItemView]);

        -[TVHPhotosOneUpViewController _configureImageView:atIndex:](self, "_configureImageView:atIndex:", v9, v7);
        [v5 setNeedsLayout];
      }
    }

    else
    {
      [v5 setFocusedItemIndex:v7];
    }
  }
}

- (void)_updateWithMediaItems:(id)a3 startIndex:(int64_t)a4 changeSet:(id)a5
{
  id v18 = a3;
  id v8 = a5;
  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPhotosOneUpViewController mediaItems](self, "mediaItems"));
  -[TVHPhotosOneUpViewController setMediaItems:](self, "setMediaItems:", v18);
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v8 destinationIndexBySourceIndexMap]);
  if (v9)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[TVHPhotosOneUpViewController focusedMediaItemIndex](self, "focusedMediaItemIndex")));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v11]);

    if (v12) {
      uint64_t v13 = (uint64_t)[v12 unsignedIntegerValue];
    }
    else {
      uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    }
    -[TVHPhotosOneUpViewController _updateCachedImageProxiesWithMediaItems:changeSet:]( self,  "_updateCachedImageProxiesWithMediaItems:changeSet:",  v18,  v8);
  }

  else
  {
    uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  }

  if (v13 != 0x7FFFFFFFFFFFFFFFLL || a4 == 0x7FFFFFFFFFFFFFFFLL) {
    a4 = 0LL;
  }
  id v15 = [v18 count];
  else {
    int64_t v16 = 0LL;
  }
  if (v15) {
    uint64_t v17 = v16;
  }
  else {
    uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
  }
  -[TVHPhotosOneUpViewController setFocusedMediaItemIndex:](self, "setFocusedMediaItemIndex:", v17);
  if (v17 != 0x7FFFFFFFFFFFFFFFLL) {
    -[TVHPhotosOneUpViewController _preloadImageProxiesAtIndex:](self, "_preloadImageProxiesAtIndex:", v17);
  }
  -[TVHPhotosOneUpViewController setOneUpViewRequiresReload:]( self,  "setOneUpViewRequiresReload:",  -[TVHPhotosOneUpViewController _isReloadOneUpViewRequiredForChangeSet:]( self,  "_isReloadOneUpViewRequiredForChangeSet:",  v8));
  -[TVHPhotosOneUpViewController _configureOneUpViewWithNewIndexByOldIndexMap:]( self,  "_configureOneUpViewWithNewIndexByOldIndexMap:",  v10);
}

- (TVHKMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (NSArray)mediaItems
{
  return self->_mediaItems;
}

- (void)setMediaItems:(id)a3
{
}

- (int64_t)focusedMediaItemIndex
{
  return self->_focusedMediaItemIndex;
}

- (void)setFocusedMediaItemIndex:(int64_t)a3
{
  self->_focusedMediaItemIndex = a3;
}

- (NSMutableDictionary)imageProxyByImageIdentifier
{
  return self->_imageProxyByImageIdentifier;
}

- (void)setImageProxyByImageIdentifier:(id)a3
{
}

- (TVHOneUpView)oneUpView
{
  return self->_oneUpView;
}

- (void)setOneUpView:(id)a3
{
}

- (BOOL)oneUpViewRequiresReload
{
  return self->_oneUpViewRequiresReload;
}

- (void)setOneUpViewRequiresReload:(BOOL)a3
{
  self->_oneUpViewRequiresReload = a3;
}

- (int64_t)lastCreatedImageViewIndex
{
  return self->_lastCreatedImageViewIndex;
}

- (void)setLastCreatedImageViewIndex:(int64_t)a3
{
  self->_lastCreatedImageViewIndex = a3;
}

- (void).cxx_destruct
{
}

@end