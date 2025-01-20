@interface EscrowGenericRequest
+ (BOOL)pcsNoRecord;
+ (BOOL)pcsUpdateDisabled;
- (AppleIDPasswordMetadata)appleIDPasswordMetadata;
- (BOOL)duplicate;
- (BOOL)fmipRecovery;
- (BOOL)guitarfish;
- (BOOL)guitarfishToken;
- (BOOL)iCDP;
- (BOOL)isPcsRecord;
- (BOOL)nonViableRepair;
- (BOOL)recoveryResult;
- (BOOL)silentAttempt;
- (BOOL)silentDoubleRecovery;
- (BOOL)stingray;
- (BOOL)useRecoveryPET;
- (EscrowGenericRequest)initWithRequest:(id)a3;
- (LakituAccount)cachedCurrentAccount;
- (NSArray)baseRootCertVersions;
- (NSArray)trustedRootCertVersions;
- (NSData)blob;
- (NSDictionary)escrowRecord;
- (NSDictionary)metadata;
- (NSNumber)protocol;
- (NSString)activityLabel;
- (NSString)activityUUID;
- (NSString)altDSID;
- (NSString)appleID;
- (NSString)authToken;
- (NSString)baseURL;
- (NSString)bypassToken;
- (NSString)challengeCode;
- (NSString)command;
- (NSString)countryCode;
- (NSString)countryDialCode;
- (NSString)deviceSessionID;
- (NSString)doubleRecoveryUUID;
- (NSString)dsid;
- (NSString)duplicateEncodedMetadata;
- (NSString)encodedMetadata;
- (NSString)flowID;
- (NSString)fmipUUID;
- (NSString)iCloudEnv;
- (NSString)iCloudPassword;
- (NSString)phoneNumber;
- (NSString)rawPassword;
- (NSString)recordID;
- (NSString)recordLabel;
- (NSString)recoveryPassphrase;
- (NSString)recoveryUUID;
- (NSString)requestDSID;
- (id)_filteredMetadataForDoubleEnrollment:(id)a3;
- (id)additionalHeaders;
- (id)authorizationHeader;
- (id)authorizationHeaderWithUser:(id)a3 password:(id)a4 authType:(id)a5;
- (id)bodyDictionary;
- (id)currentAccount;
- (id)loggingDescription;
- (id)urlRequest;
- (id)urlString;
- (id)validateInput;
- (void)_checkFetchOperationWithHandler:(id)a3;
- (void)_checkReadOperationWithHandler:(id)a3;
- (void)_checkUpdateOperationWithHandler:(id)a3;
- (void)setActivityLabel:(id)a3;
- (void)setActivityUUID:(id)a3;
- (void)setBaseRootCertVersions:(id)a3;
- (void)setBlob:(id)a3;
- (void)setBypassToken:(id)a3;
- (void)setCachedCurrentAccount:(id)a3;
- (void)setDoubleRecoveryUUID:(id)a3;
- (void)setDuplicate:(BOOL)a3;
- (void)setDuplicateEncodedMetadata:(id)a3;
- (void)setEncodedMetadata:(id)a3;
- (void)setFmipUUID:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setRecoveryResult:(BOOL)a3;
- (void)setRecoveryUUID:(id)a3;
- (void)setRequestDSID:(id)a3;
- (void)setTrustedRootCertVersions:(id)a3;
@end

@implementation EscrowGenericRequest

