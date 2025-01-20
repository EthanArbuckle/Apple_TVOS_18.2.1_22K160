@interface IDSMPFullDeviceIdentityContainerEncrypter
- (BOOL)verifySignedData:(id)a3 matchesData:(id)a4 forType:(int64_t)a5 withPublicDeviceIdentity:(id)a6 error:(id *)a7;
- (BOOL)verifySignedData:(id)a3 matchesData:(id)a4 withSecPublicDeviceIdentity:(__SecKey *)a5 diversifier:(id)a6 error:(id *)a7;
- (IDSMPFullDeviceIdentityContainerEncrypter)initWithRegistrationKeyManager:(id)a3;
- (IDSRegistrationKeyManager)registrationKeyManager;
- (id)_validateParametersWithFullIdentityToUse:(id)a3 fullIdentity:(id)a4 publicIdentity:(id)a5 inputData:(id)a6 identifier:(id)a7 forDecryption:(BOOL)a8;
- (id)batchSignDatas:(id)a3 withType:(int64_t)a4 error:(id *)a5;
- (id)decryptData:(id)a3 decryptionContext:(id)a4 withPublicDeviceIdentityContainer:(id)a5 usingIdentifier:(id)a6 isRetry:(BOOL)a7;
- (id)decryptData:(id)a3 withPublicDeviceIdentityContainer:(id)a4 error:(id *)a5 usingIdentifier:(id)a6 isRetry:(BOOL)a7;
- (id)encryptData:(id)a3 encryptionContext:(id)a4 forceSizeOptimizations:(BOOL)a5 resetState:(BOOL)a6 withEncryptedAttributes:(id)a7 withPublicDeviceIdentityContainer:(id)a8 usedIdentifier:(id *)a9 metadata:(id *)a10 error:(id *)a11;
- (id)legacyEncryptData:(id)a3 withEncryptedAttributes:(id)a4 withPublicDeviceIdentityContainer:(id)a5 error:(id *)a6;
- (id)offGridKeyDistributionEncryptData:(id)a3 encryptionContext:(id)a4 withPublicDeviceIdentityContainer:(id)a5 error:(id *)a6;
- (id)signData:(id)a3 usingApplicationKeyIndex:(unsigned __int16)a4 diversifier:(id)a5 error:(id *)a6;
- (id)signData:(id)a3 withSignatureType:(int64_t)a4 error:(id *)a5;
@end

@implementation IDSMPFullDeviceIdentityContainerEncrypter

- (IDSMPFullDeviceIdentityContainerEncrypter)initWithRegistrationKeyManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___IDSMPFullDeviceIdentityContainerEncrypter;
  v6 = -[IDSMPFullDeviceIdentityContainerEncrypter init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_registrationKeyManager, a3);
  }

  return v7;
}

