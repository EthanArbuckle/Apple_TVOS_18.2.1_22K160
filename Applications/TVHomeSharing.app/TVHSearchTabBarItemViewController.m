@interface TVHSearchTabBarItemViewController
+ (id)new;
- (BOOL)_isSearchTextAtWordEnd;
- (BOOL)showingSpinnerView;
- (NSSet)mediaCategoryTypes;
- (TVHKMediaEntitiesSearchController)mediaEntitiesSearchController;
- (TVHKMediaEntitiesSearchRequest)currentMediaEntitiesSearchRequest;
- (TVHKMediaLibrary)mediaLibrary;
- (TVHSearchResultsWrapperViewController)resultsWrapperViewController;
- (TVHSearchTabBarItemViewController)init;
- (TVHSearchTabBarItemViewController)initWithMediaLibrary:(id)a3;
- (TVHSearchTabBarItemViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIActivityIndicatorView)spinnerView;
- (UISearchContainerViewController)searchContainerViewController;
- (UISearchController)searchController;
- (UIView)originalSearchFieldRightView;
- (id)_playbackViewControllerForMediaEntityCollection:(id)a3;
- (id)_playbackViewControllerForMediaItem:(id)a3;
- (id)_sanitizedSearchText;
- (id)preferredFocusEnvironments;
- (id)tabBarObservedScrollView;
- (int64_t)originalSearchFieldRightViewMode;
- (unint64_t)selectedMediaCategoryType;
- (unint64_t)type;
- (void)_handleSearchTextDidChange;
- (void)_updateWithSearchControllerResult:(id)a3 forSearchTerm:(id)a4;
- (void)controller:(id)a3 searchRequest:(id)a4 didCompleteWithResult:(id)a5;
- (void)controller:(id)a3 searchRequest:(id)a4 didFailWithError:(id)a5;
- (void)didLoseSelection;
- (void)didReceiveSelection;
- (void)searchResultsViewController:(id)a3 didPlayMediaEntity:(id)a4;
- (void)searchResultsViewController:(id)a3 didSelectMediaEntity:(id)a4;
- (void)setCurrentMediaEntitiesSearchRequest:(id)a3;
- (void)setOriginalSearchFieldRightView:(id)a3;
- (void)setOriginalSearchFieldRightViewMode:(int64_t)a3;
- (void)setShowingSpinnerView:(BOOL)a3;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation TVHSearchTabBarItemViewController

+ (id)new
{
  return 0LL;
}

- (TVHSearchTabBarItemViewController)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHSearchTabBarItemViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v6);

  return 0LL;
}