- (EscrowGenericRequest)initWithRequest:(id)a3
{
  id v4 = a3;
  v61.receiver = self;
  v61.super_class = (Class)&OBJC_CLASS___EscrowGenericRequest;
  v5 = -[EscrowGenericRequest init](&v61, "init");
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 dsid]);
    dsid = v5->_dsid;
    v5->_dsid = (NSString *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue([v4 dsid]);
    requestDSID = v5->_requestDSID;
    v5->_requestDSID = (NSString *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue([v4 escrowProxyURL]);
    baseURL = v5->_baseURL;
    v5->_baseURL = (NSString *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue([v4 appleID]);
    appleID = v5->_appleID;
    v5->_appleID = (NSString *)v12;

    uint64_t v14 = objc_claimAutoreleasedReturnValue([v4 metadata]);
    metadata = v5->_metadata;
    v5->_metadata = (NSDictionary *)v14;

    uint64_t v16 = objc_claimAutoreleasedReturnValue([v4 authToken]);
    authToken = v5->_authToken;
    v5->_authToken = (NSString *)v16;

    uint64_t v18 = objc_claimAutoreleasedReturnValue([v4 recordID]);
    recordID = v5->_recordID;
    v5->_recordID = (NSString *)v18;

    uint64_t v20 = objc_claimAutoreleasedReturnValue([v4 iCloudEnv]);
    iCloudEnv = v5->_iCloudEnv;
    v5->_iCloudEnv = (NSString *)v20;

    uint64_t v22 = objc_claimAutoreleasedReturnValue([v4 smsTarget]);
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v22;

    uint64_t v24 = objc_claimAutoreleasedReturnValue([v4 countryCode]);
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v24;

    uint64_t v26 = objc_claimAutoreleasedReturnValue([v4 escrowRecord]);
    escrowRecord = v5->_escrowRecord;
    v5->_escrowRecord = (NSDictionary *)v26;

    uint64_t v28 = objc_claimAutoreleasedReturnValue([v4 encodedMetadata]);
    encodedMetadata = v5->_encodedMetadata;
    v5->_encodedMetadata = (NSString *)v28;

    uint64_t v30 = objc_claimAutoreleasedReturnValue([v4 duplicateEncodedMetadata]);
    duplicateEncodedMetadata = v5->_duplicateEncodedMetadata;
    v5->_duplicateEncodedMetadata = (NSString *)v30;

    uint64_t v32 = objc_claimAutoreleasedReturnValue([v4 verificationToken]);
    challengeCode = v5->_challengeCode;
    v5->_challengeCode = (NSString *)v32;

    uint64_t v34 = objc_claimAutoreleasedReturnValue([v4 iCloudPassword]);
    iCloudPassword = v5->_iCloudPassword;
    v5->_iCloudPassword = (NSString *)v34;

    uint64_t v36 = objc_claimAutoreleasedReturnValue([v4 rawPassword]);
    rawPassword = v5->_rawPassword;
    v5->_rawPassword = (NSString *)v36;

    uint64_t v38 = objc_claimAutoreleasedReturnValue([v4 countryDialCode]);
    countryDialCode = v5->_countryDialCode;
    v5->_countryDialCode = (NSString *)v38;

    uint64_t v40 = objc_claimAutoreleasedReturnValue([v4 passphrase]);
    recoveryPassphrase = v5->_recoveryPassphrase;
    v5->_recoveryPassphrase = (NSString *)v40;

    v5->_silentAttempt = [v4 silent];
    v5->_useRecoveryPET = [v4 useRecoveryPET];
    v5->_fmipRecovery = [v4 fmipRecovery];
    uint64_t v42 = objc_claimAutoreleasedReturnValue([v4 fmipUUID]);
    fmipUUID = v5->_fmipUUID;
    v5->_fmipUUID = (NSString *)v42;

    v5->_stingray = [v4 stingray];
    v5->_iCDP = [v4 icdp];
    v44 = (void *)objc_claimAutoreleasedReturnValue([v4 activityUUID]);
    uint64_t v45 = objc_claimAutoreleasedReturnValue([v44 UUIDString]);
    activityUUID = v5->_activityUUID;
    v5->_activityUUID = (NSString *)v45;

    uint64_t v47 = objc_claimAutoreleasedReturnValue([v4 activityLabel]);
    activityLabel = v5->_activityLabel;
    v5->_activityLabel = (NSString *)v47;

    v5->_silentDoubleRecovery = [v4 silentDoubleRecovery];
    v5->_nonViableRepair = [v4 nonViableRepair];
    uint64_t v49 = objc_claimAutoreleasedReturnValue([v4 recoveryUUID]);
    recoveryUUID = v5->_recoveryUUID;
    v5->_recoveryUUID = (NSString *)v49;

    uint64_t v51 = objc_claimAutoreleasedReturnValue([v4 doubleRecoveryUUID]);
    doubleRecoveryUUID = v5->_doubleRecoveryUUID;
    v5->_doubleRecoveryUUID = (NSString *)v51;

    v5->_recoveryResult = [v4 recoveryResult];
    uint64_t v53 = objc_claimAutoreleasedReturnValue([v4 deviceSessionID]);
    deviceSessionID = v5->_deviceSessionID;
    v5->_deviceSessionID = (NSString *)v53;

    uint64_t v55 = objc_claimAutoreleasedReturnValue([v4 flowID]);
    flowID = v5->_flowID;
    v5->_flowID = (NSString *)v55;

    v5->_guitarfish = [v4 guitarfish];
    v5->_guitarfishToken = [v4 guitarfishToken];
    uint64_t v57 = objc_claimAutoreleasedReturnValue([v4 appleIDPasswordMetadata]);
    appleIDPasswordMetadata = v5->_appleIDPasswordMetadata;
    v5->_appleIDPasswordMetadata = (AppleIDPasswordMetadata *)v57;

    v59 = (void *)objc_claimAutoreleasedReturnValue([v4 queue]);
    -[LakituRequest setQueue:](v5, "setQueue:", v59);
  }

  return v5;
}

- (id)loggingDescription
{
  if (-[EscrowGenericRequest duplicate](self, "duplicate"))
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___EscrowGenericRequest;
    v3 = -[LakituRequest loggingDescription](&v9, "loggingDescription");
    id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingString:@" [DOUBLE]"]);

    return v5;
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___EscrowGenericRequest;
    v7 = -[LakituRequest loggingDescription](&v8, "loggingDescription");
    return (id)objc_claimAutoreleasedReturnValue(v7);
  }

