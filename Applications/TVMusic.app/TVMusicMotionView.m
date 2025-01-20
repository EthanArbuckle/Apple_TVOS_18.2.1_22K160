@interface TVMusicMotionView
+ (TVMusicMotionView)motionViewWithElement:(id)a3 existingView:(id)a4;
+ (id)_motionURLFromElement:(id)a3;
- (AVPlayer)avPlayer;
- (AVPlayerLayer)flippedPlayerLayer;
- (AVPlayerLayer)playerLayer;
- (BOOL)aspectFitVideo;
- (BOOL)isAlwaysActive;
- (BOOL)isAncestorFocused;
- (BOOL)isInActiveRegion;
- (BOOL)isVisible;
- (BOOL)useFocusBasedActivation;
- (BOOL)wasPausedWhenAppResignedActive;
- (CGSize)preferredResolution;
- (MPCScriptedLooper)videoLooper;
- (NSString)elementID;
- (NSTimer)timerForUpdates;
- (NSURL)motionURL;
- (TVMusicMotionView)initWithElement:(id)a3 alwaysActive:(BOOL)a4;
- (TVMusicMotionView)initWithFrame:(CGRect)a3;
- (UIView)flippedImageView;
- (UIView)stillImageView;
- (double)videoHeight;
- (void)_ancestorWillUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)_animateStillImageToAlpha:(double)a3 completion:(id)a4;
- (void)_animateStillImageToAlpha:(double)a3 duration:(double)a4 completion:(id)a5;
- (void)_appDidBecomeActive:(id)a3;
- (void)_appWillResignActive:(id)a3;
- (void)_audioSessionInvalidated:(id)a3;
- (void)_configureStillImageForElement:(id)a3;
- (void)_configureVideoWithURL:(id)a3;
- (void)_configureWithElement:(id)a3;
- (void)_createImageViewsForImageElement:(id)a3;
- (void)_createTimerForUpdates;
- (void)_createVideo;
- (void)_createVideoWithAudioSession:(id)a3;
- (void)_destroyTimerForUpdates;
- (void)_destroyVideo;
- (void)_handleFocusForFocusedView:(id)a3;
- (void)_hideMotion;
- (void)_prepareElementForReuse;
- (void)_seekToStartWithCompletion:(id)a3;
- (void)_showMotion;
- (void)_startVideoPlayback;
- (void)_updateState:(id)a3;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pause;
- (void)play;
- (void)playFromStart;
- (void)seekToStartWithCrossfadeDuration:(double)a3;
- (void)setAlwaysActive:(BOOL)a3;
- (void)setAncestorFocused:(BOOL)a3;
- (void)setAspectFitVideo:(BOOL)a3;
- (void)setAvPlayer:(id)a3;
- (void)setElementID:(id)a3;
- (void)setFlippedImageView:(id)a3;
- (void)setFlippedPlayerLayer:(id)a3;
- (void)setIsInActiveRegion:(BOOL)a3;
- (void)setIsVisible:(BOOL)a3;
- (void)setMotionURL:(id)a3;
- (void)setPausedWhenAppResignedActive:(BOOL)a3;
- (void)setPlayerLayer:(id)a3;
- (void)setPreferredResolution:(CGSize)a3;
- (void)setStillImageView:(id)a3;
- (void)setTimerForUpdates:(id)a3;
- (void)setUseFocusBasedActivation:(BOOL)a3;
- (void)setVideoHeight:(double)a3;
- (void)setVideoLooper:(id)a3;
@end

@implementation TVMusicMotionView

+ (TVMusicMotionView)motionViewWithElement:(id)a3 existingView:(id)a4
{
  id v5 = a3;
  v6 = (TVMusicMotionView *)a4;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___TVMusicMotionView, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0) {
    v9 = v6;
  }
  else {
    v9 = 0LL;
  }
  v10 = v9;
  if (v10)
  {
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView motionURL](v10, "motionURL"));
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMotionView _motionURLFromElement:]( &OBJC_CLASS___TVMusicMotionView,  "_motionURLFromElement:",  v5));
    unsigned __int8 v14 = [v12 isEqual:v13];

    v15 = v6;
    if ((v14 & 1) == 0)
    {
      -[TVMusicMotionView _prepareElementForReuse](v11, "_prepareElementForReuse");
      v16 = (void *)objc_claimAutoreleasedReturnValue([v5 style]);
      [v16 width];
      double v18 = v17;
      v19 = (void *)objc_claimAutoreleasedReturnValue([v5 style]);
      [v19 height];
      -[TVMusicMotionView setFrame:](v11, "setFrame:", 0.0, 0.0, v18, v20);

      -[TVMusicMotionView _configureWithElement:](v11, "_configureWithElement:", v5);
      v15 = v6;
    }
  }

  else
  {
    v15 = -[TVMusicMotionView initWithElement:alwaysActive:]( objc_alloc(&OBJC_CLASS___TVMusicMotionView),  "initWithElement:alwaysActive:",  v5,  0LL);
  }

  return v15;
}

