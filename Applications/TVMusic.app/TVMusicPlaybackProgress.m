@interface TVMusicPlaybackProgress
- (NSString)currentTitle;
- (NSString)firstTitle;
- (NSString)lastTitle;
- (TVMusicPlaybackProgress)init;
- (double)progress;
- (void)setCurrentTitle:(id)a3;
- (void)setFirstTitle:(id)a3;
- (void)setLastTitle:(id)a3;
- (void)setProgress:(double)a3;
@end

@implementation TVMusicPlaybackProgress

- (TVMusicPlaybackProgress)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVMusicPlaybackProgress;
  result = -[TVMusicPlaybackProgress init](&v3, "init");
  if (result) {
    result->_progress = NAN;
  }
  return result;
}

- (NSString)firstTitle
{
  return self->_firstTitle;
}

- (void)setFirstTitle:(id)a3
{
}

- (NSString)currentTitle
{
  return self->_currentTitle;
}

- (void)setCurrentTitle:(id)a3
{
}

- (NSString)lastTitle
{
  return self->_lastTitle;
}

- (void)setLastTitle:(id)a3
{
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (void).cxx_destruct
{
}

@end