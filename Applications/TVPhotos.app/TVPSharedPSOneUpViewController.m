@interface TVPSharedPSOneUpViewController
+ (int64_t)_adjustedFocusIndexForDataItemID:(id)a3 dataItems:(id)a4;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (CGSize)commentsView:(id)a3 sizeForHeaderView:(id)a4;
- (NSArray)allowedModes;
- (NSString)dataItemPropertyID;
- (TVPOneupView)oneUpView;
- (TVPSharedAlbumsActivityFeedCache)feedCache;
- (TVPSharedPSOneUpViewController)initWithPhotoLibrary:(id)a3;
- (id)_getCurrentCommentMetadataForIndexPath:(id)a3;
- (id)_getLikedUserNames;
- (id)_postedAtDatePhraseForComment:(id)a3;
- (id)_postedByPhraseForAsset:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)headerViewForLikesInCommentsView:(id)a3;
- (id)oneupView:(id)a3 getSecondaryViewForMode:(unint64_t)a4;
- (id)oneupView:(id)a3 supplementaryViewForItemAtIndex:(unint64_t)a4;
- (id)oneupView:(id)a3 viewForItemAtIndex:(unint64_t)a4;
- (id)subHeaderViewInCommentsView:(id)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfItemsInOneupView:(id)a3;
- (unint64_t)_allowedModesFromModes:(id)a3;
- (void)_createActivityFeedsAndUpdateCache;
- (void)_reloadCommentsView;
- (void)_updateVideoOverlayForItemView:(id)a3;
- (void)loadView;
- (void)oneupView:(id)a3 didPlayItemAtIndex:(unint64_t)a4;
- (void)oneupView:(id)a3 didSelectItemAtIndex:(unint64_t)a4;
- (void)oneupView:(id)a3 didTransitionToItemInCaptionModeWithIndex:(unint64_t)a4;
- (void)photoLibraryDidChange:(id)a3;
- (void)setAllowedModes:(id)a3;
- (void)setDataItemPropertyID:(id)a3;
- (void)setFeedCache:(id)a3;
- (void)setOneUpView:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVPSharedPSOneUpViewController

- (TVPSharedPSOneUpViewController)initWithPhotoLibrary:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVPSharedPSOneUpViewController;
  v3 = -[TVPPhotoLibraryOneUpViewController initWithPhotoLibrary:](&v7, "initWithPhotoLibrary:", a3);
  if (v3)
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue( +[TVPSharedAlbumsActivityFeedCache sharedInstance]( &OBJC_CLASS___TVPSharedAlbumsActivityFeedCache,  "sharedInstance"));
    feedCache = v3->_feedCache;
    v3->_feedCache = (TVPSharedAlbumsActivityFeedCache *)v4;
  }

  return v3;
}

- (void)loadView
{
  allowedModes = self->_allowedModes;
  if (!allowedModes) {
    goto LABEL_5;
  }
  if (!-[NSArray containsObject:](allowedModes, "containsObject:", @"caption"))
  {
    if (self->_allowedModes)
    {
LABEL_6:
      uint64_t v4 = &OBJC_CLASS___TVPOneupView;
      goto LABEL_7;
    }

- (void)viewWillAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVPSharedPSOneUpViewController;
  -[TVPPhotoLibraryOneUpViewController viewWillAppear:](&v11, "viewWillAppear:", a3);
  if (-[NSString length](self->_dataItemPropertyID, "length"))
  {
    if (-[TVPSharedAlbumsActivityFeedCache hasFeedInfo](self->_feedCache, "hasFeedInfo"))
    {
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVPSharedAlbumsActivityFeedCache activityFeedCollection]( self->_feedCache,  "activityFeedCollection"));
      -[TVPPhotoLibraryOneUpViewController setAssetCollection:](self, "setAssetCollection:", v4);

      v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVPSharedAlbumsActivityFeedCache sortedMostRecentlyModifiedAssets]( self->_feedCache,  "sortedMostRecentlyModifiedAssets"));
      -[TVPPhotoLibraryOneUpViewController setSortedMostRecentlyModifiedAssets:]( self,  "setSortedMostRecentlyModifiedAssets:",  v5);
    }

    else
    {
      -[TVPSharedPSOneUpViewController _createActivityFeedsAndUpdateCache](self, "_createActivityFeedsAndUpdateCache");
    }

    id v7 = (void *)objc_opt_class(self, v6);
    dataItemPropertyID = self->_dataItemPropertyID;
    v9 = (void *)objc_claimAutoreleasedReturnValue( -[TVPSharedAlbumsActivityFeedCache sortedMostRecentlyModifiedAssets]( self->_feedCache,  "sortedMostRecentlyModifiedAssets"));
    id v10 = [v7 _adjustedFocusIndexForDataItemID:dataItemPropertyID dataItems:v9];

    -[TVPPhotoLibraryOneUpViewController setSelectedAssetIndex:](self, "setSelectedAssetIndex:", v10);
    -[TVPOneupView setAdjustedFocusIndex:](self->_oneUpView, "setAdjustedFocusIndex:", v10);
    -[TVPOneupView reloadData](self->_oneUpView, "reloadData");
  }

