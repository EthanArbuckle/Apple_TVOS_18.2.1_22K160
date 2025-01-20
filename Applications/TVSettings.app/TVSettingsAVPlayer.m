@interface TVSettingsAVPlayer
+ (Class)layerClass;
- (AVPlayerItem)playerItem;
- (AVPlayerLooper)looper;
- (AVQueuePlayer)queuePlayer;
- (NSArray)observerTokens;
- (NSURL)url;
- (UIView)fadeView;
- (double)fadeDuration;
- (float)playRate;
- (void)_addBoundaryTimeObservers;
- (void)_removeBoundaryTimeObservers;
- (void)dealloc;
- (void)playInLoopWithRate:(float)playRate crossfadeDuration:(double)a4;
- (void)setUrl:(id)a3;
@end

@implementation TVSettingsAVPlayer

+ (Class)layerClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___AVPlayerLayer);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSettingsAVPlayer;
  -[TVSettingsAVPlayer dealloc](&v3, "dealloc");
}

- (void)setUrl:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000C811C();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Setting URL: %@", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
  id v18 = 0LL;
  [v7 setCategory:AVAudioSessionCategoryPlayback withOptions:1 error:&v18];
  id v8 = v18;

  if (v8)
  {
    id v9 = sub_1000C811C();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000FB3D4(v8, v10);
    }
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAVPlayer layer](self, "layer"));
  [v11 setVideoGravity:AVLayerVideoGravityResizeAspectFill];
  v12 = (AVPlayerItem *)objc_claimAutoreleasedReturnValue(+[AVPlayerItem playerItemWithURL:](&OBJC_CLASS___AVPlayerItem, "playerItemWithURL:", v4));
  playerItem = self->_playerItem;
  self->_playerItem = v12;

  v14 = (AVQueuePlayer *)objc_claimAutoreleasedReturnValue( +[AVQueuePlayer playerWithPlayerItem:]( &OBJC_CLASS___AVQueuePlayer,  "playerWithPlayerItem:",  self->_playerItem));
  queuePlayer = self->_queuePlayer;
  self->_queuePlayer = v14;

  -[AVQueuePlayer setPreventsDisplaySleepDuringVideoPlayback:]( self->_queuePlayer,  "setPreventsDisplaySleepDuringVideoPlayback:",  1LL);
  v16 = (AVPlayerLooper *)objc_claimAutoreleasedReturnValue( +[AVPlayerLooper playerLooperWithPlayer:templateItem:]( &OBJC_CLASS___AVPlayerLooper,  "playerLooperWithPlayer:templateItem:",  self->_queuePlayer,  self->_playerItem));
  looper = self->_looper;
  self->_looper = v16;

  [v11 setPlayer:self->_queuePlayer];
}

- (void)playInLoopWithRate:(float)playRate crossfadeDuration:(double)a4
{
  self->_double fadeDuration = a4;
  self->_playRate = playRate;
  if (a4 > 0.0)
  {
    id v5 = sub_1000C811C();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      double fadeDuration = self->_fadeDuration;
      int v12 = 134217984;
      double v13 = fadeDuration;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Fade duration set: %f", (uint8_t *)&v12, 0xCu);
    }

    -[UIView removeFromSuperview](self->_fadeView, "removeFromSuperview");
    id v8 = objc_alloc(&OBJC_CLASS___UIView);
    -[TVSettingsAVPlayer bounds](self, "bounds");
    id v9 = -[UIView initWithFrame:](v8, "initWithFrame:");
    fadeView = self->_fadeView;
    self->_fadeView = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    -[UIView setBackgroundColor:](self->_fadeView, "setBackgroundColor:", v11);

    -[UIView setAlpha:](self->_fadeView, "setAlpha:", 0.0);
    -[TVSettingsAVPlayer addSubview:](self, "addSubview:", self->_fadeView);
    -[TVSettingsAVPlayer _addBoundaryTimeObservers](self, "_addBoundaryTimeObservers");
    playRate = self->_playRate;
  }

  -[AVQueuePlayer playImmediatelyAtRate:](self->_queuePlayer, "playImmediatelyAtRate:", *(double *)&playRate);
}

- (void)_addBoundaryTimeObservers
{
  if (self->_queuePlayer)
  {
    -[TVSettingsAVPlayer _removeBoundaryTimeObservers](self, "_removeBoundaryTimeObservers");
    playerItem = self->_playerItem;
    if (playerItem) {
      -[AVPlayerItem duration](playerItem, "duration");
    }
    else {
      memset(&v29, 0, sizeof(v29));
    }
    CMTimeMakeWithSeconds(&v28, self->_fadeDuration * self->_playRate * 0.5, 1000);
    CMTime lhs = v29;
    CMTime rhs = v28;
    CMTimeSubtract(&v27, &lhs, &rhs);
    v6 = self->_fadeView;
    v7 = self->_queuePlayer;
    double v8 = self->_fadeDuration / self->_playRate * 0.5;
    id v9 = sub_1000C811C();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      CMTime lhs = v29;
      Float64 Seconds = CMTimeGetSeconds(&lhs);
      CMTime lhs = v28;
      Float64 v12 = CMTimeGetSeconds(&lhs);
      CMTime lhs = v27;
      Float64 v13 = CMTimeGetSeconds(&lhs);
      LODWORD(lhs.value) = 134218496;
      *(Float64 *)((char *)&lhs.value + 4) = Seconds;
      LOWORD(lhs.flags) = 2048;
      *(Float64 *)((char *)&lhs.flags + 2) = v12;
      HIWORD(lhs.epoch) = 2048;
      Float64 v33 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Setting up video boundry observers: totalDuration=%f, fadeDuration=%f, endTime=%f",  (uint8_t *)&lhs,  0x20u);
    }

    queuePlayer = self->_queuePlayer;
    CMTime lhs = v27;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCMTime:](&OBJC_CLASS___NSValue, "valueWithCMTime:", &lhs));
    v31 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v31, 1LL));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1000C85E4;
    v22[3] = &unk_100193FF8;
    double v25 = v8;
    v23 = v7;
    v24 = v6;
    v17 = v6;
    id v18 = v7;
    v19 = (void *)objc_claimAutoreleasedReturnValue( -[AVQueuePlayer addBoundaryTimeObserverForTimes:queue:usingBlock:]( queuePlayer,  "addBoundaryTimeObserverForTimes:queue:usingBlock:",  v16,  0LL,  v22));

    v30 = v19;
    id v20 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v30, 1LL));
    observerTokens = self->_observerTokens;
    self->_observerTokens = v20;
  }

  else
  {
    id v4 = sub_1000C811C();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000FB468(v5);
    }
  }

- (void)_removeBoundaryTimeObservers
{
  observerTokens = self->_observerTokens;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000C8918;
  v3[3] = &unk_100194020;
  v3[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](observerTokens, "enumerateObjectsUsingBlock:", v3);
}

- (NSURL)url
{
  return self->_url;
}

- (AVQueuePlayer)queuePlayer
{
  return self->_queuePlayer;
}

- (AVPlayerItem)playerItem
{
  return self->_playerItem;
}

- (AVPlayerLooper)looper
{
  return self->_looper;
}

- (UIView)fadeView
{
  return self->_fadeView;
}

- (double)fadeDuration
{
  return self->_fadeDuration;
}

- (float)playRate
{
  return self->_playRate;
}

- (NSArray)observerTokens
{
  return self->_observerTokens;
}

- (void).cxx_destruct
{
}

@end