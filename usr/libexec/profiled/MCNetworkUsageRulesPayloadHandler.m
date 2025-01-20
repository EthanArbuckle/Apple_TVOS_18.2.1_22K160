@interface MCNetworkUsageRulesPayloadHandler
+ (BOOL)_rebuildWiFiAssistConfigurationIncludingPayloads:(id)a3 excludingPayloads:(id)a4 error:(id *)a5;
+ (BOOL)_writeWiFiAssistConfiguration:(id)a3 withError:(id *)a4;
+ (id)_WiFiAssistConfigurationForPayloads:(id)a3 includingPayloads:(id)a4 excludingPayloads:(id)a5 error:(id *)a6;
+ (id)internalErrorWithCode:(int)a3;
+ (id)internalErrorWithCode:(int)a3 underlyingError:(id)a4;
- (BOOL)_installApplicationRulesFromPayload:(id)a3 outError:(id *)a4;
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (void)remove;
- (void)setAside;
- (void)unsetAside;
@end

@implementation MCNetworkUsageRulesPayloadHandler

+ (id)internalErrorWithCode:(int)a3
{
  return [a1 internalErrorWithCode:*(void *)&a3 underlyingError:0];
}

+ (id)internalErrorWithCode:(int)a3 underlyingError:(id)a4
{
  uint64_t v4 = MCNetworkUsageRulesErrorDomain;
  uint64_t v5 = a3;
  id v6 = a4;
  uint64_t v7 = MCErrorArray(@"ERROR_NETWORK_USAGE_INTERNAL_ERROR");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:",  v4,  v5,  v8,  v6,  MCErrorTypeFatal,  0LL));

  return v9;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload", a3, a4, a5));
  id v9 = (id)objc_claimAutoreleasedReturnValue([v8 applicationRules]);

  if (!v9
    || (id v29 = 0LL,
        v10 = -[MCNetworkUsageRulesPayloadHandler _installApplicationRulesFromPayload:outError:]( self,  "_installApplicationRulesFromPayload:outError:",  v8,  &v29),  id v9 = v29,  v10))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v8 SIMRules]);

    if (v11)
    {
      v23 = a6;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      id v13 = +[MCProfileHandler payloadsOfClass:installedBeforePayload:]( &OBJC_CLASS___MCProfileHandler,  "payloadsOfClass:installedBeforePayload:",  objc_opt_class(&OBJC_CLASS___MCNetworkUsageRulesPayload),  v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      id v15 = [v14 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v26;
        do
        {
          for (i = 0LL; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v26 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
            v20 = (void *)objc_claimAutoreleasedReturnValue([v19 SIMRules]);

            if (v20) {
              [v12 addObject:v19];
            }
          }

          id v16 = [v14 countByEnumeratingWithState:&v25 objects:v30 count:16];
        }

        while (v16);
      }

      [v12 addObject:v8];
      id v24 = v9;
      [(id)objc_opt_class(self) _rebuildWiFiAssistConfigurationIncludingPayloads:v12 excludingPayloads:qword_1000DC040 error:&v24];
      id v21 = v24;

      id v9 = v21;
      a6 = v23;
    }
  }

  if (a6 && v9) {
    *a6 = v9;
  }

  return v9 == 0LL;
}

