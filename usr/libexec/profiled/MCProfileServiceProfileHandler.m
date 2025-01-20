@interface MCProfileServiceProfileHandler
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (MCProfileServiceProfileHandler)initWithProfile:(id)a3;
- (id)_badIdentityError;
- (id)_sdpErrorForFinalProfile:(id)a3;
- (id)fetchFinalProfileWithClient:(id)a3 outProfileData:(id *)a4 outError:(id *)a5;
- (void)_releaseDependencyBetweenPersistentID:(id)a3 andUUID:(id)a4 forSystem:(BOOL)a5 user:(BOOL)a6;
- (void)_retainDependencyBetweenPersistentID:(id)a3 andUUID:(id)a4 forSystem:(BOOL)a5 user:(BOOL)a6;
- (void)dealloc;
- (void)didInstallOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4;
- (void)removeWithInstaller:(id)a3 options:(id)a4;
- (void)setAsideWithInstaller:(id)a3;
- (void)unsetAside;
@end

@implementation MCProfileServiceProfileHandler

- (MCProfileServiceProfileHandler)initWithProfile:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MCProfileServiceProfileHandler;
  v5 = -[MCProfileHandler initWithProfile:](&v10, "initWithProfile:", v4);
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 enrollmentIdentityPersistentID]);
    persistentID = v5->_persistentID;
    v5->_persistentID = (NSData *)v6;

    v8 = v5->_persistentID;
    if (v8) {
      v5->_identity = (__SecIdentity *)+[MCKeychain copyIdentityWithPersistentID:useSystemKeychain:]( MCKeychain,  "copyIdentityWithPersistentID:useSystemKeychain:",  v8,  [v4 isInstalledForSystem]);
    }
  }

  return v5;
}

- (void)dealloc
{
  identity = self->_identity;
  if (identity) {
    CFRelease(identity);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MCProfileServiceProfileHandler;
  -[MCProfileServiceProfileHandler dealloc](&v4, "dealloc");
}

- (id)_badIdentityError
{
  uint64_t v2 = MCOTAProfilesErrorDomain;
  uint64_t v3 = MCErrorArray(@"OTA_SERVER_RETURNED_BAD_IDENTITY");
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v2,  24002LL,  v4,  MCErrorTypeFatal,  0LL));

  return v5;
}

- (void)_retainDependencyBetweenPersistentID:(id)a3 andUUID:(id)a4 forSystem:(BOOL)a5 user:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = (id)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](&OBJC_CLASS___MCDependencyManager, "sharedManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 MCHexString]);

  [v12 addDependent:v9 ofParent:v11 inDomain:kMCDMCertificateToPayloadUUIDDependencyKey reciprocalDomain:kMCDMPayloadUUIDToCertificateDependencyKey toSystem:v7 user:v6];
}

- (void)_releaseDependencyBetweenPersistentID:(id)a3 andUUID:(id)a4 forSystem:(BOOL)a5 user:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = (id)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](&OBJC_CLASS___MCDependencyManager, "sharedManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 MCHexString]);

  [v12 removeDependent:v9 fromParent:v11 inDomain:kMCDMCertificateToPayloadUUIDDependencyKey reciprocalDomain:kMCDMPayloadUUIDToCertificateDependencyKey fromSystem:v7 user:v6];
}

