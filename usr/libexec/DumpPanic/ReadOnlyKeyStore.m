@interface ReadOnlyKeyStore
- (BOOL)hasMatchingPrivateKey:(int)a3 :(id)a4;
- (BOOL)readKeyFile:(id)a3 :(id *)a4 :(int *)a5 :(id *)a6 :(id *)a7;
- (BOOL)unlock;
- (ReadOnlyKeyStore)initWithKeyStorePath:(id)a3 :(id)a4;
- (ccec_cp)getEccFormat:(int)a3;
- (id)getMatchingPrivateKey:(int)a3 :(id)a4;
- (id)init:(id)a3;
@end

@implementation ReadOnlyKeyStore

- (ReadOnlyKeyStore)initWithKeyStorePath:(id)a3 :(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___ReadOnlyKeyStore;
  v9 = -[ReadOnlyKeyStore init](&v22, "init");
  v11 = v9;
  if (!v9)
  {
LABEL_7:

    return v11;
  }

  if (v8)
  {
    objc_storeStrong((id *)&v9->_log_handle, a4);
    id v12 = v7;
    if (v12)
    {
      v14 = v12;

      objc_storeStrong((id *)&v11->_keyStorePath, a3);
      v11->_isDefaultKeyStorePath = [v14 isEqualToString:@"/private/var/db/DumpPanic/Keys"];
      char v21 = 0;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      LODWORD(v14) = [v15 fileExistsAtPath:v14 isDirectory:&v21];

      char v16 = v21 ^ 1;
      if (!(_DWORD)v14) {
        char v16 = 0;
      }
      v11->_singleFileMode = v16;
      v17 = v11;
      goto LABEL_7;
    }
  }

  else
  {
    uint64_t v19 = _os_assert_log(0LL, v10);
    id v12 = (id)_os_crash(v19);
    __break(1u);
  }

  uint64_t v20 = _os_assert_log(v12, v13);
  result = (ReadOnlyKeyStore *)_os_crash(v20);
  __break(1u);
  return result;
}

- (id)init:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/private/var/db/DumpPanic/Keys"));
  v6 = -[ReadOnlyKeyStore initWithKeyStorePath::](self, "initWithKeyStorePath::", v5, v4);

  return v6;
}

- (BOOL)unlock
{
  return 1;
}

- (BOOL)hasMatchingPrivateKey:(int)a3 :(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = objc_autoreleasePoolPush();
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ReadOnlyKeyStore getMatchingPrivateKey::](self, "getMatchingPrivateKey::", v4, v6));
  LOBYTE(v4) = v8 != 0LL;

  objc_autoreleasePoolPop(v7);
  return v4;
}

- (ccec_cp)getEccFormat:(int)a3
{
  if (a3 == 1) {
    return (ccec_cp *)ccec_cp_256(self, a2);
  }
  log_handle = self->_log_handle;
  if (os_log_type_enabled(log_handle, OS_LOG_TYPE_ERROR))
  {
    v6[0] = 67109120;
    v6[1] = a3;
    _os_log_error_impl( (void *)&_mh_execute_header,  log_handle,  OS_LOG_TYPE_ERROR,  "Unknown key format %d",  (uint8_t *)v6,  8u);
  }

  return 0LL;
}