- (NSString)recoveryPassphrase
{
  if (-[EscrowGenericRequest guitarfish](self, "guitarfish"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest rawPassword](self, "rawPassword"));

    if (!v3)
    {
      uint64_t v5 = CloudServicesLog(v4);
      uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        sub_10004498C();
      }
    }

    v7 = (NSString *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest rawPassword](self, "rawPassword"));
    goto LABEL_10;
  }

  if (-[EscrowGenericRequest guitarfishToken](self, "guitarfishToken")
    || -[EscrowGenericRequest stingray](self, "stingray"))
  {
    v7 = (NSString *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest dsid](self, "dsid"));
LABEL_10:
    objc_super v8 = v7;
    return v8;
  }

  if (!-[EscrowGenericRequest duplicate](self, "duplicate")
    || (uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest escrowRecord](self, "escrowRecord")),
        v10,
        !v10))
  {
    v7 = self->_recoveryPassphrase;
    goto LABEL_10;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest escrowRecord](self, "escrowRecord"));
  objc_super v8 = (NSString *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"DoubleEnrollmentPassword"]);

  if (!v8)
  {
    uint64_t v13 = CloudServicesLog(v12);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000449C4();
    }
  }

  return v8;
}

- (id)currentAccount
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest cachedCurrentAccount](self, "cachedCurrentAccount"));

  if (!v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest requestDSID](self, "requestDSID"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[LakituAccount personaAwareAccountWithDSID:]( &OBJC_CLASS___LakituAccount,  "personaAwareAccountWithDSID:",  v4));
    -[EscrowGenericRequest setCachedCurrentAccount:](self, "setCachedCurrentAccount:", v5);
  }

  return -[EscrowGenericRequest cachedCurrentAccount](self, "cachedCurrentAccount");
}

- (NSString)dsid
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_dsid)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest currentAccount](v2, "currentAccount"));
    uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 dsid]);
    dsid = v2->_dsid;
    v2->_dsid = (NSString *)v4;
  }

  objc_sync_exit(v2);

  return v2->_dsid;
}

- (NSString)authToken
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_authToken)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest currentAccount](v2, "currentAccount"));
    uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 authToken]);
    authToken = v2->_authToken;
    v2->_authToken = (NSString *)v4;
  }

  objc_sync_exit(v2);

  return v2->_authToken;
}

