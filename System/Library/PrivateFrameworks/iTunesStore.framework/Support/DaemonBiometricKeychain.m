@interface DaemonBiometricKeychain
+ (id)sharedInstance;
+ (void)_handleMessage:(id)a3 connection:(id)a4 withReplyBlock:(id)a5;
+ (void)createAttestationDataWithMessage:(id)a3 connection:(id)a4;
+ (void)createX509CertChainDataWithMessage:(id)a3 connection:(id)a4;
+ (void)deleteKeychainTokensWithMessage:(id)a3 connection:(id)a4;
+ (void)getPublicKeyDataWithMessage:(id)a3 connection:(id)a4;
+ (void)observeXPCServer:(id)a3;
+ (void)signDataUsingContextWithMessage:(id)a3 connection:(id)a4;
+ (void)signDataWithMessage:(id)a3 connection:(id)a4;
+ (void)x509CertChainDataWithMessage:(id)a3 connection:(id)a4;
- (BOOL)_deleteKeychainTokensForAccountIdentifier:(id)a3 error:(id *)a4;
- (BOOL)_deleteKeychainTokensForAccountIdentifier:(id)a3 purpose:(int64_t)a4 error:(id *)a5;
- (BOOL)_generateKeychainTokensForAccountIdentifier:(id)a3 purpose:(int64_t)a4 error:(id *)a5;
- (BOOL)_isDeviceUnlocked;
- (BOOL)deleteKeychainTokensForAccountIdentifier_:(id)a3 error:(id *)a4;
- (DaemonBiometricKeychain)init;
- (id)_amsCertificateLabelForPurpose:(int64_t)a3;
- (id)_amsKeychainLabelForPurpose:(int64_t)a3;
- (id)_constraintsForExtendedActions;
- (id)_constraintsForPurchase;
- (id)_copyPublicKeyDataForAccountIdentifier:(id)a3 purpose:(int64_t)a4 error:(id *)a5;
- (id)_createAttestationDataForAccountIdentifier:(id)a3 purpose:(int64_t)a4 error:(id *)a5;
- (id)_createX509CertChainDataForAccountIdentifier:(id)a3 purpose:(int64_t)a4 error:(id *)a5;
- (id)_presentPaymentSheetForChallenge:(id)a3 authContext:(id)a4 biometricContext:(id)a5 touchIDContext:(id)a6 touchIDOptions:(id)a7 accessControlRef:(__SecAccessControl *)a8 passwordToken:(id *)a9 paymentTokenData:(id *)a10 fpanID:(id *)a11 error:(id *)a12;
- (id)_publicKeyDataForAccountIdentifier:(id)a3 purpose:(int64_t)a4 regenerateKeys:(BOOL)a5 error:(id *)a6;
- (id)_queryForPrivateKeyWithLabel:(id)a3 prompt:(id)a4;
- (id)_queryForPrivateKeyWithLabel:(id)a3 prompt:(id)a4 useTokenID:(BOOL)a5;
- (id)_regenerateKeychainTokensForAccountIdentifier:(id)a3 purpose:(int64_t)a4 error:(id *)a5;
- (id)_signData:(id)a3 context:(id)a4 error:(id *)a5;
- (id)createAttestationDataForAccountIdentifier_:(id)a3 purpose:(int64_t)a4 error:(id *)a5;
- (id)createX509CertChainDataForAccountIdentifier_:(id)a3 purpose:(int64_t)a4 error:(id *)a5;
- (id)publicKeyDataForAccountIdentifier_:(id)a3 purpose:(int64_t)a4 error:(id *)a5;
- (id)publicKeyDataForAccountIdentifier_:(id)a3 purpose:(int64_t)a4 regenerateKeys:(BOOL)a5 error:(id *)a6;
- (id)signData_:(id)a3 context:(id)a4 error:(id *)a5;
- (id)x509CertChainDataForAccountIdentifier_:(id)a3 purpose:(int64_t)a4 regenerateCerts:(BOOL)a5 error:(id *)a6;
@end

@implementation DaemonBiometricKeychain

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B6894;
  block[3] = &unk_10034AC90;
  block[4] = a1;
  if (qword_1003A3358 != -1) {
    dispatch_once(&qword_1003A3358, block);
  }
  return (id)qword_1003A3350;
}

- (DaemonBiometricKeychain)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___DaemonBiometricKeychain;
  v2 = -[DaemonBiometricKeychain init](&v8, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.itunesstored.DaemonBiometricKeychain", 0LL);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.itunesstored.DaemonBiometricKeychain.X509", 0LL);
    dispatchQueueX509 = v2->_dispatchQueueX509;
    v2->_dispatchQueueX509 = (OS_dispatch_queue *)v5;
  }

  return v2;
}

- (id)createAttestationDataForAccountIdentifier_:(id)a3 purpose:(int64_t)a4 error:(id *)a5
{
  if (a5) {
    *a5 = 0LL;
  }
  return 0LL;
}

- (id)createX509CertChainDataForAccountIdentifier_:(id)a3 purpose:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v41 = 0LL;
  v42 = &v41;
  uint64_t v43 = 0x3032000000LL;
  v44 = sub_1000B6CA8;
  v45 = sub_1000B6CB8;
  id v46 = 0LL;
  uint64_t v35 = 0LL;
  v36 = &v35;
  uint64_t v37 = 0x3032000000LL;
  v38 = sub_1000B6CA8;
  v39 = sub_1000B6CB8;
  id v40 = 0LL;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0LL);
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block = _NSConcreteStackBlock;
  uint64_t v26 = 3221225472LL;
  v27 = sub_1000B6CC0;
  v28 = &unk_10034D868;
  v32 = &v41;
  v29 = self;
  id v11 = v8;
  v33 = &v35;
  int64_t v34 = a4;
  id v30 = v11;
  v12 = v9;
  v31 = v12;
  dispatch_async(dispatchQueue, &block);
  dispatch_time_t v13 = dispatch_time(0LL, 30000000000LL);
  if (dispatch_semaphore_wait(v12, v13))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v14) {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    LODWORD(v15) = [v14 shouldLog];
    unsigned int v16 = [v14 shouldLogToDisk];
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 OSLogObject]);
    v18 = v17;
    if (v16) {
      LODWORD(v15) = v15 | 2;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      uint64_t v15 = v15;
    }
    else {
      v15 &= 2u;
    }
    if ((_DWORD)v15)
    {
      id v19 = (id)objc_opt_class(self);
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
      int v47 = 138543874;
      id v48 = v19;
      __int16 v49 = 2112;
      id v50 = v11;
      __int16 v51 = 2114;
      v52 = v20;
      v21 = (void *)_os_log_send_and_compose_impl( v15,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  16LL,  "%{public}@: Create X509 cert chain data timed out for DSID: %@, purpose: %{public}@",  &v47,  32,  block,  v26,  v27,  v28,  v29,  v30);

      if (!v21)
      {
LABEL_13:

        goto LABEL_14;
      }

      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v21,  4LL));
      free(v21);
      v24 = v18;
      SSFileLog(v14, @"%@");
    }

    goto LABEL_13;
  }

