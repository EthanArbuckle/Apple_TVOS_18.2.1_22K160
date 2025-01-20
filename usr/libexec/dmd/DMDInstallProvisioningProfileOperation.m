@interface DMDInstallProvisioningProfileOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDInstallProvisioningProfileOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFInstallProvisioningProfileRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5928;
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___DMDInstallProvisioningProfileOperation;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 profileData]);

  if (!v7)
  {
    if (!a4) {
      goto LABEL_7;
    }
    uint64_t v12 = DMFInvalidParameterErrorKey;
    v13 = @"request.profileData";
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
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 profileData]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 managingProfileIdentifier]);

  id v13 = 0LL;
  LODWORD(v4) = [v5 installProvisioningProfileData:v6 managingProfileIdentifier:v7 outError:&v13];
  id v8 = v13;

  if ((_DWORD)v4)
  {
    -[DMDInstallProvisioningProfileOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0LL);
  }

  else
  {
    if (v8)
    {
      NSErrorUserInfoKey v14 = NSUnderlyingErrorKey;
      id v15 = v8;
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
      uint64_t v10 = DMFErrorWithCodeAndUserInfo(2800LL, v9);
      objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      -[DMDInstallProvisioningProfileOperation endOperationWithError:](self, "endOperationWithError:", v11);
    }

    else
    {
      uint64_t v12 = DMFErrorWithCodeAndUserInfo(2800LL, 0LL);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v12);
      -[DMDInstallProvisioningProfileOperation endOperationWithError:](self, "endOperationWithError:", v9);
    }
  }
}

@end