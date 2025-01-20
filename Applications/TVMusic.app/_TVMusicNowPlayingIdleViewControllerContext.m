@interface _TVMusicNowPlayingIdleViewControllerContext
- (BOOL)isFinished;
- (TVPMediaItem)mediaItem;
- (UIViewController)idleViewController;
- (_TVMusicNowPlayingIdleViewControllerContext)initWithMediaItem:(id)a3;
- (void)finishWithIdleViewController:(id)a3;
@end

@implementation _TVMusicNowPlayingIdleViewControllerContext

- (_TVMusicNowPlayingIdleViewControllerContext)initWithMediaItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____TVMusicNowPlayingIdleViewControllerContext;
  v6 = -[_TVMusicNowPlayingIdleViewControllerContext init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mediaItem, a3);
  }

  return v7;
}

- (void)finishWithIdleViewController:(id)a3
{
  self->_finished = 1;
  objc_storeStrong((id *)&self->_idleViewController, a3);
}

- (TVPMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (UIViewController)idleViewController
{
  return self->_idleViewController;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (void).cxx_destruct
{
}

@end