- (void)photoLibraryDidChange:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100060C70;
  v4[3] = &unk_1000C9CC8;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async(&_dispatch_main_q, v4);
}

- (int64_t)numberOfItemsInOneupView:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryOneUpViewController assetsFetchResult](self, "assetsFetchResult", a3));
  if ([v4 count]) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryOneUpViewController assetsFetchResult](self, "assetsFetchResult"));
  }
  else {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVPPhotoLibraryOneUpViewController sortedMostRecentlyModifiedAssets]( self,  "sortedMostRecentlyModifiedAssets"));
  }
  uint64_t v6 = v5;
  id v7 = [v5 count];

  return (int64_t)v7;
}

- (id)oneupView:(id)a3 viewForItemAtIndex:(unint64_t)a4
{
  return -[TVPPhotoLibraryOneUpViewController configureItemViewForOneupView:AtIndex:showVideoBadgeInCaptionMode:]( self,  "configureItemViewForOneupView:AtIndex:showVideoBadgeInCaptionMode:",  a3,  a4,  1LL);
}

- (id)oneupView:(id)a3 supplementaryViewForItemAtIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryOneUpViewController assetAtIndex:](self, "assetAtIndex:", a4));
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___TVPSharedPSOneupView, v8);
  char isKindOfClass = objc_opt_isKindOfClass(v6, v9);
  id v11 = [v6 currentMode];

  uint64_t v12 = 0LL;
  if (v11 == (id)1 && (isKindOfClass & 1) != 0)
  {
    uint64_t v12 = objc_alloc_init(&OBJC_CLASS___TVPSharedPSOneUpSupplementaryView);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pl_managedAsset"));
    else {
      v14 = @"Comment-1up";
    }
    -[TVPSharedPSOneUpSupplementaryView setCommentsBadgeResource:](v12, "setCommentsBadgeResource:", v14);
    -[TVPSharedPSOneUpSupplementaryView setTotalComments:]( v12,  "setTotalComments:",  [v13 totalCommentsCount]);
  }

  return v12;
}

- (id)oneupView:(id)a3 getSecondaryViewForMode:(unint64_t)a4
{
  id v5 = objc_alloc(&OBJC_CLASS___TVPSharedPSCommentsView);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSOneUpViewController view](self, "view"));
  [v6 bounds];
  id v7 = -[TVPSharedPSCommentsView initWithFrame:](v5, "initWithFrame:");

  -[TVPSharedPSCommentsView registerClass:forHeaderWithReuseIdentifier:]( v7,  "registerClass:forHeaderWithReuseIdentifier:",  objc_opt_class(&OBJC_CLASS___TVPSharedPSLikeViewCell, v8),  @"TVPSharedPSCommentsHeaderCellIdentifier");
  -[TVPSharedPSCommentsView registerClass:forSubheaderWithReuseIdentifier:]( v7,  "registerClass:forSubheaderWithReuseIdentifier:",  objc_opt_class(&OBJC_CLASS___TVPSharedPSAlbumCreatorCell, v9),  @"TVPSharedPSAlbumCreatorCellIdentifier");
  -[TVPSharedPSCommentsView registerClass:forCommentsWithReuseIdentifier:]( v7,  "registerClass:forCommentsWithReuseIdentifier:",  objc_opt_class(&OBJC_CLASS___TVPSharedPSCommentsViewCell, v10),  @"TVPSharedPSCommentsViewCellIdentifier");
  -[TVPSharedPSCommentsView setDataSource:](v7, "setDataSource:", self);
  -[TVPSharedPSCommentsView setDelegate:](v7, "setDelegate:", self);
  return v7;
}

