@interface StreamingFileWriter
+ (id)fileWriterForPath:(id)a3 withOpenFlags:(int)a4 mode:(unsigned __int16)a5 quarantineInfo:(void *)a6 performCachedWrites:(BOOL)a7 expectedSize:(int64_t)a8 asyncTrackingGroup:(id)a9 errorDelegate:(id)a10 error:(id *)a11;
+ (id)synchronousFileWriterForPath:(id)a3 withOpenFlags:(int)a4 mode:(unsigned __int16)a5 quarantineInfo:(void *)a6 performCachedWrites:(BOOL)a7 error:(id *)a8;
- (BOOL)_openCurrentOutputFDForPath:(id)a3 withOpenFlags:(int)a4 mode:(unsigned __int16)a5 performCachedWrites:(BOOL)a6 quarantineInfo:(void *)a7 error:(id *)a8;
- (BOOL)finalizeFileWithAccessTime:(timeval)a3 modTime:(timeval)a4 mode:(unsigned __int16)a5 error:(id *)a6;
- (BOOL)setCurrentOffset:(int64_t)a3 error:(id *)a4;
- (BOOL)suspendWithError:(id *)a3;
- (BOOL)writeBuffer:(const void *)a3 length:(unint64_t)a4 error:(id *)a5;
- (NSString)path;
- (id)_initForWritingToPath:(id)a3 withOpenFlags:(int)a4 mode:(unsigned __int16)a5 quarantineInfo:(void *)a6 performCachedWrites:(BOOL)a7 expectedSize:(int64_t)a8 error:(id *)a9;
- (id)description;
- (int)currentOutputFD;
- (int64_t)currentOffsetWithError:(id *)a3;
- (int64_t)fileSize;
- (int64_t)readIntoBuffer:(void *)a3 length:(unint64_t)a4 error:(id *)a5;
- (void)closeCurrentOutputFD;
- (void)configureFileAndSetOwnership:(BOOL)a3 toUID:(unsigned int)a4 GID:(unsigned int)a5;
- (void)dealloc;
- (void)setCurrentOutputFD:(int)a3;
- (void)setIncompleteExtractionAttribute;
@end

@implementation StreamingFileWriter

- (BOOL)_openCurrentOutputFDForPath:(id)a3 withOpenFlags:(int)a4 mode:(unsigned __int16)a5 performCachedWrites:(BOOL)a6 quarantineInfo:(void *)a7 error:(id *)a8
{
  unsigned int v10 = a5;
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v13 = a3;
  uint64_t v14 = -[StreamingFileWriter fileSize](self, "fileSize");
  id v15 = v13;
  v16 = (const char *)[v15 fileSystemRepresentation];

  if ((a4 & 0x200) != 0) {
    uint64_t v33 = v10;
  }
  uint64_t v17 = open(v16, a4, v33);
  uint64_t v18 = v17;
  if ((v17 & 0x80000000) == 0)
  {
    if (fcntl(v17, 68, 1LL) < 0)
    {
      int v24 = *__error();
      SZGetLoggingHandle();
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v35 = v16;
        __int16 v36 = 1024;
        int v37 = v24;
        __int16 v38 = 2080;
        v39 = strerror(v24);
        _os_log_error_impl(&dword_1870CA000, v25, OS_LOG_TYPE_ERROR, "Could not mark %s static: %d (%s)", buf, 0x1Cu);
      }

      if (a6) {
        goto LABEL_20;
      }
    }

    else if (a6)
    {
LABEL_20:
      if (fcntl(v18, 76, 1LL) < 0)
      {
        int v28 = *__error();
        SZGetLoggingHandle();
        v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v31 = strerror(v28);
          *(_DWORD *)buf = 136315650;
          v35 = v16;
          __int16 v36 = 1024;
          int v37 = v28;
          __int16 v38 = 2080;
          v39 = v31;
          _os_log_error_impl( &dword_1870CA000,  v29,  OS_LOG_TYPE_ERROR,  "Unable to set F_SINGLE_WRITER on %s : %d (%s)",  buf,  0x1Cu);
        }
      }

      -[StreamingFileWriter setCurrentOutputFD:](self, "setCurrentOutputFD:", v18);
      id v23 = 0LL;
      goto LABEL_25;
    }

    if ((v14 >= 0x8000 || v14 == -1) && fcntl(v18, 48, 1LL) < 0)
    {
      int v26 = *__error();
      SZGetLoggingHandle();
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v32 = strerror(v26);
        *(_DWORD *)buf = 136315650;
        v35 = v16;
        __int16 v36 = 1024;
        int v37 = v26;
        __int16 v38 = 2080;
        v39 = v32;
        _os_log_error_impl( &dword_1870CA000,  v27,  OS_LOG_TYPE_ERROR,  "Unable to set F_NOCACHE accessing file %s : %d (%s)",  buf,  0x1Cu);
      }
    }

    goto LABEL_20;
  }

  int v19 = *__error();
  SZGetLoggingHandle();
  v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v35 = v16;
    __int16 v36 = 1024;
    int v37 = v19;
    __int16 v38 = 2080;
    v39 = strerror(v19);
    _os_log_error_impl(&dword_1870CA000, v20, OS_LOG_TYPE_ERROR, "Failed to open %s : %d (%s)", buf, 0x1Cu);
  }

  v21 = (void *)*MEMORY[0x189607688];
  strerror(v19);
  _CreateError( (uint64_t)"-[StreamingFileWriter _openCurrentOutputFDForPath:withOpenFlags:mode:performCachedWrites:quarantineInfo:error:]",  93LL,  v21,  v19,  0LL,  0LL,  @"Failed to open %s : %d (%s)",  v22,  (uint64_t)v16);
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  if (a8)
  {
    id v23 = v23;
    *a8 = v23;
  }

