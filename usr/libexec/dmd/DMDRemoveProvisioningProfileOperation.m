@interface DMDRemoveProvisioningProfileOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDRemoveProvisioningProfileOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFRemoveProvisioningProfileRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5AF0;
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___DMDRemoveProvisioningProfileOperation;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 profileIdentifier]);

  if (!v7)
  {
    if (!a4) {
      goto LABEL_11;
    }
    uint64_t v17 = DMFInvalidParameterErrorKey;
    v18 = @"request.profileIdentifier";
    v9 = &v18;
    v10 = &v17;
    goto LABEL_9;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 managingProfileIdentifier]);

  if (!v8)
  {
    if (!a4) {
      goto LABEL_11;
    }
    uint64_t v15 = DMFInvalidParameterErrorKey;
    v16 = @"request.managingProfileIdentifier";
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

- (void)runWithRequest:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 profileIdentifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyReader sharedReader](&OBJC_CLASS___MCDependencyReader, "sharedReader"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 managingProfileIdentifier]);

  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 dependentsOfParent:v7 inDomain:kMCDMManagingProfileToProvisioningProfileKey]);
  if ([v8 containsObject:v5])
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    id v16 = 0LL;
    unsigned int v10 = [v9 removeProvisioningProfileWithUUID:v5 outError:&v16];
    id v11 = v16;

    if (v10)
    {
      -[DMDRemoveProvisioningProfileOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0LL);
    }

    else
    {
      if (v11)
      {
        NSErrorUserInfoKey v17 = NSUnderlyingErrorKey;
        id v18 = v11;
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
        uint64_t v13 = DMFErrorWithCodeAndUserInfo(1202LL, v12);
        objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        -[DMDRemoveProvisioningProfileOperation endOperationWithError:](self, "endOperationWithError:", v14);
      }

      else
      {
        uint64_t v15 = DMFErrorWithCodeAndUserInfo(1202LL, 0LL);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v15);
        -[DMDRemoveProvisioningProfileOperation endOperationWithError:](self, "endOperationWithError:", v12);
      }
    }
  }

  else
  {
    -[DMDTaskOperation endOperationWithDMFErrorCode:](self, "endOperationWithDMFErrorCode:", 1201LL);
  }
}

@end