- (BOOL)deleteKeychainTokensForAccountIdentifier_:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v25 = 0LL;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  char v28 = 0;
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  v22 = sub_1000B6CA8;
  v23 = sub_1000B6CB8;
  id v24 = 0LL;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0LL);
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B6EAC;
  block[3] = &unk_10034D890;
  v17 = &v25;
  block[4] = self;
  id v9 = v6;
  id v15 = v9;
  v18 = &v19;
  v10 = v7;
  unsigned int v16 = v10;
  dispatch_async(dispatchQueue, block);
  dispatch_time_t v11 = dispatch_time(0LL, 5000000000LL);
  dispatch_semaphore_wait(v10, v11);
  if (a4) {
    *a4 = (id) v20[5];
  }
  char v12 = *((_BYTE *)v26 + 24);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v12;
}

- (id)publicKeyDataForAccountIdentifier_:(id)a3 purpose:(int64_t)a4 error:(id *)a5
{
  return -[DaemonBiometricKeychain publicKeyDataForAccountIdentifier_:purpose:regenerateKeys:error:]( self,  "publicKeyDataForAccountIdentifier_:purpose:regenerateKeys:error:",  a3,  a4,  1LL,  a5);
}

- (id)publicKeyDataForAccountIdentifier_:(id)a3 purpose:(int64_t)a4 regenerateKeys:(BOOL)a5 error:(id *)a6
{
  id v10 = a3;
  uint64_t v43 = 0LL;
  v44 = &v43;
  uint64_t v45 = 0x3032000000LL;
  id v46 = sub_1000B6CA8;
  int v47 = sub_1000B6CB8;
  id v48 = 0LL;
  uint64_t v37 = 0LL;
  v38 = &v37;
  uint64_t v39 = 0x3032000000LL;
  id v40 = sub_1000B6CA8;
  uint64_t v41 = sub_1000B6CB8;
  id v42 = 0LL;
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0LL);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  dispatch_time_t v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B72B4;
  block[3] = &unk_10034D8B8;
  v33 = &v43;
  block[4] = self;
  id v14 = v10;
  int64_t v34 = &v37;
  int64_t v35 = a4;
  BOOL v36 = a5;
  id v31 = v14;
  id v15 = v11;
  v32 = v15;
  dispatch_async(v13, block);

  dispatch_time_t v16 = dispatch_time(0LL, 5000000000LL);
  dispatch_semaphore_wait(v15, v16);
  if (!v44[5] && !v38[5])
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v17) {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    LODWORD(v18) = [v17 shouldLog];
    unsigned int v19 = [v17 shouldLogToDisk];
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 OSLogObject]);
    uint64_t v21 = v20;
    if (v19) {
      LODWORD(v18) = v18 | 2;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v18 = v18;
    }
    else {
      v18 &= 2u;
    }
    if ((_DWORD)v18)
    {
      v22 = (void *)objc_opt_class(self);
      int v49 = 138543618;
      id v50 = v22;
      __int16 v51 = 2112;
      id v52 = v14;
      id v23 = v22;
      id v24 = (void *)_os_log_send_and_compose_impl( v18,  0LL,  0LL,  0LL,  &_mh_execute_header,  v21,  0LL,  "%{public}@: Public key data copy timed out for DSID: %@",  &v49,  22);

      if (!v24)
      {
LABEL_14:

        uint64_t v25 = SSError(SSErrorDomain, 149LL, 0LL, 0LL);
        uint64_t v26 = objc_claimAutoreleasedReturnValue(v25);
        uint64_t v27 = (void *)v38[5];
        v38[5] = v26;

        goto LABEL_15;
      }

      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v24,  4LL));
      free(v24);
      SSFileLog(v17, @"%@");
    }

    goto LABEL_14;
  }

- (id)signData_:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v43 = 0LL;
  v44 = &v43;
  uint64_t v45 = 0x3032000000LL;
  id v46 = sub_1000B6CA8;
  int v47 = sub_1000B6CB8;
  id v48 = 0LL;
  uint64_t v37 = 0LL;
  v38 = &v37;
  uint64_t v39 = 0x3032000000LL;
  id v40 = sub_1000B6CA8;
  uint64_t v41 = sub_1000B6CB8;
  id v42 = 0LL;
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0LL);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  char v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block = _NSConcreteStackBlock;
  uint64_t v28 = 3221225472LL;
  v29 = sub_1000B76B8;
  id v30 = &unk_10034D8E0;
  int64_t v35 = &v43;
  id v31 = self;
  id v13 = v8;
  id v32 = v13;
  id v14 = v9;
  id v33 = v14;
  BOOL v36 = &v37;
  id v15 = v10;
  int64_t v34 = v15;
  dispatch_async(v12, &block);

  dispatch_time_t v16 = dispatch_time(0LL, 180000000000LL);
  dispatch_semaphore_wait(v15, v16);
  if (!v44[5] && !v38[5])
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v17) {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    LODWORD(v18) = [v17 shouldLog];
    unsigned int v19 = [v17 shouldLogToDisk];
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 OSLogObject]);
    uint64_t v21 = v20;
    if (v19) {
      LODWORD(v18) = v18 | 2;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v18 = v18;
    }
    else {
      v18 &= 2u;
    }
    if ((_DWORD)v18)
    {
      id v22 = (id)objc_opt_class(self);
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v14 accountIdentifier]);
      int v49 = 138543618;
      id v50 = v22;
      __int16 v51 = 2112;
      id v52 = v23;
      id v24 = (void *)_os_log_send_and_compose_impl( v18,  0LL,  0LL,  0LL,  &_mh_execute_header,  v21,  0LL,  "%{public}@: Sign data timed out for DSID: %@",  &v49,  22,  block,  v28,  v29,  v30,  v31,  v32,  v33);

      if (!v24)
      {
LABEL_14:

        goto LABEL_15;
      }

      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v24,  4LL));
      free(v24);
      SSFileLog(v17, @"%@");
    }

    goto LABEL_14;
  }

- (id)x509CertChainDataForAccountIdentifier_:(id)a3 purpose:(int64_t)a4 regenerateCerts:(BOOL)a5 error:(id *)a6
{
  BOOL v72 = a5;
  id v7 = a3;
  CFTypeRef v76 = 0LL;
  CFTypeRef result = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[ISBiometricStore keychainLabelForKeyWithAccountID:purpose:]( &OBJC_CLASS___ISBiometricStore,  "keychainLabelForKeyWithAccountID:purpose:",  v7,  a4));
  if (!v8)
  {
    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v39) {
      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    LODWORD(v40) = [v39 shouldLog];
    uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue([v39 OSLogObject]);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      uint64_t v40 = v40;
    }
    else {
      v40 &= 2u;
    }
    if ((_DWORD)v40)
    {
      id v42 = (void *)objc_opt_class(self);
      id v43 = v42;
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
      int v78 = 138412802;
      v79 = v42;
      __int16 v80 = 2112;
      id v81 = v7;
      __int16 v82 = 2112;
      v83 = v44;
      uint64_t v45 = (void *)_os_log_send_and_compose_impl( v40,  0LL,  0LL,  0LL,  &_mh_execute_header,  v41,  16LL,  "%@: Failed to generate label for DSID: %@, purpose: %@",  &v78,  32);

      if (v45)
      {
        id v46 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v45,  4LL));
        free(v45);
        v63 = v46;
        SSFileLog(v39, @"%@");
      }
    }

    else
    {
    }

    goto LABEL_43;
  }

  id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  dispatch_semaphore_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-cert", v8));
  CFStringRef v11 = kSecAttrLabel;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v10, kSecAttrLabel);

  CFStringRef v12 = kSecClassCertificate;
  CFStringRef v13 = kSecClass;
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  kSecClassCertificate,  kSecClass);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", &__kCFBooleanTrue);
  uint64_t v14 = SecItemCopyMatching((CFDictionaryRef)v9, &result);
  if ((_DWORD)v14)
  {
    uint64_t v15 = v14;
    dispatch_time_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v16) {
      dispatch_time_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    LODWORD(v17) = [v16 shouldLog];
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 OSLogObject]);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      uint64_t v17 = v17;
    }
    else {
      v17 &= 2u;
    }
    if ((_DWORD)v17)
    {
      unsigned int v19 = v9;
      v20 = (void *)objc_opt_class(self);
      v68 = v8;
      id v66 = v20;
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
      id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v15));
      int v78 = 138544130;
      v79 = v20;
      id v9 = v19;
      __int16 v80 = 2112;
      id v81 = v7;
      __int16 v82 = 2114;
      v83 = v21;
      __int16 v84 = 2114;
      v85 = v22;
      id v23 = (void *)_os_log_send_and_compose_impl( v17,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  16LL,  "%{public}@: Failed to find public key cert for DSID: %@, purpose: %{public}@, status: %{public}@",  &v78,  42);

      id v8 = v68;
      if (!v23)
      {
LABEL_14:

        CFStringRef v12 = kSecClassCertificate;
        CFStringRef v11 = kSecAttrLabel;
        CFStringRef v13 = kSecClass;
        goto LABEL_15;
      }

      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v23,  4LL));
      free(v23);
      v63 = v18;
      SSFileLog(v16, @"%@");
    }

    goto LABEL_14;
  }

