@interface MTTVPodcastsSystemNowPlayingViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (MTTVPodcastsSystemNowPlayingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TVPAVFPlayback)player;
- (UINavigationController)navigationController;
- (UITapGestureRecognizer)menuGestureRecognizer;
- (UIView)nowPlayingWallPaper;
- (void)_dismissRemoteViewController;
- (void)_menuPressed:(id)a3;
- (void)_playerDidChangeState:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setMenuGestureRecognizer:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)setNowPlayingWallPaper:(id)a3;
- (void)setPlayer:(id)a3;
- (void)viewDidLoad;
- (void)viewServiceBeginPresentationWithOptions:(id)a3;
- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4;
@end

@implementation MTTVPodcastsSystemNowPlayingViewController

- (MTTVPodcastsSystemNowPlayingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MTTVPodcastsSystemNowPlayingViewController;
  v4 = -[MTTVPodcastsSystemNowPlayingViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    v5 = (TVPAVFPlayback *)objc_claimAutoreleasedReturnValue(+[MTTVPlayerManager defaultPlayer](&OBJC_CLASS___MTTVPlayerManager, "defaultPlayer"));
    player = v4->_player;
    v4->_player = v5;
    v7 = v5;

    -[TVPAVFPlayback addObserver:forKeyPath:options:context:]( v4->_player,  "addObserver:forKeyPath:options:context:",  v4,  @"avPlayer",  4LL,  off_1002B2E08);
  }

  return v4;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTTVPodcastsSystemNowPlayingViewController;
  -[MTTVPodcastsSystemNowPlayingViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"_playerDidChangeState:" name:TVPPlaybackStateDidChangeNotification object:self->_player];

  v4 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_menuPressed:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v4, "setAllowedPressTypes:", &off_100255170);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastsSystemNowPlayingViewController view](self, "view"));
  [v5 addGestureRecognizer:v4];
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  -[TVPAVFPlayback removeObserver:forKeyPath:](self->_player, "removeObserver:forKeyPath:", self, @"avPlayer");
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTTVPodcastsSystemNowPlayingViewController;
  -[MTTVPodcastsSystemNowPlayingViewController dealloc](&v4, "dealloc");
}

- (void)viewServiceBeginPresentationWithOptions:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastsSystemNowPlayingViewController player](self, "player"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 state]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState stopped](&OBJC_CLASS___TVPPlaybackState, "stopped"));

  if (v6 == v7)
  {
    -[MTTVPodcastsSystemNowPlayingViewController _dismissRemoteViewController](self, "_dismissRemoteViewController");
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastsSystemNowPlayingViewController view](self, "view"));
    objc_super v9 = objc_alloc(&OBJC_CLASS___MTTVNowPlayingViewController);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastsSystemNowPlayingViewController player](self, "player"));
    v11 = -[MTTVNowPlayingViewController initWithPlayer:invalidateWhenDone:]( v9,  "initWithPlayer:invalidateWhenDone:",  v10,  0LL);

    -[MTTVNowPlayingViewController setRemoteViewService:](v11, "setRemoteViewService:", 1LL);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:PBSViewServiceOptionsUserInitiatedKey]);
    unsigned int v13 = [v12 BOOLValue];

    -[MTTVNowPlayingViewController setIsIdleScreen:](v11, "setIsIdleScreen:", v13 ^ 1);
    -[MTTVNowPlayingViewController setIsMusicPlaylist:](v11, "setIsMusicPlaylist:", 1LL);
    -[MTTVNowPlayingViewController setAllowDefaultMenuButtonBehavior:](v11, "setAllowDefaultMenuButtonBehavior:", 1LL);
    v14 = -[UINavigationController initWithRootViewController:]( objc_alloc(&OBJC_CLASS___UINavigationController),  "initWithRootViewController:",  v11);
    navigationController = self->_navigationController;
    self->_navigationController = v14;

    -[UINavigationController setNavigationBarHidden:](self->_navigationController, "setNavigationBarHidden:", 1LL);
    -[MTTVPodcastsSystemNowPlayingViewController addChildViewController:]( self,  "addChildViewController:",  self->_navigationController);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController view](self->_navigationController, "view"));
    [v8 frame];
    objc_msgSend(v16, "setFrame:");
    [v16 setAlpha:0.0];
    -[UINavigationController didMoveToParentViewController:]( self->_navigationController,  "didMoveToParentViewController:",  self);
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[TVSUIWallpaper wallpaperViewForVariant:]( &OBJC_CLASS___TVSUIWallpaper,  "wallpaperViewForVariant:",  1LL));
    objc_storeStrong((id *)&self->_nowPlayingWallPaper, v17);
    [v8 frame];
    objc_msgSend(v17, "setFrame:");
    [v17 setAlpha:0.0];
    [v8 addSubview:v17];
    [v8 addSubview:v16];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10005A854;
    v20[3] = &unk_100240240;
    id v21 = v17;
    id v22 = v16;
    id v18 = v16;
    id v19 = v17;
    +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v20,  &stru_100242190,  0.3);
  }
}

- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4
{
  id v5 = a4;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController view](self->_navigationController, "view"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10005A994;
  v12[3] = &unk_100240240;
  id v13 = v6;
  v14 = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10005A9E0;
  v9[3] = &unk_1002421B8;
  v9[4] = self;
  id v10 = v13;
  id v11 = v5;
  id v7 = v5;
  id v8 = v13;
  +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  4LL,  v12,  v9,  0.3,  0.0);
}

- (void)_playerDidChangeState:(id)a3
{
  id v10 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v10 object]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v10 userInfo]);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:TVPPlaybackStateNewStateKey]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState stopped](&OBJC_CLASS___TVPPlaybackState, "stopped"));
  if (v6 == v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v10 userInfo]);
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:TVPPlaybackStateChangeReasonKey]);

    if (([v9 isEqualToString:TVPPlaybackChangeReasonNewPlaylist] & 1) == 0
      && ([v9 isEqualToString:TVPPlaybackChangeReasonErrorDidOccur] & 1) == 0)
    {
      -[MTTVPodcastsSystemNowPlayingViewController _dismissRemoteViewController](self, "_dismissRemoteViewController");
    }
  }
}

- (void)_dismissRemoteViewController
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPAVFPlayback avPlayer](self->_player, "avPlayer"));
  [v3 _setAllowsVideoPlaybackWhileInBackground:0];

  id v4 = (id)objc_claimAutoreleasedReturnValue( -[MTTVPodcastsSystemNowPlayingViewController _remoteViewControllerProxy]( self,  "_remoteViewControllerProxy"));
  [v4 dismissWithResult:0];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1002B2E08 == a6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPAVFPlayback avPlayer](self->_player, "avPlayer", a3, a4, a5));

    if (v7)
    {
      id v8 = (id)objc_claimAutoreleasedReturnValue(-[TVPAVFPlayback avPlayer](self->_player, "avPlayer"));
      [v8 _setAllowsVideoPlaybackWhileInBackground:1];
    }
  }

  else
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___MTTVPodcastsSystemNowPlayingViewController;
    -[MTTVPodcastsSystemNowPlayingViewController observeValueForKeyPath:ofObject:change:context:]( &v9,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

+ (id)_exportedInterface
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServicePresenter));
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
  id v5 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v3,  v4,  objc_opt_class(&OBJC_CLASS___NSNumber),  0LL);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v2 setClasses:v6 forSelector:"viewServiceBeginPresentationWithOptions:" argumentIndex:0 ofReply:0];
  [v2 setClasses:v6 forSelector:"viewServiceEndPresentationWithOptions:completion:" argumentIndex:0 ofReply:0];

  return v2;
}

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServiceInterface);
}

- (void)_menuPressed:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastsSystemNowPlayingViewController navigationController](self, "navigationController", a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 viewControllers]);
  id v6 = [v5 count];

  if ((unint64_t)v6 < 2)
  {
    -[MTTVPodcastsSystemNowPlayingViewController _dismissRemoteViewController](self, "_dismissRemoteViewController");
  }

  else
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[MTTVPodcastsSystemNowPlayingViewController navigationController](self, "navigationController"));
    id v7 = [v8 popViewControllerAnimated:1];
  }

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
}

- (UITapGestureRecognizer)menuGestureRecognizer
{
  return self->_menuGestureRecognizer;
}

- (void)setMenuGestureRecognizer:(id)a3
{
}

- (TVPAVFPlayback)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (UIView)nowPlayingWallPaper
{
  return self->_nowPlayingWallPaper;
}

- (void)setNowPlayingWallPaper:(id)a3
{
}

- (void).cxx_destruct
{
}

@end