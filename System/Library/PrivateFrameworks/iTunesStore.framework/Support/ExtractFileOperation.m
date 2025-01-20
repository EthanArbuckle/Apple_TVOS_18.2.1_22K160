@interface ExtractFileOperation
- (BOOL)_applyFileAttributesToDirectory:(id)a3 error:(id *)a4;
- (BOOL)_performBOMCopy:(id *)a3;
- (NSDictionary)fileAttributes;
- (NSString)destinationFilePath;
- (NSString)sourceFilePath;
- (id)_newBOMCopierOptions;
- (int)sourceFileType;
- (void)_copierFinishedFileWithPath:(const char *)a3 size:(int64_t)a4;
- (void)_copierStartedFileWithPath:(const char *)a3 size:(int64_t)a4;
- (void)_copierUpdatedFileWithPath:(const char *)a3 size:(int64_t)a4;
- (void)_initializeProgress;
- (void)_updateProgressWithByteCount:(int64_t)a3;
- (void)dealloc;
- (void)run;
- (void)setDestinationFilePath:(id)a3;
- (void)setFileAttributes:(id)a3;
- (void)setSourceFilePath:(id)a3;
- (void)setSourceFileType:(int)a3;
@end

@implementation ExtractFileOperation

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ExtractFileOperation;
  -[ExtractFileOperation dealloc](&v3, "dealloc");
}

- (void)run
{
  uint64_t v4 = 0LL;
  BOOL v3 = -[ExtractFileOperation _performBOMCopy:](self, "_performBOMCopy:", &v4);
  if (v3) {
    -[ExtractFileOperation _applyFileAttributesToDirectory:error:]( self,  "_applyFileAttributesToDirectory:error:",  -[ExtractFileOperation destinationFilePath](self, "destinationFilePath"),  0LL);
  }
  -[ExtractFileOperation setError:](self, "setError:", v4);
  -[ExtractFileOperation setSuccess:](self, "setSuccess:", v3);
}

