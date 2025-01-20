@interface CPLBucketFileStorage
- (BOOL)_fixupStoredDestinationURL:(id)a3 isOriginal:(BOOL)a4 needsCommit:(BOOL *)a5 error:(id *)a6;
- (BOOL)_getIsOriginal:(BOOL *)a3 markedForDelete:(BOOL *)a4 forDestinationURL:(id)a5 error:(id *)a6;
- (BOOL)_markURLForDelete:(id)a3 error:(id *)a4;
- (BOOL)_setIsOriginal:(BOOL *)a3 markedForDelete:(BOOL *)a4 onDestinationURL:(id)a5 clearFlags:(BOOL)a6 error:(id *)a7;
- (BOOL)closeWithError:(id *)a3;
- (BOOL)deleteFileWithIdentity:(id)a3 includingOriginal:(BOOL)a4 error:(id *)a5;
- (BOOL)discardAllRetainedFileURLsWithError:(id *)a3;
- (BOOL)fileManager:(id)a3 shouldProceedAfterError:(id)a4 removingItemAtURL:(id)a5;
- (BOOL)fileManager:(id)a3 shouldRemoveItemAtURL:(id)a4;
- (BOOL)hasFileWithIdentity:(id)a3;
- (BOOL)markForDeleteFileWithIdentity:(id)a3 error:(id *)a4;
- (BOOL)openWithError:(id *)a3;
- (BOOL)releaseFileURL:(id)a3 error:(id *)a4;
- (BOOL)resetWithError:(id *)a3;
- (BOOL)storeData:(id)a3 identity:(id)a4 isOriginal:(BOOL)a5 needsCommit:(BOOL *)a6 onNewFile:(id)a7 error:(id *)a8;
- (BOOL)storeFileAtURL:(id)a3 identity:(id)a4 isOriginal:(BOOL)a5 moveIfPossible:(BOOL)a6 needsCommit:(BOOL *)a7 onNewFile:(id)a8 error:(id *)a9;
- (BOOL)storeUnretainedData:(id)a3 identity:(id)a4 isOriginal:(BOOL)a5 error:(id *)a6;
- (BOOL)storeUnretainedFileAtURL:(id)a3 identity:(id)a4 isOriginal:(BOOL)a5 error:(id *)a6;
- (BOOL)trackAllStoresAndDeletes;
- (CPLBucketFileStorage)initWithAbstractObject:(id)a3;
- (id)_destinationURLForIdentity:(id)a3;
- (id)fileEnumeratorIncludingPropertiesForKeys:(id)a3 errorHandler:(id)a4;
- (id)retainFileURLForIdentity:(id)a3 resourceType:(unint64_t)a4 error:(id *)a5;
- (void)_clearFlagsOnFd:(int)a3 url:(id)a4;
- (void)_clearFlagsOnURL:(id)a3;
- (void)checkFileSizeForIdentity:(id)a3;
- (void)setTrackAllStoresAndDeletes:(BOOL)a3;
- (void)writeTransactionDidFail;
- (void)writeTransactionDidSucceed;
@end

@implementation CPLBucketFileStorage

- (CPLBucketFileStorage)initWithAbstractObject:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CPLBucketFileStorage;
  v3 = -[CPLBucketFileStorage initWithAbstractObject:](&v15, "initWithAbstractObject:", a3);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLBucketFileStorage abstractObject](v3, "abstractObject"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 baseURL]);
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 URLByAppendingPathComponent:@"filecache" isDirectory:1]);
    urlForFiles = v4->_urlForFiles;
    v4->_urlForFiles = (NSURL *)v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
    fileManager = v4->_fileManager;
    v4->_fileManager = v9;

    logDomain = v4->_logDomain;
    v4->_logDomain = (NSString *)@"engine.filestorage.bucketstorage";

    v12 = objc_alloc_init(&OBJC_CLASS___NSCountedSet);
    temporarilyRetainedURLs = v4->_temporarilyRetainedURLs;
    v4->_temporarilyRetainedURLs = v12;
  }

  return v4;
}

- (BOOL)openWithError:(id *)a3
{
  fileManager = self->_fileManager;
  urlForFiles = self->_urlForFiles;
  id v11 = 0LL;
  BOOL v7 = 1;
  unsigned __int8 v8 = -[NSFileManager createDirectoryAtURL:withIntermediateDirectories:attributes:error:]( fileManager,  "createDirectoryAtURL:withIntermediateDirectories:attributes:error:",  urlForFiles,  1LL,  0LL,  &v11);
  id v9 = v11;
  if ((v8 & 1) == 0)
  {
    if (-[NSFileManager cplIsFileExistsError:](self->_fileManager, "cplIsFileExistsError:", v9))
    {

      id v9 = 0LL;
    }

    else if (a3)
    {
      id v9 = v9;
      BOOL v7 = 0;
      *a3 = v9;
    }

    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (BOOL)closeWithError:(id *)a3
{
  return 1;
}

- (id)_destinationURLForIdentity:(id)a3
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 fingerPrint]);
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 fileUTI]);
  if (!v6) {
    sub_10019D828((uint64_t)a2, (uint64_t)self);
  }
  unsigned __int8 v8 = (void *)v7;
  id v14 = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[CPLResourceIdentity storageNameForFingerPrint:fileUTI:bucket:]( &OBJC_CLASS___CPLResourceIdentity,  "storageNameForFingerPrint:fileUTI:bucket:",  v6,  v7,  &v14));
  id v10 = v14;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSURL URLByAppendingPathComponent:isDirectory:]( self->_urlForFiles,  "URLByAppendingPathComponent:isDirectory:",  v10,  1LL));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 URLByAppendingPathComponent:v9 isDirectory:0]);

  return v12;
}