- (void)oneupView:(id)a3 didSelectItemAtIndex:(unint64_t)a4
{
  id v6 = a3;
  -[TVPPhotoLibraryOneUpViewController setSelectedAssetIndex:](self, "setSelectedAssetIndex:", a4);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryOneUpViewController assetAtIndex:](self, "assetAtIndex:", a4));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pl_managedAsset"));
  if ([v6 currentMode] == (id)1)
  {
    if ([v7 playbackStyle] == (id)4)
    {
      if (!-[TVPPhotoLibraryOneUpViewController isVideoAssetDownloading](self, "isVideoAssetDownloading"))
      {
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 focusedItemView]);
        [v9 displayVideoLoadingSpinnerOverlay];
        -[TVPPhotoLibraryOneUpViewController startVideoPlaybackForItem:](self, "startVideoPlaybackForItem:", v7);
      }
    }

    else if ((objc_opt_respondsToSelector(v6, "switchToOneupCaptionView") & 1) != 0)
    {
      [v6 switchToOneupCaptionView];
    }
  }

  else if ([v6 currentMode] == (id)4)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 photoLibrary]);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100061038;
    v11[3] = &unk_1000C9528;
    id v12 = v8;
    [v10 performTransaction:v11];
  }
}

- (void)oneupView:(id)a3 didPlayItemAtIndex:(unint64_t)a4
{
  id v8 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryOneUpViewController assetAtIndex:](self, "assetAtIndex:", a4));
  if ([v6 playbackStyle] == (id)4
    && !-[TVPPhotoLibraryOneUpViewController isVideoAssetDownloading](self, "isVideoAssetDownloading"))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 focusedItemView]);
    [v7 displayVideoLoadingSpinnerOverlay];
    -[TVPPhotoLibraryOneUpViewController startVideoPlaybackForItem:](self, "startVideoPlaybackForItem:", v6);
  }
}

- (void)oneupView:(id)a3 didTransitionToItemInCaptionModeWithIndex:(unint64_t)a4
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryOneUpViewController assetAtIndex:](self, "assetAtIndex:", a4));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pl_managedAsset"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 photoLibrary]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10006119C;
  v8[3] = &unk_1000C9528;
  id v9 = v5;
  id v7 = v5;
  [v6 performTransaction:v8];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVPPhotoLibraryOneUpViewController assetAtIndex:]( self,  "assetAtIndex:",  -[TVPOneupView focusedItemIndex](self->_oneUpView, "focusedItemIndex", a3, a4)));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pl_managedAsset"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 cloudComments]);
  id v7 = [v6 count];

  return (int64_t)v7;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( [a3 dequeueReusableCellWithReuseIdentifier:@"TVPSharedPSCommentsViewCellIdentifier" forIndexPath:v6]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[TVPSharedPSOneUpViewController _getCurrentCommentMetadataForIndexPath:]( self,  "_getCurrentCommentMetadataForIndexPath:",  v6));

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 commentText]);
    [v7 setCommentText:v9];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[TVPSharedPSOneUpViewController _postedAtDatePhraseForComment:]( self,  "_postedAtDatePhraseForComment:",  v8));
    [v7 setCommentCaption:v10];
  }

  return v7;
}

- (id)headerViewForLikesInCommentsView:(id)a3
{
  oneUpView = self->_oneUpView;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[TVPPhotoLibraryOneUpViewController assetAtIndex:]( self,  "assetAtIndex:",  -[TVPOneupView focusedItemIndex](oneUpView, "focusedItemIndex")));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pl_managedAsset"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 dequeueReusableViewForIdentifier:@"TVPSharedPSCommentsHeaderCellIdentifier"]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSOneUpViewController _getLikedUserNames](self, "_getLikedUserNames"));
  objc_msgSend(v8, "setLikedUsers:isLikedByMe:", v9, objc_msgSend(v7, "userCloudSharedLiked"));
  [v8 setClipsToBounds:1];

  return v8;
}

