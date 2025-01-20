@interface IDSDeviceIDEncrypter
- (BOOL)forceLegacy;
- (IDSDAccountController)accountController;
- (IDSDeviceIDEncrypter)initWithPublicKeyStorage:(id)a3 accountController:(id)a4 fullDeviceIdentityContainerEncrypter:(id)a5 rateLimiter:(id)a6 forceLegacy:(BOOL)a7;
- (IDSMPFullDeviceIdentityContainerEncrypter)fullDeviceIdentityContainerEncrypter;
- (IDSPublicKeyStorage)publicKeyStorage;
- (IDSRateLimiter)rateLimiter;
- (NSString)deviceID;
- (id)_decryptData:(id)a3 usingIdentifier:(id)a4 isRetry:(BOOL)a5;
- (id)_decryptData:(id)a3 usingIdentifier:(id)a4 isRetry:(BOOL)a5 error:(id *)a6;
- (id)_legacyEncryptData:(id)a3 withEncryptedAttributes:(id)a4 error:(id *)a5;
- (id)_validateDecryptionParametersWithError:(id *)a3;
- (id)decryptData:(id)a3 usingIdentifier:(id)a4 isRetry:(BOOL)a5 onQueue:(id)a6 error:(id *)a7;
- (id)legacyEncryptData:(id)a3 withEncryptedAttributes:(id)a4 onQueue:(id)a5 error:(id *)a6;
- (void)decryptData:(id)a3 decryptionContext:(id)a4 usingIdentifier:(id)a5 onQueue:(id)a6 isRetry:(BOOL)a7 replayKey:(id)a8 withCompletion:(id)a9;
- (void)decryptData:(id)a3 usingIdentifier:(id)a4 onQueue:(id)a5 isRetry:(BOOL)a6 replayKey:(id)a7 withCompletion:(id)a8;
- (void)legacyEncryptData:(id)a3 withEncryptedAttributes:(id)a4 onQueue:(id)a5 withCompletion:(id)a6;
- (void)setDeviceID:(id)a3;
@end

@implementation IDSDeviceIDEncrypter

- (IDSDeviceIDEncrypter)initWithPublicKeyStorage:(id)a3 accountController:(id)a4 fullDeviceIdentityContainerEncrypter:(id)a5 rateLimiter:(id)a6 forceLegacy:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___IDSDeviceIDEncrypter;
  v17 = -[IDSDeviceIDEncrypter init](&v20, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_publicKeyStorage, a3);
    objc_storeStrong((id *)&v18->_accountController, a4);
    objc_storeStrong((id *)&v18->_fullDeviceIdentityContainerEncrypter, a5);
    objc_storeStrong((id *)&v18->_rateLimiter, a6);
    v18->_forceLegacy = a7;
  }

  return v18;
}

- (id)_legacyEncryptData:(id)a3 withEncryptedAttributes:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeviceIDEncrypter deviceID](self, "deviceID"));
  unsigned int v11 = [v10 isEqualToString:IDSDeviceDefaultPairedDeviceUniqueID];

  if (v11)
  {
    uint64_t v12 = OSLogHandleForIDSCategory("Warning");
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Tried to PK to default paired device!! -- failing",  buf,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v14))
    {
      _IDSWarnV(@"IDSFoundation", @"Tried to PK to default paired device!! -- failing");
      _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"Tried to PK to default paired device!! -- failing");
      _IDSLogTransport(@"Warning", @"IDS", @"Tried to PK to default paired device!! -- failing");
    }

    if (a5)
    {
      id v15 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IDSEncryptionErrorDomain,  2LL,  0LL));
LABEL_17:
      v18 = 0LL;
      *a5 = v15;
      goto LABEL_26;
    }

    goto LABEL_18;
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeviceIDEncrypter deviceID](self, "deviceID"));

  if (!v16)
  {
    uint64_t v19 = OSLogHandleForIDSCategory("Warning");
    objc_super v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Tried to encrypt to nil device ID -- failing",  buf,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v21))
    {
      _IDSWarnV(@"IDSFoundation", @"Tried to encrypt to nil device ID -- failing");
      _IDSLogV(0LL, @"IDSFoundation", @"Warning", @"Tried to encrypt to nil device ID -- failing");
      _IDSLogTransport(@"Warning", @"IDS", @"Tried to encrypt to nil device ID -- failing");
    }

    if (a5)
    {
      id v15 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IDSEncryptionErrorDomain,  3LL,  0LL));
      goto LABEL_17;
    }

