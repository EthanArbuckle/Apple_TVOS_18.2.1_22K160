@interface DMDInstallConfigurationOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (NSSet)excludedBoolRestrictions;
+ (id)_intersectionAliasToFeatures;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (BOOL)_installProfile:(id)a3 withRequest:(id)a4 error:(id *)a5;
- (BOOL)_installRestrictionsPayload:(id)a3 withRequest:(id)a4 error:(id *)a5;
- (id)_applyHeuristicsToRestrictions:(id)a3 error:(id *)a4;
- (id)_intersectionFeatureForPayloadRestrictionKey:(id)a3;
- (id)_mapMCRestrictionsFromPayload:(id)a3 error:(id *)a4;
- (unint64_t)queueGroup;
- (void)_rollbackProfile:(id)a3 withRequest:(id)a4 completion:(id)a5;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDInstallConfigurationOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFInstallConfigurationRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A58E0;
}

- (unint64_t)queueGroup
{
  return 1LL;
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___DMDInstallConfigurationOperation;
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

+ (NSSet)excludedBoolRestrictions
{
  if (qword_1000CCCF8 != -1) {
    dispatch_once(&qword_1000CCCF8, &stru_10009EC28);
  }
  return (NSSet *)(id)qword_1000CCCF0;
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
    unsigned int v9 = [v8 isEqualToString:@"com.apple.applicationaccess"];

    if (!v9)
    {
      id v15 = (id)objc_claimAutoreleasedReturnValue([v4 profile]);
      v10 = 0LL;
      goto LABEL_9;
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:0]);
  }

  else
  {
    if ([v6 count] == (id)2)
    {
      objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v4 profile]);
      id v12 = [v11 mutableCopy];

      v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:0]);
      v31 = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v31, 1LL));
      [v12 setObject:v14 forKeyedSubscript:@"PayloadContent"];

      id v15 = [v12 copy];
      v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:1]);

      goto LABEL_9;
    }

    v10 = 0LL;
  }

  id v15 = 0LL;
LABEL_9:
  id v28 = 0LL;
  unsigned __int8 v16 = -[DMDInstallConfigurationOperation _installProfile:withRequest:error:]( self,  "_installProfile:withRequest:error:",  v15,  v4,  &v28);
  id v17 = v28;
  id v18 = v17;
  if ((v16 & 1) != 0)
  {
    id v27 = v17;
    unsigned __int8 v19 = -[DMDInstallConfigurationOperation _installRestrictionsPayload:withRequest:error:]( self,  "_installRestrictionsPayload:withRequest:error:",  v10,  v4,  &v27);
    id v20 = v27;

    if ((v19 & 1) != 0)
    {
      -[DMDInstallConfigurationOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0LL);
      id v18 = v20;
    }

    else
    {
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_10003E660;
      v25[3] = &unk_10009E650;
      v25[4] = self;
      id v26 = v20;
      id v18 = v20;
      -[DMDInstallConfigurationOperation _rollbackProfile:withRequest:completion:]( self,  "_rollbackProfile:withRequest:completion:",  v15,  v4,  v25);
    }
  }

  else if (v17)
  {
    NSErrorUserInfoKey v29 = NSUnderlyingErrorKey;
    id v30 = v17;
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v30,  &v29,  1LL));
    uint64_t v22 = DMFErrorWithCodeAndUserInfo(2002LL, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    -[DMDInstallConfigurationOperation endOperationWithError:](self, "endOperationWithError:", v23);
  }

  else
  {
    uint64_t v24 = DMFErrorWithCodeAndUserInfo(2002LL, 0LL);
    id v18 = (id)objc_claimAutoreleasedReturnValue(v24);
    -[DMDInstallConfigurationOperation endOperationWithError:](self, "endOperationWithError:", v18);
  }
}

- (BOOL)_installProfile:(id)a3 withRequest:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if (a3)
  {
    id v30 = 0LL;
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  a3,  200LL,  0LL,  &v30));
    id v10 = v30;
    objc_super v11 = v10;
    if (!v9)
    {
      uint64_t v15 = DMFConfigurationEngineLog(v10);
      unsigned __int8 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100064C8C(v11);
      }

      if (a5)
      {
        id v17 = v11;
        BOOL v14 = 0;
        *a5 = v17;
      }

      else
      {
        BOOL v14 = 0;
        id v17 = v11;
      }

      goto LABEL_19;
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskOperation context](self, "context"));
    if ([v13 runAsUser])
    {
    }

    else
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallConfigurationOperation request](self, "request"));
      id v19 = [v18 type];

      if (v19 != (id)1)
      {
        uint64_t v20 = 1LL;
        goto LABEL_13;
      }
    }

    uint64_t v20 = 2LL;
