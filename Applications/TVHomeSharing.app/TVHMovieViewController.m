@interface TVHMovieViewController
- (BOOL)_isRental;
- (CGSize)_genreMovieImageSize;
- (CGSize)_movieImageSize;
- (OS_dispatch_source)rentalExpirationUpdateTimer;
- (TVHKMediaItem)movie;
- (TVHMovieViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7;
- (TVHMovieViewController)initWithMovie:(id)a3 mediaLibrary:(id)a4 moviesFetchContext:(id)a5 moviesInfoCenter:(id)a6;
- (TVHMoviesInfoCenter)moviesInfoCenter;
- (TVHProductContentSectionItem)contributorsContentSectionItem;
- (TVHProductContentSectionItem)footerContentSectionItem;
- (TVHProductContentSectionItem)genreMoviesContentSectionItem;
- (TVHProductContentSectionItem)seperatorContentSectionItem;
- (TVHProductViewController)productViewController;
- (id)_contributorsViewController;
- (id)_footerViewController;
- (id)_genreMoviesViewController;
- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6;
- (id)preferredFocusEnvironments;
- (unint64_t)_rentalExpirationUpdateTimerInterval;
- (void)_playButtonSelected;
- (void)_playMovie:(id)a3;
- (void)_startRentalExpirationUpdateTimer;
- (void)_stopRentalExpirationUpdateTimer;
- (void)_updatePlayButton;
- (void)_updateProductViewControllerBannerView;
- (void)_updateProductViewControllerContentSectionItems;
- (void)_updateProductViewControllerFooterView;
- (void)_updateUserInterfaceStyleOverrideWithBackgroundImageInfo:(id)a3;
- (void)_updateWithFetchControllerResultSet:(id)a3;
- (void)contributorsShelfViewController:(id)a3 didSelectContributor:(id)a4;
- (void)dealloc;
- (void)mediaEntitiesFetchViewController:(id)a3 purgeSourceMediaEntityBackgroundImagesForContentViewController:(id)a4;
- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withFetchControllerResultSet:(id)a5;
- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withSourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6;
- (void)mediaEntitiesShelfViewController:(id)a3 configureLockup:(id)a4 forMediaEntity:(id)a5;
- (void)mediaEntitiesShelfViewController:(id)a3 didPlayMediaEntity:(id)a4;
- (void)mediaEntitiesShelfViewController:(id)a3 didSelectMediaEntity:(id)a4;
- (void)productInfoViewDidSelectContentDescription:(id)a3;
- (void)setContributorsContentSectionItem:(id)a3;
- (void)setFooterContentSectionItem:(id)a3;
- (void)setGenreMoviesContentSectionItem:(id)a3;
- (void)setMovie:(id)a3;
- (void)setProductViewController:(id)a3;
- (void)setRentalExpirationUpdateTimer:(id)a3;
- (void)setSeperatorContentSectionItem:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TVHMovieViewController

- (TVHMovieViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7
{
  v8 = NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v9);

  return 0LL;
}

- (TVHMovieViewController)initWithMovie:(id)a3 mediaLibrary:(id)a4 moviesFetchContext:(id)a5 moviesInfoCenter:(id)a6
{
  id v10 = a3;
  id v27 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v10 type]);
  id v15 = [v14 mediaCategoryType];
  id v16 = v13;
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest mediaItemsFetchRequestWithMediaCategoryType:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "mediaItemsFetchRequestWithMediaCategoryType:",  v15));
  id v18 = [v17 setIdentifier:@"__MovieFetchRequestIdentifier"];
  if (v15 == (id)2) {
    uint64_t v19 = TVHKMovieRentalMediaItemProperties(v18);
  }
  else {
    uint64_t v19 = TVHKMovieMediaItemProperties(v18);
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  [v17 setProperties:v20];
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate tvhk_identifierPredicateWithIdentifier:]( &OBJC_CLASS___NSPredicate,  "tvhk_identifierPredicateWithIdentifier:",  v16));

  [v17 setPredicate:v21];
  v29 = v17;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v29, 1LL));
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___TVHMovieViewController;
  v23 = -[TVHMediaEntitiesFetchViewController initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:]( &v28,  "initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:",  v12,  v22,  2LL,  v10,  v11);

  if (v23)
  {
    objc_storeStrong((id *)&v23->_moviesInfoCenter, a6);
    -[TVHMoviesInfoCenter addObserver:](v23->_moviesInfoCenter, "addObserver:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 localizedStringForKey:@"NO_MOVIE_ERROR_MESSAGE" value:0 table:0]);

    -[TVHMediaEntitiesFetchViewController setNoContentErrorMessage:](v23, "setNoContentErrorMessage:", v25);
    -[TVHMediaEntitiesFetchViewController setDelegate:](v23, "setDelegate:", v23);
    -[TVHMediaEntitiesFetchViewController setEnableFetchingWhenViewFirstAppears:]( v23,  "setEnableFetchingWhenViewFirstAppears:",  1LL);
  }

  return v23;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVHMovieViewController;
  -[TVHMediaEntitiesFetchViewController dealloc](&v3, "dealloc");
}

