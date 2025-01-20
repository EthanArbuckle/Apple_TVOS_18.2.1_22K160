@interface MCNewWiFiPayloadHandler
+ (id)_originatorIdentifierFromInstallationOptions:(id)a3;
+ (id)_originatorNameFromInstallationOptions:(id)a3;
+ (id)managedWiFiNetworkNames;
- (BOOL)_applyProxyCredential:(id)a3;
- (BOOL)_configureEncryptionTypeForWiFiNetwork:(__WiFiNetwork *)a3 payload:(id)a4 outError:(id *)a5;
- (BOOL)_configureNetworkServiceForWiFiNetwork:(__WiFiNetwork *)a3 outError:(id *)a4;
- (BOOL)_installEAPConfiguration:(id)a3 isHotspot:(BOOL)a4 securityType:(id)a5 authProperties:(id)a6 username:(id)a7 password:(id)a8 identity:(__SecIdentity *)a9;
- (BOOL)_isMetadataValid:(__EAPOLClientProfile *)a3;
- (BOOL)_isWiFiDaemonAvailable;
- (BOOL)_networkServiceRequired;
- (BOOL)_setEAPConfig:(id)a3 onNetwork:(__WiFiNetwork *)a4;
- (BOOL)_setEAPConfigUsingEAPConfigAPI:(id)a3;
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (BOOL)isInstalled;
- (BOOL)preflightUserInputResponses:(id)a3 outError:(id *)a4;
- (MCNewWiFiPayloadHandler)initWithPayload:(id)a3 profileHandler:(id)a4;
- (id)profileMetadata;
- (id)userInputFields;
- (void)_removeEAPConfiguration;
- (void)_removeNetworkWithUUID:(id)a3;
- (void)_removeProxyCredential;
- (void)_updateWiFiCustomSetWithSetID:(id)a3 forSSID:(id)a4;
- (void)dealloc;
- (void)remove;
- (void)setAside;
- (void)setAsideEAPConfig;
- (void)unsetAside;
- (void)unsetAsideEAPConfig;
@end

@implementation MCNewWiFiPayloadHandler

- (MCNewWiFiPayloadHandler)initWithPayload:(id)a3 profileHandler:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MCNewWiFiPayloadHandler;
  v4 = -[MCNewPayloadHandler initWithPayload:profileHandler:](&v12, "initWithPayload:profileHandler:", a3, a4);
  if (v4)
  {
    uint64_t v5 = WiFiManagerClientCreate(kCFAllocatorDefault, 0LL);
    v4->_manager = (__WiFiManagerClient *)v5;
    v6 = (os_log_s *)_MCLogObjects[0];
    if (v5)
    {
      if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        v7 = "MCNewWiFiPayloadHandler successfully created a WiFiManagerClient.";
        v8 = v6;
        os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v8, v9, v7, v11, 2u);
      }
    }

    else if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      v7 = "MCNewWiFiPayloadHandler could not create a WiFiManagerClient. This payload handler will not function correctly.";
      v8 = v6;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
      goto LABEL_7;
    }
  }

  return v4;
}

- (void)dealloc
{
  manager = self->_manager;
  if (manager)
  {
    CFRelease(manager);
    self->_manager = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MCNewWiFiPayloadHandler;
  -[MCNewWiFiPayloadHandler dealloc](&v4, "dealloc");
}

- (id)userInputFields
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 userInputFields]);

  return v3;
}

- (BOOL)preflightUserInputResponses:(id)a3 outError:(id *)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id obj = v5;
  id v7 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v22;
    uint64_t v11 = kMCIDUUIDKey;
    uint64_t v12 = kMCIDResponseKey;
    *(void *)&__int128 v8 = 138543362LL;
    __int128 v19 = v8;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", v11, v19));
        v16 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v12]);
        if ([v15 isEqualToString:@"UsernameUserInputKey"])
        {
          [v6 setUsername:v16];
        }

        else if ([v15 isEqualToString:@"PasswordUserInputKey"])
        {
          [v6 setPassword:v16];
        }

        else
        {
          v17 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v19;
            v26 = v15;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "MCNewWiFiPayloadHandler didn't ask for user input for key: %{public}@",  buf,  0xCu);
          }
        }
      }

      id v9 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
    }

    while (v9);
  }

  return 1;
}

- (id)profileMetadata
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 UUID]);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v3,  kMCPayloadUUIDKey));

  return v4;
}

- (BOOL)_isMetadataValid:(__EAPOLClientProfile *)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  uint64_t Information = EAPOLClientProfileGetInformation(a3, @"com.apple.managedconfiguration.profiled.eap");
  v6 = (void *)objc_claimAutoreleasedReturnValue(Information);
  id v7 = v6;
  if (!v6) {
    goto LABEL_5;
  }
  uint64_t v8 = kMCPayloadUUIDKey;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:kMCPayloadUUIDKey]);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString);
  char isKindOfClass = objc_opt_isKindOfClass(v9, v10);

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v4 UUID]);
  unsigned __int8 v14 = [v12 isEqualToString:v13];

  if ((v14 & 1) != 0) {
    BOOL v15 = 1;
  }
  else {
LABEL_5:
  }
    BOOL v15 = 0;

  return v15;
}

- (BOOL)_installEAPConfiguration:(id)a3 isHotspot:(BOOL)a4 securityType:(id)a5 authProperties:(id)a6 username:(id)a7 password:(id)a8 identity:(__SecIdentity *)a9
{
  BOOL v13 = a4;
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  uint64_t v21 = EAPOLClientConfigurationCreateWithAuthorization(0LL, 0LL);
  if (v21)
  {
    __int128 v22 = (const void *)v21;
    id v61 = v16;
    id v62 = v17;
    if (v13)
    {
      ProfileWithWLANDomain = (const void *)EAPOLClientConfigurationGetProfileWithWLANDomain(v21, v15);
      if (ProfileWithWLANDomain)
      {
        __int128 v24 = ProfileWithWLANDomain;
        CFRetain(ProfileWithWLANDomain);
LABEL_10:
        if (!-[MCNewWiFiPayloadHandler _isMetadataValid:](self, "_isMetadataValid:", v24, v61))
        {
          os_log_t v31 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
          {
            v32 = v31;
            *(_DWORD *)buf = 138543362;
            id v64 = (id)objc_opt_class(self);
            id v33 = v64;
            _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEBUG,  "%{public}@ configuration for the Wi-Fi already exists",  buf,  0xCu);
          }
        }

        goto LABEL_15;
      }
    }

    else
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue([v15 dataUsingEncoding:4]);
      ProfileWithWLANSSID = (const void *)EAPOLClientConfigurationGetProfileWithWLANSSID(v22, v29);
      if (ProfileWithWLANSSID)
      {
        __int128 v24 = ProfileWithWLANSSID;
        CFRetain(ProfileWithWLANSSID);

        goto LABEL_10;
      }
    }

    __int128 v24 = (const void *)EAPOLClientProfileCreate(v22);
    if (!v24)
    {
      os_log_t v44 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        v45 = v44;
        *(_DWORD *)buf = 138543362;
        id v64 = (id)objc_opt_class(self);
        id v46 = v64;
        _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_ERROR,  "%{public}@ EAPOLClientProfileCreate() returned NULL",  buf,  0xCu);
      }

      BOOL v28 = 0;
      id v16 = v61;
      goto LABEL_49;
    }

