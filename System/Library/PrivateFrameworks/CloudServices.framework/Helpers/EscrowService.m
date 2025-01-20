@interface EscrowService
+ (BOOL)isFatalError:(id)a3;
+ (id)certificateRequest:(id)a3 duplicate:(BOOL)a4 error:(id *)a5;
+ (id)createEscrowBlobWithCertificate:(id)a3 escrowRequest:(id)a4 error:(id *)a5;
+ (id)doubleEnrollmentRecordFromPrimaryRecord:(id)a3;
- (BOOL)_invalidateEscrowCache:(id)a3 error:(id *)a4;
- (BOOL)cacheStoredCertificate:(id)a3 error:(id *)a4;
- (BOOL)processPrerecord:(id)a3 outerRequest:(id)a4 escrowRequest:(id)a5 error:(id *)a6;
- (EscrowService)initWithOperationsLogger:(id)a3;
- (SBEscrowOperationLogger)operationsLogger;
- (id)_getBypassToken;
- (id)fetchCachedCertificateWithRequest:(id)a3 error:(id *)a4;
- (id)keychainBaseQueryWithEnvironment:(id)a3 andBaseURL:(id)a4;
- (void)_deleteRecordWithRequest:(id)a3 duplicate:(BOOL)a4 completionBlock:(id)a5;
- (void)_fetchCertificatesWithRequest:(id)a3 duplicate:(BOOL)a4 completionBlock:(id)a5;
- (void)_performDoubleRecoveryICDPWithRequest:(id)a3 primaryResponse:(id)a4;
- (void)_performDoubleRecoveryStingrayWithRequest:(id)a3 primaryResponse:(id)a4;
- (void)_performPostEnrollSilentRecoveryWithRequest:(id)a3;
- (void)_recoverActualRecordWithRequest:(id)a3 duplicate:(BOOL)a4 completionBlock:(id)a5;
- (void)_recoverWithVersion:(int)a3 req:(id)a4 duplicate:(BOOL)a5 sesWrapper:(id)a6 srpInitResponse:(id)a7 reply:(id)a8;
- (void)_removeBypassToken;
- (void)_saveBypassToken:(id)a3;
- (void)_srpInitHelper:(id)a3 duplicate:(BOOL)a4 completionBlock:(id)a5;
- (void)_storeRecordWithRequest:(id)a3 duplicate:(BOOL)a4 completionBlock:(id)a5;
- (void)changeSMSTargetWithRequest:(id)a3 completionBlock:(id)a4;
- (void)deleteRecordWithRequest:(id)a3 completionBlock:(id)a4;
- (void)fetchCertificatesAndDuplicateRequest:(id)a3 completionBlock:(id)a4;
- (void)fetchCertificatesWithRequest:(id)a3 completionBlock:(id)a4;
- (void)getAccountInfoWithRequest:(id)a3 completionBlock:(id)a4;
- (void)getCountrySMSCodesWithRequest:(id)a3 completionBlock:(id)a4;
- (void)listSMSTargetsWithRequest:(id)a3 completionBlock:(id)a4;
- (void)logRecoveryResults:(id)a3 completionBlock:(id)a4;
- (void)recoverRecordWithRequest:(id)a3 completionBlock:(id)a4;
- (void)setPasswordMetadataWithRequest:(id)a3 response:(id)a4 ses:(id)a5;
- (void)startSMSChallengeWithRequest:(id)a3 completionBlock:(id)a4;
- (void)storeRecordWithCertDataRequest:(id)a3 duplicate:(BOOL)a4 completionBlock:(id)a5;
- (void)storeRecordWithRequest:(id)a3 completionBlock:(id)a4;
- (void)updateRecordMetadataWithRequest:(id)a3 completionBlock:(id)a4;
- (void)verifyCertificateWithRequest:(id)a3 completionBlock:(id)a4;
@end

@implementation EscrowService

- (void)_saveBypassToken:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  @"EscrowServiceBypassToken",  kSecAttrAccount);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  @"EscrowService",  kSecAttrService);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  kSecClassGenericPassword,  kSecClass);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  kSecAttrSynchronizable);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 dataUsingEncoding:1]);

  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v5, kSecValueData);
  uint64_t v6 = SecItemAdd((CFDictionaryRef)v4, 0LL);
  if ((_DWORD)v6)
  {
    uint64_t v7 = CloudServicesLog(v6);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100047558();
    }
  }
}

- (void)_removeBypassToken
{
  v6[0] = kSecAttrAccount;
  v6[1] = kSecAttrService;
  v7[0] = @"EscrowServiceBypassToken";
  v7[1] = @"EscrowService";
  v6[2] = kSecClass;
  v6[3] = kSecAttrSynchronizable;
  v7[2] = kSecClassGenericPassword;
  v7[3] = &__kCFBooleanTrue;
  v2 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  4LL));
  uint64_t v3 = SecItemDelete(v2);
  if ((_DWORD)v3)
  {
    uint64_t v4 = CloudServicesLog(v3);
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000475BC();
    }
  }
}

- (id)_getBypassToken
{
  CFTypeRef v10 = 0LL;
  v11[0] = kSecAttrAccount;
  v11[1] = kSecAttrService;
  v12[0] = @"EscrowServiceBypassToken";
  v12[1] = @"EscrowService";
  v11[2] = kSecClass;
  v11[3] = kSecAttrSynchronizable;
  v12[2] = kSecClassGenericPassword;
  v12[3] = &__kCFBooleanTrue;
  v11[4] = kSecReturnData;
  v12[4] = &__kCFBooleanTrue;
  v2 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  5LL));
  uint64_t v3 = SecItemCopyMatching(v2, &v10);
  if ((_DWORD)v3 == -25300)
  {
    uint64_t v6 = 0LL;
  }

  else
  {
    if ((_DWORD)v3)
    {
      uint64_t v7 = CloudServicesLog(v3);
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100047620();
      }

      v5 = 0LL;
      uint64_t v4 = 0LL;
    }

    else
    {
      uint64_t v4 = (void *)v10;
      v5 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v10, 1LL);
    }

    uint64_t v6 = v5;
  }

  return v6;
}

- (EscrowService)initWithOperationsLogger:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___EscrowService;
  uint64_t v6 = -[EscrowService init](&v10, "init");
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_operationsLogger, a3);
    v8 = v7;
  }

  return v7;
}

- (void)getAccountInfoWithRequest:(id)a3 completionBlock:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = CloudServicesLog(v6);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "in getAccountInfoWithRequest:", buf, 2u);
  }

  v9 = -[EscrowGenericRequest initWithRequest:]( objc_alloc(&OBJC_CLASS___EscrowAccountInfoRequest),  "initWithRequest:",  v6);
  uint64_t v11 = CloudServicesLog(v10);
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "calling iCloud accountInfoRequest", buf, 2u);
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100034AEC;
  v14[3] = &unk_100069038;
  id v15 = v5;
  id v13 = v5;
  -[EscrowAccountInfoRequest performRequestWithHandler:](v9, "performRequestWithHandler:", v14);
}

