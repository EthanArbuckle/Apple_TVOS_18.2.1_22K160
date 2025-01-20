@interface MTIPCUTunnelParser
- (BOOL)_isLockdownModeEnabled;
- (BOOL)_isXPCInterruptionError:(id)a3;
- (MTIPCUTunnelParser)init;
- (NSData)challenge;
- (NSData)challengeCertificate;
- (NSMutableDictionary)CSR;
- (NSString)hostIdentifier;
- (id)_commandFlush:(id)a3;
- (id)_commandGetEncryptionKey:(id)a3;
- (id)_commandGetProfileList:(id)a3;
- (id)_commandHello:(id)a3;
- (id)_commandInstallProfile:(id)a3;
- (id)_commandRemoveProfile:(id)a3;
- (id)_commandSetCertificate:(id)a3;
- (id)_commandSetWiFiPower:(id)a3;
- (id)_commandStoreProfile:(id)a3;
- (id)_configuratorCloudConfigurationErrorWithCloudConfigDetails:(id)a3 error:(id)a4;
- (id)_configuratorProvisionalEnrollmentErrorWithDetails:(id)a3 error:(id)a4;
- (id)_underlyingCloudConfigErrorFromError:(id)a3;
- (id)escalationBlock;
- (int64_t)downloadAndApplyCloudConfigurationCommandRetryCount;
- (int64_t)setCloudConfigurationCommandRetryCount;
- (void)_commandDownloadAndApplyCloudConfiguration:(id)a3 completionBlock:(id)a4;
- (void)_commandEraseDevice:(id)a3 completionBlock:(id)a4;
- (void)_commandEscalate:(id)a3 completionBlock:(id)a4;
- (void)_commandEscalateResponse:(id)a3 completionBlock:(id)a4;
- (void)_commandEstablishProvisionalEnrollmentRequest:(id)a3 completionBlock:(id)a4;
- (void)_commandGetCloudConfiguration:(id)a3 completionBlock:(id)a4;
- (void)_commandGetStoredProfile:(id)a3 completionBlock:(id)a4;
- (void)_commandPollMDMIfNetworkTetheredRequest:(id)a3 completionBlock:(id)a4;
- (void)_commandSetCloudConfiguration:(id)a3 completionBlock:(id)a4;
- (void)processRequest:(id)a3 assertion:(id)a4 completionBlock:(id)a5;
- (void)setCSR:(id)a3;
- (void)setChallenge:(id)a3;
- (void)setChallengeCertificate:(id)a3;
- (void)setDownloadAndApplyCloudConfigurationCommandRetryCount:(int64_t)a3;
- (void)setEscalationBlock:(id)a3;
- (void)setHostIdentifier:(id)a3;
- (void)setSetCloudConfigurationCommandRetryCount:(int64_t)a3;
@end

@implementation MTIPCUTunnelParser

- (MTIPCUTunnelParser)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MTIPCUTunnelParser;
  result = -[MTIPCUTunnelParser init](&v3, "init");
  if (result)
  {
    result->_downloadAndApplyCloudConfigurationCommandRetryCount = 0LL;
    result->_setCloudConfigurationCommandRetryCount = 0LL;
  }

  return result;
}

- (id)_commandFlush:(id)a3
{
  objc_super v3 = *(os_log_s **)DMCLogObjects(self);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Flushing command queue.", v5, 2u);
  }

  +[MDMMCInterface flush](&OBJC_CLASS___MDMMCInterface, "flush");
  return (id)objc_claimAutoreleasedReturnValue( +[MTIPCUTunnelParser responseWithStatus:]( &OBJC_CLASS___MTIPCUTunnelParser,  "responseWithStatus:",  kMCTPStatusAcknowledged));
}

- (id)_commandHello:(id)a3
{
  return +[MTIPCUTunnelParser responseWithStatus:]( &OBJC_CLASS___MTIPCUTunnelParser,  "responseWithStatus:",  kMCTPStatusAcknowledged);
}

- (id)_commandGetEncryptionKey:(id)a3
{
  v4 = (os_log_t *)DMCLogObjects(self);
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEBUG)) {
    sub_10000B798();
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser hostIdentifier](self, "hostIdentifier"));

  if (!v5) {
    goto LABEL_19;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser hostIdentifier](self, "hostIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MDMConfiguration sharedConfiguration](&OBJC_CLASS___MDMConfiguration, "sharedConfiguration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 personaID]);
  v9 = (__SecCertificate *)DMCHCUCopyCertificateFromKeychainForMappedLabel(v6, v8 != 0LL);

  if (v9)
  {
    double v10 = SecCertificateNotValidAfter(v9);
    double v11 = SecCertificateNotValidBefore(v9);
    double Current = CFAbsoluteTimeGetCurrent();
    if (v11 < Current && v10 > Current)
    {
      CFDataRef v20 = SecCertificateCopyData(v9);
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSData DMCDataWithCFData:](&OBJC_CLASS___NSData, "DMCDataWithCFData:", v20));
      CFRelease(v9);
      v22 = @"PublicKey";
      goto LABEL_15;
    }

    v15 = *(os_log_s **)DMCLogObjects(v12);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "iPCU client certificate is no longer valid. Requesting a new one.",  v26,  2u);
    }

    CFRelease(v9);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser hostIdentifier](self, "hostIdentifier"));

  if (!v16) {
    goto LABEL_17;
  }
  v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[MTIPCUTunnelParser setCSR:](self, "setCSR:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser CSR](self, "CSR"));
  CFDataRef v20 = (CFDataRef)DMCHCUCreateCSR();

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSData DMCDataWithCFData:](&OBJC_CLASS___NSData, "DMCDataWithCFData:", v20));
  v22 = @"CSR";