LABEL_13:
    uint64_t v31 = kMCInstallProfileOptionInstallationType;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v20));
    v32 = v21;
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v32,  &v31,  1LL));
    id v23 = [v22 mutableCopy];

    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v8 managingProfileIdentifier]);
    if (v24)
    {
      [v23 setObject:&__kCFBooleanTrue forKeyedSubscript:kMCInstallProfileOptionIsInstalledByMDM];
      v25 = (void *)objc_claimAutoreleasedReturnValue([v8 managingProfileIdentifier]);
      [v23 setObject:v25 forKeyedSubscript:kMCInstallProfileOptionManagingProfileIdentifier];
    }

    id v26 = [v23 copy];
    id v29 = v11;
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v12 installProfileData:v9 options:v26 outError:&v29]);
    id v17 = v29;

    BOOL v14 = v27 != 0LL;
    if (a5 && !v27) {
      *a5 = v17;
    }

LABEL_19:
    goto LABEL_20;
  }

  BOOL v14 = 1;
LABEL_20:

  return v14;
}

- (void)_rollbackProfile:(id)a3 withRequest:(id)a4 completion:(id)a5
{
  id v8 = a5;
  unsigned int v9 = (void (**)(void, void))v8;
  if (a3)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([a4 profile]);
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"PayloadIdentifier"]);

    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 installedProfileWithIdentifier:v11]);

    if (!v13)
    {
      uint64_t v22 = DMFProfileIdentifierErrorKey;
      id v23 = v11;
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
      uint64_t v16 = DMFErrorWithCodeAndUserInfo(1901LL, v15);
      id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      ((void (**)(void, void *))v9)[2](v9, v17);

LABEL_11:
      goto LABEL_12;
    }

    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskOperation context](self, "context"));
    if ([v14 runAsUser])
    {
    }

    else
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallConfigurationOperation request](self, "request"));
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

- (BOOL)_installRestrictionsPayload:(id)a3 withRequest:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if (a3)
  {
    id v38 = 0LL;
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( -[DMDInstallConfigurationOperation _mapMCRestrictionsFromPayload:error:]( self,  "_mapMCRestrictionsFromPayload:error:",  a3,  &v38));
    id v10 = v38;
    id v11 = v10;
    if (v9)
    {
      id v37 = v10;
      id v12 = (void *)objc_claimAutoreleasedReturnValue( -[DMDInstallConfigurationOperation _applyHeuristicsToRestrictions:error:]( self,  "_applyHeuristicsToRestrictions:error:",  v9,  &v37));
      id v13 = v37;

      if (v12)
      {
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v8 profile]);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"PayloadIdentifier"]);
        id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-restrictions",  v16));

        id v18 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
        id v36 = v13;
        unsigned __int8 v19 = [v18 applyRestrictionDictionary:v12 clientType:@"com.apple.dmd" clientUUID:v17 localizedClientDescription:0 localizedWa rningMessage:0 outRestrictionChanged:0 outEffectiveSettingsChanged:0 outError:&v36];
        id v11 = v36;

        if ((v19 & 1) != 0)
        {
          uint64_t v21 = MCFeatureMaximumAppsRating;
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManager valueForFeature:withRestrictionsDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "valueForFeature:withRestrictionsDictionary:",  MCFeatureMaximumAppsRating,  v12));
          unsigned int v23 = [v22 intValue];
          uint64_t v24 = DMFAppRatingUnrated;
          if (v23 == [DMFAppRatingUnrated intValue])
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue( +[MCProfileConnection sharedConnection]( &OBJC_CLASS___MCProfileConnection,  "sharedConnection"));
            id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 userValueForSetting:v21]);

            LODWORD(v25) = [v26 intValue];
            if ((_DWORD)v25 == [DMFAppRatingAllApps intValue])
            {
              id v27 = (void *)objc_claimAutoreleasedReturnValue( +[MCProfileConnection sharedConnection]( &OBJC_CLASS___MCProfileConnection,  "sharedConnection"));
              [v27 setValue:v24 forSetting:v21];
            }
          }
        }

        else
        {
          uint64_t v33 = DMFConfigurationEngineLog(v20);
          v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
            sub_100064DF4(v11);
          }

          if (a5) {
            *a5 = v11;
          }
        }

        goto LABEL_27;
      }

      uint64_t v31 = DMFConfigurationEngineLog(v14);
      v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        sub_100064D7C(v13);
      }

      if (!a5)
      {
        unsigned __int8 v19 = 0;
        id v11 = v13;
        goto LABEL_27;
      }

      id v30 = v13;
    }

    else
    {
      uint64_t v28 = DMFConfigurationEngineLog(v10);
      id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_100064D04(v11);
      }

      if (!a5)
      {
        unsigned __int8 v19 = 0;
        goto LABEL_27;
      }

      id v30 = v11;
    }

    id v11 = v30;
    unsigned __int8 v19 = 0;
    *a5 = v11;
