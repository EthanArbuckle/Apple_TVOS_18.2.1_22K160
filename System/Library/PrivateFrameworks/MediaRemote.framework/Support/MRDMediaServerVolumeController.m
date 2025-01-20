@interface MRDMediaServerVolumeController
- (BOOL)_platformHasNativeMuteSupport;
- (BOOL)isMuted;
- (MRDMediaServerVolumeController)initWithRoutingDataSource:(id)a3;
- (float)_volumeFromAVController;
- (float)currentVolume;
- (id)_mediaServerController;
- (id)_pineboardHangdogInterface;
- (id)debugDescription;
- (unsigned)capabilities;
- (unsigned)pbsVolumeControlCapabilities;
- (void)_avSessionMediaServicesResetNotification:(id)a3;
- (void)_currentRouteHasVolumeControlDidChangeNotification:(id)a3;
- (void)_forceEnableCECVolumeNotification:(id)a3;
- (void)_initVolumeDataIfNeccessary;
- (void)_postIsMutedDidChange:(BOOL)a3;
- (void)_postVolumeControlCapabilitiesDidChange:(unsigned int)a3;
- (void)_postVolumeDidChange:(float)a3;
- (void)_reloadVolumeDataWithReason:(id)a3;
- (void)_setupNotifications;
- (void)_systemMuteDidChange:(id)a3;
- (void)_systemVolumeDidChange:(id)a3;
- (void)_tearDownNotifications;
- (void)_updateCapabilitiesValueCache;
- (void)_updateIsMutedValueCache;
- (void)_updateVolumeValueCache;
- (void)adjustVolume:(int64_t)a3 error:(id *)a4;
- (void)adjustVolumeWithStepAmount:(float)a3 error:(id *)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setIsMuted:(BOOL)a3 error:(id *)a4;
- (void)setVolume:(float)a3 error:(id *)a4;
@end

@implementation MRDMediaServerVolumeController

- (MRDMediaServerVolumeController)initWithRoutingDataSource:(id)a3
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MRDMediaServerVolumeController;
  v3 = -[MRDVolumeController initWithRoutingDataSource:](&v20, "initWithRoutingDataSource:", a3);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    id v5 = off_1003F7980();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    [v4 addObserver:v3 selector:"_avSessionMediaServicesResetNotification:" name:v6 object:0];

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v7 addObserver:v3 selector:"_forceEnableCECVolumeNotification:" name:MRUserSettingsForceEnableCECVolumeDidChange object:0];

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    unsigned int v9 = [v8 supportCoordinatedVolume];

    if (v9)
    {
      v10 = (PBSVolumeControlService *)objc_alloc_init((Class)MSVWeakLinkClass( @"PBVolumeControlService",  @"PineBoardServices"));
      pbsVolumeController = v3->_pbsVolumeController;
      v3->_pbsVolumeController = v10;

      v12 = v3->_pbsVolumeController;
      v13 = NSStringFromSelector("volumeControlCapabilities");
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      -[PBSVolumeControlService addObserver:forKeyPath:options:context:]( v12,  "addObserver:forKeyPath:options:context:",  v3,  v14,  0LL,  off_1003F7988);
    }

    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaServerVolumeController _pineboardHangdogInterface](v3, "_pineboardHangdogInterface"));
      v15 = NSStringFromSelector("volumeControlAvailable");
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      [v14 addObserver:v3 forKeyPath:v16 options:0 context:off_1003F7990];
    }

    -[MRDMediaServerVolumeController _setupNotifications](v3, "_setupNotifications");
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100124A34;
    block[3] = &unk_100399250;
    v19 = v3;
    dispatch_async(&_dispatch_main_q, block);
  }

  return v3;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MRDMediaServerVolumeController;
  -[MRDMediaServerVolumeController dealloc](&v4, "dealloc");
}

- (id)debugDescription
{
  v17 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v3 = objc_opt_class(self);
  uint64_t v4 = MRMediaRemoteVolumeControlCapabilitiesDescription(self->_capabilitiesValue);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  double volumeValue = self->_volumeValue;
  BOOL isMutedValue = self->_isMutedValue;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaServerVolumeController _mediaServerController](self, "_mediaServerController"));
  unsigned int v9 = [v8 currentRouteHasVolumeControl];
  uint64_t v10 = MRMediaRemoteVolumeControlCapabilitiesDescription(-[MRDMediaServerVolumeController pbsVolumeControlCapabilities](self, "pbsVolumeControlCapabilities"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaServerVolumeController _pineboardHangdogInterface](self, "_pineboardHangdogInterface"));
  unsigned int v13 = [v12 volumeControlAvailable];
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  v15 = -[NSString initWithFormat:]( v17,  "initWithFormat:",  @"<%@:%p = {\n  capabilities=%@\n  volume=%lf\n  muted=%u\n  AVSC.currentRouteHasVolumeControl=%u\n  PBS.capabilities=%@\n  hangdog.volumeControlAvailable=%u\n  forceEnableCECVolume=%u\n}>",  v3,  self,  v5,  *(void *)&volumeValue,  isMutedValue,  v9,  v11,  v13,  [v14 forceEnableCECVolume]);

  return v15;
}

