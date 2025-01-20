@interface IDSRegistration
- (BOOL)_keychain_isEqual:(id)a3;
- (BOOL)canRegister;
- (BOOL)canSendRegistration;
- (BOOL)didRegisterWithDeviceSignature;
- (BOOL)didRegisterWithKTAccountKey;
- (BOOL)hasSentinel;
- (BOOL)isDisabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)needsMigration;
- (BOOL)needsProvisioning;
- (BOOL)needsRenewal;
- (BOOL)removeFromKeychain;
- (BOOL)runningSimpleAuthentication;
- (BOOL)saveToKeychain;
- (BOOL)shouldAutoRegisterAllHandles;
- (BOOL)shouldRegisterUsingDSHandle;
- (BOOL)stopAtAuthentication;
- (FTPasswordManager)passwordManager;
- (IDSRegistration)init;
- (IDSRegistration)initWithDictionary:(id)a3;
- (IDSRegistration)initWithPasswordManager:(id)a3;
- (NSArray)adHocServiceNames;
- (NSArray)candidateEmails;
- (NSArray)confirmedEmails;
- (NSArray)dependentRegistrations;
- (NSArray)emailsToRegister;
- (NSArray)keyTransparencyEnrolledURIs;
- (NSArray)uris;
- (NSArray)vettedEmails;
- (NSData)authenticationCert;
- (NSData)pushToken;
- (NSData)registrationCert;
- (NSDate)dependentRegistrationsTTL;
- (NSDate)nextRegistrationDate;
- (NSDate)registrationDate;
- (NSDictionary)contextInfo;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)migrationContext;
- (NSDictionary)regionServerContext;
- (NSMutableArray)_candidateEmails;
- (NSNumber)IDSVersion;
- (NSNumber)applicationVersion;
- (NSNumber)dependentRegistrationAuthRetries;
- (NSNumber)dependentRegistrationResponseCode;
- (NSNumber)identityVersion;
- (NSNumber)isCDMA;
- (NSString)authenticationToken;
- (NSString)deviceName;
- (NSString)dsHandle;
- (NSString)email;
- (NSString)environment;
- (NSString)guid;
- (NSString)idsUserID;
- (NSString)keyPairSignature;
- (NSString)mainID;
- (NSString)phoneNumber;
- (NSString)profileID;
- (NSString)regionBasePhoneNumber;
- (NSString)regionID;
- (NSString)serviceIdentifier;
- (NSString)serviceType;
- (NSString)temporaryPhoneEmail;
- (NSString)userID;
- (NSString)userUniqueIdentifier;
- (id)_keychain_comparisonValue;
- (id)_user;
- (id)_userID;
- (id)_userStore;
- (id)debugDescription;
- (id)description;
- (int)absintheRetries;
- (int)registrationType;
- (int)retries;
- (int64_t)registrationStatus;
- (unint64_t)optedIntoKT;
- (void)addCandidateEmail:(id)a3;
- (void)removeCandidateEmail:(id)a3;
- (void)setAbsintheRetries:(int)a3;
- (void)setAdHocServiceNames:(id)a3;
- (void)setApplicationVersion:(id)a3;
- (void)setAuthenticationCert:(id)a3;
- (void)setAuthenticationToken:(id)a3;
- (void)setContextInfo:(id)a3;
- (void)setDSHandle:(id)a3;
- (void)setDependentRegistrationAuthRetries:(id)a3;
- (void)setDependentRegistrationResponseCode:(id)a3;
- (void)setDependentRegistrations:(id)a3;
- (void)setDependentRegistrationsTTL:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setDidRegisterWithDeviceSignature:(BOOL)a3;
- (void)setDidRegisterWithKTAccountKey:(BOOL)a3;
- (void)setEmail:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setIDSVersion:(id)a3;
- (void)setIdentityVersion:(id)a3;
- (void)setIdsUserID:(id)a3;
- (void)setIsCDMA:(id)a3;
- (void)setIsDisabled:(BOOL)a3;
- (void)setKeyPairSignature:(id)a3;
- (void)setKeyTransparencyEnrolledURIs:(id)a3;
- (void)setMainID:(id)a3;
- (void)setMigrationContext:(id)a3;
- (void)setNeedsMigration:(BOOL)a3;
- (void)setNeedsProvisioning:(BOOL)a3;
- (void)setNeedsRenewal:(BOOL)a3;
- (void)setNextRegistrationDate:(id)a3;
- (void)setOptedIntoKT:(unint64_t)a3;
- (void)setPasswordManager:(id)a3;
- (void)setProfileID:(id)a3;
- (void)setPushToken:(id)a3;
- (void)setRegionBasePhoneNumber:(id)a3;
- (void)setRegionID:(id)a3;
- (void)setRegionServerContext:(id)a3;
- (void)setRegistrationCert:(id)a3;
- (void)setRegistrationDate:(id)a3;
- (void)setRegistrationStatus:(int64_t)a3;
- (void)setRegistrationType:(int)a3;
- (void)setRetries:(int)a3;
- (void)setRunningSimpleAuthentication:(BOOL)a3;
- (void)setServiceIdentifier:(id)a3;
- (void)setServiceType:(id)a3;
- (void)setShouldAutoRegisterAllHandles:(BOOL)a3;
- (void)setShouldRegisterUsingDSHandle:(BOOL)a3;
- (void)setTemporaryPhoneEmail:(id)a3;
- (void)setUris:(id)a3;
- (void)setUserUniqueIdentifier:(id)a3;
- (void)setVettedEmails:(id)a3;
- (void)set_candidateEmails:(id)a3;
- (void)voidAuthenticationTokenAllowingGracePeriod;
- (void)voidPassword;
@end

@implementation IDSRegistration

- (BOOL)_keychain_isEqual:(id)a3
{
  id v4 = a3;
  if (!-[IDSRegistration isEqual:](self, "isEqual:", v4))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration serviceType](self, "serviceType"));
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 serviceType]);
    if (v6 == (void *)v7)
    {
    }

    else
    {
      v8 = (void *)v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration serviceType](self, "serviceType"));
      v10 = (void *)objc_claimAutoreleasedReturnValue([v4 serviceType]);
      unsigned int v11 = [v9 isEqualToString:v10];

      if (!v11) {
        goto LABEL_9;
      }
    }

    unsigned int v12 = -[IDSRegistration registrationType](self, "registrationType");
    if (v12 == [v4 registrationType])
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration _keychain_comparisonValue](self, "_keychain_comparisonValue"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_keychain_comparisonValue"));
      unsigned __int8 v5 = [v13 isEqualToString:v14];

      goto LABEL_10;
    }

- (id)_keychain_comparisonValue
{
  switch(-[IDSRegistration registrationType](self, "registrationType"))
  {
    case 0:
      uint64_t v5 = objc_claimAutoreleasedReturnValue(-[IDSRegistration userUniqueIdentifier](self, "userUniqueIdentifier"));
      v6 = (void *)v5;
      uint64_t v7 = @"phone-number-registration";
      if (v5) {
        uint64_t v7 = (__CFString *)v5;
      }
      id v4 = v7;

      break;
    case 1:
      uint64_t v3 = objc_claimAutoreleasedReturnValue(-[IDSRegistration email](self, "email"));
      goto LABEL_8;
    case 2:
    case 3:
      uint64_t v3 = objc_claimAutoreleasedReturnValue(-[IDSRegistration userUniqueIdentifier](self, "userUniqueIdentifier"));
LABEL_8:
      id v4 = (__CFString *)v3;
      break;
    default:
      id v4 = 0LL;
      break;
  }

  return v4;
}

