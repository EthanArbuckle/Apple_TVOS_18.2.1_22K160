@interface TVMusicLibraryTopMenuViewController
+ (id)currentTopMenu;
- (BOOL)needsReload;
- (MPModelLibraryResponse)genresResponse;
- (NSArray)menuItems;
- (NSIndexPath)lastSelectedIndexPath;
- (NSString)identifierForCurrentlySelectedItem;
- (TVMusicLibraryTopMenuViewController)initWithMenuItems:(id)a3;
- (UIView)genresHeaderView;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_accessibilityIdentifierForGenreAtIndexPath:(id)a3;
- (id)_accessibilityIdentifierForIndexPath:(id)a3;
- (id)_accessibilityIdentifierForMenuItem:(unint64_t)a3;
- (id)_genreForIndexPath:(id)a3;
- (id)_nameForMenuItem:(unint64_t)a3;
- (id)_noResultsViewWithTitle:(id)a3 subtitle:(id)a4;
- (id)_previewViewControllerForIndexPath:(id)a3;
- (id)_viewControllerForBrowseSectionRowAtIndex:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)_menuItemForRowIndex:(int64_t)a3;
- (unint64_t)viewControllerUIContext;
- (void)_getGenres;
- (void)_modelResponseDidInvalidate:(id)a3;
- (void)_selectCell:(id)a3 atIndexPath:(id)a4;
- (void)dealloc;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setGenresHeaderView:(id)a3;
- (void)setGenresResponse:(id)a3;
- (void)setIdentifierForCurrentlySelectedItem:(id)a3;
- (void)setLastSelectedIndexPath:(id)a3;
- (void)setNeedsReload:(BOOL)a3;
- (void)setViewControllerUIContext:(unint64_t)a3;
- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVMusicLibraryTopMenuViewController

- (TVMusicLibraryTopMenuViewController)initWithMenuItems:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TVMusicLibraryTopMenuViewController;
  v5 = -[TVMusicTableViewController init](&v15, "init");
  if (v5)
  {
    v6 = (NSArray *)[v4 copy];
    menuItems = v5->_menuItems;
    v5->_menuItems = v6;

    -[TVPreviewTableViewController setTableViewWidth:](v5, "setTableViewWidth:", 436.0);
    -[TVPreviewTableViewController setPreviewOnRightSide:](v5, "setPreviewOnRightSide:", 1LL);
    -[TVPreviewTableViewController setBackdropViewMode:](v5, "setBackdropViewMode:", 0LL);
    -[TVPreviewTableViewController setTableViewPadding:](v5, "setTableViewPadding:", 200.0, 95.0, 0.0, 0.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  0LL,  0LL));
    v9 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicLibraryTopMenuViewController _previewViewControllerForIndexPath:]( v5,  "_previewViewControllerForIndexPath:",  v8));
    -[TVPreviewTableViewController setPreviewViewController:](v5, "setPreviewViewController:", v9);

    -[TVPreviewTableViewController setAutoUpdatePreviewViewControllerBlock:]( v5,  "setAutoUpdatePreviewViewControllerBlock:",  0LL);
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  0LL,  0LL));
    v11 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicLibraryTopMenuViewController _accessibilityIdentifierForIndexPath:]( v5,  "_accessibilityIdentifierForIndexPath:",  v10));
    -[TVMusicLibraryTopMenuViewController setIdentifierForCurrentlySelectedItem:]( v5,  "setIdentifierForCurrentlySelectedItem:",  v11);

    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithDynamicProvider:](&OBJC_CLASS___UIColor, "colorWithDynamicProvider:", &stru_10026DC10));
    selectedCellBackgroundColor = v5->_selectedCellBackgroundColor;
    v5->_selectedCellBackgroundColor = (UIColor *)v12;
  }

  return v5;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVMusicLibraryTopMenuViewController;
  -[TVMusicLibraryTopMenuViewController dealloc](&v4, "dealloc");
}

+ (id)currentTopMenu
{
  return (id)qword_1002BEBE0;
}

