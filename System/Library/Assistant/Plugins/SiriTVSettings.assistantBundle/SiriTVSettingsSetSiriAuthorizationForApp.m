@interface SiriTVSettingsSetSiriAuthorizationForApp
- (BOOL)_accessForAppID:(id)a3;
- (BOOL)_setAccess:(BOOL)a3 appID:(id)a4;
- (id)_commandFailedPermissionSetFailed;
- (id)_commandFailedValueUnchanged;
- (id)_getBundleProxyForIdentifier:(id)a3;
- (id)_successResponseForValue:(BOOL)a3 previousValue:(BOOL)a4;
- (id)_tccAccessForAppBundleUrl:(id)a3;
- (void)performWithCompletion:(id)a3;
@end

@implementation SiriTVSettingsSetSiriAuthorizationForApp

- (void)performWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SiriTVSettingsSetSiriAuthorizationForApp bundleId](self, "bundleId"));
  BOOL v6 = -[SiriTVSettingsSetSiriAuthorizationForApp _accessForAppID:](self, "_accessForAppID:", v5);

  else {
    id v7 = -[SiriTVSettingsSetSiriAuthorizationForApp value](self, "value");
  }
  unsigned int v8 = -[SiriTVSettingsSetSiriAuthorizationForApp dryRun](self, "dryRun");
  unsigned int v9 = v8;
  if (v6 == (_DWORD)v7)
  {
    uint64_t v12 = objc_claimAutoreleasedReturnValue( -[SiriTVSettingsSetSiriAuthorizationForApp _commandFailedValueUnchanged]( self,  "_commandFailedValueUnchanged"));
LABEL_9:
    v13 = (void *)v12;
    if (v12) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }

  if ((v8 & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SiriTVSettingsSetSiriAuthorizationForApp bundleId](self, "bundleId"));
    unsigned __int8 v11 = -[SiriTVSettingsSetSiriAuthorizationForApp _setAccess:appID:](self, "_setAccess:appID:", v7, v10);

    if ((v11 & 1) == 0)
    {
      uint64_t v12 = objc_claimAutoreleasedReturnValue( -[SiriTVSettingsSetSiriAuthorizationForApp _commandFailedPermissionSetFailed]( self,  "_commandFailedPermissionSetFailed"));
      goto LABEL_9;
    }
  }

- (id)_successResponseForValue:(BOOL)a3 previousValue:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = objc_alloc_init(&OBJC_CLASS___SASettingBooleanEntity);
  [v6 setValue:v5];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
  [v6 setPreviousValue:v7];

  id v8 = objc_alloc_init(&OBJC_CLASS___SASettingSetBoolResponse);
  [v8 setSetting:v6];

  return v8;
}

- (id)_commandFailedValueUnchanged
{
  id v2 = objc_alloc_init(&OBJC_CLASS___SACommandFailed);
  [v2 setErrorCode:SASettingValueUnchangedErrorCode];
  objc_msgSend(v2, "setReason:", @"Value unchanged, No change was made");
  return v2;
}

- (id)_commandFailedPermissionSetFailed
{
  id v2 = objc_alloc_init(&OBJC_CLASS___SACommandFailed);
  [v2 setErrorCode:SASettingValueUnchangedErrorCode];
  [v2 setReason:@"TCC permission set failed"];
  return v2;
}

- (BOOL)_setAccess:(BOOL)a3 appID:(id)a4
{
  BOOL v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( -[SiriTVSettingsSetSiriAuthorizationForApp _getBundleProxyForIdentifier:]( self,  "_getBundleProxyForIdentifier:",  a4));
  CFBundleRef v6 = CFBundleCreate(0, (CFURLRef)[v5 bundleURL]);
  if (v6)
  {
    CFBundleRef v7 = v6;
    BOOL v8 = TCCAccessSetForBundle(kTCCServiceSiri, v6, v4) != 0;
    CFRelease(v7);
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_accessForAppID:(id)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( -[SiriTVSettingsSetSiriAuthorizationForApp _getBundleProxyForIdentifier:]( self,  "_getBundleProxyForIdentifier:",  a3));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleType]);
  if ([v5 isEqualToString:LSSystemApplicationType])
  {

LABEL_4:
    unsigned __int8 v8 = 1;
    goto LABEL_19;
  }

  CFBundleRef v6 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleType]);
  unsigned __int8 v7 = [v6 isEqualToString:LSInternalApplicationType];

  if ((v7 & 1) != 0) {
    goto LABEL_4;
  }
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleURL]);
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( -[SiriTVSettingsSetSiriAuthorizationForApp _tccAccessForAppBundleUrl:]( self,  "_tccAccessForAppBundleUrl:",  v9));
    if (v10)
    {
      v23 = v9;
      unsigned __int8 v11 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v10 count]);
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      v22 = v10;
      id v12 = v10;
      id v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v25;
        do
        {
          for (i = 0LL; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v25 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", kTCCInfoService, v22));
            v19 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:kTCCInfoGranted]);
            -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v19, v18);
          }

          id v14 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }

        while (v14);
      }

      v10 = v22;
      unsigned int v9 = v23;
    }

    else
    {
      unsigned __int8 v11 = 0LL;
    }
  }

  else
  {
    unsigned __int8 v11 = 0LL;
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", kTCCServiceSiri, v22));
  unsigned __int8 v8 = [v20 BOOLValue];

LABEL_19:
  return v8;
}

- (id)_tccAccessForAppBundleUrl:(id)a3
{
  CFBundleRef v3 = CFBundleCreate(0LL, (CFURLRef)a3);
  if (v3)
  {
    CFBundleRef v4 = v3;
    BOOL v5 = (void *)TCCAccessCopyInformationForBundle();
    CFRelease(v4);
  }

  else
  {
    BOOL v5 = 0LL;
  }

  return v5;
}

- (id)_getBundleProxyForIdentifier:(id)a3
{
  return +[LSBundleProxy bundleProxyForIdentifier:](&OBJC_CLASS___LSBundleProxy, "bundleProxyForIdentifier:", a3);
}

@end