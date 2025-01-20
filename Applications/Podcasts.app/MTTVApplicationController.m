@interface MTTVApplicationController
+ (id)alertControllerForError:(int64_t)a3;
- (BOOL)_isNowPlayingTabSelected;
- (BOOL)_isNowPlayingTabVisible;
- (BOOL)isMyPodcastsTabSelected;
- (BOOL)isTabBarLoaded;
- (BOOL)isUnplayedTabSelected;
- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4;
- (MTTVApplicationController)initWithContext:(id)a3 window:(id)a4;
- (MTTVPodcastPlaybackHostControllerViewController)nowPlayingController;
- (UINavigationController)libraryNavigationController;
- (UINavigationController)listenNowNavigationController;
- (UITabBarController)tabBarController;
- (UITabBarControllerDelegate)originalTabBarDelegate;
- (id)_menuItemElements;
- (id)_selectTabWithIdentifier:(id)a3;
- (id)_selectTabWithIdentifier:(id)a3 popToRoot:(BOOL)a4 animated:(BOOL)a5 completion:(id)a6;
- (id)_selectedTabIdentifier;
- (id)_tabIdentifierForIndex:(unint64_t)a3;
- (id)viewControllerForElement:(id)a3 existingViewController:(id)a4;
- (unint64_t)_tabIndexForIdentifier:(id)a3;
- (void)_configureTabBarOnFirstLoad;
- (void)_hideNowPlaying;
- (void)_playPauseButtonAction:(id)a3;
- (void)_showNowPlaying;
- (void)appContext:(id)a3 evaluateAppJavaScriptInContext:(id)a4;
- (void)appController:(id)a3 didFailWithError:(id)a4;
- (void)appController:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (void)dismissNowPlayingAnimated:(BOOL)a3;
- (void)dismissNowPlayingAnimated:(BOOL)a3 completion:(id)a4;
- (void)handlePodcastsUrlScheme:(id)a3;
- (void)handleiTMSUrlScheme:(id)a3;
- (void)openStoreURL:(id)a3;
- (void)presentNowPlayingAnimated:(BOOL)a3;
- (void)presentPodcast:(id)a3 episode:(id)a4 podcastTab:(unint64_t)a5 startPlayback:(BOOL)a6 animated:(BOOL)a7;
- (void)presentPodcast:(id)a3 episodeUuid:(id)a4 episodeNotAvailable:(BOOL)a5 podcastTab:(unint64_t)a6 startPlayback:(BOOL)a7 animated:(BOOL)a8;
- (void)selectFeaturedTab;
- (void)selectFeaturedTabAndPopToRoot:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)selectMyPodcastsTab;
- (void)selectMyPodcastsTabAndPopToRoot:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)selectSearchTabAndFocusSearchField;
- (void)selectUnplayedTab;
- (void)selectUnplayedTabAndPopToRoot:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setLibraryNavigationController:(id)a3;
- (void)setListenNowNavigationController:(id)a3;
- (void)setNowPlayingController:(id)a3;
- (void)setOriginalTabBarDelegate:(id)a3;
- (void)setTabBarLoaded:(BOOL)a3;
- (void)showSearchControllerWithSearchText:(id)a3;
- (void)tabBarController:(id)a3 didSelectViewController:(id)a4;
- (void)updateNowPlayingTabVisibility;
@end

@implementation MTTVApplicationController

- (MTTVApplicationController)initWithContext:(id)a3 window:(id)a4
{
  v4 = -[MTTVApplicationController initWithContext:window:delegate:]( self,  "initWithContext:window:delegate:",  a3,  a4,  self);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVInterfaceFactory sharedInterfaceFactory]( &OBJC_CLASS___TVInterfaceFactory,  "sharedInterfaceFactory"));
    [v5 setExtendedInterfaceCreator:v4];

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v7 = IMAVPlayerNotification_MediaItemDidChange;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](&OBJC_CLASS___MTPlayerController, "defaultInstance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 player]);
    [v6 addObserver:v4 selector:"updateNowPlayingTabVisibility" name:v7 object:v9];

    v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont mt_preferredFontForTextStyle:addingSymbolicTraits:]( &OBJC_CLASS___UIFont,  "mt_preferredFontForTextStyle:addingSymbolicTraits:",  UIFontTextStyleTitle2,  2LL));
    NSAttributedStringKey v15 = NSFontAttributeName;
    v16 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVApplicationController rootViewController](v4, "rootViewController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 navigationBar]);
    [v13 setTitleTextAttributes:v11];
  }

  return v4;
}

