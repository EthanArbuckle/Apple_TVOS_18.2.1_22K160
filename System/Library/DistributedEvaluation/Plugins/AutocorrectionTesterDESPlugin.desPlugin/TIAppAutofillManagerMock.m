@interface TIAppAutofillManagerMock
- (TIAppAutofillManagerMock)init;
- (TIKeyboardSecureCandidateRenderer)secureCandidateRenderer;
- (void)generateAutofillFormCandidatesWithRenderTraits:(id)a3 withKeyboardState:(id)a4 completion:(id)a5;
- (void)generateAutofillFormSuggestedUsernameWithRenderTraits:(id)a3 withKeyboardState:(id)a4 completionHandler:(id)a5;
- (void)generateJustHMEAutofillFormSuggestionWithRenderTraits:(id)a3 withKeyboardState:(id)a4 applicationID:(id)a5 applicationBundleID:(id)a6 completionHandler:(id)a7;
- (void)shouldAcceptAutofill:(id)a3 withPayload:(id)a4 completion:(id)a5;
- (void)shouldAcceptOneTimeCode:(id)a3 completion:(id)a4;
@end

@implementation TIAppAutofillManagerMock

- (TIAppAutofillManagerMock)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TIAppAutofillManagerMock;
  v2 = -[TIAppAutofillManagerMock init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    secureCandidateRenderer = v2->_secureCandidateRenderer;
    v2->_secureCandidateRenderer = 0LL;
  }

  return v3;
}

- (void)generateAutofillFormCandidatesWithRenderTraits:(id)a3 withKeyboardState:(id)a4 completion:(id)a5
{
  id v5 = a5;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(33LL, 0LL);
  v7 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_65E0;
  v9[3] = &unk_88D00;
  id v10 = v5;
  id v8 = v5;
  TIDispatchAsync(v7, v9);
}

- (void)generateAutofillFormSuggestedUsernameWithRenderTraits:(id)a3 withKeyboardState:(id)a4 completionHandler:(id)a5
{
}

- (void)generateJustHMEAutofillFormSuggestionWithRenderTraits:(id)a3 withKeyboardState:(id)a4 applicationID:(id)a5 applicationBundleID:(id)a6 completionHandler:(id)a7
{
}

- (void)shouldAcceptAutofill:(id)a3 withPayload:(id)a4 completion:(id)a5
{
  if (a5) {
    (*((void (**)(id, void))a5 + 2))(a5, 0LL);
  }
}

- (void)shouldAcceptOneTimeCode:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id, void))a4 + 2))(a4, 0LL);
  }
}

- (TIKeyboardSecureCandidateRenderer)secureCandidateRenderer
{
  return self->_secureCandidateRenderer;
}

- (void).cxx_destruct
{
}

@end