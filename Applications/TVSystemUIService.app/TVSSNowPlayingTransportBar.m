@interface TVSSNowPlayingTransportBar
- (NSString)description;
- (TVSSAudioNowPlayingController)audioNowPlayingController;
- (TVSSNowPlayingTransportBar)initWithAudioNowPlayingController:(id)a3;
- (UIImage)contentImage;
- (double)percentComplete;
- (double)timeElapsed;
- (double)timeRemaining;
- (void)_updateReportedTime;
- (void)_updateTimeParameters;
- (void)_updateTimer;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)nowPlayingState:(id)a3 currentMediaItemDidChange:(id)a4;
- (void)nowPlayingState:(id)a3 playbackRateDidChange:(double)a4;
- (void)nowPlayingState:(id)a3 playbackStateDidChange:(int64_t)a4;
- (void)removeObserver:(id)a3;
- (void)syncTimingForNowPlayingState:(id)a3;
@end

@implementation TVSSNowPlayingTransportBar

- (TVSSNowPlayingTransportBar)initWithAudioNowPlayingController:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v12;
  v12 = 0LL;
  v10.receiver = v3;
  v10.super_class = (Class)&OBJC_CLASS___TVSSNowPlayingTransportBar;
  v9 = -[TVSSNowPlayingTransportBar init](&v10, "init");
  v12 = v9;
  objc_storeStrong((id *)&v12, v9);
  if (v9)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___TVSObserverSet);
    observers = v12->_observers;
    v12->_observers = v4;

    objc_storeStrong((id *)&v12->_audioNowPlayingController, location[0]);
    v8 = -[TVSSAudioNowPlayingController nowPlayingState](v12->_audioNowPlayingController, "nowPlayingState");
    -[TVSSNowPlayingState addObserver:](v8, "addObserver:", v12);

    -[TVSSNowPlayingTransportBar _updateTimeParameters](v12, "_updateTimeParameters");
  }

  v7 = v12;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v12, 0LL);
  return v7;
}

- (void)dealloc
{
  v5 = self;
  SEL v4 = a2;
  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  objc_storeStrong((id *)&v5->_displayLink, 0LL);
  v2 = -[TVSSAudioNowPlayingController nowPlayingState](v5->_audioNowPlayingController, "nowPlayingState");
  -[TVSSNowPlayingState removeObserver:](v2, "removeObserver:", v5);

  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_CLASS___TVSSNowPlayingTransportBar;
  -[TVSSNowPlayingTransportBar dealloc](&v3, "dealloc");
}

- (NSString)description
{
  v13 = self;
  SEL v12 = a2;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVSSNowPlayingTransportBar;
  v9 = -[TVSSNowPlayingTransportBar description](&v11, "description");
  timerStartDate = v13->_timerStartDate;
  v8 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v13->_lastElapsedTime);
  v7 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v13->_lastDuration);
  v6 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v13->_timeElapsed);
  v5 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v13->_timeRemaining);
  SEL v4 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v13->_percentComplete);
  objc_super v10 = objc_retainAutoreleasedReturnValue( -[NSString stringByAppendingFormat:]( v9,  "stringByAppendingFormat:",  @"; lastStartDate: %@, lastElapsedTime: %@, lastDuration: %@, timeElapsed: %@, timeRemaining: %@, percentComplete: %@",
            timerStartDate,
            v8,
            v7,
            v6,
            v5,
            v4));

  return v10;
}

- (UIImage)contentImage
{
  return 0LL;
}

