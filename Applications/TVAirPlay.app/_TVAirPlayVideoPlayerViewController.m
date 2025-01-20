@interface _TVAirPlayVideoPlayerViewController
- (BOOL)wasDismissed;
- (TVAirPlayURLSession)videoSession;
- (UIWindow)focusStealingWindow;
- (void)dealloc;
- (void)dismiss;
- (void)playerViewControllerDidStartPictureInPicture:(id)a3;
- (void)playerViewControllerWillStopPictureInPicture:(id)a3;
- (void)setVideoSession:(id)a3;
- (void)setWasDismissed:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation _TVAirPlayVideoPlayerViewController

- (void)dealloc
{
  if (self->_focusStealingWindow)
  {
    id v3 = sub_100004250();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      focusStealingWindow = self->_focusStealingWindow;
      *(_DWORD *)buf = 134217984;
      v9 = focusStealingWindow;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Removing focus stealing window(%p)",  buf,  0xCu);
    }

    -[UIWindow setHidden:](self->_focusStealingWindow, "setHidden:", 1LL);
    v6 = self->_focusStealingWindow;
    self->_focusStealingWindow = 0LL;
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS____TVAirPlayVideoPlayerViewController;
  -[_TVAirPlayVideoPlayerViewController dealloc](&v7, "dealloc");
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____TVAirPlayVideoPlayerViewController;
  -[_TVAirPlayVideoPlayerViewController viewDidLoad](&v4, "viewDidLoad");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[_TVAirPlayVideoPlayerViewController avPlayerViewController](self, "avPlayerViewController"));
  [v3 setAllowsPictureInPicturePlayback:1];
}

- (void)dismiss
{
  if (!-[_TVAirPlayVideoPlayerViewController wasDismissed](self, "wasDismissed"))
  {
    -[_TVAirPlayVideoPlayerViewController setWasDismissed:](self, "setWasDismissed:", 1LL);
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[_TVAirPlayVideoPlayerViewController player](self, "player"));
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 state]);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState stopped](&OBJC_CLASS___TVPPlaybackState, "stopped"));

    id v6 = sub_100004250();
    objc_super v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v4 == v5)
    {
      if (v8)
      {
        *(_WORD *)v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Video view controller dismissed", v9, 2u);
      }
    }

    else
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Video view controller dismissed due to menu, sending stop",  buf,  2u);
      }

      objc_super v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[_TVAirPlayVideoPlayerViewController videoSession](self, "videoSession"));
      -[os_log_s userStop](v7, "userStop");
    }
  }

- (void)playerViewControllerDidStartPictureInPicture:(id)a3
{
  id v4 = a3;
  p_focusStealingWindow = &self->_focusStealingWindow;
  -[UIWindow setHidden:](self->_focusStealingWindow, "setHidden:", 1LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 view]);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v6 window]);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 windowScene]);

  v9 = -[UIWindow initWithWindowScene:](objc_alloc(&OBJC_CLASS___UIWindow), "initWithWindowScene:", v8);
  objc_storeStrong((id *)p_focusStealingWindow, v9);
  -[UIWindow makeKeyAndVisible](*p_focusStealingWindow, "makeKeyAndVisible");
  id v10 = sub_100004250();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134218240;
    id v13 = v4;
    __int16 v14 = 2048;
    v15 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Stealing focus away from AVPlayerViewController(%p, window = %p)",  (uint8_t *)&v12,  0x16u);
  }
}

- (void)playerViewControllerWillStopPictureInPicture:(id)a3
{
  id v4 = a3;
  -[UIWindow setHidden:](self->_focusStealingWindow, "setHidden:", 1LL);
  focusStealingWindow = self->_focusStealingWindow;
  self->_focusStealingWindow = 0LL;

  id v6 = sub_100004250();
  objc_super v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = self->_focusStealingWindow;
    int v9 = 134218240;
    id v10 = v4;
    __int16 v11 = 2048;
    int v12 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Returning focus back to AVPlayerViewController(%p, window = %p)",  (uint8_t *)&v9,  0x16u);
  }
}

- (TVAirPlayURLSession)videoSession
{
  return self->_videoSession;
}

- (void)setVideoSession:(id)a3
{
}

- (BOOL)wasDismissed
{
  return self->_wasDismissed;
}

- (void)setWasDismissed:(BOOL)a3
{
  self->_wasDismissed = a3;
}

- (UIWindow)focusStealingWindow
{
  return self->_focusStealingWindow;
}

- (void).cxx_destruct
{
}

@end