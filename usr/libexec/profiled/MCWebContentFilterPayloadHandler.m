@interface MCWebContentFilterPayloadHandler
+ (id)internalError;
+ (id)internalErrorWithUnderlyingError:(id)a3;
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (id)_copyCertificateWithPayloadUUID:(id)a3 intoKeychainAccessGroup:(id)a4 personaID:(id)a5;
- (void)_installDependency;
- (void)_removeDependency;
- (void)remove;
- (void)setAside;
- (void)unsetAside;
@end

@implementation MCWebContentFilterPayloadHandler

- (void)_installDependency
{
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](&OBJC_CLASS___MCDependencyManager, "sharedManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 UUID]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 profile]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  [v8 addDependent:v4 ofParent:v7 inDomain:kMCDMProfileWithWebContentFilterToPayloadUUIDDependencyKey];
}

- (void)_removeDependency
{
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](&OBJC_CLASS___MCDependencyManager, "sharedManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 UUID]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 profile]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  [v8 removeDependent:v4 fromParent:v7 inDomain:kMCDMProfileWithWebContentFilterToPayloadUUIDDependencyKey];
}

+ (id)internalError
{
  return [a1 internalErrorWithUnderlyingError:0];
}

+ (id)internalErrorWithUnderlyingError:(id)a3
{
  uint64_t v3 = MCWebContentFilterErrorDomain;
  id v4 = a3;
  uint64_t v5 = MCErrorArray(@"ERROR_CONTENT_FILTER_INTERNAL_ERROR");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:",  v3,  40000LL,  v6,  v4,  MCErrorTypeFatal,  0LL));

  return v7;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v90 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 contentFilterUUID]);
  if (v10)
  {
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[MDMCloudConfiguration sharedConfiguration]( &OBJC_CLASS___MDMCloudConfiguration,  "sharedConfiguration"));
    unsigned __int8 v12 = [v11 isSupervised];

    if ((v12 & 1) == 0)
    {
      if (a6)
      {
        uint64_t v32 = MCWebContentFilterErrorDomain;
        uint64_t v33 = MCErrorArray(@"ERROR_CONTENT_FILTER_UNSUPERVISED");
        v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
        *a6 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v32,  40003LL,  v34,  MCErrorTypeFatal,  0LL));
      }

      goto LABEL_65;
    }
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue([v9 filterType]);
  unsigned int v14 = [v13 isEqualToString:kMCWebContentFilterTypePlugin];

  if (!v14)
  {
    -[MCWebContentFilterPayloadHandler _installDependency](self, "_installDependency");
LABEL_12:
    BOOL v30 = 1;
    goto LABEL_66;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MCWebContentFilterPayload typeStrings](&OBJC_CLASS___MCWebContentFilterPayload, "typeStrings"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 firstObject]);
  uint64_t v17 = MCNEProfileIngestionHandlerClassForPayload(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  if (([v18 lockConfigurations] & 1) == 0)
  {
    v31 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "Could not get NetworkExtension store lock.",  buf,  2u);
    }

    if (a6) {
      *a6 = (id)objc_claimAutoreleasedReturnValue( +[MCWebContentFilterPayloadHandler internalError]( &OBJC_CLASS___MCWebContentFilterPayloadHandler,  "internalError"));
    }

    goto LABEL_65;
  }

  [v18 loadConfigurationsForceReloadFromDisk];
  v19 = (void *)objc_claimAutoreleasedReturnValue([v9 pluginConfiguration]);
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[MCVPNPayloadBase NEVPNPayloadBaseDelegateWithConfigurationDict:]( &OBJC_CLASS___MCVPNPayloadBase,  "NEVPNPayloadBaseDelegateWithConfigurationDict:",  v19));

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[MCWebContentFilterPayload typeStrings](&OBJC_CLASS___MCWebContentFilterPayload, "typeStrings"));
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 firstObject]);
  [v18 createConfigurationFromPayload:v20 payloadType:v22];

  v23 = (void *)objc_claimAutoreleasedReturnValue([v18 ingestedConfiguration]);
  v24 = v23;
  if (!v23)
  {
    id v35 = (id)objc_claimAutoreleasedReturnValue( +[MCWebContentFilterPayloadHandler internalError]( &OBJC_CLASS___MCWebContentFilterPayloadHandler,  "internalError"));
    goto LABEL_54;
  }

  v93 = (void *)objc_claimAutoreleasedReturnValue([v23 getPendingCertificateInfo:v20]);
  if (v93)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kMCInstallProfileOptionIsInstalledByMDM]);
    unsigned int v26 = [v25 BOOLValue];

    v85 = a6;
    id v86 = v8;
    v89 = v9;
    v83 = v20;
    v84 = v18;
    v87 = v24;
    if (v26)
    {
      uint64_t v27 = kMDMPersonaKey;
      v28 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kMDMPersonaKey]);
      uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v28, v29) & 1) != 0) {
        v88 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v27]);
      }
      else {
        v88 = 0LL;
      }
    }

    else
    {
      v88 = 0LL;
    }

    v92 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v93 count]);
    __int128 v99 = 0u;
    __int128 v100 = 0u;
    __int128 v101 = 0u;
    __int128 v102 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue([v93 allKeys]);
    id v36 = [obj countByEnumeratingWithState:&v99 objects:v105 count:16];
    if (v36)
    {
      id v37 = v36;
      uint64_t v38 = *(void *)v100;
      do
      {
        for (i = 0LL; i != v37; i = (char *)i + 1)
        {
          if (*(void *)v100 != v38) {
            objc_enumerationMutation(obj);
          }
          uint64_t v40 = *(void *)(*((void *)&v99 + 1) + 8LL * (void)i);
          v41 = (void *)objc_claimAutoreleasedReturnValue([v93 objectForKeyedSubscript:v40]);
          v42 = (void *)objc_claimAutoreleasedReturnValue([v41 objectForKeyedSubscript:@"PayloadUUID"]);
          v43 = (void *)objc_claimAutoreleasedReturnValue([v41 objectForKeyedSubscript:@"AccessGroup"]);
          if (v43)
          {
            id v44 = -[MCWebContentFilterPayloadHandler _copyCertificateWithPayloadUUID:intoKeychainAccessGroup:personaID:]( self,  "_copyCertificateWithPayloadUUID:intoKeychainAccessGroup:personaID:",  v42,  v43,  0LL);
            if (!v44) {
              goto LABEL_35;
            }
            v45 = v44;
            v46 = (void *)objc_claimAutoreleasedReturnValue([v89 UUID]);
            -[MCNewPayloadHandler _retainDependencyBetweenPersistentID:andUUID:forSystem:user:personaID:]( self,  "_retainDependencyBetweenPersistentID:andUUID:forSystem:user:personaID:",  v45,  v46,  1LL,  0LL,  v88);

            -[NSMutableArray addObject:](v90, "addObject:", v45);
LABEL_34:
            -[NSMutableDictionary setObject:forKey:](v92, "setObject:forKey:", v45, v40);

            goto LABEL_35;
          }

          if (v42)
          {
            v47 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
            v45 = (void *)objc_claimAutoreleasedReturnValue([v47 persistentIDForCertificateUUID:v42]);

            if (v45) {
              goto LABEL_34;
            }
          }

- (void)setAside
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 filterType]);
  unsigned int v5 = [v4 isEqualToString:kMCWebContentFilterTypePlugin];

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MCWebContentFilterPayload typeStrings](&OBJC_CLASS___MCWebContentFilterPayload, "typeStrings"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);
    uint64_t v8 = MCNEProfileIngestionHandlerClassForPayload(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

    if ([v9 lockConfigurations])
    {
      [v9 loadConfigurationsForceReloadFromDisk];
      v10 = (void *)objc_claimAutoreleasedReturnValue([v3 persistentResourceID]);
      id v11 = [v9 setAsideConfigurationName:v10 unsetAside:0];

      [v9 unlockConfigurations];
    }

    else
    {
      unsigned __int8 v12 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Could not get NetworkExtension store lock.",  v13,  2u);
      }
    }
  }

  else
  {
    -[MCWebContentFilterPayloadHandler _removeDependency](self, "_removeDependency");
  }
}