- (void)_removeEAPConfiguration
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  uint64_t v4 = EAPOLClientConfigurationCreateWithAuthorization(0LL, 0LL);
  if (v4)
  {
    id v5 = (const void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
    unsigned int v7 = [v6 isSetAside];
    uint64_t v8 = qword_1000DC000;

    if (v7)
    {
      if (!v8)
      {
        os_log_t v9 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          uint64_t v10 = v9;
          *(_DWORD *)os_log_t v47 = 138543362;
          *(void *)&v47[4] = objc_opt_class(self);
          id v11 = *(id *)&v47[4];
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%{public}@ failed to find set aside EAP profile",  v47,  0xCu);
        }
      }
    }

    if (qword_1000DC000)
    {
      uint64_t ProfileWithID = EAPOLClientConfigurationGetProfileWithID(v5);
    }

    else
    {
      if (![v3 isHotspot])
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue([v3 ssid]);
        v38 = (void *)objc_claimAutoreleasedReturnValue([v37 dataUsingEncoding:4]);

        uint64_t ProfileWithWLANSSID = EAPOLClientConfigurationGetProfileWithWLANSSID(v5, v38);
        if (ProfileWithWLANSSID) {
          goto LABEL_13;
        }
        goto LABEL_28;
      }

      uint64_t ProfileWithID = EAPOLClientConfigurationGetProfileWithWLANDomain(v5, [v3 domainName]);
    }

    uint64_t ProfileWithWLANSSID = ProfileWithID;
    if (ProfileWithID)
    {
LABEL_13:
      if (-[MCNewWiFiPayloadHandler _isMetadataValid:](self, "_isMetadataValid:", ProfileWithWLANSSID, *(_OWORD *)v47))
      {
        uint64_t v17 = EAPOLClientItemIDCreateWithProfile(ProfileWithWLANSSID);
        if (v17)
        {
          id v18 = (const void *)v17;
          if (!EAPOLClientItemIDRemovePasswordItem(v17, 3LL))
          {
            os_log_t v19 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
            {
              v20 = v19;
              uint64_t v21 = (void *)objc_opt_class(self);
              *(_DWORD *)os_log_t v47 = 138543362;
              *(void *)&v47[4] = v21;
              id v22 = v21;
              _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%{public}@ EAPOLClientItemIDRemovePasswordItem() failed",  v47,  0xCu);
            }
          }

          if (!EAPOLClientItemIDSetIdentity(v18, 3LL))
          {
            os_log_t v23 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
            {
              __int128 v24 = v23;
              os_log_t v25 = (void *)objc_opt_class(self);
              *(_DWORD *)os_log_t v47 = 138543362;
              *(void *)&v47[4] = v25;
              id v26 = v25;
              _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%{public}@ EAPOLClientItemIDSetIdentity() failed",  v47,  0xCu);
            }
          }

          if (EAPOLClientConfigurationRemoveProfile(v5, ProfileWithWLANSSID))
          {
            os_log_t v27 = _MCLogObjects[0];
            if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
              goto LABEL_39;
            }
            BOOL v28 = v27;
            v29 = (void *)objc_opt_class(self);
            *(_DWORD *)os_log_t v47 = 138543362;
            *(void *)&v47[4] = v29;
            id v30 = v29;
            os_log_t v31 = "%{public}@ EAPOLClientConfigurationSave() failed";
          }

          else
          {
            os_log_t v44 = _MCLogObjects[0];
            if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
            {
LABEL_39:
              id v46 = (void *)qword_1000DC000;
              qword_1000DC000 = 0LL;

              CFRelease(v18);
              goto LABEL_34;
            }

            BOOL v28 = v44;
            v45 = (void *)objc_opt_class(self);
            *(_DWORD *)os_log_t v47 = 138543362;
            *(void *)&v47[4] = v45;
            id v30 = v45;
            os_log_t v31 = "%{public}@ EAPOLClientConfigurationRemoveProfile() failed";
          }

          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, v31, v47, 0xCu);

          goto LABEL_39;
        }

        os_log_t v41 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          id v33 = v41;
          id v42 = (void *)objc_opt_class(self);
          *(_DWORD *)os_log_t v47 = 138543362;
          *(void *)&v47[4] = v42;
          id v35 = v42;
          v36 = "%{public}@ EAPOLClientItemIDCreateWithProfile() returned NULL";
          goto LABEL_32;
        }

- (BOOL)_setEAPConfigUsingEAPConfigAPI:(id)a3
{
  id v4 = a3;
  CFTypeRef cf = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  id v6 = [v4 mutableCopy];
  if ([v5 usernameRequired]
    && (unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v5 username]), v7, !v7))
  {
    os_log_t v48 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v49 = v48;
      *(_DWORD *)buf = 138543362;
      id v67 = (id)objc_opt_class(self);
      id v50 = v67;
      _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_ERROR,  "%{public}@ username is not available",  buf,  0xCu);
    }

    LODWORD(v8) = 0;
  }

  else
  {
    LODWORD(v8) = 1;
  }

  os_log_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"TLSTrustedCertificates"]);

  if (v9)
  {
    if (!(_DWORD)v8) {
      goto LABEL_38;
    }
LABEL_26:
    os_log_t v31 = (void *)objc_claimAutoreleasedReturnValue([v5 certificateUUID]);

    if (v31)
    {
      id v32 = v6;
      id v33 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v5 certificateUUID]);
      id v35 = (void *)objc_claimAutoreleasedReturnValue([v33 persistentIDForCertificateUUID:v34]);

      os_log_t v36 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        v37 = v36;
        v38 = (void *)objc_opt_class(self);
        *(_DWORD *)buf = 138543618;
        id v67 = v38;
        __int16 v68 = 1026;
        LODWORD(v69) = v35 != 0LL;
        id v39 = v38;
        _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "%{public}@ handling identity certs? %{public}d",  buf,  0x12u);
      }

      if (v35 && (EAPSecIdentityHandleCreateSecIdentity(v35, &cf) || !cf))
      {
        os_log_t v51 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
        {
          v52 = v51;
          v53 = (void *)objc_opt_class(self);
          *(_DWORD *)buf = 138543362;
          id v67 = v53;
          id v54 = v53;
          _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "%{public}@ EAPSecIdentityHandleCreateSecIdentity() failed",  buf,  0xCu);
        }

        LOBYTE(v8) = 0;
        goto LABEL_37;
      }
    }

    v40 = (void *)objc_claimAutoreleasedReturnValue([v5 username]);
    id v35 = (void *)objc_claimAutoreleasedReturnValue([v40 dataUsingEncoding:4]);

    os_log_t v41 = (void *)objc_claimAutoreleasedReturnValue([v5 password]);
    id v42 = (void *)objc_claimAutoreleasedReturnValue([v41 dataUsingEncoding:4]);

    id v32 = v6;
    [v6 removeObjectForKey:@"UserPassword"];
    id v8 = [v5 isHotspot];
    else {
      uint64_t v43 = objc_claimAutoreleasedReturnValue([v5 ssid]);
    }
    os_log_t v44 = (void *)v43;
    v45 = v5;
    id v46 = (void *)objc_claimAutoreleasedReturnValue([v5 encryptionType]);
    LOBYTE(v8) = -[MCNewWiFiPayloadHandler _installEAPConfiguration:isHotspot:securityType:authProperties:username:password:identity:]( self,  "_installEAPConfiguration:isHotspot:securityType:authProperties:username:password:identity:",  v44,  v8,  v46,  v32,  v35,  v42,  cf);

    id v5 = v45;
LABEL_37:

    id v6 = v32;
    goto LABEL_38;
  }

  int v55 = (int)v8;
  os_log_t v56 = v6;
  id v58 = v4;
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  v57 = v5;
  id obj = (id)objc_claimAutoreleasedReturnValue([v5 payloadCertificateAnchorUUID]);
  id v10 = [obj countByEnumeratingWithState:&v61 objects:v72 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v62;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v62 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v61 + 1) + 8LL * (void)i);
        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 persistentIDForCertificateUUID:v14]);

        if (v16)
        {
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
          id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 profile]);
          id v19 = [v18 isInstalledForSystem];

          v20 = (__SecCertificate *)+[MCKeychain copyCertificateWithPersistentID:useSystemKeychain:]( &OBJC_CLASS___MCKeychain,  "copyCertificateWithPersistentID:useSystemKeychain:",  v16,  v19);
          if (v20)
          {
            uint64_t v21 = v20;
            CFDataRef v22 = SecCertificateCopyData(v20);
            if (v22)
            {
              os_log_t v23 = _MCLogObjects[0];
              if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
              {
                __int128 v24 = v23;
                os_log_t v25 = (void *)objc_opt_class(self);
                *(_DWORD *)buf = 138543874;
                id v67 = v25;
                __int16 v68 = 2114;
                uint64_t v69 = v14;
                __int16 v70 = 1026;
                int v71 = (int)v19;
                id v26 = v25;
                _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%{public}@ adding trusted certificate UUID %{public}@ with system keychain? %{public}d",  buf,  0x1Cu);
              }

              [v59 addObject:v22];
            }

            CFRelease(v21);
          }
        }

        else
        {
          os_log_t v27 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
          {
            BOOL v28 = v27;
            v29 = (void *)objc_opt_class(self);
            *(_DWORD *)buf = 138543618;
            id v67 = v29;
            __int16 v68 = 2114;
            uint64_t v69 = v14;
            id v30 = v29;
            _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "%{public}@ certificate UUID %{public}@ referenced by this payload does not exist, skipping.",  buf,  0x16u);
          }
        }
      }

      id v11 = [obj countByEnumeratingWithState:&v61 objects:v72 count:16];
    }

    while (v11);
  }

  id v6 = v56;
  if ([v59 count]) {
    [v56 setObject:v59 forKey:@"TLSTrustedCertificates"];
  }

  id v5 = v57;
  id v4 = v58;
  LOBYTE(v8) = v55;
  if (v55) {
    goto LABEL_26;
  }
