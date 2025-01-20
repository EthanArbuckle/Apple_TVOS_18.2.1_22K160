@interface TVMusicSystemNowPlayingViewController
+ (BOOL)isVisible;
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
+ (id)currentRemoteViewController;
+ (void)dismissCurrentRemoteViewController;
- (TVMusicPlayer)player;
- (TVMusicSystemNowPlayingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UINavigationController)navigationController;
- (UITapGestureRecognizer)menuGestureRecognizer;
- (UIView)nowPlayingWallPaper;
- (UIViewController)nowPlayingViewController;
- (UIViewController)playbackViewController;
- (id)preferredFocusEnvironments;
- (void)_dismissRemoteViewController;
- (void)_playerDidChangeState:(id)a3;
- (void)dealloc;
- (void)setMenuGestureRecognizer:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)setNowPlayingWallPaper:(id)a3;
- (void)setPlaybackViewController:(id)a3;
- (void)setPlayer:(id)a3;
- (void)viewDidLoad;
- (void)viewServiceBeginPresentationWithOptions:(id)a3;
- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4;
@end

@implementation TVMusicSystemNowPlayingViewController

+ (id)currentRemoteViewController
{
  return (id)qword_1002BE900;
}

+ (void)dismissCurrentRemoteViewController
{
  if (qword_1002BE900) {
    [(id)qword_1002BE900 _dismissRemoteViewController];
  }
}

+ (BOOL)isVisible
{
  return byte_1002BE908;
}

- (TVMusicSystemNowPlayingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVMusicSystemNowPlayingViewController;
  v4 = -[TVMusicSystemNowPlayingViewController initWithNibName:bundle:](&v8, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[TVMusicPlayerManager defaultPlayer](&OBJC_CLASS___TVMusicPlayerManager, "defaultPlayer"));
    player = v4->_player;
    v4->_player = (TVMusicPlayer *)v5;
  }

  return v4;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVMusicSystemNowPlayingViewController;
  -[TVMusicSystemNowPlayingViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"_playerDidChangeState:" name:TVPPlaybackStateDidChangeNotification object:self->_player];
  v4 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_menuPressed:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v4, "setAllowedPressTypes:", &off_100282120);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSystemNowPlayingViewController view](self, "view"));
  [v5 addGestureRecognizer:v4];
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVMusicSystemNowPlayingViewController;
  -[TVMusicSystemNowPlayingViewController dealloc](&v4, "dealloc");
}

- (id)preferredFocusEnvironments
{
  if (self->_navigationController)
  {
    navigationController = self->_navigationController;
    v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &navigationController,  1LL));
  }

  else
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___TVMusicSystemNowPlayingViewController;
    id v3 = -[TVMusicSystemNowPlayingViewController preferredFocusEnvironments](&v5, "preferredFocusEnvironments");
    v2 = (void *)objc_claimAutoreleasedReturnValue(v3);
  }

  return v2;
}

