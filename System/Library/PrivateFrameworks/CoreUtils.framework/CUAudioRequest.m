@interface CUAudioRequest
- (AVAudioPlayer)audioPlayer;
- (NSString)label;
- (id)completion;
- (void)setAudioPlayer:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setLabel:(id)a3;
@end

@implementation CUAudioRequest

- (AVAudioPlayer)audioPlayer
{
  return self->_audioPlayer;
}

- (void)setAudioPlayer:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end