LABEL_15:
  CFRelease(v20);
  if (!v21)
  {
LABEL_17:
    v24 = *(os_log_s **)DMCLogObjects(v17);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "Cannot retrieve the device certificate for the connected host.",  v26,  2u);
    }

- (id)_commandGetProfileList:(id)a3
{
  objc_super v3 = (os_log_t *)DMCLogObjects(self);
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEBUG)) {
    sub_10000B818();
  }
  return (id)objc_claimAutoreleasedReturnValue( +[MDMMCInterface ipcuProfileList]( &OBJC_CLASS___MDMMCInterface,  "ipcuProfileList"));
}

- (id)_commandRemoveProfile:(id)a3
{
  id v3 = a3;
  v4 = (os_log_t *)DMCLogObjects(v3);
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEBUG)) {
    sub_10000B898();
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kMCTPProfileIdentifier]);

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[MDMMCInterface ipcuRemoveProfileWithIdentifier:]( &OBJC_CLASS___MDMMCInterface,  "ipcuRemoveProfileWithIdentifier:",  v5));
  if (v6)
  {
    v8 = *(void **)DMCLogObjects(v7);
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
    {
      v9 = v8;
      double v10 = (void *)objc_claimAutoreleasedReturnValue([v6 DMCVerboseDescription]);
      int v14 = 138543362;
      v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Error: %{public}@", (uint8_t *)&v14, 0xCu);
    }

    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[MTIPCUTunnelParser responseWithError:](&OBJC_CLASS___MTIPCUTunnelParser, "responseWithError:", v6));
  }

  else
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[MTIPCUTunnelParser responseWithStatus:]( &OBJC_CLASS___MTIPCUTunnelParser,  "responseWithStatus:",  kMCTPStatusAcknowledged));
  }

  uint64_t v12 = (void *)v11;

  return v12;
}

- (id)_commandSetCertificate:(id)a3
{
  id v4 = a3;
  v5 = (os_log_t *)DMCLogObjects(v4);
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG)) {
    sub_10000B918();
  }
  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser hostIdentifier](self, "hostIdentifier"));
  if (v6
    && (uint64_t v7 = (void *)v6,
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser CSR](self, "CSR")),
        v8,
        v7,
        v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"CertificateData"]);
    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser hostIdentifier](self, "hostIdentifier"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser CSR](self, "CSR"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[MDMConfiguration sharedConfiguration](&OBJC_CLASS___MDMConfiguration, "sharedConfiguration"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 personaID]);
    uint64_t v14 = DMCHCUSetCertificateDataForMappedLabel(v9, v10, v11, v13 != 0LL);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

    v16 = *(os_log_s **)DMCLogObjects(-[MTIPCUTunnelParser setCSR:](self, "setCSR:", 0LL));
    if (v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)CFDataRef v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Created new iPCU client identity.", v20, 2u);
      }

      uint64_t v17 = objc_claimAutoreleasedReturnValue( +[MTIPCUTunnelParser responseWithStatus:]( &OBJC_CLASS___MTIPCUTunnelParser,  "responseWithStatus:",  kMCTPStatusAcknowledged));
    }

    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)CFDataRef v20 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Could not create new iPCU client identity.",  v20,  2u);
      }

      v21[0] = @"Error";
      v21[1] = kMCTPStatusKey;
      v22[0] = @"Could not create identity with certificate";
      v22[1] = kMCTPStatusError;
      v21[2] = @"Goodbye";
      v22[2] = &__kCFBooleanTrue;
      uint64_t v17 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  3LL));
    }

    v18 = (void *)v17;
  }

  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[MTIPCUTunnelParser responseWithStatus:]( &OBJC_CLASS___MTIPCUTunnelParser,  "responseWithStatus:",  kMCTPStatusCommandFormatError));
  }

  return v18;
}

