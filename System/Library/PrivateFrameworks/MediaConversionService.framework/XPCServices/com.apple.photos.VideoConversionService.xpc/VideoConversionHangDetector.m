@interface VideoConversionHangDetector
- (BOOL)didDetectHang;
- (NSDate)lastProgressTimestamp;
- (VideoConversionHangDetector)initWithThresholdTimeInterval:(double)a3;
- (double)hangDetectionThresholdTimeInterval;
- (double)lastProgress;
- (double)progressUnchangedTimeInterval;
- (void)setHangDetectionThresholdTimeInterval:(double)a3;
- (void)setLastProgress:(double)a3;
- (void)setLastProgressTimestamp:(id)a3;
- (void)setProgressUnchangedTimeInterval:(double)a3;
- (void)updateCurrentProgress:(double)a3;
@end

@implementation VideoConversionHangDetector

- (VideoConversionHangDetector)initWithThresholdTimeInterval:(double)a3
{
  if (a3 <= 0.0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v7 handleFailureInMethod:a2, self, @"VideoConversionService.m", 52, @"Invalid parameter not satisfying: %@", @"thresholdTimeInterval > 0" object file lineNumber description];
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___VideoConversionHangDetector;
  result = -[VideoConversionHangDetector init](&v8, "init");
  if (result) {
    result->_hangDetectionThresholdTimeInterval = a3;
  }
  return result;
}

- (void)updateCurrentProgress:(double)a3
{
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v6 = v5;
  lastProgressTimestamp = self->_lastProgressTimestamp;
  if (lastProgressTimestamp && self->_lastProgress >= a3)
  {
    -[NSDate timeIntervalSinceDate:](v5, "timeIntervalSinceDate:");
    self->_progressUnchangedTimeInterval = v8 + self->_progressUnchangedTimeInterval;
    lastProgressTimestamp = self->_lastProgressTimestamp;
  }

  else
  {
    self->_progressUnchangedTimeInterval = 0.0;
  }

  self->_lastProgressTimestamp = v6;

  self->_lastProgress = a3;
}

- (BOOL)didDetectHang
{
  return self->_progressUnchangedTimeInterval > self->_hangDetectionThresholdTimeInterval;
}

- (NSDate)lastProgressTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setLastProgressTimestamp:(id)a3
{
}

- (double)progressUnchangedTimeInterval
{
  return self->_progressUnchangedTimeInterval;
}

- (void)setProgressUnchangedTimeInterval:(double)a3
{
  self->_progressUnchangedTimeInterval = a3;
}

- (double)hangDetectionThresholdTimeInterval
{
  return self->_hangDetectionThresholdTimeInterval;
}

- (void)setHangDetectionThresholdTimeInterval:(double)a3
{
  self->_hangDetectionThresholdTimeInterval = a3;
}

- (double)lastProgress
{
  return self->_lastProgress;
}

- (void)setLastProgress:(double)a3
{
  self->_lastProgress = a3;
}

- (void).cxx_destruct
{
}

@end