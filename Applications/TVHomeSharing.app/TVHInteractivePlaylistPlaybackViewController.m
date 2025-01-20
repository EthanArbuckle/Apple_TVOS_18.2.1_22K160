@interface TVHInteractivePlaylistPlaybackViewController
- (BOOL)supportsPictureInPicture;
- (TVHInteractivePlaylistPlaybackViewController)initWithPlayer:(id)a3;
- (TVHInteractivePlaylistPlaybackViewController)initWithPlayer:(id)a3 initialPlaybackType:(int64_t)a4;
- (void)_handleNavigationControllerDidDisplayViewControllerNotification:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVHInteractivePlaylistPlaybackViewController

- (TVHInteractivePlaylistPlaybackViewController)initWithPlayer:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currentMediaItem]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___TVHKPlayerMediaItem);
  id v7 = v5;
  v8 = v7;
  if (v6)
  {
    if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0) {
      v9 = v8;
    }
    else {
      v9 = 0LL;
    }
  }

  else
  {
    v9 = 0LL;
  }

  id v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 mediaItem]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 type]);
  v13 = -[TVHInteractivePlaylistPlaybackViewController initWithPlayer:initialPlaybackType:]( self,  "initWithPlayer:initialPlaybackType:",  v4,  [v12 mediaItemType] == (id)2);

  return v13;
}

- (TVHInteractivePlaylistPlaybackViewController)initWithPlayer:(id)a3 initialPlaybackType:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVHInteractivePlaylistPlaybackViewController;
  id v4 = -[TVHInteractivePlaylistPlaybackViewController initWithPlayer:initialPlaybackType:]( &v7,  "initWithPlayer:initialPlaybackType:",  a3,  a4);
  v5 = v4;
  if (v4)
  {
    -[TVHInteractivePlaylistPlaybackViewController setPopWhenPlayerStops:](v4, "setPopWhenPlayerStops:", 1LL);
    -[TVHInteractivePlaylistPlaybackViewController setShowsInlineVideo:](v5, "setShowsInlineVideo:", 1LL);
    -[TVHInteractivePlaylistPlaybackViewController setShowAnimatedBackground:](v5, "setShowAnimatedBackground:", 1LL);
  }

  return v5;
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVHInteractivePlaylistPlaybackViewController;
  -[TVHInteractivePlaylistPlaybackViewController viewWillAppear:](&v6, "viewWillAppear:", a3);
  if (-[TVHInteractivePlaylistPlaybackViewController isMovingToParentViewController]( self,  "isMovingToParentViewController"))
  {
    if (-[TVHInteractivePlaylistPlaybackViewController initialPlaybackType](self, "initialPlaybackType") == (id)1)
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHInteractivePlaylistPlaybackViewController navigationController](self, "navigationController"));
      [v4 addObserver:self selector:"_handleNavigationControllerDidDisplayViewControllerNotification:" name:@"TVHNavigationControllerDidDisplayViewControllerNotification" object:v5];
    }
  }

- (void)_handleNavigationControllerDidDisplayViewControllerNotification:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter", a3));
  [v4 removeObserver:self name:@"TVHNavigationControllerDidDisplayViewControllerNotification" object:0];

  -[TVHInteractivePlaylistPlaybackViewController showInlineVideoFullscreenIfPossible]( self,  "showInlineVideoFullscreenIfPossible");
}

- (BOOL)supportsPictureInPicture
{
  return 0;
}

@end