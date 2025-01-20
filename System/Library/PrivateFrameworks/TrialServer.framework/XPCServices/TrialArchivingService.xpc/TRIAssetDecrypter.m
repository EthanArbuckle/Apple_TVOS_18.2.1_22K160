@interface TRIAssetDecrypter
+ (BOOL)decryptAssetWithURL:(id)a3 destinationFileURL:(id)a4 keyFileURL:(id)a5;
@end

@implementation TRIAssetDecrypter

+ (BOOL)decryptAssetWithURL:(id)a3 destinationFileURL:(id)a4 keyFileURL:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = TRILogCategory_Archiving();
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (char *)objc_claimAutoreleasedReturnValue([v9 path]);
    v15 = (char *)objc_claimAutoreleasedReturnValue([v10 path]);
    *(_DWORD *)buf = 138412546;
    v82 = v14;
    __int16 v83 = 2112;
    v84 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Decrypting file with URL: %@ to destination: %@",  buf,  0x16u);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue([v11 path]);
  id v17 = v16;
  v18 = (const char *)[v17 fileSystemRepresentation];

  int v19 = open(v18, 0);
  int v20 = v19;
  if (v19 < 0)
  {
    id v36 = TRILogCategory_Archiving();
    v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v49 = __error();
      v50 = strerror(*v49);
      int v51 = *__error();
      *(_DWORD *)buf = 136315650;
      v82 = v18;
      __int16 v83 = 2080;
      v84 = v50;
      __int16 v85 = 1024;
      int v86 = v51;
      _os_log_error_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_ERROR,  "Couldn't open the key file at path %s: %s (%d)",  buf,  0x1Cu);
    }
  }

  else
  {
    ssize_t v21 = read(v19, buf, 0x20uLL);
    id v22 = TRILogCategory_Archiving();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    v24 = v23;
    if (v21 == 32)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v75 = 136315138;
        v76 = (void *)v18;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Found decryption key file at path: %s",  v75,  0xCu);
      }

      close(v20);
      v25 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);
      if (!v25)
      {
        v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
        [v73 handleFailureInMethod:a2, a1, @"TRIAssetDecrypter.m", 52, @"Expression was unexpectedly nil/false: %@", @"assetURL.path" object file lineNumber description];
      }

      id v26 = v25;
      v27 = AAFileStreamOpenWithPath((const char *)[v26 fileSystemRepresentation], 0, 0x1A4u);

      if (!v27)
      {
        id v38 = TRILogCategory_Archiving();
        v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          v58 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);
          v59 = __error();
          v60 = strerror(*v59);
          int v61 = *__error();
          *(_DWORD *)v75 = 138412802;
          v76 = v58;
          __int16 v77 = 2080;
          v78 = v60;
          __int16 v79 = 1024;
          int v80 = v61;
          _os_log_error_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_ERROR,  "Error reading encrypted file for asset %@: %s (%d)",  v75,  0x1Cu);
        }

        BOOL v35 = 0;
        goto LABEL_41;
      }

      v28 = AEAContextCreateWithEncryptedStream(v27);
      v29 = v28;
      if (v28)
      {
        if ((AEAContextSetFieldBlob(v28, 9u, 0, buf, 0x20uLL) & 0x80000000) == 0)
        {
          v30 = AEADecryptionInputStreamOpen(v27, v29, 0x4000000000000000uLL, 0);
          if (v30)
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue([v10 path]);
            if (!v31)
            {
              v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
              [v74 handleFailureInMethod:a2, a1, @"TRIAssetDecrypter.m", 91, @"Expression was unexpectedly nil/false: %@", @"destinationFileURL.path" object file lineNumber description];
            }

            id v32 = v31;
            v33 = (const char *)[v32 fileSystemRepresentation];

            v34 = AAFileStreamOpenWithPath(v33, 513, 0x1A4u);
            BOOL v35 = v34 != 0LL;
            if (v34)
            {
              AAByteStreamProcess(v30, v34);
            }

            else
            {
              id v55 = TRILogCategory_Archiving();
              v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
              if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
              {
                v69 = (void *)objc_claimAutoreleasedReturnValue([v10 path]);
                v70 = __error();
                v71 = strerror(*v70);
                int v72 = *__error();
                *(_DWORD *)v75 = 138412802;
                v76 = v69;
                __int16 v77 = 2080;
                v78 = v71;
                __int16 v79 = 1024;
                int v80 = v72;
                _os_log_error_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_ERROR,  "Error creating destination file %@: %s (%d)",  v75,  0x1Cu);
              }
            }

            AAByteStreamClose(v34);
          }

          else
          {
            id v47 = TRILogCategory_Archiving();
            v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              v65 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);
              v66 = __error();
              v67 = strerror(*v66);
              int v68 = *__error();
              *(_DWORD *)v75 = 138412802;
              v76 = v65;
              __int16 v77 = 2080;
              v78 = v67;
              __int16 v79 = 1024;
              int v80 = v68;
              _os_log_error_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_ERROR,  "Error calling AEADecryptionInputStreamOpen for asset %@: %s (%d)",  v75,  0x1Cu);
            }

            BOOL v35 = 0;
          }

          AAByteStreamClose(v30);
          goto LABEL_40;
        }

        id v46 = TRILogCategory_Archiving();
        v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          v62 = __error();
          v63 = strerror(*v62);
          int v64 = *__error();
          *(_DWORD *)v75 = 136315394;
          v76 = v63;
          __int16 v77 = 1024;
          LODWORD(v78) = v64;
          _os_log_error_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_ERROR,  "Decryption context setup failed: %s (%d)",  v75,  0x12u);
        }
      }

      else
      {
        id v40 = TRILogCategory_Archiving();
        v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);
          v43 = __error();
          v44 = strerror(*v43);
          int v45 = *__error();
          *(_DWORD *)v75 = 138412802;
          v76 = v42;
          __int16 v77 = 2080;
          v78 = v44;
          __int16 v79 = 1024;
          int v80 = v45;
          _os_log_error_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_ERROR,  "Decryption context creation failed for asset %@: %s (%d)",  v75,  0x1Cu);
        }
      }

      BOOL v35 = 0;
LABEL_40:
      AEAContextDestroy(v29);
LABEL_41:
      AAByteStreamClose(v27);
      goto LABEL_42;
    }

    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v52 = __error();
      v53 = strerror(*v52);
      int v54 = *__error();
      *(_DWORD *)v75 = 136315650;
      v76 = (void *)v18;
      __int16 v77 = 2080;
      v78 = v53;
      __int16 v79 = 1024;
      int v80 = v54;
      _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "Couldn't read the key file at path %s: %s (%d)",  v75,  0x1Cu);
    }
  }

  close(v20);
  BOOL v35 = 0;
LABEL_42:

  return v35;
}

@end