- (id)_commandInstallProfile:(id)a3
{
  id v4 = a3;
  v5 = (os_log_t *)DMCLogObjects(v4);
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG)) {
    sub_10000B998();
  }
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kMCTPPayloadKey]);

  if (!v6) {
    return (id)objc_claimAutoreleasedReturnValue( +[MTIPCUTunnelParser responseWithStatus:]( &OBJC_CLASS___MTIPCUTunnelParser,  "responseWithStatus:",  kMCTPStatusErrorPayloadEmpty));
  }
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v6,  100LL,  0LL,  0LL));

    uint64_t v6 = (void *)v8;
  }

  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSData);
  if ((objc_opt_isKindOfClass(v6, v9) & 1) == 0)
  {
    uint64_t v22 = DMCTunnelErrorDomain;
    uint64_t v23 = DMCErrorArray(@"TUNNEL_ERROR_INVALID_FIELD_P_FIELD_%@");
    double v10 = (void *)objc_claimAutoreleasedReturnValue(v23);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError DMCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "DMCErrorWithDomain:code:descriptionArray:errorType:",  v22,  14000LL,  v10,  DMCErrorTypeFatal));
    id v13 = [v17 DMCCopyAsPrimaryError];
    goto LABEL_18;
  }

  double v10 = (void *)objc_opt_new(&OBJC_CLASS___DMFInstallProfileRequest);
  [v10 setProfileData:v6];
  [v10 setStyle:0];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[DMFConnection systemConnection](&OBJC_CLASS___DMFConnection, "systemConnection"));
  id v30 = 0LL;
  id v12 = [v11 performRequest:v10 error:&v30];
  id v13 = v30;

  if (v13)
  {
    if ([v13 code] == (id)2000)
    {
      unsigned int v14 = -[MTIPCUTunnelParser _isLockdownModeEnabled](self, "_isLockdownModeEnabled");
      uint64_t v15 = DMCInstallationErrorDomain;
      if (v14)
      {
        uint64_t v16 = DMCErrorArray(@"ERROR_PROFILE_INSTALL_PREVENTED_BY_LOCKDOWN");
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        uint64_t v18 = DMCErrorTypeFatal;
        uint64_t v19 = v15;
        uint64_t v20 = 4021LL;
      }

      else
      {
        uint64_t v26 = DMCErrorArray(@"ERROR_PROFILE_NO_INTERACTIVE_INSTALLATION");
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v26);
        uint64_t v18 = DMCErrorTypeFatal;
        uint64_t v19 = v15;
        uint64_t v20 = 4020LL;
      }

      id v25 = (id)objc_claimAutoreleasedReturnValue( +[NSError DMCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "DMCErrorWithDomain:code:descriptionArray:errorType:",  v19,  v20,  v17,  v18));
      goto LABEL_17;
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue([v13 userInfo]);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:NSUnderlyingErrorKey]);

    if (v17)
    {
      id v25 = v17;
      uint64_t v17 = v25;
LABEL_17:
      id v27 = v25;

      id v13 = v27;
    }

- (BOOL)_isLockdownModeEnabled
{
  return 0;
}

- (id)_commandStoreProfile:(id)a3
{
  id v3 = a3;
  id v4 = *(os_log_s **)DMCLogObjects(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Storing profile", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"ProfileData"]);
  if (v5)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSData);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      char v16 = 0;
      id v15 = 0LL;
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[MDMMCInterface profileIdentifierForProfileData:allowEmptyPayload:outIsSupervisionProfile:outProfileSigner:outMayInstallCloudProfile:outError:]( &OBJC_CLASS___MDMMCInterface,  "profileIdentifierForProfileData:allowEmptyPayload:outIsSupervisionProfile:outProfileSigner:outMay InstallCloudProfile:outError:",  v5,  1LL,  0LL,  0LL,  &v16,  &v15));
      id v8 = v15;
      if (!v7)
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue( +[MTIPCUTunnelParser responseWithError:]( &OBJC_CLASS___MTIPCUTunnelParser,  "responseWithError:",  v8));
        goto LABEL_17;
      }

      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"Purpose"]);
      if (v9
        && (uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v9, v10) & 1) != 0)
        && ([v9 isEqualToString:@"PostSetupInstallation"] & 1) != 0)
      {
        if ([v9 isEqualToString:@"PostSetupInstallation"] && !v16)
        {
          uint64_t v11 = objc_claimAutoreleasedReturnValue(+[MTIPCUTunnelParser responseWithError:](&OBJC_CLASS___MTIPCUTunnelParser, "responseWithError:", v8));
LABEL_15:
          id v12 = (void *)v11;

LABEL_17:
          goto LABEL_18;
        }

        +[MDMMCInterface storeProfileData:completion:]( &OBJC_CLASS___MDMMCInterface,  "storeProfileData:completion:",  v5,  &stru_100010910);
        id v13 = &kMCTPStatusAcknowledged;
      }

      else
      {
        id v13 = &kMCTPStatusCommandFormatError;
      }

      uint64_t v11 = objc_claimAutoreleasedReturnValue(+[MTIPCUTunnelParser responseWithStatus:](&OBJC_CLASS___MTIPCUTunnelParser, "responseWithStatus:", *v13));
      goto LABEL_15;
    }
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[MTIPCUTunnelParser responseWithStatus:]( &OBJC_CLASS___MTIPCUTunnelParser,  "responseWithStatus:",  kMCTPStatusCommandFormatError));
LABEL_18:

  return v12;
}