- (TVHSearchTabBarItemViewController)initWithMediaLibrary:(id)a3
{
  id v5 = a3;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___TVHSearchTabBarItemViewController;
  v6 = -[TVHSearchTabBarItemViewController initWithNibName:bundle:](&v30, "initWithNibName:bundle:", 0LL, 0LL);
  v7 = v6;
  if (v6)
  {
    p_mediaLibrary = &v6->_mediaLibrary;
    objc_storeStrong((id *)&v6->_mediaLibrary, a3);
    v9 = -[TVHKMediaEntitiesSearchController initWithMediaLibrary:]( objc_alloc(&OBJC_CLASS___TVHKMediaEntitiesSearchController),  "initWithMediaLibrary:",  *p_mediaLibrary);
    mediaEntitiesSearchController = v7->_mediaEntitiesSearchController;
    v7->_mediaEntitiesSearchController = v9;

    -[TVHKMediaEntitiesSearchController setDelegate:](v7->_mediaEntitiesSearchController, "setDelegate:", v7);
    v11 = v7->_mediaEntitiesSearchController;
    v12 = (objc_class *)objc_opt_class(v7);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[TVHKMediaEntitiesSearchController setLogName:](v11, "setLogName:", v14);

    v15 = -[TVHSearchResultsViewController initWithMediaLibrary:]( objc_alloc(&OBJC_CLASS___TVHSearchResultsViewController),  "initWithMediaLibrary:",  *p_mediaLibrary);
    -[TVHSearchResultsViewController setDelegate:](v15, "setDelegate:", v7);
    v16 = -[TVHSearchResultsWrapperViewController initWithSearchResultsViewController:]( objc_alloc(&OBJC_CLASS___TVHSearchResultsWrapperViewController),  "initWithSearchResultsViewController:",  v15);
    resultsWrapperViewController = v7->_resultsWrapperViewController;
    v7->_resultsWrapperViewController = v16;

    v18 = -[UISearchController initWithSearchResultsController:]( objc_alloc(&OBJC_CLASS___UISearchController),  "initWithSearchResultsController:",  v7->_resultsWrapperViewController);
    searchController = v7->_searchController;
    v7->_searchController = v18;

    -[UISearchController _setShouldHideGridKeyboardUnfocused:]( v7->_searchController,  "_setShouldHideGridKeyboardUnfocused:",  1LL);
    v20 = v7->_searchController;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVHStackViewController stackView](v15, "stackView"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 collectionView]);
    -[UISearchController setSearchControllerObservedScrollView:](v20, "setSearchControllerObservedScrollView:", v22);

    -[UISearchController setSearchResultsUpdater:](v7->_searchController, "setSearchResultsUpdater:", v7);
    v23 = -[UISearchContainerViewController initWithSearchController:]( objc_alloc(&OBJC_CLASS___UISearchContainerViewController),  "initWithSearchController:",  v7->_searchController);
    searchContainerViewController = v7->_searchContainerViewController;
    v7->_searchContainerViewController = v23;

    v25 = -[UIActivityIndicatorView initWithActivityIndicatorStyle:]( objc_alloc(&OBJC_CLASS___UIActivityIndicatorView),  "initWithActivityIndicatorStyle:",  100LL);
    spinnerView = v7->_spinnerView;
    v7->_spinnerView = v25;

    +[UIActivityIndicatorView defaultSizeForStyle:]( &OBJC_CLASS___UIActivityIndicatorView,  "defaultSizeForStyle:",  100LL);
    -[UIActivityIndicatorView setFrame:](v7->_spinnerView, "setFrame:", CGPointZero.x, CGPointZero.y, v27, v28);
    -[UIActivityIndicatorView startAnimating](v7->_spinnerView, "startAnimating");
  }

  return v7;
}

- (unint64_t)type
{
  return 9LL;
}

- (NSSet)mediaCategoryTypes
{
  return +[NSSet set](&OBJC_CLASS___NSSet, "set");
}

- (unint64_t)selectedMediaCategoryType
{
  return 0LL;
}

- (void)didReceiveSelection
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[TVHSearchTabBarItemViewController mediaEntitiesSearchController](self, "mediaEntitiesSearchController"));
  [v2 enable];
}

- (void)didLoseSelection
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[TVHSearchTabBarItemViewController mediaEntitiesSearchController](self, "mediaEntitiesSearchController"));
  [v2 disable];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVHSearchTabBarItemViewController;
  -[TVHSearchTabBarItemViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchTabBarItemViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVHSearchTabBarItemViewController searchContainerViewController]( self,  "searchContainerViewController"));
  -[TVHSearchTabBarItemViewController addChildViewController:](self, "addChildViewController:", v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 view]);
  [v3 addSubview:v5];
  [v4 didMoveToParentViewController:self];
}

- (void)viewDidLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TVHSearchTabBarItemViewController;
  -[TVHSearchTabBarItemViewController viewDidLayoutSubviews](&v14, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchTabBarItemViewController view](self, "view"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue( -[TVHSearchTabBarItemViewController searchContainerViewController]( self,  "searchContainerViewController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 view]);

  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);
}

- (id)preferredFocusEnvironments
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( -[TVHSearchTabBarItemViewController searchContainerViewController]( self,  "searchContainerViewController"));
  double v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));

  return v3;
}

- (id)tabBarObservedScrollView
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchTabBarItemViewController resultsWrapperViewController](self, "resultsWrapperViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 searchResultsViewController]);
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stackView]);
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 collectionView]);

  return v5;
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  if (-[TVHSearchTabBarItemViewController _isSearchTextAtWordEnd](self, "_isSearchTextAtWordEnd")) {
    -[TVHSearchTabBarItemViewController _handleSearchTextDidChange](self, "_handleSearchTextDidChange");
  }
  else {
    -[TVHSearchTabBarItemViewController performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "_handleSearchTextDidChange",  0LL,  0.5);
  }
}

