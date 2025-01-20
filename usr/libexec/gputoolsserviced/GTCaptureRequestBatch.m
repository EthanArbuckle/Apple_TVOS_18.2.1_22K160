@interface GTCaptureRequestBatch
- (GTCaptureRequestBatch)init;
- (GTCaptureRequestBatch)initWithCoder:(id)a3;
- (GTCaptureRequestBatch)initWithRequestID:(unint64_t)a3;
- (NSArray)requests;
- (id)completionHandler;
- (unint64_t)requestID;
- (void)encodeWithCoder:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setRequestID:(unint64_t)a3;
- (void)setRequests:(id)a3;
@end

@implementation GTCaptureRequestBatch

- (GTCaptureRequestBatch)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___GTCaptureRequestBatch;
  v2 = -[GTCaptureRequestBatch init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    do
      unsigned int v4 = __ldaxr((unsigned int *)&unk_10003D4E8);
    while (__stlxr(v4 + 1, (unsigned int *)&unk_10003D4E8));
    v2->_requestID = v4;
    v5 = v2;
  }

  return v3;
}

- (GTCaptureRequestBatch)initWithRequestID:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___GTCaptureRequestBatch;
  result = -[GTCaptureRequestBatch init](&v5, "init");
  if (result) {
    result->_requestID = a3;
  }
  return result;
}

- (GTCaptureRequestBatch)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___GTCaptureRequestBatch;
  objc_super v5 = -[GTCaptureRequestBatch init](&v8, "init");
  if (v5)
  {
    v5->_requestID = (unint64_t)[v4 decodeInt64ForKey:@"requestID"];
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (unint64_t)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(unint64_t)a3
{
  self->_requestID = a3;
}

- (NSArray)requests
{
  return self->_requests;
}

- (void)setRequests:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end