@interface DMDCreateConfigurationOrganizationOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (unint64_t)queueGroup;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDCreateConfigurationOrganizationOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFCreateConfigurationOrganizationRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5610;
}

- (unint64_t)queueGroup
{
  return 1LL;
}

- (void)runWithRequest:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskOperation configurationEngine](self, "configurationEngine"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskOperation configurationEngine](self, "configurationEngine"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10002D4F0;
    v8[3] = &unk_10009E850;
    v8[4] = self;
    [v6 handleCreateConfigurationOrganizationRequest:v4 completionHandler:v8];
  }

  else
  {
    uint64_t v7 = DMFErrorWithCodeAndUserInfo(4LL, 0LL);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[DMDCreateConfigurationOrganizationOperation endOperationWithError:](self, "endOperationWithError:", v6);
  }
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS___DMDCreateConfigurationOrganizationOperation;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 organizationIdentifier]);

  if (!v7)
  {
    if (!a4) {
      goto LABEL_14;
    }
    uint64_t v20 = DMFInvalidParameterErrorKey;
    v21 = @"request.organizationIdentifier";
    v10 = &v21;
    v11 = &v20;
    goto LABEL_12;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 organizationDisplayName]);

  if (!v8)
  {
    if (!a4) {
      goto LABEL_14;
    }
    uint64_t v18 = DMFInvalidParameterErrorKey;
    v19 = @"request.organizationDisplayName";
    v10 = &v19;
    v11 = &v18;
    goto LABEL_12;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 organizationType]);

  if (!v9)
  {
    if (!a4) {
      goto LABEL_14;
    }
    uint64_t v16 = DMFInvalidParameterErrorKey;
    v17 = @"request.organizationType";
    v10 = &v17;
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