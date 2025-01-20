@interface TVNPRoute
- (BOOL)canBeGrouped;
- (BOOL)isAvailable;
- (BOOL)isLocal;
- (BOOL)isMuted;
- (BOOL)isSilentPrimary;
- (NSNumber)volumeLevel;
- (NSString)deviceTypeDescription;
- (NSString)groupUID;
- (NSString)routeUID;
- (NSString)title;
- (TVNPRoute)init;
- (TVNPRoutingDestination)destination;
- (UIImage)deviceImage;
- (id)_init;
- (unint64_t)deviceType;
- (unint64_t)selectionState;
- (void)setAvailable:(BOOL)a3;
- (void)setCanBeGrouped:(BOOL)a3;
- (void)setDestination:(id)a3;
- (void)setDeviceImage:(id)a3;
- (void)setDeviceType:(unint64_t)a3;
- (void)setGroupUID:(id)a3;
- (void)setLocal:(BOOL)a3;
- (void)setMuted:(BOOL)a3;
- (void)setRouteUID:(id)a3;
- (void)setSelectionState:(unint64_t)a3;
- (void)setSilentPrimary:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setVolumeLevel:(id)a3;
@end

@implementation TVNPRoute

- (TVNPRoute)init
{
  id location = self;
  objc_storeStrong(&location, 0LL);
  return 0LL;
}

- (id)_init
{
  SEL v5 = a2;
  v6 = 0LL;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVNPRoute;
  v6 = -[TVNPRoute init](&v4, "init");
  objc_storeStrong((id *)&v6, v6);
  v3 = v6;
  objc_storeStrong((id *)&v6, 0LL);
  return v3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)routeUID
{
  return self->_routeUID;
}

- (void)setRouteUID:(id)a3
{
}

- (NSString)groupUID
{
  return self->_groupUID;
}

- (void)setGroupUID:(id)a3
{
}

- (UIImage)deviceImage
{
  return self->_deviceImage;
}

- (void)setDeviceImage:(id)a3
{
}

- (unint64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(unint64_t)a3
{
  self->_deviceType = a3;
}

- (NSString)deviceTypeDescription
{
  return self->_deviceTypeDescription;
}

- (BOOL)isLocal
{
  return self->_local;
}

- (void)setLocal:(BOOL)a3
{
  self->_local = a3;
}

- (unint64_t)selectionState
{
  return self->_selectionState;
}

- (void)setSelectionState:(unint64_t)a3
{
  self->_selectionState = a3;
}

- (BOOL)canBeGrouped
{
  return self->_canBeGrouped;
}

- (void)setCanBeGrouped:(BOOL)a3
{
  self->_canBeGrouped = a3;
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

- (TVNPRoutingDestination)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
}

- (BOOL)isAvailable
{
  return self->_available;
}

- (void)setAvailable:(BOOL)a3
{
  self->_available = a3;
}

- (BOOL)isSilentPrimary
{
  return self->_silentPrimary;
}

- (void)setSilentPrimary:(BOOL)a3
{
  self->_silentPrimary = a3;
}

- (void).cxx_destruct
{
}

@end