- (unsigned)capabilities
{
  return self->_capabilitiesValue;
}

- (float)currentVolume
{
  return self->_volumeValue;
}

- (BOOL)isMuted
{
  return self->_isMutedValue;
}

- (void)setVolume:(float)a3 error:(id *)a4
{
  if (self->_volumeValue != a3)
  {
    uint64_t v6 = _MRLogForCategory(0LL, a2);
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v14 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[MRDVolumeController] Setting AVSC volume to %f",  buf,  0xCu);
    }

    self->_double volumeValue = a3;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100124DC4;
    block[3] = &unk_100399250;
    id v12 = (id)objc_claimAutoreleasedReturnValue(-[MRDMediaServerVolumeController _mediaServerController](self, "_mediaServerController"));
    uint64_t v8 = qword_1003FE080;
    id v9 = v12;
    if (v8 != -1) {
      dispatch_once(&qword_1003FE080, block);
    }
    *(float *)&double v10 = self->_volumeValue;
    [v9 setVolumeTo:qword_1003FE078 forCategory:v10];
  }

- (void)adjustVolumeWithStepAmount:(float)a3 error:(id *)a4
{
  *(float *)&double v4 = self->_volumeValue + a3;
  -[MRDMediaServerVolumeController setVolume:error:](self, "setVolume:error:", a4, v4);
}

- (void)setIsMuted:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v7 = _MRLogForCategory(0LL, a2);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = @"NO";
    if (v5) {
      id v9 = @"YES";
    }
    int v33 = 138412290;
    v34 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[MRDVolumeController] Setting AVSC isMuted to %@",  (uint8_t *)&v33,  0xCu);
  }

  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaServerVolumeController _mediaServerController](self, "_mediaServerController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v5));
  [v10 setAttribute:v11 forKey:AVSystemController_FullMuteAttribute error:a4];

  if (*a4)
  {
    uint64_t v13 = _MRLogForCategory(0LL, v12);
    double v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1002BA340((uint64_t)a4, v14, v15, v16, v17, v18, v19, v20);
    }
  }

  if (self->_pbsVolumeController)
  {
    uint64_t v21 = _MRLogForCategory(0LL, v12);
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = @"NO";
      if (v5) {
        v23 = @"YES";
      }
      int v33 = 138412290;
      v34 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "[MRDVolumeController] Setting PBS isMuted to %@",  (uint8_t *)&v33,  0xCu);
    }

    -[PBSVolumeControlService setIsMuted:error:](self->_pbsVolumeController, "setIsMuted:error:", v5, a4);
    if (*a4)
    {
      uint64_t v25 = _MRLogForCategory(0LL, v24);
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_1002BA2D8((uint64_t)a4, v26, v27, v28, v29, v30, v31, v32);
      }
    }
  }

- (void)adjustVolume:(int64_t)a3 error:(id *)a4
{
  if (self->_pbsVolumeController)
  {
    uint64_t v7 = MRMediaRemoteVolumeControlAdjustmentDescription(a3);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    uint64_t v10 = _MRLogForCategory(0LL, v9);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      v22 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[MRDVolumeController] Adjusting PBS volume by %@",  (uint8_t *)&v21,  0xCu);
    }

    -[PBSVolumeControlService adjustRelativeVolumeLevel:error:]( self->_pbsVolumeController,  "adjustRelativeVolumeLevel:error:",  a3,  a4);
    if (*a4)
    {
      uint64_t v13 = _MRLogForCategory(0LL, v12);
      double v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1002BA3A8((uint64_t)a4, v14, v15, v16, v17, v18, v19, v20);
      }
    }
  }

- (id)_mediaServerController
{
  return +[AVSystemController sharedAVSystemController](&OBJC_CLASS___AVSystemController, "sharedAVSystemController");
}

