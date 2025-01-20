@interface AKAuthenticationServerResponse
+ (id)decodedConfigurationInfo:(id)a3;
- (AKAuthenticationServerResponse)initWithSRPContext:(id)a3;
- (AKAuthenticationServerResponse)initWithServerResponse:(id)a3 forAppleID:(id)a4;
- (AKAuthenticationServerResponse)initWithServerResponse:(id)a3 responseBody:(id)a4;
- (AKMasterToken)masterToken;
- (AKToken)continuationToken;
- (AKToken)custodianSetupToken;
- (AKToken)heartbeatToken;
- (AKToken)idmsDataToken;
- (AKToken)inheritanceBeneficiarySetupToken;
- (AKToken)passwordEquivalentToken;
- (AKToken)passwordResetToken;
- (AKToken)passwordlessToken;
- (AKToken)shortLivedToken;
- (BOOL)_shouldBackgroundiCloudSignIn;
- (BOOL)allowPiggybacking;
- (BOOL)allowPiggybackingPresence;
- (BOOL)authorizationUsed;
- (BOOL)canBackgroundiCloudSignIn;
- (BOOL)isAnisetteReprovisioningRequired;
- (BOOL)isAnisetteResyncRequired;
- (BOOL)isAuditLogin;
- (BOOL)isDemoAccount;
- (BOOL)isFidoAuthRequired;
- (BOOL)isFirstPartyApp;
- (BOOL)isManagedAppleID;
- (BOOL)isMdmInfoRequired;
- (BOOL)isPasscodeResetRequired;
- (BOOL)isProximityEligible;
- (BOOL)isRetryRequired;
- (BOOL)isSecondaryActionRequired;
- (BOOL)isSecondaryActionURLGSEndpoint;
- (BOOL)isSenior;
- (BOOL)isServerUIRequired;
- (BOOL)isSiwaForChildEnabled;
- (BOOL)isURLSwitchingRequired;
- (BOOL)isUnderAgeOfMajority;
- (BOOL)isUpdateable;
- (BOOL)phoneAsAppleID;
- (BOOL)primaryEmailVetted;
- (BOOL)requireSigningHeaders;
- (BOOL)shouldProxyAnisetteAction;
- (BOOL)shouldReportTokenGenerationMetricsWithTokenGenerationInfo:(id)a3;
- (BOOL)updateWithSecondaryAuthenticationResponse:(id)a3;
- (BOOL)updateWithSecondaryAuthenticationResponse:(id)a3 shouldUpdateDSID:(BOOL)a4;
- (NSArray)aliases;
- (NSArray)beneficiaryInfo;
- (NSArray)custodianInfos;
- (NSArray)federatedAuthURLWhiteList;
- (NSArray)loginHandles;
- (NSArray)securityKeys;
- (NSArray)trustedPhoneNumbers;
- (NSData)anisetteResyncData;
- (NSData)federatedAuthRequestPayload;
- (NSDictionary)acceptedTermsInfo;
- (NSDictionary)additionalInfo;
- (NSDictionary)configurationInfo;
- (NSDictionary)federatedAuthSamlRequest;
- (NSDictionary)serverProvidedData;
- (NSDictionary)serviceTokens;
- (NSNumber)SOSNeeded;
- (NSNumber)acceptedDeviceTermsVersion;
- (NSNumber)adpCohort;
- (NSNumber)ageOfMajority;
- (NSNumber)askToBuy;
- (NSNumber)beneficiaryLastModified;
- (NSNumber)birthDay;
- (NSNumber)birthMonth;
- (NSNumber)birthYear;
- (NSNumber)canAttestAge;
- (NSNumber)canBeBeneficiary;
- (NSNumber)canBeCustodian;
- (NSNumber)canHaveBeneficiary;
- (NSNumber)canHaveCustodian;
- (NSNumber)custodianEnabled;
- (NSNumber)custodianLastModified;
- (NSNumber)dsid;
- (NSNumber)edpState;
- (NSNumber)hasMDM;
- (NSNumber)hasModernRecoveryKey;
- (NSNumber)hasSOSActiveDevice;
- (NSNumber)isNotificationEmailAvailable;
- (NSNumber)passcodeAuth;
- (NSNumber)passcodeAuthEnabled;
- (NSNumber)passkeyEligible;
- (NSNumber)passkeyPresent;
- (NSNumber)passwordVersion;
- (NSNumber)privateAttestationEnabled;
- (NSNumber)serverExperimentalFeatures;
- (NSNumber)srpIteration;
- (NSNumber)thirdPartyRegulatoryOverride;
- (NSNumber)webAccessEnabled;
- (NSString)altDSID;
- (NSString)appleID;
- (NSString)appleIDCountryCode;
- (NSString)beneficiaryIdentifier;
- (NSString)beneficiaryWrappedKey;
- (NSString)configDataVersion;
- (NSString)custodianSessionID;
- (NSString)errorMessage;
- (NSString)errorMessageTitle;
- (NSString)federatedAuthURL;
- (NSString)firstName;
- (NSString)imageURLString;
- (NSString)lastName;
- (NSString)managedOrganizationName;
- (NSString)nativeActionURLKey;
- (NSString)notificationEmail;
- (NSString)primaryEmail;
- (NSString)privateEmail;
- (NSString)secondaryActionMessage;
- (NSString)secondaryActionURLKey;
- (NSString)serverInfo;
- (NSString)signInWithAppleSharedAccountGroupID;
- (NSString)srpProtocol;
- (NSString)srpSalt;
- (NSString)transactionId;
- (NSString)urlSwitchingData;
- (id)_decodeBase64String:(id)a3;
- (id)_federatedPayloadFromInfo:(id)a3;
- (id)_numberFormatter;
- (int64_t)errorCode;
- (int64_t)subErrorCode;
- (unint64_t)appleIDSecurityLevel;
- (unint64_t)authMode;
- (unint64_t)managedOrganizationType;
- (void)_harvestCommonFieldsFromBody:(id)a3;
- (void)_harvestCommonFieldsFromResponse:(id)a3;
- (void)_harvestManagedAppleIDInfoFromDictionary:(id)a3;
- (void)_setHeartbeatToken:(id)a3;
- (void)_setIdmsDataToken:(id)a3;
- (void)_setPasswordEquivalentToken:(id)a3;
- (void)_setPasswordlessToken:(id)a3;
- (void)_updateADPCohortWithRawValue:(id)a3;
- (void)_updateAccountInformationWithResultsDictionary:(id)a3;
- (void)_updateDSIDWithRawValue:(id)a3;
- (void)_updateEDPStateWithRawValue:(id)a3;
- (void)_updatePasswordVersionWithRawValue:(id)a3;
- (void)_updateSRPIterationWithRawValue:(id)a3;
- (void)_updateSRPProtocolWithRawValue:(id)a3;
- (void)_updateSRPSaltWithRawValue:(id)a3;
- (void)reportCriticalAuthTokensTelemetryForFlow:(unint64_t)a3 withTokenGenerationInfo:(id)a4;
- (void)updateWithSecondaryAuthenticationBody:(id)a3;
@end

@implementation AKAuthenticationServerResponse

+ (id)decodedConfigurationInfo:(id)a3
{
  return objc_msgSend(a3, "aaf_map:", &stru_1001C6830);
}

