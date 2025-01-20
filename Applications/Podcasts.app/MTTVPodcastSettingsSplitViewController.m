@interface MTTVPodcastSettingsSplitViewController
+ (double)rightViewControllerTopMargin;
- (MTPodcast)podcast;
- (MTShowSettingsViewControllerDelegate)settingsDelegate;
- (MTTVPodcastInfoViewController)podcastInfoViewController;
- (MTTVPodcastSettingsListViewController)podcastSettingsViewController;
- (MTTVPodcastSettingsSplitViewController)initWithCoder:(id)a3;
- (MTTVPodcastSettingsSplitViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (MTTVPodcastSettingsSplitViewController)initWithPodcast:(id)a3;
- (MTTVPodcastSettingsSplitViewController)initWithPodcast:(id)a3 delegate:(id)a4;
- (UINavigationController)settingsNavigationController;
- (void)_updateTitle;
- (void)setPodcast:(id)a3;
- (void)setPodcastInfoViewController:(id)a3;
- (void)setPodcastSettingsViewController:(id)a3;
- (void)setSettingsDelegate:(id)a3;
- (void)setSettingsNavigationController:(id)a3;
- (void)viewDidLoad;
@end

@implementation MTTVPodcastSettingsSplitViewController

- (MTTVPodcastSettingsSplitViewController)initWithCoder:(id)a3
{
  return -[MTTVPodcastSettingsSplitViewController initWithPodcast:](self, "initWithPodcast:", 0LL);
}

- (MTTVPodcastSettingsSplitViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[MTTVPodcastSettingsSplitViewController initWithPodcast:](self, "initWithPodcast:", 0LL, a4);
}

- (MTTVPodcastSettingsSplitViewController)initWithPodcast:(id)a3
{
  return -[MTTVPodcastSettingsSplitViewController initWithPodcast:delegate:](self, "initWithPodcast:delegate:", a3, 0LL);
}

- (MTTVPodcastSettingsSplitViewController)initWithPodcast:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MTTVPodcastSettingsSplitViewController;
  v9 = -[MTTVPodcastSettingsSplitViewController initWithNibName:bundle:](&v12, "initWithNibName:bundle:", 0LL, 0LL);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_podcast, a3);
    objc_storeWeak((id *)&v10->_settingsDelegate, v8);
    -[MTTVPodcastSettingsSplitViewController _updateTitle](v10, "_updateTitle");
  }

  return v10;
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MTTVPodcastSettingsSplitViewController;
  -[MTTVSettingsSplitViewController viewDidLoad](&v17, "viewDidLoad");
  v3 = objc_alloc(&OBJC_CLASS___MTTVPodcastInfoViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastSettingsSplitViewController podcast](self, "podcast"));
  v5 = -[MTTVPodcastInfoViewController initWithPodcast:](v3, "initWithPodcast:", v4);
  -[MTTVPodcastSettingsSplitViewController setPodcastInfoViewController:](self, "setPodcastInfoViewController:", v5);

  v6 = objc_alloc(&OBJC_CLASS___MTTVPodcastSettingsListViewController);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastSettingsSplitViewController podcast](self, "podcast"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 uuid]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastSettingsSplitViewController settingsDelegate](self, "settingsDelegate"));
  v10 = -[MTShowSettingsViewController initWithPodcastUuid:delegate:](v6, "initWithPodcastUuid:delegate:", v8, v9);
  -[MTTVPodcastSettingsSplitViewController setPodcastSettingsViewController:]( self,  "setPodcastSettingsViewController:",  v10);

  v11 = objc_alloc(&OBJC_CLASS___UINavigationController);
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVPodcastSettingsSplitViewController podcastSettingsViewController]( self,  "podcastSettingsViewController"));
  v13 = -[UINavigationController initWithRootViewController:](v11, "initWithRootViewController:", v12);
  -[MTTVPodcastSettingsSplitViewController setSettingsNavigationController:]( self,  "setSettingsNavigationController:",  v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastSettingsSplitViewController podcastInfoViewController](self, "podcastInfoViewController"));
  v18[0] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVPodcastSettingsSplitViewController settingsNavigationController]( self,  "settingsNavigationController"));
  v18[1] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 2LL));
  -[MTTVPodcastSettingsSplitViewController setViewControllers:](self, "setViewControllers:", v16);
}

- (void)setSettingsDelegate:(id)a3
{
  if (-[MTTVPodcastSettingsSplitViewController isViewLoaded](self, "isViewLoaded"))
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[MTTVPodcastSettingsSplitViewController settingsDelegate](self, "settingsDelegate"));
    v4 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVPodcastSettingsSplitViewController podcastSettingsViewController]( self,  "podcastSettingsViewController"));
    [v4 setDelegate:v5];
  }

+ (double)rightViewControllerTopMargin
{
  return 95.0;
}

- (void)_updateTitle
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastSettingsSplitViewController podcast](self, "podcast"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 title]);
  if ([v4 length])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:@"%@ Settings" value:&stru_100248948 table:0]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastSettingsSplitViewController podcast](self, "podcast"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 title]);
    id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v6, v8));
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v9 = (id)objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:@"Settings" value:&stru_100248948 table:0]);
  }

  -[MTTVPodcastSettingsSplitViewController setTitle:](self, "setTitle:", v9);
}

- (MTPodcast)podcast
{
  return self->_podcast;
}

- (void)setPodcast:(id)a3
{
}

- (MTShowSettingsViewControllerDelegate)settingsDelegate
{
  return (MTShowSettingsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_settingsDelegate);
}

- (MTTVPodcastInfoViewController)podcastInfoViewController
{
  return self->_podcastInfoViewController;
}

- (void)setPodcastInfoViewController:(id)a3
{
}

- (MTTVPodcastSettingsListViewController)podcastSettingsViewController
{
  return self->_podcastSettingsViewController;
}

- (void)setPodcastSettingsViewController:(id)a3
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