+ (void)observeXPCServer:(id)a3
{
  id v4 = a3;
  [v4 addObserver:a1 selector:"createAttestationDataWithMessage:connection:" forMessage:179];
  [v4 addObserver:a1 selector:"createX509CertChainDataWithMessage:connection:" forMessage:204];
  [v4 addObserver:a1 selector:"deleteKeychainTokensWithMessage:connection:" forMessage:185];
  [v4 addObserver:a1 selector:"getPublicKeyDataWithMessage:connection:" forMessage:180];
  [v4 addObserver:a1 selector:"signDataWithMessage:connection:" forMessage:181];
  [v4 addObserver:a1 selector:"signDataUsingContextWithMessage:connection:" forMessage:192];
  [v4 addObserver:a1 selector:"x509CertChainDataWithMessage:connection:" forMessage:205];
}

+ (void)createAttestationDataWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000B82A4;
  v7[3] = &unk_10034D908;
  id v8 = a3;
  id v9 = a1;
  id v6 = v8;
  [a1 _handleMessage:v6 connection:a4 withReplyBlock:v7];
}

+ (void)createX509CertChainDataWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000B8474;
  v7[3] = &unk_10034D908;
  id v8 = a3;
  id v9 = a1;
  id v6 = v8;
  [a1 _handleMessage:v6 connection:a4 withReplyBlock:v7];
}

+ (void)deleteKeychainTokensWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000B8644;
  v7[3] = &unk_10034D908;
  id v8 = a3;
  id v9 = a1;
  id v6 = v8;
  [a1 _handleMessage:v6 connection:a4 withReplyBlock:v7];
}

+ (void)getPublicKeyDataWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000B87F0;
  v7[3] = &unk_10034D908;
  id v8 = a3;
  id v9 = a1;
  id v6 = v8;
  [a1 _handleMessage:v6 connection:a4 withReplyBlock:v7];
}

+ (void)signDataWithMessage:(id)a3 connection:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000B89E0;
  v8[3] = &unk_10034D930;
  id v9 = a3;
  id v10 = a4;
  id v11 = a1;
  id v6 = v10;
  id v7 = v9;
  [a1 _handleMessage:v7 connection:v6 withReplyBlock:v8];
}

+ (void)signDataUsingContextWithMessage:(id)a3 connection:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000B8EF8;
  v8[3] = &unk_10034D930;
  id v9 = a3;
  id v10 = a4;
  id v11 = a1;
  id v6 = v10;
  id v7 = v9;
  [a1 _handleMessage:v7 connection:v6 withReplyBlock:v8];
}

+ (void)x509CertChainDataWithMessage:(id)a3 connection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000B93C4;
  v7[3] = &unk_10034D908;
  id v8 = a3;
  id v9 = a1;
  id v6 = v8;
  [a1 _handleMessage:v6 connection:a4 withReplyBlock:v7];
}

- (id)_amsCertificateLabelForPurpose:(int64_t)a3
{
  dispatch_queue_t v3 = @"com.apple.AppleMediaServices.cert.X509.client.extended";
  if (a3 != 1) {
    dispatch_queue_t v3 = 0LL;
  }
  if (a3) {
    return (id)v3;
  }
  else {
    return @"com.apple.AppleMediaServices.cert.X509.client.primary";
  }
}

- (id)_amsKeychainLabelForPurpose:(int64_t)a3
{
  unsigned int v4 = +[ISBiometricStore shouldUseX509](&OBJC_CLASS___ISBiometricStore, "shouldUseX509");
  if (a3 == 1)
  {
    dispatch_queue_t v5 = @"com.apple.AppleMediaServices.extendedKey";
    id v6 = @"com.apple.AppleMediaServices.cert.X509.extended";
  }

  else
  {
    if (a3) {
      return 0LL;
    }
    dispatch_queue_t v5 = @"com.apple.AppleMediaServices.primaryKey";
    id v6 = @"com.apple.AppleMediaServices.cert.X509.primary";
  }

  if (v4) {
    dispatch_queue_t v5 = (__CFString *)v6;
  }
  return v5;
}

+ (void)_handleMessage:(id)a3 connection:(id)a4 withReplyBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  CFStringRef v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000B96BC;
  v16[3] = &unk_10034D958;
  id v17 = v9;
  id v18 = v8;
  id v19 = v10;
  id v20 = a1;
  id v13 = v10;
  id v14 = v8;
  id v15 = v9;
  dispatch_async(v12, v16);
}

- (BOOL)_isDeviceUnlocked
{
  dispatch_queue_t v3 = (uint64_t (*)(void))ISWeakLinkedSymbolForString("MKBGetDeviceLockState", 31LL);
  int v4 = v3(0LL);
  int v5 = v4;
  if (v4) {
    BOOL v6 = v4 == 3;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    return !v5 || v5 == 3;
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v7) {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v8 = [v7 shouldLog];
  else {
    LODWORD(v9) = v8;
  }
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v9 = v9;
  }
  else {
    v9 &= 2u;
  }
  if (!(_DWORD)v9) {
    goto LABEL_16;
  }
  int v15 = 138543362;
  id v16 = (id)objc_opt_class(self);
  id v11 = v16;
  CFStringRef v12 = (void *)_os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "%{public}@: Device is locked",  &v15,  12);

  if (v12)
  {
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v12,  4LL));
    free(v12);
    SSFileLog(v7, @"%@");
LABEL_16:
  }

  return !v5 || v5 == 3;
}

- (id)_constraintsForExtendedActions
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  dispatch_queue_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v13 = @"pbioc";
  int v4 = objc_opt_new(&OBJC_CLASS___NSData);
  id v14 = v4;
  int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, @"cbio");

  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", &off_10036D770, @"pmuc");
  BOOL v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v11 = @"pbioc";
  id v7 = objc_opt_new(&OBJC_CLASS___NSData);
  CFStringRef v12 = v7;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v8, @"cbio");

  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", &off_10036D770, @"pmuc");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"oa");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v3, @"ock");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"odel");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v6, @"osgn");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](&OBJC_CLASS___NSDictionary, "dictionaryWithDictionary:", v2));

  return v9;
}

