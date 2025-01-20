@interface CSMediaPlayingMonitor
+ (id)sharedInstance;
- (CSMediaPlayingMonitor)init;
- (int64_t)mediaPlayingState;
- (void)_notePossiblePlayPausedStateChange:(id)a3;
- (void)_notifyObserver:(id)a3 mediaIsPlayingState:(int64_t)a4;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
- (void)initializeMediaPlayingState;
- (void)mediaPlayingStateWithCompletion:(id)a3;
@end

@implementation CSMediaPlayingMonitor

- (CSMediaPlayingMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CSMediaPlayingMonitor;
  v2 = -[CSMediaPlayingMonitor init](&v6, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSMediaPlayingMonitor queue", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_mediaIsPlaying = 0LL;
  }

  return v2;
}

- (void)initializeMediaPlayingState
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001477A8;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_startMonitoringWithQueue:(id)a3
{
  id v4 = a3;
  -[CSMediaPlayingMonitor _stopMonitoring](self, "_stopMonitoring");
  MRMediaRemoteRegisterForNowPlayingNotifications(v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 addObserver:self selector:"_notePossiblePlayPausedStateChange:" name:kMRMediaRemoteNowPlayingApplicationIsPlayingDidChangeNotification object:0];

  objc_super v6 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    v8 = "-[CSMediaPlayingMonitor _startMonitoringWithQueue:]";
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s Start monitoring MediaRemote: media playback",  (uint8_t *)&v7,  0xCu);
  }

- (void)_stopMonitoring
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:kMRMediaRemoteNowPlayingApplicationIsPlayingDidChangeNotification object:0];

  id v4 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    objc_super v6 = "-[CSMediaPlayingMonitor _stopMonitoring]";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s Stop monitoring MediaRemote: media playback",  (uint8_t *)&v5,  0xCu);
  }

- (void)_notePossiblePlayPausedStateChange:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kMRMediaRemoteNowPlayingApplicationIsPlayingUserInfoKey]);
  unsigned int v6 = [v5 BOOLValue];

  int v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v8 = "NOT PLAYING";
    v12 = "-[CSMediaPlayingMonitor _notePossiblePlayPausedStateChange:]";
    *(_DWORD *)buf = 136315650;
    if (v6) {
      v8 = "PLAYING";
    }
    __int16 v13 = 2080;
    v14 = v8;
    __int16 v15 = 1024;
    unsigned int v16 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s MediaRemote reported the now playing app playback state changed to %s (state %d)",  buf,  0x1Cu);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100147788;
  v9[3] = &unk_10022EB30;
  v9[4] = self;
  char v10 = v6;
  -[CSMediaPlayingMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v9);
}

- (void)_notifyObserver:(id)a3 mediaIsPlayingState:(int64_t)a4
{
  id v6 = a3;
  -[CSMediaPlayingMonitor notifyObserver:](self, "notifyObserver:", v6);
  self->_mediaIsPlaying = a4;
  if ((objc_opt_respondsToSelector(v6, "CSMediaPlayingMonitor:didReceiveMediaPlayingChanged:") & 1) != 0) {
    [v6 CSMediaPlayingMonitor:self didReceiveMediaPlayingChanged:a4];
  }
}

- (int64_t)mediaPlayingState
{
  uint64_t v6 = 0LL;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10014776C;
  v5[3] = &unk_10022EF80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)mediaPlayingStateWithCompletion:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100147750;
    v7[3] = &unk_10022EB58;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  if (qword_100280238 != -1) {
    dispatch_once(&qword_100280238, &stru_10022EAE0);
  }
  return (id)qword_100280230;
}

@end