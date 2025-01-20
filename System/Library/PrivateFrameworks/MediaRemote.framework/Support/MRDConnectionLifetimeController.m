@interface MRDConnectionLifetimeController
- (BOOL)containsLocalDevice;
- (BOOL)continuousPlaybackDetected;
- (BOOL)disconnected;
- (BOOL)hasDeferredDisconnectionDueToDeviceState;
- (BOOL)hasPlayedRecently;
- (BOOL)isMemberOfActiveSystemEndpoint;
- (BOOL)isPlaying;
- (MRDConnectionLifetimeController)initWithDataSource:(id)a3 delegate:(id)a4;
- (MRDConnectionLifetimeControllerDataSource)dataSource;
- (MRDConnectionLifetimeControllerDelegate)delegate;
- (MROrigin)origin;
- (MRTimer)continuousPlaybackDetectionTimer;
- (MRTimer)disconnectTimer;
- (MRTimer)playbackTimer;
- (NSString)maintainReason;
- (NSString)previousMaintainReason;
- (OS_dispatch_queue)queue;
- (double)continuousPlaybackDetectionInterval;
- (double)disconnectInterval;
- (double)recentlyPlayingInterval;
- (double)timeSincePlaybackStarted;
- (double)timeSincePlaying;
- (id)activeSystemEndpointUID;
- (id)debugDescription;
- (unint64_t)deviceState;
- (void)_adjustContinuousPlaybackDetectionTimerIfNeeded;
- (void)_adjustPlaybackTimerIfNeeded;
- (void)_handleActiveSystemEndpointChangedNotification:(id)a3;
- (void)_handleDeviceInfoDidChangeNotification:(id)a3;
- (void)_handleIsPlayingDidChangeNotification:(id)a3;
- (void)_handleLayoutDidChangeNotification:(id)a3;
- (void)_initialize;
- (void)dealloc;
- (void)disconnectOrigin:(id)a3;
- (void)evaluateShouldDisconnectWithReason:(id)a3;
- (void)registerForChanges;
- (void)setContinuousPlaybackDetectionTimer:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceState:(unint64_t)a3;
- (void)setDisconnectTimer:(id)a3;
- (void)setDisconnected:(BOOL)a3;
- (void)setHasDeferredDisconnectionDueToDeviceState:(BOOL)a3;
- (void)setMaintainReason:(id)a3;
- (void)setOrigin:(id)a3;
- (void)setPlaybackTimer:(id)a3;
- (void)setPreviousMaintainReason:(id)a3;
- (void)unregisterForChanges;
@end

@implementation MRDConnectionLifetimeController

- (MRDConnectionLifetimeController)initWithDataSource:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___MRDConnectionLifetimeController;
  v8 = -[MRDConnectionLifetimeController init](&v30, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_dataSource, v6);
    objc_storeWeak((id *)&v9->_delegate, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDConnectionLifetimeController dataSource](v9, "dataSource"));
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 origin]);
    origin = v9->_origin;
    v9->_origin = (MROrigin *)v11;

    v13 = v9->_origin;
    if (!v13)
    {
      v28 = 0LL;
      goto LABEL_6;
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MROrigin displayName](v13, "displayName"));
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"MRDConnectionLifetimeController-%@-%ld.queue",  v14,  (int)-[MROrigin identifier](v9->_origin, "identifier")));

    id v16 = v15;
    v17 = (const char *)[v16 UTF8String];
    dispatch_queue_attr_t v18 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v18);
    id v20 = sub_1000AA6C8();
    v21 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v20);
    dispatch_queue_t v22 = dispatch_queue_create_with_target_V2(v17, v19, v21);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v22;

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    [v24 remoteDeviceIdleDisconnectionInterval];
    v9->_disconnectInterval = v25;

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    [v26 mediaRecentlyPlayedInterval];
    v9->_recentlyPlayingInterval = v27;

    v9->_continuousPlaybackDetectionInterval = v9->_recentlyPlayingInterval * 30.0;
    -[MRDConnectionLifetimeController _initialize](v9, "_initialize");
  }

  v28 = v9;
LABEL_6:

  return v28;
}