- (void)_commandGetStoredProfile:(id)a3 completionBlock:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = *(os_log_s **)DMCLogObjects(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Retrieving stored profile", buf, 2u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"Purpose"]);

  if (v8)
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0
      && ([v8 isEqualToString:@"PostSetupInstallation"] & 1) != 0)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_100008D1C;
      v11[3] = &unk_100010938;
      id v12 = v5;
      +[MDMMCInterface storedProfileDataWithCompletion:]( &OBJC_CLASS___MDMMCInterface,  "storedProfileDataWithCompletion:",  v11);
      uint64_t v10 = v12;
LABEL_9:

      goto LABEL_10;
    }
  }

  if (v5)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[MTIPCUTunnelParser responseWithStatus:]( &OBJC_CLASS___MTIPCUTunnelParser,  "responseWithStatus:",  kMCTPStatusCommandFormatError));
    (*((void (**)(id, void *))v5 + 2))(v5, v10);
    goto LABEL_9;
  }

- (void)_commandGetCloudConfiguration:(id)a3 completionBlock:(id)a4
{
  uint64_t v7 = (void (**)(id, void *))a4;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MDMMCInterface cloudConfigurationDetails](&OBJC_CLASS___MDMMCInterface, "cloudConfigurationDetails"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[MTIPCUTunnelParser responseWithStatus:]( &OBJC_CLASS___MTIPCUTunnelParser,  "responseWithStatus:",  kMCTPStatusAcknowledged));
  id v6 = v5;
  if (v4) {
    [v5 setObject:v4 forKeyedSubscript:@"CloudConfiguration"];
  }
  if (v7) {
    v7[2](v7, v6);
  }
}

- (void)_commandSetCloudConfiguration:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MDMMCInterface cloudConfigurationDetails](&OBJC_CLASS___MDMMCInterface, "cloudConfigurationDetails"));
  if (v8)
  {
    uint64_t v9 = DMCTunnelErrorDomain;
    uint64_t v10 = DMCErrorArray(@"TUNNEL_ERROR_CLOUD_CONFIG_EXISTS");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError DMCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "DMCErrorWithDomain:code:descriptionArray:errorType:",  v9,  14002LL,  v11,  DMCErrorTypeFatal,  0LL));

    if (v7)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[MTIPCUTunnelParser responseWithError:]( &OBJC_CLASS___MTIPCUTunnelParser,  "responseWithError:",  v12));
      v7[2](v7, v13);
    }
  }

  else
  {
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"CloudConfiguration"]);
    id v15 = [v14 mutableCopy];

    [v15 setObject:&off_1000113D8 forKeyedSubscript:kCCConfigurationSourceKey];
    char v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:kCCConfigurationURLKey]);
    if (v16)
    {
    }

    else
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:kCCConfigurationWebURLKey]);

      if (!v17)
      {
        [v15 setObject:&__kCFBooleanTrue forKeyedSubscript:kCCCloudConfigurationUICompleteKey];
        [v15 setObject:&__kCFBooleanTrue forKeyedSubscript:kCCCloudConfigurationWasAppliedKey];
      }
    }

    [v15 setObject:&__kCFBooleanTrue forKeyedSubscript:kCCIsMandatoryKey];
    [v15 setObject:&__kCFBooleanFalse forKeyedSubscript:kCCIsMDMUnremovable];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10000909C;
    v18[3] = &unk_100010960;
    v18[4] = self;
    id v19 = v6;
    uint64_t v20 = v7;
    +[MDMMCInterface storeCloudConfigurationDetails:completion:]( &OBJC_CLASS___MDMMCInterface,  "storeCloudConfigurationDetails:completion:",  v15,  v18);
  }
}

- (id)_underlyingCloudConfigErrorFromError:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3) {
    goto LABEL_5;
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:NSUnderlyingErrorKey]);

  if (!v6
    || (uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]),
        unsigned __int8 v8 = [v7 isEqualToString:DEPCloudConfigErrorDomain],
        v7,
        (v8 & 1) == 0))
  {

LABEL_5:
    id v6 = 0LL;
  }

  return v6;
}

- (id)_configuratorProvisionalEnrollmentErrorWithDetails:(id)a3 error:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[MTIPCUTunnelParser _underlyingCloudConfigErrorFromError:]( self,  "_underlyingCloudConfigErrorFromError:",  v5));
  uint64_t v7 = v6;
  unsigned __int8 v8 = v5;
  if (v6)
  {
    if ([v6 code] == (id)33014) {
      unsigned __int8 v8 = v7;
    }
    else {
      unsigned __int8 v8 = v5;
    }
  }

  id v9 = v8;

  return v9;
}

- (id)_configuratorCloudConfigurationErrorWithCloudConfigDetails:(id)a3 error:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[MTIPCUTunnelParser _underlyingCloudConfigErrorFromError:]( self,  "_underlyingCloudConfigErrorFromError:",  v5));
  uint64_t v7 = v6;
  unsigned __int8 v8 = v5;
  if (v6)
  {
    if ([v6 code] == (id)33005) {
      unsigned __int8 v8 = v7;
    }
    else {
      unsigned __int8 v8 = v5;
    }
  }

  id v9 = v8;

  return v9;
}