+ (id)_motionURLFromElement:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 attributes]);
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"src"]);
  if (v5)
  {
    v6 = (void *)v5;
  }

  else
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 attributes]);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"videoAsset"]);

    if (!v6)
    {
      uint64_t v8 = 0LL;
      goto LABEL_5;
    }
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v6));
LABEL_5:

  return v8;
}

- (TVMusicMotionView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVMusicMotionView;
  id v3 = -[TVMusicMotionView initWithFrame:]( &v10,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v4 addObserver:v3 selector:"_appWillResignActive:" name:UIApplicationWillResignActiveNotification object:0];

    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v5 addObserver:v3 selector:"_appDidBecomeActive:" name:UIApplicationDidBecomeActiveNotification object:0];

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMotionAudioSessionManager invalidatedSessionNotification]( &OBJC_CLASS____TtC7TVMusic32TVMusicMotionAudioSessionManager,  "invalidatedSessionNotification"));
    [v6 addObserver:v3 selector:"_audioSessionInvalidated:" name:v7 object:0];

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMotionAudioSessionManager sharedManager]( &OBJC_CLASS____TtC7TVMusic32TVMusicMotionAudioSessionManager,  "sharedManager"));
    [v8 createSessionIfNeeded];
  }

  return v3;
}

- (TVMusicMotionView)initWithElement:(id)a3 alwaysActive:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 style]);
  [v7 width];
  double v9 = v8;
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v6 style]);
  [v10 height];
  v12 = -[TVMusicMotionView initWithFrame:](self, "initWithFrame:", 0.0, 0.0, v9, v11);

  if (v12)
  {
    if (v4)
    {
      v12->_alwaysActive = 1;
      v12->_isVisible = 1;
      v12->_isInActiveRegion = 1;
    }

    -[TVMusicMotionView _setTracksFocusedAncestors:](v12, "_setTracksFocusedAncestors:", 1LL);
    -[TVMusicMotionView _configureWithElement:](v12, "_configureWithElement:", v6);
  }

  return v12;
}

- (void)_configureWithElement:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 attributes]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"aspect-fit"]);
  -[TVMusicMotionView setAspectFitVideo:](self, "setAspectFitVideo:", [v6 BOOLValue]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"video-height"]);
  [v7 doubleValue];
  -[TVMusicMotionView setVideoHeight:](self, "setVideoHeight:");

  double v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"hls-upsize-ratio"]);
  [v8 doubleValue];
  double v10 = v9;

  double v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"focus-based"]);
  -[TVMusicMotionView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", @"TVMusic.MotionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue([v4 elementIdentifier]);
  -[TVMusicMotionView setElementID:](self, "setElementID:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView elementID](self, "elementID"));
  if (!v13)
  {
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"#%ld",  ++qword_1002BE800));
    -[TVMusicMotionView setElementID:](self, "setElementID:", v14);
  }

  id v15 = sub_10002AB60();
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    double v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView elementID](self, "elementID"));
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v4;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "Initializing motion view for element: %@, id=%@",  buf,  0x16u);
  }

  memset(buf, 0, 32);
  +[TVMLUtilities cornerRadiiFromElement:cornerRadii:circle:]( &OBJC_CLASS___TVMLUtilities,  "cornerRadiiFromElement:cornerRadii:circle:",  v4,  buf,  0LL);
  double v18 = *(double *)buf;
  if (*(double *)buf != 0.0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView layer](self, "layer"));
    [v19 setCornerRadius:v18];

    double v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView layer](self, "layer"));
    [v20 setMasksToBounds:1];
  }

  if (-[TVMusicMotionView isAlwaysActive](self, "isAlwaysActive"))
  {
    -[TVMusicMotionView setUseFocusBasedActivation:](self, "setUseFocusBasedActivation:", 0LL);
  }

  else
  {
    -[TVMusicMotionView setUseFocusBasedActivation:](self, "setUseFocusBasedActivation:", 1LL);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKey:@"TVMusicFocusBasedMotion"]);

    v23 = v22;
    if (v22 || (v23 = v11) != 0LL) {
      -[TVMusicMotionView setUseFocusBasedActivation:]( self,  "setUseFocusBasedActivation:",  [v23 BOOLValue]);
    }
  }

  -[TVMusicMotionView _configureStillImageForElement:](self, "_configureStillImageForElement:", v4);
  if (v10 <= 0.0)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    [v24 scale];
    double v10 = v25;

    if (v10 == 1.0) {
      double v10 = 1.25;
    }
  }

  -[TVMusicMotionView bounds](self, "bounds");
  double v27 = v10 * v26;
  -[TVMusicMotionView bounds](self, "bounds");
  -[TVMusicMotionView setPreferredResolution:](self, "setPreferredResolution:", v27, v10 * v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMotionView _motionURLFromElement:]( &OBJC_CLASS___TVMusicMotionView,  "_motionURLFromElement:",  v4));
  -[TVMusicMotionView _configureVideoWithURL:](self, "_configureVideoWithURL:", v29);
}