- (void)viewServiceBeginPresentationWithOptions:(id)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSystemNowPlayingViewController player](self, "player", a3));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 state]);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState stopped](&OBJC_CLASS___TVPPlaybackState, "stopped"));

  if (v5 == v6)
  {
    -[TVMusicSystemNowPlayingViewController _dismissRemoteViewController](self, "_dismissRemoteViewController");
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSystemNowPlayingViewController view](self, "view"));
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSystemNowPlayingViewController player](self, "player"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 currentMediaItem]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 mediaItemMetadataForProperty:TVPMediaItemMetadataMediaType]);
    v11 = (void *)TVPMediaTypeMusicVideo;

    if (v10 == v11)
    {
      uint64_t v14 = 3LL;
    }

    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSystemNowPlayingViewController player](self, "player"));
      unsigned int v13 = [v12 currentMediaItemHasVideoContent];

      if (v13) {
        uint64_t v14 = 2LL;
      }
      else {
        uint64_t v14 = 1LL;
      }
    }

    v15 = -[TVMusicPlaybackViewController initWithNowPlayingType:]( objc_alloc(&OBJC_CLASS____TtC7TVMusic29TVMusicPlaybackViewController),  "initWithNowPlayingType:",  v14);
    -[TVMusicSystemNowPlayingViewController setPlaybackViewController:](self, "setPlaybackViewController:", v15);
    v16 = -[UINavigationController initWithRootViewController:]( objc_alloc(&OBJC_CLASS___UINavigationController),  "initWithRootViewController:",  v15);
    navigationController = self->_navigationController;
    self->_navigationController = v16;

    -[UINavigationController setNavigationBarHidden:](self->_navigationController, "setNavigationBarHidden:", 1LL);
    -[TVMusicSystemNowPlayingViewController addChildViewController:]( self,  "addChildViewController:",  self->_navigationController);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController view](self->_navigationController, "view"));
    [v7 frame];
    objc_msgSend(v18, "setFrame:");
    [v18 setAlpha:0.0];
    -[UINavigationController didMoveToParentViewController:]( self->_navigationController,  "didMoveToParentViewController:",  self);
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[TVSUIWallpaper wallpaperViewForVariant:]( &OBJC_CLASS___TVSUIWallpaper,  "wallpaperViewForVariant:",  1LL));
    objc_storeStrong((id *)&self->_nowPlayingWallPaper, v19);
    [v7 frame];
    objc_msgSend(v19, "setFrame:");
    [v19 setAlpha:0.0];
    [v7 addSubview:v19];
    [v7 addSubview:v18];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10005451C;
    v24[3] = &unk_100268B30;
    id v25 = v19;
    id v26 = v18;
    id v20 = v18;
    id v21 = v19;
    +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v24,  &stru_10026B128,  0.3);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100054550;
    block[3] = &unk_100268CF0;
    block[4] = self;
    v22 = self;
    dispatch_async(&_dispatch_main_q, block);
  }

- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4
{
  id v5 = a4;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100054710;
  block[3] = &unk_100268CF0;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController view](self->_navigationController, "view"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100054760;
  v12[3] = &unk_100268B30;
  id v13 = v6;
  uint64_t v14 = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000547AC;
  v9[3] = &unk_10026B170;
  v9[4] = self;
  id v10 = v13;
  id v11 = v5;
  id v7 = v5;
  id v8 = v13;
  +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  4LL,  v12,  v9,  0.3,  0.0);
}

- (void)_playerDidChangeState:(id)a3
{
  id v9 = a3;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v9 userInfo]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:TVPPlaybackStateNewStateKey]);

  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState stopped](&OBJC_CLASS___TVPPlaybackState, "stopped"));
  if (v5 == v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v9 userInfo]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:TVPPlaybackStateChangeReasonKey]);

    if (([v8 isEqualToString:TVPPlaybackChangeReasonNewPlaylist] & 1) == 0
      && ([v8 isEqualToString:TVPPlaybackChangeReasonErrorDidOccur] & 1) == 0)
    {
      -[TVMusicSystemNowPlayingViewController _dismissRemoteViewController](self, "_dismissRemoteViewController");
    }
  }
}

- (void)_dismissRemoteViewController
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicSystemNowPlayingViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  [v2 dismissWithResult:0];
}

+ (id)_exportedInterface
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServicePresenter));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSDictionary, v3);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString, v5);
  id v8 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v4,  v6,  objc_opt_class(&OBJC_CLASS___NSNumber, v7),  0LL);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v2 setClasses:v9 forSelector:"viewServiceBeginPresentationWithOptions:" argumentIndex:0 ofReply:0];
  [v2 setClasses:v9 forSelector:"viewServiceEndPresentationWithOptions:completion:" argumentIndex:0 ofReply:0];

  return v2;
}

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServiceInterface);
}

- (UIViewController)playbackViewController
{
  return self->_playbackViewController;
}

- (void)setPlaybackViewController:(id)a3
{
}

- (UIViewController)nowPlayingViewController
{
  return self->_nowPlayingViewController;
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

- (TVMusicPlayer)player
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