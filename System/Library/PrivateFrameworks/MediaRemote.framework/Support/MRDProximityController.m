@interface MRDProximityController
- (BOOL)hasTriggered;
- (BOOL)invalidated;
- (BOOL)shouldRun;
- (MRDDisplayMonitor)displayMonitor;
- (MRDLockScreenRoutingControllerDataSource)dataSource;
- (MRDProximityController)init;
- (NSDate)mediaSuggestionDate;
- (NSMutableSet)nearbyDevices;
- (NSString)mediaSuggestionDeviceID;
- (OS_dispatch_queue)queue;
- (id)_configurationForUID:(id)a3;
- (void)_handleElectedPlayerDidChangeNotification:(id)a3;
- (void)_handleLayoutDidChangeNotification:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDisplayMonitor:(id)a3;
- (void)setHasTriggered:(BOOL)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setMediaSuggestionDate:(id)a3;
- (void)setMediaSuggestionDeviceID:(id)a3;
- (void)setNearbyDevices:(id)a3;
- (void)setQueue:(id)a3;
- (void)setShouldRun:(BOOL)a3;
@end

@implementation MRDProximityController

- (MRDProximityController)init
{
  return 0LL;
}

- (void)setMediaSuggestionDeviceID:(id)a3
{
  v4 = (NSString *)a3;
  v5 = self->_mediaSuggestionDeviceID;
  if (v5 == v4)
  {
  }

  else
  {
    v6 = v5;
    unsigned __int8 v7 = -[NSString isEqual:](v5, "isEqual:", v4);

    if ((v7 & 1) == 0)
    {
      v8 = (NSString *)-[NSString copy](v4, "copy");
      mediaSuggestionDeviceID = self->_mediaSuggestionDeviceID;
      self->_mediaSuggestionDeviceID = v8;

      v10 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      mediaSuggestionDate = self->_mediaSuggestionDate;
      self->_mediaSuggestionDate = v10;

      uint64_t v13 = _MRLogForCategory(7LL, v12);
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if (v4)
      {
        if (v15)
        {
          int v21 = 138412290;
          v22 = v4;
          v16 = "[ProximityController] Found device for media suggestions: %@";
          v17 = v14;
          uint32_t v18 = 12;
LABEL_9:
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v21, v18);
        }
      }

      else if (v15)
      {
        LOWORD(v21) = 0;
        v16 = "[ProximityController] Lost device for media suggestions";
        v17 = v14;
        uint32_t v18 = 2;
        goto LABEL_9;
      }

      v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v19,  "setObject:forKeyedSubscript:",  v4,  kMRAVEndpointOutputDeviceIdentifierUserInfoKey);
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
      [v20 postClientNotificationNamed:_MRMediaRemoteDeviceAvailableForMediaSuggestionsNotification userInfo:v19];

      notify_post("com.apple.mediaremote.mediaSuggestionsElectedDeviceDidChange");
    }
  }
}

- (id)_configurationForUID:(id)a3
{
  id v3 = a3;
  id v4 = [[MRDestination alloc] initWithOutputDeviceUID:v3];
  id v5 = [[MRNowPlayingControllerConfiguration alloc] initWithDestination:v4];
  [v5 setRequestPlaybackState:1];
  [v5 setRequestPlaybackQueue:0];
  [v5 setRequestClientProperties:0];
  [v5 setRequestSupportedCommands:0];
  [v5 setRequestLastPlayingDate:0];
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ProximityController(%@)",  v3));

  [v5 setLabel:v6];
  return v5;
}

- (void)_handleLayoutDidChangeNotification:(id)a3
{
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDProximityController queue](self, "queue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100060980;
  block[3] = &unk_100399250;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)_handleElectedPlayerDidChangeNotification:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDProximityController dataSource](self, "dataSource", a3));
  unsigned int v5 = [v4 hasElectedPlayer];

  if (v5) {
    -[MRDProximityController setMediaSuggestionDeviceID:](self, "setMediaSuggestionDeviceID:", 0LL);
  }
}

- (MRDLockScreenRoutingControllerDataSource)dataSource
{
  return (MRDLockScreenRoutingControllerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableSet)nearbyDevices
{
  return self->_nearbyDevices;
}

- (void)setNearbyDevices:(id)a3
{
}

- (BOOL)hasTriggered
{
  return self->_hasTriggered;
}

- (void)setHasTriggered:(BOOL)a3
{
  self->_hasTriggered = a3;
}

- (BOOL)shouldRun
{
  return self->_shouldRun;
}

- (void)setShouldRun:(BOOL)a3
{
  self->_shouldRun = a3;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (MRDDisplayMonitor)displayMonitor
{
  return self->_displayMonitor;
}

- (void)setDisplayMonitor:(id)a3
{
}

- (NSString)mediaSuggestionDeviceID
{
  return self->_mediaSuggestionDeviceID;
}

- (NSDate)mediaSuggestionDate
{
  return self->_mediaSuggestionDate;
}

- (void)setMediaSuggestionDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end