- (void)dealloc
{
  id v3 = sub_10002AB60();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1001B9098(self);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView timerForUpdates](self, "timerForUpdates"));
  [v5 invalidate];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 removeObserver:self];

  -[TVMusicMotionView _destroyVideo](self, "_destroyVideo");
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVMusicMotionView;
  -[TVMusicMotionView dealloc](&v7, "dealloc");
}

- (void)_appWillResignActive:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView avPlayer](self, "avPlayer", a3));
  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView avPlayer](self, "avPlayer"));
    -[TVMusicMotionView setPausedWhenAppResignedActive:]( self,  "setPausedWhenAppResignedActive:",  [v5 timeControlStatus] == 0);
  }

  else
  {
    -[TVMusicMotionView setPausedWhenAppResignedActive:](self, "setPausedWhenAppResignedActive:", 0LL);
  }

  if (-[TVMusicMotionView isAlwaysActive](self, "isAlwaysActive"))
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView videoLooper](self, "videoLooper"));
    [v6 pauseScenes];
  }

  else
  {
    -[TVMusicMotionView _destroyTimerForUpdates](self, "_destroyTimerForUpdates");
    -[TVMusicMotionView _hideMotion](self, "_hideMotion");
  }

- (void)_appDidBecomeActive:(id)a3
{
  if (-[TVMusicMotionView isAlwaysActive](self, "isAlwaysActive", a3))
  {
    if (!-[TVMusicMotionView wasPausedWhenAppResignedActive](self, "wasPausedWhenAppResignedActive"))
    {
      id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView videoLooper](self, "videoLooper"));
      [v4 playScenes];
    }
  }

  else
  {
    -[TVMusicMotionView _createTimerForUpdates](self, "_createTimerForUpdates");
  }

- (void)_audioSessionInvalidated:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  uint64_t v5 = sub_10002AE40;
  id v6 = &unk_100268CF0;
  objc_super v7 = self;
  id v3 = v4;
  if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
  {
    v5((uint64_t)v3);
  }

  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10002D36C;
    block[3] = &unk_100268D60;
    double v9 = v3;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (void)_configureStillImageForElement:(id)a3
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "childViewElements", 0));
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    uint64_t v8 = TVElementKeyImg;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        double v10 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 elementName]);
        unsigned int v12 = [v11 isEqualToString:v8];

        if (v12)
        {
          -[TVMusicMotionView _createImageViewsForImageElement:](self, "_createImageViewsForImageElement:", v10);
          goto LABEL_11;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (void)_createImageViewsForImageElement:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView stillImageView](self, "stillImageView"));

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView stillImageView](self, "stillImageView"));
    [v6 removeFromSuperview];
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[TVInterfaceFactory sharedInterfaceFactory]( &OBJC_CLASS___TVInterfaceFactory,  "sharedInterfaceFactory"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 viewForElement:v4 existingView:0]);

  [v8 bounds];
  objc_msgSend(v8, "setFrame:");
  -[TVMusicMotionView addSubview:](self, "addSubview:", v8);
  -[TVMusicMotionView setStillImageView:](self, "setStillImageView:", v8);
  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView flippedImageView](self, "flippedImageView"));

  if (v9)
  {
    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView flippedImageView](self, "flippedImageView"));
    [v10 removeFromSuperview];

    -[TVMusicMotionView setFlippedImageView:](self, "setFlippedImageView:", 0LL);
  }

  -[TVMusicMotionView videoHeight](self, "videoHeight");
  if (v11 > 0.0)
  {
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue( +[TVInterfaceFactory sharedInterfaceFactory]( &OBJC_CLASS___TVInterfaceFactory,  "sharedInterfaceFactory"));
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 viewForElement:v4 existingView:0]);

    [v13 bounds];
    objc_msgSend(v13, "setFrame:");
    -[TVMusicMotionView videoHeight](self, "videoHeight");
    v15[1] = 0LL;
    v15[2] = 0LL;
    v15[0] = 0x3FF0000000000000LL;
    __int128 v16 = xmmword_1001E7E20;
    uint64_t v17 = v14;
    [v13 setTransform:v15];
    -[TVMusicMotionView addSubview:](self, "addSubview:", v13);
    -[TVMusicMotionView setFlippedImageView:](self, "setFlippedImageView:", v13);
  }
}

- (void)_configureVideoWithURL:(id)a3
{
  if (-[TVMusicMotionView isInActiveRegion](self, "isInActiveRegion"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView avPlayer](self, "avPlayer"));
    if (v4)
    {
    }

    else
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView motionURL](self, "motionURL"));

      if (v5) {
        -[TVMusicMotionView _createVideo](self, "_createVideo");
      }
    }
  }