+ (id)certificateRequest:(id)a3 duplicate:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  v8 = -[EscrowGenericRequest initWithRequest:]( objc_alloc(&OBJC_CLASS___EscrowCertificateRequest),  "initWithRequest:",  v7);
  -[EscrowGenericRequest setDuplicate:](v8, "setDuplicate:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest altDSID](v8, "altDSID"));
  uint64_t v10 = objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest iCloudEnv](v8, "iCloudEnv"));
  uint64_t v11 = (void *)v10;
  if (v9) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    uint64_t v13 = CloudServicesLog(v10);
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000477C4();
    }

    if (!a5) {
      goto LABEL_43;
    }
    uint64_t v15 = kEscrowServiceErrorDomain;
    v16 = @"Can't get account info";
    uint64_t v17 = 116LL;
    goto LABEL_37;
  }

  if (v6
    || (v18 = (void *)objc_claimAutoreleasedReturnValue([v7 specifiedFederation]), v18,
                                                                                                  !v18))
  {
    id v61 = v7;
    unsigned int v27 = -[EscrowGenericRequest stingray](v8, "stingray");
    if (v27) {
      uint64_t v28 = 2LL;
    }
    else {
      uint64_t v28 = 6LL;
    }
    if (v27) {
      uint64_t v29 = 3LL;
    }
    else {
      uint64_t v29 = 7LL;
    }
    v30 = (void *)objc_claimAutoreleasedReturnValue( +[CSCertOperations rootBaseVersionsForRootType:altDSID:inEnvironment:duplicate:]( &OBJC_CLASS___CSCertOperations,  "rootBaseVersionsForRootType:altDSID:inEnvironment:duplicate:",  v28,  v9,  v11,  v6));
    -[EscrowGenericRequest setBaseRootCertVersions:](v8, "setBaseRootCertVersions:", v30);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest baseRootCertVersions](v8, "baseRootCertVersions"));
    id v32 = [v31 count];

    if (!v32)
    {
      uint64_t v49 = CloudServicesLog(v33);
      v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
        sub_100047684();
      }

      id v7 = v61;
      if (!a5) {
        goto LABEL_43;
      }
      v51 = +[CloudServicesError errorWithDomain:code:format:]( &OBJC_CLASS___CloudServicesError,  "errorWithDomain:code:format:",  kEscrowServiceErrorDomain,  118LL,  @"Can't get base cert versions for root type %u in %@ environment",  v28,  v11);
LABEL_38:
      v48 = 0LL;
      *a5 = (id)objc_claimAutoreleasedReturnValue(v51);
      goto LABEL_44;
    }

    v34 = (void *)objc_claimAutoreleasedReturnValue( +[CSCertOperations rootTrustedVersionsForRootType:altDSID:inEnvironment:duplicate:]( &OBJC_CLASS___CSCertOperations,  "rootTrustedVersionsForRootType:altDSID:inEnvironment:duplicate:",  v29,  v9,  v11,  v6));
    -[EscrowGenericRequest setTrustedRootCertVersions:](v8, "setTrustedRootCertVersions:", v34);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest trustedRootCertVersions](v8, "trustedRootCertVersions"));
    id v36 = [v35 count];

    id v7 = v61;
    if (v36) {
      goto LABEL_22;
    }
    uint64_t v52 = CloudServicesLog(v26);
    v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
      sub_1000476E4();
    }

    if (!a5)
    {
LABEL_43:
      v48 = 0LL;
      goto LABEL_44;
    }

    uint64_t v15 = kEscrowServiceErrorDomain;
    uint64_t v59 = v29;
    v60 = v11;
    v16 = @"Can't get cert versions for root type %u in %@ environment";
    uint64_t v17 = 119LL;
LABEL_37:
    v51 = +[CloudServicesError errorWithDomain:code:format:]( &OBJC_CLASS___CloudServicesError,  "errorWithDomain:code:format:",  v15,  v17,  v16,  v59,  v60);
    goto LABEL_38;
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue([v7 specifiedFederation]);
  unsigned __int8 v20 = +[CSCertOperations moveToFederationAllowed:altDSID:]( &OBJC_CLASS___CSCertOperations,  "moveToFederationAllowed:altDSID:",  v19,  v9);

  if ((v20 & 1) == 0)
  {
    uint64_t v54 = CloudServicesLog(v21);
    v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
      sub_100047744(v7, v55);
    }

    if (a5)
    {
      uint64_t v56 = kEscrowServiceErrorDomain;
      v57 = (void *)objc_claimAutoreleasedReturnValue([v7 specifiedFederation]);
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[CloudServicesError errorWithDomain:code:format:]( &OBJC_CLASS___CloudServicesError,  "errorWithDomain:code:format:",  v56,  117LL,  @"Terms not accepted for federation %@",  v57));
    }

    goto LABEL_43;
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue([v7 specifiedFederation]);
  v65 = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v65, 1LL));
  -[EscrowGenericRequest setBaseRootCertVersions:](v8, "setBaseRootCertVersions:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue([v7 specifiedFederation]);
  v64 = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v64, 1LL));
  -[EscrowGenericRequest setTrustedRootCertVersions:](v8, "setTrustedRootCertVersions:", v25);

LABEL_22:
  uint64_t v37 = CloudServicesLog(v26);
  v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest recordLabel](v8, "recordLabel"));
    *(_DWORD *)buf = 138412290;
    v63 = v39;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Requesting cert for label: %@", buf, 0xCu);
  }

  uint64_t v41 = CloudServicesLog(v40);
  v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest baseRootCertVersions](v8, "baseRootCertVersions"));
    *(_DWORD *)buf = 138412290;
    v63 = v43;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Platform trust versions: %@", buf, 0xCu);
  }

  uint64_t v45 = CloudServicesLog(v44);
  v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest trustedRootCertVersions](v8, "trustedRootCertVersions"));
    *(_DWORD *)buf = 138412290;
    v63 = v47;
    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Requesting cert for versions: %@", buf, 0xCu);
  }

  v48 = v8;
LABEL_44:

  return v48;
}

- (void)_fetchCertificatesWithRequest:(id)a3 duplicate:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v16 = 0LL;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[EscrowService certificateRequest:duplicate:error:]( &OBJC_CLASS___EscrowService,  "certificateRequest:duplicate:error:",  a3,  v5,  &v16));
  id v9 = v16;
  uint64_t v10 = v9;
  if (v8)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000352A8;
    v13[3] = &unk_100069B08;
    id v15 = v7;
    id v14 = v8;
    [v14 performRequestWithHandler:v13];
  }

  else
  {
    uint64_t v11 = CloudServicesLog(v9);
    BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Bailing on fetch certificates due to no cert request: %@",  buf,  0xCu);
    }

    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v10);
  }
}

- (void)fetchCertificatesWithRequest:(id)a3 completionBlock:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100035570;
  v7[3] = &unk_100069B30;
  id v8 = a4;
  id v6 = v8;
  -[EscrowService fetchCertificatesAndDuplicateRequest:completionBlock:]( self,  "fetchCertificatesAndDuplicateRequest:completionBlock:",  a3,  v7);
}

