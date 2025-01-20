@interface MTTVStationSettingsViewController
+ (double)rightViewControllerTopMargin;
- (MTPlaylist)station;
- (MTTVStationSettingsListViewController)stationSettingsViewController;
- (MTTVStationSettingsViewController)initWithStation:(id)a3;
- (UINavigationController)settingsNavigationController;
- (void)setSettingsNavigationController:(id)a3;
- (void)setStation:(id)a3;
- (void)setStationSettingsViewController:(id)a3;
- (void)setupChildViewControllers;
- (void)showAddPodcastsUI;
@end

@implementation MTTVStationSettingsViewController

- (MTTVStationSettingsViewController)initWithStation:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MTTVStationSettingsViewController;
  v6 = -[MTTVStationSettingsViewController init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_station, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 localizedStringForKey:@"Station Settings" value:&stru_100248948 table:0]);
    -[MTTVStationSettingsViewController setTitle:](v7, "setTitle:", v9);

    -[MTTVStationSettingsViewController setupChildViewControllers](v7, "setupChildViewControllers");
  }

  return v7;
}

- (void)showAddPodcastsUI
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVStationSettingsViewController stationSettingsViewController]( self,  "stationSettingsViewController"));
  [v3 setUserDriven:0];

  v4 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVStationSettingsViewController stationSettingsViewController]( self,  "stationSettingsViewController"));
  [v4 showAddPodcastsSheet];

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MTTVStationSettingsViewController stationSettingsViewController](self, "stationSettingsViewController"));
  [v5 setUserDriven:1];
}

+ (double)rightViewControllerTopMargin
{
  return 150.0;
}

- (void)setupChildViewControllers
{
  v3 = objc_alloc_init(&OBJC_CLASS___MTTVStationsIconViewController);
  v4 = objc_alloc(&OBJC_CLASS___MTTVStationSettingsListViewController);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationSettingsViewController station](self, "station"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 uuid]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTLibrary sharedInstance](&OBJC_CLASS___MTLibrary, "sharedInstance"));
  v8 = -[MTPlaylistSettingsViewController initWithPlaylistUuid:library:](v4, "initWithPlaylistUuid:library:", v6, v7);
  -[MTTVStationSettingsViewController setStationSettingsViewController:](self, "setStationSettingsViewController:", v8);

  v9 = objc_alloc(&OBJC_CLASS___UINavigationController);
  v10 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVStationSettingsViewController stationSettingsViewController]( self,  "stationSettingsViewController"));
  objc_super v11 = -[UINavigationController initWithRootViewController:](v9, "initWithRootViewController:", v10);
  -[MTTVStationSettingsViewController setSettingsNavigationController:](self, "setSettingsNavigationController:", v11);

  v14[0] = v3;
  v12 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVStationSettingsViewController settingsNavigationController]( self,  "settingsNavigationController"));
  v14[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 2LL));
  -[MTTVStationSettingsViewController setViewControllers:](self, "setViewControllers:", v13);
}

- (MTPlaylist)station
{
  return self->_station;
}

- (void)setStation:(id)a3
{
}

- (MTTVStationSettingsListViewController)stationSettingsViewController
{
  return self->_stationSettingsViewController;
}

- (void)setStationSettingsViewController:(id)a3
{
}

- (UINavigationController)settingsNavigationController
{
  return self->_settingsNavigationController;
}

- (void)setSettingsNavigationController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end