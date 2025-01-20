@interface SecDbKeychainItemV7
+ (id)decryptionOperation;
+ (id)encryptionOperation;
+ (id)keySpecifier;
- (BOOL)deleteWithAcmContext:(id)a3 accessControl:(__SecAccessControl *)a4 callerAccessGroups:(id)a5 keyDiversify:(BOOL)a6 error:(id *)a7;
- (BOOL)encryptMetadataWithKeybag:(int)a3 error:(id *)a4;
- (BOOL)encryptSecretDataWithKeybag:(int)a3 accessControl:(__SecAccessControl *)a4 acmContext:(id)a5 error:(id *)a6;
- (SecDbKeychainItemV7)initWithData:(id)a3 decryptionKeybag:(int)a4 error:(id *)a5;
- (SecDbKeychainItemV7)initWithSecretAttributes:(id)a3 metadataAttributes:(id)a4 tamperCheck:(id)a5 keyclass:(int)a6;
- (id)encryptedBlobWithKeybag:(int)a3 accessControl:(__SecAccessControl *)a4 acmContext:(id)a5 error:(id *)a6;
- (id)encryptedMetadataBlob;
- (id)encryptedSecretDataBlob;
- (id)metadataAttributesWithError:(id *)a3;
- (id)metadataClassKeyWithKeybag:(int)a3 allowWrites:(BOOL)a4 error:(id *)a5;
- (id)secretAttributesWithAcmContext:(id)a3 accessControl:(__SecAccessControl *)a4 callerAccessGroups:(id)a5 keyDiversify:(BOOL)a6 error:(id *)a7;
- (id)unwrapFromAKS:(id)a3 accessControl:(__SecAccessControl *)a4 acmContext:(id)a5 callerAccessGroups:(id)a6 delete:(BOOL)a7 keyDiversify:(BOOL)a8 error:(id *)a9;
- (id)wrapToAKS:(id)a3 withKeybag:(int)a4 accessControl:(__SecAccessControl *)a5 acmContext:(id)a6 error:(id *)a7;
- (int)keyclass;
@end

@implementation SecDbKeychainItemV7

- (SecDbKeychainItemV7)initWithData:(id)a3 decryptionKeybag:(int)a4 error:(id *)a5
{
  id v8 = a3;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___SecDbKeychainItemV7;
  v9 = -[SecDbKeychainItemV7 init](&v27, "init");
  if (v9)
  {
    v10 = -[SecDbKeychainSerializedItemV7 initWithData:]( objc_alloc(&OBJC_CLASS___SecDbKeychainSerializedItemV7),  "initWithData:",  v8);
    if (!v10) {
      goto LABEL_8;
    }
    if ((unint64_t)[v8 length] >= 0x959A)
    {
      v11 = sub_10001267C("SecWarning");
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = [v8 length];
        *(_DWORD *)buf = 134217984;
        id v31 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "SecDbKeychainItemV7: serialized item exceeds reasonable size (%lu bytes)",  buf,  0xCu);
      }
    }

    v9->_keybag = a4;
    v14 = objc_alloc(&OBJC_CLASS___SecDbKeychainSecretData);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainSerializedItemV7 encryptedSecretData](v10, "encryptedSecretData"));
    v16 = -[SecDbKeychainSecretData initWithData:](v14, "initWithData:", v15);
    encryptedSecretData = v9->_encryptedSecretData;
    v9->_encryptedSecretData = v16;

    v18 = objc_alloc(&OBJC_CLASS___SecDbKeychainMetadata);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainSerializedItemV7 encryptedMetadata](v10, "encryptedMetadata"));
    v20 = -[SecDbKeychainMetadata initWithData:](v18, "initWithData:", v19);
    encryptedMetadata = v9->_encryptedMetadata;
    v9->_encryptedMetadata = v20;

    v9->_keyclass = -[SecDbKeychainSerializedItemV7 keyclass](v10, "keyclass");
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainSecretData tamperCheck](v9->_encryptedSecretData, "tamperCheck"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainMetadata tamperCheck](v9->_encryptedMetadata, "tamperCheck"));
    unsigned __int8 v24 = [v22 isEqualToString:v23];

    if ((v24 & 1) == 0)
    {
LABEL_8:

      v9 = 0LL;
    }
  }

  if (a5 && !v9)
  {
    NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
    v29 = @"failed to deserialize keychain item blob";
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v29,  &v28,  1LL));
    *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kCFErrorDomainOSStatus,  -26275LL,  v25));
  }

  return v9;
}

