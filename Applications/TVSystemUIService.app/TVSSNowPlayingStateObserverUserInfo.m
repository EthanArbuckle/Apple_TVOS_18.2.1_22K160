@interface TVSSNowPlayingStateObserverUserInfo
- (BOOL)respondsToCurrentMediaItemDidChange;
- (BOOL)respondsToPlaybackRateDidChange;
- (BOOL)respondsToPlaybackStateDidChange;
- (BOOL)respondsToSyncTiming;
- (void)setRespondsToCurrentMediaItemDidChange:(BOOL)a3;
- (void)setRespondsToPlaybackRateDidChange:(BOOL)a3;
- (void)setRespondsToPlaybackStateDidChange:(BOOL)a3;
- (void)setRespondsToSyncTiming:(BOOL)a3;
@end

@implementation TVSSNowPlayingStateObserverUserInfo

- (void)setRespondsToPlaybackRateDidChange:(BOOL)a3
{
  *(_BYTE *)&self->_observerFlags = *(_BYTE *)&self->_observerFlags & 0xFB | (4 * a3);
}

- (BOOL)respondsToCurrentMediaItemDidChange
{
  return (*(_BYTE *)&self->_observerFlags & 1) != 0;
}

- (void)setRespondsToPlaybackStateDidChange:(BOOL)a3
{
  *(_BYTE *)&self->_observerFlags = *(_BYTE *)&self->_observerFlags & 0xFD | (2 * a3);
}

- (BOOL)respondsToPlaybackStateDidChange
{
  return (*(_BYTE *)&self->_observerFlags & 2) != 0;
}

- (void)setRespondsToCurrentMediaItemDidChange:(BOOL)a3
{
  *(_BYTE *)&self->_observerFlags = *(_BYTE *)&self->_observerFlags & 0xFE | a3;
}

- (BOOL)respondsToPlaybackRateDidChange
{
  return (*(_BYTE *)&self->_observerFlags & 4) != 0;
}

- (void)setRespondsToSyncTiming:(BOOL)a3
{
  *(_BYTE *)&self->_observerFlags = *(_BYTE *)&self->_observerFlags & 0xF7 | (8 * a3);
}

- (BOOL)respondsToSyncTiming
{
  return (*(_BYTE *)&self->_observerFlags & 8) != 0;
}

@end