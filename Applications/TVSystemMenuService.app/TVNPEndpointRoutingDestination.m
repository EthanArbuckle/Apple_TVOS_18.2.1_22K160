@interface TVNPEndpointRoutingDestination
+ (id)keyPathsForValuesAffectingConnected;
+ (id)keyPathsForValuesAffectingDisconnected;
+ (id)keyPathsForValuesAffectingPaired;
+ (unint64_t)_playbackStateForMPCPlaybackState:(int64_t)a3;
- (BOOL)isConnected;
- (BOOL)isConnecting;
- (BOOL)isDisconnected;
- (BOOL)isPaired;
- (MPAVEndpointRoute)endpointRoute;
- (MPVolumeController)volumeController;
- (NSCopying)routeConnectionObserverToken;
- (NSString)description;
- (TVNPEndpointRouteConnection)routeConnection;
- (TVNPEndpointRoutingDestination)initWithEndpointRoute:(id)a3;
- (id)deviceImage;
- (unint64_t)connectionState;
- (void)_metadataDidChange:(id)a3 forKeys:(id)a4;
- (void)_updateVolume;
- (void)connectAndPair;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)refreshPropertiesWithRoute:(id)a3;
- (void)setConnectionState:(unint64_t)a3;
- (void)setIsCurrentDestination:(BOOL)a3;
- (void)setMuted:(BOOL)a3;
- (void)setVolumeLevel:(id)a3;
- (void)togglePlayPause;
- (void)volumeController:(id)a3 volumeControlAvailableDidChange:(BOOL)a4;
- (void)volumeController:(id)a3 volumeValueDidChange:(float)a4;
@end

@implementation TVNPEndpointRoutingDestination

- (TVNPEndpointRoutingDestination)initWithEndpointRoute:(id)a3
{
  v34 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v34;
  v34 = 0LL;
  v32.receiver = v3;
  v32.super_class = (Class)&OBJC_CLASS___TVNPEndpointRoutingDestination;
  v21 = -[TVNPRoutingDestination initWithEndpointRoute:](&v32, "initWithEndpointRoute:", location[0]);
  v34 = v21;
  objc_storeStrong((id *)&v34, v21);
  if (v21)
  {
    v4 = objc_alloc(&OBJC_CLASS___TVNPEndpointRouteConnection);
    v5 = -[TVNPEndpointRouteConnection initWithRoute:](v4, "initWithRoute:", location[0]);
    v6 = *(MPAVEndpointRoute **)((char *)&v34->_endpointRoute + 4);
    *(MPAVEndpointRoute **)((char *)&v34->_endpointRoute + 4) = (MPAVEndpointRoute *)v5;

    objc_initWeak(&v31, v34);
    v20 = *(MPAVEndpointRoute **)((char *)&v34->_endpointRoute + 4);
    v25 = _NSConcreteStackBlock;
    int v26 = -1073741824;
    int v27 = 0;
    v28 = sub_10000D084;
    v29 = &unk_100049008;
    objc_copyWeak(&v30, &v31);
    v7 = (MPVolumeController *)[v20 registerMetadataUpdateHandler:&v25];
    v8 = *(MPVolumeController **)((char *)&v34->_volumeController + 4);
    *(MPVolumeController **)((char *)&v34->_volumeController + 4) = v7;

    v19 = (NSCopying *)[*(id *)((char *)&v34->_endpointRoute + 4) connectionState];
    *(NSCopying **)((char *)&v34->_routeConnectionObserverToken + 4) = v19;
    [*(id *)((char *)&v34->_endpointRoute + 4) addObserver:v34 forKeyPath:@"connectionState" options:0 context:off_1000560C0];
    objc_storeStrong((id *)(&v34->super._disconnected + 1), location[0]);
    unsigned __int8 v18 = [location[0] isDeviceRoute];
    v34->super._local = v18 & 1;
    v9 = (NSString *)[location[0] routeUID];
    uniqueIdentifier = v34->super._uniqueIdentifier;
    v34->super._uniqueIdentifier = v9;

    id v17 = objc_msgSend(location[0], "tvnp_deviceType");
    v34->super._effectiveDeviceType = (unint64_t)v17;
    id v16 = objc_alloc(&OBJC_CLASS___MPVolumeControllerRouteDataSource);
    id v24 = [v16 initWithGroupRoute:*(void *)(&v34->super._disconnected + 1) outputDeviceRoute:0];
    v15 = -[MPVolumeController initWithDataSource:]( objc_alloc(&OBJC_CLASS___MPVolumeController),  "initWithDataSource:",  v24);
    v11 = *(TVNPEndpointRouteConnection **)((char *)&v34->_routeConnection + 4);
    *(TVNPEndpointRouteConnection **)((char *)&v34->_routeConnection + 4) = (TVNPEndpointRouteConnection *)v15;

    [*(id *)((char *)&v34->_routeConnection + 4) setDelegate:v34];
    char v22 = 0;
    if (-[TVNPEndpointRoutingDestination isConnected](v34, "isConnected")
      && ([*(id *)((char *)&v34->_routeConnection + 4) isVolumeControlAvailable] & 1) != 0
      && ([*(id *)(&v34->super._disconnected + 1) isDeviceSpeakerRoute] & 1) == 0)
    {
      [*(id *)((char *)&v34->_routeConnection + 4) volumeValue];
      v23 = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v12);
      char v22 = 1;
      objc_storeStrong((id *)&v34->super._volumeLevel, v23);
    }

    else
    {
      objc_storeStrong((id *)&v34->super._volumeLevel, 0LL);
    }

    if ((v22 & 1) != 0) {

    }
    -[TVNPEndpointRoutingDestination refreshPropertiesWithRoute:](v34, "refreshPropertiesWithRoute:", location[0]);
    objc_storeStrong(&v24, 0LL);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&v31);
  }

  v14 = v34;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v34, 0LL);
  return v14;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  [*(id *)((char *)&self->_endpointRoute + 4) removeObserver:self forKeyPath:@"connectionState" context:off_1000560C0];
  [*(id *)((char *)&v4->_endpointRoute + 4) deregisterMetadataUpdateHandler:*(MPVolumeController **)((char *)&v4->_volumeController + 4)];
  objc_storeStrong((id *)((char *)&v4->_volumeController + 4), 0LL);
  objc_storeStrong((id *)((char *)&v4->_endpointRoute + 4), 0LL);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVNPEndpointRoutingDestination;
  -[TVNPEndpointRoutingDestination dealloc](&v2, "dealloc");
}