- (void)viewDidLoad
{
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___TVMusicLibraryTopMenuViewController;
  -[TVMusicTableViewController viewDidLoad](&v30, "viewDidLoad");
  objc_storeStrong((id *)&qword_1002BEBE0, self);
  -[TVPreviewTableViewController setFadeThroughPreviews:](self, "setFadeThroughPreviews:", 1LL);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"_modelResponseDidInvalidate:" name:MPModelResponseDidInvalidateNotification object:0];

  objc_super v4 = objc_alloc_init(&OBJC_CLASS___UIFocusGuide);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPreviewTableViewController tableView](self, "tableView"));
  v32 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v32, 1LL));
  -[UIFocusGuide setPreferredFocusEnvironments:](v4, "setPreferredFocusEnvironments:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryTopMenuViewController view](self, "view"));
  [v7 addLayoutGuide:v4];

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide leftAnchor](v4, "leftAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryTopMenuViewController view](self, "view"));
  v27 = (void *)objc_claimAutoreleasedReturnValue([v29 leftAnchor]);
  v26 = (void *)objc_claimAutoreleasedReturnValue([v28 constraintEqualToAnchor:v27]);
  v31[0] = v26;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide rightAnchor](v4, "rightAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryTopMenuViewController view](self, "view"));
  v23 = (void *)objc_claimAutoreleasedReturnValue([v25 rightAnchor]);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v24 constraintEqualToAnchor:v23]);
  v31[1] = v22;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide topAnchor](v4, "topAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPreviewTableViewController tableView](self, "tableView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 topAnchor]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v21 constraintEqualToAnchor:v9 constant:-10.0]);
  v31[2] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide bottomAnchor](v4, "bottomAnchor"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVPreviewTableViewController tableView](self, "tableView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 topAnchor]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v11 constraintEqualToAnchor:v13]);
  v31[3] = v14;
  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v31, 4LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v15);

  menuFocusGuide = self->_menuFocusGuide;
  self->_menuFocusGuide = v4;
  v17 = v4;

  v18 = objc_alloc(&OBJC_CLASS___TVInteractionGestureRecognizer);
  v19 = -[TVInteractionGestureRecognizer initWithTarget:action:](v18, "initWithTarget:action:", self, 0LL);
  -[TVInteractionGestureRecognizer setAllowedPressTypes:](v19, "setAllowedPressTypes:", &off_1002822A0);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVPreviewTableViewController tableView](self, "tableView"));
  [v20 addGestureRecognizer:v19];

  -[TVMusicLibraryTopMenuViewController _getGenres](self, "_getGenres");
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVMusicLibraryTopMenuViewController;
  -[TVPreviewTableViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  if (-[TVMusicLibraryTopMenuViewController needsReload](self, "needsReload")) {
    -[TVMusicLibraryTopMenuViewController _getGenres](self, "_getGenres");
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVMusicLibraryTopMenuViewController;
  -[TVMusicTableViewController viewDidAppear:](&v6, "viewDidAppear:", a3);
  if (!-[TVMusicLibraryTopMenuViewController viewControllerUIContext](self, "viewControllerUIContext")) {
    -[TVMusicLibraryTopMenuViewController setViewControllerUIContext:](self, "setViewControllerUIContext:", 1LL);
  }
  unint64_t v4 = -[TVMusicLibraryTopMenuViewController viewControllerUIContext](self, "viewControllerUIContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicLibraryUITracker sharedTracker](&OBJC_CLASS___TVMusicLibraryUITracker, "sharedTracker"));
  [v5 setCurrentContext:v4];
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___TVMusicLibraryTopMenuViewController;
  -[TVPreviewTableViewController didUpdateFocusInContext:withAnimationCoordinator:]( &v18,  "didUpdateFocusInContext:withAnimationCoordinator:",  v6,  a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 previouslyFocusedItem]);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___UITableViewCell, v8);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0) {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 previouslyFocusedItem]);
  }
  else {
    v10 = 0LL;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([v6 nextFocusedItem]);
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___UITableViewCell, v12);
  if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0) {
    v14 = (void *)objc_claimAutoreleasedReturnValue([v6 nextFocusedItem]);
  }
  else {
    v14 = 0LL;
  }

  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVPreviewTableViewController tableView](self, "tableView"));
  if ([v10 isDescendantOfView:v15])
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVPreviewTableViewController tableView](self, "tableView"));
    unsigned __int8 v17 = [v14 isDescendantOfView:v16];

    if ((v17 & 1) == 0) {
      [v10 setSelected:1];
    }
  }

  else
  {
  }
}

- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___TVMusicLibraryTopMenuViewController;
  -[TVPreviewTableViewController tableView:didUpdateFocusInContext:withAnimationCoordinator:]( &v25,  "tableView:didUpdateFocusInContext:withAnimationCoordinator:",  v8,  v9,  v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  if ([v11 applicationState] == (id)2)
  {
  }

  else
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 nextFocusedIndexPath]);

    if (v12)
    {
LABEL_5:
      -[UIFocusGuide setEnabled:](self->_menuFocusGuide, "setEnabled:", 0LL);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v9 nextFocusedItem]);
      uint64_t v16 = objc_opt_class(&OBJC_CLASS___UITableViewCell, v15);
      if ((objc_opt_isKindOfClass(v14, v16) & 1) != 0) {
        unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue([v9 nextFocusedItem]);
      }
      else {
        unsigned __int8 v17 = 0LL;
      }

      objc_super v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVPreviewTableViewController tableView](self, "tableView"));
      unsigned int v19 = [v17 isDescendantOfView:v18];

      if (v19)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue([v9 nextFocusedIndexPath]);
        -[TVMusicLibraryTopMenuViewController _selectCell:atIndexPath:](self, "_selectCell:atIndexPath:", v17, v20);

        self->_tableViewHasBeenFocused = 1;
      }

      v21 = (void *)objc_claimAutoreleasedReturnValue( -[TVPreviewTableViewController autoUpdatePreviewViewControllerBlock]( self,  "autoUpdatePreviewViewControllerBlock"));

      if (!v21)
      {
        objc_initWeak(&location, self);
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472LL;
        v22[2] = sub_1000BA5E8;
        v22[3] = &unk_10026DC38;
        objc_copyWeak(&v23, &location);
        -[TVPreviewTableViewController setAutoUpdatePreviewViewControllerBlock:]( self,  "setAutoUpdatePreviewViewControllerBlock:",  v22);
        objc_destroyWeak(&v23);
        objc_destroyWeak(&location);
      }

      goto LABEL_13;
    }
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v9 nextFocusedIndexPath]);

  if (v13) {
    goto LABEL_5;
  }
  if ([v9 focusHeading] == (id)1) {
    -[UIFocusGuide setEnabled:](self->_menuFocusGuide, "setEnabled:", 1LL);
  }
LABEL_13:
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v10 = a4;
  id v7 = a5;
  if ([v7 section] || objc_msgSend(v7, "item") || self->_tableViewHasBeenFocused)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryTopMenuViewController lastSelectedIndexPath](self, "lastSelectedIndexPath"));
    unsigned int v9 = [v8 isEqual:v7];

    if (v9) {
      [v10 setSelected:1];
    }
  }

  else
  {
    -[TVMusicLibraryTopMenuViewController _selectCell:atIndexPath:](self, "_selectCell:atIndexPath:", v10, v7);
  }
}

- (void)_selectCell:(id)a3 atIndexPath:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  uint64_t v7 = objc_claimAutoreleasedReturnValue(-[TVMusicLibraryTopMenuViewController lastSelectedIndexPath](self, "lastSelectedIndexPath"));
  if (v7)
  {
    id v8 = (void *)v7;
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryTopMenuViewController lastSelectedIndexPath](self, "lastSelectedIndexPath"));
    unsigned __int8 v10 = [v9 isEqual:v6];

    if ((v10 & 1) == 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVPreviewTableViewController tableView](self, "tableView"));
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryTopMenuViewController lastSelectedIndexPath](self, "lastSelectedIndexPath"));
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 cellForRowAtIndexPath:v12]);
      [v13 setSelected:0];
    }
  }

  [v14 setSelected:1];
  -[TVMusicLibraryTopMenuViewController setLastSelectedIndexPath:](self, "setLastSelectedIndexPath:", v6);
}

