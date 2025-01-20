@interface MTPlaylistSelectPodcastListViewController
- (BOOL)allPodcastsSelected;
- (MTPlaylistSelectPodcastListViewControllerSaveDelegate)saveDelegate;
- (NSMutableSet)podcastUuids;
- (NSString)playlistName;
- (NSString)playlistUuid;
- (id)newCellInstanceWithReuseIdentifier:(id)a3;
- (id)reuseIdentifierForRow:(id)a3;
- (void)configureCell:(id)a3 withObject:(id)a4 atIndexPath:(id)a5;
- (void)setAllPodcastsSelected:(BOOL)a3;
- (void)setPlaylistName:(id)a3;
- (void)setPlaylistUuid:(id)a3;
- (void)setPodcastUuids:(id)a3;
- (void)setSaveDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)togglePodcastUuid:(id)a3;
- (void)updateAllPodcastsTo:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation MTPlaylistSelectPodcastListViewController

- (void)viewDidLoad
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___MTPlaylistSelectPodcastListViewController;
  -[MTBasePodcastListViewController viewDidLoad](&v18, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController tableView](self, "tableView"));
  [v3 bounds];

  +[MTTableViewCell rowHeight](&OBJC_CLASS___MTPodcastPlaylistCell, "rowHeight");
  v4 = objc_alloc(&OBJC_CLASS___MTPodcastPlaylistSheetHeaderView);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSelectPodcastListViewController view](self, "view"));
  [v5 bounds];
  double Width = CGRectGetWidth(v19);
  +[MTTableViewCell rowHeight](&OBJC_CLASS___MTPodcastPlaylistCell, "rowHeight");
  v8 = -[MTPodcastPlaylistSheetHeaderView initWithFrame:](v4, "initWithFrame:", 0.0, 0.0, Width, v7);

  -[MTPodcastPlaylistSheetHeaderView setOn:]( v8,  "setOn:",  -[MTPlaylistSelectPodcastListViewController allPodcastsSelected](self, "allPodcastsSelected"));
  objc_initWeak(&location, self);
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  v14 = sub_10009829C;
  v15 = &unk_1002430E0;
  objc_copyWeak(&v16, &location);
  -[MTPodcastPlaylistSheetHeaderView setAction:](v8, "setAction:", &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController tableView](self, "tableView", v12, v13, v14, v15));
  [v9 setTableHeaderView:v8];

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedStringForKey:@"Add Podcasts" value:&stru_100248948 table:0]);
  -[MTPlaylistSelectPodcastListViewController setTitle:](self, "setTitle:", v11);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTPlaylistSelectPodcastListViewController;
  -[MTBasePodcastListViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSelectPodcastListViewController saveDelegate](self, "saveDelegate"));
  [v4 saveNewPlaylists];
}

- (void)updateAllPodcastsTo:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mainQueueContext]);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000983F8;
  v9[3] = &unk_100241458;
  BOOL v12 = v3;
  id v10 = v6;
  v11 = self;
  id v8 = v6;
  [v8 performBlockAndWait:v9];
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTBasePodcastListViewController tableView](self, "tableView"));
  [v7 reloadData];

  -[MTPlaylistSelectPodcastListViewController setAllPodcastsSelected:](self, "setAllPodcastsSelected:", v3);
}

- (void)viewWillLayoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MTPlaylistSelectPodcastListViewController;
  -[MTPlaylistSelectPodcastListViewController viewWillLayoutSubviews](&v20, "viewWillLayoutSubviews");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSelectPodcastListViewController view](self, "view"));
  if ([v3 effectiveUserInterfaceLayoutDirection] == (id)1) {
    double v4 = 30.0;
  }
  else {
    double v4 = 90.0;
  }

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSelectPodcastListViewController view](self, "view"));
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 superview]);
  [(id)v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v4 + v8;
  double v16 = v10 + 0.0;
  double v17 = v12 + -120.0;
  objc_super v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSelectPodcastListViewController view](self, "view"));
  [v18 frame];
  v22.origin.x = v15;
  v22.origin.y = v16;
  v22.size.width = v17;
  v22.size.height = v14;
  LOBYTE(v6) = CGRectEqualToRect(v21, v22);

  if ((v6 & 1) == 0)
  {
    CGRect v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSelectPodcastListViewController view](self, "view"));
    objc_msgSend(v19, "setFrame:", v15, v16, v17, v14);
  }

- (void)togglePodcastUuid:(id)a3
{
  id v4 = a3;
  podcastUuids = self->_podcastUuids;
  id v10 = v4;
  if (!podcastUuids)
  {
    uint64_t v6 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    double v7 = self->_podcastUuids;
    self->_podcastUuids = v6;

    id v4 = v10;
    podcastUuids = self->_podcastUuids;
  }

  unsigned int v8 = -[NSMutableSet containsObject:](podcastUuids, "containsObject:", v4);
  double v9 = self->_podcastUuids;
  if (v8) {
    -[NSMutableSet removeObject:](v9, "removeObject:", v10);
  }
  else {
    -[NSMutableSet addObject:](v9, "addObject:", v10);
  }
}

- (void)configureCell:(id)a3 withObject:(id)a4 atIndexPath:(id)a5
{
  id v7 = a4;
  id v10 = a3;
  [v10 updateWithObject:v7];
  podcastUuids = self->_podcastUuids;
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v7 uuid]);

  objc_msgSend(v10, "setAdded:", -[NSMutableSet containsObject:](podcastUuids, "containsObject:", v9));
  objc_msgSend( v10,  "setEnabled:",  -[MTPlaylistSelectPodcastListViewController allPodcastsSelected](self, "allPodcastsSelected") ^ 1);
}

- (id)newCellInstanceWithReuseIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = -[MTPodcastPlaylistCell initWithStyle:reuseIdentifier:]( objc_alloc(&OBJC_CLASS___MTPodcastPlaylistCell),  "initWithStyle:reuseIdentifier:",  0LL,  v3);

  return v4;
}

- (id)reuseIdentifierForRow:(id)a3
{
  return @"MTPodcastPlaylistCell";
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTPlaylistSelectPodcastListViewController;
  id v5 = a4;
  id v6 = a3;
  -[MTBasePodcastListViewController tableView:didSelectRowAtIndexPath:]( &v8,  "tableView:didSelectRowAtIndexPath:",  v6,  v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellForRowAtIndexPath:", v5, v8.receiver, v8.super_class));
  objc_msgSend(v7, "setAdded:", objc_msgSend(v7, "isAdded") ^ 1);
  [v6 deselectRowAtIndexPath:v5 animated:1];
}

- (NSString)playlistName
{
  return self->_playlistName;
}

- (void)setPlaylistName:(id)a3
{
}

- (NSMutableSet)podcastUuids
{
  return self->_podcastUuids;
}

- (void)setPodcastUuids:(id)a3
{
}

- (BOOL)allPodcastsSelected
{
  return self->_allPodcastsSelected;
}

- (void)setAllPodcastsSelected:(BOOL)a3
{
  self->_allPodcastsSelected = a3;
}

- (NSString)playlistUuid
{
  return self->_playlistUuid;
}

- (void)setPlaylistUuid:(id)a3
{
}

- (MTPlaylistSelectPodcastListViewControllerSaveDelegate)saveDelegate
{
  return (MTPlaylistSelectPodcastListViewControllerSaveDelegate *)objc_getProperty(self, a2, 176LL, 1);
}

- (void)setSaveDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end