@interface TVMusicInterfaceFactory
+ (BOOL)isDataPrivateForElement:(id)a3;
+ (TVMusicInterfaceFactory)sharedInterfaceFactory;
+ (id)playlistImgWithElement:(id)a3 existingView:(id)a4;
- (BOOL)isPageLoaded:(id)a3;
- (Class)collectionViewCellClassForElement:(id)a3;
- (NSMutableSet)configuredTVMLPages;
- (NSMutableSet)loadedTVMLPages;
- (TVMusicStackTemplateController)stackTemplateController;
- (UIFocusGuide)monogramBottomFocusGuide;
- (UITabBarController)tabBarController;
- (UIView)userMonogramView;
- (id)_TVMLKitViewForElement:(id)a3 existingView:(id)a4;
- (id)_imageProxyForElement:(id)a3;
- (id)_placeholderImageForResourceName:(id)a3;
- (id)_searchController;
- (id)_styleSheetURLForTemplate:(id)a3;
- (id)_viewForImageResourceWithURL:(id)a3 withSize:(CGSize)a4 tintColor:(id)a5 existingView:(id)a6;
- (id)_viewWithAccessibilityModificationsForElement:(id)a3 existingView:(id)a4;
- (id)imageForResource:(id)a3;
- (id)viewControllerForElement:(id)a3 existingViewController:(id)a4;
- (id)viewForElement:(id)a3 existingView:(id)a4;
- (int64_t)tabBarIndex;
- (void)_didChangeAccessibility:(id)a3;
- (void)_didUpdateFocus:(id)a3;
- (void)_makeHighContrastLabel:(id)a3;
- (void)_showDebugInfoInTabBar:(id)a3;
- (void)_showText:(id)a3 onTabBar:(id)a4;
- (void)configureViewElementsForPage:(id)a3;
- (void)setConfiguredTVMLPages:(id)a3;
- (void)setLoadedTVMLPages:(id)a3;
- (void)setMonogramBottomFocusGuide:(id)a3;
- (void)setStackTemplateController:(id)a3;
- (void)setTabBarController:(id)a3;
- (void)setTabBarIndex:(int64_t)a3;
- (void)setUserMonogramView:(id)a3;
- (void)setup;
@end

@implementation TVMusicInterfaceFactory

+ (TVMusicInterfaceFactory)sharedInterfaceFactory
{
  if (qword_1002BE820 != -1) {
    dispatch_once(&qword_1002BE820, &stru_100269F90);
  }
  return (TVMusicInterfaceFactory *)(id)qword_1002BE818;
}

- (void)setup
{
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[TVInterfaceFactory sharedInterfaceFactory]( &OBJC_CLASS___TVInterfaceFactory,  "sharedInterfaceFactory"));
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 styleSheetRegistry]);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 URLForResource:@"MusicArtistStyleSheet" withExtension:@"xml"]);
  v37 = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v37, 1LL));
  [v22 registerStyleSheetURLs:v25 forTemplateName:@"artistTemplate" basedOnTemplateName:TVElementKeyStackTemplate];

  v26 = objc_alloc_init(&OBJC_CLASS___TVMusicCloudViewController);
  musicCloudViewController = self->_musicCloudViewController;
  self->_musicCloudViewController = v26;

  v28 = objc_alloc(&OBJC_CLASS___TVMusicPlaybackHostController);
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicPlayerManager defaultPlayer](&OBJC_CLASS___TVMusicPlayerManager, "defaultPlayer"));
  v30 = -[TVMusicPlaybackHostController initWithPlayer:](v28, "initWithPlayer:", v29);
  musicPlaybackHostController = self->_musicPlaybackHostController;
  self->_musicPlaybackHostController = v30;

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](&OBJC_CLASS___NSMutableSet, "setWithCapacity:", 5LL));
  -[TVMusicInterfaceFactory setConfiguredTVMLPages:](self, "setConfiguredTVMLPages:", v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](&OBJC_CLASS___NSMutableSet, "setWithCapacity:", 5LL));
  -[TVMusicInterfaceFactory setLoadedTVMLPages:](self, "setLoadedTVMLPages:", v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue( +[TVInterfaceFactory sharedInterfaceFactory]( &OBJC_CLASS___TVInterfaceFactory,  "sharedInterfaceFactory"));
  [v34 setExtendedInterfaceCreator:self];

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v35 addObserver:self selector:"_didUpdateFocus:" name:UIFocusDidUpdateNotification object:0];

  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v36 addObserver:self selector:"_didChangeAccessibility:" name:UIAccessibilityDarkerSystemColorsStatusDidChangeNotification object:0];
}

