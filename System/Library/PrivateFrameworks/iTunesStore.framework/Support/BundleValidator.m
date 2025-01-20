@interface BundleValidator
- (BOOL)_extraMetaDataFromBOM:(id)a3 error:(id *)a4;
- (BOOL)_verifyBundleIdentfiier:(id)a3 bundleVersion:(id)a4 packagePath:(id)a5;
- (BOOL)validate:(id *)a3;
- (NSString)bundleIdentifier;
- (NSString)bundleVersion;
- (NSString)sourceURL;
- (id)_createScratchDirectory;
- (id)_newBOMCopierOptions;
- (int)bundleFileType;
- (void)_removeScratchDirectory:(id)a3;
- (void)setBundleFileType:(int)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setBundleVersion:(id)a3;
- (void)setSourceURL:(id)a3;
@end

@implementation BundleValidator

- (BOOL)validate:(id *)a3
{
  if (self->_sourceURL)
  {
    v4 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    BYTE3(v111) = 0;
    unsigned int v6 = [v5 fileExistsAtPath:self->_sourceURL isDirectory:(char *)&v111 + 3];
    id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", self->_sourceURL));
    BYTE4(v111) = 110;
    id v8 = v7;
    ssize_t v9 = getxattr( (const char *)[v8 fileSystemRepresentation],  "com.apple.streamingzip.incomplete_extraction",  (char *)&v111 + 4,  1uLL,  0,  1);
    if (v9 == -1)
    {
      if (*__error() == 93) {
        goto LABEL_42;
      }
      if (*__error() == 34) {
        goto LABEL_4;
      }
    }

    else if ((v9 & 0x8000000000000000LL) == 0)
    {
LABEL_4:

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
      if (!v10) {
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v11 = [v10 shouldLog];
      else {
        unsigned int v12 = v11;
      }
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 OSLogObject]);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        uint64_t v14 = v12;
      }
      else {
        uint64_t v14 = v12 & 2;
      }
      if (!(_DWORD)v14) {
        goto LABEL_117;
      }
      v15 = (void *)objc_opt_class(self);
      bundleIdentifier = self->_bundleIdentifier;
      sourceURL = self->_sourceURL;
      int v112 = 138412802;
      uint64_t v113 = (uint64_t)v15;
      __int16 v114 = 2112;
      ssize_t v115 = (ssize_t)bundleIdentifier;
      *(_WORD *)v116 = 2112;
      *(void *)&v116[2] = sourceURL;
      id v18 = v15;
      uint64_t v19 = _os_log_send_and_compose_impl( v14,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  16LL,  "%@: Download was incomplete for bundlerIdenfier: %@ path: %@",  &v112,  32);
LABEL_115:
      v85 = (void *)v19;

      if (!v85) {
        goto LABEL_118;
      }
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v85,  4LL));
      free(v85);
      SSFileLog(v10, @"%@");
LABEL_117:

