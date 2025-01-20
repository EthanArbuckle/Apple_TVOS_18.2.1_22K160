@interface FetchRequestTask
- (ApprovalRequest)request;
- (FetchRequestTask)initWithIdentifier:(id)a3;
- (NSString)identifier;
- (id)perform;
- (void)setIdentifier:(id)a3;
- (void)setRequest:(id)a3;
@end

@implementation FetchRequestTask

- (FetchRequestTask)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___FetchRequestTask;
  v5 = -[FetchRequestTask init](&v9, "init");
  if (v5)
  {
    if ([v4 containsString:@"_"])
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue([v4 componentsSeparatedByString:@"_"]);
      if ((unint64_t)[v6 count] >= 2)
      {
        uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 lastObject]);

        id v4 = (id)v7;
      }
    }

    objc_storeStrong((id *)&v5->_identifier, v4);
  }

  return v5;
}

- (id)perform
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10000BE48;
  v3[3] = &unk_100030560;
  v3[4] = self;
  return (id)objc_claimAutoreleasedReturnValue( -[FetchRequestTask performBinaryTaskWithBlock:]( self,  "performBinaryTaskWithBlock:",  v3));
}

- (ApprovalRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end