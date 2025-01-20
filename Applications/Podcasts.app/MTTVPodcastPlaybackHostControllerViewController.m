@interface MTTVPodcastPlaybackHostControllerViewController
- (BOOL)_tvTabBarShouldAutohide;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (MTTVNowPlayingViewController)playbackViewController;
- (void)_handleMenuButton:(id)a3;
- (void)setPlaybackViewController:(id)a3;
- (void)viewDidLoad;
@end

@implementation MTTVPodcastPlaybackHostControllerViewController

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MTTVPodcastPlaybackHostControllerViewController;
  -[MTTVPodcastPlaybackHostControllerViewController viewDidLoad](&v10, "viewDidLoad");
  v3 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_handleMenuButton:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v3, "setAllowedPressTypes:", &off_100255158);
  -[UITapGestureRecognizer setDelegate:](v3, "setDelegate:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastPlaybackHostControllerViewController view](self, "view"));
  [v4 addGestureRecognizer:v3];

  v5 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVPodcastPlaybackHostControllerViewController playbackViewController]( self,  "playbackViewController"));
  -[MTTVPodcastPlaybackHostControllerViewController addChildViewController:](self, "addChildViewController:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastPlaybackHostControllerViewController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVPodcastPlaybackHostControllerViewController playbackViewController]( self,  "playbackViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 view]);
  [v6 addSubview:v8];

  v9 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVPodcastPlaybackHostControllerViewController playbackViewController]( self,  "playbackViewController"));
  [v9 didMoveToParentViewController:self];
}

- (MTTVNowPlayingViewController)playbackViewController
{
  playbackViewController = self->_playbackViewController;
  if (!playbackViewController)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___MTTVNowPlayingViewController);
    v5 = self->_playbackViewController;
    self->_playbackViewController = v4;

    playbackViewController = self->_playbackViewController;
  }

  return playbackViewController;
}

- (BOOL)_tvTabBarShouldAutohide
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVPodcastPlaybackHostControllerViewController playbackViewController]( self,  "playbackViewController"));
  unsigned __int8 v3 = [v2 _tvTabBarShouldAutohide];

  return v3;
}

- (void)_handleMenuButton:(id)a3
{
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[MTTVPodcastPlaybackHostControllerViewController tabBarController](self, "tabBarController", a3));
  if (v4
    && (v5 = (void *)v4,
        v6 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVPodcastPlaybackHostControllerViewController parentViewController]( self,  "parentViewController")),  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastPlaybackHostControllerViewController tabBarController](self, "tabBarController")),  v7,  v6,  v5,  v6 == v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](&OBJC_CLASS___MTPlayerController, "defaultInstance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 currentItem]);
    unsigned int v10 = [v9 isVideo];

    if (v10)
    {
      id v11 = (id)objc_claimAutoreleasedReturnValue(-[MTTVPodcastPlaybackHostControllerViewController tabBarController](self, "tabBarController"));
      [v11 _performFocusGesture:0];
    }
  }

  else
  {
    -[MTTVPodcastPlaybackHostControllerViewController dismissViewControllerAnimated:completion:]( self,  "dismissViewControllerAnimated:completion:",  1LL,  0LL);
  }

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)setPlaybackViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end