LABEL_38:
  if (cf) {
    CFRelease(cf);
  }

  return (char)v8;
}

- (void)setAsideEAPConfig
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  id v4 = (void *)qword_1000DC000;
  qword_1000DC000 = 0LL;

  uint64_t v5 = EAPOLClientConfigurationCreateWithAuthorization(0LL, 0LL);
  if (v5)
  {
    id v6 = (const void *)v5;
    if ([v3 isHotspot])
    {
      uint64_t ProfileWithWLANDomain = EAPOLClientConfigurationGetProfileWithWLANDomain(v6, [v3 domainName]);
      id v8 = 0LL;
      if (ProfileWithWLANDomain)
      {
LABEL_4:
        if (-[MCNewWiFiPayloadHandler _isMetadataValid:](self, "_isMetadataValid:", ProfileWithWLANDomain))
        {
          uint64_t ID = EAPOLClientProfileGetID(ProfileWithWLANDomain);
          uint64_t v10 = objc_claimAutoreleasedReturnValue(ID);
          id v11 = (void *)qword_1000DC000;
          qword_1000DC000 = v10;

          if (qword_1000DC000)
          {
            if (v8) {
              EAPOLClientProfileSetWLANSSIDAndSecurityType(ProfileWithWLANDomain, 0LL, 0LL);
            }
            else {
              EAPOLClientProfileSetWLANDomain(ProfileWithWLANDomain, 0LL);
            }
            os_log_t v22 = _MCLogObjects[0];
            if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
              goto LABEL_22;
            }
            uint64_t v17 = v22;
            int v23 = 138543362;
            id v24 = (id)objc_opt_class(self);
            id v18 = v24;
            id v19 = "%{public}@ EAPOLClientConfigurationSave() failed";
            goto LABEL_21;
          }

          os_log_t v21 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          {
            uint64_t v17 = v21;
            int v23 = 138543362;
            id v24 = (id)objc_opt_class(self);
            id v18 = v24;
            id v19 = "%{public}@ EAPOLClientProfileGetID() returned NULL";
            goto LABEL_21;
          }

- (void)unsetAsideEAPConfig
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  unsigned int v5 = [v4 isSetAside];
  uint64_t v6 = qword_1000DC000;

  if (v5 && v6)
  {
    uint64_t v7 = EAPOLClientConfigurationCreateWithAuthorization(0LL, 0LL);
    if (v7)
    {
      id v8 = (const void *)v7;
      uint64_t ProfileWithID = EAPOLClientConfigurationGetProfileWithID(v7);
      uint64_t v10 = (void *)qword_1000DC000;
      qword_1000DC000 = 0LL;

      if (ProfileWithID)
      {
        if ([v3 isHotspot])
        {
          EAPOLClientProfileSetWLANDomain(ProfileWithID, [v3 domainName]);
        }

        else
        {
          id v18 = (void *)objc_claimAutoreleasedReturnValue([v3 ssid]);
          id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 dataUsingEncoding:4]);
          EAPOLClientProfileSetWLANSSIDAndSecurityType(ProfileWithID, v19, [v3 encryptionType]);
        }

        os_log_t v20 = _MCLogObjects[0];
        if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
          goto LABEL_16;
        }
        id v15 = v20;
        int v21 = 138543362;
        id v22 = (id)objc_opt_class(self);
        id v16 = v22;
        uint64_t v17 = "%{public}@ EAPOLClientConfigurationSave() failed";
      }

      else
      {
        os_log_t v14 = _MCLogObjects[0];
        if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
LABEL_16:
          CFRelease(v8);
          goto LABEL_17;
        }

        id v15 = v14;
        int v21 = 138543362;
        id v22 = (id)objc_opt_class(self);
        id v16 = v22;
        uint64_t v17 = "%{public}@ EAPOLClientConfigurationGetProfileWithID() returned NULL";
      }

      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v21, 0xCu);

      goto LABEL_16;
    }

    os_log_t v11 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      os_log_t v12 = v11;
      int v21 = 138543362;
      id v22 = (id)objc_opt_class(self);
      id v13 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%{public}@ EAPOLClientConfigurationCreateWithAuthorization() returned NULL",  (uint8_t *)&v21,  0xCu);
    }
  }

- (BOOL)_setEAPConfig:(id)a3 onNetwork:(__WiFiNetwork *)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  sub_100052CC0();
  id v8 = [v6 mutableCopy];
  os_log_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 username]);

  if (v9)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 username]);
    [v8 setObject:v10 forKey:@"UserName"];

LABEL_4:
    BOOL v11 = 1;
    goto LABEL_5;
  }

  v40 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_ERROR,  "MCNewWiFiPayloadHandler requires a username but a username is not available.",  buf,  2u);
  }

  BOOL v11 = 0;
LABEL_5:
  os_log_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"TLSTrustedCertificates"]);

  if (v12)
  {
    if (v11) {
      goto LABEL_7;
    }
  }

  else
  {
    BOOL v44 = v11;
    v45 = a4;
    id v46 = v8;
    id v48 = v6;
    int v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    os_log_t v47 = v7;
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v7 payloadCertificateAnchorUUID]);
    id v50 = [v22 countByEnumeratingWithState:&v52 objects:v59 count:16];
    if (v50)
    {
      uint64_t v23 = *(void *)v53;
      uint64_t v49 = *(void *)v53;
      do
      {
        for (i = 0LL; i != v50; i = (char *)i + 1)
        {
          if (*(void *)v53 != v23) {
            objc_enumerationMutation(v22);
          }
          uint64_t v25 = *(void *)(*((void *)&v52 + 1) + 8LL * (void)i);
          id v26 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
          os_log_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 persistentIDForCertificateUUID:v25]);

          if (v27)
          {
            BOOL v28 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
            v29 = (void *)objc_claimAutoreleasedReturnValue([v28 profile]);
            id v30 = [v29 isInstalledForSystem];

            os_log_t v31 = (__SecCertificate *)+[MCKeychain copyCertificateWithPersistentID:useSystemKeychain:]( &OBJC_CLASS___MCKeychain,  "copyCertificateWithPersistentID:useSystemKeychain:",  v27,  v30);
            if (v31)
            {
              id v32 = v31;
              CFDataRef v33 = SecCertificateCopyData(v31);
              if (v33)
              {
                uint64_t v34 = v22;
                id v35 = self;
                os_log_t v36 = v21;
                v37 = _MCLogObjects[0];
                if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  *(void *)&uint8_t buf[4] = v25;
                  __int16 v57 = 1026;
                  int v58 = (int)v30;
                  _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "MCNewWiFiPayloadHandler adding trusted certificate UUID %{public}@ with system keychain? %{public}d",  buf,  0x12u);
                }

                int v21 = v36;
                [v36 addObject:v33];
                self = v35;
                id v22 = v34;
                uint64_t v23 = v49;
              }

              CFRelease(v32);
            }
          }

          else
          {
            v38 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              *(void *)&uint8_t buf[4] = v25;
              _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "MCNewWiFiPayloadHandler certificate UUID %{public}@ referenced by this payload does not exist, skipping.",  buf,  0xCu);
            }
          }
        }

        id v50 = [v22 countByEnumeratingWithState:&v52 objects:v59 count:16];
      }

      while (v50);
    }

    id v8 = v46;
    if ([v21 count]) {
      [v46 setObject:v21 forKey:@"TLSTrustedCertificates"];
    }

    uint64_t v7 = v47;
    id v6 = v48;
    a4 = v45;
    LOBYTE(v11) = v44;
    if (v44)
    {
LABEL_7:
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 certificateUUID]);

      if (!v13)
      {
LABEL_43:
        os_log_t v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v8,  @"EAPClientConfiguration"));
        WiFiNetworkSetProperty(a4, kWiFiNetworkEnterpriseProfile, v41);
        id v42 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v41;
          _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "MCNewWiFiPayloadHandler setEAPConfig succeeded with EAP profile: %{public}@",  buf,  0xCu);
        }

        goto LABEL_46;
      }

      os_log_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v7 certificateUUID]);
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 persistentIDForCertificateUUID:v15]);

      uint64_t v17 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67240192;
        *(_DWORD *)&uint8_t buf[4] = v16 != 0LL;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "MCNewWiFiPayloadHandler handling identity certs? %{public}d",  buf,  8u);
      }

      if (v16)
      {
        *(void *)buf = 0LL;
        EAPSecIdentityHandleCreateSecIdentity(v16, buf);
        if (*(void *)buf && (id v18 = (const void *)EAPSecIdentityHandleCreate(), CFRelease(*(CFTypeRef *)buf), v18))
        {
          [v8 setObject:v18 forKey:@"TLSIdentityHandle"];
          CFRelease(v18);
          id v19 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)os_log_t v51 = 0;
            os_log_t v20 = "MCNewWiFiPayloadHandler set identity handle.";
LABEL_41:
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v20, v51, 2u);
          }
        }

        else
        {
          [v8 setObject:v16 forKey:@"TLSIdentityHandle"];
          id v19 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)os_log_t v51 = 0;
            os_log_t v20 = "MCNewWiFiPayloadHandler set persistent ID as identity handle.";
            goto LABEL_41;
          }
        }
      }

      goto LABEL_43;
    }
  }

  id v39 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_ERROR,  "MCNewWiFiPayloadHandler setEAPConfig failed.",  buf,  2u);
  }

