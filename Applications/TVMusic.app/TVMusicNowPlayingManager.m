@interface TVMusicNowPlayingManager
+ (id)sharedInstance;
- (BOOL)isNowPlayingVisible;
- (TVMusicNowPlayingManager)init;
- (TVMusicNowPlayingManager)initWithImplementation:(id)a3;
- (UIViewController)nowPlayingViewController;
- (void)hideCurrentPlaybackController;
- (void)hideCurrentPlaybackControllerWithCompletion:(id)a3;
- (void)showPlaybackControllerWithInitialPlaybackType:(unint64_t)a3;
@end

@implementation TVMusicNowPlayingManager

+ (id)sharedInstance
{
  if (qword_1002BE928 != -1) {
    dispatch_once(&qword_1002BE928, &stru_10026B438);
  }
  return (id)qword_1002BE920;
}

- (TVMusicNowPlayingManager)init
{
  v3 = objc_alloc_init(&OBJC_CLASS___TVMusicNowPlayingManagerImplementation);
  v4 = -[TVMusicNowPlayingManager initWithImplementation:](self, "initWithImplementation:", v3);

  return v4;
}

- (TVMusicNowPlayingManager)initWithImplementation:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVMusicNowPlayingManager;
  v6 = -[TVMusicNowPlayingManager init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_imp, a3);
  }

  return v7;
}

- (BOOL)isNowPlayingVisible
{
  return -[TVMusicNowPlayingPresenting isNowPlayingVisible](self->_imp, "isNowPlayingVisible");
}

- (UIViewController)nowPlayingViewController
{
  return (UIViewController *)-[TVMusicNowPlayingPresenting nowPlayingViewController]( self->_imp,  "nowPlayingViewController");
}

- (void)hideCurrentPlaybackController
{
}

- (void)hideCurrentPlaybackControllerWithCompletion:(id)a3
{
}

- (void)showPlaybackControllerWithInitialPlaybackType:(unint64_t)a3
{
}

- (void).cxx_destruct
{
}

@end