- (id)viewControllerForElement:(id)a3 existingViewController:(id)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue([a3 attributes]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:TVAttributeCanonicalIdentifier]);

  if (![v6 length]) {
    goto LABEL_9;
  }
  if (![v6 isEqualToString:@"unplayed"])
  {
    if ([v6 isEqualToString:@"podcasts"])
    {
      uint64_t v7 = objc_claimAutoreleasedReturnValue(-[MTTVApplicationController libraryNavigationController](self, "libraryNavigationController"));
      goto LABEL_8;
    }

    if ([v6 isEqualToString:@"now_playing"])
    {
      uint64_t v7 = objc_claimAutoreleasedReturnValue(-[MTTVApplicationController nowPlayingController](self, "nowPlayingController"));
      goto LABEL_8;
    }

- (UITabBarController)tabBarController
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVApplicationController rootViewController](self, "rootViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 viewControllers]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);

  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 childViewControllers]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___UITabBarController);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
    id v8 = v6;
  }
  else {
    id v8 = 0LL;
  }

  return (UITabBarController *)v8;
}

- (UINavigationController)listenNowNavigationController
{
  listenNowNavigationController = self->_listenNowNavigationController;
  if (!listenNowNavigationController)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___MTTVListenNowViewController);
    v5 = -[UINavigationController initWithRootViewController:]( objc_alloc(&OBJC_CLASS___UINavigationController),  "initWithRootViewController:",  v4);
    v6 = self->_listenNowNavigationController;
    self->_listenNowNavigationController = v5;

    int v7 = os_feature_enabled_home_tab();
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v9 = v8;
    if (v7) {
      v10 = @"TAB_HOME";
    }
    else {
      v10 = @"LISTEN_NOW";
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedStringForKey:v10 value:&stru_100248948 table:0]);
    -[UINavigationController setTitle:](self->_listenNowNavigationController, "setTitle:", v11);

    listenNowNavigationController = self->_listenNowNavigationController;
  }

  return listenNowNavigationController;
}

- (UINavigationController)libraryNavigationController
{
  libraryNavigationController = self->_libraryNavigationController;
  if (!libraryNavigationController)
  {
    v4 = objc_alloc_init(&OBJC_CLASS____TtC8Podcasts28TVLibrarySplitViewController);
    v5 = -[UINavigationController initWithRootViewController:]( objc_alloc(&OBJC_CLASS___UINavigationController),  "initWithRootViewController:",  v4);
    v6 = self->_libraryNavigationController;
    self->_libraryNavigationController = v5;

    int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedStringForKey:@"TAB_LIBRARY" value:&stru_100248948 table:0]);
    -[UINavigationController setTitle:](self->_libraryNavigationController, "setTitle:", v8);

    -[UINavigationController setNavigationBarHidden:]( self->_libraryNavigationController,  "setNavigationBarHidden:",  1LL);
    libraryNavigationController = self->_libraryNavigationController;
  }

  return libraryNavigationController;
}

- (MTTVPodcastPlaybackHostControllerViewController)nowPlayingController
{
  nowPlayingController = self->_nowPlayingController;
  if (!nowPlayingController)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___MTTVPodcastPlaybackHostControllerViewController);
    v5 = self->_nowPlayingController;
    self->_nowPlayingController = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedStringForKey:@"Now Playing" value:&stru_100248948 table:0]);
    -[MTTVPodcastPlaybackHostControllerViewController setTitle:](self->_nowPlayingController, "setTitle:", v7);

    nowPlayingController = self->_nowPlayingController;
  }

  return nowPlayingController;
}

- (void)updateNowPlayingTabVisibility
{
  if (-[MTTVApplicationController isTabBarLoaded](self, "isTabBarLoaded")) {
    -[MTTVApplicationController _showNowPlaying](self, "_showNowPlaying");
  }
}

- (id)_selectTabWithIdentifier:(id)a3
{
  return -[MTTVApplicationController _selectTabWithIdentifier:popToRoot:animated:completion:]( self,  "_selectTabWithIdentifier:popToRoot:animated:completion:",  a3,  0LL,  0LL,  0LL);
}