- (NSString)baseURL
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_baseURL)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest currentAccount](v2, "currentAccount"));
    uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 escrowURL]);
    baseURL = v2->_baseURL;
    v2->_baseURL = (NSString *)v4;
  }

  objc_sync_exit(v2);

  return v2->_baseURL;
}

- (NSString)altDSID
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest currentAccount](v2, "currentAccount"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 altDSID]);

  objc_sync_exit(v2);
  return (NSString *)v4;
}

- (NSString)iCloudEnv
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_iCloudEnv)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest currentAccount](v2, "currentAccount"));
    uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 iCloudEnv]);
    iCloudEnv = v2->_iCloudEnv;
    v2->_iCloudEnv = (NSString *)v4;
  }

  objc_sync_exit(v2);

  return v2->_iCloudEnv;
}

- (NSString)recordLabel
{
  if (-[EscrowGenericRequest guitarfish](self, "guitarfish"))
  {
    if (-[EscrowGenericRequest duplicate](self, "duplicate")) {
      sub_1000449F0();
    }
    v3 = (__CFString **)&kEscrowServiceGuitarfishLabel;
  }

  else if (-[EscrowGenericRequest guitarfishToken](self, "guitarfishToken"))
  {
    if (-[EscrowGenericRequest duplicate](self, "duplicate")) {
      sub_1000449F0();
    }
    v3 = (__CFString **)&kEscrowServiceGuitarfishTokenLabel;
  }

  else
  {
    if (-[EscrowGenericRequest stingray](self, "stingray"))
    {
      unsigned int v4 = -[EscrowGenericRequest duplicate](self, "duplicate");
      v3 = off_100069970;
      uint64_t v5 = (__CFString **)&kEscrowServiceStingrayLabel;
    }

    else
    {
      if (!-[EscrowGenericRequest iCDP](self, "iCDP"))
      {
        v3 = off_100069968;
        return (NSString *)*v3;
      }

      unsigned int v4 = -[EscrowGenericRequest duplicate](self, "duplicate");
      v3 = off_100069980;
      uint64_t v5 = off_100069978;
    }

    if (!v4) {
      v3 = v5;
    }
  }

  return (NSString *)*v3;
}

- (id)validateInput
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___EscrowGenericRequest;
  id v4 = -[LakituRequest validateInput](&v19, "validateInput");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v5) {
    return v5;
  }
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest appleID](self, "appleID"));
  id v7 = [v6 length];
  if (v7)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest iCloudPassword](self, "iCloudPassword"));
    if ([v2 length])
    {

LABEL_9:
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest baseURL](self, "baseURL"));
      id v12 = [v11 length];

      if (v12) {
        return 0LL;
      }
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[CloudServicesError errorWithCode:error:format:]( &OBJC_CLASS___CloudServicesError,  "errorWithCode:error:format:",  22LL,  0LL,  @"Missing base URL"));
      uint64_t v14 = CloudServicesLog(v5);
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Missing base URL", buf, 2u);
      }

      goto LABEL_18;
    }
  }

  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest dsid](self, "dsid"));
  if ([v8 length])
  {
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest authToken](self, "authToken"));
    id v10 = [v9 length];

    if (v7) {
    if (v10)
    }
      goto LABEL_9;
  }

  else
  {

    if (v7) {
  }
    }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[CloudServicesError errorWithCode:error:format:]( &OBJC_CLASS___CloudServicesError,  "errorWithCode:error:format:",  311LL,  0LL,  @"No valid user found"));
  uint64_t v16 = CloudServicesLog(v5);
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest dsid](self, "dsid"));
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest authToken](self, "authToken"));
    *(_DWORD *)buf = 138412546;
    v21 = v17;
    __int16 v22 = 2112;
    v23 = v18;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "No user signed in: %@ %@", buf, 0x16u);
  }