- (void)fetchCertificatesAndDuplicateRequest:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v39[0] = 0LL;
  v39[1] = v39;
  v39[2] = 0x3032000000LL;
  v39[3] = sub_10003587C;
  v39[4] = sub_10003588C;
  id v40 = 0LL;
  v37[0] = 0LL;
  v37[1] = v37;
  v37[2] = 0x3032000000LL;
  v37[3] = sub_10003587C;
  v37[4] = sub_10003588C;
  id v38 = 0LL;
  v35[0] = 0LL;
  v35[1] = v35;
  v35[2] = 0x3032000000LL;
  v35[3] = sub_10003587C;
  v35[4] = sub_10003588C;
  id v36 = 0LL;
  v33[0] = 0LL;
  v33[1] = v33;
  v33[2] = 0x3032000000LL;
  v33[3] = sub_10003587C;
  v33[4] = sub_10003588C;
  id v34 = 0LL;
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472LL;
  activity_block[2] = sub_100035894;
  activity_block[3] = &unk_100069B80;
  id v8 = dispatch_group_create();
  uint64_t v28 = v8;
  uint64_t v29 = self;
  id v9 = v6;
  id v30 = v9;
  v31 = v39;
  id v32 = v37;
  _os_activity_initiate((void *)&_mh_execute_header, "fetchCertificates", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  if ([v9 requiresDoubleEnrollment])
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1000359B0;
    v21[3] = &unk_100069B80;
    v22 = v8;
    v23 = self;
    id v24 = v9;
    v25 = v35;
    uint64_t v26 = v33;
    _os_activity_initiate((void *)&_mh_execute_header, "fetchCertificates (duplicate)", OS_ACTIVITY_FLAG_DEFAULT, v21);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 queue]);

  if (!v10)
  {
    uint64_t v13 = _os_assert_log(0LL);
    uint64_t v14 = _os_crash(v13);
    sub_1000478D0(v14);
  }

  uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v9 queue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100035AFC;
  block[3] = &unk_100069BA8;
  v18 = v37;
  v19 = v35;
  unsigned __int8 v20 = v33;
  id v16 = v7;
  uint64_t v17 = v39;
  id v12 = v7;
  dispatch_group_notify(v8, v11, block);

  _Block_object_dispose(v33, 8);
  _Block_object_dispose(v35, 8);

  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v39, 8);
}

- (id)keychainBaseQueryWithEnvironment:(id)a3 andBaseURL:(id)a4
{
  v9[0] = kSecClass;
  v9[1] = kSecAttrAccount;
  v10[0] = kSecClassInternetPassword;
  v10[1] = @"EscrowServiceCertificateStore";
  v9[2] = kSecAttrPath;
  v9[3] = kSecAttrServer;
  v10[2] = a3;
  v10[3] = a4;
  v9[4] = kSecAttrAccessible;
  v9[5] = kSecUseDataProtectionKeychain;
  v10[4] = kSecAttrAccessibleAfterFirstUnlock;
  v10[5] = &__kCFBooleanTrue;
  v9[6] = kSecAttrSynchronizable;
  v10[6] = &__kCFBooleanFalse;
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  7LL));

  return v7;
}

- (BOOL)cacheStoredCertificate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 iCloudEnvironment]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 escrowBaseURL]);
  id v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( -[EscrowService keychainBaseQueryWithEnvironment:andBaseURL:]( self,  "keychainBaseQueryWithEnvironment:andBaseURL:",  v7,  v8));

  uint64_t v10 = SecItemDelete(v9);
  if ((_DWORD)v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = CloudServicesLog(v10);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100047938(v11, v13, v14, v15, v16, v17, v18, v19);
    }
  }

  id v20 = -[__CFDictionary mutableCopy](v9, "mutableCopy");
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v6 data]);
  [v20 setObject:v21 forKeyedSubscript:kSecValueData];

  uint64_t v22 = SecItemAdd((CFDictionaryRef)v20, 0LL);
  uint64_t v23 = v22;
  if ((_DWORD)v22)
  {
    uint64_t v24 = CloudServicesLog(v22);
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_1000478D4(v23, v25, v26, v27, v28, v29, v30, v31);
    }

    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  (int)v23,  0LL));
    }
  }

  return (_DWORD)v23 == 0;
}

- (id)fetchCachedCertificateWithRequest:(id)a3 error:(id *)a4
{
  id v63 = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[EscrowService certificateRequest:duplicate:error:]( &OBJC_CLASS___EscrowService,  "certificateRequest:duplicate:error:",  a3,  0LL,  &v63));
  id v7 = v63;
  id v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0LL;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 iCloudEnv]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 baseURL]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[EscrowService keychainBaseQueryWithEnvironment:andBaseURL:]( self,  "keychainBaseQueryWithEnvironment:andBaseURL:",  v13,  v14));
    id v16 = [v15 mutableCopy];

    [v16 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecReturnAttributes];
    [v16 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecReturnData];
    [v16 setObject:kSecMatchLimitOne forKeyedSubscript:kSecMatchLimit];
    *(void *)buf = 0LL;
    uint64_t v17 = SecItemCopyMatching((CFDictionaryRef)v16, (CFTypeRef *)buf);
    if ((_DWORD)v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = CloudServicesLog(v17);
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_100047A4C(v18, v20, v21, v22, v23, v24, v25, v26);
      }

      if (!a4)
      {
        uint64_t v12 = 0LL;
LABEL_43:

        goto LABEL_44;
      }

      uint64_t v27 = (int)v18;
      NSErrorUserInfoKey v72 = NSLocalizedDescriptionKey;
      v73 = @"Unable to find certificate in keychain";
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v73,  &v72,  1LL));
      uint64_t v12 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v27,  v28));
LABEL_42:

      goto LABEL_43;
    }

    uint64_t v28 = *(void **)buf;
    uint64_t v29 = objc_alloc(&OBJC_CLASS___StoredCertificate);
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKeyedSubscript:kSecValueData]);
    uint64_t v31 = -[StoredCertificate initWithData:](v29, "initWithData:", v30);

    if (v31)
    {
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[StoredCertificate dsid](v31, "dsid"));
      id v34 = (void *)objc_claimAutoreleasedReturnValue([v6 dsid]);
      unsigned __int8 v35 = [v33 isEqualToString:v34];

      if ((v35 & 1) != 0)
      {
        uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[StoredCertificate iCloudEnvironment](v31, "iCloudEnvironment"));
        id v38 = (void *)objc_claimAutoreleasedReturnValue([v6 iCloudEnv]);
        unsigned __int8 v39 = [v37 isEqualToString:v38];

        if ((v39 & 1) != 0)
        {
          uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(-[StoredCertificate escrowBaseURL](v31, "escrowBaseURL"));
          v42 = (void *)objc_claimAutoreleasedReturnValue([v6 baseURL]);
          unsigned __int8 v43 = [v41 isEqualToString:v42];

          uint64_t v45 = CloudServicesLog(v44);
          v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
          v47 = v46;
          if ((v43 & 1) != 0)
          {
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v62 = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "Found a valid stored certificate in the keychain",  (uint8_t *)&v62,  2u);
            }

            uint64_t v12 = v31;
            goto LABEL_41;
          }

          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
            sub_1000479C8();
          }

          if (!a4)
          {
LABEL_40:
            uint64_t v12 = 0LL;
LABEL_41:

            goto LABEL_42;
          }

          uint64_t v60 = kEscrowServiceErrorDomain;
          NSErrorUserInfoKey v64 = NSLocalizedDescriptionKey;
          v65 = @"Cached certificate for wrong escrow URL";
          v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v65,  &v64,  1LL));
          uint64_t v52 = v60;
          uint64_t v53 = 123LL;
        }

        else
        {
          uint64_t v57 = CloudServicesLog(v40);
          v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
          if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
            sub_1000479F4();
          }

          if (!a4) {
            goto LABEL_40;
          }
          uint64_t v59 = kEscrowServiceErrorDomain;
          NSErrorUserInfoKey v66 = NSLocalizedDescriptionKey;
          v67 = @"Cached certificate for wrong iCloud Environment";
          v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v67,  &v66,  1LL));
          uint64_t v52 = v59;
          uint64_t v53 = 122LL;
        }
      }

      else
      {
        uint64_t v54 = CloudServicesLog(v36);
        v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
          sub_100047A20();
        }

        if (!a4) {
          goto LABEL_40;
        }
        uint64_t v56 = kEscrowServiceErrorDomain;
        NSErrorUserInfoKey v68 = NSLocalizedDescriptionKey;
        v69 = @"Cached certificate for wrong DSID";
        v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v69,  &v68,  1LL));
        uint64_t v52 = v56;
        uint64_t v53 = 121LL;
      }
    }

    else
    {
      uint64_t v48 = CloudServicesLog(v32);
      uint64_t v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
        sub_10004799C();
      }

      if (!a4) {
        goto LABEL_40;
      }
      uint64_t v50 = kEscrowServiceErrorDomain;
      NSErrorUserInfoKey v70 = NSLocalizedDescriptionKey;
      v71 = @"Unable to deserialize certificate from keychain";
      v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v71,  &v70,  1LL));
      uint64_t v52 = v50;
      uint64_t v53 = 120LL;
    }

    *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v52,  v53,  v51));

    goto LABEL_40;
  }

  uint64_t v10 = CloudServicesLog(v7);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Bailing on fetch certificates from keychain due to no cert request: %@",  buf,  0xCu);
  }

  uint64_t v12 = 0LL;
  if (a4) {
    *a4 = v8;
  }
