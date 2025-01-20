@interface ADSiriAppLaunchRequestHandler
- (ADSiriAppLaunchRequestHandlerDelegate)delegate;
- (void)handleSiriRequest:(id)a3 deliveryHandler:(id)a4 completionHandler:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation ADSiriAppLaunchRequestHandler

- (void)handleSiriRequest:(id)a3 deliveryHandler:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  v10 = (void (**)(void))a4;
  id v11 = a5;
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___ADAcePassthroughSiriRequest);
  if ((objc_opt_isKindOfClass(v9, v12) & 1) == 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v19 handleFailureInMethod:a2, self, @"ADSiriAppLaunchRequestHandler.m", 89, @"Invalid parameter not satisfying: %@", @"[request isKindOfClass:[ADAcePassthroughSiriRequest class]]" object file lineNumber description];

    if (!v10) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  if (v10) {
LABEL_3:
  }
    v10[2](v10);
LABEL_4:
  id v13 = v9;
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 clientBoundCommand]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v13 _refId]);
  id v16 = [v15 copy];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1001279D8;
  v20[3] = &unk_1004F22D0;
  v20[4] = self;
  id v21 = v16;
  id v22 = v11;
  id v17 = v11;
  id v18 = v16;
  objc_msgSend(v14, "_ad_handleAppLaunchCommandWithRequest:completion:", v13, v20);
}

- (ADSiriAppLaunchRequestHandlerDelegate)delegate
{
  return (ADSiriAppLaunchRequestHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end