- (id)legacyEncryptData:(id)a3 withEncryptedAttributes:(id)a4 withPublicDeviceIdentityContainer:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void *)objc_claimAutoreleasedReturnValue( -[IDSRegistrationKeyManager fullDeviceIdentityContainerUsableForKeyType:]( self->_registrationKeyManager,  "fullDeviceIdentityContainerUsableForKeyType:",  1LL));
  v14 = (void *)objc_claimAutoreleasedReturnValue( -[IDSRegistrationKeyManager fullDeviceIdentityContainer]( self->_registrationKeyManager,  "fullDeviceIdentityContainer"));
  uint64_t v15 = IDSMPLegacyIdentityIdentifier;
  v16 = (void *)objc_claimAutoreleasedReturnValue( -[IDSMPFullDeviceIdentityContainerEncrypter _validateParametersWithFullIdentityToUse:fullIdentity:publicIdentity:inputData:identifier:forDecryption:]( self,  "_validateParametersWithFullIdentityToUse:fullIdentity:publicIdentity:inputData:identifier:forDecryption:",  v13,  v14,  v12,  v10,  IDSMPLegacyIdentityIdentifier,  0LL));
  if (v16)
  {
    uint64_t v17 = OSLogHandleForIDSCategory("Warning");
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v34 = v12;
      __int16 v35 = 2112;
      v36 = v13;
      __int16 v37 = 2048;
      id v38 = [v10 length];
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Invalid encryption parameters (using) -- failing {publicDeviceIdentityContainer: %@, fullIdentity: %@, inputDataLength: %llu",  buf,  0x20u);
    }

    if (os_log_shim_legacy_logging_enabled(v19))
    {
      id v30 = [v10 length];
      _IDSWarnV( @"IDSFoundation",  @"Invalid encryption parameters (using) -- failing {publicDeviceIdentityContainer: %@, fullIdentity: %@, inputDataLength: %llu");
      id v31 = objc_msgSend(v10, "length", v12, v13, v30);
      _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"Invalid encryption parameters (using) -- failing {publicDeviceIdentityContainer: %@, fullIdentity: %@, inputDataLength: %llu");
      objc_msgSend(v10, "length", v12, v13, v31);
      _IDSLogTransport( @"Warning",  @"IDS",  @"Invalid encryption parameters (using) -- failing {publicDeviceIdentityContainer: %@, fullIdentity: %@, inputDataLength: %llu");
    }

    v20 = 0LL;
    if (a6) {
      *a6 = v16;
    }
  }

  else
  {
    uint64_t v21 = OSLogHandleForIDSCategory("Encryption");
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v13;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Using full identity: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v23) && _IDSShouldLog(0LL, @"Encryption"))
    {
      v29 = v13;
      _IDSLogV(0LL, @"IDSFoundation", @"Encryption", @"Using full identity: %@");
    }

    id v32 = 0LL;
    v20 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v12,  "legacySealMessage:withEncryptedAttributes:signedByFullIdentity:usingIdentitiesWithIdentifier:error:",  v10,  v11,  v13,  v15,  &v32,  v29));
    id v24 = v32;
    if (!v20)
    {
      uint64_t v25 = OSLogHandleForIDSCategory("Encryption");
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v34 = v24;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "   Public/Private encryption failed with error: %@",  buf,  0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v27)
        && _IDSShouldLog(0LL, @"Encryption"))
      {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"Encryption",  @"   Public/Private encryption failed with error: %@");
      }

      if (a6) {
        *a6 = v24;
      }
    }
  }

  return v20;
}

- (id)offGridKeyDistributionEncryptData:(id)a3 encryptionContext:(id)a4 withPublicDeviceIdentityContainer:(id)a5 error:(id *)a6
{
  id v37 = a3;
  id v36 = a4;
  id v38 = a5;
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( -[IDSRegistrationKeyManager fullDeviceIdentityContainerUsableForKeyType:]( self->_registrationKeyManager,  "fullDeviceIdentityContainerUsableForKeyType:",  2LL));
  id v34 = (void *)objc_claimAutoreleasedReturnValue( -[IDSRegistrationKeyManager fullDeviceIdentityContainer]( self->_registrationKeyManager,  "fullDeviceIdentityContainer"));
  id v35 = (id)objc_claimAutoreleasedReturnValue( -[IDSMPFullDeviceIdentityContainerEncrypter _validateParametersWithFullIdentityToUse:fullIdentity:publicIdentity:inputData:identifier:forDecryption:]( self,  "_validateParametersWithFullIdentityToUse:fullIdentity:publicIdentity:inputData:identifier:forDecryption:",  v9,  v34,  v38,  v37,  IDSPaddyIdentityIdentifier,  0LL));
  if (v35)
  {
    uint64_t v10 = OSLogHandleForIDSCategory("Warning");
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v41 = v38;
      __int16 v42 = 2112;
      v43 = v9;
      __int16 v44 = 2048;
      id v45 = [v37 length];
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Invalid encryption parameters -- failing {publicDeviceIdentityContainer: %@, fullIdentity: %@, inputDataLength: %llu}",  buf,  0x20u);
    }

    if (os_log_shim_legacy_logging_enabled(v12))
    {
      id v30 = [v37 length];
      _IDSWarnV( @"IDSFoundation",  @"Invalid encryption parameters -- failing {publicDeviceIdentityContainer: %@, fullIdentity: %@, inputDataLength: %llu}");
      id v31 = objc_msgSend(v37, "length", v38, v9, v30);
      _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"Invalid encryption parameters -- failing {publicDeviceIdentityContainer: %@, fullIdentity: %@, inputDataLength: %llu}");
      objc_msgSend(v37, "length", v38, v9, v31);
      _IDSLogTransport( @"Warning",  @"IDS",  @"Invalid encryption parameters -- failing {publicDeviceIdentityContainer: %@, fullIdentity: %@, inputDataLength: %llu}");
    }

    v13 = 0LL;
    if (a6) {
      *a6 = v35;
    }
  }

  else
  {
    uint64_t v14 = OSLogHandleForIDSCategory("Encryption");
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v41 = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Using full identity: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v16) && _IDSShouldLog(0LL, @"Encryption"))
    {
      v29 = v9;
      _IDSLogV(0LL, @"IDSFoundation", @"Encryption", @"Using full identity: %@");
    }

    id v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "sendingURI", v29));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v32 prefixedURI]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v36 sendingPushToken]);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 rawToken]);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v36 receivingURI]);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 prefixedURI]);
    v22 = (void *)objc_claimAutoreleasedReturnValue([v36 receivingPushToken]);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 rawToken]);
    id v39 = 0LL;
    v13 = (void *)objc_claimAutoreleasedReturnValue( [v38 sealPaddyMessage:v37 sendingURI:v17 sendingPushToken:v19 receivingURI:v21 receivingPushToken:v23 signedByFullIdentity:v9 error:&v39]);
    id v24 = v39;

    if (!v13)
    {
      uint64_t v25 = OSLogHandleForIDSCategory("Encryption");
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v41 = v24;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "   Paddy sender key encryption failed with error: %@",  buf,  0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v27)
        && _IDSShouldLog(0LL, @"Encryption"))
      {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"Encryption",  @"   Paddy sender key encryption failed with error: %@");
      }

      if (a6) {
        *a6 = v24;
      }
    }
  }

  return v13;
}

