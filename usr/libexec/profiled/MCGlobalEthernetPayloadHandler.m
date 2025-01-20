@interface MCGlobalEthernetPayloadHandler
- (BOOL)_install:(id)a3 username:(id)a4 password:(id)a5 identity:(__SecIdentity *)a6;
- (BOOL)_isMetadataValid:(__EAPOLClientProfile *)a3;
- (BOOL)_setEAPConfig:(id)a3;
- (BOOL)_uninstall;
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (MCGlobalEthernetPayloadHandler)initWithPayload:(id)a3 profileHandler:(id)a4;
- (id)profileMetadata;
- (void)remove;
- (void)setAside;
- (void)unsetAside;
@end

@implementation MCGlobalEthernetPayloadHandler

- (MCGlobalEthernetPayloadHandler)initWithPayload:(id)a3 profileHandler:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MCGlobalEthernetPayloadHandler;
  return -[MCNewPayloadHandler initWithPayload:profileHandler:](&v5, "initWithPayload:profileHandler:", a3, a4);
}

- (id)profileMetadata
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 UUID]);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v3,  kMCPayloadUUIDKey));

  return v4;
}

- (BOOL)_install:(id)a3 username:(id)a4 password:(id)a5 identity:(__SecIdentity *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  uint64_t v14 = EAPOLClientConfigurationCreateWithAuthorization(0LL, 0LL);
  if (v14)
  {
    v15 = (const void *)v14;
    uint64_t SystemEthernetProfile = EAPOLClientConfigurationGetSystemEthernetProfile();
    if (SystemEthernetProfile
      && !-[MCGlobalEthernetPayloadHandler _isMetadataValid:](self, "_isMetadataValid:", SystemEthernetProfile))
    {
      os_log_t v28 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        v29 = v28;
        int v49 = 138543362;
        id v50 = (id)objc_opt_class(self);
        id v30 = v50;
        v31 = "%{public}@ payload of this type is already installed";
LABEL_26:
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, v31, (uint8_t *)&v49, 0xCu);
      }
    }

    else
    {
      uint64_t v17 = EAPOLClientProfileCreate(v15);
      if (v17)
      {
        v18 = (const void *)v17;
        if (EAPOLClientProfileGetID(v17))
        {
          uint64_t v19 = EAPOLClientItemIDCreateWithProfile(v18);
          if (v19)
          {
            v20 = (const void *)v19;
            v21 = (void *)objc_claimAutoreleasedReturnValue([v13 displayName]);

            if (v21)
            {
              v22 = (void *)objc_claimAutoreleasedReturnValue([v13 displayName]);
              EAPOLClientProfileSetUserDefinedName(v18, v22);
            }

            EAPOLClientProfileSetAuthenticationProperties(v18, v10);
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[MCGlobalEthernetPayloadHandler profileMetadata](self, "profileMetadata"));
            if (v23
              && !EAPOLClientProfileSetInformation( v18,  @"com.apple.managedconfiguration.profiled",  v23))
            {
              os_log_t v38 = _MCLogObjects[0];
              if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
              {
                v39 = v38;
                int v49 = 138543362;
                id v50 = (id)objc_opt_class(self);
                id v40 = v50;
                _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_ERROR,  "%{public}@ EAPOLClientProfileSetInformation() failed",  (uint8_t *)&v49,  0xCu);
              }

              goto LABEL_46;
            }

            if (v11 && v12 && !EAPOLClientItemIDSetPasswordItem(v20, 3LL, v11, v12))
            {
              os_log_t v46 = _MCLogObjects[0];
              if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
                goto LABEL_46;
              }
              v42 = v46;
              int v49 = 138543362;
              id v50 = (id)objc_opt_class(self);
              id v43 = v50;
              v44 = "%{public}@ EAPOLClientItemIDSetPasswordItem() failed";
            }

            else if (a6 && !EAPOLClientItemIDSetIdentity(v20, 3LL))
            {
              os_log_t v45 = _MCLogObjects[0];
              if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
                goto LABEL_46;
              }
              v42 = v45;
              int v49 = 138543362;
              id v50 = (id)objc_opt_class(self);
              id v43 = v50;
              v44 = "%{public}@ EAPOLClientItemIDSetIdentity() failed";
            }

            else
            {
              if (EAPOLClientConfigurationSetSystemEthernetProfile(v15, v18))
              {
                if (EAPOLClientConfigurationSave(v15))
                {
                  BOOL v24 = 1;
LABEL_47:
                  CFRelease(v20);
                  goto LABEL_48;
                }

                os_log_t v47 = _MCLogObjects[0];
                if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
                {
                  v42 = v47;
                  int v49 = 138543362;
                  id v50 = (id)objc_opt_class(self);
                  id v43 = v50;
                  v44 = "%{public}@ EAPOLClientConfigurationSave() failed";
                  goto LABEL_45;
                }

- (BOOL)_uninstall
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  uint64_t v4 = EAPOLClientConfigurationCreateWithAuthorization(0LL, 0LL);
  if (v4)
  {
    objc_super v5 = (const void *)v4;
    if (self->_setAsideProfileID) {
      uint64_t ProfileWithID = EAPOLClientConfigurationGetProfileWithID(v4);
    }
    else {
      uint64_t ProfileWithID = EAPOLClientConfigurationGetSystemEthernetProfile(v4);
    }
    uint64_t v11 = ProfileWithID;
    if (ProfileWithID)
    {
      if (-[MCGlobalEthernetPayloadHandler _isMetadataValid:](self, "_isMetadataValid:", ProfileWithID))
      {
        uint64_t v12 = EAPOLClientItemIDCreateWithProfile(v11);
        if (v12)
        {
          v13 = (const void *)v12;
          if (!EAPOLClientItemIDRemovePasswordItem(v12, 3LL))
          {
            os_log_t v14 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
            {
              v15 = v14;
              int v37 = 138543362;
              id v38 = (id)objc_opt_class(self);
              id v16 = v38;
              _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%{public}@ EAPOLClientItemIDRemovePasswordItem() failed",  (uint8_t *)&v37,  0xCu);
            }
          }

          if (!EAPOLClientItemIDSetIdentity(v13, 3LL))
          {
            os_log_t v17 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
            {
              v18 = v17;
              uint64_t v19 = (void *)objc_opt_class(self);
              int v37 = 138543362;
              id v38 = v19;
              id v20 = v19;
              _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%{public}@ EAPOLClientItemIDSetIdentity() failed",  (uint8_t *)&v37,  0xCu);
            }
          }

          if (self->_setAsideProfileID || EAPOLClientConfigurationSetSystemEthernetProfile(v5, 0LL))
          {
            if (EAPOLClientConfigurationRemoveProfile(v5, v11))
            {
              if (EAPOLClientConfigurationSave(v5))
              {
                BOOL v10 = 1;
LABEL_40:
                CFRelease(v13);
                goto LABEL_30;
              }

              os_log_t v33 = _MCLogObjects[0];
              if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
              {
                v29 = v33;
                v34 = (void *)objc_opt_class(self);
                int v37 = 138543362;
                id v38 = v34;
                id v31 = v34;
                os_log_t v32 = "%{public}@ EAPOLClientConfigurationSave() failed";
                goto LABEL_38;
              }
            }

            else
            {
              os_log_t v28 = _MCLogObjects[0];
              if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
              {
                v29 = v28;
                id v30 = (void *)objc_opt_class(self);
                int v37 = 138543362;
                id v38 = v30;
                id v31 = v30;
                os_log_t v32 = "%{public}@ EAPOLClientConfigurationRemoveProfile() failed";
LABEL_38:
                _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, v32, (uint8_t *)&v37, 0xCu);
              }
            }
          }

          else
          {
            os_log_t v35 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
            {
              v29 = v35;
              v36 = (void *)objc_opt_class(self);
              int v37 = 138543362;
              id v38 = v36;
              id v31 = v36;
              os_log_t v32 = "%{public}@ EAPOLClientConfigurationSetSystemEthernetProfile() failed";
              goto LABEL_38;
            }
          }

          BOOL v10 = 0;
          goto LABEL_40;
        }

        os_log_t v26 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          v22 = v26;
          int v37 = 138543362;
          id v38 = (id)objc_opt_class(self);
          id v23 = v38;
          BOOL v24 = "%{public}@ EAPOLClientItemIDCreateWithProfile() returned NULL";
          goto LABEL_28;
        }

- (BOOL)_setEAPConfig:(id)a3
{
  id v4 = a3;
  CFTypeRef cf = 0LL;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  id v6 = [v4 mutableCopy];
  if ([v5 usernameRequired]
    && (os_log_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 username]), v7, !v7))
  {
    os_log_t v10 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = v10;
      *(_DWORD *)buf = 138543362;
      id v75 = (id)objc_opt_class(self);
      id v12 = v75;
      v13 = "%{public}@ username is not available";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v13, buf, 0xCu);
    }
  }

  else
  {
    if (![v5 passwordRequired]
      || (v8 = (void *)objc_claimAutoreleasedReturnValue([v5 password]), v8, v8))
    {
      int v9 = 1;
      goto LABEL_12;
    }

    os_log_t v14 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = v14;
      *(_DWORD *)buf = 138543362;
      id v75 = (id)objc_opt_class(self);
      id v12 = v75;
      v13 = "%{public}@ password is not available";
      goto LABEL_10;
    }
  }

  int v9 = 0;
