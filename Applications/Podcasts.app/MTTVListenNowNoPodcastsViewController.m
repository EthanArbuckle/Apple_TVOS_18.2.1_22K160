@interface MTTVListenNowNoPodcastsViewController
- (MTTVListenNowNoPodcastsViewController)init;
- (void)buttonPressed:(id)a3;
@end

@implementation MTTVListenNowNoPodcastsViewController

- (MTTVListenNowNoPodcastsViewController)init
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MTTVListenNowNoPodcastsViewController;
  v2 = -[MTTVListenNowNoPodcastsViewController init](&v17, "init");
  if (v2)
  {
    int v3 = os_feature_enabled_home_tab();
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v5 = v4;
    if (v3)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"HOME_NO_SHOWS_TITLE" value:&stru_100248948 table:0]);
      -[MTTVContentUnavailableViewController setPrimaryText:](v2, "setPrimaryText:", v6);

      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v8 = (void *)objc_claimAutoreleasedReturnValue( [v7 localizedStringForKey:@"HOME_NO_SHOWS_MESSAGE" value:&stru_100248948 table:0]);
      -[MTTVContentUnavailableViewController setSecondaryText:](v2, "setSecondaryText:", v8);

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v10 = v9;
      v11 = @"HOME_NO_SHOWS_BUTTON";
    }

    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"LISTENNOW_NO_PODCASTS_TITLE" value:&stru_100248948 table:0]);
      -[MTTVContentUnavailableViewController setPrimaryText:](v2, "setPrimaryText:", v12);

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v14 = (void *)objc_claimAutoreleasedReturnValue( [v13 localizedStringForKey:@"LISTENNOW_NO_PODCASTS_MESSAGE" value:&stru_100248948 table:0]);
      -[MTTVContentUnavailableViewController setSecondaryText:](v2, "setSecondaryText:", v14);

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v10 = v9;
      v11 = @"LISTENNOW_NO_PODCASTS_BUTTON";
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedStringForKey:v11 value:&stru_100248948 table:0]);
    -[MTTVContentUnavailableViewController setButtonTitle:](v2, "setButtonTitle:", v15);
  }

  return v2;
}

- (void)buttonPressed:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[MTApplication sharedApplication](&OBJC_CLASS___MTApplication, "sharedApplication", a3));
  int v3 = (void *)objc_claimAutoreleasedReturnValue([v5 delegate]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 appController]);
  [v4 selectFeaturedTab];
}

@end