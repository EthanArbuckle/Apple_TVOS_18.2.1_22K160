@interface BTMediaPlayerView
+ (Class)layerClass;
- (AVPlayer)avPlayer;
- (id)playerLayer;
- (void)loadMovieLoopWithPath:(id)a3 bannerInstance:(id)a4;
- (void)setAvPlayer:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation BTMediaPlayerView

+ (Class)layerClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___AVPlayerLayer, a2);
}

- (id)playerLayer
{
  return -[BTMediaPlayerView layer](self, "layer");
}

- (AVPlayer)avPlayer
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BTMediaPlayerView playerLayer](self, "playerLayer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 player]);

  return (AVPlayer *)v3;
}

- (void)setAvPlayer:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[BTMediaPlayerView playerLayer](self, "playerLayer"));
  [v5 setPlayer:v4];
}

- (void)loadMovieLoopWithPath:(id)a3 bannerInstance:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_autoreleasePoolPush();
  v24[0] = 0LL;
  v24[1] = v24;
  v24[2] = 0x3032000000LL;
  v24[3] = sub_100008088;
  v24[4] = sub_100008098;
  id v25 = 0LL;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v6, 0LL));
  v10 = (AVPlayerItem *)objc_claimAutoreleasedReturnValue(+[AVPlayerItem playerItemWithURL:](&OBJC_CLASS___AVPlayerItem, "playerItemWithURL:", v9));
  playerItem = self->_playerItem;
  self->_playerItem = v10;

  v12 = objc_alloc_init(&OBJC_CLASS___AVPlayer);
  -[BTMediaPlayerView setAvPlayer:](self, "setAvPlayer:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BTMediaPlayerView avPlayer](self, "avPlayer"));
  [v13 _setParticipatesInAudioSession:0];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[AVPlayerItem asset](self->_playerItem, "asset"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000080A0;
  v20[3] = &unk_10000C518;
  id v15 = v14;
  v22 = self;
  v23 = v24;
  id v21 = v15;
  [v15 loadValuesAsynchronouslyForKeys:&off_10000C8C8 completionHandler:v20];
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BTMediaPlayerView avPlayer](self, "avPlayer"));
  [v16 replaceCurrentItemWithPlayerItem:self->_playerItem];

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BTMediaPlayerView avPlayer](self, "avPlayer"));
  [v17 setAudiovisualBackgroundPlaybackPolicy:3];

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BTMediaPlayerView playerLayer](self, "playerLayer"));
  [v18 setHidden:0];

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BTMediaPlayerView avPlayer](self, "avPlayer"));
  [v19 play];

  _Block_object_dispose(v24, 8);
  objc_autoreleasePoolPop(v8);
}

- (void)start
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[BTMediaPlayerView avPlayer](self, "avPlayer"));
  [v2 play];
}

- (void)stop
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BTMediaPlayerView avPlayer](self, "avPlayer"));
  [v3 pause];

  -[BTMediaPlayerView setAvPlayer:](self, "setAvPlayer:", 0LL);
  avLooper = self->_avLooper;
  self->_avLooper = 0LL;

  playerItem = self->_playerItem;
  self->_playerItem = 0LL;
}

- (void).cxx_destruct
{
}

@end