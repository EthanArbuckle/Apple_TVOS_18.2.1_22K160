@interface MTTVListenNowNoEpisodesViewController
- (MTTVListenNowNoEpisodesViewController)init;
@end

@implementation MTTVListenNowNoEpisodesViewController

- (MTTVListenNowNoEpisodesViewController)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MTTVListenNowNoEpisodesViewController;
  v2 = -[MTTVListenNowNoEpisodesViewController init](&v13, "init");
  if (v2)
  {
    int v3 = os_feature_enabled_home_tab();
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v5 = v4;
    if (v3)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"HOME_NO_UNPLAYED_EPISODES_TITLE" value:&stru_100248948 table:0]);
      -[MTTVContentUnavailableViewController setPrimaryText:](v2, "setPrimaryText:", v6);

      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v8 = v7;
      v9 = @"HOME_NO_UNPLAYED_EPISODES_MESSAGE";
    }

    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedStringForKey:@"LISTENNOW_NO_UNPLAYED_EPISODES_TITLE" value:&stru_100248948 table:0]);
      -[MTTVContentUnavailableViewController setPrimaryText:](v2, "setPrimaryText:", v10);

      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v8 = v7;
      v9 = @"LISTENNOW_NO_UNPLAYED_EPISODES_MESSAGE";
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedStringForKey:v9 value:&stru_100248948 table:0]);
    -[MTTVContentUnavailableViewController setSecondaryText:](v2, "setSecondaryText:", v11);
  }

  return v2;
}

@end