@interface DMDRemoveProfileOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)removeProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 completion:(id)a5;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDRemoveProfileOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFRemoveProfileRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5AC0;
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___DMDRemoveProfileOperation;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 profileIdentifier]);

  if (!v7)
  {
    if (!a4) {
      goto LABEL_7;
    }
    uint64_t v12 = DMFInvalidParameterErrorKey;
    v13 = @"request.profileIdentifier";
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

- (void)runWithRequest:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 profileIdentifier]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 installedProfileWithIdentifier:v4]);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskOperation context](self, "context"));
    if ([v7 runAsUser])
    {
    }

    else
    {
      objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[DMDRemoveProfileOperation request](self, "request"));
      id v12 = [v11 type];

      if (v12 != (id)1)
      {
        uint64_t v13 = 1LL;
        goto LABEL_8;
      }
    }

    uint64_t v13 = 2LL;
LABEL_8:
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10005405C;
    v14[3] = &unk_10009E850;
    v14[4] = self;
    -[DMDRemoveProfileOperation removeProfileWithIdentifier:installationType:completion:]( self,  "removeProfileWithIdentifier:installationType:completion:",  v4,  v13,  v14);
    goto LABEL_9;
  }

  uint64_t v15 = DMFProfileIdentifierErrorKey;
  v16 = v4;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
  uint64_t v9 = DMFErrorWithCodeAndUserInfo(1901LL, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  -[DMDRemoveProfileOperation endOperationWithError:](self, "endOperationWithError:", v10);

LABEL_9:
}

- (void)removeProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  [v9 removeProfileAsyncWithIdentifier:v8 installationType:a4 completion:v7];
}

@end