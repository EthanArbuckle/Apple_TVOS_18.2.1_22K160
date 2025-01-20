@interface TVSSSystemOutputDeviceRouteControllerObserverUserInfo
- (BOOL)respondsToDidChangeOutputDevices;
- (BOOL)respondsToDidUpdate;
- (void)setRespondsToDidChangeOutputDevices:(BOOL)a3;
- (void)setRespondsToDidUpdate:(BOOL)a3;
@end

@implementation TVSSSystemOutputDeviceRouteControllerObserverUserInfo

- (void)setRespondsToDidChangeOutputDevices:(BOOL)a3
{
  *(_BYTE *)&self->_observerFlags = *(_BYTE *)&self->_observerFlags & 0xFD | (2 * a3);
}

- (BOOL)respondsToDidChangeOutputDevices
{
  return (*(_BYTE *)&self->_observerFlags & 2) != 0;
}

- (void)setRespondsToDidUpdate:(BOOL)a3
{
  *(_BYTE *)&self->_observerFlags = *(_BYTE *)&self->_observerFlags & 0xFE | a3;
}

- (BOOL)respondsToDidUpdate
{
  return (*(_BYTE *)&self->_observerFlags & 1) != 0;
}

@end