@interface AXTVRouteSelection
- (BOOL)isForSpeech;
- (TTSAudioSessionChannel)channel;
- (void)setChannel:(id)a3;
- (void)setIsForSpeech:(BOOL)a3;
@end

@implementation AXTVRouteSelection

- (TTSAudioSessionChannel)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
}

- (BOOL)isForSpeech
{
  return self->_isForSpeech;
}

- (void)setIsForSpeech:(BOOL)a3
{
  self->_isForSpeech = a3;
}

- (void).cxx_destruct
{
}

@end