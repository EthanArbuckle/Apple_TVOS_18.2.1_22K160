@interface DMDFetchOrganizationsOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (unint64_t)queueGroup;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDFetchOrganizationsOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFFetchConfigurationOrganizationsRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A57D8;
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
    v8[2] = sub_10003C620;
    v8[3] = &unk_10009EBB8;
    v8[4] = self;
    [v6 handleFetchConfigurationOrganizationsRequest:v4 completionHandler:v8];
  }

  else
  {
    uint64_t v7 = DMFErrorWithCodeAndUserInfo(4LL, 0LL);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[DMDFetchOrganizationsOperation endOperationWithError:](self, "endOperationWithError:", v6);
  }
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___DMDFetchOrganizationsOperation;
  return objc_msgSendSuper2(&v5, "validateRequest:error:", a3, a4);
}

@end