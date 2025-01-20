@interface _PBVolumeState
- (BOOL)isMuted;
- (BOOL)tracksVolumeLevel;
- (void)setMuted:(BOOL)a3;
- (void)setTracksVolumeLevel:(BOOL)a3;
@end

@implementation _PBVolumeState

- (BOOL)tracksVolumeLevel
{
  return self->_tracksVolumeLevel;
}

- (void)setTracksVolumeLevel:(BOOL)a3
{
  self->_tracksVolumeLevel = a3;
}

- (BOOL)isMuted
{
  return self->_muted;
}

- (void)setMuted:(BOOL)a3
{
  self->_muted = a3;
}

@end