- (BOOL)_isXPCInterruptionError:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_commandDownloadAndApplyCloudConfiguration:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = *(os_log_s **)DMCLogObjects(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Download and apply cloud configuration", buf, 2u);
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100009570;
  v18[3] = &unk_1000109B0;
  v18[4] = self;
  id v9 = v6;
  id v19 = v9;
  id v10 = v7;
  id v20 = v10;
  uint64_t v11 = objc_retainBlock(v18);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[MDMMCInterface mdmProfileIdentifier](&OBJC_CLASS___MDMMCInterface, "mdmProfileIdentifier"));

  if (v12)
  {
    id v13 = [(id)objc_opt_class(self) responseWithStatus:kMCTPStatusAcknowledged];
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    ((void (*)(void *, void *))v11[2])(v11, v14);
  }

  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000096E4;
    v15[3] = &unk_100010AD8;
    v15[4] = self;
    uint64_t v17 = v11;
    id v16 = v9;
    +[MDMMCInterface retrieveCloudConfigurationDetailsCompletion:]( &OBJC_CLASS___MDMMCInterface,  "retrieveCloudConfigurationDetailsCompletion:",  v15);
  }
}

- (void)_commandPollMDMIfNetworkTetheredRequest:(id)a3 completionBlock:(id)a4
{
  id v4 = a4;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[MDMClient sharedClient](&OBJC_CLASS___MDMClient, "sharedClient"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000A020;
  v7[3] = &unk_100010B00;
  id v8 = v4;
  id v6 = v4;
  [v5 simulatePushIfNetworkTetheredWithCompletion:v7];
}

- (void)_commandEraseDevice:(id)a3 completionBlock:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, dispatch_semaphore_s *))a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"PreserveDataPlan"]);
  if (!v7)
  {
LABEL_4:
    id v9 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"DisallowProximitySetup"]);
    if (v9)
    {
      uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v9, v10) & 1) == 0)
      {
        id v15 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue( +[MTIPCUTunnelParser responseWithStatus:]( &OBJC_CLASS___MTIPCUTunnelParser,  "responseWithStatus:",  kMCTPStatusCommandFormatError));
        v6[2](v6, v15);
        goto LABEL_10;
      }

      -[dispatch_semaphore_s BOOLValue](v9, "BOOLValue");
    }

    uint64_t v11 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue( +[MTIPCUTunnelParser responseWithStatus:]( &OBJC_CLASS___MTIPCUTunnelParser,  "responseWithStatus:",  kMCTPStatusAcknowledged));
    v6[2](v6, v11);

    dispatch_semaphore_t v12 = dispatch_semaphore_create(0LL);
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[PBSSystemServiceConnection sharedConnection]( &OBJC_CLASS___PBSSystemServiceConnection,  "sharedConnection"));
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 osUpdateServiceProxy]);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10000A380;
    v16[3] = &unk_100010B28;
    dispatch_semaphore_t v17 = v12;
    id v15 = v12;
    [v14 obliterateDataPreservingPaths:0 withCompletion:v16];

    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
LABEL_10:

    goto LABEL_11;
  }

  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    [v7 BOOLValue];
    goto LABEL_4;
  }

  id v9 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue( +[MTIPCUTunnelParser responseWithStatus:]( &OBJC_CLASS___MTIPCUTunnelParser,  "responseWithStatus:",  kMCTPStatusCommandFormatError));
  v6[2](v6, v9);
LABEL_11:
}

- (void)_commandEscalate:(id)a3 completionBlock:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"SupervisorCertificate"]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[MDMMCInterface cloudConfigurationDetails](&OBJC_CLASS___MDMMCInterface, "cloudConfigurationDetails"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kCCSupervisorHostCertificatesKey]);

  if ([v9 containsObject:v7])
  {
    -[MTIPCUTunnelParser setChallengeCertificate:](self, "setChallengeCertificate:", v7);
    arc4random_buf(&v13, 8uLL);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v13, 8LL));
    -[MTIPCUTunnelParser setChallenge:](self, "setChallenge:", v10);

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[MTIPCUTunnelParser responseWithStatus:]( &OBJC_CLASS___MTIPCUTunnelParser,  "responseWithStatus:",  kMCTPStatusAcknowledged));
    dispatch_semaphore_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser challenge](self, "challenge"));
    [v11 setObject:v12 forKeyedSubscript:@"Challenge"];

    if (!v6) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[MTIPCUTunnelParser responseWithStatus:]( &OBJC_CLASS___MTIPCUTunnelParser,  "responseWithStatus:",  @"CertificateRejected"));
  if (v6) {
LABEL_5:
  }
    v6[2](v6, v11);
LABEL_6:
}