- (id)preferredFocusEnvironments
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(-[TVHMovieViewController productViewController](self, "productViewController"));
  objc_super v3 = (void *)v2;
  if (v2)
  {
    uint64_t v6 = v2;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  }

  else
  {
    v4 = &__NSArray0__struct;
  }

  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVHMovieViewController;
  -[TVHMediaEntitiesFetchViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  if (-[TVHMovieViewController _isRental](self, "_isRental")) {
    -[TVHMovieViewController _startRentalExpirationUpdateTimer](self, "_startRentalExpirationUpdateTimer");
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVHMovieViewController;
  -[TVHMediaEntitiesFetchViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  if (-[TVHMovieViewController _isRental](self, "_isRental")) {
    -[TVHMovieViewController _stopRentalExpirationUpdateTimer](self, "_stopRentalExpirationUpdateTimer");
  }
}

- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6
{
  id v8 = a6;
  id v9 = a4;
  -[TVHMovieViewController _updateUserInterfaceStyleOverrideWithBackgroundImageInfo:]( self,  "_updateUserInterfaceStyleOverrideWithBackgroundImageInfo:",  v8);
  id v10 = -[TVHProductViewController initWithStyle:backgroundImageInfo:]( objc_alloc(&OBJC_CLASS___TVHProductViewController),  "initWithStyle:backgroundImageInfo:",  0LL,  v8);

  -[TVHMovieViewController setProductViewController:](self, "setProductViewController:", v10);
  id v11 = objc_alloc_init(&OBJC_CLASS___TVHSeparatorView);
  id v12 = objc_alloc_init(&OBJC_CLASS___UIViewController);
  -[UIViewController setView:](v12, "setView:", v11);
  v13 = -[TVHProductContentSectionItem initWithViewController:spacing:]( objc_alloc(&OBJC_CLASS___TVHProductContentSectionItem),  "initWithViewController:spacing:",  v12,  60.0);
  -[TVHMovieViewController setSeperatorContentSectionItem:](self, "setSeperatorContentSectionItem:", v13);
  v14 = objc_alloc_init(&OBJC_CLASS___TVHProductFooterViewController);
  id v15 = -[TVHProductContentSectionItem initWithViewController:spacing:]( objc_alloc(&OBJC_CLASS___TVHProductContentSectionItem),  "initWithViewController:spacing:",  v14,  60.0);
  -[TVHMovieViewController setFooterContentSectionItem:](self, "setFooterContentSectionItem:", v15);
  -[TVHMovieViewController _updateWithFetchControllerResultSet:](self, "_updateWithFetchControllerResultSet:", v9);

  -[TVHMovieViewController _updateProductViewControllerContentSectionItems]( self,  "_updateProductViewControllerContentSectionItems");
  return v10;
}

- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withFetchControllerResultSet:(id)a5
{
}

- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withSourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6
{
  id v7 = a6;
  -[TVHMovieViewController _updateUserInterfaceStyleOverrideWithBackgroundImageInfo:]( self,  "_updateUserInterfaceStyleOverrideWithBackgroundImageInfo:",  v7);
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[TVHMovieViewController productViewController](self, "productViewController"));
  [v8 setBackgroundImageInfo:v7];
}

- (void)mediaEntitiesFetchViewController:(id)a3 purgeSourceMediaEntityBackgroundImagesForContentViewController:(id)a4
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVHMovieViewController productViewController](self, "productViewController", a3, a4));
  [v4 purgeBackgroundImages];
}

