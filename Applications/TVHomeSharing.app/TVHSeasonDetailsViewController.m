@interface TVHSeasonDetailsViewController
- (CGSize)_genreShowImageSize;
- (CGSize)_showImageSize;
- (NSArray)episodes;
- (TVHKMediaEntitiesFetchContext)showsFetchContext;
- (TVHKMediaEntityCollection)show;
- (TVHKMediaItem)nextPlaybackEpisode;
- (TVHProductContentSectionItem)episodesContentSectionItem;
- (TVHProductContentSectionItem)footerContentSectionItem;
- (TVHProductContentSectionItem)genreShowsContentSectionItem;
- (TVHProductContentSectionItem)seperatorContentSectionItem;
- (TVHProductViewController)productViewController;
- (TVHSeasonDetailsViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7;
- (TVHSeasonDetailsViewController)initWithSeason:(id)a3 seasonsFetchContext:(id)a4 show:(id)a5 showsFetchContext:(id)a6 showsInfoCenter:(id)a7;
- (TVHSeasonDetailsViewControllerDelegate)seasonDetailsDelegate;
- (TVHShowsInfoCenter)showsInfoCenter;
- (id)_episodesViewController;
- (id)_footerViewController;
- (id)_genreShowsViewController;
- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6;
- (void)_playButtonLockupSelected;
- (void)_playEpisode:(id)a3;
- (void)_seasonsButtonLockupSelected;
- (void)_updatePlayButtonLockup:(id)a3 withEpisodeNumber:(id)a4;
- (void)_updateProductViewControllerBannerView;
- (void)_updateProductViewControllerContentSectionItems;
- (void)_updateProductViewControllerFooterView;
- (void)_updateWithFetchControllerResultSet:(id)a3;
- (void)dealloc;
- (void)mediaEntitiesFetchViewController:(id)a3 purgeSourceMediaEntityBackgroundImagesForContentViewController:(id)a4;
- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withFetchControllerResultSet:(id)a5;
- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withSourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6;
- (void)mediaEntitiesShelfViewController:(id)a3 configureLockup:(id)a4 forMediaEntity:(id)a5;
- (void)mediaEntitiesShelfViewController:(id)a3 didSelectMediaEntity:(id)a4;
- (void)productInfoViewDidSelectContentDescription:(id)a3;
- (void)productViewController:(id)a3 didOverrideUserInterfaceStyle:(int64_t)a4;
- (void)seasonEpisodesViewController:(id)a3 didPlayEpisode:(id)a4;
- (void)seasonEpisodesViewController:(id)a3 didSelectEpisode:(id)a4;
- (void)setEpisodes:(id)a3;
- (void)setEpisodesContentSectionItem:(id)a3;
- (void)setFooterContentSectionItem:(id)a3;
- (void)setGenreShowsContentSectionItem:(id)a3;
- (void)setNextPlaybackEpisode:(id)a3;
- (void)setOverrideUserInterfaceStyle:(int64_t)a3;
- (void)setProductViewController:(id)a3;
- (void)setSeasonDetailsDelegate:(id)a3;
- (void)setSeperatorContentSectionItem:(id)a3;
- (void)setShow:(id)a3;
- (void)setShowsFetchContext:(id)a3;
- (void)showsInfoCenterDidChange:(id)a3;
@end

@implementation TVHSeasonDetailsViewController

- (TVHSeasonDetailsViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7
{
  v8 = NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v9);

  return 0LL;
}

- (TVHSeasonDetailsViewController)initWithSeason:(id)a3 seasonsFetchContext:(id)a4 show:(id)a5 showsFetchContext:(id)a6 showsInfoCenter:(id)a7
{
  id v29 = a5;
  id obj = a7;
  id v28 = a6;
  id v13 = a7;
  id v14 = a4;
  id v15 = a3;
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 identifier]);
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest mediaItemsFetchRequestWithMediaCategoryType:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "mediaItemsFetchRequestWithMediaCategoryType:",  4LL));
  [v17 setIdentifier:@"__SeasonEpisodesFetchRequestIdentifier"];
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate tvhk_mediaEntityAlbumIdentifierPredicateWithIdentifier:]( &OBJC_CLASS___NSPredicate,  "tvhk_mediaEntityAlbumIdentifierPredicateWithIdentifier:",  v16));
  uint64_t v19 = TVHKShowEpisodeProperties([v17 setPredicate:v18]);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  [v17 setProperties:v20];

  v21 = (void *)objc_claimAutoreleasedReturnValue([v13 mediaLibrary]);
  v31 = v17;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v31, 1LL));
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___TVHSeasonDetailsViewController;
  v23 = -[TVHMediaEntitiesFetchViewController initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:]( &v30,  "initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:",  v21,  v22,  2LL,  v15,  v14);

  if (v23)
  {
    objc_storeStrong((id *)&v23->_show, a5);
    objc_storeStrong((id *)&v23->_showsFetchContext, a6);
    objc_storeStrong((id *)&v23->_showsInfoCenter, obj);
    -[TVHShowsInfoCenter addObserver:](v23->_showsInfoCenter, "addObserver:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v25 = (void *)objc_claimAutoreleasedReturnValue( [v24 localizedStringForKey:@"NO_EPISODES_ERROR_MESSAGE" value:0 table:0]);

    -[TVHMediaEntitiesFetchViewController setNoContentErrorMessage:](v23, "setNoContentErrorMessage:", v25);
    -[TVHMediaEntitiesFetchViewController setDelegate:](v23, "setDelegate:", v23);
    -[TVHMediaEntitiesFetchViewController setEnableFetchingWhenViewFirstAppears:]( v23,  "setEnableFetchingWhenViewFirstAppears:",  1LL);
  }

  return v23;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVHSeasonDetailsViewController;
  -[TVHMediaEntitiesFetchViewController dealloc](&v3, "dealloc");
}

