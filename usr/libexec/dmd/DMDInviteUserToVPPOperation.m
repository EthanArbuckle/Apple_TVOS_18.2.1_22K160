@interface DMDInviteUserToVPPOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
@end

@implementation DMDInviteUserToVPPOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFInviteUserToVPPRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5940;
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___DMDInviteUserToVPPOperation;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 URL]);

  if (!v7)
  {
    if (!a4) {
      goto LABEL_11;
    }
    uint64_t v17 = DMFInvalidParameterErrorKey;
    v18 = @"request.URL";
    v9 = &v18;
    v10 = &v17;
    goto LABEL_9;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 originator]);

  if (!v8)
  {
    if (!a4) {
      goto LABEL_11;
    }
    uint64_t v15 = DMFInvalidParameterErrorKey;
    v16 = @"request.originator";
    v9 = &v16;
    v10 = &v15;
LABEL_9:
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v10,  1LL));
    uint64_t v12 = DMFErrorWithCodeAndUserInfo(1LL, v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue(v12);

LABEL_10:
    LOBYTE(a4) = 0;
    goto LABEL_11;
  }

  LOBYTE(a4) = 1;
LABEL_11:

  return (char)a4;
}

@end