- (AKAuthenticationServerResponse)initWithSRPContext:(id)a3
{
  id v4 = a3;
  v336.receiver = self;
  v336.super_class = (Class)&OBJC_CLASS___AKAuthenticationServerResponse;
  v5 = -[AKAuthenticationServerResponse init](&v336, "init");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 serverProvidedData]);
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 status]);
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v4 serverProvidedData]);
    serverProvidedData = v5->_serverProvidedData;
    v5->_serverProvidedData = (NSDictionary *)v8;

    uint64_t v11 = _AKLogSystem(v10);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ak_redactedCopy"));
      *(_DWORD *)buf = 138412546;
      uint64_t v339 = v7;
      __int16 v340 = 2112;
      id v341 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Creating AKAuthenticationServerResponse with status: %@ contents: %@",  buf,  0x16u);
    }

    v331 = (void *)v7;

    uint64_t v14 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"atxid"]);
    transactionId = v5->_transactionId;
    v5->_transactionId = (NSString *)v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"apb"]);
    v5->_allowPiggybacking = [v16 BOOLValue];

    v17 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"pbp"]);
    v5->_allowPiggybackingPresence = [v17 BOOLValue];

    v18 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"alias"]);
    uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSArray, v19, v20, v21);
    if ((objc_opt_isKindOfClass(v18, v22) & 1) != 0) {
      objc_storeStrong((id *)&v5->_aliases, v18);
    }
    v327 = v18;
    -[AKAuthenticationServerResponse _updateAccountInformationWithResultsDictionary:]( v5,  "_updateAccountInformationWithResultsDictionary:",  v6);
    id v328 = v4;
    uint64_t v23 = objc_claimAutoreleasedReturnValue([v4 masterToken]);
    masterToken = v5->_masterToken;
    v5->_masterToken = (AKMasterToken *)v23;

    v25 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    serviceTokens = v5->_serviceTokens;
    v5->_serviceTokens = v25;

    __int128 v332 = 0u;
    __int128 v333 = 0u;
    __int128 v334 = 0u;
    __int128 v335 = 0u;
    id v27 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"t"]);
    id v28 = [v27 countByEnumeratingWithState:&v332 objects:v337 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v333;
      do
      {
        for (i = 0LL; i != v29; i = (char *)i + 1)
        {
          if (*(void *)v333 != v30) {
            objc_enumerationMutation(v27);
          }
          uint64_t v32 = *(void *)(*((void *)&v332 + 1) + 8LL * (void)i);
          v33 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:v32]);
          v34 = (void *)objc_claimAutoreleasedReturnValue(+[AKToken tokenWithDictionary:](&OBJC_CLASS___AKToken, "tokenWithDictionary:", v33));
          if (v34) {
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v5->_serviceTokens,  "setObject:forKeyedSubscript:",  v34,  v32);
          }
        }

        id v29 = [v27 countByEnumeratingWithState:&v332 objects:v337 count:16];
      }

      while (v29);
    }

    v35 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"mu"]);
    v36 = v35;
    if (v35) {
      v5->_isManagedAppleID = [v35 BOOLValue];
    }
    v37 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"demoAccount"]);
    v38 = v37;
    if (v37) {
      v5->_isDemoAccount = [v37 BOOLValue];
    }
    v326 = v38;
    uint64_t v39 = objc_claimAutoreleasedReturnValue([v331 objectForKeyedSubscript:@"fu"]);
    federatedAuthURL = v5->_federatedAuthURL;
    v5->_federatedAuthURL = (NSString *)v39;

    uint64_t v41 = objc_claimAutoreleasedReturnValue([v331 objectForKeyedSubscript:@"params"]);
    federatedAuthSamlRequest = v5->_federatedAuthSamlRequest;
    v5->_federatedAuthSamlRequest = (NSDictionary *)v41;

    v43 = (void *)objc_claimAutoreleasedReturnValue([v331 objectForKeyedSubscript:@"params"]);
    uint64_t v44 = objc_claimAutoreleasedReturnValue(-[AKAuthenticationServerResponse _federatedPayloadFromInfo:](v5, "_federatedPayloadFromInfo:", v43));
    federatedAuthRequestPayload = v5->_federatedAuthRequestPayload;
    v5->_federatedAuthRequestPayload = (NSData *)v44;

    uint64_t v46 = objc_claimAutoreleasedReturnValue([v331 objectForKeyedSubscript:@"dm"]);
    federatedAuthURLWhiteList = v5->_federatedAuthURLWhiteList;
    v5->_federatedAuthURLWhiteList = (NSArray *)v46;

    v48 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"al"]);
    v49 = v48;
    if (v48) {
      v5->_isAuditLogin = [v48 BOOLValue];
    }
    v325 = v49;
    uint64_t v50 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"imu"]);
    imageURLString = v5->_imageURLString;
    v5->_imageURLString = (NSString *)v50;

    v55 = (void *)objc_claimAutoreleasedReturnValue([v331 objectForKeyedSubscript:@"hsc"]);
    if (v55)
    {
      uint64_t v56 = objc_opt_class(&OBJC_CLASS___NSNumber, v52, v53, v54);
      uint64_t isKindOfClass = objc_opt_isKindOfClass(v55, v56);
      if ((isKindOfClass & 1) != 0)
      {
        if ([v55 integerValue] == (id)409)
        {
          v5->_isSecondaryActionRequired = 1;
        }

        else if ([v55 integerValue] == (id)433)
        {
          v5->_isAnisetteReprovisioningRequired = 1;
        }

        else if ([v55 integerValue] == (id)434)
        {
          v5->_isAnisetteResyncRequired = 1;
        }

        else if ([v55 integerValue] == (id)435)
        {
          v5->_isURLSwitchingRequired = 1;
          uint64_t v314 = objc_claimAutoreleasedReturnValue([v331 objectForKeyedSubscript:@"X-Apple-I-Data"]);
          urlSwitchingData = v5->_urlSwitchingData;
          v5->_urlSwitchingData = (NSString *)v314;
        }

        else if ([v55 integerValue] == (id)436)
        {
          v5->_isRetryRequired = 1;
        }
      }

      else
      {
        uint64_t v58 = _AKLogSystem(isKindOfClass);
        v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
          sub_10012B814(v59, v60, v61, v62, v63, v64, v65, v66);
        }
      }
    }

    v70 = (void *)objc_claimAutoreleasedReturnValue([v331 objectForKeyedSubscript:@"au"]);
    if (v70)
    {
      uint64_t v71 = objc_opt_class(&OBJC_CLASS___NSString, v67, v68, v69);
      uint64_t v72 = objc_opt_isKindOfClass(v70, v71);
      if ((v72 & 1) != 0)
      {
        v73 = v70;
        secondaryActionURLKey = (os_log_s *)v5->_secondaryActionURLKey;
        v5->_secondaryActionURLKey = v73;
      }

      else
      {
        uint64_t v75 = _AKLogSystem(v72);
        secondaryActionURLKey = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
        if (os_log_type_enabled(secondaryActionURLKey, OS_LOG_TYPE_ERROR)) {
          sub_10012B7A4(secondaryActionURLKey, v76, v77, v78, v79, v80, v81, v82);
        }
      }
    }

    v330 = (void *)objc_claimAutoreleasedReturnValue([v331 objectForKeyedSubscript:@"autype"]);
    if ([v330 intValue])
    {
      BOOL v83 = [v330 intValue] == 1 && v5->_isSecondaryActionRequired;
      v5->_secondaryActionURLGSEndpoint = v83;
    }

    v329 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"fidoAuth"]);
    uint64_t v84 = objc_claimAutoreleasedReturnValue([v331 objectForKeyedSubscript:@"naurl"]);
    v322 = (void *)v84;
    if (v84)
    {
      v88 = (void *)v84;
      uint64_t v89 = objc_opt_class(&OBJC_CLASS___NSString, v85, v86, v87);
      uint64_t v90 = objc_opt_isKindOfClass(v88, v89);
      if ((v90 & 1) != 0)
      {
        v91 = v88;
        nativeActionURLKey = (os_log_s *)v5->_nativeActionURLKey;
        v5->_nativeActionURLKey = v91;
      }

      else
      {
        uint64_t v93 = _AKLogSystem(v90);
        nativeActionURLKey = (os_log_s *)objc_claimAutoreleasedReturnValue(v93);
        if (os_log_type_enabled(nativeActionURLKey, OS_LOG_TYPE_ERROR)) {
          sub_10012B734(nativeActionURLKey, v94, v95, v96, v97, v98, v99, v100);
        }
      }
    }

    v323 = v70;
    v324 = v55;
    v101 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"sm"]);
    if (v101) {
      objc_storeStrong((id *)&v5->_secondaryActionMessage, v101);
    }
    v321 = v101;
    uint64_t v102 = objc_claimAutoreleasedReturnValue([v331 objectForKeyedSubscript:@"em"]);
    errorMessage = v5->_errorMessage;
    v5->_errorMessage = (NSString *)v102;

    uint64_t v104 = objc_claimAutoreleasedReturnValue([v331 objectForKeyedSubscript:@"tt"]);
    errorMessageTitle = v5->_errorMessageTitle;
    v5->_errorMessageTitle = (NSString *)v104;

    uint64_t v106 = AKSubErrorStatusCodeKey;
    v107 = (void *)objc_claimAutoreleasedReturnValue([v331 objectForKeyedSubscript:AKSubErrorStatusCodeKey]);
    char v108 = objc_opt_respondsToSelector(v107, "integerValue");

    if ((v108 & 1) != 0)
    {
      v109 = (void *)objc_claimAutoreleasedReturnValue([v331 objectForKeyedSubscript:v106]);
      v5->_subErrorCode = (int64_t)[v109 integerValue];
    }

    v110 = (void *)objc_claimAutoreleasedReturnValue([v331 objectForKeyedSubscript:@"ec"]);
    char v111 = objc_opt_respondsToSelector(v110, "integerValue");

    if ((v111 & 1) != 0)
    {
      v112 = (void *)objc_claimAutoreleasedReturnValue([v331 objectForKeyedSubscript:@"ec"]);
      v5->_errorCode = (int64_t)[v112 integerValue];
    }

    uint64_t v113 = objc_claimAutoreleasedReturnValue([v331 objectForKeyedSubscript:@"X-Apple-I-MD-DATA"]);
    if (v113)
    {
      v114 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v113,  0LL);
      anisetteResyncData = v5->_anisetteResyncData;
      v5->_anisetteResyncData = v114;
    }

    v320 = (void *)v113;
    v319 = (void *)objc_claimAutoreleasedReturnValue([v331 objectForKeyedSubscript:@"X-Apple-I-MD-Cmd-Target"]);
    uint64_t v119 = objc_opt_class(&OBJC_CLASS___NSDictionary, v116, v117, v118);
    id v120 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"continuationKey"]);
    if ((objc_opt_isKindOfClass(v120, v119) & 1) != 0) {
      id v121 = v120;
    }
    else {
      id v121 = 0LL;
    }

    v318 = v121;
    if (v121)
    {
      uint64_t v122 = objc_claimAutoreleasedReturnValue(+[AKToken tokenWithDictionary:](&OBJC_CLASS___AKToken, "tokenWithDictionary:", v121));
      continuationToken = v5->_continuationToken;
      v5->_continuationToken = (AKToken *)v122;
    }

    else
    {
      continuationToken = (AKToken *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"ck"]);
      uint64_t v124 = objc_claimAutoreleasedReturnValue( +[AKToken tokenWithValue:lifetime:]( &OBJC_CLASS___AKToken,  "tokenWithValue:lifetime:",  continuationToken,  0LL));
      v125 = v5->_continuationToken;
      v5->_continuationToken = (AKToken *)v124;
    }

    v126 = (void *)objc_claimAutoreleasedReturnValue(-[AKToken stringValue](v5->_continuationToken, "stringValue"));
    if (v126)
    {
      uint64_t v131 = _AKLogSystem(v127);
      v132 = (os_log_s *)objc_claimAutoreleasedReturnValue(v131);
      if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v132,  OS_LOG_TYPE_DEFAULT,  "Successfully obtained new CK from SRP",  buf,  2u);
      }
    }

    uint64_t v133 = objc_opt_class(&OBJC_CLASS___NSDictionary, v128, v129, v130);
    id v134 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"passwordResetKey"]);
    if ((objc_opt_isKindOfClass(v134, v133) & 1) != 0) {
      id v135 = v134;
    }
    else {
      id v135 = 0LL;
    }

    if (v135)
    {
      uint64_t v136 = objc_claimAutoreleasedReturnValue(+[AKToken tokenWithDictionary:](&OBJC_CLASS___AKToken, "tokenWithDictionary:", v135));
      passwordResetToken = v5->_passwordResetToken;
      v5->_passwordResetToken = (AKToken *)v136;
    }

    else
    {
      passwordResetToken = (AKToken *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"prk"]);
      uint64_t v138 = objc_claimAutoreleasedReturnValue( +[AKToken tokenWithValue:lifetime:]( &OBJC_CLASS___AKToken,  "tokenWithValue:lifetime:",  passwordResetToken,  0LL));
      v139 = v5->_passwordResetToken;
      v5->_passwordResetToken = (AKToken *)v138;
    }

    v140 = (void *)objc_claimAutoreleasedReturnValue(-[AKToken stringValue](v5->_passwordResetToken, "stringValue"));
    if (v140)
    {
      uint64_t v142 = _AKLogSystem(v141);
      v143 = (os_log_s *)objc_claimAutoreleasedReturnValue(v142);
      if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v143,  OS_LOG_TYPE_DEFAULT,  "Successfully obtained new PRK from SRP",  buf,  2u);
      }
    }

    v144 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"appleIdSignInEnabled"]);
    v317 = v144;
    uint64_t v145 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"privateAttestationEnabled"]);
    privateAttestationEnabled = v5->_privateAttestationEnabled;
    v5->_privateAttestationEnabled = (NSNumber *)v145;

    v147 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"phoneAsAppleId"]);
    v316 = v135;
    v148 = (void *)objc_claimAutoreleasedReturnValue([v331 objectForKeyedSubscript:@"rsh"]);
    uint64_t v152 = objc_opt_class(&OBJC_CLASS___NSNumber, v149, v150, v151);
    id v153 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:AKWebAccessEnabledKey]);
    if ((objc_opt_isKindOfClass(v153, v152) & 1) != 0) {
      v154 = (NSNumber *)v153;
    }
    else {
      v154 = 0LL;
    }

    webAccessEnabled = v5->_webAccessEnabled;
    v5->_webAccessEnabled = v154;

    uint64_t v159 = objc_opt_class(&OBJC_CLASS___NSNumber, v156, v157, v158);
    id v160 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:AKServerExperimentalFeaturesKey]);
    if ((objc_opt_isKindOfClass(v160, v159) & 1) != 0) {
      v161 = (NSNumber *)v160;
    }
    else {
      v161 = 0LL;
    }

    serverExperimentalFeatures = v5->_serverExperimentalFeatures;
    v5->_serverExperimentalFeatures = v161;

    uint64_t v166 = objc_opt_class(&OBJC_CLASS___NSNumber, v163, v164, v165);
    id v167 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:AKPasskeyEligibleKey]);
    if ((objc_opt_isKindOfClass(v167, v166) & 1) != 0) {
      v168 = (NSNumber *)v167;
    }
    else {
      v168 = 0LL;
    }

    passkeyEligible = v5->_passkeyEligible;
    v5->_passkeyEligible = v168;

    uint64_t v173 = objc_opt_class(&OBJC_CLASS___NSNumber, v170, v171, v172);
    id v174 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:AKPasskeyPresentKey]);
    if ((objc_opt_isKindOfClass(v174, v173) & 1) != 0) {
      v175 = (NSNumber *)v174;
    }
    else {
      v175 = 0LL;
    }

    passkeyPresent = v5->_passkeyPresent;
    v5->_passkeyPresent = v175;

    uint64_t v180 = objc_opt_class(&OBJC_CLASS___NSNumber, v177, v178, v179);
    id v181 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:AKProximityEligibleKey]);
    if ((objc_opt_isKindOfClass(v181, v180) & 1) != 0) {
      id v182 = v181;
    }
    else {
      id v182 = 0LL;
    }

    v5->_isProximityEligible = [v182 BOOLValue];
    uint64_t v186 = objc_opt_class(&OBJC_CLASS___NSNumber, v183, v184, v185);
    id v187 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:AKPasscodeAuthEnabledKey]);
    if ((objc_opt_isKindOfClass(v187, v186) & 1) != 0) {
      v188 = (NSNumber *)v187;
    }
    else {
      v188 = 0LL;
    }

    passcodeAuthEnabled = v5->_passcodeAuthEnabled;
    v5->_passcodeAuthEnabled = v188;

    uint64_t v193 = objc_opt_class(&OBJC_CLASS___NSNumber, v190, v191, v192);
    id v194 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:AKPasscodeAuthKey]);
    if ((objc_opt_isKindOfClass(v194, v193) & 1) != 0) {
      v195 = (NSNumber *)v194;
    }
    else {
      v195 = 0LL;
    }

    passcodeAuth = v5->_passcodeAuth;
    v5->_passcodeAuth = v195;

    uint64_t v200 = objc_opt_class(&OBJC_CLASS___NSNumber, v197, v198, v199);
    id v201 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:AKAskToBuyKey]);
    if ((objc_opt_isKindOfClass(v201, v200) & 1) != 0) {
      v202 = (NSNumber *)v201;
    }
    else {
      v202 = 0LL;
    }

    askToBuy = v5->_askToBuy;
    v5->_askToBuy = v202;

    uint64_t v207 = objc_opt_class(&OBJC_CLASS___NSNumber, v204, v205, v206);
    id v208 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:AKSOSNeededKey]);
    if ((objc_opt_isKindOfClass(v208, v207) & 1) != 0) {
      v209 = (NSNumber *)v208;
    }
    else {
      v209 = 0LL;
    }

    SOSNeeded = v5->_SOSNeeded;
    v5->_SOSNeeded = v209;

    uint64_t v211 = AKSOSActiveDeviceKey;
    v212 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:AKSOSActiveDeviceKey]);
    uint64_t v216 = objc_opt_class(&OBJC_CLASS___NSNumber, v213, v214, v215);
    if (v212)
    {
      v217 = v6;
      uint64_t v218 = v211;
    }

    else
    {
      uint64_t v218 = AKSOSActiveDeviceLegacyKey;
      v217 = v6;
    }

    id v219 = (id)objc_claimAutoreleasedReturnValue([v217 objectForKeyedSubscript:v218]);
    if ((objc_opt_isKindOfClass(v219, v216) & 1) != 0) {
      id v220 = v219;
    }
    else {
      id v220 = 0LL;
    }

    v221 = (NSNumber *)v220;
    hasSOSActiveDevice = v5->_hasSOSActiveDevice;
    v5->_hasSOSActiveDevice = v221;

    uint64_t v223 = objc_claimAutoreleasedReturnValue([v331 objectForKeyedSubscript:AKConfigDataVersion]);
    configDataVersion = v5->_configDataVersion;
    v5->_configDataVersion = (NSString *)v223;

    uint64_t v228 = objc_opt_class(&OBJC_CLASS___NSNumber, v225, v226, v227);
    id v229 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:AKUserBirthYearKey]);
    if ((objc_opt_isKindOfClass(v229, v228) & 1) != 0) {
      v230 = (NSNumber *)v229;
    }
    else {
      v230 = 0LL;
    }

    birthYear = v5->_birthYear;
    v5->_birthYear = v230;

    uint64_t v235 = objc_opt_class(&OBJC_CLASS___NSNumber, v232, v233, v234);
    id v236 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:AKUserBirthDayKey]);
    if ((objc_opt_isKindOfClass(v236, v235) & 1) != 0) {
      v237 = (NSNumber *)v236;
    }
    else {
      v237 = 0LL;
    }

    birthDay = v5->_birthDay;
    v5->_birthDay = v237;

    uint64_t v242 = objc_opt_class(&OBJC_CLASS___NSNumber, v239, v240, v241);
    id v243 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:AKUserBirthMonthKey]);
    if ((objc_opt_isKindOfClass(v243, v242) & 1) != 0) {
      v244 = (NSNumber *)v243;
    }
    else {
      v244 = 0LL;
    }

    birthMonth = v5->_birthMonth;
    v5->_birthMonth = v244;

    uint64_t v249 = objc_opt_class(&OBJC_CLASS___NSNumber, v246, v247, v248);
    id v250 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:AKHasModernRKKey]);
    if ((objc_opt_isKindOfClass(v250, v249) & 1) != 0) {
      v251 = (NSNumber *)v250;
    }
    else {
      v251 = 0LL;
    }

    hasModernRecoveryKey = v5->_hasModernRecoveryKey;
    v5->_hasModernRecoveryKey = v251;

    uint64_t v256 = objc_opt_class(&OBJC_CLASS___NSNumber, v253, v254, v255);
    id v257 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:AK3PRegulatoryOverrideKey]);
    if ((objc_opt_isKindOfClass(v257, v256) & 1) != 0) {
      v258 = (NSNumber *)v257;
    }
    else {
      v258 = 0LL;
    }

    thirdPartyRegulatoryOverride = v5->_thirdPartyRegulatoryOverride;
    v5->_thirdPartyRegulatoryOverride = v258;

    uint64_t v263 = objc_opt_class(&OBJC_CLASS___NSNumber, v260, v261, v262);
    id v264 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:AKADPCohortKey]);
    if ((objc_opt_isKindOfClass(v264, v263) & 1) != 0) {
      v265 = (NSNumber *)v264;
    }
    else {
      v265 = 0LL;
    }

    adpCohort = v5->_adpCohort;
    v5->_adpCohort = v265;

    uint64_t v270 = objc_opt_class(&OBJC_CLASS___NSNumber, v267, v268, v269);
    id v271 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:AKEDPStateKey]);
    if ((objc_opt_isKindOfClass(v271, v270) & 1) != 0) {
      v272 = (NSNumber *)v271;
    }
    else {
      v272 = 0LL;
    }

    edpState = v5->_edpState;
    v5->_edpState = v272;

    uint64_t v277 = objc_opt_class(&OBJC_CLASS___NSNumber, v274, v275, v276);
    id v278 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:AKPasswordVersionKey]);
    if ((objc_opt_isKindOfClass(v278, v277) & 1) != 0) {
      v279 = (NSNumber *)v278;
    }
    else {
      v279 = 0LL;
    }

    passwordVersion = v5->_passwordVersion;
    v5->_passwordVersion = v279;

    uint64_t v284 = objc_opt_class(&OBJC_CLASS___NSString, v281, v282, v283);
    id v285 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:AKSRPProtocolKey]);
    if ((objc_opt_isKindOfClass(v285, v284) & 1) != 0) {
      v286 = (NSString *)v285;
    }
    else {
      v286 = 0LL;
    }

    srpProtocol = v5->_srpProtocol;
    v5->_srpProtocol = v286;

    uint64_t v291 = objc_opt_class(&OBJC_CLASS___NSString, v288, v289, v290);
    id v292 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:AKSRPSaltKey]);
    if ((objc_opt_isKindOfClass(v292, v291) & 1) != 0) {
      v293 = (NSString *)v292;
    }
    else {
      v293 = 0LL;
    }

    srpSalt = v5->_srpSalt;
    v5->_srpSalt = v293;

    uint64_t v298 = objc_opt_class(&OBJC_CLASS___NSNumber, v295, v296, v297);
    id v299 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:AKSRPIterationCountKey]);
    if ((objc_opt_isKindOfClass(v299, v298) & 1) != 0) {
      v300 = (NSNumber *)v299;
    }
    else {
      v300 = 0LL;
    }

    srpIteration = v5->_srpIteration;
    v5->_srpIteration = v300;

    v302 = (void *)objc_claimAutoreleasedReturnValue(+[AKFeatureManager sharedManager](&OBJC_CLASS___AKFeatureManager, "sharedManager"));
    unsigned int v303 = [v302 isBackgroundiCloudSignInEnabled];

    if (v303)
    {
      v304 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:@"com.apple.gs.icloud.cloudkit.auth"]);

      if (v304)
      {
        uint64_t v306 = _AKLogSystem(v305);
        v307 = (os_log_s *)objc_claimAutoreleasedReturnValue(v306);
        if (os_log_type_enabled(v307, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v307,  OS_LOG_TYPE_DEFAULT,  "Successfully obtained new Cloudkit GS Token from SRP",  buf,  2u);
        }
      }

      v308 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:@"com.apple.gs.icloud.escrow.auth"]);

      if (v308)
      {
        uint64_t v310 = _AKLogSystem(v309);
        v311 = (os_log_s *)objc_claimAutoreleasedReturnValue(v310);
        if (os_log_type_enabled(v311, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v311,  OS_LOG_TYPE_DEFAULT,  "Successfully obtained new Escrow GS Token from SRP",  buf,  2u);
        }
      }

      v5->_canBackgroundiCloudSignIn = -[AKAuthenticationServerResponse _shouldBackgroundiCloudSignIn]( v5,  "_shouldBackgroundiCloudSignIn");
    }

    id v4 = v328;
  }

  v312 = v5;

  return v312;
}

