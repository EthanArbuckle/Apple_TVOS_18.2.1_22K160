@interface _TVMusicConstantRatePlaybackProgressAnimation
- (BOOL)isFinished;
- (TVConstantRatePlaybackProgressAnimationDelegate)delegate;
- (double)currentPlaybackTime;
- (void)setDelegate:(id)a3;
@end

@implementation _TVMusicConstantRatePlaybackProgressAnimation

- (double)currentPlaybackTime
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_TVMusicConstantRatePlaybackProgressAnimation delegate](self, "delegate"));
  unsigned int v4 = [v3 _getActualTime:&v7];

  if (v4) {
    return v7;
  }
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____TVMusicConstantRatePlaybackProgressAnimation;
  -[TVMusicPlaybackProgressAnimation currentPlaybackTime](&v6, "currentPlaybackTime");
  return result;
}

- (BOOL)isFinished
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_TVMusicConstantRatePlaybackProgressAnimation delegate](self, "delegate"));
  [v2 effectivePlaybackRate];
  BOOL v4 = v3 == 0.0;

  return v4;
}

- (TVConstantRatePlaybackProgressAnimationDelegate)delegate
{
  return (TVConstantRatePlaybackProgressAnimationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end