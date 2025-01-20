@interface MTTVStationEpisodeListViewController
+ (Class)episodeCellClass;
- (BOOL)_hasEmptySection;
- (BOOL)_isIndexPathForSettings:(id)a3;
- (BOOL)hasItems;
- (BOOL)tableView:(id)a3 canFocusRowAtIndexPath:(id)a4;
- (MTAllPropertyChangesQueryObserver)playlistPropertiesObserver;
- (MTPlaylist)playlist;
- (MTTVStationEpisodeListViewController)initWithPlaylist:(id)a3;
- (UIBarButtonItem)settingsButtonItem;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)deleteEpisodeAction;
- (id)indexPathForPreferredFocusedViewInTableView:(id)a3;
- (id)newCellInstanceWithReuseIdentifier:(id)a3;
- (id)objectAtIndexPath:(id)a3;
- (id)reuseIdentifierForRow:(id)a3;
- (id)rightButtonItems;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_setupPlaylistPropertyObserver;
- (void)_showSettings;
- (void)configureCell:(id)a3 withObject:(id)a4 atIndexPath:(id)a5;
- (void)dealloc;
- (void)playEpisodeAtIndexPath:(id)a3;
- (void)selectedItemAtIndexPath:(id)a3;
- (void)setPlaylist:(id)a3;
- (void)setPlaylistPropertiesObserver:(id)a3;
- (void)setSettingsButtonItem:(id)a3;
- (void)settingsTapped:(id)a3;
- (void)viewDidLoad;
@end

@implementation MTTVStationEpisodeListViewController

+ (Class)episodeCellClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___MTTVEpisodeCell, a2);
}

- (MTTVStationEpisodeListViewController)initWithPlaylist:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MTTVStationEpisodeListViewController;
  v6 = -[MTTVEpisodeListViewController initWithCompositeFetchedResultsController:]( &v9,  "initWithCompositeFetchedResultsController:",  0LL);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_playlist, a3);
    -[MTTVStationEpisodeListViewController _setupPlaylistPropertyObserver](v7, "_setupPlaylistPropertyObserver");
  }

  return v7;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTTVStationEpisodeListViewController;
  -[MTTVEpisodeListViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationEpisodeListViewController deleteEpisodeAction](self, "deleteEpisodeAction"));
  v7 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController actionController](self, "actionController"));
  [v5 setAuxilaryActions:v4];
}

- (id)deleteEpisodeAction
{
  v3 = objc_alloc(&OBJC_CLASS___IMAction);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:@"DELETE_SINGULAR" value:&stru_100248948 table:0]);
  objc_super v6 = -[IMAction initWithTitle:icon:](v3, "initWithTitle:icon:", v5, 0LL);

  -[IMAction setConditionBlock:](v6, "setConditionBlock:", &stru_1002403F0);
  objc_initWeak(&location, self);
  v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472LL;
  v10 = sub_10000F2F8;
  v11 = &unk_100240418;
  objc_copyWeak(&v12, &location);
  -[IMAction setActionBlock:](v6, "setActionBlock:", &v8);
  -[IMAction setDestructive:](v6, "setDestructive:", 1LL, v8, v9, v10, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v6;
}

- (id)rightButtonItems
{
  return 0LL;
}

- (void)settingsTapped:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  @"Settings",  @"Needs to be implemented",  1LL));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  @"OK",  1LL,  0LL));
  [v4 addAction:v3];
}

- (void)playEpisodeAtIndexPath:(id)a3
{
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[MTTVStationEpisodeListViewController objectAtIndexPath:](self, "objectAtIndexPath:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationEpisodeListViewController playlist](self, "playlist"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v9 uuid]);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[MTPlaybackQueueFactory playStationUuid:episodeUuid:]( &OBJC_CLASS___MTPlaybackQueueFactory,  "playStationUuid:episodeUuid:",  v5,  v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](&OBJC_CLASS___MTPlayerController, "defaultInstance"));
  [v8 playManifest:v7 reason:3];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 3LL;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 2)
  {
    int64_t v9 = 1LL;
  }

  else if (a4 == 1)
  {
    int64_t v9 = -[MTTVStationEpisodeListViewController _hasEmptySection](self, "_hasEmptySection");
  }

  else if (a4)
  {
    int64_t v9 = 0LL;
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationEpisodeListViewController playlist](self, "playlist"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 episodes]);
    int64_t v9 = (int64_t)[v8 count];
  }

  return v9;
}

