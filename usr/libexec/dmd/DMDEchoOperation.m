@interface DMDEchoOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDEchoOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", objc_opt_class(&OBJC_CLASS___DMFEchoRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5670;
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v18.receiver = a1;
  v18.super_class = (Class)&OBJC_METACLASS___DMDEchoOperation;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 echo]);

  if (!v7)
  {
    if (!a4) {
      goto LABEL_12;
    }
    uint64_t v22 = DMFInvalidParameterErrorKey;
    v23 = @"request.echo";
    v13 = &v23;
    v14 = &v22;
    goto LABEL_10;
  }

  uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 resultStatus]);
  if (v8)
  {
    v9 = (void *)v8;
    v21[0] = DMFRMEchoStatusOK;
    v21[1] = DMFRMEchoStatusPending;
    v21[2] = DMFRMEchoStatusFail;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 3LL));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 resultStatus]);
    unsigned __int8 v12 = [v10 containsObject:v11];

    if ((v12 & 1) == 0)
    {
      if (!a4) {
        goto LABEL_12;
      }
      uint64_t v19 = DMFInvalidParameterErrorKey;
      v20 = @"request.resultStatus";
      v13 = &v20;
      v14 = &v19;
LABEL_10:
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v14,  1LL));
      uint64_t v16 = DMFErrorWithCodeAndUserInfo(1LL, v15);
      *a4 = (id)objc_claimAutoreleasedReturnValue(v16);

LABEL_11:
      LOBYTE(a4) = 0;
      goto LABEL_12;
    }
  }

  LOBYTE(a4) = 1;
LABEL_12:

  return (char)a4;
}

- (void)runWithRequest:(id)a3
{
  id v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v10 resultStatus]);
  if ([v4 isEqualToString:DMFRMEchoStatusOK])
  {
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v10 resultStatus]);
    unsigned int v6 = [v5 isEqualToString:DMFRMEchoStatusPending];

    if (!v6)
    {
      -[DMDTaskOperation endOperationWithDMFErrorCode:](self, "endOperationWithDMFErrorCode:", 4LL);
      goto LABEL_6;
    }
  }

  v7 = (void *)objc_opt_new(&OBJC_CLASS___DMFEchoResultObject);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v10 echo]);
  [v7 setEcho:v8];

  v9 = (void *)objc_claimAutoreleasedReturnValue([v10 resultStatus]);
  [v7 setResultStatus:v9];

  -[DMDEchoOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v7);
LABEL_6:
}

@end