LABEL_12:
  v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"TLSTrustedCertificates"]);

  if (v15)
  {
    if (!v9) {
      goto LABEL_48;
    }
  }

  else
  {
    int v63 = v9;
    v64 = v6;
    id v66 = v4;
    v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v69 = 0u;
    __int128 v70 = 0u;
    __int128 v71 = 0u;
    __int128 v72 = 0u;
    v65 = v5;
    id obj = (id)objc_claimAutoreleasedReturnValue([v5 payloadCertificateAnchorUUIDs]);
    id v16 = [obj countByEnumeratingWithState:&v69 objects:v80 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v70;
      do
      {
        for (i = 0LL; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v70 != v18) {
            objc_enumerationMutation(obj);
          }
          id v20 = *(void **)(*((void *)&v69 + 1) + 8LL * (void)i);
          os_log_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
          v22 = (void *)objc_claimAutoreleasedReturnValue([v21 persistentIDForCertificateUUID:v20]);

          if (v22)
          {
            id v23 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
            BOOL v24 = (void *)objc_claimAutoreleasedReturnValue([v23 profile]);
            id v25 = [v24 isInstalledForSystem];

            os_log_t v26 = (__SecCertificate *)+[MCKeychain copyCertificateWithPersistentID:useSystemKeychain:]( &OBJC_CLASS___MCKeychain,  "copyCertificateWithPersistentID:useSystemKeychain:",  v22,  v25);
            if (v26)
            {
              id v27 = v26;
              CFDataRef v28 = SecCertificateCopyData(v26);
              if (v28)
              {
                os_log_t v29 = _MCLogObjects[0];
                if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
                {
                  id v30 = v29;
                  id v31 = (void *)objc_opt_class(self);
                  *(_DWORD *)buf = 138543874;
                  id v75 = v31;
                  __int16 v76 = 2114;
                  id v77 = v20;
                  __int16 v78 = 1026;
                  int v79 = (int)v25;
                  id v32 = v31;
                  _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "%{public}@ adding trusted certificate UUID %{public}@ with system keychain? %{public}d",  buf,  0x1Cu);
                }

                [v67 addObject:v28];
              }

              CFRelease(v27);
            }
          }

          else
          {
            os_log_t v33 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
            {
              v34 = v33;
              os_log_t v35 = (void *)objc_opt_class(self);
              *(_DWORD *)buf = 138543618;
              id v75 = v35;
              __int16 v76 = 2114;
              id v77 = v20;
              id v36 = v35;
              _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "%{public}@ certificate UUID %{public}@ referenced by this payload does not exist, skipping.",  buf,  0x16u);
            }
          }
        }

        id v17 = [obj countByEnumeratingWithState:&v69 objects:v80 count:16];
      }

      while (v17);
    }

    id v6 = v64;
    if ([v67 count]) {
      [v64 setObject:v67 forKey:@"TLSTrustedCertificates"];
    }

    objc_super v5 = v65;
    id v4 = v66;
    if (!v63) {
      goto LABEL_48;
    }
  }

  int v37 = (void *)objc_claimAutoreleasedReturnValue([v5 certificateUUID]);

  if (v37)
  {
    id v38 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
    v39 = (void *)objc_claimAutoreleasedReturnValue([v5 certificateUUID]);
    id v40 = (void *)objc_claimAutoreleasedReturnValue([v38 persistentIDForCertificateUUID:v39]);

    os_log_t v41 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      v42 = v41;
      id v43 = (void *)objc_opt_class(self);
      *(_DWORD *)buf = 138543618;
      id v75 = v43;
      __int16 v76 = 1026;
      LODWORD(v77) = v40 != 0LL;
      id v44 = v43;
      _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "%{public}@ handling identity certs? %{public}d",  buf,  0x12u);
    }

    if (v40 && (EAPSecIdentityHandleCreateSecIdentity(v40, &cf) || !cf))
    {
      os_log_t v54 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        v55 = v54;
        v56 = (void *)objc_opt_class(self);
        *(_DWORD *)buf = 138543362;
        id v75 = v56;
        id v57 = v56;
        _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "%{public}@ EAPSecIdentityHandleCreateSecIdentity() failed",  buf,  0xCu);
      }

      goto LABEL_48;
    }
  }

  os_log_t v45 = (void *)objc_claimAutoreleasedReturnValue([v5 username]);
  os_log_t v46 = (void *)objc_claimAutoreleasedReturnValue([v45 dataUsingEncoding:4]);

  os_log_t v47 = (void *)objc_claimAutoreleasedReturnValue([v5 password]);
  v48 = (void *)objc_claimAutoreleasedReturnValue([v47 dataUsingEncoding:4]);

  LODWORD(v47) = -[MCGlobalEthernetPayloadHandler _install:username:password:identity:]( self,  "_install:username:password:identity:",  v6,  v46,  v48,  cf);
  if (!(_DWORD)v47)
  {
LABEL_48:
    os_log_t v58 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v59 = v58;
      v60 = (void *)objc_opt_class(self);
      *(_DWORD *)buf = 138543362;
      id v75 = v60;
      id v61 = v60;
      _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "%{public}@ installation failed.", buf, 0xCu);
    }

    BOOL v53 = 0;
    goto LABEL_51;
  }

  os_log_t v49 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    id v50 = v49;
    v51 = (void *)objc_opt_class(self);
    *(_DWORD *)buf = 138543618;
    id v75 = v51;
    __int16 v76 = 2114;
    id v77 = v6;
    id v52 = v51;
    _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "%{public}@ installation succeeded with EAP profile: %{public}@",  buf,  0x16u);
  }

  BOOL v53 = 1;
