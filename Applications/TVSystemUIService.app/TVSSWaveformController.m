@interface TVSSWaveformController
- (BOOL)isAnalyzingAudio;
- (BOOL)isPlaying;
- (BOOL)isRemoteRoute;
- (BOOL)isVisible;
- (CGSize)artworkFittingSize;
- (MPAVEndpointRoute)endpointRoute;
- (NSHashTable)observers;
- (NSString)description;
- (NSString)remoteRouteSymbolName;
- (NSString)trackIdentifier;
- (TVSSAudioAnalyzer)audioAnalyzer;
- (TVSSAudioNowPlayingController)nowPlayingController;
- (TVSSWaveformController)initWithNowPlayingController:(id)a3;
- (TVSSWaveformData)waveform;
- (id)_observersCopyForSelector:(SEL)a3;
- (int)nowPlayingPID;
- (void)_updatePlaybackState:(int64_t)a3;
- (void)addVisibleObserver:(id)a3;
- (void)audioAnalyzer:(id)a3 didUpdateWaveform:(id)a4;
- (void)dealloc;
- (void)nowPlayingController:(id)a3 didUpdateNowPlayingPlayerPath:(id)a4;
- (void)nowPlayingState:(id)a3 currentMediaItemDidChange:(id)a4;
- (void)nowPlayingState:(id)a3 playbackStateDidChange:(int64_t)a4;
- (void)removeVisibleObserver:(id)a3;
- (void)routeDidUpdateNotification:(id)a3;
- (void)setArtworkFittingSize:(CGSize)a3;
- (void)setAudioAnalyzer:(id)a3;
- (void)setEndpointRoute:(id)a3;
- (void)setIsAnalyzingAudio:(BOOL)a3;
- (void)setNowPlayingController:(id)a3;
- (void)setNowPlayingPID:(int)a3;
- (void)setPlaying:(BOOL)a3;
- (void)setRemoteRoute:(BOOL)a3;
- (void)setRemoteRouteSymbolName:(id)a3;
- (void)setTrackIdentifier:(id)a3;
- (void)setVisible:(BOOL)a3;
- (void)setWaveform:(id)a3;
- (void)updateAnalyzer;
- (void)updateRoute:(id)a3;
@end

@implementation TVSSWaveformController

- (TVSSWaveformController)initWithNowPlayingController:(id)a3
{
  v27 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v27;
  v27 = 0LL;
  v25.receiver = v3;
  v25.super_class = (Class)&OBJC_CLASS___TVSSWaveformController;
  v27 = -[TVSSWaveformController init](&v25, "init");
  objc_storeStrong((id *)&v27, v27);
  if (v27)
  {
    v4 = (TVSSWaveformData *)+[TVSSWaveformData zero](&OBJC_CLASS___TVSSWaveformData, "zero");
    waveform = v27->_waveform;
    v27->_waveform = v4;

    v14 = v27;
    sub_1000A9144();
    v24.width = v6;
    v24.height = v7;
    v14->_artworkFittingSize = v24;
    id v23 = +[MPAVRoutingController systemRoute](&OBJC_CLASS___MPAVRoutingController, "systemRoute");
    -[TVSSWaveformController setEndpointRoute:](v27, "setEndpointRoute:", v23);
    objc_storeStrong((id *)&v27->_nowPlayingController, location[0]);
    [location[0] addObserver:v27];
    id v15 = location[0];
    v8 = (objc_class *)objc_opt_class(v27);
    v17 = NSStringFromClass(v8);
    v16 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ - %p", v17, v27);
    objc_msgSend(v15, "addActivationReason:");

    id v19 = [location[0] nowPlayingPlayerPath];
    id v18 = [v19 client];
    id v9 = [v18 processIdentifier];
    -[TVSSWaveformController setNowPlayingPID:](v27, "setNowPlayingPID:", v9);

    v20 = v27;
    id v21 = [location[0] nowPlayingState];
    -[TVSSWaveformController _updatePlaybackState:](v20, "_updatePlaybackState:", [v21 playbackState]);

    id v22 = [location[0] nowPlayingState];
    [v22 addObserver:v27];

    v10 = -[NSHashTable initWithOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSHashTable),  "initWithOptions:capacity:",  5LL,  0LL);
    observers = v27->_observers;
    v27->_observers = v10;

    objc_storeStrong(&v23, 0LL);
  }

  v13 = v27;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v27, 0LL);
  return v13;
}

  ;
}