- (void)configureViewElementsForPage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicInterfaceFactory loadedTVMLPages](self, "loadedTVMLPages"));
  [v5 addObject:v4];

  if (![v4 isEqualToString:@"listen_now"])
  {
    if ([v4 isEqualToString:@"search"])
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicInterfaceFactory tabBarController](self, "tabBarController"));

      if (v42)
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicInterfaceFactory _searchController](self, "_searchController"));
        v41 = v43;
        if (v43)
        {
          [v43 _setShouldDisplayDefaultSuggestion:0];
        }

        else
        {
          id v49 = sub_10002E45C();
          v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
            sub_1001B97A4(v50);
          }
        }

        id v51 = sub_10002E45C();
        v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v68 = v4;
          _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_INFO,  "Configured view elements for page %@.",  buf,  0xCu);
        }

        goto LABEL_32;
      }
    }

    goto LABEL_33;
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicInterfaceFactory userMonogramView](self, "userMonogramView"));
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 superview]);
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = objc_claimAutoreleasedReturnValue(-[TVMusicInterfaceFactory tabBarController](self, "tabBarController"));
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicInterfaceFactory configuredTVMLPages](self, "configuredTVMLPages"));
      unsigned __int8 v12 = [v11 containsObject:@"listen_now"];

      if ((v12 & 1) == 0)
      {
        id v61 = v4;
        v62 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicInterfaceFactory userMonogramView](self, "userMonogramView"));
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicInterfaceFactory tabBarController](self, "tabBarController"));
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 tabBar]);

        __int128 v65 = 0u;
        __int128 v66 = 0u;
        __int128 v63 = 0u;
        __int128 v64 = 0u;
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 layoutGuides]);
        id v16 = [v15 countByEnumeratingWithState:&v63 objects:v75 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v64;
          do
          {
            for (i = 0LL; i != v17; i = (char *)i + 1)
            {
              if (*(void *)v64 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void **)(*((void *)&v63 + 1) + 8LL * (void)i);
              v21 = (void *)objc_claimAutoreleasedReturnValue([v20 identifier]);
              unsigned int v22 = [v21 isEqualToString:@"TVMusic.ForYou.Monogram"];

              if (v22) {
                [v14 removeLayoutGuide:v20];
              }
            }

            id v17 = [v15 countByEnumeratingWithState:&v63 objects:v75 count:16];
          }

          while (v17);
        }

        v23 = (void *)objc_claimAutoreleasedReturnValue([v14 leadingAccessoryView]);
        v24 = objc_alloc(&OBJC_CLASS___FocusRedirectButton);
        [v23 frame];
        v25 = -[FocusRedirectButton initWithFrame:](v24, "initWithFrame:", 0.0, 0.0, 1.0);
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
        -[FocusRedirectButton setBackgroundColor:](v25, "setBackgroundColor:", v26);

        v59 = v25;
        v60 = v23;
        [v23 addSubview:v25];
        v27 = objc_alloc_init(&OBJC_CLASS___UIFocusGuide);
        -[UIFocusGuide setIdentifier:](v27, "setIdentifier:", @"TVMusic.ForYou.Monogram");
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicInterfaceFactory tabBarController](self, "tabBarController"));
        v29 = (void *)objc_claimAutoreleasedReturnValue([v28 tabBar]);
        v74 = v29;
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v74, 1LL));
        -[UIFocusGuide setPreferredFocusEnvironments:](v27, "setPreferredFocusEnvironments:", v30);

        v31 = (void *)objc_claimAutoreleasedReturnValue([v62 superview]);
        [v31 addLayoutGuide:v27];

        v58 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide topAnchor](v27, "topAnchor"));
        v57 = (void *)objc_claimAutoreleasedReturnValue([v62 bottomAnchor]);
        v56 = (void *)objc_claimAutoreleasedReturnValue([v58 constraintEqualToAnchor:v57 constant:1.0]);
        v73[0] = v56;
        v55 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide leftAnchor](v27, "leftAnchor"));
        v54 = (void *)objc_claimAutoreleasedReturnValue([v62 leftAnchor]);
        v53 = (void *)objc_claimAutoreleasedReturnValue([v55 constraintEqualToAnchor:v54]);
        v73[1] = v53;
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide rightAnchor](v27, "rightAnchor"));
        v33 = (void *)objc_claimAutoreleasedReturnValue([v62 rightAnchor]);
        v34 = (void *)objc_claimAutoreleasedReturnValue([v32 constraintEqualToAnchor:v33]);
        v73[2] = v34;
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide heightAnchor](v27, "heightAnchor"));
        v36 = (void *)objc_claimAutoreleasedReturnValue([v35 constraintEqualToConstant:1.0]);
        v73[3] = v36;
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v73, 4LL));
        +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v37);

        -[TVMusicInterfaceFactory setMonogramBottomFocusGuide:](self, "setMonogramBottomFocusGuide:", v27);
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicInterfaceFactory configuredTVMLPages](self, "configuredTVMLPages"));
        [v38 addObject:@"listen_now"];

        id v39 = sub_10002E45C();
        v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
        id v4 = v61;
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v68 = v61;
          _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_INFO,  "Configured view elements for page %@.",  buf,  0xCu);
        }

        v41 = v62;
