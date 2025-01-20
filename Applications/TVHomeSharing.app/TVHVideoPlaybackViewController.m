@interface TVHVideoPlaybackViewController
+ (id)new;
- (BOOL)playerViewControllerShouldAutomaticallyDismissAtPictureInPictureStart:(id)a3;
- (BOOL)supportsPictureInPicture;
- (TVHVideoPlaybackViewController)init;
- (TVHVideoPlaybackViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TVHVideoPlaybackViewController)initWithPlayer:(id)a3;
- (TVHVideoPlaybackViewController)initWithPlayer:(id)a3 invalidateWhenDone:(BOOL)a4;
- (void)playerViewController:(id)a3 failedToStartPictureInPictureWithError:(id)a4;
- (void)playerViewController:(id)a3 restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(id)a4;
- (void)playerViewControllerDidStartPictureInPicture:(id)a3;
- (void)playerViewControllerDidStopPictureInPicture:(id)a3;
- (void)playerViewControllerWillStartPictureInPicture:(id)a3;
- (void)playerViewControllerWillStopPictureInPicture:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation TVHVideoPlaybackViewController

+ (id)new
{
  return 0LL;
}

- (TVHVideoPlaybackViewController)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHVideoPlaybackViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v6);

  return 0LL;
}

- (TVHVideoPlaybackViewController)initWithPlayer:(id)a3 invalidateWhenDone:(BOOL)a4
{
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v6);

  return 0LL;
}

- (TVHVideoPlaybackViewController)initWithPlayer:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVHVideoPlaybackViewController;
  v3 = -[TVHVideoPlaybackViewController initWithPlayer:invalidateWhenDone:]( &v6,  "initWithPlayer:invalidateWhenDone:",  a3,  0LL);
  v4 = v3;
  if (v3) {
    -[TVHVideoPlaybackViewController setPopWhenPlayerStops:](v3, "setPopWhenPlayerStops:", 1LL);
  }
  return v4;
}

- (BOOL)supportsPictureInPicture
{
  return 1;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVHVideoPlaybackViewController;
  -[TVHVideoPlaybackViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHVideoPlaybackViewController avPlayerViewController](self, "avPlayerViewController"));
  [v3 setAllowsPictureInPicturePlayback:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVHVideoPlaybackViewController;
  -[TVHVideoPlaybackViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHVideoPlaybackViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v4, "videoPlayerViewControllerViewDidAppear:") & 1) != 0) {
    [v4 videoPlayerViewControllerViewDidAppear:self];
  }
}

- (void)playerViewControllerWillStartPictureInPicture:(id)a3
{
  id v5 = a3;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHVideoPlaybackViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector( v4,  "videoPlayerViewController:willStartPictureInPictureWithAVPlayerViewController:") & 1) != 0) {
    [v4 videoPlayerViewController:self willStartPictureInPictureWithAVPlayerViewController:v5];
  }
}

- (void)playerViewControllerDidStartPictureInPicture:(id)a3
{
  id v5 = a3;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHVideoPlaybackViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v4, "videoPlayerViewController:didStartPictureInPictureWithAVPlayerViewController:") & 1) != 0) {
    [v4 videoPlayerViewController:self didStartPictureInPictureWithAVPlayerViewController:v5];
  }
}

- (void)playerViewController:(id)a3 failedToStartPictureInPictureWithError:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHVideoPlaybackViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector( v7,  "videoPlayerViewController:failedToStartPictureInPictureWithAVPlayerViewController:error:") & 1) != 0) {
    [v7 videoPlayerViewController:self failedToStartPictureInPictureWithAVPlayerViewController:v8 error:v6];
  }
}

- (void)playerViewControllerWillStopPictureInPicture:(id)a3
{
  id v5 = a3;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHVideoPlaybackViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v4, "videoPlayerViewController:willStopPictureInPictureWithAVPlayerViewController:") & 1) != 0) {
    [v4 videoPlayerViewController:self willStopPictureInPictureWithAVPlayerViewController:v5];
  }
}

- (void)playerViewControllerDidStopPictureInPicture:(id)a3
{
  id v5 = a3;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHVideoPlaybackViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v4, "videoPlayerViewController:didStopPictureInPictureWithAVPlayerViewController:") & 1) != 0) {
    [v4 videoPlayerViewController:self didStopPictureInPictureWithAVPlayerViewController:v5];
  }
}

- (BOOL)playerViewControllerShouldAutomaticallyDismissAtPictureInPictureStart:(id)a3
{
  return 0;
}

- (void)playerViewController:(id)a3 restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(id)a4
{
  id v8 = a3;
  id v6 = (void (**)(id, void))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHVideoPlaybackViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector( v7,  "videoPlayerViewController:restoreUserInterfaceForPictureInPictureStopWithAVPlayerViewController:completionHandler:") & 1) != 0)
  {
    [v7 videoPlayerViewController:self restoreUserInterfaceForPictureInPictureStopWithAVPlayerViewController:v8 completionHandler:v6];
  }

  else if (v6)
  {
    v6[2](v6, 0LL);
  }
}

@end