- (BOOL)readKeyFile:(id)a3 :(id *)a4 :(int *)a5 :(id *)a6 :(id *)a7
{
  id v12 = a3;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v62 = 0LL;
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 attributesOfItemAtPath:v12 error:&v62]);
  id v15 = v62;

  if (!v14)
  {
    log_handle = self->_log_handle;
    if (os_log_type_enabled(log_handle, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = log_handle;
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v15 localizedDescription]);
      *(_DWORD *)buf = 138412290;
      id v64 = v20;
      _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Failed to gather the file attributes for key file. Error: %@",  buf,  0xCu);
    }

    goto LABEL_12;
  }

  if (a4) {
    *a4 = v14;
  }
  NSFileAttributeType v16 = (NSFileAttributeType)objc_claimAutoreleasedReturnValue([v14 fileType]);

  if (v16 == NSFileTypeRegular)
  {
    if ((unint64_t)[v14 fileSize] > 0x2000)
    {
      char v21 = self->_log_handle;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "File seems to be too large to be useful. Skipping",  buf,  2u);
      }

      goto LABEL_12;
    }

    id v61 = v15;
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  v12,  0LL,  &v61));
    id v25 = v61;

    if (!v24)
    {
      v37 = self->_log_handle;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v45 = v37;
        v46 = (void *)objc_claimAutoreleasedReturnValue([v25 localizedDescription]);
        *(_DWORD *)buf = 138412290;
        id v64 = v46;
        _os_log_error_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_ERROR,  "Failed to read the file contents for key file. Error: %@",  buf,  0xCu);
      }

      BOOL v22 = 0;
      id v15 = v25;
      goto LABEL_73;
    }

    id v60 = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v24,  0LL,  &v60));
    id v59 = v60;

    if (v26)
    {
      uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v26, v27) & 1) != 0)
      {
        v58 = v26;
        id v28 = v26;
        v29 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKeyedSubscript:@"magic"]);
        v30 = v29;
        if (v29)
        {
          if ([v29 unsignedLongLongValue] == (id)0x4D414749434B4559)
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKeyedSubscript:@"version"]);
            v57 = v31;
            if (v31)
            {
              if ([v31 unsignedIntValue] == 1)
              {
                v32 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKeyedSubscript:@"key_format"]);
                if (!v32)
                {
                  v48 = 0LL;
                  v49 = self->_log_handle;
                  if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_ERROR,  "Misformatted key file. Key format not found",  buf,  2u);
                  }

                  BOOL v22 = 0;
                  goto LABEL_69;
                }

                v56 = v32;
                int v33 = [v32 intValue];
                if (!v33 || v33 >= 2)
                {
                  int v50 = v33;
                  v51 = self->_log_handle;
                  if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 67109120;
                    LODWORD(v64) = v50;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_ERROR,  "Unsupported key format in key file: %d",  buf,  8u);
                  }

                  goto LABEL_67;
                }

                *a5 = v33;
                if (a6)
                {
                  v34 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKeyedSubscript:@"public_key_hash"]);
                  if (v34)
                  {
                    v35 =  -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v34,  0LL);
                    *a6 = v35;
                    if (v35)
                    {

                      goto LABEL_28;
                    }

                    v52 = self->_log_handle;
                    if (!os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
                      goto LABEL_66;
                    }
                    *(_WORD *)buf = 0;
                    v53 = "Failed to parse the Base64-encoded hash";
                  }

                  else
                  {
                    v52 = self->_log_handle;
                    if (!os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
                      goto LABEL_66;
                    }
                    *(_WORD *)buf = 0;
                    v53 = "Misformatted key file. Public key hash not found";
                  }

