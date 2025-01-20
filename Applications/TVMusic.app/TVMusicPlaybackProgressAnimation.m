@interface TVMusicPlaybackProgressAnimation
+ (void)initialize;
- (BOOL)isFinished;
- (CAMediaTimingFunction)mediaTimingFunction;
- (NSDate)animationStartDate;
- (NSDate)currentDate;
- (double)animationDuration;
- (double)currentPlaybackTime;
- (double)fromPlaybackTime;
- (double)toPlaybackTime;
- (void)setAnimationDuration:(double)a3;
- (void)setAnimationStartDate:(id)a3;
- (void)setCurrentDate:(id)a3;
- (void)setFromPlaybackTime:(double)a3;
- (void)setMediaTimingFunction:(id)a3;
- (void)setToPlaybackTime:(double)a3;
@end

@implementation TVMusicPlaybackProgressAnimation

+ (void)initialize
{
  if (qword_1002BE8E8 != -1) {
    dispatch_once(&qword_1002BE8E8, &stru_10026AF48);
  }
}

- (double)currentPlaybackTime
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackProgressAnimation currentDate](self, "currentDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackProgressAnimation animationStartDate](self, "animationStartDate"));
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  -[TVMusicPlaybackProgressAnimation animationDuration](self, "animationDuration");
  if (v7 <= 0.0)
  {
    -[TVMusicPlaybackProgressAnimation toPlaybackTime](self, "toPlaybackTime");
    double v17 = v18;
  }

  else
  {
    -[TVMusicPlaybackProgressAnimation animationDuration](self, "animationDuration");
    *(float *)&double v8 = v6 / v8;
    float v9 = fmin(fmax(*(float *)&v8, 0.0), 1.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackProgressAnimation mediaTimingFunction](self, "mediaTimingFunction"));
    *(float *)&double v11 = v9;
    [v10 _solveForInput:v11];
    float v13 = v12;

    -[TVMusicPlaybackProgressAnimation fromPlaybackTime](self, "fromPlaybackTime");
    double v15 = v14;
    -[TVMusicPlaybackProgressAnimation toPlaybackTime](self, "toPlaybackTime");
    double v17 = v15 + v13 * (v16 - v15);
  }

  return v17;
}

- (BOOL)isFinished
{
  if (v3 <= 0.0) {
    return 1;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackProgressAnimation animationStartDate](self, "animationStartDate"));
  -[TVMusicPlaybackProgressAnimation animationDuration](self, "animationDuration");
  double v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateByAddingTimeInterval:"));

  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackProgressAnimation currentDate](self, "currentDate"));
  id v7 = [v6 compare:v5];
  BOOL v9 = (unint64_t)v7 + 1 > 2 || (((unint64_t)v7 + 1) & 7) == 2;

  return v9;
}

- (NSDate)animationStartDate
{
  return self->_animationStartDate;
}

- (void)setAnimationStartDate:(id)a3
{
}

- (double)animationDuration
{
  return self->_animationDuration;
}

- (void)setAnimationDuration:(double)a3
{
  self->_animationDuration = a3;
}

- (double)fromPlaybackTime
{
  return self->_fromPlaybackTime;
}

- (void)setFromPlaybackTime:(double)a3
{
  self->_fromPlaybackTime = a3;
}

- (double)toPlaybackTime
{
  return self->_toPlaybackTime;
}

- (void)setToPlaybackTime:(double)a3
{
  self->_toPlaybackTime = a3;
}

- (CAMediaTimingFunction)mediaTimingFunction
{
  return self->_mediaTimingFunction;
}

- (void)setMediaTimingFunction:(id)a3
{
  self->_mediaTimingFunction = (CAMediaTimingFunction *)a3;
}

- (NSDate)currentDate
{
  return self->_currentDate;
}

- (void)setCurrentDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end