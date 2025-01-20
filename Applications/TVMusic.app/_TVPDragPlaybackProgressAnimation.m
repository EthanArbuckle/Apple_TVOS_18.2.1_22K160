@interface _TVPDragPlaybackProgressAnimation
- (BOOL)isFinished;
- (TVDragPlaybackProgressAnimationDelegate)delegate;
- (double)currentPlaybackTime;
- (void)setDelegate:(id)a3;
@end

@implementation _TVPDragPlaybackProgressAnimation

- (double)currentPlaybackTime
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_TVPDragPlaybackProgressAnimation delegate](self, "delegate"));
  unsigned int v4 = [v3 _getActualTime:&v7];

  if (v4) {
    return v7;
  }
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____TVPDragPlaybackProgressAnimation;
  -[TVMusicPlaybackProgressAnimation currentPlaybackTime](&v6, "currentPlaybackTime");
  return result;
}

- (BOOL)isFinished
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_TVPDragPlaybackProgressAnimation delegate](self, "delegate"));
  char v3 = [v2 isDragging] ^ 1;

  return v3;
}

- (TVDragPlaybackProgressAnimationDelegate)delegate
{
  return (TVDragPlaybackProgressAnimationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end