- (id)encryptData:(id)a3 encryptionContext:(id)a4 forceSizeOptimizations:(BOOL)a5 resetState:(BOOL)a6 withEncryptedAttributes:(id)a7 withPublicDeviceIdentityContainer:(id)a8 usedIdentifier:(id *)a9 metadata:(id *)a10 error:(id *)a11
{
  id v71 = a3;
  id v70 = a4;
  id v67 = a7;
  id v16 = a8;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 ngmPublicDeviceIdentity]);
  v18 = v17;
  if (v17) {
    uint64_t v19 = 2LL;
  }
  else {
    uint64_t v19 = 1LL;
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue( -[IDSRegistrationKeyManager fullDeviceIdentityContainerUsableForKeyType:]( self->_registrationKeyManager,  "fullDeviceIdentityContainerUsableForKeyType:",  v19));
  v68 = (void *)objc_claimAutoreleasedReturnValue( -[IDSRegistrationKeyManager fullDeviceIdentityContainer]( self->_registrationKeyManager,  "fullDeviceIdentityContainer"));
  uint64_t v21 = (void *)IDSMPLegacyIdentityIdentifier;
  if (a9) {
    uint64_t v22 = IDSMPLegacyIdentityIdentifier;
  }
  else {
    uint64_t v22 = 0LL;
  }
  id v69 = (id)objc_claimAutoreleasedReturnValue( -[IDSMPFullDeviceIdentityContainerEncrypter _validateParametersWithFullIdentityToUse:fullIdentity:publicIdentity:inputData:identifier:forDecryption:]( self,  "_validateParametersWithFullIdentityToUse:fullIdentity:publicIdentity:inputData:identifier:forDecryption:",  v20,  v68,  v16,  v71,  v22,  0LL));
  if (v69)
  {
    uint64_t v23 = OSLogHandleForIDSCategory("Warning");
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      id v75 = v16;
      __int16 v76 = 2112;
      v77 = v20;
      __int16 v78 = 2048;
      id v79 = [v71 length];
      __int16 v80 = 2048;
      v81 = a9;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "Invalid encryption parameters (used) -- failing {publicDeviceIdentityContainer: %@, fullIdentity: %@, inputDataL ength: %llu, identifier: %p}",  buf,  0x2Au);
    }

    if (os_log_shim_legacy_logging_enabled(v25))
    {
      id v53 = [v71 length];
      _IDSWarnV( @"IDSFoundation",  @"Invalid encryption parameters (used) -- failing {publicDeviceIdentityContainer: %@, fullIdentity: %@, inputDataLength: %llu, identifier: %p}");
      id v54 = objc_msgSend(v71, "length", v16, v20, v53, a9);
      _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"Invalid encryption parameters (used) -- failing {publicDeviceIdentityContainer: %@, fullIdentity: %@, inputDataLength: %llu, identifier: %p}");
      objc_msgSend(v71, "length", v16, v20, v54, a9);
      _IDSLogTransport( @"Warning",  @"IDS",  @"Invalid encryption parameters (used) -- failing {publicDeviceIdentityContainer: %@, fullIdentity: %@, inputDataLength: %llu, identifier: %p}");
    }

    if (a11) {
      *a11 = v69;
    }
    v26 = 0LL;
    if (a9 && !v20)
    {
      if (v18) {
        uint64_t v27 = (void *)IDSNGMDeviceIdentityIdentifier;
      }
      else {
        uint64_t v27 = v21;
      }
      v26 = 0LL;
      *a9 = v27;
    }
  }

  else
  {
    uint64_t v28 = OSLogHandleForIDSCategory("Encryption");
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v75 = v20;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Using full identity: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v30) && _IDSShouldLog(0LL, @"Encryption"))
    {
      v48 = v20;
      _IDSLogV(0LL, @"IDSFoundation", @"Encryption", @"Using full identity: %@");
    }

    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "guid", v48));
    v66 = (void *)objc_claimAutoreleasedReturnValue([v70 sendingURI]);
    v65 = (void *)objc_claimAutoreleasedReturnValue([v70 sendingPushToken]);
    v64 = (id *)objc_claimAutoreleasedReturnValue([v70 receivingURI]);
    v63 = (void *)objc_claimAutoreleasedReturnValue([v70 receivingPushToken]);
    v61 = (void *)objc_claimAutoreleasedReturnValue([v70 authenticatedData]);
    id v31 = [v70 messageType];
    uint64_t v32 = OSLogHandleForIDSCategory("Encryption");
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413826;
      id v75 = v62;
      __int16 v76 = 2112;
      v77 = v66;
      __int16 v78 = 2112;
      id v79 = v65;
      __int16 v80 = 2112;
      v81 = v64;
      __int16 v82 = 2112;
      v83 = v63;
      __int16 v84 = 2112;
      v85 = v61;
      __int16 v86 = 2048;
      id v87 = v31;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Calling into sealMessage with {guid:%@, sendingURI:%@, sendingPushToken:%@, receivingURI:%@, receivingPushToken: %@, authenticatedData:%@, messageType:%ld}",  buf,  0x48u);
    }

    if (os_log_shim_legacy_logging_enabled(v34) && _IDSShouldLog(0LL, @"Encryption"))
    {
      v58 = v61;
      id v59 = v31;
      v56 = v64;
      v57 = v63;
      v51 = v66;
      v52 = v65;
      v49 = v62;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"Encryption",  @"Calling into sealMessage with {guid:%@, sendingURI:%@, sendingPushToken:%@, receivingURI:%@, receivingPushToken:%@, authenticatedData:%@, messageType:%ld}");
    }

    id v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "prefixedURI", v49, v51, v52, v56, v57, v58, v59));
    id v36 = (void *)objc_claimAutoreleasedReturnValue([v65 rawToken]);
    id v37 = (void *)objc_claimAutoreleasedReturnValue([v64 prefixedURI]);
    id v38 = (void *)objc_claimAutoreleasedReturnValue([v63 rawToken]);
    id v72 = 0LL;
    id v73 = 0LL;
    BYTE1(v55) = a6;
    LOBYTE(v55) = a5;
    v26 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v16,  "sealMessage:authenticatedData:messageType:guid:sendingURI:sendingPushToken:receivingURI:receivingP ushToken:forceSizeOptimizations:resetState:withEncryptedAttributes:signedByFullIdentity:usedIdenti tyWithIdentifier:error:additionalResult:",  v71,  v61,  v31,  v62,  v35,  v36,  v37,  v38,  v55,  v67,  v20,  a9,  &v73,  &v72));
    id v39 = v73;
    id v40 = v72;

    id v41 = -[IDSEncryptionMetadata initWithAdditionalEncryptionResult:]( objc_alloc(&OBJC_CLASS___IDSEncryptionMetadata),  "initWithAdditionalEncryptionResult:",  v40);
    __int16 v42 = v41;
    if (a10) {
      *a10 = v41;
    }
    if (!v26)
    {
      uint64_t v43 = OSLogHandleForIDSCategory("Encryption");
      __int16 v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v75 = v39;
        _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "   Public/Private encryption failed with error: %@",  buf,  0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v45)
        && _IDSShouldLog(0LL, @"Encryption"))
      {
        id v50 = v39;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"Encryption",  @"   Public/Private encryption failed with error: %@");
      }

      if (a11) {
        *a11 = v39;
      }
      if (objc_msgSend(*a9, "isEqualToString:", IDSNGMDeviceIdentityIdentifier, v50))
      {
        v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMIDSLog encryption](&OBJC_CLASS___IMIDSLog, "encryption"));
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
          sub_1006959A8((uint64_t)v39, v46);
        }
      }
    }
  }

  return v26;
}