- (id)_initForWritingToPath:(id)a3 withOpenFlags:(int)a4 mode:(unsigned __int16)a5 quarantineInfo:(void *)a6 performCachedWrites:(BOOL)a7 expectedSize:(int64_t)a8 error:(id *)a9
{
  BOOL v10 = a7;
  uint64_t v12 = a5;
  uint64_t v13 = *(void *)&a4;
  id v16 = a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___StreamingFileWriter;
  uint64_t v17 = -[StreamingFileWriter init](&v21, sel_init);
  uint64_t v18 = v17;
  if (v17
    && (v17->_fileSize = a8,
        objc_storeStrong((id *)&v17->_path, a3),
        v18->_currentOutputFD = -1,
        !-[StreamingFileWriter _openCurrentOutputFDForPath:withOpenFlags:mode:performCachedWrites:quarantineInfo:error:]( v18,  "_openCurrentOutputFDForPath:withOpenFlags:mode:performCachedWrites:quarantineInfo:error:",  v16,  v13,  v12,  v10,  a6,  a9)))
  {
    int v19 = 0LL;
  }

  else
  {
    int v19 = v18;
  }

  return v19;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___StreamingFileWriter;
  -[StreamingFileWriter dealloc](&v3, sel_dealloc);
}

- (int64_t)readIntoBuffer:(void *)a3 length:(unint64_t)a4 error:(id *)a5
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  ssize_t v7 = read(-[StreamingFileWriter currentOutputFD](self, "currentOutputFD"), a3, a4);
  if (v7 == -1)
  {
    int v8 = *__error();
    v9 = -[StreamingFileWriter path](self, "path");
    SZGetLoggingHandle();
    BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      int v19 = v9;
      __int16 v20 = 1024;
      int v21 = v8;
      __int16 v22 = 2080;
      id v23 = strerror(v8);
      _os_log_error_impl(&dword_1870CA000, v10, OS_LOG_TYPE_ERROR, "Failed to read bytes from %@ : %d (%s)", buf, 0x1Cu);
    }

    v11 = (void *)*MEMORY[0x189607688];
    uint64_t v16 = *MEMORY[0x1896074F8];
    uint64_t v17 = v9;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    strerror(v8);
    _CreateError( (uint64_t)"-[StreamingFileWriter readIntoBuffer:length:error:]",  210LL,  v11,  v8,  0LL,  v12,  @"Failed to read bytes from %@ : %d (%s)",  v13,  (uint64_t)v9);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (a5) {
      *a5 = v14;
    }
  }

  return v7;
}

- (int64_t)currentOffsetWithError:(id *)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  off_t v5 = lseek(-[StreamingFileWriter currentOutputFD](self, "currentOutputFD"), 0LL, 1);
  if (v5 == -1)
  {
    uint64_t v6 = *__error();
    -[StreamingFileWriter path](self, "path");
    ssize_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    SZGetLoggingHandle();
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v17 = v7;
      __int16 v18 = 2080;
      int v19 = strerror(v6);
      _os_log_error_impl( &dword_1870CA000,  v8,  OS_LOG_TYPE_ERROR,  "Failed to seek to current offset in output file at path %@ : %s",  buf,  0x16u);
    }

    v9 = (void *)*MEMORY[0x189607688];
    uint64_t v14 = *MEMORY[0x1896074F8];
    id v15 = v7;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
    strerror(v6);
    _CreateError( (uint64_t)"-[StreamingFileWriter currentOffsetWithError:]",  225LL,  v9,  v6,  0LL,  v10,  @"Failed to seek to current offset in output file at path %@ : %s",  v11,  (uint64_t)v7);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3) {
      *a3 = v12;
    }
  }

  return v5;
}

