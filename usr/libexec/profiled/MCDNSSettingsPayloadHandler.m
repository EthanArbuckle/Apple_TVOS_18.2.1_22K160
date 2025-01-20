@interface MCDNSSettingsPayloadHandler
+ (id)internalError;
+ (id)internalErrorWithUnderlyingError:(id)a3;
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (MCDNSSettingsPayloadHandler)initWithPayload:(id)a3 profileHandler:(id)a4;
- (id)_copyCertificateWithPayloadUUID:(id)a3 intoKeychainAccessGroup:(id)a4;
- (void)remove;
- (void)setAside;
- (void)unsetAside;
@end

@implementation MCDNSSettingsPayloadHandler

- (MCDNSSettingsPayloadHandler)initWithPayload:(id)a3 profileHandler:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MCDNSSettingsPayloadHandler;
  v7 = -[MCNewPayloadHandler initWithPayload:profileHandler:](&v11, "initWithPayload:profileHandler:", a3, v6);
  if (v7)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 profile]);
    profile = v7->_profile;
    v7->_profile = (MCProfile *)v8;
  }

  return v7;
}

+ (id)internalError
{
  return [a1 internalErrorWithUnderlyingError:0];
}

+ (id)internalErrorWithUnderlyingError:(id)a3
{
  uint64_t v3 = MCDNSSettingsErrorDomain;
  id v4 = a3;
  uint64_t v5 = MCErrorArray(@"ERROR_DNS_SETTINGS_INTERNAL_ERROR");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:",  v3,  57000LL,  v6,  v4,  MCErrorTypeFatal,  0LL));

  return v7;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v9 = a4;
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v75 type]);
  v71 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v11 = MCNEProfileIngestionHandlerClassForPayload(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  if (!v12)
  {
    v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v62 handleFailureInMethod:a2, self, @"MCDNSSettingsPayloadHandler.m", 65, @"Invalid parameter not satisfying: %@", @"neProfileIngestionHandler" object file lineNumber description];
  }

  if ([v12 lockConfigurations])
  {
    [v12 loadConfigurationsForceReloadFromDisk];
    v13 = (void *)objc_claimAutoreleasedReturnValue([v75 configurationDictionary]);
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[MCVPNPayloadBase NEVPNPayloadBaseDelegateWithConfigurationDict:]( &OBJC_CLASS___MCVPNPayloadBase,  "NEVPNPayloadBaseDelegateWithConfigurationDict:",  v13));

    if (!v14)
    {
      v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      [v63 handleFailureInMethod:a2, self, @"MCDNSSettingsPayloadHandler.m", 74, @"Invalid parameter not satisfying: %@", @"payloadBase" object file lineNumber description];
    }

    [v12 createConfigurationFromPayload:v14 payloadType:v10];
    v15 = (void *)objc_claimAutoreleasedReturnValue([v12 ingestedConfiguration]);
    v16 = v15;
    if (!v15)
    {
      if (a6)
      {
        id v43 = [(id)objc_opt_class(self) internalError];
        *a6 = (id)objc_claimAutoreleasedReturnValue(v43);
      }

      [v12 unlockConfigurations];
      unsigned __int8 v40 = 0;
      goto LABEL_61;
    }

    v65 = a6;
    v17 = (void *)objc_claimAutoreleasedReturnValue([v15 getPendingCertificateInfo:v14]);
    v74 = v17;
    if (v17)
    {
      v18 = v17;
      v69 = v12;
      v70 = v16;
      v66 = v10;
      v68 = v14;
      id v64 = v9;
      v73 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v17 count]);
      __int128 v85 = 0u;
      __int128 v86 = 0u;
      __int128 v87 = 0u;
      __int128 v88 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue([v18 allKeys]);
      id v19 = [obj countByEnumeratingWithState:&v85 objects:v91 count:16];
      if (v19)
      {
        id v20 = v19;
        uint64_t v21 = *(void *)v86;
        do
        {
          for (i = 0LL; i != v20; i = (char *)i + 1)
          {
            if (*(void *)v86 != v21) {
              objc_enumerationMutation(obj);
            }
            uint64_t v23 = *(void *)(*((void *)&v85 + 1) + 8LL * (void)i);
            v24 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:v23]);
            v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:@"PayloadUUID"]);
            v26 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:@"AccessGroup"]);
            if (v26)
            {
              id v27 = -[MCDNSSettingsPayloadHandler _copyCertificateWithPayloadUUID:intoKeychainAccessGroup:]( self,  "_copyCertificateWithPayloadUUID:intoKeychainAccessGroup:",  v25,  v26);
              if (!v27) {
                goto LABEL_19;
              }
              v28 = v27;
              v29 = (void *)objc_claimAutoreleasedReturnValue([v75 UUID]);
              -[MCNewPayloadHandler _retainDependencyBetweenPersistentID:andUUID:]( self,  "_retainDependencyBetweenPersistentID:andUUID:",  v28,  v29);

              v18 = v74;
              -[NSMutableArray addObject:](v71, "addObject:", v28);
LABEL_18:
              -[NSMutableDictionary setObject:forKey:](v73, "setObject:forKey:", v28, v23);

              goto LABEL_19;
            }

            if (v25)
            {
              v30 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
              v28 = (void *)objc_claimAutoreleasedReturnValue([v30 persistentIDForCertificateUUID:v25]);

              v18 = v74;
              if (v28) {
                goto LABEL_18;
              }
            }

