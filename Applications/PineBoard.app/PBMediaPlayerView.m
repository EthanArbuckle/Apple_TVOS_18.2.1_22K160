@interface PBMediaPlayerView
+ (Class)layerClass;
- (AVQueuePlayer)avPlayer;
- (id)playerLayer;
- (void)loadMovieLoopWithPath:(id)a3;
- (void)setAvPlayer:(id)a3;
- (void)stop;
@end

@implementation PBMediaPlayerView

+ (Class)layerClass
{
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___AVPlayerLayer);
  return (Class)(id)objc_claimAutoreleasedReturnValue(v2);
}

- (id)playerLayer
{
  return (id)objc_claimAutoreleasedReturnValue(-[PBMediaPlayerView layer](self, "layer"));
}

- (AVQueuePlayer)avPlayer
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBMediaPlayerView playerLayer](self, "playerLayer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 player]);

  return (AVQueuePlayer *)v3;
}

- (void)setAvPlayer:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBMediaPlayerView playerLayer](self, "playerLayer"));
  [v5 setPlayer:v4];
}

- (void)loadMovieLoopWithPath:(id)a3
{
  id v4 = a3;
  v5 = objc_autoreleasePoolPush();
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v4, 0LL));
  v7 = (AVPlayerItem *)objc_claimAutoreleasedReturnValue(+[AVPlayerItem playerItemWithURL:](&OBJC_CLASS___AVPlayerItem, "playerItemWithURL:", v6));
  playerItem = self->_playerItem;
  self->_playerItem = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBMediaPlayerView avPlayer](self, "avPlayer"));
  v10 = (AVPlayerLooper *)objc_claimAutoreleasedReturnValue( +[AVPlayerLooper playerLooperWithPlayer:templateItem:]( &OBJC_CLASS___AVPlayerLooper,  "playerLooperWithPlayer:templateItem:",  v9,  self->_playerItem));
  avLooper = self->_avLooper;
  self->_avLooper = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBMediaPlayerView avPlayer](self, "avPlayer"));
  [v12 _setParticipatesInAudioSession:0];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PBMediaPlayerView avPlayer](self, "avPlayer"));
  [v13 setAudiovisualBackgroundPlaybackPolicy:3];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PBMediaPlayerView playerLayer](self, "playerLayer"));
  [v14 setHidden:0];

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PBMediaPlayerView avPlayer](self, "avPlayer"));
  [v15 play];

  objc_autoreleasePoolPop(v5);
}

- (void)stop
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBMediaPlayerView avPlayer](self, "avPlayer"));
  [v3 pause];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBMediaPlayerView avPlayer](self, "avPlayer"));
  [v4 removeAllItems];

  -[PBMediaPlayerView setAvPlayer:](self, "setAvPlayer:", 0LL);
  avLooper = self->_avLooper;
  self->_avLooper = 0LL;

  playerItem = self->_playerItem;
  self->_playerItem = 0LL;
}

- (void).cxx_destruct
{
}

@end