- (id)decryptData:(id)a3 withPublicDeviceIdentityContainer:(id)a4 error:(id *)a5 usingIdentifier:(id)a6 isRetry:(BOOL)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[IDSRegistrationKeyManager fullDeviceIdentityContainer]( self->_registrationKeyManager,  "fullDeviceIdentityContainer"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[IDSMPFullDeviceIdentityContainerEncrypter _validateParametersWithFullIdentityToUse:fullIdentity:publicIdentity:inputData:identifier:forDecryption:]( self,  "_validateParametersWithFullIdentityToUse:fullIdentity:publicIdentity:inputData:identifier:forDecryption:",  v14,  0LL,  v12,  v11,  v13,  1LL));
  if (v15)
  {
    uint64_t v16 = OSLogHandleForIDSCategory("Warning");
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      id v41 = v12;
      __int16 v42 = 2112;
      uint64_t v43 = v14;
      __int16 v44 = 2048;
      id v45 = [v11 length];
      __int16 v46 = 2048;
      id v47 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Invalid decryption parameters -- failing {publicDeviceIdentityContainer: %@, fullIdentity: %@, inputDataLength: %llu, identifier: %p}",  buf,  0x2Au);
    }

    if (os_log_shim_legacy_logging_enabled(v18))
    {
      id v36 = [v11 length];
      _IDSWarnV( @"IDSFoundation",  @"Invalid decryption parameters -- failing {publicDeviceIdentityContainer: %@, fullIdentity: %@, inputDataLength: %llu, identifier: %p}");
      id v37 = objc_msgSend(v11, "length", v12, v14, v36, v13);
      _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"Invalid decryption parameters -- failing {publicDeviceIdentityContainer: %@, fullIdentity: %@, inputDataLength: %llu, identifier: %p}");
      objc_msgSend(v11, "length", v12, v14, v37, v13);
      _IDSLogTransport( @"Warning",  @"IDS",  @"Invalid decryption parameters -- failing {publicDeviceIdentityContainer: %@, fullIdentity: %@, inputDataLength: %llu, identifier: %p}");
    }

    uint64_t v19 = 0LL;
    if (a5) {
      *a5 = v15;
    }
  }

  else
  {
    uint64_t v20 = OSLogHandleForIDSCategory("Encryption");
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v41 = v14;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Using full identity: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v22) && _IDSShouldLog(0LL, @"Encryption"))
    {
      v33 = v14;
      _IDSLogV(0LL, @"IDSFoundation", @"Encryption", @"Using full identity: %@");
    }

    id v39 = 0LL;
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v14,  "unsealMessage:signedByPublicIdentity:usingIdentityWithIdentifier:error:",  v11,  v12,  v13,  &v39,  v33));
    id v23 = v39;
    if (v19)
    {
      id v24 = v14;
    }

    else
    {
      uint64_t v25 = OSLogHandleForIDSCategory("Encryption");
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v41 = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "   Public/Private decryption failed with error: %@",  buf,  0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v27)
        && _IDSShouldLog(0LL, @"Encryption"))
      {
        id v34 = v23;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"Encryption",  @"   Public/Private decryption failed with error: %@");
      }

      id v24 = (void *)objc_claimAutoreleasedReturnValue( -[IDSRegistrationKeyManager previousFullDeviceIdentityContainer]( self->_registrationKeyManager,  "previousFullDeviceIdentityContainer",  v34));

      if (v24)
      {
        uint64_t v28 = OSLogHandleForIDSCategory("Encryption");
        v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v41 = v24;
          _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Using previous full identity: %@",  buf,  0xCu);
        }

        if (os_log_shim_legacy_logging_enabled(v30)
          && _IDSShouldLog(0LL, @"Encryption"))
        {
          id v35 = v24;
          _IDSLogV(0LL, @"IDSFoundation", @"Encryption", @"Using previous full identity: %@");
        }

        id v38 = 0LL;
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v24,  "unsealMessage:signedByPublicIdentity:usingIdentityWithIdentifier:error:",  v11,  v12,  v13,  &v38,  v35));
        id v31 = v38;
        if (a5 && !v19) {
          *a5 = v23;
        }
      }

      else
      {
        id v24 = 0LL;
        uint64_t v19 = 0LL;
        if (a5) {
          *a5 = v23;
        }
      }
    }

    uint64_t v14 = v24;
  }

  return v19;
}