- (id)subHeaderViewInCommentsView:(id)a3
{
  oneUpView = self->_oneUpView;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[TVPPhotoLibraryOneUpViewController assetAtIndex:]( self,  "assetAtIndex:",  -[TVPOneupView focusedItemIndex](oneUpView, "focusedItemIndex")));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pl_managedAsset"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 dequeueReusableViewForIdentifier:@"TVPSharedPSAlbumCreatorCellIdentifier"]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSOneUpViewController _postedByPhraseForAsset:](self, "_postedByPhraseForAsset:", v7));
  [v8 setCreatorName:v9];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 dateCreated]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[TVPSharedPSUtilities stringForDisplayingDateAndTime:]( &OBJC_CLASS___TVPSharedPSUtilities,  "stringForDisplayingDateAndTime:",  v10));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v11));
  [v8 setDateCreated:v12];

  return v8;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[TVPSharedPSOneUpViewController _getCurrentCommentMetadataForIndexPath:]( self,  "_getCurrentCommentMetadataForIndexPath:",  a5));
  id v9 = v8;
  if (v8)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 commentText]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( -[TVPSharedPSOneUpViewController _postedAtDatePhraseForComment:]( self,  "_postedAtDatePhraseForComment:",  v9));
    [v7 frame];
    +[TVPSharedPSCommentsViewCell maxCellHeightWithTitle:subtitle:maxWidth:]( &OBJC_CLASS___TVPSharedPSCommentsViewCell,  "maxCellHeightWithTitle:subtitle:maxWidth:",  v10,  v11,  v12);
    double v14 = v13;
    [v7 frame];
    double v16 = v15;
  }

  else
  {
    double v16 = 0.0;
    double v14 = 0.0;
  }

  double v17 = v16;
  double v18 = v14;
  result.height = v18;
  result.width = v17;
  return result;
}

- (CGSize)commentsView:(id)a3 sizeForHeaderView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[TVPPhotoLibraryOneUpViewController assetAtIndex:]( self,  "assetAtIndex:",  -[TVPOneupView focusedItemIndex](self->_oneUpView, "focusedItemIndex")));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pl_managedAsset"));
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___TVPSharedPSLikeViewCell, v10);
  if ((objc_opt_isKindOfClass(v7, v11) & 1) != 0)
  {
    double v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSOneUpViewController _getLikedUserNames](self, "_getLikedUserNames"));
    [v6 frame];
    +[TVPSharedPSLikeViewCell maxCellHeightWithLikes:maxWidth:isLikedByMe:]( TVPSharedPSLikeViewCell,  "maxCellHeightWithLikes:maxWidth:isLikedByMe:",  v13,  [v9 userCloudSharedLiked],  v14);
    double v16 = v15;

    [v6 frame];
    double v18 = v17;
  }

  else
  {
    uint64_t v19 = objc_opt_class(&OBJC_CLASS___TVPSharedPSAlbumCreatorCell, v12);
    double v18 = 0.0;
    double v16 = 0.0;
    if ((objc_opt_isKindOfClass(v7, v19) & 1) != 0)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSOneUpViewController _postedByPhraseForAsset:](self, "_postedByPhraseForAsset:", v9));
      v21 = (void *)objc_claimAutoreleasedReturnValue([v9 dateCreated]);
      v22 = (void *)objc_claimAutoreleasedReturnValue( +[TVPSharedPSUtilities stringForDisplayingDateAndTime:]( &OBJC_CLASS___TVPSharedPSUtilities,  "stringForDisplayingDateAndTime:",  v21));
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v22));

      [v6 frame];
      +[TVPSharedPSAlbumCreatorCell maxCellHeightWithTitle:subtitle:maxWidth:]( &OBJC_CLASS___TVPSharedPSAlbumCreatorCell,  "maxCellHeightWithTitle:subtitle:maxWidth:",  v20,  v23,  v24);
      double v16 = v25;
      [v6 frame];
      double v18 = v26;
    }
  }

  double v27 = v18;
  double v28 = v16;
  result.height = v28;
  result.width = v27;
  return result;
}

- (void)_updateVideoOverlayForItemView:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSOneUpViewController view](self, "view"));
  BOOL v6 = [v5 currentMode] == (id)4;
  BOOL v7 = v6;
  if (v6) {
    id v8 = @"Video";
  }
  else {
    id v8 = @"PlayVideo";
  }
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", v8));
  [v4 displayVideoOverlayIcon:v9 isVideoBadge:v7];
}