- (void)setAside
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 applicationRules]);

  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCNetworkUsageRulesPayload typeStrings](&OBJC_CLASS___MCNetworkUsageRulesPayload, "typeStrings"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
    uint64_t v7 = MCNEProfileIngestionHandlerClassForPayload();
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    if ([v8 lockConfigurations])
    {
      [v8 loadConfigurationsForceReloadFromDisk];
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 persistentResourceID]);
      id v10 = [v8 setAsideConfigurationName:v9 unsetAside:0];

      [v8 unlockConfigurations];
    }

    else
    {
      v11 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Could not get NetworkExtension store lock.",  buf,  2u);
      }
    }
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue([v3 SIMRules]);

  if (v12)
  {
    id v13 = (void *)qword_1000DC040;
    if (!qword_1000DC040)
    {
      uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      id v15 = (void *)qword_1000DC040;
      qword_1000DC040 = v14;

      id v13 = (void *)qword_1000DC040;
    }

    [v13 addObject:v3];
    id v21 = 0LL;
    unsigned __int8 v16 = [(id)objc_opt_class(self) _rebuildWiFiAssistConfigurationIncludingPayloads:0 excludingPayloads:qword_1000DC040 error:&v21];
    id v17 = v21;
    if ((v16 & 1) == 0)
    {
      v18 = _MCLogObjects[0];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue([v3 displayName]);
        v20 = v19;
        if (!v19) {
          v20 = (void *)objc_claimAutoreleasedReturnValue([v3 UUID]);
        }
        *(_DWORD *)buf = 138543618;
        v23 = v20;
        __int16 v24 = 2114;
        id v25 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Failed to rebuild Wi-Fi Assist configuration excluding payload %{public}@: %{public}@",  buf,  0x16u);
        if (!v19) {
      }
        }
    }
  }
}

- (void)unsetAside
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 applicationRules]);

  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCNetworkUsageRulesPayload typeStrings](&OBJC_CLASS___MCNetworkUsageRulesPayload, "typeStrings"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
    uint64_t v7 = MCNEProfileIngestionHandlerClassForPayload();
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    if ([v8 lockConfigurations])
    {
      [v8 loadConfigurationsForceReloadFromDisk];
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 persistentResourceID]);
      id v10 = [v8 setAsideConfigurationName:v9 unsetAside:1];

      [v8 unlockConfigurations];
    }

    else
    {
      v11 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Could not get NetworkExtension store lock.",  buf,  2u);
      }
    }
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue([v3 SIMRules]);

  if (v12)
  {
    [(id)qword_1000DC040 removeObject:v3];
    id v18 = 0LL;
    unsigned __int8 v13 = [(id)objc_opt_class(self) _rebuildWiFiAssistConfigurationIncludingPayloads:0 excludingPayloads:qword_1000DC040 error:&v18];
    id v14 = v18;
    if ((v13 & 1) == 0)
    {
      id v15 = _MCLogObjects[0];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue([v3 displayName]);
        id v17 = v16;
        if (!v16) {
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v3 UUID]);
        }
        *(_DWORD *)buf = 138543618;
        v20 = v17;
        __int16 v21 = 2114;
        id v22 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Failed to rebuild Wi-Fi Assist configuration including payload %{public}@: %{public}@",  buf,  0x16u);
        if (!v16) {
      }
        }
    }
  }
}

- (void)remove
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 applicationRules]);

  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCNetworkUsageRulesPayload typeStrings](&OBJC_CLASS___MCNetworkUsageRulesPayload, "typeStrings"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
    uint64_t v7 = MCNEProfileIngestionHandlerClassForPayload();
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    if ([v8 lockConfigurations])
    {
      [v8 loadConfigurationsForceReloadFromDisk];
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 persistentResourceID]);

      if (v9)
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 persistentResourceID]);
        [v8 removeConfigurationWithIdentifier:v10];
      }

      else
      {
        v12 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "NetworkUsageRules remove failed: empty configuration id",  buf,  2u);
        }
      }

      [v8 updateDefaultAfterDeletingConfiguration];
      [v8 unlockConfigurations];
    }

    else
    {
      v11 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Could not get NetworkExtension store lock. Skipping removal.",  buf,  2u);
      }
    }
  }

  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v3 SIMRules]);

  if (v13)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
    unsigned int v15 = [v14 isSetAside];

    if (v15)
    {
      [(id)qword_1000DC040 removeObject:v3];
    }

    else
    {
      unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      id v17 = +[MCProfileHandler payloadsOfClass:removedBeforePayload:]( &OBJC_CLASS___MCProfileHandler,  "payloadsOfClass:removedBeforePayload:",  objc_opt_class(&OBJC_CLASS___MCNetworkUsageRulesPayload),  v3);
      id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      id v19 = [v18 countByEnumeratingWithState:&v31 objects:v39 count:16];
      if (v19)
      {
        id v20 = v19;
        uint64_t v21 = *(void *)v32;
        do
        {
          for (i = 0LL; i != v20; i = (char *)i + 1)
          {
            if (*(void *)v32 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
            __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 SIMRules]);

            if (v24) {
              [v16 addObject:v23];
            }
          }

          id v20 = [v18 countByEnumeratingWithState:&v31 objects:v39 count:16];
        }

        while (v20);
      }

      [v16 addObject:v3];
      id v30 = 0LL;
      unsigned __int8 v25 = [(id)objc_opt_class(self) _rebuildWiFiAssistConfigurationIncludingPayloads:0 excludingPayloads:v16 error:&v30];
      id v26 = v30;
      if ((v25 & 1) == 0)
      {
        __int128 v27 = _MCLogObjects[0];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v3 displayName]);
          id v29 = v28;
          if (!v28) {
            id v29 = (void *)objc_claimAutoreleasedReturnValue([v3 UUID]);
          }
          *(_DWORD *)buf = 138543618;
          v36 = v29;
          __int16 v37 = 2114;
          id v38 = v26;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "Failed to rebuild Wi-Fi Assist configuration excluding payload %{public}@: %{public}@",  buf,  0x16u);
          if (!v28) {
        }
          }
      }
    }
  }
}

