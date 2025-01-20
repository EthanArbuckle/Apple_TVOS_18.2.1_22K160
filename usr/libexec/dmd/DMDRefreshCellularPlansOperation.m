@interface DMDRefreshCellularPlansOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
@end

@implementation DMDRefreshCellularPlansOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFRefreshCellularPlansRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5A00;
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS___DMDRefreshCellularPlansOperation;
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 eSIMServerURL]);
  if (!v7
    || (v8 = (void *)v7,
        v9 = (void *)objc_claimAutoreleasedReturnValue([v6 eSIMServerURL]),
        v10 = (void *)objc_claimAutoreleasedReturnValue([v9 scheme]),
        unsigned __int8 v11 = [&off_1000A5A18 containsObject:v10],
        v10,
        v9,
        v8,
        (v11 & 1) == 0))
  {
    if (!a4) {
      goto LABEL_8;
    }
    uint64_t v16 = DMFInvalidParameterErrorKey;
    v17 = @"request.eSIMServerURL";
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
    uint64_t v13 = DMFErrorWithCodeAndUserInfo(1LL, v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue(v13);

LABEL_7:
    LOBYTE(a4) = 0;
    goto LABEL_8;
  }

  LOBYTE(a4) = 1;
LABEL_8:

  return (char)a4;
}

@end