- (id)_nameForMenuItem:(unint64_t)a3
{
  mapMenuItemToName = self->_mapMenuItemToName;
  if (!mapMenuItemToName)
  {
    v11[0] = &off_100281AF0;
    v11[1] = &off_100281B08;
    v12[0] = @"LibraryMenuRecentlyAdded";
    v12[1] = @"LibraryMenuPlaylists";
    v11[2] = &off_100281B20;
    v11[3] = &off_100281B38;
    v12[2] = @"LibraryMenuArtists";
    v12[3] = @"LibraryMenuAlbums";
    v11[4] = &off_100281B50;
    v11[5] = &off_100281B68;
    v12[4] = @"LibraryMenuSongs";
    v12[5] = @"LibraryMenuItemPersonalMixPlaylists";
    v11[6] = &off_100281B80;
    v11[7] = &off_100281B98;
    v12[6] = @"LibraryMenuItemShows";
    v12[7] = @"LibraryMenuMusicVideos";
    v11[8] = &off_100281BB0;
    v11[9] = &off_100281BC8;
    v12[8] = @"LibraryMenuComposers";
    v12[9] = @"LibraryMenuCompilations";
    id v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  10LL));
    uint64_t v7 = self->_mapMenuItemToName;
    self->_mapMenuItemToName = v6;

    mapMenuItemToName = self->_mapMenuItemToName;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](mapMenuItemToName, "objectForKeyedSubscript:", v8));

  return v9;
}

- (id)_accessibilityIdentifierForMenuItem:(unint64_t)a3
{
  mapMenuItemToAXID = self->_mapMenuItemToAXID;
  if (!mapMenuItemToAXID)
  {
    v11[0] = &off_100281AF0;
    v11[1] = &off_100281B08;
    v12[0] = @"TVMusic.Library.RecentlyAdded";
    v12[1] = @"TVMusic.Library.Playlists";
    v11[2] = &off_100281B20;
    v11[3] = &off_100281B38;
    v12[2] = @"TVMusic.Library.Artists";
    v12[3] = @"TVMusic.Library.Albums";
    v11[4] = &off_100281B50;
    v11[5] = &off_100281B68;
    v12[4] = @"TVMusic.Library.Songs";
    v12[5] = @"TVMusic.Library.MadeForYou";
    v11[6] = &off_100281B80;
    v11[7] = &off_100281B98;
    v12[6] = @"TVMusic.Library.TV&Movies";
    v12[7] = @"TVMusic.Library.MusicVideos";
    v11[8] = &off_100281BB0;
    v11[9] = &off_100281BC8;
    v12[8] = @"TVMusic.Library.Composers";
    v12[9] = @"TVMusic.Library.Compilations";
    id v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  10LL));
    uint64_t v7 = self->_mapMenuItemToAXID;
    self->_mapMenuItemToAXID = v6;

    mapMenuItemToAXID = self->_mapMenuItemToAXID;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](mapMenuItemToAXID, "objectForKeyedSubscript:", v8));

  return v9;
}

- (id)_accessibilityIdentifierForIndexPath:(id)a3
{
  id v4 = a3;
  if ([v4 section] == (id)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicLibraryTopMenuViewController _accessibilityIdentifierForGenreAtIndexPath:]( self,  "_accessibilityIdentifierForGenreAtIndexPath:",  v4));
  }

  else
  {
    id v6 = [v4 row];

    v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicLibraryTopMenuViewController _accessibilityIdentifierForMenuItem:]( self,  "_accessibilityIdentifierForMenuItem:",  -[TVMusicLibraryTopMenuViewController _menuItemForRowIndex:](self, "_menuItemForRowIndex:", v6)));
  }

  return v5;
}