LABEL_44:

  return v12;
}

- (void)storeRecordWithRequest:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[SBEscrowOperationStartEvent initWithRequest:type:]( objc_alloc(&OBJC_CLASS___SBEscrowOperationStartEvent),  "initWithRequest:type:",  v6,  200LL);
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowService operationsLogger](self, "operationsLogger"));
  [v9 updateStoreWithEvent:v8];

  id v10 = objc_retainBlock(v7);
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472LL;
  v47[2] = sub_100036870;
  v47[3] = &unk_100069300;
  v47[4] = self;
  uint64_t v48 = v8;
  id v49 = v10;
  id v11 = v10;
  uint64_t v12 = v8;
  uint64_t v13 = objc_retainBlock(v47);

  v45[0] = 0LL;
  v45[1] = v45;
  v45[2] = 0x3032000000LL;
  v45[3] = sub_10003587C;
  v45[4] = sub_10003588C;
  id v46 = 0LL;
  v43[0] = 0LL;
  v43[1] = v43;
  v43[2] = 0x3032000000LL;
  v43[3] = sub_10003587C;
  v43[4] = sub_10003588C;
  id v44 = 0LL;
  v41[0] = 0LL;
  v41[1] = v41;
  v41[2] = 0x3032000000LL;
  v41[3] = sub_10003587C;
  v41[4] = sub_10003588C;
  id v42 = 0LL;
  v39[0] = 0LL;
  v39[1] = v39;
  v39[2] = 0x3032000000LL;
  v39[3] = sub_10003587C;
  v39[4] = sub_10003588C;
  id v40 = 0LL;
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472LL;
  activity_block[2] = sub_10003690C;
  activity_block[3] = &unk_100069B80;
  uint64_t v14 = dispatch_group_create();
  id v34 = v14;
  unsigned __int8 v35 = self;
  id v15 = v6;
  id v36 = v15;
  uint64_t v37 = v45;
  id v38 = v43;
  _os_activity_initiate((void *)&_mh_execute_header, "storeRecordWithRequest", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  if ([v15 requiresDoubleEnrollment])
  {
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_100036A28;
    v27[3] = &unk_100069B80;
    uint64_t v28 = v14;
    uint64_t v29 = self;
    id v30 = v15;
    uint64_t v31 = v41;
    uint64_t v32 = v39;
    _os_activity_initiate( (void *)&_mh_execute_header,  "storeRecordWithRequest (double enrollment)",  OS_ACTIVITY_FLAG_DEFAULT,  v27);
  }

  id v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v15 queue]);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100036B74;
  v19[3] = &unk_100069BF8;
  id v20 = v15;
  uint64_t v21 = self;
  id v22 = v13;
  uint64_t v23 = v41;
  uint64_t v24 = v39;
  uint64_t v25 = v45;
  uint64_t v26 = v43;
  uint64_t v17 = v13;
  id v18 = v15;
  dispatch_group_notify(v14, v16, v19);

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v41, 8);

  _Block_object_dispose(v43, 8);
  _Block_object_dispose(v45, 8);
}

- (void)_storeRecordWithRequest:(id)a3 duplicate:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v20 = 0LL;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[EscrowService certificateRequest:duplicate:error:]( &OBJC_CLASS___EscrowService,  "certificateRequest:duplicate:error:",  v8,  v6,  &v20));
  id v11 = v20;
  uint64_t v12 = v11;
  if (v10)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100036EB0;
    v15[3] = &unk_100069C20;
    id v18 = v9;
    id v16 = v8;
    uint64_t v17 = self;
    BOOL v19 = v6;
    [v10 performRequestWithHandler:v15];
  }

  else
  {
    uint64_t v13 = CloudServicesLog(v11);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Bailing record store due to no cert request: %@",  buf,  0xCu);
    }

    (*((void (**)(id, void, void *))v9 + 2))(v9, 0LL, v12);
  }
}

- (BOOL)_invalidateEscrowCache:(id)a3 error:(id *)a4
{
  id v5 = objc_alloc_init(&OBJC_CLASS___OTConfigurationContext);
  id v6 = sub_1000105E4();
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v5 setAltDSID:v7];

  [v5 setContext:OTDefaultContext];
  id v15 = 0LL;
  unsigned int v8 = +[OTClique invalidateEscrowCache:error:]( &OBJC_CLASS___OTClique,  "invalidateEscrowCache:error:",  v5,  &v15);
  id v9 = v15;
  uint64_t v10 = CloudServicesLog(v9);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v8) {
    BOOL v13 = v9 == 0LL;
  }
  else {
    BOOL v13 = 0;
  }
  if (v13)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Successfully invalidated escrow cache",  buf,  2u);
    }
  }

  else
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Failed to invalidate escrow cache error: %@",  buf,  0xCu);
    }

    if (a4) {
      *a4 = v9;
    }
  }

  return v8;
}