- (NSString)description
{
  v7 = self;
  SEL v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVNPEndpointRoutingDestination;
  SEL v3 = -[TVNPEndpointRoutingDestination description](&v5, "description");
  v4 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: Endpoint:%@",  v3,  *(void *)(&v7->super._disconnected + 1));

  return v4;
}

- (void)setIsCurrentDestination:(BOOL)a3
{
  self->super._isCurrentDestination = a3;
}

- (BOOL)isPaired
{
  return objc_msgSend(*(id *)((char *)&self->_endpointRoute + 4), "isPaired", a2, self) & 1;
}

- (BOOL)isConnected
{
  return (id)-[TVNPEndpointRoutingDestination connectionState](self, "connectionState", a2, self) == (id)2;
}

- (BOOL)isConnecting
{
  return (id)-[TVNPEndpointRoutingDestination connectionState](self, "connectionState", a2, self) == (id)1;
}

- (BOOL)isDisconnected
{
  return (id)-[TVNPEndpointRoutingDestination connectionState](self, "connectionState", a2, self) == (id)3;
}

- (id)deviceImage
{
  if (!self->super._deviceImage)
  {
    id v5 =  +[MPAVRoutingController _symbolNameForRoute:]( &OBJC_CLASS___MPAVRoutingController,  "_symbolNameForRoute:",  *(void *)(&self->super._disconnected + 1));
    objc_super v2 = (UIImage *)+[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:");
    deviceImage = self->super._deviceImage;
    self->super._deviceImage = v2;
  }

  return self->super._deviceImage;
}

+ (id)keyPathsForValuesAffectingConnected
{
  return +[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", @"connectionState", a2, a1);
}

+ (id)keyPathsForValuesAffectingDisconnected
{
  return +[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", @"connectionState", a2, a1);
}

+ (id)keyPathsForValuesAffectingPaired
{
  return +[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", @"connectionState", a2, a1);
}

- (void)setVolumeLevel:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (([*(id *)((char *)&v7->_routeConnection + 4) isVolumeControlAvailable] & 1) != 0
    && ([*(id *)(&v7->super._disconnected + 1) isDeviceSpeakerRoute] & 1) == 0)
  {
    SEL v3 = (NSNumber *)[location[0] copy];
    volumeLevel = v7->super._volumeLevel;
    v7->super._volumeLevel = v3;

    id v5 = *(TVNPEndpointRouteConnection **)((char *)&v7->_routeConnection + 4);
    [location[0] floatValue];
    objc_msgSend(v5, "setVolumeValue:");
  }

  objc_storeStrong(location, 0LL);
}

- (void)setMuted:(BOOL)a3
{
  BOOL v3 = a3;
  if (([*(id *)((char *)&self->_routeConnection + 4) isVolumeControlAvailable] & 1) != 0
    && ([*(id *)(&self->super._disconnected + 1) isDeviceSpeakerRoute] & 1) == 0)
  {
    self->super._muted = v3;
    [*(id *)((char *)&self->_routeConnection + 4) setMuted:v3];
  }

- (void)refreshPropertiesWithRoute:(id)a3
{
  p_isa = (id *)&self->super.super.isa;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v11 = [location[0] routeName];
  if (!v11 && ([location[0] isDeviceRoute] & 1) != 0)
  {
    v9 = +[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice");
    BOOL v3 = -[UIDevice name](v9, "name");
    id v4 = v11;
    id v11 = v3;
  }

  [*(id *)((char *)p_isa + 132) setRoute:location[0]];
  if (v11 != p_isa[6] && ([v11 isEqual:p_isa[6]] & 1) == 0)
  {
    objc_msgSend(p_isa, "willChangeValueForKey:");
    id v5 = [v11 copy];
    id v6 = p_isa[6];
    p_isa[6] = v5;

    [p_isa didChangeValueForKey:@"destinationName"];
  }

  unsigned __int8 v7 = [location[0] isDeviceRoute];
  if ((v7 & 1) != (*((_BYTE *)p_isa + 57) & 1))
  {
    objc_msgSend(p_isa, "willChangeValueForKey:");
    unsigned __int8 v8 = [location[0] isDeviceRoute];
    *((_BYTE *)p_isa + 57) = v8 & 1;
    [p_isa didChangeValueForKey:@"local"];
  }

  id v10 = [location[0] routeNames];
  if (v10 != p_isa[14] && ([v10 isEqual:p_isa[14]] & 1) == 0)
  {
    objc_msgSend(p_isa, "willChangeValueForKey:");
    objc_storeStrong(p_isa + 14, v10);
    [p_isa didChangeValueForKey:@"routeNames"];
  }

  [p_isa _updateVolume];
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)togglePlayPause
{
}

- (void)connectAndPair
{
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
  v9 = sub_10000DB48;
  id v10 = &unk_100048E50;
  id v11 = v14;
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
  v9 = sub_10000DC5C;
  id v10 = &unk_100048E50;
  id v11 = v14;
  dispatch_async(queue, &v6);

  objc_storeStrong((id *)&v11, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v12 = 0LL;
  objc_storeStrong(&v12, a4);
  id v11 = 0LL;
  objc_storeStrong(&v11, a5);
  id v10 = a6;
  if (a6 == off_1000560C0)
  {
    -[TVNPEndpointRoutingDestination setConnectionState:]( v14,  "setConnectionState:",  [*(id *)((char *)&v14->_endpointRoute + 4) connectionState]);
    -[TVNPEndpointRoutingDestination _updateVolume](v14, "_updateVolume");
  }

  else
  {
    v9.receiver = v14;
    v9.super_class = (Class)&OBJC_CLASS___TVNPEndpointRoutingDestination;
    -[TVNPEndpointRoutingDestination observeValueForKeyPath:ofObject:change:context:]( &v9,  "observeValueForKeyPath:ofObject:change:context:",  location[0],  v12,  v11,  v10);
  }

  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_updateVolume
{
  p_isa = (id *)&self->super.super.isa;
  location[1] = (id)a2;
  char v5 = 0;
  if (-[TVNPEndpointRoutingDestination isConnected](self, "isConnected")
    && ([*(id *)((char *)p_isa + 140) isVolumeControlAvailable] & 1) != 0
    && ([*(id *)((char *)p_isa + 124) isDeviceSpeakerRoute] & 1) == 0)
  {
    [*(id *)((char *)p_isa + 140) volumeValue];
    id v6 = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:");
    char v5 = 1;
    objc_super v2 = v6;
  }

  else
  {
    objc_super v2 = (NSNumber *)0LL;
  }

  location[0] = v2;
  if ((v5 & 1) != 0) {

  }
  if (location[0] != p_isa[11] && ([location[0] isEqual:p_isa[11]] & 1) == 0)
  {
    [p_isa willChangeValueForKey:@"volumeLevel"];
    char v3 = 0;
    if (([p_isa isConnected] & 1) != 0
      && ([*(id *)((char *)p_isa + 140) isVolumeControlAvailable] & 1) != 0
      && ([*(id *)((char *)p_isa + 124) isDeviceSpeakerRoute] & 1) == 0)
    {
      [*(id *)((char *)p_isa + 140) volumeValue];
      id v4 = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:");
      char v3 = 1;
      objc_storeStrong(p_isa + 11, v4);
    }

    else
    {
      objc_storeStrong(p_isa + 11, 0LL);
    }

    if ((v3 & 1) != 0) {

    }
    [p_isa didChangeValueForKey:@"volumeLevel"];
  }

  objc_storeStrong(location, 0LL);
}

- (void)_metadataDidChange:(id)a3 forKeys:(id)a4
{
  id v24 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v22 = 0LL;
  objc_storeStrong(&v22, a4);
  id v21 = [location[0] title];
  id v20 = [location[0] album];
  id v19 = [location[0] artist];
  id v18 = 0LL;
  if ([v20 length] && objc_msgSend(v19, "length"))
  {
    id v4 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ — %@", v19, v20);
    id v5 = v18;
    id v18 = v4;
  }

  else if ([v19 length])
  {
    objc_storeStrong(&v18, v19);
  }

  else if ([v20 length])
  {
    objc_storeStrong(&v18, v20);
  }

  id v17 = 0LL;
  if ([v21 length] && objc_msgSend(v19, "length"))
  {
    id v6 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ — %@", v21, v19);
    id v7 = v17;
    id v17 = v6;
  }

  else if ([v21 length])
  {
    objc_storeStrong(&v17, v21);
  }

  else if ([v19 length])
  {
    objc_storeStrong(&v17, v19);
  }

  id v11 = v24;
  id v12 = [location[0] title];
  -[TVNPRoutingDestination setTitle:](v11, "setTitle:");

  -[TVNPRoutingDestination setSingleLineTitle:](v24, "setSingleLineTitle:", v17);
  -[TVNPRoutingDestination setSubtitle:](v24, "setSubtitle:", v18);
  unsigned __int8 v13 = 1;
  if (v22) {
    unsigned __int8 v13 = [v22 containsObject:@"artworkImage"];
  }
  if ((v13 & 1) != 0)
  {
    objc_super v9 = v24;
    id v10 = [location[0] artworkImage];
    -[TVNPRoutingDestination setArtworkImage:](v9, "setArtworkImage:");
  }

  if (!v22 || ([v22 containsObject:@"playbackState"] & 1) != 0)
  {
    int v8 = (void *)objc_opt_class(v24);
    id v16 = objc_msgSend(v8, "_playbackStateForMPCPlaybackState:", objc_msgSend(location[0], "playbackState"));
    -[TVNPRoutingDestination setPlaybackState:](v24, "setPlaybackState:", v16);
  }

  id v15 = [*(id *)((char *)&v24->_endpointRoute + 4) bundleID];
  -[TVNPRoutingDestination setNowPlayingBundleIdentifier:](v24, "setNowPlayingBundleIdentifier:", v15);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(&v21, 0LL);
  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(location, 0LL);
}

+ (unint64_t)_playbackStateForMPCPlaybackState:(int64_t)a3
{
  if (a3 == 2) {
    return 1LL;
  }
  return 2LL;
}

- (MPAVEndpointRoute)endpointRoute
{
  return *(MPAVEndpointRoute **)(&self->super._disconnected + 1);
}

- (TVNPEndpointRouteConnection)routeConnection
{
  return *(TVNPEndpointRouteConnection **)((char *)&self->_endpointRoute + 4);
}

- (MPVolumeController)volumeController
{
  return *(MPVolumeController **)((char *)&self->_routeConnection + 4);
}

- (NSCopying)routeConnectionObserverToken
{
  return *(MPVolumeController **)((char *)&self->_volumeController + 4);
}

- (unint64_t)connectionState
{
  return *(unint64_t *)((char *)&self->_routeConnectionObserverToken + 4);
}

- (void)setConnectionState:(unint64_t)a3
{
  *(NSCopying **)((char *)&self->_routeConnectionObserverToken + 4) = (NSCopying *)a3;
}

- (void).cxx_destruct
{
}

@end