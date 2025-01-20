@interface MCDNSProxyPayloadHandler
+ (id)internalError;
+ (id)internalErrorWithUnderlyingError:(id)a3;
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (MCDNSProxyPayloadHandler)initWithPayload:(id)a3 profileHandler:(id)a4;
- (void)remove;
- (void)setAside;
- (void)unsetAside;
@end

@implementation MCDNSProxyPayloadHandler

- (MCDNSProxyPayloadHandler)initWithPayload:(id)a3 profileHandler:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MCDNSProxyPayloadHandler;
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
  uint64_t v3 = MCDNSProxyErrorDomain;
  id v4 = a3;
  uint64_t v5 = MCErrorArray(@"ERROR_DNS_PROXY_INTERNAL_ERROR");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:",  v3,  51000LL,  v6,  v4,  MCErrorTypeFatal,  0LL));

  return v7;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v10 type]);
  uint64_t v12 = MCNEProfileIngestionHandlerClassForPayload();
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  if (!v13)
  {
    id v41 = v9;
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v42 handleFailureInMethod:a2, self, @"MCDNSProxyPayloadHandler.m", 82, @"Invalid parameter not satisfying: %@", @"neProfileIngestionHandler" object file lineNumber description];

    id v9 = v41;
  }

  if ([v13 lockConfigurations])
  {
    id v44 = v9;
    [v13 loadConfigurationsForceReloadFromDisk];
    v14 = (void *)objc_claimAutoreleasedReturnValue([v10 configurationDictionary]);
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[MCVPNPayloadBase NEVPNPayloadBaseDelegateWithConfigurationDict:]( &OBJC_CLASS___MCVPNPayloadBase,  "NEVPNPayloadBaseDelegateWithConfigurationDict:",  v14));

    if (!v15)
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      [v43 handleFailureInMethod:a2, self, @"MCDNSProxyPayloadHandler.m", 91, @"Invalid parameter not satisfying: %@", @"payloadBase" object file lineNumber description];
    }

    [v13 createConfigurationFromPayload:v15 payloadType:v11];
    v16 = (void *)objc_claimAutoreleasedReturnValue([v13 ingestedConfiguration]);
    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue([v10 UUID]);
      v18 = (void *)objc_claimAutoreleasedReturnValue([v10 organization]);
      [v16 setPayloadInfoCommon:v17 payloadOrganization:v18];

      uint64_t v19 = objc_claimAutoreleasedReturnValue([v10 dnsProxyUUID]);
      if (!v19
        || (v20 = (void *)v19,
            v21 = (void *)objc_claimAutoreleasedReturnValue([v10 dnsProxyUUID]),
            unsigned __int8 v22 = [v16 setPerAppUUID:v21 andSafariDomains:0],
            v21,
            v20,
            (v22 & 1) != 0))
      {
        v23 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfile UUID](self->_profile, "UUID"));

        if (v24)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfile UUID](self->_profile, "UUID"));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v23,  "setObject:forKeyedSubscript:",  v25,  kMCPayloadUUIDKey);
        }

        v26 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfile identifier](self->_profile, "identifier"));

        if (v26)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfile identifier](self->_profile, "identifier"));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v23,  "setObject:forKeyedSubscript:",  v27,  kMCPayloadIdentifierKey);
        }

        if (v44) {
          -[NSMutableDictionary addEntriesFromDictionary:](v23, "addEntriesFromDictionary:");
        }
        [v16 setProfileInfo:v23];
        [v13 updateDefaultAfterAddingConfiguration];
        v28 = (void *)objc_claimAutoreleasedReturnValue([v16 getConfigurationIdentifier]);
        [v10 setPersistentResourceID:v28];

        id v45 = 0LL;
        unsigned __int8 v29 = [v13 saveIngestedConfiguration:&v45];
        id v30 = v45;
        if (a6 && (v29 & 1) == 0)
        {
          id v31 = [(id)objc_opt_class(self) internalErrorWithUnderlyingError:v30];
          *a6 = (id)objc_claimAutoreleasedReturnValue(v31);
        }

        [v13 unlockConfigurations];

        goto LABEL_30;
      }

      v34 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Could not configure DNS proxy UUID", buf, 2u);
      }

      if (a6)
      {
        uint64_t v35 = MCDNSProxyErrorDomain;
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
        v37 = (void *)objc_claimAutoreleasedReturnValue([v36 displayName]);
        uint64_t v38 = MCErrorArray(@"ERROR_DNS_PROXY_COULD_NOT_INSTALL");
        v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
        *a6 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v35,  51001LL,  v39,  MCErrorTypeFatal,  v37,  0LL));
      }
    }

    else
    {
      if (a6)
      {
        id v33 = [(id)objc_opt_class(self) internalError];
        *a6 = (id)objc_claimAutoreleasedReturnValue(v33);
      }

      [v13 unlockConfigurations];
    }

    unsigned __int8 v29 = 0;
LABEL_30:
    id v9 = v44;

    goto LABEL_31;
  }

  if (a6)
  {
    id v32 = [(id)objc_opt_class(self) internalError];
    unsigned __int8 v29 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue(v32);
  }

  else
  {
    unsigned __int8 v29 = 0;
  }

- (void)setAside
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 type]);
  uint64_t v5 = MCNEProfileIngestionHandlerClassForPayload();
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
  uint64_t v5 = MCNEProfileIngestionHandlerClassForPayload();
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
  uint64_t v7 = MCNEProfileIngestionHandlerClassForPayload();
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
      *(_WORD *)objc_super v11 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Could not get NetworkExtension store lock. Skipping removal.",  v11,  2u);
    }
  }
}

- (void).cxx_destruct
{
}

@end