- (void)contributorsShelfViewController:(id)a3 didSelectContributor:(id)a4
{
  id v5 = a4;
  uint64_t v6 = objc_alloc(&OBJC_CLASS___TVHMoviesByContributorViewController);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMovieViewController _moviesFetchContext](self, "_moviesFetchContext"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMovieViewController moviesInfoCenter](self, "moviesInfoCenter"));
  id v10 = -[TVHMoviesByContributorViewController initWithContributor:moviesFetchContext:moviesInfoCenter:]( v6,  "initWithContributor:moviesFetchContext:moviesInfoCenter:",  v5,  v7,  v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMovieViewController navigationController](self, "navigationController"));
  [v9 pushViewController:v10 animated:1];
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
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[TVHMovieViewController _moviesFetchContext](self, "_moviesFetchContext"));
  uint64_t v6 = objc_alloc(&OBJC_CLASS___TVHMovieViewController);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMovieViewController moviesInfoCenter](self, "moviesInfoCenter"));
  id v9 = -[TVHMovieViewController initWithMovie:mediaLibrary:moviesFetchContext:moviesInfoCenter:]( v6,  "initWithMovie:mediaLibrary:moviesFetchContext:moviesInfoCenter:",  v5,  v7,  v11,  v8);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMovieViewController navigationController](self, "navigationController"));
  [v10 pushViewController:v9 animated:1];
}

- (void)mediaEntitiesShelfViewController:(id)a3 didPlayMediaEntity:(id)a4
{
}

- (void)productInfoViewDidSelectContentDescription:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMovieViewController movie](self, "movie"));
  id v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tvh_displayTitle"));

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 contentDescription]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 string]);

  id v8 = [[TVSUITextAlertController alloc] initWithTitle:v9 text:v7];
  -[TVHMovieViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v8,  1LL,  0LL);
}

- (unint64_t)_rentalExpirationUpdateTimerInterval
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMovieViewController movie](self, "movie"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 expirationDate]);

  if (v3)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___NSDate);
    objc_msgSend(v3, "tvh_timeIntervalFromDate:", v4);
    uint64_t v6 = (uint64_t)v5;
    if ((uint64_t)v5 < 172801)
    {
      unint64_t v8 = v6 > 0;
      if (v6 >= 61) {
        unint64_t v8 = (unsigned __int16)v6 % 0x3Cu;
      }
      if (v6 >= 3601) {
        unint64_t v7 = v6 % 0xE10;
      }
      else {
        unint64_t v7 = v8;
      }
    }

    else
    {
      unint64_t v7 = v6 % 0x15180uLL;
    }
  }

  else
  {
    unint64_t v7 = 0LL;
  }

  return v7;
}

- (void)_startRentalExpirationUpdateTimer
{
  unint64_t v3 = -[TVHMovieViewController _rentalExpirationUpdateTimerInterval](self, "_rentalExpirationUpdateTimerInterval");
  id v4 = sub_10007A1C8();
  double v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v3));
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Setting rental expiration update timer interval to %@",  buf,  0xCu);
    }

    double v5 = (os_log_s *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  &_dispatch_main_q);
    -[TVHMovieViewController setRentalExpirationUpdateTimer:](self, "setRentalExpirationUpdateTimer:", v5);
    uint64_t v8 = 1000000000 * v3;
    dispatch_time_t v9 = dispatch_time(0LL, v8);
    dispatch_source_set_timer((dispatch_source_t)v5, v9, v8, 0LL);
    objc_initWeak((id *)buf, self);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10005C700;
    handler[3] = &unk_1000FCEF8;
    objc_copyWeak(&v11, (id *)buf);
    dispatch_source_set_event_handler((dispatch_source_t)v5, handler);
    dispatch_resume((dispatch_object_t)v5);
    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }

  else if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "No valid timer interval for the rental. No timer will be started",  buf,  2u);
  }
}