- (void)_initialize
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDConnectionLifetimeController queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000AA990;
  block[3] = &unk_100399250;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)dealloc
{
  uint64_t v3 = _MRLogForCategory(2LL, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[MRDCLC] <%p> Deallocating.", buf, 0xCu);
  }

  if (!-[MRDConnectionLifetimeController disconnected](self, "disconnected")) {
    -[MRDConnectionLifetimeController unregisterForChanges](self, "unregisterForChanges");
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MRDConnectionLifetimeController;
  -[MRDConnectionLifetimeController dealloc](&v5, "dealloc");
}

- (id)debugDescription
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDConnectionLifetimeController queue](self, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000AAC5C;
  v8[3] = &unk_100398E60;
  objc_super v5 = v3;
  v9 = v5;
  v10 = self;
  dispatch_sync(v4, v8);

  id v6 = v5;
  return v6;
}

- (void)registerForChanges
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"_handleIsPlayingDidChangeNotification:" name:kMRMediaRemoteOriginNowPlayingApplicationIsPlayingDidChangeNotification object:0];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 addObserver:self selector:"_handleDeviceInfoDidChangeNotification:" name:kMRDeviceInfoDidChangeNotification object:0];

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 addObserver:self selector:"_handleActiveSystemEndpointChangedNotification:" name:kMRMediaRemoteActiveSystemEndpointDidChangeNotification object:0];

  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MRDDisplayMonitor sharedMonitor](&OBJC_CLASS___MRDDisplayMonitor, "sharedMonitor"));
  [v7 addObserver:self selector:"_handleLayoutDidChangeNotification:" name:@"MRDisplayMonitorLayoutDidChangeNotification" object:v6];
}

- (void)unregisterForChanges
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];
}

- (void)evaluateShouldDisconnectWithReason:(id)a3
{
  id v4 = a3;
  objc_super v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDConnectionLifetimeController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  if (!-[MRDConnectionLifetimeController disconnected](self, "disconnected"))
  {
    id v7 = self->_origin;
    if (!v7)
    {
LABEL_33:

      goto LABEL_34;
    }

    uint64_t v8 = _MRLogForCategory(2LL, v6);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[MROrigin displayName](v7, "displayName"));
      *(_DWORD *)buf = 134218754;
      v46 = self;
      __int16 v47 = 2112;
      v48 = v36;
      __int16 v49 = 2048;
      uint64_t v50 = (int)-[MROrigin identifier](v7, "identifier");
      __int16 v51 = 2112;
      double v52 = *(double *)&v4;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "[MRDCLC] <%p> Re-evaluate for origin-%@-%ld because %@.",  buf,  0x2Au);
    }

    if (-[MRDConnectionLifetimeController isMemberOfActiveSystemEndpoint](self, "isMemberOfActiveSystemEndpoint"))
    {
      uint64_t v11 = @"Device is part of UserSelected endpoint";
LABEL_7:
      uint64_t v12 = _MRLogForCategory(2LL, v10);
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[MROrigin displayName](v7, "displayName"));
        signed int v38 = -[MROrigin identifier](v7, "identifier");
        *(_DWORD *)buf = 134218754;
        v46 = self;
        __int16 v47 = 2112;
        v48 = v37;
        __int16 v49 = 2048;
        uint64_t v50 = v38;
        __int16 v51 = 2112;
        double v52 = *(double *)&v11;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "[MRDCLC] <%p> Will maintain connection for origin-%@-%ld because %@.",  buf,  0x2Au);
      }

      -[MRDConnectionLifetimeController setHasDeferredDisconnectionDueToDeviceState:]( self,  "setHasDeferredDisconnectionDueToDeviceState:",  0LL);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRDConnectionLifetimeController disconnectTimer](self, "disconnectTimer"));
      BOOL v15 = v14 == 0LL;

      if (!v15)
      {
        uint64_t v17 = _MRLogForCategory(2LL, v16);
        dispatch_queue_attr_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[MROrigin displayName](v7, "displayName"));
          signed int v20 = -[MROrigin identifier](v7, "identifier");
          *(_DWORD *)buf = 134218498;
          v46 = self;
          __int16 v47 = 2112;
          v48 = v19;
          __int16 v49 = 2048;
          uint64_t v50 = v20;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[MRDCLC] <%p> Cancel scheduled disconnect for origin-%@-%ld.",  buf,  0x20u);
        }

        v21 = (void *)objc_claimAutoreleasedReturnValue(-[MRDConnectionLifetimeController disconnectTimer](self, "disconnectTimer"));
        [v21 invalidateWithReason:v11];

        -[MRDConnectionLifetimeController setDisconnectTimer:](self, "setDisconnectTimer:", 0LL);
      }