- (id)decryptData:(id)a3 decryptionContext:(id)a4 withPublicDeviceIdentityContainer:(id)a5 usingIdentifier:(id)a6 isRetry:(BOOL)a7
{
  id v44 = a3;
  id v43 = a4;
  id v45 = a5;
  id v11 = a6;
  id v41 = self->_registrationKeyManager;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationKeyManager fullDeviceIdentityContainer](v41, "fullDeviceIdentityContainer"));
  __int16 v42 = (void *)objc_claimAutoreleasedReturnValue( -[IDSMPFullDeviceIdentityContainerEncrypter _validateParametersWithFullIdentityToUse:fullIdentity:publicIdentity:inputData:identifier:forDecryption:]( self,  "_validateParametersWithFullIdentityToUse:fullIdentity:publicIdentity:inputData:identifier:forDecryption:",  v12,  0LL,  v45,  v44,  v11,  1LL));
  if (v42)
  {
    uint64_t v13 = OSLogHandleForIDSCategory("Warning");
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      id v54 = v45;
      __int16 v55 = 2112;
      v56 = v12;
      __int16 v57 = 2048;
      id v58 = [v44 length];
      __int16 v59 = 2048;
      id v60 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Invalid decryption parameters -- failing {publicDeviceIdentityContainer: %@, fullIdentity: %@, inputDataLength: %llu, identifier: %p}",  buf,  0x2Au);
    }

    if (os_log_shim_legacy_logging_enabled(v15))
    {
      id v34 = [v44 length];
      _IDSWarnV( @"IDSFoundation",  @"Invalid decryption parameters -- failing {publicDeviceIdentityContainer: %@, fullIdentity: %@, inputDataLength: %llu, identifier: %p}");
      id v35 = objc_msgSend(v44, "length", v45, v12, v34, v11);
      _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"Invalid decryption parameters -- failing {publicDeviceIdentityContainer: %@, fullIdentity: %@, inputDataLength: %llu, identifier: %p}");
      objc_msgSend(v44, "length", v45, v12, v35, v11);
      _IDSLogTransport( @"Warning",  @"IDS",  @"Invalid decryption parameters -- failing {publicDeviceIdentityContainer: %@, fullIdentity: %@, inputDataLength: %llu, identifier: %p}");
    }

    id v16 = objc_alloc_init(&OBJC_CLASS___CUTUnsafePromiseSeal);
    [v16 failWithError:v42];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 promise]);
  }

  else
  {
    uint64_t v18 = OSLogHandleForIDSCategory("Encryption");
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v54 = v12;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Using full identity: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v20) && _IDSShouldLog(0LL, @"Encryption"))
    {
      v33 = v12;
      _IDSLogV(0LL, @"IDSFoundation", @"Encryption", @"Using full identity: %@");
    }

    id v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "guid", v33));
    id v40 = (void *)objc_claimAutoreleasedReturnValue([v43 sendingURI]);
    id v39 = (void *)objc_claimAutoreleasedReturnValue([v43 sendingPushToken]);
    id v38 = (void *)objc_claimAutoreleasedReturnValue([v43 receivingURI]);
    id v37 = (void *)objc_claimAutoreleasedReturnValue([v43 receivingPushToken]);
    id v36 = (void *)objc_claimAutoreleasedReturnValue([v43 authenticatedData]);
    id v21 = [v43 messageType];
    uint64_t v22 = OSLogHandleForIDSCategory("Encryption");
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413826;
      id v54 = v16;
      __int16 v55 = 2112;
      v56 = v40;
      __int16 v57 = 2112;
      id v58 = v39;
      __int16 v59 = 2112;
      id v60 = v38;
      __int16 v61 = 2112;
      v62 = v37;
      __int16 v63 = 2112;
      v64 = v36;
      __int16 v65 = 2048;
      id v66 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Calling into unsealMessage with {guid:%@, sendingURI:%@, sendingPushToken:%@, receivingURI:%@, receivingPushToke n:%@, authenticatedData:%@, messageType:%ld}",  buf,  0x48u);
    }

    if (os_log_shim_legacy_logging_enabled(v24) && _IDSShouldLog(0LL, @"Encryption")) {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"Encryption",  @"Calling into unsealMessage with {guid:%@, sendingURI:%@, sendingPushToken:%@, receivingURI:%@, receivingPushToken:%@, authenticatedData:%@, messageType:%ld}");
    }
    id v25 = objc_alloc_init(&OBJC_CLASS___CUTUnsafePromiseSeal);
    v26 = (void *)objc_claimAutoreleasedReturnValue([v40 prefixedURI]);
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v39 rawToken]);
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v38 prefixedURI]);
    v29 = (void *)objc_claimAutoreleasedReturnValue([v37 rawToken]);
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue( [v12 unsealMessage:v44 authenticatedData:v36 messageType:v21 guid:v16 sendingURI:v26 sendingPushToken:v27 receivingURI:v28 receivin gPushToken:v29 signedByPublicIdentity:v45 usingIdentityWithIdentifier:v11]);
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472LL;
    v46[2] = sub_10003B32C;
    v46[3] = &unk_1008F7728;
    id v47 = v41;
    id v48 = v25;
    id v49 = v44;
    id v50 = v43;
    id v51 = v45;
    id v52 = v11;
    id v31 = v25;
    [v30 registerResultBlock:v46];

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v31 promise]);
  }

  return v17;
}