- (BOOL)setCurrentOffset:(int64_t)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  off_t v7 = lseek(-[StreamingFileWriter currentOutputFD](self, "currentOutputFD"), a3, 0);
  if (v7 == -1)
  {
    uint64_t v8 = *__error();
    v9 = -[StreamingFileWriter path](self, "path");
    SZGetLoggingHandle();
    BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      int64_t v19 = a3;
      __int16 v20 = 2112;
      int v21 = v9;
      __int16 v22 = 2080;
      id v23 = strerror(v8);
      _os_log_error_impl( &dword_1870CA000,  v10,  OS_LOG_TYPE_ERROR,  "Failed to seek to offset %llu in output file at path %@ : %s",  buf,  0x20u);
    }

    uint64_t v11 = (void *)*MEMORY[0x189607688];
    uint64_t v16 = *MEMORY[0x1896074F8];
    uint64_t v17 = v9;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    strerror(v8);
    _CreateError( (uint64_t)"-[StreamingFileWriter setCurrentOffset:error:]",  239LL,  v11,  v8,  0LL,  v12,  @"Failed to seek to offset %llu in output file at path %@ : %s",  v13,  a3);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4) {
      *a4 = v14;
    }
  }

  return v7 != -1;
}

- (void)setIncompleteExtractionAttribute
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (fsetxattr( -[StreamingFileWriter currentOutputFD](self, "currentOutputFD"),  "com.apple.streamingzip.incomplete_extraction",  "y",  1uLL,  0,  0))
  {
    int v3 = *__error();
    SZGetLoggingHandle();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      -[StreamingFileWriter path](self, "path");
      off_t v5 = (void *)objc_claimAutoreleasedReturnValue();
      int v6 = 138412546;
      off_t v7 = v5;
      __int16 v8 = 2080;
      v9 = strerror(v3);
      _os_log_error_impl( &dword_1870CA000,  v4,  OS_LOG_TYPE_ERROR,  "Failed to set incomplete extraction xattr on %@ : %s",  (uint8_t *)&v6,  0x16u);
    }
  }

- (BOOL)writeBuffer:(const void *)a3 length:(unint64_t)a4 error:(id *)a5
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  int v9 = -[StreamingFileWriter currentOutputFD](self, "currentOutputFD");
  uint64_t v10 = 0LL;
  do
  {
    if (a4 == v10) {
      return 1;
    }
    ssize_t v11 = write(v9, (char *)a3 + v10, a4 - v10);
    v10 += v11;
  }

  while ((v11 & 0x8000000000000000LL) == 0);
  if (a4 == -1LL) {
    return 1;
  }
  uint64_t v12 = *__error();
  -[StreamingFileWriter path](self, "path");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  SZGetLoggingHandle();
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v23 = v13;
    __int16 v24 = 2080;
    v25 = strerror(v12);
    _os_log_error_impl( &dword_1870CA000,  v14,  OS_LOG_TYPE_ERROR,  "Failed to write data to output file at %@: %s",  buf,  0x16u);
  }

  id v15 = (void *)*MEMORY[0x189607688];
  uint64_t v20 = *MEMORY[0x1896074F8];
  int v21 = v13;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  strerror(v12);
  _CreateError( (uint64_t)"-[StreamingFileWriter writeBuffer:length:error:]",  263LL,  v15,  v12,  0LL,  v16,  @"Failed to write data to output file at %@: %s",  v17,  (uint64_t)v13);
  __int16 v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5) {
    *a5 = v18;
  }

  return 0;
}