- (id)fetchFinalProfileWithClient:(id)a3 outProfileData:(id *)a4 outError:(id *)a5
{
  id v87 = a3;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileHandler profile](self, "profile"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 URLString]);
  uint64_t v88 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v8));

  p_cache = &OBJC_METACLASS___MCClientTypeLoaders.cache;
  if (self->_identity)
  {
    id v10 = 0LL;
    v11 = 0LL;
    id v12 = 0LL;
  }

  else
  {
    v21 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Enrolling in OTA Profile service...",  buf,  2u);
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue([v7 deviceAttributes]);
    v23 = (void *)objc_claimAutoreleasedReturnValue([v7 challenge]);
    id v93 = 0LL;
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[MCMachineInfo machineInfoWithKeys:challenge:identity:additionalInfo:outError:]( &OBJC_CLASS___MCMachineInfo,  "machineInfoWithKeys:challenge:identity:additionalInfo:outError:",  v22,  v23,  0LL,  0LL,  &v93));
    id v10 = v93;

    if (v10)
    {
      v11 = 0LL;
      id v19 = 0LL;
      id v12 = 0LL;
      v25 = a5;
      id v26 = (id)v88;
      goto LABEL_33;
    }

    v85 = a4;
    id v30 = [[DMCHTTPTransaction alloc] initWithURL:v88 method:@"POST"];
    [v30 setTimeout:45.0];
    [v30 setUserAgent:kMCProfileUserAgent];
    [v30 setContentType:@"application/pkcs7-signature"];
    [v30 setData:v24];
    [v30 performSynchronously];
    v31 = (void *)objc_claimAutoreleasedReturnValue([v30 responseData]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v30 permanentlyRedirectedURL]);
    uint64_t v32 = objc_claimAutoreleasedReturnValue([v30 error]);
    if (v32)
    {
      id v10 = (id)v32;
      v11 = 0LL;
      int v33 = 2;
    }

    else
    {
      id v92 = 0LL;
      v36 = (void *)objc_claimAutoreleasedReturnValue( +[MCProfile profileWithData:outError:]( &OBJC_CLASS___MCProfile,  "profileWithData:outError:",  v31,  &v92));
      id v37 = v92;
      v83 = v36;
      if (v37)
      {
        id v10 = v37;
        v11 = 0LL;
        int v33 = 2;
      }

      else
      {
        v82 = v31;
        v45 = (void *)objc_claimAutoreleasedReturnValue([v36 payloads]);
        id v46 = [v45 count];

        if (v46 == (id)1)
        {
          v47 = (void *)objc_claimAutoreleasedReturnValue([v36 payloads]);
          v48 = (void *)objc_claimAutoreleasedReturnValue([v47 objectAtIndex:0]);

          uint64_t v49 = objc_opt_class(&OBJC_CLASS___MCCertificatePayload);
          else {
            v50 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServiceProfileHandler _badIdentityError](self, "_badIdentityError"));
          }
          v81 = v48;
          v11 = (void *)objc_claimAutoreleasedReturnValue([v48 handlerWithProfileHandler:self]);
          id v91 = v50;
          v65 = (__SecIdentity *)[v11 copyIdentityImmediatelyWithInteractionClient:v87 outError:&v91];
          id v10 = v91;

          self->_identity = v65;
          if (v10)
          {
            int v33 = 2;
          }

          else
          {
            id v79 = [v7 installType];
            v66 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              CFStringRef v95 = kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly;
              _os_log_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_DEBUG,  "Temporarily storing identity for profile service profile, storing with accessibility %@",  buf,  0xCu);
            }

            BOOL v67 = v79 != (id)2;
            BOOL v78 = v79 != (id)2;
            BOOL v80 = v79 == (id)2;
            identity = self->_identity;
            v68 = (void *)objc_claimAutoreleasedReturnValue([v7 UUID]);
            v69 = (NSData *)objc_claimAutoreleasedReturnValue( +[MCKeychain saveItem:withLabel:group:useSystemKeychain:accessibility:]( &OBJC_CLASS___MCKeychain,  "saveItem:withLabel:group:useSystemKeychain:accessibility:",  identity,  v68,  kMCAppleIdentitiesKeychainGroup,  v67,  kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly));
            persistentID = self->_persistentID;
            self->_persistentID = v69;

            v77 = self->_persistentID;
            v71 = (void *)objc_claimAutoreleasedReturnValue([v7 UUID]);
            -[MCProfileServiceProfileHandler _retainDependencyBetweenPersistentID:andUUID:forSystem:user:]( self,  "_retainDependencyBetweenPersistentID:andUUID:forSystem:user:",  v77,  v71,  v67,  v80);

            v72 = self->_persistentID;
            v73 = (void *)objc_claimAutoreleasedReturnValue([v7 UUID]);
            -[MCProfileServiceProfileHandler _releaseDependencyBetweenPersistentID:andUUID:forSystem:user:]( self,  "_releaseDependencyBetweenPersistentID:andUUID:forSystem:user:",  v72,  v73,  v78,  v80);

            int v33 = 0;
          }
        }

        else
        {
          id v10 = (id)objc_claimAutoreleasedReturnValue(-[MCProfileServiceProfileHandler _badIdentityError](self, "_badIdentityError"));
          v11 = 0LL;
          int v33 = 2;
        }

        v31 = v82;
      }
    }

    if (v33)
    {
      id v19 = 0LL;
      v20 = (void *)v88;
      goto LABEL_30;
    }

    a4 = v85;
    p_cache = (void **)(&OBJC_METACLASS___MCClientTypeLoaders + 16);
  }

  v13 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Retrieving profile from OTA Profile service...",  buf,  2u);
  }

  v14 = p_cache + 323;
  v15 = (void *)objc_claimAutoreleasedReturnValue([v7 deviceAttributes]);
  v16 = self->_identity;
  id v90 = v10;
  v17 = (void *)objc_claimAutoreleasedReturnValue( [v14 machineInfoWithKeys:v15 challenge:0 identity:v16 additionalInfo:0 outError:&v90]);
  id v18 = v90;

  if (!v18)
  {
    v20 = (void *)v88;
    id v27 = [[DMCHTTPTransaction alloc] initWithURL:v88 method:@"POST"];
    [v27 setTimeout:45.0];
    [v27 setUserAgent:kMCProfileUserAgent];
    [v27 setContentType:@"application/pkcs7-signature"];
    [v27 setData:v17];
    [v27 performSynchronously];
    v28 = (void *)objc_claimAutoreleasedReturnValue([v27 responseData]);
    uint64_t v84 = objc_claimAutoreleasedReturnValue([v27 permanentlyRedirectedURL]);

    uint64_t v29 = objc_claimAutoreleasedReturnValue([v27 error]);
    if (v29)
    {
      id v10 = (id)v29;
      id v19 = 0LL;
LABEL_28:

      id v12 = (void *)v84;
      goto LABEL_29;
    }

    v34 = a4;
    id v89 = 0LL;
    id v19 = (id)objc_claimAutoreleasedReturnValue(+[MCProfile profileWithData:outError:](&OBJC_CLASS___MCProfile, "profileWithData:outError:", v28, &v89));
    id v35 = v89;
    if (v35)
    {
LABEL_16:
      id v10 = v35;
      goto LABEL_28;
    }

    uint64_t v38 = objc_opt_class(&OBJC_CLASS___MCConfigurationProfile);
    if ((objc_opt_isKindOfClass(v19, v38) & 1) != 0)
    {
      if (![v19 isUserEnrollmentProfile])
      {
        if (v87)
        {
          if (+[DMCMobileGestalt isVisionDevice](&OBJC_CLASS___DMCMobileGestalt, "isVisionDevice")
            && [v19 isMDMProfile]
            && (+[DMCFeatureFlags isVisionProfileEnrollEnabled]( &OBJC_CLASS___DMCFeatureFlags,  "isVisionProfileEnrollEnabled") & 1) == 0)
          {
            uint64_t v74 = MCOTAProfilesErrorDomain;
            uint64_t v75 = MCErrorArrayByDevice(@"ERROR_PROFILE_DRIVEN_ENROLLMENT_BLOCKED", v64);
            v41 = (void *)objc_claimAutoreleasedReturnValue(v75);
            uint64_t v42 = MCErrorTypeFatal;
            uint64_t v43 = v74;
            uint64_t v44 = 24006LL;
            goto LABEL_27;
          }

          id v35 = (id)objc_claimAutoreleasedReturnValue( -[MCProfileServiceProfileHandler _sdpErrorForFinalProfile:]( self,  "_sdpErrorForFinalProfile:",  v19));
          if (v35) {
            goto LABEL_16;
          }
        }

        id v10 = 0LL;
        if (v34) {
          id *v34 = v28;
        }
        goto LABEL_28;
      }

      uint64_t v39 = MCOTAProfilesErrorDomain;
      uint64_t v40 = MCErrorArray(@"OTA_SERVER_RETURNED_FORBIDDEN_PROFILE");
      v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
      uint64_t v42 = MCErrorTypeFatal;
      uint64_t v43 = v39;
      uint64_t v44 = 24004LL;
    }

    else
    {
      uint64_t v51 = MCOTAProfilesErrorDomain;
      uint64_t v52 = MCErrorArray(@"OTA_SERVER_RETURNED_BAD_PROFILE");
      v41 = (void *)objc_claimAutoreleasedReturnValue(v52);
      uint64_t v42 = MCErrorTypeFatal;
      uint64_t v43 = v51;
      uint64_t v44 = 24003LL;
    }

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileHandler profile](self, "profile"));
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___MCProfileServiceProfileHandler;
  id v25 = 0LL;
  -[MCProfileHandler installWithInstaller:options:interactionClient:outError:]( &v24,  "installWithInstaller:options:interactionClient:outError:",  v12,  v11,  v10,  &v25);

  id v14 = v25;
  v15 = v14;
  if (v14)
  {
    if (a6) {
      *a6 = v14;
    }
  }

  else
  {
    id v16 = [v13 installType];
    BOOL v17 = v16 != (id)2;
    BOOL v18 = v16 == (id)2;
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v13 enrollmentIdentityPersistentID]);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v13 UUID]);
    -[MCProfileServiceProfileHandler _retainDependencyBetweenPersistentID:andUUID:forSystem:user:]( self,  "_retainDependencyBetweenPersistentID:andUUID:forSystem:user:",  v19,  v20,  v17,  v18);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller sharedInstaller](&OBJC_CLASS___MCInstaller, "sharedInstaller"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
    objc_msgSend( v21,  "purgePurgatoryProfileWithIdentifier:targetDevice:",  v22,  +[MCProfile thisDeviceType](MCProfile, "thisDeviceType"));
  }

  return v15 == 0LL;
}

