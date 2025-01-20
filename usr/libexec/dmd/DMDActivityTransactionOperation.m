@interface DMDActivityTransactionOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (BOOL)runConcurrently;
- (BOOL)runOnMainThread;
- (OS_os_transaction)transaction;
- (void)cancel;
- (void)endOperationIfNeeded;
- (void)runWithRequest:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation DMDActivityTransactionOperation

- (BOOL)runConcurrently
{
  return 1;
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___DMDActivityTransactionOperation;
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
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFActivityTransactionRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A54D8;
}

- (BOOL)runOnMainThread
{
  return 1;
}

- (void)cancel
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DMDActivityTransactionOperation;
  -[DMDActivityTransactionOperation cancel](&v3, "cancel");
  -[DMDActivityTransactionOperation performSelectorOnMainThread:withObject:waitUntilDone:]( self,  "performSelectorOnMainThread:withObject:waitUntilDone:",  "endOperationIfNeeded",  0LL,  0LL);
}

- (void)endOperationIfNeeded
{
}

- (void)runWithRequest:(id)a3
{
  id v5 = objc_claimAutoreleasedReturnValue([a3 name]);
  v4 = (void *)os_transaction_create([v5 UTF8String]);
  -[DMDActivityTransactionOperation setTransaction:](self, "setTransaction:", v4);
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end