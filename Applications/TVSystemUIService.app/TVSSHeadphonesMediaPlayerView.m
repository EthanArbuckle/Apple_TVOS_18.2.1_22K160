@interface TVSSHeadphonesMediaPlayerView
+ (Class)layerClass;
- (AVPlayer)avPlayer;
- (BOOL)moviePlayed;
- (id)playerLayer;
- (void)pauseMovie;
- (void)resetMovie;
- (void)setAvPlayer:(id)a3;
- (void)startMovie;
@end

@implementation TVSSHeadphonesMediaPlayerView

+ (Class)layerClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___AVPlayerLayer);
}

- (id)playerLayer
{
  return -[TVSSHeadphonesMediaPlayerView layer](self, "layer", a2, self);
}

- (AVPlayer)avPlayer
{
  id v3 = -[TVSSHeadphonesMediaPlayerView playerLayer](self, "playerLayer");
  id v4 = [v3 player];

  return (AVPlayer *)v4;
}

- (void)setAvPlayer:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = -[TVSSHeadphonesMediaPlayerView playerLayer](v5, "playerLayer");
  [v3 setPlayer:location[0]];

  objc_storeStrong(location, 0LL);
}

- (void)startMovie
{
  v2 = -[TVSSHeadphonesMediaPlayerView avPlayer](self, "avPlayer");
  -[AVPlayer play](v2, "play");
}

- (void)pauseMovie
{
  v2 = -[TVSSHeadphonesMediaPlayerView avPlayer](self, "avPlayer");
  -[AVPlayer pause](v2, "pause");
}

- (void)resetMovie
{
  v6 = self;
  SEL v5 = a2;
  v2 = -[TVSSHeadphonesMediaPlayerView avPlayer](self, "avPlayer");
  __int128 v3 = *(_OWORD *)&kCMTimeZero.value;
  CMTimeEpoch epoch = kCMTimeZero.epoch;
  -[AVPlayer seekToTime:](v2, "seekToTime:", &v3);
}

- (BOOL)moviePlayed
{
  return self->_moviePlayed;
}

@end