- (void)_clearFlagsOnFd:(int)a3 url:(id)a4
{
  id v5 = a4;
  ssize_t v6 = fgetxattr(a3, "com.apple.cpl.delete", 0LL, 0xFFFFFFFFFFFFFFFFLL, 0, 0);
  if (v6 > 0 || *__error() == 93)
  {
    id v7 = 0LL;
    int v8 = 1;
  }

  else
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(+[CPLErrors posixErrorForURL:](&OBJC_CLASS___CPLErrors, "posixErrorForURL:", v5));
    int v8 = 0;
  }

  id v9 = v7;
  if (v8)
  {
    if (v6 >= 1)
    {
      if (!_CPLSilentLogging)
      {
        id v10 = sub_1001892A0();
        id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          int v21 = 138412290;
          id v22 = v5;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "Storing resource at %@: client had a file with remaining CPL flags - clearing",  (uint8_t *)&v21,  0xCu);
        }
      }

      id v12 = v5;
      if (fremovexattr(a3, "com.apple.cpl.delete", 0) && *__error() != 93)
      {
        id v14 = (id)objc_claimAutoreleasedReturnValue(+[CPLErrors posixErrorForURL:](&OBJC_CLASS___CPLErrors, "posixErrorForURL:", v12));
        int v13 = 1;
      }

      else
      {
        int v13 = 0;
        id v14 = v9;
      }

      id v18 = v14;
      if (!v13 || _CPLSilentLogging) {
        goto LABEL_18;
      }
      id v19 = sub_1001892A0();
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue([v12 path]);
        int v21 = 138412546;
        id v22 = v20;
        __int16 v23 = 2112;
        id v24 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Failed to clear flags when storing resource at %@ (ignoring): %@",  (uint8_t *)&v21,  0x16u);
      }

- (void)_clearFlagsOnURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = open((const char *)[v4 fileSystemRepresentation], 0);
  if ((v5 & 0x80000000) != 0)
  {
    if (!_CPLSilentLogging)
    {
      id v7 = sub_1001892A0();
      int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors posixErrorForURL:](&OBJC_CLASS___CPLErrors, "posixErrorForURL:", v4));
        int v11 = 138412546;
        id v12 = v9;
        __int16 v13 = 2112;
        id v14 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Failed to clear flags when storing resource at %@ (ignoring): %@",  (uint8_t *)&v11,  0x16u);
      }
    }
  }

  else
  {
    int v6 = v5;
    -[CPLBucketFileStorage _clearFlagsOnFd:url:](self, "_clearFlagsOnFd:url:", v5, v4);
    close(v6);
  }
}

- (BOOL)_setIsOriginal:(BOOL *)a3 markedForDelete:(BOOL *)a4 onDestinationURL:(id)a5 clearFlags:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  id v12 = a5;
  __int16 v13 = v12;
  if (!((unint64_t)a3 | (unint64_t)a4))
  {
    LOBYTE(v17) = 1;
    goto LABEL_35;
  }

  id v14 = v12;
  uint64_t v15 = open((const char *)[v14 fileSystemRepresentation], 0);
  int v16 = v15;
  if (a7 && (v15 & 0x80000000) != 0)
  {
    LOBYTE(v17) = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue(+[CPLErrors posixErrorForURL:](&OBJC_CLASS___CPLErrors, "posixErrorForURL:", v14));
    goto LABEL_35;
  }

  BOOL v17 = (int)v15 >= 0;
  if ((v15 & 0x80000000) == 0 && v8) {
    -[CPLBucketFileStorage _clearFlagsOnFd:url:](self, "_clearFlagsOnFd:url:", v15, v14);
  }
  if (a3 && (v16 & 0x80000000) == 0)
  {
    BOOL v18 = *a3;
    id v19 = v14;
    if (v18)
    {
      int v20 = fsetxattr(v16, "com.apple.cpl.original", "Y", 1uLL, 0, 0);
      BOOL v17 = v20 == 0;
      if (!a7 || !v20) {
        goto LABEL_20;
      }
    }

    else
    {
      if (!fremovexattr(v16, "com.apple.cpl.original", 0))
      {
        BOOL v17 = 1;
        goto LABEL_20;
      }

      int v21 = *__error();
      BOOL v17 = v21 == 93;
      if (!a7 || v21 == 93) {
        goto LABEL_20;
      }
    }

    BOOL v17 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue(+[CPLErrors posixErrorForURL:](&OBJC_CLASS___CPLErrors, "posixErrorForURL:", v19));
LABEL_20:
  }

  if (a4 && v17)
  {
    BOOL v22 = *a4;
    id v23 = v14;
    if (v22)
    {
      int v24 = fsetxattr(v16, "com.apple.cpl.delete", "Y", 1uLL, 0, 0);
      LOBYTE(v17) = v24 == 0;
      if (!a7 || !v24) {
        goto LABEL_32;
      }
    }

    else
    {
      if (!fremovexattr(v16, "com.apple.cpl.delete", 0))
      {
        LOBYTE(v17) = 1;
        goto LABEL_32;
      }

      int v25 = *__error();
      LOBYTE(v17) = v25 == 93;
      if (!a7 || v25 == 93) {
        goto LABEL_32;
      }
    }

    LOBYTE(v17) = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue(+[CPLErrors posixErrorForURL:](&OBJC_CLASS___CPLErrors, "posixErrorForURL:", v23));
LABEL_32:
  }

  if ((v16 & 0x80000000) == 0) {
    close(v16);
  }
LABEL_35:

  return v17;
}