LABEL_51:
  if (cf) {
    CFRelease(cf);
  }

  return v53;
}

- (BOOL)_isMetadataValid:(__EAPOLClientProfile *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  uint64_t Information = EAPOLClientProfileGetInformation(a3, @"com.apple.managedconfiguration.profiled");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(Information);
  os_log_t v7 = v6;
  if (!v6) {
    goto LABEL_5;
  }
  uint64_t v8 = kMCPayloadUUIDKey;
  int v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:kMCPayloadUUIDKey]);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString);
  char isKindOfClass = objc_opt_isKindOfClass(v9, v10);

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_5;
  }
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v8]);
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

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload", a3, a4, a5));
  int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 eapClientConfiguration]);

  if (!v9) {
    goto LABEL_6;
  }
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 eapClientConfiguration]);
  unsigned __int8 v11 = -[MCGlobalEthernetPayloadHandler _setEAPConfig:](self, "_setEAPConfig:", v10);

  if ((v11 & 1) == 0)
  {
    if (!a6) {
      goto LABEL_7;
    }
    uint64_t v12 = MCGlobalEthernetErrorDomain;
    uint64_t v13 = MCErrorArray(@"ERROR_GLOBAL_ETHERNET_INSTALL_FAILURE");
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    *a6 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v12,  62000LL,  v14,  MCErrorTypeFatal,  0LL));