- (id)bodyDictionary
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[LakituRequest protocolVersion](self, "protocolVersion"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, @"version");

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest command](self, "command"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, @"command");

  if (-[EscrowGenericRequest guitarfish](self, "guitarfish"))
  {
    if (-[EscrowGenericRequest duplicate](self, "duplicate")) {
      sub_1000449F0();
    }
    uint64_t v6 = (__CFString **)&kEscrowServiceGuitarfishLabel;
    goto LABEL_16;
  }

  if (-[EscrowGenericRequest guitarfishToken](self, "guitarfishToken"))
  {
    if (-[EscrowGenericRequest duplicate](self, "duplicate")) {
      sub_1000449F0();
    }
    uint64_t v6 = (__CFString **)&kEscrowServiceGuitarfishTokenLabel;
    goto LABEL_16;
  }

  if (-[EscrowGenericRequest stingray](self, "stingray"))
  {
    unsigned int v7 = -[EscrowGenericRequest duplicate](self, "duplicate");
    uint64_t v6 = off_100069970;
    if (!v7) {
      uint64_t v6 = (__CFString **)&kEscrowServiceStingrayLabel;
    }
    goto LABEL_16;
  }

  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest recordID](self, "recordID"));

  if (!v8)
  {
    uint64_t v6 = off_100069968;
LABEL_16:
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", *v6, @"label");
    goto LABEL_17;
  }

  unsigned int v9 = -[EscrowGenericRequest duplicate](self, "duplicate");
  id v10 = @".double";
  if (!v9) {
    id v10 = &stru_10006AB28;
  }
  v11 = v10;
  id v12 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest recordID](self, "recordID"));
  uint64_t v14 = -[NSString initWithFormat:](v12, "initWithFormat:", @"%@.%@%@", @"com.apple.icdp.record", v13, v11);

  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v14, @"label");
LABEL_17:
  if (-[EscrowGenericRequest fmipRecovery](self, "fmipRecovery")) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"fmipRecovery");
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest fmipUUID](self, "fmipUUID"));

  if (v15)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest fmipUUID](self, "fmipUUID"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v16, @"fmipUUID");
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest activityUUID](self, "activityUUID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v17, @"transactionUUID");

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest activityLabel](self, "activityLabel"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v18, @"userActionLabel");

  return v3;
}

- (id)authorizationHeaderWithUser:(id)a3 password:(id)a4 authType:(id)a5
{
  id v7 = a5;
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@:%@", a3, a4));
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 dataUsingEncoding:4]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 base64EncodedStringWithOptions:0]);

  if (sub_1000052A8())
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 dataUsingEncoding:4]);
    uint64_t v12 = CloudServicesLog(v11);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 sha1Digest]);
      v15 = (void *)objc_claimAutoreleasedReturnValue([v14 hexString]);
      *(_DWORD *)buf = 138412546;
      id v19 = v7;
      __int16 v20 = 2112;
      v21 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "auth type %@, sha1 %@", buf, 0x16u);
    }
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v7, v10));

  return v16;
}

- (id)authorizationHeader
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest appleID](self, "appleID"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest iCloudPassword](self, "iCloudPassword"));
  uint64_t v5 = (void *)v4;
  if (v3 && v4)
  {
    if (-[EscrowGenericRequest useRecoveryPET](self, "useRecoveryPET")) {
      uint64_t v6 = @"X-MobileMe-Recovery-PET";
    }
    else {
      uint64_t v6 = @"Basic";
    }
  }

  else
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest dsid](self, "dsid"));

    uint64_t v8 = objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest authToken](self, "authToken"));
    uint64_t v6 = @"X-MobileMe-AuthToken";
    v3 = (void *)v7;
    uint64_t v5 = (void *)v8;
  }

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( -[EscrowGenericRequest authorizationHeaderWithUser:password:authType:]( self,  "authorizationHeaderWithUser:password:authType:",  v3,  v5,  v6));

  return v9;
}

- (id)urlRequest
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___EscrowGenericRequest;
  v3 = -[LakituRequest urlRequest](&v13, "urlRequest");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest bodyDictionary](self, "bodyDictionary"));
  id v12 = 0LL;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v5,  100LL,  0LL,  &v12));
  id v7 = v12;

  if (v6)
  {
    [v4 setHTTPBody:v6];
  }

  else
  {
    uint64_t v9 = CloudServicesLog(v8);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100044A04((uint64_t)v7, v10);
    }
  }

  [v4 setHTTPMethod:@"POST"];

  return v4;
}