- (void)_commandEscalateResponse:(id)a3 completionBlock:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"SignedRequest"]);
  SecPolicyRef BasicX509 = SecPolicyCreateBasicX509();
  if (!BasicX509) {
    goto LABEL_18;
  }
  SecPolicyRef v9 = BasicX509;
  id v30 = 0LL;
  *(void *)buf = 0LL;
  id v29 = 0LL;
  if (!SecCMSVerifyCopyDataAndAttributes(v7, 0LL, BasicX509, buf, &v30, &v29))
  {
    id v11 = v29;
    uint64_t v10 = v30;
    dispatch_semaphore_t v12 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKeyedSubscript:kSecCMSAllCerts]);
    if (![v12 count])
    {
LABEL_16:

      goto LABEL_17;
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:0]);

    CFDataRef v14 = SecCertificateCopyData((SecCertificateRef)v13);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser challengeCertificate](self, "challengeCertificate"));
    unsigned int v16 = -[__CFData isEqualToData:](v14, "isEqualToData:", v15);

    if (v16)
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser challenge](self, "challenge"));
      unsigned __int8 v19 = [v10 isEqualToData:v18];

      if ((v19 & 1) != 0)
      {

        CFRelease(v9);
        -[MTIPCUTunnelParser setChallenge:](self, "setChallenge:", 0LL);
        v21 = *(os_log_s **)DMCLogObjects(-[MTIPCUTunnelParser setChallengeCertificate:](self, "setChallengeCertificate:", 0LL));
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Escalation accepted.", buf, 2u);
        }

        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[MTIPCUTunnelParser responseWithStatus:]( &OBJC_CLASS___MTIPCUTunnelParser,  "responseWithStatus:",  kMCTPStatusAcknowledged));
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser escalationBlock](self, "escalationBlock"));

        if (v23)
        {
          v24 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser escalationBlock](self, "escalationBlock"));
          v24[2]();
        }

        goto LABEL_21;
      }

      id v25 = *(os_log_s **)DMCLogObjects(v20);
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        goto LABEL_15;
      }
      *(_WORD *)uint64_t v28 = 0;
      uint64_t v26 = "Escalation response does not contain the expected challenge.";
    }

    else
    {
      id v25 = *(os_log_s **)DMCLogObjects(v17);
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
LABEL_15:

        goto LABEL_16;
      }

      *(_WORD *)uint64_t v28 = 0;
      uint64_t v26 = "Escalation response was signed using a different certificate.";
    }

    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, v26, v28, 2u);
    goto LABEL_15;
  }

- (void)_commandEstablishProvisionalEnrollmentRequest:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *(os_log_s **)DMCLogObjects(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Establish Provisional Enrollment", buf, 2u);
  }

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10000AB54;
  v20[3] = &unk_100010B50;
  id v9 = v7;
  id v21 = v9;
  uint64_t v10 = objc_retainBlock(v20);
  uint64_t v11 = DMCIsSetupBuddyDone();
  if ((_DWORD)v11)
  {
    dispatch_semaphore_t v12 = *(os_log_s **)DMCLogObjects(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Provisional Enrollment rejected because device is not still in Buddy",  buf,  2u);
    }

    id v13 = [(id)objc_opt_class(self) responseWithStatus:@"ProvisionalEnrollmentRejected"];
    CFDataRef v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    ((void (*)(void *, void *))v10[2])(v10, v14);
  }

  else
  {
    CFDataRef v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"Nonce"]);
    if (v14)
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_10000AC14;
      v18[3] = &unk_100010B78;
      v18[4] = self;
      unsigned __int8 v19 = v10;
      +[MDMMCInterface enrollProvisionallyWithNonce:completion:]( &OBJC_CLASS___MDMMCInterface,  "enrollProvisionallyWithNonce:completion:",  v14,  v18);
    }

    else
    {
      id v15 = *(os_log_s **)DMCLogObjects(0LL);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Nonce token not received.", buf, 2u);
      }

      id v16 = [(id)objc_opt_class(self) responseWithStatus:@"NonceNotReceived"];
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      ((void (*)(void *, void *))v10[2])(v10, v17);
    }
  }
}

