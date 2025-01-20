@interface DMDFetchStreamEventsOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (unint64_t)queueGroup;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDFetchStreamEventsOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFFetchStreamEventsRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5898;
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
    v8[2] = sub_10003D684;
    v8[3] = &unk_10009EBE0;
    v8[4] = self;
    [v6 handleFetchStreamEvents:v4 completionHandler:v8];
  }

  else
  {
    uint64_t v7 = DMFErrorWithCodeAndUserInfo(4LL, 0LL);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[DMDFetchStreamEventsOperation endOperationWithError:](self, "endOperationWithError:", v6);
  }
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS___DMDFetchStreamEventsOperation;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 organizationIdentifier]);
  id v8 = [v7 length];

  if (!v8)
  {
    if (!a4) {
      goto LABEL_11;
    }
    uint64_t v18 = DMFInvalidParameterErrorKey;
    v19 = @"request.organizationIdentifier";
    v10 = &v19;
    v11 = &v18;
    goto LABEL_9;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 startDate]);

  if (!v9)
  {
    if (!a4) {
      goto LABEL_11;
    }
    uint64_t v16 = DMFInvalidParameterErrorKey;
    v17 = @"request.startDate";
    v10 = &v17;
    v11 = &v16;
LABEL_9:
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v11,  1LL));
    uint64_t v13 = DMFErrorWithCodeAndUserInfo(1LL, v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue(v13);

LABEL_10:
    LOBYTE(a4) = 0;
    goto LABEL_11;
  }

  LOBYTE(a4) = 1;
LABEL_11:

  return (char)a4;
}

@end