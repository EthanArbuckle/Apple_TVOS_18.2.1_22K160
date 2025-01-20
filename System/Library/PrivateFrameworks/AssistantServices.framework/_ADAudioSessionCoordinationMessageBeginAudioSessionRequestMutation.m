@interface _ADAudioSessionCoordinationMessageBeginAudioSessionRequestMutation
- (BOOL)isDirty;
- (_ADAudioSessionCoordinationMessageBeginAudioSessionRequestMutation)initWithBase:(id)a3;
- (double)getExpirationDuration;
- (id)getEffectiveDate;
- (void)setEffectiveDate:(id)a3;
- (void)setExpirationDuration:(double)a3;
@end

@implementation _ADAudioSessionCoordinationMessageBeginAudioSessionRequestMutation

- (_ADAudioSessionCoordinationMessageBeginAudioSessionRequestMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____ADAudioSessionCoordinationMessageBeginAudioSessionRequestMutation;
  v6 = -[_ADAudioSessionCoordinationMessageBeginAudioSessionRequestMutation init](&v9, "init");
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

- (id)getEffectiveDate
{
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0) {
    v2 = self->_effectiveDate;
  }
  else {
    v2 = (NSDate *)objc_claimAutoreleasedReturnValue( -[ADAudioSessionCoordinationMessageBeginAudioSessionRequest effectiveDate]( self->_base,  "effectiveDate"));
  }
  return v2;
}

- (void)setEffectiveDate:(id)a3
{
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (double)getExpirationDuration
{
  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0) {
    return self->_expirationDuration;
  }
  -[ADAudioSessionCoordinationMessageBeginAudioSessionRequest expirationDuration](self->_base, "expirationDuration");
  return result;
}

- (void)setExpirationDuration:(double)a3
{
  self->_expirationDuration = a3;
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (void).cxx_destruct
{
}

@end