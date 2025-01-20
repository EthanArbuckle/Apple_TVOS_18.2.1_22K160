@interface TVSSUserObserverUserInfo
- (BOOL)respondsToDidChangeCurrentUser;
- (BOOL)respondsToDidChangeImage;
- (BOOL)respondsToDidChangePersonNameComponents;
- (void)setRespondsToDidChangeCurrentUser:(BOOL)a3;
- (void)setRespondsToDidChangeImage:(BOOL)a3;
- (void)setRespondsToDidChangePersonNameComponents:(BOOL)a3;
@end

@implementation TVSSUserObserverUserInfo

- (void)setRespondsToDidChangeImage:(BOOL)a3
{
  *(_BYTE *)&self->_observerFlags = *(_BYTE *)&self->_observerFlags & 0xFE | a3;
}

- (BOOL)respondsToDidChangeImage
{
  return (*(_BYTE *)&self->_observerFlags & 1) != 0;
}

- (void)setRespondsToDidChangePersonNameComponents:(BOOL)a3
{
  *(_BYTE *)&self->_observerFlags = *(_BYTE *)&self->_observerFlags & 0xFD | (2 * a3);
}

- (BOOL)respondsToDidChangePersonNameComponents
{
  return (*(_BYTE *)&self->_observerFlags & 2) != 0;
}

- (void)setRespondsToDidChangeCurrentUser:(BOOL)a3
{
  *(_BYTE *)&self->_observerFlags = *(_BYTE *)&self->_observerFlags & 0xFB | (4 * a3);
}

- (BOOL)respondsToDidChangeCurrentUser
{
  return (*(_BYTE *)&self->_observerFlags & 4) != 0;
}

@end