- (void)disconnectOrigin:(id)a3
{
  id v4 = a3;
  objc_super v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDConnectionLifetimeController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  -[MRDConnectionLifetimeController setDisconnected:](self, "setDisconnected:", 1LL);
  -[MRDConnectionLifetimeController unregisterForChanges](self, "unregisterForChanges");
  uint64_t v7 = _MRLogForCategory(2LL, v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 displayName]);
    int v11 = 134218498;
    uint64_t v12 = self;
    __int16 v13 = 2112;
    v14 = v9;
    __int16 v15 = 2048;
    uint64_t v16 = (int)[v4 identifier];
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[MRDCLC] <%p> Disconnecting origin-%@-%ld.",  (uint8_t *)&v11,  0x20u);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDConnectionLifetimeController delegate](self, "delegate"));
  [v10 disconnectOrigin:v4];
}

- (void)_handleDeviceInfoDidChangeNotification:(id)a3
{
  id v4 = a3;
  objc_super v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDConnectionLifetimeController queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000AB840;
  v7[3] = &unk_100398E60;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_handleIsPlayingDidChangeNotification:(id)a3
{
  id v4 = a3;
  objc_super v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDConnectionLifetimeController queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000AB97C;
  v7[3] = &unk_100398E60;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_adjustPlaybackTimerIfNeeded
{
  unsigned __int8 v3 = -[MRDConnectionLifetimeController isPlaying](self, "isPlaying");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDConnectionLifetimeController playbackTimer](self, "playbackTimer"));

  if ((v3 & 1) != 0)
  {
    if (v4)
    {
      uint64_t v6 = _MRLogForCategory(2LL, v5);
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        sub_1002B78C0((uint64_t)self, v7);
      }

      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDConnectionLifetimeController playbackTimer](self, "playbackTimer"));
      [v8 invalidate];

      -[MRDConnectionLifetimeController setPlaybackTimer:](self, "setPlaybackTimer:", 0LL);
    }
  }

  else if (!v4)
  {
    -[MRDConnectionLifetimeController recentlyPlayingInterval](self, "recentlyPlayingInterval");
    double v10 = v9;
    -[MRDConnectionLifetimeController timeSincePlaying](self, "timeSincePlaying");
    double v13 = v10 - v12;
    if (v13 <= 0.0)
    {
      -[MRDConnectionLifetimeController evaluateShouldDisconnectWithReason:]( self,  "evaluateShouldDisconnectWithReason:",  @"Has not played recently");
    }

    else
    {
      double v14 = v13 + 2.0;
      uint64_t v15 = _MRLogForCategory(2LL, v11);
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        sub_1002B7930();
      }

      objc_initWeak(&location, self);
      uint64_t v17 = objc_alloc(&OBJC_CLASS___MRTimer);
      dispatch_queue_attr_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[MRDConnectionLifetimeController queue](self, "queue"));
      signed int v20 = _NSConcreteStackBlock;
      uint64_t v21 = 3221225472LL;
      dispatch_queue_t v22 = sub_1000ABC50;
      BOOL v23 = &unk_10039A668;
      objc_copyWeak(&v24, &location);
      v19 = -[MRTimer initWithInterval:name:queue:block:]( v17,  "initWithInterval:name:queue:block:",  @"CLC-playbackTimer",  v18,  &v20,  v14);
      -[MRDConnectionLifetimeController setPlaybackTimer:](self, "setPlaybackTimer:", v19, v20, v21, v22, v23);

      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
    }
  }

