@interface MCVPNPayloadHandlerBase
+ (id)managedServiceIDs;
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (BOOL)isInstalled;
- (BOOL)preflightUserInputResponses:(id)a3 outError:(id *)a4;
- (MCVPNPayloadHandlerBase)initWithPayload:(id)a3 profileHandler:(id)a4;
- (NEProfileIngestionDelegate)neProfileIngestionHandler;
- (NSString)originalName;
- (__SCPreferences)scPreferences;
- (id)PPTPDeprecatedError;
- (id)_copyCertificateWithPayloadUUID:(id)a3 intoKeychainAccessGroup:(id)a4 personaID:(id)a5;
- (id)cannotInstallError;
- (id)cannotInstallErrorWithUnderlyingError:(id)a3;
- (id)installService:(id)a3;
- (id)userInputFields;
- (void)didInstallOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4;
- (void)remove;
- (void)setAside;
- (void)setNeProfileIngestionHandler:(id)a3;
- (void)setOriginalName:(id)a3;
- (void)setScPreferences:(__SCPreferences *)a3;
- (void)unsetAside;
@end

@implementation MCVPNPayloadHandlerBase

- (MCVPNPayloadHandlerBase)initWithPayload:(id)a3 profileHandler:(id)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___MCVPNPayloadHandlerBase;
  v7 = -[MCNewPayloadHandler initWithPayload:profileHandler:](&v19, "initWithPayload:profileHandler:", v6, a4);
  if (!v7) {
    goto LABEL_6;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 vpnType]);
  unsigned int v9 = [v8 isEqualToString:kMCVPNPayloadBaseVPNTypeAlwaysOn];

  if (v9)
  {
    uint64_t v10 = MCNEProfileIngestionHandlerClassForPayload(@"com.apple.vpn.managed.alwayson");
    uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
    neProfileIngestionHandler = v7->_neProfileIngestionHandler;
    v7->_neProfileIngestionHandler = (NEProfileIngestionDelegate *)v11;
  }

  else
  {
    neProfileIngestionHandler = (NEProfileIngestionDelegate *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](v7, "payload"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NEProfileIngestionDelegate type](neProfileIngestionHandler, "type"));
    uint64_t v14 = MCNEProfileIngestionHandlerClassForPayload(v13);
    uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = v7->_neProfileIngestionHandler;
    v7->_neProfileIngestionHandler = (NEProfileIngestionDelegate *)v15;
  }

  if (!v7->_neProfileIngestionHandler) {
    v17 = 0LL;
  }
  else {
LABEL_6:
  }
    v17 = v7;

  return v17;
}

- (id)userInputFields
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 nePayloadBase]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 getPreprocessedPayloadContents]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"AuthName"]);
  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"AuthNameRequired"]);

    if (!v8) {
      goto LABEL_5;
    }
    uint64_t v10 = MCLocalizedString(@"USERNAME_PROMPT_TITLE", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v10);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 displayName]);
    uint64_t v12 = MCLocalizedFormat(@"VPN_USERNAME_PROMPT_DESCRIPTION");
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:]( &OBJC_CLASS___MCNewPayloadHandler,  "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue :minimumLength:fieldType:flags:",  @"kVPNUserInputUserName",  v7,  v13,  0LL,  0LL,  0LL,  0LL,  0LL,  &_mh_execute_header));
    [v3 addObject:v14];
  }

LABEL_5:
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"AuthPassword"]);
  if (!v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"AuthPasswordRequired"]);

    if (!v16) {
      goto LABEL_12;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"AuthName"]);

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"AuthName"]);
      objc_super v19 = @"VPN_PASSWORD_ACCOUNT_PROMPT_DESCRIPTION";
    }

    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue([v4 displayName]);
      objc_super v19 = @"VPN_PASSWORD_PROMPT_DESCRIPTION";
    }

    uint64_t v20 = MCLocalizedFormat(v19);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v20);

    uint64_t v22 = MCLocalizedString(@"PASSWORD_PROMPT_TITLE", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:]( &OBJC_CLASS___MCNewPayloadHandler,  "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue :minimumLength:fieldType:flags:",  @"kVPNUserInputPassword",  v23,  v15,  0LL,  0LL,  0LL,  0LL,  0LL,  0x100000003LL));
    [v3 addObject:v24];
  }

