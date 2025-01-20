@interface DMDInstallProfileOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)_installInteractiveProfile:(id)a3;
- (void)_installSilentProfileData:(id)a3 managingProfileIdentifier:(id)a4 personaID:(id)a5;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDInstallProfileOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFInstallProfileRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5910;
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___DMDInstallProfileOperation;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 profileData]);

  if (!v7)
  {
    if (!a4) {
      goto LABEL_12;
    }
    uint64_t v19 = DMFInvalidParameterErrorKey;
    v20 = @"request.profileData";
    v11 = &v20;
    v12 = &v19;
    goto LABEL_10;
  }

  uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 managingProfileIdentifier]);
  if (v8)
  {
    v9 = (void *)v8;
    id v10 = [v6 style];

    if (v10 != (id)1)
    {
      if (!a4) {
        goto LABEL_12;
      }
      uint64_t v17 = DMFInvalidParameterErrorKey;
      v18 = @"request.managingProfileIdentifier";
      v11 = &v18;
      v12 = &v17;
LABEL_10:
      v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v12,  1LL));
      uint64_t v14 = DMFErrorWithCodeAndUserInfo(1LL, v13);
      *a4 = (id)objc_claimAutoreleasedReturnValue(v14);

LABEL_11:
      LOBYTE(a4) = 0;
      goto LABEL_12;
    }
  }

  LOBYTE(a4) = 1;
LABEL_12:

  return (char)a4;
}

- (void)runWithRequest:(id)a3
{
  id v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v10 profileData]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v10 managingProfileIdentifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MCHacks sharedHacks](&OBJC_CLASS___MCHacks, "sharedHacks"));
  unsigned int v7 = [v6 isSetupBuddyDone];

  id v8 = [v10 style];
  if (v8 == (id)2)
  {
    if (!v7)
    {
      -[DMDTaskOperation endOperationWithDMFErrorCode:](self, "endOperationWithDMFErrorCode:", 2001LL);
      goto LABEL_10;
    }

    goto LABEL_8;
  }

  if (v8 == (id)1)
  {
LABEL_6:
    v9 = (void *)objc_claimAutoreleasedReturnValue([v10 personaID]);
    -[DMDInstallProfileOperation _installSilentProfileData:managingProfileIdentifier:personaID:]( self,  "_installSilentProfileData:managingProfileIdentifier:personaID:",  v4,  v5,  v9);

    goto LABEL_10;
  }

  if (!v8)
  {
    if (!v7 || getuid() == 502) {
      goto LABEL_6;
    }
LABEL_8:
    -[DMDInstallProfileOperation _installInteractiveProfile:](self, "_installInteractiveProfile:", v4);
  }

- (void)_installSilentProfileData:(id)a3 managingProfileIdentifier:(id)a4 personaID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskOperation context](self, "context"));
  if ([v12 runAsUser])
  {

LABEL_4:
    uint64_t v15 = 2LL;
    goto LABEL_6;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallProfileOperation request](self, "request"));
  id v14 = [v13 type];

  if (v14 == (id)1) {
    goto LABEL_4;
  }
  uint64_t v15 = 1LL;
LABEL_6:
  uint64_t v29 = kMCInstallProfileOptionInstallationType;
  objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v15));
  v30 = v16;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v30,  &v29,  1LL));
  id v18 = [v17 mutableCopy];

  if (v8)
  {
    [v18 setObject:&__kCFBooleanTrue forKeyedSubscript:kMCInstallProfileOptionIsInstalledByMDM];
    [v18 setObject:v8 forKeyedSubscript:kMCInstallProfileOptionManagingProfileIdentifier];
  }

  if (v9) {
    [v18 setObject:v9 forKeyedSubscript:kMDMPersonaKey];
  }
  id v19 = [v18 copy];
  id v26 = 0LL;
  v20 = (void *)objc_claimAutoreleasedReturnValue([v11 installProfileData:v10 options:v19 outError:&v26]);

  id v21 = v26;
  if (v20)
  {
    -[DMDInstallProfileOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0LL);
  }

  else
  {
    if (v21)
    {
      NSErrorUserInfoKey v27 = NSUnderlyingErrorKey;
      id v28 = v21;
      v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
      uint64_t v23 = DMFErrorWithCodeAndUserInfo(2002LL, v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      -[DMDInstallProfileOperation endOperationWithError:](self, "endOperationWithError:", v24);
    }

    else
    {
      uint64_t v25 = DMFErrorWithCodeAndUserInfo(2002LL, 0LL);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v25);
      -[DMDInstallProfileOperation endOperationWithError:](self, "endOperationWithError:", v22);
    }
  }
}

- (void)_installInteractiveProfile:(id)a3
{
  id v4 = a3;
  id v19 = 0LL;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfile profileWithData:outError:](&OBJC_CLASS___MCProfile, "profileWithData:outError:", v4, &v19));
  id v6 = v19;
  unsigned int v7 = v6;
  if (v5)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    if ([v8 mustInstallProfileNonInteractively:v5])
    {
      -[DMDTaskOperation endOperationWithDMFErrorCode:](self, "endOperationWithDMFErrorCode:", 2000LL);
    }

    else
    {
      id v18 = v7;
      id v12 = [v8 queueFileDataForAcceptance:v4 originalFileName:0 outError:&v18];
      id v13 = v18;

      if (v13)
      {
        NSErrorUserInfoKey v20 = NSUnderlyingErrorKey;
        id v21 = v13;
        id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
        uint64_t v15 = DMFErrorWithCodeAndUserInfo(2002LL, v14);
        objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        -[DMDInstallProfileOperation endOperationWithError:](self, "endOperationWithError:", v16);
      }

      else
      {
        -[DMDInstallProfileOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0LL);
      }
    }

    unsigned int v7 = v8;
  }

  else if (v6)
  {
    NSErrorUserInfoKey v22 = NSUnderlyingErrorKey;
    id v23 = v6;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
    uint64_t v10 = DMFErrorWithCodeAndUserInfo(2003LL, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[DMDInstallProfileOperation endOperationWithError:](self, "endOperationWithError:", v11);
  }

  else
  {
    uint64_t v17 = DMFErrorWithCodeAndUserInfo(2003LL, 0LL);
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(v17);
    -[DMDInstallProfileOperation endOperationWithError:](self, "endOperationWithError:", v7);
  }
}

@end