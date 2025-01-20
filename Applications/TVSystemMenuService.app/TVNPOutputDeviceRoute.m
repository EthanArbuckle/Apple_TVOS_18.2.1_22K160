@interface TVNPOutputDeviceRoute
- (BOOL)noiseControlSupported;
- (BOOL)spatialAudioSupported;
- (MPAVBatteryLevel)batteryLevel;
- (MPAVOutputDeviceRoute)outputDeviceRoute;
- (MPVolumeController)volumeController;
- (NSString)description;
- (TVNPOutputDeviceRoute)init;
- (id)_imageForAVRoute:(id)a3 destination:(id)a4;
- (id)deviceImage;
- (id)deviceTypeDescription;
- (id)overrideTitle;
- (void)_updateVolume;
- (void)setMuted:(BOOL)a3;
- (void)setOutputDeviceRoute:(id)a3;
- (void)setOverrideTitle:(id)a3;
- (void)setVolumeController:(id)a3;
- (void)setVolumeLevel:(id)a3;
- (void)updateWithOutputDevice:(id)a3 selectionState:(unint64_t)a4 destination:(id)a5 wantsVolumeUpdates:(BOOL)a6;
- (void)volumeController:(id)a3 mutedStateDidChange:(BOOL)a4;
- (void)volumeController:(id)a3 volumeControlAvailableDidChange:(BOOL)a4;
- (void)volumeController:(id)a3 volumeValueDidChange:(float)a4;
@end

@implementation TVNPOutputDeviceRoute

- (TVNPOutputDeviceRoute)init
{
  SEL v5 = a2;
  id v6 = 0LL;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVNPOutputDeviceRoute;
  id v6 = -[TVNPRoute _init](&v4, "_init");
  objc_storeStrong(&v6, v6);
  v3 = (TVNPOutputDeviceRoute *)v6;
  objc_storeStrong(&v6, 0LL);
  return v3;
}

- (NSString)description
{
  v7 = self;
  SEL v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVNPOutputDeviceRoute;
  v3 = -[TVNPOutputDeviceRoute description](&v5, "description");
  objc_super v4 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: MPAVRoute:%@",  v3,  v7->_outputDeviceRoute);

  return v4;
}