LABEL_12:
  v25 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"HTTPProxyUsername"]);
  if (!v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"HTTPProxyUsernameRequired"]);

    if (!v26) {
      goto LABEL_16;
    }
    uint64_t v28 = MCLocalizedString(@"USERNAME_PROMPT_TITLE", v27);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue([v4 displayName]);
    uint64_t v30 = MCLocalizedFormat(@"VPN_PROXY_USERNAME_PROMPT_DESCRIPTION");
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue( +[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:]( &OBJC_CLASS___MCNewPayloadHandler,  "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue :minimumLength:fieldType:flags:",  @"kVPNUserInputProxyUserName",  v25,  v31,  0LL,  0LL,  0LL,  0LL,  0LL,  &_mh_execute_header));
    [v3 addObject:v32];
  }

LABEL_16:
  v33 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"HTTPProxyPassword"]);
  if (!v33)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"HTTPProxyPassword"]);

    if (!v34) {
      goto LABEL_23;
    }
    v35 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"HTTPProxyPassword"]);

    if (v35)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"AuthName"]);
      v37 = @"VPN_PROXY_PASSWORD_ACCOUNT_PROMPT_DESCRIPTION";
    }

    else
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue([v4 displayName]);
      v37 = @"VPN_PROXY_PASSWORD_PROMPT_DESCRIPTION";
    }

    uint64_t v38 = MCLocalizedFormat(v37);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v38);

    uint64_t v40 = MCLocalizedString(@"PASSWORD_PROMPT_TITLE", v39);
    v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue( +[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:]( &OBJC_CLASS___MCNewPayloadHandler,  "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue :minimumLength:fieldType:flags:",  @"kVPNUserInputProxyPassword",  v41,  v33,  0LL,  0LL,  0LL,  0LL,  0LL,  0x100000003LL));
    [v3 addObject:v42];
  }

LABEL_23:
  v43 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"SharedSecret"]);
  if (!v43)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"SharedSecretRequired"]);

    if (!v44) {
      goto LABEL_27;
    }
    uint64_t v46 = MCLocalizedString(@"VPN_SHARED_SECRET_PROMPT_TITLE", v45);
    v43 = (void *)objc_claimAutoreleasedReturnValue(v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue([v4 displayName]);
    uint64_t v48 = MCLocalizedFormat(@"VPN_SHARED_SECRET_PROMPT_DESCRIPTION");
    v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
    v50 = (void *)objc_claimAutoreleasedReturnValue( +[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:]( &OBJC_CLASS___MCNewPayloadHandler,  "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue :minimumLength:fieldType:flags:",  @"kVPNUserInputSharedSecret",  v43,  v49,  0LL,  0LL,  0LL,  0LL,  0LL,  0x100000003LL));
    [v3 addObject:v50];
  }

LABEL_27:
  v51 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"PromptForVPNPIN"]);
  if (v51)
  {
LABEL_30:

    goto LABEL_31;
  }

  v52 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"PromptForVPNPINRequired"]);

  if (v52)
  {
    uint64_t v54 = MCLocalizedString(@"VPN_PIN_PROMPT_TITLE", v53);
    v51 = (void *)objc_claimAutoreleasedReturnValue(v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue([v4 displayName]);
    uint64_t v56 = MCLocalizedFormat(@"VPN_PIN_PROMPT_DESCRIPTION");
    v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
    v58 = (void *)objc_claimAutoreleasedReturnValue( +[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:]( &OBJC_CLASS___MCNewPayloadHandler,  "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue :minimumLength:fieldType:flags:",  @"kVPNUserInputPIN",  v51,  v57,  0LL,  0LL,  0LL,  0LL,  0LL,  0x100000003LL));
    [v3 addObject:v58];

    goto LABEL_30;
  }

- (BOOL)preflightUserInputResponses:(id)a3 outError:(id *)a4
{
  id v5 = a3;
  v26 = self;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v25 = v6;
  v24 = (void *)objc_claimAutoreleasedReturnValue([v6 nePayloadBase]);
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v31;
    uint64_t v12 = kMCIDUUIDKey;
    uint64_t v13 = kMCIDResponseKey;
    do
    {
      uint64_t v14 = 0LL;
      do
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v15 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", v12, v24));
        v17 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:v13]);
        if ([v16 isEqualToString:@"kVPNUserInputUserName"])
        {
          v18 = v7;
          objc_super v19 = v17;
          uint64_t v20 = @"AuthName";
LABEL_18:
          -[NSMutableDictionary setValue:forKey:](v18, "setValue:forKey:", v19, v20);
          goto LABEL_19;
        }

        if ([v16 isEqualToString:@"kVPNUserInputPassword"])
        {
          v18 = v7;
          objc_super v19 = v17;
          uint64_t v20 = @"AuthPassword";
          goto LABEL_18;
        }

        if ([v16 isEqualToString:@"kVPNUserInputProxyUserName"])
        {
          v18 = v7;
          objc_super v19 = v17;
          uint64_t v20 = @"HTTPProxyUsername";
          goto LABEL_18;
        }

        if ([v16 isEqualToString:@"kVPNUserInputProxyPassword"])
        {
          v18 = v7;
          objc_super v19 = v17;
          uint64_t v20 = @"HTTPProxyPassword";
          goto LABEL_18;
        }

        if ([v16 isEqualToString:@"kVPNUserInputSharedSecret"])
        {
          v18 = v7;
          objc_super v19 = v17;
          uint64_t v20 = @"SharedSecret";
          goto LABEL_18;
        }

        if ([v16 isEqualToString:@"kVPNUserInputPIN"])
        {
          v18 = v7;
          objc_super v19 = v17;
          uint64_t v20 = @"PromptForVPNPIN";
          goto LABEL_18;
        }

        os_log_t log = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
        {
          loga = log;
          uint64_t v21 = (void *)objc_opt_class(v26);
          *(_DWORD *)buf = 138543618;
          v35 = v21;
          __int16 v36 = 2114;
          v37 = v16;
          id v27 = v21;
          _os_log_impl( (void *)&_mh_execute_header,  loga,  OS_LOG_TYPE_DEFAULT,  "%{public}@ didn't ask for user input for key %{public}@",  buf,  0x16u);
        }

- (id)PPTPDeprecatedError
{
  uint64_t v2 = MCVPNErrorDomain;
  uint64_t v3 = MCErrorArray(@"ERROR_VPN_PPTP_DEPRECATED");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v2,  15000LL,  v4,  MCErrorTypeFatal,  0LL));

  return v5;
}