- (id)_validateDecryptionParametersWithError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeviceIDEncrypter deviceID](self, "deviceID"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPublicKeyStorage publicDeviceIdentityContainerForDeviceID:]( self->_publicKeyStorage,  "publicDeviceIdentityContainerForDeviceID:",  self->_deviceID));
    v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }

    else
    {
      uint64_t v13 = OSLogHandleForIDSCategory("Warning");
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeviceIDEncrypter deviceID](self, "deviceID"));
        *(_DWORD *)buf = 138412290;
        uint64_t v21 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Missing identity to decrypt with {deviceID: %@}",  buf,  0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v16))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeviceIDEncrypter deviceID](self, "deviceID"));
        _IDSWarnV(@"IDSFoundation", @"Missing identity to decrypt with {deviceID: %@}");

        v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeviceIDEncrypter deviceID](self, "deviceID", v17));
        _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"Missing identity to decrypt with {deviceID: %@}");

        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeviceIDEncrypter deviceID](self, "deviceID", v18));
        _IDSLogTransport(@"Warning", @"IDS", @"Missing identity to decrypt with {deviceID: %@}");
      }

      if (a3) {
        *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IDSDecryptionErrorDomain,  4LL,  0LL));
      }
    }

    return v7;
  }

  else
  {
    uint64_t v9 = OSLogHandleForIDSCategory("Warning");
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Tried to encrypt to nil device ID -- failing",  buf,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v11))
    {
      _IDSWarnV(@"IDSFoundation", @"Tried to encrypt to nil device ID -- failing");
      _IDSLogV(0LL, @"IDSFoundation", @"Warning", @"Tried to encrypt to nil device ID -- failing");
      _IDSLogTransport(@"Warning", @"IDS", @"Tried to encrypt to nil device ID -- failing");
    }

    if (a3) {
      *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IDSDecryptionErrorDomain,  3LL,  0LL));
    }
    return 0LL;
  }

- (id)_decryptData:(id)a3 usingIdentifier:(id)a4 isRetry:(BOOL)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDeviceIDEncrypter _validateDecryptionParametersWithError:]( self,  "_validateDecryptionParametersWithError:",  a6));
  if (v11) {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[IDSMPFullDeviceIdentityContainerEncrypter decryptData:withPublicDeviceIdentityContainer:error:usingIdentifier:isRetry:]( self->_fullDeviceIdentityContainerEncrypter,  "decryptData:withPublicDeviceIdentityContainer:error:usingIdentifier:isRetry:",  v9,  v11,  a6,  v10,  0LL));
  }
  else {
    uint64_t v12 = 0LL;
  }

  return v12;
}

- (id)_decryptData:(id)a3 usingIdentifier:(id)a4 isRetry:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  id v14 = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDeviceIDEncrypter _validateDecryptionParametersWithError:]( self,  "_validateDecryptionParametersWithError:",  &v14));
  id v10 = v14;
  if (v9)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[IDSMPFullDeviceIdentityContainerEncrypter decryptData:decryptionContext:withPublicDeviceIdentityContainer:usingIdentifier:isRetry:]( self->_fullDeviceIdentityContainerEncrypter,  "decryptData:decryptionContext:withPublicDeviceIdentityContainer:usingIdentifier:isRetry:",  v7,  0LL,  v9,  v8,  0LL));
  }

  else
  {
    id v12 = objc_alloc_init(&OBJC_CLASS___CUTUnsafePromiseSeal);
    [v12 failWithError:v10];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v12 promise]);
  }

  return v11;
}

