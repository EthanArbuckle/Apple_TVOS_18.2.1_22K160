@interface _ADAudioSessionCoordinationMessageEndAudioSessionRequestMutation
- (BOOL)isDirty;
- (_ADAudioSessionCoordinationMessageEndAudioSessionRequestMutation)initWithBase:(id)a3;
- (id)getEffectiveDate;
- (void)setEffectiveDate:(id)a3;
@end

@implementation _ADAudioSessionCoordinationMessageEndAudioSessionRequestMutation

- (_ADAudioSessionCoordinationMessageEndAudioSessionRequestMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____ADAudioSessionCoordinationMessageEndAudioSessionRequestMutation;
  v6 = -[_ADAudioSessionCoordinationMessageEndAudioSessionRequestMutation init](&v9, "init");
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
    v2 = (NSDate *)objc_claimAutoreleasedReturnValue( -[ADAudioSessionCoordinationMessageEndAudioSessionRequest effectiveDate]( self->_base,  "effectiveDate"));
  }
  return v2;
}

- (void)setEffectiveDate:(id)a3
{
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (void).cxx_destruct
{
}

@end