- (id)_federatedPayloadFromInfo:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "aaf_toUrlQueryString"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByReplacingOccurrencesOfString:@"+" withString:@"%2B"]);

  uint64_t v6 = _AKLogSystem(v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    uint64_t v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Encoded payload for federated auth: %@",  (uint8_t *)&v10,  0xCu);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 dataUsingEncoding:4]);
  return v8;
}

- (AKAuthenticationServerResponse)initWithServerResponse:(id)a3 forAppleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___AKAuthenticationServerResponse;
  uint64_t v8 = -[AKAuthenticationServerResponse init](&v12, "init");
  if (v8)
  {
    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    serviceTokens = v8->_serviceTokens;
    v8->_serviceTokens = v9;

    objc_storeStrong((id *)&v8->_appleID, a4);
    -[AKAuthenticationServerResponse updateWithSecondaryAuthenticationResponse:]( v8,  "updateWithSecondaryAuthenticationResponse:",  v6);
  }

  return v8;
}

- (AKAuthenticationServerResponse)initWithServerResponse:(id)a3 responseBody:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___AKAuthenticationServerResponse;
  uint64_t v8 = -[AKAuthenticationServerResponse init](&v12, "init");
  if (v8)
  {
    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    serviceTokens = v8->_serviceTokens;
    v8->_serviceTokens = v9;

    -[AKAuthenticationServerResponse _updateAccountInformationWithResultsDictionary:]( v8,  "_updateAccountInformationWithResultsDictionary:",  v7);
    -[AKAuthenticationServerResponse updateWithSecondaryAuthenticationResponse:]( v8,  "updateWithSecondaryAuthenticationResponse:",  v6);
  }

  return v8;
}

- (void)_harvestCommonFieldsFromResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allHeaderFields]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:AKAccountNameHeaderKey]);
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&self->_appleID, v6);
  }
  if (!self->_altDSID)
  {
    uint64_t v8 = (NSString *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:AKAltDSIDHeaderKey]);
    altDSID = self->_altDSID;
    self->_altDSID = v8;
  }

  if (!self->_dsid)
  {
    int v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:AKDSIDHeaderKey]);
    -[AKAuthenticationServerResponse _updateDSIDWithRawValue:](self, "_updateDSIDWithRawValue:", v10);
  }

  if (!self->_altDSID)
  {
    uint64_t v11 = _AKLogSystem(v6);
    objc_super v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10012B8B0();
    }
  }

  if (!self->_dsid)
  {
    uint64_t v13 = _AKLogSystem(v6);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10012B884();
    }
  }

  if (self->_appleID && self->_altDSID)
  {
    v15 = -[AKMasterToken initWithAppleID:altDSID:]( objc_alloc(&OBJC_CLASS___AKMasterToken),  "initWithAppleID:altDSID:",  self->_appleID,  self->_altDSID);
    masterToken = self->_masterToken;
    self->_masterToken = v15;
  }

  v17 = (NSDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ak_acceptedTermsInfo"));
  acceptedTermsInfo = self->_acceptedTermsInfo;
  self->_acceptedTermsInfo = v17;

  uint64_t v19 = self->_acceptedTermsInfo;
  if (v19)
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v19, "objectForKeyedSubscript:", @"alternateDsid"));

    if (!v20)
    {
      id v21 = -[NSDictionary mutableCopy](self->_acceptedTermsInfo, "mutableCopy");
      [v21 setObject:self->_altDSID forKeyedSubscript:@"alternateDsid"];
      uint64_t v22 = (NSDictionary *)[v21 copy];
      uint64_t v23 = self->_acceptedTermsInfo;
      self->_acceptedTermsInfo = v22;
    }
  }

  if (!self->_adpCohort)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:AKADPCohortHeaderKey]);
    -[AKAuthenticationServerResponse _updateADPCohortWithRawValue:](self, "_updateADPCohortWithRawValue:", v24);
  }

  if (!self->_edpState)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:AKEDPStateHeaderKey]);
    -[AKAuthenticationServerResponse _updateEDPStateWithRawValue:](self, "_updateEDPStateWithRawValue:", v25);
  }

  if (!self->_passwordVersion)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:AKPasswordVersionHeaderKey]);
    -[AKAuthenticationServerResponse _updatePasswordVersionWithRawValue:]( self,  "_updatePasswordVersionWithRawValue:",  v26);
  }

  if (!self->_srpProtocol)
  {
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:AKSRPProtocolHeaderKey]);
    -[AKAuthenticationServerResponse _updateSRPProtocolWithRawValue:](self, "_updateSRPProtocolWithRawValue:", v27);
  }

  if (!self->_srpSalt)
  {
    id v28 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:AKSRPSaltHeaderKey]);
    -[AKAuthenticationServerResponse _updateSRPSaltWithRawValue:](self, "_updateSRPSaltWithRawValue:", v28);
  }

  if (!self->_srpIteration)
  {
    id v29 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:AKSRPIterationHeaderKey]);
    -[AKAuthenticationServerResponse _updateSRPIterationWithRawValue:](self, "_updateSRPIterationWithRawValue:", v29);
  }
}

- (void)_harvestCommonFieldsFromBody:(id)a3
{
  id v4 = a3;
  uint64_t v8 = v4;
  if (!self->_appleID)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"acname"]);
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString, v10, v11, v12);
    uint64_t isKindOfClass = objc_opt_isKindOfClass(v9, v13);
    if ((isKindOfClass & 1) != 0)
    {
      objc_storeStrong((id *)&self->_appleID, v9);
    }

    else
    {
      uint64_t v15 = _AKLogSystem(isKindOfClass);
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10012BABC();
      }
    }
  }

  if (!self->_lastName)
  {
    v17 = (NSString *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"ln"]);
    lastName = self->_lastName;
    self->_lastName = v17;
  }

  if (!self->_firstName)
  {
    uint64_t v19 = (NSString *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"fn"]);
    firstName = self->_firstName;
    self->_firstName = v19;
  }

  if (!self->_dsid)
  {
    id v21 = (NSNumber *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"DsPrsId"]);
    dsid = self->_dsid;
    self->_dsid = v21;
  }

  if (!self->_appleIDSecurityLevel)
  {
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"ut"]);
    uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSNumber, v24, v25, v26);
    uint64_t v28 = objc_opt_isKindOfClass(v23, v27);
    if ((v28 & 1) != 0)
    {
      self->_appleIDSecurityLevel = (unint64_t)[v23 unsignedIntegerValue];
    }

    else
    {
      uint64_t v29 = _AKLogSystem(v28);
      uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_10012BA5C();
      }
    }
  }

  if (!self->_authMode)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:AKAuthenticationModeKey]);
    uint64_t v35 = objc_opt_class(&OBJC_CLASS___NSNumber, v32, v33, v34);
    uint64_t v36 = objc_opt_isKindOfClass(v31, v35);
    if ((v36 & 1) != 0)
    {
      self->_authMode = (unint64_t)[v31 unsignedIntegerValue];
    }

    else
    {
      uint64_t v37 = _AKLogSystem(v36);
      v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        sub_10012B9FC();
      }
    }
  }

  uint64_t v39 = objc_opt_class(&OBJC_CLASS___NSNumber, v5, v6, v7);
  id v40 = (id)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:AKMDMInfoRequiredKey]);
  if ((objc_opt_isKindOfClass(v40, v39) & 1) != 0) {
    id v41 = v40;
  }
  else {
    id v41 = 0LL;
  }

  self->_isMdmInfoRequired = [v41 BOOLValue];
  if (!self->_altDSID)
  {
    v42 = (NSString *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"adsid"]);
    altDSID = self->_altDSID;
    self->_altDSID = v42;
  }

  v47 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"ageOfMajority"]);
  if (v47)
  {
    uint64_t v48 = objc_opt_class(&OBJC_CLASS___NSNumber, v44, v45, v46);
    uint64_t v49 = objc_opt_isKindOfClass(v47, v48);
    if ((v49 & 1) != 0)
    {
      uint64_t v50 = v47;
      ageOfMajority = self->_ageOfMajority;
      self->_ageOfMajority = v50;
    }

    else
    {
      uint64_t v52 = _AKLogSystem(v49);
      ageOfMajority = (NSNumber *)objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled((os_log_t)ageOfMajority, OS_LOG_TYPE_ERROR)) {
        sub_10012B99C();
      }
    }
  }

  uint64_t v53 = objc_opt_class(&OBJC_CLASS___NSNumber, v44, v45, v46);
  id v54 = (id)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:AKUserCanAttestAgeKey]);
  if ((objc_opt_isKindOfClass(v54, v53) & 1) != 0) {
    v55 = (NSNumber *)v54;
  }
  else {
    v55 = 0LL;
  }

  canAttestAge = self->_canAttestAge;
  self->_canAttestAge = v55;

  v57 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"underAge"]);
  self->_isUnderAgeOfMajority = [v57 BOOLValue];

  uint64_t v61 = objc_opt_class(&OBJC_CLASS___NSNumber, v58, v59, v60);
  id v62 = (id)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"isSiwaEnabled"]);
  if ((objc_opt_isKindOfClass(v62, v61) & 1) != 0) {
    id v63 = v62;
  }
  else {
    id v63 = 0LL;
  }

  self->_isSiwaForChildEnabled = [v63 BOOLValue];
  uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"isSenior"]);
  self->_isSenior = [v64 BOOLValue];

  uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"firstPartyApp"]);
  self->_isFirstPartyApp = [v65 BOOLValue];

  uint64_t v66 = (NSString *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"privateEmail"]);
  privateEmail = self->_privateEmail;
  self->_privateEmail = v66;

  uint64_t v68 = (NSString *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"primaryEmail"]);
  primaryEmail = self->_primaryEmail;
  self->_primaryEmail = v68;

  v70 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"primaryEmailVetted"]);
  uint64_t v74 = objc_opt_class(&OBJC_CLASS___NSNumber, v71, v72, v73);
  uint64_t v75 = objc_opt_isKindOfClass(v70, v74);
  if ((v75 & 1) != 0)
  {
    self->_primaryEmailVetted = [v70 BOOLValue];
  }

  else
  {
    uint64_t v76 = _AKLogSystem(v75);
    uint64_t v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
    if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
      sub_10012B93C();
    }
  }

  uint64_t v81 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:AKProximityEligibleKey]);
  if (v81)
  {
    uint64_t v82 = objc_opt_class(&OBJC_CLASS___NSNumber, v78, v79, v80);
    uint64_t v83 = objc_opt_isKindOfClass(v81, v82);
    if ((v83 & 1) != 0)
    {
      self->_isProximityEligible = [v81 BOOLValue];
    }

    else
    {
      uint64_t v84 = _AKLogSystem(v83);
      uint64_t v85 = (os_log_s *)objc_claimAutoreleasedReturnValue(v84);
      if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR)) {
        sub_10012B8DC();
      }
    }
  }

  uint64_t v86 = objc_opt_class(&OBJC_CLASS___NSString, v78, v79, v80);
  id v87 = (id)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"groupId"]);
  if ((objc_opt_isKindOfClass(v87, v86) & 1) != 0) {
    v88 = (NSString *)v87;
  }
  else {
    v88 = 0LL;
  }

  signInWithAppleSharedAccountGroupID = self->_signInWithAppleSharedAccountGroupID;
  self->_signInWithAppleSharedAccountGroupID = v88;

  -[AKAuthenticationServerResponse _harvestManagedAppleIDInfoFromDictionary:]( self,  "_harvestManagedAppleIDInfoFromDictionary:",  v8);
}

- (void)_harvestManagedAppleIDInfoFromDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"orgType"]);
  if (v8)
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString, v5, v6, v7);
    uint64_t isKindOfClass = objc_opt_isKindOfClass(v8, v9);
    if ((isKindOfClass & 1) != 0)
    {
      if ([v8 isEqual:@"EDU"])
      {
        unint64_t v11 = 1LL;
LABEL_12:
        self->_managedOrganizationType = v11;
        goto LABEL_13;
      }

      id v16 = [v8 isEqual:@"ENT"];
      if ((v16 & 1) != 0)
      {
        unint64_t v11 = 2LL;
        goto LABEL_12;
      }

      uint64_t v17 = _AKLogSystem(v16);
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10012BC9C();
      }
    }

    else
    {
      uint64_t v12 = _AKLogSystem(isKindOfClass);
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10012BCFC((uint64_t)v8, v13, v14, v15);
      }
    }

    unint64_t v11 = 0LL;
    goto LABEL_12;
  }

