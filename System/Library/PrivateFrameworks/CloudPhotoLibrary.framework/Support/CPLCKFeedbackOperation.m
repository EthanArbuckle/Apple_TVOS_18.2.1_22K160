@interface CPLCKFeedbackOperation
- (CPLCKFeedbackOperation)initWithFeedbackMessages:(id)a3;
- (id)feedbackCompletionBlock;
- (void)setFeedbackCompletionBlock:(id)a3;
@end

@implementation CPLCKFeedbackOperation

- (CPLCKFeedbackOperation)initWithFeedbackMessages:(id)a3
{
  id v5 = a3;
  v6 = objc_alloc_init(&OBJC_CLASS___CPLServerFeedbackRequest);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v7);
        }
        -[CPLServerFeedbackRequest addMessages:]( v6,  "addMessages:",  *(void *)(*((void *)&v20 + 1) + 8LL * (void)i));
      }

      id v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v8);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLServerFeedbackRequest data](v6, "data"));
  if (!v11) {
    sub_1001912E4((uint64_t)v6, (uint64_t)a2, (uint64_t)self);
  }
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___CPLServerFeedbackResponse);
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___CPLCKFeedbackOperation;
  v13 = -[CPLCKFeedbackOperation initWithServiceName:functionName:responseClass:]( &v19,  "initWithServiceName:functionName:responseClass:",  @"Feedback",  @"submit",  v12);
  v14 = v13;
  if (v13)
  {
    -[CPLCKFeedbackOperation setRequest:](v13, "setRequest:", v6);
    objc_initWeak(&location, v14);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100041EF4;
    v16[3] = &unk_10023F9B8;
    objc_copyWeak(&v17, &location);
    -[CPLCKFeedbackOperation setCodeOperationCompletionBlock:](v14, "setCodeOperationCompletionBlock:", v16);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v14;
}

- (id)feedbackCompletionBlock
{
  return self->_feedbackCompletionBlock;
}

- (void)setFeedbackCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end