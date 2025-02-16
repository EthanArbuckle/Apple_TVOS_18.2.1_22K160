@interface RDEARCSpeechRecognitionResultStreamGlue
- (RDEARCSpeechRecognitionResultStreamGlue)initWithStream:(RDEARCSpeechRecognitionResultStream *)a3;
- (void)dealloc;
- (void)speechRecognizer:(id)a3 didFinishRecognitionWithError:(id)a4;
- (void)speechRecognizer:(id)a3 didProcessAudioDuration:(double)a4;
- (void)speechRecognizer:(id)a3 didRecognizeFinalResultPackage:(id)a4;
- (void)speechRecognizer:(id)a3 didRecognizeFinalResults:(id)a4 tokenSausage:(id)a5 nBestChoices:(id)a6;
- (void)speechRecognizer:(id)a3 didRecognizePartialResult:(id)a4;
@end

@implementation RDEARCSpeechRecognitionResultStreamGlue

- (RDEARCSpeechRecognitionResultStreamGlue)initWithStream:(RDEARCSpeechRecognitionResultStream *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___RDEARCSpeechRecognitionResultStreamGlue;
  result = -[RDEARCSpeechRecognitionResultStreamGlue init](&v8, "init");
  if (result)
  {
    __int128 v5 = *(_OWORD *)&a3->ctx;
    __int128 v6 = *(_OWORD *)&a3->DidRecognizePartialResultTokens;
    __int128 v7 = *(_OWORD *)&a3->DidRecognizeFinalResults;
    result->_stream.DidProcessAudioDuration = a3->DidProcessAudioDuration;
    *(_OWORD *)&result->_stream.DidRecognizeFinalResults = v7;
    *(_OWORD *)&result->_stream.DidRecognizePartialResultTokens = v6;
    *(_OWORD *)&result->_stream.ctx = v5;
  }

  return result;
}

- (void)dealloc
{
  DisposeContext = (void (*)(void *, SEL))self->_stream.DisposeContext;
  if (DisposeContext) {
    DisposeContext(self->_stream.ctx, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___RDEARCSpeechRecognitionResultStreamGlue;
  -[RDEARCSpeechRecognitionResultStreamGlue dealloc](&v4, "dealloc");
}

- (void)speechRecognizer:(id)a3 didRecognizePartialResult:(id)a4
{
  if (self->_stream.DidRecognizePartialResultTokens) {
    ((void (*)(void *, id))self->_stream.DidRecognizePartialResultTokens)( self->_stream.ctx,  objc_msgSend(a4, "tokens", a3));
  }
}

- (void)speechRecognizer:(id)a3 didFinishRecognitionWithError:(id)a4
{
  DidFinishRecognitionWithError = (void (*)(void *, id))self->_stream.DidFinishRecognitionWithError;
  if (DidFinishRecognitionWithError) {
    DidFinishRecognitionWithError(self->_stream.ctx, a4);
  }
}

- (void)speechRecognizer:(id)a3 didRecognizeFinalResults:(id)a4 tokenSausage:(id)a5 nBestChoices:(id)a6
{
  DidRecognizeFinalResults = (void (*)(void *, id, id, id))self->_stream.DidRecognizeFinalResults;
  if (DidRecognizeFinalResults) {
    DidRecognizeFinalResults(self->_stream.ctx, a5, a6, a4);
  }
}

- (void)speechRecognizer:(id)a3 didRecognizeFinalResultPackage:(id)a4
{
  DidRecognizeFinalResultsWithPreITN = (void (*)(void *, id, id, id, id, id, void))self->_stream.DidRecognizeFinalResultsWithPreITN;
  if (DidRecognizeFinalResultsWithPreITN)
  {
    ctx = self->_stream.ctx;
    id v6 = a4;
    id v14 = (id)objc_claimAutoreleasedReturnValue([v6 recognition]);
    id v7 = [v14 tokenSausage];
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v6 recognition]);
    id v9 = [v8 interpretationIndices];
    id v10 = [v6 nBestResults];
    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 preITNRecognition]);
    id v12 = [v11 tokenSausage];
    v13 = (void *)objc_claimAutoreleasedReturnValue([v6 preITNRecognition]);

    DidRecognizeFinalResultsWithPreITN(ctx, v7, v9, v10, v12, [v13 interpretationIndices], 0);
  }

- (void)speechRecognizer:(id)a3 didProcessAudioDuration:(double)a4
{
  DidProcessAudioDuration = (void (*)(void *, double))self->_stream.DidProcessAudioDuration;
  if (DidProcessAudioDuration) {
    DidProcessAudioDuration(self->_stream.ctx, a4);
  }
}

@end