- (id)legacyEncryptData:(id)a3 withEncryptedAttributes:(id)a4 onQueue:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v29 = 0LL;
  v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  v32 = sub_100071250;
  v33 = sub_100071260;
  id v34 = 0LL;
  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  v26 = sub_100071250;
  v27 = sub_100071260;
  id v28 = 0LL;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100071268;
  v18[3] = &unk_1008F8710;
  uint64_t v21 = &v29;
  v18[4] = self;
  id v13 = v10;
  id v19 = v13;
  id v14 = v11;
  id v20 = v14;
  uint64_t v22 = &v23;
  [v12 performSyncBlock:v18];
  if (a6)
  {
    id v15 = (void *)v24[5];
    if (v15) {
      *a6 = v15;
    }
  }

  id v16 = (id)v30[5];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v16;
}

- (void)legacyEncryptData:(id)a3 withEncryptedAttributes:(id)a4 onQueue:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDeviceIDEncrypter deviceID](self, "deviceID"));
  unsigned int v15 = [v14 isEqualToString:IDSDeviceDefaultPairedDeviceUniqueID];

  if (v15)
  {
    uint64_t v16 = OSLogHandleForIDSCategory("Warning");
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Tried to PK to default paired device!! -- failing",  buf,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v18))
    {
      _IDSWarnV(@"IDSFoundation", @"Tried to PK to default paired device!! -- failing");
      _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"Tried to PK to default paired device!! -- failing");
      _IDSLogTransport(@"Warning", @"IDS", @"Tried to PK to default paired device!! -- failing");
    }

    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IDSEncryptionErrorDomain,  2LL,  0LL));
    (*((void (**)(id, void, void *, void))v13 + 2))(v13, 0LL, v19, 0LL);
  }

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100071500;
  v24[3] = &unk_1008F8440;
  v24[4] = self;
  id v25 = v10;
  id v27 = v12;
  id v28 = v13;
  id v26 = v11;
  id v20 = v12;
  id v21 = v13;
  id v22 = v11;
  id v23 = v10;
  [v20 performAsyncBlock:v24];
}

- (id)decryptData:(id)a3 usingIdentifier:(id)a4 isRetry:(BOOL)a5 onQueue:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  uint64_t v31 = 0LL;
  v32 = &v31;
  uint64_t v33 = 0x3032000000LL;
  id v34 = sub_100071250;
  v35 = sub_100071260;
  id v36 = 0LL;
  uint64_t v25 = 0LL;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  id v28 = sub_100071250;
  uint64_t v29 = sub_100071260;
  id v30 = 0LL;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100071CAC;
  v19[3] = &unk_1008F8738;
  id v22 = &v31;
  v19[4] = self;
  id v15 = v12;
  id v20 = v15;
  id v16 = v13;
  BOOL v24 = a5;
  id v21 = v16;
  id v23 = &v25;
  [v14 performSyncBlock:v19];
  if (a7) {
    *a7 = (id) v26[5];
  }
  id v17 = (id)v32[5];

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v17;
}

- (void)decryptData:(id)a3 usingIdentifier:(id)a4 onQueue:(id)a5 isRetry:(BOOL)a6 replayKey:(id)a7 withCompletion:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100071E20;
  v19[3] = &unk_1008F87B0;
  v19[4] = self;
  id v20 = v13;
  BOOL v24 = a6;
  id v22 = a5;
  id v23 = a8;
  id v21 = v14;
  id v15 = v22;
  id v16 = v23;
  id v17 = v14;
  id v18 = v13;
  [v15 performAsyncBlock:v19];
}

- (void)decryptData:(id)a3 decryptionContext:(id)a4 usingIdentifier:(id)a5 onQueue:(id)a6 isRetry:(BOOL)a7 replayKey:(id)a8 withCompletion:(id)a9
{
}

- (IDSPublicKeyStorage)publicKeyStorage
{
  return self->_publicKeyStorage;
}

- (IDSDAccountController)accountController
{
  return self->_accountController;
}

- (IDSRateLimiter)rateLimiter
{
  return self->_rateLimiter;
}

- (BOOL)forceLegacy
{
  return self->_forceLegacy;
}

- (IDSMPFullDeviceIdentityContainerEncrypter)fullDeviceIdentityContainerEncrypter
{
  return self->_fullDeviceIdentityContainerEncrypter;
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end