- (BOOL)_getIsOriginal:(BOOL *)a3 markedForDelete:(BOOL *)a4 forDestinationURL:(id)a5 error:(id *)a6
{
  id v9 = a5;
  id v10 = v9;
  if ((unint64_t)a3 | (unint64_t)a4)
  {
    id v11 = v9;
    int v12 = open((const char *)[v11 fileSystemRepresentation], 0);
    int v13 = v12;
    if (a6 && v12 < 0)
    {
      LOBYTE(v14) = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue(+[CPLErrors posixErrorForURL:](&OBJC_CLASS___CPLErrors, "posixErrorForURL:", v11));
    }

    else
    {
      BOOL v14 = v12 >= 0;
      if (a3 && (v12 & 0x80000000) == 0)
      {
        id v15 = v11;
        if (fgetxattr(v13, "com.apple.cpl.original", 0LL, 0xFFFFFFFFFFFFFFFFLL, 0, 0) < 1)
        {
          if (*__error() == 93)
          {
            *a3 = 0;
            BOOL v14 = 1;
          }

          else
          {
            BOOL v14 = 0;
            if (a6) {
              *a6 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors posixErrorForURL:]( &OBJC_CLASS___CPLErrors,  "posixErrorForURL:",  v15));
            }
          }
        }

        else
        {
          BOOL v14 = 1;
          *a3 = 1;
        }
      }

      if (a4 && v14)
      {
        id v16 = v11;
        if (fgetxattr(v13, "com.apple.cpl.delete", 0LL, 0xFFFFFFFFFFFFFFFFLL, 0, 0) < 1)
        {
          if (*__error() == 93)
          {
            *a4 = 0;
            LOBYTE(v14) = 1;
          }

          else
          {
            LOBYTE(v14) = 0;
            if (a6) {
              *a6 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors posixErrorForURL:]( &OBJC_CLASS___CPLErrors,  "posixErrorForURL:",  v16));
            }
          }
        }

        else
        {
          LOBYTE(v14) = 1;
          *a4 = 1;
        }
      }

      if ((v13 & 0x80000000) == 0) {
        close(v13);
      }
    }
  }

  else
  {
    LOBYTE(v14) = 1;
  }

  return v14;
}

- (BOOL)_fixupStoredDestinationURL:(id)a3 isOriginal:(BOOL)a4 needsCommit:(BOOL *)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  if (v8)
  {
    if (!-[CPLBucketFileStorage _getIsOriginal:markedForDelete:forDestinationURL:error:]( self,  "_getIsOriginal:markedForDelete:forDestinationURL:error:",  &v24,  &v23,  v10,  a6))
    {
      BOOL v13 = 0;
      goto LABEL_23;
    }

    BOOL v11 = v24 == 0;
    if (v24) {
      int v12 = 0LL;
    }
    else {
      int v12 = &unk_100295E00;
    }
  }

  else
  {
    BOOL v11 = 0;
    int v12 = 0LL;
    BOOL v13 = 0;
    if (!-[CPLBucketFileStorage _getIsOriginal:markedForDelete:forDestinationURL:error:]( self,  "_getIsOriginal:markedForDelete:forDestinationURL:error:",  0LL,  &v23,  v10,  a6)) {
      goto LABEL_23;
    }
  }

  BOOL v14 = v23;
  if (v23) {
    id v15 = &unk_1002A3C28;
  }
  else {
    id v15 = 0LL;
  }
  *a5 = v23;
  if (v14 || v11)
  {
    if (!_CPLSilentLogging)
    {
      id v16 = sub_1001892A0();
      BOOL v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v18 = objc_claimAutoreleasedReturnValue([v10 path]);
        id v19 = (void *)v18;
        int v20 = "";
        int v21 = " original";
        if (!v11) {
          int v21 = "";
        }
        *(_DWORD *)buf = 138412802;
        uint64_t v26 = v18;
        __int16 v27 = 2080;
        v28 = v21;
        if (v14) {
          int v20 = " undelete";
        }
        __int16 v29 = 2080;
        v30 = v20;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Marking %@:%s%s", buf, 0x20u);
      }
    }

    BOOL v13 = -[CPLBucketFileStorage _setIsOriginal:markedForDelete:onDestinationURL:clearFlags:error:]( self,  "_setIsOriginal:markedForDelete:onDestinationURL:clearFlags:error:",  v12,  v15,  v10,  0LL,  a6);
  }

  else
  {
    BOOL v13 = 1;
  }