- (id)_selectTabWithIdentifier:(id)a3 popToRoot:(BOOL)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  v10 = (Block_layout *)a6;
  id v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVApplicationController tabBarController](self, "tabBarController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 viewControllers]);
  id v14 = [v13 count];

  unint64_t v15 = -[MTTVApplicationController _tabIndexForIdentifier:](self, "_tabIndexForIdentifier:", v11);
  if (v15 >= (unint64_t)v14)
  {
    if (v10) {
      v10->invoke(v10);
    }
    v20 = 0LL;
  }

  else
  {
    [v12 setSelectedIndex:v15];
    [v12 setNeedsFocusUpdate];
    if (v10) {
      v16 = v10;
    }
    else {
      v16 = &stru_100244430;
    }
    v17 = objc_retainBlock(v16);
    if (v7)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue([v12 navigationController]);
      objc_msgSend(v18, "mt_popToRootViewControllerAnimated:completion:", v6, v17);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue([v12 viewControllers]);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectAtIndexedSubscript:v15]);
  }

  return v20;
}

- (id)_selectedTabIdentifier
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVApplicationController tabBarController](self, "tabBarController"));
  id v4 = [v3 selectedIndex];

  return -[MTTVApplicationController _tabIdentifierForIndex:](self, "_tabIdentifierForIndex:", v4);
}

- (unint64_t)_tabIndexForIdentifier:(id)a3
{
  id v4 = a3;
  unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  if ([v4 length])
  {
    uint64_t v11 = 0LL;
    v12 = &v11;
    uint64_t v13 = 0x2020000000LL;
    uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVApplicationController _menuItemElements](self, "_menuItemElements"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000E43A8;
    v8[3] = &unk_100244458;
    id v9 = v4;
    v10 = &v11;
    [v6 enumerateObjectsUsingBlock:v8];
    unint64_t v5 = v12[3];

    _Block_object_dispose(&v11, 8);
  }

  return v5;
}

- (id)_tabIdentifierForIndex:(unint64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVApplicationController _menuItemElements](self, "_menuItemElements"));
  if ((unint64_t)[v4 count] <= a3)
  {
    BOOL v7 = 0LL;
  }

  else
  {
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:a3]);
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 attributes]);
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:TVAttributeCanonicalIdentifier]);
  }

  return v7;
}

- (id)_menuItemElements
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVApplicationController tabBarController](self, "tabBarController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 valueForKey:@"menuItemElements"]);

  return v3;
}

- (BOOL)_isNowPlayingTabSelected
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVApplicationController _selectedTabIdentifier](self, "_selectedTabIdentifier"));
  unsigned __int8 v3 = [v2 isEqualToString:@"now_playing"];

  return v3;
}

- (BOOL)_isNowPlayingTabVisible
{
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVApplicationController tabBarController](self, "tabBarController", 0LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 viewControllers]);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 reverseObjectEnumerator]);

  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)i);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVApplicationController nowPlayingController](self, "nowPlayingController"));
        uint64_t v12 = objc_opt_class(v11);
        uint64_t v13 = objc_opt_class(v12);
        LOBYTE(v10) = objc_opt_isKindOfClass(v10, v13);

        if ((v10 & 1) != 0)
        {
          BOOL v14 = 1;
          goto LABEL_11;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  BOOL v14 = 0;
LABEL_11:

  return v14;
}

- (void)_hideNowPlaying
{
  if (-[MTTVApplicationController _isNowPlayingTabVisible](self, "_isNowPlayingTabVisible"))
  {
    if (-[MTTVApplicationController _isNowPlayingTabSelected](self, "_isNowPlayingTabSelected")) {
      id v3 =  -[MTTVApplicationController _selectTabWithIdentifier:]( self,  "_selectTabWithIdentifier:",  @"podcasts");
    }
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[MTTVApplicationController tabBarController](self, "tabBarController"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v7 viewControllers]);
    id v5 = [v4 mutableCopy];

    [v5 removeLastObject];
    [v7 setViewControllers:v5];
    nowPlayingController = self->_nowPlayingController;
    self->_nowPlayingController = 0LL;
  }