- (AKToken)passwordEquivalentToken
{
  return (AKToken *)-[NSMutableDictionary objectForKey:]( self->_serviceTokens,  "objectForKey:",  @"com.apple.gs.idms.pet");
}

- (void)_setPasswordEquivalentToken:(id)a3
{
}

- (AKToken)heartbeatToken
{
  return (AKToken *)-[NSMutableDictionary objectForKey:]( self->_serviceTokens,  "objectForKey:",  @"com.apple.gs.idms.hb");
}

- (AKToken)inheritanceBeneficiarySetupToken
{
  return (AKToken *)-[NSMutableDictionary objectForKeyedSubscript:]( self->_serviceTokens,  "objectForKeyedSubscript:",  @"com.apple.gs.idms.beneficiary.add");
}

- (void)_setHeartbeatToken:(id)a3
{
}

- (AKToken)passwordlessToken
{
  return (AKToken *)-[NSMutableDictionary objectForKey:]( self->_serviceTokens,  "objectForKey:",  @"com.apple.gs.idms.plt");
}

- (void)_setPasswordlessToken:(id)a3
{
}

- (AKToken)idmsDataToken
{
  return (AKToken *)-[NSMutableDictionary objectForKey:]( self->_serviceTokens,  "objectForKey:",  @"com.apple.gs.idmsdata");
}

- (void)_setIdmsDataToken:(id)a3
{
}

- (BOOL)isUpdateable
{
  return self->_masterToken != 0LL;
}

- (void)updateWithSecondaryAuthenticationBody:(id)a3
{
  uint64_t v4 = AKIdmsDataKey;
  id v9 = a3;
  uint64_t v5 = (NSString *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v4]);
  serverInfo = self->_serverInfo;
  self->_serverInfo = v5;

  uint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:AKTransactionId]);
  transactionId = self->_transactionId;
  self->_transactionId = v7;

  -[AKAuthenticationServerResponse _updateAccountInformationWithResultsDictionary:]( self,  "_updateAccountInformationWithResultsDictionary:",  v9);
}

- (void)_updateAccountInformationWithResultsDictionary:(id)a3
{
  id v84 = a3;
  -[AKAuthenticationServerResponse _harvestCommonFieldsFromBody:](self, "_harvestCommonFieldsFromBody:", v84);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v84 objectForKeyedSubscript:@"uireq"]);
  uint64_t v5 = v4;
  if (v4) {
    self->_isServerUIRequired = [v4 BOOLValue];
  }
  uint64_t v83 = v5;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v84 objectForKeyedSubscript:@"fpc"]);
  uint64_t v7 = v6;
  if (v6) {
    self->_isPasscodeResetRequired = [v6 BOOLValue];
  }
  uint64_t v82 = v7;
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v84 objectForKeyedSubscript:@"cd"]);
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDictionary, v9, v10, v11);
  if ((objc_opt_isKindOfClass(v8, v12) & 1) != 0)
  {
    uint64_t v13 = (NSDictionary *)objc_claimAutoreleasedReturnValue( +[AKAuthenticationServerResponse decodedConfigurationInfo:]( &OBJC_CLASS___AKAuthenticationServerResponse,  "decodedConfigurationInfo:",  v8));
    configurationInfo = self->_configurationInfo;
    self->_configurationInfo = v13;
  }

  uint64_t v81 = (void *)v8;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v84 objectForKeyedSubscript:@"additionalInfo"]);
  uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSDictionary, v16, v17, v18);
  if ((objc_opt_isKindOfClass(v15, v19) & 1) != 0) {
    objc_storeStrong((id *)&self->_additionalInfo, v15);
  }
  uint64_t v80 = v15;
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v84 objectForKeyedSubscript:@"hsa2Phones"]);
  uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSArray, v21, v22, v23);
  id v25 = v20;
  if ((objc_opt_isKindOfClass(v25, v24) & 1) != 0) {
    uint64_t v26 = (NSArray *)v25;
  }
  else {
    uint64_t v26 = 0LL;
  }

  trustedPhoneNumbers = self->_trustedPhoneNumbers;
  self->_trustedPhoneNumbers = v26;

  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v84 objectForKeyedSubscript:@"securityKeys"]);
  uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSArray, v29, v30, v31);
  id v33 = v28;
  if ((objc_opt_isKindOfClass(v33, v32) & 1) != 0) {
    uint64_t v34 = (NSArray *)v33;
  }
  else {
    uint64_t v34 = 0LL;
  }

  securityKeys = self->_securityKeys;
  self->_securityKeys = v34;

  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v84 objectForKeyedSubscript:@"loginHandles"]);
  uint64_t v40 = objc_opt_class(&OBJC_CLASS___NSArray, v37, v38, v39);
  id v41 = v36;
  if ((objc_opt_isKindOfClass(v41, v40) & 1) != 0) {
    uint64_t v42 = (NSArray *)v41;
  }
  else {
    uint64_t v42 = 0LL;
  }

  loginHandles = self->_loginHandles;
  self->_loginHandles = v42;

  uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v84 objectForKeyedSubscript:@"canHaveCustodian"]);
  if (v44) {
    objc_storeStrong((id *)&self->_canHaveCustodian, v44);
  }
  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v84 objectForKeyedSubscript:@"canBeCustodian"]);
  if (v45) {
    objc_storeStrong((id *)&self->_canBeCustodian, v45);
  }
  uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v84 objectForKeyedSubscript:@"custodianEnabled"]);
  if (v46) {
    objc_storeStrong((id *)&self->_custodianEnabled, v46);
  }
  uint64_t v75 = v45;
  uint64_t v76 = v44;
  v47 = (void *)objc_claimAutoreleasedReturnValue([v84 objectForKeyedSubscript:@"custodianLastUpdateDate"]);
  if (v47) {
    objc_storeStrong((id *)&self->_custodianLastModified, v47);
  }
  uint64_t v73 = v47;
  uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v84 objectForKeyedSubscript:AKInformationCustodianInfosKey]);
  uint64_t v52 = objc_opt_class(&OBJC_CLASS___NSArray, v49, v50, v51);
  id v53 = v48;
  uint64_t v79 = v25;
  if ((objc_opt_isKindOfClass(v53, v52) & 1) != 0) {
    id v54 = (NSArray *)v53;
  }
  else {
    id v54 = 0LL;
  }

  custodianInfos = self->_custodianInfos;
  self->_custodianInfos = v54;

  uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue([v84 objectForKeyedSubscript:AKInformationBeneficiaryInfoKey]);
  uint64_t v60 = objc_opt_class(&OBJC_CLASS___NSArray, v57, v58, v59);
  id v61 = v56;
  uint64_t v77 = v41;
  uint64_t v78 = v33;
  if ((objc_opt_isKindOfClass(v61, v60) & 1) != 0) {
    id v62 = (NSArray *)v61;
  }
  else {
    id v62 = 0LL;
  }
  uint64_t v72 = v53;

  beneficiaryInfo = self->_beneficiaryInfo;
  self->_beneficiaryInfo = v62;

  uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue([v84 objectForKeyedSubscript:@"buuid"]);
  uint64_t v65 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v64);
  if (v65) {
    objc_storeStrong((id *)&self->_beneficiaryIdentifier, v64);
  }
  uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue([v84 objectForKeyedSubscript:@"canHaveBeneficiary"]);
  if (v66) {
    objc_storeStrong((id *)&self->_canHaveBeneficiary, v66);
  }
  uint64_t v74 = v46;
  uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue([v84 objectForKeyedSubscript:@"canBeBeneficiary"]);
  if (v67) {
    objc_storeStrong((id *)&self->_canBeBeneficiary, v67);
  }
  uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue([v84 objectForKeyedSubscript:@"beneficiaryWrappedKey"]);
  if ([v68 length]) {
    objc_storeStrong((id *)&self->_beneficiaryWrappedKey, v68);
  }
  uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue([v84 objectForKeyedSubscript:@"beneficiaryLastUpdateDate"]);
  if (v69) {
    objc_storeStrong((id *)&self->_beneficiaryLastModified, v69);
  }
  v70 = (void *)objc_claimAutoreleasedReturnValue([v84 objectForKeyedSubscript:@"countryCode"]);
  if (v70) {
    objc_storeStrong((id *)&self->_appleIDCountryCode, v70);
  }
  uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue([v84 objectForKeyedSubscript:@"appleManagedAccount"]);
  if (v71) {
    objc_storeStrong((id *)&self->_hasMDM, v71);
  }
}

- (BOOL)updateWithSecondaryAuthenticationResponse:(id)a3
{
  return -[AKAuthenticationServerResponse updateWithSecondaryAuthenticationResponse:shouldUpdateDSID:]( self,  "updateWithSecondaryAuthenticationResponse:shouldUpdateDSID:",  a3,  0LL);
}