- (IDSRegistration)initWithPasswordManager:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___IDSRegistration;
  v6 = -[IDSRegistration init](&v10, "init");
  if (v6)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
    guid = v6->_guid;
    v6->_guid = (NSString *)v7;

    objc_storeStrong((id *)&v6->_passwordManager, a3);
  }

  return v6;
}

- (IDSRegistration)init
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[FTPasswordManager sharedInstance](&OBJC_CLASS___FTPasswordManager, "sharedInstance"));
  id v4 = -[IDSRegistration initWithPasswordManager:](self, "initWithPasswordManager:", v3);

  return v4;
}

- (IDSRegistration)initWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = -[IDSRegistration init](self, "init");

  if (!v5) {
    goto LABEL_40;
  }
  if (!v4 || ![v4 count]) {
    goto LABEL_39;
  }
  id v6 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"push-token"]);
  if (_IDSRunningInDaemon(v6, v7) && v6)
  {
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_1006AA788();
    }
  }

  else if (!v6)
  {
    goto LABEL_37;
  }

  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSData, v8);
  if ((objc_opt_isKindOfClass(v6, v10) & 1) == 0) {
    goto LABEL_37;
  }
  objc_storeStrong((id *)&v5->_pushToken, v6);

  id v6 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"registration-date"]);
  if (_IDSRunningInDaemon(v6, v11) && v6)
  {
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_1006AA6F8();
    }
  }

  else if (!v6)
  {
    goto LABEL_18;
  }

  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSDate, v12);
  if ((objc_opt_isKindOfClass(v6, v14) & 1) == 0) {
    goto LABEL_37;
  }
LABEL_18:
  objc_storeStrong((id *)&v5->_registrationDate, v6);

  id v6 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"next-registration-date"]);
  if (_IDSRunningInDaemon(v6, v15) && v6)
  {
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_1006AA668();
    }
  }

  else if (!v6)
  {
    goto LABEL_25;
  }

  uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSDate, v16);
  if ((objc_opt_isKindOfClass(v6, v18) & 1) == 0) {
    goto LABEL_37;
  }
LABEL_25:
  objc_storeStrong((id *)&v5->_nextRegistrationDate, v6);

  id v6 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"needs-renewal"]);
  if (_IDSRunningInDaemon(v6, v19) && v6)
  {
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      sub_1006AA5D8();
    }

LABEL_31:
    uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSNumber, v20);
    if ((objc_opt_isKindOfClass(v6, v22) & 1) != 0) {
      goto LABEL_32;
    }
LABEL_37:
    int v27 = 1;
    goto LABEL_38;
  }

  if (v6) {
    goto LABEL_31;
  }
LABEL_32:
  id v6 = v6;

  -[IDSRegistration setNeedsRenewal:](v5, "setNeedsRenewal:", [v6 BOOLValue]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"invitation-version"]);
  if (_IDSRunningInDaemon(v23, v24) && v23)
  {
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      sub_1006AA548();
    }
  }

  else if (!v23)
  {
    goto LABEL_193;
  }

  uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSNumber, v25);
  if ((objc_opt_isKindOfClass(v23, v30) & 1) == 0) {
    goto LABEL_193;
  }
  objc_storeStrong((id *)&v5->_applicationVersion, v23);

  v23 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"ids-version"]);
  if (_IDSRunningInDaemon(v23, v31) && v23)
  {
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
      sub_1006AA4B8();
    }
  }

  else if (!v23)
  {
    goto LABEL_51;
  }

  uint64_t v34 = objc_opt_class(&OBJC_CLASS___NSNumber, v32);
  if ((objc_opt_isKindOfClass(v23, v34) & 1) == 0) {
    goto LABEL_193;
  }
LABEL_51:
  objc_storeStrong((id *)&v5->_IDSVersion, v23);

  v23 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"identity-version"]);
  if (_IDSRunningInDaemon(v23, v35) && v23)
  {
    v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
      sub_1006AA428();
    }
  }

  else if (!v23)
  {
    goto LABEL_58;
  }

  uint64_t v38 = objc_opt_class(&OBJC_CLASS___NSNumber, v36);
  if ((objc_opt_isKindOfClass(v23, v38) & 1) == 0) {
    goto LABEL_193;
  }
LABEL_58:
  objc_storeStrong((id *)&v5->_identityVersion, v23);

  v23 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"cdma"]);
  if (_IDSRunningInDaemon(v23, v39) && v23)
  {
    v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
      sub_1006AA398();
    }
  }

  else if (!v23)
  {
    goto LABEL_65;
  }

  uint64_t v42 = objc_opt_class(&OBJC_CLASS___NSNumber, v40);
  if ((objc_opt_isKindOfClass(v23, v42) & 1) == 0) {
    goto LABEL_193;
  }
LABEL_65:
  objc_storeStrong((id *)&v5->_isC2K, v23);

  v23 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"identity-rsa-pair-signature"]);
  _IDSRunningInDaemon(v23, v43);
  if (v23)
  {
    uint64_t v45 = objc_opt_class(&OBJC_CLASS___NSString, v44);
    if ((objc_opt_isKindOfClass(v23, v45) & 1) == 0) {
      goto LABEL_193;
    }
  }

  objc_storeStrong((id *)&v5->_keyPairSignature, v23);

  v23 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"environment"]);
  if (_IDSRunningInDaemon(v23, v46) && v23)
  {
    v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
      sub_1006AA308();
    }
  }

  else if (!v23)
  {
    goto LABEL_193;
  }

  uint64_t v49 = objc_opt_class(&OBJC_CLASS___NSString, v47);
  if ((objc_opt_isKindOfClass(v23, v49) & 1) == 0) {
    goto LABEL_193;
  }
  objc_storeStrong((id *)&v5->_environment, v23);

  v23 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"main-id"]);
  if (_IDSRunningInDaemon(v23, v50) && v23)
  {
    v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
      sub_1006AA278();
    }
  }

  else if (!v23)
  {
    goto LABEL_193;
  }

  uint64_t v53 = objc_opt_class(&OBJC_CLASS___NSString, v51);
  if ((objc_opt_isKindOfClass(v23, v53) & 1) == 0) {
    goto LABEL_193;
  }
  objc_storeStrong((id *)&v5->_mainID, v23);

  v23 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"temporary-phone-email"]);
  if (_IDSRunningInDaemon(v23, v54) && v23)
  {
    v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG)) {
      sub_1006AA1E8();
    }
  }

  else if (!v23)
  {
    goto LABEL_88;
  }

  uint64_t v57 = objc_opt_class(&OBJC_CLASS___NSString, v55);
  if ((objc_opt_isKindOfClass(v23, v57) & 1) == 0) {
    goto LABEL_193;
  }
LABEL_88:
  objc_storeStrong((id *)&v5->_temporaryPhoneEmail, v23);

  v23 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"profile-id"]);
  if (_IDSRunningInDaemon(v23, v58) && v23)
  {
    v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG)) {
      sub_1006AA158();
    }
  }

  else if (!v23)
  {
    goto LABEL_95;
  }

  uint64_t v61 = objc_opt_class(&OBJC_CLASS___NSString, v59);
  if ((objc_opt_isKindOfClass(v23, v61) & 1) == 0) {
    goto LABEL_193;
  }
LABEL_95:
  objc_storeStrong((id *)&v5->_profileID, v23);

  v23 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"device-name"]);
  if (_IDSRunningInDaemon(v23, v62) && v23)
  {
    v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG)) {
      sub_1006AA0C8();
    }
  }

  else if (!v23)
  {
    goto LABEL_102;
  }

  uint64_t v65 = objc_opt_class(&OBJC_CLASS___NSString, v63);
  if ((objc_opt_isKindOfClass(v23, v65) & 1) == 0) {
    goto LABEL_193;
  }
