@interface TVNPSpatialAudioTutorialPlayerView
+ (Class)layerClass;
- (AVPlayerLooper)looper;
- (AVQueuePlayer)player;
- (void)setLooper:(id)a3;
- (void)setPlayer:(id)a3;
@end

@implementation TVNPSpatialAudioTutorialPlayerView

- (AVQueuePlayer)player
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVNPSpatialAudioTutorialPlayerView playerLayer](self, "playerLayer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 player]);

  return (AVQueuePlayer *)v3;
}

- (void)setPlayer:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVNPSpatialAudioTutorialPlayerView playerLayer](self, "playerLayer"));
  [v5 setPlayer:v4];
}

+ (Class)layerClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___AVPlayerLayer);
}

- (AVPlayerLooper)looper
{
  return self->_looper;
}

- (void)setLooper:(id)a3
{
}

- (void).cxx_destruct
{
}

@end