- (id)cannotInstallError
{
  return -[MCVPNPayloadHandlerBase cannotInstallErrorWithUnderlyingError:]( self,  "cannotInstallErrorWithUnderlyingError:",  0LL);
}

- (id)cannotInstallErrorWithUnderlyingError:(id)a3
{
  uint64_t v4 = MCVPNErrorDomain;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 displayName]);
  uint64_t v8 = MCErrorArray(@"ERROR_VPN_COULD_NOT_INSTALL");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:",  v4,  15000LL,  v9,  v5,  MCErrorTypeFatal,  v7,  0LL));

  return v10;
}

- (id)installService:(id)a3
{
  return 0LL;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 nePayloadBase]);
  v89 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kMCInstallProfileOptionIsInstalledInteractively]);
  unsigned __int8 v12 = [v11 BOOLValue];

  if ((v12 & 1) == 0)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v9 vpnType]);
    unsigned int v14 = [v13 isEqualToString:kMCVPNPayloadBaseVPNTypePPTP];

    if (v14)
    {
      uint64_t v15 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "PPTP is deprecated starting from iOS 10 and valid configurations can not be created.",  buf,  2u);
      }

      id v16 = (id)objc_claimAutoreleasedReturnValue(-[MCVPNPayloadHandlerBase PPTPDeprecatedError](self, "PPTPDeprecatedError"));
      goto LABEL_14;
    }
  }

  if ((-[NEProfileIngestionDelegate lockConfigurations]( self->_neProfileIngestionHandler,  "lockConfigurations") & 1) == 0)
  {
    v24 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "Could not get NetworkExtension store lock.",  buf,  2u);
    }

    goto LABEL_13;
  }

  -[NEProfileIngestionDelegate loadConfigurationsForceReloadFromDisk]( self->_neProfileIngestionHandler,  "loadConfigurationsForceReloadFromDisk");
  v17 = (void *)objc_claimAutoreleasedReturnValue([v9 vpnType]);
  unsigned int v18 = [v17 isEqualToString:kMCVPNPayloadBaseVPNTypeAlwaysOn];

  neProfileIngestionHandler = self->_neProfileIngestionHandler;
  if (v18)
  {
    if ((-[NEProfileIngestionDelegate createConfigurationFromPayload:payloadType:]( self->_neProfileIngestionHandler,  "createConfigurationFromPayload:payloadType:",  v10,  @"com.apple.vpn.managed.alwayson") & 1) == 0) {
      goto LABEL_9;
    }
  }

  else
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    __int16 v36 = (void *)objc_claimAutoreleasedReturnValue([v35 type]);
    unsigned __int8 v37 = -[NEProfileIngestionDelegate createConfigurationFromPayload:payloadType:]( neProfileIngestionHandler,  "createConfigurationFromPayload:payloadType:",  v10,  v36);

    if ((v37 & 1) == 0)
    {
LABEL_9:
      os_log_t v20 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = v20;
        id v22 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
        v23 = (void *)objc_claimAutoreleasedReturnValue([v22 UUID]);
        *(_DWORD *)buf = 138543362;
        v106 = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "NetworkExtension did not create configuration from payload UUID %{public}@",  buf,  0xCu);
      }

