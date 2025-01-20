@interface DMDRemoveConfigurationOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (BOOL)_removeRestrictionsWithRequest:(id)a3 error:(id *)a4;
- (unint64_t)queueGroup;
- (void)_removeProfile:(id)a3 withRequest:(id)a4 completion:(id)a5;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDRemoveConfigurationOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFRemoveConfigurationRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5A78;
}

- (unint64_t)queueGroup
{
  return 1LL;
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___DMDRemoveConfigurationOperation;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 profile]);

  if (!v7)
  {
    if (!a4) {
      goto LABEL_7;
    }
    uint64_t v12 = DMFInvalidParameterErrorKey;
    v13 = @"request.profile";
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
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 profile]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"PayloadContent"]);

  if ([v6 count] == (id)1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"PayloadType"]);
    unsigned __int8 v9 = [v8 isEqualToString:@"com.apple.applicationaccess"];

    if ((v9 & 1) != 0)
    {
      id v10 = 0LL;
      char v11 = 1;
    }

    else
    {
      id v10 = (id)objc_claimAutoreleasedReturnValue([v4 profile]);
      char v11 = 0;
    }
  }

  else if ([v6 count] == (id)2)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 profile]);
    id v13 = [v12 mutableCopy];

    v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:0]);
    v20 = v14;
    char v11 = 1;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
    [v13 setObject:v15 forKeyedSubscript:@"PayloadContent"];

    id v10 = [v13 copy];
  }

  else
  {
    char v11 = 0;
    id v10 = 0LL;
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100052DAC;
  v17[3] = &unk_10009F2C0;
  char v19 = v11;
  v17[4] = self;
  id v18 = v4;
  id v16 = v4;
  -[DMDRemoveConfigurationOperation _removeProfile:withRequest:completion:]( self,  "_removeProfile:withRequest:completion:",  v10,  v16,  v17);
}

- (void)_removeProfile:(id)a3 withRequest:(id)a4 completion:(id)a5
{
  id v8 = a5;
  unsigned __int8 v9 = (void (**)(void, void))v8;
  if (a3)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([a4 profile]);
    char v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"PayloadIdentifier"]);

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 installedProfileWithIdentifier:v11]);

    if (!v13)
    {
      uint64_t v22 = DMFProfileIdentifierErrorKey;
      v23 = v11;
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
      uint64_t v16 = DMFErrorWithCodeAndUserInfo(1901LL, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      ((void (**)(void, void *))v9)[2](v9, v17);

LABEL_11:
      goto LABEL_12;
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskOperation context](self, "context"));
    if ([v14 runAsUser])
    {
    }

    else
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[DMDRemoveConfigurationOperation request](self, "request"));
      id v19 = [v18 type];

      if (v19 != (id)1)
      {
        uint64_t v20 = 1LL;
        goto LABEL_10;
      }
    }

    uint64_t v20 = 2LL;
LABEL_10:
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    [v21 removeProfileAsyncWithIdentifier:v11 installationType:v20 completion:v9];

    goto LABEL_11;
  }

  (*((void (**)(id, void))v8 + 2))(v8, 0LL);
LABEL_12:
}

- (BOOL)_removeRestrictionsWithRequest:(id)a3 error:(id *)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 profile]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"PayloadIdentifier"]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-restrictions",  v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 clientRestrictionsForClientUUID:v6]);

  uint64_t v9 = MCFeatureMaximumAppsRating;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManager valueForFeature:withRestrictionsDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "valueForFeature:withRestrictionsDictionary:",  MCFeatureMaximumAppsRating,  v8));
  unsigned int v11 = [v10 intValue];
  uint64_t v12 = (void *)DMFAppRatingUnrated;
  unsigned int v13 = [DMFAppRatingUnrated intValue];
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  id v25 = 0LL;
  unsigned __int8 v15 = [v14 applyRestrictionDictionary:0 clientType:@"com.apple.dmd" clientUUID:v6 localizedClientDescription:0 localizedWarningM essage:0 outRestrictionChanged:0 outEffectiveSettingsChanged:0 outError:&v25];
  id v16 = v25;

  if ((v15 & 1) != 0)
  {
    if (v11 == v13)
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 userValueForSetting:v9]);

      LODWORD(v18) = [v19 intValue];
      if ((_DWORD)v18 == [v12 intValue])
      {
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
        [v20 setValue:DMFAppRatingAllApps forSetting:v9];
      }
    }
  }

  else
  {
    uint64_t v21 = DMFConfigurationEngineLog(v17);
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_100066B68(v16, v22);
    }

    if (*a4) {
      *a4 = v16;
    }
  }

  return v15;
}

@end