LABEL_32:

        goto LABEL_33;
      }

      goto LABEL_23;
    }
  }

LABEL_23:
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicInterfaceFactory configuredTVMLPages](self, "configuredTVMLPages"));
  unsigned __int8 v45 = [v44 containsObject:@"listen_now"];

  if ((v45 & 1) == 0)
  {
    id v46 = sub_10002E45C();
    v41 = (void *)objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_DEFAULT))
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicInterfaceFactory userMonogramView](self, "userMonogramView"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicInterfaceFactory tabBarController](self, "tabBarController"));
      *(_DWORD *)buf = 138412802;
      id v68 = v4;
      __int16 v69 = 2112;
      v70 = v47;
      __int16 v71 = 2112;
      v72 = v48;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v41,  OS_LOG_TYPE_DEFAULT,  "Not configuring view elements for page %@. Monogram view = %@, tabBarController = %@",  buf,  0x20u);
    }

    goto LABEL_32;
  }

- (BOOL)isPageLoaded:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicInterfaceFactory loadedTVMLPages](self, "loadedTVMLPages"));
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (int64_t)tabBarIndex
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicInterfaceFactory tabBarController](self, "tabBarController"));
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicInterfaceFactory tabBarController](self, "tabBarController"));
    id presetTabBarIndex = [v4 selectedIndex];
  }

  else
  {
    id presetTabBarIndex = (id)self->_presetTabBarIndex;
  }

  return (int64_t)presetTabBarIndex;
}

- (void)setTabBarIndex:(int64_t)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicInterfaceFactory tabBarController](self, "tabBarController"));

  if (v5)
  {
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicInterfaceFactory tabBarController](self, "tabBarController"));
    [v6 setSelectedIndex:a3];

    a3 = 0LL;
  }

  self->_id presetTabBarIndex = a3;
}

- (void)_didUpdateFocus:(id)a3
{
  id v12 = a3;
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[TVMusicInterfaceFactory monogramBottomFocusGuide](self, "monogramBottomFocusGuide"));
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicInterfaceFactory userMonogramView](self, "userMonogramView"));

    if (v6)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v12 userInfo]);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:UIFocusUpdateContextKey]);

      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 nextFocusedItem]);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicInterfaceFactory userMonogramView](self, "userMonogramView"));
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicInterfaceFactory monogramBottomFocusGuide](self, "monogramBottomFocusGuide"));
      [v11 setEnabled:v9 != v10];
    }
  }
}

- (void)_didChangeAccessibility:(id)a3
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicInterfaceFactory stackTemplateController](self, "stackTemplateController", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicInterfaceFactory stackTemplateController](self, "stackTemplateController"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 viewElement]);
  [v6 updateWithViewElement:v5];
}

- (void)_showDebugInfoInTabBar:(id)a3
{
  id v4 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10002E79C;
  v8[3] = &unk_100268B30;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)_showText:(id)a3 onTabBar:(id)a4
{
  id v16 = a3;
  id v5 = a4;
  id v6 = (UILabel *)objc_claimAutoreleasedReturnValue([v5 viewWithTag:101]);
  if (!v6)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___UILabel);
    -[UILabel setTag:](v6, "setTag:", 101LL);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor grayColor](&OBJC_CLASS___UIColor, "grayColor"));
    -[UILabel setTextColor:](v6, "setTextColor:", v7);

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](&OBJC_CLASS___UIFont, "systemFontOfSize:", 20.0));
    -[UILabel setFont:](v6, "setFont:", v8);

    [v5 addSubview:v6];
  }

  -[UILabel setText:](v6, "setText:", v16);
  -[UILabel sizeToFit](v6, "sizeToFit");
  -[UILabel frame](v6, "frame");
  double v10 = v9;
  double v12 = v11;
  [v5 frame];
  double v14 = v13 - v10 + -80.0;
  [v5 frame];
  -[UILabel setFrame:](v6, "setFrame:", v14, (v15 - v12) * 0.5, v10, v12);
}

