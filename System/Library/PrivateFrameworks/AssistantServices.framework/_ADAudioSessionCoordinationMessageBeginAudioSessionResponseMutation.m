@interface _ADAudioSessionCoordinationMessageBeginAudioSessionResponseMutation
- (BOOL)isDirty;
- (_ADAudioSessionCoordinationMessageBeginAudioSessionResponseMutation)initWithBase:(id)a3;
@end

@implementation _ADAudioSessionCoordinationMessageBeginAudioSessionResponseMutation

- (_ADAudioSessionCoordinationMessageBeginAudioSessionResponseMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____ADAudioSessionCoordinationMessageBeginAudioSessionResponseMutation;
  v6 = -[_ADAudioSessionCoordinationMessageBeginAudioSessionResponseMutation init](&v9, "init");
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

- (void).cxx_destruct
{
}

@end