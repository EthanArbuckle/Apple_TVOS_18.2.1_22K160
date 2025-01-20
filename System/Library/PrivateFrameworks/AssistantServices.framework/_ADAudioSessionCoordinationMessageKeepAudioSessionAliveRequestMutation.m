@interface _ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequestMutation
- (BOOL)isDirty;
- (_ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequestMutation)initWithBase:(id)a3;
- (double)getExpirationDuration;
- (void)setExpirationDuration:(double)a3;
@end

@implementation _ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequestMutation

- (_ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequestMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequestMutation;
  v6 = -[_ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequestMutation init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (double)getExpirationDuration
{
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0) {
    return self->_expirationDuration;
  }
  -[ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest expirationDuration](self->_base, "expirationDuration");
  return result;
}

- (void)setExpirationDuration:(double)a3
{
  self->_expirationDuration = a3;
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (void).cxx_destruct
{
}

@end