- (SecDbKeychainItemV7)initWithSecretAttributes:(id)a3 metadataAttributes:(id)a4 tamperCheck:(id)a5 keyclass:(int)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!v13)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v22 handleFailureInMethod:a2, self, @"SecDbKeychainItemV7.m", 362, @"Invalid parameter not satisfying: %@", @"tamperCheck" object file lineNumber description];
  }

  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___SecDbKeychainItemV7;
  v14 = -[SecDbKeychainItemV7 init](&v23, "init");
  if (v14)
  {
    if (v11) {
      v15 = (NSDictionary *)[v11 copy];
    }
    else {
      v15 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
    }
    secretAttributes = v14->_secretAttributes;
    v14->_secretAttributes = v15;

    if (v12) {
      v17 = (NSDictionary *)[v12 copy];
    }
    else {
      v17 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
    }
    metadataAttributes = v14->_metadataAttributes;
    v14->_metadataAttributes = v17;

    v19 = (NSString *)[v13 copy];
    tamperCheck = v14->_tamperCheck;
    v14->_tamperCheck = v19;

    v14->_keyclass = a6;
  }

  return v14;
}

- (id)metadataAttributesWithError:(id *)a3
{
  p_metadataAttributes = &self->_metadataAttributes;
  metadataAttributes = self->_metadataAttributes;
  if (!metadataAttributes)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( -[SecDbKeychainItemV7 metadataClassKeyWithKeybag:allowWrites:error:]( self,  "metadataClassKeyWithKeybag:allowWrites:error:",  self->_keybag,  0LL,  a3));
    if (v7)
    {
      id v8 = [(id)objc_opt_class(self) decryptionOperation];
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainMetadata wrappedKey](self->_encryptedMetadata, "wrappedKey"));
      id v43 = 0LL;
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 decrypt:v10 withKey:v7 error:&v43]);
      id v12 = v43;

      if (!v11)
      {
        v29 = sub_10001267C("SecError");
        v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v31 = -[SecDbKeychainItemV7 keyclass](self, "keyclass");
          int keybag = self->_keybag;
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)&uint8_t buf[4] = v31;
          *(_WORD *)&buf[8] = 1024;
          *(_DWORD *)&buf[10] = keybag;
          *(_WORD *)v45 = 2112;
          *(void *)&v45[2] = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "SecDbKeychainItemV7: error unwrapping item metadata key (class %d, bag %d): %@",  buf,  0x18u);
        }

        if (a3)
        {
          *(void *)buf = v12;
          sub_1000194E0(-26275, (__CFString **)buf, @"failed to unwrap item metadata key");
          *a3 = *(id *)buf;
        }

        goto LABEL_26;
      }

      id v13 = objc_alloc(&OBJC_CLASS____SFAESKey);
      id v14 = [(id)objc_opt_class(self) keySpecifier];
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      id v16 = [v13 initWithData:v11 specifier:v15 error:a3];

      if (v16)
      {
        v41 = v11;
        id v17 = [(id)objc_opt_class(self) decryptionOperation];
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainMetadata ciphertext](self->_encryptedMetadata, "ciphertext"));
        id v42 = v12;
        v20 = (const __CFData *)objc_claimAutoreleasedReturnValue([v18 decrypt:v19 withKey:v16 error:&v42]);
        id v21 = v42;

        if (v20)
        {
          id v40 = v21;
          v22 = v20;
          id v23 = sub_1000E59BC(v20);
          unsigned __int8 v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
          id v25 = [v24 mutableCopy];

          v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:@"TamperCheck"]);
          objc_super v27 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainMetadata tamperCheck](self->_encryptedMetadata, "tamperCheck"));
          unsigned int v28 = [v26 isEqualToString:v27];

          if (v28)
          {
            [v25 removeObjectForKey:@"TamperCheck"];
            objc_storeStrong((id *)p_metadataAttributes, v25);
          }

          else
          {
            v36 = sub_10001267C("SecError");
            v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              v38 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainMetadata tamperCheck](self->_encryptedMetadata, "tamperCheck"));
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v26;
              *(_WORD *)&buf[12] = 2112;
              *(void *)v45 = v38;
              _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "SecDbKeychainItemV7: tamper check failed for metadata decryption, expected %@ found %@",  buf,  0x16u);
            }

            if (a3)
            {
              *(void *)buf = 0LL;
              sub_1000194E0(-26275, (__CFString **)buf, @"tamper check failed for metadata decryption");
              *a3 = *(id *)buf;
            }
          }

          int v33 = 0;
          id v21 = v40;
          v20 = v22;
        }

        else
        {
          v34 = sub_10001267C("SecError");
          v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v21;
            _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "SecDbKeychainItemV7: error decrypting metadata content: %@",  buf,  0xCu);
          }

          if (a3)
          {
            *(void *)buf = v21;
            sub_1000194E0(-26275, (__CFString **)buf, @"failed to decrypt item metadata contents");
            *a3 = *(id *)buf;
          }

          int v33 = 1;
        }

        id v11 = v41;
      }

      else
      {
        int v33 = 1;
        id v21 = v12;
      }

      if (v33)
      {
LABEL_26:

        return 0LL;
      }
    }

    metadataAttributes = *p_metadataAttributes;
  }

  return metadataAttributes;
}

