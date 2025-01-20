@interface DMDFetchDMDStateOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDFetchDMDStateOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFFetchDMDStateRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5790;
}

- (void)runWithRequest:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[DMDServer sharedServer](&OBJC_CLASS___DMDServer, "sharedServer", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
  id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Server:\n%@\nApps:\n%@",  v4,  v5));

  id v6 = [[DMFFetchDMDStateResultObject alloc] initWithStateDescription:v7];
  -[DMDFetchDMDStateOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v6);
}

@end