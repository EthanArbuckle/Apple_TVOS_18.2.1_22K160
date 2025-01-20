@interface KeyStore
- (void)RotateKeys:(void *)a3;
@end

@implementation KeyStore

- (void)RotateKeys:(void *)a3
{
  if (!self->super.super._singleFileMode)
  {
    keyStorePath = self->super.super._keyStorePath;
    id v109 = 0LL;
    char v6 = sub_100012470(keyStorePath, &v109, 420);
    id v7 = v109;
    v8 = v7;
    if ((v6 & 1) == 0)
    {
      log_handle = self->super.super._log_handle;
      if (os_log_type_enabled(log_handle, OS_LOG_TYPE_ERROR))
      {
        v112[0] = 138412290;
        *(void *)&v112[1] = v8;
        _os_log_error_impl( (void *)&_mh_execute_header,  log_handle,  OS_LOG_TYPE_ERROR,  "Failed to setup the key-store directory.Error: %@",  (uint8_t *)v112,  0xCu);
      }

      id v13 = 0LL;
      goto LABEL_66;
    }

    v88 = (uint64_t (*)(id))a3;
    id v89 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 contentsOfDirectoryAtPath:self->super.super._keyStorePath error:0]);

    __int128 v107 = 0u;
    __int128 v108 = 0u;
    __int128 v105 = 0u;
    __int128 v106 = 0u;
    id v11 = v10;
    id v93 = v11;
    v98 = (uint64_t (**)(id))[v11 countByEnumeratingWithState:&v105 objects:v113 count:16];
    if (v98)
    {
      id v92 = 0LL;
      id v94 = 0LL;
      id v95 = 0LL;
      id v13 = 0LL;
      v14 = *(void **)v106;
      id v96 = 0LL;
      v97 = v14;
      *(void *)&__int128 v12 = 138412290LL;
      __int128 v91 = v12;
      *(void *)&__int128 v12 = 138412546LL;
      __int128 v90 = v12;
      do
      {
        for (i = 0LL; i != v98; i = (uint64_t (**)(id))((char *)i + 1))
        {
          uint64_t v16 = *(void *)(*((void *)&v105 + 1) + 8LL * (void)i);
          v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  self->super.super._keyStorePath,  v16));
          id v104 = 0LL;
          unsigned __int8 v18 = -[ReadOnlyKeyStore readKeyFile:::::](self, "readKeyFile:::::", v17, &v104, &v110, 0LL, 0LL);
          id v19 = v104;
          v20 = v19;
          if ((v18 & 1) != 0)
          {
            if (v110 == 1)
            {
              v21 = (void *)objc_claimAutoreleasedReturnValue([v19 fileCreationDate]);
              if (!v96 || [v94 compare:v21] == (id)1)
              {
                id v22 = v17;

                id v23 = v21;
                id v94 = v23;
                id v96 = v22;
              }

              if (!v95 || [v92 compare:v21] == (id)-1)
              {
                id v24 = v17;

                id v25 = v21;
                id v92 = v25;
                id v95 = v24;
              }
            }

            else
            {
              v31 = self->super.super._log_handle;
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(v112[0]) = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Current key does not match expected key format. Skipping",  (uint8_t *)v112,  2u);
              }
            }
          }

          else
          {
            v26 = self->super.super._log_handle;
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              v112[0] = v91;
              *(void *)&v112[1] = v16;
              _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Deleting unparseable file '%@'",  (uint8_t *)v112,  0xCu);
            }

            v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
            id v103 = v13;
            unsigned __int8 v28 = [v27 removeItemAtPath:v16 error:&v103];
            id v29 = v103;

            if ((v28 & 1) == 0)
            {
              v30 = self->super.super._log_handle;
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              {
                v32 = v30;
                v33 = (void *)objc_claimAutoreleasedReturnValue([v29 localizedDescription]);
                v112[0] = v90;
                *(void *)&v112[1] = v16;
                LOWORD(v112[3]) = 2112;
                *(void *)((char *)&v112[3] + 2) = v33;
                _os_log_error_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "Failed to delete file '%@'. Error: %@",  (uint8_t *)v112,  0x16u);
              }
            }

            id v13 = v29;
            id v11 = v93;
          }
        }

        v98 = (uint64_t (**)(id))[v11 countByEnumeratingWithState:&v105 objects:v113 count:16];
      }

      while (v98);

      if (v95)
      {
        [v92 timeIntervalSinceNow];
        BOOL v35 = fabs(v34) > 432000.0;
      }

      else
      {
        BOOL v35 = 1;
      }

      id v37 = v96;
      if (v96 && ([v96 isEqualToString:v95] & 1) == 0)
      {
        id v37 = v96;
        unlink((const char *)[v37 UTF8String]);
        if (v35) {
          goto LABEL_37;
        }
      }

      else if (v35)
      {
        goto LABEL_37;
      }

      v70 = self->super.super._log_handle;
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v112[0]) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v70,  OS_LOG_TYPE_DEFAULT,  "Reusing an existing key file",  (uint8_t *)v112,  2u);
      }

      id v99 = 0LL;
      id v100 = 0LL;
      unsigned __int8 v71 = -[ReadOnlyKeyStore readKeyFile:::::](self, "readKeyFile:::::", v95, 0LL, &v110, &v100, &v99);
      id v72 = v100;
      id v73 = v99;
      if ((v71 & 1) != 0)
      {
        v74 = -[ReadOnlyKeyStore getEccFormat:](self, "getEccFormat:", v110);
        __chkstk_darwin();
        v76 = (char *)&v88 - v75;
        int v77 = ccec_x963_import_priv( &v74->var0, (unint64_t)[v73 length], (unsigned __int8 *)objc_msgSend(v73, "bytes"), (unint64_t **)((char *)&v88 - v75));
        if (v77)
        {
          int v78 = v77;
          cc_clear(24 * v74->var0 + 16, v76);
          v79 = self->super.super._log_handle;
          if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
          {
            v112[0] = 67109120;
            v112[1] = v78;
            _os_log_error_impl( (void *)&_mh_execute_header,  v79,  OS_LOG_TYPE_ERROR,  "Failed to parse the current private key. CoreCrypto error %d",  (uint8_t *)v112,  8u);
          }
        }

        else
        {
          v81 = +[NSMutableData dataWithLength:]( &OBJC_CLASS___NSMutableData,  "dataWithLength:",  ((unint64_t)(cczp_bitlen((uint64_t)v74) + 7) >> 2) | 1);
          id v82 = objc_claimAutoreleasedReturnValue(v81);
          ccec_x963_export(0, (char *)[v82 mutableBytes], (uint64_t *)v76);
          cc_clear(24 * v74->var0 + 16, v76);
          if ((v88(v82) & 1) == 0)
          {
            v83 = self->super.super._log_handle;
            if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
            {
              LOWORD(v112[0]) = 0;
              _os_log_error_impl( (void *)&_mh_execute_header,  v83,  OS_LOG_TYPE_ERROR,  "Failed to call the new public key callback with an existing key",  (uint8_t *)v112,  2u);
            }
          }
        }
      }

      else
      {
        v80 = self->super.super._log_handle;
        if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v112[0]) = 0;
          _os_log_error_impl( (void *)&_mh_execute_header,  v80,  OS_LOG_TYPE_ERROR,  "Failed to read existing key file",  (uint8_t *)v112,  2u);
        }
      }

      goto LABEL_65;
    }

    id v13 = 0LL;
    id v37 = 0LL;
    id v94 = 0LL;
    id v95 = 0LL;
    id v92 = 0LL;
