@interface DMDProcessDeclarationsOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (BOOL)runOnMainThread;
- (unint64_t)queueGroup;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDProcessDeclarationsOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFProcessDeclarationsRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A59D0;
}

- (unint64_t)queueGroup
{
  return 1LL;
}

- (BOOL)runOnMainThread
{
  return 1;
}

- (void)runWithRequest:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskOperation configurationEngine](self, "configurationEngine"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskOperation configurationEngine](self, "configurationEngine"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 organizationIdentifier]);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100051414;
    v9[3] = &unk_10009E850;
    v9[4] = self;
    [v6 processDeclarationsForOrganizationWithIdentifier:v7 completionHandler:v9];
  }

  else
  {
    uint64_t v8 = DMFErrorWithCodeAndUserInfo(4LL, 0LL);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[DMDProcessDeclarationsOperation endOperationWithError:](self, "endOperationWithError:", v6);
  }
}

@end