- (id)_validateParametersWithFullIdentityToUse:(id)a3 fullIdentity:(id)a4 publicIdentity:(id)a5 inputData:(id)a6 identifier:(id)a7 forDecryption:(BOOL)a8
{
  BOOL v8 = a8;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  uint64_t v18 = (id *)&IDSDecryptionErrorDomain;
  if (!v8) {
    uint64_t v18 = (id *)&IDSEncryptionErrorDomain;
  }
  id v19 = *v18;
  if (v13)
  {
    if (v15)
    {
      if ([v16 length])
      {
        if (v17)
        {
          uint64_t v20 = 0LL;
          goto LABEL_19;
        }

        BOOL v21 = !v8;
        uint64_t v22 = 19LL;
        uint64_t v23 = 8LL;
      }

      else
      {
        BOOL v21 = !v8;
        uint64_t v22 = 18LL;
        uint64_t v23 = 7LL;
      }
    }

    else
    {
      BOOL v21 = !v8;
      uint64_t v22 = 17LL;
      uint64_t v23 = 4LL;
    }
  }

  else
  {
    BOOL v21 = !v8;
    if (v14) {
      uint64_t v22 = 20LL;
    }
    else {
      uint64_t v22 = 16LL;
    }
    uint64_t v23 = 6LL;
  }

  if (v21) {
    uint64_t v24 = v22;
  }
  else {
    uint64_t v24 = v23;
  }
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v19,  v24,  0LL));
LABEL_19:

  return v20;
}