- (void)_adjustContinuousPlaybackDetectionTimerIfNeeded
{
  unsigned int v3 = -[MRDConnectionLifetimeController isPlaying](self, "isPlaying");
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[MRDConnectionLifetimeController continuousPlaybackDetectionTimer]( self,  "continuousPlaybackDetectionTimer"));
  uint64_t v5 = v4;
  if (v3)
  {
    [v4 invalidateWithReason:@"Playback Started"];

    -[MRDConnectionLifetimeController setContinuousPlaybackDetectionTimer:]( self,  "setContinuousPlaybackDetectionTimer:",  0LL);
    -[MRDConnectionLifetimeController continuousPlaybackDetectionInterval](self, "continuousPlaybackDetectionInterval");
    double v7 = v6;
    -[MRDConnectionLifetimeController timeSincePlaybackStarted](self, "timeSincePlaybackStarted");
    double v10 = v7 - v9;
    if (v10 <= 0.0)
    {
      -[MRDConnectionLifetimeController evaluateShouldDisconnectWithReason:]( self,  "evaluateShouldDisconnectWithReason:",  @"Continuous Playback Detected");
    }

    else
    {
      double v11 = v10 + 10.0;
      uint64_t v12 = _MRLogForCategory(2LL, v8);
      double v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        sub_1002B7990();
      }

      objc_initWeak(&location, self);
      double v14 = objc_alloc(&OBJC_CLASS___MRTimer);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[MRDConnectionLifetimeController queue](self, "queue"));
      uint64_t v17 = _NSConcreteStackBlock;
      uint64_t v18 = 3221225472LL;
      v19 = sub_1000ABE7C;
      signed int v20 = &unk_10039A668;
      objc_copyWeak(&v21, &location);
      uint64_t v16 = -[MRTimer initWithInterval:name:queue:block:]( v14,  "initWithInterval:name:queue:block:",  @"CLC-continuousPlaybackDetectionTimer",  v15,  &v17,  v11);
      -[MRDConnectionLifetimeController setContinuousPlaybackDetectionTimer:]( self,  "setContinuousPlaybackDetectionTimer:",  v16,  v17,  v18,  v19,  v20);

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
  }

  else
  {
    objc_msgSend( v4,  "invalidateWithReason:",  @"Playback stopped, continuousPlaybackDetection is no longer relevant");

    -[MRDConnectionLifetimeController setContinuousPlaybackDetectionTimer:]( self,  "setContinuousPlaybackDetectionTimer:",  0LL);
  }

- (void)_handleLayoutDidChangeNotification:(id)a3
{
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDConnectionLifetimeController queue](self, "queue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000ABF1C;
  block[3] = &unk_100399250;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)_handleActiveSystemEndpointChangedNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDConnectionLifetimeController queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000AC0F8;
  v7[3] = &unk_100398E60;
  id v8 = v4;
  double v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (id)activeSystemEndpointUID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 routingServer]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 systemEndpointController]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 activeOutputDeviceUID:0]);

  return v5;
}

- (BOOL)isMemberOfActiveSystemEndpoint
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDConnectionLifetimeController activeSystemEndpointUID](self, "activeSystemEndpointUID"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 nowPlayingServer]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 originClientForOrigin:self->_origin]);
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceInfo]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 nowPlayingServer]);
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 originClientForGroupLeaderOfDeviceUID:v3]);
  double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceInfo]);

  id v12 = (id)objc_claimAutoreleasedReturnValue([v7 deviceUID]);
  id v13 = (id)objc_claimAutoreleasedReturnValue([v11 deviceUID]);
  if (v12 == v13)
  {

LABEL_24:
    goto LABEL_25;
  }

  double v14 = v13;
  unsigned __int8 v15 = [v12 isEqual:v13];

  if ((v15 & 1) != 0)
  {
LABEL_25:
    BOOL v37 = 1;
    goto LABEL_26;
  }

  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id v12 = (id)objc_claimAutoreleasedReturnValue([v11 groupedDevices]);
  id v16 = [v12 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v44;
LABEL_5:
    uint64_t v19 = 0LL;
    while (1)
    {
      if (*(void *)v44 != v18) {
        objc_enumerationMutation(v12);
      }
      signed int v20 = *(void **)(*((void *)&v43 + 1) + 8 * v19);
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v7 deviceUID]);
      dispatch_queue_t v22 = (void *)objc_claimAutoreleasedReturnValue([v20 deviceUID]);
      id v23 = v21;
      id v24 = v22;
      if (v23 == v24) {
        goto LABEL_23;
      }
      double v25 = v24;
      unsigned __int8 v26 = [v23 isEqual:v24];

      if ((v26 & 1) != 0) {
        goto LABEL_24;
      }
      if (v17 == (id)++v19)
      {
        id v17 = [v12 countByEnumeratingWithState:&v43 objects:v48 count:16];
        if (v17) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "clusteredDevices", 0));
  id v27 = [v12 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v40;
LABEL_14:
    uint64_t v30 = 0LL;
    while (1)
    {
      if (*(void *)v40 != v29) {
        objc_enumerationMutation(v12);
      }
      v31 = *(void **)(*((void *)&v39 + 1) + 8 * v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue([v7 deviceUID]);
      v33 = (void *)objc_claimAutoreleasedReturnValue([v31 deviceUID]);
      id v23 = v32;
      id v34 = v33;
      if (v23 == v34) {
        break;
      }
      v35 = v34;
      unsigned __int8 v36 = [v23 isEqual:v34];

      if ((v36 & 1) != 0) {
        goto LABEL_24;
      }
      if (v28 == (id)++v30)
      {
        id v28 = [v12 countByEnumeratingWithState:&v39 objects:v47 count:16];
        if (v28) {
          goto LABEL_14;
        }
        goto LABEL_21;
      }
    }

- (BOOL)isPlaying
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 nowPlayingServer]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 originClientForOrigin:self->_origin]);
  unsigned __int8 v6 = [v5 isPlaying];

  return v6;
}