- (BOOL)isInstalled
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  neProfileIngestionHandler = self->_neProfileIngestionHandler;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 UUID]);
  LOBYTE(neProfileIngestionHandler) = -[NEProfileIngestionDelegate isInstalled:]( neProfileIngestionHandler,  "isInstalled:",  v5);

  return (char)neProfileIngestionHandler;
}

- (void)remove
{
  os_log_t v3 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = v3;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUID]);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 persistentResourceID]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    *(_DWORD *)buf = 138543874;
    __int128 v31 = v6;
    __int16 v32 = 2114;
    __int128 v33 = v8;
    __int16 v34 = 2114;
    v35 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "Attempting to remove VPN payload (%{public}@, %{public}@): %{public}@",  buf,  0x20u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  if ((-[NEProfileIngestionDelegate lockConfigurations]( self->_neProfileIngestionHandler,  "lockConfigurations") & 1) != 0)
  {
    -[NEProfileIngestionDelegate loadConfigurationsForceReloadFromDisk]( self->_neProfileIngestionHandler,  "loadConfigurationsForceReloadFromDisk");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 persistentResourceID]);

    if (v11)
    {
      neProfileIngestionHandler = self->_neProfileIngestionHandler;
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 persistentResourceID]);
      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue( -[NEProfileIngestionDelegate getCertificatesForConfigurationWithIdentifier:]( neProfileIngestionHandler,  "getCertificatesForConfigurationWithIdentifier:",  v13));

      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      id v15 = v14;
      id v16 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v26;
        do
        {
          objc_super v19 = 0LL;
          do
          {
            if (*(void *)v26 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)v19);
            uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUID", (void)v25));
            -[MCNewPayloadHandler _releaseDependencyBetweenPersistentID:andUUID:]( self,  "_releaseDependencyBetweenPersistentID:andUUID:",  v20,  v21);

            objc_super v19 = (char *)v19 + 1;
          }

          while (v17 != v19);
          id v17 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }

        while (v17);
      }

      id v22 = self->_neProfileIngestionHandler;
      v23 = (void *)objc_claimAutoreleasedReturnValue([v10 persistentResourceID]);
      -[NEProfileIngestionDelegate removeConfigurationWithIdentifier:](v22, "removeConfigurationWithIdentifier:", v23);
    }

    -[NEProfileIngestionDelegate updateDefaultAfterDeletingConfiguration]( self->_neProfileIngestionHandler,  "updateDefaultAfterDeletingConfiguration",  (void)v25);
    -[NEProfileIngestionDelegate unlockConfigurations](self->_neProfileIngestionHandler, "unlockConfigurations");
  }

  else
  {
    v24 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "Could not get NetworkExtension store lock. Skipping removal.",  buf,  2u);
    }
  }
}

- (void)setAside
{
  os_log_t v3 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = v3;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUID]);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 persistentResourceID]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    int v15 = 138543874;
    id v16 = v6;
    __int16 v17 = 2114;
    uint64_t v18 = v8;
    __int16 v19 = 2114;
    uint64_t v20 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "Setting aside VPN payload (%{public}@, %{public}@): %{public}@",  (uint8_t *)&v15,  0x20u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  if ((-[NEProfileIngestionDelegate lockConfigurations]( self->_neProfileIngestionHandler,  "lockConfigurations") & 1) != 0)
  {
    -[NEProfileIngestionDelegate loadConfigurationsForceReloadFromDisk]( self->_neProfileIngestionHandler,  "loadConfigurationsForceReloadFromDisk");
    neProfileIngestionHandler = self->_neProfileIngestionHandler;
    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v10 persistentResourceID]);
    id v13 =  -[NEProfileIngestionDelegate setAsideConfigurationName:unsetAside:]( neProfileIngestionHandler,  "setAsideConfigurationName:unsetAside:",  v12,  0LL);

    -[NEProfileIngestionDelegate unlockConfigurations](self->_neProfileIngestionHandler, "unlockConfigurations");
  }

  else
  {
    unsigned int v14 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Could not get NetworkExtension store lock.",  (uint8_t *)&v15,  2u);
    }
  }
}