- (void)_stopRentalExpirationUpdateTimer
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMovieViewController rentalExpirationUpdateTimer](self, "rentalExpirationUpdateTimer"));

  if (v3)
  {
    id v4 = sub_10007A1C8();
    double v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Stopping media libraries wait timer.", v7, 2u);
    }

    BOOL v6 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue( -[TVHMovieViewController rentalExpirationUpdateTimer]( self,  "rentalExpirationUpdateTimer"));
    dispatch_source_cancel(v6);

    -[TVHMovieViewController setRentalExpirationUpdateTimer:](self, "setRentalExpirationUpdateTimer:", 0LL);
  }

- (void)_updatePlayButton
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMovieViewController movie](self, "movie"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 expirationDate]);

  if (v4)
  {
    double v5 = objc_alloc_init(&OBJC_CLASS___NSDate);
    objc_msgSend(v4, "tvh_timeIntervalFromDate:", v5);
    unint64_t v7 = (uint64_t)v6;
    if ((uint64_t)v6)
    {
      uint64_t v8 = -[TVHRemainingTimeValueTransformer initWithTargetDate:]( objc_alloc(&OBJC_CLASS___TVHRemainingTimeValueTransformer),  "initWithTargetDate:",  v4);
      dispatch_time_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHRemainingTimeValueTransformer transformedValue:](v8, "transformedValue:", v5));
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedStringForKey:@"EXPIRATION_TIME_FORMAT" value:0 table:0]);

      id v20 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v11, v9));
      id v12 = 0LL;
      if (v7 > 0xE10) {
        goto LABEL_8;
      }
    }

    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v20 = (id)objc_claimAutoreleasedReturnValue([v14 localizedStringForKey:@"EXPIRED_TITLE" value:0 table:0]);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](&OBJC_CLASS___UIColor, "redColor"));
  }

  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v20 = (id)objc_claimAutoreleasedReturnValue([v13 localizedStringForKey:@"PLAY_VIDEO_BUTTON_TITLE" value:0 table:0]);

    id v12 = 0LL;
  }

- (void)_playButtonSelected
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVHMovieViewController movie](self, "movie"));
  -[TVHMovieViewController _playMovie:](self, "_playMovie:", v3);
}

- (void)_playMovie:(id)a3
{
  id v4 = a3;
  double v5 = objc_alloc(&OBJC_CLASS___TVHPlayerPlaylist);
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
  uint64_t v8 = -[TVHPlayerPlaylist initWithHomeSharingMediaItem:mediaLibrary:]( v5,  "initWithHomeSharingMediaItem:mediaLibrary:",  v4,  v6);

  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMovieViewController tvh_playbackManager](self, "tvh_playbackManager"));
  [v7 playPlaylist:v8];
}

- (BOOL)_isRental
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMovieViewController movie](self, "movie"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 type]);
  BOOL v4 = [v3 mediaCategoryType] == (id)2;

  return v4;
}

- (id)_genreMoviesViewController
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMovieViewController genreMoviesContentSectionItem](self, "genreMoviesContentSectionItem"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 viewController]);

  return v3;
}

- (id)_contributorsViewController
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMovieViewController contributorsContentSectionItem](self, "contributorsContentSectionItem"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 viewController]);

  return v3;
}

- (id)_footerViewController
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMovieViewController footerContentSectionItem](self, "footerContentSectionItem"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 viewController]);

  return v3;
}