- (void)configureFileAndSetOwnership:(BOOL)a3 toUID:(unsigned int)a4 GID:(unsigned int)a5
{
  BOOL v7 = a3;
  uint64_t v31 = *MEMORY[0x1895F89C0];
  -[StreamingFileWriter path](self, "path");
  int v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = -[StreamingFileWriter fileSize](self, "fileSize");
  int v11 = -[StreamingFileWriter currentOutputFD](self, "currentOutputFD");
  int v12 = v11;
  if (v10 > 0x4000)
  {
    *(void *)&buf[16] = v10;
    uint64_t v23 = 0LL;
    *(void *)buf = 0x300000002LL;
    *(void *)&buf[8] = 0LL;
    if (fcntl(v11, 42, buf) == -1)
    {
      int v13 = *__error();
      SZGetLoggingHandle();
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v21 = strerror(v13);
        *(_DWORD *)v25 = 134218498;
        uint64_t v26 = v10;
        __int16 v27 = 2112;
        int v28 = v9;
        __int16 v29 = 2080;
        v30 = v21;
        _os_log_error_impl( &dword_1870CA000,  v14,  OS_LOG_TYPE_ERROR,  "Advisory preallocation of %lld bytes for %@ failed: %s",  v25,  0x20u);
      }
    }
  }

  if (fchmod(v12, 0x180u))
  {
    int v15 = *__error();
    SZGetLoggingHandle();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int64_t v19 = strerror(v15);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v19;
      _os_log_error_impl(&dword_1870CA000, v16, OS_LOG_TYPE_ERROR, "Setting initial mode on %@ failed: %s", buf, 0x16u);
    }
  }

  if (v7 && fchown(v12, a4, a5))
  {
    int v17 = *__error();
    SZGetLoggingHandle();
    __int16 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = strerror(v17);
      *(_DWORD *)buf = 138413314;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = a4;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = a5;
      LOWORD(v23) = 1024;
      *(_DWORD *)((char *)&v23 + 2) = v17;
      HIWORD(v23) = 2080;
      __int16 v24 = v20;
      _os_log_error_impl( &dword_1870CA000,  v18,  OS_LOG_TYPE_ERROR,  "Failed to fchown %@ to (%d:%d) : %d (%s)",  buf,  0x28u);
    }
  }
}

- (BOOL)suspendWithError:(id *)a3
{
  return 1;
}

- (BOOL)finalizeFileWithAccessTime:(timeval)a3 modTime:(timeval)a4 mode:(unsigned __int16)a5 error:(id *)a6
{
  int v6 = a5;
  uint64_t v7 = *(void *)&a4.tv_usec;
  __darwin_time_t tv_sec = a4.tv_sec;
  uint64_t v9 = *(void *)&a3.tv_usec;
  __darwin_time_t v10 = a3.tv_sec;
  uint64_t v28 = *MEMORY[0x1895F89C0];
  int v12 = -[StreamingFileWriter currentOutputFD]( self,  "currentOutputFD",  a3.tv_sec,  *(void *)&a3.tv_usec,  a4.tv_sec,  *(void *)&a4.tv_usec,  a5,  a6);
  v25.__darwin_time_t tv_sec = v10;
  *(void *)&v25.tv_usec = v9;
  __darwin_time_t v26 = tv_sec;
  uint64_t v27 = v7;
  if (futimes(v12, &v25))
  {
    int v13 = *__error();
    SZGetLoggingHandle();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      -[StreamingFileWriter path](self, "path");
      __int16 v18 = (void *)objc_claimAutoreleasedReturnValue();
      int v21 = 138412546;
      __int16 v22 = v18;
      __int16 v23 = 2080;
      v24[0] = strerror(v13);
      _os_log_error_impl( &dword_1870CA000,  v14,  OS_LOG_TYPE_ERROR,  "Failed to set times on %@ : %s",  (uint8_t *)&v21,  0x16u);
    }
  }

  if (fchmod(v12, v6))
  {
    int v15 = *__error();
    SZGetLoggingHandle();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      -[StreamingFileWriter path](self, "path");
      int64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = strerror(v15);
      int v21 = 138412802;
      __int16 v22 = v19;
      __int16 v23 = 1024;
      LODWORD(v24[0]) = v6;
      WORD2(v24[0]) = 2080;
      *(void *)((char *)v24 + 6) = v20;
      _os_log_error_impl( &dword_1870CA000,  v16,  OS_LOG_TYPE_ERROR,  "Failed to set mode of %@ to 0%o: %s",  (uint8_t *)&v21,  0x1Cu);
    }
  }

  return 1;
}