LABEL_27:

    goto LABEL_28;
  }

  unsigned __int8 v19 = 1;
LABEL_28:

  return v19;
}

- (id)_mapMCRestrictionsFromPayload:(id)a3 error:(id *)a4
{
  v79 = a4;
  id v100 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  4LL));
  uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v9 = MCRestrictedBoolKey;
  v98 = (void *)v5;
  [v4 setObject:v5 forKeyedSubscript:MCRestrictedBoolKey];
  uint64_t v10 = MCRestrictedValueKey;
  v97 = (void *)v6;
  [v4 setObject:v6 forKeyedSubscript:MCRestrictedValueKey];
  uint64_t v11 = MCIntersectionKey;
  v91 = (void *)v7;
  [v4 setObject:v7 forKeyedSubscript:MCIntersectionKey];
  uint64_t v12 = MCUnionKey;
  v81 = v4;
  v86 = (void *)v8;
  [v4 setObject:v8 forKeyedSubscript:MCUnionKey];
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](&OBJC_CLASS___MCRestrictionManager, "sharedManager"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 defaultRestrictions]);

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v9]);
  v84 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v10]);
  v83 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v11]);
  v80 = v14;
  v82 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v12]);
  __int128 v121 = 0u;
  __int128 v122 = 0u;
  __int128 v123 = 0u;
  __int128 v124 = 0u;
  id obj = v15;
  id v16 = [obj countByEnumeratingWithState:&v121 objects:v146 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v122;
    uint64_t v19 = MCRestrictedBoolValueKey;
    while (2)
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v122 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void *)(*((void *)&v121 + 1) + 8LL * (void)i);
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[DMDInstallConfigurationOperation excludedBoolRestrictions]( &OBJC_CLASS___DMDInstallConfigurationOperation,  "excludedBoolRestrictions",  v79));
        unsigned __int8 v23 = [v22 containsObject:v21];

        if ((v23 & 1) == 0)
        {
          uint64_t v24 = objc_claimAutoreleasedReturnValue([v100 objectForKey:v21]);
          v25 = (void *)v24;
          if (v24)
          {
            if ((objc_opt_respondsToSelector(v24, "BOOLValue") & 1) == 0)
            {
              uint64_t v144 = DMFInvalidParameterErrorKey;
              v145 = @"key";
              uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v145,  &v144,  1LL));
              uint64_t v29 = DMFErrorWithCodeAndUserInfo(1LL, v28);
              id v30 = (id)objc_claimAutoreleasedReturnValue(v29);

              if (v30) {
                goto LABEL_76;
              }
              goto LABEL_17;
            }

            id v26 = (void *)objc_claimAutoreleasedReturnValue([obj objectForKey:v21]);
            id v27 = (NSMutableDictionary *)[v26 MCMutableDeepCopy];

            if (!v27) {
              id v27 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
            }
            -[NSMutableDictionary setObject:forKey:](v27, "setObject:forKey:", v25, v19);
            [v98 setObject:v27 forKey:v21];
          }
        }
      }

      id v17 = [obj countByEnumeratingWithState:&v121 objects:v146 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }

LABEL_17:
  __int128 v119 = 0u;
  __int128 v120 = 0u;
  __int128 v117 = 0u;
  __int128 v118 = 0u;
  id v31 = v84;
  id v32 = [v31 countByEnumeratingWithState:&v117 objects:v143 count:16];
  if (v32)
  {
    id v33 = v32;
    uint64_t v34 = *(void *)v118;
    uint64_t v35 = MCRestrictedValueValueKey;
    while (2)
    {
      for (j = 0LL; j != v33; j = (char *)j + 1)
      {
        if (*(void *)v118 != v34) {
          objc_enumerationMutation(v31);
        }
        uint64_t v37 = *(void *)(*((void *)&v117 + 1) + 8LL * (void)j);
        id v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "objectForKey:", v37, v79));
        if (v38)
        {
          uint64_t v39 = objc_opt_class(&OBJC_CLASS___NSNumber);
          if ((objc_opt_isKindOfClass(v38, v39) & 1) == 0)
          {
            uint64_t v141 = DMFInvalidParameterErrorKey;
            v142 = @"key";
            v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v142,  &v141,  1LL));
            uint64_t v43 = DMFErrorWithCodeAndUserInfo(1LL, v42);
            id v30 = (id)objc_claimAutoreleasedReturnValue(v43);

            if (v30) {
              goto LABEL_76;
            }
            goto LABEL_31;
          }

          v40 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKey:v37]);
          v41 = (NSMutableDictionary *)[v40 MCMutableDeepCopy];

          if (!v41) {
            v41 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          }
          -[NSMutableDictionary setObject:forKey:](v41, "setObject:forKey:", v38, v35);
          [v97 setObject:v41 forKey:v37];
        }
      }

      id v33 = [v31 countByEnumeratingWithState:&v117 objects:v143 count:16];
      if (v33) {
        continue;
      }
      break;
    }
  }