- (void)didInstallOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "OTA Profile installed", buf, 2u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileHandler profile](self, "profile"));
  if ([v9 confirmInstallation])
  {
    id v10 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v16 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Sending installation confirmation to OTA Profile service. No error check is performed.",  v16,  2u);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  &off_1000CC140,  100LL,  0LL,  0LL));
    if (v11)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 URLString]);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v12));

      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data"));
      if (!SecCMSSignDataAndAttributes(self->_identity, v11, 0LL, v14, 0LL))
      {
        id v15 = [[DMCHTTPTransaction alloc] initWithURL:v13 method:@"POST"];
        [v15 setTimeout:45.0];
        [v15 setUserAgent:kMCProfileUserAgent];
        [v15 setContentType:@"application/pkcs7-signature"];
        [v15 setData:v14];
        [v15 performSynchronously];
      }
    }
  }
}

- (void)setAsideWithInstaller:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MCProfileServiceProfileHandler;
  -[MCProfileHandler setAsideWithInstaller:](&v10, "setAsideWithInstaller:", a3);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileHandler profile](self, "profile"));
  id v5 = [v4 installType];
  BOOL v6 = v5 != (id)2;
  BOOL v7 = v5 == (id)2;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 enrollmentIdentityPersistentID]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 UUID]);
  -[MCProfileServiceProfileHandler _releaseDependencyBetweenPersistentID:andUUID:forSystem:user:]( self,  "_releaseDependencyBetweenPersistentID:andUUID:forSystem:user:",  v8,  v9,  v6,  v7);
}