LABEL_6:
    LOBYTE(a6) = 0;
    goto LABEL_7;
  }

  LOBYTE(a6) = 1;
LABEL_7:

  return (char)a6;
}

- (void)remove
{
  if (!-[MCGlobalEthernetPayloadHandler _uninstall](self, "_uninstall"))
  {
    os_log_t v3 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      id v4 = v3;
      int v11 = 138543362;
      id v12 = (id)objc_opt_class(self);
      id v5 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "%{public}@ uninstallation failed.",  (uint8_t *)&v11,  0xCu);
    }
  }

  os_log_t v6 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    os_log_t v7 = v6;
    uint64_t v8 = (void *)objc_opt_class(self);
    int v11 = 138543362;
    id v12 = v8;
    id v9 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%{public}@ uninstallation succeeded",  (uint8_t *)&v11,  0xCu);
  }

  setAsideProfileID = self->_setAsideProfileID;
  self->_setAsideProfileID = 0LL;
}

- (void)setAside
{
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  setAsideProfileuint64_t ID = self->_setAsideProfileID;
  self->_setAsideProfileuint64_t ID = 0LL;

  uint64_t v5 = EAPOLClientConfigurationCreateWithAuthorization(0LL, 0LL);
  if (v5)
  {
    os_log_t v6 = (const void *)v5;
    uint64_t SystemEthernetProfile = EAPOLClientConfigurationGetSystemEthernetProfile(v5);
    if (SystemEthernetProfile)
    {
      uint64_t v8 = SystemEthernetProfile;
      if (-[MCGlobalEthernetPayloadHandler _isMetadataValid:](self, "_isMetadataValid:", SystemEthernetProfile))
      {
        uint64_t ID = EAPOLClientProfileGetID(v8);
        uint64_t v10 = (NSString *)objc_claimAutoreleasedReturnValue(ID);
        int v11 = self->_setAsideProfileID;
        self->_setAsideProfileuint64_t ID = v10;

        if (self->_setAsideProfileID)
        {
          if (EAPOLClientConfigurationSetSystemEthernetProfile(v6, 0LL))
          {
            os_log_t v12 = _MCLogObjects[0];
            if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
              goto LABEL_20;
            }
            uint64_t v13 = v12;
            int v23 = 138543362;
            id v24 = (id)objc_opt_class(self);
            id v14 = v24;
            BOOL v15 = "%{public}@ EAPOLClientConfigurationSave() failed";
            goto LABEL_19;
          }

          os_log_t v22 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          {
            uint64_t v13 = v22;
            int v23 = 138543362;
            id v24 = (id)objc_opt_class(self);
            id v14 = v24;
            BOOL v15 = "%{public}@ EAPOLClientConfigurationSetSystemEthernetProfile() failed";
            goto LABEL_19;
          }

- (void)unsetAside
{
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  os_log_t v4 = (os_log_t)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  setAsideProfileuint64_t ID = self->_setAsideProfileID;

  if (setAsideProfileID)
  {
    uint64_t v6 = EAPOLClientConfigurationCreateWithAuthorization(0LL, 0LL);
    if (v6)
    {
      os_log_t v7 = (const void *)v6;
      uint64_t ProfileWithID = EAPOLClientConfigurationGetProfileWithID(v6);
      if (ProfileWithID)
      {
        if (EAPOLClientConfigurationSetSystemEthernetProfile(v7, ProfileWithID))
        {
          if (EAPOLClientConfigurationSave(v7))
          {
            id v9 = self->_setAsideProfileID;
            self->_setAsideProfileuint64_t ID = 0LL;

LABEL_18:
            CFRelease(v7);
            goto LABEL_19;
          }

          os_log_t v17 = _MCLogObjects[0];
          if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
            goto LABEL_18;
          }
          uint64_t v13 = v17;
          int v18 = 138543362;
          id v19 = (id)objc_opt_class(self);
          id v14 = v19;
          BOOL v15 = "%{public}@ EAPOLClientConfigurationSave() failed";
        }

        else
        {
          os_log_t v16 = _MCLogObjects[0];
          if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
            goto LABEL_18;
          }
          uint64_t v13 = v16;
          int v18 = 138543362;
          id v19 = (id)objc_opt_class(self);
          id v14 = v19;
          BOOL v15 = "%{public}@ EAPOLClientConfigurationSetSystemEthernetProfile() failed";
        }
      }

      else
      {
        os_log_t v12 = _MCLogObjects[0];
        if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
          goto LABEL_18;
        }
        uint64_t v13 = v12;
        int v18 = 138543362;
        id v19 = (id)objc_opt_class(self);
        id v14 = v19;
        BOOL v15 = "%{public}@ EAPOLClientConfigurationGetProfileWithID() returned NULL";
      }

      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v18, 0xCu);

      goto LABEL_18;
    }

    os_log_t v10 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      os_log_t v4 = v10;
      int v18 = 138543362;
      id v19 = (id)objc_opt_class(self);
      id v11 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "%{public}@ EAPOLClientConfigurationCreateWithAuthorization() returned NULL",  (uint8_t *)&v18,  0xCu);

LABEL_10:
    }
  }

- (void).cxx_destruct
{
}

@end