LABEL_31:
  __int128 v115 = 0u;
  __int128 v116 = 0u;
  __int128 v113 = 0u;
  __int128 v114 = 0u;
  id v92 = v83;
  id v95 = [v92 countByEnumeratingWithState:&v113 objects:v140 count:16];
  if (v95)
  {
    uint64_t v93 = *(void *)v114;
    uint64_t v85 = DMFInvalidParameterErrorKey;
    uint64_t v87 = MCIntersectionValuesKey;
    while (2)
    {
      for (k = 0LL; k != v95; k = (char *)k + 1)
      {
        if (*(void *)v114 != v93) {
          objc_enumerationMutation(v92);
        }
        uint64_t v45 = *(void *)(*((void *)&v113 + 1) + 8LL * (void)k);
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "objectForKeyedSubscript:", v45, v79));
        if (v46)
        {
          uint64_t v47 = objc_opt_class(&OBJC_CLASS___NSArray);
          if ((objc_opt_isKindOfClass(v46, v47) & 1) == 0)
          {
            uint64_t v133 = v85;
            v134 = @"key";
            v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v134,  &v133,  1LL));
            uint64_t v60 = DMFErrorWithCodeAndUserInfo(1LL, v59);
            id v30 = (id)objc_claimAutoreleasedReturnValue(v60);

            if (v30) {
              goto LABEL_76;
            }
            goto LABEL_53;
          }

          __int128 v111 = 0u;
          __int128 v112 = 0u;
          __int128 v109 = 0u;
          __int128 v110 = 0u;
          id v48 = v46;
          id v49 = [v48 countByEnumeratingWithState:&v109 objects:v139 count:16];
          if (v49)
          {
            id v50 = v49;
            uint64_t v51 = *(void *)v110;
            while (2)
            {
              for (m = 0LL; m != v50; m = (char *)m + 1)
              {
                if (*(void *)v110 != v51) {
                  objc_enumerationMutation(v48);
                }
                uint64_t v53 = *(void *)(*((void *)&v109 + 1) + 8LL * (void)m);
                uint64_t v54 = objc_opt_class(&OBJC_CLASS___NSString);
                if ((objc_opt_isKindOfClass(v53, v54) & 1) == 0)
                {
                  uint64_t v137 = v85;
                  v138 = @"key";
                  v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v138,  &v137,  1LL));
                  uint64_t v56 = DMFErrorWithCodeAndUserInfo(1LL, v55);
                  id v30 = (id)objc_claimAutoreleasedReturnValue(v56);

                  if (v30)
                  {
LABEL_74:

                    goto LABEL_76;
                  }

                  goto LABEL_48;
                }
              }

              id v50 = [v48 countByEnumeratingWithState:&v109 objects:v139 count:16];
              if (v50) {
                continue;
              }
              break;
            }
          }

LABEL_48:
          v57 = (void *)objc_claimAutoreleasedReturnValue( -[DMDInstallConfigurationOperation _intersectionFeatureForPayloadRestrictionKey:]( self,  "_intersectionFeatureForPayloadRestrictionKey:",  v45));
          uint64_t v135 = v87;
          id v136 = v48;
          v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v136,  &v135,  1LL));
          [v91 setObject:v58 forKeyedSubscript:v57];
        }
      }

      id v95 = [v92 countByEnumeratingWithState:&v113 objects:v140 count:16];
      if (v95) {
        continue;
      }
      break;
    }
  }

LABEL_53:
  __int128 v107 = 0u;
  __int128 v108 = 0u;
  __int128 v105 = 0u;
  __int128 v106 = 0u;
  id v92 = v82;
  id v96 = [v92 countByEnumeratingWithState:&v105 objects:v132 count:16];
  if (!v96)
  {
LABEL_73:

LABEL_81:
    v77 = v81;
    id v76 = v81;
    id v30 = 0LL;
    goto LABEL_80;
  }

  uint64_t v94 = *(void *)v106;
  uint64_t v88 = DMFInvalidParameterErrorKey;
  uint64_t v90 = MCUnionValuesKey;