- (BOOL)_installApplicationRulesFromPayload:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCNetworkUsageRulesPayload typeStrings](&OBJC_CLASS___MCNetworkUsageRulesPayload, "typeStrings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);
  uint64_t v9 = MCNEProfileIngestionHandlerClassForPayload();
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if ([v10 lockConfigurations])
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 displayName]);
    if (!v11) {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v6 UUID]);
    }
    [v10 loadConfigurationsForceReloadFromDisk];
    v35[0] = @"ApplicationRules";
    v12 = (void *)objc_claimAutoreleasedReturnValue([v6 applicationRules]);
    v35[1] = @"PayloadDisplayName";
    v36[0] = v12;
    v36[1] = v11;
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v36,  v35,  2LL));
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[MCVPNPayloadBase NEVPNPayloadBaseDelegateWithConfigurationDict:]( &OBJC_CLASS___MCVPNPayloadBase,  "NEVPNPayloadBaseDelegateWithConfigurationDict:",  v13));

    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(+[MCNetworkUsageRulesPayload typeStrings](&OBJC_CLASS___MCNetworkUsageRulesPayload, "typeStrings"));
    unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 firstObject]);
    [v10 createConfigurationFromPayload:v14 payloadType:v16];

    id v17 = (void *)objc_claimAutoreleasedReturnValue([v10 ingestedConfiguration]);
    if (v17)
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v6 UUID]);
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v6 organization]);
      [v17 setPayloadInfoCommon:v18 payloadOrganization:v19];

      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 profile]);

      v33[0] = kMCPayloadUUIDKey;
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 UUID]);
      v34[0] = v22;
      v33[1] = kMCPayloadIdentifierKey;
      uint64_t v23 = objc_claimAutoreleasedReturnValue([v21 identifier]);
      v34[1] = v23;
      __int16 v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v34,  v33,  2LL));

      [v17 setProfileInfo:v24];
      [v10 updateDefaultAfterAddingConfiguration];
      unsigned __int8 v25 = (void *)objc_claimAutoreleasedReturnValue([v17 getConfigurationIdentifier]);
      [v6 setPersistentResourceID:v25];

      id v31 = 0LL;
      LOBYTE(v23) = [v10 saveIngestedConfiguration:&v31];
      id v26 = v31;
      if ((v23 & 1) == 0)
      {
        uint64_t v27 = objc_claimAutoreleasedReturnValue( +[MCNetworkUsageRulesPayloadHandler internalErrorWithCode:underlyingError:]( &OBJC_CLASS___MCNetworkUsageRulesPayloadHandler,  "internalErrorWithCode:underlyingError:",  41002LL,  v26));

        id v26 = (id)v27;
      }
    }

    else
    {
      id v26 = (id)objc_claimAutoreleasedReturnValue( +[MCNetworkUsageRulesPayloadHandler internalErrorWithCode:]( &OBJC_CLASS___MCNetworkUsageRulesPayloadHandler,  "internalErrorWithCode:",  41001LL));
    }

    [v10 unlockConfigurations];
    BOOL v29 = v26 == 0LL;
    if (a4 && v26) {
      *a4 = v26;
    }
  }

  else
  {
    __int128 v28 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "Could not get NetworkExtension store lock.",  buf,  2u);
    }

    BOOL v29 = 0;
    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[MCNetworkUsageRulesPayloadHandler internalErrorWithCode:]( &OBJC_CLASS___MCNetworkUsageRulesPayloadHandler,  "internalErrorWithCode:",  41000LL));
    }
  }

  return v29;
}

