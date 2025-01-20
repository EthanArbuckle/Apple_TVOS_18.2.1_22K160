@interface DMDProcessStatusOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (BOOL)runOnMainThread;
- (unint64_t)queueGroup;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDProcessStatusOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFProcessStatusRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A59E8;
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
    v9[2] = sub_100051558;
    v9[3] = &unk_10009E850;
    v9[4] = self;
    [v6 processStatusForOrganizationWithIdentifier:v7 completionHandler:v9];
  }

  else
  {
    uint64_t v8 = DMFErrorWithCodeAndUserInfo(4LL, 0LL);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[DMDProcessStatusOperation endOperationWithError:](self, "endOperationWithError:", v6);
  }
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___DMDProcessStatusOperation;
  return objc_msgSendSuper2(&v5, "validateRequest:error:", a3, a4);
}

@end