- (void)controller:(id)a3 searchRequest:(id)a4 didCompleteWithResult:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = sub_10007A078();
  double v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    double v11 = (void *)objc_claimAutoreleasedReturnValue([v7 text]);
    int v14 = 138412290;
    v15 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Search completed for text: '%@'",  (uint8_t *)&v14,  0xCu);
  }

  id v12 = (id)objc_claimAutoreleasedReturnValue( -[TVHSearchTabBarItemViewController currentMediaEntitiesSearchRequest]( self,  "currentMediaEntitiesSearchRequest"));
  if (v12 == v7) {
    -[TVHSearchTabBarItemViewController setShowingSpinnerView:](self, "setShowingSpinnerView:", 0LL);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue([v7 text]);
  -[TVHSearchTabBarItemViewController _updateWithSearchControllerResult:forSearchTerm:]( self,  "_updateWithSearchControllerResult:forSearchTerm:",  v8,  v13);
}

- (void)controller:(id)a3 searchRequest:(id)a4 didFailWithError:(id)a5
{
  id v6 = a4;
  id v7 = sub_10007A078();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 text]);
    int v10 = 138412290;
    double v11 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Search failed for text: '%@'",  (uint8_t *)&v10,  0xCu);
  }

  -[TVHSearchTabBarItemViewController setShowingSpinnerView:](self, "setShowingSpinnerView:", 0LL);
}

- (void)searchResultsViewController:(id)a3 didSelectMediaEntity:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 type]);
  id v7 = [v6 mediaCategoryType];
  id v8 = [v6 subtype];
  if (v8 == (id)1)
  {
    switch((unint64_t)v7)
    {
      case 0uLL:
      case 2uLL:
      case 3uLL:
      case 5uLL:
      case 9uLL:
        id v13 = sub_10007A078();
        int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_10009C00C((uint64_t)v5, v14, v15, v16, v17, v18, v19, v20);
        }
        goto LABEL_22;
      case 1uLL:
        id v22 = [v6 mediaEntityCollectionType];
        if (v22 == (id)2)
        {
          double v28 = objc_alloc(&OBJC_CLASS___TVHMusicAlbumArtistLookupViewController);
          int v10 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
          double v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchTabBarItemViewController mediaLibrary](self, "mediaLibrary"));
          id v12 = -[TVHMusicAlbumArtistLookupViewController initWithAlbumArtistIdentifier:mediaLibrary:]( v28,  "initWithAlbumArtistIdentifier:mediaLibrary:",  v10,  v11);
          goto LABEL_20;
        }

        if (v22 == (id)1)
        {
          v23 = objc_alloc(&OBJC_CLASS___TVHMusicAlbumLookupViewController);
          int v10 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
          double v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchTabBarItemViewController mediaLibrary](self, "mediaLibrary"));
          id v12 = -[TVHMusicAlbumLookupViewController initWithAlbumIdentifier:mediaLibrary:]( v23,  "initWithAlbumIdentifier:mediaLibrary:",  v10,  v11);
          goto LABEL_20;
        }

        id v30 = sub_10007A078();
        int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_10009BFA4((uint64_t)v5, v14, v31, v32, v33, v34, v35, v36);
        }
        break;
      case 4uLL:
        v24 = objc_alloc(&OBJC_CLASS___TVHShowSeasonLookupViewController);
        int v10 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
        double v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchTabBarItemViewController mediaLibrary](self, "mediaLibrary"));
        id v12 = -[TVHShowSeasonLookupViewController initWithShowIdentifier:mediaLibrary:]( v24,  "initWithShowIdentifier:mediaLibrary:",  v10,  v11);
        goto LABEL_20;
      case 6uLL:
        v25 = objc_alloc(&OBJC_CLASS___TVHPodcastLookupViewController);
        int v10 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
        double v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchTabBarItemViewController mediaLibrary](self, "mediaLibrary"));
        id v12 = -[TVHPodcastLookupViewController initWithPodcastIdentifier:mediaLibrary:]( v25,  "initWithPodcastIdentifier:mediaLibrary:",  v10,  v11);
        goto LABEL_20;
      case 7uLL:
        v26 = objc_alloc(&OBJC_CLASS___TVHITunesUCourseLookupViewController);
        int v10 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
        double v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchTabBarItemViewController mediaLibrary](self, "mediaLibrary"));
        id v12 = -[TVHITunesUCourseLookupViewController initWithITunesUCourseIdentifier:mediaLibrary:]( v26,  "initWithITunesUCourseIdentifier:mediaLibrary:",  v10,  v11);
        goto LABEL_20;
      case 8uLL:
        double v27 = objc_alloc(&OBJC_CLASS___TVHAudiobookLookupViewController);
        int v10 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
        double v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchTabBarItemViewController mediaLibrary](self, "mediaLibrary"));
        id v12 = -[TVHAudiobookLookupViewController initWithAudiobookIdentifier:mediaLibrary:]( v27,  "initWithAudiobookIdentifier:mediaLibrary:",  v10,  v11);
        goto LABEL_20;
      default:
        goto LABEL_23;
    }

    goto LABEL_22;
  }

  if (!v8)
  {
    if (v7 == (id)2)
    {
      v21 = objc_alloc(&OBJC_CLASS___TVHMovieRentalLookupViewController);
      int v10 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
      double v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchTabBarItemViewController mediaLibrary](self, "mediaLibrary"));
      id v12 = -[TVHMovieRentalLookupViewController initWithMovieRentalIdentifier:mediaLibrary:]( v21,  "initWithMovieRentalIdentifier:mediaLibrary:",  v10,  v11);
    }

    else
    {
      if (v7 != (id)3)
      {
        int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[TVHSearchTabBarItemViewController _playbackViewControllerForMediaItem:]( self,  "_playbackViewControllerForMediaItem:",  v5));
        if (!v14) {
          goto LABEL_23;
        }
        goto LABEL_21;
      }

      id v9 = objc_alloc(&OBJC_CLASS___TVHMovieLookupViewController);
      int v10 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
      double v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchTabBarItemViewController mediaLibrary](self, "mediaLibrary"));
      id v12 = -[TVHMovieLookupViewController initWithMovieIdentifier:mediaLibrary:]( v9,  "initWithMovieIdentifier:mediaLibrary:",  v10,  v11);
    }