LABEL_55:
  uint64_t v61 = 0LL;
  while (1)
  {
    if (*(void *)v106 != v94) {
      objc_enumerationMutation(v92);
    }
    uint64_t v62 = *(void *)(*((void *)&v105 + 1) + 8 * v61);
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "objectForKeyedSubscript:", v62, v79));
    if (v63) {
      break;
    }
LABEL_71:

    if ((id)++v61 == v96)
    {
      id v96 = [v92 countByEnumeratingWithState:&v105 objects:v132 count:16];
      if (v96) {
        goto LABEL_55;
      }
      goto LABEL_73;
    }
  }

  uint64_t v64 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v63, v64) & 1) != 0)
  {
    __int128 v103 = 0u;
    __int128 v104 = 0u;
    __int128 v101 = 0u;
    __int128 v102 = 0u;
    id v48 = v63;
    id v65 = [v48 countByEnumeratingWithState:&v101 objects:v131 count:16];
    if (v65)
    {
      id v66 = v65;
      uint64_t v67 = *(void *)v102;
LABEL_62:
      uint64_t v68 = 0LL;
      while (1)
      {
        if (*(void *)v102 != v67) {
          objc_enumerationMutation(v48);
        }
        uint64_t v69 = *(void *)(*((void *)&v101 + 1) + 8 * v68);
        uint64_t v70 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v69, v70) & 1) == 0) {
          break;
        }
        if (v66 == (id)++v68)
        {
          id v66 = [v48 countByEnumeratingWithState:&v101 objects:v131 count:16];
          if (v66) {
            goto LABEL_62;
          }
          goto LABEL_68;
        }
      }

      uint64_t v129 = v88;
      v130 = @"key";
      v71 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v130,  &v129,  1LL));
      uint64_t v72 = DMFErrorWithCodeAndUserInfo(1LL, v71);
      id v30 = (id)objc_claimAutoreleasedReturnValue(v72);

      if (v30) {
        goto LABEL_74;
      }
    }

    else
    {
LABEL_68:
    }

    uint64_t v127 = v90;
    id v128 = v48;
    v73 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v128,  &v127,  1LL));
    [v86 setObject:v73 forKeyedSubscript:v62];

    goto LABEL_71;
  }

  uint64_t v125 = v88;
  v126 = @"key";
  v74 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v126,  &v125,  1LL));
  uint64_t v75 = DMFErrorWithCodeAndUserInfo(1LL, v74);
  id v30 = (id)objc_claimAutoreleasedReturnValue(v75);

  if (!v30) {
    goto LABEL_81;
  }
LABEL_76:
  if (v79)
  {
    id v30 = v30;
    id v76 = 0LL;
    id *v79 = v30;
  }

  else
  {
    id v76 = 0LL;
  }

  v77 = v81;
LABEL_80:

  return v76;
}

- (id)_applyHeuristicsToRestrictions:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
  id v13 = 0LL;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManager restrictionsAfterApplyingRestrictionsDictionary:toRestrictionsDictionary:outChangeDetected:outError:]( &OBJC_CLASS___MCRestrictionManager,  "restrictionsAfterApplyingRestrictionsDictionary:toRestrictionsDictionary:outChangeDetected:outError:",  v5,  v6,  0LL,  &v13));

  id v8 = v13;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[MCHacks sharedHacks](&OBJC_CLASS___MCHacks, "sharedHacks"));
  uint64_t v10 = (void *)objc_opt_new(&OBJC_CLASS___MCProfile);
  [v9 _applyHeuristicsToRestrictions:v7 forProfile:v10 ignoresUnrestrictableApps:0];

  if (v8)
  {
    id v11 = 0LL;
    if (a4) {
      *a4 = v8;
    }
  }

  else
  {
    id v11 = [v7 copy];
  }

  return v11;
}

+ (id)_intersectionAliasToFeatures
{
  if (qword_1000CCD08 != -1) {
    dispatch_once(&qword_1000CCD08, &stru_10009EC48);
  }
  return (id)qword_1000CCD00;
}

- (id)_intersectionFeatureForPayloadRestrictionKey:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class(self) _intersectionAliasToFeatures];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v4]);
  id v8 = v7;
  if (!v7) {
    uint64_t v7 = v4;
  }
  id v9 = v7;

  return v9;
}

@end