- (id)viewControllerForElement:(id)a3 existingViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 attributes]);
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:TVAttributeCanonicalIdentifier]);

  if ([v9 length])
  {
    if ([v9 isEqualToString:@"Library"])
    {
      musicCloudViewController = self->_musicCloudViewController;
LABEL_9:
      id v16 = musicCloudViewController;
      goto LABEL_37;
    }

    if ([v9 isEqualToString:@"NowPlaying"])
    {
      musicCloudViewController = self->_musicPlaybackHostController;
      goto LABEL_9;
    }

- (id)viewForElement:(id)a3 existingView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 element]);
  id AssociatedObject = objc_getAssociatedObject(v8, off_1002B5D00);
  double v10 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);

  if (!v10)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 elementName]);
    unsigned int v14 = [v13 isEqualToString:@"musicPlaylistLockup"];

    if (v14)
    {
      uint64_t v15 = objc_claimAutoreleasedReturnValue( +[TVMusicPlaylistLockupViewCell playlistViewFromElement:existingView:]( &OBJC_CLASS___TVMusicPlaylistLockupViewCell,  "playlistViewFromElement:existingView:",  v6,  v7));
LABEL_26:
      unsigned int v12 = (void *)v15;
LABEL_27:
      if (v12) {
        goto LABEL_29;
      }
LABEL_28:
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicInterfaceFactory _viewWithAccessibilityModificationsForElement:existingView:]( self,  "_viewWithAccessibilityModificationsForElement:existingView:",  v6,  v7));
      goto LABEL_29;
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 elementName]);
    unsigned int v17 = [v16 isEqualToString:@"musicListSongLockup"];

    if (v17)
    {
      uint64_t v15 = objc_claimAutoreleasedReturnValue( +[TVMusicSongCell songCellFromElement:existingView:]( &OBJC_CLASS___TVMusicSongCell,  "songCellFromElement:existingView:",  v6,  v7));
      goto LABEL_26;
    }

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v6 elementName]);
    unsigned int v19 = [v18 isEqualToString:@"socialBadge"];

    if (v19)
    {
      uint64_t v15 = objc_claimAutoreleasedReturnValue( +[TVMusicSocialBadge socialBadgeFromElement:existingView:]( &OBJC_CLASS___TVMusicSocialBadge,  "socialBadgeFromElement:existingView:",  v6,  v7));
      goto LABEL_26;
    }

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v6 elementName]);
    unsigned int v21 = [v20 isEqualToString:@"playlistImg"];

    if (v21)
    {
      uint64_t v15 = objc_claimAutoreleasedReturnValue( +[TVMusicInterfaceFactory playlistImgWithElement:existingView:]( &OBJC_CLASS___TVMusicInterfaceFactory,  "playlistImgWithElement:existingView:",  v6,  v7));
      goto LABEL_26;
    }

    unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue([v6 elementName]);
    unsigned int v23 = [v22 isEqualToString:@"radioEpisode"];

    if (v23)
    {
      uint64_t v15 = objc_claimAutoreleasedReturnValue( +[TVMusicRadioEpisodeView radioEpisodeWithElement:existingView:]( &OBJC_CLASS___TVMusicRadioEpisodeView,  "radioEpisodeWithElement:existingView:",  v6,  v7));
      goto LABEL_26;
    }

    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v6 elementName]);
    if ([v24 isEqualToString:TVElementKeyMonogramLockup])
    {
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v6 attributes]);
      v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:TVAttributeKeyItemID]);
      unsigned int v27 = [v26 isEqualToString:@"monogramLockup-socialProfile"];

      if (v27)
      {
        unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicInterfaceFactory _TVMLKitViewForElement:existingView:]( self,  "_TVMLKitViewForElement:existingView:",  v6,  v7));
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicInterfaceFactory userMonogramView](self, "userMonogramView"));

        if (v12 == v28) {
          goto LABEL_27;
        }
        -[TVMusicInterfaceFactory setUserMonogramView:](self, "setUserMonogramView:", v12);
        char v29 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicInterfaceFactory configuredTVMLPages](self, "configuredTVMLPages"));
        [v29 removeObject:@"listen_now"];
        goto LABEL_31;
      }
    }

    else
    {
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue([v6 elementName]);
    unsigned int v31 = [v30 isEqualToString:@"motionView"];

    if (v31)
    {
      uint64_t v15 = objc_claimAutoreleasedReturnValue( +[TVMusicMotionView motionViewWithElement:existingView:]( &OBJC_CLASS___TVMusicMotionView,  "motionViewWithElement:existingView:",  v6,  v7));
      goto LABEL_26;
    }

    v32 = (void *)objc_claimAutoreleasedReturnValue([v6 elementName]);
    unsigned int v33 = [v32 isEqualToString:TVElementKeyImg];

    if (!v33)
    {
      uint64_t v15 = objc_claimAutoreleasedReturnValue( +[TVMusicInterfaceFactoryBridging viewForElement:existingView:]( &OBJC_CLASS____TtC7TVMusic31TVMusicInterfaceFactoryBridging,  "viewForElement:existingView:",  v6,  v7));
      goto LABEL_26;
    }

    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v6 attributes]);
    char v29 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKeyedSubscript:TVAttributeKeyImg_Src]);

    if ([v29 hasPrefix:@"resource:"])
    {
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v29));
      v47 = (void *)objc_claimAutoreleasedReturnValue([v6 style]);
      [v47 width];
      double v37 = v36;
      v38 = (void *)objc_claimAutoreleasedReturnValue([v6 style]);
      [v38 height];
      double v40 = v39;
      v41 = (void *)objc_claimAutoreleasedReturnValue([v6 style]);
      unsigned int v42 = (void *)objc_claimAutoreleasedReturnValue([v41 tintColor]);
      v43 = (void *)objc_claimAutoreleasedReturnValue([v42 color]);
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicInterfaceFactory _viewForImageResourceWithURL:withSize:tintColor:existingView:]( self,  "_viewForImageResourceWithURL:withSize:tintColor:existingView:",  v35,  v43,  v7,  v37,  v40));

      v44 = (void *)objc_claimAutoreleasedReturnValue([v6 attributes]);
      unsigned __int8 v45 = (void *)objc_claimAutoreleasedReturnValue([v44 objectForKeyedSubscript:TVAttributeKeyAccessibility]);

      if ([v45 length]) {
        objc_msgSend(v12, "tv_setAccessibilityText:", v45);
      }
    }

    else
    {
      unsigned int v12 = 0LL;
    }