- (void)setSeasonDetailsDelegate:(id)a3
{
  p_seasonDetailsDelegate = &self->_seasonDetailsDelegate;
  id v5 = a3;
  objc_storeWeak((id *)p_seasonDetailsDelegate, v5);
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFE | objc_opt_respondsToSelector( v5,  "seasonDetailsViewController:didOverrideUs erInterfaceStyle:") & 1;
  LOBYTE(p_seasonDetailsDelegate) = objc_opt_respondsToSelector(v5, "seasonDetailsViewControllerDidSelectSeasonPicker:");

  else {
    char v6 = 0;
  }
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFD | v6;
}

- (void)setOverrideUserInterfaceStyle:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVHSeasonDetailsViewController;
  -[TVHSeasonDetailsViewController setOverrideUserInterfaceStyle:](&v6, "setOverrideUserInterfaceStyle:");
  if ((*(_BYTE *)&self->_delegateFlags & 1) != 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonDetailsViewController seasonDetailsDelegate](self, "seasonDetailsDelegate"));
    [v5 seasonDetailsViewController:self didOverrideUserInterfaceStyle:a3];
  }

- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6
{
  id v8 = a6;
  id v21 = a4;
  v9 = -[TVHProductViewController initWithStyle:backgroundImageInfo:]( objc_alloc(&OBJC_CLASS___TVHProductViewController),  "initWithStyle:backgroundImageInfo:",  1LL,  v8);

  -[TVHProductViewController setDelegate:](v9, "setDelegate:", self);
  -[TVHSeasonDetailsViewController setProductViewController:](self, "setProductViewController:", v9);
  v20 = -[TVHMediaEntitiesDataSource initWithFetchResultIdentifier:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSource),  "initWithFetchResultIdentifier:",  @"__SeasonEpisodesFetchRequestIdentifier");
  v10 = objc_alloc(&OBJC_CLASS___TVHSeasonEpisodesViewController);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
  v12 = -[TVHSeasonEpisodesViewController initWithMediaLibrary:dataSource:]( v10,  "initWithMediaLibrary:dataSource:",  v11,  v20);

  -[TVHSeasonEpisodesViewController setDelegate:](v12, "setDelegate:", self);
  id v13 = -[TVHProductContentSectionItem initWithViewController:spacing:]( objc_alloc(&OBJC_CLASS___TVHProductContentSectionItem),  "initWithViewController:spacing:",  v12,  116.0);
  -[TVHSeasonDetailsViewController setEpisodesContentSectionItem:](self, "setEpisodesContentSectionItem:", v13);
  id v14 = objc_alloc_init(&OBJC_CLASS___TVHSeparatorView);
  id v15 = objc_alloc_init(&OBJC_CLASS___UIViewController);
  -[UIViewController setView:](v15, "setView:", v14);
  v16 = -[TVHProductContentSectionItem initWithViewController:spacing:]( objc_alloc(&OBJC_CLASS___TVHProductContentSectionItem),  "initWithViewController:spacing:",  v15,  60.0);
  -[TVHSeasonDetailsViewController setSeperatorContentSectionItem:](self, "setSeperatorContentSectionItem:", v16);
  v17 = objc_alloc_init(&OBJC_CLASS___TVHProductFooterViewController);
  v18 = -[TVHProductContentSectionItem initWithViewController:spacing:]( objc_alloc(&OBJC_CLASS___TVHProductContentSectionItem),  "initWithViewController:spacing:",  v17,  60.0);
  -[TVHSeasonDetailsViewController setFooterContentSectionItem:](self, "setFooterContentSectionItem:", v18);
  -[TVHSeasonDetailsViewController _updateWithFetchControllerResultSet:]( self,  "_updateWithFetchControllerResultSet:",  v21);

  -[TVHSeasonDetailsViewController _updateProductViewControllerContentSectionItems]( self,  "_updateProductViewControllerContentSectionItems");
  return v9;
}

- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withFetchControllerResultSet:(id)a5
{
}

- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withSourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6
{
  id v7 = a6;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[TVHSeasonDetailsViewController productViewController](self, "productViewController"));
  [v8 setBackgroundImageInfo:v7];
}

- (void)mediaEntitiesFetchViewController:(id)a3 purgeSourceMediaEntityBackgroundImagesForContentViewController:(id)a4
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVHSeasonDetailsViewController productViewController](self, "productViewController", a3, a4));
  [v4 purgeBackgroundImages];
}

- (void)productViewController:(id)a3 didOverrideUserInterfaceStyle:(int64_t)a4
{
}

- (void)showsInfoCenterDidChange:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonDetailsViewController show](self, "show"));
  id v8 = (id)objc_claimAutoreleasedReturnValue([v5 identifier]);

  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v4 showByIdentifier]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v8]);

  -[TVHSeasonDetailsViewController setShow:](self, "setShow:", v7);
  -[TVHSeasonDetailsViewController _updateProductViewControllerContentSectionItems]( self,  "_updateProductViewControllerContentSectionItems");
}

- (void)mediaEntitiesShelfViewController:(id)a3 configureLockup:(id)a4 forMediaEntity:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
  +[TVHPosterLockupConfigurator configurePosterLockup:withMediaEntity:mediaLibrary:]( &OBJC_CLASS___TVHPosterLockupConfigurator,  "configurePosterLockup:withMediaEntity:mediaLibrary:",  v8,  v7,  v9);
}

- (void)mediaEntitiesShelfViewController:(id)a3 didSelectMediaEntity:(id)a4
{
  id v5 = a4;
  objc_super v6 = objc_alloc(&OBJC_CLASS___TVHShowSeasonViewController);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonDetailsViewController showsFetchContext](self, "showsFetchContext"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonDetailsViewController showsInfoCenter](self, "showsInfoCenter"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 selectedSeasonIdentifier]);
  v11 = -[TVHShowSeasonViewController initWithShow:showsFetchContext:showsInfoCenter:seasonIdentifier:]( v6,  "initWithShow:showsFetchContext:showsInfoCenter:seasonIdentifier:",  v5,  v7,  v8,  v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonDetailsViewController navigationController](self, "navigationController"));
  [v10 pushViewController:v11 animated:1];
}

- (void)seasonEpisodesViewController:(id)a3 didSelectEpisode:(id)a4
{
}

- (void)seasonEpisodesViewController:(id)a3 didPlayEpisode:(id)a4
{
}

- (void)productInfoViewDidSelectContentDescription:(id)a3
{
  id v4 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[TVHSeasonDetailsViewController _season](self, "_season"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tvh_displayTitle"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v4 contentDescription]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 string]);
  id v8 = [[TVSUITextAlertController alloc] initWithTitle:v5 text:v7];
  -[TVHSeasonDetailsViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v8,  1LL,  0LL);
}

- (void)_playButtonLockupSelected
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVHSeasonDetailsViewController nextPlaybackEpisode](self, "nextPlaybackEpisode"));
  -[TVHSeasonDetailsViewController _playEpisode:](self, "_playEpisode:", v3);
}

- (void)_seasonsButtonLockupSelected
{
  if ((*(_BYTE *)&self->_delegateFlags & 2) != 0)
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVHSeasonDetailsViewController seasonDetailsDelegate](self, "seasonDetailsDelegate"));
    [v3 seasonDetailsViewControllerDidSelectSeasonPicker:self];
  }

