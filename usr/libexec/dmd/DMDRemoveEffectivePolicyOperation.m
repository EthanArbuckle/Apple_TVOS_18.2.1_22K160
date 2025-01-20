@interface DMDRemoveEffectivePolicyOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDRemoveEffectivePolicyOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMDRemoveEffectivePolicyRequest));
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
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 organizationIdentifier]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 declarationIdentifier]);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100053440;
  v9[3] = &unk_10009E850;
  v9[4] = self;
  [v6 removeEffectivePolicyFromOrganizationIdentifier:v7 declarationIdentifier:v8 completionHandler:v9];
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___DMDRemoveEffectivePolicyOperation;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 organizationIdentifier]);

  if (!v7)
  {
    if (!a4) {
      goto LABEL_11;
    }
    uint64_t v17 = DMFInvalidParameterErrorKey;
    v18 = @"request.organizationIdentifier";
    v9 = &v18;
    v10 = &v17;
    goto LABEL_9;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 declarationIdentifier]);

  if (!v8)
  {
    if (!a4) {
      goto LABEL_11;
    }
    uint64_t v15 = DMFInvalidParameterErrorKey;
    v16 = @"request.declarationIdentifier";
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