- (id)urlString
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest baseURL](self, "baseURL"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest command](self, "command"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 lowercaseString]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingFormat:@"/escrowproxy/api/%@", v5]);

  return v6;
}

- (id)_filteredMetadataForDoubleEnrollment:(id)a3
{
  id v3 = [a3 mutableCopy];
  v6[0] = kSecureBackupEscrowedSPKIKey;
  v6[1] = kSecureBackupBottleIDKey;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v6, 2LL));
  [v3 removeObjectsForKeys:v4];

  return v3;
}

- (id)additionalHeaders
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___EscrowGenericRequest;
  id v3 = -[LakituRequest additionalHeaders](&v11, "additionalHeaders");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = [v4 mutableCopy];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest deviceSessionID](self, "deviceSessionID"));
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest deviceSessionID](self, "deviceSessionID"));
    [v5 setObject:v7 forKeyedSubscript:@"X-Apple-I-Device-Session-Id"];
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest flowID](self, "flowID"));

  if (v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest flowID](self, "flowID"));
    [v5 setObject:v9 forKeyedSubscript:@"X-Apple-I-Flow-Id"];
  }

  if (-[EscrowGenericRequest nonViableRepair](self, "nonViableRepair")) {
    [v5 setObject:@"true" forKeyedSubscript:@"X-Apple-Non-Viable-Record-Repair"];
  }
  return v5;
}

+ (BOOL)pcsUpdateDisabled
{
  v2 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.cloudservices");
  unsigned __int8 v3 = -[NSUserDefaults BOOLForKey:](v2, "BOOLForKey:", @"PCS-UpdateDisabled");

  return v3;
}

+ (BOOL)pcsNoRecord
{
  v2 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.cloudservices");
  unsigned __int8 v3 = -[NSUserDefaults BOOLForKey:](v2, "BOOLForKey:", @"PCS-NoRecord");

  return v3;
}

- (BOOL)isPcsRecord
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest recordLabel](self, "recordLabel"));
  if ([v3 isEqualToString:kEscrowServiceStingrayLabel])
  {
    unsigned __int8 v4 = 1;
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest recordLabel](self, "recordLabel"));
    unsigned __int8 v4 = [v5 isEqualToString:@"com.apple.protectedcloudstorage.record.double"];
  }

  return v4;
}

- (void)_checkUpdateOperationWithHandler:(id)a3
{
  unsigned __int8 v4 = (void (**)(id, void, void *))a3;
  if (+[EscrowGenericRequest pcsUpdateDisabled](&OBJC_CLASS___EscrowGenericRequest, "pcsUpdateDisabled")
    && -[EscrowGenericRequest isPcsRecord](self, "isPcsRecord"))
  {
    NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
    id v12 = @"artificial error injected (com.apple.cloudservices/PCS-UpdateDisabled)";
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"EscrowProxyErrorDomain",  -2004LL,  v5));

    uint64_t v8 = CloudServicesLog(v7);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_100044A78(self);
    }

    v4[2](v4, 0LL, v6);
  }

  else
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___EscrowGenericRequest;
    -[LakituRequest performRequestWithHandler:](&v10, "performRequestWithHandler:", v4);
  }
}

- (void)_checkReadOperationWithHandler:(id)a3
{
  unsigned __int8 v4 = (void (**)(id, void, void *))a3;
  if (+[EscrowGenericRequest pcsNoRecord](&OBJC_CLASS___EscrowGenericRequest, "pcsNoRecord")
    && -[EscrowGenericRequest isPcsRecord](self, "isPcsRecord"))
  {
    NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
    id v12 = @"artificial error injected (com.apple.cloudservices/PCS-NoRecord)";
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"EscrowProxyErrorDomain",  -2003LL,  v5));

    uint64_t v8 = CloudServicesLog(v7);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_100044B0C(self);
    }

    v4[2](v4, 0LL, v6);
  }

  else
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___EscrowGenericRequest;
    -[LakituRequest performRequestWithHandler:](&v10, "performRequestWithHandler:", v4);
  }
}