- (void)_updateWithFetchControllerResultSet:(id)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([a3 results]);
  id v9 = (id)objc_claimAutoreleasedReturnValue([v4 firstObject]);

  double v5 = (void *)objc_claimAutoreleasedReturnValue([v9 response]);
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaEntitiesResult]);
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 mediaEntities]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);

  -[TVHMovieViewController setMovie:](self, "setMovie:", v8);
  -[TVHMovieViewController _updateProductViewControllerBannerView](self, "_updateProductViewControllerBannerView");
  -[TVHMovieViewController _updateProductViewControllerFooterView](self, "_updateProductViewControllerFooterView");
}

- (void)_updateProductViewControllerBannerView
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMovieViewController movie](self, "movie"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMovieViewController moviesInfoCenter](self, "moviesInfoCenter"));
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 mediaLibrary]);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMovieViewController productViewController](self, "productViewController"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v38 bannerView]);
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 infoView]);
  [v7 setDelegate:self];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tvh_displayTitle"));
  [v7 setTitle:v8];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tvh_contentDescriptionAttributedString"));
  [v7 setContentDescription:v9];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 controls]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);

  if (!v11)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[TVHButtonLockup playVideoButtonLockup](&OBJC_CLASS___TVHButtonLockup, "playVideoButtonLockup"));
    [v11 addTarget:self action:"_playButtonSelected" forControlEvents:0x2000];
    v39 = v11;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v39, 1LL));
    [v7 setControls:v12];
  }

  v37 = v11;
  -[TVHMovieViewController _updatePlayButton](self, "_updatePlayButton");
  v13 = (TVHProductMetadataView *)objc_claimAutoreleasedReturnValue([v7 metadataView]);
  if (!v13)
  {
    v13 = objc_alloc_init(&OBJC_CLASS___TVHProductMetadataView);
    [v7 setMetadataView:v13];
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([v3 duration]);
  -[TVHProductMetadataView setDuration:](v13, "setDuration:", v14);

  id v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tvh_displayGenreTitle"));
  -[TVHProductMetadataView setGenreTitle:](v13, "setGenreTitle:", v15);

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v3 releaseYear]);
  -[TVHProductMetadataView setReleaseYear:](v13, "setReleaseYear:", v16);

  -[TVHProductMetadataView setHighDefinition:](v13, "setHighDefinition:", objc_msgSend(v3, "tvh_isHighDefinition"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v3 contentRating]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[VUIContentRatingBadgeManager sharedInstance]( &OBJC_CLASS___VUIContentRatingBadgeManager,  "sharedInstance"));
  v35 = (void *)objc_claimAutoreleasedReturnValue([v18 badgeForContentRating:v17 drawUnknownRatingBadge:0]);

  v34 = (void *)objc_claimAutoreleasedReturnValue([v17 ratingLabel]);
  -[TVHProductMetadataView setContentRatingBadgeImage:badgeText:]( v13,  "setContentRatingBadgeImage:badgeText:",  v35,  v34);
  -[TVHMovieViewController _movieImageSize](self, "_movieImageSize");
  double v20 = v19;
  double v22 = v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[TVImageProxy tvh_imageProxyWithMediaEntity:mediaLibrary:scaleToSize:]( &OBJC_CLASS___TVImageProxy,  "tvh_imageProxyWithMediaEntity:mediaLibrary:scaleToSize:",  v3,  v5));
  v36 = (void *)v5;
  v24 = (void *)objc_claimAutoreleasedReturnValue([v6 imageView]);
  [v24 setImageProxy:v23];
  v25 = (void *)objc_claimAutoreleasedReturnValue( +[TVHPlaceholder placeholderForMediaEntity:containerSize:]( &OBJC_CLASS___TVHPlaceholder,  "placeholderForMediaEntity:containerSize:",  v3,  v20,  v22));
  [v24 setPlaceholder:v25];
  v33 = v6;
  v26 = (void *)objc_claimAutoreleasedReturnValue([v6 creditsView]);
  id v27 = (void *)objc_claimAutoreleasedReturnValue([v3 credits]);
  objc_super v28 = (void *)objc_claimAutoreleasedReturnValue([v27 directors]);
  v32 = v7;
  v29 = (void *)objc_claimAutoreleasedReturnValue([v28 array]);
  [v26 setDirectors:v29];

  v30 = (void *)objc_claimAutoreleasedReturnValue([v27 actors]);
  v31 = (void *)objc_claimAutoreleasedReturnValue([v30 array]);
  [v26 setActors:v31];
}