- (id)imageForResource:(id)a3
{
  id v4 = a3;
  if (![v4 hasPrefix:@"placeholder-"])
  {
    if ([v4 hasPrefix:@"social_"])
    {
      if ([v4 isEqualToString:@"social_lock"])
      {
        id v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor grayColor](&OBJC_CLASS___UIColor, "grayColor"));
        v17[0] = v6;
        id v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
        v17[1] = v7;
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 2LL));

        double v9 = @"lock.circle.fill";
LABEL_10:

        double v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", v9));
        unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithPaletteColors:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithPaletteColors:",  v8));
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 imageWithSymbolConfiguration:v12]);

        id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "tvm_imageWithSize:aspectFit:", 1, 68.0, 68.0));
        goto LABEL_12;
      }

      if ([v4 isEqualToString:@"social_hidden"])
      {
        id v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor darkGrayColor](&OBJC_CLASS___UIColor, "darkGrayColor"));
        id v16 = v6;
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
        double v9 = @"eye.slash";
        goto LABEL_10;
      }

      if ([v4 isEqualToString:@"social_check"])
      {
        id v6 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.462745098,  0.843137255,  0.447058824,  1.0));
        double v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor", v6));
        v15[1] = v10;
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL));

        double v9 = @"checkmark.circle.fill";
        goto LABEL_10;
      }
    }

    id v5 = 0LL;
    goto LABEL_12;
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicInterfaceFactory _placeholderImageForResourceName:]( self,  "_placeholderImageForResourceName:",  v4));
LABEL_12:

  return v5;
}

- (Class)collectionViewCellClassForElement:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 elementName]);
  unsigned __int8 v5 = [v4 isEqualToString:@"musicPlaylistLockup"];

  if ((v5 & 1) != 0)
  {
    id v7 = off_100267A70;
  }

  else
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 elementName]);
    unsigned int v9 = [v8 isEqualToString:@"musicListSongLockup"];

    if (!v9)
    {
      double v11 = 0LL;
      goto LABEL_7;
    }

    id v7 = &off_100267A78;
  }

  uint64_t v10 = objc_opt_class(*v7, v6);
  double v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
LABEL_7:

  return (Class)v11;
}

- (id)_styleSheetURLForTemplate:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:TVElementKeyStackTemplate])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    unsigned __int8 v5 = v4;
    uint64_t v6 = @"MusicStackStyleSheet";
  }

  else if ([v3 isEqualToString:TVElementKeySearchTemplate])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    unsigned __int8 v5 = v4;
    uint64_t v6 = @"MusicSearchStyleSheet";
  }

  else if ([v3 isEqualToString:TVElementKeyProductTemplate])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    unsigned __int8 v5 = v4;
    uint64_t v6 = @"MusicProductStyleSheet";
  }

  else if ([v3 isEqualToString:TVElementKeyProductBundleTemplate])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    unsigned __int8 v5 = v4;
    uint64_t v6 = @"MusicProductBundleStyleSheet";
  }

  else
  {
    if (![v3 isEqualToString:TVElementKeyMusicVideoProductTemplate])
    {
      id v7 = 0LL;
      goto LABEL_12;
    }

    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    unsigned __int8 v5 = v4;
    uint64_t v6 = @"MusicVideoProductStyleSheet";
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 URLForResource:v6 withExtension:@"xml"]);

LABEL_12:
  return v7;
}

