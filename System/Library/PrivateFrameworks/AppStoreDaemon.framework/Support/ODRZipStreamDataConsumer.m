@interface ODRZipStreamDataConsumer
- (void)consumeData:(id)a3 withCompletionHandler:(id)a4;
- (void)finishWithCompletionHandler:(id)a3;
- (void)prepareWithCompletionHandler:(id)a3;
- (void)resetWithCompletionHandler:(id)a3;
- (void)suspendWithCompletionHandler:(id)a3;
- (void)truncateWithCompletionHandler:(id)a3;
@end

@implementation ODRZipStreamDataConsumer

- (void)consumeData:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void (**)(void, void, void))v7;
  if (self->_dataComplete)
  {
    (*((void (**)(id, void, uint64_t))v7 + 2))(v7, 0LL, 1LL);
  }

  else
  {
    extractor = self->_extractor;
    if (extractor)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_1001E7720;
      v12[3] = &unk_1003EAC98;
      v12[4] = self;
      id v13 = v7;
      -[SZExtractor supplyBytes:withCompletionBlock:](extractor, "supplyBytes:withCompletionBlock:", v6, v12);
    }

    else
    {
      uint64_t v10 = ASDErrorWithTitleAndMessage(ASDErrorDomain, 707LL, 0LL, 0LL);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      ((void (**)(void, void *, void))v8)[2](v8, v11, 0LL);
    }
  }
}

- (void)finishWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = (void (**)(void, void))v4;
  extractor = self->_extractor;
  if (extractor)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1001E77FC;
    v9[3] = &unk_1003E9C30;
    id v10 = v4;
    -[SZExtractor finishStreamWithCompletionBlock:](extractor, "finishStreamWithCompletionBlock:", v9);
  }

  else
  {
    uint64_t v7 = ASDErrorWithTitleAndMessage(ASDErrorDomain, 707LL, 0LL, 0LL);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    ((void (**)(void, void *))v5)[2](v5, v8);
  }
}

- (void)prepareWithCompletionHandler:(id)a3
{
  id v4 = a3;
  extractor = self->_extractor;
  if (extractor)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SZExtractor extractionPath](self->_extractor, "extractionPath"));
    v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472LL;
    v14 = sub_1001E7984;
    v15 = &unk_1003EA880;
    v16 = self;
    id v17 = v4;
    uint64_t v7 = extractor;
    id v8 = v6;
    v9 = &v12;
    if (v8) {
      -[SZExtractor prepareForExtractionToPath:completionBlock:]( v7,  "prepareForExtractionToPath:completionBlock:",  v8,  v9,  v12,  v13,  v14,  v15,  v16,  v17);
    }
    else {
      -[SZExtractor prepareForExtraction:](v7, "prepareForExtraction:", v9, v12, v13, v14, v15, v16, v17);
    }
  }

  else
  {
    uint64_t v10 = ASDErrorWithTitleAndMessage(ASDErrorDomain, 707LL, 0LL, 0LL);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0LL, v11);
  }
}

- (void)suspendWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = (void (**)(void, void))v4;
  extractor = self->_extractor;
  if (extractor)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1001E7AD0;
    v9[3] = &unk_1003EA880;
    void v9[4] = self;
    id v10 = v4;
    -[SZExtractor suspendStreamWithCompletionBlock:](extractor, "suspendStreamWithCompletionBlock:", v9);
  }

  else
  {
    uint64_t v7 = ASDErrorWithTitleAndMessage(ASDErrorDomain, 707LL, 0LL, 0LL);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    ((void (**)(void, void *))v5)[2](v5, v8);
  }
}

- (void)resetWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  extractor = self->_extractor;
  if (extractor
    && (id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SZExtractor extractionPath](extractor, "extractionPath")),
        v6,
        v6))
  {
    uint64_t v7 = ASDLogHandleForCategory(19LL);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Extractor reset", v16, 2u);
    }

    v9 = objc_alloc(&OBJC_CLASS___SZExtractor);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SZExtractor extractionPath](self->_extractor, "extractionPath"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SZExtractor options](self->_extractor, "options"));
    v12 = -[SZExtractor initWithPath:options:](v9, "initWithPath:options:", v10, v11);
    uint64_t v13 = self->_extractor;
    self->_extractor = v12;

    v4[2](v4, 0LL);
  }

  else
  {
    uint64_t v14 = ASDErrorWithTitleAndMessage(ASDErrorDomain, 707LL, 0LL, 0LL);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    ((void (**)(id, void *))v4)[2](v4, v15);
  }
}

- (void)truncateWithCompletionHandler:(id)a3
{
  v3 = (void (**)(id, void))a3;
  uint64_t v4 = ASDLogHandleForCategory(19LL);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "TRUNCATE", v6, 2u);
  }

  v3[2](v3, 0LL);
}

- (void).cxx_destruct
{
}

@end