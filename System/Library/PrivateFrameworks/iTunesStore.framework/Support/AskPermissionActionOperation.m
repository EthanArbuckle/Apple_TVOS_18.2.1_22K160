@interface AskPermissionActionOperation
- (AskPermissionActionOperation)initWithURL:(id)a3 account:(id)a4;
- (NSURL)URL;
- (SSAccount)account;
- (void)run;
@end

@implementation AskPermissionActionOperation

- (AskPermissionActionOperation)initWithURL:(id)a3 account:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___AskPermissionActionOperation;
  v9 = -[AskPermissionActionOperation init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_URL, a3);
    objc_storeStrong((id *)&v10->_account, a4);
  }

  return v10;
}

- (void)run
{
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  v18 = sub_100131C90;
  v19 = sub_100131CA0;
  id v20 = 0LL;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AskPermissionActionOperation account](self, "account"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 backingAccount]);

  dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
  v6 = (void *)ISWeakLinkedClassForString(@"APRequestHandler", 13LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[AskPermissionActionOperation URL](self, "URL"));
  v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  v11 = sub_100131CA8;
  objc_super v12 = &unk_10034EB28;
  v14 = &v15;
  id v8 = v5;
  v13 = v8;
  [v6 addRequestWithURL:v7 account:v4 completion:&v9];

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  -[AskPermissionActionOperation setSuccess:](self, "setSuccess:", v16[5] == 0, v9, v10, v11, v12);
  -[AskPermissionActionOperation setError:](self, "setError:", v16[5]);

  _Block_object_dispose(&v15, 8);
}

- (SSAccount)account
{
  return self->_account;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void).cxx_destruct
{
}

@end