- (void)_updateWiFiCustomSetWithSetID:(id)a3 forSSID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = kWiFiPreferenceCustomNetworksSettingsKey;
  os_log_t v9 = (void *)WiFiManagerClientCopyProperty(self->_manager, kWiFiPreferenceCustomNetworksSettingsKey);
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = [v9 mutableCopy];
    [v11 setObject:v6 forKey:v7];
    WiFiManagerClientSetProperty(self->_manager, v8, v11);
    os_log_t v12 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543362;
      id v15 = v11;
      id v13 = "MCNewWiFiPayloadHandler updated custom settings: %{public}@";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v14, 0xCu);
    }
  }

  else
  {
    id v11 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v6,  v7));
    WiFiManagerClientSetProperty(self->_manager, v8, v11);
    os_log_t v12 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543362;
      id v15 = v6;
      id v13 = "MCNewWiFiPayloadHandler set custom settings: %{public}@";
      goto LABEL_6;
    }
  }
}

- (BOOL)_applyProxyCredential:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 proxyServer]);
  id v7 = [v6 length];
  if (v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLCredentialStorage sharedCredentialStorage]( &OBJC_CLASS___NSURLCredentialStorage,  "sharedCredentialStorage"));
    os_log_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 profile]);
    objc_msgSend(v8, "set_useSystemKeychain:", objc_msgSend(v10, "isInstalledForSystem"));

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 proxyServerPort]);
    if (v11)
    {
      os_log_t v12 = (void *)objc_claimAutoreleasedReturnValue([v5 proxyServerPort]);
      uint64_t v13 = (int)[v12 intValue];
    }

    else
    {
      uint64_t v13 = 80LL;
    }

    id v15 = objc_alloc(&OBJC_CLASS___NSURLProtectionSpace);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v5 proxyServer]);
    uint64_t v17 = -[NSURLProtectionSpace initWithProxyHost:port:type:realm:authenticationMethod:]( v15,  "initWithProxyHost:port:type:realm:authenticationMethod:",  v16,  v13,  NSURLProtectionSpaceHTTP,  0LL,  NSURLAuthenticationMethodDefault);

    id v18 = objc_alloc(&OBJC_CLASS___NSURLProtectionSpace);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v5 proxyServer]);
    os_log_t v20 = -[NSURLProtectionSpace initWithProxyHost:port:type:realm:authenticationMethod:]( v18,  "initWithProxyHost:port:type:realm:authenticationMethod:",  v19,  v13,  NSURLProtectionSpaceHTTPS,  0LL,  NSURLAuthenticationMethodDefault);

    [v8 setDefaultCredential:v4 forProtectionSpace:v17];
    [v8 setDefaultCredential:v4 forProtectionSpace:v20];
  }

  else
  {
    int v14 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v22 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "MCNewWiFiPayloadHandler requires a proxy server to be provided.",  v22,  2u);
    }
  }

  return v7 != 0LL;
}

- (BOOL)_configureEncryptionTypeForWiFiNetwork:(__WiFiNetwork *)a3 payload:(id)a4 outError:(id *)a5
{
  id v8 = a4;
  os_log_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 eapClientConfig]);

  if (v9)
  {
    WiFiNetworkSetWPA(a3, [v8 isWPA]);
    WiFiNetworkSetWEP(a3, [v8 isWEP]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 eapClientConfig]);
    unsigned __int8 v11 = -[MCNewWiFiPayloadHandler _setEAPConfig:onNetwork:](self, "_setEAPConfig:onNetwork:", v10, a3);

    if ((v11 & 1) != 0)
    {
      v40 = @"IE_KEY_WPA_AUTHSELS";
      os_log_t v41 = &off_1000CC110;
      LOBYTE(a5) = 1;
      WiFiNetworkSetProperty( a3,  @"WPA_IE",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v41,  &v40,  1LL));
    }

    else if (a5)
    {
      uint64_t v15 = MCWiFiErrorDomain;
      id v16 = (void *)objc_claimAutoreleasedReturnValue([@"ERROR_WIFI_COULD_NOT_SETUP_EAP" MCAppendGreenteaSuffix]);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v8 ssid]);
      uint64_t v18 = MCErrorArray(v16);
      id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v15,  13004LL,  v19,  MCErrorTypeFatal,  v17,  0LL));

      LOBYTE(a5) = 0;
    }

    goto LABEL_28;
  }

  os_log_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 encryptionType]);
  unsigned int v13 = [v12 isEqualToString:kMCWiFiEncryptionTypeWEP];

  if (v13)
  {
    int v14 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "MCNewWiFiPayloadHandler setting WEP network",  buf,  2u);
    }

    LOBYTE(a5) = 1;
    WiFiNetworkSetWEP(a3, 1LL);
    goto LABEL_28;
  }

  os_log_t v20 = (void *)objc_claimAutoreleasedReturnValue([v8 encryptionType]);
  unsigned int v21 = [v20 isEqualToString:kMCWiFiEncryptionTypeWPA];

  if (v21)
  {
    id v22 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "MCNewWiFiPayloadHandler setting WPA network",  buf,  2u);
    }

    LOBYTE(a5) = 1;
    WiFiNetworkSetWPA(a3, 1LL);
    goto LABEL_28;
  }

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v8 encryptionType]);
  unsigned int v24 = [v23 isEqualToString:kMCWiFiEncryptionTypeWPA2];

  if (v24)
  {
    uint64_t v25 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "MCNewWiFiPayloadHandler setting WPA2 network",  buf,  2u);
    }

    LOBYTE(a5) = 1;
LABEL_26:
    v29 = a3;
    uint64_t v30 = 1LL;
LABEL_27:
    WiFiNetworkSetSAE(v29, 1LL, v30);
    goto LABEL_28;
  }

  id v26 = (void *)objc_claimAutoreleasedReturnValue([v8 encryptionType]);
  unsigned int v27 = [v26 isEqualToString:kMCWiFiEncryptionTypeWPA3];

  if (v27)
  {
    BOOL v28 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "MCNewWiFiPayloadHandler setting WPA3 network",  buf,  2u);
    }

    LOBYTE(a5) = 1;
    v29 = a3;
    uint64_t v30 = 0LL;
    goto LABEL_27;
  }

  os_log_t v31 = (void *)objc_claimAutoreleasedReturnValue([v8 encryptionType]);
  unsigned int v32 = [v31 isEqualToString:kMCWiFiEncryptionTypeAny];

  CFDataRef v33 = _MCLogObjects[0];
  BOOL v34 = os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT);
  if (v32)
  {
    if (v34)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "MCNewWiFiPayloadHandler setting Any-secured network",  buf,  2u);
    }

    LOBYTE(a5) = 1;
    WiFiNetworkSetWEP(a3, 1LL);
    WiFiNetworkSetWPA(a3, 1LL);
    goto LABEL_26;
  }

  if (v34)
  {
    os_log_t v36 = v33;
    v37 = (void *)objc_claimAutoreleasedReturnValue([v8 encryptionType]);
    *(_DWORD *)buf = 138543362;
    id v39 = v37;
    _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "MCNewWiFiPayloadHandler encryption type not recognized: %{public}@",  buf,  0xCu);
  }

  LOBYTE(a5) = 1;