- (CGSize)_movieImageSize
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
  unsigned int v3 = objc_msgSend(v2, "tvh_shouldDisplayWideMovieCoverArt");

  double v4 = 400.0;
  if (v3) {
    double v4 = 618.0;
  }
  double v5 = 600.0;
  if (v3) {
    double v5 = 348.0;
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)_updateProductViewControllerFooterView
{
  id v30 = (id)objc_claimAutoreleasedReturnValue(-[TVHMovieViewController movie](self, "movie"));
  unsigned int v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v30 studio]);
  if ([v4 length])
  {
    double v5 = objc_alloc_init(&OBJC_CLASS___TVHProductFooterItem);
    double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedStringForKey:@"STUDIO_TITLE" value:0 table:0]);
    -[TVHProductFooterItem setName:](v5, "setName:", v7);

    -[TVHProductFooterItem setValue:](v5, "setValue:", v4);
    -[NSMutableArray addObject:](v3, "addObject:", v5);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "tvh_displayGenreTitle"));
  if ([v8 length])
  {
    id v9 = objc_alloc_init(&OBJC_CLASS___TVHProductFooterItem);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedStringForKey:@"GENRE_TITLE" value:0 table:0]);
    -[TVHProductFooterItem setName:](v9, "setName:", v11);

    -[TVHProductFooterItem setValue:](v9, "setValue:", v8);
    -[NSMutableArray addObject:](v3, "addObject:", v9);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v30 releaseDate]);
  if (v12)
  {
    v13 = objc_alloc_init(&OBJC_CLASS___TVHProductFooterItem);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 localizedStringForKey:@"DATE_RELEASED_TITLE" value:0 table:0]);
    -[TVHProductFooterItem setName:](v13, "setName:", v15);

    id v16 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
    -[NSDateFormatter setDateStyle:](v16, "setDateStyle:", 2LL);
    -[NSDateFormatter setTimeStyle:](v16, "setTimeStyle:", 0LL);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v16, "stringFromDate:", v12));
    -[TVHProductFooterItem setValue:](v13, "setValue:", v17);
    -[NSMutableArray addObject:](v3, "addObject:", v13);
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v30 duration]);
  if (v18)
  {
    double v19 = objc_alloc_init(&OBJC_CLASS___TVHProductFooterItem);
    double v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    double v21 = (void *)objc_claimAutoreleasedReturnValue([v20 localizedStringForKey:@"RUN_TIME_TITLE" value:0 table:0]);
    -[TVHProductFooterItem setName:](v19, "setName:", v21);

    double v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString tvh_durationStringForSeconds:]( &OBJC_CLASS___NSString,  "tvh_durationStringForSeconds:",  v18));
    -[TVHProductFooterItem setValue:](v19, "setValue:", v22);

    -[NSMutableArray addObject:](v3, "addObject:", v19);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue([v30 contentRating]);
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 ratingLabel]);

  if (v24)
  {
    v25 = objc_alloc_init(&OBJC_CLASS___TVHProductFooterItem);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 localizedStringForKey:@"RATED_TITLE" value:0 table:0]);
    -[TVHProductFooterItem setName:](v25, "setName:", v27);

    -[TVHProductFooterItem setValue:](v25, "setValue:", v24);
    -[NSMutableArray addObject:](v3, "addObject:", v25);
  }

  objc_super v28 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMovieViewController _footerViewController](self, "_footerViewController"));
  v29 = (void *)objc_claimAutoreleasedReturnValue([v28 footerView]);
  [v29 setItems:v3];
}

