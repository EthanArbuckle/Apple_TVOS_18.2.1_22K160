@interface PDRemoteAssetDecryptionManager
- (BOOL)assetRequiresDecryption:(id)a3;
- (BOOL)decryptAsset:(id)a3 forPass:(id)a4;
- (PDRemoteAssetDecryptionManager)init;
- (id)_decryptKMLData:(id)a3 ephemeralPublicKey:(id)a4 pass:(id)a5;
- (id)_decryptSESDDict:(id)a3 pass:(id)a4;
@end

@implementation PDRemoteAssetDecryptionManager

- (PDRemoteAssetDecryptionManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PDRemoteAssetDecryptionManager;
  v2 = -[PDRemoteAssetDecryptionManager init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___PKDAManager);
    daManager = v2->_daManager;
    v2->_daManager = v3;
  }

  return v2;
}

- (BOOL)assetRequiresDecryption:(id)a3
{
  return ((unint64_t)[a3 encryptionSource] & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (BOOL)decryptAsset:(id)a3 forPass:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 encryptedContentsLocalURL]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 localURL]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueID]);
  if (v8)
  {
    if (v9)
    {
      v11 = -[NSData initWithContentsOfURL:](objc_alloc(&OBJC_CLASS___NSData), "initWithContentsOfURL:", v8);
      uint64_t Object = PKLogFacilityTypeGetObject(22LL);
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (!v11)
      {
        if (v14)
        {
          *(_DWORD *)buf = 138412290;
          v47 = v10;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "No encrypted file contents to decrypted data to on pass: %@",  buf,  0xCu);
        }

        BOOL v30 = 0;
        v17 = v13;
        goto LABEL_38;
      }

      if (v14)
      {
        *(_DWORD *)buf = 138412290;
        v47 = v10;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Decrypting data on pass: %@", buf, 0xCu);
      }

      id v15 = [v6 encryptionSource];
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v11,  0LL,  0LL));
      v17 = v16;
      if (v16)
      {
        v43 = v8;
        id v18 = v7;
        v19 = v9;
        v20 = v10;
        v21 = v13;
        v22 = self;
        v23 = v16;
        uint64_t v24 = objc_claimAutoreleasedReturnValue(-[os_log_s PKStringForKey:](v16, "PKStringForKey:", @"encryptionSource"));
        v25 = (void *)v24;
        if (v24) {
          id v15 = (id)PKRemoteAssetManifestItemEncryptionSourceFromString(v24);
        }

        v17 = v23;
        self = v22;
        v13 = v21;
        v10 = v20;
        v9 = v19;
        id v7 = v18;
        v8 = v43;
      }

      if ((unint64_t)v15 < 2)
      {
        BOOL v30 = 0;
LABEL_38:

        goto LABEL_39;
      }

      if (v15 == (id)3)
      {
        v29 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[PDRemoteAssetDecryptionManager _decryptSESDDict:pass:]( self,  "_decryptSESDDict:pass:",  v17,  v7));
        if (!v29) {
          goto LABEL_15;
        }
      }

      else
      {
        if (v15 != (id)2)
        {
LABEL_15:
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v47 = v10;
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Failed to decrypt data for pass: %@",  buf,  0xCu);
          }

          BOOL v30 = 0;
          v29 = v13;
LABEL_37:

          goto LABEL_38;
        }

        v41 = v17;
        if (v17)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s PKStringForKey:](v17, "PKStringForKey:", @"data"));
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "pk_decodeURLBase64"));

          v27 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s PKStringForKey:](v41, "PKStringForKey:", @"ephemeralPublicKey"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "pk_decodeURLBase64"));

          v17 = v41;
          v29 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[PDRemoteAssetDecryptionManager _decryptKMLData:ephemeralPublicKey:pass:]( self,  "_decryptKMLData:ephemeralPublicKey:pass:",  v44,  v28,  v7));

          if (!v29) {
            goto LABEL_15;
          }
        }

        else
        {
          v37 = objc_alloc(&OBJC_CLASS___NSData);
          v38 = -[NSString initWithData:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithData:encoding:",  v11,  4LL);
          v45 = -[NSData initWithBase64EncodedString:options:](v37, "initWithBase64EncodedString:options:", v38, 0LL);

          v39 = (void *)objc_claimAutoreleasedReturnValue([v6 ephemeralPublicKey]);
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "pk_decodeHexadecimal"));

          v29 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[PDRemoteAssetDecryptionManager _decryptKMLData:ephemeralPublicKey:pass:]( self,  "_decryptKMLData:ephemeralPublicKey:pass:",  v45,  v40,  v7));
          v17 = 0LL;

          if (!v29) {
            goto LABEL_15;
          }
        }
      }

      unsigned int v34 = -[os_log_s writeToURL:atomically:](v29, "writeToURL:atomically:", v9, 1LL, v17);
      BOOL v35 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (v34)
      {
        if (v35)
        {
          *(_DWORD *)buf = 138412546;
          v47 = v10;
          __int16 v48 = 2112;
          v49 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Wrote decrypted data from pass (%@) to: %@",  buf,  0x16u);
        }

        BOOL v30 = 1;
      }

      else
      {
        if (v35)
        {
          *(_DWORD *)buf = 138412546;
          v47 = v10;
          __int16 v48 = 2112;
          v49 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Failed to write decrypted data from pass (%@) to: %@",  buf,  0x16u);
        }

        BOOL v30 = 0;
      }

      v17 = v42;
      goto LABEL_37;
    }

    uint64_t v33 = PKLogFacilityTypeGetObject(22LL);
    v11 = (NSData *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v47 = v10;
      v32 = "No URL to save decrypted data to on pass: %@";
      goto LABEL_22;
    }
  }

  else
  {
    uint64_t v31 = PKLogFacilityTypeGetObject(22LL);
    v11 = (NSData *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v47 = v10;
      v32 = "No URL to decrypt from on pass: %@";
LABEL_22:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v11, OS_LOG_TYPE_DEFAULT, v32, buf, 0xCu);
    }
  }

  BOOL v30 = 0;
LABEL_39:

  return v30;
}

- (id)_decryptKMLData:(id)a3 ephemeralPublicKey:(id)a4 pass:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (v8)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v10 devicePrimaryPaymentApplication]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 subcredentials]);
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v13 anyObject]);

    if (v14)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue( -[PKDAManager decryptData:withCredential:ephemeralPublicKey:]( self->_daManager,  "decryptData:withCredential:ephemeralPublicKey:",  v8,  v14,  v9));
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(22LL);
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v11 description]);
        v19 = (void *)objc_claimAutoreleasedReturnValue([v11 devicePrimaryPaymentApplication]);
        int v21 = 138412546;
        v22 = v18;
        __int16 v23 = 2112;
        uint64_t v24 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "No credential to decrypt from on pass: %@, paymentApplication: %@",  (uint8_t *)&v21,  0x16u);
      }

      id v15 = 0LL;
    }
  }

  else
  {
    id v15 = 0LL;
  }

  return v15;
}

- (id)_decryptSESDDict:(id)a3 pass:(id)a4
{
  return 0LL;
}

- (void).cxx_destruct
{
}

@end