- (BOOL)updateWithSecondaryAuthenticationResponse:(id)a3 shouldUpdateDSID:(BOOL)a4
{
  BOOL v201 = a4;
  id v5 = a3;
  uint64_t v6 = _AKLogSystem(v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10012C40C();
  }

  -[AKAuthenticationServerResponse _harvestCommonFieldsFromResponse:](self, "_harvestCommonFieldsFromResponse:", v5);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 allHeaderFields]);
  masterToken = self->_masterToken;
  if (!masterToken)
  {
    uint64_t v10 = _AKLogSystem(0LL);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10012C3E0();
    }

    masterToken = self->_masterToken;
  }

  id v12 = -[AKMasterToken updateWithHTTPURLResponse:](masterToken, "updateWithHTTPURLResponse:", v5);
  char v13 = (char)v12;
  uint64_t v14 = _AKLogSystem(v12);
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  uint64_t v16 = v15;
  if ((v13 & 1) != 0)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Successfully obtained a new master token.",  buf,  2u);
    }
  }

  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    sub_10012C3B4();
  }

  uint64_t v206 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:AKPETHeaderKey]);
  uint64_t v17 = objc_claimAutoreleasedReturnValue(+[AKToken tokenWithBase64String:](&OBJC_CLASS___AKToken, "tokenWithBase64String:"));
  uint64_t v18 = _AKLogSystem(v17);
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  uint64_t v20 = v19;
  if (v17)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Successfully obtained a new PET.", buf, 2u);
    }

    -[AKAuthenticationServerResponse _setPasswordEquivalentToken:](self, "_setPasswordEquivalentToken:", v17);
  }

  else
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10012C354();
    }

    char v13 = 0;
  }

  uint64_t v204 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"X-Apple-HB-Token"]);
  uint64_t v21 = objc_claimAutoreleasedReturnValue(+[AKToken tokenWithBase64String:](&OBJC_CLASS___AKToken, "tokenWithBase64String:"));
  uint64_t v22 = _AKLogSystem(v21);
  uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  uint64_t v24 = v23;
  id v208 = v5;
  BOOL v195 = v13;
  uint64_t v205 = (void *)v17;
  v203 = (void *)v21;
  if (v21)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Successfully obtained a new HB token.",  buf,  2u);
    }

    -[AKAuthenticationServerResponse _setHeartbeatToken:](self, "_setHeartbeatToken:", v21);
  }

  else
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_10012C2E4(v24, v25, v26, v27, v28, v29, v30, v31);
    }
  }

  uint64_t v207 = v8;
  v209 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"X-Apple-GS-Token"]);
  __int128 v212 = 0u;
  __int128 v213 = 0u;
  __int128 v214 = 0u;
  __int128 v215 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v209, "componentsSeparatedByString:", @", "));
  id v32 = [obj countByEnumeratingWithState:&v212 objects:v218 count:16];
  if (v32)
  {
    id v33 = v32;
    uint64_t v34 = *(void *)v213;
    do
    {
      for (i = 0LL; i != v33; i = (char *)i + 1)
      {
        if (*(void *)v213 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue( +[AKToken tokenWithBase64String:]( &OBJC_CLASS___AKToken,  "tokenWithBase64String:",  *(void *)(*((void *)&v212 + 1) + 8LL * (void)i)));
        uint64_t v37 = _AKLogSystem(v36);
        uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
        uint64_t v39 = v38;
        if (v36)
        {
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v36 name]);
            *(_DWORD *)buf = 138412290;
            v217 = v40;
            _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "Updating token for service ID %@.",  buf,  0xCu);
          }

          serviceTokens = self->_serviceTokens;
          uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue([v36 name]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](serviceTokens, "setObject:forKeyedSubscript:", v36, v39);
        }

        else if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v217 = v209;
          _os_log_error_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_ERROR,  "Invalid format for service token in header %@",  buf,  0xCu);
        }
      }

      id v33 = [obj countByEnumeratingWithState:&v212 objects:v218 count:16];
    }

    while (v33);
  }

  uint64_t v42 = objc_claimAutoreleasedReturnValue([v207 objectForKeyedSubscript:@"X-Apple-SL-Token"]);
  uint64_t v43 = _AKLogSystem(v42);
  uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
  shortLivedToken = v44;
  if (v42)
  {
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  shortLivedToken,  OS_LOG_TYPE_DEFAULT,  "Successfully obtained new SLT from secondary auth",  buf,  2u);
    }

    uint64_t v46 = (AKToken *)objc_claimAutoreleasedReturnValue(+[AKToken tokenWithBase64String:](&OBJC_CLASS___AKToken, "tokenWithBase64String:", v42));
    shortLivedToken = self->_shortLivedToken;
    self->_shortLivedToken = v46;
  }

  else if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
  {
    sub_10012C274(shortLivedToken, v47, v48, v49, v50, v51, v52, v53);
  }

  uint64_t v54 = objc_claimAutoreleasedReturnValue([v207 objectForKeyedSubscript:@"X-Apple-I-CK"]);
  uint64_t v55 = _AKLogSystem(v54);
  uint64_t v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
  continuationToken = v56;
  if (v54)
  {
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  continuationToken,  OS_LOG_TYPE_DEFAULT,  "Successfully obtained new CK from secondary auth",  buf,  2u);
    }

    uint64_t v58 = (AKToken *)objc_claimAutoreleasedReturnValue(+[AKToken idmsTokenWithBase64String:](&OBJC_CLASS___AKToken, "idmsTokenWithBase64String:", v54));
    continuationToken = self->_continuationToken;
    self->_continuationToken = v58;
  }

  else if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
  {
    sub_10012C204(continuationToken, v59, v60, v61, v62, v63, v64, v65);
  }

  uint64_t v66 = objc_claimAutoreleasedReturnValue([v207 objectForKeyedSubscript:@"X-Apple-I-PRK"]);
  uint64_t v67 = _AKLogSystem(v66);
  uint64_t v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
  passwordResetToken = v68;
  if (v66)
  {
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  passwordResetToken,  OS_LOG_TYPE_DEFAULT,  "Successfully obtained new PRK from secondary auth.",  buf,  2u);
    }

    v70 = (AKToken *)objc_claimAutoreleasedReturnValue(+[AKToken idmsTokenWithBase64String:](&OBJC_CLASS___AKToken, "idmsTokenWithBase64String:", v66));
    passwordResetToken = self->_passwordResetToken;
    self->_passwordResetToken = v70;
  }

  else if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
  {
    sub_10012C194(passwordResetToken, v71, v72, v73, v74, v75, v76, v77);
  }

  uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue([v207 objectForKeyedSubscript:@"X-Apple-AK-Auth-Type"]);
  if ([v78 isEqual:AKSecurityHeaderTypeHSA2])
  {
    unint64_t v79 = 4LL;
  }

  else if ([v78 isEqual:AKSecurityHeaderTypeHSA1])
  {
    unint64_t v79 = 3LL;
  }

  else if ([v78 isEqual:AKSecurityHeaderTypeSA])
  {
    unint64_t v79 = 2LL;
  }

  else
  {
    unint64_t v79 = 5LL;
  }

  self->_appleIDSecurityLevel = v79;
LABEL_66:
  uint64_t v200 = v78;
  self->_isSecondaryActionRequired = [v208 statusCode] == (id)409;
  uint64_t v83 = (void *)objc_claimAutoreleasedReturnValue([v207 objectForKeyedSubscript:@"X-Apple-I-AURL"]);
  if (v83)
  {
    uint64_t v84 = objc_opt_class(&OBJC_CLASS___NSString, v80, v81, v82);
    uint64_t isKindOfClass = objc_opt_isKindOfClass(v83, v84);
    if ((isKindOfClass & 1) != 0)
    {
      uint64_t v86 = v83;
      secondaryActionURLKey = self->_secondaryActionURLKey;
      self->_secondaryActionURLKey = v86;
    }

    else
    {
      uint64_t v88 = _AKLogSystem(isKindOfClass);
      secondaryActionURLKey = (NSString *)objc_claimAutoreleasedReturnValue(v88);
      if (os_log_type_enabled((os_log_t)secondaryActionURLKey, OS_LOG_TYPE_ERROR)) {
        sub_10012C124((os_log_s *)secondaryActionURLKey, v89, v90, v91, v92, v93, v94, v95);
      }
    }
  }

  uint64_t v96 = (void *)objc_claimAutoreleasedReturnValue([v207 objectForKeyedSubscript:@"X-Apple-I-AURL-Type"]);
  if ([v96 intValue])
  {
    BOOL v97 = [v96 intValue] == 1 && self->_isSecondaryActionRequired;
    self->_secondaryActionURLGSEndpoint = v97;
  }

  uint64_t v98 = objc_claimAutoreleasedReturnValue([v207 objectForKeyedSubscript:@"X-Apple-I-NAURL"]);
  uint64_t v198 = (void *)v98;
  if (v98)
  {
    uint64_t v102 = (void *)v98;
    uint64_t v103 = objc_opt_class(&OBJC_CLASS___NSString, v99, v100, v101);
    uint64_t v104 = objc_opt_isKindOfClass(v102, v103);
    if ((v104 & 1) != 0)
    {
      v105 = v102;
      nativeActionURLKey = self->_nativeActionURLKey;
      self->_nativeActionURLKey = v105;
    }

    else
    {
      uint64_t v107 = _AKLogSystem(v104);
      nativeActionURLKey = (NSString *)objc_claimAutoreleasedReturnValue(v107);
      if (os_log_type_enabled((os_log_t)nativeActionURLKey, OS_LOG_TYPE_ERROR)) {
        sub_10012C0B4((os_log_s *)nativeActionURLKey, v108, v109, v110, v111, v112, v113, v114);
      }
    }
  }

  uint64_t v118 = (void *)objc_claimAutoreleasedReturnValue([v207 objectForKeyedSubscript:@"X-Apple-I-Device-Terms"]);
  v210 = (void *)v54;
  if (v118)
  {
    uint64_t v119 = objc_opt_class(&OBJC_CLASS___NSString, v115, v116, v117);
    uint64_t v120 = objc_opt_isKindOfClass(v118, v119);
    if ((v120 & 1) != 0)
    {
      id v121 = (NSNumber *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v118 integerValue]));
      acceptedDeviceTermsVersion = self->_acceptedDeviceTermsVersion;
      self->_acceptedDeviceTermsVersion = v121;

      uint64_t v124 = _AKLogSystem(v123);
      v125 = (os_log_s *)objc_claimAutoreleasedReturnValue(v124);
      if (os_log_type_enabled(v125, OS_LOG_TYPE_DEBUG)) {
        sub_10012BFB0((uint64_t *)&self->_acceptedDeviceTermsVersion, v125, v126);
      }
    }

    else
    {
      uint64_t v135 = _AKLogSystem(v120);
      v125 = (os_log_s *)objc_claimAutoreleasedReturnValue(v135);
      if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR)) {
        sub_10012C030((uint64_t)v118, v125);
      }
    }
  }

  else
  {
    uint64_t v127 = _AKLogSystem(0LL);
    v125 = (os_log_s *)objc_claimAutoreleasedReturnValue(v127);
    if (os_log_type_enabled(v125, OS_LOG_TYPE_DEBUG)) {
      sub_10012BF40(v125, v128, v129, v130, v131, v132, v133, v134);
    }
  }

  if (v201)
  {
    uint64_t v136 = (void *)objc_claimAutoreleasedReturnValue([v207 objectForKeyedSubscript:AKDSIDHeaderKey]);
    -[AKAuthenticationServerResponse _updateDSIDWithRawValue:](self, "_updateDSIDWithRawValue:", v136);
  }

  v140 = (void *)objc_claimAutoreleasedReturnValue([v207 objectForKeyedSubscript:@"X-Apple-I-Recovery-Session-Id"]);
  if (v140)
  {
    uint64_t v141 = objc_opt_class(&OBJC_CLASS___NSString, v137, v138, v139);
    uint64_t v142 = objc_opt_isKindOfClass(v140, v141);
    if ((v142 & 1) != 0)
    {
      v143 = v140;
      custodianSessionID = self->_custodianSessionID;
      self->_custodianSessionID = v143;
    }

    else
    {
      uint64_t v145 = _AKLogSystem(v142);
      custodianSessionID = (NSString *)objc_claimAutoreleasedReturnValue(v145);
      if (os_log_type_enabled((os_log_t)custodianSessionID, OS_LOG_TYPE_ERROR)) {
        sub_10012BED0((os_log_s *)custodianSessionID, v146, v147, v148, v149, v150, v151, v152);
      }
    }
  }

  v196 = v118;
  uint64_t v197 = v96;
  uint64_t v199 = v83;
  v202 = (void *)v66;
  id v153 = (void *)v42;
  v154 = (void *)objc_claimAutoreleasedReturnValue([v207 objectForKeyedSubscript:AKADPCohortHeaderKey]);
  -[AKAuthenticationServerResponse _updateADPCohortWithRawValue:](self, "_updateADPCohortWithRawValue:");
  v155 = (void *)objc_claimAutoreleasedReturnValue([v207 objectForKeyedSubscript:AKEDPStateHeaderKey]);
  -[AKAuthenticationServerResponse _updateEDPStateWithRawValue:](self, "_updateEDPStateWithRawValue:", v155);
  uint64_t v156 = (void *)objc_claimAutoreleasedReturnValue([v207 objectForKeyedSubscript:AKPasswordVersionHeaderKey]);
  -[AKAuthenticationServerResponse _updatePasswordVersionWithRawValue:]( self,  "_updatePasswordVersionWithRawValue:",  v156);
  uint64_t v157 = (void *)objc_claimAutoreleasedReturnValue(+[AKFeatureManager sharedManager](&OBJC_CLASS___AKFeatureManager, "sharedManager"));
  unsigned int v158 = [v157 isBackgroundiCloudSignInEnabled];

  if (v158)
  {
    uint64_t v159 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_serviceTokens,  "objectForKeyedSubscript:",  @"com.apple.gs.icloud.cloudkit.auth"));

    if (!v159)
    {
      uint64_t v161 = _AKLogSystem(v160);
      v162 = (os_log_s *)objc_claimAutoreleasedReturnValue(v161);
      if (os_log_type_enabled(v162, OS_LOG_TYPE_DEBUG)) {
        sub_10012BE60(v162, v163, v164, v165, v166, v167, v168, v169);
      }
    }

    uint64_t v170 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_serviceTokens,  "objectForKeyedSubscript:",  @"com.apple.gs.icloud.escrow.auth"));

    if (!v170)
    {
      uint64_t v172 = _AKLogSystem(v171);
      uint64_t v173 = (os_log_s *)objc_claimAutoreleasedReturnValue(v172);
      if (os_log_type_enabled(v173, OS_LOG_TYPE_DEBUG)) {
        sub_10012BDF0(v173, v174, v175, v176, v177, v178, v179, v180);
      }
    }

    self->_canBackgroundiCloudSignIn = -[AKAuthenticationServerResponse _shouldBackgroundiCloudSignIn]( self,  "_shouldBackgroundiCloudSignIn");
  }

  -[AKAuthenticationServerResponse reportCriticalAuthTokensTelemetryForFlow:withTokenGenerationInfo:]( self,  "reportCriticalAuthTokensTelemetryForFlow:withTokenGenerationInfo:",  2LL,  0LL);
  uint64_t v184 = objc_opt_class(&OBJC_CLASS___NSString, v181, v182, v183);
  uint64_t v188 = objc_opt_class(v184, v185, v186, v187);
  id v189 = (id)objc_claimAutoreleasedReturnValue([v207 objectForKeyedSubscript:AKMDMInfoRequiredHeaderKey]);
  id v190 = 0LL;
  if ((objc_opt_isKindOfClass(v189, v188) & 1) != 0) {
    id v190 = v189;
  }

  if (v190)
  {
    uint64_t v192 = _AKLogSystem(v191);
    uint64_t v193 = (os_log_s *)objc_claimAutoreleasedReturnValue(v192);
    if (os_log_type_enabled(v193, OS_LOG_TYPE_DEBUG)) {
      sub_10012BD7C();
    }

    self->_isMdmInfoRequired = [v190 BOOLValue];
  }

  return v195;
}