- (id)secretAttributesWithAcmContext:(id)a3 accessControl:(__SecAccessControl *)a4 callerAccessGroups:(id)a5 keyDiversify:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a5;
  secretAttributes = self->_secretAttributes;
  if (secretAttributes) {
    goto LABEL_15;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainSecretData wrappedKey](self->_encryptedSecretData, "wrappedKey"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue( -[SecDbKeychainItemV7 unwrapFromAKS:accessControl:acmContext:callerAccessGroups:delete:keyDiversify:error:]( self,  "unwrapFromAKS:accessControl:acmContext:callerAccessGroups:delete:keyDiversify:error:",  v15,  a4,  v12,  v13,  0LL,  v8,  a7));

  if (!v16)
  {
LABEL_14:

    secretAttributes = self->_secretAttributes;
LABEL_15:
    v34 = secretAttributes;
    goto LABEL_16;
  }

  id v17 = [(id)objc_opt_class(self) decryptionOperation];
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainSecretData ciphertext](self->_encryptedSecretData, "ciphertext"));
  id v39 = 0LL;
  v20 = (void *)objc_claimAutoreleasedReturnValue([v18 decrypt:v19 withKey:v16 error:&v39]);
  id v21 = v39;

  if (v20)
  {
    v38 = v21;
    id v22 = v20;
    id v23 = (const __CFData *)objc_claimAutoreleasedReturnValue( objc_msgSend( v22,  "subdataWithRange:",  0,  (char *)objc_msgSend(v22, "length")
                              - *((char *)[v22 length] + (void)objc_msgSend(v22, "bytes") - 1)));
    id v24 = sub_1000E59BC(v23);
    id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    id v26 = [v25 mutableCopy];

    objc_super v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"TamperCheck"]);
    unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainSecretData tamperCheck](self->_encryptedSecretData, "tamperCheck"));
    unsigned int v29 = [v27 isEqualToString:v28];

    if (v29)
    {
      [v26 removeObjectForKey:@"TamperCheck"];
      v30 = (NSDictionary *)v26;
      unsigned int v31 = self->_secretAttributes;
      self->_secretAttributes = v30;
    }

    else
    {
      v35 = sub_10001267C("SecError");
      unsigned int v31 = (NSDictionary *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled((os_log_t)v31, OS_LOG_TYPE_DEFAULT))
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainMetadata tamperCheck](self->_encryptedMetadata, "tamperCheck"));
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v27;
        __int16 v41 = 2112;
        id v42 = v36;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v31,  OS_LOG_TYPE_DEFAULT,  "SecDbKeychainItemV7: tamper check failed for secret data decryption, expected %@ found %@",  buf,  0x16u);
      }
    }

    goto LABEL_14;
  }

  v32 = sub_10001267C("SecError");
  int v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v21;
    _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "SecDbKeychainItemV7: error decrypting item secret data contents: %@",  buf,  0xCu);
  }

  if (a7)
  {
    *(void *)buf = v21;
    sub_1000194E0(-26275, (__CFString **)buf, @"error decrypting item secret data contents");
    *a7 = *(id *)buf;
  }

  v34 = 0LL;
LABEL_16:

  return v34;
}

- (BOOL)deleteWithAcmContext:(id)a3 accessControl:(__SecAccessControl *)a4 callerAccessGroups:(id)a5 keyDiversify:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a5;
  if ((const CFBooleanRef)SecAccessControlGetConstraint(a4, @"odel") == kCFBooleanTrue)
  {
    id v17 = 0LL;
    BOOL v15 = 1;
  }

  else
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainSecretData wrappedKey](self->_encryptedSecretData, "wrappedKey"));
    id v22 = 0LL;
    BOOL v15 = 1;
    id v16 =  -[SecDbKeychainItemV7 unwrapFromAKS:accessControl:acmContext:callerAccessGroups:delete:keyDiversify:error:]( self,  "unwrapFromAKS:accessControl:acmContext:callerAccessGroups:delete:keyDiversify:error:",  v14,  a4,  v12,  v13,  1LL,  v8,  &v22);
    id v17 = v22;

    if (v17)
    {
      v18 = sub_10001267C("SecError");
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "SecDbKeychainItemV7: failed to delete item secret key from aks",  buf,  2u);
      }

      if (a7)
      {
        id v17 = v17;
        BOOL v15 = 0;
        *a7 = v17;
      }

      else
      {
        BOOL v15 = 0;
      }
    }
  }

  return v15;
}