- (void)_updateState:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView window](self, "window", a3));

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView window](self, "window"));
    -[TVMusicMotionView bounds](self, "bounds");
    -[TVMusicMotionView convertRect:toView:](self, "convertRect:toView:", v5);
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    -[TVMusicMotionView frame](self, "frame");
    double v15 = v14;
    -[TVMusicMotionView frame](self, "frame");
    -[TVMusicMotionView convertRect:toView:]( self,  "convertRect:toView:",  v5,  v15 * 0.4,  v16 * 0.4,  v15 * 0.2,  v16 * 0.2);
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    double v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    if ([v25 applicationState])
    {
      BOOL v26 = 0LL;
    }

    else
    {
      [v5 frame];
      v68.origin.x = v27;
      v68.origin.y = v28;
      v68.size.width = v29;
      v68.size.height = v30;
      v61.origin.x = v7;
      v61.origin.y = v9;
      v61.size.width = v11;
      v61.size.height = v13;
      BOOL v26 = CGRectIntersectsRect(v61, v68);
    }

    v62.origin.x = v18;
    v62.origin.y = v20;
    v62.size.width = v22;
    v62.size.height = v24;
    double MaxX = CGRectGetMaxX(v62);
    [v5 bounds];
    if (MaxX >= CGRectGetMaxX(v63))
    {
      BOOL v32 = 0;
    }

    else
    {
      v64.origin.x = v18;
      v64.origin.y = v20;
      v64.size.width = v22;
      v64.size.height = v24;
      BOOL v32 = CGRectGetMinX(v64) > 0.0;
    }

    v65.origin.x = v18;
    v65.origin.y = v20;
    v65.size.width = v22;
    v65.size.height = v24;
    double MaxY = CGRectGetMaxY(v65);
    [v5 bounds];
    if (MaxY >= CGRectGetMaxY(v66))
    {
      BOOL v34 = 0;
    }

    else
    {
      v67.origin.x = v18;
      v67.origin.y = v20;
      v67.size.width = v22;
      v67.size.height = v24;
      BOOL v34 = CGRectGetMinY(v67) > 0.0;
    }

    uint64_t v35 = v32 & v34;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView avPlayer](self, "avPlayer"));

    if (v36)
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView avPlayer](self, "avPlayer"));
      BOOL v38 = [v37 timeControlStatus] == 0;
    }

    else
    {
      BOOL v38 = 0;
    }

    -[TVMusicMotionView setIsInActiveRegion:](self, "setIsInActiveRegion:", v35);
    -[TVMusicMotionView setIsVisible:](self, "setIsVisible:", v26);
    if (v36) {
      BOOL v39 = 0;
    }
    else {
      BOOL v39 = v26;
    }
    if (v39)
    {
      id v40 = sub_10002AB60();
      v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
        sub_1001B9110(self);
      }

      -[TVMusicMotionView _showMotion](self, "_showMotion");
      goto LABEL_49;
    }

    if (v36) {
      char v42 = v26;
    }
    else {
      char v42 = 1;
    }
    if ((v42 & 1) == 0)
    {
      id v47 = sub_10002AB60();
      v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
        sub_1001B92F0(self);
      }

      -[TVMusicMotionView _hideMotion](self, "_hideMotion");
      goto LABEL_49;
    }

    if ((v35 & v38) == 1 && v36)
    {
      id v43 = sub_10002AB60();
      v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
        sub_1001B9278(self);
      }

      v45 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView avPlayer](self, "avPlayer"));
      v46 = v45;
      if (v45) {
        [v45 currentTime];
      }
      else {
        memset(&time1, 0, sizeof(time1));
      }
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView avPlayer](self, "avPlayer"));
      v53 = (void *)objc_claimAutoreleasedReturnValue([v52 currentItem]);
      v54 = v53;
      if (v53) {
        [v53 duration];
      }
      else {
        memset(&v59, 0, sizeof(v59));
      }
      int32_t v55 = CMTimeCompare(&time1, &v59);

      if ((v55 & 0x80000000) == 0)
      {
        id v56 = sub_10002AB60();
        v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG)) {
          sub_1001B9200(self);
        }

        v58 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView videoLooper](self, "videoLooper"));
        [v58 restartScenes];
      }

      v51 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicMotionView videoLooper]( self,  "videoLooper",  v59.value,  *(void *)&v59.timescale,  v59.epoch,  time1.value,  *(void *)&time1.timescale,  time1.epoch));
      [v51 playScenes];
    }

    else
    {
      id v49 = sub_10002AB60();
      v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
        sub_1001B9188(self);
      }

      v51 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView videoLooper](self, "videoLooper"));
      [v51 pauseScenes];
    }

LABEL_49:
  }