- (void)_setupNotifications
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaServerVolumeController _mediaServerController](self, "_mediaServerController"));
  id v4 = off_1003F7980();
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v16 = v5;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  [v3 setAttribute:v6 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];

  if (AVSystemController_SystemVolumeDidChangeNotification)
  {
    uint64_t v15 = AVSystemController_SystemVolumeDidChangeNotification;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
    [v3 setAttribute:v7 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v8 addObserver:self selector:"_systemVolumeDidChange:" name:AVSystemController_SystemVolumeDidChangeNotification object:v3];
  }

  if (AVSystemController_FullMuteDidChangeNotification)
  {
    uint64_t v14 = AVSystemController_FullMuteDidChangeNotification;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
    [v3 setAttribute:v9 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v10 addObserver:self selector:"_systemMuteDidChange:" name:AVSystemController_FullMuteDidChangeNotification object:v3];
  }

  if (AVSystemController_CurrentRouteHasVolumeControlDidChangeNotification)
  {
    uint64_t v13 = AVSystemController_CurrentRouteHasVolumeControlDidChangeNotification;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
    [v3 setAttribute:v11 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v12 addObserver:self selector:"_currentRouteHasVolumeControlDidChangeNotification:" name:AVSystemController_CurrentRouteHasVolumeControlDidChangeNotification object:v3];
  }
}

- (void)_tearDownNotifications
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MRDMediaServerVolumeController _mediaServerController](self, "_mediaServerController"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:AVSystemController_SystemVolumeDidChangeNotification object:v4];
  [v3 removeObserver:self name:AVSystemController_FullMuteDidChangeNotification object:v4];
  [v3 removeObserver:self name:AVSystemController_CurrentRouteHasVolumeControlDidChangeNotification object:v4];
}

- (void)_systemVolumeDidChange:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  id v5 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKey:AVSystemController_AudioCategoryNotificationParameter]);

  if (([v5 isEqualToString:@"MediaPlayback"] & 1) != 0
    || [v5 isEqualToString:@"Audio/Video"])
  {
    -[MRDMediaServerVolumeController _updateVolumeValueCache](self, "_updateVolumeValueCache");
  }
}

- (void)_systemMuteDidChange:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 name]);
  -[MRDMediaServerVolumeController _reloadVolumeDataWithReason:](self, "_reloadVolumeDataWithReason:", v4);
}

- (void)_currentRouteHasVolumeControlDidChangeNotification:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 name]);
  -[MRDMediaServerVolumeController _reloadVolumeDataWithReason:](self, "_reloadVolumeDataWithReason:", v4);
}

- (void)_avSessionMediaServicesResetNotification:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _MRLogForCategory(0LL, v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[MRDVolumeController] AVAudioSessionMediaServicesWereReset notification received -- re-registering notifications",  v9,  2u);
  }

  -[MRDMediaServerVolumeController _tearDownNotifications](self, "_tearDownNotifications");
  -[MRDMediaServerVolumeController _setupNotifications](self, "_setupNotifications");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);

  -[MRDMediaServerVolumeController _reloadVolumeDataWithReason:](self, "_reloadVolumeDataWithReason:", v8);
}

- (void)_forceEnableCECVolumeNotification:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 name]);
  -[MRDMediaServerVolumeController _reloadVolumeDataWithReason:](self, "_reloadVolumeDataWithReason:", v4);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_1003F7988 == a6)
  {
    uint64_t v13 = NSStringFromSelector("volumeControlCapabilities");
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    unsigned int v15 = [v10 isEqualToString:v14];

    if (!v15) {
      goto LABEL_9;
    }
    uint64_t v16 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"PBS.%@", v10);
LABEL_8:
    uint64_t v20 = v16;
    -[MRDMediaServerVolumeController _reloadVolumeDataWithReason:](self, "_reloadVolumeDataWithReason:", v16);

    goto LABEL_9;
  }

  if (off_1003F7990 == a6)
  {
    uint64_t v17 = NSStringFromSelector("volumeControlAvailable");
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    unsigned int v19 = [v10 isEqualToString:v18];

    if (!v19) {
      goto LABEL_9;
    }
    uint64_t v16 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"PBS.MRP.%@", v10);
    goto LABEL_8;
  }

  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___MRDMediaServerVolumeController;
  -[MRDMediaServerVolumeController observeValueForKeyPath:ofObject:change:context:]( &v21,  "observeValueForKeyPath:ofObject:change:context:",  v10,  v11,  v12,  a6);
LABEL_9:
}

- (void)_initVolumeDataIfNeccessary
{
  if (!self->_volumeDataIntialized) {
    -[MRDMediaServerVolumeController _reloadVolumeDataWithReason:](self, "_reloadVolumeDataWithReason:", 0LL);
  }
}

- (void)_reloadVolumeDataWithReason:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _MRLogForCategory(0LL, v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[MRDVolumeController] Reloading volume for reason: %@",  (uint8_t *)&v8,  0xCu);
  }

  -[MRDMediaServerVolumeController _updateCapabilitiesValueCache](self, "_updateCapabilitiesValueCache");
  -[MRDMediaServerVolumeController _updateIsMutedValueCache](self, "_updateIsMutedValueCache");
  -[MRDMediaServerVolumeController _updateVolumeValueCache](self, "_updateVolumeValueCache");
}