- (id)_imageProxyForElement:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 attributes]);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"musicLibraryClientData"]);
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }

  else
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 attributes]);
    id v7 = (id)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"mediaLibraryClientData"]);
  }

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicJSObject imageProxyForClientDataString:]( &OBJC_CLASS___TVMusicJSObject,  "imageProxyForClientDataString:",  v7));
  if (!v9)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v3 element]);
    if (+[TVMusicInterfaceFactory isDataPrivateForElement:]( &OBJC_CLASS___TVMusicInterfaceFactory,  "isDataPrivateForElement:",  v3)
      && (uint64_t v12 = objc_opt_class(&OBJC_CLASS___IKImageElement, v11), (objc_opt_isKindOfClass(v10, v12) & 1) != 0))
    {
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tv_imageProxy"));
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicBlurDecorator blurDecoratorForDataIsPrivate]( &OBJC_CLASS___TVMusicBlurDecorator,  "blurDecoratorForDataIsPrivate"));
      if (+[TVMLUtilities cornerRadiiFromElement:cornerRadii:circle:]( &OBJC_CLASS___TVMLUtilities,  "cornerRadiiFromElement:cornerRadii:circle:",  v3,  v15,  0LL)) {
        objc_msgSend(v13, "setCornerRadii:", v15[0], v15[1], v15[2], v15[3]);
      }
      [v9 setDecorator:v13];
    }

    else
    {
      unsigned int v9 = 0LL;
    }
  }

  return v9;
}

- (id)_placeholderImageForResourceName:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 componentsSeparatedByString:@"-"]);
  if ((unint64_t)[v3 count] < 3
    || (id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]),
        unsigned int v5 = [v4 isEqualToString:@"placeholder"],
        v4,
        !v5))
  {
    uint64_t v11 = 0LL;
    goto LABEL_29;
  }

  uint64_t v6 = 1LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:1]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:2]);
  if (![v7 isEqualToString:@"artist"])
  {
    uint64_t v6 = 0LL;
LABEL_9:
    unint64_t v10 = 3LL;
    goto LABEL_10;
  }

  if ([v8 isEqualToString:@"round"])
  {
    uint64_t v6 = 3LL;
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:3]);

    unint64_t v10 = 4LL;
    uint64_t v8 = (void *)v9;
  }

  else
  {
    unint64_t v10 = 3LL;
    uint64_t v6 = 2LL;
  }

- (id)_searchController
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicInterfaceFactory tabBarController](self, "tabBarController"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 selectedViewController]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 childViewControllers]);

  id v5 = [v4 indexOfObjectPassingTest:&stru_100269FD0];
  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = 0LL;
LABEL_6:
    unsigned int v14 = 0LL;
    goto LABEL_9;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:v5]);
  uint64_t v6 = v7;
  if (!v7) {
    goto LABEL_6;
  }
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 childViewControllers]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 firstObject]);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___UISearchContainerViewController, v10);
  if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 childViewControllers]);
    unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 firstObject]);
  }

  else
  {
    unint64_t v13 = 0LL;
  }

  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 searchController]);
LABEL_9:

  return v14;
}

- (id)_viewForImageResourceWithURL:(id)a3 withSize:(CGSize)a4 tintColor:(id)a5 existingView:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([a3 host]);
  unint64_t v13 = v12;
  if (v12
    && [v12 length]
    && (unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", v13))) != 0LL)
  {
    id v16 = v14;
    if (width > 0.0 || height > 0.0)
    {
      [v14 size];
      if (v17 > 0.0)
      {
        [v16 size];
        if (v18 > 0.0)
        {
          if (width == 0.0)
          {
            [v16 size];
            double v20 = height * v19;
            [v16 size];
            double width = v20 / v21;
          }

          else if (height == 0.0)
          {
            [v16 size];
            double v24 = width * v23;
            [v16 size];
            double height = v24 / v25;
          }

          uint64_t v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "tvm_imageWithSize:", width, height));

          id v16 = (void *)v26;
        }
      }
    }

    uint64_t v27 = objc_opt_class(&OBJC_CLASS____TVImageView, v15);
    if ((objc_opt_isKindOfClass(v11, v27) & 1) != 0) {
      uint64_t v28 = v11;
    }
    else {
      uint64_t v28 = 0LL;
    }
    id v22 = v11;
    if (!v28) {
      id v22 = objc_alloc_init(&OBJC_CLASS____TVImageView);
    }
    [v16 size];
    double v30 = v29;
    [v16 size];
    objc_msgSend(v22, "setFrame:", 0.0, 0.0, v30, v31);
    if (v10)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue([v16 imageWithRenderingMode:2]);
      [v22 setImage:v32];

      [v22 setTintColor:v10];
    }

    else
    {
      [v22 setImage:v16];
    }
  }

  else
  {
    id v22 = 0LL;
  }

  return v22;
}