- (void)_updateProductViewControllerContentSectionItems
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMovieViewController productViewController](self, "productViewController"));

  if (v3)
  {
    double v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMovieViewController movie](self, "movie"));
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMovieViewController moviesInfoCenter](self, "moviesInfoCenter"));
    unsigned __int8 v7 = -[TVHMovieViewController _isRental](self, "_isRental");
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v5 genreTitle]);
    id v9 = (void *)v8;
    id v10 = 0LL;
    unsigned __int8 v40 = v7;
    if ((v7 & 1) == 0 && v8)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 moviesByGenreTitle]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v9]);
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472LL;
      v42[2] = sub_10005DA04;
      v42[3] = &unk_1000FE598;
      id v43 = v5;
      id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bs_filter:", v42));
    }

    v41 = v9;
    v13 = (TVHProductContentSectionItem *)objc_claimAutoreleasedReturnValue( -[TVHMovieViewController genreMoviesContentSectionItem]( self,  "genreMoviesContentSectionItem"));
    id v14 = [v10 count];
    if (v14)
    {
      v39 = v6;
      if (v13)
      {
        id v15 = (TVHMediaEntitiesDataSourceItemCollectionDescriptor *)objc_claimAutoreleasedReturnValue( -[TVHMovieViewController _genreMoviesViewController]( self,  "_genreMoviesViewController"));
        id v16 = (TVHMediaEntitiesDataSource *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntitiesDataSourceItemCollectionDescriptor dataSource]( v15,  "dataSource"));
      }

      else
      {
        v17 = objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSourceItemCollectionDescriptor);
        id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
        double v19 = (void *)objc_claimAutoreleasedReturnValue([v18 UUIDString]);
        id v15 = -[TVHMediaEntitiesDataSourceItemCollectionDescriptor initWithFetchResultIdentifier:]( v17,  "initWithFetchResultIdentifier:",  v19);

        double v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        v38 = (void *)objc_claimAutoreleasedReturnValue([v20 localizedStringForKey:@"RELATED_TITLE" value:0 table:0]);

        -[TVHMediaEntitiesDataSourceItemCollectionDescriptor setTitle:](v15, "setTitle:", v38);
        id v16 = -[TVHMediaEntitiesDataSource initWithItemCollectionDescriptor:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSource),  "initWithItemCollectionDescriptor:",  v15);
        -[TVHMovieViewController _genreMovieImageSize](self, "_genreMovieImageSize");
        double v21 = (void *)objc_claimAutoreleasedReturnValue( +[TVHSimpleLockupShelfViewLayout shelfViewLayoutWithContentViewSize:footerLayoutType:]( &OBJC_CLASS___TVHMediaEntitiesShelfViewLayout,  "shelfViewLayoutWithContentViewSize:footerLayoutType:",  0LL));
        objc_msgSend(v21, "setHeaderViewMargin:", 0.0, 90.0, 12.0, 0.0);
        double v22 = -[TVHMediaEntitiesShelfViewController initWithDataSource:layout:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesShelfViewController),  "initWithDataSource:layout:",  v16,  v21);
        -[TVHMediaEntitiesShelfViewController setShowsVibrantHeaderTitle:](v22, "setShowsVibrantHeaderTitle:", 1LL);
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShelfViewController collectionView](v22, "collectionView"));
        objc_msgSend(v23, "setContentInset:", 0.0, 90.0, 0.0, 90.0);

        -[TVHMediaEntitiesShelfViewController setDelegate:](v22, "setDelegate:", self);
        v13 = -[TVHProductContentSectionItem initWithViewController:spacing:]( objc_alloc(&OBJC_CLASS___TVHProductContentSectionItem),  "initWithViewController:spacing:",  v22,  40.0);
        -[TVHMovieViewController setGenreMoviesContentSectionItem:](self, "setGenreMoviesContentSectionItem:", v13);
      }

      -[NSMutableArray addObject:](v4, "addObject:", v13);
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesDataSource itemCollectionDescriptors](v16, "itemCollectionDescriptors"));
      v25 = (void *)objc_claimAutoreleasedReturnValue([v24 firstObject]);
      v26 = (void *)objc_claimAutoreleasedReturnValue([v25 fetchResultIdentifier]);

      id v27 = -[TVHMediaEntitiesDataSourceFetchResult initWithIdentifier:mediaEntities:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSourceFetchResult),  "initWithIdentifier:mediaEntities:",  v26,  v10);
      v44 = v27;
      objc_super v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v44, 1LL));
      -[TVHMediaEntitiesDataSource updateWithMediaEntitiesDataSourceFetchResults:]( v16,  "updateWithMediaEntitiesDataSourceFetchResults:",  v28);

      double v6 = v39;
    }

    else
    {
      -[TVHMovieViewController setGenreMoviesContentSectionItem:](self, "setGenreMoviesContentSectionItem:", 0LL);
    }

    v29 = (TVHProductContentSectionItem *)objc_claimAutoreleasedReturnValue( -[TVHMovieViewController contributorsContentSectionItem]( self,  "contributorsContentSectionItem"));
    id v30 = (void *)objc_claimAutoreleasedReturnValue([v5 credits]);
    v31 = v30;
    if ((v40 & 1) != 0 || ![v30 hasCredits])
    {
      -[TVHMovieViewController setContributorsContentSectionItem:](self, "setContributorsContentSectionItem:", 0LL);
      if (!v14)
      {
LABEL_18:
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMovieViewController footerContentSectionItem](self, "footerContentSectionItem"));
        -[NSMutableArray addObject:](v4, "addObject:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMovieViewController productViewController](self, "productViewController"));
        [v37 setContentSectionItems:v4];

        return;
      }
    }

    else
    {
      if (!v29)
      {
        v32 = -[TVHContributorsShelfViewController initWithMediaItem:imageSize:headerViewMargin:]( objc_alloc(&OBJC_CLASS___TVHContributorsShelfViewController),  "initWithMediaItem:imageSize:headerViewMargin:",  v5,  250.0,  250.0,  0.0,  90.0,  12.0,  0.0);
        -[TVHContributorsShelfViewController setDelegate:](v32, "setDelegate:", self);
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShelfViewController collectionView](v32, "collectionView"));
        objc_msgSend(v33, "setContentInset:", 0.0, 90.0, 0.0, 90.0);

        v29 = -[TVHProductContentSectionItem initWithViewController:spacing:]( objc_alloc(&OBJC_CLASS___TVHProductContentSectionItem),  "initWithViewController:spacing:",  v32,  48.0);
        -[TVHMovieViewController setContributorsContentSectionItem:](self, "setContributorsContentSectionItem:", v29);
      }

      -[NSMutableArray addObject:](v4, "addObject:", v29);
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMovieViewController _contributorsViewController](self, "_contributorsViewController"));
      [v34 setMediaItem:v5];
    }

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMovieViewController seperatorContentSectionItem](self, "seperatorContentSectionItem"));
    -[NSMutableArray addObject:](v4, "addObject:", v35);

    goto LABEL_18;
  }

