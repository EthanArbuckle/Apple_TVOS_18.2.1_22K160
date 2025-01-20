@interface DMDFetchDeclarationsOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (BOOL)runOnMainThread;
- (unint64_t)queueGroup;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDFetchDeclarationsOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFFetchDeclarationsRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5760;
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
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskOperation configurationEngine](self, "configurationEngine", a3));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskOperation configurationEngine](self, "configurationEngine"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDFetchDeclarationsOperation request](self, "request"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10003BE64;
    v9[3] = &unk_10009EB90;
    v9[4] = self;
    [v5 handleFetchDeclarationsRequest:v6 completionHandler:v9];
  }

  else
  {
    uint64_t v7 = DMFErrorWithCodeAndUserInfo(4LL, 0LL);
    id v8 = (id)objc_claimAutoreleasedReturnValue(v7);
    -[DMDFetchDeclarationsOperation endOperationWithError:](self, "endOperationWithError:", v8);
  }

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___DMDFetchDeclarationsOperation;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 organizationIdentifier]);

  if (!v7)
  {
    if (!a4) {
      goto LABEL_7;
    }
    uint64_t v12 = DMFInvalidParameterErrorKey;
    v13 = @"request.configurationSource";
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
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