LABEL_118:
      BOOL v28 = 0;
      v20 = 0LL;
      if (v4) {
        goto LABEL_119;
      }
      goto LABEL_121;
    }

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v29) {
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v30 = [v29 shouldLog];
    else {
      LODWORD(v31) = v30;
    }
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue([v29 OSLogObject]);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      uint64_t v31 = v31;
    }
    else {
      v31 &= 2u;
    }
    if ((_DWORD)v31)
    {
      v33 = v5;
      v34 = v4;
      id v35 = [v8 fileSystemRepresentation];
      v36 = __error();
      v37 = strerror(*v36);
      int v112 = 136315650;
      uint64_t v113 = (uint64_t)"com.apple.streamingzip.incomplete_extraction";
      __int16 v114 = 2080;
      ssize_t v115 = (ssize_t)v35;
      v4 = v34;
      v5 = v33;
      *(_WORD *)v116 = 2080;
      *(void *)&v116[2] = v37;
      v38 = (void *)_os_log_send_and_compose_impl( v31,  0LL,  0LL,  0LL,  &_mh_execute_header,  v32,  16LL,  "Got unknown error from getxattr when checking for %s on %s : %s",  (const char *)&v112,  32,  v110);

      if (!v38)
      {
LABEL_41:

LABEL_42:
        if (BYTE3(v111)) {
          unsigned int v39 = 0;
        }
        else {
          unsigned int v39 = v6;
        }
        if (v39 != 1)
        {
          if (BYTE3(v111))
          {
            if (-[BundleValidator _verifyBundleIdentfiier:bundleVersion:packagePath:]( self,  "_verifyBundleIdentfiier:bundleVersion:packagePath:",  self->_bundleIdentifier,  self->_bundleVersion,  self->_sourceURL))
            {
              v20 = 0LL;
              BOOL v28 = 1;
            }

            else
            {
              v20 = (char *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  SSErrorDomain,  143LL,  0LL));
              BOOL v28 = 0;
              if (v4) {
                goto LABEL_119;
              }
            }

            goto LABEL_121;
          }

          v10 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
          if (!v10) {
            v10 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
          }
          unsigned int v58 = objc_msgSend(v10, "shouldLog", v107);
          else {
            unsigned int v59 = v58;
          }
          v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 OSLogObject]);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            uint64_t v60 = v59;
          }
          else {
            uint64_t v60 = v59 & 2;
          }
          if (!(_DWORD)v60) {
            goto LABEL_117;
          }
          v61 = (void *)objc_opt_class(self);
          v62 = self->_bundleIdentifier;
          v63 = self->_sourceURL;
          int v112 = 138412802;
          uint64_t v113 = (uint64_t)v61;
          __int16 v114 = 2112;
          ssize_t v115 = (ssize_t)v62;
          *(_WORD *)v116 = 2112;
          *(void *)&v116[2] = v63;
          id v18 = v61;
          LODWORD(v109) = 32;
          uint64_t v19 = _os_log_send_and_compose_impl( v60,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  16LL,  "%@: Invalid path for bundlerIdenfier: %@ path: %@",  &v112,  v109);
          goto LABEL_115;
        }

        id v40 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", self->_sourceURL));
        HIDWORD(v111) = 0;
        id v41 = v40;
        int v42 = open((const char *)[v41 fileSystemRepresentation], 256);
        if ((v42 & 0x80000000) == 0)
        {
          int v43 = v42;
          ssize_t v44 = read(v42, (char *)&v111 + 4, 4uLL);
          if (v44 == 4)
          {
            if (HIDWORD(v111) == 67324752)
            {
              close(v43);

              v45 = (void *)objc_claimAutoreleasedReturnValue(-[BundleValidator _createScratchDirectory](self, "_createScratchDirectory"));
              if (v45)
              {
                v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v45));
                v110 = 0LL;
                unsigned int v47 = -[BundleValidator _extraMetaDataFromBOM:error:](self, "_extraMetaDataFromBOM:error:", v46, &v110);
                v20 = v110;

                if (v47)
                {
                  if (-[BundleValidator _verifyBundleIdentfiier:bundleVersion:packagePath:]( self,  "_verifyBundleIdentfiier:bundleVersion:packagePath:",  self->_bundleIdentifier,  self->_bundleVersion,  v45))
                  {
                    char v48 = 1;
                  }

                  else
                  {
                    uint64_t v106 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  SSErrorDomain,  143LL,  0LL));

                    char v48 = 0;
                    v20 = (char *)v106;
                  }

                  goto LABEL_152;
                }

- (id)_createScratchDirectory
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  if (qword_1003A3458 != -1) {
    dispatch_once(&qword_1003A3458, &stru_10034E9C8);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", qword_1003A3450));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:v6]);
  id v19 = 0LL;
  unsigned int v8 = [v3 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:&v19];
  id v9 = v19;
  id v10 = 0LL;
  if (v8)
  {
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v11) {
      unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v12 = [v11 shouldLog];
    else {
      LODWORD(v13) = v12;
    }
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 OSLogObject]);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
      uint64_t v13 = v13;
    }
    else {
      v13 &= 2u;
    }
    if ((_DWORD)v13)
    {
      v15 = (void *)objc_opt_class(self);
      int v20 = 138412802;
      unsigned int v21 = v15;
      __int16 v22 = 2112;
      v23 = v7;
      __int16 v24 = 1024;
      int v25 = 1;
      id v16 = v15;
      v17 = (void *)_os_log_send_and_compose_impl( v13,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  1LL,  "%@: Scratch directory for %@ result: %d",  &v20,  28);

      if (!v17)
      {
LABEL_16:

        id v10 = v7;
        goto LABEL_17;
      }

      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v17,  4LL));
      free(v17);
      SSFileLog(v11, @"%@");
    }

    goto LABEL_16;
  }

- (BOOL)_extraMetaDataFromBOM:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v8 = BOMCopierNew(v6, v7);
  if (!v8)
  {
    unsigned int v30 = 0LL;
    BOOL v20 = 0;
    if (!a4) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }

  uint64_t v9 = v8;
  BOMCopierSetUserData(v8, self);
  BOMCopierSetCopyFileStartedHandler(v9, sub_10010838C);
  BOMCopierSetFatalErrorHandler(v9, sub_1001083E4);
  BOMCopierSetFatalFileErrorHandler(v9, sub_100108574);
  BOMCopierSetFileConflictErrorHandler(v9, sub_10010871C);
  BOMCopierSetFileErrorHandler(v9, sub_1001088B0);
  id v10 = -[NSString fileSystemRepresentation](self->_sourceURL, "fileSystemRepresentation");
  id v11 = [v6 fileSystemRepresentation];
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v12) {
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v13 = [v12 shouldLog];
  else {
    LODWORD(v14) = v13;
  }
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 OSLogObject]);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v14 = v14;
  }
  else {
    v14 &= 2u;
  }
  if ((_DWORD)v14)
  {
    int v34 = 138412802;
    id v35 = (id)objc_opt_class(self);
    __int16 v36 = 2080;
    v37 = v10;
    __int16 v38 = 2080;
    id v39 = v11;
    id v16 = v35;
    v17 = (void *)_os_log_send_and_compose_impl( v14,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "%@: Extracting %s to %s",  &v34,  32);

    if (!v17) {
      goto LABEL_14;
    }
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v17,  4LL));
    free(v17);
    v32 = v15;
    SSFileLog(v12, @"%@");
  }

