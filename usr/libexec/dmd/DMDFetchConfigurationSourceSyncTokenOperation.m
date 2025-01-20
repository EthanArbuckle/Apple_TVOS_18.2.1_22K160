@interface DMDFetchConfigurationSourceSyncTokenOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (BOOL)runOnMainThread;
- (unint64_t)queueGroup;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDFetchConfigurationSourceSyncTokenOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFFetchConfigurationSourceSyncTokenRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5730;
}

- (BOOL)runOnMainThread
{
  return 1;
}

- (unint64_t)queueGroup
{
  return 1LL;
}

- (void)runWithRequest:(id)a3
{
  id v4 = (id)objc_opt_new(&OBJC_CLASS___DMFFetchConfigurationSourceSyncTokenResultObject);
  -[DMDFetchConfigurationSourceSyncTokenOperation endOperationWithResultObject:]( self,  "endOperationWithResultObject:",  v4);
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___DMDFetchConfigurationSourceSyncTokenOperation;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 configurationSource]);

  if (!v7)
  {
    if (!a4) {
      goto LABEL_7;
    }
    uint64_t v12 = DMFInvalidParameterErrorKey;
    v13 = @"request.configurationSource";
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
    uint64_t v9 = DMFErrorWithCodeAndUserInfo(1LL, v8);
    *a4 = (id)objc_claimAutoreleasedReturnValue(v9);

LABEL_6:
    LOBYTE(a4) = 0;
    goto LABEL_7;
  }

  LOBYTE(a4) = 1;
LABEL_7:

  return (char)a4;
}

@end