- (id)encryptedBlobWithKeybag:(int)a3 accessControl:(__SecAccessControl *)a4 acmContext:(id)a5 error:(id *)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a5;
  id v20 = 0LL;
  unsigned int v11 = -[SecDbKeychainItemV7 encryptMetadataWithKeybag:error:](self, "encryptMetadataWithKeybag:error:", v8, &v20);
  id v12 = v20;
  if (v11
    && self->_encryptedMetadata
    && !v12
    && (id v19 = 0LL,
        unsigned int v13 = -[SecDbKeychainItemV7 encryptSecretDataWithKeybag:accessControl:acmContext:error:]( self,  "encryptSecretDataWithKeybag:accessControl:acmContext:error:",  v8,  a4,  v10,  &v19),  v12 = v19,  v13)
    && self->_encryptedSecretData
    && !v12)
  {
    id v14 = objc_alloc_init(&OBJC_CLASS___SecDbKeychainSerializedItemV7);
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainItemV7 encryptedMetadataBlob](self, "encryptedMetadataBlob"));
    -[SecDbKeychainSerializedItemV7 setEncryptedMetadata:](v14, "setEncryptedMetadata:", v15);

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainItemV7 encryptedSecretDataBlob](self, "encryptedSecretDataBlob"));
    -[SecDbKeychainSerializedItemV7 setEncryptedSecretData:](v14, "setEncryptedSecretData:", v16);

    -[SecDbKeychainSerializedItemV7 setKeyclass:](v14, "setKeyclass:", self->_keyclass);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainSerializedItemV7 data](v14, "data"));

    id v12 = 0LL;
  }

  else if (a6)
  {
    id v12 = v12;
    id v17 = 0LL;
    *a6 = v12;
  }

  else
  {
    id v17 = 0LL;
  }

  return v17;
}

- (id)encryptedMetadataBlob
{
  return -[SecDbKeychainMetadata serializedRepresentation](self->_encryptedMetadata, "serializedRepresentation");
}

- (id)encryptedSecretDataBlob
{
  return -[SecDbKeychainSecretData serializedRepresentation](self->_encryptedSecretData, "serializedRepresentation");
}

- (BOOL)encryptMetadataWithKeybag:(int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc(&OBJC_CLASS____SFAESKey);
  id v8 = [(id)objc_opt_class(self) keySpecifier];
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = [v7 initRandomKeyWithSpecifier:v9 error:a4];

  if (v10)
  {
    id v11 = [(id)objc_opt_class(self) encryptionOperation];
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    unsigned int v13 = (__CFString *)-[NSDictionary mutableCopy](self->_metadataAttributes, "mutableCopy");
    -[__CFString setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  self->_tamperCheck,  @"TamperCheck");
    id v17 = sub_100019F48(v13, 0LL, v14, v15, v16);
    if ((unint64_t)-[__CFData length](v17, "length") >= 0x801)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_metadataAttributes,  "objectForKeyedSubscript:",  kSecAttrAccessGroup));
      id v19 = sub_10001267C("SecWarning");
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v29 = 134218242;
        id v30 = -[__CFData length](v17, "length");
        __int16 v31 = 2112;
        v32 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "SecDbKeychainItemV7: item's metadata exceeds reasonable size (%lu bytes) (%@)",  (uint8_t *)&v29,  0x16u);
      }
    }

    id v21 = (void *)objc_claimAutoreleasedReturnValue([v12 encrypt:v17 withKey:v10 error:a4]);
    id v22 = (void *)objc_claimAutoreleasedReturnValue( -[SecDbKeychainItemV7 metadataClassKeyWithKeybag:allowWrites:error:]( self,  "metadataClassKeyWithKeybag:allowWrites:error:",  v5,  1LL,  a4));
    if (v22)
    {
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v10 keyData]);
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v12 encrypt:v23 withKey:v22 error:a4]);

      id v25 = -[SecDbKeychainMetadata initWithCiphertext:wrappedKey:tamperCheck:error:]( objc_alloc(&OBJC_CLASS___SecDbKeychainMetadata),  "initWithCiphertext:wrappedKey:tamperCheck:error:",  v21,  v24,  self->_tamperCheck,  a4);
      encryptedMetadata = self->_encryptedMetadata;
      self->_encryptedMetadata = v25;
    }

    BOOL v27 = self->_encryptedMetadata != 0LL;
  }

  else
  {
    BOOL v27 = 0;
  }

  return v27;
}