- (void)storeRecordWithCertDataRequest:(id)a3 duplicate:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 certData]);
  if (v10)
  {
    if (v6) {
      uint64_t v11 = objc_claimAutoreleasedReturnValue([v8 duplicateEncodedMetadata]);
    }
    else {
      uint64_t v11 = objc_claimAutoreleasedReturnValue([v8 encodedMetadata]);
    }
    id v15 = (void *)v11;
    uint64_t v16 = CloudServicesLog(v11);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v18)
      {
        BOOL v19 = &stru_10006AB28;
        if (v6) {
          BOOL v19 = @" (duplicate)";
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v52 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Creating an escrow update operation%@",  buf,  0xCu);
      }

      id v20 = &off_100068228;
    }

    else
    {
      if (v18)
      {
        uint64_t v21 = &stru_10006AB28;
        if (v6) {
          uint64_t v21 = @" (duplicate)";
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v52 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Creating an escrow enrollment operation%@",  buf,  0xCu);
      }

      id v20 = off_100068220;
    }

    id v22 = [objc_alloc(*v20) initWithRequest:v8];
    [v22 setDuplicate:v6];
    uint64_t v23 = objc_claimAutoreleasedReturnValue([v22 validateInput]);
    BOOL v12 = (__CFString *)v23;
    if (!v22 || v23)
    {
      uint64_t v35 = CloudServicesLog(v23);
      id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v52 = v12;
        id v36 = "Error creating or validating escrow request: %@";
LABEL_30:
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, v36, buf, 0xCu);
      }
    }

    else
    {
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v8 prerecord]);

      uint64_t v26 = CloudServicesLog(v25);
      uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
      if (v24)
      {
        if (v28)
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "EscrowService: Using provided prerecord",  buf,  2u);
        }

        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v8 prerecord]);
        id v50 = 0LL;
        unsigned int v30 = -[EscrowService processPrerecord:outerRequest:escrowRequest:error:]( self,  "processPrerecord:outerRequest:escrowRequest:error:",  v29,  v8,  v22,  &v50);
        BOOL v12 = (__CFString *)v50;

        if (!v30 || (uint64_t v32 = 0LL, v12))
        {
          uint64_t v33 = CloudServicesLog(v31);
          id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
            sub_100047C40();
          }
          goto LABEL_31;
        }

- (BOOL)processPrerecord:(id)a3 outerRequest:(id)a4 escrowRequest:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v8 dsid]);
  if (!v10
    || (uint64_t v11 = (void *)v10,
        BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v8 dsid]),
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v9 dsid]),
        unsigned __int8 v14 = [v12 isEqualToString:v13],
        v13,
        v12,
        v11,
        (v14 & 1) == 0))
  {
    uint64_t v24 = CloudServicesLog(v10);
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_100047CA0();
    }

    if (a6)
    {
      BOOL v26 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue( +[CloudServicesError errorWithDomain:code:format:]( &OBJC_CLASS___CloudServicesError,  "errorWithDomain:code:format:",  kEscrowServiceErrorDomain,  104LL,  @"DSID missing or mismatched"));
      goto LABEL_21;
    }

+ (id)doubleEnrollmentRecordFromPrimaryRecord:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"DoubleEnrollmentVersion"]);
  unsigned int v6 = [v5 intValue];

  if (v6 == 1)
  {
    v34[0] = 0xAAAAAAAAAAAAAAAALL;
    v34[1] = 0xAAAAAAAAAAAAAAAALL;
    BOOL v26 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"DoubleEnrollmentPassword"]);
    uint64_t v25 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v26);
    -[NSUUID getUUIDBytes:](v25, "getUUIDBytes:", v34);
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    id v27 = v3;
    id v7 = v3;
    id v8 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v30;
      uint64_t v11 = &ACAccountTypeIdentifierAppleAccount_ptr;
      id v28 = v7;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v30 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void *)(*((void *)&v29 + 1) + 8LL * (void)i);
          unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v13]);
          uint64_t v16 = objc_opt_class(v11[72], v15);
          if ((objc_opt_isKindOfClass(v14, v16) & 1) != 0)
          {
            id v17 = v9;
            uint64_t v18 = v4;
            BOOL v19 = v11;
            unint64_t v20 = (unint64_t)[v14 length];
            unsigned __int8 v21 = -[NSMutableData initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableData), "initWithCapacity:", v20);
            if (v20 >= 0x10)
            {
              unint64_t v22 = v20 >> 4;
              do
              {
                -[NSMutableData appendBytes:length:](v21, "appendBytes:length:", v34, 16LL);
                --v22;
              }

              while (v22);
            }

            -[NSMutableData appendBytes:length:](v21, "appendBytes:length:", v34, v20 & 0xF);
            uint64_t v4 = v18;
            -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v21, v13);

            uint64_t v11 = v19;
            id v9 = v17;
            id v7 = v28;
          }

          else
          {
            -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v14, v13);
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }

      while (v9);
    }

    id v3 = v27;
  }

  else
  {
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"DoubleEnrollmentPassword"]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v23,  @"DoubleEnrollmentPassword");
  }

  return v4;
}

+ (id)createEscrowBlobWithCertificate:(id)a3 escrowRequest:(id)a4 error:(id *)a5
{
  id v7 = a4;
  CFTypeRef cf = 0LL;
  id v8 = a3;
  id v9 = [v7 stingray];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 altDSID]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 iCloudEnv]);
  LOWORD(v23) = [v7 duplicate];
  unsigned __int8 v12 = +[CSCertOperations verifyCertData:withCert:withPubKey:stingray:enroll:altDSID:env:duplicate:sigVerification:error:]( &OBJC_CLASS___CSCertOperations,  "verifyCertData:withCert:withPubKey:stingray:enroll:altDSID:env:duplicate:sigVerification:error:",  v8,  0LL,  &cf,  v9,  1LL,  v10,  v11,  v23,  a5);

  if ((v12 & 1) != 0)
  {
    uint64_t v13 = (__CFString *)[[CSSESWrapper alloc] initWithRequest:v7 validate:0 reqVersion:0];
    id v14 = (id)objc_claimAutoreleasedReturnValue( -[__CFString encodedEscrowRecordWithPublicKey:error:]( v13,  "encodedEscrowRecordWithPublicKey:error:",  cf,  a5));
    id v15 = (id)cf;
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0LL;
    }

    if (v14)
    {
      id v14 = v14;
      uint64_t v16 = v14;
    }

    else
    {
      if (a5 && !*a5)
      {
        id v15 = (id)objc_claimAutoreleasedReturnValue( +[CloudServicesError errorWithDomain:code:format:]( &OBJC_CLASS___CloudServicesError,  "errorWithDomain:code:format:",  kEscrowServiceErrorDomain,  124LL,  @"Unknown error encoding record"));
        *a5 = v15;
      }

      uint64_t v19 = CloudServicesLog(v15);
      unint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        if (a5) {
          unsigned __int8 v21 = (const __CFString *)*a5;
        }
        else {
          unsigned __int8 v21 = @"no error pointer";
        }
        *(_DWORD *)buf = 138412290;
        BOOL v26 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Failed to create escrow blob: %@",  buf,  0xCu);
      }

      uint64_t v16 = 0LL;
    }
  }

  else
  {
    id v17 = (__CFString *)objc_claimAutoreleasedReturnValue( +[CloudServicesError errorWithDomain:code:format:]( &OBJC_CLASS___CloudServicesError,  "errorWithDomain:code:format:",  kEscrowServiceErrorDomain,  96LL,  @"Unexpected error with certificate"));
    uint64_t v13 = v17;
    if (a5)
    {
      id v17 = v17;
      *a5 = v17;
    }

    uint64_t v18 = CloudServicesLog(v17);
    id v14 = (id)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      BOOL v26 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v14,  OS_LOG_TYPE_DEFAULT,  "Error extracting public key from cert: %@",  buf,  0xCu);
    }

    uint64_t v16 = 0LL;
  }

  return v16;
}