- (id)_viewControllerForBrowseSectionRowAtIndex:(int64_t)a3
{
  id v4 = 0LL;
  switch(-[TVMusicLibraryTopMenuViewController _menuItemForRowIndex:](self, "_menuItemForRowIndex:", a3))
  {
    case 0uLL:
      +[TVMusicPlaybackHelper shuffleAllLibrarySongs](&OBJC_CLASS___TVMusicPlaybackHelper, "shuffleAllLibrarySongs");
      id v4 = 0LL;
      return v4;
    case 2uLL:
      id v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicLibraryViewController recentlyAddedViewController]( &OBJC_CLASS___TVMusicLibraryViewController,  "recentlyAddedViewController"));
      v5 = self;
      uint64_t v6 = 2LL;
      goto LABEL_13;
    case 3uLL:
      id v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicLibraryViewController artistsViewController]( &OBJC_CLASS___TVMusicLibraryViewController,  "artistsViewController"));
      v5 = self;
      uint64_t v6 = 4LL;
      goto LABEL_13;
    case 4uLL:
      id v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicLibraryViewController albumsViewControllerForAllAlbums]( &OBJC_CLASS___TVMusicLibraryViewController,  "albumsViewControllerForAllAlbums"));
      v5 = self;
      uint64_t v6 = 5LL;
      goto LABEL_13;
    case 5uLL:
      id v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicLibraryViewController songsViewControllerForAllSongs]( &OBJC_CLASS___TVMusicLibraryViewController,  "songsViewControllerForAllSongs"));
      v5 = self;
      uint64_t v6 = 6LL;
      goto LABEL_13;
    case 6uLL:
      id v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicLibraryViewController musicVideosViewController]( &OBJC_CLASS___TVMusicLibraryViewController,  "musicVideosViewController"));
      v5 = self;
      uint64_t v6 = 10LL;
      goto LABEL_13;
    case 8uLL:
      id v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicLibraryViewController composersViewController]( &OBJC_CLASS___TVMusicLibraryViewController,  "composersViewController"));
      v5 = self;
      uint64_t v6 = 8LL;
      goto LABEL_13;
    case 9uLL:
      id v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicLibraryViewController compilationsViewController]( &OBJC_CLASS___TVMusicLibraryViewController,  "compilationsViewController"));
      v5 = self;
      uint64_t v6 = 9LL;
      goto LABEL_13;
    case 0xBuLL:
      id v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicLibraryViewController playlistsViewController]( &OBJC_CLASS___TVMusicLibraryViewController,  "playlistsViewController"));
      v5 = self;
      uint64_t v6 = 3LL;
      goto LABEL_13;
    case 0xCuLL:
      id v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicLibraryViewController TVShowsViewController]( &OBJC_CLASS___TVMusicLibraryViewController,  "TVShowsViewController"));
      v5 = self;
      uint64_t v6 = 11LL;
      goto LABEL_13;
    case 0xDuLL:
      id v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicLibraryViewController madeForYouViewController]( &OBJC_CLASS___TVMusicLibraryViewController,  "madeForYouViewController"));
      v5 = self;
      uint64_t v6 = 12LL;
LABEL_13:
      -[TVMusicLibraryTopMenuViewController setViewControllerUIContext:](v5, "setViewControllerUIContext:", v6);
      break;
    default:
      return v4;
  }

  return v4;
}

- (id)_noResultsViewWithTitle:(id)a3 subtitle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryTopMenuViewController view](self, "view"));
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = v14 + -640.0;
  objc_super v18 = -[UIView initWithFrame:](objc_alloc(&OBJC_CLASS___UIView), "initWithFrame:", v10, v12, v17, v16);
  unsigned int v19 = -[UILabel initWithFrame:](objc_alloc(&OBJC_CLASS___UILabel), "initWithFrame:", 0.0, 480.0, v17, 100.0);
  -[UILabel setNumberOfLines:](v19, "setNumberOfLines:", 0LL);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager title2Font](&OBJC_CLASS___TVThemeManager, "title2Font"));
  -[UILabel setFont:](v19, "setFont:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager textOpacityBColor](&OBJC_CLASS___TVThemeManager, "textOpacityBColor"));
  -[UILabel setTextColor:](v19, "setTextColor:", v21);

  -[UILabel setText:](v19, "setText:", v7);
  -[UILabel sizeToFit](v19, "sizeToFit");
  -[UILabel frame](v19, "frame");
  CGFloat v26 = UIRectCenteredXInRect(v22, v23, v24, v25, v10, v12, v17, v16);
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  CGFloat v32 = v31;
  -[UILabel setFrame:](v19, "setFrame:");
  -[UIView addSubview:](v18, "addSubview:", v19);
  v45.origin.x = v26;
  v45.origin.y = v28;
  v45.size.width = v30;
  v45.size.height = v32;
  v33 = -[UILabel initWithFrame:]( objc_alloc(&OBJC_CLASS___UILabel),  "initWithFrame:",  0.0,  CGRectGetMaxY(v45) + 22.0,  v17 + -80.0,  400.0);
  -[UILabel setNumberOfLines:](v33, "setNumberOfLines:", 0LL);
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager subtitle3Font](&OBJC_CLASS___TVThemeManager, "subtitle3Font"));
  -[UILabel setFont:](v33, "setFont:", v34);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryTopMenuViewController view](self, "view"));
  v36 = (void *)objc_claimAutoreleasedReturnValue([v35 traitCollection]);
  if ([v36 userInterfaceStyle] == (id)2)
  {
    double v37 = 1.0;
    double v38 = 0.5;
  }

  else
  {
    double v38 = 0.4;
    double v37 = 0.0;
  }

  v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", v37, v38));

  -[UILabel setTextColor:](v33, "setTextColor:", v39);
  -[UILabel setText:](v33, "setText:", v6);

  -[UILabel sizeToFit](v33, "sizeToFit");
  -[UILabel frame](v33, "frame");
  -[UILabel setFrame:](v33, "setFrame:", UIRectCenteredXInRect(v40, v41, v42, v43, v10, v12, v17, v16));
  -[UIView addSubview:](v18, "addSubview:", v33);

  return v18;
}