LABEL_102:
  objc_storeStrong((id *)&v5->_deviceName, v23);

  v23 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"region-id"]);
  if (_IDSRunningInDaemon(v23, v66) && v23)
  {
    v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG)) {
      sub_1006AA038();
    }
  }

  else if (!v23)
  {
    goto LABEL_109;
  }

  uint64_t v69 = objc_opt_class(&OBJC_CLASS___NSString, v67);
  if ((objc_opt_isKindOfClass(v23, v69) & 1) == 0) {
    goto LABEL_193;
  }
LABEL_109:
  objc_storeStrong((id *)&v5->_regionID, v23);

  v23 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"region-base-phone-number"]);
  if (_IDSRunningInDaemon(v23, v70) && v23)
  {
    v72 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG)) {
      sub_1006A9FA8();
    }
  }

  else if (!v23)
  {
    goto LABEL_116;
  }

  uint64_t v73 = objc_opt_class(&OBJC_CLASS___NSString, v71);
  if ((objc_opt_isKindOfClass(v23, v73) & 1) == 0) {
    goto LABEL_193;
  }
LABEL_116:
  objc_storeStrong((id *)&v5->_regionBasePhoneNumber, v23);

  v23 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"region-server-context"]);
  if (_IDSRunningInDaemon(v23, v74) && v23)
  {
    v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG)) {
      sub_1006A9F18();
    }
  }

  else if (!v23)
  {
    goto LABEL_123;
  }

  uint64_t v77 = objc_opt_class(&OBJC_CLASS___NSDictionary, v75);
  if ((objc_opt_isKindOfClass(v23, v77) & 1) == 0) {
    goto LABEL_193;
  }
LABEL_123:
  objc_storeStrong((id *)&v5->_regionServerContext, v23);

  v23 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"dependant-registrations"]);
  _IDSRunningInDaemon(v23, v78);
  if (v23)
  {
    uint64_t v80 = objc_opt_class(&OBJC_CLASS___NSArray, v79);
    if ((objc_opt_isKindOfClass(v23, v80) & 1) == 0) {
      goto LABEL_193;
    }
  }

  objc_storeStrong((id *)&v5->_dependentRegistrations, v23);

  v23 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"self-handle"]);
  if (_IDSRunningInDaemon(v23, v81) && v23)
  {
    v83 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG)) {
      sub_1006A9E88();
    }
  }

  else if (!v23)
  {
    goto LABEL_132;
  }

  uint64_t v84 = objc_opt_class(&OBJC_CLASS___NSString, v82);
  if ((objc_opt_isKindOfClass(v23, v84) & 1) == 0) {
    goto LABEL_193;
  }
LABEL_132:
  objc_storeStrong((id *)&v5->_dsHandle, v23);

  v23 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"dependant-registrations-ttl"]);
  if (_IDSRunningInDaemon(v23, v85) && v23)
  {
    v87 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG)) {
      sub_1006A9DF8();
    }
  }

  else if (!v23)
  {
    goto LABEL_139;
  }

  uint64_t v88 = objc_opt_class(&OBJC_CLASS___NSDate, v86);
  if ((objc_opt_isKindOfClass(v23, v88) & 1) == 0) {
    goto LABEL_193;
  }
LABEL_139:
  objc_storeStrong((id *)&v5->_dependentRegistrationsTTL, v23);

  v23 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"dependant-registrations-response-code"]);
  if (_IDSRunningInDaemon(v23, v89) && v23)
  {
    v91 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG)) {
      sub_1006A9D68();
    }
  }

  else if (!v23)
  {
    goto LABEL_146;
  }

  uint64_t v92 = objc_opt_class(&OBJC_CLASS___NSNumber, v90);
  if ((objc_opt_isKindOfClass(v23, v92) & 1) == 0) {
    goto LABEL_193;
  }
LABEL_146:
  objc_storeStrong((id *)&v5->_dependentRegistrationResponseCode, v23);

  v23 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"dependant-registrations-auth-retries"]);
  if (_IDSRunningInDaemon(v23, v93) && v23)
  {
    v95 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v95, OS_LOG_TYPE_DEBUG)) {
      sub_1006A9CD8();
    }
  }

  else if (!v23)
  {
    goto LABEL_153;
  }

  uint64_t v96 = objc_opt_class(&OBJC_CLASS___NSNumber, v94);
  if ((objc_opt_isKindOfClass(v23, v96) & 1) == 0) {
    goto LABEL_193;
  }
LABEL_153:
  objc_storeStrong((id *)&v5->_dependentRegistrationAuthRetries, v23);

  v23 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"uris"]);
  if (_IDSRunningInDaemon(v23, v97) && v23)
  {
    v99 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG)) {
      sub_1006A9C48();
    }
  }

  else if (!v23)
  {
    goto LABEL_160;
  }

  uint64_t v100 = objc_opt_class(&OBJC_CLASS___NSArray, v98);
  if ((objc_opt_isKindOfClass(v23, v100) & 1) == 0) {
    goto LABEL_193;
  }
LABEL_160:
  objc_storeStrong((id *)&v5->_uris, v23);

  v23 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"kt-uris"]);
  if (_IDSRunningInDaemon(v23, v101) && v23)
  {
    v103 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v103, OS_LOG_TYPE_DEBUG)) {
      sub_1006A9BB8();
    }
  }

  else if (!v23)
  {
    goto LABEL_167;
  }

  uint64_t v104 = objc_opt_class(&OBJC_CLASS___NSArray, v102);
  if ((objc_opt_isKindOfClass(v23, v104) & 1) == 0) {
    goto LABEL_193;
  }
LABEL_167:
  objc_storeStrong((id *)&v5->_keyTransparencyEnrolledURIs, v23);

  v23 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"ids-user-id"]);
  if (_IDSRunningInDaemon(v23, v105) && v23)
  {
    v107 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v107, OS_LOG_TYPE_DEBUG)) {
      sub_1006A9B28();
    }
  }

  else if (!v23)
  {
    goto LABEL_174;
  }

  uint64_t v108 = objc_opt_class(&OBJC_CLASS___NSString, v106);
  if ((objc_opt_isKindOfClass(v23, v108) & 1) == 0) {
    goto LABEL_193;
  }
LABEL_174:
  objc_storeStrong((id *)&v5->_idsUserID, v23);

  v23 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"ids-registration-cert"]);
  if (_IDSRunningInDaemon(v23, v109) && v23)
  {
    v111 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v111, OS_LOG_TYPE_DEBUG)) {
      sub_1006A9A78();
    }

LABEL_180:
    uint64_t v112 = objc_opt_class(&OBJC_CLASS___NSData, v110);
    if ((objc_opt_isKindOfClass(v23, v112) & 1) == 0) {
      goto LABEL_193;
    }
    goto LABEL_181;
  }

  if (v23) {
    goto LABEL_180;
  }
LABEL_181:
  p_registrationCert = (void **)&v5->_registrationCert;
  objc_storeStrong((id *)&v5->_registrationCert, v23);

  v23 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"ids-authentication-cert"]);
  if (_IDSRunningInDaemon(v23, v113) && v23)
  {
    v115 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v115, OS_LOG_TYPE_DEBUG)) {
      sub_1006A99C8();
    }
  }

  else if (!v23)
  {
LABEL_188:
    id v117 = v23;

    v118 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"auth-token"]);
    if (_IDSRunningInDaemon(v118, v119) && v118)
    {
      v121 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v121, OS_LOG_TYPE_DEBUG)) {
        sub_1006A9938();
      }
    }

    else if (!v118)
    {
      goto LABEL_197;
    }

    uint64_t v122 = objc_opt_class(&OBJC_CLASS___NSString, v120);
    if ((objc_opt_isKindOfClass(v118, v122) & 1) == 0)
    {
      int v27 = 1;
LABEL_226:

      v23 = v6;
      id v6 = v117;
      goto LABEL_194;
    }

