@interface MTTVPodcastActionController
- (MTTVPodcastActionController)initWithDelegate:(id)a3;
- (id)allActions;
@end

@implementation MTTVPodcastActionController

- (id)allActions
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMAction podcastPlayAction](&OBJC_CLASS___IMAction, "podcastPlayAction"));
  v8[0] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMAction podcastRefreshAction](&OBJC_CLASS___IMAction, "podcastRefreshAction"));
  v8[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMAction podcastSettingsAction](&OBJC_CLASS___IMAction, "podcastSettingsAction"));
  v8[2] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[IMAction podcastDeleteAction](&OBJC_CLASS___IMAction, "podcastDeleteAction"));
  v8[3] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 4LL));

  return v6;
}

- (MTTVPodcastActionController)initWithDelegate:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTTVPodcastActionController;
  return -[IMActionController initWithDelegate:](&v4, "initWithDelegate:", a3);
}

@end