+ (BOOL)isFatalError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  unsigned int v5 = [v4 isEqualToString:kEscrowServiceErrorDomain];

  if (!v5) {
    goto LABEL_11;
  }
  uint64_t v6 = (uint64_t)[v3 code];
  BOOL v7 = 1;
  if (v6 > -1003)
  {
    if (v6 == -1002) {
      goto LABEL_12;
    }
    if (v6 == 99)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:NSUnderlyingErrorKey]);

      if (v9) {
        BOOL v7 = [v9 code] == (id)128;
      }
      else {
        BOOL v7 = 0;
      }

      goto LABEL_12;
    }

- (void)_recoverWithVersion:(int)a3 req:(id)a4 duplicate:(BOOL)a5 sesWrapper:(id)a6 srpInitResponse:(id)a7 reply:(id)a8
{
  BOOL v11 = a5;
  uint64_t v12 = *(void *)&a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a8;
  id v17 = a7;
  uint64_t v18 = CloudServicesLog(v17);
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v34) = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "performing recovery request version %d",  buf,  8u);
  }

  [v15 setReqVersion:v12];
  unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v17 srpData]);

  id v32 = 0LL;
  unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue([v15 srpRecoveryBlobFromData:v20 error:&v32]);
  id v22 = v32;

  if (v22 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v34 = v22;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "srpError: %@",  buf,  0xCu);
  }

  if (v21)
  {
    uint64_t v23 = -[EscrowGenericRequest initWithRequest:]( objc_alloc(&OBJC_CLASS___EscrowRecoveryRequest),  "initWithRequest:",  v14);
    -[EscrowGenericRequest setDuplicate:](v23, "setDuplicate:", v11);
    -[EscrowGenericRequest setBlob:](v23, "setBlob:", v21);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_1000387EC;
    v26[3] = &unk_100069C70;
    v26[4] = self;
    id v27 = v23;
    id v30 = v16;
    id v28 = v15;
    id v29 = v14;
    BOOL v31 = v11;
    uint64_t v24 = v23;
    -[NSMutableDictionary performRequestWithHandler:](v24, "performRequestWithHandler:", v26);
  }

  else
  {
    uint64_t v24 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v24,  "setObject:forKeyedSubscript:",  @"Error authenticating",  NSLocalizedDescriptionKey);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v22, NSUnderlyingErrorKey);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kEscrowServiceErrorDomain,  99LL,  v24));
    (*((void (**)(id, void, void *))v16 + 2))(v16, 0LL, v25);
  }
}

- (void)_srpInitHelper:(id)a3 duplicate:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = a3;
  id v9 = -[EscrowGenericRequest initWithRequest:](objc_alloc(&OBJC_CLASS___EscrowSRPRequest), "initWithRequest:", v8);

  id v10 = [[CSSESWrapper alloc] initWithRequest:v9 reqVersion:0];
  -[EscrowGenericRequest setDuplicate:](v9, "setDuplicate:", v5);
  id v11 = [v10 validatePassphrasePresentOrPending];
  if ((v11 & 1) != 0)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 srpInitBlob]);
    -[EscrowGenericRequest setBlob:](v9, "setBlob:", v12);

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100038D80;
    v18[3] = &unk_100069C98;
    id v20 = v7;
    id v19 = v10;
    -[EscrowSRPRequest performRequestWithHandler:](v9, "performRequestWithHandler:", v18);

    uint64_t v13 = v20;
  }

  else
  {
    uint64_t v14 = CloudServicesLog(v11);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100047E10();
    }

    uint64_t v16 = kEscrowServiceErrorDomain;
    NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
    id v22 = @"No passphrase provided";
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v16,  128LL,  v13));
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0LL, 0LL, v17);
  }
}

- (void)setPasswordMetadataWithRequest:(id)a3 response:(id)a4 ses:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([a3 guitarfish])
  {
    uint64_t v9 = _os_feature_enabled_impl("CloudServices", "GuitarfishDemo");
    if ((_DWORD)v9)
    {
      uint64_t v10 = CloudServicesLog(v9);
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 responseDictionary]);
        int v25 = 138412546;
        id v26 = v7;
        __int16 v27 = 2112;
        id v28 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "DEMO: parsing srp init: %@, %@",  (uint8_t *)&v25,  0x16u);
      }
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 appleIDPasswordMetadata]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 proto]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 salt]);
    id v16 = [v13 iterations];
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v7 proto]);

    if (v17)
    {
      uint64_t v18 = objc_claimAutoreleasedReturnValue([v7 proto]);

      uint64_t v14 = (void *)v18;
    }

    id v19 = (void *)objc_claimAutoreleasedReturnValue([v7 iterations]);

    if (v19)
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v7 iterations]);
      id v16 = [v20 integerValue];
    }

    uint64_t v21 = _os_feature_enabled_impl("CloudServices", "GuitarfishDemo");
    if ((_DWORD)v21)
    {
      uint64_t v22 = CloudServicesLog(v21);
      uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        int v25 = 138412802;
        id v26 = v14;
        __int16 v27 = 2112;
        id v28 = v15;
        __int16 v29 = 1024;
        int v30 = (int)v16;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "DEMO: proto %@, salt %@, iterations %d",  (uint8_t *)&v25,  0x1Cu);
      }
    }

    uint64_t v24 = -[AppleIDPasswordMetadata initWithProto:salt:iterations:]( objc_alloc(&OBJC_CLASS___AppleIDPasswordMetadata),  "initWithProto:salt:iterations:",  v14,  v15,  v16);
    [v8 setAppleIDPasswordMetadata:v24];
  }
}

- (void)_recoverActualRecordWithRequest:(id)a3 duplicate:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v6 = a4;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000391E8;
  v10[3] = &unk_100069CC0;
  id v11 = a3;
  id v12 = a5;
  v10[4] = self;
  BOOL v13 = v6;
  id v8 = v11;
  id v9 = v12;
  -[EscrowService _srpInitHelper:duplicate:completionBlock:]( self,  "_srpInitHelper:duplicate:completionBlock:",  v8,  v6,  v10);
}

- (void)recoverRecordWithRequest:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[SBEscrowOperationStartEvent initWithRequest:type:]( objc_alloc(&OBJC_CLASS___SBEscrowOperationStartEvent),  "initWithRequest:type:",  v6,  201LL);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowService operationsLogger](self, "operationsLogger"));
  [v9 updateStoreWithEvent:v8];

  id v10 = objc_retainBlock(v7);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100039C74;
  v25[3] = &unk_100069300;
  v25[4] = self;
  id v26 = v8;
  id v27 = v10;
  id v11 = v10;
  id v12 = v8;
  BOOL v13 = objc_retainBlock(v25);

  uint64_t v15 = CloudServicesLog(v14);
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "dispatching to recover queue", buf, 2u);
  }

  id v17 = sub_100039D10();
  uint64_t v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v17);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100039D50;
  block[3] = &unk_100069D10;
  void block[4] = self;
  id v22 = v6;
  id v23 = v13;
  id v19 = v13;
  id v20 = v6;
  dispatch_async(v18, block);
}

