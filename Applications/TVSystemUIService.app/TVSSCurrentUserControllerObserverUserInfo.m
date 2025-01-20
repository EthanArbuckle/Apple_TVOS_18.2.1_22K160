@interface TVSSCurrentUserControllerObserverUserInfo
- (BOOL)respondsToDidUpdate;
- (void)setRespondsToDidUpdate:(BOOL)a3;
@end

@implementation TVSSCurrentUserControllerObserverUserInfo

- (void)setRespondsToDidUpdate:(BOOL)a3
{
  *(_BYTE *)&self->_observerFlags = *(_BYTE *)&self->_observerFlags & 0xFE | a3;
}

- (BOOL)respondsToDidUpdate
{
  return (*(_BYTE *)&self->_observerFlags & 1) != 0;
}

@end