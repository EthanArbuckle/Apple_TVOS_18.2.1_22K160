@interface TVMusicPlaybackHostController
- (BOOL)_tvTabBarShouldAutohide;
- (BOOL)isVisible;
- (TVMusicPlaybackHostController)initWithPlayer:(id)a3;
- (TVPPlayback)player;
- (UIViewController)playbackViewController;
- (id)preferredFocusEnvironments;
- (void)setPlaybackViewController:(id)a3;
- (void)setPlayer:(id)a3;
- (void)setVisible:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVMusicPlaybackHostController

- (TVMusicPlaybackHostController)initWithPlayer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVMusicPlaybackHostController;
  v6 = -[TVMusicPlaybackHostController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", 0LL, 0LL);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_player, a3);
  }

  return v7;
}

- (void)viewWillAppear:(BOOL)a3
{
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___TVMusicPlaybackHostController;
  -[TVMusicPlaybackHostController viewWillAppear:](&v26, "viewWillAppear:", a3);
  -[TVMusicPlaybackHostController setVisible:](self, "setVisible:", 1LL);
  if (!self->_playbackViewController)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackHostController player](self, "player"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currentMediaItem]);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaItemMetadataForProperty:TVPMediaItemMetadataMediaType]);
    v7 = (void *)TVPMediaTypeMusicVideo;

    if (v6 == v7)
    {
      uint64_t v10 = 3LL;
    }

    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackHostController player](self, "player"));
      unsigned int v9 = [v8 currentMediaItemHasVideoContent];

      if (v9) {
        uint64_t v10 = 2LL;
      }
      else {
        uint64_t v10 = 1LL;
      }
    }

    v11 = -[TVMusicPlaybackViewController initWithNowPlayingType:]( objc_alloc(&OBJC_CLASS____TtC7TVMusic29TVMusicPlaybackViewController),  "initWithNowPlayingType:",  v10);
    -[TVMusicPlaybackHostController addChildViewController:](self, "addChildViewController:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackHostController view](self, "view"));
    [v12 bounds];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackViewController view](v11, "view"));
    objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackViewController view](v11, "view"));
    [v22 setAutoresizingMask:18];

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackHostController view](self, "view"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackViewController view](v11, "view"));
    [v23 addSubview:v24];

    -[TVMusicPlaybackViewController didMoveToParentViewController:](v11, "didMoveToParentViewController:", self);
    playbackViewController = self->_playbackViewController;
    self->_playbackViewController = &v11->super;
  }

- (void)viewDidDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVMusicPlaybackHostController;
  -[TVMusicPlaybackHostController viewDidDisappear:](&v8, "viewDidDisappear:", a3);
  -[TVMusicPlaybackHostController setVisible:](self, "setVisible:", 0LL);
  if (self->_playbackViewController)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackHostController presentedViewController](self, "presentedViewController"));
    unsigned __int8 v5 = [v4 isBeingPresented];

    if ((v5 & 1) == 0)
    {
      -[UIViewController willMoveToParentViewController:]( self->_playbackViewController,  "willMoveToParentViewController:",  0LL);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_playbackViewController, "view"));
      [v6 removeFromSuperview];

      -[UIViewController removeFromParentViewController]( self->_playbackViewController,  "removeFromParentViewController");
      playbackViewController = self->_playbackViewController;
      self->_playbackViewController = 0LL;
    }
  }

- (id)preferredFocusEnvironments
{
  if (self->_playbackViewController)
  {
    playbackViewController = self->_playbackViewController;
    v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &playbackViewController,  1LL));
  }

  else
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___TVMusicPlaybackHostController;
    id v3 = -[TVMusicPlaybackHostController preferredFocusEnvironments](&v5, "preferredFocusEnvironments");
    v2 = (void *)objc_claimAutoreleasedReturnValue(v3);
  }

  return v2;
}

- (BOOL)_tvTabBarShouldAutohide
{
  return 1;
}

- (UIViewController)playbackViewController
{
  return self->_playbackViewController;
}

- (void)setPlaybackViewController:(id)a3
{
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (TVPPlayback)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end