- (void)searchResultsViewController:(id)a3 didPlayMediaEntity:(id)a4
{
  id v10 = a4;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVHKMediaItem);
  if ((objc_opt_isKindOfClass(v10, v5) & 1) != 0)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue( -[TVHSearchTabBarItemViewController _playbackViewControllerForMediaItem:]( self,  "_playbackViewControllerForMediaItem:",  v10));
  }

  else
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___TVHKMediaEntityCollection);
    if ((objc_opt_isKindOfClass(v10, v7) & 1) == 0) {
      goto LABEL_7;
    }
    uint64_t v6 = objc_claimAutoreleasedReturnValue( -[TVHSearchTabBarItemViewController _playbackViewControllerForMediaEntityCollection:]( self,  "_playbackViewControllerForMediaEntityCollection:",  v10));
  }

  id v8 = (void *)v6;
  if (v6)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchTabBarItemViewController navigationController](self, "navigationController"));
    [v9 pushViewController:v8 animated:1];
  }

- (id)_playbackViewControllerForMediaItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc(&OBJC_CLASS___TVHMediaItemsFetchPlaybackViewController);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchTabBarItemViewController mediaLibrary](self, "mediaLibrary"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 type]);
  id v8 = [v7 mediaCategoryType];
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);

  id v10 = -[TVHMediaItemsFetchPlaybackViewController initWithMediaLibrary:mediaCategoryType:mediaItemIdentifier:]( v5,  "initWithMediaLibrary:mediaCategoryType:mediaItemIdentifier:",  v6,  v8,  v9);
  return v10;
}

- (id)_playbackViewControllerForMediaEntityCollection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 type]);
  uint64_t v6 = objc_alloc(&OBJC_CLASS___TVHMediaItemsFetchPlaybackViewController);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchTabBarItemViewController mediaLibrary](self, "mediaLibrary"));
  id v8 = [v5 mediaCategoryType];
  id v9 = [v5 mediaEntityCollectionType];
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);

  double v11 = -[TVHMediaItemsFetchPlaybackViewController initWithMediaLibrary:mediaCategoryType:mediaEntityCollectionType:mediaEntityCollectionIdentifier:]( v6,  "initWithMediaLibrary:mediaCategoryType:mediaEntityCollectionType:mediaEntityCollectionIdentifier:",  v7,  v8,  v9,  v10);
  return v11;
}

