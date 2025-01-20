@interface CSRemoraSecondPassAudioStreamHoldingContext
- (CSAudioProvider)audioProvider;
- (CSAudioStreamHolding)audioStreamHolding;
- (void)setAudioProvider:(id)a3;
- (void)setAudioStreamHolding:(id)a3;
@end

@implementation CSRemoraSecondPassAudioStreamHoldingContext

- (CSAudioStreamHolding)audioStreamHolding
{
  return self->_audioStreamHolding;
}

- (void)setAudioStreamHolding:(id)a3
{
}

- (CSAudioProvider)audioProvider
{
  return self->_audioProvider;
}

- (void)setAudioProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end