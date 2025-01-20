@interface ZipDataStreamAdapter
- (NSString)description;
- (void)consumeData:(id)a3 andWaitWithCompletionHandler:(id)a4;
- (void)consumeData:(id)a3 withCompletionHandler:(id)a4;
- (void)finishWithCompletionHandler:(id)a3;
- (void)prepareWithCompletionHandler:(id)a3;
- (void)resetWithCompletionHandler:(id)a3;
- (void)suspendWithCompletionHandler:(id)a3;
- (void)truncateWithCompletionHandler:(id)a3;
@end

@implementation ZipDataStreamAdapter

- (void)consumeData:(id)a3 andWaitWithCompletionHandler:(id)a4
{
}

- (void)consumeData:(id)a3 withCompletionHandler:(id)a4
{
}

- (void)finishWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (self->_extractor)
  {
    dispatch_group_wait((dispatch_group_t)self->_consistencyGroup, 0xFFFFFFFFFFFFFFFFLL);
    extractor = self->_extractor;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1001A5D74;
    v8[3] = &unk_1003E9C30;
    id v9 = v4;
    -[SZExtractor finishStreamWithCompletionBlock:](extractor, "finishStreamWithCompletionBlock:", v8);
  }

  else
  {
    uint64_t v6 = ASDErrorWithTitleAndMessage(ASDErrorDomain, 707LL, 0LL, 0LL);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    (*((void (**)(id, void *))v4 + 2))(v4, v7);
  }
}

- (void)prepareWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = (void (**)(void, void, void))v4;
  extractor = self->_extractor;
  if (extractor)
  {
    path = self->_path;
    v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472LL;
    v15 = sub_1001A5F04;
    v16 = &unk_1003EA880;
    v17 = self;
    id v18 = v4;
    v8 = path;
    id v9 = &v13;
    v10 = extractor;
    objc_opt_self(&OBJC_CLASS___ZipDataStreamAdapter);
    if (v8) {
      -[SZExtractor prepareForExtractionToPath:completionBlock:]( v10,  "prepareForExtractionToPath:completionBlock:",  v8,  v9,  v13,  v14,  v15,  v16,  v17,  v18);
    }
    else {
      -[SZExtractor prepareForExtraction:](v10, "prepareForExtraction:", v9, v13, v14, v15, v16, v17, v18);
    }
  }

  else
  {
    uint64_t v11 = ASDErrorWithTitleAndMessage(ASDErrorDomain, 707LL, 0LL, 0LL);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    ((void (**)(void, void, void *))v5)[2](v5, 0LL, v12);
  }
}

- (void)suspendWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (self->_extractor)
  {
    dispatch_group_wait((dispatch_group_t)self->_consistencyGroup, 0xFFFFFFFFFFFFFFFFLL);
    extractor = self->_extractor;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1001A5FF4;
    v8[3] = &unk_1003EA880;
    void v8[4] = self;
    id v9 = v4;
    -[SZExtractor suspendStreamWithCompletionBlock:](extractor, "suspendStreamWithCompletionBlock:", v8);
  }

  else
  {
    uint64_t v6 = ASDErrorWithTitleAndMessage(ASDErrorDomain, 707LL, 0LL, 0LL);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    (*((void (**)(id, void *))v4 + 2))(v4, v7);
  }
}

- (void)resetWithCompletionHandler:(id)a3
{
}

- (void)truncateWithCompletionHandler:(id)a3
{
}

- (NSString)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p> { %@ }",  objc_opt_class(self, a2),  self,  self->_extractor);
}

- (void).cxx_destruct
{
}

@end