LABEL_37:
    id v96 = v37;
    v38 = self->super.super._log_handle;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v112[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "Creating a new key file",  (uint8_t *)v112,  2u);
    }

    v39 = -[ReadOnlyKeyStore getEccFormat:](self, "getEccFormat:", 1LL);
    v98 = &v88;
    __chkstk_darwin();
    v41 = (uint64_t **)((char *)&v88 - v40);
    v42 = ccrng(0LL);
    ccecdh_generate_key((uint64_t *)v39, (uint64_t (**)(void, uint64_t, uint64_t *))v42, v41);
    unint64_t v43 = 3 * ((unint64_t)(cczp_bitlen((uint64_t)v39) + 7) >> 3) + 1;
    unint64_t v44 = ((unint64_t)(cczp_bitlen((uint64_t)v39) + 7) >> 2) | 1;
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](&OBJC_CLASS___NSMutableData, "dataWithLength:", v43));
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](&OBJC_CLASS___NSMutableData, "dataWithLength:", v44));
    id v47 = v45;
    ccec_x963_export(1, (char *)[v47 mutableBytes], (uint64_t *)v41);
    id v48 = v46;
    ccec_x963_export(0, (char *)[v48 mutableBytes], (uint64_t *)v41);
    cc_clear((32 * v39->var0) | 0x10, v41);
    memset(v112, 0, 32);
    v49 = ccsha256_di();
    id v50 = [v48 length];
    id v51 = v48;
    ccdigest((uint64_t)v49, (size_t)v50, (char *)[v51 bytes], (uint64_t)v112);
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v112, 32LL));
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  0x4D414749434B4559LL));
    [v53 setObject:v54 forKeyedSubscript:@"magic"];

    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", 1LL));
    [v53 setObject:v55 forKeyedSubscript:@"version"];

    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
    [v53 setObject:v56 forKeyedSubscript:@"key_format"];

    v97 = v52;
    v57 = (void *)objc_claimAutoreleasedReturnValue([v52 base64EncodedStringWithOptions:0]);
    [v53 setObject:v57 forKeyedSubscript:@"public_key_hash"];

    v58 = (void *)objc_claimAutoreleasedReturnValue([v47 base64EncodedStringWithOptions:0]);
    [v53 setObject:v58 forKeyedSubscript:@"full_key"];

    v59 = self->super.super._keyStorePath;
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v60 timeIntervalSince1970];
    v62 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%llu.key",  v59,  (unint64_t)v61));

    id v102 = v13;
    v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v53,  0LL,  &v102));
    id v64 = v102;

    if (v63)
    {
      id v101 = v64;
      unsigned __int8 v65 = [v63 writeToFile:v62 options:0x40000000 error:&v101];
      id v13 = v101;

      if ((v65 & 1) != 0)
      {
        if ((v88(v51) & 1) == 0)
        {
          v66 = self->super.super._log_handle;
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v110) = 0;
            _os_log_error_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_ERROR,  "Failed to call the new public key callback",  (uint8_t *)&v110,  2u);
          }

          unlink((const char *)[v62 UTF8String]);
        }
      }

      else
      {
        v68 = self->super.super._log_handle;
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
        {
          v86 = v68;
          v87 = (void *)objc_claimAutoreleasedReturnValue([v13 localizedDescription]);
          unsigned int v110 = 138412290;
          v111 = v87;
          _os_log_error_impl( (void *)&_mh_execute_header,  v86,  OS_LOG_TYPE_ERROR,  "Failed to write to the new key file. Error: %@",  (uint8_t *)&v110,  0xCu);
        }
      }
    }

    else
    {
      v67 = self->super.super._log_handle;
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
      {
        v84 = v67;
        v85 = (void *)objc_claimAutoreleasedReturnValue([v64 localizedDescription]);
        unsigned int v110 = 138412290;
        v111 = v85;
        _os_log_error_impl( (void *)&_mh_execute_header,  v84,  OS_LOG_TYPE_ERROR,  "Failed to generate JSON data for key file. Error: %@",  (uint8_t *)&v110,  0xCu);
      }

      id v13 = v64;
    }

    v69 = v97;

    id v11 = v93;
LABEL_65:

    v8 = v89;
LABEL_66:
  }

@end