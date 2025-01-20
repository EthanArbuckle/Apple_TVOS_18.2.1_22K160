@interface TVHMediaLibraryViewController
- (BOOL)addedfetchController;
- (BOOL)listeningForSettingsNotifications;
- (TVHKMediaCategoryTypesFetchController)fetchController;
- (TVHKMediaLibrary)mediaLibrary;
- (TVHMediaLibraryTabBarViewController)tabBarViewController;
- (TVHMediaLibraryViewController)init;
- (TVHMediaLibraryViewController)initWithCoder:(id)a3;
- (TVHMediaLibraryViewController)initWithMediaLibrary:(id)a3;
- (TVHMediaLibraryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)preferredFocusEnvironments;
- (void)_initializeTabBarViewControllerWithMediaCategoryTypes:(id)a3;
- (void)_reinitializeTabBarViewController;
- (void)_showNoContentViewController;
- (void)_startListentingToSettingsNotifications;
- (void)_stopListentingToSettingsNotifications;
- (void)controller:(id)a3 fetchDidCompleteWithResult:(id)a4;
- (void)dealloc;
- (void)fetchDidCompleteForMediaLibraryFetchControllerManager:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAddedfetchController:(BOOL)a3;
- (void)setListeningForSettingsNotifications:(BOOL)a3;
- (void)setTabBarViewController:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TVHMediaLibraryViewController

- (TVHMediaLibraryViewController)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHMediaLibraryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v6);

  return 0LL;
}

- (TVHMediaLibraryViewController)initWithCoder:(id)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHMediaLibraryViewController)initWithMediaLibrary:(id)a3
{
  id v5 = a3;
  if (!v5) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ parameter must not be nil.",  @"mediaLibrary");
  }
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___TVHMediaLibraryViewController;
  v6 = -[TVHMediaLibraryViewController initWithNibName:bundle:](&v16, "initWithNibName:bundle:", 0LL, 0LL);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mediaLibrary, a3);
    v8 = -[TVHKMediaCategoryTypesFetchController initWithMediaLibrary:]( objc_alloc(&OBJC_CLASS___TVHKMediaCategoryTypesFetchController),  "initWithMediaLibrary:",  v7->_mediaLibrary);
    fetchController = v7->_fetchController;
    v7->_fetchController = v8;

    -[TVHKMediaCategoryTypesFetchController setDelegate:](v7->_fetchController, "setDelegate:", v7);
    v10 = v7->_fetchController;
    v11 = (objc_class *)objc_opt_class(v7);
    v12 = NSStringFromClass(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    -[TVHKMediaCategoryTypesFetchController setLogName:](v10, "setLogName:", v13);

    -[TVHKMediaCategoryTypesFetchController enable](v7->_fetchController, "enable");
    v14 = objc_alloc_init(&OBJC_CLASS___TVHLoadingViewController);
    -[TVHMediaLibraryViewController tvh_setFullViewChildViewController:](v7, "tvh_setFullViewChildViewController:", v14);
  }

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVHMediaLibraryViewController;
  -[TVHMediaLibraryViewController dealloc](&v3, "dealloc");
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVHMediaLibraryViewController;
  -[TVHMediaLibraryViewController viewDidLoad](&v3, "viewDidLoad");
  -[TVHMediaLibraryViewController _startListentingToSettingsNotifications]( self,  "_startListentingToSettingsNotifications");
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVHMediaLibraryViewController;
  -[TVHMediaLibraryViewController viewWillAppear:](&v7, "viewWillAppear:", a3);
  if (!-[TVHMediaLibraryViewController addedfetchController](self, "addedfetchController"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaLibraryViewController mediaLibrary](self, "mediaLibrary"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaLibraryFetchControllerManager managerForMediaLibrary:]( &OBJC_CLASS___TVHKMediaLibraryFetchControllerManager,  "managerForMediaLibrary:",  v4));

    [v5 setDelegate:self];
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaLibraryViewController fetchController](self, "fetchController"));
    [v5 addFetchController:v6];

    -[TVHMediaLibraryViewController setAddedfetchController:](self, "setAddedfetchController:", 1LL);
  }

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVHMediaLibraryViewController;
  -[TVHMediaLibraryViewController viewWillDisappear:](&v7, "viewWillDisappear:", a3);
  if ((-[TVHMediaLibraryViewController isBeingDismissed](self, "isBeingDismissed") & 1) != 0
    || -[TVHMediaLibraryViewController isMovingFromParentViewController]( self,  "isMovingFromParentViewController"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaLibraryViewController mediaLibrary](self, "mediaLibrary"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaLibraryFetchControllerManager managerForMediaLibrary:]( &OBJC_CLASS___TVHKMediaLibraryFetchControllerManager,  "managerForMediaLibrary:",  v4));

    [v5 setDelegate:self];
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaLibraryViewController fetchController](self, "fetchController"));
    [v5 removeFetchController:v6];
    [v6 cancel];
    -[TVHMediaLibraryViewController setAddedfetchController:](self, "setAddedfetchController:", 0LL);
  }