- (id)_postedAtDatePhraseForComment:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 commentDate]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVPSharedPSUtilities getFormattedStringForCommentPostedOnDate:]( &OBJC_CLASS___TVPSharedPSUtilities,  "getFormattedStringForCommentPostedOnDate:",  v4));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v3 isMyComment]);
  unsigned int v7 = [v6 BOOLValue];

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 localizedStringForKey:@"YouPostedAtDateFormat" value:&stru_1000CC6C8 table:0]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v9, v5));
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 commenterDisplayName]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( [v9 localizedStringForKey:@"SomeonePostedAtDateFormat" value:&stru_1000CC6C8 table:0]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v11, v8, v5));
  }

  return v10;
}

- (id)_postedByPhraseForAsset:(id)a3
{
  id v3 = a3;
  if ([v3 cloudIsMyAsset])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:@"PostedByYou" value:&stru_1000CC6C8 table:0]);
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 cloudOwnerDisplayName]);
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( [v6 localizedStringForKey:@"PostedBySomeoneFormat" value:&stru_1000CC6C8 table:0]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v7, v4));
  }

  return v5;
}

+ (int64_t)_adjustedFocusIndexForDataItemID:(id)a3 dataItems:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    int64_t v7 = 0LL;
    while (1)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:v7]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 localIdentifier]);
      unsigned int v10 = [v9 isEqualToString:v5];

      if (v10) {
        break;
      }
    }
  }

  else
  {
LABEL_5:
    int64_t v7 = 0LL;
  }

  return v7;
}

- (unint64_t)_allowedModesFromModes:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 containsObject:@"oneup"];
  unsigned int v5 = [v3 containsObject:@"caption"];

  unint64_t v6 = v4 | 4;
  if (!v5) {
    unint64_t v6 = v4;
  }
  if (v6 <= 1) {
    return 1LL;
  }
  else {
    return v6;
  }
}

- (id)_getCurrentCommentMetadataForIndexPath:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVPPhotoLibraryOneUpViewController assetAtIndex:]( self,  "assetAtIndex:",  -[TVPOneupView focusedItemIndex](self->_oneUpView, "focusedItemIndex")));
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pl_managedAsset"));
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 orderedCloudComments]);
  id v8 = [v7 count];
  if (v8 <= [v4 item]) {
    id v9 = 0LL;
  }
  else {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v4, "item")));
  }

  return v9;
}

- (id)_getLikedUserNames
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[TVPPhotoLibraryOneUpViewController assetAtIndex:]( self,  "assetAtIndex:",  -[TVPOneupView focusedItemIndex](self->_oneUpView, "focusedItemIndex")));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "pl_managedAsset"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 orderedLikeComments]);
  unsigned int v5 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v4 count]);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "isMyComment", (void)v16));
        unsigned __int8 v13 = [v12 BOOLValue];

        if ((v13 & 1) == 0)
        {
          double v14 = (void *)objc_claimAutoreleasedReturnValue([v11 commenterDisplayName]);
          if ([v14 length]) {
            -[NSMutableArray addObject:](v5, "addObject:", v14);
          }
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v8);
  }

  return v5;
}

- (void)_reloadCommentsView
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVPOneupView subviews](self->_oneUpView, "subviews"));
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v3 = v2;
  id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)i);
        uint64_t v9 = objc_opt_class(&OBJC_CLASS___TVPSharedPSCommentsView, v4);
        if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

- (void)_createActivityFeedsAndUpdateCache
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedAlbumsActivityFeedCache activityFeedCollection](self->_feedCache, "activityFeedCollection"));
  -[TVPPhotoLibraryOneUpViewController setAssetCollection:](self, "setAssetCollection:", v3);

  id v4 = (id)objc_claimAutoreleasedReturnValue( -[TVPSharedAlbumsActivityFeedCache sortedMostRecentlyModifiedAssets]( self->_feedCache,  "sortedMostRecentlyModifiedAssets"));
  -[TVPPhotoLibraryOneUpViewController setSortedMostRecentlyModifiedAssets:]( self,  "setSortedMostRecentlyModifiedAssets:",  v4);
}

- (NSArray)allowedModes
{
  return self->_allowedModes;
}

- (void)setAllowedModes:(id)a3
{
}

- (NSString)dataItemPropertyID
{
  return self->_dataItemPropertyID;
}

- (void)setDataItemPropertyID:(id)a3
{
}

- (TVPOneupView)oneUpView
{
  return self->_oneUpView;
}

- (void)setOneUpView:(id)a3
{
}

- (TVPSharedAlbumsActivityFeedCache)feedCache
{
  return self->_feedCache;
}

- (void)setFeedCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end