- (void)didMoveToWindow
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVMusicMotionView;
  -[TVMusicMotionView didMoveToWindow](&v5, "didMoveToWindow");
  if (!-[TVMusicMotionView isAlwaysActive](self, "isAlwaysActive"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView window](self, "window"));

    if (v3)
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIView tvm_focusedView](&OBJC_CLASS___UIView, "tvm_focusedView"));
      if (v4) {
        -[TVMusicMotionView _handleFocusForFocusedView:](self, "_handleFocusForFocusedView:", v4);
      }
      if (!-[TVMusicMotionView useFocusBasedActivation](self, "useFocusBasedActivation")) {
        -[TVMusicMotionView _createTimerForUpdates](self, "_createTimerForUpdates");
      }
    }

    else
    {
      -[TVMusicMotionView _hideMotion](self, "_hideMotion");
      -[TVMusicMotionView _destroyTimerForUpdates](self, "_destroyTimerForUpdates");
    }
  }

- (void)_createTimerForUpdates
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView timerForUpdates](self, "timerForUpdates"));

  if (!v3)
  {
    id v4 = sub_10002AB60();
    objc_super v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1001B9368(self);
    }

    double v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer timerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "timerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "_updateState:",  0LL,  1LL,  0.1));
    CGFloat v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
    [v7 addTimer:v6 forMode:NSRunLoopCommonModes];

    -[TVMusicMotionView setTimerForUpdates:](self, "setTimerForUpdates:", v6);
  }

- (void)_destroyTimerForUpdates
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView timerForUpdates](self, "timerForUpdates"));

  if (v3)
  {
    id v4 = sub_10002AB60();
    objc_super v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1001B93E0(self);
    }

    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView timerForUpdates](self, "timerForUpdates"));
    [v6 invalidate];

    -[TVMusicMotionView setTimerForUpdates:](self, "setTimerForUpdates:", 0LL);
  }

- (void)_prepareElementForReuse
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView stillImageView](self, "stillImageView"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView stillImageView](self, "stillImageView"));
    [v4 removeFromSuperview];

    -[TVMusicMotionView setStillImageView:](self, "setStillImageView:", 0LL);
  }

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView flippedImageView](self, "flippedImageView"));

  if (v5)
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView flippedImageView](self, "flippedImageView"));
    [v6 removeFromSuperview];

    -[TVMusicMotionView setFlippedImageView:](self, "setFlippedImageView:", 0LL);
  }

  -[TVMusicMotionView _destroyVideo](self, "_destroyVideo");
}

- (void)_ancestorWillUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVMusicMotionView;
  id v6 = a3;
  -[TVMusicMotionView _ancestorWillUpdateFocusInContext:withAnimationCoordinator:]( &v8,  "_ancestorWillUpdateFocusInContext:withAnimationCoordinator:",  v6,  a4);
  CGFloat v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextFocusedView", v8.receiver, v8.super_class));

  -[TVMusicMotionView _handleFocusForFocusedView:](self, "_handleFocusForFocusedView:", v7);
}