- (id)preferredFocusEnvironments
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(-[TVHMediaLibraryViewController tabBarViewController](self, "tabBarViewController"));
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

- (void)controller:(id)a3 fetchDidCompleteWithResult:(id)a4
{
  id v8 = a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v8 mediaCategoryTypes]);
  if ([v5 count])
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaLibraryViewController tabBarViewController](self, "tabBarViewController"));
    if (v6)
    {
      objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v8 mediaCategoryTypesChangeSet]);
      [v6 updateWithMediaCategoryTypes:v5 changeSet:v7];
    }

    else
    {
      -[TVHMediaLibraryViewController _initializeTabBarViewControllerWithMediaCategoryTypes:]( self,  "_initializeTabBarViewControllerWithMediaCategoryTypes:",  v5);
      objc_super v7 = (void *)objc_claimAutoreleasedReturnValue( +[TVHAnalyticsController sharedController]( &OBJC_CLASS___TVHAnalyticsController,  "sharedController"));
      [v7 sendMediaLibraryBrowsedEventWithMediaCategoryTypes:v5];
    }
  }

  else
  {
    -[TVHMediaLibraryViewController _showNoContentViewController](self, "_showNoContentViewController");
  }
}

- (void)fetchDidCompleteForMediaLibraryFetchControllerManager:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaLibraryViewController navigationController](self, "navigationController", a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 viewControllers]);
  uint64_t v6 = (char *)[v5 count];
  v28 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  objc_super v7 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", v6);
  id v8 = (char *)[v5 indexOfObjectIdenticalTo:self];
  if (v8 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = sub_10007A1C8();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10009C4C8(v10);
    }
  }

  else
  {
    v11 = v8;
    v27 = v4;
    uint64_t v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subarrayWithRange:", 0, v8));
    -[NSMutableArray addObjectsFromArray:](v7, "addObjectsFromArray:");
    id v12 = sub_100079DD8();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "TVHMediaLibraryViewController: Looking for view controllers that should be removed",  buf,  2u);
    }

    if (v11 < v6)
    {
      do
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:v11]);
        id v15 = sub_100079DD8();
        objc_super v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v14 debugDescription]);
          *(_DWORD *)buf = 138412290;
          v30 = v17;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "TVHMediaLibraryViewController: Testing View Controller (%@)",  buf,  0xCu);
        }

        if ([v14 conformsToProtocol:&OBJC_PROTOCOL___TVHDeletableContentViewController])
        {
          id v18 = v14;
          v14 = v18;
          if ([v18 contentHasBeenDeleted])
          {
            id v19 = sub_100079DD8();
            v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              v21 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v18 debugDescription]);
              *(_DWORD *)buf = 138412290;
              v30 = v21;
              _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "TVHMediaLibraryViewController: View controller has no content! It will be removed from the nav stack. (%@)",  buf,  0xCu);
            }

            -[NSMutableArray addObject:](v28, "addObject:", v18);
            v14 = 0LL;
          }
        }

        if (v14) {
          -[NSMutableArray addObject:](v7, "addObject:", v14);
        }

        ++v11;
      }

      while (v6 != v11);
    }

    v22 = (char *)-[NSMutableArray count](v7, "count");
    id v23 = sub_100079DD8();
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
    if (v22 == v6)
    {
      v4 = v27;
      if (v25)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "TVHMediaLibraryViewController: Leaving view controller stack alone",  buf,  2u);
      }
    }

    else
    {
      v4 = v27;
      if (v25)
      {
        *(_DWORD *)buf = 138412290;
        v30 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "TVHMediaLibraryViewController: Setting view controller stack to: %@",  buf,  0xCu);
      }

      [v27 setViewControllers:v7 animated:0];
    }

    v10 = (os_log_s *)v26;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_1001565C8 == a6)
  {
    id v13 = sub_10007A1C8();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v15 = "Received KVO notification that the movie cover art shape has changed.";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 2u);
    }