- (void)unsetAside
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MCProfileServiceProfileHandler;
  -[MCProfileHandler unsetAside](&v9, "unsetAside");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileHandler profile](self, "profile"));
  id v4 = [v3 installType];
  BOOL v5 = v4 != (id)2;
  BOOL v6 = v4 == (id)2;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v3 enrollmentIdentityPersistentID]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 UUID]);
  -[MCProfileServiceProfileHandler _retainDependencyBetweenPersistentID:andUUID:forSystem:user:]( self,  "_retainDependencyBetweenPersistentID:andUUID:forSystem:user:",  v7,  v8,  v5,  v6);
}

- (void)removeWithInstaller:(id)a3 options:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MCProfileServiceProfileHandler;
  -[MCProfileHandler removeWithInstaller:options:](&v11, "removeWithInstaller:options:", a3, a4);
  if (!-[MCProfileHandler isSetAside](self, "isSetAside"))
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileHandler profile](self, "profile"));
    id v6 = [v5 installType];
    BOOL v7 = v6 != (id)2;
    BOOL v8 = v6 == (id)2;
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v5 enrollmentIdentityPersistentID]);
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v5 UUID]);
    -[MCProfileServiceProfileHandler _releaseDependencyBetweenPersistentID:andUUID:forSystem:user:]( self,  "_releaseDependencyBetweenPersistentID:andUUID:forSystem:user:",  v9,  v10,  v7,  v8);
  }

- (id)_sdpErrorForFinalProfile:(id)a3
{
  id v3 = a3;
  uint64_t v13 = 0LL;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  id v16 = sub_100066A2C;
  BOOL v17 = sub_100066A3C;
  id v18 = 0LL;
  BOOL v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  objc_super v9 = sub_100066A44;
  objc_super v10 = &unk_1000C3E60;
  id v12 = &v13;
  id v4 = (id)objc_opt_new(&OBJC_CLASS___DMCSynchronous);
  id v11 = v4;
  +[MCInstaller isInteractiveProfileInstallationAllowedBySDP:completion:]( &OBJC_CLASS___MCInstaller,  "isInteractiveProfileInstallationAllowedBySDP:completion:",  v3,  &v7);
  objc_msgSend(v4, "waitForCompletion", v7, v8, v9, v10);
  id v5 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v5;
}

- (void).cxx_destruct
{
}

@end