- (id)_constraintsForPurchase
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  &off_10036D7A0,  @"pkofn");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", &off_10036D7A0, @"pmuc");
  v23[0] = @"pbioc";
  dispatch_queue_t v3 = objc_opt_new(&OBJC_CLASS___NSData);
  v23[1] = @"pbiot";
  v24[0] = v3;
  v24[1] = &off_10036D7A0;
  int v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v23,  2LL));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v4, @"cbio");

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"cbtn");
  int v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  &off_10036D770,  @"pkofn");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", &off_10036D7A0, @"pmuc");
  v21[0] = @"pbioc";
  BOOL v6 = objc_opt_new(&OBJC_CLASS___NSData);
  v21[1] = @"pbiot";
  v22[0] = v6;
  v22[1] = &off_10036D770;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  2LL));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v7, @"cbio");

  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v2, @"ckon");
  unsigned int v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  &off_10036D7A0,  @"pkofn");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", &off_10036D7A0, @"pmuc");
  v19[0] = @"pbioc";
  uint64_t v9 = objc_opt_new(&OBJC_CLASS___NSData);
  v19[1] = @"pbiot";
  v20[0] = v9;
  v20[1] = &off_10036D7A0;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  2LL));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v10, @"cbio");

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"cbtn");
  id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v11,  "setObject:forKeyedSubscript:",  &off_10036D770,  @"pkofn");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v11,  "setObject:forKeyedSubscript:",  &off_10036D770,  @"pmoc");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v11,  "setObject:forKeyedSubscript:",  &off_10036D7A0,  @"pmuc");
  v17[0] = @"pbioc";
  CFStringRef v12 = objc_opt_new(&OBJC_CLASS___NSData);
  v17[1] = @"pbiot";
  v18[0] = v12;
  v18[1] = &off_10036D770;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  2LL));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v13, @"cbio");

  -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v8, @"ckon");
  id v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"oa");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v5, @"ock");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v14,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"odel");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v11, @"osgn");
  int v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  v14));

  return v15;
}

- (id)_copyPublicKeyDataForAccountIdentifier:(id)a3 purpose:(int64_t)a4 error:(id *)a5
{
  CFTypeRef result = 0LL;
  CFTypeRef cf = 0LL;
  CFErrorRef error = 0LL;
  id v153 = a3;
  v154 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v153));
  int64_t v155 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[ISBiometricStore keychainLabelForCertWithAccountID:purpose:]( &OBJC_CLASS___ISBiometricStore,  "keychainLabelForCertWithAccountID:purpose:",  v153,  a4));
  unsigned int v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v7, kSecAttrLabel);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  kSecClassCertificate,  kSecClass);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  kSecReturnRef);
  uint64_t v9 = SecItemCopyMatching((CFDictionaryRef)v8, &result);
  id v10 = &ACSLocateCachingServer_ptr;
  if ((_DWORD)v9 == -25300 || (uint64_t v11 = v9, (v12 = (__SecCertificate *)result) == 0LL))
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( -[DaemonBiometricKeychain _amsCertificateLabelForPurpose:]( self,  "_amsCertificateLabelForPurpose:",  a4));

    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v13, kSecAttrLabel);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v14) {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    LODWORD(v15) = [v14 shouldLog];
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 OSLogObject]);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v15 = v15;
    }
    else {
      v15 &= 2u;
    }
    if ((_DWORD)v15)
    {
      id v17 = (void *)objc_opt_class(self);
      int v159 = 138543618;
      v160 = v17;
      __int16 v161 = 2114;
      v162 = v13;
      id v18 = v17;
      id v19 = (void *)_os_log_send_and_compose_impl( v15,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  0LL,  "%{public}@: Attempting to look up AMS public key cert using label: %{public}@",  &v159,  22);

      if (!v19)
      {
LABEL_15:

        uint64_t v11 = SecItemCopyMatching((CFDictionaryRef)v8, &result);
        CFStringRef v12 = (__SecCertificate *)result;
        goto LABEL_16;
      }

      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v19,  4LL));
      free(v19);
      v141 = v16;
      SSFileLog(v14, @"%@");
    }

    goto LABEL_15;
  }

  id v13 = v7;
LABEL_16:
  v152 = v8;
  if ((_DWORD)v11 == -25300 || !v12)
  {
    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig", v141));
    if (!v40) {
      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v41 = [v40 shouldLog];
    id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue([v40 OSLogObject]);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v43 = v41;
    }
    else {
      uint64_t v43 = v41 & 2;
    }
    v149 = self;
    if ((_DWORD)v43)
    {
      v44 = (void *)objc_opt_class(self);
      id v45 = v44;
      uint64_t v46 = SSHashIfNeeded(v154);
      int v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
      uint64_t v48 = (__CFError *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v155));
      int v159 = 138543874;
      v160 = v44;
      id v10 = &ACSLocateCachingServer_ptr;
      __int16 v161 = 2112;
      v162 = v47;
      __int16 v163 = 2114;
      CFErrorRef v164 = v48;
      LODWORD(v144) = 32;
      int v49 = (void *)_os_log_send_and_compose_impl( v43,  0LL,  0LL,  0LL,  &_mh_execute_header,  v42,  0LL,  "%{public}@: Failed to find X509 cert for public key for DSID: %@, purpose: %{public}@",  &v159,  v144);

      self = v149;
      id v50 = &ACSLocateCachingServer_ptr;
      if (!v49) {
        goto LABEL_42;
      }
      id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v49,  4LL));
      free(v49);
      v142 = v42;
      SSFileLog(v40, @"%@");
    }

    else
    {
      id v50 = &ACSLocateCachingServer_ptr;
    }

LABEL_42:
    uint64_t v51 = objc_claimAutoreleasedReturnValue([v50[298] keychainLabelForAccountID:v153 purpose:v155]);

    uint64_t v25 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( -[DaemonBiometricKeychain _queryForPrivateKeyWithLabel:prompt:]( self,  "_queryForPrivateKeyWithLabel:prompt:",  v51,  0LL));
    id v52 = (void *)objc_claimAutoreleasedReturnValue([v10[459] sharedDaemonConfig]);
    if (!v52) {
      id v52 = (void *)objc_claimAutoreleasedReturnValue([v10[459] sharedConfig]);
    }
    v145 = (void *)v51;
    unsigned int v53 = objc_msgSend(v52, "shouldLog", v142);
    id v54 = (os_log_s *)objc_claimAutoreleasedReturnValue([v52 OSLogObject]);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v55 = v53;
    }
    else {
      uint64_t v55 = v53 & 2;
    }
    if ((_DWORD)v55)
    {
      v56 = (void *)objc_opt_class(self);
      id v57 = v56;
      uint64_t v58 = SSHashIfNeeded(v154);
      v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
      v60 = (__CFError *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v155));
      int v159 = 138543874;
      v160 = v56;
      __int16 v161 = 2112;
      v162 = v59;
      __int16 v163 = 2114;
      CFErrorRef v164 = v60;
      LODWORD(v144) = 32;
      id v61 = (void *)_os_log_send_and_compose_impl( v55,  0LL,  0LL,  0LL,  &_mh_execute_header,  v54,  0LL,  "%{public}@: Public key data query as X509 fallback [BEGIN] for DSID: %@, purpose: %{public}@",  &v159,  v144);

      id v10 = &ACSLocateCachingServer_ptr;
      if (!v61) {
        goto LABEL_53;
      }
      id v54 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v61,  4LL));
      free(v61);
      v143 = v54;
      SSFileLog(v52, @"%@");
    }

