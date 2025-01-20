@interface SUCoreConfigParam
- (MAAsset)locatedAsset;
- (NSError)error;
- (SUCoreConfigParam)initWithError:(id)a3 operation:(unint64_t)a4;
- (SUCoreConfigParam)initWithLocatedAsset:(id)a3;
- (id)description;
- (unint64_t)operation;
@end

@implementation SUCoreConfigParam

- (SUCoreConfigParam)initWithError:(id)a3 operation:(unint64_t)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SUCoreConfigParam;
  v8 = -[SUCoreConfigParam init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    locatedAsset = v8->_locatedAsset;
    v8->_locatedAsset = 0LL;

    objc_storeStrong((id *)&v9->_error, a3);
    v9->_operation = a4;
  }

  return v9;
}

- (SUCoreConfigParam)initWithLocatedAsset:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SUCoreConfigParam;
  v6 = -[SUCoreConfigParam init](&v10, sel_init);
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_locatedAsset, a3);
    error = v7->_error;
    v7->_error = 0LL;

    v7->_operation = 0LL;
  }

  return v7;
}

- (id)description
{
  v3 = (void *)MEMORY[0x189607940];
  v4 = -[SUCoreConfigParam locatedAsset](self, "locatedAsset");
  -[SUCoreConfigParam error](self, "error");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 domain];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreConfigParam error](self, "error");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"SUCoreConfigParam(locatedAsset:%@, error:%@ %ld, operation:%ld)", v4, v6, objc_msgSend(v7, "code"), -[SUCoreConfigParam operation](self, "operation")];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSError)error
{
  return self->_error;
}

- (MAAsset)locatedAsset
{
  return self->_locatedAsset;
}

- (unint64_t)operation
{
  return self->_operation;
}

- (void).cxx_destruct
{
}

@end