- (void)closeCurrentOutputFD
{
  int v3 = -[StreamingFileWriter currentOutputFD](self, "currentOutputFD");
  if ((v3 & 0x80000000) == 0)
  {
    close(v3);
    -[StreamingFileWriter setCurrentOutputFD:](self, "setCurrentOutputFD:", 0xFFFFFFFFLL);
  }

- (id)description
{
  int v3 = (void *)NSString;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  off_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[StreamingFileWriter path](self, "path");
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@: path=%@>", v5, v6];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int)currentOutputFD
{
  return self->_currentOutputFD;
}

- (void)setCurrentOutputFD:(int)a3
{
  self->_currentOutputFD = a3;
}

- (int64_t)fileSize
{
  return self->_fileSize;
}

- (NSString)path
{
  return self->_path;
}

- (void).cxx_destruct
{
}

+ (id)fileWriterForPath:(id)a3 withOpenFlags:(int)a4 mode:(unsigned __int16)a5 quarantineInfo:(void *)a6 performCachedWrites:(BOOL)a7 expectedSize:(int64_t)a8 asyncTrackingGroup:(id)a9 errorDelegate:(id)a10 error:(id *)a11
{
  uint64_t v12 = a7;
  uint64_t v14 = a5;
  uint64_t v15 = *(void *)&a4;
  id v16 = a3;
  int v17 = (dispatch_group_s *)a9;
  id v18 = a10;
  char v24 = 0;
  if (fileWriterForPath_withOpenFlags_mode_quarantineInfo_performCachedWrites_expectedSize_asyncTrackingGroup_errorDelegate_error__onceToken != -1) {
    dispatch_once( &fileWriterForPath_withOpenFlags_mode_quarantineInfo_performCachedWrites_expectedSize_asyncTrackingGroup_errorDelegate_error__onceToken,  &__block_literal_global_782);
  }
  if (fileWriterForPath_withOpenFlags_mode_quarantineInfo_performCachedWrites_expectedSize_asyncTrackingGroup_errorDelegate_error__performAllWritesSynchronously) {
    goto LABEL_4;
  }
  unsigned int v23 = v12;
  +[StreamingFileWriterQueue sharedInstance](&OBJC_CLASS___StreamingFileWriterQueue, "sharedInstance");
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 reserveAsyncOperationForFileSize:a8 path:v16 group:v17 operationPendingForPath:&v24];
  int v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24) {
    dispatch_group_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
  }
  uint64_t v12 = v23;
  if (!v21)
  {
LABEL_4:
    id v19 = -[StreamingFileWriter _initForWritingToPath:withOpenFlags:mode:quarantineInfo:performCachedWrites:expectedSize:error:]( objc_alloc(&OBJC_CLASS___StreamingFileWriter),  "_initForWritingToPath:withOpenFlags:mode:quarantineInfo:performCachedWrites:expectedSize:error:",  v16,  v15,  v14,  a6,  v12,  a8,  a11);
  }

  else
  {
    id v19 = -[AsyncStreamingFileWriter _initForWritingToPath:withOpenFlags:mode:quarantineInfo:performCachedWrites:expectedSize:asyncTrackingGroup:errorDelegate:reservation:error:]( objc_alloc(&OBJC_CLASS___AsyncStreamingFileWriter),  "_initForWritingToPath:withOpenFlags:mode:quarantineInfo:performCachedWrites:expectedSize:asyncTrackingGroup: errorDelegate:reservation:error:",  v16,  v15,  v14,  a6,  v23,  a8,  v17,  v18,  v21,  a11);
  }

  return v19;
}

+ (id)synchronousFileWriterForPath:(id)a3 withOpenFlags:(int)a4 mode:(unsigned __int16)a5 quarantineInfo:(void *)a6 performCachedWrites:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  uint64_t v11 = a5;
  uint64_t v12 = *(void *)&a4;
  id v13 = a3;
  id v14 = -[StreamingFileWriter _initForWritingToPath:withOpenFlags:mode:quarantineInfo:performCachedWrites:expectedSize:error:]( objc_alloc(&OBJC_CLASS___StreamingFileWriter),  "_initForWritingToPath:withOpenFlags:mode:quarantineInfo:performCachedWrites:expectedSize:error:",  v13,  v12,  v11,  a6,  v9,  -1LL,  a8);

  return v14;
}

void __147__StreamingFileWriter_fileWriterForPath_withOpenFlags_mode_quarantineInfo_performCachedWrites_expectedSize_asyncTrackingGroup_errorDelegate_error___block_invoke()
{
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  fileWriterForPath_withOpenFlags_mode_quarantineInfo_performCachedWrites_expectedSize_asyncTrackingGroup_errorDelegate_error__performAllWritesSynchronously = [v0 BOOLForKey:@"PerformAllWritesSynchronously"];
}

@end