- (BOOL)removeFromKeychain
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationKeychainManager sharedInstance]( &OBJC_CLASS___IDSRegistrationKeychainManager,  "sharedInstance"));
  LOBYTE(self) = [v3 removeRegistration:self];

  return (char)self;
}

- (BOOL)saveToKeychain
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationKeychainManager sharedInstance]( &OBJC_CLASS___IDSRegistrationKeychainManager,  "sharedInstance"));
  LOBYTE(self) = [v3 addRegistration:self];

  return (char)self;
}

- (NSArray)candidateEmails
{
  return (NSArray *)self->_candidateEmails;
}

- (void)addCandidateEmail:(id)a3
{
  id v4 = a3;
  if (IMStringIsPhoneNumber(v4))
  {
    uint64_t v5 = IMCanonicalizeFormattedString(v4, 3LL);
    uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);

    id v4 = (id)v6;
  }

  id v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_im_normalizedURIString"));

  candidateEmails = self->_candidateEmails;
  if (!candidateEmails)
  {
    uint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v9 = self->_candidateEmails;
    self->_candidateEmails = v8;

    candidateEmails = self->_candidateEmails;
  }
}

- (void)removeCandidateEmail:(id)a3
{
  id v4 = a3;
  if (IMStringIsPhoneNumber(v4))
  {
    uint64_t v5 = IMCanonicalizeFormattedString(v4, 3LL);
    uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);

    id v4 = (id)v6;
  }

  uint64_t v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_im_normalizedURIString"));

  uint64_t v7 = (void *)v10;
  if (v10)
  {
    -[NSMutableArray removeObject:](self->_candidateEmails, "removeObject:", v10);
    id v8 = -[NSMutableArray count](self->_candidateEmails, "count");
    uint64_t v7 = (void *)v10;
    if (!v8)
    {
      candidateEmails = self->_candidateEmails;
      self->_candidateEmails = 0LL;

      uint64_t v7 = (void *)v10;
    }
  }
}

- (NSArray)confirmedEmails
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration uris](self, "uris"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 _IDsFromURIs]);

  return (NSArray *)v3;
}

- (id)_userID
{
  if (-[IDSRegistration registrationType](self, "registrationType")
    && -[IDSRegistration registrationType](self, "registrationType") != 2
    || (uint64_t v3 = &self->_mainID, -[NSString _FZBestGuessFZIDType](self->_mainID, "_FZBestGuessFZIDType")))
  {
    if (-[IDSRegistration registrationType](self, "registrationType") == 1
      && (uint64_t v3 = &self->_mainID, -[NSString _FZBestGuessFZIDType](self->_mainID, "_FZBestGuessFZIDType") == (id)1))
    {
      uint64_t v4 = 1LL;
    }

    else
    {
      if (-[IDSRegistration registrationType](self, "registrationType") != 3) {
        return 0LL;
      }
      mainID = self->_mainID;
      p_mainID = &self->_mainID;
      if (-[NSString _FZBestGuessFZIDType](mainID, "_FZBestGuessFZIDType") != (id)6) {
        return 0LL;
      }
      uint64_t v4 = 6LL;
      uint64_t v3 = p_mainID;
    }
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  return (id)objc_claimAutoreleasedReturnValue(-[NSString _IDFromFZIDType:](*v3, "_IDFromFZIDType:", v4));
}

- (NSString)userID
{
  return (NSString *)-[IDSRegistration _userID](self, "_userID");
}

- (NSString)email
{
  unsigned int v3 = -[IDSRegistration registrationType](self, "registrationType");
  uint64_t v4 = 15LL;
  if (v3 == 2) {
    uint64_t v4 = 32LL;
  }
  return (NSString *)(&self->super.isa)[v4];
}

- (void)setEmail:(id)a3
{
  id v4 = a3;
  if (-[IDSRegistration registrationType](self, "registrationType") == 2) {
    -[IDSRegistration setTemporaryPhoneEmail:](self, "setTemporaryPhoneEmail:", v4);
  }
  else {
    -[IDSRegistration setMainID:](self, "setMainID:", v4);
  }
}

- (NSString)phoneNumber
{
  return self->_mainID;
}

- (void)setRegistrationStatus:(int64_t)a3
{
  if (self->_registrationStatus != a3) {
    self->_registrationStatus = a3;
  }
}

- (void)setUserUniqueIdentifier:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_userUniqueIdentifier, a3);
  if (!self->_mainID)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration _user](self, "_user"));
    uint64_t v6 = (NSString *)objc_claimAutoreleasedReturnValue([v5 unprefixedIdentifier]);
    mainID = self->_mainID;
    self->_mainID = v6;
  }
}

- (NSDictionary)dictionaryRepresentation
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_registrationType));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration serviceType](self, "serviceType"));
  uint64_t v5 = _StringForIDSRegistrationServiceType(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_didRegisterWithKTAccountKey));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_optedIntoKT));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_didRegisterWithDeviceSignature));
  if (!self->_registrationCert)
  {
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog keychain](&OBJC_CLASS___IMRGLog, "keychain"));
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_34;
    }
    int v59 = 138412290;
    v60 = @"ids-registration-cert";