- (id)_episodesViewController
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonDetailsViewController episodesContentSectionItem](self, "episodesContentSectionItem"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 viewController]);

  return v3;
}

- (id)_genreShowsViewController
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonDetailsViewController genreShowsContentSectionItem](self, "genreShowsContentSectionItem"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 viewController]);

  return v3;
}

- (id)_footerViewController
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonDetailsViewController footerContentSectionItem](self, "footerContentSectionItem"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 viewController]);

  return v3;
}

- (void)_updateWithFetchControllerResultSet:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 results]);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 response]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 mediaEntitiesResult]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 mediaEntities]);

  -[TVHSeasonDetailsViewController setEpisodes:](self, "setEpisodes:", v9);
  uint64_t v10 = TVHKNextPlaybackMediaItemForMediaItems(v9, 0LL);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  -[TVHSeasonDetailsViewController setNextPlaybackEpisode:](self, "setNextPlaybackEpisode:", v11);
  -[TVHSeasonDetailsViewController _updateProductViewControllerBannerView]( self,  "_updateProductViewControllerBannerView");
  -[TVHSeasonDetailsViewController _updateProductViewControllerFooterView]( self,  "_updateProductViewControllerFooterView");
  v12 = -[TVHMediaEntitiesDataSourceFetchResult initWithFetchControllerResultSet:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSourceFetchResult),  "initWithFetchControllerResultSet:",  v4);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonDetailsViewController _episodesViewController](self, "_episodesViewController"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 dataSource]);
  v16 = v12;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  [v14 updateWithMediaEntitiesDataSourceFetchResults:v15];
}

- (void)_updateProductViewControllerBannerView
{
  id v42 = (id)objc_claimAutoreleasedReturnValue(-[TVHSeasonDetailsViewController show](self, "show"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonDetailsViewController _season](self, "_season"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonDetailsViewController episodes](self, "episodes"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);

  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonDetailsViewController nextPlaybackEpisode](self, "nextPlaybackEpisode"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonDetailsViewController productViewController](self, "productViewController"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v41 bannerView]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 infoView]);
  [v8 setDelegate:self];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "tvh_displayTitle"));
  [v8 setTitle:v9];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tvh_displayTitle"));
  [v8 setSubtitle:v10];

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tvh_contentDescriptionAttributedString"));
  [v8 setContentDescription:v11];

  v12 = (void *)objc_claimAutoreleasedReturnValue([v8 controls]);
  id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v40 = v12;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 firstObject]);
  if (!v14)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[TVHButtonLockup playVideoButtonLockup](&OBJC_CLASS___TVHButtonLockup, "playVideoButtonLockup"));
    [v14 addTarget:self action:"_playButtonLockupSelected" forControlEvents:0x2000];
  }

  -[NSMutableArray addObject:](v13, "addObject:", v14);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 episodeNumber]);
  v39 = v14;
  -[TVHSeasonDetailsViewController _updatePlayButtonLockup:withEpisodeNumber:]( self,  "_updatePlayButtonLockup:withEpisodeNumber:",  v14,  v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue([v42 seasonCount]);
  id v17 = [v16 unsignedIntegerValue];

  if ((unint64_t)v17 >= 2)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[TVHButtonLockup seasonsButtonLockup](&OBJC_CLASS___TVHButtonLockup, "seasonsButtonLockup"));
    [v18 addTarget:self action:"_seasonsButtonLockupSelected" forControlEvents:0x2000];
    -[NSMutableArray addObject:](v13, "addObject:", v18);
  }

  [v8 setControls:v13];
  uint64_t v19 = (TVHProductMetadataView *)objc_claimAutoreleasedReturnValue([v8 metadataView]);
  v38 = v13;
  if (!v19)
  {
    uint64_t v19 = objc_alloc_init(&OBJC_CLASS___TVHProductMetadataView);
    [v8 setMetadataView:v19];
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tvh_displayGenreTitle"));
  -[TVHProductMetadataView setGenreTitle:](v19, "setGenreTitle:", v20);

  id v21 = (void *)objc_claimAutoreleasedReturnValue([v3 releaseYear]);
  -[TVHProductMetadataView setReleaseYear:](v19, "setReleaseYear:", v21);

  -[TVHProductMetadataView setHighDefinition:](v19, "setHighDefinition:", objc_msgSend(v5, "tvh_isHighDefinition"));
  v37 = v5;
  v22 = (void *)objc_claimAutoreleasedReturnValue([v6 contentRating]);
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[VUIContentRatingBadgeManager sharedInstance]( &OBJC_CLASS___VUIContentRatingBadgeManager,  "sharedInstance"));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 badgeForContentRating:v22 drawUnknownRatingBadge:0]);

  v25 = (void *)objc_claimAutoreleasedReturnValue([v22 ratingLabel]);
  -[TVHProductMetadataView setContentRatingBadgeImage:badgeText:]( v19,  "setContentRatingBadgeImage:badgeText:",  v24,  v25);
  -[TVHSeasonDetailsViewController _showImageSize](self, "_showImageSize");
  double v27 = v26;
  double v29 = v28;
  v36 = v6;
  objc_super v30 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonDetailsViewController showsInfoCenter](self, "showsInfoCenter"));
  v31 = (void *)objc_claimAutoreleasedReturnValue([v30 mediaLibrary]);

  v32 = (void *)objc_claimAutoreleasedReturnValue( +[TVImageProxy tvh_imageProxyWithMediaEntity:mediaLibrary:scaleToSize:]( &OBJC_CLASS___TVImageProxy,  "tvh_imageProxyWithMediaEntity:mediaLibrary:scaleToSize:",  v3,  v31,  v27,  v29));
  v33 = (void *)objc_claimAutoreleasedReturnValue([v7 imageView]);
  [v33 setImageProxy:v32];
  v35 = v3;
  v34 = (void *)objc_claimAutoreleasedReturnValue( +[TVHPlaceholder placeholderForMediaEntity:containerSize:]( &OBJC_CLASS___TVHPlaceholder,  "placeholderForMediaEntity:containerSize:",  v3,  v27,  v29));
  [v33 setPlaceholder:v34];
}