- (void)_showNowPlaying
{
  if (!-[MTTVApplicationController _isNowPlayingTabVisible](self, "_isNowPlayingTabVisible"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVApplicationController tabBarController](self, "tabBarController"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 viewControllers]);
    id v7 = [v4 mutableCopy];

    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVApplicationController nowPlayingController](self, "nowPlayingController"));
    [v7 addObject:v5];

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVApplicationController tabBarController](self, "tabBarController"));
    [v6 setViewControllers:v7];
  }

- (void)_playPauseButtonAction:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](&OBJC_CLASS___MTPlayerController, "defaultInstance", a3));
  if ([v4 isTargetPlaying])
  {
    [v4 pausePlayerTarget];
  }

  else
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v4 currentItem]);

    if (v3) {
      [v4 playWithReason:3];
    }
  }
}

- (void)_configureTabBarOnFirstLoad
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVApplicationController tabBarController](self, "tabBarController"));
  if (v3)
  {
    block[1] = 3221225472LL;
    block[2] = sub_1000E490C;
    block[3] = &unk_100240240;
    block[4] = self;
    id v4 = v3;
    block[0] = _NSConcreteStackBlock;
    id v6 = v3;
    if (qword_1002B6B58 != -1) {
      dispatch_once(&qword_1002B6B58, block);
    }

    id v3 = v4;
  }
}

- (void)handleiTMSUrlScheme:(id)a3
{
}

- (void)handlePodcastsUrlScheme:(id)a3
{
}

- (void)openStoreURL:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 absoluteString]);
  if ([v4 length])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1000E4BB0;
    v5[3] = &unk_100244480;
    id v6 = v4;
    -[MTTVApplicationController evaluateInJavaScriptContext:completion:]( self,  "evaluateInJavaScriptContext:completion:",  v5,  0LL);
  }
}

- (void)showSearchControllerWithSearchText:(id)a3
{
}

- (void)presentNowPlayingAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](&OBJC_CLASS___MTPlayerController, "defaultInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentItem]);

  if (v6)
  {
    if (!-[MTTVApplicationController _isNowPlayingTabSelected](self, "_isNowPlayingTabSelected")) {
      goto LABEL_4;
    }
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVApplicationController rootNavController](self, "rootNavController"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 viewControllers]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 firstObject]);

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 topViewController]);
    if (v9 != v10)
    {
LABEL_4:
      id v14 = (id)objc_claimAutoreleasedReturnValue(-[MTTVApplicationController rootNavController](self, "rootNavController"));
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v14 topViewController]);
      uint64_t v12 = objc_opt_class(&OBJC_CLASS___MTTVNowPlayingViewController);
      if ((objc_opt_isKindOfClass(v11, v12) & 1) == 0)
      {
        uint64_t v13 = objc_alloc_init(&OBJC_CLASS___MTTVNowPlayingViewController);
        [v14 pushViewController:v13 animated:v3];
      }
    }
  }

- (void)dismissNowPlayingAnimated:(BOOL)a3
{
}

- (void)dismissNowPlayingAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v10 = (void (**)(void))a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVApplicationController rootNavController](self, "rootNavController"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 topViewController]);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___MTTVNowPlayingViewController);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0) {
    id v9 = [v6 popViewControllerAnimated:v4];
  }
  if (v10) {
    v10[2]();
  }
}

- (BOOL)isUnplayedTabSelected
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVApplicationController _selectedTabIdentifier](self, "_selectedTabIdentifier"));
  unsigned __int8 v3 = [v2 isEqualToString:@"unplayed"];

  return v3;
}

- (void)selectUnplayedTab
{
}

- (void)selectUnplayedTabAndPopToRoot:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v5 =  -[MTTVApplicationController _selectTabWithIdentifier:popToRoot:animated:completion:]( self,  "_selectTabWithIdentifier:popToRoot:animated:completion:",  @"unplayed",  a3,  a4,  0LL);
}

- (BOOL)isMyPodcastsTabSelected
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVApplicationController _selectedTabIdentifier](self, "_selectedTabIdentifier"));
  unsigned __int8 v3 = [v2 isEqualToString:@"podcasts"];

  return v3;
}

- (void)selectMyPodcastsTab
{
}