- (BOOL)encryptSecretDataWithKeybag:(int)a3 accessControl:(__SecAccessControl *)a4 acmContext:(id)a5 error:(id *)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a5;
  id v11 = objc_alloc(&OBJC_CLASS____SFAESKey);
  id v12 = [(id)objc_opt_class(self) keySpecifier];
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = [v11 initRandomKeyWithSpecifier:v13 error:a6];

  if (v14)
  {
    id v15 = [(id)objc_opt_class(self) encryptionOperation];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    id v17 = (__CFString *)-[NSDictionary mutableCopy](self->_secretAttributes, "mutableCopy");
    -[__CFString setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  self->_tamperCheck,  @"TamperCheck");
    id v21 = sub_100019F48(v17, 0LL, v18, v19, v20);
    id v22 = -[__CFData mutableCopy](v21, "mutableCopy");

    if ((unint64_t)[v22 length] > 0x8000)
    {
      v34 = a4;
      id v23 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_metadataAttributes,  "objectForKeyedSubscript:",  kSecAttrAccessGroup));
      id v24 = sub_10001267C("SecWarning");
      id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        *(void *)&uint8_t buf[4] = [v22 length];
        *(_WORD *)&_BYTE buf[12] = 2112;
        *(void *)&_BYTE buf[14] = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "SecDbKeychainItemV7: item's secret data exceeds reasonable size (%lu bytes) (%@)",  buf,  0x16u);
      }

      a4 = v34;
    }

    unint64_t v26 = (unint64_t)[v22 length];
    uint64_t v27 = (20 * (v26 / 0x14) - v26 + 20);
    *(void *)buf = 0x101010101010101LL * v27;
    *(void *)&uint8_t buf[8] = 0x101010101010101LL * v27;
    *(_DWORD *)&buf[16] = 16843009 * v27;
    objc_msgSend(v22, "appendBytes:length:", buf);
    unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue([v16 encrypt:v22 withKey:v14 error:a6]);
    int v29 = (void *)objc_claimAutoreleasedReturnValue( -[SecDbKeychainItemV7 wrapToAKS:withKeybag:accessControl:acmContext:error:]( self,  "wrapToAKS:withKeybag:accessControl:acmContext:error:",  v14,  v8,  a4,  v10,  a6));
    id v30 = -[SecDbKeychainSecretData initWithCiphertext:wrappedKey:tamperCheck:error:]( objc_alloc(&OBJC_CLASS___SecDbKeychainSecretData),  "initWithCiphertext:wrappedKey:tamperCheck:error:",  v28,  v29,  self->_tamperCheck,  a6);
    encryptedSecretData = self->_encryptedSecretData;
    self->_encryptedSecretData = v30;

    BOOL v32 = self->_encryptedSecretData != 0LL;
  }

  else
  {
    BOOL v32 = 0;
  }

  return v32;
}

- (id)metadataClassKeyWithKeybag:(int)a3 allowWrites:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v7 = *(void *)&a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[SecDbKeychainMetadataKeyStore sharedStore]( &OBJC_CLASS___SecDbKeychainMetadataKeyStore,  "sharedStore"));
  uint64_t keyclass = self->_keyclass;
  id v11 = [(id)objc_opt_class(self) keySpecifier];
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v9 keyForKeyclass:keyclass keybag:v7 keySpecifier:v12 allowWrites:v6 error:a5]);

  return v13;
}

