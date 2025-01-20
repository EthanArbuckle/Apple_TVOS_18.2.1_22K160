@interface _PBAXMenuAlertController
- (BOOL)shouldSpeakItems;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setShouldSpeakItems:(BOOL)a3;
@end

@implementation _PBAXMenuAlertController

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_shouldSpeakItems)
  {
    if (!self->_speechSynthesizer)
    {
      v8 = objc_alloc_init(&OBJC_CLASS___AVSpeechSynthesizer);
      speechSynthesizer = self->_speechSynthesizer;
      self->_speechSynthesizer = v8;
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 nextFocusedView]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 accessibilityLabel]);
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[AVSpeechUtterance speechUtteranceWithString:]( &OBJC_CLASS___AVSpeechUtterance,  "speechUtteranceWithString:",  v11));

    LODWORD(v13) = 1061997773;
    [v12 setVolume:v13];
    -[AVSpeechSynthesizer stopSpeakingAtBoundary:](self->_speechSynthesizer, "stopSpeakingAtBoundary:", 0LL);
    -[AVSpeechSynthesizer speakUtterance:](self->_speechSynthesizer, "speakUtterance:", v12);
  }
}

- (BOOL)shouldSpeakItems
{
  return self->_shouldSpeakItems;
}

- (void)setShouldSpeakItems:(BOOL)a3
{
  self->_shouldSpeakItems = a3;
}

- (void).cxx_destruct
{
}

@end