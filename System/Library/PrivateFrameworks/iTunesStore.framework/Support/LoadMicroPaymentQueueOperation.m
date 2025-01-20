@interface LoadMicroPaymentQueueOperation
- (BOOL)_getQueueCount:(int64_t *)a3 error:(id *)a4;
- (BOOL)_loadPaymentsWithExpectedCount:(int64_t)a3 error:(id *)a4;
- (MicroPaymentQueueRequest)request;
- (MicroPaymentQueueResponse)response;
- (NSDate)lastQueueCheckDate;
- (NSString)queueCountURLBagKey;
- (NSString)queuePaymentsURLBagKey;
- (int64_t)expectedCount;
- (void)dealloc;
- (void)run;
- (void)setExpectedCount:(int64_t)a3;
- (void)setLastQueueCheckDate:(id)a3;
- (void)setQueueCountURLBagKey:(id)a3;
- (void)setQueuePaymentsURLBagKey:(id)a3;
- (void)setRequest:(id)a3;
- (void)setResponse:(id)a3;
@end

@implementation LoadMicroPaymentQueueOperation

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___LoadMicroPaymentQueueOperation;
  -[LoadMicroPaymentQueueOperation dealloc](&v3, "dealloc");
}

- (void)run
{
  uint64_t v6 = 0LL;
  uint64_t v7 = 0LL;
  if (-[LoadMicroPaymentQueueOperation _getQueueCount:error:](self, "_getQueueCount:error:", &v6, &v7))
  {
    objc_super v3 = (void *)v6;
    if (v6 < 1 || v3 == (void *)-[LoadMicroPaymentQueueOperation expectedCount](self, "expectedCount"))
    {
      v4 = objc_alloc_init(&OBJC_CLASS___MicroPaymentQueueResponse);
      -[MicroPaymentQueueResponse setServerPaymentCount:](v4, "setServerPaymentCount:", v6);
      -[LoadMicroPaymentQueueOperation setResponse:](self, "setResponse:", v4);

      BOOL v5 = 1LL;
    }

    else
    {
      BOOL v5 = -[LoadMicroPaymentQueueOperation _loadPaymentsWithExpectedCount:error:]( self,  "_loadPaymentsWithExpectedCount:error:",  v6,  &v7);
    }
  }

  else
  {
    BOOL v5 = 0LL;
  }

  -[LoadMicroPaymentQueueOperation setError:](self, "setError:", v7);
  -[LoadMicroPaymentQueueOperation setSuccess:](self, "setSuccess:", v5);
}

- (BOOL)_getQueueCount:(int64_t *)a3 error:(id *)a4
{
  v11 = 0LL;
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___LoadMicroPaymentQueueCountOperation);
  -[LoadMicroPaymentQueueCountOperation setLastQueueCheckDate:]( v7,  "setLastQueueCheckDate:",  -[LoadMicroPaymentQueueOperation lastQueueCheckDate](self, "lastQueueCheckDate"));
  -[LoadMicroPaymentQueueCountOperation setRequest:]( v7,  "setRequest:",  -[LoadMicroPaymentQueueOperation request](self, "request"));
  -[LoadMicroPaymentQueueCountOperation setURLBagKey:]( v7,  "setURLBagKey:",  -[LoadMicroPaymentQueueOperation queueCountURLBagKey](self, "queueCountURLBagKey"));
  unsigned int v8 = -[LoadMicroPaymentQueueOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v7,  &v11);
  int64_t v9 = 0LL;
  if (v8) {
    int64_t v9 = -[LoadMicroPaymentQueueCountOperation queueItemCount](v7, "queueItemCount");
  }

  if (a3) {
    *a3 = v9;
  }
  if (a4) {
    *a4 = v11;
  }
  return v8;
}

- (BOOL)_loadPaymentsWithExpectedCount:(int64_t)a3 error:(id *)a4
{
  v11 = 0LL;
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___LoadMicroPaymentQueuePaymentsOperation);
  -[LoadMicroPaymentQueuePaymentsOperation setRequest:]( v7,  "setRequest:",  -[LoadMicroPaymentQueueOperation request](self, "request"));
  -[LoadMicroPaymentQueuePaymentsOperation setURLBagKey:]( v7,  "setURLBagKey:",  -[LoadMicroPaymentQueueOperation queuePaymentsURLBagKey](self, "queuePaymentsURLBagKey"));
  unsigned int v8 = -[LoadMicroPaymentQueueOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v7,  &v11);
  if (v8)
  {
    int64_t v9 = -[LoadMicroPaymentQueuePaymentsOperation response](v7, "response");
    -[MicroPaymentQueueResponse setServerPaymentCount:](v9, "setServerPaymentCount:", a3);
    -[LoadMicroPaymentQueueOperation setResponse:](self, "setResponse:", v9);
  }

  if (a4) {
    *a4 = v11;
  }
  return v8;
}

- (int64_t)expectedCount
{
  return self->_expectedCount;
}

- (void)setExpectedCount:(int64_t)a3
{
  self->_expectedCount = a3;
}

- (NSDate)lastQueueCheckDate
{
  return (NSDate *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setLastQueueCheckDate:(id)a3
{
}

- (NSString)queueCountURLBagKey
{
  return (NSString *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setQueueCountURLBagKey:(id)a3
{
}

- (NSString)queuePaymentsURLBagKey
{
  return (NSString *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setQueuePaymentsURLBagKey:(id)a3
{
}

- (MicroPaymentQueueRequest)request
{
  return (MicroPaymentQueueRequest *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setRequest:(id)a3
{
}

- (MicroPaymentQueueResponse)response
{
  return (MicroPaymentQueueResponse *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setResponse:(id)a3
{
}

@end