LABEL_33:
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "keychainDictionary: nil %@",  (uint8_t *)&v59,  0xCu);
    goto LABEL_34;
  }

  if (!self->_pushToken)
  {
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog keychain](&OBJC_CLASS___IMRGLog, "keychain"));
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_34;
    }
    int v59 = 138412290;
    v60 = @"push-token";
    goto LABEL_33;
  }

  if (!self->_mainID)
  {
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog keychain](&OBJC_CLASS___IMRGLog, "keychain"));
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_34;
    }
    int v59 = 138412290;
    v60 = @"main-id";
    goto LABEL_33;
  }

  if (!self->_registrationDate)
  {
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog keychain](&OBJC_CLASS___IMRGLog, "keychain"));
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_34;
    }
    int v59 = 138412290;
    v60 = @"registration-date";
    goto LABEL_33;
  }

  if (!self->_applicationVersion)
  {
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog keychain](&OBJC_CLASS___IMRGLog, "keychain"));
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_34;
    }
    int v59 = 138412290;
    v60 = @"invitation-version";
    goto LABEL_33;
  }

  if (!self->_IDSVersion)
  {
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog keychain](&OBJC_CLASS___IMRGLog, "keychain"));
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_34;
    }
    int v59 = 138412290;
    v60 = @"ids-version";
    goto LABEL_33;
  }

  if (!self->_identityVersion)
  {
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog keychain](&OBJC_CLASS___IMRGLog, "keychain"));
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_34;
    }
    int v59 = 138412290;
    v60 = @"identity-version";
    goto LABEL_33;
  }

  if (!self->_environment)
  {
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog keychain](&OBJC_CLASS___IMRGLog, "keychain"));
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_34;
    }
    int v59 = 138412290;
    v60 = @"environment";
    goto LABEL_33;
  }

  if (!v3)
  {
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog keychain](&OBJC_CLASS___IMRGLog, "keychain"));
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_34;
    }
    int v59 = 138412290;
    v60 = @"type";
    goto LABEL_33;
  }

  if (!v6)
  {
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog keychain](&OBJC_CLASS___IMRGLog, "keychain"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v59 = 138412290;
      v60 = @"service";
      goto LABEL_33;
    }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v72.receiver = self;
  v72.super_class = (Class)&OBJC_CLASS___IDSRegistration;
  if (-[IDSRegistration isEqual:](&v72, "isEqual:", v4))
  {
    unsigned __int8 v6 = 1;
    goto LABEL_41;
  }

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___IDSRegistration, v5);
  if ((objc_opt_isKindOfClass(v4, v7) & 1) == 0) {
    goto LABEL_40;
  }
  unsigned int v8 = -[IDSRegistration registrationType](self, "registrationType");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration serviceType](self, "serviceType"));
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v4 serviceType]);
  if (v9 == (void *)v10)
  {
  }

  else
  {
    uint64_t v11 = (void *)v10;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration serviceType](self, "serviceType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v4 serviceType]);
    unsigned int v14 = [v12 isEqualToString:v13];

    if (!v14) {
      goto LABEL_40;
    }
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration pushToken](self, "pushToken"));
  uint64_t v16 = objc_claimAutoreleasedReturnValue([v4 pushToken]);
  if (v15 == (void *)v16)
  {
  }

  else
  {
    v17 = (void *)v16;
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration pushToken](self, "pushToken"));
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v4 pushToken]);
    unsigned int v20 = [v18 isEqualToData:v19];

    if (!v20) {
      goto LABEL_40;
    }
  }

  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration environment](self, "environment"));
  uint64_t v22 = objc_claimAutoreleasedReturnValue([v4 environment]);
  if (v21 == (void *)v22)
  {
  }

  else
  {
    v23 = (void *)v22;
    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration environment](self, "environment"));
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v4 environment]);
    unsigned int v26 = [v24 isEqualToString:v25];

    if (!v26) {
      goto LABEL_40;
    }
  }

  int v27 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration deviceName](self, "deviceName"));
  uint64_t v28 = objc_claimAutoreleasedReturnValue([v4 deviceName]);
  if (v27 == (void *)v28)
  {
  }

  else
  {
    v29 = (void *)v28;
    id v30 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration deviceName](self, "deviceName"));
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceName]);
    unsigned int v32 = [v30 isEqualToString:v31];

    if (!v32) {
      goto LABEL_40;
    }
  }

  id v33 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration mainID](self, "mainID"));
  uint64_t v34 = objc_claimAutoreleasedReturnValue([v4 mainID]);
  if (v33 == (void *)v34)
  {
  }

  else
  {
    uint64_t v35 = (void *)v34;
    id v36 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration mainID](self, "mainID"));
    v37 = (void *)objc_claimAutoreleasedReturnValue([v4 mainID]);
    unsigned int v38 = [v36 isEqualToString:v37];

    if (!v38) {
      goto LABEL_40;
    }
  }

  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration uris](self, "uris"));
  uint64_t v40 = objc_claimAutoreleasedReturnValue([v4 uris]);
  if (v39 == (void *)v40)
  {
  }

  else
  {
    v41 = (void *)v40;
    uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration uris](self, "uris"));
    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v4 uris]);
    unsigned int v44 = [v42 isEqualToArray:v43];

    if (!v44) {
      goto LABEL_40;
    }
  }

  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration candidateEmails](self, "candidateEmails"));
  uint64_t v46 = objc_claimAutoreleasedReturnValue([v4 candidateEmails]);
  if (v45 == (void *)v46)
  {
  }

  else
  {
    uint64_t v47 = (void *)v46;
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration candidateEmails](self, "candidateEmails"));
    uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue([v4 candidateEmails]);
    unsigned int v50 = [v48 isEqualToArray:v49];

    if (!v50) {
      goto LABEL_40;
    }
  }

  uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration confirmedEmails](self, "confirmedEmails"));
  uint64_t v52 = objc_claimAutoreleasedReturnValue([v4 confirmedEmails]);
  if (v51 == (void *)v52)
  {
  }

  else
  {
    id v53 = (void *)v52;
    id v54 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration confirmedEmails](self, "confirmedEmails"));
    id v55 = (void *)objc_claimAutoreleasedReturnValue([v4 confirmedEmails]);
    unsigned int v56 = [v54 isEqualToArray:v55];

    if (!v56) {
      goto LABEL_40;
    }
  }

  uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration isCDMA](self, "isCDMA"));
  unsigned int v58 = [v57 intValue];
  int v59 = (void *)objc_claimAutoreleasedReturnValue([v4 isCDMA]);
  unsigned int v60 = [v59 intValue];

  if (v58 != v60)
  {
LABEL_40:
    unsigned __int8 v6 = 0;
    goto LABEL_41;
  }

  uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration registrationCert](self, "registrationCert"));
  uint64_t v62 = objc_claimAutoreleasedReturnValue([v4 registrationCert]);
  if (v61 == (void *)v62)
  {
  }

  else
  {
    uint64_t v63 = (void *)v62;
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration registrationCert](self, "registrationCert"));
    uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue([v4 registrationCert]);
    unsigned int v66 = [v64 isEqualToData:v65];

    if (!v66) {
      goto LABEL_40;
    }
  }

  v68 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration userUniqueIdentifier](self, "userUniqueIdentifier"));
  uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue([v4 userUniqueIdentifier]);
  if (v68 == v69)
  {
    unsigned __int8 v6 = 1;
  }

  else
  {
    uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration userUniqueIdentifier](self, "userUniqueIdentifier"));
    uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue([v4 userUniqueIdentifier]);
    unsigned __int8 v6 = [v70 isEqualToString:v71];
  }

LABEL_41:
  return v6;
}

- (NSString)authenticationToken
{
  if (-[IDSRegistration registrationType](self, "registrationType"))
  {
    if (-[IDSRegistration registrationType](self, "registrationType") == 3)
    {
      return (NSString *)0LL;
    }

    else
    {
      uint64_t v17 = 0LL;
      uint64_t v18 = &v17;
      uint64_t v19 = 0x3032000000LL;
      unsigned int v20 = sub_1003A3B38;
      id v21 = sub_1003A3B48;
      id v22 = 0LL;
      passwordManager = self->_passwordManager;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration profileID](self, "profileID"));
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration email](self, "email"));
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 lowercaseString]);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration serviceType](self, "serviceType"));
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_1003A3B50;
      v16[3] = &unk_100902BD0;
      v16[4] = self;
      v16[5] = &v17;
      -[FTPasswordManager fetchAuthTokenForProfileID:username:service:outRequestID:completionBlock:]( passwordManager,  "fetchAuthTokenForProfileID:username:service:outRequestID:completionBlock:",  v9,  v11,  v12,  0LL,  v16);

      if ([(id)v18[5] length]) {
        v13 = (void *)v18[5];
      }
      else {
        v13 = 0LL;
      }
      id v14 = v13;
      _Block_object_dispose(&v17, 8);

      return (NSString *)v14;
    }
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration _userStore](self, "_userStore"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration _user](self, "_user"));
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v4 credentialForUser:v5]);

    if (v6 && ![v6 realm]) {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 smsSignature]);
    }
    else {
      uint64_t v7 = 0LL;
    }
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_1006AAC18((uint64_t)v7, v15);
    }

    return (NSString *)v7;
  }