LABEL_53:
    uint64_t v62 = SecItemCopyMatching(v25, &cf);
    v63 = (void *)objc_claimAutoreleasedReturnValue([v10[459] sharedDaemonConfig]);
    if (!v63) {
      v63 = (void *)objc_claimAutoreleasedReturnValue([v10[459] sharedConfig]);
    }
    unsigned int v64 = objc_msgSend(v63, "shouldLog", v143);
    uint64_t v65 = (os_log_s *)objc_claimAutoreleasedReturnValue([v63 OSLogObject]);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v66 = v64;
    }
    else {
      uint64_t v66 = v64 & 2;
    }
    v147 = v25;
    self = v149;
    if ((_DWORD)v66)
    {
      id v67 = (void *)objc_opt_class(v149);
      id v68 = v67;
      uint64_t v69 = SSHashIfNeeded(v154);
      v70 = (void *)objc_claimAutoreleasedReturnValue(v69);
      id v71 = (__CFError *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v155));
      int v159 = 138543874;
      v160 = v67;
      __int16 v161 = 2112;
      v162 = v70;
      __int16 v163 = 2114;
      CFErrorRef v164 = v71;
      LODWORD(v144) = 32;
      BOOL v72 = (void *)_os_log_send_and_compose_impl( v66,  0LL,  0LL,  0LL,  &_mh_execute_header,  v65,  0LL,  "%{public}@: Public key data query as X509 fallback [COMPLETE] for DSID: %@, purpose: %{public}@",  &v159,  v144);

      uint64_t v25 = v147;
      self = v149;

      if (!v72)
      {
LABEL_64:

        if ((_DWORD)v62 != -25300 && cf)
        {
          if ((_DWORD)v62) {
            goto LABEL_67;
          }
          goto LABEL_90;
        }

        v89 = (void *)objc_claimAutoreleasedReturnValue( -[DaemonBiometricKeychain _amsKeychainLabelForPurpose:]( self,  "_amsKeychainLabelForPurpose:",  v155,  v141));
        id v90 = -[__CFDictionary mutableCopy](v25, "mutableCopy");
        [v90 setObject:v89 forKeyedSubscript:kSecAttrLabel];
        v91 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
        if (!v91) {
          v91 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
        }
        LODWORD(v92) = [v91 shouldLog];
        v93 = (os_log_s *)objc_claimAutoreleasedReturnValue([v91 OSLogObject]);
        if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v92 = v92;
        }
        else {
          v92 &= 2u;
        }
        if ((_DWORD)v92)
        {
          v94 = (void *)objc_opt_class(self);
          int v159 = 138543618;
          v160 = v94;
          __int16 v161 = 2114;
          v162 = v89;
          id v95 = v94;
          LODWORD(v144) = 22;
          v96 = (void *)_os_log_send_and_compose_impl( v92,  0LL,  0LL,  0LL,  &_mh_execute_header,  v93,  0LL,  "%{public}@: Attempting to look up AMS public key using label: %{public}@",  &v159,  v144);

          if (!v96) {
            goto LABEL_89;
          }
          v93 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v96,  4LL));
          free(v96);
          v141 = v93;
          SSFileLog(v91, @"%@");
        }

LABEL_89:
        uint64_t v62 = SecItemCopyMatching((CFDictionaryRef)v90, &cf);

        if ((_DWORD)v62)
        {
LABEL_67:
          uint64_t v73 = SSError(SSErrorDomain, 147LL, 0LL, 0LL);
          v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
          uint64_t v75 = SSErrorKeychainStatusCodeKey;
          CFTypeRef v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v62));
          uint64_t v77 = SSErrorBySettingUserInfoValue(v74, v75, v76);
          uint64_t v39 = (__CFError *)objc_claimAutoreleasedReturnValue(v77);

          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
          if (!v27) {
            uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
          }
          unsigned int v78 = objc_msgSend(v27, "shouldLog", v141);
          else {
            LODWORD(v79) = v78;
          }
          __int16 v80 = (os_log_s *)objc_claimAutoreleasedReturnValue([v27 OSLogObject]);
          if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT)) {
            uint64_t v79 = v79;
          }
          else {
            v79 &= 2u;
          }
          if ((_DWORD)v79)
          {
            id v81 = (void *)objc_opt_class(self);
            id v82 = v81;
            uint64_t v83 = SSHashIfNeeded(v154);
            __int16 v84 = (void *)objc_claimAutoreleasedReturnValue(v83);
            v85 = (__CFError *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v155));
            v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v62));
            int v159 = 138544130;
            v160 = v81;
            __int16 v161 = 2112;
            v162 = v84;
            __int16 v163 = 2114;
            CFErrorRef v164 = v85;
            __int16 v165 = 2114;
            v166 = v86;
            LODWORD(v144) = 42;
            uint64_t v87 = _os_log_send_and_compose_impl( v79,  0LL,  0LL,  0LL,  &_mh_execute_header,  v80,  0LL,  "%{public}@: Key copy as X509 fallback failed for DSID: %@, purpose: %{public}@, status: %{public}@",  &v159,  v144);

            if (v87)
            {
              __int16 v80 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v87,  4LL));
              v88 = (void *)v87;
LABEL_153:
              free(v88);
              SSFileLog(v27, @"%@");
              v38 = a5;
              uint64_t v25 = v147;
LABEL_155:
              id v13 = v145;

              SecKeyRef v34 = 0LL;
              CFDataRef v35 = 0LL;
              CFDataRef v36 = 0LL;
              LOBYTE(v37) = 1;
              goto LABEL_174;
            }

            goto LABEL_156;
          }