- (id)wrapToAKS:(id)a3 withKeybag:(int)a4 accessControl:(__SecAccessControl *)a5 acmContext:(id)a6 error:(id *)a7
{
  id v10 = a6;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a3 keyData]);
  uint64_t Constraints = SecAccessControlGetConstraints(a5);
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(Constraints);
  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_metadataAttributes,  "objectForKeyedSubscript:",  kSecAttrMultiUser));
  if (sub_1000F7774((const __CFData *)v14))
  {
    id v15 = v11;
    id v16 = v10;
    id v17 = v14;
    id v18 = [v17 bytes];
    id v19 = [v17 length];
    uint64_t v20 = sub_10001267C("KeyDiversify");
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v67 = 138412290;
      *(void *)&v67[4] = v17;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "wrapToAKS: Key diversification feature persona(musr) %@ is data separated",  v67,  0xCu);
    }

    id v10 = v16;
    id v11 = v15;
    if (v13)
    {
LABEL_5:
      *(void *)v67 = 0LL;
      id v64 = 0LL;
      v65 = @"acl";
      v66 = v13;
      id v22 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v66,  &v65,  1LL);
      unint64_t v26 = sub_100019F48((const __CFString *)v22, (CFTypeRef *)&v64, v23, v24, v25);
      if (v10 && (SecAccessControlIsBound(a5) & 1) != 0)
      {
        id v55 = v10;
        uint64_t v62 = 0LL;
        *(void *)buf = 0LL;
        uint64_t v27 = (void **)sub_100003144(0LL, 0LL);
        v61 = v27;
        if (!v27)
        {
          id v36 = 0LL;
LABEL_42:
          id v10 = v55;
          goto LABEL_43;
        }

        unsigned int v28 = v27;
        if (v18) {
          sub_100003344(v27, 15, (uint64_t)v18, (uint64_t)v19);
        }
        int v29 = v26;
        sub_100003344(v28, 2, (uint64_t)-[__CFData bytes](v29, "bytes"), (uint64_t)-[__CFData length](v29, "length"));
        id v30 = v55;
        sub_100003344(v28, 3, (uint64_t)[v30 bytes], (int)objc_msgSend(v30, "length"));
        sub_10000343C(v28, buf, (size_t *)&v62);
        uint64_t v31 = sub_10000349C(a4, self->_keyclass, 0, *(uint64_t *)buf, v62, (void ***)v67);
        if ((_DWORD)v31)
        {
          uint64_t v32 = v31;
          int v33 = (const void *)SecAccessControlCopyData(a5);
          sub_10011FEEC( v32,  @"oe",  a4,  self->_keyclass,  (uint64_t)v33,  (const __CFData *)v30,  (__CFString **)&v64);
          if (v33) {
            CFRelease(v33);
          }
          free(*(void **)buf);
          *(void *)buf = 0LL;
        }

        else
        {
          uint64_t v59 = 0LL;
          size_t v60 = 0LL;
          uint64_t v41 = v62;
          uint64_t v53 = *(void *)buf;
          uint64_t v54 = *(void *)v67;
          id v42 = v11;
          uint64_t v43 = sub_1000036C8( v54,  v53,  v41,  (uint64_t)[v42 bytes],  (uint64_t)objc_msgSend(v42, "length"),  &v59,  &v60);
          if (!(_DWORD)v43)
          {
            free(*(void **)buf);
            *(void *)buf = 0LL;
            id v46 = v64;
            if (a7)
            {
              *a7 = v64;
              id v64 = 0LL;
            }

            else if (v64)
            {
              id v64 = 0LL;
              CFRelease(v46);
            }

            v47 = objc_alloc(&OBJC_CLASS___NSData);
            v48 = -[NSData initWithBytesNoCopy:length:](v47, "initWithBytesNoCopy:length:", v59, v60);
            uint64_t v58 = 0LL;
            uint64_t v49 = sub_1000046C8(*(uint64_t **)v67, &v58);
            v50 = objc_alloc(&OBJC_CLASS___NSData);
            v51 = -[NSData initWithBytes:length:](v50, "initWithBytes:length:", v49, v58);
            sub_100003440(&v61);
            sub_100003848((uint64_t *)v67);
            id v36 = -[SecDbKeychainAKSWrappedKey initRefKeyWrappedKeyWithData:refKeyBlob:]( objc_alloc(&OBJC_CLASS___SecDbKeychainAKSWrappedKey),  "initRefKeyWrappedKeyWithData:refKeyBlob:",  v48,  v51);

            goto LABEL_42;
          }

          uint64_t v44 = v43;
          v45 = (const void *)SecAccessControlCopyData(a5);
          sub_10011FEEC( v44,  @"oe",  a4,  self->_keyclass,  (uint64_t)v45,  (const __CFData *)v30,  (__CFString **)&v64);
          if (v45) {
            CFRelease(v45);
          }
          free(*(void **)buf);
          *(void *)buf = 0LL;
          sub_100003848((uint64_t *)v67);
        }

        sub_100003440(&v61);
        id v40 = v64;
        if (a7)
        {
          id v36 = 0LL;
          *a7 = v64;
          id v64 = 0LL;
          goto LABEL_42;
        }

        id v10 = v55;
        if (!v64)
        {
LABEL_27:
          id v36 = 0LL;
LABEL_43:

          goto LABEL_44;
        }
      }

      else
      {
        v37 = sub_10001267C("SecError");
        v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "SecDbKeychainItemV7: access control error",  buf,  2u);
        }

        if (a7)
        {
          id v39 = (const void *)SecAccessControlCopyData(a5);
          SecAccessControlIsBound(a5);
          sub_10011FC80((CFErrorRef *)&v64, (uint64_t)v39);
          if (v39) {
            CFRelease(v39);
          }
          id v36 = 0LL;
          *a7 = v64;
          id v64 = 0LL;
          goto LABEL_43;
        }

        id v40 = v64;
        if (!v64) {
          goto LABEL_27;
        }
      }

      id v64 = 0LL;
      CFRelease(v40);
      goto LABEL_27;
    }
  }

  else
  {
    id v19 = 0LL;
    id v18 = 0LL;
    if (v13) {
      goto LABEL_5;
    }
  }

  id v34 = v10;
  v35 = -[NSMutableData initWithLength:](objc_alloc(&OBJC_CLASS___NSMutableData), "initWithLength:", 40LL);
  if (+[SecAKSObjCWrappers aksEncryptWithKeybag:keyclass:plaintext:outKeyclass:ciphertext:personaId:personaIdLength:error:]( &OBJC_CLASS___SecAKSObjCWrappers,  "aksEncryptWithKeybag:keyclass:plaintext:outKeyclass:ciphertext:personaId:personaIdLength:error:",  a4,  self->_keyclass,  v11,  &self->_keyclass,  v35,  v18,  v19,  a7))
  {
    id v36 = -[SecDbKeychainAKSWrappedKey initRegularWrappedKeyWithData:]( objc_alloc(&OBJC_CLASS___SecDbKeychainAKSWrappedKey),  "initRegularWrappedKeyWithData:",  v35);
  }

  else
  {
    id v36 = 0LL;
  }

  id v10 = v34;