- (BOOL)_applyFileAttributesToDirectory:(id)a3 error:(id *)a4
{
  id v70 = 0LL;
  v6 = &ACSLocateCachingServer_ptr;
  id v7 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v7) {
    id v7 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v8 = [v7 shouldLog];
  else {
    unsigned int v9 = v8;
  }
  v10 = (os_log_s *)[v7 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = v9 & 2;
  }
  if ((_DWORD)v11)
  {
    v77.st_dev = 138412546;
    *(void *)&v77.st_mode = objc_opt_class(self);
    WORD2(v77.st_ino) = 2112;
    *(__darwin_ino64_t *)((char *)&v77.st_ino + 6) = (__darwin_ino64_t)a3;
    uint64_t v12 = _os_log_send_and_compose_impl( v11,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  1LL,  "%@: Fixing file permissions for %@",  &v77,  22);
    if (v12)
    {
      v13 = (void *)v12;
      v14 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v12, 4LL);
      free(v13);
      v57 = v14;
      SSFileLog(v7, @"%@");
    }
  }

  v62 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
  obj = -[NSFileManager subpathsOfDirectoryAtPath:error:](v62, "subpathsOfDirectoryAtPath:error:", a3, &v70);
  if (obj)
  {
    v61 = (NSMutableDictionary *)-[NSDictionary mutableCopy]( -[ExtractFileOperation fileAttributes](self, "fileAttributes"),  "mutableCopy");
    if (!v61) {
      v61 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    v60 = a4;
    __int128 v68 = 0u;
    __int128 v69 = 0u;
    __int128 v66 = 0u;
    __int128 v67 = 0u;
    id v15 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v66,  v78,  16LL,  v57);
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v67;
      unsigned __int8 v18 = 1;
      id v64 = a3;
LABEL_17:
      uint64_t v19 = 0LL;
      while (1)
      {
        if (*(void *)v67 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void *)(*((void *)&v66 + 1) + 8 * v19);
        v21 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
        id v22 = [a3 stringByAppendingPathComponent:v20];
        v23 = (const char *)[v22 fileSystemRepresentation];
        if (v23)
        {
          if (stat(v23, &v77))
          {
            id v24 = [v6[459] sharedDaemonConfig];
            if (!v24) {
              id v24 = [v6[459] sharedConfig];
            }
            unsigned int v25 = [v24 shouldLog];
            else {
              unsigned int v26 = v25;
            }
            v27 = (os_log_s *)[v24 OSLogObject];
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
              uint64_t v28 = v26;
            }
            else {
              uint64_t v28 = v26 & 2;
            }
            if ((_DWORD)v28)
            {
              uint64_t v29 = objc_opt_class(self);
              v30 = __error();
              v31 = strerror(*v30);
              int v71 = 138412802;
              uint64_t v72 = v29;
              __int16 v73 = 2112;
              id v74 = v22;
              __int16 v75 = 2080;
              id v76 = v31;
              LODWORD(v59) = 32;
              uint64_t v32 = _os_log_send_and_compose_impl( v28,  0LL,  0LL,  0LL,  &_mh_execute_header,  v27,  0LL,  "%@: Could not stat %@: %s",  &v71,  v59);
              if (v32)
              {
                v33 = (void *)v32;
                v34 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v32,  4LL);
                free(v33);
                v58 = v34;
                SSFileLog(v24, @"%@");
              }
            }

            unsigned __int8 v18 = 0;
            id v70 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  *__error(),  0LL);
            a3 = v64;
            v6 = &ACSLocateCachingServer_ptr;
          }

          else
          {
            v35 = objc_alloc(&OBJC_CLASS___NSNumber);
            v36 = -[NSNumber initWithShort:](v35, "initWithShort:", (__int16)v77.st_mode | 0x1B0u);
            -[NSMutableDictionary setObject:forKey:](v61, "setObject:forKey:", v36, NSFilePosixPermissions);

            id v70 = 0LL;
            unsigned __int8 v18 = -[NSFileManager setAttributes:ofItemAtPath:error:]( v62,  "setAttributes:ofItemAtPath:error:",  v61,  v22,  &v70);
            if ((v18 & 1) == 0)
            {
              id v37 = [v6[459] sharedDaemonConfig];
              if (!v37) {
                id v37 = [v6[459] sharedConfig];
              }
              LODWORD(v38) = [v37 shouldLog];
              v39 = (os_log_s *)[v37 OSLogObject];
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT)) {
                uint64_t v38 = v38;
              }
              else {
                v38 &= 2u;
              }
              if ((_DWORD)v38)
              {
                uint64_t v40 = objc_opt_class(self);
                int v71 = 138412802;
                uint64_t v72 = v40;
                __int16 v73 = 2112;
                id v74 = v22;
                __int16 v75 = 2112;
                id v76 = v70;
                LODWORD(v59) = 32;
                uint64_t v41 = _os_log_send_and_compose_impl( v38,  0LL,  0LL,  0LL,  &_mh_execute_header,  v39,  0LL,  "%@: Could not set file attributes for file: %@, error: %@",  &v71,  v59);
                if (v41)
                {
                  v42 = (void *)v41;
                  v43 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v41,  4LL);
                  free(v42);
                  v58 = v43;
                  SSFileLog(v37, @"%@");
                }
              }

              id v44 = v70;
              a3 = v64;
              v6 = &ACSLocateCachingServer_ptr;
            }
          }
        }

        -[NSAutoreleasePool drain](v21, "drain", v58);
        if ((v18 & 1) == 0) {
          break;
        }
        if (v16 == (id)++v19)
        {
          id v16 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v66,  v78,  16LL);
          if (v16) {
            goto LABEL_17;
          }
          break;
        }
      }
    }

    else
    {
      unsigned __int8 v18 = 1;
    }

    BOOL v54 = v18 & 1;
    a4 = v60;
  }

  else
  {
    id v45 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v45) {
      id v45 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v46 = objc_msgSend(v45, "shouldLog", v57);
    else {
      unsigned int v47 = v46;
    }
    v48 = (os_log_s *)[v45 OSLogObject];
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v49 = v47;
    }
    else {
      uint64_t v49 = v47 & 2;
    }
    if ((_DWORD)v49)
    {
      uint64_t v50 = objc_opt_class(self);
      v77.st_dev = 138412802;
      *(void *)&v77.st_mode = v50;
      WORD2(v77.st_ino) = 2112;
      *(__darwin_ino64_t *)((char *)&v77.st_ino + 6) = (__darwin_ino64_t)a3;
      HIWORD(v77.st_gid) = 2112;
      *(void *)&v77.st_rdev = v70;
      LODWORD(v59) = 32;
      uint64_t v51 = _os_log_send_and_compose_impl( v49,  0LL,  0LL,  0LL,  &_mh_execute_header,  v48,  0LL,  "%@: Could not get sub-paths of %@: %@",  &v77,  v59);
      if (v51)
      {
        v52 = (void *)v51;
        +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v51, 4LL);
        free(v52);
        SSFileLog(v45, @"%@");
      }
    }

    id v53 = v70;
    BOOL v54 = 0;
  }

  id v55 = v70;
  if (a4) {
    *a4 = v70;
  }
  return v54;
}