- (unint64_t)_menuItemForRowIndex:(int64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryTopMenuViewController menuItems](self, "menuItems"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:a3]);
  id v6 = [v5 unsignedIntegerValue];

  return (unint64_t)v6;
}

- (void)_getGenres
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory genresLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "genresLibraryRequest"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000BB130;
  v4[3] = &unk_10026B938;
  v4[4] = self;
  [v3 performWithResponseHandler:v4];
}

- (id)_genreForIndexPath:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryTopMenuViewController genresResponse](self, "genresResponse"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 results]);
  id v7 = [v4 item];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 indexPathForGlobalIndex:v7]);
  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryTopMenuViewController genresResponse](self, "genresResponse"));
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 results]);
  double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 itemAtIndexPath:v8]);

  return v11;
}

- (UIView)genresHeaderView
{
  genresHeaderView = self->_genresHeaderView;
  if (!genresHeaderView)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___UILabel);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:@"LibraryMenuGenre" value:&stru_100279068 table:0]);
    -[UILabel setText:](v4, "setText:", v6);

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager calloutFont](&OBJC_CLASS___TVThemeManager, "calloutFont"));
    -[UILabel setFont:](v4, "setFont:", v7);

    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager textOpacityCColor](&OBJC_CLASS___TVThemeManager, "textOpacityCColor"));
    -[UILabel setTextColor:](v4, "setTextColor:", v8);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
    -[UILabel sizeToFit](v4, "sizeToFit");
    -[UILabel frame](v4, "frame");
    double v10 = -[UIView initWithSize:](objc_alloc(&OBJC_CLASS___UIView), "initWithSize:", 436.0, v9 + 10.0);
    -[UIView addSubview:](v10, "addSubview:", v4);
    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v4, "leadingAnchor"));
    double v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v10, "leadingAnchor"));
    double v13 = (void *)objc_claimAutoreleasedReturnValue([v11 constraintEqualToAnchor:v12 constant:20.0]);
    [v13 setActive:1];

    double v14 = self->_genresHeaderView;
    self->_genresHeaderView = v10;

    genresHeaderView = self->_genresHeaderView;
  }

  return genresHeaderView;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryTopMenuViewController genresResponse](self, "genresResponse", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 results]);
  else {
    int64_t v5 = 2LL;
  }

  return v5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryTopMenuViewController genresResponse](self, "genresResponse"));
    double v9 = (void *)objc_claimAutoreleasedReturnValue([v7 results]);
    id v8 = [v9 totalItemCount];
  }

  else
  {
    if (a4)
    {
      id v8 = 0LL;
      goto LABEL_7;
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryTopMenuViewController menuItems](self, "menuItems"));
    id v8 = [v7 count];
  }

LABEL_7:
  return (int64_t)v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( [a3 dequeueReusableCellWithIdentifier:@"TVMusicTableViewCellIdentifier" forIndexPath:v6]);
  [v7 setSelectionStyle:0];
  [v7 setSelectedBackgroundColor:self->_selectedCellBackgroundColor];
  if (![v6 section])
  {
    unint64_t v13 = -[TVMusicLibraryTopMenuViewController _menuItemForRowIndex:]( self,  "_menuItemForRowIndex:",  [v6 row]);
    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryTopMenuViewController _nameForMenuItem:](self, "_nameForMenuItem:", v13));
    double v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    double v15 = (void *)objc_claimAutoreleasedReturnValue([v14 localizedStringForKey:v9 value:&stru_100279068 table:0]);
    double v16 = (void *)objc_claimAutoreleasedReturnValue([v7 textLabel]);
    [v16 setText:v15];

    uint64_t v12 = objc_claimAutoreleasedReturnValue( -[TVMusicLibraryTopMenuViewController _accessibilityIdentifierForMenuItem:]( self,  "_accessibilityIdentifierForMenuItem:",  v13));
    goto LABEL_6;
  }

  if ([v6 section] == (id)1)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryTopMenuViewController genresResponse](self, "genresResponse"));

    if (v8)
    {
      double v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryTopMenuViewController _genreForIndexPath:](self, "_genreForIndexPath:", v6));
      double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);
      double v11 = (void *)objc_claimAutoreleasedReturnValue([v7 textLabel]);
      [v11 setText:v10];

      uint64_t v12 = objc_claimAutoreleasedReturnValue( -[TVMusicLibraryTopMenuViewController _accessibilityIdentifierForGenreAtIndexPath:]( self,  "_accessibilityIdentifierForGenreAtIndexPath:",  v6));
