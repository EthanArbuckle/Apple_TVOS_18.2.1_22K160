@interface TVPSharedPSActivityViewController
- (id)_feedCollection;
- (id)_photoStreamHeaderSubtitle;
- (id)_photoStreamHeaderTitle;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)selectedItemIndex;
- (void)_cacheFeedInfoIfRequired;
- (void)_onSelectScreenSaverButton:(id)a3;
- (void)_onSelectSlideshowButton:(id)a3;
- (void)_updateFeedInfoAndUI;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)photoLibraryOneUpControllerWillPop:(id)a3;
- (void)setSelectedItemIndex:(int64_t)a3;
@end

@implementation TVPSharedPSActivityViewController

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue( [v6 dequeueReusableCellWithReuseIdentifier:@"imageCellIdentifier" forIndexPath:v7]);
  if ([v8 tag])
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryFeedCollectionViewController cachingManager](self, "cachingManager"));
    objc_msgSend(v9, "cancelImageRequest:", objc_msgSend(v8, "tag"));
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryFeedCollectionViewController assetAtIndexPath:](self, "assetAtIndexPath:", v7));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pl_managedAsset"));
  BOOL v12 = [v10 playbackStyle] == (id)4;
  v13 = (void *)objc_claimAutoreleasedReturnValue([v10 localIdentifier]);
  [v8 setAssetLocalIdentifier:v13];

  [v8 setIsVideo:v12];
  if (v10)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_100049124;
    v23[3] = &unk_1000CA748;
    id v14 = v8;
    id v24 = v14;
    id v15 = v10;
    id v25 = v15;
    v16 = objc_retainBlock(v23);
    id v22 = v6;
    v17 = (void *)objc_claimAutoreleasedReturnValue([v6 collectionViewLayout]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 layoutAttributesForItemAtIndexPath:v7]);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryFeedCollectionViewController cachingManager](self, "cachingManager"));
    [v18 size];
    LODWORD(v15) = objc_msgSend( v19,  "requestImageForAsset:processingHandler:resultHandler:assetSize:",  v15,  0,  v16);

    [v14 setTag:(int)v15];
    id v6 = v22;
  }

  else {
    v20 = @"Comment-Grid";
  }
  objc_msgSend(v8, "setTotalComments:commentBadge:", objc_msgSend(v11, "totalCommentsCount"), v20);

  return v8;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue( [a3 dequeueReusableSupplementaryViewOfKind:@"supplementaryView" withReuseIdentifier:@"supplementaryViewIdentifier" forIndexPath:v7]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryFeedCollectionViewController photoBatches](self, "photoBatches"));
  id v10 = [v7 row];

  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndex:v10]);
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v11 countsByAssetDisplayType]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v11 batchCreatorName]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSAttributedString px_localizedAttributedStringForUserPostWithCountsSet:defaultTextAttributes:subjectName:]( &OBJC_CLASS___NSAttributedString,  "px_localizedAttributedStringForUserPostWithCountsSet:defaultTextAttributes:subjectName:",  v12,  0LL,  v13));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 string]);
  [v8 setBatchTitle:v15];

  [v8 setIsSharedStream:1];
  return v8;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 delegate]);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryFeedCollectionViewController assetAtIndexPath:](self, "assetAtIndexPath:", v5));
  if ([v7 isPhotoPickerModeEnabled])
  {
    [v7 photoPickerViewController:self selectedPhotoAsset:v8];
  }

  else
  {
    id v9 = [v8 playbackStyle];
    id v10 = objc_alloc(&OBJC_CLASS___TVPSharedPSOneUpViewController);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryFeedCollectionViewController photoLibrary](self, "photoLibrary"));
    BOOL v12 = -[TVPSharedPSOneUpViewController initWithPhotoLibrary:](v10, "initWithPhotoLibrary:", v11);

    v17[0] = @"oneup";
    v17[1] = @"caption";
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 2LL));
    -[TVPSharedPSOneUpViewController setAllowedModes:](v12, "setAllowedModes:", v13);

    -[TVPPhotoLibraryOneUpViewController setSelectedAssetIndex:]( v12,  "setSelectedAssetIndex:",  [v5 item]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue( -[TVPPhotoLibraryFeedCollectionViewController photoStreamFeedCollection]( self,  "photoStreamFeedCollection"));
    -[TVPPhotoLibraryOneUpViewController setAssetCollection:](v12, "setAssetCollection:", v14);

    -[TVPPhotoLibraryOneUpViewController setDelegate:](v12, "setDelegate:", self);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryFeedCollectionViewController photoAssets](self, "photoAssets"));
    -[TVPPhotoLibraryOneUpViewController setSortedMostRecentlyModifiedAssets:]( v12,  "setSortedMostRecentlyModifiedAssets:",  v15);

    if (v9 == (id)4) {
      -[TVPPhotoLibraryOneUpViewController setStartVideoPlaybackOnLoad:](v12, "setStartVideoPlaybackOnLoad:", 1LL);
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSActivityViewController navigationController](self, "navigationController"));
    [v16 pushViewController:v12 animated:1];
  }
}

- (void)photoLibraryOneUpControllerWillPop:(id)a3
{
  id v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryFeedCollectionViewController photoAssets](self, "photoAssets"));

  if (!v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVPSharedAlbumsActivityFeedCache sharedInstance]( &OBJC_CLASS___TVPSharedAlbumsActivityFeedCache,  "sharedInstance"));
    if ([v5 hasFeedInfo])
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 sortedMostRecentlyModifiedAssets]);
      -[TVPPhotoLibraryFeedCollectionViewController setPhotoAssets:](self, "setPhotoAssets:", v6);
    }
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 focusedAsset]);
  -[TVPPhotoLibraryFeedCollectionViewController resetFocusWithFocusedAsset:](self, "resetFocusWithFocusedAsset:", v7);
}

