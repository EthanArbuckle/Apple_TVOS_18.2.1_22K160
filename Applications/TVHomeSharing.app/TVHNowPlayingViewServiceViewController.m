@interface TVHNowPlayingViewServiceViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (TVHNowPlayingViewServiceViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TVPPlayer)player;
- (UINavigationController)navigationController;
- (UITapGestureRecognizer)menuGestureRecognizer;
- (UIView)nowPlayingWallPaper;
- (void)_dismissRemoteViewController;
- (void)_handlePlaybackStateDidChangeNotification:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setMenuGestureRecognizer:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)setNowPlayingWallPaper:(id)a3;
- (void)viewDidLoad;
- (void)viewServiceBeginPresentationWithOptions:(id)a3;
- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4;
@end

@implementation TVHNowPlayingViewServiceViewController

- (TVHNowPlayingViewServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVHNowPlayingViewServiceViewController;
  v4 = -[TVHNowPlayingViewServiceViewController initWithNibName:bundle:](&v10, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHNowPlayingViewServiceViewController tvh_playbackManager](v4, "tvh_playbackManager"));
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 interactivePlaylistPlayer]);
    player = v5->_player;
    v5->_player = (TVPPlayer *)v7;

    -[TVPPlayer addObserver:forKeyPath:options:context:]( v5->_player,  "addObserver:forKeyPath:options:context:",  v5,  @"avPlayer",  4LL,  off_100156758);
  }

  return v5;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  -[TVPPlayer removeObserver:forKeyPath:](self->_player, "removeObserver:forKeyPath:", self, @"avPlayer");
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVHNowPlayingViewServiceViewController;
  -[TVHNowPlayingViewServiceViewController dealloc](&v4, "dealloc");
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVHNowPlayingViewServiceViewController;
  -[TVHNowPlayingViewServiceViewController viewDidLoad](&v8, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v4 = TVPPlaybackStateDidChangeNotification;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHNowPlayingViewServiceViewController player](self, "player"));
  [v3 addObserver:self selector:"_handlePlaybackStateDidChangeNotification:" name:v4 object:v5];

  v6 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_handleMenuPressed:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v6, "setAllowedPressTypes:", &off_100106C98);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHNowPlayingViewServiceViewController view](self, "view"));
  [v7 addGestureRecognizer:v6];
}

+ (id)_exportedInterface
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServicePresenter));
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
  v5 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v3,  v4,  objc_opt_class(&OBJC_CLASS___NSNumber),  0LL);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v2 setClasses:v6 forSelector:"viewServiceBeginPresentationWithOptions:" argumentIndex:0 ofReply:0];
  [v2 setClasses:v6 forSelector:"viewServiceEndPresentationWithOptions:completion:" argumentIndex:0 ofReply:0];

  return v2;
}

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServiceInterface);
}

- (void)viewServiceBeginPresentationWithOptions:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHNowPlayingViewServiceViewController player](self, "player"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 state]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState stopped](&OBJC_CLASS___TVPPlaybackState, "stopped"));

  if (v6 == v7)
  {
    -[TVHNowPlayingViewServiceViewController _dismissRemoteViewController](self, "_dismissRemoteViewController");
  }

  else
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHNowPlayingViewServiceViewController view](self, "view"));
    id v9 = objc_alloc(&OBJC_CLASS___TVPPlaybackViewController);
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHNowPlayingViewServiceViewController player](self, "player"));
    id v11 = [v9 initWithPlayer:v10 invalidateWhenDone:0];

    v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:PBSViewServiceOptionsUserInitiatedKey]);
    unsigned int v13 = [v12 BOOLValue];

    [v11 setIsIdleScreen:v13 ^ 1];
    [v11 setIsMusicPlaylist:1];
    [v11 setAllowDefaultMenuButtonBehavior:1];
    v14 = -[UINavigationController initWithRootViewController:]( objc_alloc(&OBJC_CLASS___UINavigationController),  "initWithRootViewController:",  v11);
    navigationController = self->_navigationController;
    self->_navigationController = v14;

    -[UINavigationController setNavigationBarHidden:](self->_navigationController, "setNavigationBarHidden:", 1LL);
    -[TVHNowPlayingViewServiceViewController addChildViewController:]( self,  "addChildViewController:",  self->_navigationController);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController view](self->_navigationController, "view"));
    [v8 frame];
    objc_msgSend(v16, "setFrame:");
    [v16 setAlpha:0.0];
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[TVSUIWallpaper wallpaperViewForVariant:]( &OBJC_CLASS___TVSUIWallpaper,  "wallpaperViewForVariant:",  1LL));
    objc_storeStrong((id *)&self->_nowPlayingWallPaper, v17);
    [v8 frame];
    objc_msgSend(v17, "setFrame:");
    [v17 setAlpha:0.0];
    [v8 addSubview:v17];
    [v8 addSubview:v16];
    v20[4] = self;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10004E134;
    v21[3] = &unk_1000FCDB8;
    id v22 = v17;
    id v23 = v16;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10004E164;
    v20[3] = &unk_1000FD4C8;
    id v18 = v16;
    id v19 = v17;
    +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v21,  v20,  0.3);
  }
}

- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4
{
  id v5 = a4;
  -[UINavigationController willMoveToParentViewController:]( self->_navigationController,  "willMoveToParentViewController:",  0LL);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController view](self->_navigationController, "view"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10004E290;
  v12[3] = &unk_1000FCDB8;
  id v13 = v6;
  v14 = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10004E2CC;
  v9[3] = &unk_1000FE158;
  v9[4] = self;
  id v10 = v13;
  id v11 = v5;
  id v7 = v5;
  id v8 = v13;
  +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  4LL,  v12,  v9,  0.3,  0.0);
}

- (void)_handlePlaybackStateDidChangeNotification:(id)a3
{
  id v9 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v9 userInfo]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:TVPPlaybackStateNewStateKey]);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState stopped](&OBJC_CLASS___TVPPlaybackState, "stopped"));
  if (v5 == v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v9 userInfo]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:TVPPlaybackStateChangeReasonKey]);

    if (([v8 isEqualToString:TVPPlaybackChangeReasonNewPlaylist] & 1) == 0
      && ([v8 isEqualToString:TVPPlaybackChangeReasonErrorDidOccur] & 1) == 0)
    {
      -[TVHNowPlayingViewServiceViewController _dismissRemoteViewController](self, "_dismissRemoteViewController");
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_100156758 == a6)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[TVHNowPlayingViewServiceViewController player](self, "player", a3, a4, a5));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v7 avPlayer]);
    [v6 _setAllowsVideoPlaybackWhileInBackground:1];
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___TVHNowPlayingViewServiceViewController;
    -[TVHNowPlayingViewServiceViewController observeValueForKeyPath:ofObject:change:context:]( &v8,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (void)_dismissRemoteViewController
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHNowPlayingViewServiceViewController player](self, "player"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 avPlayer]);
  [v4 _setAllowsVideoPlaybackWhileInBackground:0];

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHNowPlayingViewServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  [v5 dismissWithResult:0];
}

- (TVPPlayer)player
{
  return self->_player;
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