- (id)signData:(id)a3 withSignatureType:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( -[IDSRegistrationKeyManager fullDeviceIdentityContainer]( self->_registrationKeyManager,  "fullDeviceIdentityContainer"));
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 ngmFullDeviceIdentity]);
    id v20 = 0LL;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 sign:v8 forType:a4 error:&v20]);
    id v13 = v20;

    if (a5 && !v12)
    {
      if (v13)
      {
        NSErrorUserInfoKey v23 = NSUnderlyingErrorKey;
        id v24 = v13;
        id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
        uint64_t v15 = OSLogHandleForIDSCategory("Encryption");
        id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v22 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "MessageProtection Error signing data: %@",  buf,  0xCu);
        }

        if (os_log_shim_legacy_logging_enabled(v17)
          && _IDSShouldLog(0LL, @"Encryption"))
        {
          id v19 = v13;
          _IDSLogV(0LL, @"IDSFoundation", @"Encryption", @"MessageProtection Error signing data: %@");
        }
      }

      else
      {
        id v14 = 0LL;
      }

      *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IDSSigningErrorDomain,  12LL,  v14,  v19));
    }
  }

  else
  {
    id v12 = 0LL;
    if (a5) {
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IDSSigningErrorDomain,  11LL,  0LL));
    }
  }

  return v12;
}

