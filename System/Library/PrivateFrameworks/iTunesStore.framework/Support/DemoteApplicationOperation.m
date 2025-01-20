@interface DemoteApplicationOperation
- (DemoteApplicationOperation)initWithBundleIdentifier:(id)a3;
- (void)run;
@end

@implementation DemoteApplicationOperation

- (DemoteApplicationOperation)initWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___DemoteApplicationOperation;
  v5 = -[DemoteApplicationOperation init](&v9, "init");
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    bundleID = v5->_bundleID;
    v5->_bundleID = v6;
  }

  return v5;
}

- (void)run
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  SSErrorDomain,  106LL,  &off_10036E488));
  -[DemoteApplicationOperation setError:](self, "setError:", v3);
  -[DemoteApplicationOperation setSuccess:](self, "setSuccess:", 0LL);
}

- (void).cxx_destruct
{
}

@end