- (void)_handleFocusForFocusedView:(id)a3
{
  id v4 = a3;
  unsigned int v5 = -[TVMusicMotionView isAncestorFocused](self, "isAncestorFocused");
  id v6 = -[TVMusicMotionView isDescendantOfView:](self, "isDescendantOfView:", v4);

  -[TVMusicMotionView setAncestorFocused:](self, "setAncestorFocused:", v6);
  if (-[TVMusicMotionView useFocusBasedActivation](self, "useFocusBasedActivation"))
  {
    BOOL v7 = -[TVMusicMotionView isAncestorFocused](self, "isAncestorFocused");
    -[TVMusicMotionView setIsInActiveRegion:](self, "setIsInActiveRegion:", v7);
    -[TVMusicMotionView setIsVisible:](self, "setIsVisible:", v7);
    if (((!-[TVMusicMotionView isAncestorFocused](self, "isAncestorFocused") | v5) & 1) != 0)
    {
      if (!-[TVMusicMotionView isAncestorFocused](self, "isAncestorFocused") && ((v5 ^ 1) & 1) == 0) {
        -[TVMusicMotionView _hideMotion](self, "_hideMotion");
      }
    }

    else
    {
      -[TVMusicMotionView _showMotion](self, "_showMotion");
    }
  }

- (void)_startVideoPlayback
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView playerLayer](self, "playerLayer"));

  if (!v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView avPlayer](self, "avPlayer"));
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[AVPlayerLayer playerLayerWithPlayer:](&OBJC_CLASS___AVPlayerLayer, "playerLayerWithPlayer:", v4));

    -[TVMusicMotionView bounds](self, "bounds");
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    -[TVMusicMotionView videoHeight](self, "videoHeight");
    if (v14 > 0.0)
    {
      -[TVMusicMotionView videoHeight](self, "videoHeight");
      double v13 = v15;
    }

    objc_msgSend(v5, "setFrame:", v7, v9, v11, v13);
    if (-[TVMusicMotionView aspectFitVideo](self, "aspectFitVideo")) {
      [v5 setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    }
    double v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView layer](self, "layer"));
    [v16 insertSublayer:v5 atIndex:0];

    [v5 addObserver:self forKeyPath:@"readyForDisplay" options:0 context:0];
    -[TVMusicMotionView setPlayerLayer:](self, "setPlayerLayer:", v5);
    -[TVMusicMotionView videoHeight](self, "videoHeight");
    if (v17 > 0.0)
    {
      CGFloat v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView avPlayer](self, "avPlayer"));
      double v19 = (void *)objc_claimAutoreleasedReturnValue( +[AVPlayerLayer playerLayerWithPlayer:]( &OBJC_CLASS___AVPlayerLayer,  "playerLayerWithPlayer:",  v18));

      [v5 frame];
      objc_msgSend(v19, "setFrame:");
      if (-[TVMusicMotionView aspectFitVideo](self, "aspectFitVideo")) {
        [v19 setVideoGravity:AVLayerVideoGravityResizeAspectFill];
      }
      -[TVMusicMotionView videoHeight](self, "videoHeight");
      v22[1] = 0LL;
      v22[2] = 0LL;
      v22[0] = 0x3FF0000000000000LL;
      __int128 v23 = xmmword_1001E7E20;
      uint64_t v24 = v20;
      [v19 setAffineTransform:v22];
      double v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView layer](self, "layer"));
      [v21 insertSublayer:v19 atIndex:0];

      -[TVMusicMotionView setFlippedPlayerLayer:](self, "setFlippedPlayerLayer:", v19);
    }
  }

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView avPlayer](self, "avPlayer"));

  if (v8 == v7)
  {
    double v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView avPlayer](self, "avPlayer"));
    if ([v17 status] == (id)1)
    {
      unsigned int v18 = -[TVMusicMotionView isVisible](self, "isVisible");

      if (v18)
      {
        id v19 = sub_10002AB60();
        uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          sub_1001B9458(self);
        }

        -[TVMusicMotionView preferredResolution](self, "preferredResolution");
        double v22 = v21;
        double v24 = v23;
        double v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView avPlayer](self, "avPlayer"));
        BOOL v26 = (void *)objc_claimAutoreleasedReturnValue([v25 currentItem]);
        objc_msgSend(v26, "setPreferredMinimumResolution:", v22, v24);

        -[TVMusicMotionView _startVideoPlayback](self, "_startVideoPlayback");
        goto LABEL_22;
      }
    }

    else
    {
    }

    CGFloat v27 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView avPlayer](self, "avPlayer"));
    id v28 = [v27 status];

    if (v28 != (id)2) {
      goto LABEL_22;
    }
    id v29 = sub_10002AB60();
    double v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      CGFloat v30 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView motionURL](self, "motionURL"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView avPlayer](self, "avPlayer"));
      BOOL v32 = (void *)objc_claimAutoreleasedReturnValue([v31 error]);
      int v37 = 138412546;
      BOOL v38 = v30;
      __int16 v39 = 2112;
      id v40 = v32;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Could not load video from URL [%@]. Error: %@",  (uint8_t *)&v37,  0x16u);
    }

    goto LABEL_21;
  }

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView playerLayer](self, "playerLayer"));

  if (v9 != v7) {
    goto LABEL_22;
  }
  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView playerLayer](self, "playerLayer"));
  if ([v10 isReadyForDisplay])
  {
    unsigned int v11 = -[TVMusicMotionView isVisible](self, "isVisible");

    if (v11)
    {
      id v12 = sub_10002AB60();
      double v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        sub_1001B94D0(self);
      }

      -[TVMusicMotionView _animateStillImageToAlpha:completion:]( self,  "_animateStillImageToAlpha:completion:",  0LL,  0.0);
      double v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView avPlayer](self, "avPlayer"));
      if (!-[os_log_s timeControlStatus](v14, "timeControlStatus"))
      {
        unsigned int v15 = -[TVMusicMotionView isInActiveRegion](self, "isInActiveRegion");

        if (v15)
        {
          double v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView videoLooper](self, "videoLooper"));
          [v16 playScenes];
        }

        goto LABEL_22;
      }

- (void)_animateStillImageToAlpha:(double)a3 completion:(id)a4
{
}

- (void)_animateStillImageToAlpha:(double)a3 duration:(double)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView stillImageView](self, "stillImageView"));
  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView flippedImageView](self, "flippedImageView"));
  if (v9)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10002C158;
    v13[3] = &unk_100269EF8;
    id v14 = v9;
    double v16 = a3;
    id v15 = v10;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10002C188;
    v11[3] = &unk_100269590;
    id v12 = v8;
    +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  0LL,  v13,  v11,  a4,  0.0);
  }

  else if (v8)
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0LL);
  }
}