- (CGSize)_showImageSize
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
  unsigned int v3 = objc_msgSend(v2, "tvh_shouldDisplayWideShowCoverArt");

  double v4 = 666.0;
  double v5 = 706.0;
  if (v3) {
    double v4 = 397.0;
  }
  else {
    double v5 = 666.0;
  }
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)_updatePlayButtonLockup:(id)a3 withEpisodeNumber:(id)a4
{
  id v13 = a3;
  id v5 = a4;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVHButtonLockup playVideoButtonTitle](&OBJC_CLASS___TVHButtonLockup, "playVideoButtonTitle"));
  id v7 = v6;
  if (v5)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 localizedStringForKey:@"EPISODE_NUMBER_TITLE_FORMAT" value:0 table:0]);

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tvhk_localizedDisplayString"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v9, v10));

    id v12 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@\n%@", v7, v11));
  }

  else
  {
    id v12 = v6;
  }

  [v13 setTitle:v12];
}

- (void)_updateProductViewControllerFooterView
{
  id v26 = (id)objc_claimAutoreleasedReturnValue(-[TVHSeasonDetailsViewController nextPlaybackEpisode](self, "nextPlaybackEpisode"));
  unsigned int v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  double v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "tvh_displayGenreTitle"));
  if ([v4 length])
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___TVHProductFooterItem);
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedStringForKey:@"GENRE_TITLE" value:0 table:0]);
    -[TVHProductFooterItem setName:](v5, "setName:", v7);

    -[TVHProductFooterItem setValue:](v5, "setValue:", v4);
    -[NSMutableArray addObject:](v3, "addObject:", v5);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v26 releaseDate]);
  if (v8)
  {
    id v9 = objc_alloc_init(&OBJC_CLASS___TVHProductFooterItem);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedStringForKey:@"DATE_RELEASED_TITLE" value:0 table:0]);
    -[TVHProductFooterItem setName:](v9, "setName:", v11);

    id v12 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
    -[NSDateFormatter setDateStyle:](v12, "setDateStyle:", 2LL);
    -[NSDateFormatter setTimeStyle:](v12, "setTimeStyle:", 0LL);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v12, "stringFromDate:", v8));
    -[TVHProductFooterItem setValue:](v9, "setValue:", v13);
    -[NSMutableArray addObject:](v3, "addObject:", v9);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v26 duration]);
  if (v14)
  {
    id v15 = objc_alloc_init(&OBJC_CLASS___TVHProductFooterItem);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 localizedStringForKey:@"RUN_TIME_TITLE" value:0 table:0]);
    -[TVHProductFooterItem setName:](v15, "setName:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString tvh_durationStringForSeconds:]( &OBJC_CLASS___NSString,  "tvh_durationStringForSeconds:",  v14));
    -[TVHProductFooterItem setValue:](v15, "setValue:", v18);

    -[NSMutableArray addObject:](v3, "addObject:", v15);
  }

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v26 contentRating]);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 ratingLabel]);

  if (v20)
  {
    id v21 = objc_alloc_init(&OBJC_CLASS___TVHProductFooterItem);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 localizedStringForKey:@"RATED_TITLE" value:0 table:0]);
    -[TVHProductFooterItem setName:](v21, "setName:", v23);

    -[TVHProductFooterItem setValue:](v21, "setValue:", v20);
    -[NSMutableArray addObject:](v3, "addObject:", v21);
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonDetailsViewController _footerViewController](self, "_footerViewController"));
  v25 = (void *)objc_claimAutoreleasedReturnValue([v24 footerView]);
  [v25 setItems:v3];
}

