@interface PCSRegistryOperation
- (NSError)error;
- (NSString)operationUUID;
- (PCSRegistryOperation)init;
- (id)debugDescription;
- (id)description;
- (id)operationStateString;
- (id)pendingDependenciesString:(id)a3;
- (id)selfname;
- (void)setError:(id)a3;
- (void)setOperationUUID:(id)a3;
@end

@implementation PCSRegistryOperation

- (PCSRegistryOperation)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PCSRegistryOperation;
  v2 = -[PCSRegistryOperation init](&v7, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 UUIDString]);
    v5 = *(void **)&v2->super.super._private1;
    *(void *)&v2->super.super._private1 = v4;
  }

  return v2;
}

- (id)selfname
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PCSRegistryOperation name](self, "name"));

  uint64_t v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v3)
  {
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[PCSRegistryOperation name](self, "name"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PCSRegistryOperation operationUUID](self, "operationUUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@(%@,%@)",  v6,  v7,  v8));
  }

  else
  {
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[PCSRegistryOperation operationUUID](self, "operationUUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@(%@)", v6, v7));
  }

  return v9;
}

- (id)operationStateString
{
  if ((-[PCSRegistryOperation isFinished](self, "isFinished") & 1) != 0)
  {
    v3 = @"finished ";
  }

  else if ((-[PCSRegistryOperation isCancelled](self, "isCancelled") & 1) != 0)
  {
    v3 = @"cancelled";
  }

  else if ((-[PCSRegistryOperation isExecuting](self, "isExecuting") & 1) != 0)
  {
    v3 = @"executing";
  }

  else if (-[PCSRegistryOperation isReady](self, "isReady"))
  {
    v3 = @"ready";
  }

  else
  {
    v3 = @"pending";
  }

  return v3;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PCSRegistryOperation operationStateString](self, "operationStateString"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[PCSRegistryOperation error](self, "error"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PCSRegistryOperation selfname](self, "selfname"));
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PCSRegistryOperation error](self, "error"));
    objc_super v7 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %@ error:%@>",  v5,  v3,  v6);
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( -[PCSRegistryOperation pendingDependenciesString:]( self,  "pendingDependenciesString:",  @" dep:"));
    objc_super v7 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"<%@: %@%@>", v5, v3, v6);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

- (id)debugDescription
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PCSRegistryOperation operationStateString](self, "operationStateString"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[PCSRegistryOperation error](self, "error"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PCSRegistryOperation selfname](self, "selfname"));
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PCSRegistryOperation error](self, "error"));
    objc_super v7 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ (%p): %@ error:%@>",  v5,  self,  v3,  v6);
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( -[PCSRegistryOperation pendingDependenciesString:]( self,  "pendingDependenciesString:",  @" dep:"));
    objc_super v7 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ (%p): %@%@>",  v5,  self,  v3,  v6);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

- (id)pendingDependenciesString:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PCSRegistryOperation dependencies](self, "dependencies"));
  id v6 = [v5 copy];

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v6 indexesOfObjectsPassingTest:&stru_100024AC0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectsAtIndexes:v7]);

  if ([v8 count])
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "componentsJoinedByString:", @", "));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  v4,  v9));
  }

  else
  {
    v10 = &stru_100025318;
  }

  return v10;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setError:(id)a3
{
}

- (NSString)operationUUID
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setOperationUUID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end