- (void)selectMyPodcastsTabAndPopToRoot:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v5 =  -[MTTVApplicationController _selectTabWithIdentifier:popToRoot:animated:completion:]( self,  "_selectTabWithIdentifier:popToRoot:animated:completion:",  @"podcasts",  a3,  a4,  a5);
}

- (void)selectFeaturedTab
{
}

- (void)selectFeaturedTabAndPopToRoot:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v5 =  -[MTTVApplicationController _selectTabWithIdentifier:popToRoot:animated:completion:]( self,  "_selectTabWithIdentifier:popToRoot:animated:completion:",  @"featured",  a3,  a4,  a5);
}

- (void)selectSearchTabAndFocusSearchField
{
  id v5 = (id)objc_claimAutoreleasedReturnValue( -[MTTVApplicationController _selectTabWithIdentifier:popToRoot:animated:completion:]( self,  "_selectTabWithIdentifier:popToRoot:animated:completion:",  @"search",  1LL,  0LL,  0LL));
  v2 = (void *)objc_claimAutoreleasedReturnValue([v5 view]);
  id v3 = [v2 subviewOfClass:objc_opt_class(UISearchBar)];
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  [v4 becomeFirstResponder];
}

- (void)presentPodcast:(id)a3 episode:(id)a4 podcastTab:(unint64_t)a5 startPlayback:(BOOL)a6 animated:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = (id)objc_claimAutoreleasedReturnValue([a4 uuid]);
  -[MTTVApplicationController presentPodcast:episodeUuid:episodeNotAvailable:podcastTab:startPlayback:animated:]( self,  "presentPodcast:episodeUuid:episodeNotAvailable:podcastTab:startPlayback:animated:",  v12,  v13,  0LL,  a5,  v8,  v7);
}

- (void)presentPodcast:(id)a3 episodeUuid:(id)a4 episodeNotAvailable:(BOOL)a5 podcastTab:(unint64_t)a6 startPlayback:(BOOL)a7 animated:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  BOOL v10 = a5;
  id v13 = a3;
  id v14 = a4;
  unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVApplicationController tabBarController](self, "tabBarController"));
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 navigationController]);

  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 viewControllers]);
  id v18 = [v17 count];

  id v20 = v16;
  v21 = -[MTTVPodcastDetailViewController initWithPodcast:]( objc_alloc(&OBJC_CLASS___MTTVPodcastDetailViewController),  "initWithPodcast:",  v13);
  [v20 pushViewController:v21 animated:0];
  if (v10)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000E52CC;
    block[3] = &unk_10023FF98;
    id v33 = v13;
    dispatch_async(&_dispatch_main_q, block);
  }

  if (!v14 && v9)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue([v13 uuid]);
    v23 = (void *)objc_claimAutoreleasedReturnValue([v13 managedObjectContext]);
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[MTRecencyUtil upNextForPodcastUuid:ctx:]( &OBJC_CLASS___MTRecencyUtil,  "upNextForPodcastUuid:ctx:",  v22,  v23));
    id v14 = (id)objc_claimAutoreleasedReturnValue([v24 episodeUuid]);
  }

  if ([v14 length]) {
    -[MTTVPodcastDetailViewController highlightEpisodeUuid:](v21, "highlightEpisodeUuid:", v14);
  }
  if (v9 && [v14 length])
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v26 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v27 = _NSConcreteStackBlock;
    uint64_t v28 = 3221225472LL;
    v29 = sub_1000E5330;
    v30 = &unk_10023FF98;
    id v31 = v14;
    dispatch_async(v26, &v27);

    -[MTTVApplicationController presentNowPlayingAnimated:](self, "presentNowPlayingAnimated:", v8, v27, v28, v29, v30);
  }
}

- (void)appContext:(id)a3 evaluateAppJavaScriptInContext:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MTTVApplicationController;
  id v5 = a4;
  id v6 = a3;
  -[MTTVApplicationController appContext:evaluateAppJavaScriptInContext:]( &v10,  "appContext:evaluateAppJavaScriptInContext:",  v6,  v5);
  BOOL v7 = objc_alloc(&OBJC_CLASS___MTJSITunesStore);
  BOOL v8 = -[MTJSITunesStore initWithAppContext:](v7, "initWithAppContext:", v6, v10.receiver, v10.super_class);
  [v5 setObject:v8 forKeyedSubscript:@"itms"];

  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( +[MTStoreAppContextScriptManager sharedInstance]( &OBJC_CLASS___MTStoreAppContextScriptManager,  "sharedInstance"));
  [v9 appContext:v6 evaluateAppJavaScriptInContext:v5];
}