- (BOOL)storeFileAtURL:(id)a3 identity:(id)a4 isOriginal:(BOOL)a5 moveIfPossible:(BOOL)a6 needsCommit:(BOOL *)a7 onNewFile:(id)a8 error:(id *)a9
{
  BOOL v11 = a6;
  BOOL v12 = a5;
  id v55 = a3;
  id v15 = a4;
  id v16 = (uint64_t (**)(id, id *))a8;
  BOOL v17 = (void *)objc_claimAutoreleasedReturnValue(-[CPLBucketFileStorage _destinationURLForIdentity:](self, "_destinationURLForIdentity:", v15));
  unsigned int v18 = -[NSFileManager cplFileExistsAtURL:](self->_fileManager, "cplFileExistsAtURL:", v17);
  BOOL v20 = self->_trackAllStoresAndDeletes && _CPLSilentLogging == 0;
  if (v18)
  {
    if (v20)
    {
      id v21 = sub_1001892A0();
      BOOL v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v23 = (void *)objc_claimAutoreleasedReturnValue([v17 lastPathComponent]);
        *(_DWORD *)buf = 138412546;
        id v65 = v15;
        __int16 v66 = 2112;
        v67 = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "STORING %@ to %@: already in storage",  buf,  0x16u);
      }
    }

    id v63 = 0LL;
    unsigned __int8 v24 = -[CPLBucketFileStorage _fixupStoredDestinationURL:isOriginal:needsCommit:error:]( self,  "_fixupStoredDestinationURL:isOriginal:needsCommit:error:",  v17,  v12,  a7,  &v63);
    id v25 = v63;
    if ((v24 & 1) != 0) {
      goto LABEL_50;
    }
    goto LABEL_35;
  }

  if (v20)
  {
    id v26 = sub_1001892A0();
    __int16 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue([v17 lastPathComponent]);
      *(_DWORD *)buf = 138412546;
      id v65 = v15;
      __int16 v66 = 2112;
      v67 = v28;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "STORING %@ to %@: adding to storage",  buf,  0x16u);
    }
  }

  id v62 = 0LL;
  int v29 = v16[2](v16, &v62);
  id v30 = v62;
  if (v29)
  {
    *a7 = 1;
    fileManager = self->_fileManager;
    if (v11)
    {
      id v61 = v30;
      unsigned __int8 v32 = -[NSFileManager cplMoveItemAtURL:toURL:error:]( fileManager,  "cplMoveItemAtURL:toURL:error:",  v55,  v17,  &v61);
      v33 = v61;
    }

    else
    {
      id v60 = v30;
      unsigned __int8 v32 = -[NSFileManager cplCopyItemAtURL:toURL:error:]( fileManager,  "cplCopyItemAtURL:toURL:error:",  v55,  v17,  &v60);
      v33 = v60;
    }

    id v25 = v33;

    if ((v32 & 1) == 0)
    {
      if (!-[NSFileManager cplIsFileDoesNotExistError:]( self->_fileManager,  "cplIsFileDoesNotExistError:",  v25))
      {
LABEL_35:
        id v30 = v25;
        goto LABEL_36;
      }

      v36 = (void *)objc_claimAutoreleasedReturnValue([v17 URLByDeletingLastPathComponent]);
      v53 = v36;
      if (!_CPLSilentLogging)
      {
        id v37 = sub_1001892A0();
        v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          v39 = (void *)objc_claimAutoreleasedReturnValue([v36 path]);
          *(_DWORD *)buf = 138412290;
          id v65 = v39;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, "Creating bucket at %@", buf, 0xCu);

          v36 = v53;
        }
      }

      v40 = self->_fileManager;
      id v59 = v25;
      unsigned __int8 v41 = -[NSFileManager createDirectoryAtURL:withIntermediateDirectories:attributes:error:]( v40,  "createDirectoryAtURL:withIntermediateDirectories:attributes:error:",  v36,  1LL,  0LL,  &v59,  v53);
      id v30 = v59;

      if ((v41 & 1) == 0)
      {

        goto LABEL_36;
      }

      v42 = self->_fileManager;
      if (v11)
      {
        id v58 = v30;
        unsigned __int8 v43 = -[NSFileManager cplMoveItemAtURL:toURL:error:]( v42,  "cplMoveItemAtURL:toURL:error:",  v55,  v17,  &v58);
        id v25 = v58;

        id v30 = v25;
        if ((v43 & 1) == 0) {
          goto LABEL_36;
        }
      }

      else
      {
        id v57 = v30;
        unsigned int v52 = -[NSFileManager cplCopyItemAtURL:toURL:error:]( v42,  "cplCopyItemAtURL:toURL:error:",  v55,  v17,  &v57);
        id v25 = v57;

        id v30 = v25;
        if (!v52) {
          goto LABEL_36;
        }
      }
    }

    if (!v12)
    {
      -[CPLBucketFileStorage _clearFlagsOnURL:](self, "_clearFlagsOnURL:", v17);
LABEL_50:
      BOOL v34 = 1;
      goto LABEL_51;
    }

    id v56 = v25;
    BOOL v34 = 1;
    unsigned __int8 v35 = -[CPLBucketFileStorage _setIsOriginal:markedForDelete:onDestinationURL:clearFlags:error:]( self,  "_setIsOriginal:markedForDelete:onDestinationURL:clearFlags:error:",  &unk_100295E00,  0LL,  v17,  1LL,  &v56);
    id v30 = v56;

    if ((v35 & 1) != 0) {
      goto LABEL_48;
    }
    -[NSFileManager removeItemAtURL:error:](self->_fileManager, "removeItemAtURL:error:", v17, 0LL);
  }