- (void)_onSelectScreenSaverButton:(id)a3
{
  id v7 = @"CollectionID";
  id v8 = @"ActivityFeedCollection";
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"ActivityTitleHeader" value:&stru_1000CC6C8 table:0]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVScreenSaverProvider sharedInstance](&OBJC_CLASS___TVScreenSaverProvider, "sharedInstance"));
  [v6 setScreenSaverWithName:v5 style:0 extraInfo:v3 showConfirmation:1 completion:0];
}

- (void)_onSelectSlideshowButton:(id)a3
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryFeedCollectionViewController photoAssets](self, "photoAssets", a3));
  v4 = -[TVPSlideshowSettingsViewController initWithPhotoAssets:]( objc_alloc(&OBJC_CLASS___TVPSlideshowSettingsViewController),  "initWithPhotoAssets:",  v6);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSActivityViewController navigationController](self, "navigationController"));
  [v5 pushViewController:v4 animated:1];
}

- (id)_photoStreamHeaderTitle
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( [v2 localizedStringForKey:@"ActivityTitleHeader" value:&stru_1000CC6C8 table:0]);

  return v3;
}

- (id)_photoStreamHeaderSubtitle
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryFeedCollectionViewController photoBatches](self, "photoBatches", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = 0LL;
    uint64_t v6 = 0LL;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v2);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        v6 += (uint64_t)[v9 photoAssetCount];
        v5 += (uint64_t)[v9 videoAssetCount];
      }

      id v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v4);
  }

  else
  {
    uint64_t v5 = 0LL;
    uint64_t v6 = 0LL;
  }

  return (id)objc_claimAutoreleasedReturnValue( +[TVPPhotoUtilities getFormattedAssetCountStringForPhotoCount:videoCount:]( &OBJC_CLASS___TVPPhotoUtilities,  "getFormattedAssetCountStringForPhotoCount:videoCount:",  v6,  v5));
}

- (id)_feedCollection
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryFeedCollectionViewController photoLibrary](self, "photoLibrary"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 librarySpecificFetchOptions]);

  [v3 setIncludeAssetSourceTypes:2];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PHAsset fetchAssetsWithOptions:](&OBJC_CLASS___PHAsset, "fetchAssetsWithOptions:", v3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[PHAssetCollection transientAssetCollectionWithAssetFetchResult:title:]( &OBJC_CLASS___PHAssetCollection,  "transientAssetCollectionWithAssetFetchResult:title:",  v4,  0LL));

  return v5;
}

- (void)_cacheFeedInfoIfRequired
{
  id v6 = (id)objc_claimAutoreleasedReturnValue( +[TVPSharedAlbumsActivityFeedCache sharedInstance]( &OBJC_CLASS___TVPSharedAlbumsActivityFeedCache,  "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVPPhotoLibraryFeedCollectionViewController photoStreamFeedCollection]( self,  "photoStreamFeedCollection"));
  [v6 setActivityFeedCollection:v3];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryFeedCollectionViewController photoBatches](self, "photoBatches"));
  [v6 setActivityPhotoBatches:v4];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryFeedCollectionViewController photoAssets](self, "photoAssets"));
  [v6 setSortedMostRecentlyModifiedAssets:v5];
}

- (void)_updateFeedInfoAndUI
{
  id v10 = (id)objc_claimAutoreleasedReturnValue( +[TVPSharedAlbumsActivityFeedCache sharedInstance]( &OBJC_CLASS___TVPSharedAlbumsActivityFeedCache,  "sharedInstance"));
  if ([v10 hasFeedInfo])
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v10 activityFeedCollection]);
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsInAssetCollection:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsInAssetCollection:options:",  v3,  0LL));
    uint64_t v5 = -[TVPFetchManager initWithFetchResult:](objc_alloc(&OBJC_CLASS___TVPFetchManager), "initWithFetchResult:", v4);
    -[TVPPhotoLibraryFeedCollectionViewController setFetchManager:](self, "setFetchManager:", v5);
    -[TVPPhotoLibraryFeedCollectionViewController setPhotoStreamFeedCollection:]( self,  "setPhotoStreamFeedCollection:",  v3);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v10 activityPhotoBatches]);
    -[TVPPhotoLibraryFeedCollectionViewController setPhotoBatches:](self, "setPhotoBatches:", v6);

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v10 sortedMostRecentlyModifiedAssets]);
    -[TVPPhotoLibraryFeedCollectionViewController setPhotoAssets:](self, "setPhotoAssets:", v7);

    -[TVPPhotoLibraryFeedCollectionViewController dismissLoadingView](self, "dismissLoadingView");
    -[TVPPhotoLibraryFeedCollectionViewController updateCollectionHeader](self, "updateCollectionHeader");
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[TVPPhotoLibraryFeedCollectionViewController photoFeedCollectionView]( self,  "photoFeedCollectionView"));
    [v8 reloadData];

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryFeedCollectionViewController cachingManager](self, "cachingManager"));
    [v9 startPrefetchingAssets];
  }

  else
  {
    -[TVPPhotoLibraryFeedCollectionViewController loadPhotoFeedAssets](self, "loadPhotoFeedAssets");
  }
}

- (int64_t)selectedItemIndex
{
  return self->_selectedItemIndex;
}

- (void)setSelectedItemIndex:(int64_t)a3
{
  self->_selectedItemIndex = a3;
}

@end