- (void)appController:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](&OBJC_CLASS___IMLogger, "sharedLogger"));
  [v6 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/ATV/MTTVApplicationController.m", 623, @"TVAppController Error: %@", v5 lineNumber format];

  BOOL v7 = (void *)objc_opt_class(self);
  id v8 = [v5 code];

  id v10 = (id)objc_claimAutoreleasedReturnValue([v7 alertControllerForError:v8]);
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVApplicationController navigationController](self, "navigationController"));
  [v9 presentViewController:v10 animated:1 completion:0];
}

- (void)appController:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVApplicationController navigationController](self, "navigationController", a3, a4));
  [v5 setDelegate:self];

  -[MTTVApplicationController _configureTabBarOnFirstLoad](self, "_configureTabBarOnFirstLoad");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTApplication sharedApplication](&OBJC_CLASS___MTApplication, "sharedApplication"));
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 delegate]);
  [v7 setupAfterBecomingActive];

  id v8 = (id)objc_claimAutoreleasedReturnValue(+[PFRestrictionsController shared](&OBJC_CLASS___PFRestrictionsController, "shared"));
  [v8 presentLaunchAlertIfNeeded];
}

- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVApplicationController originalTabBarDelegate](self, "originalTabBarDelegate"));
  char v9 = objc_opt_respondsToSelector(v8, "tabBarController:shouldSelectViewController:");

  if ((v9 & 1) != 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVApplicationController originalTabBarDelegate](self, "originalTabBarDelegate"));
    unsigned __int8 v11 = [v10 tabBarController:v6 shouldSelectViewController:v7];
  }

  else
  {
    unsigned __int8 v11 = 1;
  }

  return v11;
}

- (void)tabBarController:(id)a3 didSelectViewController:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[MTTVApplicationController _selectedTabIdentifier](self, "_selectedTabIdentifier"));
  [v7 setValue:v8 forKey:@"selected_tab"];

  char v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVApplicationController originalTabBarDelegate](self, "originalTabBarDelegate"));
  LOBYTE(v8) = objc_opt_respondsToSelector(v9, "tabBarController:didSelectViewController:");

  if ((v8 & 1) != 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVApplicationController originalTabBarDelegate](self, "originalTabBarDelegate"));
    [v10 tabBarController:v11 didSelectViewController:v6];
  }
}

+ (id)alertControllerForError:(int64_t)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v5 = v4;
  if (a3 == 2)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"ALERT_TITLE_NO_INTERNET_ATV" value:&stru_100248948 table:0]);

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( [v7 localizedStringForKey:@"ALERT_MESSAGE_NO_INTERNET_ATV" value:&stru_100248948 table:0]);
  }

  else
  {
    char v9 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedInfoDictionary]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"CFBundleName"]);

    if (!v7)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 infoDictionary]);
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"CFBundleName"]);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue( [v12 localizedStringForKey:@"ATV_APP_FAILURE_TITLE" value:&stru_100248948 table:0]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v13, v7));

    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( [v14 localizedStringForKey:@"ATV_APP_FAILURE_MESSAGE" value:&stru_100248948 table:0]);
  }

  unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v6,  v8,  1LL));
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 localizedStringForKey:@"OK" value:&stru_100248948 table:0]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v17,  1LL,  &stru_1002444C0));

  [v15 addAction:v18];
  return v15;
}

- (BOOL)isTabBarLoaded
{
  return self->_tabBarLoaded;
}

- (void)setTabBarLoaded:(BOOL)a3
{
  self->_tabBarLoaded = a3;
}

- (void)setListenNowNavigationController:(id)a3
{
}

- (void)setLibraryNavigationController:(id)a3
{
}

- (void)setNowPlayingController:(id)a3
{
}

- (UITabBarControllerDelegate)originalTabBarDelegate
{
  return (UITabBarControllerDelegate *)objc_loadWeakRetained((id *)&self->_originalTabBarDelegate);
}

- (void)setOriginalTabBarDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end