- (id)getMatchingPrivateKey:(int)a3 :(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  memset(__s2, 0, sizeof(__s2));
  id v7 = -[ReadOnlyKeyStore getEccFormat:](self, "getEccFormat:", v4);
  if (!v7)
  {
    id v20 = 0LL;
    goto LABEL_50;
  }

  p_var0 = &v7->var0;
  int v56 = v4;
  v9 = &v52;
  __chkstk_darwin();
  v11 = (unint64_t **)((char *)&v52 - v10);
  id v12 = [v6 length];
  id v13 = v6;
  int v14 = ccec_x963_import_pub(p_var0, (uint64_t)v12, (unsigned __int8 *)[v13 bytes], v11);
  if (v14)
  {
    int v15 = v14;
    cc_clear(24 * *p_var0 + 16, v11);
    log_handle = self->_log_handle;
    if (!os_log_type_enabled(log_handle, OS_LOG_TYPE_ERROR)) {
      goto LABEL_49;
    }
    int v69 = 67109120;
    LODWORD(v70) = v15;
    v17 = "Failed to parse the input public key with the given format. CoreCrypto error %d";
    v18 = log_handle;
    uint32_t v19 = 8;
LABEL_14:
    _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v69, v19);
    goto LABEL_49;
  }

  BOOL v21 = ccec_validate_pub((uint64_t **)v11);
  cc_clear(24 * *p_var0 + 16, v11);
  if (!v21)
  {
    v24 = self->_log_handle;
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_49;
    }
    LOWORD(v69) = 0;
    v17 = "The input public key did not pass basic validation checks";
    v18 = v24;
    uint32_t v19 = 2;
    goto LABEL_14;
  }

  BOOL v22 = ccsha256_di();
  ccdigest( (uint64_t)v22, (size_t)[v13 length], (char *)objc_msgSend(v13, "bytes"), (uint64_t)__s2);
  if (os_variant_has_internal_diagnostics("com.apple.DumpPanic")
    && _os_feature_enabled_impl("DumpPanic", "OnlyUseNvramKeyStore")
    && self->_isDefaultKeyStorePath)
  {
    goto LABEL_49;
  }

  if (self->_singleFileMode)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 1LL));
    [v23 addObject:self->_keyStorePath];
  }

  else
  {
    id v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 contentsOfDirectoryAtPath:self->_keyStorePath error:0]);

    if (v26)
    {
      v53 = &v52;
      id v54 = v6;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      __int128 v65 = 0u;
      __int128 v66 = 0u;
      __int128 v67 = 0u;
      __int128 v68 = 0u;
      id v57 = v26;
      id v27 = v26;
      id v28 = [v27 countByEnumeratingWithState:&v65 objects:v72 count:16];
      if (v28)
      {
        id v29 = v28;
        uint64_t v30 = *(void *)v66;
        do
        {
          for (i = 0LL; i != v29; i = (char *)i + 1)
          {
            if (*(void *)v66 != v30) {
              objc_enumerationMutation(v27);
            }
            v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  self->_keyStorePath,  *(void *)(*((void *)&v65 + 1) + 8LL * (void)i)));
            [v23 addObject:v32];
          }

          id v29 = [v27 countByEnumeratingWithState:&v65 objects:v72 count:16];
        }

        while (v29);
      }

      v9 = v53;
      id v6 = v54;
      v26 = v57;
    }

    else
    {
      v23 = 0LL;
    }
  }

  int v33 = v56;
  if (!v23)
  {
    v48 = self->_log_handle;
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      keyStorePath = self->_keyStorePath;
      int v69 = 138412290;
      v70 = keyStorePath;
      _os_log_error_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_ERROR,  "Failed to enumerate the directory at '%@'",  (uint8_t *)&v69,  0xCu);
    }

    goto LABEL_48;
  }

  v53 = v9;
  id v54 = v6;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  id v34 = v23;
  id v57 = [v34 countByEnumeratingWithState:&v61 objects:v71 count:16];
  if (!v57) {
    goto LABEL_45;
  }
  uint64_t v35 = *(void *)v62;
  id v55 = v34;
  while (2)
  {
    for (j = 0LL; j != v57; j = (char *)j + 1)
    {
      if (*(void *)v62 != v35) {
        objc_enumerationMutation(v34);
      }
      uint64_t v37 = *(void *)(*((void *)&v61 + 1) + 8LL * (void)j);
      id v59 = 0LL;
      id v60 = 0LL;
      unsigned int v38 = -[ReadOnlyKeyStore readKeyFile:::::](self, "readKeyFile:::::", v37, 0LL, &v69, &v60, &v59);
      id v39 = v60;
      id v20 = v59;
      if (v38)
      {
        if (v69 != v33)
        {
          v46 = self->_log_handle;
          if (!os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_43;
          }
          v58[0] = 0;
          v44 = v46;
          v45 = "Current key does not match input key format. Skipping";
          goto LABEL_40;
        }

        if ([v39 length] == (id)32)
        {
          id v40 = v39;
          int v41 = memcmp([v40 bytes], __s2, (size_t)objc_msgSend(v40, "length"));
          v42 = self->_log_handle;
          BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
          if (!v41)
          {
            if (v43)
            {
              v58[0] = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "Found a matching private key",  (uint8_t *)v58,  2u);
            }

            id v50 = v55;
            id v6 = v54;
            goto LABEL_50;
          }

          int v33 = v56;
          id v34 = v55;
          if (v43)
          {
            v58[0] = 0;
            v44 = v42;
            v45 = "Mismatched key hashes. Skipping";
LABEL_40:
            _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, v45, (uint8_t *)v58, 2u);
          }
        }

        else
        {
          v47 = self->_log_handle;
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          {
            v58[0] = 0;
            _os_log_error_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_ERROR,  "Mismatched key hash lengths",  (uint8_t *)v58,  2u);
          }
        }
      }

- (void).cxx_destruct
{
}

@end