- (CGSize)_genreMovieImageSize
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
  unsigned int v3 = objc_msgSend(v2, "tvh_shouldDisplayWideMovieCoverArt");

  double v4 = 148.0;
  if (v3) {
    double v4 = 394.0;
  }
  double v5 = 222.0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)_updateUserInterfaceStyleOverrideWithBackgroundImageInfo:(id)a3
{
}

- (TVHMoviesInfoCenter)moviesInfoCenter
{
  return self->_moviesInfoCenter;
}

- (TVHKMediaItem)movie
{
  return self->_movie;
}

- (void)setMovie:(id)a3
{
}

- (OS_dispatch_source)rentalExpirationUpdateTimer
{
  return self->_rentalExpirationUpdateTimer;
}

- (void)setRentalExpirationUpdateTimer:(id)a3
{
}

- (TVHProductViewController)productViewController
{
  return self->_productViewController;
}

- (void)setProductViewController:(id)a3
{
}

- (TVHProductContentSectionItem)genreMoviesContentSectionItem
{
  return self->_genreMoviesContentSectionItem;
}

- (void)setGenreMoviesContentSectionItem:(id)a3
{
}

- (TVHProductContentSectionItem)contributorsContentSectionItem
{
  return self->_contributorsContentSectionItem;
}

- (void)setContributorsContentSectionItem:(id)a3
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