- (id)_commandSetWiFiPower:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"PowerState"]);
  id v4 = [v3 BOOLValue];

  id v6 = *(void **)DMCLogObjects(v5);
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    uint64_t v8 = DMCStringForBool(v4);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 138543362;
    id v30 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setting WiFi power: %{public}@", buf, 0xCu);
  }

  uint64_t v10 = WiFiManagerClientCreate(kCFAllocatorDefault, 0LL);
  if (v10)
  {
    uint64_t v11 = (const void *)v10;
    CFRunLoopRef Current = CFRunLoopGetCurrent();
    WiFiManagerClientScheduleWithRunLoop(v11, Current, kCFRunLoopDefaultMode);
    if (WiFiManagerClientGetPower(v11) == (_DWORD)v4
      || (WiFiManagerClientSetPower(v11, v4), uint64_t Power = WiFiManagerClientGetPower(v11), (_DWORD)Power == (_DWORD)v4))
    {
      CFRunLoopRef v14 = CFRunLoopGetCurrent();
      WiFiManagerClientUnscheduleFromRunLoop(v11, v14, kCFRunLoopDefaultMode);
      CFRelease(v11);
      return (id)objc_claimAutoreleasedReturnValue( +[MTIPCUTunnelParser responseWithStatus:]( &OBJC_CLASS___MTIPCUTunnelParser,  "responseWithStatus:",  kMCTPStatusAcknowledged));
    }

    uint64_t v23 = *(os_log_s **)DMCLogObjects(Power);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to set WiFi power.", buf, 2u);
    }

    CFRunLoopRef v24 = CFRunLoopGetCurrent();
    WiFiManagerClientUnscheduleFromRunLoop(v11, v24, kCFRunLoopDefaultMode);
    CFRelease(v11);
    id v25 = (void *)objc_claimAutoreleasedReturnValue([@"TUNNEL_ERROR_COULD_NOT_SET_WIFI_POWER" DMCAppendGreenteaSuffix]);
    uint64_t v26 = DMCUnformattedErrorArray(v25);
    unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue(v26);

    uint64_t v20 = DMCTunnelErrorDomain;
    uint64_t v21 = DMCErrorTypeFatal;
    uint64_t v22 = 14005LL;
  }

  else
  {
    id v16 = *(os_log_s **)DMCLogObjects(0LL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Failed to create WiFi manager client.",  buf,  2u);
    }

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([@"TUNNEL_ERROR_COULD_NOT_CREATE_WIFI_MANAGER_CLIENT" DMCAppendGreenteaSuffix]);
    uint64_t v18 = DMCUnformattedErrorArray(v17);
    unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

    uint64_t v20 = DMCTunnelErrorDomain;
    uint64_t v21 = DMCErrorTypeFatal;
    uint64_t v22 = 14004LL;
  }

  id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSError DMCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "DMCErrorWithDomain:code:descriptionArray:errorType:",  v20,  v22,  v19,  v21));
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[MTIPCUTunnelParser responseWithError:](&OBJC_CLASS___MTIPCUTunnelParser, "responseWithError:", v27));

  return v28;
}

