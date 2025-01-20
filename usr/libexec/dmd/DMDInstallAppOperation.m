@interface DMDInstallAppOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)appIdentityForBundleIdentifier:(id)a3 persona:(id)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (BOOL)appCoordinatorExistsForBundleIdentifier:(id)a3 persona:(id)a4;
- (DMDAppMetadata)metadata;
- (void)_resumeInstallationForRequest:(id)a3;
- (void)_runWithRequest:(id)a3;
- (void)installAppForRequest:(id)a3;
- (void)runWithRequest:(id)a3;
- (void)setMetadata:(id)a3;
@end

@implementation DMDInstallAppOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___DMDInstallAppOperation;
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 storeItemIdentifier]);
  if (v7)
  {
    v8 = (void *)v7;
    id v9 = [v6 licenseType];

    if (!v9)
    {
      if (!a4) {
        goto LABEL_8;
      }
      uint64_t v14 = DMFInvalidParameterErrorKey;
      v15 = @"request.licenseType";
      v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
      uint64_t v11 = DMFErrorWithCodeAndUserInfo(1LL, v10);
      *a4 = (id)objc_claimAutoreleasedReturnValue(v11);

LABEL_7:
      LOBYTE(a4) = 0;
      goto LABEL_8;
    }
  }

  LOBYTE(a4) = 1;
LABEL_8:

  return (char)a4;
}

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFInstallAppRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A58C8;
}

- (void)runWithRequest:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10003DA38;
  v7[3] = &unk_10009EC08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 getMetadataForAppRequest:v6 completion:v7];
}

- (BOOL)appCoordinatorExistsForBundleIdentifier:(id)a3 persona:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(id)objc_opt_class(self) appIdentityForBundleIdentifier:v7 persona:v6];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  id v17 = 0LL;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[IXAppInstallCoordinator existingCoordinatorForAppWithIdentity:error:]( &OBJC_CLASS___IXAppInstallCoordinator,  "existingCoordinatorForAppWithIdentity:error:",  v9,  &v17));
  id v11 = v17;
  v12 = v11;
  if (v10) {
    goto LABEL_2;
  }
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 domain]);
  unsigned int v15 = [v14 isEqualToString:IXErrorDomain];

  if (!v15)
  {
LABEL_7:
    BOOL v13 = 0;
    goto LABEL_8;
  }

  if ([v12 code] != (id)48)
  {
    if ([v12 code] != (id)46) {
      [v12 code];
    }
    goto LABEL_7;
  }

+ (id)appIdentityForBundleIdentifier:(id)a3 persona:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc(&OBJC_CLASS___IXApplicationIdentity);
  if (v5) {
    id v8 = [v7 initWithBundleIdentifier:v6 personaUniqueString:v5];
  }
  else {
    id v8 = [v7 initWithBundleIdentifier:v6];
  }
  id v9 = v8;

  return v9;
}

- (void)installAppForRequest:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 manifestURL]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10003DEC4;
  v13[3] = &unk_10009E850;
  v13[4] = self;
  id v7 = objc_retainBlock(v13);
  uint64_t v9 = DMFAppLog(v7, v8);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v6 host]);
      *(_DWORD *)buf = 138543362;
      id v15 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Start installing enterprise app with manifest URL from: %{public}@",  buf,  0xCu);
    }

    [v5 startInstallingEnterpriseAppWithManifestURL:v6 completion:v7];
  }

  else
  {
    if (v11)
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Start installing non-enterprise app for request: %{public}@",  buf,  0xCu);
    }

    [v5 startInstallingNonEnterpriseAppForRequest:v4 completion:v7];
  }
}

- (void)_runWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallAppOperation metadata](self, "metadata"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 lifeCycle]);
  id v7 = (char *)[v6 currentState];

  if ((unint64_t)(v7 - 4) < 4)
  {
    uint64_t v14 = DMFBundleIdentifierErrorKey;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallAppOperation metadata](self, "metadata"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleIdentifier]);
    id v15 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
    uint64_t v11 = 2600LL;
LABEL_5:
    uint64_t v12 = DMFErrorWithCodeAndUserInfo(v11, v10);
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    -[DMDInstallAppOperation endOperationWithError:](self, "endOperationWithError:", v13);

    goto LABEL_6;
  }

  if ((unint64_t)(v7 - 1) < 2)
  {
    uint64_t v16 = DMFBundleIdentifierErrorKey;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallAppOperation metadata](self, "metadata"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleIdentifier]);
    id v17 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
    uint64_t v11 = 2603LL;
    goto LABEL_5;
  }

  else {
    -[DMDInstallAppOperation installAppForRequest:](self, "installAppForRequest:", v4);
  }
LABEL_6:
}

- (void)_resumeInstallationForRequest:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallAppOperation metadata](self, "metadata", a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10003E124;
  v7[3] = &unk_10009E850;
  v7[4] = self;
  [v6 resumeAppInstallationWithBundleIdentifier:v5 completion:v7];
}

- (DMDAppMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (void).cxx_destruct
{
}

@end