- (BOOL)storeData:(id)a3 identity:(id)a4 isOriginal:(BOOL)a5 needsCommit:(BOOL *)a6 onNewFile:(id)a7 error:(id *)a8
{
  BOOL v11 = a5;
  id v55 = a3;
  id v14 = a4;
  id v15 = (uint64_t (**)(id, id *))a7;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CPLBucketFileStorage _destinationURLForIdentity:](self, "_destinationURLForIdentity:", v14));
  if (!-[NSFileManager cplFileExistsAtURL:](self->_fileManager, "cplFileExistsAtURL:", v16))
  {
    *a6 = 1;
    if (self->_trackAllStoresAndDeletes && _CPLSilentLogging == 0)
    {
      id v29 = sub_1001892A0();
      id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue([v16 lastPathComponent]);
        *(_DWORD *)buf = 138412546;
        id v63 = v14;
        __int16 v64 = 2112;
        id v65 = v31;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "STORING %@ to %@: adding to storage",  buf,  0x16u);
      }
    }

    id v60 = 0LL;
    int v32 = v15[2](v15, &v60);
    id v33 = v60;
    id v34 = v33;
    if (!v32) {
      goto LABEL_39;
    }
    v54 = a8;
    id v59 = v33;
    unsigned __int8 v35 = [v55 writeToURL:v16 options:1 error:&v59];
    id v26 = v59;

    if ((v35 & 1) != 0)
    {
      if (!v11) {
        goto LABEL_24;
      }
      goto LABEL_23;
    }

    if (-[NSFileManager cplIsFileDoesNotExistError:]( self->_fileManager,  "cplIsFileDoesNotExistError:",  v26))
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue([v16 URLByDeletingLastPathComponent]);
      v53 = v38;
      if (!_CPLSilentLogging)
      {
        id v39 = sub_1001892A0();
        v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          unsigned __int8 v41 = (void *)objc_claimAutoreleasedReturnValue([v38 path]);
          *(_DWORD *)buf = 138412290;
          id v63 = v41;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "Creating bucket at %@", buf, 0xCu);

          v38 = v53;
        }
      }

      fileManager = self->_fileManager;
      id v58 = v26;
      unsigned __int8 v43 = -[NSFileManager createDirectoryAtURL:withIntermediateDirectories:attributes:error:]( fileManager,  "createDirectoryAtURL:withIntermediateDirectories:attributes:error:",  v38,  1LL,  0LL,  &v58);
      id v34 = v58;

      if ((v43 & 1) == 0)
      {

        goto LABEL_38;
      }

      id v57 = v34;
      unsigned int v44 = [v55 writeToURL:v16 options:1 error:&v57];
      id v26 = v57;

      if (v44 && v11)
      {
LABEL_23:
        v36 = v26;
        id v56 = v26;
        unsigned __int8 v37 = -[CPLBucketFileStorage _setIsOriginal:markedForDelete:onDestinationURL:clearFlags:error:]( self,  "_setIsOriginal:markedForDelete:onDestinationURL:clearFlags:error:",  &unk_100295E00,  0LL,  v16,  0LL,  &v56);
        id v26 = v56;

        a8 = v54;
        if ((v37 & 1) == 0)
        {
          -[NSFileManager removeItemAtURL:error:](self->_fileManager, "removeItemAtURL:error:", v16, 0LL);
          id v34 = v26;
          goto LABEL_39;
        }

- (BOOL)storeUnretainedFileAtURL:(id)a3 identity:(id)a4 isOriginal:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLBucketFileStorage _destinationURLForIdentity:](self, "_destinationURLForIdentity:", v11));
  fileManager = self->_fileManager;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 path]);
  unsigned int v15 = -[NSFileManager fileExistsAtPath:](fileManager, "fileExistsAtPath:", v14);

  BOOL v17 = self->_trackAllStoresAndDeletes && _CPLSilentLogging == 0;
  if (!v15)
  {
    if (v17)
    {
      id v19 = sub_1001892A0();
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v12 lastPathComponent]);
        *(_DWORD *)buf = 138412546;
        id v52 = v11;
        __int16 v53 = 2112;
        v54 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "STORING (unretained) %@ to %@: adding to storage",  buf,  0x16u);
      }
    }

    v47 = a6;
    BOOL v22 = self->_fileManager;
    id v50 = 0LL;
    unsigned __int8 v23 = -[NSFileManager cplCopyItemAtURL:toURL:error:]( v22,  "cplCopyItemAtURL:toURL:error:",  v10,  v12,  &v50);
    id v24 = v50;
    id v25 = v24;
    if ((v23 & 1) != 0)
    {
      id v18 = v24;
    }

    else
    {
      if (!-[NSFileManager cplIsFileDoesNotExistError:]( self->_fileManager,  "cplIsFileDoesNotExistError:",  v24))
      {
        id v18 = v25;
        goto LABEL_35;
      }

      BOOL v27 = (void *)objc_claimAutoreleasedReturnValue([v12 URLByDeletingLastPathComponent]);
      v46 = v27;
      if (!_CPLSilentLogging)
      {
        id v28 = sub_1001892A0();
        id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          id v30 = (void *)objc_claimAutoreleasedReturnValue([v27 path]);
          *(_DWORD *)buf = 138412290;
          id v52 = v30;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "Creating bucket at %@", buf, 0xCu);

          BOOL v27 = v46;
        }
      }

      v31 = self->_fileManager;
      id v49 = v25;
      unsigned __int8 v32 = -[NSFileManager createDirectoryAtURL:withIntermediateDirectories:attributes:error:]( v31,  "createDirectoryAtURL:withIntermediateDirectories:attributes:error:",  v27,  1LL,  0LL,  &v49);
      id v18 = v49;

      if ((v32 & 1) == 0)
      {

        goto LABEL_35;
      }

      id v33 = self->_fileManager;
      id v48 = v18;
      unsigned int v34 = -[NSFileManager cplCopyItemAtURL:toURL:error:]( v33,  "cplCopyItemAtURL:toURL:error:",  v10,  v12,  &v48);
      id v35 = v48;

      id v18 = v35;
      if (!v34)
      {
LABEL_35:
        if (-[NSFileManager cplIsFileExistsError:](self->_fileManager, "cplIsFileExistsError:", v18))
        {
          if (!_CPLSilentLogging)
          {
            id v39 = sub_1001892A0();
            unsigned __int8 v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              v40 = (void *)objc_claimAutoreleasedReturnValue([v12 path]);
              *(_DWORD *)buf = 138412290;
              id v52 = v40;
              unsigned __int8 v41 = "Tried to store (unretained) %@ but file appeared miraculously!";
              v42 = v37;
              uint32_t v43 = 12;
LABEL_42:
              _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, v41, buf, v43);

              goto LABEL_43;
            }

            goto LABEL_43;
          }
        }

        else if (!_CPLSilentLogging)
        {
          id v44 = sub_1001892A0();
          unsigned __int8 v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            v40 = (void *)objc_claimAutoreleasedReturnValue([v12 path]);
            *(_DWORD *)buf = 138412802;
            id v52 = v11;
            __int16 v53 = 2112;
            v54 = v40;
            __int16 v55 = 2112;
            id v56 = v18;
            unsigned __int8 v41 = "Failed to store (unretained) %@ to %@: %@";
            v42 = v37;
            uint32_t v43 = 32;
            goto LABEL_42;
          }