- (float)_volumeFromAVController
{
  float v6 = 0.0;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaServerVolumeController _mediaServerController](self, "_mediaServerController"));
  [v3 getVolume:&v6 forCategory:@"MediaPlayback"];
  if (!-[MRDMediaServerVolumeController _platformHasNativeMuteSupport](self, "_platformHasNativeMuteSupport")
    && self->_isMutedValue)
  {
    float v6 = 0.0;
  }

  float v4 = v6;

  return v4;
}

- (void)_updateVolumeValueCache
{
  self->_double volumeValue = v3;
  -[MRDMediaServerVolumeController _postVolumeDidChange:](self, "_postVolumeDidChange:");
}

- (void)_updateIsMutedValueCache
{
  float v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaServerVolumeController _mediaServerController](self, "_mediaServerController"));
  float v4 = (void *)objc_claimAutoreleasedReturnValue([v3 attributeForKey:AVSystemController_FullMuteAttribute]);
  id v5 = [v4 BOOLValue];

  self->_BOOL isMutedValue = (char)v5;
  -[MRDMediaServerVolumeController _postIsMutedDidChange:](self, "_postIsMutedDidChange:", v5);
}

- (void)_updateCapabilitiesValueCache
{
  float v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaServerVolumeController _mediaServerController](self, "_mediaServerController"));
  unsigned int v4 = [v3 currentRouteHasVolumeControl];

  if (v4) {
    int v5 = 2;
  }
  else {
    int v5 = 0;
  }
  if (((unint64_t)-[PBSVolumeControlService volumeControlCapabilities]( self->_pbsVolumeController,  "volumeControlCapabilities") & 2) != 0) {
    int v6 = 2;
  }
  else {
    int v6 = v5;
  }
  unsigned int v7 = v6 & 0xFFFFFFFB | (4
                        * (-[PBSVolumeControlService volumeControlCapabilities]( self->_pbsVolumeController,  "volumeControlCapabilities") & 1));
  int v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaServerVolumeController _pineboardHangdogInterface](self, "_pineboardHangdogInterface"));
  unsigned int v9 = [v8 volumeControlAvailable];

  unsigned int v10 = v7 | v9;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  if ([v11 supportCoordinatedVolume])
  {
    unsigned int v12 = -[PBSVolumeControlService volumeControlCapabilities]( self->_pbsVolumeController,  "volumeControlCapabilities");

    unsigned int v10 = v10 & 0xFFFFFFF7 | (8 * ((v12 >> 2) & 1));
  }

  else
  {
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned int v14 = [v13 forceEnableCECVolume];

  if (v14) {
    uint64_t v15 = v10 | 5;
  }
  else {
    uint64_t v15 = v10;
  }
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  if ([v16 supportCoordinatedVolume])
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaServerVolumeController _mediaServerController](self, "_mediaServerController"));

    if (v17) {
      uint64_t v15 = v15 | 8;
    }
    else {
      uint64_t v15 = v15;
    }
  }

  else
  {
  }

  self->_capabilitiesValue = v15;
  -[MRDMediaServerVolumeController _postVolumeControlCapabilitiesDidChange:]( self,  "_postVolumeControlCapabilitiesDidChange:",  v15);
}

- (void)_postVolumeDidChange:(float)a3
{
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v7 nowPlayingServer]);
  int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 localOriginClient]);
  *(float *)&double v6 = a3;
  [v5 setVolume:v6];
}

- (void)_postIsMutedDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v6 nowPlayingServer]);
  int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 localOriginClient]);
  [v5 setIsMuted:v3];
}

- (void)_postVolumeControlCapabilitiesDidChange:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v6 nowPlayingServer]);
  int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 localOriginClient]);
  [v5 setVolumeControlCapabilities:v3];
}

- (BOOL)_platformHasNativeMuteSupport
{
  return 1;
}

- (id)_pineboardHangdogInterface
{
  if (sub_10013DAD4())
  {
    id v2 = objc_msgSend( (id)MSVWeakLinkClass(@"PBSSystemServiceConnection", @"PineBoardServices"),  "sharedConnection");
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 mediaRemoteServiceProxy]);
  }

  else
  {
    unsigned int v4 = 0LL;
  }

  return v4;
}

- (unsigned)pbsVolumeControlCapabilities
{
  int v3 = -[PBSVolumeControlService volumeControlCapabilities]( self->_pbsVolumeController,  "volumeControlCapabilities") & 2;
  unsigned int v4 = v3 & 0xFFFFFFFB | (4
                        * (-[PBSVolumeControlService volumeControlCapabilities]( self->_pbsVolumeController,  "volumeControlCapabilities") & 1));
  return v4 & 0xFFFFFFF7 | (8
                          * ((-[PBSVolumeControlService volumeControlCapabilities]( self->_pbsVolumeController,  "volumeControlCapabilities") >> 2) & 1));
}

- (void).cxx_destruct
{
}

@end