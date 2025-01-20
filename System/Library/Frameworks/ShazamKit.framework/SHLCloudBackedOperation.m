@interface SHLCloudBackedOperation
- (CKDatabaseOperation)operation;
- (CKDatabaseOperation)privateOperation;
- (SHLCloudBackedOperation)initWithOperation:(id)a3;
- (void)setPrivateOperation:(id)a3;
@end

@implementation SHLCloudBackedOperation

- (SHLCloudBackedOperation)initWithOperation:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SHLCloudBackedOperation;
  v6 = -[SHLCloudBackedOperation init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_privateOperation, a3);
  }

  return v7;
}

- (CKDatabaseOperation)operation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudBackedOperation privateOperation](self, "privateOperation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 configuration]);
  id v5 = [v4 copy];
  v6 = v5;
  if (v5) {
    v7 = (CKOperationConfiguration *)v5;
  }
  else {
    v7 = objc_opt_new(&OBJC_CLASS___CKOperationConfiguration);
  }
  v8 = v7;

  -[CKOperationConfiguration setAutomaticallyRetryNetworkFailures:](v8, "setAutomaticallyRetryNetworkFailures:", 0LL);
  -[CKOperationConfiguration setDiscretionaryNetworkBehavior:](v8, "setDiscretionaryNetworkBehavior:", 0LL);
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudBackedOperation privateOperation](self, "privateOperation"));
  [v9 setConfiguration:v8];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudBackedOperation privateOperation](self, "privateOperation"));
  return (CKDatabaseOperation *)v10;
}

- (CKDatabaseOperation)privateOperation
{
  return self->_privateOperation;
}

- (void)setPrivateOperation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end