- (BOOL)storeUnretainedData:(id)a3 identity:(id)a4 isOriginal:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLBucketFileStorage _destinationURLForIdentity:](self, "_destinationURLForIdentity:", v11));
  fileManager = self->_fileManager;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 path]);
  unsigned int v15 = -[NSFileManager fileExistsAtPath:](fileManager, "fileExistsAtPath:", v14);

  BOOL v17 = self->_trackAllStoresAndDeletes && _CPLSilentLogging == 0;
  if (!v15)
  {
    if (v17)
    {
      id v19 = sub_1001892A0();
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v12 lastPathComponent]);
        *(_DWORD *)buf = 138412546;
        id v50 = v11;
        __int16 v51 = 2112;
        id v52 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "STORING (unretained) %@ to %@: adding to storage",  buf,  0x16u);
      }
    }

    id v45 = a6;
    id v48 = 0LL;
    unsigned __int8 v22 = [v10 writeToURL:v12 options:1 error:&v48];
    id v23 = v48;
    id v24 = v23;
    if ((v22 & 1) != 0)
    {
      id v18 = v23;
    }

    else
    {
      if (!-[NSFileManager cplIsFileDoesNotExistError:]( self->_fileManager,  "cplIsFileDoesNotExistError:",  v23))
      {
        id v18 = v24;
        goto LABEL_35;
      }

      id v26 = (void *)objc_claimAutoreleasedReturnValue([v12 URLByDeletingLastPathComponent]);
      id v44 = v26;
      if (!_CPLSilentLogging)
      {
        id v27 = sub_1001892A0();
        id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          id v29 = (void *)objc_claimAutoreleasedReturnValue([v26 path]);
          *(_DWORD *)buf = 138412290;
          id v50 = v29;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "Creating bucket at %@", buf, 0xCu);

          id v26 = v44;
        }
      }

      id v30 = self->_fileManager;
      id v47 = v24;
      unsigned __int8 v31 = -[NSFileManager createDirectoryAtURL:withIntermediateDirectories:attributes:error:]( v30,  "createDirectoryAtURL:withIntermediateDirectories:attributes:error:",  v26,  1LL,  0LL,  &v47);
      id v18 = v47;

      if ((v31 & 1) == 0)
      {

        goto LABEL_35;
      }

      id v46 = v18;
      unsigned int v32 = [v10 writeToURL:v12 options:1 error:&v46];
      id v33 = v46;

      id v18 = v33;
      if (!v32)
      {
LABEL_35:
        if (-[NSFileManager cplIsFileExistsError:](self->_fileManager, "cplIsFileExistsError:", v18))
        {
          if (!_CPLSilentLogging)
          {
            id v37 = sub_1001892A0();
            id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              v38 = (void *)objc_claimAutoreleasedReturnValue([v12 path]);
              *(_DWORD *)buf = 138412546;
              id v50 = v11;
              __int16 v51 = 2112;
              id v52 = v38;
              id v39 = "Tried to store (unretained) %@ at %@ but file appeared miraculously!";
              v40 = v35;
              uint32_t v41 = 22;
LABEL_42:
              _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, v39, buf, v41);

              goto LABEL_43;
            }

            goto LABEL_43;
          }
        }

        else if (!_CPLSilentLogging)
        {
          id v42 = sub_1001892A0();
          id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            v38 = (void *)objc_claimAutoreleasedReturnValue([v12 path]);
            *(_DWORD *)buf = 138412802;
            id v50 = v11;
            __int16 v51 = 2112;
            id v52 = v38;
            __int16 v53 = 2112;
            id v54 = v18;
            id v39 = "Failed to store (unretained) %@ to %@: %@";
            v40 = v35;
            uint32_t v41 = 32;
            goto LABEL_42;
          }

- (BOOL)hasFileWithIdentity:(id)a3
{
  v3 = self;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLBucketFileStorage _destinationURLForIdentity:](self, "_destinationURLForIdentity:", a3));
  LOBYTE(v3) = -[NSFileManager cplFileExistsAtURL:](v3->_fileManager, "cplFileExistsAtURL:", v4);

  return (char)v3;
}

- (void)checkFileSizeForIdentity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLBucketFileStorage _destinationURLForIdentity:](self, "_destinationURLForIdentity:", v4));
  id v10 = 0LL;
  id v9 = 0LL;
  unsigned int v6 = [v5 getResourceValue:&v10 forKey:NSURLFileSizeKey error:&v9];
  BOOL v7 = v10;
  id v8 = v9;
  if (v6) {
    objc_msgSend(v4, "setFileSize:", objc_msgSend(v7, "unsignedIntegerValue"));
  }
}

- (id)retainFileURLForIdentity:(id)a3 resourceType:(unint64_t)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLBucketFileStorage _destinationURLForIdentity:](self, "_destinationURLForIdentity:", v7));
  if ((-[NSFileManager cplFileExistsAtURL:](self->_fileManager, "cplFileExistsAtURL:", v8) & 1) != 0)
  {
    if (self->_trackAllStoresAndDeletes && _CPLSilentLogging == 0)
    {
      id v10 = sub_1001892A0();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v8 lastPathComponent]);
        int v20 = 138412546;
        id v21 = v7;
        __int16 v22 = 2112;
        id v23 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "RETAINING %@ to %@",  (uint8_t *)&v20,  0x16u);
      }
    }

    if (!self->_temporarilyRetainedURLsAtTheStartOfTransaction)
    {
      BOOL v13 = (NSCountedSet *)-[NSCountedSet mutableCopy](self->_temporarilyRetainedURLs, "mutableCopy");
      temporarilyRetainedURLsAtTheStartOfTransaction = self->_temporarilyRetainedURLsAtTheStartOfTransaction;
      self->_temporarilyRetainedURLsAtTheStartOfTransaction = v13;
    }

    -[NSCountedSet addObject:](self->_temporarilyRetainedURLs, "addObject:", v8);
  }

  else
  {
    unsigned int v15 = objc_alloc(&OBJC_CLASS___NSError);
    NSErrorUserInfoKey v24 = NSFilePathErrorKey;
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
    id v25 = v16;
    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));
    id v18 = -[NSError initWithDomain:code:userInfo:](v15, "initWithDomain:code:userInfo:", NSCocoaErrorDomain, 4LL, v17);

    if (a5) {
      *a5 = v18;
    }

    id v8 = 0LL;
  }

  return v8;
}

- (BOOL)releaseFileURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (self->_trackAllStoresAndDeletes && _CPLSilentLogging == 0)
  {
    id v7 = sub_1001892A0();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 lastPathComponent]);
      int v13 = 138412290;
      id v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "RELEASING %@", (uint8_t *)&v13, 0xCu);
    }
  }

  if (!self->_temporarilyRetainedURLsAtTheStartOfTransaction)
  {
    id v10 = (NSCountedSet *)-[NSCountedSet mutableCopy](self->_temporarilyRetainedURLs, "mutableCopy");
    temporarilyRetainedURLsAtTheStartOfTransaction = self->_temporarilyRetainedURLsAtTheStartOfTransaction;
    self->_temporarilyRetainedURLsAtTheStartOfTransaction = v10;
  }

  -[NSCountedSet removeObject:](self->_temporarilyRetainedURLs, "removeObject:", v5);

  return 1;
}

- (BOOL)discardAllRetainedFileURLsWithError:(id *)a3
{
  if (self->_trackAllStoresAndDeletes && _CPLSilentLogging == 0)
  {
    id v5 = sub_1001892A0();
    unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "DISCARDING al retained resources", v10, 2u);
    }
  }

  if (!self->_temporarilyRetainedURLsAtTheStartOfTransaction)
  {
    id v7 = (NSCountedSet *)-[NSCountedSet mutableCopy](self->_temporarilyRetainedURLs, "mutableCopy", a3);
    temporarilyRetainedURLsAtTheStartOfTransaction = self->_temporarilyRetainedURLsAtTheStartOfTransaction;
    self->_temporarilyRetainedURLsAtTheStartOfTransaction = v7;
  }

  -[NSCountedSet removeAllObjects](self->_temporarilyRetainedURLs, "removeAllObjects", a3);
  return 1;
}