- (void)_updateDSIDWithRawValue:(id)a3
{
  id v5 = a3;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber, v6, v7, v8);
  if ((objc_opt_isKindOfClass(v5, v9) & 1) != 0)
  {
    objc_storeStrong((id *)&self->_dsid, a3);
  }

  else
  {
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString, v10, v11, v12);
    uint64_t isKindOfClass = objc_opt_isKindOfClass(v5, v13);
    if ((isKindOfClass & 1) != 0)
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthenticationServerResponse _numberFormatter](self, "_numberFormatter"));
      uint64_t v16 = (NSNumber *)objc_claimAutoreleasedReturnValue([v15 numberFromString:v5]);
      dsid = self->_dsid;
      self->_dsid = v16;
    }

    else
    {
      uint64_t v18 = _AKLogSystem(isKindOfClass);
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_10012C46C();
      }
    }
  }
}

- (void)_updateADPCohortWithRawValue:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber, v5, v6, v7);
  uint64_t isKindOfClass = objc_opt_isKindOfClass(v4, v8);
  char v10 = isKindOfClass;
  uint64_t v11 = _AKLogSystem(isKindOfClass);
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  adpCohort = (NSNumber *)v12;
  if ((v10 & 1) != 0)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_10012C4CC((uint64_t)self, (os_log_s *)adpCohort, v14);
    }

    uint64_t v15 = (NSNumber *)v4;
    adpCohort = self->_adpCohort;
    self->_adpCohort = v15;
  }

  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    sub_10012C550();
  }
}

- (void)_updateEDPStateWithRawValue:(id)a3
{
  id v5 = a3;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber, v6, v7, v8);
  if ((objc_opt_isKindOfClass(v5, v9) & 1) != 0)
  {
    objc_storeStrong((id *)&self->_edpState, a3);
  }

  else
  {
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString, v10, v11, v12);
    uint64_t isKindOfClass = objc_opt_isKindOfClass(v5, v13);
    if ((isKindOfClass & 1) != 0)
    {
      uint64_t v15 = (NSNumber *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v5 integerValue]));
      edpState = self->_edpState;
      self->_edpState = v15;
    }

    else
    {
      uint64_t v17 = _AKLogSystem(isKindOfClass);
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10012C5B0();
      }
    }
  }
}

- (void)_updatePasswordVersionWithRawValue:(id)a3
{
  id v5 = a3;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber, v6, v7, v8);
  if ((objc_opt_isKindOfClass(v5, v9) & 1) != 0)
  {
    objc_storeStrong((id *)&self->_passwordVersion, a3);
  }

  else
  {
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString, v10, v11, v12);
    uint64_t isKindOfClass = objc_opt_isKindOfClass(v5, v13);
    if ((isKindOfClass & 1) != 0)
    {
      uint64_t v15 = (NSNumber *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v5 integerValue]));
      passwordVersion = self->_passwordVersion;
      self->_passwordVersion = v15;
    }

    else
    {
      uint64_t v17 = _AKLogSystem(isKindOfClass);
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10012C610();
      }
    }
  }
}

- (void)_updateSRPProtocolWithRawValue:(id)a3
{
  id v5 = a3;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString, v6, v7, v8);
  uint64_t isKindOfClass = objc_opt_isKindOfClass(v5, v9);
  if ((isKindOfClass & 1) != 0)
  {
    objc_storeStrong((id *)&self->_srpProtocol, a3);
  }

  else
  {
    uint64_t v11 = _AKLogSystem(isKindOfClass);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10012C670();
    }
  }
}

- (void)_updateSRPSaltWithRawValue:(id)a3
{
  id v5 = a3;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString, v6, v7, v8);
  uint64_t isKindOfClass = objc_opt_isKindOfClass(v5, v9);
  if ((isKindOfClass & 1) != 0)
  {
    objc_storeStrong((id *)&self->_srpSalt, a3);
  }

  else
  {
    uint64_t v11 = _AKLogSystem(isKindOfClass);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10012C6D0();
    }
  }
}

- (void)_updateSRPIterationWithRawValue:(id)a3
{
  id v5 = a3;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber, v6, v7, v8);
  if ((objc_opt_isKindOfClass(v5, v9) & 1) != 0)
  {
    objc_storeStrong((id *)&self->_srpIteration, a3);
  }

  else
  {
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString, v10, v11, v12);
    uint64_t isKindOfClass = objc_opt_isKindOfClass(v5, v13);
    if ((isKindOfClass & 1) != 0)
    {
      uint64_t v15 = (NSNumber *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v5 integerValue]));
      srpIteration = self->_srpIteration;
      self->_srpIteration = v15;
    }

    else
    {
      uint64_t v17 = _AKLogSystem(isKindOfClass);
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10012C730();
      }
    }
  }
}

- (id)_decodeBase64String:(id)a3
{
  id v3 = a3;
  id v4 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v3,  0LL);

  id v5 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v4, 4LL);
  return v5;
}

- (id)_numberFormatter
{
  if (qword_10020F248 != -1) {
    dispatch_once(&qword_10020F248, &stru_1001C6850);
  }
  return (id)qword_10020F240;
}

- (BOOL)_shouldBackgroundiCloudSignIn
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLBag bagForAltDSID:](&OBJC_CLASS___AKURLBag, "bagForAltDSID:", 0LL));
  unsigned int v4 = [v3 isBackgroundiCloudSignInEnabled];

  if (!v4) {
    goto LABEL_7;
  }
  uint64_t v5 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_serviceTokens,  "objectForKeyedSubscript:",  @"com.apple.gs.icloud.cloudkit.auth"));
  if (!v5) {
    return v5;
  }
  uint64_t v6 = (void *)v5;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_serviceTokens,  "objectForKeyedSubscript:",  @"com.apple.gs.icloud.escrow.auth"));

  if (!v7)
  {
LABEL_7:
    LOBYTE(v5) = 0;
    return v5;
  }

  uint64_t v9 = _AKLogSystem(v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Elligible for backgrounding iCloud Sign In",  v12,  2u);
  }

  LOBYTE(v5) = 1;
  return v5;
}

- (void)reportCriticalAuthTokensTelemetryForFlow:(unint64_t)a3 withTokenGenerationInfo:(id)a4
{
  id v32 = a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 authKitAccountWithAltDSID:self->_altDSID error:0]);
  if (!-[AKAuthenticationServerResponse shouldReportTokenGenerationMetricsWithTokenGenerationInfo:]( self,  "shouldReportTokenGenerationMetricsWithTokenGenerationInfo:",  v32)) {
    goto LABEL_24;
  }
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[AKToken stringValue](self->_passwordResetToken, "stringValue"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[AKToken stringValue](self->_continuationToken, "stringValue"));
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber, v10, v11, v12);
  id v14 = (id)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:@"ckgen"]);
  if ((objc_opt_isKindOfClass(v14, v13) & 1) != 0) {
    id v15 = v14;
  }
  else {
    id v15 = 0LL;
  }

  unsigned int v16 = [v15 BOOLValue];
  uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSNumber, v17, v18, v19);
  id v21 = (id)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:@"prkgen"]);
  if ((objc_opt_isKindOfClass(v21, v20) & 1) != 0) {
    id v22 = v21;
  }
  else {
    id v22 = 0LL;
  }

  unsigned int v23 = [v22 BOOLValue];
  if (a3 == 1)
  {
    if (v9) {
      char v24 = 0;
    }
    else {
      char v24 = v16;
    }
    if (v8) {
      unsigned int v25 = 0;
    }
    else {
      unsigned int v25 = v23;
    }
    int v26 = v25 & v16;
    if ((v24 & 1) != 0)
    {
LABEL_16:
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7116LL));
      [v6 _reportTokenWithTelemetryID:@"com.apple.authkit.token.ck.create" account:v7 telemetryFlowID:0 error:v27];

      if ((v26 & 1) == 0) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
  }

  else
  {
    int v26 = v8 == 0LL;
    if (!v9) {
      goto LABEL_16;
    }
  }

  if (v26)
  {
LABEL_20:
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7117LL));
    [v6 _reportTokenWithTelemetryID:@"com.apple.authkit.token.prk.create" account:v7 telemetryFlowID:0 error:v28];
  }

