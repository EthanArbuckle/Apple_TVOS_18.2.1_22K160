@interface LACExtractablePasswordPersistenceNullAdapter
- (BOOL)stashPassword:(id)a3 error:(id *)a4;
- (id)_serviceNotSupportedInCurrentPlatform;
- (id)extractPassword:(id *)a3;
- (void)extractPasswordWithCompletion:(id)a3;
- (void)stashPassword:(id)a3 completion:(id)a4;
@end

@implementation LACExtractablePasswordPersistenceNullAdapter

- (id)extractPassword:(id *)a3
{
  if (a3)
  {
    -[LACExtractablePasswordPersistenceNullAdapter _serviceNotSupportedInCurrentPlatform]( self,  "_serviceNotSupportedInCurrentPlatform");
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

- (void)extractPasswordWithCompletion:(id)a3
{
  id v5 = a3;
  -[LACExtractablePasswordPersistenceNullAdapter _serviceNotSupportedInCurrentPlatform]( self,  "_serviceNotSupportedInCurrentPlatform");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a3 + 2))(v5, 0LL, v6);
}

- (void)stashPassword:(id)a3 completion:(id)a4
{
  id v6 = a4;
  -[LACExtractablePasswordPersistenceNullAdapter _serviceNotSupportedInCurrentPlatform]( self,  "_serviceNotSupportedInCurrentPlatform");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (BOOL)stashPassword:(id)a3 error:(id *)a4
{
  if (a4)
  {
    -[LACExtractablePasswordPersistenceNullAdapter _serviceNotSupportedInCurrentPlatform]( self,  "_serviceNotSupportedInCurrentPlatform",  a3);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0;
}

- (id)_serviceNotSupportedInCurrentPlatform
{
  return +[LACError errorWithCode:debugDescription:]( &OBJC_CLASS___LACError,  "errorWithCode:debugDescription:",  -1020LL,  @"Service not available in this platform");
}

@end