- (void)setAuthenticationToken:(id)a3
{
  id v4 = a3;
  if (-[IDSRegistration registrationType](self, "registrationType"))
  {
    unsigned int v5 = -[IDSRegistration registrationType](self, "registrationType");
    if (v4 || v5 != 2)
    {
      if (-[IDSRegistration registrationType](self, "registrationType") != 3)
      {
        unsigned __int8 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[IDSRegistration serviceType](self, "serviceType"));
        passwordManager = self->_passwordManager;
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration profileID](self, "profileID"));
        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration email](self, "email"));
        uint64_t v15 = IMStripLoginID(v14);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 lowercaseString]);
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472LL;
        v18[2] = sub_1003A4094;
        v18[3] = &unk_100902BF8;
        id v19 = v4;
        -[FTPasswordManager setAuthTokenForProfileID:username:service:authToken:selfHandle:accountStatus:outRequestID:completionBlock:]( passwordManager,  "setAuthTokenForProfileID:username:service:authToken:selfHandle:accountStatus:outRequestID:completionBlock:",  v13,  v17,  v6,  v19,  0LL,  &off_100947F98,  0LL,  v18);

        goto LABEL_14;
      }

      unsigned __int8 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v7 = "** Not clearing auth token since this is a device registration";
        goto LABEL_12;
      }
    }

    else
    {
      unsigned __int8 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v7 = "** Not clearing auth token since this is a temporary registration";
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
      }
    }
  }

  else
  {
    unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration mainID](self, "mainID"));
      *(_DWORD *)buf = 138412546;
      id v21 = v9;
      __int16 v22 = 2112;
      id v23 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "** Updating SMS authentication token to mainID: %@  token: %@",  buf,  0x16u);
    }

    unsigned __int8 v6 = -[IDSPhoneUserCredential initWithSMSSignature:]( objc_alloc(&OBJC_CLASS___IDSPhoneUserCredential),  "initWithSMSSignature:",  v4);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration _userStore](self, "_userStore"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration _user](self, "_user"));
    [v10 setCredential:v6 forUser:v11];
  }

- (void)voidAuthenticationTokenAllowingGracePeriod
{
  if (-[IDSRegistration registrationType](self, "registrationType") == 1)
  {
    unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[FTPasswordManager sharedInstance](&OBJC_CLASS___FTPasswordManager, "sharedInstance"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration profileID](self, "profileID"));
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration email](self, "email"));
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 lowercaseString]);
    [v3 removeAuthTokenAllowingGracePeriodForProfileID:v4 username:v6];

    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration email](self, "email"));
      v9 = (void *)objc_claimAutoreleasedReturnValue([v8 lowercaseString]);
      int v10 = 138412290;
      uint64_t v11 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Voided auth token for account (%@)",  (uint8_t *)&v10,  0xCu);
    }
  }

- (void)voidPassword
{
  if (-[IDSRegistration registrationType](self, "registrationType") == 1)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[IDSRegistration serviceType](self, "serviceType"));
    unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[FTPasswordManager sharedInstance](&OBJC_CLASS___FTPasswordManager, "sharedInstance"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration profileID](self, "profileID"));
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration email](self, "email"));
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 lowercaseString]);
    [v3 setPasswordForProfileID:v4 username:v6 service:v7 password:0 outRequestID:0 completionBlock:&stru_100902C18];
  }

- (id)_user
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration _userStore](self, "_userStore"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userWithUniqueIdentifier:self->_userUniqueIdentifier]);

  return v4;
}

- (id)_userStore
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 registrationConductor]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userStore]);

  return v4;
}

- (id)description
{
  uint64_t v3 = _StringForIDSDRegistrationStatus(-[IDSRegistration registrationStatus](self, "registrationStatus"));
  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v4 = _StringForIDSRegistrationType(-[IDSRegistration registrationType](self, "registrationType"));
  unsigned int v32 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration deviceName](self, "deviceName"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration serviceType](self, "serviceType"));
  uint64_t v5 = _StringForIDSRegistrationServiceType(v29);
  int v27 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v33 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration environment](self, "environment"));
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration mainID](self, "mainID"));
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration email](self, "email"));
  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration userID](self, "userID"));
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration isCDMA](self, "isCDMA"));
  unsigned __int8 v6 = @"YES";
  if (!v28) {
    unsigned __int8 v6 = @"NO";
  }
  __int16 v22 = v6;
  id v30 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration pushToken](self, "pushToken"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration regionID](self, "regionID"));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration regionBasePhoneNumber](self, "regionBasePhoneNumber"));
  unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration uris](self, "uris"));
  uint64_t v9 = IMLoggingStringForArray(v26);
  int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration candidateEmails](self, "candidateEmails"));
  uint64_t v11 = IMLoggingStringForArray(v23);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration authenticationCert](self, "authenticationCert"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration registrationCert](self, "registrationCert"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration profileID](self, "profileID"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration idsUserID](self, "idsUserID"));
  userUniqueIdentifier = self->_userUniqueIdentifier;
  unsigned int v18 = -[IDSRegistration didRegisterWithKTAccountKey](self, "didRegisterWithKTAccountKey");
  id v19 = @"YES";
  if (!v18) {
    id v19 = @"NO";
  }
  unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Registration info (%p): [Status: %@] [Type: %@] [Device Name: %@] [Service Type: %@] [Env: %@] [Main ID: %@] [AppleID: %@] [UserID: %@] [C2K: %@] [Push Token: %@] [Region ID: %@] [Base Number: %@] [URIs: %@] [Candidates: %@] [Auth Cert: %p] [Reg Cert: %p] [Profile ID: %@] [Auth User ID: %@] [User Unique ID: %@] [Account Key: %@]",  self,  v35,  v32,  v34,  v27,  v33,  v25,  v31,  v24,  v22,  v30,  v7,  v8,  v10,  v12,  v13,  v14,  v15,  v16,  userUniqueIdentifier,  v19));

  return v20;
}

- (id)debugDescription
{
  uint64_t v3 = _StringForIDSDRegistrationStatus(-[IDSRegistration registrationStatus](self, "registrationStatus"));
  unsigned int v38 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v4 = _StringForIDSRegistrationType(-[IDSRegistration registrationType](self, "registrationType"));
  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration deviceName](self, "deviceName"));
  id v30 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration serviceType](self, "serviceType"));
  uint64_t v5 = _StringForIDSRegistrationServiceType(v30);
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v36 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration environment](self, "environment"));
  unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration mainID](self, "mainID"));
  id v33 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration email](self, "email"));
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration userID](self, "userID"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration isCDMA](self, "isCDMA"));
  unsigned __int8 v6 = @"YES";
  if (!v29) {
    unsigned __int8 v6 = @"NO";
  }
  id v23 = v6;
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration pushToken](self, "pushToken"));
  unsigned int v32 = (void *)objc_claimAutoreleasedReturnValue([v28 debugDescription]);
  __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration regionID](self, "regionID"));
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration regionBasePhoneNumber](self, "regionBasePhoneNumber"));
  int v27 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration uris](self, "uris"));
  uint64_t v7 = IMLoggingStringForArray(v27);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration candidateEmails](self, "candidateEmails"));
  uint64_t v9 = IMLoggingStringForArray(v24);
  int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration authenticationCert](self, "authenticationCert"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration registrationCert](self, "registrationCert"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration profileID](self, "profileID"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration idsUserID](self, "idsUserID"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration registrationDate](self, "registrationDate"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration nextRegistrationDate](self, "nextRegistrationDate"));
  userUniqueIdentifier = self->_userUniqueIdentifier;
  unsigned int v18 = -[IDSRegistration didRegisterWithKTAccountKey](self, "didRegisterWithKTAccountKey");
  id v19 = @"YES";
  if (!v18) {
    id v19 = @"NO";
  }
  unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Registration info (%p): [Status: %@] [Type: %@] [Device Name: %@] [Service Type: %@] [Env: %@] [Main ID: %@] [AppleID: %@] [UserID: %@] [C2K: %@] [Push Token: %@] [Region ID: %@] [Base Number: %@] [URIs: %@] [Candidates: %@] [Auth Cert: %p] [Reg Cert: %p] [Profile ID: %@] [Auth User ID: %@] [Registration Date: %@] [Heartbeat Date: %@] [User Unique ID: %@] [Account Key: %@]",  self,  v38,  v35,  v37,  v34,  v36,  v26,  v33,  v25,  v23,  v32,  v22,  v31,  v8,  v10,  v11,  v12,  v13,  v14,  v15,  v16,  userUniqueIdentifier,  v19));

  return v20;
}