- (id)_createAttestationDataForAccountIdentifier:(id)a3 purpose:(int64_t)a4 error:(id *)a5
{
  CFTypeRef v96 = 0LL;
  CFTypeRef result = 0LL;
  id v8 = a3;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v8));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[ISBiometricStore keychainLabelForAccountID:purpose:]( &OBJC_CLASS___ISBiometricStore,  "keychainLabelForAccountID:purpose:",  v8,  a4));

  uint64_t v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( -[DaemonBiometricKeychain _queryForPrivateKeyWithLabel:prompt:]( self,  "_queryForPrivateKeyWithLabel:prompt:",  v10,  0LL));
  uint64_t v12 = SecItemCopyMatching(v11, &result);
  if ((_DWORD)v12)
  {
    uint64_t v13 = v12;
    CFTypeRef cf = v11;
    v89 = v10;
    v94 = a5;
    uint64_t v14 = SSError(SSErrorDomain, 147LL, 0LL, 0LL);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    uint64_t v16 = SSErrorKeychainStatusCodeKey;
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v13));
    uint64_t v18 = SSErrorBySettingUserInfoValue(v15, v16, v17);
    id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v20) {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v21 = [v20 shouldLog];
    else {
      unsigned int v22 = v21;
    }
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 OSLogObject]);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v24 = v22;
    }
    else {
      uint64_t v24 = v22 & 2;
    }
    if ((_DWORD)v24)
    {
      uint64_t v25 = (void *)objc_opt_class(self);
      id v26 = v25;
      uint64_t v27 = v9;
      uint64_t v28 = SSHashIfNeeded(v9);
      id v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v13));
      int v98 = 138543874;
      CFDataRef v99 = v25;
      __int16 v100 = 2112;
      v101 = v29;
      __int16 v102 = 2114;
      uint64_t v103 = v30;
      id v31 = (void *)_os_log_send_and_compose_impl( v24,  0LL,  0LL,  0LL,  &_mh_execute_header,  v23,  0LL,  "%{public}@: Key copy failed while attesting for DSID: %@, status: %{public}@",  &v98,  32);

      a5 = v94;
      uint64_t v11 = cf;
      if (!v31)
      {
LABEL_30:

        uint64_t v48 = 0LL;
        uint64_t v9 = v27;
        id v10 = v89;
        goto LABEL_75;
      }

      id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v31,  4LL));
      free(v31);
      SSFileLog(v20, @"%@");
    }

    else
    {
      uint64_t v27 = v9;
      a5 = v94;
    }

    goto LABEL_30;
  }

  if (!result)
  {
    uint64_t v49 = SSError(SSErrorDomain, 147LL, 0LL, 0LL);
    id v19 = (void *)objc_claimAutoreleasedReturnValue(v49);
    id v50 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v50) {
      id v50 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v51 = [v50 shouldLog];
    id v52 = (os_log_s *)objc_claimAutoreleasedReturnValue([v50 OSLogObject]);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v53 = v51;
    }
    else {
      uint64_t v53 = v51 & 2;
    }
    if ((_DWORD)v53)
    {
      id v54 = (void *)objc_opt_class(self);
      id cfc = v54;
      v91 = v19;
      uint64_t v55 = v9;
      uint64_t v56 = SSHashIfNeeded(v9);
      id v57 = v11;
      uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue(v56);
      int v98 = 138543618;
      CFDataRef v99 = v54;
      __int16 v100 = 2112;
      v101 = v58;
      v59 = (void *)_os_log_send_and_compose_impl( v53,  0LL,  0LL,  0LL,  &_mh_execute_header,  v52,  0LL,  "%{public}@: Key copy failed while attesting for DSID: %@",  &v98,  22);

      uint64_t v11 = v57;
      uint64_t v9 = v55;
      id v19 = v91;

      if (!v59)
      {
LABEL_42:

        uint64_t v48 = 0LL;
        goto LABEL_75;
      }

      id v52 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v59,  4LL));
      free(v59);
      SSFileLog(v50, @"%@");
    }

    goto LABEL_42;
  }

  uint64_t v32 = SecKeyCopyAttestationKey(1LL, &v96);
  id v33 = (const void *)v32;
  id v95 = a5;
  if (v32 && !v96)
  {
    SecKeyRef v34 = (void *)SecKeyCreateAttestation(v32, result, &v96);
    CFDataRef v35 = v34;
    if (v34 && !v96)
    {
      id v90 = v10;
      id v82 = v34;
      CFDataRef v36 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
      if (!v36) {
        CFDataRef v36 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v37 = [v36 shouldLog];
      v38 = (os_log_s *)objc_claimAutoreleasedReturnValue([v36 OSLogObject]);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
        uint64_t v39 = v37;
      }
      else {
        uint64_t v39 = v37 & 2;
      }
      if ((_DWORD)v39)
      {
        uint64_t v40 = (void *)objc_opt_class(self);
        CFTypeRef cfb = v35;
        unsigned int v41 = v33;
        id v42 = v40;
        uint64_t v43 = SSHashIfNeeded(v9);
        v44 = v11;
        id v45 = (void *)objc_claimAutoreleasedReturnValue(v43);
        int v98 = 138543618;
        CFDataRef v99 = v40;
        __int16 v100 = 2112;
        v101 = v45;
        uint64_t v46 = (void *)_os_log_send_and_compose_impl( v39,  0LL,  0LL,  0LL,  &_mh_execute_header,  v38,  2LL,  "%{public}@: Attestation generated for DSID: %@",  &v98,  22);

        uint64_t v11 = v44;
        id v33 = v41;
        CFDataRef v35 = cfb;

        id v47 = v82;
        if (!v46)
        {
LABEL_72:

          id v19 = 0LL;
          id v10 = v90;
          a5 = v95;
LABEL_73:
          CFRelease(v35);
          __int16 v80 = v47;
          goto LABEL_74;
        }

        v38 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v46,  4LL));
        free(v46);
        SSFileLog(v36, @"%@");
      }

      else
      {
        id v47 = v82;
      }

      goto LABEL_72;
    }

    CFTypeRef cfa = v34;
    id v19 = (id)v96;
    uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v69) {
      uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v70 = [v69 shouldLog];
    id v71 = (os_log_s *)objc_claimAutoreleasedReturnValue([v69 OSLogObject]);
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v72 = v70;
    }
    else {
      uint64_t v72 = v70 & 2;
    }
    if ((_DWORD)v72)
    {
      uint64_t v73 = (void *)objc_opt_class(self);
      v93 = v33;
      v74 = v19;
      uint64_t v75 = v9;
      id v83 = v73;
      uint64_t v76 = SSHashIfNeeded(v9);
      uint64_t v77 = v11;
      unsigned int v78 = (void *)objc_claimAutoreleasedReturnValue(v76);
      int v98 = 138543874;
      CFDataRef v99 = v73;
      __int16 v100 = 2112;
      v101 = v78;
      __int16 v102 = 2114;
      uint64_t v103 = v74;
      uint64_t v79 = (void *)_os_log_send_and_compose_impl( v72,  0LL,  0LL,  0LL,  &_mh_execute_header,  v71,  0LL,  "%{public}@: Attestation generation failed for DSID: %@, error: %{public}@",  &v98,  32);

      uint64_t v11 = v77;
      uint64_t v9 = v75;
      id v19 = v74;
      id v33 = v93;

      if (!v79) {
        goto LABEL_64;
      }
      id v71 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v79,  4LL));
      free(v79);
      SSFileLog(v69, @"%@");
    }

LABEL_64:
    id v47 = 0LL;
    __int16 v80 = 0LL;
    a5 = v95;
    CFDataRef v35 = cfa;
    if (!cfa) {
      goto LABEL_74;
    }
    goto LABEL_73;
  }

  uint64_t v92 = (const void *)v32;
  id v19 = (id)v96;
  v60 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v60) {
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v61 = [v60 shouldLog];
  uint64_t v62 = (os_log_s *)objc_claimAutoreleasedReturnValue([v60 OSLogObject]);
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v63 = v61;
  }
  else {
    uint64_t v63 = v61 & 2;
  }
  if ((_DWORD)v63)
  {
    unsigned int v64 = (void *)objc_opt_class(self);
    id cfd = v64;
    uint64_t v65 = SSHashIfNeeded(v9);
    uint64_t v66 = v11;
    id v67 = (void *)objc_claimAutoreleasedReturnValue(v65);
    int v98 = 138543874;
    CFDataRef v99 = v64;
    __int16 v100 = 2112;
    v101 = v67;
    __int16 v102 = 2114;
    uint64_t v103 = v19;
    id v68 = (void *)_os_log_send_and_compose_impl( v63,  0LL,  0LL,  0LL,  &_mh_execute_header,  v62,  0LL,  "%{public}@: Attesting key copy failed for DSID: %@, error: %{public}@",  &v98,  32);

    uint64_t v11 = v66;
    id v33 = v92;
    a5 = v95;
    if (!v68) {
      goto LABEL_68;
    }
    uint64_t v62 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v68,  4LL));
    free(v68);
    SSFileLog(v60, @"%@");
  }

  else
  {
    id v33 = v92;
    a5 = v95;
  }

LABEL_68:
  __int16 v80 = 0LL;
  uint64_t v48 = 0LL;
  if (v33)
  {
LABEL_74:
    CFRelease(v33);
    uint64_t v48 = v80;
  }