- (BOOL)_markURLForDelete:(id)a3 error:(id *)a4
{
  id v5 = a3;
  int v6 = open((const char *)[v5 fileSystemRepresentation], 0);
  if (v6 < 0)
  {
    if (*__error() == 2)
    {
      BOOL v10 = 1;
    }

    else
    {
      BOOL v10 = 0;
      if (a4) {
        *a4 = (id)objc_claimAutoreleasedReturnValue(+[CPLErrors posixErrorForURL:](&OBJC_CLASS___CPLErrors, "posixErrorForURL:", v5));
      }
    }
  }

  else
  {
    int v7 = v6;
    id v8 = v5;
    int v9 = fsetxattr(v7, "com.apple.cpl.delete", "Y", 1uLL, 0, 0);
    BOOL v10 = v9 == 0;
    if (a4 && v9)
    {
      BOOL v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[CPLErrors posixErrorForURL:](&OBJC_CLASS___CPLErrors, "posixErrorForURL:", v8));
    }

    close(v7);
  }

  return v10;
}

- (BOOL)deleteFileWithIdentity:(id)a3 includingOriginal:(BOOL)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLBucketFileStorage _destinationURLForIdentity:](self, "_destinationURLForIdentity:", v7));
  if ((-[NSCountedSet containsObject:](self->_temporarilyRetainedURLs, "containsObject:", v8) & 1) == 0)
  {
    if (a4)
    {
      id v11 = 0LL;
    }

    else
    {
      id v39 = 0LL;
      unsigned int v25 = -[CPLBucketFileStorage _getIsOriginal:markedForDelete:forDestinationURL:error:]( self,  "_getIsOriginal:markedForDelete:forDestinationURL:error:",  buf,  0LL,  v8,  &v39);
      id v26 = v39;
      id v10 = v26;
      if (!v25)
      {
        if (self->_trackAllStoresAndDeletes && _CPLSilentLogging == 0)
        {
          id v36 = sub_1001892A0();
          id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            int v20 = (void *)objc_claimAutoreleasedReturnValue([v8 lastPathComponent]);
            *(_DWORD *)buf = 138412546;
            id v41 = v7;
            __int16 v42 = 2112;
            uint32_t v43 = v20;
            id v21 = "DELETING %@ from %@: ignoring";
            __int16 v22 = v19;
            os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
            uint32_t v24 = 22;
            goto LABEL_46;
          }

- (BOOL)markForDeleteFileWithIdentity:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLBucketFileStorage _destinationURLForIdentity:](self, "_destinationURLForIdentity:", v6));
  if (self->_trackAllStoresAndDeletes && _CPLSilentLogging == 0)
  {
    id v9 = sub_1001892A0();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
      int v14 = 138412546;
      id v15 = v6;
      __int16 v16 = 2112;
      unsigned __int8 v17 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "MARKING FOR DELETE %@ from %@",  (uint8_t *)&v14,  0x16u);
    }
  }

  BOOL v12 = -[CPLBucketFileStorage _markURLForDelete:error:](self, "_markURLForDelete:error:", v7, a4);

  return v12;
}

- (id)fileEnumeratorIncludingPropertiesForKeys:(id)a3 errorHandler:(id)a4
{
  id v6 = a4;
  fileManager = self->_fileManager;
  urlForFiles = self->_urlForFiles;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10018BD4C;
  v13[3] = &unk_100247E60;
  id v14 = v6;
  id v9 = v6;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSFileManager enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:]( fileManager,  "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:",  urlForFiles,  a3,  4LL,  v13));
  id v11 = -[CPLBucketFileStorageEnumerator initWithDirectoryEnumerator:]( objc_alloc(&OBJC_CLASS___CPLBucketFileStorageEnumerator),  "initWithDirectoryEnumerator:",  v10);

  return v11;
}