+ (BOOL)_rebuildWiFiAssistConfigurationIncludingPayloads:(id)a3 excludingPayloads:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](&OBJC_CLASS___MCManifest, "sharedManifest"));
  id v11 = [v10 allInstalledPayloadsOfClass:objc_opt_class(MCNetworkUsageRulesPayload)];
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  id v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v28;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 SIMRules]);

        if (v18) {
          [v9 addObject:v17];
        }
      }

      id v14 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }

    while (v14);
  }

  id v26 = 0LL;
  id v19 = (void *)objc_claimAutoreleasedReturnValue( [a1 _WiFiAssistConfigurationForPayloads:v9 includingPayloads:v7 excludingPayloads:v8 error:&v26]);
  id v20 = v26;
  if (v20)
  {
    id v21 = v20;
    unsigned __int8 v22 = 0;
  }

  else
  {
    id v25 = 0LL;
    unsigned __int8 v22 = [a1 _writeWiFiAssistConfiguration:v19 withError:&v25];
    id v21 = v25;
  }

  if (a5 && v21) {
    *a5 = v21;
  }

  return v22;
}

+ (id)_WiFiAssistConfigurationForPayloads:(id)a3 includingPayloads:(id)a4 excludingPayloads:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 count] || objc_msgSend(v10, "count"))
  {
    v90[0] = _NSConcreteStackBlock;
    v90[1] = 3221225472LL;
    v90[2] = sub_1000202E0;
    v90[3] = &unk_1000C3550;
    id v91 = v9;
    id v92 = v10;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 indexesOfObjectsPassingTest:v90]);
    [v8 removeObjectsAtIndexes:v11];
  }

  if ([v9 count]) {
    [v8 addObjectsFromArray:v9];
  }
  id v67 = v9;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v86 = 0u;
  __int128 v87 = 0u;
  __int128 v88 = 0u;
  __int128 v89 = 0u;
  id v13 = v8;
  id v55 = v10;
  v56 = v13;
  v69 = v12;
  id v52 = [v13 countByEnumeratingWithState:&v86 objects:v103 count:16];
  if (!v52) {
    goto LABEL_39;
  }
  uint64_t v14 = *(void *)v87;
  uint64_t v60 = kMCNetworkUsageRulesPayloadSIMRulesICCIDsKey;
  uint64_t v59 = MCNetworkUsageRulesErrorDomain;
  uint64_t v58 = MCErrorTypeFatal;
  uint64_t v51 = *(void *)v87;
