@interface DMDSetDeviceNameOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDSetDeviceNameOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFSetDeviceNameRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5C40;
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___DMDSetDeviceNameOperation;
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 name]);
  if (!v7
    || (v8 = (void *)v7,
        v9 = (void *)objc_claimAutoreleasedReturnValue([v6 name]),
        id v10 = [v9 length],
        v9,
        v8,
        !v10))
  {
    if (!a4) {
      goto LABEL_8;
    }
    uint64_t v15 = DMFInvalidParameterErrorKey;
    v16 = @"request.name";
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
    uint64_t v12 = DMFErrorWithCodeAndUserInfo(1LL, v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue(v12);

LABEL_7:
    LOBYTE(a4) = 0;
    goto LABEL_8;
  }

  LOBYTE(a4) = 1;
LABEL_8:

  return (char)a4;
}

- (void)runWithRequest:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 name]);
  id v7 = 0LL;
  unsigned int v5 = +[DMDLockdownUtilities setDeviceName:outError:]( &OBJC_CLASS___DMDLockdownUtilities,  "setDeviceName:outError:",  v4,  &v7);
  id v6 = v7;

  if (v5) {
    -[DMDSetDeviceNameOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0LL);
  }
  else {
    -[DMDSetDeviceNameOperation endOperationWithError:](self, "endOperationWithError:", v6);
  }
}

@end