@interface MTTVMyPodcastsNoPodcastsViewController
- (MTTVMyPodcastsNoPodcastsViewController)init;
- (void)buttonPressed:(id)a3;
@end

@implementation MTTVMyPodcastsNoPodcastsViewController

- (MTTVMyPodcastsNoPodcastsViewController)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MTTVMyPodcastsNoPodcastsViewController;
  v2 = -[MTTVMyPodcastsNoPodcastsViewController init](&v10, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue( [v3 localizedStringForKey:@"MY_PODCASTS_NO_PODCASTS_TITLE" value:&stru_100248948 table:0]);
    -[MTTVContentUnavailableViewController setPrimaryText:](v2, "setPrimaryText:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:@"MY_PODCASTS_NO_PODCASTS_MESSAGE" value:&stru_100248948 table:0]);
    -[MTTVContentUnavailableViewController setSecondaryText:](v2, "setSecondaryText:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue( [v7 localizedStringForKey:@"MY_PODCASTS_NO_PODCASTS_BUTTON" value:&stru_100248948 table:0]);
    -[MTTVContentUnavailableViewController setButtonTitle:](v2, "setButtonTitle:", v8);
  }

  return v2;
}

- (void)buttonPressed:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[MTApplication sharedApplication](&OBJC_CLASS___MTApplication, "sharedApplication", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v5 delegate]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 appController]);
  [v4 selectFeaturedTab];
}

@end