- (void)unsetAside
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 filterType]);
  unsigned int v5 = [v4 isEqualToString:kMCWebContentFilterTypePlugin];

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MCWebContentFilterPayload typeStrings](&OBJC_CLASS___MCWebContentFilterPayload, "typeStrings"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);
    uint64_t v8 = MCNEProfileIngestionHandlerClassForPayload(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

    if ([v9 lockConfigurations])
    {
      [v9 loadConfigurationsForceReloadFromDisk];
      v10 = (void *)objc_claimAutoreleasedReturnValue([v3 persistentResourceID]);
      id v11 = [v9 setAsideConfigurationName:v10 unsetAside:1];

      [v9 unlockConfigurations];
    }

    else
    {
      unsigned __int8 v12 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Could not get NetworkExtension store lock.",  v13,  2u);
      }
    }
  }

  else
  {
    -[MCWebContentFilterPayloadHandler _installDependency](self, "_installDependency");
  }
}

- (void)remove
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 filterType]);
  unsigned int v5 = [v4 isEqualToString:kMCWebContentFilterTypePlugin];

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MCWebContentFilterPayload typeStrings](&OBJC_CLASS___MCWebContentFilterPayload, "typeStrings"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);
    uint64_t v8 = MCNEProfileIngestionHandlerClassForPayload(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

    if ([v9 lockConfigurations])
    {
      [v9 loadConfigurationsForceReloadFromDisk];
      v10 = (void *)objc_claimAutoreleasedReturnValue([v3 persistentResourceID]);

      if (v10)
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 persistentResourceID]);
        unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v9 getCertificatesForConfigurationWithIdentifier:v11]);

        __int128 v30 = 0u;
        __int128 v31 = 0u;
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        id v13 = v12;
        id v14 = [v13 countByEnumeratingWithState:&v28 objects:v34 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = *(void *)v29;
          do
          {
            uint64_t v17 = 0LL;
            do
            {
              if (*(void *)v29 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = *(void *)(*((void *)&v28 + 1) + 8LL * (void)v17);
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUID", (void)v28));
              -[MCNewPayloadHandler _releaseDependencyBetweenPersistentID:andUUID:]( self,  "_releaseDependencyBetweenPersistentID:andUUID:",  v18,  v19);

              uint64_t v17 = (char *)v17 + 1;
            }

            while (v15 != v17);
            id v15 = [v13 countByEnumeratingWithState:&v28 objects:v34 count:16];
          }

          while (v15);
        }

        os_log_t v20 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
        {
          v21 = v20;
          v22 = (void *)objc_claimAutoreleasedReturnValue([v3 persistentResourceID]);
          *(_DWORD *)buf = 138543362;
          uint64_t v33 = v22;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "Calling removeConfigurationWithIdentifier for id: %{public}@",  buf,  0xCu);
        }

        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "persistentResourceID", (void)v28));
        [v9 removeConfigurationWithIdentifier:v23];
      }

      else
      {
        uint64_t v27 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "MCWebContentFilterPayloadHandler remove failed: empty configuration id",  buf,  2u);
        }
      }

      [v9 updateDefaultAfterDeletingConfiguration];
      [v9 unlockConfigurations];
    }

    else
    {
      unsigned int v26 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "Could not get NetworkExtension store lock. Skipping removal.",  buf,  2u);
      }
    }
  }

  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
    int v25 = [v24 isSetAside];

    if ((v25 & 1) == 0) {
      -[MCWebContentFilterPayloadHandler _removeDependency](self, "_removeDependency");
    }
  }
}