- (void)setAside
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 type]);
  uint64_t v5 = MCNEProfileIngestionHandlerClassForPayload(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if ([v6 lockConfigurations])
  {
    [v6 loadConfigurationsForceReloadFromDisk];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 persistentResourceID]);
    id v9 = [v6 setAsideConfigurationName:v8 unsetAside:0];

    [v6 unlockConfigurations];
  }

  else
  {
    v10 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Could not get NetworkExtension store lock.",  v11,  2u);
    }
  }
}

- (void)unsetAside
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 type]);
  uint64_t v5 = MCNEProfileIngestionHandlerClassForPayload(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if ([v6 lockConfigurations])
  {
    [v6 loadConfigurationsForceReloadFromDisk];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 persistentResourceID]);
    id v9 = [v6 setAsideConfigurationName:v8 unsetAside:0];

    [v6 unlockConfigurations];
  }

  else
  {
    v10 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Could not get NetworkExtension store lock.",  v11,  2u);
    }
  }
}

- (void)remove
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 persistentResourceID]);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 type]);
  uint64_t v7 = MCNEProfileIngestionHandlerClassForPayload(v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if ([v8 lockConfigurations])
  {
    [v8 loadConfigurationsForceReloadFromDisk];
    if (v4)
    {
      [v8 removeConfigurationWithIdentifier:v4];
    }

    else
    {
      v10 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "NetworkUsageRules remove failed: empty configuration id",  buf,  2u);
      }
    }

    [v8 updateDefaultAfterDeletingConfiguration];
    [v8 unlockConfigurations];
  }

  else
  {
    id v9 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Could not get NetworkExtension store lock. Skipping removal.",  v11,  2u);
    }
  }
}

- (id)_copyCertificateWithPayloadUUID:(id)a3 intoKeychainAccessGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 payloadHandlerWithUUID:v6]);

  if (v9)
  {
    id v23 = 0LL;
    id v10 = [v9 copyIdentityImmediatelyWithInteractionClient:0 outError:&v23];
    id v11 = v23;
    if (!v11 && v10) {
      goto LABEL_7;
    }
    v12 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v25 = v6;
      __int16 v26 = 2114;
      id v27 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "DNSSettings: Failed to get the identity for UUID %{public}@: %{public}@",  buf,  0x16u);
    }

    if (v10)
    {
LABEL_7:
      id v13 = objc_msgSend(v9, "accessibility", v7);
      v14 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "DNS Settings identity, storing with accessibility %@",  buf,  0xCu);
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue([@"NE:" stringByAppendingString:v6]);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
      v17 = (void *)objc_claimAutoreleasedReturnValue([v16 profile]);
      id v7 = v22;
      v18 = (void *)objc_claimAutoreleasedReturnValue( +[MCKeychain saveItem:withLabel:group:useSystemKeychain:accessibility:]( MCKeychain,  "saveItem:withLabel:group:useSystemKeychain:accessibility:",  v10,  v15,  v22,  [v17 isInstalledForSystem],  v13));

      if (v18)
      {
        id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 UUID]);
        -[MCNewPayloadHandler _touchDependencyBetweenPersistentID:andUUID:]( self,  "_touchDependencyBetweenPersistentID:andUUID:",  v18,  v20);

        id v7 = v22;
      }

      CFRelease(v10);
    }

    else
    {
      v18 = 0LL;
    }
  }

  else
  {
    v18 = 0LL;
  }

  return v18;
}

- (void).cxx_destruct
{
}

@end