- (void)addObserver:(id)a3
{
  v17 = self;
  SEL v16 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  if (!location)
  {
    v14 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"observer");
    id v13 = &_os_log_default;
    char v12 = 16;
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v13;
      os_log_type_t type = v12;
      v9 = NSStringFromSelector(v16);
      v5 = v9;
      objc_super v11 = v5;
      objc_super v3 = (objc_class *)objc_opt_class(v17);
      v8 = NSStringFromClass(v3);
      objc_super v10 = v8;
      sub_10000583C( (uint64_t)v18,  (uint64_t)v5,  (uint64_t)v10,  (uint64_t)v17,  (uint64_t)@"TVSSNowPlayingTransportBar.m",  65,  (uint64_t)v14);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v18,  0x3Au);

      objc_storeStrong((id *)&v10, 0LL);
      objc_storeStrong((id *)&v11, 0LL);
    }

    objc_storeStrong(&v13, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v14, "UTF8String"));
    __break(0);
    JUMPOUT(0x10010E30CLL);
  }

  id v4 = -[TVSObserverSet addObserver:](v17->_observers, "addObserver:", location);
  objc_storeStrong(&location, 0LL);
}

- (void)removeObserver:(id)a3
{
  SEL v16 = self;
  SEL v15 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  if (!location)
  {
    id v13 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"observer");
    id v12 = &_os_log_default;
    char v11 = 16;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v12;
      os_log_type_t type = v11;
      v8 = NSStringFromSelector(v15);
      id v4 = v8;
      objc_super v10 = v4;
      objc_super v3 = (objc_class *)objc_opt_class(v16);
      v7 = NSStringFromClass(v3);
      v9 = v7;
      sub_10000583C( (uint64_t)v17,  (uint64_t)v4,  (uint64_t)v9,  (uint64_t)v16,  (uint64_t)@"TVSSNowPlayingTransportBar.m",  72,  (uint64_t)v13);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v17,  0x3Au);

      objc_storeStrong((id *)&v9, 0LL);
      objc_storeStrong((id *)&v10, 0LL);
    }

    objc_storeStrong(&v12, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v13, "UTF8String"));
    __break(0);
    JUMPOUT(0x10010E56CLL);
  }

  -[TVSObserverSet removeObserver:](v16->_observers, "removeObserver:", location);
  objc_storeStrong(&location, 0LL);
}

- (void)nowPlayingState:(id)a3 currentMediaItemDidChange:(id)a4
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = 0LL;
  objc_storeStrong(&v5, a4);
  -[TVSSNowPlayingTransportBar _updateTimeParameters](v7, "_updateTimeParameters");
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)nowPlayingState:(id)a3 playbackStateDidChange:(int64_t)a4
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSNowPlayingTransportBar _updateTimeParameters](v5, "_updateTimeParameters");
  objc_storeStrong(location, 0LL);
}

- (void)nowPlayingState:(id)a3 playbackRateDidChange:(double)a4
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSNowPlayingTransportBar _updateTimeParameters](v5, "_updateTimeParameters");
  objc_storeStrong(location, 0LL);
}

- (void)syncTimingForNowPlayingState:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSNowPlayingTransportBar _updateTimeParameters](v4, "_updateTimeParameters");
  objc_storeStrong(location, 0LL);
}

- (void)_updateTimeParameters
{
  id v13 = self;
  location[1] = (id)a2;
  v8 = -[TVSSAudioNowPlayingController nowPlayingState](self->_audioNowPlayingController, "nowPlayingState");
  location[0] = -[TVSSNowPlayingState currentMediaItem](v8, "currentMediaItem");

  id v9 = [location[0] elapsedTimeDate];
  v2 = (NSDate *)[v9 copy];
  timerStartDate = v13->_timerStartDate;
  v13->_timerStartDate = v2;

  [location[0] elapsedTime];
  v13->_lastElapsedTime = v4;
  [location[0] duration];
  v13->_lastDuration = v5;
  objc_super v10 = -[TVSSAudioNowPlayingController nowPlayingState](v13->_audioNowPlayingController, "nowPlayingState");
  BOOL v11 = (id)-[TVSSNowPlayingState playbackState](v10, "playbackState") != (id)2;

  if (v11)
  {
    v13->_playbackRate = 0.0;
  }

  else
  {
    v7 = -[TVSSAudioNowPlayingController nowPlayingState](v13->_audioNowPlayingController, "nowPlayingState");
    -[TVSSNowPlayingState playbackRate](v7, "playbackRate");
    v13->_playbackRate = v6;
  }

  -[TVSSNowPlayingTransportBar _updateTimer](v13, "_updateTimer");
  -[TVSSNowPlayingTransportBar _updateReportedTime](v13, "_updateReportedTime");
  objc_storeStrong(location, 0LL);
}

