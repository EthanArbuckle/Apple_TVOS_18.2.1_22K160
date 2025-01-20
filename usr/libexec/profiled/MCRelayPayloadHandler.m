@interface MCRelayPayloadHandler
+ (id)internalError;
+ (id)internalErrorWithUnderlyingError:(id)a3;
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (MCRelayPayloadHandler)initWithPayload:(id)a3 profileHandler:(id)a4;
- (id)_copyCertificateWithPayloadUUID:(id)a3 intoKeychainAccessGroup:(id)a4;
- (void)remove;
- (void)setAside;
- (void)unsetAside;
@end

@implementation MCRelayPayloadHandler

- (MCRelayPayloadHandler)initWithPayload:(id)a3 profileHandler:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MCRelayPayloadHandler;
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
  uint64_t v3 = MCRelayErrorDomain;
  id v4 = a3;
  uint64_t v5 = MCErrorArray(@"ERROR_RELAY_INTERNAL_ERROR");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:",  v3,  61000LL,  v6,  v4,  MCErrorTypeFatal,  0LL));

  return v7;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v10 type]);
  v93 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v10 relayUUID]);
  if (v12)
  {

    goto LABEL_6;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MDMConfiguration sharedConfiguration](&OBJC_CLASS___MDMConfiguration, "sharedConfiguration"));
  unsigned int v14 = [v13 isUserEnrollment];

  if (!v14)
  {
LABEL_6:
    uint64_t v18 = MCNEProfileIngestionHandlerClassForPayload(v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    if (!v19)
    {
      v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      [v84 handleFailureInMethod:a2, self, @"MCRelayPayloadHandler.m", 79, @"Invalid parameter not satisfying: %@", @"neProfileIngestionHandler" object file lineNumber description];
    }

    if (([v19 lockConfigurations] & 1) == 0)
    {
      if (a6)
      {
        id v53 = [(id)objc_opt_class(self) internalError];
        id v54 = (id)objc_claimAutoreleasedReturnValue(v53);
        v55 = a6;
        LOBYTE(a6) = 0;
        id *v55 = v54;
      }

      goto LABEL_78;
    }

    [v19 loadConfigurationsForceReloadFromDisk];
    v20 = (void *)objc_claimAutoreleasedReturnValue([v10 configurationDictionary]);
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[MCVPNPayloadBase NEVPNPayloadBaseDelegateWithConfigurationDict:]( &OBJC_CLASS___MCVPNPayloadBase,  "NEVPNPayloadBaseDelegateWithConfigurationDict:",  v20));

    if (!v21)
    {
      v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      [v85 handleFailureInMethod:a2, self, @"MCRelayPayloadHandler.m", 88, @"Invalid parameter not satisfying: %@", @"payloadBase" object file lineNumber description];

      v21 = 0LL;
    }

    [v19 createConfigurationFromPayload:v21 payloadType:v11];
    v22 = (void *)objc_claimAutoreleasedReturnValue([v19 ingestedConfiguration]);
    v23 = v22;
    if (!v22)
    {
      if (a6)
      {
        id v56 = [(id)objc_opt_class(self) internalError];
        *a6 = (id)objc_claimAutoreleasedReturnValue(v56);
      }

      [v19 unlockConfigurations];
      LOBYTE(a6) = 0;
      goto LABEL_77;
    }

    v90 = v21;
    v24 = (void *)objc_claimAutoreleasedReturnValue([v22 getPendingCertificateInfo:v21]);
    v91 = v23;
    v96 = v24;
    v97 = self;
    if (v24)
    {
      v25 = v24;
      v86 = a6;
      id v87 = v9;
      v88 = v19;
      v89 = v11;
      v92 = v10;
      v95 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v24 count]);
      __int128 v108 = 0u;
      __int128 v109 = 0u;
      __int128 v110 = 0u;
      __int128 v111 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue([v25 allKeys]);
      id v26 = [obj countByEnumeratingWithState:&v108 objects:v114 count:16];
      if (v26)
      {
        id v27 = v26;
        uint64_t v28 = *(void *)v109;
        do
        {
          for (i = 0LL; i != v27; i = (char *)i + 1)
          {
            if (*(void *)v109 != v28) {
              objc_enumerationMutation(obj);
            }
            uint64_t v30 = *(void *)(*((void *)&v108 + 1) + 8LL * (void)i);
            v31 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:v30]);
            v32 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKeyedSubscript:@"PayloadUUID"]);
            v33 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKeyedSubscript:@"AccessGroup"]);
            if (v33)
            {
              id v34 = -[MCRelayPayloadHandler _copyCertificateWithPayloadUUID:intoKeychainAccessGroup:]( self,  "_copyCertificateWithPayloadUUID:intoKeychainAccessGroup:",  v32,  v33);
              if (!v34) {
                goto LABEL_24;
              }
              v35 = v34;
              v36 = (void *)objc_claimAutoreleasedReturnValue([v92 UUID]);
              -[MCNewPayloadHandler _retainDependencyBetweenPersistentID:andUUID:]( v97,  "_retainDependencyBetweenPersistentID:andUUID:",  v35,  v36);

              self = v97;
              -[NSMutableArray addObject:](v93, "addObject:", v35);
LABEL_23:
              -[NSMutableDictionary setObject:forKey:](v95, "setObject:forKey:", v35, v30);

              goto LABEL_24;
            }

            if (v32)
            {
              v37 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
              v35 = (void *)objc_claimAutoreleasedReturnValue([v37 persistentIDForCertificateUUID:v32]);

              self = v97;
              if (v35) {
                goto LABEL_23;
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
      *(_WORD *)objc_super v11 = 0;
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
      *(_WORD *)objc_super v11 = 0;
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
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Relay remove failed: empty configuration id",  buf,  2u);
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
      *(_WORD *)objc_super v11 = 0;
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
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Relay: Failed to get the identity for UUID %{public}@: %{public}@",  buf,  0x16u);
    }

    if (v10)
    {
LABEL_7:
      id v13 = objc_msgSend(v9, "accessibility", v7);
      unsigned int v14 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "Relay identity, storing with accessibility %@",  buf,  0xCu);
      }

      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([@"NE:" stringByAppendingString:v6]);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
      v17 = (void *)objc_claimAutoreleasedReturnValue([v16 profile]);
      id v7 = v22;
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[MCKeychain saveItem:withLabel:group:useSystemKeychain:accessibility:]( MCKeychain,  "saveItem:withLabel:group:useSystemKeychain:accessibility:",  v10,  v15,  v22,  [v17 isInstalledForSystem],  v13));

      if (v18)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
        v20 = (void *)objc_claimAutoreleasedReturnValue([v19 UUID]);
        -[MCNewPayloadHandler _touchDependencyBetweenPersistentID:andUUID:]( self,  "_touchDependencyBetweenPersistentID:andUUID:",  v18,  v20);

        id v7 = v22;
      }

      CFRelease(v10);
    }

    else
    {
      uint64_t v18 = 0LL;
    }
  }

  else
  {
    uint64_t v18 = 0LL;
  }

  return v18;
}

- (void).cxx_destruct
{
}

@end