- (void)updateWithOutputDevice:(id)a3 selectionState:(unint64_t)a4 destination:(id)a5 wantsVolumeUpdates:(BOOL)a6
{
  v45 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  unint64_t v43 = a4;
  id v42 = 0LL;
  objc_storeStrong(&v42, a5);
  BOOL v41 = a6;
  BOOL v40 = v45->super._destination != v42;
  char v39 = (-[MPAVOutputDeviceRoute isEqual:](v45->_outputDeviceRoute, "isEqual:", location[0]) ^ 1) & 1;
  -[TVNPOutputDeviceRoute willChangeValueForKey:](v45, "willChangeValueForKey:", @"title");
  -[TVNPOutputDeviceRoute willChangeValueForKey:](v45, "willChangeValueForKey:", @"deviceType");
  -[TVNPOutputDeviceRoute willChangeValueForKey:](v45, "willChangeValueForKey:", @"canBeGrouped");
  -[TVNPOutputDeviceRoute willChangeValueForKey:](v45, "willChangeValueForKey:", @"selectionState");
  -[TVNPOutputDeviceRoute willChangeValueForKey:](v45, "willChangeValueForKey:", @"destination");
  -[TVNPOutputDeviceRoute willChangeValueForKey:](v45, "willChangeValueForKey:", @"local");
  -[TVNPOutputDeviceRoute willChangeValueForKey:](v45, "willChangeValueForKey:", @"routeUID");
  -[TVNPOutputDeviceRoute willChangeValueForKey:](v45, "willChangeValueForKey:", @"groupUID");
  -[TVNPOutputDeviceRoute willChangeValueForKey:](v45, "willChangeValueForKey:", @"outputDeviceRoute");
  -[TVNPOutputDeviceRoute willChangeValueForKey:](v45, "willChangeValueForKey:", @"silentPrimary");
  -[TVNPOutputDeviceRoute willChangeValueForKey:](v45, "willChangeValueForKey:", @"available");
  -[TVNPOutputDeviceRoute willChangeValueForKey:](v45, "willChangeValueForKey:", @"spatialAudioSupported");
  -[TVNPOutputDeviceRoute willChangeValueForKey:](v45, "willChangeValueForKey:", @"noiseControlSupported");
  -[TVNPOutputDeviceRoute willChangeValueForKey:](v45, "willChangeValueForKey:", @"batteryLevel");
  id v31 = -[TVNPOutputDeviceRoute overrideTitle](v45, "overrideTitle");
  char v37 = 0;
  char v35 = 0;
  if (v31)
  {
    objc_storeStrong((id *)&v45->super._title, v31);
  }

  else
  {
    id v38 = [location[0] routeName];
    char v37 = 1;
    id v36 = [v38 copy];
    char v35 = 1;
    objc_storeStrong((id *)&v45->super._title, v36);
  }

  if ((v35 & 1) != 0) {

  }
  if ((v37 & 1) != 0) {
  id v6 = objc_msgSend(location[0], "tvnp_deviceType");
  }
  v45->super._deviceType = (unint64_t)v6;
  if ([location[0] isSplitterCapable])
  {
    int v27 = 1;
  }

  else
  {
    if ([location[0] logicalLeaderOutputDevice]) {
      int v26 = MRAVOutputDeviceIsGroupable([location[0] logicalLeaderOutputDevice]) & 1;
    }
    else {
      int v26 = 0;
    }
    int v27 = v26;
  }

  v45->super._canBeGrouped = v27 != 0;
  v45->super._selectionState = v43;
  objc_storeStrong((id *)&v45->super._destination, v42);
  BOOL v25 = 1;
  v45->super._local = v25;
  v7 = (NSString *)[location[0] routeUID];
  routeUID = v45->super._routeUID;
  v45->super._routeUID = v7;

  v9 = (NSString *)[location[0] groupUID];
  groupUID = v45->super._groupUID;
  v45->super._groupUID = v9;

  objc_storeStrong((id *)&v45->_outputDeviceRoute, location[0]);
  unsigned __int8 v11 = [location[0] isProxyGroupPlayer];
  v45->super._silentPrimary = v11 & 1;
  v45->super._available = 1;
  char v12 = MRAVOutputDeviceSupportsHeadTrackedSpatialAudio([location[0] logicalLeaderOutputDevice]);
  v45->_spatialAudioSupported = v12 & 1;
  id v24 = (id)MRAVOutputDeviceCopyAvailableBluetoothListeningMode([location[0] logicalLeaderOutputDevice]);
  BOOL v13 = (unint64_t)[v24 count] > 1;
  v45->_noiseControlSupported = v13;

  v14 = (MPAVBatteryLevel *)[location[0] batteryLevel];
  batteryLevel = v45->_batteryLevel;
  v45->_batteryLevel = v14;

  if (v45->super._local)
  {
    -[TVNPOutputDeviceRoute willChangeValueForKey:](v45, "willChangeValueForKey:");
    v16 = (UIImage *) -[TVNPOutputDeviceRoute _imageForAVRoute:destination:]( v45,  "_imageForAVRoute:destination:",  v45->_outputDeviceRoute,  v45->super._destination);
    deviceImage = v45->super._deviceImage;
    v45->super._deviceImage = v16;

    -[TVNPOutputDeviceRoute didChangeValueForKey:](v45, "didChangeValueForKey:", @"deviceImage");
  }

  if (!v45->super._volumeLevel || (char v23 = 1, ([v42 isConnected] & 1) != 0))
  {
    unsigned __int8 v22 = 0;
    if (!v45->super._volumeLevel) {
      unsigned __int8 v22 = [v42 isConnected];
    }
    char v23 = v22;
  }

  char v34 = v23 & 1;
  if ((v40 || (v39 & 1) != 0 || (v34 & 1) != 0) && v41)
  {
    id v33 = [v42 endpointRoute];
    if (v33 && ([v42 isConnected] & 1) != 0)
    {
      if (v40 || (v39 & 1) != 0 || !v45->_volumeController)
      {
        id v18 = objc_alloc(&OBJC_CLASS___MPVolumeControllerRouteDataSource);
        id v32 = [v18 initWithGroupRoute:v33 outputDeviceRoute:location[0]];
        v19 = objc_alloc(&OBJC_CLASS___MPVolumeController);
        v20 = -[MPVolumeController initWithDataSource:](v19, "initWithDataSource:", v32);
        volumeController = v45->_volumeController;
        v45->_volumeController = v20;

        -[MPVolumeController setDelegate:](v45->_volumeController, "setDelegate:", v45);
        -[TVNPOutputDeviceRoute _updateVolume](v45, "_updateVolume");
        objc_storeStrong(&v32, 0LL);
      }

      else if ((v34 & 1) != 0)
      {
        -[TVNPOutputDeviceRoute _updateVolume](v45, "_updateVolume");
      }
    }

    else if (([v42 isConnected] & 1) == 0)
    {
      objc_storeStrong((id *)&v45->_volumeController, 0LL);
      -[TVNPOutputDeviceRoute _updateVolume](v45, "_updateVolume");
    }

    objc_storeStrong(&v33, 0LL);
  }

  -[TVNPOutputDeviceRoute didChangeValueForKey:](v45, "didChangeValueForKey:", @"title");
  -[TVNPOutputDeviceRoute didChangeValueForKey:](v45, "didChangeValueForKey:", @"deviceType");
  -[TVNPOutputDeviceRoute didChangeValueForKey:](v45, "didChangeValueForKey:", @"canBeGrouped");
  -[TVNPOutputDeviceRoute didChangeValueForKey:](v45, "didChangeValueForKey:", @"selectionState");
  -[TVNPOutputDeviceRoute didChangeValueForKey:](v45, "didChangeValueForKey:", @"destination");
  -[TVNPOutputDeviceRoute didChangeValueForKey:](v45, "didChangeValueForKey:", @"local");
  -[TVNPOutputDeviceRoute didChangeValueForKey:](v45, "didChangeValueForKey:", @"routeUID");
  -[TVNPOutputDeviceRoute didChangeValueForKey:](v45, "didChangeValueForKey:", @"groupUID");
  -[TVNPOutputDeviceRoute didChangeValueForKey:](v45, "didChangeValueForKey:", @"outputDeviceRoute");
  -[TVNPOutputDeviceRoute didChangeValueForKey:](v45, "didChangeValueForKey:", @"silentPrimary");
  -[TVNPOutputDeviceRoute didChangeValueForKey:](v45, "didChangeValueForKey:", @"available");
  -[TVNPOutputDeviceRoute didChangeValueForKey:](v45, "didChangeValueForKey:", @"spatialAudioSupported");
  -[TVNPOutputDeviceRoute didChangeValueForKey:](v45, "didChangeValueForKey:", @"noiseControlSupported");
  -[TVNPOutputDeviceRoute didChangeValueForKey:](v45, "didChangeValueForKey:", @"batteryLevel");
  objc_storeStrong(&v42, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)deviceImage
{
  if (!self->super._deviceImage)
  {
    v2 = (UIImage *) -[TVNPOutputDeviceRoute _imageForAVRoute:destination:]( self,  "_imageForAVRoute:destination:",  self->_outputDeviceRoute,  self->super._destination);
    deviceImage = self->super._deviceImage;
    self->super._deviceImage = v2;
  }

  return self->super._deviceImage;
}

- (void)setVolumeLevel:(id)a3
{
  objc_super v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (([location[0] isEqual:v5->super._volumeLevel] & 1) == 0)
  {
    objc_storeStrong((id *)&v5->super._volumeLevel, location[0]);
    volumeController = v5->_volumeController;
    [location[0] floatValue];
    -[MPVolumeController setVolume:withNotificationDelay:](volumeController, "setVolume:withNotificationDelay:");
  }

  objc_storeStrong(location, 0LL);
}

- (void)setMuted:(BOOL)a3
{
  if (a3 != self->super._muted)
  {
    self->super._muted = a3;
    -[MPVolumeController setMuted:](self->_volumeController, "setMuted:", a3);
  }

- (id)deviceTypeDescription
{
  unint64_t deviceType = self->super._deviceType;
  if (deviceType <= 0xB) {
    __asm { BR              X8 }
  }

  return v4;
}

- (void)volumeController:(id)a3 volumeControlAvailableDidChange:(BOOL)a4
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  BOOL v12 = a4;
  queue = &_dispatch_main_q;
  id v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  v9 = sub_10000A9BC;
  v10 = &unk_100048E50;
  unsigned __int8 v11 = v14;
  dispatch_async(queue, &v6);

  objc_storeStrong((id *)&v11, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)volumeController:(id)a3 volumeValueDidChange:(float)a4
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  float v12 = a4;
  queue = &_dispatch_main_q;
  id v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  v9 = sub_10000AAD0;
  v10 = &unk_100048E50;
  unsigned __int8 v11 = v14;
  dispatch_async(queue, &v6);

  objc_storeStrong((id *)&v11, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)volumeController:(id)a3 mutedStateDidChange:(BOOL)a4
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  BOOL v12 = a4;
  queue = &_dispatch_main_q;
  id v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  v9 = sub_10000ABE8;
  v10 = &unk_100048E50;
  unsigned __int8 v11 = v14;
  dispatch_async(queue, &v6);

  objc_storeStrong((id *)&v11, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)setOverrideTitle:(id)a3
{
  objc_super v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0LL);
}

- (id)overrideTitle
{
  return self->_overrideTitle;
}

- (id)_imageForAVRoute:(id)a3 destination:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 = 0LL;
  objc_storeStrong(&v7, a4);
  if ([location[0] routeSubtype] == (id)10)
  {
    if ([v7 isCurrentDestination])
    {
      id v9 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"tv.and.hifispeaker.fill");
    }

    else
    {
      id v5 =  +[MPAVRoutingController _currentDeviceRoutingSymbolName]( &OBJC_CLASS___MPAVRoutingController,  "_currentDeviceRoutingSymbolName");
      id v9 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:");
    }
  }

  else
  {
    id v9 =  +[MPAVRoutingController _symbolImageForRoute:]( &OBJC_CLASS___MPAVRoutingController,  "_symbolImageForRoute:",  location[0]);
  }

  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
  return v9;
}