- (void)_performPostEnrollSilentRecoveryWithRequest:(id)a3
{
  id v4 = a3;
  BOOL v5 = -[SecureBackup initWithUserActivityLabel:]( objc_alloc(&OBJC_CLASS___SecureBackup),  "initWithUserActivityLabel:",  @"silent recovery after enroll");
  -[SecureBackup setIcdp:](v5, "setIcdp:", [v4 icdp]);
  -[SecureBackup setStingray:](v5, "setStingray:", [v4 stingray]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 appleID]);
  -[SecureBackup setAppleID:](v5, "setAppleID:", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 iCloudPassword]);
  -[SecureBackup setICloudPassword:](v5, "setICloudPassword:", v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 passphrase]);
  -[SecureBackup setPassphrase:](v5, "setPassphrase:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 recordID]);
  -[SecureBackup setRecordID:](v5, "setRecordID:", v9);

  -[SecureBackup setSilentDoubleRecovery:](v5, "setSilentDoubleRecovery:", 1LL);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 queue]);
  -[SecureBackup setQueue:](v5, "setQueue:", v10);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 dsid]);
  -[SecureBackup setDsid:](v5, "setDsid:", v11);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 authToken]);
  -[SecureBackup setAuthToken:](v5, "setAuthToken:", v12);

  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v4 escrowProxyURL]);
  -[SecureBackup setEscrowProxyURL:](v5, "setEscrowProxyURL:", v13);

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 iCloudEnv]);
  -[SecureBackup setICloudEnv:](v5, "setICloudEnv:", v14);

  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472LL;
  activity_block[2] = sub_10003A1DC;
  activity_block[3] = &unk_100069D78;
  activity_void block[4] = self;
  id v17 = v5;
  uint64_t v15 = v5;
  _os_activity_initiate((void *)&_mh_execute_header, "silent recovery", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)_performDoubleRecoveryICDPWithRequest:(id)a3 primaryResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:kEscrowServiceRecordDataKey]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"DoubleEnrollmentPassword"]);

  uint64_t v11 = CloudServicesLog(v10);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "attempting double enrollment recovery",  buf,  2u);
    }

    uint64_t v14 = CloudServicesLog([v6 setPassphrase:v9]);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "dispatching to recover queue (double recovery)",  buf,  2u);
    }

    id v16 = sub_100039D10();
    id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v16);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10003A450;
    block[3] = &unk_100068ED8;
    void block[4] = self;
    id v19 = v6;
    id v20 = v7;
    dispatch_async(v17, block);
  }

  else
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "recovered record does not contain a double-enrollment password; skipping double enrollment recovery",
        buf,
        2u);
    }
  }
}

- (void)_performDoubleRecoveryStingrayWithRequest:(id)a3 primaryResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = CloudServicesLog(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "dispatching to recover queue (PCS double recovery)",  buf,  2u);
  }

  id v10 = sub_100039D10();
  uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v10);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003ABAC;
  block[3] = &unk_100068ED8;
  void block[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v12 = v7;
  id v13 = v6;
  dispatch_async(v11, block);
}

- (void)deleteRecordWithRequest:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = -[SBEscrowOperationStartEvent initWithRequest:type:]( objc_alloc(&OBJC_CLASS___SBEscrowOperationStartEvent),  "initWithRequest:type:",  v6,  203LL);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowService operationsLogger](self, "operationsLogger"));
  [v9 updateStoreWithEvent:v8];

  id v10 = objc_retainBlock(v7);
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  v44[2] = sub_10003B5DC;
  v44[3] = &unk_100069300;
  v44[4] = self;
  uint64_t v45 = v8;
  id v46 = v10;
  id v11 = v10;
  id v12 = v8;
  id v13 = objc_retainBlock(v44);

  dispatch_group_t v14 = dispatch_group_create();
  v42[0] = 0LL;
  v42[1] = v42;
  v42[2] = 0x3032000000LL;
  v42[3] = sub_10003587C;
  v42[4] = sub_10003588C;
  id v43 = 0LL;
  v40[0] = 0LL;
  v40[1] = v40;
  v40[2] = 0x3032000000LL;
  v40[3] = sub_10003587C;
  v40[4] = sub_10003588C;
  id v41 = 0LL;
  v38[0] = 0LL;
  v38[1] = v38;
  v38[2] = 0x3032000000LL;
  v38[3] = sub_10003587C;
  v38[4] = sub_10003588C;
  id v39 = 0LL;
  v36[0] = 0LL;
  v36[1] = v36;
  v36[2] = 0x3032000000LL;
  v36[3] = sub_10003587C;
  v36[4] = sub_10003588C;
  id v37 = 0LL;
  if ([v6 deleteDoubleOnly]
    && ([v6 requiresDoubleEnrollment] & 1) == 0)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[CloudServicesError errorWithCode:error:format:]( &OBJC_CLASS___CloudServicesError,  "errorWithCode:error:format:",  22LL,  0LL,  @"DeleteDoubleOnly for invalid request type"));
    ((void (*)(void *, void, void *))v13[2])(v13, 0LL, v16);
  }

  else
  {
    if (([v6 deleteDoubleOnly] & 1) == 0)
    {
      activity_block[0] = _NSConcreteStackBlock;
      activity_block[1] = 3221225472LL;
      activity_block[2] = sub_10003B678;
      activity_block[3] = &unk_100069B80;
      BOOL v31 = v14;
      id v32 = self;
      id v33 = v6;
      id v34 = v42;
      uint64_t v35 = v40;
      _os_activity_initiate( (void *)&_mh_execute_header,  "deleteRecordWithRequest",  OS_ACTIVITY_FLAG_DEFAULT,  activity_block);
    }

    if ([v6 requiresDoubleEnrollment])
    {
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_10003B794;
      v24[3] = &unk_100069B80;
      int v25 = v14;
      id v26 = self;
      id v27 = v6;
      id v28 = v38;
      __int16 v29 = v36;
      _os_activity_initiate( (void *)&_mh_execute_header,  "deleteRecordWithRequest (double enrollment)",  OS_ACTIVITY_FLAG_DEFAULT,  v24);
    }

    id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 queue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10003B930;
    block[3] = &unk_100069E08;
    id v18 = v6;
    id v19 = v13;
    id v20 = v42;
    uint64_t v21 = v40;
    id v22 = v38;
    id v23 = v36;
    dispatch_group_notify(v14, v15, block);

    id v16 = v18;
  }

  _Block_object_dispose(v36, 8);
  _Block_object_dispose(v38, 8);

  _Block_object_dispose(v40, 8);
  _Block_object_dispose(v42, 8);
}

- (void)_deleteRecordWithRequest:(id)a3 duplicate:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = -[EscrowGenericRequest initWithRequest:](objc_alloc(&OBJC_CLASS___EscrowDeleteRequest), "initWithRequest:", v9);

  -[EscrowGenericRequest setDuplicate:](v10, "setDuplicate:", v5);
  uint64_t v11 = CloudServicesLog(-[EscrowService _removeBypassToken](self, "_removeBypassToken"));
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest recordID](v10, "recordID"));
    *(_DWORD *)buf = 138412290;
    id v20 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Attempting to delete a escrow record: %@",  buf,  0xCu);
  }

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10003BAF8;
  v16[3] = &unk_100069E30;
  id v17 = v10;
  id v18 = v8;
  v16[4] = self;
  dispatch_group_t v14 = v10;
  id v15 = v8;
  -[EscrowDeleteRequest performRequestWithHandler:](v14, "performRequestWithHandler:", v16);
}

