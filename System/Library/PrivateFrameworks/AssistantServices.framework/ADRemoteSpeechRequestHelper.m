@interface ADRemoteSpeechRequestHelper
- (AFSpeechRequestOptions)speechRequestOptions;
- (NSUUID)currentToken;
- (id)completion;
- (id)setSpeechRequestOptions:(id)a3 withCompletion:(id)a4;
- (void)reset;
@end

@implementation ADRemoteSpeechRequestHelper

- (id)setSpeechRequestOptions:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(&OBJC_CLASS___NSUUID);
  v9 = (NSUUID *)-[NSUUID copy](v8, "copy");
  currentToken = self->_currentToken;
  self->_currentToken = v9;

  v11 = (AFSpeechRequestOptions *)[v7 copy];
  speechRequestOptions = self->_speechRequestOptions;
  self->_speechRequestOptions = v11;

  id v13 = objc_retainBlock(v6);
  id completion = self->_completion;
  self->_id completion = v13;

  return v8;
}

- (void)reset
{
  currentToken = self->_currentToken;
  self->_currentToken = 0LL;

  speechRequestOptions = self->_speechRequestOptions;
  self->_speechRequestOptions = 0LL;

  id completion = self->_completion;
  self->_id completion = 0LL;
}

- (NSUUID)currentToken
{
  return self->_currentToken;
}

- (AFSpeechRequestOptions)speechRequestOptions
{
  return self->_speechRequestOptions;
}

- (id)completion
{
  return self->_completion;
}

- (void).cxx_destruct
{
}

@end