- (double)timeSincePlaying
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 nowPlayingServer]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 originClientForOrigin:self->_origin]);
  [v5 timeSincePlaying];
  double v7 = v6;

  return v7;
}

- (BOOL)hasPlayedRecently
{
  double v4 = v3;
  -[MRDConnectionLifetimeController recentlyPlayingInterval](self, "recentlyPlayingInterval");
  return v4 < v5;
}

- (BOOL)containsLocalDevice
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 nowPlayingServer]);
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 originClientForOrigin:self->_origin]);
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 deviceInfo]);

  LOBYTE(v5) = [v6 containsLocalDevice];
  return (char)v5;
}

- (double)timeSincePlaybackStarted
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 nowPlayingServer]);
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 originClientForOrigin:self->_origin]);
  [v5 timeSincePlaybackStarted];
  double v7 = v6;

  return v7;
}

- (BOOL)continuousPlaybackDetected
{
  double v4 = v3;
  -[MRDConnectionLifetimeController continuousPlaybackDetectionInterval](self, "continuousPlaybackDetectionInterval");
  return v4 >= v5;
}

- (MRDConnectionLifetimeControllerDataSource)dataSource
{
  return (MRDConnectionLifetimeControllerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
}

- (MRDConnectionLifetimeControllerDelegate)delegate
{
  return (MRDConnectionLifetimeControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (MRTimer)playbackTimer
{
  return self->_playbackTimer;
}

- (void)setPlaybackTimer:(id)a3
{
}

- (MRTimer)continuousPlaybackDetectionTimer
{
  return self->_continuousPlaybackDetectionTimer;
}

- (void)setContinuousPlaybackDetectionTimer:(id)a3
{
}

- (MRTimer)disconnectTimer
{
  return self->_disconnectTimer;
}

- (void)setDisconnectTimer:(id)a3
{
}

- (unint64_t)deviceState
{
  return self->_deviceState;
}

- (void)setDeviceState:(unint64_t)a3
{
  self->_deviceState = a3;
}

- (double)disconnectInterval
{
  return self->_disconnectInterval;
}

- (double)recentlyPlayingInterval
{
  return self->_recentlyPlayingInterval;
}

- (double)continuousPlaybackDetectionInterval
{
  return self->_continuousPlaybackDetectionInterval;
}

- (BOOL)hasDeferredDisconnectionDueToDeviceState
{
  return self->_hasDeferredDisconnectionDueToDeviceState;
}

- (void)setHasDeferredDisconnectionDueToDeviceState:(BOOL)a3
{
  self->_hasDeferredDisconnectionDueToDeviceState = a3;
}

- (BOOL)disconnected
{
  return self->_disconnected;
}

- (void)setDisconnected:(BOOL)a3
{
  self->_disconnected = a3;
}

- (NSString)maintainReason
{
  return self->_maintainReason;
}

- (void)setMaintainReason:(id)a3
{
}

- (NSString)previousMaintainReason
{
  return self->_previousMaintainReason;
}

- (void)setPreviousMaintainReason:(id)a3
{
}

- (MROrigin)origin
{
  return self->_origin;
}

- (void)setOrigin:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

@end