- (BOOL)shouldReportTokenGenerationMetricsWithTokenGenerationInfo:(id)a3
{
  id v4 = a3;
  uint64_t v8 = v4;
  if (!self->_errorCode)
  {
    if (self->_isSecondaryActionRequired)
    {
      uint64_t v9 = _AKLogSystem(v4);
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        sub_10012C840();
      }
    }

    else if ((self->_appleIDSecurityLevel & 0xFFFFFFFFFFFFFFFELL) == 4)
    {
      uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSNumber, v5, v6, v7);
      id v12 = (id)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:AKEphemeralAuthKey]);
      if ((objc_opt_isKindOfClass(v12, v11) & 1) != 0) {
        id v13 = v12;
      }
      else {
        id v13 = 0LL;
      }

      unsigned int v15 = [v13 BOOLValue];
      if (v15)
      {
        uint64_t v20 = _AKLogSystem(v16);
        uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          sub_10012C790();
        }
      }

      else
      {
        uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSNumber, v17, v18, v19);
        id v22 = (id)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:AKShortLivedTokenKey]);
        if ((objc_opt_isKindOfClass(v22, v21) & 1) != 0) {
          id v23 = v22;
        }
        else {
          id v23 = 0LL;
        }

        unsigned int v24 = [v23 BOOLValue];
        if (v24)
        {
          uint64_t v26 = _AKLogSystem(v25);
          uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
            sub_10012C7BC();
          }
        }

        else
        {
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:AKAppProvidedContextKey]);
          unsigned int v28 = [v27 isEqualToString:@"AuthorizationServices"];

          if (!v28)
          {
            BOOL v31 = 1;
            goto LABEL_25;
          }

          uint64_t v30 = _AKLogSystem(v29);
          uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
            sub_10012C7E8();
          }
        }
      }
    }

    else
    {
      uint64_t v14 = _AKLogSystem(v4);
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        sub_10012C814();
      }
    }
  }

  BOOL v31 = 0;
LABEL_25:

  return v31;
}

- (NSDictionary)serverProvidedData
{
  return self->_serverProvidedData;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (NSNumber)dsid
{
  return self->_dsid;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (NSArray)aliases
{
  return self->_aliases;
}

- (unint64_t)appleIDSecurityLevel
{
  return self->_appleIDSecurityLevel;
}

- (unint64_t)authMode
{
  return self->_authMode;
}

- (BOOL)isMdmInfoRequired
{
  return self->_isMdmInfoRequired;
}

- (AKMasterToken)masterToken
{
  return self->_masterToken;
}

- (AKToken)continuationToken
{
  return self->_continuationToken;
}

- (AKToken)passwordResetToken
{
  return self->_passwordResetToken;
}

- (AKToken)shortLivedToken
{
  return self->_shortLivedToken;
}

- (AKToken)custodianSetupToken
{
  return self->_custodianSetupToken;
}

- (NSDictionary)serviceTokens
{
  return &self->_serviceTokens->super;
}

- (BOOL)isRetryRequired
{
  return self->_isRetryRequired;
}

- (BOOL)isSecondaryActionRequired
{
  return self->_isSecondaryActionRequired;
}

- (BOOL)canBackgroundiCloudSignIn
{
  return self->_canBackgroundiCloudSignIn;
}

- (NSString)secondaryActionURLKey
{
  return self->_secondaryActionURLKey;
}

- (BOOL)isSecondaryActionURLGSEndpoint
{
  return self->_secondaryActionURLGSEndpoint;
}

- (BOOL)isFidoAuthRequired
{
  return self->_fidoAuthRequired;
}

- (NSString)secondaryActionMessage
{
  return self->_secondaryActionMessage;
}

- (BOOL)isURLSwitchingRequired
{
  return self->_isURLSwitchingRequired;
}

- (NSString)urlSwitchingData
{
  return self->_urlSwitchingData;
}

- (BOOL)isAnisetteResyncRequired
{
  return self->_isAnisetteResyncRequired;
}

- (NSData)anisetteResyncData
{
  return self->_anisetteResyncData;
}

- (BOOL)isAnisetteReprovisioningRequired
{
  return self->_isAnisetteReprovisioningRequired;
}

- (BOOL)shouldProxyAnisetteAction
{
  return self->_shouldProxyAnisetteAction;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (int64_t)subErrorCode
{
  return self->_subErrorCode;
}

- (NSString)errorMessageTitle
{
  return self->_errorMessageTitle;
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (NSDictionary)acceptedTermsInfo
{
  return self->_acceptedTermsInfo;
}

- (BOOL)isManagedAppleID
{
  return self->_isManagedAppleID;
}

- (BOOL)isAuditLogin
{
  return self->_isAuditLogin;
}

- (BOOL)isServerUIRequired
{
  return self->_isServerUIRequired;
}

- (BOOL)isPasscodeResetRequired
{
  return self->_isPasscodeResetRequired;
}

- (BOOL)requireSigningHeaders
{
  return self->_requireSigningHeaders;
}

- (NSDictionary)configurationInfo
{
  return self->_configurationInfo;
}

- (NSNumber)acceptedDeviceTermsVersion
{
  return self->_acceptedDeviceTermsVersion;
}

- (NSString)transactionId
{
  return self->_transactionId;
}

- (NSString)serverInfo
{
  return self->_serverInfo;
}

- (BOOL)allowPiggybacking
{
  return self->_allowPiggybacking;
}

- (BOOL)allowPiggybackingPresence
{
  return self->_allowPiggybackingPresence;
}

- (BOOL)isUnderAgeOfMajority
{
  return self->_isUnderAgeOfMajority;
}

- (BOOL)isSiwaForChildEnabled
{
  return self->_isSiwaForChildEnabled;
}

- (BOOL)isSenior
{
  return self->_isSenior;
}

- (NSNumber)ageOfMajority
{
  return self->_ageOfMajority;
}

- (NSNumber)canAttestAge
{
  return self->_canAttestAge;
}

- (BOOL)isFirstPartyApp
{
  return self->_isFirstPartyApp;
}

- (NSString)privateEmail
{
  return self->_privateEmail;
}

- (NSString)primaryEmail
{
  return self->_primaryEmail;
}

- (BOOL)primaryEmailVetted
{
  return self->_primaryEmailVetted;
}

- (NSDictionary)additionalInfo
{
  return self->_additionalInfo;
}

- (NSArray)trustedPhoneNumbers
{
  return self->_trustedPhoneNumbers;
}

- (NSArray)securityKeys
{
  return self->_securityKeys;
}

- (NSArray)loginHandles
{
  return self->_loginHandles;
}

- (NSString)nativeActionURLKey
{
  return self->_nativeActionURLKey;
}

- (NSNumber)canHaveCustodian
{
  return self->_canHaveCustodian;
}

- (NSNumber)canBeCustodian
{
  return self->_canBeCustodian;
}

- (NSNumber)custodianEnabled
{
  return self->_custodianEnabled;
}

- (NSString)custodianSessionID
{
  return self->_custodianSessionID;
}

- (NSNumber)custodianLastModified
{
  return self->_custodianLastModified;
}

- (NSArray)custodianInfos
{
  return self->_custodianInfos;
}

- (NSArray)beneficiaryInfo
{
  return self->_beneficiaryInfo;
}

- (NSNumber)canHaveBeneficiary
{
  return self->_canHaveBeneficiary;
}

- (NSNumber)canBeBeneficiary
{
  return self->_canBeBeneficiary;
}

- (NSString)beneficiaryIdentifier
{
  return self->_beneficiaryIdentifier;
}

- (NSString)beneficiaryWrappedKey
{
  return self->_beneficiaryWrappedKey;
}

- (NSNumber)beneficiaryLastModified
{
  return self->_beneficiaryLastModified;
}

- (NSString)appleIDCountryCode
{
  return self->_appleIDCountryCode;
}

- (NSNumber)hasMDM
{
  return self->_hasMDM;
}

- (unint64_t)managedOrganizationType
{
  return self->_managedOrganizationType;
}

- (NSString)managedOrganizationName
{
  return self->_managedOrganizationName;
}

- (NSNumber)isNotificationEmailAvailable
{
  return self->_isNotificationEmailAvailable;
}

- (NSString)notificationEmail
{
  return self->_notificationEmail;
}

- (NSNumber)privateAttestationEnabled
{
  return self->_privateAttestationEnabled;
}

- (NSNumber)webAccessEnabled
{
  return self->_webAccessEnabled;
}

- (NSNumber)serverExperimentalFeatures
{
  return self->_serverExperimentalFeatures;
}

- (NSNumber)hasSOSActiveDevice
{
  return self->_hasSOSActiveDevice;
}

- (NSNumber)SOSNeeded
{
  return self->_SOSNeeded;
}

- (NSString)configDataVersion
{
  return self->_configDataVersion;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (NSString)imageURLString
{
  return self->_imageURLString;
}

- (BOOL)isDemoAccount
{
  return self->_isDemoAccount;
}

- (NSString)federatedAuthURL
{
  return self->_federatedAuthURL;
}

- (NSData)federatedAuthRequestPayload
{
  return self->_federatedAuthRequestPayload;
}

- (NSDictionary)federatedAuthSamlRequest
{
  return self->_federatedAuthSamlRequest;
}

- (NSArray)federatedAuthURLWhiteList
{
  return self->_federatedAuthURLWhiteList;
}

- (BOOL)authorizationUsed
{
  return self->_authorizationUsed;
}

- (BOOL)phoneAsAppleID
{
  return self->_phoneAsAppleID;
}

- (NSNumber)passkeyEligible
{
  return self->_passkeyEligible;
}

- (NSNumber)passkeyPresent
{
  return self->_passkeyPresent;
}

- (BOOL)isProximityEligible
{
  return self->_isProximityEligible;
}

- (NSNumber)passcodeAuthEnabled
{
  return self->_passcodeAuthEnabled;
}

- (NSNumber)passcodeAuth
{
  return self->_passcodeAuth;
}

- (NSNumber)askToBuy
{
  return self->_askToBuy;
}

- (NSNumber)birthYear
{
  return self->_birthYear;
}

- (NSNumber)birthDay
{
  return self->_birthDay;
}

- (NSNumber)birthMonth
{
  return self->_birthMonth;
}

- (NSNumber)hasModernRecoveryKey
{
  return self->_hasModernRecoveryKey;
}

- (NSNumber)thirdPartyRegulatoryOverride
{
  return self->_thirdPartyRegulatoryOverride;
}

- (NSNumber)adpCohort
{
  return self->_adpCohort;
}

- (NSNumber)edpState
{
  return self->_edpState;
}

- (NSNumber)passwordVersion
{
  return self->_passwordVersion;
}

- (NSString)srpProtocol
{
  return self->_srpProtocol;
}

- (NSString)srpSalt
{
  return self->_srpSalt;
}

- (NSNumber)srpIteration
{
  return self->_srpIteration;
}

- (NSString)signInWithAppleSharedAccountGroupID
{
  return self->_signInWithAppleSharedAccountGroupID;
}

- (void).cxx_destruct
{
}

  ;
}

@end