- (void)_updateTimer
{
  if (self->_playbackRate <= 0.0)
  {
    -[CADisplayLink invalidate](self->_displayLink, "invalidate");
    objc_storeStrong((id *)&self->_displayLink, 0LL);
  }

  else if (!self->_displayLink)
  {
    v2 =  +[CADisplayLink displayLinkWithTarget:selector:]( &OBJC_CLASS___CADisplayLink,  "displayLinkWithTarget:selector:",  self,  "_updateReportedTime");
    displayLink = self->_displayLink;
    self->_displayLink = v2;

    -[CADisplayLink setPreferredFramesPerSecond:](self->_displayLink, "setPreferredFramesPerSecond:", 15LL);
    double v4 = self->_displayLink;
    double v5 = +[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop");
    -[CADisplayLink addToRunLoop:forMode:](v4, "addToRunLoop:forMode:");
  }

- (void)_updateReportedTime
{
  v32 = self;
  location[1] = (id)a2;
  location[0] = +[NSDate date](&OBJC_CLASS___NSDate, "date");
  [location[0] timeIntervalSinceDate:v32->_timerStartDate];
  double v30 = v2 * v32->_playbackRate;
  double v28 = v32->_lastElapsedTime + v30;
  double lastDuration = v32->_lastDuration;
  if (v28 >= lastDuration) {
    double v8 = lastDuration;
  }
  else {
    double v8 = v28;
  }
  double v26 = v8;
  double v29 = v8;
  double v24 = round(v32->_lastElapsedTime + v30);
  double v23 = v32->_lastDuration;
  if (v24 >= v23) {
    double v7 = v23;
  }
  else {
    double v7 = v24;
  }
  double v22 = v7;
  double v25 = v7;
  double v20 = round(v32->_lastDuration - v7);
  double v19 = 0.0;
  if (v20 >= 0.0) {
    double v6 = v20;
  }
  else {
    double v6 = v19;
  }
  double v18 = v6;
  double v21 = v6;
  if (v32->_lastDuration <= 0.0) {
    double v5 = 0.0;
  }
  else {
    double v5 = v29 / v32->_lastDuration;
  }
  double v17 = v5;
  -[TVSSNowPlayingTransportBar willChangeValueForKey:](v32, "willChangeValueForKey:", @"timeElapsed");
  -[TVSSNowPlayingTransportBar willChangeValueForKey:](v32, "willChangeValueForKey:");
  -[TVSSNowPlayingTransportBar willChangeValueForKey:](v32, "willChangeValueForKey:");
  v32->_timeElapsed = v25;
  v32->_timeRemaining = v21;
  v32->_percentComplete = v17;
  -[TVSSNowPlayingTransportBar didChangeValueForKey:](v32, "didChangeValueForKey:", v4);
  -[TVSSNowPlayingTransportBar didChangeValueForKey:](v32, "didChangeValueForKey:", @"timeRemaining");
  -[TVSSNowPlayingTransportBar didChangeValueForKey:](v32, "didChangeValueForKey:", @"percentComplete");
  observers = v32->_observers;
  id v9 = _NSConcreteStackBlock;
  int v10 = -1073741824;
  int v11 = 0;
  id v12 = sub_10010ECDC;
  id v13 = &unk_1001BB3D8;
  double v14 = v25;
  double v15 = v21;
  double v16 = v17;
  -[TVSObserverSet enumerateObserversUsingBlock:](observers, "enumerateObserversUsingBlock:", &v9);
  objc_storeStrong(location, 0LL);
}

- (TVSSAudioNowPlayingController)audioNowPlayingController
{
  return self->_audioNowPlayingController;
}

- (double)percentComplete
{
  return self->_percentComplete;
}

- (double)timeElapsed
{
  return self->_timeElapsed;
}

- (double)timeRemaining
{
  return self->_timeRemaining;
}

- (void).cxx_destruct
{
}

@end