- (id)signData:(id)a3 usingApplicationKeyIndex:(unsigned __int16)a4 diversifier:(id)a5 error:(id *)a6
{
  uint64_t v8 = a4;
  dataToSign = (const __CFData *)a3;
  id v10 = a5;
  if (!-[IDSRegistrationKeyManager fullIdentityForKeyIndex:]( self->_registrationKeyManager,  "fullIdentityForKeyIndex:",  v8)
    || (CFTypeRef v11 = CFRetain( -[IDSRegistrationKeyManager fullIdentityForKeyIndex:]( self->_registrationKeyManager,  "fullIdentityForKeyIndex:",  v8))) == 0LL)
  {
    if (a6)
    {
      CFDataRef v25 = 0LL;
      *a6 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IDSSigningErrorDomain,  11LL,  0LL));
      goto LABEL_40;
    }

- (id)batchSignDatas:(id)a3 withType:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( -[IDSRegistrationKeyManager fullDeviceIdentityContainer]( self->_registrationKeyManager,  "fullDeviceIdentityContainer"));
  id v10 = v9;
  if (v9)
  {
    CFTypeRef v11 = (void *)objc_claimAutoreleasedReturnValue([v9 ngmFullDeviceIdentity]);
    id v21 = 0LL;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 batchSign:v8 forType:a4 error:&v21]);
    id v13 = v21;

    id v14 = [v12 count];
    if (a5 && !v14)
    {
      if (v13)
      {
        NSErrorUserInfoKey v24 = NSUnderlyingErrorKey;
        id v25 = v13;
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));
        uint64_t v16 = OSLogHandleForIDSCategory("Encryption");
        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v23 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "MessageProtection Error signing data: %@",  buf,  0xCu);
        }

        if (os_log_shim_legacy_logging_enabled(v18)
          && _IDSShouldLog(0LL, @"Encryption"))
        {
          id v20 = v13;
          _IDSLogV(0LL, @"IDSFoundation", @"Encryption", @"MessageProtection Error signing data: %@");
        }
      }

      else
      {
        uint64_t v15 = 0LL;
      }

      *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IDSSigningErrorDomain,  12LL,  v15,  v20));
    }
  }

  else
  {
    id v12 = 0LL;
    if (a5) {
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IDSSigningErrorDomain,  11LL,  0LL));
    }
  }

  return v12;
}

- (BOOL)verifySignedData:(id)a3 matchesData:(id)a4 forType:(int64_t)a5 withPublicDeviceIdentity:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = v13;
  if (v13)
  {
    id v25 = 0LL;
    unsigned __int8 v15 = [v13 isValidSignature:v11 forMessage:v12 forType:a5 error:&v25];
    id v16 = v25;
    id v17 = v16;
    if (a7) {
      char v18 = v15;
    }
    else {
      char v18 = 1;
    }
    if ((v18 & 1) == 0)
    {
      if (v16)
      {
        NSErrorUserInfoKey v28 = NSUnderlyingErrorKey;
        id v29 = v16;
        id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v29,  &v28,  1LL));
        uint64_t v20 = OSLogHandleForIDSCategory("Encryption");
        id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v27 = v17;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "MessageProtection Error verifying signing data: %@",  buf,  0xCu);
        }

        if (os_log_shim_legacy_logging_enabled(v22)
          && _IDSShouldLog(0LL, @"Encryption"))
        {
          NSErrorUserInfoKey v24 = v17;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"Encryption",  @"MessageProtection Error verifying signing data: %@");
        }
      }

      else
      {
        id v19 = 0LL;
      }

      *a7 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IDSSigningErrorDomain,  12LL,  v19,  v24));
    }
  }

  else
  {
    unsigned __int8 v15 = 0;
    if (a7) {
      *a7 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IDSSigningErrorDomain,  10LL,  0LL));
    }
  }

  return v15;
}

- (BOOL)verifySignedData:(id)a3 matchesData:(id)a4 withSecPublicDeviceIdentity:(__SecKey *)a5 diversifier:(id)a6 error:(id *)a7
{
  id v11 = (const __CFData *)a3;
  id v12 = (const __CFData *)a4;
  id v13 = a6;
  id v14 = v13;
  if (!a5)
  {
    if (a7)
    {
      id v15 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IDSSigningErrorDomain,  10LL,  0LL));
      goto LABEL_7;
    }

- (IDSRegistrationKeyManager)registrationKeyManager
{
  return self->_registrationKeyManager;
}

- (void).cxx_destruct
{
}

@end