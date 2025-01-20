@interface _ADAudioSessionCoordinationMessageMutation
- (BOOL)isDirty;
- (_ADAudioSessionCoordinationMessageMutation)initWithBase:(id)a3;
- (id)getPayloadBeginAudioSessionRequest;
- (id)getPayloadBeginAudioSessionResponse;
- (id)getPayloadEndAudioSessionRequest;
- (id)getPayloadEndAudioSessionResponse;
- (id)getPayloadKeepAudioSessionAliveRequest;
- (id)getPayloadKeepAudioSessionAliveResponse;
- (int64_t)getType;
- (unint64_t)getHostTime;
- (void)setHostTime:(unint64_t)a3;
- (void)setPayloadBeginAudioSessionRequest:(id)a3;
- (void)setPayloadBeginAudioSessionResponse:(id)a3;
- (void)setPayloadEndAudioSessionRequest:(id)a3;
- (void)setPayloadEndAudioSessionResponse:(id)a3;
- (void)setPayloadKeepAudioSessionAliveRequest:(id)a3;
- (void)setPayloadKeepAudioSessionAliveResponse:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation _ADAudioSessionCoordinationMessageMutation

- (_ADAudioSessionCoordinationMessageMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____ADAudioSessionCoordinationMessageMutation;
  v6 = -[_ADAudioSessionCoordinationMessageMutation init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

- (BOOL)isDirty
{
  return *(_WORD *)&self->_mutationFlags & 1;
}

- (unint64_t)getHostTime
{
  if ((*(_WORD *)&self->_mutationFlags & 2) != 0) {
    return self->_hostTime;
  }
  else {
    return -[ADAudioSessionCoordinationMessage hostTime](self->_base, "hostTime");
  }
}

- (void)setHostTime:(unint64_t)a3
{
  self->_hostTime = a3;
  *(_WORD *)&self->_mutationFlags |= 3u;
}

- (int64_t)getType
{
  if ((*(_WORD *)&self->_mutationFlags & 4) != 0) {
    return self->_type;
  }
  else {
    return -[ADAudioSessionCoordinationMessage type](self->_base, "type");
  }
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
  *(_WORD *)&self->_mutationFlags |= 5u;
}

- (id)getPayloadBeginAudioSessionRequest
{
  if ((*(_WORD *)&self->_mutationFlags & 8) != 0) {
    v2 = self->_payloadBeginAudioSessionRequest;
  }
  else {
    v2 = (ADAudioSessionCoordinationMessageBeginAudioSessionRequest *)objc_claimAutoreleasedReturnValue( -[ADAudioSessionCoordinationMessage payloadBeginAudioSessionRequest]( self->_base,  "payloadBeginAudioSessionRequest"));
  }
  return v2;
}

- (void)setPayloadBeginAudioSessionRequest:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 9u;
}

- (id)getPayloadBeginAudioSessionResponse
{
  if ((*(_WORD *)&self->_mutationFlags & 0x10) != 0) {
    v2 = self->_payloadBeginAudioSessionResponse;
  }
  else {
    v2 = (ADAudioSessionCoordinationMessageBeginAudioSessionResponse *)objc_claimAutoreleasedReturnValue( -[ADAudioSessionCoordinationMessage payloadBeginAudioSessionResponse]( self->_base,  "payloadBeginAudioSessionResponse"));
  }
  return v2;
}

- (void)setPayloadBeginAudioSessionResponse:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x11u;
}

- (id)getPayloadKeepAudioSessionAliveRequest
{
  if ((*(_WORD *)&self->_mutationFlags & 0x20) != 0) {
    v2 = self->_payloadKeepAudioSessionAliveRequest;
  }
  else {
    v2 = (ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest *)objc_claimAutoreleasedReturnValue( -[ADAudioSessionCoordinationMessage payloadKeepAudioSessionAliveRequest]( self->_base,  "payloadKeepAudioSessionAliveRequest"));
  }
  return v2;
}

- (void)setPayloadKeepAudioSessionAliveRequest:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x21u;
}

- (id)getPayloadKeepAudioSessionAliveResponse
{
  if ((*(_WORD *)&self->_mutationFlags & 0x40) != 0) {
    v2 = self->_payloadKeepAudioSessionAliveResponse;
  }
  else {
    v2 = (ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponse *)objc_claimAutoreleasedReturnValue( -[ADAudioSessionCoordinationMessage payloadKeepAudioSessionAliveResponse]( self->_base,  "payloadKeepAudioSessionAliveResponse"));
  }
  return v2;
}

- (void)setPayloadKeepAudioSessionAliveResponse:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x41u;
}

- (id)getPayloadEndAudioSessionRequest
{
  if ((*(_WORD *)&self->_mutationFlags & 0x80) != 0) {
    v2 = self->_payloadEndAudioSessionRequest;
  }
  else {
    v2 = (ADAudioSessionCoordinationMessageEndAudioSessionRequest *)objc_claimAutoreleasedReturnValue( -[ADAudioSessionCoordinationMessage payloadEndAudioSessionRequest]( self->_base,  "payloadEndAudioSessionRequest"));
  }
  return v2;
}

- (void)setPayloadEndAudioSessionRequest:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x81u;
}

- (id)getPayloadEndAudioSessionResponse
{
  if ((*(_WORD *)&self->_mutationFlags & 0x100) != 0) {
    v2 = self->_payloadEndAudioSessionResponse;
  }
  else {
    v2 = (ADAudioSessionCoordinationMessageEndAudioSessionResponse *)objc_claimAutoreleasedReturnValue( -[ADAudioSessionCoordinationMessage payloadEndAudioSessionResponse]( self->_base,  "payloadEndAudioSessionResponse"));
  }
  return v2;
}

- (void)setPayloadEndAudioSessionResponse:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x101u;
}

- (void).cxx_destruct
{
}

@end