- (NSArray)emailsToRegister
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  if (-[IDSRegistration shouldRegisterUsingDSHandle](self, "shouldRegisterUsingDSHandle"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration dsHandle](self, "dsHandle"));

    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        uint64_t v7 = (IDSRegistration *)objc_claimAutoreleasedReturnValue(-[IDSRegistration idsUserID](self, "idsUserID"));
        unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration serviceType](self, "serviceType"));
        *(_DWORD *)buf = 138412546;
        v91 = v7;
        __int16 v92 = 2112;
        id v93 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  " ... finding emails to register for DS registration based account: %@:%@",  buf,  0x16u);
      }

      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = (IDSRegistration *)objc_claimAutoreleasedReturnValue(-[IDSRegistration dsHandle](self, "dsHandle"));
        *(_DWORD *)buf = 138412290;
        v91 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  " => Added self handle: %@ to URI set",  buf,  0xCu);
      }

      uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[IDSRegistration dsHandle](self, "dsHandle"));
      -[NSMutableSet addObject:](v3, "addObject:", v5);
    }

    else if (v6)
    {
      *(_DWORD *)buf = 138412290;
      v91 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  " => **** Missing self handle, not adding ****: %@",  buf,  0xCu);
    }

- (BOOL)hasSentinel
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  unsigned int v4 = [v3 supportsSMS];

  if (!v4) {
    return 0;
  }
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration confirmedEmails](self, "confirmedEmails"));
  id v7 = [v6 count];

  if (v7)
  {
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration confirmedEmails](self, "confirmedEmails"));
    -[NSMutableArray addObjectsFromArray:](v5, "addObjectsFromArray:", v8);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration candidateEmails](self, "candidateEmails"));
  id v10 = [v9 count];

  if (v10)
  {
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration candidateEmails](self, "candidateEmails"));
    -[NSMutableArray addObjectsFromArray:](v5, "addObjectsFromArray:", v11);
  }

  if (!-[NSMutableArray count](v5, "count"))
  {

    uint64_t v5 = 0LL;
  }

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  uint64_t v12 = v5;
  id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v21;
    uint64_t v16 = kIDSServiceDefaultsSentinelAlias;
    while (2)
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        if (!objc_msgSend( *(id *)(*((void *)&v20 + 1) + 8 * (void)i),  "caseInsensitiveCompare:",  v16,  (void)v20))
        {
          BOOL v18 = 1;
          goto LABEL_19;
        }
      }

      id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
      if (v14) {
        continue;
      }
      break;
    }
  }

  BOOL v18 = 0;
LABEL_19:

  return v18;
}

- (BOOL)canRegister
{
  v2 = self;
  if (-[IDSRegistration registrationType](self, "registrationType") == 1)
  {
    if (!-[IDSRegistration shouldAutoRegisterAllHandles](v2, "shouldAutoRegisterAllHandles")
      && !-[IDSRegistration shouldRegisterUsingDSHandle](v2, "shouldRegisterUsingDSHandle"))
    {
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration regionID](v2, "regionID"));
      if (![v3 length])
      {
        LOBYTE(v2) = 0;
        goto LABEL_14;
      }

      unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration regionBasePhoneNumber](v2, "regionBasePhoneNumber"));
      id v5 = [v4 length];

      if (!v5)
      {
        LOBYTE(v2) = 0;
        return (char)v2;
      }

      if (!-[IDSRegistration hasSentinel](v2, "hasSentinel"))
      {
        uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration emailsToRegister](v2, "emailsToRegister"));
        LOBYTE(v2) = [v3 count] != 0;
LABEL_14:

        return (char)v2;
      }
    }
  }

  else if (!-[IDSRegistration registrationType](v2, "registrationType"))
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCTAdapter sharedInstance](&OBJC_CLASS___IDSCTAdapter, "sharedInstance"));
    if ([v3 isAnySIMInserted])
    {
      LOBYTE(v2) = 1;
    }

    else
    {
      BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[IMMobileNetworkManager sharedInstance](&OBJC_CLASS___IMMobileNetworkManager, "sharedInstance"));
      LODWORD(v2) = [v6 requiresSIMInserted] ^ 1;
    }

    goto LABEL_14;
  }

  LOBYTE(v2) = 1;
  return (char)v2;
}

- (BOOL)canSendRegistration
{
  if (-[IDSRegistration registrationType](self, "registrationType") == 1)
  {
    if (!-[IDSRegistration shouldAutoRegisterAllHandles](self, "shouldAutoRegisterAllHandles")
      || (uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration emailsToRegister](self, "emailsToRegister")),
          id v4 = [v3 count],
          v3,
          !v4))
    {
      if (!-[IDSRegistration shouldRegisterUsingDSHandle](self, "shouldRegisterUsingDSHandle"))
      {
        id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration regionID](self, "regionID"));
        if (![v5 length])
        {
          LOBYTE(v9) = 0;
          goto LABEL_18;
        }

        BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration regionBasePhoneNumber](self, "regionBasePhoneNumber"));
        id v7 = [v6 length];

        if (!v7)
        {
          LOBYTE(v9) = 0;
          return v9;
        }

        if (!-[IDSRegistration hasSentinel](self, "hasSentinel"))
        {
          unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration emailsToRegister](self, "emailsToRegister"));
LABEL_12:
          id v5 = v8;
          LOBYTE(v9) = [v8 count] != 0;
LABEL_18:

          return v9;
        }
      }
    }
  }

  else
  {
    if (!-[IDSRegistration registrationType](self, "registrationType"))
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCTAdapter sharedInstance](&OBJC_CLASS___IDSCTAdapter, "sharedInstance"));
      if ([v5 isAnySIMInserted])
      {
        LOBYTE(v9) = 1;
      }

      else
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue(+[IMMobileNetworkManager sharedInstance](&OBJC_CLASS___IMMobileNetworkManager, "sharedInstance"));
        unsigned int v9 = [v10 requiresSIMInserted] ^ 1;
      }

      goto LABEL_18;
    }

    if (-[IDSRegistration registrationType](self, "registrationType") == 3)
    {
      unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration uris](self, "uris"));
      goto LABEL_12;
    }
  }

  LOBYTE(v9) = 1;
  return v9;
}

- (BOOL)stopAtAuthentication
{
  return 0;
}

- (void)setAuthenticationCert:(id)a3
{
  id v8 = a3;
  BOOL v4 = !-[IDSRegistration registrationType](self, "registrationType")
    || -[IDSRegistration registrationType](self, "registrationType") == 2
    || -[IDSRegistration registrationType](self, "registrationType") == 3;
  if (-[IDSRegistration registrationType](self, "registrationType") == 1)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationKeychainManager sharedInstance]( &OBJC_CLASS___IDSRegistrationKeychainManager,  "sharedInstance"));
    BOOL v6 = (IDSAuthenticationCertificate *)objc_claimAutoreleasedReturnValue(-[IDSRegistration idsUserID](self, "idsUserID"));
    [v5 setAuthenticationCert:v8 forID:v6];
LABEL_12:

LABEL_13:
    goto LABEL_14;
  }

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration _userStore](self, "_userStore"));
    if (v8) {
      BOOL v6 = -[IDSAuthenticationCertificate initWithDataRepresentation:]( objc_alloc(&OBJC_CLASS___IDSAuthenticationCertificate),  "initWithDataRepresentation:",  v8);
    }
    else {
      BOOL v6 = 0LL;
    }
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration _user](self, "_user"));
    [v5 silentlySetAuthenticationCertificate:v6 forUser:v7];

    if (!v8) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }

- (NSData)authenticationCert
{
  unsigned int v3 = -[IDSRegistration registrationType](self, "registrationType");
  unsigned int v4 = -[IDSRegistration registrationType](self, "registrationType");
  unsigned int v5 = v4;
  if (v3 == 2)
  {
    if (!v4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  if (-[IDSRegistration registrationType](self, "registrationType"))
  {
    if (v5 != 3)
    {
      BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationKeychainManager sharedInstance]( &OBJC_CLASS___IDSRegistrationKeychainManager,  "sharedInstance"));
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistration idsUserID](self, "idsUserID"));
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v6 authenticationCertForID:v7]);
      goto LABEL_14;
    }

- (NSArray)vettedEmails
{
  return self->_vettedEmails;
}

- (void)setVettedEmails:(id)a3
{
}

- (NSString)dsHandle
{
  return self->_dsHandle;
}

- (void)setDSHandle:(id)a3
{
}

- (NSString)profileID
{
  return self->_profileID;
}

- (void)setProfileID:(id)a3
{
}

- (NSNumber)IDSVersion
{
  return self->_IDSVersion;
}

- (void)setIDSVersion:(id)a3
{
}

- (NSNumber)applicationVersion
{
  return self->_applicationVersion;
}

- (void)setApplicationVersion:(id)a3
{
}

- (NSString)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
}

- (NSDate)registrationDate
{
  return self->_registrationDate;
}

- (void)setRegistrationDate:(id)a3
{
}

- (NSDate)nextRegistrationDate
{
  return self->_nextRegistrationDate;
}

- (void)setNextRegistrationDate:(id)a3
{
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (NSNumber)isCDMA
{
  return self->_isC2K;
}

- (void)setIsCDMA:(id)a3
{
}

- (BOOL)needsMigration
{
  return self->_needsMigration;
}

- (void)setNeedsMigration:(BOOL)a3
{
  self->_needsMigration = a3;
}

- (BOOL)needsProvisioning
{
  return self->_needsProvisioning;
}

- (void)setNeedsProvisioning:(BOOL)a3
{
  self->_needsProvisioning = a3;
}

- (BOOL)needsRenewal
{
  return self->_needsRenewal;
}

- (void)setNeedsRenewal:(BOOL)a3
{
  self->_needsRenewal = a3;
}

- (int64_t)registrationStatus
{
  return self->_registrationStatus;
}

- (int)registrationType
{
  return self->_registrationType;
}

- (void)setRegistrationType:(int)a3
{
  self->_registrationType = a3;
}

- (int)retries
{
  return self->_retries;
}

- (void)setRetries:(int)a3
{
  self->_retries = a3;
}

- (int)absintheRetries
{
  return self->_absintheRetries;
}

- (void)setAbsintheRetries:(int)a3
{
  self->_absintheRetries = a3;
}

- (NSString)mainID
{
  return self->_mainID;
}

- (void)setMainID:(id)a3
{
}

- (NSArray)dependentRegistrations
{
  return self->_dependentRegistrations;
}

- (void)setDependentRegistrations:(id)a3
{
}

- (NSString)regionID
{
  return self->_regionID;
}

- (void)setRegionID:(id)a3
{
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)regionBasePhoneNumber
{
  return self->_regionBasePhoneNumber;
}

- (void)setRegionBasePhoneNumber:(id)a3
{
}

- (NSDictionary)regionServerContext
{
  return self->_regionServerContext;
}

- (void)setRegionServerContext:(id)a3
{
}

- (NSData)registrationCert
{
  return self->_registrationCert;
}

- (void)setRegistrationCert:(id)a3
{
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
}

- (NSString)guid
{
  return self->_guid;
}

- (NSMutableArray)_candidateEmails
{
  return self->_candidateEmails;
}

- (void)set_candidateEmails:(id)a3
{
}

- (NSDictionary)migrationContext
{
  return self->_migrationContext;
}

- (void)setMigrationContext:(id)a3
{
}

- (NSNumber)identityVersion
{
  return self->_identityVersion;
}

- (void)setIdentityVersion:(id)a3
{
}

- (BOOL)runningSimpleAuthentication
{
  return self->_runningSimpleAuthentication;
}

- (void)setRunningSimpleAuthentication:(BOOL)a3
{
  self->_runningSimpleAuthentication = a3;
}

- (BOOL)isDisabled
{
  return self->_isDisabled;
}

- (void)setIsDisabled:(BOOL)a3
{
  self->_isDisabled = a3;
}

- (NSString)keyPairSignature
{
  return self->_keyPairSignature;
}

- (void)setKeyPairSignature:(id)a3
{
}

- (NSString)idsUserID
{
  return self->_idsUserID;
}

- (void)setIdsUserID:(id)a3
{
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
}

- (NSArray)uris
{
  return self->_uris;
}

- (void)setUris:(id)a3
{
}

- (BOOL)shouldRegisterUsingDSHandle
{
  return self->_shouldRegisterUsingDSHandle;
}

- (void)setShouldRegisterUsingDSHandle:(BOOL)a3
{
  self->_shouldRegisterUsingDSHandle = a3;
}

- (BOOL)shouldAutoRegisterAllHandles
{
  return self->_shouldAutoRegisterAllHandles;
}

- (void)setShouldAutoRegisterAllHandles:(BOOL)a3
{
  self->_shouldAutoRegisterAllHandles = a3;
}

- (NSArray)adHocServiceNames
{
  return self->_adHocServiceNames;
}

- (void)setAdHocServiceNames:(id)a3
{
}

- (NSString)temporaryPhoneEmail
{
  return self->_temporaryPhoneEmail;
}

- (void)setTemporaryPhoneEmail:(id)a3
{
}

- (NSDate)dependentRegistrationsTTL
{
  return self->_dependentRegistrationsTTL;
}

- (void)setDependentRegistrationsTTL:(id)a3
{
}

- (NSNumber)dependentRegistrationResponseCode
{
  return self->_dependentRegistrationResponseCode;
}

- (void)setDependentRegistrationResponseCode:(id)a3
{
}

- (NSNumber)dependentRegistrationAuthRetries
{
  return self->_dependentRegistrationAuthRetries;
}

- (void)setDependentRegistrationAuthRetries:(id)a3
{
}

- (NSArray)keyTransparencyEnrolledURIs
{
  return self->_keyTransparencyEnrolledURIs;
}

- (void)setKeyTransparencyEnrolledURIs:(id)a3
{
}

- (BOOL)didRegisterWithKTAccountKey
{
  return self->_didRegisterWithKTAccountKey;
}

- (void)setDidRegisterWithKTAccountKey:(BOOL)a3
{
  self->_didRegisterWithKTAccountKey = a3;
}

- (unint64_t)optedIntoKT
{
  return self->_optedIntoKT;
}

- (void)setOptedIntoKT:(unint64_t)a3
{
  self->_optedIntoKT = a3;
}

- (BOOL)didRegisterWithDeviceSignature
{
  return self->_didRegisterWithDeviceSignature;
}

- (void)setDidRegisterWithDeviceSignature:(BOOL)a3
{
  self->_didRegisterWithDeviceSignature = a3;
}

- (NSString)userUniqueIdentifier
{
  return self->_userUniqueIdentifier;
}

- (NSDictionary)contextInfo
{
  return self->_contextInfo;
}

- (void)setContextInfo:(id)a3
{
}

- (FTPasswordManager)passwordManager
{
  return self->_passwordManager;
}

- (void)setPasswordManager:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

@end