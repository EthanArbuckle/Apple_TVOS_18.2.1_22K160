@interface TVHNowPlayingTabBarItemViewController
- (BOOL)_tvTabBarShouldAutohide;
- (NSSet)mediaCategoryTypes;
- (unint64_t)selectedMediaCategoryType;
- (unint64_t)type;
- (void)viewDidLoad;
@end

@implementation TVHNowPlayingTabBarItemViewController

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVHNowPlayingTabBarItemViewController;
  -[TVHNowPlayingTabBarItemViewController viewDidLoad](&v9, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHNowPlayingTabBarItemViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHNowPlayingTabBarItemViewController tvh_playbackManager](self, "tvh_playbackManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 interactivePlaylistPlayer]);

  v6 = -[TVHInteractivePlaylistPlaybackViewController initWithPlayer:]( objc_alloc(&OBJC_CLASS___TVHInteractivePlaylistPlaybackViewController),  "initWithPlayer:",  v5);
  -[TVHInteractivePlaylistPlaybackViewController setPopWhenPlayerStops:](v6, "setPopWhenPlayerStops:", 0LL);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHNowPlayingTabBarItemViewController tvh_playbackManager](self, "tvh_playbackManager"));
  -[TVHInteractivePlaylistPlaybackViewController setPlaybackDelegate:](v6, "setPlaybackDelegate:", v7);

  -[TVHNowPlayingTabBarItemViewController addChildViewController:](self, "addChildViewController:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHInteractivePlaylistPlaybackViewController view](v6, "view"));
  [v3 bounds];
  objc_msgSend(v8, "setFrame:");
  [v3 addSubview:v8];
  -[TVHInteractivePlaylistPlaybackViewController didMoveToParentViewController:]( v6,  "didMoveToParentViewController:",  self);
}

- (BOOL)_tvTabBarShouldAutohide
{
  return 1;
}

- (unint64_t)type
{
  return 10LL;
}

- (NSSet)mediaCategoryTypes
{
  return +[NSSet set](&OBJC_CLASS___NSSet, "set");
}

- (unint64_t)selectedMediaCategoryType
{
  return 0LL;
}

@end