- (void)unsetAside
{
  os_log_t v3 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = v3;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUID]);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 persistentResourceID]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    int v15 = 138543874;
    id v16 = v6;
    __int16 v17 = 2114;
    uint64_t v18 = v8;
    __int16 v19 = 2114;
    uint64_t v20 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "Unsetting aside VPN payload (%{public}@, %{public}@): %{public}@",  (uint8_t *)&v15,  0x20u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  if ((-[NEProfileIngestionDelegate lockConfigurations]( self->_neProfileIngestionHandler,  "lockConfigurations") & 1) != 0)
  {
    -[NEProfileIngestionDelegate loadConfigurationsForceReloadFromDisk]( self->_neProfileIngestionHandler,  "loadConfigurationsForceReloadFromDisk");
    neProfileIngestionHandler = self->_neProfileIngestionHandler;
    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v10 persistentResourceID]);
    id v13 =  -[NEProfileIngestionDelegate setAsideConfigurationName:unsetAside:]( neProfileIngestionHandler,  "setAsideConfigurationName:unsetAside:",  v12,  1LL);

    -[NEProfileIngestionDelegate unlockConfigurations](self->_neProfileIngestionHandler, "unlockConfigurations");
  }

  else
  {
    unsigned int v14 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Could not get NetworkExtension store lock.",  (uint8_t *)&v15,  2u);
    }
  }
}

- (void)didInstallOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload", a3, a4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 vpnType]);
  unsigned int v7 = [v6 isEqualToString:kMCVPNPayloadBaseVPNTypeAlwaysOn];

  if (v7)
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[MCVPNPayloadHandlerBase neProfileIngestionHandler](self, "neProfileIngestionHandler"));
    [v8 enableAlwaysOnVpn];
  }

+ (id)managedServiceIDs
{
  uint64_t v2 = MCNEProfileIngestionHandlerClassForPayload(@"PayloadTypeNone");
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = v3;
  if (v3)
  {
    [v3 loadConfigurationsForceReloadFromDisk];
    id v5 = [v4 copyManagedConfigurationIDs];
  }

  else
  {
    id v5 = &__NSArray0__struct;
  }

  return v5;
}

- (id)_copyCertificateWithPayloadUUID:(id)a3 intoKeychainAccessGroup:(id)a4 personaID:(id)a5
{
  id v8 = (__CFString *)a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 payloadHandlerWithUUID:v8]);

  if (v12)
  {
    id v27 = 0LL;
    id v13 = [v12 copyIdentityImmediatelyWithInteractionClient:0 outError:&v27];
    id v14 = v27;
    if (!v14 && v13) {
      goto LABEL_7;
    }
    int v15 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      CFStringRef v29 = v8;
      __int16 v30 = 2114;
      id v31 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "VPN: Failed to get the identity for UUID %{public}@: %{public}@",  buf,  0x16u);
    }

    if (v13)
    {
LABEL_7:
      id v25 = v14;
      id v26 = v10;
      id v16 = v9;
      __int16 v17 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v29 = kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "Storing VPN identity, storing with accessibility %@",  buf,  0xCu);
      }

      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([@"NE:" stringByAppendingString:v8]);
      __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 profile]);
      id v9 = v16;
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[MCKeychain saveItem:withLabel:group:useSystemKeychain:enforcePersonalPersona:accessibility:]( MCKeychain,  "saveItem:withLabel:group:useSystemKeychain:enforcePersonalPersona:accessibility:",  v13,  v18,  v16,  [v20 isInstalledForSystem],  0,  kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly));

      id v10 = v26;
      if (v21)
      {
        id v22 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
        v23 = (void *)objc_claimAutoreleasedReturnValue([v22 UUID]);
        -[MCNewPayloadHandler _touchDependencyBetweenPersistentID:andUUID:personaID:]( self,  "_touchDependencyBetweenPersistentID:andUUID:personaID:",  v21,  v23,  v26);
      }

      CFRelease(v13);
      id v14 = v25;
    }

    else
    {
      uint64_t v21 = 0LL;
    }
  }

  else
  {
    uint64_t v21 = 0LL;
  }

  return v21;
}

- (__SCPreferences)scPreferences
{
  return self->_scPreferences;
}

- (void)setScPreferences:(__SCPreferences *)a3
{
  self->_scPreferences = a3;
}

- (NSString)originalName
{
  return self->_originalName;
}

- (void)setOriginalName:(id)a3
{
}

- (NEProfileIngestionDelegate)neProfileIngestionHandler
{
  return self->_neProfileIngestionHandler;
}

- (void)setNeProfileIngestionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end