- (void)_checkFetchOperationWithHandler:(id)a3
{
  id v4 = a3;
  if (+[EscrowGenericRequest pcsNoRecord](&OBJC_CLASS___EscrowGenericRequest, "pcsNoRecord"))
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    void v6[2] = sub_10000E408;
    v6[3] = &unk_100069038;
    id v7 = v4;
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___EscrowGenericRequest;
    -[LakituRequest performRequestWithHandler:](&v5, "performRequestWithHandler:", v6);
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___EscrowGenericRequest;
    -[LakituRequest performRequestWithHandler:](&v8, "performRequestWithHandler:", v4);
  }
}

- (NSDictionary)escrowRecord
{
  return self->_escrowRecord;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (NSString)encodedMetadata
{
  return self->_encodedMetadata;
}

- (void)setEncodedMetadata:(id)a3
{
}

- (NSString)duplicateEncodedMetadata
{
  return self->_duplicateEncodedMetadata;
}

- (void)setDuplicateEncodedMetadata:(id)a3
{
}

- (NSNumber)protocol
{
  return self->_protocol;
}

- (NSString)command
{
  return self->_command;
}

- (NSString)countryDialCode
{
  return self->_countryDialCode;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (NSString)challengeCode
{
  return self->_challengeCode;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (NSString)iCloudPassword
{
  return self->_iCloudPassword;
}

- (NSString)rawPassword
{
  return self->_rawPassword;
}

- (NSString)recordID
{
  return self->_recordID;
}

- (BOOL)stingray
{
  return self->_stingray;
}

- (BOOL)iCDP
{
  return self->_iCDP;
}

- (BOOL)silentAttempt
{
  return self->_silentAttempt;
}

- (BOOL)useRecoveryPET
{
  return self->_useRecoveryPET;
}

- (BOOL)fmipRecovery
{
  return self->_fmipRecovery;
}

- (BOOL)silentDoubleRecovery
{
  return self->_silentDoubleRecovery;
}

- (BOOL)nonViableRepair
{
  return self->_nonViableRepair;
}

- (NSData)blob
{
  return self->_blob;
}

- (void)setBlob:(id)a3
{
}

- (NSArray)baseRootCertVersions
{
  return self->_baseRootCertVersions;
}

- (void)setBaseRootCertVersions:(id)a3
{
}

- (NSArray)trustedRootCertVersions
{
  return self->_trustedRootCertVersions;
}

- (void)setTrustedRootCertVersions:(id)a3
{
}

- (NSString)bypassToken
{
  return self->_bypassToken;
}

- (void)setBypassToken:(id)a3
{
}

- (NSString)fmipUUID
{
  return self->_fmipUUID;
}

- (void)setFmipUUID:(id)a3
{
}

- (NSString)activityUUID
{
  return self->_activityUUID;
}

- (void)setActivityUUID:(id)a3
{
}

- (NSString)activityLabel
{
  return self->_activityLabel;
}

- (void)setActivityLabel:(id)a3
{
}

- (BOOL)duplicate
{
  return self->_duplicate;
}

- (void)setDuplicate:(BOOL)a3
{
  self->_duplicate = a3;
}

- (NSString)recoveryUUID
{
  return self->_recoveryUUID;
}

- (void)setRecoveryUUID:(id)a3
{
}

- (NSString)doubleRecoveryUUID
{
  return self->_doubleRecoveryUUID;
}

- (void)setDoubleRecoveryUUID:(id)a3
{
}

- (BOOL)recoveryResult
{
  return self->_recoveryResult;
}

- (void)setRecoveryResult:(BOOL)a3
{
  self->_recoveryResult = a3;
}

- (NSString)deviceSessionID
{
  return self->_deviceSessionID;
}

- (NSString)flowID
{
  return self->_flowID;
}

- (BOOL)guitarfish
{
  return self->_guitarfish;
}

- (BOOL)guitarfishToken
{
  return self->_guitarfishToken;
}

- (AppleIDPasswordMetadata)appleIDPasswordMetadata
{
  return self->_appleIDPasswordMetadata;
}

- (LakituAccount)cachedCurrentAccount
{
  return self->_cachedCurrentAccount;
}

- (void)setCachedCurrentAccount:(id)a3
{
}

- (NSString)requestDSID
{
  return self->_requestDSID;
}

- (void)setRequestDSID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end