- (BOOL)resetWithError:(id *)a3
{
  urlForFiles = self->_urlForFiles;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathExtension:](urlForFiles, "URLByAppendingPathExtension:", v7));

  if (!_CPLSilentLogging)
  {
    id v9 = sub_1001892A0();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self->_urlForFiles, "path"));
      BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
      *(_DWORD *)buf = 138412546;
      __int16 v66 = v11;
      __int16 v67 = 2112;
      id v68 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Moving %@ to %@", buf, 0x16u);
    }
  }

  if (-[NSFileManager moveItemAtURL:toURL:error:]( self->_fileManager,  "moveItemAtURL:toURL:error:",  self->_urlForFiles,  v8,  a3))
  {
    if (!_CPLSilentLogging)
    {
      id v13 = sub_1001892A0();
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self->_urlForFiles, "path"));
        *(_DWORD *)buf = 138412290;
        __int16 v66 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Recreating %@", buf, 0xCu);
      }
    }

    fileManager = self->_fileManager;
    unsigned __int8 v17 = self->_urlForFiles;
    id v63 = 0LL;
    unsigned __int8 v18 = -[NSFileManager createDirectoryAtURL:withIntermediateDirectories:attributes:error:]( fileManager,  "createDirectoryAtURL:withIntermediateDirectories:attributes:error:",  v17,  1LL,  0LL,  &v63);
    id v19 = v63;
    if ((v18 & 1) != 0)
    {
      if (!_CPLSilentLogging)
      {
        id v20 = sub_1001892A0();
        id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
          *(_DWORD *)buf = 138412290;
          __int16 v66 = v22;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Removing %@", buf, 0xCu);
        }
      }

      -[NSFileManager setDelegate:](self->_fileManager, "setDelegate:", self);
      os_log_type_t v23 = self->_fileManager;
      id v62 = 0LL;
      unsigned __int8 v24 = -[NSFileManager removeItemAtURL:error:](v23, "removeItemAtURL:error:", v8, &v62);
      id v25 = v62;
      if ((v24 & 1) == 0 && !_CPLSilentLogging)
      {
        id v26 = sub_1001892A0();
        id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          id v28 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
          *(_DWORD *)buf = 138412546;
          __int16 v66 = v28;
          __int16 v67 = 2112;
          id v68 = v25;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "Failed to effectively remove %@: %@",  buf,  0x16u);
        }
      }

      id v52 = v19;
      __int16 v53 = v8;
      uint64_t v29 = objc_claimAutoreleasedReturnValue(-[NSURL URLByDeletingLastPathComponent](self->_urlForFiles, "URLByDeletingLastPathComponent"));
      id v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL lastPathComponent](self->_urlForFiles, "lastPathComponent"));
      __int128 v58 = 0u;
      __int128 v59 = 0u;
      __int128 v60 = 0u;
      __int128 v61 = 0u;
      id v54 = self;
      __int16 v51 = (void *)v29;
      id obj = (id)objc_claimAutoreleasedReturnValue( -[NSFileManager enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:]( self->_fileManager,  "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:",  v29,  0LL,  1LL,  &stru_100247EA0));
      id v31 = [obj countByEnumeratingWithState:&v58 objects:v64 count:16];
      if (v31)
      {
        id v32 = v31;
        uint64_t v33 = *(void *)v59;
        do
        {
          id v34 = 0LL;
          id v55 = v32;
          do
          {
            if (*(void *)v59 != v33) {
              objc_enumerationMutation(obj);
            }
            id v35 = *(void **)(*((void *)&v58 + 1) + 8LL * (void)v34);
            id v36 = (void *)objc_claimAutoreleasedReturnValue([v35 lastPathComponent]);
            id v37 = (void *)objc_claimAutoreleasedReturnValue([v36 pathExtension]);
            id v38 = (void *)objc_claimAutoreleasedReturnValue([v36 stringByDeletingPathExtension]);
            if ([v37 length] && objc_msgSend(v38, "isEqualToString:", v30))
            {
              if (!_CPLSilentLogging)
              {
                id v39 = sub_1001892A0();
                v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
                if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  __int16 v66 = v36;
                  _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "Found orphaned file cache to clean-up %@. Cleaning it up now",  buf,  0xCu);
                }
              }

              uint64_t v41 = v33;
              __int16 v42 = v30;
              uint32_t v43 = v54->_fileManager;
              id v57 = v25;
              unsigned __int8 v44 = -[NSFileManager removeItemAtURL:error:](v43, "removeItemAtURL:error:", v35, &v57);
              id v45 = v57;

              if ((v44 & 1) == 0 && !_CPLSilentLogging)
              {
                id v46 = sub_1001892A0();
                id v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
                if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
                {
                  id v48 = (void *)objc_claimAutoreleasedReturnValue([v35 path]);
                  *(_DWORD *)buf = 138412546;
                  __int16 v66 = v48;
                  __int16 v67 = 2112;
                  id v68 = v45;
                  _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_ERROR,  "Failed to effectively remove %@: %@",  buf,  0x16u);
                }
              }

              id v25 = v45;
              id v30 = v42;
              uint64_t v33 = v41;
              id v32 = v55;
            }

            id v34 = (char *)v34 + 1;
          }

          while (v32 != v34);
          id v32 = [obj countByEnumeratingWithState:&v58 objects:v64 count:16];
        }

        while (v32);
      }

      -[NSFileManager setDelegate:](v54->_fileManager, "setDelegate:", 0LL);
      BOOL v49 = 1;
      id v19 = v52;
      id v8 = v53;
    }

    else if ((-[NSFileManager cplIsFileExistsError:](self->_fileManager, "cplIsFileExistsError:", v19) & 1) != 0)
    {
      BOOL v49 = 1;
    }

    else
    {
      BOOL v49 = 0;
      if (a3) {
        *a3 = v19;
      }
    }
  }

  else
  {
    BOOL v49 = 0;
  }

  return v49;
}

- (BOOL)fileManager:(id)a3 shouldRemoveItemAtURL:(id)a4
{
  id v4 = a4;
  id v12 = 0LL;
  unsigned int v5 = [v4 getResourceValue:&v12 forKey:NSURLIsDirectoryKey error:0];
  id v6 = v12;
  id v7 = v6;
  if (v5 && ([v6 BOOLValue] & 1) == 0 && !_CPLSilentLogging)
  {
    id v8 = sub_1001892A0();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 lastPathComponent]);
      *(_DWORD *)buf = 138412290;
      id v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Deleting %@", buf, 0xCu);
    }
  }

  return 1;
}

- (BOOL)fileManager:(id)a3 shouldProceedAfterError:(id)a4 removingItemAtURL:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  if (!_CPLSilentLogging)
  {
    id v8 = sub_1001892A0();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 path]);
      int v12 = 138412546;
      id v13 = v10;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Failed to remove %@: %@",  (uint8_t *)&v12,  0x16u);
    }
  }

  return 1;
}

- (void)writeTransactionDidFail
{
  temporarilyRetainedURLsAtTheStartOfTransaction = self->_temporarilyRetainedURLsAtTheStartOfTransaction;
  if (temporarilyRetainedURLsAtTheStartOfTransaction)
  {
    objc_storeStrong((id *)&self->_temporarilyRetainedURLs, temporarilyRetainedURLsAtTheStartOfTransaction);
    id v4 = self->_temporarilyRetainedURLsAtTheStartOfTransaction;
    self->_temporarilyRetainedURLsAtTheStartOfTransaction = 0LL;
  }

- (void)writeTransactionDidSucceed
{
  temporarilyRetainedURLsAtTheStartOfTransaction = self->_temporarilyRetainedURLsAtTheStartOfTransaction;
  self->_temporarilyRetainedURLsAtTheStartOfTransaction = 0LL;
}

- (BOOL)trackAllStoresAndDeletes
{
  return self->_trackAllStoresAndDeletes;
}

- (void)setTrackAllStoresAndDeletes:(BOOL)a3
{
  self->_trackAllStoresAndDeletes = a3;
}

- (void).cxx_destruct
{
}

@end