- (void)_createVideoWithAudioSession:(id)a3
{
  id v4 = a3;
  id v5 = sub_10002AB60();
  double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1001B9548(self);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView motionURL](self, "motionURL"));
  double v22 = AVURLAssetPreferPreciseDurationAndTimingKey;
  double v23 = &__kCFBooleanTrue;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[AVURLAsset URLAssetWithURL:options:](&OBJC_CLASS___AVURLAsset, "URLAssetWithURL:options:", v7, v8));

  double v10 = -[MPCScriptedLooper initWithAsset:](objc_alloc(&OBJC_CLASS___MPCScriptedLooper), "initWithAsset:", v9);
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[MPCScriptedLooper player](v10, "player"));
  [v11 setMuted:1];
  [v11 setPreventsDisplaySleepDuringVideoPlayback:0];
  [v11 setAudioSession:v4];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10002C430;
  v18[3] = &unk_100268B30;
  id v12 = v9;
  id v19 = v12;
  id v13 = v11;
  id v20 = v13;
  id v14 = objc_retainBlock(v18);
  if ([v12 statusOfValueForKey:@"availableMediaCharacteristicsWithMediaSelectionOptions" error:0] == (id)2)
  {
    ((void (*)(void *))v14[2])(v14);
  }

  else
  {
    double v21 = @"availableMediaCharacteristicsWithMediaSelectionOptions";
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10002C498;
    v16[3] = &unk_100268D60;
    double v17 = v14;
    [v12 loadValuesAsynchronouslyForKeys:v15 completionHandler:v16];
  }

  -[TVMusicMotionView setVideoLooper:](self, "setVideoLooper:", v10);
  -[TVMusicMotionView setAvPlayer:](self, "setAvPlayer:", v13);
  [v13 addObserver:self forKeyPath:@"status" options:0 context:0];
}

- (void)_createVideo
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMotionAudioSessionManager sharedManager]( &OBJC_CLASS____TtC7TVMusic32TVMusicMotionAudioSessionManager,  "sharedManager"));
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10002C5FC;
  v3[3] = &unk_100269F20;
  objc_copyWeak(&v4, &location);
  [v2 getSession:v3];

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_destroyVideo
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView playerLayer](self, "playerLayer"));

  if (v3)
  {
    id v4 = sub_10002AB60();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1001B96B0(self);
    }

    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView playerLayer](self, "playerLayer"));
    [v6 removeObserver:self forKeyPath:@"readyForDisplay"];

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView playerLayer](self, "playerLayer"));
    [v7 removeFromSuperlayer];

    -[TVMusicMotionView setPlayerLayer:](self, "setPlayerLayer:", 0LL);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView flippedPlayerLayer](self, "flippedPlayerLayer"));

  if (v8)
  {
    id v9 = sub_10002AB60();
    double v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_1001B9638(self);
    }

    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView flippedPlayerLayer](self, "flippedPlayerLayer"));
    [v11 removeFromSuperlayer];

    -[TVMusicMotionView setFlippedPlayerLayer:](self, "setFlippedPlayerLayer:", 0LL);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView avPlayer](self, "avPlayer"));

  if (v12)
  {
    id v13 = sub_10002AB60();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_1001B95C0(self);
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView avPlayer](self, "avPlayer"));
    [v15 removeObserver:self forKeyPath:@"status"];

    -[TVMusicMotionView setVideoLooper:](self, "setVideoLooper:", 0LL);
    -[TVMusicMotionView setAvPlayer:](self, "setAvPlayer:", 0LL);
  }

- (void)_hideMotion
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView playerLayer](self, "playerLayer"));

  if (v3)
  {
    id v4 = sub_10002AB60();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1001B9728(self);
    }

    objc_initWeak(&location, self);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10002CA5C;
    v7[3] = &unk_100269F48;
    objc_copyWeak(&v8, &location);
    -[TVMusicMotionView _animateStillImageToAlpha:completion:](self, "_animateStillImageToAlpha:completion:", v7, 1.0);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

  else
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView avPlayer](self, "avPlayer"));

    if (v6) {
      -[TVMusicMotionView _destroyVideo](self, "_destroyVideo");
    }
  }

- (void)_showMotion
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView avPlayer](self, "avPlayer"));

  if (v3)
  {
    id v4 = sub_10002AB60();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      double v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView elementID](self, "elementID"));
      int v8 = 138412290;
      id v9 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "_showMotion has to destroy old video. id=%@",  (uint8_t *)&v8,  0xCu);
    }

    -[TVMusicMotionView _destroyVideo](self, "_destroyVideo");
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView motionURL](self, "motionURL"));

  if (v7) {
    -[TVMusicMotionView _createVideo](self, "_createVideo");
  }
}