LABEL_8:
  uint64_t v15 = 0LL;
  unsigned __int8 v16 = v67;
  while (1)
  {
    if (*(void *)v87 != v14) {
      objc_enumerationMutation(v13);
    }
    uint64_t v53 = v15;
    id v17 = *(void **)(*((void *)&v86 + 1) + 8 * v15);
    __int128 v82 = 0u;
    __int128 v83 = 0u;
    __int128 v84 = 0u;
    __int128 v85 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue([v17 SIMRules]);
    id v63 = [obj countByEnumeratingWithState:&v82 objects:v102 count:16];
    if (v63) {
      break;
    }
LABEL_37:

    uint64_t v15 = v53 + 1;
    id v13 = v56;
    uint64_t v14 = v51;
    if ((id)(v53 + 1) == v52)
    {
      id v52 = [v56 countByEnumeratingWithState:&v86 objects:v103 count:16];
      if (!v52)
      {
LABEL_39:

        __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        __int128 v74 = 0u;
        __int128 v75 = 0u;
        __int128 v76 = 0u;
        __int128 v77 = 0u;
        id v62 = v13;
        id v66 = [v62 countByEnumeratingWithState:&v74 objects:v96 count:16];
        if (v66)
        {
          uint64_t v64 = *(void *)v75;
          uint64_t v34 = kMCNetworkUsageRulesPayloadSIMRulesICCIDsKey;
          uint64_t v35 = kMCNetworkUsageRulesPayloadSIMRulesWiFiAssistPolicyKey;
          do
          {
            uint64_t v36 = 0LL;
            do
            {
              if (*(void *)v75 != v64) {
                objc_enumerationMutation(v62);
              }
              uint64_t v68 = v36;
              __int16 v37 = *(void **)(*((void *)&v74 + 1) + 8 * v36);
              __int128 v70 = 0u;
              __int128 v71 = 0u;
              __int128 v72 = 0u;
              __int128 v73 = 0u;
              id v38 = (void *)objc_claimAutoreleasedReturnValue([v37 SIMRules]);
              id v39 = [v38 countByEnumeratingWithState:&v70 objects:v95 count:16];
              if (v39)
              {
                id v40 = v39;
                uint64_t v41 = *(void *)v71;
                do
                {
                  for (i = 0LL; i != v40; i = (char *)i + 1)
                  {
                    if (*(void *)v71 != v41) {
                      objc_enumerationMutation(v38);
                    }
                    v43 = *(void **)(*((void *)&v70 + 1) + 8LL * (void)i);
                    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
                    v45 = (void *)objc_claimAutoreleasedReturnValue([v43 objectForKeyedSubscript:v34]);
                    [v44 setObject:v45 forKeyedSubscript:@"ICCIDs"];

                    v46 = (void *)objc_claimAutoreleasedReturnValue([v43 objectForKeyedSubscript:v35]);
                    [v44 setObject:v46 forKeyedSubscript:@"Wi-Fi Assist Policy"];

                    [v33 addObject:v44];
                  }

                  id v40 = [v38 countByEnumeratingWithState:&v70 objects:v95 count:16];
                }

                while (v40);
              }

              uint64_t v36 = v68 + 1;
            }

            while ((id)(v68 + 1) != v66);
            id v66 = [v62 countByEnumeratingWithState:&v74 objects:v96 count:16];
          }

          while (v66);
        }

        v93[0] = @"Version";
        v93[1] = @"Profiles";
        v94[0] = &off_1000CBF20;
        v94[1] = v33;
        v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v94,  v93,  2LL));

        id v32 = 0LL;
        unsigned __int8 v16 = v67;
        v48 = v55;
        v49 = v56;
        goto LABEL_58;
      }

      goto LABEL_8;
    }
  }

  id v61 = *(id *)v83;
LABEL_13:
  uint64_t v18 = 0LL;
  while (1)
  {
    if (*(id *)v83 != v61) {
      objc_enumerationMutation(obj);
    }
    id v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v82 + 1) + 8 * v18) objectForKeyedSubscript:v60]);
    __int128 v78 = 0u;
    __int128 v79 = 0u;
    __int128 v80 = 0u;
    __int128 v81 = 0u;
    id v20 = v19;
    id v21 = [v20 countByEnumeratingWithState:&v78 objects:v101 count:16];
    if (v21) {
      break;
    }
LABEL_33:

LABEL_35:
    if ((id)++v18 == v63)
    {
      id v63 = [obj countByEnumeratingWithState:&v82 objects:v102 count:16];
      if (!v63) {
        goto LABEL_37;
      }
      goto LABEL_13;
    }
  }

  id v22 = v21;
  uint64_t v23 = *(void *)v79;
LABEL_18:
  uint64_t v24 = 0LL;
  while (1)
  {
    if (*(void *)v79 != v23) {
      objc_enumerationMutation(v20);
    }
    id v25 = *(void **)(*((void *)&v78 + 1) + 8 * v24);
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 uppercaseString]);
    [v12 addObject:v26];
