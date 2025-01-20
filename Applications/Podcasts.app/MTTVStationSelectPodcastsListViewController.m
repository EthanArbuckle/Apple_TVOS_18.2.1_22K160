@interface MTTVStationSelectPodcastsListViewController
- (BOOL)allPodcastsSelected;
- (BOOL)main_tableView:(id)a3 canFocusRowAtIndexPath:(id)a4;
- (BOOL)toggleUuid:(id)a3;
- (MTPlaylistSelectPodcastListViewControllerSaveDelegate)saveDelegate;
- (NSMutableSet)podcastUuids;
- (NSString)playlistName;
- (NSString)playlistUuid;
- (double)main_tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)main_tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (void)main_configureCell:(id)a3 forRowAtIndexPath:(id)a4;
- (void)main_tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)save;
- (void)setAllPodcastsSelected:(BOOL)a3;
- (void)setPlaylistName:(id)a3;
- (void)setPlaylistUuid:(id)a3;
- (void)setPodcastUuids:(id)a3;
- (void)setSaveDelegate:(id)a3;
- (void)setupFRC;
- (void)setupIncludeAllCell;
- (void)toggleAllPodcastsSelected;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation MTTVStationSelectPodcastsListViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTTVStationSelectPodcastsListViewController;
  -[MTTVStationSelectPodcastsListViewController viewDidLoad](&v5, "viewDidLoad");
  -[MTTVStationSelectPodcastsListViewController setupFRC](self, "setupFRC");
  -[MTTVStationSelectPodcastsListViewController setupIncludeAllCell](self, "setupIncludeAllCell");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationSelectPodcastsListViewController tableView](self, "tableView"));
  [v3 registerClass:objc_opt_class(MTTVSettingsPodcastTableViewCell) forCellReuseIdentifier:@"CellID"];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationSelectPodcastsListViewController tableView](self, "tableView"));
  [v4 setInsetsContentViewsToSafeArea:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTTVStationSelectPodcastsListViewController;
  -[MTTVStationSelectPodcastsListViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[MTTVStationSelectPodcastsListViewController save](self, "save");
}

- (void)viewWillLayoutSubviews
{
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___MTTVStationSelectPodcastsListViewController;
  -[MTTVStationSelectPodcastsListViewController viewWillLayoutSubviews](&v39, "viewWillLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationSelectPodcastsListViewController tableView](self, "tableView"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 superview]);
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationSelectPodcastsListViewController tableView](self, "tableView"));
  if ([v13 effectiveUserInterfaceLayoutDirection] == (id)1) {
    double v14 = 30.0;
  }
  else {
    double v14 = 0.0;
  }

  double v15 = v6 + v14;
  double v16 = v8 + 0.0;
  double v17 = v10 + -30.0;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationSelectPodcastsListViewController tableView](self, "tableView"));
  [v18 frame];
  v41.origin.x = v15;
  v41.origin.y = v16;
  v41.size.width = v17;
  v41.size.height = v12;
  BOOL v19 = CGRectEqualToRect(v40, v41);

  if (!v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationSelectPodcastsListViewController tableView](self, "tableView"));
    objc_msgSend(v20, "setFrame:", v15, v16, v17, v12);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationSelectPodcastsListViewController tableView](self, "tableView"));
  [v21 contentInset];
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationSelectPodcastsListViewController tableView](self, "tableView"));
  [v28 contentInset];
  if (v32 != v25 || v29 != v23 || v31 != v27)
  {

LABEL_12:
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationSelectPodcastsListViewController tableView](self, "tableView"));
    objc_msgSend(v34, "setContentInset:", v23, v25, 0.0, v27);

    goto LABEL_13;
  }

  double v33 = v30;

  if (v33 != 0.0) {
    goto LABEL_12;
  }
LABEL_13:
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationSelectPodcastsListViewController tableView](self, "tableView"));
  objc_msgSend(v38, "setLayoutMargins:", UIEdgeInsetsZero.top, left, bottom, right);
}

- (void)setupFRC
{
  v3 = objc_alloc(&OBJC_CLASS___NSFetchRequest);
  objc_super v4 = -[NSFetchRequest initWithEntityName:](v3, "initWithEntityName:", kMTPodcastEntityName);
  double v5 = (void *)objc_claimAutoreleasedReturnValue( +[MTPodcast predicateForNotHiddenNotImplicitlyFollowedPodcasts]( &OBJC_CLASS___MTPodcast,  "predicateForNotHiddenNotImplicitlyFollowedPodcasts"));
  -[NSFetchRequest setPredicate:](v4, "setPredicate:", v5);

  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast sortDescriptorsForAllPodcasts](&OBJC_CLASS___MTPodcast, "sortDescriptorsForAllPodcasts"));
  -[NSFetchRequest setSortDescriptors:](v4, "setSortDescriptors:", v6);

  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 mainQueueContext]);

  double v9 = -[NSFetchedResultsController initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:]( objc_alloc(&OBJC_CLASS___NSFetchedResultsController),  "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:",  v4,  v8,  0LL,  0LL);
  -[MTSpecialIndexPathTableViewController setFrc:](self, "setFrc:", v9);

  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTSpecialIndexPathTableViewController frc](self, "frc"));
  id v13 = 0LL;
  unsigned __int8 v11 = [v10 performFetch:&v13];
  id v12 = v13;

  if ((v11 & 1) == 0) {
    [v12 logAndThrow:1];
  }
}