- (void)_copierFinishedFileWithPath:(const char *)a3 size:(int64_t)a4
{
  self->_activeFilePath = 0LL;
}

- (void)_copierStartedFileWithPath:(const char *)a3 size:(int64_t)a4
{
  self->_activeFileBytesCopied = 0LL;

  self->_activeFilePath = -[NSString initWithCString:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithCString:encoding:",  a3,  4LL);
}

- (void)_copierUpdatedFileWithPath:(const char *)a3 size:(int64_t)a4
{
  activeFilePath = self->_activeFilePath;
  if (activeFilePath)
  {
    if (!strcmp(a3, -[NSString cStringUsingEncoding:](activeFilePath, "cStringUsingEncoding:", 4LL)))
    {
      -[ExtractFileOperation _updateProgressWithByteCount:]( self,  "_updateProgressWithByteCount:",  a4 - self->_activeFileBytesCopied);
      self->_activeFileBytesCopied = a4;
    }
  }

- (void)_initializeProgress
{
  uint64_t v4 = 0LL;
  if (!BOMCopierCountFilesInArchive( 0LL,  -[NSString fileSystemRepresentation]( -[ExtractFileOperation sourceFilePath](self, "sourceFilePath"),  "fileSystemRepresentation"),  0LL,  &v4))
  {
    uint64_t v3 = OBJC_IVAR___ISOperation__progress;
    [*(id *)&self->ISOperation_opaque[OBJC_IVAR___ISOperation__progress] setUnits:1];
    [*(id *)&self->ISOperation_opaque[v3] setMaxValue:v4];
    [*(id *)&self->ISOperation_opaque[v3] resetSnapshots];
    self->_lastSnapshotTime = -1.79769313e308;
    -[ExtractFileOperation _updateProgressWithByteCount:](self, "_updateProgressWithByteCount:", 0LL);
  }

- (id)_newBOMCopierOptions
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  unsigned int v4 = -[ExtractFileOperation sourceFileType](self, "sourceFileType");
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

- (BOOL)_performBOMCopy:(id *)a3
{
  uint64_t v5 = BOMCopierNew(self, a2);
  if (!v5)
  {
    v27 = 0LL;
    BOOL v18 = 0;
    if (!a3) {
      return v18;
    }
    goto LABEL_30;
  }

  uint64_t v6 = v5;
  BOMCopierSetUserData(v5, self);
  BOMCopierSetCopyFileFinishedHandler(v6, sub_100065E5C);
  BOMCopierSetCopyFileStartedHandler(v6, sub_100065E90);
  BOMCopierSetCopyFileUpdateHandler(v6, sub_100065EC4);
  BOMCopierSetFatalErrorHandler(v6, sub_100065EF0);
  BOMCopierSetFatalFileErrorHandler(v6, sub_100066058);
  BOMCopierSetFileConflictErrorHandler(v6, sub_1000661D0);
  BOMCopierSetFileErrorHandler(v6, sub_10006633C);
  id v7 = -[NSString fileSystemRepresentation]( -[ExtractFileOperation sourceFilePath](self, "sourceFilePath"),  "fileSystemRepresentation");
  unsigned int v8 = -[NSString fileSystemRepresentation]( -[ExtractFileOperation destinationFilePath](self, "destinationFilePath"),  "fileSystemRepresentation");
  id v9 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v9) {
    id v9 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v10 = [v9 shouldLog];
  else {
    LODWORD(v11) = v10;
  }
  uint64_t v12 = (os_log_s *)[v9 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
    uint64_t v11 = v11;
  }
  else {
    v11 &= 2u;
  }
  if ((_DWORD)v11)
  {
    int v31 = 138412802;
    uint64_t v32 = objc_opt_class(self);
    __int16 v33 = 2080;
    v34 = v7;
    __int16 v35 = 2080;
    v36 = v8;
    uint64_t v13 = _os_log_send_and_compose_impl( v11,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  1LL,  "%@: Extracting %s to %s",  &v31,  32);
    if (v13)
    {
      v14 = (void *)v13;
      id v15 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v13, 4LL);
      free(v14);
      uint64_t v29 = v15;
      SSFileLog(v9, @"%@");
    }
  }

  id v16 = -[ExtractFileOperation _newBOMCopierOptions](self, "_newBOMCopierOptions", v29);
  int v17 = BOMCopierCopyWithOptions(v6, v7, v8, v16);
  BOOL v18 = v17 == 0;
  if (v17)
  {
    int v19 = v17;
    id v20 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v20) {
      id v20 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v21 = [v20 shouldLog];
    else {
      LODWORD(v22) = v21;
    }
    v23 = (os_log_s *)[v20 OSLogObject];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v22 = v22;
    }
    else {
      v22 &= 2u;
    }
    if ((_DWORD)v22)
    {
      uint64_t v24 = objc_opt_class(self);
      int v31 = 138412546;
      uint64_t v32 = v24;
      __int16 v33 = 1024;
      LODWORD(v34) = v19;
      LODWORD(v30) = 18;
      uint64_t v25 = _os_log_send_and_compose_impl( v22,  0LL,  0LL,  0LL,  &_mh_execute_header,  v23,  0LL,  "%@: BOMCopier failed with error: %d",  &v31,  v30);
      if (v25)
      {
        unsigned int v26 = (void *)v25;
        +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v25, 4LL);
        free(v26);
        SSFileLog(v20, @"%@");
      }
    }

    v27 = (void *)ISError(7LL, 0LL, 0LL);
  }

  else
  {
    v27 = 0LL;
  }

  BOMCopierFree(v6);
  if (a3) {
LABEL_30:
  }
    *a3 = v27;
  return v18;
}

- (void)_updateProgressWithByteCount:(int64_t)a3
{
  uint64_t v5 = OBJC_IVAR___ISOperation__progress;
  uint64_t v6 = (char *)[*(id *)&self->ISOperation_opaque[OBJC_IVAR___ISOperation__progress] currentValue];
  id v7 = &v6[a3];
  if (v7 != v6) {
    [*(id *)&self->ISOperation_opaque[v5] setCurrentValue:v7];
  }
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (self->_lastSnapshotTime + kSSOperationDefaultSnapshotInterval < Current)
  {
    [*(id *)&self->ISOperation_opaque[v5] snapshot];
    -[ExtractFileOperation sendProgressToDelegate](self, "sendProgressToDelegate");
    self->_lastSnapshotTime = Current;
  }

- (NSString)destinationFilePath
{
  return (NSString *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setDestinationFilePath:(id)a3
{
}

- (NSDictionary)fileAttributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setFileAttributes:(id)a3
{
}

- (NSString)sourceFilePath
{
  return (NSString *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setSourceFilePath:(id)a3
{
}

- (int)sourceFileType
{
  return self->_sourceFileType;
}

- (void)setSourceFileType:(int)a3
{
  self->_sourceFileType = a3;
}

@end