@interface DMDRegisterConfigurationSourceOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (BOOL)runOnMainThread;
- (unint64_t)queueGroup;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDRegisterConfigurationSourceOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFRegisterConfigurationSourceRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5A48;
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
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskOperation context](self, "context"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 clientBundleIdentifier]);

    if (v7)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskOperation configurationEngine](self, "configurationEngine"));
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_100051B70;
      v14[3] = &unk_10009E850;
      v14[4] = self;
      [v9 handleConfigurationSourceRegistrationRequest:v4 clientIdentifier:v7 completionHandler:v14];
    }

    else
    {
      uint64_t v11 = DMFConfigurationEngineLog(v8);
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100066570(v12);
      }

      uint64_t v13 = DMFErrorWithCodeAndUserInfo(5LL, 0LL);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v13);
      -[DMDRegisterConfigurationSourceOperation endOperationWithError:](self, "endOperationWithError:", v9);
    }
  }

  else
  {
    uint64_t v10 = DMFErrorWithCodeAndUserInfo(4LL, 0LL);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[DMDRegisterConfigurationSourceOperation endOperationWithError:](self, "endOperationWithError:", v7);
  }
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___DMDRegisterConfigurationSourceOperation;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 configurationSourceName]);
  id v8 = [v7 length];

  if (!v8)
  {
    if (!a4) {
      goto LABEL_11;
    }
    uint64_t v19 = DMFInvalidParameterErrorKey;
    v20 = @"request.configurationSourceName";
    uint64_t v11 = &v20;
    v12 = &v19;
    goto LABEL_9;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 organizationIdentifier]);
  id v10 = [v9 length];

  if (!v10)
  {
    if (!a4) {
      goto LABEL_11;
    }
    uint64_t v17 = DMFInvalidParameterErrorKey;
    v18 = @"request.organizationIdentifier";
    uint64_t v11 = &v18;
    v12 = &v17;
LABEL_9:
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v12,  1LL));
    uint64_t v14 = DMFErrorWithCodeAndUserInfo(1LL, v13);
    *a4 = (id)objc_claimAutoreleasedReturnValue(v14);

LABEL_10:
    LOBYTE(a4) = 0;
    goto LABEL_11;
  }

  LOBYTE(a4) = 1;
LABEL_11:

  return (char)a4;
}

@end