- (id)_viewWithAccessibilityModificationsForElement:(id)a3 existingView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (UIAccessibilityDarkerSystemColorsEnabled())
  {
    v38[0] = TVElementKeySubtitle;
    v38[1] = TVElementKeyTitle;
    v38[2] = TVElementKeyHeader;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v38, 3LL));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 elementName]);
    unsigned int v10 = [v8 containsObject:v9];

    if (v10)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicInterfaceFactory _TVMLKitViewForElement:existingView:]( self,  "_TVMLKitViewForElement:existingView:",  v6,  v7));
      if (v12)
      {
        uint64_t v13 = objc_opt_class(&OBJC_CLASS___UILabel, v11);
        char isKindOfClass = objc_opt_isKindOfClass(v12, v13);
        if ((isKindOfClass & 1) != 0) {
          uint64_t v15 = v12;
        }
        else {
          uint64_t v15 = 0LL;
        }
        id v16 = v15;
        if ((isKindOfClass & 1) != 0)
        {
          -[TVMusicInterfaceFactory _makeHighContrastLabel:](self, "_makeHighContrastLabel:", v12);
        }

        else if ((objc_opt_respondsToSelector(v12, "components") & 1) != 0)
        {
          id v17 = [v12 performSelector:"components"];
          uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSArray, v18);
          id v31 = v16;
          v32 = v8;
          if ((objc_opt_isKindOfClass(v17, v19) & 1) != 0) {
            id v20 = [v12 performSelector:"components"];
          }
          else {
            id v20 = 0LL;
          }
          id v21 = v20;
          __int128 v33 = 0u;
          __int128 v34 = 0u;
          __int128 v35 = 0u;
          __int128 v36 = 0u;
          id v22 = [v21 countByEnumeratingWithState:&v33 objects:v37 count:16];
          if (v22)
          {
            id v24 = v22;
            uint64_t v25 = *(void *)v34;
            do
            {
              uint64_t v26 = 0LL;
              do
              {
                if (*(void *)v34 != v25) {
                  objc_enumerationMutation(v21);
                }
                uint64_t v27 = *(void *)(*((void *)&v33 + 1) + 8LL * (void)v26);
                uint64_t v28 = objc_opt_class(&OBJC_CLASS___UILabel, v23);
                if ((objc_opt_isKindOfClass(v27, v28) & 1) != 0) {
                  uint64_t v29 = v27;
                }
                else {
                  uint64_t v29 = 0LL;
                }
                -[TVMusicInterfaceFactory _makeHighContrastLabel:](self, "_makeHighContrastLabel:", v29, v31, v32);
                uint64_t v26 = (char *)v26 + 1;
              }

              while (v24 != v26);
              id v24 = [v21 countByEnumeratingWithState:&v33 objects:v37 count:16];
            }

            while (v24);
          }

          id v16 = v31;
          uint64_t v8 = v32;
        }
      }
    }

    else
    {
      uint64_t v12 = 0LL;
    }
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  return v12;
}

- (void)_makeHighContrastLabel:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v5 = (id)objc_claimAutoreleasedReturnValue([v3 textColor]);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 colorWithAlphaComponent:1.0]);
    [v3 setTextColor:v4];
  }

- (id)_TVMLKitViewForElement:(id)a3 existingView:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 element]);
  objc_setAssociatedObject(v7, off_1002B5D00, &__kCFBooleanTrue, (void *)1);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVInterfaceFactory sharedInterfaceFactory]( &OBJC_CLASS___TVInterfaceFactory,  "sharedInterfaceFactory"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 viewForElement:v6 existingView:v5]);

  return v9;
}

- (UITabBarController)tabBarController
{
  return (UITabBarController *)objc_loadWeakRetained((id *)&self->_tabBarController);
}

- (void)setTabBarController:(id)a3
{
}

- (UIView)userMonogramView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_userMonogramView);
}

- (void)setUserMonogramView:(id)a3
{
}

- (NSMutableSet)configuredTVMLPages
{
  return self->_configuredTVMLPages;
}

- (void)setConfiguredTVMLPages:(id)a3
{
}

- (UIFocusGuide)monogramBottomFocusGuide
{
  return self->_monogramBottomFocusGuide;
}

- (void)setMonogramBottomFocusGuide:(id)a3
{
}

- (TVMusicStackTemplateController)stackTemplateController
{
  return (TVMusicStackTemplateController *)objc_loadWeakRetained((id *)&self->_stackTemplateController);
}

- (void)setStackTemplateController:(id)a3
{
}

- (NSMutableSet)loadedTVMLPages
{
  return self->_loadedTVMLPages;
}