- (void)setupIncludeAllCell
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  0LL,  0LL));
  -[MTSpecialIndexPathTableViewController setSpecialPath:](self, "setSpecialPath:", v3);

  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10003C8FC;
  v6[3] = &unk_1002416A0;
  objc_copyWeak(&v7, &location);
  -[MTSpecialIndexPathTableViewController setCellFor_specialPathBlock:](self, "setCellFor_specialPathBlock:", v6);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10003CA4C;
  v4[3] = &unk_100240290;
  objc_copyWeak(&v5, &location);
  -[MTSpecialIndexPathTableViewController setDidSelect_specialPathBlock:](self, "setDidSelect_specialPathBlock:", v4);
  -[MTSpecialIndexPathTableViewController setHeightForSpecialPath:](self, "setHeightForSpecialPath:", 66.0);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)toggleAllPodcastsSelected
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[MTTVStationSelectPodcastsListViewController tableView](self, "tableView"));
  [v3 reloadData];
}

- (BOOL)toggleUuid:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationSelectPodcastsListViewController podcastUuids](self, "podcastUuids"));

  if (!v5)
  {
    double v6 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    -[MTTVStationSelectPodcastsListViewController setPodcastUuids:](self, "setPodcastUuids:", v6);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationSelectPodcastsListViewController podcastUuids](self, "podcastUuids"));
  unsigned int v8 = [v7 containsObject:v4];

  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationSelectPodcastsListViewController podcastUuids](self, "podcastUuids"));
  double v10 = v9;
  if (v8) {
    [v9 removeObject:v4];
  }
  else {
    [v9 addObject:v4];
  }

  return v8 ^ 1;
}

- (void)save
{
  if (-[MTTVStationSelectPodcastsListViewController allPodcastsSelected](self, "allPodcastsSelected"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 mainQueueContext]);

    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10003CC38;
    v7[3] = &unk_100240240;
    id v8 = v4;
    double v9 = self;
    id v5 = v4;
    [v5 performBlockAndWait:v7];
  }

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MTTVStationSelectPodcastsListViewController saveDelegate](self, "saveDelegate"));
  [v6 saveNewPlaylists];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle", a3, a4));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:@"Choose Podcasts" value:&stru_100248948 table:0]);

  return v5;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 30.0;
}

- (id)main_tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationSelectPodcastsListViewController tableView](self, "tableView", a3, a4));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dequeueReusableCellWithIdentifier:@"CellID"]);

  return v5;
}

- (void)main_configureCell:(id)a3 forRowAtIndexPath:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTSpecialIndexPathTableViewController frc](self, "frc"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexPath:v6]);

  [v11 updateWithPodcast:v8];
  objc_msgSend( v11,  "setDim:",  -[MTTVStationSelectPodcastsListViewController allPodcastsSelected](self, "allPodcastsSelected"));
  if (-[MTTVStationSelectPodcastsListViewController allPodcastsSelected](self, "allPodcastsSelected"))
  {
    [v11 setOn:1];
  }

  else
  {
    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationSelectPodcastsListViewController podcastUuids](self, "podcastUuids"));
    double v10 = (void *)objc_claimAutoreleasedReturnValue([v8 uuid]);
    objc_msgSend(v11, "setOn:", objc_msgSend(v9, "containsObject:", v10));
  }
}

- (double)main_tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 90.0;
}

- (BOOL)main_tableView:(id)a3 canFocusRowAtIndexPath:(id)a4
{
  return !-[MTTVStationSelectPodcastsListViewController allPodcastsSelected](self, "allPodcastsSelected", a3, a4);
}

- (void)main_tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTSpecialIndexPathTableViewController frc](self, "frc"));
  id v12 = (id)objc_claimAutoreleasedReturnValue([v6 objectAtIndexPath:v5]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v12 uuid]);
  BOOL v8 = -[MTTVStationSelectPodcastsListViewController toggleUuid:](self, "toggleUuid:", v7);

  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationSelectPodcastsListViewController tableView](self, "tableView"));
  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTSpecialIndexPathTableViewController translateIndexPath:](self, "translateIndexPath:", v5));

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 cellForRowAtIndexPath:v10]);
  [v11 setOn:v8];
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
  return (MTPlaylistSelectPodcastListViewControllerSaveDelegate *)objc_loadWeakRetained((id *)&self->_saveDelegate);
}

- (void)setSaveDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end