- (BOOL)tableView:(id)a3 canFocusRowAtIndexPath:(id)a4
{
  return objc_msgSend(a4, "section", a3) != (id)1;
}

- (id)indexPathForPreferredFocusedViewInTableView:(id)a3
{
  if (-[MTTVStationEpisodeListViewController _hasEmptySection](self, "_hasEmptySection", a3))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  0LL,  2LL));
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController lastFocusedIndexPath](self, "lastFocusedIndexPath"));

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationEpisodeListViewController tableView](self, "tableView"));
    v7 = v6;
    if (v5)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController lastFocusedIndexPath](self, "lastFocusedIndexPath"));
      id v4 = (void *)objc_claimAutoreleasedReturnValue([v7 indexPathForClosestFocusableRowToIndexPath:v8]);
    }

    else
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue([v6 indexPathForFirstFocusableRow]);
    }
  }

  return v4;
}

- (id)objectAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4
    && ![v4 section]
    && (v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationEpisodeListViewController playlist](self, "playlist")),
        int64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 episodes]),
        id v10 = [v9 count],
        v9,
        v8,
        v10))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationEpisodeListViewController playlist](self, "playlist"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 episodes]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v5, "row")));
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (id)reuseIdentifierForRow:(id)a3
{
  id v4 = a3;
  if ([v4 section])
  {
    if ([v4 section] == (id)1)
    {
      id v5 = &OBJC_CLASS___MTTVNoContentTableViewCell;
    }

    else
    {
      if ([v4 section] != (id)2)
      {
        v8 = 0LL;
        goto LABEL_9;
      }

      id v5 = &OBJC_CLASS___MTTVSettingsTableViewCell;
    }

    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[__objc2_class reuseIdentifier](v5, "reuseIdentifier"));
  }

  else
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___MTTVStationEpisodeListViewController;
    id v6 = -[MTTVEpisodeListViewController reuseIdentifierForRow:](&v10, "reuseIdentifierForRow:", v4);
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
  }

  v8 = (void *)v7;
LABEL_9:

  return v8;
}

- (id)newCellInstanceWithReuseIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[MTTVSettingsTableViewCell reuseIdentifier]( &OBJC_CLASS___MTTVSettingsTableViewCell,  "reuseIdentifier"));
  unsigned int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    uint64_t v7 = objc_alloc_init(&OBJC_CLASS___MTTVSettingsTableViewCell);
LABEL_6:
    v13 = (MTTVNoContentTableViewCell *)v7;
    goto LABEL_7;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[MTTVNoContentTableViewCell reuseIdentifier]( &OBJC_CLASS___MTTVNoContentTableViewCell,  "reuseIdentifier"));
  unsigned int v9 = [v4 isEqualToString:v8];

  if (!v9)
  {
    v15.receiver = self;
    v15.super_class = (Class)&OBJC_CLASS___MTTVStationEpisodeListViewController;
    uint64_t v7 = -[MTTVEpisodeListViewController newCellInstanceWithReuseIdentifier:]( &v15,  "newCellInstanceWithReuseIdentifier:",  v4);
    goto LABEL_6;
  }

  objc_super v10 = objc_alloc(&OBJC_CLASS___MTTVNoContentTableViewCell);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( [v11 localizedStringForKey:@"NO_STATION_EPISODES_TITLE" value:&stru_100248948 table:0]);
  v13 = -[MTTVNoContentTableViewCell initWithMessage:](v10, "initWithMessage:", v12);

LABEL_7:
  return v13;
}