- (void)_updateProductViewControllerContentSectionItems
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonDetailsViewController productViewController](self, "productViewController"));

  if (v3)
  {
    double v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonDetailsViewController show](self, "show"));
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonDetailsViewController showsInfoCenter](self, "showsInfoCenter"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonDetailsViewController episodesContentSectionItem](self, "episodesContentSectionItem"));
    -[NSMutableArray addObject:](v4, "addObject:", v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 genreTitle]);
    if (v8)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 showsByGenreTitle]);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v8]);
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472LL;
      v33[2] = sub_100005914;
      v33[3] = &unk_1000FCE28;
      id v34 = v5;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bs_filter:", v33));
    }

    else
    {
      v11 = 0LL;
    }

    id v12 = (TVHProductContentSectionItem *)objc_claimAutoreleasedReturnValue( -[TVHSeasonDetailsViewController genreShowsContentSectionItem]( self,  "genreShowsContentSectionItem"));
    if ([v11 count])
    {
      v31 = v7;
      v32 = v6;
      if (v12)
      {
        id v13 = (TVHMediaEntitiesDataSourceItemCollectionDescriptor *)objc_claimAutoreleasedReturnValue( -[TVHSeasonDetailsViewController _genreShowsViewController]( self,  "_genreShowsViewController"));
        id v14 = (TVHMediaEntitiesDataSource *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntitiesDataSourceItemCollectionDescriptor dataSource]( v13,  "dataSource"));
      }

      else
      {
        id v15 = objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSourceItemCollectionDescriptor);
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 UUIDString]);
        id v13 = -[TVHMediaEntitiesDataSourceItemCollectionDescriptor initWithFetchResultIdentifier:]( v15,  "initWithFetchResultIdentifier:",  v17);

        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        objc_super v30 = (void *)objc_claimAutoreleasedReturnValue([v18 localizedStringForKey:@"RELATED_TITLE" value:0 table:0]);

        -[TVHMediaEntitiesDataSourceItemCollectionDescriptor setTitle:](v13, "setTitle:", v30);
        id v14 = -[TVHMediaEntitiesDataSource initWithItemCollectionDescriptor:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSource),  "initWithItemCollectionDescriptor:",  v13);
        -[TVHSeasonDetailsViewController _genreShowImageSize](self, "_genreShowImageSize");
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[TVHSimpleLockupShelfViewLayout shelfViewLayoutWithContentViewSize:footerLayoutType:]( &OBJC_CLASS___TVHMediaEntitiesShelfViewLayout,  "shelfViewLayoutWithContentViewSize:footerLayoutType:",  0LL));
        objc_msgSend(v19, "setHeaderViewMargin:", 0.0, 90.0, 12.0, 0.0);
        v20 = -[TVHMediaEntitiesShelfViewController initWithDataSource:layout:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesShelfViewController),  "initWithDataSource:layout:",  v14,  v19);
        -[TVHMediaEntitiesShelfViewController setShowsVibrantHeaderTitle:](v20, "setShowsVibrantHeaderTitle:", 1LL);
        id v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShelfViewController collectionView](v20, "collectionView"));
        objc_msgSend(v21, "setContentInset:", 0.0, 90.0, 0.0, 90.0);

        -[TVHMediaEntitiesShelfViewController setDelegate:](v20, "setDelegate:", self);
        id v12 = -[TVHProductContentSectionItem initWithViewController:spacing:]( objc_alloc(&OBJC_CLASS___TVHProductContentSectionItem),  "initWithViewController:spacing:",  v20,  20.0);
        -[TVHSeasonDetailsViewController setGenreShowsContentSectionItem:]( self,  "setGenreShowsContentSectionItem:",  v12);
      }

      -[NSMutableArray addObject:](v4, "addObject:", v12);
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesDataSource itemCollectionDescriptors](v14, "itemCollectionDescriptors"));
      v23 = (void *)objc_claimAutoreleasedReturnValue([v22 firstObject]);
      v24 = (void *)objc_claimAutoreleasedReturnValue([v23 fetchResultIdentifier]);

      v25 = -[TVHMediaEntitiesDataSourceFetchResult initWithIdentifier:mediaEntities:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSourceFetchResult),  "initWithIdentifier:mediaEntities:",  v24,  v11);
      v35 = v25;
      id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v35, 1LL));
      -[TVHMediaEntitiesDataSource updateWithMediaEntitiesDataSourceFetchResults:]( v14,  "updateWithMediaEntitiesDataSourceFetchResults:",  v26);

      double v27 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonDetailsViewController seperatorContentSectionItem](self, "seperatorContentSectionItem"));
      -[NSMutableArray addObject:](v4, "addObject:", v27);
      double v28 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonDetailsViewController footerContentSectionItem](self, "footerContentSectionItem"));
      -[NSMutableArray addObject:](v4, "addObject:", v28);

      id v7 = v31;
      objc_super v6 = v32;
    }

    else
    {
      -[TVHSeasonDetailsViewController setGenreShowsContentSectionItem:](self, "setGenreShowsContentSectionItem:", 0LL);
    }

    double v29 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonDetailsViewController productViewController](self, "productViewController", v30));
    [v29 setContentSectionItems:v4];
  }

