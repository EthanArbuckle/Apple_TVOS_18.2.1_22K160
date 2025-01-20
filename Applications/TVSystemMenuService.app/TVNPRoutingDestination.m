@interface TVNPRoutingDestination
- (BOOL)isConnected;
- (BOOL)isConnecting;
- (BOOL)isCurrentDestination;
- (BOOL)isDisconnected;
- (BOOL)isLocal;
- (BOOL)isMuted;
- (BOOL)isPaired;
- (NSArray)routeNames;
- (NSNumber)volumeLevel;
- (NSString)destinationName;
- (NSString)nowPlayingBundleIdentifier;
- (NSString)singleLineTitle;
- (NSString)subtitle;
- (NSString)title;
- (NSString)uniqueIdentifier;
- (TVNPRoutingDestination)init;
- (TVNPRoutingDestination)initWithEndpointRoute:(id)a3;
- (UIImage)artworkImage;
- (UIImage)deviceImage;
- (unint64_t)effectiveDeviceType;
- (unint64_t)playbackState;
- (void)refreshPropertiesWithRoute:(id)a3;
- (void)setArtworkImage:(id)a3;
- (void)setDestinationName:(id)a3;
- (void)setDeviceImage:(id)a3;
- (void)setIsCurrentDestination:(BOOL)a3;
- (void)setMuted:(BOOL)a3;
- (void)setNowPlayingBundleIdentifier:(id)a3;
- (void)setPlaybackState:(unint64_t)a3;
- (void)setRouteNames:(id)a3;
- (void)setSingleLineTitle:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
- (void)setVolumeLevel:(id)a3;
@end

@implementation TVNPRoutingDestination

- (TVNPRoutingDestination)init
{
  id location = self;
  objc_storeStrong(&location, 0LL);
  return 0LL;
}

- (TVNPRoutingDestination)initWithEndpointRoute:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0LL;
  v6.receiver = v3;
  v6.super_class = (Class)&OBJC_CLASS___TVNPRoutingDestination;
  v8 = -[TVNPRoutingDestination init](&v6, "init");
  objc_storeStrong((id *)&v8, v8);
  v5 = v8;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v8, 0LL);
  return v5;
}

  ;
}

  ;
}

- (void)refreshPropertiesWithRoute:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0LL);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)singleLineTitle
{
  return self->_singleLineTitle;
}

- (void)setSingleLineTitle:(id)a3
{
}

- (UIImage)artworkImage
{
  return self->_artworkImage;
}

- (void)setArtworkImage:(id)a3
{
}

- (UIImage)deviceImage
{
  return self->_deviceImage;
}

- (void)setDeviceImage:(id)a3
{
}

- (NSString)destinationName
{
  return self->_destinationName;
}

- (void)setDestinationName:(id)a3
{
}

- (BOOL)isCurrentDestination
{
  return self->_isCurrentDestination;
}

- (void)setIsCurrentDestination:(BOOL)a3
{
  self->_isCurrentDestination = a3;
}

- (BOOL)isLocal
{
  return self->_local;
}

- (unint64_t)playbackState
{
  return self->_playbackState;
}

- (void)setPlaybackState:(unint64_t)a3
{
  self->_playbackState = a3;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (NSNumber)volumeLevel
{
  return self->_volumeLevel;
}

- (void)setVolumeLevel:(id)a3
{
}

- (BOOL)isMuted
{
  return self->_muted;
}

- (void)setMuted:(BOOL)a3
{
  self->_muted = a3;
}

- (NSString)nowPlayingBundleIdentifier
{
  return self->_nowPlayingBundleIdentifier;
}

- (void)setNowPlayingBundleIdentifier:(id)a3
{
}

- (NSArray)routeNames
{
  return self->_routeNames;
}

- (void)setRouteNames:(id)a3
{
}

- (unint64_t)effectiveDeviceType
{
  return self->_effectiveDeviceType;
}

- (BOOL)isPaired
{
  return self->_paired;
}

- (BOOL)isConnected
{
  return self->_connected;
}

- (BOOL)isConnecting
{
  return self->_connecting;
}

- (BOOL)isDisconnected
{
  return self->_disconnected;
}

- (void).cxx_destruct
{
}

@end