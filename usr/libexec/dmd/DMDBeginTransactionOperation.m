@interface DMDBeginTransactionOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)UUIDsToTransactions;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDBeginTransactionOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___DMDBeginTransactionOperation;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);

  if (!v7)
  {
    if (!a4) {
      goto LABEL_7;
    }
    uint64_t v12 = DMFInvalidParameterErrorKey;
    v13 = @"request.name";
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

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFBeginTransactionRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5508;
}

- (void)runWithRequest:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100061638();
  }
  v4 = objc_opt_new(&OBJC_CLASS___NSUUID);
  id v5 = [[DMFBeginTransactionResultObject alloc] initWithUUID:v4];
  -[DMDBeginTransactionOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v5);
}

+ (id)UUIDsToTransactions
{
  if (qword_1000CCC10 != -1) {
    dispatch_once(&qword_1000CCC10, &stru_10009E158);
  }
  return (id)qword_1000CCC08;
}

@end