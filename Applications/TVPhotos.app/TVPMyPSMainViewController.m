@interface TVPMyPSMainViewController
- (id)_feedCollection;
- (id)_photoStreamHeaderSubtitle;
- (id)_photoStreamHeaderTitle;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)selectedItemIndex;
- (void)_onSelectScreenSaverButton:(id)a3;
- (void)_onSelectSlideshowButton:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)photoLibraryOneUpControllerWillPop:(id)a3;
- (void)setSelectedItemIndex:(int64_t)a3;
- (void)viewDidLoad;
@end

@implementation TVPMyPSMainViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVPMyPSMainViewController;
  -[TVPPhotoLibraryFeedCollectionViewController viewDidLoad](&v5, "viewDidLoad");
  dispatch_time_t v3 = dispatch_time(0LL, (uint64_t)(60.0 * 1000000000.0));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003E118;
  block[3] = &unk_1000C9528;
  block[4] = self;
  dispatch_after(v3, &_dispatch_main_q, block);
}

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
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 localIdentifier]);
  [v8 setAssetLocalIdentifier:v11];

  if (v10)
  {
    v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472LL;
    v21 = sub_10003E3E4;
    v22 = &unk_1000CA748;
    id v12 = v8;
    id v23 = v12;
    id v13 = v10;
    id v24 = v13;
    v14 = objc_retainBlock(&v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionViewLayout", v19, v20, v21, v22));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 layoutAttributesForItemAtIndexPath:v7]);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryFeedCollectionViewController cachingManager](self, "cachingManager"));
    [v16 size];
    LODWORD(v13) = objc_msgSend( v17,  "requestImageForAsset:processingHandler:resultHandler:assetSize:",  v13,  0,  v14);

    [v12 setTag:(int)v13];
  }

  return v8;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue( [a3 dequeueReusableSupplementaryViewOfKind:@"supplementaryView" withReuseIdentifier:@"supplementaryViewIdentifier" forIndexPath:v7]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryFeedCollectionViewController photoBatches](self, "photoBatches"));
  id v10 = [v7 row];

  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndex:v10]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 photosInfo]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndex:0]);

  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 creationDate]);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[TVPSharedPSUtilities formattedDateStringForPhotoStreamBatch:]( &OBJC_CLASS___TVPSharedPSUtilities,  "formattedDateStringForPhotoStreamBatch:",  v14));
  [v8 setBatchTitle:v15];

  v16 = (void *)objc_claimAutoreleasedReturnValue( +[TVPPhotoUtilities getFormattedAssetCountStringForPhotoCount:videoCount:]( TVPPhotoUtilities,  "getFormattedAssetCountStringForPhotoCount:videoCount:",  [v11 photoAssetCount],  objc_msgSend(v11, "videoAssetCount")));
  [v8 setBatchDescription:v16];

  [v8 setIsSharedStream:0];
  return v8;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 delegate]);

  if ([v7 isPhotoPickerModeEnabled])
  {
    v8 = (TVPSharedPSOneUpViewController *)objc_claimAutoreleasedReturnValue( -[TVPPhotoLibraryFeedCollectionViewController assetAtIndexPath:]( self,  "assetAtIndexPath:",  v5));
    [v7 photoPickerViewController:self selectedPhotoAsset:v8];
  }

  else
  {
    v9 = objc_alloc(&OBJC_CLASS___TVPSharedPSOneUpViewController);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryFeedCollectionViewController photoLibrary](self, "photoLibrary"));
    v8 = -[TVPSharedPSOneUpViewController initWithPhotoLibrary:](v9, "initWithPhotoLibrary:", v10);

    -[TVPPhotoLibraryOneUpViewController setSelectedAssetIndex:](v8, "setSelectedAssetIndex:", [v5 item]);
    v11 = (void *)objc_claimAutoreleasedReturnValue( -[TVPPhotoLibraryFeedCollectionViewController photoStreamFeedCollection]( self,  "photoStreamFeedCollection"));
    -[TVPPhotoLibraryOneUpViewController setAssetCollection:](v8, "setAssetCollection:", v11);

    v15 = @"oneup";
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
    -[TVPSharedPSOneUpViewController setAllowedModes:](v8, "setAllowedModes:", v12);

    -[TVPPhotoLibraryOneUpViewController setDelegate:](v8, "setDelegate:", self);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryFeedCollectionViewController photoAssets](self, "photoAssets"));
    -[TVPPhotoLibraryOneUpViewController setSortedMostRecentlyModifiedAssets:]( v8,  "setSortedMostRecentlyModifiedAssets:",  v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMyPSMainViewController navigationController](self, "navigationController"));
    [v14 pushViewController:v8 animated:1];
  }
}

- (void)photoLibraryOneUpControllerWillPop:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 focusedAsset]);
  -[TVPPhotoLibraryFeedCollectionViewController resetFocusWithFocusedAsset:](self, "resetFocusWithFocusedAsset:", v4);
}

- (void)_onSelectScreenSaverButton:(id)a3
{
  v9 = @"CollectionID";
  dispatch_time_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVPPhotoLibraryFeedCollectionViewController photoStreamFeedCollection]( self,  "photoStreamFeedCollection",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localIdentifier]);
  id v10 = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( [v6 localizedStringForKey:@"myPhotoStreamTitleHeader" value:&stru_1000CC6C8 table:0]);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVScreenSaverProvider sharedInstance](&OBJC_CLASS___TVScreenSaverProvider, "sharedInstance"));
  [v8 setScreenSaverWithName:v7 style:0 extraInfo:v5 showConfirmation:1 completion:0];
}

- (void)_onSelectSlideshowButton:(id)a3
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryFeedCollectionViewController photoAssets](self, "photoAssets", a3));
  id v4 = -[TVPSlideshowSettingsViewController initWithPhotoAssets:]( objc_alloc(&OBJC_CLASS___TVPSlideshowSettingsViewController),  "initWithPhotoAssets:",  v6);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMyPSMainViewController navigationController](self, "navigationController"));
  [v5 pushViewController:v4 animated:1];
}

- (id)_photoStreamHeaderTitle
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  dispatch_time_t v3 = (void *)objc_claimAutoreleasedReturnValue( [v2 localizedStringForKey:@"myPhotoStreamTitleHeader" value:&stru_1000CC6C8 table:0]);

  return v3;
}

- (id)_photoStreamHeaderSubtitle
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryFeedCollectionViewController photoAssets](self, "photoAssets"));
  dispatch_time_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVPPhotoUtilities getFormattedAssetCountStringForPhotoCount:videoCount:]( TVPPhotoUtilities,  "getFormattedAssetCountStringForPhotoCount:videoCount:",  [v2 count],  0));

  return v3;
}

- (id)_feedCollection
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryFeedCollectionViewController photoLibrary](self, "photoLibrary"));
  dispatch_time_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 librarySpecificFetchOptions]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[PHAssetCollection fetchAssetCollectionsWithType:subtype:options:]( &OBJC_CLASS___PHAssetCollection,  "fetchAssetCollectionsWithType:subtype:options:",  1LL,  100LL,  v3));

  if ([v4 count]) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
  }
  else {
    id v5 = 0LL;
  }

  return v5;
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