LABEL_28:

  return (char)a5;
}

- (BOOL)_networkServiceRequired
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  unsigned int v3 = [v2 proxyType];
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 qosMarkingConfig]);
  LOBYTE(v5) = 1;
  if (![v4 count] && v3 - 1 >= 2)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v2 proxyUsername]);
    if (v6)
    {
    }

    else
    {
      os_log_t v5 = (os_log_t)objc_claimAutoreleasedReturnValue([v2 proxyPassword]);

      if (v5)
      {
        LOBYTE(v5) = 1;
      }

      else
      {
        os_log_t v7 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
        {
          os_log_t v5 = v7;
          id v8 = (void *)objc_claimAutoreleasedReturnValue([v2 ssid]);
          int v10 = 138543362;
          unsigned __int8 v11 = v8;
          _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "MCNewWiFiPayloadHandler custom service not required for SSID: %{public}@",  (uint8_t *)&v10,  0xCu);

          LOBYTE(v5) = 0;
        }
      }
    }
  }

  return (char)v5;
}

- (BOOL)_configureNetworkServiceForWiFiNetwork:(__WiFiNetwork *)a3 outError:(id *)a4
{
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  SCPreferencesRef v9 = SCPreferencesCreateWithAuthorization(0LL, @"com.apple.settings.wi-fi", 0LL, 0LL);
  if (!v9)
  {
    uint64_t v23 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "MCNewWiFiPayloadHandler cannot create system configuration preferences.",  buf,  2u);
    }

    goto LABEL_144;
  }

  SCPreferencesRef v10 = v9;
  uint64_t v11 = kWiFiPreferenceCustomNetworksSettingsKey;
  os_log_t v12 = (void *)WiFiManagerClientCopyProperty(self->_manager, kWiFiPreferenceCustomNetworksSettingsKey);
  if (!SCPreferencesLock(v10, 1u))
  {
    unsigned int v24 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "MCNewWiFiPayloadHandler cannot lock system configuration preferences.",  buf,  2u);
    }

    CFRelease(v10);
    goto LABEL_144;
  }

  SCPreferencesSynchronize(v10);
  unsigned int v13 = SCNetworkSetCopyAll(v10);
  if (!v13)
  {
    uint64_t v25 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "MCNewWiFiPayloadHandler cannot retrieve network sets from system configuration.",  buf,  2u);
    }

    id v26 = 0LL;
    BOOL v27 = 1;
    goto LABEL_139;
  }

  SEL v162 = a2;
  v166 = a3;
  name = (__CFString *)objc_claimAutoreleasedReturnValue([v8 ssid]);
  uint64_t v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:"));
  v171 = v12;
  v172 = a4;
  uint64_t v165 = v11;
  if (v14)
  {
    uint64_t v15 = (void *)v14;
    v169 = v8;
    if (CFArrayGetCount(v13) >= 1)
    {
      CFIndex v16 = 0LL;
      while (1)
      {
        ValueAtIndex = (const __SCNetworkSet *)CFArrayGetValueAtIndex(v13, v16);
        Setuint64_t ID = (__CFString *)SCNetworkSetGetSetID(ValueAtIndex);
        if (SetID)
        {
        }

        if (++v16 >= CFArrayGetCount(v13)) {
          goto LABEL_10;
        }
      }

      if (ValueAtIndex)
      {
        id v50 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v179 = v15;
          _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "MCNewWiFiPayloadHandler attempting to modify service for custom set ID: %{public}@...",  buf,  0xCu);
        }

        os_log_t v51 = SCNetworkSetCopyServices(ValueAtIndex);
        if (!v51)
        {
          v66 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_ERROR,  "MCNewWiFiPayloadHandler cannot get existing services.",  buf,  2u);
          }

          id v26 = 0LL;
          v173 = 0LL;
          v174 = 0LL;
          id v39 = 0LL;
          os_log_t v47 = 0LL;
          unsigned int v48 = 1;
          int v49 = 1;
          id v8 = v169;
          goto LABEL_131;
        }

        __int128 v52 = v51;
        if (CFArrayGetCount(v51) <= 0)
        {
          __int128 v61 = v52;
        }

        else
        {
          v160 = v15;
          id v39 = 0LL;
          CFIndex v53 = 0LL;
          do
          {
            __int128 v54 = (const __SCNetworkService *)CFArrayGetValueAtIndex(v52, v53);
            SCNetworkInterfaceRef Interface = SCNetworkServiceGetInterface(v54);
            if (Interface)
            {
              os_log_t v56 = Interface;
              while (1)
              {
                CFStringRef InterfaceType = SCNetworkInterfaceGetInterfaceType(v56);
                if (CFEqual(InterfaceType, kSCNetworkInterfaceTypeIEEE80211)) {
                  break;
                }
                os_log_t v56 = SCNetworkInterfaceGetInterface(v56);
                if (!v56) {
                  goto LABEL_82;
                }
              }

              if (!v39)
              {
                int v58 = _MCLogObjects[0];
                if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEFAULT,  "MCNewWiFiPayloadHandler creating a new service...",  buf,  2u);
                }

                v59 = SCNetworkServiceCreate(v10, v56);
                id v39 = v59;
                if (!v59)
                {
                  v118 = _MCLogObjects[0];
                  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)buf = 0;
                    v119 = "MCNewWiFiPayloadHandler cannot create new service.";
                    goto LABEL_189;
                  }

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v8 = a4;
  SCPreferencesRef v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  unsigned int v10 = -[MCNewWiFiPayloadHandler _isWiFiDaemonAvailable](self, "_isWiFiDaemonAvailable");
  uint64_t v11 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t v12 = @"NO";
    if (v10) {
      os_log_t v12 = @"YES";
    }
    *(_DWORD *)buf = 138543362;
    *(void *)v103 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "MCNewWiFiPayloadHandler Wi-Fi daemon is available (install): %{public}@",  buf,  0xCu);
  }

  unsigned int v13 = (const void *)WiFiNetworkCreate(kCFAllocatorDefault, 0LL);
  if (!v13 || (self->_manager ? (char v14 = v10) : (char v14 = 0), (v14 & 1) == 0))
  {
    v29 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      BOOL v30 = self->_manager != 0LL;
      *(_DWORD *)buf = 67240704;
      *(_DWORD *)v103 = v13 != 0LL;
      *(_WORD *)&v103[4] = 1026;
      *(_DWORD *)&v103[6] = v30;
      LOWORD(v104) = 1026;
      *(_DWORD *)((char *)&v104 + 2) = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "MCNewWiFiPayloadHandler cannot create WiFi network. Network? %{public}d, Manager? %{public}d, wifid? %{public}d",  buf,  0x14u);
    }

    uint64_t v31 = MCWiFiErrorDomain;
    unsigned int v32 = (void *)objc_claimAutoreleasedReturnValue([@"ERROR_WIFI_COULD_NOT_CREATE" MCAppendGreenteaSuffix]);
    uint64_t v33 = MCErrorArray(v32);
    CFIndex v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    id v28 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v31,  13003LL,  v34,  MCErrorTypeFatal,  0LL));