- (NSString)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p - analyzingAudio=%u playing=%u, visible=%u, isRemoteRoute=%u, pid=%u>",  objc_opt_class(self),  self,  self->_isAnalyzingAudio,  self->_playing,  self->_visible,  self->_remoteRoute,  self->_nowPlayingPID);
}

- (void)dealloc
{
  v8 = self;
  SEL v7 = a2;
  -[TVSSAudioAnalyzer removeObserver:](self->_audioAnalyzer, "removeObserver:", self);
  -[TVSSAudioNowPlayingController removeObserver:](v8->_nowPlayingController, "removeObserver:", v8);
  nowPlayingController = v8->_nowPlayingController;
  v2 = (objc_class *)objc_opt_class(v8);
  v5 = NSStringFromClass(v2);
  v4 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ - %p", v5, v8);
  -[TVSSAudioNowPlayingController removeActivationReason:](nowPlayingController, "removeActivationReason:");

  v6.receiver = v8;
  v6.super_class = (Class)&OBJC_CLASS___TVSSWaveformController;
  -[TVSSWaveformController dealloc](&v6, "dealloc");
}

- (void)updateAnalyzer
{
  v14 = self;
  location[1] = (id)a2;
  objc_super v6 = &_dispatch_main_q;
  dispatch_assert_queue_V2(v6);

  if (v14->_playing && v14->_visible && !v14->_remoteRoute && v14->_nowPlayingPID)
  {
    if (-[TVSSAudioAnalyzer pid](v14->_audioAnalyzer, "pid") != v14->_nowPlayingPID)
    {
      os_log_t v9 = (os_log_t)waveformControllerLog();
      os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        sub_1000A97C0((uint64_t)v16, (uint64_t)v14, v14->_nowPlayingPID);
        _os_log_impl((void *)&_mh_execute_header, v9, v8, "%@ Creating new audio analyzer for PID: %u", v16, 0x12u);
      }

      objc_storeStrong((id *)&v9, 0LL);
      -[TVSSAudioAnalyzer removeObserver:](v14->_audioAnalyzer, "removeObserver:", v14);
      v14->_isAnalyzingAudio = 0;
      v2 = (TVSSAudioAnalyzer *) +[TVSSAudioAnalyzer audioAnalyzerForPID:]( &OBJC_CLASS___TVSSAudioAnalyzer,  "audioAnalyzerForPID:",  v14->_nowPlayingPID);
      audioAnalyzer = v14->_audioAnalyzer;
      v14->_audioAnalyzer = v2;
    }

    if (!v14->_isAnalyzingAudio)
    {
      id v4 = +[TVSSWaveformData zero](&OBJC_CLASS___TVSSWaveformData, "zero");
      -[TVSSWaveformController setWaveform:](v14, "setWaveform:");

      os_log_t v7 = (os_log_t)waveformControllerLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        sub_10000D540((uint64_t)v15, (uint64_t)v14, (uint64_t)v14->_audioAnalyzer);
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ Starting audio analyzer: %@", v15, 0x16u);
      }

      objc_storeStrong((id *)&v7, 0LL);
      -[TVSSAudioAnalyzer addObserver:](v14->_audioAnalyzer, "addObserver:", v14);
      v14->_isAnalyzingAudio = 1;
    }
  }

  else if (v14->_audioAnalyzer && v14->_isAnalyzingAudio)
  {
    location[0] = waveformControllerLog();
    os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      sub_10000D540((uint64_t)v18, (uint64_t)v14, (uint64_t)v14->_audioAnalyzer);
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)location[0],  v12,  "%@ Stopping audio analyzer: %@",  v18,  0x16u);
    }

    objc_storeStrong(location, 0LL);
    -[TVSSAudioAnalyzer removeObserver:](v14->_audioAnalyzer, "removeObserver:", v14);
    v14->_isAnalyzingAudio = 0;
    id v5 = +[TVSSWaveformData zero](&OBJC_CLASS___TVSSWaveformData, "zero");
    -[TVSSWaveformController setWaveform:](v14, "setWaveform:");
  }

  else
  {
    os_log_t oslog = (os_log_t)waveformControllerLog();
    os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_10000D28C((uint64_t)v17, (uint64_t)v14);
      _os_log_impl((void *)&_mh_execute_header, oslog, v10, "%@ Skipping starting analyzer", v17, 0xCu);
    }

    objc_storeStrong((id *)&oslog, 0LL);
  }

- (void)addVisibleObserver:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  os_log_t oslog = (os_log_t)waveformControllerLog();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_10000D540((uint64_t)v6, (uint64_t)v5, (uint64_t)location[0]);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%@ adding observer: %@", v6, 0x16u);
  }

  objc_storeStrong((id *)&oslog, 0LL);
  -[NSHashTable addObject:](v5->_observers, "addObject:", location[0]);
  -[TVSSWaveformController setVisible:](v5, "setVisible:", 1LL);
  objc_storeStrong(location, 0LL);
}