- (void)processRequest:(id)a3 assertion:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, uint64_t))a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"IPCUIdentifier"]);

  if (v11)
  {
    dispatch_semaphore_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"IPCUIdentifier"]);
    id v13 = [v12 copy];
    -[MTIPCUTunnelParser setHostIdentifier:](self, "setHostIdentifier:", v13);

    id v15 = *(void **)DMCLogObjects(v14);
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEBUG))
    {
      id v16 = v15;
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser hostIdentifier](self, "hostIdentifier"));
      *(_DWORD *)buf = 138543362;
      v31 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Got iPCU Identifier: %{public}@", buf, 0xCu);
    }
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"HostCertificateData"]);
  unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser hostIdentifier](self, "hostIdentifier"));

  if (v19 && v18)
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser hostIdentifier](self, "hostIdentifier"));
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[MDMConfiguration sharedConfiguration](&OBJC_CLASS___MDMConfiguration, "sharedConfiguration"));
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 personaID]);
    uint64_t v23 = (const void *)DMCHCUCopyHostCertificateForMappedLabel(v20, v22 != 0LL);

    if (v23)
    {
      CFRelease(v23);
    }

    else
    {
      CFRunLoopRef v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser hostIdentifier](self, "hostIdentifier"));
      +[MDMMCInterface storeCertificateData:forHostIdentifier:]( &OBJC_CLASS___MDMMCInterface,  "storeCertificateData:forHostIdentifier:",  v18,  v24);
    }
  }

  id v25 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:kMCTPRequestTypeKey]);
  uint64_t v26 = *(os_log_s **)(DMCLogObjects(v25) + 8);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v31 = v25;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Attempting to perform Unsupervised request: %{public}@",  buf,  0xCu);
  }

  if (!v25)
  {
    uint64_t v27 = objc_claimAutoreleasedReturnValue( +[MTIPCUTunnelParser responseWithStatus:]( &OBJC_CLASS___MTIPCUTunnelParser,  "responseWithStatus:",  kMCTPStatusCommandFormatError));
    goto LABEL_29;
  }

  if ([v25 isEqualToString:@"GetEncryptionKey"])
  {
    uint64_t v27 = objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser _commandGetEncryptionKey:](self, "_commandGetEncryptionKey:", v8));
    goto LABEL_29;
  }

  if ([v25 isEqualToString:@"SetCertificate"])
  {
    uint64_t v27 = objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser _commandSetCertificate:](self, "_commandSetCertificate:", v8));
    goto LABEL_29;
  }

  if ([v25 isEqualToString:@"HelloHostIdentifier"])
  {
    uint64_t v27 = objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser _commandHello:](self, "_commandHello:", v8));
    goto LABEL_29;
  }

  if ([v25 isEqualToString:@"Flush"])
  {
    uint64_t v27 = objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser _commandFlush:](self, "_commandFlush:", v8));
    goto LABEL_29;
  }

  if ([v25 isEqualToString:@"GetProfileList"])
  {
    uint64_t v27 = objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser _commandGetProfileList:](self, "_commandGetProfileList:", v8));
    goto LABEL_29;
  }

  if ([v25 isEqualToString:@"InstallProfile"])
  {
    uint64_t v27 = objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser _commandInstallProfile:](self, "_commandInstallProfile:", v8));
    goto LABEL_29;
  }

  if ([v25 isEqualToString:@"RemoveProfile"])
  {
    uint64_t v27 = objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser _commandRemoveProfile:](self, "_commandRemoveProfile:", v8));
    goto LABEL_29;
  }

  if ([v25 isEqualToString:@"StoreProfile"])
  {
    uint64_t v27 = objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser _commandStoreProfile:](self, "_commandStoreProfile:", v8));
    goto LABEL_29;
  }

  if ([v25 isEqualToString:@"GetStoredProfile"])
  {
    -[MTIPCUTunnelParser _commandGetStoredProfile:completionBlock:]( self,  "_commandGetStoredProfile:completionBlock:",  v8,  v10);
LABEL_53:
    uint64_t v28 = 0LL;
    goto LABEL_31;
  }

  if ([v25 isEqualToString:@"GetCloudConfiguration"])
  {
    -[MTIPCUTunnelParser _commandGetCloudConfiguration:completionBlock:]( self,  "_commandGetCloudConfiguration:completionBlock:",  v8,  v10);
    goto LABEL_53;
  }

  if ([v25 isEqualToString:@"SetCloudConfiguration"])
  {
    -[MTIPCUTunnelParser _commandSetCloudConfiguration:completionBlock:]( self,  "_commandSetCloudConfiguration:completionBlock:",  v8,  v10);
    goto LABEL_53;
  }

  if ([v25 isEqualToString:@"DownloadAndApplyCloudConfiguration"])
  {
    -[MTIPCUTunnelParser _commandDownloadAndApplyCloudConfiguration:completionBlock:]( self,  "_commandDownloadAndApplyCloudConfiguration:completionBlock:",  v8,  v10);
    goto LABEL_53;
  }

  if ([v25 isEqualToString:@"PollMDMIfNetworkTethered"])
  {
    -[MTIPCUTunnelParser _commandPollMDMIfNetworkTetheredRequest:completionBlock:]( self,  "_commandPollMDMIfNetworkTetheredRequest:completionBlock:",  v8,  v10);
    goto LABEL_53;
  }

  if ([v25 isEqualToString:@"Escalate"])
  {
    -[MTIPCUTunnelParser _commandEscalate:completionBlock:](self, "_commandEscalate:completionBlock:", v8, v10);
    goto LABEL_53;
  }

  if ([v25 isEqualToString:@"EscalateResponse"])
  {
    -[MTIPCUTunnelParser _commandEscalateResponse:completionBlock:]( self,  "_commandEscalateResponse:completionBlock:",  v8,  v10);
    goto LABEL_53;
  }

  if ([v25 isEqualToString:@"EstablishProvisionalEnrollment"])
  {
    -[MTIPCUTunnelParser _commandEstablishProvisionalEnrollmentRequest:completionBlock:]( self,  "_commandEstablishProvisionalEnrollmentRequest:completionBlock:",  v8,  v10);
    goto LABEL_53;
  }

  if ([v25 isEqualToString:@"EraseDevice"])
  {
    -[MTIPCUTunnelParser _commandEraseDevice:completionBlock:](self, "_commandEraseDevice:completionBlock:", v8, v10);
    goto LABEL_53;
  }

  if (![v25 isEqualToString:@"SetWiFiPowerState"])
  {
    v29.receiver = self;
    v29.super_class = (Class)&OBJC_CLASS___MTIPCUTunnelParser;
    -[MTIPCUTunnelParser processRequest:assertion:completionBlock:]( &v29,  "processRequest:assertion:completionBlock:",  v8,  v9,  v10);
    goto LABEL_53;
  }

  uint64_t v27 = objc_claimAutoreleasedReturnValue(-[MTIPCUTunnelParser _commandSetWiFiPower:](self, "_commandSetWiFiPower:", v8));
LABEL_29:
  uint64_t v28 = (void *)v27;
  if (v10) {
    v10[2](v10, v27);
  }
LABEL_31:
}

- (id)escalationBlock
{
  return self->_escalationBlock;
}

- (void)setEscalationBlock:(id)a3
{
}

- (NSMutableDictionary)CSR
{
  return self->_CSR;
}

- (void)setCSR:(id)a3
{
}

- (NSString)hostIdentifier
{
  return self->_hostIdentifier;
}

- (void)setHostIdentifier:(id)a3
{
}

- (NSData)challengeCertificate
{
  return self->_challengeCertificate;
}

- (void)setChallengeCertificate:(id)a3
{
}

- (NSData)challenge
{
  return self->_challenge;
}

- (void)setChallenge:(id)a3
{
}

- (int64_t)downloadAndApplyCloudConfigurationCommandRetryCount
{
  return self->_downloadAndApplyCloudConfigurationCommandRetryCount;
}

- (void)setDownloadAndApplyCloudConfigurationCommandRetryCount:(int64_t)a3
{
  self->_downloadAndApplyCloudConfigurationCommandRetryCount = a3;
}

- (int64_t)setCloudConfigurationCommandRetryCount
{
  return self->_setCloudConfigurationCommandRetryCount;
}

- (void)setSetCloudConfigurationCommandRetryCount:(int64_t)a3
{
  self->_setCloudConfigurationCommandRetryCount = a3;
}

- (void).cxx_destruct
{
}

@end