- (CGSize)_genreShowImageSize
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
  unsigned int v3 = objc_msgSend(v2, "tvh_shouldDisplayWideShowCoverArt");

  double v4 = 172.0;
  double v5 = 306.0;
  if (!v3) {
    double v5 = 172.0;
  }
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)_playEpisode:(id)a3
{
  id v4 = a3;
  double v5 = objc_alloc(&OBJC_CLASS___TVHPlayerPlaylist);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
  id v8 = -[TVHPlayerPlaylist initWithHomeSharingMediaItem:mediaLibrary:]( v5,  "initWithHomeSharingMediaItem:mediaLibrary:",  v4,  v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonDetailsViewController tvh_playbackManager](self, "tvh_playbackManager"));
  [v7 playPlaylist:v8];
}

- (TVHSeasonDetailsViewControllerDelegate)seasonDetailsDelegate
{
  return (TVHSeasonDetailsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_seasonDetailsDelegate);
}

- (TVHShowsInfoCenter)showsInfoCenter
{
  return self->_showsInfoCenter;
}

- (TVHKMediaEntityCollection)show
{
  return self->_show;
}

- (void)setShow:(id)a3
{
}

- (TVHKMediaEntitiesFetchContext)showsFetchContext
{
  return self->_showsFetchContext;
}

- (void)setShowsFetchContext:(id)a3
{
}

- (NSArray)episodes
{
  return self->_episodes;
}

- (void)setEpisodes:(id)a3
{
}

- (TVHKMediaItem)nextPlaybackEpisode
{
  return self->_nextPlaybackEpisode;
}

- (void)setNextPlaybackEpisode:(id)a3
{
}

- (TVHProductViewController)productViewController
{
  return self->_productViewController;
}

- (void)setProductViewController:(id)a3
{
}

- (TVHProductContentSectionItem)episodesContentSectionItem
{
  return self->_episodesContentSectionItem;
}

- (void)setEpisodesContentSectionItem:(id)a3
{
}

- (TVHProductContentSectionItem)genreShowsContentSectionItem
{
  return self->_genreShowsContentSectionItem;
}

- (void)setGenreShowsContentSectionItem:(id)a3
{
}

- (TVHProductContentSectionItem)seperatorContentSectionItem
{
  return self->_seperatorContentSectionItem;
}

- (void)setSeperatorContentSectionItem:(id)a3
{
}

- (TVHProductContentSectionItem)footerContentSectionItem
{
  return self->_footerContentSectionItem;
}

- (void)setFooterContentSectionItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end