LABEL_31:

    if (v22 == (id)++v24)
    {
      id v22 = [v20 countByEnumeratingWithState:&v78 objects:v101 count:16];
      if (v22) {
        goto LABEL_18;
      }
      goto LABEL_33;
    }
  }

  if (([v16 containsObject:v17] & 1) == 0)
  {
    __int128 v27 = _MCLogObjects[0];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v17 displayName]);
      __int128 v29 = v28;
      if (!v28)
      {
        v65 = (void *)objc_claimAutoreleasedReturnValue([v17 UUID]);
        __int128 v29 = v65;
      }

      *(_DWORD *)buf = 138543618;
      v98 = v29;
      __int16 v99 = 2114;
      v100 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "Found pre-existing conflicting ICCIDs while rebuilding configuration for Network Usage Rules payload %{public}@: %{public}@",  buf,  0x16u);
      if (!v28) {

      }
      unsigned __int8 v16 = v67;
    }

    v12 = v69;
    goto LABEL_31;
  }

  uint64_t v30 = MCErrorArray(@"ERROR_NETWORK_USAGE_ICCID_CONFLICT_P_ICCID");
  id v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  unsigned __int8 v16 = v67;
  id v32 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:",  v59,  41003LL,  v31,  0LL,  v58,  v25,  0LL));

  v12 = v69;
  if (!v32) {
    goto LABEL_35;
  }

  v49 = v56;
  if (a6)
  {
    id v32 = v32;
    v47 = 0LL;
    *a6 = v32;
  }

  else
  {
    v47 = 0LL;
  }

  v48 = v55;
LABEL_58:

  return v47;
}

+ (BOOL)_writeWiFiAssistConfiguration:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = MCSystemGroupContainerPathWithGroupIdentifier(@"systemgroup.com.apple.WiFiAssist");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = v7;
  if (!v7)
  {
    id v13 = 0LL;
    goto LABEL_17;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByAppendingFormat:@"/%@", @"Library/Preferences"]);
  char v33 = 0;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v11 = [v10 fileExistsAtPath:v9 isDirectory:&v33];

  if (v11) {
    BOOL v12 = v33 == 0;
  }
  else {
    BOOL v12 = 0;
  }
  if (v12)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v32 = 0LL;
    unsigned int v15 = [v14 removeItemAtPath:v9 error:&v32];
    id v13 = v32;

    if (v15)
    {

      id v13 = 0LL;
LABEL_11:
      unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      id v31 = v13;
      [v16 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:&v31];
      id v17 = v31;

      id v13 = v17;
      goto LABEL_12;
    }
  }

  else
  {
    id v13 = 0LL;
  }

  if ((v11 & 1) == 0) {
    goto LABEL_11;
  }
LABEL_12:
  if (!v13)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( [v9 stringByAppendingFormat:@"/%@", @"com.apple.WiFiAssist.configuration.plist"]);
    id v30 = 0LL;
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v5,  200LL,  0LL,  &v30));
    id v20 = v30;
    id v13 = v20;
    if (v19)
    {
      id v29 = v20;
      [v19 writeToFile:v18 options:1 error:&v29];
      id v21 = v29;

      id v13 = v21;
    }
  }

LABEL_17:
  if (v8) {
    BOOL v22 = v13 == 0LL;
  }
  else {
    BOOL v22 = 0;
  }
  BOOL v23 = v22;
  if (a4 && !v23)
  {
    uint64_t v24 = MCNetworkUsageRulesErrorDomain;
    id v25 = (void *)objc_claimAutoreleasedReturnValue( [@"ERROR_NETWORK_USAGE_CANNOT_WRITE_WIFI_ASSIST_CONFIGURATION" MCAppendGreenteaSuffix]);
    uint64_t v26 = MCErrorArray(v25);
    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:",  v24,  41004LL,  v27,  v13,  MCErrorTypeFatal,  0LL));
  }

  return v23;
}

@end