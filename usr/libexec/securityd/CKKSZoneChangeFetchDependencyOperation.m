@interface CKKSZoneChangeFetchDependencyOperation
- (CKKSZoneChangeFetchDependencyOperation)init;
- (CKKSZoneChangeFetcher)owner;
- (id)descriptionError;
- (void)setOwner:(id)a3;
@end

@implementation CKKSZoneChangeFetchDependencyOperation

- (CKKSZoneChangeFetchDependencyOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CKKSZoneChangeFetchDependencyOperation;
  return -[CKKSResultOperation init](&v3, "init");
}

- (id)descriptionError
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetchDependencyOperation owner](self, "owner"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 lastCKFetchError]);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:underlying:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:underlying:",  @"CKKSResultOperationDescriptionError",  2LL,  @"Fetch failed",  v3));

  return v4;
}

- (CKKSZoneChangeFetcher)owner
{
  return (CKKSZoneChangeFetcher *)objc_loadWeakRetained((id *)&self->super._descriptionUnderlyingError);
}

- (void)setOwner:(id)a3
{
}

- (void).cxx_destruct
{
}

@end