@interface DMDDeactivateConfigurationOrganizationOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (unint64_t)queueGroup;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDDeactivateConfigurationOrganizationOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFDeactivateConfigurationOrganizationRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5628;
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
    v8[2] = sub_10002D7B8;
    v8[3] = &unk_10009E850;
    v8[4] = self;
    [v6 handleDeactivateConfigurationOrganizationRequest:v4 completionHandler:v8];
  }

  else
  {
    uint64_t v7 = DMFErrorWithCodeAndUserInfo(4LL, 0LL);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[DMDDeactivateConfigurationOrganizationOperation endOperationWithError:](self, "endOperationWithError:", v6);
  }
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___DMDDeactivateConfigurationOrganizationOperation;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 organizationIdentifier]);

  if (!v7)
  {
    if (!a4) {
      goto LABEL_7;
    }
    uint64_t v12 = DMFInvalidParameterErrorKey;
    v13 = @"request.organizationIdentifier";
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