- (id)_copyCertificateWithPayloadUUID:(id)a3 intoKeychainAccessGroup:(id)a4 personaID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 payloadHandlerWithUUID:v8]);

  if (v12)
  {
    id v28 = 0LL;
    id v13 = [v12 copyIdentityImmediatelyWithInteractionClient:0 outError:&v28];
    id v14 = v28;
    if (!v14 && v13) {
      goto LABEL_7;
    }
    id v15 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v30 = v8;
      __int16 v31 = 2114;
      id v32 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "ContentFilter: Failed to get the identity for UUID %{public}@: %{public}@",  buf,  0x16u);
    }

    if (v13)
    {
LABEL_7:
      id v26 = v14;
      id v27 = v10;
      id v16 = v9;
      id v17 = [v12 accessibility];
      uint64_t v18 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "Web content filter identity, storing with accessibility %@",  buf,  0xCu);
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue([@"NE:" stringByAppendingString:v8]);
      os_log_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
      v21 = (void *)objc_claimAutoreleasedReturnValue([v20 profile]);
      id v9 = v16;
      v22 = (void *)objc_claimAutoreleasedReturnValue( +[MCKeychain saveItem:withLabel:group:useSystemKeychain:accessibility:]( MCKeychain,  "saveItem:withLabel:group:useSystemKeychain:accessibility:",  v13,  v19,  v16,  [v21 isInstalledForSystem],  v17));

      id v10 = v27;
      if (v22)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
        v24 = (void *)objc_claimAutoreleasedReturnValue([v23 UUID]);
        -[MCNewPayloadHandler _touchDependencyBetweenPersistentID:andUUID:personaID:]( self,  "_touchDependencyBetweenPersistentID:andUUID:personaID:",  v22,  v24,  v27);
      }

      CFRelease(v13);
      id v14 = v26;
    }

    else
    {
      v22 = 0LL;
    }
  }

  else
  {
    v22 = 0LL;
  }

  return v22;
}

@end