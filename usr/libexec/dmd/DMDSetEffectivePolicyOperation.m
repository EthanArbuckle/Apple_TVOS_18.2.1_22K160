@interface DMDSetEffectivePolicyOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDSetEffectivePolicyOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMDSetEffectivePolicyRequest));
}

+ (id)requiredEntitlements
{
  return &__NSArray0__struct;
}

- (void)runWithRequest:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskOperation configurationEngine](self, "configurationEngine"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 policyPersistence]);
  id v7 = [v4 policy];
  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 type]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 identifiers]);
  id v10 = [v4 priority];
  v11 = (void *)objc_claimAutoreleasedReturnValue([v4 organizationIdentifier]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v4 declarationIdentifier]);

  v13[1] = 3221225472LL;
  v13[2] = sub_100056484;
  v13[3] = &unk_10009E850;
  v13[4] = self;
  v13[0] = _NSConcreteStackBlock;
  [v6 setEffectivePolicy:v7 forType:v8 identifiers:v9 priority:v10 organizationIdentifier:v11 declarationIdentifier:v12 completionHandler:v13];
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS___DMDSetEffectivePolicyOperation;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 organizationIdentifier]);

  if (!v7)
  {
    if (!a4) {
      goto LABEL_14;
    }
    uint64_t v20 = DMFInvalidParameterErrorKey;
    v21 = @"request.organizationIdentifier";
    id v10 = &v21;
    v11 = &v20;
    goto LABEL_12;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 declarationIdentifier]);

  if (!v8)
  {
    if (!a4) {
      goto LABEL_14;
    }
    uint64_t v18 = DMFInvalidParameterErrorKey;
    v19 = @"request.declarationIdentifier";
    id v10 = &v19;
    v11 = &v18;
    goto LABEL_12;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 type]);

  if (!v9)
  {
    if (!a4) {
      goto LABEL_14;
    }
    uint64_t v16 = DMFInvalidParameterErrorKey;
    v17 = @"request.type";
    id v10 = &v17;
    v11 = &v16;
LABEL_12:
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v11,  1LL));
    uint64_t v13 = DMFErrorWithCodeAndUserInfo(1LL, v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue(v13);

LABEL_13:
    LOBYTE(a4) = 0;
    goto LABEL_14;
  }

  LOBYTE(a4) = 1;
LABEL_14:

  return (char)a4;
}

@end