LABEL_44:

  return v36;
}

- (id)unwrapFromAKS:(id)a3 accessControl:(__SecAccessControl *)a4 acmContext:(id)a5 callerAccessGroups:(id)a6 delete:(BOOL)a7 keyDiversify:(BOOL)a8 error:(id *)a9
{
  BOOL v9 = a8;
  id v15 = a9;
  id v16 = a3;
  id v17 = a5;
  id v18 = (__CFString *)a6;
  id v88 = (id)objc_claimAutoreleasedReturnValue([v16 wrappedKey]);
  if (v9)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_metadataAttributes,  "objectForKeyedSubscript:",  kSecAttrMultiUser));
    if (sub_1000F7774((const __CFData *)v19))
    {
      id v87 = v16;
      BOOL v84 = a7;
      id v20 = v19;
      id v21 = [v20 bytes];
      id v22 = [v20 length];
      uint64_t v23 = sub_10001267C("KeyDiversify");
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v20;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEBUG,  "unwrapFromAKS: Key diversification feature persona(musr) %@ is data separated",  buf,  0xCu);
      }

      id v15 = a9;
      BOOL v25 = v84;
      id v26 = v21;
      id v16 = v87;
    }

    else
    {
      BOOL v25 = a7;
      id v22 = 0LL;
      id v26 = 0LL;
    }
  }

  else
  {
    BOOL v25 = a7;
    id v22 = 0LL;
    id v26 = 0LL;
  }

  if ([v16 type])
  {
    if ([v16 type] != 1)
    {
      id v34 = 0LL;
LABEL_69:
      v48 = v88;
      goto LABEL_70;
    }

    uint64_t v82 = (uint64_t)v22;
    v83 = (__CFString **)v15;
    uint64_t v27 = v16;
    uint64_t v28 = (uint64_t)v26;
    *(void *)buf = 0LL;
    int keybag = self->_keybag;
    id v30 = objc_claimAutoreleasedReturnValue([v27 refKeyBlob]);
    id v31 = [v30 bytes];
    id v86 = v17;
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v27 refKeyBlob]);
    int v33 = sub_1000038F8(keybag, v31, (size_t)[v32 length], (uint64_t *)buf);

    id v17 = v86;
    id v34 = 0LL;
    if (!v33)
    {
      uint64_t v96 = 0LL;
      v97 = 0LL;
      v35 = (const UInt8 *)sub_1000046D4(*(uint64_t *)buf, &v96);
      if (v35)
      {
        CFDictionaryRef theDict = 0LL;
        sub_100019634(0LL, &theDict, (CFTypeRef *)&v97, v35, (uint64_t)&v35[v96]);
        id v36 = theDict;
        if (!theDict) {
          sub_1000194E0(-26275, &v97, @"SecDbKeychainItemV7: failed to decode acl dict");
        }
        Value = CFDictionaryGetValue(v36, @"acl");
        v81 = a4;
        SecAccessControlSetConstraints(a4, Value);
        if (v18)
        {
          uint64_t v41 = sub_100019A68(v18, (CFTypeRef *)&v97, v38, v39, v40);
          id v42 = -[NSMutableData initWithLength:](objc_alloc(&OBJC_CLASS___NSMutableData), "initWithLength:", v41);
          uint64_t v43 = -[NSMutableData mutableBytes](v42, "mutableBytes");
          uint64_t v44 = v42;
          id v45 = -[NSMutableData mutableBytes](v44, "mutableBytes");
          id v46 = v43;
          id v17 = v86;
          sub_100019C44(v18, (CFTypeRef *)&v97, 0LL, v46, (unint64_t)v45 + v41);
        }

        else
        {
          uint64_t v41 = 0LL;
          uint64_t v44 = 0LL;
        }

        uint64_t v93 = 0LL;
        v94 = 0LL;
        v52 = (void **)sub_100003144(0LL, 0LL);
        v92 = v52;
        if (!v52)
        {
          sub_100003848((uint64_t *)buf);
          id v34 = 0LL;
LABEL_67:

          goto LABEL_68;
        }

        uint64_t v53 = v52;
        v85 = self;
        if (v28)
        {
          sub_100003344(v52, 15, v28, v82);
          uint64_t v53 = v92;
        }

        sub_100003344(v53, 1, (uint64_t)-[NSMutableData bytes](v44, "bytes"), v41);
        id v54 = v17;
        sub_100003344(v92, 3, (uint64_t)[v54 bytes], (int)objc_msgSend(v54, "length"));
        sub_10000343C(v92, &v94, (size_t *)&v93);
        size_t v90 = 0LL;
        v91 = 0LL;
        uint64_t v55 = *(void *)buf;
        uint64_t v57 = v93;
        v56 = v94;
        id v58 = v88;
        uint64_t v59 = sub_1000039BC( v55,  (uint64_t)v56,  v57,  [v58 bytes],  (size_t)objc_msgSend(v58, "length"),  &v91,  &v90);
        if ((_DWORD)v59)
        {
          uint64_t v60 = v59;
          v61 = v83;
          if (v54 || (_DWORD)v59 != -536363000)
          {
            v74 = (const void *)SecAccessControlCopyData(v81);
            sub_10011FEEC(v60, @"od", 0LL, 0LL, (uint64_t)v74, (const __CFData *)v54, &v97);
            id v17 = v86;
            if (v74) {
              CFRelease(v74);
            }
            sub_100003848((uint64_t *)buf);
            free(v94);
            v94 = 0LL;
            sub_100003440(&v92);
            v75 = v97;
            if (v83) {
              goto LABEL_50;
            }
            goto LABEL_45;
          }

          sub_10011FC80((CFErrorRef *)&v97, 0LL);
LABEL_49:
          sub_100003848((uint64_t *)buf);
          free(v94);
          v94 = 0LL;
          sub_100003440(&v92);
          v75 = v97;
          id v17 = v86;
          if (v61)
          {
LABEL_50:
            v76 = v75;
            v77 = v61;
            id v34 = 0LL;
            *v77 = v76;
            v97 = 0LL;
LABEL_66:
            id v36 = theDict;
            goto LABEL_67;
          }

- (int)keyclass
{
  return self->_keyclass;
}

- (void).cxx_destruct
{
}

+ (id)keySpecifier
{
  if (qword_1002DEA00 != -1) {
    dispatch_once(&qword_1002DEA00, &stru_100285DB0);
  }
  return (id)qword_1002DE9F8;
}

+ (id)encryptionOperation
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E5BA4;
  block[3] = &unk_1002935A8;
  block[4] = a1;
  if (qword_1002DEA10 != -1) {
    dispatch_once(&qword_1002DEA10, block);
  }
  return (id)qword_1002DEA08;
}

+ (id)decryptionOperation
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E5B40;
  block[3] = &unk_1002935A8;
  block[4] = a1;
  if (qword_1002DEA20 != -1) {
    dispatch_once(&qword_1002DEA20, block);
  }
  return (id)qword_1002DEA18;
}

@end