- (id)_createX509CertChainDataForAccountIdentifier:(id)a3 purpose:(int64_t)a4 error:(id *)a5
{
  if (a5) {
    *a5 = 0LL;
  }
  return +[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", 0LL, a4);
}

- (BOOL)_deleteKeychainTokensForAccountIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"mt-tid-%@", v6));
  NSHTTPCookiePropertyKey v46 = NSHTTPCookieName;
  id v47 = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v47,  &v46,  1LL));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  id v41 = 0LL;
  objc_msgSend(v9, "ams_removeCookiesMatchingProperties:error:", v8, &v41);
  id v10 = v41;

  if (v10)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v11) {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v12 = [v11 shouldLog];
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 OSLogObject]);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      uint64_t v14 = v12;
    }
    else {
      uint64_t v14 = v12 & 2;
    }
    v38 = self;
    if ((_DWORD)v14)
    {
      uint64_t v15 = (void *)objc_opt_class(self);
      int v42 = 138543618;
      uint64_t v43 = v15;
      __int16 v44 = 2114;
      uint64_t v45 = 0LL;
      id v16 = v10;
      id v17 = v8;
      uint64_t v18 = v7;
      id v19 = a4;
      id v20 = v15;
      unsigned int v21 = (void *)_os_log_send_and_compose_impl( v14,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  16LL,  "%{public}@: Failed to delete TouchID token with error: %{public}@",  &v42,  22);

      a4 = v19;
      id v7 = v18;
      id v8 = v17;
      id v10 = v16;

      if (!v21)
      {
LABEL_13:

        self = v38;
        goto LABEL_14;
      }

      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v21,  4LL));
      free(v21);
      CFDataRef v35 = v13;
      SSFileLog(v11, @"%@");
    }

    goto LABEL_13;
  }

- (BOOL)_deleteKeychainTokensForAccountIdentifier:(id)a3 purpose:(int64_t)a4 error:(id *)a5
{
  if (a5) {
    *a5 = 0LL;
  }
  return 1;
}

- (BOOL)_generateKeychainTokensForAccountIdentifier:(id)a3 purpose:(int64_t)a4 error:(id *)a5
{
  if (a5) {
    *a5 = 0LL;
  }
  return 0;
}

- (id)_presentPaymentSheetForChallenge:(id)a3 authContext:(id)a4 biometricContext:(id)a5 touchIDContext:(id)a6 touchIDOptions:(id)a7 accessControlRef:(__SecAccessControl *)a8 passwordToken:(id *)a9 paymentTokenData:(id *)a10 fpanID:(id *)a11 error:(id *)a12
{
  uint64_t v12 = SSError(SSErrorDomain, 135LL, 0LL, 0LL);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  uint64_t v14 = v13;
  if (a9) {
    *a9 = 0LL;
  }
  if (a10) {
    *a10 = 0LL;
  }
  if (a11) {
    *a11 = 0LL;
  }
  if (a12) {
    *a12 = v13;
  }

  return 0LL;
}

- (id)_publicKeyDataForAccountIdentifier:(id)a3 purpose:(int64_t)a4 regenerateKeys:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v76 = 0LL;
  id v11 = -[DaemonBiometricKeychain _copyPublicKeyDataForAccountIdentifier:purpose:error:]( self,  "_copyPublicKeyDataForAccountIdentifier:purpose:error:",  v10,  a4,  &v76);
  id v12 = v76;
  uint64_t v13 = v12;
  if (!v11 && v7)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 domain]);
    unsigned int v15 = [v14 isEqualToString:SSErrorDomain];

    if (v15)
    {
      id v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v10));
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 userInfo]);
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:SSErrorKeychainStatusCodeKey]);
      id v18 = [v17 integerValue];

      if (v18 == (id)-25300LL && -[DaemonBiometricKeychain _isDeviceUnlocked](self, "_isDeviceUnlocked"))
      {
        unsigned int v19 = +[ISBiometricStore shouldUseX509](&OBJC_CLASS___ISBiometricStore, "shouldUseX509");
        uint64_t v20 = objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
        unsigned int v21 = (void *)v20;
        if (v19)
        {
          id v68 = a6;
          if (!v20) {
            unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
          }
          unsigned int v22 = [v21 shouldLog];
          else {
            unsigned int v23 = v22;
          }
          uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 OSLogObject]);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
            uint64_t v25 = v23;
          }
          else {
            uint64_t v25 = v23 & 2;
          }
          if ((_DWORD)v25)
          {
            id v26 = (void *)objc_opt_class(self);
            id v67 = v26;
            uint64_t v27 = SSHashIfNeeded(v71);
            uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
            id v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
            int v77 = 138543874;
            unsigned int v78 = v26;
            __int16 v79 = 2112;
            __int16 v80 = v28;
            __int16 v81 = 2114;
            id v82 = v29;
            uint64_t v30 = (void *)_os_log_send_and_compose_impl( v25,  0LL,  0LL,  0LL,  &_mh_execute_header,  v24,  0LL,  "%{public}@: Public key not found, creating new X509 cert chain for DSID: %@, purpose: %{public}@",  &v77,  32);

            if (!v30) {
              goto LABEL_19;
            }
            uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v30,  4LL));
            free(v30);
            uint64_t v65 = v24;
            SSFileLog(v21, @"%@");
          }

