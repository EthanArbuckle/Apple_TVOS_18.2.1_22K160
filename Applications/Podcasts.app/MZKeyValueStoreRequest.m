@interface MZKeyValueStoreRequest
- (BOOL)shouldAuthenticate;
- (MZKeyValueStoreOperationDelegate)delegate;
- (MZKeyValueStoreRequest)initWithTransaction:(id)a3;
- (MZKeyValueStoreSerializer)serializer;
- (MZKeyValueStoreTransaction)transaction;
- (NSString)DSID;
- (NSString)domain;
- (void)postData:(id)a3;
- (void)scheduleStoreURLRequest:(id)a3;
- (void)setDSID:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDomain:(id)a3;
- (void)setSerializer:(id)a3;
- (void)setShouldAuthenticate:(BOOL)a3;
- (void)setTransaction:(id)a3;
- (void)start;
@end

@implementation MZKeyValueStoreRequest

- (MZKeyValueStoreRequest)initWithTransaction:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MZKeyValueStoreRequest;
  v6 = -[MZKeyValueStoreRequest init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_transaction, a3);
  }

  return v7;
}

- (void)start
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreRequest serializer](self, "serializer"));
  id v4 = (id)objc_claimAutoreleasedReturnValue([v3 payload]);

  -[MZKeyValueStoreRequest postData:](self, "postData:", v4);
}

- (void)postData:(id)a3
{
  id v10 = a3;
  if ([v10 length])
  {
    id v4 = objc_alloc(&OBJC_CLASS___NSMutableURLRequest);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreRequest transaction](self, "transaction"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 URL]);
    v7 = -[NSMutableURLRequest initWithURL:](v4, "initWithURL:", v6);

    -[NSMutableURLRequest setHTTPBody:](v7, "setHTTPBody:", v10);
    -[NSMutableURLRequest setHTTPMethod:](v7, "setHTTPMethod:", @"POST");
    -[NSMutableURLRequest setValue:forHTTPHeaderField:]( v7,  "setValue:forHTTPHeaderField:",  kMZKeyValueStorePlistContentType,  @"Content-Type");
    if (-[MZKeyValueStoreRequest shouldAuthenticate](self, "shouldAuthenticate"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTAccountController sharedInstance](&OBJC_CLASS___MTAccountController, "sharedInstance"));
      [v8 promptAccountAuthenticationWithDebugReason:@"Podcasts Bookkeeper Sync" forced:0];

      objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreRequest delegate](self, "delegate"));
      [v9 keyValueStoreOperationOperationDidFinish:self];
    }

    else
    {
      -[MZKeyValueStoreRequest scheduleStoreURLRequest:](self, "scheduleStoreURLRequest:", v7);
    }
  }

  else
  {
    v7 = (NSMutableURLRequest *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreRequest delegate](self, "delegate"));
    -[NSMutableURLRequest keyValueStoreOperationOperationDidFinish:]( v7,  "keyValueStoreOperationOperationDidFinish:",  self);
  }
}

- (void)scheduleStoreURLRequest:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreRequest delegate](self, "delegate"));
  [v5 keyValueStoreOperation:self scheduleURLRequest:v4];
}

- (MZKeyValueStoreSerializer)serializer
{
  if (!self->_serializer)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreRequest transaction](self, "transaction"));
    uint64_t v4 = objc_opt_class(&OBJC_CLASS___MTApnsTransaction);
    char isKindOfClass = objc_opt_isKindOfClass(v3, v4);

    if ((isKindOfClass & 1) != 0) {
      v6 = &OBJC_CLASS___MTApnsSerializer;
    }
    else {
      v6 = &OBJC_CLASS___MZKeyValueStoreSerializer;
    }
    id v7 = objc_alloc(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreRequest transaction](self, "transaction"));
    objc_super v9 = (MZKeyValueStoreSerializer *)[v7 initWithTransaction:v8];
    serializer = self->_serializer;
    self->_serializer = v9;
  }

  return self->_serializer;
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (MZKeyValueStoreTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (NSString)DSID
{
  return self->_DSID;
}

- (void)setDSID:(id)a3
{
}

- (MZKeyValueStoreOperationDelegate)delegate
{
  return (MZKeyValueStoreOperationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)shouldAuthenticate
{
  return self->_shouldAuthenticate;
}

- (void)setShouldAuthenticate:(BOOL)a3
{
  self->_shouldAuthenticate = a3;
}

- (void)setSerializer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end