LABEL_27:
    if (!v13) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }

  WiFiNetworkSetProperty(v13, @"SSID_STR", [v9 ssid]);
  WiFiNetworkSetProperty( v13,  @"AP_MODE",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 2LL));
  WiFiNetworkSetDirectedState(v13, [v9 isHidden]);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:kMCInstallProfileOptionFilterFlag]);
  unsigned __int8 v16 = [v15 intValue];

  if ((v16 & 2) != 0)
  {
    WiFiNetworkSetProperty(v13, kWiFiAddNetworkOriginatorKey, &off_1000CC070);
    id v17 = [(id)objc_opt_class(self) _originatorIdentifierFromInstallationOptions:v8];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    if (v18) {
      WiFiNetworkAddSIMIdentifier(v13, v18);
    }
    v92 = self;
    id v19 = [(id)objc_opt_class(self) _originatorNameFromInstallationOptions:v8];
    os_log_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    if (v20) {
      WiFiNetworkSetOriginatorName(v13, v20);
    }
    CFIndex v21 = (void *)objc_claimAutoreleasedReturnValue([v9 isFirstAutoJoinRestricted]);
    id v22 = v21;
    if (v21) {
      WiFiNetworkDisableAutoJoinUntilFirstUserJoin(v13, [v21 BOOLValue]);
    }
    os_log_t v23 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v24 = v23;
      uint64_t v25 = a6;
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v9 ssid]);
      *(_DWORD *)buf = 138544130;
      *(void *)v103 = v26;
      *(_WORD *)&v103[8] = 2114;
      CFArrayRef v104 = v20;
      __int16 v105 = 2114;
      v106 = v18;
      __int16 v107 = 2114;
      v108 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "MCNewWiFiPayloadHandler Carrier Profile WiFi originator properties: SSID=%{public}@, name=%{public}@, identifier =%{public}@, autojoin=%{public}@",  buf,  0x2Au);

      a6 = v25;
    }

    self = v92;
  }

  WiFiNetworkSetProperty(v13, kMCPayloadUUIDKey, [v9 UUID]);
  WiFiNetworkSetProperty(v13, kMCPayloadOrganizationKey, [v9 organization]);
  WiFiNetworkSetProperty(v13, kMCPayloadIdentifierKey, [v9 identifier]);
  if (([v9 isWEP] & 1) == 0 && !objc_msgSend(v9, "isWPA"))
  {
    id v28 = 0LL;
LABEL_38:
    id v42 = (void *)objc_claimAutoreleasedReturnValue([v9 domainName]);

    if (v42)
    {
      uint64_t v43 = kWiFiDomainName;
      BOOL v44 = (void *)objc_claimAutoreleasedReturnValue([v9 domainName]);
      WiFiNetworkSetProperty(v13, v43, v44);
    }

    v45 = (void *)objc_claimAutoreleasedReturnValue([v9 HESSID]);

    if (v45)
    {
      uint64_t v46 = kWiFiHESSID;
      os_log_t v47 = (void *)objc_claimAutoreleasedReturnValue([v9 HESSID]);
      WiFiNetworkSetProperty(v13, v46, v47);
    }

    uint64_t v48 = kWiFiSPRoaming;
    CFBooleanRef v49 = kCFBooleanTrue;
    else {
      CFBooleanRef v50 = kCFBooleanFalse;
    }
    WiFiNetworkSetProperty(v13, v48, v50);
    os_log_t v51 = (void *)objc_claimAutoreleasedReturnValue([v9 roamingConsortiumOIs]);
    id v52 = [v51 count];

    if (v52)
    {
      uint64_t v53 = kWiFiRoamingConsortiumOIs;
      __int128 v54 = (void *)objc_claimAutoreleasedReturnValue([v9 roamingConsortiumOIs]);
      WiFiNetworkSetProperty(v13, v53, v54);
    }

    __int128 v55 = (void *)objc_claimAutoreleasedReturnValue([v9 NAIRealmNames]);
    id v56 = [v55 count];

    if (v56)
    {
      uint64_t v57 = kWiFiNaiRealmName;
      int v58 = (void *)objc_claimAutoreleasedReturnValue([v9 NAIRealmNames]);
      WiFiNetworkSetProperty(v13, v57, v58);
    }

    v59 = (void *)objc_claimAutoreleasedReturnValue([v9 MCCAndMNCs]);
    id v60 = [v59 count];

    id v91 = v8;
    if (v60)
    {
      v89 = a6;
      v93 = self;
      __int128 v61 = (void *)objc_claimAutoreleasedReturnValue([v9 MCCAndMNCs]);
      __int128 v62 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v61 count]));

      __int128 v98 = 0u;
      __int128 v99 = 0u;
      __int128 v96 = 0u;
      __int128 v97 = 0u;
      __int128 v63 = (void *)objc_claimAutoreleasedReturnValue([v9 MCCAndMNCs]);
      id v64 = [v63 countByEnumeratingWithState:&v96 objects:v101 count:16];
      if (v64)
      {
        id v65 = v64;
        uint64_t v66 = *(void *)v97;
        do
        {
          for (i = 0LL; i != v65; i = (char *)i + 1)
          {
            if (*(void *)v97 != v66) {
              objc_enumerationMutation(v63);
            }
            __int16 v68 = *(void **)(*((void *)&v96 + 1) + 8LL * (void)i);
            if ([v68 characterAtIndex:3] == 48)
            {
              id v69 = [v68 mutableCopy];
              objc_msgSend(v69, "replaceCharactersInRange:withString:", 3, 1, @"F");
              [v62 addObject:v69];
            }

            else
            {
              [v62 addObject:v68];
            }
          }

          id v65 = [v63 countByEnumeratingWithState:&v96 objects:v101 count:16];
        }

        while (v65);
      }

      WiFiNetworkSetProperty(v13, kWiFiMCCandMNC, v62);
      self = v93;
      CFBooleanRef v49 = kCFBooleanTrue;
      a6 = v89;
    }

    __int16 v70 = (void *)objc_claimAutoreleasedReturnValue([v9 displayedOperatorName]);

    if (v70)
    {
      uint64_t v71 = kWiFiDisplayedOperatorName;
      CFStringRef v72 = (void *)objc_claimAutoreleasedReturnValue([v9 displayedOperatorName]);
      WiFiNetworkSetProperty(v13, v71, v72);
    }

    v73 = (void *)objc_claimAutoreleasedReturnValue([v9 disableAssociationMACRandomization]);

    if (v73)
    {
      os_log_t v74 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        v75 = v74;
        os_log_type_t v76 = (void *)objc_claimAutoreleasedReturnValue([v9 disableAssociationMACRandomization]);
        *(_DWORD *)buf = 138543362;
        *(void *)v103 = v76;
        _os_log_impl( (void *)&_mh_execute_header,  v75,  OS_LOG_TYPE_DEFAULT,  "MCNewWiFiPayloadHandler setting MAC randomization disable to: %{public}@",  buf,  0xCu);
      }

      uint64_t v77 = kWiFiPrivateMacProfileDefaultFeatureToDisable;
      CFStringRef v78 = (void *)objc_claimAutoreleasedReturnValue([v9 disableAssociationMACRandomization]);
      else {
        CFBooleanRef v79 = kCFBooleanFalse;
      }
      WiFiNetworkSetProperty(v13, v77, v79);
    }

    sub_100052CC0();
    v80 = (void *)objc_claimAutoreleasedReturnValue([v9 password]);
    id v81 = [v80 length];

    if (!v81) {
      goto LABEL_82;
    }
    v90 = (void *)objc_claimAutoreleasedReturnValue([v9 password]);
    v82 = self;
    v83 = (void *)objc_claimAutoreleasedReturnValue([v9 ssid]);
    v84 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](v82, "profileHandler"));
    v85 = (void *)objc_claimAutoreleasedReturnValue([v84 profile]);
    id v95 = v28;
    LOWORD(v88) = [v85 isInstalledForSystem];
    +[MCKeychain setString:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:]( &OBJC_CLASS___MCKeychain,  "setString:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:",  v90,  @"AirPort",  v83,  0LL,  0LL,  kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly,  0LL,  v88,  &v95);
    id v86 = v95;

    id v8 = v91;
    self = v82;

    id v28 = v86;
    if (!v86)
    {
LABEL_82:
      if (!-[MCNewWiFiPayloadHandler _networkServiceRequired](self, "_networkServiceRequired")
        || (id v94 = v28,
            -[MCNewWiFiPayloadHandler _configureNetworkServiceForWiFiNetwork:outError:]( self,  "_configureNetworkServiceForWiFiNetwork:outError:",  v13,  &v94),  v87 = v94,  v28,  (id v28 = v87) == 0LL))
      {
        WiFiManagerClientAddNetwork(self->_manager, v13);
        if (([v9 autoJoin] & 1) == 0)
        {
          WiFiManagerClientDisableNetwork(self->_manager, v13);
          WiFiManagerClientEnable(self->_manager);
        }
      }
    }

    goto LABEL_27;
  }

  id v100 = 0LL;
  unsigned int v27 = -[MCNewWiFiPayloadHandler _configureEncryptionTypeForWiFiNetwork:payload:outError:]( self,  "_configureEncryptionTypeForWiFiNetwork:payload:outError:",  v13,  v9,  &v100);
  id v28 = v100;
  if (v27) {
    goto LABEL_38;
  }
LABEL_28:
  CFRelease(v13);