LABEL_6:
      double v17 = (void *)v12;
      [v7 setAccessibilityIdentifier:v12];
    }
  }

  objc_super v18 = (void *)objc_claimAutoreleasedReturnValue([v7 textLabel]);
  [v18 setAdjustsFontSizeToFitWidth:1];

  unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v7 textLabel]);
  [v19 setMinimumScaleFactor:0.9];

  return v7;
}

- (id)_accessibilityIdentifierForGenreAtIndexPath:(id)a3
{
  id v4 = a3;
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryTopMenuViewController genresResponse](self, "genresResponse"));

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryTopMenuViewController _genreForIndexPath:](self, "_genreForIndexPath:", v4));
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 name]);
    if (v7
      && (id v8 = (void *)v7,
          double v9 = (void *)objc_claimAutoreleasedReturnValue([v6 name]),
          id v10 = [v9 length],
          v9,
          v8,
          v10))
    {
      double v11 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
      uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue([@"TVMusic.Library.Genre" stringByAppendingFormat:@".%@", v11]);
    }

    else
    {
      uint64_t v12 = @"TVMusic.Library.Genre";
    }
  }

  else
  {
    uint64_t v12 = @"TVMusic.Library.Genre";
  }

  return v12;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  if (a4 == 1) {
    return (id)objc_claimAutoreleasedReturnValue( -[TVMusicLibraryTopMenuViewController genresHeaderView]( self,  "genresHeaderView",  a3,  v4,  v5));
  }
  else {
    return 0LL;
  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 66.0;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double v4 = 0.0;
  if (a4 == 1)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryTopMenuViewController genresHeaderView](self, "genresHeaderView", a3));
    [v5 frame];
    double v4 = v6;
  }

  return v4;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  double v4 = 0.0;
  if (!a4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryTopMenuViewController genresResponse](self, "genresResponse", a3));
    if (v5) {
      double v4 = 18.0;
    }
    else {
      double v4 = 0.0;
    }
  }

  return v4;
}

- (id)_previewViewControllerForIndexPath:(id)a3
{
  id v4 = a3;
  if ([v4 section])
  {
    if ([v4 section] == (id)1)
    {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryTopMenuViewController _genreForIndexPath:](self, "_genreForIndexPath:", v4));
      double v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicLibraryViewController albumsViewControllerForGenre:]( &OBJC_CLASS___TVMusicLibraryViewController,  "albumsViewControllerForGenre:",  v5));
      -[TVMusicLibraryTopMenuViewController setViewControllerUIContext:](self, "setViewControllerUIContext:", 7LL);

      goto LABEL_7;
    }

- (void)_modelResponseDidInvalidate:(id)a3
{
}

- (NSArray)menuItems
{
  return self->_menuItems;
}

- (NSString)identifierForCurrentlySelectedItem
{
  return self->_identifierForCurrentlySelectedItem;
}

- (void)setIdentifierForCurrentlySelectedItem:(id)a3
{
}

- (MPModelLibraryResponse)genresResponse
{
  return self->_genresResponse;
}

- (void)setGenresResponse:(id)a3
{
}

- (void)setGenresHeaderView:(id)a3
{
}

- (BOOL)needsReload
{
  return self->_needsReload;
}

- (void)setNeedsReload:(BOOL)a3
{
  self->_needsReload = a3;
}

- (NSIndexPath)lastSelectedIndexPath
{
  return self->_lastSelectedIndexPath;
}

- (void)setLastSelectedIndexPath:(id)a3
{
}

- (unint64_t)viewControllerUIContext
{
  return self->_viewControllerUIContext;
}

- (void)setViewControllerUIContext:(unint64_t)a3
{
  self->_viewControllerUIContext = a3;
}

- (void).cxx_destruct
{
}

@end