LABEL_19:
          id v75 = v13;
          id v31 =  -[DaemonBiometricKeychain createX509CertChainDataForAccountIdentifier_:purpose:error:]( self,  "createX509CertChainDataForAccountIdentifier_:purpose:error:",  v10,  a4,  &v75);
          id v32 = v75;

          if (!v32)
          {
            id v74 = 0LL;
            id v11 = -[DaemonBiometricKeychain _copyPublicKeyDataForAccountIdentifier:purpose:error:]( self,  "_copyPublicKeyDataForAccountIdentifier:purpose:error:",  v10,  a4,  &v74);
            id v32 = v74;
            a6 = v68;
            goto LABEL_49;
          }

          id v33 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
          if (!v33) {
            id v33 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
          }
          unsigned int v34 = objc_msgSend(v33, "shouldLog", v65);
          else {
            unsigned int v35 = v34;
          }
          uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue([v33 OSLogObject]);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
            uint64_t v37 = v35;
          }
          else {
            uint64_t v37 = v35 & 2;
          }
          if ((_DWORD)v37)
          {
            v38 = (void *)objc_opt_class(self);
            id v39 = v38;
            uint64_t v40 = SSHashIfNeeded(v71);
            id v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
            int v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
            int v77 = 138544130;
            unsigned int v78 = v38;
            __int16 v79 = 2112;
            __int16 v80 = v41;
            __int16 v81 = 2114;
            id v82 = v42;
            __int16 v83 = 2114;
            id v84 = v32;
            LODWORD(v66) = 42;
            uint64_t v43 = (void *)_os_log_send_and_compose_impl( v37,  0LL,  0LL,  0LL,  &_mh_execute_header,  v36,  16LL,  "%{public}@: Failed to create X509 cert chain for DSID: %@, purpose: %{public}@, error: %{public}@",  &v77,  v66);

            a6 = v68;
            if (!v43)
            {
LABEL_67:

              id v11 = 0LL;
LABEL_49:

              uint64_t v13 = v32;
              if (!a6) {
                goto LABEL_34;
              }
              goto LABEL_33;
            }

            uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v43,  4LL));
            free(v43);
            SSFileLog(v33, @"%@");
          }

          else
          {
            a6 = v68;
          }

          goto LABEL_67;
        }

        if (!v20) {
          unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
        }
        unsigned int v56 = [v21 shouldLog];
        else {
          unsigned int v57 = v56;
        }
        uint64_t v58 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 OSLogObject]);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v59 = v57;
        }
        else {
          uint64_t v59 = v57 & 2;
        }
        if ((_DWORD)v59)
        {
          v60 = (void *)objc_opt_class(self);
          id v70 = v60;
          uint64_t v61 = SSHashIfNeeded(v71);
          uint64_t v62 = a6;
          uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue(v61);
          int v77 = 138543618;
          unsigned int v78 = v60;
          __int16 v79 = 2112;
          __int16 v80 = v63;
          unsigned int v64 = (void *)_os_log_send_and_compose_impl( v59,  0LL,  0LL,  0LL,  &_mh_execute_header,  v58,  0LL,  "%{public}@: Public key not found, copy failed for DSID: %@. Generating new keypair.",  &v77,  22);

          a6 = v62;
          if (!v64)
          {
LABEL_63:

            uint64_t v73 = v13;
            id v11 = (id)objc_claimAutoreleasedReturnValue( -[DaemonBiometricKeychain _regenerateKeychainTokensForAccountIdentifier:purpose:error:]( self,  "_regenerateKeychainTokensForAccountIdentifier:purpose:error:",  v10,  a4,  &v73));
            uint64_t v55 = v73;
            goto LABEL_48;
          }

          uint64_t v58 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v64,  4LL));
          free(v64);
          SSFileLog(v21, @"%@");
        }

        goto LABEL_63;
      }

      uint64_t v69 = a6;
      uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
      if (!v45) {
        uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v46 = [v45 shouldLog];
      else {
        unsigned int v47 = v46;
      }
      uint64_t v48 = (os_log_s *)objc_claimAutoreleasedReturnValue([v45 OSLogObject]);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v49 = v47;
      }
      else {
        uint64_t v49 = v47 & 2;
      }
      if ((_DWORD)v49)
      {
        id v50 = (void *)objc_opt_class(self);
        id v51 = v50;
        uint64_t v52 = SSHashIfNeeded(v71);
        uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
        int v77 = 138543618;
        unsigned int v78 = v50;
        __int16 v79 = 2112;
        __int16 v80 = v53;
        id v54 = (void *)_os_log_send_and_compose_impl( v49,  0LL,  0LL,  0LL,  &_mh_execute_header,  v48,  0LL,  "%{public}@: Public key not found, copy failed for DSID: %@. Generating new key-pair.",  &v77,  22);

        a6 = v69;
        if (!v54)
        {
LABEL_47:

          uint64_t v72 = v13;
          id v11 = (id)objc_claimAutoreleasedReturnValue( -[DaemonBiometricKeychain _regenerateKeychainTokensForAccountIdentifier:purpose:error:]( self,  "_regenerateKeychainTokensForAccountIdentifier:purpose:error:",  v10,  a4,  &v72));
          uint64_t v55 = v72;
LABEL_48:
          id v32 = v55;

          goto LABEL_49;
        }

        uint64_t v48 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v54,  4LL));
        free(v54);
        SSFileLog(v45, @"%@");
      }

      goto LABEL_47;
    }

    id v11 = 0LL;
  }

  if (a6) {
LABEL_33:
  }
    *a6 = v13;
LABEL_34:

  return v11;
}

- (id)_queryForPrivateKeyWithLabel:(id)a3 prompt:(id)a4
{
  return -[DaemonBiometricKeychain _queryForPrivateKeyWithLabel:prompt:useTokenID:]( self,  "_queryForPrivateKeyWithLabel:prompt:useTokenID:",  a3,  a4,  1LL);
}

- (id)_queryForPrivateKeyWithLabel:(id)a3 prompt:(id)a4 useTokenID:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v12) {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v13 = [v12 shouldLog];
    else {
      LODWORD(v14) = v13;
    }
    unsigned int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 OSLogObject]);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v14 = v14;
    }
    else {
      v14 &= 2u;
    }
    if ((_DWORD)v14)
    {
      int v19 = 138543362;
      id v20 = (id)objc_opt_class(self);
      id v16 = v20;
      id v17 = (void *)_os_log_send_and_compose_impl( v14,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "%{public}@: Query dictionary failed with no label",  &v19,  12);

      if (!v17)
      {
LABEL_19:

        id v11 = 0LL;
        goto LABEL_20;
      }

      unsigned int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v17,  4LL));
      free(v17);
      SSFileLog(v12, @"%@");
    }

    goto LABEL_19;
  }

  id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", kSecClassKey, kSecClass);
  -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", kSecAttrKeyClassPrivate, kSecAttrKeyClass);
  -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", &__kCFBooleanTrue, kSecReturnRef);
  -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v8, kSecAttrLabel);
  if (v9) {
    -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v9, kSecUseOperationPrompt);
  }
  if (v5) {
    -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", kSecAttrTokenIDSecureEnclave, kSecAttrTokenID);
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  v10));

LABEL_20:
  return v11;
}

- (id)_regenerateKeychainTokensForAccountIdentifier:(id)a3 purpose:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v40 = 0LL;
  id v41 = &v40;
  uint64_t v42 = 0x3032000000LL;
  uint64_t v43 = sub_1000B6CA8;
  __int16 v44 = sub_1000B6CB8;
  id v45 = 0LL;
  uint64_t v34 = 0LL;
  unsigned int v35 = &v34;
  uint64_t v36 = 0x3032000000LL;
  uint64_t v37 = sub_1000B6CA8;
  v38 = sub_1000B6CB8;
  id v39 = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v8));
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0LL);
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000BD358;
  block[3] = &unk_10034D980;
  id v31 = &v40;
  block[4] = self;
  id v12 = v8;
  id v32 = &v34;
  int64_t v33 = a4;
  id v28 = v12;
  id v13 = v9;
  id v29 = v13;
  uint64_t v14 = v10;
  uint64_t v30 = v14;
  dispatch_async(dispatchQueue, block);
  dispatch_time_t v15 = dispatch_time(0LL, 5000000000LL);
  dispatch_semaphore_wait(v14, v15);
  if (!v41[5] && !v35[5])
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v16) {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    LODWORD(v17) = [v16 shouldLog];
    unsigned int v18 = [v16 shouldLogToDisk];
    int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 OSLogObject]);
    id v20 = v19;
    if (v18) {
      LODWORD(v17) = v17 | 2;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v17 = v17;
    }
    else {
      v17 &= 2u;
    }
    if ((_DWORD)v17)
    {
      id v21 = (id)objc_opt_class(self);
      uint64_t v22 = SSHashIfNeeded(v13);
      unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      int v46 = 138543618;
      id v47 = v21;
      __int16 v48 = 2112;
      uint64_t v49 = v23;
      uint64_t v24 = (void *)_os_log_send_and_compose_impl( v17,  0LL,  0LL,  0LL,  &_mh_execute_header,  v20,  0LL,  "%{public}@: Regenerate keychain tokens timed out for DSID: %@",  &v46,  22);

      if (!v24)
      {
LABEL_14:

        goto LABEL_15;
      }

      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v24,  4LL));
      free(v24);
      SSFileLog(v16, @"%@");
    }

    goto LABEL_14;
  }

- (id)_signData:(id)a3 context:(id)a4 error:(id *)a5
{
  if (a5) {
    *a5 = 0LL;
  }
  return 0LL;
}

- (void).cxx_destruct
{
}

@end