LABEL_29:
  id v35 = _MCLogObjects[0];
  if (v28)
  {
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)v103 = v28;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "MCNewWiFiPayloadHandler failed installWithInstaller with error: %{public}@",  buf,  0xCu);
    }

    if (a6)
    {
      uint64_t v36 = MCWiFiErrorDomain;
      v37 = (void *)objc_claimAutoreleasedReturnValue([@"ERROR_WIFI_COULD_NOT_INSTALL" MCAppendGreenteaSuffix]);
      CFStringRef v38 = (void *)objc_claimAutoreleasedReturnValue([v9 ssid]);
      uint64_t v39 = MCErrorArray(v37);
      v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
      *a6 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:",  v36,  13000LL,  v40,  v28,  MCErrorTypeFatal,  v38,  0LL));
    }
  }

  else if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "MCNewWiFiPayloadHandler successfully completed installWithInstaller with no errors.",  buf,  2u);
  }

  return v28 == 0LL;
}

+ (id)_originatorIdentifierFromInstallationOptions:(id)a3
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKey:kMCInstallProfileOptionCarrierIdentifier]);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    id v5 = v3;
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

+ (id)_originatorNameFromInstallationOptions:(id)a3
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKey:kMCInstallProfileOptionCarrierName]);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    id v5 = v3;
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

- (BOOL)isInstalled
{
  manager = self->_manager;
  if (manager && (uint64_t v4 = (const __CFArray *)WiFiManagerClientCopyNetworks(manager, a2)) != 0LL)
  {
    id v5 = v4;
    CFIndex Count = CFArrayGetCount(v4);
    if (Count < 1)
    {
      char v8 = 0;
    }

    else
    {
      CFIndex v7 = Count;
      char v8 = 0;
      CFIndex v9 = 0LL;
      uint64_t v10 = kMCPayloadUUIDKey;
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v5, v9);
        if (ValueAtIndex)
        {
          uint64_t Property = WiFiNetworkGetProperty(ValueAtIndex, v10);
          unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(Property);
          if (v13)
          {
            char v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 UUID]);
            unsigned int v16 = [v13 isEqualToString:v15] ^ 1;
          }

          else
          {
            LOBYTE(v16) = 1;
          }

          v8 |= v16;
        }

        ++v9;
      }

      while (v7 != v9);
    }

    CFRelease(v5);
  }

  else
  {
    char v8 = 0;
  }

  return v8 & 1;
}

- (BOOL)_isWiFiDaemonAvailable
{
  manager = self->_manager;
  if (!manager) {
    return 0;
  }
  unsigned int v3 = (const __CFArray *)WiFiManagerClientCopyDevices(manager, a2);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  BOOL v5 = CFArrayGetCount(v3) > 0;
  CFRelease(v4);
  return v5;
}

- (void)_removeProxyCredential
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 proxyServer]);
  if (v4)
  {
    BOOL v5 = (void *)v4;
    unsigned int v6 = [v3 proxyType];

    if (v6 == 2)
    {
      CFIndex v7 = (void *)objc_claimAutoreleasedReturnValue([v3 proxyServerPort]);
      if (v7)
      {
        char v8 = (void *)objc_claimAutoreleasedReturnValue([v3 proxyServerPort]);
        uint64_t v9 = (int)[v8 intValue];
      }

      else
      {
        uint64_t v9 = 80LL;
      }

      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLCredentialStorage sharedCredentialStorage]( &OBJC_CLASS___NSURLCredentialStorage,  "sharedCredentialStorage"));
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
      os_log_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 profile]);
      objc_msgSend(v10, "set_useSystemKeychain:", objc_msgSend(v12, "isInstalledForSystem"));

      unsigned int v13 = objc_alloc(&OBJC_CLASS___NSURLProtectionSpace);
      char v14 = (void *)objc_claimAutoreleasedReturnValue([v3 proxyServer]);
      uint64_t v15 = -[NSURLProtectionSpace initWithProxyHost:port:type:realm:authenticationMethod:]( v13,  "initWithProxyHost:port:type:realm:authenticationMethod:",  v14,  v9,  NSURLProtectionSpaceHTTP,  0LL,  NSURLAuthenticationMethodDefault);

      unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v10 defaultCredentialForProtectionSpace:v15]);
      if (v16)
      {
        uint64_t v25 = NSURLCredentialStorageRemoveSynchronizableCredentials;
        id v26 = &__kCFBooleanTrue;
        id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
        [v10 removeCredential:v16 forProtectionSpace:v15 options:v17];
      }

      uint64_t v18 = objc_alloc(&OBJC_CLASS___NSURLProtectionSpace);
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v3 proxyServer]);
      os_log_t v20 = -[NSURLProtectionSpace initWithProxyHost:port:type:realm:authenticationMethod:]( v18,  "initWithProxyHost:port:type:realm:authenticationMethod:",  v19,  v9,  NSURLProtectionSpaceHTTPS,  0LL,  NSURLAuthenticationMethodDefault);

      CFIndex v21 = (void *)objc_claimAutoreleasedReturnValue([v10 defaultCredentialForProtectionSpace:v20]);
      if (v21)
      {
        os_log_t v23 = NSURLCredentialStorageRemoveSynchronizableCredentials;
        unsigned int v24 = &__kCFBooleanTrue;
        id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
        [v10 removeCredential:v21 forProtectionSpace:v20 options:v22];
      }
    }
  }
}

- (void)_removeNetworkWithUUID:(id)a3
{
  id v4 = a3;
  BOOL v5 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v24 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "MCNewWiFiPayloadHandler removing WiFi network with UUID: %{public}@",  buf,  0xCu);
  }

  manager = self->_manager;
  if (manager)
  {
    char v8 = (const __CFArray *)WiFiManagerClientCopyNetworks(manager, v6);
    if (v8)
    {
      uint64_t v9 = v8;
      id v22 = self;
      CFIndex Count = CFArrayGetCount(v8);
      uint64_t v11 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v24) = Count;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "MCNewWiFiPayloadHandler iterating over %d WiFi networks",  buf,  8u);
      }

      if (Count >= 1)
      {
        CFIndex v12 = 0LL;
        uint64_t v13 = kMCPayloadUUIDKey;
        while (1)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v9, v12);
          uint64_t Property = WiFiNetworkGetProperty(ValueAtIndex, v13);
          unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(Property);
          SSuint64_t ID = WiFiNetworkGetSSID(ValueAtIndex);
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(SSID);
          id v19 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            id v24 = v18;
            __int16 v25 = 2114;
            id v26 = v16;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "MCNewWiFiPayloadHandler considering WiFi network %{public}@ with payload UUID: %{public}@",  buf,  0x16u);
          }

          if (Count == ++v12) {
            goto LABEL_20;
          }
        }

        CFIndex v21 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v24 = v18;
          __int16 v25 = 2114;
          id v26 = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "MCNewWiFiPayloadHandler calling WiFiManagerClientRemoveNetwork() for WiFi network %{public}@ with payloa d UUID: %{public}@",  buf,  0x16u);
        }

        WiFiNetworkIsEAP(ValueAtIndex);
        WiFiManagerClientRemoveNetwork(v22->_manager, ValueAtIndex);
      }

- (void)setAside
{
  manager = self->_manager;
  if (manager)
  {
    id v4 = (const __CFArray *)WiFiManagerClientCopyNetworks(manager, a2);
    if (v4)
    {
      BOOL v5 = v4;
      CFIndex Count = CFArrayGetCount(v4);
      if (Count >= 1)
      {
        CFIndex v7 = Count;
        CFIndex v8 = 0LL;
        uint64_t v9 = kMCPayloadUUIDKey;
        while (1)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v5, v8);
          uint64_t Property = WiFiNetworkGetProperty(ValueAtIndex, v9);
          CFIndex v12 = (void *)objc_claimAutoreleasedReturnValue(Property);
          if (v12)
          {
            uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
            char v14 = (void *)objc_claimAutoreleasedReturnValue([v13 UUID]);
            unsigned int v15 = [v12 isEqualToString:v14];

            if (v15) {
              break;
            }
          }

          if (v7 == ++v8) {
            goto LABEL_11;
          }
        }

        unsigned int v16 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString MCMakeUUID](&OBJC_CLASS___NSString, "MCMakeUUID"));
        setAsideUUuint64_t ID = self->_setAsideUUID;
        self->_setAsideUUuint64_t ID = v16;

        WiFiNetworkSetProperty(ValueAtIndex, v9, self->_setAsideUUID);
        WiFiManagerClientUpdateNetwork(self->_manager, ValueAtIndex);
        WiFiNetworkIsEAP(ValueAtIndex);
      }

