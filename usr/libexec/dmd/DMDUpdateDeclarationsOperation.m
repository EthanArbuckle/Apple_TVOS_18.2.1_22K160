@interface DMDUpdateDeclarationsOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (BOOL)runOnMainThread;
- (unint64_t)queueGroup;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDUpdateDeclarationsOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFUpdateDeclarationsRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5D90;
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
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10005CB20;
    v8[3] = &unk_10009E850;
    v8[4] = self;
    [v6 handleUpdateDeclarationsRequest:v4 completionHandler:v8];
  }

  else
  {
    uint64_t v7 = DMFErrorWithCodeAndUserInfo(4LL, 0LL);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[DMDUpdateDeclarationsOperation endOperationWithError:](self, "endOperationWithError:", v6);
  }
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___DMDUpdateDeclarationsOperation;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 organizationIdentifier]);

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

  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 syncToken]);

  if (!v8)
  {
    if (!a4) {
      goto LABEL_11;
    }
    uint64_t v15 = DMFInvalidParameterErrorKey;
    v16 = @"request.syncToken";
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