- (void)_initializeTabBarViewControllerWithMediaCategoryTypes:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS___TVHMediaLibraryTabBarViewController);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaLibraryViewController mediaLibrary](self, "mediaLibrary"));
  objc_super v7 = -[TVHMediaLibraryTabBarViewController initWithMediaLibrary:mediaCategoryTypes:]( v5,  "initWithMediaLibrary:mediaCategoryTypes:",  v6,  v4);

  -[TVHMediaLibraryViewController setTabBarViewController:](self, "setTabBarViewController:", v7);
  -[TVHMediaLibraryViewController tvh_setFullViewChildViewController:](self, "tvh_setFullViewChildViewController:", v7);
}

- (void)_reinitializeTabBarViewController
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaLibraryViewController tabBarViewController](self, "tabBarViewController"));
  id v5 = (id)objc_claimAutoreleasedReturnValue([v3 mediaCategoryTypes]);

  id v4 = v5;
  if (v5)
  {
    -[TVHMediaLibraryViewController _initializeTabBarViewControllerWithMediaCategoryTypes:]( self,  "_initializeTabBarViewControllerWithMediaCategoryTypes:",  v5);
    id v4 = v5;
  }
}

- (void)_startListentingToSettingsNotifications
{
  if (!-[TVHMediaLibraryViewController listeningForSettingsNotifications](self, "listeningForSettingsNotifications"))
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue(+[TVHAppSettings sharedInstance](&OBJC_CLASS___TVHAppSettings, "sharedInstance"));
    [v3 addObserver:self forKeyPath:@"movieCoverArtShape" options:1 context:off_1001565C8];
    [v3 addObserver:self forKeyPath:@"showCoverArtShape" options:1 context:off_1001565D0];
    -[TVHMediaLibraryViewController setListeningForSettingsNotifications:]( self,  "setListeningForSettingsNotifications:",  1LL);
  }

- (void)_stopListentingToSettingsNotifications
{
  if (-[TVHMediaLibraryViewController listeningForSettingsNotifications](self, "listeningForSettingsNotifications"))
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue(+[TVHAppSettings sharedInstance](&OBJC_CLASS___TVHAppSettings, "sharedInstance"));
    [v3 removeObserver:self forKeyPath:@"movieCoverArtShape" context:off_1001565C8];
    [v3 removeObserver:self forKeyPath:@"showCoverArtShape" context:off_1001565D0];
    -[TVHMediaLibraryViewController setListeningForSettingsNotifications:]( self,  "setListeningForSettingsNotifications:",  0LL);
  }

- (void)_showNoContentViewController
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v5 = (id)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:@"EMPTY_LIBRARY_ERROR_MESSAGE" value:0 table:0]);

  id v4 = -[TVHErrorViewController initWithMessage:]( objc_alloc(&OBJC_CLASS___TVHErrorViewController),  "initWithMessage:",  v5);
  -[TVHMediaLibraryViewController tvh_setFullViewChildViewController:](self, "tvh_setFullViewChildViewController:", v4);
  -[TVHMediaLibraryViewController setTabBarViewController:](self, "setTabBarViewController:", 0LL);
}

- (TVHKMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (TVHKMediaCategoryTypesFetchController)fetchController
{
  return self->_fetchController;
}

- (BOOL)addedfetchController
{
  return self->_addedfetchController;
}

- (void)setAddedfetchController:(BOOL)a3
{
  self->_addedfetchController = a3;
}

- (TVHMediaLibraryTabBarViewController)tabBarViewController
{
  return self->_tabBarViewController;
}

- (void)setTabBarViewController:(id)a3
{
}

- (BOOL)listeningForSettingsNotifications
{
  return self->_listeningForSettingsNotifications;
}

- (void)setListeningForSettingsNotifications:(BOOL)a3
{
  self->_listeningForSettingsNotifications = a3;
}

- (void).cxx_destruct
{
}

@end