- (void)unsetAside
{
  if (self->_manager)
  {
    id v32 = (id)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
    unsigned int v4 = [v3 isSetAside];

    if (v4)
    {
      uint64_t v6 = (const __CFArray *)WiFiManagerClientCopyNetworks(self->_manager, v5);
      if (v6)
      {
        CFIndex v7 = v6;
        CFIndex Count = CFArrayGetCount(v6);
        if (Count >= 1)
        {
          CFIndex v9 = Count;
          CFIndex v10 = 0LL;
          uint64_t v11 = kMCPayloadUUIDKey;
          while (1)
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v7, v10);
            uint64_t Property = WiFiNetworkGetProperty(ValueAtIndex, v11);
            char v14 = (void *)objc_claimAutoreleasedReturnValue(Property);
            unsigned int v15 = v14;
            if (v14)
            {
            }

            if (v9 == ++v10) {
              goto LABEL_14;
            }
          }

          WiFiNetworkSetProperty(ValueAtIndex, v11, [v32 UUID]);
          WiFiManagerClientUpdateNetwork(self->_manager, ValueAtIndex);
          uint64_t v16 = WiFiNetworkGetProperty(ValueAtIndex, kWiFiPreferenceCustomNetworksSettingsKey);
          if (v16)
          {
            uint64_t v17 = v16;
            id v18 = (void *)objc_claimAutoreleasedReturnValue([v32 ssid]);
            -[MCNewWiFiPayloadHandler _updateWiFiCustomSetWithSetID:forSSID:]( self,  "_updateWiFiCustomSetWithSetID:forSSID:",  v17,  v18);
          }

          WiFiNetworkIsEAP(ValueAtIndex);
        }

- (void)remove
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  unsigned int v4 = [v3 isSetAside];
  uint64_t v5 = &stru_1000C4568;
  if (v4) {
    uint64_t v5 = @"set-aside ";
  }
  uint64_t v6 = v5;

  CFIndex v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  if ([v7 isSetAside])
  {
    CFIndex v8 = self->_setAsideUUID;
  }

  else
  {
    CFIndex v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    CFIndex v8 = (NSString *)objc_claimAutoreleasedReturnValue([v9 UUID]);
  }

  CFIndex v10 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 138543618;
    unsigned int v27 = v6;
    __int16 v28 = 2114;
    v29 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "MCNewWiFiPayloadHandler removing %{public}@WiFi payload with UUID: %{public}@",  (uint8_t *)&v26,  0x16u);
  }

  unsigned int v11 = -[MCNewWiFiPayloadHandler _isWiFiDaemonAvailable](self, "_isWiFiDaemonAvailable");
  CFIndex v12 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = @"NO";
    if (v11) {
      uint64_t v13 = @"YES";
    }
    int v26 = 138543362;
    unsigned int v27 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "MCNewWiFiPayloadHandler Wi-Fi daemon is available (remove): %{public}@",  (uint8_t *)&v26,  0xCu);
  }

  if (!self->_manager)
  {
    id v18 = _MCLogObjects[0];
    if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    int v26 = 138543618;
    unsigned int v27 = v6;
    __int16 v28 = 2114;
    v29 = v8;
    id v19 = "MCNewWiFiPayloadHandler unable to remove %{public}@WiFi payload with UUID: %{public}@ - no manager";
LABEL_20:
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v26, 0x16u);
    goto LABEL_27;
  }

  if ((v11 & 1) == 0)
  {
    id v18 = _MCLogObjects[0];
    if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    int v26 = 138543618;
    unsigned int v27 = v6;
    __int16 v28 = 2114;
    v29 = v8;
    id v19 = "MCNewWiFiPayloadHandler unable to remove %{public}@WiFi payload with UUID: %{public}@ - wifid not available";
    goto LABEL_20;
  }

  char v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  unsigned int v16 = [v15 isSetAside];

  if (v16)
  {
    -[MCNewWiFiPayloadHandler _removeNetworkWithUUID:](self, "_removeNetworkWithUUID:", self->_setAsideUUID);
    setAsideUUuint64_t ID = self->_setAsideUUID;
    self->_setAsideUUuint64_t ID = 0LL;
  }

  else
  {
    os_log_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    CFIndex v21 = (void *)objc_claimAutoreleasedReturnValue([v20 UUID]);
    -[MCNewWiFiPayloadHandler _removeNetworkWithUUID:](self, "_removeNetworkWithUUID:", v21);

    -[MCNewWiFiPayloadHandler _removeProxyCredential](self, "_removeProxyCredential");
  }

  id v22 = (__CFString *)objc_claimAutoreleasedReturnValue([v14 credentialUUID]);
  if (v22)
  {
    os_log_t v23 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 138543362;
      unsigned int v27 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "MCNewWiFiPayloadHandler removing credential with UUID: %{public}@",  (uint8_t *)&v26,  0xCu);
    }

    CFPropertyListRef v24 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
    __int16 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 profile]);
    +[MCKeychain removeItemForService:account:label:description:useSystemKeychain:group:]( MCKeychain,  "removeItemForService:account:label:description:useSystemKeychain:group:",  @"MCWiFiCredential",  v22,  0,  0,  [v25 isInstalledForSystem],  0);
  }

LABEL_27:
}

+ (id)managedWiFiNetworkNames
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v4 = qword_1000DC150;
  if (qword_1000DC150) {
    goto LABEL_5;
  }
  qword_1000DC150 = WiFiManagerClientCreate(kCFAllocatorSystemDefault, 0LL);
  uint64_t v5 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    int v22 = 67109120;
    LODWORD(v23) = qword_1000DC150 != 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "MCNewWiFiPayloadHandler attempted to create WiFiManagerClient and got success status: %d",  (uint8_t *)&v22,  8u);
  }

  uint64_t v4 = qword_1000DC150;
  if (qword_1000DC150)
  {
LABEL_5:
    uint64_t v6 = (const __CFArray *)WiFiManagerClientCopyNetworks(v4, v2);
    CFIndex v7 = v6;
    if (v6) {
      CFIndex Count = CFArrayGetCount(v6);
    }
    else {
      CFIndex Count = 0LL;
    }
    CFIndex v9 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      int v22 = 134217984;
      CFIndex v23 = Count;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "MCNewWiFiPayloadHandler checking %ld networks for profile-installed configurations...",  (uint8_t *)&v22,  0xCu);
    }

    if (Count >= 1)
    {
      CFIndex v10 = 0LL;
      uint64_t v11 = kMCPayloadUUIDKey;
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v7, v10);
        if (ValueAtIndex)
        {
          uint64_t v13 = ValueAtIndex;
          if (WiFiNetworkGetProperty(ValueAtIndex, v11))
          {
            SSuint64_t ID = WiFiNetworkGetSSID(v13);
            if (SSID)
            {
              [v3 addObject:SSID];
            }

            else
            {
              os_log_t v19 = _MCLogObjects[0];
              if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
              {
                LOWORD(v22) = 0;
                unsigned int v16 = v19;
                uint64_t v17 = "MCNewWiFiPayloadHandler skipped Wi-Fi network missing SSID";
                goto LABEL_22;
              }
            }
          }

          else
          {
            os_log_t v18 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
            {
              LOWORD(v22) = 0;
              unsigned int v16 = v18;
              uint64_t v17 = "MCNewWiFiPayloadHandler skipped Wi-Fi network missing UUID";
              goto LABEL_22;
            }
          }
        }

        else
        {
          os_log_t v15 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
          {
            LOWORD(v22) = 0;
            unsigned int v16 = v15;
            uint64_t v17 = "MCNewWiFiPayloadHandler skipped non-existent Wi-Fi network";
LABEL_22:
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, v17, (uint8_t *)&v22, 2u);
          }
        }

        ++v10;
      }

      while (Count != v10);
    }

    if (v7) {
      CFRelease(v7);
    }
  }

  os_log_t v20 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    int v22 = 138543362;
    CFIndex v23 = (CFIndex)v3;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "MCNewWiFiPayloadHandler managed Wi-Fi networks: %{public}@",  (uint8_t *)&v22,  0xCu);
  }

  return v3;
}

- (void).cxx_destruct
{
}

@end