- (void)removeVisibleObserver:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  os_log_t oslog = (os_log_t)waveformControllerLog();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_10000D540((uint64_t)v6, (uint64_t)v5, (uint64_t)location[0]);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%@ removing observer: %@", v6, 0x16u);
  }

  objc_storeStrong((id *)&oslog, 0LL);
  -[NSHashTable addObject:](v5->_observers, "addObject:", location[0]);
  if (!-[NSHashTable count](v5->_observers, "count")) {
    -[TVSSWaveformController setVisible:](v5, "setVisible:", 0LL);
  }
  objc_storeStrong(location, 0LL);
}

- (void)setNowPlayingPID:(int)a3
{
  objc_super v6 = self;
  SEL v5 = a2;
  int v4 = a3;
  if (a3 != self->_nowPlayingPID)
  {
    os_log_t oslog = (os_log_t)waveformControllerLog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_1000A9B94((uint64_t)v7, (uint64_t)v6, v6->_nowPlayingPID, v4);
      _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "%@ nowPlaying PID changing from: %u to: %u",  v7,  0x18u);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    v6->_nowPlayingPID = v4;
    -[TVSSWaveformController updateAnalyzer](v6, "updateAnalyzer");
  }

- (void)setVisible:(BOOL)a3
{
  objc_super v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  if (self->_visible != a3)
  {
    v6->_visible = v4;
    os_log_t oslog = (os_log_t)waveformControllerLog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_1000A97C0((uint64_t)v7, (uint64_t)v6, v4);
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%@ isVisible changed to: %u", v7, 0x12u);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    -[TVSSWaveformController updateRoute:](v6, "updateRoute:", v6->_endpointRoute);
    -[TVSSWaveformController updateAnalyzer](v6, "updateAnalyzer");
  }

- (void)setPlaying:(BOOL)a3
{
  objc_super v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  if (self->_playing != a3)
  {
    v6->_playing = v4;
    os_log_t oslog = (os_log_t)waveformControllerLog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_1000A97C0((uint64_t)v7, (uint64_t)v6, v4);
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%@ isPlaying changed to: %u", v7, 0x12u);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    -[TVSSWaveformController updateAnalyzer](v6, "updateAnalyzer");
  }

- (void)setWaveform:(id)a3
{
  os_log_type_t v12 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v12->_waveform, location[0]);
  memset(__b, 0, sizeof(__b));
  id obj =  -[TVSSWaveformController _observersCopyForSelector:]( v12,  "_observersCopyForSelector:",  "waveformController:waveformDidChange:");
  id v8 = [obj countByEnumeratingWithState:__b objects:v13 count:16];
  if (v8)
  {
    uint64_t v4 = *(void *)__b[2];
    uint64_t v5 = 0LL;
    id v6 = v8;
    while (1)
    {
      uint64_t v3 = v5;
      if (*(void *)__b[2] != v4) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(id *)(__b[1] + 8 * v5);
      [v10 waveformController:v12 waveformDidChange:location[0]];
      ++v5;
      if (v3 + 1 >= (unint64_t)v6)
      {
        uint64_t v5 = 0LL;
        id v6 = [obj countByEnumeratingWithState:__b objects:v13 count:16];
        if (!v6) {
          break;
        }
      }
    }
  }

  objc_storeStrong(location, 0LL);
}

- (void)setRemoteRoute:(BOOL)a3
{
  id v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  if (a3 != self->_remoteRoute)
  {
    v6->_remoteRoute = v4;
    os_log_t oslog = (os_log_t)waveformControllerLog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_1000A97C0((uint64_t)v7, (uint64_t)v6, v4);
      _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "%@ isRemoteRoute changed to: %{BOOL}u",  v7,  0x12u);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    -[TVSSWaveformController updateAnalyzer](v6, "updateAnalyzer");
  }

- (void)setRemoteRouteSymbolName:(id)a3
{
  id v19 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  remoteRouteSymbolName = v19->_remoteRouteSymbolName;
  id obj = location[0];
  id v21 = 0LL;
  objc_storeStrong(&v21, remoteRouteSymbolName);
  id v20 = 0LL;
  objc_storeStrong(&v20, obj);
  unsigned __int8 v13 = 1;
  if (v21 != v20) {
    unsigned __int8 v13 = [v21 isEqual:v20];
  }
  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(&v21, 0LL);
  if ((v13 & 1) == 0)
  {
    BOOL v4 = (NSString *)[location[0] copy];
    SEL v5 = v19->_remoteRouteSymbolName;
    v19->_remoteRouteSymbolName = v4;

    os_log_t oslog = (os_log_t)waveformControllerLog();
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_10000D540((uint64_t)v23, (uint64_t)v19, (uint64_t)location[0]);
      _os_log_impl((void *)&_mh_execute_header, oslog, type, "%@ remoteRouteSymbolName changed to: %@", v23, 0x16u);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    -[TVSSWaveformController setRemoteRoute:](v19, "setRemoteRoute:", location[0] != 0LL);
    memset(__b, 0, sizeof(__b));
    id v10 =  -[TVSSWaveformController _observersCopyForSelector:]( v19,  "_observersCopyForSelector:",  "waveformController:remoteRouteSymbolNameDidChange:");
    id v11 = [v10 countByEnumeratingWithState:__b objects:v22 count:16];
    if (v11)
    {
      uint64_t v7 = *(void *)__b[2];
      uint64_t v8 = 0LL;
      id v9 = v11;
      while (1)
      {
        uint64_t v6 = v8;
        if (*(void *)__b[2] != v7) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(id *)(__b[1] + 8 * v8);
        [v15 waveformController:v19 remoteRouteSymbolNameDidChange:v19->_remoteRouteSymbolName];
        ++v8;
        if (v6 + 1 >= (unint64_t)v9)
        {
          uint64_t v8 = 0LL;
          id v9 = [v10 countByEnumeratingWithState:__b objects:v22 count:16];
          if (!v9) {
            break;
          }
        }
      }
    }
  }

  objc_storeStrong(location, 0LL);
}

- (id)_observersCopyForSelector:(SEL)a3
{
  v16 = self;
  SEL v15 = a2;
  SEL v14 = a3;
  id v13 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSHashTable count](self->_observers, "count"));
  memset(__b, 0, sizeof(__b));
  id obj = v16->_observers;
  id v10 = -[NSHashTable countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v17,  16LL);
  if (v10)
  {
    uint64_t v6 = *(void *)__b[2];
    uint64_t v7 = 0LL;
    id v8 = v10;
    while (1)
    {
      uint64_t v5 = v7;
      if (*(void *)__b[2] != v6) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void *)(__b[1] + 8 * v7);
      if ((objc_opt_respondsToSelector(v12, v14) & 1) != 0) {
        [v13 addObject:v12];
      }
      ++v7;
      if (v5 + 1 >= (unint64_t)v8)
      {
        uint64_t v7 = 0LL;
        id v8 = -[NSHashTable countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v17,  16LL);
        if (!v8) {
          break;
        }
      }
    }
  }

  id v4 = v13;
  objc_storeStrong(&v13, 0LL);
  return v4;
}