- (void)setLoadedTVMLPages:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)playlistImgWithElement:(id)a3 existingView:(id)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 element]);
  __int128 v7 = TVCornerRadiiZero[1];
  __int128 v48 = TVCornerRadiiZero[0];
  __int128 v49 = v7;
  +[TVMLUtilities cornerRadiiFromElement:cornerRadii:circle:]( &OBJC_CLASS___TVMLUtilities,  "cornerRadiiFromElement:cornerRadii:circle:",  v5,  &v48,  0LL);
  +[TVCornerUtilities radiusFromCornerRadii:](&OBJC_CLASS___TVCornerUtilities, "radiusFromCornerRadii:", v48, v49);
  double v9 = v8;
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v6 attributes]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"width"]);
  [v11 floatValue];
  double v13 = v12;
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v6 attributes]);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"height"]);
  [v15 floatValue];
  double v17 = v16;

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v6 style]);
  objc_msgSend(v18, "tv_width");
  double v20 = v19;

  id v21 = (void *)objc_claimAutoreleasedReturnValue([v6 style]);
  objc_msgSend(v21, "tv_height");
  double v23 = v22;

  if (v20 == 0.0 || v23 == 0.0)
  {
    double v23 = v17;
    double v20 = v13;
  }

  id v24 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"TVConfigureForMetrics"]);
  unsigned __int8 v25 = [v24 BOOLValue];

  id v26 = 0LL;
  if (v20 >= 0.00000011920929 && v23 >= 0.00000011920929)
  {
    +[TVMLUtilities focusedSizeIncreaseForSize:upscaleFactor:]( &OBJC_CLASS___TVMLUtilities,  "focusedSizeIncreaseForSize:upscaleFactor:",  v20,  v23,  1.0);
    double v28 = v27;
    if ((v25 & 1) != 0)
    {
      uint64_t v29 = 0LL;
    }

    else
    {
      double v30 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      __int128 v44 = 0u;
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      __int128 v47 = 0u;
      id v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "children", 0));
      id v32 = [v31 countByEnumeratingWithState:&v44 objects:v50 count:16];
      if (v32)
      {
        id v33 = v32;
        uint64_t v34 = *(void *)v45;
        do
        {
          for (i = 0LL; i != v33; i = (char *)i + 1)
          {
            if (*(void *)v45 != v34) {
              objc_enumerationMutation(v31);
            }
            __int128 v36 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)i);
            if (objc_msgSend(v36, "tv_elementType") == (id)16 && !objc_msgSend(v36, "tv_imageType"))
            {
              double v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "tv_imageProxy"));
              if (v37) {
                -[NSMutableArray addObject:](v30, "addObject:", v37);
              }
            }
          }

          id v33 = [v31 countByEnumeratingWithState:&v44 objects:v50 count:16];
        }

        while (v33);
      }

      v38 = -[TVMusicPlaylistImageRequest initWithImageProxies:playlistStyle:]( objc_alloc(&OBJC_CLASS___TVMusicPlaylistImageRequest),  "initWithImageProxies:playlistStyle:",  v30,  @"TVMusicPlaylistStyleDefault");
      -[TVMusicPlaylistImageRequest setUpscaleAdjustment:](v38, "setUpscaleAdjustment:", v28);
      -[TVMusicPlaylistImageRequest setScaleToSize:](v38, "setScaleToSize:", v20, v23);
      if ((+[TVMLUtilities canHandleDecodingOnRenderThread]( &OBJC_CLASS___TVMLUtilities,  "canHandleDecodingOnRenderThread") & 1) == 0) {
        -[TVMusicPlaylistImageRequest setCornerRadius:](v38, "setCornerRadius:", v9);
      }
      double v39 = objc_alloc(&OBJC_CLASS___TVImageProxy);
      double v40 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicPlaylistImageLoader sharedInstance]( &OBJC_CLASS___TVMusicPlaylistImageLoader,  "sharedInstance"));
      uint64_t v29 = -[TVImageProxy initWithObject:imageLoader:groupType:]( v39,  "initWithObject:imageLoader:groupType:",  v38,  v40,  0LL);

      if ([a1 isDataPrivateForElement:v5])
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicBlurDecorator blurDecoratorForDataIsPrivate]( &OBJC_CLASS___TVMusicBlurDecorator,  "blurDecoratorForDataIsPrivate"));
        -[TVImageProxy setDecorator:](v29, "setDecorator:", v41);
      }

      else
      {
        -[TVImageProxy setDecorator:](v29, "setDecorator:", 0LL);
      }
    }

    id v26 = [[TVStackedImageView alloc] initWithImageProxy:v29];
    unsigned int v42 = (void *)objc_claimAutoreleasedReturnValue( +[TVMLUtilities placeholderImageForViewElement:]( &OBJC_CLASS___TVMLUtilities,  "placeholderImageForViewElement:",  v5));
    [v26 setPlaceholderImage:v42];

    objc_msgSend(v26, "setStackSize:", v20, v23);
    [v26 setFocusSizeIncrease:v28];
    [v26 setCornerRadius:v9];
  }

  return v26;
}

+ (BOOL)isDataPrivateForElement:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 attributes]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tvs_stringForKey:", @"data-is-private-mask"));

  if (v4) {
    unsigned int v5 = [v4 isEqualToString:@"false"] ^ 1;
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

@end