@interface CUVoiceRequest
- (SiriTTSSpeechRequest)speechRequest;
- (id)completion;
- (id)owner;
- (unsigned)flags;
- (void)setCompletion:(id)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setOwner:(id)a3;
- (void)setSpeechRequest:(id)a3;
@end

@implementation CUVoiceRequest

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (id)owner
{
  return self->_owner;
}

- (void)setOwner:(id)a3
{
}

- (SiriTTSSpeechRequest)speechRequest
{
  return self->_speechRequest;
}

- (void)setSpeechRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end