- (void)_seekToStartWithCompletion:(id)a3
{
  id v4 = a3;
  CMTime v20 = kCMTimeZero;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView videoLooper](self, "videoLooper"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 sceneCollection]);

  if (v6)
  {
    [v6 frameRate];
    if (v7 != 0.0)
    {
      int v8 = (void *)objc_claimAutoreleasedReturnValue([v6 scenes]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 firstObject]);
      id v10 = [v9 startFrame];

      [v6 frameRate];
      CMTimeMake(&v20, (uint64_t)((double)(uint64_t)v10 * 1000.0 / v11), 1000);
    }
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView avPlayer](self, "avPlayer"));
  id v13 = v12;
  if (v12) {
    [v12 currentTime];
  }
  else {
    memset(&time1, 0, sizeof(time1));
  }
  CMTime time2 = v20;
  int32_t v14 = CMTimeCompare(&time1, &time2);

  if (v14)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView avPlayer](self, "avPlayer"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10002CD4C;
    v16[3] = &unk_100269590;
    id v17 = v4;
    CMTime time2 = v20;
    [v15 seekToTime:&time2 completionHandler:v16];
  }

  else if (v4)
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1LL);
  }
}

- (void)seekToStartWithCrossfadeDuration:(double)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10002CE1C;
  v5[3] = &unk_100269F48;
  objc_copyWeak(&v6, &location);
  -[TVMusicMotionView _animateStillImageToAlpha:duration:completion:]( self,  "_animateStillImageToAlpha:duration:completion:",  v5,  1.0,  a3);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)playFromStart
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10002CEF4;
  v3[3] = &unk_100269F48;
  objc_copyWeak(&v4, &location);
  -[TVMusicMotionView _seekToStartWithCompletion:](self, "_seekToStartWithCompletion:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)pause
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView videoLooper](self, "videoLooper"));
  [v2 pauseScenes];
}

- (void)play
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicMotionView videoLooper](self, "videoLooper"));
  [v2 playScenes];
}

- (MPCScriptedLooper)videoLooper
{
  return self->_videoLooper;
}

- (void)setVideoLooper:(id)a3
{
}

- (AVPlayer)avPlayer
{
  return self->_avPlayer;
}

- (void)setAvPlayer:(id)a3
{
}

- (NSURL)motionURL
{
  return self->_motionURL;
}

- (void)setMotionURL:(id)a3
{
}

- (UIView)stillImageView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_stillImageView);
}

- (void)setStillImageView:(id)a3
{
}

- (UIView)flippedImageView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_flippedImageView);
}

- (void)setFlippedImageView:(id)a3
{
}

- (AVPlayerLayer)playerLayer
{
  return (AVPlayerLayer *)objc_loadWeakRetained((id *)&self->_playerLayer);
}

- (void)setPlayerLayer:(id)a3
{
}

- (AVPlayerLayer)flippedPlayerLayer
{
  return (AVPlayerLayer *)objc_loadWeakRetained((id *)&self->_flippedPlayerLayer);
}

- (void)setFlippedPlayerLayer:(id)a3
{
}

- (BOOL)isAncestorFocused
{
  return self->_ancestorFocused;
}

- (void)setAncestorFocused:(BOOL)a3
{
  self->_ancestorFocused = a3;
}

- (NSString)elementID
{
  return self->_elementID;
}

- (void)setElementID:(id)a3
{
}

- (BOOL)aspectFitVideo
{
  return self->_aspectFitVideo;
}

- (void)setAspectFitVideo:(BOOL)a3
{
  self->_aspectFitVideo = a3;
}

- (double)videoHeight
{
  return self->_videoHeight;
}

- (void)setVideoHeight:(double)a3
{
  self->_videoHeight = a3;
}

- (NSTimer)timerForUpdates
{
  return (NSTimer *)objc_loadWeakRetained((id *)&self->_timerForUpdates);
}

- (void)setTimerForUpdates:(id)a3
{
}

- (BOOL)isInActiveRegion
{
  return self->_isInActiveRegion;
}

- (void)setIsInActiveRegion:(BOOL)a3
{
  self->_isInActiveRegion = a3;
}

- (BOOL)isVisible
{
  return self->_isVisible;
}

- (void)setIsVisible:(BOOL)a3
{
  self->_isVisible = a3;
}

- (BOOL)useFocusBasedActivation
{
  return self->_useFocusBasedActivation;
}

- (void)setUseFocusBasedActivation:(BOOL)a3
{
  self->_useFocusBasedActivation = a3;
}

- (BOOL)isAlwaysActive
{
  return self->_alwaysActive;
}

- (void)setAlwaysActive:(BOOL)a3
{
  self->_alwaysActive = a3;
}

- (BOOL)wasPausedWhenAppResignedActive
{
  return self->_pausedWhenAppResignedActive;
}

- (void)setPausedWhenAppResignedActive:(BOOL)a3
{
  self->_pausedWhenAppResignedActive = a3;
}

- (CGSize)preferredResolution
{
  double width = self->_preferredResolution.width;
  double height = self->_preferredResolution.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreferredResolution:(CGSize)a3
{
  self->_preferredResolution = a3;
}

- (void).cxx_destruct
{
}

@end