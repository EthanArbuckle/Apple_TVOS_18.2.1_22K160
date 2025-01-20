@interface EvaluationRequestProcessor
- (BOOL)canProcessRequest:(id)a3;
- (EvaluationRequestProcessor)initWithContext:(id)a3 uiDelegate:(id)a4;
- (void)processRequest:(id)a3 configuration:(id)a4 completion:(id)a5;
@end

@implementation EvaluationRequestProcessor

- (EvaluationRequestProcessor)initWithContext:(id)a3 uiDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___EvaluationRequestProcessor;
  v8 = -[EvaluationRequestProcessor init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_context, v6);
    objc_storeWeak((id *)&v9->_uiDelegate, v7);
  }

  return v9;
}

- (BOOL)canProcessRequest:(id)a3
{
  return 1;
}

- (void)processRequest:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v7 = a3;
  v8 = (void (**)(id, void *))a5;
  id v9 = v7;
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 client]);
  objc_super v11 = (void *)v10;
  if (!v9)
  {
    v14 = @"Unexpected request type";
LABEL_6:
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[LAErrorHelper errorWithCode:message:]( &OBJC_CLASS___LAErrorHelper,  "errorWithCode:message:",  -1000LL,  v14));
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[LACEvaluationResult resultWithFailure:]( &OBJC_CLASS___LACEvaluationResult,  "resultWithFailure:",  v15));
    v8[2](v8, v16);

    goto LABEL_7;
  }

  if (!v10)
  {
    v14 = @"Missing originator";
    goto LABEL_6;
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  id v13 = objc_loadWeakRetained((id *)&self->_uiDelegate);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10000B000;
  v17[3] = &unk_100030D20;
  id v18 = v9;
  v19 = v8;
  [WeakRetained evaluateRequest:v18 uiDelegate:v13 originator:v11 reply:v17];

LABEL_7:
}

- (void).cxx_destruct
{
}

@end