- (void)setShowingSpinnerView:(BOOL)a3
{
  if (self->_showingSpinnerView != a3)
  {
    self->_BOOL showingSpinnerView = a3;
    id v15 = (id)objc_claimAutoreleasedReturnValue(-[TVHSearchTabBarItemViewController originalSearchFieldRightView](self, "originalSearchFieldRightView"));
    int64_t v4 = -[TVHSearchTabBarItemViewController originalSearchFieldRightViewMode](self, "originalSearchFieldRightViewMode");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchTabBarItemViewController searchController](self, "searchController"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 searchBar]);

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 searchField]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchTabBarItemViewController spinnerView](self, "spinnerView"));
    BOOL showingSpinnerView = self->_showingSpinnerView;
    if (self->_showingSpinnerView)
    {
      if (!v15)
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 rightView]);

        if (v10 != v8)
        {
          double v11 = (void *)objc_claimAutoreleasedReturnValue([v7 rightView]);
          -[TVHSearchTabBarItemViewController setOriginalSearchFieldRightView:]( self,  "setOriginalSearchFieldRightView:",  v11);

          -[TVHSearchTabBarItemViewController setOriginalSearchFieldRightViewMode:]( self,  "setOriginalSearchFieldRightViewMode:",  [v7 rightViewMode]);
        }
      }

      [v7 setRightView:v8];
      id v12 = v7;
      uint64_t v13 = 3LL;
    }

    else
    {
      int v14 = (void *)objc_claimAutoreleasedReturnValue([v7 rightView]);

      if (v14 != v8) {
        goto LABEL_10;
      }
      if (v15)
      {
        objc_msgSend(v7, "setRightView:");
        [v7 setRightViewMode:v4];
        -[TVHSearchTabBarItemViewController setOriginalSearchFieldRightView:]( self,  "setOriginalSearchFieldRightView:",  0LL);
        -[TVHSearchTabBarItemViewController setOriginalSearchFieldRightViewMode:]( self,  "setOriginalSearchFieldRightViewMode:",  0LL);
        goto LABEL_8;
      }

      objc_msgSend(v7, "setRightView:");
      id v12 = v7;
      uint64_t v13 = 0LL;
    }

    [v12 setRightViewMode:v13];
LABEL_8:
    [v8 setHidden:!showingSpinnerView];
LABEL_10:
  }

- (BOOL)_isSearchTextAtWordEnd
{
  if (qword_1001572C0 != -1) {
    dispatch_once(&qword_1001572C0, &stru_1000FD2C0);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchTabBarItemViewController _sanitizedSearchText](self, "_sanitizedSearchText"));
  int64_t v4 = (char *)[v3 length];
  if (v4) {
    unsigned __int8 v5 = objc_msgSend( (id)qword_1001572B8,  "characterIsMember:",  objc_msgSend(v3, "characterAtIndex:", v4 - 1));
  }
  else {
    unsigned __int8 v5 = 1;
  }

  return v5;
}

- (id)_sanitizedSearchText
{
  __int16 v11 = -4;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchTabBarItemViewController searchController](self, "searchController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 searchBar]);
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 text]);
  unsigned __int8 v5 = (void *)v4;
  if (v4) {
    uint64_t v6 = (__CFString *)v4;
  }
  else {
    uint64_t v6 = &stru_100100278;
  }
  uint64_t v7 = v6;

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCharacters:length:]( &OBJC_CLASS___NSString,  "stringWithCharacters:length:",  &v11,  1LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[__CFString stringByReplacingOccurrencesOfString:withString:]( v7,  "stringByReplacingOccurrencesOfString:withString:",  v8,  &stru_100100278));

  return v9;
}