LABEL_14:
  id v18 = -[BundleValidator _newBOMCopierOptions](self, "_newBOMCopierOptions");
  int v19 = BOMCopierCopyWithOptions(v9, v10, v11, v18);
  BOOL v20 = v19 == 0;
  if (v19)
  {
    int v21 = v19;
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v22) {
      __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v23 = objc_msgSend(v22, "shouldLog", v32);
    else {
      LODWORD(v24) = v23;
    }
    int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue([v22 OSLogObject]);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      uint64_t v24 = v24;
    }
    else {
      v24 &= 2u;
    }
    if ((_DWORD)v24)
    {
      id v26 = (void *)objc_opt_class(self);
      int v34 = 138412546;
      id v35 = v26;
      __int16 v36 = 1024;
      LODWORD(v37) = v21;
      id v27 = v26;
      LODWORD(v33) = 18;
      BOOL v28 = (void *)_os_log_send_and_compose_impl( v24,  0LL,  0LL,  0LL,  &_mh_execute_header,  v25,  16LL,  "%@: BOMCopier failed with error: %d",  &v34,  v33);

      if (!v28)
      {
LABEL_27:

        uint64_t v29 = ISError(7LL, 0LL, 0LL);
        unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
        goto LABEL_31;
      }

      int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v28,  4LL));
      free(v28);
      SSFileLog(v22, @"%@");
    }

    goto LABEL_27;
  }

  unsigned int v30 = 0LL;
LABEL_31:
  BOMCopierFree(v9);

  if (a4) {
LABEL_32:
  }
    *a4 = v30;
LABEL_33:

  return v20;
}

- (id)_newBOMCopierOptions
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  unsigned int v4 = -[BundleValidator bundleFileType](self, "bundleFileType");
  if (v4 == 1)
  {
    v5 = @"extractCPIO";
    goto LABEL_5;
  }

  if (!v4)
  {
    v5 = @"extractPKZip";
LABEL_5:
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", kCFBooleanTrue, v5);
  }

  return v3;
}

- (void)_removeScratchDirectory:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  [v4 removeItemAtPath:v3 error:0];
}

- (BOOL)_verifyBundleIdentfiier:(id)a3 bundleVersion:(id)a4 packagePath:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
  v82 = v9;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByAppendingPathComponent:@"Payload"]);
  id v89 = 0LL;
  uint64_t v81 = v10;
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSFileManager contentsOfDirectoryAtPath:error:](v10, "contentsOfDirectoryAtPath:error:", v11, &v89));
  id v79 = v89;
  __int128 v85 = 0u;
  __int128 v86 = 0u;
  __int128 v87 = 0u;
  __int128 v88 = 0u;
  id v13 = v12;
  id v14 = [v13 countByEnumeratingWithState:&v85 objects:v96 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v86;
LABEL_3:
    uint64_t v17 = 0LL;
    while (1)
    {
      if (*(void *)v86 != v16) {
        objc_enumerationMutation(v13);
      }
      id v18 = *(void **)(*((void *)&v85 + 1) + 8 * v17);
      if (v15 == (id)++v17)
      {
        id v15 = [v13 countByEnumeratingWithState:&v85 objects:v96 count:16];
        if (v15) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    id v19 = [v18 copy];
    BOOL v20 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v20) {
      BOOL v20 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v21 = [v20 shouldLog];
    else {
      LODWORD(v22) = v21;
    }
    unsigned int v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 OSLogObject]);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO)) {
      uint64_t v22 = v22;
    }
    else {
      v22 &= 2u;
    }
    if ((_DWORD)v22)
    {
      uint64_t v24 = (void *)objc_opt_class(self);
      int v90 = 138412546;
      uint64_t v91 = v24;
      __int16 v92 = 2112;
      id v93 = v19;
      id v25 = v24;
      id v26 = (void *)_os_log_send_and_compose_impl( v22,  0LL,  0LL,  0LL,  &_mh_execute_header,  v23,  1LL,  "%@: appName: %@",  &v90,  22);

      if (!v26)
      {
LABEL_22:

        goto LABEL_23;
      }

      unsigned int v23 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v26,  4LL));
      free(v26);
      id v71 = v23;
      SSFileLog(v20, @"%@");
    }

    goto LABEL_22;
  }

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
}

- (NSString)sourceURL
{
  return self->_sourceURL;
}

- (void)setSourceURL:(id)a3
{
}

- (int)bundleFileType
{
  return self->_bundleFileType;
}

- (void)setBundleFileType:(int)a3
{
  self->_bundleFileType = a3;
}

- (void).cxx_destruct
{
}

@end