- (void)configureCell:(id)a3 withObject:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 section])
  {
    if ([v10 section] == (id)2)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v13 = (void *)objc_claimAutoreleasedReturnValue( [v12 localizedStringForKey:@"Station Settings" value:&stru_100248948 table:0]);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v8 textLabel]);
      [v14 setText:v13];
    }
  }

  else
  {
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___MTTVEpisodeCell, v11);
    if ((objc_opt_isKindOfClass(v8, v15) & 1) != 0) {
      [v8 setShowsArtwork:1];
    }
    v16.receiver = self;
    v16.super_class = (Class)&OBJC_CLASS___MTTVStationEpisodeListViewController;
    -[MTTVEpisodeListViewController configureCell:withObject:atIndexPath:]( &v16,  "configureCell:withObject:atIndexPath:",  v8,  v9,  v10);
  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[MTTVStationEpisodeListViewController _isIndexPathForSettings:](self, "_isIndexPathForSettings:", v7))
  {
    +[MTTVSettingsTableViewCell height](&OBJC_CLASS___MTTVSettingsTableViewCell, "height");
  }

  else
  {
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___MTTVStationEpisodeListViewController;
    -[MTTVEpisodeListViewController tableView:heightForRowAtIndexPath:]( &v11,  "tableView:heightForRowAtIndexPath:",  v6,  v7);
  }

  double v9 = v8;

  return v9;
}

- (void)selectedItemAtIndexPath:(id)a3
{
  id v4 = a3;
  if ([v4 section])
  {
    unsigned int v5 = -[MTTVStationEpisodeListViewController _isIndexPathForSettings:](self, "_isIndexPathForSettings:", v4);

    if (v5) {
      -[MTTVStationEpisodeListViewController _showSettings](self, "_showSettings");
    }
  }

  else
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___MTTVStationEpisodeListViewController;
    -[MTTVEpisodeListViewController selectedItemAtIndexPath:](&v6, "selectedItemAtIndexPath:", v4);
  }

- (BOOL)hasItems
{
  return 1;
}

- (BOOL)_isIndexPathForSettings:(id)a3
{
  return [a3 section] == (id)2;
}

- (void)_showSettings
{
  v3 = objc_alloc(&OBJC_CLASS___MTTVStationSettingsViewController);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationEpisodeListViewController playlist](self, "playlist"));
  id v7 = -[MTTVStationSettingsViewController initWithStation:](v3, "initWithStation:", v4);

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTApplication_ATV appController](&OBJC_CLASS___MTApplication_ATV, "appController"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 rootNavController]);

  [v6 pushViewController:v7 animated:1];
}

- (void)_setupPlaylistPropertyObserver
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[MTPlaylist topLevelPlaylistsExcludingFoldersPredicate]( &OBJC_CLASS___MTPlaylist,  "topLevelPlaylistsExcludingFoldersPredicate"));
  id v4 = objc_alloc(&OBJC_CLASS___MTAllPropertyChangesQueryObserver);
  unsigned int v5 = -[MTAllPropertyChangesQueryObserver initWithEntityName:predicate:]( v4,  "initWithEntityName:predicate:",  kMTPlaylistEntityName,  v3);
  -[MTTVStationEpisodeListViewController setPlaylistPropertiesObserver:](self, "setPlaylistPropertiesObserver:", v5);

  objc_initWeak(&location, self);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationEpisodeListViewController playlistPropertiesObserver](self, "playlistPropertiesObserver"));
  double v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  objc_super v11 = sub_10000FD10;
  id v12 = &unk_100240440;
  objc_copyWeak(&v13, &location);
  id v7 = [v6 addResultsChangedHandler:&v9];

  double v8 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVStationEpisodeListViewController playlistPropertiesObserver]( self,  "playlistPropertiesObserver",  v9,  v10,  v11,  v12));
  [v8 startObserving];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (BOOL)_hasEmptySection
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationEpisodeListViewController playlist](self, "playlist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 episodes]);
  BOOL v4 = [v3 count] == 0;

  return v4;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationEpisodeListViewController playlistPropertiesObserver](self, "playlistPropertiesObserver"));
  [v3 stop];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTTVStationEpisodeListViewController;
  -[MTTVEpisodeListViewController dealloc](&v4, "dealloc");
}

- (MTPlaylist)playlist
{
  return self->_playlist;
}

- (void)setPlaylist:(id)a3
{
}

- (UIBarButtonItem)settingsButtonItem
{
  return self->_settingsButtonItem;
}

- (void)setSettingsButtonItem:(id)a3
{
}

- (MTAllPropertyChangesQueryObserver)playlistPropertiesObserver
{
  return self->_playlistPropertiesObserver;
}

- (void)setPlaylistPropertiesObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end