- (void)_handleSearchTextDidChange
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchTabBarItemViewController _sanitizedSearchText](self, "_sanitizedSearchText"));
  id v4 = sub_10007A078();
  unsigned __int8 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    uint64_t v20 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Handling changed search text: '%@'",  (uint8_t *)&v19,  0xCu);
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[TVHSearchTabBarItemViewController currentMediaEntitiesSearchRequest]( self,  "currentMediaEntitiesSearchRequest"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 text]);
  unsigned int v8 = [v3 isEqualToString:v7];

  if (!v8)
  {
    if ([v3 length])
    {
      __int16 v11 = -[TVHKMediaEntitiesSearchRequest initWithText:]( objc_alloc(&OBJC_CLASS___TVHKMediaEntitiesSearchRequest),  "initWithText:",  v3);
      -[TVHSearchTabBarItemViewController setCurrentMediaEntitiesSearchRequest:]( self,  "setCurrentMediaEntitiesSearchRequest:",  v11);
      if (v11)
      {
        id v12 = sub_10007A078();
        uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = 138412290;
          uint64_t v20 = v3;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Starting search with text: %@",  (uint8_t *)&v19,  0xCu);
        }

        int v14 = (void *)objc_claimAutoreleasedReturnValue( -[TVHSearchTabBarItemViewController mediaEntitiesSearchController]( self,  "mediaEntitiesSearchController"));
        [v14 startSearchWithRequest:v11];

        uint64_t v15 = 1LL;
LABEL_16:
        -[TVHSearchTabBarItemViewController setShowingSpinnerView:](self, "setShowingSpinnerView:", v15);
        goto LABEL_17;
      }
    }

    else
    {
      -[TVHSearchTabBarItemViewController setCurrentMediaEntitiesSearchRequest:]( self,  "setCurrentMediaEntitiesSearchRequest:",  0LL);
    }

    id v16 = sub_10007A078();
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Clearing search results",  (uint8_t *)&v19,  2u);
    }

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( -[TVHSearchTabBarItemViewController mediaEntitiesSearchController]( self,  "mediaEntitiesSearchController"));
    [v18 cancel];

    -[TVHSearchTabBarItemViewController _updateWithSearchControllerResult:forSearchTerm:]( self,  "_updateWithSearchControllerResult:forSearchTerm:",  0LL,  0LL);
    uint64_t v15 = 0LL;
    goto LABEL_16;
  }

  id v9 = sub_10007A078();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    uint64_t v20 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Search text is the same as the current search request. Nothing to do. searchText: '%@'",  (uint8_t *)&v19,  0xCu);
  }

LABEL_17:
}

- (void)_updateWithSearchControllerResult:(id)a3 forSearchTerm:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchTabBarItemViewController resultsWrapperViewController](self, "resultsWrapperViewController"));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 searchResultsViewController]);

  [v8 updateWithSearchControllerResult:v18];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSearchTabBarItemViewController resultsWrapperViewController](self, "resultsWrapperViewController"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 defaultResultsViewController]);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___TVHSearchNoResultsViewController);
  id v12 = v10;
  uint64_t v13 = v12;
  if (v11)
  {
    if ((objc_opt_isKindOfClass(v12, v11) & 1) != 0) {
      int v14 = v13;
    }
    else {
      int v14 = 0LL;
    }
  }

  else
  {
    int v14 = 0LL;
  }

  uint64_t v15 = v14;

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v18 response]);
  if ([v16 totalMediaEntitiesCount])
  {

LABEL_8:
    [v9 setDefaultResultsViewController:0];
    goto LABEL_13;
  }

  id v17 = [v6 length];

  if (!v17) {
    goto LABEL_8;
  }
  if (!v15)
  {
    uint64_t v15 = objc_alloc_init(&OBJC_CLASS___TVHSearchNoResultsViewController);
    [v9 setDefaultResultsViewController:v15];
  }

  -[TVHSearchNoResultsViewController setSearchTerm:](v15, "setSearchTerm:", v6);
LABEL_13:
}

- (TVHKMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (TVHKMediaEntitiesSearchController)mediaEntitiesSearchController
{
  return self->_mediaEntitiesSearchController;
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (UISearchContainerViewController)searchContainerViewController
{
  return self->_searchContainerViewController;
}

- (TVHSearchResultsWrapperViewController)resultsWrapperViewController
{
  return self->_resultsWrapperViewController;
}

- (UIActivityIndicatorView)spinnerView
{
  return self->_spinnerView;
}

- (TVHKMediaEntitiesSearchRequest)currentMediaEntitiesSearchRequest
{
  return self->_currentMediaEntitiesSearchRequest;
}

- (void)setCurrentMediaEntitiesSearchRequest:(id)a3
{
}

- (BOOL)showingSpinnerView
{
  return self->_showingSpinnerView;
}

- (UIView)originalSearchFieldRightView
{
  return self->_originalSearchFieldRightView;
}

- (void)setOriginalSearchFieldRightView:(id)a3
{
}

- (int64_t)originalSearchFieldRightViewMode
{
  return self->_originalSearchFieldRightViewMode;
}

- (void)setOriginalSearchFieldRightViewMode:(int64_t)a3
{
  self->_originalSearchFieldRightViewMode = a3;
}

- (void).cxx_destruct
{
}

@end