- (void)_updateVolume
{
  unsigned __int8 v22 = self;
  SEL v21 = a2;
  -[TVNPOutputDeviceRoute willChangeValueForKey:](self, "willChangeValueForKey:", @"volumeLevel");
  char v20 = -[TVNPRoutingDestination isConnected](v22->super._destination, "isConnected");
  char v19 = -[MPVolumeController isVolumeControlAvailable]( v22->_volumeController,  "isVolumeControlAvailable") & 1;
  id v9 = -[TVNPOutputDeviceRoute outputDeviceRoute](v22, "outputDeviceRoute");
  BOOL v10 = 0;

  BOOL v18 = v10;
  id v5 = -[TVNPOutputDeviceRoute outputDeviceRoute](v22, "outputDeviceRoute");
  BOOL v6 = -[MPAVOutputDeviceRoute routeSubtype](v5, "routeSubtype") == (id)10;

  BOOL v17 = v6;
  id v7 = -[TVNPOutputDeviceRoute outputDeviceRoute](v22, "outputDeviceRoute");
  unsigned __int8 v8 = -[MPAVOutputDeviceRoute isHomeTheaterRoute](v7, "isHomeTheaterRoute");

  char v16 = v8 & 1;
  id v15 = &_os_log_default;
  char v14 = 2;
  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEBUG))
  {
    log = (os_log_s *)v15;
    os_log_type_t type = v14;
    objc_super v4 = -[TVNPRoute title](v22, "title");
    BOOL v13 = v4;
    sub_10000B1B0( (uint64_t)v23,  (uint64_t)"-[TVNPOutputDeviceRoute _updateVolume]",  (uint64_t)v13,  v20 & 1,  v19 & 1,  v18,  v17);
    _os_log_debug_impl( (void *)&_mh_execute_header,  log,  type,  "%s: Update output device route volume. title: %{public}@, isConnected: %d, isVolumeControlAvailable: %d, isGroupLe aderAppleTV: %d, isLocalHDMI: %d",  v23,  0x2Eu);

    objc_storeStrong((id *)&v13, 0LL);
  }

  objc_storeStrong(&v15, 0LL);
  char v11 = 0;
  if ((v20 & 1) != 0 && (v19 & 1) != 0 && (!v18 || (v16 & 1) != 0) && !v17)
  {
    -[MPVolumeController volumeValue](v22->_volumeController, "volumeValue");
    BOOL v12 = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:");
    char v11 = 1;
    objc_storeStrong((id *)&v22->super._volumeLevel, v12);
  }

  else
  {
    objc_storeStrong((id *)&v22->super._volumeLevel, 0LL);
  }

  if ((v11 & 1) != 0) {

  }
  -[TVNPOutputDeviceRoute didChangeValueForKey:](v22, "didChangeValueForKey:", @"volumeLevel");
}

- (MPAVOutputDeviceRoute)outputDeviceRoute
{
  return self->_outputDeviceRoute;
}

- (void)setOutputDeviceRoute:(id)a3
{
}

- (BOOL)spatialAudioSupported
{
  return self->_spatialAudioSupported;
}

- (BOOL)noiseControlSupported
{
  return self->_noiseControlSupported;
}

- (MPAVBatteryLevel)batteryLevel
{
  return self->_batteryLevel;
}

- (MPVolumeController)volumeController
{
  return self->_volumeController;
}

- (void)setVolumeController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end