- (void)setEndpointRoute:(id)a3
{
  uint64_t v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (location[0] != v7->_endpointRoute)
  {
    objc_storeStrong((id *)&v7->_endpointRoute, location[0]);
    os_log_t oslog = (os_log_t)waveformControllerLog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_10000D540((uint64_t)v8, (uint64_t)v7, (uint64_t)location[0]);
      _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "%@ endpointRoute changed to: %@",  v8,  0x16u);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    id v4 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter removeObserver:name:object:]( v4,  "removeObserver:name:object:",  v7,  MPAVRouteDidChangeNotification,  0LL);

    -[TVSSWaveformController updateRoute:](v7, "updateRoute:", location[0]);
    if (location[0])
    {
      uint64_t v3 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
      -[NSNotificationCenter addObserver:selector:name:object:]( v3,  "addObserver:selector:name:object:",  v7,  "routeDidUpdateNotification:",  MPAVRouteDidChangeNotification,  location[0]);
    }
  }

  objc_storeStrong(location, 0LL);
}

- (void)routeDidUpdateNotification:(id)a3
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  queue = &_dispatch_main_q;
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  uint64_t v7 = sub_1000AA940;
  id v8 = &unk_1001B5A60;
  id v9 = v11;
  dispatch_async(queue, &v4);

  objc_storeStrong((id *)&v9, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)updateRoute:(id)a3
{
  SEL v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  int v6 = &_dispatch_main_q;
  dispatch_assert_queue_V2(v6);

  id v12 = waveformControllerLog();
  os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
  {
    sub_10000D540((uint64_t)v15, (uint64_t)v14, (uint64_t)location[0]);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v12, v11, "%@ updating info from route: %@", v15, 0x16u);
  }

  objc_storeStrong(&v12, 0LL);
  id v10 = [location[0] endpointObject];
  id v9 = [v10 outputDevices];
  id v3 = objc_msgSend(v9, "msv_firstWhere:", &stru_1001B9940);
  BOOL v5 = v3 != 0LL;

  BOOL v8 = v5;
  if (v5)
  {
    id v7 = objc_msgSend(v9, "msv_map:", &stru_1001B9980);
    id v4 =  +[MPAVRoutingController _symbolNameForRoutes:]( &OBJC_CLASS___MPAVRoutingController,  "_symbolNameForRoutes:",  v7);
    -[TVSSWaveformController setRemoteRouteSymbolName:](v14, "setRemoteRouteSymbolName:");

    objc_storeStrong(&v7, 0LL);
  }

  else
  {
    -[TVSSWaveformController setRemoteRouteSymbolName:](v14, "setRemoteRouteSymbolName:", 0LL);
  }

  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)audioAnalyzer:(id)a3 didUpdateWaveform:(id)a4
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = 0LL;
  objc_storeStrong(&v5, a4);
  -[TVSSWaveformController setWaveform:](v7, "setWaveform:", v5);
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)nowPlayingController:(id)a3 didUpdateNowPlayingPlayerPath:(id)a4
{
  id v18 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v16 = 0LL;
  objc_storeStrong(&v16, a4);
  id v5 = [v16 client];
  unsigned int v6 = [v5 processIdentifier];

  unsigned int v15 = v6;
  queue = &_dispatch_main_q;
  BOOL v8 = _NSConcreteStackBlock;
  int v9 = -1073741824;
  int v10 = 0;
  os_log_type_t v11 = sub_1000AAEB4;
  id v12 = &unk_1001B7D28;
  id v13 = v18;
  unsigned int v14 = v15;
  dispatch_async(queue, &v8);

  objc_storeStrong((id *)&v13, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)nowPlayingState:(id)a3 playbackStateDidChange:(int64_t)a4
{
  unsigned int v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v12 = (void *)a4;
  queue = &_dispatch_main_q;
  unsigned int v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  int v9 = sub_1000AAFD8;
  int v10 = &unk_1001B99A8;
  v11[0] = v14;
  v11[1] = v12;
  dispatch_async(queue, &v6);

  objc_storeStrong(v11, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)nowPlayingState:(id)a3 currentMediaItemDidChange:(id)a4
{
  unsigned int v15 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v13 = 0LL;
  objc_storeStrong(&v13, a4);
  queue = &_dispatch_main_q;
  unsigned int v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  int v9 = sub_1000AB130;
  int v10 = &unk_1001B61C0;
  id v11 = v13;
  id v12 = v15;
  dispatch_async(queue, &v6);

  objc_storeStrong((id *)&v12, 0LL);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_updatePlaybackState:(int64_t)a3
{
  id v12 = self;
  SEL v11 = a2;
  int v10 = (void *)a3;
  queue = &_dispatch_main_q;
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = sub_1000AB404;
  int v8 = &unk_1001B99A8;
  v9[0] = v12;
  v9[1] = v10;
  dispatch_async(queue, &v4);

  objc_storeStrong(v9, 0LL);
}

- (TVSSWaveformData)waveform
{
  return self->_waveform;
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (BOOL)isRemoteRoute
{
  return self->_remoteRoute;
}

- (NSString)remoteRouteSymbolName
{
  return self->_remoteRouteSymbolName;
}

- (TVSSAudioNowPlayingController)nowPlayingController
{
  return self->_nowPlayingController;
}

- (void)setNowPlayingController:(id)a3
{
}

- (TVSSAudioAnalyzer)audioAnalyzer
{
  return self->_audioAnalyzer;
}

- (void)setAudioAnalyzer:(id)a3
{
}

- (MPAVEndpointRoute)endpointRoute
{
  return self->_endpointRoute;
}

- (BOOL)isAnalyzingAudio
{
  return self->_isAnalyzingAudio;
}

- (void)setIsAnalyzingAudio:(BOOL)a3
{
  self->_isAnalyzingAudio = a3;
}

- (CGSize)artworkFittingSize
{
  double height = self->_artworkFittingSize.height;
  double width = self->_artworkFittingSize.width;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setArtworkFittingSize:(CGSize)a3
{
  self->_artworkFittingSize = a3;
}

- (NSString)trackIdentifier
{
  return self->_trackIdentifier;
}

- (void)setTrackIdentifier:(id)a3
{
}

- (int)nowPlayingPID
{
  return self->_nowPlayingPID;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
}

@end