- (void)updateRecordMetadataWithRequest:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = -[SBEscrowOperationStartEvent initWithRequest:type:]( objc_alloc(&OBJC_CLASS___SBEscrowOperationStartEvent),  "initWithRequest:type:",  v7,  202LL);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowService operationsLogger](self, "operationsLogger"));
  [v9 updateStoreWithEvent:v8];

  id v10 = objc_retainBlock(v6);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10003BE78;
  v22[3] = &unk_100069300;
  v22[4] = self;
  id v23 = v8;
  id v24 = v10;
  id v11 = v10;
  id v12 = v8;
  id v13 = objc_retainBlock(v22);

  dispatch_group_t v14 = -[EscrowGenericRequest initWithRequest:]( objc_alloc(&OBJC_CLASS___EscrowUpdateMetadataRequest),  "initWithRequest:",  v7);
  uint64_t v16 = CloudServicesLog(v15);
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericRequest recordID](v14, "recordID"));
    *(_DWORD *)buf = 138412290;
    id v26 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Attempting to update metadata for a escrow record: %@",  buf,  0xCu);
  }

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10003BF14;
  v20[3] = &unk_100069E58;
  id v21 = v13;
  id v19 = v13;
  -[EscrowUpdateMetadataRequest performRequestWithHandler:](v14, "performRequestWithHandler:", v20);
}

- (void)startSMSChallengeWithRequest:(id)a3 completionBlock:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = -[EscrowGenericRequest initWithRequest:]( objc_alloc(&OBJC_CLASS___EscrowSMSChallengeRequest),  "initWithRequest:",  v6);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10003C118;
  v9[3] = &unk_100069E80;
  id v10 = v5;
  id v8 = v5;
  -[LakituRequest performRequestWithHandler:](v7, "performRequestWithHandler:", v9);
}

- (void)changeSMSTargetWithRequest:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = -[EscrowGenericRequest initWithRequest:]( objc_alloc(&OBJC_CLASS___EscrowChangeSMSTargetRequest),  "initWithRequest:",  v7);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowService _getBypassToken](self, "_getBypassToken"));
  -[EscrowGenericRequest setBypassToken:](v8, "setBypassToken:", v9);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10003C3C0;
  v11[3] = &unk_100069EA8;
  id v12 = v6;
  id v10 = v6;
  -[LakituRequest performRequestWithHandler:](v8, "performRequestWithHandler:", v11);
}

- (void)listSMSTargetsWithRequest:(id)a3 completionBlock:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = -[EscrowGenericRequest initWithRequest:]( objc_alloc(&OBJC_CLASS___EscrowListSMSTargetsRequest),  "initWithRequest:",  v6);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10003C5E0;
  v9[3] = &unk_100069ED0;
  id v10 = v5;
  id v8 = v5;
  -[LakituRequest performRequestWithHandler:](v7, "performRequestWithHandler:", v9);
}

- (void)getCountrySMSCodesWithRequest:(id)a3 completionBlock:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = -[EscrowGenericRequest initWithRequest:]( objc_alloc(&OBJC_CLASS___EscrowGetCountrySMSCodesRequest),  "initWithRequest:",  v6);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10003C794;
  v9[3] = &unk_100069EF8;
  id v10 = v5;
  id v8 = v5;
  -[LakituRequest performRequestWithHandler:](v7, "performRequestWithHandler:", v9);
}

- (void)verifyCertificateWithRequest:(id)a3 completionBlock:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void, id))a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 iCloudEnv]);
  if (v7 || (v8 = sub_100010634(), (id v7 = (void *)objc_claimAutoreleasedReturnValue(v8)) != 0LL))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 certData]);
    if (![v9 length])
    {
      id v11 = (id)objc_claimAutoreleasedReturnValue( +[CloudServicesError errorWithCode:error:format:]( &OBJC_CLASS___CloudServicesError,  "errorWithCode:error:format:",  22LL,  0LL,  @"Missing certificate data"));
      uint64_t v12 = CloudServicesLog(v11);
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Missing certificate data", buf, 2u);
      }

      v6[2](v6, 0LL, v11);
      goto LABEL_22;
    }

    id v27 = 0LL;
    CFTypeRef cf = 0LL;
    LOWORD(v26) = 0;
    unsigned __int8 v10 = +[CSCertOperations verifyCertData:withCert:withPubKey:stingray:enroll:altDSID:env:duplicate:sigVerification:error:]( &OBJC_CLASS___CSCertOperations,  "verifyCertData:withCert:withPubKey:stingray:enroll:altDSID:env:duplicate:sigVerification:error:",  v9,  &cf,  0LL,  0LL,  0LL,  0LL,  v7,  v26,  &v27);
    id v11 = v27;
    if ((v10 & 1) != 0)
    {
      ((void (**)(id, void *, id))v6)[2](v6, &__NSDictionary0__struct, 0LL);
      if (cf) {
        CFRelease(cf);
      }
LABEL_22:

      goto LABEL_23;
    }

    dispatch_group_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[CSCertOperations certVersion:](&OBJC_CLASS___CSCertOperations, "certVersion:", cf));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[CSCertOperations rootCurrentVersionForRootType:altDSID:inEnvironment:]( &OBJC_CLASS___CSCertOperations,  "rootCurrentVersionForRootType:altDSID:inEnvironment:",  5LL,  0LL,  v7));
    uint64_t v16 = CloudServicesLog(v15);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v30 = v15;
      __int16 v31 = 2112;
      id v32 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Current Trust Version: %@; Current Cert Version: %@",
        buf,
        0x16u);
    }

    id v18 = [v14 unsignedLongLongValue];
    if (v18 <= [v15 unsignedLongLongValue])
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue( +[CloudServicesError errorWithDomain:code:format:]( &OBJC_CLASS___CloudServicesError,  "errorWithDomain:code:format:",  kEscrowServiceErrorDomain,  127LL,  @"Cert does not match our trust policy"));
      uint64_t v25 = CloudServicesLog(v19);
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v11;
        id v22 = "Cert does not match our trust policy: %@";
        id v23 = v21;
        uint32_t v24 = 12;
        goto LABEL_18;
      }
    }

    else
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue( +[CloudServicesError errorWithDomain:code:format:]( &OBJC_CLASS___CloudServicesError,  "errorWithDomain:code:format:",  kEscrowServiceErrorDomain,  100LL,  @"Cert is newer than trust policy"));
      uint64_t v20 = CloudServicesLog(v19);
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v22 = "Cert is newer than trust policy";
        id v23 = v21;
        uint32_t v24 = 2;
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
      }
    }

    v6[2](v6, 0LL, v19);
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0LL;
    }

    goto LABEL_22;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[CloudServicesError errorWithCode:error:format:]( &OBJC_CLASS___CloudServicesError,  "errorWithCode:error:format:",  22LL,  0LL,  @"Can't get iCloud environment"));
  v6[2](v6, 0LL, v7);
LABEL_23:
}

- (void)logRecoveryResults:(id)a3 completionBlock:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = -[EscrowGenericRequest initWithRequest:]( objc_alloc(&OBJC_CLASS___EscrowLogRecoveryRequest),  "initWithRequest:",  v6);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10003CCF8;
  v9[3] = &unk_100069F20;
  id v10 = v5;
  id v8 = v5;
  -[LakituRequest performRequestWithHandler:](v7, "performRequestWithHandler:", v9);
}

- (SBEscrowOperationLogger)operationsLogger
{
  return self->_operationsLogger;
}

- (void).cxx_destruct
{
}

@end